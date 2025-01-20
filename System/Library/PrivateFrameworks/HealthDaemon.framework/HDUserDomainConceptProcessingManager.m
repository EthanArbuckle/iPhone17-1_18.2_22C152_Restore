@interface HDUserDomainConceptProcessingManager
+ (id)_maximumSyncAnchorForUserDomainConceptsWithTransaction:(void *)a3 error:;
- (BOOL)ignoresAutomaticProcessingTriggers;
- (HDProfile)profile;
- (HDUserDomainConceptProcessingManager)init;
- (HDUserDomainConceptProcessingManager)initWithProfile:(id)a3;
- (id)unitTesting_userDomainConceptProcessingManagerDidFinishProcessing;
- (uint64_t)_processUserDomainConceptsWithReason:(void *)a3 accessibilityAssertion:;
- (void)_scheduleProcessingOperationIfEnabledWithReason:(uint64_t)a1;
- (void)_scheduleProcessingOperationWithReason:(uint64_t)a1;
- (void)dealloc;
- (void)ontologyDatabase:(id)a3 didBecomeAvailable:(BOOL)a4;
- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)setIgnoresAutomaticProcessingTriggers:(BOOL)a3;
- (void)setUnitTesting_userDomainConceptProcessingManagerDidFinishProcessing:(id)a3;
- (void)unitTesting_overrideDefaultBatchLimit:(int64_t)a3;
- (void)unitTesting_overrideDefaultBatchSize:(int64_t)a3;
- (void)unitTesting_scheduleUserDomainConceptProcessing;
- (void)unitTesting_triggerUserDomainConceptProcessing;
- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4;
- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4;
@end

@implementation HDUserDomainConceptProcessingManager

- (HDUserDomainConceptProcessingManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDUserDomainConceptProcessingManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDUserDomainConceptProcessingManager;
  v5 = [(HDUserDomainConceptProcessingManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_hasScheduledProcessing = 0;
    *(int64x2_t *)&v6->_batchSize = vdupq_n_s64(0x32uLL);
    databaseAssertion = v6->_databaseAssertion;
    v6->_databaseAssertion = 0;

    atomic_store(0, (unsigned __int8 *)&v6->_isDisabledForHealthDaemonLifetime);
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    [WeakRetained registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  id v11 = a3;
  id v4 = [v11 ontologyDatabase];
  [v4 addOntologyDatabaseAvailabilityObserver:self];

  v5 = [v11 daemon];
  v6 = [v5 ontologyUpdateCoordinator];
  v7 = [v6 importer];
  [v7 addOntologyShardImporterObserver:self queue:0];

  v8 = [v11 userDomainConceptManager];
  [v8 addUserDomainConceptObserver:self queue:0];

  v9 = [v11 ontologyDatabase];
  LODWORD(v6) = [v9 isAvailable];

  if (v6)
  {
    objc_super v10 = [v11 ontologyDatabase];
    [(HDUserDomainConceptProcessingManager *)self ontologyDatabase:v10 didBecomeAvailable:1];
  }
}

- (void)ontologyDatabase:(id)a3 didBecomeAvailable:(BOOL)a4
{
  if (a4) {
    -[HDUserDomainConceptProcessingManager _scheduleProcessingOperationIfEnabledWithReason:]((uint64_t)self, @"Ontology Became Available");
  }
}

- (void)_scheduleProcessingOperationIfEnabledWithReason:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v4 = [WeakRetained daemon];
    v5 = [v4 behavior];
    unsigned __int8 v6 = [v5 healthAppNotInstalled];

    unsigned __int8 v7 = atomic_load((unsigned __int8 *)(a1 + 56));
    id v8 = objc_loadWeakRetained((id *)(a1 + 64));
    v9 = [v8 daemon];
    objc_super v10 = [v9 behavior];
    if ([v10 performsAutomaticUserDomainConceptProcessing] && !*(unsigned char *)(a1 + 57))
    {

      if (((v6 | v7) & 1) == 0)
      {
        -[HDUserDomainConceptProcessingManager _scheduleProcessingOperationWithReason:](a1, v19);
        goto LABEL_8;
      }
    }
    else
    {
    }
    _HKInitializeLogging();
    id v11 = HKLogHealthOntology();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = HKStringFromBool();
      id v13 = objc_loadWeakRetained((id *)(a1 + 64));
      v14 = [v13 daemon];
      v15 = [v14 behavior];
      [v15 performsAutomaticUserDomainConceptProcessing];
      v16 = HKStringFromBool();
      v17 = HKStringFromBool();
      v18 = HKStringFromBool();
      *(_DWORD *)buf = 138544386;
      uint64_t v21 = a1;
      __int16 v22 = 2114;
      v23 = v12;
      __int16 v24 = 2114;
      v25 = v16;
      __int16 v26 = 2114;
      v27 = v17;
      __int16 v28 = 2114;
      v29 = v18;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot automatically schedule UDC processing. Health App Installed %{public}@, performsAutomaticUserDomainConceptProcessing %{public}@, ignoresAutomaticProcessingTriggers %{public}@, _isDisabledForHealthDaemonLifetime %{public}@", buf, 0x34u);
    }
  }
LABEL_8:
}

- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4
{
  id v10 = a4;
  v5 = [v10 schemaType];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F2A2F8]];

  if (v6)
  {
    unsigned __int8 v7 = NSString;
    id v8 = [v10 identifier];
    v9 = [v7 stringWithFormat:@"Ontology Imported %@ %ld", v8, objc_msgSend(v10, "availableVersion")];

    -[HDUserDomainConceptProcessingManager _scheduleProcessingOperationIfEnabledWithReason:]((uint64_t)self, v9);
  }
}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  databaseAssertion = self->_databaseAssertion;
  if (databaseAssertion) {
    [(HDAssertion *)databaseAssertion invalidate];
  }
  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)HDUserDomainConceptProcessingManager;
  [(HDUserDomainConceptProcessingManager *)&v5 dealloc];
}

- (void)_scheduleProcessingOperationWithReason:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(unsigned char *)(a1 + 32))
    {
      _HKInitializeLogging();
      id v4 = HKLogHealthOntology();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (v5)
      {
        int v6 = HKLogHealthOntology();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          CFAbsoluteTimeGetCurrent();
          unsigned __int8 v7 = HKDiagnosticStringFromDuration();
          *(_DWORD *)buf = 138543618;
          uint64_t v36 = a1;
          __int16 v37 = 2114;
          id v38 = v7;
          _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "%{public}@: Already scheduled processing %{public}@ ago", buf, 0x16u);
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    }
    else
    {
      *(unsigned char *)(a1 + 32) = 1;
      *(CFAbsoluteTime *)(a1 + 40) = CFAbsoluteTimeGetCurrent();
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      id v8 = *(void **)(a1 + 48);
      if (v8)
      {
        id v9 = 0;
      }
      else
      {
        id v10 = NSString;
        id v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        id v13 = [MEMORY[0x1E4F29128] UUID];
        v14 = [v13 UUIDString];
        v15 = [v10 stringWithFormat:@"%@-%@", v12, v14];

        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        v17 = [WeakRetained database];
        id v34 = 0;
        uint64_t v18 = [v17 takeAccessibilityAssertionWithOwnerIdentifier:v15 timeout:&v34 error:300.0];
        id v9 = v34;
        id v19 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v18;

        id v8 = *(void **)(a1 + 48);
      }
      id v20 = v8;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      if (v20)
      {
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __79__HDUserDomainConceptProcessingManager__scheduleProcessingOperationWithReason___block_invoke;
        v31[3] = &unk_1E62FEFF8;
        v31[4] = a1;
        id v21 = v3;
        id v32 = v21;
        id v33 = v20;
        __int16 v22 = +[HDMaintenanceOperation maintenanceOperationWithName:v21 asynchronousBlock:v31];
        _HKInitializeLogging();
        v23 = HKLogHealthOntology();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v36 = a1;
          __int16 v37 = 2114;
          id v38 = v21;
          _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling User Domain Concept processing on maintenance coordinator with reason: %{public}@", buf, 0x16u);
        }

        id v24 = objc_loadWeakRetained((id *)(a1 + 64));
        v25 = [v24 daemon];
        __int16 v26 = [v25 maintenanceWorkCoordinator];
        [v26 enqueueMaintenanceOperation:v22];
      }
      else
      {
        _HKInitializeLogging();
        v27 = HKLogHealthOntology();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);

        if (v28)
        {
          v29 = HKLogHealthOntology();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            uint64_t v30 = [v9 localizedDescription];
            *(_DWORD *)buf = 138543618;
            uint64_t v36 = a1;
            __int16 v37 = 2114;
            id v38 = v30;
            _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_INFO, "%{public}@: unable to take accessibility assertion with error: %{public}@.", buf, 0x16u);
          }
        }
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
        *(unsigned char *)(a1 + 32) = 0;
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      }
    }
  }
}

void __79__HDUserDomainConceptProcessingManager__scheduleProcessingOperationWithReason___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 v7 = a2;
  id v3 = +[HKDaemonTransaction transactionWithOwner:*(void *)(a1 + 32) activityName:@"processing"];
  if ((-[HDUserDomainConceptProcessingManager _processUserDomainConceptsWithReason:accessibilityAssertion:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48)) & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v4 + 8));
      *(unsigned char *)(v4 + 32) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
    }
  }
  v7[2]();
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [v3 invalidate];
}

- (uint64_t)_processUserDomainConceptsWithReason:(void *)a3 accessibilityAssertion:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  if (a1)
  {
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)(a1 + 56));
    if (v7)
    {
      _HKInitializeLogging();
      v31 = HKLogHealthOntology();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v46 = a1;
        _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "%{public}@: User Domain Concept Processing has been disabled for the reamining lifecycle of healthd, since we detected a non-terminating condition while processing in a previous run.", buf, 0xCu);
      }

      id v32 = (HDMutableDatabaseTransactionContext *)_Block_copy(*(const void **)(a1 + 72));
      id v8 = v32;
      if (v32) {
        ((void (*)(HDMutableDatabaseTransactionContext *, uint64_t, void, void))v32->super._cacheScope)(v32, 1, 0, 0);
      }
      uint64_t v15 = 1;
    }
    else
    {
      id v8 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      [(HDMutableDatabaseTransactionContext *)v8 setCacheScope:1];
      if (v6) {
        [(HDMutableDatabaseTransactionContext *)v8 addAccessibilityAssertion:v6];
      }
      _HKInitializeLogging();
      id v9 = HKLogHealthOntology();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v46 = a1;
        __int16 v47 = 2114;
        v48 = v5;
        _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning processing of user domain concepts with reason: %{public}@.", buf, 0x16u);
      }

      uint64_t v41 = 0;
      v42 = &v41;
      uint64_t v43 = 0x2020000000;
      uint64_t v44 = 0;
      uint64_t v37 = 0;
      id v38 = &v37;
      uint64_t v39 = 0x2020000000;
      char v40 = 0;
      double Current = CFAbsoluteTimeGetCurrent();
      id v11 = [(id)a1 profile];
      v12 = [v11 userDomainConceptManager];
      [v12 openObserverTransaction];

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      v14 = [WeakRetained database];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __100__HDUserDomainConceptProcessingManager__processUserDomainConceptsWithReason_accessibilityAssertion___block_invoke;
      v35[3] = &unk_1E62FF020;
      v35[4] = a1;
      v35[5] = &v41;
      v35[6] = &v37;
      id v36 = 0;
      uint64_t v15 = [v14 performWithTransactionContext:v8 error:&v36 block:v35];
      id v16 = v36;

      if (*((unsigned char *)v38 + 24))
      {
        _HKInitializeLogging();
        v17 = HKLogHealthOntology();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v46 = a1;
          _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: While performing UDC procesing, detected an infinite processing loop. Disabling UDC Processing for the remainder of healthd's lifecycle.", buf, 0xCu);
        }

        atomic_store(1u, (unsigned __int8 *)(a1 + 56));
      }
      uint64_t v18 = v42[3];
      uint64_t v19 = *(void *)(a1 + 16);
      if (v18 % v19 <= 0) {
        uint64_t v20 = v18 / v19;
      }
      else {
        uint64_t v20 = v18 / v19 + 1;
      }
      _HKInitializeLogging();
      id v21 = HKLogHealthOntology();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = v6;
        __int16 v22 = v5;
        if (v15) {
          v23 = @"Success";
        }
        else {
          v23 = @"Failure";
        }
        uint64_t v24 = v42[3];
        double v25 = CFAbsoluteTimeGetCurrent();
        __int16 v26 = [v16 localizedDescription];
        *(_DWORD *)buf = 138544898;
        uint64_t v46 = a1;
        __int16 v47 = 2114;
        v48 = v23;
        __int16 v49 = 2048;
        uint64_t v50 = v24;
        __int16 v51 = 2048;
        uint64_t v52 = v20;
        __int16 v53 = 2114;
        uint64_t v5 = v22;
        v54 = v22;
        __int16 v55 = 2048;
        double v56 = v25 - Current;
        __int16 v57 = 2114;
        v58 = v26;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ processing %ld user domain concepts in %ld batches with reason %{public}@, duration: %.3f seconds, Error: %{public}@", buf, 0x48u);

        id v6 = v34;
      }

      v27 = [(id)a1 profile];
      BOOL v28 = [v27 userDomainConceptManager];
      [v28 closeObserverTransaction];

      v29 = _Block_copy(*(const void **)(a1 + 72));
      uint64_t v30 = v29;
      if (v29) {
        (*((void (**)(void *, uint64_t, uint64_t, id))v29 + 2))(v29, v15, v42[3], v16);
      }

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v41, 8);
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

BOOL __100__HDUserDomainConceptProcessingManager__processUserDomainConceptsWithReason_accessibilityAssertion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[4];
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v27 = *(void *)(a1[6] + 8);
  uint64_t v28 = *(void *)(a1[5] + 8);
  id v6 = objc_loadWeakRetained((id *)(v3 + 64));
  uint64_t v31 = self;
  id v32 = v6;
  unsigned __int8 v7 = [v6 userDomainConceptManager];
  uint64_t v30 = [v7 keyValueDomain];

  uint64_t v8 = 0;
  uint64_t v46 = 0;
  __int16 v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = -1;
  while (1)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    uint64_t v44 = 0;
    double Current = CFAbsoluteTimeGetCurrent();
    id v10 = [v32 database];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __169__HDUserDomainConceptProcessingManager__performUserDomainConceptProcessingOperationWithBatchSize_batchLimit_outNumberOfConceptsProcessed_outDidDetectLoop_profile_error___block_invoke;
    v33[3] = &unk_1E62FF048;
    id v36 = &v46;
    id v11 = v30;
    uint64_t v39 = v31;
    id v34 = v11;
    uint64_t v37 = v45;
    id v12 = v32;
    uint64_t v40 = v5;
    id v35 = v12;
    id v38 = &v41;
    BOOL v13 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v10 error:a2 block:v33];

    if (!v13)
    {
      *(void *)(v28 + 24) = v8;

      _Block_object_dispose(&v41, 8);
      goto LABEL_16;
    }
    uint64_t v14 = v42[3];
    _HKInitializeLogging();
    uint64_t v15 = HKLogHealthOntology();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = v8;
      id v16 = v11;
      id v17 = v12;
      BOOL v18 = v13;
      uint64_t v19 = v4;
      uint64_t v20 = a2;
      uint64_t v21 = v47[3];
      uint64_t v22 = v42[3];
      CFAbsoluteTime v23 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 138544386;
      uint64_t v51 = v31;
      __int16 v52 = 2048;
      uint64_t v53 = v21;
      __int16 v54 = 2048;
      uint64_t v55 = v22;
      __int16 v56 = 2048;
      uint64_t v57 = v5;
      __int16 v58 = 2048;
      CFAbsoluteTime v59 = v23 - Current;
      _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished batch %ld of size %ld / %lld. Duration: %.3f seconds", buf, 0x34u);
      a2 = v20;
      uint64_t v4 = v19;
      BOOL v13 = v18;
      id v12 = v17;
      id v11 = v16;
      uint64_t v8 = v29;
    }

    v8 += v14;
    BOOL v24 = v47[3] >= v4 && v14 >= v5;
    if (v24) {
      break;
    }

    _Block_object_dispose(&v41, 8);
    if (v14 < v5) {
      goto LABEL_15;
    }
  }
  _HKInitializeLogging();
  double v25 = HKLogHealthOntology();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v51 = v31;
    _os_log_fault_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_FAULT, "%{public}@: Reached batch limit during UDC Processing. This usually happens during an infinite processing loop.", buf, 0xCu);
  }

  _Block_object_dispose(&v41, 8);
LABEL_15:
  *(unsigned char *)(v27 + 24) = v24;
  *(void *)(v28 + 24) = v8;
LABEL_16:
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v46, 8);

  return v13;
}

uint64_t __169__HDUserDomainConceptProcessingManager__performUserDomainConceptProcessingOperationWithBatchSize_batchLimit_outNumberOfConceptsProcessed_outDidDetectLoop_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v7 = +[HDUserDomainConceptProcessingState fetchFromKeyValueDomain:*(void *)(a1 + 32) error:a3];
  if (v7)
  {
    id v8 = (id)v7;
    _HKInitializeLogging();
    id v9 = HKLogHealthOntology();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 72);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v10;
      __int16 v33 = 2048;
      uint64_t v34 = v11;
      __int16 v35 = 2114;
      id v36 = v8;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Start batch %ld, current state %{public}@", buf, 0x20u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v8 anchor];
    id v12 = [*(id *)(a1 + 40) ontologyDatabase];
    BOOL v13 = [v12 ontologyContentVersionWithError:a3];

    if (!v13)
    {
      uint64_t v17 = 0;
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v14 = +[HDUserDomainConceptProcessingManager _maximumSyncAnchorForUserDomainConceptsWithTransaction:error:](*(void *)(a1 + 72), v6, a3);
    if (!v14) {
      goto LABEL_24;
    }
    uint64_t v15 = [v8 ontologyVersion];
    if (v13 == v15) {
      goto LABEL_13;
    }
    uint64_t v16 = [v8 ontologyVersion];
    if (!v16)
    {
LABEL_16:
      BOOL v18 = v15;
      goto LABEL_17;
    }
    uint64_t v3 = (void *)v16;
    uint64_t v31 = [v8 ontologyVersion];
    if (objc_msgSend(v13, "isEqual:"))
    {
LABEL_13:
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != -1
        && [v8 maximumPropertyType] >= 180000)
      {
        uint64_t v29 = [v14 longLongValue];
        uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        if (v13 == v15)
        {
        }
        else
        {
        }
        if (v29 >= v30)
        {
LABEL_19:
          *(void *)buf = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          if (+[HDUserDomainConceptProcessor processUserDomainConceptsAfter:transactionLimit:outAnchor:outProcessedConceptsCount:profile:transaction:error:](HDUserDomainConceptProcessor, "processUserDomainConceptsAfter:transactionLimit:outAnchor:outProcessedConceptsCount:profile:transaction:error:", a3))
          {
            if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) >= *(void *)(a1 + 80))
            {
              uint64_t v28 = (void *)[v8 copyByUpdatingAnchor:*(void *)buf];

              uint64_t v17 = [v28 persistInKeyValueDomain:*(void *)(a1 + 32) error:a3];
              id v8 = v28;
            }
            else
            {
              uint64_t v20 = [*(id *)(a1 + 40) userDomainConceptManager];
              uint64_t v21 = [v20 processingManager];
              uint64_t v22 = *(void **)(a1 + 32);
              id v8 = v8;
              id v23 = v22;
              if (v21)
              {
                id v24 = v6;
                os_unfair_lock_lock((os_unfair_lock_t)(v21 + 8));
                *(unsigned char *)(v21 + 32) = 0;
                os_unfair_lock_unlock((os_unfair_lock_t)(v21 + 8));
                double v25 = +[HDUserDomainConceptProcessingManager _maximumSyncAnchorForUserDomainConceptsWithTransaction:error:]((uint64_t)HDUserDomainConceptProcessingManager, v24, a3);

                if (v25)
                {
                  __int16 v26 = objc_msgSend(v8, "copyByUpdatingAnchor:", objc_msgSend(v25, "longLongValue"));
                  uint64_t v17 = [v26 persistInKeyValueDomain:v23 error:a3];
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
            }
            goto LABEL_25;
          }
LABEL_24:
          uint64_t v17 = 0;
LABEL_25:

          goto LABEL_26;
        }
LABEL_18:
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        uint64_t v19 = [[HDUserDomainConceptProcessingState alloc] initWithAnchor:0 ontologyVersion:v13 maximumPropertyType:180000];

        id v8 = v19;
        goto LABEL_19;
      }
      BOOL v18 = v13;
      if (v13 == v15)
      {
LABEL_17:

        goto LABEL_18;
      }
    }

    goto LABEL_16;
  }
  uint64_t v17 = 0;
LABEL_27:

  return v17;
}

+ (id)_maximumSyncAnchorForUserDomainConceptsWithTransaction:(void *)a3 error:
{
  id v4 = a2;
  self;
  uint64_t v5 = [v4 protectedDatabase];

  id v9 = 0;
  id v6 = +[HDSQLiteEntity maxValueForProperty:@"sync_anchor" predicate:0 database:v5 error:&v9];
  id v7 = v9;

  if (!v6)
  {
    if (v7)
    {
      id v6 = 0;
      if (a3) {
        *a3 = v7;
      }
    }
    else
    {
      id v6 = &unk_1F17ECAF8;
    }
  }

  return v6;
}

- (void)unitTesting_triggerUserDomainConceptProcessing
{
}

- (void)unitTesting_overrideDefaultBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (void)unitTesting_overrideDefaultBatchLimit:(int64_t)a3
{
  self->_batchLimit = a3;
}

- (void)unitTesting_scheduleUserDomainConceptProcessing
{
}

- (void)setUnitTesting_userDomainConceptProcessingManagerDidFinishProcessing:(id)a3
{
  id v4 = (void *)[a3 copy];
  id unitTesting_userDomainConceptProcessingManagerDidFinishProcessing = self->_unitTesting_userDomainConceptProcessingManagerDidFinishProcessing;
  self->_id unitTesting_userDomainConceptProcessingManagerDidFinishProcessing = v4;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (BOOL)ignoresAutomaticProcessingTriggers
{
  return self->_ignoresAutomaticProcessingTriggers;
}

- (void)setIgnoresAutomaticProcessingTriggers:(BOOL)a3
{
  self->_ignoresAutomaticProcessingTriggers = a3;
}

- (id)unitTesting_userDomainConceptProcessingManagerDidFinishProcessing
{
  return self->_unitTesting_userDomainConceptProcessingManagerDidFinishProcessing;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_userDomainConceptProcessingManagerDidFinishProcessing, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_databaseAssertion, 0);
}

@end