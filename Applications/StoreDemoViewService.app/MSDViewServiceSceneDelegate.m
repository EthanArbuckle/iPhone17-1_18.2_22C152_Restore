@interface MSDViewServiceSceneDelegate
- (UIWindow)window;
- (void)remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation MSDViewServiceSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = sub_100002050();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    v22 = "-[MSDViewServiceSceneDelegate scene:willConnectToSession:options:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: entered", (uint8_t *)&v21, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    [v10 setDisablesControlCenter:1];
    [v10 setDisablesSiri:1];
    [v10 setDesiredHardwareButtonEvents:63];
    v11 = [v10 configurationContext];
    v12 = [v11 userInfo];
    v13 = [v12 objectForKey:@"DisableIdleTimer"];

    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [v13 BOOLValue];
        v15 = sub_100002050();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          sub_1000061E4((char)v14, v15);
        }

        [v10 setIdleTimerDisabled:v14 forReason:@"Blocking UI shouldn't lock in the current mode"];
      }
    }
    v16 = [[MSDViewServiceRootViewController alloc] initWithScene:v10];
    v17 = [[SecureUIWindow alloc] initWithWindowScene:v10];
    [(MSDViewServiceSceneDelegate *)self setWindow:v17];

    v18 = [(MSDViewServiceSceneDelegate *)self window];
    [v18 setRootViewController:v16];

    v19 = [(MSDViewServiceSceneDelegate *)self window];
    [v19 makeKeyAndVisible];
  }
  else
  {
    v20 = sub_100002050();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100006260(v20);
    }

    v16 = +[UIApplication sharedApplication];
    [(MSDViewServiceRootViewController *)v16 requestSceneSessionDestruction:v8 options:0 errorHandler:&stru_10000C358];
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  v4 = sub_100002050();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[MSDViewServiceSceneDelegate sceneDidDisconnect:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v5, 0xCu);
  }

  [(MSDViewServiceSceneDelegate *)self setWindow:0];
}

- (void)sceneDidBecomeActive:(id)a3
{
  v3 = sub_100002050();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[MSDViewServiceSceneDelegate sceneDidBecomeActive:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)sceneWillResignActive:(id)a3
{
  v3 = sub_100002050();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[MSDViewServiceSceneDelegate sceneWillResignActive:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  v3 = sub_100002050();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[MSDViewServiceSceneDelegate sceneWillEnterForeground:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  v3 = sub_100002050();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[MSDViewServiceSceneDelegate sceneDidEnterBackground:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:(id)a3
{
  v3 = sub_100002050();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[MSDViewServiceSceneDelegate remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s - called.", (uint8_t *)&v4, 0xCu);
  }
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
}

@end