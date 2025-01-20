@interface HMDBackingStore
+ (NSSet)allowedTypes;
+ (NSSet)deeplyProblematicObjectTypes;
+ (NSSet)internalAllowedTypes;
+ (id)_saveToLocalStoreWithReason:(id)a3 homeManager:(id)a4 shouldIncrementGenerationCounter:(BOOL)a5 backingStore:(id)a6;
+ (id)cdlsActiveBackingStores;
+ (id)cdlsBackingStoreForHomeManagerWithError:(id *)a3;
+ (id)cdlsBackingStoreWithHandle:(id)a3 error:(id *)a4;
+ (id)cdlsFetchManagedObjectWithUUID:(id)a3 ofManagedObjectType:(Class)a4 error:(id *)a5;
+ (id)cdlsFetchManagedObjectWithUUID:(id)a3 ofModelType:(Class)a4 error:(id *)a5;
+ (id)cdlsFetchManagedObjectsWithUUIDStrings:(id)a3 ofManagedObjectType:(Class)a4;
+ (id)cdlsFetchObjectWithUUID:(id)a3 ofModelType:(Class)a4 error:(id *)a5;
+ (id)cdlsModelIDStringsForManagedObjects:(id)a3;
+ (id)dependencySortTestInterface:(id)a3;
+ (id)logCategory;
+ (void)saveToPersistentStoreWithReason:(id)a3 homeManager:(id)a4 shouldIncrementGenerationCounter:(BOOL)a5 backingStore:(id)a6 completionHandler:(id)a7;
- (BOOL)isAtomicSaveFeatureEnabled;
- (CKRecordID)root;
- (HMBLocalZone)localZone;
- (HMCContext)context;
- (HMDBackingStore)initWithUUID:(id)a3;
- (HMDBackingStore)initWithUUID:(id)a3 home:(id)a4;
- (HMDBackingStore)initWithUUID:(id)a3 homeManager:(id)a4;
- (HMDBackingStore)initWithUUID:(id)a3 homeManager:(id)a4 home:(id)a5 dataSource:(id)a6;
- (HMDBackingStoreLocal)local;
- (HMDBackingStoreObjectProtocol)delegate;
- (HMDCoreData)coreData;
- (HMDHome)home;
- (HMDHomeManager)homeManager;
- (HMDObjectLookup)lookup;
- (NSString)activeControllerKeyUsername;
- (NSString)contextName;
- (NSString)contextTransactionAuthor;
- (NSString)description;
- (NSUUID)uuid;
- (id)backingStoreOperationQueue;
- (id)cdlsFetchObjectWithUUID:(id)a3 ofModelType:(Class)a4 error:(id *)a5;
- (id)createBackingStoreLogAddTransactionOperationWithTransaction:(id)a3;
- (id)createBackingStoreOperation;
- (id)createHomeObjectLookupWithHome:(id)a3;
- (id)dataForPersistentStoreIncrementingGeneration:(BOOL)a3 reason:(id)a4;
- (id)localBackingStore;
- (id)logIdentifier;
- (id)transaction:(id)a3 options:(id)a4;
- (void)_cdlsReplayAllModelsStartingAt:(id)a3 fromContext:(id)a4 isInitialGraphLoad:(BOOL)a5;
- (void)cdlsCommit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 coreDataBlock:(id)a6 completionHandler:(id)a7;
- (void)cdlsDelete:(id)a3 destination:(unint64_t)a4;
- (void)cdlsReplayAllModelsStartingAt:(id)a3 isInitialGraphLoad:(BOOL)a4;
- (void)cdlsUpdate:(id)a3 destination:(unint64_t)a4;
- (void)commit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 archiveInline:(BOOL)a6 coreDataBlock:(id)a7 completionHandler:(id)a8;
- (void)commit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 coreDataBlock:(id)a6 completionHandler:(id)a7;
- (void)dmKickClients;
- (void)handleCoreDataDidSaveNotification:(id)a3;
- (void)handleCoreDataDidSaveNotification:(id)a3 sourceContext:(id)a4;
- (void)handleCoreDataWillSaveNotification:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setLocal:(id)a3;
- (void)setLocalZone:(id)a3;
- (void)setLookup:(id)a3;
- (void)setUuid:(id)a3;
- (void)shouldHandleNotificationFromContext:(void *)a1;
- (void)submitBlock:(id)a3;
@end

@implementation HMDBackingStore

- (void)cdlsDelete:(id)a3 destination:(unint64_t)a4
{
}

- (void)cdlsUpdate:(id)a3 destination:(unint64_t)a4
{
}

- (void)cdlsCommit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 coreDataBlock:(id)a6 completionHandler:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  v13 = [(HMDBackingStore *)self home];
  v14 = [(HMDBackingStore *)self context];
  v15 = [v14 managedObjectContext];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __81__HMDBackingStore_CoreData__cdlsCommit_run_save_coreDataBlock_completionHandler___block_invoke;
  v21[3] = &unk_264A1CC68;
  v21[4] = self;
  id v22 = v10;
  id v23 = v13;
  id v24 = v15;
  id v25 = v11;
  id v26 = v12;
  id v16 = v12;
  id v17 = v11;
  id v18 = v15;
  id v19 = v13;
  id v20 = v10;
  [v14 performBlock:v21];
}

void __81__HMDBackingStore_CoreData__cdlsCommit_run_save_coreDataBlock_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  char v76 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__47717;
  v71 = __Block_byref_object_dispose__47718;
  id v72 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__47717;
  v65 = __Block_byref_object_dispose__47718;
  id v66 = 0;
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 managedObjectContext];

  v4 = [*(id *)(a1 + 40) options];
  uint64_t v5 = [v4 label];
  v6 = (void *)v5;
  v7 = @"<no message>";
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v8 = v7;

  v9 = [*(id *)(a1 + 40) objects];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __81__HMDBackingStore_CoreData__cdlsCommit_run_save_coreDataBlock_completionHandler___block_invoke_2;
  v52[3] = &unk_264A19E18;
  v58 = &v67;
  id v10 = *(id *)(a1 + 48);
  v59 = &v73;
  uint64_t v11 = *(void *)(a1 + 32);
  id v53 = v10;
  uint64_t v54 = v11;
  id v12 = v8;
  v55 = v12;
  id v56 = *(id *)(a1 + 56);
  v60 = &v61;
  id v13 = v3;
  id v57 = v13;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v52);

  if (v62[5])
  {
    v14 = _Block_copy(*(const void **)(a1 + 64));
    v15 = v14;
    if (v14) {
      (*((void (**)(void *, id, uint64_t, void))v14 + 2))(v14, v13, v62[5], 0);
    }

    id v16 = [*(id *)(a1 + 32) context];
    [v16 rollback];

    id v17 = _Block_copy(*(const void **)(a1 + 72));
    id v18 = v17;
    if (v17) {
      (*((void (**)(void *, uint64_t))v17 + 2))(v17, v62[5]);
    }
  }
  else
  {
    id v19 = [*(id *)(a1 + 40) objects];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __81__HMDBackingStore_CoreData__cdlsCommit_run_save_coreDataBlock_completionHandler___block_invoke_52;
    v49[3] = &unk_264A19E40;
    v49[4] = *(void *)(a1 + 32);
    id v20 = v13;
    id v50 = v20;
    v51 = &v61;
    objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v49);

    BOOL v21 = v62[5] == 0;
    id v22 = _Block_copy(*(const void **)(a1 + 64));
    id v23 = v22;
    if (v21)
    {
      if (v22)
      {
        v27 = (id *)(v62 + 5);
        id obj = (id)v62[5];
        (*((void (**)(void *, id, void, id *))v22 + 2))(v22, v20, 0, &obj);
        objc_storeStrong(v27, obj);
      }

      if (v62[5])
      {
        v28 = [*(id *)(a1 + 32) context];
        [v28 rollback];

        v29 = _Block_copy(*(const void **)(a1 + 72));
        id v26 = v29;
        if (v29) {
          (*((void (**)(void *, uint64_t))v29 + 2))(v29, v62[5]);
        }
      }
      else
      {
        id v26 = [v20 userInfo];
        [v26 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"HMD.v4txn"];
        v30 = [*(id *)(a1 + 40) options];
        v31 = [v30 clientIdentifier];
        if (v31)
        {
          uint64_t v32 = [v30 clientIdentifier];
          v33 = (void *)v68[5];
          v68[5] = v32;
        }
        else
        {
          v34 = v68;
          id v35 = (id)v68[5];
          v33 = (void *)v34[5];
          v34[5] = (uint64_t)v35;
        }

        uint64_t v36 = [v30 cdTransactionAuthor];
        uint64_t v37 = v68[5];
        uint64_t v38 = *((unsigned __int8 *)v74 + 24);
        v39 = (id *)(v62 + 5);
        id v47 = (id)v62[5];
        objc_msgSend(v20, "hmd_saveWithTransactionAuthor:clientIdentifier:allowQoSEscalation:error:", v36, v37, v38, &v47);
        objc_storeStrong(v39, v47);
        [v20 reset];
        removeDictionaryEntry(v26, @"HMD.v4txn", *(void **)(a1 + 40));
        if (v62[5])
        {
          v40 = (void *)MEMORY[0x230FBD990]();
          id v41 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v42 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v43 = HMFGetLogIdentifier();
            uint64_t v44 = v62[5];
            *(_DWORD *)buf = 138543618;
            v78 = v43;
            __int16 v79 = 2112;
            uint64_t v80 = v44;
            _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Context save failed: %@", buf, 0x16u);
          }
        }
        v45 = (void (**)(void *, void *))_Block_copy(*(const void **)(a1 + 72));
        if (v45)
        {
          v46 = HMDSanitizeCoreDataError((void *)v62[5]);
          v45[2](v45, v46);
        }
      }
    }
    else
    {
      if (v22) {
        (*((void (**)(void *, id, uint64_t, void))v22 + 2))(v22, v20, v62[5], 0);
      }

      id v24 = [*(id *)(a1 + 32) context];
      [v24 rollback];

      id v25 = _Block_copy(*(const void **)(a1 + 72));
      id v26 = v25;
      if (v25) {
        (*((void (**)(void *, uint64_t))v25 + 2))(v25, v62[5]);
      }
    }
  }
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);
}

void __81__HMDBackingStore_CoreData__cdlsCommit_run_save_coreDataBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  v6 = [(__CFString *)v5 message];
  v7 = v6;
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    v15 = [v6 untrustedClientIdentifier];
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 32);

      if (v16)
      {
        uint64_t v17 = [v7 untrustedClientIdentifier];
        uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
        id v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;

        id v20 = [v7 userForHome:*(void *)(a1 + 32)];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v20 isOwner];
      }
    }
  }
  v8 = [(__CFString *)v5 change];
  v9 = HMDCastIfModelCDRepresentable(v8);

  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 40);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v63 = v10;
    v62 = HMFGetLogIdentifier();
    uint64_t v61 = [(__CFString *)v5 change];
    uint64_t v13 = [v61 objectChangeType];
    if ((unint64_t)(v13 - 1) > 2) {
      v14 = @"unknown";
    }
    else {
      v14 = off_264A26230[v13 - 1];
    }
    BOOL v21 = v14;
    v65 = v7;
    id v22 = [v7 name];
    id v23 = v22;
    if (!v22) {
      id v23 = *(void **)(a1 + 48);
    }
    id v24 = [(__CFString *)v5 change];
    id v25 = [v24 debugString:1];
    *(_DWORD *)buf = 138544130;
    v71 = v62;
    __int16 v72 = 2112;
    uint64_t v73 = v21;
    __int16 v74 = 2112;
    uint64_t v75 = v23;
    __int16 v76 = 2112;
    v77 = v25;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@COREDATA LEGACY PROCESSING: %@ (%@)\n%@", buf, 0x2Au);

    v7 = v65;
    id v10 = v63;
  }

  id v26 = [(__CFString *)v5 change];
  uint64_t v27 = [v26 objectChangeType];

  uint64_t v28 = *(void *)(*(void *)(a1 + 88) + 8);
  v31 = *(void **)(v28 + 40);
  v30 = (id *)(v28 + 40);
  v29 = v31;
  if (v27 == 3)
  {
    uint64_t v32 = *(void *)(a1 + 56);
    id obj = v29;
    v33 = objc_msgSend(v9, "cd_fetchManagedObjectInContext:error:", v32, &obj);
    objc_storeStrong(v30, obj);

    if (v33)
    {
      v34 = [v9 managedObject];

      if (v34)
      {
        id v35 = *(void **)(a1 + 64);
        uint64_t v36 = [v9 managedObject];
        [v35 deleteObject:v36];

        goto LABEL_29;
      }
      uint64_t v67 = v9;
      v39 = (void *)MEMORY[0x230FBD990]();
      id v54 = *(id *)(a1 + 40);
      v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        id v56 = HMFGetLogIdentifier();
        id v57 = [(__CFString *)v5 change];
        v58 = [v57 bsoType];
        v59 = [(__CFString *)v5 change];
        v60 = [v59 uuid];
        *(_DWORD *)buf = 138543874;
        v71 = v56;
        __int16 v72 = 2112;
        uint64_t v73 = v58;
        __int16 v74 = 2112;
        uint64_t v75 = v60;
        _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch succeeded for %@.%@ but no managed object actually found", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v67 = v9;
      v39 = (void *)MEMORY[0x230FBD990]();
      id v40 = *(id *)(a1 + 40);
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = HMFGetLogIdentifier();
        [(__CFString *)v5 change];
        v43 = id v66 = v7;
        uint64_t v44 = [v43 bsoType];
        v45 = [(__CFString *)v5 change];
        v46 = [v45 uuid];
        id v47 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        *(_DWORD *)buf = 138544130;
        v71 = v42;
        __int16 v72 = 2112;
        uint64_t v73 = v44;
        __int16 v74 = 2112;
        uint64_t v75 = v46;
        __int16 v76 = 2112;
        v77 = v47;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unable to find %@.%@ for deletion: %@", buf, 0x2Au);

        v7 = v66;
      }
    }
    v9 = v67;
    goto LABEL_29;
  }
  uint64_t v37 = *(void *)(a1 + 64);
  id v68 = v29;
  uint64_t v38 = objc_msgSend(v9, "cd_currentManagedObjectInContext:error:", v37, &v68);
  objc_storeStrong(v30, v68);
  if (v38)
  {
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    v48 = v9;
    v49 = (void *)MEMORY[0x230FBD990]();
    id v50 = *(id *)(a1 + 40);
    v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = HMFGetLogIdentifier();
      id v53 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v71 = v52;
      __int16 v72 = 2112;
      uint64_t v73 = v5;
      __int16 v74 = 2112;
      uint64_t v75 = v53;
      _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Unable to find current managed object for %@: %@", buf, 0x20u);
    }
    *a4 = 1;
    v9 = v48;
  }
LABEL_29:
}

void __81__HMDBackingStore_CoreData__cdlsCommit_run_save_coreDataBlock_completionHandler___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 change];
  uint64_t v5 = [v4 objectChangeType];

  if (v5 != 3)
  {
    v6 = [v3 change];
    v7 = HMDCastIfModelCDRepresentable(v6);

    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v9 + 40);
      char v10 = objc_msgSend(v7, "cd_updateManagedObjectInContext:error:", v8, &obj);
      objc_storeStrong((id *)(v9 + 40), obj);
      if (v10)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = HMFGetLogIdentifier();
        v15 = [v3 change];
        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138543874;
        BOOL v21 = v14;
        __int16 v22 = 2112;
        id v23 = v15;
        __int16 v24 = 2112;
        uint64_t v25 = v16;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to update managed object for %@: %@", buf, 0x20u);
      }
    }
    else
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        uint64_t v18 = [v3 change];
        *(_DWORD *)buf = 138543618;
        BOOL v21 = v17;
        __int16 v22 = 2112;
        id v23 = v18;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Got a %@ but don't know how to represent it as a NSManagedObject", buf, 0x16u);
      }
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)_cdlsReplayAllModelsStartingAt:(id)a3 fromContext:(id)a4 isInitialGraphLoad:(BOOL)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v11 = v10;
  id v12 = [v8 uuid];
  id v54 = 0;
  uint64_t v13 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v12 ofModelType:objc_opt_class() error:&v54];
  double v14 = COERCE_DOUBLE(v54);

  if (v13)
  {
    v15 = HMDCastIfManagedObjectBSORepresentable(v13);
    double v53 = v14;
    objc_msgSend(v15, "hmd_modelsWithChangeType:detached:error:", 0, 0, &v53);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    double v47 = COERCE_DOUBLE(*(id *)&v53);

    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    id v20 = v19;
    if (v16)
    {
      uint64_t v44 = v15;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v21 = HMFGetLogIdentifier();
        __int16 v22 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v56 = v21;
        __int16 v57 = 2112;
        id v58 = v22;
        id v23 = v22;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Begin replaying models from CoreData: %@", buf, 0x16u);
      }
      __int16 v24 = [MEMORY[0x263EFF9C0] set];
      if (a5) {
        +[HMDBackingStoreTransactionOptions defaultCloudOptionsForInitialGraphLoad];
      }
      else {
      v31 = +[HMDBackingStoreTransactionOptions defaultCloudOptions];
      }
      v46 = v13;
      uint64_t v32 = 0;
      if (objc_msgSend(v16, "count", v44))
      {
        v33 = v16;
        do
        {
          v34 = [MEMORY[0x263EFF9A0] dictionary];
          id v35 = [MEMORY[0x263EFF980] array];
          v48[0] = MEMORY[0x263EF8330];
          v48[1] = 3221225472;
          v48[2] = __91__HMDBackingStore_CoreData___cdlsReplayAllModelsStartingAt_fromContext_isInitialGraphLoad___block_invoke;
          v48[3] = &unk_264A19DF0;
          v48[4] = v18;
          id v49 = v24;
          id v50 = v34;
          id v51 = v9;
          id v36 = v35;
          id v52 = v36;
          id v37 = v34;
          objc_msgSend(v33, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v48);
          uint64_t v38 = __dependencySort(v37);
          __lookup(v18, v38, v31);
          v32 += [v38 count];
          id v16 = v36;

          v33 = v16;
        }
        while ([v16 count]);
      }
      v39 = (void *)MEMORY[0x230FBD990]();
      id v40 = v18;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = HMFGetLogIdentifier();
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        *(_DWORD *)buf = 138543874;
        id v56 = v42;
        __int16 v57 = 2048;
        id v58 = v32;
        __int16 v59 = 2048;
        double v60 = v43 - v11;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Replayed %zd models from CoreData in %.3lf seconds", buf, 0x20u);
      }
      [(HMDBackingStore *)v40 dmKickClients];

      v15 = v45;
      uint64_t v13 = v46;
      double v29 = v47;
    }
    else
    {
      double v29 = v47;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v56 = v30;
        __int16 v57 = 2112;
        id v58 = v13;
        __int16 v59 = 2112;
        double v60 = v47;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode managed object %@ into model objects: %@", buf, 0x20u);
      }
    }

    double v14 = v29;
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x230FBD990]();
    uint64_t v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v56 = v28;
      __int16 v57 = 2112;
      id v58 = v8;
      __int16 v59 = 2112;
      double v60 = v14;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to find root model to start replay at %@: %@", buf, 0x20u);
    }
  }
}

void __91__HMDBackingStore_CoreData___cdlsReplayAllModelsStartingAt_fromContext_isInitialGraphLoad___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = HMFGetLogIdentifier();
    id v8 = [v3 bsoType];
    id v9 = [v3 uuid];
    double v10 = [v3 parentUUID];
    *(_DWORD *)buf = 138544130;
    double v29 = v7;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@COREDATA: Replaying %@.%@.%@", buf, 0x2Au);
  }
  [v3 setObjectChangeType:2];
  double v11 = *(void **)(a1 + 40);
  id v12 = [v3 uuid];
  [v11 addObject:v12];

  uint64_t v13 = *(void **)(a1 + 48);
  double v14 = [[HMDBackingStoreTransactionItem alloc] initWithChange:v3 message:0];
  v15 = [v3 uuid];
  [v13 setObject:v14 forKey:v15];

  id v16 = HMDCastIfModelCDRepresentable(v3);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 56);
  id v27 = 0;
  id v19 = objc_msgSend(v16, "cd_childrenExcluding:fromContext:error:", v17, v18, &v27);
  id v20 = v27;

  if (v19)
  {
    BOOL v21 = *(void **)(a1 + 64);
    __int16 v22 = [v19 allObjects];
    [v21 addObjectsFromArray:v22];
  }
  else
  {
    id v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = *(id *)(a1 + 32);
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      double v29 = v26;
      __int16 v30 = 2112;
      id v31 = v3;
      __int16 v32 = 2112;
      id v33 = v20;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch children of %@: %@", buf, 0x20u);
    }
  }
}

- (void)cdlsReplayAllModelsStartingAt:(id)a3 isInitialGraphLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = [(HMDBackingStore *)self context];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__HMDBackingStore_CoreData__cdlsReplayAllModelsStartingAt_isInitialGraphLoad___block_invoke;
  v10[3] = &unk_264A2B1D8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  BOOL v13 = a4;
  id v8 = v7;
  id v9 = v6;
  [v8 performBlockAndWaitWithPinnedQueryGeneration:v10];
}

void __78__HMDBackingStore_CoreData__cdlsReplayAllModelsStartingAt_isInitialGraphLoad___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) managedObjectContext];
  [v2 _cdlsReplayAllModelsStartingAt:v3 fromContext:v4 isInitialGraphLoad:*(unsigned __int8 *)(a1 + 56)];
}

- (id)cdlsFetchObjectWithUUID:(id)a3 ofModelType:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  if ((HMDModelClassIsCDRepresentable((uint64_t)a4) & 1) == 0)
  {
    BOOL v13 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v13);
  }
  if (v8)
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    __int16 v22 = __Block_byref_object_copy__47717;
    id v23 = __Block_byref_object_dispose__47718;
    id v24 = 0;
    id v9 = [(HMDBackingStore *)self context];
    double v10 = [v9 managedObjectContext];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __71__HMDBackingStore_CoreData__cdlsFetchObjectWithUUID_ofModelType_error___block_invoke;
    v14[3] = &unk_264A19DC8;
    id v16 = &v19;
    id v15 = v8;
    Class v17 = a4;
    uint64_t v18 = a5;
    [v10 performBlockAndWait:v14];

    id v11 = (id)v20[5];
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __71__HMDBackingStore_CoreData__cdlsFetchObjectWithUUID_ofModelType_error___block_invoke(void *a1)
{
  uint64_t v2 = +[HMDBackingStore cdlsFetchObjectWithUUID:a1[4] ofModelType:a1[6] error:a1[7]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)dmKickClients
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDBackingStore *)self home];
  uint64_t v4 = [v3 homeManager];
  if (v4)
  {
    id v14 = (id)v4;

    uint64_t v5 = v14;
LABEL_4:
    id v16 = v5;
    [v5 dmKickClients];

    return;
  }
  id v15 = [(HMDBackingStore *)self homeManager];

  uint64_t v5 = v15;
  if (v15) {
    goto LABEL_4;
  }
  id v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = HMFGetLogIdentifier();
    double v10 = [(HMDBackingStore *)v7 context];
    id v11 = [v10 name];
    id v12 = [(HMDBackingStore *)v7 context];
    BOOL v13 = [v12 transactionAuthor];
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    id v20 = v11;
    __int16 v21 = 2112;
    __int16 v22 = v13;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Warning: HMDBackingStore with context %@.%@ does not have a homeManager", buf, 0x20u);
  }
}

- (void)handleCoreDataDidSaveNotification:(id)a3 sourceContext:(id)a4
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 userInfo];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFF180]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v83 = v9;

  double v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFF018]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  BOOL v13 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFEFE8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  id v16 = [v6 userInfo];
  [v16 objectForKeyedSubscript:@"HMD.deletes"];
  v85 = v84 = v16;
  [v16 removeObjectForKey:@"HMD.deletes"];
  if ([v12 count]
    || [v83 count]
    || [v15 count]
    || [v85 count])
  {
    uint64_t v81 = v7;
    v82 = v12;
    __int16 v79 = v15;
    [v6 name];
    v18 = Class v17 = v6;
    __int16 v19 = [v6 transactionAuthor];
    id v20 = +[HMDCoreDataContextTransactionAuthor contextAuthorWithString:v19];

    uint64_t v21 = [v20 type];
    __int16 v22 = [HMDCoreDataWorkingStoreTransactionLogEvent alloc];
    uint64_t v23 = [v20 string];
    uint64_t v24 = [(HMDCoreDataWorkingStoreTransactionLogEvent *)v22 initWithTransactionAuthor:v23];

    uint64_t v25 = [(HMDBackingStore *)self homeManager];
    uint64_t v26 = [v25 metricsManager];
    id v27 = [v26 logEventSubmitter];
    uint64_t v78 = (void *)v24;
    [v27 submitLogEvent:v24];

    uint64_t v28 = self;
    double v29 = [(HMDBackingStore *)self context];
    __int16 v30 = [v29 managedObjectContext];

    uint64_t v80 = v17;
    if (![v17 isEqual:v30])
    {
      id v56 = [(HMDBackingStore *)self context];
      v91[0] = MEMORY[0x263EF8330];
      v91[1] = 3221225472;
      v91[2] = __77__HMDBackingStore_CoreData__handleCoreDataDidSaveNotification_sourceContext___block_invoke;
      v91[3] = &unk_264A19DA0;
      v91[4] = self;
      id v92 = v18;
      id v93 = v20;
      id v94 = v30;
      id v95 = v5;
      __int16 v57 = v83;
      id v96 = v83;
      id v12 = v82;
      id v97 = v82;
      id v15 = v79;
      id v98 = v79;
      id v99 = v85;
      uint64_t v100 = v21;
      [v56 performBlock:v91];

      v7 = v81;
LABEL_45:

      uint64_t v67 = v84;
      id v6 = v80;
      goto LABEL_46;
    }
    v77 = v30;
    id v31 = [v84 objectForKeyedSubscript:@"HMD.v4txn"];
    id v12 = v82;
    if (v31) {
      [v84 removeObjectForKey:@"HMD.v4txn"];
    }
    id v32 = [v31 objects];
    id v33 = v85;
    v7 = v81;
    if (self)
    {
      if ([v32 count] || objc_msgSend(v33, "count"))
      {
        if ([v33 count])
        {
          if ([v32 count])
          {
            uint64_t v75 = v31;
            id v76 = v5;
            __int16 v34 = v33;
            v88 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v33, "count") + objc_msgSend(v32, "count"));
            [v88 addObjectsFromArray:v32];
            id v35 = (void *)MEMORY[0x263EFFA08];
            id v74 = v32;
            uint64_t v36 = objc_msgSend(v32, "na_map:", &__block_literal_global_11_47761);
            uint64_t v37 = [v35 setWithArray:v36];

            uint64_t v38 = (void *)v37;
            long long v103 = 0u;
            long long v104 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            uint64_t v73 = v34;
            id v39 = v34;
            id v40 = self;
            uint64_t v90 = [v39 countByEnumeratingWithState:&v101 objects:v111 count:16];
            if (v90)
            {
              uint64_t v89 = *(void *)v102;
              id v86 = v39;
              do
              {
                for (uint64_t i = 0; i != v90; ++i)
                {
                  v42 = v20;
                  double v43 = v18;
                  if (*(void *)v102 != v89) {
                    objc_enumerationMutation(v39);
                  }
                  uint64_t v44 = *(void **)(*((void *)&v101 + 1) + 8 * i);
                  v45 = [v44 change];
                  v46 = [v45 uuid];
                  int v47 = [v38 containsObject:v46];

                  if (v47)
                  {
                    v48 = (void *)MEMORY[0x230FBD990]();
                    id v49 = v40;
                    id v50 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                    {
                      HMFGetLogIdentifier();
                      v52 = id v51 = v38;
                      double v53 = [v45 uuid];
                      *(_DWORD *)buf = 138543874;
                      v106 = v52;
                      __int16 v107 = 2112;
                      v108 = v45;
                      __int16 v109 = 2112;
                      v110 = v53;
                      _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_DEBUG, "%{public}@Skipping merging transaction item for change %@/%@ as one already exists", buf, 0x20u);

                      uint64_t v38 = v51;
                      id v39 = v86;
                      id v40 = self;
                    }
                  }
                  else
                  {
                    [v88 addObject:v44];
                  }

                  uint64_t v18 = v43;
                  id v20 = v42;
                }
                uint64_t v90 = [v39 countByEnumeratingWithState:&v101 objects:v111 count:16];
              }
              while (v90);
            }

            uint64_t v54 = [v88 copy];
            v55 = v38;
            uint64_t v28 = (HMDBackingStore *)v54;

            id v31 = v75;
            id v5 = v76;
            v7 = v81;
            id v12 = v82;
            id v33 = v73;
            id v32 = v74;
            goto LABEL_40;
          }
          id v58 = (HMDBackingStore *)v33;
        }
        else
        {
          id v58 = (HMDBackingStore *)v32;
        }
        uint64_t v28 = v58;
      }
      else
      {
        uint64_t v28 = 0;
      }
    }
LABEL_40:

    __int16 v59 = (void *)MEMORY[0x230FBD990]();
    double v60 = self;
    uint64_t v61 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      uint64_t v63 = v62 = v31;
      v64 = "legacy";
      *(_DWORD *)v111 = 138544130;
      __int16 v113 = 2080;
      v112 = v63;
      if (!v62) {
        v64 = "native";
      }
      v114 = v64;
      __int16 v115 = 2112;
      v116 = v18;
      __int16 v117 = 2112;
      v118 = v20;
      _os_log_impl(&dword_22F52A000, v61, OS_LOG_TYPE_INFO, "%{public}@Processing %s Core Data save from this backing store's context: %@ / %@", v111, 0x2Au);

      id v31 = v62;
      id v12 = v82;
    }

    v65 = [v31 options];
    id v66 = v60;
    __int16 v57 = v83;
    __broadcastChanges(v66, v83, v12, v79, v28, v65);

    id v15 = v79;
    __int16 v30 = v77;
    goto LABEL_45;
  }
  id v68 = (void *)MEMORY[0x230FBD990]();
  uint64_t v69 = self;
  v70 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    __int16 v72 = v71 = v15;
    *(_DWORD *)v111 = 138543362;
    v112 = v72;
    _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_DEBUG, "%{public}@No changes actually saved, skipping further processing", v111, 0xCu);

    id v15 = v71;
  }

  __int16 v57 = v83;
  uint64_t v67 = v84;
LABEL_46:
}

void __77__HMDBackingStore_CoreData__handleCoreDataDidSaveNotification_sourceContext___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v14 = 138543874;
    id v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Processing Core Data save from a different context: %@ / %@", (uint8_t *)&v14, 0x20u);
  }
  [*(id *)(a1 + 56) mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 64)];
  id v8 = *(void **)(a1 + 32);
  id v9 = __mirrorForeignObjects(*(void **)(a1 + 56), *(void **)(a1 + 72));
  double v10 = __mirrorForeignObjects(*(void **)(a1 + 56), *(void **)(a1 + 80));
  id v11 = __mirrorForeignObjects(*(void **)(a1 + 56), *(void **)(a1 + 88));
  BOOL v13 = *(void **)(a1 + 96);
  unint64_t v12 = *(void *)(a1 + 104);
  if (v12 <= 0xB)
  {
    a1 = +[HMDBackingStoreTransactionOptions optionsWithSource:qword_2303E3D40[v12] destination:0 mustReplay:0 mustPush:0];
  }
  __broadcastChanges(v8, v9, v10, v11, v13, (void *)a1);
}

id __62__HMDBackingStore_CoreData____mergeLegacyChanges_intoDeletes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 change];
  uint64_t v4 = [v3 objectChangeType];

  if (v4 == 3)
  {
    id v5 = [v2 change];
    uint64_t v6 = [v5 uuid];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)handleCoreDataDidSaveNotification:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (-[HMDBackingStore shouldHandleNotificationFromContext:](self, v6))
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    [(HMDBackingStore *)self handleCoreDataDidSaveNotification:v8 sourceContext:v6];
  }
}

- (void)shouldHandleNotificationFromContext:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 coreData];
    int v5 = [v4 isRelatedContext:v3];

    if (v5 && objc_msgSend(v3, "hmd_transactionAuthor") != 7)
    {
      id v6 = [v3 name];
      uint64_t v7 = [a1 contextName];
      a1 = (void *)[v6 isEqualToString:v7];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)handleCoreDataWillSaveNotification:(id)a3
{
  id v4 = a3;
  int v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (-[HMDBackingStore shouldHandleNotificationFromContext:](self, v7))
  {
    id v8 = [v7 userInfo];
    id v9 = [v7 deletedObjects];
    if ([v9 count])
    {
      double v10 = self;
      id v11 = (objc_class *)MEMORY[0x263EFF980];
      id v12 = v9;
      BOOL v13 = objc_msgSend([v11 alloc], "initWithCapacity:", objc_msgSend(v12, "count"));
      location[0] = (id)MEMORY[0x263EF8330];
      location[1] = (id)3221225472;
      location[2] = ____createLegacyDeletes_block_invoke;
      location[3] = &unk_264A1F1D8;
      uint64_t v23 = v10;
      id v24 = v13;
      int v14 = v10;
      id v15 = v13;
      objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", location);

      __int16 v16 = (void *)[v15 copy];
      [v8 setObject:v16 forKeyedSubscript:@"HMD.deletes"];
      objc_initWeak(location, v7);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __64__HMDBackingStore_CoreData__handleCoreDataWillSaveNotification___block_invoke;
      v19[3] = &unk_264A2C148;
      objc_copyWeak(&v21, location);
      id v17 = v16;
      id v20 = v17;
      [v7 performWithOptions:1 andBlock:v19];

      objc_destroyWeak(&v21);
      objc_destroyWeak(location);
    }
    else
    {
      __int16 v18 = [v7 userInfo];
      [v18 removeObjectForKey:@"HMD.deletes"];
    }
  }
}

void __64__HMDBackingStore_CoreData__handleCoreDataWillSaveNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained userInfo];
    removeDictionaryEntry(v3, @"HMD.deletes", *(void **)(a1 + 32));

    id WeakRetained = v4;
  }
}

- (HMDCoreData)coreData
{
  id v2 = +[HMDMainDriver driver];
  id v3 = [v2 coreData];

  return (HMDCoreData *)v3;
}

+ (id)cdlsFetchManagedObjectsWithUUIDStrings:(id)a3 ofManagedObjectType:(Class)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 count])
  {
    Class aClass = a4;
    id v6 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v5, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
    __int16 v30 = v6;
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v11];
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            BOOL v13 = (void *)MEMORY[0x230FBD990]();
            id v14 = a1;
            id v15 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              __int16 v16 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              id v39 = v16;
              __int16 v40 = 2112;
              id v41 = v11;
              _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Invalid UUID string '%@'", buf, 0x16u);

              id v6 = v30;
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
      }
      while (v8);
    }

    if ([v6 count])
    {
      id v17 = [(objc_class *)aClass fetchRequest];
      __int16 v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"modelID", v6];
      [v17 setPredicate:v18];

      uint64_t v44 = @"modelID";
      uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
      [v17 setPropertiesToFetch:v19];

      id v33 = 0;
      id v20 = [v17 execute:&v33];
      id v21 = v33;
      if (v20)
      {
        __int16 v22 = [MEMORY[0x263EFFA08] setWithArray:v20];
      }
      else
      {
        uint64_t v23 = (void *)MEMORY[0x230FBD990]();
        id v24 = a1;
        uint64_t v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = HMFGetLogIdentifier();
          id v27 = NSStringFromClass(aClass);
          *(_DWORD *)buf = 138543874;
          id v39 = v26;
          __int16 v40 = 2112;
          id v41 = v27;
          __int16 v42 = 2112;
          id v43 = v21;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Fetch of %@ models failed: %@", buf, 0x20u);
        }
        __int16 v22 = 0;
        id v6 = v30;
      }
    }
    else
    {
      __int16 v22 = [MEMORY[0x263EFFA08] set];
    }
  }
  else
  {
    __int16 v22 = [MEMORY[0x263EFFA08] set];
  }

  return v22;
}

+ (id)cdlsModelIDStringsForManagedObjects:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v4];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "modelID", (void)v15);
          id v12 = [v11 UUIDString];
          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    BOOL v13 = (void *)[v5 copy];
  }
  else
  {
    BOOL v13 = (void *)MEMORY[0x263EFFA68];
  }

  return v13;
}

+ (id)cdlsFetchObjectWithUUID:(id)a3 ofModelType:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  if (HMDModelClassIsCDRepresentable((uint64_t)a4))
  {
    uint64_t v9 = objc_msgSend(a1, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v8, -[objc_class cd_entityClass](a4, "cd_entityClass"), a5);
    if (v9) {
      double v10 = (void *)[[a4 alloc] initWithManagedObject:v9 changeType:0 detached:0 error:a5];
    }
    else {
      double v10 = 0;
    }

    return v10;
  }
  else
  {
    id v12 = (void *)_HMFPreconditionFailure();
    return +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v14 ofManagedObjectType:v15 error:v16];
  }
}

+ (id)cdlsFetchManagedObjectWithUUID:(id)a3 ofManagedObjectType:(Class)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  uint64_t v9 = [(objc_class *)a4 fetchRequest];
  double v10 = +[HMDBackingStoreModelObject fetchByModelID];
  id v33 = @"MODELID";
  v34[0] = v8;
  id v11 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
  id v12 = [v10 predicateWithSubstitutionVariables:v11];
  [v9 setPredicate:v12];

  SEL v13 = [v9 execute:a5];
  id v14 = v13;
  if (v13)
  {
    if ((unint64_t)[v13 count] < 2)
    {
      Class v15 = [v14 firstObject];
      long long v16 = v15;
      if (v15) {
        id v17 = v15;
      }

      goto LABEL_10;
    }
LABEL_14:
    _HMFPreconditionFailure();
  }
  long long v18 = (void *)MEMORY[0x230FBD990]();
  id v19 = a1;
  uint64_t v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    id v21 = HMFGetLogIdentifier();
    __int16 v22 = NSStringFromClass(a4);
    id v23 = *a5;
    int v25 = 138544130;
    uint64_t v26 = v21;
    __int16 v27 = 2112;
    uint64_t v28 = v22;
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v23;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Fetch of model %@.%@ failed: %@", (uint8_t *)&v25, 0x2Au);
  }
  long long v16 = 0;
LABEL_10:

  return v16;
}

+ (id)cdlsFetchManagedObjectWithUUID:(id)a3 ofModelType:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  if (HMDModelClassIsCDRepresentable((uint64_t)a4))
  {
    uint64_t v9 = objc_msgSend(a1, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v8, -[objc_class cd_entityClass](a4, "cd_entityClass"), a5);

    return v9;
  }
  else
  {
    id v11 = (void *)_HMFPreconditionFailure();
    return +[HMDBackingStore dependencySortTestInterface:v13];
  }
}

+ (id)dependencySortTestInterface:(id)a3
{
  return __dependencySort(a3);
}

+ (id)cdlsBackingStoreForHomeManagerWithError:(id *)a3
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"030440CB-974B-44F3-8786-7191F302252E"];
  uint64_t v4 = __backingStoreWithUUID(v3, 0);

  return v4;
}

+ (id)cdlsBackingStoreWithHandle:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [v4 backingStoreUUID];
  id v6 = [v4 homeUUID];

  uint64_t v7 = __backingStoreWithUUID(v5, v6);

  return v7;
}

+ (id)cdlsActiveBackingStores
{
  if (cdlsActiveBackingStores_onceToken != -1) {
    dispatch_once(&cdlsActiveBackingStores_onceToken, &__block_literal_global_47787);
  }
  id v2 = (void *)cdlsActiveBackingStores_activeBackingStores;
  return v2;
}

void __52__HMDBackingStore_CoreData__cdlsActiveBackingStores__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  v1 = (void *)cdlsActiveBackingStores_activeBackingStores;
  cdlsActiveBackingStores_activeBackingStores = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextTransactionAuthor, 0);
  objc_storeStrong((id *)&self->_contextName, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lookup, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_local, 0);
  objc_storeStrong((id *)&self->_root, 0);
}

- (NSString)contextTransactionAuthor
{
  return self->_contextTransactionAuthor;
}

- (NSString)contextName
{
  return self->_contextName;
}

- (void)setLocalZone:(id)a3
{
}

- (HMBLocalZone)localZone
{
  return self->_localZone;
}

- (void)setDelegate:(id)a3
{
}

- (HMDBackingStoreObjectProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDBackingStoreObjectProtocol *)WeakRetained;
}

- (HMCContext)context
{
  return self->_context;
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

- (NSUUID)uuid
{
  return self->_uuid;
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
  return 1;
}

- (NSString)activeControllerKeyUsername
{
  id v2 = [MEMORY[0x263F35AD0] systemStore];
  id v3 = [v2 activeControllerPairingIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (id)dataForPersistentStoreIncrementingGeneration:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(HMDBackingStore *)self homeManager];
  id v8 = [v7 _dataForPersistentStoreIncrementingGeneration:v4 reason:v6];

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
  id v2 = +[HMDBackingStoreSingleton sharedInstance];
  id v3 = [v2 queue];

  return v3;
}

- (id)localBackingStore
{
  id v2 = +[HMDBackingStoreSingleton sharedInstance];
  id v3 = [v2 local];

  return v3;
}

- (id)createBackingStoreOperation
{
  id v2 = objc_alloc_init(HMDBackingStoreOperation);
  return v2;
}

- (id)createBackingStoreLogAddTransactionOperationWithTransaction:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HMDBackingStoreLogAddTransactionOperation alloc] initWithTransaction:v3];

  return v4;
}

- (void)submitBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBackingStore *)self home];
  uint64_t v6 = [v5 workQueue];
  if (v6)
  {
    uint64_t v7 = v6;

LABEL_4:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__HMDBackingStore_submitBlock___block_invoke;
    block[3] = &unk_264A2DFA0;
    id v12 = v4;
    id v9 = v4;
    dispatch_async(v7, block);

    return;
  }
  id v8 = [(HMDBackingStore *)self homeManager];
  uint64_t v7 = [v8 workQueue];

  if (v7) {
    goto LABEL_4;
  }
  uint64_t v10 = _HMFPreconditionFailure();
  __31__HMDBackingStore_submitBlock___block_invoke(v10);
}

uint64_t __31__HMDBackingStore_submitBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)logIdentifier
{
  id v2 = [(HMDBackingStore *)self uuid];
  id v3 = [v2 UUIDString];

  return v3;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<HMFBackingStore>"];
}

- (void)commit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 archiveInline:(BOOL)a6 coreDataBlock:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a5;
  BOOL v11 = a4;
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a7;
  Class v15 = (void (**)(id, void *))a8;
  if ([v13 committed])
  {
    long long v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = self;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = [v13 options];
      *(_DWORD *)buf = 138543618;
      __int16 v79 = v19;
      __int16 v80 = 2112;
      uint64_t v81 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@double-committing a transaction probably indicates a bad state (ignoring this commit) for %@.", buf, 0x16u);
    }
    goto LABEL_30;
  }
  [v13 setCommitted:1];
  id v21 = [v13 objects];
  int v22 = objc_msgSend(v21, "hmf_isEmpty");

  if (!v22)
  {
    id v30 = [v13 options];
    uint64_t v31 = [v30 source];

    unint64_t v32 = v31 & 0xFFFFFFFFFFFFFFFELL;
    if (commit_run_save_archiveInline_coreDataBlock_completionHandler___hmf_once_t4 != -1) {
      dispatch_once(&commit_run_save_archiveInline_coreDataBlock_completionHandler___hmf_once_t4, &__block_literal_global_90);
    }
    id v70 = (id)commit_run_save_archiveInline_coreDataBlock_completionHandler___hmf_once_v5;
    id v33 = [(HMDBackingStore *)self home];
    long long v34 = [v13 objects];
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __81__HMDBackingStore_commit_run_save_archiveInline_coreDataBlock_completionHandler___block_invoke_2;
    v75[3] = &unk_264A299C0;
    id v35 = v33;
    id v76 = v35;
    int v36 = objc_msgSend(v34, "na_any:", v75);

    if (v32 == 2) {
      goto LABEL_28;
    }
    if (!v35) {
      goto LABEL_28;
    }
    long long v37 = [v35 administratorHandler];
    int v38 = [v37 shouldRelayMessages];

    if (!v38) {
      goto LABEL_28;
    }
    uint64_t v69 = v35;
    id v39 = [v13 options];
    __int16 v40 = [v39 label];
    int v41 = [v70 containsObject:v40];

    if (v41)
    {
      __int16 v42 = (void *)MEMORY[0x230FBD990]();
      id v43 = self;
      uint64_t v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v45 = id v68 = v42;
        uint64_t v46 = [v13 options];
        int v47 = [v46 label];
        *(_DWORD *)buf = 138543618;
        __int16 v79 = v45;
        __int16 v80 = 2112;
        uint64_t v81 = v47;
        v48 = "%{public}@Transaction '%@' is temporarily allowed even while not the designated writer";
        id v49 = v44;
        os_log_type_t v50 = OS_LOG_TYPE_DEBUG;
LABEL_26:
        _os_log_impl(&dword_22F52A000, v49, v50, v48, buf, 0x16u);

        __int16 v42 = v68;
      }
LABEL_27:
      id v35 = v69;

LABEL_28:
      [(HMDBackingStore *)self cdlsCommit:v13 run:v11 save:v10 coreDataBlock:v14 completionHandler:v15];
LABEL_29:

      goto LABEL_30;
    }
    if (v36)
    {
      __int16 v42 = (void *)MEMORY[0x230FBD990]();
      id v51 = self;
      uint64_t v44 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO)) {
        goto LABEL_27;
      }
      HMFGetLogIdentifier();
      v45 = id v68 = v42;
      uint64_t v46 = [v13 options];
      int v47 = [v46 label];
      *(_DWORD *)buf = 138543618;
      __int16 v79 = v45;
      __int16 v80 = 2112;
      uint64_t v81 = v47;
      v48 = "%{public}@Transaction '%@' is allowed even while not the designated writer because it is an allowed local fallback";
    }
    else
    {
      id v52 = [v13 options];
      uint64_t v53 = [v52 cdTransactionAuthor];

      __int16 v42 = (void *)MEMORY[0x230FBD990]();
      uint64_t v54 = self;
      v55 = HMFGetOSLogHandle();
      uint64_t v44 = v55;
      if (v53 != 10)
      {
        id v35 = v69;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          id v56 = HMFGetLogIdentifier();
          [v13 options];
          v58 = __int16 v57 = v42;
          __int16 v59 = [v69 enabledResidents];
          double v60 = objc_msgSend(v59, "na_map:", &__block_literal_global_101);
          *(_DWORD *)buf = 138543874;
          __int16 v79 = v56;
          __int16 v80 = 2112;
          uint64_t v81 = v58;
          __int16 v82 = 2114;
          id v83 = v60;
          _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@Rejecting transaction commit while not designated writer: %@, residents: %{public}@", buf, 0x20u);

          id v35 = v69;
          __int16 v42 = v57;
        }
        uint64_t v61 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
        if (v15)
        {
          v15[2](v15, v61);
        }
        else
        {
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          v62 = [v13 objects];
          uint64_t v63 = [v62 countByEnumeratingWithState:&v71 objects:v77 count:16];
          if (v63)
          {
            uint64_t v64 = v63;
            uint64_t v65 = *(void *)v72;
            do
            {
              for (uint64_t i = 0; i != v64; ++i)
              {
                if (*(void *)v72 != v65) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v67 = [*(id *)(*((void *)&v71 + 1) + 8 * i) message];
                [v67 respondWithError:v61];
              }
              uint64_t v64 = [v62 countByEnumeratingWithState:&v71 objects:v77 count:16];
            }
            while (v64);
          }

          id v35 = v69;
        }

        goto LABEL_29;
      }
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO)) {
        goto LABEL_27;
      }
      HMFGetLogIdentifier();
      v45 = id v68 = v42;
      uint64_t v46 = [v13 options];
      int v47 = [v46 label];
      *(_DWORD *)buf = 138543618;
      __int16 v79 = v45;
      __int16 v80 = 2112;
      uint64_t v81 = v47;
      v48 = "%{public}@Transaction '%@' is allowed even while not the designated writer because it is a force push";
    }
    id v49 = v44;
    os_log_type_t v50 = OS_LOG_TYPE_INFO;
    goto LABEL_26;
  }
  id v23 = (void *)MEMORY[0x230FBD990]();
  id v24 = self;
  int v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = HMFGetLogIdentifier();
    __int16 v27 = [v13 options];
    *(_DWORD *)buf = 138543618;
    __int16 v79 = v26;
    __int16 v80 = 2112;
    uint64_t v81 = v27;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Rejecting empty transaction: %@", buf, 0x16u);
  }
  uint64_t v28 = (void (**)(void *, void *))_Block_copy(v15);
  if (v28)
  {
    __int16 v29 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    v28[2](v28, v29);
  }
LABEL_30:
}

uint64_t __81__HMDBackingStore_commit_run_save_archiveInline_coreDataBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 administratorHandler];
  id v5 = [v3 message];

  uint64_t v6 = [v4 allowLocalFallbackForMessage:v5];
  return v6;
}

uint64_t __81__HMDBackingStore_commit_run_save_archiveInline_coreDataBlock_completionHandler___block_invoke_98(uint64_t a1, void *a2)
{
  return [a2 shortDescription];
}

void __81__HMDBackingStore_commit_run_save_archiveInline_coreDataBlock_completionHandler___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithArray:&unk_26E4744A0];
  v1 = (void *)commit_run_save_archiveInline_coreDataBlock_completionHandler___hmf_once_v5;
  commit_run_save_archiveInline_coreDataBlock_completionHandler___hmf_once_id v5 = v0;
}

- (void)commit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 coreDataBlock:(id)a6 completionHandler:(id)a7
{
}

- (id)transaction:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[HMDBackingStoreTransactionBlock alloc] initWithBackingStore:self options:v6 label:v7];

  return v8;
}

- (void)setContext:(id)a3
{
  id v4 = (HMCContext *)a3;
  id v5 = [(HMCContext *)v4 name];
  contextName = self->_contextName;
  self->_contextName = v5;

  id v7 = [(HMCContext *)v4 transactionAuthor];
  contextTransactionAuthor = self->_contextTransactionAuthor;
  self->_contextTransactionAuthor = v7;

  context = self->_context;
  self->_context = v4;
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
  Class v15 = [(HMDBackingStore *)&v26 init];
  if (v15)
  {
    uint64_t v16 = [v14 localBackingStore];
    local = v15->_local;
    v15->_local = (HMDBackingStoreLocal *)v16;

    objc_storeStrong((id *)&v15->_uuid, a3);
    id v18 = objc_alloc(MEMORY[0x263EFD7E8]);
    id v19 = [v11 UUIDString];
    uint64_t v20 = [v18 initWithRecordName:v19];
    root = v15->_root;
    v15->_root = (CKRecordID *)v20;

    objc_storeWeak((id *)&v15->_home, v13);
    objc_storeWeak((id *)&v15->_homeManager, v12);
    objc_storeWeak((id *)&v15->_dataSource, v14);
    if (v13)
    {
      int v22 = [v14 createHomeObjectLookupWithHome:v13];
    }
    else
    {
      if (!v12)
      {
LABEL_7:
        id v24 = v15;
        goto LABEL_8;
      }
      int v22 = [[HMDHomeManagerObjectLookup alloc] initWithHomeManager:v12];
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
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = (id *)a6;
  BOOL v13 = isWatch();
  id v14 = (void *)MEMORY[0x230FBD990](v13);
  id v15 = a1;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v74 = v17;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Running HMDBackingStoreSaveToPersistentStore operation to save.", buf, 0xCu);
  }
  id v18 = [MEMORY[0x263F35AD0] systemStore];
  id v19 = [v18 activeControllerPairingIdentifier];
  uint64_t v20 = (void *)[v19 copy];

  if (v20)
  {
    id v21 = v10;
    if (v12)
    {
      id WeakRetained = objc_loadWeakRetained(v12 + 10);
      id v23 = [WeakRetained activeControllerKeyUsername];

      if (v23)
      {
        id v69 = v11;
        id v70 = v23;
        id v68 = v21;
        id v24 = v21;
        id v25 = objc_loadWeakRetained(v12 + 10);
        objc_super v26 = (void *)MEMORY[0x230FBD990]();
        uint64_t v67 = v24;
        __int16 v27 = [v25 dataForPersistentStoreIncrementingGeneration:v7 reason:v24];
        uint64_t v28 = v27;
        if (v27 && [v27 length])
        {
          id v65 = v25;
          __int16 v29 = (void *)MEMORY[0x230FBD990]();
          id v30 = v12;
          uint64_t v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            unint64_t v32 = v64 = v29;
            id v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "length"));
            *(_DWORD *)buf = 138543874;
            long long v74 = v32;
            __int16 v75 = 2112;
            id v76 = v70;
            __int16 v77 = 2112;
            uint64_t v78 = v33;
            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Controller User Name : [%@], Saving home data size: %@", buf, 0x20u);

            __int16 v29 = v64;
          }

          long long v34 = [v30 local];
          id v71 = 0;
          [v34 _insertArchive:v28 identifier:@"homedata" controllerUserName:v70 error:&v71];
          id v35 = v71;

          id v11 = v69;
          id v25 = v65;
          if (!v35)
          {
            if (((_BYTE)v30[1] & 1) == 0)
            {
              int v36 = (void *)MEMORY[0x230FBD990]();
              long long v37 = v30;
              int v38 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                id v39 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                long long v74 = v39;
                _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Will attempt to remove legacy archive", buf, 0xCu);
              }
              __int16 v40 = [v37 homeManager];
              id v72 = 0;
              char v41 = [v40 _removeLegacyHomeArchive:&v72];
              id v42 = v72;

              if (v41)
              {
                *((unsigned char *)v37 + 8) = 1;
              }
              else
              {
                uint64_t v61 = (void *)MEMORY[0x230FBD990]();
                v62 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v63 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  long long v74 = v63;
                  __int16 v75 = 2112;
                  id v76 = v42;
                  _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove home data error:%@", buf, 0x16u);
                }
              }
              id v25 = v65;
            }
            id v35 = 0;
          }
        }
        else
        {
          int v47 = (void *)MEMORY[0x230FBD990]();
          v48 = v12;
          id v49 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v66 = v20;
            os_log_type_t v50 = v23;
            id v51 = v10;
            id v52 = v26;
            v54 = id v53 = v25;
            *(_DWORD *)buf = 138543362;
            long long v74 = v54;
            _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_INFO, "%{public}@No home data to save.", buf, 0xCu);

            id v25 = v53;
            objc_super v26 = v52;
            id v10 = v51;
            id v23 = v50;
            uint64_t v20 = v66;
          }

          id v35 = 0;
          id v11 = v69;
        }

        id v21 = v68;
      }
      else
      {
        v55 = (void *)MEMORY[0x230FBD990]();
        id v56 = v12;
        __int16 v57 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v59 = id v58 = v21;
          *(_DWORD *)buf = 138543362;
          long long v74 = v59;
          _os_log_impl(&dword_22F52A000, v57, OS_LOG_TYPE_ERROR, "%{public}@Could not find controller key when trying to save home archive", buf, 0xCu);

          id v21 = v58;
        }

        id v35 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      }
    }
    else
    {
      id v35 = 0;
    }
  }
  else
  {
    id v43 = (void *)MEMORY[0x230FBD990]();
    id v44 = v15;
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      uint64_t v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v74 = v46;
      _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Could not find controller key when trying to run transaction", buf, 0xCu);
    }
    id v35 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  }

  return v35;
}

+ (void)saveToPersistentStoreWithReason:(id)a3 homeManager:(id)a4 shouldIncrementGenerationCounter:(BOOL)a5 backingStore:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __127__HMDBackingStore_saveToPersistentStoreWithReason_homeManager_shouldIncrementGenerationCounter_backingStore_completionHandler___block_invoke;
  v20[3] = &unk_264A29A08;
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

void __127__HMDBackingStore_saveToPersistentStoreWithReason_homeManager_shouldIncrementGenerationCounter_backingStore_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() _saveToLocalStoreWithReason:*(void *)(a1 + 32) homeManager:*(void *)(a1 + 40) shouldIncrementGenerationCounter:*(unsigned __int8 *)(a1 + 72) backingStore:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    id v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    id v2 = v4;
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_231298 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_231298, &__block_literal_global_106_231299);
  }
  id v2 = (void *)logCategory__hmf_once_v11_231300;
  return v2;
}

void __30__HMDBackingStore_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v11_231300;
  logCategory__hmf_once_v11_231300 = v0;
}

+ (NSSet)internalAllowedTypes
{
  if (internalAllowedTypes_onceToken != -1) {
    dispatch_once(&internalAllowedTypes_onceToken, &__block_literal_global_81_231305);
  }
  id v2 = (void *)internalAllowedTypes__internalAllowedTypes;
  return (NSSet *)v2;
}

void __39__HMDBackingStore_internalAllowedTypes__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  id v4 = +[HMDBackingStore allowedTypes];
  v1 = [v0 setWithSet:v4];
  uint64_t v2 = [v1 setByAddingObject:objc_opt_class()];
  uint64_t v3 = (void *)internalAllowedTypes__internalAllowedTypes;
  internalAllowedTypes__internalAllowedTypes = v2;
}

+ (NSSet)deeplyProblematicObjectTypes
{
  if (deeplyProblematicObjectTypes_onceToken != -1) {
    dispatch_once(&deeplyProblematicObjectTypes_onceToken, &__block_literal_global_73_231309);
  }
  uint64_t v2 = (void *)deeplyProblematicObjectTypes__neverAllowedTypes;
  return (NSSet *)v2;
}

void __47__HMDBackingStore_deeplyProblematicObjectTypes__block_invoke()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  uint64_t v3 = (void *)deeplyProblematicObjectTypes__neverAllowedTypes;
  deeplyProblematicObjectTypes__neverAllowedTypes = v2;
}

+ (NSSet)allowedTypes
{
  if (allowedTypes_onceToken_231318 != -1) {
    dispatch_once(&allowedTypes_onceToken_231318, &__block_literal_global_231319);
  }
  uint64_t v2 = (void *)allowedTypes__allowedTypes_231320;
  return (NSSet *)v2;
}

void __31__HMDBackingStore_allowedTypes__block_invoke()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  uint64_t v3 = (void *)allowedTypes__allowedTypes_231320;
  allowedTypes__allowedTypes_231320 = v2;
}

@end