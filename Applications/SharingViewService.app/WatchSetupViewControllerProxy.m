@interface WatchSetupViewControllerProxy
- (BOOL)_canShowWhileLocked;
- (UINavigationController)proxCardNavigationController;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)proxCardFlowDidDismiss;
- (void)setProxCardNavigationController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WatchSetupViewControllerProxy

- (void).cxx_destruct
{
}

- (void)setProxCardNavigationController:(id)a3
{
}

- (UINavigationController)proxCardNavigationController
{
  return self->_proxCardNavigationController;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)proxCardFlowDidDismiss
{
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v9 + 1) + 8 * i) events] & 0x10) != 0)
        {
          if (dword_1001CCF98 <= 30 && (dword_1001CCF98 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(WatchSetupViewControllerProxy *)self dismiss:4];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    uint64_t v7 = [(WatchSetupViewControllerProxy *)self _remoteViewControllerProxy];
    v8 = [(WatchSetupViewControllerProxy *)self proxCardNavigationController];

    if (v8)
    {
      long long v9 = [(WatchSetupViewControllerProxy *)self proxCardNavigationController];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10013C820;
      v10[3] = &unk_1001A1AE8;
      id v12 = v6;
      id v11 = v7;
      [v9 dismissViewControllerAnimated:v4 completion:v10];
    }
    else
    {
      [v7 dismiss];
    }
  }
}

- (void)dismiss:(int)a3
{
  [(WatchSetupViewControllerProxy *)self dismissAnimated:a3 != 19 completion:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCF98 <= 30 && (dword_1001CCF98 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_dismissed)
  {
    if (dword_1001CCF98 <= 30 && (dword_1001CCF98 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(WatchSetupViewControllerProxy *)self dismiss:21];
  }
  v5.receiver = self;
  v5.super_class = (Class)WatchSetupViewControllerProxy;
  [(SVSBaseMainController *)&v5 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_super v5 = [(NSDictionary *)self->super._userInfo objectForKeyedSubscript:@"watchData"];
    id v6 = [(NSDictionary *)self->super._userInfo objectForKeyedSubscript:@"deviceIdentifier"];
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2050000000;
    uint64_t v7 = (void *)qword_1001D13D8;
    uint64_t v38 = qword_1001D13D8;
    if (!qword_1001D13D8)
    {
      id location = _NSConcreteStackBlock;
      uint64_t v31 = 3221225472;
      v32 = sub_10013CFA8;
      v33 = &unk_1001A1A30;
      v34 = &v35;
      sub_10013CFA8((uint64_t)&location);
      uint64_t v7 = (void *)v36[3];
    }
    v8 = v7;
    _Block_object_dispose(&v35, 8);
    id v9 = [v8 alloc];
    v39[0] = @"wd";
    v39[1] = @"di";
    v40[0] = v5;
    v40[1] = v6;
    long long v10 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10013D194;
    v29[3] = &unk_1001A1978;
    v29[4] = self;
    id v11 = [v9 initWithUserInfo:v10 withDismissCompletionHandler:v29];

    [v11 setMainController:self];
    id v12 = [(WatchSetupViewControllerProxy *)self presentProxCardFlowWithDelegate:self initialViewController:v11];
    [(WatchSetupViewControllerProxy *)self setProxCardNavigationController:v12];
  }
  else
  {
    if (dword_1001CCF98 <= 30 && (dword_1001CCF98 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v28.receiver = self;
    v28.super_class = (Class)WatchSetupViewControllerProxy;
    [(WatchSetupViewControllerProxy *)&v28 viewDidAppear:v3];
    char v13 = _os_feature_enabled_impl();
    objc_super v5 = [(NSDictionary *)self->super._userInfo objectForKeyedSubscript:@"pairingVersion"];
    if (!v5) {
      goto LABEL_16;
    }
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2050000000;
    v14 = (void *)qword_1001D13E8;
    uint64_t v38 = qword_1001D13E8;
    if (!qword_1001D13E8)
    {
      id location = _NSConcreteStackBlock;
      uint64_t v31 = 3221225472;
      v32 = sub_10013D1A4;
      v33 = &unk_1001A1A30;
      v34 = &v35;
      sub_10013D1A4((uint64_t)&location);
      v14 = (void *)v36[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v35, 8);
    v16 = [v15 systemVersions];
    id v17 = [v16 maxPairingCompatibilityVersion];

    char v18 = (uint64_t)[v5 integerValue] <= (uint64_t)v17 ? v13 : 0;
    if ((v18 & 1) == 0)
    {
      if (dword_1001CCF98 <= 30 && (dword_1001CCF98 != -1 || _LogCategory_Initialize()))
      {
        [v5 integerValue];
        LogPrintF();
      }
      id v6 = (SVSWatchSetupInitialViewController *)objc_alloc_init((Class)PRXSoftwareUpdateViewController);
      v20 = sub_100138280(@"Localizable", @"SOFTWARE_UPDATE_REQUIRED");
      [(SVSWatchSetupInitialViewController *)v6 setTitle:v20];

      v21 = sub_100138280(@"Localizable", @"APPLE_WATCH_SOFTWARE_UPDATE");
      [(SVSWatchSetupInitialViewController *)v6 setSubtitle:v21];

      id location = 0;
      objc_initWeak(&location, v6);
      v22 = sub_100138280(@"Localizable", @"SET_UP_LATER");
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10013D390;
      v26[3] = &unk_1001A19A0;
      objc_copyWeak(&v27, &location);
      v23 = +[PRXAction actionWithTitle:v22 style:1 handler:v26];

      id v24 = [(SVSWatchSetupInitialViewController *)v6 addAction:v23];
      v25 = [(WatchSetupViewControllerProxy *)self presentProxCardFlowWithDelegate:self initialViewController:v6];
      [(WatchSetupViewControllerProxy *)self setProxCardNavigationController:v25];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    else
    {
LABEL_16:
      id v6 = [[SVSWatchSetupInitialViewController alloc] initWithUserInfo:self->super._userInfo];
      [(SVSWatchSetupInitialViewController *)v6 setMainController:self];
      v19 = [(WatchSetupViewControllerProxy *)self presentProxCardFlowWithDelegate:self initialViewController:v6];
      [(WatchSetupViewControllerProxy *)self setProxCardNavigationController:v19];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  if (_os_feature_enabled_impl())
  {
    id v4 = [(WatchSetupViewControllerProxy *)self _remoteViewControllerProxy];
    [v4 setStatusBarHidden:1 withDuration:0.0];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(WatchSetupViewControllerProxy *)self view];
  BOOL v3 = [v2 window];

  if (!v3) {
    return 30;
  }
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)1) {
    return (1 << (char)[UIApp activeInterfaceOrientation]);
  }
  else {
    return 2;
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v9 = a4;
  id v6 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001CCF98 <= 30 && (dword_1001CCF98 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }
}

@end