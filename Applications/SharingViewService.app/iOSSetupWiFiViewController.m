@interface iOSSetupWiFiViewController
- (UIButton)continueButton;
- (UIImageView)imageView;
- (UILabel)infoLabel;
- (UILabel)titleLabel;
- (void)handleContinueButton:(id)a3;
- (void)handleDismissButton:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setImageView:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation iOSSetupWiFiViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);

  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)setContinueButton:(id)a3
{
}

- (UIButton)continueButton
{
  return *(UIButton **)((char *)&self->_infoLabel + 1);
}

- (void)setInfoLabel:(id)a3
{
}

- (UILabel)infoLabel
{
  return *(UILabel **)((char *)&self->_imageView + 1);
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return *(UIImageView **)((char *)&self->_titleLabel + 1);
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return *(UILabel **)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1);
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(iOSSetupBaseViewController *)self dismissWithType:5];
}

- (void)handleContinueButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([*(id *)((char *)&self->_infoLabel + 1) isEnabled])
  {
    [*(id *)((char *)&self->_infoLabel + 1) setEnabled:0];
    if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v5 = WiFiManagerClientCreate();
    if (v5)
    {
      v6 = (const void *)v5;
      WiFiManagerClientSetPower();
      CFRelease(v6);
    }
    if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v7 = objc_alloc_init((Class)CUReachabilityMonitor);
    [v7 setTimeout:60.0];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001068BC;
    v8[3] = &unk_1001A1A08;
    v8[4] = v7;
    [v7 setCompletionHandler:v8];
    [v7 activate];
    [self->super.super._mainController showStartUI];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)iOSSetupWiFiViewController;
  [(iOSSetupWiFiViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v10.receiver = self;
  v10.super_class = (Class)iOSSetupWiFiViewController;
  [(SVSBaseViewController *)&v10 viewWillAppear:v3];
  objc_super v5 = sub_100138280(@"Localizable", @"WIFI_TURN_ON_TITLE");
  [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setText:v5];

  v6 = +[UIImage imageNamed:@"WiFiAppIcon.png"];
  id v7 = +[UIScreen mainScreen];
  [v7 scale];
  v8 = [v6 _applicationIconImageForFormat:2 precomposed:1];
  [*(id *)((char *)&self->_titleLabel + 1) setImage:v8];

  v9 = sub_100138280(@"Localizable", @"WIFI_TURN_ON");
  [*(id *)((char *)&self->_imageView + 1) setText:v9];
}

@end