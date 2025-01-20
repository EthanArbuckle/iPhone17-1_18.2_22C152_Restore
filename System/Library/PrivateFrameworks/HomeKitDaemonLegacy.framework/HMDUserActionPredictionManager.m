@interface HMDUserActionPredictionManager
- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4;
- (HMBLocalZone)localZone;
- (HMDDatabaseZoneManager)zoneManager;
- (HMDUserActionPredictionManager)initWithHome:(id)a3;
- (HMDUserActionPredictionManager)initWithZoneManager:(id)a3 workQueue:(id)a4;
- (OS_dispatch_queue)workQueue;
- (id)_removeZones;
- (void)configure;
- (void)removeZones;
- (void)setLocalZone:(id)a3;
- (void)zoneManagerDidStart:(id)a3;
- (void)zoneManagerDidStop:(id)a3;
@end

@implementation HMDUserActionPredictionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
}

- (HMDDatabaseZoneManager)zoneManager
{
  return (HMDDatabaseZoneManager *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)zoneManagerDidStop:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDUserActionPredictionManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@User Action zone manager stopped", (uint8_t *)&v10, 0xCu);
  }
  [(HMDUserActionPredictionManager *)v7 setLocalZone:0];
}

- (void)zoneManagerDidStart:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  v5 = [(HMDUserActionPredictionManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v52 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@User Action zone manager started", buf, 0xCu);
  }
  id v10 = objc_alloc(MEMORY[0x1E4F653F0]);
  v11 = NSString;
  uint64_t v12 = MEMORY[0x1D94505D0](v7, a2);
  v13 = [v11 stringWithFormat:@"%@, %s:%ld", v12, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/User/User Action Predictions/HMDUserActionPredictionManager.m", 135];
  v14 = (void *)[v10 initWithName:v13];

  v15 = [(HMDUserActionPredictionManager *)v7 zoneManager];
  v16 = [v15 localZone];
  [(HMDUserActionPredictionManager *)v7 setLocalZone:v16];

  v17 = [(HMDUserActionPredictionManager *)v7 localZone];
  [v17 startUp];

  v43 = v14;
  [v14 markWithReason:@"Fetch models from backing store"];
  v18 = [(HMDUserActionPredictionManager *)v7 localZone];
  id v50 = 0;
  v19 = [v18 fetchModelsOfType:objc_opt_class() error:&v50];
  id v42 = v50;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v19;
  uint64_t v20 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v25 = [(HMDUserActionPredictionManager *)v7 localZone];
        v26 = v7;
        v27 = (void *)MEMORY[0x1E4F1CAD0];
        v28 = [v24 hmbModelID];
        v55 = v28;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
        v30 = [v27 setWithArray:v29];
        v31 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Remove no longer used user action prediction"];
        id v32 = (id)[v25 removeModelIDs:v30 options:v31];

        v7 = v26;
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v21);
  }

  if (v42)
  {
    v33 = (void *)MEMORY[0x1D9452090]();
    v34 = v7;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v52 = v36;
      __int16 v53 = 2112;
      id v54 = v42;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@User Action model fetch failed: %@", buf, 0x16u);
    }
  }
  v37 = (void *)MEMORY[0x1D9452090]();
  v38 = v7;
  v39 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    v40 = HMFGetLogIdentifier();
    v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
    *(_DWORD *)buf = 138543618;
    v52 = v40;
    __int16 v53 = 2112;
    id v54 = v41;
    _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Startup User Action model fetch of %@ existing models is complete", buf, 0x16u);
  }
  [v43 invalidate];
}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v4 = [(HMDUserActionPredictionManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  return 0;
}

- (id)_removeZones
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDUserActionPredictionManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v11 = 138543362;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing all user action prediction manager data", (uint8_t *)&v11, 0xCu);
  }
  v8 = [(HMDUserActionPredictionManager *)v5 zoneManager];
  v9 = [v8 remove];

  return v9;
}

- (HMBLocalZone)localZone
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_localZone;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLocalZone:(id)a3
{
  id v4 = (HMBLocalZone *)a3;
  os_unfair_lock_lock_with_options();
  localZone = self->_localZone;
  self->_localZone = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeZones
{
  v3 = [(HMDUserActionPredictionManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HMDUserActionPredictionManager_removeZones__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

id __45__HMDUserActionPredictionManager_removeZones__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _removeZones];
}

- (void)configure
{
  v3 = [(HMDUserActionPredictionManager *)self zoneManager];
  [v3 setDelegate:self];

  id v4 = [(HMDUserActionPredictionManager *)self zoneManager];
  [v4 setDataSource:self];

  v5 = [(HMDUserActionPredictionManager *)self zoneManager];
  [v5 configure];

  v6 = [(HMDUserActionPredictionManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__HMDUserActionPredictionManager_configure__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v6, block);
}

void __43__HMDUserActionPredictionManager_configure__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) zoneManager];
  [v1 start];
}

- (HMDUserActionPredictionManager)initWithZoneManager:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDUserActionPredictionManager;
  v9 = [(HMDUserActionPredictionManager *)&v13 init];
  if (v9)
  {
    id v10 = [v7 defaultConfiguration];
    int v11 = (void *)[v10 mutableCopy];

    [v11 setZoneOwner:1];
    [v11 setShouldCreateZone:0];
    [v7 setDefaultConfiguration:v11];
    objc_storeStrong((id *)&v9->_workQueue, a4);
    objc_storeStrong((id *)&v9->_zoneManager, a3);
  }
  return v9;
}

- (HMDUserActionPredictionManager)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = [v4 workQueue];
  id v6 = [v4 uuid];
  if (v6)
  {
    id v7 = v6;
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9A1A9B9D-BE90-4E26-A5EC-70FE027E74EA"];
    v9 = (void *)MEMORY[0x1E4F29128];
    id v10 = [v7 UUIDString];
    int v11 = [v10 dataUsingEncoding:4];
    uint64_t v12 = objc_msgSend(v9, "hmf_UUIDWithNamespace:data:", v8, v11);

    objc_super v13 = [v12 UUIDString];
    v14 = [@"user-action-prediction-data-" stringByAppendingString:v13];

    v15 = [HMDDatabaseZoneManager alloc];
    v16 = +[HMDDatabase defaultDatabase];
    v17 = [(HMDDatabaseZoneManager *)v15 initWithDatabase:v16 zoneName:v14 home:v4 messageTargetUUID:v12 workQueue:v5];

    v18 = [(HMDUserActionPredictionManager *)self initWithZoneManager:v17 workQueue:v5];
    return v18;
  }
  else
  {
    uint64_t v20 = (HMDHAPAccessoryAdvertisement *)_HMFPreconditionFailure();
    [(HMDHAPAccessoryAdvertisement *)v20 .cxx_destruct];
  }
  return result;
}

@end