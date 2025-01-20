@interface HMDSelfRemovalWatchdog
+ (id)logCategory;
- (HMDCoreDataCloudMirroringExportStatusMonitor)monitor;
- (HMDSelfRemovalWatchdog)initWithCurrentAccessoryUUID:(id)a3 workQueue:(id)a4;
- (HMFTimer)watchdogTimer;
- (NSDate)selfRemovalBeginDate;
- (NSManagedObjectID)currentAccessoryModelObjectID;
- (NSUUID)currentAccessoryUUID;
- (OS_dispatch_queue)workQueue;
- (id)_retrieveExpectedObjectIDsTokenMap;
- (id)completion;
- (void)_stopWithError:(id)a3;
- (void)configure;
- (void)monitorDidObserveExportComplete:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCurrentAccessoryModelObjectID:(id)a3;
- (void)setMonitor:(id)a3;
- (void)setWatchdogTimer:(id)a3;
- (void)startWithCompletion:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDSelfRemovalWatchdog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_currentAccessoryModelObjectID, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_selfRemovalBeginDate, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentAccessoryUUID, 0);
}

- (void)setMonitor:(id)a3
{
}

- (HMDCoreDataCloudMirroringExportStatusMonitor)monitor
{
  return (HMDCoreDataCloudMirroringExportStatusMonitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentAccessoryModelObjectID:(id)a3
{
}

- (NSManagedObjectID)currentAccessoryModelObjectID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setWatchdogTimer:(id)a3
{
}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)selfRemovalBeginDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)currentAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v13 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Timeout waiting for cloud mirroring export to complete", buf, 0xCu);
  }
  v9 = [(HMDSelfRemovalWatchdog *)v6 monitor];
  v10 = [v9 managedObjectContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__HMDSelfRemovalWatchdog_timerDidFire___block_invoke;
  v11[3] = &unk_264A2F7F8;
  v11[4] = v6;
  [v10 performBlock:v11];
}

void __39__HMDSelfRemovalWatchdog_timerDidFire___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:8];
  [v1 _stopWithError:v2];
}

- (void)monitorDidObserveExportComplete:(id)a3
{
  id v4 = [(HMDSelfRemovalWatchdog *)self monitor];
  v5 = [v4 managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__HMDSelfRemovalWatchdog_monitorDidObserveExportComplete___block_invoke;
  v6[3] = &unk_264A2F7F8;
  v6[4] = self;
  [v5 performBlock:v6];
}

uint64_t __58__HMDSelfRemovalWatchdog_monitorDidObserveExportComplete___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Cloud mirroring export is finished", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _stopWithError:0];
}

- (id)_retrieveExpectedObjectIDsTokenMap
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF2F8];
  id v4 = [(HMDSelfRemovalWatchdog *)self selfRemovalBeginDate];
  v5 = [v3 fetchHistoryAfterDate:v4];

  [v5 setResultType:5];
  v6 = +[HMDCoreData sharedInstance];
  int v7 = [v6 cloudPrivateStore];
  v56 = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
  [v5 setAffectedStores:v8];

  uint64_t v9 = [(HMDSelfRemovalWatchdog *)self monitor];
  v10 = [v9 managedObjectContext];
  id v50 = 0;
  v11 = [v10 executeRequest:v5 error:&v50];
  id v12 = v50;

  if (v11)
  {
    id v41 = v12;
    v42 = v11;
    v43 = v5;
    [v11 result];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v47;
      obuint64_t j = v13;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v47 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v19 = [v18 changes];
          v45[0] = MEMORY[0x263EF8330];
          v45[1] = 3221225472;
          v45[2] = __60__HMDSelfRemovalWatchdog__retrieveExpectedObjectIDsTokenMap__block_invoke;
          v45[3] = &unk_264A1D148;
          v45[4] = self;
          v20 = objc_msgSend(v19, "na_firstObjectPassingTest:", v45);

          if (v20)
          {
            id v26 = v18;
            v27 = [MEMORY[0x263EFF9A0] dictionary];
            long long v51 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            v28 = [v26 changes];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:buf count:16];
            id v13 = obj;
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v52;
              do
              {
                for (uint64_t j = 0; j != v30; ++j)
                {
                  if (*(void *)v52 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  v33 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                  v34 = [v26 token];
                  v35 = [v33 changedObjectID];
                  [v27 setObject:v34 forKey:v35];
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:buf count:16];
              }
              while (v30);
            }

            v25 = (void *)[v27 copy];
            goto LABEL_21;
          }
        }
        id v13 = obj;
        uint64_t v15 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    v21 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v58 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to find transaction that did the self removal", buf, 0xCu);
    }
    v25 = 0;
LABEL_21:
    v11 = v42;
    v5 = v43;
    id v12 = v41;
  }
  else
  {
    v36 = (void *)MEMORY[0x230FBD990]();
    v37 = self;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v58 = v39;
      __int16 v59 = 2112;
      id v60 = v12;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch store history: %@", buf, 0x16u);
    }
    v25 = 0;
  }

  return v25;
}

uint64_t __60__HMDSelfRemovalWatchdog__retrieveExpectedObjectIDsTokenMap__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 changeType] == 2)
  {
    id v4 = [v3 changedObjectID];
    v5 = [*(id *)(a1 + 32) currentAccessoryModelObjectID];
    uint64_t v6 = [v4 isEqual:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_stopWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(HMDSelfRemovalWatchdog *)self watchdogTimer];
  [v4 suspend];

  uint64_t v5 = [(HMDSelfRemovalWatchdog *)self completion];
  uint64_t v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }

  [(HMDSelfRemovalWatchdog *)self setCompletion:0];
}

- (void)startWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[HMDCoreDataCloudTransform sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__HMDSelfRemovalWatchdog_startWithCompletion___block_invoke;
  v7[3] = &unk_264A2EDE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 runTransformWithCompletion:v7];
}

void __46__HMDSelfRemovalWatchdog_startWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) monitor];
  id v3 = [v2 managedObjectContext];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__HMDSelfRemovalWatchdog_startWithCompletion___block_invoke_2;
  v5[3] = &unk_264A2F870;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 performBlock:v5];
}

void __46__HMDSelfRemovalWatchdog_startWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setCompletion:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) watchdogTimer];
  [v2 suspend];

  id v3 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:1 options:55.0];
  [*(id *)(a1 + 32) setWatchdogTimer:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 watchdogTimer];
  [v5 setDelegate:v4];

  id v6 = [*(id *)(a1 + 32) watchdogTimer];
  [v6 resume];

  id v7 = [*(id *)(a1 + 32) _retrieveExpectedObjectIDsTokenMap];
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 32);
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v20 = 138543618;
    v21 = v11;
    __int16 v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Self removal expected objectIDs token map: %@", (uint8_t *)&v20, 0x16u);
  }
  if (v7)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Started monitoring cloud export", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v16 = *(void **)(a1 + 32);
    v17 = [v16 monitor];
    [v17 setDelegate:v16];

    v18 = [*(id *)(a1 + 32) monitor];
    [v18 configureWithExpectedObjectIDToExportedToken:v7];
  }
  else
  {
    v19 = *(void **)(a1 + 32);
    v18 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v19 _stopWithError:v18];
  }
}

- (void)configure
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = +[HMDCoreDataCloudTransform sharedInstance];
  id v4 = (HMDCoreDataCloudMirroringExportStatusMonitor *)[v3 newCloudMirrorExportStatusMonitor];
  monitor = self->_monitor;
  self->_monitor = v4;

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__81035;
  v18 = __Block_byref_object_dispose__81036;
  id v19 = 0;
  id v6 = [(HMDSelfRemovalWatchdog *)self monitor];
  id v7 = [v6 managedObjectContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __35__HMDSelfRemovalWatchdog_configure__block_invoke;
  v13[3] = &unk_264A2F0A0;
  v13[4] = self;
  v13[5] = &v14;
  [v7 performBlockAndWait:v13];

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  HMFGetOSLogHandle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = HMFGetLogIdentifier();
    uint64_t v12 = v15[5];
    *(_DWORD *)buf = 138543618;
    v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@modelObjectID for current accessory found: %@", buf, 0x16u);
  }
  [(HMDSelfRemovalWatchdog *)v9 setCurrentAccessoryModelObjectID:v15[5]];
  _Block_object_dispose(&v14, 8);
}

void __35__HMDSelfRemovalWatchdog_configure__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = +[MKFCKAppleMediaAccessory fetchRequest];
  id v3 = (void *)MEMORY[0x263F08A98];
  id v4 = [*(id *)(a1 + 32) currentAccessoryUUID];
  uint64_t v5 = [v3 predicateWithFormat:@"(%K == %@)", @"modelID", v4];
  [v2 setPredicate:v5];

  id v6 = [*(id *)(a1 + 32) monitor];
  id v7 = [v6 managedObjectContext];
  id v19 = 0;
  id v8 = [v7 executeFetchRequest:v2 error:&v19];
  id v9 = v19;

  if (v8 && !objc_msgSend(v8, "hmf_isEmpty"))
  {
    uint64_t v15 = [v8 firstObject];
    uint64_t v16 = [v15 objectID];
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [*(id *)(a1 + 32) currentAccessoryUUID];
      *(_DWORD *)buf = 138543874;
      v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch current accessory cloud model with UUID %@ due to error %@", buf, 0x20u);
    }
  }
}

- (HMDSelfRemovalWatchdog)initWithCurrentAccessoryUUID:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDSelfRemovalWatchdog;
  id v9 = [(HMDSelfRemovalWatchdog *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_currentAccessoryUUID, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
    uint64_t v11 = [MEMORY[0x263EFF910] date];
    selfRemovalBeginDate = v10->_selfRemovalBeginDate;
    v10->_selfRemovalBeginDate = (NSDate *)v11;
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_81054 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_81054, &__block_literal_global_81055);
  }
  id v2 = (void *)logCategory__hmf_once_v10_81056;
  return v2;
}

void __37__HMDSelfRemovalWatchdog_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v10_81056;
  logCategory__hmf_once_v10_81056 = v0;
}

@end