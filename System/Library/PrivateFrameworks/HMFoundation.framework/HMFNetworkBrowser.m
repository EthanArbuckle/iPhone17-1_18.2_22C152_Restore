@interface HMFNetworkBrowser
+ (id)logCategory;
- (HMFNetworkBrowser)initWithQueue:(id)a3 domain:(id)a4 serviceTypes:(id)a5;
- (HMFNetworkBrowserDelegate)delegate;
- (NSArray)foundNetworkServices;
- (NSArray)serviceTypes;
- (NSMutableArray)internalBrowsers;
- (NSString)domain;
- (OS_dispatch_queue)workQueue;
- (id)_startBrowsing;
- (id)_stopBrowsing;
- (id)startBrowsing;
- (id)startBrowsingWithTimeout:(double)a3;
- (id)stopBrowsing;
- (id)workContext;
- (void)_addService:(id)a3;
- (void)_removeService:(id)a3;
- (void)_updateService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInternalBrowsers:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMFNetworkBrowser

void __33___HMFNetworkBrowser_workContext__block_invoke(uint64_t a1)
{
  v2 = [HMFDispatchContext alloc];
  id v5 = [*(id *)(a1 + 32) workQueue];
  uint64_t v3 = [(HMFDispatchContext *)v2 initWithQueue:v5];
  v4 = (void *)qword_1EB4EEB10;
  qword_1EB4EEB10 = v3;
}

uint64_t __33___HMFNetworkBrowser_logCategory__block_invoke()
{
  qword_1EB4EEB20 = HMFCreateOSLogHandle(@"HMFNetworkBrowser", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

- (HMFNetworkBrowser)initWithQueue:(id)a3 domain:(id)a4 serviceTypes:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v8 = a3;
  id v33 = a4;
  id v9 = a5;
  v38.receiver = self;
  v38.super_class = (Class)HMFNetworkBrowser;
  v10 = [(HMFNetworkBrowser *)&v38 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_domain, a4);
    objc_storeStrong((id *)&v11->_serviceTypes, a5);
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    networkServices = v11->_networkServices;
    v11->_networkServices = (NSMutableDictionary *)v12;

    v14 = MEMORY[0x1E4F1CA48];
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    internalBrowsers = v11->_internalBrowsers;
    v11->_internalBrowsers = (NSMutableArray *)v15;

    dispatch_queue_t v17 = v8;
    if (!v8)
    {
      v18 = (const char *)HMFDispatchQueueName(v11, 0);
      v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v17 = dispatch_queue_create(v18, v14);
    }
    objc_storeStrong((id *)&v11->_workQueue, v17);
    v31 = v8;
    if (!v8)
    {
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v9, v9);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v24 = [_HMFNetworkBrowser alloc];
          v25 = [(HMFNetworkBrowser *)v11 workQueue];
          v26 = v11;
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __networkServiceDidUpdate_block_invoke;
          v39[3] = &unk_1E5958210;
          v40 = v26;
          v27 = (void *)MEMORY[0x19F3A8A20](v39);

          v28 = [(_HMFNetworkBrowser *)v24 initWithQueue:v25 domain:v33 serviceType:v23 updateBlock:v27];
          [(NSMutableArray *)v11->_internalBrowsers addObject:v28];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v20);
    }

    id v9 = v30;
    v8 = v31;
  }

  return v11;
}

- (id)workContext
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HMFNetworkBrowser_workContext__block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  if (qword_1EB4EEB28 != -1) {
    dispatch_once(&qword_1EB4EEB28, block);
  }
  return (id)qword_1EB4EEB30;
}

void __32__HMFNetworkBrowser_workContext__block_invoke(uint64_t a1)
{
  v2 = [HMFDispatchContext alloc];
  id v5 = [*(id *)(a1 + 32) workQueue];
  uint64_t v3 = [(HMFDispatchContext *)v2 initWithQueue:v5];
  v4 = (void *)qword_1EB4EEB30;
  qword_1EB4EEB30 = v3;
}

- (void)_addService:(id)a3
{
  id v11 = a3;
  os_unfair_lock_lock_with_options();
  if (v11
    && (v4 = self->_networkServices,
        [v11 host],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [(NSMutableDictionary *)v4 objectForKey:v5],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    networkServices = self->_networkServices;
    uint64_t v8 = [v11 host];
    [(NSMutableDictionary *)networkServices setObject:v11 forKey:v8];

    os_unfair_lock_unlock(&self->_lock);
    id v9 = [(HMFNetworkBrowser *)self browserDelegate];
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if (v8)
    {
      v10 = [(HMFNetworkBrowser *)self browserDelegate];
      [v10 browser:self didFindNetworkService:v11];
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_removeService:(id)a3
{
  id v11 = a3;
  os_unfair_lock_lock_with_options();
  if (v11
    && (v4 = self->_networkServices,
        [v11 host],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [(NSMutableDictionary *)v4 objectForKey:v5],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    networkServices = self->_networkServices;
    uint64_t v8 = [v11 host];
    [(NSMutableDictionary *)networkServices removeObjectForKey:v8];

    os_unfair_lock_unlock(&self->_lock);
    id v9 = [(HMFNetworkBrowser *)self browserDelegate];
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if (v8)
    {
      v10 = [(HMFNetworkBrowser *)self browserDelegate];
      [v10 browser:self didLoseNetworkService:v11];
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_updateService:(id)a3
{
  id v14 = a3;
  os_unfair_lock_lock_with_options();
  if (v14
    && (v4 = self->_networkServices,
        [v14 host],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [(NSMutableDictionary *)v4 objectForKey:v5],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    networkServices = self->_networkServices;
    uint64_t v8 = [v14 host];
    id v9 = [(NSMutableDictionary *)networkServices objectForKey:v8];
    [v9 updateWithService:v14];

    v10 = self->_networkServices;
    uint64_t v11 = [v14 host];
    [(NSMutableDictionary *)v10 setObject:v14 forKey:v11];

    os_unfair_lock_unlock(&self->_lock);
    uint64_t v12 = [(HMFNetworkBrowser *)self browserDelegate];
    LOBYTE(v11) = objc_opt_respondsToSelector();

    if (v11)
    {
      v13 = [(HMFNetworkBrowser *)self browserDelegate];
      [v13 browser:self didUpdateNetworkService:v14];
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (id)_startBrowsing
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(HMFNetworkBrowser *)self internalBrowsers];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(HMFNetworkBrowser *)self internalBrowsers];
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v10 startBrowsing];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __35__HMFNetworkBrowser__startBrowsing__block_invoke;
        v17[3] = &unk_1E5958170;
        v17[4] = self;
        v17[5] = v10;
        uint64_t v12 = [v11 then:v17];

        [v5 addObject:v12];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v13 = +[HMFFuture allSettled:v5];
  id v14 = [v13 ignoreResult];

  return v14;
}

uint64_t __35__HMFNetworkBrowser__startBrowsing__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) browserDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) browserDelegate];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) serviceType];
    [v4 browser:v5 didStartBrowsingForServiceType:v6];
  }
  return 1;
}

- (id)_stopBrowsing
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(HMFNetworkBrowser *)self internalBrowsers];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(HMFNetworkBrowser *)self internalBrowsers];
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v10 stopBrowsing];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __34__HMFNetworkBrowser__stopBrowsing__block_invoke;
        v17[3] = &unk_1E5958170;
        v17[4] = self;
        v17[5] = v10;
        uint64_t v12 = [v11 then:v17];

        [v5 addObject:v12];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v13 = +[HMFFuture allSettled:v5];
  id v14 = [v13 ignoreResult];

  return v14;
}

uint64_t __34__HMFNetworkBrowser__stopBrowsing__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) browserDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) browserDelegate];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) serviceType];
    [v4 browser:v5 didStopBrowsingForServiceType:v6];
  }
  return 1;
}

- (id)stopBrowsing
{
  char v3 = [(HMFNetworkBrowser *)self workContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__HMFNetworkBrowser_stopBrowsing__block_invoke;
  v6[3] = &unk_1E5957FB8;
  v6[4] = self;
  v4 = +[HMFFuture inContext:v3 perform:v6];

  return v4;
}

uint64_t __33__HMFNetworkBrowser_stopBrowsing__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _stopBrowsing];
  if (!v1) {
    _HMFPreconditionFailure(@"future");
  }
  v2 = v1;

  return 3;
}

- (id)startBrowsing
{
  char v3 = [(HMFNetworkBrowser *)self workContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__HMFNetworkBrowser_startBrowsing__block_invoke;
  v6[3] = &unk_1E5957FB8;
  v6[4] = self;
  v4 = +[HMFFuture inContext:v3 perform:v6];

  return v4;
}

uint64_t __34__HMFNetworkBrowser_startBrowsing__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _startBrowsing];
  if (!v1) {
    _HMFPreconditionFailure(@"future");
  }
  v2 = v1;

  return 3;
}

- (id)startBrowsingWithTimeout:(double)a3
{
  uint64_t v5 = [(HMFNetworkBrowser *)self workContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__HMFNetworkBrowser_startBrowsingWithTimeout___block_invoke;
  v8[3] = &unk_1E59581C0;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  uint64_t v6 = +[HMFFuture inContext:v5 perform:v8];

  return v6;
}

uint64_t __46__HMFNetworkBrowser_startBrowsingWithTimeout___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _startBrowsing];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__HMFNetworkBrowser_startBrowsingWithTimeout___block_invoke_2;
  v6[3] = &unk_1E5958198;
  void v6[5] = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v3 = [v2 then:v6];
  if (!v3) {
    _HMFPreconditionFailure(@"future");
  }
  v4 = v3;

  return 3;
}

uint64_t __46__HMFNetworkBrowser_startBrowsingWithTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[HMFFuture futureWithDelay:*(double *)(a1 + 40)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__HMFNetworkBrowser_startBrowsingWithTimeout___block_invoke_3;
  v8[3] = &unk_1E5957FB8;
  v8[4] = *(void *)(a1 + 32);
  id v5 = [v4 finally:v8];
  if (!v5) {
    _HMFPreconditionFailure(@"future");
  }
  uint64_t v6 = v5;

  return 3;
}

uint64_t __46__HMFNetworkBrowser_startBrowsingWithTimeout___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _stopBrowsing];
  if (!v1) {
    _HMFPreconditionFailure(@"future");
  }
  v2 = v1;

  return 3;
}

- (NSArray)foundNetworkServices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = [(NSMutableDictionary *)self->_networkServices allValues];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

+ (id)logCategory
{
  if (qword_1EB4EEB38 != -1) {
    dispatch_once(&qword_1EB4EEB38, &__block_literal_global_69);
  }
  v2 = (void *)qword_1EB4EEB40;
  return v2;
}

uint64_t __32__HMFNetworkBrowser_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle(@"HMFNetworkBrowser", @"com.apple.HMFoundation");
  uint64_t v1 = qword_1EB4EEB40;
  qword_1EB4EEB40 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (HMFNetworkBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFNetworkBrowserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSMutableArray)internalBrowsers
{
  return self->_internalBrowsers;
}

- (void)setInternalBrowsers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalBrowsers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_networkServices, 0);
}

@end