@interface CARTemplateUIAppEnvironment
- (BOOL)canBeInvalidated;
- (BOOL)fakesDashboardSupport;
- (BOOL)ownsWindowScene:(id)a3;
- (CARTemplateUIAppEnvironment)initWithBundleIdentifier:(id)a3;
- (CARTemplateUIApplicationSceneViewController)appViewController;
- (CARTemplateUIDashboardSceneViewController)mapWidgetViewController;
- (CPSDashboardGuidanceViewController)guidanceWidgetViewController;
- (CPSTemplateInstance)templateInstance;
- (CPSWindow)applicationWindow;
- (CRSUIDashboardWidgetWindow)dashboardGuidanceWindow;
- (CRSUIDashboardWidgetWindow)dashboardMapWindow;
- (NSArray)instrumentClusterWindowScenes;
- (NSMutableArray)internalInstrumentClusterWindowScenes;
- (NSMutableDictionary)instrumentClusterViewControllers;
- (NSMutableDictionary)instrumentClusterWindows;
- (NSString)bundleIdentifier;
- (UILabel)fakeSupportLabel;
- (UIScenePresentation)fakeSceneHostView;
- (UIScenePresenter)fakeScenePresenter;
- (UIView)fakeSceneHostSnapshotView;
- (UIWindowScene)applicationWindowScene;
- (UIWindowScene)dashboardGuidanceWindowScene;
- (UIWindowScene)dashboardMapWindowScene;
- (UIWindowScene)windowScene;
- (void)_invalidateDashboardGuidanceScene;
- (void)_invalidateDashboardMapScene;
- (void)_invalidateInstrumentClusterWindowScene:(id)a3;
- (void)_sceneDidDidEnterBackground:(id)a3;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)_showFakeSupportLabelIfNecessary;
- (void)fakeDashboardSupport;
- (void)instrumentClusterWindowSceneConnected:(id)a3;
- (void)invalidate;
- (void)invalidateApplicationScene;
- (void)invalidateWindowScene:(id)a3;
- (void)prepare;
- (void)sceneManager:(id)a3 didCreateScene:(id)a4;
- (void)sceneManager:(id)a3 didDestroyScene:(id)a4;
- (void)sceneManager:(id)a3 scene:(id)a4 didReceiveActions:(id)a5;
- (void)sceneManager:(id)a3 willDestroyScene:(id)a4;
- (void)setAppViewController:(id)a3;
- (void)setApplicationWindow:(id)a3;
- (void)setApplicationWindowScene:(id)a3;
- (void)setDashboardGuidanceWindow:(id)a3;
- (void)setDashboardGuidanceWindowScene:(id)a3;
- (void)setDashboardMapWindow:(id)a3;
- (void)setDashboardMapWindowScene:(id)a3;
- (void)setFakeSceneHostSnapshotView:(id)a3;
- (void)setFakeSceneHostView:(id)a3;
- (void)setFakeScenePresenter:(id)a3;
- (void)setFakeSupportLabel:(id)a3;
- (void)setFakesDashboardSupport:(BOOL)a3;
- (void)setGuidanceWidgetViewController:(id)a3;
- (void)setInstrumentClusterViewControllers:(id)a3;
- (void)setInstrumentClusterWindows:(id)a3;
- (void)setInternalInstrumentClusterWindowScenes:(id)a3;
- (void)setMapWidgetViewController:(id)a3;
- (void)setTemplateInstance:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation CARTemplateUIAppEnvironment

- (CARTemplateUIAppEnvironment)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CARTemplateUIAppEnvironment;
  v5 = [(CARTemplateUIAppEnvironment *)&v11 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v6;

    v8 = (CPSTemplateInstance *)[objc_alloc((Class)CPSTemplateInstance) initWithBundleIdentifier:v4];
    templateInstance = v5->_templateInstance;
    v5->_templateInstance = v8;
  }
  return v5;
}

- (void)setApplicationWindowScene:(id)a3
{
  id v24 = a3;
  objc_storeStrong((id *)&self->_applicationWindowScene, a3);
  [(CPSTemplateInstance *)self->_templateInstance setWindowSceneForTemplateApplicationScene:self->_applicationWindowScene];
  v5 = [v24 _FBSScene];
  id v6 = objc_alloc((Class)CPSWindow);
  v7 = [v5 settings];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v5 identifier];
  v17 = (CPSWindow *)objc_msgSend(v6, "_initWithFrame:debugName:windowScene:", v16, self->_applicationWindowScene, v9, v11, v13, v15);
  applicationWindow = self->_applicationWindow;
  self->_applicationWindow = v17;

  [(CPSWindow *)self->_applicationWindow setHidden:0];
  [(CPSWindow *)self->_applicationWindow makeKeyWindow];
  objc_opt_class();
  id v19 = [v5 settings];
  if (v19 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }

  v21 = [v20 proxiedApplicationBundleIdentifier];
  [(CPSWindow *)self->_applicationWindow setAccessibilityLabel:v21];

  v22 = [[CARTemplateUIApplicationSceneViewController alloc] initWithWindowScene:self->_applicationWindowScene templateInstance:self->_templateInstance];
  appViewController = self->_appViewController;
  self->_appViewController = v22;

  [(CPSWindow *)self->_applicationWindow setRootViewController:self->_appViewController];
}

- (void)setDashboardMapWindowScene:(id)a3
{
  id v40 = a3;
  objc_storeStrong((id *)&self->_dashboardMapWindowScene, a3);
  v5 = [(CARTemplateUIAppEnvironment *)self templateInstance];
  [v5 setWindowSceneForMapWidgetScene:self->_dashboardMapWindowScene];

  dashboardMapWindow = self->_dashboardMapWindow;
  if (dashboardMapWindow) {
    [(CRSUIDashboardWidgetWindow *)dashboardMapWindow invalidate];
  }
  id v7 = objc_alloc((Class)CRSUIDashboardWidgetWindow);
  double v8 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindowScene];
  id v9 = [v7 initWithWindowScene:v8];

  [v9 setHidden:0];
  double v10 = [CARTemplateUIDashboardSceneViewController alloc];
  dashboardMapWindowScene = self->_dashboardMapWindowScene;
  templateInstance = self->_templateInstance;
  double v13 = [(CARTemplateUIAppEnvironment *)self bundleIdentifier];
  double v14 = [(CARTemplateUISceneViewController *)v10 initWithWindowScene:dashboardMapWindowScene templateInstance:templateInstance bundleIdentifier:v13];
  mapWidgetViewController = self->_mapWidgetViewController;
  self->_mapWidgetViewController = v14;

  [v9 setRootViewController:self->_mapWidgetViewController];
  [v9 makeKeyWindow];
  v16 = self->_mapWidgetViewController;
  v17 = [(CARTemplateUIAppEnvironment *)self templateInstance];
  v18 = [v17 dashboardEstimatesViewController];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10000F5E4;
  v41[3] = &unk_10001C6E8;
  v41[4] = self;
  [(CARTemplateUIDashboardSceneViewController *)v16 bs_addChildViewController:v18 animated:0 transitionBlock:v41];

  id v19 = objc_alloc_init((Class)UIView);
  id v20 = [v19 layer];
  [v20 setHitTestsAsOpaque:1];

  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 addSubview:v19];
  v39 = [v19 topAnchor];
  v38 = [v9 topAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v46[0] = v37;
  v36 = [v19 leftAnchor];
  v35 = [v9 leftAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v46[1] = v34;
  v21 = [v19 rightAnchor];
  v22 = [v9 rightAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v46[2] = v23;
  id v24 = [v19 bottomAnchor];
  v25 = [v9 bottomAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v46[3] = v26;
  v27 = +[NSArray arrayWithObjects:v46 count:4];
  +[NSLayoutConstraint activateConstraints:v27];

  BOOL v28 = 1;
  v29 = self->_dashboardMapWindow;
  self->_dashboardMapWindow = (CRSUIDashboardWidgetWindow *)v9;
  id v30 = v9;

  [(CARTemplateUIAppEnvironment *)self _showFakeSupportLabelIfNecessary];
  if ([v40 activationState] != (id)1) {
    BOOL v28 = [v40 activationState] == 0;
  }
  v31 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = NSStringFromBOOL();
    v33 = [(CARTemplateUIAppEnvironment *)self bundleIdentifier];
    *(_DWORD *)buf = 138543618;
    v43 = v32;
    __int16 v44 = 2114;
    v45 = v33;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Sending scene update with foreground: %{public}@ for bundle identifier: %{public}@", buf, 0x16u);
  }
  [(CARTemplateUISceneViewController *)self->_mapWidgetViewController sendSceneUpdate:v28 openURLContexts:0];
}

- (void)setDashboardGuidanceWindowScene:(id)a3
{
  id v16 = a3;
  objc_storeStrong((id *)&self->_dashboardGuidanceWindowScene, a3);
  v5 = [(CARTemplateUIAppEnvironment *)self templateInstance];
  [v5 setWindowSceneForGuidanceWidgetScene:self->_dashboardGuidanceWindowScene];

  dashboardGuidanceWindow = self->_dashboardGuidanceWindow;
  if (dashboardGuidanceWindow) {
    [(CRSUIDashboardWidgetWindow *)dashboardGuidanceWindow invalidate];
  }
  id v7 = objc_alloc((Class)CRSUIDashboardWidgetWindow);
  double v8 = [(CARTemplateUIAppEnvironment *)self dashboardGuidanceWindowScene];
  id v9 = [v7 initWithWindowScene:v8];

  [v9 setHidden:0];
  [v9 makeKeyWindow];
  double v10 = self->_dashboardGuidanceWindow;
  self->_dashboardGuidanceWindow = (CRSUIDashboardWidgetWindow *)v9;
  id v11 = v9;

  double v12 = [(CARTemplateUIAppEnvironment *)self templateInstance];
  double v13 = [v12 dashboardGuidanceViewController];
  [v11 setRootViewController:v13];

  double v14 = [(CARTemplateUIAppEnvironment *)self templateInstance];
  double v15 = [v14 dashboardGuidanceViewController];
  [v15 setContentReadyIfNecessary];
}

- (void)prepare
{
  id v2 = [(CARTemplateUIAppEnvironment *)self appViewController];
  [v2 sendSceneUpdate:0 openURLContexts:0];
}

- (void)instrumentClusterWindowSceneConnected:(id)a3
{
  id v4 = a3;
  internalInstrumentClusterWindowScenes = self->_internalInstrumentClusterWindowScenes;
  id v23 = v4;
  if (!internalInstrumentClusterWindowScenes)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_internalInstrumentClusterWindowScenes;
    self->_internalInstrumentClusterWindowScenes = v6;

    id v4 = v23;
    internalInstrumentClusterWindowScenes = self->_internalInstrumentClusterWindowScenes;
  }
  [(NSMutableArray *)internalInstrumentClusterWindowScenes addObject:v4];
  if (!self->_instrumentClusterWindows)
  {
    double v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    instrumentClusterWindows = self->_instrumentClusterWindows;
    self->_instrumentClusterWindows = v8;
  }
  double v10 = [v23 _FBSScene];
  id v11 = [v10 settings];
  double v12 = [v11 displayConfiguration];

  double v13 = [v12 hardwareIdentifier];
  id v14 = [objc_alloc((Class)CRSUIClusterWindow) initWithWindowScene:v23];
  double v15 = [(CARTemplateUIAppEnvironment *)self instrumentClusterWindows];
  [v15 setObject:v14 forKey:v13];

  id v16 = [CARTemplateUIHostInstrumentClusterViewController alloc];
  v17 = [(CARTemplateUIAppEnvironment *)self templateInstance];
  v18 = [(CARTemplateUIAppEnvironment *)self bundleIdentifier];
  id v19 = [(CARTemplateUIHostInstrumentClusterViewController *)v16 initWithWindowScene:v23 templateInstance:v17 bundleIdentifier:v18];

  [v14 setRootViewController:v19];
  [v14 addClusterSettingsObserver:v19];
  if (!self->_instrumentClusterViewControllers)
  {
    id v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    instrumentClusterViewControllers = self->_instrumentClusterViewControllers;
    self->_instrumentClusterViewControllers = v20;
  }
  v22 = [(CARTemplateUIAppEnvironment *)self instrumentClusterViewControllers];
  [v22 setObject:v19 forKey:v13];

  [v14 makeKeyAndVisible];
}

- (NSArray)instrumentClusterWindowScenes
{
  id v2 = [(NSMutableArray *)self->_internalInstrumentClusterWindowScenes copy];

  return (NSArray *)v2;
}

- (BOOL)ownsWindowScene:(id)a3
{
  id v4 = a3;
  id v5 = [(CARTemplateUIAppEnvironment *)self applicationWindowScene];
  if (v5 == v4)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    id v6 = [(CARTemplateUIAppEnvironment *)self dashboardGuidanceWindowScene];
    if (v6 == v4)
    {
      unsigned __int8 v9 = 1;
    }
    else
    {
      id v7 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindowScene];
      if (v7 == v4)
      {
        unsigned __int8 v9 = 1;
      }
      else
      {
        double v8 = [(CARTemplateUIAppEnvironment *)self instrumentClusterWindowScenes];
        unsigned __int8 v9 = [v8 containsObject:v4];
      }
    }
  }
  return v9;
}

- (void)invalidateWindowScene:(id)a3
{
  id v9 = a3;
  id v4 = [(CARTemplateUIAppEnvironment *)self applicationWindowScene];

  if (v4 == v9) {
    [(CARTemplateUIAppEnvironment *)self invalidateApplicationScene];
  }
  id v5 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindowScene];

  if (v5 == v9) {
    [(CARTemplateUIAppEnvironment *)self _invalidateDashboardMapScene];
  }
  id v6 = [(CARTemplateUIAppEnvironment *)self dashboardGuidanceWindowScene];

  if (v6 == v9) {
    [(CARTemplateUIAppEnvironment *)self _invalidateDashboardGuidanceScene];
  }
  id v7 = [(CARTemplateUIAppEnvironment *)self instrumentClusterWindowScenes];
  unsigned int v8 = [v7 containsObject:v9];

  if (v8) {
    [(CARTemplateUIAppEnvironment *)self _invalidateInstrumentClusterWindowScene:v9];
  }
}

- (void)invalidate
{
  id v2 = [(CARTemplateUIAppEnvironment *)self templateInstance];
  [v2 invalidate];
}

- (void)invalidateApplicationScene
{
  v3 = [(CARTemplateUIAppEnvironment *)self appViewController];
  id v4 = [v3 scene];
  id v5 = [v4 identifier];

  if (v5)
  {
    id v6 = [(CARTemplateUIAppEnvironment *)self appViewController];
    id v7 = [v6 scene];
    [v7 updateSettingsWithBlock:&stru_10001C728];

    unsigned int v8 = +[FBSceneManager sharedInstance];
    id v9 = [(CARTemplateUIAppEnvironment *)self appViewController];
    double v10 = [v9 scene];
    id v11 = [v10 identifier];
    [v8 destroyScene:v11 withTransitionContext:0];
  }
  applicationWindowScene = self->_applicationWindowScene;
  self->_applicationWindowScene = 0;
}

- (void)_invalidateDashboardMapScene
{
  v3 = [(CARTemplateUIAppEnvironment *)self mapWidgetViewController];
  [v3 invalidate];

  id v4 = [(CARTemplateUIAppEnvironment *)self mapWidgetViewController];
  id v5 = [v4 scene];
  id v6 = [v5 identifier];

  if (v6)
  {
    id v7 = [(CARTemplateUIAppEnvironment *)self mapWidgetViewController];
    unsigned int v8 = [v7 scene];
    [v8 updateSettingsWithBlock:&stru_10001C748];

    id v9 = +[FBSceneManager sharedInstance];
    double v10 = [(CARTemplateUIAppEnvironment *)self mapWidgetViewController];
    id v11 = [v10 scene];
    double v12 = [v11 identifier];
    [v9 destroyScene:v12 withTransitionContext:0];
  }
  [(CRSUIDashboardWidgetWindow *)self->_dashboardMapWindow invalidate];
  [(CRSUIDashboardWidgetWindow *)self->_dashboardMapWindow setRootViewController:0];
  dashboardMapWindow = self->_dashboardMapWindow;
  self->_dashboardMapWindow = 0;

  dashboardMapWindowScene = self->_dashboardMapWindowScene;
  self->_dashboardMapWindowScene = 0;
}

- (void)_invalidateDashboardGuidanceScene
{
  [(CRSUIDashboardWidgetWindow *)self->_dashboardGuidanceWindow invalidate];
  [(CRSUIDashboardWidgetWindow *)self->_dashboardGuidanceWindow setRootViewController:0];
  dashboardGuidanceWindow = self->_dashboardGuidanceWindow;
  self->_dashboardGuidanceWindow = 0;

  dashboardGuidanceWindowScene = self->_dashboardGuidanceWindowScene;
  self->_dashboardGuidanceWindowScene = 0;
}

- (void)_invalidateInstrumentClusterWindowScene:(id)a3
{
  id v23 = a3;
  objc_opt_class();
  id v4 = [v23 _FBSScene];
  id v5 = [v4 settings];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    id v7 = [v6 displayConfiguration];
    unsigned int v8 = [v7 hardwareIdentifier];
    id v9 = [(CARTemplateUIAppEnvironment *)self instrumentClusterViewControllers];
    double v10 = [v9 objectForKey:v8];

    id v11 = [(CARTemplateUIAppEnvironment *)self instrumentClusterViewControllers];
    [v11 removeObjectForKey:v8];

    double v12 = [v10 scene];
    double v13 = [v12 identifier];

    if (v13)
    {
      id v14 = [v10 scene];
      [v14 updateSettingsWithBlock:&stru_10001C768];

      double v15 = +[FBSceneManager sharedInstance];
      id v16 = [v10 scene];
      v17 = [v16 identifier];
      [v15 destroyScene:v17 withTransitionContext:0];
    }
    [v10 invalidate];
    v18 = [(CARTemplateUIAppEnvironment *)self instrumentClusterWindows];
    [v18 removeObjectForKey:v8];

    id v19 = [(CARTemplateUIAppEnvironment *)self internalInstrumentClusterWindowScenes];
    [v19 removeObject:v23];
  }
  id v20 = [(CARTemplateUIAppEnvironment *)self internalInstrumentClusterWindowScenes];
  id v21 = [v20 count];

  if (!v21)
  {
    internalInstrumentClusterWindowScenes = self->_internalInstrumentClusterWindowScenes;
    self->_internalInstrumentClusterWindowScenes = 0;
  }
}

- (void)sceneManager:(id)a3 scene:(id)a4 didReceiveActions:(id)a5
{
  id v5 = a5;
  id v6 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "didReceiveActions: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v5 = a4;
  id v6 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v23 = 138412290;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "didCreateScene: %@", (uint8_t *)&v23, 0xCu);
  }

  int v7 = [v5 clientProcess];
  unsigned int v8 = [v7 pid];
  pid_t v9 = getpid();

  if (v8 != v9)
  {
    double v10 = sub_10000A174(5uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      id v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "presenting the scene: %@", (uint8_t *)&v23, 0xCu);
    }

    objc_opt_class();
    id v11 = [v5 settings];
    if (v11 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    objc_opt_class();
    id v13 = [v5 settings];
    if (v13 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    objc_opt_class();
    id v15 = [v5 settings];
    if (v15 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    if (v12)
    {
      v17 = [(CARTemplateUIAppEnvironment *)self appViewController];
      [v17 setScene:v5];
    }
    else
    {
      if (v14)
      {
        v18 = [(CARTemplateUIAppEnvironment *)self mapWidgetViewController];
        [v18 setScene:v5];

        [(CARTemplateUIAppEnvironment *)self _showFakeSupportLabelIfNecessary];
        goto LABEL_25;
      }
      if (v16)
      {
        id v19 = [v16 displayConfiguration];
        id v20 = [v19 hardwareIdentifier];
        id v21 = [(CARTemplateUIAppEnvironment *)self instrumentClusterViewControllers];
        v22 = [v21 objectForKey:v20];

        [v22 setScene:v5];
        goto LABEL_25;
      }
      v17 = sub_10000A174(5uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100011BE8((uint64_t)v5, v17);
      }
    }

LABEL_25:
  }
}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
  id v5 = a4;
  id v6 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "willDestroyScene: %@. Invalidating associated view controller", buf, 0xCu);
  }

  int v7 = [(CARTemplateUIAppEnvironment *)self instrumentClusterViewControllers];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100010A30;
  v19[3] = &unk_10001C790;
  id v8 = v5;
  id v20 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v19];

  pid_t v9 = [(CARTemplateUIAppEnvironment *)self appViewController];
  id v10 = [v9 scene];

  if (v10 == v8)
  {
    id v11 = sub_10000A174(5uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(CARTemplateUIAppEnvironment *)self appViewController];
      *(_DWORD *)buf = 138412290;
      id v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Invalidating app view controller: %@", buf, 0xCu);
    }
    id v13 = [(CARTemplateUIAppEnvironment *)self appViewController];
    [v13 invalidate];
  }
  id v14 = [(CARTemplateUIAppEnvironment *)self mapWidgetViewController];
  id v15 = [v14 scene];

  if (v15 == v8)
  {
    id v16 = sub_10000A174(5uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(CARTemplateUIAppEnvironment *)self mapWidgetViewController];
      *(_DWORD *)buf = 138412290;
      id v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Invalidating map widget view controller: %@", buf, 0xCu);
    }
    v18 = [(CARTemplateUIAppEnvironment *)self mapWidgetViewController];
    [v18 invalidate];
  }
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  id v5 = a4;
  id v6 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "didDestroyScene: %@", (uint8_t *)&v13, 0xCu);
  }

  int v7 = [(CARTemplateUIAppEnvironment *)self appViewController];
  id v8 = [v7 scene];

  if (v8 == v5)
  {
    pid_t v9 = [(CARTemplateUIAppEnvironment *)self appViewController];
    [v9 setScene:0];
  }
  id v10 = [(CARTemplateUIAppEnvironment *)self mapWidgetViewController];
  id v11 = [v10 scene];

  if (v11 == v5)
  {
    id v12 = [(CARTemplateUIAppEnvironment *)self mapWidgetViewController];
    [v12 setScene:0];
  }
}

- (BOOL)canBeInvalidated
{
  v3 = [(CARTemplateUIAppEnvironment *)self dashboardGuidanceWindowScene];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindowScene];
    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      id v6 = [(CARTemplateUIAppEnvironment *)self applicationWindowScene];
      if (v6)
      {
        BOOL v4 = 0;
      }
      else
      {
        int v7 = [(CARTemplateUIAppEnvironment *)self instrumentClusterWindowScenes];
        if ([v7 count])
        {
          id v8 = [(CARTemplateUIAppEnvironment *)self instrumentClusterWindowScenes];
          BOOL v4 = v8 == 0;
        }
        else
        {
          BOOL v4 = 1;
        }
      }
    }
  }
  return v4;
}

- (void)fakeDashboardSupport
{
  [(CARTemplateUIAppEnvironment *)self setFakesDashboardSupport:1];
  id v7 = +[NSNotificationCenter defaultCenter];
  v3 = [(CARTemplateUIAppEnvironment *)self applicationWindowScene];
  [v7 addObserver:self selector:"_sceneWillEnterForeground:" name:UISceneWillEnterForegroundNotification object:v3];

  BOOL v4 = [(CARTemplateUIAppEnvironment *)self applicationWindowScene];
  [v7 addObserver:self selector:"_sceneDidDidEnterBackground:" name:UISceneDidEnterBackgroundNotification object:v4];

  [(CARTemplateUIAppEnvironment *)self _showFakeSupportLabelIfNecessary];
  id v5 = [(CARTemplateUIAppEnvironment *)self templateInstance];
  id v6 = [v5 dashboardGuidanceViewController];
  [v6 setFakesDashboardSupport:1];
}

- (void)_showFakeSupportLabelIfNecessary
{
  if ([(CARTemplateUIAppEnvironment *)self fakesDashboardSupport])
  {
    v3 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindow];

    if (v3)
    {
      id v4 = [(CARTemplateUIAppEnvironment *)self fakeSupportLabel];
      if (!v4)
      {
        id v4 = objc_alloc_init((Class)UILabel);
        [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v4 setText:@"Only file bugs on maneuver card layout"];
        [v4 sizeToFit];
        [v4 setNumberOfLines:0];
        id v5 = +[UIColor labelColor];
        [v4 setTextColor:v5];

        [v4 setTextAlignment:1];
        objc_storeStrong((id *)&self->_fakeSupportLabel, v4);
      }
      id v6 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindow];
      unsigned __int8 v7 = [v4 isDescendantOfView:v6];

      if ((v7 & 1) == 0)
      {
        id v8 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindow];
        [v8 addSubview:v4];

        id v21 = [v4 leadingAnchor];
        id v22 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindow];
        id v20 = [v22 leadingAnchor];
        id v19 = [v21 constraintEqualToAnchor:v20 constant:8.0];
        v23[0] = v19;
        v18 = [v4 trailingAnchor];
        pid_t v9 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindow];
        id v10 = [v9 trailingAnchor];
        id v11 = [v18 constraintEqualToAnchor:v10 constant:-8.0];
        v23[1] = v11;
        id v12 = [v4 topAnchor];
        int v13 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindow];
        id v14 = [v13 topAnchor];
        id v15 = [v12 constraintEqualToAnchor:v14 constant:8.0];
        v23[2] = v15;
        id v16 = +[NSArray arrayWithObjects:v23 count:3];
        +[NSLayoutConstraint activateConstraints:v16];
      }
      v17 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindow];
      [v17 bringSubviewToFront:v4];
    }
  }
}

- (void)_sceneWillEnterForeground:(id)a3
{
  id v4 = [(CARTemplateUIAppEnvironment *)self fakeScenePresenter];
  [v4 invalidate];

  id v5 = [(CARTemplateUIAppEnvironment *)self fakeSceneHostView];
  [v5 removeFromSuperview];

  id v6 = [(CARTemplateUIAppEnvironment *)self appViewController];
  unsigned __int8 v7 = [v6 scene];
  id v19 = [v7 snapshotContext];

  id v8 = [(CARTemplateUIAppEnvironment *)self fakeSceneHostView];
  [v8 frame];
  objc_msgSend(v19, "setFrame:");

  pid_t v9 = [(CARTemplateUIAppEnvironment *)self appViewController];
  id v10 = [v9 scene];
  id v11 = [v10 createSnapshotWithContext:v19];

  [v11 capture];
  id v12 = [(CARTemplateUIAppEnvironment *)self appViewController];
  int v13 = [v12 scene];
  id v14 = [v13 uiPresentationManager];
  id v15 = [v14 snapshotPresentationForSnapshot:v11];

  [(CARTemplateUIAppEnvironment *)self setFakeSceneHostSnapshotView:v15];
  id v16 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindow];
  v17 = [v16 rootViewController];
  v18 = [v17 view];
  [v18 addSubview:v15];
}

- (void)_sceneDidDidEnterBackground:(id)a3
{
  uint64_t v4 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindow];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(CARTemplateUIAppEnvironment *)self appViewController];
    unsigned __int8 v7 = [v6 scene];

    if (v7)
    {
      id v8 = [(CARTemplateUIAppEnvironment *)self appViewController];
      pid_t v9 = [v8 scene];

      id v10 = [v9 uiPresentationManager];
      id v11 = [v10 createPresenterWithIdentifier:@"fakeSceneRequester" priority:1000];
      [(CARTemplateUIAppEnvironment *)self setFakeScenePresenter:v11];

      id v12 = [(CARTemplateUIAppEnvironment *)self fakeScenePresenter];
      [v12 modifyPresentationContext:&stru_10001C7B0];

      int v13 = [(CARTemplateUIAppEnvironment *)self fakeScenePresenter];
      [v13 activate];

      id v14 = [(CARTemplateUIAppEnvironment *)self fakeScenePresenter];
      id v15 = [v14 presentationView];
      [(CARTemplateUIAppEnvironment *)self setFakeSceneHostView:v15];

      id v16 = [(CARTemplateUIAppEnvironment *)self fakeSceneHostView];
      [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

      v17 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindow];
      v18 = [v17 rootViewController];
      id v19 = [v18 view];
      id v20 = [(CARTemplateUIAppEnvironment *)self fakeSceneHostView];
      id v21 = [(CARTemplateUIAppEnvironment *)self templateInstance];
      id v22 = [v21 dashboardEstimatesViewController];
      int v23 = [v22 view];
      [v19 insertSubview:v20 below:v23];

      id v24 = [(CARTemplateUIAppEnvironment *)self fakeSceneHostView];
      [v24 frame];
      double v26 = v25;
      double v28 = v27;

      v29 = [(CARTemplateUIAppEnvironment *)self templateInstance];
      [v29 currentSafeAreaInsets];
      double v31 = v30;
      double v33 = v32;

      double v34 = v31 + (v26 - (v31 + v33)) * 0.5;
      v35 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindow];
      [v35 frame];
      double v37 = v28 - v36;

      v38 = [(CARTemplateUIAppEnvironment *)self dashboardMapWindow];
      [v38 frame];
      double v40 = -(v34 - v39 * 0.5);

      v41 = [(CARTemplateUIAppEnvironment *)self fakeSceneHostView];
      objc_msgSend(v41, "setFrame:", v40, -v37, v26, v28);

      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000116A0;
      v43[3] = &unk_10001C518;
      v43[4] = self;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1000116E8;
      v42[3] = &unk_10001C7D8;
      v42[4] = self;
      +[UIView animateWithDuration:v43 animations:v42 completion:0.5];
      [(CARTemplateUIAppEnvironment *)self _showFakeSupportLabelIfNecessary];
    }
  }
}

- (CPSWindow)applicationWindow
{
  return self->_applicationWindow;
}

- (void)setApplicationWindow:(id)a3
{
}

- (UIWindowScene)applicationWindowScene
{
  return self->_applicationWindowScene;
}

- (UIWindowScene)dashboardMapWindowScene
{
  return self->_dashboardMapWindowScene;
}

- (UIWindowScene)dashboardGuidanceWindowScene
{
  return self->_dashboardGuidanceWindowScene;
}

- (CPSTemplateInstance)templateInstance
{
  return self->_templateInstance;
}

- (void)setTemplateInstance:(id)a3
{
}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setWindowScene:(id)a3
{
}

- (CRSUIDashboardWidgetWindow)dashboardMapWindow
{
  return self->_dashboardMapWindow;
}

- (void)setDashboardMapWindow:(id)a3
{
}

- (CRSUIDashboardWidgetWindow)dashboardGuidanceWindow
{
  return self->_dashboardGuidanceWindow;
}

- (void)setDashboardGuidanceWindow:(id)a3
{
}

- (CARTemplateUIApplicationSceneViewController)appViewController
{
  return self->_appViewController;
}

- (void)setAppViewController:(id)a3
{
}

- (CARTemplateUIDashboardSceneViewController)mapWidgetViewController
{
  return self->_mapWidgetViewController;
}

- (void)setMapWidgetViewController:(id)a3
{
}

- (CPSDashboardGuidanceViewController)guidanceWidgetViewController
{
  return self->_guidanceWidgetViewController;
}

- (void)setGuidanceWidgetViewController:(id)a3
{
}

- (NSMutableDictionary)instrumentClusterWindows
{
  return self->_instrumentClusterWindows;
}

- (void)setInstrumentClusterWindows:(id)a3
{
}

- (NSMutableDictionary)instrumentClusterViewControllers
{
  return self->_instrumentClusterViewControllers;
}

- (void)setInstrumentClusterViewControllers:(id)a3
{
}

- (NSMutableArray)internalInstrumentClusterWindowScenes
{
  return self->_internalInstrumentClusterWindowScenes;
}

- (void)setInternalInstrumentClusterWindowScenes:(id)a3
{
}

- (UIScenePresenter)fakeScenePresenter
{
  return self->_fakeScenePresenter;
}

- (void)setFakeScenePresenter:(id)a3
{
}

- (UIScenePresentation)fakeSceneHostView
{
  return self->_fakeSceneHostView;
}

- (void)setFakeSceneHostView:(id)a3
{
}

- (UIView)fakeSceneHostSnapshotView
{
  return self->_fakeSceneHostSnapshotView;
}

- (void)setFakeSceneHostSnapshotView:(id)a3
{
}

- (UILabel)fakeSupportLabel
{
  return self->_fakeSupportLabel;
}

- (void)setFakeSupportLabel:(id)a3
{
}

- (BOOL)fakesDashboardSupport
{
  return self->_fakesDashboardSupport;
}

- (void)setFakesDashboardSupport:(BOOL)a3
{
  self->_fakesDashboardSupport = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fakeSupportLabel, 0);
  objc_storeStrong((id *)&self->_fakeSceneHostSnapshotView, 0);
  objc_storeStrong((id *)&self->_fakeSceneHostView, 0);
  objc_storeStrong((id *)&self->_fakeScenePresenter, 0);
  objc_storeStrong((id *)&self->_internalInstrumentClusterWindowScenes, 0);
  objc_storeStrong((id *)&self->_instrumentClusterViewControllers, 0);
  objc_storeStrong((id *)&self->_instrumentClusterWindows, 0);
  objc_storeStrong((id *)&self->_guidanceWidgetViewController, 0);
  objc_storeStrong((id *)&self->_mapWidgetViewController, 0);
  objc_storeStrong((id *)&self->_appViewController, 0);
  objc_storeStrong((id *)&self->_dashboardGuidanceWindow, 0);
  objc_storeStrong((id *)&self->_dashboardMapWindow, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_templateInstance, 0);
  objc_storeStrong((id *)&self->_dashboardGuidanceWindowScene, 0);
  objc_storeStrong((id *)&self->_dashboardMapWindowScene, 0);
  objc_storeStrong((id *)&self->_applicationWindowScene, 0);

  objc_storeStrong((id *)&self->_applicationWindow, 0);
}

@end