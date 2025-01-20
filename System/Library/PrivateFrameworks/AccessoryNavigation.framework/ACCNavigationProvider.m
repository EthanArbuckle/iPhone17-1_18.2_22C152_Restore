@interface ACCNavigationProvider
- (ACCNavigationProvider)initWithDelegate:(id)a3;
- (ACCNavigationXPCServerProtocol)remoteObject;
- (NSMutableArray)delegates;
- (NSMutableDictionary)accessories;
- (NSString)providerUID;
- (NSXPCConnection)serverConnection;
- (id)accessoryForUID:(id)a3;
- (id)delegatesImplementing:(SEL)a3;
- (void)accessoryNavigationAttached:(id)a3 componentList:(id)a4;
- (void)accessoryNavigationDetached:(id)a3;
- (void)accessoryNavigationObjectDetection:(id)a3 componentIdList:(id)a4 updateInfo:(id)a5;
- (void)accessoryNavigationStartRouteGuidance:(id)a3 componentIdList:(id)a4 options:(unint64_t)a5;
- (void)accessoryNavigationStopRouteGuidance:(id)a3 componentIdList:(id)a4;
- (void)connectToServer;
- (void)dealloc;
- (void)detachAllAccessories;
- (void)objectDetection:(id)a3 startComponentIdList:(id)a4 objectTypes:(id)a5;
- (void)objectDetection:(id)a3 stopComponentIdList:(id)a4;
- (void)routeGuidance:(id)a3 laneGuidanceInfo:(id)a4 componentIdList:(id)a5;
- (void)routeGuidance:(id)a3 maneuverUpdateInfo:(id)a4 componentIdList:(id)a5;
- (void)routeGuidance:(id)a3 updateInfo:(id)a4 componentIdList:(id)a5;
- (void)setAccessories:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setProviderUID:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerConnection:(id)a3;
@end

@implementation ACCNavigationProvider

- (ACCNavigationProvider)initWithDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  init_logging();
  v21.receiver = self;
  v21.super_class = (Class)ACCNavigationProvider;
  v5 = [(ACCNavigationProvider *)&v21 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F08C38] UUID];
    uint64_t v7 = [v6 UUIDString];
    providerUID = v5->_providerUID;
    v5->_providerUID = (NSString *)v7;

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      v9 = &_os_log_internal;
      id v10 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v5->_providerUID;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v11;
      _os_log_impl(&dword_22605D000, v9, OS_LOG_TYPE_DEFAULT, "[#Navigation] ACCNavigationProvider init, _providerUID=%@", buf, 0xCu);
    }

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    delegates = v5->_delegates;
    v5->_delegates = v12;

    [(NSMutableArray *)v5->_delegates addObject:v4];
    serverConnection = v5->_serverConnection;
    v5->_serverConnection = 0;

    remoteObject = v5->_remoteObject;
    v5->_remoteObject = 0;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accessories = v5->_accessories;
    v5->_accessories = v16;

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v5);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __42__ACCNavigationProvider_initWithDelegate___block_invoke;
    v19[3] = &unk_26478CF68;
    objc_copyWeak(&v20, (id *)buf);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.navigation.availability-changed", v19);
    [(ACCNavigationProvider *)v5 connectToServer];
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

  return v5;
}

void __42__ACCNavigationProvider_initWithDelegate___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_22605D000, v6, OS_LOG_TYPE_DEFAULT, "[#Navigation] Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      uint64_t v7 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_22605D000, v7, OS_LOG_TYPE_DEFAULT, "[#Navigation] Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained connectToServer];
  }
}

- (void)dealloc
{
  accessoryServer_unregisterAvailabilityChangedHandler();
  v3 = [(ACCNavigationProvider *)self serverConnection];
  [v3 invalidate];

  [(ACCNavigationProvider *)self setServerConnection:0];
  delegates = self->_delegates;
  self->_delegates = 0;

  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  accessories = self->_accessories;
  self->_accessories = 0;

  providerUID = self->_providerUID;
  self->_providerUID = 0;

  v8.receiver = self;
  v8.super_class = (Class)ACCNavigationProvider;
  [(ACCNavigationProvider *)&v8 dealloc];
}

- (void)connectToServer
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_22605D000, log, OS_LOG_TYPE_DEBUG, "[#Navigation] Call initConnection to remoteObject=%@", buf, 0xCu);
}

void __40__ACCNavigationProvider_connectToServer__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained serverConnection];
  [v3 setInvalidationHandler:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setRemoteObject:0];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  accessoryServer_serverIsUnreachable();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_22605D000, v6, OS_LOG_TYPE_DEFAULT, "[#Navigation] XPC connection invalidated!", v9, 2u);
  }

  id v8 = objc_loadWeakRetained(v1);
  [v8 detachAllAccessories];
}

void __40__ACCNavigationProvider_connectToServer__block_invoke_76(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRemoteObject:0];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 serverConnection];
  [v4 invalidate];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_22605D000, v6, OS_LOG_TYPE_DEFAULT, "[#Navigation] XPC connection interrupted!", v8, 2u);
  }
}

void __40__ACCNavigationProvider_connectToServer__block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    id v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_22605D000, v5, OS_LOG_TYPE_DEFAULT, "[#Navigation] XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v2;
    _os_log_impl(&dword_22605D000, v6, OS_LOG_TYPE_DEFAULT, "[#Navigation] %@", (uint8_t *)&v8, 0xCu);
  }
}

void __40__ACCNavigationProvider_connectToServer__block_invoke_79(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = a2;
    _os_log_impl(&dword_22605D000, v6, OS_LOG_TYPE_DEFAULT, "[#Navigation] shouldStayConnected: %d", (uint8_t *)v13, 8u);
  }

  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (a2)
  {
    uint64_t v10 = [WeakRetained remoteObject];
    id v11 = objc_loadWeakRetained(v7);
    v12 = [v11 providerUID];
    [v10 notifyOfProvider:v12];
  }
  else
  {
    uint64_t v10 = [WeakRetained serverConnection];
    [v10 invalidate];
  }
}

- (void)detachAllAccessories
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v3 = [(NSMutableDictionary *)self->_accessories allValues];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_22605D000, v6, OS_LOG_TYPE_DEFAULT, "[#Navigation] detachAllAccessories: allAccessories=%@", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "accessoryUID", (void)v13);
        [(ACCNavigationProvider *)self accessoryNavigationDetached:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (id)delegatesImplementing:(SEL)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  delegates = self->_delegates;
  p_delegates = &self->_delegates;
  uint64_t v8 = delegates;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v5, "addObject:", v13, (void)v18);
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    long long v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    long long v14 = &_os_log_internal;
    id v15 = &_os_log_internal;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    [(ACCNavigationProvider *)a3 delegatesImplementing:v14];
  }

  long long v16 = (void *)[v5 copy];
  return v16;
}

- (void)accessoryNavigationAttached:(id)a3 componentList:(id)a4
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (ACCNavigationAccessory *)a4;
  v71 = v6;
  v72 = self;
  uint64_t v8 = [(NSMutableDictionary *)self->_accessories objectForKey:v6];
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 1;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    uint64_t v11 = &_os_log_internal;
    id v10 = &_os_log_internal;
  }
  else
  {
    uint64_t v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v88 = (uint64_t)v71;
    __int16 v89 = 2112;
    v90 = v7;
    __int16 v91 = 2112;
    v92 = v8;
    _os_log_impl(&dword_22605D000, v11, OS_LOG_TYPE_DEFAULT, "[#Navigation] accessoryNavigationAttached: %@ componentList: %@, accessory=%@", buf, 0x20u);
  }

  if (v8)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      v12 = &_os_log_internal;
      id v46 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationProvider accessoryNavigationAttached:componentList:].cold.4((uint64_t)v71, (uint64_t)v8, v12);
    }
  }
  else
  {
    uint64_t v8 = [[ACCNavigationAccessory alloc] initWithAccessoryUID:v71 provider:v72];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    obuint64_t j = v7;
    uint64_t v13 = [(ACCNavigationAccessory *)obj countByEnumeratingWithState:&v82 objects:v96 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v83 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          long long v18 = [v17 objectForKey:ACCNav_DispComp_ComponentID];
          if (v18)
          {
            long long v19 = objc_alloc_init(ACCNavigationAccessoryComponent);
            -[ACCNavigationAccessoryComponent setIdentifier:](v19, "setIdentifier:", [v18 unsignedIntegerValue]);
            long long v20 = [v17 objectForKey:ACCNav_DispComp_Name];
            [(ACCNavigationAccessoryComponent *)v19 setName:v20];

            long long v21 = [v17 objectForKey:ACCNav_DispComp_MaxCurRoadNameLength];
            -[ACCNavigationAccessoryComponent setMaxLength_CurrentRoadName:](v19, "setMaxLength_CurrentRoadName:", [v21 unsignedIntegerValue]);

            v22 = [v17 objectForKey:ACCNav_DispComp_MaxDestinationNameLength];
            -[ACCNavigationAccessoryComponent setMaxLength_DestinationRoadName:](v19, "setMaxLength_DestinationRoadName:", [v22 unsignedIntegerValue]);

            uint64_t v23 = [v17 objectForKey:ACCNav_DispComp_MaxAfterManeuverRoadNameLength];
            -[ACCNavigationAccessoryComponent setMaxLength_PostManeuverRoadName:](v19, "setMaxLength_PostManeuverRoadName:", [v23 unsignedIntegerValue]);

            v24 = [v17 objectForKey:ACCNav_DispComp_MaxManeuverDescriptionLength];
            -[ACCNavigationAccessoryComponent setMaxLength_ManeuverDescription:](v19, "setMaxLength_ManeuverDescription:", [v24 unsignedIntegerValue]);

            v25 = [v17 objectForKey:ACCNav_DispComp_MaxMGuidanceManeuverCapacity];
            -[ACCNavigationAccessoryComponent setMaxCapacity_GuidanceManeuver:](v19, "setMaxCapacity_GuidanceManeuver:", [v25 unsignedIntegerValue]);

            v26 = [v17 objectForKey:ACCNav_DispComp_MaxLaneGuidanceDescriptionLength];
            -[ACCNavigationAccessoryComponent setMaxLength_LaneGuidanceDescription:](v19, "setMaxLength_LaneGuidanceDescription:", [v26 unsignedIntegerValue]);

            v27 = [v17 objectForKey:ACCNav_DispComp_MaxLaneGuidanceStorageCapacity];
            -[ACCNavigationAccessoryComponent setMaxCapacity_LaneGuidance:](v19, "setMaxCapacity_LaneGuidance:", [v27 unsignedIntegerValue]);

            [(ACCNavigationAccessoryComponent *)v19 setRequestSourceName:0];
            [(ACCNavigationAccessoryComponent *)v19 setRequestSourceSupportsRouteGuidance:0];
            [(ACCNavigationAccessoryComponent *)v19 setSupportsExitInfo:0];
            v28 = [(ACCNavigationAccessory *)v8 componentListInternal];
            [v28 setObject:v19 forKey:v18];
          }
          v29 = [v17 objectForKey:ACCNav_RODComp_ComponentID];

          if (v29)
          {
            v30 = objc_alloc_init(ACCNavigationAccessoryObjectDetectionComponent);
            -[ACCNavigationAccessoryObjectDetectionComponent setIdentifier:](v30, "setIdentifier:", [v29 unsignedIntegerValue]);
            v31 = [v17 objectForKey:ACCNav_RODComp_Name];
            [(ACCNavigationAccessoryObjectDetectionComponent *)v30 setName:v31];

            v32 = [v17 objectForKey:ACCNav_RODComp_SupportedTypes];
            [(ACCNavigationAccessoryObjectDetectionComponent *)v30 setSupportedTypes:v32];

            v33 = [(ACCNavigationAccessory *)v8 objectDetectionComponentListInternal];
            [v33 setObject:v30 forKey:v29];
          }
        }
        uint64_t v14 = [(ACCNavigationAccessory *)obj countByEnumeratingWithState:&v82 objects:v96 count:16];
      }
      while (v14);
    }

    [(NSMutableDictionary *)v72->_accessories setObject:v8 forKey:v71];
    v12 = [(ACCNavigationProvider *)v72 delegatesImplementing:sel_navigation_accessoryAttached_];
    if ([v12 count])
    {
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      v34 = v12;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v78 objects:v95 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        v69 = v12;
        uint64_t v37 = *(void *)v79;
        v38 = &_os_log_internal;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v79 != v37) {
              objc_enumerationMutation(v34);
            }
            v40 = *(char **)(*((void *)&v78 + 1) + 8 * j);
            uint64_t v41 = gLogObjects;
            int v42 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v43 = gNumLogObjects < 1;
            }
            else {
              BOOL v43 = 1;
            }
            if (v43)
            {
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v88 = v41;
                __int16 v89 = 1024;
                LODWORD(v90) = v42;
                _os_log_error_impl(&dword_22605D000, v38, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v44 = v38;
              v45 = v38;
            }
            else
            {
              v45 = *(id *)gLogObjects;
            }
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              uint64_t v88 = (uint64_t)v71;
              __int16 v89 = 2112;
              v90 = v8;
              __int16 v91 = 2112;
              v92 = obj;
              __int16 v93 = 2112;
              v94 = v40;
              _os_log_impl(&dword_22605D000, v45, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationAttached: accessory %@, accessory=%@ componentList=%@, delegate=%@, notify navigation(route guidance) accessory attached", buf, 0x2Au);
            }

            [v40 navigation:v72 accessoryAttached:v8];
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v78 objects:v95 count:16];
        }
        while (v36);
        v12 = v69;
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v34 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
        }
        v34 = &_os_log_internal;
        id v47 = &_os_log_internal;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v88 = (uint64_t)v71;
        __int16 v89 = 2112;
        v90 = v8;
        __int16 v91 = 2112;
        v92 = obj;
        _os_log_impl(&dword_22605D000, v34, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationAttached: accessory %@, accessory=%@ componentList=%@, no delegate found conforming to protocol: ACCNavigationProviderProtocol", buf, 0x20u);
      }
    }

    v48 = [(ACCNavigationAccessory *)v8 objectDetectionComponentList];
    uint64_t v49 = [v48 count];

    if (v49)
    {
      v50 = [(ACCNavigationProvider *)v72 delegatesImplementing:sel_navigationObjectDetection_accessoryAttached_];
      if ([v50 count])
      {
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        v51 = v50;
        uint64_t v52 = [v51 countByEnumeratingWithState:&v74 objects:v86 count:16];
        if (v52)
        {
          uint64_t v53 = v52;
          v68 = v50;
          v70 = v12;
          uint64_t v54 = *(void *)v75;
          v55 = &_os_log_internal;
          do
          {
            for (uint64_t k = 0; k != v53; ++k)
            {
              if (*(void *)v75 != v54) {
                objc_enumerationMutation(v51);
              }
              v57 = *(char **)(*((void *)&v74 + 1) + 8 * k);
              uint64_t v58 = gLogObjects;
              int v59 = gNumLogObjects;
              if (gLogObjects) {
                BOOL v60 = gNumLogObjects < 1;
              }
              else {
                BOOL v60 = 1;
              }
              if (v60)
              {
                if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  uint64_t v88 = v58;
                  __int16 v89 = 1024;
                  LODWORD(v90) = v59;
                  _os_log_error_impl(&dword_22605D000, v55, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v61 = v55;
                v62 = v55;
              }
              else
              {
                v62 = *(id *)gLogObjects;
              }
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138413058;
                uint64_t v88 = (uint64_t)v71;
                __int16 v89 = 2112;
                v90 = v8;
                __int16 v91 = 2112;
                v92 = obj;
                __int16 v93 = 2112;
                v94 = v57;
                _os_log_impl(&dword_22605D000, v62, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationAttached: accessory %@, accessory=%@ componentList=%@, delegate=%@, notify navigation(object detection) accessory attached", buf, 0x2Au);
              }

              [v57 navigationObjectDetection:v72 accessoryAttached:v8];
            }
            uint64_t v53 = [v51 countByEnumeratingWithState:&v74 objects:v86 count:16];
          }
          while (v53);
          v12 = v70;
          v50 = v68;
        }
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v51 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
          }
          v51 = &_os_log_internal;
          id v63 = &_os_log_internal;
        }
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v88 = (uint64_t)v71;
          __int16 v89 = 2112;
          v90 = v8;
          __int16 v91 = 2112;
          v92 = obj;
          _os_log_impl(&dword_22605D000, v51, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationAttached: accessory %@, accessory=%@ componentList=%@, no delegate found conforming to protocol: ACCNavigationProviderObjectDetectionProtocol", buf, 0x20u);
        }
      }
    }
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v64 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    v64 = &_os_log_internal;
    id v65 = &_os_log_internal;
  }
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    accessories = v72->_accessories;
    v67 = [(ACCNavigationAccessory *)v8 componentListInternal];
    *(_DWORD *)buf = 138413058;
    uint64_t v88 = (uint64_t)v71;
    __int16 v89 = 2112;
    v90 = (ACCNavigationAccessory *)accessories;
    __int16 v91 = 2112;
    v92 = v67;
    __int16 v93 = 2080;
    v94 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
    _os_log_debug_impl(&dword_22605D000, v64, OS_LOG_TYPE_DEBUG, "[#Navigation] exiting accessoryNavigationAttached: accessory %@, _accessories=%@, accessory.componentListInternal=%@, file: %s", buf, 0x2Au);
  }
}

- (void)accessoryNavigationDetached:(id)a3
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v64 = a3;
  id v65 = self;
  accessories = self->_accessories;
  p_accessories = &self->_accessories;
  id v6 = -[NSMutableDictionary objectForKey:](accessories, "objectForKey:");
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    BOOL v9 = &_os_log_internal;
    id v8 = &_os_log_internal;
  }
  else
  {
    BOOL v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v85 = (uint64_t)v64;
    __int16 v86 = 2112;
    v87 = v6;
    _os_log_impl(&dword_22605D000, v9, OS_LOG_TYPE_DEFAULT, "[#Navigation] accessoryNavigationDetached: %@, accessory=%@", buf, 0x16u);
  }

  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (v6)
  {
    if (v11)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      v12 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v85 = (uint64_t)v64;
      __int16 v86 = 2112;
      v87 = v6;
      _os_log_impl(&dword_22605D000, v12, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationDetached: accessory %@, accessory=%@", buf, 0x16u);
    }

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v15 = [v6 componentList];
    long long v16 = [v15 allValues];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v78 objects:v91 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v79 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v78 + 1) + 8 * i) setIsEnabled:0];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v78 objects:v91 count:16];
      }
      while (v18);
    }

    uint64_t v13 = [(ACCNavigationProvider *)v65 delegatesImplementing:sel_navigation_accessoryAttached_];
    if ([v13 count])
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v21 = v13;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v74 objects:v90 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        BOOL v60 = p_accessories;
        v62 = v13;
        uint64_t v24 = *(void *)v75;
        v25 = &_os_log_internal;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v75 != v24) {
              objc_enumerationMutation(v21);
            }
            v27 = *(void **)(*((void *)&v74 + 1) + 8 * j);
            uint64_t v28 = gLogObjects;
            int v29 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v30 = gNumLogObjects < 1;
            }
            else {
              BOOL v30 = 1;
            }
            if (v30)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v85 = v28;
                __int16 v86 = 1024;
                LODWORD(v87) = v29;
                _os_log_error_impl(&dword_22605D000, v25, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v31 = v25;
              v32 = v25;
            }
            else
            {
              v32 = *(id *)gLogObjects;
            }
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v85 = (uint64_t)v64;
              __int16 v86 = 2112;
              v87 = v6;
              __int16 v88 = 2112;
              __int16 v89 = v27;
              _os_log_impl(&dword_22605D000, v32, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationDetached: accessory %@, accessory=%@, delegate=%@, notify navigation accessory detached", buf, 0x20u);
            }

            [v27 navigation:v65 accessoryDetached:v6];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v74 objects:v90 count:16];
        }
        while (v23);
        p_accessories = v60;
        uint64_t v13 = v62;
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        long long v21 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
        }
        long long v21 = &_os_log_internal;
        id v34 = &_os_log_internal;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v85 = (uint64_t)v64;
        __int16 v86 = 2112;
        v87 = v6;
        _os_log_impl(&dword_22605D000, v21, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationDetached: accessory %@, accessory=%@, no delgate found conforming to protocol", buf, 0x16u);
      }
    }

    uint64_t v35 = [v6 objectDetectionComponentList];
    uint64_t v36 = [v35 count];

    if (v36)
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v37 = [v6 objectDetectionComponentList];
      v38 = [v37 allValues];

      uint64_t v39 = [v38 countByEnumeratingWithState:&v70 objects:v83 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v71;
        do
        {
          for (uint64_t k = 0; k != v40; ++k)
          {
            if (*(void *)v71 != v41) {
              objc_enumerationMutation(v38);
            }
            [*(id *)(*((void *)&v70 + 1) + 8 * k) setIsEnabled:0];
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v70 objects:v83 count:16];
        }
        while (v40);
      }

      BOOL v43 = [(ACCNavigationProvider *)v65 delegatesImplementing:sel_navigationObjectDetection_accessoryAttached_];
      if ([v43 count])
      {
        id v63 = v13;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        v44 = v43;
        uint64_t v45 = [v44 countByEnumeratingWithState:&v66 objects:v82 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          int v59 = v43;
          v61 = p_accessories;
          uint64_t v47 = *(void *)v67;
          v48 = &_os_log_internal;
          do
          {
            for (uint64_t m = 0; m != v46; ++m)
            {
              if (*(void *)v67 != v47) {
                objc_enumerationMutation(v44);
              }
              v50 = *(void **)(*((void *)&v66 + 1) + 8 * m);
              uint64_t v51 = gLogObjects;
              int v52 = gNumLogObjects;
              if (gLogObjects) {
                BOOL v53 = gNumLogObjects < 1;
              }
              else {
                BOOL v53 = 1;
              }
              if (v53)
              {
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  uint64_t v85 = v51;
                  __int16 v86 = 1024;
                  LODWORD(v87) = v52;
                  _os_log_error_impl(&dword_22605D000, v48, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                uint64_t v54 = v48;
                v55 = v48;
              }
              else
              {
                v55 = *(id *)gLogObjects;
              }
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                uint64_t v85 = (uint64_t)v64;
                __int16 v86 = 2112;
                v87 = v6;
                __int16 v88 = 2112;
                __int16 v89 = v50;
                _os_log_impl(&dword_22605D000, v55, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationDetached: accessory %@, accessory=%@, delegate=%@, notify navigation(object detection) accessory detached", buf, 0x20u);
              }

              [v50 navigationObjectDetection:v65 accessoryDetached:v6];
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v66 objects:v82 count:16];
          }
          while (v46);
          p_accessories = v61;
          uint64_t v13 = v63;
          BOOL v43 = v59;
        }
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v44 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
          }
          v44 = &_os_log_internal;
          id v56 = &_os_log_internal;
        }
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v85 = (uint64_t)v64;
          __int16 v86 = 2112;
          v87 = v6;
          _os_log_impl(&dword_22605D000, v44, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationDetached: accessory %@, accessory=%@, no delgate found conforming to protocol", buf, 0x16u);
        }
      }
    }
    [(NSMutableDictionary *)*p_accessories removeObjectForKey:v64];
  }
  else
  {
    if (v11)
    {
      uint64_t v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      uint64_t v13 = &_os_log_internal;
      id v33 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationProvider accessoryNavigationDetached:]((uint64_t)v64, v13);
    }
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v57 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    v57 = &_os_log_internal;
    id v58 = &_os_log_internal;
  }
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
    -[ACCNavigationProvider accessoryNavigationDetached:]();
  }
}

- (void)accessoryNavigationStartRouteGuidance:(id)a3 componentIdList:(id)a4 options:(unint64_t)a5
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v7 = a3;
  BOOL v60 = a4;
  id v65 = self;
  long long v66 = v7;
  uint64_t v8 = [(NSMutableDictionary *)self->_accessories objectForKey:v7];
  BOOL v9 = (void *)v8;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (v8)
  {
    if (v11)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      v12 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v77 = (uint64_t)v7;
      __int16 v78 = 2112;
      long long v79 = v9;
      __int16 v80 = 2112;
      long long v81 = v60;
      _os_log_impl(&dword_22605D000, v12, OS_LOG_TYPE_DEFAULT, "[#Navigation] accessoryNavigationStartRouteGuidance: accessory %@, accessory=%@ componentIdList=%@", buf, 0x20u);
    }

    uint64_t v15 = [v9 componentListForIdList:v60];
    int v59 = v15;
    if (__PAIR128__((unint64_t)v60, (unint64_t)v15) == 0)
    {
      long long v16 = [v9 componentList];
      uint64_t v17 = [v16 allValues];
    }
    else
    {
      uint64_t v17 = v15;
    }
    id v64 = v17;
    if (v17)
    {
      id v58 = v9;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      obuint64_t j = v17;
      uint64_t v18 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
      if (v18)
      {
        uint64_t v20 = v18;
        uint64_t v21 = *(void *)v73;
        *(void *)&long long v19 = 134218240;
        long long v57 = v19;
        unint64_t v22 = (a5 >> 5) & 1;
        unint64_t v23 = (a5 >> 4) & 1;
        unint64_t v24 = (a5 >> 3) & 1;
        unint64_t v25 = (a5 >> 2) & 1;
        do
        {
          uint64_t v26 = 0;
          uint64_t v61 = v20;
          do
          {
            if (*(void *)v73 != v21) {
              objc_enumerationMutation(obj);
            }
            v27 = *(void **)(*((void *)&v72 + 1) + 8 * v26);
            uint64_t v28 = gLogObjects;
            int v29 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v30 = gNumLogObjects < 1;
            }
            else {
              BOOL v30 = 1;
            }
            if (v30)
            {
              unint64_t v31 = v25;
              unint64_t v32 = v24;
              unint64_t v33 = v23;
              unint64_t v34 = v22;
              uint64_t v35 = v21;
              uint64_t v36 = &_os_log_internal;
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v57;
                uint64_t v77 = v28;
                __int16 v78 = 1024;
                LODWORD(v79) = v29;
                _os_log_error_impl(&dword_22605D000, v36, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              uint64_t v37 = v36;
              v38 = v36;
              uint64_t v21 = v35;
              unint64_t v22 = v34;
              unint64_t v23 = v33;
              unint64_t v24 = v32;
              unint64_t v25 = v31;
              uint64_t v20 = v61;
            }
            else
            {
              v38 = *(id *)gLogObjects;
            }
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v77 = (uint64_t)v66;
              __int16 v78 = 2112;
              long long v79 = v58;
              __int16 v80 = 2112;
              long long v81 = v60;
              _os_log_impl(&dword_22605D000, v38, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationStartRouteGuidance: accessory %@, accessory=%@ componentIdList=%@", buf, 0x20u);
            }

            [v27 setIsEnabled:1];
            [v27 setRequestSourceName:a5 & 1];
            [v27 setRequestSourceSupportsRouteGuidance:(a5 >> 1) & 1];
            [v27 setSupportsExitInfo:v25];
            [v27 setSupportsLaneGuidance:v24];
            [v27 setSupportsTimeZoneOffset:v23];
            [v27 setSupportsPreconditioning:v22];
            ++v26;
          }
          while (v20 != v26);
          uint64_t v20 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
        }
        while (v20);
      }

      BOOL v9 = v58;
      uint64_t v17 = v64;
    }
    uint64_t v39 = -[ACCNavigationProvider delegatesImplementing:](v65, "delegatesImplementing:", sel_navigation_accessoryAttached_, v57);
    if ([v39 count])
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v40 = v39;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v68 objects:v86 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        v62 = v39;
        uint64_t v43 = *(void *)v69;
        v44 = &_os_log_internal;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            uint64_t v46 = v9;
            if (*(void *)v69 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v47 = *(char **)(*((void *)&v68 + 1) + 8 * i);
            uint64_t v48 = gLogObjects;
            int v49 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v50 = gNumLogObjects < 1;
            }
            else {
              BOOL v50 = 1;
            }
            if (v50)
            {
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v77 = v48;
                __int16 v78 = 1024;
                LODWORD(v79) = v49;
                _os_log_error_impl(&dword_22605D000, v44, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              uint64_t v51 = v44;
              int v52 = v44;
            }
            else
            {
              int v52 = *(id *)gLogObjects;
            }
            BOOL v9 = v46;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413314;
              uint64_t v77 = (uint64_t)v66;
              __int16 v78 = 2112;
              long long v79 = v46;
              __int16 v80 = 2112;
              long long v81 = v59;
              __int16 v82 = 2112;
              long long v83 = v47;
              __int16 v84 = 2048;
              unint64_t v85 = a5;
              _os_log_impl(&dword_22605D000, v52, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationStartRouteGuidance: accessory %@, accessory=%@ componentList=%@, delegate=%@, options=%llxh", buf, 0x34u);
            }

            uint64_t v17 = v64;
            [v47 navigation:v65 startRouteGuidance:v9 componentList:v64];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v68 objects:v86 count:16];
        }
        while (v42);
        uint64_t v13 = v59;
        uint64_t v39 = v62;
      }
      else
      {
        uint64_t v13 = v59;
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v40 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
        }
        uint64_t v40 = &_os_log_internal;
        id v54 = &_os_log_internal;
      }
      uint64_t v13 = v59;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v77 = (uint64_t)v66;
        __int16 v78 = 2112;
        long long v79 = v9;
        __int16 v80 = 2112;
        long long v81 = v59;
        _os_log_impl(&dword_22605D000, v40, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationStartRouteGuidance: accessory %@, accessory=%@ componentList=%@, no delgate found conforming to protocol", buf, 0x20u);
      }
    }
  }
  else
  {
    if (v11)
    {
      uint64_t v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      uint64_t v13 = &_os_log_internal;
      id v53 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationProvider accessoryNavigationStartRouteGuidance:componentIdList:options:]();
    }
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v55 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    v55 = &_os_log_internal;
    id v56 = &_os_log_internal;
  }
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v77 = (uint64_t)v66;
    __int16 v78 = 2112;
    long long v79 = v9;
    __int16 v80 = 2112;
    long long v81 = v60;
    __int16 v82 = 2080;
    long long v83 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
    _os_log_debug_impl(&dword_22605D000, v55, OS_LOG_TYPE_DEBUG, "[#Navigation] exiting accessoryNavigationStartRouteGuidance: accessory %@, accessory=%@ componentIdList=%@, file: %s", buf, 0x2Au);
  }
}

- (void)accessoryNavigationStopRouteGuidance:(id)a3 componentIdList:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = (unint64_t)a4;
  uint64_t v42 = v6;
  uint64_t v43 = self;
  uint64_t v8 = [(NSMutableDictionary *)self->_accessories objectForKey:v6];
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects <= 0;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  v44 = (void *)v8;
  if (v8)
  {
    if (v10)
    {
      int v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      int v11 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v54 = (uint64_t)v6;
      __int16 v55 = 2112;
      id v56 = v44;
      __int16 v57 = 2112;
      id v58 = v7;
      _os_log_impl(&dword_22605D000, v11, OS_LOG_TYPE_DEFAULT, "[#Navigation] accessoryNavigationStopRouteGuidance: accessory %@, accessory=%@ componentIdList=%@", buf, 0x20u);
    }

    uint64_t v14 = [v44 componentListForIdList:v7];
    v12 = v14;
    if (v7 | v14)
    {
      id v16 = (id)v14;
      if (!v16)
      {
LABEL_29:
        unint64_t v22 = [(ACCNavigationProvider *)v43 delegatesImplementing:sel_navigation_accessoryAttached_];
        if ([v22 count])
        {
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          unint64_t v23 = v22;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v61 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v39 = v22;
            unint64_t v40 = v7;
            uint64_t v41 = v12;
            uint64_t v26 = *(void *)v46;
            v27 = &_os_log_internal;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v46 != v26) {
                  objc_enumerationMutation(v23);
                }
                int v29 = *(char **)(*((void *)&v45 + 1) + 8 * i);
                uint64_t v30 = gLogObjects;
                int v31 = gNumLogObjects;
                if (gLogObjects) {
                  BOOL v32 = gNumLogObjects < 1;
                }
                else {
                  BOOL v32 = 1;
                }
                if (v32)
                {
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    uint64_t v54 = v30;
                    __int16 v55 = 1024;
                    LODWORD(v56) = v31;
                    _os_log_error_impl(&dword_22605D000, v27, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  unint64_t v33 = v27;
                  unint64_t v34 = v27;
                }
                else
                {
                  unint64_t v34 = *(id *)gLogObjects;
                }
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138413058;
                  uint64_t v54 = (uint64_t)v42;
                  __int16 v55 = 2112;
                  id v56 = v44;
                  __int16 v57 = 2112;
                  id v58 = v41;
                  __int16 v59 = 2112;
                  BOOL v60 = v29;
                  _os_log_impl(&dword_22605D000, v34, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationStopRouteGuidance: accessory %@, accessory=%@ componentList=%@, delegate=%@", buf, 0x2Au);
                }

                [v29 navigation:v43 stopRouteGuidance:v44 componentList:v16];
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v45 objects:v61 count:16];
            }
            while (v25);
            unint64_t v22 = v39;
            unint64_t v7 = v40;
            v12 = v41;
          }
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            unint64_t v23 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
            }
            unint64_t v23 = &_os_log_internal;
            id v36 = &_os_log_internal;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v54 = (uint64_t)v42;
            __int16 v55 = 2112;
            id v56 = v44;
            __int16 v57 = 2112;
            id v58 = v12;
            _os_log_impl(&dword_22605D000, v23, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationStopRouteGuidance: accessory %@, accessory=%@ componentList=%@, no delgate found conforming to protocol", buf, 0x20u);
          }
        }

        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v15 = [v44 componentList];
      id v16 = [v15 allValues];

      if (!v16) {
        goto LABEL_29;
      }
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v62 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * j) setIsEnabled:0];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v49 objects:v62 count:16];
      }
      while (v19);
    }

    goto LABEL_29;
  }
  if (v10)
  {
    v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    v12 = &_os_log_internal;
    id v35 = &_os_log_internal;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[ACCNavigationProvider accessoryNavigationStopRouteGuidance:componentIdList:]();
  }
LABEL_62:

  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v37 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    uint64_t v37 = &_os_log_internal;
    id v38 = &_os_log_internal;
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v54 = (uint64_t)v42;
    __int16 v55 = 2112;
    id v56 = v44;
    __int16 v57 = 2112;
    id v58 = v7;
    __int16 v59 = 2080;
    BOOL v60 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
    _os_log_impl(&dword_22605D000, v37, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationStopRouteGuidance: accessory %@, accessory=%@ componentIdList=%@, file: %s", buf, 0x2Au);
  }
}

- (void)accessoryNavigationObjectDetection:(id)a3 componentIdList:(id)a4 updateInfo:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v8 = (id *)a3;
  id v9 = a4;
  int v10 = a5;
  long long v49 = self;
  int v11 = [(NSMutableDictionary *)self->_accessories objectForKey:v8];
  v12 = v11;
  unint64_t v13 = 0x26AB48000uLL;
  if (v11)
  {
    int v14 = [v11 objectDetectionComponentIdListIsEnabled:v9];
    if (gLogObjects) {
      BOOL v15 = gNumLogObjects <= 0;
    }
    else {
      BOOL v15 = 1;
    }
    int v16 = !v15;
    if (v14)
    {
      if (v16)
      {
        id v17 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
        }
        id v17 = &_os_log_internal;
        id v22 = &_os_log_internal;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v56 = v8;
        __int16 v57 = 2112;
        id v58 = v9;
        __int16 v59 = 2112;
        BOOL v60 = v10;
        _os_log_impl(&dword_22605D000, v17, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationObjectDetection: %@ componentIdList: %@ updateInfo: %@", buf, 0x20u);
      }

      uint64_t v20 = [v12 componentListForIdList:v9];
      unint64_t v23 = [(ACCNavigationProvider *)v49 delegatesImplementing:sel_navigationObjectDetection_accessoryAttached_];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v24 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
        }
        uint64_t v24 = &_os_log_internal;
        id v26 = &_os_log_internal;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413314;
        id v56 = v8;
        __int16 v57 = 2112;
        id v58 = v9;
        __int16 v59 = 2112;
        BOOL v60 = v10;
        __int16 v61 = 2112;
        v62 = v20;
        __int16 v63 = 2112;
        id v64 = v23;
        _os_log_debug_impl(&dword_22605D000, v24, OS_LOG_TYPE_DEBUG, "[#Navigation] accessoryNavigationObjectDetection: %@ componentIdList: %@ updateInfo: %@, componentList %@, delegateList %@", buf, 0x34u);
      }

      if ([(ACCNavigationRoadObjectDetectionInfo *)v23 count])
      {
        id v45 = v9;
        long long v46 = v8;
        long long v48 = objc_alloc_init(ACCNavigationRoadObjectDetectionInfo);
        v44 = v10;
        [(ACCNavigationRoadObjectDetectionInfo *)v48 setInfoFromDictionary:v10];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        uint64_t v43 = v23;
        obuint64_t j = v23;
        uint64_t v27 = [(ACCNavigationRoadObjectDetectionInfo *)obj countByEnumeratingWithState:&v50 objects:v54 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v51;
          uint64_t v30 = &_os_log_internal;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              BOOL v32 = v20;
              unint64_t v33 = v12;
              if (*(void *)v51 != v29) {
                objc_enumerationMutation(obj);
              }
              unint64_t v34 = *(NSObject **)(*((void *)&v50 + 1) + 8 * i);
              unint64_t v35 = v13;
              id v36 = *(id **)(v13 + 1992);
              int v37 = gNumLogObjects;
              if (v36) {
                BOOL v38 = gNumLogObjects < 1;
              }
              else {
                BOOL v38 = 1;
              }
              if (v38)
              {
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  id v56 = v36;
                  __int16 v57 = 1024;
                  LODWORD(v58) = v37;
                  _os_log_error_impl(&dword_22605D000, v30, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                uint64_t v39 = v30;
                unint64_t v40 = v30;
              }
              else
              {
                unint64_t v40 = *v36;
              }
              v12 = v33;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138413314;
                id v56 = v46;
                __int16 v57 = 2112;
                id v58 = v45;
                __int16 v59 = 2112;
                BOOL v60 = v33;
                __int16 v61 = 2112;
                v62 = v34;
                __int16 v63 = 2112;
                id v64 = v48;
                _os_log_impl(&dword_22605D000, v40, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationObjectDetection: %@ componentIdList %@, accessory %@, delegate %@, objectDetectionInfo %@", buf, 0x34u);
              }

              uint64_t v20 = v32;
              [v34 navigationObjectDetection:v49 accessory:v12 updateObjectDetectionInfo:v48 componentList:v32];
              unint64_t v13 = v35;
            }
            uint64_t v28 = [(ACCNavigationRoadObjectDetectionInfo *)obj countByEnumeratingWithState:&v50 objects:v54 count:16];
          }
          while (v28);
        }

        id v9 = v45;
        uint64_t v8 = v46;
        unint64_t v23 = v43;
        int v10 = v44;
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint64_t v41 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
          }
          uint64_t v41 = &_os_log_internal;
          id v42 = &_os_log_internal;
        }
        long long v48 = (ACCNavigationRoadObjectDetectionInfo *)v41;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          id v56 = v8;
          __int16 v57 = 2112;
          id v58 = v9;
          __int16 v59 = 2112;
          BOOL v60 = v10;
          __int16 v61 = 2112;
          v62 = v12;
          _os_log_impl(&dword_22605D000, v41, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationObjectDetection: %@ componentIdList: %@ updateInfo: %@, accessory=%@, no delgate found conforming to protocol", buf, 0x2Au);
        }
      }

      goto LABEL_70;
    }
    if (v16)
    {
      uint64_t v20 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      uint64_t v20 = &_os_log_internal;
      id v25 = &_os_log_internal;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v56 = v8;
      __int16 v57 = 2112;
      id v58 = v9;
      __int16 v59 = 2112;
      BOOL v60 = v10;
      __int16 v61 = 2112;
      v62 = v12;
      uint64_t v21 = "[#Navigation] accessoryNavigationObjectDetection: %@ componentIdList: %@ updateInfo: %@, accessory=%@, no co"
            "mponent is enabled!";
      goto LABEL_36;
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v18 = gNumLogObjects < 1;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      uint64_t v20 = &_os_log_internal;
      id v19 = &_os_log_internal;
    }
    else
    {
      uint64_t v20 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v56 = v8;
      __int16 v57 = 2112;
      id v58 = v9;
      __int16 v59 = 2112;
      BOOL v60 = v10;
      __int16 v61 = 2112;
      v62 = 0;
      uint64_t v21 = "[#Navigation] accessoryNavigationObjectDetection: %@ componentIdList: %@ updateInfo: %@, accessory=%@, acces"
            "sory does not exist!";
LABEL_36:
      _os_log_impl(&dword_22605D000, v20, OS_LOG_TYPE_INFO, v21, buf, 0x2Au);
    }
  }
LABEL_70:
}

- (void)routeGuidance:(id)a3 updateInfo:(id)a4 componentIdList:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (NSString *)a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    unint64_t v13 = &_os_log_internal;
    id v12 = &_os_log_internal;
  }
  else
  {
    unint64_t v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_22605D000, v13, OS_LOG_TYPE_INFO, "[#Navigation] routeGuidance: %@ updateInfo: %@ componentIdList: %@", (uint8_t *)&v19, 0x20u);
  }

  if (self->_remoteObject && [v8 componentIdListIsEnabled:v10])
  {
    remoteObject = self->_remoteObject;
    BOOL v15 = [v8 accessoryUID];
    int v16 = (void *)[(NSString *)v9 copyDictionary];
    [(ACCNavigationXPCServerProtocol *)remoteObject routeGuidance:v15 updateInfo:v16 componentIdList:v10];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      BOOL v15 = &_os_log_internal;
      id v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      int v19 = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = providerUID;
      _os_log_impl(&dword_22605D000, v15, OS_LOG_TYPE_DEFAULT, "[#Navigation] routeGuidance: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)routeGuidance:(id)a3 maneuverUpdateInfo:(id)a4 componentIdList:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (NSString *)a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    unint64_t v13 = &_os_log_internal;
    id v12 = &_os_log_internal;
  }
  else
  {
    unint64_t v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_22605D000, v13, OS_LOG_TYPE_INFO, "[#Navigation] routeGuidance: %@ maneuverUpdateInfo: %@ componentIdList: %@", (uint8_t *)&v19, 0x20u);
  }

  if (self->_remoteObject && [v8 componentIdListIsEnabled:v10])
  {
    remoteObject = self->_remoteObject;
    BOOL v15 = [v8 accessoryUID];
    int v16 = (void *)[(NSString *)v9 copyDictionary];
    [(ACCNavigationXPCServerProtocol *)remoteObject routeGuidance:v15 maneuverUpdateInfo:v16 componentIdList:v10];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      BOOL v15 = &_os_log_internal;
      id v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      int v19 = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = providerUID;
      _os_log_impl(&dword_22605D000, v15, OS_LOG_TYPE_DEFAULT, "[#Navigation] routeGuidance: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)routeGuidance:(id)a3 laneGuidanceInfo:(id)a4 componentIdList:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (NSString *)a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    unint64_t v13 = &_os_log_internal;
    id v12 = &_os_log_internal;
  }
  else
  {
    unint64_t v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_22605D000, v13, OS_LOG_TYPE_INFO, "[#Navigation] routeGuidance: %@ laneGuidanceInfo: %@ componentIdList: %@", (uint8_t *)&v19, 0x20u);
  }

  if (self->_remoteObject && [v8 componentIdListIsEnabled:v10])
  {
    remoteObject = self->_remoteObject;
    BOOL v15 = [v8 accessoryUID];
    int v16 = (void *)[(NSString *)v9 copyDictionary];
    [(ACCNavigationXPCServerProtocol *)remoteObject routeGuidance:v15 laneGuidanceInfo:v16 componentIdList:v10];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      BOOL v15 = &_os_log_internal;
      id v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      int v19 = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = providerUID;
      _os_log_impl(&dword_22605D000, v15, OS_LOG_TYPE_DEFAULT, "[#Navigation] routeGuidance: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)objectDetection:(id)a3 startComponentIdList:(id)a4 objectTypes:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (NSString *)a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    unint64_t v13 = &_os_log_internal;
    id v12 = &_os_log_internal;
  }
  else
  {
    unint64_t v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v41 = (uint64_t)v8;
    __int16 v42 = 2112;
    uint64_t v43 = v9;
    __int16 v44 = 2112;
    id v45 = v10;
    _os_log_impl(&dword_22605D000, v13, OS_LOG_TYPE_INFO, "[#Navigation] objectDetection: %@ startComponentIdList: %@ objectTypes: %@", buf, 0x20u);
  }

  if (self->_remoteObject)
  {
    BOOL v32 = self;
    unint64_t v33 = v9;
    id v34 = v10;
    int v14 = v8;
    BOOL v15 = [v8 objectDetectionComponentListForIdList:v9];
    int v16 = v15;
    if (v15)
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v36;
        id v20 = &_os_log_internal;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v36 != v19) {
              objc_enumerationMutation(v16);
            }
            id v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            uint64_t v23 = gLogObjects;
            int v24 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v25 = gNumLogObjects < 1;
            }
            else {
              BOOL v25 = 1;
            }
            if (v25)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v41 = v23;
                __int16 v42 = 1024;
                LODWORD(v43) = v24;
                _os_log_error_impl(&dword_22605D000, v20, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v26 = v20;
              uint64_t v27 = v20;
            }
            else
            {
              uint64_t v27 = *(id *)gLogObjects;
            }
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v41 = (uint64_t)v14;
              __int16 v42 = 2112;
              uint64_t v43 = v33;
              __int16 v44 = 2112;
              id v45 = v34;
              _os_log_impl(&dword_22605D000, v27, OS_LOG_TYPE_INFO, "[#Navigation] objectDetection: %@ startComponentIdList: %@ objectTypes: %@", buf, 0x20u);
            }

            [v22 setIsEnabled:1];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v18);
      }
    }
    remoteObject = v32->_remoteObject;
    id v8 = v14;
    uint64_t v29 = [v14 accessoryUID];
    id v9 = v33;
    id v10 = v34;
    [(ACCNavigationXPCServerProtocol *)remoteObject objectDetection:v29 startComponentIdList:v33 objectTypes:v34];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
      }
      int v16 = &_os_log_internal;
      id v30 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      *(_DWORD *)buf = 138412546;
      uint64_t v41 = (uint64_t)v8;
      __int16 v42 = 2112;
      uint64_t v43 = providerUID;
      _os_log_impl(&dword_22605D000, v16, OS_LOG_TYPE_DEFAULT, "[#Navigation] objectDetection: %@, _remoteObject nil, _providerUID=%@", buf, 0x16u);
    }
  }
}

- (void)objectDetection:(id)a3 stopComponentIdList:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = (unint64_t)a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    id v10 = &_os_log_internal;
    id v9 = &_os_log_internal;
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v6;
    __int16 v31 = 2112;
    BOOL v32 = (NSString *)v7;
    _os_log_impl(&dword_22605D000, v10, OS_LOG_TYPE_INFO, "[#Navigation] objectDetection: %@ stopComponentIdList: %@", buf, 0x16u);
  }

  if (self->_remoteObject && [v6 objectDetectionComponentIdListIsEnabled:v7])
  {
    uint64_t v11 = [v6 objectDetectionComponentListForIdList:v7];
    id v12 = v11;
    if (v7 | v11)
    {
      id v14 = (id)v11;
      if (!v14)
      {
LABEL_33:
        remoteObject = self->_remoteObject;
        uint64_t v23 = objc_msgSend(v6, "accessoryUID", (void)v24);
        [(ACCNavigationXPCServerProtocol *)remoteObject objectDetection:v23 stopComponentIdList:v7];

        goto LABEL_34;
      }
    }
    else
    {
      unint64_t v13 = [v6 objectDetectionComponentList];
      id v14 = [v13 allValues];

      if (!v14) {
        goto LABEL_33;
      }
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v17 = v14;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "setIsEnabled:", 0, (void)v24);
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v19);
    }

    goto LABEL_33;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]();
    }
    id v12 = &_os_log_internal;
    id v15 = &_os_log_internal;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    providerUID = self->_providerUID;
    *(_DWORD *)buf = 138412546;
    id v30 = v6;
    __int16 v31 = 2112;
    BOOL v32 = providerUID;
    _os_log_impl(&dword_22605D000, v12, OS_LOG_TYPE_DEFAULT, "[#Navigation] objectDetection: %@, _remoteObject nil, _providerUID=%@", buf, 0x16u);
  }
LABEL_34:
}

- (id)accessoryForUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_accessories objectForKey:a3];
}

- (NSString)providerUID
{
  return self->_providerUID;
}

- (void)setProviderUID:(id)a3
{
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (ACCNavigationXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (NSMutableDictionary)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
}

- (NSMutableArray)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_providerUID, 0);
}

- (void)delegatesImplementing:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  sel_getName(a1);
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22605D000, a3, OS_LOG_TYPE_DEBUG, "[#Navigation] delegatesImplementing: selector=%s, result delegateList=%@", v4, 0x16u);
}

- (void)accessoryNavigationAttached:(os_log_t)log componentList:.cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  __int16 v7 = 2080;
  BOOL v8 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
  _os_log_error_impl(&dword_22605D000, log, OS_LOG_TYPE_ERROR, "[#Navigation] accessoryNavigationAttached: accessory %@ (%@) already exists! file: %s", (uint8_t *)&v3, 0x20u);
}

- (void)accessoryNavigationDetached:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v2 = 2080;
  int v3 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
  _os_log_debug_impl(&dword_22605D000, v0, OS_LOG_TYPE_DEBUG, "[#Navigation] exiting accessoryNavigationDetached: accessory %@, _accessories=%@, file:%s", v1, 0x20u);
}

- (void)accessoryNavigationDetached:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0;
  _os_log_error_impl(&dword_22605D000, a2, OS_LOG_TYPE_ERROR, "[#Navigation] accessoryNavigationDetached: accessory %@ (%@) does not exist!", (uint8_t *)&v2, 0x16u);
}

- (void)accessoryNavigationStartRouteGuidance:componentIdList:options:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  int v2 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
  _os_log_error_impl(&dword_22605D000, v0, OS_LOG_TYPE_ERROR, "[#Navigation] accessoryNavigationStartRouteGuidance: accessory %@ (%@) does not exist! file: %s", v1, 0x20u);
}

- (void)accessoryNavigationStopRouteGuidance:componentIdList:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  int v2 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
  _os_log_error_impl(&dword_22605D000, v0, OS_LOG_TYPE_ERROR, "[#Navigation] accessoryNavigationStopRouteGuidance: accessory %@ (%@) does not exist! file: %s", v1, 0x20u);
}

@end