@interface MusicUIServiceNowPlayingViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (MPMediaControlsProtocol)hostProxy;
- (MRUViewServiceViewController)remoteViewController;
- (NSXPCConnection)connection;
- (id)childViewControllerForStatusBarHidden;
- (id)connectionWithEndpoint:(id)a3;
- (void)cleanup;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)customRowDidTap:(id)a3;
- (void)handleButtonActions:(id)a3;
- (void)setConnection:(id)a3;
- (void)setHostProxy:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)updateMediaControlsWithConfiguration:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MusicUIServiceNowPlayingViewController

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MusicUIServiceNowPlayingViewController;
  [(MusicUIServiceNowPlayingViewController *)&v13 viewDidLayoutSubviews];
  v3 = [(MusicUIServiceNowPlayingViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(MRUViewServiceViewController *)self->_remoteViewController view];
  [v12 setFrame:v5, v7, v9, v11];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MusicUIServiceNowPlayingViewController;
  [(MusicUIServiceNowPlayingViewController *)&v4 viewWillAppear:a3];
  [(MRUViewServiceViewController *)self->_remoteViewController transitionToVisible:1 animated:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MusicUIServiceNowPlayingViewController;
  [(MusicUIServiceNowPlayingViewController *)&v4 viewDidDisappear:a3];
  [(MusicUIServiceNowPlayingViewController *)self cleanup];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_remoteViewController;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  double v7 = [(MusicUIServiceNowPlayingViewController *)self _remoteViewControllerProxy];
  [v7 setSwipeDismissalStyle:1];
  [v7 setDismissalAnimationStyle:0];
  [v7 setDesiredHardwareButtonEvents:16];
  [v7 setAllowsMenuButtonDismissal:1];
  [v7 setAllowsAlertStacking:1];
  [v7 setSceneDeactivationReason:0];
  [v7 setOrientationChangedEventsEnabled:0];
  double v8 = [v6 userInfo];
  double v9 = [v8 objectForKeyedSubscript:kMRMediaRemoteMediaControlsConfigurationKey];

  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Successfully deserialized the initial media controls configuration.", (uint8_t *)buf, 2u);
    }
    double v10 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:0];
    double v11 = +[MRUViewServiceProvider viewControllerForConfiguration:v10];
    remoteViewController = self->_remoteViewController;
    self->_remoteViewController = v11;

    [(MRUViewServiceViewController *)self->_remoteViewController setConfiguration:v10];
    objc_initWeak(buf, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000507C;
    v25[3] = &unk_10000C2C0;
    objc_copyWeak(&v26, buf);
    [(MRUViewServiceViewController *)self->_remoteViewController setDismissalBlock:v25];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000050BC;
    v23[3] = &unk_10000C2E8;
    objc_copyWeak(&v24, buf);
    [(MRUViewServiceViewController *)self->_remoteViewController setCustomRowTappedBlock:v23];
    [(MusicUIServiceNowPlayingViewController *)self addChildViewController:self->_remoteViewController];
    objc_super v13 = [(MusicUIServiceNowPlayingViewController *)self view];
    v14 = [(MRUViewServiceViewController *)self->_remoteViewController view];
    [v13 addSubview:v14];

    [(MRUViewServiceViewController *)self->_remoteViewController didMoveToParentViewController:self];
    v15 = [(MusicUIServiceNowPlayingViewController *)self view];
    [v15 setNeedsLayout];

    [(MusicUIServiceNowPlayingViewController *)self setNeedsStatusBarAppearanceUpdate];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(buf);
  }
  v16 = [v6 xpcEndpoint];

  if (v16)
  {
    v17 = [v6 xpcEndpoint];
    v18 = [(MusicUIServiceNowPlayingViewController *)self connectionWithEndpoint:v17];
    v19 = [v18 remoteObjectProxyWithErrorHandler:&stru_10000C328];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Attempting to open connection to host app.", (uint8_t *)buf, 2u);
    }
    [v19 openConnection];
    hostProxy = self->_hostProxy;
    self->_hostProxy = (MPMediaControlsProtocol *)v19;
  }
  v22.receiver = self;
  v22.super_class = (Class)MusicUIServiceNowPlayingViewController;
  [(MusicUIServiceNowPlayingViewController *)&v22 configureWithContext:v6 completion:v21];
}

- (void)handleButtonActions:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000522C;
  v3[3] = &unk_10000C350;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

- (void)updateMediaControlsWithConfiguration:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    double v5 = [v4 presentingAppBundleID];
    *(_DWORD *)buf = 138412290;
    double v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Received updated media controls configuration from:  %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005418;
  v7[3] = &unk_10000C378;
  objc_copyWeak(&v9, (id *)buf);
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)customRowDidTap:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Custom row did tap: %@", (uint8_t *)&v6, 0xCu);
  }
  hostProxy = self->_hostProxy;
  if (hostProxy) {
    [(MPMediaControlsProtocol *)hostProxy setTappedCustomRowIdentifier:v4];
  }
  [(MusicUIServiceNowPlayingViewController *)self cleanup];
}

- (void)cleanup
{
  [(NSXPCConnection *)self->_connection invalidate];
  id v5 = [(MusicUIServiceNowPlayingViewController *)self _remoteViewControllerProxy];
  [v5 deactivate];
  [v5 invalidate];
  [(MRUViewServiceViewController *)self->_remoteViewController willMoveToParentViewController:0];
  v3 = [(MRUViewServiceViewController *)self->_remoteViewController view];
  [v3 removeFromSuperview];

  [(MRUViewServiceViewController *)self->_remoteViewController removeFromParentViewController];
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;
}

- (id)connectionWithEndpoint:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  if (!connection)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Creating XPC connection to host app.", (uint8_t *)buf, 2u);
    }
    id v6 = objc_alloc_init((Class)NSXPCListenerEndpoint);
    [v6 _setEndpoint:v4];
    id v7 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v6];
    id v8 = self->_connection;
    self->_connection = v7;

    id v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MPMediaControlsProtocol];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v9];

    double v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MPMediaControlsRemoteViewControllerProtocol];
    [(NSXPCConnection *)self->_connection setExportedInterface:v10];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    objc_initWeak(buf, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000057D8;
    v13[3] = &unk_10000C2C0;
    objc_copyWeak(&v14, buf);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v13];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);

    connection = self->_connection;
  }
  double v11 = connection;

  return v11;
}

- (MRUViewServiceViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (MPMediaControlsProtocol)hostProxy
{
  return self->_hostProxy;
}

- (void)setHostProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end