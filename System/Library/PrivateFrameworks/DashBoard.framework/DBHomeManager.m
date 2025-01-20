@interface DBHomeManager
- (CARObserverHashTable)observers;
- (DBHomeManager)init;
- (DBLocationManager)locationManager;
- (DBNetworkPathMonitor)networkPathMonitor;
- (HMFLocationAuthorization)homeLocationAuthorization;
- (HMHomeManager)homeManager;
- (NSDictionary)homes;
- (OS_dispatch_queue)workQueue;
- (void)_authorizeHomeManager;
- (void)_setupHomeManager;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)init;
- (void)removeObserver:(id)a3;
- (void)setHomeLocationAuthorization:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setHomes:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setNetworkPathMonitor:(id)a3;
- (void)setObservers:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation DBHomeManager

- (DBHomeManager)init
{
  v26.receiver = self;
  v26.super_class = (Class)DBHomeManager;
  v2 = [(DBHomeManager *)&v26 init];
  if (v2)
  {
    v3 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      [(DBHomeManager *)(uint64_t)v2 init];
    }

    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.DashBoard.homemanager", v10);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = +[DBLocationManager homeKitLocationManager];
    locationManager = v2->_locationManager;
    v2->_locationManager = (DBLocationManager *)v13;

    uint64_t v15 = objc_opt_new();
    networkPathMonitor = v2->_networkPathMonitor;
    v2->_networkPathMonitor = (DBNetworkPathMonitor *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1A24D8];
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v17;

    uint64_t v19 = objc_opt_new();
    homes = v2->_homes;
    v2->_homes = (NSDictionary *)v19;

    objc_initWeak(&location, v2);
    v21 = [(DBHomeManager *)v2 workQueue];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __21__DBHomeManager_init__block_invoke;
    v23[3] = &unk_2649B4738;
    objc_copyWeak(&v24, &location);
    dispatch_async(v21, v23);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __21__DBHomeManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _authorizeHomeManager];
}

- (void)dealloc
{
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBHomeManager *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBHomeManager *)self observers];
  [v5 removeObserver:v4];
}

- (void)_authorizeHomeManager
{
  id v3 = objc_alloc(MEMORY[0x263F42550]);
  uint64_t v4 = [(DBHomeManager *)self locationManager];
  id v5 = [(id)v4 bundle];
  uint64_t v6 = (void *)[v3 initWithBundle:v5];
  [(DBHomeManager *)self setHomeLocationAuthorization:v6];

  uint64_t v7 = [(DBHomeManager *)self homeLocationAuthorization];
  LOBYTE(v4) = [v7 isAuthorized];

  if (v4)
  {
    [(DBHomeManager *)self _setupHomeManager];
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v8 = [(DBHomeManager *)self homeLocationAuthorization];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__DBHomeManager__authorizeHomeManager__block_invoke;
    v9[3] = &unk_2649B6B60;
    objc_copyWeak(&v10, &location);
    [v8 requestAuthorization:2 completionHandler:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __38__DBHomeManager__authorizeHomeManager__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__DBHomeManager__authorizeHomeManager__block_invoke_2;
  v5[3] = &unk_2649B6B38;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v7);
}

void __38__DBHomeManager__authorizeHomeManager__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    v2 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __38__DBHomeManager__authorizeHomeManager__block_invoke_2_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _setupHomeManager];
  }
}

- (void)_setupHomeManager
{
  uint64_t v3 = [(DBHomeManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__DBHomeManager__setupHomeManager__block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(v3, block);
}

void __34__DBHomeManager__setupHomeManager__block_invoke(uint64_t a1)
{
  v2 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __34__DBHomeManager__setupHomeManager__block_invoke_cold_1(v2);
  }

  uint64_t v3 = [MEMORY[0x263F0E5A8] defaultPrivateConfiguration];
  uint64_t v4 = [*(id *)(a1 + 32) homeLocationAuthorization];
  [v3 setLocationAuthorization:v4];

  [v3 setOptions:513];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F0E3C0]) initWithHomeMangerConfiguration:v3];
  [*(id *)(a1 + 32) setHomeManager:v5];

  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 homeManager];
  [v7 setDelegate:v6];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBHomeManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__DBHomeManager_homeManagerDidUpdateHomes___block_invoke;
  v7[3] = &unk_2649B3D30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__DBHomeManager_homeManagerDidUpdateHomes___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v2 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __43__DBHomeManager_homeManagerDidUpdateHomes___block_invoke_cold_2(v2);
  }

  uint64_t v3 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v5 = *(void **)(a1 + 32);
  id v4 = (id *)(a1 + 32);
  id v6 = [v5 homes];
  uint64_t v7 = [v6 allKeys];
  v36 = [v3 setWithArray:v7];

  id v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = [v4[1] homes];
  uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        v14 = v9;
        uint64_t v15 = v8;
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v17 = [v16 uniqueIdentifier];
        [v36 removeObject:v17];

        v18 = [*v4 homes];
        uint64_t v19 = [v16 uniqueIdentifier];
        v20 = [v18 objectForKeyedSubscript:v19];

        if (!v20) {
          v20 = [[DBHome alloc] initWithHome:v16 resourceProvider:*v4];
        }
        v21 = [(DBHome *)v20 uniqueIdentifier];
        uint64_t v9 = v14;
        [v14 setObject:v20 forKeyedSubscript:v21];

        id v8 = v15;
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v11);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v22 = v36;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        v28 = [*v4 homes];
        v29 = [v28 objectForKeyedSubscript:v27];
        [v8 setObject:v29 forKeyedSubscript:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v24);
  }

  v30 = [*v4 observers];
  [v30 homeManager:*v4 willRemoveHomes:v8];

  [*v4 setHomes:v9];
  v31 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    __43__DBHomeManager_homeManagerDidUpdateHomes___block_invoke_cold_1(v4, (uint64_t)v8, v31);
  }

  v32 = [*v4 observers];
  id v33 = *v4;
  v34 = [v33 homes];
  [v32 homeManager:v33 didUpdateHomes:v34];
}

- (NSDictionary)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
}

- (DBLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (DBNetworkPathMonitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (void)setNetworkPathMonitor:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (HMFLocationAuthorization)homeLocationAuthorization
{
  return self->_homeLocationAuthorization;
}

- (void)setHomeLocationAuthorization:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return (CARObserverHashTable *)objc_getProperty(self, a2, 56, 1);
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_homeLocationAuthorization, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_homes, 0);
}

- (void)init
{
}

void __38__DBHomeManager__authorizeHomeManager__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, a2, a3, "requestAuthorization error=%{public}@", a5, a6, a7, a8, 2u);
}

void __34__DBHomeManager__setupHomeManager__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_22D6F0000, log, OS_LOG_TYPE_DEBUG, "Setting up homeManager", v1, 2u);
}

void __43__DBHomeManager_homeManagerDidUpdateHomes___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a1 homes];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_22D6F0000, a3, OS_LOG_TYPE_DEBUG, "newHomes=%{public}@ removedHomes=%{public}@", (uint8_t *)&v6, 0x16u);
}

void __43__DBHomeManager_homeManagerDidUpdateHomes___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_22D6F0000, log, OS_LOG_TYPE_DEBUG, "Updating homes", v1, 2u);
}

@end