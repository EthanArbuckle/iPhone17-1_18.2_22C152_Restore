@interface TVLockScreenSceneDelegate
- (TVLockScreenRemoteDelegate)lockScreenRemoteDelegate;
- (TVRemoteViewController)mainViewController;
- (UIWindow)window;
- (id)_mainViewController;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setLockScreenRemoteDelegate:(id)a3;
- (void)setMainViewController:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation TVLockScreenSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v8 description];
    int v25 = 138412802;
    v26 = v12;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[TVLockScreenSceneDelegate] -scene:willConnectToSession:withOptions: %@, %@, %@", (uint8_t *)&v25, 0x20u);
  }
  id v13 = v8;
  v14 = +[UIApplication sharedApplication];
  v15 = [v14 delegate];
  objc_storeWeak((id *)&self->_lockScreenRemoteDelegate, v15);

  v16 = [[TVRemoteWindow alloc] initWithWindowScene:v13];
  window = self->_window;
  self->_window = &v16->super;

  v18 = [(TVLockScreenSceneDelegate *)self _mainViewController];
  mainViewController = self->_mainViewController;
  self->_mainViewController = v18;

  if (!self->_mainViewController)
  {
    v20 = objc_alloc_init(TVRemoteViewController);
    v21 = self->_mainViewController;
    self->_mainViewController = v20;
  }
  v22 = [(TVLockScreenSceneDelegate *)self mainViewController];
  v23 = [(TVLockScreenSceneDelegate *)self window];
  [v23 setRootViewController:v22];

  v24 = [(TVLockScreenSceneDelegate *)self window];
  [v24 makeKeyAndVisible];
}

- (void)sceneDidBecomeActive:(id)a3
{
  v4 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[TVLockScreenSceneDelegate sceneDidBecomeActive:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v5 = [(TVLockScreenSceneDelegate *)self mainViewController];
  unsigned __int8 v6 = [v5 isConfigured];

  if ((v6 & 1) == 0)
  {
    id v7 = [objc_alloc((Class)TVRViewServiceConfigContext) _initWithLaunchContext:14];
    id v8 = [(TVLockScreenSceneDelegate *)self mainViewController];
    [v8 configureWithContext:v7];
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  v4 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[TVLockScreenSceneDelegate sceneWillEnterForeground:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v5 = [(TVLockScreenSceneDelegate *)self mainViewController];
  [v5 willEnterLockScreenScene];
}

- (void)sceneWillResignActive:(id)a3
{
  v4 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[TVLockScreenSceneDelegate sceneWillResignActive:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v5 = [(TVLockScreenSceneDelegate *)self mainViewController];
  [v5 willExitLockScreenScene];
}

- (void)sceneDidDisconnect:(id)a3
{
  v4 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    v14 = "-[TVLockScreenSceneDelegate sceneDidDisconnect:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v13, 0xCu);
  }

  v5 = [(TVLockScreenSceneDelegate *)self window];
  [v5 setRootViewController:0];

  window = self->_window;
  self->_window = 0;

  id v7 = [(TVLockScreenSceneDelegate *)self mainViewController];
  [v7 willExitLockScreenScene];

  id v8 = [(TVLockScreenSceneDelegate *)self mainViewController];
  [v8 dismiss];

  mainViewController = self->_mainViewController;
  self->_mainViewController = 0;

  id v10 = [(TVLockScreenSceneDelegate *)self lockScreenRemoteDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(TVLockScreenSceneDelegate *)self lockScreenRemoteDelegate];
    [v12 lockScreenSceneDelegateSceneDidDisconnect:self];
  }
}

- (id)_mainViewController
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 delegate];

  v4 = [v3 defaultSceneDelegate];
  v5 = [v4 mainViewController];

  return v5;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (TVRemoteViewController)mainViewController
{
  return self->_mainViewController;
}

- (void)setMainViewController:(id)a3
{
}

- (TVLockScreenRemoteDelegate)lockScreenRemoteDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRemoteDelegate);

  return (TVLockScreenRemoteDelegate *)WeakRetained;
}

- (void)setLockScreenRemoteDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lockScreenRemoteDelegate);
  objc_storeStrong((id *)&self->_mainViewController, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end