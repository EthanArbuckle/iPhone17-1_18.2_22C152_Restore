@interface HDDataManager
- (BOOL)_deleteObjectsWithTypes:(void *)a3 sourceEntities:(void *)a4 recursiveDeleteAuthorizationBlock:(char)a5 userRequested:(void *)a6 error:;
- (BOOL)_insertDataObjects:(void *)a3 insertionContext:(void *)a4 lastInsertedIDOut:(void *)a5 error:;
- (BOOL)_synchronousObserverLock_hasSynchronousObserverForSampleType:(uint64_t)a1;
- (BOOL)containsDataObject:(id)a3;
- (BOOL)deleteDataObjects:(id)a3 restrictedSourceEntities:(id)a4 failIfNotFound:(BOOL)a5 recursiveDeleteAuthorizationBlock:(id)a6 error:(id *)a7;
- (BOOL)deleteDataObjectsOfClass:(Class)a3 predicate:(id)a4 limit:(unint64_t)a5 deletedSampleCount:(unint64_t *)a6 notifyObservers:(BOOL)a7 generateDeletedObjects:(BOOL)a8 recursiveDeleteAuthorizationBlock:(id)a9 error:(id *)a10;
- (BOOL)deleteDataObjectsOfClass:(Class)a3 predicate:(id)a4 limit:(unint64_t)a5 deletedSampleCount:(unint64_t *)a6 notifyObservers:(BOOL)a7 generateDeletedObjects:(BOOL)a8 userRequested:(BOOL)a9 recursiveDeleteAuthorizationBlock:(id)a10 error:(id *)a11;
- (BOOL)deleteObjectsWithUUIDCollection:(id)a3 configuration:(id)a4 error:(id *)a5;
- (BOOL)deleteSamplesWithSourceEntities:(id)a3 error:(id *)a4;
- (BOOL)deleteSamplesWithTypes:(id)a3 sourceBundleIdentifier:(id)a4 userRequested:(BOOL)a5 recursiveDeleteAuthorizationBlock:(id)a6 error:(id *)a7;
- (BOOL)deleteSamplesWithTypes:(id)a3 sourceEntities:(id)a4 recursiveDeleteAuthorizationBlock:(id)a5 error:(id *)a6;
- (BOOL)deleteSamplesWithUUIDs:(id)a3 generateDeletedObjects:(BOOL)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)deleteSamplesWithUUIDs:(id)a3 userRequested:(BOOL)a4 recursiveDeleteAuthorizationBlock:(id)a5 error:(id *)a6;
- (BOOL)insertDataObjects:(id)a3 error:(id *)a4;
- (BOOL)insertDataObjects:(id)a3 sourceEntity:(id)a4 deviceEntity:(id)a5 sourceVersion:(id)a6 creationDate:(double)a7 error:(id *)a8;
- (BOOL)insertDataObjects:(id)a3 withProvenance:(id)a4 creationDate:(double)a5 error:(id *)a6;
- (BOOL)insertDataObjects:(id)a3 withProvenance:(id)a4 creationDate:(double)a5 skipInsertionFilter:(BOOL)a6 error:(id *)a7;
- (BOOL)insertDataObjects:(id)a3 withProvenance:(id)a4 creationDate:(double)a5 skipInsertionFilter:(BOOL)a6 updateSourceOrder:(BOOL)a7 resolveAssociations:(BOOL)a8 error:(id *)a9;
- (HDDataManager)initWithProfile:(id)a3;
- (HDQuantitySeriesManager)quantitySeriesManager;
- (id)_observersForAllTypes;
- (id)_queue_observersAllTypesCreateIfNil:(uint64_t)a1;
- (id)_queue_observersForDataType:(int)a3 createIfNil:;
- (id)_queue_observersForKey:(int)a3 createIfNil:;
- (id)_synchronousObserverLock_synchronousObserverSetForSampleType:(uint64_t)a1;
- (id)diagnosticDescription;
- (int64_t)hasSampleWithBundleIdentifier:(id)a3 error:(id *)a4;
- (uint64_t)_updateSourceAndLastAnchorForObjects:(void *)a3 insertionContext:(void *)a4 lastInsertedID:(char)a5 isDatabaseAccessible:(int)a6 shouldUpdateSourceOrder:(void *)a7 error:;
- (void)_callObserversIfPossible;
- (void)_notifySynchronousObserversIfPossibleInTransaction:(uint64_t)a1;
- (void)_observersForDataType:(void *)a1;
- (void)_shouldNotifyForDeletedSamplesOfTypes:(void *)a3 intervals:(char)a4 userRequested:(void *)a5 anchor:;
- (void)addObserver:(id)a3 forDataType:(id)a4;
- (void)addObserverForAllTypes:(id)a3;
- (void)addSynchronousObserver:(id)a3 forSampleType:(id)a4;
- (void)closeObserverTransaction;
- (void)openObserverTransaction;
- (void)removeObserver:(id)a3 forDataType:(id)a4;
- (void)removeObserverForAllTypes:(id)a3;
- (void)removeSynchronousObserver:(id)a3 forSampleType:(id)a4;
- (void)setBackgroundObserverFrequency:(id)a3 forDataType:(id)a4 frequency:(int64_t)a5 appSDKVersionToken:(unint64_t)a6 completion:(id)a7;
- (void)shouldNotifyForDataObjects:(id)a3 provenance:(id)a4 database:(id)a5 anchor:(id)a6;
- (void)shouldNotifyForDeletedSamplesOfTypes:(id)a3 intervals:(id)a4 userRequested:(BOOL)a5 transaction:(id)a6 anchor:(id)a7;
- (void)synchronouslyCloseObserverTransactionAndNotify;
@end

@implementation HDDataManager

- (void)addObserver:(id)a3 forDataType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HDDataManager_addObserver_forDataType___block_invoke;
  block[3] = &unk_1E62F30F8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __41__HDDataManager_addObserver_forDataType___block_invoke(uint64_t a1)
{
  -[HDDataManager _queue_observersForDataType:createIfNil:](*(void *)(a1 + 32), *(void **)(a1 + 40), 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:*(void *)(a1 + 48)];
}

- (id)_queue_observersForDataType:(int)a3 createIfNil:
{
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 8);
    id v6 = a2;
    dispatch_assert_queue_V2(v5);
    id v7 = NSNumber;
    uint64_t v8 = [v6 code];

    id v9 = [v7 numberWithInteger:v8];
    id v10 = -[HDDataManager _queue_observersForKey:createIfNil:](a1, v9, a3);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_queue_observersForKey:(int)a3 createIfNil:
{
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v6 = [*(id *)(a1 + 24) objectForKey:v5];
    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = a3 == 0;
    }
    if (!v7)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      [*(id *)(a1 + 24) setObject:v6 forKey:v5];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)deleteDataObjectsOfClass:(Class)a3 predicate:(id)a4 limit:(unint64_t)a5 deletedSampleCount:(unint64_t *)a6 notifyObservers:(BOOL)a7 generateDeletedObjects:(BOOL)a8 recursiveDeleteAuthorizationBlock:(id)a9 error:(id *)a10
{
  LOBYTE(v11) = 0;
  return [(HDDataManager *)self deleteDataObjectsOfClass:a3 predicate:a4 limit:a5 deletedSampleCount:a6 notifyObservers:a7 generateDeletedObjects:a8 userRequested:v11 recursiveDeleteAuthorizationBlock:a9 error:a10];
}

- (void)removeObserver:(id)a3 forDataType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HDDataManager_removeObserver_forDataType___block_invoke;
  block[3] = &unk_1E62F30F8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __44__HDDataManager_removeObserver_forDataType___block_invoke(uint64_t a1)
{
  -[HDDataManager _queue_observersForDataType:createIfNil:](*(void *)(a1 + 32), *(void **)(a1 + 40), 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeObject:*(void *)(a1 + 48)];
}

- (BOOL)insertDataObjects:(id)a3 withProvenance:(id)a4 creationDate:(double)a5 error:(id *)a6
{
  return [(HDDataManager *)self insertDataObjects:a3 withProvenance:a4 creationDate:0 skipInsertionFilter:1 updateSourceOrder:0 resolveAssociations:a6 error:a5];
}

- (void)_callObserversIfPossible
{
  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 8));
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__132;
    v24 = __Block_byref_object_dispose__132;
    id v25 = 0;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__132;
    v18 = __Block_byref_object_dispose__132;
    id v19 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    id v2 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__HDDataManager__callObserversIfPossible__block_invoke;
    block[3] = &unk_1E6305148;
    block[4] = a1;
    void block[5] = &v10;
    block[6] = &v14;
    block[7] = &v20;
    dispatch_sync(v2, block);
    if (*((unsigned char *)v11 + 24))
    {
      v3 = (void *)v21[5];
      id v4 = (id)v15[5];
      id v5 = v3;
      id v6 = *(NSObject **)(a1 + 16);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __73__HDDataManager__notifyObserversWithAddedObjectsBySampleType_lastAnchor___block_invoke;
      v26[3] = &unk_1E62F30F8;
      id v7 = v4;
      id v27 = v7;
      uint64_t v28 = a1;
      id v8 = v5;
      id v29 = v8;
      dispatch_async(v6, v26);
    }
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
}

void __41__HDDataManager__callObserversIfPossible__block_invoke(void *a1)
{
  if (!*(void *)(a1[4] + 56))
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    uint64_t v2 = [*(id *)(a1[4] + 64) copy];
    uint64_t v3 = *(void *)(a1[6] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    [*(id *)(a1[4] + 64) removeAllObjects];
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 72));
    uint64_t v5 = a1[4];
    id v6 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = 0;
  }
}

void __73__HDDataManager__notifyObserversWithAddedObjectsBySampleType_lastAnchor___block_invoke(uint64_t a1)
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = [*(id *)(a1 + 32) allKeys];
  id v4 = (void *)[v2 initWithArray:v3];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 120));
  v64 = [WeakRetained appSubscriptionManager];

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = v4;
  uint64_t v66 = [obj countByEnumeratingWithState:&v89 objects:v101 count:16];
  if (v66)
  {
    uint64_t v65 = *(void *)v90;
    uint64_t v63 = a1;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v90 != v65) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v89 + 1) + 8 * v7);
        uint64_t v9 = *(void *)(a1 + 48);
        if (v9) {
          objc_msgSend(v64, "setAnchor:forDataCode:type:", v9, objc_msgSend(*(id *)(*((void *)&v89 + 1) + 8 * v7), "code"), 0);
        }
        uint64_t v10 = -[HDDataManager _observersForDataType:](*(void **)(a1 + 40), v8);
        if ([v10 count])
        {
          uint64_t v69 = v7;
          uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
          uint64_t v12 = *(void *)(a1 + 48);
          uint64_t v13 = [v11 count];
          uint64_t v14 = 96;
          if (!v12) {
            uint64_t v14 = 104;
          }
          *(void *)(*(void *)(a1 + 40) + v14) += v13;
          uint64_t v15 = *(void *)(a1 + 40);
          uint64_t v16 = *(void **)(a1 + 48);
          v68 = v10;
          id v17 = v10;
          id v18 = v11;
          id v19 = v8;
          id v20 = v16;
          if (v15)
          {
            long long v95 = 0u;
            long long v96 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            uint64_t v21 = [v17 countByEnumeratingWithState:&v93 objects:buf count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v94;
              do
              {
                uint64_t v24 = 0;
                do
                {
                  if (*(void *)v94 != v23) {
                    objc_enumerationMutation(v17);
                  }
                  id v25 = *(void **)(*((void *)&v93 + 1) + 8 * v24);
                  if (v20)
                  {
                    [*(id *)(*((void *)&v93 + 1) + 8 * v24) samplesAdded:v18 anchor:v20];
                  }
                  else if (objc_opt_respondsToSelector())
                  {
                    [v25 samplesJournaled:v18 type:v19];
                  }
                  ++v24;
                }
                while (v22 != v24);
                uint64_t v22 = [v17 countByEnumeratingWithState:&v93 objects:buf count:16];
              }
              while (v22);
            }
          }

          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          id v26 = v17;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v85 objects:v100 count:16];
          a1 = v63;
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v86;
            do
            {
              uint64_t v30 = 0;
              do
              {
                if (*(void *)v86 != v29) {
                  objc_enumerationMutation(v26);
                }
                [v5 addObject:*(void *)(*((void *)&v85 + 1) + 8 * v30++)];
              }
              while (v28 != v30);
              uint64_t v28 = [v26 countByEnumeratingWithState:&v85 objects:v100 count:16];
            }
            while (v28);
          }

          uint64_t v10 = v68;
          uint64_t v7 = v69;
        }

        ++v7;
      }
      while (v7 != v66);
      uint64_t v66 = [obj countByEnumeratingWithState:&v89 objects:v101 count:16];
    }
    while (v66);
  }

  if (*(void *)(a1 + 48))
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v31 = v5;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v81 objects:v99 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v82;
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v82 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v81 + 1) + 8 * v35);
          if (objc_opt_respondsToSelector()) {
            [v36 didAddSamplesOfTypes:obj anchor:*(void *)(a1 + 48)];
          }
          ++v35;
        }
        while (v33 != v35);
        uint64_t v33 = [v31 countByEnumeratingWithState:&v81 objects:v99 count:16];
      }
      while (v33);
    }
  }
  v37 = -[HDDataManager _observersForAllTypes](*(void *)(a1 + 40));
  if ([v37 count])
  {
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v39 = *(void **)(a1 + 32);
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __73__HDDataManager__notifyObserversWithAddedObjectsBySampleType_lastAnchor___block_invoke_2;
    v79[3] = &unk_1E6304FE8;
    id v40 = v38;
    id v80 = v40;
    [v39 enumerateKeysAndObjectsUsingBlock:v79];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v41 = v37;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v75 objects:v98 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v76;
      do
      {
        uint64_t v45 = 0;
        do
        {
          if (*(void *)v76 != v44) {
            objc_enumerationMutation(v41);
          }
          [*(id *)(*((void *)&v75 + 1) + 8 * v45++) samplesAdded:v40 anchor:*(void *)(a1 + 48)];
        }
        while (v43 != v45);
        uint64_t v43 = [v41 countByEnumeratingWithState:&v75 objects:v98 count:16];
      }
      while (v43);
    }

    if (*(void *)(a1 + 48))
    {
      v70 = v37;
      uint64_t v46 = a1;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v47 = v41;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v71 objects:v97 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v72;
        do
        {
          uint64_t v51 = 0;
          do
          {
            if (*(void *)v72 != v50) {
              objc_enumerationMutation(v47);
            }
            v52 = *(void **)(*((void *)&v71 + 1) + 8 * v51);
            if (objc_opt_respondsToSelector()) {
              [v52 didAddSamplesOfTypes:obj anchor:*(void *)(v46 + 48)];
            }
            ++v51;
          }
          while (v49 != v51);
          uint64_t v49 = [v47 countByEnumeratingWithState:&v71 objects:v97 count:16];
        }
        while (v49);
      }

      a1 = v46;
      v37 = v70;
    }
  }
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v54 = *(void *)(a1 + 40);
  if (Current - *(double *)(v54 + 80) > 300.0 || (uint64_t v55 = *(void *)(v54 + 88), v55 == -1))
  {
    _HKInitializeLogging();
    v56 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      v57 = *(void **)(a1 + 40);
      uint64_t v58 = v57[12];
      uint64_t v59 = v57[11] & ~((uint64_t)v57[11] >> 63);
      uint64_t v60 = v57[13];
      v61 = v56;
      v62 = HKDiagnosticStringFromDuration();
      *(_DWORD *)buf = 138544386;
      v103 = v57;
      __int16 v104 = 2048;
      uint64_t v105 = v59;
      __int16 v106 = 2048;
      uint64_t v107 = v58;
      __int16 v108 = 2048;
      uint64_t v109 = v60;
      __int16 v110 = 2114;
      v111 = v62;
      _os_log_impl(&dword_1BCB7D000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@: added samples notifications (%ld): %ld added, %ld journaled in past %{public}@", buf, 0x34u);
    }
    *(double *)(*(void *)(a1 + 40) + 80) = Current;
    *(void *)(*(void *)(a1 + 40) + 88) = 0;
    *(void *)(*(void *)(a1 + 40) + 96) = 0;
    *(void *)(*(void *)(a1 + 40) + 104) = 0;
    uint64_t v54 = *(void *)(a1 + 40);
    uint64_t v55 = *(void *)(v54 + 88);
  }
  *(void *)(v54 + 88) = v55 + 1;
}

- (void)_observersForDataType:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__132;
    uint64_t v14 = __Block_byref_object_dispose__132;
    id v15 = 0;
    id v5 = a1[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__HDDataManager__observersForDataType___block_invoke;
    block[3] = &unk_1E62FEE30;
    uint64_t v9 = &v10;
    block[4] = a1;
    id v8 = v3;
    dispatch_sync(v5, block);
    a1 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

void __39__HDDataManager__observersForDataType___block_invoke(uint64_t a1)
{
  -[HDDataManager _queue_observersForDataType:createIfNil:](*(void *)(a1 + 32), *(void **)(a1 + 40), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_observersForAllTypes
{
  if (a1)
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    id v8 = __Block_byref_object_copy__132;
    uint64_t v9 = __Block_byref_object_dispose__132;
    id v10 = 0;
    v1 = *(NSObject **)(a1 + 8);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __38__HDDataManager__observersForAllTypes__block_invoke;
    v4[3] = &unk_1E62F3230;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __38__HDDataManager__observersForAllTypes__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v7 = [NSNumber numberWithInteger:-1];
  uint64_t v3 = -[HDDataManager _queue_observersForKey:createIfNil:](v2, v7, 0);
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)insertDataObjects:(id)a3 sourceEntity:(id)a4 deviceEntity:(id)a5 sourceVersion:(id)a6 creationDate:(double)a7 error:(id *)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  if (!v16)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"HDDataManager.m", 105, @"Invalid parameter not satisfying: %@", @"sourceEntity != nil" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v20 = [WeakRetained dataProvenanceManager];
  uint64_t v21 = [v20 localDataProvenanceForSourceEntity:v16 version:v18 deviceEntity:v17];

  if (!v21)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"HDDataManager.m", 110, @"Invalid parameter not satisfying: %@", @"provenance != nil" object file lineNumber description];
  }
  BOOL v22 = [(HDDataManager *)self insertDataObjects:v15 withProvenance:v21 creationDate:a8 error:a7];

  return v22;
}

- (BOOL)insertDataObjects:(id)a3 withProvenance:(id)a4 creationDate:(double)a5 skipInsertionFilter:(BOOL)a6 error:(id *)a7
{
  return [(HDDataManager *)self insertDataObjects:a3 withProvenance:a4 creationDate:a6 skipInsertionFilter:1 updateSourceOrder:0 resolveAssociations:a7 error:a5];
}

- (void)openObserverTransaction
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HDDataManager_openObserverTransaction__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __40__HDDataManager_openObserverTransaction__block_invoke(uint64_t result)
{
  return result;
}

- (void)closeObserverTransaction
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__HDDataManager_closeObserverTransaction__block_invoke;
  v4[3] = &unk_1E62F3198;
  v4[4] = self;
  v4[5] = a2;
  dispatch_sync(queue, v4);
  -[HDDataManager _callObserversIfPossible]((uint64_t)self);
}

void __41__HDDataManager_closeObserverTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 56);
  if (!v2)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"HDDataManager.m" lineNumber:1259 description:@"No open transactions"];

    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void *)(v1 + 56);
  }
  *(void *)(v1 + ++*(void *)(*(void *)(result + 32) + 56) = v2 - 1;
}

- (HDDataManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDDataManager;
  uint64_t v5 = [(HDDataManager *)&v18 init];
  if (v5)
  {
    uint64_t v6 = HKCreateSerialDispatchQueue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = HKCreateSerialDispatchQueue();
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (OS_dispatch_queue *)v8;

    objc_storeWeak((id *)&v5->_profile, v4);
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersByDataType = v5->_observersByDataType;
    v5->_observersByDataType = v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingObjectsBySampleType = v5->_pendingObjectsBySampleType;
    v5->_pendingObjectsBySampleType = (NSMutableDictionary *)v12;

    v5->_synchronousObserverLock._os_unfair_lock_opaque = 0;
    uint64_t v14 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v14 addObject:v5];

    id v15 = [[HDQuantitySeriesManager alloc] initWithProfile:v4];
    quantitySeriesManager = v5->_quantitySeriesManager;
    v5->_quantitySeriesManager = v15;

    v5->_notifyCount = -1;
    v5->_lastNotifyLogTime = CFAbsoluteTimeGetCurrent();
  }

  return v5;
}

- (BOOL)insertDataObjects:(id)a3 error:(id *)a4
{
  p_profile = &self->_profile;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  uint64_t v9 = [WeakRetained dataProvenanceManager];
  id v10 = [v9 defaultLocalDataProvenance];
  LOBYTE(a4) = [(HDDataManager *)self insertDataObjects:v7 withProvenance:v10 creationDate:0 skipInsertionFilter:1 updateSourceOrder:0 resolveAssociations:a4 error:CFAbsoluteTimeGetCurrent()];

  return (char)a4;
}

- (BOOL)insertDataObjects:(id)a3 withProvenance:(id)a4 creationDate:(double)a5 skipInsertionFilter:(BOOL)a6 updateSourceOrder:(BOOL)a7 resolveAssociations:(BOOL)a8 error:(id *)a9
{
  BOOL v10 = a8;
  BOOL v12 = a6;
  id v16 = a3;
  id v17 = a4;
  objc_super v18 = [HDDataEntityInsertionContext alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v20 = [(HDDataEntityInsertionContext *)v18 initWithProvenance:v17 creationDate:v12 skipInsertionFilter:v10 resolveAssociations:WeakRetained profile:a5];

  id v21 = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v22 = [v21 database];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __127__HDDataManager_insertDataObjects_withProvenance_creationDate_skipInsertionFilter_updateSourceOrder_resolveAssociations_error___block_invoke;
  v30[3] = &unk_1E6304EF8;
  v30[4] = self;
  id v31 = v16;
  uint64_t v32 = v20;
  BOOL v33 = a7;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __127__HDDataManager_insertDataObjects_withProvenance_creationDate_skipInsertionFilter_updateSourceOrder_resolveAssociations_error___block_invoke_2;
  v26[3] = &unk_1E6304F20;
  void v26[4] = self;
  id v27 = v31;
  uint64_t v28 = v32;
  BOOL v29 = a7;
  uint64_t v23 = v32;
  id v24 = v31;
  LOBYTE(a9) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v22 error:a9 block:v30 inaccessibilityHandler:v26];

  return (char)a9;
}

uint64_t __127__HDDataManager_insertDataObjects_withProvenance_creationDate_skipInsertionFilter_updateSourceOrder_resolveAssociations_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 48);
  int v7 = *(unsigned __int8 *)(a1 + 56);
  id v8 = *(id *)(a1 + 40);
  id v9 = a2;
  id v10 = v6;
  if (v5)
  {
    id v19 = 0;
    BOOL v11 = -[HDDataManager _insertDataObjects:insertionContext:lastInsertedIDOut:error:](v5, v8, v10, &v19, a3);
    id v12 = v19;
    if (v11)
    {
      id v13 = v9;
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = __Block_byref_object_copy__132;
      v27[4] = __Block_byref_object_dispose__132;
      id v28 = 0;
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x3032000000;
      v25[3] = __Block_byref_object_copy__132;
      v25[4] = __Block_byref_object_dispose__132;
      id v26 = 0;
      uint64_t v14 = *(NSObject **)(v5 + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke;
      block[3] = &unk_1E62F9270;
      block[4] = v5;
      void block[5] = v27;
      block[6] = v25;
      dispatch_sync(v14, block);
      id v15 = [v13 protectedDatabase];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_2;
      v22[3] = &unk_1E63007F8;
      v22[4] = v5;
      id v16 = v13;
      id v23 = v16;
      [v15 beforeCommit:v22];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_3;
      v21[3] = &unk_1E62F3208;
      v21[4] = v5;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_4;
      v20[3] = &unk_1E6304F98;
      v20[4] = v5;
      v20[5] = v27;
      v20[6] = v25;
      [v16 onCommit:v21 orRollback:v20];

      _Block_object_dispose(v25, 8);
      _Block_object_dispose(v27, 8);

      uint64_t v17 = -[HDDataManager _updateSourceAndLastAnchorForObjects:insertionContext:lastInsertedID:isDatabaseAccessible:shouldUpdateSourceOrder:error:](v5, v8, v10, v12, 1, v7 != 0, a3);
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t __127__HDDataManager_insertDataObjects_withProvenance_creationDate_skipInsertionFilter_updateSourceOrder_resolveAssociations_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 48);
  int v6 = *(unsigned __int8 *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  id v8 = v5;
  if (v4)
  {
    id v15 = 0;
    BOOL v9 = -[HDDataManager _insertDataObjects:insertionContext:lastInsertedIDOut:error:](v4, v7, v8, &v15, a3);
    id v10 = v15;
    if (v9)
    {
      BOOL v11 = *(NSObject **)(v4 + 8);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __78__HDDataManager__journalDataObjects_insertionContext_updateSourceOrder_error___block_invoke;
      v14[3] = &unk_1E62F3208;
      v14[4] = v4;
      dispatch_sync(v11, v14);
      uint64_t v12 = -[HDDataManager _updateSourceAndLastAnchorForObjects:insertionContext:lastInsertedID:isDatabaseAccessible:shouldUpdateSourceOrder:error:](v4, v7, v8, v10, 0, v6 != 0, a3);
      if (v12)
      {
        -[HDDataManager _notifySynchronousObserversIfPossibleInTransaction:](v4, 0);
        -[HDDataManager _callObserversIfPossible](v4);
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)_insertDataObjects:(void *)a3 insertionContext:(void *)a4 lastInsertedIDOut:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 8));
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__132;
  id v27 = __Block_byref_object_dispose__132;
  id v28 = 0;
  uint64_t v17 = 0;
  objc_super v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__132;
  id v21 = __Block_byref_object_dispose__132;
  id v22 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__HDDataManager__insertDataObjects_insertionContext_lastInsertedIDOut_error___block_invoke;
  v16[3] = &unk_1E6304F48;
  v16[4] = &v23;
  v16[5] = &v29;
  v16[6] = &v17;
  +[HDDataEntity insertDataObjects:v9 insertionContext:v10 profile:WeakRetained completionHandler:v16];

  int v12 = *((unsigned __int8 *)v30 + 24);
  if (*((unsigned char *)v30 + 24))
  {
    *a4 = (id) v24[5];
  }
  else
  {
    id v13 = (id)v18[5];
    uint64_t v14 = v13;
    if (v13)
    {
      if (a5) {
        *a5 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v12 != 0;
}

uint64_t __78__HDDataManager__journalDataObjects_insertionContext_updateSourceOrder_error___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = 1;
  return result;
}

- (uint64_t)_updateSourceAndLastAnchorForObjects:(void *)a3 insertionContext:(void *)a4 lastInsertedID:(char)a5 isDatabaseAccessible:(int)a6 shouldUpdateSourceOrder:(void *)a7 error:
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v43 = a2;
  id v10 = a3;
  id v44 = a4;
  id v40 = v10;
  BOOL v11 = [v10 provenance];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  id v13 = [WeakRetained sourceManager];
  uint64_t v14 = [v11 sourceID];
  id v15 = [v13 clientSourceForPersistentID:v14 error:a7];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F2B578]);
    uint64_t v17 = [v11 sourceVersion];
    objc_super v18 = [v11 productType];
    if (v11) {
      [v11 operatingSystemVersion];
    }
    else {
      memset(v58, 0, sizeof(v58));
    }
    uint64_t v42 = (void *)[v16 initWithSource:v15 version:v17 productType:v18 operatingSystemVersion:v58];
  }
  else
  {
    uint64_t v42 = 0;
  }
  uint64_t v19 = [v11 deviceID];
  if (v19)
  {
    id v20 = objc_loadWeakRetained((id *)(a1 + 120));
    id v21 = [v20 deviceManager];
    id v57 = 0;
    uint64_t v45 = [v21 deviceForPersistentID:v19 error:&v57];
    id v22 = v57;

    if (!v45)
    {
      if (v22)
      {
        _HKInitializeLogging();
        uint64_t v23 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v19;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v22;
          _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "Failed to look up device %{public}@: %{public}@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    uint64_t v45 = 0;
  }
  id v24 = [v11 contributorReference];
  id v25 = objc_loadWeakRetained((id *)(a1 + 120));
  id v26 = [v25 contributorManager];
  id v56 = 0;
  id v27 = [v26 contributorForReference:v24 error:&v56];
  id v28 = v56;

  if (v27 || (a5 & 1) != 0 || !v28 || (objc_msgSend(v28, "hk_isDatabaseAccessibilityError") & 1) != 0)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v62 = __Block_byref_object_copy__132;
    uint64_t v63 = __Block_byref_object_dispose__132;
    id v64 = 0;
    uint64_t v29 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __137__HDDataManager__updateSourceAndLastAnchorForObjects_insertionContext_lastInsertedID_isDatabaseAccessible_shouldUpdateSourceOrder_error___block_invoke;
    block[3] = &unk_1E6304F70;
    id v48 = v43;
    id v49 = v42;
    id v50 = v45;
    id v51 = v27;
    uint64_t v52 = a1;
    id v53 = v11;
    uint64_t v55 = buf;
    id v54 = v44;
    dispatch_sync(v29, block);
    if (v15 && a6)
    {
      id v30 = objc_loadWeakRetained((id *)(a1 + 120));
      uint64_t v31 = [v30 sourceOrderManager];
      uint64_t v32 = *(void *)(*(void *)&buf[8] + 40);
      id v46 = 0;
      char v33 = [v31 addOrderedSource:v15 objectTypes:v32 error:&v46];
      id v34 = v46;

      if ((v33 & 1) == 0)
      {
        _HKInitializeLogging();
        uint64_t v35 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v59 = 138543362;
          id v60 = v34;
          _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "Failed to update source order during insert: %{public}@", v59, 0xCu);
        }
      }
    }
    _Block_object_dispose(buf, 8);

    uint64_t v36 = 1;
  }
  else if (a7)
  {
    uint64_t v36 = 0;
    *a7 = v28;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v36 = 0;
  }

  return v36;
}

- (void)_notifySynchronousObserversIfPossibleInTransaction:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 8));
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__132;
    char v33 = __Block_byref_object_dispose__132;
    id v34 = 0;
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__132;
    id v27 = __Block_byref_object_dispose__132;
    id v28 = 0;
    uint64_t v3 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__HDDataManager__notifySynchronousObserversIfPossibleInTransaction___block_invoke;
    block[3] = &unk_1E6305148;
    void block[4] = a1;
    void block[5] = &v35;
    block[6] = &v29;
    void block[7] = &v23;
    dispatch_sync(v3, block);
    if (*((unsigned char *)v36 + 24))
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v4 = (id)v30[5];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v39 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v19 != v6) {
              objc_enumerationMutation(v4);
            }
            id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            id v9 = [(id)v30[5] objectForKeyedSubscript:v8];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v10 = v24[5];
              BOOL v11 = *(void **)(a1 + 112);
              if (v10) {
                [v11 samplesAdded:v9 type:v8 anchor:v10 transaction:v13];
              }
              else {
                [v11 samplesJournaled:v9 type:v8];
              }
            }
            os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
            if (-[HDDataManager _synchronousObserverLock_hasSynchronousObserverForSampleType:](a1, v8))
            {
              int v12 = -[HDDataManager _synchronousObserverLock_synchronousObserverSetForSampleType:](a1, v8);
              os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
              if (v12)
              {
                v14[0] = MEMORY[0x1E4F143A8];
                v14[1] = 3221225472;
                v14[2] = __68__HDDataManager__notifySynchronousObserversIfPossibleInTransaction___block_invoke_2;
                v14[3] = &unk_1E6305170;
                uint64_t v17 = &v23;
                id v15 = v9;
                id v16 = v8;
                [v12 notifyObservers:v14];
              }
            }
            else
            {
              os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
            }
          }
          uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v39 count:16];
        }
        while (v5);
      }
    }
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);
  }
}

void __77__HDDataManager__insertDataObjects_insertionContext_lastInsertedIDOut_error___block_invoke(void *a1, int a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = v10;
  if (a2)
  {
    int v12 = (id *)(*(void *)(a1[4] + 8) + 40);
    id v13 = a4;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    if (!v10)
    {
      BOOL v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 124, @"Failed to insert objects.");
    }
    _HKInitializeLogging();
    uint64_t v14 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
    {
      int v15 = 138543362;
      id v16 = v11;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_INFO, "Failed to insert data objects: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    int v12 = (id *)(*(void *)(a1[6] + 8) + 40);
    id v13 = v11;
  }
  objc_storeStrong(v12, v13);
}

void __137__HDDataManager__updateSourceAndLastAnchorForObjects_insertionContext_lastInsertedID_isDatabaseAccessible_shouldUpdateSourceOrder_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
        if (*(void *)(a1 + 40)) {
          [*(id *)(*((void *)&v14 + 1) + 8 * v6) _setSourceRevision:(void)v14];
        }
        if (*(void *)(a1 + 48))
        {
          id v8 = [v7 device];

          if (!v8) {
            [v7 _setDevice:*(void *)(a1 + 48)];
          }
        }
        if (*(void *)(a1 + 56)) {
          objc_msgSend(v7, "_setContributor:");
        }
        if (objc_msgSend(v7, "_shouldNotifyOnInsert", (void)v14))
        {
          id v9 = objc_msgSend(v7, "hd_sampleType");
          if (v9)
          {
            id v10 = [*(id *)(*(void *)(a1 + 64) + 64) objectForKeyedSubscript:v9];
            if (!v10)
            {
              id v10 = [MEMORY[0x1E4F1CA48] array];
              [*(id *)(*(void *)(a1 + 64) + 64) setObject:v10 forKeyedSubscript:v9];
            }
            objc_msgSend(v7, "setHealthd_use_only_dataOriginProvenance:", *(void *)(a1 + 72));
            [v10 addObject:v7];
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  uint64_t v11 = [*(id *)(*(void *)(a1 + 64) + 64) allKeys];
  uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  objc_storeStrong((id *)(*(void *)(a1 + 64) + 72), *(id *)(a1 + 80));
}

void __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 64) mutableCopy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(unsigned char *)(a1[4] + 48) = 1;
  uint64_t v5 = *(void **)(a1[4] + 72);
  uint64_t v6 = (id *)(*(void *)(a1[6] + 8) + 40);

  objc_storeStrong(v6, v5);
}

uint64_t __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_2(uint64_t a1)
{
  return 1;
}

void __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_3(uint64_t a1)
{
}

void __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_INFO, "Discarding pending samples due to transaction rollback: %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  long long v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[2] = __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_308;
  block[3] = &unk_1E62FA0E8;
  long long v8 = v5;
  uint64_t v9 = *(void *)(a1 + 48);
  dispatch_sync(v6, block);
}

void __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_308(void *a1)
{
  objc_storeStrong((id *)(a1[4] + 64), *(id *)(*(void *)(a1[5] + 8) + 40));
  uint64_t v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  id v3 = (id *)(a1[4] + 72);

  objc_storeStrong(v3, v2);
}

- (void)shouldNotifyForDataObjects:(id)a3 provenance:(id)a4 database:(id)a5 anchor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    long long v15 = [WeakRetained sourceManager];
    long long v16 = [v11 sourceID];
    id v30 = 0;
    long long v17 = [v15 clientSourceForPersistentID:v16 error:&v30];
    id v18 = v30;
  }
  else
  {
    long long v17 = 0;
    id v18 = 0;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__HDDataManager_shouldNotifyForDataObjects_provenance_database_anchor___block_invoke;
  v24[3] = &unk_1E6304FC0;
  v24[4] = self;
  id v25 = v13;
  id v26 = v17;
  id v27 = v18;
  id v28 = v11;
  id v29 = v10;
  id v19 = v10;
  id v20 = v11;
  id v21 = v18;
  id v22 = v17;
  id v23 = v13;
  [v12 onCommit:v24 orRollback:0];
}

void __71__HDDataManager_shouldNotifyForDataObjects_provenance_database_anchor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__HDDataManager_shouldNotifyForDataObjects_provenance_database_anchor___block_invoke_2;
  v4[3] = &unk_1E6304FC0;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  dispatch_sync(v3, v4);
  -[HDDataManager _callObserversIfPossible](*(void *)(a1 + 32));
}

void __71__HDDataManager_shouldNotifyForDataObjects_provenance_database_anchor___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
  if (!*(void *)(a1 + 48))
  {
    if (*(void *)(a1 + 56))
    {
      _HKInitializeLogging();
      uint64_t v2 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        id v19 = *(void **)(a1 + 64);
        id v20 = v2;
        id v21 = [v19 sourceID];
        uint64_t v22 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        uint64_t v31 = v21;
        __int16 v32 = 2114;
        uint64_t v33 = v22;
        _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Failed to lookup source %@ during insert notification: %{public}@", buf, 0x16u);
      }
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = *(id *)(a1 + 72);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "hd_sampleType", v23);
        if (v9)
        {
          id v10 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v9];
          if (!v10)
          {
            id v10 = [MEMORY[0x1E4F1CA48] array];
            [*(id *)(*(void *)(a1 + 32) + 64) setObject:v10 forKeyedSubscript:v9];
          }
          [v10 addObject:v8];
        }
        id v11 = [v8 sourceRevision];
        id v12 = [v11 source];

        if (!v12)
        {
          id v13 = *(void **)(a1 + 48);
          if (v13)
          {
            id v12 = v13;
            id v14 = objc_alloc(MEMORY[0x1E4F2B578]);
            long long v15 = [*(id *)(a1 + 64) sourceVersion];
            long long v16 = [*(id *)(a1 + 64) productType];
            long long v17 = *(void **)(a1 + 64);
            if (v17) {
              [v17 operatingSystemVersion];
            }
            else {
              memset(v24, 0, sizeof(v24));
            }
            id v18 = (void *)[v14 initWithSource:v12 version:v15 productType:v16 operatingSystemVersion:v24];
            [v8 _setSourceRevision:v18];

            uint64_t v6 = v23;
          }
          else
          {
            id v12 = 0;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }
}

- (void)shouldNotifyForDeletedSamplesOfTypes:(id)a3 intervals:(id)a4 userRequested:(BOOL)a5 transaction:(id)a6 anchor:(id)a7
{
  BOOL v9 = a5;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDCloudSyncStore samplesDeletedInProfile:WeakRetained byUser:v9 intervals:v15];

  id v17 = v12;
  id v18 = v13;
  id v42 = v14;
  if (self)
  {
    os_unfair_lock_t lock = &self->_synchronousObserverLock;
    os_unfair_lock_lock(&self->_synchronousObserverLock);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v41 = v17;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v59 count:16];
    id v43 = self;
    if (v20)
    {
      uint64_t v21 = v20;
      id v22 = 0;
      uint64_t v23 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v54 != v23) {
            objc_enumerationMutation(v19);
          }
          long long v25 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v26 = v25;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              quantitySeriesManager = v43->_quantitySeriesManager;
              id v58 = v26;
              long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
              id v29 = quantitySeriesManager;
              self = v43;
              [(HDQuantitySeriesManager *)v29 samplesOfTypesWereRemoved:v28 anchor:v18 transaction:v42];
            }
            if (-[HDDataManager _synchronousObserverLock_hasSynchronousObserverForSampleType:]((uint64_t)self, v26))
            {
              if (!v22) {
                id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              }
              id v30 = -[HDDataManager _synchronousObserverLock_synchronousObserverSetForSampleType:]((uint64_t)self, v26);
              [v22 setObject:v30 forKeyedSubscript:v26];
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v21);
    }
    else
    {
      id v22 = 0;
    }

    os_unfair_lock_unlock(lock);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v31 = v22;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v50 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v49 + 1) + 8 * j);
          uint64_t v37 = [v31 objectForKeyedSubscript:v36];
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __85__HDDataManager__notifySynchronousObserversForDeletedObjectTypes_anchor_transaction___block_invoke;
          v47[3] = &unk_1E6305198;
          v47[4] = v36;
          id v48 = v18;
          [v37 notifyObservers:v47];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v33);
    }

    self = v43;
    id v17 = v41;
  }

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __97__HDDataManager_shouldNotifyForDeletedSamplesOfTypes_intervals_userRequested_transaction_anchor___block_invoke;
  v44[3] = &unk_1E62F30F8;
  v44[4] = self;
  id v45 = v17;
  id v46 = v18;
  id v38 = v18;
  id v39 = v17;
  [v42 onCommit:v44 orRollback:0];
}

void __97__HDDataManager_shouldNotifyForDeletedSamplesOfTypes_intervals_userRequested_transaction_anchor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__HDDataManager_shouldNotifyForDeletedSamplesOfTypes_intervals_userRequested_transaction_anchor___block_invoke_2;
  block[3] = &unk_1E62F30F8;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

void __97__HDDataManager_shouldNotifyForDeletedSamplesOfTypes_intervals_userRequested_transaction_anchor___block_invoke_2(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    id v5 = -[HDDataManager _observersForAllTypes]((uint64_t)v1);
    id v6 = [MEMORY[0x1E4F1CA80] set];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v35;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 addObject:*(void *)(*((void *)&v34 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v9);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v25 = v3;
    id v12 = v3;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = -[HDDataManager _observersForDataType:](v1, *(void **)(*((void *)&v30 + 1) + 8 * v16));
          id v18 = [v17 allObjects];
          [v6 addObjectsFromArray:v18];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v14);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v19 = v6;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v26 + 1) + 8 * v23);
          if (objc_opt_respondsToSelector()) {
            [v24 samplesOfTypesWereRemoved:v12 anchor:v4];
          }
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v21);
    }

    id v3 = v25;
  }
}

- (void)_shouldNotifyForDeletedSamplesOfTypes:(void *)a3 intervals:(char)a4 userRequested:(void *)a5 anchor:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    uint64_t v13 = [WeakRetained database];
    id v22 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __86__HDDataManager__shouldNotifyForDeletedSamplesOfTypes_intervals_userRequested_anchor___block_invoke;
    v17[3] = &unk_1E6301698;
    v17[4] = a1;
    id v18 = v9;
    id v19 = v10;
    char v21 = a4;
    id v20 = v11;
    BOOL v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v13 error:&v22 block:v17];
    id v15 = v22;

    if (!v14)
    {
      _HKInitializeLogging();
      uint64_t v16 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v15;
        _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Failed to get write transaction for setting up sample deletion commit hook: %{public}@.", buf, 0xCu);
      }
    }
  }
}

uint64_t __86__HDDataManager__shouldNotifyForDeletedSamplesOfTypes_intervals_userRequested_anchor___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __73__HDDataManager__notifyObserversWithAddedObjectsBySampleType_lastAnchor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (BOOL)deleteObjectsWithUUIDCollection:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 entityClass];
  if (!v10) {
    uint64_t v10 = objc_opt_class();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v12 = [WeakRetained database];
  uint64_t v13 = +[HDDatabaseTransactionContext contextForWritingProtectedData];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke;
  v22[3] = &unk_1E6305038;
  id v23 = v9;
  id v24 = self;
  uint64_t v26 = v10;
  id v25 = v8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_5;
  v18[3] = &unk_1E6301508;
  id v19 = v23;
  id v20 = v25;
  char v21 = self;
  id v14 = v25;
  id v15 = v23;
  char v16 = [v12 performTransactionWithContext:v13 error:a5 block:v22 inaccessibilityHandler:v18];

  return v16;
}

uint64_t __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v53 = a2;
  if ([*(id *)(a1 + 32) secureDelete])
  {
    id v5 = [v53 protectedDatabase];
    [v5 setCheckpointRequired:1];
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 56) preferredEntityType];
  id v9 = v7;
  uint64_t v10 = v9;
  if (!v6)
  {

    goto LABEL_19;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v12 = +[HDDataEntity disambiguatedSQLForProperty:](HDSampleEntity, "disambiguatedSQLForProperty:");
  uint64_t v13 = +[HDDataEntity disambiguatedSQLForProperty:@"type"];
  id v14 = objc_msgSend(v11, "initWithFormat:", @"((%@ = ?) AND (%@ = %ld)"), v12, v13, v8;

  id v15 = objc_alloc(MEMORY[0x1E4F28E78]);
  char v16 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v17 = (void *)[v15 initWithFormat:@"INNER JOIN %@ USING(%@)", v16, @"data_id"];

  id v18 = [v10 restrictedSourceBundleIdentifier];

  uint64_t v52 = a3;
  if (v18)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 120));
    id v20 = [WeakRetained sourceManager];

    char v21 = [v10 restrictedSourceBundleIdentifier];
    id v22 = [v20 allSourcesForBundleIdentifier:v21 error:a3];

    if (!v22)
    {
      long long v30 = 0;
      goto LABEL_13;
    }
    long long v51 = v10;
    id v23 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    id v24 = +[HDDataEntity disambiguatedSQLForProperty:@"provenance"];
    uint64_t v25 = *MEMORY[0x1E4F65C70];
    uint64_t v26 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:*MEMORY[0x1E4F65C70]];
    [v17 appendFormat:@" INNER JOIN %@ ON %@=%@", v23, v24, v26];

    if ([v22 count])
    {
      long long v27 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"source_id"];
      objc_msgSend(v14, "appendFormat:", CFSTR(" AND (%@ IN ("), v27);

      objc_msgSend(v14, "hk_appendComponentsJoinedByString:container:componentGenerator:", @", ", v22, &__block_literal_global_160);
      long long v28 = @")");
    }
    else
    {
      long long v28 = @" AND (1=0)";
    }
    long long v29 = off_1E62F0000;
    [v14 appendString:v28];
  }
  else
  {
    long long v51 = v10;
    uint64_t v25 = *MEMORY[0x1E4F65C70];
    long long v29 = off_1E62F0000;
  }
  [v14 appendString:@""]);
  long long v31 = NSString;
  id v20 = [(__objc2_class *)v29[267] disambiguatedSQLForProperty:v25];
  long long v32 = [(__objc2_class *)v29[267] disambiguatedSQLForProperty:@"data_type"];
  long long v33 = +[HDDataEntity disambiguatedSQLForProperty:@"uuid"];
  long long v34 = +[HDDataEntity disambiguatedSQLForProperty:@"provenance"];
  long long v35 = [(__objc2_class *)v29[267] disambiguatedDatabaseTable];
  long long v30 = [v31 stringWithFormat:@"SELECT %@, %@, %@, %@ FROM %@ %@ WHERE %@", v20, v32, v33, v34, v35, v17, v14];

  uint64_t v10 = v51;
LABEL_13:

  if (!v30)
  {
LABEL_19:
    id v42 = 0;
    uint64_t v46 = 0;
    goto LABEL_20;
  }
  long long v36 = [v53 databaseForEntityClass:*(void *)(a1 + 56)];
  long long v37 = [MEMORY[0x1E4F1C9C8] date];
  id v38 = objc_alloc_init(MEMORY[0x1E4F2AEE8]);
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v63 = 0;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = -1;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_2;
  v54[3] = &unk_1E6305010;
  uint64_t v40 = *(void **)(a1 + 48);
  v54[4] = *(void *)(a1 + 40);
  id v55 = v53;
  id v56 = *(id *)(a1 + 32);
  id v41 = v36;
  id v57 = v41;
  id v42 = v30;
  id v58 = v42;
  id v43 = v37;
  id v59 = v43;
  id v44 = v38;
  id v60 = v44;
  v62 = &v63;
  id v45 = v39;
  id v61 = v45;
  uint64_t v46 = objc_msgSend(v40, "hk_enumerateUUIDsWithError:block:", v52, v54);
  if ((v46 & 1) != 0 && [*(id *)(a1 + 32) notifyObservers])
  {
    uint64_t v47 = *(void *)(a1 + 40);
    id v48 = [v45 allObjects];
    long long v49 = [NSNumber numberWithLongLong:v64[3]];
    -[HDDataManager _shouldNotifyForDeletedSamplesOfTypes:intervals:userRequested:anchor:](v47, v48, v44, 0, v49);
  }
  _Block_object_dispose(&v63, 8);

LABEL_20:
  return v46;
}

uint64_t __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = [HDDataEntityDeletionContext alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  id v9 = [(HDDataEntityDeletionContext *)v7 initWithProfile:WeakRetained transaction:*(void *)(a1 + 40)];

  -[HDDataEntityDeletionContext setInsertDeletedObjects:](v9, "setInsertDeletedObjects:", [*(id *)(a1 + 48) generateDeletedObjects]);
  -[HDDataEntityDeletionContext setPreserveExactStartAndEndDates:](v9, "setPreserveExactStartAndEndDates:", [*(id *)(a1 + 48) preserveExactStartAndEndDates]);
  uint64_t v10 = [*(id *)(a1 + 48) recursiveDeleteAuthorizationBlock];
  [(HDDataEntityDeletionContext *)v9 setRecursiveDeleteAuthorizationBlock:v10];

  id v11 = *(void **)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_3;
  v30[3] = &unk_1E62F43C8;
  id v13 = v6;
  id v31 = v13;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_4;
  uint64_t v26 = &unk_1E62FA460;
  id v14 = v9;
  long long v27 = v14;
  id v28 = *(id *)(a1 + 72);
  id v29 = *(id *)(a1 + 80);
  LODWORD(v11) = [v11 executeSQL:v12 error:a4 bindingHandler:v30 enumerationHandler:&v23];
  [(HDDataEntityDeletionContext *)v14 finish];
  if (!v11) {
    goto LABEL_5;
  }
  if (![(HDDataEntityDeletionContext *)v14 deletedObjectCount]
    && [*(id *)(a1 + 48) failIfNotFound])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 3, @"Failed to find some objects for deletion.");
LABEL_5:
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  if ([*(id *)(a1 + 48) notifyObservers])
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
    id v17 = [(HDDataEntityDeletionContext *)v14 lastInsertedDeletedObjectPersistentID];
    uint64_t v18 = [v17 longLongValue];

    if (v16 <= v18) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = v16;
    }
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v19;
    id v20 = *(void **)(a1 + 88);
    char v21 = [(HDDataEntityDeletionContext *)v14 deletedObjectTypeSet];
    [v20 unionSet:v21];
  }
  uint64_t v15 = 1;
LABEL_12:

  return v15;
}

uint64_t __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_3()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = HDSQLiteColumnAsInt64();
  uint64_t v7 = 1;
  uint64_t v8 = [MEMORY[0x1E4F2B448] dataTypeWithCode:HDSQLiteColumnAsInt64()];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "dataObjectClass"), "hd_dataEntityClass");
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = MEMORY[0x1C1879F90](a2, 2);
    uint64_t v12 = MEMORY[0x1C1879F70](a2, 3);
    uint64_t v7 = [*(id *)(a1 + 32) deleteObjectWithPersistentID:v6 objectUUID:v11 entityClass:v10 objectType:v8 provenanceIdentifier:v12 deletionDate:*(void *)(a1 + 40) deletedSampleIntervals:*(void *)(a1 + 48) error:a3];
  }
  return v7;
}

uint64_t __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_5(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[_HDDataManagerDeletionJournalEntry alloc] initWithConfiguration:a1[4] objectUUIDs:a1[5]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 120));
  uint64_t v7 = [WeakRetained database];
  uint64_t v8 = [v7 addJournalEntry:v5 error:a3];

  return v8;
}

uint64_t __84__HDDataManager__deleteDataObjectsByUUIDSQLStringForConfiguration_entityType_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(a2, "persistentID"));
}

- (BOOL)deleteDataObjects:(id)a3 restrictedSourceEntities:(id)a4 failIfNotFound:(BOOL)a5 recursiveDeleteAuthorizationBlock:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__132;
  long long v30 = __Block_byref_object_dispose__132;
  id v31 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __115__HDDataManager_deleteDataObjects_restrictedSourceEntities_failIfNotFound_recursiveDeleteAuthorizationBlock_error___block_invoke;
  v21[3] = &unk_1E6305080;
  uint64_t v24 = &v32;
  uint64_t v25 = &v26;
  id v16 = v12;
  id v22 = v16;
  uint64_t v23 = self;
  +[HDDataEntity deleteDataObjects:v16 restrictedSourceEntities:v13 failIfNotFound:v9 profile:WeakRetained recursiveDeleteAuthorizationBlock:v14 completionHandler:v21];

  id v17 = (id)v27[5];
  uint64_t v18 = v17;
  if (v17)
  {
    if (a7) {
      *a7 = v17;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v19 = *((unsigned char *)v33 + 24);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v19;
}

void __115__HDDataManager_deleteDataObjects_restrictedSourceEntities_failIfNotFound_recursiveDeleteAuthorizationBlock_error___block_invoke(void *a1, int a2, int a3, void *a4, void *a5, void *a6)
{
  id v17 = a4;
  id v11 = a5;
  id v12 = a6;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a6);
  id v13 = objc_msgSend(MEMORY[0x1E4F2B420], "hd_sampleTypesForObjects:", a1[4]);
  id v14 = v13;
  if (a2 && a3 && [v13 count])
  {
    uint64_t v15 = a1[5];
    id v16 = [v14 allObjects];
    -[HDDataManager _shouldNotifyForDeletedSamplesOfTypes:intervals:userRequested:anchor:](v15, v16, v11, 0, v17);
  }
}

- (BOOL)deleteDataObjectsOfClass:(Class)a3 predicate:(id)a4 limit:(unint64_t)a5 deletedSampleCount:(unint64_t *)a6 notifyObservers:(BOOL)a7 generateDeletedObjects:(BOOL)a8 userRequested:(BOOL)a9 recursiveDeleteAuthorizationBlock:(id)a10 error:(id *)a11
{
  id v15 = a4;
  id v16 = a10;
  if (!v15)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HDDataManager.m", 796, @"Invalid parameter not satisfying: %@", @"predicate != nil" object file lineNumber description];
  }
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__132;
  v47[4] = __Block_byref_object_dispose__132;
  id v48 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__132;
  v45[4] = __Block_byref_object_dispose__132;
  id v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__132;
  v43[4] = __Block_byref_object_dispose__132;
  id v44 = 0;
  id v17 = (void *)MEMORY[0x1E4F65D08];
  uint64_t v18 = HDDataEntityPredicateForType([(objc_class *)a3 preferredEntityType]);
  char v19 = [v17 compoundPredicateWithPredicate:v15 otherPredicate:v18];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  char v21 = [WeakRetained database];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __170__HDDataManager_deleteDataObjectsOfClass_predicate_limit_deletedSampleCount_notifyObservers_generateDeletedObjects_userRequested_recursiveDeleteAuthorizationBlock_error___block_invoke;
  v30[3] = &unk_1E63050D0;
  Class v37 = a3;
  id v22 = v19;
  unint64_t v38 = a5;
  BOOL v40 = a8;
  id v31 = v22;
  uint64_t v32 = self;
  id v23 = v16;
  id v33 = v23;
  uint64_t v34 = v47;
  id v39 = a6;
  char v35 = v45;
  long long v36 = v43;
  BOOL v41 = a7;
  BOOL v42 = a9;
  char v24 = [(objc_class *)a3 performWriteTransactionWithHealthDatabase:v21 error:a11 block:v30];

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(v47, 8);
  return v24;
}

BOOL __170__HDDataManager_deleteDataObjectsOfClass_predicate_limit_deletedSampleCount_notifyObservers_generateDeletedObjects_userRequested_recursiveDeleteAuthorizationBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__132;
  long long v27 = __Block_byref_object_dispose__132;
  id v28 = 0;
  uint64_t v6 = (void *)[*(id *)(a1 + 80) _entityClassForDeletion];
  uint64_t v7 = *(void *)(a1 + 88);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 104);
  uint64_t v9 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 120));
  uint64_t v11 = *(void *)(a1 + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __170__HDDataManager_deleteDataObjectsOfClass_predicate_limit_deletedSampleCount_notifyObservers_generateDeletedObjects_userRequested_recursiveDeleteAuthorizationBlock_error___block_invoke_2;
  v18[3] = &unk_1E63050A8;
  void v18[4] = &v29;
  uint64_t v12 = *(void *)(a1 + 96);
  char v21 = &v23;
  uint64_t v22 = v12;
  long long v19 = *(_OWORD *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 72);
  [v6 deleteSamplesWithPredicate:v9 limit:v7 generateDeletedObjects:v8 transaction:v5 profile:WeakRetained recursiveDeleteAuthorizationBlock:v11 completionHandler:v18];

  if (!*((unsigned char *)v30 + 24))
  {
    id v15 = (id)v24[5];
    id v14 = v15;
    if (v15)
    {
      if (a3)
      {
        id v14 = v15;
        *a3 = v14;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 105))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) allObjects];
    -[HDDataManager _shouldNotifyForDeletedSamplesOfTypes:intervals:userRequested:anchor:](v13, v14, *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(unsigned char *)(a1 + 106), *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
LABEL_9:

    BOOL v16 = *((unsigned char *)v30 + 24) != 0;
    goto LABEL_10;
  }
  BOOL v16 = 1;
LABEL_10:
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v16;
}

void __170__HDDataManager_deleteDataObjectsOfClass_predicate_limit_deletedSampleCount_notifyObservers_generateDeletedObjects_userRequested_recursiveDeleteAuthorizationBlock_error___block_invoke_2(void *a1, char a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  id v26 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  id v17 = (void *)a1[9];
  if (v17) {
    *id v17 = a4;
  }
  uint64_t v18 = *(void *)(a1[6] + 8);
  long long v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v14;
  id v20 = v14;

  uint64_t v21 = *(void *)(a1[7] + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v15;
  id v23 = v15;

  uint64_t v24 = *(void *)(a1[8] + 8);
  uint64_t v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v16;
}

- (BOOL)deleteSamplesWithTypes:(id)a3 sourceBundleIdentifier:(id)a4 userRequested:(BOOL)a5 recursiveDeleteAuthorizationBlock:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a4;
  if (![v13 count])
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HDDataManager.m", 852, @"Invalid parameter not satisfying: %@", @"[sampleTypes count] > 0" object file lineNumber description];
  }
  id v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v18 = [WeakRetained sourceManager];
  long long v19 = [v18 allSourcesForBundleIdentifier:v15 error:a7];

  if (v19) {
    BOOL v20 = -[HDDataManager _deleteObjectsWithTypes:sourceEntities:recursiveDeleteAuthorizationBlock:userRequested:error:]((uint64_t)self, v16, v19, v14, a5, a7);
  }
  else {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)_deleteObjectsWithTypes:(void *)a3 sourceEntities:(void *)a4 recursiveDeleteAuthorizationBlock:(char)a5 userRequested:(void *)a6 error:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  if (a1)
  {
    uint64_t v34 = 0;
    char v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__132;
    char v32 = __Block_byref_object_dispose__132;
    id v33 = 0;
    _HKInitializeLogging();
    id v14 = (id)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v11 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v39 = v15;
      __int16 v40 = 2112;
      id v41 = v12;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "Deleting %lu object types for sources: %@", buf, 0x16u);
    }

    id v16 = +[HKDaemonTransaction transactionWithOwner:a1 activityName:@"DeleteObjectsForSources"];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __110__HDDataManager__deleteObjectsWithTypes_sourceEntities_recursiveDeleteAuthorizationBlock_userRequested_error___block_invoke;
    v23[3] = &unk_1E6305120;
    uint64_t v25 = &v34;
    id v26 = &v28;
    v23[4] = a1;
    char v27 = a5;
    id v18 = v16;
    id v24 = v18;
    +[HDSampleEntity deleteSamplesWithTypes:v11 sourceEntities:v12 profile:WeakRetained recursiveDeleteAuthorizationBlock:v13 completionHandler:v23];

    id v19 = (id)v29[5];
    BOOL v20 = v19;
    if (v19)
    {
      if (a6) {
        *a6 = v19;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v21 = *((unsigned char *)v35 + 24) != 0;
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)deleteSamplesWithTypes:(id)a3 sourceEntities:(id)a4 recursiveDeleteAuthorizationBlock:(id)a5 error:(id *)a6
{
  return -[HDDataManager _deleteObjectsWithTypes:sourceEntities:recursiveDeleteAuthorizationBlock:userRequested:error:]((uint64_t)self, a3, a4, a5, 0, a6);
}

- (BOOL)deleteSamplesWithSourceEntities:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    BOOL v7 = -[HDDataManager _deleteObjectsWithTypes:sourceEntities:recursiveDeleteAuthorizationBlock:userRequested:error:]((uint64_t)self, 0, v6, 0, 0, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Must provide at least one source entity for deletion.");
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)deleteSamplesWithUUIDs:(id)a3 userRequested:(BOOL)a4 recursiveDeleteAuthorizationBlock:(id)a5 error:(id *)a6
{
  id v11 = a5;
  id v12 = a3;
  if (![v12 count])
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDDataManager.m", 901, @"Invalid parameter not satisfying: %@", @"[uuids count] > 0" object file lineNumber description];
  }
  uint64_t v13 = objc_opt_class();
  id v14 = HDDataEntityPredicateForDataUUIDs(v12);

  LOBYTE(v18) = a4;
  BOOL v15 = [(HDDataManager *)self deleteDataObjectsOfClass:v13 predicate:v14 limit:0 deletedSampleCount:0 notifyObservers:1 generateDeletedObjects:1 userRequested:v18 recursiveDeleteAuthorizationBlock:v11 error:a6];

  return v15;
}

- (BOOL)deleteSamplesWithUUIDs:(id)a3 generateDeletedObjects:(BOOL)a4 transaction:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  if (![v11 count])
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HDDataManager.m", 919, @"Invalid parameter not satisfying: %@", @"[uuids count] > 0" object file lineNumber description];
  }
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__132;
  uint64_t v25 = __Block_byref_object_dispose__132;
  id v26 = 0;
  uint64_t v13 = HDDataEntityPredicateForDataUUIDs(v11);
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  }
  else {
    id WeakRetained = 0;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __81__HDDataManager_deleteSamplesWithUUIDs_generateDeletedObjects_transaction_error___block_invoke;
  v20[3] = &unk_1E63050F8;
  v20[5] = &v27;
  v20[6] = &v21;
  v20[4] = self;
  +[HDSampleEntity deleteSamplesWithPredicate:v13 limit:0 generateDeletedObjects:v8 transaction:v12 profile:WeakRetained recursiveDeleteAuthorizationBlock:0 completionHandler:v20];

  id v15 = (id)v22[5];
  id v16 = v15;
  if (v15)
  {
    if (a6) {
      *a6 = v15;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v17 = *((unsigned char *)v28 + 24);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

void __81__HDDataManager_deleteSamplesWithUUIDs_generateDeletedObjects_transaction_error___block_invoke(void *a1, int a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  id v18 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a7);
  if (a2)
  {
    uint64_t v15 = [v12 count];
    if (v18)
    {
      if (v15)
      {
        uint64_t v16 = a1[4];
        char v17 = [v12 allObjects];
        -[HDDataManager _shouldNotifyForDeletedSamplesOfTypes:intervals:userRequested:anchor:](v16, v17, v13, 0, v18);
      }
    }
  }
}

void __110__HDDataManager__deleteObjectsWithTypes_sourceEntities_recursiveDeleteAuthorizationBlock_userRequested_error___block_invoke(uint64_t a1, char a2, int a3, void *a4, void *a5, void *a6, void *a7)
{
  id v19 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a7);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    BOOL v16 = a3 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16 && [v13 count])
  {
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = [v13 allObjects];
    -[HDDataManager _shouldNotifyForDeletedSamplesOfTypes:intervals:userRequested:anchor:](v17, v18, v14, *(unsigned char *)(a1 + 64), v19);
  }
  [*(id *)(a1 + 40) invalidate];
}

- (BOOL)containsDataObject:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained database];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__HDDataManager_containsDataObject___block_invoke;
  v9[3] = &unk_1E62F3DB0;
  id v7 = v4;
  id v10 = v7;
  id v11 = &v12;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:v6 error:0 block:v9];

  LOBYTE(WeakRetained) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)WeakRetained;
}

uint64_t __36__HDDataManager_containsDataObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 protectedDatabase];
  id v6 = [*(id *)(a1 + 32) UUID];
  id v7 = HDDataEntityPredicateForDataUUID();
  BOOL v8 = +[HDDataEntity anyInDatabase:v5 predicate:v7 error:a3];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8 != 0;
  return 1;
}

- (int64_t)hasSampleWithBundleIdentifier:(id)a3 error:(id *)a4
{
  p_profile = &self->_profile;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  BOOL v8 = [WeakRetained sourceManager];
  uint64_t v9 = [v8 allSourcesForBundleIdentifier:v6 error:a4];

  if (v9)
  {
    id v10 = objc_msgSend(v9, "hk_map:", &__block_literal_global_392);
    id v11 = objc_loadWeakRetained((id *)p_profile);
    uint64_t v12 = +[HDDataProvenanceEntity sourceIDsWithProvenanceFromSourceIDs:v10 profile:v11 error:a4];

    if (v12)
    {
      if ([v12 count]) {
        int64_t v13 = 1;
      }
      else {
        int64_t v13 = 2;
      }
    }
    else
    {
      int64_t v13 = 0;
    }
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

uint64_t __53__HDDataManager_hasSampleWithBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 persistentID];

  return [v2 numberWithLongLong:v3];
}

- (void)addObserverForAllTypes:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__HDDataManager_addObserverForAllTypes___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __40__HDDataManager_addObserverForAllTypes___block_invoke(uint64_t a1)
{
  -[HDDataManager _queue_observersAllTypesCreateIfNil:](*(void *)(a1 + 32), 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:*(void *)(a1 + 40)];
}

- (id)_queue_observersAllTypesCreateIfNil:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [NSNumber numberWithInteger:-1];
    id v5 = -[HDDataManager _queue_observersForKey:createIfNil:](a1, v4, a2);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)removeObserverForAllTypes:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HDDataManager_removeObserverForAllTypes___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __43__HDDataManager_removeObserverForAllTypes___block_invoke(uint64_t a1)
{
  -[HDDataManager _queue_observersAllTypesCreateIfNil:](*(void *)(a1 + 32), 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (id)_synchronousObserverLock_synchronousObserverSetForSampleType:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    if (!v3)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel__synchronousObserverLock_synchronousObserverSetForSampleType_, a1, @"HDDataManager.m", 1085, @"Invalid parameter not satisfying: %@", @"sampleType" object file lineNumber description];
    }
    id v4 = *(void **)(a1 + 40);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    id v7 = [v4 objectForKeyedSubscript:v3];
    if (!v7)
    {
      _HKInitializeLogging();
      id v8 = objc_alloc(MEMORY[0x1E4F2B5F0]);
      uint64_t v9 = [NSString stringWithFormat:@"data-observers-synchronous-%@", v3];
      id v7 = (void *)[v8 initWithName:v9 loggingCategory:*MEMORY[0x1E4F29F18]];

      [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v3];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_synchronousObserverLock_hasSynchronousObserverForSampleType:(uint64_t)a1
{
  id v3 = a2;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
  if (!v3)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:sel__synchronousObserverLock_hasSynchronousObserverForSampleType_, a1, @"HDDataManager.m", 1104, @"Invalid parameter not satisfying: %@", @"sampleType" object file lineNumber description];
  }
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 count];

  return v5 != 0;
}

- (void)addSynchronousObserver:(id)a3 forSampleType:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDDataManager.m", 1111, @"Invalid parameter not satisfying: %@", @"sampleType" object file lineNumber description];
  }
  if (!v12)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDDataManager.m", 1112, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  p_synchronousObserverLock = &self->_synchronousObserverLock;
  os_unfair_lock_lock(&self->_synchronousObserverLock);
  uint64_t v9 = -[HDDataManager _synchronousObserverLock_synchronousObserverSetForSampleType:]((uint64_t)self, v7);
  [v9 registerObserver:v12];
  os_unfair_lock_unlock(p_synchronousObserverLock);
}

- (void)removeSynchronousObserver:(id)a3 forSampleType:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDDataManager.m", 1122, @"Invalid parameter not satisfying: %@", @"sampleType" object file lineNumber description];
  }
  if (!v12)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDDataManager.m", 1123, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  p_synchronousObserverLock = &self->_synchronousObserverLock;
  os_unfair_lock_lock(&self->_synchronousObserverLock);
  uint64_t v9 = -[HDDataManager _synchronousObserverLock_synchronousObserverSetForSampleType:]((uint64_t)self, v7);
  [v9 unregisterObserver:v12];
  os_unfair_lock_unlock(p_synchronousObserverLock);
}

void __68__HDDataManager__notifySynchronousObserversIfPossibleInTransaction___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a1[4] + 48);
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = *(id *)(a1[4] + 64);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", v8, (void)v14);
          id v10 = (void *)[v9 copy];
          [v2 setObject:v10 forKeyedSubscript:v8];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }

    uint64_t v11 = *(void *)(a1[6] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v2;
    id v13 = v2;

    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 72));
    *(unsigned char *)(a1[4] + 48) = 0;
  }
}

void __68__HDDataManager__notifySynchronousObserversIfPossibleInTransaction___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = v3;
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    objc_msgSend(v3, "samplesAdded:anchor:", a1[4]);
  }
  else
  {
    char v4 = objc_opt_respondsToSelector();
    uint64_t v5 = v6;
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
    [v6 samplesJournaled:a1[4] type:a1[5]];
  }
  uint64_t v5 = v6;
LABEL_6:
}

void __85__HDDataManager__notifySynchronousObserversForDeletedObjectTypes_anchor_transaction___block_invoke(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    v5[0] = *(void *)(a1 + 32);
    char v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    [v3 samplesOfTypesWereRemoved:v4 anchor:*(void *)(a1 + 40)];
  }
}

- (void)synchronouslyCloseObserverTransactionAndNotify
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_notificationQueue);
  [(HDDataManager *)self closeObserverTransaction];
  notificationQueue = self->_notificationQueue;

  dispatch_sync(notificationQueue, &__block_literal_global_415);
}

- (void)setBackgroundObserverFrequency:(id)a3 forDataType:(id)a4 frequency:(int64_t)a5 appSDKVersionToken:(unint64_t)a6 completion:(id)a7
{
  v48[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  long long v14 = (void (**)(void))a7;
  long long v15 = [v12 process];
  long long v16 = [v15 applicationIdentifier];

  if (v13)
  {
    p_profile = &self->_profile;
    id WeakRetained = objc_loadWeakRetained((id *)p_profile);
    uint64_t v19 = [WeakRetained daemon];
    BOOL v20 = [v19 behavior];
    uint64_t v21 = objc_msgSend(v13, "clampedBackgroundObservationFrequency:isAppleWatch:", a5, objc_msgSend(v20, "isAppleWatch"));

    location = (id *)p_profile;
    switch(v21)
    {
      case 0:
        goto LABEL_9;
      case 1:
        goto LABEL_14;
      case 2:
        uint64_t v21 = 3600;
        goto LABEL_14;
      case 3:
        uint64_t v21 = 86400;
        goto LABEL_14;
      case 4:
        uint64_t v21 = 604800;
LABEL_14:
        uint64_t v31 = objc_msgSend(v13, "code", a6);
        char v32 = kHDEventNameBGDelivery;
        v48[0] = @"subscribe";
        v47[0] = @"action";
        v47[1] = @"frequency";
        id v33 = [NSNumber numberWithUnsignedLongLong:v21];
        v48[1] = v33;
        v47[2] = @"code";
        uint64_t v34 = [NSNumber numberWithInteger:v31];
        v48[2] = v34;
        char v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
        HDPowerLogForClient(v32, v12, v35);

        _HKInitializeLogging();
        uint64_t v36 = *MEMORY[0x1E4F29F00];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v42 = v31;
          __int16 v43 = 2112;
          id v44 = v16;
          __int16 v45 = 2048;
          uint64_t v46 = v21;
          _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_INFO, "Requesting to set background delivery frequency of %lu for '%@' to %llu seconds", buf, 0x20u);
        }
        id v23 = objc_loadWeakRetained(location);
        id v24 = [v23 appSubscriptionManager];
        objc_msgSend(v24, "subscribeForBundleID:dataCode:frequencyInSeconds:appSDKVersionToken:", v16, objc_msgSend(v13, "code"), v21, v37);
        break;
      default:
        _HKInitializeLogging();
        uint64_t v25 = *MEMORY[0x1E4F29F00];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v42 = v21;
          _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "invalid update frequency %ld", buf, 0xCu);
        }
LABEL_9:
        uint64_t v26 = [v13 code];
        uint64_t v27 = kHDEventNameBGDelivery;
        v39[0] = @"action";
        v39[1] = @"code";
        v40[0] = @"removeSubscription";
        uint64_t v28 = [NSNumber numberWithInteger:v26];
        v40[1] = v28;
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
        HDPowerLogForClient(v27, v12, v29);

        _HKInitializeLogging();
        char v30 = *MEMORY[0x1E4F29F00];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v42 = v26;
          __int16 v43 = 2112;
          id v44 = v16;
          _os_log_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_INFO, "Disabling background delivery of %lu for '%@'", buf, 0x16u);
        }
        id v23 = objc_loadWeakRetained(location);
        id v24 = [v23 appSubscriptionManager];
        [v24 removeSubscriptionForBundleID:v16 dataCode:v26];
        break;
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v22 = *MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = (uint64_t)v16;
      _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_INFO, "Disabling all background delivery for '%@'", buf, 0xCu);
    }
    id v23 = objc_loadWeakRetained((id *)&self->_profile);
    id v24 = [v23 appSubscriptionManager];
    [v24 removeBundleID:v16];
  }

  if (v14) {
    v14[2](v14);
  }
}

- (id)diagnosticDescription
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[(NSMutableDictionary *)self->_observersByDataType copy];
  id v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = [v2 count];
  uint64_t v5 = &stru_1F1728D60;
  if (!v4) {
    uint64_t v5 = @"none";
  }
  uint64_t v6 = [v3 stringWithFormat:@"\nObservers: %@", v5];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v2;
  uint64_t v7 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v38 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v54 != v38) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1C187C0E0]();
        uint64_t v12 = [v10 integerValue];
        if (v12 == -1)
        {
          long long v14 = @"AllTypes";
        }
        else
        {
          id v13 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:v12];
          long long v14 = [v13 identifier];
        }
        long long v15 = [obj objectForKeyedSubscript:v10];
        [v6 appendFormat:@"\n\t%@ %ld (%lu):", v14, v12, objc_msgSend(v15, "count")];
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v59 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v50;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v50 != v19) {
                objc_enumerationMutation(v16);
              }
              [v6 appendFormat:@"\n\t\t%@", *(void *)(*((void *)&v49 + 1) + 8 * j)];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v49 objects:v59 count:16];
          }
          while (v18);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v8);
  }

  os_unfair_lock_lock(&self->_synchronousObserverLock);
  uint64_t v21 = (void *)[(NSMutableDictionary *)self->_synchronousObserversBySampleType copy];
  os_unfair_lock_unlock(&self->_synchronousObserverLock);
  uint64_t v22 = [v21 count];
  id v23 = &stru_1F1728D60;
  if (!v22) {
    id v23 = @"none";
  }
  [v6 appendFormat:@"\n\nSynchronous Observers: %@", v23];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v24 = v21;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v39 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v46 != v39) {
          objc_enumerationMutation(v24);
        }
        uint64_t v28 = *(void **)(*((void *)&v45 + 1) + 8 * k);
        uint64_t v29 = [v24 objectForKeyedSubscript:v28];
        char v30 = [v28 identifier];
        [v6 appendFormat:@"\n\t%@ %ld (%lu):", v30, objc_msgSend(v28, "code"), objc_msgSend(v29, "count")];

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v31 = [v29 allObservers];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v41 objects:v57 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v42;
          do
          {
            for (uint64_t m = 0; m != v33; ++m)
            {
              if (*(void *)v42 != v34) {
                objc_enumerationMutation(v31);
              }
              [v6 appendFormat:@"\n\t\t%@", *(void *)(*((void *)&v41 + 1) + 8 * m)];
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v41 objects:v57 count:16];
          }
          while (v33);
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v26);
  }

  return v6;
}

- (HDQuantitySeriesManager)quantitySeriesManager
{
  return self->_quantitySeriesManager;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_quantitySeriesManager, 0);
  objc_storeStrong((id *)&self->_lastAnchor, 0);
  objc_storeStrong((id *)&self->_pendingObjectsBySampleType, 0);
  objc_storeStrong((id *)&self->_synchronousObserversBySampleType, 0);
  objc_storeStrong((id *)&self->_observersByDataType, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end