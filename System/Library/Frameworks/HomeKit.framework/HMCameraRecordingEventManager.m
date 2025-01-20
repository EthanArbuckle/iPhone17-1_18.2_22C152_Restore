@interface HMCameraRecordingEventManager
+ (id)logCategory;
- (HMCameraClipManager)clipManager;
- (HMCameraRecordingEventManager)initWithContext:(id)a3 clipManager:(id)a4 reachabilityEventManager:(id)a5;
- (HMCameraRecordingReachabilityEventManager)reachabilityEventManager;
- (NSMapTable)delegateCallersByObservers;
- (NSString)zoneName;
- (_HMContext)context;
- (id)mergedRecordingEventsWithRecordingEvents1:(id)a3 recordingEvents2:(id)a4 limit:(unint64_t)a5 shouldOrderAscending:(BOOL)a6;
- (void)addObserver:(id)a3;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)clipManager:(id)a3 didRemoveClipsWithUUIDs:(id)a4;
- (void)clipManager:(id)a3 didUpdateClips:(id)a4;
- (void)deleteAllEventsWithCompletionHandler:(id)a3;
- (void)fetchAllEventsWithCompletion:(id)a3;
- (void)fetchCountOfAllEventsWithCompletion:(id)a3;
- (void)fetchCountOfEventsWithDateInterval:(id)a3 completion:(id)a4;
- (void)fetchEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)fetchEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 shouldOrderAscending:(BOOL)a5 completion:(id)a6;
- (void)fetchEventsWithDateInterval:(id)a3 quality:(int64_t)a4 limit:(unint64_t)a5 shouldOrderAscending:(BOOL)a6 completion:(id)a7;
- (void)notifyObserversOfUpdatedEvents:(id)a3 removedEventsWithUUIDs:(id)a4;
- (void)performCloudPullWithCompletion:(id)a3;
- (void)reachabilityEventManager:(id)a3 didRemoveReachabilityEventsWithUUIDs:(id)a4;
- (void)reachabilityEventManager:(id)a3 didUpdateReachabilityEvents:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation HMCameraRecordingEventManager

- (HMCameraRecordingEventManager)initWithContext:(id)a3 clipManager:(id)a4 reachabilityEventManager:(id)a5
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
    v18 = (HMCameraProfile *)_HMFPreconditionFailure();
    return (HMCameraRecordingEventManager *)[(HMCameraProfile *)v18 initWithCameraProfile:v20];
  }
  v21.receiver = self;
  v21.super_class = (Class)HMCameraRecordingEventManager;
  v13 = [(HMCameraRecordingEventManager *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_context, a3);
    objc_storeStrong((id *)&v14->_clipManager, a4);
    objc_storeStrong((id *)&v14->_reachabilityEventManager, a5);
    uint64_t v15 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateCallersByObservers = v14->_delegateCallersByObservers;
    v14->_delegateCallersByObservers = (NSMapTable *)v15;
  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateCallersByObservers, 0);
  objc_storeStrong((id *)&self->_clipManager, 0);
  objc_storeStrong((id *)&self->_reachabilityEventManager, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (NSMapTable)delegateCallersByObservers
{
  return (NSMapTable *)objc_getProperty(self, a2, 40, 1);
}

- (HMCameraClipManager)clipManager
{
  return (HMCameraClipManager *)objc_getProperty(self, a2, 32, 1);
}

- (HMCameraRecordingReachabilityEventManager)reachabilityEventManager
{
  return (HMCameraRecordingReachabilityEventManager *)objc_getProperty(self, a2, 24, 1);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)reachabilityEventManager:(id)a3 didRemoveReachabilityEventsWithUUIDs:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2048;
    uint64_t v16 = [v7 count];
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Received %lu removed reachability event UUIDs", (uint8_t *)&v13, 0x16u);
  }
  v12 = [MEMORY[0x1E4F1CAD0] set];
  [(HMCameraRecordingEventManager *)v9 notifyObserversOfUpdatedEvents:v12 removedEventsWithUUIDs:v7];
}

- (void)reachabilityEventManager:(id)a3 didUpdateReachabilityEvents:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2048;
    uint64_t v16 = [v7 count];
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated reachability events", (uint8_t *)&v13, 0x16u);
  }
  v12 = [MEMORY[0x1E4F1CAD0] set];
  [(HMCameraRecordingEventManager *)v9 notifyObserversOfUpdatedEvents:v7 removedEventsWithUUIDs:v12];
}

- (void)clipManager:(id)a3 didRemoveClipsWithUUIDs:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2048;
    uint64_t v16 = [v7 count];
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Received %lu removed clip UUIDs", (uint8_t *)&v13, 0x16u);
  }
  v12 = [MEMORY[0x1E4F1CAD0] set];
  [(HMCameraRecordingEventManager *)v9 notifyObserversOfUpdatedEvents:v12 removedEventsWithUUIDs:v7];
}

- (void)clipManager:(id)a3 didUpdateClips:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2048;
    uint64_t v16 = [v7 count];
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated clips", (uint8_t *)&v13, 0x16u);
  }
  v12 = [MEMORY[0x1E4F1CAD0] set];
  [(HMCameraRecordingEventManager *)v9 notifyObserversOfUpdatedEvents:v7 removedEventsWithUUIDs:v12];
}

- (void)notifyObserversOfUpdatedEvents:(id)a3 removedEventsWithUUIDs:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  id v7 = (void *)[(NSMapTable *)self->_delegateCallersByObservers copy];
  os_unfair_lock_unlock(&self->_lock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v7 keyEnumerator];
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v12 = [v7 objectForKey:v11];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __87__HMCameraRecordingEventManager_notifyObserversOfUpdatedEvents_removedEventsWithUUIDs___block_invoke;
        v15[3] = &unk_1E5944F20;
        id v16 = v14;
        uint64_t v17 = v11;
        v18 = self;
        id v19 = v6;
        [v12 invokeBlock:v15];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
}

uint64_t __87__HMCameraRecordingEventManager_notifyObserversOfUpdatedEvents_removedEventsWithUUIDs___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 40) recordingEventManager:*(void *)(a1 + 48) didUpdateRecordingEvents:*(void *)(a1 + 32)];
  }
  uint64_t result = [*(id *)(a1 + 56) count];
  if (result)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 recordingEventManager:v4 didRemoveRecordingEventsWithUUIDs:v5];
  }
  return result;
}

- (id)mergedRecordingEventsWithRecordingEvents1:(id)a3 recordingEvents2:(id)a4 limit:(unint64_t)a5 shouldOrderAscending:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  v26 = v9;
  uint64_t v11 = [v9 objectEnumerator];
  uint64_t v25 = v10;
  v12 = [v10 objectEnumerator];
  if (v6) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = 1;
  }
  uint64_t v14 = [v11 nextObject];
  uint64_t v15 = [v12 nextObject];
  id v16 = [MEMORY[0x1E4F1CA48] array];
  while (v14 | v15)
  {
    if ([v16 count] >= a5) {
      goto LABEL_16;
    }
    if (v14 != 0 && v15 != 0)
    {
      uint64_t v17 = [(id)v15 dateOfOccurrence];
      v18 = [(id)v14 dateOfOccurrence];
      uint64_t v19 = [v17 compare:v18];

      if (v19 != v13) {
        goto LABEL_11;
      }
      [v16 addObject:v15];
      uint64_t v20 = [v12 nextObject];
    }
    else
    {
      if (v14)
      {
LABEL_11:
        [v16 addObject:v14];
        uint64_t v21 = [v11 nextObject];
        long long v22 = (void *)v14;
        uint64_t v14 = v21;
        goto LABEL_14;
      }
      [v16 addObject:v15];
      uint64_t v20 = [v12 nextObject];
      uint64_t v14 = 0;
    }
    long long v22 = (void *)v15;
    uint64_t v15 = v20;
LABEL_14:
  }
  uint64_t v14 = 0;
  uint64_t v15 = 0;
LABEL_16:
  long long v23 = (void *)[v16 copy];

  return v23;
}

- (void)deleteAllEventsWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Deleting all recording events", buf, 0xCu);
  }
  id v9 = [(HMCameraRecordingEventManager *)v6 clipManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__HMCameraRecordingEventManager_deleteAllEventsWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E59449C8;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  [v9 deleteAllClipsWithCompletionHandler:v11];
}

void __70__HMCameraRecordingEventManager_deleteAllEventsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v4 context];
    BOOL v6 = [v5 delegateCaller];
    [v6 callCompletion:*(void *)(a1 + 40) error:v3];
  }
  else
  {
    id v7 = [v4 reachabilityEventManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__HMCameraRecordingEventManager_deleteAllEventsWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E59449C8;
    uint64_t v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    [v7 deleteAllEventsWithCompletionHandler:v9];
  }
}

void __70__HMCameraRecordingEventManager_deleteAllEventsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 context];
  uint64_t v5 = [v6 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)fetchCountOfAllEventsWithCompletion:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28C18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v9 = (id)[v6 initWithStartDate:v7 endDate:v8];

  [(HMCameraRecordingEventManager *)self fetchCountOfEventsWithDateInterval:v9 completion:v5];
}

- (void)fetchCountOfEventsWithDateInterval:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch count of recording events with date interval"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    uint64_t v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    v24 = v12;
    __int16 v25 = 2114;
    v26 = v14;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching count of recording events with date interval %@", buf, 0x20u);
  }
  uint64_t v15 = [(HMCameraRecordingEventManager *)v10 clipManager];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__HMCameraRecordingEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke;
  v19[3] = &unk_1E593F448;
  v19[4] = v10;
  id v20 = v8;
  id v21 = v6;
  id v22 = v7;
  id v16 = v6;
  id v17 = v8;
  id v18 = v7;
  [v15 fetchCountOfClipsWithDateInterval:v16 completion:v19];
}

void __79__HMCameraRecordingEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = [*(id *)(a1 + 40) identifier];
      id v12 = [v11 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v22 = v10;
      __int16 v23 = 2114;
      v24 = v12;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched count of %@ clips", buf, 0x20u);
    }
    uint64_t v13 = [*(id *)(a1 + 32) reachabilityEventManager];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __79__HMCameraRecordingEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke_20;
    v17[3] = &unk_1E593F448;
    v17[4] = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 48);
    id v20 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 40);
    id v19 = v5;
    [v13 fetchCountOfEventsWithDateInterval:v14 completion:v17];
  }
  else
  {
    uint64_t v15 = [*(id *)(a1 + 32) context];
    id v16 = [v15 delegateCaller];
    [v16 callCompletion:*(void *)(a1 + 56) obj:0 error:v6];
  }
}

void __79__HMCameraRecordingEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = [*(id *)(a1 + 40) identifier];
      id v12 = [v11 shortDescription];
      int v21 = 138543874;
      id v22 = v10;
      __int16 v23 = 2114;
      v24 = v12;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched count of %@ reachability events", (uint8_t *)&v21, 0x20u);
    }
    uint64_t v13 = [*(id *)(a1 + 48) unsignedIntegerValue];
    uint64_t v14 = [v5 unsignedIntegerValue] + v13;
    uint64_t v15 = [*(id *)(a1 + 32) context];
    id v16 = [v15 delegateCaller];
    uint64_t v17 = *(void *)(a1 + 56);
    id v18 = [NSNumber numberWithUnsignedInteger:v14];
    [v16 callCompletion:v17 obj:v18 error:0];
  }
  else
  {
    id v19 = [*(id *)(a1 + 32) context];
    id v20 = [v19 delegateCaller];
    [v20 callCompletion:*(void *)(a1 + 56) obj:0 error:v6];
  }
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
  v10[2] = __62__HMCameraRecordingEventManager_fetchAllEventsWithCompletion___block_invoke;
  v10[3] = &unk_1E5944EC8;
  id v11 = v4;
  id v9 = v4;
  [(HMCameraRecordingEventManager *)self fetchEventsWithDateInterval:v8 limit:-1 shouldOrderAscending:1 completion:v10];
}

void __62__HMCameraRecordingEventManager_fetchAllEventsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (void)fetchEventsWithDateInterval:(id)a3 quality:(int64_t)a4 limit:(unint64_t)a5 shouldOrderAscending:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch recording events with date interval"];
  uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
  id v16 = self;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v18 = v31 = v12;
    [v14 identifier];
    id v19 = v29 = v15;
    [v19 shortDescription];
    id v30 = v13;
    unint64_t v20 = a5;
    BOOL v21 = v8;
    v23 = int64_t v22 = a4;
    v24 = HMStringFromCameraClipQuality(v22);
    *(_DWORD *)buf = 138544642;
    v39 = v18;
    __int16 v40 = 2114;
    v41 = v23;
    __int16 v42 = 2112;
    id v43 = v31;
    __int16 v44 = 2112;
    v45 = v24;
    __int16 v46 = 2048;
    unint64_t v47 = v20;
    __int16 v48 = 1024;
    BOOL v49 = v21;
    _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching recording events with date interval: %@ quality: %@ limit: %lu shouldOrderAscending: %d", buf, 0x3Au);

    a4 = v22;
    BOOL v8 = v21;
    a5 = v20;
    id v13 = v30;

    uint64_t v15 = v29;
    id v12 = v31;
  }

  __int16 v25 = [(HMCameraRecordingEventManager *)v16 clipManager];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __107__HMCameraRecordingEventManager_fetchEventsWithDateInterval_quality_limit_shouldOrderAscending_completion___block_invoke;
  v32[3] = &unk_1E593F420;
  v32[4] = v16;
  id v33 = v14;
  id v34 = v12;
  id v35 = v13;
  unint64_t v36 = a5;
  BOOL v37 = v8;
  id v26 = v12;
  id v27 = v14;
  id v28 = v13;
  [v25 fetchClipsWithDateInterval:v26 quality:a4 limit:a5 shouldOrderAscending:v8 completion:v32];
}

void __107__HMCameraRecordingEventManager_fetchEventsWithDateInterval_quality_limit_shouldOrderAscending_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) identifier];
      id v12 = [v11 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v28 = v10;
      __int16 v29 = 2114;
      id v30 = v12;
      __int16 v31 = 2048;
      uint64_t v32 = [v5 count];
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu clips", buf, 0x20u);
    }
    id v13 = [*(id *)(a1 + 32) reachabilityEventManager];
    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v15 = *(unsigned __int8 *)(a1 + 72);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __107__HMCameraRecordingEventManager_fetchEventsWithDateInterval_quality_limit_shouldOrderAscending_completion___block_invoke_12;
    v21[3] = &unk_1E593F420;
    v21[4] = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 48);
    id v24 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 40);
    id v17 = v5;
    uint64_t v18 = *(void *)(a1 + 64);
    id v23 = v17;
    uint64_t v25 = v18;
    char v26 = *(unsigned char *)(a1 + 72);
    [v13 fetchEventsWithDateInterval:v16 limit:v14 shouldOrderAscending:v15 completion:v21];
  }
  else
  {
    id v19 = [*(id *)(a1 + 32) context];
    unint64_t v20 = [v19 delegateCaller];
    [v20 callCompletion:*(void *)(a1 + 56) obj:0 error:v6];
  }
}

void __107__HMCameraRecordingEventManager_fetchEventsWithDateInterval_quality_limit_shouldOrderAscending_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) identifier];
      id v12 = [v11 shortDescription];
      int v16 = 138543874;
      id v17 = v10;
      __int16 v18 = 2114;
      id v19 = v12;
      __int16 v20 = 2048;
      uint64_t v21 = [v5 count];
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu reachability events", (uint8_t *)&v16, 0x20u);
    }
    id v13 = [*(id *)(a1 + 32) mergedRecordingEventsWithRecordingEvents1:*(void *)(a1 + 48) recordingEvents2:v5 limit:*(void *)(a1 + 64) shouldOrderAscending:*(unsigned __int8 *)(a1 + 72)];
    uint64_t v14 = [*(id *)(a1 + 32) context];
    uint64_t v15 = [v14 delegateCaller];
    [v15 callCompletion:*(void *)(a1 + 56) obj:v13 error:0];
  }
  else
  {
    id v13 = [*(id *)(a1 + 32) context];
    uint64_t v14 = [v13 delegateCaller];
    [v14 callCompletion:*(void *)(a1 + 56) obj:0 error:v6];
  }
}

- (void)fetchEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 shouldOrderAscending:(BOOL)a5 completion:(id)a6
{
}

- (void)fetchEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
}

- (void)performCloudPullWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Performing cloud pull", (uint8_t *)&v10, 0xCu);
  }
  id v9 = [(HMCameraRecordingEventManager *)v6 clipManager];
  [v9 performCloudPullWithCompletion:v4];
}

- (void)removeObserver:(id)a3
{
  id v11 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMCameraRecordingEventManager *)self delegateCallersByObservers];
  uint64_t v5 = [v4 count];

  id v6 = [(HMCameraRecordingEventManager *)self delegateCallersByObservers];
  [v6 removeObjectForKey:v11];

  id v7 = [(HMCameraRecordingEventManager *)self delegateCallersByObservers];
  uint64_t v8 = [v7 count];

  os_unfair_lock_unlock(&self->_lock);
  if (!v8 && v5)
  {
    id v9 = [(HMCameraRecordingEventManager *)self clipManager];
    [v9 removeObserver:self];

    int v10 = [(HMCameraRecordingEventManager *)self reachabilityEventManager];
    [v10 removeObserver:self];
  }
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  if (v6)
  {
    id v7 = [[HMDelegateCaller alloc] initWithQueue:v6];
  }
  else
  {
    uint64_t v8 = [(HMCameraRecordingEventManager *)self context];
    id v7 = [v8 delegateCaller];
  }
  id v9 = [(HMCameraRecordingEventManager *)self delegateCallersByObservers];
  [v9 setObject:v7 forKey:v12];

  os_unfair_lock_unlock(&self->_lock);
  int v10 = [(HMCameraRecordingEventManager *)self clipManager];
  [v10 addObserver:self queue:v6];

  id v11 = [(HMCameraRecordingEventManager *)self reachabilityEventManager];
  [v11 addObserver:self queue:v6];
}

- (void)addObserver:(id)a3
{
}

- (NSString)zoneName
{
  v2 = [(HMCameraRecordingEventManager *)self clipManager];
  uint64_t v3 = [v2 zoneName];

  return (NSString *)v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15_13326 != -1) {
    dispatch_once(&logCategory__hmf_once_t15_13326, &__block_literal_global_13327);
  }
  v2 = (void *)logCategory__hmf_once_v16_13328;

  return v2;
}

uint64_t __44__HMCameraRecordingEventManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v16_13328;
  logCategory__hmf_once_v16_13328 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end