@interface CTCarrierSpaceAuthAppDelegate
- (AuthRemoteAlertViewController)alertViewController;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (NSDictionary)launchContext;
- (UIWindow)window;
- (void)application:(id)a3 didFinishLaunchingSuspendedWithOptions:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setAlertViewController:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation CTCarrierSpaceAuthAppDelegate

- (void)application:(id)a3 didFinishLaunchingSuspendedWithOptions:(id)a4
{
  if (a4)
  {
    v5 = [a4 valueForKey:@"kCTCarrierSpaceAuthContext"];
    launchContext = self->_launchContext;
    self->_launchContext = v5;
  }
  id v7 = objc_alloc((Class)SBSRemoteAlertDefinition);
  v8 = +[NSBundle mainBundle];
  v9 = [v8 bundleIdentifier];
  id v13 = [v7 initWithServiceName:v9 viewControllerClassName:@"AuthRemoteAlertViewController"];

  v10 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:v13 configurationContext:0];
  alertHandle = self->_alertHandle;
  self->_alertHandle = v10;

  [(SBSRemoteAlertHandle *)self->_alertHandle addObserver:self];
  id v12 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  [v12 setReason:@"CTCarrierSpaceAuth Flow"];
  [(SBSRemoteAlertHandle *)self->_alertHandle activateWithContext:v12];
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = sub_1000031A8();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received request to open URL %@, options %@", (uint8_t *)&v11, 0x16u);
  }

  [(AuthRemoteAlertViewController *)self->_alertViewController handleAppURL:v7];
  return 1;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (AuthRemoteAlertViewController)alertViewController
{
  return self->_alertViewController;
}

- (void)setAlertViewController:(id)a3
{
}

- (NSDictionary)launchContext
{
  return self->_launchContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchContext, 0);
  objc_storeStrong((id *)&self->_alertViewController, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end