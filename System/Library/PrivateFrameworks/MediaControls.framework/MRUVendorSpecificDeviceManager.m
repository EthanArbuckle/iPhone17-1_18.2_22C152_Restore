@interface MRUVendorSpecificDeviceManager
- (BOOL)isGroupingAvailableFor:(id)a3 activatedIDs:(id)a4 forProtocolID:(id)a5;
- (BOOL)isGroupingAvailableForDevice:(id)a3;
- (BOOL)resolverAddNativeRoute:(id)a3 forRouteUID:(id)a4;
- (DADeviceResolver)resolver;
- (DADiscovery)discovery;
- (MRUVendorSpecificDeviceManager)initWithAppBundleID:(id)a3 serviceIdentifiers:(id)a4;
- (MRUVendorSpecificDeviceManagerDelegate)delegate;
- (NSArray)activatedDeviceIDs;
- (NSArray)activatingDeviceIDs;
- (NSArray)availableDeviceIDs;
- (NSArray)coalescedDevices;
- (NSArray)devices;
- (NSArray)invalidatingDeviceIDs;
- (NSArray)pendingDeviceIDs;
- (NSArray)resolverManagedAirPlayRouteIDs;
- (NSArray)serviceIdentifiers;
- (NSMutableDictionary)activatedDeviceMap;
- (NSMutableDictionary)activatingDeviceMap;
- (NSMutableDictionary)coalescedDeviceMap;
- (NSMutableDictionary)deviceMap;
- (NSMutableDictionary)groupableDeviceIDs;
- (NSMutableDictionary)invalidatingDeviceMap;
- (NSMutableSet)mutableResolverManagedAirPlayRouteIDs;
- (NSString)appBundleID;
- (int64_t)latestStateForDevice:(id)a3;
- (void)connectToDevice:(id)a3;
- (void)dealloc;
- (void)disconnectAllDevices;
- (void)handleDiscoveryEvent:(id)a3;
- (void)handleResolverEvent:(id)a3;
- (void)resolverAddNativeRoutes:(id)a3;
- (void)resolverAddVendorSpecificDevice:(id)a3;
- (void)resolverRemoveNativeRouteforRouteUID:(id)a3;
- (void)resolverRemoveNativeRoutes:(id)a3;
- (void)resolverRemoveVendorSpecificRoute:(id)a3;
- (void)resolverSetLastSelectedRoute:(id)a3;
- (void)setActivatedDeviceMap:(id)a3;
- (void)setActivatingDeviceMap:(id)a3;
- (void)setAppBundleID:(id)a3;
- (void)setCoalescedDeviceMap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3 picked:(BOOL)a4;
- (void)setDeviceMap:(id)a3;
- (void)setDiscovery:(id)a3;
- (void)setGroupableDeviceIDs:(id)a3;
- (void)setInvalidatingDeviceMap:(id)a3;
- (void)setMutableResolverManagedAirPlayRouteIDs:(id)a3;
- (void)setResolver:(id)a3;
- (void)setServiceIdentifiers:(id)a3;
- (void)startDiscovery;
- (void)stopDiscovery;
- (void)updateLocalMapWith:(id)a3 deviceIsLost:(BOOL)a4;
@end

@implementation MRUVendorSpecificDeviceManager

- (MRUVendorSpecificDeviceManager)initWithAppBundleID:(id)a3 serviceIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)MRUVendorSpecificDeviceManager;
  v9 = [(MRUVendorSpecificDeviceManager *)&v31 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appBundleID, a3);
    objc_storeStrong((id *)&v10->_serviceIdentifiers, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceMap = v10->_deviceMap;
    v10->_deviceMap = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    coalescedDeviceMap = v10->_coalescedDeviceMap;
    v10->_coalescedDeviceMap = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activatingDeviceMap = v10->_activatingDeviceMap;
    v10->_activatingDeviceMap = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activatedDeviceMap = v10->_activatedDeviceMap;
    v10->_activatedDeviceMap = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    invalidatingDeviceMap = v10->_invalidatingDeviceMap;
    v10->_invalidatingDeviceMap = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    groupableDeviceIDs = v10->_groupableDeviceIDs;
    v10->_groupableDeviceIDs = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    mutableResolverManagedAirPlayRouteIDs = v10->_mutableResolverManagedAirPlayRouteIDs;
    v10->_mutableResolverManagedAirPlayRouteIDs = v23;

    v25 = (DADeviceResolver *)objc_alloc_init(MEMORY[0x1E4F5F2A8]);
    resolver = v10->_resolver;
    v10->_resolver = v25;

    [(DADeviceResolver *)v10->_resolver setBundleID:v7];
    objc_initWeak(&location, v10);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __73__MRUVendorSpecificDeviceManager_initWithAppBundleID_serviceIdentifiers___block_invoke;
    v28[3] = &unk_1E5F0E170;
    objc_copyWeak(&v29, &location);
    [(DADeviceResolver *)v10->_resolver setEventHandler:v28];
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __73__MRUVendorSpecificDeviceManager_initWithAppBundleID_serviceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleResolverEvent:v3];
}

- (NSArray)devices
{
  if ([(NSMutableDictionary *)self->_deviceMap count])
  {
    id v3 = [(NSMutableDictionary *)self->_deviceMap allValues];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v3;
}

- (NSArray)coalescedDevices
{
  if ([(NSMutableDictionary *)self->_coalescedDeviceMap count])
  {
    id v3 = [(NSMutableDictionary *)self->_coalescedDeviceMap allValues];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v3;
}

- (NSArray)activatedDeviceIDs
{
  if ([(NSMutableDictionary *)self->_activatedDeviceMap count])
  {
    id v3 = [(NSMutableDictionary *)self->_activatedDeviceMap allValues];
    v4 = objc_msgSend(v3, "msv_map:", &__block_literal_global_9);
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

uint64_t __52__MRUVendorSpecificDeviceManager_activatedDeviceIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (NSArray)activatingDeviceIDs
{
  if ([(NSMutableDictionary *)self->_activatingDeviceMap count])
  {
    id v3 = [(NSMutableDictionary *)self->_activatingDeviceMap allValues];
    v4 = objc_msgSend(v3, "msv_map:", &__block_literal_global_5);
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

uint64_t __53__MRUVendorSpecificDeviceManager_activatingDeviceIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (NSArray)invalidatingDeviceIDs
{
  if ([(NSMutableDictionary *)self->_invalidatingDeviceMap count])
  {
    id v3 = [(NSMutableDictionary *)self->_invalidatingDeviceMap allValues];
    v4 = objc_msgSend(v3, "msv_map:", &__block_literal_global_7_0);
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

uint64_t __55__MRUVendorSpecificDeviceManager_invalidatingDeviceIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (NSArray)pendingDeviceIDs
{
  id v3 = [(MRUVendorSpecificDeviceManager *)self activatingDeviceIDs];
  v4 = [(MRUVendorSpecificDeviceManager *)self invalidatingDeviceIDs];
  v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v5;
}

- (NSArray)availableDeviceIDs
{
  v2 = [(MRUVendorSpecificDeviceManager *)self deviceMap];
  id v3 = [v2 allValues];
  v4 = objc_msgSend(v3, "msv_map:", &__block_literal_global_9);

  return (NSArray *)v4;
}

uint64_t __52__MRUVendorSpecificDeviceManager_availableDeviceIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (NSArray)resolverManagedAirPlayRouteIDs
{
  return (NSArray *)[(NSMutableSet *)self->_mutableResolverManagedAirPlayRouteIDs allObjects];
}

- (int64_t)latestStateForDevice:(id)a3
{
  id v4 = a3;
  deviceMap = self->_deviceMap;
  v6 = [v4 identifier];
  id v7 = [(NSMutableDictionary *)deviceMap objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = self->_deviceMap;
    v9 = [v4 identifier];
    v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
    int64_t v11 = [v10 state];
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (BOOL)isGroupingAvailableForDevice:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 supportsGrouping])
  {
    groupableDeviceIDs = self->_groupableDeviceIDs;
    v6 = [v4 protocolType];
    id v7 = [v6 identifier];
    id v8 = [(NSMutableDictionary *)groupableDeviceIDs objectForKeyedSubscript:v7];

    if (v8 && (unint64_t)[v8 count] >= 2)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
            uint64_t v15 = [v14 state];

            if (v15 == 20)
            {
              BOOL v16 = 1;
              id v8 = v9;
              goto LABEL_16;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      BOOL v16 = 0;
LABEL_16:
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)isGroupingAvailableFor:(id)a3 activatedIDs:(id)a4 forProtocolID:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_groupableDeviceIDs objectForKeyedSubscript:v10];
    if (v11)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        id v20 = v10;
        id v21 = v8;
        unsigned __int8 v14 = 0;
        char v15 = 0;
        uint64_t v16 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            if (objc_msgSend(v11, "containsObject:", v18, v20, v21, (void)v22))
            {
              ++v14;
              if ([v9 containsObject:v18]) {
                char v15 = 1;
              }
              if (v14 >= 2u && v15)
              {
                LOBYTE(v13) = 1;
                goto LABEL_19;
              }
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v13) {
            continue;
          }
          break;
        }
LABEL_19:
        id v10 = v20;
        id v8 = v21;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (void)startDiscovery
{
  if (!self->_discovery)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F5F2B8]);
    [v3 setBundleID:self->_appBundleID];
    [v3 setBluetoothServices:MEMORY[0x1E4F1CBF0]];
    id v4 = (DADiscovery *)[objc_alloc(MEMORY[0x1E4F5F2B0]) initWithConfiguration:v3 error:0];
    discovery = self->_discovery;
    self->_discovery = v4;

    objc_initWeak(&location, self);
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __48__MRUVendorSpecificDeviceManager_startDiscovery__block_invoke;
    id v9 = &unk_1E5F0E170;
    objc_copyWeak(&v10, &location);
    [(DADiscovery *)self->_discovery setEventHandler:&v6];
    [(DADiscovery *)self->_discovery activate];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __48__MRUVendorSpecificDeviceManager_startDiscovery__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleDiscoveryEvent:v3];
}

- (void)updateLocalMapWith:(id)a3 deviceIsLost:(BOOL)a4
{
  BOOL v4 = a4;
  id v54 = a3;
  deviceMap = self->_deviceMap;
  uint64_t v7 = [v54 identifier];
  if (v4)
  {
    [(NSMutableDictionary *)deviceMap setObject:0 forKeyedSubscript:v7];

    activatingDeviceMap = self->_activatingDeviceMap;
    id v9 = [v54 identifier];
    [(NSMutableDictionary *)activatingDeviceMap setObject:0 forKeyedSubscript:v9];

    activatedDeviceMap = self->_activatedDeviceMap;
    uint64_t v11 = [v54 identifier];
    [(NSMutableDictionary *)activatedDeviceMap setObject:0 forKeyedSubscript:v11];

    invalidatingDeviceMap = self->_invalidatingDeviceMap;
    uint64_t v13 = [v54 identifier];
    [(NSMutableDictionary *)invalidatingDeviceMap setObject:0 forKeyedSubscript:v13];

    groupableDeviceIDs = self->_groupableDeviceIDs;
    char v15 = [v54 protocolType];
    uint64_t v16 = [v15 identifier];
    v17 = [(NSMutableDictionary *)groupableDeviceIDs objectForKeyedSubscript:v16];
    uint64_t v18 = [v54 identifier];
    [v17 removeObject:v18];

LABEL_22:
    v33 = v54;
    goto LABEL_23;
  }
  [(NSMutableDictionary *)deviceMap setObject:v54 forKeyedSubscript:v7];

  int v19 = [v54 supportsGrouping];
  id v20 = self->_groupableDeviceIDs;
  id v21 = [v54 protocolType];
  long long v22 = [v21 identifier];
  long long v23 = [(NSMutableDictionary *)v20 objectForKeyedSubscript:v22];
  long long v24 = v23;
  if (v19)
  {

    if (!v24)
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v26 = self->_groupableDeviceIDs;
      uint64_t v27 = [v54 protocolType];
      v28 = [v27 identifier];
      [(NSMutableDictionary *)v26 setObject:v25 forKeyedSubscript:v28];
    }
    id v29 = self->_groupableDeviceIDs;
    id v21 = [v54 protocolType];
    long long v22 = [v21 identifier];
    long long v24 = [(NSMutableDictionary *)v29 objectForKeyedSubscript:v22];
    v30 = [v54 identifier];
    [v24 addObject:v30];
  }
  else
  {
    v30 = [v54 identifier];
    [v24 removeObject:v30];
  }

  uint64_t v31 = [v54 state];
  if (v31 <= 19)
  {
    if (v31)
    {
      BOOL v32 = v31 == 10;
      v33 = v54;
      if (!v32) {
        goto LABEL_23;
      }
      v34 = self->_activatingDeviceMap;
      v35 = [v54 identifier];
      v36 = v34;
      id v37 = v54;
    }
    else
    {
      v45 = self->_activatingDeviceMap;
      v35 = [v54 identifier];
      v36 = v45;
      id v37 = 0;
    }
    [(NSMutableDictionary *)v36 setObject:v37 forKeyedSubscript:v35];

    v46 = self->_activatedDeviceMap;
    v47 = [v54 identifier];
    v48 = v46;
    id v49 = 0;
    goto LABEL_20;
  }
  if (v31 == 20)
  {
    v50 = self->_activatingDeviceMap;
    v51 = [v54 identifier];
    [(NSMutableDictionary *)v50 setObject:0 forKeyedSubscript:v51];

    v52 = self->_activatedDeviceMap;
    v47 = [v54 identifier];
    v48 = v52;
    id v49 = v54;
LABEL_20:
    [(NSMutableDictionary *)v48 setObject:v49 forKeyedSubscript:v47];

    v53 = self->_invalidatingDeviceMap;
    char v15 = [v54 identifier];
    v43 = v53;
    id v44 = 0;
    goto LABEL_21;
  }
  BOOL v32 = v31 == 30;
  v33 = v54;
  if (v32)
  {
    v38 = self->_activatingDeviceMap;
    v39 = [v54 identifier];
    [(NSMutableDictionary *)v38 setObject:0 forKeyedSubscript:v39];

    v40 = self->_activatedDeviceMap;
    v41 = [v54 identifier];
    [(NSMutableDictionary *)v40 setObject:0 forKeyedSubscript:v41];

    v42 = self->_invalidatingDeviceMap;
    char v15 = [v54 identifier];
    v43 = v42;
    id v44 = v54;
LABEL_21:
    [(NSMutableDictionary *)v43 setObject:v44 forKeyedSubscript:v15];
    goto LABEL_22;
  }
LABEL_23:
}

- (void)resolverSetLastSelectedRoute:(id)a3
{
  id v14 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v14;
    id v5 = objc_alloc_init(MEMORY[0x1E4F5F2C0]);
    if ([v4 isAirPlayRoute])
    {
      uint64_t v6 = [v4 underlyingNativeRoute];
      uint64_t v7 = [v6 routeUID];
      if (v7)
      {
        id v8 = (void *)v7;
        id v9 = [NSString stringWithFormat:@"%@-AirPlay", v7];
        [v5 setIdentifier:v9];

        [(DADeviceResolver *)self->_resolver selectEndpoint:v5];
      }
      goto LABEL_9;
    }
    id v12 = [v4 device];
    uint64_t v6 = [v12 identifier];

    if (v6)
    {
      uint64_t v13 = [NSString stringWithFormat:@"%@-DeviceAccess", v6];
      [v5 setIdentifier:v13];

      [(DADeviceResolver *)self->_resolver selectEndpoint:v5];
LABEL_9:
    }
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F5F2C0]);
    uint64_t v10 = [v14 routeUID];
    if (!v10) {
      goto LABEL_11;
    }
    id v5 = (id)v10;
    uint64_t v11 = [NSString stringWithFormat:@"%@-AirPlay", v10];
    [v4 setIdentifier:v11];

    [(DADeviceResolver *)self->_resolver selectEndpoint:v4];
  }

LABEL_11:
}

- (void)resolverAddNativeRoutes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 138412546;
    long long v15 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "routeUID", v15);
        if (v11)
        {
          if ([(MRUVendorSpecificDeviceManager *)self resolverAddNativeRoute:v10 forRouteUID:v11])
          {
            [(NSMutableSet *)self->_mutableResolverManagedAirPlayRouteIDs addObject:v11];
          }
          else
          {
            id v12 = MCLogCategoryDeviceAccess();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = [v10 routeName];
              id v14 = [v10 dnsNames];
              *(_DWORD *)buf = v15;
              id v21 = v13;
              __int16 v22 = 2112;
              long long v23 = v14;
              _os_log_impl(&dword_1AE7DF000, v12, OS_LOG_TYPE_DEFAULT, "Resolver: not able to find a proper dnsName for route: %@, its DNS Names are: %@", buf, 0x16u);
            }
            [(NSMutableSet *)self->_mutableResolverManagedAirPlayRouteIDs removeObject:v11];
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v7);
  }
}

- (void)resolverRemoveNativeRoutes:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) routeUID];
        if (v9)
        {
          [(MRUVendorSpecificDeviceManager *)self resolverRemoveNativeRouteforRouteUID:v9];
          [(NSMutableSet *)self->_mutableResolverManagedAirPlayRouteIDs removeObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)resolverAddVendorSpecificDevice:(id)a3
{
  id v12 = a3;
  id v4 = [v12 identifier];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F5F2C0]);
    uint64_t v6 = [NSString stringWithFormat:@"%@-DeviceAccess", v4];
    [v5 setIdentifier:v6];

    uint64_t v7 = [v12 name];
    [v5 setName:v7];

    uint64_t v8 = [v12 protocolType];
    id v9 = [v8 identifier];
    [v5 setProtocolTypeString:v9];

    [v5 setUnderlyingDADevice:v12];
    long long v10 = [v12 networkEndpoint];
    long long v11 = [v10 description];
    [v5 setBonjourFullName:v11];

    [(DADeviceResolver *)self->_resolver addEndpoint:v5];
  }
}

- (void)resolverRemoveVendorSpecificRoute:(id)a3
{
  id v6 = [a3 identifier];
  if (v6)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F5F2C0]);
    id v5 = [NSString stringWithFormat:@"%@-DeviceAccess", v6];
    [v4 setIdentifier:v5];

    [(DADeviceResolver *)self->_resolver removeEndpoint:v4];
  }
}

- (BOOL)resolverAddNativeRoute:(id)a3 forRouteUID:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  [v8 dnsNames];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v44 = [v9 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v44)
  {
    v39 = self;
    uint64_t v45 = *(void *)v57;
    unint64_t v10 = 0x1E4F5F000uLL;
    v40 = v8;
    id v43 = v9;
    while (2)
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v57 != v45) {
          objc_enumerationMutation(v9);
        }
        id v12 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        if ([v12 containsString:@"_airplay._tcp"])
        {
          long long v13 = MCLogCategoryDeviceAccess();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v63 = v12;
            _os_log_impl(&dword_1AE7DF000, v13, OS_LOG_TYPE_DEFAULT, "dnsName: %@", buf, 0xCu);
          }

          id v14 = objc_alloc_init(*(Class *)(v10 + 704));
          [v14 setAirplayDeviceID:v7];
          uint64_t v15 = [v12 componentsSeparatedByString:@"\x1E"];
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v16 = v15;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v61 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v46 = *(void *)v53;
            id v41 = v7;
            v42 = v16;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v53 != v46) {
                  objc_enumerationMutation(v16);
                }
                id v20 = *(void **)(*((void *)&v52 + 1) + 8 * j);
                if (([v20 containsString:@":"] & 1) != 0
                  || ![v20 containsString:@".local."])
                {
                  __int16 v22 = MCLogCategoryDeviceAccess();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v63 = v20;
                    _os_log_impl(&dword_1AE7DF000, v22, OS_LOG_TYPE_DEFAULT, "AirPlay DNSName Parsing: Skip wrong string: %@", buf, 0xCu);
                  }
                }
                else
                {
                  id v21 = [v20 componentsSeparatedByString:@"%"];
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v50 = 0u;
                  long long v51 = 0u;
                  __int16 v22 = v21;
                  uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v60 count:16];
                  if (v23)
                  {
                    uint64_t v24 = v23;
                    uint64_t v25 = *(void *)v49;
                    while (2)
                    {
                      for (uint64_t k = 0; k != v24; ++k)
                      {
                        if (*(void *)v49 != v25) {
                          objc_enumerationMutation(v22);
                        }
                        uint64_t v27 = *(void **)(*((void *)&v48 + 1) + 8 * k);
                        if ([v27 containsString:@".local."])
                        {
                          [v14 setBonjourFullName:v27];
                          [v14 setProtocolTypeString:@"com.apple.airplay"];
                          id v8 = v40;
                          BOOL v32 = [v40 routeName];
                          [v14 setName:v32];

                          id v7 = v41;
                          v33 = [NSString stringWithFormat:@"%@-AirPlay", v41];
                          [v14 setIdentifier:v33];

                          [(DADeviceResolver *)v39->_resolver addEndpoint:v14];
                          id v9 = v43;
                          goto LABEL_35;
                        }
                      }
                      uint64_t v24 = [v22 countByEnumeratingWithState:&v48 objects:v60 count:16];
                      if (v24) {
                        continue;
                      }
                      break;
                    }
                  }

                  unint64_t v10 = 0x1E4F5F000;
                  id v16 = v42;
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v52 objects:v61 count:16];
              id v7 = v41;
            }
            while (v18);
          }

          id v9 = v43;
        }
        else
        {
          v28 = [v12 componentsSeparatedByString:@":"];
          id v29 = [v28 objectAtIndexedSubscript:0];

          id v14 = v29;
          v30 = (const char *)[v14 UTF8String];
          int v47 = 0;
          if (inet_pton(2, v30, &v47) >= 1)
          {
            v35 = MCLogCategoryDeviceAccess();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v63 = v14;
              _os_log_impl(&dword_1AE7DF000, v35, OS_LOG_TYPE_DEFAULT, "found IPv4 address: %@", buf, 0xCu);
            }

            id v36 = objc_alloc_init(*(Class *)(v10 + 704));
            [v36 setAirplayDeviceID:v7];
            [v36 setProtocolTypeString:@"com.apple.airplay"];
            id v8 = v40;
            id v37 = [v40 routeName];
            [v36 setName:v37];

            v38 = [NSString stringWithFormat:@"%@-AirPlay", v7];
            [v36 setIdentifier:v38];

            [v36 setIpv4String:v14];
            [(DADeviceResolver *)v39->_resolver addEndpoint:v36];

LABEL_35:
            BOOL v31 = 1;
            goto LABEL_37;
          }
        }
      }
      BOOL v31 = 0;
      id v8 = v40;
      uint64_t v44 = [v9 countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (v44) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v31 = 0;
  }
LABEL_37:

  return v31;
}

- (void)resolverRemoveNativeRouteforRouteUID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F5F2C0];
  id v5 = a3;
  id v7 = objc_alloc_init(v4);
  id v6 = [NSString stringWithFormat:@"%@-AirPlay", v5];

  [v7 setIdentifier:v6];
  [(DADeviceResolver *)self->_resolver removeEndpoint:v7];
}

- (void)connectToDevice:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 supportsGrouping])
  {
    groupableDeviceIDs = self->_groupableDeviceIDs;
    id v6 = [v4 protocolType];
    id v7 = [v6 identifier];
    id v8 = [(NSMutableDictionary *)groupableDeviceIDs objectForKeyedSubscript:v7];
  }
  else
  {
    id v8 = 0;
  }
  __int16 v22 = v4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = [(MRUVendorSpecificDeviceManager *)self devices];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v14 state] == 10 || objc_msgSend(v14, "state") == 20)
        {
          uint64_t v15 = [v14 identifier];
          char v16 = [v8 containsObject:v15];

          if ((v16 & 1) == 0)
          {
            uint64_t v17 = MCLogCategoryDeviceAccess();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              [v14 state];
              uint64_t v18 = DADeviceStateToString();
              *(_DWORD *)buf = 138412546;
              BOOL v32 = v18;
              __int16 v33 = 2112;
              v34 = v14;
              _os_log_impl(&dword_1AE7DF000, v17, OS_LOG_TYPE_DEFAULT, "Automatically unselecting %@ vendor specific device: %@", buf, 0x16u);
            }
            [(DADiscovery *)self->_discovery setState:30 device:v14 completionHandler:&__block_literal_global_39];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v11);
  }

  discovery = self->_discovery;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __50__MRUVendorSpecificDeviceManager_connectToDevice___block_invoke_40;
  v23[3] = &unk_1E5F0E1D8;
  id v24 = v22;
  id v25 = v8;
  v26 = self;
  id v20 = v8;
  id v21 = v22;
  [(DADiscovery *)discovery getAuthorizedDevices:v23];
}

void __50__MRUVendorSpecificDeviceManager_connectToDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "set state error: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __50__MRUVendorSpecificDeviceManager_connectToDevice___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v29 = [v3 count];
    __int16 v30 = 2112;
    id v31 = v3;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%lu authorized devices to unselect first, %@", buf, 0x16u);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v24;
    *(void *)&long long v7 = 138412290;
    long long v22 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        if (objc_msgSend(v11, "state", v22, (void)v23) == 25
          && ([v11 identifier],
              uint64_t v12 = objc_claimAutoreleasedReturnValue(),
              [*(id *)(a1 + 32) identifier],
              long long v13 = objc_claimAutoreleasedReturnValue(),
              char v14 = [v12 isEqualToString:v13],
              v13,
              v12,
              (v14 & 1) == 0))
        {
          char v16 = *(void **)(a1 + 40);
          uint64_t v17 = [v11 identifier];
          LOBYTE(v16) = [v16 containsObject:v17];

          if ((v16 & 1) == 0)
          {
            uint64_t v18 = MCLogCategoryDeviceAccess();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v22;
              uint64_t v29 = (uint64_t)v11;
              _os_log_impl(&dword_1AE7DF000, v18, OS_LOG_TYPE_DEFAULT, "Automatically unselecting authorized vendor specific device: %@", buf, 0xCu);
            }

            [*(id *)(*(void *)(a1 + 48) + 32) setState:30 device:v11 completionHandler:&__block_literal_global_43];
          }
        }
        else
        {
          uint64_t v15 = MCLogCategoryDeviceAccess();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v22;
            uint64_t v29 = (uint64_t)v11;
            _os_log_impl(&dword_1AE7DF000, v15, OS_LOG_TYPE_DEFAULT, "Did not unselect authorized device: %@", buf, 0xCu);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v19 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v8 = v19;
    }
    while (v19);
  }

  id v20 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v29 = v21;
    _os_log_impl(&dword_1AE7DF000, v20, OS_LOG_TYPE_DEFAULT, "Connecting to picked device: %@", buf, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 48) + 32) setState:10 device:*(void *)(a1 + 32) completionHandler:&__block_literal_global_46];
}

void __50__MRUVendorSpecificDeviceManager_connectToDevice___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "set state error: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __50__MRUVendorSpecificDeviceManager_connectToDevice___block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "set state error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)disconnectAllDevices
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "Unselecting all vendor specific devices", buf, 2u);
  }

  discovery = self->_discovery;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__MRUVendorSpecificDeviceManager_disconnectAllDevices__block_invoke;
  v15[3] = &unk_1E5F0E200;
  v15[4] = self;
  [(DADiscovery *)discovery getAuthorizedDevices:v15];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(MRUVendorSpecificDeviceManager *)self devices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 state] == 10 || objc_msgSend(v10, "state") == 20) {
          [(DADiscovery *)self->_discovery setState:30 device:v10 completionHandler:&__block_literal_global_50];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v7);
  }
}

void __54__MRUVendorSpecificDeviceManager_disconnectAllDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 state] == 25)
        {
          long long v12 = *(void **)(*(void *)(a1 + 32) + 32);
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __54__MRUVendorSpecificDeviceManager_disconnectAllDevices__block_invoke_2;
          v13[3] = &unk_1E5F0DB80;
          id v14 = v6;
          [v12 setState:30 device:v11 completionHandler:v13];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

void __54__MRUVendorSpecificDeviceManager_disconnectAllDevices__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1AE7DF000, v2, OS_LOG_TYPE_DEFAULT, "set state error: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __54__MRUVendorSpecificDeviceManager_disconnectAllDevices__block_invoke_48(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "set state error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)stopDiscovery
{
  [(DADiscovery *)self->_discovery invalidate];
  [(NSMutableDictionary *)self->_deviceMap removeAllObjects];
  discovery = self->_discovery;
  self->_discovery = 0;
}

- (void)setDevice:(id)a3 picked:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 name];
    int v14 = 138412290;
    long long v15 = v7;
    _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "setting picked for device: %@", (uint8_t *)&v14, 0xCu);
  }
  deviceMap = self->_deviceMap;
  uint64_t v9 = [v5 identifier];
  uint64_t v10 = [(NSMutableDictionary *)deviceMap objectForKeyedSubscript:v9];

  if (!v10)
  {
    long long v12 = MCLogCategoryDeviceAccess();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1AE7DF000, v12, OS_LOG_TYPE_DEFAULT, "Picked device from UI is not found in the device map, some discrepancy happened", (uint8_t *)&v14, 2u);
    }
    goto LABEL_15;
  }
  uint64_t v11 = [v10 state];
  if (v11 > 19)
  {
    if (v11 == 20)
    {
      [(DADiscovery *)self->_discovery setState:30 device:v10 completionHandler:&__block_literal_global_52];
      goto LABEL_18;
    }
    if (v11 != 25)
    {
      if (v11 != 30) {
        goto LABEL_18;
      }
      goto LABEL_13;
    }
LABEL_16:
    [(MRUVendorSpecificDeviceManager *)self connectToDevice:v10];
    goto LABEL_18;
  }
  if (!v11) {
    goto LABEL_16;
  }
  if (v11 == 10)
  {
LABEL_13:
    long long v12 = MCLogCategoryDeviceAccess();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      [v10 state];
      long long v13 = DADeviceStateToString();
      int v14 = 138412290;
      long long v15 = v13;
      _os_log_impl(&dword_1AE7DF000, v12, OS_LOG_TYPE_DEFAULT, "Not sending the pick event again because device is already in a pending state: %@", (uint8_t *)&v14, 0xCu);
    }
LABEL_15:
  }
LABEL_18:
}

void __51__MRUVendorSpecificDeviceManager_setDevice_picked___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "set state error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)handleResolverEvent:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 eventType];
  switch(v5)
  {
    case '*':
      uint64_t v7 = [v4 device];
      long long v22 = MCLogCategoryDeviceAccess();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = [v7 endpoints];
        *(_DWORD *)buf = 138412546;
        v38 = v7;
        __int16 v39 = 2048;
        uint64_t v40 = [v23 count];
        _os_log_impl(&dword_1AE7DF000, v22, OS_LOG_TYPE_DEFAULT, "Resolver - device changed %@, %lu endpoints", buf, 0x16u);
      }
      goto LABEL_24;
    case ')':
      uint64_t v7 = [v4 device];
      if (v7)
      {
        long long v24 = MCLogCategoryDeviceAccess();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          long long v25 = [v7 endpoints];
          *(_DWORD *)buf = 138412546;
          v38 = v7;
          __int16 v39 = 2048;
          uint64_t v40 = [v25 count];
          _os_log_impl(&dword_1AE7DF000, v24, OS_LOG_TYPE_DEFAULT, "Resolver - device lost %@, %lu endpoints", buf, 0x16u);
        }
        coalescedDeviceMap = self->_coalescedDeviceMap;
        long long v27 = [v7 identifier];
        [(NSMutableDictionary *)coalescedDeviceMap setObject:0 forKeyedSubscript:v27];

        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __54__MRUVendorSpecificDeviceManager_handleResolverEvent___block_invoke_56;
        v30[3] = &unk_1E5F0D7F8;
        v30[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], v30);
      }
      goto LABEL_24;
    case '(':
      uint64_t v6 = [v4 device];
      uint64_t v7 = v6;
      if (v6)
      {
        long long v28 = self;
        uint64_t v8 = self->_coalescedDeviceMap;
        uint64_t v9 = [v6 identifier];
        [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];

        uint64_t v10 = MCLogCategoryDeviceAccess();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [v7 endpoints];
          *(_DWORD *)buf = 138412546;
          v38 = v7;
          __int16 v39 = 2048;
          uint64_t v40 = [v11 count];
          _os_log_impl(&dword_1AE7DF000, v10, OS_LOG_TYPE_DEFAULT, "Resolver - device found %@, %lu endpoints", buf, 0x16u);
        }
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v29 = v7;
        long long v12 = [v7 endpoints];
        long long v13 = [v12 allValues];

        uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v33 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              uint64_t v19 = MCLogCategoryDeviceAccess();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v20 = [v18 name];
                uint64_t v21 = [v18 identifier];
                *(_DWORD *)buf = 138412546;
                v38 = v20;
                __int16 v39 = 2112;
                uint64_t v40 = (uint64_t)v21;
                _os_log_impl(&dword_1AE7DF000, v19, OS_LOG_TYPE_DEFAULT, "Resolver - endpoint: %@, %@", buf, 0x16u);
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v15);
        }

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __54__MRUVendorSpecificDeviceManager_handleResolverEvent___block_invoke;
        block[3] = &unk_1E5F0D7F8;
        block[4] = v28;
        dispatch_async(MEMORY[0x1E4F14428], block);
        uint64_t v7 = v29;
      }
LABEL_24:

      break;
  }
}

void __54__MRUVendorSpecificDeviceManager_handleResolverEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained vendorSpecificManagerDeviceListDidChange:*(void *)(a1 + 32)];
  }
}

void __54__MRUVendorSpecificDeviceManager_handleResolverEvent___block_invoke_56(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained vendorSpecificManagerDeviceListDidChange:*(void *)(a1 + 32)];
  }
}

- (void)handleDiscoveryEvent:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 eventType];
  if (v5 <= 40)
  {
    if (v5 == 10)
    {
      id v43 = MCLogCategoryDeviceAccess();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = [(DADiscovery *)self->_discovery discoveredDevices];
        *(_DWORD *)buf = 138412290;
        v66 = v44;
        _os_log_impl(&dword_1AE7DF000, v43, OS_LOG_TYPE_DEFAULT, "discovered devices cache: %@", buf, 0xCu);
      }
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v13 = [(DADiscovery *)self->_discovery discoveredDevices];
      uint64_t v45 = [v13 countByEnumeratingWithState:&v55 objects:v64 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v46; ++i)
          {
            if (*(void *)v56 != v47) {
              objc_enumerationMutation(v13);
            }
            uint64_t v49 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            [(MRUVendorSpecificDeviceManager *)self updateLocalMapWith:v49 deviceIsLost:0];
            [(MRUVendorSpecificDeviceManager *)self resolverAddVendorSpecificDevice:v49];
          }
          uint64_t v46 = [v13 countByEnumeratingWithState:&v55 objects:v64 count:16];
        }
        while (v46);
      }
    }
    else
    {
      if (v5 != 40) {
        goto LABEL_50;
      }
      uint64_t v12 = [v4 device];
      if (!v12) {
        goto LABEL_50;
      }
      long long v13 = (void *)v12;
      uint64_t v14 = MCLogCategoryDeviceAccess();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v13 name];
        [v13 state];
        uint64_t v16 = DADeviceStateToString();
        *(_DWORD *)buf = 138412546;
        v66 = v15;
        __int16 v67 = 2112;
        v68 = v16;
        _os_log_impl(&dword_1AE7DF000, v14, OS_LOG_TYPE_DEFAULT, "Discovery - got device found: %@, %@", buf, 0x16u);
      }
      [(MRUVendorSpecificDeviceManager *)self updateLocalMapWith:v13 deviceIsLost:0];
      [(MRUVendorSpecificDeviceManager *)self resolverAddVendorSpecificDevice:v13];
    }
LABEL_46:

    goto LABEL_50;
  }
  switch(v5)
  {
    case ')':
      uint64_t v17 = [v4 device];
      if (!v17) {
        break;
      }
      long long v13 = (void *)v17;
      long long v18 = MCLogCategoryDeviceAccess();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v13 name];
        [v13 state];
        uint64_t v20 = DADeviceStateToString();
        *(_DWORD *)buf = 138412546;
        v66 = v19;
        __int16 v67 = 2112;
        v68 = v20;
        _os_log_impl(&dword_1AE7DF000, v18, OS_LOG_TYPE_DEFAULT, "Discovery - got device lost: %@, %@", buf, 0x16u);
      }
      [(MRUVendorSpecificDeviceManager *)self updateLocalMapWith:v13 deviceIsLost:1];
      [(MRUVendorSpecificDeviceManager *)self resolverRemoveVendorSpecificRoute:v13];
      goto LABEL_46;
    case '*':
      uint64_t v21 = [v4 device];
      if (!v21) {
        break;
      }
      long long v22 = (void *)v21;
      long long v23 = MCLogCategoryDeviceAccess();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        long long v24 = [v22 name];
        [v22 state];
        long long v25 = DADeviceStateToString();
        *(_DWORD *)buf = 138412546;
        v66 = v24;
        __int16 v67 = 2112;
        v68 = v25;
        _os_log_impl(&dword_1AE7DF000, v23, OS_LOG_TYPE_DEFAULT, "Discovery - got device change: %@, %@", buf, 0x16u);
      }
      deviceMap = self->_deviceMap;
      long long v27 = [v22 identifier];
      long long v28 = [(NSMutableDictionary *)deviceMap objectForKeyedSubscript:v27];

      if (v28)
      {
        uint64_t v29 = self->_deviceMap;
        __int16 v30 = [v22 identifier];
        id v31 = [(NSMutableDictionary *)v29 objectForKeyedSubscript:v30];
        uint64_t v32 = [v31 mediaPlaybackState];

        if (v32 != [v22 mediaPlaybackState]) {
          goto LABEL_48;
        }
        long long v33 = self->_deviceMap;
        long long v34 = [v22 identifier];
        long long v35 = [(NSMutableDictionary *)v33 objectForKeyedSubscript:v34];
        uint64_t v36 = [v35 nowPlayingSubtitle];

        id v37 = [v22 nowPlayingSubtitle];
        v38 = v37;
        BOOL v39 = v36 != 0;
        BOOL v40 = v36 == 0;
        if (v37) {
          BOOL v39 = 0;
        }
        else {
          BOOL v40 = 0;
        }
        int v41 = v40 || v39;
        if (v36 && v37)
        {
          char v42 = v41 | [v36 isEqualToString:v37] ^ 1;

          if ((v42 & 1) == 0) {
            goto LABEL_49;
          }
          goto LABEL_48;
        }

        if (v41)
        {
LABEL_48:
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __55__MRUVendorSpecificDeviceManager_handleDiscoveryEvent___block_invoke;
          block[3] = &unk_1E5F0D8E8;
          block[4] = self;
          id v62 = v22;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
      }
LABEL_49:
      [(MRUVendorSpecificDeviceManager *)self updateLocalMapWith:v22 deviceIsLost:0];
      [(MRUVendorSpecificDeviceManager *)self resolverAddVendorSpecificDevice:v22];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __55__MRUVendorSpecificDeviceManager_handleDiscoveryEvent___block_invoke_2;
      v59[3] = &unk_1E5F0D8E8;
      v59[4] = self;
      id v60 = v22;
      id v50 = v22;
      dispatch_async(MEMORY[0x1E4F14428], v59);

      break;
    case '<':
      uint64_t v6 = MCLogCategoryDeviceAccess();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "XPC to dataaccessd interrupted, clearing devices", buf, 2u);
      }

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v7 = [(MRUVendorSpecificDeviceManager *)self devices];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v51 objects:v63 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v52;
        do
        {
          for (uint64_t j = 0; j != v9; ++j)
          {
            if (*(void *)v52 != v10) {
              objc_enumerationMutation(v7);
            }
            [(MRUVendorSpecificDeviceManager *)self resolverRemoveVendorSpecificRoute:*(void *)(*((void *)&v51 + 1) + 8 * j)];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v51 objects:v63 count:16];
        }
        while (v9);
      }

      [(NSMutableDictionary *)self->_deviceMap removeAllObjects];
      [(NSMutableDictionary *)self->_activatingDeviceMap removeAllObjects];
      [(NSMutableDictionary *)self->_activatedDeviceMap removeAllObjects];
      [(NSMutableDictionary *)self->_invalidatingDeviceMap removeAllObjects];
      break;
  }
LABEL_50:
}

void __55__MRUVendorSpecificDeviceManager_handleDiscoveryEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained vendorSpecificManager:*(void *)(a1 + 32) deviceNowPlayingInfoDidChange:*(void *)(a1 + 40)];
  }
}

void __55__MRUVendorSpecificDeviceManager_handleDiscoveryEvent___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained vendorSpecificManager:*(void *)(a1 + 32) deviceStateDidChange:*(void *)(a1 + 40)];
  }
}

- (void)dealloc
{
  [(DADiscovery *)self->_discovery invalidate];
  [(DADeviceResolver *)self->_resolver invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MRUVendorSpecificDeviceManager;
  [(MRUVendorSpecificDeviceManager *)&v3 dealloc];
}

- (MRUVendorSpecificDeviceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUVendorSpecificDeviceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
}

- (NSArray)serviceIdentifiers
{
  return self->_serviceIdentifiers;
}

- (void)setServiceIdentifiers:(id)a3
{
}

- (DADiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (DADeviceResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
}

- (NSMutableDictionary)deviceMap
{
  return self->_deviceMap;
}

- (void)setDeviceMap:(id)a3
{
}

- (NSMutableDictionary)coalescedDeviceMap
{
  return self->_coalescedDeviceMap;
}

- (void)setCoalescedDeviceMap:(id)a3
{
}

- (NSMutableDictionary)activatingDeviceMap
{
  return self->_activatingDeviceMap;
}

- (void)setActivatingDeviceMap:(id)a3
{
}

- (NSMutableDictionary)activatedDeviceMap
{
  return self->_activatedDeviceMap;
}

- (void)setActivatedDeviceMap:(id)a3
{
}

- (NSMutableDictionary)invalidatingDeviceMap
{
  return self->_invalidatingDeviceMap;
}

- (void)setInvalidatingDeviceMap:(id)a3
{
}

- (NSMutableSet)mutableResolverManagedAirPlayRouteIDs
{
  return self->_mutableResolverManagedAirPlayRouteIDs;
}

- (void)setMutableResolverManagedAirPlayRouteIDs:(id)a3
{
}

- (NSMutableDictionary)groupableDeviceIDs
{
  return self->_groupableDeviceIDs;
}

- (void)setGroupableDeviceIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupableDeviceIDs, 0);
  objc_storeStrong((id *)&self->_mutableResolverManagedAirPlayRouteIDs, 0);
  objc_storeStrong((id *)&self->_invalidatingDeviceMap, 0);
  objc_storeStrong((id *)&self->_activatedDeviceMap, 0);
  objc_storeStrong((id *)&self->_activatingDeviceMap, 0);
  objc_storeStrong((id *)&self->_coalescedDeviceMap, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_serviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end