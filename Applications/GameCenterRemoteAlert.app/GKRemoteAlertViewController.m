@interface GKRemoteAlertViewController
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)contextCanBypassAuthentication:(id)a3;
- (BOOL)needToShowGreenBuddy;
- (BOOL)prefersStatusBarHidden;
- (GKGameCenterViewController)gameCenterViewController;
- (id)deserializeGameFromData:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss;
- (void)dismissExistingAndInvokeDashboardWithHostPID:(int)a3 game:(id)a4 byPassPreAuthentication:(BOOL)a5 deepLink:(id)a6 launchContext:(id)a7;
- (void)gameCenterViewControllerDidFinish:(id)a3;
- (void)handleButtonActions:(id)a3;
- (void)invokeDashboardWithHostPID:(int)a3 game:(id)a4 byPassPreAuthentication:(BOOL)a5 deepLink:(id)a6 launchContext:(id)a7;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setGameCenterViewController:(id)a3;
- (void)setNeedToShowGreenBuddy:(BOOL)a3;
- (void)showGreenBuddyWithCompletionHandler:(id)a3;
@end

@implementation GKRemoteAlertViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = [(GKRemoteAlertViewController *)self gameCenterViewController];
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "RemoteAlert: configureWithContext: %@\ngameCenterViewController=%@", buf, 0x16u);
  }
  v12 = [(GKRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v12 setDesiredHardwareButtonEvents:16];
  [v12 setAllowsAlertStacking:1];
  [v12 setSwipeDismissalStyle:1];
  [v12 setDismissalAnimationStyle:1];
  v13 = +[GKLocalPlayerAuthenticator authenticatorForPlayerWithUsername:0 password:0 withPresentingViewController:self];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000042D8;
  v15[3] = &unk_100008200;
  v15[4] = self;
  id v16 = v7;
  id v14 = v7;
  [v13 authenticateWithCompletionHandler:v15];
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = [v6 userInfo];
    v12 = +[GKLocalPlayer local];
    v13 = +[GKLocalPlayer local];
    unsigned int v14 = [v13 isAuthenticated];
    [(GKRemoteAlertViewController *)self gameCenterViewController];
    id v16 = v15 = v7;
    *(_DWORD *)buf = 138413058;
    v47 = v11;
    __int16 v48 = 2112;
    v49 = v12;
    __int16 v50 = 1024;
    unsigned int v51 = v14;
    __int16 v52 = 2112;
    v53 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "RemoteAlert: prepareForActivationWithContext: userInfo=%@\nlocalPlayer=%@\nisAuthenticated=%d\ngameCenterViewController=%@", buf, 0x26u);

    id v7 = v15;
  }
  if (MKBGetDeviceLockState() - 1 > 1)
  {
    v20 = [v6 userInfo];
    BOOL v21 = [(GKRemoteAlertViewController *)self contextCanBypassAuthentication:v20];

    if (!v21)
    {
      uint64_t v22 = +[GKLocalPlayer local];
      if (!v22
        || (v23 = (void *)v22,
            +[GKLocalPlayer local],
            v24 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v25 = [v24 isAuthenticated],
            v24,
            v23,
            (v25 & 1) == 0))
      {
        if (!os_log_GKGeneral) {
          id v37 = (id)GKOSLoggers();
        }
        v38 = os_log_GKError;
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        {
          sub_1000054C4(v38);
          if (!v7) {
            goto LABEL_25;
          }
        }
        else if (!v7)
        {
          goto LABEL_25;
        }
        v7[2](v7);
        goto LABEL_25;
      }
    }
    v26 = [v6 userInfo:v7];
    uint64_t v27 = [v26 objectForKeyedSubscript:GKRemoteAlertUserInfoSerializedGameKey];

    v28 = [v6 userInfo];
    v29 = [v28 objectForKeyedSubscript:GKRemoteAlertUserInfoDeeplinkKey];

    v30 = [v6 userInfo];
    v31 = [v30 objectForKeyedSubscript:GKRemoteAlertUserInfoDashboardLaunchContextKey];

    v32 = (void *)v27;
    v33 = [(GKRemoteAlertViewController *)self deserializeGameFromData:v27];
    v34 = [v6 userInfo];
    v35 = [v34 objectForKeyedSubscript:GKRemoteAlertUserInfoHostPIDKey];
    id v36 = [v35 integerValue];

    if ([(GKRemoteAlertViewController *)self needToShowGreenBuddy])
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100004950;
      v40[3] = &unk_100008228;
      v40[4] = self;
      int v44 = (int)v36;
      id v41 = v33;
      BOOL v45 = v21;
      id v42 = v29;
      id v43 = v31;
      [(GKRemoteAlertViewController *)self showGreenBuddyWithCompletionHandler:v40];
      [(GKRemoteAlertViewController *)self setNeedToShowGreenBuddy:0];
    }
    else
    {
      [(GKRemoteAlertViewController *)self dismissExistingAndInvokeDashboardWithHostPID:v36 game:v33 byPassPreAuthentication:v21 deepLink:v29 launchContext:v31];
    }
    id v7 = v39;
    if (v39) {
      v39[2](v39);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers();
    }
    id v18 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "RemoteAlert: Not going to show the remote alert because the device is locked.", buf, 2u);
    }
    __int16 v19 = [(GKRemoteAlertViewController *)self _remoteViewControllerProxy];
    [v19 invalidate];
  }
LABEL_25:
}

- (void)handleButtonActions:(id)a3
{
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)gameCenterViewControllerDidFinish:(id)a3
{
}

- (BOOL)contextCanBypassAuthentication:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:GKRemoteAlertUserInfoBypassPreAuthenticationKey];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)deserializeGameFromData:(id)a3
{
  id v3 = a3;
  id v10 = 0;
  unsigned __int8 v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v10];

  id v5 = v10;
  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers();
    }
    id v7 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100005508((uint64_t)v5, v7);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = [objc_alloc((Class)GKGame) initWithInternalRepresentation:v4];
  }

  return v8;
}

- (void)showGreenBuddyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[GKLocalPlayer local];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004BFC;
  v7[3] = &unk_1000082A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[GKAccountRemoteUIController accountRemoteUIControllerForPlayer:v5 mode:1 url:0 postBody:0 completionHandler:v7];
}

- (void)dismissExistingAndInvokeDashboardWithHostPID:(int)a3 game:(id)a4 byPassPreAuthentication:(BOOL)a5 deepLink:(id)a6 launchContext:(id)a7
{
  BOOL v9 = a5;
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v15 = [(GKRemoteAlertViewController *)self gameCenterViewController];

  if (v15)
  {
    id v16 = [(GKRemoteAlertViewController *)self gameCenterViewController];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000500C;
    v17[3] = &unk_1000082C8;
    v17[4] = self;
    int v21 = v10;
    id v18 = v12;
    BOOL v22 = v9;
    id v19 = v13;
    id v20 = v14;
    [v16 dismissViewControllerAnimated:0 completion:v17];
  }
  else
  {
    [(GKRemoteAlertViewController *)self invokeDashboardWithHostPID:v10 game:v12 byPassPreAuthentication:v9 deepLink:v13 launchContext:v14];
  }
}

- (void)invokeDashboardWithHostPID:(int)a3 game:(id)a4 byPassPreAuthentication:(BOOL)a5 deepLink:(id)a6 launchContext:(id)a7
{
  BOOL v9 = a5;
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers();
  }
  id v16 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v17 = v16;
    id v18 = +[NSNumber numberWithInt:v10];
    int v23 = 138413314;
    id v24 = v12;
    __int16 v25 = 2112;
    v26 = v18;
    __int16 v27 = 1024;
    BOOL v28 = v9;
    __int16 v29 = 2112;
    id v30 = v13;
    __int16 v31 = 2112;
    id v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "RemoteAlert: invokeDashboardWithHostPID: game=%@\n hostPID=%@\n byPassPreAuthentication=%d\n deeplink=%@\n launchContext=%@", (uint8_t *)&v23, 0x30u);
  }
  if (v9) {
    uint64_t v19 = 3;
  }
  else {
    uint64_t v19 = 0;
  }
  id v20 = [objc_alloc((Class)GKGameCenterViewController) initWithGame:v12 hostPID:v10 restrictionMode:v19 deeplink:v13 launchContext:v14];
  [(GKRemoteAlertViewController *)self setGameCenterViewController:v20];

  int v21 = [(GKRemoteAlertViewController *)self gameCenterViewController];
  [v21 setGameCenterDelegate:self];

  BOOL v22 = [(GKRemoteAlertViewController *)self gameCenterViewController];
  [(GKRemoteAlertViewController *)self presentViewController:v22 animated:1 completion:&stru_100008308];
}

- (void)dismiss
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "RemoteAlert: Dismissing the remote alert dashboard", buf, 2u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005394;
  v7[3] = &unk_100008330;
  v7[4] = self;
  id v5 = objc_retainBlock(v7);
  id v6 = [(GKRemoteAlertViewController *)self presentedViewController];
  if (v6) {
    [(GKRemoteAlertViewController *)self dismissViewControllerAnimated:1 completion:v5];
  }
  else {
    ((void (*)(void *))v5[2])(v5);
  }
}

- (GKGameCenterViewController)gameCenterViewController
{
  return self->_gameCenterViewController;
}

- (void)setGameCenterViewController:(id)a3
{
}

- (BOOL)needToShowGreenBuddy
{
  return self->_needToShowGreenBuddy;
}

- (void)setNeedToShowGreenBuddy:(BOOL)a3
{
  self->_needToShowGreenBuddy = a3;
}

- (void).cxx_destruct
{
}

@end