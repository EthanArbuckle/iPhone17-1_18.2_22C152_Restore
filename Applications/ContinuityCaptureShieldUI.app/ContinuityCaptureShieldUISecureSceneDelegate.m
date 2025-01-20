@interface ContinuityCaptureShieldUISecureSceneDelegate
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
@end

@implementation ContinuityCaptureShieldUISecureSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_10000AB00();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [v8 description];
    int v20 = 136315906;
    v21 = "-[ContinuityCaptureShieldUISecureSceneDelegate scene:willConnectToSession:options:]";
    __int16 v22 = 2112;
    v23 = v12;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s: %@, %@, %@", (uint8_t *)&v20, 0x2Au);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v8;
    v14 = [[ContinuityCaptureShieldUISecureWindow alloc] initWithWindowScene:v13];
    [v13 _setBackgroundStyle:4];
    v15 = [ContinuityCaptureShieldUIViewController alloc];
    v16 = [v13 session];
    v17 = [v16 role];
    v18 = [(ContinuityCaptureShieldUIViewController *)v15 initWithSceneSessionRole:v17];

    [(ContinuityCaptureShieldUISecureWindow *)v14 setRootViewController:v18];
    [(ContinuityCaptureShieldUIBaseSceneDelegate *)self setWindow:v14];
    v19 = [v10 URLContexts];
    [(ContinuityCaptureShieldUIBaseSceneDelegate *)self scene:v13 openURLContexts:v19];

    [(ContinuityCaptureShieldUISecureWindow *)v14 makeKeyAndVisible];
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = sub_10000AB00();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    v7 = "-[ContinuityCaptureShieldUISecureSceneDelegate sceneWillEnterForeground:]";
    __int16 v8 = 2048;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: <%p> Called %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = sub_10000AB00();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    v7 = "-[ContinuityCaptureShieldUISecureSceneDelegate sceneDidEnterBackground:]";
    __int16 v8 = 2048;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: <%p> Called %@", (uint8_t *)&v6, 0x20u);
  }
}

@end