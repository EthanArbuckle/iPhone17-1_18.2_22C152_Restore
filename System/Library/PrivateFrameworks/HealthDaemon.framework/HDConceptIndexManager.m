@interface HDConceptIndexManager
- (BOOL)_computeIsEnabled;
- (BOOL)_updateConceptIndexWithReason:(id)a3;
- (BOOL)ignoresAutomaticProcessingTriggers;
- (BOOL)performanceTest_triggerConceptIndexing;
- (BOOL)unitTest_hasScheduledIndexing;
- (HDConceptIndexManager)init;
- (HDConceptIndexManager)initWithConceptIndexerClass:(Class)a3 batchSize:(unint64_t)a4 profile:(id)a5;
- (HDConceptIndexManager)initWithProfile:(id)a3;
- (id)_takeAssertionWithError:(uint64_t)a1;
- (id)unitTesting_conceptIndexManagerDidFinish;
- (id)unitTesting_scheduledConceptIndexWorkDidFailAndClearState;
- (uint64_t)_canAutomaticallyScheduleConceptIndexing;
- (unint64_t)currentExecutionState;
- (void)_clearHasScheduledIndexing;
- (void)_dispatchDelayedOperationWithReason:(uint64_t)a1;
- (void)_setObservationForDataManager:(uint64_t)a1;
- (void)accountExistenceNotifier:(id)a3 didChangeHealthRecordAccountExistence:(BOOL)a4;
- (void)addObserver:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)invalidateAndWait;
- (void)ontologyDatabase:(id)a3 didBecomeAvailable:(BOOL)a4;
- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resetWithReindex;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
- (void)setIgnoresAutomaticProcessingTriggers:(BOOL)a3;
- (void)setUnitTesting_conceptIndexManagerDidFinish:(id)a3;
- (void)setUnitTesting_scheduledConceptIndexWorkDidFailAndClearState:(id)a3;
- (void)unitTest_debounceUpdateDelayOverride:(double)a3;
- (void)unitTest_scheduleUpdateWithDescription:(id)a3;
- (void)unitTest_setHasScheduledIndexing:(BOOL)a3;
@end

@implementation HDConceptIndexManager

- (HDConceptIndexManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDConceptIndexManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v5 = [(HDConceptIndexManager *)self initWithConceptIndexerClass:objc_opt_class() batchSize:20 profile:v4];

  return v5;
}

- (HDConceptIndexManager)initWithConceptIndexerClass:(Class)a3 batchSize:(unint64_t)a4 profile:(id)a5
{
  id v9 = a5;
  v10 = v9;
  if (a4)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HDConceptIndexManager.m", 84, @"Invalid parameter not satisfying: %@", @"batchSize" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"HDConceptIndexManager.m", 85, @"Invalid parameter not satisfying: %@", @"profile" object file lineNumber description];

LABEL_3:
  v31.receiver = self;
  v31.super_class = (Class)HDConceptIndexManager;
  v11 = [(HDConceptIndexManager *)&v31 init];
  v12 = v11;
  if (v11)
  {
    atomic_store(0, (unsigned __int8 *)&v11->_isInvalidated);
    *(_WORD *)&v11->_hasScheduledIndexing = 0;
    v11->_stateLock._os_unfair_lock_opaque = 0;
    uint64_t v13 = HKCreateSerialDispatchQueue();
    delayedOperationQueue = v12->_delayedOperationQueue;
    v12->_delayedOperationQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v12->_profile, v10);
    v12->_conceptIndexerClass = a3;
    v12->_batchSize = a4;
    id v15 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    uint64_t v16 = [v15 initWithName:@"concept-index-scheduler-observers" loggingCategory:*MEMORY[0x1E4F29F28]];
    observerSet = v12->_observerSet;
    v12->_observerSet = (HKObserverSet *)v16;

    v12->_conceptIndexUpdateDebounceIntervalOverride = 0.25;
    v18 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    cachedReasonsForReindex = v12->_cachedReasonsForReindex;
    v12->_cachedReasonsForReindex = v18;

    objc_initWeak(&location, v12);
    id v20 = objc_alloc(MEMORY[0x1E4F2B8C8]);
    v21 = v12->_delayedOperationQueue;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __71__HDConceptIndexManager_initWithConceptIndexerClass_batchSize_profile___block_invoke;
    v28[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v29, &location);
    uint64_t v22 = [v20 initWithMode:1 queue:v21 delay:v28 block:2.0];
    updateIndexOperation = v12->_updateIndexOperation;
    v12->_updateIndexOperation = (_HKDelayedOperation *)v22;

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    [WeakRetained registerProfileReadyObserver:v12 queue:0];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __71__HDConceptIndexManager_initWithConceptIndexerClass_batchSize_profile___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v31 = (uint64_t)WeakRetained;
    dispatch_assert_queue_V2(WeakRetained[8]);
    id v3 = *(id *)(v31 + 72);
    unint64_t v4 = [v3 count];
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    v6 = v5;
    if (v4 >= 2) {
      [v5 appendString:@"["];
    }
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __HDStringForIndexTriggerReasons_block_invoke;
    v40 = &unk_1E6302EB8;
    id v7 = v3;
    id v41 = v7;
    objc_msgSend(v6, "hk_appendComponentsJoinedByString:container:componentGenerator:", @", ", v7, buf);
    if (v4 >= 2) {
      [v6 appendString:@"]"];
    }

    [*(id *)(v31 + 72) removeAllObjects];
    id v8 = v6;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v31 + 64));
    uint64_t v9 = v31;
    if (*(unsigned char *)(v31 + 61))
    {
      _HKInitializeLogging();
      v10 = HKLogConceptIndex();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v31;
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting concept index.", buf, 0xCu);
      }

      v11 = *(void **)(v31 + 48);
      id v12 = objc_loadWeakRetained((id *)(v31 + 16));
      id v34 = 0;
      char v13 = [v11 resetIndexManagerStateForProfile:v12 withError:&v34];
      v14 = v34;

      if ((v13 & 1) == 0)
      {
        _HKInitializeLogging();
        v18 = HKLogConceptIndex();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v31;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v14;
          _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset concept index with error :%{public}@", buf, 0x16u);
        }
        goto LABEL_20;
      }
      *(unsigned char *)(v31 + 61) = 0;

      uint64_t v9 = v31;
    }
    if (-[HDConceptIndexManager _computeIsEnabled](v9))
    {
      id v15 = (os_unfair_lock_s *)(v31 + 56);
      os_unfair_lock_lock((os_unfair_lock_t)(v31 + 56));
      if (*(unsigned char *)(v31 + 60))
      {
        os_unfair_lock_unlock(v15);
        _HKInitializeLogging();
        uint64_t v16 = HKLogConceptIndex();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

        if (!v17)
        {
LABEL_22:

          v2 = (void *)v31;
          goto LABEL_23;
        }
        v14 = HKLogConceptIndex();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v31;
          _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_INFO, "%{public}@: Skipping scheduling of indexing operation, we already have a scheduled operation.", buf, 0xCu);
        }
      }
      else
      {
        *(unsigned char *)(v31 + 60) = 1;
        os_unfair_lock_unlock(v15);
        [*(id *)(v31 + 32) invalidate];
        id v33 = 0;
        uint64_t v19 = -[HDConceptIndexManager _takeAssertionWithError:](v31, &v33);
        v14 = v33;
        id v20 = *(void **)(v31 + 32);
        *(void *)(v31 + 32) = v19;

        uint64_t v21 = v31;
        if (!*(void *)(v31 + 32))
        {
          _HKInitializeLogging();
          uint64_t v22 = HKLogConceptIndex();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v30 = [v14 localizedDescription];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v30;
            _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Was not able to take out initial acessibility assertion with error %{public}@. Proceeding to schedule indexing work, and try to take assertion later.", buf, 0x16u);
          }
          uint64_t v21 = v31;
        }
        v23 = [NSString stringWithFormat:@"%@: Indexing operation with reason %@", v21, v8];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __85__HDConceptIndexManager__delayedOperationQueue_scheduleConceptIndexUpdateWithReason___block_invoke;
        v40 = &unk_1E6302E68;
        id v41 = (id)v31;
        id v24 = v8;
        id v42 = v24;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __85__HDConceptIndexManager__delayedOperationQueue_scheduleConceptIndexUpdateWithReason___block_invoke_2;
        v32[3] = &unk_1E62F48B0;
        v32[4] = v31;
        v25 = +[HDMaintenanceOperation maintenanceOperationWithName:v23 asynchronousBlock:buf canceledBlock:v32];

        _HKInitializeLogging();
        v26 = HKLogConceptIndex();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v35 = 138543618;
          uint64_t v36 = v31;
          __int16 v37 = 2114;
          id v38 = v24;
          _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling Indexing operation on maintenance coordinator with reason: %{public}@", v35, 0x16u);
        }

        id v27 = objc_loadWeakRetained((id *)(v31 + 16));
        v28 = [v27 daemon];
        id v29 = [v28 maintenanceWorkCoordinator];
        [v29 enqueueMaintenanceOperation:v25];
      }
LABEL_21:

      goto LABEL_22;
    }
    v14 = _Block_copy(*(const void **)(v31 + 104));
    if (!v14) {
      goto LABEL_21;
    }
    v18 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 119, @"Concept Index manager is not enabled and wont perform any work.");
    ((void (*)(NSObject *, void, void, NSObject *))v14[2].isa)(v14, 0, 0, v18);
LABEL_20:

    goto LABEL_21;
  }
LABEL_23:
}

- (void)resetWithReindex
{
  delayedOperationQueue = self->_delayedOperationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HDConceptIndexManager_resetWithReindex__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(delayedOperationQueue, block);
  if (-[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self)) {
    -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, @"Post-Reset Indexing");
  }
}

uint64_t __41__HDConceptIndexManager_resetWithReindex__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 61)) {
    *(unsigned char *)(v1 + 61) = 1;
  }
  return result;
}

- (uint64_t)_canAutomaticallyScheduleConceptIndexing
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    v2 = (id *)(result + 16);
    id WeakRetained = objc_loadWeakRetained((id *)(result + 16));
    unint64_t v4 = [WeakRetained daemon];
    id v5 = [v4 behavior];
    int v6 = [v5 healthAppNotInstalled];

    id v7 = objc_loadWeakRetained(v2);
    id v8 = [v7 daemon];
    uint64_t v9 = [v8 behavior];
    if ([v9 performsAutomaticConceptIndexing])
    {
      if (*(unsigned char *)(v1 + 96)) {
        int v10 = 1;
      }
      else {
        int v10 = v6;
      }

      if (v10 != 1) {
        return 1;
      }
    }
    else
    {
    }
    _HKInitializeLogging();
    v11 = HKLogConceptIndex();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HKStringFromBool();
      id v13 = objc_loadWeakRetained(v2);
      v14 = [v13 daemon];
      id v15 = [v14 behavior];
      [v15 performsAutomaticConceptIndexing];
      uint64_t v16 = HKStringFromBool();
      BOOL v17 = HKStringFromBool();
      int v18 = 138544130;
      uint64_t v19 = v1;
      __int16 v20 = 2114;
      uint64_t v21 = v12;
      __int16 v22 = 2114;
      v23 = v16;
      __int16 v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot automatically schedule concept indexing. Health App Installed %{public}@, performsAutomaticConceptIndexing %{public}@, ignoresAutomaticProcessingTriggers %{public}@", (uint8_t *)&v18, 0x2Au);
    }
    return 0;
  }
  return result;
}

- (void)_dispatchDelayedOperationWithReason:(uint64_t)a1
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(NSObject **)(a1 + 64);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__HDConceptIndexManager__dispatchDelayedOperationWithReason___block_invoke;
    v6[3] = &unk_1E62F31C0;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

- (void)invalidateAndWait
{
  atomic_store(1u, (unsigned __int8 *)&self->_isInvalidated);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v3 = [WeakRetained ontologyDatabase];
  [v3 removeOntologyDatabaseAvailabilityObserver:self];
}

- (unint64_t)currentExecutionState
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_hasScheduledIndexing) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = 1;
  }
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (void)dealloc
{
  -[HDConceptIndexManager _setObservationForDataManager:]((uint64_t)self, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  unint64_t v4 = [WeakRetained database];
  [v4 removeProtectedDataObserver:self];

  [(_HKDelayedOperation *)self->_updateIndexOperation invalidate];
  [(HDAssertion *)self->_preparedDatabaseAccessibilityAssertion invalidate];
  v5.receiver = self;
  v5.super_class = (Class)HDConceptIndexManager;
  [(HDConceptIndexManager *)&v5 dealloc];
}

- (void)_setObservationForDataManager:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v4 = (id *)(a1 + 16);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    int v6 = [WeakRetained daemon];
    id v7 = [v6 behavior];
    if ([v7 futureMigrationsEnabled]) {
      uint64_t v8 = 8;
    }
    else {
      uint64_t v8 = 0;
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F2B448], "medicalRecordTypesWithOptions:", v8, 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v15 = objc_loadWeakRetained(v4);
          uint64_t v16 = [v15 dataManager];
          BOOL v17 = v16;
          if (a2) {
            [v16 addObserver:a1 forDataType:v14];
          }
          else {
            [v16 removeObserver:a1 forDataType:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

- (void)addObserver:(id)a3
{
  observerSet = self->_observerSet;
  id v5 = a3;
  [(HKObserverSet *)observerSet registerObserver:v5];
  int v6 = self->_observerSet;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__HDConceptIndexManager_addObserver___block_invoke;
  v7[3] = &unk_1E6302E20;
  v7[4] = self;
  [(HKObserverSet *)v6 notifyObserver:v5 handler:v7];
}

void __37__HDConceptIndexManager_addObserver___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "conceptIndexManagerDidChangeExecutionState:", objc_msgSend(v2, "currentExecutionState"));
}

- (void)removeObserver:(id)a3
{
}

uint64_t __60__HDConceptIndexManager__notifyObserversWithExecutionState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conceptIndexManagerDidChangeExecutionState:*(void *)(a1 + 32)];
}

- (BOOL)_computeIsEnabled
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(a1 + 40));
    if ((v2 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      unint64_t v4 = [WeakRetained daemon];
      id v5 = [v4 behavior];
      char v6 = [v5 supportsOntology];

      if (v6)
      {
        id v7 = [WeakRetained daemon];
        uint64_t v8 = [v7 behavior];
        char v9 = [v8 ontologyIndexingEnabled];

        _HKInitializeLogging();
        if (v9)
        {
          uint64_t v10 = HKLogHealthOntology();
          BOOL v11 = 1;
          BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

          if (v12)
          {
            id v13 = HKLogHealthOntology();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              int v20 = 138543362;
              uint64_t v21 = a1;
              _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_INFO, "%{public}@: Concept Indexing Is Enabled", (uint8_t *)&v20, 0xCu);
            }
            goto LABEL_21;
          }
LABEL_22:

          return v11;
        }
        long long v18 = HKLogConceptIndex();
        BOOL v11 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

        if (!v11) {
          goto LABEL_22;
        }
        id v13 = HKLogConceptIndex();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v20 = 138543362;
          uint64_t v21 = a1;
          BOOL v17 = "%{public}@: Indexing not enabled: behavior for indexing disabled";
          goto LABEL_19;
        }
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v16 = HKLogConceptIndex();
        BOOL v11 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

        if (!v11) {
          goto LABEL_22;
        }
        id v13 = HKLogConceptIndex();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v20 = 138543362;
          uint64_t v21 = a1;
          BOOL v17 = "%{public}@: Indexing not enabled: behavior does not support ontology";
LABEL_19:
          _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v20, 0xCu);
        }
      }
      BOOL v11 = 0;
LABEL_21:

      goto LABEL_22;
    }
    _HKInitializeLogging();
    uint64_t v14 = HKLogConceptIndex();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

    if (v15)
    {
      id WeakRetained = HKLogConceptIndex();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
      {
        int v20 = 138543362;
        uint64_t v21 = a1;
        _os_log_impl(&dword_1BCB7D000, WeakRetained, OS_LOG_TYPE_INFO, "%{public}@: Indexing is not enabled: either ontology is currently updating, or the index manager has been invalidated.", (uint8_t *)&v20, 0xCu);
      }
      BOOL v11 = 0;
      goto LABEL_22;
    }
  }
  return 0;
}

- (id)_takeAssertionWithError:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v4 = NSString;
    id v5 = (objc_class *)objc_opt_class();
    char v6 = NSStringFromClass(v5);
    id v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = [v7 UUIDString];
    char v9 = [v4 stringWithFormat:@"%@-%@", v6, v8];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    BOOL v11 = [WeakRetained database];
    id v19 = 0;
    BOOL v12 = [v11 takeAccessibilityAssertionWithOwnerIdentifier:v9 timeout:&v19 error:300.0];
    id v13 = v19;

    if (!v12)
    {
      _HKInitializeLogging();
      uint64_t v14 = HKLogHealthOntology();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

      if (v15)
      {
        uint64_t v16 = HKLogHealthOntology();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          BOOL v17 = [v13 localizedDescription];
          *(_DWORD *)buf = 138543618;
          uint64_t v21 = a1;
          __int16 v22 = 2114;
          uint64_t v23 = v17;
          _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_INFO, "%{public}@: unable to take accessibility assertion with error: %{public}@.", buf, 0x16u);
        }
      }
    }
    if (a2) {
      *a2 = v13;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void __85__HDConceptIndexManager__delayedOperationQueue_scheduleConceptIndexUpdateWithReason___block_invoke(uint64_t a1, void *a2)
{
  char v6 = a2;
  id v3 = +[HKDaemonTransaction transactionWithOwner:*(void *)(a1 + 32) activityName:@"indexing"];
  if (([*(id *)(a1 + 32) _updateConceptIndexWithReason:*(void *)(a1 + 40)] & 1) == 0)
  {
    -[HDConceptIndexManager _clearHasScheduledIndexing](*(void *)(a1 + 32));
    unint64_t v4 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 112));
    id v5 = v4;
    if (v4) {
      (*((void (**)(void *))v4 + 2))(v4);
    }
  }
  v6[2]();
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  [v3 invalidate];
}

- (void)_clearHasScheduledIndexing
{
  if (a1)
  {
    unsigned __int8 v2 = (os_unfair_lock_s *)(a1 + 56);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) = 0;
    os_unfair_lock_unlock(v2);
  }
}

void __85__HDConceptIndexManager__delayedOperationQueue_scheduleConceptIndexUpdateWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned __int8 v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = a2;
  [v2 invalidate];
  v3[2]();
}

- (BOOL)_updateConceptIndexWithReason:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_preparedDatabaseAccessibilityAssertion;
  preparedDatabaseAccessibilityAssertion = self->_preparedDatabaseAccessibilityAssertion;
  self->_preparedDatabaseAccessibilityAssertion = 0;

  if (v5)
  {
    id v7 = 0;
LABEL_4:
    observerSet = self->_observerSet;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __60__HDConceptIndexManager__notifyObserversWithExecutionState___block_invoke;
    v45 = &__block_descriptor_40_e41_v16__0___HDConceptIndexManagerObserver__8l;
    *(void *)v46 = 2;
    [(HKObserverSet *)observerSet notifyObservers:buf];
    char v9 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    [(HDMutableDatabaseTransactionContext *)v9 setCacheScope:1];
    [(HDMutableDatabaseTransactionContext *)v9 addAccessibilityAssertion:v5];
    _HKInitializeLogging();
    uint64_t v10 = HKLogConceptIndex();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning concept indexing with reason: %{public}@.", buf, 0x16u);
    }

    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0;
    double Current = CFAbsoluteTimeGetCurrent();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v13 = [WeakRetained database];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __55__HDConceptIndexManager__updateConceptIndexWithReason___block_invoke;
    v36[3] = &unk_1E62FA068;
    v36[4] = self;
    v36[5] = &v38;
    id v37 = v7;
    uint64_t v14 = [v13 performWithTransactionContext:v9 error:&v37 block:v36];
    id v15 = v37;

    unint64_t v16 = v39[3];
    unint64_t batchSize = self->_batchSize;
    if (v16 % batchSize) {
      uint64_t v18 = v16 / batchSize + 1;
    }
    else {
      uint64_t v18 = v16 / batchSize;
    }
    _HKInitializeLogging();
    id v19 = HKLogConceptIndex();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v9;
      uint64_t v20 = v14;
      id v21 = v4;
      uint64_t v22 = v20;
      if (v20) {
        uint64_t v23 = @"Success";
      }
      else {
        uint64_t v23 = @"Failure";
      }
      uint64_t v24 = (void *)v39[3];
      double v25 = CFAbsoluteTimeGetCurrent();
      uint64_t v26 = [v15 localizedDescription];
      *(_DWORD *)buf = 138544898;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2048;
      v45 = v24;
      *(_WORD *)v46 = 2048;
      *(void *)&v46[2] = v18;
      *(_WORD *)&v46[10] = 2114;
      id v4 = v21;
      *(void *)&v46[12] = v21;
      __int16 v47 = 2048;
      double v48 = v25 - Current;
      __int16 v49 = 2114;
      v50 = v26;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ indexing %ld records in %ld batches with reason %{public}@, duration: %.3f seconds, Error: %{public}@", buf, 0x48u);

      uint64_t v14 = v22;
      char v9 = v35;
    }

    uint64_t v27 = v39[3];
    id v7 = v15;
    v28 = _Block_copy(self->_unitTesting_conceptIndexManagerDidFinish);
    id v29 = v28;
    if (v28) {
      (*((void (**)(void *, uint64_t, uint64_t, id))v28 + 2))(v28, v14, v27, v7);
    }
    v30 = self->_observerSet;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __90__HDConceptIndexManager__notifyObserversBecameIdleWithSampleProcessedCount_success_error___block_invoke;
    v45 = &unk_1E6302E90;
    *(void *)v46 = self;
    *(void *)&v46[8] = v27;
    -[HKObserverSet notifyObservers:](v30, "notifyObservers:", buf, v35);
    uint64_t v31 = self->_observerSet;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __60__HDConceptIndexManager__notifyObserversWithExecutionState___block_invoke;
    v43[3] = &__block_descriptor_40_e41_v16__0___HDConceptIndexManagerObserver__8l;
    v43[4] = 1;
    [(HKObserverSet *)v31 notifyObservers:v43];

    [(HDAssertion *)v5 invalidate];
    _Block_object_dispose(&v38, 8);
    goto LABEL_17;
  }
  id v42 = 0;
  -[HDConceptIndexManager _takeAssertionWithError:]((uint64_t)self, &v42);
  id v5 = (HDAssertion *)objc_claimAutoreleasedReturnValue();
  id v7 = v42;
  if (v5) {
    goto LABEL_4;
  }
  id v33 = (HDAssertion *)_Block_copy(self->_unitTesting_conceptIndexManagerDidFinish);
  id v5 = v33;
  if (v33) {
    ((void (*)(HDAssertion *, void, void, id))v33->_state)(v33, 0, 0, v7);
  }
  _HKInitializeLogging();
  HKLogConceptIndex();
  char v9 = (HDMutableDatabaseTransactionContext *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR))
  {
    id v34 = [v7 localizedDescription];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v34;
    _os_log_error_impl(&dword_1BCB7D000, &v9->super.super, OS_LOG_TYPE_ERROR, "%{public}@: Was not able to take out inner acessibility assertion with error %{public}@. Cannot perform concept index work.", buf, 0x16u);
  }
  LOBYTE(v14) = 0;
LABEL_17:

  return v14;
}

uint64_t __55__HDConceptIndexManager__updateConceptIndexWithReason___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v5 = [WeakRetained database];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __55__HDConceptIndexManager__updateConceptIndexWithReason___block_invoke_2;
  v30[3] = &unk_1E62F3DB0;
  v30[4] = *(void *)(a1 + 32);
  v30[5] = &v31;
  BOOL v6 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v5 error:a2 block:v30];

  if (v6)
  {
    if (*((unsigned char *)v32 + 24))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(v7 + 48);
      uint64_t v9 = *(void *)(v7 + 8);
      id v10 = objc_loadWeakRetained((id *)(v7 + 16));
      uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8);
      id v11 = v10;
      uint64_t v29 = self;
      BOOL v12 = 0;
      uint64_t v13 = 0;
      while (1)
      {
        uint64_t v35 = 0;
        double Current = CFAbsoluteTimeGetCurrent();
        _HKInitializeLogging();
        id v15 = HKLogConceptIndex();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

        if (v16)
        {
          BOOL v17 = HKLogConceptIndex();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v37 = v29;
            __int16 v38 = 2048;
            v39 = v12;
            _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_INFO, "%{public}@: Start concept indexing batch %ld", buf, 0x16u);
          }
        }
        uint64_t v18 = [v8 indexSamplesForProfile:v11 limit:v9 outIndexedSamplesCount:&v35 error:a2];
        uint64_t v19 = v35;
        _HKInitializeLogging();
        uint64_t v20 = HKLogConceptIndex();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

        if (v21)
        {
          uint64_t v22 = HKLogConceptIndex();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            uint64_t v23 = v35;
            double v24 = CFAbsoluteTimeGetCurrent();
            double v25 = @"Failure";
            if (v18) {
              double v25 = @"Success";
            }
            *(_DWORD *)buf = 138544386;
            uint64_t v37 = v29;
            __int16 v38 = 2112;
            v39 = v25;
            __int16 v40 = 2048;
            uint64_t v41 = v12;
            __int16 v42 = 2048;
            uint64_t v43 = v23;
            __int16 v44 = 2048;
            double v45 = v24 - Current;
            _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_INFO, "%{public}@: %@ concept indexing batch %ld (%ld) in %0.3f", buf, 0x34u);
          }
        }
        v13 += v19;
        if ((v18 & 1) == 0) {
          break;
        }
        if (v35 < v9)
        {
          uint64_t v26 = [v11 conceptIndexManager];
          -[HDConceptIndexManager _clearHasScheduledIndexing]((uint64_t)v26);

          break;
        }
        BOOL v12 = (__CFString *)((char *)v12 + 1);
      }
      *(void *)(v28 + 24) = v13;
    }
    else
    {
      -[HDConceptIndexManager _clearHasScheduledIndexing](*(void *)(a1 + 32));
      uint64_t v18 = 1;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  _Block_object_dispose(&v31, 8);
  return v18;
}

BOOL __55__HDConceptIndexManager__updateConceptIndexWithReason___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = (id *)(*(void *)(a1 + 32) + 16);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = v6;
  id v9 = WeakRetained;
  uint64_t v10 = self;
  id v11 = [v9 conceptIndexManager];

  LOBYTE(WeakRetained) = -[HDConceptIndexManager _computeIsEnabled]((uint64_t)v11);
  if (WeakRetained)
  {
    BOOL v12 = [v8 protectedDatabase];
    id v20 = 0;
    uint64_t v13 = +[HDDataEntity anyInDatabase:v12 predicate:0 error:&v20];
    uint64_t v14 = v20;

    if (v13)
    {
      uint64_t v15 = 1;
    }
    else
    {
      _HKInitializeLogging();
      BOOL v17 = HKLogConceptIndex();
      uint64_t v18 = v17;
      if (v14)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = [v14 localizedDescription];
          *(_DWORD *)buf = 138543618;
          uint64_t v22 = v10;
          __int16 v23 = 2112;
          double v24 = v19;
          _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Error when determining if concept index manager should schedule work: %@", buf, 0x16u);
        }
        if (a3)
        {
          uint64_t v15 = 0;
          *a3 = v14;
        }
        else
        {
          _HKLogDroppedError();
          uint64_t v15 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v22 = v10;
          _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Should not proceed with updating concept index because there are no medical records in the database", buf, 0xCu);
        }

        uint64_t v15 = 2;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v14 = HKLogConceptIndex();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v10;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Should not proceed with updating concept index because index manager is not enabled", buf, 0xCu);
    }
    uint64_t v15 = 2;
  }

  if (v15 == 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return v15 != 0;
}

uint64_t __90__HDConceptIndexManager__notifyObserversBecameIdleWithSampleProcessedCount_success_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conceptIndexManagerDidBecomeQuiescent:*(void *)(a1 + 32) samplesProcessedCount:*(void *)(a1 + 40)];
}

uint64_t __61__HDConceptIndexManager__dispatchDelayedOperationWithReason___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 80);
  if (_HDIsUnitTesting) {
    double v4 = *(double *)(v2 + 88);
  }
  else {
    double v4 = 2.0;
  }

  return [v3 executeWithDelay:v4];
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  if (-[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self))
  {
    -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, @"Samples Added");
  }
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  if (-[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self))
  {
    -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, @"Samples Removed");
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4 && -[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self))
  {
    -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, @"Protected Data Became Available");
  }
}

- (void)accountExistenceNotifier:(id)a3 didChangeHealthRecordAccountExistence:(BOOL)a4
{
  if (a4 && -[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self))
  {
    -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, @"Account Existence Notified");
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained database];
  [v6 addProtectedDataObserver:self];

  id v7 = objc_loadWeakRetained((id *)p_profile);
  id v8 = [v7 ontologyDatabase];
  [v8 addOntologyDatabaseAvailabilityObserver:self];

  id v9 = objc_loadWeakRetained((id *)p_profile);
  uint64_t v10 = [v9 healthRecordsAccountExistenceNotifier];
  [v10 addAccountExistenceObserver:self];

  id v11 = objc_loadWeakRetained((id *)p_profile);
  BOOL v12 = [v11 daemon];
  uint64_t v13 = [v12 ontologyUpdateCoordinator];
  uint64_t v14 = [v13 importer];
  [v14 addOntologyShardImporterObserver:self queue:0];

  -[HDConceptIndexManager _setObservationForDataManager:]((uint64_t)self, 1);
  if (-[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self))
  {
    -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, @"Daemon Ready");
  }
}

- (void)ontologyDatabase:(id)a3 didBecomeAvailable:(BOOL)a4
{
  if (a4 && -[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self))
  {
    -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, @"Ontology did become available");
  }
}

- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 schemaType];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F2A2F8]];

  if (v7)
  {
    _HKInitializeLogging();
    id v8 = HKLogConceptIndex();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v5 identifier];
      int v10 = 138543874;
      id v11 = self;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = [v5 availableVersion];
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Request reset concept index due to importing %{public}@ %ld", (uint8_t *)&v10, 0x20u);
    }
    [(HDConceptIndexManager *)self resetWithReindex];
  }
}

- (void)unitTest_scheduleUpdateWithDescription:(id)a3
{
}

- (BOOL)performanceTest_triggerConceptIndexing
{
  return [(HDConceptIndexManager *)self _updateConceptIndexWithReason:@"Performance Testing"];
}

- (void)unitTest_debounceUpdateDelayOverride:(double)a3
{
  self->_conceptIndexUpdateDebounceIntervalOverride = a3;
}

- (void)unitTest_setHasScheduledIndexing:(BOOL)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_hasScheduledIndexing = a3;

  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)unitTest_hasScheduledIndexing
{
  uint64_t v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_hasScheduledIndexing;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)ignoresAutomaticProcessingTriggers
{
  return self->_ignoresAutomaticProcessingTriggers;
}

- (void)setIgnoresAutomaticProcessingTriggers:(BOOL)a3
{
  self->_ignoresAutomaticProcessingTriggers = a3;
}

- (id)unitTesting_conceptIndexManagerDidFinish
{
  return self->_unitTesting_conceptIndexManagerDidFinish;
}

- (void)setUnitTesting_conceptIndexManagerDidFinish:(id)a3
{
}

- (id)unitTesting_scheduledConceptIndexWorkDidFailAndClearState
{
  return self->_unitTesting_scheduledConceptIndexWorkDidFailAndClearState;
}

- (void)setUnitTesting_scheduledConceptIndexWorkDidFailAndClearState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_scheduledConceptIndexWorkDidFailAndClearState, 0);
  objc_storeStrong(&self->_unitTesting_conceptIndexManagerDidFinish, 0);
  objc_storeStrong((id *)&self->_updateIndexOperation, 0);
  objc_storeStrong((id *)&self->_cachedReasonsForReindex, 0);
  objc_storeStrong((id *)&self->_delayedOperationQueue, 0);
  objc_storeStrong((id *)&self->_preparedDatabaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_observerSet, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end