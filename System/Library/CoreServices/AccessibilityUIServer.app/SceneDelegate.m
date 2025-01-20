@interface SceneDelegate
- (BOOL)_isWindowSceneExternalDisplay:(id)a3;
- (NSString)sceneClientIdentifier;
- (UIWindow)window;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setSceneClientIdentifier:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 userActivities];
  v12 = [v11 anyObject];

  v13 = [v12 activityType];
  sceneClientIdentifier = self->_sceneClientIdentifier;
  self->_sceneClientIdentifier = v13;

  buf[0] = 0;
  objc_opt_class();
  v15 = +[UIApplication sharedApplication];
  v16 = [v15 delegate];
  v17 = __UIAccessibilityCastAsClass();

  if (self->_sceneClientIdentifier) {
    [v17 setPreferredSceneAttemptCount:0];
  }
  else {
    [v17 setDefaultSceneAttemptCount:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [v8 screen];
    v19 = [v18 displayIdentity];
    id v20 = [v19 type];

    if (v20 == (id)8)
    {
      v21 = AXLogUI();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Skipping UIWindowScene because it belongs to Oneness.app", buf, 2u);
      }
      goto LABEL_26;
    }
    v21 = +[AXUIServiceManager sharedServiceManager];
    v22 = [v8 screen];
    unsigned int v23 = [v22 _isEmbeddedScreen];

    if (v23)
    {
      v24 = AXLogUI();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = self->_sceneClientIdentifier;
        *(_DWORD *)buf = 134218242;
        id v37 = v8;
        __int16 v38 = 2112;
        v39 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "willConnect scene: %p sceneClientIdentifier: %@", buf, 0x16u);
      }

      v26 = [v21 displayManager];
      [v26 _windowSceneConnected:v8 forSceneClientIdentifier:self->_sceneClientIdentifier];
    }
    else
    {
      if (![(SceneDelegate *)self _isWindowSceneExternalDisplay:v8])
      {
LABEL_19:
        v29 = [v12 userInfo];

        if (v29)
        {
          v30 = [v12 userInfo];
          v31 = [v30 objectForKeyedSubscript:@"AXUIServerPreferredLevelKey"];

          if (v31)
          {
            [v31 floatValue];
            double v33 = v32;
          }
          else
          {
            double v33 = 10000002.0;
          }
        }
        else
        {
          double v33 = 10000002.0;
        }
        v34 = [v8 _FBSScene];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1000041A0;
        v35[3] = &unk_100008390;
        *(double *)&v35[4] = v33;
        [v34 updateClientSettingsWithBlock:v35];

        goto LABEL_26;
      }
      v27 = AXLogUI();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = self->_sceneClientIdentifier;
        *(_DWORD *)buf = 134218242;
        id v37 = v8;
        __int16 v38 = 2112;
        v39 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "willConnect external scene: %p sceneClientIdentifier: %@", buf, 0x16u);
      }

      v26 = [v21 displayManager];
      [v26 _externalDisplaySceneConnected:v8 forSceneClientIdentifier:self->_sceneClientIdentifier];
    }

    goto LABEL_19;
  }
  v21 = AXLogUI();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_100004958((uint64_t)v8, v21);
  }
LABEL_26:
}

- (BOOL)_isWindowSceneExternalDisplay:(id)a3
{
  id v3 = a3;
  v4 = [v3 session];
  v5 = [v4 role];
  if ([v5 isEqualToString:UIWindowSceneSessionRoleApplication])
  {
    v6 = [v3 _FBSScene];
    v7 = [v6 settings];
    v17 = [v7 displayIdentity];
    id v8 = [v17 rootIdentity];
    id v9 = +[UIScreen mainScreen];
    id v10 = [v9 displayIdentity];
    v11 = [v10 rootIdentity];
    if ([v8 isEqual:v11])
    {
      LOBYTE(v12) = 0;
    }
    else
    {
      [v3 screen];
      v16 = v7;
      v14 = v13 = v6;
      unsigned int v12 = [v14 _isEmbeddedScreen] ^ 1;

      v6 = v13;
      v7 = v16;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = +[AXUIServiceManager sharedServiceManager];
    v6 = [v4 screen];
    unsigned int v7 = [v6 _isEmbeddedScreen];

    if (v7)
    {
      id v8 = AXLogUI();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        sceneClientIdentifier = self->_sceneClientIdentifier;
        int v13 = 134218242;
        id v14 = v4;
        __int16 v15 = 2112;
        v16 = sceneClientIdentifier;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didDisconnect scene: %p sceneClientIdentifier: %@", (uint8_t *)&v13, 0x16u);
      }

      id v10 = [v5 displayManager];
      [v10 _windowSceneDisconnected:v4 forSceneClientIdentifier:self->_sceneClientIdentifier];
LABEL_12:

      goto LABEL_13;
    }
    if ([(SceneDelegate *)self _isWindowSceneExternalDisplay:v4])
    {
      v11 = AXLogUI();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = self->_sceneClientIdentifier;
        int v13 = 134218242;
        id v14 = v4;
        __int16 v15 = 2112;
        v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didDisconnect external scene: %p sceneClientIdentifier: %@", (uint8_t *)&v13, 0x16u);
      }

      id v10 = [v5 displayManager];
      [v10 _externalDisplaySceneDisconnected:v4 forSceneClientIdentifier:self->_sceneClientIdentifier];
      goto LABEL_12;
    }
  }
  else
  {
    v5 = AXLogUI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100004958((uint64_t)v4, v5);
    }
  }
LABEL_13:
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (NSString)sceneClientIdentifier
{
  return self->_sceneClientIdentifier;
}

- (void)setSceneClientIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneClientIdentifier, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end