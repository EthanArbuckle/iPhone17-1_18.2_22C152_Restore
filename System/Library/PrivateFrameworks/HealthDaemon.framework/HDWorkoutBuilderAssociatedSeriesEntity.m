@interface HDWorkoutBuilderAssociatedSeriesEntity
+ (BOOL)enumerateSeriesForBuilder:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)allBuilderAssociatedSeriesWithProfile:(id)a3 error:(id *)a4;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)seriesForBuilder:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)uniquedColumns;
+ (int64_t)associateSeries:(id)a3 toWorkoutBuilderID:(id)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
@end

@implementation HDWorkoutBuilderAssociatedSeriesEntity

+ (int64_t)associateSeries:(id)a3 toWorkoutBuilderID:(id)a4 profile:(id)a5 error:(id *)a6
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = +[HDWorkoutBuilderEntity workoutBuilderEntityWithIdentifier:a4 profile:v11 error:a6];
  if (v12)
  {
    v24[0] = @"workout_builder_id";
    v24[1] = @"series_uuid";
    v24[2] = @"series_type";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    v14 = [v11 database];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __91__HDWorkoutBuilderAssociatedSeriesEntity_associateSeries_toWorkoutBuilderID_profile_error___block_invoke;
    v21 = &unk_1E62F3A88;
    id v22 = v12;
    id v23 = v10;
    v15 = [a1 insertOrReplaceEntity:0 healthDatabase:v14 properties:v13 error:a6 bindingHandler:&v18];

    if (v15)
    {
      int64_t v16 = 1;
    }
    else if (objc_msgSend(*a6, "hd_isConstraintViolation", v18, v19, v20, v21, v22))
    {
      int64_t v16 = 2;
    }
    else
    {
      int64_t v16 = 0;
    }
  }
  else
  {
    int64_t v16 = 0;
  }

  return v16;
}

void __91__HDWorkoutBuilderAssociatedSeriesEntity_associateSeries_toWorkoutBuilderID_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"workout_builder_id", [*(id *)(a1 + 32) persistentID]);
  v4 = [*(id *)(a1 + 40) UUID];
  MEMORY[0x1C1879EF0](a2, @"series_uuid", v4);

  id v5 = [*(id *)(a1 + 40) sampleType];
  MEMORY[0x1C1879E80](a2, @"series_type", [v5 code]);
}

+ (id)seriesForBuilder:(id)a3 profile:(id)a4 error:(id *)a5
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v8 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  v12 = (void *)MEMORY[0x1E4F65D00];
  v13 = NSNumber;
  uint64_t v14 = [v10 persistentID];

  v15 = [v13 numberWithLongLong:v14];
  int64_t v16 = _HDSQLiteValueForNumber();
  v17 = [v12 predicateWithProperty:@"workout_builder_id" equalToValue:v16];

  v28[0] = @"series_uuid";
  v28[1] = @"series_type";
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  uint64_t v19 = [v9 database];

  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __73__HDWorkoutBuilderAssociatedSeriesEntity_seriesForBuilder_profile_error___block_invoke;
  v26 = &unk_1E62F4CC0;
  id v20 = v11;
  id v27 = v20;
  LODWORD(a5) = [a1 enumerateProperties:v18 withPredicate:v17 healthDatabase:v19 error:a5 enumerationHandler:&v23];

  if (a5) {
    v21 = objc_msgSend(v20, "copy", v23, v24, v25, v26);
  }
  else {
    v21 = 0;
  }

  return v21;
}

uint64_t __73__HDWorkoutBuilderAssociatedSeriesEntity_seriesForBuilder_profile_error___block_invoke(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsUUID();
  v3 = [MEMORY[0x1E4F2B498] dataTypeWithCode:HDSQLiteColumnWithNameAsInt64()];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v2];

  return 1;
}

+ (BOOL)enumerateSeriesForBuilder:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = NSString;
  id v13 = a4;
  uint64_t v14 = [a1 disambiguatedDatabaseTable];
  v15 = [v12 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ?", @"series_uuid", v14, @"workout_builder_id"];

  int64_t v16 = [v13 databaseForEntityClass:a1];

  id v21 = v11;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__HDWorkoutBuilderAssociatedSeriesEntity_enumerateSeriesForBuilder_transaction_error_block___block_invoke;
  v22[3] = &unk_1E62F43C8;
  id v23 = v10;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__HDWorkoutBuilderAssociatedSeriesEntity_enumerateSeriesForBuilder_transaction_error_block___block_invoke_2;
  v20[3] = &unk_1E62F33D0;
  id v17 = v11;
  id v18 = v10;
  LOBYTE(a5) = [v16 executeSQL:v15 error:a5 bindingHandler:v22 enumerationHandler:v20];

  return (char)a5;
}

uint64_t __92__HDWorkoutBuilderAssociatedSeriesEntity_enumerateSeriesForBuilder_transaction_error_block___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __92__HDWorkoutBuilderAssociatedSeriesEntity_enumerateSeriesForBuilder_transaction_error_block___block_invoke_2(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v3;
}

+ (id)allBuilderAssociatedSeriesWithProfile:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v16[0] = @"series_uuid";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v10 = [v7 database];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__HDWorkoutBuilderAssociatedSeriesEntity_allBuilderAssociatedSeriesWithProfile_error___block_invoke;
  v14[3] = &unk_1E62F4CC0;
  id v11 = v8;
  id v15 = v11;
  LODWORD(a1) = [a1 enumerateProperties:v9 withPredicate:0 healthDatabase:v10 error:a4 enumerationHandler:v14];

  v12 = 0;
  if (a1) {
    v12 = (void *)[v11 copy];
  }

  return v12;
}

uint64_t __86__HDWorkoutBuilderAssociatedSeriesEntity_allBuilderAssociatedSeriesWithProfile_error___block_invoke(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsUUID();
  [*(id *)(a1 + 32) addObject:v2];

  return 1;
}

+ (id)databaseTable
{
  return @"workout_builder_associated_series";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_36;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"workout_builder_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)uniquedColumns
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"workout_builder_id";
  v4[1] = @"series_uuid";
  v4[2] = @"series_type";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

+ (int64_t)protectionClass
{
  return 1;
}

@end