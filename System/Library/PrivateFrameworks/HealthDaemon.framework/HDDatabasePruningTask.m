@interface HDDatabasePruningTask
- (BOOL)pruneDatabaseWithAccessibilityAssertion:(id)a3 nowDate:(id)a4 error:(id *)a5;
- (BOOL)pruneDatabaseWithAccessibilityAssertion:(id)a3 nowDate:(id)a4 prunedObjectLimit:(unint64_t)a5 prunedObjectTransactionLimit:(unint64_t)a6 error:(id *)a7;
- (HDDatabasePruningTask)initWithProfile:(id)a3;
- (void)enqueueMaintenanceOperationOnCoordinator:(id)a3 takeAccessibilityAssertion:(BOOL)a4 nowDate:(id)a5 completion:(id)a6;
@end

@implementation HDDatabasePruningTask

- (HDDatabasePruningTask)initWithProfile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDatabasePruningTask;
  v6 = [(HDDatabasePruningTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_profile, a3);
  }

  return v7;
}

- (void)enqueueMaintenanceOperationOnCoordinator:(id)a3 takeAccessibilityAssertion:(BOOL)a4 nowDate:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v8)
  {
    v13 = NSString;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = [MEMORY[0x1E4F29128] UUID];
    v17 = [v16 UUIDString];
    v18 = [v13 stringWithFormat:@"%@-%@", v15, v17];

    v19 = [(HDProfile *)self->_profile database];
    id v37 = 0;
    v20 = [v19 takeAccessibilityAssertionWithOwnerIdentifier:v18 timeout:&v37 error:300.0];
    id v21 = v37;

    if (!v20)
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v39 = self;
        __int16 v40 = 2114;
        id v41 = v21;
        _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_INFO, "%{public}@: unable to take accessibility assertion: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    v20 = 0;
  }
  v23 = NSString;
  v24 = [(HDProfile *)self->_profile profileIdentifier];
  v25 = [v24 identifier];
  v26 = [v23 stringWithFormat:@"Database Pruning (%@)", v25];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __112__HDDatabasePruningTask_enqueueMaintenanceOperationOnCoordinator_takeAccessibilityAssertion_nowDate_completion___block_invoke;
  v33[3] = &unk_1E630D948;
  v33[4] = self;
  id v34 = v20;
  id v35 = v11;
  id v36 = v12;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __112__HDDatabasePruningTask_enqueueMaintenanceOperationOnCoordinator_takeAccessibilityAssertion_nowDate_completion___block_invoke_2;
  v31[3] = &unk_1E62F48B0;
  id v32 = v34;
  id v27 = v34;
  id v28 = v12;
  id v29 = v11;
  v30 = +[HDMaintenanceOperation maintenanceOperationWithName:v26 asynchronousBlock:v33 canceledBlock:v31];
  [v10 enqueueMaintenanceOperation:v30];
}

void __112__HDDatabasePruningTask_enqueueMaintenanceOperationOnCoordinator_takeAccessibilityAssertion_nowDate_completion___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v8 = 0;
  v6 = a2;
  [v3 pruneDatabaseWithAccessibilityAssertion:v4 nowDate:v5 error:&v8];
  id v7 = v8;
  [(id)a1[5] invalidate];
  (*(void (**)(void))(a1[7] + 16))();

  v6[2](v6);
}

void __112__HDDatabasePruningTask_enqueueMaintenanceOperationOnCoordinator_takeAccessibilityAssertion_nowDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  [v2 invalidate];
  v3[2]();
}

- (BOOL)pruneDatabaseWithAccessibilityAssertion:(id)a3 nowDate:(id)a4 error:(id *)a5
{
  return [(HDDatabasePruningTask *)self pruneDatabaseWithAccessibilityAssertion:a3 nowDate:a4 prunedObjectLimit:20000 prunedObjectTransactionLimit:1000 error:a5];
}

- (BOOL)pruneDatabaseWithAccessibilityAssertion:(id)a3 nowDate:(id)a4 prunedObjectLimit:(unint64_t)a5 prunedObjectTransactionLimit:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = objc_alloc_init(HDMutableDatabaseTransactionContext);
  [(HDMutableDatabaseTransactionContext *)v14 setCacheScope:1];
  if (v12) {
    [(HDMutableDatabaseTransactionContext *)v14 addAccessibilityAssertion:v12];
  }
  v15 = [(HDProfile *)self->_profile database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __126__HDDatabasePruningTask_pruneDatabaseWithAccessibilityAssertion_nowDate_prunedObjectLimit_prunedObjectTransactionLimit_error___block_invoke;
  v19[3] = &unk_1E630D970;
  v19[4] = self;
  id v20 = v13;
  unint64_t v21 = a5;
  unint64_t v22 = a6;
  id v16 = v13;
  char v17 = [v15 performWithTransactionContext:v14 error:a7 block:v19];

  return v17;
}

BOOL __126__HDDatabasePruningTask_pruneDatabaseWithAccessibilityAssertion_nowDate_prunedObjectLimit_prunedObjectTransactionLimit_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  long long v49 = *(_OWORD *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  uint64_t v52 = v2;
  v50 = v3;
  if (v2)
  {
    uint64_t v4 = v3;
    double Current = CFAbsoluteTimeGetCurrent();
    v6 = [v4 dateByAddingTimeInterval:-1209600.0];
    id v7 = objc_alloc_init(HDSyncAnchorMap);
    if (+[HDSyncAnchorEntity getMinimumSyncAnchorsOfType:2 anchorMap:v7 updatedSince:v6 profile:*(void *)(v52 + 8) error:a2])
    {
      id v8 = v7;
    }
    else
    {
      id v8 = 0;
    }
    objc_super v9 = v8;

    v47 = v9;
    if (v9)
    {
      uint64_t v64 = 0;
      v65 = &v64;
      uint64_t v66 = 0x2020000000;
      uint64_t v67 = 0;
      id v10 = [*(id *)(v52 + 8) daemon];
      id v11 = [v10 behavior];
      id v12 = +[HDDatabase allEntityClassesWithBehavior:v11];

      id v13 = [*(id *)(v52 + 8) syncEngine];
      v14 = [v13 allOrderedSyncEntities];
      v15 = [v12 arrayByAddingObjectsFromArray:v14];

      id v16 = [*(id *)(v52 + 8) daemon];
      char v17 = [v16 pluginManager];
      v18 = [v17 pluginsConformingToProtocol:&unk_1F1803B80];
      v19 = [v18 allValues];

      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v21 = v19;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v70 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v54 != v23) {
              objc_enumerationMutation(v21);
            }
            v25 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            v26 = [v25 databaseEntitiesForProtectionClass:1];
            [v20 addObjectsFromArray:v26];

            id v27 = [v25 databaseEntitiesForProtectionClass:2];
            [v20 addObjectsFromArray:v27];
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v70 count:16];
        }
        while (v22);
      }

      id v28 = [v15 arrayByAddingObjectsFromArray:v20];

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      obj = v28;
      uint64_t v29 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v61;
        uint64_t v45 = *(void *)v61;
        while (2)
        {
          uint64_t v31 = 0;
          uint64_t v46 = v29;
          do
          {
            if (*(void *)v61 != v30) {
              objc_enumerationMutation(obj);
            }
            id v32 = *(void **)(*((void *)&v60 + 1) + 8 * v31);
            if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
            {
              if ([v32 conformsToProtocol:&unk_1F1805930])
              {
                v33 = [v32 syncEntityIdentifier];
                id v34 = [(HDSyncAnchorMap *)v47 anchorIfPresentForSyncEntityIdentifier:v33];
              }
              else
              {
                id v34 = 0;
              }
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000;
              LOBYTE(v69) = 0;
              uint64_t v35 = MEMORY[0x1E4F143A8];
              while (1)
              {
                *(void *)&long long v53 = v35;
                *((void *)&v53 + 1) = 3221225472;
                *(void *)&long long v54 = __104__HDDatabasePruningTask__pruneDatabaseWithNowDate_prunedObjectLimit_prunedObjectTransactionLimit_error___block_invoke;
                *((void *)&v54 + 1) = &unk_1E630D998;
                long long v58 = v49;
                *((void *)&v56 + 1) = &v64;
                *(void *)&long long v55 = v52;
                v59 = v32;
                id v36 = v34;
                *((void *)&v55 + 1) = v36;
                *(void *)&long long v56 = v50;
                v57 = buf;
                char v37 = HKWithAutoreleasePool();

                if ((v37 & 1) == 0) {
                  break;
                }
                if (!*(unsigned char *)(*(void *)&buf[8] + 24) || v65[3] >= (unint64_t)v49)
                {
                  _Block_object_dispose(buf, 8);

                  uint64_t v29 = v46;
                  uint64_t v30 = v45;
                  goto LABEL_28;
                }
              }
              _Block_object_dispose(buf, 8);

              BOOL v41 = 0;
              v38 = obj;
              goto LABEL_34;
            }
LABEL_28:
            ++v31;
          }
          while (v31 != v29);
          uint64_t v29 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
          if (v29) {
            continue;
          }
          break;
        }
      }

      _HKInitializeLogging();
      v38 = HKLogInfrastructure();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v39 = v65[3];
        CFAbsoluteTime v40 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v52;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2048;
        double v69 = v40 - Current;
        _os_log_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished pruning %ld objects in %0.2lfs", buf, 0x20u);
      }
      BOOL v41 = 1;
LABEL_34:

      _Block_object_dispose(&v64, 8);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v42 = HKLogInfrastructure();
      BOOL v41 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);

      if (v41)
      {
        v43 = HKLogInfrastructure();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v70 = 138543362;
          uint64_t v71 = v52;
          _os_log_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_INFO, "%{public}@: Failed to determine minimum frozen anchors before pruning", v70, 0xCu);
        }

        BOOL v41 = 0;
      }
    }
  }
  else
  {
    BOOL v41 = 0;
  }

  return v41;
}

BOOL __104__HDDatabasePruningTask__pruneDatabaseWithNowDate_prunedObjectLimit_prunedObjectTransactionLimit_error___block_invoke(void *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v5 = (void *)a1[6];
  uint64_t v6 = a1[9];
  if ((unint64_t)(v6 - *(void *)(*(void *)(a1[7] + 8) + 24)) >= a1[10]) {
    uint64_t v7 = a1[10];
  }
  else {
    uint64_t v7 = v6 - *(void *)(*(void *)(a1[7] + 8) + 24);
  }
  id v8 = (void *)a1[11];
  uint64_t v10 = a1[4];
  objc_super v9 = (void *)a1[5];
  id v27 = 0;
  id v11 = v9;
  id v12 = v5;
  if (v10)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [v8 pruneSyncedObjectsThroughAnchor:v11 limit:v7 nowDate:v12 profile:*(void *)(v10 + 8) error:&v27];
LABEL_9:
      v14 = (void *)v13;
      goto LABEL_11;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [v8 pruneWithProfile:*(void *)(v10 + 8) nowDate:v12 limit:v7 error:&v27];
      goto LABEL_9;
    }
  }
  v14 = 0;
LABEL_11:

  id v15 = v27;
  _HKInitializeLogging();
  id v16 = HKLogInfrastructure();
  char v17 = v16;
  if (v14)
  {
    BOOL v18 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

    if (v18)
    {
      v19 = HKLogInfrastructure();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = a1[4];
        uint64_t v21 = a1[11];
        CFAbsoluteTime v22 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)buf = 138544130;
        uint64_t v29 = v20;
        __int16 v30 = 2114;
        uint64_t v31 = v21;
        __int16 v32 = 2114;
        id v33 = v14;
        __int16 v34 = 2048;
        double v35 = v22 - Current;
        _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ pruned %{public}@ objects in %0.2lfs", buf, 0x2Au);
      }
    }
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = [v14 integerValue] == v7;
    if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24)) {
      usleep(0x2710u);
    }
    if ([v14 integerValue] >= 1) {
      *(void *)(*(void *)(a1[7] + 8) + 24) += [v14 integerValue];
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = a1[4];
      uint64_t v26 = a1[11];
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v25;
      __int16 v30 = 2114;
      uint64_t v31 = v26;
      __int16 v32 = 2114;
      id v33 = v15;
      _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Pruning failed for %{public}@: %{public}@", buf, 0x20u);
    }

    id v23 = v15;
    if (v23)
    {
      if (a2) {
        *a2 = v23;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v14 != 0;
}

- (void).cxx_destruct
{
}

@end