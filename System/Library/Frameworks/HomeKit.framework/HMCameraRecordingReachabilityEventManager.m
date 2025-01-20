@interface HMCameraRecordingReachabilityEventManager
+ (id)logCategory;
- (HMCameraRecordingReachabilityEventManager)initWithContext:(id)a3 uniqueIdentifier:(id)a4;
- (HMCameraRecordingReachabilityEventManager)initWithContext:(id)a3 uniqueIdentifier:(id)a4 notificationCenter:(id)a5;
- (NSMapTable)delegateCallersByObservers;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)uniqueIdentifier;
- (_HMContext)context;
- (id)logIdentifier;
- (void)addObserver:(id)a3;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)configure;
- (void)dealloc;
- (void)deleteAllEventsWithCompletionHandler:(id)a3;
- (void)fetchAllEventsWithCompletion:(id)a3;
- (void)fetchCountOfAllEventsWithCompletion:(id)a3;
- (void)fetchCountOfEventsWithDateInterval:(id)a3 completion:(id)a4;
- (void)fetchEventsAfterDate:(id)a3 withLimit:(unint64_t)a4 completion:(id)a5;
- (void)fetchEventsBeforeDate:(id)a3 withLimit:(unint64_t)a4 completion:(id)a5;
- (void)fetchEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)fetchEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 shouldOrderAscending:(BOOL)a5 completion:(id)a6;
- (void)handleDaemonReconnectedNotification:(id)a3;
- (void)handleDidChangeEventsMessage:(id)a3;
- (void)performCloudPullWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)subscribe;
- (void)unsubscribe;
@end

@implementation HMCameraRecordingReachabilityEventManager

- (void)configure
{
  v3 = [(HMCameraRecordingReachabilityEventManager *)self context];
  v4 = [v3 messageDispatcher];
  [v4 registerForMessage:@"HMCRREM.m.dcem" receiver:self selector:sel_handleDidChangeEventsMessage_];

  id v5 = [(HMCameraRecordingReachabilityEventManager *)self notificationCenter];
  [v5 addObserver:self selector:sel_handleDaemonReconnectedNotification_ name:@"HMDaemonReconnectedNotification" object:0];
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 32, 1);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (HMCameraRecordingReachabilityEventManager)initWithContext:(id)a3 uniqueIdentifier:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 defaultCenter];
  v10 = [(HMCameraRecordingReachabilityEventManager *)self initWithContext:v8 uniqueIdentifier:v7 notificationCenter:v9];

  return v10;
}

- (HMCameraRecordingReachabilityEventManager)initWithContext:(id)a3 uniqueIdentifier:(id)a4 notificationCenter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v18 = (HMAccessoryNetworkProtectionGroup *)_HMFPreconditionFailure();
    return (HMCameraRecordingReachabilityEventManager *)[(HMAccessoryNetworkProtectionGroup *)v18 initWithCoder:v20];
  }
  v21.receiver = self;
  v21.super_class = (Class)HMCameraRecordingReachabilityEventManager;
  v13 = [(HMCameraRecordingReachabilityEventManager *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_context, a3);
    objc_storeStrong((id *)&v14->_uniqueIdentifier, a4);
    objc_storeStrong((id *)&v14->_notificationCenter, a5);
    uint64_t v15 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateCallersByObservers = v14->_delegateCallersByObservers;
    v14->_delegateCallersByObservers = (NSMapTable *)v15;
  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateCallersByObservers, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (NSMapTable)delegateCallersByObservers
{
  return (NSMapTable *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (id)logIdentifier
{
  v2 = [(HMCameraRecordingReachabilityEventManager *)self uniqueIdentifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)handleDaemonReconnectedNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling daemon reconnected notification by reconnecting to daemon if necessary", (uint8_t *)&v11, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  id v9 = [(HMCameraRecordingReachabilityEventManager *)v6 delegateCallersByObservers];
  BOOL v10 = [v9 count] == 0;

  os_unfair_lock_unlock(&v6->_lock);
  if (!v10) {
    [(HMCameraRecordingReachabilityEventManager *)v6 subscribe];
  }
}

- (void)handleDidChangeEventsMessage:(id)a3
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v36 = v7;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling reachability events changed message", buf, 0xCu);
  }
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  v23 = [v20 unarchivedObjectForKey:@"HMCRREM.mk.ue" ofClasses:v8];

  v22 = [v20 setForKey:@"HMCRREM.mk.reu"];
  os_unfair_lock_lock_with_options();
  v24 = (void *)[(NSMapTable *)v5->_delegateCallersByObservers copy];
  os_unfair_lock_unlock(&v5->_lock);
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v10 = v5;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    uint64_t v13 = [v23 count];
    uint64_t v14 = [v22 count];
    *(_DWORD *)buf = 138543874;
    v36 = v12;
    __int16 v37 = 2048;
    uint64_t v38 = v13;
    __int16 v39 = 2048;
    uint64_t v40 = v14;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated events, %lu removed event UUIDs", buf, 0x20u);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [v24 keyEnumerator];
  uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        SEL v19 = [v24 objectForKey:v18];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __74__HMCameraRecordingReachabilityEventManager_handleDidChangeEventsMessage___block_invoke;
        v25[3] = &unk_1E5944F20;
        id v26 = v23;
        uint64_t v27 = v18;
        v28 = v10;
        id v29 = v22;
        [v19 invokeBlock:v25];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }

  [v20 respondWithSuccess];
}

uint64_t __74__HMCameraRecordingReachabilityEventManager_handleDidChangeEventsMessage___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 40) reachabilityEventManager:*(void *)(a1 + 48) didUpdateReachabilityEvents:*(void *)(a1 + 32)];
  }
  uint64_t result = [*(id *)(a1 + 56) count];
  if (result)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 reachabilityEventManager:v4 didRemoveReachabilityEventsWithUUIDs:v5];
  }
  return result;
}

- (void)unsubscribe
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  uint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing from camera reachability event changes", (uint8_t *)&v13, 0xCu);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F65488]);
  id v8 = [(HMCameraRecordingReachabilityEventManager *)v4 uniqueIdentifier];
  id v9 = (void *)[v7 initWithTarget:v8];

  BOOL v10 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCRREM.m.um" destination:v9 payload:0];
  int v11 = [(HMCameraRecordingReachabilityEventManager *)v4 context];
  v12 = [v11 messageDispatcher];
  [v12 sendMessage:v10];
}

- (void)subscribe
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  uint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Subscribing to camera reachability event changes", (uint8_t *)&v13, 0xCu);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F65488]);
  id v8 = [(HMCameraRecordingReachabilityEventManager *)v4 uniqueIdentifier];
  id v9 = (void *)[v7 initWithTarget:v8];

  BOOL v10 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCRREM.m.sm" destination:v9 payload:0];
  int v11 = [(HMCameraRecordingReachabilityEventManager *)v4 context];
  v12 = [v11 messageDispatcher];
  [v12 sendMessage:v10];
}

- (void)deleteAllEventsWithCompletionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v23 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Deleting all reachability events", buf, 0xCu);
  }
  id v9 = objc_alloc(MEMORY[0x1E4F65488]);
  BOOL v10 = [(HMCameraRecordingReachabilityEventManager *)v6 uniqueIdentifier];
  int v11 = (void *)[v9 initWithTarget:v10];

  v12 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCRREM.m.daem" destination:v11 payload:0];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __82__HMCameraRecordingReachabilityEventManager_deleteAllEventsWithCompletionHandler___block_invoke;
  SEL v19 = &unk_1E5944EF0;
  id v20 = v6;
  id v21 = v4;
  id v13 = v4;
  [v12 setResponseHandler:&v16];
  uint64_t v14 = [(HMCameraRecordingReachabilityEventManager *)v6 context];
  uint64_t v15 = [v14 messageDispatcher];
  [v15 sendMessage:v12 completionHandler:0];
}

void __82__HMCameraRecordingReachabilityEventManager_deleteAllEventsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      id v26 = v5;
      v12 = "%{public}@Failed to delete all reachability events: %@";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v13, v14, v12, buf, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v11;
    v12 = "%{public}@Successfully deleted all reachability events";
    id v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
    goto LABEL_6;
  }

  uint64_t v16 = [*(id *)(a1 + 32) context];
  uint64_t v17 = [v16 delegateCaller];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__HMCameraRecordingReachabilityEventManager_deleteAllEventsWithCompletionHandler___block_invoke_82;
  v20[3] = &unk_1E59454E8;
  id v18 = *(id *)(a1 + 40);
  id v21 = v5;
  id v22 = v18;
  id v19 = v5;
  [v17 invokeBlock:v20];
}

uint64_t __82__HMCameraRecordingReachabilityEventManager_deleteAllEventsWithCompletionHandler___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchCountOfAllEventsWithCompletion:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28C18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v9 = (id)[v6 initWithStartDate:v7 endDate:v8];

  [(HMCameraRecordingReachabilityEventManager *)self fetchCountOfEventsWithDateInterval:v9 completion:v5];
}

- (void)fetchCountOfEventsWithDateInterval:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch count of reachability events with date interval"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    id v13 = [v8 identifier];
    os_log_type_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    long long v32 = v12;
    __int16 v33 = 2114;
    v34 = v14;
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching count of reachability events with date interval %@", buf, 0x20u);
  }
  uint32_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v16 = [v6 startDate];
  [v15 setObject:v16 forKeyedSubscript:@"HMCRREM.mk.da"];

  uint64_t v17 = [v6 endDate];
  [v15 setObject:v17 forKeyedSubscript:@"HMCRREM.mk.db"];

  id v18 = objc_alloc(MEMORY[0x1E4F65488]);
  id v19 = [(HMCameraRecordingReachabilityEventManager *)v10 uniqueIdentifier];
  id v20 = (void *)[v18 initWithTarget:v19];

  id v21 = (void *)MEMORY[0x1E4F654B0];
  id v22 = (void *)[v15 copy];
  v23 = [v21 messageWithName:@"HMCRREM.m.fcoem" destination:v20 payload:v22];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91__HMCameraRecordingReachabilityEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke;
  v28[3] = &unk_1E5945510;
  v28[4] = v10;
  id v29 = v8;
  id v30 = v7;
  id v24 = v7;
  id v25 = v8;
  [v23 setResponseHandler:v28];
  id v26 = [(HMCameraRecordingReachabilityEventManager *)v10 context];
  uint64_t v27 = [v26 messageDispatcher];
  [v27 sendMessage:v23];
}

void __91__HMCameraRecordingReachabilityEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = a1[4];
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      v12 = [a1[5] identifier];
      id v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543874;
      v34 = v11;
      __int16 v35 = 2114;
      id v36 = v13;
      __int16 v37 = 2112;
      uint64_t v38 = (uint64_t)v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch count of reachability events: %@", buf, 0x20u);
    }
    os_log_type_t v14 = [a1[4] context];
    uint32_t v15 = [v14 delegateCaller];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __91__HMCameraRecordingReachabilityEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke_80;
    v30[3] = &unk_1E59454E8;
    id v32 = a1[6];
    id v31 = v5;
    [v15 invokeBlock:v30];

    id v16 = v32;
  }
  else
  {
    uint64_t v17 = objc_msgSend(v6, "hmf_numberForKey:", @"HMCRREM.mk.coe");
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = a1[4];
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [a1[5] identifier];
      v23 = [v22 shortDescription];
      *(_DWORD *)buf = 138543874;
      v34 = v21;
      __int16 v35 = 2114;
      id v36 = v23;
      __int16 v37 = 2048;
      uint64_t v38 = [v17 unsignedIntegerValue];
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched count of %lu reachability events", buf, 0x20u);
    }
    id v24 = [a1[4] context];
    id v25 = [v24 delegateCaller];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __91__HMCameraRecordingReachabilityEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke_81;
    v27[3] = &unk_1E59454E8;
    id v26 = a1[6];
    id v28 = v17;
    id v29 = v26;
    id v16 = v17;
    [v25 invokeBlock:v27];
  }
}

uint64_t __91__HMCameraRecordingReachabilityEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __91__HMCameraRecordingReachabilityEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchAllEventsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v8 = (void *)[v5 initWithStartDate:v6 endDate:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HMCameraRecordingReachabilityEventManager_fetchAllEventsWithCompletion___block_invoke;
  v10[3] = &unk_1E5944EC8;
  id v11 = v4;
  id v9 = v4;
  [(HMCameraRecordingReachabilityEventManager *)self fetchEventsWithDateInterval:v8 limit:-1 shouldOrderAscending:1 completion:v10];
}

void __74__HMCameraRecordingReachabilityEventManager_fetchAllEventsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = a3;
    id v8 = [v5 setWithArray:a2];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    id v7 = *(void (**)(uint64_t, void))(v3 + 16);
    id v8 = a3;
    v7(v3, 0);
  }
}

- (void)fetchEventsAfterDate:(id)a3 withLimit:(unint64_t)a4 completion:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F28C18];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 alloc];
  v12 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v13 = (id)[v11 initWithStartDate:v10 endDate:v12];

  [(HMCameraRecordingReachabilityEventManager *)self fetchEventsWithDateInterval:v13 limit:a4 shouldOrderAscending:1 completion:v9];
}

- (void)fetchEventsBeforeDate:(id)a3 withLimit:(unint64_t)a4 completion:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F28C18];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 alloc];
  v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v13 = (id)[v11 initWithStartDate:v12 endDate:v10];

  [(HMCameraRecordingReachabilityEventManager *)self fetchEventsWithDateInterval:v13 limit:a4 shouldOrderAscending:0 completion:v9];
}

- (void)fetchEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
}

- (void)fetchEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 shouldOrderAscending:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch reachability events with date interval"];
  id v13 = (void *)MEMORY[0x19F3A64A0]();
  os_log_type_t v14 = self;
  uint32_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v16 = v34 = v11;
    uint64_t v17 = [v12 identifier];
    id v18 = [v17 shortDescription];
    *(_DWORD *)buf = 138544386;
    uint64_t v39 = v16;
    __int16 v40 = 2114;
    v41 = v18;
    __int16 v42 = 2112;
    id v43 = v10;
    __int16 v44 = 2048;
    unint64_t v45 = a4;
    __int16 v46 = 1024;
    BOOL v47 = v7;
    _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching reachability events with date interval: %@ limit: %lu shouldOrderAscending: %d", buf, 0x30u);

    id v11 = v34;
  }

  id v19 = [MEMORY[0x1E4F1CA60] dictionary];
  id v20 = [v10 startDate];
  [v19 setObject:v20 forKeyedSubscript:@"HMCRREM.mk.da"];

  id v21 = [v10 endDate];
  [v19 setObject:v21 forKeyedSubscript:@"HMCRREM.mk.db"];

  id v22 = [NSNumber numberWithUnsignedInteger:a4];
  [v19 setObject:v22 forKeyedSubscript:@"HMCRREM.mk.l"];

  v23 = [NSNumber numberWithBool:v7];
  [v19 setObject:v23 forKeyedSubscript:@"HMCRREM.mk.soa"];

  id v24 = objc_alloc(MEMORY[0x1E4F65488]);
  id v25 = [(HMCameraRecordingReachabilityEventManager *)v14 uniqueIdentifier];
  id v26 = (void *)[v24 initWithTarget:v25];

  uint64_t v27 = (void *)MEMORY[0x1E4F654B0];
  id v28 = (void *)[v19 copy];
  id v29 = [v27 messageWithName:@"HMCRREM.m.fem" destination:v26 payload:v28];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __111__HMCameraRecordingReachabilityEventManager_fetchEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke;
  v35[3] = &unk_1E5945510;
  v35[4] = v14;
  id v36 = v12;
  id v37 = v11;
  id v30 = v11;
  id v31 = v12;
  [v29 setResponseHandler:v35];
  id v32 = [(HMCameraRecordingReachabilityEventManager *)v14 context];
  __int16 v33 = [v32 messageDispatcher];
  [v33 sendMessage:v29];
}

void __111__HMCameraRecordingReachabilityEventManager_fetchEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    BOOL v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] identifier];
      v12 = [v11 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v36 = v10;
      __int16 v37 = 2114;
      uint64_t v38 = v12;
      __int16 v39 = 2112;
      uint64_t v40 = (uint64_t)v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch reachability events: %@", buf, 0x20u);
    }
    id v13 = [a1[4] context];
    os_log_type_t v14 = [v13 delegateCaller];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __111__HMCameraRecordingReachabilityEventManager_fetchEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke_68;
    v31[3] = &unk_1E59454E8;
    id v33 = a1[6];
    id v32 = v5;
    [v14 invokeBlock:v31];

    id v15 = v33;
  }
  else
  {
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    uint64_t v17 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMCRREM.mrk.fe", v16);

    id v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = a1[4];
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [a1[5] identifier];
      v23 = [v22 shortDescription];
      uint64_t v24 = [v17 count];
      *(_DWORD *)buf = 138543874;
      id v36 = v21;
      __int16 v37 = 2114;
      uint64_t v38 = v23;
      __int16 v39 = 2048;
      uint64_t v40 = v24;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu reachability events", buf, 0x20u);
    }
    id v25 = [a1[4] context];
    id v26 = [v25 delegateCaller];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __111__HMCameraRecordingReachabilityEventManager_fetchEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke_72;
    v28[3] = &unk_1E59454E8;
    id v27 = a1[6];
    id v29 = v17;
    id v30 = v27;
    id v15 = v17;
    [v26 invokeBlock:v28];
  }
}

uint64_t __111__HMCameraRecordingReachabilityEventManager_fetchEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __111__HMCameraRecordingReachabilityEventManager_fetchEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)performCloudPullWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Perform cloud pull"];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 identifier];
    id v11 = [v10 shortDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v9;
    __int16 v25 = 2114;
    id v26 = v11;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Performing cloud pull", buf, 0x16u);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  id v13 = [(HMCameraRecordingReachabilityEventManager *)v7 uniqueIdentifier];
  os_log_type_t v14 = (void *)[v12 initWithTarget:v13];

  id v15 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCRREM.m.pcp" destination:v14 payload:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__HMCameraRecordingReachabilityEventManager_performCloudPullWithCompletion___block_invoke;
  v20[3] = &unk_1E5945510;
  void v20[4] = v7;
  id v21 = v5;
  id v22 = v4;
  id v16 = v4;
  id v17 = v5;
  [v15 setResponseHandler:v20];
  id v18 = [(HMCameraRecordingReachabilityEventManager *)v7 context];
  id v19 = [v18 messageDispatcher];
  [v19 sendMessage:v15];
}

void __76__HMCameraRecordingReachabilityEventManager_performCloudPullWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      id v13 = [v12 shortDescription];
      int v20 = 138543874;
      id v21 = v11;
      __int16 v22 = 2114;
      v23 = v13;
      __int16 v24 = 2112;
      id v25 = v5;
      os_log_type_t v14 = "%{public}@[%{public}@] Failed to perform cloud pull: %@";
      id v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v20, v17);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    id v13 = [v12 shortDescription];
    int v20 = 138543618;
    id v21 = v11;
    __int16 v22 = 2114;
    v23 = v13;
    os_log_type_t v14 = "%{public}@[%{public}@] Successfully performed cloud pull";
    id v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
    goto LABEL_6;
  }

  id v18 = [*(id *)(a1 + 32) context];
  id v19 = [v18 delegateCaller];
  [v19 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)removeObserver:(id)a3
{
  id v9 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMCameraRecordingReachabilityEventManager *)self delegateCallersByObservers];
  uint64_t v5 = [v4 count];

  id v6 = [(HMCameraRecordingReachabilityEventManager *)self delegateCallersByObservers];
  [v6 removeObjectForKey:v9];

  BOOL v7 = [(HMCameraRecordingReachabilityEventManager *)self delegateCallersByObservers];
  uint64_t v8 = [v7 count];

  os_unfair_lock_unlock(&self->_lock);
  if (!v8 && v5) {
    [(HMCameraRecordingReachabilityEventManager *)self unsubscribe];
  }
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  BOOL v7 = [(HMCameraRecordingReachabilityEventManager *)self delegateCallersByObservers];
  uint64_t v8 = [v7 count];

  if (v6)
  {
    id v9 = [[HMDelegateCaller alloc] initWithQueue:v6];
  }
  else
  {
    id v10 = [(HMCameraRecordingReachabilityEventManager *)self context];
    id v9 = [v10 delegateCaller];
  }
  id v11 = [(HMCameraRecordingReachabilityEventManager *)self delegateCallersByObservers];
  [v11 setObject:v9 forKey:v12];

  os_unfair_lock_unlock(&self->_lock);
  if (!v8) {
    [(HMCameraRecordingReachabilityEventManager *)self subscribe];
  }
}

- (void)addObserver:(id)a3
{
}

- (void)dealloc
{
  uint64_t v3 = [(NSMapTable *)self->_delegateCallersByObservers keyEnumerator];
  id v4 = [v3 nextObject];

  if (v4) {
    [(HMCameraRecordingReachabilityEventManager *)self unsubscribe];
  }
  uint64_t v5 = [(HMCameraRecordingReachabilityEventManager *)self context];
  id v6 = [v5 messageDispatcher];
  [v6 deregisterReceiver:self];

  v7.receiver = self;
  v7.super_class = (Class)HMCameraRecordingReachabilityEventManager;
  [(HMCameraRecordingReachabilityEventManager *)&v7 dealloc];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21_59595 != -1) {
    dispatch_once(&logCategory__hmf_once_t21_59595, &__block_literal_global_59596);
  }
  v2 = (void *)logCategory__hmf_once_v22_59597;

  return v2;
}

uint64_t __56__HMCameraRecordingReachabilityEventManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v22_59597;
  logCategory__hmf_once_v22_59597 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end