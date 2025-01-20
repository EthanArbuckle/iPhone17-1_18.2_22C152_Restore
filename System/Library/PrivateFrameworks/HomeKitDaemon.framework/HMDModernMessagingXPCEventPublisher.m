@interface HMDModernMessagingXPCEventPublisher
+ (id)shared;
- (BOOL)hmmmIsBundleIDValidForLaunchOnDemand:(id)a3;
- (HMDModernMessagingXPCEventPublisher)initWithLaunchOnDemandClientIdentifiersByMessageName:(id)a3;
- (HMDModernMessagingXPCEventPublisher)initWithTestClientsByMessageName:(id)a3;
- (NSDictionary)launchOnDemandClientIdentifiersByMessageName;
- (NSMutableDictionary)tokensByClientBundleID;
- (OS_dispatch_queue)workQueue;
- (OS_xpc_event_publisher)xpcEventPublisher;
- (void)_addXPCSubscriberWithToken:(unint64_t)a3 xpcEvent:(id)a4;
- (void)_publishLaunchEventForBundleID:(id)a3;
- (void)_removeXPCSubscriberWithToken:(unint64_t)a3;
- (void)publishLaunchEventForBundleID:(id)a3;
- (void)setTokensByClientBundleID:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)setXpcEventPublisher:(id)a3;
@end

@implementation HMDModernMessagingXPCEventPublisher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokensByClientBundleID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_xpcEventPublisher, 0);
  objc_storeStrong((id *)&self->_launchOnDemandClientIdentifiersByMessageName, 0);
}

- (void)setTokensByClientBundleID:(id)a3
{
}

- (NSMutableDictionary)tokensByClientBundleID
{
  return self->_tokensByClientBundleID;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setXpcEventPublisher:(id)a3
{
}

- (OS_xpc_event_publisher)xpcEventPublisher
{
  return self->_xpcEventPublisher;
}

- (NSDictionary)launchOnDemandClientIdentifiersByMessageName
{
  return self->_launchOnDemandClientIdentifiersByMessageName;
}

- (void)_addXPCSubscriberWithToken:(unint64_t)a3 xpcEvent:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  string = xpc_dictionary_get_string(v6, "bundleID");
  if (string)
  {
    v8 = (void *)[[NSString alloc] initWithCString:string];
    BOOL v9 = [(HMDModernMessagingXPCEventPublisher *)self hmmmIsBundleIDValidForLaunchOnDemand:v8];
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v14 = HMFGetLogIdentifier();
        int v22 = 138543874;
        v23 = v14;
        __int16 v24 = 2048;
        unint64_t v25 = a3;
        __int16 v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Received HMMM subscriber request for token: %llu, bundle id: %@", (uint8_t *)&v22, 0x20u);
      }
      v15 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:a3];
      v16 = [(HMDModernMessagingXPCEventPublisher *)v11 tokensByClientBundleID];
      [v16 setObject:v15 forKeyedSubscript:v8];
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        int v22 = 138543618;
        v23 = v21;
        __int16 v24 = 2112;
        unint64_t v25 = (unint64_t)v8;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Ignoring HMMM subscriber request from unknown bundle id: %@", (uint8_t *)&v22, 0x16u);
      }
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      int v22 = 138543618;
      v23 = v20;
      __int16 v24 = 2048;
      unint64_t v25 = a3;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Ignoring HMMM subscriber request from token %llu without bundleID", (uint8_t *)&v22, 0x16u);
    }
  }
}

- (void)_removeXPCSubscriberWithToken:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__156652;
  v21 = __Block_byref_object_dispose__156653;
  id v22 = 0;
  v5 = [(HMDModernMessagingXPCEventPublisher *)self tokensByClientBundleID];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__HMDModernMessagingXPCEventPublisher__removeXPCSubscriberWithToken___block_invoke;
  v16[3] = &unk_264A22590;
  v16[4] = &v17;
  v16[5] = a3;
  id v6 = (id)objc_msgSend(v5, "na_firstKeyPassingTest:", v16);

  BOOL v7 = v18[5] == 0;
  v8 = (void *)MEMORY[0x230FBD990]();
  BOOL v9 = self;
  if (v7)
  {
    HMFGetOSLogHandle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v15;
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Discarding remove XPC subscriber request, no subscriber associated with token: %llu", buf, 0x16u);
    }
  }
  else
  {
    HMFGetOSLogHandle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = v18[5];
      *(_DWORD *)buf = 138543874;
      __int16 v24 = v11;
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      __int16 v27 = 2112;
      uint64_t v28 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing XPC Subscriber with token: %llu, bundleID: %@", buf, 0x20u);
    }
    v13 = [(HMDModernMessagingXPCEventPublisher *)v9 tokensByClientBundleID];
    [v13 setObject:0 forKeyedSubscript:v18[5]];
  }
  _Block_object_dispose(&v17, 8);
}

BOOL __69__HMDModernMessagingXPCEventPublisher__removeXPCSubscriberWithToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v7 = [a3 unsignedLongLongValue];
  uint64_t v8 = *(void *)(a1 + 40);
  if (v7 == v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }

  return v7 == v8;
}

- (void)publishLaunchEventForBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(HMDModernMessagingXPCEventPublisher *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__HMDModernMessagingXPCEventPublisher_publishLaunchEventForBundleID___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __69__HMDModernMessagingXPCEventPublisher_publishLaunchEventForBundleID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _publishLaunchEventForBundleID:*(void *)(a1 + 40)];
}

- (void)_publishLaunchEventForBundleID:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDModernMessagingXPCEventPublisher *)self tokensByClientBundleID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [v6 unsignedLongLongValue];
    id v8 = (void *)MEMORY[0x230FBD990]();
    BOOL v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v16 = 138543874;
      uint64_t v17 = v11;
      __int16 v18 = 2048;
      uint64_t v19 = v7;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Firing HMMM launch-on-demand event for token %llu with bundleID: %@", (uint8_t *)&v16, 0x20u);
    }
    xpc_event_publisher_fire();
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      uint64_t v19 = (uint64_t)v4;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Received launch on demand event for unsubscribed client with bundle ID: %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (BOOL)hmmmIsBundleIDValidForLaunchOnDemand:(id)a3
{
  id v4 = a3;
  v5 = [(HMDModernMessagingXPCEventPublisher *)self launchOnDemandClientIdentifiersByMessageName];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__HMDModernMessagingXPCEventPublisher_hmmmIsBundleIDValidForLaunchOnDemand___block_invoke;
  v9[3] = &unk_264A24740;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __76__HMDModernMessagingXPCEventPublisher_hmmmIsBundleIDValidForLaunchOnDemand___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:");
}

- (HMDModernMessagingXPCEventPublisher)initWithLaunchOnDemandClientIdentifiersByMessageName:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMDModernMessagingXPCEventPublisher;
  v5 = [(HMDModernMessagingXPCEventPublisher *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    launchOnDemandClientIdentifiersByMessageName = v5->_launchOnDemandClientIdentifiersByMessageName;
    v5->_launchOnDemandClientIdentifiersByMessageName = (NSDictionary *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    tokensByClientBundleID = v5->_tokensByClientBundleID;
    v5->_tokensByClientBundleID = (NSMutableDictionary *)v8;

    HMDispatchQueueNameString();
    id v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v11;

    [@"com.apple.HMModernMessaging.launch" cString];
    v13 = [(HMDModernMessagingXPCEventPublisher *)v5 workQueue];
    uint64_t v14 = xpc_event_publisher_create();
    xpcEventPublisher = v5->_xpcEventPublisher;
    v5->_xpcEventPublisher = (OS_xpc_event_publisher *)v14;

    __int16 v18 = v5;
    xpc_event_publisher_set_handler();
    uint64_t v17 = v18;
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();
  }
  return v5;
}

void __92__HMDModernMessagingXPCEventPublisher_initWithLaunchOnDemandClientIdentifiersByMessageName___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (a2 == 1)
  {
    id v8 = v7;
    [*(id *)(a1 + 32) _removeXPCSubscriberWithToken:a3];
  }
  else
  {
    if (a2) {
      goto LABEL_6;
    }
    id v8 = v7;
    [*(id *)(a1 + 32) _addXPCSubscriberWithToken:a3 xpcEvent:v7];
  }
  id v7 = v8;
LABEL_6:
}

void __92__HMDModernMessagingXPCEventPublisher_initWithLaunchOnDemandClientIdentifiersByMessageName___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    BOOL v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@HMMM XPC Publisher experienced error with code: %d", (uint8_t *)&v8, 0x12u);
  }
}

- (HMDModernMessagingXPCEventPublisher)initWithTestClientsByMessageName:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDModernMessagingXPCEventPublisher;
  id v5 = [(HMDModernMessagingXPCEventPublisher *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    launchOnDemandClientIdentifiersByMessageName = v5->_launchOnDemandClientIdentifiersByMessageName;
    v5->_launchOnDemandClientIdentifiersByMessageName = (NSDictionary *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    tokensByClientBundleID = v5->_tokensByClientBundleID;
    v5->_tokensByClientBundleID = (NSMutableDictionary *)v8;

    HMDispatchQueueNameString();
    id v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v11;
  }
  return v5;
}

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_156673);
  }
  v2 = (void *)shared_sharedHandler;
  return v2;
}

void __45__HMDModernMessagingXPCEventPublisher_shared__block_invoke()
{
  v0 = [[HMDModernMessagingXPCEventPublisher alloc] initWithLaunchOnDemandClientIdentifiersByMessageName:&unk_26E474C88];
  v1 = (void *)shared_sharedHandler;
  shared_sharedHandler = (uint64_t)v0;
}

@end