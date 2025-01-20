@interface HMBPrivateCloudZoneRebuilder
+ (id)logCategory;
- (BOOL)isZoneRebuildInProgress;
- (CKRecord)previousSentinelRebuildRecord;
- (HMBCloudZone)cloudZone;
- (HMBCloudZoneRebuilderStatus)rebuilderStatus;
- (HMBPrivateCloudZoneRebuilder)initWithCloudZone:(id)a3;
- (HMFTimer)uploadMonitorWatchdogTimer;
- (NAFuture)rebuildCompleteFuture;
- (NSUUID)lastRebuildUUID;
- (id)logIdentifier;
- (id)zoneStartUp;
- (void)handleIdentityLost;
- (void)handleZoneChanged;
- (void)rebuild;
- (void)setCloudZone:(id)a3;
- (void)setLastRebuildUUID:(id)a3;
- (void)setPreviousSentinelRebuildRecord:(id)a3;
- (void)setRebuildCompleteFuture:(id)a3;
- (void)setRebuilderStatus:(id)a3;
- (void)setUploadMonitorWatchdogTimer:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMBPrivateCloudZoneRebuilder

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_storeStrong((id *)&self->_uploadMonitorWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_lastRebuildUUID, 0);
  objc_storeStrong((id *)&self->_previousSentinelRebuildRecord, 0);
  objc_storeStrong((id *)&self->_rebuildCompleteFuture, 0);
  objc_storeStrong((id *)&self->_rebuilderStatus, 0);
}

- (void)setCloudZone:(id)a3
{
}

- (HMBCloudZone)cloudZone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudZone);
  return (HMBCloudZone *)WeakRetained;
}

- (void)setUploadMonitorWatchdogTimer:(id)a3
{
}

- (HMFTimer)uploadMonitorWatchdogTimer
{
  return self->_uploadMonitorWatchdogTimer;
}

- (void)setLastRebuildUUID:(id)a3
{
}

- (NSUUID)lastRebuildUUID
{
  return self->_lastRebuildUUID;
}

- (void)setPreviousSentinelRebuildRecord:(id)a3
{
}

- (CKRecord)previousSentinelRebuildRecord
{
  return self->_previousSentinelRebuildRecord;
}

- (void)setRebuildCompleteFuture:(id)a3
{
}

- (NAFuture)rebuildCompleteFuture
{
  return self->_rebuildCompleteFuture;
}

- (void)setRebuilderStatus:(id)a3
{
}

- (HMBCloudZoneRebuilderStatus)rebuilderStatus
{
  return (HMBCloudZoneRebuilderStatus *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(HMBPrivateCloudZoneRebuilder *)self cloudZone];
  v3 = [v2 zoneID];
  v4 = [v3 name];

  return v4;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMBPrivateCloudZoneRebuilder *)self uploadMonitorWatchdogTimer];

  if (v5 != v4)
  {
    v6 = (void *)MEMORY[0x1D944CB30]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)v20 = 138543362;
      *(void *)&v20[4] = v9;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly got a watchdog fire event from an unexpected timer.", v20, 0xCu);
    }
LABEL_9:

    goto LABEL_10;
  }
  os_unfair_lock_lock_with_options();
  v10 = [(HMBPrivateCloudZoneRebuilder *)self rebuilderStatus];
  uint64_t v11 = [v10 rebuildState];

  [(HMBPrivateCloudZoneRebuilder *)self setUploadMonitorWatchdogTimer:0];
  os_unfair_lock_unlock(&self->_propertyLock);
  if (v11 != 5)
  {
    v6 = (void *)MEMORY[0x1D944CB30]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      v19 = +[HMBCloudZoneRebuilderStatus rebuilderStateString:v11];
      *(_DWORD *)v20 = 138543618;
      *(void *)&v20[4] = v18;
      __int16 v21 = 2112;
      v22 = v19;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly got a watchdog fire event in state %@", v20, 0x16u);
    }
    goto LABEL_9;
  }
  id v17 = __transitionToState(self, (void *)2, @"Watchdog fired while monitoring the upload.", v12, v13, v14, v15, v16, *(uint64_t *)v20);
LABEL_10:
}

- (void)handleZoneChanged
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMBPrivateCloudZoneRebuilder *)self rebuilderStatus];
  uint64_t v5 = [v4 rebuildState];

  os_unfair_lock_unlock(p_propertyLock);
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v6 = [(HMBPrivateCloudZoneRebuilder *)self uploadMonitorWatchdogTimer];
    [v6 setDelegate:0];

    os_unfair_lock_lock_with_options();
    [(HMBPrivateCloudZoneRebuilder *)self setUploadMonitorWatchdogTimer:0];
    os_unfair_lock_unlock(p_propertyLock);
    v7 = __fetchSentinelModel(self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__HMBPrivateCloudZoneRebuilder_handleZoneChanged__block_invoke;
    v16[3] = &unk_1E69E9E78;
    v16[4] = self;
    v16[5] = v5;
    id v8 = (id)[v7 addFailureBlock:v16];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__HMBPrivateCloudZoneRebuilder_handleZoneChanged__block_invoke_20;
    v15[3] = &unk_1E69E9EA0;
    v15[4] = self;
    v15[5] = v5;
    id v9 = (id)[v7 addSuccessBlock:v15];
  }
  else
  {
    v10 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      uint64_t v14 = +[HMBCloudZoneRebuilderStatus rebuilderStateString:v5];
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      __int16 v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly got a CKNotification when in state %@ (ignoring)", buf, 0x16u);
    }
  }
}

void __49__HMBPrivateCloudZoneRebuilder_handleZoneChanged__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isHMFError] && objc_msgSend(v3, "code") == 2)
  {
    id v4 = (void *)MEMORY[0x1D944CB30]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v31 = v7;
      _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch succeeded, but no record returned.", buf, 0xCu);
    }
    if (*(void *)(a1 + 40) == 1)
    {
      uint64_t v13 = (void *)MEMORY[0x1D944CB30]();
      id v14 = *(id *)(a1 + 32);
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v31 = v16;
        id v17 = "%{public}@Insufficient to transition out of Lost Key state.";
LABEL_13:
        _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);

        goto LABEL_14;
      }
      goto LABEL_14;
    }
    id v27 = __transitionToState(*(void **)(a1 + 32), (void *)2, @"Failed to find sentinel model.", v8, v9, v10, v11, v12, v29);
LABEL_17:
    id v28 = v27;
    goto LABEL_18;
  }
  v18 = (void *)MEMORY[0x1D944CB30]();
  id v19 = *(id *)(a1 + 32);
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v31 = v21;
    __int16 v32 = 2112;
    id v33 = v3;
    _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_ERROR, "%{public}@received notification, but failed to fetch model: %@", buf, 0x16u);
  }
  if (*(void *)(a1 + 40) != 1)
  {
    id v27 = __transitionToState(*(void **)(a1 + 32), (void *)2, @"Failed to monitor sentinel due to error: %@", v22, v23, v24, v25, v26, (uint64_t)v3);
    goto LABEL_17;
  }
  uint64_t v13 = (void *)MEMORY[0x1D944CB30]();
  id v14 = *(id *)(a1 + 32);
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v31 = v16;
    id v17 = "%{public}@Will not transition out of Lost Key state.";
    goto LABEL_13;
  }
LABEL_14:

LABEL_18:
}

void __49__HMBPrivateCloudZoneRebuilder_handleZoneChanged__block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v50 = v7;
    __int16 v51 = 2112;
    id v52 = v3;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully fetched: %@", buf, 0x16u);
  }
  uint64_t v8 = [v3 hasCompleted];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1D944CB30]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v50 = v13;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Sentinel record indicates that zone is completely rebuilt.", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setLastRebuildUUID:0];
    id v19 = *(void **)(a1 + 32);
    v20 = @"Sentinel has been marked as complete.";
    uint64_t v21 = 7;
    goto LABEL_7;
  }
  uint64_t v23 = [*(id *)(a1 + 32) lastRebuildUUID];
  if (!v23) {
    goto LABEL_14;
  }
  uint64_t v24 = (void *)v23;
  uint64_t v25 = [v3 uniqueToken];
  uint64_t v26 = [*(id *)(a1 + 32) lastRebuildUUID];
  int v27 = [v25 isEqual:v26];

  if (!v27)
  {
LABEL_14:
    id v33 = [v3 uniqueToken];
    [*(id *)(a1 + 32) setLastRebuildUUID:v33];

    if (*(void *)(a1 + 40) != 1)
    {
      v39 = *(void **)(a1 + 32);
      v40 = [v39 lastRebuildUUID];
      v48 = [v3 uniqueToken];
      id v46 = __transitionToState(v39, (void *)5, @"Change observed in sentinel %@ -> %@", v41, v42, v43, v44, v45, (uint64_t)v40);

      goto LABEL_20;
    }
    id v28 = (void *)MEMORY[0x1D944CB30]();
    id v34 = *(id *)(a1 + 32);
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = HMFGetLogIdentifier();
      v37 = [*(id *)(a1 + 32) lastRebuildUUID];
      v38 = [v3 uniqueToken];
      *(_DWORD *)buf = 138543874;
      v50 = v36;
      __int16 v51 = 2112;
      id v52 = v37;
      __int16 v53 = 2112;
      v54 = v38;
      _os_log_impl(&dword_1D4693000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Sentinel record unique token changed %@ -> %@", buf, 0x20u);
    }
    goto LABEL_18;
  }
  if (*(void *)(a1 + 40) == 1)
  {
    id v28 = (void *)MEMORY[0x1D944CB30]();
    id v29 = *(id *)(a1 + 32);
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = HMFGetLogIdentifier();
      __int16 v32 = [v3 uniqueToken];
      *(_DWORD *)buf = 138543618;
      v50 = v31;
      __int16 v51 = 2112;
      id v52 = v32;
      _os_log_impl(&dword_1D4693000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Sentinel record unique token did not change from %@", buf, 0x16u);
    }
LABEL_18:
    goto LABEL_20;
  }
  id v19 = *(void **)(a1 + 32);
  v20 = @"No change observed in sentinel.";
  uint64_t v21 = 2;
LABEL_7:
  id v22 = __transitionToState(v19, (void *)v21, v20, v14, v15, v16, v17, v18, v47);
LABEL_20:
}

- (BOOL)isZoneRebuildInProgress
{
  v2 = [(HMBPrivateCloudZoneRebuilder *)self rebuildCompleteFuture];
  char v3 = [v2 isFinished] ^ 1;

  return v3;
}

- (void)rebuild
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMBPrivateCloudZoneRebuilder *)self rebuilderStatus];
  unint64_t v5 = [v4 rebuildState];

  os_unfair_lock_unlock(p_propertyLock);
  if (v5 <= 7 && ((1 << v5) & 0x83) != 0)
  {
    id v11 = __transitionToState(self, (void *)4, @"Attempting to acquire lock on zone.", v6, v7, v8, v9, v10, *(uint64_t *)v17);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = +[HMBCloudZoneRebuilderStatus rebuilderStateString:v5];
      *(_DWORD *)uint64_t v17 = 138543618;
      *(void *)&v17[4] = v15;
      __int16 v18 = 2112;
      id v19 = v16;
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Received a request to begin rebuild but we are already in: %@.", v17, 0x16u);
    }
  }
}

- (void)handleIdentityLost
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMBPrivateCloudZoneRebuilder *)self rebuilderStatus];
  unint64_t v5 = [v4 rebuildState];

  os_unfair_lock_unlock(p_propertyLock);
  if (v5 <= 7 && ((1 << v5) & 0x83) != 0)
  {
    id v11 = __transitionToState(self, (void *)1, @"Received notification that zone has lost keys.", v6, v7, v8, v9, v10, *(uint64_t *)v17);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = +[HMBCloudZoneRebuilderStatus rebuilderStateString:v5];
      *(_DWORD *)uint64_t v17 = 138543618;
      *(void *)&v17[4] = v15;
      __int16 v18 = 2112;
      id v19 = v16;
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Not transitioning to Lost Key state, already in an active rebuild state (%@).", v17, 0x16u);
    }
  }
}

- (id)zoneStartUp
{
  char v3 = [(HMBPrivateCloudZoneRebuilder *)self cloudZone];
  id v4 = [v3 localZone];

  if (v4)
  {
    objc_initWeak(&location, self);
    uint64_t v10 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v15, &location);
    id v11 = objc_msgSend(v3, "operationScheduler", v14, 3221225472, __43__HMBPrivateCloudZoneRebuilder_zoneStartUp__block_invoke, &unk_1E69EA2B0);
    uint64_t v12 = [v10 lazyFutureWithBlock:&v14 scheduler:v11];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v12 = __transitionToState(self, (void *)7, @"Not starting up as a mirror. Ignoring rebuild steps.", v5, v6, v7, v8, v9, v14);
  }

  return v12;
}

void __43__HMBPrivateCloudZoneRebuilder_zoneStartUp__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = v3;
    uint64_t v8 = (void *)MEMORY[0x1D944CB30]();
    id v9 = v6;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting up zone rebuilder", buf, 0xCu);
    }
    uint64_t v12 = [v9 cloudZone];
    uint64_t v13 = [v12 localZone];
    uint64_t v14 = +[HMBCloudZoneRebuilderModel sentinelUUID];
    id v37 = 0;
    id v15 = [v13 fetchModelWithModelID:v14 ofType:objc_opt_class() error:&v37];
    id v16 = v37;

    if (v15)
    {
      uint64_t v17 = (void *)MEMORY[0x1D944CB30]();
      id v18 = v9;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_INFO, "%{public}@Found existing sentinel model: %@", buf, 0x16u);
      }
      __processSentinelModel(v18, v15);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = [v7 completionHandlerAdapter];
      id v23 = (id)[v21 addCompletionBlock:v22];
    }
    else
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F7A0E8]);
      __pushSentinelModel(v9, 1, v21);
      id v28 = [v21 future];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ____startUp_block_invoke;
      v39 = &unk_1E69EA030;
      id v29 = v9;
      id v40 = v29;
      id v30 = v7;
      id v41 = v30;
      id v31 = (id)[v28 addSuccessBlock:buf];

      __int16 v32 = [v21 future];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = ____startUp_block_invoke_248;
      v34[3] = &unk_1E69EABF0;
      id v35 = v29;
      id v36 = v30;
      id v33 = (id)[v32 addFailureBlock:v34];

      id v22 = v40;
    }
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_ERROR, "%{public}@Lost self while starting up rebuild machine.", buf, 0xCu);
    }
    int v27 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    [v3 finishWithError:v27];
  }
}

- (HMBPrivateCloudZoneRebuilder)initWithCloudZone:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMBPrivateCloudZoneRebuilder;
  uint64_t v5 = [(HMBPrivateCloudZoneRebuilder *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cloudZone, v4);
    id v7 = [[HMBCloudZoneRebuilderStatus alloc] initWithState:0 message:@"Rebuilder has not been started up yet."];
    rebuilderStatus = v6->_rebuilderStatus;
    v6->_rebuilderStatus = v7;

    id v9 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    rebuildCompleteFuture = v6->_rebuildCompleteFuture;
    v6->_rebuildCompleteFuture = v9;
  }
  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t71 != -1) {
    dispatch_once(&logCategory__hmf_once_t71, &__block_literal_global_2652);
  }
  v2 = (void *)logCategory__hmf_once_v72;
  return v2;
}

uint64_t __43__HMBPrivateCloudZoneRebuilder_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v72;
  logCategory__hmf_once_v72 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end