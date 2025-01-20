@interface ShareAudioAcceptAskViewController
- (SVSCardContainerView)containerView;
- (ShareAudioAcceptMainController)mainController;
- (UIButton)cancelButton;
- (UIButton)joinButton;
- (UILabel)infoLabel;
- (UILabel)titleLabel;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)handleCancelButton:(id)a3;
- (void)handleJoinButton:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setJoinButton:(id)a3;
- (void)setMainController:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateProductID:(unsigned int)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ShareAudioAcceptAskViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainController, 0);
  objc_storeStrong((id *)&self->_joinButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_containerView, 0);
}

- (void)setMainController:(id)a3
{
}

- (ShareAudioAcceptMainController)mainController
{
  return self->_mainController;
}

- (void)setJoinButton:(id)a3
{
}

- (UIButton)joinButton
{
  return self->_joinButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setInfoLabel:(id)a3
{
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setContainerView:(id)a3
{
}

- (SVSCardContainerView)containerView
{
  return self->_containerView;
}

- (void)updateProductID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->_viewDidAppear)
  {
    if (dword_1001CCAA8 <= 30 && (dword_1001CCAA8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v16 = v3;
      LogPrintF();
    }
    v5 = +[NSBundle bundleWithIdentifier:@"com.apple.Sharing", v16];
    id v17 = v5;
    if ((v3 - 8194) <= 0xD && ((1 << (v3 - 2)) & 0x3001) != 0
      || !v3
      || v3 == 0x10000
      || (id v6 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:v3],
          unsigned int v7 = [v6 isAirPods],
          v6,
          v5 = v17,
          v7))
    {
      v8 = sub_100138304(v5, @"Localizable-ShareAudio", @"SHARE_AUDIO_ACCEPT_INFO_FORMAT_AIRPODS");
    }
    else
    {
      v13 = +[NSString stringWithFormat:@"SHARE_AUDIO_ACCEPT_INFO_FORMAT_PID_%u", v3];
      v14 = +[NSString stringWithFormat:@"Localizable-PID_%d", v3];
      uint64_t v15 = sub_100138304(v17, v14, v13);
      if ((void *)v15 == v13)
      {

        v14 = @"Localizable-ShareAudio";
        v8 = sub_100138304(v17, @"Localizable-ShareAudio", v13);
      }
      else
      {
        v8 = (void *)v15;
      }
    }
    v9 = [(SVSBaseMainController *)self->_mainController userInfo];
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    CFStringRef v11 = @"?";
    if (v10) {
      CFStringRef v11 = v10;
    }
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v11);
    [(UILabel *)self->_infoLabel setText:v12];
  }
  else if (dword_1001CCAA8 <= 30 && (dword_1001CCAA8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)handleCancelButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CCAA8 <= 30 && (dword_1001CCAA8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(UIButton *)self->_joinButton setEnabled:0];
  [(UIButton *)self->_cancelButton setEnabled:0];
  [(ShareAudioAcceptMainController *)self->_mainController dismissWithAction:3];
}

- (void)handleJoinButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CCAA8 <= 30 && (dword_1001CCAA8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(UIButton *)self->_joinButton setEnabled:0];
  [(UIButton *)self->_cancelButton setEnabled:0];
  [(ShareAudioAcceptMainController *)self->_mainController dismissWithAction:2];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCAA8 <= 30 && (dword_1001CCAA8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)ShareAudioAcceptAskViewController;
  [(ShareAudioAcceptAskViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCAA8 <= 30 && (dword_1001CCAA8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v14.receiver = self;
  v14.super_class = (Class)ShareAudioAcceptAskViewController;
  [(ShareAudioAcceptAskViewController *)&v14 viewWillAppear:v3];
  objc_super v5 = [(ShareAudioAcceptMainController *)self->_mainController _remoteViewControllerProxy];
  [v5 setStatusBarHidden:1 withDuration:0.0];

  self->_viewDidAppear = 1;
  id v6 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle1 variant:1280];
  [(UILabel *)self->_titleLabel setFont:v6];

  unsigned int v7 = +[NSBundle bundleWithIdentifier:@"com.apple.Sharing"];
  v8 = [(SVSBaseMainController *)self->_mainController userInfo];
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFStringGetTypeID();
  v10 = CFDictionaryGetTypedValue();
  if (v10)
  {
    CFStringRef v11 = sub_100138304(v7, @"Localizable-ShareAudio", @"SHARE_AUDIO_ACCEPT_USER_FORMAT");
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v10);
  }
  else
  {
    CFStringRef v11 = sub_100138304(v7, @"Localizable-ShareAudio", @"SHARE_AUDIO_ACCEPT_DEVICE_FORMAT");
    CFStringRef v12 = @"?";
    if (v9) {
      CFStringRef v12 = v9;
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
  v13 = };
  [(UILabel *)self->_titleLabel setText:v13];

  [(ShareAudioAcceptAskViewController *)self updateProductID:[(ShareAudioAcceptMainController *)self->_mainController btProductID]];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[PopUpPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  [(PopUpPresentationController *)v8 setBlurBackground:1];

  return v8;
}

@end