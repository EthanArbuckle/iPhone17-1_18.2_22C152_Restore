@interface ContinuityCaptureShieldUIBaseSceneDelegate
- (UIWindow)window;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation ContinuityCaptureShieldUIBaseSceneDelegate

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  v5 = [a4 allObjects];
  v6 = [v5 firstObject];

  v7 = [v6 URL];
  if (v7)
  {
    v8 = [v6 options];
    v9 = [v8 annotation];
    uint64_t v10 = objc_opt_class();
    id v11 = v9;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    id v13 = v12;

    v14 = [v13 objectForKey:@"kContinuityCaptureLaunchUIConfigurationKey"];

    if (v14)
    {
      id v19 = 0;
      v15 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:&v19];
      v16 = v19;
      v17 = sub_10000AB00();
      v18 = v17;
      if (!v15 || v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v21 = "-[ContinuityCaptureShieldUIBaseSceneDelegate scene:openURLContexts:]";
          __int16 v22 = 2048;
          v23 = self;
          __int16 v24 = 2112;
          v25 = v6;
          __int16 v26 = 2112;
          v27 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: <%p> Launching ShieldUI via URL without a valid URL payload for the launchUIConfiguration: %@ error: %@", buf, 0x2Au);
        }
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v21 = "-[ContinuityCaptureShieldUIBaseSceneDelegate scene:openURLContexts:]";
          __int16 v22 = 2048;
          v23 = self;
          __int16 v24 = 2112;
          v25 = v15;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: <%p> Launching ShieldUI with launchUIConfiguration: %@", buf, 0x20u);
        }

        v18 = +[CMContinuityCaptureUIStateTracker sharedInstance];
        [v18 setUIConfiguration:v15];
      }
    }
    else
    {
      v16 = sub_10000AB00();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10000FAEC((uint64_t)self, (uint64_t)v6, v16);
      }
    }
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = sub_10000AB00();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    v8 = "-[ContinuityCaptureShieldUIBaseSceneDelegate sceneDidDisconnect:]";
    __int16 v9 = 2048;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: <%p> Called %@", (uint8_t *)&v7, 0x20u);
  }

  [(UIWindow *)self->_window setRootViewController:0];
  window = self->_window;
  self->_window = 0;
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