@interface HDWorkoutStatisticsEntity
+ (BOOL)enumerateWorkoutStatisticsForActivityId:(unint64_t)a3 database:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)insertWorkoutStatistics:(id)a3 workoutActivityId:(unint64_t)a4 database:(id)a5 error:(id *)a6;
+ (Class)ownerEntityClass;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_allProperties;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)uniquedColumns;
+ (id)workoutStatisticsForActivityId:(unint64_t)a3 quantityType:(id)a4 database:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
@end

@implementation HDWorkoutStatisticsEntity

+ (id)databaseTable
{
  return @"workout_statistics";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__nonNullableEndDateDefinitions;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"workout_activity_id";
  v2 = objc_msgSend((id)objc_msgSend(a1, "ownerEntityClass"), "defaultForeignKey");
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"workout_activity_id";
  v4[1] = @"data_type";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (Class)ownerEntityClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)insertWorkoutStatistics:(id)a3 workoutActivityId:(unint64_t)a4 database:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = [v10 quantityType];
  v13 = [v12 canonicalUnit];

  v14 = [a1 _allProperties];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__HDWorkoutStatisticsEntity_insertWorkoutStatistics_workoutActivityId_database_error___block_invoke;
  v19[3] = &unk_1E62F3388;
  id v21 = v13;
  unint64_t v22 = a4;
  id v20 = v10;
  id v15 = v13;
  id v16 = v10;
  v17 = [a1 insertOrReplaceEntity:0 database:v11 properties:v14 error:a6 bindingHandler:v19];

  return v17 != 0;
}

void __86__HDWorkoutStatisticsEntity_insertWorkoutStatistics_workoutActivityId_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"workout_activity_id", *(void *)(a1 + 48));
  v4 = [*(id *)(a1 + 32) quantityType];
  MEMORY[0x1C1879E80](a2, @"data_type", [v4 code]);

  v5 = [*(id *)(a1 + 32) quantity];
  [v5 doubleValueForUnit:*(void *)(a1 + 40)];
  double v7 = v6;

  MEMORY[0x1C1879E50](a2, @"quantity", v7);
  v8 = [*(id *)(a1 + 32) min];

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) min];
    [v9 doubleValueForUnit:*(void *)(a1 + 40)];
    double v11 = v10;

    MEMORY[0x1C1879E50](a2, @"min", v11);
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"min");
  }
  v12 = [*(id *)(a1 + 32) max];

  if (v12)
  {
    v13 = [*(id *)(a1 + 32) max];
    [v13 doubleValueForUnit:*(void *)(a1 + 40)];

    JUMPOUT(0x1C1879E50);
  }

  JUMPOUT(0x1C1879E90);
}

+ (BOOL)enumerateWorkoutStatisticsForActivityId:(unint64_t)a3 database:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__HDWorkoutStatisticsEntity_enumerateWorkoutStatisticsForActivityId_database_error_handler___block_invoke;
  v16[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v16[4] = a1;
  id v14 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__HDWorkoutStatisticsEntity_enumerateWorkoutStatisticsForActivityId_database_error_handler___block_invoke_2;
  v15[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v15[4] = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__HDWorkoutStatisticsEntity_enumerateWorkoutStatisticsForActivityId_database_error_handler___block_invoke_3;
  v13[3] = &unk_1E62F33D0;
  id v11 = v10;
  LOBYTE(a5) = [a4 executeCachedStatementForKey:&enumerateWorkoutStatisticsForActivityId_database_error_handler__enumerationKey error:a5 SQLGenerator:v16 bindingHandler:v15 enumerationHandler:v13];

  return (char)a5;
}

id __92__HDWorkoutStatisticsEntity_enumerateWorkoutStatisticsForActivityId_database_error_handler___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"SELECT %@, %@, %@, %@ FROM %@ WHERE %@ = ?", @"data_type", @"quantity", @"min", @"max", v2, @"workout_activity_id"];

  return v3;
}

uint64_t __92__HDWorkoutStatisticsEntity_enumerateWorkoutStatisticsForActivityId_database_error_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_double(a2, 1, (double)*(unint64_t *)(a1 + 32));
}

uint64_t __92__HDWorkoutStatisticsEntity_enumerateWorkoutStatisticsForActivityId_database_error_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v4 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:HDSQLiteColumnAsInt64()];
  double v5 = MEMORY[0x1C1879F40](a2, 1);
  double v6 = (void *)MEMORY[0x1E4F2B370];
  double v7 = [v4 canonicalUnit];
  v8 = [v6 quantityWithUnit:v7 doubleValue:v5];

  v9 = 0;
  if ((MEMORY[0x1C1879FC0](a2, 2) & 1) == 0)
  {
    double v10 = MEMORY[0x1C1879F40](a2, 2);
    id v11 = (void *)MEMORY[0x1E4F2B370];
    v12 = [v4 canonicalUnit];
    v9 = [v11 quantityWithUnit:v12 doubleValue:v10];
  }
  if (MEMORY[0x1C1879FC0](a2, 3))
  {
    v13 = 0;
  }
  else
  {
    double v14 = MEMORY[0x1C1879F40](a2, 3);
    id v15 = (void *)MEMORY[0x1E4F2B370];
    id v16 = [v4 canonicalUnit];
    v13 = [v15 quantityWithUnit:v16 doubleValue:v14];
  }
  v17 = [[_HDWorkoutStatistics alloc] initWithQuantityType:v4 quantity:v8 min:v9 max:v13];
  uint64_t v18 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v18;
}

+ (id)workoutStatisticsForActivityId:(unint64_t)a3 quantityType:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  unint64_t v21 = a3;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __88__HDWorkoutStatisticsEntity_workoutStatisticsForActivityId_quantityType_database_error___block_invoke;
  v22[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v22[4] = a1;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__HDWorkoutStatisticsEntity_workoutStatisticsForActivityId_quantityType_database_error___block_invoke_2;
  v19[3] = &unk_1E62F33F8;
  id v20 = v10;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__HDWorkoutStatisticsEntity_workoutStatisticsForActivityId_quantityType_database_error___block_invoke_3;
  v16[3] = &unk_1E62F3420;
  id v12 = v20;
  id v17 = v12;
  uint64_t v18 = &v23;
  if ([v11 executeCachedStatementForKey:&workoutStatisticsForActivityId_quantityType_database_error__enumerationKey error:a6 SQLGenerator:v22 bindingHandler:v19 enumerationHandler:v16])v13 = (void *)v24[5]; {
  else
  }
    v13 = 0;
  id v14 = v13;

  _Block_object_dispose(&v23, 8);

  return v14;
}

id __88__HDWorkoutStatisticsEntity_workoutStatisticsForActivityId_quantityType_database_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"SELECT %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ?", @"quantity", @"min", @"max", v2, @"workout_activity_id", @"data_type"];

  return v3;
}

uint64_t __88__HDWorkoutStatisticsEntity_workoutStatisticsForActivityId_quantityType_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_double(a2, 1, (double)*(unint64_t *)(a1 + 40));
  double v4 = (double)[*(id *)(a1 + 32) code];

  return sqlite3_bind_double(a2, 2, v4);
}

uint64_t __88__HDWorkoutStatisticsEntity_workoutStatisticsForActivityId_quantityType_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  double v4 = MEMORY[0x1C1879F40](a2, 0);
  double v5 = (void *)MEMORY[0x1E4F2B370];
  double v6 = [*(id *)(a1 + 32) canonicalUnit];
  double v7 = [v5 quantityWithUnit:v6 doubleValue:v4];

  v8 = 0;
  if ((MEMORY[0x1C1879FC0](a2, 1) & 1) == 0)
  {
    double v9 = MEMORY[0x1C1879F40](a2, 1);
    id v10 = (void *)MEMORY[0x1E4F2B370];
    id v11 = [*(id *)(a1 + 32) canonicalUnit];
    v8 = [v10 quantityWithUnit:v11 doubleValue:v9];
  }
  if (MEMORY[0x1C1879FC0](a2, 2))
  {
    id v12 = 0;
  }
  else
  {
    double v13 = MEMORY[0x1C1879F40](a2, 2);
    id v14 = (void *)MEMORY[0x1E4F2B370];
    id v15 = [*(id *)(a1 + 32) canonicalUnit];
    id v12 = [v14 quantityWithUnit:v15 doubleValue:v13];
  }
  id v16 = [[_HDWorkoutStatistics alloc] initWithQuantityType:*(void *)(a1 + 32) quantity:v7 min:v8 max:v12];
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  return 0;
}

+ (id)_allProperties
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"workout_activity_id";
  v4[1] = @"data_type";
  v4[2] = @"quantity";
  void v4[3] = @"min";
  v4[4] = @"max";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];

  return v2;
}

@end