@interface COIDSBrowser
- (COBrowserObserverSet)observerSet;
- (COIDSBrowser)initWithMeshName:(id)a3 idsServiceName:(id)a4;
- (COIDSPresence)presence;
- (COIDSServiceDirector)serviceDirector;
- (NSObject)idsRegistryObserver;
- (NSString)description;
- (NSString)meshName;
- (OS_dispatch_queue)workQueue;
- (id)addObserverUsingBlock:(id)a3;
- (id)idsPresenceProvider;
- (id)idsServiceProvider;
- (id)registeredObservers;
- (void)didAddDevice:(id)a3;
- (void)didRemoveDevice:(id)a3;
- (void)onDemandDiscoveryForRequest:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setIdsPresenceProvider:(id)a3;
- (void)setIdsRegistryObserver:(id)a3;
- (void)setIdsServiceProvider:(id)a3;
- (void)setPresence:(id)a3;
- (void)setServiceDirector:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)stop;
@end

@implementation COIDSBrowser

- (COIDSBrowser)initWithMeshName:(id)a3 idsServiceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)COIDSBrowser;
  v8 = [(COIDSBrowser *)&v30 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    meshName = v8->_meshName;
    v8->_meshName = (NSString *)v9;

    v11 = objc_alloc_init(COBrowserObserverSet);
    observerSet = v8->_observerSet;
    v8->_observerSet = v11;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coordination.idsbrowser.%p", v8);
    id v13 = objc_claimAutoreleasedReturnValue();
    v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v16;

    objc_initWeak(&location, v8);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __48__COIDSBrowser_initWithMeshName_idsServiceName___block_invoke;
    v26[3] = &unk_2645CEB18;
    objc_copyWeak(&v28, &location);
    id v27 = v6;
    uint64_t v18 = MEMORY[0x223C8B4A0](v26);
    id idsPresenceProvider = v8->_idsPresenceProvider;
    v8->_id idsPresenceProvider = (id)v18;

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __48__COIDSBrowser_initWithMeshName_idsServiceName___block_invoke_2;
    v23[3] = &unk_2645CEB40;
    objc_copyWeak(&v25, &location);
    id v24 = v7;
    uint64_t v20 = MEMORY[0x223C8B4A0](v23);
    id idsServiceProvider = v8->_idsServiceProvider;
    v8->_id idsServiceProvider = (id)v20;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v8;
}

id __48__COIDSBrowser_initWithMeshName_idsServiceName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = +[COIDSPresence presenceForMesh:*(void *)(a1 + 32)];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __48__COIDSBrowser_initWithMeshName_idsServiceName___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    v3 = (void *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:*(void *)(a1 + 32)];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(COIDSBrowser *)self meshName];
  id v7 = [v3 stringWithFormat:@"<%@: %p, mesh = %@>", v5, self, v6];

  return (NSString *)v7;
}

- (id)addObserverUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [[COBrowserObserver alloc] initWithBlock:v4];

  id v6 = [(COIDSBrowser *)self observerSet];
  [v6 addObserver:v5];

  return v5;
}

- (id)registeredObservers
{
  v2 = [(COIDSBrowser *)self observerSet];
  v3 = [v2 observers];

  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(COIDSBrowser *)self observerSet];
  [v5 removeObserver:v4];
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__COIDSBrowser_startWithCompletionHandler___block_invoke;
  v7[3] = &unk_2645CBA10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __43__COIDSBrowser_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    *(unsigned char *)(v2 + 8) = 1;
    id v4 = [*(id *)(a1 + 32) idsPresenceProvider];
    id v5 = v4[2]();
    [*(id *)(a1 + 32) setPresence:v5];
    id v6 = *(void **)(a1 + 32);
    id v7 = [v6 workQueue];
    [v5 addObserver:v6 queue:v7];

    id v8 = [*(id *)(a1 + 32) idsServiceProvider];
    uint64_t v9 = v8[2]();
    v10 = [COIDSServiceDirector alloc];
    v11 = [*(id *)(a1 + 32) meshName];
    uint64_t v12 = [(COIDSServiceDirector *)v10 initWithIDSService:v9 meshName:v11];
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 64);
    *(void *)(v13 + 64) = v12;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setDiscoveryDelegate:");
    v15 = [*(id *)(a1 + 32) serviceDirector];
    [v15 start];

    dispatch_queue_t v16 = COCoreLogForCategory(14);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v18 = 138543362;
      uint64_t v19 = v17;
      _os_log_impl(&dword_2217C1000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ IDS browser started", (uint8_t *)&v18, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)stop
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __20__COIDSBrowser_stop__block_invoke;
  block[3] = &unk_2645CB288;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __20__COIDSBrowser_stop__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ IDS browser stopping", (uint8_t *)&v6, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  id v4 = [*(id *)(a1 + 32) presence];
  [v4 removeObserver:*(void *)(a1 + 32)];

  return [*(id *)(a1 + 32) setPresence:0];
}

- (void)didAddDevice:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p IDS browser found device %{public}@", (uint8_t *)&v8, 0x16u);
  }

  int v6 = [(COIDSBrowser *)self serviceDirector];
  [v4 setServiceDirector:v6];

  uint64_t v7 = [(COIDSBrowser *)self observerSet];
  [v7 informObserverAboutDevice:v4 added:1];
}

- (void)didRemoveDevice:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    int v8 = self;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p IDS browser lost device %{public}@", (uint8_t *)&v7, 0x16u);
  }

  int v6 = [(COIDSBrowser *)self observerSet];
  [v6 informObserverAboutDevice:v4 added:0];
}

- (void)onDemandDiscoveryForRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 idsIdentifier];
  int v6 = [v4 fromURIToken];
  int v7 = [[COIDSDiscoveryRecord alloc] initWithIdsIdentifier:v5 deviceTokenURI:v6];
  [(COIDSDiscoveryRecord *)v7 setOnDemandRequest:v4];

  int v8 = [(COIDSBrowser *)self serviceDirector];
  [(COIDSDiscoveryRecord *)v7 setServiceDirector:v8];

  __int16 v9 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    uint64_t v12 = self;
    __int16 v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%p IDS browser got demand node request %{public}@", (uint8_t *)&v11, 0x16u);
  }

  id v10 = [(COIDSBrowser *)self observerSet];
  [v10 informObserverAboutDevice:v7 added:1];
}

- (COBrowserObserverSet)observerSet
{
  return self->_observerSet;
}

- (NSString)meshName
{
  return self->_meshName;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSObject)idsRegistryObserver
{
  return self->_idsRegistryObserver;
}

- (void)setIdsRegistryObserver:(id)a3
{
}

- (id)idsPresenceProvider
{
  return self->_idsPresenceProvider;
}

- (void)setIdsPresenceProvider:(id)a3
{
}

- (COIDSPresence)presence
{
  return self->_presence;
}

- (void)setPresence:(id)a3
{
}

- (COIDSServiceDirector)serviceDirector
{
  return self->_serviceDirector;
}

- (void)setServiceDirector:(id)a3
{
}

- (id)idsServiceProvider
{
  return self->_idsServiceProvider;
}

- (void)setIdsServiceProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_idsServiceProvider, 0);
  objc_storeStrong((id *)&self->_serviceDirector, 0);
  objc_storeStrong((id *)&self->_presence, 0);
  objc_storeStrong(&self->_idsPresenceProvider, 0);
  objc_storeStrong((id *)&self->_idsRegistryObserver, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_meshName, 0);
  objc_storeStrong((id *)&self->_observerSet, 0);
}

@end