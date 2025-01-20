@interface HDWorkoutRouteQueryServer
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDWorkoutRouteQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
- (void)unitTest_setBatchThreshold:(unint64_t)a3;
@end

@implementation HDWorkoutRouteQueryServer

- (HDWorkoutRouteQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HDWorkoutRouteQueryServer;
  v11 = [(HDQueryServer *)&v19 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = [v10 workoutRoute];
    locationSeries = v11->_locationSeries;
    v11->_locationSeries = (HKWorkoutRoute *)v12;

    uint64_t v14 = [v10 workoutUUID];
    workoutUUID = v11->_workoutUUID;
    v11->_workoutUUID = (NSUUID *)v14;

    uint64_t v16 = [v10 dateInterval];
    dateInterval = v11->_dateInterval;
    v11->_dateInterval = (NSDateInterval *)v16;

    v11->_batchThreshold = 100;
  }

  return v11;
}

- (void)unitTest_setBatchThreshold:(unint64_t)a3
{
  self->_batchThreshold = a3;
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
  v30.receiver = self;
  v30.super_class = (Class)HDWorkoutRouteQueryServer;
  [(HDQueryServer *)&v30 _queue_start];
  v3 = [(HDQueryServer *)self queryUUID];
  v4 = [(HDQueryServer *)self clientProxy];
  v5 = [MEMORY[0x1E4F2B498] workoutRouteType];
  id v29 = 0;
  v6 = [(HDQueryServer *)self readAuthorizationStatusForType:v5 error:&v29];
  id v7 = v29;

  if (!v6)
  {
    objc_msgSend(v4, "client_deliverError:forQuery:", v7, v3);
LABEL_7:
    id v13 = v7;
    goto LABEL_10;
  }
  if (([v6 canRead] & 1) == 0)
  {
    objc_msgSend(v4, "client_deliverWorkoutRouteLocations:isFinal:query:", MEMORY[0x1E4F1CBF0], 1, v3);
    goto LABEL_7;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__116;
  v27 = __Block_byref_object_dispose__116;
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = [(HDQueryServer *)self profile];
  v9 = [v8 database];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __41__HDWorkoutRouteQueryServer__queue_start__block_invoke;
  v17 = &unk_1E62FA3A8;
  v18 = self;
  v21 = &v23;
  id v22 = v7;
  id v10 = v4;
  id v19 = v10;
  id v11 = v3;
  id v20 = v11;
  BOOL v12 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v9 error:&v22 block:&v14];
  id v13 = v22;

  if (v12) {
    objc_msgSend(v10, "client_deliverWorkoutRouteLocations:isFinal:query:", v24[5], 1, v11, v14, v15, v16, v17, v18, v19);
  }
  else {
    objc_msgSend(v10, "client_deliverError:forQuery:", v13, v11, v14, v15, v16, v17, v18, v19);
  }

  _Block_object_dispose(&v23, 8);
LABEL_10:
}

uint64_t __41__HDWorkoutRouteQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v56 = a2;
  v5 = *(void **)(a1 + 32);
  if (v5[26])
  {
    uint64_t v69 = v5[26];
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  }
  else
  {
    v34 = [v5 client];
    int v35 = [v34 hasRequiredEntitlement:*MEMORY[0x1E4F2A548] error:a3];

    if (!v35) {
      goto LABEL_26;
    }
    v36 = [*(id *)(a1 + 32) profile];
    v37 = [v36 metadataManager];
    uint64_t v38 = *MEMORY[0x1E4F2BBF0];
    v39 = [*(id *)(*(void *)(a1 + 32) + 216) UUIDString];
    v40 = [v37 predicateWithMetadataKey:v38 value:v39 operatorType:4];

    uint64_t v33 = *(void *)(a1 + 32);
    if (!v33)
    {

      goto LABEL_34;
    }
    v41 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v42 = v40;
    id v43 = objc_alloc_init(v41);
    v44 = [MEMORY[0x1E4F2B448] dataTypeWithCode:102];
    v45 = [(id)v33 profile];
    v46 = +[HDSampleEntity entityEnumeratorWithType:v44 profile:v45];

    [v46 setPredicate:v42];
    v47 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"start_date" entityClass:objc_opt_class() ascending:1];
    v70[0] = v47;
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
    [v46 setOrderingTerms:v48];

    [v46 setIgnoreEntityClassAdditionalPredicateForEnumeration:1];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __67__HDWorkoutRouteQueryServer__workoutRoutesMatchingPredicate_error___block_invoke;
    v66[3] = &unk_1E6300148;
    id v67 = v43;
    id v6 = v43;
    id v49 = [v46 enumerateWithError:a3 handler:v66] ? v6 : 0;
    id v50 = v49;

    if (!v50)
    {
LABEL_26:
      uint64_t v33 = 0;
      goto LABEL_34;
    }
  }
  v55 = [v56 databaseForEntityClass:objc_opt_class()];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v63;
    v53 = a3;
    unint64_t v10 = 0x1EBA09000uLL;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v63 != v9) {
        objc_enumerationMutation(obj);
      }
      BOOL v12 = *(void **)(*((void *)&v62 + 1) + 8 * v11);
      uint64_t v13 = *(int *)(v10 + 3724);
      if (!*(void *)(*(void *)(a1 + 32) + v13)) {
        goto LABEL_13;
      }
      uint64_t v14 = [*(id *)(*((void *)&v62 + 1) + 8 * v11) endDate];
      uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + v13) startDate];
      char v16 = objc_msgSend(v14, "hk_isBeforeDate:", v15);

      if ((v16 & 1) == 0)
      {
        v17 = [v12 startDate];
        v18 = [*(id *)(*(void *)(a1 + 32) + v13) endDate];
        char v19 = objc_msgSend(v17, "hk_isAfterDate:", v18);

        if ((v19 & 1) == 0) {
          break;
        }
      }
LABEL_17:
      if (v8 == ++v11)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_19;
      }
    }
    id v20 = [*(id *)(*(void *)(a1 + 32) + v13) startDate];
    v21 = [v12 startDate];
    int v22 = objc_msgSend(v20, "hk_isAfterDate:", v21);

    if (v22)
    {
      uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + v13) startDate];
    }
    else
    {
LABEL_13:
      uint64_t v23 = 0;
    }
    v24 = [v12 UUID];
    uint64_t v25 = HDDataEntityPredicateForDataUUID();

    id v61 = 0;
    v26 = +[HDDataEntity anyInDatabase:v55 predicate:v25 error:&v61];
    id v27 = v61;
    id v28 = v27;
    if (!v26)
    {
      if (v27)
      {
        if (v53)
        {
          id v28 = v27;
          void *v53 = v28;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
      else
      {
        v51 = (void *)MEMORY[0x1E4F28C58];
        id v28 = [v12 UUID];
        objc_msgSend(v51, "hk_assignError:code:format:", v53, 100, @"Did not find the expected sample with UUID=%@", v28);
      }
LABEL_32:

      uint64_t v33 = 0;
      goto LABEL_33;
    }
    id v29 = [*(id *)(*(void *)(a1 + 32) + v13) endDate];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __41__HDWorkoutRouteQueryServer__queue_start__block_invoke_2;
    v57[3] = &unk_1E6303718;
    uint64_t v30 = *(void *)(a1 + 32);
    v31 = *(void **)(a1 + 40);
    uint64_t v60 = *(void *)(a1 + 56);
    v57[4] = v30;
    id v58 = v31;
    id v59 = *(id *)(a1 + 48);
    char v32 = [v26 enumerateLocationDataInTransaction:v56 startDate:v23 endDate:v29 error:v53 handler:v57];

    if ((v32 & 1) == 0) {
      goto LABEL_32;
    }

    unint64_t v10 = 0x1EBA09000;
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v33 = 1;
LABEL_33:

LABEL_34:
  return v33;
}

uint64_t __41__HDWorkoutRouteQueryServer__queue_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] >= *(void *)(*(void *)(a1 + 32) + 200))
  {
    objc_msgSend(*(id *)(a1 + 40), "client_deliverWorkoutRouteLocations:isFinal:query:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), 0, *(void *)(a1 + 48));
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v3];

  return 1;
}

uint64_t __67__HDWorkoutRouteQueryServer__workoutRoutesMatchingPredicate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);

  objc_storeStrong((id *)&self->_locationSeries, 0);
}

@end