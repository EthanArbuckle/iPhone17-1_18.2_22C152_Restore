@interface HDRaceRouteClusterEntity
+ (BOOL)enumerateRoutePointsForClusterUUID:(id)a3 workoutSelection:(unint64_t)a4 timestampAnchor:(double)a5 limit:(unint64_t)a6 profile:(id)a7 error:(id *)a8 dataHandler:(id)a9;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)pruneRaceRouteClustersWithEligibleEntities:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (BOOL)supportsSyncStore:(id)a3;
+ (BOOL)unitTest_deleteAllClusterAndBackingDataInTransaction:(id)a3 error:(id *)a4;
+ (HDRaceRouteClusterEntity)_entityForClusterUUID:(void *)a3 database:(void *)a4 error:;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_baseEntityProperties;
+ (id)databaseTable;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)entityForClusterUUID:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)foreignKeys;
+ (id)insertCodableCluster:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 transaction:(id)a6 error:(id *)a7;
+ (id)insertOrUpdateRacingCluster:(id)a3 routeSnapshot:(id)a4 syncIdentity:(int64_t)a5 transaction:(id)a6 profile:(id)a7 error:(id *)a8;
+ (id)privateSubEntities;
+ (id)propertyForSyncAnchor;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)raceRouteClustersForActivityType:(unint64_t)a3 profile:(id)a4 error:(id *)a5;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (id)uniquedColumns;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (uint64_t)_deleteClusterBackingDataWithPredicate:(void *)a3 transaction:(uint64_t)a4 error:;
+ (uint64_t)_enumerateRoutePointsForClusterUUID:(double)a3 workoutSelection:(uint64_t)a4 timestampAnchor:(void *)a5 limit:(uint64_t)a6 startDuration:(uint64_t)a7 finishDuration:(void *)a8 profile:(uint64_t)a9 error:(void *)a10 dataHandler:;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
- (uint64_t)_fetchWorkoutIDsWithTransaction:(uint64_t)a3 error:(void *)a4 handler:;
@end

@implementation HDRaceRouteClusterEntity

uint64_t __102__HDRaceRouteClusterEntity__insertRacingCluster_routeSnapshot_syncIdentity_transaction_profile_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

+ (id)_baseEntityProperties
{
  v2[23] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"uuid";
  v2[1] = @"workout_cluster_uuid";
  v2[2] = @"relevance";
  v2[3] = @"workout_activity_type";
  v2[4] = @"workout_cluster_size";
  v2[5] = @"last_workout_uuid";
  v2[6] = @"last_workout_date";
  v2[7] = @"last_workout_distance";
  v2[8] = @"last_workout_duration";
  v2[9] = @"last_workout_rowid";
  v2[10] = @"best_workout_uuid";
  v2[11] = @"best_workout_date";
  v2[12] = @"best_workout_distance";
  v2[13] = @"best_workout_duration";
  v2[14] = @"best_workout_rowid";
  v2[15] = @"snapshot_id";
  v2[16] = @"route_label";
  v2[17] = @"modified_date";
  v2[18] = @"sync_provenance";
  v2[19] = @"frozen";
  v2[20] = @"sync_anchor";
  v2[21] = @"relevance_anchor";
  v2[22] = @"sync_identity";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:23];

  return v0;
}

void __102__HDRaceRouteClusterEntity__insertRacingCluster_routeSnapshot_syncIdentity_transaction_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) clusterUUID];
  MEMORY[0x1C1879EF0](a2, @"uuid", v4);

  v5 = [*(id *)(a1 + 32) workoutClusterUUID];
  MEMORY[0x1C1879EF0](a2, @"workout_cluster_uuid", v5);

  [*(id *)(a1 + 32) relevanceValue];
  MEMORY[0x1C1879E50](a2, @"relevance");
  MEMORY[0x1C1879E80](a2, @"workout_activity_type", [*(id *)(a1 + 32) workoutActivityType]);
  MEMORY[0x1C1879E80](a2, @"workout_cluster_size", [*(id *)(a1 + 32) clusterSize]);
  v6 = [*(id *)(a1 + 32) lastWorkoutUUID];
  MEMORY[0x1C1879EF0](a2, @"last_workout_uuid", v6);

  v7 = [*(id *)(a1 + 32) lastWorkoutDate];
  MEMORY[0x1C1879E40](a2, @"last_workout_date", v7);

  [*(id *)(a1 + 32) lastWorkoutDistance];
  MEMORY[0x1C1879E50](a2, @"last_workout_distance");
  [*(id *)(a1 + 32) lastWorkoutDuration];
  MEMORY[0x1C1879E50](a2, @"last_workout_duration");
  MEMORY[0x1C1879E80](a2, @"last_workout_rowid", [*(id *)(a1 + 40) persistentID]);
  v8 = [*(id *)(a1 + 32) bestWorkoutUUID];
  MEMORY[0x1C1879EF0](a2, @"best_workout_uuid", v8);

  v9 = [*(id *)(a1 + 32) bestWorkoutDate];
  MEMORY[0x1C1879E40](a2, @"best_workout_date", v9);

  [*(id *)(a1 + 32) bestWorkoutDistance];
  MEMORY[0x1C1879E50](a2, @"best_workout_distance");
  [*(id *)(a1 + 32) bestWorkoutDuration];
  MEMORY[0x1C1879E50](a2, @"best_workout_duration");
  MEMORY[0x1C1879E80](a2, @"best_workout_rowid", [*(id *)(a1 + 48) persistentID]);
  MEMORY[0x1C1879E80](a2, @"snapshot_id", [*(id *)(a1 + 56) persistentID]);
  v10 = [*(id *)(a1 + 32) workoutRouteLabel];
  MEMORY[0x1C1879EC0](a2, @"route_label", v10);

  v11 = [MEMORY[0x1E4F1C9C8] date];
  MEMORY[0x1C1879E40](a2, @"modified_date", v11);

  MEMORY[0x1C1879E80](a2, @"sync_provenance", 0);
  MEMORY[0x1C1879E20](a2, @"frozen", 1);
  MEMORY[0x1C1879E80](a2, @"sync_anchor", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
  MEMORY[0x1C1879E80](a2, @"relevance_anchor", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));

  JUMPOUT(0x1C1879E80);
}

+ (id)insertOrUpdateRacingCluster:(id)a3 routeSnapshot:(id)a4 syncIdentity:(int64_t)a5 transaction:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v52 = a7;
  v16 = [v15 databaseForEntityClass:a1];
  v17 = [v13 lastWorkoutUUID];
  v18 = [v13 bestWorkoutUUID];
  id v57 = 0;
  id v19 = v17;
  id v20 = v18;
  id v21 = v16;
  self;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = -1;
  uint64_t v58 = MEMORY[0x1E4F143A8];
  uint64_t v59 = 3221225472;
  v60 = __85__HDRaceRouteClusterEntity__entityForLastWorkoutUUID_bestWorkoutUUID_database_error___block_invoke;
  v61 = &unk_1E62F2900;
  id v22 = v19;
  id v62 = v22;
  id v23 = v20;
  id v63 = v23;
  uint64_t v68 = MEMORY[0x1E4F143A8];
  uint64_t v69 = 3221225472;
  v70 = __85__HDRaceRouteClusterEntity__entityForLastWorkoutUUID_bestWorkoutUUID_database_error___block_invoke_2;
  v71 = &unk_1E62F3640;
  v72 = &v73;
  if (![v21 executeSQL:@"SELECT ROWID FROM RacePreviousRoute_concrete_cluster WHERE last_workout_uuid = ? AND best_workout_uuid = ?" error:&v57 bindingHandler:&v58 enumerationHandler:&v68]|| v74[3] == -1)
  {
    v25 = 0;
  }
  else
  {
    v24 = [HDRaceRouteClusterEntity alloc];
    v25 = [(HDSQLiteEntity *)v24 initWithPersistentID:v74[3]];
  }

  _Block_object_dispose(&v73, 8);
  id v26 = v57;

  if (!v25)
  {
    if (v26)
    {
      if (a8)
      {
        v28 = 0;
        *a8 = v26;
      }
      else
      {
        _HKLogDroppedError();
        v28 = 0;
      }
      goto LABEL_9;
    }
    id v30 = v13;
    id v47 = v14;
    id v45 = v14;
    id v31 = v15;
    id v50 = v52;
    v44 = self;
    v32 = [v30 lastWorkoutUUID];
    v28 = +[HDWorkoutClusterEntity workoutEntityForUUID:v32 transaction:v31 error:a8];

    v48 = v31;
    v49 = v28;
    if (!v28)
    {
      v37 = v45;
      id v14 = v47;
LABEL_32:

      goto LABEL_9;
    }
    v33 = [v30 bestWorkoutUUID];
    v28 = +[HDWorkoutClusterEntity workoutEntityForUUID:v33 transaction:v31 error:a8];

    v34 = v28;
    if (!v28)
    {
      v37 = v45;
      id v14 = v47;
LABEL_31:

      goto LABEL_32;
    }
    v43 = v28;
    v35 = +[HDRaceRouteWorkoutEntity createRaceRouteWorkoutFromWorkout:v49 transaction:v31 profile:v50 error:a8];
    id v14 = v47;
    if (!v35)
    {
      v28 = 0;
      v37 = v45;
LABEL_30:

      v34 = v43;
      goto LABEL_31;
    }
    id v42 = v35;
    uint64_t v36 = [(HDSQLiteEntity *)v49 persistentID];
    if (v36 == [(HDSQLiteEntity *)v43 persistentID])
    {
      id v41 = v42;
      v37 = v45;
      v38 = v48;
    }
    else
    {
      v38 = v48;
      +[HDRaceRouteWorkoutEntity createRaceRouteWorkoutFromWorkout:v43 transaction:v48 profile:v50 error:a8];
      v37 = v45;
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      if (!v41)
      {
        v28 = 0;
LABEL_29:
        id v14 = v47;
        v35 = v42;
        goto LABEL_30;
      }
    }
    v39 = [v38 databaseForEntityClass:v44];
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x2020000000;
    uint64_t v76 = -1;
    uint64_t v68 = MEMORY[0x1E4F143A8];
    uint64_t v69 = 3221225472;
    v70 = __102__HDRaceRouteClusterEntity__insertRacingCluster_routeSnapshot_syncIdentity_transaction_profile_error___block_invoke;
    v71 = &unk_1E62F3640;
    v72 = &v73;
    v46 = v39;
    if ([v39 executeSQL:@"SELECT COALESCE(MAX(relevance_anchor) + 1,1) FROM RacePreviousRoute_concrete_cluster" error:a8 bindingHandler:0 enumerationHandler:&v68])
    {
      v40 = +[HDRaceRouteClusterEntity _baseEntityProperties]();
      uint64_t v58 = MEMORY[0x1E4F143A8];
      uint64_t v59 = 3221225472;
      v60 = __102__HDRaceRouteClusterEntity__insertRacingCluster_routeSnapshot_syncIdentity_transaction_profile_error___block_invoke_2;
      v61 = &unk_1E62FE220;
      id v62 = v30;
      id v63 = v42;
      id v64 = v41;
      id v65 = v37;
      v66 = &v73;
      int64_t v67 = a5;
      v28 = [v44 insertOrReplaceEntity:0 database:v46 properties:v40 error:a8 bindingHandler:&v58];
    }
    else
    {
      v28 = 0;
    }
    _Block_object_dispose(&v73, 8);

    goto LABEL_29;
  }
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __109__HDRaceRouteClusterEntity_insertOrUpdateRacingCluster_routeSnapshot_syncIdentity_transaction_profile_error___block_invoke;
  v53[3] = &unk_1E62F2DF0;
  id v54 = v14;
  id v55 = v13;
  v27 = v25;
  v56 = v27;
  v28 = 0;
  if ([v21 executeSQL:@"UPDATE RacePreviousRoute_concrete_cluster SET relevance_anchor = (SELECT COALESCE(MAX(relevance_anchor) + 1,1) FROM RacePreviousRoute_concrete_cluster),sync_anchor = (CASE WHEN snapshot_id = ? AND route_label = ? THEN sync_anchor ELSE (SELECT COALESCE(MAX(relevance_anchor) + 1,1) FROM RacePreviousRoute_concrete_cluster) END),relevance = ?,workout_cluster_uuid = ?,snapshot_id = ?,route_label = ?,modified_date = ? WHERE ROWID = ? AND (relevance != ? OR workout_cluster_uuid != ? OR snapshot_id != ? OR route_label != ?)" error:a8 bindingHandler:v53 enumerationHandler:0])v28 = v27; {

  }
LABEL_9:

  return v28;
}

void __109__HDRaceRouteClusterEntity_insertOrUpdateRacingCluster_routeSnapshot_syncIdentity_transaction_profile_error___block_invoke(id *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [a1[4] persistentID]);
  v4 = [a1[5] workoutRouteLabel];
  HDSQLiteBindFoundationValueToStatement();

  [a1[5] relevanceValue];
  sqlite3_bind_double(a2, 3, v5);
  v6 = [a1[5] workoutClusterUUID];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 5, [a1[4] persistentID]);
  v7 = [a1[5] workoutRouteLabel];
  HDSQLiteBindFoundationValueToStatement();

  v8 = [MEMORY[0x1E4F1C9C8] date];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 8, [a1[6] persistentID]);
  [a1[5] relevanceValue];
  sqlite3_bind_double(a2, 9, v9);
  v10 = [a1[5] workoutClusterUUID];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 11, [a1[4] persistentID]);
  id v11 = [a1[5] workoutRouteLabel];
  HDSQLiteBindFoundationValueToStatement();
}

+ (id)raceRouteClustersForActivityType:(unint64_t)a3 profile:(id)a4 error:(id *)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a4;
  id v10 = objc_alloc_init(v8);
  id v11 = [v9 database];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__HDRaceRouteClusterEntity_raceRouteClustersForActivityType_profile_error___block_invoke;
  v15[3] = &unk_1E62FE270;
  id v17 = a1;
  unint64_t v18 = a3;
  id v12 = v10;
  id v16 = v12;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v11 error:a5 block:v15];

  if (a5) {
    id v13 = (void *)[v12 copy];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

uint64_t __75__HDRaceRouteClusterEntity_raceRouteClustersForActivityType_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  double v5 = [v4 databaseForEntityClass:*(void *)(a1 + 40)];
  v6 = (void *)MEMORY[0x1E4F65D00];
  v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v8 = [v6 predicateWithProperty:@"workout_activity_type" equalToValue:v7];

  id v9 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"frozen" equalToValue:MEMORY[0x1E4F1CC38]];
  id v10 = (void *)MEMORY[0x1E4F65D08];
  v27[0] = v8;
  v27[1] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  id v12 = [v10 predicateMatchingAllPredicates:v11];

  id v13 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"relevance" entityClass:*(void *)(a1 + 40) ascending:0];
  id v14 = *(void **)(a1 + 40);
  uint64_t v15 = *MEMORY[0x1E4F65DE0];
  id v26 = v13;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  id v17 = [v14 queryWithDatabase:v5 predicate:v12 limit:v15 orderingTerms:v16 groupBy:0];

  unint64_t v18 = +[HDRaceRouteClusterEntity _baseEntityProperties]();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__HDRaceRouteClusterEntity_raceRouteClustersForActivityType_profile_error___block_invoke_2;
  v23[3] = &unk_1E62FE248;
  id v24 = v4;
  id v25 = *(id *)(a1 + 32);
  id v19 = v4;
  uint64_t v20 = [v17 enumeratePersistentIDsAndProperties:v18 error:a3 enumerationHandler:v23];

  return v20;
}

uint64_t __75__HDRaceRouteClusterEntity_raceRouteClustersForActivityType_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v7 = HDSQLiteColumnWithNameAsUUID();
  v8 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v38 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  double v10 = v9;
  uint64_t v37 = HDSQLiteColumnWithNameAsInt64();
  id v11 = HDSQLiteColumnWithNameAsUUID();
  id v12 = HDSQLiteColumnWithNameAsDate();
  HDSQLiteColumnWithNameAsDouble();
  double v14 = v13;
  HDSQLiteColumnWithNameAsDouble();
  double v16 = v15;
  id v42 = HDSQLiteColumnWithNameAsUUID();
  id v41 = HDSQLiteColumnWithNameAsDate();
  HDSQLiteColumnWithNameAsDouble();
  double v18 = v17;
  HDSQLiteColumnWithNameAsDouble();
  double v20 = v19;
  uint64_t v21 = HDSQLiteColumnWithNameAsInt64();
  id v22 = HDSQLiteColumnWithNameAsString();
  id v23 = [(HDSQLiteEntity *)[HDRaceRouteSnapshotEntity alloc] initWithPersistentID:v21];
  id v24 = [(HDRaceRouteSnapshotEntity *)v23 snapshotDataWithTransaction:*(void *)(a1 + 32) error:a5];
  if (v24)
  {
    v39 = v12;
    v40 = v11;
    id v25 = v8;
    id v26 = v7;
    uint64_t v27 = HDSQLiteColumnWithNameAsInt64();
    uint64_t v28 = *(void *)(a1 + 32);
    id v43 = 0;
    v29 = +[HDRaceRouteWorkoutEntity startingPointForWorkoutWithPersistentID:v27 transaction:v28 error:&v43];
    id v30 = v43;
    id v31 = v30;
    if (v29) {
      BOOL v32 = 1;
    }
    else {
      BOOL v32 = v30 == 0;
    }
    uint64_t v33 = v32;
    if (v32)
    {
      v34 = *(void **)(a1 + 40);
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2B3E0]), "_initWithUUID:workoutClusterUUID:clusterSize:relevanceValue:workoutActivityType:lastWorkoutUUID:lastWorkoutDate:lastWorkoutDistance:lastWorkoutDuration:lastWorkoutStartingPoint:bestWorkoutUUID:bestWorkoutDate:bestWorkoutDistance:bestWorkoutDuration:workoutRouteSnapshot:workoutRouteLabel:", v26, v25, v38, v37, v40, v39, v10, v14, v16, v18, v20, v29, v42, v41, v24,
                      v22);
      [v34 addObject:v35];
    }
    else if (a5)
    {
      *a5 = v30;
    }
    else
    {
      _HKLogDroppedError();
    }

    v7 = v26;
    v8 = v25;
    id v12 = v39;
    id v11 = v40;
  }
  else
  {
    uint64_t v33 = 0;
  }

  return v33;
}

+ (BOOL)pruneRaceRouteClustersWithEligibleEntities:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  double v9 = objc_msgSend(a3, "hk_map:", &__block_literal_global_84);
  double v10 = [MEMORY[0x1E4F65D10] doesNotContainPredicateWithProperty:@"ROWID" values:v9];
  if (+[HDRaceRouteClusterEntity _deleteClusterBackingDataWithPredicate:transaction:error:]((uint64_t)a1, v10, v8, (uint64_t)a5))
  {
    id v11 = [v8 databaseForEntityClass:a1];
    char v12 = [a1 deleteEntitiesInDatabase:v11 predicate:v10 error:a5];
    id v20 = 0;
    BOOL v13 = +[HDRaceRouteWorkoutEntity pruneWorkoutsMarkedForDeletionInTransaction:v8 error:&v20];
    id v14 = v20;
    if (!v13)
    {
      _HKInitializeLogging();
      double v15 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        double v17 = v15;
        double v18 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v22 = v18;
        __int16 v23 = 2114;
        id v24 = v14;
        id v19 = v18;
        _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to prune workouts marked for deletion: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

uint64_t __89__HDRaceRouteClusterEntity_pruneRaceRouteClustersWithEligibleEntities_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 persistentID];

  return [v2 numberWithLongLong:v3];
}

+ (uint64_t)_deleteClusterBackingDataWithPredicate:(void *)a3 transaction:(uint64_t)a4 error:
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a2;
  id v8 = self;
  double v9 = [v6 databaseForEntityClass:v8];
  double v10 = [v8 queryWithDatabase:v9 predicate:v7];

  v17[0] = @"last_workout_rowid";
  v17[1] = @"best_workout_rowid";
  v17[2] = @"snapshot_id";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__HDRaceRouteClusterEntity__deleteClusterBackingDataWithPredicate_transaction_error___block_invoke;
  v15[3] = &unk_1E62FE2E0;
  id v16 = v6;
  id v12 = v6;
  uint64_t v13 = [v10 enumerateProperties:v11 error:a4 enumerationHandler:v15];

  return v13;
}

+ (BOOL)enumerateRoutePointsForClusterUUID:(id)a3 workoutSelection:(unint64_t)a4 timestampAnchor:(double)a5 limit:(unint64_t)a6 profile:(id)a7 error:(id *)a8 dataHandler:(id)a9
{
  return +[HDRaceRouteClusterEntity _enumerateRoutePointsForClusterUUID:workoutSelection:timestampAnchor:limit:startDuration:finishDuration:profile:error:dataHandler:](a5, 0.0, 0.0, (uint64_t)a1, a3, a4, a6, a7, (uint64_t)a8, a9);
}

+ (uint64_t)_enumerateRoutePointsForClusterUUID:(double)a3 workoutSelection:(uint64_t)a4 timestampAnchor:(void *)a5 limit:(uint64_t)a6 startDuration:(uint64_t)a7 finishDuration:(void *)a8 profile:(uint64_t)a9 error:(void *)a10 dataHandler:
{
  id v18 = a5;
  id v19 = a10;
  id v20 = a8;
  uint64_t v21 = self;
  id v22 = [v20 database];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __158__HDRaceRouteClusterEntity__enumerateRoutePointsForClusterUUID_workoutSelection_timestampAnchor_limit_startDuration_finishDuration_profile_error_dataHandler___block_invoke;
  void v27[3] = &unk_1E62FE358;
  id v30 = v21;
  uint64_t v31 = a6;
  double v32 = a1;
  uint64_t v33 = a7;
  double v34 = a2;
  double v35 = a3;
  id v28 = v18;
  id v29 = v19;
  id v23 = v19;
  id v24 = v18;
  uint64_t v25 = [v21 performReadTransactionWithHealthDatabase:v22 error:a9 block:v27];

  return v25;
}

+ (BOOL)unitTest_deleteAllClusterAndBackingDataInTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[HDRaceRouteClusterEntity _deleteClusterBackingDataWithPredicate:transaction:error:]((uint64_t)a1, 0, v6, (uint64_t)a4))
  {
    id v7 = [v6 databaseForEntityClass:a1];
    if (+[HDSQLiteEntity deleteEntitiesInDatabase:v7 predicate:0 error:a4])
    {
      char v8 = [a1 deleteEntitiesInDatabase:v7 predicate:0 error:a4];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (HDRaceRouteClusterEntity)_entityForClusterUUID:(void *)a3 database:(void *)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  self;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = -1;
  id v20 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__HDRaceRouteClusterEntity__entityForClusterUUID_database_error___block_invoke;
  v18[3] = &unk_1E62F43C8;
  id v8 = v6;
  id v19 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__HDRaceRouteClusterEntity__entityForClusterUUID_database_error___block_invoke_2;
  v17[3] = &unk_1E62F3640;
  void v17[4] = &v21;
  int v9 = [v7 executeSQL:@"SELECT ROWID FROM RacePreviousRoute_concrete_cluster WHERE uuid = ?" error:&v20 bindingHandler:v18 enumerationHandler:v17];
  id v10 = v20;
  id v11 = v10;
  if (v9 && v22[3] == -1 && !v10)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 118, @"Racing cluster (%@) not found", v8);
  }
  else
  {
    id v12 = v10;
    uint64_t v13 = v12;
    if (v12)
    {
      if (a4) {
        *a4 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    if (!v9) {
      goto LABEL_12;
    }
  }
  if ((v22[3] & 0x8000000000000000) == 0)
  {
    id v14 = [HDRaceRouteClusterEntity alloc];
    double v15 = [(HDSQLiteEntity *)v14 initWithPersistentID:v22[3]];
    goto LABEL_13;
  }
LABEL_12:
  double v15 = 0;
LABEL_13:

  _Block_object_dispose(&v21, 8);

  return v15;
}

uint64_t __65__HDRaceRouteClusterEntity__entityForClusterUUID_database_error___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __65__HDRaceRouteClusterEntity__entityForClusterUUID_database_error___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __85__HDRaceRouteClusterEntity__entityForLastWorkoutUUID_bestWorkoutUUID_database_error___block_invoke()
{
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __85__HDRaceRouteClusterEntity__entityForLastWorkoutUUID_bestWorkoutUUID_database_error___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

void __69__HDRaceRouteClusterEntity__workoutIDForSelection_transaction_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = v12;
  if (v7 != 1)
  {
    if (v7 != 2) {
      goto LABEL_5;
    }
    id v8 = v5;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = v8;
  id v11 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v10;

LABEL_5:
}

- (uint64_t)_fetchWorkoutIDsWithTransaction:(uint64_t)a3 error:(void *)a4 handler:
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__77;
  uint64_t v24 = __Block_byref_object_dispose__77;
  id v25 = 0;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = __Block_byref_object_copy__77;
  id v18 = __Block_byref_object_dispose__77;
  id v19 = 0;
  uint64_t v9 = [v7 databaseForEntity:a1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__HDRaceRouteClusterEntity__fetchWorkoutIDsWithTransaction_error_handler___block_invoke;
  v13[3] = &unk_1E62F43C8;
  v13[4] = a1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__HDRaceRouteClusterEntity__fetchWorkoutIDsWithTransaction_error_handler___block_invoke_2;
  v12[3] = &unk_1E62F5978;
  v12[4] = &v20;
  v12[5] = &v14;
  uint64_t v10 = [v9 executeSQL:@"SELECT last_workout_rowid, best_workout_rowid FROM RacePreviousRoute_concrete_cluster WHERE ROWID = ?", a3, v13, v12 error bindingHandler enumerationHandler];

  v8[2](v8, v21[5], v15[5]);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

uint64_t __85__HDRaceRouteClusterEntity__deleteClusterBackingDataWithPredicate_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!+[HDRaceRouteWorkoutEntity markForDeletionWorkoutDataWithPersistentID:transaction:error:](HDRaceRouteWorkoutEntity, "markForDeletionWorkoutDataWithPersistentID:transaction:error:", HDSQLiteColumnAsInt64(), *(void *)(a1 + 32), a4)|| !+[HDRaceRouteWorkoutEntity markForDeletionWorkoutDataWithPersistentID:HDSQLiteColumnAsInt64() transaction:*(void *)(a1 + 32) error:a4])
  {
    return 0;
  }
  id v6 = [(HDSQLiteEntity *)[HDRaceRouteSnapshotEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  uint64_t v7 = [(HDRaceRouteSnapshotEntity *)v6 deleteDataWithTransaction:*(void *)(a1 + 32) error:a4];

  return v7;
}

uint64_t __59__HDRaceRouteClusterEntity__isFrozenWithTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __59__HDRaceRouteClusterEntity__isFrozenWithTransaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = MEMORY[0x1C1879F00](a2, 0);
  return 0;
}

uint64_t __102__HDRaceRouteClusterEntity__applyIncrementalChangeWithRelevance_workoutClusterUUID_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_double(a2, 1, *(double *)(a1 + 48));
  HDSQLiteBindFoundationValueToStatement();
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_int64 v5 = [*(id *)(a1 + 40) persistentID];

  return sqlite3_bind_int64(a2, 4, v5);
}

uint64_t __97__HDRaceRouteClusterEntity__applyIncrementalChangeWithRouteLabel_snapshotData_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 40) persistentID]);
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_int64 v5 = [*(id *)(a1 + 48) persistentID];

  return sqlite3_bind_int64(a2, 4, v5);
}

void __57__HDRaceRouteClusterEntity__freezeWithTransaction_error___block_invoke()
{
}

void __99__HDRaceRouteClusterEntity__insertCodableLastRoutePoints_codableBestRoutePoints_transaction_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t __107__HDRaceRouteClusterEntity__pruneRaceRouteClustersFromWorkoutClusterUUID_eligibleEntity_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = [*(id *)(a1 + 40) persistentID];

  return sqlite3_bind_int64(a2, 2, v4);
}

BOOL __107__HDRaceRouteClusterEntity__pruneRaceRouteClustersFromWorkoutClusterUUID_eligibleEntity_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnAsInt64();
  uint64_t v6 = HDSQLiteColumnAsInt64();
  BOOL result = +[HDRaceRouteWorkoutEntity markForDeletionWorkoutDataWithPersistentID:v5 transaction:*(void *)(a1 + 32) error:a3];
  if (result)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    return +[HDRaceRouteWorkoutEntity markForDeletionWorkoutDataWithPersistentID:v6 transaction:v8 error:a3];
  }
  return result;
}

uint64_t __107__HDRaceRouteClusterEntity__pruneRaceRouteClustersFromWorkoutClusterUUID_eligibleEntity_transaction_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = [*(id *)(a1 + 40) persistentID];

  return sqlite3_bind_int64(a2, 2, v4);
}

uint64_t __74__HDRaceRouteClusterEntity__fetchWorkoutIDsWithTransaction_error_handler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __74__HDRaceRouteClusterEntity__fetchWorkoutIDsWithTransaction_error_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithLongLong:HDSQLiteColumnAsInt64()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  sqlite3_int64 v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [NSNumber numberWithLongLong:HDSQLiteColumnAsInt64()];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return 0;
}

BOOL __158__HDRaceRouteClusterEntity__enumerateRoutePointsForClusterUUID_workoutSelection_timestampAnchor_limit_startDuration_finishDuration_profile_error_dataHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 databaseForEntityClass:*(void *)(a1 + 48)];
  uint64_t v7 = +[HDRaceRouteClusterEntity _entityForClusterUUID:database:error:](*(void *)(a1 + 48), *(void **)(a1 + 32), v6, a3);
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = v5;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__77;
    uint64_t v27 = __Block_byref_object_dispose__77;
    id v28 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __69__HDRaceRouteClusterEntity__workoutIDForSelection_transaction_error___block_invoke;
    v22[3] = &unk_1E62FE2B8;
    v22[4] = &v23;
    v22[5] = v8;
    if (-[HDRaceRouteClusterEntity _fetchWorkoutIDsWithTransaction:error:handler:]((uint64_t)v7, v9, (uint64_t)a3, v22))uint64_t v10 = (void *)v24[5]; {
    else
    }
      uint64_t v10 = 0;
    id v12 = v10;
    _Block_object_dispose(&v23, 8);

    if (v12)
    {
      uint64_t v13 = [v12 longLongValue];
      double v14 = *(double *)(a1 + 64);
      uint64_t v15 = *(void *)(a1 + 72);
      double v16 = *(double *)(a1 + 80);
      double v17 = *(double *)(a1 + 88);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __158__HDRaceRouteClusterEntity__enumerateRoutePointsForClusterUUID_workoutSelection_timestampAnchor_limit_startDuration_finishDuration_profile_error_dataHandler___block_invoke_2;
      v19[3] = &unk_1E62FE330;
      double v21 = v16;
      id v20 = *(id *)(a1 + 40);
      BOOL v11 = +[HDRaceRouteWorkoutEntity enumerateRoutePointsForWorkoutPersistentID:v13 timestampAnchor:v15 limit:v9 startDuration:a3 finishDuration:v19 transaction:v14 error:v16 handler:v17];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __158__HDRaceRouteClusterEntity__enumerateRoutePointsForClusterUUID_workoutSelection_timestampAnchor_limit_startDuration_finishDuration_profile_error_dataHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1E650];
  id v4 = a2;
  id v5 = [v3 alloc];
  objc_msgSend(v4, "latitude_deg");
  double v7 = v6;
  objc_msgSend(v4, "longitude_deg");
  double v9 = v8;
  objc_msgSend(v4, "altitude_m");
  double v11 = v10;
  objc_msgSend(v4, "odometer_m");
  double v13 = v12;
  objc_msgSend(v4, "timestamp_s");
  double v15 = v14 - *(double *)(a1 + 40);
  uint64_t v16 = [v4 signalEnvironmentType];

  double v17 = (void *)[v5 initWithLatitude:v16 longitude:v7 altitude:v9 odometer:v11 timestamp:v13 signalEnvironmentType:v15];
  uint64_t v18 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v18;
}

+ (id)databaseTable
{
  return @"RacePreviousRoute_concrete_cluster";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 24;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_43;
}

+ (id)uniquedColumns
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"uuid";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F65D20]) initWithEntityClass:objc_opt_class() property:@"ROWID" deletionAction:0 isDeferred:1];
  id v5 = @"snapshot_id";
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)privateSubEntities
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (id)propertyForSyncAnchor
{
  return @"relevance_anchor";
}

+ (id)insertCodableCluster:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  double v13 = (void *)MEMORY[0x1E4F29128];
  double v14 = [v11 uuid];
  v85 = objc_msgSend(v13, "hk_UUIDWithData:", v14);

  v84 = [v12 databaseForEntityClass:a1];
  id v95 = 0;
  +[HDRaceRouteClusterEntity _entityForClusterUUID:database:error:]((uint64_t)a1, v85, v84, &v95);
  double v15 = (void (*)(uint64_t))objc_claimAutoreleasedReturnValue();
  id v16 = v95;
  v81 = v16;
  if (!v15)
  {
    if (objc_msgSend(v16, "hk_isObjectNotFoundError"))
    {
      double v21 = [v11 lastWorkoutMetrics];
      v78 = [v11 bestWorkoutMetrics];
      if (v21 && v78)
      {
        v77 = +[HDRaceRouteWorkoutEntity insertCodableRacingMetrics:v21 transaction:v12 error:a7];
        if (v77)
        {
          uint64_t v22 = [v21 workoutUUID];
          uint64_t v23 = [v78 workoutUUID];
          int v24 = [v22 isEqualToData:v23];

          if (v24)
          {
            objc_msgSend(v11, "routeSnapshot", v77);
            v60 = LABEL_47:;
            v61 = +[HDRaceRouteSnapshotEntity insertSnapshotData:v60 transaction:v12 error:a7];

            if (v61)
            {
              id v62 = +[HDRaceRouteClusterEntity _baseEntityProperties]();
              v86[0] = MEMORY[0x1E4F143A8];
              v86[1] = 3221225472;
              v86[2] = __95__HDRaceRouteClusterEntity_insertCodableCluster_syncProvenance_syncIdentity_transaction_error___block_invoke;
              v86[3] = &unk_1E62FE5C0;
              id v87 = v11;
              id v88 = v21;
              id v89 = v77;
              id v90 = v78;
              id v91 = v76;
              id v92 = v61;
              int64_t v93 = a4;
              int64_t v94 = a5;
              double v15 = [a1 insertOrReplaceEntity:0 database:v84 properties:v62 error:a7 bindingHandler:v86];

              BOOL v63 = v15 == 0;
            }
            else
            {
              double v15 = 0;
              BOOL v63 = 1;
            }

LABEL_56:
            if (!v63) {
              goto LABEL_57;
            }
LABEL_53:
            id v43 = 0;
            goto LABEL_68;
          }
          uint64_t v76 = +[HDRaceRouteWorkoutEntity insertCodableRacingMetrics:v78 transaction:v12 error:a7];
          if (v76)
          {
            objc_msgSend(v11, "routeSnapshot", v76);
            goto LABEL_47;
          }
        }
        double v15 = 0;
        BOOL v63 = 1;
        goto LABEL_56;
      }
      _HKInitializeLogging();
      id v57 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_ERROR, "Resetting received sync anchors due to last or best metric being nil.", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 1403, @"Last or best metric is nil.");
      id v58 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v59 = v58;
      if (v58)
      {
        if (a7) {
          *a7 = v58;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    else
    {
      id v51 = v81;
      id v52 = v51;
      if (v51)
      {
        if (a7) {
          *a7 = v51;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    double v15 = 0;
    goto LABEL_53;
  }
  id v17 = v12;
  uint64_t v96 = 0;
  uint64_t v97 = (uint64_t)&v96;
  uint64_t v98 = 0x2020000000;
  LOBYTE(v99) = 0;
  uint64_t v18 = [v17 databaseForEntity:v15];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __59__HDRaceRouteClusterEntity__isFrozenWithTransaction_error___block_invoke;
  v109 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62F43C8;
  v110 = v15;
  uint64_t v102 = MEMORY[0x1E4F143A8];
  uint64_t v103 = 3221225472;
  uint64_t v104 = (uint64_t)__59__HDRaceRouteClusterEntity__isFrozenWithTransaction_error___block_invoke_2;
  v105 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62F3640;
  v106 = (void (*)(uint64_t))&v96;
  int v19 = [v18 executeSQL:@"SELECT frozen FROM RacePreviousRoute_concrete_cluster WHERE ROWID = ?" error:a7 bindingHandler:buf enumerationHandler:&v102];

  if (v19)
  {
    id v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(v97 + 24)];
  }
  else
  {
    id v20 = 0;
  }
  _Block_object_dispose(&v96, 8);

  if (!v20) {
    goto LABEL_37;
  }
  if ([v20 BOOLValue])
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F29128];
    id v26 = [v11 workoutClusterUUID];
    uint64_t v27 = objc_msgSend(v25, "hk_UUIDWithData:", v26);

    _HKInitializeLogging();
    id v28 = (os_log_t *)MEMORY[0x1E4F29FB8];
    id v29 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v85;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v27;
      _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "Updating relevance value for re-synced cluster UUID: %{public}@ (workout cluster %{public}@)", buf, 0x16u);
    }
    [v11 relevance];
    uint64_t v31 = v30;
    id v32 = v27;
    uint64_t v33 = [v17 databaseForEntity:v15];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __102__HDRaceRouteClusterEntity__applyIncrementalChangeWithRelevance_workoutClusterUUID_transaction_error___block_invoke;
    v109 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62F9A10;
    v112 = v31;
    double v34 = (void (*)(uint64_t))v32;
    v110 = v34;
    v111 = v15;
    LODWORD(v32) = [v33 executeSQL:@"UPDATE RacePreviousRoute_concrete_cluster SET relevance = ?,workout_cluster_uuid = ?,modified_date = ? WHERE ROWID = ?" error:a7 bindingHandler:buf enumerationHandler:0];

    if (v32)
    {
      if (![v11 hasRouteSnapshot] || !objc_msgSend(v11, "hasRouteLabel")) {
        goto LABEL_22;
      }
      _HKInitializeLogging();
      double v35 = *v28;
      if (os_log_type_enabled(*v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v85;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v34;
        _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "Updating route snapshot/label for re-synced cluster UUID: %{public}@ (workout cluster %{public}@)", buf, 0x16u);
      }
      uint64_t v36 = [v11 routeLabel];
      v79 = [v11 routeSnapshot];
      id v37 = v36;
      id v38 = v17;
      v39 = +[HDRaceRouteSnapshotEntity insertSnapshotData:v79 transaction:v38 error:a7];
      if (v39)
      {
        v40 = [v38 databaseForEntity:v15];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __97__HDRaceRouteClusterEntity__applyIncrementalChangeWithRouteLabel_snapshotData_transaction_error___block_invoke;
        v109 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62F2DF0;
        id v41 = (void (*)(uint64_t))v37;
        v110 = v41;
        id v42 = v39;
        v111 = v42;
        v112 = v15;
        int v83 = [v40 executeSQL:@"UPDATE RacePreviousRoute_concrete_cluster SET route_label = ?,snapshot_id = ?,modified_date = ? WHERE ROWID = ?" error:a7 bindingHandler:buf enumerationHandler:0];

        if (v83)
        {
LABEL_22:
          id v43 = v15;
LABEL_66:

          goto LABEL_67;
        }
      }
      else
      {
      }
    }
    id v43 = 0;
    goto LABEL_66;
  }
  v80 = [v11 lastWorkoutMetrics];
  v44 = [v80 routePoints];
  id v45 = [v11 bestWorkoutMetrics];
  v46 = [v45 routePoints];
  id v47 = v44;
  id v48 = v46;
  id v49 = v17;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v109 = __Block_byref_object_copy__77;
  v110 = __Block_byref_object_dispose__77;
  v111 = 0;
  uint64_t v102 = 0;
  uint64_t v103 = (uint64_t)&v102;
  uint64_t v104 = 0x3032000000;
  v105 = __Block_byref_object_copy__77;
  v106 = __Block_byref_object_dispose__77;
  v107 = 0;
  uint64_t v96 = MEMORY[0x1E4F143A8];
  uint64_t v97 = 3221225472;
  uint64_t v98 = (uint64_t)__99__HDRaceRouteClusterEntity__insertCodableLastRoutePoints_codableBestRoutePoints_transaction_error___block_invoke;
  v99 = &unk_1E62FE308;
  v100 = buf;
  v101 = &v102;
  if ((-[HDRaceRouteClusterEntity _fetchWorkoutIDsWithTransaction:error:handler:]((uint64_t)v15, v49, (uint64_t)a7, &v96) & 1) == 0
    || [v47 count]
    && !+[HDRaceRouteWorkoutEntity insertCodableRoutePoints:workoutPersistentID:transaction:error:](HDRaceRouteWorkoutEntity, "insertCodableRoutePoints:workoutPersistentID:transaction:error:", v47, [*(id *)(*(void *)&buf[8] + 40) longLongValue], v49, a7))
  {
    goto LABEL_32;
  }
  if (![v48 count]
    || +[HDRaceRouteWorkoutEntity insertCodableRoutePoints:workoutPersistentID:transaction:error:](HDRaceRouteWorkoutEntity, "insertCodableRoutePoints:workoutPersistentID:transaction:error:", v48, [*(id *)(v103 + 40) longLongValue], v49, a7))
  {
    int v50 = 1;
  }
  else
  {
LABEL_32:
    int v50 = 0;
  }
  _Block_object_dispose(&v102, 8);

  _Block_object_dispose(buf, 8);
  if (!v50) {
    goto LABEL_37;
  }
  if ([v11 final])
  {
    *(void *)buf = @"frozen";
    v53 = (void *)MEMORY[0x1E4F1C978];
    id v54 = v49;
    id v55 = [v53 arrayWithObjects:buf count:1];
    v56 = [v54 databaseForEntity:v15];

    LOBYTE(v54) = [v15 updateProperties:v55 database:v56 error:a7 bindingHandler:&__block_literal_global_398];
    if ((v54 & 1) == 0)
    {
LABEL_37:
      id v43 = 0;
LABEL_67:

      goto LABEL_68;
    }
  }

  if (!objc_msgSend(v11, "final", v76)) {
    goto LABEL_62;
  }
LABEL_57:
  id v64 = (void *)MEMORY[0x1E4F29128];
  id v65 = [v11 workoutClusterUUID];
  v66 = objc_msgSend(v64, "hk_UUIDWithData:", v65);

  id v67 = v66;
  uint64_t v68 = v15;
  id v69 = v12;
  v70 = [v69 databaseForEntityClass:self];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __107__HDRaceRouteClusterEntity__pruneRaceRouteClustersFromWorkoutClusterUUID_eligibleEntity_transaction_error___block_invoke;
  v109 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62F2900;
  v71 = (void (*)(uint64_t))v67;
  v110 = v71;
  v72 = v68;
  v111 = v72;
  uint64_t v96 = MEMORY[0x1E4F143A8];
  uint64_t v97 = 3221225472;
  uint64_t v98 = (uint64_t)__107__HDRaceRouteClusterEntity__pruneRaceRouteClustersFromWorkoutClusterUUID_eligibleEntity_transaction_error___block_invoke_2;
  v99 = &unk_1E62F3D38;
  uint64_t v73 = v69;
  v100 = v73;
  if ([v70 executeSQL:@"SELECT last_workout_rowid, best_workout_rowid FROM RacePreviousRoute_concrete_cluster WHERE workout_cluster_uuid = ? AND ROWID != ?", a7, buf, &v96 error bindingHandler enumerationHandler])
  {
    uint64_t v102 = MEMORY[0x1E4F143A8];
    uint64_t v103 = 3221225472;
    uint64_t v104 = (uint64_t)__107__HDRaceRouteClusterEntity__pruneRaceRouteClustersFromWorkoutClusterUUID_eligibleEntity_transaction_error___block_invoke_3;
    v105 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62F2900;
    v106 = v71;
    v107 = v72;
    int v74 = [v70 executeSQL:@"DELETE FROM RacePreviousRoute_concrete_cluster WHERE workout_cluster_uuid = ? AND ROWID != ?" error:a7 bindingHandler:&v102 enumerationHandler:0];
  }
  else
  {
    int v74 = 0;
  }

  if (!v74)
  {
    id v43 = 0;
    double v15 = v72;
  }
  else
  {
LABEL_62:
    double v15 = v15;
    id v43 = v15;
  }
LABEL_68:

  return v43;
}

void __95__HDRaceRouteClusterEntity_insertCodableCluster_syncProvenance_syncIdentity_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) uuid];
  MEMORY[0x1C1879E30](a2, @"uuid", v4);

  id v5 = [*(id *)(a1 + 32) workoutClusterUUID];
  MEMORY[0x1C1879E30](a2, @"workout_cluster_uuid", v5);

  [*(id *)(a1 + 32) relevance];
  MEMORY[0x1C1879E50](a2, @"relevance");
  MEMORY[0x1C1879E80](a2, @"workout_activity_type", (int)[*(id *)(a1 + 32) activityType]);
  MEMORY[0x1C1879E80](a2, @"workout_cluster_size", (int)[*(id *)(a1 + 32) clusterSize]);
  double v6 = [*(id *)(a1 + 40) workoutUUID];
  MEMORY[0x1C1879E30](a2, @"last_workout_uuid", v6);

  [*(id *)(a1 + 40) startDate];
  MEMORY[0x1C1879E50](a2, @"last_workout_date");
  [*(id *)(a1 + 40) distance];
  MEMORY[0x1C1879E50](a2, @"last_workout_distance");
  [*(id *)(a1 + 40) duration];
  MEMORY[0x1C1879E50](a2, @"last_workout_duration");
  MEMORY[0x1C1879E80](a2, @"last_workout_rowid", [*(id *)(a1 + 48) persistentID]);
  double v7 = [*(id *)(a1 + 56) workoutUUID];
  MEMORY[0x1C1879E30](a2, @"best_workout_uuid", v7);

  [*(id *)(a1 + 56) startDate];
  MEMORY[0x1C1879E50](a2, @"best_workout_date");
  [*(id *)(a1 + 56) distance];
  MEMORY[0x1C1879E50](a2, @"best_workout_distance");
  [*(id *)(a1 + 56) duration];
  MEMORY[0x1C1879E50](a2, @"best_workout_duration");
  MEMORY[0x1C1879E80](a2, @"best_workout_rowid", [*(id *)(a1 + 64) persistentID]);
  MEMORY[0x1C1879E80](a2, @"snapshot_id", [*(id *)(a1 + 72) persistentID]);
  double v8 = [*(id *)(a1 + 32) routeLabel];
  MEMORY[0x1C1879EC0](a2, @"route_label", v8);

  double v9 = [MEMORY[0x1E4F1C9C8] date];
  MEMORY[0x1C1879E40](a2, @"modified_date", v9);

  MEMORY[0x1C1879E80](a2, @"sync_provenance", *(void *)(a1 + 80));
  MEMORY[0x1C1879E20](a2, @"frozen", [*(id *)(a1 + 32) final]);
  MEMORY[0x1C1879E80](a2, @"sync_anchor", 0);
  MEMORY[0x1C1879E80](a2, @"relevance_anchor", 0);

  JUMPOUT(0x1C1879E80);
}

+ (id)entityForClusterUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  double v9 = [a4 databaseForEntityClass:a1];
  double v10 = +[HDRaceRouteClusterEntity _entityForClusterUUID:database:error:]((uint64_t)a1, v8, v9, a5);

  return v10;
}

uint64_t __79__HDRaceRouteClusterEntity__enumerateClusterUUIDsForProfile_error_dataHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__HDRaceRouteClusterEntity__enumerateClusterUUIDsForProfile_error_dataHandler___block_invoke_2;
  v8[3] = &unk_1E62F33D0;
  id v9 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 executeSQL:@"SELECT uuid FROM RacePreviousRoute_concrete_cluster" error:a3 bindingHandler:0 enumerationHandler:v8];

  return v6;
}

uint64_t __79__HDRaceRouteClusterEntity__enumerateClusterUUIDsForProfile_error_dataHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1C1879F20](a2, 0);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:@"RacePreviousRoute" entity:1];
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [a5 database];
  int64_t v12 = [a1 nextSyncAnchorWithStartAnchor:a4 predicate:0 session:v10 healthDatabase:v11 error:a6];

  return v12;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v37 = v12;
  uint64_t v15 = [v12 maxEncodedBytesPerChangeSetForSyncEntityClass:a1];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v67[3] = 0;
  uint64_t v63 = 0;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  int64_t v58 = start;
  self;
  id v17 = +[HDRaceRouteClusterEntity _baseEntityProperties]();
  uint64_t v68 = @"modified_date";
  uint64_t v69 = @"sync_provenance";
  v70 = (uint64_t (*)(uint64_t, void *, uint64_t))@"frozen";
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:3];
  v39 = [v17 arrayByExcludingObjectsInArray:v18];

  int v19 = [v39 componentsJoinedByString:@","];
  id v20 = [v13 database];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v42[3] = &unk_1E62FE660;
  id v51 = a1;
  id v21 = v19;
  id v43 = v21;
  id v47 = &v55;
  int64_t v52 = start;
  int64_t v53 = end;
  id v48 = &v59;
  id v22 = v13;
  id v44 = v22;
  id v49 = v67;
  id v23 = v16;
  id v45 = v23;
  int v50 = &v63;
  uint64_t v54 = v15;
  id v24 = v14;
  id v46 = v24;
  int v25 = [a1 performReadTransactionWithHealthDatabase:v20 error:a7 block:v42];

  if (!*((unsigned char *)v60 + 24))
  {
    if (v25) {
      goto LABEL_8;
    }
LABEL_10:
    char v35 = 0;
    goto LABEL_11;
  }
  id v26 = objc_alloc_init(HDCodableRacingCluster);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_5;
  v40[3] = &unk_1E62FE688;
  uint64_t v27 = v26;
  id v41 = v27;
  id v28 = v40;
  id v29 = v22;
  id v30 = self;
  uint64_t v31 = [v29 database];

  uint64_t v68 = (__CFString *)MEMORY[0x1E4F143A8];
  uint64_t v69 = 3221225472;
  v70 = __79__HDRaceRouteClusterEntity__enumerateClusterUUIDsForProfile_error_dataHandler___block_invoke;
  v71 = &unk_1E62FE5E8;
  id v72 = v28;
  uint64_t v73 = v30;
  id v32 = v28;
  LOBYTE(v28) = [v30 performReadTransactionWithHealthDatabase:v31 error:a7 block:&v68];

  if ((v28 & 1) == 0)
  {

    goto LABEL_10;
  }
  uint64_t v33 = [(HDCodableRacingCluster *)v27 eligibleClusterUUIDs];
  BOOL v34 = [v33 count] == 0;

  if (!v34) {
    [v23 addObject:v27];
  }

  if ((v25 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  char v35 = [v24 sendCodableChange:v23 resultAnchor:v56[3] sequence:v64[3] done:1 error:a7];
LABEL_11:

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(v67, 8);

  return v35;
}

uint64_t __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 databaseForEntityClass:*(void *)(a1 + 96)];
  double v7 = [NSString stringWithFormat:@"SELECT %@ FROM RacePreviousRoute_concrete_cluster WHERE relevance_anchor > %lld AND relevance_anchor <= %lld ORDER BY relevance_anchor ASC", *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(a1 + 112)];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v16[3] = &unk_1E62FE638;
  long long v8 = *(_OWORD *)(a1 + 104);
  int8x16_t v21 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
  long long v24 = v8;
  uint64_t v25 = *(void *)(a1 + 96);
  id v17 = v5;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 80);
  id v18 = v9;
  uint64_t v22 = v10;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 88);
  id v19 = v11;
  uint64_t v23 = v12;
  uint64_t v26 = *(void *)(a1 + 120);
  id v20 = *(id *)(a1 + 56);
  id v13 = v5;
  uint64_t v14 = [v6 executeSQL:v7 error:a3 bindingHandler:0 enumerationHandler:v16];

  return v14;
}

BOOL __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  uint64_t v4 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v5 = *(void *)(a1 + 96);
  self;
  uint64_t v6 = objc_alloc_init(HDCodableRacingCluster);
  double v7 = HDSQLiteColumnWithNameAsData();
  [(HDCodableRacingCluster *)v6 setUuid:v7];

  long long v8 = HDSQLiteColumnWithNameAsData();
  [(HDCodableRacingCluster *)v6 setWorkoutClusterUUID:v8];

  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableRacingCluster setRelevance:](v6, "setRelevance:");
  if (v4 > v5)
  {
    [(HDCodableRacingCluster *)v6 setActivityType:HDSQLiteColumnWithNameAsInt64()];
    [(HDCodableRacingCluster *)v6 setClusterSize:HDSQLiteColumnWithNameAsInt64()];
    id v9 = objc_alloc_init(HDCodableRacingMetrics);
    uint64_t v10 = HDSQLiteColumnWithNameAsData();
    [(HDCodableRacingMetrics *)v9 setWorkoutUUID:v10];

    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableRacingMetrics setStartDate:](v9, "setStartDate:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableRacingMetrics setDistance:](v9, "setDistance:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableRacingMetrics setDuration:](v9, "setDuration:");
    [(HDCodableRacingCluster *)v6 setLastWorkoutMetrics:v9];
    id v11 = objc_alloc_init(HDCodableRacingMetrics);
    uint64_t v12 = HDSQLiteColumnWithNameAsData();
    [(HDCodableRacingMetrics *)v11 setWorkoutUUID:v12];

    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableRacingMetrics setStartDate:](v11, "setStartDate:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableRacingMetrics setDistance:](v11, "setDistance:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableRacingMetrics setDuration:](v11, "setDuration:");
    [(HDCodableRacingCluster *)v6 setBestWorkoutMetrics:v11];
    id v13 = HDSQLiteColumnWithNameAsString();
    [(HDCodableRacingCluster *)v6 setRouteLabel:v13];
  }
  uint64_t v15 = *(void **)(a1 + 32);
  uint64_t v14 = *(void **)(a1 + 40);
  id v16 = v6;
  id v17 = v14;
  id v18 = v15;
  self;
  uint64_t v19 = HDSQLiteColumnWithNameAsInt64();
  id v20 = [v17 syncIdentityManager];

  int8x16_t v21 = [v20 identityForEntityID:v19 transaction:v18 error:a3];

  if (!v21)
  {

    BOOL v73 = 0;
    goto LABEL_42;
  }
  uint64_t v22 = [v21 identity];
  uint64_t v23 = [v22 codableSyncIdentity];
  [(HDCodableRacingCluster *)v16 setSyncIdentity:v23];

  if (v4 <= v5)
  {
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += [(PBCodable *)v16 encodedByteCount];
    [*(id *)(a1 + 48) addObject:v16];
    BOOL v73 = 1;
    goto LABEL_42;
  }
  long long v24 = (void *)MEMORY[0x1E4F29128];
  uint64_t v25 = [(HDCodableRacingCluster *)v16 uuid];
  uint64_t v26 = objc_msgSend(v24, "hk_UUIDWithData:", v25);

  uint64_t v27 = [(HDSQLiteEntity *)[HDRaceRouteSnapshotEntity alloc] initWithPersistentID:HDSQLiteColumnWithNameAsInt64()];
  id v28 = [(HDRaceRouteSnapshotEntity *)v27 snapshotDataWithTransaction:*(void *)(a1 + 32) error:a3];
  v78 = v27;
  if (!v28)
  {
    BOOL v73 = 0;
    goto LABEL_41;
  }
  v80 = v26;
  v77 = v28;
  [(HDCodableRacingCluster *)v16 setRouteSnapshot:v28];
  uint64_t v105 = 0;
  v106 = (double *)&v105;
  uint64_t v107 = 0x2020000000;
  unint64_t v108 = 0xBFF0000000000000;
  uint64_t v101 = 0;
  uint64_t v102 = (double *)&v101;
  uint64_t v103 = 0x2020000000;
  unint64_t v104 = 0xBFF0000000000000;
  id v29 = (void *)MEMORY[0x1E4F29128];
  v81 = v16;
  id v30 = [(HDCodableRacingCluster *)v16 bestWorkoutMetrics];
  uint64_t v31 = [v30 workoutUUID];
  uint64_t v32 = objc_msgSend(v29, "hk_UUIDWithData:", v31);

  uint64_t v33 = *(void *)(a1 + 32);
  BOOL v34 = [*(id *)(a1 + 40) metadataManager];
  char v35 = +[HDRaceRouteClusterWorkout clusterWorkoutWithWorkoutUUID:v32 transaction:v33 metadataManager:v34 error:a3];
  uint64_t v76 = (void *)v32;

  if (!v35)
  {
    BOOL v73 = 0;
    uint64_t v26 = v80;
    goto LABEL_40;
  }
  uint64_t v36 = (void *)MEMORY[0x1E4F29128];
  id v37 = [(HDCodableRacingCluster *)v16 lastWorkoutMetrics];
  id v38 = [v37 workoutUUID];
  uint64_t v39 = objc_msgSend(v36, "hk_UUIDWithData:", v38);

  uint64_t v40 = *(void *)(a1 + 32);
  id v41 = [*(id *)(a1 + 40) metadataManager];
  id v42 = +[HDRaceRouteClusterWorkout clusterWorkoutWithWorkoutUUID:v39 transaction:v40 metadataManager:v41 error:a3];
  uint64_t v75 = (void *)v39;

  uint64_t v26 = v80;
  if (!v42)
  {
    BOOL v73 = 0;
    goto LABEL_39;
  }
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
  v79 = v42;
  while (1)
  {
    id v43 = (void *)[(HDCodableRacingCluster *)v16 copy];
    uint64_t v44 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v45 = [v43 encodedByteCount];
    uint64_t v46 = *(void *)(a1 + 112);
    uint64_t v47 = *(void *)(a1 + 120) - v45 - v44;
    if (v47 >= 150) {
      uint64_t v48 = v47 / 50;
    }
    else {
      uint64_t v48 = 2;
    }
    uint64_t v97 = 0;
    uint64_t v98 = &v97;
    uint64_t v99 = 0x2020000000;
    uint64_t v100 = 0;
    double v49 = v102[3];
    [v42 startDuration];
    double v51 = v50;
    [v42 finishDuration];
    double v53 = v52;
    unint64_t v54 = vcvtpd_u64_f64((double)v48 * 0.5);
    uint64_t v55 = *(void **)(a1 + 40);
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3;
    v92[3] = &unk_1E62FE610;
    int64_t v94 = &v97;
    unint64_t v96 = v54;
    id v56 = v43;
    id v93 = v56;
    id v95 = &v101;
    if ((+[HDRaceRouteClusterEntity _enumerateRoutePointsForClusterUUID:workoutSelection:timestampAnchor:limit:startDuration:finishDuration:profile:error:dataHandler:](v49, v51, v53, v46, v26, 1, v54 + 1, v55, a3, v92) & 1) == 0)
    {
      int v65 = 1;
      char v64 = 1;
      goto LABEL_29;
    }
    uint64_t v57 = v35;
    uint64_t v88 = 0;
    id v89 = &v88;
    uint64_t v90 = 0x2020000000;
    uint64_t v91 = 0;
    int64_t v58 = [v56 lastWorkoutMetrics];
    uint64_t v59 = [v58 workoutUUID];
    v60 = [v56 bestWorkoutMetrics];
    uint64_t v61 = [v60 workoutUUID];
    int v62 = [v59 isEqualToData:v61];

    if (v62)
    {
      uint64_t v63 = v98;
    }
    else
    {
      uint64_t v66 = *(void *)(a1 + 112);
      double v67 = v106[3];
      char v35 = v57;
      [v57 startDuration];
      uint64_t v26 = v80;
      double v69 = v68;
      [v57 finishDuration];
      double v71 = v70;
      id v72 = *(void **)(a1 + 40);
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_4;
      v83[3] = &unk_1E62FE610;
      v85 = &v88;
      unint64_t v87 = v54;
      id v84 = v56;
      v86 = &v105;
      LODWORD(v72) = +[HDRaceRouteClusterEntity _enumerateRoutePointsForClusterUUID:workoutSelection:timestampAnchor:limit:startDuration:finishDuration:profile:error:dataHandler:](v67, v69, v71, v66, v80, 2, v54 + 1, v72, a3, v83);

      if (!v72)
      {
        int v65 = 1;
        char v64 = 1;
        goto LABEL_26;
      }
      if (v98[3] > v54)
      {
LABEL_20:
        char v64 = 1;
        goto LABEL_21;
      }
      uint64_t v63 = v89;
    }
    if (v63[3] > v54) {
      goto LABEL_20;
    }
    [v56 setFinal:1];
    char v64 = 0;
LABEL_21:
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += [v56 encodedByteCount];
    [*(id *)(a1 + 48) addObject:v56];
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) > *(void *)(a1 + 120))
    {
      id v42 = v79;
      uint64_t v26 = v80;
      char v35 = v57;
      if ([*(id *)(a1 + 56) sendCodableChange:*(void *)(a1 + 48) resultAnchor:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) sequence:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) done:0 error:a3])
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
        [*(id *)(a1 + 48) removeAllObjects];
        int v65 = 0;
      }
      else
      {
        int v65 = 1;
      }
      goto LABEL_28;
    }
    int v65 = 0;
    uint64_t v26 = v80;
    char v35 = v57;
LABEL_26:
    id v42 = v79;
LABEL_28:
    _Block_object_dispose(&v88, 8);
LABEL_29:

    _Block_object_dispose(&v97, 8);
    BOOL v73 = v65 == 0;
    if (v65) {
      break;
    }
    id v16 = v81;
    if ((v64 & 1) == 0) {
      goto LABEL_39;
    }
  }
  id v16 = v81;
LABEL_39:

LABEL_40:
  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);
  id v28 = v77;
LABEL_41:

LABEL_42:
  return v73;
}

uint64_t __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3(uint64_t a1, void *a2)
{
  if (++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) <= *(void *)(a1 + 56))
  {
    uint64_t v3 = [a2 codableRepresentationForSync];
    uint64_t v4 = [*(id *)(a1 + 32) lastWorkoutMetrics];
    [v4 addRoutePoints:v3];

    [v3 timestamp];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
  }
  return 1;
}

uint64_t __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_4(uint64_t a1, void *a2)
{
  if (++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) <= *(void *)(a1 + 56))
  {
    uint64_t v3 = [a2 codableRepresentationForSync];
    uint64_t v4 = [*(id *)(a1 + 32) bestWorkoutMetrics];
    [v4 addRoutePoints:v3];

    [v3 timestamp];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
  }
  return 1;
}

uint64_t __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[HDCodableRacingCluster alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = -[HDInsertRacingClustersOperation initWithClusters:provenance:]([HDInsertRacingClustersOperation alloc], "initWithClusters:provenance:", v11, [a5 syncProvenance]);

  LODWORD(a7) = [(HDJournalableOperation *)v12 performOrJournalWithProfile:v10 error:a7];
  return a7 ^ 1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return [a3 syncStoreType] == 1;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 1;
}

@end