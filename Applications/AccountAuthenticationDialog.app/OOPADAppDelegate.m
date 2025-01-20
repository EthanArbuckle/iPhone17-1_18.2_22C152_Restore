@interface OOPADAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)canShowAlerts;
- (UIWindow)window;
- (id)_dialogManager;
- (void)_connectToAuthenticationDialogManager;
- (void)_disconnectFromAuthenticationDialogManager;
- (void)_remoteSheetDidEnd;
- (void)setWindow:(id)a3;
- (void)webViewController:(id)a3 didFinishWithSuccess:(BOOL)a4 response:(id)a5;
@end

@implementation OOPADAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a3;
  [(OOPADAppDelegate *)self _connectToAuthenticationDialogManager];
  v6 = objc_alloc_init(OOPAWebViewController);
  webViewController = self->_webViewController;
  self->_webViewController = v6;

  [(OOPAWebViewController *)self->_webViewController setDelegate:self];
  v8 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_webViewController];
  navViewController = self->_navViewController;
  self->_navViewController = v8;

  v10 = (char *)[UIApp _getSpringBoardOrientation];
  [UIApp setStatusBarOrientation:v10];
  v11 = [(OOPADAppDelegate *)self _dialogManager];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000038A8;
  v17[3] = &unk_100008230;
  v17[4] = self;
  [v11 contextForAuthenticationDialog:v17];

  if ((unint64_t)(v10 - 1) > 1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000039F4;
    block[3] = &unk_100008258;
    id v15 = v5;
    v16 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    LOBYTE(v13) = 1;
    [v5 beginRemoteSheetController:self->_navViewController delegate:self didEndSelector:"_remoteSheetDidEnd" contextInfo:0 requireTopApplication:0 opaque:0 presentAnimated:v13];
  }

  return 1;
}

- (void)_remoteSheetDidEnd
{
  v3 = [(OOPADAppDelegate *)self _dialogManager];
  [v3 authenticationDialogDidFinishWithSuccess:self->_cachedSuccess response:self->_cachedResponse];

  [(OOPADAppDelegate *)self _disconnectFromAuthenticationDialogManager];
  v4 = (void *)UIApp;

  [v4 terminateWithSuccess];
}

- (BOOL)canShowAlerts
{
  return 1;
}

- (void)webViewController:(id)a3 didFinishWithSuccess:(BOOL)a4 response:(id)a5
{
  BOOL v5 = a4;
  v7 = (NSDictionary *)a5;
  v8 = _ACLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = +[NSNumber numberWithBool:v5];
    int v13 = 138412290;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "\"AADWebViewController reports finishing with result %@\"", (uint8_t *)&v13, 0xCu);
  }
  v10 = (void *)UIApp;
  v11 = [(UINavigationController *)self->_navViewController view];
  [v10 endRemoteSheet:v11];

  self->_cachedSuccess = v5;
  cachedResponse = self->_cachedResponse;
  self->_cachedResponse = v7;
}

- (id)_dialogManager
{
  return [(NSXPCConnection *)self->_connectionToDialogManager remoteObjectProxy];
}

- (void)_connectToAuthenticationDialogManager
{
  v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100004138(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  v11 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.accountsd.oopa" options:0];
  connectionToDialogManager = self->_connectionToDialogManager;
  self->_connectionToDialogManager = v11;

  int v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACDAuthenticationDialogManagerProtocol];
  [(NSXPCConnection *)self->_connectionToDialogManager setRemoteObjectInterface:v13];

  [(NSXPCConnection *)self->_connectionToDialogManager setInterruptionHandler:&stru_100008298];
  [(NSXPCConnection *)self->_connectionToDialogManager setInvalidationHandler:&stru_1000082B8];
  [(NSXPCConnection *)self->_connectionToDialogManager resume];
}

- (void)_disconnectFromAuthenticationDialogManager
{
  [(NSXPCConnection *)self->_connectionToDialogManager invalidate];
  connectionToDialogManager = self->_connectionToDialogManager;
  self->_connectionToDialogManager = 0;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_cachedResponse, 0);
  objc_storeStrong((id *)&self->_navViewController, 0);
  objc_storeStrong((id *)&self->_webViewController, 0);

  objc_storeStrong((id *)&self->_connectionToDialogManager, 0);
}

@end