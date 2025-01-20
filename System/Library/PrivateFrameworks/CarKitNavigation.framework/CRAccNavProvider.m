@interface CRAccNavProvider
+ (id)_localizedNameForIdentifier:(id)a3;
- (ACCNavigationProvider)iapNavigation;
- (CRAccNavProvider)initWithDelegate:(id)a3;
- (CRAccNavProviderDelegate)delegate;
- (NSArray)activeComponents;
- (NSMutableDictionary)accessoriesIndexed;
- (NSMutableDictionary)activeAccessoryComponentsIndexed;
- (NSMutableDictionary)activeComponentsIndexed;
- (OS_dispatch_queue)workQueue;
- (id)_componentKeys;
- (id)_locked_activeComponents;
- (os_unfair_lock_s)accessoryLock;
- (void)_addAccessoryIfNeeded:(id)a3;
- (void)_broadcastRouteGuidance:(id)a3;
- (void)_locked_addAccessoryIfNeeded:(id)a3;
- (void)navigation:(id)a3 accessoryAttached:(id)a4;
- (void)navigation:(id)a3 accessoryDetached:(id)a4;
- (void)navigation:(id)a3 startRouteGuidance:(id)a4 componentList:(id)a5;
- (void)navigation:(id)a3 stopRouteGuidance:(id)a4 componentList:(id)a5;
- (void)resetActiveComponents;
- (void)sendInfo:(id)a3 toComponentUID:(id)a4;
- (void)sendNoSupportForAppIdentifier:(id)a3;
- (void)setAccessoriesIndexed:(id)a3;
- (void)setAccessoryLock:(os_unfair_lock_s)a3;
- (void)setActiveAccessoryComponentsIndexed:(id)a3;
- (void)setActiveComponentsIndexed:(id)a3;
- (void)setIapNavigation:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation CRAccNavProvider

- (CRAccNavProvider)initWithDelegate:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRAccNavProvider;
  v6 = [(CRAccNavProvider *)&v19 init];
  if (v6)
  {
    v7 = CarNavLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_impl(&dword_24986C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting up iAP Navigation", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_delegate, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.carkit.AccNavProvider", 0);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v8;

    v6->_accessoryLock._os_unfair_lock_opaque = 0;
    uint64_t v10 = objc_opt_new();
    accessoriesIndexed = v6->_accessoriesIndexed;
    v6->_accessoriesIndexed = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    activeComponentsIndexed = v6->_activeComponentsIndexed;
    v6->_activeComponentsIndexed = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    activeAccessoryComponentsIndexed = v6->_activeAccessoryComponentsIndexed;
    v6->_activeAccessoryComponentsIndexed = (NSMutableDictionary *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x263F22EA0]) initWithDelegate:v6];
    iapNavigation = v6->_iapNavigation;
    v6->_iapNavigation = (ACCNavigationProvider *)v16;
  }
  return v6;
}

- (NSArray)activeComponents
{
  p_accessoryLock = &self->_accessoryLock;
  os_unfair_lock_lock(&self->_accessoryLock);
  v4 = [(CRAccNavProvider *)self _locked_activeComponents];
  os_unfair_lock_unlock(p_accessoryLock);
  return (NSArray *)v4;
}

- (id)_locked_activeComponents
{
  v2 = [(CRAccNavProvider *)self activeComponentsIndexed];
  v3 = [v2 allValues];
  v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_0];

  return v4;
}

uint64_t __44__CRAccNavProvider__locked_activeComponents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 componentIdentifier];
  v6 = [v4 componentIdentifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)sendInfo:(id)a3 toComponentUID:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_accessoryLock);
  dispatch_queue_t v8 = [(CRAccNavProvider *)self activeComponentsIndexed];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    uint64_t v10 = [(CRAccNavProvider *)self accessoriesIndexed];
    v11 = [v9 accessoryUID];
    id v12 = [v10 objectForKeyedSubscript:v11];

    os_unfair_lock_unlock(&self->_accessoryLock);
    v13 = [v9 component];

    if (v13 && v12)
    {
      uint64_t v14 = [v9 component];
      char v15 = [v14 isEnabled];

      if ((v15 & 1) == 0)
      {
        uint64_t v16 = CarNavLogging();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = [v7 UUIDString];
          v18 = [v9 component];
          uint64_t v19 = [v18 identifier];
          v20 = [v12 accessoryUID];
          *(_DWORD *)buf = 138544130;
          v34 = self;
          __int16 v35 = 2114;
          v36 = v17;
          __int16 v37 = 2048;
          uint64_t v38 = v19;
          __int16 v39 = 2114;
          id v40 = v20;
          _os_log_impl(&dword_24986C000, v16, OS_LOG_TYPE_INFO, "%{public}@: component %{public}@ %lu from %{public}@ not enabled", buf, 0x2Au);
        }
      }
      v21 = [(CRAccNavProvider *)self workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __44__CRAccNavProvider_sendInfo_toComponentUID___block_invoke;
      block[3] = &unk_2652747C8;
      v28 = v6;
      v29 = self;
      id v12 = v12;
      id v30 = v12;
      id v31 = v7;
      id v32 = v9;
      dispatch_async(v21, block);

      uint64_t v22 = v28;
      goto LABEL_12;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_accessoryLock);
    id v12 = 0;
  }
  uint64_t v22 = CarNavLogging();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    v23 = [v7 UUIDString];
    v24 = [v9 component];
    v25 = [(CRAccNavProvider *)self _componentKeys];
    v26 = [v25 valueForKey:@"UUIDString"];
    *(_DWORD *)buf = 138544642;
    v34 = self;
    __int16 v35 = 2114;
    v36 = v23;
    __int16 v37 = 2048;
    uint64_t v38 = (uint64_t)v9;
    __int16 v39 = 2048;
    id v40 = v12;
    __int16 v41 = 2048;
    v42 = v24;
    __int16 v43 = 2114;
    v44 = v26;
    _os_log_fault_impl(&dword_24986C000, v22, OS_LOG_TYPE_FAULT, "%{public}@: missing component information.  uid=%{public}@ component=%p accessory=%p component.component=%p compontentsIndexed=%{public}@", buf, 0x3Eu);
  }
LABEL_12:
}

void __44__CRAccNavProvider_sendInfo_toComponentUID___block_invoke(uint64_t a1)
{
  v43[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  v2 = (id *)(a1 + 32);
  v3 = *(id *)(a1 + 32);
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = CarNavLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __44__CRAccNavProvider_sendInfo_toComponentUID___block_invoke_cold_2(a1, (id *)(a1 + 32));
    }

    id v5 = *(void **)(a1 + 48);
    id v6 = [v3 routeGuidance];
    id v7 = [*(id *)(a1 + 64) component];
    v43[0] = v7;
    dispatch_queue_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
    [v5 updateRouteGuidanceInfo:v6 componentList:v8];
LABEL_16:

    goto LABEL_19;
  }

  objc_opt_class();
  v3 = *v2;
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = CarNavLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = *(void *)(a1 + 40);
      int v13 = [v3 index];
      uint64_t v14 = [*(id *)(a1 + 48) accessoryUID];
      uint64_t v15 = *(void *)(a1 + 56);
      uint64_t v16 = [*(id *)(a1 + 64) component];
      uint64_t v17 = [v16 identifier];
      v18 = [*(id *)(a1 + 32) accNavInfo];
      uint64_t v19 = objc_msgSend(v18, "cr_dictionary");
      *(_DWORD *)buf = 138544642;
      uint64_t v32 = v27;
      __int16 v33 = 1024;
      int v34 = v13;
      __int16 v35 = 2114;
      v36 = v14;
      __int16 v37 = 2114;
      uint64_t v38 = v15;
      __int16 v39 = 2048;
      uint64_t v40 = v17;
      __int16 v41 = 2114;
      v42 = v19;
      _os_log_debug_impl(&dword_24986C000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: sending maneuver index=%d accessoryUID=%{public}@ componentUID=%{public}@ component.identifier=%lu parameters=%{public}@", buf, 0x3Au);
    }
    uint64_t v10 = *(void **)(a1 + 48);
    id v6 = [v3 maneuver];
    id v7 = [*(id *)(a1 + 64) component];
    id v30 = v7;
    dispatch_queue_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
    [v10 updateManeuverInfo:v6 componentList:v8];
    goto LABEL_16;
  }

  objc_opt_class();
  v3 = *v2;
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = CarNavLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = *(void *)(a1 + 40);
      int v20 = [v3 index];
      v21 = [*(id *)(a1 + 48) accessoryUID];
      uint64_t v22 = *(void *)(a1 + 56);
      v23 = [*(id *)(a1 + 64) component];
      uint64_t v24 = [v23 identifier];
      v25 = [*(id *)(a1 + 32) accNavInfo];
      v26 = objc_msgSend(v25, "cr_dictionary");
      *(_DWORD *)buf = 138544642;
      uint64_t v32 = v28;
      __int16 v33 = 1024;
      int v34 = v20;
      __int16 v35 = 2114;
      v36 = v21;
      __int16 v37 = 2114;
      uint64_t v38 = v22;
      __int16 v39 = 2048;
      uint64_t v40 = v24;
      __int16 v41 = 2114;
      v42 = v26;
      _os_log_debug_impl(&dword_24986C000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: sending laneGuidance index=%d accessoryUID=%{public}@ componentUID=%{public}@ component.identifier=%lu parameters=%{public}@", buf, 0x3Au);
    }
    id v12 = *(void **)(a1 + 48);
    id v6 = [v3 laneGuidance];
    id v7 = [*(id *)(a1 + 64) component];
    v29 = v7;
    dispatch_queue_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
    [v12 updateLaneGuidanceInfo:v6 componentList:v8];
    goto LABEL_16;
  }

  v3 = CarNavLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __44__CRAccNavProvider_sendInfo_toComponentUID___block_invoke_cold_1(a1, (id *)(a1 + 32));
  }
LABEL_19:
}

- (void)_broadcastRouteGuidance:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CarNavLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(CRAccNavProvider *)(uint64_t)self _broadcastRouteGuidance:v5];
  }

  os_unfair_lock_t lock = &self->_accessoryLock;
  os_unfair_lock_lock(&self->_accessoryLock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(CRAccNavProvider *)self activeComponentsIndexed];
  id v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v13 = [(CRAccNavProvider *)self accessoriesIndexed];
        uint64_t v14 = [v12 accessoryUID];
        uint64_t v15 = [v13 objectForKeyedSubscript:v14];

        uint64_t v16 = [v12 component];
        v23 = v16;
        uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
        [v15 updateRouteGuidanceInfo:v4 componentList:v17];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(lock);
}

- (void)resetActiveComponents
{
  v3 = [(CRAccNavProvider *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__CRAccNavProvider_resetActiveComponents__block_invoke;
  block[3] = &unk_2652747F0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __41__CRAccNavProvider_resetActiveComponents__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = CarNavLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_24986C000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: resetActiveComponents", (uint8_t *)&v5, 0xCu);
  }

  id v4 = objc_alloc_init(MEMORY[0x263F22EA8]);
  [v4 setInfo:1 data:&unk_26FD9CCA8];
  [*(id *)(a1 + 32) _broadcastRouteGuidance:v4];
}

- (void)sendNoSupportForAppIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(id)objc_opt_class() _localizedNameForIdentifier:v4];
  if (v5)
  {
    uint64_t v6 = [(CRAccNavProvider *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__CRAccNavProvider_sendNoSupportForAppIdentifier___block_invoke;
    block[3] = &unk_265274818;
    void block[4] = self;
    id v8 = v4;
    id v9 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    [(CRAccNavProvider *)self resetActiveComponents];
  }
}

void __50__CRAccNavProvider_sendNoSupportForAppIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = CarNavLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_24986C000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: sendNoSupportForAppIdentifier:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = objc_alloc_init(MEMORY[0x263F22EA8]);
  [v5 setInfo:19 data:*(void *)(a1 + 48)];
  [v5 setInfo:20 data:MEMORY[0x263EFFA80]];
  [*(id *)(a1 + 32) _broadcastRouteGuidance:v5];
}

- (void)navigation:(id)a3 accessoryAttached:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = CarNavLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_24986C000, v6, OS_LOG_TYPE_DEFAULT, "iAP Accessory is available %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [(CRAccNavProvider *)self _addAccessoryIfNeeded:v5];
}

- (void)navigation:(id)a3 accessoryDetached:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_unfair_lock_lock(&self->_accessoryLock);
  int v6 = CarNavLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(CRAccNavProvider *)self _locked_activeComponents];
    *(_DWORD *)buf = 138543618;
    id v36 = v5;
    __int16 v37 = 2114;
    uint64_t v38 = v7;
    _os_log_impl(&dword_24986C000, v6, OS_LOG_TYPE_DEFAULT, "iAP Accessory is unavailable %{public}@ activeComponents=%{public}@", buf, 0x16u);
  }
  id v8 = [(CRAccNavProvider *)self accessoriesIndexed];
  uint64_t v9 = [v5 accessoryUID];
  [v8 removeObjectForKey:v9];

  uint64_t v10 = [(CRAccNavProvider *)self activeAccessoryComponentsIndexed];
  v11 = [v5 accessoryUID];
  id v12 = [v10 objectForKeyedSubscript:v11];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v14 = [(CRAccNavProvider *)self activeAccessoryComponentsIndexed];
    uint64_t v15 = [v5 accessoryUID];
    uint64_t v16 = [v14 objectForKeyedSubscript:v15];
    uint64_t v17 = [v16 allValues];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v23 = [(CRAccNavProvider *)self activeComponentsIndexed];
          [v23 removeObjectForKey:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v19);
    }
  }
  uint64_t v24 = [(CRAccNavProvider *)self activeAccessoryComponentsIndexed];
  uint64_t v25 = [v5 accessoryUID];
  [v24 removeObjectForKey:v25];

  v26 = [(CRAccNavProvider *)self _locked_activeComponents];
  uint64_t v27 = CarNavLogging();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = [(CRAccNavProvider *)self _locked_activeComponents];
    *(_DWORD *)buf = 138543618;
    id v36 = v5;
    __int16 v37 = 2114;
    uint64_t v38 = v28;
    _os_log_impl(&dword_24986C000, v27, OS_LOG_TYPE_DEFAULT, "iAP Accessory removed %{public}@, new activeComponents=%{public}@", buf, 0x16u);
  }
  os_unfair_lock_unlock(&self->_accessoryLock);
  if (v13)
  {
    v29 = [(CRAccNavProvider *)self delegate];
    [v29 session:self didUpdateActiveComponents:v26];
  }
}

- (void)navigation:(id)a3 startRouteGuidance:(id)a4 componentList:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = CarNavLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v42 = v7;
    __int16 v43 = 2114;
    id v44 = v8;
    _os_log_impl(&dword_24986C000, v9, OS_LOG_TYPE_DEFAULT, "iAP Accessory did enable navigation updates %{public}@ components=%{public}@", buf, 0x16u);
  }

  os_unfair_lock_t lock = &self->_accessoryLock;
  os_unfair_lock_lock(&self->_accessoryLock);
  [(CRAccNavProvider *)self _locked_addAccessoryIfNeeded:v7];
  id v10 = v8;
  int v34 = v10;
  if (!v10)
  {
    v11 = objc_msgSend(v7, "componentList", lock, 0);
    id v10 = [v11 allValues];
  }
  __int16 v35 = self;
  id v12 = [(CRAccNavProvider *)self activeAccessoryComponentsIndexed];
  uint64_t v13 = [v7 accessoryUID];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        long long v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "identifier"));
        uint64_t v22 = [v14 objectForKeyedSubscript:v21];

        if (!v22)
        {
          v23 = [CRAccNavComponent alloc];
          uint64_t v24 = [v7 accessoryUID];
          uint64_t v25 = [(CRAccNavComponent *)v23 initWithAccessoryUID:v24 component:v20];

          v26 = [(CRAccNavProvider *)v35 activeComponentsIndexed];
          uint64_t v27 = [(CRAccNavComponent *)v25 uuid];
          [v26 setObject:v25 forKeyedSubscript:v27];

          uint64_t v28 = [(CRAccNavComponent *)v25 uuid];
          v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "identifier"));
          [v14 setObject:v28 forKeyedSubscript:v29];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v17);
  }

  long long v30 = [(CRAccNavProvider *)v35 _locked_activeComponents];
  os_unfair_lock_unlock(locka);
  long long v31 = [(CRAccNavProvider *)v35 delegate];
  [v31 session:v35 didUpdateActiveComponents:v30];
}

- (void)navigation:(id)a3 stopRouteGuidance:(id)a4 componentList:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = CarNavLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v41 = v7;
    __int16 v42 = 2114;
    id v43 = v8;
    _os_log_impl(&dword_24986C000, v9, OS_LOG_TYPE_DEFAULT, "iAP Accessory did disable navigation updates %{public}@ components=%{public}@", buf, 0x16u);
  }

  os_unfair_lock_t lock = &self->_accessoryLock;
  os_unfair_lock_lock(&self->_accessoryLock);
  [(CRAccNavProvider *)self _locked_addAccessoryIfNeeded:v7];
  id v10 = v8;
  v11 = v10;
  if (!v10 || (id v12 = v10, !objc_msgSend(v10, "count", lock)))
  {
    uint64_t v13 = objc_msgSend(v7, "componentList", lock);
    id v12 = [v13 allValues];
  }
  long long v31 = v11;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v12;
  uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v36;
    unint64_t v14 = 0x263F08000uLL;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v17 = [(CRAccNavProvider *)self activeAccessoryComponentsIndexed];
        uint64_t v18 = [v7 accessoryUID];
        uint64_t v19 = [v17 objectForKeyedSubscript:v18];
        objc_msgSend(*(id *)(v14 + 2584), "numberWithUnsignedInteger:", objc_msgSend(v16, "identifier"));
        v21 = unint64_t v20 = v14;
        uint64_t v22 = [v19 objectForKeyedSubscript:v21];

        if (v22)
        {
          v23 = [(CRAccNavProvider *)self activeComponentsIndexed];
          [v23 removeObjectForKey:v22];

          uint64_t v24 = [(CRAccNavProvider *)self activeAccessoryComponentsIndexed];
          uint64_t v25 = [v7 accessoryUID];
          v26 = [v24 objectForKeyedSubscript:v25];
          uint64_t v27 = objc_msgSend(*(id *)(v20 + 2584), "numberWithUnsignedInteger:", objc_msgSend(v16, "identifier"));
          [v26 removeObjectForKey:v27];

          unint64_t v14 = v20;
        }
        else
        {
          unint64_t v14 = v20;
          uint64_t v24 = CarNavLogging();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v41 = v7;
            __int16 v42 = 2114;
            id v43 = v16;
            _os_log_impl(&dword_24986C000, v24, OS_LOG_TYPE_DEFAULT, "Unknown accessory %{public}@ component %{public}@ already deactivated", buf, 0x16u);
          }
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v34);
  }

  uint64_t v28 = [(CRAccNavProvider *)self _locked_activeComponents];
  os_unfair_lock_unlock(lock);
  v29 = [(CRAccNavProvider *)self delegate];
  [v29 session:self didUpdateActiveComponents:v28];
}

- (void)_addAccessoryIfNeeded:(id)a3
{
  p_accessoryLock = &self->_accessoryLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessoryLock);
  [(CRAccNavProvider *)self _locked_addAccessoryIfNeeded:v5];

  os_unfair_lock_unlock(p_accessoryLock);
}

- (void)_locked_addAccessoryIfNeeded:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CRAccNavProvider *)self accessoriesIndexed];
  int v6 = [v4 accessoryUID];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = CarNavLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v4 componentList];
      int v18 = 138543618;
      id v19 = v4;
      __int16 v20 = 2114;
      long long v21 = v9;
      _os_log_impl(&dword_24986C000, v8, OS_LOG_TYPE_DEFAULT, "Unknown accessory %{public}@ components=%{public}@", (uint8_t *)&v18, 0x16u);
    }
    id v10 = [(CRAccNavProvider *)self accessoriesIndexed];
    v11 = [v4 accessoryUID];
    [v10 setObject:v4 forKeyedSubscript:v11];

    id v12 = [(CRAccNavProvider *)self activeAccessoryComponentsIndexed];
    uint64_t v13 = [v4 accessoryUID];
    unint64_t v14 = [v12 objectForKeyedSubscript:v13];

    if (!v14)
    {
      id v15 = objc_opt_new();
      uint64_t v16 = [(CRAccNavProvider *)self activeAccessoryComponentsIndexed];
      uint64_t v17 = [v4 accessoryUID];
      [v16 setObject:v15 forKeyedSubscript:v17];
    }
  }
}

- (id)_componentKeys
{
  p_accessoryLock = &self->_accessoryLock;
  os_unfair_lock_lock(&self->_accessoryLock);
  id v4 = [(CRAccNavProvider *)self activeComponentsIndexed];
  id v5 = [v4 allKeys];

  os_unfair_lock_unlock(p_accessoryLock);
  return v5;
}

+ (id)_localizedNameForIdentifier:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F01868] applicationProxyForIdentifier:a3];
  id v4 = [v3 localizedNameForContext:@"Car"];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 localizedNameForContext:0];
  }
  id v7 = v6;

  return v7;
}

- (CRAccNavProviderDelegate)delegate
{
  return self->_delegate;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (ACCNavigationProvider)iapNavigation
{
  return self->_iapNavigation;
}

- (void)setIapNavigation:(id)a3
{
}

- (os_unfair_lock_s)accessoryLock
{
  return self->_accessoryLock;
}

- (void)setAccessoryLock:(os_unfair_lock_s)a3
{
  self->_accessoryLock = a3;
}

- (NSMutableDictionary)accessoriesIndexed
{
  return self->_accessoriesIndexed;
}

- (void)setAccessoriesIndexed:(id)a3
{
}

- (NSMutableDictionary)activeComponentsIndexed
{
  return self->_activeComponentsIndexed;
}

- (void)setActiveComponentsIndexed:(id)a3
{
}

- (NSMutableDictionary)activeAccessoryComponentsIndexed
{
  return self->_activeAccessoryComponentsIndexed;
}

- (void)setActiveAccessoryComponentsIndexed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccessoryComponentsIndexed, 0);
  objc_storeStrong((id *)&self->_activeComponentsIndexed, 0);
  objc_storeStrong((id *)&self->_accessoriesIndexed, 0);
  objc_storeStrong((id *)&self->_iapNavigation, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __44__CRAccNavProvider_sendInfo_toComponentUID___block_invoke_cold_1(uint64_t a1, id *a2)
{
  id v4 = [*(id *)(a1 + 48) accessoryUID];
  id v5 = [*(id *)(a1 + 64) component];
  [v5 identifier];
  id v6 = [*a2 accNavInfo];
  id v7 = objc_msgSend(v6, "cr_dictionary");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_24986C000, v8, v9, "%{public}@: not sending unknown accessoryUID=%{public}@ componentUID=%{public}@ component.identifier=%lu parameters=%{public}@", v10, v11, v12, v13, v14);
}

void __44__CRAccNavProvider_sendInfo_toComponentUID___block_invoke_cold_2(uint64_t a1, id *a2)
{
  id v4 = [*(id *)(a1 + 48) accessoryUID];
  id v5 = [*(id *)(a1 + 64) component];
  [v5 identifier];
  id v6 = [*a2 accNavInfo];
  id v7 = objc_msgSend(v6, "cr_dictionary");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_24986C000, v8, v9, "%{public}@: sending routeGuidance accessoryUID=%{public}@ componentUID=%{public}@ component.identifier=%lu parameters=%{public}@", v10, v11, v12, v13, v14);
}

- (void)_broadcastRouteGuidance:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(a2, "cr_dictionary");
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_24986C000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: broadcast %{public}@", (uint8_t *)&v6, 0x16u);
}

@end