@interface HDHeadphoneAudioExposureStatisticsEntity
+ (BOOL)_enumerateBucketsForProfile:(id)a3 predicate:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)_replaceExistingWithBuckets:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)insertBuckets:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_bucketFromAllPropertiesRow:(HDSQLiteRow *)a3 profile:(id)a4 error:(id *)a5;
+ (id)_loadBucketsFromProfile:(id)a3 error:(id *)a4;
+ (id)_pruneWithNowDate:(id)a3 limit:(unint64_t)a4 profile:(id)a5 error:(id *)a6;
+ (id)_sortOrderingTerms;
+ (id)databaseTable;
+ (id)indices;
+ (id)insertBucket:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
- (id)_bucketWithProfile:(id)a3 error:(id *)a4;
@end

@implementation HDHeadphoneAudioExposureStatisticsEntity

+ (id)databaseTable
{
  return (id)[NSString stringWithFormat:@"%@_headphone_audio_exposure_statistics", @"hearing"];
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $24F0BDD9EAFDCAB4A41B293A8FAF9B4C *)columnDefinitionsWithCount__columnDefinitions;
}

+ (id)indices
{
  v14[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F434C0]);
  uint64_t v3 = objc_opt_class();
  v13 = @"start_date";
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  v5 = (void *)[v2 initWithEntity:v3 name:@"start" columns:v4];
  v14[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F434C0]);
  uint64_t v7 = objc_opt_class();
  v12 = @"end_date";
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  v9 = (void *)[v6 initWithEntity:v7 name:@"end" columns:v8];
  v14[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  return v10;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)insertBucket:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  v10 = [v9 databaseForEntityClass:a1];
  v11 = _AllProperties();
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__HDHeadphoneAudioExposureStatisticsEntity_insertBucket_transaction_error___block_invoke;
  v19[3] = &unk_264795F48;
  id v12 = v8;
  id v20 = v12;
  v21 = &v22;
  v13 = [a1 insertOrReplaceEntity:0 database:v10 properties:v11 error:a5 bindingHandler:v19];

  id v14 = (id)v23[5];
  v15 = v14;
  v16 = v13;
  if (v14)
  {
    if (a5)
    {
      v16 = 0;
      *a5 = v14;
    }
    else
    {
      _HKLogDroppedError();
      v16 = 0;
    }
  }

  id v17 = v16;
  _Block_object_dispose(&v22, 8);

  return v17;
}

void __75__HDHeadphoneAudioExposureStatisticsEntity_insertBucket_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) dateInterval];
  v5 = [v4 startDate];
  MEMORY[0x22A646EC0](a2, @"start_date", v5);

  id v6 = [*(id *)(a1 + 32) dateInterval];
  uint64_t v7 = [v6 endDate];
  MEMORY[0x22A646EC0](a2, @"end_date", v7);

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v9 + 40);
  v10 = [v8 archivedRepresentationWithError:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  MEMORY[0x22A646EB0](a2, @"archived_statistics", v10);
}

+ (BOOL)insertBuckets:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(a1, "insertBucket:transaction:error:", *(void *)(*((void *)&v18 + 1) + 8 * i), v9, a5, (void)v18);

        if (!v15)
        {
          BOOL v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
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

+ (id)_pruneWithNowDate:(id)a3 limit:(unint64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v12 = [v11 database];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __82__HDHeadphoneAudioExposureStatisticsEntity__pruneWithNowDate_limit_profile_error___block_invoke;
  v17[3] = &unk_264795F98;
  id v13 = v10;
  id v18 = v13;
  id v21 = a1;
  id v14 = v11;
  unint64_t v22 = a4;
  id v19 = v14;
  long long v20 = &v23;
  LODWORD(a6) = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v17];

  if (a6)
  {
    v15 = [NSNumber numberWithInteger:v24[3]];
  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v15;
}

uint64_t __82__HDHeadphoneAudioExposureStatisticsEntity__pruneWithNowDate_limit_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = HDSampleEntityPredicateForEndDate();
  uint64_t v7 = *(void **)(a1 + 56);
  id v8 = [*(id *)(a1 + 40) database];
  id v27 = 0;
  uint64_t v9 = [v7 countOfObjectsWithPredicate:v6 healthDatabase:v8 error:&v27];
  id v10 = v27;

  id v11 = v10;
  if (v11)
  {
    if (a3)
    {
      uint64_t v12 = 0;
      *a3 = v11;
    }
    else
    {
      _HKLogDroppedError();
      uint64_t v12 = 0;
    }
    id v17 = v11;
  }
  else
  {
    if (v9 < 2)
    {
      uint64_t v12 = 1;
      goto LABEL_10;
    }
    id v13 = [v5 databaseForEntityClass:*(void *)(a1 + 56)];
    id v14 = *(void **)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 64);
    BOOL v16 = [v14 _sortOrderingTerms];
    id v17 = [v14 queryWithDatabase:v13 predicate:v6 limit:v15 orderingTerms:v16 groupBy:0];

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __82__HDHeadphoneAudioExposureStatisticsEntity__pruneWithNowDate_limit_profile_error___block_invoke_2;
    v22[3] = &unk_264795F70;
    uint64_t v18 = *(void *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v25 = v9;
    uint64_t v26 = v19;
    id v23 = v13;
    uint64_t v24 = v18;
    id v20 = v13;
    uint64_t v12 = [v17 enumeratePersistentIDsAndProperties:0 error:a3 enumerationHandler:v22];
  }
LABEL_10:

  return v12;
}

uint64_t __82__HDHeadphoneAudioExposureStatisticsEntity__pruneWithNowDate_limit_profile_error___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(*(void *)(a1[5] + 8) + 24) + 1 >= a1[6]) {
    return 1;
  }
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPersistentID:a2];
  uint64_t v8 = [v7 deleteFromDatabase:a1[4] error:a5];
  if (v8) {
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
  }

  return v8;
}

+ (id)_loadBucketsFromProfile:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x263EFF980];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__HDHeadphoneAudioExposureStatisticsEntity__loadBucketsFromProfile_error___block_invoke;
  v12[3] = &unk_264795E30;
  id v9 = v8;
  id v13 = v9;
  LODWORD(a1) = [a1 _enumerateBucketsForProfile:v7 predicate:0 error:a4 enumerationHandler:v12];

  id v10 = 0;
  if (a1) {
    id v10 = (void *)[v9 copy];
  }

  return v10;
}

uint64_t __74__HDHeadphoneAudioExposureStatisticsEntity__loadBucketsFromProfile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (BOOL)_replaceExistingWithBuckets:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 database];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__HDHeadphoneAudioExposureStatisticsEntity__replaceExistingWithBuckets_profile_error___block_invoke;
  v12[3] = &unk_264795FC0;
  id v13 = v8;
  id v14 = a1;
  id v10 = v8;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v9 error:a5 block:v12];

  return (char)a5;
}

uint64_t __86__HDHeadphoneAudioExposureStatisticsEntity__replaceExistingWithBuckets_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 40) deleteEntitiesInDatabase:v6 predicate:0 error:a3]) {
    uint64_t v7 = [*(id *)(a1 + 40) insertBuckets:*(void *)(a1 + 32) transaction:v5 error:a3];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_bucketWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__1;
  id v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  uint64_t v7 = objc_opt_class();
  id v8 = [v6 database];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__HDHeadphoneAudioExposureStatisticsEntity__bucketWithProfile_error___block_invoke;
  v13[3] = &unk_264796010;
  v13[4] = self;
  uint64_t v15 = &v16;
  id v9 = v6;
  id v14 = v9;
  LODWORD(a4) = [v7 performReadTransactionWithHealthDatabase:v8 error:a4 block:v13];

  if (a4) {
    id v10 = (void *)v17[5];
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  _Block_object_dispose(&v16, 8);
  return v11;
}

BOOL __69__HDHeadphoneAudioExposureStatisticsEntity__bucketWithProfile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__1;
  unint64_t v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = _AllProperties();
  id v8 = [v5 databaseForEntity:*(void *)(a1 + 32)];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__HDHeadphoneAudioExposureStatisticsEntity__bucketWithProfile_error___block_invoke_2;
  v15[3] = &unk_264795FE8;
  v15[4] = *(void *)(a1 + 32);
  long long v14 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v14;
  long long v16 = v14;
  id v17 = &v18;
  LOBYTE(a1) = [v6 getValuesForProperties:v7 database:v8 error:a3 handler:v15];

  if (a1)
  {
    id v10 = (id)v19[5];
    id v11 = v10;
    BOOL v12 = v10 == 0;
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
  else
  {
    BOOL v12 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __69__HDHeadphoneAudioExposureStatisticsEntity__bucketWithProfile_error___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_opt_class();
  uint64_t v6 = a1[5];
  uint64_t v7 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v5 _bucketFromAllPropertiesRow:a3 profile:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

+ (id)_sortOrderingTerms
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F434C8] orderingTermWithProperty:@"end_date" entityClass:a1 ascending:1];
  v7[0] = v3;
  v4 = [MEMORY[0x263F434C8] orderingTermWithProperty:@"start_date" entityClass:a1 ascending:1];
  v7[1] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)_bucketFromAllPropertiesRow:(HDSQLiteRow *)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = HDSQLiteColumnWithNameAsDate();
  id v10 = HDSQLiteColumnWithNameAsDate();
  id v11 = HDSQLiteColumnWithNameAsData();
  BOOL v12 = +[HDHeadphoneAudioExposureStatisticsBucket bucketForArchivedRepresentation:v11 profile:v8 error:a5];

  if (v12)
  {
    id v13 = [v12 dateInterval];
    long long v14 = [v13 startDate];
    char v15 = [v14 isEqualToDate:v9];

    if ((v15 & 1) == 0)
    {
      id v21 = [MEMORY[0x263F08690] currentHandler];
      [v21 handleFailureInMethod:a2 object:a1 file:@"HDHeadphoneAudioExposureStatisticsEntity.m" lineNumber:221 description:@"Statistics bucket's startDate did not match the entity's start_date."];
    }
    long long v16 = [v12 dateInterval];
    id v17 = [v16 endDate];
    char v18 = [v17 isEqualToDate:v10];

    if ((v18 & 1) == 0)
    {
      unint64_t v22 = [MEMORY[0x263F08690] currentHandler];
      [v22 handleFailureInMethod:a2 object:a1 file:@"HDHeadphoneAudioExposureStatisticsEntity.m" lineNumber:224 description:@"Statistics bucket's endDate did not match the entity's end_date."];
    }
    id v19 = v12;
  }

  return v12;
}

+ (BOOL)_enumerateBucketsForProfile:(id)a3 predicate:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 database];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __107__HDHeadphoneAudioExposureStatisticsEntity__enumerateBucketsForProfile_predicate_error_enumerationHandler___block_invoke;
  v18[3] = &unk_264796060;
  id v19 = v11;
  id v20 = v10;
  id v21 = v12;
  id v22 = a1;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  LOBYTE(a5) = [a1 performReadTransactionWithHealthDatabase:v13 error:a5 block:v18];

  return (char)a5;
}

uint64_t __107__HDHeadphoneAudioExposureStatisticsEntity__enumerateBucketsForProfile_predicate_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 56);
  uint64_t v6 = [a2 databaseForEntityClass:v5];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [*(id *)(a1 + 56) _sortOrderingTerms];
  uint64_t v9 = [v5 queryWithDatabase:v6 predicate:v7 limit:0 orderingTerms:v8 groupBy:0];

  id v10 = _AllProperties();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __107__HDHeadphoneAudioExposureStatisticsEntity__enumerateBucketsForProfile_predicate_error_enumerationHandler___block_invoke_2;
  v13[3] = &unk_264796038;
  uint64_t v16 = *(void *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  uint64_t v11 = [v9 enumerateProperties:v10 error:a3 enumerationHandler:v13];

  return v11;
}

uint64_t __107__HDHeadphoneAudioExposureStatisticsEntity__enumerateBucketsForProfile_predicate_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = [*(id *)(a1 + 48) _bucketFromAllPropertiesRow:a3 profile:*(void *)(a1 + 32) error:a4];
  if (v5) {
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

@end