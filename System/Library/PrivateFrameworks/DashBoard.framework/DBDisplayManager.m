@interface DBDisplayManager
- (BOOL)_isPassengerDisplay:(id)a3;
- (BOOL)activated;
- (BOOL)bundleIdentifierIsCertificationApp:(id)a3;
- (BOOL)bundleIdentifierSupportsDashboard:(id)a3;
- (BOOL)bundleIdentifierSupportsInstrumentCluster:(id)a3;
- (BOOL)sessionServiceIsActive;
- (BSInvalidatable)watchdogMonitoringAssertion;
- (DBAnalytics)analytics;
- (DBDisplayManager)init;
- (DBIconBadgeController)iconBadgeController;
- (DBIconImageCache)iconImageCache;
- (DBNavigationStateProvider)navigationStateProvider;
- (DBProcessMonitor)processMonitor;
- (DBSessionController)sessionController;
- (DBThermalMonitor)thermalMonitor;
- (FBSDisplayLayoutPublisher)dashboardDisplayLayoutPublisher;
- (FBSceneManager)manager;
- (NSMutableDictionary)displayToEndpointInjector;
- (NSMutableDictionary)displayToEnvironmentMap;
- (NSMutableDictionary)displayToPresentationBinderMap;
- (NSMutableDictionary)displayToRootSceneMap;
- (NSMutableSet)navigationStateProviderRequesters;
- (NSMutableSet)pendingDisplays;
- (NSMutableSet)processMonitorRequesters;
- (OS_os_transaction)idleExitTransaction;
- (id)currentAnalytics;
- (id)environmentForDisplayIdentity:(id)a3;
- (void)_enableMapsProbabilisticGuardMalloc;
- (void)_handleConnectedDisplaysIfPossible;
- (void)_handleConnectedPassengerDisplayWithDisplayConfiguration:(id)a3 session:(id)a4;
- (void)_setNeedsNavigationStateProvider:(BOOL)a3 forDisplayIdentity:(id)a4;
- (void)_setNeedsTemplateProcessMonitor:(BOOL)a3 forDisplayIdentity:(id)a4;
- (void)_setPrimaryDisplayCornerMaskImageIfNecessary;
- (void)_updateNavigationStateProvider;
- (void)_updateSessionAssertionsIfNecessary;
- (void)_updateTemplateProcessMonitor;
- (void)activate;
- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4;
- (void)enumerateEnvironmentsUsingBlock:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)sceneManager:(id)a3 didAddScene:(id)a4;
- (void)sceneManager:(id)a3 scene:(id)a4 didReceiveActions:(id)a5;
- (void)sessionController:(id)a3 didConnectSession:(id)a4;
- (void)sessionServiceBecameActive:(id)a3;
- (void)sessionServiceBecameInactive:(id)a3;
- (void)setActivated:(BOOL)a3;
- (void)setAnalytics:(id)a3;
- (void)setDashboardDisplayLayoutPublisher:(id)a3;
- (void)setDisplayToEndpointInjector:(id)a3;
- (void)setDisplayToEnvironmentMap:(id)a3;
- (void)setDisplayToPresentationBinderMap:(id)a3;
- (void)setDisplayToRootSceneMap:(id)a3;
- (void)setIconBadgeController:(id)a3;
- (void)setIconImageCache:(id)a3;
- (void)setIdleExitTransaction:(id)a3;
- (void)setManager:(id)a3;
- (void)setNavigationStateProvider:(id)a3;
- (void)setNavigationStateProviderRequesters:(id)a3;
- (void)setPendingDisplays:(id)a3;
- (void)setProcessMonitor:(id)a3;
- (void)setProcessMonitorRequesters:(id)a3;
- (void)setSessionController:(id)a3;
- (void)setSessionServiceIsActive:(BOOL)a3;
- (void)setThermalMonitor:(id)a3;
- (void)setWatchdogMonitoringAssertion:(id)a3;
@end

@implementation DBDisplayManager

- (DBDisplayManager)init
{
  v28.receiver = self;
  v28.super_class = (Class)DBDisplayManager;
  v2 = [(DBDisplayManager *)&v28 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    pendingDisplays = v2->_pendingDisplays;
    v2->_pendingDisplays = v3;

    v5 = objc_alloc_init(DBIconBadgeController);
    iconBadgeController = v2->_iconBadgeController;
    v2->_iconBadgeController = v5;

    v7 = objc_alloc_init(DBSessionController);
    sessionController = v2->_sessionController;
    v2->_sessionController = v7;

    [(DBSessionController *)v2->_sessionController setDelegate:v2];
    v9 = objc_alloc_init(DBThermalMonitor);
    thermalMonitor = v2->_thermalMonitor;
    v2->_thermalMonitor = v9;

    uint64_t v11 = [MEMORY[0x263F3F4F0] sharedInstance];
    manager = v2->_manager;
    v2->_manager = (FBSceneManager *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    displayToEnvironmentMap = v2->_displayToEnvironmentMap;
    v2->_displayToEnvironmentMap = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    displayToPresentationBinderMap = v2->_displayToPresentationBinderMap;
    v2->_displayToPresentationBinderMap = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    displayToRootSceneMap = v2->_displayToRootSceneMap;
    v2->_displayToRootSceneMap = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    displayToEndpointInjector = v2->_displayToEndpointInjector;
    v2->_displayToEndpointInjector = (NSMutableDictionary *)v19;

    v21 = objc_alloc_init(DBIconImageCache);
    iconImageCache = v2->_iconImageCache;
    v2->_iconImageCache = v21;

    id v23 = +[DBApplicationController sharedInstance];
    [(FBSceneManager *)v2->_manager setDelegate:v2];
    [(FBSceneManager *)v2->_manager enumerateScenesWithBlock:&__block_literal_global_34];
    v24 = objc_opt_new();
    [v24 setDomainIdentifier:@"com.apple.CarPlay.non-launching"];
    [v24 setInstanceIdentifier:@"com.apple.CarPlayApp.Dashboard"];
    uint64_t v25 = [MEMORY[0x263F3F740] publisherWithConfiguration:v24];
    dashboardDisplayLayoutPublisher = v2->_dashboardDisplayLayoutPublisher;
    v2->_dashboardDisplayLayoutPublisher = (FBSDisplayLayoutPublisher *)v25;

    [(FBSDisplayLayoutPublisher *)v2->_dashboardDisplayLayoutPublisher activate];
  }
  return v2;
}

- (void)activate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![(DBDisplayManager *)self activated])
  {
    v3 = [MEMORY[0x263F3F430] sharedInstance];
    [v3 addObserver:self];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = objc_msgSend(v3, "connectedIdentities", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          v10 = [v3 configurationForIdentity:v9];
          if (v10) {
            [(DBDisplayManager *)self displayMonitor:v3 didConnectIdentity:v9 withConfiguration:v10];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    [(DBDisplayManager *)self setActivated:1];
  }
}

- (id)environmentForDisplayIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBDisplayManager *)self displayToEnvironmentMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)enumerateEnvironmentsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBDisplayManager *)self displayToEnvironmentMap];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__DBDisplayManager_enumerateEnvironmentsUsingBlock___block_invoke;
  v7[3] = &unk_2649B6330;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __52__DBDisplayManager_enumerateEnvironmentsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  int v9 = [v8 isCarDisplay];
  int v10 = [v8 isCarInstrumentsDisplay];
  long long v11 = DBLogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = NSStringFromBOOL();
    long long v13 = NSStringFromBOOL();
    int v15 = 138543874;
    id v16 = v7;
    __int16 v17 = 2114;
    v18 = v12;
    __int16 v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "didConnectIdentity:%{public}@, is car display: %{public}@, is cluster display: %{public}@", (uint8_t *)&v15, 0x20u);
  }
  if ((v10 | v9) == 1)
  {
    kdebug_trace();
    [(DBDisplayManager *)self _setNeedsNavigationStateProvider:1 forDisplayIdentity:v7];
    [(DBDisplayManager *)self _setNeedsTemplateProcessMonitor:1 forDisplayIdentity:v7];
    long long v14 = [(DBDisplayManager *)self pendingDisplays];
    [v14 addObject:v8];

    [(DBDisplayManager *)self _handleConnectedDisplaysIfPossible];
    [(DBDisplayManager *)self _updateSessionAssertionsIfNecessary];
  }
}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = DBLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "didUpdateIdentity:%{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = DBLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v5;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "willDisconnectIdentity:%{public}@", buf, 0xCu);
  }

  int v7 = [(DBDisplayManager *)self pendingDisplays];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__DBDisplayManager_displayMonitor_willDisconnectIdentity___block_invoke;
  v21[3] = &unk_2649B6358;
  id v8 = v5;
  id v22 = v8;
  uint64_t v9 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v21);

  if (v9)
  {
    int v10 = DBLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v9;
      _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Discarding pending display: %{public}@", buf, 0xCu);
    }

    long long v11 = [(DBDisplayManager *)self pendingDisplays];
    [v11 removeObject:v9];
  }
  long long v12 = [(DBDisplayManager *)self displayToRootSceneMap];
  long long v13 = [v12 objectForKeyedSubscript:v8];

  if (v13)
  {
    [v13 updateSettingsWithBlock:&__block_literal_global_152];
    long long v14 = [MEMORY[0x263F3F4F0] sharedInstance];
    int v15 = [v13 identifier];
    [v14 destroyScene:v15 withTransitionContext:0];

    id v16 = [(DBDisplayManager *)self displayToRootSceneMap];
    [v16 setObject:0 forKeyedSubscript:v8];
  }
  [(DBDisplayManager *)self _setNeedsNavigationStateProvider:0 forDisplayIdentity:v8];
  [(DBDisplayManager *)self _setNeedsTemplateProcessMonitor:0 forDisplayIdentity:v8];
  __int16 v17 = [(DBDisplayManager *)self sessionController];
  [v17 setNeedsLayerMetadataService:0 forDisplayIdentity:v8];

  v18 = [(DBDisplayManager *)self displayToEnvironmentMap];
  __int16 v19 = [v18 objectForKeyedSubscript:v8];
  [v19 invalidate];

  v20 = [(DBDisplayManager *)self displayToEnvironmentMap];
  [v20 setObject:0 forKeyedSubscript:v8];

  [(DBDisplayManager *)self _updateSessionAssertionsIfNecessary];
}

uint64_t __58__DBDisplayManager_displayMonitor_willDisconnectIdentity___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identity];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __58__DBDisplayManager_displayMonitor_willDisconnectIdentity___block_invoke_149(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

- (void)sceneManager:(id)a3 scene:(id)a4 didReceiveActions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = [(DBDisplayManager *)self displayToEnvironmentMap];
  long long v11 = [v9 settings];
  long long v12 = [v11 displayIdentity];
  long long v13 = [v14 objectForKeyedSubscript:v12];
  [v13 sceneManager:v10 scene:v9 didReceiveActions:v8];
}

- (void)sceneManager:(id)a3 didAddScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 workspaceIdentifier];
  int v9 = [v8 isEqualToString:@"com.apple.DashBoard.scene-workspace.root"];

  if (v9)
  {
    id v10 = [(DBDisplayManager *)self displayToPresentationBinderMap];
    long long v11 = [v7 settings];
    long long v12 = [v11 displayIdentity];
    long long v13 = [v10 objectForKey:v12];

    if (!v13)
    {
      id v14 = objc_alloc(MEMORY[0x263F82B18]);
      int v15 = [v7 settings];
      id v16 = [v15 displayConfiguration];
      __int16 v17 = (void *)[v14 initWithDisplayConfiguration:v16];

      [v17 setVisibilityIdentifier:@"com.apple.CarPlayApp"];
      v18 = [MEMORY[0x263F2BA00] defaultConfiguration];
      __int16 v19 = [MEMORY[0x263F3F790] serviceName];
      v20 = [v18 domainsContainingServiceIdentifier:v19];
      uint64_t v21 = [v20 anyObject];
      id v22 = [v21 identifier];

      id v23 = (void *)MEMORY[0x263F2B9C8];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __45__DBDisplayManager_sceneManager_didAddScene___block_invoke;
      v42[3] = &unk_2649B6380;
      id v43 = v17;
      id v44 = v22;
      id v41 = v22;
      id v24 = v17;
      uint64_t v25 = [v23 injectorWithConfigurator:v42];
      v26 = [(DBDisplayManager *)self displayToEndpointInjector];
      v27 = [v7 settings];
      objc_super v28 = [v27 displayIdentity];
      [v26 setObject:v25 forKey:v28];

      v29 = NSString;
      v30 = [v7 settings];
      v31 = [v30 displayConfiguration];
      v32 = [v31 identity];
      v33 = [v29 stringWithFormat:@"RootWindow-%@-%p", v32, self];

      long long v13 = (void *)[objc_alloc(MEMORY[0x263F82B20]) initWithIdentifier:v33 priority:0 appearanceStyle:0 rootWindow:v24];
      v34 = [(DBDisplayManager *)self displayToPresentationBinderMap];
      v35 = [v7 settings];
      v36 = [v35 displayIdentity];
      [v34 setObject:v13 forKeyedSubscript:v36];
    }
    [v13 addScene:v7];
    [v7 addObserver:self];
  }
  else
  {
    v37 = [(DBDisplayManager *)self displayToEnvironmentMap];
    v38 = [v7 settings];
    v39 = [v38 displayIdentity];
    v40 = [v37 objectForKeyedSubscript:v39];
    [v40 sceneManager:v6 didAddScene:v7];
  }
}

void __45__DBDisplayManager_sceneManager_didAddScene___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F64630];
  id v4 = a2;
  uint64_t v5 = getpid();
  id v6 = [*(id *)(a1 + 32) visibilityEnvironment];
  id v7 = [v3 targetWithPid:v5 environmentIdentifier:v6];
  [v4 setTarget:v7];

  [v4 setDomain:*(void *)(a1 + 40)];
  id v8 = [MEMORY[0x263F3F790] serviceName];
  [v4 setService:v8];
}

- (void)sceneDidInvalidate:(id)a3
{
  id v20 = a3;
  id v4 = [(DBDisplayManager *)self displayToPresentationBinderMap];
  uint64_t v5 = [v20 settings];
  id v6 = [v5 displayIdentity];
  id v7 = [v4 objectForKey:v6];

  [v7 removeScene:v20];
  id v8 = [v7 scenes];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    [v7 invalidate];
    id v10 = [(DBDisplayManager *)self displayToPresentationBinderMap];
    long long v11 = [v20 settings];
    long long v12 = [v11 displayIdentity];
    [v10 setObject:0 forKeyedSubscript:v12];
  }
  long long v13 = [(DBDisplayManager *)self displayToEndpointInjector];
  id v14 = [v20 settings];
  int v15 = [v14 displayIdentity];
  id v16 = [v13 objectForKey:v15];

  __int16 v17 = [(DBDisplayManager *)self displayToEndpointInjector];
  v18 = [v20 settings];
  __int16 v19 = [v18 displayIdentity];
  [v17 removeObjectForKey:v19];

  [v16 invalidate];
}

- (void)sessionServiceBecameActive:(id)a3
{
  [(DBDisplayManager *)self setSessionServiceIsActive:1];
  [(DBDisplayManager *)self _updateSessionAssertionsIfNecessary];
}

- (void)sessionServiceBecameInactive:(id)a3
{
  [(DBDisplayManager *)self setSessionServiceIsActive:0];
  [(DBDisplayManager *)self _updateSessionAssertionsIfNecessary];
}

- (void)sessionController:(id)a3 didConnectSession:(id)a4
{
  uint64_t v5 = +[DBApplicationController sharedInstance];
  [v5 sessionDidConnect];

  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableMapsPGM", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
  int v7 = keyExistsAndHasValidFormat;
  if (os_variant_has_internal_diagnostics() && v7 && AppBooleanValue) {
    [(DBDisplayManager *)self _enableMapsProbabilisticGuardMalloc];
  }
  [(DBDisplayManager *)self _handleConnectedDisplaysIfPossible];
}

- (void)_updateSessionAssertionsIfNecessary
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(DBDisplayManager *)self sessionServiceIsActive])
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = [(DBDisplayManager *)self displayToEnvironmentMap];
    BOOL v3 = [v4 count] != 0;
  }
  uint64_t v5 = DBLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromBOOL();
    int v18 = 138412290;
    __int16 v19 = v6;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Updating session assertions, should hold: %@", (uint8_t *)&v18, 0xCu);
  }
  int v7 = [(DBDisplayManager *)self idleExitTransaction];

  if (v3)
  {
    if (!v7)
    {
      id v8 = DBLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Taking idle-exit transaction for session", (uint8_t *)&v18, 2u);
      }

      uint64_t v9 = (void *)os_transaction_create();
      [(DBDisplayManager *)self setIdleExitTransaction:v9];
    }
    id v10 = [(DBDisplayManager *)self watchdogMonitoringAssertion];

    if (!v10)
    {
      long long v11 = DBLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Taking system shell watchdog monitoring assertion", (uint8_t *)&v18, 2u);
      }

      long long v12 = [MEMORY[0x263F3F510] sharedInstance];
      long long v13 = [v12 assertWatchdogEnabledForLimitedDurationForReason:@"CarPlaySession"];
      [(DBDisplayManager *)self setWatchdogMonitoringAssertion:v13];
    }
  }
  else
  {
    if (v7)
    {
      id v14 = DBLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "Releasing idle-exit transaction", (uint8_t *)&v18, 2u);
      }

      [(DBDisplayManager *)self setIdleExitTransaction:0];
    }
    int v15 = [(DBDisplayManager *)self watchdogMonitoringAssertion];

    if (v15)
    {
      id v16 = DBLogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_DEFAULT, "Releasing system shell watchding monitoring assertion", (uint8_t *)&v18, 2u);
      }

      __int16 v17 = [(DBDisplayManager *)self watchdogMonitoringAssertion];
      [v17 invalidate];

      [(DBDisplayManager *)self setWatchdogMonitoringAssertion:0];
    }
  }
}

- (void)_setPrimaryDisplayCornerMaskImageIfNecessary
{
  BOOL v3 = [(DBDisplayManager *)self sessionController];
  id v4 = [v3 currentSession];
  uint64_t v5 = [v4 configuration];
  id v6 = [v5 screens];
  int v7 = objc_msgSend(v6, "bs_firstObjectPassingTest:", &__block_literal_global_178);

  if ([v7 wantsCornerMasks])
  {
    id v8 = DBLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v17 = 0;
      _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Main screen is requesting corner masks.", v17, 2u);
    }

    uint64_t v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v9 addObserver:self forKeyPath:@"CARCornerRadius" options:1 context:0];
    id v10 = [v9 objectForKey:@"CARCornerRadius"];

    if (v10)
    {
      [v9 floatForKey:@"CARCornerRadius"];
      double v12 = v11;
    }
    else
    {
      double v12 = 13.0;
    }
    _CARGetMinimumScaleForScreenInfo();
    id v14 = DBAirPlayCornerMaskImageData(v12, v13);
    int v15 = [(DBDisplayManager *)self sessionController];
    id v16 = [v15 currentSession];
    [v16 setCornerMaskImageData:v14 forScreenInfo:v7];
  }
}

BOOL __64__DBDisplayManager__setPrimaryDisplayCornerMaskImageIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 screenType] == 0;
}

- (void)_handleConnectedDisplaysIfPossible
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = [(DBDisplayManager *)self pendingDisplays];
  id v4 = (void *)[v3 copy];

  if ([v4 count])
  {
    uint64_t v5 = [(DBDisplayManager *)self sessionController];
    id v6 = [v5 currentSession];

    int v7 = DBLogForCategory(0);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138543618;
        id v14 = v4;
        __int16 v15 = 2114;
        id v16 = v6;
        _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Handling connected displays: %{public}@ with session: %{public}@", buf, 0x16u);
      }

      uint64_t v9 = [(DBDisplayManager *)self pendingDisplays];
      [v9 removeAllObjects];

      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __54__DBDisplayManager__handleConnectedDisplaysIfPossible__block_invoke;
      v10[3] = &unk_2649B63F8;
      float v11 = v6;
      double v12 = self;
      [v4 enumerateObjectsUsingBlock:v10];
      int v7 = v11;
    }
    else if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Session not yet available", buf, 2u);
    }
  }
  else
  {
    id v6 = DBLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "No pending displays", buf, 2u);
    }
  }
}

void __54__DBDisplayManager__handleConnectedDisplaysIfPossible__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 identity];
  uint64_t v5 = [*(id *)(a1 + 32) configuration];
  id v6 = [v5 screens];
  v111[0] = MEMORY[0x263EF8330];
  v111[1] = 3221225472;
  v111[2] = __54__DBDisplayManager__handleConnectedDisplaysIfPossible__block_invoke_2;
  v111[3] = &unk_2649B63A8;
  id v7 = v3;
  uint64_t v8 = *(void *)(a1 + 40);
  id v112 = v7;
  uint64_t v113 = v8;
  id v9 = v4;
  id v114 = v9;
  [v6 enumerateObjectsUsingBlock:v111];

  if ([*(id *)(a1 + 40) _isPassengerDisplay:v7]
    && ([*(id *)(a1 + 40) sessionController],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 currentSupportedFeatures],
        v10,
        (v11 & 0x20) != 0))
  {
    v81 = DBLogForCategory(0x14uLL);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v82 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136446722;
      v116 = "-[DBDisplayManager _handleConnectedDisplaysIfPossible]_block_invoke";
      __int16 v117 = 2114;
      id v118 = v7;
      __int16 v119 = 2114;
      uint64_t v120 = v82;
      _os_log_impl(&dword_22D6F0000, v81, OS_LOG_TYPE_DEFAULT, "%{public}s: Passenger display feature is enabled. Showing passenger display for %{public}@. %{public}@.", buf, 0x20u);
    }

    [*(id *)(a1 + 40) _handleConnectedPassengerDisplayWithDisplayConfiguration:v7 session:*(void *)(a1 + 32)];
  }
  else if ([v7 isCarInstrumentsDisplay])
  {
    double v12 = [*(id *)(a1 + 40) displayToEnvironmentMap];
    float v13 = [v12 objectForKeyedSubscript:v9];

    if (!v13)
    {
      uint64_t v14 = [NSString stringWithFormat:@"DBInstrumentCluster-%@", v9];
      uint64_t v15 = [MEMORY[0x263F82480] specification];
      id v16 = [MEMORY[0x263F3F760] definition];
      uint64_t v17 = [MEMORY[0x263F3F7C8] identityForIdentifier:v14 workspaceIdentifier:@"com.apple.DashBoard.scene-workspace.root"];
      [v16 setIdentity:v17];

      int v18 = [MEMORY[0x263F3F7A8] localIdentity];
      [v16 setClientIdentity:v18];

      [v16 setSpecification:v15];
      v103 = (void *)v15;
      __int16 v19 = [MEMORY[0x263F3F768] parametersForSpecification:v15];
      v109[0] = MEMORY[0x263EF8330];
      v109[1] = 3221225472;
      v109[2] = __54__DBDisplayManager__handleConnectedDisplaysIfPossible__block_invoke_189;
      v109[3] = &unk_2649B63D0;
      id v20 = v7;
      id v110 = v20;
      [v19 updateSettingsWithBlock:v109];
      uint64_t v21 = [MEMORY[0x263F3F4F0] sharedInstance];
      v100 = v19;
      v101 = v16;
      v98 = [v21 createSceneWithDefinition:v16 initialParameters:v19];

      id v22 = (void *)MEMORY[0x263F82E90];
      id v23 = [MEMORY[0x263F3F438] sharedInstance];
      v105 = (void *)v14;
      id v24 = [v23 fbsSceneWithIdentifier:v14];
      v96 = [v22 _sceneForFBSScene:v24];

      v90 = [DBEnvironmentConfiguration alloc];
      uint64_t v25 = *(void **)(a1 + 40);
      uint64_t v92 = *(void *)(a1 + 32);
      uint64_t v88 = v25[11];
      v94 = [v25 sessionController];
      uint64_t v86 = [v94 currentSupportedFeatures];
      v26 = [*(id *)(a1 + 40) processMonitor];
      v27 = [*(id *)(a1 + 40) thermalMonitor];
      objc_super v28 = [*(id *)(a1 + 40) sessionController];
      [v28 currentVehicle];
      v30 = id v29 = v9;
      v31 = [*(id *)(a1 + 40) sessionController];
      v32 = [v31 themeController];
      v33 = [(DBEnvironmentConfiguration *)v90 initWithDisplayConfiguration:v20 layoutPublisher:0 iconBadgeController:v88 session:v92 supportedFeatures:v86 processMonitor:v26 thermalMonitor:v27 vehicle:v30 themeController:v32 navigationStateProvider:*(void *)(*(void *)(a1 + 40) + 128) analyticsProvider:*(void *)(a1 + 40)];

      id v9 = v29;
      v34 = [*(id *)(a1 + 40) sessionController];
      v35 = [v34 uisyncChannel];
      [(DBEnvironmentConfiguration *)v33 setUisyncChannel:v35];

      v36 = [*(id *)(a1 + 40) sessionController];
      v37 = [v36 layerMetadataService];
      [(DBEnvironmentConfiguration *)v33 setLayerMetadataService:v37];

      v38 = [[DBInstrumentCluster alloc] initWithWindowScene:v96 environmentConfiguration:v33];
      v39 = [*(id *)(a1 + 40) displayToEnvironmentMap];
      [v39 setObject:v38 forKeyedSubscript:v9];

      v40 = [*(id *)(a1 + 40) displayToRootSceneMap];
      [v40 setObject:v98 forKeyedSubscript:v9];

      [(DBInstrumentCluster *)v38 handleConnect];
      id v41 = [*(id *)(a1 + 40) sessionController];
      [v41 addSessionObserver:v33];

      v42 = [(DBInstrumentCluster *)v38 displayInfo];
      id v43 = [v42 identifier];
      LODWORD(v31) = [v43 isEqualToString:@"Cluster_Display"];

      if (v31)
      {
        id v44 = [*(id *)(a1 + 40) sessionController];
        v45 = [v44 clusterThemeService];
        [v45 setDelegate:v38];
      }
    }
  }
  else if ([v7 isCarDisplay])
  {
    v46 = [*(id *)(a1 + 40) displayToEnvironmentMap];
    v47 = [v46 objectForKeyedSubscript:v9];

    if (!v47)
    {
      HTBeginNonResponsiveTaskWithNameAndExpiration();
      v48 = DBLogForCategory(0xBuLL);
      if (os_signpost_enabled(v48))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22D6F0000, v48, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CarPlayReceivedMainDisplay", "", buf, 2u);
      }

      [*(id *)(a1 + 40) _setPrimaryDisplayCornerMaskImageIfNecessary];
      v49 = [*(id *)(a1 + 40) dashboardDisplayLayoutPublisher];
      v104 = [v49 transitionAssertionWithReason:@"Display Connection"];

      uint64_t v50 = DBDashboardRootSceneIdentifierForDisplayIdentity((uint64_t)v9);
      uint64_t v51 = [MEMORY[0x263F82480] specification];
      v52 = [MEMORY[0x263F3F760] definition];
      v53 = [MEMORY[0x263F3F7C8] identityForIdentifier:v50 workspaceIdentifier:@"com.apple.DashBoard.scene-workspace.root"];
      [v52 setIdentity:v53];

      v54 = [MEMORY[0x263F3F7A8] localIdentity];
      [v52 setClientIdentity:v54];

      [v52 setSpecification:v51];
      v99 = (void *)v51;
      v55 = [MEMORY[0x263F3F768] parametersForSpecification:v51];
      v107[0] = MEMORY[0x263EF8330];
      v107[1] = 3221225472;
      v107[2] = __54__DBDisplayManager__handleConnectedDisplaysIfPossible__block_invoke_199;
      v107[3] = &unk_2649B63D0;
      id v91 = v7;
      id v108 = v91;
      [v55 updateSettingsWithBlock:v107];
      v56 = [MEMORY[0x263F3F4F0] sharedInstance];
      v95 = v55;
      v97 = v52;
      v93 = [v56 createSceneWithDefinition:v52 initialParameters:v55];

      v57 = (void *)MEMORY[0x263F82E90];
      v58 = [MEMORY[0x263F3F438] sharedInstance];
      v102 = (void *)v50;
      v59 = [v58 fbsSceneWithIdentifier:v50];
      v89 = [v57 _sceneForFBSScene:v59];

      v60 = [DBEnvironmentConfiguration alloc];
      v85 = [*(id *)(a1 + 40) dashboardDisplayLayoutPublisher];
      v61 = *(void **)(a1 + 40);
      uint64_t v83 = v61[11];
      uint64_t v84 = *(void *)(a1 + 32);
      v87 = [v61 sessionController];
      uint64_t v62 = [v87 currentSupportedFeatures];
      [*(id *)(a1 + 40) processMonitor];
      v63 = id v106 = v9;
      v64 = [*(id *)(a1 + 40) thermalMonitor];
      v65 = [*(id *)(a1 + 40) sessionController];
      v66 = [v65 currentVehicle];
      v67 = [*(id *)(a1 + 40) sessionController];
      v68 = [v67 themeController];
      v69 = [(DBEnvironmentConfiguration *)v60 initWithDisplayConfiguration:v91 layoutPublisher:v85 iconBadgeController:v83 session:v84 supportedFeatures:v62 processMonitor:v63 thermalMonitor:v64 vehicle:v66 themeController:v68 navigationStateProvider:*(void *)(*(void *)(a1 + 40) + 128) analyticsProvider:*(void *)(a1 + 40)];

      id v9 = v106;
      v70 = [*(id *)(a1 + 40) iconImageCache];
      [(DBEnvironmentConfiguration *)v69 setIconImageCache:v70];

      v71 = [*(id *)(a1 + 40) sessionController];
      v72 = [v71 uisyncChannel];
      [(DBEnvironmentConfiguration *)v69 setUisyncChannel:v72];

      v73 = [[DBAnalytics alloc] initWithEnvironmentConfiguration:v69];
      uint64_t v74 = *(void *)(a1 + 40);
      v75 = *(void **)(v74 + 152);
      *(void *)(v74 + 152) = v73;

      v76 = [[DBDashboard alloc] initWithWindowScene:v89 environmentConfiguration:v69];
      v77 = [*(id *)(a1 + 40) displayToEnvironmentMap];
      [v77 setObject:v76 forKeyedSubscript:v106];

      v78 = [*(id *)(a1 + 40) displayToRootSceneMap];
      [v78 setObject:v93 forKeyedSubscript:v106];

      [(DBDashboard *)v76 handleConnect];
      v79 = [*(id *)(a1 + 40) sessionController];
      [v79 addSessionObserver:v69];

      HTEndNonResponsiveTask();
      v80 = DBLogForCategory(0xDuLL);
      if (os_signpost_enabled(v80))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22D6F0000, v80, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CarPlayReceivedMainDisplay", "", buf, 2u);
      }

      [v104 invalidate];
    }
  }
}

void __54__DBDisplayManager__handleConnectedDisplaysIfPossible__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 identifier];
  id v4 = [*(id *)(a1 + 32) hardwareIdentifier];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) sessionController];
    objc_msgSend(v6, "setNeedsLayerMetadataService:forDisplayIdentity:", objc_msgSend(v7, "supportsLayerTracking"), *(void *)(a1 + 48));
  }
}

void __54__DBDisplayManager__handleConnectedDisplaysIfPossible__block_invoke_189(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDisplayConfiguration:v3];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setForeground:1];
}

void __54__DBDisplayManager__handleConnectedDisplaysIfPossible__block_invoke_199(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDisplayConfiguration:v3];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setForeground:1];
}

- (void)_handleConnectedPassengerDisplayWithDisplayConfiguration:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 identity];
  id v9 = [(DBDisplayManager *)self displayToEnvironmentMap];
  id v10 = [v9 objectForKeyedSubscript:v8];

  if (!v10)
  {
    v45 = [NSString stringWithFormat:@"DBPassengerDisplay-%@", v8];
    uint64_t v11 = [MEMORY[0x263F82480] specification];
    double v12 = [MEMORY[0x263F3F760] definition];
    float v13 = [MEMORY[0x263F3F7C8] identityForIdentifier:v45 workspaceIdentifier:@"com.apple.DashBoard.scene-workspace.root"];
    [v12 setIdentity:v13];

    uint64_t v14 = [MEMORY[0x263F3F7A8] localIdentity];
    [v12 setClientIdentity:v14];

    id v43 = v12;
    id v44 = (void *)v11;
    [v12 setSpecification:v11];
    v42 = [MEMORY[0x263F3F768] parametersForSpecification:v11];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __85__DBDisplayManager__handleConnectedPassengerDisplayWithDisplayConfiguration_session___block_invoke;
    v48[3] = &unk_2649B4CF8;
    id v38 = v6;
    id v49 = v38;
    [v42 updateSettingsWithBlock:v48];
    uint64_t v15 = [MEMORY[0x263F3F4F0] sharedInstance];
    v40 = [v15 createSceneWithDefinition:v12 initialParameters:v42];

    id v16 = [MEMORY[0x263F3F438] sharedInstance];
    id v41 = [v16 fbsSceneForScene:v40];

    v39 = [MEMORY[0x263F82E90] _sceneForFBSScene:v41];
    v36 = [DBEnvironmentConfiguration alloc];
    v34 = [(DBDisplayManager *)self iconBadgeController];
    v37 = [(DBDisplayManager *)self sessionController];
    id v47 = v6;
    uint64_t v35 = [v37 currentSupportedFeatures];
    uint64_t v17 = [(DBDisplayManager *)self processMonitor];
    int v18 = [(DBDisplayManager *)self thermalMonitor];
    [(DBDisplayManager *)self sessionController];
    __int16 v19 = v46 = v8;
    id v20 = [v19 currentVehicle];
    [(DBDisplayManager *)self sessionController];
    v22 = id v21 = v7;
    id v23 = [v22 themeController];
    id v24 = [(DBDisplayManager *)self navigationStateProvider];
    uint64_t v25 = [(DBEnvironmentConfiguration *)v36 initWithDisplayConfiguration:v38 layoutPublisher:0 iconBadgeController:v34 session:v21 supportedFeatures:v35 processMonitor:v17 thermalMonitor:v18 vehicle:v20 themeController:v23 navigationStateProvider:v24 analyticsProvider:self];

    id v7 = v21;
    uint64_t v8 = v46;

    v26 = [(DBDisplayManager *)self sessionController];
    v27 = [v26 uisyncChannel];
    [(DBEnvironmentConfiguration *)v25 setUisyncChannel:v27];

    objc_super v28 = [(DBDisplayManager *)self sessionController];
    id v29 = [v28 layerMetadataService];
    [(DBEnvironmentConfiguration *)v25 setLayerMetadataService:v29];

    v30 = [[DBPassengerDisplay alloc] initWithWindowScene:v39 environmentConfiguration:v25];
    v31 = [(DBDisplayManager *)self displayToEnvironmentMap];
    [v31 setObject:v30 forKeyedSubscript:v46];

    v32 = [(DBDisplayManager *)self displayToRootSceneMap];
    [v32 setObject:v40 forKeyedSubscript:v46];

    v33 = [(DBDisplayManager *)self sessionController];
    [v33 addSessionObserver:v25];

    id v6 = v47;
  }
}

void __85__DBDisplayManager__handleConnectedPassengerDisplayWithDisplayConfiguration_session___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDisplayConfiguration:v3];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setForeground:1];
}

- (BOOL)_isPassengerDisplay:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(DBDisplayManager *)self sessionController];
  id v6 = [v5 currentSession];

  id v7 = [v6 configuration];
  uint64_t v8 = [v7 screens];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __40__DBDisplayManager__isPassengerDisplay___block_invoke;
  v16[3] = &unk_2649B3F28;
  id v9 = v4;
  id v17 = v9;
  id v10 = objc_msgSend(v8, "bs_firstObjectPassingTest:", v16);

  uint64_t v11 = [v10 physicalDisplay];
  double v12 = DBLogForCategory(0x14uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    float v13 = [v9 hardwareIdentifier];
    *(_DWORD *)buf = 136446978;
    __int16 v19 = "-[DBDisplayManager _isPassengerDisplay:]";
    __int16 v20 = 2114;
    id v21 = v6;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2114;
    uint64_t v25 = v11;
    _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: session = %{public}@. hardwareID =  = %{public}@. passengerDisplayInfo = %{public}@", buf, 0x2Au);
  }
  char v14 = [v11 supportsAdditionalContent];

  return v14;
}

uint64_t __40__DBDisplayManager__isPassengerDisplay___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) hardwareIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)_setNeedsNavigationStateProvider:(BOOL)a3 forDisplayIdentity:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(DBDisplayManager *)self navigationStateProviderRequesters];
  uint64_t v8 = v7;
  if (v4)
  {

    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(DBDisplayManager *)self setNavigationStateProviderRequesters:v9];
    }
    uint64_t v8 = [(DBDisplayManager *)self navigationStateProviderRequesters];
    [v8 addObject:v6];
  }
  else
  {
    [v7 removeObject:v6];
  }

  [(DBDisplayManager *)self _updateNavigationStateProvider];
}

- (void)_updateNavigationStateProvider
{
  uint64_t v3 = [(DBDisplayManager *)self navigationStateProviderRequesters];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    if (!self->_navigationStateProvider)
    {
      id v7 = objc_alloc_init(DBNavigationStateProvider);
      navigationStateProvider = self->_navigationStateProvider;
      self->_navigationStateProvider = v7;

      id v9 = self->_navigationStateProvider;
      [(DBNavigationStateProvider *)v9 setInfoProvider:self];
    }
  }
  else
  {
    uint64_t v5 = [(DBDisplayManager *)self navigationStateProvider];
    [v5 invalidate];

    id v6 = self->_navigationStateProvider;
    self->_navigationStateProvider = 0;
  }
}

- (void)_enableMapsProbabilisticGuardMalloc
{
  v2 = DBLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "[MapsPGM] Maps PGM requested!", buf, 2u);
  }

  uint64_t v3 = +[DBApplicationController sharedInstance];
  uint64_t v4 = [v3 mapsApplication];

  uint64_t v5 = (void *)MEMORY[0x263F64598];
  id v6 = [v4 info];
  id v7 = [v6 applicationIdentity];
  uint64_t v8 = [v5 identityForLSApplicationIdentity:v7];

  id v9 = (void *)MEMORY[0x263F64570];
  id v10 = [MEMORY[0x263F645D8] predicateMatchingIdentity:v8];
  uint64_t v11 = [v9 handleForPredicate:v10 error:0];

  if (v11)
  {
    double v12 = [MEMORY[0x263F3F460] sharedInstance];
    [v11 auditToken];
    id v13 = (id)[v12 registerProcessForAuditToken:v26];
  }
  char v14 = [MEMORY[0x263F3F460] sharedInstance];
  uint64_t v15 = [v14 processForIdentity:v8];
  uint64_t v16 = objc_opt_class();
  id v17 = v15;
  if (v16)
  {
    if (objc_opt_isKindOfClass()) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
  }
  else
  {
    int v18 = 0;
  }
  id v19 = v18;

  id v20 = objc_alloc_init(MEMORY[0x263F3F448]);
  [v20 setIdentity:v8];
  [v20 setLaunchIntent:2];
  [v20 setEnvironment:&unk_26E17F240];
  id v21 = DBLogForCategory(0);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v21, OS_LOG_TYPE_DEFAULT, "[MapsPGM] Maps process is already running. Terminating...", buf, 2u);
    }

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __55__DBDisplayManager__enableMapsProbabilisticGuardMalloc__block_invoke;
    v24[3] = &unk_2649B3FA8;
    id v25 = v20;
    [v19 killForReason:5 andReport:0 withDescription:@"Enabling PGM" completion:v24];
    id v23 = v25;
  }
  else
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v21, OS_LOG_TYPE_DEFAULT, "[MapsPGM] Requesting process launch of Maps with PGM environment variables", buf, 2u);
    }

    id v23 = [MEMORY[0x263F3F460] sharedInstance];
    [v23 launchProcessWithContext:v20];
  }
}

void __55__DBDisplayManager__enableMapsProbabilisticGuardMalloc__block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = DBLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"failed";
    if (a2) {
      uint64_t v5 = @"succeeded";
    }
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "[MapsPGM] Maps termination %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = DBLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "[MapsPGM] Requesting process launch of Maps with PGM environment variables", (uint8_t *)&v8, 2u);
  }

  id v7 = [MEMORY[0x263F3F460] sharedInstance];
  [v7 launchProcessWithContext:*(void *)(a1 + 32)];
}

- (BOOL)bundleIdentifierSupportsDashboard:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[DBApplicationController sharedInstance];
  uint64_t v5 = [v4 applicationWithBundleIdentifier:v3];

  LOBYTE(v3) = [v5 supportsDashboardNavigation];
  return (char)v3;
}

- (BOOL)bundleIdentifierSupportsInstrumentCluster:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[DBApplicationController sharedInstance];
  uint64_t v5 = [v4 applicationWithBundleIdentifier:v3];

  LOBYTE(v3) = [v5 supportsInstrumentClusterNavigation];
  return (char)v3;
}

- (BOOL)bundleIdentifierIsCertificationApp:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[DBApplicationController sharedInstance];
  uint64_t v5 = [v4 applicationWithBundleIdentifier:v3];

  LOBYTE(v3) = [v5 isCertificationApp];
  return (char)v3;
}

- (void)_setNeedsTemplateProcessMonitor:(BOOL)a3 forDisplayIdentity:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(DBDisplayManager *)self processMonitorRequesters];
  int v8 = v7;
  if (v4)
  {

    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(DBDisplayManager *)self setProcessMonitorRequesters:v9];
    }
    int v8 = [(DBDisplayManager *)self processMonitorRequesters];
    [v8 addObject:v6];
  }
  else
  {
    [v7 removeObject:v6];
  }

  [(DBDisplayManager *)self _updateTemplateProcessMonitor];
}

- (void)_updateTemplateProcessMonitor
{
  id v3 = [(DBDisplayManager *)self processMonitorRequesters];
  uint64_t v4 = [v3 count];

  processMonitor = self->_processMonitor;
  if (v4)
  {
    if (processMonitor) {
      return;
    }
    id v6 = objc_alloc_init(DBProcessMonitor);
  }
  else
  {
    [(DBProcessMonitor *)processMonitor invalidate];
    id v6 = 0;
  }
  id v7 = self->_processMonitor;
  self->_processMonitor = v6;
  MEMORY[0x270F9A758](v6, v7);
}

- (id)currentAnalytics
{
  return self->_analytics;
}

- (DBIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void)setIconImageCache:(id)a3
{
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (BOOL)sessionServiceIsActive
{
  return self->_sessionServiceIsActive;
}

- (void)setSessionServiceIsActive:(BOOL)a3
{
  self->_sessionServiceIsActive = a3;
}

- (OS_os_transaction)idleExitTransaction
{
  return self->_idleExitTransaction;
}

- (void)setIdleExitTransaction:(id)a3
{
}

- (BSInvalidatable)watchdogMonitoringAssertion
{
  return self->_watchdogMonitoringAssertion;
}

- (void)setWatchdogMonitoringAssertion:(id)a3
{
}

- (FBSceneManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (NSMutableDictionary)displayToEnvironmentMap
{
  return self->_displayToEnvironmentMap;
}

- (void)setDisplayToEnvironmentMap:(id)a3
{
}

- (NSMutableDictionary)displayToPresentationBinderMap
{
  return self->_displayToPresentationBinderMap;
}

- (void)setDisplayToPresentationBinderMap:(id)a3
{
}

- (NSMutableDictionary)displayToRootSceneMap
{
  return self->_displayToRootSceneMap;
}

- (void)setDisplayToRootSceneMap:(id)a3
{
}

- (NSMutableDictionary)displayToEndpointInjector
{
  return self->_displayToEndpointInjector;
}

- (void)setDisplayToEndpointInjector:(id)a3
{
}

- (FBSDisplayLayoutPublisher)dashboardDisplayLayoutPublisher
{
  return self->_dashboardDisplayLayoutPublisher;
}

- (void)setDashboardDisplayLayoutPublisher:(id)a3
{
}

- (DBIconBadgeController)iconBadgeController
{
  return self->_iconBadgeController;
}

- (void)setIconBadgeController:(id)a3
{
}

- (DBSessionController)sessionController
{
  return self->_sessionController;
}

- (void)setSessionController:(id)a3
{
}

- (DBThermalMonitor)thermalMonitor
{
  return self->_thermalMonitor;
}

- (void)setThermalMonitor:(id)a3
{
}

- (NSMutableSet)pendingDisplays
{
  return self->_pendingDisplays;
}

- (void)setPendingDisplays:(id)a3
{
}

- (NSMutableSet)navigationStateProviderRequesters
{
  return self->_navigationStateProviderRequesters;
}

- (void)setNavigationStateProviderRequesters:(id)a3
{
}

- (DBNavigationStateProvider)navigationStateProvider
{
  return self->_navigationStateProvider;
}

- (void)setNavigationStateProvider:(id)a3
{
}

- (NSMutableSet)processMonitorRequesters
{
  return self->_processMonitorRequesters;
}

- (void)setProcessMonitorRequesters:(id)a3
{
}

- (DBProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (void)setProcessMonitor:(id)a3
{
}

- (DBAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_processMonitorRequesters, 0);
  objc_storeStrong((id *)&self->_navigationStateProvider, 0);
  objc_storeStrong((id *)&self->_navigationStateProviderRequesters, 0);
  objc_storeStrong((id *)&self->_pendingDisplays, 0);
  objc_storeStrong((id *)&self->_thermalMonitor, 0);
  objc_storeStrong((id *)&self->_sessionController, 0);
  objc_storeStrong((id *)&self->_iconBadgeController, 0);
  objc_storeStrong((id *)&self->_dashboardDisplayLayoutPublisher, 0);
  objc_storeStrong((id *)&self->_displayToEndpointInjector, 0);
  objc_storeStrong((id *)&self->_displayToRootSceneMap, 0);
  objc_storeStrong((id *)&self->_displayToPresentationBinderMap, 0);
  objc_storeStrong((id *)&self->_displayToEnvironmentMap, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_watchdogMonitoringAssertion, 0);
  objc_storeStrong((id *)&self->_idleExitTransaction, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
}

@end