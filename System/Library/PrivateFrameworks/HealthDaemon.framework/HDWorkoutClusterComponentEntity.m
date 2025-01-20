@interface HDWorkoutClusterComponentEntity
+ (BOOL)associateWorkout:(id)a3 withCluster:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)enumerateWorkoutsForCluster:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6;
+ (BOOL)removeWorkout:(id)a3 fromCluster:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)numberOfWorkoutsInCluster:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDWorkoutClusterComponentEntity

+ (BOOL)associateWorkout:(id)a3 withCluster:(id)a4 transaction:(id)a5 error:(id *)a6
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v26[0] = @"cluster_id";
  v26[1] = @"workout_id";
  v12 = (void *)MEMORY[0x1E4F1C978];
  id v13 = a5;
  v14 = [v12 arrayWithObjects:v26 count:2];
  v15 = [v13 databaseForEntityClass:a1];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __82__HDWorkoutClusterComponentEntity_associateWorkout_withCluster_transaction_error___block_invoke;
  v23[3] = &unk_1E62F8BA0;
  id v24 = v14;
  id v25 = a1;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__HDWorkoutClusterComponentEntity_associateWorkout_withCluster_transaction_error___block_invoke_2;
  v20[3] = &unk_1E62F2900;
  id v21 = v11;
  id v22 = v10;
  id v16 = v10;
  id v17 = v11;
  id v18 = v14;
  LOBYTE(a6) = [v15 executeCachedStatementForKey:&associateWorkout_withCluster_transaction_error__insertKey error:a6 SQLGenerator:v23 bindingHandler:v20 enumerationHandler:0];

  return (char)a6;
}

uint64_t __82__HDWorkoutClusterComponentEntity_associateWorkout_withCluster_transaction_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) insertSQLForProperties:*(void *)(a1 + 32) shouldReplace:1];
}

uint64_t __82__HDWorkoutClusterComponentEntity_associateWorkout_withCluster_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) persistentID]);
  sqlite3_int64 v4 = [*(id *)(a1 + 40) persistentID];

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (BOOL)removeWorkout:(id)a3 fromCluster:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = NSString;
  id v13 = a5;
  v14 = [a1 databaseTable];
  v15 = [v12 stringWithFormat:@"DELETE FROM %@ WHERE %@ = ? AND %@ = ?", v14, @"cluster_id", @"workout_id", 0];

  id v16 = [v13 databaseForEntityClass:a1];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__HDWorkoutClusterComponentEntity_removeWorkout_fromCluster_transaction_error___block_invoke;
  v20[3] = &unk_1E62F2900;
  id v21 = v11;
  id v22 = v10;
  id v17 = v10;
  id v18 = v11;
  LOBYTE(a6) = [v16 executeSQL:v15 error:a6 bindingHandler:v20 enumerationHandler:0];

  return (char)a6;
}

uint64_t __79__HDWorkoutClusterComponentEntity_removeWorkout_fromCluster_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) persistentID]);
  sqlite3_int64 v4 = [*(id *)(a1 + 40) persistentID];

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (BOOL)enumerateWorkoutsForCluster:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = [a4 databaseForEntityClass:a1];
  id v19 = v10;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke;
  v20[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v20[4] = a1;
  id v17 = v11;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke_2;
  v18[3] = &unk_1E62F43C8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke_3;
  v16[3] = &unk_1E62F33D0;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a5) = [v12 executeCachedStatementForKey:&enumerateWorkoutsForCluster_transaction_error_block__enumerationKey error:a5 SQLGenerator:v20 bindingHandler:v18 enumerationHandler:v16];

  return (char)a5;
}

id __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) databaseTable];
  v3 = [v1 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ?", @"workout_id", v2, @"cluster_id", 0];

  return v3;
}

uint64_t __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke_3(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  uint64_t v1 = HKWithAutoreleasePool();

  return v1;
}

uint64_t __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke_4(uint64_t a1)
{
  v2 = [(HDSQLiteEntity *)[HDWorkoutEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v3;
}

+ (id)numberOfWorkoutsInCluster:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  id v10 = NSString;
  id v11 = [a1 databaseTable];
  v12 = [v10 stringWithFormat:@"SELECT COUNT(*) FROM %@ WHERE %@ = ?", v11, @"cluster_id", 0];

  id v13 = [v9 databaseForEntityClass:a1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__HDWorkoutClusterComponentEntity_numberOfWorkoutsInCluster_transaction_error___block_invoke;
  v18[3] = &unk_1E62F43C8;
  id v14 = v8;
  id v19 = v14;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__HDWorkoutClusterComponentEntity_numberOfWorkoutsInCluster_transaction_error___block_invoke_2;
  v17[3] = &unk_1E62F3640;
  v17[4] = &v20;
  if ([v13 executeSQL:v12 error:a5 bindingHandler:v18 enumerationHandler:v17])
  {
    v15 = [NSNumber numberWithLongLong:v21[3]];
  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v20, 8);

  return v15;
}

uint64_t __79__HDWorkoutClusterComponentEntity_numberOfWorkoutsInCluster_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __79__HDWorkoutClusterComponentEntity_numberOfWorkoutsInCluster_transaction_error___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

+ (id)databaseTable
{
  return @"RacePreviousRoute_workout_cluster_components";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_111;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"cluster_id";
  v4[1] = @"workout_id";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)foreignKeys
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"cluster_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[1] = @"workout_id";
  v7[0] = v2;
  sqlite3_int64 v3 = +[HDDataEntity defaultForeignKey];
  v7[1] = v3;
  sqlite3_int64 v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (int64_t)protectionClass
{
  return 2;
}

@end