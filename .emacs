;95;0c;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(show-paren-mode 1)
(add-to-list 'load-path "/Users/vdayanan/Documents/")
(require 'julia-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("152c9642180cb0907bfe7c343ed07d0586c0d84fd8e7279d90566088989a13bb" "3e160974b9e3e1b53270d1fb5bbaf56f0c689017e177972f72584bf096efc4cc" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "28fa7536c8f563c6d6296989937a8e87a2dc6477fd7b366e0336a8997a521094" "2593436c53c59d650c8e3b5337a45f0e1542b1ba46ce8956861316e860b145a0" "6efd825514e246fceed89d41eb06084f9d0881d45355c51dcff01c639489c4a5" "27b97024320d223cbe0eb73104f2be8fcc55bd2c299723fc61d20057f313b51c" default)))
 '(package-selected-packages
   (quote
    (bm julia-mode helm dashboard inkpot-theme firecode-theme dracula-theme vue-mode dakrone-theme web-mode dockerfile-mode auto-complete ## auto-correct ahungry-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq-default indent-tabs-mode nil)

(add-hook 'before-save-hook 'whitespace-cleanup)
(setq x-select-enable-clipboard t)
(defun copy-from-osx ()
   (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
   (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
         (process-send-string proc text)
         (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; Add Lua-mode
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(require 'auto-complete)
(package-initialize)  ;load and activate packages, including auto-complete

(ac-config-default)
(global-auto-complete-mode t)

(add-to-list 'ac-modes 'julia-mode)

(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (auto-complete-mode 1))

(require 'dashboard)
(dashboard-setup-startup-hook)

(require 'bm)
(global-set-key (kbd "<C-q>") 'bm-toggle)
(global-set-key (kbd "<q>")   'bm-next)
(global-set-key (kbd "<S-q>") 'bm-previous)
