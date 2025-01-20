@interface WHASetupProgressViewController
- (void)handleDismissButton:(id)a3;
- (void)handleProgressEvent:(unsigned int)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WHASetupProgressViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_progressSpinner + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)handleProgressEvent:(unsigned int)a3
{
  if ((int)a3 > 219)
  {
    if (a3 == 220)
    {
      v4 = @"SETTING_UP_ICLOUD";
    }
    else
    {
      if (a3 != 230) {
        return;
      }
      v4 = @"SETTING_UP_HOMEKIT";
    }
  }
  else if (a3 == 200)
  {
    v4 = @"SETTING_UP_WIFI";
  }
  else
  {
    if (a3 != 210) {
      return;
    }
    v4 = @"ACTIVATING";
  }
  sub_100138280(@"Localizable", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)((char *)&self->_progressSpinner + 1) setText:v5];
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)WHASetupProgressViewController;
  [(WHASetupProgressViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v9.receiver = self;
  v9.super_class = (Class)WHASetupProgressViewController;
  [(SVSBaseViewController *)&v9 viewWillAppear:v3];
  [*(id *)((char *)&self->_titleLabel + 1) setHidden:0];
  [*(id *)((char *)&self->_progressView + 1) startAnimating];
  [*(id *)((char *)&self->_progressSpinner + 1) setHidden:0];
  if ([self->super._mainController testMode])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100142D84;
    v6[3] = &unk_1001A1B88;
    dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    v8 = self;
    objc_super v5 = v7;
    dispatch_source_set_event_handler(v5, v6);
    SFDispatchTimerSet();
    dispatch_resume(v5);
  }
}

@end