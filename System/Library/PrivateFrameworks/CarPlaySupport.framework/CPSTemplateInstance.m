@interface CPSTemplateInstance
- (BOOL)_handleAppViewConnection:(id)a3;
- (BOOL)_handleDashboardConnection:(id)a3;
- (BOOL)_handleInstrumentClusterConnection:(id)a3;
- (BOOL)_templateIsValidForCurrentEntitlement:(id)a3 presentationStyle:(unint64_t)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CPDashboardClientInterface)dashboardControllerRemoteObjectProxy;
- (CPNavigationManager)navigationManager;
- (CPSApplicationStateMonitor)applicationStateMonitor;
- (CPSBannerSource)bannerSource;
- (CPSClusterTemplateSetupDelegate)clusterSetupDelegate;
- (CPSDashboardEstimatesViewController)dashboardEstimatesViewController;
- (CPSDashboardGuidanceViewController)dashboardGuidanceViewController;
- (CPSInstrumentClusterCardViewController)instrumentClusterCardViewController;
- (CPSInstrumentClusterCardViewController)instrumentClusterMapETAViewController;
- (CPSNavigator)navigator;
- (CPSOverlayViewController)overlayViewController;
- (CPSTabBarViewController)tabBarViewController;
- (CPSTemplateEnvironment)templateEnvironment;
- (CPSTemplateInstance)initWithBundleIdentifier:(id)a3;
- (CPTemplateServiceClientInterface)interfaceControllerRemoteObjectProxy;
- (FBScene)instrumentClusterScene;
- (FBScene)mapWidgetScene;
- (FBScene)scene;
- (NSArray)clusterAttributedInactiveVariants;
- (NSArray)clusterInactiveVariants;
- (NSMapTable)instrumentClusterViewControllerMapTable;
- (NSMutableDictionary)identifierToViewControllerDictionary;
- (NSString)sceneIdentifier;
- (NSUUID)actionSheetIdentifier;
- (NSXPCConnection)dashboardControllerConnection;
- (NSXPCConnection)instrumentClusterControllerConnection;
- (NSXPCConnection)interfaceControllerConnection;
- (NSXPCListener)dashboardControllerListener;
- (NSXPCListener)instrumentClusterControllerListener;
- (NSXPCListener)interfaceControllerListener;
- (SiriDirectActionSource)siriActivationSource;
- (UIEdgeInsets)currentSafeAreaInsets;
- (UIEdgeInsets)safeAreaInsetsForScene:(id)a3;
- (UIViewController)rootViewController;
- (UIWindowScene)windowSceneForGuidanceWidgetScene;
- (UIWindowScene)windowSceneForInstrumentClusterMapWidgetScene;
- (UIWindowScene)windowSceneForMapWidgetScene;
- (UIWindowScene)windowSceneForTemplateApplicationScene;
- (id)dashboardEndpoint;
- (id)endpoint;
- (id)instrumentClusterEndpoint;
- (id)instrumentClusterViewControllerForDisplayIdentifier:(id)a3;
- (void)_appViewConnectionInvalidationHandler;
- (void)_applicationDidThrottleAudioUpdates:(id)a3;
- (void)_dashboardConnectionInvalidationHandler;
- (void)_instrumentClusterConnectionInvalidationHandler;
- (void)_pushNowPlayingIfNeeded;
- (void)addLaneGuidances:(id)a3;
- (void)addManeuvers:(id)a3;
- (void)allowlistClassesForBaseTemplateProvider:(id)a3;
- (void)bannerDidAppearWithIdentifier:(id)a3;
- (void)bannerDidDisappearWithIdentifier:(id)a3;
- (void)bannerTappedWithIdentifier:(id)a3;
- (void)cancelTrip;
- (void)clientRequestNowPlayingTemplateAnimated:(BOOL)a3;
- (void)containsTemplate:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)didCreateNavigator:(id)a3;
- (void)dismissTemplateAnimated:(id)a3 reply:(id)a4;
- (void)finishTrip;
- (void)getPresentedTemplateWithReply:(id)a3;
- (void)getTemplatesWithReply:(id)a3;
- (void)getTopTemplateWithReply:(id)a3;
- (void)hostConnectToClient;
- (void)hostSetAttributedInactiveVariants:(id)a3;
- (void)hostSetInactiveVariants:(id)a3;
- (void)hostSetShortcutButtons:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationOwnershipChangedToOwner:(unint64_t)a3;
- (void)pauseTripForReason:(unint64_t)a3;
- (void)popTemplateAnimated:(id)a3 reply:(id)a4;
- (void)popToRootTemplateAnimated:(id)a3 reply:(id)a4;
- (void)popToTemplate:(id)a3 animated:(id)a4 reply:(id)a5;
- (void)presentActionSheetTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 reply:(id)a6;
- (void)presentAlertTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 reply:(id)a6;
- (void)presentVoiceTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 reply:(id)a6;
- (void)pushEntityTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7;
- (void)pushGridTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7;
- (void)pushInformationTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7;
- (void)pushListTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7;
- (void)pushMapTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7;
- (void)pushNowPlayingTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7;
- (void)pushSearchTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7;
- (void)requestBannerProviderWithReply:(id)a3;
- (void)requestNavigationProviderForMapTemplate:(id)a3 withReply:(id)a4;
- (void)routeChangedWithReason:(unsigned __int8)a3 routeInfo:(id)a4;
- (void)selectTabBarTemplateAtIndex:(int64_t)a3;
- (void)sendSuggestUI:(id)a3;
- (void)setActionSheetIdentifier:(id)a3;
- (void)setActiveManeuvers:(id)a3;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setBannerSource:(id)a3;
- (void)setClusterAttributedInactiveVariants:(id)a3;
- (void)setClusterInactiveVariants:(id)a3;
- (void)setClusterSetupDelegate:(id)a3;
- (void)setCurrentLaneGuidance:(id)a3;
- (void)setCurrentRoadNameVariants:(id)a3;
- (void)setCurrentSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setDashboardControllerConnection:(id)a3;
- (void)setDashboardControllerListener:(id)a3;
- (void)setDashboardControllerRemoteObjectProxy:(id)a3;
- (void)setDestinationNameVariants:(id)a3;
- (void)setDestinationTimeZoneOffsetMinutes:(signed __int16)a3;
- (void)setHostPrefersDarkUserInterfaceStyle:(BOOL)a3;
- (void)setIdentifierToViewControllerDictionary:(id)a3;
- (void)setInstrumentClusterCardViewController:(id)a3;
- (void)setInstrumentClusterControllerConnection:(id)a3;
- (void)setInstrumentClusterControllerListener:(id)a3;
- (void)setInstrumentClusterMapETAViewController:(id)a3;
- (void)setInstrumentClusterScene:(id)a3;
- (void)setInstrumentClusterViewControllerMapTable:(id)a3;
- (void)setInterfaceControllerConnection:(id)a3;
- (void)setInterfaceControllerListener:(id)a3;
- (void)setInterfaceControllerRemoteObjectProxy:(id)a3;
- (void)setManeuverState:(int64_t)a3;
- (void)setMapWidgetScene:(id)a3;
- (void)setNavigationManager:(id)a3;
- (void)setNavigator:(id)a3;
- (void)setOverlayViewController:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setScene:(id)a3;
- (void)setSendsNavigationMetadata:(BOOL)a3;
- (void)setSiriActivationSource:(id)a3;
- (void)setTabBarTemplate:(id)a3 withProxyDelegate:(id)a4 reply:(id)a5 animated:(id)a6;
- (void)setTabBarViewController:(id)a3;
- (void)setTemplateEnvironment:(id)a3;
- (void)setWindowSceneForGuidanceWidgetScene:(id)a3;
- (void)setWindowSceneForInstrumentClusterMapWidgetScene:(id)a3;
- (void)setWindowSceneForMapWidgetScene:(id)a3;
- (void)setWindowSceneForTemplateApplicationScene:(id)a3;
- (void)startRerouting;
- (void)templateViewController:(id)a3 shouldActivateSiriWithDirectActionContext:(id)a4;
- (void)templateViewControllerDidDismiss:(id)a3;
- (void)templateViewControllerDidPop:(id)a3;
- (void)updateInterestingInsets:(UIEdgeInsets)a3;
- (void)updateTabBarTemplate:(id)a3;
- (void)updateTravelEstimates:(id)a3 forManeuver:(id)a4;
- (void)updateTripTravelEstimates:(id)a3;
- (void)viewController:(id)a3 didUpdateSafeAreaInsets:(UIEdgeInsets)a4;
@end

@implementation CPSTemplateInstance

- (CPSTemplateInstance)initWithBundleIdentifier:(id)a3
{
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v34;
  v34 = 0;
  v32.receiver = v3;
  v32.super_class = (Class)CPSTemplateInstance;
  v34 = [(CPSTemplateInstance *)&v32 init];
  objc_storeStrong((id *)&v34, v34);
  if (v34)
  {
    v4 = objc_alloc_init(CPSApplicationStateMonitor);
    applicationStateMonitor = v34->_applicationStateMonitor;
    v34->_applicationStateMonitor = v4;

    v6 = [CPSBannerSource alloc];
    uint64_t v7 = [(CPSBannerSource *)v6 initWithBundleIdentifier:location[0] delegate:v34 applicationStateMonitor:v34->_applicationStateMonitor];
    bannerSource = v34->_bannerSource;
    v34->_bannerSource = (CPSBannerSource *)v7;

    v9 = -[CPSOverlayViewController initWithNavigationBarClass:toolbarClass:]([CPSOverlayViewController alloc], "initWithNavigationBarClass:toolbarClass:", objc_opt_class());
    overlayViewController = v34->_overlayViewController;
    v34->_overlayViewController = v9;

    id v30 = (id)[(CPSOverlayViewController *)v34->_overlayViewController view];
    [v30 setHidden:1];

    [(CPSOverlayViewController *)v34->_overlayViewController setDelegate:v34];
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    identifierToViewControllerDictionary = v34->_identifierToViewControllerDictionary;
    v34->_identifierToViewControllerDictionary = v11;

    v13 = (NSXPCListener *)(id)[MEMORY[0x263F08D88] anonymousListener];
    interfaceControllerListener = v34->_interfaceControllerListener;
    v34->_interfaceControllerListener = v13;

    [(NSXPCListener *)v34->_interfaceControllerListener setDelegate:v34];
    [(NSXPCListener *)v34->_interfaceControllerListener resume];
    v15 = objc_alloc_init(CPSDashboardGuidanceViewController);
    dashboardGuidanceViewController = v34->_dashboardGuidanceViewController;
    v34->_dashboardGuidanceViewController = v15;

    v17 = objc_alloc_init(CPSDashboardEstimatesViewController);
    dashboardEstimatesViewController = v34->_dashboardEstimatesViewController;
    v34->_dashboardEstimatesViewController = v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x263F6C768]) initWithDelegate:0];
    siriActivationSource = v34->_siriActivationSource;
    v34->_siriActivationSource = (SiriDirectActionSource *)v19;

    id v21 = objc_alloc(MEMORY[0x263EFCA50]);
    uint64_t v22 = [v21 initWithIdentifier:location[0] delegate:v34];
    navigationManager = v34->_navigationManager;
    v34->_navigationManager = (CPNavigationManager *)v22;

    v24 = (NSXPCListener *)(id)[MEMORY[0x263F08D88] anonymousListener];
    dashboardControllerListener = v34->_dashboardControllerListener;
    v34->_dashboardControllerListener = v24;

    [(NSXPCListener *)v34->_dashboardControllerListener setDelegate:v34];
    [(NSXPCListener *)v34->_dashboardControllerListener resume];
    v26 = (NSXPCListener *)(id)[MEMORY[0x263F08D88] anonymousListener];
    instrumentClusterControllerListener = v34->_instrumentClusterControllerListener;
    v34->_instrumentClusterControllerListener = v26;

    [(NSXPCListener *)v34->_instrumentClusterControllerListener setDelegate:v34];
    [(NSXPCListener *)v34->_instrumentClusterControllerListener resume];
    id v31 = (id)[MEMORY[0x263F08A00] defaultCenter];
    [v31 addObserver:v34 selector:sel__applicationDidThrottleAudioUpdates_ name:@"CPSAudioManagerDidThrottleUpdateNotification" object:0];
  }
  v29 = v34;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v34, 0);
  return v29;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(CPSTemplateInstance *)self invalidate];
  v2.receiver = v4;
  v2.super_class = (Class)CPSTemplateInstance;
  [(CPSTemplateInstance *)&v2 dealloc];
}

- (id)endpoint
{
  v4 = [(CPSTemplateInstance *)self interfaceControllerListener];
  SEL v3 = [(NSXPCListener *)v4 endpoint];
  id v5 = (id)[(NSXPCListenerEndpoint *)v3 _endpoint];

  return v5;
}

- (id)dashboardEndpoint
{
  v4 = [(CPSTemplateInstance *)self dashboardControllerListener];
  SEL v3 = [(NSXPCListener *)v4 endpoint];
  id v5 = (id)[(NSXPCListenerEndpoint *)v3 _endpoint];

  return v5;
}

- (id)instrumentClusterEndpoint
{
  v4 = [(CPSTemplateInstance *)self instrumentClusterControllerListener];
  SEL v3 = [(NSXPCListener *)v4 endpoint];
  id v5 = (id)[(NSXPCListenerEndpoint *)v3 _endpoint];

  return v5;
}

- (void)setScene:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v13->_scene);
  BOOL v5 = WeakRetained == location[0];

  if (!v5)
  {
    objc_storeWeak((id *)&v13->_scene, location[0]);
    queue = MEMORY[0x263EF83A0];
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    v9 = __32__CPSTemplateInstance_setScene___block_invoke;
    v10 = &unk_2648A3BE0;
    v11 = v13;
    dispatch_async(queue, &v6);

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(location, 0);
}

uint64_t __32__CPSTemplateInstance_setScene___block_invoke(uint64_t a1)
{
  uint64_t v6 = *(void **)(a1 + 32);
  [v6 currentSafeAreaInsets];
  return objc_msgSend(v6, "viewController:didUpdateSafeAreaInsets:", 0, v1, v2, v3, v4);
}

- (void)setMapWidgetScene:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v13->_mapWidgetScene);
  BOOL v5 = WeakRetained == location[0];

  if (!v5)
  {
    objc_storeWeak((id *)&v13->_mapWidgetScene, location[0]);
    queue = MEMORY[0x263EF83A0];
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    v9 = __41__CPSTemplateInstance_setMapWidgetScene___block_invoke;
    v10 = &unk_2648A3BE0;
    v11 = v13;
    dispatch_async(queue, &v6);

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(location, 0);
}

void __41__CPSTemplateInstance_setMapWidgetScene___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) dashboardEstimatesViewController];
  [v2 setSafeAreaDelegate:*(void *)(a1 + 32)];
}

- (void)setInstrumentClusterScene:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v13->_instrumentClusterScene);
  BOOL v5 = WeakRetained == location[0];

  if (!v5)
  {
    objc_storeWeak((id *)&v13->_instrumentClusterScene, location[0]);
    queue = MEMORY[0x263EF83A0];
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    v9 = __49__CPSTemplateInstance_setInstrumentClusterScene___block_invoke;
    v10 = &unk_2648A3BE0;
    v11 = v13;
    dispatch_async(queue, &v6);

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(location, 0);
}

void __49__CPSTemplateInstance_setInstrumentClusterScene___block_invoke(id *a1)
{
  v8[2] = a1;
  v8[1] = a1;
  id v2 = (id)[a1[4] instrumentClusterScene];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  uint64_t v6 = __49__CPSTemplateInstance_setInstrumentClusterScene___block_invoke_2;
  int v7 = &unk_2648A41F8;
  v8[0] = a1[4];
  objc_msgSend(v2, "updateUISettingsWithBlock:");

  objc_storeStrong(v8, 0);
}

void __49__CPSTemplateInstance_setInstrumentClusterScene___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = location[0];
  int v7 = (void *)a1[4];
  id v9 = (id)[v7 instrumentClusterScene];
  objc_msgSend(v7, "safeAreaInsetsForScene:");
  objc_msgSend(v8, "setSafeAreaInsetsPortrait:", v2, v3, v4, v5);

  objc_storeStrong(location, 0);
}

- (BOOL)_templateIsValidForCurrentEntitlement:(id)a3 presentationStyle:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v19 = a4;
  Class Class = object_getClass(location[0]);
  char v17 = 1;
  v12 = [(CPSTemplateInstance *)v21 templateEnvironment];
  v11 = [(CPSTemplateEnvironment *)v12 allowedTemplateClasses];
  BOOL v13 = [(NSSet *)v11 containsObject:Class];

  if (v13)
  {
    int v7 = [(CPSTemplateInstance *)v21 overlayViewController];
    id v8 = (id)[(CPSOverlayViewController *)v7 topViewController];
    objc_opt_class();
    BOOL v9 = 0;
    if (objc_opt_isKindOfClass()) {
      BOOL v9 = v19 == 0;
    }

    if (v9)
    {
      id v14 = CarPlaySupportGeneralLogging();
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v23, (uint64_t)location[0]);
        _os_log_error_impl(&dword_22B689000, (os_log_t)v14, OS_LOG_TYPE_ERROR, "Template may not be pushed on top of now playing: %{public}@", v23, 0xCu);
      }
      objc_storeStrong(&v14, 0);
      char v17 = [(objc_class *)Class isEqual:objc_opt_class()] & 1;
    }
  }
  else
  {
    id v16 = CarPlaySupportGeneralLogging();
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v24, (uint64_t)location[0]);
      _os_log_error_impl(&dword_22B689000, (os_log_t)v16, v15, "Template is disallowed for this app category: %{public}@", v24, 0xCu);
    }
    objc_storeStrong(&v16, 0);
    char v17 = 0;
  }
  if (v17)
  {
    char v22 = 1;
  }
  else
  {
    interfaceControllerRemoteObjectProxy = v21->_interfaceControllerRemoteObjectProxy;
    uint64_t v6 = NSStringFromClass(Class);
    -[CPTemplateServiceClientInterface clientPushedIllegalTemplateOfClass:](interfaceControllerRemoteObjectProxy, "clientPushedIllegalTemplateOfClass:");

    char v22 = 0;
  }
  objc_storeStrong(location, 0);
  return v22 & 1;
}

- (void)_applicationDidThrottleAudioUpdates:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPTemplateServiceClientInterface *)v4->_interfaceControllerRemoteObjectProxy clientExceededAudioMetadataThrottleLimit];
  objc_storeStrong(location, 0);
}

- (void)bannerTappedWithIdentifier:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v3 = [(CPSTemplateInstance *)v5 interfaceControllerRemoteObjectProxy];
  [(CPTemplateServiceClientInterface *)v3 bannerTappedWithIdentifier:location[0]];

  objc_storeStrong(location, 0);
}

- (void)bannerDidAppearWithIdentifier:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v3 = [(CPSTemplateInstance *)v5 interfaceControllerRemoteObjectProxy];
  [(CPTemplateServiceClientInterface *)v3 bannerDidAppearWithIdentifier:location[0]];

  objc_storeStrong(location, 0);
}

- (void)bannerDidDisappearWithIdentifier:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v3 = [(CPSTemplateInstance *)v5 interfaceControllerRemoteObjectProxy];
  [(CPTemplateServiceClientInterface *)v3 bannerDidDisappearWithIdentifier:location[0]];

  objc_storeStrong(location, 0);
}

- (void)sendSuggestUI:(id)a3
{
  BOOL v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v6 = [(CPSTemplateInstance *)v9 templateEnvironment];
  BOOL v7 = [(CPSTemplateEnvironment *)v6 supportsInstrumentCluster];

  if (v7)
  {
    double v5 = [(CPSTemplateInstance *)v9 templateEnvironment];
    double v4 = [(CPSTemplateEnvironment *)v5 sessionStatus];
    id v3 = (id)[(CARSessionStatus *)v4 currentSession];
    [v3 suggestUI:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)setHostPrefersDarkUserInterfaceStyle:(BOOL)a3
{
  BOOL v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  uint64_t v10 = 0;
  if (a3) {
    uint64_t v10 = 2;
  }
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  BOOL v7 = __60__CPSTemplateInstance_setHostPrefersDarkUserInterfaceStyle___block_invoke;
  id v8 = &unk_2648A3BE0;
  BOOL v9 = v13;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

void __60__CPSTemplateInstance_setHostPrefersDarkUserInterfaceStyle___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) overlayViewController];
  [v1 setOverrideUserInterfaceStyle:2];

  id v3 = (id)[*(id *)(a1 + 32) overlayViewController];
  [v3 setNeedsUserInterfaceAppearanceUpdate];
}

- (void)presentActionSheetTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 reply:(id)a6
{
  uint64_t v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v21 = 0;
  objc_storeStrong(&v21, a6);
  int v6 = (NSUUID *)(id)[location[0] identifier];
  actionSheetIdentifier = v25->_actionSheetIdentifier;
  v25->_actionSheetIdentifier = v6;

  [location[0] setAlertDelegate:v23];
  queue = MEMORY[0x263EF83A0];
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  os_log_type_t v15 = __83__CPSTemplateInstance_presentActionSheetTemplate_withProxyDelegate_animated_reply___block_invoke;
  id v16 = &unk_2648A4220;
  char v17 = v25;
  id v18 = location[0];
  id v19 = v22;
  id v20 = v21;
  dispatch_async(queue, &v12);

  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __83__CPSTemplateInstance_presentActionSheetTemplate_withProxyDelegate_animated_reply___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) overlayViewController];
  objc_msgSend(v2, "presentActionSheetTemplate:animated:completion:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "BOOLValue") & 1, *(void *)(a1 + 56));
}

- (void)presentAlertTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 reply:(id)a6
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  id v20 = 0;
  objc_storeStrong(&v20, a6);
  queue = MEMORY[0x263EF83A0];
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  int v13 = __77__CPSTemplateInstance_presentAlertTemplate_withProxyDelegate_animated_reply___block_invoke;
  int v14 = &unk_2648A4248;
  id v15 = location[0];
  id v16 = v22;
  char v17 = v24;
  id v18 = v21;
  id v19 = v20;
  dispatch_async(queue, &v10);

  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __77__CPSTemplateInstance_presentAlertTemplate_withProxyDelegate_animated_reply___block_invoke(uint64_t a1)
{
  v10[2] = (id)a1;
  v10[1] = (id)a1;
  [*(id *)(a1 + 32) setTemplateDelegate:*(void *)(a1 + 40)];
  id v3 = [CPSFullScreenAlertViewController alloc];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = (id)[*(id *)(a1 + 48) templateEnvironment];
  v10[0] = -[CPSFullScreenAlertViewController initWithAlert:alertDelegate:templateEnvironment:](v3, "initWithAlert:alertDelegate:templateEnvironment:", v1, v2);

  [v10[0] setViewControllerDelegate:*(void *)(a1 + 48)];
  id v7 = (id)[*(id *)(a1 + 48) identifierToViewControllerDictionary];
  id v5 = v10[0];
  id v6 = (id)[*(id *)(a1 + 32) identifier];
  objc_msgSend(v7, "setObject:forKey:", v5);

  id v9 = (id)[*(id *)(a1 + 48) overlayViewController];
  objc_msgSend(v9, "presentTemplateViewController:animated:completion:", v10[0], objc_msgSend(*(id *)(a1 + 56), "BOOLValue") & 1, *(void *)(a1 + 64));

  objc_storeStrong(v10, 0);
}

- (void)requestBannerProviderWithReply:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __54__CPSTemplateInstance_requestBannerProviderWithReply___block_invoke;
  id v8 = &unk_2648A4270;
  id v10 = location[0];
  id v9 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

void __54__CPSTemplateInstance_requestBannerProviderWithReply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) bannerSource];
  (*(void (**)(void))(v1 + 16))();
}

- (void)pushGridTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = (void *)a6;
  id v28 = 0;
  objc_storeStrong(&v28, a7);
  id v27 = CarPlaySupportGeneralLogging();
  char v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    os_log_type_t type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_22B689000, log, type, "Grid Template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if ([(CPSTemplateInstance *)v33 _templateIsValidForCurrentEntitlement:location[0] presentationStyle:v29])
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    char v17 = __91__CPSTemplateInstance_pushGridTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    id v18 = &unk_2648A42C0;
    id v19 = v33;
    id v20 = location[0];
    id v21 = v31;
    id v22 = v30;
    v23[1] = v29;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v19, 0);
    int v24 = 0;
  }
  else
  {
    int v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __91__CPSTemplateInstance_pushGridTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  id v17 = (id)[*(id *)(a1 + 32) identifierToViewControllerDictionary];
  id v16 = (id)[*(id *)(a1 + 40) identifier];
  id v18 = (id)objc_msgSend(v17, "objectForKey:");

  if (v18)
  {
    location[0] = CarPlaySupportGeneralLogging();
    char v32 = 2;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      log = location[0];
      os_log_type_t type = v32;
      __os_log_helper_16_0_0(v31);
      _os_log_debug_impl(&dword_22B689000, log, type, "already have a grid view controller for this template", v31, 2u);
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    id v9 = [CPSGridTemplateViewController alloc];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = (id)[*(id *)(a1 + 32) templateEnvironment];
    id v30 = -[CPSGridTemplateViewController initWithGridTemplate:interfaceDelegate:templateEnvironment:](v9, "initWithGridTemplate:interfaceDelegate:templateEnvironment:", v7, v8);

    [(CPSBaseTemplateViewController *)v30 setViewControllerDelegate:*(void *)(a1 + 32)];
    id v12 = (id)[*(id *)(a1 + 32) identifierToViewControllerDictionary];
    id v11 = (id)[*(id *)(a1 + 40) identifier];
    objc_msgSend(v12, "setObject:forKey:", v30);

    id v29 = CarPlaySupportGeneralLogging();
    char v28 = 2;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEBUG))
    {
      int v5 = v29;
      os_log_type_t v6 = v28;
      __os_log_helper_16_0_0(v27);
      _os_log_debug_impl(&dword_22B689000, v5, v6, "Pushing grid template", v27, 2u);
    }
    objc_storeStrong(&v29, 0);
    id v4 = (id)[*(id *)(a1 + 32) overlayViewController];
    uint64_t v1 = v30;
    char v2 = [*(id *)(a1 + 56) BOOLValue];
    uint64_t v3 = *(void *)(a1 + 72);
    uint64_t v19 = MEMORY[0x263EF8330];
    int v20 = -1073741824;
    int v21 = 0;
    id v22 = __91__CPSTemplateInstance_pushGridTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_87;
    id v23 = &unk_2648A4298;
    int v24 = v30;
    id v26 = *(id *)(a1 + 64);
    id v25 = *(id *)(a1 + 32);
    [v4 pushTemplateViewController:v1 animated:v2 & 1 presentationStyle:v3 completion:&v19];

    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong((id *)&v24, 0);
    objc_storeStrong((id *)&v30, 0);
  }
}

uint64_t __91__CPSTemplateInstance_pushGridTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_87(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) templateProviderFuture];
  id v1 = (id)[v3 addSuccessBlock:*(void *)(a1 + 48)];

  return [*(id *)(a1 + 40) _pushNowPlayingIfNeeded];
}

- (void)pushInformationTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  id v29 = (void *)a6;
  id v28 = 0;
  objc_storeStrong(&v28, a7);
  id v27 = CarPlaySupportGeneralLogging();
  char v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    os_log_type_t type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_22B689000, log, type, "Information Template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if ([(CPSTemplateInstance *)v33 _templateIsValidForCurrentEntitlement:location[0] presentationStyle:v29])
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    id v17 = __98__CPSTemplateInstance_pushInformationTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    id v18 = &unk_2648A42C0;
    uint64_t v19 = v33;
    id v20 = location[0];
    id v21 = v31;
    id v22 = v30;
    v23[1] = v29;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v19, 0);
    int v24 = 0;
  }
  else
  {
    int v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __98__CPSTemplateInstance_pushInformationTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  id v17 = (id)[*(id *)(a1 + 32) identifierToViewControllerDictionary];
  id v16 = (id)[*(id *)(a1 + 40) identifier];
  id v18 = (id)objc_msgSend(v17, "objectForKey:");

  if (v18)
  {
    location[0] = CarPlaySupportGeneralLogging();
    char v31 = 2;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      log = location[0];
      os_log_type_t type = v31;
      __os_log_helper_16_0_0(v30);
      _os_log_debug_impl(&dword_22B689000, log, type, "already have a information view controller for this template", v30, 2u);
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    id v9 = [CPSInformationEntityViewController alloc];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = (id)[*(id *)(a1 + 32) templateEnvironment];
    id v29 = -[CPSBaseTemplateViewController initWithTemplate:templateDelegate:templateEnvironment:](v9, "initWithTemplate:templateDelegate:templateEnvironment:", v7, v8);

    [(CPSBaseTemplateViewController *)v29 setViewControllerDelegate:*(void *)(a1 + 32)];
    id v12 = (id)[*(id *)(a1 + 32) identifierToViewControllerDictionary];
    id v11 = (id)[*(id *)(a1 + 40) identifier];
    objc_msgSend(v12, "setObject:forKey:", v29);

    id v28 = CarPlaySupportGeneralLogging();
    char v27 = 2;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG))
    {
      int v5 = v28;
      os_log_type_t v6 = v27;
      __os_log_helper_16_0_0(v26);
      _os_log_debug_impl(&dword_22B689000, v5, v6, "Pushing information template", v26, 2u);
    }
    objc_storeStrong(&v28, 0);
    id v4 = (id)[*(id *)(a1 + 32) overlayViewController];
    id v1 = v29;
    char v2 = [*(id *)(a1 + 56) BOOLValue];
    uint64_t v3 = *(void *)(a1 + 72);
    uint64_t v19 = MEMORY[0x263EF8330];
    int v20 = -1073741824;
    int v21 = 0;
    id v22 = __98__CPSTemplateInstance_pushInformationTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_89;
    id v23 = &unk_2648A42E8;
    int v24 = v29;
    id v25 = *(id *)(a1 + 64);
    [v4 pushTemplateViewController:v1 animated:v2 & 1 presentationStyle:v3 completion:&v19];

    objc_storeStrong(&v25, 0);
    objc_storeStrong((id *)&v24, 0);
    objc_storeStrong((id *)&v29, 0);
  }
}

void __98__CPSTemplateInstance_pushInformationTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_89(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) templateProviderFuture];
  id v1 = (id)[v3 addSuccessBlock:*(void *)(a1 + 40)];
}

- (void)pushMapTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  id v29 = (void *)a6;
  id v28 = 0;
  objc_storeStrong(&v28, a7);
  id v27 = CarPlaySupportGeneralLogging();
  char v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    os_log_type_t type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_22B689000, log, type, "Map template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if ([(CPSTemplateInstance *)v33 _templateIsValidForCurrentEntitlement:location[0] presentationStyle:v29])
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    id v17 = __90__CPSTemplateInstance_pushMapTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    id v18 = &unk_2648A42C0;
    id v19 = location[0];
    id v20 = v31;
    int v21 = v33;
    id v22 = v30;
    v23[1] = v29;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong((id *)&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    int v24 = 0;
  }
  else
  {
    int v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __90__CPSTemplateInstance_pushMapTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  v26[2] = (id)a1;
  v26[1] = (id)a1;
  id v10 = [CPSMapTemplateViewController alloc];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v12 = (id)[v9 applicationStateMonitor];
  id v11 = (id)[*(id *)(a1 + 48) templateEnvironment];
  v26[0] = -[CPSMapTemplateViewController initWithMapTemplate:templateDelegate:safeAreaDelegate:applicationStateMonitor:templateEnvironment:](v10, "initWithMapTemplate:templateDelegate:safeAreaDelegate:applicationStateMonitor:templateEnvironment:", v7, v8, v9, v12);

  [v26[0] setViewControllerDelegate:*(void *)(a1 + 48)];
  [v26[0] setNavigatorObserver:*(void *)(a1 + 48)];
  id v15 = (id)[*(id *)(a1 + 48) identifierToViewControllerDictionary];
  id v14 = (id)[*(id *)(a1 + 32) identifier];
  objc_msgSend(v15, "setObject:forKey:", v26[0]);

  id location = CarPlaySupportGeneralLogging();
  char v24 = 2;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    log = location;
    os_log_type_t type = v24;
    __os_log_helper_16_0_0(v23);
    _os_log_debug_impl(&dword_22B689000, log, type, "Pushing map template", v23, 2u);
  }
  objc_storeStrong(&location, 0);
  id v4 = (id)[*(id *)(a1 + 48) overlayViewController];
  id v1 = v26[0];
  char v2 = [*(id *)(a1 + 56) BOOLValue];
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v16 = MEMORY[0x263EF8330];
  int v17 = -1073741824;
  int v18 = 0;
  id v19 = __90__CPSTemplateInstance_pushMapTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_91;
  id v20 = &unk_2648A42E8;
  id v21 = v26[0];
  id v22 = *(id *)(a1 + 64);
  [v4 pushTemplateViewController:v1 animated:v2 & 1 presentationStyle:v3 completion:&v16];

  [*(id *)(a1 + 48) setRootViewController:v26[0]];
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v26, 0);
}

void __90__CPSTemplateInstance_pushMapTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_91(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) templateProviderFuture];
  id v1 = (id)[v3 addSuccessBlock:*(void *)(a1 + 40)];
}

- (void)requestNavigationProviderForMapTemplate:(id)a3 withReply:(id)a4
{
  uint64_t v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __73__CPSTemplateInstance_requestNavigationProviderForMapTemplate_withReply___block_invoke;
  id v10 = &unk_2648A4310;
  id v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __73__CPSTemplateInstance_requestNavigationProviderForMapTemplate_withReply___block_invoke(uint64_t a1)
{
  v4[2] = (id)a1;
  v4[1] = (id)a1;
  id v2 = (id)[*(id *)(a1 + 32) identifierToViewControllerDictionary];
  id v1 = (id)[*(id *)(a1 + 40) identifier];
  v4[0] = (id)objc_msgSend(v2, "objectForKey:");

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_storeStrong(v4, 0);
}

- (void)pushListTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  id v29 = (void *)a6;
  id v28 = 0;
  objc_storeStrong(&v28, a7);
  id v27 = CarPlaySupportGeneralLogging();
  char v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    os_log_type_t type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_22B689000, log, type, "List template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if ([(CPSTemplateInstance *)v33 _templateIsValidForCurrentEntitlement:location[0] presentationStyle:v29])
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    int v17 = __91__CPSTemplateInstance_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    int v18 = &unk_2648A42C0;
    id v19 = v33;
    id v20 = location[0];
    id v21 = v31;
    id v22 = v30;
    v23[1] = v29;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v19, 0);
    int v24 = 0;
  }
  else
  {
    int v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __91__CPSTemplateInstance_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  id v20 = (id)[*(id *)(a1 + 32) identifierToViewControllerDictionary];
  id v19 = (id)[*(id *)(a1 + 40) identifier];
  id v21 = (id)objc_msgSend(v20, "objectForKey:");

  if (v21)
  {
    location[0] = CarPlaySupportGeneralLogging();
    char v41 = 2;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      log = location[0];
      os_log_type_t type = v41;
      __os_log_helper_16_0_0(v40);
      _os_log_debug_impl(&dword_22B689000, log, type, "already have a list view controller for this template", v40, 2u);
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    id v11 = [CPSListTemplateViewController alloc];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v12 = (id)[*(id *)(a1 + 32) templateEnvironment];
    v39 = -[CPSListTemplateViewController initWithListTemplate:templateDelegate:templateEnvironment:](v11, "initWithListTemplate:templateDelegate:templateEnvironment:", v9, v10);

    [(CPSBaseTemplateViewController *)v39 setViewControllerDelegate:*(void *)(a1 + 32)];
    id v14 = (id)[*(id *)(a1 + 32) identifierToViewControllerDictionary];
    id v13 = (id)[*(id *)(a1 + 40) identifier];
    objc_msgSend(v14, "setObject:forKey:", v39);

    id v15 = (id)[*(id *)(a1 + 40) assistantCellConfiguration];
    if (v15)
    {
      int v7 = v39;
      id v8 = (id)[*(id *)(a1 + 40) assistantCellConfiguration];
      uint64_t v33 = MEMORY[0x263EF8330];
      int v34 = -1073741824;
      int v35 = 0;
      v36 = __91__CPSTemplateInstance_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_93;
      v37 = &unk_2648A4338;
      id v38 = *(id *)(a1 + 32);
      [(CPSListTemplateViewController *)v7 updateAssistantCellConfiguration:v8 withCompletion:&v33];

      objc_storeStrong(&v38, 0);
    }
    id v32 = CarPlaySupportGeneralLogging();
    char v31 = 2;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEBUG))
    {
      int v5 = v32;
      os_log_type_t v6 = v31;
      __os_log_helper_16_0_0(v30);
      _os_log_debug_impl(&dword_22B689000, v5, v6, "Pushing list template", v30, 2u);
    }
    objc_storeStrong(&v32, 0);
    id v4 = (id)[*(id *)(a1 + 32) overlayViewController];
    id v1 = v39;
    char v2 = [*(id *)(a1 + 56) BOOLValue];
    uint64_t v3 = *(void *)(a1 + 72);
    uint64_t v22 = MEMORY[0x263EF8330];
    int v23 = -1073741824;
    int v24 = 0;
    id v25 = __91__CPSTemplateInstance_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_95;
    char v26 = &unk_2648A4298;
    id v27 = v39;
    id v29 = *(id *)(a1 + 64);
    id v28 = *(id *)(a1 + 32);
    [v4 pushTemplateViewController:v1 animated:v2 & 1 presentationStyle:v3 completion:&v22];

    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong((id *)&v39, 0);
  }
}

void __91__CPSTemplateInstance_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_93(uint64_t a1, char a2, id obj)
{
  uint64_t v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  if ((v6 & 1) == 0)
  {
    id v3 = (id)[*(id *)(a1 + 32) interfaceControllerRemoteObjectProxy];
    [v3 clientAssistantCellUnavailableWithError:location];
  }
  objc_storeStrong(&location, 0);
}

uint64_t __91__CPSTemplateInstance_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_95(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) templateProviderFuture];
  id v1 = (id)[v3 addSuccessBlock:*(void *)(a1 + 48)];

  return [*(id *)(a1 + 40) _pushNowPlayingIfNeeded];
}

- (void)pushNowPlayingTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  uint64_t v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  id v29 = (void *)a6;
  id v28 = 0;
  objc_storeStrong(&v28, a7);
  id v27 = CarPlaySupportGeneralLogging();
  char v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    os_log_type_t type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_22B689000, log, type, "Now Playing template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if ([(CPSTemplateInstance *)v33 _templateIsValidForCurrentEntitlement:location[0] presentationStyle:v29])
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    int v17 = __97__CPSTemplateInstance_pushNowPlayingTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    int v18 = &unk_2648A42C0;
    id v19 = location[0];
    id v20 = v31;
    id v21 = v33;
    v23[1] = v29;
    id v22 = v30;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong((id *)&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    int v24 = 0;
  }
  else
  {
    int v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __97__CPSTemplateInstance_pushNowPlayingTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  v28[2] = (id)a1;
  v28[1] = (id)a1;
  id v12 = [CPSNowPlayingViewController alloc];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v13 = (id)[*(id *)(a1 + 48) templateEnvironment];
  v28[0] = -[CPSNowPlayingViewController initWithNowPlayingTemplate:templateDelegate:environment:](v12, "initWithNowPlayingTemplate:templateDelegate:environment:", v10, v11);

  [v28[0] setViewControllerDelegate:*(void *)(a1 + 48)];
  id v16 = (id)[*(id *)(a1 + 48) identifierToViewControllerDictionary];
  id v15 = (id)[*(id *)(a1 + 32) identifier];
  objc_msgSend(v16, "setObject:forKey:", v28[0]);

  id location = CarPlaySupportGeneralLogging();
  char v26 = 2;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    log = location;
    os_log_type_t type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_22B689000, log, type, "Pushing Now Playing View Controller", v25, 2u);
  }
  objc_storeStrong(&location, 0);
  if (!*(void *)(a1 + 72))
  {
    id v5 = (id)[*(id *)(a1 + 48) overlayViewController];
    id v24 = (id)[v5 topViewController];

    id v7 = (id)[v24 navigationItem];
    id v6 = CPSLocalizedStringForKey(@"NOW_PLAYING_BACK");
    objc_msgSend(v7, "setBackButtonTitle:");

    objc_storeStrong(&v24, 0);
  }
  id v4 = (id)[*(id *)(a1 + 48) overlayViewController];
  id v1 = v28[0];
  char v2 = [*(id *)(a1 + 56) BOOLValue];
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v17 = MEMORY[0x263EF8330];
  int v18 = -1073741824;
  int v19 = 0;
  id v20 = __97__CPSTemplateInstance_pushNowPlayingTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_99;
  id v21 = &unk_2648A42E8;
  id v22 = v28[0];
  id v23 = *(id *)(a1 + 64);
  [v4 pushTemplateViewController:v1 animated:v2 & 1 presentationStyle:v3 completion:&v17];

  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v28, 0);
}

void __97__CPSTemplateInstance_pushNowPlayingTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_99(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) templateProviderFuture];
  id v1 = (id)[v3 addSuccessBlock:*(void *)(a1 + 40)];
}

- (void)pushSearchTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  uint64_t v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  id v29 = (void *)a6;
  id v28 = 0;
  objc_storeStrong(&v28, a7);
  id v27 = CarPlaySupportGeneralLogging();
  char v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    os_log_type_t type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_22B689000, log, type, "Search template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if ([(CPSTemplateInstance *)v33 _templateIsValidForCurrentEntitlement:location[0] presentationStyle:v29])
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    uint64_t v17 = __93__CPSTemplateInstance_pushSearchTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    int v18 = &unk_2648A42C0;
    id v19 = location[0];
    id v20 = v31;
    id v21 = v33;
    id v22 = v30;
    v23[1] = v29;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong((id *)&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    int v24 = 0;
  }
  else
  {
    int v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __93__CPSTemplateInstance_pushSearchTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v31 = a1;
  uint64_t v30 = a1;
  uint64_t v14 = +[CPSUtilities sharedInstance];
  uint64_t v15 = [(CPSUtilities *)v14 lastButtonPressInteractionModel];

  uint64_t v29 = v15;
  id location = CarPlaySupportGeneralLogging();
  os_log_type_t v27 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v32, v29);
    _os_log_debug_impl(&dword_22B689000, (os_log_t)location, v27, "Requested search template with interaction model: %lu", v32, 0xCu);
  }
  objc_storeStrong(&location, 0);
  uint64_t v9 = [CPSSearchTemplateViewController alloc];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = (id)[*(id *)(a1 + 48) templateEnvironment];
  char v26 = -[CPSSearchTemplateViewController initWithSearchTemplate:templateDelegate:templateEnvironment:interactionModel:](v9, "initWithSearchTemplate:templateDelegate:templateEnvironment:interactionModel:", v7, v8);

  [(CPSSearchTemplateViewController *)v26 setViewControllerDelegate:*(void *)(a1 + 48)];
  id v12 = (id)[*(id *)(a1 + 48) identifierToViewControllerDictionary];
  id v11 = (id)[*(id *)(a1 + 32) identifier];
  objc_msgSend(v12, "setObject:forKey:", v26);

  id v25 = CarPlaySupportGeneralLogging();
  char v24 = 2;
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG))
  {
    id v5 = v25;
    os_log_type_t v6 = v24;
    __os_log_helper_16_0_0(v23);
    _os_log_debug_impl(&dword_22B689000, v5, v6, "Pushing search template", v23, 2u);
  }
  objc_storeStrong(&v25, 0);
  id v4 = (id)[*(id *)(a1 + 48) overlayViewController];
  id v1 = v26;
  char v2 = [*(id *)(a1 + 56) BOOLValue];
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v16 = MEMORY[0x263EF8330];
  int v17 = -1073741824;
  int v18 = 0;
  id v19 = __93__CPSTemplateInstance_pushSearchTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_102;
  id v20 = &unk_2648A42E8;
  id v21 = v26;
  id v22 = *(id *)(a1 + 64);
  [v4 pushTemplateViewController:v1 animated:v2 & 1 presentationStyle:v3 completion:&v16];

  objc_storeStrong(&v22, 0);
  objc_storeStrong((id *)&v21, 0);
  objc_storeStrong((id *)&v26, 0);
}

void __93__CPSTemplateInstance_pushSearchTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_102(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) templateProviderFuture];
  id v1 = (id)[v3 addSuccessBlock:*(void *)(a1 + 40)];
}

- (void)presentVoiceTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 reply:(id)a6
{
  uint64_t v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = 0;
  objc_storeStrong(&v28, a4);
  id v27 = 0;
  objc_storeStrong(&v27, a5);
  id v26 = 0;
  objc_storeStrong(&v26, a6);
  id v25 = CarPlaySupportGeneralLogging();
  char v24 = 2;
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG))
  {
    log = v25;
    os_log_type_t type = v24;
    __os_log_helper_16_0_0(v23);
    _os_log_debug_impl(&dword_22B689000, log, type, "Voice template requested", v23, 2u);
  }
  objc_storeStrong(&v25, 0);
  if ([(CPSTemplateInstance *)v30 _templateIsValidForCurrentEntitlement:location[0] presentationStyle:2])
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    uint64_t v15 = __77__CPSTemplateInstance_presentVoiceTemplate_withProxyDelegate_animated_reply___block_invoke;
    uint64_t v16 = &unk_2648A4248;
    id v17 = location[0];
    id v18 = v28;
    id v19 = v30;
    id v20 = v27;
    id v21 = v26;
    dispatch_async(queue, &v12);

    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v19, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    int v22 = 0;
  }
  else
  {
    int v22 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

void __77__CPSTemplateInstance_presentVoiceTemplate_withProxyDelegate_animated_reply___block_invoke(uint64_t a1)
{
  id v23[2] = (id)a1;
  v23[1] = (id)a1;
  uint64_t v8 = [CPSVoiceTemplateViewController alloc];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = (id)[*(id *)(a1 + 48) templateEnvironment];
  v23[0] = -[CPSVoiceTemplateViewController initWithVoiceTemplate:templateDelegate:templateEnvironment:](v8, "initWithVoiceTemplate:templateDelegate:templateEnvironment:", v6, v7);

  [v23[0] setViewControllerDelegate:*(void *)(a1 + 48)];
  id v12 = (id)[*(id *)(a1 + 48) identifierToViewControllerDictionary];
  id v11 = (id)[*(id *)(a1 + 32) identifier];
  objc_msgSend(v12, "setObject:forKey:", v23[0]);

  id location = CarPlaySupportGeneralLogging();
  char v21 = 2;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    log = location;
    os_log_type_t type = v21;
    __os_log_helper_16_0_0(v20);
    _os_log_debug_impl(&dword_22B689000, log, type, "Presenting voice template modally", v20, 2u);
  }
  objc_storeStrong(&location, 0);
  id v3 = (id)[*(id *)(a1 + 48) overlayViewController];
  id v1 = v23[0];
  char v2 = [*(id *)(a1 + 56) BOOLValue];
  uint64_t v13 = MEMORY[0x263EF8330];
  int v14 = -1073741824;
  int v15 = 0;
  uint64_t v16 = __77__CPSTemplateInstance_presentVoiceTemplate_withProxyDelegate_animated_reply___block_invoke_104;
  id v17 = &unk_2648A42E8;
  id v18 = v23[0];
  id v19 = *(id *)(a1 + 64);
  [v3 presentTemplateViewController:v1 animated:v2 & 1 completion:&v13];

  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v23, 0);
}

void __77__CPSTemplateInstance_presentVoiceTemplate_withProxyDelegate_animated_reply___block_invoke_104(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) templateProviderFuture];
  id v1 = (id)[v3 addSuccessBlock:*(void *)(a1 + 40)];
}

- (void)setTabBarTemplate:(id)a3 withProxyDelegate:(id)a4 reply:(id)a5 animated:(id)a6
{
  int v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  id v32 = 0;
  objc_storeStrong(&v32, a5);
  id v31 = 0;
  objc_storeStrong(&v31, a6);
  id v16 = (id)[location[0] templates];
  unint64_t v14 = [v16 count];
  int v15 = [(CPSTemplateInstance *)v35 templateEnvironment];
  BOOL v17 = v14 <= [(CPSTemplateEnvironment *)v15 maximumTabs];

  if (v17)
  {
    id v29 = CarPlaySupportGeneralLogging();
    char v28 = 2;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEBUG))
    {
      log = v29;
      os_log_type_t type = v28;
      __os_log_helper_16_0_0(v27);
      _os_log_debug_impl(&dword_22B689000, log, type, "Presenting tab bar template, replacing root", v27, 2u);
    }
    objc_storeStrong(&v29, 0);
    queue = MEMORY[0x263EF83A0];
    uint64_t v18 = MEMORY[0x263EF8330];
    int v19 = -1073741824;
    int v20 = 0;
    char v21 = __74__CPSTemplateInstance_setTabBarTemplate_withProxyDelegate_reply_animated___block_invoke;
    int v22 = &unk_2648A4360;
    id v23 = v35;
    id v24 = location[0];
    id v25 = v33;
    id v26 = v31;
    dispatch_sync(queue, &v18);

    uint64_t v8 = [(CPSTabBarViewController *)v35->_tabBarViewController templateProviderFuture];
    id v6 = (id)[(NAFuture *)v8 addSuccessBlock:v32];

    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong((id *)&v23, 0);
    int v30 = 0;
  }
  else
  {
    [(CPTemplateServiceClientInterface *)v35->_interfaceControllerRemoteObjectProxy clientExceededTabBarTabLimit];
    int v30 = 1;
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
}

void __74__CPSTemplateInstance_setTabBarTemplate_withProxyDelegate_reply_animated___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = [CPSTabBarViewController alloc];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = (id)[*(id *)(a1 + 32) templateEnvironment];
  uint64_t v1 = -[CPSTabBarViewController initWithTabBarTemplate:templateDelegate:templateEnvironment:](v6, "initWithTabBarTemplate:templateDelegate:templateEnvironment:", v4, v5);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 232);
  *(void *)(v2 + 232) = v1;

  [*(id *)(*(void *)(a1 + 32) + 232) setViewControllerDelegate:*(void *)(a1 + 32)];
  id v10 = (id)[*(id *)(a1 + 32) identifierToViewControllerDictionary];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 232);
  id v9 = (id)[*(id *)(a1 + 40) identifier];
  objc_msgSend(v10, "setObject:forKey:", v8);

  [*(id *)(a1 + 32) updateTabBarTemplate:*(void *)(a1 + 40)];
  id v12 = (id)[*(id *)(a1 + 32) overlayViewController];
  v16[0] = *(void *)(*(void *)(a1 + 32) + 232);
  id v11 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  objc_msgSend(v12, "setViewControllers:animated:", v11, objc_msgSend(*(id *)(a1 + 56), "BOOLValue") & 1);

  id v13 = (id)[*(id *)(a1 + 32) overlayViewController];
  objc_msgSend(v13, "setNavigationBarHidden:animated:", 1, objc_msgSend(*(id *)(a1 + 56), "BOOLValue") & 1);

  [*(id *)(a1 + 32) setRootViewController:*(void *)(*(void *)(a1 + 32) + 232)];
  [*(id *)(a1 + 32) _pushNowPlayingIfNeeded];
  id v15 = (id)[*(id *)(*(void *)(a1 + 32) + 232) templateProviderFuture];
  [v15 finishWithNoResult];
}

- (void)updateTabBarTemplate:(id)a3
{
  int v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = (id)[location[0] templates];
  unint64_t v6 = [v8 count];
  id v7 = [(CPSTemplateInstance *)v22 templateEnvironment];
  BOOL v9 = v6 <= [(CPSTemplateEnvironment *)v7 maximumTabs];

  if (v9)
  {
    id v19 = CarPlaySupportGeneralLogging();
    char v18 = 2;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
    {
      log = v19;
      os_log_type_t type = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_debug_impl(&dword_22B689000, log, type, "Updating tab bar template", v17, 2u);
    }
    objc_storeStrong(&v19, 0);
    queue = MEMORY[0x263EF83A0];
    uint64_t v10 = MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    id v13 = __44__CPSTemplateInstance_updateTabBarTemplate___block_invoke;
    unint64_t v14 = &unk_2648A3990;
    id v15 = v22;
    id v16 = location[0];
    dispatch_async(queue, &v10);

    objc_storeStrong(&v16, 0);
    objc_storeStrong((id *)&v15, 0);
    int v20 = 0;
  }
  else
  {
    [(CPTemplateServiceClientInterface *)v22->_interfaceControllerRemoteObjectProxy clientExceededTabBarTabLimit];
    int v20 = 1;
  }
  objc_storeStrong(location, 0);
}

void __44__CPSTemplateInstance_updateTabBarTemplate___block_invoke(id *a1)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  v68[2] = a1;
  v68[1] = a1;
  id v39 = (id)[a1[4] tabBarViewController];
  v68[0] = (id)[v39 viewControllers];

  id v67 = (id)[MEMORY[0x263EFF980] array];
  memset(__b, 0, sizeof(__b));
  id obj = (id)[a1[5] templates];
  uint64_t v42 = [obj countByEnumeratingWithState:__b objects:v71 count:16];
  if (v42)
  {
    uint64_t v36 = *(void *)__b[2];
    uint64_t v37 = 0;
    unint64_t v38 = v42;
    while (1)
    {
      uint64_t v35 = v37;
      if (*(void *)__b[2] != v36) {
        objc_enumerationMutation(obj);
      }
      id v66 = *(id *)(__b[1] + 8 * v37);
      id v31 = objc_opt_class();
      id v34 = (id)[a1[4] identifierToViewControllerDictionary];
      id v33 = (id)[v66 identifier];
      id v32 = (id)objc_msgSend(v34, "objectForKey:");
      id location = CPSSafeCast_4(v31, v32);

      if (location)
      {
        [location _updateTemplate:v66];
        [v67 addObject:location];
      }
      else
      {
        os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
        os_log_type_t type = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          log = oslog;
          __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v66);
          _os_log_debug_impl(&dword_22B689000, log, type, "No view controller available for %@", v70, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      objc_storeStrong(&location, 0);
      ++v37;
      if (v35 + 1 >= v38)
      {
        uint64_t v37 = 0;
        unint64_t v38 = [obj countByEnumeratingWithState:__b objects:v71 count:16];
        if (!v38) {
          break;
        }
      }
    }
  }

  uint64_t v61 = 0;
  id v28 = (id)[a1[4] tabBarViewController];
  uint64_t v29 = [v28 selectedIndex];

  uint64_t v61 = v29;
  char v60 = 0;
  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v59 = (id)[v68[0] objectAtIndexedSubscript:v61];
    char v60 = ([v67 containsObject:v59] ^ 1) & 1;
    objc_storeStrong(&v59, 0);
  }
  if (v60)
  {
    os_log_t v58 = (os_log_t)CarPlaySupportGeneralLogging();
    os_log_type_t v57 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = v58;
      os_log_type_t v27 = v57;
      __os_log_helper_16_0_0(v56);
      _os_log_impl(&dword_22B689000, v26, v27, "Returning to root tab bar template for tab change.", v56, 2u);
    }
    objc_storeStrong((id *)&v58, 0);
    id v25 = (id)[a1[4] overlayViewController];
    [v25 popToRootTemplateAnimated:0 completion:0];
  }
  else
  {
    os_log_t v55 = (os_log_t)CarPlaySupportGeneralLogging();
    os_log_type_t v54 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v55;
      os_log_type_t v24 = v54;
      __os_log_helper_16_0_0(v53);
      _os_log_impl(&dword_22B689000, v23, v24, "Processing tab bar update without pop to root.", v53, 2u);
    }
    objc_storeStrong((id *)&v55, 0);
  }
  id v19 = (id)[a1[4] tabBarViewController];
  [v19 setViewControllers:v67 animated:0];

  id v21 = (id)[a1[4] overlayViewController];
  id v20 = (id)[v21 viewControllers];
  BOOL v22 = (unint64_t)[v20 count] > 1;

  if (v22)
  {
    os_log_t v49 = (os_log_t)CarPlaySupportGeneralLogging();
    os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v14 = v49;
      os_log_type_t v15 = v48;
      __os_log_helper_16_0_0(v47);
      _os_log_impl(&dword_22B689000, v14, v15, "No navigation bar hide necessary.", v47, 2u);
    }
    objc_storeStrong((id *)&v49, 0);
  }
  else
  {
    os_log_t v52 = (os_log_t)CarPlaySupportGeneralLogging();
    os_log_type_t v51 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = v52;
      os_log_type_t v18 = v51;
      __os_log_helper_16_0_0(v50);
      _os_log_impl(&dword_22B689000, v17, v18, "Hiding navigation bar for tab bar.", v50, 2u);
    }
    objc_storeStrong((id *)&v52, 0);
    id v16 = (id)[a1[4] overlayViewController];
    [v16 setNavigationBarHidden:1 animated:0];
  }
  id v13 = (id)[a1[4] tabBarViewController];
  id v46 = (id)[v13 selectedViewController];

  if (v46)
  {
    id v12 = (id)[a1[4] tabBarViewController];
    id v11 = (id)[v12 templateDelegate];
    id v10 = (id)[v46 associatedTemplate];
    id v9 = (id)[v10 identifier];
    objc_msgSend(v11, "handleActionForControlIdentifier:");
  }
  memset(v44, 0, sizeof(v44));
  id v7 = v68[0];
  uint64_t v8 = [v7 countByEnumeratingWithState:v44 objects:v69 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)v44[2];
    uint64_t v5 = 0;
    unint64_t v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)v44[2] != v4) {
        objc_enumerationMutation(v7);
      }
      id v45 = *(id *)(v44[1] + 8 * v5);
      id v2 = (id)[v45 associatedTemplate];
      id v43 = (id)[v2 identifier];

      if (v43 && ([v67 containsObject:v45] & 1) == 0)
      {
        id v1 = (id)[a1[4] identifierToViewControllerDictionary];
        [v1 removeObjectForKey:v43];
      }
      objc_storeStrong(&v43, 0);
      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [v7 countByEnumeratingWithState:v44 objects:v69 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v67, 0);
  objc_storeStrong(v68, 0);
}

- (void)selectTabBarTemplateAtIndex:(int64_t)a3
{
  id v12 = self;
  SEL v11 = a2;
  id v10 = (void *)a3;
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __51__CPSTemplateInstance_selectTabBarTemplateAtIndex___block_invoke;
  uint64_t v8 = &unk_2648A4388;
  v9[0] = v12;
  v9[1] = v10;
  dispatch_async(queue, &v4);

  objc_storeStrong(v9, 0);
}

void __51__CPSTemplateInstance_selectTabBarTemplateAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  id v1 = (id)[*(id *)(a1 + 32) tabBarViewController];
  BOOL v17 = v1 != 0;

  if (v17)
  {
    BOOL v2 = *(uint64_t *)(a1 + 40) < 0;
    char v24 = 0;
    char v22 = 0;
    BOOL v13 = 0;
    if (!v2)
    {
      unint64_t v12 = *(void *)(a1 + 40);
      id v25 = (id)[*(id *)(a1 + 32) tabBarViewController];
      char v24 = 1;
      id v23 = (id)[v25 viewControllers];
      char v22 = 1;
      BOOL v13 = v12 < [v23 count];
    }
    if (v22) {

    }
    if (v24) {
    if (v13)
    }
    {
      id v21 = CarPlaySupportGeneralLogging();
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (id)[NSNumber numberWithInteger:*(void *)(a1 + 40)];
        __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v11);
        _os_log_impl(&dword_22B689000, (os_log_t)v21, v20, "Selecting tab bar template at index %@", v30, 0xCu);
      }
      objc_storeStrong(&v21, 0);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = (id)[*(id *)(a1 + 32) tabBarViewController];
      [v9 setSelectedIndex:v8];

      id v10 = (id)[*(id *)(a1 + 32) tabBarViewController];
      id v19 = (id)[v10 selectedViewController];

      if (v19)
      {
        id v7 = (id)[*(id *)(a1 + 32) tabBarViewController];
        id v6 = (id)[v7 templateDelegate];
        id v5 = (id)[v19 associatedTemplate];
        id v4 = (id)[v5 identifier];
        objc_msgSend(v6, "handleActionForControlIdentifier:");
      }
      objc_storeStrong(&v19, 0);
    }
    else
    {
      id v18 = CarPlaySupportGeneralLogging();
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        id v3 = (id)[NSNumber numberWithInteger:*(void *)(a1 + 40)];
        __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v3);
        _os_log_impl(&dword_22B689000, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "Requested tab bar template index change, but no tab available at index %@", v29, 0xCu);
      }
      objc_storeStrong(&v18, 0);
    }
  }
  else
  {
    location[0] = CarPlaySupportGeneralLogging();
    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = location[0];
      os_log_type_t type = v27;
      __os_log_helper_16_0_0(v26);
      _os_log_impl(&dword_22B689000, log, type, "Requested tab bar template index change, but no tab bar template has been set.", v26, 2u);
    }
    objc_storeStrong(location, 0);
  }
}

- (void)pushEntityTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  id v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  uint64_t v29 = (void *)a6;
  id v28 = 0;
  objc_storeStrong(&v28, a7);
  id v27 = CarPlaySupportGeneralLogging();
  char v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    os_log_type_t type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_22B689000, log, type, "Entity template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if ([(CPSTemplateInstance *)v33 _templateIsValidForCurrentEntitlement:location[0] presentationStyle:v29])
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    BOOL v17 = __93__CPSTemplateInstance_pushEntityTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    id v18 = &unk_2648A42C0;
    id v19 = v33;
    id v20 = location[0];
    id v21 = v31;
    id v22 = v30;
    v23[1] = v29;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v19, 0);
    int v24 = 0;
  }
  else
  {
    int v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __93__CPSTemplateInstance_pushEntityTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  id v16 = (id)[*(id *)(a1 + 32) identifierToViewControllerDictionary];
  id v15 = (id)[*(id *)(a1 + 40) identifier];
  id v17 = (id)objc_msgSend(v16, "objectForKey:");

  if (v17)
  {
    location[0] = CarPlaySupportGeneralLogging();
    char v29 = 2;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      log = location[0];
      os_log_type_t type = v29;
      __os_log_helper_16_0_0(v28);
      _os_log_debug_impl(&dword_22B689000, log, type, "already have an entity view controller for this template", v28, 2u);
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    uint64_t v8 = [CPSEntityViewController alloc];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = (id)[*(id *)(a1 + 32) templateEnvironment];
    id v27 = -[CPSEntityViewController initWithEntityTemplate:templateDelegate:templateEnvironment:](v8, "initWithEntityTemplate:templateDelegate:templateEnvironment:", v6, v7);

    [(CPSBaseTemplateViewController *)v27 setViewControllerDelegate:*(void *)(a1 + 32)];
    id v11 = (id)[*(id *)(a1 + 32) identifierToViewControllerDictionary];
    id v10 = (id)[*(id *)(a1 + 40) identifier];
    objc_msgSend(v11, "setObject:forKey:", v27);

    id v26 = CarPlaySupportGeneralLogging();
    os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
    {
      id v5 = (id)[*(id *)(a1 + 40) entity];
      __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v5);
      _os_log_debug_impl(&dword_22B689000, (os_log_t)v26, v25, "Pushing Entity View Controller: %@", v31, 0xCu);
    }
    objc_storeStrong(&v26, 0);
    id v4 = (id)[*(id *)(a1 + 32) overlayViewController];
    id v1 = v27;
    char v2 = [*(id *)(a1 + 56) BOOLValue];
    uint64_t v3 = *(void *)(a1 + 72);
    uint64_t v18 = MEMORY[0x263EF8330];
    int v19 = -1073741824;
    int v20 = 0;
    id v21 = __93__CPSTemplateInstance_pushEntityTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_111;
    id v22 = &unk_2648A42E8;
    id v23 = v27;
    id v24 = *(id *)(a1 + 64);
    [v4 pushTemplateViewController:v1 animated:v2 & 1 presentationStyle:v3 completion:&v18];

    objc_storeStrong(&v24, 0);
    objc_storeStrong((id *)&v23, 0);
    objc_storeStrong((id *)&v27, 0);
  }
}

void __93__CPSTemplateInstance_pushEntityTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_111(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) templateProviderFuture];
  id v1 = (id)[v3 addSuccessBlock:*(void *)(a1 + 40)];
}

- (void)containsTemplate:(id)a3 reply:(id)a4
{
  int v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  int v15 = 0x20000000;
  int v16 = 32;
  char v17 = 0;
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __46__CPSTemplateInstance_containsTemplate_reply___block_invoke;
  id v10 = &unk_2648A43B0;
  v12[1] = &v13;
  id v11 = v20;
  v12[0] = location[0];
  dispatch_sync(queue, &v6);

  (*((void (**)(id, uint64_t))v18 + 2))(v18, v14[3] & 1);
  objc_storeStrong(v12, 0);
  objc_storeStrong((id *)&v11, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __46__CPSTemplateInstance_containsTemplate_reply___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) overlayViewController];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 indexOfTemplate:*(void *)(a1 + 40)] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)popToTemplate:(id)a3 animated:(id)a4 reply:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v18 = CarPlaySupportGeneralLogging();
  os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v23, (uint64_t)location[0], (uint64_t)v20);
    _os_log_impl(&dword_22B689000, (os_log_t)v18, v17, "Popping to template: %@ animated: %@", v23, 0x16u);
  }
  objc_storeStrong(&v18, 0);
  queue = MEMORY[0x263EF83A0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __52__CPSTemplateInstance_popToTemplate_animated_reply___block_invoke;
  unint64_t v12 = &unk_2648A4220;
  uint64_t v13 = v22;
  id v14 = location[0];
  id v15 = v20;
  id v16 = v19;
  dispatch_async(queue, &v8);

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __52__CPSTemplateInstance_popToTemplate_animated_reply___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) overlayViewController];
  objc_msgSend(v2, "popToTemplate:animated:completion:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "BOOLValue") & 1, *(void *)(a1 + 56));
}

- (void)popToRootTemplateAnimated:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = CarPlaySupportGeneralLogging();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)location[0]);
    _os_log_impl(&dword_22B689000, (os_log_t)v15, v14, "Popping to root template animated: %@", v19, 0xCu);
  }
  objc_storeStrong(&v15, 0);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __55__CPSTemplateInstance_popToRootTemplateAnimated_reply___block_invoke;
  int v10 = &unk_2648A4310;
  id v11 = v18;
  id v12 = location[0];
  id v13 = v16;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __55__CPSTemplateInstance_popToRootTemplateAnimated_reply___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) overlayViewController];
  objc_msgSend(v2, "popToRootTemplateAnimated:completion:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue") & 1, *(void *)(a1 + 48));
}

- (void)popTemplateAnimated:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = CarPlaySupportGeneralLogging();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)location[0]);
    _os_log_impl(&dword_22B689000, (os_log_t)v15, v14, "Popping a template animated: %@", v19, 0xCu);
  }
  objc_storeStrong(&v15, 0);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __49__CPSTemplateInstance_popTemplateAnimated_reply___block_invoke;
  int v10 = &unk_2648A4310;
  id v11 = v18;
  id v12 = location[0];
  id v13 = v16;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __49__CPSTemplateInstance_popTemplateAnimated_reply___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) overlayViewController];
  objc_msgSend(v2, "popTemplateAnimated:completion:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue") & 1, *(void *)(a1 + 48));
}

- (void)clientRequestNowPlayingTemplateAnimated:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v20 = self;
  SEL v19 = a2;
  BOOL v18 = a3;
  id v17 = [(CPSTemplateInstance *)self templateEnvironment];
  if (v17)
  {
    if ([v17 canBecomeNowPlayingApp])
    {
      if ([v17 isNowPlayingApp])
      {
        id v11 = CarPlaySupportGeneralLogging();
        os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
        {
          id v5 = (id)[v17 bundleIdentifier];
          __os_log_helper_16_2_1_8_66((uint64_t)v22, (uint64_t)v5);
          _os_log_impl(&dword_22B689000, (os_log_t)v11, v10, "Requesting now playing template from client app %{public}@", v22, 0xCu);
        }
        objc_storeStrong(&v11, 0);
        id v4 = [(CPSTemplateInstance *)v20 interfaceControllerRemoteObjectProxy];
        [(CPTemplateServiceClientInterface *)v4 clientPushNowPlayingTemplateAnimated:v18];
      }
      else
      {
        os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          id v3 = (id)[v17 bundleIdentifier];
          __os_log_helper_16_2_1_8_66((uint64_t)v21, (uint64_t)v3);
          _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "Client app %{public}@ is not now playing; not requesting now playing",
            v21,
            0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
    }
    else
    {
      id v13 = CarPlaySupportGeneralLogging();
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = (id)[v17 bundleIdentifier];
        __os_log_helper_16_2_1_8_66((uint64_t)v23, (uint64_t)v6);
        _os_log_impl(&dword_22B689000, (os_log_t)v13, v12, "Client app %{public}@ cannot become now playing; not requesting now playing",
          v23,
          0xCu);
      }
      objc_storeStrong(&v13, 0);
    }
  }
  else
  {
    v20->_pendingLaunchToNowPlaying = 1;
    id location = CarPlaySupportGeneralLogging();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      os_log_type_t type = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_impl(&dword_22B689000, log, type, "Pending launch to now playing template.", v14, 2u);
    }
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v17, 0);
}

- (void)dismissTemplateAnimated:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = CarPlaySupportGeneralLogging();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)location[0]);
    _os_log_impl(&dword_22B689000, (os_log_t)v15, v14, "Dismissing template animated: %@", v19, 0xCu);
  }
  objc_storeStrong(&v15, 0);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __53__CPSTemplateInstance_dismissTemplateAnimated_reply___block_invoke;
  os_log_type_t v10 = &unk_2648A4310;
  id v11 = v18;
  id v12 = location[0];
  id v13 = v16;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __53__CPSTemplateInstance_dismissTemplateAnimated_reply___block_invoke(id *a1)
{
  v21[2] = a1;
  v21[1] = a1;
  v21[0] = 0;
  id v11 = (id)[a1[4] overlayViewController];
  id v12 = (id)[v11 presentedTemplateViewController];

  if (v12)
  {
    id v9 = (id)[a1[4] overlayViewController];
    id v8 = (id)[v9 presentedTemplateViewController];
    id v7 = (id)[v8 associatedTemplate];
    id v1 = (id)[v7 identifier];
    id v2 = v21[0];
    v21[0] = v1;
  }
  else
  {
    id v3 = (id)[a1[4] actionSheetIdentifier];
    id v4 = v21[0];
    v21[0] = v3;
  }
  id v6 = (id)[a1[4] overlayViewController];
  char v5 = [a1[5] BOOLValue];
  uint64_t v13 = MEMORY[0x263EF8330];
  int v14 = -1073741824;
  int v15 = 0;
  id v16 = __53__CPSTemplateInstance_dismissTemplateAnimated_reply___block_invoke_2;
  id v17 = &unk_2648A4310;
  id v18 = a1[4];
  id v19 = v21[0];
  id v20 = a1[6];
  [v6 dismissViewControllerAnimated:v5 & 1 completion:&v13];

  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v21, 0);
}

uint64_t __53__CPSTemplateInstance_dismissTemplateAnimated_reply___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) interfaceControllerRemoteObjectProxy];
  [v2 templateIdentifierDidDismiss:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setActionSheetIdentifier:0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getTopTemplateWithReply:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __47__CPSTemplateInstance_getTopTemplateWithReply___block_invoke;
  id v8 = &unk_2648A42E8;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __47__CPSTemplateInstance_getTopTemplateWithReply___block_invoke(uint64_t a1)
{
  v5[2] = (id)a1;
  v5[1] = (id)a1;
  id v1 = (id)[*(id *)(a1 + 32) overlayViewController];
  v5[0] = (id)[v1 topTemplate];

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (id)[v5[0] identifier];
  (*(void (**)(void))(v3 + 16))();

  objc_storeStrong(v5, 0);
}

- (void)getTemplatesWithReply:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __45__CPSTemplateInstance_getTemplatesWithReply___block_invoke;
  id v8 = &unk_2648A42E8;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __45__CPSTemplateInstance_getTemplatesWithReply___block_invoke(uint64_t a1)
{
  v4[2] = (id)a1;
  v4[1] = (id)a1;
  id v1 = (id)[*(id *)(a1 + 32) overlayViewController];
  v4[0] = (id)[v1 templates];

  id v3 = (id)objc_msgSend(v4[0], "cps_map:", &__block_literal_global_4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v4, 0);
}

id __45__CPSTemplateInstance_getTemplatesWithReply___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[location[0] identifier];
  objc_storeStrong(location, 0);

  return v3;
}

- (void)getPresentedTemplateWithReply:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __53__CPSTemplateInstance_getPresentedTemplateWithReply___block_invoke;
  id v8 = &unk_2648A42E8;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __53__CPSTemplateInstance_getPresentedTemplateWithReply___block_invoke(uint64_t a1)
{
  v7[2] = (id)a1;
  v7[1] = (id)a1;
  id v1 = objc_opt_class();
  id v3 = (id)[*(id *)(a1 + 32) overlayViewController];
  id v2 = (id)[v3 presentedTemplateViewController];
  v7[0] = CPSSafeCast_4(v1, v2);

  id v4 = (id)[v7[0] associatedTemplate];
  id v6 = (id)[v4 identifier];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = CarPlaySupportGeneralLogging();
  char v23 = 2;
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEBUG))
  {
    log = v24;
    os_log_type_t type = v23;
    __os_log_helper_16_0_0(v22);
    _os_log_debug_impl(&dword_22B689000, log, type, "Template Instance new connection", v22, 2u);
  }
  objc_storeStrong(&v24, 0);
  id v4 = [(CPSTemplateInstance *)v27 templateEnvironment];
  BOOL v9 = v4 != 0;

  if (!v9)
  {
    int v5 = [CPSTemplateEnvironment alloc];
    id v8 = [(CPSTemplateEnvironment *)v5 initWithConnection:v25 templateProvider:v27];
    -[CPSTemplateInstance setTemplateEnvironment:](v27, "setTemplateEnvironment:");
  }
  if (location[0] == v27->_interfaceControllerListener)
  {
    char v28 = [(CPSTemplateInstance *)v27 _handleAppViewConnection:v25];
    int v21 = 1;
  }
  else if (location[0] == v27->_dashboardControllerListener)
  {
    char v28 = [(CPSTemplateInstance *)v27 _handleDashboardConnection:v25];
    int v21 = 1;
  }
  else if (location[0] == v27->_instrumentClusterControllerListener)
  {
    objc_initWeak(&v20, v27);
    queue = MEMORY[0x263EF83A0];
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    id v16 = __58__CPSTemplateInstance_listener_shouldAcceptNewConnection___block_invoke;
    id v17 = &unk_2648A43F8;
    id v18 = v27;
    objc_copyWeak(&v19, &v20);
    dispatch_async(queue, &v13);

    char v28 = [(CPSTemplateInstance *)v27 _handleInstrumentClusterConnection:v25];
    int v21 = 1;
    objc_destroyWeak(&v19);
    objc_storeStrong((id *)&v18, 0);
    objc_destroyWeak(&v20);
  }
  else
  {
    char v28 = 0;
    int v21 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v28 & 1;
}

void __58__CPSTemplateInstance_listener_shouldAcceptNewConnection___block_invoke(id *a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = a1;
  id v1 = (id)[a1[4] instrumentClusterCardViewController];
  BOOL v46 = v1 != 0;

  if (!v46)
  {
    location[0] = CarPlaySupportGeneralLogging();
    os_log_type_t v54 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      id v44 = (id)[a1[4] templateEnvironment];
      id v43 = (id)[v44 bundleIdentifier];
      __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v43);
      _os_log_debug_impl(&dword_22B689000, (os_log_t)location[0], v54, "Creating _instrumentClusterCardViewController for %@", v58, 0xCu);
    }
    objc_storeStrong(location, 0);
    id v39 = objc_alloc_init(CPSInstrumentClusterCardViewController);
    objc_msgSend(a1[4], "setInstrumentClusterCardViewController:");

    id v40 = (id)[a1[4] instrumentClusterCardViewController];
    [v40 setSafeAreaDelegate:a1[4]];

    id v42 = (id)[a1[4] navigator];
    id v41 = (id)[a1[4] instrumentClusterCardViewController];
    objc_msgSend(v42, "addDisplayDelegate:");
  }
  id v2 = (id)[a1[4] instrumentClusterMapETAViewController];
  BOOL v38 = v2 != 0;

  if (!v38)
  {
    id v53 = CarPlaySupportGeneralLogging();
    os_log_type_t v52 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_DEBUG))
    {
      id v37 = (id)[a1[4] templateEnvironment];
      id v36 = (id)[v37 bundleIdentifier];
      __os_log_helper_16_2_1_8_64((uint64_t)v57, (uint64_t)v36);
      _os_log_debug_impl(&dword_22B689000, (os_log_t)v53, v52, "Creating _instrumentClusterMapETAViewController for %@", v57, 0xCu);
    }
    objc_storeStrong(&v53, 0);
    id v32 = [[CPSInstrumentClusterCardViewController alloc] initForMapContent];
    objc_msgSend(a1[4], "setInstrumentClusterMapETAViewController:");

    id v33 = (id)[a1[4] instrumentClusterMapETAViewController];
    [v33 setSafeAreaDelegate:a1[4]];

    id v35 = (id)[a1[4] navigator];
    id v34 = (id)[a1[4] instrumentClusterCardViewController];
    objc_msgSend(v35, "addDisplayDelegate:");
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v19 = (id)[WeakRetained templateEnvironment];
  id v18 = (id)[v19 sessionStatus];
  id v17 = (id)[v18 currentSession];
  id v16 = (id)[v17 configuration];
  char v20 = [v16 rightHandDrive];

  char v50 = v20 & 1;
  id v24 = (id)[WeakRetained templateEnvironment];
  id v23 = (id)[v24 sessionStatus];
  id v22 = (id)[v23 currentSession];
  id v21 = (id)[v22 configuration];
  char v25 = [v21 supportsVehicleData];

  char v49 = v25 & 1;
  memset(__b, 0, sizeof(__b));
  id v29 = (id)[WeakRetained templateEnvironment];
  id v28 = (id)[v29 sessionStatus];
  id v27 = (id)[v28 currentSession];
  id v26 = (id)[v27 configuration];
  id obj = (id)[v26 screens];

  uint64_t v31 = [obj countByEnumeratingWithState:__b objects:v56 count:16];
  if (v31)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0;
    unint64_t v15 = v31;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(obj);
      }
      id v48 = *(id *)(__b[1] + 8 * v14);
      id v10 = (id)[v48 identifier];
      id v9 = (id)[WeakRetained instrumentClusterScene];
      id v8 = (id)[v9 settings];
      id v7 = (id)[v8 displayConfiguration];
      id v6 = (id)[v7 hardwareIdentifier];
      char v11 = objc_msgSend(v10, "isEqualToString:");

      if (v11)
      {
        id v4 = (id)[WeakRetained instrumentClusterCardViewController];
        [v4 setCARScreenInfo:v48 isRightHandDrive:v50 & 1 supportsVehicleData:v49 & 1];

        id v5 = (id)[WeakRetained instrumentClusterMapETAViewController];
        [v5 setCARScreenInfo:v48 isRightHandDrive:v50 & 1 supportsVehicleData:v49 & 1];
      }
      ++v14;
      if (v12 + 1 >= v15)
      {
        uint64_t v14 = 0;
        unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v56 count:16];
        if (!v15) {
          break;
        }
      }
    }
  }

  id v3 = (id)[WeakRetained clusterSetupDelegate];
  [v3 templateInstanceDidFinishClusterSetup:WeakRetained];

  objc_storeStrong(&WeakRetained, 0);
}

- (BOOL)_handleAppViewConnection:(id)a3
{
  id v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v14 = [(CPSTemplateInstance *)v44 templateEnvironment];
  BOOL v15 = [(CPSTemplateEnvironment *)v14 hasAnyTemplateEntitlement];

  if (v15)
  {
    uint64_t v12 = [(CPSTemplateInstance *)v44 templateEnvironment];
    uint64_t v13 = [(CPSTemplateEnvironment *)v12 bundleIdentifier];

    if (v13)
    {
      id v42 = CarPlaySupportGeneralLogging();
      char v41 = 2;
      if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEBUG))
      {
        log = v42;
        os_log_type_t type = v41;
        __os_log_helper_16_0_0(v40);
        _os_log_debug_impl(&dword_22B689000, log, type, "Process has Maps/Audio/Communications entitlement, accepting connection", v40, 2u);
      }
      objc_storeStrong(&v42, 0);
      id v39 = (id)[MEMORY[0x263EFCA10] _templateProvidingInterface];
      [location[0] setExportedInterface:v39];
      [location[0] setExportedObject:v44];
      id v38 = (id)[MEMORY[0x263EFCA10] _templateClientInterface];
      [location[0] setRemoteObjectInterface:v38];
      id v9 = (id)[location[0] remoteObjectProxy];
      -[CPSTemplateInstance setInterfaceControllerRemoteObjectProxy:](v44, "setInterfaceControllerRemoteObjectProxy:");

      objc_initWeak(&v37, v44);
      uint64_t v30 = MEMORY[0x263EF8330];
      int v31 = -1073741824;
      int v32 = 0;
      id v33 = __48__CPSTemplateInstance__handleAppViewConnection___block_invoke;
      id v34 = &unk_2648A3EC0;
      objc_copyWeak(&v35, &v37);
      id v36 = (id)MEMORY[0x230F4C6B0](&v30);
      [location[0] setInvalidationHandler:v36];
      [location[0] setInterruptionHandler:v36];
      [location[0] resume];
      [(CPSTemplateInstance *)v44 setInterfaceControllerConnection:location[0]];
      objc_initWeak(&v29, v44);
      queue = MEMORY[0x263EF83A0];
      uint64_t v23 = MEMORY[0x263EF8330];
      int v24 = -1073741824;
      int v25 = 0;
      id v26 = __48__CPSTemplateInstance__handleAppViewConnection___block_invoke_2;
      id v27 = &unk_2648A3EC0;
      objc_copyWeak(&v28, &v29);
      dispatch_async(queue, &v23);

      char v45 = 1;
      int v22 = 1;
      objc_destroyWeak(&v28);
      objc_destroyWeak(&v29);
      objc_storeStrong(&v36, 0);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&v37);
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v39, 0);
    }
    else
    {
      os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = oslog;
        os_log_type_t v7 = v20;
        __os_log_helper_16_0_0(v19);
        _os_log_impl(&dword_22B689000, v6, v7, "Unable to get bundle identifier for connection", v19, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      char v45 = 0;
      int v22 = 1;
    }
  }
  else
  {
    os_log_t v18 = (os_log_t)CarPlaySupportGeneralLogging();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v18;
      os_log_type_t v5 = v17;
      __os_log_helper_16_0_0(v16);
      _os_log_impl(&dword_22B689000, v4, v5, "Process does not have any valid template entitlement, not accepting connection", v16, 2u);
    }
    objc_storeStrong((id *)&v18, 0);
    char v45 = 0;
    int v22 = 1;
  }
  objc_storeStrong(location, 0);
  return v45 & 1;
}

void __48__CPSTemplateInstance__handleAppViewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _appViewConnectionInvalidationHandler];
}

void __48__CPSTemplateInstance__handleAppViewConnection___block_invoke_2(id *a1)
{
  v4[2] = a1;
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  id v1 = (id)[v4[0] interfaceControllerConnection];
  unsigned int v2 = [v1 processIdentifier];

  id v3 = (id)[v4[0] overlayViewController];
  [v3 updateVisibilityForPid:v2];

  objc_storeStrong(v4, 0);
}

- (void)_appViewConnectionInvalidationHandler
{
  id v9 = self;
  v8[1] = (id)a2;
  queue = MEMORY[0x263EF83A0];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __60__CPSTemplateInstance__appViewConnectionInvalidationHandler__block_invoke;
  os_log_type_t v7 = &unk_2648A3BE0;
  v8[0] = v9;
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

uint64_t __60__CPSTemplateInstance__appViewConnectionInvalidationHandler__block_invoke(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) overlayViewController];
  id v2 = (id)[v3 view];
  [v2 removeFromSuperview];

  id v4 = (id)[*(id *)(a1 + 32) overlayViewController];
  [v4 removeFromParentViewController];

  objc_msgSend(*(id *)(a1 + 32), "setTabBarViewController:");
  [*(id *)(a1 + 32) setTemplateEnvironment:0];
  return [*(id *)(a1 + 32) setInterfaceControllerRemoteObjectProxy:0];
}

- (void)invalidate
{
  id v2 = [(CPSTemplateInstance *)self bannerSource];
  [(CPSBannerSource *)v2 invalidate];

  id v3 = [(CPSTemplateInstance *)self dashboardControllerConnection];
  [(NSXPCConnection *)v3 invalidate];

  id v4 = [(CPSTemplateInstance *)self interfaceControllerConnection];
  [(NSXPCConnection *)v4 invalidate];

  int v5 = [(CPSTemplateInstance *)self overlayViewController];
  [(CPSOverlayViewController *)v5 invalidate];
}

- (BOOL)_handleDashboardConnection:(id)a3
{
  uint64_t v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v7 = [(CPSTemplateInstance *)v23 templateEnvironment];
  BOOL v8 = [(CPSTemplateEnvironment *)v7 hasNavigationEntitlement];

  BOOL v21 = v8;
  id v9 = [(CPSTemplateInstance *)v23 templateEnvironment];
  id v20 = [(CPSTemplateEnvironment *)v9 bundleIdentifier];

  if (v8 && v20)
  {
    id v19 = (id)[MEMORY[0x263EFC9E8] _dashboardProvidingInterface];
    [location[0] setExportedInterface:v19];
    [location[0] setExportedObject:v23];
    id v18 = (id)[MEMORY[0x263EFC9E8] _dashboardClientInterface];
    [location[0] setRemoteObjectInterface:v18];
    id v6 = (id)[location[0] remoteObjectProxy];
    -[CPSTemplateInstance setDashboardControllerRemoteObjectProxy:](v23, "setDashboardControllerRemoteObjectProxy:");

    objc_initWeak(&v17, v23);
    uint64_t v10 = MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    uint64_t v13 = __50__CPSTemplateInstance__handleDashboardConnection___block_invoke;
    uint64_t v14 = &unk_2648A3EC0;
    objc_copyWeak(&v15, &v17);
    id v16 = (id)MEMORY[0x230F4C6B0](&v10);
    [location[0] setInvalidationHandler:v16];
    [location[0] setInterruptionHandler:v16];
    [location[0] resume];
    [(CPSTemplateInstance *)v23 setDashboardControllerConnection:location[0]];
    int v5 = [(CPSTemplateInstance *)v23 dashboardGuidanceViewController];
    id v4 = (id)[location[0] remoteObjectProxy];
    -[CPSDashboardGuidanceViewController setDashboardClient:](v5, "setDashboardClient:");

    char v24 = 1;
    objc_storeStrong(&v16, 0);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    char v24 = 0;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v24 & 1;
}

void __50__CPSTemplateInstance__handleDashboardConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dashboardConnectionInvalidationHandler];
}

- (void)_dashboardConnectionInvalidationHandler
{
  id v9 = self;
  v8[1] = (id)a2;
  queue = MEMORY[0x263EF83A0];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __62__CPSTemplateInstance__dashboardConnectionInvalidationHandler__block_invoke;
  os_log_type_t v7 = &unk_2648A3BE0;
  v8[0] = v9;
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

uint64_t __62__CPSTemplateInstance__dashboardConnectionInvalidationHandler__block_invoke(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) dashboardGuidanceViewController];
  id v2 = (id)[v3 view];
  [v2 removeFromSuperview];

  id v4 = (id)[*(id *)(a1 + 32) dashboardGuidanceViewController];
  [v4 removeFromParentViewController];

  id v6 = (id)[*(id *)(a1 + 32) dashboardEstimatesViewController];
  id v5 = (id)[v6 view];
  [v5 removeFromSuperview];

  id v7 = (id)[*(id *)(a1 + 32) dashboardEstimatesViewController];
  [v7 removeFromParentViewController];

  return [*(id *)(a1 + 32) setDashboardControllerRemoteObjectProxy:0];
}

- (BOOL)_handleInstrumentClusterConnection:(id)a3
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(CPSTemplateInstance *)v19 templateEnvironment];
  BOOL v5 = [(CPSTemplateEnvironment *)v4 hasNavigationEntitlement];

  BOOL v17 = v5;
  id v6 = [(CPSTemplateInstance *)v19 templateEnvironment];
  id v16 = [(CPSTemplateEnvironment *)v6 bundleIdentifier];

  if (v5 && v16)
  {
    id v15 = (id)[MEMORY[0x263EFCA08] _clusterProvidingInterface];
    [location[0] setExportedInterface:v15];
    [location[0] setExportedObject:v19];
    objc_initWeak(&v14, v19);
    uint64_t v7 = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    uint64_t v10 = __58__CPSTemplateInstance__handleInstrumentClusterConnection___block_invoke;
    int v11 = &unk_2648A3EC0;
    objc_copyWeak(&v12, &v14);
    id v13 = (id)MEMORY[0x230F4C6B0](&v7);
    [location[0] setInvalidationHandler:v13];
    [location[0] setInterruptionHandler:v13];
    [location[0] resume];
    [(CPSTemplateInstance *)v19 setInstrumentClusterControllerConnection:location[0]];
    char v20 = 1;
    objc_storeStrong(&v13, 0);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_storeStrong(&v15, 0);
  }
  else
  {
    char v20 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v20 & 1;
}

void __58__CPSTemplateInstance__handleInstrumentClusterConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _instrumentClusterConnectionInvalidationHandler];
}

- (void)_instrumentClusterConnectionInvalidationHandler
{
  int v9 = self;
  v8[1] = (id)a2;
  queue = MEMORY[0x263EF83A0];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __70__CPSTemplateInstance__instrumentClusterConnectionInvalidationHandler__block_invoke;
  uint64_t v7 = &unk_2648A3BE0;
  v8[0] = v9;
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

void __70__CPSTemplateInstance__instrumentClusterConnectionInvalidationHandler__block_invoke(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) instrumentClusterViewControllerMapTable];
  id v2 = (id)[v3 objectEnumerator];
  id v1 = (id)[v2 allObjects];
  [v1 enumerateObjectsUsingBlock:&__block_literal_global_120_0];

  id v5 = (id)[*(id *)(a1 + 32) instrumentClusterViewControllerMapTable];
  [v5 removeAllObjects];
}

void __70__CPSTemplateInstance__instrumentClusterConnectionInvalidationHandler__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v2 = (id)[location[0] view];
  [v2 removeFromSuperview];

  [location[0] removeFromParentViewController];
  objc_storeStrong(location, 0);
}

- (void)allowlistClassesForBaseTemplateProvider:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  int v22 = location;
  id v23 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = location[0];
  unint64_t v17 = 0x263EFF000uLL;
  id v5 = (id)MEMORY[0x263EFFA08];
  unint64_t v8 = 0x263EFF000uLL;
  uint64_t v4 = objc_opt_class();
  unint64_t v9 = 0x263EFC000uLL;
  uint64_t v3 = objc_opt_class();
  unint64_t v10 = 0x263EFC000uLL;
  id v7 = (id)objc_msgSend(v5, "setWithObjects:", v4, v3, objc_opt_class(), 0);
  uint64_t v14 = 0;
  int v19 = 0;
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:");

  id v15 = location[0];
  id v13 = *(id *)(v17 + 2568);
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v16 = (id)objc_msgSend(v13, "setWithObjects:", v12, v11, objc_opt_class(), 0);
  objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:");

  id v20 = location[0];
  id v18 = *(id *)(v17 + 2568);
  id v21 = (id)[v18 setWithObject:objc_opt_class()];
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:");

  objc_storeStrong(v22, v23);
}

- (void)_pushNowPlayingIfNeeded
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v8 = self;
  location[1] = (id)a2;
  if (self->_pendingLaunchToNowPlaying)
  {
    v8->_pendingLaunchToNowPlaying = 0;
    id v5 = [(CPSTemplateInstance *)v8 templateEnvironment];
    BOOL v6 = [(CPSTemplateEnvironment *)v5 canBecomeNowPlayingApp];

    if (v6)
    {
      id v2 = [(CPSTemplateInstance *)v8 interfaceControllerRemoteObjectProxy];
      [(CPTemplateServiceClientInterface *)v2 clientPushNowPlayingTemplateAnimated:0];
    }
    else
    {
      location[0] = CarPlaySupportGeneralLogging();
      if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = [(CPSTemplateInstance *)v8 templateEnvironment];
        uint64_t v3 = [(CPSTemplateEnvironment *)v4 bundleIdentifier];
        __os_log_helper_16_2_1_8_66((uint64_t)v9, (uint64_t)v3);
        _os_log_impl(&dword_22B689000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "Client app %{public}@ cannot become now playing; not requesting now playing",
          v9,
          0xCu);
      }
      objc_storeStrong(location, 0);
    }
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  BOOL v17 = a5;
  id v16 = CarPlaySupportGeneralLogging();
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v18;
    id v13 = (id)[NSNumber numberWithBool:v17];
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v21, (uint64_t)v12, (uint64_t)v13);
    _os_log_impl(&dword_22B689000, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Will show navigation item %@ animated %@", v21, 0x16u);
  }
  objc_storeStrong(&v16, 0);
  uint64_t v10 = [(CPSTemplateInstance *)v20 overlayViewController];
  BOOL v11 = [(CPSOverlayViewController *)v10 shouldHideNavigationBarForViewController:v18];

  if (v11)
  {
    [location[0] setNavigationBarHidden:1 animated:1];
  }
  else if ([location[0] isNavigationBarHidden])
  {
    [location[0] setNavigationBarHidden:0 animated:1];
  }
  id v6 = (id)[location[0] viewControllers];
  unint64_t v7 = [v6 count];

  unint64_t v8 = [(CPSTemplateInstance *)v20 templateEnvironment];
  BOOL v9 = v7 <= [(CPSTemplateEnvironment *)v8 maximumClientHierarchyDepth];

  if (!v9)
  {
    id v5 = [(CPSTemplateInstance *)v20 interfaceControllerRemoteObjectProxy];
    [(CPTemplateServiceClientInterface *)v5 clientExceededHierarchyDepthLimit];
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  BOOL v10 = a5;
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v11;
    id v6 = (id)[NSNumber numberWithBool:v10];
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v13, (uint64_t)v5, (uint64_t)v6);
    _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "Did show navigation item %@ animated %@", v13, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)templateViewControllerDidPop:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[location[0] associatedTemplate];
  id v9 = (id)[v6 identifier];

  unint64_t v7 = [(CPSTemplateInstance *)v11 interfaceControllerRemoteObjectProxy];
  [(CPTemplateServiceClientInterface *)v7 templateIdentifierDidPop:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = location[0];
    objc_msgSend(v8, "setTemplateDelegate:");
    [v8 setAssociatedTemplate:0];
    objc_storeStrong(&v8, 0);
  }
  else
  {
    objc_msgSend(location[0], "setTemplateDelegate:");
    [location[0] setAssociatedTemplate:0];
  }
  id v5 = [(CPSTemplateInstance *)v11 identifierToViewControllerDictionary];
  [(NSMutableDictionary *)v5 removeObjectForKey:v9];

  if ([location[0] conformsToProtocol:&unk_26DF50158])
  {
    uint64_t v4 = [(CPSTemplateInstance *)v11 applicationStateMonitor];
    id v3 = CPSSafeProtocolCast_0(&unk_26DF50158, location[0]);
    -[CPSApplicationStateMonitor removeApplicationStateObserver:](v4, "removeApplicationStateObserver:");
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)templateViewControllerDidDismiss:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = (id)[location[0] associatedTemplate];
  id v10 = (id)[v8 identifier];

  if (v10)
  {
    id v5 = [(CPSTemplateInstance *)v12 interfaceControllerRemoteObjectProxy];
    [(CPTemplateServiceClientInterface *)v5 templateIdentifierDidDismiss:v10];

    id v6 = [(CPSTemplateInstance *)v12 identifierToViewControllerDictionary];
    id v9 = (id)[(NSMutableDictionary *)v6 objectForKey:v10];

    objc_msgSend(v9, "setTemplateDelegate:");
    [v9 setAssociatedTemplate:0];
    unint64_t v7 = [(CPSTemplateInstance *)v12 identifierToViewControllerDictionary];
    [(NSMutableDictionary *)v7 removeObjectForKey:v10];

    objc_storeStrong(&v9, 0);
  }
  if ([location[0] conformsToProtocol:&unk_26DF50158])
  {
    uint64_t v4 = [(CPSTemplateInstance *)v12 applicationStateMonitor];
    id v3 = CPSSafeProtocolCast_0(&unk_26DF50158, location[0]);
    -[CPSApplicationStateMonitor removeApplicationStateObserver:](v4, "removeApplicationStateObserver:");
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)templateViewController:(id)a3 shouldActivateSiriWithDirectActionContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = CarPlaySupportGeneralLogging();
  os_log_type_t v13 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v18, (uint64_t)v15);
    _os_log_impl(&dword_22B689000, (os_log_t)v14, v13, "Preparing to activate Siri for direct action %@", v18, 0xCu);
  }
  objc_storeStrong(&v14, 0);
  id v5 = [(CPSTemplateInstance *)v17 siriActivationSource];
  id v4 = v15;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __88__CPSTemplateInstance_templateViewController_shouldActivateSiriWithDirectActionContext___block_invoke;
  id v11 = &unk_2648A3B90;
  id v12 = v15;
  [(SiriDirectActionSource *)v5 activateWithContext:v4 completion:&v7];

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

void __88__CPSTemplateInstance_templateViewController_shouldActivateSiriWithDirectActionContext___block_invoke(NSObject *a1, char a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v7 = a1;
  char v6 = a2 & 1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_INFO))
  {
    uint64_t isa = (uint64_t)a1[4].isa;
    id v3 = (id)[NSNumber numberWithBool:v6 & 1];
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, isa, (uint64_t)v3);
    _os_log_impl(&dword_22B689000, oslog[0], OS_LOG_TYPE_INFO, "Performed Siri activation for %@ with result %@", v8, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (UIEdgeInsets)safeAreaInsetsForScene:(id)a3
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  v79 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v66 = (FBScene *)location[0];
  id v3 = [(CPSTemplateInstance *)v79 mapWidgetScene];
  BOOL v67 = v66 != v3;

  if (v67)
  {
    uint64_t v61 = (FBScene *)location[0];
    id v16 = [(CPSTemplateInstance *)v79 scene];
    BOOL v62 = v61 != v16;

    if (v62)
    {
      id v59 = (id)[location[0] settings];
      id v58 = (id)[v59 displayConfiguration];
      os_log_type_t v57 = [(CPSTemplateInstance *)v79 instrumentClusterMapETAViewController];
      id v56 = (id)[(CPSInstrumentClusterCardViewController *)v57 view];
      id v55 = (id)[v56 window];
      id v54 = (id)[v55 screen];
      id v53 = (id)[v54 displayConfiguration];
      char v60 = objc_msgSend(v58, "isEqual:");

      if (v60)
      {
        os_log_type_t v51 = [(CPSTemplateInstance *)v79 instrumentClusterMapETAViewController];
        id v50 = (id)[(CPSInstrumentClusterCardViewController *)v51 view];
        [v50 safeAreaInsets];
        oslog[5] = v21;
        oslog[6] = v22;
        oslog[7] = v23;
        oslog[8] = v24;

        os_log_type_t v52 = [(CPSTemplateInstance *)v79 instrumentClusterMapETAViewController];
        [(CPSInstrumentClusterCardViewController *)v52 currentClientInsets];
        oslog[1] = v25;
        os_log_t oslog[2] = v26;
        oslog[3] = v27;
        oslog[4] = v28;

        long long v80 = 0u;
        long long v81 = 0u;
        UIEdgeInsetsAdd();
        *(void *)&long long v80 = v29;
        *((void *)&v80 + 1) = v30;
        *(void *)&long long v81 = v31;
        *((void *)&v81 + 1) = v32;
        int v69 = 1;
      }
      else
      {
        id v48 = (id)[location[0] settings];
        id v47 = (id)[v48 displayConfiguration];
        BOOL v46 = [(CPSTemplateInstance *)v79 instrumentClusterCardViewController];
        id v45 = (id)[(CPSInstrumentClusterCardViewController *)v46 view];
        id v44 = (id)[v45 window];
        id v43 = (id)[v44 screen];
        id v42 = (id)[v43 displayConfiguration];
        char v49 = objc_msgSend(v47, "isEqual:");

        if (v49)
        {
          long long v80 = 0u;
          long long v81 = 0u;
          char v41 = [(CPSTemplateInstance *)v79 instrumentClusterCardViewController];
          [(CPSInstrumentClusterCardViewController *)v41 currentClientInsets];
          *(void *)&long long v80 = v33;
          *((void *)&v80 + 1) = v34;
          *(void *)&long long v81 = v35;
          *((void *)&v81 + 1) = v36;

          int v69 = 1;
        }
        else
        {
          oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
          if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v82, (uint64_t)location[0]);
            _os_log_error_impl(&dword_22B689000, oslog[0], OS_LOG_TYPE_ERROR, "Requesting safe area for scene not owned by this instance: %{public}@", v82, 0xCu);
          }
          objc_storeStrong((id *)oslog, 0);
          long long v80 = *MEMORY[0x263F1D1C0];
          long long v81 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
          int v69 = 1;
        }
      }
    }
    else
    {
      [(CPSTemplateInstance *)v79 currentSafeAreaInsets];
      *(void *)&long long v80 = v17;
      *((void *)&v80 + 1) = v18;
      *(void *)&long long v81 = v19;
      *((void *)&v81 + 1) = v20;
      int v69 = 1;
    }
  }
  else
  {
    v64 = [(CPSTemplateInstance *)v79 dashboardEstimatesViewController];
    id v63 = (id)[(CPSDashboardEstimatesViewController *)v64 view];
    [v63 safeAreaInsets];
    uint64_t v74 = v4;
    uint64_t v75 = v5;
    uint64_t v76 = v6;
    uint64_t v77 = v7;

    v65 = [(CPSTemplateInstance *)v79 dashboardEstimatesViewController];
    [(CPSDashboardEstimatesViewController *)v65 safeAreaInsets];
    uint64_t v70 = v8;
    uint64_t v71 = v9;
    uint64_t v72 = v10;
    uint64_t v73 = v11;

    long long v80 = 0u;
    long long v81 = 0u;
    UIEdgeInsetsAdd();
    *(void *)&long long v80 = v12;
    *((void *)&v80 + 1) = v13;
    *(void *)&long long v81 = v14;
    *((void *)&v81 + 1) = v15;
    int v69 = 1;
  }
  objc_storeStrong(location, 0);
  double v37 = *((double *)&v81 + 1);
  double v38 = *(double *)&v81;
  double v39 = *((double *)&v80 + 1);
  double v40 = *(double *)&v80;
  result.right = v37;
  result.bottom = v38;
  result.left = v39;
  result.top = v40;
  return result;
}

- (void)viewController:(id)a3 didUpdateSafeAreaInsets:(UIEdgeInsets)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  UIEdgeInsets v53 = a4;
  os_log_type_t v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v25 = (CPSInstrumentClusterCardViewController *)location[0];
  id v26 = [(CPSTemplateInstance *)v52 instrumentClusterCardViewController];
  char v49 = 0;
  char v47 = 0;
  char v45 = 0;
  if (v25 != v26
    || (id v50 = [(CPSTemplateInstance *)v52 instrumentClusterCardViewController],
        char v49 = 1,
        char v24 = 1,
        ![(CPSInstrumentClusterCardViewController *)v50 shouldUpdateContent]))
  {
    uint64_t v22 = (CPSInstrumentClusterCardViewController *)location[0];
    id v48 = [(CPSTemplateInstance *)v52 instrumentClusterMapETAViewController];
    char v47 = 1;
    char v23 = 0;
    if (v22 == v48)
    {
      BOOL v46 = [(CPSTemplateInstance *)v52 instrumentClusterMapETAViewController];
      char v45 = 1;
      char v23 = [(CPSInstrumentClusterCardViewController *)v46 shouldUpdateContent];
    }
    char v24 = v23;
  }
  if (v45) {

  }
  if (v47) {
  if (v49)
  }

  if (v24)
  {
    uint64_t v20 = [(CPSTemplateInstance *)v52 instrumentClusterScene];
    char v21 = [(FBScene *)v20 isValid];

    if (v21)
    {
      uint64_t v19 = [(CPSTemplateInstance *)v52 instrumentClusterScene];
      uint64_t v39 = MEMORY[0x263EF8330];
      int v40 = -1073741824;
      int v41 = 0;
      id v42 = __62__CPSTemplateInstance_viewController_didUpdateSafeAreaInsets___block_invoke;
      id v43 = &unk_2648A41F8;
      id v44 = v52;
      [(FBScene *)v19 updateUISettingsWithBlock:&v39];

      objc_storeStrong((id *)&v44, 0);
    }
  }
  else
  {
    uint64_t v17 = (CPSDashboardEstimatesViewController *)location[0];
    uint64_t v4 = [(CPSTemplateInstance *)v52 dashboardEstimatesViewController];
    BOOL v18 = v17 != v4;

    if (v18)
    {
      os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
      os_log_type_t v28 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = oslog;
        os_log_type_t v9 = v28;
        uint64_t v10 = NSStringFromUIEdgeInsets(v53);
        id v27 = v10;
        __os_log_helper_16_2_1_8_64((uint64_t)v54, (uint64_t)v27);
        _os_log_impl(&dword_22B689000, v8, v9, "Updating safe area for map template to %@", v54, 0xCu);

        objc_storeStrong((id *)&v27, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      v52->_currentSafeAreaInsets = v53;
      uint64_t v6 = [(CPSTemplateInstance *)v52 scene];
      char v7 = [(FBScene *)v6 isValid];

      if (v7)
      {
        uint64_t v5 = [(CPSTemplateInstance *)v52 scene];
        -[FBScene updateUISettingsWithBlock:](v5, "updateUISettingsWithBlock:");
      }
    }
    else
    {
      id v38 = CarPlaySupportGeneralLogging();
      char v37 = 1;
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_INFO))
      {
        log = v38;
        os_log_type_t type = v37;
        id v16 = NSStringFromUIEdgeInsets(v53);
        uint64_t v36 = v16;
        __os_log_helper_16_2_1_8_64((uint64_t)v55, (uint64_t)v36);
        _os_log_impl(&dword_22B689000, log, type, "Updating safe area for map template to %@", v55, 0xCu);

        objc_storeStrong((id *)&v36, 0);
      }
      objc_storeStrong(&v38, 0);
      uint64_t v12 = [(CPSTemplateInstance *)v52 mapWidgetScene];
      char v13 = [(FBScene *)v12 isValid];

      if (v13)
      {
        uint64_t v11 = [(CPSTemplateInstance *)v52 mapWidgetScene];
        uint64_t v30 = MEMORY[0x263EF8330];
        int v31 = -1073741824;
        int v32 = 0;
        uint64_t v33 = __62__CPSTemplateInstance_viewController_didUpdateSafeAreaInsets___block_invoke_176;
        uint64_t v34 = &unk_2648A41F8;
        uint64_t v35 = v52;
        [(FBScene *)v11 updateUISettingsWithBlock:&v30];

        objc_storeStrong((id *)&v35, 0);
      }
    }
  }
  objc_storeStrong(location, 0);
}

void __62__CPSTemplateInstance_viewController_didUpdateSafeAreaInsets___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = location[0];
  char v7 = (void *)a1[4];
  id v9 = (id)[v7 instrumentClusterScene];
  objc_msgSend(v7, "safeAreaInsetsForScene:");
  objc_msgSend(v8, "setSafeAreaInsetsPortrait:", v2, v3, v4, v5);

  objc_storeStrong(location, 0);
}

void __62__CPSTemplateInstance_viewController_didUpdateSafeAreaInsets___block_invoke_176(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = location[0];
  char v7 = (void *)a1[4];
  id v9 = (id)[v7 mapWidgetScene];
  objc_msgSend(v7, "safeAreaInsetsForScene:");
  objc_msgSend(v8, "setSafeAreaInsetsPortrait:", v2, v3, v4, v5);

  objc_storeStrong(location, 0);
}

void __62__CPSTemplateInstance_viewController_didUpdateSafeAreaInsets___block_invoke_177(double *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setSafeAreaInsetsPortrait:", a1[4], a1[5], a1[6], a1[7]);
  objc_storeStrong(location, 0);
}

- (void)updateInterestingInsets:(UIEdgeInsets)a3
{
  double v3 = [(CPSTemplateInstance *)self interfaceControllerRemoteObjectProxy];
  -[CPTemplateServiceClientInterface updateInterestingLayoutGuideWithInsets:](v3, "updateInterestingLayoutGuideWithInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)hostSetShortcutButtons:(id)a3 completion:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __57__CPSTemplateInstance_hostSetShortcutButtons_completion___block_invoke;
  uint64_t v10 = &unk_2648A4310;
  uint64_t v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __57__CPSTemplateInstance_hostSetShortcutButtons_completion___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) dashboardGuidanceViewController];
  [v2 setShortCutButtons:*(void *)(a1 + 40)];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)instrumentClusterViewControllerForDisplayIdentifier:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v13->_instrumentClusterViewControllerMapTable)
  {
    double v3 = (NSMapTable *)(id)[MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    instrumentClusterViewControllerMapTable = v13->_instrumentClusterViewControllerMapTable;
    v13->_instrumentClusterViewControllerMapTable = v3;
  }
  uint64_t v10 = [(CPSTemplateInstance *)v13 instrumentClusterViewControllerMapTable];
  uint64_t v11 = (CPSInstrumentClusterViewController *)[(NSMapTable *)v10 objectForKey:location[0]];

  if (!v11)
  {
    uint64_t v11 = objc_alloc_init(CPSInstrumentClusterViewController);

    int v7 = [(CPSTemplateInstance *)v13 clusterInactiveVariants];
    -[CPSInstrumentClusterViewController setInactiveVariants:](v11, "setInactiveVariants:");

    int v8 = [(CPSTemplateInstance *)v13 clusterAttributedInactiveVariants];
    -[CPSInstrumentClusterViewController setAttributedInactiveVariants:](v11, "setAttributedInactiveVariants:");

    id v9 = [(CPSTemplateInstance *)v13 instrumentClusterViewControllerMapTable];
    [(NSMapTable *)v9 setObject:v11 forKey:location[0]];
  }
  uint64_t v6 = v11;
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (void)setCurrentLaneGuidance:(id)a3
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v3 = [(CPSTemplateInstance *)v11 navigationManager];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __46__CPSTemplateInstance_setCurrentLaneGuidance___block_invoke;
  int v8 = &unk_2648A4460;
  id v9 = location[0];
  [(CPNavigationManager *)v3 modifyRouteGuidance:"modifyRouteGuidance:"];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __46__CPSTemplateInstance_setCurrentLaneGuidance___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setCurrentLaneGuidance:a1[4]];
  [location[0] setLaneGuidanceShowing:a1[4] != 0];
  objc_storeStrong(location, 0);
}

- (void)startRerouting
{
  id v2 = [(CPSTemplateInstance *)self navigationManager];
  [(CPNavigationManager *)v2 startRerouting];
}

- (void)routeChangedWithReason:(unsigned __int8)a3 routeInfo:(id)a4
{
  int v8 = self;
  SEL v7 = a2;
  unsigned __int8 v6 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  uint64_t v4 = [(CPSTemplateInstance *)v8 navigationManager];
  [(CPNavigationManager *)v4 routeChangedWithReason:v6 routeInfo:location];

  objc_storeStrong(&location, 0);
}

- (void)finishTrip
{
  id v2 = [(CPSTemplateInstance *)self navigationManager];
  [(CPNavigationManager *)v2 resetRouteGuidance];

  double v3 = [(CPSTemplateInstance *)self navigationManager];
  [(CPNavigationManager *)v3 releaseNavigationOwnership];
}

- (void)setCurrentRoadNameVariants:(id)a3
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v3 = [(CPSTemplateInstance *)v11 navigationManager];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = __50__CPSTemplateInstance_setCurrentRoadNameVariants___block_invoke;
  int v8 = &unk_2648A4460;
  id v9 = location[0];
  [(CPNavigationManager *)v3 modifyRouteGuidance:"modifyRouteGuidance:"];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __50__CPSTemplateInstance_setCurrentRoadNameVariants___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setCurrentRoadNameVariants:a1[4]];
  objc_storeStrong(location, 0);
}

- (void)setManeuverState:(int64_t)a3
{
  id v12 = self;
  SEL v11 = a2;
  int64_t v10 = a3;
  double v3 = [(CPSTemplateInstance *)self navigationManager];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = __40__CPSTemplateInstance_setManeuverState___block_invoke;
  int v8 = &__block_descriptor_40_e25_v16__0__CPRouteGuidance_8l;
  int64_t v9 = v10;
  [(CPNavigationManager *)v3 modifyRouteGuidance:"modifyRouteGuidance:"];
}

void __40__CPSTemplateInstance_setManeuverState___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setManeuverState:a1[4]];
  objc_storeStrong(location, 0);
}

- (void)pauseTripForReason:(unint64_t)a3
{
  id v12 = self;
  SEL v11 = a2;
  unint64_t v10 = a3;
  double v3 = [(CPSTemplateInstance *)self navigationManager];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = __42__CPSTemplateInstance_pauseTripForReason___block_invoke;
  int v8 = &__block_descriptor_40_e25_v16__0__CPRouteGuidance_8l;
  unint64_t v9 = v10;
  [(CPNavigationManager *)v3 modifyRouteGuidance:"modifyRouteGuidance:"];
}

void __42__CPSTemplateInstance_pauseTripForReason___block_invoke(unint64_t *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  unsigned __int8 v2 = CPGuidanceStateFromCPTripPauseReason(a1[4]);
  [location[0] setGuidanceState:v2];
  objc_storeStrong(location, 0);
}

- (void)setSendsNavigationMetadata:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(CPSTemplateInstance *)self navigationManager];
  [(CPNavigationManager *)v4 setSupportsAccNav:v3];

  int v5 = [(CPSTemplateInstance *)self navigationManager];
  [(CPNavigationManager *)v5 modifyRouteGuidance:"modifyRouteGuidance:"];
}

void __50__CPSTemplateInstance_setSendsNavigationMetadata___block_invoke(unsigned char *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setSourceSupportsRouteGuidance:a1[32] & 1];
  objc_storeStrong(location, 0);
}

- (void)setDestinationTimeZoneOffsetMinutes:(signed __int16)a3
{
  unsigned int v3 = a3;
  uint64_t v4 = [(CPSTemplateInstance *)self navigationManager];
  [(CPNavigationManager *)v4 setDestinationTimeZoneOffsetMinutes:v3];
}

- (void)setDestinationNameVariants:(id)a3
{
  SEL v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v3 = [(CPSTemplateInstance *)v11 navigationManager];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = __50__CPSTemplateInstance_setDestinationNameVariants___block_invoke;
  int v8 = &unk_2648A4460;
  id v9 = location[0];
  [(CPNavigationManager *)v3 modifyRouteGuidance:"modifyRouteGuidance:"];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __50__CPSTemplateInstance_setDestinationNameVariants___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setDestinationNameVariants:a1[4]];
  objc_storeStrong(location, 0);
}

- (void)updateTripTravelEstimates:(id)a3
{
  SEL v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v3 = [(CPSTemplateInstance *)v11 navigationManager];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = __49__CPSTemplateInstance_updateTripTravelEstimates___block_invoke;
  int v8 = &unk_2648A4460;
  id v9 = location[0];
  [(CPNavigationManager *)v3 modifyRouteGuidance:"modifyRouteGuidance:"];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __49__CPSTemplateInstance_updateTripTravelEstimates___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v2 = (id)[a1[4] distanceRemaining];
  objc_msgSend(location[0], "setDistanceRemaining:");

  id v3 = (id)[a1[4] distanceRemainingToDisplay];
  objc_msgSend(location[0], "setDistanceRemainingDisplay:");

  [a1[4] timeRemaining];
  objc_msgSend(location[0], "setTimeRemaining:");
  int v5 = (void *)MEMORY[0x263EFF910];
  [a1[4] timeRemaining];
  id v6 = (id)objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  objc_msgSend(location[0], "setEstimatedTimeOfArrival:");

  objc_storeStrong(location, 0);
}

- (void)updateTravelEstimates:(id)a3 forManeuver:(id)a4
{
  uint64_t v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  int v5 = [(CPSTemplateInstance *)v15 navigationManager];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __57__CPSTemplateInstance_updateTravelEstimates_forManeuver___block_invoke;
  unint64_t v10 = &unk_2648A44C8;
  id v11 = v13;
  id v12 = location[0];
  [(CPNavigationManager *)v5 modifyRouteGuidance:"modifyRouteGuidance:"];

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSTemplateInstance_updateTravelEstimates_forManeuver___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = (id)[location[0] currentManeuverIndexes];
  id v6 = (id)[v7 firstObject];
  int v5 = [v6 unsignedIntValue];
  BOOL v8 = v5 != (unsigned __int16)[a1[4] index];

  if (!v8)
  {
    id v2 = (id)[a1[5] distanceRemaining];
    objc_msgSend(location[0], "setDistanceRemainingToNextManeuver:");

    id v3 = (id)[a1[5] distanceRemainingToDisplay];
    objc_msgSend(location[0], "setDistanceRemainingToNextManeuverDisplay:");
  }
  objc_storeStrong(location, 0);
}

- (void)cancelTrip
{
  id v2 = [(CPSTemplateInstance *)self navigationManager];
  [(CPNavigationManager *)v2 resetRouteGuidance];

  id v3 = [(CPSTemplateInstance *)self navigationManager];
  [(CPNavigationManager *)v3 releaseNavigationOwnership];
}

- (void)addManeuvers:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSTemplateInstance *)v5 navigationManager];
  [(CPNavigationManager *)v3 addManeuvers:location[0]];

  objc_storeStrong(location, 0);
}

- (void)addLaneGuidances:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSTemplateInstance *)v5 navigationManager];
  [(CPNavigationManager *)v3 addLaneGuidances:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setActiveManeuvers:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSTemplateInstance *)v11 navigationManager];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __42__CPSTemplateInstance_setActiveManeuvers___block_invoke;
  BOOL v8 = &unk_2648A4460;
  id v9 = location[0];
  [(CPNavigationManager *)v3 modifyRouteGuidance:"modifyRouteGuidance:"];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __42__CPSTemplateInstance_setActiveManeuvers___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setGuidanceState:1];
  [location[0] setCurrentManeuvers:a1[4]];
  objc_storeStrong(location, 0);
}

- (void)navigationOwnershipChangedToOwner:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v13 = self;
  SEL v12 = a2;
  unint64_t v11 = a3;
  id v10 = CarPlaySupportGeneralLogging();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    os_log_type_t type = v9;
    id v7 = [(CPSTemplateInstance *)v13 navigator];
    int v6 = NSStringFromNavigationOwner(v11);
    BOOL v8 = v6;
    __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v14, (uint64_t)v13, (uint64_t)v7, (uint64_t)v8);
    _os_log_impl(&dword_22B689000, log, type, "%@: Informing %@ navigation ownership changed to %@", v14, 0x20u);

    objc_storeStrong((id *)&v8, 0);
  }
  objc_storeStrong(&v10, 0);
  id v3 = [(CPSTemplateInstance *)v13 navigator];
  [(CPSNavigator *)v3 navigationOwnershipChangedToOwner:v11];

  if (v11 != 1) {
    [(CPSTemplateInstance *)v13 cancelTrip];
  }
}

- (void)didCreateNavigator:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = CarPlaySupportGeneralLogging();
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v25, (uint64_t)v24, (uint64_t)location[0]);
    _os_log_impl(&dword_22B689000, (os_log_t)v22, v21, "%@: did create navigator %@", v25, 0x16u);
  }
  objc_storeStrong(&v22, 0);
  [(CPSTemplateInstance *)v24 setNavigator:location[0]];
  id v14 = (id)[location[0] trip];
  char v12 = [v14 sendsNavigationMetadata];
  id v13 = [(CPSTemplateInstance *)v24 navigationManager];
  [(CPNavigationManager *)v13 setSupportsAccNav:v12 & 1];

  if (v24->_dashboardGuidanceViewController)
  {
    [location[0] addDisplayDelegate:v24->_dashboardGuidanceViewController];
    [location[0] addDisplayDelegate:v24->_dashboardEstimatesViewController];
  }
  if (v24->_instrumentClusterCardViewController) {
    [location[0] addDisplayDelegate:v24->_instrumentClusterCardViewController];
  }
  if (v24->_instrumentClusterMapETAViewController) {
    [location[0] addDisplayDelegate:v24->_instrumentClusterMapETAViewController];
  }
  id v10 = [(CPSTemplateInstance *)v24 templateEnvironment];
  BOOL v11 = [(CPSTemplateEnvironment *)v10 supportsInstrumentCluster];

  if (v11) {
    [location[0] setAppSupportsInstrumentCluster:1];
  }
  id v3 = [(CPSTemplateInstance *)v24 navigationManager];
  [(CPNavigationManager *)v3 requestNavigationOwnership];

  [location[0] setMetadataDelegate:v24];
  id v6 = (id)[location[0] trip];
  __int16 v4 = [v6 destinationTimeZoneOffsetFromGMT];
  id v5 = (id)[location[0] metadataDelegate];
  [v5 setDestinationTimeZoneOffsetMinutes:v4];

  os_log_type_t v9 = [(CPSTemplateInstance *)v24 instrumentClusterViewControllerMapTable];
  BOOL v8 = [(NSMapTable *)v9 objectEnumerator];
  id v7 = [(NSEnumerator *)v8 allObjects];
  uint64_t v15 = MEMORY[0x263EF8330];
  int v16 = -1073741824;
  int v17 = 0;
  BOOL v18 = __42__CPSTemplateInstance_didCreateNavigator___block_invoke;
  uint64_t v19 = &unk_2648A44F0;
  id v20 = location[0];
  [(NSArray *)v7 enumerateObjectsUsingBlock:&v15];

  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __42__CPSTemplateInstance_didCreateNavigator___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [a1[4] addDisplayDelegate:location[0]];
  objc_storeStrong(location, 0);
}

- (void)setWindowSceneForMapWidgetScene:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v5->_windowSceneForMapWidgetScene, location[0]);
  id v3 = [(CPSTemplateInstance *)v5 applicationStateMonitor];
  [(CPSApplicationStateMonitor *)v3 setWindowSceneForMapWidgetScene:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setWindowSceneForGuidanceWidgetScene:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v5->_windowSceneForGuidanceWidgetScene, location[0]);
  id v3 = [(CPSTemplateInstance *)v5 applicationStateMonitor];
  [(CPSApplicationStateMonitor *)v3 setWindowSceneForGuidanceWidgetScene:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setWindowSceneForTemplateApplicationScene:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v5->_windowSceneForTemplateApplicationScene, location[0]);
  id v3 = [(CPSTemplateInstance *)v5 applicationStateMonitor];
  [(CPSApplicationStateMonitor *)v3 setWindowSceneForTemplateApplicationScene:location[0]];

  objc_storeStrong(location, 0);
}

- (void)hostConnectToClient
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    os_log_type_t type = v5;
    __os_log_helper_16_0_0(v4);
    _os_log_impl(&dword_22B689000, log, type, "Cluster connection established", v4, 2u);
  }
  objc_storeStrong(location, 0);
}

- (void)hostSetInactiveVariants:(id)a3
{
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __47__CPSTemplateInstance_hostSetInactiveVariants___block_invoke;
  BOOL v8 = &unk_2648A3990;
  os_log_type_t v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __47__CPSTemplateInstance_hostSetInactiveVariants___block_invoke(id *a1)
{
  v10[2] = a1;
  v10[1] = a1;
  [a1[4] setClusterInactiveVariants:a1[5]];
  id v4 = (id)[a1[4] instrumentClusterViewControllerMapTable];
  id v3 = (id)[v4 objectEnumerator];
  id v2 = (id)[v3 allObjects];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  BOOL v8 = __47__CPSTemplateInstance_hostSetInactiveVariants___block_invoke_2;
  os_log_type_t v9 = &unk_2648A44F0;
  v10[0] = a1[5];
  objc_msgSend(v2, "enumerateObjectsUsingBlock:");

  objc_storeStrong(v10, 0);
}

void __47__CPSTemplateInstance_hostSetInactiveVariants___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setInactiveVariants:a1[4]];
  objc_storeStrong(location, 0);
}

- (void)hostSetAttributedInactiveVariants:(id)a3
{
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __57__CPSTemplateInstance_hostSetAttributedInactiveVariants___block_invoke;
  BOOL v8 = &unk_2648A3990;
  os_log_type_t v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSTemplateInstance_hostSetAttributedInactiveVariants___block_invoke(id *a1)
{
  v10[2] = a1;
  v10[1] = a1;
  [a1[4] setClusterAttributedInactiveVariants:a1[5]];
  id v4 = (id)[a1[4] instrumentClusterViewControllerMapTable];
  id v3 = (id)[v4 objectEnumerator];
  id v2 = (id)[v3 allObjects];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  BOOL v8 = __57__CPSTemplateInstance_hostSetAttributedInactiveVariants___block_invoke_2;
  os_log_type_t v9 = &unk_2648A44F0;
  v10[0] = a1[5];
  objc_msgSend(v2, "enumerateObjectsUsingBlock:");

  objc_storeStrong(v10, 0);
}

void __57__CPSTemplateInstance_hostSetAttributedInactiveVariants___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setAttributedInactiveVariants:a1[4]];
  objc_storeStrong(location, 0);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (CPSOverlayViewController)overlayViewController
{
  return self->_overlayViewController;
}

- (void)setOverlayViewController:(id)a3
{
}

- (FBScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (FBScene *)WeakRetained;
}

- (UIWindowScene)windowSceneForTemplateApplicationScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneForTemplateApplicationScene);

  return (UIWindowScene *)WeakRetained;
}

- (UIWindowScene)windowSceneForMapWidgetScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneForMapWidgetScene);

  return (UIWindowScene *)WeakRetained;
}

- (UIWindowScene)windowSceneForGuidanceWidgetScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneForGuidanceWidgetScene);

  return (UIWindowScene *)WeakRetained;
}

- (UIWindowScene)windowSceneForInstrumentClusterMapWidgetScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneForInstrumentClusterMapWidgetScene);

  return (UIWindowScene *)WeakRetained;
}

- (void)setWindowSceneForInstrumentClusterMapWidgetScene:(id)a3
{
}

- (FBScene)mapWidgetScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapWidgetScene);

  return (FBScene *)WeakRetained;
}

- (FBScene)instrumentClusterScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instrumentClusterScene);

  return (FBScene *)WeakRetained;
}

- (CPSClusterTemplateSetupDelegate)clusterSetupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clusterSetupDelegate);

  return (CPSClusterTemplateSetupDelegate *)WeakRetained;
}

- (void)setClusterSetupDelegate:(id)a3
{
}

- (CPSDashboardGuidanceViewController)dashboardGuidanceViewController
{
  return self->_dashboardGuidanceViewController;
}

- (CPSDashboardEstimatesViewController)dashboardEstimatesViewController
{
  return self->_dashboardEstimatesViewController;
}

- (CPSInstrumentClusterCardViewController)instrumentClusterCardViewController
{
  return self->_instrumentClusterCardViewController;
}

- (void)setInstrumentClusterCardViewController:(id)a3
{
}

- (CPSInstrumentClusterCardViewController)instrumentClusterMapETAViewController
{
  return self->_instrumentClusterMapETAViewController;
}

- (void)setInstrumentClusterMapETAViewController:(id)a3
{
}

- (UIEdgeInsets)currentSafeAreaInsets
{
  double left = self->_currentSafeAreaInsets.left;
  double top = self->_currentSafeAreaInsets.top;
  double right = self->_currentSafeAreaInsets.right;
  double bottom = self->_currentSafeAreaInsets.bottom;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCurrentSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_currentSafeAreaInsets = a3;
}

- (NSXPCListener)interfaceControllerListener
{
  return self->_interfaceControllerListener;
}

- (void)setInterfaceControllerListener:(id)a3
{
}

- (NSXPCConnection)interfaceControllerConnection
{
  return self->_interfaceControllerConnection;
}

- (void)setInterfaceControllerConnection:(id)a3
{
}

- (CPTemplateServiceClientInterface)interfaceControllerRemoteObjectProxy
{
  return self->_interfaceControllerRemoteObjectProxy;
}

- (void)setInterfaceControllerRemoteObjectProxy:(id)a3
{
}

- (NSXPCListener)dashboardControllerListener
{
  return self->_dashboardControllerListener;
}

- (void)setDashboardControllerListener:(id)a3
{
}

- (NSXPCConnection)dashboardControllerConnection
{
  return self->_dashboardControllerConnection;
}

- (void)setDashboardControllerConnection:(id)a3
{
}

- (CPDashboardClientInterface)dashboardControllerRemoteObjectProxy
{
  return self->_dashboardControllerRemoteObjectProxy;
}

- (void)setDashboardControllerRemoteObjectProxy:(id)a3
{
}

- (NSXPCListener)instrumentClusterControllerListener
{
  return self->_instrumentClusterControllerListener;
}

- (void)setInstrumentClusterControllerListener:(id)a3
{
}

- (NSXPCConnection)instrumentClusterControllerConnection
{
  return self->_instrumentClusterControllerConnection;
}

- (void)setInstrumentClusterControllerConnection:(id)a3
{
}

- (NSMutableDictionary)identifierToViewControllerDictionary
{
  return self->_identifierToViewControllerDictionary;
}

- (void)setIdentifierToViewControllerDictionary:(id)a3
{
}

- (CPSBannerSource)bannerSource
{
  return self->_bannerSource;
}

- (void)setBannerSource:(id)a3
{
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (CPSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setApplicationStateMonitor:(id)a3
{
}

- (NSUUID)actionSheetIdentifier
{
  return self->_actionSheetIdentifier;
}

- (void)setActionSheetIdentifier:(id)a3
{
}

- (CPSTabBarViewController)tabBarViewController
{
  return self->_tabBarViewController;
}

- (void)setTabBarViewController:(id)a3
{
}

- (CPSTemplateEnvironment)templateEnvironment
{
  return self->_templateEnvironment;
}

- (void)setTemplateEnvironment:(id)a3
{
}

- (SiriDirectActionSource)siriActivationSource
{
  return self->_siriActivationSource;
}

- (void)setSiriActivationSource:(id)a3
{
}

- (NSMapTable)instrumentClusterViewControllerMapTable
{
  return self->_instrumentClusterViewControllerMapTable;
}

- (void)setInstrumentClusterViewControllerMapTable:(id)a3
{
}

- (NSArray)clusterInactiveVariants
{
  return self->_clusterInactiveVariants;
}

- (void)setClusterInactiveVariants:(id)a3
{
}

- (NSArray)clusterAttributedInactiveVariants
{
  return self->_clusterAttributedInactiveVariants;
}

- (void)setClusterAttributedInactiveVariants:(id)a3
{
}

- (CPNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void)setNavigationManager:(id)a3
{
}

- (CPSNavigator)navigator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigator);

  return (CPSNavigator *)WeakRetained;
}

- (void)setNavigator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end