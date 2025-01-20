@interface COCapabilityService
+ (id)serviceWithDelegate:(id)a3;
- (BOOL)_applicableToCluster:(id)a3;
- (BOOL)_isCapabilityAvailable:(id)a3 inCluster:(id)a4;
- (BOOL)_isCapabilitySupported:(id)a3;
- (COCapabilityService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5;
- (NSDictionary)availableCapabilities;
- (NSDictionary)capabilities;
- (NSDictionary)observers;
- (NSSet)supportedCapabilities;
- (id)_getEffectiveCapabilitiesForCluster:(id)a3;
- (id)_remoteInterfaceForClient:(id)a3 withErrorHandler:(id)a4;
- (void)_addOnAdded:(id)a3;
- (void)_addOnRemoved:(id)a3;
- (void)_clientLost:(id)a3;
- (void)_cluster:(id)a3 availableCapabilitiesChanged:(id)a4;
- (void)_configureServiceInterfacesOnConnection:(id)a3;
- (void)_diffCapabilities:(id)a3 withCapabilities:(id)a4 result:(id)a5;
- (void)_effectiveCapabilitiesForCluster:(id)a3 changedFrom:(id)a4 to:(id)a5;
- (void)_notifyClient:(id)a3 availability:(BOOL)a4 ofCapability:(id)a5 inCluster:(id)a6;
- (void)_notifyObserversAvailabilityChangedOfCapability:(id)a3 inCluster:(id)a4;
- (void)_updateSupportedCapabilities;
- (void)addObserverForCapability:(id)a3 inCluster:(id)a4;
- (void)addOn:(id)a3 availableCapabilitiesChanged:(id)a4;
- (void)joinClusters:(id)a3 usingMeshController:(id)a4 withClusterIdentifier:(id)a5 completion:(id)a6;
- (void)registerCapability:(id)a3;
- (void)removeObserverForCapability:(id)a3 inCluster:(id)a4;
- (void)setAvailableCapabilities:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSupportedCapabilities:(id)a3;
- (void)unregisterCapability:(id)a3;
@end

@implementation COCapabilityService

+ (id)serviceWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [[COServiceListenerProvider alloc] initWithServiceName:@"com.apple.coordination.capability" entitlement:@"com.apple.private.coordination.capability"];
  v5 = objc_alloc_init(COCapabilityAddOnProvider);
  v6 = [[COCapabilityService alloc] initWithListenerProvider:v4 addOnProvider:v5 delegate:v3];

  return v6;
}

- (COCapabilityService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)COCapabilityService;
  v5 = [(COService *)&v15 initWithListenerProvider:a3 addOnProvider:a4 delegate:a5];
  if (v5)
  {
    v6 = (NSDictionary *)objc_alloc_init(NSDictionary);
    capabilities = v5->_capabilities;
    v5->_capabilities = v6;

    v8 = (NSDictionary *)objc_alloc_init(NSDictionary);
    observers = v5->_observers;
    v5->_observers = v8;

    v10 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    supportedCapabilities = v5->_supportedCapabilities;
    v5->_supportedCapabilities = v10;

    v12 = (NSDictionary *)objc_alloc_init(NSDictionary);
    availableCapabilities = v5->_availableCapabilities;
    v5->_availableCapabilities = v12;

    [(COService *)v5 _serviceReady];
  }
  return v5;
}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)COCapabilityService;
  id v4 = a3;
  [(COService *)&v10 _configureServiceInterfacesOnConnection:v4];
  v5 = (void *)MEMORY[0x263F08D80];
  v6 = &unk_26D3FCCD8;
  v7 = objc_msgSend(v5, "interfaceWithProtocol:", v6, v10.receiver, v10.super_class);
  [v4 setExportedInterface:v7];
  [v4 setExportedObject:self];
  v8 = &unk_26D4098E0;

  v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:v8];

  [v4 setRemoteObjectInterface:v9];
}

- (void)_clientLost:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)COCapabilityService;
  [(COService *)&v26 _clientLost:v4];
  v5 = [(COCapabilityService *)self observers];
  v6 = (void *)[v5 mutableCopy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v21 = self;
    char v10 = 0;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v14 = [v7 objectForKey:v13];
        objc_super v15 = [v14 objectForKey:v4];

        if (v15)
        {
          v16 = (void *)[v14 mutableCopy];
          [v16 removeObjectForKey:v4];
          if ([v16 count])
          {
            v17 = (void *)[v16 copy];
            [v6 setObject:v17 forKey:v13];
          }
          else
          {
            [(COService *)v21 _releaseAssertionForCluster:v13];
            [v6 removeObjectForKey:v13];
          }

          char v10 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);

    self = v21;
    if (v10) {
      [(COCapabilityService *)v21 setObservers:v6];
    }
  }
  else
  {
  }
  v18 = [(COCapabilityService *)self capabilities];
  v19 = [v18 objectForKey:v4];
  if (v19)
  {
    v20 = (void *)[v18 mutableCopy];
    [v20 removeObjectForKey:v4];
    [(COCapabilityService *)self setCapabilities:v20];
    [(COCapabilityService *)self _updateSupportedCapabilities];
  }
}

- (void)_addOnAdded:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(COCapabilityService *)self supportedCapabilities];
  [v4 setSupportedCapabilities:v5];

  v6 = [v4 availableCapabilities];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = -[COService _clustersForAddOn:](self, "_clustersForAddOn:", v4, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(COCapabilityService *)self _cluster:*(void *)(*((void *)&v12 + 1) + 8 * v11++) availableCapabilitiesChanged:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [v4 setDelegate:self];
}

- (void)_addOnRemoved:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 setDelegate:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = -[COService _clustersForAddOn:](self, "_clustersForAddOn:", v4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(COCapabilityService *)self _cluster:*(void *)(*((void *)&v10 + 1) + 8 * v9++) availableCapabilitiesChanged:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)_applicableToCluster:(id)a3
{
  id v3 = [a3 configuration];
  BOOL v4 = [v3 requiredServices] & 1;

  return v4;
}

- (void)joinClusters:(id)a3 usingMeshController:(id)a4 withClusterIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__COCapabilityService_joinClusters_usingMeshController_withClusterIdentifier_completion___block_invoke;
  v17[3] = &unk_2645CCCE0;
  objc_copyWeak(&v20, &location);
  id v14 = v10;
  id v18 = v14;
  id v15 = v13;
  id v19 = v15;
  v16.receiver = self;
  v16.super_class = (Class)COCapabilityService;
  [(COService *)&v16 joinClusters:v14 usingMeshController:v11 withClusterIdentifier:v12 completion:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __89__COCapabilityService_joinClusters_usingMeshController_withClusterIdentifier_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [MEMORY[0x263F33F40] pairCluster];
    if ([*(id *)(a1 + 32) containsObject:v3])
    {
      BOOL v4 = [WeakRetained _addOnForCluster:v3];
      v5 = v4;
      if (v4)
      {
        [v4 _enableForPairLegacySupport];
      }
      else
      {
        uint64_t v6 = COCoreLogForCategory(5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __89__COCapabilityService_joinClusters_usingMeshController_withClusterIdentifier_completion___block_invoke_cold_1((uint64_t)WeakRetained, v6);
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)registerCapability:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(COService *)self currentClient];
  if (v5)
  {
    uint64_t v6 = [(COCapabilityService *)self capabilities];
    id v7 = [v6 objectForKey:v5];
    if (!v7) {
      id v7 = objc_alloc_init(MEMORY[0x263EFFA08]);
    }
    if (([v7 containsObject:v4] & 1) == 0)
    {
      uint64_t v8 = COCoreLogForCategory(5);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 134218498;
        id v12 = self;
        __int16 v13 = 2112;
        id v14 = v4;
        __int16 v15 = 2112;
        objc_super v16 = v5;
        _os_log_debug_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEBUG, "%p registering Capability(%@) for Client(%@)", (uint8_t *)&v11, 0x20u);
      }

      uint64_t v9 = [v7 setByAddingObject:v4];
      id v10 = (void *)[v6 mutableCopy];
      [v10 setObject:v9 forKey:v5];
      [(COCapabilityService *)self setCapabilities:v10];
      [(COCapabilityService *)self _updateSupportedCapabilities];
    }
  }
}

- (void)unregisterCapability:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(COService *)self currentClient];
  if (v5)
  {
    uint64_t v6 = [(COCapabilityService *)self capabilities];
    id v7 = [v6 objectForKey:v5];
    if ([v7 containsObject:v4])
    {
      uint64_t v8 = COCoreLogForCategory(5);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 134218498;
        __int16 v13 = self;
        __int16 v14 = 2112;
        id v15 = v4;
        __int16 v16 = 2112;
        uint64_t v17 = v5;
        _os_log_debug_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEBUG, "%p unregistering Capability(%@) for Client(%@)", (uint8_t *)&v12, 0x20u);
      }

      uint64_t v9 = (void *)[v7 mutableCopy];
      [v9 removeObject:v4];
      id v10 = (void *)[v6 mutableCopy];
      int v11 = (void *)[v9 copy];
      [v10 setObject:v11 forKey:v5];

      [(COCapabilityService *)self setCapabilities:v10];
      [(COCapabilityService *)self _updateSupportedCapabilities];
    }
  }
}

- (void)addObserverForCapability:(id)a3 inCluster:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(COService *)self currentClient];
  BOOL v9 = [(COCapabilityService *)self _isCapabilityAvailable:v6 inCluster:v7];
  id v10 = COCoreLogForCategory(5);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219010;
    if (v9) {
      int v21 = 89;
    }
    else {
      int v21 = 78;
    }
    long long v24 = self;
    __int16 v25 = 1024;
    *(_DWORD *)objc_super v26 = v21;
    *(_WORD *)&v26[4] = 2112;
    *(void *)&v26[6] = v6;
    *(_WORD *)&v26[14] = 2112;
    *(void *)&v26[16] = v7;
    *(_WORD *)&v26[24] = 2112;
    *(void *)&v26[26] = v8;
    _os_log_debug_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEBUG, "%p providing initial value(%c) for Capability(%@) in Cluster(%@) to Client(%@)", buf, 0x30u);
  }

  [(COCapabilityService *)self _notifyClient:v8 availability:v9 ofCapability:v6 inCluster:v7];
  if (v8)
  {
    int v11 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      long long v24 = self;
      __int16 v25 = 2112;
      *(void *)objc_super v26 = v6;
      *(_WORD *)&v26[8] = 2112;
      *(void *)&v26[10] = v7;
      *(_WORD *)&v26[18] = 2112;
      *(void *)&v26[20] = v8;
      _os_log_debug_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEBUG, "%p adding observer for Capability(%@) in Cluster(%@) for Client(%@)", buf, 0x2Au);
    }

    int v12 = [(COCapabilityService *)self observers];
    id v13 = [v12 objectForKey:v7];
    if (!v13)
    {
      [(COService *)self _takeAssertionForCluster:v7];
      id v13 = objc_alloc_init(NSDictionary);
    }
    id v14 = [v13 objectForKey:v8];
    if (!v14) {
      id v14 = objc_alloc_init(MEMORY[0x263EFFA08]);
    }
    id v15 = [v14 setByAddingObject:v6];
    __int16 v16 = (void *)[v13 mutableCopy];
    [v16 setObject:v15 forKey:v8];
    uint64_t v17 = (void *)[v12 mutableCopy];
    long long v22 = v8;
    uint64_t v18 = v12;
    id v19 = v6;
    id v20 = (void *)[v16 copy];
    [v17 setObject:v20 forKey:v7];

    id v6 = v19;
    [(COCapabilityService *)self setObservers:v17];

    uint64_t v8 = v22;
  }
}

- (void)removeObserverForCapability:(id)a3 inCluster:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(COService *)self currentClient];
  if (v8)
  {
    BOOL v9 = [(COCapabilityService *)self observers];
    id v10 = [v9 objectForKey:v7];
    int v11 = v10;
    if (v10)
    {
      int v12 = [v10 objectForKey:v8];
      if ([v12 containsObject:v6])
      {
        id v13 = COCoreLogForCategory(5);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218754;
          int v21 = self;
          __int16 v22 = 2112;
          id v23 = v6;
          __int16 v24 = 2112;
          id v25 = v7;
          __int16 v26 = 2112;
          uint64_t v27 = v8;
          _os_log_debug_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEBUG, "%p removing observer for Capability(%@) in Cluster(%@) for Client(%@)", buf, 0x2Au);
        }

        id v14 = (void *)[v12 mutableCopy];
        [v14 removeObject:v6];
        id v15 = (void *)[v11 mutableCopy];
        if ([v14 count])
        {
          __int16 v16 = (void *)[v14 copy];
          [v15 setObject:v16 forKey:v8];
        }
        else
        {
          [v15 removeObjectForKey:v8];
        }
        uint64_t v17 = (void *)[v9 mutableCopy];
        if ([v15 count])
        {
          id v19 = v12;
          uint64_t v18 = (void *)[v15 copy];
          [v17 setObject:v18 forKey:v7];

          int v12 = v19;
        }
        else
        {
          [(COService *)self _releaseAssertionForCluster:v7];
          [v17 removeObjectForKey:v7];
        }
        [(COCapabilityService *)self setObservers:v17];
      }
    }
  }
}

- (void)addOn:(id)a3 availableCapabilitiesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(COService *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__COCapabilityService_addOn_availableCapabilitiesChanged___block_invoke;
  block[3] = &unk_2645CAEF8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __58__COCapabilityService_addOn_availableCapabilitiesChanged___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_clustersForAddOn:", *(void *)(a1 + 40), 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 32) _cluster:*(void *)(*((void *)&v7 + 1) + 8 * v6++) availableCapabilitiesChanged:*(void *)(a1 + 48)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_updateSupportedCapabilities
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(COCapabilityService *)self supportedCapabilities];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v5 = [(COCapabilityService *)self capabilities];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [v5 objectForKey:*(void *)(*((void *)&v40 + 1) + 8 * v9)];
        [v4 unionSet:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v7);
  }
  int v11 = COCoreLogForCategory(5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v47 = self;
    __int16 v48 = 2112;
    v49 = v3;
    __int16 v50 = 2112;
    id v51 = v4;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p supported set changing from(%@) to(%@)", buf, 0x20u);
  }

  [(COCapabilityService *)self setSupportedCapabilities:v4];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v12 = [(COService *)self _uniqueAddOns];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v37;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * v16++) setSupportedCapabilities:v4];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v14);
  }

  uint64_t v17 = [(COCapabilityService *)self supportedCapabilities];
  uint64_t v18 = (void *)MEMORY[0x263EFFA08];
  id v19 = [(COService *)self addOns];
  id v20 = [v19 allKeys];
  uint64_t v21 = [v18 setWithArray:v20];

  __int16 v22 = [(COCapabilityService *)self observers];
  id v23 = (void *)MEMORY[0x263EFF9C0];
  __int16 v24 = [v22 allKeys];
  id v25 = [v23 setWithArray:v24];

  v31 = (void *)v21;
  [v25 minusSet:v21];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v26 = v25;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v33;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(v26);
        }
        [(COCapabilityService *)self _effectiveCapabilitiesForCluster:*(void *)(*((void *)&v32 + 1) + 8 * v30++) changedFrom:v3 to:v17];
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v28);
  }
}

- (void)_cluster:(id)a3 availableCapabilitiesChanged:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(COCapabilityService *)self _getEffectiveCapabilitiesForCluster:v12];
  uint64_t v8 = [(COCapabilityService *)self availableCapabilities];
  uint64_t v9 = (void *)[v8 mutableCopy];
  long long v10 = v9;
  if (v6) {
    [v9 setObject:v6 forKey:v12];
  }
  else {
    [v9 removeObjectForKey:v12];
  }
  [(COCapabilityService *)self setAvailableCapabilities:v10];
  int v11 = [(COCapabilityService *)self _getEffectiveCapabilitiesForCluster:v12];
  [(COCapabilityService *)self _effectiveCapabilitiesForCluster:v12 changedFrom:v7 to:v11];
}

- (void)_effectiveCapabilitiesForCluster:(id)a3 changedFrom:(id)a4 to:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x3032000000;
  long long v41 = __Block_byref_object_copy__25;
  long long v42 = __Block_byref_object_dispose__25;
  id v43 = 0;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3032000000;
  long long v35 = __Block_byref_object_copy__25;
  long long v36 = __Block_byref_object_dispose__25;
  id v37 = 0;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __71__COCapabilityService__effectiveCapabilitiesForCluster_changedFrom_to___block_invoke;
  v31[3] = &unk_2645CE5E0;
  v31[4] = &v38;
  v31[5] = &v32;
  [(COCapabilityService *)self _diffCapabilities:v9 withCapabilities:v10 result:v31];
  if ([(id)v33[5] count] || objc_msgSend((id)v39[5], "count"))
  {
    int v11 = [(COCapabilityService *)self _getEffectiveCapabilitiesForCluster:v8];
    id v12 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v33[5];
      uint64_t v14 = v39[5];
      *(_DWORD *)buf = 134219010;
      v47 = self;
      __int16 v48 = 2112;
      id v49 = v8;
      __int16 v50 = 2112;
      id v51 = v11;
      __int16 v52 = 2112;
      uint64_t v53 = v13;
      __int16 v54 = 2112;
      uint64_t v55 = v14;
      _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%p Capabilities changed in Cluster(%@). Now(%@), removing(%@), adding(%@)", buf, 0x34u);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = (id)v33[5];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v45 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v28;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v15);
          }
          [(COCapabilityService *)self _notifyObserversAvailabilityChangedOfCapability:*(void *)(*((void *)&v27 + 1) + 8 * v18++) inCluster:v8];
        }
        while (v16 != v18);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v45 count:16];
      }
      while (v16);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v19 = (id)v39[5];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v23 objects:v44 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v24;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v19);
          }
          -[COCapabilityService _notifyObserversAvailabilityChangedOfCapability:inCluster:](self, "_notifyObserversAvailabilityChangedOfCapability:inCluster:", *(void *)(*((void *)&v23 + 1) + 8 * v22++), v8, (void)v23);
        }
        while (v20 != v22);
        uint64_t v20 = [v19 countByEnumeratingWithState:&v23 objects:v44 count:16];
      }
      while (v20);
    }
  }
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
}

void __71__COCapabilityService__effectiveCapabilitiesForCluster_changedFrom_to___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_getEffectiveCapabilitiesForCluster:(id)a3
{
  id v4 = a3;
  id v5 = [(COCapabilityService *)self availableCapabilities];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v6 = [(COCapabilityService *)self supportedCapabilities];
  }

  return v6;
}

- (BOOL)_isCapabilitySupported:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(COCapabilityService *)self supportedCapabilities];
  int v6 = [v5 containsObject:v4];
  uint64_t v7 = COCoreLogForCategory(5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218498;
    if (v6) {
      int v8 = 89;
    }
    else {
      int v8 = 78;
    }
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 1024;
    int v15 = v8;
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p Capability(%@) supported: %c", (uint8_t *)&v10, 0x1Cu);
  }

  return v6;
}

- (BOOL)_isCapabilityAvailable:(id)a3 inCluster:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(COCapabilityService *)self availableCapabilities];
  uint64_t v9 = [v8 objectForKey:v7];
  int v10 = v9;
  if (v9)
  {
    int v11 = [v9 containsObject:v6];
  }
  else
  {
    __int16 v12 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v17 = 134218498;
      uint64_t v18 = self;
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_error_impl(&dword_2217C1000, v12, OS_LOG_TYPE_ERROR, "%p No such Cluster(%@) for Capability(%@)", (uint8_t *)&v17, 0x20u);
    }

    int v11 = [(COCapabilityService *)self _isCapabilitySupported:v6];
  }
  BOOL v13 = v11;
  __int16 v14 = COCoreLogForCategory(5);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134218754;
    if (v13) {
      int v15 = 89;
    }
    else {
      int v15 = 78;
    }
    uint64_t v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 1024;
    int v24 = v15;
    _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p Resolved availability of Capability(%@) in Cluster(%@): %c", (uint8_t *)&v17, 0x26u);
  }

  return v13;
}

- (void)_diffCapabilities:(id)a3 withCapabilities:(id)a4 result:(id)a5
{
  id v7 = (void (**)(id, id, void *))a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = (id)[v8 mutableCopy];
  [v11 minusSet:v9];
  int v10 = (void *)[v9 mutableCopy];

  [v10 minusSet:v8];
  v7[2](v7, v11, v10);
}

- (void)_notifyObserversAvailabilityChangedOfCapability:(id)a3 inCluster:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v22 = [(COCapabilityService *)self observers];
  id v9 = [v22 objectForKey:v7];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
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
        uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        int v15 = [v9 objectForKey:v14];
        if ([v15 containsObject:v6]) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }
  BOOL v16 = [(COCapabilityService *)self _isCapabilityAvailable:v6 inCluster:v7];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        [(COCapabilityService *)self _notifyClient:*(void *)(*((void *)&v23 + 1) + 8 * j) availability:v16 ofCapability:v6 inCluster:v7];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v19);
  }
}

- (void)_notifyClient:(id)a3 availability:(BOOL)a4 ofCapability:(id)a5 inCluster:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __73__COCapabilityService__notifyClient_availability_ofCapability_inCluster___block_invoke;
  uint64_t v20 = &unk_2645CE608;
  objc_copyWeak(&v24, &location);
  id v13 = v10;
  id v21 = v13;
  id v14 = v11;
  id v22 = v14;
  BOOL v25 = v8;
  id v15 = v12;
  id v23 = v15;
  BOOL v16 = [(COCapabilityService *)self _remoteInterfaceForClient:v13 withErrorHandler:&v17];
  objc_msgSend(v16, "availabilityChanged:ofCapability:inCluster:", v8, v14, v15, v17, v18, v19, v20);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __73__COCapabilityService__notifyClient_availability_ofCapability_inCluster___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __73__COCapabilityService__notifyClient_availability_ofCapability_inCluster___block_invoke_cold_1((uint64_t)WeakRetained, a1, v3);
    }
  }
}

- (id)_remoteInterfaceForClient:(id)a3 withErrorHandler:(id)a4
{
  id v5 = a4;
  id v6 = [a3 connection];
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v5];

  return v7;
}

- (NSDictionary)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (NSDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSSet)supportedCapabilities
{
  return self->_supportedCapabilities;
}

- (void)setSupportedCapabilities:(id)a3
{
}

- (NSDictionary)availableCapabilities
{
  return self->_availableCapabilities;
}

- (void)setAvailableCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableCapabilities, 0);
  objc_storeStrong((id *)&self->_supportedCapabilities, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

void __89__COCapabilityService_joinClusters_usingMeshController_withClusterIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2217C1000, a2, OS_LOG_TYPE_ERROR, "%p should have found the pair add-on!", (uint8_t *)&v2, 0xCu);
}

void __73__COCapabilityService__notifyClient_availability_ofCapability_inCluster___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 40);
  if (*(unsigned char *)(a2 + 64)) {
    int v5 = 89;
  }
  else {
    int v5 = 78;
  }
  uint64_t v6 = *(void *)(a2 + 48);
  int v7 = 134219010;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v3;
  __int16 v11 = 2112;
  uint64_t v12 = v4;
  __int16 v13 = 1024;
  int v14 = v5;
  __int16 v15 = 2112;
  uint64_t v16 = v6;
  _os_log_error_impl(&dword_2217C1000, log, OS_LOG_TYPE_ERROR, "%p failed to notify Client(%@) of Capability(%@) availability(%c) in Cluster(%@)", (uint8_t *)&v7, 0x30u);
}

@end