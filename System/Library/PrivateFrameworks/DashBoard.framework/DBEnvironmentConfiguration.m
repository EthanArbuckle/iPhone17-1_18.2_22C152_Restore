@interface DBEnvironmentConfiguration
+ (id)_stringForStatusBarEdge:(unint64_t)a3;
- (BOOL)_prefersDarkMapsAppearance;
- (BOOL)currentViewAreaSupportsFocusTransfer;
- (BOOL)currentViewAreaSupportsUIOutsideSafeArea;
- (BOOL)hasDualStatusBar;
- (BOOL)hasPhysicalControlBars;
- (BOOL)isACBackSupported;
- (BOOL)isAmbientBrightnessNighttime;
- (BOOL)isConnectedWirelessly;
- (BOOL)isGeoSupported;
- (BOOL)isKnownVehicle;
- (BOOL)isOEMIconVisible;
- (BOOL)isPairedVehicle;
- (BOOL)isRightHandDrive;
- (BOOL)isStatusBarDriveSide;
- (BOOL)isVehicleDataSession;
- (BOOL)screenSupportsFocus;
- (BOOL)supportsDisplayPlugin;
- (BOOL)supportsGaugeCluster;
- (BOOL)supportsPassengerDisplay;
- (CARObserverHashTable)observers;
- (CARSession)session;
- (CGRect)_unadjustedSafeAreaFrameForViewArea:(id)a3;
- (CGRect)_viewAreaFrameForViewArea:(id)a3;
- (CGRect)currentSafeViewAreaFrame;
- (CGRect)currentUnadjustedSafeViewAreaFrame;
- (CGRect)currentViewAreaFrame;
- (CRSUIWallpaperPreferences)wallpaperPreferences;
- (CRVehicle)vehicle;
- (DBAnalytics)analytics;
- (DBAnalyticsProvider)analyticsProvider;
- (DBAppHistory)appHistory;
- (DBEnvironmentConfiguration)initWithDisplayConfiguration:(id)a3 layoutPublisher:(id)a4 iconBadgeController:(id)a5 session:(id)a6 supportedFeatures:(unint64_t)a7 processMonitor:(id)a8 thermalMonitor:(id)a9 vehicle:(id)a10 themeController:(id)a11 navigationStateProvider:(id)a12 analyticsProvider:(id)a13;
- (DBIconBadgeController)iconBadgeController;
- (DBIconImageCache)iconImageCache;
- (DBLayerMetadataService)layerMetadataService;
- (DBNavigationStateProvider)navigationStateProvider;
- (DBProcessMonitor)processMonitor;
- (DBThermalMonitor)thermalMonitor;
- (DBUISyncChannel)uisyncChannel;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBSDisplayIdentity)displayIdentity;
- (FBSDisplayLayoutPublisher)displayLayoutPublisher;
- (NSMapTable)viewAreaToStatusBarEdgeMap;
- (NSString)OEMIconLabel;
- (NSString)vehicleID;
- (UIEdgeInsets)_safeAreaInsetsForViewArea:(id)a3;
- (UIEdgeInsets)currentViewAreaSafeAreaInsets;
- (UIScreen)screen;
- (UITraitCollection)traitCollection;
- (_TtC9DashBoard15DBUISyncSession)uisyncSession;
- (_TtC9DashBoard16DBSystemUILayout)systemUILayout;
- (_TtC9DashBoard17DBThemeController)themeController;
- (double)screenScale;
- (int64_t)_effectiveVehicleAppearancePreference;
- (int64_t)carUserInterfaceStyle;
- (int64_t)effectiveMapsUserInterfaceStyle;
- (int64_t)layoutJustification;
- (int64_t)mapsUserInterfaceStyle;
- (int64_t)nightModeUserInterfaceStyle;
- (unint64_t)_statusBarEdgeForViewArea:(id)a3;
- (unint64_t)currentStatusBarEdge;
- (unint64_t)currentViewAreaTransitionControlType;
- (unint64_t)iconColumnCount;
- (unint64_t)iconRowCount;
- (unint64_t)interactionAffordances;
- (unint64_t)supportedFeatures;
- (void)_computeStatusBarEdgesForViewAreas:(id)a3;
- (void)_effectiveVehicleAppearancePreference;
- (void)_prefersDarkMapsAppearance;
- (void)_showUIOverrideDefault;
- (void)_showUIOverrideInstructionCard;
- (void)_showUIOverrideMap;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)fetchEnhancedIntegrationStatusWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)session:(id)a3 didSetViewArea:(id)a4 forScreenID:(id)a5 withDuration:(double)a6 transitionControlType:(unint64_t)a7;
- (void)session:(id)a3 didUpdateAppearanceStyle:(int64_t)a4 forScreenUUID:(id)a5;
- (void)session:(id)a3 didUpdateMapAppearanceStyle:(int64_t)a4 forScreenUUID:(id)a5;
- (void)session:(id)a3 didUpdateNightMode:(BOOL)a4;
- (void)session:(id)a3 showUIForScreenInfo:(id)a4 withURL:(id)a5;
- (void)session:(id)a3 stopUIForScreenInfo:(id)a4;
- (void)sessionController:(id)a3 didUpdateVehicle:(id)a4;
- (void)sessionDidUpdateCarCapabilities:(id)a3;
- (void)setAnalyticsProvider:(id)a3;
- (void)setCurrentStatusBarEdge:(unint64_t)a3;
- (void)setCurrentViewAreaFrame:(CGRect)a3;
- (void)setCurrentViewAreaSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setCurrentViewAreaSupportsFocusTransfer:(BOOL)a3;
- (void)setCurrentViewAreaTransitionControlType:(unint64_t)a3;
- (void)setIconImageCache:(id)a3;
- (void)setKnownVehicle:(BOOL)a3;
- (void)setLayerMetadataService:(id)a3;
- (void)setMapsUserInterfaceStyle:(int64_t)a3;
- (void)setObservers:(id)a3;
- (void)setPairedVehicle:(BOOL)a3;
- (void)setSystemUILayout:(id)a3;
- (void)setUisyncChannel:(id)a3;
- (void)setUisyncSession:(id)a3;
- (void)setVehicleID:(id)a3;
- (void)setViewAreaToStatusBarEdgeMap:(id)a3;
@end

@implementation DBEnvironmentConfiguration

- (DBEnvironmentConfiguration)initWithDisplayConfiguration:(id)a3 layoutPublisher:(id)a4 iconBadgeController:(id)a5 session:(id)a6 supportedFeatures:(unint64_t)a7 processMonitor:(id)a8 thermalMonitor:(id)a9 vehicle:(id)a10 themeController:(id)a11 navigationStateProvider:(id)a12 analyticsProvider:(id)a13
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v97 = a4;
  id v104 = a4;
  id v103 = a5;
  id v18 = a6;
  id v19 = a6;
  id v102 = a8;
  id v101 = a9;
  v20 = v17;
  id v100 = a10;
  id v105 = a11;
  id v99 = a12;
  id v21 = a13;
  v113.receiver = self;
  v113.super_class = (Class)DBEnvironmentConfiguration;
  v22 = [(DBEnvironmentConfiguration *)&v113 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_iconBadgeController, a5);
    objc_storeStrong((id *)&v23->_session, v18);
    v23->_supportedFeatures = a7;
    objc_storeStrong((id *)&v23->_processMonitor, a8);
    objc_storeStrong((id *)&v23->_thermalMonitor, a9);
    objc_storeStrong((id *)&v23->_navigationStateProvider, a12);
    id v94 = v21;
    objc_storeWeak((id *)&v23->_analyticsProvider, v21);
    v24 = [MEMORY[0x263F30E28] useSceneInterfaceStyle];
    [v24 setState:1];

    v25 = [MEMORY[0x263F82B60] screens];
    v111[0] = MEMORY[0x263EF8330];
    v111[1] = 3221225472;
    v111[2] = __217__DBEnvironmentConfiguration_initWithDisplayConfiguration_layoutPublisher_iconBadgeController_session_supportedFeatures_processMonitor_thermalMonitor_vehicle_themeController_navigationStateProvider_analyticsProvider___block_invoke;
    v111[3] = &unk_2649B4048;
    id v26 = v20;
    id v112 = v26;
    v27 = objc_msgSend(v25, "db_firstObjectPassingTest:", v111);

    [v19 configuration];
    v29 = v28 = v19;
    unsigned int v30 = [v29 rightHandDrive];
    v23->_rightHandDrive = v30;
    v23->_layoutJustification = v30;
    objc_storeStrong((id *)&v23->_displayConfiguration, a3);
    objc_storeStrong((id *)&v23->_screen, v27);
    [v26 scale];
    v23->_screenScale = v31;
    v92 = v27;
    v32 = [v27 traitCollection];
    uint64_t v33 = [v32 copy];
    traitCollection = v23->_traitCollection;
    v23->_traitCollection = (UITraitCollection *)v33;

    v35 = v23->_screen;
    v36 = [(UIScreen *)v35 _capabilityForKey:*MEMORY[0x263F83DC8]];
    v37 = v36;
    if (v36)
    {
      unint64_t v38 = [v36 integerValue];
      uint64_t v39 = (v38 >> 1) & 1;
      if (v38)
      {
        v40 = [(UIScreen *)v35 _capabilityForKey:*MEMORY[0x263F83DD0]];
        uint64_t v41 = [v40 integerValue];
        if (v41 == 1)
        {
          v39 |= 2uLL;
        }
        else if (!v41)
        {
          v39 |= 4uLL;
        }
      }
    }
    else
    {
      uint64_t v39 = 0;
    }
    id obja = v20;

    v23->_interactionAffordances = v39;
    v23->_screenSupportsFocus = [(UIScreen *)v23->_screen supportsFocus];
    objc_storeStrong((id *)&v23->_displayLayoutPublisher, v97);
    [(FBSDisplayLayoutPublisher *)v23->_displayLayoutPublisher setDisplayConfiguration:v26];
    [(FBSDisplayLayoutPublisher *)v23->_displayLayoutPublisher setInterfaceOrientation:1];
    v23->_connectedWirelessly = [v29 transportType] == 3;
    v23->_acBackSupported = [v29 supportsACBack];
    v42 = +[DBApplicationController sharedInstance];
    v43 = [v42 _appPolicyEvaluator];
    v23->_geoSupported = [v43 isGeoSupported];

    v44 = objc_alloc_init(DBAppHistory);
    appHistory = v23->_appHistory;
    v23->_appHistory = v44;

    id v46 = objc_alloc(MEMORY[0x263F30E18]);
    uint64_t v47 = [v46 initWithProtocol:&unk_26E18EA40 callbackQueue:MEMORY[0x263EF83A0]];
    observers = v23->_observers;
    v23->_observers = (CARObserverHashTable *)v47;

    v49 = [v29 displays];
    v109[0] = MEMORY[0x263EF8330];
    v109[1] = 3221225472;
    v109[2] = __217__DBEnvironmentConfiguration_initWithDisplayConfiguration_layoutPublisher_iconBadgeController_session_supportedFeatures_processMonitor_thermalMonitor_vehicle_themeController_navigationStateProvider_analyticsProvider___block_invoke_2;
    v109[3] = &unk_2649B4098;
    id v50 = v26;
    id v110 = v50;
    v51 = objc_msgSend(v49, "bs_firstObjectPassingTest:", v109);

    objc_storeStrong((id *)&v23->_themeController, a11);
    if (v105)
    {
      v52 = [_TtC9DashBoard28DBAssetWallpaperDataProvider alloc];
      v53 = [v105 themeAssetDocument];
      v54 = [v51 identifier];
      v55 = [(DBAssetWallpaperDataProvider *)v52 initWithThemeAssetDocument:v53 displayID:v54];
    }
    else
    {
      v55 = (_TtC9DashBoard28DBAssetWallpaperDataProvider *)objc_alloc_init(MEMORY[0x263F31590]);
    }
    uint64_t v56 = [objc_alloc(MEMORY[0x263F315C8]) initWithDataProvider:v55];
    wallpaperPreferences = v23->_wallpaperPreferences;
    v23->_wallpaperPreferences = (CRSUIWallpaperPreferences *)v56;

    objc_storeStrong((id *)&v23->_vehicle, a10);
    vehicle = v23->_vehicle;
    if (vehicle)
    {
      uint64_t v59 = [(CRVehicle *)vehicle pairingStatus];
      v60 = DBLogForCategory(0);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v115 = v59;
        _os_log_impl(&dword_22D6F0000, v60, OS_LOG_TYPE_DEFAULT, "Vehicle pairing status: %ld", buf, 0xCu);
      }

      [(DBEnvironmentConfiguration *)v23 setKnownVehicle:v59 != 0];
      [(DBEnvironmentConfiguration *)v23 setPairedVehicle:v59 == 2];
      v61 = [(CRVehicle *)v23->_vehicle identifier];
      v62 = [v61 UUIDString];
      [(DBEnvironmentConfiguration *)v23 setVehicleID:v62];

      v63 = DBLogForCategory(0);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v64 = v23->_vehicle;
        *(_DWORD *)buf = 138412290;
        uint64_t v115 = (uint64_t)v64;
        _os_log_impl(&dword_22D6F0000, v63, OS_LOG_TYPE_DEFAULT, "Assigning vehicle to wallpaper preferences: %@", buf, 0xCu);
      }

      [(CRSUIWallpaperPreferences *)v23->_wallpaperPreferences setVehicle:v23->_vehicle];
    }
    [v28 addObserver:v23];
    uint64_t v65 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    viewAreaToStatusBarEdgeMap = v23->_viewAreaToStatusBarEdgeMap;
    v23->_viewAreaToStatusBarEdgeMap = (NSMapTable *)v65;

    v23->_OEMIconVisible = [v29 manufacturerIconVisible];
    v67 = [v29 manufacturerIconLabel];
    uint64_t v68 = [v67 copy];
    OEMIconLabel = v23->_OEMIconLabel;
    v23->_OEMIconLabel = (NSString *)v68;

    v23->_supportsDisplayPlugin = [v51 supportsDDPContent];
    if ([(DBEnvironmentConfiguration *)v23 supportsGaugeCluster] && v23->_supportsDisplayPlugin) {
      v23->_OEMIconVisible = 0;
    }
    if (v23->_themeController)
    {
      v70 = [_TtC9DashBoard16DBSystemUILayout alloc];
      v71 = [(DBThemeController *)v23->_themeController themeAssetDocument];
      v72 = [v51 identifier];
      [(FBSDisplayConfiguration *)v23->_displayConfiguration pointScale];
      uint64_t v73 = -[DBSystemUILayout initWithThemeAssetDocument:displayID:displayScale:](v70, "initWithThemeAssetDocument:displayID:displayScale:", v71, v72);
      systemUILayout = v23->_systemUILayout;
      v23->_systemUILayout = (_TtC9DashBoard16DBSystemUILayout *)v73;
    }
    v75 = [v29 screens];
    v106[0] = MEMORY[0x263EF8330];
    v106[1] = 3221225472;
    v106[2] = __217__DBEnvironmentConfiguration_initWithDisplayConfiguration_layoutPublisher_iconBadgeController_session_supportedFeatures_processMonitor_thermalMonitor_vehicle_themeController_navigationStateProvider_analyticsProvider___block_invoke_203;
    v106[3] = &unk_2649B40C0;
    id v76 = v50;
    id v107 = v76;
    v77 = v23;
    v108 = v77;
    [v75 enumerateObjectsUsingBlock:v106];

    v78 = [v76 hardwareIdentifier];
    v77->_uint64_t carUserInterfaceStyle = [v28 userInterfaceStyleForScreenUUID:v78];

    v79 = [v76 hardwareIdentifier];
    v77->_uint64_t mapsUserInterfaceStyle = [v28 mapInterfaceStyleForScreenUUID:v79];

    if (([(DBEnvironmentConfiguration *)v77 supportedFeatures] & 0x10) != 0)
    {
      v80 = [v28 configuration];
      v77->_vehicleDataSession = [v80 supportsVehicleData];
    }
    else
    {
      v77->_vehicleDataSession = 0;
    }
    v81 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      v82 = [(DBEnvironmentConfiguration *)v77 vehicle];
      uint64_t v83 = [v82 appearanceModePreference];
      *(_DWORD *)buf = 134217984;
      uint64_t v115 = v83;
      _os_log_impl(&dword_22D6F0000, v81, OS_LOG_TYPE_DEFAULT, "Env vehicle appearance mode preference: %lu", buf, 0xCu);
    }
    v84 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t carUserInterfaceStyle = v77->_carUserInterfaceStyle;
      *(_DWORD *)buf = 134217984;
      uint64_t v115 = carUserInterfaceStyle;
      _os_log_impl(&dword_22D6F0000, v84, OS_LOG_TYPE_DEFAULT, "Env ui style is: %ld", buf, 0xCu);
    }

    v86 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t mapsUserInterfaceStyle = v77->_mapsUserInterfaceStyle;
      *(_DWORD *)buf = 134217984;
      uint64_t v115 = mapsUserInterfaceStyle;
      _os_log_impl(&dword_22D6F0000, v86, OS_LOG_TYPE_DEFAULT, "Env map style is: %ld", buf, 0xCu);
    }

    if (DBIsInternalInstall_onceToken_1 != -1) {
      dispatch_once(&DBIsInternalInstall_onceToken_1, &__block_literal_global_2);
    }
    if (DBIsInternalInstall_isInternal_1)
    {
      v88 = [MEMORY[0x263F087C8] defaultCenter];
      [v88 addObserver:v77 selector:sel__showUIOverrideDefault name:@"com.apple.CarPlay.internal.default" object:0];

      v89 = [MEMORY[0x263F087C8] defaultCenter];
      [v89 addObserver:v77 selector:sel__showUIOverrideInstructionCard name:@"com.apple.CarPlay.internal.instructionCard" object:0];

      v90 = [MEMORY[0x263F087C8] defaultCenter];
      [v90 addObserver:v77 selector:sel__showUIOverrideMap name:@"com.apple.CarPlay.internal.map" object:0];
    }
    id v21 = v94;
    v20 = obja;
    id v19 = v28;
  }

  return v23;
}

uint64_t __217__DBEnvironmentConfiguration_initWithDisplayConfiguration_layoutPublisher_iconBadgeController_session_supportedFeatures_processMonitor_thermalMonitor_vehicle_themeController_navigationStateProvider_analyticsProvider___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 identity];
  v5 = [v3 displayIdentity];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

uint64_t __217__DBEnvironmentConfiguration_initWithDisplayConfiguration_layoutPublisher_iconBadgeController_session_supportedFeatures_processMonitor_thermalMonitor_vehicle_themeController_navigationStateProvider_analyticsProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 streams];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __217__DBEnvironmentConfiguration_initWithDisplayConfiguration_layoutPublisher_iconBadgeController_session_supportedFeatures_processMonitor_thermalMonitor_vehicle_themeController_navigationStateProvider_analyticsProvider___block_invoke_3;
  v6[3] = &unk_2649B4070;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "bs_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __217__DBEnvironmentConfiguration_initWithDisplayConfiguration_layoutPublisher_iconBadgeController_session_supportedFeatures_processMonitor_thermalMonitor_vehicle_themeController_navigationStateProvider_analyticsProvider___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 hardwareIdentifier];
  v5 = [v3 identifier];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

void __217__DBEnvironmentConfiguration_initWithDisplayConfiguration_layoutPublisher_iconBadgeController_session_supportedFeatures_processMonitor_thermalMonitor_vehicle_themeController_navigationStateProvider_analyticsProvider___block_invoke_203(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v27 = a2;
  uint64_t v6 = [v27 identifier];
  id v7 = [*(id *)(a1 + 32) hardwareIdentifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    v9 = *(void **)(a1 + 40);
    v10 = [v27 viewAreas];
    [v9 _computeStatusBarEdgesForViewAreas:v10];

    v11 = [v27 currentViewArea];
    v12 = *(void **)(a1 + 40);
    [v12 _viewAreaFrameForViewArea:v11];
    v12[34] = v13;
    v12[35] = v14;
    v12[36] = v15;
    v12[37] = v16;
    id v17 = *(void **)(a1 + 40);
    [v17 _safeAreaInsetsForViewArea:v11];
    v17[42] = v18;
    v17[43] = v19;
    v17[44] = v20;
    v17[45] = v21;
    v22 = *(void **)(a1 + 40);
    [v22 _unadjustedSafeAreaFrameForViewArea:v11];
    v22[38] = v23;
    v22[39] = v24;
    v22[40] = v25;
    v22[41] = v26;
    *(void *)(*(void *)(a1 + 40) + 104) = [v27 currentViewAreaTransitionControlType];
    *(void *)(*(void *)(a1 + 40) + 112) = [*(id *)(a1 + 40) _statusBarEdgeForViewArea:v11];
    *(unsigned char *)(*(void *)(a1 + 40) + 9) = [v11 supportsFocusTransfer];
    *a4 = 1;
  }
}

- (int64_t)nightModeUserInterfaceStyle
{
  if ([(DBEnvironmentConfiguration *)self isAmbientBrightnessNighttime]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DBEnvironmentConfiguration;
  [(DBEnvironmentConfiguration *)&v4 dealloc];
}

- (FBSDisplayIdentity)displayIdentity
{
  return (FBSDisplayIdentity *)[(FBSDisplayConfiguration *)self->_displayConfiguration identity];
}

- (BOOL)isAmbientBrightnessNighttime
{
  v2 = [(CARSession *)self->_session nightMode];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBEnvironmentConfiguration *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBEnvironmentConfiguration *)self observers];
  [v5 removeObserver:v4];
}

- (CGRect)currentSafeViewAreaFrame
{
  char v3 = [(DBEnvironmentConfiguration *)self systemUILayout];

  if (v3)
  {
    id v4 = [(DBEnvironmentConfiguration *)self systemUILayout];
    [v4 primaryContentFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    [(DBEnvironmentConfiguration *)self currentViewAreaFrame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [(DBEnvironmentConfiguration *)self currentViewAreaSafeAreaInsets];
    double v6 = v14 + v21;
    double v8 = v16 + v22;
    double v10 = v18 - (v21 + v23);
    double v12 = v20 - (v22 + v24);
  }
  double v25 = v6;
  double v26 = v8;
  double v27 = v10;
  double v28 = v12;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (BOOL)currentViewAreaSupportsUIOutsideSafeArea
{
  v2 = self;
  char v3 = [(DBEnvironmentConfiguration *)self systemUILayout];

  if (v3)
  {
    id v4 = [(DBEnvironmentConfiguration *)v2 systemUILayout];
    [v4 primaryContentFrame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [(DBEnvironmentConfiguration *)v2 currentViewAreaFrame];
    v25.origin.x = v13;
    v25.origin.y = v14;
    v25.size.width = v15;
    v25.size.height = v16;
    v24.origin.x = v6;
    v24.origin.y = v8;
    v24.size.width = v10;
    v24.size.height = v12;
    LODWORD(v2) = !CGRectEqualToRect(v24, v25);
  }
  else
  {
    double v17 = [(DBEnvironmentConfiguration *)v2 session];
    double v18 = [v17 configuration];
    double v19 = [v18 screens];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __70__DBEnvironmentConfiguration_currentViewAreaSupportsUIOutsideSafeArea__block_invoke;
    v23[3] = &unk_2649B3F28;
    v23[4] = v2;
    double v20 = objc_msgSend(v19, "bs_firstObjectPassingTest:", v23);

    double v21 = [v20 currentViewArea];
    LOBYTE(v2) = [v21 supportsUIOutsideSafeArea];
  }
  return (char)v2;
}

uint64_t __70__DBEnvironmentConfiguration_currentViewAreaSupportsUIOutsideSafeArea__block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) displayConfiguration];
  double v5 = [v4 hardwareIdentifier];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (void)fetchEnhancedIntegrationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(DBEnvironmentConfiguration *)self session];
  id v6 = [v5 MFiCertificateSerialNumber];

  CRIsEnhancedIntegrationEnabledWithCertificateSerialNumber();
}

- (CGRect)_viewAreaFrameForViewArea:(id)a3
{
  id v4 = a3;
  [(DBEnvironmentConfiguration *)self screenScale];
  double v6 = v5;
  [v4 visibleFrame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  CGAffineTransformMakeScale(&v15, 1.0 / v6, 1.0 / v6);
  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v12;
  v16.size.height = v14;
  return CGRectApplyAffineTransform(v16, &v15);
}

- (UIEdgeInsets)_safeAreaInsetsForViewArea:(id)a3
{
  id v4 = a3;
  [(DBEnvironmentConfiguration *)self screenScale];
  double v6 = v5;
  [(DBEnvironmentConfiguration *)self _viewAreaFrameForViewArea:v4];
  double v8 = v7;
  double v10 = v9;
  double v28 = v11;
  double v13 = v12;
  [v4 safeFrame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  CGAffineTransformMakeScale(&v29, 1.0 / v6, 1.0 / v6);
  v30.origin.x = v15;
  v30.origin.y = v17;
  v30.size.width = v19;
  v30.size.height = v21;
  CGRect v31 = CGRectApplyAffineTransform(v30, &v29);
  CGFloat v22 = v31.origin.x - v8;
  double v23 = v31.origin.y - v10;
  double v24 = v13 - (v31.origin.y - v10) - v31.size.height;
  double v25 = v28 - v22 - v31.size.width;
  double v26 = v22;
  double v27 = v24;
  result.right = v25;
  result.bottom = v27;
  result.left = v26;
  result.top = v23;
  return result;
}

- (CGRect)_unadjustedSafeAreaFrameForViewArea:(id)a3
{
  id v4 = a3;
  [(DBEnvironmentConfiguration *)self screenScale];
  double v6 = v5;
  [v4 unadjustedSafeFrame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  CGAffineTransformMakeScale(&v15, 1.0 / v6, 1.0 / v6);
  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v12;
  v16.size.height = v14;
  return CGRectApplyAffineTransform(v16, &v15);
}

- (unint64_t)iconRowCount
{
  [(DBEnvironmentConfiguration *)self currentSafeViewAreaFrame];
  double Height = CGRectGetHeight(v11);
  [(DBEnvironmentConfiguration *)self screenScale];
  double v4 = DBIconImageInfoForScale();
  double v6 = v5;
  unint64_t v7 = [(DBEnvironmentConfiguration *)self currentStatusBarEdge];
  unint64_t v8 = [(DBEnvironmentConfiguration *)self interactionAffordances];
  return +[DBIconListView iconRowsForScreenHeight:iconImageSize:statusBarEdge:interactionAffordances:](DBIconListView, "iconRowsForScreenHeight:iconImageSize:statusBarEdge:interactionAffordances:", v7, v8, Height, v4, v6);
}

- (unint64_t)iconColumnCount
{
  [(DBEnvironmentConfiguration *)self currentSafeViewAreaFrame];
  double Width = CGRectGetWidth(v10);
  [(DBEnvironmentConfiguration *)self screenScale];
  double v4 = DBIconImageInfoForScale();
  double v6 = v5;
  unint64_t v7 = [(DBEnvironmentConfiguration *)self currentStatusBarEdge];
  return +[DBIconListView iconColumnsForScreenWidth:iconImageSize:statusBarEdge:](DBIconListView, "iconColumnsForScreenWidth:iconImageSize:statusBarEdge:", v7, Width, v4, v6);
}

- (BOOL)isStatusBarDriveSide
{
  return (([(DBEnvironmentConfiguration *)self currentStatusBarEdge] - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (BOOL)supportsGaugeCluster
{
  return ([(DBEnvironmentConfiguration *)self supportedFeatures] >> 3) & 1;
}

- (BOOL)supportsPassengerDisplay
{
  return ([(DBEnvironmentConfiguration *)self supportedFeatures] >> 5) & 1;
}

- (BOOL)hasDualStatusBar
{
  char v3 = [(DBEnvironmentConfiguration *)self systemUILayout];

  if (!v3) {
    return 0;
  }
  double v4 = [(DBEnvironmentConfiguration *)self systemUILayout];
  char v5 = [v4 hasDualStatusBar];

  return v5;
}

- (BOOL)hasPhysicalControlBars
{
  char v3 = [(DBEnvironmentConfiguration *)self systemUILayout];

  if (!v3) {
    return 0;
  }
  double v4 = [(DBEnvironmentConfiguration *)self systemUILayout];
  char v5 = [v4 hasPhysicalControlBars];

  return v5;
}

- (void)session:(id)a3 didSetViewArea:(id)a4 forScreenID:(id)a5 withDuration:(double)a6 transitionControlType:(unint64_t)a7
{
  id v11 = a4;
  id v12 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__DBEnvironmentConfiguration_session_didSetViewArea_forScreenID_withDuration_transitionControlType___block_invoke;
  block[3] = &unk_2649B40E8;
  block[4] = self;
  id v16 = v12;
  id v17 = v11;
  unint64_t v18 = a7;
  double v19 = a6;
  id v13 = v11;
  id v14 = v12;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __100__DBEnvironmentConfiguration_session_didSetViewArea_forScreenID_withDuration_transitionControlType___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) session];
  char v3 = [v2 configuration];
  v60 = [v3 screenInfoForScreenID:*(void *)(a1 + 40)];

  double v4 = [v60 identifier];
  char v5 = [*(id *)(a1 + 32) displayConfiguration];
  double v6 = [v5 hardwareIdentifier];
  int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    [*(id *)(a1 + 32) _viewAreaFrameForViewArea:*(void *)(a1 + 48)];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [*(id *)(a1 + 32) _safeAreaInsetsForViewArea:*(void *)(a1 + 48)];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    uint64_t v24 = [*(id *)(a1 + 32) _statusBarEdgeForViewArea:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) currentViewAreaFrame];
    v63.origin.x = v9;
    v63.origin.y = v11;
    v63.size.width = v13;
    v63.size.height = v15;
    if (!CGRectEqualToRect(v62, v63)
      || ([*(id *)(a1 + 32) currentViewAreaSafeAreaInsets], v28 != v19)
      || v25 != v17
      || v27 != v23
      || v26 != v21
      || [*(id *)(a1 + 32) currentViewAreaTransitionControlType] != *(void *)(a1 + 56)
      || [*(id *)(a1 + 32) currentStatusBarEdge] != v24
      || (int v29 = [*(id *)(a1 + 32) currentViewAreaSupportsFocusTransfer],
          v29 != [*(id *)(a1 + 48) supportsFocusTransfer]))
    {
      [*(id *)(a1 + 32) currentViewAreaFrame];
      double v58 = v31;
      double v59 = v30;
      double v56 = v33;
      double v57 = v32;
      [*(id *)(a1 + 32) currentViewAreaSafeAreaInsets];
      double v54 = v35;
      double v55 = v34;
      double v52 = v37;
      double v53 = v36;
      objc_msgSend(*(id *)(a1 + 32), "setCurrentViewAreaFrame:", v9, v11, v13, v15);
      objc_msgSend(*(id *)(a1 + 32), "setCurrentViewAreaSafeAreaInsets:", v17, v19, v21, v23);
      [*(id *)(a1 + 32) setCurrentViewAreaTransitionControlType:*(void *)(a1 + 56)];
      [*(id *)(a1 + 32) setCurrentStatusBarEdge:v24];
      objc_msgSend(*(id *)(a1 + 32), "setCurrentViewAreaSupportsFocusTransfer:", objc_msgSend(*(id *)(a1 + 48), "supportsFocusTransfer"));
      unint64_t v38 = [*(id *)(a1 + 32) observers];
      uint64_t v39 = *(void **)(a1 + 32);
      [v39 currentViewAreaFrame];
      uint64_t v41 = v40;
      uint64_t v43 = v42;
      uint64_t v45 = v44;
      uint64_t v47 = v46;
      [*(id *)(a1 + 32) currentViewAreaSafeAreaInsets];
      objc_msgSend(v38, "environmentConfiguration:viewAreaDidChangeFromViewAreaFrame:safeAreaInsets:toViewAreaFrame:safeAreaInsets:duration:transitionControlType:", v39, *(void *)(a1 + 56), v59, v58, v57, v56, v55, v54, v53, v52, v41, v43, v45, v47, v48, v49,
        v50,
        v51,
        *(void *)(a1 + 64));
    }
  }
}

- (void)session:(id)a3 showUIForScreenInfo:(id)a4 withURL:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__DBEnvironmentConfiguration_session_showUIForScreenInfo_withURL___block_invoke;
  block[3] = &unk_2649B3ED8;
  id v12 = v7;
  double v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __66__DBEnvironmentConfiguration_session_showUIForScreenInfo_withURL___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) identifier];
  char v3 = [*(id *)(a1 + 40) displayConfiguration];
  double v4 = [v3 hardwareIdentifier];
  int v5 = [v2 isEqualToString:v4];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) observers];
    [v6 environmentConfiguration:*(void *)(a1 + 40) receivedShowUIWithURL:*(void *)(a1 + 48)];
  }
}

- (void)session:(id)a3 stopUIForScreenInfo:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__DBEnvironmentConfiguration_session_stopUIForScreenInfo___block_invoke;
  v7[3] = &unk_2649B3D30;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __58__DBEnvironmentConfiguration_session_stopUIForScreenInfo___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) identifier];
  char v3 = [*(id *)(a1 + 40) displayConfiguration];
  double v4 = [v3 hardwareIdentifier];
  int v5 = [v2 isEqualToString:v4];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) observers];
    [v6 stopUIReceivedForEnvironmentConfiguration:*(void *)(a1 + 40)];
  }
}

- (void)session:(id)a3 didUpdateNightMode:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__DBEnvironmentConfiguration_session_didUpdateNightMode___block_invoke;
  v4[3] = &unk_2649B4110;
  v4[4] = self;
  BOOL v5 = a4;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __57__DBEnvironmentConfiguration_session_didUpdateNightMode___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 environmentConfiguration:*(void *)(a1 + 32) nightModeDidChange:*(unsigned __int8 *)(a1 + 40)];
}

- (void)session:(id)a3 didUpdateAppearanceStyle:(int64_t)a4 forScreenUUID:(id)a5
{
  id v7 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__DBEnvironmentConfiguration_session_didUpdateAppearanceStyle_forScreenUUID___block_invoke;
  block[3] = &unk_2649B4138;
  double v11 = self;
  int64_t v12 = a4;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __77__DBEnvironmentConfiguration_session_didUpdateAppearanceStyle_forScreenUUID___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  double v4 = [*(id *)(a1 + 40) displayConfiguration];
  BOOL v5 = [v4 hardwareIdentifier];
  LODWORD(v2) = [v2 isEqualToString:v5];

  if (v2)
  {
    *(void *)(*(void *)(a1 + 40) + 152) = v3;
    id v6 = [*(id *)(a1 + 40) observers];
    [v6 environmentConfiguration:*(void *)(a1 + 40) appearanceStyleDidChange:v3];
  }
}

- (void)session:(id)a3 didUpdateMapAppearanceStyle:(int64_t)a4 forScreenUUID:(id)a5
{
  id v7 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__DBEnvironmentConfiguration_session_didUpdateMapAppearanceStyle_forScreenUUID___block_invoke;
  block[3] = &unk_2649B4138;
  double v11 = self;
  int64_t v12 = a4;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __80__DBEnvironmentConfiguration_session_didUpdateMapAppearanceStyle_forScreenUUID___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  double v4 = [*(id *)(a1 + 40) displayConfiguration];
  BOOL v5 = [v4 hardwareIdentifier];
  LODWORD(v2) = [v2 isEqualToString:v5];

  if (v2)
  {
    *(void *)(*(void *)(a1 + 40) + 240) = v3;
    id v6 = [*(id *)(a1 + 40) observers];
    objc_msgSend(v6, "environmentConfiguration:mapsAppearanceStyleDidChange:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "effectiveMapsUserInterfaceStyle"));
  }
}

- (void)sessionDidUpdateCarCapabilities:(id)a3
{
  double v4 = DBLogForCategory(0x10uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "CarCapabilities updated, kicking off a style update", v7, 2u);
  }

  BOOL v5 = [(DBEnvironmentConfiguration *)self observers];
  objc_msgSend(v5, "environmentConfiguration:appearanceStyleDidChange:", self, -[DBEnvironmentConfiguration carUserInterfaceStyle](self, "carUserInterfaceStyle"));

  id v6 = [(DBEnvironmentConfiguration *)self observers];
  objc_msgSend(v6, "environmentConfiguration:mapsAppearanceStyleDidChange:", self, -[DBEnvironmentConfiguration effectiveMapsUserInterfaceStyle](self, "effectiveMapsUserInterfaceStyle"));
}

- (int64_t)effectiveMapsUserInterfaceStyle
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int64_t v3 = [(DBEnvironmentConfiguration *)self _effectiveVehicleAppearancePreference];
  BOOL v4 = [(DBEnvironmentConfiguration *)self _prefersDarkMapsAppearance];
  BOOL v5 = DBLogForCategory(0x10uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromBOOL();
    id v7 = NSStringFromBOOL();
    int v13 = 138543618;
    id v14 = v6;
    __int16 v15 = 2114;
    double v16 = v7;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Determining effective map style. Always dark appearance: %{public}@, prefers dark maps: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  if (v3 == 2 && v4)
  {
    id v9 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      int64_t v10 = 2;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Using map style dark", (uint8_t *)&v13, 2u);
    }
    else
    {
      int64_t v10 = 2;
    }
  }
  else
  {
    int64_t v10 = [(DBEnvironmentConfiguration *)self mapsUserInterfaceStyle];
    id v9 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = CPUIDescriptionForUserInterfaceStyle();
      int v13 = 138543362;
      id v14 = v11;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Using environment map style: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }

  return v10;
}

- (void)sessionController:(id)a3 didUpdateVehicle:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 pairingStatus];
    int64_t v10 = DBLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      uint64_t v19 = v9;
      _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Vehicle pairing status: %ld", (uint8_t *)&v18, 0xCu);
    }

    [(DBEnvironmentConfiguration *)self setKnownVehicle:v9 != 0];
    [(DBEnvironmentConfiguration *)self setPairedVehicle:v9 == 2];
    double v11 = [v8 identifier];
    int64_t v12 = [v11 UUIDString];
    [(DBEnvironmentConfiguration *)self setVehicleID:v12];
  }
  objc_storeStrong((id *)&self->_vehicle, a4);
  int v13 = DBLogForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    uint64_t v19 = (uint64_t)v8;
    _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Assigning vehicle to wallpaper preferences: %@", (uint8_t *)&v18, 0xCu);
  }

  id v14 = [(DBEnvironmentConfiguration *)self wallpaperPreferences];
  [v14 setVehicle:v8];

  __int16 v15 = [(DBEnvironmentConfiguration *)self observers];
  objc_msgSend(v15, "environmentConfiguration:appearanceStyleDidChange:", self, -[DBEnvironmentConfiguration carUserInterfaceStyle](self, "carUserInterfaceStyle"));

  double v16 = [(DBEnvironmentConfiguration *)self observers];
  objc_msgSend(v16, "environmentConfiguration:mapsAppearanceStyleDidChange:", self, -[DBEnvironmentConfiguration effectiveMapsUserInterfaceStyle](self, "effectiveMapsUserInterfaceStyle"));

  uint64_t v17 = [(DBEnvironmentConfiguration *)self observers];
  [v17 environmentConfigurationPairedVehiclesDidChange:self];
}

- (int64_t)_effectiveVehicleAppearancePreference
{
  int64_t v3 = [(DBEnvironmentConfiguration *)self vehicle];
  if (!v3)
  {
    BOOL v4 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[DBEnvironmentConfiguration _effectiveVehicleAppearancePreference](v4);
    }
  }
  uint64_t v5 = [v3 appearanceModePreference];
  if (v5 == -1)
  {
    id v6 = [(DBEnvironmentConfiguration *)self session];
    id v7 = [v6 configuration];
    uint64_t v5 = [v7 userInterfaceStyle];

    id v8 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(DBEnvironmentConfiguration *)v5 _effectiveVehicleAppearancePreference];
    }
  }
  return v5;
}

- (BOOL)_prefersDarkMapsAppearance
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [(DBEnvironmentConfiguration *)self vehicle];
  int64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 mapsAppearancePreference];
    uint64_t v5 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134349056;
      uint64_t v10 = v4;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Vehicle map style preference: %{public}ld", (uint8_t *)&v9, 0xCu);
    }

    BOOL v6 = v4 == 2;
  }
  else
  {
    id v7 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DBEnvironmentConfiguration _prefersDarkMapsAppearance](v7);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)_statusBarEdgeForViewArea:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBEnvironmentConfiguration *)self viewAreaToStatusBarEdgeMap];
  BOOL v6 = [v5 objectForKey:v4];

  unint64_t v7 = [v6 integerValue];
  return v7;
}

- (void)_computeStatusBarEdgesForViewAreas:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F30E28] statusBarEdgeOverride];
  BOOL v6 = [v5 internalSettingsValue];

  uint64_t v27 = 0;
  double v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__DBEnvironmentConfiguration__computeStatusBarEdgesForViewAreas___block_invoke;
  v13[3] = &unk_2649B4160;
  id v7 = v6;
  id v14 = v7;
  __int16 v15 = self;
  double v16 = &v27;
  uint64_t v17 = &v23;
  int v18 = &v19;
  objc_msgSend(v4, "bs_each:", v13);
  if (!*((unsigned char *)v28 + 24) && *((unsigned char *)v24 + 24) && *((unsigned char *)v20 + 24))
  {
    int v9 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Applying horizontal status bar to all view areas", buf, 2u);
    }

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__DBEnvironmentConfiguration__computeStatusBarEdgesForViewAreas___block_invoke_234;
    v11[3] = &unk_2649B4188;
    v11[4] = self;
    objc_msgSend(v4, "bs_each:", v11);
  }
  if ([(DBEnvironmentConfiguration *)self supportsGaugeCluster]
    && [(DBEnvironmentConfiguration *)self supportsDisplayPlugin]
    && *((unsigned char *)v20 + 24))
  {
    id v8 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Feature enabled and connected to DP managed display, applying horizontal status bar to all view areas", buf, 2u);
    }

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__DBEnvironmentConfiguration__computeStatusBarEdgesForViewAreas___block_invoke_236;
    v10[3] = &unk_2649B4188;
    v10[4] = self;
    objc_msgSend(v4, "bs_each:", v10);
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

void __65__DBEnvironmentConfiguration__computeStatusBarEdgesForViewAreas___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)double v28 = 138543362;
    *(void *)&v28[4] = v3;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Computing effective status bar edge for view area: %{public}@", v28, 0xCu);
  }

  uint64_t v5 = *(void **)(a1 + 32);
  if (v5 && [v5 integerValue])
  {
    uint64_t v6 = [*(id *)(a1 + 32) integerValue];
    id v7 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(id)objc_opt_class() _stringForStatusBarEdge:v6];
      *(_DWORD *)double v28 = 138543362;
      *(void *)&v28[4] = v8;
      int v9 = "Status bar override set to %{public}@";
LABEL_10:
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, v9, v28, 0xCu);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ([v3 statusBarEdge])
  {
    uint64_t v6 = [v3 statusBarEdge];
    id v7 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(id)objc_opt_class() _stringForStatusBarEdge:v6];
      *(_DWORD *)double v28 = 138543362;
      *(void *)&v28[4] = v8;
      int v9 = "Using view area status bar edge: %{public}@";
      goto LABEL_10;
    }
LABEL_11:

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_12;
  }
  [v3 safeFrame];
  double Width = CGRectGetWidth(v31);
  [v3 safeFrame];
  double v21 = Width / CGRectGetHeight(v32);
  char v22 = DBLogForCategory(4uLL);
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21 >= 1.3)
  {
    if (v23)
    {
      *(_DWORD *)double v28 = 134217984;
      *(double *)&v28[4] = v21;
      uint64_t v27 = "View area aspect ratio %f does not meet Dashboard portrait threshold.";
LABEL_34:
      _os_log_impl(&dword_22D6F0000, v22, OS_LOG_TYPE_DEFAULT, v27, v28, 0xCu);
    }
LABEL_35:

    uint64_t v6 = 2;
    goto LABEL_12;
  }
  if (v23)
  {
    *(_DWORD *)double v28 = 134217984;
    *(double *)&v28[4] = v21;
    _os_log_impl(&dword_22D6F0000, v22, OS_LOG_TYPE_DEFAULT, "View area aspect ratio %f meets Dashboard portrait threshold. Checking the Dashboard's aspect ratio...", v28, 0xCu);
  }

  [v3 safeFrame];
  double v24 = CGRectGetWidth(v33);
  [v3 safeFrame];
  double v25 = v24 / (CGRectGetHeight(v34) - 45.0);
  char v22 = DBLogForCategory(4uLL);
  BOOL v26 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v25 >= 1.3)
  {
    if (v26)
    {
      *(_DWORD *)double v28 = 134217984;
      *(double *)&v28[4] = v25;
      uint64_t v27 = "Dashboard aspect ratio %f does not meet portrait threshold";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (v26)
  {
    *(_DWORD *)double v28 = 134217984;
    *(double *)&v28[4] = v25;
    _os_log_impl(&dword_22D6F0000, v22, OS_LOG_TYPE_DEFAULT, "Dashboard aspect ratio %f also meets portrait threshold, moving status bar to bottom", v28, 0xCu);
  }

  uint64_t v6 = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
LABEL_12:
  objc_msgSend(*(id *)(a1 + 40), "screenScale", *(_OWORD *)v28);
  double v11 = v10 * 273.0;
  [v3 safeFrame];
  double Height = CGRectGetHeight(v30);
  int v13 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = @" NOT";
    if (Height >= v11) {
      id v14 = &stru_26E13A820;
    }
    *(_DWORD *)double v28 = 138543362;
    *(void *)&v28[4] = v14;
    _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "View area is%{public}@ tall enough for horizontal status bar", v28, 0xCu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  BOOL v17 = Height >= v11 && *(unsigned char *)(v15 + 24) != 0;
  *(unsigned char *)(v15 + 24) = v17;
  int v18 = [*(id *)(a1 + 40) viewAreaToStatusBarEdgeMap];
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:v6];
  [v18 setObject:v19 forKey:v3];
}

void __65__DBEnvironmentConfiguration__computeStatusBarEdgesForViewAreas___block_invoke_234(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 viewAreaToStatusBarEdgeMap];
  [v4 setObject:&unk_26E17EAB0 forKey:v3];
}

void __65__DBEnvironmentConfiguration__computeStatusBarEdgesForViewAreas___block_invoke_236(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 viewAreaToStatusBarEdgeMap];
  [v4 setObject:&unk_26E17EAB0 forKey:v3];
}

+ (id)_stringForStatusBarEdge:(unint64_t)a3
{
  if (a3 > 3) {
    return @"unknown";
  }
  else {
    return off_2649B41A8[a3];
  }
}

- (void)_showUIOverrideInstructionCard
{
  if (DBIsInternalInstall_onceToken_1 != -1) {
    dispatch_once(&DBIsInternalInstall_onceToken_1, &__block_literal_global_2);
  }
  if (DBIsInternalInstall_isInternal_1)
  {
    id v4 = (id)[objc_alloc(NSURL) initWithString:@"maps:/car/instrumentcluster/instructioncard"];
    id v3 = [(DBEnvironmentConfiguration *)self observers];
    [v3 environmentConfiguration:self receivedShowUIWithURL:v4];
  }
}

- (void)_showUIOverrideMap
{
  if (DBIsInternalInstall_onceToken_1 != -1) {
    dispatch_once(&DBIsInternalInstall_onceToken_1, &__block_literal_global_2);
  }
  if (DBIsInternalInstall_isInternal_1)
  {
    id v4 = (id)[objc_alloc(NSURL) initWithString:@"maps:/car/instrumentcluster/map"];
    id v3 = [(DBEnvironmentConfiguration *)self observers];
    [v3 environmentConfiguration:self receivedShowUIWithURL:v4];
  }
}

- (void)_showUIOverrideDefault
{
  if (DBIsInternalInstall_onceToken_1 != -1) {
    dispatch_once(&DBIsInternalInstall_onceToken_1, &__block_literal_global_2);
  }
  if (DBIsInternalInstall_isInternal_1)
  {
    id v4 = (id)[objc_alloc(NSURL) initWithString:@"maps:/car/instrumentcluster"];
    id v3 = [(DBEnvironmentConfiguration *)self observers];
    [v3 environmentConfiguration:self receivedShowUIWithURL:v4];
  }
}

- (DBAnalytics)analytics
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsProvider);
  id v3 = [WeakRetained currentAnalytics];

  return (DBAnalytics *)v3;
}

- (unint64_t)interactionAffordances
{
  return self->_interactionAffordances;
}

- (int64_t)layoutJustification
{
  return self->_layoutJustification;
}

- (BOOL)screenSupportsFocus
{
  return self->_screenSupportsFocus;
}

- (CARSession)session
{
  return self->_session;
}

- (DBUISyncChannel)uisyncChannel
{
  return self->_uisyncChannel;
}

- (void)setUisyncChannel:(id)a3
{
}

- (DBLayerMetadataService)layerMetadataService
{
  return self->_layerMetadataService;
}

- (void)setLayerMetadataService:(id)a3
{
}

- (_TtC9DashBoard15DBUISyncSession)uisyncSession
{
  return self->_uisyncSession;
}

- (void)setUisyncSession:(id)a3
{
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (FBSDisplayLayoutPublisher)displayLayoutPublisher
{
  return self->_displayLayoutPublisher;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (CGRect)currentViewAreaFrame
{
  double x = self->_currentViewAreaFrame.origin.x;
  double y = self->_currentViewAreaFrame.origin.y;
  double width = self->_currentViewAreaFrame.size.width;
  double height = self->_currentViewAreaFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentViewAreaFrame:(CGRect)a3
{
  self->_currentViewAreaFrame = a3;
}

- (CGRect)currentUnadjustedSafeViewAreaFrame
{
  double x = self->_currentUnadjustedSafeViewAreaFrame.origin.x;
  double y = self->_currentUnadjustedSafeViewAreaFrame.origin.y;
  double width = self->_currentUnadjustedSafeViewAreaFrame.size.width;
  double height = self->_currentUnadjustedSafeViewAreaFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)currentViewAreaSafeAreaInsets
{
  double top = self->_currentViewAreaSafeAreaInsets.top;
  double left = self->_currentViewAreaSafeAreaInsets.left;
  double bottom = self->_currentViewAreaSafeAreaInsets.bottom;
  double right = self->_currentViewAreaSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCurrentViewAreaSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_currentViewAreaSafeAreaInsets = a3;
}

- (unint64_t)currentViewAreaTransitionControlType
{
  return self->_currentViewAreaTransitionControlType;
}

- (void)setCurrentViewAreaTransitionControlType:(unint64_t)a3
{
  self->_currentViewAreaTransitionControlType = a3;
}

- (unint64_t)currentStatusBarEdge
{
  return self->_currentStatusBarEdge;
}

- (void)setCurrentStatusBarEdge:(unint64_t)a3
{
  self->_currentStatusBarEdge = a3;
}

- (BOOL)currentViewAreaSupportsFocusTransfer
{
  return self->_currentViewAreaSupportsFocusTransfer;
}

- (void)setCurrentViewAreaSupportsFocusTransfer:(BOOL)a3
{
  self->_currentViewAreaSupportsFocusTransfer = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (CRVehicle)vehicle
{
  return self->_vehicle;
}

- (BOOL)isACBackSupported
{
  return self->_acBackSupported;
}

- (BOOL)isConnectedWirelessly
{
  return self->_connectedWirelessly;
}

- (BOOL)isGeoSupported
{
  return self->_geoSupported;
}

- (BOOL)isKnownVehicle
{
  return self->_knownVehicle;
}

- (void)setKnownVehicle:(BOOL)a3
{
  self->_knownVehicle = a3;
}

- (NSString)vehicleID
{
  return self->_vehicleID;
}

- (void)setVehicleID:(id)a3
{
}

- (NSString)OEMIconLabel
{
  return self->_OEMIconLabel;
}

- (BOOL)isOEMIconVisible
{
  return self->_OEMIconVisible;
}

- (BOOL)isPairedVehicle
{
  return self->_pairedVehicle;
}

- (void)setPairedVehicle:(BOOL)a3
{
  self->_pairedVehicle = a3;
}

- (BOOL)isRightHandDrive
{
  return self->_rightHandDrive;
}

- (int64_t)carUserInterfaceStyle
{
  return self->_carUserInterfaceStyle;
}

- (DBNavigationStateProvider)navigationStateProvider
{
  return self->_navigationStateProvider;
}

- (DBIconBadgeController)iconBadgeController
{
  return self->_iconBadgeController;
}

- (DBAppHistory)appHistory
{
  return self->_appHistory;
}

- (DBProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (DBThermalMonitor)thermalMonitor
{
  return self->_thermalMonitor;
}

- (CRSUIWallpaperPreferences)wallpaperPreferences
{
  return self->_wallpaperPreferences;
}

- (DBIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void)setIconImageCache:(id)a3
{
}

- (BOOL)isVehicleDataSession
{
  return self->_vehicleDataSession;
}

- (BOOL)supportsDisplayPlugin
{
  return self->_supportsDisplayPlugin;
}

- (_TtC9DashBoard17DBThemeController)themeController
{
  return self->_themeController;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMapTable)viewAreaToStatusBarEdgeMap
{
  return self->_viewAreaToStatusBarEdgeMap;
}

- (void)setViewAreaToStatusBarEdgeMap:(id)a3
{
}

- (int64_t)mapsUserInterfaceStyle
{
  return self->_mapsUserInterfaceStyle;
}

- (void)setMapsUserInterfaceStyle:(int64_t)a3
{
  self->_uint64_t mapsUserInterfaceStyle = a3;
}

- (unint64_t)supportedFeatures
{
  return self->_supportedFeatures;
}

- (DBAnalyticsProvider)analyticsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsProvider);
  return (DBAnalyticsProvider *)WeakRetained;
}

- (void)setAnalyticsProvider:(id)a3
{
}

- (_TtC9DashBoard16DBSystemUILayout)systemUILayout
{
  return self->_systemUILayout;
}

- (void)setSystemUILayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemUILayout, 0);
  objc_destroyWeak((id *)&self->_analyticsProvider);
  objc_storeStrong((id *)&self->_viewAreaToStatusBarEdgeMap, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_themeController, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_wallpaperPreferences, 0);
  objc_storeStrong((id *)&self->_thermalMonitor, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_appHistory, 0);
  objc_storeStrong((id *)&self->_iconBadgeController, 0);
  objc_storeStrong((id *)&self->_navigationStateProvider, 0);
  objc_storeStrong((id *)&self->_OEMIconLabel, 0);
  objc_storeStrong((id *)&self->_vehicleID, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_displayLayoutPublisher, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_uisyncSession, 0);
  objc_storeStrong((id *)&self->_layerMetadataService, 0);
  objc_storeStrong((id *)&self->_uisyncChannel, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_effectiveVehicleAppearancePreference
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D6F0000, log, OS_LOG_TYPE_ERROR, "Attempting to get style but no vehicle available", v1, 2u);
}

- (void)_prefersDarkMapsAppearance
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D6F0000, log, OS_LOG_TYPE_ERROR, "Attempting to get map appearance preference but no vehicle available", v1, 2u);
}

@end