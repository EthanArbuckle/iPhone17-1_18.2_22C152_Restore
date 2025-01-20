@interface HMDMediaDestinationBackingStoreHandler
+ (id)backingStoreObjectForMediaDestination:(id)a3;
+ (id)logCategory;
- (HMDMediaDestinationBackingStoreHandler)initWithDestination:(id)a3 backingStore:(id)a4 metricsDispatcher:(id)a5 delegate:(id)a6;
- (HMDMediaDestinationBackingStoreHandlerDelegate)delegate;
- (HMDMediaDestinationManagerMetricsDispatcher)metricsDispatcher;
- (HMMediaDestination)destination;
- (void)mergeDestination:(id)a3;
- (void)migrateWithCurrentCloudRecord:(id)a3 home:(id)a4 cloudZone:(id)a5 migrationQueue:(id)a6 completion:(id)a7;
- (void)migrateWithHome:(id)a3 cloudZone:(id)a4 migrationQueue:(id)a5 completion:(id)a6;
- (void)recoverDueToInvalidRecordInCloudWithHome:(id)a3 migrationQueue:(id)a4 completion:(id)a5;
- (void)recoverDueToNoRecordInCloudWithHome:(id)a3 migrationQueue:(id)a4 completion:(id)a5;
- (void)setAudioGroupIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSupportedOptions:(unint64_t)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)updateAudioGroupIdentifier:(id)a3 completion:(id)a4;
- (void)updateSupportedOptions:(unint64_t)a3 completion:(id)a4;
@end

@implementation HMDMediaDestinationBackingStoreHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (HMDMediaDestinationManagerMetricsDispatcher)metricsDispatcher
{
  return (HMDMediaDestinationManagerMetricsDispatcher *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaDestinationBackingStoreHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaDestinationBackingStoreHandlerDelegate *)WeakRetained;
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove unknown transaction object: %@", (uint8_t *)&v13, 0x16u);
  }
  v12 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
  [v7 respondWithError:v12];
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v48 = v14;
    __int16 v49 = 2112;
    id v50 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction object updated with new object: %@", buf, 0x16u);
  }
  if (isFeatureHomeTheaterQFAEnabledForTests
    && [(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
  {
    __int16 v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = v12;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v48 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Skipping due to Home Theater QFA enabled", buf, 0xCu);
    }
  }
  else
  {
    id v19 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    if (v21)
    {
      v22 = [(HMDMediaDestinationBackingStoreHandler *)v12 destination];
      v23 = v22;
      if (v22
        && ([v22 uniqueIdentifier],
            v24 = objc_claimAutoreleasedReturnValue(),
            [v21 uuid],
            v25 = objc_claimAutoreleasedReturnValue(),
            char v26 = objc_msgSend(v24, "hmf_isEqualToUUID:", v25),
            v25,
            v24,
            (v26 & 1) == 0))
      {
        v42 = (void *)MEMORY[0x1D9452090]();
        v43 = v12;
        v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v48 = v45;
          __int16 v49 = 2112;
          id v50 = v21;
          _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio destination with unrecongnized model: %@", buf, 0x16u);
        }
      }
      else
      {
        v27 = [v21 setProperties];
        if ([v27 containsObject:@"supportedOptions"])
        {
          v28 = [v21 supportedOptions];
          -[HMDMediaDestinationBackingStoreHandler setSupportedOptions:](v12, "setSupportedOptions:", [v28 unsignedIntegerValue]);
        }
        if ([v27 containsObject:@"audioGroupIdentifier"])
        {
          v29 = [v21 audioGroupIdentifier];
          [(HMDMediaDestinationBackingStoreHandler *)v12 setAudioGroupIdentifier:v29];
        }
        v30 = [(HMDMediaDestinationBackingStoreHandler *)v12 destination];
        if ((HMFEqualObjects() & 1) == 0)
        {
          id v46 = v8;
          v31 = (void *)MEMORY[0x1D9452090]();
          v32 = v12;
          v33 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v48 = v34;
            __int16 v49 = 2112;
            id v50 = v23;
            __int16 v51 = 2112;
            v52 = v30;
            _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Updated audio destination: %@ new audio destination: %@", buf, 0x20u);
          }
          v35 = [v10 transactionResult];
          [v35 markChanged];

          v36 = [v10 transactionResult];
          [v36 markSaveToAssistant];

          v37 = [(HMDMediaDestinationBackingStoreHandler *)v32 delegate];
          [v37 mediaDestinationBackingStoreHandler:v32 didUpdateDestination:v30];

          id v8 = v46;
        }
        [v10 respondWithSuccess];
      }
    }
    else
    {
      v38 = (void *)MEMORY[0x1D9452090]();
      v39 = v12;
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v48 = v41;
        __int16 v49 = 2112;
        id v50 = v19;
        _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to process unknown transaction object: %@", buf, 0x16u);
      }
      v23 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      [v10 respondWithError:v23];
    }
  }
}

- (void)setAudioGroupIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(HMMutableMediaDestination *)self->_destination setAudioGroupIdentifier:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSupportedOptions:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMMutableMediaDestination *)self->_destination setSupportedOptions:a3];
  os_unfair_lock_unlock(p_lock);
}

- (HMMediaDestination)destination
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(HMMutableMediaDestination *)self->_destination copy];
  os_unfair_lock_unlock(p_lock);
  return (HMMediaDestination *)v4;
}

- (void)recoverDueToInvalidRecordInCloudWithHome:(id)a3 migrationQueue:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v27 = v14;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Recovering cloud data due to invalid cloud record", buf, 0xCu);
  }
  __int16 v15 = [(HMDMediaDestinationBackingStoreHandler *)v12 destination];
  id v16 = [v15 uniqueIdentifier];

  [v8 dropAllChangesWithObjectID:v16];
  uint64_t v17 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
  v18 = [(HMDMediaDestinationBackingStoreHandler *)v12 metricsDispatcher];
  [v18 submitFailureEventWithFailureCode:3 error:v17];

  id v19 = [(HMDMediaDestinationBackingStoreHandler *)v12 destination];
  v20 = +[HMDMediaDestinationBackingStoreHandler backingStoreObjectForMediaDestination:v19];

  [v20 setObjectChangeType:2];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __109__HMDMediaDestinationBackingStoreHandler_recoverDueToInvalidRecordInCloudWithHome_migrationQueue_completion___block_invoke;
  v23[3] = &unk_1E6A19530;
  id v24 = v20;
  id v25 = v10;
  id v21 = v20;
  id v22 = v10;
  dispatch_async(v9, v23);
}

void __109__HMDMediaDestinationBackingStoreHandler_recoverDueToInvalidRecordInCloudWithHome_migrationQueue_completion___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  v3[0] = *(void *)(a1 + 32);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  (*(void (**)(uint64_t, void, void *, void))(v1 + 16))(v1, MEMORY[0x1E4F1CBF0], v2, 0);
}

- (void)migrateWithCurrentCloudRecord:(id)a3 home:(id)a4 cloudZone:(id)a5 migrationQueue:(id)a6 completion:(id)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  __int16 v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v12 extractObjectChange];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  if (v19)
  {
    id v41 = v13;
    v20 = [(HMDMediaDestinationBackingStoreHandler *)self destination];
    id v21 = [v19 supportedOptions];
    uint64_t v22 = [v21 integerValue];
    if (v22 == [v20 supportedOptions])
    {
      v23 = [v19 audioGroupIdentifier];
      [v20 audioGroupIdentifier];
      id v24 = v20;
      id v25 = self;
      id v26 = v19;
      id v27 = v16;
      uint64_t v28 = v15;
      id v29 = v12;
      v31 = id v30 = v14;
      int v40 = HMFEqualObjects();

      id v14 = v30;
      id v12 = v29;
      __int16 v15 = v28;
      id v16 = v27;
      id v19 = v26;
      self = v25;
      v20 = v24;

      if (v40)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __113__HMDMediaDestinationBackingStoreHandler_migrateWithCurrentCloudRecord_home_cloudZone_migrationQueue_completion___block_invoke_2;
        block[3] = &unk_1E6A186E0;
        id v43 = v16;
        dispatch_async(v15, block);

        id v13 = v41;
        goto LABEL_15;
      }
    }
    else
    {
    }
    v36 = (void *)MEMORY[0x1D9452090]();
    v37 = self;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v47 = v39;
      __int16 v48 = 2112;
      id v49 = v19;
      __int16 v50 = 2112;
      __int16 v51 = v20;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Recovering due to miss matched model: %@ destination: %@", buf, 0x20u);
    }
    id v13 = v41;
    [(HMDMediaDestinationBackingStoreHandler *)v37 recoverDueToInvalidRecordInCloudWithHome:v41 migrationQueue:v15 completion:v16];
  }
  else
  {
    v32 = (void *)MEMORY[0x1D9452090]();
    v33 = self;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v47 = v35;
      __int16 v48 = 2112;
      id v49 = v12;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate due to unknown model extracted from record: %@", buf, 0x16u);
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __113__HMDMediaDestinationBackingStoreHandler_migrateWithCurrentCloudRecord_home_cloudZone_migrationQueue_completion___block_invoke;
    v44[3] = &unk_1E6A186E0;
    id v45 = v16;
    dispatch_async(v15, v44);
    v20 = v45;
  }
LABEL_15:
}

uint64_t __113__HMDMediaDestinationBackingStoreHandler_migrateWithCurrentCloudRecord_home_cloudZone_migrationQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __113__HMDMediaDestinationBackingStoreHandler_migrateWithCurrentCloudRecord_home_cloudZone_migrationQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recoverDueToNoRecordInCloudWithHome:(id)a3 migrationQueue:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v23 = v14;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Recovering cloud data due to no record added", buf, 0xCu);
  }
  __int16 v15 = [(HMDMediaDestinationBackingStoreHandler *)v12 destination];
  id v16 = [v15 uniqueIdentifier];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __104__HMDMediaDestinationBackingStoreHandler_recoverDueToNoRecordInCloudWithHome_migrationQueue_completion___block_invoke;
  v19[3] = &unk_1E6A13888;
  v19[4] = v12;
  id v20 = v9;
  id v21 = v10;
  id v17 = v10;
  id v18 = v9;
  [v8 cleanChangesIfNoAddChangeObjectID:v16 completion:v19];
}

void __104__HMDMediaDestinationBackingStoreHandler_recoverDueToNoRecordInCloudWithHome_migrationQueue_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping migration due to add transaction already exists", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__HMDMediaDestinationBackingStoreHandler_recoverDueToNoRecordInCloudWithHome_migrationQueue_completion___block_invoke_20;
    block[3] = &unk_1E6A186E0;
    id v10 = *(NSObject **)(a1 + 40);
    id v22 = *(id *)(a1 + 48);
    dispatch_async(v10, block);
    v11 = v22;
  }
  else
  {
    v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    id v12 = [*(id *)(a1 + 32) metricsDispatcher];
    [v12 submitFailureEventWithFailureCode:2 error:v11];

    id v13 = [*(id *)(a1 + 32) destination];
    id v14 = +[HMDMediaDestinationBackingStoreHandler backingStoreObjectForMediaDestination:v13];

    [v14 setObjectChangeType:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __104__HMDMediaDestinationBackingStoreHandler_recoverDueToNoRecordInCloudWithHome_migrationQueue_completion___block_invoke_2;
    v18[3] = &unk_1E6A19530;
    __int16 v15 = *(NSObject **)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    id v19 = v14;
    id v20 = v16;
    id v17 = v14;
    dispatch_async(v15, v18);
  }
}

uint64_t __104__HMDMediaDestinationBackingStoreHandler_recoverDueToNoRecordInCloudWithHome_migrationQueue_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104__HMDMediaDestinationBackingStoreHandler_recoverDueToNoRecordInCloudWithHome_migrationQueue_completion___block_invoke_2(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  v3[0] = *(void *)(a1 + 32);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  (*(void (**)(uint64_t, void *, void, void))(v1 + 16))(v1, v2, MEMORY[0x1E4F1CBF0], 0);
}

- (void)migrateWithHome:(id)a3 cloudZone:(id)a4 migrationQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDMediaDestinationBackingStoreHandler *)self destination];
  __int16 v15 = [v14 uniqueIdentifier];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__HMDMediaDestinationBackingStoreHandler_migrateWithHome_cloudZone_migrationQueue_completion___block_invoke;
  v20[3] = &unk_1E6A09A68;
  v20[4] = self;
  id v21 = v10;
  id v23 = v11;
  id v24 = v13;
  id v22 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v12;
  id v19 = v10;
  [v16 cloudRecordWithObjectID:v15 completionHandler:v20];
}

uint64_t __94__HMDMediaDestinationBackingStoreHandler_migrateWithHome_cloudZone_migrationQueue_completion___block_invoke(void *a1, uint64_t a2)
{
  v3 = (void *)a1[4];
  if (a2) {
    return [v3 migrateWithCurrentCloudRecord:a2 home:a1[5] cloudZone:a1[7] migrationQueue:a1[6] completion:a1[8]];
  }
  else {
    return [v3 recoverDueToNoRecordInCloudWithHome:a1[5] migrationQueue:a1[6] completion:a1[8]];
  }
}

- (void)updateAudioGroupIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v28 = 138543618;
    id v29 = v11;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating to audio group identifier: %@", (uint8_t *)&v28, 0x16u);
  }
  if (v7)
  {
    id v12 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    id v13 = [(HMDMediaDestinationBackingStoreHandler *)v9 destination];
    id v14 = [v13 audioGroupIdentifier];
    int v15 = objc_msgSend(v6, "hmf_isEqualToUUID:", v14);

    if (v15)
    {
      id v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = v9;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        int v28 = 138543362;
        id v29 = v19;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Attempting forced push due to audio group identifier already updated", (uint8_t *)&v28, 0xCu);
      }
      uint64_t v20 = +[HMDBackingStoreTransactionOptions defaultOutOfSyncOptions];

      id v12 = (void *)v20;
    }
    id v21 = [HMDMediaDestinationModel alloc];
    id v22 = [(HMDMediaDestinationBackingStoreHandler *)v9 destination];
    id v23 = [(HMDMediaDestinationModel *)v21 initWithDestination:v22 changeType:2];

    [(HMDMediaDestinationModel *)v23 setAudioGroupIdentifier:v6];
    [(HMDBackingStoreHandler *)v9 runTransactionWithModel:v23 options:v12 reason:@"UpdateAudioGroupIdentifier" completion:v7];
  }
  else
  {
    id v24 = (void *)MEMORY[0x1D9452090]();
    uint64_t v25 = v9;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      int v28 = 138543362;
      id v29 = v27;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio group identifier due to no completion", (uint8_t *)&v28, 0xCu);
    }
  }
}

- (void)updateSupportedOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a4;
  id v7 = HMMediaDestinationSupportOptionsAsString();
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v27 = v11;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating to supported options: %@", buf, 0x16u);
  }
  if (v6)
  {
    id v12 = [(HMDMediaDestinationBackingStoreHandler *)v9 destination];
    if ([v12 supportedOptions] == a3)
    {
      id v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = v9;
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v27 = v16;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Supported options already updated", buf, 0xCu);
      }
      v6[2](v6, 0);
    }
    else
    {
      id v21 = [NSString stringWithFormat:@"%@:%@", @"UpdateSupportedOptions", v7];
      id v22 = [HMDMediaDestinationModel alloc];
      id v23 = [(HMDMediaDestinationBackingStoreHandler *)v9 destination];
      id v24 = [(HMDMediaDestinationModel *)v22 initWithDestination:v23 changeType:2];

      uint64_t v25 = [NSNumber numberWithUnsignedInteger:a3];
      [(HMDMediaDestinationModel *)v24 setSupportedOptions:v25];

      [(HMDBackingStoreHandler *)v9 runTransactionWithModel:v24 reason:v21 completion:v6];
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = v9;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v27 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to update supported options due to no completion", buf, 0xCu);
    }
  }
}

- (void)mergeDestination:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if ([(HMMutableMediaDestination *)self->_destination isEqual:v4])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v5 = (HMMutableMediaDestination *)[v4 mutableCopy];
    destination = self->_destination;
    self->_destination = v5;

    os_unfair_lock_unlock(&self->_lock);
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Merged destination: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (HMDMediaDestinationBackingStoreHandler)initWithDestination:(id)a3 backingStore:(id)a4 metricsDispatcher:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    uint64_t v20 = (void *)_HMFPreconditionFailure();
    return (HMDMediaDestinationBackingStoreHandler *)+[HMDMediaDestinationBackingStoreHandler logCategory];
  }
  id v14 = v13;
  uint64_t v15 = [v10 uniqueIdentifier];
  v22.receiver = self;
  v22.super_class = (Class)HMDMediaDestinationBackingStoreHandler;
  id v16 = [(HMDBackingStoreHandler *)&v22 initWithIdentifier:v15 backingStore:v11];

  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v14);
    uint64_t v17 = [v10 mutableCopy];
    destination = v16->_destination;
    v16->_destination = (HMMutableMediaDestination *)v17;

    objc_storeStrong((id *)&v16->_metricsDispatcher, a5);
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_37530 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_37530, &__block_literal_global_37531);
  }
  v2 = (void *)logCategory__hmf_once_v25_37532;
  return v2;
}

uint64_t __53__HMDMediaDestinationBackingStoreHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v25_37532;
  logCategory__hmf_once_v25_37532 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)backingStoreObjectForMediaDestination:(id)a3
{
  id v3 = a3;
  id v4 = [[HMDMediaDestinationModel alloc] initWithDestination:v3 changeType:0];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "supportedOptions"));
  [(HMDMediaDestinationModel *)v4 setSupportedOptions:v5];

  id v6 = [v3 audioGroupIdentifier];

  [(HMDMediaDestinationModel *)v4 setAudioGroupIdentifier:v6];
  return v4;
}

@end