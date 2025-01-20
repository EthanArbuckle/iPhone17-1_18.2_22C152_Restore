@interface WFRemoteAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (NSXPCConnection)xpcConnection;
- (WFCompactHostingViewController)compactViewController;
- (WFRemoteAlertViewController)init;
- (int)_preferredStatusBarVisibility;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismissPersistentChromeWithSuccess:(BOOL)a3 customAttribution:(id)a4 completionHandler:(id)a5;
- (void)dismissPresentedContentWithCompletionHandler:(id)a3;
- (void)handleButtonActions:(id)a3;
- (void)hostingViewControllerDidRequestExit:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)preparePersistentChromeWithContext:(id)a3 attribution:(id)a4;
- (void)setCompactViewController:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)showDialogRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation WFRemoteAlertViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactViewController, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)setCompactViewController:(id)a3
{
}

- (WFCompactHostingViewController)compactViewController
{
  return self->_compactViewController;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)hostingViewControllerDidRequestExit:(id)a3
{
  v3 = [(WFRemoteAlertViewController *)self xpcConnection];
  v4 = [v3 remoteObjectProxy];

  v5 = getWFDialogLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    v7 = "-[WFRemoteAlertViewController hostingViewControllerDidRequestExit:]";
    __int16 v8 = 2114;
    uint64_t v9 = WFViewServiceDismissalReasonBadState;
    __int16 v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Requesting dismissal with reason: %{public}@. host interface: %@", (uint8_t *)&v6, 0x20u);
  }

  [v4 requestDismissalWithReason:WFViewServiceDismissalReasonBadState];
}

- (void)dismissPersistentChromeWithSuccess:(BOOL)a3 customAttribution:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = sub_1000067C0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[WFRemoteAlertViewController dismissPersistentChromeWithSuccess:customAttribution:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Dismissing chrome", buf, 0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006814;
  v13[3] = &unk_100010538;
  BOOL v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_1000067C0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v10 = "-[WFRemoteAlertViewController dismissPresentedContentWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Dismissing presented content", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000069DC;
  v7[3] = &unk_100010510;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)showDialogRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000067C0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[WFRemoteAlertViewController showDialogRequest:completionHandler:]";
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Showing dialog request: %{public}@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006B88;
  block[3] = &unk_1000104E8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)preparePersistentChromeWithContext:(id)a3 attribution:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000067C0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v15 = "-[WFRemoteAlertViewController preparePersistentChromeWithContext:attribution:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Received running context: %@, attribution: %@", buf, 0x20u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006D3C;
  block[3] = &unk_1000104C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (int)_preferredStatusBarVisibility
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return -1;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  v5 = sub_1000067C0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[WFRemoteAlertViewController handleButtonActions:]";
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Received button actions: %{public}@", buf, 0x16u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006F5C;
  v13[3] = &unk_1000105B0;
  v13[4] = self;
  id v6 = objc_retainBlock(v13);
  id v7 = [(WFRemoteAlertViewController *)self compactViewController];
  id v8 = [v7 actionInterfaceListener];
  id v9 = [v8 actionInterface];

  if (v9)
  {
    id v10 = [(WFRemoteAlertViewController *)self compactViewController];
    id v11 = [v10 actionInterfaceListener];
    id v12 = [v11 actionInterface];
    [v12 cancelPresentationWithCompletionHandler:v6];
  }
  else
  {
    ((void (*)(void *))v6[2])(v6);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(void))a4;
  v5 = sub_1000067C0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[WFRemoteAlertViewController prepareForActivationWithContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Preparing for activation", (uint8_t *)&v6, 0xCu);
  }

  if (v4) {
    v4[2](v4);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(WFRemoteAlertViewController *)self compactViewController];
  id v3 = [v2 supportedInterfaceOrientations];

  return (unint64_t)v3;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = sub_1000067C0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 136315138;
    v34 = "-[WFRemoteAlertViewController configureWithContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Configuring", (uint8_t *)&v33, 0xCu);
  }

  +[WFInitialization initializeProcessWithDatabase:0];
  id v9 = [(WFRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v9 setWallpaperStyle:6 withDuration:0.0];
  [v9 setDesiredHardwareButtonEvents:16];
  [v9 setSwipeDismissalStyle:1];
  [v9 setAllowsAlertStacking:1];
  id v10 = [(WFRemoteAlertViewController *)self compactViewController];
  [(WFRemoteAlertViewController *)self addChildViewController:v10];
  id v11 = [v10 view];
  [v11 setAutoresizingMask:18];

  id v12 = [(WFRemoteAlertViewController *)self view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [v10 view];
  [v21 setFrame:v14, v16, v18, v20];

  v22 = [v10 view];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:1];

  v23 = [(WFRemoteAlertViewController *)self view];
  v24 = [v10 view];
  [v23 addSubview:v24];

  [v10 didMoveToParentViewController:self];
  v25 = [v6 xpcEndpoint];

  if (v25)
  {
    v26 = objc_alloc_init((Class)NSXPCListenerEndpoint);
    v27 = [v6 xpcEndpoint];
    [v26 _setEndpoint:v27];

    id v28 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v26];
    [v28 setExportedObject:self];
    v29 = WFDialogXPCInterface();
    [v28 setExportedInterface:v29];

    [v28 setInterruptionHandler:&stru_100010478];
    [v28 setInvalidationHandler:&stru_100010498];
    [v28 resume];
    [(WFRemoteAlertViewController *)self setXpcConnection:v28];
    v30 = WFDialogXPCHostInterface();
    [v28 setRemoteObjectInterface:v30];

    v31 = [v28 remoteObjectProxy];
    [v31 beginConnection];

    v32 = sub_1000067C0();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315138;
      v34 = "-[WFRemoteAlertViewController configureWithContext:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s Opened XPC connection to specified endpoint", (uint8_t *)&v33, 0xCu);
    }
  }
  else
  {
    v26 = sub_1000067C0();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v33 = 136315138;
      v34 = "-[WFRemoteAlertViewController configureWithContext:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s No XPC endpoint to connect to", (uint8_t *)&v33, 0xCu);
    }
  }

  if (v7) {
    v7[2](v7);
  }
}

- (WFRemoteAlertViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFRemoteAlertViewController;
  v2 = [(WFRemoteAlertViewController *)&v7 init];
  if (v2)
  {
    id v3 = (WFCompactHostingViewController *)[objc_alloc((Class)WFCompactHostingViewController) initWithScreenLocked:SBSGetScreenLockStatus() != 0 delegate:v2];
    compactViewController = v2->_compactViewController;
    v2->_compactViewController = v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end