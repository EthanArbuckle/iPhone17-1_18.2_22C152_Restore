@interface HMDSnapshotCacheRequestHandler
+ (id)logCategory;
- (BOOL)isSnapshotPresentForCharacteristicEventUUID:(id)a3;
- (HMDSnapshotCacheRequestHandler)initWithWorkQueue:(id)a3 logID:(id)a4;
- (NSString)logIdentifier;
- (void)addSnapshotFileToCache:(id)a3;
- (void)removeSnapshotFileToCache:(id)a3 error:(id)a4;
- (void)requestSnapshot:(id)a3 streamingTierType:(unint64_t)a4 completionHandler:(id)a5;
- (void)setSnapshotFileToCache:(id)a3 snapshotCharacteristicEventUUID:(id)a4;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDSnapshotCacheRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_snapshotCacheMap, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (BOOL)isSnapshotPresentForCharacteristicEventUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    snapshotCacheMap = self->_snapshotCacheMap;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    snapshotCacheMap = 0;
  }
  v6 = [(NSMutableDictionary *)snapshotCacheMap objectForKeyedSubscript:v4];
  v7 = [v6 snapshotFile];

  if (v7)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Snapshot file is present in cache for %@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v7 != 0;
}

- (void)requestSnapshot:(id)a3 streamingTierType:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__HMDSnapshotCacheRequestHandler_requestSnapshot_streamingTierType_completionHandler___block_invoke;
  block[3] = &unk_1E6A193D0;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(workQueue, block);
}

void __86__HMDSnapshotCacheRequestHandler_requestSnapshot_streamingTierType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[2];
  }
  v3 = *(void **)(a1 + 40);
  id v4 = v2;
  v5 = [v3 snapshotCharacteristicEventUUID];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 32);
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      uint64_t v20 = *(void *)(a1 + 40);
      int v23 = 138543618;
      v24 = v19;
      __int16 v25 = 2112;
      uint64_t v26 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Did not find the snapshot cache file for %@", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v21 = *(void *)(a1 + 48);
    __int16 v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v15);
    goto LABEL_11;
  }
  id v7 = [v6 snapshotFile];

  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 40);
      int v23 = 138543618;
      v24 = v12;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Found the snapshot cache file for %@", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    __int16 v15 = [v6 snapshotFile];
    (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);
LABEL_11:

    goto LABEL_15;
  }
  if (v11)
  {
    v22 = HMFGetLogIdentifier();
    int v23 = 138543362;
    v24 = v22;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Found the snapshot cache file placeholder, saving the completion handler", (uint8_t *)&v23, 0xCu);
  }
  [v6 setSnapshotRequestCompletion:*(void *)(a1 + 48)];
LABEL_15:
}

- (void)timerDidFire:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    snapshotCacheMap = self->_snapshotCacheMap;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    snapshotCacheMap = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
  }
  v6 = (void *)[(NSMutableDictionary *)snapshotCacheMap copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
        if (self) {
          v12 = self->_snapshotCacheMap;
        }
        else {
          v12 = 0;
        }
        uint64_t v13 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * v10)];
        id v14 = [v13 timer];

        if (v14 == v4)
        {
          id v16 = (void *)MEMORY[0x1D9452090]();
          id v17 = self;
          v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v26 = v19;
            __int16 v27 = 2112;
            uint64_t v28 = v11;
            _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Cache entry for %@ has expired", buf, 0x16u);
          }
          if (self) {
            uint64_t v20 = v17->_snapshotCacheMap;
          }
          else {
            uint64_t v20 = 0;
          }
          [(NSMutableDictionary *)v20 removeObjectForKey:v11];

          goto LABEL_21;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v15 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
      uint64_t v8 = v15;
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_21:
}

- (void)setSnapshotFileToCache:(id)a3 snapshotCharacteristicEventUUID:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v6 = (HMDSnapshotCacheEntry *)a3;
  uint64_t v7 = (HMDSnapshotCacheEntry *)a4;
  if (self) {
    snapshotCacheMap = self->_snapshotCacheMap;
  }
  else {
    snapshotCacheMap = 0;
  }
  uint64_t v9 = [(NSMutableDictionary *)snapshotCacheMap objectForKeyedSubscript:v7];
  uint64_t v10 = [v9 snapshotRequestCompletion];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v25 = 138543874;
      uint64_t v26 = v14;
      __int16 v27 = 2112;
      uint64_t v28 = v7;
      __int16 v29 = 2112;
      uint64_t v30 = v6;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Snapshot request completion is already set for %@, calling completion with %@", (uint8_t *)&v25, 0x20u);
    }
    uint64_t v15 = [v9 snapshotRequestCompletion];
    ((void (**)(void, HMDSnapshotCacheEntry *, void))v15)[2](v15, v6, 0);
  }
  id v16 = objc_alloc(MEMORY[0x1E4F65580]);
  id v17 = (void *)[v16 initWithTimeInterval:1 options:*(double *)&snapshotCacheValidPeriod];
  [v17 setDelegate:self];
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  [v17 setDelegateQueue:workQueue];
  v19 = [[HMDSnapshotCacheEntry alloc] initWithSnapshotCharacteristicEventUUID:v7 snapshotFile:v6 timer:v17];

  uint64_t v20 = (void *)MEMORY[0x1D9452090]();
  long long v21 = self;
  long long v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    long long v23 = HMFGetLogIdentifier();
    int v25 = 138543874;
    uint64_t v26 = v23;
    __int16 v27 = 2112;
    uint64_t v28 = v19;
    __int16 v29 = 2112;
    uint64_t v30 = v7;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Setting Cache Entry %@ for snapshotCharacteristicEventUUID: %@", (uint8_t *)&v25, 0x20u);
  }
  if (self) {
    long long v24 = v21->_snapshotCacheMap;
  }
  else {
    long long v24 = 0;
  }
  [(NSMutableDictionary *)v24 setObject:v19 forKeyedSubscript:v7];
  [v17 resume];
}

- (void)removeSnapshotFileToCache:(id)a3 error:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self) {
    snapshotCacheMap = self->_snapshotCacheMap;
  }
  else {
    snapshotCacheMap = 0;
  }
  uint64_t v9 = [(NSMutableDictionary *)snapshotCacheMap objectForKeyedSubscript:v6];
  uint64_t v10 = [v9 snapshotRequestCompletion];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v21 = 138543874;
      long long v22 = v14;
      __int16 v23 = 2112;
      id v24 = v6;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Snapshot request completion is already set for %@, calling completion with error %@", (uint8_t *)&v21, 0x20u);
    }
    uint64_t v15 = [v9 snapshotRequestCompletion];
    ((void (**)(void, void, id))v15)[2](v15, 0, v7);
  }
  id v16 = (void *)MEMORY[0x1D9452090]();
  id v17 = self;
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    int v21 = 138543618;
    long long v22 = v19;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Removing Cache Entry for snapshotCharacteristicEventUUID: %@", (uint8_t *)&v21, 0x16u);
  }
  if (self) {
    uint64_t v20 = v17->_snapshotCacheMap;
  }
  else {
    uint64_t v20 = 0;
  }
  [(NSMutableDictionary *)v20 removeObjectForKey:v6];
}

- (void)addSnapshotFileToCache:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HMDSnapshotCacheEntry alloc] initWithSnapshotCharacteristicEventUUID:v4 snapshotFile:0 timer:0];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v11 = 138543874;
    v12 = v9;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Added Cache Entry %@ for snapshotCharacteristicEventUUID: %@", (uint8_t *)&v11, 0x20u);
  }
  if (v7) {
    snapshotCacheMap = v7->_snapshotCacheMap;
  }
  else {
    snapshotCacheMap = 0;
  }
  [(NSMutableDictionary *)snapshotCacheMap setObject:v5 forKeyedSubscript:v4];
}

- (HMDSnapshotCacheRequestHandler)initWithWorkQueue:(id)a3 logID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDSnapshotCacheRequestHandler;
  uint64_t v9 = [(HMDSnapshotCacheRequestHandler *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeStrong((id *)&v10->_logIdentifier, a4);
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    snapshotCacheMap = v10->_snapshotCacheMap;
    v10->_snapshotCacheMap = (NSMutableDictionary *)v11;
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_175737 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_175737, &__block_literal_global_175738);
  }
  v2 = (void *)logCategory__hmf_once_v1_175739;
  return v2;
}

uint64_t __45__HMDSnapshotCacheRequestHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_175739;
  logCategory__hmf_once_v1_175739 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end