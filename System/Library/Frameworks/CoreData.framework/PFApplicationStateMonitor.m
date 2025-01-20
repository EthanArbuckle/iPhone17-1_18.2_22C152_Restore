@interface PFApplicationStateMonitor
- (PFApplicationStateMonitor)init;
- (void)applicationDidActivate:(id)a3;
- (void)applicationWillDeactivate:(id)a3;
- (void)dealloc;
@end

@implementation PFApplicationStateMonitor

- (PFApplicationStateMonitor)init
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)PFApplicationStateMonitor;
  v2 = [(PFApplicationStateMonitor *)&v40 init];
  if (v2)
  {
    if (_PF_USE_IOS_PLATFORM == 1)
    {
      v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "infoDictionary"), "objectForKey:", @"UIBackgroundModes");
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v43 count:16];
      if (v4)
      {
        uint64_t v5 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v37 != v5) {
              objc_enumerationMutation(v3);
            }
            v7 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (([v7 isEqualToString:@"audio"] & 1) != 0
              || ([v7 isEqualToString:@"bluetooth-central"] & 1) != 0
              || ([v7 isEqualToString:@"bluetooth-peripheral"] & 1) != 0
              || ([v7 isEqualToString:@"external-accessory"] & 1) != 0
              || ([v7 isEqualToString:@"fetch"] & 1) != 0
              || ([v7 isEqualToString:@"location"] & 1) != 0
              || ([v7 isEqualToString:@"processing"] & 1) != 0
              || [v7 isEqualToString:@"voip"])
            {
              v2->_backgroundTimeout = 30;
              goto LABEL_20;
            }
          }
          uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v43 count:16];
          if (v4) {
            continue;
          }
          break;
        }
      }
    }
LABEL_20:
    objc_initWeak(&location, v2);
    v8 = [PFCloudKitThrottledNotificationObserver alloc];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __33__PFApplicationStateMonitor_init__block_invoke;
    v33[3] = &unk_1E544EFE0;
    v21 = &v34;
    objc_copyWeak(&v34, &location);
    uint64_t v9 = [(PFCloudKitThrottledNotificationObserver *)v8 initWithLabel:@"AppActivateObserver" handlerBlock:v33];
    v2->_appActivateLifecycleObserver = (PFCloudKitThrottledNotificationObserver *)v9;
    if (v9) {
      *(void *)(v9 + 32) = 1;
    }
    v10 = [PFCloudKitThrottledNotificationObserver alloc];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __33__PFApplicationStateMonitor_init__block_invoke_2;
    v31[3] = &unk_1E544EFE0;
    v22 = &v32;
    objc_copyWeak(&v32, &location);
    uint64_t v11 = [(PFCloudKitThrottledNotificationObserver *)v10 initWithLabel:@"AppDeactivateObserver" handlerBlock:v31];
    v2->_appDeactivateLifecycleObserver = (PFCloudKitThrottledNotificationObserver *)v11;
    if (v11) {
      *(void *)(v11 + 32) = 1;
    }
    atomic_store(0, (unsigned int *)&v2->_transitionCounter);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v12 = +[_PFRoutines applicationActivateLifecyleNotifications]();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v21, v22), "addObserver:selector:name:object:", v2, sel_applicationDidActivate_, *(void *)(*((void *)&v27 + 1) + 8 * j), 0);
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v42 count:16];
      }
      while (v13);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v16 = +[_PFRoutines applicationDeactivateLifecyleNotifications]();
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v41 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t k = 0; k != v17; ++k)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v21), "addObserver:selector:name:object:", v2, sel_applicationWillDeactivate_, *(void *)(*((void *)&v23 + 1) + 8 * k), 0);
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v41 count:16];
      }
      while (v17);
    }
    objc_destroyWeak(v22);
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __33__PFApplicationStateMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((void *)WeakRetained + 5) = 1;
    atomic_fetch_add((atomic_uint *volatile)WeakRetained + 6, 1u);
    id v4 = WeakRetained;
    id v2 = objc_loadWeakRetained((id *)WeakRetained + 6);
    v3 = v2;
    if (v2) {
      [v2 applicationStateMonitorEnteredForeground:v4];
    }

    id WeakRetained = v4;
  }
}

void __33__PFApplicationStateMonitor_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((void *)WeakRetained + 5) = 2;
    v8 = (atomic_uint *)WeakRetained;
    id v2 = objc_loadWeakRetained((id *)WeakRetained + 6);
    v3 = v2;
    if (v2) {
      [v2 applicationStateMonitorEnteredBackground:v8];
    }
    if (*((uint64_t *)v8 + 4) >= 1 && _PF_USE_IOS_PLATFORM == 1)
    {
      id v4 = v8;
      unsigned int v5 = atomic_fetch_or(v8 + 6, 0);
      dispatch_time_t v6 = dispatch_time(0, 1000000000 * *((void *)v4 + 4));
      global_queue = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__PFApplicationStateMonitor_scheduleBackgroundTimeout__block_invoke;
      block[3] = &unk_1E544F498;
      block[4] = v8;
      unsigned int v10 = v5;
      dispatch_after(v6, global_queue, block);
    }

    id WeakRetained = v8;
  }
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  self->_appActivateLifecycleObserver = 0;
  self->_appDeactivateLifecycleObserver = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFApplicationStateMonitor;
  [(PFApplicationStateMonitor *)&v3 dealloc];
}

- (void)applicationDidActivate:(id)a3
{
}

- (void)applicationWillDeactivate:(id)a3
{
}

void __54__PFApplicationStateMonitor_scheduleBackgroundTimeout__block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40) == atomic_fetch_or((atomic_uint *volatile)(*(void *)(a1 + 32) + 24), 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    if (WeakRetained)
    {
      id v3 = WeakRetained;
      [WeakRetained applicationStateMonitorExpiredBackgroundActivityTimeout:*(void *)(a1 + 32)];
      id WeakRetained = v3;
    }
  }
}

- (void).cxx_destruct
{
}

@end