@interface HMBLocalZone
+ (BOOL)shouldMirrorInputExternalData:(id)a3 overwriteExistingExternalData:(id)a4;
+ (id)logCategory;
+ (id)outputBlockRowForTuple:(id)a3 activity:(id)a4;
+ (id)outputModelFromUpdateModel:(id)a3 mergedModel:(id)a4;
- (BOOL)_insertDeletionItemsForModelsAndDescendantModelsWithBlockRow:(unint64_t)a3 context:(id)a4 type:(unint64_t)a5 modelIDs:(id)a6 currentDepth:(unint64_t)a7 maximumDepth:(unint64_t)a8 options:(id)a9 error:(id *)a10;
- (BOOL)destroyWithError:(id *)a3;
- (BOOL)hasStartedUp;
- (BOOL)removeAllRecordsWithError:(id *)a3;
- (BOOL)removeBlockWithRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeOutputBlockWithRow:(unint64_t)a3 error:(id *)a4;
- (HMBLocalDatabase)localDatabase;
- (HMBLocalSQLContext)sql;
- (HMBLocalZone)initWithLocalDatabase:(id)a3 zoneID:(id)a4 zoneRow:(unint64_t)a5 configuration:(id)a6 mirror:(id)a7;
- (HMBLocalZoneConfiguration)configuration;
- (HMBLocalZoneDelegate)delegate;
- (HMBLocalZoneID)zoneID;
- (HMBMirrorProtocol)mirror;
- (HMBModelContainer)modelContainer;
- (NAFuture)shutdownFuture;
- (NSHashTable)mirrorOutputObservers;
- (NSHashTable)observersForAllModels;
- (NSMutableDictionary)modelObserversByModelID;
- (id)addModels:(id)a3 andRemoveModelIDs:(id)a4 options:(id)a5;
- (id)addModels:(id)a3 options:(id)a4;
- (id)allMirrorOutputObservers;
- (id)attributeDescriptions;
- (id)countModelsUsingQuery:(id)a3 arguments:(id)a4 error:(id *)a5;
- (id)createInputBlockWithType:(unint64_t)a3 error:(id *)a4;
- (id)createLocalInputWithError:(id *)a3;
- (id)createMirrorInputWithError:(id *)a3;
- (id)createModels:(id)a3 options:(id)a4;
- (id)createOutputBlockWithError:(id *)a3;
- (id)externalDataForExternalID:(id)a3 error:(id *)a4;
- (id)externalDataForModelID:(id)a3 error:(id *)a4;
- (id)externalIDForModelID:(id)a3 error:(id *)a4;
- (id)fetchAllModelsWithError:(id *)a3;
- (id)fetchExternalIDsForModelIDs:(id)a3 error:(id *)a4;
- (id)fetchItemsInBlock:(id)a3 error:(id *)a4;
- (id)fetchModelWithModelID:(id)a3 error:(id *)a4;
- (id)fetchModelWithModelID:(id)a3 ofType:(Class)a4 error:(id *)a5;
- (id)fetchModelWithModelID:(id)a3 recordRow:(unint64_t *)a4 error:(id *)a5;
- (id)fetchModelWithRecordRow:(unint64_t)a3 error:(id *)a4;
- (id)fetchModels;
- (id)fetchModelsOfType:(Class)a3 error:(id *)a4;
- (id)fetchModelsWithParentModelID:(id)a3 error:(id *)a4;
- (id)fetchModelsWithParentModelID:(id)a3 ofType:(Class)a4 error:(id *)a5;
- (id)fetchOptionsForOutputBlock:(unint64_t)a3 error:(id *)a4;
- (id)fetchReadyBlocksWithType:(unint64_t)a3 error:(id *)a4;
- (id)fetchRecordRowWithExternalID:(id)a3 returning:(unint64_t)a4 error:(id *)a5;
- (id)fetchRecordRowWithModelID:(id)a3 returning:(unint64_t)a4 error:(id *)a5;
- (id)fetchRecordsForOutputBlock:(unint64_t)a3 error:(id *)a4;
- (id)flush;
- (id)logIdentifier;
- (id)markGroupAsSentWithOutputBlock:(unint64_t)a3 tuples:(id)a4;
- (id)modelFromData:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 recordRowID:(unint64_t)a6 error:(id *)a7;
- (id)modelFromRecord:(id)a3 storageLocation:(unint64_t)a4 error:(id *)a5;
- (id)modelIDForExternalID:(id)a3 error:(id *)a4;
- (id)observersForModelWithID:(id)a3;
- (id)queryAllRowRecordsReturning:(unint64_t)a3;
- (id)queryModelsOfType:(Class)a3;
- (id)queryModelsOfType:(Class)a3 filter:(id)a4;
- (id)queryModelsOfType:(Class)a3 predicate:(id)a4;
- (id)queryModelsOfType:(Class)a3 properties:(id)a4 filter:(id)a5;
- (id)queryModelsRecursivelyStartingWithModelID:(id)a3;
- (id)queryModelsUsingQuery:(id)a3;
- (id)queryModelsUsingQuery:(id)a3 arguments:(id)a4;
- (id)queryModelsWithParentModelID:(id)a3;
- (id)queryModelsWithParentModelID:(id)a3 ofType:(Class)a4;
- (id)remove:(id)a3;
- (id)removeAllModelsOfTypes:(id)a3 options:(id)a4;
- (id)removeModelIDs:(id)a3 options:(id)a4;
- (id)removeModelsAndDescendantModelsWithIDs:(id)a3 depth:(unint64_t)a4 options:(id)a5;
- (id)removeModelsWithParentModelID:(id)a3 options:(id)a4;
- (id)setExternalData:(id)a3 forExternalID:(id)a4;
- (id)setExternalData:(id)a3 forModelID:(id)a4;
- (id)setExternalID:(id)a3 externalData:(id)a4 forRecordRow:(unint64_t)a5;
- (id)shutdown;
- (id)triggerProcessForBlockRow:(unint64_t)a3;
- (id)update:(id)a3;
- (id)update:(id)a3 remove:(id)a4;
- (id)updateModels:(id)a3 andRemoveModelIDs:(id)a4 options:(id)a5;
- (id)updateModels:(id)a3 options:(id)a4;
- (unint64_t)insertBlockToRemoveAllModelsWithType:(unint64_t)a3 modelTypes:(id)a4 options:(id)a5 error:(id *)a6;
- (unint64_t)insertBlockToRemoveChildModelsWithType:(unint64_t)a3 parentModelID:(id)a4 options:(id)a5 error:(id *)a6;
- (unint64_t)insertBlockToRemoveModelsAndDescendantModelsWithType:(unint64_t)a3 modelIDs:(id)a4 depth:(unint64_t)a5 options:(id)a6 error:(id *)a7;
- (unint64_t)insertBlockWithType:(unint64_t)a3 options:(id)a4 items:(id)a5 error:(id *)a6;
- (unint64_t)zoneRow;
- (void)addMirrorOutputObserver:(id)a3;
- (void)addObserver:(id)a3 forModelWithID:(id)a4;
- (void)addObserverForAllModels:(id)a3;
- (void)dealloc;
- (void)migrateUnsupportedModels;
- (void)queueIncompleteProcesses;
- (void)rebuildIndexesIfNeeded;
- (void)removeMirrorOutputObserver:(id)a3;
- (void)removeObserver:(id)a3 forModelWithID:(id)a4;
- (void)removeObserverForAllModels:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasStartedUp:(BOOL)a3;
- (void)setLocalDatabase:(id)a3;
- (void)setShutdownFuture:(id)a3;
- (void)setZoneRow:(unint64_t)a3;
- (void)startUp;
@end

@implementation HMBLocalZone

- (id)triggerProcessForBlockRow:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F7A0E8]);
  objc_initWeak(&location, self);
  v6 = [(HMBLocalZone *)self localDatabase];
  v7 = [v6 queue];
  v8 = (void *)MEMORY[0x1E4F28B48];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __51__HMBLocalZone_Process__triggerProcessForBlockRow___block_invoke;
  v16 = &unk_1E69E9690;
  objc_copyWeak(v18, &location);
  id v9 = v5;
  id v17 = v9;
  v18[1] = (id)a3;
  v10 = [v8 blockOperationWithBlock:&v13];
  objc_msgSend(v7, "addOperation:", v10, v13, v14, v15, v16);

  v11 = [v9 future];

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  return v11;
}

void __51__HMBLocalZone_Process__triggerProcessForBlockRow___block_invoke(void **a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    __processRecords(WeakRetained, a1[6], a1[4]);
  }
  else
  {
    v4 = (void *)MEMORY[0x1D944CB30]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = HMFGetLogIdentifier();
      int v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_ERROR, "%{public}@lost self for processing block!", (uint8_t *)&v9, 0xCu);
    }
    v7 = a1[4];
    v8 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    [v7 finishWithError:v8];
  }
}

- (void)queueIncompleteProcesses
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v3 = [(HMBLocalZone *)self sql];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __49__HMBLocalZone_Process__queueIncompleteProcesses__block_invoke;
  v52[3] = &unk_1E69EB758;
  v52[4] = self;
  uint64_t v4 = [v3 sqlBlockWithActivity:0 block:v52];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D944CB30]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v56 = v8;
      __int16 v57 = 2112;
      uint64_t v58 = v4;
      _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete null items/blocks: %@", buf, 0x16u);
    }
  }
  v40 = (void *)v4;
  int v9 = [HMBLocalSQLIteratorRowRollbackBlock alloc];
  v10 = [(HMBLocalZone *)self sql];
  uint64_t v11 = [(HMBLocalSQLIteratorRowRollbackBlock *)v9 initWithSQLContext:v10 zoneRow:[(HMBLocalZone *)self zoneRow]];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v11;
  uint64_t v12 = [(HMBLocalSQLIteratorRowRollbackBlock *)obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v17 = (void *)MEMORY[0x1D944CB30]();
        v18 = self;
        v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v56 = v20;
          __int16 v57 = 2112;
          uint64_t v58 = (uint64_t)v16;
          _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Rolling back block: %@", buf, 0x16u);
        }
        __rollbackBlock(v18, v16);
      }
      uint64_t v13 = [(HMBLocalSQLIteratorRowRollbackBlock *)obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v13);
  }

  v21 = [HMBLocalSQLIteratorRowInputBlock alloc];
  v22 = [(HMBLocalZone *)self sql];
  v23 = [(HMBLocalSQLIteratorRowInputBlock *)v21 initWithSQLContext:v22 zoneRow:[(HMBLocalZone *)self zoneRow]];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v41 = v23;
  uint64_t v24 = [(HMBLocalSQLIteratorRowInputBlock *)v41 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v45 != v26) {
          objc_enumerationMutation(v41);
        }
        v28 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        v29 = (void *)MEMORY[0x1D944CB30]();
        v30 = self;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v56 = v32;
          __int16 v57 = 2112;
          uint64_t v58 = (uint64_t)v28;
          _os_log_impl(&dword_1D4693000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Processing input block: %@", buf, 0x16u);
        }
        id v33 = objc_alloc_init(MEMORY[0x1E4F7A0E8]);
        __processRecords(v30, (void *)[v28 blockRow], v33);
      }
      uint64_t v25 = [(HMBLocalSQLIteratorRowInputBlock *)v41 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v25);
  }

  v34 = [(HMBLocalZone *)self sql];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __49__HMBLocalZone_Process__queueIncompleteProcesses__block_invoke_83;
  v43[3] = &unk_1E69EB758;
  v43[4] = self;
  v35 = [v34 sqlBlockWithActivity:0 block:v43];

  if (v35)
  {
    v36 = (void *)MEMORY[0x1D944CB30]();
    v37 = self;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v56 = v39;
      __int16 v57 = 2112;
      uint64_t v58 = (uint64_t)v35;
      _os_log_impl(&dword_1D4693000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete zombie records: %@", buf, 0x16u);
    }
  }
}

id __49__HMBLocalZone_Process__queueIncompleteProcesses__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v10 = 0;
  objc_msgSend(v4, "_deleteNullItemsWithZoneRow:error:", objc_msgSend(v3, "zoneRow"), &v10);
  id v5 = v10;
  uint64_t v6 = [*(id *)(a1 + 32) zoneRow];
  id v9 = v5;
  [v4 _deleteNullBlocksWithZoneRow:v6 error:&v9];

  id v7 = v9;
  return v7;
}

id __49__HMBLocalZone_Process__queueIncompleteProcesses__block_invoke_83(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = 0;
  objc_msgSend(v3, "_deleteZombieRecordsWithZoneRow:error:", objc_msgSend(v2, "zoneRow"), &v6);

  id v4 = v6;
  return v4;
}

- (id)observersForModelWithID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_lock_lock_with_options();
  id v6 = [(HMBLocalZone *)self modelObserversByModelID];
  id v7 = [v6 objectForKeyedSubscript:v4];
  v8 = [v7 allObjects];
  [v5 addObjectsFromArray:v8];

  id v9 = [(HMBLocalZone *)self observersForAllModels];
  id v10 = [v9 allObjects];
  [v5 addObjectsFromArray:v10];

  os_unfair_lock_unlock(&self->_propertyLock);
  uint64_t v11 = (void *)MEMORY[0x1D944CB30]();
  uint64_t v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    v15 = [v5 hmbDescription];
    int v18 = 138543874;
    v19 = v14;
    __int16 v20 = 2112;
    id v21 = v4;
    __int16 v22 = 2112;
    v23 = v15;
    _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Notifying observers for model ID %@: %@", (uint8_t *)&v18, 0x20u);
  }
  v16 = (void *)[v5 copy];

  return v16;
}

+ (id)outputModelFromUpdateModel:(id)a3 mergedModel:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)[a4 copy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = objc_msgSend((id)objc_opt_class(), "hmbExternalProperties", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [v5 hmbSetProperties];
        char v14 = [v13 containsObject:v12];

        if ((v14 & 1) == 0) {
          [v6 hmbUnsetPropertyNamed:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (BOOL)shouldMirrorInputExternalData:(id)a3 overwriteExistingExternalData:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7)
    {
      id v39 = 0;
      uint64_t v9 = [MEMORY[0x1E4F1A2D8] recordFromExternalData:v6 error:&v39];
      id v10 = v39;
      if (v9)
      {
        id v38 = v10;
        uint64_t v11 = [MEMORY[0x1E4F1A2D8] recordFromExternalData:v8 error:&v38];
        id v12 = v38;

        uint64_t v13 = (void *)MEMORY[0x1D944CB30]();
        id v14 = a1;
        v15 = HMFGetOSLogHandle();
        long long v16 = v15;
        if (v11)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            long long v17 = HMFGetLogIdentifier();
            [v9 modificationDate];
            long long v18 = v37 = v12;
            long long v19 = [v11 modificationDate];
            *(_DWORD *)buf = 138543874;
            v41 = v17;
            __int16 v42 = 2112;
            id v43 = v18;
            __int16 v44 = 2112;
            long long v45 = v19;
            _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_INFO, "%{public}@Comparing mirror input modification date %@ with existing record modification date %@", buf, 0x20u);

            id v12 = v37;
          }

          __int16 v20 = [v9 modificationDate];
          uint64_t v21 = [v11 modificationDate];
          BOOL v22 = [v20 compare:v21] == 1;
        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v35 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v41 = v35;
            __int16 v42 = 2112;
            id v43 = v12;
            _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode record from existing external data: %@", buf, 0x16u);
          }
          BOOL v22 = 1;
        }

        id v10 = v12;
      }
      else
      {
        v31 = (void *)MEMORY[0x1D944CB30]();
        id v32 = a1;
        id v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v41 = v34;
          __int16 v42 = 2112;
          id v43 = v10;
          _os_log_impl(&dword_1D4693000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode record from mirror input external data: %@", buf, 0x16u);
        }
        BOOL v22 = 0;
      }
    }
    else
    {
      v27 = (void *)MEMORY[0x1D944CB30]();
      id v28 = a1;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v41 = v30;
        _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_INFO, "%{public}@Existing external data was nil when comparing against mirror input external data", buf, 0xCu);
      }
      BOOL v22 = 1;
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x1D944CB30]();
    id v24 = a1;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v41 = v26;
      _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_ERROR, "%{public}@Mirror input external data was nil when comparing against existing external data", buf, 0xCu);
    }
    BOOL v22 = 0;
  }

  return v22;
}

+ (id)outputBlockRowForTuple:(id)a3 activity:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 previousContext];
  uint64_t v9 = [v8 model];

  id v10 = [v6 updateModel];
  uint64_t v11 = objc_opt_class();
  if (!v11) {
    uint64_t v11 = objc_opt_class();
  }
  if ([v11 hmbExcludeFromCloudStorage])
  {
    uint64_t v12 = MEMORY[0x1D944CB30]();
    id v13 = a1;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = v12;
      v15 = HMFGetLogIdentifier();
      id v34 = v7;
      long long v16 = [v7 identifier];
      long long v17 = [v16 shortDescription];
      long long v18 = [v9 hmbModelID];
      long long v19 = v18;
      if (!v18)
      {
        long long v19 = [v10 hmbModelID];
      }
      *(_DWORD *)buf = 138544130;
      id v38 = v15;
      __int16 v39 = 2114;
      v40 = v17;
      __int16 v41 = 2112;
      __int16 v42 = v19;
      __int16 v43 = 2048;
      uint64_t v44 = [v6 itemRow];
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Skipping mirror output push for model ID %@ and row %ld since the model is set to exclude cloud storage", buf, 0x2Au);
      if (!v18) {

      }
      uint64_t v12 = v33;
      id v7 = v34;
    }

    __int16 v20 = (void *)v12;
LABEL_15:
    v31 = 0;
    goto LABEL_17;
  }
  uint64_t v21 = [v10 hmbSetProperties];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __57__HMBLocalZone_Process__outputBlockRowForTuple_activity___block_invoke;
  v36[3] = &__block_descriptor_40_e18_B16__0__NSString_8lu32l8;
  v36[4] = v11;
  int v22 = objc_msgSend(v21, "na_all:", v36);

  if (v22)
  {
    uint64_t v23 = MEMORY[0x1D944CB30]();
    id v24 = a1;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      v27 = [v7 identifier];
      [v27 shortDescription];
      id v28 = v35 = v7;
      v29 = [v10 hmbModelID];
      uint64_t v30 = [v6 itemRow];
      *(_DWORD *)buf = 138544130;
      id v38 = v26;
      __int16 v39 = 2114;
      v40 = v28;
      __int16 v41 = 2112;
      __int16 v42 = v29;
      __int16 v43 = 2048;
      uint64_t v44 = v30;
      _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Skipping mirror output push for updated model ID %@ and row %ld since the only set properties are excluded from cloud storage", buf, 0x2Au);

      id v7 = v35;
    }

    __int16 v20 = (void *)v23;
    goto LABEL_15;
  }
  v31 = [v6 outputBlockRow];
LABEL_17:

  return v31;
}

BOOL __57__HMBLocalZone_Process__outputBlockRowForTuple_activity___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 hmbProperties];
  id v5 = [v4 objectForKeyedSubscript:v3];

  if ([v5 excludeFromCloudStorage])
  {
    id v6 = [v5 externalRecordField];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutdownFuture, 0);
  objc_storeStrong((id *)&self->_sql, 0);
  objc_storeStrong((id *)&self->_mirrorOutputObservers, 0);
  objc_storeStrong((id *)&self->_modelObserversByModelID, 0);
  objc_storeStrong((id *)&self->_observersForAllModels, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mirror, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_modelContainer, 0);
  objc_destroyWeak((id *)&self->_localDatabase);
}

- (void)setShutdownFuture:(id)a3
{
}

- (NAFuture)shutdownFuture
{
  return self->_shutdownFuture;
}

- (void)setHasStartedUp:(BOOL)a3
{
  self->_hasStartedUp = a3;
}

- (BOOL)hasStartedUp
{
  return self->_hasStartedUp;
}

- (HMBLocalSQLContext)sql
{
  return self->_sql;
}

- (NSHashTable)mirrorOutputObservers
{
  return self->_mirrorOutputObservers;
}

- (NSMutableDictionary)modelObserversByModelID
{
  return self->_modelObserversByModelID;
}

- (NSHashTable)observersForAllModels
{
  return self->_observersForAllModels;
}

- (void)setDelegate:(id)a3
{
}

- (HMBLocalZoneDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMBLocalZoneDelegate *)WeakRetained;
}

- (HMBMirrorProtocol)mirror
{
  return self->_mirror;
}

- (HMBLocalZoneID)zoneID
{
  return self->_zoneID;
}

- (HMBLocalZoneConfiguration)configuration
{
  return self->_configuration;
}

- (HMBModelContainer)modelContainer
{
  return self->_modelContainer;
}

- (void)setLocalDatabase:(id)a3
{
}

- (HMBLocalDatabase)localDatabase
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDatabase);
  return (HMBLocalDatabase *)WeakRetained;
}

- (id)attributeDescriptions
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMBLocalZone *)self localDatabase];
  id v5 = [v4 logIdentifier];
  id v6 = (void *)[v3 initWithName:@"Database" value:v5];
  v12[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v8 = [(HMBLocalZone *)self zoneID];
  uint64_t v9 = (void *)[v7 initWithName:@"Zone ID" value:v8];
  v12[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v10;
}

- (id)logIdentifier
{
  v2 = [(HMBLocalZone *)self zoneID];
  id v3 = [v2 name];

  return v3;
}

- (id)shutdown
{
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMBLocalZone *)self shutdownFuture];

  if (!v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __24__HMBLocalZone_shutdown__block_invoke;
    v10[3] = &unk_1E69EA378;
    v10[4] = self;
    id v5 = [MEMORY[0x1E4F7A0D8] lazyFutureWithBlock:v10];
    [(HMBLocalZone *)self setShutdownFuture:v5];
  }
  id v6 = [(HMBLocalZone *)self shutdownFuture];
  os_unfair_lock_unlock(p_propertyLock);
  if (!v4)
  {
    id v7 = [(HMBLocalZone *)self localDatabase];
    [v7 handleLocalZoneShutdown:self];

    id v8 = (id)[v6 recoverIgnoringError];
  }
  return v6;
}

void __24__HMBLocalZone_shutdown__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) mirror];
  id v5 = [v4 shutdown];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  id v8 = v7;

  uint64_t v9 = [v8 recoverIgnoringError];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __24__HMBLocalZone_shutdown__block_invoke_2;
  void v12[3] = &unk_1E69EA668;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v3;
  id v10 = v3;
  id v11 = (id)[v9 addSuccessBlock:v12];
}

void __24__HMBLocalZone_shutdown__block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) flush];
  v2 = [v5 recoverIgnoringError];
  id v3 = [*(id *)(a1 + 40) completionHandlerAdapter];
  id v4 = (id)[v2 addCompletionBlock:v3];
}

- (id)createLocalInputWithError:(id *)a3
{
  id v4 = [(HMBLocalZone *)self createInputBlockWithType:2 error:a3];
  if (v4) {
    id v5 = [(HMBLocalZoneInput *)[HMBLocalZoneLocalInput alloc] initWithLocalZone:self inputBlock:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)removeAllModelsOfTypes:(id)a3 options:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D944CB30]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v6 hmbDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v33 = v11;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 2112;
    id v37 = v7;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing all models of types %@ and options %@", buf, 0x20u);
  }
  id v31 = 0;
  id v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v31];
  id v14 = v31;
  if (v13)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __47__HMBLocalZone_removeAllModelsOfTypes_options___block_invoke;
    v30[3] = &unk_1E69E9A40;
    v30[4] = v9;
    v15 = objc_msgSend(v6, "na_map:", v30);
    id v29 = v14;
    uint64_t v16 = [(HMBLocalZone *)v9 insertBlockToRemoveAllModelsWithType:2 modelTypes:v15 options:v13 error:&v29];
    id v17 = v29;

    if (v17)
    {
      long long v18 = (void *)MEMORY[0x1D944CB30]();
      long long v19 = v9;
      __int16 v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v33 = v21;
        __int16 v34 = 2112;
        id v35 = v6;
        __int16 v36 = 2112;
        id v37 = v17;
        _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage removal for all models of types %@: %@", buf, 0x20u);
      }
      uint64_t v22 = [MEMORY[0x1E4F7A0D8] futureWithError:v17];
    }
    else
    {
      uint64_t v22 = [(HMBLocalZone *)v9 triggerProcessForBlockRow:v16];
    }
    v27 = (void *)v22;

    id v14 = v17;
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1D944CB30]();
    id v24 = v9;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = v26;
      __int16 v34 = 2112;
      id v35 = v7;
      __int16 v36 = 2112;
      id v37 = v14;
      _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode processing options %@: %@", buf, 0x20u);
    }
    v27 = [MEMORY[0x1E4F7A0D8] futureWithError:v14];
  }

  return v27;
}

id __47__HMBLocalZone_removeAllModelsOfTypes_options___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) modelContainer];
  id v4 = [v3 typeNameForModelClass:a2];

  return v4;
}

- (id)removeModelsAndDescendantModelsWithIDs:(id)a3 depth:(unint64_t)a4 options:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1D944CB30]();
  id v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    id v14 = [v8 hmbDescription];
    *(_DWORD *)buf = 138544130;
    uint64_t v33 = v13;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2048;
    unint64_t v37 = a4;
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing models and descendant models with IDs: %@ depth: %lu options: %@", buf, 0x2Au);
  }
  id v31 = 0;
  v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v31];
  id v16 = v31;
  id v17 = v16;
  if (v15)
  {
    id v30 = v16;
    uint64_t v18 = [(HMBLocalZone *)v11 insertBlockToRemoveModelsAndDescendantModelsWithType:2 modelIDs:v8 depth:a4 options:v15 error:&v30];
    id v19 = v30;

    if (v19)
    {
      __int16 v20 = (void *)MEMORY[0x1D944CB30]();
      uint64_t v21 = v11;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v33 = v23;
        __int16 v34 = 2112;
        id v35 = v8;
        __int16 v36 = 2112;
        unint64_t v37 = (unint64_t)v19;
        _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage removal for models and descendant models with IDs %@: %@", buf, 0x20u);
      }
      id v24 = [MEMORY[0x1E4F7A0D8] futureWithError:v19];
    }
    else
    {
      id v24 = [(HMBLocalZone *)v11 triggerProcessForBlockRow:v18];
    }
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v26 = v11;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = v28;
      __int16 v34 = 2112;
      id v35 = v9;
      __int16 v36 = 2112;
      unint64_t v37 = (unint64_t)v17;
      _os_log_impl(&dword_1D4693000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode processing options %@: %@", buf, 0x20u);
    }
    id v24 = [MEMORY[0x1E4F7A0D8] futureWithError:v17];
  }
  return v24;
}

- (id)removeModelsWithParentModelID:(id)a3 options:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D944CB30]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v6;
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing models with parent model ID %@ and options %@", buf, 0x20u);
  }
  id v28 = 0;
  uint64_t v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v28];
  id v13 = v28;
  id v14 = v13;
  if (v12)
  {
    id v27 = v13;
    uint64_t v15 = [(HMBLocalZone *)v9 insertBlockToRemoveChildModelsWithType:2 parentModelID:v6 options:v12 error:&v27];
    id v16 = v27;

    if (v16)
    {
      id v17 = (void *)MEMORY[0x1D944CB30]();
      uint64_t v18 = v9;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v30 = v20;
        __int16 v31 = 2112;
        id v32 = v6;
        __int16 v33 = 2112;
        id v34 = v16;
        _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage removal for models with parent model ID %@: %@", buf, 0x20u);
      }
      uint64_t v21 = [MEMORY[0x1E4F7A0D8] futureWithError:v16];
    }
    else
    {
      uint64_t v21 = [(HMBLocalZone *)v9 triggerProcessForBlockRow:v15];
    }
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v23 = v9;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v30 = v25;
      __int16 v31 = 2112;
      id v32 = v7;
      __int16 v33 = 2112;
      id v34 = v14;
      _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode processing options %@: %@", buf, 0x20u);
    }
    uint64_t v21 = [MEMORY[0x1E4F7A0D8] futureWithError:v14];
  }
  return v21;
}

- (id)removeModelIDs:(id)a3 options:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 set];
  id v10 = [(HMBLocalZone *)self addModels:v9 andRemoveModelIDs:v8 options:v7];

  return v10;
}

- (id)updateModels:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 setDisallowsModelCreation:1];
  id v8 = [(HMBLocalZone *)self addModels:v7 options:v6];

  return v8;
}

- (id)addModels:(id)a3 options:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 set];
  id v10 = [(HMBLocalZone *)self addModels:v8 andRemoveModelIDs:v9 options:v7];

  return v10;
}

- (id)createModels:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 setRequiresModelCreation:1];
  id v8 = [(HMBLocalZone *)self addModels:v7 options:v6];

  return v8;
}

- (id)updateModels:(id)a3 andRemoveModelIDs:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v8 setDisallowsModelCreation:1];
  id v11 = [(HMBLocalZone *)self addModels:v10 andRemoveModelIDs:v9 options:v8];

  return v11;
}

- (id)addModels:(id)a3 andRemoveModelIDs:(id)a4 options:(id)a5
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1D944CB30]();
  uint64_t v12 = self;
  id v13 = HMFGetOSLogHandle();
  v89 = v12;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    uint64_t v15 = [v8 hmbDescription];
    id v16 = [v9 hmbDescription];
    *(_DWORD *)buf = 138544130;
    v113 = v14;
    __int16 v114 = 2112;
    uint64_t v115 = (uint64_t)v15;
    __int16 v116 = 2112;
    id v117 = v16;
    __int16 v118 = 2112;
    id v119 = v10;
    _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, "%{public}@Submitting models to add: %@ model IDs to remove: %@ options: %@", buf, 0x2Au);

    uint64_t v12 = v89;
  }

  id v106 = 0;
  id v17 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v106];
  id v18 = v106;
  if (v18)
  {
    id v19 = v18;
    __int16 v20 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v21 = v12;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v113 = v23;
      __int16 v114 = 2112;
      uint64_t v115 = (uint64_t)v10;
      __int16 v116 = 2112;
      id v117 = v19;
      _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive options %@: %@", buf, 0x20u);
    }
    id v24 = [MEMORY[0x1E4F7A0D8] futureWithError:v19];
  }
  else
  {
    v86 = v17;
    id v84 = v10;
    uint64_t v25 = [(HMBLocalZone *)v12 modelContainer];
    uint64_t v90 = [v25 bestModelEncodingForStorageLocation:3];

    id v87 = v8;
    v91 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count") + objc_msgSend(v8, "count"));
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v85 = v9;
    id v26 = v9;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v102 objects:v111 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v103 != v29) {
            objc_enumerationMutation(v26);
          }
          __int16 v31 = *(void **)(*((void *)&v102 + 1) + 8 * i);
          id v32 = [HMBLocalSQLContextRowItem alloc];
          __int16 v33 = [MEMORY[0x1E4F29128] UUID];
          id v34 = [v33 data];
          uint64_t v35 = [v31 data];
          __int16 v36 = [(HMBLocalSQLContextRowItem *)v32 initWithItemRow:0 externalID:v34 externalData:0 modelEncoding:0 modelData:v35];

          [v91 addObject:v36];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v102 objects:v111 count:16];
      }
      while (v28);
    }

    unint64_t v37 = [MEMORY[0x1E4F1CA80] set];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v38 = v8;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v98 objects:v110 count:16];
    v88 = v37;
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v99;
      while (2)
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v99 != v41) {
            objc_enumerationMutation(v38);
          }
          __int16 v43 = *(void **)(*((void *)&v98 + 1) + 8 * j);
          uint64_t v44 = [v43 hmbModelID];
          if (!v44
            || (uint64_t v45 = (void *)v44,
                [v43 hmbParentModelID],
                uint64_t v46 = objc_claimAutoreleasedReturnValue(),
                v46,
                v45,
                !v46))
          {
            v63 = (void *)MEMORY[0x1D944CB30]();
            v64 = v89;
            v65 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              v66 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v113 = v66;
              __int16 v114 = 2112;
              uint64_t v115 = (uint64_t)v43;
              _os_log_impl(&dword_1D4693000, v65, OS_LOG_TYPE_ERROR, "%{public}@Cannot update a model with a nil hmbModelID or hmbParentModelID: %@", buf, 0x16u);
            }
            v67 = (void *)MEMORY[0x1E4F7A0D8];
            v68 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v69 = *MEMORY[0x1E4F64ED0];
            v108[0] = @"info";
            v108[1] = @"model";
            v109[0] = @"Cannot update a model with a nil hmbModelID or hmbParentModelID";
            v70 = [v43 hmbDescription];
            v109[1] = v70;
            v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:2];
            v72 = [v68 errorWithDomain:v69 code:3 userInfo:v71];
            id v24 = [v67 futureWithError:v72];

            id v19 = 0;
            id v8 = v87;
            id v10 = v84;
            id v9 = v85;
            goto LABEL_35;
          }
          long long v47 = [v43 hmbModelID];
          [v37 addObject:v47];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v98 objects:v110 count:16];
        if (v40) {
          continue;
        }
        break;
      }
    }

    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v48 = v38;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v94 objects:v107 count:16];
    long long v50 = v89;
    if (v49)
    {
      uint64_t v51 = v49;
      id v19 = 0;
      uint64_t v52 = *(void *)v95;
      uint64_t v53 = v90;
      while (2)
      {
        uint64_t v54 = 0;
        v55 = v19;
        do
        {
          if (*(void *)v95 != v52) {
            objc_enumerationMutation(v48);
          }
          v56 = *(void **)(*((void *)&v94 + 1) + 8 * v54);
          __int16 v57 = [(HMBLocalZone *)v50 modelContainer];
          id v93 = v55;
          uint64_t v58 = [v57 dataFromModel:v56 encoding:v53 storageLocation:3 updatedModelIDs:v88 error:&v93];
          id v19 = v93;

          if (!v58)
          {
            v73 = (void *)MEMORY[0x1D944CB30]();
            v74 = v89;
            v75 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
            {
              v76 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v113 = v76;
              __int16 v114 = 2112;
              uint64_t v115 = (uint64_t)v56;
              __int16 v116 = 2112;
              id v117 = v19;
              _os_log_impl(&dword_1D4693000, v75, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode model %@: %@", buf, 0x20u);
            }
            id v24 = [MEMORY[0x1E4F7A0D8] futureWithError:v19];

            id v10 = v84;
            id v9 = v85;
            id v17 = v86;
            id v8 = v87;
            goto LABEL_42;
          }
          uint64_t v59 = [HMBLocalSQLContextRowItem alloc];
          v60 = [MEMORY[0x1E4F29128] UUID];
          v61 = [v60 data];
          v62 = [(HMBLocalSQLContextRowItem *)v59 initWithItemRow:0 externalID:v61 externalData:0 modelEncoding:v90 modelData:v58];

          uint64_t v53 = v90;
          [v91 addObject:v62];

          ++v54;
          v55 = v19;
          long long v50 = v89;
        }
        while (v51 != v54);
        uint64_t v51 = [v48 countByEnumeratingWithState:&v94 objects:v107 count:16];
        if (v51) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v19 = 0;
    }

    id v92 = v19;
    id v17 = v86;
    uint64_t v77 = [(HMBLocalZone *)v50 insertBlockWithType:2 options:v86 items:v91 error:&v92];
    id v78 = v92;

    if (v78)
    {
      id v24 = [MEMORY[0x1E4F7A0D8] futureWithError:v78];
      id v19 = v78;
      id v10 = v84;
      id v9 = v85;
      id v8 = v87;
    }
    else
    {
      v80 = (void *)MEMORY[0x1D944CB30]();
      v81 = v50;
      v82 = HMFGetOSLogHandle();
      id v10 = v84;
      id v8 = v87;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        v83 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v113 = v83;
        __int16 v114 = 2048;
        uint64_t v115 = v77;
        _os_log_impl(&dword_1D4693000, v82, OS_LOG_TYPE_INFO, "%{public}@Submitted models with block row: %lu", buf, 0x16u);
      }
      id v24 = [(HMBLocalZone *)v81 triggerProcessForBlockRow:v77];
      id v19 = 0;
      id v9 = v85;
LABEL_35:
      id v17 = v86;
    }
LABEL_42:
  }
  return v24;
}

- (id)flush
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  id v4 = [(HMBLocalZone *)self localDatabase];
  id v5 = [v4 queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __21__HMBLocalZone_flush__block_invoke;
  v10[3] = &unk_1E69E9A18;
  v10[4] = self;
  id v6 = v3;
  id v11 = v6;
  [v5 addOperationWithBlock:v10];

  id v7 = v11;
  id v8 = v6;

  return v8;
}

void __21__HMBLocalZone_flush__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) mirror];
  id v6 = v2;
  if (v2)
  {
    id v3 = [v2 flush];
    id v4 = [*(id *)(a1 + 40) completionHandlerAdapter];
    id v5 = (id)[v3 addCompletionBlock:v4];
  }
  else
  {
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (BOOL)destroyWithError:(id *)a3
{
  if (!-[HMBLocalZone removeAllRecordsWithError:](self, "removeAllRecordsWithError:")) {
    return 0;
  }
  id v5 = [(HMBLocalZone *)self localDatabase];
  id v6 = [v5 local];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__HMBLocalZone_destroyWithError___block_invoke;
  v9[3] = &unk_1E69EB758;
  v9[4] = self;
  char v7 = [v6 sqlTransactionWithActivity:0 error:a3 block:v9];

  return v7;
}

id __33__HMBLocalZone_destroyWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = 0;
  objc_msgSend(v3, "_deleteZoneWithRow:error:", objc_msgSend(v2, "zoneRow"), &v6);

  id v4 = v6;
  return v4;
}

- (void)startUp
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = [(HMBLocalZone *)self hasStartedUp];
  [(HMBLocalZone *)self setHasStartedUp:1];
  os_unfair_lock_unlock(p_propertyLock);
  id v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = self;
  char v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      id v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Not starting up local zone that has already started up", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v10;
      _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting up local zone", (uint8_t *)&v12, 0xCu);
    }
    [(HMBLocalZone *)v6 migrateUnsupportedModels];
    [(HMBLocalZone *)v6 rebuildIndexesIfNeeded];
    [(HMBLocalZone *)v6 queueIncompleteProcesses];
    id v11 = [(HMBLocalZone *)v6 mirror];
    [v11 startUpWithLocalZone:v6];
  }
}

- (id)setExternalData:(id)a3 forExternalID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMBLocalZone *)self sql];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__HMBLocalZone_setExternalData_forExternalID___block_invoke;
  v13[3] = &unk_1E69EB6C0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = [v8 sqlBlockWithActivity:0 block:v13];

  return v11;
}

id __46__HMBLocalZone_setExternalData_forExternalID___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  id v10 = 0;
  [v4 _updateRecordWithZoneRow:v5 externalID:v6 externalData:v7 error:&v10];

  id v8 = v10;
  return v8;
}

- (id)setExternalData:(id)a3 forModelID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMBLocalZone *)self sql];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__HMBLocalZone_setExternalData_forModelID___block_invoke;
  v13[3] = &unk_1E69EB6C0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = [v8 sqlBlockWithActivity:0 block:v13];

  return v11;
}

id __43__HMBLocalZone_setExternalData_forModelID___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  id v10 = 0;
  [v4 _updateRecordWithZoneRow:v5 modelID:v6 externalData:v7 error:&v10];

  id v8 = v10;
  return v8;
}

- (id)modelIDForExternalID:(id)a3 error:(id *)a4
{
  id v4 = [(HMBLocalZone *)self fetchRecordRowWithExternalID:a3 returning:0 error:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 modelID];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)externalIDForModelID:(id)a3 error:(id *)a4
{
  id v4 = [(HMBLocalZone *)self fetchRecordRowWithModelID:a3 returning:1 error:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 externalID];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)externalDataForExternalID:(id)a3 error:(id *)a4
{
  id v4 = [(HMBLocalZone *)self fetchRecordRowWithExternalID:a3 returning:1 error:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 externalData];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)externalDataForModelID:(id)a3 error:(id *)a4
{
  id v4 = [(HMBLocalZone *)self fetchRecordRowWithModelID:a3 returning:1 error:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 externalData];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)removeObserver:(id)a3 forModelWithID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v8 = [(HMBLocalZone *)self modelObserversByModelID];
  id v9 = [v8 objectForKeyedSubscript:v6];

  [v9 removeObject:v11];
  if (![v9 count])
  {
    id v10 = [(HMBLocalZone *)self modelObserversByModelID];
    [v10 setObject:0 forKeyedSubscript:v6];
  }
  os_unfair_lock_unlock(p_propertyLock);
}

- (void)removeObserverForAllModels:(id)a3
{
  id v6 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(HMBLocalZone *)self observersForAllModels];
  [v5 removeObject:v6];

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)addObserver:(id)a3 forModelWithID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v8 = [(HMBLocalZone *)self modelObserversByModelID];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v10 = [(HMBLocalZone *)self modelObserversByModelID];
    [v10 setObject:v9 forKeyedSubscript:v6];
  }
  [v9 addObject:v11];

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)addObserverForAllModels:(id)a3
{
  id v6 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(HMBLocalZone *)self observersForAllModels];
  [v5 addObject:v6];

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)setZoneRow:(unint64_t)a3
{
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  self->_zoneRow = a3;
  os_unfair_lock_unlock(p_propertyLock);
}

- (unint64_t)zoneRow
{
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  unint64_t zoneRow = self->_zoneRow;
  os_unfair_lock_unlock(p_propertyLock);
  return zoneRow;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944CB30](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Deallocating HMBLocalZone", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMBLocalZone;
  [(HMBLocalZone *)&v7 dealloc];
}

- (HMBLocalZone)initWithLocalDatabase:(id)a3 zoneID:(id)a4 zoneRow:(unint64_t)a5 configuration:(id)a6 mirror:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v35.receiver = self;
  v35.super_class = (Class)HMBLocalZone;
  id v16 = [(HMBLocalZone *)&v35 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_localDatabase, v12);
    uint64_t v18 = [v12 local];
    sql = v17->_sql;
    v17->_sql = (HMBLocalSQLContext *)v18;

    objc_storeStrong((id *)&v17->_zoneID, a4);
    v17->_unint64_t zoneRow = a5;
    uint64_t v20 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observersForAllModels = v17->_observersForAllModels;
    v17->_observersForAllModels = (NSHashTable *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
    modelObserversByModelID = v17->_modelObserversByModelID;
    v17->_modelObserversByModelID = (NSMutableDictionary *)v22;

    uint64_t v24 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    mirrorOutputObservers = v17->_mirrorOutputObservers;
    v17->_mirrorOutputObservers = (NSHashTable *)v24;

    objc_storeStrong((id *)&v17->_mirror, a7);
    id v26 = [v14 delegate];
    objc_storeWeak((id *)&v17->_delegate, v26);

    uint64_t v27 = [v14 copy];
    configuration = v17->_configuration;
    v17->_configuration = (HMBLocalZoneConfiguration *)v27;

    uint64_t v29 = [v14 modelContainer];

    if (v29) {
      id v30 = v14;
    }
    else {
      id v30 = v12;
    }
    __int16 v31 = [v30 modelContainer];
    uint64_t v32 = [v31 copy];
    modelContainer = v17->_modelContainer;
    v17->_modelContainer = (HMBModelContainer *)v32;

    [(HMBModelContainer *)v17->_modelContainer updateLocalZone:v17];
    if (v15) {
      [(HMBModelContainer *)v17->_modelContainer updateMirror:v15];
    }
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25 != -1) {
    dispatch_once(&logCategory__hmf_once_t25, &__block_literal_global_1498);
  }
  v2 = (void *)logCategory__hmf_once_v26;
  return v2;
}

uint64_t __27__HMBLocalZone_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v26;
  logCategory__hmf_once_id v26 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)migrateUnsupportedModels
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [HMBLocalZoneQueryResultAllOfTypeRaw alloc];
  unint64_t v4 = [(HMBLocalZone *)self zoneRow];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  objc_super v7 = [(HMBLocalZoneQueryResultAllOfTypeRaw *)v3 initWithLocalZone:self zoneRow:v4 modelType:v6 returning:-1];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__HMBLocalZone_MigrateUnsupported__migrateUnsupportedModels__block_invoke;
  v14[3] = &unk_1E69E9AC0;
  v14[4] = self;
  [(HMBSQLQueryIterator *)v7 enumerateObjectsUsingBlock:v14];
  id v8 = [(HMBSQLQueryIterator *)v7 error];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [(HMBSQLQueryIterator *)v7 error];
      *(_DWORD *)buf = 138543618;
      id v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to iterate through unknown models in zone: %@", buf, 0x16u);
    }
  }
}

void __60__HMBLocalZone_MigrateUnsupported__migrateUnsupportedModels__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = *(void **)(a1 + 32);
  id v27 = 0;
  uint64_t v5 = [v4 modelFromRecord:v3 storageLocation:2 error:&v27];
  id v6 = v27;
  if (v5)
  {
    if ([v5 hmbIsModelGenericRepresentation])
    {
      objc_super v7 = (void *)MEMORY[0x1D944CB30]();
      id v8 = *(id *)(a1 + 32);
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v10;
        __int16 v30 = 2112;
        __int16 v31 = v5;
        _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_INFO, "%{public}@Not migrating unsupported model that has a generic representation: %@", buf, 0x16u);
      }
    }
    else
    {
      id v11 = [v5 hmbType];
      id v12 = [*(id *)(a1 + 32) modelContainer];
      id v13 = [v12 schemaHashForModel:v5];

      id v14 = (void *)MEMORY[0x1D944CB30]();
      id v15 = *(id *)(a1 + 32);
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v29 = v17;
        __int16 v30 = 2112;
        __int16 v31 = v11;
        __int16 v32 = 2112;
        __int16 v33 = v13;
        __int16 v34 = 2112;
        objc_super v35 = v5;
        _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating model type to %@ and schema to %@ for previously-unsupported model: %@", buf, 0x2Au);
      }
      uint64_t v18 = [*(id *)(a1 + 32) sql];
      id v26 = v6;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __60__HMBLocalZone_MigrateUnsupported__migrateUnsupportedModels__block_invoke_42;
      v22[3] = &unk_1E69EB6C0;
      id v23 = v3;
      id v24 = v11;
      id v25 = v13;
      id v19 = v13;
      id v20 = v11;
      [v18 sqlBlockWithActivity:0 error:&v26 block:v22];
      id v21 = v26;

      id v6 = v21;
    }
  }
}

id __60__HMBLocalZone_MigrateUnsupported__migrateUnsupportedModels__block_invoke_42(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 recordRow];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  id v10 = 0;
  [v4 _updateRecordWithRow:v5 modelType:v6 modelSchema:v7 error:&v10];

  id v8 = v10;
  return v8;
}

- (id)createMirrorInputWithError:(id *)a3
{
  id v4 = [(HMBLocalZone *)self createInputBlockWithType:1 error:a3];
  if (v4) {
    uint64_t v5 = [(HMBLocalZoneInput *)[HMBLocalZoneMirrorInput alloc] initWithLocalZone:self inputBlock:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)removeOutputBlockWithRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7 = [(HMBLocalZone *)self sql];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HMBLocalZone_MirrorOutput__removeOutputBlockWithRow_error___block_invoke;
  v9[3] = &unk_1E69EB708;
  v9[4] = self;
  void v9[5] = a3;
  LOBYTE(a4) = [v7 sqlTransactionWithActivity:0 error:a4 block:v9];

  return (char)a4;
}

id __61__HMBLocalZone_MirrorOutput__removeOutputBlockWithRow_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v22 = 0;
  char v5 = [v3 _resetOutputForRecordsWithBlockRow:v4 error:&v22];
  id v6 = v22;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1D944CB30]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v24 = v10;
      __int16 v25 = 2048;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to reset output for records with output block row %lu: %@", buf, 0x20u);
    }
  }
  uint64_t v12 = *(void *)(a1 + 40);
  id v21 = v6;
  char v13 = [v3 _deleteBlockWithRow:v12 error:&v21];
  id v14 = v21;

  if ((v13 & 1) == 0)
  {
    id v15 = (void *)MEMORY[0x1D944CB30]();
    id v16 = *(id *)(a1 + 32);
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v24 = v18;
      __int16 v25 = 2048;
      uint64_t v26 = v19;
      __int16 v27 = 2112;
      id v28 = v14;
      _os_log_impl(&dword_1D4693000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete block with output block row %lu: %@", buf, 0x20u);
    }
  }

  return v14;
}

- (id)markGroupAsSentWithOutputBlock:(unint64_t)a3 tuples:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HMBLocalZone *)self sql];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__HMBLocalZone_MirrorOutput__markGroupAsSentWithOutputBlock_tuples___block_invoke;
  v11[3] = &unk_1E69EB708;
  id v12 = v6;
  unint64_t v13 = a3;
  id v8 = v6;
  id v9 = [v7 sqlTransactionWithActivity:0 block:v11];

  return v9;
}

id __68__HMBLocalZone_MirrorOutput__markGroupAsSentWithOutputBlock_tuples___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v41 = a1;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v46;
    id v43 = v3;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v46 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v45 + 1) + 8 * v7);
      id v9 = v3;
      id v10 = v8;
      uint64_t v11 = [v10 model];

      uint64_t v12 = [v10 recordRow];
      if (v11)
      {
        unint64_t v13 = [v10 externalID];
        id v14 = [v10 externalData];
        id v50 = 0;
        [v9 _updateRecordWithRow:v12 externalID:v13 externalData:v14 error:&v50];
        id v15 = v50;

        uint64_t v16 = [v10 recordRow];
        uint64_t v17 = [v10 outputBlockRow];
        id v49 = v15;
        uint64_t v18 = [v9 _clearPushForRecordRow:v16 expectedOutputBlockRow:v17 error:&v49];
        id v19 = v49;

        if (v18 == 1)
        {
          id v20 = (void *)MEMORY[0x1D944CB30]();
          id v21 = v9;
          id v22 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
            goto LABEL_24;
          }
          id v23 = HMFGetLogIdentifier();
          uint64_t v32 = [v10 recordRow];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v23;
          __int16 v53 = 2048;
          uint64_t v54 = v32;
          __int16 v25 = v22;
          os_log_type_t v26 = OS_LOG_TYPE_INFO;
          __int16 v27 = "%{public}@Not clearing output columns for record %lu because it appears to have changed.";
LABEL_22:
          uint32_t v31 = 22;
          goto LABEL_23;
        }
        if (!v18)
        {
          id v20 = (void *)MEMORY[0x1D944CB30]();
          id v21 = v9;
          id v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            id v23 = HMFGetLogIdentifier();
            uint64_t v24 = [v10 recordRow];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v23;
            __int16 v53 = 2048;
            uint64_t v54 = v24;
            __int16 v55 = 2112;
            id v56 = v19;
            __int16 v25 = v22;
            os_log_type_t v26 = OS_LOG_TYPE_ERROR;
            __int16 v27 = "%{public}@Unable to clear output columns for pushed record %lu: %@";
            goto LABEL_16;
          }
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v28 = [v10 outputBlockRow];
        id v50 = 0;
        uint64_t v29 = [v9 _deleteRecordWithRow:v12 expectedOutputBlockRow:v28 error:&v50];
        id v19 = v50;
        switch(v29)
        {
          case 2:
            __int16 v33 = [v10 queryTable];
            uint64_t v34 = [v10 recordRow];
            *(void *)buf = v19;
            [v33 _deleteQueryForRecordRow:v34 error:buf];
            id v35 = *(id *)buf;

            id v19 = v35;
            break;
          case 1:
            id v20 = (void *)MEMORY[0x1D944CB30]();
            id v21 = v9;
            id v22 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
              goto LABEL_24;
            }
            id v23 = HMFGetLogIdentifier();
            uint64_t v36 = [v10 recordRow];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v23;
            __int16 v53 = 2048;
            uint64_t v54 = v36;
            __int16 v25 = v22;
            os_log_type_t v26 = OS_LOG_TYPE_INFO;
            __int16 v27 = "%{public}@Not removing record %lu because it appears to have changed.";
            goto LABEL_22;
          case 0:
            id v20 = (void *)MEMORY[0x1D944CB30]();
            id v21 = v9;
            id v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              id v23 = HMFGetLogIdentifier();
              uint64_t v30 = [v10 recordRow];
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v23;
              __int16 v53 = 2048;
              uint64_t v54 = v30;
              __int16 v55 = 2112;
              id v56 = v19;
              __int16 v25 = v22;
              os_log_type_t v26 = OS_LOG_TYPE_ERROR;
              __int16 v27 = "%{public}@Unable to delete pushed record %lu: %@";
LABEL_16:
              uint32_t v31 = 32;
LABEL_23:
              _os_log_impl(&dword_1D4693000, v25, v26, v27, buf, v31);
            }
LABEL_24:

            id v3 = v43;
            break;
        }
      }

      if (v19)
      {
        id v38 = v19;

        uint64_t v39 = v38;
        goto LABEL_30;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v37 = *(void *)(v41 + 40);
  id v44 = 0;
  [v3 _deleteBlockWithRow:v37 error:&v44];
  id v38 = v44;
  uint64_t v39 = 0;
LABEL_30:

  return v39;
}

- (id)fetchRecordsForOutputBlock:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7 = [(HMBLocalZone *)self sql];
  id v8 = [v7 queryContextsByModelType];

  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__4527;
  uint64_t v37 = __Block_byref_object_dispose__4528;
  id v38 = 0;
  id v9 = [(HMBLocalZone *)self sql];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __63__HMBLocalZone_MirrorOutput__fetchRecordsForOutputBlock_error___block_invoke;
  v32[3] = &unk_1E69EA7B0;
  v32[6] = a3;
  v32[7] = 7;
  v32[4] = self;
  v32[5] = &v33;
  int v10 = [v9 sqlBlockWithActivity:0 error:a4 block:v32];

  if (v10)
  {
    uint64_t v26 = 0;
    __int16 v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = __Block_byref_object_copy__4527;
    uint64_t v30 = __Block_byref_object_dispose__4528;
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v34[5], "count"));
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__4527;
    uint64_t v24 = __Block_byref_object_dispose__4528;
    id v25 = 0;
    uint64_t v11 = (void *)v34[5];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__HMBLocalZone_MirrorOutput__fetchRecordsForOutputBlock_error___block_invoke_82;
    v14[3] = &unk_1E69EA7D8;
    uint64_t v18 = &v20;
    unint64_t v19 = a3;
    id v15 = v8;
    uint64_t v16 = self;
    uint64_t v17 = &v26;
    [v11 enumerateObjectsUsingBlock:v14];
    if (a4) {
      *a4 = (id) v21[5];
    }
    id v12 = (id)v27[5];

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    id v12 = 0;
  }
  _Block_object_dispose(&v33, 8);

  return v12;
}

id __63__HMBLocalZone_MirrorOutput__fetchRecordsForOutputBlock_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v20 = 0;
  uint64_t v6 = [v3 _selectRecordsWithBlockRow:v4 returning:v5 error:&v20];
  id v7 = v20;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  int v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v10 && ![v10 count])
  {
    uint64_t v11 = (void *)MEMORY[0x1D944CB30]();
    id v12 = *(id *)(a1 + 32);
    unint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v14;
      __int16 v23 = 2048;
      uint64_t v24 = v15;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, "%{public}@Deleting block with output block row %lu because it has no corresponding records", buf, 0x16u);
    }
    uint64_t v16 = *(void *)(a1 + 48);
    id v19 = v7;
    [v3 _deleteBlockWithRow:v16 error:&v19];
    id v17 = v19;

    id v7 = v17;
  }

  return v7;
}

void __63__HMBLocalZone_MirrorOutput__fetchRecordsForOutputBlock_error___block_invoke_82(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [v6 modelType];
  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([v6 pushEncoding])
  {
    uint64_t v37 = v8;
    id v9 = *(void **)(a1 + 40);
    int v10 = [v6 pushData];
    id v42 = 0;
    uint64_t v11 = objc_msgSend(v9, "modelFromData:encoding:storageLocation:recordRowID:error:", v10, objc_msgSend(v6, "pushEncoding"), 1, objc_msgSend(v6, "recordRow"), &v42);
    id v12 = v42;
    id v13 = v42;

    if (v11)
    {
      id v36 = v13;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v14 = [*(id *)(a1 + 40) allMirrorOutputObservers];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v19 localZone:*(void *)(a1 + 40) willPerformMirrorOutputForModel:v11];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v16);
      }

      id v20 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v21 = [HMBMirrorOutputTuple alloc];
      uint64_t v22 = *(void *)(a1 + 64);
      uint64_t v23 = [v6 recordRow];
      uint64_t v24 = [v6 externalID];
      uint64_t v25 = [v6 externalData];
      uint64_t v8 = v37;
      uint64_t v26 = [(HMBMirrorOutputTuple *)v21 initWithOutputBlockRow:v22 recordRow:v23 model:v11 queryTable:v37 externalID:v24 externalData:v25];
      [v20 addObject:v26];

      id v13 = v36;
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v12);
      uint64_t v34 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v35 = *(void **)(v34 + 40);
      *(void *)(v34 + 40) = 0;

      *a4 = 1;
    }
  }
  else
  {
    __int16 v27 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v28 = [HMBMirrorOutputTuple alloc];
    uint64_t v29 = *(void *)(a1 + 64);
    uint64_t v30 = [v6 recordRow];
    id v31 = [v6 externalID];
    uint64_t v32 = [v6 externalData];
    uint64_t v33 = [(HMBMirrorOutputTuple *)v28 initWithOutputBlockRow:v29 recordRow:v30 model:0 queryTable:v8 externalID:v31 externalData:v32];
    [v27 addObject:v33];
  }
}

- (id)fetchOptionsForOutputBlock:(unint64_t)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__4527;
  uint64_t v29 = __Block_byref_object_dispose__4528;
  id v30 = 0;
  id v7 = [(HMBLocalZone *)self sql];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __63__HMBLocalZone_MirrorOutput__fetchOptionsForOutputBlock_error___block_invoke;
  v24[3] = &unk_1E69EB648;
  v24[4] = &v25;
  v24[5] = a3;
  id v8 = [v7 sqlBlockWithActivity:0 block:v24];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1D944CB30]();
    int v10 = self;
    HMFGetOSLogHandle();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      uint64_t v32 = v12;
      __int16 v33 = 2048;
      unint64_t v34 = a3;
      __int16 v35 = 2112;
      id v36 = v10;
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch options for block at row %lu.%@: %@", buf, 0x2Au);
    }
    if (a4)
    {
      id v8 = v8;
      id v13 = 0;
      *a4 = v8;
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  if (!v26[5])
  {
    id v8 = 0;
LABEL_13:
    id v13 = 0;
    goto LABEL_16;
  }
  id v14 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = [(id)v26[5] optionsData];
  id v23 = 0;
  uint64_t v17 = [v14 unarchivedObjectOfClass:v15 fromData:v16 error:&v23];
  id v8 = v23;

  if (v8)
  {
    uint64_t v18 = (void *)MEMORY[0x1D944CB30]();
    id v19 = self;
    HMFGetOSLogHandle();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      uint64_t v32 = v21;
      __int16 v33 = 2048;
      unint64_t v34 = a3;
      __int16 v35 = 2112;
      id v36 = v19;
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive transaction options from options data: %lu.%@: %@", buf, 0x2Au);
    }
    id v13 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    id v13 = v17;
  }

LABEL_16:
  _Block_object_dispose(&v25, 8);

  return v13;
}

id __63__HMBLocalZone_MirrorOutput__fetchOptionsForOutputBlock_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  uint64_t v4 = [a2 _selectBlockWithRow:v3 error:&v9];
  id v5 = v9;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  return v5;
}

- (id)allMirrorOutputObservers
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v5 = [(HMBLocalZone *)self mirrorOutputObservers];
  uint64_t v6 = [v5 allObjects];
  [v3 addObjectsFromArray:v6];

  os_unfair_lock_unlock(p_propertyLock);
  id v7 = (void *)[v3 copy];

  return v7;
}

- (void)removeMirrorOutputObserver:(id)a3
{
  id v6 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v5 = [(HMBLocalZone *)self mirrorOutputObservers];
  [v5 removeObject:v6];

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)addMirrorOutputObserver:(id)a3
{
  id v6 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v5 = [(HMBLocalZone *)self mirrorOutputObservers];
  [v5 addObject:v6];

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)rebuildIndexesIfNeeded
{
  uint64_t v3 = [(HMBLocalZone *)self sql];
  uint64_t v4 = [v3 queryContextsByModelType];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__HMBLocalZone_Queryable__rebuildIndexesIfNeeded__block_invoke;
  v5[3] = &unk_1E69EACE0;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __49__HMBLocalZone_Queryable__rebuildIndexesIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) delegate];
  if ([v7 conformsToProtocol:&unk_1F2C63B90]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (objc_opt_respondsToSelector()) {
    [v9 localZoneWillReindex:*(void *)(a1 + 32)];
  }
  __int16 v53 = [v6 context];
  int v10 = [*(id *)(a1 + 32) sql];

  if (v53 != v10) {
    _HMFPreconditionFailure();
  }
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  uint64_t v11 = [*(id *)(a1 + 32) sql];
  id v58 = 0;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __49__HMBLocalZone_Queryable__rebuildIndexesIfNeeded__block_invoke_2;
  v55[3] = &unk_1E69EB670;
  v55[4] = *(void *)(a1 + 32);
  id v12 = v6;
  id v56 = v12;
  uint64_t v57 = &v59;
  char v13 = [v11 sqlBlockWithActivity:0 error:&v58 block:v55];
  id v14 = v58;

  if ((v13 & 1) == 0)
  {
    uint64_t v15 = (void *)MEMORY[0x1D944CB30]();
    id v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    uint64_t v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      id v19 = [v12 modelType];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      id v85 = v14;
      _os_log_impl(&dword_1D4693000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine index state of %@: %@", buf, 0x20u);
    }
  }

  if (*((unsigned char *)v60 + 24))
  {
    id v20 = v14;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t v22 = [v12 modelType];
      [v9 localZone:v21 willReindexTableForModel:v22];
    }
    id v23 = (void *)MEMORY[0x1D944CB30]();
    id v24 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    uint64_t v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [v12 modelType];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v27;
      _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_INFO, "%{public}@Preparing to reindex table for %@", buf, 0x16u);
    }
    uint64_t v28 = *(void **)(a1 + 32);
    id v54 = v14;
    id v29 = v28;
    id v30 = v12;
    id v31 = [v30 context];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = ____reindexTable_block_invoke;
    v77[3] = &unk_1E69EADA8;
    id v32 = v30;
    id v78 = v32;
    id v33 = v29;
    id v79 = v33;
    LODWORD(v30) = [v31 sqlBlockWithActivity:0 error:&v54 block:v77];

    if (v30)
    {
      uint64_t v73 = 0;
      v74 = &v73;
      uint64_t v75 = 0x2020000000;
      char v76 = 1;
      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x3032000000;
      v70 = __Block_byref_object_copy__5741;
      v71 = __Block_byref_object_dispose__5742;
      id v72 = 0;
      uint64_t v63 = 0;
      v64 = &v63;
      uint64_t v65 = 0x2020000000;
      uint64_t v66 = 1;
      unint64_t v34 = objc_msgSend(v33, "queryModelsOfType:", objc_msgSend(v32, "modelClass"));
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ____reindexTable_block_invoke_2;
      id v85 = &unk_1E69EAD30;
      id v52 = v32;
      id v86 = v52;
      v88 = &v67;
      id v35 = v33;
      id v87 = v35;
      v89 = &v63;
      uint64_t v90 = &v73;
      uint64_t v36 = [v34 enumerateObjectsUsingBlock:buf];
      if (*((unsigned char *)v74 + 24))
      {
        context = (void *)MEMORY[0x1D944CB30](v36);
        id v37 = v35;
        HMFGetOSLogHandle();
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          long long v48 = v34;
          id v49 = v5;
          HMFGetLogIdentifier();
          id v50 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v39 = v64[3];
          long long v40 = [v52 modelType];
          *(_DWORD *)v80 = 138543874;
          *(void *)&v80[4] = v50;
          *(_WORD *)&v80[12] = 2048;
          *(void *)&v80[14] = v39 - 1;
          *(_WORD *)&v80[22] = 2112;
          v81 = v40;
          _os_log_impl(&dword_1D4693000, v38, OS_LOG_TYPE_INFO, "%{public}@Total of %lu rows re-indexed for %@.", v80, 0x20u);

          unint64_t v34 = v48;
          id v5 = v49;
        }
        long long v41 = [v37 sql];
        *(void *)v80 = MEMORY[0x1E4F143A8];
        *(void *)&v80[8] = 3221225472;
        *(void *)&v80[16] = ____reindexTable_block_invoke_86;
        v81 = &unk_1E69EADA8;
        id v82 = v37;
        id v83 = v52;
        char v42 = [v41 sqlBlockWithActivity:0 error:&v54 block:v80];
      }
      else
      {
        id v54 = (id) v68[5];
        char v42 = *((unsigned char *)v74 + 24) != 0;
      }

      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(&v67, 8);

      _Block_object_dispose(&v73, 8);
    }
    else
    {
      char v42 = 0;
    }

    id v20 = v54;
    if ((v42 & 1) == 0)
    {
      id v43 = (void *)MEMORY[0x1D944CB30]();
      id v44 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      long long v45 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        long long v47 = [v32 modelType];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v46;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v47;
        *(_WORD *)&buf[22] = 2112;
        id v85 = v20;
        _os_log_impl(&dword_1D4693000, v45, OS_LOG_TYPE_ERROR, "%{public}@Unable to rebuild index of %@: %@", buf, 0x20u);
      }
    }
  }

  _Block_object_dispose(&v59, 8);
}

id __49__HMBLocalZone_Queryable__rebuildIndexesIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  id v6 = [*(id *)(a1 + 40) modelType];
  id v10 = 0;
  id v7 = [v4 _selectIndexSentinelForZoneRow:v5 modelType:v6 error:&v10];

  id v8 = v10;
  if (v7) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 BOOLValue];
  }

  return v8;
}

- (id)countModelsUsingQuery:(id)a3 arguments:(id)a4 error:(id *)a5
{
  return (id)[a3 countMatchesOn:self arguments:a4 error:a5];
}

- (id)queryModelsUsingQuery:(id)a3 arguments:(id)a4
{
  return (id)[a3 performQueryOn:self arguments:a4];
}

- (id)queryModelsUsingQuery:(id)a3
{
  return [(HMBLocalZone *)self queryModelsUsingQuery:a3 arguments:MEMORY[0x1E4F1CC08]];
}

- (id)queryModelsRecursivelyStartingWithModelID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[HMBLocalZoneQueryResultRecursiveModelID alloc] initWithLocalZone:self modelID:v4];

  return v5;
}

- (id)queryModelsWithParentModelID:(id)a3 ofType:(Class)a4
{
  id v6 = a3;
  id v7 = [HMBLocalZoneQueryResultParentModelIDOfType alloc];
  id v8 = NSStringFromClass(a4);
  id v9 = [(HMBLocalZoneQueryResultParentModelIDOfType *)v7 initWithLocalZone:self parentModelID:v6 modelClassName:v8];

  return v9;
}

- (id)queryModelsWithParentModelID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[HMBLocalZoneQueryResultParentModelID alloc] initWithLocalZone:self parentModelID:v4];

  return v5;
}

- (id)queryModelsOfType:(Class)a3
{
  uint64_t v5 = [HMBLocalZoneQueryResultAllOfType alloc];
  id v6 = NSStringFromClass(a3);
  id v7 = [(HMBLocalZoneQueryResultAllOfType *)v5 initWithLocalZone:self modelClassName:v6];

  return v7;
}

- (id)fetchModels
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__5741;
  uint64_t v15 = __Block_byref_object_dispose__5742;
  id v16 = 0;
  uint64_t v3 = [(HMBLocalZone *)self sql];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__HMBLocalZone_Queryable__fetchModels__block_invoke;
  v10[3] = &unk_1E69EACB8;
  v10[4] = &v11;
  id v4 = (id)[v3 sqlBlockWithActivity:0 block:v10];

  uint64_t v5 = [HMBLocalZoneQueryResultRecordColumns alloc];
  uint64_t v6 = v12[5];
  unint64_t v7 = +[HMBSQLQueryIterator maximumRowsPerSelect];
  id v8 = [(HMBLocalZoneQueryResult *)v5 initWithLocalZone:self statement:v6 initialSequence:&unk_1F2C4CAC8 arguments:MEMORY[0x1E4F1CC08] maximumRowsPerSelect:v7];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __38__HMBLocalZone_Queryable__fetchModels__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 selectAllRecordRows];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

- (id)queryModelsOfType:(Class)a3 properties:(id)a4 filter:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(HMBLocalZone *)self sql];
  uint64_t v11 = [v10 queryContextsByClass];
  id v12 = [v11 objectForKey:a3];

  if (v12)
  {
    uint64_t v13 = [v12 performQueryOn:self properties:v8 filter:v9];

    return v13;
  }
  else
  {
    uint64_t v15 = (HMBLocalZone *)_HMFPreconditionFailure();
    return [(HMBLocalZone *)v15 queryModelsOfType:v17 filter:v18];
  }
}

- (id)queryModelsOfType:(Class)a3 filter:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(HMBLocalZone *)self sql];
  id v8 = [v7 queryContextsByClass];
  id v9 = [v8 objectForKey:a3];

  if (v9)
  {
    id v10 = [v9 performQueryOn:self properties:0 filter:v6];

    return v10;
  }
  else
  {
    id v12 = (HMBLocalZone *)_HMFPreconditionFailure();
    return [(HMBLocalZone *)v12 queryModelsOfType:v14 predicate:v15];
  }
}

- (id)queryModelsOfType:(Class)a3 predicate:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__HMBLocalZone_Queryable__queryModelsOfType_predicate___block_invoke;
  v10[3] = &unk_1E69EAC90;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(HMBLocalZone *)self queryModelsOfType:a3 filter:v10];

  return v8;
}

uint64_t __55__HMBLocalZone_Queryable__queryModelsOfType_predicate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateWithObject:a2];
}

- (BOOL)removeBlockWithRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1D944CB30](self, a2);
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    SEL v16 = v10;
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Removing block with row %lu", buf, 0x16u);
  }
  id v11 = [(HMBLocalZone *)v8 sql];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__HMBLocalZone_Block__removeBlockWithRow_error___block_invoke;
  v14[3] = &__block_descriptor_40_e37___NSError_16__0__HMBLocalSQLContext_8l;
  void v14[4] = a3;
  char v12 = [v11 sqlBlockWithActivity:0 error:a4 block:v14];

  return v12;
}

id __48__HMBLocalZone_Block__removeBlockWithRow_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v10 = 0;
  id v4 = a2;
  [v4 _deleteItemsWithBlockRow:v3 error:&v10];
  id v5 = v10;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  [v4 _deleteBlockWithRow:v6 error:&v9];

  id v7 = v9;
  return v7;
}

- (id)fetchItemsInBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__6701;
  unint64_t v18 = __Block_byref_object_dispose__6702;
  id v19 = 0;
  id v7 = [(HMBLocalZone *)self sql];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__HMBLocalZone_Block__fetchItemsInBlock_error___block_invoke;
  v11[3] = &unk_1E69EB7A8;
  SEL v13 = &v14;
  id v8 = v6;
  id v12 = v8;
  LODWORD(a4) = [v7 sqlBlockWithActivity:0 error:a4 block:v11];

  if (a4) {
    id v9 = (id)v15[5];
  }
  else {
    id v9 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

id __47__HMBLocalZone_Block__fetchItemsInBlock_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v10 = 0;
  uint64_t v5 = objc_msgSend(v4, "_selectItemsWithBlockRow:returning:error:", objc_msgSend(v3, "blockRow"), -1, &v10);

  id v6 = v10;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  return v6;
}

- (id)fetchReadyBlocksWithType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__6701;
  id v15 = __Block_byref_object_dispose__6702;
  id v16 = 0;
  uint64_t v7 = [(HMBLocalZone *)self sql];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__HMBLocalZone_Block__fetchReadyBlocksWithType_error___block_invoke;
  v10[3] = &unk_1E69EB3E8;
  void v10[4] = self;
  void v10[5] = &v11;
  v10[6] = a3;
  LODWORD(a4) = [v7 sqlTransactionWithActivity:0 error:a4 block:v10];

  if (a4) {
    id v8 = (id)v12[5];
  }
  else {
    id v8 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

id __54__HMBLocalZone_Block__fetchReadyBlocksWithType_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = a1[6];
  id v12 = 0;
  uint64_t v7 = [v4 _selectReadyBlocksWithZoneRow:v5 type:v6 error:&v12];

  id v8 = v12;
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  return v8;
}

- (BOOL)_insertDeletionItemsForModelsAndDescendantModelsWithBlockRow:(unint64_t)a3 context:(id)a4 type:(unint64_t)a5 modelIDs:(id)a6 currentDepth:(unint64_t)a7 maximumDepth:(unint64_t)a8 options:(id)a9 error:(id *)a10
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a6;
  id v41 = a9;
  id v44 = [MEMORY[0x1E4F1CA80] set];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v16 = v15;
  uint64_t v47 = [v16 countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v51;
    char v42 = v16;
    unint64_t v43 = a3;
    long long v45 = self;
    while (2)
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v51 != v46) {
          objc_enumerationMutation(v16);
        }
        unint64_t v18 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        unint64_t v19 = [(HMBLocalZone *)self zoneRow];
        id v49 = 0;
        uint64_t v20 = [v14 _insertDeletionItemWithZoneRow:v19 blockRow:a3 type:a5 modelID:v18 error:&v49];
        id v21 = v49;
        if (!v20)
        {
          unint64_t v34 = (void *)MEMORY[0x1D944CB30]();
          id v35 = self;
          uint64_t v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            id v37 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544386;
            __int16 v55 = v37;
            __int16 v56 = 2048;
            unint64_t v57 = v43;
            __int16 v58 = 2048;
            unint64_t v59 = a5;
            __int16 v60 = 2112;
            unint64_t v61 = v18;
            __int16 v62 = 2112;
            id v63 = v21;
            _os_log_impl(&dword_1D4693000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to insert deletion item with blockRow: %lu type: %lu modelID: %@: %@", buf, 0x34u);
          }
          id v32 = v41;
          if (a10) {
            *a10 = v21;
          }

          id v16 = v42;
          BOOL v33 = 0;
          goto LABEL_24;
        }
        unint64_t v22 = [(HMBLocalZone *)self zoneRow];
        id v48 = v21;
        id v23 = [v14 _selectRecordsWithZoneRow:v22 parentModelID:v18 returning:0 error:&v48];
        id v24 = v48;

        if (v23)
        {
          uint64_t v25 = objc_msgSend(v23, "na_map:", &__block_literal_global_6705);
          [v44 addObjectsFromArray:v25];
        }
        else
        {
          unint64_t v26 = a5;
          uint64_t v27 = (void *)MEMORY[0x1D944CB30]();
          uint64_t v28 = self;
          id v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = id v30 = v14;
            *(_DWORD *)buf = 138543874;
            __int16 v55 = v31;
            __int16 v56 = 2112;
            unint64_t v57 = v18;
            __int16 v58 = 2112;
            unint64_t v59 = (unint64_t)v24;
            _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to select records with parentModelID: %@: %@", buf, 0x20u);

            id v14 = v30;
            id v16 = v42;
          }

          a5 = v26;
          a3 = v43;
        }

        self = v45;
      }
      uint64_t v47 = [v16 countByEnumeratingWithState:&v50 objects:v64 count:16];
      if (v47) {
        continue;
      }
      break;
    }
  }

  if (a7 >= a8)
  {
    BOOL v33 = 1;
    id v32 = v41;
  }
  else
  {
    id v32 = v41;
    if ([v44 count]) {
      BOOL v33 = [(HMBLocalZone *)self _insertDeletionItemsForModelsAndDescendantModelsWithBlockRow:a3 context:v14 type:a5 modelIDs:v44 currentDepth:a7 + 1 maximumDepth:a8 options:v41 error:a10];
    }
    else {
      BOOL v33 = 1;
    }
  }
LABEL_24:

  return v33;
}

uint64_t __146__HMBLocalZone_Block___insertDeletionItemsForModelsAndDescendantModelsWithBlockRow_context_type_modelIDs_currentDepth_maximumDepth_options_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 modelID];
}

- (unint64_t)insertBlockToRemoveModelsAndDescendantModelsWithType:(unint64_t)a3 modelIDs:(id)a4 depth:(unint64_t)a5 options:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a6;
  uint64_t v25 = 0;
  unint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  id v14 = [(HMBLocalZone *)self sql];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105__HMBLocalZone_Block__insertBlockToRemoveModelsAndDescendantModelsWithType_modelIDs_depth_options_error___block_invoke;
  v19[3] = &unk_1E69EB438;
  unint64_t v22 = &v25;
  unint64_t v23 = a3;
  v19[4] = self;
  id v15 = v12;
  id v20 = v15;
  unint64_t v24 = a5;
  id v16 = v13;
  id v21 = v16;
  LODWORD(a7) = [v14 sqlTransactionWithActivity:0 error:a7 block:v19];

  if (a7) {
    unint64_t v17 = v26[3];
  }
  else {
    unint64_t v17 = 0;
  }

  _Block_object_dispose(&v25, 8);
  return v17;
}

id __105__HMBLocalZone_Block__insertBlockToRemoveModelsAndDescendantModelsWithType_modelIDs_depth_options_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = a1[8];
  id v22 = 0;
  uint64_t v7 = [v4 _insertBlockWithZoneRow:v5 type:v6 error:&v22];
  id v8 = v22;
  *(void *)(*(void *)(a1[7] + 8) + 24) = v7;
  uint64_t v9 = a1[6];
  uint64_t v10 = *(void *)(*(void *)(a1[7] + 8) + 24);
  uint64_t v11 = (void *)a1[4];
  uint64_t v12 = a1[5];
  uint64_t v13 = a1[8];
  uint64_t v14 = a1[9];
  id v21 = v8;
  [v11 _insertDeletionItemsForModelsAndDescendantModelsWithBlockRow:v10 context:v4 type:v13 modelIDs:v12 currentDepth:1 maximumDepth:v14 options:v9 error:&v21];
  id v15 = v21;

  uint64_t v16 = a1[6];
  uint64_t v17 = *(void *)(*(void *)(a1[7] + 8) + 24);
  id v20 = v15;
  [v4 _updateBlockWithRow:v17 options:v16 error:&v20];

  id v18 = v20;
  return v18;
}

- (unint64_t)insertBlockToRemoveChildModelsWithType:(unint64_t)a3 parentModelID:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v22 = 0;
  unint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v12 = [(HMBLocalZone *)self sql];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__HMBLocalZone_Block__insertBlockToRemoveChildModelsWithType_parentModelID_options_error___block_invoke;
  v17[3] = &unk_1E69EB410;
  id v20 = &v22;
  unint64_t v21 = a3;
  v17[4] = self;
  id v13 = v10;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  LODWORD(a6) = [v12 sqlTransactionWithActivity:0 error:a6 block:v17];

  if (a6) {
    unint64_t v15 = v23[3];
  }
  else {
    unint64_t v15 = 0;
  }

  _Block_object_dispose(&v22, 8);
  return v15;
}

id __90__HMBLocalZone_Block__insertBlockToRemoveChildModelsWithType_parentModelID_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = *(void *)(a1 + 64);
  id v20 = 0;
  uint64_t v7 = [v4 _insertBlockWithZoneRow:v5 type:v6 error:&v20];
  id v8 = v20;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
  uint64_t v9 = [*(id *)(a1 + 32) zoneRow];
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v12 = *(void *)(a1 + 40);
  id v19 = v8;
  [v4 _insertDeletionItemsWithZoneRow:v9 blockRow:v11 type:v10 parentModelID:v12 error:&v19];
  id v13 = v19;

  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v18 = v13;
  [v4 _updateBlockWithRow:v15 options:v14 error:&v18];

  id v16 = v18;
  return v16;
}

- (unint64_t)insertBlockToRemoveAllModelsWithType:(unint64_t)a3 modelTypes:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v22 = 0;
  unint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v12 = [(HMBLocalZone *)self sql];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__HMBLocalZone_Block__insertBlockToRemoveAllModelsWithType_modelTypes_options_error___block_invoke;
  v17[3] = &unk_1E69EB410;
  id v20 = &v22;
  unint64_t v21 = a3;
  v17[4] = self;
  id v13 = v10;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  LODWORD(a6) = [v12 sqlTransactionWithActivity:0 error:a6 block:v17];

  if (a6) {
    unint64_t v15 = v23[3];
  }
  else {
    unint64_t v15 = 0;
  }

  _Block_object_dispose(&v22, 8);
  return v15;
}

id __85__HMBLocalZone_Block__insertBlockToRemoveAllModelsWithType_modelTypes_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) zoneRow];
  uint64_t v5 = *(void *)(a1 + 64);
  id v28 = 0;
  uint64_t v6 = [v3 _insertBlockWithZoneRow:v4 type:v5 error:&v28];
  id v7 = v28;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      id v13 = v7;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * v12);
        uint64_t v15 = [*(id *)(a1 + 32) zoneRow];
        uint64_t v16 = *(void *)(a1 + 64);
        uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        id v23 = v13;
        [v3 _insertDeletionItemsWithZoneRow:v15 blockRow:v17 type:v16 modelType:v14 error:&v23];
        id v7 = v23;

        ++v12;
        id v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v22 = v7;
  [v3 _updateBlockWithRow:v19 options:v18 error:&v22];
  id v20 = v22;

  return v20;
}

- (unint64_t)insertBlockWithType:(unint64_t)a3 options:(id)a4 items:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v12 = [(HMBLocalZone *)self sql];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__HMBLocalZone_Block__insertBlockWithType_options_items_error___block_invoke;
  v17[3] = &unk_1E69EB410;
  id v20 = &v22;
  unint64_t v21 = a3;
  v17[4] = self;
  id v13 = v10;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  LODWORD(a6) = [v12 sqlTransactionWithActivity:0 error:a6 block:v17];

  if (a6) {
    unint64_t v15 = v23[3];
  }
  else {
    unint64_t v15 = 0;
  }

  _Block_object_dispose(&v22, 8);
  return v15;
}

id __63__HMBLocalZone_Block__insertBlockWithType_options_items_error___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  id v12 = 0;
  uint64_t v9 = [v4 _insertBlockWithZoneRow:v5 type:v6 options:v7 items:v8 error:&v12];

  id v10 = v12;
  *(void *)(*(void *)(a1[7] + 8) + 24) = v9;
  return v10;
}

- (id)createInputBlockWithType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v7 = [(HMBLocalZone *)self sql];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__HMBLocalZone_Block__createInputBlockWithType_error___block_invoke;
  v15[3] = &unk_1E69EB3E8;
  v15[4] = self;
  v15[5] = &v16;
  v15[6] = a3;
  LODWORD(a4) = [v7 sqlBlockWithActivity:0 error:a4 block:v15];

  if (a4)
  {
    uint64_t v8 = [HMBLocalSQLContextInputBlock alloc];
    uint64_t v9 = [(HMBLocalZone *)self sql];
    id v10 = [(HMBLocalZone *)self zoneID];
    id v11 = [v10 name];
    unint64_t v12 = [(HMBLocalZone *)self zoneRow];
    id v13 = [(HMBLocalSQLContextInputBlock *)v8 initWithOwner:v9 identifier:v11 zoneRow:v12 blockRow:v17[3] type:a3];
  }
  else
  {
    id v13 = 0;
  }
  _Block_object_dispose(&v16, 8);
  return v13;
}

id __54__HMBLocalZone_Block__createInputBlockWithType_error___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = a1[6];
  id v10 = 0;
  uint64_t v7 = [v4 _insertBlockWithZoneRow:v5 type:v6 error:&v10];

  id v8 = v10;
  *(void *)(*(void *)(a1[5] + 8) + 24) = v7;
  return v8;
}

- (id)createOutputBlockWithError:(id *)a3
{
  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v5 = [(HMBLocalZone *)self sql];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__HMBLocalZone_Block__createOutputBlockWithError___block_invoke;
  v13[3] = &unk_1E69EB7A8;
  v13[4] = self;
  void v13[5] = &v14;
  LODWORD(a3) = [v5 sqlBlockWithActivity:0 error:a3 block:v13];

  if (a3)
  {
    uint64_t v6 = [HMBLocalSQLContextOutputBlock alloc];
    uint64_t v7 = [(HMBLocalZone *)self sql];
    id v8 = [(HMBLocalZone *)self zoneID];
    uint64_t v9 = [v8 name];
    unint64_t v10 = [(HMBLocalZone *)self zoneRow];
    id v11 = [(HMBLocalSQLContextOutputBlock *)v6 initWithOwner:v7 identifier:v9 zoneRow:v10 blockRow:v15[3]];
  }
  else
  {
    id v11 = 0;
  }
  _Block_object_dispose(&v14, 8);
  return v11;
}

id __50__HMBLocalZone_Block__createOutputBlockWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = 0;
  uint64_t v5 = objc_msgSend(v4, "_insertBlockWithZoneRow:type:error:", objc_msgSend(v3, "zoneRow"), 0, &v8);

  id v6 = v8;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  return v6;
}

- (id)remove:(id)a3
{
  return [(HMBLocalZone *)self update:MEMORY[0x1E4F1CBF0] remove:a3];
}

- (id)update:(id)a3
{
  return [(HMBLocalZone *)self update:a3 remove:MEMORY[0x1E4F1CBF0]];
}

- (id)update:(id)a3 remove:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D944CB30]();
  uint64_t v9 = self;
  unint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v44 = v11;
    __int16 v45 = 2112;
    id v46 = v6;
    __int16 v47 = 2112;
    id v48 = v7;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Asked to update models: %@ remove model IDs: %@", buf, 0x20u);
  }
  id v31 = v7;

  unint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v39;
    obuint64_t j = v13;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v19 = [(HMBLocalZone *)v9 modelContainer];
        id v37 = 0;
        id v20 = [v19 dataFromModel:v18 encoding:2 storageLocation:3 updatedModelIDs:0 error:&v37];
        id v21 = v37;

        if (!v20)
        {
          long long v26 = (void *)MEMORY[0x1D944CB30]();
          long long v27 = v9;
          id v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            id v29 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            id v44 = v29;
            __int16 v45 = 2112;
            id v46 = v18;
            __int16 v47 = 2112;
            id v48 = v21;
            _os_log_impl(&dword_1D4693000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode model %@: %@", buf, 0x20u);
          }
          uint64_t v25 = v31;
          id v13 = obj;
          id v23 = obj;
          goto LABEL_15;
        }
        uint64_t v22 = [[HMBLocalZoneRawUpdateEntry alloc] initWithModel:v18 encoded:v20];
        [v12 addObject:v22];
      }
      id v13 = obj;
      uint64_t v15 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v23 = [(HMBLocalZone *)v9 localDatabase];
  uint64_t v24 = [v23 local];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __37__HMBLocalZone_Model__update_remove___block_invoke;
  v33[3] = &unk_1E69EB6C0;
  id v34 = v12;
  id v35 = v9;
  uint64_t v25 = v31;
  id v36 = v31;
  id v21 = [v24 sqlTransactionWithActivity:0 block:v33];

LABEL_15:
  return v21;
}

id __37__HMBLocalZone_Model__update_remove___block_invoke(id *a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = a1[4];
  uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  id v4 = 0;
  if (v36)
  {
    uint64_t v5 = *(void *)v46;
    uint64_t v29 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v46 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v8 = [a1[5] zoneRow];
        uint64_t v9 = [v7 model];
        unint64_t v10 = [v9 hmbModelID];
        id v44 = v4;
        id v11 = [v3 _selectRecordWithZoneRow:v8 modelID:v10 returning:2 error:&v44];
        id v12 = v44;

        if (v12)
        {
          id v27 = v12;

          goto LABEL_21;
        }
        if (v11)
        {
          uint64_t v13 = [v11 recordRow];
          uint64_t v14 = [v7 encoded];
          id v42 = 0;
          [v3 _updateRecordWithRow:v13 modelEncoding:2 modelData:v14 modelSchema:0 error:&v42];
          id v4 = v42;
        }
        else
        {
          uint64_t v32 = [a1[5] zoneRow];
          uint64_t v14 = [v7 model];
          BOOL v33 = [v14 hmbModelID];
          id v35 = [v7 model];
          id v31 = [v35 hmbParentModelID];
          id v34 = [v7 model];
          uint64_t v15 = [v34 hmbType];
          uint64_t v16 = [v7 encoded];
          id v43 = 0;
          uint64_t v17 = [v3 _insertRecordWithZoneRow:v32 externalID:0 externalData:0 modelID:v33 parentModelID:v31 modelType:v15 modelEncoding:2 modelData:v16 modelSchema:0 pushEncoding:0 pushData:0 pushBlockRow:0 error:&v43];
          id v4 = v43;
          uint64_t v18 = [v7 model];
          [v18 setHmbRecordRow:v17];

          uint64_t v5 = v29;
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v36) {
        continue;
      }
      break;
    }
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v19 = a1[6];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v39;
    do
    {
      uint64_t v23 = 0;
      uint64_t v24 = v4;
      do
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * v23);
        uint64_t v26 = [a1[5] zoneRow];
        id v37 = v24;
        [v3 _deleteRecordWithZoneRow:v26 modelID:v25 error:&v37];
        id v4 = v37;

        ++v23;
        uint64_t v24 = v4;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v21);
  }

  id v27 = v4;
LABEL_21:

  return v27;
}

- (id)modelFromData:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 recordRowID:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  uint64_t v13 = [(HMBLocalZone *)self modelContainer];
  uint64_t v14 = [v13 modelFromData:v12 encoding:a4 storageLocation:a5 error:a7];

  [v14 setHmbRecordRow:a6];
  return v14;
}

- (id)modelFromRecord:(id)a3 storageLocation:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 modelData];
  if (v8 && [v7 modelEncoding])
  {
    uint64_t v9 = -[HMBLocalZone modelFromData:encoding:storageLocation:recordRowID:error:](self, "modelFromData:encoding:storageLocation:recordRowID:error:", v8, [v7 modelEncoding], 2, objc_msgSend(v7, "recordRow"), a5);
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    uint64_t v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)removeAllRecordsWithError:(id *)a3
{
  uint64_t v5 = [(HMBLocalZone *)self sql];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HMBLocalZone_Record_Internal__removeAllRecordsWithError___block_invoke;
  v7[3] = &unk_1E69EB758;
  v7[4] = self;
  LOBYTE(a3) = [v5 sqlTransactionWithActivity:0 error:a3 block:v7];

  return (char)a3;
}

id __59__HMBLocalZone_Record_Internal__removeAllRecordsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__7336;
  uint64_t v24 = __Block_byref_object_dispose__7337;
  id v25 = 0;
  uint64_t v4 = [*(id *)(a1 + 32) zoneRow];
  uint64_t v5 = (id *)(v21 + 5);
  obuint64_t j = (id)v21[5];
  [v3 _deleteRecordsWithZoneRow:v4 error:&obj];
  objc_storeStrong(v5, obj);
  uint64_t v6 = [*(id *)(a1 + 32) zoneRow];
  id v7 = (id *)(v21 + 5);
  id v18 = (id)v21[5];
  [v3 _deleteItemWithZoneRow:v6 error:&v18];
  objc_storeStrong(v7, v18);
  uint64_t v8 = [*(id *)(a1 + 32) zoneRow];
  uint64_t v9 = (id *)(v21 + 5);
  id v17 = (id)v21[5];
  [v3 _deleteBlocksWithZoneRow:v8 error:&v17];
  objc_storeStrong(v9, v17);
  uint64_t v10 = [*(id *)(a1 + 32) zoneRow];
  id v11 = (id *)(v21 + 5);
  id v16 = (id)v21[5];
  [v3 _deleteIndexSentinelsWithZoneRow:v10 error:&v16];
  objc_storeStrong(v11, v16);
  id v12 = [v3 queryContextsByModelType];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__HMBLocalZone_Record_Internal__removeAllRecordsWithError___block_invoke_2;
  v15[3] = &unk_1E69EB730;
  v15[4] = *(void *)(a1 + 32);
  v15[5] = &v20;
  [v12 enumerateKeysAndObjectsUsingBlock:v15];

  id v13 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v13;
}

void __59__HMBLocalZone_Record_Internal__removeAllRecordsWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = [v4 zoneRow];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v7 + 40);
  [v5 _deleteQueryForRecordRow:v6 error:&obj];

  objc_storeStrong((id *)(v7 + 40), obj);
}

- (id)setExternalID:(id)a3 externalData:(id)a4 forRecordRow:(unint64_t)a5
{
  id v7 = a3;
  uint64_t v8 = [(HMBLocalZone *)self sql];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__HMBLocalZone_Record_Internal__setExternalID_externalData_forRecordRow___block_invoke;
  void v12[3] = &unk_1E69EB708;
  id v13 = v7;
  unint64_t v14 = a5;
  id v9 = v7;
  uint64_t v10 = [v8 sqlBlockWithActivity:0 block:v12];

  return v10;
}

id __73__HMBLocalZone_Record_Internal__setExternalID_externalData_forRecordRow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v6 = 0;
  [a2 _updateRecordWithRow:v2 externalID:v3 externalData:v3 error:&v6];
  id v4 = v6;
  return v4;
}

- (id)queryAllRowRecordsReturning:(unint64_t)a3
{
  id v5 = [(HMBLocalZone *)self sql];
  id v6 = objc_msgSend(v5, "selectAllRecordsWithZoneRow:returning:", -[HMBLocalZone zoneRow](self, "zoneRow"), a3);

  return v6;
}

- (id)fetchExternalIDsForModelIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v8 = [(HMBLocalZone *)self sql];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HMBLocalZone_Record_Internal__fetchExternalIDsForModelIDs_error___block_invoke;
  v15[3] = &unk_1E69EB6C0;
  id v9 = v6;
  id v16 = v9;
  id v17 = self;
  id v10 = v7;
  id v18 = v10;
  LODWORD(v7) = [v8 sqlBlockWithActivity:0 error:a4 block:v15];

  id v11 = 0;
  if (v7)
  {
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    id v13 = objc_msgSend(v10, "na_map:", &__block_literal_global_7339);
    id v11 = [v12 setWithArray:v13];
  }
  return v11;
}

id __67__HMBLocalZone_Record_Internal__fetchExternalIDsForModelIDs_error___block_invoke(id *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = a1[4];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      id v10 = v7;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
        uint64_t v12 = [a1[5] zoneRow];
        id v16 = v10;
        id v13 = [v3 _selectRecordWithZoneRow:v12 modelID:v11 returning:3 error:&v16];
        id v7 = v16;

        if (v7) {
          BOOL v14 = 1;
        }
        else {
          BOOL v14 = v13 == 0;
        }
        if (!v14) {
          [a1[6] addObject:v13];
        }

        ++v9;
        id v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __67__HMBLocalZone_Record_Internal__fetchExternalIDsForModelIDs_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 externalID];
}

- (id)fetchRecordRowWithExternalID:(id)a3 returning:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__7336;
  uint64_t v21 = __Block_byref_object_dispose__7337;
  id v22 = 0;
  uint64_t v9 = [(HMBLocalZone *)self sql];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__HMBLocalZone_Record_Internal__fetchRecordRowWithExternalID_returning_error___block_invoke;
  v13[3] = &unk_1E69EB698;
  uint64_t v15 = &v17;
  v13[4] = self;
  id v10 = v8;
  id v14 = v10;
  unint64_t v16 = a4;
  LODWORD(a5) = [v9 sqlBlockWithActivity:0 error:a5 block:v13];

  if (a5) {
    id v11 = (id)v18[5];
  }
  else {
    id v11 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

id __78__HMBLocalZone_Record_Internal__fetchRecordRowWithExternalID_returning_error___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[7];
  id v13 = 0;
  uint64_t v8 = [v4 _selectRecordWithZoneRow:v5 externalID:v6 returning:v7 error:&v13];

  id v9 = v13;
  uint64_t v10 = *(void *)(a1[6] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  return v9;
}

- (id)fetchRecordRowWithModelID:(id)a3 returning:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__7336;
  uint64_t v21 = __Block_byref_object_dispose__7337;
  id v22 = 0;
  id v9 = [(HMBLocalZone *)self sql];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__HMBLocalZone_Record_Internal__fetchRecordRowWithModelID_returning_error___block_invoke;
  v13[3] = &unk_1E69EB698;
  uint64_t v15 = &v17;
  v13[4] = self;
  id v10 = v8;
  id v14 = v10;
  unint64_t v16 = a4;
  LODWORD(a5) = [v9 sqlBlockWithActivity:0 error:a5 block:v13];

  if (a5) {
    id v11 = (id)v18[5];
  }
  else {
    id v11 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

id __75__HMBLocalZone_Record_Internal__fetchRecordRowWithModelID_returning_error___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[7];
  id v13 = 0;
  uint64_t v8 = [v4 _selectRecordWithZoneRow:v5 modelID:v6 returning:v7 error:&v13];

  id v9 = v13;
  uint64_t v10 = *(void *)(a1[6] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  return v9;
}

- (id)fetchModelWithModelID:(id)a3 recordRow:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__7336;
  uint64_t v21 = __Block_byref_object_dispose__7337;
  id v22 = 0;
  id v9 = [(HMBLocalZone *)self sql];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__HMBLocalZone_Record_Internal__fetchModelWithModelID_recordRow_error___block_invoke;
  v14[3] = &unk_1E69EB670;
  unint64_t v16 = &v17;
  void v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  int v11 = [v9 sqlBlockWithActivity:0 error:a5 block:v14];

  if (v11)
  {
    if (a4) {
      *a4 = [(id)v18[5] recordRow];
    }
    uint64_t v12 = [(HMBLocalZone *)self modelFromRecord:v18[5] storageLocation:2 error:a5];
  }
  else
  {
    uint64_t v12 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

id __71__HMBLocalZone_Record_Internal__fetchModelWithModelID_recordRow_error___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = a1[5];
  id v12 = 0;
  uint64_t v7 = [v4 _selectRecordWithZoneRow:v5 modelID:v6 returning:2 error:&v12];

  id v8 = v12;
  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  return v8;
}

- (id)fetchModelWithRecordRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__7336;
  id v15 = __Block_byref_object_dispose__7337;
  id v16 = 0;
  uint64_t v7 = [(HMBLocalZone *)self sql];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HMBLocalZone_Record_Internal__fetchModelWithRecordRow_error___block_invoke;
  v10[3] = &unk_1E69EB648;
  void v10[4] = &v11;
  void v10[5] = a3;
  LODWORD(a3) = [v7 sqlBlockWithActivity:0 error:a4 block:v10];

  if (a3)
  {
    id v8 = [(HMBLocalZone *)self modelFromRecord:v12[5] storageLocation:2 error:a4];
  }
  else
  {
    id v8 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

id __63__HMBLocalZone_Record_Internal__fetchModelWithRecordRow_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  uint64_t v4 = [a2 _selectRecordWithRow:v3 returning:2 error:&v9];
  id v5 = v9;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  return v5;
}

- (id)fetchModelsOfType:(Class)a3 error:(id *)a4
{
  uint64_t v7 = NSStringFromClass(a3);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__7336;
  long long v20 = __Block_byref_object_dispose__7337;
  id v21 = 0;
  id v8 = [(HMBLocalZone *)self sql];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__HMBLocalZone_Record__fetchModelsOfType_error___block_invoke;
  v13[3] = &unk_1E69EB670;
  id v15 = &v16;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  int v10 = [v8 sqlBlockWithActivity:0 error:a4 block:v13];

  if (v10)
  {
    uint64_t v11 = __modelsFromRecords(self, (void *)v17[5], (uint64_t)a3, a4);
  }
  else
  {
    uint64_t v11 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v11;
}

id __48__HMBLocalZone_Record__fetchModelsOfType_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = a1[5];
  id v12 = 0;
  uint64_t v7 = [v4 _selectRecordsWithZoneRow:v5 modelType:v6 returning:2 error:&v12];

  id v8 = v12;
  uint64_t v9 = *(void *)(a1[6] + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  return v8;
}

- (id)fetchAllModelsWithError:(id *)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__7336;
  id v14 = __Block_byref_object_dispose__7337;
  id v15 = 0;
  uint64_t v5 = [(HMBLocalZone *)self sql];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__HMBLocalZone_Record__fetchAllModelsWithError___block_invoke;
  v9[3] = &unk_1E69EB7A8;
  v9[4] = self;
  void v9[5] = &v10;
  int v6 = [v5 sqlBlockWithActivity:0 error:a3 block:v9];

  if (v6)
  {
    uint64_t v7 = __modelsFromRecords(self, (void *)v11[5], 0, a3);
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

id __48__HMBLocalZone_Record__fetchAllModelsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v10 = 0;
  uint64_t v5 = objc_msgSend(v4, "_selectRecordsWithZoneRow:returning:error:", objc_msgSend(v3, "zoneRow"), 2, &v10);

  id v6 = v10;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  return v6;
}

- (id)fetchModelsWithParentModelID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__7336;
  uint64_t v19 = __Block_byref_object_dispose__7337;
  id v20 = 0;
  uint64_t v7 = [(HMBLocalZone *)self sql];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__HMBLocalZone_Record__fetchModelsWithParentModelID_error___block_invoke;
  void v12[3] = &unk_1E69EB670;
  id v14 = &v15;
  void v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  int v9 = [v7 sqlBlockWithActivity:0 error:a4 block:v12];

  if (v9)
  {
    id v10 = __modelsFromRecords(self, (void *)v16[5], 0, a4);
  }
  else
  {
    id v10 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v10;
}

id __59__HMBLocalZone_Record__fetchModelsWithParentModelID_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = a1[5];
  id v12 = 0;
  uint64_t v7 = [v4 _selectRecordsWithZoneRow:v5 parentModelID:v6 returning:2 error:&v12];

  id v8 = v12;
  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  return v8;
}

- (id)fetchModelsWithParentModelID:(id)a3 ofType:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__7336;
  id v25 = __Block_byref_object_dispose__7337;
  id v26 = 0;
  uint64_t v11 = [(HMBLocalZone *)self sql];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__HMBLocalZone_Record__fetchModelsWithParentModelID_ofType_error___block_invoke;
  v17[3] = &unk_1E69EB780;
  id v20 = &v21;
  v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  int v14 = [v11 sqlBlockWithActivity:0 error:a5 block:v17];

  if (v14)
  {
    uint64_t v15 = __modelsFromRecords(self, (void *)v22[5], (uint64_t)a4, a5);
  }
  else
  {
    uint64_t v15 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v15;
}

id __66__HMBLocalZone_Record__fetchModelsWithParentModelID_ofType_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  id v13 = 0;
  uint64_t v8 = [v4 _selectRecordWithZoneRow:v5 parentModelID:v6 modelType:v7 returning:2 error:&v13];

  id v9 = v13;
  uint64_t v10 = *(void *)(a1[7] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  return v9;
}

- (id)fetchModelWithModelID:(id)a3 ofType:(Class)a4 error:(id *)a5
{
  uint64_t v6 = -[HMBLocalZone fetchModelWithModelID:recordRow:error:](self, "fetchModelWithModelID:recordRow:error:", a3, 0);
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    if (a5)
    {
      [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      uint64_t v6 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (id)fetchModelWithModelID:(id)a3 error:(id *)a4
{
  return [(HMBLocalZone *)self fetchModelWithModelID:a3 recordRow:0 error:a4];
}

@end