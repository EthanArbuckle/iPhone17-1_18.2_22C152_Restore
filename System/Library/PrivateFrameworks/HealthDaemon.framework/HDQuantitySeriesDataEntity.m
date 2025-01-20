@interface HDQuantitySeriesDataEntity
+ (BOOL)deleteAllSeriesWithDatabase:(id)a3 error:(id *)a4;
+ (BOOL)deleteSeriesDataWithIdentifier:(int64_t)a3 database:(id)a4 error:(id *)a5;
+ (BOOL)deleteSeriesDataWithIdentifier:(int64_t)a3 timestamps:(id)a4 database:(id)a5 error:(id *)a6;
+ (BOOL)enumerateSeries:(int64_t)a3 after:(double)a4 inclusive:(BOOL)a5 transaction:(id)a6 error:(id *)a7 handler:(id)a8;
+ (BOOL)enumerateSeries:(int64_t)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)enumerateWithDatabase:(id)a3 predicate:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)enumerateWithTransaction:(id)a3 predicate:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)getRangeAndCountForSeriesIdentifier:(int64_t)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)hasROWID;
+ (BOOL)insertOrReplaceEntity:(BOOL)a3 database:(id)a4 value:(double)a5 duration:(double)a6 timestamp:(double)a7 identifier:(int64_t)a8 error:(id *)a9;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)predicateForSeriesIdentifier:(int64_t)a3;
+ (id)primaryKeyColumns;
+ (int64_t)protectionClass;
@end

@implementation HDQuantitySeriesDataEntity

+ (id)databaseTable
{
  return @"quantity_series_data";
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_84;
}

+ (BOOL)hasROWID
{
  return 0;
}

+ (id)primaryKeyColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"series_identifier";
  v4[1] = @"timestamp";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F65D20]) initWithEntityClass:objc_opt_class() property:@"hfd_key" deletionAction:0 isDeferred:1];
  v5 = @"series_identifier";
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (BOOL)insertOrReplaceEntity:(BOOL)a3 database:(id)a4 value:(double)a5 duration:(double)a6 timestamp:(double)a7 identifier:(int64_t)a8 error:(id *)a9
{
  BOOL v14 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__HDQuantitySeriesDataEntity_insertOrReplaceEntity_database_value_duration_timestamp_identifier_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  id v16 = a4;
  v17 = _Block_copy(aBlock);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __103__HDQuantitySeriesDataEntity_insertOrReplaceEntity_database_value_duration_timestamp_identifier_error___block_invoke_2;
  v26[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v26[4] = a1;
  v18 = _Block_copy(v26);
  v19 = v18;
  BOOL v20 = !v14;
  if (v14) {
    v21 = &insertOrReplaceEntity_database_value_duration_timestamp_identifier_error__replaceSQLKey;
  }
  else {
    v21 = &insertOrReplaceEntity_database_value_duration_timestamp_identifier_error__insertSQLKey;
  }
  if (v20) {
    v18 = v17;
  }
  v22 = _Block_copy(v18);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __103__HDQuantitySeriesDataEntity_insertOrReplaceEntity_database_value_duration_timestamp_identifier_error___block_invoke_3;
  v25[3] = &__block_descriptor_64_e23_v16__0__sqlite3_stmt__8l;
  v25[4] = a8;
  *(double *)&v25[5] = a7;
  *(double *)&v25[6] = a5;
  *(double *)&v25[7] = a6;
  char v23 = [v16 executeCachedStatementForKey:v21 error:a9 SQLGenerator:v22 bindingHandler:v25 enumerationHandler:0];

  return v23;
}

id __103__HDQuantitySeriesDataEntity_insertOrReplaceEntity_database_value_duration_timestamp_identifier_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = HDQuantitySeriesDataEntityAllProperties();
  v3 = [v1 insertSQLForProperties:v2 shouldReplace:0];

  return v3;
}

id __103__HDQuantitySeriesDataEntity_insertOrReplaceEntity_database_value_duration_timestamp_identifier_error___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = HDQuantitySeriesDataEntityAllProperties();
  v3 = [v1 insertSQLForProperties:v2 shouldReplace:1];

  return v3;
}

uint64_t __103__HDQuantitySeriesDataEntity_insertOrReplaceEntity_database_value_duration_timestamp_identifier_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 40));
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 48));
  double v4 = *(double *)(a1 + 56);

  return sqlite3_bind_double(a2, 4, v4);
}

+ (BOOL)deleteSeriesDataWithIdentifier:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  id v7 = a4;
  v8 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke_2;
  v10[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v10[4] = a3;
  LOBYTE(a5) = [v7 executeCachedStatementForKey:&deleteSeriesDataWithIdentifier_database_error__deleteSQLKey error:a5 SQLGenerator:v8 bindingHandler:v10 enumerationHandler:0];

  return (char)a5;
}

id __76__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"DELETE FROM %@ WHERE %@ = ?", v2, @"series_identifier"];

  return v3;
}

uint64_t __76__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

+ (BOOL)deleteSeriesDataWithIdentifier:(int64_t)a3 timestamps:(id)a4 database:(id)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  v12 = _Block_copy(aBlock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __87__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke_2;
        v21[3] = &unk_1E62F33F8;
        v21[4] = v17;
        v21[5] = a3;
        if (![v11 executeCachedStatementForKey:&deleteSeriesDataWithIdentifier_timestamps_database_error__deleteSeriesSQLKey error:a6 SQLGenerator:v12 bindingHandler:v21 enumerationHandler:0])
        {
          BOOL v18 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_11:

  return v18;
}

id __87__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"DELETE FROM %@ WHERE %@ = ? AND %@ = ?", v2, @"series_identifier", @"timestamp"];

  return v3;
}

uint64_t __87__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];

  return sqlite3_bind_double(a2, 2, v4);
}

+ (BOOL)deleteAllSeriesWithDatabase:(id)a3 error:(id *)a4
{
  v6 = NSString;
  id v7 = a3;
  v8 = [a1 disambiguatedDatabaseTable];
  v9 = [v6 stringWithFormat:@"DELETE FROM %@", v8];

  LOBYTE(a4) = [v7 executeUncachedSQL:v9 error:a4];
  return (char)a4;
}

+ (BOOL)enumerateWithTransaction:(id)a3 predicate:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  v12 = [a3 protectedDatabase];
  LOBYTE(a5) = [a1 enumerateWithDatabase:v12 predicate:v11 error:a5 handler:v10];

  return (char)a5;
}

+ (BOOL)enumerateWithDatabase:(id)a3 predicate:(id)a4 error:(id *)a5 handler:(id)a6
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E4F65D68];
  id v13 = a3;
  id v14 = objc_alloc_init(v12);
  [v14 setEntityClass:a1];
  [v14 setLimitCount:0];
  uint64_t v15 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"series_identifier" entityClass:a1 ascending:1];
  v27[0] = v15;
  id v16 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"timestamp" entityClass:a1 ascending:1];
  v27[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  [v14 setOrderingTerms:v17];

  [v14 setPredicate:v10];
  BOOL v18 = HDQuantitySeriesDataEntityAllProperties();
  v19 = [v14 selectSQLForProperties:v18];

  id v24 = v11;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__HDQuantitySeriesDataEntity_enumerateWithDatabase_predicate_error_handler___block_invoke;
  v25[3] = &unk_1E62F43C8;
  id v26 = v10;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __76__HDQuantitySeriesDataEntity_enumerateWithDatabase_predicate_error_handler___block_invoke_2;
  v23[3] = &unk_1E62F33D0;
  id v20 = v11;
  id v21 = v10;
  LOBYTE(a5) = [v13 executeSQL:v19 error:a5 bindingHandler:v25 enumerationHandler:v23];

  return (char)a5;
}

void *__76__HDQuantitySeriesDataEntity_enumerateWithDatabase_predicate_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result)
  {
    int v3 = 1;
    return (void *)[result bindToStatement:a2 bindingIndex:&v3];
  }
  return result;
}

uint64_t __76__HDQuantitySeriesDataEntity_enumerateWithDatabase_predicate_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = HDSQLiteColumnAsInt64();
  double v5 = MEMORY[0x1C1879F40](a2, 1);
  double v6 = MEMORY[0x1C1879F40](a2, 2);
  v9.n128_f64[0] = MEMORY[0x1C1879F40](a2, 3);
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, __n128, __n128, __n128))(v3 + 16);
  v8.n128_u64[0] = v9.n128_u64[0];
  v9.n128_f64[0] = v5;
  v10.n128_f64[0] = v6;

  return v7(v3, v4, v9, v10, v8);
}

+ (BOOL)enumerateSeries:(int64_t)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  v12 = [a1 predicateForSeriesIdentifier:a3];
  id v13 = [v11 protectedDatabase];

  LOBYTE(a5) = [a1 enumerateWithDatabase:v13 predicate:v12 error:a5 handler:v10];
  return (char)a5;
}

+ (BOOL)enumerateSeries:(int64_t)a3 after:(double)a4 inclusive:(BOOL)a5 transaction:(id)a6 error:(id *)a7 handler:(id)a8
{
  BOOL v10 = a5;
  v27[2] = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  id v15 = a6;
  id v16 = [a1 predicateForSeriesIdentifier:a3];
  uint64_t v17 = (void *)MEMORY[0x1E4F65D00];
  BOOL v18 = [NSNumber numberWithDouble:a4];
  if (v10) {
    uint64_t v19 = 6;
  }
  else {
    uint64_t v19 = 5;
  }
  id v20 = [v17 predicateWithProperty:@"timestamp" value:v18 comparisonType:v19];

  id v21 = (void *)MEMORY[0x1E4F65D08];
  v27[0] = v16;
  v27[1] = v20;
  long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  long long v23 = [v21 predicateMatchingAllPredicates:v22];

  id v24 = [v15 protectedDatabase];

  char v25 = [a1 enumerateWithDatabase:v24 predicate:v23 error:a7 handler:v14];
  return v25;
}

+ (BOOL)getRangeAndCountForSeriesIdentifier:(int64_t)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__HDQuantitySeriesDataEntity_getRangeAndCountForSeriesIdentifier_transaction_error_handler___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  id v11 = a4;
  v12 = _Block_copy(aBlock);
  id v13 = [v11 protectedDatabase];

  int64_t v18 = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__HDQuantitySeriesDataEntity_getRangeAndCountForSeriesIdentifier_transaction_error_handler___block_invoke_2;
  v19[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v19[4] = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__HDQuantitySeriesDataEntity_getRangeAndCountForSeriesIdentifier_transaction_error_handler___block_invoke_3;
  v16[3] = &unk_1E62F8820;
  id v17 = v10;
  id v14 = v10;
  LOBYTE(a5) = [v13 executeCachedStatementForKey:&getRangeAndCountForSeriesIdentifier_transaction_error_handler__getSeriesRangeSQLKey error:a5 SQLGenerator:v12 bindingHandler:v19 enumerationHandler:v16];

  return (char)a5;
}

id __92__HDQuantitySeriesDataEntity_getRangeAndCountForSeriesIdentifier_transaction_error_handler___block_invoke(uint64_t a1)
{
  v2 = NSString;
  uint64_t v3 = [*(id *)(a1 + 32) disambiguatedSQLForProperty:@"timestamp"];
  uint64_t v4 = [*(id *)(a1 + 32) disambiguatedSQLForProperty:@"timestamp"];
  double v5 = [*(id *)(a1 + 32) disambiguatedSQLForProperty:@"duration"];
  double v6 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  id v7 = [*(id *)(a1 + 32) disambiguatedSQLForProperty:@"series_identifier"];
  __n128 v8 = [v2 stringWithFormat:@"SELECT MIN(%@), MAX(%@ + MAX(%@, 0.0)), COUNT(*) FROM %@ WHERE %@=?", v3, v4, v5, v6, v7];

  return v8;
}

uint64_t __92__HDQuantitySeriesDataEntity_getRangeAndCountForSeriesIdentifier_transaction_error_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

BOOL __92__HDQuantitySeriesDataEntity_getRangeAndCountForSeriesIdentifier_transaction_error_handler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = HDSQLiteColumnAsInt64();
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    double v8 = MEMORY[0x1C1879F40](a2, 0);
    double v9 = MEMORY[0x1C1879F40](a2, 1);
    uint64_t v10 = HDSQLiteColumnAsInt64();
    (*(void (**)(uint64_t, uint64_t, double, double))(v7 + 16))(v7, v10, v8, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 1100, @"Unrecognized quantity series identifier %lld", *(void *)(a1 + 40));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a3) {
        *a3 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v6 != 0;
}

+ (id)predicateForSeriesIdentifier:(int64_t)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v4 = [NSNumber numberWithLongLong:a3];
  double v5 = [v3 predicateWithProperty:@"series_identifier" equalToValue:v4];

  return v5;
}

@end