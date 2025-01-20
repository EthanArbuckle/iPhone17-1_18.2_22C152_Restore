@interface HMDCameraProfileSettingsQuotaCoordinator
+ (id)clientErrorFromCanUpdateAccessModeError:(id)a3;
+ (id)logCategory;
- (BOOL)_requiresDisablingCloudStorageForAccessMode:(unint64_t)a3 cameraHomePresence:(unint64_t)a4;
- (BOOL)_requiresEnablingCloudStorageForAccessMode:(unint64_t)a3;
- (HMDCameraClipsQuotaManager)quotaManager;
- (HMDCameraProfileSettingsQuotaCoordinator)initWithWorkQueue:(id)a3 accessory:(id)a4;
- (HMDCameraProfileSettingsQuotaCoordinator)initWithWorkQueue:(id)a3 accessory:(id)a4 quotaManager:(id)a5;
- (HMDCameraProfileSettingsQuotaCoordinatorDelegate)delegate;
- (HMDHAPAccessory)accessory;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)workQueue;
- (id)cameraClipsZoneName;
- (id)logIdentifier;
- (void)_disableRecordingAccessModesWithCompletion:(id)a3;
- (void)_performOperationWithBlock:(id)a3;
- (void)_synchronizeCloudStorageWithCurrentCamerasWithCompletion:(id)a3;
- (void)_synchronizeCloudStorageWithRecordingAccessModesWithCompletion:(id)a3;
- (void)_updateCloudStorageAndSettingsWithAccessMode:(unint64_t)a3 forCameraHomePresence:(unint64_t)a4 completion:(id)a5;
- (void)disableRecordingAccessModes;
- (void)setAccessory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)synchronizeCloudStorageWithRecordingAccessModes;
- (void)updateCloudStorageAndSettingsWithAccessMode:(unint64_t)a3 forCameraHomePresence:(unint64_t)a4 completion:(id)a5;
@end

@implementation HMDCameraProfileSettingsQuotaCoordinator

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_quotaManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAccessory:(id)a3
{
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDCameraClipsQuotaManager)quotaManager
{
  return (HMDCameraClipsQuotaManager *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraProfileSettingsQuotaCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraProfileSettingsQuotaCoordinatorDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraProfileSettingsQuotaCoordinator *)self accessory];
  v3 = [v2 logIdentifier];

  return v3;
}

- (void)_disableRecordingAccessModesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraProfileSettingsQuotaCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDCameraProfileSettingsQuotaCoordinator *)self delegate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__HMDCameraProfileSettingsQuotaCoordinator__disableRecordingAccessModesWithCompletion___block_invoke;
  v7[3] = &unk_1E6A0BE68;
  v7[4] = self;
  [v6 updateSettingsModelUsingBlock:v7 completion:v4];
}

void __87__HMDCameraProfileSettingsQuotaCoordinator__disableRecordingAccessModesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    [v3 accessModeAtHome];
    v8 = HMCameraAccessModeAsString();
    [v3 accessModeNotAtHome];
    v9 = HMCameraAccessModeAsString();
    int v20 = 138543874;
    v21 = v7;
    __int16 v22 = 2112;
    v23 = v8;
    __int16 v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Asked to disable recording access modes given current accessModeAtHome: %@ accessModeNotAtHome: %@", (uint8_t *)&v20, 0x20u);
  }
  [v3 accessModeAtHome];
  if (HMIsRecordingAllowedForCameraAccessMode())
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      [v3 accessModeAtHome];
      v14 = HMCameraAccessModeAsString();
      int v20 = 138543618;
      v21 = v13;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Disabling recording access modes by updating at home access mode to %@", (uint8_t *)&v20, 0x16u);
    }
    [v3 setAccessModeAtHome:1];
  }
  [v3 accessModeNotAtHome];
  if (HMIsRecordingAllowedForCameraAccessMode())
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = *(id *)(a1 + 32);
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      [v3 accessModeNotAtHome];
      v19 = HMCameraAccessModeAsString();
      int v20 = 138543618;
      v21 = v18;
      __int16 v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Disabling recording access modes by updating not at home access mode to %@", (uint8_t *)&v20, 0x16u);
    }
    [v3 setAccessModeNotAtHome:1];
  }
}

- (void)_synchronizeCloudStorageWithCurrentCamerasWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsQuotaCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v32 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Synchronizing cloud storage with current cameras", buf, 0xCu);
  }
  v10 = [(HMDCameraProfileSettingsQuotaCoordinator *)v7 accessory];
  id v11 = [v10 home];
  v12 = [v11 homeManager];

  if (v12)
  {
    v13 = [(HMDCameraProfileSettingsQuotaCoordinator *)v7 quotaManager];
    v14 = [v13 fetchNamesForZonesWithEnabledCloudStorage];
    v15 = (void *)MEMORY[0x1E4F7A0F0];
    id v16 = [(HMDCameraProfileSettingsQuotaCoordinator *)v7 workQueue];
    v17 = [v15 schedulerWithDispatchQueue:v16];
    v18 = [v14 reschedule:v17];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __101__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithCurrentCamerasWithCompletion___block_invoke;
    v28[3] = &unk_1E6A138F8;
    v28[4] = v7;
    id v29 = v12;
    id v19 = v4;
    id v30 = v19;
    int v20 = [v18 addSuccessBlock:v28];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __101__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithCurrentCamerasWithCompletion___block_invoke_21;
    v26[3] = &unk_1E6A17D78;
    v26[4] = v7;
    id v27 = v19;
    id v21 = (id)[v20 addFailureBlock:v26];
  }
  else
  {
    __int16 v22 = (void *)MEMORY[0x1D9452090]();
    v23 = v7;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Asked to synchronize cloud storage with current cameras but home manager reference is nil", buf, 0xCu);
    }
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __101__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithCurrentCamerasWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v74 = v7;
    __int16 v75 = 2112;
    id v76 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Synchronizing cloud storage using enabled cloud storage zone names: %@", buf, 0x16u);
  }
  v43 = v3;

  v8 = [MEMORY[0x1E4F1CA80] set];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v44 = a1;
  obuint64_t j = [*(id *)(a1 + 40) homes];
  uint64_t v47 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v66;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v66 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v48 = v9;
        v10 = *(void **)(*((void *)&v65 + 1) + 8 * v9);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v49 = [v10 hapAccessories];
        uint64_t v11 = [v49 countByEnumeratingWithState:&v61 objects:v71 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v62 != v13) {
                objc_enumerationMutation(v49);
              }
              v15 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              long long v57 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              id v16 = [v15 cameraProfiles];
              uint64_t v17 = [v16 countByEnumeratingWithState:&v57 objects:v70 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v58;
                do
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v58 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    id v21 = [*(id *)(*((void *)&v57 + 1) + 8 * j) clipManager];
                    __int16 v22 = v21;
                    if (v21)
                    {
                      v23 = [v21 zoneName];
                      [v8 addObject:v23];
                    }
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v57 objects:v70 count:16];
                }
                while (v18);
              }
            }
            uint64_t v12 = [v49 countByEnumeratingWithState:&v61 objects:v71 count:16];
          }
          while (v12);
        }

        uint64_t v9 = v48 + 1;
      }
      while (v48 + 1 != v47);
      uint64_t v47 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    }
    while (v47);
  }

  __int16 v24 = [MEMORY[0x1E4F1CA48] array];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v50 = v43;
  uint64_t v25 = [v50 countByEnumeratingWithState:&v53 objects:v69 count:16];
  uint64_t v26 = v44;
  if (v25)
  {
    uint64_t v27 = v25;
    uint64_t v28 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v54 != v28) {
          objc_enumerationMutation(v50);
        }
        id v30 = *(void **)(*((void *)&v53 + 1) + 8 * k);
        if (([v8 containsObject:v30] & 1) == 0)
        {
          v31 = (void *)MEMORY[0x1D9452090]();
          id v32 = *(id *)(v26 + 32);
          uint64_t v33 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v74 = v34;
            __int16 v75 = 2112;
            id v76 = v30;
            _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Disabling cloud storage for unknown zone name: %@", buf, 0x16u);
          }
          uint64_t v26 = v44;
          v35 = [*(id *)(v44 + 32) quotaManager];
          v36 = [v35 disableCloudStorageForZoneWithName:v30];
          [v24 addObject:v36];
        }
      }
      uint64_t v27 = [v50 countByEnumeratingWithState:&v53 objects:v69 count:16];
    }
    while (v27);
  }

  if ([v24 count])
  {
    v37 = [MEMORY[0x1E4F7A0D8] chainFutures:v24];
    v38 = (void *)MEMORY[0x1E4F7A0F0];
    v39 = [*(id *)(v26 + 32) workQueue];
    v40 = [v38 schedulerWithDispatchQueue:v39];
    v41 = [v37 reschedule:v40];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __101__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithCurrentCamerasWithCompletion___block_invoke_19;
    v51[3] = &unk_1E6A10068;
    v51[4] = *(void *)(v26 + 32);
    id v52 = *(id *)(v26 + 48);
    id v42 = (id)[v41 addCompletionBlock:v51];
  }
  else
  {
    (*(void (**)(void))(*(void *)(v26 + 48) + 16))();
  }
}

void __101__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithCurrentCamerasWithCompletion___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch names for zones with enabled cloud storage: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __101__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithCurrentCamerasWithCompletion___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  __int16 v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully disabled cloud storage while synchronizing with current cameras", (uint8_t *)&v13, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v12;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to disable cloud storage while synchronizing with current cameras: %@", (uint8_t *)&v13, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_synchronizeCloudStorageWithRecordingAccessModesWithCompletion:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsQuotaCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v45 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Synchronizing cloud storage with recording access modes", buf, 0xCu);
  }
  __int16 v10 = [(HMDCameraProfileSettingsQuotaCoordinator *)v7 cameraClipsZoneName];
  if (v10)
  {
    id v11 = [(HMDCameraProfileSettingsQuotaCoordinator *)v7 delegate];
    uint64_t v12 = [v11 currentSettings];

    [v12 accessModeAtHome];
    char v13 = HMIsRecordingAllowedForCameraAccessMode();
    [v12 accessModeNotAtHome];
    int v14 = HMIsRecordingAllowedForCameraAccessMode();
    __int16 v15 = [(HMDCameraProfileSettingsQuotaCoordinator *)v7 quotaManager];
    id v35 = v4;
    if ((v13 & 1) != 0 || v14)
    {
      id v16 = v15;
      uint64_t v17 = [v15 enableCloudStorageForZoneWithName:v10];
      id v30 = (void *)MEMORY[0x1E4F7A0F0];
      uint64_t v19 = [(HMDCameraProfileSettingsQuotaCoordinator *)v7 workQueue];
      int v20 = [v30 schedulerWithDispatchQueue:v19];
      id v21 = [v17 reschedule:v20];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __107__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithRecordingAccessModesWithCompletion___block_invoke;
      v42[3] = &unk_1E6A0BE40;
      v42[4] = v7;
      uint64_t v33 = &v43;
      id v31 = v4;
      id v43 = v31;
      v23 = [v21 addSuccessBlock:v42];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __107__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithRecordingAccessModesWithCompletion___block_invoke_13;
      v40[3] = &unk_1E6A17D78;
      v40[4] = v7;
      __int16 v24 = &v41;
      id v41 = v31;
      uint64_t v25 = v40;
    }
    else
    {
      id v16 = v15;
      uint64_t v17 = [v15 disableCloudStorageForZoneWithName:v10];
      uint64_t v18 = (void *)MEMORY[0x1E4F7A0F0];
      uint64_t v19 = [(HMDCameraProfileSettingsQuotaCoordinator *)v7 workQueue];
      int v20 = [v18 schedulerWithDispatchQueue:v19];
      id v21 = [v17 reschedule:v20];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __107__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithRecordingAccessModesWithCompletion___block_invoke_14;
      v38[3] = &unk_1E6A0BE40;
      v38[4] = v7;
      uint64_t v33 = &v39;
      id v22 = v4;
      id v39 = v22;
      v23 = [v21 addSuccessBlock:v38];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __107__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithRecordingAccessModesWithCompletion___block_invoke_15;
      v36[3] = &unk_1E6A17D78;
      v36[4] = v7;
      __int16 v24 = &v37;
      id v37 = v22;
      uint64_t v25 = v36;
    }
    id v32 = (id)objc_msgSend(v23, "addFailureBlock:", v25, v33);

    id v4 = v35;
  }
  else
  {
    uint64_t v26 = (void *)MEMORY[0x1D9452090]();
    uint64_t v27 = v7;
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v45 = v29;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not determine camera clips zone name for synchronizing cloud storage with recording access modes", buf, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
  }
}

void __107__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithRecordingAccessModesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully enabled recording while synchronizing cloud storage", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __107__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithRecordingAccessModesWithCompletion___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [(id)objc_opt_class() clientErrorFromCanUpdateAccessModeError:v3];
  uint64_t v5 = [v4 code];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  int v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v5 == 2006)
  {
    if (v9)
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      char v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable recording while synchronizing cloud storage due to quota exceeded error: %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 32) _disableRecordingAccessModesWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    if (v9)
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      char v13 = v11;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable recording while synchronizing cloud storage: %@", (uint8_t *)&v12, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __107__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithRecordingAccessModesWithCompletion___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    BOOL v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully disabled recording while synchronizing cloud storage", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __107__HMDCameraProfileSettingsQuotaCoordinator__synchronizeCloudStorageWithRecordingAccessModesWithCompletion___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    BOOL v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to disable recording while synchronizing cloud storage: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_requiresEnablingCloudStorageForAccessMode:(unint64_t)a3
{
  id v4 = [(HMDCameraProfileSettingsQuotaCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v4);

  if (HMIsRecordingAllowedForCameraAccessMode())
  {
    id v5 = [(HMDCameraProfileSettingsQuotaCoordinator *)self delegate];
    id v6 = [v5 currentSettings];

    [v6 accessModeAtHome];
    if (HMIsRecordingAllowedForCameraAccessMode())
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      [v6 accessModeNotAtHome];
      int v7 = HMIsRecordingAllowedForCameraAccessMode() ^ 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_performOperationWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsQuotaCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(MEMORY[0x1E4F65400]);
  objc_initWeak(&location, v6);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __71__HMDCameraProfileSettingsQuotaCoordinator__performOperationWithBlock___block_invoke;
  uint64_t v12 = &unk_1E6A10B58;
  objc_copyWeak(&v15, &location);
  char v13 = self;
  id v7 = v4;
  id v14 = v7;
  [v6 addExecutionBlock:&v9];
  int v8 = [(HMDCameraProfileSettingsQuotaCoordinator *)self operationQueue];
  [v8 addOperation:v6];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __71__HMDCameraProfileSettingsQuotaCoordinator__performOperationWithBlock___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = [a1[4] workQueue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __71__HMDCameraProfileSettingsQuotaCoordinator__performOperationWithBlock___block_invoke_2;
    v4[3] = &unk_1E6A19530;
    id v6 = a1[5];
    id v5 = WeakRetained;
    dispatch_async(v3, v4);
  }
}

void __71__HMDCameraProfileSettingsQuotaCoordinator__performOperationWithBlock___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __71__HMDCameraProfileSettingsQuotaCoordinator__performOperationWithBlock___block_invoke_3;
  v2[3] = &unk_1E6A197F0;
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t __71__HMDCameraProfileSettingsQuotaCoordinator__performOperationWithBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 cancelWithError:a2];
  }
  else {
    return [v2 finish];
  }
}

- (id)cameraClipsZoneName
{
  v2 = [(HMDCameraProfileSettingsQuotaCoordinator *)self accessory];
  id v3 = [v2 cameraProfiles];
  id v4 = [v3 anyObject];
  id v5 = [v4 clipManager];
  id v6 = [v5 zoneName];

  return v6;
}

- (void)disableRecordingAccessModes
{
  id v3 = [(HMDCameraProfileSettingsQuotaCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__HMDCameraProfileSettingsQuotaCoordinator_disableRecordingAccessModes__block_invoke;
  v4[3] = &unk_1E6A16FF0;
  void v4[4] = self;
  [(HMDCameraProfileSettingsQuotaCoordinator *)self _performOperationWithBlock:v4];
}

uint64_t __71__HMDCameraProfileSettingsQuotaCoordinator_disableRecordingAccessModes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _disableRecordingAccessModesWithCompletion:a2];
}

- (void)synchronizeCloudStorageWithRecordingAccessModes
{
  id v3 = [(HMDCameraProfileSettingsQuotaCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91__HMDCameraProfileSettingsQuotaCoordinator_synchronizeCloudStorageWithRecordingAccessModes__block_invoke;
  v4[3] = &unk_1E6A16FF0;
  void v4[4] = self;
  [(HMDCameraProfileSettingsQuotaCoordinator *)self _performOperationWithBlock:v4];
}

uint64_t __91__HMDCameraProfileSettingsQuotaCoordinator_synchronizeCloudStorageWithRecordingAccessModes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _synchronizeCloudStorageWithRecordingAccessModesWithCompletion:a2];
}

- (BOOL)_requiresDisablingCloudStorageForAccessMode:(unint64_t)a3 cameraHomePresence:(unint64_t)a4
{
  id v6 = [(HMDCameraProfileSettingsQuotaCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v6);

  if ((HMIsRecordingAllowedForCameraAccessMode() & 1) == 0)
  {
    uint64_t v7 = [(HMDCameraProfileSettingsQuotaCoordinator *)self delegate];
    int v8 = [(id)v7 currentSettings];

    if (a4 == 4)
    {
      [v8 accessModeAtHome];
      if ((HMIsRecordingAllowedForCameraAccessMode() & 1) == 0)
      {
        [v8 accessModeNotAtHome];
        LOBYTE(v7) = HMIsRecordingAllowedForCameraAccessMode();
        goto LABEL_10;
      }
    }
    else
    {
      if (a4 != 3)
      {
LABEL_10:

        return v7 & 1;
      }
      [v8 accessModeAtHome];
      if (HMIsRecordingAllowedForCameraAccessMode())
      {
        [v8 accessModeNotAtHome];
        LOBYTE(v7) = HMIsRecordingAllowedForCameraAccessMode() ^ 1;
        goto LABEL_10;
      }
    }
    LOBYTE(v7) = 0;
    goto LABEL_10;
  }
  LOBYTE(v7) = 0;
  return v7 & 1;
}

- (void)_updateCloudStorageAndSettingsWithAccessMode:(unint64_t)a3 forCameraHomePresence:(unint64_t)a4 completion:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [(HMDCameraProfileSettingsQuotaCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    char v13 = HMFGetLogIdentifier();
    id v14 = HMCameraAccessModeAsString();
    id v15 = HMCameraHomePresenceAsString();
    *(_DWORD *)buf = 138543874;
    uint64_t v47 = v13;
    __int16 v48 = 2112;
    id v49 = v14;
    __int16 v50 = 2112;
    v51 = v15;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating access mode to %@ for cameraHomeState: %@", buf, 0x20u);
  }
  uint64_t v16 = [(HMDCameraProfileSettingsQuotaCoordinator *)v11 cameraClipsZoneName];
  if (v16)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __122__HMDCameraProfileSettingsQuotaCoordinator__updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke;
    aBlock[3] = &unk_1E6A0BE18;
    aBlock[4] = v11;
    id v43 = v8;
    unint64_t v44 = a3;
    unint64_t v45 = a4;
    uint64_t v17 = _Block_copy(aBlock);
    if ([(HMDCameraProfileSettingsQuotaCoordinator *)v11 _requiresEnablingCloudStorageForAccessMode:a3])
    {
      uint64_t v18 = [(HMDCameraProfileSettingsQuotaCoordinator *)v11 quotaManager];
      uint64_t v19 = [v18 enableCloudStorageForZoneWithName:v16];
      int v20 = (void *)MEMORY[0x1E4F7A0F0];
      id v21 = [(HMDCameraProfileSettingsQuotaCoordinator *)v11 workQueue];
      id v22 = [v20 schedulerWithDispatchQueue:v21];
      v23 = [v19 reschedule:v22];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __122__HMDCameraProfileSettingsQuotaCoordinator__updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke_2;
      v40[3] = &unk_1E6A0FA40;
      id v41 = v17;
      id v24 = (id)[v23 addCompletionBlock:v40];

      uint64_t v25 = v41;
    }
    else
    {
      if (![(HMDCameraProfileSettingsQuotaCoordinator *)v11 _requiresDisablingCloudStorageForAccessMode:a3 cameraHomePresence:a4])
      {
        (*((void (**)(void *, void))v17 + 2))(v17, 0);
        goto LABEL_13;
      }
      id v31 = [(HMDCameraProfileSettingsQuotaCoordinator *)v11 quotaManager];
      id v32 = [v31 disableCloudStorageForZoneWithName:v16];
      uint64_t v33 = (void *)MEMORY[0x1E4F7A0F0];
      v34 = [(HMDCameraProfileSettingsQuotaCoordinator *)v11 workQueue];
      id v35 = [v33 schedulerWithDispatchQueue:v34];
      v36 = [v32 reschedule:v35];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __122__HMDCameraProfileSettingsQuotaCoordinator__updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke_3;
      v38[3] = &unk_1E6A0FA40;
      id v39 = v17;
      id v37 = (id)[v36 addCompletionBlock:v38];

      uint64_t v25 = v39;
    }

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v26 = (void *)MEMORY[0x1D9452090]();
  uint64_t v27 = v11;
  uint64_t v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    id v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v47 = v29;
    _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not determine camera clips zone name for updating cloud storage and settings", buf, 0xCu);
  }
  id v30 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*((void (**)(id, void *))v8 + 2))(v8, v30);

LABEL_14:
}

void __122__HMDCameraProfileSettingsQuotaCoordinator__updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = [(id)objc_opt_class() clientErrorFromCanUpdateAccessModeError:v3];
    uint64_t v5 = [v4 code];
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    uint64_t v9 = v8;
    if (v5 == 2006)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v21 = v10;
        __int16 v22 = 2112;
        id v23 = v3;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Synchronizing cloud storage while updating access mode due to quota exceeded error: %@", buf, 0x16u);
      }
      id v11 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __122__HMDCameraProfileSettingsQuotaCoordinator__updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke_4;
      v15[3] = &unk_1E6A0BDD0;
      v15[4] = v11;
      id v16 = v3;
      id v18 = *(id *)(a1 + 40);
      id v4 = v4;
      id v17 = v4;
      long long v19 = *(_OWORD *)(a1 + 48);
      [v11 _synchronizeCloudStorageWithCurrentCamerasWithCompletion:v15];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v21 = v12;
        __int16 v22 = 2114;
        id v23 = v3;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot make access mode change: %{public}@", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __122__HMDCameraProfileSettingsQuotaCoordinator__updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke_6;
    v13[3] = &__block_descriptor_48_e39_v16__0__HMDCameraProfileSettingsModel_8l;
    int8x16_t v14 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    [v4 updateSettingsModelUsingBlock:v13 completion:*(void *)(a1 + 40)];
  }
}

uint64_t __122__HMDCameraProfileSettingsQuotaCoordinator__updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __122__HMDCameraProfileSettingsQuotaCoordinator__updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __122__HMDCameraProfileSettingsQuotaCoordinator__updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke_4(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = HMFGetLogIdentifier();
      int v12 = 138543362;
      char v13 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Retrying updating access mode after disabling cloud storage", (uint8_t *)&v12, 0xCu);
    }
    return [*(id *)(a1 + 32) _updateCloudStorageAndSettingsWithAccessMode:*(void *)(a1 + 64) forCameraHomePresence:*(void *)(a1 + 72) completion:*(void *)(a1 + 56)];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543618;
      char v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable recording while updating access mode due to quota exceeded error: %@", (uint8_t *)&v12, 0x16u);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __122__HMDCameraProfileSettingsQuotaCoordinator__updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 == 4)
  {
    id v5 = v3;
    [v3 setAccessModeNotAtHome:*(void *)(a1 + 40)];
  }
  else
  {
    if (v4 != 3) {
      goto LABEL_6;
    }
    id v5 = v3;
    [v3 setAccessModeAtHome:*(void *)(a1 + 40)];
  }
  id v3 = v5;
LABEL_6:
}

- (void)updateCloudStorageAndSettingsWithAccessMode:(unint64_t)a3 forCameraHomePresence:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(HMDCameraProfileSettingsQuotaCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v9);

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __121__HMDCameraProfileSettingsQuotaCoordinator_updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke;
  v11[3] = &unk_1E6A0BDA8;
  unint64_t v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(HMDCameraProfileSettingsQuotaCoordinator *)self _performOperationWithBlock:v11];
}

void __121__HMDCameraProfileSettingsQuotaCoordinator_updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __121__HMDCameraProfileSettingsQuotaCoordinator_updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke_2;
  v8[3] = &unk_1E6A0BD80;
  id v9 = v3;
  id v6 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v3;
  [v6 _updateCloudStorageAndSettingsWithAccessMode:v4 forCameraHomePresence:v5 completion:v8];
}

void __121__HMDCameraProfileSettingsQuotaCoordinator_updateCloudStorageAndSettingsWithAccessMode_forCameraHomePresence_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (HMDCameraProfileSettingsQuotaCoordinator)initWithWorkQueue:(id)a3 accessory:(id)a4 quotaManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDCameraProfileSettingsQuotaCoordinator;
  id v12 = [(HMDCameraProfileSettingsQuotaCoordinator *)&v17 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_storeWeak((id *)&v13->_accessory, v10);
    objc_storeStrong((id *)&v13->_quotaManager, a5);
    unint64_t v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v13->_operationQueue;
    v13->_operationQueue = v14;

    [(NSOperationQueue *)v13->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v13->_operationQueue setUnderlyingQueue:v13->_workQueue];
  }

  return v13;
}

- (HMDCameraProfileSettingsQuotaCoordinator)initWithWorkQueue:(id)a3 accessory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HMDCameraClipsQuotaManager defaultManager];
  id v9 = [(HMDCameraProfileSettingsQuotaCoordinator *)self initWithWorkQueue:v7 accessory:v6 quotaManager:v8];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23_55006 != -1) {
    dispatch_once(&logCategory__hmf_once_t23_55006, &__block_literal_global_55007);
  }
  v2 = (void *)logCategory__hmf_once_v24_55008;
  return v2;
}

uint64_t __55__HMDCameraProfileSettingsQuotaCoordinator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v24_55008;
  logCategory__hmf_once_v24_55008 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)clientErrorFromCanUpdateAccessModeError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  char v5 = [v4 isEqualToString:@"HMDCameraClipsQuotaErrorDomain"];

  if (v5)
  {
    uint64_t v6 = [v3 code];
    id v7 = (void *)MEMORY[0x1E4F28C58];
    if (v6 == 1)
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2006];
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
  }
  uint64_t v8 = [v7 hmErrorWithCode:48];
LABEL_6:
  id v9 = (void *)v8;

  return v9;
}

@end