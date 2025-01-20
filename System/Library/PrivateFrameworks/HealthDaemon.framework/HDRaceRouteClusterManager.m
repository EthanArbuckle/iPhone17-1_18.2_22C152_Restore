@interface HDRaceRouteClusterManager
- (BOOL)generateRaceRouteClustersWithLimit:(unint64_t)a3 error:(id *)a4;
- (HDRaceRouteClusterManager)initWithProfile:(id)a3;
- (id)raceRouteClustersForActivityType:(unint64_t)a3 error:(id *)a4;
@end

@implementation HDRaceRouteClusterManager

- (HDRaceRouteClusterManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDRaceRouteClusterManager;
  v5 = [(HDRaceRouteClusterManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (id)raceRouteClustersForActivityType:(unint64_t)a3 error:(id *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = +[HDRaceRouteClusterEntity raceRouteClustersForActivityType:a3 profile:WeakRetained error:a4];

  return v7;
}

- (BOOL)generateRaceRouteClustersWithLimit:(unint64_t)a3 error:(id *)a4
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v9 = [WeakRetained database];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__HDRaceRouteClusterManager_generateRaceRouteClustersWithLimit_error___block_invoke;
  v22[3] = &__block_descriptor_40_e35_B24__0__HDDatabaseTransaction_8__16l;
  v22[4] = a3;
  LODWORD(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v9 error:a4 block:v22];

  if (!a3) {
    return 0;
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  while (1)
  {
    id v10 = objc_loadWeakRetained((id *)p_profile);
    v11 = [v10 database];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__HDRaceRouteClusterManager_generateRaceRouteClustersWithLimit_error___block_invoke_2;
    v17[3] = &unk_1E62F9108;
    v17[4] = self;
    v17[5] = &v18;
    BOOL v12 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:a4 block:v17];

    if (!v12) {
      break;
    }
    if (!*((unsigned char *)v19 + 24))
    {
      id v13 = objc_loadWeakRetained((id *)p_profile);
      v14 = [v13 database];
      BOOL v15 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v14 error:a4 block:&__block_literal_global_249];

      goto LABEL_8;
    }
  }
  BOOL v15 = 0;
LABEL_8:
  _Block_object_dispose(&v18, 8);
  return v15;
}

BOOL __70__HDRaceRouteClusterManager_generateRaceRouteClustersWithLimit_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[HDWorkoutClusterEntity clusterEntitiesWithTransaction:v5 limit:*(void *)(a1 + 32) error:a3];
  if (v6) {
    BOOL v7 = +[HDRaceRouteGenerationQueueEntity populateWithWorkoutClusters:v6 transaction:v5 error:a3];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

BOOL __70__HDRaceRouteClusterManager_generateRaceRouteClustersWithLimit_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = +[HDRaceRouteGenerationQueueEntity nextWorkoutClusterWithTransaction:v5 error:a3];
  BOOL v7 = v6;
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = v6;
    id v10 = v5;
    if (v8)
    {
      uint64_t v86 = 0;
      v87 = &v86;
      uint64_t v88 = 0x3032000000;
      v89 = __Block_byref_object_copy__212;
      v90 = __Block_byref_object_dispose__212;
      id v91 = 0;
      uint64_t v80 = 0;
      v81 = &v80;
      uint64_t v82 = 0x3032000000;
      v83 = __Block_byref_object_copy__212;
      v84 = __Block_byref_object_dispose__212;
      id v85 = 0;
      uint64_t v74 = 0;
      v75 = &v74;
      uint64_t v76 = 0x3032000000;
      v77 = __Block_byref_object_copy__212;
      v78 = __Block_byref_object_dispose__212;
      id v79 = 0;
      uint64_t v70 = 0;
      v71 = (double *)&v70;
      uint64_t v72 = 0x2020000000;
      uint64_t v73 = 0;
      uint64_t v64 = 0;
      v65 = &v64;
      uint64_t v66 = 0x3032000000;
      v67 = __Block_byref_object_copy__212;
      v68 = __Block_byref_object_dispose__212;
      id v69 = 0;
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __79__HDRaceRouteClusterManager__racingClusterForWorkoutCluster_transaction_error___block_invoke;
      v63[3] = &unk_1E630F408;
      v63[4] = &v86;
      v63[5] = &v80;
      v63[6] = &v74;
      v63[7] = &v70;
      v63[8] = &v64;
      if ([v9 modelPropertiesWithTransaction:v10 error:a3 handler:v63])
      {
        uint64_t v11 = [v9 numberOfWorkoutsWithTransaction:v10 error:a3];
        BOOL v12 = (void *)v11;
        if (v11)
        {
          uint64_t v56 = a1;
          v58 = (void *)v11;
          id v60 = v10;
          id v61 = v9;
          uint64_t v13 = v81[5];
          id WeakRetained = objc_loadWeakRetained((id *)(v8 + 8));
          BOOL v15 = [WeakRetained metadataManager];
          v16 = +[HDRaceRouteClusterWorkout clusterWorkoutWithWorkoutEntity:v13 transaction:v10 metadataManager:v15 error:a3];

          if (v16)
          {
            uint64_t v17 = v75[5];
            id v18 = objc_loadWeakRetained((id *)(v8 + 8));
            v19 = [v18 metadataManager];
            uint64_t v20 = +[HDRaceRouteClusterWorkout clusterWorkoutWithWorkoutEntity:v17 transaction:v60 metadataManager:v19 error:a3];

            if (v20)
            {
              BOOL v12 = v58;
              id v21 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
              id v22 = objc_alloc(MEMORY[0x1E4F2B3E0]);
              v23 = [MEMORY[0x1E4F29128] UUID];
              uint64_t v51 = v87[5];
              uint64_t v50 = [v58 unsignedIntegerValue];
              double v24 = v71[3];
              uint64_t v25 = [v16 activityType];
              v55 = [v16 workoutUUID];
              v54 = [v16 startDate];
              [v16 distance];
              double v27 = v26;
              [v16 duration];
              double v29 = v28;
              v53 = [v20 workoutUUID];
              v52 = [v20 startDate];
              [v20 distance];
              double v31 = v30;
              [v20 duration];
              v33 = objc_msgSend(v22, "_initWithUUID:workoutClusterUUID:clusterSize:relevanceValue:workoutActivityType:lastWorkoutUUID:lastWorkoutDate:lastWorkoutDistance:lastWorkoutDuration:lastWorkoutStartingPoint:bestWorkoutUUID:bestWorkoutDate:bestWorkoutDistance:bestWorkoutDuration:workoutRouteSnapshot:workoutRouteLabel:", v23, v51, v50, v25, v55, v54, v24, v27, v29, v31, v32, 0, v53, v52,
                              v21,
                              v65[5]);
            }
            else
            {
              v33 = 0;
              BOOL v12 = v58;
            }
          }
          else
          {
            v33 = 0;
            BOOL v12 = v58;
          }

          id v10 = v60;
          id v9 = v61;
          a1 = v56;
        }
        else
        {
          v33 = 0;
        }
      }
      else
      {
        v33 = 0;
      }
      _Block_object_dispose(&v64, 8);

      _Block_object_dispose(&v70, 8);
      _Block_object_dispose(&v74, 8);

      _Block_object_dispose(&v80, 8);
      _Block_object_dispose(&v86, 8);
    }
    else
    {
      v33 = 0;
    }

    if (v33)
    {
      v35 = [v9 snapshotEntityWithTransaction:v10 error:a3];
      if (v35)
      {
        v57 = v7;
        id v59 = v5;
        id v62 = v9;
        v36 = a3;
        id v37 = v10;
        id v38 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        [v38 syncIdentityManager];
        v40 = uint64_t v39 = a1;
        v41 = [v40 currentSyncIdentity];
        v42 = [v41 entity];
        uint64_t v43 = [v42 persistentID];
        id v44 = objc_loadWeakRetained((id *)(*(void *)(v39 + 32) + 8));
        uint64_t v45 = v43;
        id v46 = v37;
        v47 = v36;
        v48 = +[HDRaceRouteClusterEntity insertOrUpdateRacingCluster:v33 routeSnapshot:v35 syncIdentity:v45 transaction:v46 profile:v44 error:v36];

        if (v48) {
          BOOL v34 = +[HDRaceRouteGenerationQueueEntity finishWorkoutCluster:v62 concreteCluster:v48 transaction:v46 error:v47];
        }
        else {
          BOOL v34 = 0;
        }
        BOOL v7 = v57;
        id v5 = v59;
      }
      else
      {
        BOOL v34 = 0;
      }
    }
    else
    {
      BOOL v34 = 0;
    }
  }
  else if (a3 && *a3)
  {
    BOOL v34 = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    BOOL v34 = 1;
  }

  return v34;
}

BOOL __70__HDRaceRouteClusterManager_generateRaceRouteClustersWithLimit_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = +[HDRaceRouteGenerationQueueEntity clearQueueWithTransaction:v4 error:a3];
  BOOL v6 = v5
    && +[HDRaceRouteSnapshotEntity pruneUnreachableDataWithTransaction:error:](HDRaceRouteSnapshotEntity, "pruneUnreachableDataWithTransaction:error:", v4, a3)&& +[HDRaceRouteClusterEntity pruneRaceRouteClustersWithEligibleEntities:v5 transaction:v4 error:a3];

  return v6;
}

void __79__HDRaceRouteClusterManager__racingClusterForWorkoutCluster_transaction_error___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = *(void *)(a1[4] + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v11;
  id v28 = v11;
  id v17 = a5;

  uint64_t v18 = *(void *)(a1[5] + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v12;
  id v20 = v12;

  uint64_t v21 = *(void *)(a1[6] + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v13;
  id v23 = v13;

  [v17 doubleValue];
  uint64_t v25 = v24;

  *(void *)(*(void *)(a1[7] + 8) + 24) = v25;
  uint64_t v26 = *(void *)(a1[8] + 8);
  double v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v14;
}

- (void).cxx_destruct
{
}

@end