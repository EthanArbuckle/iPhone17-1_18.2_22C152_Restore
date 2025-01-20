@interface HMDBackingStore
+ (NSSet)allowedTypes;
+ (NSSet)deeplyProblematicObjectTypes;
+ (NSSet)internalAllowedTypes;
+ (id)_saveToLocalStoreWithReason:(id)a3 homeManager:(id)a4 shouldIncrementGenerationCounter:(BOOL)a5 backingStore:(id)a6;
+ (id)currentDevice;
+ (id)flushBackingStore;
+ (id)logCategory;
+ (id)resetBackingStore;
+ (void)saveToPersistentStoreWithReason:(id)a3 homeManager:(id)a4 shouldIncrementGenerationCounter:(BOOL)a5 backingStore:(id)a6 completionHandler:(id)a7;
+ (void)start;
- (BOOL)isAtomicSaveFeatureEnabled;
- (CKRecordID)root;
- (HMDBackingStore)initWithUUID:(id)a3;
- (HMDBackingStore)initWithUUID:(id)a3 home:(id)a4;
- (HMDBackingStore)initWithUUID:(id)a3 homeManager:(id)a4;
- (HMDBackingStore)initWithUUID:(id)a3 homeManager:(id)a4 home:(id)a5 dataSource:(id)a6;
- (HMDBackingStoreLocal)local;
- (HMDBackingStoreObjectProtocol)delegate;
- (HMDHome)home;
- (HMDHomeManager)homeManager;
- (HMDObjectLookup)lookup;
- (NSString)activeControllerKeyUsername;
- (NSString)description;
- (NSUUID)uuid;
- (id)__fetchWithGroup:(id)a3 uuids:(id)a4 error:(id *)a5;
- (id)_saveHomeDataInOperationWithControllerUserName:(uint64_t)a3 incrementGeneration:(void *)a4 reason:;
- (id)backingStoreOperationQueue;
- (id)createBackingStoreLogAddTransactionOperationWithTransaction:(id)a3;
- (id)createBackingStoreOperation;
- (id)createHomeObjectLookupWithHome:(id)a3;
- (id)dataForPersistentStoreIncrementingGeneration:(BOOL)a3 reason:(id)a4;
- (id)dataSource;
- (id)localBackingStore;
- (id)logIdentifier;
- (id)transaction:(id)a3 options:(id)a4;
- (void)commit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 archiveInline:(BOOL)a6 completionHandler:(id)a7;
- (void)commit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 completionHandler:(id)a6;
- (void)deleteModelObjects:(id)a3 destination:(unint64_t)a4;
- (void)saveToPersistentStoreWithReason:(id)a3 incrementGeneration:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setLocal:(id)a3;
- (void)setLookup:(id)a3;
- (void)setUuid:(id)a3;
- (void)submit:(id)a3;
- (void)submitBlock:(id)a3;
- (void)updateModelObjects:(id)a3 destination:(unint64_t)a4;
@end

@implementation HMDBackingStore

- (id)logIdentifier
{
  v2 = [(HMDBackingStore *)self uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)transaction:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[HMDBackingStoreTransactionBlock alloc] initWithBackingStore:self options:v6 label:v7];

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t36_161880 != -1) {
    dispatch_once(&logCategory__hmf_once_t36_161880, &__block_literal_global_106_161881);
  }
  v2 = (void *)logCategory__hmf_once_v37_161882;
  return v2;
}

- (void)commit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)commit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 archiveInline:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id aBlock = a7;
  if ([v12 committed])
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      v17 = [v12 options];
      *(_DWORD *)buf = 138543618;
      v49 = v16;
      __int16 v50 = 2112;
      v51 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@double-committing a transaction probably indicates a bad state (ignoring this commit) for %@.", buf, 0x16u);
    }
  }
  else
  {
    [v12 setCommitted:1];
    v18 = [v12 objects];
    int v19 = objc_msgSend(v18, "hmf_isEmpty");

    if (v19)
    {
      v20 = (void *)MEMORY[0x1D9452090]();
      v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        v24 = [v12 options];
        *(_DWORD *)buf = 138543618;
        v49 = v23;
        __int16 v50 = 2112;
        v51 = v24;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Rejecting empty transaction: %@", buf, 0x16u);
      }
      v25 = (void (**)(void *, void *))_Block_copy(aBlock);
      if (v25)
      {
        v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        v25[2](v25, v26);
      }
    }
    else
    {
      v27 = -[HMDBackingStore dataSource]((id *)&self->super.super.isa);
      v36 = v27;
      if (v9) {
        [v27 createBackingStoreLogAddTransactionOperationWithTransaction:v12];
      }
      else {
      v28 = [v27 createBackingStoreOperation];
      }
      v29 = objc_msgSend(v12, "objects", v36);
      +[HMDBackingStoreTransactionBlock sort:v29];

      v30 = (void *)MEMORY[0x1D9452090]();
      v31 = self;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = HMFGetLogIdentifier();
        v34 = [v12 options];
        *(_DWORD *)buf = 138543874;
        v49 = v33;
        __int16 v50 = 2114;
        v51 = v28;
        __int16 v52 = 2114;
        v53 = v34;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Submitting operation: %{public}@ (%{public}@)", buf, 0x20u);
      }
      objc_initWeak((id *)buf, v31);
      objc_initWeak(&location, v28);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __67__HMDBackingStore_commit_run_save_archiveInline_completionHandler___block_invoke;
      v39[3] = &unk_1E6A14DF0;
      objc_copyWeak(&v42, &location);
      objc_copyWeak(&v43, (id *)buf);
      id v40 = v12;
      BOOL v44 = v9;
      BOOL v45 = a4;
      id v41 = aBlock;
      BOOL v46 = a6;
      [v28 setResultBlock:v39];
      [v28 setStore:v31];
      v35 = [v37 backingStoreOperationQueue];
      [v35 addOperation:v28];

      objc_destroyWeak(&v43);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lookup, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_local, 0);
  objc_storeStrong((id *)&self->_root, 0);
}

- (void)setDelegate:(id)a3
{
}

- (HMDBackingStoreObjectProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDBackingStoreObjectProtocol *)WeakRetained;
}

- (void)setLookup:(id)a3
{
}

- (HMDObjectLookup)lookup
{
  return self->_lookup;
}

- (void)setUuid:(id)a3
{
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)setLocal:(id)a3
{
}

- (HMDBackingStoreLocal)local
{
  return self->_local;
}

- (CKRecordID)root
{
  return self->_root;
}

- (BOOL)isAtomicSaveFeatureEnabled
{
  return !isWatch();
}

- (NSString)activeControllerKeyUsername
{
  v2 = [MEMORY[0x1E4F5BE48] systemStore];
  v3 = [v2 activeControllerPairingIdentifier];
  v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (id)dataForPersistentStoreIncrementingGeneration:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(HMDBackingStore *)self homeManager];
  v8 = [v7 _dataForPersistentStoreIncrementingGeneration:v4 reason:v6];

  return v8;
}

- (id)createHomeObjectLookupWithHome:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HMDHomeObjectLookup alloc] initWithHome:v3];

  return v4;
}

- (id)backingStoreOperationQueue
{
  v2 = +[HMDBackingStoreSingleton sharedInstance];
  id v3 = [v2 queue];

  return v3;
}

- (id)localBackingStore
{
  v2 = +[HMDBackingStoreSingleton sharedInstance];
  id v3 = [v2 local];

  return v3;
}

- (id)createBackingStoreOperation
{
  v2 = objc_alloc_init(HMDBackingStoreOperation);
  return v2;
}

- (id)createBackingStoreLogAddTransactionOperationWithTransaction:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HMDBackingStoreLogAddTransactionOperation alloc] initWithTransaction:v3];

  return v4;
}

- (id)__fetchWithGroup:(id)a3 uuids:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__161793;
  v26 = __Block_byref_object_dispose__161794;
  id v27 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__HMDBackingStore___fetchWithGroup_uuids_error___block_invoke;
  aBlock[3] = &unk_1E6A14E18;
  v21 = &v22;
  id v11 = v10;
  id v19 = v11;
  id v12 = v8;
  id v20 = v12;
  v13 = _Block_copy(aBlock);
  v14 = [(HMDBackingStore *)self local];
  objc_msgSend(v14, "_fetchRecordsWithGroupID:uuids:callback:", objc_msgSend(v12, "groupID"), v9, v13);

  v15 = (void *)v23[5];
  if (v15)
  {
    if (a5) {
      *a5 = v15;
    }

    id v11 = 0;
  }
  id v16 = v11;

  _Block_object_dispose(&v22, 8);
  return v16;
}

BOOL __48__HMDBackingStore___fetchWithGroup_uuids_error___block_invoke(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (v14)
  {
    uint64_t v16 = *(void *)(a1[6] + 8);
    id v17 = v14;
    v18 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v17;
  }
  else
  {
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v11 error:0];
    v25 = (void *)a1[4];
    id v19 = [HMDBackingStoreCacheFetchRecordResult alloc];
    uint64_t v20 = a1[5];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithCoder:v18];
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v13];
    v23 = [(HMDBackingStoreCacheFetchRecordResult *)v19 initWithGroup:v20 record:v21 data:v12 encoding:a3 uuid:v22];
    [v25 addObject:v23];
  }
  return v15 == 0;
}

- (void)submitBlock:(id)a3
{
  id v4 = a3;
  v5 = [[HMDBackingStoreOperation alloc] initWithResultBlock:v4];

  [(HMDBackingStore *)self submit:v5];
}

- (void)saveToPersistentStoreWithReason:(id)a3 incrementGeneration:(BOOL)a4
{
  BOOL v25 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  v5 = -[HMDBackingStore dataSource]((id *)&self->super.super.isa);
  id v6 = [v5 backingStoreOperationQueue];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = [v6 operations];
  uint64_t v8 = [(HMDBackingStoreSaveToPersistentStore *)v7 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }
        id v14 = v13;

        if (v14
          && ([v14 isExecuting] & 1) == 0
          && ([v14 isFinished] & 1) == 0
          && ([v14 incrementGeneration] | !v25) == 1)
        {
          v18 = (void *)MEMORY[0x1D9452090]();
          id v19 = self;
          uint64_t v20 = HMFGetOSLogHandle();
          id v17 = v24;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v21 = HMFGetLogIdentifier();
            [v14 incrementGeneration];
            uint64_t v22 = HMFBooleanToString();
            v23 = HMFBooleanToString();
            *(_DWORD *)buf = 138544130;
            v31 = v21;
            __int16 v32 = 2112;
            id v33 = v24;
            __int16 v34 = 2112;
            v35 = v22;
            __int16 v36 = 2112;
            v37 = v23;
            _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Not adding operation for %@ - existing saveOperation increments generation %@, current saveOperation increments generation %@", buf, 0x2Au);
          }

          goto LABEL_19;
        }
      }
      uint64_t v9 = [(HMDBackingStoreSaveToPersistentStore *)v7 countByEnumeratingWithState:&v26 objects:v38 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v15 = [HMDBackingStoreSaveToPersistentStore alloc];
  uint64_t v16 = [(HMDBackingStore *)self homeManager];
  id v17 = v24;
  id v7 = [(HMDBackingStoreSaveToPersistentStore *)v15 initWithHomeManager:v16 reason:v24 incrementGeneration:v25];

  [(HMDBackingStoreOperation *)v7 setStore:self];
  [(HMDBackingStoreSaveToPersistentStore *)v7 setQueuePriority:-4];
  [v6 addOperation:v7];
LABEL_19:
}

- (id)dataSource
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 9);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<HMFBackingStore>"];
}

- (void)submit:(id)a3
{
  id v4 = a3;
  [v4 setStore:self];
  -[HMDBackingStore dataSource]((id *)&self->super.super.isa);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v6 backingStoreOperationQueue];
  [v5 addOperation:v4];
}

- (void)deleteModelObjects:(id)a3 destination:(unint64_t)a4
{
}

- (void)updateModelObjects:(id)a3 destination:(unint64_t)a4
{
}

void __67__HMDBackingStore_commit_run_save_archiveInline_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v195 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = v4;
  if (v4)
  {
    v159 = [v4 homeManager];
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = v5;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = [WeakRetained operationUUID];
      *(_DWORD *)buf = 138543618;
      v184 = v9;
      __int16 v185 = 2112;
      v186 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[%@] Starting operation", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "dumpWithVerbosity:prefix:logType:", objc_msgSend(v159, "isDataSyncInProgress") ^ 1, &stru_1F2C9F1A8, 1);
    id v11 = [v7 home];
    v157 = v7;
    id v12 = objc_loadWeakRetained(v7 + 9);
    int v156 = [v12 isAtomicSaveFeatureEnabled];
    if (v156)
    {
      if (!*(unsigned char *)(a1 + 65))
      {
LABEL_114:
        v143 = [WeakRetained operationFinishBlock];
        ((void (**)(void, HMDHomeSaveRequest *))v143)[2](v143, v3);

LABEL_115:
        v144 = (void *)MEMORY[0x1D9452090]();
        v145 = v157;
        v146 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
        {
          v147 = HMFGetLogIdentifier();
          v148 = [WeakRetained operationUUID];
          *(_DWORD *)buf = 138543618;
          v184 = v147;
          __int16 v185 = 2112;
          v186 = v148;
          _os_log_impl(&dword_1D49D5000, v146, OS_LOG_TYPE_INFO, "%{public}@[%@] Finished operation", buf, 0x16u);
        }
        uint64_t v149 = *(void *)(a1 + 40);
        if (v149) {
          (*(void (**)(uint64_t, HMDHomeSaveRequest *))(v149 + 16))(v149, v3);
        }
        uint64_t v18 = (uint64_t)v3;
        goto LABEL_120;
      }
      v155 = [v12 activeControllerKeyUsername];
      if (!v155 && v11)
      {
        id v13 = (void *)MEMORY[0x1D9452090]();
        id v14 = v7;
        v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = HMFGetLogIdentifier();
          id v17 = [WeakRetained operationUUID];
          *(_DWORD *)buf = 138543618;
          v184 = v16;
          __int16 v185 = 2112;
          v186 = v17;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@[%@] No controller found, cannot run transaction again", buf, 0x16u);
        }
        uint64_t v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];

        id v19 = [WeakRetained operationFinishBlock];
        v19[2](v19, v18);

        uint64_t v20 = *(void *)(a1 + 40);
        if (v20) {
          (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, v18);
        }
LABEL_120:

        id v3 = (HMDHomeSaveRequest *)v18;
        goto LABEL_121;
      }
    }
    else
    {
      if (*(unsigned char *)(a1 + 64))
      {
        BOOL v25 = (void *)MEMORY[0x1D9452090]();
        long long v26 = v7;
        long long v27 = HMFGetOSLogHandle();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
        if (v3)
        {
          if (v28)
          {
            long long v29 = HMFGetLogIdentifier();
            v30 = [WeakRetained operationUUID];
            *(_DWORD *)buf = 138543874;
            v184 = v29;
            __int16 v185 = 2112;
            v186 = v30;
            __int16 v187 = 2112;
            v188 = v3;
            _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@[%@] Error occurred during save: %@", buf, 0x20u);
          }
          v31 = [v26 local];
          [v31 _rollback];
        }
        else
        {
          if (v28)
          {
            __int16 v32 = HMFGetLogIdentifier();
            id v33 = [WeakRetained operationUUID];
            *(_DWORD *)buf = 138543618;
            v184 = v32;
            __int16 v185 = 2112;
            v186 = v33;
            _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@[%@] Save complete", buf, 0x16u);
          }
          v31 = [v26 local];
          id v34 = (id)[v31 _commit];
        }
      }
      if (!*(unsigned char *)(a1 + 65)) {
        goto LABEL_115;
      }
      v155 = 0;
    }
    v153 = v5;
    id v154 = v12;
    v150 = v11;
    v152 = v3;
    v35 = (void *)MEMORY[0x1D9452090]();
    __int16 v36 = v157;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = HMFGetLogIdentifier();
      uint64_t v39 = [WeakRetained operationUUID];
      *(_DWORD *)buf = 138543618;
      v184 = v38;
      __int16 v185 = 2112;
      v186 = v39;
      _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@[%@] Running operation", buf, 0x16u);
    }
    id v40 = [HMDBackingStoreTransactionActions alloc];
    id v41 = [*(id *)(a1 + 32) options];
    id v42 = [(HMDBackingStoreTransactionActions *)v40 initWithBackingStore:v36 options:v41];

    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    uint64_t v151 = a1;
    id obj = [*(id *)(a1 + 32) objects];
    id v43 = v159;
    v158 = v42;
    BOOL v44 = v36;
    uint64_t v162 = [obj countByEnumeratingWithState:&v179 objects:v194 count:16];
    if (v162)
    {
      uint64_t v45 = *(void *)v180;
      v166 = v36;
      uint64_t v160 = *(void *)v180;
      do
      {
        uint64_t v46 = 0;
        do
        {
          if (*(void *)v180 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v164 = v46;
          v47 = *(void **)(*((void *)&v179 + 1) + 8 * v46);
          context = (void *)MEMORY[0x1D9452090]();
          v48 = [v44 local];
          v170 = v47;
          v49 = [v47 change];
          __int16 v50 = [v49 uuid];
          id v178 = 0;
          v51 = [v48 _fetchRecordWithUUID:v50 root:0 error:&v178];
          __int16 v52 = (HMDHomeSaveRequest *)v178;

          v165 = v52;
          if (v52)
          {
            v53 = (void *)MEMORY[0x1D9452090]();
            uint64_t v54 = v44;
            v55 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              v56 = HMFGetLogIdentifier();
              v57 = [WeakRetained operationUUID];
              *(_DWORD *)buf = 138543874;
              v184 = v56;
              __int16 v185 = 2112;
              v186 = v57;
              __int16 v187 = 2112;
              v188 = v52;
              _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_ERROR, "%{public}@[%@] Unexpected issue when fetching row from cache: %@", buf, 0x20u);

              uint64_t v45 = v160;
            }

            v58 = v51;
            v51 = 0;
LABEL_37:

LABEL_38:
            v59 = [v44 lookup];
            v171[0] = MEMORY[0x1E4F143A8];
            v171[1] = 3221225472;
            v171[2] = __67__HMDBackingStore_commit_run_save_archiveInline_completionHandler___block_invoke_93;
            v171[3] = &unk_1E6A18BA0;
            v171[4] = v44;
            id v172 = WeakRetained;
            id v173 = v43;
            [v59 lookUpAndApplyObjectChange:v170 previous:v51 result:v42 completionHandler:v171];

            goto LABEL_39;
          }
          if (!v51) {
            goto LABEL_38;
          }
          long long v176 = 0u;
          long long v177 = 0u;
          long long v174 = 0u;
          long long v175 = 0u;
          v60 = [v170 change];
          v58 = [v60 setProperties];

          uint64_t v61 = [v58 countByEnumeratingWithState:&v174 objects:v193 count:16];
          if (!v61)
          {
            id v42 = v158;
            id v43 = v159;
            goto LABEL_37;
          }
          uint64_t v62 = v61;
          char v63 = 0;
          uint64_t v64 = *(void *)v175;
          uint64_t v167 = *(void *)v175;
          v168 = v58;
          do
          {
            for (uint64_t i = 0; i != v62; ++i)
            {
              if (*(void *)v175 != v64) {
                objc_enumerationMutation(v58);
              }
              v66 = *(HMDHomeSaveRequest **)(*((void *)&v174 + 1) + 8 * i);
              if ([v51 propertyIsReadOnly:v66])
              {
                v67 = (void *)MEMORY[0x1D9452090]();
                v68 = v44;
                v69 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                {
                  v70 = HMFGetLogIdentifier();
                  v71 = [WeakRetained operationUUID];
                  v72 = [v170 change];
                  *(_DWORD *)buf = 138544386;
                  v184 = v70;
                  __int16 v185 = 2112;
                  v186 = v71;
                  __int16 v187 = 2112;
                  v188 = v66;
                  __int16 v189 = 2112;
                  v190 = v72;
                  __int16 v191 = 2112;
                  v192 = v51;
                  _os_log_impl(&dword_1D49D5000, v69, OS_LOG_TYPE_ERROR, "%{public}@[%@] Attempting to set field %@ on %@ (now read-only in %@)", buf, 0x34u);

                  uint64_t v64 = v167;
                  BOOL v44 = v166;

                  v58 = v168;
                }

                char v63 = 1;
              }
              if (([v51 propertyIsAvailable:v66] & 1) == 0)
              {
                v73 = (void *)MEMORY[0x1D9452090]();
                v74 = v44;
                v75 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                {
                  v76 = HMFGetLogIdentifier();
                  v77 = [WeakRetained operationUUID];
                  v78 = [v170 change];
                  *(_DWORD *)buf = 138544386;
                  v184 = v76;
                  __int16 v185 = 2112;
                  v186 = v77;
                  __int16 v187 = 2112;
                  v188 = v66;
                  __int16 v189 = 2112;
                  v190 = v78;
                  __int16 v191 = 2112;
                  v192 = v51;
                  _os_log_impl(&dword_1D49D5000, v75, OS_LOG_TYPE_ERROR, "%{public}@[%@] Attempting to set field %@ on %@ (no longer available in %@)", buf, 0x34u);

                  BOOL v44 = v166;
                  uint64_t v64 = v167;

                  v58 = v168;
                }

                char v63 = 1;
              }
            }
            uint64_t v62 = [v58 countByEnumeratingWithState:&v174 objects:v193 count:16];
          }
          while (v62);

          if ((v63 & 1) == 0)
          {
            id v42 = v158;
            id v43 = v159;
            uint64_t v45 = v160;
            goto LABEL_38;
          }
          v79 = (void *)MEMORY[0x1D9452090]();
          v80 = v44;
          v81 = HMFGetOSLogHandle();
          id v42 = v158;
          id v43 = v159;
          uint64_t v45 = v160;
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            v82 = HMFGetLogIdentifier();
            v83 = [WeakRetained operationUUID];
            *(_DWORD *)buf = 138543618;
            v184 = v82;
            __int16 v185 = 2112;
            v186 = v83;
            _os_log_impl(&dword_1D49D5000, v81, OS_LOG_TYPE_ERROR, "%{public}@[%@] Calling response handler with invalid parameter", buf, 0x16u);
          }
          v84 = [v170 message];
          v85 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
          [v84 respondWithError:v85];

LABEL_39:
          uint64_t v46 = v164 + 1;
        }
        while (v164 + 1 != v162);
        uint64_t v86 = [obj countByEnumeratingWithState:&v179 objects:v194 count:16];
        uint64_t v162 = v86;
      }
      while (v86);
    }

    v87 = (void *)MEMORY[0x1D9452090]([(HMDBackingStoreTransactionActions *)v42 invokePostApplyActions]);
    v88 = v44;
    v89 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
    {
      v90 = HMFGetLogIdentifier();
      v91 = [WeakRetained operationUUID];
      *(_DWORD *)buf = 138543874;
      v184 = v90;
      __int16 v185 = 2112;
      v186 = v91;
      __int16 v187 = 2112;
      v188 = (HMDHomeSaveRequest *)v42;
      _os_log_impl(&dword_1D49D5000, v89, OS_LOG_TYPE_INFO, "%{public}@[%@] Saving transaction with actions: %@", buf, 0x20u);
    }
    BOOL v92 = [(HMDBackingStoreTransactionActions *)v42 local];
    v93 = v42;
    id v3 = v152;
    v5 = v153;
    id v11 = v150;
    a1 = v151;
    id v12 = v154;
    if (v92 && ![(HMDBackingStoreTransactionActions *)v93 changed])
    {
      if (v156)
      {
        v96 = (void *)MEMORY[0x1D9452090]();
        v97 = v88;
        v98 = HMFGetOSLogHandle();
        BOOL v99 = os_log_type_enabled(v98, OS_LOG_TYPE_INFO);
        if (v155)
        {
          if (v99)
          {
            v100 = HMFGetLogIdentifier();
            v101 = [WeakRetained operationUUID];
            *(_DWORD *)buf = 138543618;
            v184 = v100;
            __int16 v185 = 2112;
            v186 = v101;
            _os_log_impl(&dword_1D49D5000, v98, OS_LOG_TYPE_INFO, "%{public}@[%@] Saving home data archive for local actions", buf, 0x16u);
          }
          uint64_t v102 = -[HMDBackingStore _saveHomeDataInOperationWithControllerUserName:incrementGeneration:reason:](v97, v155, 0, @"LocalActions");

          id v3 = (HMDHomeSaveRequest *)v102;
        }
        else
        {
          if (v99)
          {
            v137 = HMFGetLogIdentifier();
            v138 = [WeakRetained operationUUID];
            *(_DWORD *)buf = 138543618;
            v184 = v137;
            __int16 v185 = 2112;
            v186 = v138;
            _os_log_impl(&dword_1D49D5000, v98, OS_LOG_TYPE_INFO, "%{public}@[%@] No controller key, cannot save home data archive for local actions", buf, 0x16u);
          }
        }
      }
      else
      {
        [v159 _saveToPersistentStore:0 reason:@"LocalActions"];
      }
    }
    else
    {
      if (![(HMDBackingStoreTransactionActions *)v93 changed]
        && ![(HMDBackingStoreTransactionOptions *)v93 mustPush])
      {
        goto LABEL_111;
      }
      if ([(HMDBackingStoreTransactionOptions *)v93 source] == 1)
      {
        if (v150)
        {
          v94 = [v150 zoneID];
          v95 = [v94 UUIDString];
        }
        else
        {
          v95 = 0;
        }
        v103 = [v159 syncManager];
        [v103 resetCloudPushTimer:v95];
      }
      if (v150)
      {
        v93 = v158;
        if ([(HMDBackingStoreTransactionActions *)v158 saveToSharedUserAccount])
        {
          v104 = [(HMDBackingStoreTransactionOptions *)v158 label];
          v105 = [*(id *)(v151 + 32) options];
          [v150 saveSharedHomeToAccountWithReason:v104 postSyncNotification:0 options:v105];
        }
        else
        {
          v124 = (void *)MEMORY[0x1D9452090]();
          v125 = v88;
          v126 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
          {
            v127 = HMFGetLogIdentifier();
            v128 = [WeakRetained operationUUID];
            *(_DWORD *)buf = 138543618;
            v184 = v127;
            __int16 v185 = 2112;
            v186 = v128;
            _os_log_impl(&dword_1D49D5000, v126, OS_LOG_TYPE_INFO, "%{public}@[%@] Saving home data in transaction", buf, 0x16u);
          }
          if (v156 && *(unsigned char *)(v151 + 66))
          {
            v129 = (void *)MEMORY[0x1D9452090]();
            v130 = v125;
            v131 = HMFGetOSLogHandle();
            v132 = v131;
            if (v155)
            {
              if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
              {
                v133 = HMFGetLogIdentifier();
                v134 = [WeakRetained operationUUID];
                *(_DWORD *)buf = 138543618;
                v184 = v133;
                __int16 v185 = 2112;
                v186 = v134;
                _os_log_impl(&dword_1D49D5000, v132, OS_LOG_TYPE_INFO, "%{public}@[%@] Saving home data archive for with home actions", buf, 0x16u);
              }
              v93 = v158;
              v135 = [(HMDBackingStoreTransactionOptions *)v158 label];
              uint64_t v136 = -[HMDBackingStore _saveHomeDataInOperationWithControllerUserName:incrementGeneration:reason:](v130, v155, 1, v135);

              id v3 = (HMDHomeSaveRequest *)v136;
            }
            else
            {
              if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
              {
                v139 = HMFGetLogIdentifier();
                v140 = [WeakRetained operationUUID];
                *(_DWORD *)buf = 138543618;
                v184 = v139;
                __int16 v185 = 2112;
                v186 = v140;
                _os_log_impl(&dword_1D49D5000, v132, OS_LOG_TYPE_ERROR, "%{public}@[%@] No controller key, cannot save home data archive for with home actions, home data will need to be reset", buf, 0x16u);
              }
              v93 = v158;
            }
            v104 = [(HMDBackingStoreTransactionOptions *)v93 label];
            [v150 performPostSaveActionsWithReason:v104];
          }
          else
          {
            v93 = v158;
            v104 = [(HMDBackingStoreTransactionOptions *)v158 label];
            [v150 saveWithReason:v104 postSyncNotification:0 objectChange:1];
          }
        }

LABEL_111:
        if ([(HMDBackingStoreTransactionActions *)v93 saveToAssistant])
        {
          v141 = [*(id *)(v151 + 32) options];
          v142 = [v141 label];
          [v159 assistantSyncDataChanged:v142];
        }
        if (!v156) {
          goto LABEL_115;
        }
        goto LABEL_114;
      }
      v106 = (void *)MEMORY[0x1D9452090]();
      v107 = v88;
      v108 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
      {
        v109 = HMFGetLogIdentifier();
        v110 = [WeakRetained operationUUID];
        *(_DWORD *)buf = 138543618;
        v184 = v109;
        __int16 v185 = 2112;
        v186 = v110;
        _os_log_impl(&dword_1D49D5000, v108, OS_LOG_TYPE_INFO, "%{public}@[%@] Saving home manager data in transaction", buf, 0x16u);
      }
      if (!v155)
      {
        v111 = (void *)MEMORY[0x1D9452090]();
        v112 = v107;
        v113 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        {
          v114 = HMFGetLogIdentifier();
          v115 = [WeakRetained operationUUID];
          *(_DWORD *)buf = 138543618;
          v184 = v114;
          __int16 v185 = 2112;
          v186 = v115;
          _os_log_impl(&dword_1D49D5000, v113, OS_LOG_TYPE_ERROR, "%{public}@[%@] No controller key while processing home manager actions", buf, 0x16u);

          id v12 = v154;
        }
      }
      v116 = [HMDHomeSaveRequest alloc];
      v117 = [(HMDBackingStoreTransactionOptions *)v158 label];
      v118 = [(HMDHomeSaveRequest *)v116 initWithReason:v117 information:0 postSyncNotification:0];

      v119 = (void *)MEMORY[0x1D9452090]();
      v120 = v107;
      v121 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
      {
        v122 = HMFGetLogIdentifier();
        v123 = [WeakRetained operationUUID];
        *(_DWORD *)buf = 138543874;
        v184 = v122;
        __int16 v185 = 2112;
        v186 = v123;
        __int16 v187 = 2112;
        v188 = v118;
        _os_log_impl(&dword_1D49D5000, v121, OS_LOG_TYPE_INFO, "%{public}@[%@] Submitting save request: %@", buf, 0x20u);

        id v12 = v154;
      }

      [v159 saveWithRequest:v118];
    }
    v93 = v158;
    goto LABEL_111;
  }
  v21 = (void *)MEMORY[0x1D9452090]();
  uint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = HMFGetLogIdentifier();
    id v24 = [WeakRetained operationUUID];
    *(_DWORD *)buf = 138543618;
    v184 = v23;
    __int16 v185 = 2112;
    v186 = v24;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@[%@] lost self when running transaction", buf, 0x16u);
  }
LABEL_121:
}

void __67__HMDBackingStore_commit_run_save_archiveInline_completionHandler___block_invoke_93(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = [*(id *)(a1 + 40) operationUUID];
      int v16 = 138543874;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v3;
      uint64_t v10 = "%{public}@[%@] Apply Change resulted with error: %@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v11, v12, v10, (uint8_t *)&v16, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = [*(id *)(a1 + 40) operationUUID];
    int v16 = 138543618;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    uint64_t v10 = "%{public}@[%@] Apply Change completed";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }

  id v14 = *(void **)(a1 + 48);
  v15 = [*(id *)(a1 + 32) uuid];
  [v14 updateGenerationCounterWithReason:@"Backing store transaction applied" sourceUUID:v15 shouldNotifyClients:1];
}

- (id)_saveHomeDataInOperationWithControllerUserName:(uint64_t)a3 incrementGeneration:(void *)a4 reason:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 9);
  uint64_t v10 = [a1 homeManager];
  char v11 = [v10 hasValidControllerKeyToSave];

  os_log_type_t v12 = (void *)MEMORY[0x1D9452090]();
  if (v11)
  {
    uint32_t v13 = [WeakRetained dataForPersistentStoreIncrementingGeneration:a3 reason:v8];
    id v14 = v13;
    if (!v13 || ![v13 length])
    {
      __int16 v32 = (void *)MEMORY[0x1D9452090]();
      id v33 = a1;
      id v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v43 = v35;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@No home data to save.", buf, 0xCu);
      }

      goto LABEL_18;
    }
    v15 = (void *)MEMORY[0x1D9452090]();
    int v16 = a1;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = HMFGetLogIdentifier();
      id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
      *(_DWORD *)buf = 138543874;
      id v43 = v18;
      __int16 v44 = 2112;
      id v45 = v7;
      __int16 v46 = 2112;
      v47 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Controller User Name : [%@], Saving home data size: %@", buf, 0x20u);
    }
    __int16 v20 = [v16 local];
    id v40 = 0;
    [v20 _insertArchive:v14 identifier:@"homedata" controllerUserName:v7 error:&v40];
    id v21 = v40;

    if (!v21)
    {
      if (((_BYTE)v16[1] & 1) == 0)
      {
        uint64_t v22 = (void *)MEMORY[0x1D9452090]();
        v23 = v16;
        id v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v43 = v25;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Will attempt to remove legacy archive", buf, 0xCu);
        }
        long long v26 = [v23 homeManager];
        id v41 = 0;
        char v27 = [v26 _removeLegacyHomeArchive:&v41];
        id v28 = v41;

        if (v27)
        {
          *((unsigned char *)v23 + 8) = 1;
        }
        else
        {
          v37 = (void *)MEMORY[0x1D9452090]();
          v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            uint64_t v39 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v43 = v39;
            __int16 v44 = 2112;
            id v45 = v28;
            _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove home data error:%@", buf, 0x16u);
          }
        }
      }
LABEL_18:
      id v21 = 0;
    }
  }
  else
  {
    long long v29 = a1;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v43 = v31;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@In decryption fail state cannot save.", buf, 0xCu);
    }
    id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  }

  return v21;
}

- (HMDBackingStore)initWithUUID:(id)a3
{
  if (self) {
    return [(HMDBackingStore *)self initWithUUID:a3 homeManager:0 home:0 dataSource:self];
  }
  return self;
}

- (HMDBackingStore)initWithUUID:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 homeManager];
  if (self) {
    self = [(HMDBackingStore *)self initWithUUID:v6 homeManager:v8 home:v7 dataSource:self];
  }

  return self;
}

- (HMDBackingStore)initWithUUID:(id)a3 homeManager:(id)a4
{
  if (self) {
    return [(HMDBackingStore *)self initWithUUID:a3 homeManager:a4 home:0 dataSource:self];
  }
  return self;
}

- (HMDBackingStore)initWithUUID:(id)a3 homeManager:(id)a4 home:(id)a5 dataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HMDBackingStore;
  v15 = [(HMDBackingStore *)&v26 init];
  if (v15)
  {
    uint64_t v16 = [v14 localBackingStore];
    local = v15->_local;
    v15->_local = (HMDBackingStoreLocal *)v16;

    objc_storeStrong((id *)&v15->_uuid, a3);
    id v18 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    id v19 = [v11 UUIDString];
    uint64_t v20 = [v18 initWithRecordName:v19];
    root = v15->_root;
    v15->_root = (CKRecordID *)v20;

    objc_storeWeak((id *)&v15->_home, v13);
    objc_storeWeak((id *)&v15->_homeManager, v12);
    objc_storeWeak((id *)&v15->_dataSource, v14);
    if (v13)
    {
      uint64_t v22 = [v14 createHomeObjectLookupWithHome:v13];
    }
    else
    {
      if (!v12)
      {
LABEL_7:
        id v24 = v15;
        goto LABEL_8;
      }
      uint64_t v22 = [[HMDHomeManagerObjectLookup alloc] initWithHomeManager:v12];
    }
    lookup = v15->_lookup;
    v15->_lookup = &v22->super;

    goto LABEL_7;
  }
LABEL_8:

  return v15;
}

+ (id)_saveToLocalStoreWithReason:(id)a3 homeManager:(id)a4 shouldIncrementGenerationCounter:(BOOL)a5 backingStore:(id)a6
{
  BOOL v7 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (id *)a6;
  if (isWatch())
  {
    [v11 _saveToPersistentStore:v7 reason:v10];
    id v13 = 0;
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = a1;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      int v34 = 138543362;
      v35 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Running HMDBackingStoreSaveToPersistentStore operation to save.", (uint8_t *)&v34, 0xCu);
    }
    id v18 = [MEMORY[0x1E4F5BE48] systemStore];
    id v19 = [v18 activeControllerPairingIdentifier];
    uint64_t v20 = (void *)[v19 copy];

    if (v20)
    {
      id v21 = v10;
      if (v12)
      {
        id WeakRetained = objc_loadWeakRetained(v12 + 9);
        v23 = [WeakRetained activeControllerKeyUsername];

        if (v23)
        {
          uint64_t v24 = -[HMDBackingStore _saveHomeDataInOperationWithControllerUserName:incrementGeneration:reason:](v12, v23, v7, v21);
        }
        else
        {
          long long v29 = (void *)MEMORY[0x1D9452090]();
          v30 = v12;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            __int16 v32 = HMFGetLogIdentifier();
            int v34 = 138543362;
            v35 = v32;
            _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not find controller key when trying to save home archive", (uint8_t *)&v34, 0xCu);
          }
          uint64_t v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        }
        id v13 = (void *)v24;
      }
      else
      {
        id v13 = 0;
      }
    }
    else
    {
      BOOL v25 = (void *)MEMORY[0x1D9452090]();
      id v26 = v15;
      char v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v28 = HMFGetLogIdentifier();
        int v34 = 138543362;
        v35 = v28;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find controller key when trying to run transaction", (uint8_t *)&v34, 0xCu);
      }
      id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    }
  }
  return v13;
}

+ (void)saveToPersistentStoreWithReason:(id)a3 homeManager:(id)a4 shouldIncrementGenerationCounter:(BOOL)a5 backingStore:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __127__HMDBackingStore_saveToPersistentStoreWithReason_homeManager_shouldIncrementGenerationCounter_backingStore_completionHandler___block_invoke;
  v20[3] = &unk_1E6A14E40;
  id v24 = v15;
  id v25 = a1;
  id v21 = v12;
  id v22 = v13;
  BOOL v26 = a5;
  id v23 = v14;
  id v16 = v15;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  [v17 submitBlock:v20];
}

uint64_t __127__HMDBackingStore_saveToPersistentStoreWithReason_homeManager_shouldIncrementGenerationCounter_backingStore_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() _saveToLocalStoreWithReason:*(void *)(a1 + 32) homeManager:*(void *)(a1 + 40) shouldIncrementGenerationCounter:*(unsigned __int8 *)(a1 + 72) backingStore:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    uint64_t v5 = v2;
    uint64_t v3 = (*(uint64_t (**)(void))(v3 + 16))();
    uint64_t v2 = v5;
  }
  return MEMORY[0x1F41817F8](v3, v2);
}

+ (id)currentDevice
{
  uint64_t v2 = +[HMDAppleAccountManager sharedManager];
  uint64_t v3 = [v2 device];

  return v3;
}

uint64_t __30__HMDBackingStore_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v37_161882;
  logCategory__hmf_once_v37_161882 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)resetBackingStore
{
  uint64_t v2 = +[HMDBackingStoreSingleton sharedInstance];
  uint64_t v3 = [v2 resetBackingStore];

  return v3;
}

+ (id)flushBackingStore
{
  uint64_t v2 = +[HMDBackingStoreSingleton sharedInstance];
  uint64_t v3 = [v2 flushBackingStore];

  return v3;
}

+ (NSSet)internalAllowedTypes
{
  if (internalAllowedTypes_onceToken != -1) {
    dispatch_once(&internalAllowedTypes_onceToken, &__block_literal_global_81_161887);
  }
  uint64_t v2 = (void *)internalAllowedTypes__internalAllowedTypes;
  return (NSSet *)v2;
}

void __39__HMDBackingStore_internalAllowedTypes__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = +[HMDBackingStore allowedTypes];
  uint64_t v1 = [v0 setWithSet:v4];
  uint64_t v2 = [v1 setByAddingObject:objc_opt_class()];
  uint64_t v3 = (void *)internalAllowedTypes__internalAllowedTypes;
  internalAllowedTypes__internalAllowedTypes = v2;
}

+ (NSSet)deeplyProblematicObjectTypes
{
  if (deeplyProblematicObjectTypes_onceToken != -1) {
    dispatch_once(&deeplyProblematicObjectTypes_onceToken, &__block_literal_global_73_161892);
  }
  uint64_t v2 = (void *)deeplyProblematicObjectTypes__neverAllowedTypes;
  return (NSSet *)v2;
}

void __47__HMDBackingStore_deeplyProblematicObjectTypes__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  uint64_t v3 = (void *)deeplyProblematicObjectTypes__neverAllowedTypes;
  deeplyProblematicObjectTypes__neverAllowedTypes = v2;
}

+ (NSSet)allowedTypes
{
  if (allowedTypes_onceToken_161900 != -1) {
    dispatch_once(&allowedTypes_onceToken_161900, &__block_literal_global_161901);
  }
  uint64_t v2 = (void *)allowedTypes__allowedTypes_161902;
  return (NSSet *)v2;
}

void __31__HMDBackingStore_allowedTypes__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  uint64_t v3 = (void *)allowedTypes__allowedTypes_161902;
  allowedTypes__allowedTypes_161902 = v2;
}

+ (void)start
{
}

@end