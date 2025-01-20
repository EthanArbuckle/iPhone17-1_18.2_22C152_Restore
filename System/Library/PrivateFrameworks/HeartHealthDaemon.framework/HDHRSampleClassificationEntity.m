@interface HDHRSampleClassificationEntity
+ (BOOL)deleteAllClassificationsWithTransaction:(id)a3 error:(id *)a4;
+ (BOOL)deleteClassificationWithSampleUUID:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_insertEntityWithSampleUUID:(id)a3 classification:(int64_t)a4 sampleStartDate:(id)a5 sampleDuration:(double)a6 sampleTimeZone:(id)a7 transaction:(id)a8 error:(id *)a9;
+ (id)allSampleClassificationsWithTransaction:(id)a3 error:(id *)a4;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)insertSampleClassification:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
+ (id)sampleClassificationWithSampleUUID:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
@end

@implementation HDHRSampleClassificationEntity

+ (id)sampleClassificationWithSampleUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  v10 = [v9 databaseForEntityClass:a1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__HDHRSampleClassificationEntity_sampleClassificationWithSampleUUID_transaction_error___block_invoke;
  v18[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v18[4] = a1;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__HDHRSampleClassificationEntity_sampleClassificationWithSampleUUID_transaction_error___block_invoke_2;
  v16[3] = &unk_1E69B3FE8;
  id v11 = v8;
  id v17 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__HDHRSampleClassificationEntity_sampleClassificationWithSampleUUID_transaction_error___block_invoke_3;
  v15[3] = &unk_1E69B4010;
  v15[4] = &v19;
  LODWORD(a5) = [v10 executeCachedStatementForKey:&sampleClassificationWithSampleUUID_transaction_error__lookupKey error:a5 SQLGenerator:v18 bindingHandler:v16 enumerationHandler:v15];

  if (a5) {
    v12 = (void *)v20[5];
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);

  return v13;
}

id __87__HDHRSampleClassificationEntity_sampleClassificationWithSampleUUID_transaction_error___block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  v2 = [v0 stringWithFormat:@"SELECT %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?", @"sample_uuid", @"classification", @"sample_start_date", @"sample_duration", @"sample_time_zone", v1, @"sample_uuid", 0];

  return v2;
}

uint64_t __87__HDHRSampleClassificationEntity_sampleClassificationWithSampleUUID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  v4[1] = 0;
  [*(id *)(a1 + 32) getUUIDBytes:v4];
  return sqlite3_bind_blob(a2, 1, v4, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __87__HDHRSampleClassificationEntity_sampleClassificationWithSampleUUID_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = _SampleClassificationFromRow(a2, a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 0;
}

+ (id)allSampleClassificationsWithTransaction:(id)a3 error:(id *)a4
{
  v6 = [a3 databaseForEntityClass:a1];
  v7 = [a1 queryWithDatabase:v6 predicate:0 limit:0 orderingTerms:0 groupBy:0];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = HDHRSampleClassificationEntityPropertiesForModel();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__HDHRSampleClassificationEntity_allSampleClassificationsWithTransaction_error___block_invoke;
  v14[3] = &unk_1E69B4038;
  id v15 = v8;
  id v16 = a1;
  id v10 = v8;
  LODWORD(a4) = [v7 enumerateProperties:v9 error:a4 enumerationHandler:v14];

  if (a4) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  return v12;
}

uint64_t __80__HDHRSampleClassificationEntity_allSampleClassificationsWithTransaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v8 = 0;
  uint64_t v4 = _SampleClassificationFromRow(a3, (uint64_t)&v8);
  id v5 = v8;
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      __80__HDHRSampleClassificationEntity_allSampleClassificationsWithTransaction_error___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }

  return 1;
}

+ (id)insertSampleClassification:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 sampleUUID];
  uint64_t v11 = [v9 classification];
  id v12 = [v9 sampleDateInterval];
  id v13 = [v12 startDate];
  v14 = [v9 sampleDateInterval];
  [v14 duration];
  double v16 = v15;
  id v17 = [v9 sampleTimeZone];

  v18 = [a1 _insertEntityWithSampleUUID:v10 classification:v11 sampleStartDate:v13 sampleDuration:v17 sampleTimeZone:v8 transaction:a5 error:v16];

  return v18;
}

+ (BOOL)deleteAllClassificationsWithTransaction:(id)a3 error:(id *)a4
{
  v6 = [a3 databaseForEntityClass:a1];
  v7 = [MEMORY[0x1E4F65D58] truePredicate];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  LOBYTE(a4) = [v8 deleteAllEntitiesWithError:a4];
  return (char)a4;
}

+ (BOOL)deleteClassificationWithSampleUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  id v10 = [v8 predicateWithProperty:@"sample_uuid" value:a3 comparisonType:1];
  uint64_t v11 = [v9 databaseForEntityClass:a1];

  id v12 = [a1 queryWithDatabase:v11 predicate:v10];

  LOBYTE(a5) = [v12 deleteAllEntitiesWithError:a5];
  return (char)a5;
}

+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v13 = objc_msgSend(v12, "hk_dateBySubtractingDays:fromDate:", 44, v11);

  v14 = (void *)MEMORY[0x1E4F65D00];
  double v15 = _HDSQLiteValueForDate();
  double v16 = [v14 predicateWithProperty:@"sample_start_date" value:v15 comparisonType:4];

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  id v17 = [v10 database];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __71__HDHRSampleClassificationEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  id v24 = &unk_1E69B4060;
  id v27 = a1;
  id v18 = v16;
  unint64_t v28 = a5;
  id v25 = v18;
  v26 = &v29;
  LODWORD(a6) = [a1 performWriteTransactionWithHealthDatabase:v17 error:a6 block:&v21];

  if (a6)
  {
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithInt:", *((unsigned int *)v30 + 6), v21, v22, v23, v24);
  }
  else
  {
    uint64_t v19 = 0;
  }

  _Block_object_dispose(&v29, 8);

  return v19;
}

uint64_t __71__HDHRSampleClassificationEntity_pruneWithProfile_nowDate_limit_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:a1[6]];
  id v6 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v6 setEntityClass:objc_opt_class()];
  [v6 setPredicate:a1[4]];
  [v6 setLimitCount:a1[7]];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F65D60]) initWithDatabase:v5 descriptor:v6];
  uint64_t v8 = [v7 deleteAllEntitiesWithError:a3];
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = [v5 getChangesCount];

  return v8;
}

+ (id)databaseTable
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"%@_sample_classifications", @"heart"];

  return v2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $24F0BDD9EAFDCAB4A41B293A8FAF9B4C *)columnDefinitionsWithCount__columnDefinitions;
}

+ (id)foreignKeys
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"sample_uuid";
  id v2 = objc_alloc(MEMORY[0x1E4F65D20]);
  v3 = (void *)[v2 initWithEntityClass:objc_opt_class() property:*MEMORY[0x1E4F659C0] deletionAction:2];
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)_insertEntityWithSampleUUID:(id)a3 classification:(int64_t)a4 sampleStartDate:(id)a5 sampleDuration:(double)a6 sampleTimeZone:(id)a7 transaction:(id)a8 error:(id *)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  uint64_t v19 = [a8 databaseForEntityClass:a1];
  v20 = HDHRSampleClassificationEntityPropertiesForModel();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __141__HDHRSampleClassificationEntity__insertEntityWithSampleUUID_classification_sampleStartDate_sampleDuration_sampleTimeZone_transaction_error___block_invoke;
  v26[3] = &unk_1E69B4118;
  id v27 = v16;
  id v28 = v17;
  double v31 = a6;
  id v29 = v18;
  int64_t v30 = a4;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = [a1 insertOrReplaceEntity:1 database:v19 properties:v20 error:a9 bindingHandler:v26];

  return v24;
}

void __141__HDHRSampleClassificationEntity__insertEntityWithSampleUUID_classification_sampleStartDate_sampleDuration_sampleTimeZone_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1D943A8A0](a2, @"sample_uuid", *(void *)(a1 + 32));
  MEMORY[0x1D943A880](a2, @"classification", *(void *)(a1 + 56));
  MEMORY[0x1D943A860](a2, @"sample_start_date", *(void *)(a1 + 40));
  MEMORY[0x1D943A870](a2, @"sample_duration", *(double *)(a1 + 64));
  id v4 = [*(id *)(a1 + 48) name];
  MEMORY[0x1D943A890](a2, @"sample_time_zone", v4);
}

void __80__HDHRSampleClassificationEntity_allSampleClassificationsWithTransaction_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpectedly unable to load sample classification: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end