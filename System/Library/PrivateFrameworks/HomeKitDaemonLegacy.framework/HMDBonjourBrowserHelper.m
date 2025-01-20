@interface HMDBonjourBrowserHelper
- (BOOL)_startBrowsers;
- (BOOL)isStarted;
- (HMDBonjourBrowserHelper)initWithServicesOfTypes:(id)a3 browsingTimeInterval:(double)a4 browsingPeriodicity:(double)a5 workQueue:(id)a6;
- (HMFTimer)timer;
- (NSArray)serviceTypes;
- (NSDictionary)latestDiscoveredServices;
- (NSMutableArray)browsers;
- (NSMutableArray)browsingCompletions;
- (NSMutableDictionary)internalDiscoveredServices;
- (OS_dispatch_queue)workQueue;
- (double)browsingInterval;
- (double)browsingPeriodicity;
- (unint64_t)discoveredServicesCountForServiceType:(id)a3;
- (unint64_t)state;
- (void)_addBrowser:(id)a3;
- (void)_removeBrowser:(id)a3;
- (void)_stopBrowsers;
- (void)_updateTimerWithTimeout:(double)a3;
- (void)netServiceBrowser:(id)a3 didAddService:(id)a4;
- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4;
- (void)netServiceBrowser:(id)a3 didStopBrowsingWithError:(id)a4;
- (void)setBrowsers:(id)a3;
- (void)setBrowsingCompletions:(id)a3;
- (void)setBrowsingInterval:(double)a3;
- (void)setBrowsingPeriodicity:(double)a3;
- (void)setInternalDiscoveredServices:(id)a3;
- (void)setLatestDiscoveredServices:(id)a3;
- (void)setServiceTypes:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTimer:(id)a3;
- (void)startWithBrowsingCompletion:(id)a3;
- (void)stop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDBonjourBrowserHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browsingCompletions, 0);
  objc_storeStrong((id *)&self->_internalDiscoveredServices, 0);
  objc_storeStrong((id *)&self->_latestDiscoveredServices, 0);
  objc_storeStrong((id *)&self->_browsers, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)setBrowsingCompletions:(id)a3
{
}

- (NSMutableArray)browsingCompletions
{
  return self->_browsingCompletions;
}

- (void)setInternalDiscoveredServices:(id)a3
{
}

- (NSMutableDictionary)internalDiscoveredServices
{
  return self->_internalDiscoveredServices;
}

- (void)setLatestDiscoveredServices:(id)a3
{
}

- (NSDictionary)latestDiscoveredServices
{
  return self->_latestDiscoveredServices;
}

- (void)setBrowsers:(id)a3
{
}

- (NSMutableArray)browsers
{
  return self->_browsers;
}

- (void)setServiceTypes:(id)a3
{
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTimer:(id)a3
{
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (void)setBrowsingPeriodicity:(double)a3
{
  self->_browsingPeriodicity = a3;
}

- (double)browsingPeriodicity
{
  return self->_browsingPeriodicity;
}

- (void)setBrowsingInterval:(double)a3
{
  self->_browsingInterval = a3;
}

- (double)browsingInterval
{
  return self->_browsingInterval;
}

- (void)netServiceBrowser:(id)a3 didStopBrowsingWithError:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [v6 serviceType];
      v13 = NSNumber;
      v14 = [v6 serviceType];
      v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", -[HMDBonjourBrowserHelper discoveredServicesCountForServiceType:](v9, "discoveredServicesCountForServiceType:", v14));
      int v16 = 138544130;
      v17 = v11;
      __int16 v18 = 2112;
      v19 = v12;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Stopped browsing for services of type: %@ with error: %@. Found %@ servcies.", (uint8_t *)&v16, 0x2Au);
    }
  }
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v8 = [v6 type];
  if (v8)
  {
    v9 = [v6 name];

    if (v9)
    {
      internalDiscoveredServices = self->_internalDiscoveredServices;
      v11 = [v6 type];
      v12 = [(NSMutableDictionary *)internalDiscoveredServices objectForKey:v11];
      v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [MEMORY[0x1E4F1CA80] set];
      }
      v15 = v14;

      int v16 = [v6 name];
      [v15 removeObject:v16];

      v17 = self->_internalDiscoveredServices;
      __int16 v18 = [v6 type];
      [(NSMutableDictionary *)v17 setObject:v15 forKey:v18];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)netServiceBrowser:(id)a3 didAddService:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v8 = [v6 type];
  if (v8)
  {
    v9 = [v6 name];

    if (v9)
    {
      internalDiscoveredServices = self->_internalDiscoveredServices;
      v11 = [v6 type];
      v12 = [(NSMutableDictionary *)internalDiscoveredServices objectForKey:v11];
      v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [MEMORY[0x1E4F1CA80] set];
      }
      v15 = v14;

      int v16 = [v6 name];
      [v15 addObject:v16];

      v17 = self->_internalDiscoveredServices;
      __int16 v18 = [v6 type];
      [(NSMutableDictionary *)v17 setObject:v15 forKey:v18];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  v5 = [(HMDBonjourBrowserHelper *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDBonjourBrowserHelper *)self timer];

  if (v6 == v4)
  {
    unint64_t v7 = [(HMDBonjourBrowserHelper *)self state];
    if (v7 == 2)
    {
      [(HMDBonjourBrowserHelper *)self _startBrowsers];
    }
    else if (v7 == 1)
    {
      [(HMDBonjourBrowserHelper *)self _stopBrowsers];
    }
  }
}

- (void)_updateTimerWithTimeout:(double)a3
{
  v5 = [(HMDBonjourBrowserHelper *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDBonjourBrowserHelper *)self timer];

  if (v6)
  {
    unint64_t v7 = [(HMDBonjourBrowserHelper *)self timer];
    [v7 suspend];

    [(HMDBonjourBrowserHelper *)self setTimer:0];
  }
  if (a3 > 0.0)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:a3];
    [v9 setDelegate:self];
    v8 = [(HMDBonjourBrowserHelper *)self workQueue];
    [v9 setDelegateQueue:v8];

    [v9 resume];
    [(HMDBonjourBrowserHelper *)self setTimer:v9];
  }
}

- (void)_removeBrowser:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_browsers removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_addBrowser:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_browsers addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setState:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (BOOL)isStarted
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_state != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)discoveredServicesCountForServiceType:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = self->_latestDiscoveredServices;
  if (!v6)
  {
    if ([(NSMutableDictionary *)self->_internalDiscoveredServices count]) {
      id v6 = (NSDictionary *)[(NSMutableDictionary *)self->_internalDiscoveredServices copy];
    }
    else {
      id v6 = 0;
    }
  }
  unint64_t v7 = [(NSDictionary *)v6 objectForKey:v4];
  unint64_t v8 = [v7 count];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)_stopBrowsers
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDBonjourBrowserHelper *)self workQueue];
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_lock_with_options();
  if (self->_state == 1 && self->_browsingPeriodicity > 0.0)
  {
    char v4 = 1;
    unint64_t v5 = 2;
  }
  else
  {
    unint64_t v5 = 0;
    char v4 = 0;
  }
  self->_unint64_t state = v5;
  internalDiscoveredServices = self->_internalDiscoveredServices;
  if (internalDiscoveredServices)
  {
    unint64_t v7 = (NSDictionary *)[(NSMutableDictionary *)internalDiscoveredServices copy];
    latestDiscoveredServices = self->_latestDiscoveredServices;
    self->_latestDiscoveredServices = v7;
  }
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  v10 = self->_internalDiscoveredServices;
  self->_internalDiscoveredServices = v9;

  v11 = (void *)[(NSMutableArray *)self->_browsers copy];
  [(NSMutableArray *)self->_browsers removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  if (v4)
  {
    [(HMDBonjourBrowserHelper *)self browsingPeriodicity];
    v12 = (void *)MEMORY[0x1D9452090]([(HMDBonjourBrowserHelper *)self _updateTimerWithTimeout:"_updateTimerWithTimeout:"]);
    v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      int v16 = NSNumber;
      [(HMDBonjourBrowserHelper *)v13 browsingPeriodicity];
      v17 = objc_msgSend(v16, "numberWithDouble:");
      *(_DWORD *)buf = 138543618;
      v38 = v15;
      __int16 v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Waiting to restart browsing after: %@ seconds", buf, 0x16u);
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v32;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * v21++) stopBrowsing];
      }
      while (v19 != v21);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v19);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  __int16 v22 = [(HMDBonjourBrowserHelper *)self browsingCompletions];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v28;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v22);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v27 + 1) + 8 * v25++) + 16))();
      }
      while (v23 != v25);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v23);
  }

  v26 = [(HMDBonjourBrowserHelper *)self browsingCompletions];
  [v26 removeAllObjects];
}

- (void)stop
{
  v3 = [(HMDBonjourBrowserHelper *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__HMDBonjourBrowserHelper_stop__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __31__HMDBonjourBrowserHelper_stop__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isStarted];
  if (result)
  {
    [*(id *)(a1 + 32) _stopBrowsers];
    [*(id *)(a1 + 32) setState:0];
    v3 = *(void **)(a1 + 32);
    return [v3 _updateTimerWithTimeout:0.0];
  }
  return result;
}

- (BOOL)_startBrowsers
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDBonjourBrowserHelper *)self workQueue];
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_lock_with_options();
  if (self->_state == 1)
  {
    os_unfair_lock_unlock(&self->_lock);
    return 0;
  }
  char v4 = [MEMORY[0x1E4F1CA60] dictionary];
  internalDiscoveredServices = self->_internalDiscoveredServices;
  self->_internalDiscoveredServices = v4;

  self->_unint64_t state = 1;
  id v6 = self->_serviceTypes;
  os_unfair_lock_unlock(&self->_lock);
  if (!v6) {
    return 0;
  }
  [(HMDBonjourBrowserHelper *)self browsingInterval];
  [(HMDBonjourBrowserHelper *)self _updateTimerWithTimeout:"_updateTimerWithTimeout:"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = v6;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * v9);
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F654D8]) initWithDomain:@"local." serviceType:v10];
        [v11 setDelegate:self];
        [(HMDBonjourBrowserHelper *)self _addBrowser:v11];
        objc_initWeak(&location, self);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __41__HMDBonjourBrowserHelper__startBrowsers__block_invoke;
        v15[3] = &unk_1E6A15888;
        objc_copyWeak(&v17, &location);
        v15[4] = v10;
        id v12 = v11;
        id v16 = v12;
        [v12 startBrowsingWithCompletionHandler:v15];

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return 1;
}

void __41__HMDBonjourBrowserHelper__startBrowsers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = NSNumber;
    [v6 browsingInterval];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    int v12 = 138544130;
    v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v3;
    __int16 v18 = 2112;
    long long v19 = v11;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting browsing for services of type: %@ with error: %@ for %@ seconds", (uint8_t *)&v12, 0x2Au);
  }
  if (v3) {
    [v6 _removeBrowser:*(void *)(a1 + 40)];
  }
}

- (void)startWithBrowsingCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HMDBonjourBrowserHelper *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__HMDBonjourBrowserHelper_startWithBrowsingCompletion___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__HMDBonjourBrowserHelper_startWithBrowsingCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isStarted])
  {
    if (!*(void *)(a1 + 40)) {
      return;
    }
  }
  else
  {
    int v2 = [*(id *)(a1 + 32) _startBrowsers];
    uint64_t v3 = *(void *)(a1 + 40);
    if (!v3) {
      return;
    }
    if (!v2)
    {
      id v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      (*(void (**)(uint64_t))(v3 + 16))(v3);
      goto LABEL_9;
    }
  }
  id v5 = [*(id *)(a1 + 32) browsingCompletions];
  id v4 = _Block_copy(*(const void **)(a1 + 40));
  [v5 addObject:v4];

LABEL_9:
}

- (HMDBonjourBrowserHelper)initWithServicesOfTypes:(id)a3 browsingTimeInterval:(double)a4 browsingPeriodicity:(double)a5 workQueue:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if (a4 > 0.0 && [v11 count])
  {
    v25.receiver = self;
    v25.super_class = (Class)HMDBonjourBrowserHelper;
    v13 = [(HMDBonjourBrowserHelper *)&v25 init];
    if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
      internalDiscoveredServices = v13->_internalDiscoveredServices;
      v13->_internalDiscoveredServices = (NSMutableDictionary *)v14;

      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      browsers = v13->_browsers;
      v13->_browsers = (NSMutableArray *)v16;

      uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
      browsingCompletions = v13->_browsingCompletions;
      v13->_browsingCompletions = (NSMutableArray *)v18;

      objc_storeStrong((id *)&v13->_serviceTypes, a3);
      v13->_browsingInterval = a4;
      v13->_browsingPeriodicity = a5;
      objc_storeStrong((id *)&v13->_workQueue, a6);
      v13->_unint64_t state = 0;
    }
    self = v13;
    uint64_t v20 = self;
  }
  else
  {
    long long v21 = (void *)MEMORY[0x1D9452090]();
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v27 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Browsing interval or types count must be greater than 0", buf, 0xCu);
    }
    uint64_t v20 = 0;
  }

  return v20;
}

@end