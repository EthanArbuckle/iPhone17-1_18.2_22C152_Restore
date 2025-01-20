@interface DSAppSharing
- (DSAppSharing)initWithTCCStore:(id)a3;
- (DSTCCStore)tccStore;
- (HKAuthorizationStore)authorizationStore;
- (HKHealthStore)healthKitStore;
- (OS_dispatch_queue)workQueue;
- (id)deleteApp:(id)a3 forTest:(BOOL)a4;
- (id)newDictionaryWithApps:(id)a3;
- (id)removeAppsWithNoPermissions:(id)a3;
- (void)addApp:(id)a3 toMap:(id)a4 withLocationAuthorization:(unint64_t)a5;
- (void)addApp:(id)a3 toMap:(id)a4 withService:(id)a5;
- (void)addHealthPermissionsToAppMap:(id)a3 handler:(id)a4;
- (void)addLocalNetworkPermissionsToAppMap:(id)a3 handler:(id)a4;
- (void)addLocationPermissions:(id)a3;
- (void)addTCCPermissionsToAppMap:(id)a3 handler:(id)a4;
- (void)approvedBundleIdForKappa:(id)a3 handler:(id)a4;
- (void)collectAppsWithAccessToService:(id)a3 appMap:(id)a4 completionHandler:(id)a5;
- (void)collectPermissionsForApps:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)resetBackgroundAppRefresh:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)resetHealthPermissionsForApp:(id)a3 withCompletionHandler:(id)a4;
- (void)resetPermission:(id)a3 forApp:(id)a4 handler:(id)a5;
- (void)resetPermission:(id)a3 forApps:(id)a4 handler:(id)a5;
- (void)resetPermissions:(id)a3 forApps:(id)a4 queue:(id)a5 handler:(id)a6;
- (void)resetShortcutsAutomationTimer:(id)a3 handler:(id)a4;
- (void)setAuthorizationStore:(id)a3;
- (void)setHealthKitStore:(id)a3;
- (void)setTccStore:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation DSAppSharing

- (DSAppSharing)initWithTCCStore:(id)a3
{
  v4 = (DSTCCStore *)a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    os_log_t v6 = os_log_create("com.apple.DigitalSeparation", "DSAppSharing");
    v7 = (void *)DSLog;
    DSLog = (uint64_t)v6;
  }
  tccStore = self->_tccStore;
  self->_tccStore = v4;
  v9 = v4;

  v10 = (HKHealthStore *)objc_alloc_init(MEMORY[0x263F0A410]);
  healthKitStore = self->_healthKitStore;
  self->_healthKitStore = v10;

  v12 = (HKAuthorizationStore *)[objc_alloc(MEMORY[0x263F0A118]) initWithHealthStore:self->_healthKitStore];
  authorizationStore = self->_authorizationStore;
  self->_authorizationStore = v12;

  dispatch_queue_t v14 = dispatch_queue_create("AppPermissionsQueue", 0);
  [(DSAppSharing *)self setWorkQueue:v14];

  return self;
}

- (void)collectPermissionsForApps:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v11 = [(DSAppSharing *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke;
  block[3] = &unk_264C9E530;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = (void *)[WeakRetained newDictionaryWithApps:*(void *)(a1 + 32)];
  [WeakRetained addLocationPermissions:v4];
  objc_initWeak(&location, WeakRetained);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_2;
  v7[3] = &unk_264C9E508;
  id v5 = v3;
  id v8 = v5;
  objc_copyWeak(&v12, &location);
  id v6 = v4;
  id v9 = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  [WeakRetained addTCCPermissionsToAppMap:v6 handler:v7];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] addObjectsFromArray:v3];
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  objc_initWeak(&location, WeakRetained);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_3;
  v6[3] = &unk_264C9E508;
  id v5 = a1[5];
  id v7 = a1[4];
  objc_copyWeak(&v11, &location);
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  [WeakRetained addHealthPermissionsToAppMap:v5 handler:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] addObjectsFromArray:v3];
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  objc_initWeak(&location, WeakRetained);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_4;
  v6[3] = &unk_264C9E4E0;
  id v5 = a1[5];
  id v7 = a1[4];
  objc_copyWeak(&v11, &location);
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  [WeakRetained addLocalNetworkPermissionsToAppMap:v5 handler:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = [*(id *)(a1 + 40) allValues];
  id v5 = [v4 sortedArrayUsingSelector:sel_compare_];
  id v6 = [WeakRetained removeAppsWithNoPermissions:v5];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_5;
  block[3] = &unk_264C9E418;
  id v7 = *(NSObject **)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v10 = v6;
  id v11 = *(id *)(a1 + 32);
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)removeAppsWithNoPermissions:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (!+[DSApp appHasNoPermissions:](DSApp, "appHasNoPermissions:", v10, (void)v12)) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)addApp:(id)a3 toMap:(id)a4 withLocationAuthorization:(unint64_t)a5
{
  id v12 = a4;
  id v8 = a3;
  id v9 = [(DSAppSharing *)self workQueue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [v12 objectForKey:v8];

  if (v10)
  {
    [v10 setLocationAuthorization:a5];
    id v11 = [v10 appID];
    [v12 setValue:v10 forKey:v11];
  }
}

- (void)addApp:(id)a3 toMap:(id)a4 withService:(id)a5
{
  id v14 = a4;
  id v8 = (__CFString *)a5;
  id v9 = a3;
  uint64_t v10 = [(DSAppSharing *)self workQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [v14 objectForKey:v9];

  if (v11)
  {
    if (+[DSUtilities isContactsTCC:v8])
    {

      id v8 = @"DSContacts";
    }
    id v12 = [v11 permissionsGranted];
    [v12 addObject:v8];

    long long v13 = [v11 appID];
    [v14 setValue:v11 forKey:v13];
  }
}

- (id)newDictionaryWithApps:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DSAppSharing *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
        long long v13 = objc_alloc_init(DSApp);
        -[DSApp setAppID:](v13, "setAppID:", v12, (void)v20);
        id v14 = [(DSApp *)v13 appID];
        long long v15 = displayNameForApp(v14);
        [(DSApp *)v13 setDisplayName:v15];

        id v16 = [(DSApp *)v13 displayName];

        if (v16)
        {
          id v17 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          [(DSApp *)v13 setPermissionsGranted:v17];

          id v18 = [(DSApp *)v13 appID];
          [v6 setValue:v13 forKey:v18];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)collectAppsWithAccessToService:(id)a3 appMap:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(DSAppSharing *)self workQueue];
  dispatch_assert_queue_V2(v11);

  if (+[DSApp skipTCCCheck:v8])
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  else
  {
    tccStore = self->_tccStore;
    long long v13 = [(DSAppSharing *)self workQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __72__DSAppSharing_collectAppsWithAccessToService_appMap_completionHandler___block_invoke;
    v14[3] = &unk_264C9E558;
    id v15 = v9;
    id v16 = self;
    id v17 = v8;
    id v18 = v10;
    [(DSTCCStore *)tccStore appsWithPermissionGrantedForService:v17 queue:v13 completionHandler:v14];
  }
}

void __72__DSAppSharing_collectAppsWithAccessToService_appMap_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
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
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([v5 containsObject:v12]) {
          [*(id *)(a1 + 40) addApp:v12 toMap:*(void *)(a1 + 32) withService:*(void *)(a1 + 48)];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)addTCCPermissionsToAppMap:(id)a3 handler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v21 = a4;
  id v6 = [(DSAppSharing *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = dispatch_group_create();
  uint64_t v8 = +[DSUtilities tccServices];
  uint64_t v9 = +[DSUtilities contactsServices];
  uint64_t v10 = [v9 allObjects];
  uint64_t v11 = [v8 arrayByAddingObjectsFromArray:v10];

  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * v16);
        dispatch_group_enter(v7);
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __50__DSAppSharing_addTCCPermissionsToAppMap_handler___block_invoke;
        v27[3] = &unk_264C9E580;
        id v28 = v12;
        v29 = v7;
        [(DSAppSharing *)self collectAppsWithAccessToService:v17 appMap:v23 completionHandler:v27];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(DSAppSharing *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__DSAppSharing_addTCCPermissionsToAppMap_handler___block_invoke_2;
  block[3] = &unk_264C9E3F0;
  id v25 = v12;
  id v26 = v21;
  id v19 = v12;
  id v20 = v21;
  dispatch_group_notify(v7, v18, block);
}

void __50__DSAppSharing_addTCCPermissionsToAppMap_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  }
  id v4 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v4);
}

uint64_t __50__DSAppSharing_addTCCPermissionsToAppMap_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addLocationPermissions:(id)a3
{
  id v4 = a3;
  id v5 = [(DSAppSharing *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(DSTCCStore *)self->_tccStore appsWithLocationService];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__DSAppSharing_addLocationPermissions___block_invoke;
  v8[3] = &unk_264C9E5A8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __39__DSAppSharing_addLocationPermissions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(*(void *)(a1 + 32) + 8) isEntityClassApplication:v5]) {
    objc_msgSend(*(id *)(a1 + 32), "addApp:toMap:withLocationAuthorization:", v6, *(void *)(a1 + 40), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "locationAuthorizationForApp:", v5));
  }
}

- (void)addHealthPermissionsToAppMap:(id)a3 handler:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v20 = a4;
  id v7 = [(DSAppSharing *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = dispatch_group_create();
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v22 = v6;
  id obj = [v6 allKeys];
  uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * v13);
        dispatch_group_enter(v8);
        tccStore = self->_tccStore;
        authorizationStore = self->_authorizationStore;
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __53__DSAppSharing_addHealthPermissionsToAppMap_handler___block_invoke;
        v26[3] = &unk_264C9E5F8;
        v27 = v8;
        id v28 = self;
        uint64_t v29 = v14;
        id v30 = v22;
        id v31 = v9;
        [(DSTCCStore *)tccStore healthAuthorizationForApp:v14 andAuthorizationStore:authorizationStore withCompletionHandler:v26];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v11);
  }

  uint64_t v17 = [(DSAppSharing *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__DSAppSharing_addHealthPermissionsToAppMap_handler___block_invoke_3;
  block[3] = &unk_264C9E3F0;
  id v24 = v9;
  id v25 = v20;
  id v18 = v9;
  id v19 = v20;
  dispatch_group_notify(v8, v17, block);
}

void __53__DSAppSharing_addHealthPermissionsToAppMap_handler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(NSObject **)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__DSAppSharing_addHealthPermissionsToAppMap_handler___block_invoke_2;
    block[3] = &unk_264C9E5D0;
    long long v9 = *(_OWORD *)(a1 + 40);
    id v10 = *(id *)(a1 + 56);
    dispatch_group_notify(v6, v7, block);
  }
  if (v5) {
    [*(id *)(a1 + 64) addObject:v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __53__DSAppSharing_addHealthPermissionsToAppMap_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addApp:*(void *)(a1 + 40) toMap:*(void *)(a1 + 48) withService:@"DSHealth"];
}

uint64_t __53__DSAppSharing_addHealthPermissionsToAppMap_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addLocalNetworkPermissionsToAppMap:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DSAppSharing *)self workQueue];
  dispatch_assert_queue_V2(v8);

  tccStore = self->_tccStore;
  id v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = [v6 allKeys];
  uint64_t v12 = [v10 setWithArray:v11];
  uint64_t v13 = [(DSAppSharing *)self workQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__DSAppSharing_addLocalNetworkPermissionsToAppMap_handler___block_invoke;
  v16[3] = &unk_264C9E620;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  [(DSTCCStore *)tccStore allAppsWithLocalNetworkAccess:v12 queue:v13 handler:v16];
}

void __59__DSAppSharing_addLocalNetworkPermissionsToAppMap_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) addApp:*(void *)(*((void *)&v11 + 1) + 8 * v10++) toMap:*(void *)(a1 + 40) withService:@"DSLocalNetwork"];
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)deleteApp:(id)a3 forTest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (+[DSRestrictionStore isAppRemovalRestricted])
  {
    uint64_t v7 = DSLog;
    if (os_log_type_enabled((os_log_t)DSLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v11 = 0;
      _os_log_impl(&dword_236090000, v7, OS_LOG_TYPE_INFO, "Cannot delete app due to device restrictions", v11, 2u);
    }
    uint64_t v8 = displayNameForApp(v6);
    uint64_t v9 = +[DSError errorWithCode:8 appName:v8];
  }
  else
  {
    uint64_t v9 = [(DSTCCStore *)self->_tccStore deleteApp:v6 forTest:v4];
  }

  return v9;
}

- (void)resetPermission:(id)a3 forApps:(id)a4 handler:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v8 = a4;
  id v19 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v10 = dispatch_group_create();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * v14);
        dispatch_group_enter(v10);
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __48__DSAppSharing_resetPermission_forApps_handler___block_invoke;
        v25[3] = &unk_264C9E648;
        id v26 = v9;
        v27 = v10;
        [(DSAppSharing *)self resetPermission:v21 forApp:v15 handler:v25];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(DSAppSharing *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__DSAppSharing_resetPermission_forApps_handler___block_invoke_2;
  block[3] = &unk_264C9E3F0;
  id v23 = v9;
  id v24 = v19;
  id v17 = v9;
  id v18 = v19;
  dispatch_group_notify(v10, v16, block);
}

void __48__DSAppSharing_resetPermission_forApps_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObjectsFromArray:a2];
  id v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

uint64_t __48__DSAppSharing_resetPermission_forApps_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)resetPermissions:(id)a3 forApps:(id)a4 queue:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(DSAppSharing *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke;
  block[3] = &unk_264C9E710;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  dispatch_group_t v3 = dispatch_group_create();
  objc_initWeak(&location, *(id *)(a1 + 32));
  BOOL v4 = [*(id *)(a1 + 40) allObjects];
  size_t v5 = [*(id *)(a1 + 40) count];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_2;
  block[3] = &unk_264C9E6E8;
  dispatch_group_t v18 = v3;
  id v19 = v4;
  id v6 = v4;
  uint64_t v7 = v3;
  objc_copyWeak(&v23, &location);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v20 = v8;
  uint64_t v21 = v9;
  id v10 = v2;
  id v22 = v10;
  dispatch_apply(v5, 0, block);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_7;
  v14[3] = &unk_264C9E3F0;
  id v11 = *(NSObject **)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  id v15 = v10;
  id v16 = v12;
  id v13 = v10;
  dispatch_group_notify(v7, v11, v14);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  BOOL v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v6 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_3;
  v9[3] = &unk_264C9E6C0;
  id v7 = v4;
  id v10 = v7;
  objc_copyWeak(&v14, (id *)(a1 + 72));
  id v8 = *(void **)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 56);
  id v12 = v8;
  id v13 = *(id *)(a1 + 32);
  [WeakRetained resetPermission:v7 forApps:v6 handler:v9];

  objc_destroyWeak(&v14);
}

void __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] isEqualToString:@"DSLocalNetwork"])
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 8);
    size_t v5 = [WeakRetained tccStore];
    uint64_t v6 = [WeakRetained workQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_4;
    v15[3] = &unk_264C9E698;
    id v7 = v3;
    id v8 = a1[5];
    id v9 = a1[6];
    id v16 = v7;
    id v17 = v8;
    id v18 = v9;
    id v19 = a1[7];
    [v5 saveConfiguration:v6 handler:v15];

LABEL_5:
    dispatch_group_leave((dispatch_group_t)a1[7]);
    goto LABEL_6;
  }
  if (![v3 count]) {
    goto LABEL_5;
  }
  id v10 = [a1[5] workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_6;
  block[3] = &unk_264C9E5D0;
  id v12 = a1[6];
  id v13 = v3;
  id v14 = a1[7];
  dispatch_async(v10, block);

LABEL_6:
}

void __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_4(id *a1, void *a2)
{
  id v3 = a2;
  if ([v3 count] || objc_msgSend(a1[4], "count"))
  {
    BOOL v4 = [a1[5] workQueue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_5;
    v5[3] = &unk_264C9E670;
    id v6 = a1[6];
    id v7 = v3;
    id v8 = a1[4];
    id v9 = a1[7];
    dispatch_async(v4, v5);
  }
}

void __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(a1 + 48)];
  id v2 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v2);
}

void __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(a1 + 40)];
  id v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

uint64_t __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)resetPermission:(id)a3 forApp:(id)a4 handler:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (+[DSRestrictionStore isPermissionRestricted:v8]
    && [(DSTCCStore *)self->_tccStore isServiceGranted:v8 forApp:v9])
  {
    uint64_t v11 = DSLog;
    if (os_log_type_enabled((os_log_t)DSLog, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_236090000, v11, OS_LOG_TYPE_INFO, "Cannot reset permission %@ for app %@ due to screen time restrictions", (uint8_t *)&v17, 0x16u);
    }
    id v12 = (void *)MEMORY[0x263EFF8C0];
    id v13 = +[DSError errorWithCode:7 serviceName:v8];
    id v14 = [v12 arrayWithObject:v13];
    v10[2](v10, v14);
  }
  else if (([v8 isEqualToString:@"DSLocationAlways"] & 1) != 0 {
         || [v8 isEqualToString:@"DSLocationWhenInUse"])
  }
  {
    [(DSTCCStore *)self->_tccStore resetLocationPermissionForApp:v9];
    v10[2](v10, 0);
  }
  else if ([v8 isEqualToString:@"DSHealth"])
  {
    [(DSAppSharing *)self resetHealthPermissionsForApp:v9 withCompletionHandler:v10];
  }
  else
  {
    if ([v8 isEqualToString:@"DSLocalNetwork"])
    {
      tccStore = self->_tccStore;
      id v16 = [(DSAppSharing *)self workQueue];
      [(DSTCCStore *)tccStore resetLocalNetworkPermissionForApp:v9 queue:v16 handler:v10];
    }
    else
    {
      id v16 = [(DSTCCStore *)self->_tccStore resetTCCPermission:v8 forApp:v9];
      v10[2](v10, v16);
    }
  }
}

- (void)resetHealthPermissionsForApp:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __67__DSAppSharing_resetHealthPermissionsForApp_withCompletionHandler___block_invoke;
  id v14 = &unk_264C9E738;
  id v15 = v6;
  id v16 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = (void *)MEMORY[0x237DFC200](&v11);
  -[DSTCCStore resetHealthPermissionsForApp:withAuthorizationStore:andCompletionHandler:](self->_tccStore, "resetHealthPermissionsForApp:withAuthorizationStore:andCompletionHandler:", v9, self->_authorizationStore, v10, v11, v12, v13, v14);
}

void __67__DSAppSharing_resetHealthPermissionsForApp_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v4, 0);
    id v8 = +[DSError errorWithCode:4 appName:v6 serviceName:@"DSHealth" underlyingErrors:v7];
    [v5 addObject:v8];

    id v9 = DSLog;
    if (os_log_type_enabled((os_log_t)DSLog, OS_LOG_TYPE_ERROR)) {
      __67__DSAppSharing_resetHealthPermissionsForApp_withCompletionHandler___block_invoke_cold_1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resetBackgroundAppRefresh:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(DSAppSharing *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DSAppSharing_resetBackgroundAppRefresh_queue_handler___block_invoke;
  block[3] = &unk_264C9E788;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);
}

void __56__DSAppSharing_resetBackgroundAppRefresh_queue_handler___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v2 = (void *)get_DASSchedulerClass_softClass;
  uint64_t v13 = get_DASSchedulerClass_softClass;
  if (!get_DASSchedulerClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __get_DASSchedulerClass_block_invoke;
    v9[3] = &unk_264C9E7D8;
    void v9[4] = &v10;
    __get_DASSchedulerClass_block_invoke((uint64_t)v9);
    id v2 = (void *)v11[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v10, 8);
  id v4 = [v3 sharedScheduler];
  id v5 = [*(id *)(a1 + 32) allObjects];
  [v4 disableAppRefreshForApps:v5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__DSAppSharing_resetBackgroundAppRefresh_queue_handler___block_invoke_2;
  v7[3] = &unk_264C9E760;
  uint64_t v6 = *(NSObject **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v6, v7);
}

uint64_t __56__DSAppSharing_resetBackgroundAppRefresh_queue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetShortcutsAutomationTimer:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DSAppSharing *)self workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__DSAppSharing_resetShortcutsAutomationTimer_handler___block_invoke;
  v11[3] = &unk_264C9E4B8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __54__DSAppSharing_resetShortcutsAutomationTimer_handler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F85128] standardClient];
  id v18 = 0;
  char v3 = [v2 resetAutomationConfirmationStatusWithError:&v18];
  id v4 = v18;
  if ((v3 & 1) == 0)
  {
    id v5 = DSLog;
    if (os_log_type_enabled((os_log_t)DSLog, OS_LOG_TYPE_ERROR)) {
      __54__DSAppSharing_resetShortcutsAutomationTimer_handler___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__DSAppSharing_resetShortcutsAutomationTimer_handler___block_invoke_373;
  block[3] = &unk_264C9E3F0;
  id v12 = *(NSObject **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v16 = v4;
  id v17 = v13;
  id v14 = v4;
  dispatch_async(v12, block);
}

uint64_t __54__DSAppSharing_resetShortcutsAutomationTimer_handler___block_invoke_373(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)approvedBundleIdForKappa:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(DSAppSharing *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__DSAppSharing_approvedBundleIdForKappa_handler___block_invoke;
  block[3] = &unk_264C9E530;
  objc_copyWeak(&v14, &location);
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __49__DSAppSharing_approvedBundleIdForKappa_handler___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  char v3 = (void *)WeakRetained[1];
  uint64_t v4 = *MEMORY[0x263F7C530];
  id v5 = [a1[4] workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__DSAppSharing_approvedBundleIdForKappa_handler___block_invoke_2;
  v6[3] = &unk_264C9E7B0;
  id v7 = a1[5];
  id v8 = a1[6];
  [v3 appsWithPermissionGrantedForService:v4 queue:v5 completionHandler:v6];
}

void __49__DSAppSharing_approvedBundleIdForKappa_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count] == 1)
  {
    uint64_t v4 = [v3 anyObject];
  }
  else
  {
    uint64_t v4 = &stru_26E96B9B0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__DSAppSharing_approvedBundleIdForKappa_handler___block_invoke_3;
  v8[3] = &unk_264C9E3F0;
  id v5 = *(NSObject **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(v5, v8);
}

uint64_t __49__DSAppSharing_approvedBundleIdForKappa_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (DSTCCStore)tccStore
{
  return self->_tccStore;
}

- (void)setTccStore:(id)a3
{
}

- (HKHealthStore)healthKitStore
{
  return self->_healthKitStore;
}

- (void)setHealthKitStore:(id)a3
{
}

- (HKAuthorizationStore)authorizationStore
{
  return self->_authorizationStore;
}

- (void)setAuthorizationStore:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
  objc_storeStrong((id *)&self->_healthKitStore, 0);
  objc_storeStrong((id *)&self->_tccStore, 0);
}

void __67__DSAppSharing_resetHealthPermissionsForApp_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__DSAppSharing_resetShortcutsAutomationTimer_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end