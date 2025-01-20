@interface TVDefaultSceneDelegate
- (TVRemoteViewController)mainViewController;
- (UIWindow)window;
- (void)resetRootViewController;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation TVDefaultSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v23 = [v8 description];
    int v24 = 136315906;
    v25 = "-[TVDefaultSceneDelegate scene:willConnectToSession:options:]";
    __int16 v26 = 2112;
    v27 = v23;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s: %@, %@, %@", (uint8_t *)&v24, 0x2Au);
  }
  v12 = +[UIDevice currentDevice];
  id v13 = [v12 userInterfaceIdiom];

  if (v13 == (id)1)
  {
    v14 = _TVRUIServiceAppLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[TVDefaultSceneDelegate scene:willConnectToSession:options:](v14);
    }
  }
  else
  {
    id v15 = v8;
    v16 = [[TVRemoteWindow alloc] initWithWindowScene:v15];
    window = self->_window;
    self->_window = &v16->super;

    v18 = objc_alloc_init(TVRemoteViewController);
    mainViewController = self->_mainViewController;
    self->_mainViewController = v18;

    v20 = [(TVDefaultSceneDelegate *)self mainViewController];
    v21 = [(TVDefaultSceneDelegate *)self window];
    [v21 setRootViewController:v20];

    v22 = [v10 URLContexts];
    [(TVDefaultSceneDelegate *)self scene:v15 openURLContexts:v22];

    v14 = [(TVDefaultSceneDelegate *)self window];
    [v14 makeKeyAndVisible];
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  v4 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[TVDefaultSceneDelegate sceneDidBecomeActive:](v4);
  }

  v5 = [(TVDefaultSceneDelegate *)self mainViewController];
  unsigned __int8 v6 = [v5 isConfigured];

  if ((v6 & 1) == 0)
  {
    id v7 = [objc_alloc((Class)TVRViewServiceConfigContext) _initWithLaunchContext:1];
    id v8 = [(TVDefaultSceneDelegate *)self mainViewController];
    [v8 configureWithContext:v7];
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  v4 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[TVDefaultSceneDelegate sceneWillEnterForeground:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v5 = [(TVDefaultSceneDelegate *)self window];
  unsigned __int8 v6 = [v5 rootViewController];

  if (!v6)
  {
    id v7 = [(TVDefaultSceneDelegate *)self mainViewController];
    id v8 = [(TVDefaultSceneDelegate *)self window];
    [v8 setRootViewController:v7];
  }
  id v9 = [(TVDefaultSceneDelegate *)self mainViewController];
  [v9 willExitLockScreenScene];
}

- (void)sceneWillResignActive:(id)a3
{
  v4 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[TVDefaultSceneDelegate sceneWillResignActive:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (SBSGetScreenLockStatus())
  {
    v5 = _TVRUIServiceAppLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Screen is locked", buf, 2u);
    }

    unsigned __int8 v6 = [(TVDefaultSceneDelegate *)self mainViewController];
    [v6 willEnterLockScreenScene];
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  v3 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[TVDefaultSceneDelegate sceneDidEnterBackground:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  v5 = [a4 allObjects];
  id v15 = [v5 firstObject];

  unsigned __int8 v6 = [v15 URL];
  if (v6)
  {
    id v7 = [v15 options];
    id v8 = [v7 annotation];
    uint64_t v9 = objc_opt_class();
    id v10 = v8;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
    id v12 = v11;

    id v13 = [objc_alloc((Class)TVRViewServiceConfigContext) _initWithUserInfo:v12];
    v14 = [(TVDefaultSceneDelegate *)self mainViewController];
    [v14 configureWithContext:v13];
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  int v4 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[TVDefaultSceneDelegate sceneDidDisconnect:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  v5 = [(TVDefaultSceneDelegate *)self mainViewController];
  [v5 dismiss];

  unsigned __int8 v6 = [(TVDefaultSceneDelegate *)self window];
  [v6 setRootViewController:0];
}

- (void)resetRootViewController
{
  v3 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    unsigned __int8 v6 = "-[TVDefaultSceneDelegate resetRootViewController]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  int v4 = [(TVDefaultSceneDelegate *)self window];
  [v4 setRootViewController:0];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainViewController, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

- (void)scene:(os_log_t)log willConnectToSession:options:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "SpringBoard is attempting to launch the app instead of the view service. Ignoring setting up the scene", v1, 2u);
}

- (void)sceneDidBecomeActive:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315138;
  v2 = "-[TVDefaultSceneDelegate sceneDidBecomeActive:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

@end