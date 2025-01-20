@interface SVSWatchSetupInitialViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isPairing;
- (NSDictionary)userInfo;
- (SVSWatchSetupInitialViewController)initWithUserInfo:(id)a3;
- (WatchSetupViewControllerProxy)mainController;
- (void)_handleContinueButton;
- (void)_handleUpdateNow;
- (void)_launchWatchAppForPairing;
- (void)_restoreWatchApp;
- (void)applicationsDidInstall:(id)a3;
- (void)handleDeviceSetupNotification:(id)a3;
- (void)setMainController:(id)a3;
- (void)setPairing:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SVSWatchSetupInitialViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_destroyWeak((id *)&self->_mainController);
}

- (void)setPairing:(BOOL)a3
{
  self->_pairing = a3;
}

- (BOOL)isPairing
{
  return self->_pairing;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setMainController:(id)a3
{
}

- (WatchSetupViewControllerProxy)mainController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);

  return (WatchSetupViewControllerProxy *)WeakRetained;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
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
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) bundleIdentifier];
        unsigned int v10 = [v9 isEqual:@"com.apple.Bridge"];

        if (v10)
        {
          if (dword_1001CCF98 <= 30 && (dword_1001CCF98 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10013D67C;
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

- (void)_restoreWatchApp
{
  v3 = sub_100138280(@"Localizable", @"RESTORING");
  [(SVSWatchSetupInitialViewController *)self showActivityIndicatorWithStatus:v3];

  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 addObserver:self];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v5 = (void *)qword_1001D13F8;
  uint64_t v13 = qword_1001D13F8;
  if (!qword_1001D13F8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10013D814;
    v9[3] = &unk_1001A1A30;
    v9[4] = &v10;
    sub_10013D814((uint64_t)v9);
    id v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  id v7 = [[v6 alloc] initWithBundleID:@"com.apple.Bridge"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10013DA00;
  v8[3] = &unk_1001A1A08;
  v8[4] = self;
  [v7 startWithErrorHandler:v8];
}

- (void)_launchWatchAppForPairing
{
  id v2 = [(SVSWatchSetupInitialViewController *)self mainController];
  [v2 dismissAnimated:1 completion:&stru_1001A19E0];
}

- (void)_handleUpdateNow
{
  id v2 = +[NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK&ShowDefaultAudiencePane=YES"];
  v3 = +[LSApplicationWorkspace defaultWorkspace];
  id v4 = sub_100138B88();
  id v8 = 0;
  unsigned int v5 = [v3 openSensitiveURL:v2 withOptions:v4 error:&v8];
  id v6 = v8;

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7 && dword_1001CCF98 <= 90 && (dword_1001CCF98 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_handleContinueButton
{
  if (![(SVSWatchSetupInitialViewController *)self isPairing])
  {
    [(SVSWatchSetupInitialViewController *)self setPairing:1];
    v3 = +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.Bridge"];
    id v4 = [v3 appState];
    unsigned int v5 = [v4 isInstalled];

    if (v5)
    {
      [(SVSWatchSetupInitialViewController *)self _launchWatchAppForPairing];
    }
    else
    {
      [(SVSWatchSetupInitialViewController *)self _restoreWatchApp];
    }
  }
}

- (void)handleDeviceSetupNotification:(id)a3
{
  id v17 = a3;
  BOOL v4 = [(SVSWatchSetupInitialViewController *)self isPairing];
  id v5 = v17;
  if (!v4)
  {
    id v6 = [v17 name];
    BOOL v7 = [v17 userInfo];
    if (dword_1001CCF98 <= 30 && (dword_1001CCF98 != -1 || _LogCategory_Initialize()))
    {
      CFStringRef v8 = &stru_1001A1DC0;
      if (v7) {
        CFStringRef v8 = v7;
      }
      long long v15 = v6;
      CFStringRef v16 = v8;
      LogPrintF();
    }
    v9 = [v17 name:v15, v16];
    unsigned int v10 = [v9 isEqual:@"com.apple.sharing.DeviceSetup"];

    if (v10 && !CFDictionaryGetInt64())
    {
      v11 = [(SVSWatchSetupInitialViewController *)self userInfo];
      CFStringGetTypeID();
      uint64_t v12 = CFDictionaryGetTypedValue();

      CFStringGetTypeID();
      uint64_t v13 = CFDictionaryGetTypedValue();
      if ([v13 isEqual:v12])
      {
        if (dword_1001CCF98 <= 30 && (dword_1001CCF98 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        long long v14 = [(SVSWatchSetupInitialViewController *)self mainController];
        [v14 dismiss:0];
      }
    }

    id v5 = v17;
  }

  _objc_release_x1(v4, v5);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SVSWatchSetupInitialViewController;
  [(SVSWatchSetupInitialViewController *)&v5 viewDidDisappear:a3];
  if (dword_1001CCF98 <= 30 && (dword_1001CCF98 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"com.apple.sharing.DeviceSetup" object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SVSWatchSetupInitialViewController;
  [(SVSWatchSetupInitialViewController *)&v7 viewWillAppear:a3];
  if (dword_1001CCF98 <= 30 && (dword_1001CCF98 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v4 = [(SVSWatchSetupInitialViewController *)self mainController];
  objc_super v5 = [v4 _remoteViewControllerProxy];
  [v5 setStatusBarHidden:1 withDuration:0.0];

  id v6 = +[NSDistributedNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"handleDeviceSetupNotification:" name:@"com.apple.sharing.DeviceSetup" object:0 suspensionBehavior:4];
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)SVSWatchSetupInitialViewController;
  [(SVSWatchSetupInitialViewController *)&v38 viewDidLoad];
  [(SVSWatchSetupInitialViewController *)self setDismissalType:3];
  v3 = sub_100138280(@"Localizable", @"APPLE_WATCH_SETUP_TITLE");
  [(SVSWatchSetupInitialViewController *)self setTitle:v3];

  BOOL v4 = sub_100138280(@"Localizable", @"APPLE_WATCH_SETUP_SUBTITLE");
  [(SVSWatchSetupInitialViewController *)self setSubtitle:v4];

  id location = 0;
  objc_initWeak(&location, self);
  objc_super v5 = sub_100138280(@"Localizable", @"CONTINUE");
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10013E920;
  v35[3] = &unk_1001A19A0;
  objc_copyWeak(&v36, &location);
  v33 = +[PRXAction actionWithTitle:v5 style:0 handler:v35];

  id v6 = [(SVSWatchSetupInitialViewController *)self addAction:v33];
  id v7 = [objc_alloc((Class)BPSRemoteWatchView) initWithSize:CGSizeZero.width, CGSizeZero.height];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  CFStringGetTypeID();
  v34 = CFDictionaryGetTypedValue();
  if (dword_1001CCF98 <= 30 && (dword_1001CCF98 != -1 || _LogCategory_Initialize()))
  {
    v18 = v34;
    LogPrintF();
  }
  if (v34) {
    [v7 setAdvertisingName:v34];
  }
  CFStringRef v8 = [(SVSWatchSetupInitialViewController *)self contentView];
  [v8 addSubview:v7];

  v30 = [v7 topAnchor];
  v32 = [(SVSWatchSetupInitialViewController *)self contentView];
  v31 = [v32 mainContentGuide];
  v29 = [v31 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v39[0] = v28;
  v25 = [v7 bottomAnchor];
  v27 = [(SVSWatchSetupInitialViewController *)self contentView];
  v26 = [v27 mainContentGuide];
  v24 = [v26 bottomAnchor];
  v23 = [v25 constraintLessThanOrEqualToAnchor:v24];
  v39[1] = v23;
  v20 = [v7 leadingAnchor];
  v22 = [(SVSWatchSetupInitialViewController *)self contentView];
  v21 = [v22 mainContentGuide];
  v19 = [v21 leadingAnchor];
  v9 = [v20 constraintEqualToAnchor:v19];
  v39[2] = v9;
  unsigned int v10 = [v7 trailingAnchor];
  v11 = [(SVSWatchSetupInitialViewController *)self contentView];
  uint64_t v12 = [v11 mainContentGuide];
  uint64_t v13 = [v12 trailingAnchor];
  long long v14 = [v10 constraintEqualToAnchor:v13];
  v39[3] = v14;
  long long v15 = [v7 heightAnchor];
  CFStringRef v16 = [v15 constraintEqualToConstant:175.0];
  v39[4] = v16;
  id v17 = +[NSArray arrayWithObjects:v39 count:5];
  +[NSLayoutConstraint activateConstraints:v17];

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

- (SVSWatchSetupInitialViewController)initWithUserInfo:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SVSWatchSetupInitialViewController;
  id v3 = a3;
  BOOL v4 = [(SVSWatchSetupInitialViewController *)&v8 initWithContentView:0];
  objc_super v5 = (NSDictionary *)[v3 copy];

  userInfo = v4->_userInfo;
  v4->_userInfo = v5;

  return v4;
}

@end