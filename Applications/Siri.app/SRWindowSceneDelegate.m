@interface SRWindowSceneDelegate
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
@end

@implementation SRWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315650;
    v20 = "-[SRWindowSceneDelegate scene:willConnectToSession:options:]";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Options: %@, scene: %@", (uint8_t *)&v19, 0x20u);
  }
  v11 = [v7 _FBSScene];
  v12 = [v11 settings];

  id v13 = [v12 interfaceOrientation];
  v14 = +[SRApplication sharedApplication];
  [v14 setFrontMostAppOrientation:v13];

  v15 = +[UIApplication sharedApplication];
  v16 = [v15 delegate];

  v17 = [v16 appWindow];
  [v17 _setWindowInterfaceOrientation:v13];
  [v16 setCurrentScene:v7];
  if (!v17)
  {
    v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B9C20(v18);
    }
  }
  [v17 setWindowScene:v7];
  [v17 makeKeyWindow];
  [v17 setHidden:0];
  [v16 invalidateKeyboardWindowIfNeeded];
}

- (void)sceneDidDisconnect:(id)a3
{
  id v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[SRWindowSceneDelegate sceneDidDisconnect:]";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Scene: %@", (uint8_t *)&v8, 0x16u);
  }
  v5 = +[UIApplication sharedApplication];
  v6 = [v5 delegate];

  id v7 = [v6 appWindow];
  [v6 setCurrentScene:0];
  [v6 tearDownViews];
  [v7 setHidden:1];
  [v7 setWindowScene:0];
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[SRWindowSceneDelegate sceneDidBecomeActive:]";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Scene: %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = +[UIApplication sharedApplication];
  v6 = [v5 delegate];

  [v6 didBecomeActiveHandler];
}

- (void)sceneWillResignActive:(id)a3
{
  id v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[SRWindowSceneDelegate sceneWillResignActive:]";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Scene: %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = +[UIApplication sharedApplication];
  v6 = [v5 delegate];

  [v6 willResignActiveHandler];
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[SRWindowSceneDelegate sceneWillEnterForeground:]";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Scene: %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = +[UIApplication sharedApplication];
  v6 = [v5 delegate];

  [v6 willEnterForegroundHandler];
  [v6 setUpViews];
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[SRWindowSceneDelegate sceneDidEnterBackground:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Scene: %@", (uint8_t *)&v5, 0x16u);
  }
}

@end