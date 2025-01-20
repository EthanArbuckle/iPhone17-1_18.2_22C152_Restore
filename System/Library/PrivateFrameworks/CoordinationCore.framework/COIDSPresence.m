@interface COIDSPresence
+ (id)presenceForMesh:(id)a3;
- (BOOL)presenceAsserted;
- (COIDSPresence)initWithPresenceProvider:(id)a3;
- (NSMapTable)observers;
- (NSMutableSet)devices;
- (NSString)identifier;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)retryTimer;
- (SKPresence)presenceChannel;
- (SKPresencePayload)presencePayload;
- (id)_recordForDevice:(id)a3;
- (unint64_t)retryAttempts;
- (void)_informObserver:(id)a3 aboutRecord:(id)a4 added:(BOOL)a5;
- (void)_informObserversAboutDevice:(id)a3 added:(BOOL)a4;
- (void)_retrainSubscriptionWithRetryCounter:(unint64_t)a3;
- (void)_start;
- (void)_synchronizeInitiate;
- (void)_synchronizePresence:(BOOL)a3;
- (void)_usersChangedInHome:(id)a3;
- (void)_usersChangedInHomeNotification:(id)a3;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)presentDevicesChangedForPresence:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setDevices:(id)a3;
- (void)setPresenceAsserted:(BOOL)a3;
- (void)setRetryAttempts:(unint64_t)a3;
- (void)setRetryTimer:(id)a3;
@end

@implementation COIDSPresence

+ (id)presenceForMesh:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&presenceForMesh__lock);
  v4 = (void *)presenceForMesh__registries;
  if (!presenceForMesh__registries)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    v6 = (void *)presenceForMesh__registries;
    presenceForMesh__registries = v5;

    v4 = (void *)presenceForMesh__registries;
  }
  v7 = [v4 objectForKey:v3];
  if (!v7)
  {
    v8 = [COIDSPresence alloc];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __33__COIDSPresence_presenceForMesh___block_invoke;
    v12[3] = &unk_2645CC140;
    id v9 = v3;
    id v13 = v9;
    v7 = [(COIDSPresence *)v8 initWithPresenceProvider:v12];
    [(id)presenceForMesh__registries setObject:v7 forKey:v9];
  }
  v10 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v7;
    __int16 v16 = 2114;
    id v17 = v3;
    _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ returned for mesh %{public}@", buf, 0x16u);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&presenceForMesh__lock);
  return v7;
}

id __33__COIDSPresence_presenceForMesh___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];

  v4 = (void *)[objc_alloc(MEMORY[0x263F797F8]) initWithServiceIdentifier:v3];
  uint64_t v5 = [NSString stringWithFormat:@"%@.%@", @"com.apple.statuskit.coordination.messaging", *(void *)(a1 + 32)];
  v6 = (void *)[objc_alloc(MEMORY[0x263F797D8]) initWithPresenceIdentifier:v5 options:v4];
  v7 = (void *)IDSCopyLocalDeviceUniqueID();
  objc_msgSend(v6, "co_SetIDSIdentifier:", v7);

  return v6;
}

- (COIDSPresence)initWithPresenceProvider:(id)a3
{
  v4 = (void (**)(void))a3;
  v20.receiver = self;
  v20.super_class = (Class)COIDSPresence;
  uint64_t v5 = [(COIDSPresence *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9C0] set];
    devices = v5->_devices;
    v5->_devices = (NSMutableSet *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.COBrowserRegistry", v8);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = v4[2](v4);
    presenceChannel = v5->_presenceChannel;
    v5->_presenceChannel = (SKPresence *)v11;

    id v13 = [MEMORY[0x263EFF9A0] dictionary];
    v14 = [(SKPresence *)v5->_presenceChannel co_IDSIdentifier];
    [v13 setObject:v14 forKey:@"ids"];
    uint64_t v15 = [objc_alloc(MEMORY[0x263F79808]) initWithDictionary:v13];
    presencePayload = v5->_presencePayload;
    v5->_presencePayload = (SKPresencePayload *)v15;

    uint64_t v17 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    observers = v5->_observers;
    v5->_observers = (NSMapTable *)v17;

    [(COIDSPresence *)v5 _start];
  }

  return v5;
}

- (NSString)identifier
{
  v2 = [(COIDSPresence *)self presenceChannel];
  id v3 = [v2 presenceIdentifier];

  return (NSString *)v3;
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(COIDSPresence *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__COIDSPresence_addObserver_queue___block_invoke;
  block[3] = &unk_2645CAEF8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __35__COIDSPresence_addObserver_queue___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) observers];
  uint64_t v3 = [v2 count];

  v4 = [*(id *)(a1 + 32) observers];
  [v4 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

  uint64_t v5 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v6;
    __int16 v21 = 2048;
    uint64_t v22 = v7;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ observer '%p' added", buf, 0x16u);
  }

  if (!v3) {
    [*(id *)(a1 + 32) _synchronizeInitiate];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = objc_msgSend(*(id *)(a1 + 32), "devices", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(a1 + 32) _recordForDevice:*(void *)(*((void *)&v14 + 1) + 8 * v12)];
        if (v13) {
          [*(id *)(a1 + 32) _informObserver:*(void *)(a1 + 48) aboutRecord:v13 added:1];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COIDSPresence *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__COIDSPresence_removeObserver___block_invoke;
  v7[3] = &unk_2645CAE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __32__COIDSPresence_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) observers];
  uint64_t v3 = [v2 count];

  id v4 = [*(id *)(a1 + 32) observers];
  [v4 removeObjectForKey:*(void *)(a1 + 40)];

  uint64_t v5 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ observer '%p' removed", (uint8_t *)&v10, 0x16u);
  }

  if (v3 == 1)
  {
    id v8 = [*(id *)(a1 + 32) observers];
    uint64_t v9 = [v8 count];

    if (!v9) {
      [*(id *)(a1 + 32) _synchronizeInitiate];
    }
  }
}

- (void)setRetryTimer:(id)a3
{
  uint64_t v5 = (OS_dispatch_source *)a3;
  retryTimer = self->_retryTimer;
  p_retryTimer = &self->_retryTimer;
  uint64_t v6 = retryTimer;
  uint64_t v9 = v5;
  if (retryTimer != v5)
  {
    if (v6) {
      dispatch_source_cancel(v6);
    }
    objc_storeStrong((id *)p_retryTimer, a3);
    if (*p_retryTimer) {
      dispatch_resume((dispatch_object_t)*p_retryTimer);
    }
  }
}

- (void)_start
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (+[CODeviceClass isAudioAccessory])
  {
    uint64_t v3 = COCoreLogForCategory(14);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      uint64_t v14 = self;
      _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Registered notification for home user changes", (uint8_t *)&v13, 0xCu);
    }

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel__usersChangedInHomeNotification_ name:@"COHomeKitAdapterUsersChangedInHome" object:0];

    uint64_t v5 = +[COHomeKitAdapter sharedInstance];
    uint64_t v6 = [v5 currentAccessory];
    uint64_t v7 = [v6 home];
    [(COIDSPresence *)self _usersChangedInHome:v7];
  }
  id v8 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(COIDSPresence *)self presenceChannel];
    int v10 = objc_msgSend(v9, "co_IDSIdentifier");
    int v13 = 138543618;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    long long v16 = v10;
    _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ local IDS Identifier: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v11 = [(COIDSPresence *)self presenceChannel];
  __int16 v12 = [(COIDSPresence *)self workQueue];
  [v11 addDelegate:self queue:v12];

  [(COIDSPresence *)self _retrainSubscriptionWithRetryCounter:1];
}

- (id)_recordForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 presencePayload];
  uint64_t v5 = [v4 payloadDictionary];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v3 deviceTokenURI];
    uint64_t v7 = [v5 objectForKey:@"ids"];
    id v8 = [[COIDSDiscoveryRecord alloc] initWithIdsIdentifier:v7 deviceTokenURI:v6];
  }
  else
  {
    uint64_t v9 = COCoreLogForCategory(14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[COIDSPresence _recordForDevice:]();
    }

    id v8 = 0;
  }

  return v8;
}

- (void)_informObserver:(id)a3 aboutRecord:(id)a4 added:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [(COIDSPresence *)self workQueue];
  dispatch_assert_queue_V2(v10);

  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [(COIDSPresence *)self observers];
    __int16 v12 = [v11 objectForKey:v8];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__COIDSPresence__informObserver_aboutRecord_added___block_invoke;
    block[3] = &unk_2645CC168;
    BOOL v16 = a5;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v12, block);
  }
}

uint64_t __51__COIDSPresence__informObserver_aboutRecord_added___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 didAddDevice:v4];
  }
  else {
    return [v3 didRemoveDevice:v4];
  }
}

- (void)_informObserversAboutDevice:(id)a3 added:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(COIDSPresence *)self _recordForDevice:v6];
  if (v7)
  {
    id v8 = COCoreLogForCategory(14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = "lost";
      *(_DWORD *)buf = 138544130;
      __int16 v22 = 2080;
      __int16 v21 = self;
      if (v4) {
        id v9 = "found";
      }
      uint64_t v23 = v9;
      __int16 v24 = 2114;
      v25 = v7;
      __int16 v26 = 2048;
      id v27 = v6;
      _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ device %s: %{public}@ (for %p)", buf, 0x2Au);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v10 = [(COIDSPresence *)self observers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [(COIDSPresence *)self _informObserver:*(void *)(*((void *)&v15 + 1) + 8 * v14++) aboutRecord:v7 added:v4];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (void)_retrainSubscriptionWithRetryCounter:(unint64_t)a3
{
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke;
  v15[3] = &unk_2645CC190;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  uint64_t v5 = (void *)MEMORY[0x223C8B4A0](v15);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke_2;
  uint64_t v12 = &unk_2645CC1B8;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a3;
  id v6 = v5;
  id v13 = v6;
  uint64_t v7 = (void *)MEMORY[0x223C8B4A0](&v9);
  id v8 = [(COIDSPresence *)self presenceChannel];
  [v8 retainTransientSubscriptionAssertionWithCompletion:v7];

  objc_destroyWeak(v14);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _retrainSubscriptionWithRetryCounter:*(void *)(a1 + 40) + 1];
    id WeakRetained = v3;
  }
}

void __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      unint64_t v5 = *(void *)(a1 + 48);
      if (!v5) {
        __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke_2_cold_1();
      }
      if (v5 >= 0xE) {
        unint64_t v5 = 14;
      }
      uint64_t v6 = nextRetryTimeInterval_times[v5 - 1];
      uint64_t v7 = COCoreLogForCategory(14);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void **)(a1 + 48);
        int v12 = 138544130;
        id v13 = WeakRetained;
        __int16 v14 = 2048;
        long long v15 = v11;
        __int16 v16 = 2048;
        uint64_t v17 = v6;
        __int16 v18 = 2114;
        id v19 = v3;
        _os_log_error_impl(&dword_2217C1000, v7, OS_LOG_TYPE_ERROR, "%{public}@ failed to start: attempt %llu, delay %llu, %{public}@", (uint8_t *)&v12, 0x2Au);
      }

      dispatch_time_t v8 = dispatch_time(0, 1000000 * v6);
      uint64_t v9 = [WeakRetained workQueue];
      dispatch_after(v8, v9, *(dispatch_block_t *)(a1 + 32));
    }
    else
    {
      uint64_t v9 = COCoreLogForCategory(14);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [WeakRetained identifier];
        int v12 = 138543618;
        id v13 = WeakRetained;
        __int16 v14 = 2114;
        long long v15 = v10;
        _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ started successfully, id: '%{public}@'", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (void)_synchronizeInitiate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(COIDSPresence *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (![(COIDSPresence *)self retryAttempts])
  {
    BOOL v4 = [(COIDSPresence *)self observers];
    uint64_t v5 = [v4 count];

    uint64_t v6 = COCoreLogForCategory(14);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        uint64_t v7 = "assert";
      }
      else {
        uint64_t v7 = "release";
      }
      dispatch_time_t v8 = [(COIDSPresence *)self identifier];
      int v9 = 138543874;
      uint64_t v10 = self;
      __int16 v11 = 2080;
      int v12 = v7;
      __int16 v13 = 2114;
      __int16 v14 = v8;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronize initiated: target '%s', id: '%{public}@'", (uint8_t *)&v9, 0x20u);
    }
    [(COIDSPresence *)self setRetryAttempts:1];
    [(COIDSPresence *)self _synchronizePresence:v5 != 0];
  }
}

- (void)_synchronizePresence:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(COIDSPresence *)self workQueue];
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __38__COIDSPresence__synchronizePresence___block_invoke;
  v26[3] = &unk_2645CC1E0;
  objc_copyWeak(&v27, &location);
  uint64_t v6 = (void *)MEMORY[0x223C8B4A0](v26);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __38__COIDSPresence__synchronizePresence___block_invoke_38;
  v22[3] = &unk_2645CC230;
  objc_copyWeak(&v24, &location);
  BOOL v25 = v3;
  v22[4] = self;
  id v7 = v6;
  id v23 = v7;
  dispatch_time_t v8 = (void *)MEMORY[0x223C8B4A0](v22);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  __int16 v18 = __38__COIDSPresence__synchronizePresence___block_invoke_2;
  id v19 = &unk_2645CB3E0;
  objc_copyWeak(&v21, &location);
  id v9 = v8;
  id v20 = v9;
  uint64_t v10 = (void *)MEMORY[0x223C8B4A0](&v16);
  unint64_t v11 = [(COIDSPresence *)self retryAttempts];
  int v12 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = "release";
    *(_DWORD *)buf = 138543874;
    v30 = self;
    if (v3) {
      __int16 v13 = "assert";
    }
    __int16 v31 = 2048;
    unint64_t v32 = v11;
    __int16 v33 = 2080;
    v34 = v13;
    _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronize attempt: %llu, target '%s'", buf, 0x20u);
  }

  if (v3)
  {
    __int16 v14 = [(COIDSPresence *)self presencePayload];
    uint64_t v15 = [(COIDSPresence *)self presenceChannel];
    [v15 assertPresenceWithPresencePayload:v14 completion:v10];
  }
  else
  {
    __int16 v14 = [(COIDSPresence *)self presenceChannel];
    [v14 releasePresenceWithCompletion:v10];
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __38__COIDSPresence__synchronizePresence___block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained observers];
    uint64_t v6 = [v5 count];

    if ((v6 != 0) == a2)
    {
      BOOL v9 = v6 != 0;
      uint64_t v10 = [v4 retryTimer];
      dispatch_source_set_timer(v10, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

      [v4 _synchronizePresence:v9];
    }
    else
    {
      id v7 = COCoreLogForCategory(14);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_time_t v8 = "release";
        if (v6) {
          dispatch_time_t v8 = "assert";
        }
        int v11 = 138543618;
        int v12 = v4;
        __int16 v13 = 2080;
        __int16 v14 = v8;
        _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronize cancelled: target changed to '%s'", (uint8_t *)&v11, 0x16u);
      }

      [v4 setRetryAttempts:0];
      [v4 setRetryTimer:0];
    }
  }
}

void __38__COIDSPresence__synchronizePresence___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained observers];
    uint64_t v7 = [v6 count];
    int v8 = v7 != 0;

    int v9 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v10 = COCoreLogForCategory(14);
    int v11 = v10;
    if (v3)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __38__COIDSPresence__synchronizePresence___block_invoke_38_cold_3();
      }

      if (v9 != v8)
      {
        uint64_t v17 = COCoreLogForCategory(14);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v25 = "release";
          if (v7) {
            BOOL v25 = "assert";
          }
          *(_DWORD *)buf = 138543618;
          v40 = v5;
          __int16 v41 = 2080;
          v42 = v25;
          id v19 = "%{public}@ synchronize cancelled: target changed to '%s'";
          id v20 = v17;
          uint32_t v21 = 22;
          goto LABEL_25;
        }
LABEL_26:

LABEL_27:
        [v5 setRetryAttempts:0];
        [v5 setRetryTimer:0];
        goto LABEL_38;
      }
      unint64_t v12 = [v5 retryAttempts];
      id v13 = v3;
      __int16 v14 = [v13 domain];
      char v15 = [v14 isEqualToString:*MEMORY[0x263F79858]];

      if (v15)
      {
        uint64_t v16 = [v13 code];

        if (v16 == -7001 && v12 >= 2)
        {
          uint64_t v17 = COCoreLogForCategory(14);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v18 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            v40 = v18;
            id v19 = "%{public}@ synchronize cancelled: maximum retries reached";
            id v20 = v17;
            uint32_t v21 = 12;
LABEL_25:
            _os_log_impl(&dword_2217C1000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
            goto LABEL_26;
          }
          goto LABEL_26;
        }
      }
      else
      {
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = "assert";
        if (!*(unsigned char *)(a1 + 56)) {
          __int16 v22 = "release";
        }
        *(_DWORD *)buf = 138543618;
        v40 = v5;
        __int16 v41 = 2080;
        v42 = v22;
        _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronize result: success, target '%s'", buf, 0x16u);
      }

      if (v9 == v8) {
        goto LABEL_27;
      }
      id v23 = COCoreLogForCategory(14);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = "release";
        if (v7) {
          id v24 = "assert";
        }
        *(_DWORD *)buf = 138543618;
        v40 = v5;
        __int16 v41 = 2080;
        v42 = v24;
        _os_log_impl(&dword_2217C1000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronize restart: target changed to '%s'", buf, 0x16u);
      }

      [v5 setRetryAttempts:1];
    }
    __int16 v26 = [v5 retryTimer];
    if (v26
      || ([v5 workQueue],
          id v27 = objc_claimAutoreleasedReturnValue(),
          __int16 v26 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v27),
          v27,
          v26))
    {
      unint64_t v28 = [v5 retryAttempts];
      if (!v28) {
        __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke_2_cold_1();
      }
      uint64_t v29 = 14;
      if (v28 < 0xE) {
        uint64_t v29 = v28;
      }
      v30 = (const char *)nextRetryTimeInterval_times[v29 - 1];
      [v5 setRetryAttempts:v28 + 1];
      __int16 v31 = COCoreLogForCategory(14);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v40 = v5;
        __int16 v41 = 2048;
        v42 = v30;
        _os_log_impl(&dword_2217C1000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronize waiting: %llu ms", buf, 0x16u);
      }

      dispatch_time_t v32 = dispatch_walltime(0, 1000000 * (void)v30);
      dispatch_source_set_timer(v26, v32, 1000000 * (void)v30, 0);
      uint64_t v33 = MEMORY[0x263EF8330];
      uint64_t v34 = 3221225472;
      uint64_t v35 = __38__COIDSPresence__synchronizePresence___block_invoke_39;
      v36 = &unk_2645CC208;
      id v37 = *(id *)(a1 + 40);
      char v38 = v8;
      dispatch_source_set_event_handler(v26, &v33);
      objc_msgSend(v5, "setRetryTimer:", v26, v33, v34, v35, v36);
    }
    else
    {
      __int16 v26 = COCoreLogForCategory(14);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        __38__COIDSPresence__synchronizePresence___block_invoke_38_cold_1();
      }
    }
  }
LABEL_38:
}

uint64_t __38__COIDSPresence__synchronizePresence___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __38__COIDSPresence__synchronizePresence___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__COIDSPresence__synchronizePresence___block_invoke_3;
    v7[3] = &unk_2645CB170;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __38__COIDSPresence__synchronizePresence___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_usersChangedInHome:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v26 = a3;
  BOOL v4 = [v26 users];
  uint64_t v5 = [MEMORY[0x263EFF9C0] set];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = [*(id *)(*((void *)&v33 + 1) + 8 * v10) userID];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v8);
  }

  unint64_t v12 = [(COIDSPresence *)self presenceChannel];
  id v13 = [v12 invitedHandles];

  __int16 v14 = [MEMORY[0x263EFF9C0] set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v29 + 1) + 8 * v19) handleString];
        [v14 addObject:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v17);
  }

  uint32_t v21 = (void *)[v5 mutableCopy];
  [v21 minusSet:v14];
  __int16 v22 = (void *)[v14 mutableCopy];
  [v22 minusSet:v5];
  id v23 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [v26 uniqueIdentifier];
    uint64_t v25 = [v5 count];
    *(_DWORD *)buf = 138544130;
    char v38 = self;
    __int16 v39 = 2114;
    v40 = v24;
    __int16 v41 = 2048;
    uint64_t v42 = v25;
    __int16 v43 = 2112;
    v44 = v5;
    _os_log_impl(&dword_2217C1000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ users changed in home '%{public}@'. List of Home users (%lu): %@", buf, 0x2Au);
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __37__COIDSPresence__usersChangedInHome___block_invoke;
  v28[3] = &unk_2645CC280;
  v28[4] = self;
  [v21 enumerateObjectsUsingBlock:v28];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __37__COIDSPresence__usersChangedInHome___block_invoke_43;
  v27[3] = &unk_2645CC280;
  v27[4] = self;
  [v22 enumerateObjectsUsingBlock:v27];
}

void __37__COIDSPresence__usersChangedInHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v12 = v5;
    __int16 v13 = 2160;
    uint64_t v14 = 1752392040;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to invite user %{mask.hash}@", buf, 0x20u);
  }

  id v6 = (void *)[objc_alloc(MEMORY[0x263F797C0]) initWithString:v3];
  uint64_t v7 = [*(id *)(a1 + 32) presenceChannel];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__COIDSPresence__usersChangedInHome___block_invoke_41;
  v9[3] = &unk_2645CC258;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v8 = v3;
  [v7 inviteHandleFromPrimaryAccountHandle:v6 completion:v9];
}

void __37__COIDSPresence__usersChangedInHome___block_invoke_41(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v4 = COCoreLogForCategory(14);
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __37__COIDSPresence__usersChangedInHome___block_invoke_41_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2160;
    uint64_t v11 = 1752392040;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully invited user %{mask.hash}@", (uint8_t *)&v8, 0x20u);
  }
}

void __37__COIDSPresence__usersChangedInHome___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v12 = v5;
    __int16 v13 = 2160;
    uint64_t v14 = 1752392040;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to remove user %{mask.hash}@", buf, 0x20u);
  }

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F797C0]) initWithString:v3];
  uint64_t v7 = [*(id *)(a1 + 32) presenceChannel];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__COIDSPresence__usersChangedInHome___block_invoke_44;
  v9[3] = &unk_2645CC258;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v8 = v3;
  [v7 removeInvitedHandle:v6 completion:v9];
}

void __37__COIDSPresence__usersChangedInHome___block_invoke_44(uint64_t a1, uint64_t a2)
{
  id v3 = COCoreLogForCategory(14);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v4) {
      __37__COIDSPresence__usersChangedInHome___block_invoke_44_cold_2();
    }
  }
  else if (v4)
  {
    __37__COIDSPresence__usersChangedInHome___block_invoke_44_cold_1();
  }
}

- (void)_usersChangedInHomeNotification:(id)a3
{
  BOOL v4 = [a3 object];
  uint64_t v5 = COCoreLogForCategory(14);
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[COIDSPresence _usersChangedInHomeNotification:]();
    }

    [(COIDSPresence *)self _usersChangedInHome:v4];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[COIDSPresence _usersChangedInHomeNotification:]();
    }
  }
}

- (void)presentDevicesChangedForPresence:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(COIDSPresence *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(COIDSPresence *)self identifier];
    *(_DWORD *)buf = 138543618;
    long long v34 = self;
    __int16 v35 = 2114;
    long long v36 = v7;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ present devices changed for '%{public}@'", buf, 0x16u);
  }
  id v8 = [MEMORY[0x263EFF9C0] set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = [v4 presentDevices];
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
        uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (([v14 isSelfDevice] & 1) == 0)
        {
          [v8 addObject:v14];
          __int16 v15 = [(COIDSPresence *)self devices];
          char v16 = [v15 containsObject:v14];

          if ((v16 & 1) == 0) {
            [(COIDSPresence *)self _informObserversAboutDevice:v14 added:1];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v17 = [(COIDSPresence *)self devices];
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
        uint64_t v22 = *(void *)(*((void *)&v23 + 1) + 8 * j);
        if (([v8 containsObject:v22] & 1) == 0) {
          [(COIDSPresence *)self _informObserversAboutDevice:v22 added:0];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v19);
  }

  [(COIDSPresence *)self setDevices:v8];
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (SKPresence)presenceChannel
{
  return self->_presenceChannel;
}

- (NSMutableSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (SKPresencePayload)presencePayload
{
  return self->_presencePayload;
}

- (BOOL)presenceAsserted
{
  return self->_presenceAsserted;
}

- (void)setPresenceAsserted:(BOOL)a3
{
  self->_presenceAsserted = a3;
}

- (unint64_t)retryAttempts
{
  return self->_retryAttempts;
}

- (void)setRetryAttempts:(unint64_t)a3
{
  self->_retryAttempts = a3;
}

- (OS_dispatch_source)retryTimer
{
  return self->_retryTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_presencePayload, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_presenceChannel, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)_recordForDevice:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%{public}@ unknown payload for device %p");
}

void __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke_2_cold_1()
{
}

void __38__COIDSPresence__synchronizePresence___block_invoke_38_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_2217C1000, v0, OS_LOG_TYPE_ERROR, "%{public}@ synchronize failed, error creating timer", v1, 0xCu);
}

void __38__COIDSPresence__synchronizePresence___block_invoke_38_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%{public}@ synchronize result: error [%@]");
}

void __37__COIDSPresence__usersChangedInHome___block_invoke_41_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_3(&dword_2217C1000, v0, v1, "%{public}@ failed to invite user %{mask.hash}@", v2, v3, v4, v5, v6);
}

void __37__COIDSPresence__usersChangedInHome___block_invoke_44_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_3(&dword_2217C1000, v0, v1, "%{public}@ successfully removed user %{mask.hash}@", v2, v3, v4, v5, v6);
}

void __37__COIDSPresence__usersChangedInHome___block_invoke_44_cold_2()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_3(&dword_2217C1000, v0, v1, "%{public}@ failed to remove user %{mask.hash}@", v2, v3, v4, v5, v6);
}

- (void)_usersChangedInHomeNotification:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_2217C1000, v0, OS_LOG_TYPE_ERROR, "%{public}@ user change notification without HMHome", v1, 0xCu);
}

- (void)_usersChangedInHomeNotification:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2217C1000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ users changed in home notification fired", v1, 0xCu);
}

@end