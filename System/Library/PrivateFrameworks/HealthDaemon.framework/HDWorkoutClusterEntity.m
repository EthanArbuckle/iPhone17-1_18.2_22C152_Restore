@interface HDWorkoutClusterEntity
+ (BOOL)deleteWorkoutClusterWithUUID:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)updateWorkoutClusterWithUUID:(id)a3 relevanceValue:(id)a4 lastWorkoutUUID:(id)a5 bestWorkoutUUID:(id)a6 workoutUUIDsToAssociate:(id)a7 workoutUUIDsToRemove:(id)a8 profile:(id)a9 error:(id *)a10;
+ (BOOL)updateWorkoutClusterWithUUID:(id)a3 routeLabel:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)updateWorkoutClusterWithUUID:(id)a3 routeSnapshot:(id)a4 profile:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_baseEntityProperties;
+ (id)_clusterModelForSQLiteRow:(void *)a3 database:(uint64_t)a4 error:;
+ (id)_workoutClusterEntityForUUID:(void *)a3 database:(void *)a4 error:;
+ (id)_workoutEntityForUUID:(void *)a3 database:(void *)a4 error:;
+ (id)_workoutUUIDForPersistentID:(void *)a3 database:(uint64_t)a4 error:;
+ (id)clusterEntitiesWithTransaction:(id)a3 limit:(unint64_t)a4 error:(id *)a5;
+ (id)clusterUUIDsForWorkoutUUIDs:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)entityForClusterUUID:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)foreignKeys;
+ (id)insertWorkoutCluster:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)privateSubEntities;
+ (id)uniquedColumns;
+ (id)workoutClusterContainingWorkoutUUID:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)workoutClustersForProfile:(id)a3 limit:(unint64_t)a4 error:(id *)a5;
+ (id)workoutEntityForUUID:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)workoutUUIDsForClusterUUID:(id)a3 profile:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
- (BOOL)modelPropertiesWithTransaction:(id)a3 error:(id *)a4 handler:(id)a5;
- (id)numberOfWorkoutsWithTransaction:(id)a3 error:(id *)a4;
- (id)snapshotEntityWithTransaction:(id)a3 error:(id *)a4;
- (id)workoutRouteSnapshotWithTransaction:(id)a3 error:(id *)a4;
- (id)workoutUUIDsWithTransaction:(id)a3 error:(id *)a4;
- (uint64_t)_associateWorkoutUUIDs:(void *)a3 transaction:(void *)a4 error:;
@end

@implementation HDWorkoutClusterEntity

+ (id)entityForClusterUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [a4 databaseForEntityClass:a1];
  v10 = +[HDWorkoutClusterEntity _workoutClusterEntityForUUID:database:error:]((uint64_t)a1, v8, v9, a5);

  return v10;
}

+ (id)_workoutClusterEntityForUUID:(void *)a3 database:(void *)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  self;
  id v8 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"uuid" equalToValue:v6];
  id v14 = 0;
  uint64_t v9 = +[HDSQLiteEntity anyInDatabase:v7 predicate:v8 error:&v14];

  unint64_t v10 = (unint64_t)v14;
  v11 = (void *)v10;
  if (v9 | v10)
  {
    id v12 = (id)v10;
    if (v11)
    {
      if (a4) {
        *a4 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 118, @"Cluster (%@) not found", v6);
  }

  return (id)v9;
}

+ (id)insertWorkoutCluster:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__208;
  v25 = __Block_byref_object_dispose__208;
  id v26 = 0;
  unint64_t v10 = [v9 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__HDWorkoutClusterEntity_insertWorkoutCluster_profile_error___block_invoke;
  v16[3] = &unk_1E62FC0B8;
  id v20 = a1;
  id v11 = v8;
  id v17 = v11;
  v19 = &v21;
  id v12 = v9;
  id v18 = v12;
  LODWORD(a5) = [a1 performWriteTransactionWithHealthDatabase:v10 error:a5 block:v16];

  if (a5) {
    v13 = (void *)v22[5];
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  _Block_object_dispose(&v21, 8);

  return v14;
}

uint64_t __61__HDWorkoutClusterEntity_insertWorkoutCluster_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:*(void *)(a1 + 56)];
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = [*(id *)(a1 + 32) lastWorkoutUUID];
  id v9 = +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:](v7, v8, v6, a3);

  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 56);
    id v11 = [*(id *)(a1 + 32) bestWorkoutUUID];
    id v12 = +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:](v10, v11, v6, a3);

    if (v12)
    {
      v13 = [*(id *)(a1 + 32) workoutRouteSnapshot];
      id v14 = +[HDRaceRouteSnapshotEntity insertSnapshotData:v13 transaction:v5 error:a3];

      v15 = +[HDWorkoutClusterEntity _baseEntityProperties]();
      v16 = [v15 arrayByAddingObject:@"snapshot_id"];

      id v17 = *(void **)(a1 + 56);
      id v18 = [*(id *)(a1 + 40) database];
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __61__HDWorkoutClusterEntity_insertWorkoutCluster_profile_error___block_invoke_2;
      v30 = &unk_1E6303CA0;
      id v31 = *(id *)(a1 + 32);
      id v32 = v9;
      id v33 = v12;
      id v19 = v14;
      id v34 = v19;
      uint64_t v20 = [v17 insertOrReplaceEntity:0 healthDatabase:v18 properties:v16 error:a3 bindingHandler:&v27];
      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
      v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v23)
      {
        v24 = objc_msgSend(*(id *)(a1 + 32), "workoutUUIDs", v27, v28, v29, v30, v31, v32, v33);
        uint64_t v25 = -[HDWorkoutClusterEntity _associateWorkoutUUIDs:transaction:error:](v23, v24, v5, a3);
      }
      else
      {
        uint64_t v25 = 0;
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

+ (id)_workoutEntityForUUID:(void *)a3 database:(void *)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  self;
  id v8 = HDDataEntityPredicateForDataUUID();
  id v13 = 0;
  uint64_t v9 = +[HDDataEntity anyInDatabase:v7 predicate:v8 error:&v13];

  unint64_t v10 = (unint64_t)v13;
  if (v9 | v10)
  {
    id v11 = (id)v10;
    if (v10)
    {
      if (a4) {
        *a4 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 118, @"Workout (%@) not found", v6);
  }

  return (id)v9;
}

+ (id)_baseEntityProperties
{
  v2[6] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"uuid";
  v2[1] = @"relevance";
  v2[2] = @"last_workout_id";
  v2[3] = @"best_workout_id";
  v2[4] = @"route_label";
  v2[5] = @"modified_date";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];

  return v0;
}

void __61__HDWorkoutClusterEntity_insertWorkoutCluster_profile_error___block_invoke_2(id *a1, uint64_t a2)
{
  v4 = [a1[4] clusterUUID];
  MEMORY[0x1C1879EF0](a2, @"uuid", v4);

  [a1[4] relevanceValue];
  MEMORY[0x1C1879E50](a2, @"relevance");
  MEMORY[0x1C1879E80](a2, @"last_workout_id", [a1[5] persistentID]);
  MEMORY[0x1C1879E80](a2, @"best_workout_id", [a1[6] persistentID]);
  MEMORY[0x1C1879E80](a2, @"snapshot_id", [a1[7] persistentID]);
  id v5 = [a1[4] workoutRouteLabel];
  MEMORY[0x1C1879EC0](a2, @"route_label", v5);

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  MEMORY[0x1C1879E40](a2, @"modified_date", v6);
}

- (uint64_t)_associateWorkoutUUIDs:(void *)a3 transaction:(void *)a4 error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v14 = v8;
        id v15 = v13;
        v16 = [v14 databaseForEntity:a1];
        id v17 = +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:]((uint64_t)HDWorkoutClusterEntity, v15, v16, a4);

        if (!v17)
        {

LABEL_13:
          uint64_t v19 = 0;
          goto LABEL_14;
        }
        BOOL v18 = +[HDWorkoutClusterComponentEntity associateWorkout:v17 withCluster:a1 transaction:v14 error:a4];

        if (!v18) {
          goto LABEL_13;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v19 = 1;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v19 = 1;
  }
LABEL_14:

  return v19;
}

+ (id)clusterEntitiesWithTransaction:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a3;
  id v10 = objc_alloc_init(v8);
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT ROWID FROM RacePreviousRoute_workout_cluster ORDER BY relevance DESC LIMIT %lu", a4);
  id v12 = [v9 databaseForEntityClass:a1];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__HDWorkoutClusterEntity_clusterEntitiesWithTransaction_limit_error___block_invoke;
  v16[3] = &unk_1E62F3D38;
  id v13 = v10;
  id v17 = v13;
  LODWORD(v10) = [v12 executeSQL:v11 error:a5 bindingHandler:0 enumerationHandler:v16];

  id v14 = 0;
  if (v10) {
    id v14 = (void *)[v13 copy];
  }

  return v14;
}

uint64_t __69__HDWorkoutClusterEntity_clusterEntitiesWithTransaction_limit_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [(HDSQLiteEntity *)[HDWorkoutClusterEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  [v1 addObject:v2];

  return 1;
}

+ (id)workoutClustersForProfile:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a3;
  id v10 = objc_alloc_init(v8);
  uint64_t v11 = [v9 database];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__HDWorkoutClusterEntity_workoutClustersForProfile_limit_error___block_invoke;
  v15[3] = &unk_1E62FE270;
  id v17 = a1;
  unint64_t v18 = a4;
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

uint64_t __64__HDWorkoutClusterEntity_workoutClustersForProfile_limit_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  id v6 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"relevance" entityClass:*(void *)(a1 + 40) ascending:0];
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v20[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v10 = [v7 queryWithDatabase:v5 predicate:0 limit:v8 orderingTerms:v9 groupBy:0];

  uint64_t v11 = +[HDWorkoutClusterEntity _baseEntityProperties]();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__HDWorkoutClusterEntity_workoutClustersForProfile_limit_error___block_invoke_2;
  v17[3] = &unk_1E62F7B80;
  id v18 = v5;
  long long v16 = *(_OWORD *)(a1 + 32);
  id v12 = (id)v16;
  long long v19 = v16;
  id v13 = v5;
  uint64_t v14 = [v10 enumeratePersistentIDsAndProperties:v11 error:a3 enumerationHandler:v17];

  return v14;
}

BOOL __64__HDWorkoutClusterEntity_workoutClustersForProfile_limit_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = +[HDWorkoutClusterEntity _clusterModelForSQLiteRow:database:error:](*(void *)(a1 + 48), a4, *(void **)(a1 + 32), a5);
  if (v6) {
    [*(id *)(a1 + 40) addObject:v6];
  }

  return v6 != 0;
}

+ (id)_clusterModelForSQLiteRow:(void *)a3 database:(uint64_t)a4 error:
{
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v8 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v9 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  double v11 = v10;
  id v12 = HDSQLiteColumnWithNameAsString();
  id v13 = +[HDWorkoutClusterEntity _workoutUUIDForPersistentID:database:error:](v6, v8, v5, a4);
  if (v13)
  {
    uint64_t v14 = +[HDWorkoutClusterEntity _workoutUUIDForPersistentID:database:error:](v6, v9, v5, a4);
    if (v14) {
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F2B750]) _initWithUUID:v7 workoutUUIDs:0 lastWorkoutUUID:v13 bestWorkoutUUID:v14 relevanceValue:0 workoutRouteSnapshot:v12 workoutRouteLabel:v11];
    }
    else {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)workoutClusterContainingWorkoutUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__208;
  long long v23 = __Block_byref_object_dispose__208;
  id v24 = 0;
  double v10 = [v9 database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__HDWorkoutClusterEntity_workoutClusterContainingWorkoutUUID_profile_error___block_invoke;
  v15[3] = &unk_1E62F6778;
  id v18 = a1;
  id v11 = v8;
  id v16 = v11;
  id v17 = &v19;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v10 error:a5 block:v15];

  if (a5) {
    id v12 = (void *)v20[5];
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);

  return v13;
}

uint64_t __76__HDWorkoutClusterEntity_workoutClusterContainingWorkoutUUID_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  uint64_t v6 = +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:](*(void *)(a1 + 48), *(void **)(a1 + 32), v5, a3);
  id v7 = v6;
  if (v6)
  {
    v29 = a3;
    uint64_t v27 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "persistentID"));
    id v8 = (void *)MEMORY[0x1E4F65D38];
    id v9 = [*(id *)(a1 + 48) databaseTable];
    uint64_t v28 = [v8 innerJoinClauseFromTable:v9 toTargetEntity:objc_opt_class() as:0 localReference:*MEMORY[0x1E4F65C70] targetKey:@"cluster_id"];

    double v10 = (void *)MEMORY[0x1E4F65D40];
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v28, 0);
    id v12 = [v10 predicateWithJoinClauses:v11];

    id v13 = (void *)MEMORY[0x1E4F65D78];
    uint64_t v14 = NSString;
    id v15 = +[HDWorkoutClusterComponentEntity databaseTable];
    id v16 = [v14 stringWithFormat:@"%@.%@ = ?", v15, @"workout_id", 0];
    v34[0] = v27;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    id v18 = [v13 predicateWithSQL:v16 overProperties:MEMORY[0x1E4F1CBF0] values:v17];

    uint64_t v19 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v12 otherPredicate:v18];
    uint64_t v20 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"modified_date" entityClass:*(void *)(a1 + 48) ascending:0];
    uint64_t v21 = *(void **)(a1 + 48);
    id v33 = v20;
    long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    long long v23 = [v21 queryWithDatabase:v5 predicate:v19 limit:1 orderingTerms:v22 groupBy:0];

    id v24 = +[HDWorkoutClusterEntity _baseEntityProperties]();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __76__HDWorkoutClusterEntity_workoutClusterContainingWorkoutUUID_profile_error___block_invoke_2;
    v30[3] = &unk_1E62F7BA8;
    long long v32 = *(_OWORD *)(a1 + 40);
    id v31 = v5;
    uint64_t v25 = [v23 enumeratePersistentIDsAndProperties:v24 error:v29 enumerationHandler:v30];
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

BOOL __76__HDWorkoutClusterEntity_workoutClusterContainingWorkoutUUID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = +[HDWorkoutClusterEntity _clusterModelForSQLiteRow:database:error:](*(void *)(a1 + 48), a4, *(void **)(a1 + 32), a5);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)clusterUUIDsForWorkoutUUIDs:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  id v12 = [v10 database];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__HDWorkoutClusterEntity_clusterUUIDsForWorkoutUUIDs_profile_error___block_invoke;
  v17[3] = &unk_1E62F4200;
  id v20 = a1;
  id v18 = v8;
  id v13 = v11;
  id v19 = v13;
  id v14 = v8;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v12 error:a5 block:v17];

  if (a5) {
    id v15 = (void *)[v13 copy];
  }
  else {
    id v15 = 0;
  }

  return v15;
}

uint64_t __68__HDWorkoutClusterEntity_clusterUUIDsForWorkoutUUIDs_profile_error___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v20 = [a2 databaseForEntityClass:a1[6]];
  id v18 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v17 = [a1[6] databaseTable];
  id v16 = [a1[6] databaseTable];
  v4 = +[HDWorkoutClusterComponentEntity databaseTable];
  id v5 = [a1[6] databaseTable];
  uint64_t v6 = *MEMORY[0x1E4F65C70];
  uint64_t v7 = +[HDDataEntity databaseTable];
  id v8 = +[HDDataEntity databaseTable];
  id v9 = +[HDDataEntity databaseTable];
  id v10 = objc_msgSend(v18, "initWithFormat:", @"SELECT %@.%@ FROM %@ INNER JOIN %@ ON %@.%@ = %@ INNER JOIN %@ ON %@.%@ = %@ WHERE %@.%@ IN ("), v17, CFSTR("uuid"), v16, v4, v5, v6, CFSTR("cluster_id"), v7, v8, CFSTR("data_id"), CFSTR("workout_id"), v9, CFSTR("uuid"), 0;

  if ([a1[4] count])
  {
    unint64_t v11 = 0;
    id v12 = @"?";
    do
    {
      [v10 appendFormat:v12];
      ++v11;
      unint64_t v13 = [a1[4] count];
      id v12 = @",?";
    }
    while (v13 > v11);
  }
  [v10 appendString:@""]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __68__HDWorkoutClusterEntity_clusterUUIDsForWorkoutUUIDs_profile_error___block_invoke_2;
  v23[3] = &unk_1E62F43C8;
  id v24 = a1[4];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__HDWorkoutClusterEntity_clusterUUIDsForWorkoutUUIDs_profile_error___block_invoke_3;
  v21[3] = &unk_1E62F3D38;
  id v22 = a1[5];
  uint64_t v14 = [v20 executeUncachedSQL:v10 error:a3 bindingHandler:v23 enumerationHandler:v21];

  return v14;
}

uint64_t __68__HDWorkoutClusterEntity_clusterUUIDsForWorkoutUUIDs_profile_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValuesToStatement();
}

uint64_t __68__HDWorkoutClusterEntity_clusterUUIDsForWorkoutUUIDs_profile_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1C1879F90](a2, 0);
  [v2 addObject:v3];

  return 1;
}

+ (id)workoutEntityForUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 databaseForEntityClass:a1];
  id v10 = +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:]((uint64_t)HDWorkoutClusterEntity, v8, v9, a5);

  return v10;
}

+ (id)workoutUUIDsForClusterUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__208;
  long long v23 = __Block_byref_object_dispose__208;
  id v24 = 0;
  id v10 = [v9 database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HDWorkoutClusterEntity_workoutUUIDsForClusterUUID_profile_error___block_invoke;
  v15[3] = &unk_1E62F6778;
  id v18 = a1;
  id v11 = v8;
  id v16 = v11;
  id v17 = &v19;
  LODWORD(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v10 error:a5 block:v15];

  if (a5) {
    id v12 = (void *)v20[5];
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);

  return v13;
}

BOOL __67__HDWorkoutClusterEntity_workoutUUIDsForClusterUUID_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 databaseForEntityClass:*(void *)(a1 + 48)];
  uint64_t v7 = +[HDWorkoutClusterEntity _workoutClusterEntityForUUID:database:error:](*(void *)(a1 + 48), *(void **)(a1 + 32), v6, a3);
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 workoutUUIDsWithTransaction:v5 error:a3];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    BOOL v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)workoutUUIDsWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [v6 databaseForEntity:self];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __60__HDWorkoutClusterEntity_workoutUUIDsWithTransaction_error___block_invoke;
  id v16 = &unk_1E630ECB8;
  id v9 = v8;
  id v17 = v9;
  id v10 = v7;
  id v18 = v10;
  if (self
    && +[HDWorkoutClusterComponentEntity enumerateWorkoutsForCluster:self transaction:v6 error:a4 block:&v13])
  {
    id v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16, v17, v18);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

BOOL __60__HDWorkoutClusterEntity_workoutUUIDsWithTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = +[HDWorkoutClusterEntity _workoutUUIDForPersistentID:database:error:]((uint64_t)HDWorkoutClusterEntity, [a2 persistentID], *(void **)(a1 + 32), a3);
  if (v4) {
    [*(id *)(a1 + 40) addObject:v4];
  }

  return v4 != 0;
}

+ (id)_workoutUUIDForPersistentID:(void *)a3 database:(uint64_t)a4 error:
{
  id v6 = a3;
  self;
  id v7 = [NSNumber numberWithLongLong:a2];
  id v8 = HDDataEntityPredicateForRowID((uint64_t)v7, 1);

  id v9 = +[HDSQLiteEntity propertyValueForAnyInDatabase:v6 property:@"uuid" predicate:v8 error:a4];

  id v10 = _HDUUIDForSQLiteValue();

  return v10;
}

+ (BOOL)updateWorkoutClusterWithUUID:(id)a3 routeSnapshot:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = [a5 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_routeSnapshot_profile_error___block_invoke;
  v16[3] = &unk_1E62F4200;
  id v18 = v11;
  id v19 = a1;
  id v17 = v10;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v16];

  return (char)a6;
}

uint64_t __83__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_routeSnapshot_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:*(void *)(a1 + 48)];
  id v7 = +[HDWorkoutClusterEntity _workoutClusterEntityForUUID:database:error:](*(void *)(a1 + 48), *(void **)(a1 + 32), v6, a3);
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 snapshotEntityWithTransaction:v5 error:a3];
    id v10 = v9;
    if (v9) {
      uint64_t v11 = [v9 updateSnapshotData:*(void *)(a1 + 40) transaction:v5 error:a3];
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (BOOL)updateWorkoutClusterWithUUID:(id)a3 routeLabel:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = [a5 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_routeLabel_profile_error___block_invoke;
  v16[3] = &unk_1E62F4200;
  id v18 = v11;
  id v19 = a1;
  id v17 = v10;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v16];

  return (char)a6;
}

uint64_t __80__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_routeLabel_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  id v6 = +[HDWorkoutClusterEntity _workoutClusterEntityForUUID:database:error:](*(void *)(a1 + 48), *(void **)(a1 + 32), v5, a3);
  if (v6)
  {
    v12[0] = @"route_label";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_routeLabel_profile_error___block_invoke_2;
    v10[3] = &unk_1E62F35C8;
    id v11 = *(id *)(a1 + 40);
    uint64_t v8 = [v6 updateProperties:v7 database:v5 error:a3 bindingHandler:v10];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __80__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_routeLabel_profile_error___block_invoke_2()
{
}

+ (BOOL)updateWorkoutClusterWithUUID:(id)a3 relevanceValue:(id)a4 lastWorkoutUUID:(id)a5 bestWorkoutUUID:(id)a6 workoutUUIDsToAssociate:(id)a7 workoutUUIDsToRemove:(id)a8 profile:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = [a9 database];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __161__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_relevanceValue_lastWorkoutUUID_bestWorkoutUUID_workoutUUIDsToAssociate_workoutUUIDsToRemove_profile_error___block_invoke;
  v30[3] = &unk_1E630ED08;
  id v36 = v21;
  id v37 = a1;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v34 = v19;
  id v35 = v20;
  id v23 = v21;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  id v27 = v17;
  id v28 = v16;
  LOBYTE(a1) = [a1 performWriteTransactionWithHealthDatabase:v22 error:a10 block:v30];

  return (char)a1;
}

uint64_t __161__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_relevanceValue_lastWorkoutUUID_bestWorkoutUUID_workoutUUIDsToAssociate_workoutUUIDsToRemove_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:*(void *)(a1 + 80)];
  id v7 = +[HDWorkoutClusterEntity _workoutClusterEntityForUUID:database:error:](*(void *)(a1 + 80), *(void **)(a1 + 32), v6, a3);
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v9 = v8;
    if (*(void *)(a1 + 40)) {
      [v8 appendFormat:@", %@ = ?", @"relevance"];
    }
    if (*(void *)(a1 + 48))
    {
      [v9 appendFormat:@", %@ = ?", @"last_workout_id"];
      id v10 = +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:](*(void *)(a1 + 80), *(void **)(a1 + 48), v6, a3);
      if (!v10
        || !+[HDWorkoutClusterComponentEntity associateWorkout:v10 withCluster:v7 transaction:v5 error:a3])
      {
        uint64_t v11 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      id v10 = 0;
    }
    if (*(void *)(a1 + 56))
    {
      [v9 appendFormat:@", %@ = ?", @"best_workout_id"];
      BOOL v12 = +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:](*(void *)(a1 + 80), *(void **)(a1 + 56), v6, a3);
      if (!v12
        || !+[HDWorkoutClusterComponentEntity associateWorkout:v12 withCluster:v7 transaction:v5 error:a3])
      {
        uint64_t v11 = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
    id v13 = NSString;
    id v14 = [*(id *)(a1 + 80) databaseTable];
    uint64_t v15 = [v13 stringWithFormat:@"UPDATE %@ SET %@ = ?%@ WHERE %@ = ?", v14, @"modified_date", v9, *MEMORY[0x1E4F65C70]];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    void v34[2] = __161__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_relevanceValue_lastWorkoutUUID_bestWorkoutUUID_workoutUUIDsToAssociate_workoutUUIDsToRemove_profile_error___block_invoke_2;
    v34[3] = &unk_1E630ECE0;
    id v35 = *(id *)(a1 + 40);
    id v36 = v10;
    id v30 = v12;
    id v37 = v30;
    id v16 = v7;
    id v38 = v16;
    v29 = (void *)v15;
    if ([v6 executeUncachedSQL:v15 error:a3 bindingHandler:v34 enumerationHandler:0]&& -[HDWorkoutClusterEntity _associateWorkoutUUIDs:transaction:error:]((uint64_t)v16, *(void **)(a1 + 64), v5, a3))
    {
      id v17 = *(id *)(a1 + 72);
      id v33 = v5;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id obj = v17;
      uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v32)
      {
        uint64_t v31 = *(void *)v40;
        id v26 = v10;
        id v27 = v9;
        while (2)
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v40 != v31) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            id v20 = v33;
            id v21 = v19;
            id v22 = [v20 databaseForEntity:v16];
            id v23 = +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:]((uint64_t)HDWorkoutClusterEntity, v21, v22, a3);

            if (!v23)
            {

LABEL_30:
              uint64_t v11 = 0;
              id v10 = v26;
              id v9 = v27;
              goto LABEL_31;
            }
            BOOL v24 = +[HDWorkoutClusterComponentEntity removeWorkout:v23 fromCluster:v16 transaction:v20 error:a3];

            if (!v24) {
              goto LABEL_30;
            }
          }
          uint64_t v11 = 1;
          id v10 = v26;
          id v9 = v27;
          uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
          if (v32) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v11 = 1;
      }
LABEL_31:
    }
    else
    {
      uint64_t v11 = 0;
    }

    BOOL v12 = v30;
    goto LABEL_33;
  }
  uint64_t v11 = 0;
LABEL_35:

  return v11;
}

uint64_t __161__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_relevanceValue_lastWorkoutUUID_bestWorkoutUUID_workoutUUIDsToAssociate_workoutUUIDsToRemove_profile_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, 1, v4);
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    [v5 doubleValue];
    sqlite3_bind_double(a2, 2, v6);
    int v7 = 3;
  }
  else
  {
    int v7 = 2;
  }
  id v8 = *(void **)(a1 + 40);
  if (v8) {
    sqlite3_bind_int64(a2, v7++, [v8 persistentID]);
  }
  id v9 = *(void **)(a1 + 48);
  if (v9) {
    sqlite3_bind_int64(a2, v7++, [v9 persistentID]);
  }
  sqlite3_int64 v10 = [*(id *)(a1 + 56) persistentID];

  return sqlite3_bind_int64(a2, v7, v10);
}

+ (BOOL)deleteWorkoutClusterWithUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __69__HDWorkoutClusterEntity_deleteWorkoutClusterWithUUID_profile_error___block_invoke;
  v12[3] = &unk_1E62F9068;
  id v13 = v8;
  id v14 = a1;
  id v10 = v8;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v9 error:a5 block:v12];

  return (char)a5;
}

uint64_t __69__HDWorkoutClusterEntity_deleteWorkoutClusterWithUUID_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"uuid" equalToValue:*(void *)(a1 + 32)];
  id v7 = v5;
  id v8 = v6;
  id v9 = self;
  id v10 = [v7 databaseForEntityClass:v9];
  uint64_t v11 = [v9 queryWithDatabase:v10 predicate:v8];

  v21[0] = @"snapshot_id";
  BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__HDWorkoutClusterEntity__deleteClusterBackingDataWithPredicate_transaction_error___block_invoke;
  v19[3] = &unk_1E62FE2E0;
  id v20 = v7;
  id v13 = v7;
  int v14 = [v11 enumerateProperties:v12 error:a3 enumerationHandler:v19];

  if (v14)
  {
    uint64_t v15 = *(void **)(a1 + 40);
    id v16 = [v13 databaseForEntityClass:v15];
    uint64_t v17 = [v15 deleteEntitiesInDatabase:v16 predicate:v8 error:a3];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)snapshotEntityWithTransaction:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = -1;
  v17[0] = @"snapshot_id";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v8 = [v6 databaseForEntity:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __62__HDWorkoutClusterEntity_snapshotEntityWithTransaction_error___block_invoke;
  v12[3] = &unk_1E62F8848;
  void v12[4] = &v13;
  LOBYTE(a4) = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v12];

  if (a4)
  {
    id v9 = [HDRaceRouteSnapshotEntity alloc];
    id v10 = [(HDSQLiteEntity *)v9 initWithPersistentID:v14[3]];
  }
  else
  {
    id v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __62__HDWorkoutClusterEntity_snapshotEntityWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t result = HDSQLiteColumnWithNameAsInt64();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)modelPropertiesWithTransaction:(id)a3 error:(id *)a4 handler:(id)a5
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 databaseForEntity:self];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v22[0] = @"uuid";
  v22[1] = @"last_workout_id";
  v22[2] = @"best_workout_id";
  v22[3] = @"relevance";
  v22[4] = @"route_label";
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__HDWorkoutClusterEntity_modelPropertiesWithTransaction_error_handler___block_invoke;
  v15[3] = &unk_1E630ED30;
  id v12 = v9;
  id v16 = v12;
  uint64_t v17 = &v18;
  BOOL v13 = [(HDSQLiteEntity *)self getValuesForProperties:v11 database:v10 error:a4 handler:v15];

  if (v13) {
    LOBYTE(v13) = *((unsigned char *)v19 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __71__HDWorkoutClusterEntity_modelPropertiesWithTransaction_error_handler___block_invoke(uint64_t a1)
{
  HDSQLiteColumnWithNameAsUUID();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v3 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  double v5 = v4;
  id v6 = HDSQLiteColumnWithNameAsString();
  id v7 = [(HDSQLiteEntity *)[HDWorkoutEntity alloc] initWithPersistentID:v2];
  id v8 = [(HDSQLiteEntity *)[HDWorkoutEntity alloc] initWithPersistentID:v3];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [NSNumber numberWithDouble:v5];
  (*(void (**)(uint64_t, id, HDWorkoutEntity *, HDWorkoutEntity *, void *, void *))(v9 + 16))(v9, v11, v7, v8, v10, v6);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (id)numberOfWorkoutsWithTransaction:(id)a3 error:(id *)a4
{
  return +[HDWorkoutClusterComponentEntity numberOfWorkoutsInCluster:self transaction:a3 error:a4];
}

- (id)workoutRouteSnapshotWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDWorkoutClusterEntity *)self snapshotEntityWithTransaction:v6 error:a4];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 snapshotDataWithTransaction:v6 error:a4];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __83__HDWorkoutClusterEntity__deleteClusterBackingDataWithPredicate_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = [(HDSQLiteEntity *)[HDRaceRouteSnapshotEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  uint64_t v7 = [(HDRaceRouteSnapshotEntity *)v6 deleteDataWithTransaction:*(void *)(a1 + 32) error:a4];

  return v7;
}

+ (id)databaseTable
{
  return @"RacePreviousRoute_workout_cluster";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_108;
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
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F65D20]) initWithEntityClass:objc_opt_class() property:@"ROWID" deletionAction:0 isDeferred:1];
  v7[0] = @"last_workout_id";
  uint64_t v3 = +[HDDataEntity defaultForeignKey];
  v8[0] = v3;
  v7[1] = @"best_workout_id";
  double v4 = +[HDDataEntity defaultForeignKey];
  v7[2] = @"snapshot_id";
  v8[1] = v4;
  v8[2] = v2;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
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

@end