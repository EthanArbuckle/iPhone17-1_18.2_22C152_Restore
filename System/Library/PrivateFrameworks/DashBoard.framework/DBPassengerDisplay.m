@interface DBPassengerDisplay
- (CARDisplayInfo)displayInfo;
- (CARScreenInfo)screenInfo;
- (CGRect)sceneFrameForApplication:(id)a3;
- (CGRect)sceneFrameForApplication:(id)a3 proxyApplication:(id)a4;
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBPassengerDisplay)initWithWindowScene:(id)a3 environmentConfiguration:(id)a4;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBSDisplayIdentity)displayIdentity;
- (NSMutableDictionary)identifierToAppScenesMap;
- (NSMutableDictionary)identifierToApplicationMap;
- (NSMutableDictionary)identifierToForegroundAppScenesMap;
- (NSString)description;
- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3;
- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3 proxyApplication:(id)a4;
- (UIScreen)screen;
- (UIView)interestingView;
- (UIWindow)interestingWindow;
- (UIWindow)passengerWindow;
- (_TtC9DashBoard36DBDefaultUISyncSessionCommandHandler)uisyncSessionCommandHandler;
- (_TtC9DashBoard36DBPassengerDisplayRootViewController)rootVC;
- (id)applicationForScene:(id)a3;
- (id)focusWindow;
- (id)sceneForApplication:(id)a3;
- (id)sceneIdentifierForApplication:(id)a3;
- (id)systemGestureWindow;
- (id)workspace;
- (void)invalidate;
- (void)sceneDidInvalidate:(id)a3;
- (void)sceneManager:(id)a3 didAddScene:(id)a4;
- (void)setDisplayInfo:(id)a3;
- (void)setEnvironmentConfiguration:(id)a3;
- (void)setIdentifierToAppScenesMap:(id)a3;
- (void)setIdentifierToApplicationMap:(id)a3;
- (void)setIdentifierToForegroundAppScenesMap:(id)a3;
- (void)setInterestingView:(id)a3;
- (void)setInterestingWindow:(id)a3;
- (void)setPassengerWindow:(id)a3;
- (void)setRootVC:(id)a3;
- (void)setScreen:(id)a3;
- (void)setScreenInfo:(id)a3;
- (void)setUisyncSessionCommandHandler:(id)a3;
@end

@implementation DBPassengerDisplay

- (DBPassengerDisplay)initWithWindowScene:(id)a3 environmentConfiguration:(id)a4
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v71.receiver = self;
  v71.super_class = (Class)DBPassengerDisplay;
  v8 = [(DBPassengerDisplay *)&v71 init];
  if (v8)
  {
    v9 = [v7 displayConfiguration];
    objc_storeStrong((id *)&v8->_environmentConfiguration, a4);
    [(DBEnvironmentConfiguration *)v8->_environmentConfiguration addObserver:v8];
    v10 = [(DBEnvironmentConfiguration *)v8->_environmentConfiguration session];
    [v10 addObserver:v8];

    uint64_t v11 = [(DBEnvironmentConfiguration *)v8->_environmentConfiguration screen];
    screen = v8->_screen;
    v8->_screen = (UIScreen *)v11;

    v13 = [v7 session];
    v14 = [v13 configuration];
    v15 = [v14 screens];
    uint64_t v66 = MEMORY[0x263EF8330];
    uint64_t v67 = 3221225472;
    v68 = __67__DBPassengerDisplay_initWithWindowScene_environmentConfiguration___block_invoke;
    v69 = &unk_2649B3F28;
    id v16 = v9;
    id v70 = v16;
    uint64_t v17 = objc_msgSend(v15, "bs_firstObjectPassingTest:", &v66);
    screenInfo = v8->_screenInfo;
    v8->_screenInfo = (CARScreenInfo *)v17;

    v19 = [(DBPassengerDisplay *)v8 environmentConfiguration];
    v20 = [v19 session];
    v21 = [v20 configuration];
    uint64_t v22 = objc_msgSend(v21, "db_displayInfoForScreenInfo:", v8->_screenInfo);
    displayInfo = v8->_displayInfo;
    v8->_displayInfo = (CARDisplayInfo *)v22;

    if ([v7 supportsPassengerDisplay]
      && [(CARDisplayInfo *)v8->_displayInfo supportsDDPContent])
    {
      v24 = [_TtC9DashBoard15DBUISyncSession alloc];
      v25 = [(DBPassengerDisplay *)v8 environmentConfiguration];
      v26 = [v25 uisyncChannel];
      v27 = [v7 vehicleID];
      v28 = [(DBUISyncSession *)v24 initWithChannel:v26 vehicleID:v27 displayID:@"Passenger_Display"];

      v29 = [[_TtC9DashBoard36DBDefaultUISyncSessionCommandHandler alloc] initWithUISyncSession:v28];
      [(DBPassengerDisplay *)v8 setUisyncSessionCommandHandler:v29];

      v30 = [(DBPassengerDisplay *)v8 uisyncSessionCommandHandler];
      [(DBUISyncSession *)v28 setObserver:v30];

      v31 = [(DBPassengerDisplay *)v8 environmentConfiguration];
      [v31 setUisyncSession:v28];
    }
    v32 = [(DBEnvironmentConfiguration *)v8->_environmentConfiguration displayConfiguration];
    [v32 bounds];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;

    v41 = NSString;
    v42 = [v16 identity];
    v43 = [v41 stringWithFormat:@"CarPlayPassengerDisplayWindow-%@", v42, v66, v67, v68, v69];

    uint64_t v44 = objc_msgSend(objc_alloc(MEMORY[0x263F82E88]), "_initWithFrame:debugName:windowScene:", v43, v6, v34, v36, v38, v40);
    passengerWindow = v8->_passengerWindow;
    v8->_passengerWindow = (UIWindow *)v44;

    v46 = [[_TtC9DashBoard36DBPassengerDisplayRootViewController alloc] initWithEnvironment:v8];
    rootVC = v8->_rootVC;
    v8->_rootVC = v46;

    [(UIWindow *)v8->_passengerWindow setRootViewController:v8->_rootVC];
    v48 = DBLogForCategory(0x14uLL);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v49);
      int v51 = [v7 supportsDisplayPlugin];
      v52 = @"NO";
      if (v51) {
        v52 = @"YES";
      }
      *(_DWORD *)buf = 138543874;
      v73 = v50;
      __int16 v74 = 2082;
      v75 = "-[DBPassengerDisplay initWithWindowScene:environmentConfiguration:]";
      __int16 v76 = 2114;
      v77 = v52;
      _os_log_impl(&dword_22D6F0000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@:%{public}s: Display supports DDP content=%{public}@", buf, 0x20u);
    }
    [(UIWindow *)v8->_passengerWindow setHidden:0];
    v53 = NSString;
    v54 = [v16 identity];
    v55 = [v53 stringWithFormat:@"passengerInterestingWindow-%@", v54];

    id v56 = objc_alloc(MEMORY[0x263F82E88]);
    [v16 bounds];
    uint64_t v57 = objc_msgSend(v56, "_initWithFrame:debugName:windowScene:", v55, v6);
    interestingWindow = v8->_interestingWindow;
    v8->_interestingWindow = (UIWindow *)v57;

    [(UIWindow *)v8->_interestingWindow setWindowLevel:*MEMORY[0x263F83C58] + -2.0];
    [(UIWindow *)v8->_interestingWindow setHidden:0];
    v59 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    interestingView = v8->_interestingView;
    v8->_interestingView = v59;

    v61 = v8->_interestingView;
    v62 = [MEMORY[0x263F825C8] blackColor];
    [(UIView *)v61 setBackgroundColor:v62];

    v63 = v8->_interestingView;
    [(DBEnvironmentConfiguration *)v8->_environmentConfiguration currentViewAreaFrame];
    -[UIView setFrame:](v63, "setFrame:");
    v64 = [(UIView *)v8->_interestingView layer];
    [v64 setDefinesDisplayRegionOfInterest:1];

    [(UIWindow *)v8->_interestingWindow addSubview:v8->_interestingView];
    kdebug_trace();
  }
  return v8;
}

uint64_t __67__DBPassengerDisplay_initWithWindowScene_environmentConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  v4 = [*(id *)(a1 + 32) hardwareIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(DBPassengerDisplay *)self displayIdentity];
  id v7 = [(DBPassengerDisplay *)self screenInfo];
  v8 = [v3 stringWithFormat:@"<%@ displayIdentity: %@. screenInfo: %@>", v5, v6, v7];

  return (NSString *)v8;
}

- (FBSDisplayIdentity)displayIdentity
{
  v2 = [(DBPassengerDisplay *)self environmentConfiguration];
  v3 = [v2 displayIdentity];

  return (FBSDisplayIdentity *)v3;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  v2 = [(DBPassengerDisplay *)self environmentConfiguration];
  v3 = [v2 displayConfiguration];

  return (FBSDisplayConfiguration *)v3;
}

- (id)applicationForScene:(id)a3
{
  return 0;
}

- (id)focusWindow
{
  return 0;
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = DBLogForCategory(0x14uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v9 = 138543618;
    v10 = v5;
    __int16 v11 = 2082;
    v12 = "-[DBPassengerDisplay invalidate]";
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s", (uint8_t *)&v9, 0x16u);
  }
  id v6 = [(DBPassengerDisplay *)self environmentConfiguration];
  id v7 = [v6 session];
  [v7 removeObserver:self];

  v8 = [(DBPassengerDisplay *)self passengerWindow];
  [v8 setHidden:1];

  [(DBPassengerDisplay *)self setPassengerWindow:0];
}

- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3
{
  double v3 = *MEMORY[0x263F834E8];
  double v4 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v6 = *(double *)(MEMORY[0x263F834E8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3 proxyApplication:(id)a4
{
  double v4 = *MEMORY[0x263F834E8];
  double v5 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v6 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v7 = *(double *)(MEMORY[0x263F834E8] + 24);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)sceneForApplication:(id)a3
{
  return 0;
}

- (CGRect)sceneFrameForApplication:(id)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)sceneFrameForApplication:(id)a3 proxyApplication:(id)a4
{
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)sceneIdentifierForApplication:(id)a3
{
  double v4 = NSString;
  id v5 = a3;
  double v6 = [(DBPassengerDisplay *)self displayIdentity];
  double v7 = [v5 bundleIdentifier];

  v8 = [v4 stringWithFormat:@"%@:%@", v6, v7];

  return v8;
}

- (id)systemGestureWindow
{
  double v3 = [MEMORY[0x263F83118] sharedInstance];
  double v4 = [(DBPassengerDisplay *)self displayIdentity];
  id v5 = [v3 windowForSystemGesturesForDisplayWithIdentity:v4];

  return v5;
}

- (id)workspace
{
  return 0;
}

- (void)sceneManager:(id)a3 didAddScene:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a4;
  double v6 = [v5 settings];
  double v7 = [v6 displayIdentity];
  v8 = [(DBPassengerDisplay *)self displayIdentity];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    v10 = [v5 definition];
    __int16 v11 = [v10 clientIdentity];
    v12 = [v11 processIdentity];
    uint64_t v13 = [v12 embeddedApplicationIdentifier];

    v14 = +[DBApplicationController sharedInstance];
    v15 = [v14 applicationWithBundleIdentifier:v13];

    id v16 = DBLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v5;
      _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_INFO, "PassengerDisplay: didAddScene: %@", (uint8_t *)&v27, 0xCu);
    }

    uint64_t v17 = DBLogForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v13;
      _os_log_impl(&dword_22D6F0000, v17, OS_LOG_TYPE_INFO, "PassengerDisplay: bundle ID: %@", (uint8_t *)&v27, 0xCu);
    }

    v18 = DBLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v15;
      _os_log_impl(&dword_22D6F0000, v18, OS_LOG_TYPE_INFO, "PassengerDisplay: application: %@", (uint8_t *)&v27, 0xCu);
    }

    if (v15)
    {
      v19 = [v5 identifier];
      v20 = [(DBPassengerDisplay *)self identifierToApplicationMap];
      [v20 setObject:v15 forKeyedSubscript:v19];

      v21 = [(DBPassengerDisplay *)self identifierToAppScenesMap];
      [v21 setObject:v5 forKeyedSubscript:v19];

      uint64_t v22 = [v5 settings];
      if (v22)
      {
        v23 = (void *)v22;
        v24 = [v5 settings];
        int v25 = [v24 isForeground];

        if (v25)
        {
          v26 = [(DBPassengerDisplay *)self identifierToForegroundAppScenesMap];
          [v26 setObject:v5 forKeyedSubscript:v19];
        }
      }
    }
    [v5 addObserver:self];
  }
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4 = a3;
  id v10 = [v4 identifier];
  id v5 = [(DBPassengerDisplay *)self identifierToAppScenesMap];
  id v6 = [v5 objectForKeyedSubscript:v10];

  if (v6 == v4)
  {
    double v7 = [(DBPassengerDisplay *)self identifierToApplicationMap];
    [v7 setObject:0 forKeyedSubscript:v10];

    v8 = [(DBPassengerDisplay *)self identifierToAppScenesMap];
    [v8 setObject:0 forKeyedSubscript:v10];

    int v9 = [(DBPassengerDisplay *)self identifierToForegroundAppScenesMap];
    [v9 setObject:0 forKeyedSubscript:v10];
  }
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)setScreen:(id)a3
{
}

- (CARScreenInfo)screenInfo
{
  return self->_screenInfo;
}

- (void)setScreenInfo:(id)a3
{
}

- (CARDisplayInfo)displayInfo
{
  return self->_displayInfo;
}

- (void)setDisplayInfo:(id)a3
{
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  return self->_environmentConfiguration;
}

- (void)setEnvironmentConfiguration:(id)a3
{
}

- (UIWindow)passengerWindow
{
  return self->_passengerWindow;
}

- (void)setPassengerWindow:(id)a3
{
}

- (_TtC9DashBoard36DBPassengerDisplayRootViewController)rootVC
{
  return self->_rootVC;
}

- (void)setRootVC:(id)a3
{
}

- (_TtC9DashBoard36DBDefaultUISyncSessionCommandHandler)uisyncSessionCommandHandler
{
  return self->_uisyncSessionCommandHandler;
}

- (void)setUisyncSessionCommandHandler:(id)a3
{
}

- (UIWindow)interestingWindow
{
  return self->_interestingWindow;
}

- (void)setInterestingWindow:(id)a3
{
}

- (UIView)interestingView
{
  return self->_interestingView;
}

- (void)setInterestingView:(id)a3
{
}

- (NSMutableDictionary)identifierToApplicationMap
{
  return self->_identifierToApplicationMap;
}

- (void)setIdentifierToApplicationMap:(id)a3
{
}

- (NSMutableDictionary)identifierToForegroundAppScenesMap
{
  return self->_identifierToForegroundAppScenesMap;
}

- (void)setIdentifierToForegroundAppScenesMap:(id)a3
{
}

- (NSMutableDictionary)identifierToAppScenesMap
{
  return self->_identifierToAppScenesMap;
}

- (void)setIdentifierToAppScenesMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToAppScenesMap, 0);
  objc_storeStrong((id *)&self->_identifierToForegroundAppScenesMap, 0);
  objc_storeStrong((id *)&self->_identifierToApplicationMap, 0);
  objc_storeStrong((id *)&self->_interestingView, 0);
  objc_storeStrong((id *)&self->_interestingWindow, 0);
  objc_storeStrong((id *)&self->_uisyncSessionCommandHandler, 0);
  objc_storeStrong((id *)&self->_rootVC, 0);
  objc_storeStrong((id *)&self->_passengerWindow, 0);
  objc_storeStrong((id *)&self->_environmentConfiguration, 0);
  objc_storeStrong((id *)&self->_displayInfo, 0);
  objc_storeStrong((id *)&self->_screenInfo, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

@end