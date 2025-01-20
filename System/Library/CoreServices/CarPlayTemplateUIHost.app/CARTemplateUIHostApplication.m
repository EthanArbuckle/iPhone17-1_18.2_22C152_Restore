@interface CARTemplateUIHostApplication
- (BOOL)_sceneSettingsIncludeSafeAreaInsets;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (CARSessionStatus)sessionStatus;
- (CARTemplateUIHostApplication)init;
- (CARTemplateUIHostInstrumentClusterViewController)instrumentClusterViewController;
- (CRSUIClusterWindow)instrumentClusterWindow;
- (CRSUIDashboardWidgetWindow)largeDashboardWindow;
- (CRSUIDashboardWidgetWindow)smallDashboardWindow;
- (FBSceneManager)manager;
- (NSMutableDictionary)identifierToEnvironmentMap;
- (NSXPCConnection)connection;
- (RBSAssertion)runningAssertion;
- (UIWindow)activeWindow;
- (UIWindow)mainWindow;
- (UIWindowScene)activeBannerScene;
- (id)_environmentForIdentifierCreateIfNecessary:(id)a3;
- (id)_keyWindowForScreen:(id)a3;
- (id)appBundleIDForScene:(id)a3;
- (id)sceneManager:(id)a3 createDefaultTransitionContextForScene:(id)a4;
- (void)_invalidateEnvironmentForIdentifierIfNecessary:(id)a3;
- (void)_sceneDidDidEnterBackground:(id)a3;
- (void)_sceneDidDisconnect:(id)a3;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)_updateRunningAssertionIfNecessary;
- (void)didConnectScene:(id)a3;
- (void)sceneManager:(id)a3 didCreateScene:(id)a4;
- (void)sceneManager:(id)a3 didDestroyScene:(id)a4;
- (void)sceneManager:(id)a3 scene:(id)a4 didReceiveActions:(id)a5;
- (void)sceneManager:(id)a3 updateForScene:(id)a4 appliedWithContext:(id)a5;
- (void)sceneManager:(id)a3 updateForScene:(id)a4 completedWithContext:(id)a5 error:(id)a6;
- (void)sceneManager:(id)a3 updateForScene:(id)a4 preparedWithContext:(id)a5;
- (void)sceneManager:(id)a3 willDestroyScene:(id)a4;
- (void)setActiveBannerScene:(id)a3;
- (void)setActiveWindow:(id)a3;
- (void)setConnection:(id)a3;
- (void)setIdentifierToEnvironmentMap:(id)a3;
- (void)setInstrumentClusterViewController:(id)a3;
- (void)setInstrumentClusterWindow:(id)a3;
- (void)setLargeDashboardWindow:(id)a3;
- (void)setMainWindow:(id)a3;
- (void)setManager:(id)a3;
- (void)setRunningAssertion:(id)a3;
- (void)setSessionStatus:(id)a3;
- (void)setSmallDashboardWindow:(id)a3;
@end

@implementation CARTemplateUIHostApplication

- (CARTemplateUIHostApplication)init
{
  v11.receiver = self;
  v11.super_class = (Class)CARTemplateUIHostApplication;
  v2 = [(CARTemplateUIHostApplication *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[FBSceneManager sharedInstance];
    manager = v2->_manager;
    v2->_manager = (FBSceneManager *)v3;

    [(FBSceneManager *)v2->_manager setDelegate:v2];
    uint64_t v5 = objc_opt_new();
    identifierToEnvironmentMap = v2->_identifierToEnvironmentMap;
    v2->_identifierToEnvironmentMap = (NSMutableDictionary *)v5;

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_sceneWillEnterForeground:" name:UISceneWillEnterForegroundNotification object:0];
    [v7 addObserver:v2 selector:"_sceneDidDidEnterBackground:" name:UISceneDidEnterBackgroundNotification object:0];
    [v7 addObserver:v2 selector:"_sceneDidDisconnect:" name:UISceneDidDisconnectNotification object:0];
    v8 = (CARSessionStatus *)[objc_alloc((Class)CARSessionStatus) initAndWaitUntilSessionUpdated];
    sessionStatus = v2->_sessionStatus;
    v2->_sessionStatus = v8;
  }
  return v2;
}

- (BOOL)_sceneSettingsIncludeSafeAreaInsets
{
  return 1;
}

- (void)sceneManager:(id)a3 scene:(id)a4 didReceiveActions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = [(CARTemplateUIHostApplication *)self appBundleIDForScene:v9];
  objc_super v11 = [(CARTemplateUIHostApplication *)self identifierToEnvironmentMap];
  v12 = [v11 objectForKeyedSubscript:v13];
  [v12 sceneManager:v10 scene:v9 didReceiveActions:v8];
}

- (id)sceneManager:(id)a3 createDefaultTransitionContextForScene:(id)a4
{
  return 0;
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(CARTemplateUIHostApplication *)self appBundleIDForScene:v6];
  id v8 = [(CARTemplateUIHostApplication *)self identifierToEnvironmentMap];
  id v9 = [v8 objectForKeyedSubscript:v10];
  [v9 sceneManager:v7 didCreateScene:v6];

  [(CARTemplateUIHostApplication *)self _updateRunningAssertionIfNecessary];
}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(CARTemplateUIHostApplication *)self appBundleIDForScene:v6];
  id v8 = [(CARTemplateUIHostApplication *)self identifierToEnvironmentMap];
  id v9 = [v8 objectForKeyedSubscript:v10];
  [v9 sceneManager:v7 willDestroyScene:v6];
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(CARTemplateUIHostApplication *)self appBundleIDForScene:v6];
  id v8 = [(CARTemplateUIHostApplication *)self identifierToEnvironmentMap];
  id v9 = [v8 objectForKeyedSubscript:v10];
  [v9 sceneManager:v7 didDestroyScene:v6];
}

- (void)_invalidateEnvironmentForIdentifierIfNecessary:(id)a3
{
  id v7 = a3;
  v4 = [(CARTemplateUIHostApplication *)self identifierToEnvironmentMap];
  uint64_t v5 = [v4 objectForKeyedSubscript:v7];

  if ([v5 canBeInvalidated])
  {
    [v5 invalidate];
    id v6 = [(CARTemplateUIHostApplication *)self identifierToEnvironmentMap];
    [v6 removeObjectForKey:v7];
  }
}

- (void)sceneManager:(id)a3 updateForScene:(id)a4 preparedWithContext:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "updateForScene: (%@) preparedWithContext: (%@)", (uint8_t *)&v9, 0x16u);
  }
}

- (void)sceneManager:(id)a3 updateForScene:(id)a4 appliedWithContext:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "updateForScene: (%@) appliedWithContext: (%@)", (uint8_t *)&v9, 0x16u);
  }
}

- (void)sceneManager:(id)a3 updateForScene:(id)a4 completedWithContext:(id)a5 error:(id)a6
{
  id v7 = a4;
  id v8 = a5;
  int v9 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "updateForScene: (%@) completedWithContext: (%@)", (uint8_t *)&v10, 0x16u);
  }
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v4 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "didFinishLaunching", v6, 2u);
  }

  return 1;
}

- (void)didConnectScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "didConnectScene: %@", buf, 0xCu);
  }

  objc_opt_class();
  id v6 = [v4 _FBSScene];
  id v7 = [v6 settings];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v4;
      int v10 = [v8 proxiedApplicationBundleIdentifier];
      id v11 = [(CARTemplateUIHostApplication *)self _environmentForIdentifierCreateIfNecessary:v10];
      [v11 instrumentClusterWindowSceneConnected:v9];
    }
  }
  objc_opt_class();
  __int16 v12 = [v4 _FBSScene];
  id v13 = [v12 settings];
  if (v13 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v4;
      v16 = [v14 proxiedApplicationBundleIdentifier];
      if ([v14 widgetStyle] == (id)1 || objc_msgSend(v14, "widgetStyle") == (id)2)
      {
        v17 = [(CARTemplateUIHostApplication *)self _environmentForIdentifierCreateIfNecessary:v16];
        [v17 setDashboardGuidanceWindowScene:v15];
      }
      else
      {
        if ([v14 widgetStyle] != (id)3) {
          goto LABEL_20;
        }
        v17 = [(CARTemplateUIHostApplication *)self _environmentForIdentifierCreateIfNecessary:v16];
        [v17 setDashboardMapWindowScene:v15];
      }

LABEL_20:
    }
  }
  objc_opt_class();
  v18 = [v4 _FBSScene];
  id v19 = [v18 settings];
  if (v19 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }

  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = v4;
      v22 = [v20 proxiedApplicationBundleIdentifier];
      v23 = [(CARTemplateUIHostApplication *)self instrumentClusterViewController];
      v24 = [v23 label];
      v25 = +[NSString stringWithFormat:@"You are using: %@", v22];
      [v24 setText:v25];

      v26 = [(CARTemplateUIHostApplication *)self instrumentClusterViewController];
      v27 = [v26 label];
      [v27 sizeToFit];

      v28 = [(CARTemplateUIHostApplication *)self _environmentForIdentifierCreateIfNecessary:v22];
      v29 = [(CARTemplateUIHostApplication *)self _environmentForIdentifierCreateIfNecessary:v22];
      [v29 setApplicationWindowScene:v21];

      [v28 prepare];
      v30 = +[CARPrototypePref fakeNeatlineDashboardSupport];
      LODWORD(v27) = [v30 valueBool];

      if (v27)
      {
        v31 = +[LSApplicationProxy applicationProxyForIdentifier:v22];
        id v37 = v21;
        if (qword_100025990 != -1) {
          dispatch_once(&qword_100025990, &stru_10001C3F0);
        }
        v36 = v31;
        v32 = [v31 objectsForInfoDictionaryKeys:qword_100025988];
        v33 = [v32 dictionaryForKey:@"UIApplicationSceneManifest"];
        v34 = [v33 objectForKey:@"CPSupportsDashboardNavigationScene"];
        unsigned __int8 v35 = [v34 BOOLValue];

        if ((v35 & 1) == 0) {
          [v28 fakeDashboardSupport];
        }

        id v21 = v37;
      }
    }
  }
}

- (id)_environmentForIdentifierCreateIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CARTemplateUIHostApplication *)self identifierToEnvironmentMap];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v6 = [[CARTemplateUIAppEnvironment alloc] initWithBundleIdentifier:v4];
    id v7 = [(CARTemplateUIHostApplication *)self identifierToEnvironmentMap];
    [v7 setObject:v6 forKeyedSubscript:v4];
  }

  return v6;
}

- (id)appBundleIDForScene:(id)a3
{
  uint64_t v3 = [a3 clientProcess];
  id v4 = [v3 bundleIdentifier];

  return v4;
}

- (void)_sceneWillEnterForeground:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  uint64_t v5 = [v4 _FBSScene];
  id v6 = [v5 settings];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  objc_opt_class();
  id v8 = [v4 _FBSScene];
  id v9 = [v8 settings];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (v7)
  {
    id v11 = [v7 proxiedApplicationBundleIdentifier];
    if (v11)
    {
      __int16 v12 = [(CARTemplateUIHostApplication *)self instrumentClusterViewController];

      if (v12)
      {
        id v13 = [(CARTemplateUIHostApplication *)self instrumentClusterViewController];
        id v14 = [v13 label];
        id v15 = +[NSString stringWithFormat:@"You are using: %@", v11];
        [v14 setText:v15];

        v16 = [(CARTemplateUIHostApplication *)self instrumentClusterViewController];
        v17 = [v16 label];
        [v17 sizeToFit];

        v18 = [(CARTemplateUIHostApplication *)self sessionStatus];
        id v19 = [v18 currentSession];
        id v20 = +[NSURL URLWithString:@"maps:"];
        v29 = v20;
        id v21 = +[NSArray arrayWithObjects:&v29 count:1];
        [v19 suggestUI:v21];
      }
      v22 = sub_10000A174(5uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Scene entering foreground for client: %@", buf, 0xCu);
      }

      v23 = [(CARTemplateUIHostApplication *)self identifierToEnvironmentMap];
      v24 = [v23 objectForKeyedSubscript:v11];

      v25 = [v24 applicationWindow];
      [(CARTemplateUIHostApplication *)self setActiveWindow:v25];
    }
LABEL_22:

    goto LABEL_23;
  }
  v26 = sub_10000A174(5uLL);
  id v11 = v26;
  if (!v10)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000119A4();
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Banner scene entering foreground: %@", buf, 0xCu);
  }

  [(CARTemplateUIHostApplication *)self setActiveBannerScene:v4];
LABEL_23:
}

- (void)_sceneDidDidEnterBackground:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    id v21 = sub_1000060F0;
    v22 = sub_100006100;
    id v23 = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = sub_1000060F0;
    v16[4] = sub_100006100;
    id v17 = 0;
    id v7 = [(CARTemplateUIHostApplication *)self identifierToEnvironmentMap];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100006108;
    v12[3] = &unk_10001C418;
    id v13 = v6;
    id v14 = &v18;
    id v15 = v16;
    [v7 enumerateKeysAndObjectsUsingBlock:v12];

    id v8 = (void *)v19[5];
    if (v8)
    {
      id v9 = [v8 applicationWindow];
      id v10 = [(CARTemplateUIHostApplication *)self activeWindow];

      if (v9 == v10) {
        [(CARTemplateUIHostApplication *)self setActiveWindow:0];
      }
    }
    else
    {
      id v11 = sub_10000A174(5uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100011A0C();
      }
    }
    _Block_object_dispose(v16, 8);

    _Block_object_dispose(&v18, 8);
  }
}

- (void)_sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  id v6 = v5;
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_1000060F0;
  unsigned __int8 v35 = sub_100006100;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1000060F0;
  v29 = sub_100006100;
  id v30 = 0;
  id v8 = [(CARTemplateUIHostApplication *)self identifierToEnvironmentMap];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000661C;
  v21[3] = &unk_10001C418;
  id v9 = v7;
  id v22 = v9;
  id v23 = &v31;
  v24 = &v25;
  [v8 enumerateKeysAndObjectsUsingBlock:v21];

  id v10 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)v26[5];
    __int16 v12 = (void *)v32[5];
    *(_DWORD *)buf = 138412546;
    id v38 = v11;
    __int16 v39 = 2112;
    id v40 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Scene did disconnect for identifier: %@, env: %@", buf, 0x16u);
  }

  if (v32[5])
  {
    id v13 = sub_10000A174(5uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (void *)v32[5];
      *(_DWORD *)buf = 138543618;
      id v38 = v14;
      __int16 v39 = 2114;
      id v40 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Environment %{public}@ will invalidate windowScene: %{public}@", buf, 0x16u);
    }

    [(id)v32[5] invalidateWindowScene:v9];
    [(CARTemplateUIHostApplication *)self _invalidateEnvironmentForIdentifierIfNecessary:v26[5]];
    goto LABEL_20;
  }
  id v15 = [(CARTemplateUIHostApplication *)self activeBannerScene];
  if (v6 != v15)
  {

LABEL_17:
    uint64_t v20 = sub_10000A174(5uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Other scene disconnected: %@", buf, 0xCu);
    }

    goto LABEL_20;
  }
  v16 = [v6 _FBSScene];
  id v17 = [v16 settings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_17;
  }
  id v19 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Banner scene disconnected: %@", buf, 0xCu);
  }

  [(CARTemplateUIHostApplication *)self setActiveBannerScene:0];
LABEL_20:
  [(CARTemplateUIHostApplication *)self _updateRunningAssertionIfNecessary];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

- (id)_keyWindowForScreen:(id)a3
{
  id v4 = [(CARTemplateUIHostApplication *)self activeWindow];
  uint64_t v5 = [v4 windowScene];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(CARTemplateUIHostApplication *)self activeWindow];
    id v8 = [v7 windowScene];
    id v9 = [v8 activationState];

    if (!v9)
    {
      id v10 = [(CARTemplateUIHostApplication *)self activeWindow];
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v11 = [(CARTemplateUIHostApplication *)self activeBannerScene];

  if (v11)
  {
    __int16 v12 = [(CARTemplateUIHostApplication *)self activeBannerScene];
    id v13 = [v12 windows];
    id v10 = [v13 firstObject];
  }
  else
  {
    id v10 = 0;
  }
LABEL_8:

  return v10;
}

- (void)_updateRunningAssertionIfNecessary
{
  uint64_t v3 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Updating running assertion", buf, 2u);
  }

  id v4 = [(CARTemplateUIHostApplication *)self identifierToEnvironmentMap];
  id v5 = [v4 count];

  id v6 = [(CARTemplateUIHostApplication *)self runningAssertion];
  id v7 = v6;
  if (v5)
  {

    if (v7) {
      return;
    }
    id v8 = sub_10000A174(5uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Acquiring running assertion", buf, 2u);
    }

    id v9 = +[RBSRunningReasonAttribute withReason:10005];
    v27[0] = v9;
    id v10 = +[RBSCPUAccessGrant grantWithUserInteractivity];
    v27[1] = v10;
    id v11 = +[RBSJetsamPriorityGrant grantWithForegroundPriority];
    v27[2] = v11;
    __int16 v12 = +[RBSResistTerminationGrant grantWithResistance:40];
    v27[3] = v12;
    id v13 = +[NSArray arrayWithObjects:v27 count:4];

    id v14 = objc_alloc((Class)RBSAssertion);
    id v15 = +[RBSTarget currentProcess];
    id v16 = [v14 initWithExplanation:@"CarPlayTemplateUIHost" target:v15 attributes:v13];
    [(CARTemplateUIHostApplication *)self setRunningAssertion:v16];

    id v17 = [(CARTemplateUIHostApplication *)self runningAssertion];
    id v25 = 0;
    [v17 acquireWithError:&v25];
    uint64_t v18 = v25;

    id v19 = sub_10000A174(5uLL);
    uint64_t v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100011ADC();
      }

      [(CARTemplateUIHostApplication *)self setRunningAssertion:0];
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Successfully acquired running assertion", buf, 2u);
      }
    }
  }
  else
  {

    if (!v7) {
      return;
    }
    id v21 = sub_10000A174(5uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Invalidating running assertion", buf, 2u);
    }

    id v22 = [(CARTemplateUIHostApplication *)self runningAssertion];
    id v24 = 0;
    [v22 invalidateWithError:&v24];
    id v13 = v24;

    [(CARTemplateUIHostApplication *)self setRunningAssertion:0];
    id v23 = sub_10000A174(5uLL);
    uint64_t v18 = v23;
    if (v13)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100011A74();
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Successfully invalidated running assertion", buf, 2u);
    }
  }
}

- (UIWindow)mainWindow
{
  return self->_mainWindow;
}

- (void)setMainWindow:(id)a3
{
}

- (FBSceneManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (NSMutableDictionary)identifierToEnvironmentMap
{
  return self->_identifierToEnvironmentMap;
}

- (void)setIdentifierToEnvironmentMap:(id)a3
{
}

- (UIWindow)activeWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindow);

  return (UIWindow *)WeakRetained;
}

- (void)setActiveWindow:(id)a3
{
}

- (UIWindowScene)activeBannerScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeBannerScene);

  return (UIWindowScene *)WeakRetained;
}

- (void)setActiveBannerScene:(id)a3
{
}

- (CRSUIClusterWindow)instrumentClusterWindow
{
  return self->_instrumentClusterWindow;
}

- (void)setInstrumentClusterWindow:(id)a3
{
}

- (CRSUIDashboardWidgetWindow)smallDashboardWindow
{
  return self->_smallDashboardWindow;
}

- (void)setSmallDashboardWindow:(id)a3
{
}

- (CRSUIDashboardWidgetWindow)largeDashboardWindow
{
  return self->_largeDashboardWindow;
}

- (void)setLargeDashboardWindow:(id)a3
{
}

- (CARTemplateUIHostInstrumentClusterViewController)instrumentClusterViewController
{
  return self->_instrumentClusterViewController;
}

- (void)setInstrumentClusterViewController:(id)a3
{
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (RBSAssertion)runningAssertion
{
  return self->_runningAssertion;
}

- (void)setRunningAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningAssertion, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_instrumentClusterViewController, 0);
  objc_storeStrong((id *)&self->_largeDashboardWindow, 0);
  objc_storeStrong((id *)&self->_smallDashboardWindow, 0);
  objc_storeStrong((id *)&self->_instrumentClusterWindow, 0);
  objc_destroyWeak((id *)&self->_activeBannerScene);
  objc_destroyWeak((id *)&self->_activeWindow);
  objc_storeStrong((id *)&self->_identifierToEnvironmentMap, 0);
  objc_storeStrong((id *)&self->_manager, 0);

  objc_storeStrong((id *)&self->_mainWindow, 0);
}

@end