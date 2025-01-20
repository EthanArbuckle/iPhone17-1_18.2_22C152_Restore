@interface HDWorkoutClusterManager
- (BOOL)createWorkoutCluster:(id)a3 error:(id *)a4;
- (BOOL)deleteWorkoutClusterWithUUID:(id)a3 error:(id *)a4;
- (BOOL)enumerateRouteLocationsForWorkoutUUID:(id)a3 startDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6 handler:(id)a7;
- (BOOL)performUsingAccessibilityAssertionWithError:(id *)a3 block:(id)a4;
- (BOOL)updateWorkoutClusterWithUUID:(id)a3 newRelevance:(id)a4 newLastWorkoutUUID:(id)a5 newBestWorkoutUUID:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 error:(id *)a9;
- (BOOL)updateWorkoutClusterWithUUID:(id)a3 newRouteLabel:(id)a4 error:(id *)a5;
- (BOOL)updateWorkoutClusterWithUUID:(id)a3 newRouteSnapshot:(id)a4 error:(id *)a5;
- (HDMutableDatabaseTransactionContext)_transactionContextWithAccessibilityAssertion;
- (HDProfile)profile;
- (HDWorkoutClusterManager)initWithProfile:(id)a3;
- (id)accessibilityAssertion;
- (id)allWorkoutClustersWithError:(id *)a3;
- (id)allWorkoutUUIDsForClusterUUID:(id)a3 error:(id *)a4;
- (id)workoutClusterContainingWorkoutUUID:(id)a3 error:(id *)a4;
- (id)workoutClustersContainingWorkoutUUIDs:(id)a3 error:(id *)a4;
- (id)workoutCountWithFilter:(id)a3 error:(id *)a4;
- (id)workoutRouteSnapshotForClusterUUID:(id)a3 error:(id *)a4;
- (id)workoutsWithFilter:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 newAnchor:(id *)a6 error:(id *)a7;
- (id)workoutsWithFilter:(id)a3 limit:(unint64_t)a4 sortDescriptors:(id)a5 error:(id *)a6;
- (void)dealloc;
- (void)setProfile:(id)a3;
- (void)takeAccessibilityAssertionIfNeeded;
@end

@implementation HDWorkoutClusterManager

- (HDWorkoutClusterManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDWorkoutClusterManager;
  v5 = [(HDWorkoutClusterManager *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)dealloc
{
  [(HDAssertion *)self->_accessibilityAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDWorkoutClusterManager;
  [(HDWorkoutClusterManager *)&v3 dealloc];
}

- (void)takeAccessibilityAssertionIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_accessibilityAssertion)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v5 = [WeakRetained database];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v18 = 0;
    objc_super v8 = [v5 takeAccessibilityAssertionWithOwnerIdentifier:v7 timeout:&v18 error:600.0];
    id v9 = v18;
    accessibilityAssertion = self->_accessibilityAssertion;
    self->_accessibilityAssertion = v8;

    if (!self->_accessibilityAssertion)
    {
      int v11 = objc_msgSend(v9, "hk_isDatabaseAccessibilityError");
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x1E4F29FB8];
      v13 = *MEMORY[0x1E4F29FB8];
      if (v11)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = v12;
          v15 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v20 = v15;
          __int16 v21 = 2114;
          id v22 = v9;
          id v16 = v15;
          _os_log_debug_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to acquire accessibility assertion with error=%{public}@", buf, 0x16u);
LABEL_12:
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = v12;
        v17 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v20 = v17;
        __int16 v21 = 2114;
        id v22 = v9;
        id v16 = v17;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to acquire accessibility assertion with error=%{public}@", buf, 0x16u);
        goto LABEL_12;
      }
    }
    os_unfair_lock_unlock(p_lock);

    return;
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)accessibilityAssertion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_accessibilityAssertion;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)performUsingAccessibilityAssertionWithError:(id *)a3 block:(id)a4
{
  p_profile = &self->_profile;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v9 = [WeakRetained database];
  v10 = -[HDWorkoutClusterManager _transactionContextWithAccessibilityAssertion](self);
  LOBYTE(a3) = [v9 performWithTransactionContext:v10 error:a3 block:v7];

  return (char)a3;
}

- (HDMutableDatabaseTransactionContext)_transactionContextWithAccessibilityAssertion
{
  if (a1)
  {
    v2 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    objc_super v3 = [a1 accessibilityAssertion];
    if (v3) {
      [(HDMutableDatabaseTransactionContext *)v2 addAccessibilityAssertion:v3];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)workoutCountWithFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__133;
  id v22 = __Block_byref_object_dispose__133;
  id v23 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_super v8 = [WeakRetained database];
  id v9 = -[HDWorkoutClusterManager _transactionContextWithAccessibilityAssertion](self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__HDWorkoutClusterManager_workoutCountWithFilter_error___block_invoke;
  v14[3] = &unk_1E62F3DD8;
  v17 = &v18;
  id v10 = v6;
  id v15 = v10;
  id v16 = self;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 context:v9 error:a4 block:v14];

  if (a4) {
    int v11 = (void *)v19[5];
  }
  else {
    int v11 = 0;
  }
  id v12 = v11;

  _Block_object_dispose(&v18, 8);

  return v12;
}

BOOL __56__HDWorkoutClusterManager_workoutCountWithFilter_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];

  uint64_t v7 = *MEMORY[0x1E4F65C78];
  objc_super v8 = (void *)a1[4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 24));
  id v10 = [v8 predicateWithProfile:WeakRetained];
  uint64_t v11 = +[HDSQLiteEntity countValueForProperty:v7 predicate:v10 database:v6 error:a3];
  uint64_t v12 = *(void *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  BOOL v14 = *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
  return v14;
}

- (id)workoutsWithFilter:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 newAnchor:(id *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a5];
  BOOL v14 = [MEMORY[0x1E4F2B448] workoutType];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v16 = +[HDSampleEntity entityEnumeratorWithType:v14 profile:WeakRetained];

  id v17 = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v18 = [v11 predicateWithProfile:v17];
  [v16 setPredicate:v18];

  if (v12)
  {
    v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "_rowid"));
    [v16 setAnchor:v19];
  }
  [v16 setLimitCount:a5];
  uint64_t v20 = -[HDWorkoutClusterManager _transactionContextWithAccessibilityAssertion](self);
  [v16 setDatabaseTransactionContext:v20];

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v31 = [v12 _rowid];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__HDWorkoutClusterManager_workoutsWithFilter_anchor_limit_newAnchor_error___block_invoke;
  v25[3] = &unk_1E62F2FB8;
  id v21 = v13;
  id v26 = v21;
  v27 = &v28;
  if ([v16 enumerateWithError:a7 handler:v25])
  {
    if (a6)
    {
      *a6 = [MEMORY[0x1E4F2B3C8] _anchorWithRowid:v29[3]];
    }
    id v22 = (void *)[v21 copy];
  }
  else
  {
    id v22 = 0;
  }

  _Block_object_dispose(&v28, 8);

  return v22;
}

uint64_t __75__HDWorkoutClusterManager_workoutsWithFilter_anchor_limit_newAnchor_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  return 1;
}

- (id)workoutsWithFilter:(id)a3 limit:(unint64_t)a4 sortDescriptors:(id)a5 error:(id *)a6
{
  id v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a5;
  id v12 = a3;
  v13 = (void *)[[v10 alloc] initWithCapacity:a4];
  BOOL v14 = [MEMORY[0x1E4F2B448] workoutType];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v16 = +[HDSampleEntity entityEnumeratorWithType:v14 profile:WeakRetained];

  id v17 = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v18 = [v12 predicateWithProfile:v17];

  [v16 setPredicate:v18];
  [v16 setLimitCount:a4];
  [v16 setSortDescriptors:v11];

  v19 = -[HDWorkoutClusterManager _transactionContextWithAccessibilityAssertion](self);
  [v16 setDatabaseTransactionContext:v19];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __74__HDWorkoutClusterManager_workoutsWithFilter_limit_sortDescriptors_error___block_invoke;
  v23[3] = &unk_1E6300148;
  id v20 = v13;
  id v24 = v20;
  if ([v16 enumerateWithError:a6 handler:v23]) {
    id v21 = (void *)[v20 copy];
  }
  else {
    id v21 = 0;
  }

  return v21;
}

uint64_t __74__HDWorkoutClusterManager_workoutsWithFilter_limit_sortDescriptors_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (BOOL)enumerateRouteLocationsForWorkoutUUID:(id)a3 startDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v16 = [WeakRetained database];
  id v17 = -[HDWorkoutClusterManager _transactionContextWithAccessibilityAssertion](self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __95__HDWorkoutClusterManager_enumerateRouteLocationsForWorkoutUUID_startDate_limit_error_handler___block_invoke;
  v22[3] = &unk_1E6305208;
  id v23 = v12;
  id v24 = self;
  id v25 = v13;
  id v26 = v14;
  unint64_t v27 = a5;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  LOBYTE(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v16 context:v17 error:a6 block:v22];

  return (char)a6;
}

uint64_t __95__HDWorkoutClusterManager_enumerateRouteLocationsForWorkoutUUID_startDate_limit_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v36 = a2;
  v34 = +[HDWorkoutClusterEntity workoutEntityForUUID:transaction:error:](HDWorkoutClusterEntity, "workoutEntityForUUID:transaction:error:", *(void *)(a1 + 32));
  if (v34)
  {
    v33 = [v36 databaseForEntityClass:objc_opt_class()];
    if (!*(void *)(a1 + 40)) {
      goto LABEL_19;
    }
    id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v5 = v33;
    id v6 = v34;
    id v7 = objc_alloc_init(v4);
    id v8 = objc_alloc_init(MEMORY[0x1E4F65D68]);
    id v9 = [MEMORY[0x1E4F2B498] workoutRouteType];
    id v10 = HDSampleEntityPredicateForDataType(v9);

    uint64_t v11 = [v6 persistentID];
    id v12 = HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObject(v11);
    id v13 = (void *)MEMORY[0x1E4F65D08];
    v54[0] = v10;
    v54[1] = v12;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    id v15 = [v13 predicateMatchingAllPredicates:v14];
    [v8 setPredicate:v15];

    [v8 setEntityClass:objc_opt_class()];
    id v16 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"start_date" entityClass:objc_opt_class() ascending:1];
    v53 = v16;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    [v8 setOrderingTerms:v17];

    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F65D60]) initWithDatabase:v5 descriptor:v8];
    v52 = @"hfd_key";
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
    uint64_t v46 = MEMORY[0x1E4F143A8];
    uint64_t v47 = 3221225472;
    uint64_t v48 = (uint64_t)__76__HDWorkoutClusterManager__routeSeriesIdentifiersForWorkout_database_error___block_invoke;
    v49 = &unk_1E62FE2E0;
    id v50 = v7;
    id v20 = v7;
    LODWORD(v7) = [v18 enumerateProperties:v19 error:a3 enumerationHandler:&v46];

    id v21 = v7 ? v20 : 0;
    id v22 = v21;

    if (v22)
    {
      uint64_t v46 = 0;
      uint64_t v47 = (uint64_t)&v46;
      uint64_t v48 = 0x2020000000;
      v49 = 0;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v43;
        while (2)
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v43 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            uint64_t v28 = *(void **)(a1 + 48);
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __95__HDWorkoutClusterManager_enumerateRouteLocationsForWorkoutUUID_startDate_limit_error_handler___block_invoke_2;
            v37[3] = &unk_1E63051E0;
            id v29 = v28;
            id v38 = v29;
            id v39 = *(id *)(a1 + 56);
            v40 = &v46;
            uint64_t v41 = *(void *)(a1 + 64);
            if (!+[HDLocationSeriesSampleEntity enumerateLocationDataWithTransaction:v36 HFDKey:v27 startDate:v29 error:a3 handler:v37])
            {

              uint64_t v31 = 0;
              goto LABEL_21;
            }
            BOOL v30 = *(void *)(v47 + 24) < *(void *)(a1 + 64);

            if (!v30) {
              goto LABEL_18;
            }
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v51 count:16];
          uint64_t v31 = 1;
          if (v24) {
            continue;
          }
          break;
        }
      }
      else
      {
LABEL_18:
        uint64_t v31 = 1;
      }
LABEL_21:

      _Block_object_dispose(&v46, 8);
    }
    else
    {
LABEL_19:
      id v23 = 0;
      uint64_t v31 = 0;
    }
  }
  else
  {
    uint64_t v31 = 0;
  }

  return v31;
}

BOOL __95__HDWorkoutClusterManager_enumerateRouteLocationsForWorkoutUUID_startDate_limit_error_handler___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1[4]
    && ([v3 timestamp],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_msgSend(v5, "hk_isBeforeOrEqualToDate:", a1[4]),
        v5,
        (v6 & 1) != 0))
  {
    BOOL v7 = 1;
  }
  else if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    BOOL v7 = ++*(void *)(*(void *)(a1[6] + 8) + 24) < a1[7];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __76__HDWorkoutClusterManager__routeSeriesIdentifiersForWorkout_database_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [NSNumber numberWithLongLong:HDSQLiteColumnAsInt64()];
  [v1 addObject:v2];

  return 1;
}

- (BOOL)createWorkoutCluster:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HDWorkoutClusterManager_createWorkoutCluster_error___block_invoke;
  v9[3] = &unk_1E63007F8;
  id v10 = v6;
  uint64_t v11 = self;
  id v7 = v6;
  LOBYTE(a4) = [(HDWorkoutClusterManager *)self performUsingAccessibilityAssertionWithError:a4 block:v9];

  return (char)a4;
}

BOOL __54__HDWorkoutClusterManager_createWorkoutCluster_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  id v5 = +[HDWorkoutClusterEntity insertWorkoutCluster:v3 profile:WeakRetained error:a2];

  return v5 != 0;
}

- (id)allWorkoutClustersWithError:(id *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__133;
  uint64_t v11 = __Block_byref_object_dispose__133;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__HDWorkoutClusterManager_allWorkoutClustersWithError___block_invoke;
  v6[3] = &unk_1E62FA2C0;
  v6[4] = self;
  v6[5] = &v7;
  if ([(HDWorkoutClusterManager *)self performUsingAccessibilityAssertionWithError:a3 block:v6])
  {
    uint64_t v3 = (void *)v8[5];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

BOOL __55__HDWorkoutClusterManager_allWorkoutClustersWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v5 = +[HDWorkoutClusterEntity workoutClustersForProfile:WeakRetained limit:*MEMORY[0x1E4F65DE0] error:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (id)workoutClusterContainingWorkoutUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__133;
  id v19 = __Block_byref_object_dispose__133;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__HDWorkoutClusterManager_workoutClusterContainingWorkoutUUID_error___block_invoke;
  v11[3] = &unk_1E62FA2E8;
  id v14 = &v15;
  id v7 = v6;
  id v12 = v7;
  id v13 = self;
  if ([(HDWorkoutClusterManager *)self performUsingAccessibilityAssertionWithError:a4 block:v11])
  {
    id v8 = (void *)v16[5];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  _Block_object_dispose(&v15, 8);

  return v9;
}

BOOL __69__HDWorkoutClusterManager_workoutClusterContainingWorkoutUUID_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 24));
  uint64_t v6 = +[HDWorkoutClusterEntity workoutClusterContainingWorkoutUUID:v4 profile:WeakRetained error:a2];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

- (id)workoutClustersContainingWorkoutUUIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__133;
  id v19 = __Block_byref_object_dispose__133;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__HDWorkoutClusterManager_workoutClustersContainingWorkoutUUIDs_error___block_invoke;
  v11[3] = &unk_1E62FA2E8;
  id v14 = &v15;
  id v7 = v6;
  id v12 = v7;
  id v13 = self;
  if ([(HDWorkoutClusterManager *)self performUsingAccessibilityAssertionWithError:a4 block:v11])
  {
    id v8 = (void *)v16[5];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  _Block_object_dispose(&v15, 8);

  return v9;
}

BOOL __71__HDWorkoutClusterManager_workoutClustersContainingWorkoutUUIDs_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 24));
  uint64_t v6 = +[HDWorkoutClusterEntity clusterUUIDsForWorkoutUUIDs:v4 profile:WeakRetained error:a2];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

- (id)allWorkoutUUIDsForClusterUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__133;
  id v19 = __Block_byref_object_dispose__133;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__HDWorkoutClusterManager_allWorkoutUUIDsForClusterUUID_error___block_invoke;
  v11[3] = &unk_1E62FA2E8;
  id v14 = &v15;
  id v7 = v6;
  id v12 = v7;
  id v13 = self;
  if ([(HDWorkoutClusterManager *)self performUsingAccessibilityAssertionWithError:a4 block:v11])
  {
    id v8 = (void *)v16[5];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  _Block_object_dispose(&v15, 8);

  return v9;
}

BOOL __63__HDWorkoutClusterManager_allWorkoutUUIDsForClusterUUID_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 24));
  uint64_t v6 = +[HDWorkoutClusterEntity workoutUUIDsForClusterUUID:v4 profile:WeakRetained error:a2];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

- (id)workoutRouteSnapshotForClusterUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__133;
  id v21 = __Block_byref_object_dispose__133;
  id v22 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained database];
  id v9 = -[HDWorkoutClusterManager _transactionContextWithAccessibilityAssertion](self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__HDWorkoutClusterManager_workoutRouteSnapshotForClusterUUID_error___block_invoke;
  v14[3] = &unk_1E62F3DB0;
  id v10 = v6;
  id v15 = v10;
  id v16 = &v17;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 context:v9 error:a4 block:v14];

  if (a4) {
    uint64_t v11 = (void *)v18[5];
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  _Block_object_dispose(&v17, 8);

  return v12;
}

BOOL __68__HDWorkoutClusterManager_workoutRouteSnapshotForClusterUUID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[HDWorkoutClusterEntity entityForClusterUUID:*(void *)(a1 + 32) transaction:v5 error:a3];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 workoutRouteSnapshotWithTransaction:v5 error:a3];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    BOOL v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)updateWorkoutClusterWithUUID:(id)a3 newRouteSnapshot:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__HDWorkoutClusterManager_updateWorkoutClusterWithUUID_newRouteSnapshot_error___block_invoke;
  v13[3] = &unk_1E62F9F48;
  id v14 = v8;
  id v15 = v9;
  id v16 = self;
  id v10 = v9;
  id v11 = v8;
  LOBYTE(a5) = [(HDWorkoutClusterManager *)self performUsingAccessibilityAssertionWithError:a5 block:v13];

  return (char)a5;
}

BOOL __79__HDWorkoutClusterManager_updateWorkoutClusterWithUUID_newRouteSnapshot_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 24));
  BOOL v6 = +[HDWorkoutClusterEntity updateWorkoutClusterWithUUID:v3 routeSnapshot:v4 profile:WeakRetained error:a2];

  return v6;
}

- (BOOL)updateWorkoutClusterWithUUID:(id)a3 newRouteLabel:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__HDWorkoutClusterManager_updateWorkoutClusterWithUUID_newRouteLabel_error___block_invoke;
  v13[3] = &unk_1E62F9F48;
  id v14 = v8;
  id v15 = v9;
  id v16 = self;
  id v10 = v9;
  id v11 = v8;
  LOBYTE(a5) = [(HDWorkoutClusterManager *)self performUsingAccessibilityAssertionWithError:a5 block:v13];

  return (char)a5;
}

BOOL __76__HDWorkoutClusterManager_updateWorkoutClusterWithUUID_newRouteLabel_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 24));
  BOOL v6 = +[HDWorkoutClusterEntity updateWorkoutClusterWithUUID:v3 routeLabel:v4 profile:WeakRetained error:a2];

  return v6;
}

- (BOOL)updateWorkoutClusterWithUUID:(id)a3 newRelevance:(id)a4 newLastWorkoutUUID:(id)a5 newBestWorkoutUUID:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __164__HDWorkoutClusterManager_updateWorkoutClusterWithUUID_newRelevance_newLastWorkoutUUID_newBestWorkoutUUID_newWorkoutAssociations_workoutAssociationsToRemove_error___block_invoke;
  v28[3] = &unk_1E6305230;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v34 = v20;
  v35 = self;
  id v21 = v20;
  id v22 = v19;
  id v23 = v18;
  id v24 = v17;
  id v25 = v16;
  id v26 = v15;
  LOBYTE(self) = [(HDWorkoutClusterManager *)self performUsingAccessibilityAssertionWithError:a9 block:v28];

  return (char)self;
}

BOOL __164__HDWorkoutClusterManager_updateWorkoutClusterWithUUID_newRelevance_newLastWorkoutUUID_newBestWorkoutUUID_newWorkoutAssociations_workoutAssociationsToRemove_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  uint64_t v7 = a1[8];
  uint64_t v8 = a1[9];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[10] + 24));
  BOOL v10 = +[HDWorkoutClusterEntity updateWorkoutClusterWithUUID:v3 relevanceValue:v4 lastWorkoutUUID:v5 bestWorkoutUUID:v6 workoutUUIDsToAssociate:v7 workoutUUIDsToRemove:v8 profile:WeakRetained error:a2];

  return v10;
}

- (BOOL)deleteWorkoutClusterWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__HDWorkoutClusterManager_deleteWorkoutClusterWithUUID_error___block_invoke;
  v9[3] = &unk_1E63007F8;
  id v10 = v6;
  id v11 = self;
  id v7 = v6;
  LOBYTE(a4) = [(HDWorkoutClusterManager *)self performUsingAccessibilityAssertionWithError:a4 block:v9];

  return (char)a4;
}

BOOL __62__HDWorkoutClusterManager_deleteWorkoutClusterWithUUID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  BOOL v5 = +[HDWorkoutClusterEntity deleteWorkoutClusterWithUUID:v3 profile:WeakRetained error:a2];

  return v5;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
}

@end