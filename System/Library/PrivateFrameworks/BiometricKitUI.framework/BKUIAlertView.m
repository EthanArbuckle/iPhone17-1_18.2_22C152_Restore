@interface BKUIAlertView
- (BKUIAlertView)init;
- (BOOL)isAlertHidden;
- (SEL)cancelButtonSelector;
- (SEL)otherButtonSelector;
- (UILabel)alertHudText;
- (UIView)alertHudView;
- (double)alertHudMinDisplayTime;
- (double)alertHudTimeout;
- (id)parent;
- (void)_hideAlertHudView;
- (void)_init;
- (void)_setFadeAnimation:(id)a3;
- (void)hideAnimated:(BOOL)a3;
- (void)isAlertHidden;
- (void)setAlertHudMinDisplayTime:(double)a3;
- (void)setAlertHudText:(id)a3;
- (void)setAlertHudTimeout:(double)a3;
- (void)setAlertHudView:(id)a3;
- (void)setCancelButtonSelector:(SEL)a3;
- (void)setOtherButtonSelector:(SEL)a3;
- (void)setParent:(id)a3;
- (void)show:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 viewController:(id)a6;
- (void)show:(id)a3 title:(id)a4 message:(id)a5 cancelButtonTitle:(id)a6 cancelButtonSelector:(SEL)a7 otherButtonTitle:(id)a8 otherButtonSelector:(SEL)a9 viewController:(id)a10;
- (void)show:(id)a3 title:(id)a4 message:(id)a5 cancelButtonTitle:(id)a6 cancelButtonSelector:(SEL)a7 viewController:(id)a8;
- (void)showAlert:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 viewController:(id)a7;
@end

@implementation BKUIAlertView

- (BKUIAlertView)init
{
  v7.receiver = self;
  v7.super_class = (Class)BKUIAlertView;
  v2 = [(BKUIAlertView *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(BKUIAlertView *)v2 _init];
    os_log_t v4 = os_log_create("com.apple.biometrickitui", "AlertView");
    bkui_alert_view_log = v3->bkui_alert_view_log;
    v3->bkui_alert_view_log = (OS_os_log *)v4;
  }
  return v3;
}

- (void)_init
{
  self->_alertController = 0;
  MEMORY[0x1F41817F8]();
}

- (void)show:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 viewController:(id)a6
{
}

- (void)show:(id)a3 title:(id)a4 message:(id)a5 cancelButtonTitle:(id)a6 cancelButtonSelector:(SEL)a7 viewController:(id)a8
{
}

- (void)show:(id)a3 title:(id)a4 message:(id)a5 cancelButtonTitle:(id)a6 cancelButtonSelector:(SEL)a7 otherButtonTitle:(id)a8 otherButtonSelector:(SEL)a9 viewController:(id)a10
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v36 = a6;
  id v35 = a8;
  id v19 = a10;
  bkui_alert_view_log = self->bkui_alert_view_log;
  if (os_log_type_enabled(bkui_alert_view_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v44 = v17;
    __int16 v45 = 2112;
    id v46 = v18;
    _os_log_impl(&dword_1E4B6C000, bkui_alert_view_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Show alert with title: \"%@\", message: \"%@\"", buf, 0x16u);
  }
  objc_storeWeak(&self->_parent, v16);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHudView);
  v22 = [WeakRetained superview];
  id v23 = objc_loadWeakRetained((id *)&self->_alertHudView);
  [v22 bringSubviewToFront:v23];

  id v24 = objc_loadWeakRetained((id *)&self->_alertHudView);
  if (v24)
  {
    if (CACurrentMediaTime() - self->_alertHudTextStartTime > self->_alertHudMinDisplayTime)
    {
      id v25 = objc_loadWeakRetained((id *)&self->_alertHudView);
      char v26 = objc_msgSend(v25, "isHidden", v35);

      if ((v26 & 1) == 0) {
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__hideAlertHudView object:0];
      }
      id v27 = objc_loadWeakRetained((id *)&self->_alertHudText);
      [v27 setText:v18];

      self->_alertHudTextStartTime = CACurrentMediaTime();
      id v28 = objc_loadWeakRetained((id *)&self->_alertHudView);
      [(BKUIAlertView *)self _setFadeAnimation:v28];

      id v29 = objc_loadWeakRetained((id *)&self->_alertHudView);
      [v29 setHidden:0];

      [(BKUIAlertView *)self performSelector:sel__hideAlertHudView withObject:0 afterDelay:self->_alertHudTimeout];
    }
  }
  else
  {
    if (a7) {
      v30 = a7;
    }
    else {
      v30 = 0;
    }
    self->_cancelButtonSelector = v30;
    if (a9) {
      v31 = a9;
    }
    else {
      v31 = 0;
    }
    self->_otherButtonSelector = v31;
    v32 = [(UIAlertController *)self->_alertController view];
    v33 = [v32 window];

    if (v33)
    {
      alertController = self->_alertController;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __127__BKUIAlertView_show_title_message_cancelButtonTitle_cancelButtonSelector_otherButtonTitle_otherButtonSelector_viewController___block_invoke;
      v37[3] = &unk_1E6EA21D0;
      v37[4] = self;
      id v38 = v17;
      id v39 = v18;
      id v40 = v36;
      id v41 = v35;
      id v42 = v19;
      [(UIAlertController *)alertController dismissViewControllerAnimated:0 completion:v37];
    }
    else
    {
      [(BKUIAlertView *)self showAlert:v17 message:v18 cancelButtonTitle:v36 otherButtonTitle:v35 viewController:v19];
    }
  }
}

uint64_t __127__BKUIAlertView_show_title_message_cancelButtonTitle_cancelButtonSelector_otherButtonTitle_otherButtonSelector_viewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showAlert:*(void *)(a1 + 40) message:*(void *)(a1 + 48) cancelButtonTitle:*(void *)(a1 + 56) otherButtonTitle:*(void *)(a1 + 64) viewController:*(void *)(a1 + 72)];
}

- (void)showAlert:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 viewController:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  bkui_alert_view_log = self->bkui_alert_view_log;
  if (os_log_type_enabled(bkui_alert_view_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v13;
    _os_log_impl(&dword_1E4B6C000, bkui_alert_view_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Show alert with title: \"%@\", message: \"%@\"", buf, 0x16u);
  }
  id v25 = v12;
  id v18 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v12 message:v13 preferredStyle:1];
  alertController = self->_alertController;
  self->_alertController = v18;

  v20 = self->_alertController;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__BKUIAlertView_showAlert_message_cancelButtonTitle_otherButtonTitle_viewController___block_invoke;
  v27[3] = &unk_1E6EA21F8;
  v27[4] = self;
  v21 = v14;
  v22 = [MEMORY[0x1E4F42720] actionWithTitle:v14 style:1 handler:v27];
  [(UIAlertController *)v20 addAction:v22];

  if (v15)
  {
    id v23 = self->_alertController;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __85__BKUIAlertView_showAlert_message_cancelButtonTitle_otherButtonTitle_viewController___block_invoke_2;
    v26[3] = &unk_1E6EA21F8;
    v26[4] = self;
    id v24 = [MEMORY[0x1E4F42720] actionWithTitle:v15 style:0 handler:v26];
    [(UIAlertController *)v23 addAction:v24];
  }
  [v16 presentViewController:self->_alertController animated:1 completion:0];
}

void __85__BKUIAlertView_showAlert_message_cancelButtonTitle_otherButtonTitle_viewController___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 408);
  id v4 = a2;
  [v3 dismissViewControllerAnimated:1 completion:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 432));
  if (*(void *)(*(void *)(a1 + 32) + 440)) {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 440);
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = WeakRetained;
  [WeakRetained performSelector:v6];
}

void __85__BKUIAlertView_showAlert_message_cancelButtonTitle_otherButtonTitle_viewController___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 408);
  id v4 = a2;
  [v3 dismissViewControllerAnimated:1 completion:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 432));
  if (*(void *)(*(void *)(a1 + 32) + 448)) {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 448);
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = WeakRetained;
  [WeakRetained performSelector:v6];
}

- (BOOL)isAlertHidden
{
  p_alertHudView = &self->_alertHudView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHudView);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_alertHudView);
    char v6 = [v5 isHidden];

    bkui_alert_view_log = self->bkui_alert_view_log;
    if (os_log_type_enabled(bkui_alert_view_log, OS_LOG_TYPE_DEBUG)) {
LABEL_8:
    }
      [(BKUIAlertView *)v6 isAlertHidden];
  }
  else
  {
    alertController = self->_alertController;
    if (alertController)
    {
      v9 = [(UIAlertController *)alertController view];
      v10 = [v9 window];
      char v6 = v10 == 0;
    }
    else
    {
      char v6 = 1;
    }
    bkui_alert_view_log = self->bkui_alert_view_log;
    if (os_log_type_enabled(bkui_alert_view_log, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
  }
  return v6;
}

- (void)hideAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_alertHudView = &self->_alertHudView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHudView);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_alertHudView);
    char v8 = [v7 isHidden];

    if ((v8 & 1) == 0)
    {
      bkui_alert_view_log = self->bkui_alert_view_log;
      if (os_log_type_enabled(bkui_alert_view_log, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 67109120;
        BOOL v14 = v3;
        _os_log_impl(&dword_1E4B6C000, bkui_alert_view_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Hiding alert animated: %i", (uint8_t *)&v13, 8u);
      }
      if (CACurrentMediaTime() - self->_alertHudTextStartTime > self->_alertHudMinDisplayTime)
      {
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__hideAlertHudView object:0];
        [(BKUIAlertView *)self _hideAlertHudView];
      }
    }
  }
  else
  {
    v10 = [(UIAlertController *)self->_alertController view];
    v11 = [v10 window];

    if (v11)
    {
      id v12 = self->bkui_alert_view_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 67109120;
        BOOL v14 = v3;
        _os_log_impl(&dword_1E4B6C000, v12, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Hiding alert animated: %i", (uint8_t *)&v13, 8u);
      }
      [(UIAlertController *)self->_alertController dismissViewControllerAnimated:v3 completion:0];
    }
  }
}

- (void)_hideAlertHudView
{
  p_alertHudView = &self->_alertHudView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHudView);
  [(BKUIAlertView *)self _setFadeAnimation:WeakRetained];

  id v5 = objc_loadWeakRetained((id *)p_alertHudView);
  [v5 setHidden:1];
}

- (void)_setFadeAnimation:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F39D18];
  id v4 = a3;
  id v8 = [v3 animation];
  id v5 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
  [v8 setTimingFunction:v5];

  [v8 setDuration:0.2];
  [v8 setType:@"fade"];
  char v6 = [v4 layer];
  [v6 removeAllAnimations];

  id v7 = [v4 layer];

  [v7 addAnimation:v8 forKey:*MEMORY[0x1E4F3A5B0]];
}

- (id)parent
{
  id WeakRetained = objc_loadWeakRetained(&self->_parent);

  return WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (SEL)cancelButtonSelector
{
  if (self->_cancelButtonSelector) {
    return self->_cancelButtonSelector;
  }
  else {
    return 0;
  }
}

- (void)setCancelButtonSelector:(SEL)a3
{
  if (a3) {
    BOOL v3 = a3;
  }
  else {
    BOOL v3 = 0;
  }
  self->_cancelButtonSelector = v3;
}

- (SEL)otherButtonSelector
{
  if (self->_otherButtonSelector) {
    return self->_otherButtonSelector;
  }
  else {
    return 0;
  }
}

- (void)setOtherButtonSelector:(SEL)a3
{
  if (a3) {
    BOOL v3 = a3;
  }
  else {
    BOOL v3 = 0;
  }
  self->_otherButtonSelector = v3;
}

- (UIView)alertHudView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHudView);

  return (UIView *)WeakRetained;
}

- (void)setAlertHudView:(id)a3
{
}

- (UILabel)alertHudText
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHudText);

  return (UILabel *)WeakRetained;
}

- (void)setAlertHudText:(id)a3
{
}

- (double)alertHudTimeout
{
  return self->_alertHudTimeout;
}

- (void)setAlertHudTimeout:(double)a3
{
  self->_alertHudTimeout = a3;
}

- (double)alertHudMinDisplayTime
{
  return self->_alertHudMinDisplayTime;
}

- (void)setAlertHudMinDisplayTime:(double)a3
{
  self->_alertHudMinDisplayTime = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertHudText);
  objc_destroyWeak((id *)&self->_alertHudView);
  objc_destroyWeak(&self->_parent);
  objc_storeStrong((id *)&self->bkui_alert_view_log, 0);

  objc_storeStrong((id *)&self->_alertController, 0);
}

- (void)isAlertHidden
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_DEBUG, "BiometricKitUI: Is alert hidden: %i", (uint8_t *)v2, 8u);
}

@end