@interface CPNavigationManager
- (BOOL)ownershipRequested;
- (BOOL)ownsNavigation;
- (BOOL)supportsAccNav;
- (CPElectricVehicleWaypoint)chargePrecondition;
- (CPNavigationManager)initWithIdentifier:(id)a3 delegate:(id)a4;
- (CPNavigationManagerDelegate)delegate;
- (CPRouteGuidance)routeGuidance;
- (CRAccNavInfoProviding)routeGuidanceProviding;
- (CRNavigationService)navigationService;
- (NSArray)laneGuidances;
- (NSArray)maneuvers;
- (NSMutableDictionary)accNavControllersIndexed;
- (NSMutableDictionary)laneGuidanceIndexed;
- (NSMutableDictionary)maneuversIndexed;
- (NSString)bundleName;
- (NSString)identifier;
- (NSString)lastNavigatingBundleIdentifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)connectionQueue;
- (double)_connectionRetryDelay;
- (id)_createRouteGuidanceObject;
- (signed)destinationTimeZoneOffsetMinutes;
- (unint64_t)owner;
- (unsigned)guidanceState;
- (void)_enumerateNavControllersWithBlock:(id)a3;
- (void)_handleConnectionReset;
- (void)_resendInfo;
- (void)_resetRouteGuidanceIsRequired:(BOOL)a3;
- (void)_setupConnection;
- (void)_startNavigationWithRouteInfo:(id)a3 originalState:(unsigned __int8)a4;
- (void)activeNavigationIdentifiersChangedTo:(id)a3;
- (void)addLaneGuidances:(id)a3;
- (void)addManeuvers:(id)a3;
- (void)cancelRerouting;
- (void)dealloc;
- (void)didUpdateActiveComponents:(id)a3;
- (void)invalidate;
- (void)modifyRouteGuidance:(id)a3;
- (void)navigationOwnershipChangedTo:(unint64_t)a3;
- (void)releaseNavigationOwnership;
- (void)requestNavigationOwnership;
- (void)resetRouteGuidance;
- (void)routeChangedWithReason:(unsigned __int8)a3 routeInfo:(id)a4;
- (void)sendInfo:(id)a3 toComponentUID:(id)a4;
- (void)setBundleName:(id)a3;
- (void)setChargePrecondition:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationTimeZoneOffsetMinutes:(signed __int16)a3;
- (void)setIdentifier:(id)a3;
- (void)setLaneGuidances:(id)a3;
- (void)setLastNavigatingBundleIdentifier:(id)a3;
- (void)setManeuvers:(id)a3;
- (void)setOwner:(unint64_t)a3;
- (void)setOwnershipRequested:(BOOL)a3;
- (void)setRouteGuidance:(id)a3;
- (void)setSupportsAccNav:(BOOL)a3;
- (void)startNavigationWithRouteInfo:(id)a3;
- (void)startRerouting;
@end

@implementation CPNavigationManager

uint64_t __51__CPNavigationManager_initWithIdentifier_delegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupConnection];
}

- (void)setSupportsAccNav:(BOOL)a3
{
  self->_supportsAccNav = a3;
}

void __39__CPNavigationManager__setupConnection__block_invoke_112(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "inital fetch of navigationIdentifiers", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained activeNavigationIdentifiersChangedTo:v3];
}

- (void)activeNavigationIdentifiersChangedTo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__CPNavigationManager_activeNavigationIdentifiersChangedTo___block_invoke;
  v6[3] = &unk_264309F38;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

- (void)_setupConnection
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.carkit.navigation.service" options:4096];
  id v4 = CRNavigationClientInterface();
  [v3 setExportedInterface:v4];

  [v3 setExportedObject:self];
  id v5 = CRNavigationServiceInterface();
  [v3 setRemoteObjectInterface:v5];

  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39__CPNavigationManager__setupConnection__block_invoke;
  v16[3] = &unk_264309E98;
  objc_copyWeak(&v17, &location);
  [v3 setInterruptionHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__CPNavigationManager__setupConnection__block_invoke_2;
  v14[3] = &unk_264309E98;
  objc_copyWeak(&v15, &location);
  [v3 setInvalidationHandler:v14];
  v6 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v3;
    _os_log_impl(&dword_2181A5000, v6, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit navigation service %{public}@.", buf, 0xCu);
  }

  [v3 resume];
  [(CPNavigationManager *)self setConnection:v3];
  id v7 = [(CPNavigationManager *)self navigationService];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__CPNavigationManager__setupConnection__block_invoke_110;
  v12[3] = &unk_264309EC0;
  objc_copyWeak(&v13, &location);
  [v7 fetchNavigationOwnerWithReply:v12];

  v8 = [(CPNavigationManager *)self navigationService];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__CPNavigationManager__setupConnection__block_invoke_112;
  v10[3] = &unk_264309EE8;
  objc_copyWeak(&v11, &location);
  [v8 fetchNavigationIdentifiersWithReply:v10];

  v9 = [(CPNavigationManager *)self navigationService];
  [v9 beginObserving];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (CRNavigationService)navigationService
{
  v2 = [(CPNavigationManager *)self connection];
  id v3 = [v2 remoteObjectProxy];

  return (CRNavigationService *)v3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

void __39__CPNavigationManager__setupConnection__block_invoke_110(uint64_t a1, uint64_t a2)
{
  id v4 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "inital fetch of owner", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained navigationOwnershipChangedTo:a2];
}

- (void)navigationOwnershipChangedTo:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"None";
    if (a3 == 1) {
      v6 = @"iOS";
    }
    if (a3 == 2) {
      v6 = @"Car";
    }
    id v7 = v6;
    v8 = [(CPNavigationManager *)self delegate];
    *(_DWORD *)buf = 138543618;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "Dispatching navigationOwnershipChangedTo: %{public}@ delegate=%@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__CPNavigationManager_navigationOwnershipChangedTo___block_invoke;
  v9[3] = &unk_264309F10;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __52__CPNavigationManager_navigationOwnershipChangedTo___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = @"None";
    if (v3 == 1) {
      id v4 = @"iOS";
    }
    if (v3 == 2) {
      id v5 = @"Car";
    }
    else {
      id v5 = v4;
    }
    v6 = v5;
    id v7 = [*(id *)(a1 + 32) delegate];
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2112;
    __int16 v12 = v7;
    _os_log_impl(&dword_2181A5000, v2, OS_LOG_TYPE_DEFAULT, "Updating navigationOwnershipChangedTo: %{public}@ delegate=%@", (uint8_t *)&v9, 0x16u);
  }
  return [*(id *)(a1 + 32) setOwner:*(void *)(a1 + 40)];
}

- (CPNavigationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPNavigationManagerDelegate *)WeakRetained;
}

- (void)setOwner:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_owner != a3)
  {
    id v5 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t owner = self->_owner;
      if (owner == 1) {
        id v7 = @"iOS";
      }
      else {
        id v7 = @"None";
      }
      if (owner == 2) {
        v8 = @"Car";
      }
      else {
        v8 = v7;
      }
      int v9 = v8;
      if (a3 == 1) {
        v10 = @"iOS";
      }
      else {
        v10 = @"None";
      }
      if (a3 == 2) {
        v10 = @"Car";
      }
      __int16 v11 = v10;
      int v13 = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "Navigation owner changed from %{public}@ to %{public}@", (uint8_t *)&v13, 0x16u);
    }
    self->_unint64_t owner = a3;
    __int16 v12 = [(CPNavigationManager *)self delegate];
    [v12 navigationOwnershipChangedToOwner:a3];

    [(CPNavigationManager *)self _resendInfo];
  }
}

void __60__CPNavigationManager_activeNavigationIdentifiersChangedTo___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2181A5000, v2, OS_LOG_TYPE_DEFAULT, "activeNavigationIdentifiers=%{public}@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) lastObject];
  [*(id *)(a1 + 40) setLastNavigatingBundleIdentifier:v4];
}

- (void)setLastNavigatingBundleIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(NSString *)self->_lastNavigatingBundleIdentifier isEqualToString:v5])
  {
    uint64_t v6 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      lastNavigatingBundleIdentifier = self->_lastNavigatingBundleIdentifier;
      int v8 = 138543618;
      int v9 = lastNavigatingBundleIdentifier;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_2181A5000, v6, OS_LOG_TYPE_DEFAULT, "updating lastNavigatingBundleIdentifier from %{public}@ to %{public}@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)&self->_lastNavigatingBundleIdentifier, a3);
    [(CPNavigationManager *)self _resendInfo];
  }
}

- (CPNavigationManager)initWithIdentifier:(id)a3 delegate:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CPNavigationManager;
  int v8 = [(CPNavigationManager *)&v37 init];
  if (v8)
  {
    int v9 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v39 = v6;
      __int16 v40 = 2112;
      id v41 = v7;
      _os_log_impl(&dword_2181A5000, v9, OS_LOG_TYPE_DEFAULT, "init! identifier=%{public}@ delegate=%@", buf, 0x16u);
    }

    uint64_t v10 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v10;

    objc_storeWeak((id *)&v8->_delegate, v7);
    v8->_ownershipRequested = 0;
    if ([v6 isEqualToString:@"com.apple.Maps"])
    {
      uint64_t v12 = CPLocalizedStringForKey(@"APPLE_MAPS");
      bundleName = v8->_bundleName;
      v8->_bundleName = (NSString *)v12;
LABEL_19:

LABEL_20:
      uint64_t v23 = objc_opt_new();
      accNavControllersIndexed = v8->_accNavControllersIndexed;
      v8->_accNavControllersIndexed = (NSMutableDictionary *)v23;

      uint64_t v25 = objc_opt_new();
      maneuversIndexed = v8->_maneuversIndexed;
      v8->_maneuversIndexed = (NSMutableDictionary *)v25;

      uint64_t v27 = objc_opt_new();
      laneGuidanceIndexed = v8->_laneGuidanceIndexed;
      v8->_laneGuidanceIndexed = (NSMutableDictionary *)v27;

      v29 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
      dispatch_queue_t v30 = dispatch_queue_create("com.apple.carkit.navigation.xpcConnection", v29);
      connectionQueue = v8->_connectionQueue;
      v8->_connectionQueue = (OS_dispatch_queue *)v30;

      v32 = [(CPNavigationManager *)v8 connectionQueue];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __51__CPNavigationManager_initWithIdentifier_delegate___block_invoke;
      v34[3] = &unk_264309D80;
      v35 = v8;
      dispatch_sync(v32, v34);

      goto LABEL_21;
    }
    if (!v6 || ![v6 length]) {
      goto LABEL_20;
    }
    id v36 = 0;
    uint64_t v14 = [MEMORY[0x263F01878] bundleRecordWithApplicationIdentifier:v6 error:&v36];
    bundleName = (NSString *)v36;
    objc_opt_class();
    __int16 v15 = v14;
    if (objc_opt_isKindOfClass())
    {
      if (v15)
      {
        v16 = [v15 localizedNameWithContext:@"Car"];
        uint64_t v17 = v16;
        if (v16)
        {
          v18 = v16;
        }
        else
        {
          v18 = [v15 localizedName];
        }
        v22 = v8->_bundleName;
        v8->_bundleName = v18;

        v20 = v15;
        goto LABEL_18;
      }
    }
    else
    {

      if (v15)
      {
        uint64_t v19 = [v15 localizedName];
        v20 = v8->_bundleName;
        v8->_bundleName = (NSString *)v19;
LABEL_18:

        goto LABEL_19;
      }
    }
    v20 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [(NSString *)bundleName description];
      *(_DWORD *)buf = 138412290;
      id v39 = v21;
      _os_log_impl(&dword_2181A5000, v20, OS_LOG_TYPE_DEFAULT, "Unable to retrieve app record: %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
LABEL_21:

  return v8;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)_resendInfo
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(CPNavigationManager *)self ownsNavigation]
    && [(CPNavigationManager *)self supportsAccNav])
  {
    uint64_t v3 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_2181A5000, v3, OS_LOG_TYPE_DEFAULT, "resending Info", (uint8_t *)&v11, 2u);
    }

    [(CPNavigationManager *)self _enumerateNavControllersWithBlock:&__block_literal_global_2];
  }
  else
  {
    id v4 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = @"YES";
      if ([(CPNavigationManager *)self ownsNavigation]) {
        id v6 = @"YES";
      }
      else {
        id v6 = @"NO";
      }
      if (![(CPNavigationManager *)self supportsAccNav]) {
        id v5 = @"NO";
      }
      unint64_t v7 = [(CPNavigationManager *)self owner];
      int v8 = @"None";
      if (v7 == 1) {
        int v8 = @"iOS";
      }
      if (v7 == 2) {
        int v8 = @"Car";
      }
      int v9 = v8;
      uint64_t v10 = [(CPNavigationManager *)self lastNavigatingBundleIdentifier];
      int v11 = 138413058;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      v16 = v9;
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "resending Info failed ownsNavigation=%@ supportsAccNav=%@ owner=%@ lastNavigatingBundleIdentifier=%@", (uint8_t *)&v11, 0x2Au);
    }
  }
}

- (BOOL)ownsNavigation
{
  if ([(CPNavigationManager *)self owner] != 1) {
    return 0;
  }
  uint64_t v3 = [(CPNavigationManager *)self lastNavigatingBundleIdentifier];
  id v4 = [(CPNavigationManager *)self identifier];
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (unint64_t)owner
{
  return self->_owner;
}

- (BOOL)supportsAccNav
{
  return self->_supportsAccNav;
}

- (NSString)lastNavigatingBundleIdentifier
{
  return self->_lastNavigatingBundleIdentifier;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CPNavigationManager;
  [(CPNavigationManager *)&v2 dealloc];
}

uint64_t __34__CPNavigationManager__resendInfo__block_invoke(uint64_t a1, void *a2)
{
  return [a2 resendInfo];
}

- (void)invalidate
{
  uint64_t v3 = [(CPNavigationManager *)self connection];
  [v3 invalidate];

  [(CPNavigationManager *)self setConnection:0];
}

- (void)requestNavigationOwnership
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CPNavigationManager *)self identifier];
    BOOL v5 = [(CPNavigationManager *)self supportsAccNav];
    id v6 = @"NO";
    if (v5) {
      id v6 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    int v11 = v4;
    __int16 v12 = 2112;
    __int16 v13 = v6;
    _os_log_impl(&dword_2181A5000, v3, OS_LOG_TYPE_DEFAULT, "requestNavigationOwnership for %@ supporting AccNav %@", buf, 0x16u);
  }
  unint64_t v7 = [(CPNavigationManager *)self navigationService];
  int v8 = [(CPNavigationManager *)self identifier];
  objc_msgSend(v7, "addNavigationOwnerWithIdentifier:supportsAccNav:", v8, -[CPNavigationManager supportsAccNav](self, "supportsAccNav"));

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CPNavigationManager_requestNavigationOwnership__block_invoke;
  block[3] = &unk_264309D80;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __49__CPNavigationManager_requestNavigationOwnership__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOwnershipRequested:1];
}

- (void)releaseNavigationOwnership
{
  uint64_t v3 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2181A5000, v3, OS_LOG_TYPE_DEFAULT, "releaseNavigationOwnership", buf, 2u);
  }

  id v4 = [(CPNavigationManager *)self navigationService];
  BOOL v5 = [(CPNavigationManager *)self identifier];
  [v4 removeNavigationOwnerWithIdentifier:v5];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CPNavigationManager_releaseNavigationOwnership__block_invoke;
  block[3] = &unk_264309D80;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __49__CPNavigationManager_releaseNavigationOwnership__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOwnershipRequested:0];
  id v2 = [*(id *)(a1 + 32) accNavControllersIndexed];
  [v2 removeAllObjects];
}

- (id)_createRouteGuidanceObject
{
  uint64_t v3 = objc_alloc_init(CPRouteGuidance);
  id v4 = [(CPNavigationManager *)self bundleName];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [(CPNavigationManager *)self bundleName];
    [(CPRouteGuidance *)v3 setSourceName:v6];
  }
  [(CPRouteGuidance *)v3 setBeingShownInApp:1];
  [(CPRouteGuidance *)v3 setSourceSupportsRouteGuidance:[(CPNavigationManager *)self supportsAccNav]];
  if ([(CPNavigationManager *)self supportsAccNav]) {
    [(CPRouteGuidance *)v3 setDestinationTimeZoneOffsetMinutes:[(CPNavigationManager *)self destinationTimeZoneOffsetMinutes]];
  }

  return v3;
}

- (void)_resetRouteGuidanceIsRequired:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    unint64_t v7 = [(CPNavigationManager *)self routeGuidance];
    int v8 = NSStringFromCPGuidanceState([v7 guidanceState]);
    int v14 = 138543618;
    __int16 v15 = v6;
    __int16 v16 = 2114;
    __int16 v17 = v8;
    _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "Resetting RouteGuidance. required=%{public}@ guidanceState=%{public}@", (uint8_t *)&v14, 0x16u);
  }
  int v9 = [(CPNavigationManager *)self routeGuidance];
  int v10 = [v9 guidanceState];

  if (v10 || v3)
  {
    int v11 = [(CPNavigationManager *)self _createRouteGuidanceObject];
    [(CPNavigationManager *)self setRouteGuidance:v11];

    __int16 v12 = [(CPNavigationManager *)self maneuversIndexed];
    [v12 removeAllObjects];

    __int16 v13 = [(CPNavigationManager *)self laneGuidanceIndexed];
    [v13 removeAllObjects];

    [(CPNavigationManager *)self _enumerateNavControllersWithBlock:&__block_literal_global_81];
  }
}

uint64_t __53__CPNavigationManager__resetRouteGuidanceIsRequired___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reset];
}

- (void)_enumerateNavControllersWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(CPNavigationManager *)self accNavControllersIndexed];
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (unsigned)guidanceState
{
  id v2 = [(CPNavigationManager *)self routeGuidance];
  unsigned __int8 v3 = [v2 guidanceState];

  return v3;
}

- (void)resetRouteGuidance
{
}

- (void)modifyRouteGuidance:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  if ([(CPNavigationManager *)self supportsAccNav])
  {
    id v4 = [(CPNavigationManager *)self routeGuidance];
    uint64_t v5 = (void *)[v4 copy];

    if (!v5)
    {
      uint64_t v5 = [(CPNavigationManager *)self _createRouteGuidanceObject];
    }
    v6[2](v6, v5);
    [(CPNavigationManager *)self setRouteGuidance:v5];
  }
}

- (void)startNavigationWithRouteInfo:(id)a3
{
  id v4 = a3;
  if ([(CPNavigationManager *)self supportsAccNav])
  {
    uint64_t v5 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "startNavigationWithRouteInfo", v9, 2u);
    }

    id v6 = [v4 routeGuidance];
    uint64_t v7 = [v6 guidanceState];

    if (v7 != 1 && v7 != 6)
    {
      uint64_t v8 = CarPlayFrameworkACCNavLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[CPNavigationManager startNavigationWithRouteInfo:](v7, v8);
      }

      uint64_t v7 = 1;
    }
    [(CPNavigationManager *)self _startNavigationWithRouteInfo:v4 originalState:v7];
  }
}

- (void)_startNavigationWithRouteInfo:(id)a3 originalState:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromCPGuidanceState(v4);
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_2181A5000, v7, OS_LOG_TYPE_DEFAULT, "_startNavigationWithRouteInfo:originalState: %{public}@", buf, 0xCu);
  }
  [(CPNavigationManager *)self resetRouteGuidance];
  uint64_t v9 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2181A5000, v9, OS_LOG_TYPE_DEFAULT, "startNavigation: route reset", buf, 2u);
  }

  uint64_t v10 = [v6 routeGuidance];
  [v10 setGuidanceState:3];
  long long v11 = [v6 maneuvers];
  objc_msgSend(v10, "setTotalManeuverCount:", (unsigned __int16)objc_msgSend(v11, "count"));

  long long v12 = [v6 laneGuidances];
  objc_msgSend(v10, "setTotalLaneGuidanceCount:", (unsigned __int16)objc_msgSend(v12, "count"));

  [(CPNavigationManager *)self setRouteGuidance:v10];
  long long v13 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2181A5000, v13, OS_LOG_TYPE_DEFAULT, "startNavigation: set route guidance with loading state and counts", buf, 2u);
  }

  long long v14 = [v6 maneuvers];
  [(CPNavigationManager *)self setManeuvers:v14];

  __int16 v15 = [v6 laneGuidances];
  [(CPNavigationManager *)self setLaneGuidances:v15];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__CPNavigationManager__startNavigationWithRouteInfo_originalState___block_invoke;
  v17[3] = &__block_descriptor_33_e25_v16__0__CPRouteGuidance_8l;
  char v18 = v4;
  [(CPNavigationManager *)self modifyRouteGuidance:v17];
  uint64_t v16 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2181A5000, v16, OS_LOG_TYPE_DEFAULT, "startNavigation: set route guidance with original route guidance", buf, 2u);
  }
}

uint64_t __67__CPNavigationManager__startNavigationWithRouteInfo_originalState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setGuidanceState:*(unsigned __int8 *)(a1 + 32)];
}

- (void)startRerouting
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(CPNavigationManager *)self supportsAccNav])
  {
    unsigned __int8 v3 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(CPNavigationManager *)self routeGuidance];
      uint64_t v5 = NSStringFromCPGuidanceState([v4 guidanceState]);
      int v11 = 138543362;
      long long v12 = v5;
      _os_log_impl(&dword_2181A5000, v3, OS_LOG_TYPE_DEFAULT, "startRerouting: current state: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v6 = [(CPNavigationManager *)self routeGuidance];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = [(CPNavigationManager *)self routeGuidance];
      int v9 = [v8 guidanceState];

      if (v9)
      {
        [(CPNavigationManager *)self modifyRouteGuidance:&__block_literal_global_84];
        uint64_t v10 = CarPlayFrameworkACCNavLogging();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_2181A5000, v10, OS_LOG_TYPE_DEFAULT, "startRerouting: set rerouting routeguidance", (uint8_t *)&v11, 2u);
        }
      }
    }
  }
}

uint64_t __37__CPNavigationManager_startRerouting__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setGuidanceState:5];
}

- (void)routeChangedWithReason:(unsigned __int8)a3 routeInfo:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(CPNavigationManager *)self supportsAccNav])
  {
    uint64_t v7 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = NSStringFromCPRerouteReason(a3);
      int v10 = 138543362;
      int v11 = v8;
      _os_log_impl(&dword_2181A5000, v7, OS_LOG_TYPE_DEFAULT, "routeChangedWithReason: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    int v9 = [v6 routeGuidance];
    -[CPNavigationManager _startNavigationWithRouteInfo:originalState:](self, "_startNavigationWithRouteInfo:originalState:", v6, [v9 guidanceState]);
  }
}

- (void)cancelRerouting
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(CPNavigationManager *)self supportsAccNav])
  {
    unsigned __int8 v3 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(CPNavigationManager *)self routeGuidance];
      uint64_t v5 = NSStringFromCPGuidanceState([v4 guidanceState]);
      int v9 = 138543362;
      int v10 = v5;
      _os_log_impl(&dword_2181A5000, v3, OS_LOG_TYPE_DEFAULT, "cancelRerouting guidanceState: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    id v6 = [(CPNavigationManager *)self routeGuidance];
    int v7 = [v6 guidanceState];

    if (v7 == 5)
    {
      uint64_t v8 = CarPlayFrameworkACCNavLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_2181A5000, v8, OS_LOG_TYPE_DEFAULT, "cancelRerouting: state was rerouting, setting to active", (uint8_t *)&v9, 2u);
      }

      [(CPNavigationManager *)self modifyRouteGuidance:&__block_literal_global_86];
    }
  }
}

void __38__CPNavigationManager_cancelRerouting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unsigned __int8 v3 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2181A5000, v3, OS_LOG_TYPE_DEFAULT, "cancelRerouting: setting guidance state to active", v4, 2u);
  }

  [v2 setGuidanceState:1];
}

- (void)setRouteGuidance:(id)a3
{
  id v5 = a3;
  if ([(CPNavigationManager *)self supportsAccNav])
  {
    routeGuidance = self->_routeGuidance;
    if (!routeGuidance || ![(CPRouteGuidance *)routeGuidance isEqual:v5])
    {
      objc_storeStrong((id *)&self->_routeGuidance, a3);
      int v7 = CarPlayFrameworkACCNavLogging();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[CPNavigationManager setRouteGuidance:]((uint64_t)v5);
      }

      [(CPNavigationManager *)self _enumerateNavControllersWithBlock:&__block_literal_global_89];
    }
  }
}

uint64_t __40__CPNavigationManager_setRouteGuidance___block_invoke(uint64_t a1, void *a2)
{
  return [a2 delegateUpdatedRouteGuidance];
}

- (CPElectricVehicleWaypoint)chargePrecondition
{
  id v2 = [(CPNavigationManager *)self routeGuidance];
  unsigned __int8 v3 = [v2 electricVehicleDestination];

  return (CPElectricVehicleWaypoint *)v3;
}

- (void)setChargePrecondition:(id)a3
{
  id v4 = a3;
  if ([(CPNavigationManager *)self supportsAccNav])
  {
    id v5 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CPNavigationManager setChargePrecondition:]();
    }

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__CPNavigationManager_setChargePrecondition___block_invoke;
    v6[3] = &unk_264309E08;
    id v7 = v4;
    [(CPNavigationManager *)self modifyRouteGuidance:v6];
  }
}

uint64_t __45__CPNavigationManager_setChargePrecondition___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setElectricVehicleDestination:*(void *)(a1 + 32)];
}

- (NSArray)maneuvers
{
  id v2 = [(CPNavigationManager *)self maneuversIndexed];
  unsigned __int8 v3 = [v2 allValues];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_92];

  return (NSArray *)v4;
}

uint64_t __32__CPNavigationManager_maneuvers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithUnsignedShort:", objc_msgSend(a2, "index"));
  id v7 = NSNumber;
  uint64_t v8 = [v5 index];

  int v9 = [v7 numberWithUnsignedShort:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (void)setManeuvers:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CPNavigationManager *)self supportsAccNav])
  {
    id v5 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CPNavigationManager setManeuvers:](v4);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = CarPlayFrameworkACCNavLogging();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[CPNavigationManager setManeuvers:]();
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v8);
    }

    uint64_t v12 = [(CPNavigationManager *)self maneuversIndexed];
    [v12 removeAllObjects];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          char v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v19 = [(CPNavigationManager *)self maneuversIndexed];
          v20 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v18, "index"));
          [v19 setObject:v18 forKeyedSubscript:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v15);
    }

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __36__CPNavigationManager_setManeuvers___block_invoke;
    v21[3] = &unk_264309E08;
    v21[4] = self;
    [(CPNavigationManager *)self modifyRouteGuidance:v21];
    [(CPNavigationManager *)self _enumerateNavControllersWithBlock:&__block_literal_global_95];
  }
}

void __36__CPNavigationManager_setManeuvers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 maneuversIndexed];
  objc_msgSend(v3, "setTotalManeuverCount:", (unsigned __int16)objc_msgSend(v4, "count"));
}

uint64_t __36__CPNavigationManager_setManeuvers___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 delegateUpdatedManeuvers];
}

- (void)addManeuvers:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(CPNavigationManager *)self supportsAccNav]) {
    goto LABEL_29;
  }
  id v5 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CPNavigationManager addManeuvers:](v4);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = v4;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = CarPlayFrameworkACCNavLogging();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[CPNavigationManager addManeuvers:]();
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (!v12)
  {
    char v14 = 0;
    goto LABEL_26;
  }
  uint64_t v13 = v12;
  char v14 = 0;
  uint64_t v15 = *(void *)v28;
  do
  {
    for (uint64_t j = 0; j != v13; ++j)
    {
      if (*(void *)v28 != v15) {
        objc_enumerationMutation(obj);
      }
      __int16 v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
      char v18 = [(CPNavigationManager *)self maneuversIndexed];
      uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v17, "index"));
      v20 = [v18 objectForKeyedSubscript:v19];

      if (v20)
      {
        if ([v20 isEqual:v17]) {
          goto LABEL_22;
        }
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __36__CPNavigationManager_addManeuvers___block_invoke;
        v26[3] = &unk_264309E50;
        v26[4] = v17;
        [(CPNavigationManager *)self _enumerateNavControllersWithBlock:v26];
      }
      uint64_t v21 = [(CPNavigationManager *)self maneuversIndexed];
      long long v22 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v17, "index"));
      [v21 setObject:v17 forKeyedSubscript:v22];

      char v14 = 1;
LABEL_22:
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  }
  while (v13);
LABEL_26:

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __36__CPNavigationManager_addManeuvers___block_invoke_2;
  v25[3] = &unk_264309E08;
  v25[4] = self;
  [(CPNavigationManager *)self modifyRouteGuidance:v25];
  if (v14) {
    [(CPNavigationManager *)self _enumerateNavControllersWithBlock:&__block_literal_global_97];
  }
  id v4 = v23;
LABEL_29:
}

uint64_t __36__CPNavigationManager_addManeuvers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 delegateUpdatedManeuver:*(void *)(a1 + 32)];
}

void __36__CPNavigationManager_addManeuvers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 maneuversIndexed];
  objc_msgSend(v3, "setTotalManeuverCount:", (unsigned __int16)objc_msgSend(v4, "count"));
}

uint64_t __36__CPNavigationManager_addManeuvers___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 delegateUpdatedManeuvers];
}

- (NSArray)laneGuidances
{
  id v2 = [(CPNavigationManager *)self laneGuidanceIndexed];
  id v3 = [v2 allValues];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_100];

  return (NSArray *)v4;
}

uint64_t __36__CPNavigationManager_laneGuidances__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithUnsignedShort:", objc_msgSend(a2, "index"));
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 index];

  uint64_t v9 = [v7 numberWithUnsignedShort:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (void)setLaneGuidances:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CPNavigationManager *)self supportsAccNav])
  {
    id v5 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CPNavigationManager setLaneGuidances:](v4);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = CarPlayFrameworkACCNavLogging();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[CPNavigationManager setLaneGuidances:]();
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v8);
    }

    uint64_t v12 = [(CPNavigationManager *)self laneGuidanceIndexed];
    [v12 removeAllObjects];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          char v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v19 = [(CPNavigationManager *)self laneGuidanceIndexed];
          v20 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v18, "index"));
          [v19 setObject:v18 forKeyedSubscript:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v15);
    }

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __40__CPNavigationManager_setLaneGuidances___block_invoke;
    v21[3] = &unk_264309E08;
    v21[4] = self;
    [(CPNavigationManager *)self modifyRouteGuidance:v21];
    [(CPNavigationManager *)self _enumerateNavControllersWithBlock:&__block_literal_global_102];
  }
}

void __40__CPNavigationManager_setLaneGuidances___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 laneGuidanceIndexed];
  objc_msgSend(v3, "setTotalLaneGuidanceCount:", (unsigned __int16)objc_msgSend(v4, "count"));
}

uint64_t __40__CPNavigationManager_setLaneGuidances___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 delegateUpdatedLaneGuidances];
}

- (void)addLaneGuidances:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(CPNavigationManager *)self supportsAccNav]) {
    goto LABEL_29;
  }
  id v5 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CPNavigationManager addLaneGuidances:](v4);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = v4;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = CarPlayFrameworkACCNavLogging();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[CPNavigationManager addLaneGuidances:]();
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (!v12)
  {
    char v14 = 0;
    goto LABEL_26;
  }
  uint64_t v13 = v12;
  char v14 = 0;
  uint64_t v15 = *(void *)v28;
  do
  {
    for (uint64_t j = 0; j != v13; ++j)
    {
      if (*(void *)v28 != v15) {
        objc_enumerationMutation(obj);
      }
      __int16 v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
      char v18 = [(CPNavigationManager *)self laneGuidanceIndexed];
      uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v17, "index"));
      v20 = [v18 objectForKeyedSubscript:v19];

      if (v20)
      {
        if ([v20 isEqual:v17]) {
          goto LABEL_22;
        }
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __40__CPNavigationManager_addLaneGuidances___block_invoke;
        v26[3] = &unk_264309E50;
        v26[4] = v17;
        [(CPNavigationManager *)self _enumerateNavControllersWithBlock:v26];
      }
      uint64_t v21 = [(CPNavigationManager *)self laneGuidanceIndexed];
      long long v22 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v17, "index"));
      [v21 setObject:v17 forKeyedSubscript:v22];

      char v14 = 1;
LABEL_22:
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  }
  while (v13);
LABEL_26:

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __40__CPNavigationManager_addLaneGuidances___block_invoke_2;
  v25[3] = &unk_264309E08;
  v25[4] = self;
  [(CPNavigationManager *)self modifyRouteGuidance:v25];
  if (v14) {
    [(CPNavigationManager *)self _enumerateNavControllersWithBlock:&__block_literal_global_104];
  }
  id v4 = v23;
LABEL_29:
}

uint64_t __40__CPNavigationManager_addLaneGuidances___block_invoke(uint64_t a1, void *a2)
{
  return [a2 delegateUpdatedLaneGuidance:*(void *)(a1 + 32)];
}

void __40__CPNavigationManager_addLaneGuidances___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 laneGuidanceIndexed];
  objc_msgSend(v3, "setTotalLaneGuidanceCount:", (unsigned __int16)objc_msgSend(v4, "count"));
}

uint64_t __40__CPNavigationManager_addLaneGuidances___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 delegateUpdatedLaneGuidances];
}

void __39__CPNavigationManager__setupConnection__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionRetryDelay];
  double v4 = v3;
  id v5 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [WeakRetained connection];
    *(_DWORD *)buf = 138543874;
    id v13 = WeakRetained;
    __int16 v14 = 2114;
    uint64_t v15 = v6;
    __int16 v16 = 2048;
    double v17 = v4;
    _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "connection interrupted %{public}@ %{public}@. Reconnect in %.2f seconds", buf, 0x20u);
  }
  uint64_t v7 = [WeakRetained connection];
  [v7 invalidate];

  [WeakRetained setConnection:0];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  uint64_t v9 = [WeakRetained connectionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__CPNavigationManager__setupConnection__block_invoke_109;
  block[3] = &unk_264309E98;
  objc_copyWeak(&v11, v1);
  dispatch_after(v8, v9, block);

  objc_destroyWeak(&v11);
}

void __39__CPNavigationManager__setupConnection__block_invoke_109(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setupConnection];
  [WeakRetained _handleConnectionReset];
}

void __39__CPNavigationManager__setupConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = [WeakRetained connection];
    int v5 = 138543618;
    id v6 = WeakRetained;
    __int16 v7 = 2114;
    dispatch_time_t v8 = v3;
    _os_log_impl(&dword_2181A5000, v2, OS_LOG_TYPE_DEFAULT, "connection invalidated %{public}@ %{public}@", (uint8_t *)&v5, 0x16u);
  }
  double v4 = [WeakRetained connection];
  [v4 invalidate];

  [WeakRetained setConnection:0];
}

- (double)_connectionRetryDelay
{
  if (_connectionRetryDelay_onceToken != -1) {
    dispatch_once(&_connectionRetryDelay_onceToken, &__block_literal_global_115);
  }
  return *(double *)&_connectionRetryDelay_xpcRetryDelay;
}

void __44__CPNavigationManager__connectionRetryDelay__block_invoke()
{
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [v0 valueForKey:@"CPXPCRetryDelay"];

  v1 = v3;
  if (v3)
  {
    [v3 doubleValue];
    v1 = v3;
  }
  else
  {
    double v2 = 15.0;
  }
  _connectionRetryDelay_xpcRetryDelay = *(void *)&v2;
}

- (void)_handleConnectionReset
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__CPNavigationManager__handleConnectionReset__block_invoke;
  block[3] = &unk_264309D80;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __45__CPNavigationManager__handleConnectionReset__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) ownershipRequested])
  {
    double v2 = [*(id *)(a1 + 32) navigationService];
    id v3 = [*(id *)(a1 + 32) identifier];
    objc_msgSend(v2, "addNavigationOwnerWithIdentifier:supportsAccNav:", v3, objc_msgSend(*(id *)(a1 + 32), "supportsAccNav"));

    id v4 = [*(id *)(a1 + 32) navigationService];
    [v4 beginObserving];
  }
}

- (void)didUpdateActiveComponents:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__CPNavigationManager_didUpdateActiveComponents___block_invoke;
  v6[3] = &unk_264309F38;
  id v7 = v4;
  dispatch_time_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __49__CPNavigationManager_didUpdateActiveComponents___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  double v2 = CarPlayFrameworkACCNavLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v38 = v3;
    _os_log_impl(&dword_2181A5000, v2, OS_LOG_TYPE_DEFAULT, "activeComponents=%{public}@", buf, 0xCu);
  }

  id v4 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = [*(id *)(a1 + 40) accNavControllersIndexed];
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    uint64_t v10 = MEMORY[0x263EFFA80];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 setObject:v10 forKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    uint64_t v15 = MEMORY[0x263EFFA88];
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        uint64_t v18 = [v17 uuid];
        [v4 setObject:v15 forKeyedSubscript:v18];

        uint64_t v19 = [*(id *)(a1 + 40) accNavControllersIndexed];
        v20 = [v17 uuid];
        uint64_t v21 = [v19 objectForKeyedSubscript:v20];

        if (!v21)
        {
          long long v22 = (void *)[objc_alloc(MEMORY[0x263F30EB8]) initWithComponent:v17 delegate:*(void *)(a1 + 40)];
          id v23 = [*(id *)(a1 + 40) accNavControllersIndexed];
          long long v24 = [v17 uuid];
          [v23 setObject:v22 forKeyedSubscript:v24];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v13);
  }

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __49__CPNavigationManager_didUpdateActiveComponents___block_invoke_121;
  v26[3] = &unk_264309F60;
  v26[4] = *(void *)(a1 + 40);
  [v4 enumerateKeysAndObjectsUsingBlock:v26];
}

void __49__CPNavigationManager_didUpdateActiveComponents___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  if (([a3 BOOLValue] & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) accNavControllersIndexed];
    [v5 removeObjectForKey:v6];
  }
}

- (CRAccNavInfoProviding)routeGuidanceProviding
{
  id v2 = [(CPNavigationManager *)self routeGuidance];
  if ([v2 conformsToProtocol:&unk_26C971A80]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (CRAccNavInfoProviding *)v3;
}

- (void)sendInfo:(id)a3 toComponentUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if ([(CPNavigationManager *)self supportsAccNav])
    {
      BOOL v8 = [(CPNavigationManager *)self ownsNavigation];
      uint64_t v9 = CarPlayFrameworkACCNavLogging();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
      if (v8)
      {
        if (v10) {
          -[CPNavigationManager sendInfo:toComponentUID:]();
        }

        uint64_t v9 = [(CPNavigationManager *)self navigationService];
        [v9 sendInfo:v6 toComponentUID:v7];
      }
      else if (v10)
      {
        -[CPNavigationManager sendInfo:toComponentUID:]((uint64_t)v7, self, v9);
      }
    }
    else
    {
      uint64_t v9 = CarPlayFrameworkACCNavLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CPNavigationManager sendInfo:toComponentUID:].cold.4((uint64_t)v7, self, v9);
      }
    }
  }
  else
  {
    uint64_t v9 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CPNavigationManager sendInfo:toComponentUID:]();
    }
  }
}

- (signed)destinationTimeZoneOffsetMinutes
{
  return self->_destinationTimeZoneOffsetMinutes;
}

- (void)setDestinationTimeZoneOffsetMinutes:(signed __int16)a3
{
  self->_destinationTimeZoneOffsetMinutes = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)setConnectionQueue:(id)a3
{
}

- (BOOL)ownershipRequested
{
  return self->_ownershipRequested;
}

- (void)setOwnershipRequested:(BOOL)a3
{
  self->_ownershipRequested = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
}

- (CPRouteGuidance)routeGuidance
{
  return self->_routeGuidance;
}

- (NSMutableDictionary)maneuversIndexed
{
  return self->_maneuversIndexed;
}

- (NSMutableDictionary)laneGuidanceIndexed
{
  return self->_laneGuidanceIndexed;
}

- (NSMutableDictionary)accNavControllersIndexed
{
  return self->_accNavControllersIndexed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accNavControllersIndexed, 0);
  objc_storeStrong((id *)&self->_laneGuidanceIndexed, 0);
  objc_storeStrong((id *)&self->_maneuversIndexed, 0);
  objc_storeStrong((id *)&self->_routeGuidance, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_lastNavigatingBundleIdentifier, 0);
}

- (void)startNavigationWithRouteInfo:(unsigned __int8)a1 .cold.1(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = NSStringFromCPGuidanceState(a1);
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_2181A5000, a2, OS_LOG_TYPE_FAULT, "unexpected state in startNavigation: %{public}@", v4, 0xCu);
}

- (void)setRouteGuidance:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = +[CPAccNavUpdate description:a1];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2181A5000, v2, v3, "Setting RouteGuidance: {\n%{public}@\n}", v4, v5, v6, v7, v8);
}

- (void)setChargePrecondition:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2181A5000, v0, OS_LOG_TYPE_DEBUG, "Setting ChargePrecondition: %{public}@", v1, 0xCu);
}

- (void)setManeuvers:.cold.1()
{
  OUTLINED_FUNCTION_3();
  v1 = +[CPAccNavUpdate description:v0];
  OUTLINED_FUNCTION_5((uint64_t)v1, 5.8381e-34);
  OUTLINED_FUNCTION_1(&dword_2181A5000, v2, v3, "Setting Maneuvers: {\n%{public}@\n}");
}

- (void)setManeuvers:(void *)a1 .cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2181A5000, v1, v2, "Setting Maneuvers: maneuvers.count=%lu", v3, v4, v5, v6, v7);
}

- (void)addManeuvers:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = +[CPAccNavUpdate description:v0];
  OUTLINED_FUNCTION_5((uint64_t)v1, 5.8381e-34);
  OUTLINED_FUNCTION_1(&dword_2181A5000, v2, v3, "Adding Maneuvers: {\n%{public}@\n}");
}

- (void)addManeuvers:(void *)a1 .cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2181A5000, v1, v2, "Adding Maneuvers: maneuvers.count=%lu", v3, v4, v5, v6, v7);
}

- (void)setLaneGuidances:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = +[CPAccNavUpdate description:v0];
  OUTLINED_FUNCTION_5((uint64_t)v1, 5.8381e-34);
  OUTLINED_FUNCTION_1(&dword_2181A5000, v2, v3, "Setting LaneGuidances: {\n%{public}@\n}");
}

- (void)setLaneGuidances:(void *)a1 .cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2181A5000, v1, v2, "Setting LaneGuidances: laneGuidances.count=%lu", v3, v4, v5, v6, v7);
}

- (void)addLaneGuidances:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = +[CPAccNavUpdate description:v0];
  OUTLINED_FUNCTION_5((uint64_t)v1, 5.8381e-34);
  OUTLINED_FUNCTION_1(&dword_2181A5000, v2, v3, "Adding LaneGuidances: {\n%{public}@\n}");
}

- (void)addLaneGuidances:(void *)a1 .cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2181A5000, v1, v2, "Adding LaneGuidances: laneGuidances.count=%lu", v3, v4, v5, v6, v7);
}

- (void)sendInfo:toComponentUID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_2181A5000, v0, OS_LOG_TYPE_DEBUG, "%s: componentUID=%{public}@ nothing to send", (uint8_t *)v1, 0x16u);
}

- (void)sendInfo:toComponentUID:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_4();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_2181A5000, v2, OS_LOG_TYPE_DEBUG, "%s: componentUID=%{public}@ info=%{public}@", (uint8_t *)v3, 0x20u);
}

- (void)sendInfo:(NSObject *)a3 toComponentUID:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a2 identifier];
  uint64_t v7 = [a2 owner];
  uint8_t v8 = @"None";
  if (v7 == 1) {
    uint8_t v8 = @"iOS";
  }
  if (v7 == 2) {
    uint8_t v8 = @"Car";
  }
  uint64_t v9 = v8;
  BOOL v10 = [a2 lastNavigatingBundleIdentifier];
  int v11 = 136316162;
  uint64_t v12 = "-[CPNavigationManager sendInfo:toComponentUID:]";
  __int16 v13 = 2114;
  uint64_t v14 = a1;
  __int16 v15 = 2114;
  __int16 v16 = v6;
  __int16 v17 = 2114;
  uint64_t v18 = v9;
  __int16 v19 = 2114;
  v20 = v10;
  _os_log_debug_impl(&dword_2181A5000, a3, OS_LOG_TYPE_DEBUG, "%s: componentUID=%{public}@ %{public}@ does not own navigation (owner=%{public}@ lastNavigatingBundleIdentifier=%{public}@)", (uint8_t *)&v11, 0x34u);
}

- (void)sendInfo:(NSObject *)a3 toComponentUID:.cold.4(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 identifier];
  int v6 = 136315650;
  uint64_t v7 = "-[CPNavigationManager sendInfo:toComponentUID:]";
  __int16 v8 = 2114;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  int v11 = v5;
  _os_log_debug_impl(&dword_2181A5000, a3, OS_LOG_TYPE_DEBUG, "%s: componentUID=%{public}@ %{public}@ does not support acc nav", (uint8_t *)&v6, 0x20u);
}

@end