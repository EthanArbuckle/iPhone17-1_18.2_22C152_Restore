@interface HFProxControlActivityClientManager
+ (id)sharedInstance;
- (BOOL)hasStartedMonitoringUpdates;
- (BOOL)useSAConfig;
- (HFProxControlActivityClientManager)init;
- (NSHashTable)observers;
- (NSObject)lastIdentifier;
- (NSOrderedSet)lastActivities;
- (NSUUID)accessoryID;
- (NSUUID)homeID;
- (OS_dispatch_queue)dataModelUpdateQueue;
- (PCDisambiguationContext)lastDisambiguationContext;
- (PCRemoteActivityClient)proxControlActivityClient;
- (id)_setupProxControlClient;
- (id)startMonitoringUpdatesForAccessoryID:(id)a3 homeID:(id)a4;
- (id)startMonitoringUpdatesForMediaRemoteIdentifier:(id)a3;
- (void)_notifyObserversForUpdatedActivities:(id)a3 forProxControlID:(id)a4 disambiguationContext:(id)a5;
- (void)_resetProxClient;
- (void)addObserver:(id)a3;
- (void)invalidateProxClient;
- (void)removeObserver:(id)a3;
- (void)setAccessoryID:(id)a3;
- (void)setDataModelUpdateQueue:(id)a3;
- (void)setHasStartedMonitoringUpdates:(BOOL)a3;
- (void)setHomeID:(id)a3;
- (void)setLastActivities:(id)a3;
- (void)setLastDisambiguationContext:(id)a3;
- (void)setLastIdentifier:(id)a3;
- (void)setObservers:(id)a3;
- (void)setProxControlActivityClient:(id)a3;
- (void)setUseSAConfig:(BOOL)a3;
- (void)userTappedCloseButton;
- (void)userTappedDisambiguationButtonForContext:(id)a3;
@end

@implementation HFProxControlActivityClientManager

+ (id)sharedInstance
{
  if (qword_26AB2F588 != -1) {
    dispatch_once(&qword_26AB2F588, &__block_literal_global_143);
  }
  v2 = (void *)_MergedGlobals_278;
  return v2;
}

uint64_t __52__HFProxControlActivityClientManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HFProxControlActivityClientManager);
  uint64_t v1 = _MergedGlobals_278;
  _MergedGlobals_278 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFProxControlActivityClientManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)HFProxControlActivityClientManager;
  v2 = [(HFProxControlActivityClientManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Home.proxControlDataModelUpdateQueue", 0);
    dataModelUpdateQueue = v2->_dataModelUpdateQueue;
    v2->_dataModelUpdateQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  v6 = [(HFProxControlActivityClientManager *)self dataModelUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__HFProxControlActivityClientManager_addObserver___block_invoke;
  block[3] = &unk_26408D8A0;
  v10 = self;
  SEL v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __50__HFProxControlActivityClientManager_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "%@ Adding observer = %@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = [*(id *)(a1 + 40) observers];
  [v5 addObject:*(void *)(a1 + 32)];
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  int v6 = [(HFProxControlActivityClientManager *)self dataModelUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HFProxControlActivityClientManager_removeObserver___block_invoke;
  block[3] = &unk_26408D8A0;
  uint64_t v10 = self;
  SEL v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __53__HFProxControlActivityClientManager_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "%@ Removing observer = %@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = [*(id *)(a1 + 40) observers];
  [v5 removeObject:*(void *)(a1 + 32)];
}

- (id)startMonitoringUpdatesForMediaRemoteIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HFProxControlActivityClientManager *)self _setupProxControlClient];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __85__HFProxControlActivityClientManager_startMonitoringUpdatesForMediaRemoteIdentifier___block_invoke;
  v9[3] = &unk_2640910B0;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = [v5 flatMap:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

id __85__HFProxControlActivityClientManager_startMonitoringUpdatesForMediaRemoteIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F58190]);
  id v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = (void *)[objc_alloc(MEMORY[0x263F62570]) initWithIdentifier:*(void *)(a1 + 32)];
  __int16 v8 = [WeakRetained proxControlActivityClient];
  [v8 startObservingMediaRemoteIdentifier:v7];

  [WeakRetained setHasStartedMonitoringUpdates:1];
  uint64_t v12 = MEMORY[0x263EF8330];
  objc_copyWeak(&v14, v5);
  id v9 = v4;
  id v13 = v9;
  id v10 = objc_msgSend(WeakRetained, "proxControlActivityClient", v12, 3221225472, __85__HFProxControlActivityClientManager_startMonitoringUpdatesForMediaRemoteIdentifier___block_invoke_2, &unk_2640979F0);
  [v10 setMediaRemoteUpdateHandler:&v12];

  objc_destroyWeak(&v14);
  return v9;
}

void __85__HFProxControlActivityClientManager_startMonitoringUpdatesForMediaRemoteIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __85__HFProxControlActivityClientManager_startMonitoringUpdatesForMediaRemoteIdentifier___block_invoke_3;
  v17 = &unk_26408D478;
  id v18 = WeakRetained;
  id v19 = v8;
  id v20 = v7;
  id v21 = v9;
  id v11 = v9;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], &v14);
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x263EFFA88], v14, v15, v16, v17, v18);
}

uint64_t __85__HFProxControlActivityClientManager_startMonitoringUpdatesForMediaRemoteIdentifier___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversForUpdatedActivities:*(void *)(a1 + 40) forProxControlID:*(void *)(a1 + 48) disambiguationContext:*(void *)(a1 + 56)];
}

- (id)startMonitoringUpdatesForAccessoryID:(id)a3 homeID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HFProxControlActivityClientManager *)self _setupProxControlClient];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__HFProxControlActivityClientManager_startMonitoringUpdatesForAccessoryID_homeID___block_invoke;
  v13[3] = &unk_2640904B8;
  objc_copyWeak(&v16, &location);
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  id v11 = [v8 flatMap:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

id __82__HFProxControlActivityClientManager_startMonitoringUpdatesForAccessoryID_homeID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F58190]);
  id v5 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setHomeID:*(void *)(a1 + 32)];
  [WeakRetained setAccessoryID:*(void *)(a1 + 40)];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F62560]) initWithAccessoryID:*(void *)(a1 + 40) homeID:*(void *)(a1 + 32)];
  id v8 = [WeakRetained proxControlActivityClient];
  [v8 startObservingDeviceWithIdentifier:v7];

  [WeakRetained setHasStartedMonitoringUpdates:1];
  uint64_t v12 = MEMORY[0x263EF8330];
  objc_copyWeak(&v14, v5);
  id v9 = v4;
  id v13 = v9;
  id v10 = objc_msgSend(WeakRetained, "proxControlActivityClient", v12, 3221225472, __82__HFProxControlActivityClientManager_startMonitoringUpdatesForAccessoryID_homeID___block_invoke_2, &unk_264097A18);
  [v10 setUpdateHandler:&v12];

  objc_destroyWeak(&v14);
  return v9;
}

void __82__HFProxControlActivityClientManager_startMonitoringUpdatesForAccessoryID_homeID___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __82__HFProxControlActivityClientManager_startMonitoringUpdatesForAccessoryID_homeID___block_invoke_3;
  v17 = &unk_26408D478;
  id v18 = WeakRetained;
  id v19 = v8;
  id v20 = v7;
  id v21 = v9;
  id v11 = v9;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], &v14);
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x263EFFA88], v14, v15, v16, v17, v18);
}

uint64_t __82__HFProxControlActivityClientManager_startMonitoringUpdatesForAccessoryID_homeID___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversForUpdatedActivities:*(void *)(a1 + 40) forProxControlID:*(void *)(a1 + 48) disambiguationContext:*(void *)(a1 + 56)];
}

- (void)userTappedDisambiguationButtonForContext:(id)a3
{
  id v4 = a3;
  id v5 = [(HFProxControlActivityClientManager *)self proxControlActivityClient];
  [v5 userTappedDisambiguationButton:v4];
}

- (void)userTappedCloseButton
{
  id v3 = [(HFProxControlActivityClientManager *)self proxControlActivityClient];
  [v3 userTappedCloseButton];

  id v4 = [(HFProxControlActivityClientManager *)self proxControlActivityClient];
  [v4 invalidate];
}

- (void)invalidateProxClient
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = HFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "%@ Invalidating Prox client", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(HFProxControlActivityClientManager *)self proxControlActivityClient];
  [v4 invalidate];
}

- (id)_setupProxControlClient
{
  id v4 = objc_alloc_init(MEMORY[0x263F58190]);
  int v5 = (PCRemoteActivityClient *)objc_alloc_init(MEMORY[0x263F62578]);
  proxControlActivityClient = self->_proxControlActivityClient;
  self->_proxControlActivityClient = v5;

  uint64_t v7 = [(HFProxControlActivityClientManager *)self dataModelUpdateQueue];
  [(PCRemoteActivityClient *)self->_proxControlActivityClient setDispatchQueue:v7];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__HFProxControlActivityClientManager__setupProxControlClient__block_invoke;
  v15[3] = &__block_descriptor_40_e5_v8__0l;
  v15[4] = a2;
  [(PCRemoteActivityClient *)self->_proxControlActivityClient setInterruptionHandler:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__HFProxControlActivityClientManager__setupProxControlClient__block_invoke_23;
  v14[3] = &__block_descriptor_40_e5_v8__0l;
  v14[4] = a2;
  [(PCRemoteActivityClient *)self->_proxControlActivityClient setInvalidationHandler:v14];
  id v8 = self->_proxControlActivityClient;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__HFProxControlActivityClientManager__setupProxControlClient__block_invoke_24;
  v11[3] = &unk_2640908A0;
  id v9 = v4;
  id v12 = v9;
  SEL v13 = a2;
  [(PCRemoteActivityClient *)v8 activateWithCompletion:v11];

  return v9;
}

void __61__HFProxControlActivityClientManager__setupProxControlClient__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    int v5 = v3;
    _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "%@ InterruptionHandler called back", (uint8_t *)&v4, 0xCu);
  }
}

void __61__HFProxControlActivityClientManager__setupProxControlClient__block_invoke_23(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    int v5 = v3;
    _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "%@ InvalidationHandler called back", (uint8_t *)&v4, 0xCu);
  }
}

void __61__HFProxControlActivityClientManager__setupProxControlClient__block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [v4 finishWithError:v3];
    int v5 = HFLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "%@ PCRemoteActivityClient wasn't activated [%@]", (uint8_t *)&v7, 0x16u);
LABEL_6:
    }
  }
  else
  {
    [v4 finishWithResult:MEMORY[0x263EFFA88]];
    int v5 = HFLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@ PCRemoteActivityClient Activated Succesfully!", (uint8_t *)&v7, 0xCu);
      goto LABEL_6;
    }
  }
}

- (void)_resetProxClient
{
  id v3 = [(HFProxControlActivityClientManager *)self proxControlActivityClient];
  [v3 invalidate];

  [(HFProxControlActivityClientManager *)self setProxControlActivityClient:0];
  [(HFProxControlActivityClientManager *)self setHasStartedMonitoringUpdates:0];
  id v4 = [(HFProxControlActivityClientManager *)self _setupProxControlClient];
}

- (void)_notifyObserversForUpdatedActivities:(id)a3 forProxControlID:(id)a4 disambiguationContext:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = HFLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    SEL v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v31 = v13;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 2112;
    id v37 = v10;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "%@ UpdateHandler called back with activities = %@ - disambiguationContext = %@, identifier = %@", buf, 0x2Au);
  }
  uint64_t v14 = HFLogForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = NSStringFromSelector(a2);
    id v16 = [v11 leadingImage];
    v17 = [v11 titleText];
    id v18 = [v11 subtitleText];
    *(_DWORD *)buf = 138413058;
    v31 = v15;
    __int16 v32 = 2112;
    id v33 = v16;
    __int16 v34 = 2112;
    id v35 = v17;
    __int16 v36 = 2112;
    id v37 = v18;
    _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "\n %@ leadingImage = [%@] titleText = [%@] subTitle = [%@]", buf, 0x2Au);
  }
  [(HFProxControlActivityClientManager *)self setLastIdentifier:v10];
  [(HFProxControlActivityClientManager *)self setLastActivities:v9];
  [(HFProxControlActivityClientManager *)self setLastDisambiguationContext:v11];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = [(HFProxControlActivityClientManager *)self observers];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v24 conformsToProtocol:&unk_26C182858]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v24 didUpdateActivities:v9 forProxControlID:v10 disambiguationContext:v11];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v21);
  }
}

- (BOOL)hasStartedMonitoringUpdates
{
  return self->_hasStartedMonitoringUpdates;
}

- (void)setHasStartedMonitoringUpdates:(BOOL)a3
{
  self->_hasStartedMonitoringUpdates = a3;
}

- (NSObject)lastIdentifier
{
  return self->_lastIdentifier;
}

- (void)setLastIdentifier:(id)a3
{
}

- (NSOrderedSet)lastActivities
{
  return self->_lastActivities;
}

- (void)setLastActivities:(id)a3
{
}

- (PCDisambiguationContext)lastDisambiguationContext
{
  return self->_lastDisambiguationContext;
}

- (void)setLastDisambiguationContext:(id)a3
{
}

- (BOOL)useSAConfig
{
  return self->_useSAConfig;
}

- (void)setUseSAConfig:(BOOL)a3
{
  self->_useSAConfig = a3;
}

- (PCRemoteActivityClient)proxControlActivityClient
{
  return self->_proxControlActivityClient;
}

- (void)setProxControlActivityClient:(id)a3
{
}

- (NSUUID)homeID
{
  return self->_homeID;
}

- (void)setHomeID:(id)a3
{
}

- (NSUUID)accessoryID
{
  return self->_accessoryID;
}

- (void)setAccessoryID:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)dataModelUpdateQueue
{
  return self->_dataModelUpdateQueue;
}

- (void)setDataModelUpdateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataModelUpdateQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_proxControlActivityClient, 0);
  objc_storeStrong((id *)&self->_lastDisambiguationContext, 0);
  objc_storeStrong((id *)&self->_lastActivities, 0);
  objc_storeStrong((id *)&self->_lastIdentifier, 0);
}

@end