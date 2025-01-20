@interface _UIORegisteringSceneDelegate
- (UIWindow)window;
- (_UIOverlayViewController)rootViewController;
- (id)_setupScene:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation _UIORegisteringSceneDelegate

- (id)_setupScene:(id)a3
{
  id v4 = a3;
  v5 = [[_UIOverlayWindow alloc] initWithWindowScene:v4];

  window = self->_window;
  self->_window = &v5->super;

  v7 = [(_UIORegisteringSceneDelegate *)self rootViewController];
  [(UIWindow *)self->_window setRootViewController:v7];

  [(UIWindow *)self->_window makeKeyAndVisible];

  return [(_UIORegisteringSceneDelegate *)self rootViewController];
}

- (_UIOverlayViewController)rootViewController
{
  rootViewController = self->_rootViewController;
  if (!rootViewController)
  {
    id v4 = [[_UIOverlayViewController alloc] initWithNibName:0 bundle:0];
    v5 = self->_rootViewController;
    self->_rootViewController = v4;

    rootViewController = self->_rootViewController;
  }

  return rootViewController;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  v7 = UIOLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315138;
    v12 = "-[_UIORegisteringSceneDelegate scene:willConnectToSession:options:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v11, 0xCu);
  }

  v8 = +[UIOServer sharedInstance];
  v9 = [(_UIORegisteringSceneDelegate *)self _setupScene:v6];
  v10 = +[UIOServer displayDelegateIdentifierForScene:v6];

  [v8 registerDisplayDelegate:v9 forIdentifier:v10];
  [v8 activate];
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = +[UIOServer displayDelegateIdentifierForScene:a3];
  v3 = +[UIOServer sharedInstance];
  [v3 unregisterDisplayDelegateForIdentifier:v4];
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void)setRootViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end