@interface HDRaceRouteGenerationQueueEntity
+ (BOOL)finishWorkoutCluster:(id)a3 concreteCluster:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)populateWithWorkoutClusters:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)clearQueueWithTransaction:(id)a3 error:(id *)a4;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)nextWorkoutClusterWithTransaction:(id)a3 error:(id *)a4;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDRaceRouteGenerationQueueEntity

+ (BOOL)populateWithWorkoutClusters:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    v10 = [MEMORY[0x1E4F28E78] stringWithString:@"INSERT OR IGNORE INTO RacePreviousRoute_generation_queue (workout_cluster_id) VALUES (?)"];
    if ((unint64_t)[v8 count] >= 2)
    {
      unint64_t v11 = 1;
      do
      {
        [v10 appendString:@",(?)"];
        ++v11;
      }
      while ([v8 count] > v11);
    }
    v12 = [v9 databaseForEntityClass:a1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__HDRaceRouteGenerationQueueEntity_populateWithWorkoutClusters_transaction_error___block_invoke;
    v15[3] = &unk_1E62F43C8;
    id v16 = v8;
    char v13 = [v12 executeUncachedSQL:v10 error:a5 bindingHandler:v15 enumerationHandler:0];
  }
  else
  {
    char v13 = 1;
  }

  return v13;
}

unint64_t __82__HDRaceRouteGenerationQueueEntity_populateWithWorkoutClusters_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    unint64_t v5 = 0;
    do
    {
      unint64_t v6 = v5 + 1;
      v7 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
      sqlite3_bind_int64(a2, v6, [v7 persistentID]);

      unint64_t result = [*(id *)(a1 + 32) count];
      unint64_t v5 = v6;
    }
    while (result > v6);
  }
  return result;
}

+ (id)nextWorkoutClusterWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__56;
  id v16 = __Block_byref_object_dispose__56;
  id v17 = 0;
  v7 = [v6 databaseForEntityClass:a1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__HDRaceRouteGenerationQueueEntity_nextWorkoutClusterWithTransaction_error___block_invoke;
  v11[3] = &unk_1E62F3640;
  v11[4] = &v12;
  LODWORD(a4) = [v7 executeSQL:@"SELECT workout_cluster_id FROM RacePreviousRoute_generation_queue WHERE concrete_cluster_id IS NULL LIMIT 1" error:a4 bindingHandler:0 enumerationHandler:v11];

  if (a4) {
    id v8 = (void *)v13[5];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __76__HDRaceRouteGenerationQueueEntity_nextWorkoutClusterWithTransaction_error___block_invoke(uint64_t a1)
{
  v2 = [(HDSQLiteEntity *)[HDWorkoutClusterEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 0;
}

+ (BOOL)finishWorkoutCluster:(id)a3 concreteCluster:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [a5 databaseForEntityClass:a1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__HDRaceRouteGenerationQueueEntity_finishWorkoutCluster_concreteCluster_transaction_error___block_invoke;
  v16[3] = &unk_1E62F2900;
  id v17 = v11;
  id v18 = v10;
  id v13 = v10;
  id v14 = v11;
  LOBYTE(a6) = [v12 executeSQL:@"UPDATE RacePreviousRoute_generation_queue SET concrete_cluster_id = ? WHERE workout_cluster_id = ?" error:a6 bindingHandler:v16 enumerationHandler:0];

  return (char)a6;
}

uint64_t __91__HDRaceRouteGenerationQueueEntity_finishWorkoutCluster_concreteCluster_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) persistentID]);
  sqlite3_int64 v4 = [*(id *)(a1 + 40) persistentID];

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (id)clearQueueWithTransaction:(id)a3 error:(id *)a4
{
  unint64_t v5 = [a3 databaseForEntityClass:a1];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__HDRaceRouteGenerationQueueEntity_clearQueueWithTransaction_error___block_invoke;
  v12[3] = &unk_1E62F3D38;
  id v7 = v6;
  id v13 = v7;
  id v8 = 0;
  if ([v5 executeSQL:@"SELECT concrete_cluster_id FROM RacePreviousRoute_generation_queue WHERE concrete_cluster_id IS NOT NULL" error:a4 bindingHandler:0 enumerationHandler:v12])
  {
    id v9 = v5;
    self;
    int v10 = [v9 executeSQL:@"DELETE FROM RacePreviousRoute_generation_queue" error:a4 bindingHandler:0 enumerationHandler:0];

    id v8 = 0;
    if (v10) {
      id v8 = (void *)[v7 copy];
    }
  }

  return v8;
}

uint64_t __68__HDRaceRouteGenerationQueueEntity_clearQueueWithTransaction_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [(HDSQLiteEntity *)[HDRaceRouteClusterEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  [v1 addObject:v2];

  return 1;
}

+ (id)databaseTable
{
  return @"RacePreviousRoute_generation_queue";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_28;
}

+ (id)uniquedColumns
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"workout_cluster_id";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = @"workout_cluster_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

@end