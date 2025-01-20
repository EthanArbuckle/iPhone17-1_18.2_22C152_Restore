@interface RepairProgressViewController
- (void)handleDismissButton:(id)a3;
- (void)handleProgressEvent:(unsigned int)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RepairProgressViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_progressSpinner + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);

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
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)RepairProgressViewController;
  [(RepairProgressViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v6.receiver = self;
  v6.super_class = (Class)RepairProgressViewController;
  [(SVSBaseViewController *)&v6 viewWillAppear:v3];
  objc_super v5 = [self->super._mainController productImage];
  [*(id *)((char *)&self->_titleLabel + 1) setImage:v5];

  [*(id *)((char *)&self->_imageView + 1) setHidden:0];
  [*(id *)((char *)&self->_progressView + 1) startAnimating];
  [*(id *)((char *)&self->_progressSpinner + 1) setHidden:0];
}

@end