@interface SUSUIRemoteAuthenticationContainerViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (SUSUIRemoteAuthenticationContainerViewController)init;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismiss;
- (void)_fireActionWithResponseIfNecessary:(BOOL)a3;
- (void)_setRootViewController:(id)a3;
- (void)configureWithAction:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleLockButtonPressed;
- (void)loadView;
- (void)viewController:(id)a3 wantsStatusBarHidden:(BOOL)a4 withDuration:(double)a5;
- (void)viewControllerAuthenticatedWithResult:(BOOL)a3;
- (void)viewControllerWantsDismissal:(id)a3;
- (void)viewControllerWantsIdleTimerReset:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUSUIRemoteAuthenticationContainerViewController

- (SUSUIRemoteAuthenticationContainerViewController)init
{
  SEL v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteAuthenticationContainerViewController;
  v4 = [(SUSUIRemoteAuthenticationContainerViewController *)&v6 init];
  v8 = v4;
  objc_storeStrong((id *)&v8, v4);
  if (v4)
  {
    os_log_t oslog = (os_log_t)(id)SUSUILogAuthenticationUI();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000765C((uint64_t)v9, (uint64_t)v8);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Created SUSUIRemoteViewControllerContainerViewController: %@", v9, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v3 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v3;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)loadView
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = (id)SUSUILogAuthenticationUI();
  os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    os_log_type_t v13 = v16;
    sub_100005A54(v15);
    _os_log_impl((void *)&_mh_execute_header, log, v13, "Creating view for SUSUIRemoteViewControllerContainerViewController", v15, 2u);
  }
  objc_storeStrong(location, 0);
  id v6 = objc_alloc((Class)UIView);
  SEL v7 = +[UIScreen mainScreen];
  [(UIScreen *)v7 bounds];
  id v14 = [v6 initWithFrame:v2, v3, v4, v5];

  id v8 = v14;
  v9 = +[UIColor clearColor];
  [v8 setBackgroundColor:];

  [v14 setAutoresizingMask:18];
  [v14 setOpaque:0];
  id v10 = [v14 layer];
  [v10 setAllowsGroupBlending:0];

  id v11 = [v14 layer];
  [v11 setAllowsGroupOpacity:0];

  [(SUSUIRemoteAuthenticationContainerViewController *)v18 setView:v14];
  objc_storeStrong(&v14, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUSUIRemoteAuthenticationContainerViewController;
  [(SUSUIRemoteAuthenticationContainerViewController *)&v5 viewWillAppear:a3];
  os_log_t oslog = (os_log_t)(id)SUSUILogAuthenticationUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_10000A54C((uint64_t)v9, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewWillAppear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s:%@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUSUIRemoteAuthenticationContainerViewController;
  [(SUSUIRemoteAuthenticationContainerViewController *)&v5 viewDidAppear:a3];
  os_log_t oslog = (os_log_t)(id)SUSUILogAuthenticationUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_10000A54C((uint64_t)v9, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewDidAppear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s:%@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUSUIRemoteAuthenticationContainerViewController;
  [(SUSUIRemoteAuthenticationContainerViewController *)&v5 viewWillDisappear:a3];
  os_log_t oslog = (os_log_t)(id)SUSUILogAuthenticationUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_10000A54C((uint64_t)v9, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewWillDisappear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s:%@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  os_log_t oslog = (os_log_t)(id)SUSUILogAuthenticationUI();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_10000A54C((uint64_t)v10, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewDidDisappear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, type, "%s:%@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4.receiver = v9;
  v4.super_class = (Class)SUSUIRemoteAuthenticationContainerViewController;
  [(SUSUIRemoteAuthenticationContainerViewController *)&v4 viewDidDisappear:v7];
  [(SUSUIRemoteAuthenticationContainerViewController *)v9 _fireActionWithResponseIfNecessary:0];
}

- (void)configureWithAction:(id)a3
{
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v32->_action, location[0]);
  if ([(SUSUIAuthenticationAlertAction *)v32->_action alertType] == (id)1)
  {
    v20 = [SUSUISoftwareUpdateAuthenticationViewController alloc];
    id v21 = [(SUSUIAuthenticationAlertAction *)v32->_action rollbackDescriptor];
    CFStringRef v3 = [(SUSUISoftwareUpdateAuthenticationViewController *)v20 initWithRollbackDescriptor:v21 canDeferInstallation:(unint64_t)[(SUSUIAuthenticationAlertAction *)v32->_action canDeferInstallation] & 1];
    authVC = v32->_authVC;
    v32->_authVC = v3;
  }
  else
  {
    v17 = [SUSUISoftwareUpdateAuthenticationViewController alloc];
    id v19 = [(SUSUIAuthenticationAlertAction *)v32->_action descriptor];
    unsigned __int8 v16 = [(SUSUIAuthenticationAlertAction *)v32->_action forInstallTonight];
    id v18 = [(SUSUIAuthenticationAlertAction *)v32->_action autoInstallForecast];
    objc_super v5 = [(SUSUISoftwareUpdateAuthenticationViewController *)v17 initWithDescriptor:v19 forInstallTonight:v16 & 1 withInstallForecast:v18 canDeferInstallation:(unint64_t)[(SUSUIAuthenticationAlertAction *)v32->_action canDeferInstallation] & 1];
    BOOL v6 = v32->_authVC;
    v32->_authVC = v5;
  }
  [(SUSUISoftwareUpdateAuthenticationViewController *)v32->_authVC setDelegate:v32];
  [(SUSUIRemoteAuthenticationContainerViewController *)v32 viewController:v32->_authVC wantsStatusBarHidden:0 withDuration:0.0];
  BOOL v30 = SBSGetScreenLockStatus() != 0;
  if (v30
    && ([(SUSUIAuthenticationAlertAction *)v32->_action canDeferInstallation] & 1) == 0)
  {
    id v15 = [(SUSUIRemoteAuthenticationContainerViewController *)v32 _remoteViewControllerProxy];
    [v15 setDesiredHardwareButtonEvents:1];
  }
  id v14 = [(SUSUIRemoteAuthenticationContainerViewController *)v32 _remoteViewControllerProxy];
  [v14 setAllowsAlertItems:0];

  [(SUSUIRemoteAuthenticationContainerViewController *)v32 _setRootViewController:v32->_authVC];
  id v29 = (id)SUSUILogAuthenticationUI();
  os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
  {
    if ([(SUSUIAuthenticationAlertAction *)v32->_action forInstallTonight]) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    sub_10000765C((uint64_t)v35, (uint64_t)v7);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v29, v28, "configureWithContext: forInstallTonight: %@", v35, 0xCu);
  }
  objc_storeStrong(&v29, 0);
  id v27 = (id)SUSUILogAuthenticationUI();
  os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v27;
    os_log_type_t v12 = v26;
    id v13 = [(SUSUIAuthenticationAlertAction *)v32->_action autoInstallForecast];
    id v25 = v13;
    sub_10000765C((uint64_t)v34, (uint64_t)v25);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "configureWithContext: autoInstallForecast: %@", v34, 0xCu);

    objc_storeStrong(&v25, 0);
  }
  objc_storeStrong(&v27, 0);
  id v24 = (id)SUSUILogAuthenticationUI();
  os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
  {
    SEL v8 = v24;
    os_log_type_t v9 = v23;
    id v10 = [(SUSUIAuthenticationAlertAction *)v32->_action descriptor];
    id v22 = v10;
    sub_10000765C((uint64_t)v33, (uint64_t)v22);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "configureWithContext: descriptor: %@", v33, 0xCu);

    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  unsigned __int8 v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = (id)SUSUILogAuthenticationUI();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    os_log_type_t type = v12;
    objc_super v5 = v16;
    id v8 = [location[0] actions];
    id v11 = v8;
    sub_100006F34((uint64_t)v17, (uint64_t)v5, (uint64_t)v11);
    _os_log_impl((void *)&_mh_execute_header, log, type, "%@ - configure with context: %@", v17, 0x16u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  id v4 = [location[0] actions];
  id v10 = [v4 anyObject];

  [(SUSUIRemoteAuthenticationContainerViewController *)v16 configureWithAction:v10];
  if (v14) {
    (*((void (**)(void))v14 + 2))();
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)handleLockButtonPressed
{
  os_log_type_t v9 = self;
  v8[1] = (id)a2;
  dispatch_queue_t queue = &_dispatch_main_q;
  CFStringRef v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  BOOL v6 = sub_10000DDA4;
  CFStringRef v7 = &unk_100018530;
  v8[0] = v9;
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

- (void)viewController:(id)a3 wantsStatusBarHidden:(BOOL)a4 withDuration:(double)a5
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v11 = a4;
  uint64_t v10 = *(void *)&a5;
  os_log_t oslog = (os_log_t)(id)SUSUILogAuthenticationUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v11) {
      CFStringRef v5 = @"YES";
    }
    else {
      CFStringRef v5 = @"NO";
    }
    sub_10000DF78((uint64_t)v14, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewController:wantsStatusBarHidden:withDuration:]", (uint64_t)v5, v10);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: hidden=%@, duration=%f", v14, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v6 = [(SUSUIRemoteAuthenticationContainerViewController *)v13 _remoteViewControllerProxy];
  [v6 setStatusBarHidden:v11 withDuration:*(double *)&v10];

  objc_storeStrong(location, 0);
}

- (void)viewControllerAuthenticatedWithResult:(BOOL)a3
{
  CFStringRef v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  os_log_t oslog = (os_log_t)(id)SUSUILogAuthenticationUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_100006F34((uint64_t)v8, (uint64_t)v7, (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@ - Returning result to caller: %@", v8, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(SUSUIRemoteAuthenticationContainerViewController *)v7 _fireActionWithResponseIfNecessary:v5];
}

- (void)viewControllerWantsDismissal:(id)a3
{
  BOOL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)SUSUILogAuthenticationUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100009DA8((uint64_t)v6, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewControllerWantsDismissal:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s", v6, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(SUSUIRemoteAuthenticationContainerViewController *)v5 _fireActionWithResponseIfNecessary:0];
  [(SUSUIRemoteAuthenticationContainerViewController *)v5 _dismiss];
  objc_storeStrong(location, 0);
}

- (void)viewControllerWantsIdleTimerReset:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = (id)SUSUILogAuthenticationUI();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    sub_100009DA8((uint64_t)v18, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewControllerWantsIdleTimerReset:]");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, v14, "%s", v18, 0xCu);
  }
  objc_storeStrong(&v15, 0);
  if (v17->_authVC == location[0])
  {
    int v13 = ++dword_100020238;
    id v3 = [(SUSUIRemoteAuthenticationContainerViewController *)v17 _remoteViewControllerProxy];
    [v3 setIdleTimerDisabled:1 forReason:@"reset"];

    dispatch_time_t when = dispatch_time(0, 1000000000);
    dispatch_queue_t queue = &_dispatch_main_q;
    SEL v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    os_log_type_t v9 = sub_10000E46C;
    uint64_t v10 = &unk_100018A90;
    int v12 = v13;
    BOOL v11 = v17;
    dispatch_after(when, queue, &v6);

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(location, 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  id v3 = +[UIDevice currentDevice];
  BOOL v4 = (id)[(UIDevice *)v3 userInterfaceIdiom] != (id)1;

  if (v4) {
    return 2;
  }
  else {
    return 30;
  }
}

- (void)_fireActionWithResponseIfNecessary:(BOOL)a3
{
  if (self->_action)
  {
    [(SUSUIAuthenticationAlertAction *)self->_action fireCompletionIfNecessaryForResult:a3];
    objc_storeStrong((id *)&self->_action, 0);
  }
}

- (void)_setRootViewController:(id)a3
{
  int v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = [(SUSUIRemoteAuthenticationContainerViewController *)v13 view];
  [v7 bounds];
  *(void *)&long long v10 = v3;
  *((void *)&v10 + 1) = v4;
  *(void *)&long long v11 = v5;
  *((void *)&v11 + 1) = v6;

  id v9 = [location[0] view];
  [v9 setFrame:v10, v11];
  [v9 setAutoresizingMask:18];
  [location[0] willMoveToParentViewController:v13];
  id v8 = [(SUSUIRemoteAuthenticationContainerViewController *)v13 view];
  [v8 addSubview:v9];

  [(SUSUIRemoteAuthenticationContainerViewController *)v13 addChildViewController:location[0]];
  [location[0] didMoveToParentViewController:v13];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_dismiss
{
  uint64_t v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)SUSUIRemoteAuthenticationContainerViewController;
  id v2 = [(SUSUIRemoteAuthenticationContainerViewController *)&v3 _remoteViewControllerProxy];
  [v2 dismiss];
}

- (void).cxx_destruct
{
}

@end