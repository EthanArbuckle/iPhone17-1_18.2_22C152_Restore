@interface HDWorkoutSessionControllerEntity
+ (BOOL)retrieveArchivedStateFromRecoveryIdentifier:(id)a3 workoutSession:(id)a4 transaction:(id)a5 error:(id *)a6 block:(id)a7;
+ (BOOL)storeArchivedStateWithRecoveryIdentifier:(id)a3 archivedState:(id)a4 workoutSession:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDWorkoutSessionControllerEntity

+ (id)databaseTable
{
  return @"workout_session_controllers";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_90;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"workout_session_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"workout_session_id";
  v4[1] = @"recovery_identifier";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (BOOL)storeArchivedStateWithRecoveryIdentifier:(id)a3 archivedState:(id)a4 workoutSession:(id)a5 transaction:(id)a6 error:(id *)a7
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v28[0] = @"workout_session_id";
  v28[1] = @"recovery_identifier";
  v28[2] = @"archived_state";
  v15 = (void *)MEMORY[0x1E4F1C978];
  id v16 = a6;
  v17 = [v15 arrayWithObjects:v28 count:3];
  v18 = [v16 databaseForEntityClass:a1];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __124__HDWorkoutSessionControllerEntity_storeArchivedStateWithRecoveryIdentifier_archivedState_workoutSession_transaction_error___block_invoke;
  v24[3] = &unk_1E6303C78;
  id v25 = v14;
  id v26 = v12;
  id v27 = v13;
  id v19 = v13;
  id v20 = v12;
  id v21 = v14;
  v22 = [a1 insertOrReplaceEntity:1 database:v18 properties:v17 error:a7 bindingHandler:v24];

  return v22 != 0;
}

void __124__HDWorkoutSessionControllerEntity_storeArchivedStateWithRecoveryIdentifier_archivedState_workoutSession_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"workout_session_id", [*(id *)(a1 + 32) persistentID]);
  MEMORY[0x1C1879EC0](a2, @"recovery_identifier", *(void *)(a1 + 40));

  JUMPOUT(0x1C1879E30);
}

+ (BOOL)retrieveArchivedStateFromRecoveryIdentifier:(id)a3 workoutSession:(id)a4 transaction:(id)a5 error:(id *)a6 block:(id)a7
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = v12;
  self;
  v17 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"recovery_identifier" equalToValue:v16];

  v18 = (void *)MEMORY[0x1E4F65D00];
  id v19 = NSNumber;
  uint64_t v20 = [v15 persistentID];

  id v21 = [v19 numberWithLongLong:v20];
  v22 = [v18 predicateWithProperty:@"workout_session_id" equalToValue:v21];

  v23 = (void *)MEMORY[0x1E4F65D08];
  v36[0] = v17;
  v36[1] = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  id v25 = [v23 predicateMatchingAllPredicates:v24];

  id v26 = [v14 databaseForEntityClass:a1];

  id v27 = [a1 queryWithDatabase:v26 predicate:v25];

  v35 = @"archived_state";
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __119__HDWorkoutSessionControllerEntity_retrieveArchivedStateFromRecoveryIdentifier_workoutSession_transaction_error_block___block_invoke;
  v32[3] = &unk_1E630A860;
  id v33 = v16;
  id v34 = v13;
  id v29 = v16;
  id v30 = v13;
  LOBYTE(a6) = [v27 enumeratePersistentIDsAndProperties:v28 error:a6 enumerationHandler:v32];

  return (char)a6;
}

uint64_t __119__HDWorkoutSessionControllerEntity_retrieveArchivedStateFromRecoveryIdentifier_workoutSession_transaction_error_block___block_invoke(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsData();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  return 0;
}

@end