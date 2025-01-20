@interface HMDSharedHomeUpdateHandler
+ (id)logCategory;
- (BOOL)firstFetchComplete;
- (BOOL)isSuspended;
- (BOOL)pendingRequestDataFromResident;
- (HMDHome)home;
- (HMDSharedHomeUpdateSession)pendingRequestDataFromResidentSession;
- (OS_dispatch_queue)workQueue;
- (id)dumpState;
- (id)logIdentifier;
- (void)_evaluateNeedForSync;
- (void)_receivedHomeDataFromSourceVersion:(id)a3 forceUpdateVersion:(BOOL)a4 completion:(id)a5;
- (void)configureWithHome:(id)a3;
- (void)didCompleteHomeUpdateSession:(id)a3 withError:(id)a4;
- (void)handleHomeCloudZoneReadyNotification:(id)a3;
- (void)pause;
- (void)receivedHomeDataFromSourceVersion:(id)a3 forceUpdateVersion:(BOOL)a4 completion:(id)a5;
- (void)registerForMessages;
- (void)requestHomeDataSync;
- (void)residentsChanged:(id)a3;
- (void)resume;
- (void)setFirstFetchComplete:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setPendingRequestDataFromResident:(BOOL)a3;
- (void)setPendingRequestDataFromResidentSession:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDSharedHomeUpdateHandler

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_73152 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_73152, &__block_literal_global_73153);
  }
  v2 = (void *)logCategory__hmf_once_v1_73154;
  return v2;
}

uint64_t __41__HMDSharedHomeUpdateHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_73154;
  logCategory__hmf_once_v1_73154 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_pendingRequestDataFromResidentSession, 0);
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setFirstFetchComplete:(BOOL)a3
{
  self->_firstFetchComplete = a3;
}

- (BOOL)firstFetchComplete
{
  return self->_firstFetchComplete;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setPendingRequestDataFromResident:(BOOL)a3
{
  self->_pendingRequestDataFromResident = a3;
}

- (id)dumpState
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMDSharedHomeUpdateHandler *)self pendingRequestDataFromResidentSession];
  v5 = [v4 dumpState];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F64E98]];

  v6 = (void *)[v3 copy];
  return v6;
}

- (void)didCompleteHomeUpdateSession:(id)a3 withError:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDSharedHomeUpdateHandler *)self pendingRequestDataFromResidentSession];

  if (v8 == v6)
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543874;
      v14 = v12;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@%@ is complete with error %@, stopping", (uint8_t *)&v13, 0x20u);
    }
    [(HMDSharedHomeUpdateHandler *)v10 setPendingRequestDataFromResidentSession:0];
  }
}

- (HMDSharedHomeUpdateSession)pendingRequestDataFromResidentSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_pendingRequestDataFromResidentSession;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPendingRequestDataFromResidentSession:(id)a3
{
  v4 = (HMDSharedHomeUpdateSession *)a3;
  os_unfair_lock_lock_with_options();
  pendingRequestDataFromResidentSession = self->_pendingRequestDataFromResidentSession;
  self->_pendingRequestDataFromResidentSession = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)pendingRequestDataFromResident
{
  v2 = [(HMDSharedHomeUpdateHandler *)self pendingRequestDataFromResidentSession];

  return v2 != 0;
}

- (void)_receivedHomeDataFromSourceVersion:(id)a3 forceUpdateVersion:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = +[HMDHomeKitVersion currentVersion];
  if (([v8 isEqualToVersion:v10] & 1) != 0
    || [v8 isGreaterThanVersion:v10])
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v36 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Remote version is greater than or equal to local version", buf, 0xCu);
    }
    __int16 v15 = v10;
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    id v16 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v36 = v17;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Remote version is less than local version", buf, 0xCu);
    }
    __int16 v15 = v8;
  }

  id v18 = v15;
  uint64_t v19 = [(HMDSharedHomeUpdateHandler *)self home];
  v20 = [v19 sharedHomeSourceVersion];
  if (v20
    && ([v18 isGreaterThanVersion:v20] & 1) == 0
    && ([v18 isEqualToVersion:v20] || !v6))
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v32;
      __int16 v37 = 2112;
      id v38 = v18;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Leaving shared home source version to %@", buf, 0x16u);
    }
    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1D9452090]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v24;
      __int16 v37 = 2112;
      id v38 = v18;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating shared home source version to %@", buf, 0x16u);
    }
    v25 = [v19 emptyModelObjectWithChangeType:2];
    [v25 setSharedHomeSourceVersion:v18];
    v26 = [v19 backingStore];
    v27 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    v28 = [v26 transaction:@"Update Shared Home Source Version" options:v27];

    [v28 add:v25 withMessage:0];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __95__HMDSharedHomeUpdateHandler__receivedHomeDataFromSourceVersion_forceUpdateVersion_completion___block_invoke;
    v33[3] = &unk_1E6A19358;
    id v34 = v9;
    [v28 run:v33];
  }
}

uint64_t __95__HMDSharedHomeUpdateHandler__receivedHomeDataFromSourceVersion_forceUpdateVersion_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, a2);
  }
  return result;
}

- (void)receivedHomeDataFromSourceVersion:(id)a3 forceUpdateVersion:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(HMDSharedHomeUpdateHandler *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__HMDSharedHomeUpdateHandler_receivedHomeDataFromSourceVersion_forceUpdateVersion_completion___block_invoke;
  v13[3] = &unk_1E6A16328;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __94__HMDSharedHomeUpdateHandler_receivedHomeDataFromSourceVersion_forceUpdateVersion_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receivedHomeDataFromSourceVersion:*(void *)(a1 + 40) forceUpdateVersion:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)_evaluateNeedForSync
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDSharedHomeUpdateHandler *)self pendingRequestDataFromResidentSession];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D9452090]();
    v5 = self;
    BOOL v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v37 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Sync session already running", buf, 0xCu);
    }
  }
  else
  {
    id v8 = [(HMDSharedHomeUpdateHandler *)self home];
    id v9 = +[HMDHomeKitVersion currentVersion];
    v10 = [v8 sharedHomeSourceVersion];
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v37 = v14;
      __int16 v38 = 2112;
      uint64_t v39 = v10;
      __int16 v40 = 2112;
      v41 = v9;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Current source version %@, device version is %@", buf, 0x20u);
    }
    if ([v9 isGreaterThanVersion:v10])
    {
      if ([(HMDSharedHomeUpdateHandler *)v12 firstFetchComplete])
      {
        id v15 = [v8 currentUser];
        BOOL v16 = (void *)MEMORY[0x1D9452090]();
        __int16 v17 = v12;
        id v18 = HMFGetOSLogHandle();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        if (v15)
        {
          if (v19)
          {
            v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            __int16 v37 = v20;
            _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Pending request is set to YES, starting request for data sync", buf, 0xCu);
          }
          v21 = objc_msgSend(v15, "pairingUsername", @"pairingUsername");
          v35 = v21;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];

          v23 = [HMDSharedHomeUpdateSession alloc];
          v24 = [(HMDSharedHomeUpdateHandler *)v17 workQueue];
          v25 = [v8 homeManager];
          v26 = [v25 messageDispatcher];
          v27 = [(HMDSharedHomeUpdateSession *)v23 initWithHome:v8 delegate:v17 workQueue:v24 messagePayload:v22 messageDispatcher:v26];
          [(HMDSharedHomeUpdateHandler *)v17 setPendingRequestDataFromResidentSession:v27];

          v28 = [(HMDSharedHomeUpdateHandler *)v17 pendingRequestDataFromResidentSession];
          [v28 requestDataSync];
        }
        else
        {
          if (v19)
          {
            v33 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            __int16 v37 = v33;
            _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Current user is nil, cannot continue", buf, 0xCu);
          }
        }
      }
      else
      {
        v29 = (void *)MEMORY[0x1D9452090]();
        v30 = v12;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v37 = v32;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Waiting for first fetch to complete", buf, 0xCu);
        }
      }
    }
  }
}

- (void)requestHomeDataSync
{
  v3 = [(HMDSharedHomeUpdateHandler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HMDSharedHomeUpdateHandler_requestHomeDataSync__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __49__HMDSharedHomeUpdateHandler_requestHomeDataSync__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Received sync request", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _evaluateNeedForSync];
}

- (void)handleHomeCloudZoneReadyNotification:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSharedHomeUpdateHandler *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HMDSharedHomeUpdateHandler_handleHomeCloudZoneReadyNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__HMDSharedHomeUpdateHandler_handleHomeCloudZoneReadyNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = objc_msgSend(v2, "hmf_UUIDForKey:", @"HMDCR.id");

  id v4 = [*(id *)(a1 + 40) home];
  v5 = [v4 zoneID];
  int v6 = HMFEqualObjects();

  if (v6)
  {
    int v7 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 40) setFirstFetchComplete:1]);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received home data zone ready notification", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 40) _evaluateNeedForSync];
  }
}

- (void)residentsChanged:(id)a3
{
  id v4 = [(HMDSharedHomeUpdateHandler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HMDSharedHomeUpdateHandler_residentsChanged___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __47__HMDSharedHomeUpdateHandler_residentsChanged___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isSuspended];
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      int v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Ignoring resident changed/updated notifications during home merge", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Received residents changed/updated notification", (uint8_t *)&v9, 0xCu);
    }
    [*(id *)(a1 + 32) _evaluateNeedForSync];
  }
}

- (void)resume
{
  id v3 = [(HMDSharedHomeUpdateHandler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__HMDSharedHomeUpdateHandler_resume__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __36__HMDSharedHomeUpdateHandler_resume__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    BOOL v6 = [*(id *)(a1 + 32) home];
    int v7 = [v6 name];
    int v9 = 138543618;
    v10 = v5;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Resuming update handler for home %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) setSuspended:0];
  return [*(id *)(a1 + 32) _evaluateNeedForSync];
}

- (void)pause
{
  id v3 = [(HMDSharedHomeUpdateHandler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HMDSharedHomeUpdateHandler_pause__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __35__HMDSharedHomeUpdateHandler_pause__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    BOOL v6 = [*(id *)(a1 + 32) home];
    int v7 = [v6 name];
    int v9 = 138543618;
    v10 = v5;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Pausing update handler for home %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) setSuspended:1];
  return [*(id *)(a1 + 32) setPendingRequestDataFromResidentSession:0];
}

- (id)logIdentifier
{
  int v2 = [(HMDSharedHomeUpdateHandler *)self home];
  id v3 = NSString;
  id v4 = [v2 name];
  v5 = [v2 uuid];
  BOOL v6 = [v5 UUIDString];
  int v7 = [v3 stringWithFormat:@"%@/%@", v4, v6];

  return v7;
}

- (void)registerForMessages
{
  id v3 = [(HMDSharedHomeUpdateHandler *)self home];
  id v6 = [v3 residentDeviceManager];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_residentsChanged_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:v6];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_handleHomeCloudZoneReadyNotification_ name:@"HMDCloudZoneReadyNotification" object:0];
}

- (void)configureWithHome:(id)a3
{
  id obj = a3;
  id v4 = [obj workQueue];
  workQueue = self->_workQueue;
  self->_workQueue = v4;

  objc_storeWeak((id *)&self->_home, obj);
}

@end