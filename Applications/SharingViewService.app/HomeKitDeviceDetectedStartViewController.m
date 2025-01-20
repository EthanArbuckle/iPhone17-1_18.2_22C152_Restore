@interface HomeKitDeviceDetectedStartViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (void)_launchHomeApp;
- (void)_restoreHomeApp;
- (void)applicationsDidInstall:(id)a3;
- (void)handleDismissButton:(id)a3;
- (void)handleSetupButton:(id)a3;
- (void)handleTapOutsideView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HomeKitDeviceDetectedStartViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_progressIndicator + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)(&self->_settingUp + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)_restoreHomeApp
{
  if (dword_1001CC250 <= 30 && (dword_1001CC250 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [*(id *)((char *)&self->_progressView + 1) setHidden:0];
  [*(id *)((char *)&self->_progressView + 1) startAnimating];
  [*(id *)(&self->_settingUp + 1) setHidden:0];
  [*(id *)((char *)&self->_dismissButton + 1) setHidden:1];
  v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 addObserver:self];
  id v4 = [objc_alloc(off_1001CC2C0()) initWithBundleID:@"com.apple.Home"];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000FDBA8;
  v5[3] = &unk_1001A1A08;
  v5[4] = self;
  [v4 startWithErrorHandler:v5];
}

- (void)_launchHomeApp
{
  v3 = [self->super._mainController userInfo];
  CFStringGetTypeID();
  id v4 = CFDictionaryGetTypedValue();

  if (v4)
  {
    v5 = +[NSURL URLWithString:v4];
  }
  else
  {
    v5 = 0;
  }
  if (dword_1001CC250 <= 30 && (dword_1001CC250 != -1 || _LogCategory_Initialize()))
  {
    v10 = v5;
    LogPrintF();
  }
  v6 = +[LSApplicationWorkspace defaultWorkspace];
  v7 = v6;
  if (v5)
  {
    id v13 = 0;
    unsigned __int8 v8 = [v6 openSensitiveURL:v5 withOptions:0 error:&v13];
    id v9 = v13;
    if (v8)
    {
LABEL_13:
      if (dword_1001CC250 <= 30 && (dword_1001CC250 != -1 || _LogCategory_Initialize()))
      {
        v11 = v5;
        LogPrintF();
      }
      [self->super._mainController dismiss:8 v11];
      goto LABEL_23;
    }
  }
  else
  {
    id v9 = 0;
  }
  if ([v7 openApplicationWithBundleID:@"com.apple.Home"]) {
    goto LABEL_13;
  }
  if (dword_1001CC250 <= 90 && (dword_1001CC250 != -1 || _LogCategory_Initialize()))
  {
    v11 = v5;
    id v12 = v9;
    LogPrintF();
  }
  BYTE1(self->_setupButton) = 0;
  [*(id *)((char *)&self->_dismissButton + 1) setEnabled:1 v11, v12];
LABEL_23:
}

- (void)applicationsDidInstall:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) bundleIdentifier];
        unsigned int v10 = [v9 isEqual:@"com.apple.Home"];

        if (v10)
        {
          if (dword_1001CC250 <= 30 && (dword_1001CC250 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000FE1F0;
          block[3] = &unk_1001A1BD8;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          goto LABEL_15;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (void)handleTapOutsideView:(id)a3
{
  id v4 = a3;
  if (dword_1001CC250 <= 30 && (dword_1001CC250 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:1];
}

- (void)handleSetupButton:(id)a3
{
  if (!BYTE1(self->_setupButton))
  {
    BYTE1(self->_setupButton) = 1;
    [*(id *)((char *)&self->_dismissButton + 1) setEnabled:0];
    id v4 = +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.Home"];
    id v5 = [v4 appState];
    unsigned int v6 = [v5 isInstalled];

    if (v6)
    {
      [(HomeKitDeviceDetectedStartViewController *)self _launchHomeApp];
    }
    else
    {
      [(HomeKitDeviceDetectedStartViewController *)self _restoreHomeApp];
    }
  }
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC250 <= 30 && (dword_1001CC250 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:5];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [a4 view];
  uint64_t v7 = [v5 view];

  return v6 == v7;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC250 <= 30 && (dword_1001CC250 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)HomeKitDeviceDetectedStartViewController;
  [(HomeKitDeviceDetectedStartViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC250 <= 30 && (dword_1001CC250 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v9.receiver = self;
  v9.super_class = (Class)HomeKitDeviceDetectedStartViewController;
  [(SVSBaseViewController *)&v9 viewWillAppear:v3];
  objc_super v5 = [self->super._mainController _remoteViewControllerProxy];
  [v5 setStatusBarHidden:1 withDuration:0.0];

  id v6 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTapOutsideView:"];
  [v6 setDelegate:self];
  [v6 setNumberOfTapsRequired:1];
  [v6 setCancelsTouchesInView:0];
  uint64_t v7 = [(HomeKitDeviceDetectedStartViewController *)self view];
  [v7 addGestureRecognizer:v6];

  unsigned __int8 v8 = [(SVSBaseViewController *)self containerView];
  [v8 setSwipeDismissible:1];
}

@end