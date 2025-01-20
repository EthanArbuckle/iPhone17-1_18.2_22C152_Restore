@interface ACCNavigationFeaturePlugin
- (ACCNavigationProvider)navigationProvider;
- (ACCNavigationShim)navigationShim;
- (ACCiAP2ShimServer)iap2server;
- (BOOL)isRunning;
- (NSMutableDictionary)navigationShimAccessoryList;
- (NSString)description;
- (NSString)pluginName;
- (OS_dispatch_queue)navigationQueue;
- (id)_navigationShimAccessoryForConnectionIDNoLock:(unsigned int)a3;
- (id)navigationShimAccessoryForConnectionID:(unsigned int)a3;
- (void)initPlugin;
- (void)navigation:(id)a3 accessoryAttached:(id)a4;
- (void)navigation:(id)a3 accessoryDetached:(id)a4;
- (void)navigation:(id)a3 startRouteGuidance:(id)a4 componentList:(id)a5;
- (void)navigation:(id)a3 stopRouteGuidance:(id)a4 componentList:(id)a5;
- (void)notifyNavigationAccessoryClientsOfStateChange;
- (void)setIap2server:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setNavigationProvider:(id)a3;
- (void)setNavigationQueue:(id)a3;
- (void)setNavigationShim:(id)a3;
- (void)setNavigationShimAccessoryList:(id)a3;
- (void)startPlugin;
- (void)stopPlugin;
- (void)updateManeuverInfo:(id)a3 componentIdList:(id)a4 accessory:(id)a5;
- (void)updateRouteGuidanceInfo:(id)a3 componentIdList:(id)a4 accessory:(id)a5;
@end

@implementation ACCNavigationFeaturePlugin

- (NSString)pluginName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(ACCNavigationFeaturePlugin *)self pluginName];
  uint64_t v5 = obfuscatedPointer((uint64_t)self);
  BOOL v6 = [(ACCNavigationFeaturePlugin *)self isRunning];
  v7 = "NO";
  if (v6) {
    v7 = "YES";
  }
  v8 = [v3 stringWithFormat:@"<%@: %p> isRunning: %s", v4, v5, v7];

  return (NSString *)v8;
}

- (void)initPlugin
{
  init_logging();
  iap2server = self->_iap2server;
  self->_iap2server = 0;

  navigationProvider = self->_navigationProvider;
  self->_navigationProvider = 0;

  navigationShimAccessoryList = self->_navigationShimAccessoryList;
  self->_navigationShimAccessoryList = 0;

  [(ACCNavigationFeaturePlugin *)self setIsRunning:0];
  BOOL v6 = (void *)MEMORY[0x263F23098];
  [v6 resetServerState];
}

- (void)startPlugin
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216B2000, v5, OS_LOG_TYPE_DEFAULT, "[#Navigation] Starting Navigation feature plugin...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    BOOL v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    BOOL v6 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_2216B2000, v6, OS_LOG_TYPE_INFO, "[#Navigation] Create/Get shared ACCiAP2ShimServer...", v24, 2u);
  }

  v8 = [MEMORY[0x263F23098] sharedInstance];
  iap2server = self->_iap2server;
  self->_iap2server = v8;

  [(ACCiAP2ShimServer *)self->_iap2server startServer];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v10 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    v10 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_2216B2000, v10, OS_LOG_TYPE_INFO, "[#Navigation] Create ACCNavigationProvider...", v23, 2u);
  }

  v12 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coreaccessories.plugin.navigation", 0);
  navigationQueue = self->_navigationQueue;
  self->_navigationQueue = v12;

  v14 = (ACCNavigationProvider *)[objc_alloc(MEMORY[0x263F22EA0]) initWithDelegate:self];
  navigationProvider = self->_navigationProvider;
  self->_navigationProvider = v14;

  v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  navigationShimAccessoryList = self->_navigationShimAccessoryList;
  self->_navigationShimAccessoryList = v16;

  v18 = [[ACCNavigationShim alloc] initWithDelegate:self];
  navigationShim = self->_navigationShim;
  self->_navigationShim = v18;

  [(ACCiAP2ShimServer *)self->_iap2server addDelegate:self->_navigationShim];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v20 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    v20 = MEMORY[0x263EF8438];
    id v21 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_2216B2000, v20, OS_LOG_TYPE_INFO, "[#Navigation] Starting Navigation feature plugin... finished, set isRunning", v22, 2u);
  }

  [(ACCNavigationFeaturePlugin *)self setIsRunning:1];
}

- (void)stopPlugin
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216B2000, v5, OS_LOG_TYPE_DEFAULT, "[#Navigation] Stopping Navigation feature plugin...", buf, 2u);
  }

  [(ACCNavigationFeaturePlugin *)self setIsRunning:0];
  [(ACCiAP2ShimServer *)self->_iap2server removeDelegate:self->_navigationShim];
  navigationShim = self->_navigationShim;
  self->_navigationShim = 0;

  dispatch_sync((dispatch_queue_t)self->_navigationQueue, &__block_literal_global);
  navigationProvider = self->_navigationProvider;
  self->_navigationProvider = 0;

  navigationQueue = self->_navigationQueue;
  self->_navigationQueue = 0;

  navigationShimAccessoryList = self->_navigationShimAccessoryList;
  self->_navigationShimAccessoryList = 0;

  [(ACCiAP2ShimServer *)self->_iap2server stopServer];
  iap2server = self->_iap2server;
  self->_iap2server = 0;

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    id v11 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2216B2000, v11, OS_LOG_TYPE_INFO, "[#Navigation] Stopping Navigation feature plugin... finished", v13, 2u);
  }
}

- (void)navigation:(id)a3 accessoryAttached:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    navigationShim = self->_navigationShim;
    iap2server = self->_iap2server;
    navigationProvider = self->_navigationProvider;
    *(_DWORD *)buf = 138413314;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    v24 = navigationProvider;
    __int16 v25 = 2112;
    v26 = navigationShim;
    __int16 v27 = 2112;
    v28 = iap2server;
    _os_log_impl(&dword_2216B2000, v10, OS_LOG_TYPE_DEFAULT, "[#Navigation] navigation: %@ accessoryAttached: %@, _navigationProvider=%@ _navigationShim=%@ _iap2server=%@", buf, 0x34u);
  }

  navigationQueue = self->_navigationQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__ACCNavigationFeaturePlugin_navigation_accessoryAttached___block_invoke;
  v16[3] = &unk_2645BFE78;
  id v17 = v7;
  v18 = self;
  id v15 = v7;
  dispatch_async(navigationQueue, v16);
}

void __59__ACCNavigationFeaturePlugin_navigation_accessoryAttached___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F23090]);
  BOOL v3 = [*(id *)(a1 + 32) accessoryUID];
  id v4 = (void *)[v2 initWithUID:v3 keyTag:@"Navigation" features:0];

  [v4 setName:@"Shim Navigation Route Guidance Accessory"];
  [v4 setModel:@"Navigation Route Guidance Accessory"];
  [v4 setManufacturer:@"Navigation Route Guidance Manufacturer"];
  [v4 setSerialNumber:@"NAV_RG_1234"];
  [v4 setFirmwareVersion:@"0.0.0"];
  [v4 setHardwareVersion:@"0.0.0"];
  [v4 setDontPublish:1];
  [v4 addFeature:17];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __59__ACCNavigationFeaturePlugin_navigation_accessoryAttached___block_invoke_cold_4((uint64_t *)(a1 + 32), v5);
  }

  id v7 = objc_alloc_init(ACCNavigationShimAccessory);
  [(ACCNavigationShimAccessory *)v7 setIap2ShimAccessory:v4];
  [(ACCNavigationShimAccessory *)v7 setNavigationAccessory:*(void *)(a1 + 32)];
  [v4 setContext:v7];
  [*(id *)(*(void *)(a1 + 40) + 16) addAccessory:v4];
  if (*(void *)(*(void *)(a1 + 40) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationShimAccessory create_xpc_representation]();
      }
      BOOL v8 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __59__ACCNavigationFeaturePlugin_navigation_accessoryAttached___block_invoke_cold_2((uint64_t *)(a1 + 32), v8);
    }

    [*(id *)(*(void *)(a1 + 40) + 40) accessoryAttached:v7];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationShimAccessory create_xpc_representation]();
      }
      id v9 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 40);
      int v15 = 138412290;
      uint64_t v16 = v11;
      _os_log_impl(&dword_2216B2000, v9, OS_LOG_TYPE_INFO, "[#Navigation] Invalid _navigationShim(%@)", (uint8_t *)&v15, 0xCu);
    }
  }
  v13 = *(void **)(*(void *)(a1 + 40) + 48);
  v14 = [v4 connectionIDObj];
  [v13 setObject:v7 forKey:v14];
}

- (void)navigation:(id)a3 accessoryDetached:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    navigationShim = self->_navigationShim;
    iap2server = self->_iap2server;
    navigationProvider = self->_navigationProvider;
    *(_DWORD *)buf = 138413314;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    __int16 v23 = navigationProvider;
    __int16 v24 = 2112;
    __int16 v25 = navigationShim;
    __int16 v26 = 2112;
    __int16 v27 = iap2server;
    _os_log_impl(&dword_2216B2000, v10, OS_LOG_TYPE_DEFAULT, "[#Navigation] navigation: %@ accessoryDetached: %@, _navigationProvider=%@ _navigationShim=%@ _iap2server=%@", buf, 0x34u);
  }

  navigationQueue = self->_navigationQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__ACCNavigationFeaturePlugin_navigation_accessoryDetached___block_invoke;
  v16[3] = &unk_2645BFE78;
  void v16[4] = self;
  id v17 = v7;
  id v15 = v7;
  dispatch_async(navigationQueue, v16);
}

void __59__ACCNavigationFeaturePlugin_navigation_accessoryDetached___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 16);
    BOOL v3 = [*(id *)(a1 + 40) accessoryUID];
    id v15 = [v2 findAccessoryForAccessoryUID:v3 andKeyTag:@"Navigation"];

    id v4 = v15;
    if (v15)
    {
      [v15 setContext:0];
      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48);
      id v6 = [v15 connectionIDObj];
      id v7 = [v5 objectForKey:v6];

      [*(id *)(*(void *)(a1 + 32) + 40) accessoryDetached:v7];
      BOOL v8 = *(void **)(*(void *)(a1 + 32) + 48);
      id v9 = [v15 connectionIDObj];
      [v8 removeObjectForKey:v9];

      [*(id *)(*(void *)(a1 + 32) + 16) removeAccessory:v15];
      [v7 setIap2ShimAccessory:0];
      [v7 setNavigationAccessory:0];

      id v4 = v15;
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 1;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationShimAccessory create_xpc_representation]();
      }
      id v12 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      id v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      _os_log_impl(&dword_2216B2000, v12, OS_LOG_TYPE_INFO, "[#Navigation] Invalid accessory(%@) or _navigationShim(%@)", buf, 0x16u);
    }
  }
}

- (void)navigation:(id)a3 startRouteGuidance:(id)a4 componentList:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    uint64_t v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    navigationShim = self->_navigationShim;
    iap2server = self->_iap2server;
    navigationProvider = self->_navigationProvider;
    *(_DWORD *)buf = 138413570;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    v30 = navigationProvider;
    __int16 v31 = 2112;
    v32 = navigationShim;
    __int16 v33 = 2112;
    v34 = iap2server;
    _os_log_impl(&dword_2216B2000, v13, OS_LOG_TYPE_DEFAULT, "[#Navigation] navigation: %@ startRouteGuidance: %@ componentList: %@, _navigationProvider=%@ _navigationShim=%@ _iap2server=%@", buf, 0x3Eu);
  }

  navigationQueue = self->_navigationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__ACCNavigationFeaturePlugin_navigation_startRouteGuidance_componentList___block_invoke;
  block[3] = &unk_2645BFEA0;
  block[4] = self;
  id v21 = v9;
  id v22 = v10;
  id v18 = v10;
  id v19 = v9;
  dispatch_async(navigationQueue, block);
}

void __74__ACCNavigationFeaturePlugin_navigation_startRouteGuidance_componentList___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 16);
    BOOL v3 = [*(id *)(a1 + 40) accessoryUID];
    id v12 = [v2 findAccessoryForAccessoryUID:v3 andKeyTag:@"Navigation"];

    id v4 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v5 = [v12 connectionIDObj];
    id v6 = [v4 objectForKey:v5];

    [*(id *)(*(void *)(a1 + 32) + 40) accessoryStartRouteGuidance:v6 componentList:*(void *)(a1 + 48)];
  }
  else
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 1;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationShimAccessory create_xpc_representation]();
      }
      id v9 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      id v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_2216B2000, v9, OS_LOG_TYPE_INFO, "[#Navigation] Invalid accessory(%@) or _navigationShim(%@)", buf, 0x16u);
    }
  }
}

- (void)navigation:(id)a3 stopRouteGuidance:(id)a4 componentList:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    uint64_t v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    navigationShim = self->_navigationShim;
    iap2server = self->_iap2server;
    navigationProvider = self->_navigationProvider;
    *(_DWORD *)buf = 138413570;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    v30 = navigationProvider;
    __int16 v31 = 2112;
    v32 = navigationShim;
    __int16 v33 = 2112;
    v34 = iap2server;
    _os_log_impl(&dword_2216B2000, v13, OS_LOG_TYPE_DEFAULT, "[#Navigation] navigation: %@ startRouteGuidance: %@ componentList: %@, _navigationProvider=%@ _navigationShim=%@ _iap2server=%@", buf, 0x3Eu);
  }

  navigationQueue = self->_navigationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__ACCNavigationFeaturePlugin_navigation_stopRouteGuidance_componentList___block_invoke;
  block[3] = &unk_2645BFEA0;
  block[4] = self;
  id v21 = v9;
  id v22 = v10;
  id v18 = v10;
  id v19 = v9;
  dispatch_async(navigationQueue, block);
}

void __73__ACCNavigationFeaturePlugin_navigation_stopRouteGuidance_componentList___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 16);
    BOOL v3 = [*(id *)(a1 + 40) accessoryUID];
    id v12 = [v2 findAccessoryForAccessoryUID:v3 andKeyTag:@"Navigation"];

    id v4 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v5 = [v12 connectionIDObj];
    id v6 = [v4 objectForKey:v5];

    [*(id *)(*(void *)(a1 + 32) + 40) accessoryStopRouteGuidance:v6 componentList:*(void *)(a1 + 48)];
  }
  else
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 1;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationShimAccessory create_xpc_representation]();
      }
      id v9 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      id v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_2216B2000, v9, OS_LOG_TYPE_INFO, "[#Navigation] Invalid accessory(%@) or _navigationShim(%@)", buf, 0x16u);
    }
  }
}

- (id)navigationShimAccessoryForConnectionID:(unsigned int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  id v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  navigationQueue = self->_navigationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__ACCNavigationFeaturePlugin_navigationShimAccessoryForConnectionID___block_invoke;
  block[3] = &unk_2645BFEC8;
  block[4] = self;
  void block[5] = &v8;
  unsigned int v7 = a3;
  dispatch_sync(navigationQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __69__ACCNavigationFeaturePlugin_navigationShimAccessoryForConnectionID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _navigationShimAccessoryForConnectionIDNoLock:*(unsigned int *)(a1 + 48)];
  return MEMORY[0x270F9A758]();
}

- (NSMutableDictionary)navigationShimAccessoryList
{
  navigationShimAccessoryList = self->_navigationShimAccessoryList;
  if (navigationShimAccessoryList)
  {
    navigationShimAccessoryList = [navigationShimAccessoryList allValues];
  }
  return (NSMutableDictionary *)navigationShimAccessoryList;
}

- (void)updateRouteGuidanceInfo:(id)a3 componentIdList:(id)a4 accessory:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    id v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    id v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    navigationProvider = self->_navigationProvider;
    navigationShim = self->_navigationShim;
    *(_DWORD *)buf = 138413314;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    __int16 v30 = 2112;
    __int16 v31 = navigationProvider;
    __int16 v32 = 2112;
    __int16 v33 = navigationShim;
    _os_log_impl(&dword_2216B2000, v13, OS_LOG_TYPE_INFO, "[#Navigation] navigation updateRouteGuidanceInfo: %@ componentIdList: %@ accessory: %@, _navigationProvider=%@ _navigationShim=%@", buf, 0x34u);
  }

  navigationQueue = self->_navigationQueue;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __80__ACCNavigationFeaturePlugin_updateRouteGuidanceInfo_componentIdList_accessory___block_invoke;
  v20[3] = &unk_2645BFEF0;
  v20[4] = self;
  id v21 = v10;
  id v22 = v9;
  id v23 = v8;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  dispatch_async(navigationQueue, v20);
}

void __80__ACCNavigationFeaturePlugin_updateRouteGuidanceInfo_componentIdList_accessory___block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (*(void *)(a1[4] + 24) && (id v2 = (void *)a1[5]) != 0)
  {
    BOOL v3 = [v2 navigationAccessory];
    id v12 = v3;
    if (a1[6])
    {
      id v4 = objc_msgSend(v3, "componentListForIdList:");
      BOOL v3 = v12;
    }
    else
    {
      id v4 = 0;
    }
    [v3 updateRouteGuidanceInfo:a1[7] componentList:v4];
  }
  else
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 1;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationShimAccessory create_xpc_representation]();
      }
      unsigned int v7 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      unsigned int v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[6];
      uint64_t v8 = a1[7];
      uint64_t v10 = a1[5];
      uint64_t v11 = *(void *)(a1[4] + 24);
      *(_DWORD *)buf = 138413314;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      _os_log_impl(&dword_2216B2000, v7, OS_LOG_TYPE_DEFAULT, "[#Navigation] navigation updateRouteGuidanceInfo: %@ componentIdList: %@ accessory: %@, skip processing, _navigationProvider(%@) or navigationShimAccessory(%@) nil", buf, 0x34u);
    }
  }
}

- (void)updateManeuverInfo:(id)a3 componentIdList:(id)a4 accessory:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationShimAccessory create_xpc_representation]();
    }
    id v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    id v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    navigationProvider = self->_navigationProvider;
    navigationShim = self->_navigationShim;
    *(_DWORD *)buf = 138413314;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    __int16 v30 = 2112;
    __int16 v31 = navigationProvider;
    __int16 v32 = 2112;
    __int16 v33 = navigationShim;
    _os_log_impl(&dword_2216B2000, v13, OS_LOG_TYPE_INFO, "[#Navigation] navigation updateManeuverInfo: %@ componentIdList: %@ accessory: %@, _navigationProvider=%@ _navigationShim=%@", buf, 0x34u);
  }

  navigationQueue = self->_navigationQueue;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __75__ACCNavigationFeaturePlugin_updateManeuverInfo_componentIdList_accessory___block_invoke;
  v20[3] = &unk_2645BFEF0;
  v20[4] = self;
  id v21 = v10;
  id v22 = v9;
  id v23 = v8;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  dispatch_async(navigationQueue, v20);
}

void __75__ACCNavigationFeaturePlugin_updateManeuverInfo_componentIdList_accessory___block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (*(void *)(a1[4] + 24) && (id v2 = (void *)a1[5]) != 0)
  {
    BOOL v3 = [v2 navigationAccessory];
    id v12 = v3;
    if (a1[6])
    {
      id v4 = objc_msgSend(v3, "componentListForIdList:");
      BOOL v3 = v12;
    }
    else
    {
      id v4 = 0;
    }
    [v3 updateManeuverInfo:a1[7] componentList:v4];
  }
  else
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 1;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationShimAccessory create_xpc_representation]();
      }
      unsigned int v7 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      unsigned int v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[6];
      uint64_t v8 = a1[7];
      uint64_t v10 = a1[5];
      uint64_t v11 = *(void *)(a1[4] + 24);
      *(_DWORD *)buf = 138413314;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      _os_log_impl(&dword_2216B2000, v7, OS_LOG_TYPE_DEFAULT, "[#Navigation] navigation updateManeuverInfo: %@ componentIdList: %@ accessory: %@, skip processing, _navigationProvider(%@) or navigationShimAccessory(%@) nil", buf, 0x34u);
    }
  }
}

- (void)notifyNavigationAccessoryClientsOfStateChange
{
  id v2 = (void *)MEMORY[0x263F23098];
  id v3 = [NSString stringWithUTF8String:"nav_frameworkShouldPollNotification"];
  [v2 postNSDistributeNotificationType:v3 notifyDict:0];
}

- (id)_navigationShimAccessoryForConnectionIDNoLock:(unsigned int)a3
{
  navigationShimAccessoryList = self->_navigationShimAccessoryList;
  id v4 = [NSNumber numberWithUnsignedLong:a3];
  BOOL v5 = [(NSMutableDictionary *)navigationShimAccessoryList objectForKey:v4];

  return v5;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (ACCiAP2ShimServer)iap2server
{
  return self->_iap2server;
}

- (void)setIap2server:(id)a3
{
}

- (ACCNavigationProvider)navigationProvider
{
  return self->_navigationProvider;
}

- (void)setNavigationProvider:(id)a3
{
}

- (OS_dispatch_queue)navigationQueue
{
  return self->_navigationQueue;
}

- (void)setNavigationQueue:(id)a3
{
}

- (ACCNavigationShim)navigationShim
{
  return self->_navigationShim;
}

- (void)setNavigationShim:(id)a3
{
}

- (void)setNavigationShimAccessoryList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationShimAccessoryList, 0);
  objc_storeStrong((id *)&self->_navigationShim, 0);
  objc_storeStrong((id *)&self->_navigationQueue, 0);
  objc_storeStrong((id *)&self->_navigationProvider, 0);
  objc_storeStrong((id *)&self->_iap2server, 0);
}

void __59__ACCNavigationFeaturePlugin_navigation_accessoryAttached___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2216B2000, a2, OS_LOG_TYPE_DEBUG, "[#Navigation] accessoryAttached: call shim accessoryAttached: navigationAccessory=%@", (uint8_t *)&v3, 0xCu);
}

void __59__ACCNavigationFeaturePlugin_navigation_accessoryAttached___block_invoke_cold_4(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2216B2000, a2, OS_LOG_TYPE_DEBUG, "[#Navigation] accessoryAttached: accessory=%@", (uint8_t *)&v3, 0xCu);
}

@end