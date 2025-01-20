@interface HDWorkoutEffortRelationshipQueryServer
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDWorkoutEffortRelationshipQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (_HKWorkoutEffortRelationshipQueryServerConfiguration)ratingOfExertionAssociationQueryServerConfiguration;
- (id)_fetchSamplesForWorkoutPID:(int64_t)a3 activity:(id)a4 options:(int64_t)a5 limit:(unint64_t)a6 sortDescending:(BOOL)a7 error:(id *)a8;
- (id)_filteredRelationships:(id)a3 anchor:(id)a4;
- (id)_relationshipForWorkout:(id)a3 activity:(id)a4 samples:(id)a5;
- (int64_t)_batchObjectsWithError:(id *)a3 batchHandler:(id)a4;
- (int64_t)anchor;
- (void)_handleBatchedQueryResult:(int64_t)a3 error:(id)a4;
- (void)_queue_fetchAssociatedEffortSamplesWithHandler:(id)a3;
- (void)_queue_start;
- (void)_queue_stop;
- (void)associationsUpdatedForObject:(id)a3 subObject:(id)a4 type:(unint64_t)a5 objects:(id)a6 anchor:(id)a7;
- (void)setAnchor:(int64_t)a3;
@end

@implementation HDWorkoutEffortRelationshipQueryServer

- (HDWorkoutEffortRelationshipQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDWorkoutEffortRelationshipQueryServer;
  v11 = [(HDQueryServer *)&v16 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    ratingOfExertionAssociationQueryServerConfiguration = v11->_ratingOfExertionAssociationQueryServerConfiguration;
    v11->_ratingOfExertionAssociationQueryServerConfiguration = (_HKWorkoutEffortRelationshipQueryServerConfiguration *)v12;

    v14 = [(_HKWorkoutEffortRelationshipQueryServerConfiguration *)v11->_ratingOfExertionAssociationQueryServerConfiguration anchor];
    v11->_anchor = [v14 _rowid];
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)_queue_start
{
  v36.receiver = self;
  v36.super_class = (Class)HDWorkoutEffortRelationshipQueryServer;
  [(HDQueryServer *)&v36 _queue_start];
  v3 = [(HDQueryServer *)self profile];
  v4 = [v3 associationManager];
  uint64_t v5 = *MEMORY[0x1E4F2A800];
  v6 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A800]];
  [v4 addObserver:self forDataType:v6];

  v7 = [(HDQueryServer *)self profile];
  v8 = [v7 associationManager];
  uint64_t v9 = *MEMORY[0x1E4F2A950];
  id v10 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A950]];
  [v8 addObserver:self forDataType:v10];

  v11 = [(HDQueryServer *)self queryUUID];
  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  v13 = [MEMORY[0x1E4F2B2C0] workoutType];
  v14 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:v5];
  v15 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:v9];
  objc_super v16 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, 0);

  v17 = [(HDQueryServer *)self client];
  v18 = [v17 authorizationOracle];
  id v35 = 0;
  v19 = [v18 readAuthorizationStatusesForTypes:v16 error:&v35];
  id v20 = v35;

  if (v20)
  {
    v21 = [(HDWorkoutEffortRelationshipQueryServer *)self queryClient];
    objc_msgSend(v21, "client_deliverError:forQuery:", v20, v11);
  }
  else
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __54__HDWorkoutEffortRelationshipQueryServer__queue_start__block_invoke;
    v26[3] = &unk_1E630B668;
    v26[4] = &v31;
    v26[5] = &v27;
    [v19 enumerateKeysAndObjectsUsingBlock:v26];
    if (*((unsigned char *)v32 + 24) && *((unsigned char *)v28 + 24))
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __54__HDWorkoutEffortRelationshipQueryServer__queue_start__block_invoke_2;
      v24[3] = &unk_1E630B690;
      v24[4] = self;
      id v25 = v11;
      [(HDWorkoutEffortRelationshipQueryServer *)self _queue_fetchAssociatedEffortSamplesWithHandler:v24];
    }
    else
    {
      v22 = [(HDWorkoutEffortRelationshipQueryServer *)self queryClient];
      v23 = [(_HKWorkoutEffortRelationshipQueryServerConfiguration *)self->_ratingOfExertionAssociationQueryServerConfiguration anchor];
      objc_msgSend(v22, "client_deliverWorkoutEffortRelationships:isFinalBatch:anchor:forQuery:", MEMORY[0x1E4F1CBF0], 1, v23, v11);
    }
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
  }
}

void __54__HDWorkoutEffortRelationshipQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F2B2C0] workoutType];
  if (v6 == v9)
  {
    int v7 = [v5 canRead];

    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      goto LABEL_7;
    }
  }
  else
  {
  }
  if (![v5 canRead]) {
    goto LABEL_8;
  }
  uint64_t v8 = *(void *)(a1 + 40);
LABEL_7:
  *(unsigned char *)(*(void *)(v8 + 8) + 24) = 1;
LABEL_8:
}

void __54__HDWorkoutEffortRelationshipQueryServer__queue_start__block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (v11)
  {
    _HKInitializeLogging();
    uint64_t v12 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      int v20 = 138543618;
      uint64_t v21 = v19;
      __int16 v22 = 2114;
      id v23 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch associated effort samples: %{public}@", (uint8_t *)&v20, 0x16u);
    }
    v13 = [*(id *)(a1 + 32) queryClient];
    objc_msgSend(v13, "client_deliverError:forQuery:", v11, *(void *)(a1 + 40));
  }
  else
  {
    v14 = *(void **)(a1 + 32);
    if (v9)
    {
      v15 = [v14 _filteredRelationships:v9 anchor:v10];
      _HKInitializeLogging();
      objc_super v16 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int v20 = 138543619;
        uint64_t v21 = v17;
        __int16 v22 = 2113;
        id v23 = v15;
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Delivering relationships to client: %{private}@", (uint8_t *)&v20, 0x16u);
      }
      v18 = [*(id *)(a1 + 32) queryClient];
      objc_msgSend(v18, "client_deliverWorkoutEffortRelationships:isFinalBatch:anchor:forQuery:", v15, a4, v10, *(void *)(a1 + 40));
    }
    else
    {
      v15 = [v14 queryClient];
      objc_msgSend(v15, "client_deliverWorkoutEffortRelationships:isFinalBatch:anchor:forQuery:", MEMORY[0x1E4F1CBF0], a4, v10, *(void *)(a1 + 40));
    }
  }
}

- (id)_filteredRelationships:(id)a3 anchor:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v26 = a4;
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v27 = *(void *)v31;
    *(void *)&long long v8 = 138543618;
    long long v24 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "samples", v24);

        if (v12)
        {
          v13 = [(HDQueryServer *)self client];
          v14 = [v13 authorizationOracle];
          v15 = [v11 samples];
          objc_super v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v26, "_rowid"));
          id v29 = 0;
          uint64_t v17 = [v14 filteredObjectsForReadAuthorization:v15 anchor:v16 error:&v29];
          id v18 = v29;

          if (!v17)
          {
            _HKInitializeLogging();
            uint64_t v19 = *MEMORY[0x1E4F29F90];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v24;
              id v35 = self;
              __int16 v36 = 2112;
              id v37 = v18;
              _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed for workout samples with error: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          uint64_t v17 = 0;
        }
        int v20 = [v11 workout];
        uint64_t v21 = [v11 activity];
        __int16 v22 = [(HDWorkoutEffortRelationshipQueryServer *)self _relationshipForWorkout:v20 activity:v21 samples:v17];

        [v28 addObject:v22];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v9);
  }

  return v28;
}

- (void)_queue_stop
{
  v9.receiver = self;
  v9.super_class = (Class)HDWorkoutEffortRelationshipQueryServer;
  [(HDQueryServer *)&v9 _queue_stop];
  v3 = [(HDQueryServer *)self profile];
  v4 = [v3 associationManager];
  id v5 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A800]];
  [v4 removeObserver:self forDataType:v5];

  id v6 = [(HDQueryServer *)self profile];
  uint64_t v7 = [v6 associationManager];
  long long v8 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A950]];
  [v7 removeObserver:self forDataType:v8];
}

- (void)_queue_fetchAssociatedEffortSamplesWithHandler:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, id, uint64_t, id))a3;
  id v5 = [(_HKWorkoutEffortRelationshipQueryServerConfiguration *)self->_ratingOfExertionAssociationQueryServerConfiguration anchor];
  id v6 = [(HDQueryServer *)self profile];
  uint64_t v7 = [v6 database];
  id v33 = 0;
  long long v8 = +[HDHealthEntity maxRowIDForPredicate:0 healthDatabase:v7 error:&v33];
  id v9 = v33;

  if (v8)
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F2B3C8], "_anchorWithRowid:", objc_msgSend(v8, "longLongValue"));
    *(void *)v38 = 0;
    *(void *)&v38[8] = v38;
    *(void *)&v38[16] = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy__182;
    v40 = __Block_byref_object_dispose__182;
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v29 = 0;
    long long v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    BOOL v11 = [(_HKWorkoutEffortRelationshipQueryServerConfiguration *)self->_ratingOfExertionAssociationQueryServerConfiguration options] == 1;
    id v28 = 0;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    int v20 = __89__HDWorkoutEffortRelationshipQueryServer__queue_fetchAssociatedEffortSamplesWithHandler___block_invoke;
    uint64_t v21 = &unk_1E630B6E0;
    long long v24 = &v29;
    __int16 v22 = self;
    id v12 = v5;
    BOOL v27 = v11;
    id v23 = v12;
    id v25 = v38;
    BOOL v26 = v11;
    int64_t v13 = [(HDWorkoutEffortRelationshipQueryServer *)self _batchObjectsWithError:&v28 batchHandler:&v18];
    id v14 = v28;
    -[HDWorkoutEffortRelationshipQueryServer _handleBatchedQueryResult:error:](self, "_handleBatchedQueryResult:error:", v13, v14, v18, v19, v20, v21, v22);
    if (v14)
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v35 = self;
        __int16 v36 = 2114;
        id v37 = v14;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch relationships for associations: %{public}@", buf, 0x16u);
      }
      v4[2](v4, 0, v12, 1, v14);
    }
    else
    {
      if (![*(id *)(*(void *)&v38[8] + 40) count])
      {
        _HKInitializeLogging();
        uint64_t v17 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v35 = self;
          _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: No sample relationships found", buf, 0xCu);
        }
      }
      v4[2](v4, *(void *)(*(void *)&v38[8] + 40), v10, *((unsigned __int8 *)v30 + 24), 0);
      self->_anchor = [v8 longLongValue];
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(v38, 8);
  }
  else
  {
    _HKInitializeLogging();
    objc_super v16 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v38 = 138543618;
      *(void *)&v38[4] = self;
      *(_WORD *)&v38[12] = 2114;
      *(void *)&v38[14] = v9;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch max rowID for associations table: %{public}@", v38, 0x16u);
    }
    v4[2](v4, 0, v5, 1, v9);
  }
}

void __89__HDWorkoutEffortRelationshipQueryServer__queue_fetchAssociatedEffortSamplesWithHandler___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  id v6 = [*(id *)(a1 + 32) profile];
  uint64_t v7 = [v6 database];
  id v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__HDWorkoutEffortRelationshipQueryServer__queue_fetchAssociatedEffortSamplesWithHandler___block_invoke_2;
  v14[3] = &unk_1E630B6B8;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v15 = v5;
  uint64_t v16 = v8;
  id v10 = v9;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v19 = v11;
  char v20 = *(unsigned char *)(a1 + 72);
  id v17 = v10;
  id v12 = v5;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:v7 error:&v21 block:v14];
  id v13 = v21;
}

uint64_t __89__HDWorkoutEffortRelationshipQueryServer__queue_fetchAssociatedEffortSamplesWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v55 = [obj countByEnumeratingWithState:&v62 objects:v73 count:16];
  if (v55)
  {
    uint64_t v7 = *(void *)v63;
    *(void *)&long long v6 = 138543874;
    long long v50 = v6;
    id v51 = v5;
    uint64_t v52 = *(void *)v63;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v63 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = v8;
        id v9 = *(id *)(*((void *)&v62 + 1) + 8 * v8);
        id v10 = [v5 protectedDatabase];
        v57 = v9;
        uint64_t v11 = [v9 UUID];
        id v12 = HDDataEntityPredicateForDataUUID();
        id v13 = +[HDDataEntity anyInDatabase:v10 predicate:v12 error:a3];

        id v14 = v13;
        if (v13)
        {
          id v15 = +[HDAssociationEntity countOfObjectsAssociatedWithObjectPID:excludeDeleted:associationType:anchor:transaction:error:](HDAssociationEntity, "countOfObjectsAssociatedWithObjectPID:excludeDeleted:associationType:anchor:transaction:error:", [v13 persistentID], 1, 1, objc_msgSend(*(id *)(a1 + 48), "_rowid"), v5, a3);
          uint64_t v16 = v15;
          if (v15)
          {
            id v17 = v57;
            if ([v15 intValue])
            {
              v53 = v16;
              uint64_t v18 = v13;
              uint64_t v19 = [v57 _subActivities];
              uint64_t v20 = [v19 count];

              if (v20)
              {
                long long v60 = 0u;
                long long v61 = 0u;
                long long v58 = 0u;
                long long v59 = 0u;
                id v21 = [v57 _subActivities];
                uint64_t v22 = [v21 countByEnumeratingWithState:&v58 objects:v66 count:16];
                if (v22)
                {
                  uint64_t v23 = v22;
                  uint64_t v24 = *(void *)v59;
                  do
                  {
                    for (uint64_t i = 0; i != v23; ++i)
                    {
                      BOOL v26 = a3;
                      if (*(void *)v59 != v24) {
                        objc_enumerationMutation(v21);
                      }
                      uint64_t v27 = *(void *)(*((void *)&v58 + 1) + 8 * i);
                      id v28 = *(void **)(a1 + 40);
                      uint64_t v29 = objc_msgSend(v18, "persistentID", v50);
                      uint64_t v30 = [*(id *)(*(void *)(a1 + 40) + 216) options];
                      uint64_t v31 = v28;
                      a3 = v26;
                      char v32 = [v31 _fetchSamplesForWorkoutPID:v29 activity:v27 options:v30 limit:*(void *)(a1 + 64) sortDescending:*(unsigned __int8 *)(a1 + 72) error:v26];
                      id v33 = [*(id *)(a1 + 40) _relationshipForWorkout:v57 activity:v27 samples:v32];
                      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v33];
                    }
                    uint64_t v23 = [v21 countByEnumeratingWithState:&v58 objects:v66 count:16];
                  }
                  while (v23);
                }

                id v5 = v51;
                uint64_t v7 = v52;
                id v17 = v57;
              }
              char v34 = objc_msgSend(*(id *)(a1 + 40), "_fetchSamplesForWorkoutPID:activity:options:limit:sortDescending:error:", objc_msgSend(v18, "persistentID", v50), 0, objc_msgSend(*(id *)(*(void *)(a1 + 40) + 216), "options"), *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), a3);
              id v35 = [*(id *)(a1 + 40) _relationshipForWorkout:v17 activity:0 samples:v34];
              [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v35];

              id v14 = v18;
              uint64_t v16 = v53;
              goto LABEL_26;
            }
            _HKInitializeLogging();
            v46 = (void *)*MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
            {
              uint64_t v47 = *(void *)(a1 + 40);
              v43 = v46;
              v44 = [v57 UUID];
              uint64_t v48 = [*(id *)(a1 + 48) _rowid];
              *(_DWORD *)buf = v50;
              uint64_t v68 = v47;
              uint64_t v7 = v52;
              __int16 v69 = 2114;
              v70 = v44;
              __int16 v71 = 2048;
              uint64_t v72 = v48;
              _os_log_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_INFO, "%{public}@: No new sample associations found for workout: %{public}@, after anchor:%lld", buf, 0x20u);
LABEL_25:
            }
          }
          else
          {
            _HKInitializeLogging();
            id v41 = (void *)*MEMORY[0x1E4F29F18];
            id v17 = v57;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              uint64_t v42 = *(void *)(a1 + 40);
              v43 = v41;
              v44 = [v57 UUID];
              uint64_t v45 = *a3;
              *(_DWORD *)buf = v50;
              uint64_t v68 = v42;
              uint64_t v7 = v52;
              __int16 v69 = 2114;
              v70 = v44;
              __int16 v71 = 2114;
              uint64_t v72 = v45;
              _os_log_error_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get count of objects loosely associated to workout: %{public}@, %{public}@", buf, 0x20u);
              goto LABEL_25;
            }
          }
LABEL_26:

          goto LABEL_27;
        }
        _HKInitializeLogging();
        __int16 v36 = (void *)*MEMORY[0x1E4F29F18];
        id v17 = v57;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = *(void *)(a1 + 40);
          v38 = v36;
          uint64_t v39 = [v57 UUID];
          uint64_t v40 = *a3;
          *(_DWORD *)buf = v50;
          uint64_t v68 = v37;
          uint64_t v7 = v52;
          __int16 v69 = 2114;
          v70 = v39;
          __int16 v71 = 2114;
          uint64_t v72 = v40;
          _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get persisted if for workout: %{public}@, %{public}@", buf, 0x20u);
        }
LABEL_27:

        uint64_t v8 = v56 + 1;
      }
      while (v56 + 1 != v55);
      uint64_t v55 = [obj countByEnumeratingWithState:&v62 objects:v73 count:16];
    }
    while (v55);
  }

  return 1;
}

- (id)_fetchSamplesForWorkoutPID:(int64_t)a3 activity:(id)a4 options:(int64_t)a5 limit:(unint64_t)a6 sortDescending:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  v27[2] = *MEMORY[0x1E4F143B8];
  id v14 = (void *)MEMORY[0x1E4F2B2C0];
  uint64_t v15 = *MEMORY[0x1E4F2A950];
  id v16 = a4;
  id v17 = [v14 quantityTypeForIdentifier:v15];
  v27[0] = v17;
  uint64_t v18 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A800]];
  v27[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

  uint64_t v20 = HDReferenceForAssociatableObject(v16);

  id v21 = [(HDQueryServer *)self profile];
  uint64_t v22 = +[HDAssociationEntity objectsAssociatedWithObjectPID:a3 subObjectReference:v20 dataTypes:v19 associationType:1 limit:a6 sortDescending:v9 profile:v21 error:a8];

  if (a5 == 1 && (unint64_t)[v22 count] >= 2)
  {
    uint64_t v23 = [v22 firstObject];
    BOOL v26 = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];

    uint64_t v22 = (void *)v24;
  }

  return v22;
}

- (id)_relationshipForWorkout:(id)a3 activity:(id)a4 samples:(id)a5
{
  id v8 = (id)MEMORY[0x1E4F1CBF0];
  if (a5) {
    id v8 = a5;
  }
  BOOL v9 = (objc_class *)MEMORY[0x1E4F2B788];
  id v10 = v8;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[[v9 alloc] initWithWorkout:v13 activity:v12 samples:v10];

  return v14;
}

- (int64_t)_batchObjectsWithError:(id *)a3 batchHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HDQueryServer *)self profile];
  id v8 = +[HDDataEntity entityEnumeratorWithProfile:v7];

  BOOL v9 = [(HDQueryServer *)self filter];
  [v8 setFilter:v9];

  if (v8) {
    int64_t v10 = [(HDBatchedQueryServer *)self batchObjectsWithEnumerator:v8 error:a3 handler:v6];
  }
  else {
    int64_t v10 = 1;
  }

  return v10;
}

- (void)_handleBatchedQueryResult:(int64_t)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  switch(a3)
  {
    case 1:
      _HKInitializeLogging();
      uint64_t v7 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
      {
        int v15 = 138543618;
        id v16 = self;
        __int16 v17 = 2114;
        id v18 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error enumerating update results: %{public}@", (uint8_t *)&v15, 0x16u);
        if (v6) {
          goto LABEL_5;
        }
      }
      else if (v6)
      {
LABEL_5:
        id v8 = [(HDWorkoutEffortRelationshipQueryServer *)self queryClient];
        BOOL v9 = [(HDQueryServer *)self queryUUID];
        objc_msgSend(v8, "client_deliverError:forQuery:", v6, v9);

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"Sample enumeration failed without reporting an error.");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 2:
      _HKInitializeLogging();
      int64_t v10 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
      {
        int v15 = 138543362;
        id v16 = self;
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: Client no longer authorized", (uint8_t *)&v15, 0xCu);
      }
      id v8 = [(HDWorkoutEffortRelationshipQueryServer *)self queryClient];
      id v11 = [(_HKWorkoutEffortRelationshipQueryServerConfiguration *)self->_ratingOfExertionAssociationQueryServerConfiguration anchor];
      id v12 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v8, "client_deliverWorkoutEffortRelationships:isFinalBatch:anchor:forQuery:", MEMORY[0x1E4F1CBF0], 1, v11, v12);

LABEL_9:
      goto LABEL_15;
    case 3:
      _HKInitializeLogging();
      id v13 = *MEMORY[0x1E4F29F90];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      int v15 = 138543362;
      id v16 = self;
      id v14 = "%{public}@: Suspended during enumeration";
      goto LABEL_14;
    case 4:
      _HKInitializeLogging();
      id v13 = *MEMORY[0x1E4F29F90];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      int v15 = 138543362;
      id v16 = self;
      id v14 = "%{public}@: Canceled during enumeration";
LABEL_14:
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v15, 0xCu);
LABEL_15:

      return;
    default:
      goto LABEL_15;
  }
}

- (void)associationsUpdatedForObject:(id)a3 subObject:(id)a4 type:(unint64_t)a5 objects:(id)a6 anchor:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  int v15 = [(HDQueryServer *)self clientProxy];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _HKInitializeLogging();
    __int16 v17 = *MEMORY[0x1E4F29FB8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = self;
    __int16 v28 = 2114;
    id v29 = v11;
    id v18 = "%{public}@: Object is not a Workout: %{public}@";
LABEL_9:
    _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
    goto LABEL_10;
  }
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _HKInitializeLogging();
      __int16 v17 = *MEMORY[0x1E4F29FB8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = self;
      __int16 v28 = 2114;
      id v29 = v12;
      id v18 = "%{public}@: SubObject is not a WorkoutActivity: %{public}@";
      goto LABEL_9;
    }
  }
  id v16 = [(HDQueryServer *)self queryQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __101__HDWorkoutEffortRelationshipQueryServer_associationsUpdatedForObject_subObject_type_objects_anchor___block_invoke;
  v19[3] = &unk_1E6304FC0;
  id v20 = v14;
  id v21 = self;
  id v22 = v15;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  dispatch_async(v16, v19);

LABEL_10:
}

void __101__HDWorkoutEffortRelationshipQueryServer_associationsUpdatedForObject_subObject_type_objects_anchor___block_invoke(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) longLongValue];
  v3 = *(void **)(a1 + 40);
  if (v2 <= v3[28])
  {
    _HKInitializeLogging();
    id v14 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_INFO, "%{public}@: Anchor is less then or equal to anchor returned in initial results. Skipping update", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v4 = [v3 queryUUID];
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = [MEMORY[0x1E4F2B2C0] workoutType];
    uint64_t v7 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A800]];
    id v8 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A950]];
    BOOL v9 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, 0);

    int64_t v10 = [*(id *)(a1 + 40) client];
    id v11 = [v10 authorizationOracle];
    id v54 = 0;
    id v12 = [v11 readAuthorizationStatusesForTypes:v9 error:&v54];
    id v13 = v54;

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 48), "client_deliverError:forQuery:", v13, v4);
    }
    else
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v63 = 0x2020000000;
      char v64 = 0;
      uint64_t v50 = 0;
      id v51 = &v50;
      uint64_t v52 = 0x2020000000;
      char v53 = 0;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __101__HDWorkoutEffortRelationshipQueryServer_associationsUpdatedForObject_subObject_type_objects_anchor___block_invoke_301;
      v49[3] = &unk_1E630B668;
      v49[4] = &buf;
      v49[5] = &v50;
      [v12 enumerateKeysAndObjectsUsingBlock:v49];
      if (*(unsigned char *)(*((void *)&buf + 1) + 24) && *((unsigned char *)v51 + 24))
      {
        id v16 = [*(id *)(a1 + 56) UUID];
        __int16 v17 = HDDataEntityPredicateForDataUUID();
        id v18 = [*(id *)(a1 + 40) profile];
        uint64_t v19 = [v18 database];
        id v48 = 0;
        uint64_t v45 = +[HDHealthEntity anyWithPredicate:v17 healthDatabase:v19 error:&v48];
        id v20 = v48;

        if (!v45)
        {
          _HKInitializeLogging();
          id v21 = (id)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v40 = *(void *)(a1 + 40);
            id v41 = [*(id *)(a1 + 56) UUID];
            *(_DWORD *)uint64_t v56 = 138543874;
            uint64_t v57 = v40;
            __int16 v58 = 2114;
            id v59 = v41;
            __int16 v60 = 2114;
            id v61 = v20;
            _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get persisted if for workout: %{public}@, %{public}@", v56, 0x20u);
          }
          objc_msgSend(*(id *)(a1 + 48), "client_deliverError:forQuery:", v20, v4);
        }
        id v22 = *(void **)(a1 + 40);
        uint64_t v23 = [v45 persistentID];
        uint64_t v24 = *(void *)(a1 + 64);
        uint64_t v25 = [*(id *)(a1 + 72) count];
        id v47 = v20;
        BOOL v26 = [v22 _fetchSamplesForWorkoutPID:v23 activity:v24 options:1 limit:v25 sortDescending:1 error:&v47];
        id v27 = v47;

        if (v27)
        {
          _HKInitializeLogging();
          __int16 v28 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            uint64_t v39 = *(void *)(a1 + 40);
            *(_DWORD *)uint64_t v56 = 138543618;
            uint64_t v57 = v39;
            __int16 v58 = 2114;
            id v59 = v27;
            _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch associated effort samples: %{public}@", v56, 0x16u);
          }
          objc_msgSend(*(id *)(a1 + 48), "client_deliverError:forQuery:", v27, v4);
        }
        else
        {
          uint64_t v30 = [*(id *)(a1 + 40) client];
          uint64_t v31 = [v30 authorizationOracle];
          uint64_t v32 = *(void *)(a1 + 32);
          id v46 = 0;
          v44 = [v31 filteredObjectsForReadAuthorization:v26 anchor:v32 error:&v46];
          id v27 = v46;

          if (v44)
          {
            v43 = (void *)[objc_alloc(MEMORY[0x1E4F2B788]) initWithWorkout:*(void *)(a1 + 56) activity:*(void *)(a1 + 64) samples:v44];
            _HKInitializeLogging();
            id v33 = *MEMORY[0x1E4F29F90];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v34 = *(void *)(a1 + 40);
              *(_DWORD *)uint64_t v56 = 138543619;
              uint64_t v57 = v34;
              __int16 v58 = 2113;
              id v59 = v43;
              _os_log_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Delivering relationships to client: %{private}@", v56, 0x16u);
            }
            id v35 = *(void **)(a1 + 48);
            uint64_t v55 = v43;
            __int16 v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
            uint64_t v37 = objc_msgSend(MEMORY[0x1E4F2B3C8], "anchorFromValue:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
            objc_msgSend(v35, "client_deliverWorkoutEffortRelationships:isFinalBatch:anchor:forQuery:", v36, 1, v37, v4);
          }
          else
          {
            _HKInitializeLogging();
            v38 = *MEMORY[0x1E4F29F90];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
            {
              uint64_t v42 = *(void *)(a1 + 40);
              *(_DWORD *)uint64_t v56 = 138543618;
              uint64_t v57 = v42;
              __int16 v58 = 2114;
              id v59 = v27;
              _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter samples for authorization: %{public}@", v56, 0x16u);
            }
            objc_msgSend(*(id *)(a1 + 48), "client_deliverError:forQuery:", v27, v4);
          }
        }
      }
      else
      {
        id v29 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E4F2B3C8], "anchorFromValue:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "client_deliverWorkoutEffortRelationships:isFinalBatch:anchor:forQuery:", MEMORY[0x1E4F1CBF0], 1, v27, v4);
      }

      _Block_object_dispose(&v50, 8);
      _Block_object_dispose(&buf, 8);
    }
  }
}

void __101__HDWorkoutEffortRelationshipQueryServer_associationsUpdatedForObject_subObject_type_objects_anchor___block_invoke_301(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F2B2C0] workoutType];
  if (v6 == v9)
  {
    int v7 = [v5 canRead];

    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      goto LABEL_7;
    }
  }
  else
  {
  }
  if (![v5 canRead]) {
    goto LABEL_8;
  }
  uint64_t v8 = *(void *)(a1 + 40);
LABEL_7:
  *(unsigned char *)(*(void *)(v8 + 8) + 24) = 1;
LABEL_8:
}

- (_HKWorkoutEffortRelationshipQueryServerConfiguration)ratingOfExertionAssociationQueryServerConfiguration
{
  return self->_ratingOfExertionAssociationQueryServerConfiguration;
}

- (int64_t)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(int64_t)a3
{
  self->_anchor = a3;
}

- (void).cxx_destruct
{
}

@end