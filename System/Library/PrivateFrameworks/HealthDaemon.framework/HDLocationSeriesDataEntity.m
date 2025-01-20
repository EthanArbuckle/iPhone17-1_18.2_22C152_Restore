@interface HDLocationSeriesDataEntity
+ (BOOL)_enumerateSeriesForValidation:(int64_t)a3 database:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)copySeriesDataWithIdentifier:(int64_t)a3 toSeriesIdentifier:(int64_t)a4 database:(id)a5 error:(id *)a6;
+ (BOOL)deleteAllSeriesWithDatabase:(id)a3 error:(id *)a4;
+ (BOOL)deleteSeriesDataWithIdentifier:(int64_t)a3 database:(id)a4 error:(id *)a5;
+ (BOOL)deleteSeriesDataWithIdentifier:(int64_t)a3 timestamps:(id)a4 database:(id)a5 error:(id *)a6;
+ (BOOL)enumerateSeries:(int64_t)a3 database:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7 handler:(id)a8;
+ (BOOL)enumerateSeries:(int64_t)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)enumerateWithTransaction:(id)a3 predicate:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)getRangeAndCountForSeriesIdentifier:(int64_t)a3 database:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)hasROWID;
+ (BOOL)insertOrReplaceEntity:(BOOL)a3 database:(id)a4 identifier:(int64_t)a5 timestamp:(double)a6 location:(id)a7 error:(id *)a8;
+ (BOOL)unitTesting_deleteSeriesDataWithIdentifier:(int64_t)a3 timestamp:(id)a4 database:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)createTableSQLWithBehavior:(id)a3;
+ (id)databaseName;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)indicesWithBehavior:(id)a3;
+ (id)primaryKeyColumns;
+ (id)triggersWithBehavior:(id)a3;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateWithDatabase:(void *)a3 predicate:(char)a4 forValidation:(uint64_t)a5 error:(void *)a6 handler:;
@end

@implementation HDLocationSeriesDataEntity

+ (id)databaseName
{
  return 0;
}

+ (id)databaseTable
{
  return @"location_series_data";
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  {
    v5 = a3;
    a3 = v5;
    if (v4)
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_3, 0, &dword_1BCB7D000);
      a3 = v5;
    }
  }
  *a3 = 12;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)+[HDLocationSeriesDataEntity columnDefinitionsWithCount:]::columnDefinitions;
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

+ (id)createTableSQLWithBehavior:(id)a3
{
  v3 = objc_msgSend(a1, "createTableSQL", a3);

  return v3;
}

+ (id)indicesWithBehavior:(id)a3
{
  v3 = objc_msgSend(a1, "indices", a3);

  return v3;
}

+ (id)triggersWithBehavior:(id)a3
{
  v3 = objc_msgSend(a1, "triggers", a3);

  return v3;
}

+ (BOOL)insertOrReplaceEntity:(BOOL)a3 database:(id)a4 identifier:(int64_t)a5 timestamp:(double)a6 location:(id)a7 error:(id *)a8
{
  BOOL v12 = a3;
  id v14 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__HDLocationSeriesDataEntity_insertOrReplaceEntity_database_identifier_timestamp_location_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  id v15 = a4;
  v16 = _Block_copy(aBlock);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __97__HDLocationSeriesDataEntity_insertOrReplaceEntity_database_identifier_timestamp_location_error___block_invoke_2;
  v28[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v28[4] = a1;
  v17 = _Block_copy(v28);
  v18 = v17;
  if (v12) {
    v19 = &+[HDLocationSeriesDataEntity insertOrReplaceEntity:database:identifier:timestamp:location:error:]::HDLocationSeriesDataEntityCacheKeyReplace;
  }
  else {
    v19 = &+[HDLocationSeriesDataEntity insertOrReplaceEntity:database:identifier:timestamp:location:error:]::HDLocationSeriesDataEntityCacheKeyInsert;
  }
  if (!v12) {
    v17 = v16;
  }
  v20 = _Block_copy(v17);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __97__HDLocationSeriesDataEntity_insertOrReplaceEntity_database_identifier_timestamp_location_error___block_invoke_3;
  v24[3] = &unk_1E6309F28;
  double v27 = a6;
  id v25 = v14;
  int64_t v26 = a5;
  id v21 = v14;
  char v22 = [v15 executeCachedStatementForKey:v19 error:a8 SQLGenerator:v20 bindingHandler:v24 enumerationHandler:0];

  return v22;
}

id __97__HDLocationSeriesDataEntity_insertOrReplaceEntity_database_identifier_timestamp_location_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = HDLocationSeriesDataEntityAllProperties();
  v3 = [v1 insertSQLForProperties:v2 shouldReplace:0];

  return v3;
}

id __97__HDLocationSeriesDataEntity_insertOrReplaceEntity_database_identifier_timestamp_location_error___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = HDLocationSeriesDataEntityAllProperties();
  v3 = [v1 insertSQLForProperties:v2 shouldReplace:1];

  return v3;
}

uint64_t __97__HDLocationSeriesDataEntity_insertOrReplaceEntity_database_identifier_timestamp_location_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 48));
  [*(id *)(a1 + 32) coordinate];
  sqlite3_bind_double(a2, 3, v4);
  [*(id *)(a1 + 32) coordinate];
  sqlite3_bind_double(a2, 4, v5);
  [*(id *)(a1 + 32) altitude];
  sqlite3_bind_double(a2, 5, v6);
  [*(id *)(a1 + 32) speed];
  sqlite3_bind_double(a2, 6, v7);
  [*(id *)(a1 + 32) course];
  sqlite3_bind_double(a2, 7, v8);
  [*(id *)(a1 + 32) horizontalAccuracy];
  sqlite3_bind_double(a2, 8, v9);
  [*(id *)(a1 + 32) verticalAccuracy];
  sqlite3_bind_double(a2, 9, v10);
  [*(id *)(a1 + 32) speedAccuracy];
  sqlite3_bind_double(a2, 10, v11);
  [*(id *)(a1 + 32) courseAccuracy];
  sqlite3_bind_double(a2, 11, v12);
  int v13 = [*(id *)(a1 + 32) signalEnvironmentType];

  return sqlite3_bind_int(a2, 12, v13);
}

+ (BOOL)deleteSeriesDataWithIdentifier:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  id v7 = a4;
  double v8 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke_2;
  v10[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v10[4] = a3;
  LOBYTE(a5) = [v7 executeCachedStatementForKey:&+[HDLocationSeriesDataEntity deleteSeriesDataWithIdentifier:database:error:]::deleteSQLKey error:a5 SQLGenerator:v8 bindingHandler:v10 enumerationHandler:0];

  return (char)a5;
}

id __76__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"DELETE FROM %@ WHERE %@ = ?", v2, @"series_identifier"];

  return v3;
}

uint64_t __76__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

+ (BOOL)deleteSeriesDataWithIdentifier:(int64_t)a3 timestamps:(id)a4 database:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v19 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  double v11 = _Block_copy(aBlock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __87__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke_2;
        v20[3] = &unk_1E62F5768;
        v20[4] = v15;
        v20[5] = a3;
        if (![v19 executeCachedStatementForKey:&+[HDLocationSeriesDataEntity deleteSeriesDataWithIdentifier:timestamps:database:error:]::deleteSQLDatumKey error:a6 SQLGenerator:v11 bindingHandler:v20 enumerationHandler:0])
        {
          BOOL v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

id __87__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"DELETE FROM %@ WHERE %@ = ? AND %@ = ?", v2, @"series_identifier", @"timestamp"];

  return v3;
}

uint64_t __87__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];

  return sqlite3_bind_double(a2, 2, v4);
}

+ (BOOL)deleteAllSeriesWithDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = NSString;
  double v8 = [a1 disambiguatedDatabaseTable];
  double v9 = [v7 stringWithFormat:@"DELETE FROM %@", v8];

  LOBYTE(a4) = [v6 executeUncachedSQL:v9 error:a4];
  return (char)a4;
}

+ (BOOL)enumerateWithTransaction:(id)a3 predicate:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [a3 protectedDatabase];
  LOBYTE(a5) = +[HDLocationSeriesDataEntity _enumerateWithDatabase:predicate:forValidation:error:handler:]((uint64_t)a1, v12, v10, 0, (uint64_t)a5, v11);

  return (char)a5;
}

+ (uint64_t)_enumerateWithDatabase:(void *)a3 predicate:(char)a4 forValidation:(uint64_t)a5 error:(void *)a6 handler:
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v12 = a6;
  uint64_t v13 = self;
  id v14 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v14 setEntityClass:v13];
  [v14 setLimitCount:0];
  uint64_t v15 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"series_identifier" entityClass:v13 ascending:1];
  v29[0] = v15;
  BOOL v16 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"timestamp" entityClass:v13 ascending:1];
  v29[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  [v14 setOrderingTerms:v17];

  [v14 setPredicate:v11];
  v18 = HDLocationSeriesDataEntityAllProperties();
  id v19 = [v14 selectSQLForProperties:v18];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __91__HDLocationSeriesDataEntity__enumerateWithDatabase_predicate_forValidation_error_handler___block_invoke;
  v27[3] = &unk_1E62F52C8;
  id v20 = v11;
  id v28 = v20;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __91__HDLocationSeriesDataEntity__enumerateWithDatabase_predicate_forValidation_error_handler___block_invoke_2;
  v24[3] = &unk_1E6309F50;
  char v26 = a4;
  id v21 = v12;
  id v25 = v21;
  uint64_t v22 = [v10 executeSQL:v19 error:a5 bindingHandler:v27 enumerationHandler:v24];

  return v22;
}

void *__91__HDLocationSeriesDataEntity__enumerateWithDatabase_predicate_forValidation_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result)
  {
    int v3 = 1;
    return (void *)[result bindToStatement:a2 bindingIndex:&v3];
  }
  return result;
}

uint64_t __91__HDLocationSeriesDataEntity__enumerateWithDatabase_predicate_forValidation_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v4 = MEMORY[0x1C1879F40](a2, 1);
  double v27 = MEMORY[0x1C1879F40](a2, 2);
  double v26 = MEMORY[0x1C1879F40](a2, 3);
  double v5 = MEMORY[0x1C1879F40](a2, 7);
  double v6 = MEMORY[0x1C1879F40](a2, 4);
  double v7 = MEMORY[0x1C1879F40](a2, 8);
  double v8 = MEMORY[0x1C1879F40](a2, 5);
  double v9 = MEMORY[0x1C1879F40](a2, 9);
  double v10 = MEMORY[0x1C1879F40](a2, 6);
  double v11 = MEMORY[0x1C1879F40](a2, 10);
  int v12 = HDSQLiteColumnAsInt64();
  int v13 = *MEMORY[0x1E4F1E768];
  if (*(unsigned char *)(a1 + 40))
  {
    float v14 = v6;
    double v6 = v14;
    float v15 = v8;
    double v8 = v15;
    float v16 = v10;
    double v10 = v16;
    float v17 = v5;
    double v5 = v17;
    float v18 = v7;
    double v7 = v18;
    float v19 = v9;
    double v9 = v19;
    float v20 = v11;
    double v11 = v20;
  }
  int v28 = 0;
  double v29 = v27;
  double v30 = v26;
  double v31 = v5;
  double v32 = v6;
  double v33 = v7;
  double v34 = v8;
  double v35 = v9;
  double v36 = v10;
  double v37 = v11;
  double v38 = v4;
  int v39 = 0;
  unint64_t v40 = 0xBFF0000000000000;
  uint64_t v41 = 0;
  uint64_t v43 = 0;
  uint64_t v42 = 0;
  uint64_t v44 = 0x7FFFFFFF00000000;
  int v45 = v13;
  uint64_t v46 = 0;
  int v47 = v12;
  int v49 = 0;
  uint64_t v48 = 0;
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithClientLocation:&v28];
  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t v23 = HDSQLiteColumnAsInt64();
  uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t, void *, double))(v22 + 16))(v22, v23, v21, v4);

  return v24;
}

+ (BOOL)_enumerateSeriesForValidation:(int64_t)a3 database:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  int v12 = (void *)MEMORY[0x1E4F65D00];
  int v13 = [NSNumber numberWithLongLong:a3];
  float v14 = [v12 predicateWithProperty:@"series_identifier" equalToValue:v13];

  LOBYTE(a5) = +[HDLocationSeriesDataEntity _enumerateWithDatabase:predicate:forValidation:error:handler:]((uint64_t)a1, v10, v14, 1, (uint64_t)a5, v11);
  return (char)a5;
}

+ (BOOL)enumerateSeries:(int64_t)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  int v12 = (void *)MEMORY[0x1E4F65D00];
  int v13 = [NSNumber numberWithLongLong:a3];
  float v14 = [v12 predicateWithProperty:@"series_identifier" equalToValue:v13];

  LOBYTE(a5) = [a1 enumerateWithTransaction:v10 predicate:v14 error:a5 handler:v11];
  return (char)a5;
}

+ (BOOL)enumerateSeries:(int64_t)a3 database:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7 handler:(id)a8
{
  id v34 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  float v17 = (void *)MEMORY[0x1E4F65D00];
  id v33 = v16;
  float v18 = [NSNumber numberWithLongLong:a3];
  float v19 = [v17 predicateWithProperty:@"series_identifier" equalToValue:v18];
  id v20 = a1;

  id v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v19, 0);
  if (v14)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F65D00];
    uint64_t v23 = NSNumber;
    [v14 timeIntervalSinceReferenceDate];
    uint64_t v24 = objc_msgSend(v23, "numberWithDouble:");
    id v25 = [v22 predicateWithProperty:@"timestamp" greaterThanOrEqualToValue:v24];

    [v21 addObject:v25];
  }
  if (v15)
  {
    double v26 = (void *)MEMORY[0x1E4F65D00];
    double v27 = NSNumber;
    [v15 timeIntervalSinceReferenceDate];
    int v28 = objc_msgSend(v27, "numberWithDouble:");
    double v29 = [v26 predicateWithProperty:@"timestamp" lessThanOrEqualToValue:v28];

    [v21 addObject:v29];
  }
  double v30 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v21];
  char v31 = +[HDLocationSeriesDataEntity _enumerateWithDatabase:predicate:forValidation:error:handler:]((uint64_t)v20, v34, v30, 0, (uint64_t)a7, v33);

  return v31;
}

+ (BOOL)getRangeAndCountForSeriesIdentifier:(int64_t)a3 database:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__HDLocationSeriesDataEntity_getRangeAndCountForSeriesIdentifier_database_error_handler___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  id v11 = a4;
  int v12 = _Block_copy(aBlock);
  int64_t v17 = a3;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__HDLocationSeriesDataEntity_getRangeAndCountForSeriesIdentifier_database_error_handler___block_invoke_2;
  v18[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v18[4] = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__HDLocationSeriesDataEntity_getRangeAndCountForSeriesIdentifier_database_error_handler___block_invoke_3;
  v15[3] = &unk_1E6309F78;
  id v16 = v10;
  id v13 = v10;
  LOBYTE(a5) = [v11 executeCachedStatementForKey:&+[HDLocationSeriesDataEntity getRangeAndCountForSeriesIdentifier:database:error:handler:]::getSeriesRangeSQLKey error:a5 SQLGenerator:v12 bindingHandler:v18 enumerationHandler:v15];

  return (char)a5;
}

id __89__HDLocationSeriesDataEntity_getRangeAndCountForSeriesIdentifier_database_error_handler___block_invoke(uint64_t a1)
{
  v2 = NSString;
  int v3 = [*(id *)(a1 + 32) disambiguatedSQLForProperty:@"timestamp"];
  double v4 = [*(id *)(a1 + 32) disambiguatedSQLForProperty:@"timestamp"];
  double v5 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  double v6 = [*(id *)(a1 + 32) disambiguatedSQLForProperty:@"series_identifier"];
  double v7 = [v2 stringWithFormat:@"SELECT MIN(%@), MAX(%@), COUNT(*) FROM %@ WHERE %@=?", v3, v4, v5, v6];

  return v7;
}

uint64_t __89__HDLocationSeriesDataEntity_getRangeAndCountForSeriesIdentifier_database_error_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

BOOL __89__HDLocationSeriesDataEntity_getRangeAndCountForSeriesIdentifier_database_error_handler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = HDSQLiteColumnAsInt64();
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    double v8 = MEMORY[0x1C1879F40](a2, 0);
    double v9 = MEMORY[0x1C1879F40](a2, 1);
    (*(void (**)(uint64_t, uint64_t, double, double))(v7 + 16))(v7, v6, v8, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 1100, @"Unrecognized location series identifier %lld", *(void *)(a1 + 40));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v10;
    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v6 != 0;
}

+ (BOOL)copySeriesDataWithIdentifier:(int64_t)a3 toSeriesIdentifier:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__HDLocationSeriesDataEntity_copySeriesDataWithIdentifier_toSeriesIdentifier_database_error___block_invoke;
  v13[3] = &unk_1E6309FA0;
  id v14 = v10;
  id v15 = a1;
  int64_t v16 = a4;
  id v11 = v10;
  LOBYTE(a6) = [a1 enumerateSeries:a3 database:v11 startDate:0 endDate:0 error:a6 handler:v13];

  return (char)a6;
}

uint64_t __93__HDLocationSeriesDataEntity_copySeriesDataWithIdentifier_toSeriesIdentifier_database_error___block_invoke(void *a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v8 = a1[4];
  uint64_t v7 = (void *)a1[5];
  uint64_t v9 = a1[6];
  id v14 = 0;
  uint64_t v10 = [v7 insertOrReplaceEntity:1 database:v8 identifier:v9 timestamp:v6 location:&v14 error:a2];
  id v11 = v14;
  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    int v12 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Failed to insert location data with error: %{public}@", buf, 0xCu);
    }
  }

  return v10;
}

+ (BOOL)unitTesting_deleteSeriesDataWithIdentifier:(int64_t)a3 timestamp:(id)a4 database:(id)a5 error:(id *)a6
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  v14[0] = v10;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  LOBYTE(a6) = [a1 deleteSeriesDataWithIdentifier:a3 timestamps:v12 database:v11 error:a6];

  return (char)a6;
}

@end