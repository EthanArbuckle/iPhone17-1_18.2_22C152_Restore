@interface SSSAppDelegate
- (BOOL)_shouldSetUpDevelopmentUI;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)didLaunchSuspended;
- (SSSViewControllerManager)viewControllerManager;
- (UIWindow)window;
- (void)_setUpDevelopmentUI;
- (void)application:(id)a3 didFinishLaunchingSuspendedWithOptions:(id)a4;
- (void)setDidLaunchSuspended:(BOOL)a3;
- (void)setWindow:(id)a3;
@end

@implementation SSSAppDelegate

- (BOOL)_shouldSetUpDevelopmentUI
{
  return !self->_didLaunchSuspended && NSClassFromString(@"SSSTestCase") == 0;
}

- (void)_setUpDevelopmentUI
{
  +[SSSDittoDebugViewController prepareForDebugging];
  id v5 = objc_alloc_init((Class)UIWindow);
  [(SSSAppDelegate *)self setWindow:v5];
  v3 = objc_alloc_init(SSSDittoDebugViewController);
  debugViewController = self->_debugViewController;
  self->_debugViewController = v3;

  [v5 setRootViewController:self->_debugViewController];
  [v5 makeKeyAndVisible];
}

- (SSSViewControllerManager)viewControllerManager
{
  return self->_viewControllerManager;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if ([(SSSAppDelegate *)self _shouldSetUpDevelopmentUI]) {
    [(SSSAppDelegate *)self _setUpDevelopmentUI];
  }
  return 1;
}

- (void)application:(id)a3 didFinishLaunchingSuspendedWithOptions:(id)a4
{
  id v5 = _SSSignpostLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ServiceLaunch", (const char *)&unk_100093E93, buf, 2u);
  }

  v6 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "END \"ServiceLaunch\"", v9, 2u);
  }

  v7 = objc_alloc_init(SSSViewControllerManager);
  viewControllerManager = self->_viewControllerManager;
  self->_viewControllerManager = v7;

  self->_didLaunchSuspended = 1;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (BOOL)didLaunchSuspended
{
  return self->_didLaunchSuspended;
}

- (void)setDidLaunchSuspended:(BOOL)a3
{
  self->_didLaunchSuspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_viewControllerManager, 0);

  objc_storeStrong((id *)&self->_debugViewController, 0);
}

@end