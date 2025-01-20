@interface HDWorkoutBuilderDataSourceEntity
+ (BOOL)enumerateDataSourcesForWorkoutBuilder:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6;
+ (BOOL)removeDataSourceWithIdentifier:(id)a3 fromWorkoutBuilder:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)storeDataSourceWithIdentifier:(id)a3 archivedState:(id)a4 workoutBuilder:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (int64_t)protectionClass;
@end

@implementation HDWorkoutBuilderDataSourceEntity

+ (BOOL)storeDataSourceWithIdentifier:(id)a3 archivedState:(id)a4 workoutBuilder:(id)a5 transaction:(id)a6 error:(id *)a7
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v28[0] = @"workout_builder_id";
  v28[1] = @"recovery_identifier";
  v28[2] = @"archived_state";
  v15 = (void *)MEMORY[0x1E4F1C978];
  id v16 = a6;
  v17 = [v15 arrayWithObjects:v28 count:3];
  v18 = [v16 databaseForEntityClass:a1];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __113__HDWorkoutBuilderDataSourceEntity_storeDataSourceWithIdentifier_archivedState_workoutBuilder_transaction_error___block_invoke;
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

void __113__HDWorkoutBuilderDataSourceEntity_storeDataSourceWithIdentifier_archivedState_workoutBuilder_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"workout_builder_id", [*(id *)(a1 + 32) persistentID]);
  MEMORY[0x1C1879EC0](a2, @"recovery_identifier", *(void *)(a1 + 40));

  JUMPOUT(0x1C1879E30);
}

+ (BOOL)removeDataSourceWithIdentifier:(id)a3 fromWorkoutBuilder:(id)a4 transaction:(id)a5 error:(id *)a6
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v10 = (void *)MEMORY[0x1E4F65D00];
  id v11 = a5;
  id v12 = a4;
  id v13 = [v10 predicateWithProperty:@"recovery_identifier" equalToValue:a3];
  id v14 = (void *)MEMORY[0x1E4F65D00];
  v15 = NSNumber;
  uint64_t v16 = [v12 persistentID];

  v17 = [v15 numberWithLongLong:v16];
  v18 = [v14 predicateWithProperty:@"workout_builder_id" equalToValue:v17];

  id v19 = (void *)MEMORY[0x1E4F65D08];
  v24[0] = v13;
  v24[1] = v18;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  id v21 = [v19 predicateMatchingAllPredicates:v20];

  v22 = [v11 databaseForEntityClass:a1];

  LOBYTE(a6) = [a1 deleteEntitiesInDatabase:v22 predicate:v21 error:a6];
  return (char)a6;
}

+ (BOOL)enumerateDataSourcesForWorkoutBuilder:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = (void *)MEMORY[0x1E4F65D00];
  id v12 = NSNumber;
  id v13 = a4;
  id v14 = objc_msgSend(v12, "numberWithLongLong:", objc_msgSend(a3, "persistentID"));
  v15 = [v11 predicateWithProperty:@"workout_builder_id" equalToValue:v14];

  uint64_t v16 = [v13 databaseForEntityClass:a1];

  v17 = [a1 queryWithDatabase:v16 predicate:v15];

  v23[0] = @"recovery_identifier";
  v23[1] = @"archived_state";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__HDWorkoutBuilderDataSourceEntity_enumerateDataSourcesForWorkoutBuilder_transaction_error_block___block_invoke;
  v21[3] = &unk_1E62F4138;
  id v22 = v10;
  id v19 = v10;
  LOBYTE(a5) = [v17 enumerateProperties:v18 error:a5 enumerationHandler:v21];

  return (char)a5;
}

uint64_t __98__HDWorkoutBuilderDataSourceEntity_enumerateDataSourcesForWorkoutBuilder_transaction_error_block___block_invoke(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsString();
  v3 = HDSQLiteColumnWithNameAsData();
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v4;
}

+ (id)databaseTable
{
  return @"workout_builder_data_sources";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_107;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"workout_builder_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 1;
}

@end