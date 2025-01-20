@interface HDLocationSeriesSampleEntity
+ (BOOL)_rawEnumerateLocationDataInDatabase:(id)a3 HFDKey:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7 handler:(id)a8;
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)copyLocationDataFromSeriesIdentifier:(id)a3 toSeriesIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)enumerateLocationDataInDatabase:(id)a3 HFDKey:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)enumerateLocationDataWithTransaction:(id)a3 HFDKey:(id)a4 startDate:(id)a5 error:(id *)a6 handler:(id)a7;
+ (BOOL)insertLocationData:(id)a3 seriesIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)isBackedByTable;
+ (BOOL)isConcreteEntity;
+ (BOOL)participatesInInsertion;
+ (BOOL)performPostFirstJournalMergeCleanupWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)supportsObjectMerging;
+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)createTableSQL;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8;
+ (id)privateSubEntities;
+ (uint64_t)_getRangeAndCountForKey:(void *)a3 transaction:(void *)a4 error:(void *)a5 handler:;
+ (uint64_t)_insertCodableSeriesDataFromObject:(void *)a3 persistentID:(void *)a4 database:(void *)a5 error:;
+ (uint64_t)_updateFrozenEntityToMatchReplacedUnfrozenEntity:(void *)a3 unfrozenSeriesUUID:(uint64_t)a4 unfrozenSeriesHFDKey:(void *)a5 database:(uint64_t)a6 error:;
- (BOOL)_insertLocationData:(id)a3 database:(id)a4 error:(id *)a5;
- (BOOL)deleteFromDatabase:(id)a3 error:(id *)a4;
- (BOOL)enumerateLocationDataInDatabase:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)enumerateLocationDataInDatabase:(void *)a3 startDate:(void *)a4 endDate:(uint64_t)a5 error:(void *)a6 handler:;
- (BOOL)enumerateLocationDataInTransaction:(id)a3 startDate:(id)a4 endDate:(id)a5 error:(id *)a6 handler:(id)a7;
- (id)freezeWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5;
- (void)willDeleteFromDatabase:(id)a3;
@end

@implementation HDLocationSeriesSampleEntity

+ (BOOL)participatesInInsertion
{
  return 1;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = v12;
  self;
  v15 = +[HDSQLiteEntity entityWithPersistentID:v13];
  v16 = [v15 HFDKeyWithDatabase:v14 error:a7];

  if (!v16)
  {

    goto LABEL_7;
  }
  BOOL v17 = +[HDLocationSeriesDataEntity deleteSeriesDataWithIdentifier:database:error:](HDLocationSeriesDataEntity, "deleteSeriesDataWithIdentifier:database:error:", [v16 longLongValue], v14, a7);

  if (!v17)
  {
LABEL_7:
    id v20 = 0;
    goto LABEL_10;
  }
  v18 = [v11 _codableWorkoutRoute];

  if (v18
    && !+[HDLocationSeriesSampleEntity _insertCodableSeriesDataFromObject:persistentID:database:error:]((uint64_t)a1, v11, v13, v14, a7))
  {
    v19 = 0;
  }
  else
  {
    v19 = v13;
  }
  id v20 = v19;
LABEL_10:

  return v20;
}

+ (uint64_t)_insertCodableSeriesDataFromObject:(void *)a3 persistentID:(void *)a4 database:(void *)a5 error:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v30 = a4;
  v26 = v8;
  v27 = v9;
  self;
  v10 = [v8 _codableWorkoutRoute];
  v28 = v10;
  v29 = +[HDSQLiteEntity entityWithPersistentID:v9];
  id v11 = [v29 HFDKeyWithDatabase:v30 error:a5];
  if (v11)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v12 = objc_msgSend(v10, "locationDatas", v8, v9);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v45 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          uint64_t v37 = MEMORY[0x1E4F143A8];
          uint64_t v38 = 3221225472;
          v39 = __95__HDLocationSeriesSampleEntity__insertCodableSeriesDataFromObject_persistentID_database_error___block_invoke;
          v40 = &unk_1E63040E0;
          uint64_t v41 = v16;
          id v42 = v30;
          id v43 = v11;
          int v17 = HKWithAutoreleasePool();

          if (!v17)
          {

            goto LABEL_14;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    uint64_t v36 = 0;
    uint64_t v18 = [v11 longLongValue];
    v31[4] = &v33;
    id v32 = 0;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __95__HDLocationSeriesSampleEntity__insertCodableSeriesDataFromObject_persistentID_database_error___block_invoke_2;
    v31[3] = &unk_1E6304108;
    BOOL v19 = +[HDLocationSeriesDataEntity getRangeAndCountForSeriesIdentifier:v18 database:v30 error:&v32 handler:v31];
    id v20 = v32;
    v21 = v20;
    if (v19 || (objc_msgSend(v20, "hk_isHealthKitErrorWithCode:", 1100) & 1) != 0)
    {
      uint64_t v22 = [v29 updateSampleCount:v34[3] withDatabase:v30 error:a5];
    }
    else
    {
      id v23 = v21;
      v24 = v23;
      if (v23)
      {
        if (a5) {
          *a5 = v23;
        }
        else {
          _HKLogDroppedError();
        }
      }

      uint64_t v22 = 0;
    }

    _Block_object_dispose(&v33, 8);
  }
  else
  {
LABEL_14:
    uint64_t v22 = 0;
  }

  return v22;
}

BOOL __95__HDLocationSeriesSampleEntity__insertCodableSeriesDataFromObject_persistentID_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a1 + 32);
  [v4 timestamp];
  uint64_t v33 = v5;
  [v4 latitude];
  uint64_t v32 = v6;
  [v4 longitude];
  uint64_t v8 = v7;
  [v4 horizontalAccuracy];
  uint64_t v10 = v9;
  [v4 altitude];
  uint64_t v12 = v11;
  [v4 verticalAccuracy];
  uint64_t v14 = v13;
  [v4 speed];
  uint64_t v16 = v15;
  [v4 course];
  uint64_t v18 = v17;
  double v19 = -1.0;
  if ([v4 hasSpeedAccuracy])
  {
    [v4 speedAccuracy];
    double v19 = v20;
  }
  double v21 = -1.0;
  if ([v4 hasCourseAccuracy])
  {
    [v4 courseAccuracy];
    double v21 = v22;
  }
  if ([v4 hasSignalEnvironmentType]) {
    int v23 = [v4 signalEnvironmentType];
  }
  else {
    int v23 = 0;
  }
  id v24 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  int v25 = *MEMORY[0x1E4F1E768];
  int v34 = 0;
  uint64_t v35 = v32;
  uint64_t v36 = v8;
  uint64_t v37 = v10;
  uint64_t v38 = v12;
  uint64_t v39 = v14;
  uint64_t v40 = v16;
  double v41 = v19;
  uint64_t v42 = v18;
  double v43 = v21;
  uint64_t v44 = v33;
  int v45 = 0;
  unint64_t v46 = 0xBFF0000000000000;
  uint64_t v47 = 0;
  uint64_t v49 = 0;
  uint64_t v48 = 0;
  uint64_t v50 = 0x7FFFFFFF00000000;
  int v51 = v25;
  uint64_t v52 = 0;
  int v53 = v23;
  int v55 = 0;
  uint64_t v54 = 0;
  v26 = (void *)[v24 initWithClientLocation:&v34];

  uint64_t v27 = *(void *)(a1 + 40);
  uint64_t v28 = [*(id *)(a1 + 48) longLongValue];
  v29 = [v26 timestamp];
  [v29 timeIntervalSinceReferenceDate];
  BOOL v30 = +[HDLocationSeriesDataEntity insertOrReplaceEntity:database:identifier:timestamp:location:error:](HDLocationSeriesDataEntity, "insertOrReplaceEntity:database:identifier:timestamp:location:error:", 1, v27, v28, v26, a2);

  return v30;
}

+ (BOOL)insertLocationData:(id)a3 seriesIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = [v13 database];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __82__HDLocationSeriesSampleEntity_insertLocationData_seriesIdentifier_profile_error___block_invoke;
  v23[3] = &unk_1E6304130;
  id v26 = a1;
  id v24 = v12;
  SEL v27 = a2;
  id v25 = v11;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __82__HDLocationSeriesSampleEntity_insertLocationData_seriesIdentifier_profile_error___block_invoke_2;
  v19[3] = &unk_1E6304158;
  id v15 = v24;
  id v20 = v15;
  id v16 = v25;
  id v21 = v16;
  id v17 = v13;
  id v22 = v17;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v14 error:a6 block:v23 inaccessibilityHandler:v19];

  return (char)a6;
}

uint64_t __82__HDLocationSeriesSampleEntity_insertLocationData_seriesIdentifier_profile_error___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 databaseForEntityClass:a1[6]];
  uint64_t v6 = HDDataEntityPredicateForDataUUID();
  id v11 = 0;
  uint64_t v7 = +[HDDataEntity anyInDatabase:v5 predicate:v6 error:&v11];
  id v8 = v11;

  if (!v7)
  {
    if (v8)
    {
      id v8 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a1[7], @"Unable to find location series %@ during data insert."", a1[4]);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
LABEL_9:

        uint64_t v9 = 0;
        goto LABEL_10;
      }
    }
    if (a3)
    {
      id v8 = v8;
      *a3 = v8;
    }
    else
    {
      _HKLogDroppedError();
    }
    goto LABEL_9;
  }
  uint64_t v9 = [v7 _insertLocationData:a1[5] database:v5 error:a3];
LABEL_10:

  return v9;
}

+ (BOOL)isBackedByTable
{
  return 0;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)privateSubEntities
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)createTableSQL
{
  return 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(HDEntityEncoder *)[_HDLocationSeriesSampleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v11 transaction:v12 purpose:a5 encodingOptions:v13 authorizationFilter:v14];

  return v15;
}

uint64_t __95__HDLocationSeriesSampleEntity__insertCodableSeriesDataFromObject_persistentID_database_error___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (BOOL)supportsObjectMerging
{
  return 1;
}

+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8
{
  id v11 = a3;
  id v12 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v12 databaseForEntityClass:a1];
    id v14 = [v11 UUID];
    id v15 = HDDataEntityPredicateForDataUUID();
    id v16 = [a1 anyInDatabase:v13 predicate:v15 error:a7];

    if (v16)
    {
      id v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
      if (+[HDLocationSeriesSampleEntity _insertCodableSeriesDataFromObject:persistentID:database:error:]((uint64_t)a1, v11, v17, v13, a7))uint64_t v18 = v17; {
      else
      }
        uint64_t v18 = 0;
      id v19 = v18;
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

uint64_t __82__HDLocationSeriesSampleEntity_insertLocationData_seriesIdentifier_profile_error___block_invoke_2(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = -[_HDLocationInsertionJournalEntry initWithSeriesPersistentID:locationData:]([_HDLocationInsertionJournalEntry alloc], a1[4], a1[5]);
  uint64_t v6 = [a1[6] database];
  uint64_t v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

- (BOOL)_insertLocationData:(id)a3 database:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  int v23 = v9;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HDLocationSeriesSampleEntity.mm", 287, @"Invalid parameter not satisfying: %@", @"data != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"HDLocationSeriesSampleEntity.mm", 288, @"Invalid parameter not satisfying: %@", @"database != nil" object file lineNumber description];

LABEL_3:
  if ([(HDSeriesSampleEntity *)self canAddDatumInDatabase:v11 error:a5])
  {
    id v12 = [(HDSeriesSampleEntity *)self HFDKeyWithDatabase:v11 error:a5];
    if (v12)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id obj = v9;
      uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(obj);
            }
            id v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            uint64_t v17 = [v12 longLongValue];
            uint64_t v18 = [v16 timestamp];
            [v18 timeIntervalSinceReferenceDate];
            LOBYTE(v16) = +[HDLocationSeriesDataEntity insertOrReplaceEntity:database:identifier:timestamp:location:error:](HDLocationSeriesDataEntity, "insertOrReplaceEntity:database:identifier:timestamp:location:error:", 1, v11, v17, v16, a5);

            if ((v16 & 1) == 0)
            {
              BOOL v19 = 0;
              goto LABEL_16;
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
      BOOL v19 = 1;
LABEL_16:
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Unable to add data to a frozen series.");
    BOOL v19 = 0;
  }

  return v19;
}

+ (BOOL)performPostFirstJournalMergeCleanupWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v7 = a4;
  id v37 = 0;
  id v8 = +[HDWorkoutBuilderAssociatedSeriesEntity allBuilderAssociatedSeriesWithProfile:v7 error:&v37];
  id v9 = v37;
  if (v8)
  {
    long long v26 = HDSeriesSamplePredicateForSamplesToAutoFreezeExcludingSamples(v8);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_msgSend(v28, "protectedDatabase", v10);
    id v36 = v9;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __97__HDLocationSeriesSampleEntity_performPostFirstJournalMergeCleanupWithTransaction_profile_error___block_invoke;
    v34[3] = &unk_1E6304180;
    id v27 = v10;
    id v35 = v27;
    char v12 = [a1 enumerateEntitiesInDatabase:v11 predicate:v26 error:&v36 enumerationHandler:v34];
    id v13 = v36;

    if (v12)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v14 = v27;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v31;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * v17);
            id v29 = v13;
            BOOL v19 = [v18 freezeWithTransaction:v28 profile:v7 error:&v29];
            id v20 = v29;

            id v13 = v20;
            if (!v19)
            {
              _HKInitializeLogging();
              id v21 = (id)*MEMORY[0x1E4F29F18];
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                uint64_t v22 = [v18 persistentID];
                *(_DWORD *)buf = 134218242;
                uint64_t v39 = v22;
                __int16 v40 = 2114;
                id v41 = v20;
                _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "Failed to freeze workout route %lld during post-journal-merge cleanup: %{public}@", buf, 0x16u);
              }
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v42 count:16];
        }
        while (v15);
      }
    }
    else
    {
      _HKInitializeLogging();
      id v24 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v39 = (uint64_t)v13;
        _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "Failed to enumerate workout routes requiring auto-freeze during post-journal-merge cleanup: %{public}@", buf, 0xCu);
      }
    }

    id v9 = v13;
  }
  else
  {
    _HKInitializeLogging();
    int v23 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = (uint64_t)v9;
      _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "Failed to determine builder-associated series during post-journal-merge cleanup: %{public}@", buf, 0xCu);
    }
  }

  return 1;
}

uint64_t __97__HDLocationSeriesSampleEntity_performPostFirstJournalMergeCleanupWithTransaction_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (BOOL)enumerateLocationDataInDatabase:(id)a3 HFDKey:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = HDSeriesSamplePredicateForSeriesIdentifier([v11 longLongValue]);
  id v14 = [a1 anyInDatabase:v10 predicate:v13 error:a5];

  if (v14) {
    char v15 = [v14 enumerateLocationDataInDatabase:v10 error:a5 handler:v12];
  }
  else {
    char v15 = 1;
  }

  return v15;
}

- (BOOL)enumerateLocationDataInDatabase:(id)a3 error:(id *)a4 handler:(id)a5
{
  return -[HDLocationSeriesSampleEntity enumerateLocationDataInDatabase:startDate:endDate:error:handler:](self, a3, 0, 0, (uint64_t)a4, a5);
}

- (BOOL)enumerateLocationDataInDatabase:(void *)a3 startDate:(void *)a4 endDate:(uint64_t)a5 error:(void *)a6 handler:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (a1)
  {
    char v15 = [a1 HFDKeyWithDatabase:v11 error:a5];
    if (v15) {
      BOOL v16 = +[HDLocationSeriesSampleEntity _rawEnumerateLocationDataInDatabase:v11 HFDKey:v15 startDate:v12 endDate:v13 error:a5 handler:v14];
    }
    else {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)enumerateLocationDataInTransaction:(id)a3 startDate:(id)a4 endDate:(id)a5 error:(id *)a6 handler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  char v15 = [a3 databaseForEntity:self];
  LOBYTE(a6) = -[HDLocationSeriesSampleEntity enumerateLocationDataInDatabase:startDate:endDate:error:handler:](self, v15, v12, v13, (uint64_t)a6, v14);

  return (char)a6;
}

+ (BOOL)enumerateLocationDataWithTransaction:(id)a3 HFDKey:(id)a4 startDate:(id)a5 error:(id *)a6 handler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  char v15 = [a3 databaseForEntityClass:a1];
  BOOL v16 = HDSeriesSamplePredicateForSeriesIdentifier([v12 longLongValue]);
  uint64_t v17 = [a1 anyInDatabase:v15 predicate:v16 error:a6];

  if (v17)
  {
    uint64_t v18 = [v17 HFDKeyWithDatabase:v15 error:a6];
    if (v18) {
      BOOL v19 = +[HDLocationSeriesSampleEntity _rawEnumerateLocationDataInDatabase:v15 HFDKey:v18 startDate:v13 endDate:0 error:a6 handler:v14];
    }
    else {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

+ (BOOL)_rawEnumerateLocationDataInDatabase:(id)a3 HFDKey:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7 handler:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  uint64_t v17 = [a4 longLongValue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __107__HDLocationSeriesSampleEntity__rawEnumerateLocationDataInDatabase_HFDKey_startDate_endDate_error_handler___block_invoke;
  v20[3] = &unk_1E63041A8;
  id v18 = v16;
  id v21 = v18;
  LOBYTE(a7) = +[HDLocationSeriesDataEntity enumerateSeries:v17 database:v13 startDate:v14 endDate:v15 error:a7 handler:v20];

  return (char)a7;
}

uint64_t __107__HDLocationSeriesSampleEntity__rawEnumerateLocationDataInDatabase_HFDKey_startDate_endDate_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)copyLocationDataFromSeriesIdentifier:(id)a3 toSeriesIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v27 = a3;
  id v28 = a4;
  id v11 = [a5 databaseForEntityClass:a1];
  id v12 = HDDataEntityPredicateForDataUUID();
  id v32 = 0;
  id v13 = +[HDDataEntity anyInDatabase:v11 predicate:v12 error:&v32];
  id v14 = v32;

  if (v13)
  {
    id v31 = v14;
    id v15 = [v13 HFDKeyWithDatabase:v11 error:&v31];
    id v16 = v31;

    if (v15)
    {
      uint64_t v17 = HDDataEntityPredicateForDataUUID();
      SEL v25 = a2;
      id v30 = 0;
      id v18 = +[HDDataEntity anyInDatabase:v11 predicate:v17 error:&v30];
      id v19 = v30;

      long long v26 = v18;
      if (v18)
      {
        id v29 = v19;
        id v20 = [v18 HFDKeyWithDatabase:v11 error:&v29];
        id v21 = v29;

        if (v20)
        {
          BOOL v22 = +[HDLocationSeriesDataEntity copySeriesDataWithIdentifier:toSeriesIdentifier:database:error:](HDLocationSeriesDataEntity, "copySeriesDataWithIdentifier:toSeriesIdentifier:database:error:", [v15 longLongValue], objc_msgSend(v20, "longLongValue"), v11, a6);
LABEL_24:

          goto LABEL_25;
        }
        id v19 = v21;
      }
      if (v19)
      {
        id v23 = v19;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), v25, @"Unable to find destination location series %@ during data copy."", v28);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          BOOL v22 = 1;
LABEL_23:

          id v20 = 0;
          id v21 = v23;
          goto LABEL_24;
        }
      }
      if (a6)
      {
        id v23 = v23;
        BOOL v22 = 0;
        *a6 = v23;
      }
      else
      {
        _HKLogDroppedError();
        BOOL v22 = 0;
      }
      goto LABEL_23;
    }
    id v14 = v16;
  }
  if (v14)
  {
    id v15 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Unable to find source location series %@ during data copy."", v27);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      id v16 = 0;
      BOOL v22 = 1;
      goto LABEL_25;
    }
  }
  if (a6)
  {
    id v15 = v15;
    BOOL v22 = 0;
    *a6 = v15;
  }
  else
  {
    _HKLogDroppedError();
    BOOL v22 = 0;
  }
  id v16 = v15;
LABEL_25:

  return v22;
}

- (BOOL)deleteFromDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(HDLocationSeriesSampleEntity *)self willDeleteFromDatabase:v6];
  v8.receiver = self;
  v8.super_class = (Class)HDLocationSeriesSampleEntity;
  LOBYTE(a4) = [(HDSQLiteEntity *)&v8 deleteFromDatabase:v6 error:a4];

  return (char)a4;
}

- (void)willDeleteFromDatabase:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v10 = 0;
  uint64_t v5 = [(HDSeriesSampleEntity *)self HFDKeyWithDatabase:v4 error:&v10];
  id v6 = v10;
  if (v5)
  {
    id v9 = v6;
    +[HDLocationSeriesDataEntity deleteSeriesDataWithIdentifier:database:error:](HDLocationSeriesDataEntity, "deleteSeriesDataWithIdentifier:database:error:", [v5 longLongValue], v4, &v9);
    id v7 = v6;
    id v6 = v9;
  }
  else
  {
    _HKInitializeLogging();
    id v7 = (id)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int64_t v8 = [(HDSQLiteEntity *)self persistentID];
      *(_DWORD *)buf = 134218242;
      int64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Failed to find HFD Key when deleting object with persistent id %lld: %{public}@", buf, 0x16u);
    }
  }
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  v3 = [a3 locationSeries];

  return v3;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5) {
    [v6 addLocationSeries:v5];
  }

  return v5 != 0;
}

- (id)freezeWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v83 = a4;
  uint64_t v94 = 0;
  v95 = (double *)&v94;
  uint64_t v96 = 0x2020000000;
  CFAbsoluteTime Current = 0.0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v90 = 0;
  v91 = (double *)&v90;
  uint64_t v93 = 0;
  uint64_t v9 = *((void *)v95 + 3);
  uint64_t v92 = 0x2020000000;
  uint64_t v93 = v9;
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x2020000000;
  uint64_t v89 = 0;
  v82 = [v8 databaseForEntity:self];
  id v10 = [(HDSeriesSampleEntity *)self HFDKeyWithDatabase:v82 error:a5];
  if (!v10)
  {
LABEL_7:
    id v25 = 0;
    goto LABEL_63;
  }
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __68__HDLocationSeriesSampleEntity_freezeWithTransaction_profile_error___block_invoke;
  v85[3] = &unk_1E63041D0;
  v85[4] = &v94;
  v85[5] = &v90;
  v85[6] = &v86;
  if ((+[HDLocationSeriesSampleEntity _getRangeAndCountForKey:transaction:error:handler:]((uint64_t)HDLocationSeriesSampleEntity, v10, v8, a5, v85) & 1) == 0)
  {
    _HKInitializeLogging();
    id v20 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *((void *)v95 + 3);
      BOOL v22 = (uint64_t (*)(uint64_t, uint64_t))*((void *)v91 + 3);
      uint64_t v23 = v87[3];
      id v24 = *a5;
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2048;
      v103 = v22;
      *(_WORD *)v104 = 2048;
      *(void *)&v104[2] = v23;
      *(_WORD *)&v104[10] = 2112;
      *(void *)&v104[12] = v24;
      _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@: Failed getting range and count for location series during freeze. start:%f, end:%f, count:%lld, error:%@", buf, 0x34u);
    }
    goto LABEL_7;
  }
  objc_msgSend(NSNumber, "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v83;
  __int16 v13 = self;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v103 = __Block_byref_object_copy__125;
  *(void *)v104 = __Block_byref_object_dispose__125;
  *(void *)&v104[8] = 0;
  id v14 = [v13 entityEnumeratorWithProfile:v12];
  uint64_t v15 = HDDataEntityPredicateForRowID((uint64_t)v11, 1);
  [v14 setPredicate:v15];

  [v14 setIgnoreEntityClassAdditionalPredicateForEnumeration:1];
  id v99 = 0;
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __79__HDLocationSeriesSampleEntity__routeSampleWithID_canBeUnfrozen_profile_error___block_invoke;
  v98[3] = &unk_1E6304220;
  v98[4] = buf;
  [v14 enumerateWithError:&v99 handler:v98];
  id v16 = v99;
  id v17 = v16;
  id v18 = *(void **)(*(void *)&buf[8] + 40);
  v81 = v18;
  if (v18)
  {
    id v19 = v18;
    goto LABEL_15;
  }
  if (v16)
  {
    id v17 = v16;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Could not find series with ID %@", v11);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
LABEL_11:
    if (a5)
    {
      id v17 = v17;
      *a5 = v17;
    }
    else
    {
      _HKLogDroppedError();
    }
  }

  id v18 = 0;
LABEL_15:

  _Block_object_dispose(buf, 8);
  if (!v18)
  {
    uint64_t v43 = v81;
    _HKInitializeLogging();
    uint64_t v44 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      id v45 = *a5;
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v45;
      _os_log_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@: Failed getting unfrozen route sample, error:%@", buf, 0x16u);
    }
    id v25 = 0;
    goto LABEL_62;
  }
  long long v26 = [v81 UUID];
  v75 = (void *)[v26 copy];

  uint64_t v74 = [v10 longLongValue];
  v77 = [v81 metadata];
  id v27 = [v81 sourceRevision];
  id v28 = [v27 source];
  v76 = [v28 _sourceID];

  [v10 longLongValue];
  double v29 = v95[3];
  double v30 = v91[3];
  uint64_t v31 = v87[3];
  id v78 = v81;
  id v80 = v12;
  id v32 = v8;
  v79 = v32;
  if (self)
  {
    long long v33 = [v32 databaseForEntity:self];
    int v34 = [(HDSQLiteEntity *)self valueForProperty:@"provenance" database:v33];

    if (v34)
    {
      id v35 = [v80 dataProvenanceManager];
      id v36 = [v35 originProvenanceForPersistentID:v34 transaction:v79 error:a5];

      if (v36)
      {
        v73 = [MEMORY[0x1E4F29128] UUID];
        objc_msgSend(v78, "_setUUID:");
        [v78 _setStartTimestamp:v29];
        [v78 _setEndTimestamp:v30];
        [v78 _setCount:v31];
        [v78 _setMetadata:0];
        id v37 = [v80 dataManager];
        *(void *)buf = v78;
        uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
        uint64_t v39 = [v78 _creationDate];
        [v39 timeIntervalSinceReferenceDate];
        char v40 = objc_msgSend(v37, "insertDataObjects:withProvenance:creationDate:error:", v38, v36, a5);

        if (v40)
        {
          id v41 = v73;
          id v42 = v73;
        }
        else
        {
          id v42 = 0;
          id v41 = v73;
        }
      }
      else
      {
        id v42 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 100, @"Unable to get %@ for %@ with persistentID %lld", @"provenance", objc_opt_class(), -[HDSQLiteEntity persistentID](self, "persistentID"));
      id v42 = 0;
    }
  }
  else
  {
    id v42 = 0;
  }

  if (!v42)
  {
    _HKInitializeLogging();
    v58 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      id v59 = *a5;
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v59;
      _os_log_impl(&dword_1BCB7D000, v58, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@: Frozen series uuid is nil, error:%@", buf, 0x16u);
    }
    id v25 = 0;
    goto LABEL_61;
  }
  unint64_t v46 = HDDataEntityPredicateForDataUUID();
  uint64_t v47 = +[HDDataEntity anyInDatabase:v82 predicate:v46 error:a5];

  if (!v47)
  {
    _HKInitializeLogging();
    v60 = *MEMORY[0x1E4F29FB8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_59;
    }
    id v61 = *a5;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v61;
    v62 = "[routes] %{public}@: Frozen series entity is nil, error:%@";
LABEL_57:
    v69 = v60;
    uint32_t v70 = 22;
    goto LABEL_58;
  }
  if (([v47 updateSampleCount:v87[3] withDatabase:v82 error:a5] & 1) == 0)
  {
    _HKInitializeLogging();
    v60 = *MEMORY[0x1E4F29FB8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_59;
    }
    id v63 = *a5;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v63;
    v62 = "[routes] %{public}@: Updating sample count for Frozen entity failed, error:%@";
    goto LABEL_57;
  }
  v101[0] = @"start_date";
  v101[1] = @"end_date";
  uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:2];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __68__HDLocationSeriesSampleEntity_freezeWithTransaction_profile_error___block_invoke_321;
  v84[3] = &unk_1E63041F8;
  v84[4] = &v94;
  v84[5] = &v90;
  char v49 = [v47 updateProperties:v48 database:v82 error:a5 bindingHandler:v84];

  if ((v49 & 1) == 0)
  {
    _HKInitializeLogging();
    v60 = *MEMORY[0x1E4F29FB8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_59;
    }
    id v64 = *a5;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v64;
    v62 = "[routes] %{public}@: Updating properties for frozen entity failed, error:%@";
    goto LABEL_57;
  }
  uint64_t v50 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
  int v51 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v47, "persistentID"));
  BOOL v52 = +[HDSeriesSampleEntity replaceObjectID:v50 replacementObjectID:v51 deleteOriginalSeriesData:0 insertDeletedObject:0 profile:v80 transaction:v79 error:a5];

  if (!v52)
  {
    _HKInitializeLogging();
    v60 = *MEMORY[0x1E4F29FB8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_59;
    }
    id v65 = *a5;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v65;
    v62 = "[routes] %{public}@: Replacing old entity with new entity failed, error:%@";
    goto LABEL_57;
  }
  if (v77)
  {
    int v53 = [v80 metadataManager];
    uint64_t v54 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v47, "persistentID"));
    char v55 = objc_msgSend(v53, "insertMetadata:forObjectID:sourceID:externalSyncObjectCode:objectDeleted:error:", v77, v54, v76, objc_msgSend(v78, "_externalSyncObjectCode"), 0, a5);

    if ((v55 & 1) == 0)
    {
      _HKInitializeLogging();
      v67 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        v68 = (uint64_t (*)(uint64_t, uint64_t))*a5;
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v77;
        *(_WORD *)&buf[22] = 2112;
        v103 = v68;
        v62 = "[routes] %{public}@: Adding metadata failed, metadata:%@ error:%@";
        v69 = v67;
        uint32_t v70 = 32;
LABEL_58:
        _os_log_impl(&dword_1BCB7D000, v69, OS_LOG_TYPE_DEFAULT, v62, buf, v70);
        goto LABEL_59;
      }
      goto LABEL_59;
    }
  }
  v100 = @"frozen";
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
  char v57 = [v47 updateProperties:v56 database:v82 error:a5 bindingHandler:&__block_literal_global_148];

  if ((v57 & 1) == 0)
  {
    _HKInitializeLogging();
    v60 = *MEMORY[0x1E4F29FB8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_59;
    }
    id v66 = *a5;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v66;
    v62 = "[routes] %{public}@: Marking series as frozen failed, error:%@";
    goto LABEL_57;
  }
  if ((+[HDLocationSeriesSampleEntity _updateFrozenEntityToMatchReplacedUnfrozenEntity:unfrozenSeriesUUID:unfrozenSeriesHFDKey:database:error:]((uint64_t)HDLocationSeriesSampleEntity, v47, v75, v74, v82, (uint64_t)a5) & 1) == 0)
  {
    _HKInitializeLogging();
    v60 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      id v71 = *a5;
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v71;
      v62 = "[routes] %{public}@: Update the new entity so it has the same UUID and hfd_key as the replaced entity failed, error:%@";
      goto LABEL_57;
    }
LABEL_59:
    id v25 = 0;
    goto LABEL_60;
  }
  id v25 = v47;
LABEL_60:

LABEL_61:
  uint64_t v43 = v81;
LABEL_62:

LABEL_63:
  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v94, 8);

  return v25;
}

void *__68__HDLocationSeriesSampleEntity_freezeWithTransaction_profile_error___block_invoke(void *result, uint64_t a2, double a3, double a4)
{
  *(double *)(*(void *)(result[4] + 8) + 24) = a3;
  *(double *)(*(void *)(result[5] + 8) + 24) = a4;
  *(void *)(*(void *)(result[6] + 8) + 24) = a2;
  return result;
}

+ (uint64_t)_getRangeAndCountForKey:(void *)a3 transaction:(void *)a4 error:(void *)a5 handler:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  self;
  uint64_t v11 = [v8 longLongValue];
  id v12 = [v9 protectedDatabase];
  id v20 = 0;
  BOOL v13 = +[HDLocationSeriesDataEntity getRangeAndCountForSeriesIdentifier:v11 database:v12 error:&v20 handler:v10];
  id v14 = v20;

  if (v13) {
    goto LABEL_4;
  }
  if (objc_msgSend(v14, "hk_isHealthKitErrorWithCode:", 1100))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v10[2](v10, 0, Current, Current);
LABEL_4:
    uint64_t v16 = 1;
    goto LABEL_10;
  }
  id v17 = v14;
  id v18 = v17;
  if (v17)
  {
    if (a4) {
      *a4 = v17;
    }
    else {
      _HKLogDroppedError();
    }
  }

  uint64_t v16 = 0;
LABEL_10:

  return v16;
}

void __68__HDLocationSeriesSampleEntity_freezeWithTransaction_profile_error___block_invoke_321(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E50](a2, @"start_date", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));

  JUMPOUT(0x1C1879E50);
}

void __68__HDLocationSeriesSampleEntity_freezeWithTransaction_profile_error___block_invoke_323()
{
}

+ (uint64_t)_updateFrozenEntityToMatchReplacedUnfrozenEntity:(void *)a3 unfrozenSeriesUUID:(uint64_t)a4 unfrozenSeriesHFDKey:(void *)a5 database:(uint64_t)a6 error:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  self;
  v23[0] = @"uuid";
  BOOL v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __136__HDLocationSeriesSampleEntity__updateFrozenEntityToMatchReplacedUnfrozenEntity_unfrozenSeriesUUID_unfrozenSeriesHFDKey_database_error___block_invoke;
  v20[3] = &unk_1E6304248;
  id v14 = v11;
  id v21 = v14;
  char v15 = [v10 updateProperties:v13 database:v12 error:a6 bindingHandler:v20];

  if (v15)
  {
    BOOL v22 = @"hfd_key";
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __136__HDLocationSeriesSampleEntity__updateFrozenEntityToMatchReplacedUnfrozenEntity_unfrozenSeriesUUID_unfrozenSeriesHFDKey_database_error___block_invoke_2;
    v19[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
    void v19[4] = a4;
    uint64_t v17 = [v10 updateProperties:v16 database:v12 error:a6 bindingHandler:v19];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t __79__HDLocationSeriesSampleEntity__routeSampleWithID_canBeUnfrozen_profile_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

void __136__HDLocationSeriesSampleEntity__updateFrozenEntityToMatchReplacedUnfrozenEntity_unfrozenSeriesUUID_unfrozenSeriesHFDKey_database_error___block_invoke()
{
}

void __136__HDLocationSeriesSampleEntity__updateFrozenEntityToMatchReplacedUnfrozenEntity_unfrozenSeriesUUID_unfrozenSeriesHFDKey_database_error___block_invoke_2()
{
}

+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  id v25 = a3;
  id v8 = a5;
  id v9 = NSString;
  id v24 = v8;
  id v10 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v11 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v12 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  BOOL v13 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v23 = a4;
  id v14 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  char v15 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v16 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v17 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  objc_msgSend(v9, "stringWithFormat:", @"SELECT %@.%@, %@, %@, %@, %@, %@ FROM %@ LEFT JOIN %@ ON %@.%@ = %@.%@ LEFT JOIN %@ ON %@.%@ = %@.%@", v10, @"data_id", @"count", @"hfd_key", @"start_date", @"end_date", @"uuid", v11, v12, v13, @"data_id", v14, @"data_id", v15, v16, @"data_id",
    v17,
  id v18 = @"data_id");

  id v19 = [v25 database];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __87__HDLocationSeriesSampleEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke;
  v26[3] = &unk_1E6304298;
  id v20 = v18;
  id v27 = v20;
  id v29 = a1;
  id v21 = v24;
  id v28 = v21;
  LOBYTE(v11) = [a1 performReadTransactionWithHealthDatabase:v19 error:v23 block:v26];

  return (char)v11;
}

uint64_t __87__HDLocationSeriesSampleEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 protectedDatabase];
  uint64_t v7 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__HDLocationSeriesSampleEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke_2;
  v11[3] = &unk_1E6304270;
  uint64_t v14 = *(void *)(a1 + 48);
  id v8 = v5;
  id v12 = v8;
  id v13 = *(id *)(a1 + 40);
  uint64_t v9 = [v6 executeSQL:v7 error:a3 bindingHandler:0 enumerationHandler:v11];

  return v9;
}

uint64_t __87__HDLocationSeriesSampleEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  id v5 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v44 = HDSQLiteColumnWithNameAsNumber();
  id v6 = HDSQLiteColumnWithNameAsNumber();
  HDSQLiteColumnWithNameAsDouble();
  double v8 = v7;
  HDSQLiteColumnWithNameAsDouble();
  double v10 = v9;
  id v11 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  uint64_t v51 = 0;
  BOOL v52 = (double *)&v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = (double *)&v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  uint64_t v12 = a1[6];
  id v13 = (void *)a1[4];
  v45[6] = &v47;
  id v46 = 0;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __87__HDLocationSeriesSampleEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke_3;
  v45[3] = &unk_1E63041D0;
  v45[4] = &v55;
  v45[5] = &v51;
  char v14 = +[HDLocationSeriesSampleEntity _getRangeAndCountForKey:transaction:error:handler:](v12, v6, v13, &v46, v45);
  id v15 = v46;
  uint64_t v16 = v15;
  if ((v14 & 1) == 0)
  {
    uint64_t v33 = a1[5];
    id v32 = (void *)a1[6];
    int v34 = NSString;
    id v35 = [v15 localizedDescription];
    id v36 = [v34 stringWithFormat:@"Could not access location series data (%@)", v35];
    id v37 = [v32 createValidationError:v36 rowId:v5];
    (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v37);

    id v38 = v16;
    id v29 = v38;
    if (v38)
    {
      if (a3)
      {
        id v29 = v38;
        *a3 = v29;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    goto LABEL_18;
  }
  uint64_t v17 = v56[3];
  if (!v17)
  {
    uint64_t v40 = a1[5];
    uint64_t v39 = (void *)a1[6];
    id v29 = [NSString stringWithFormat:@"Missing HFD samples history, entity's count is %@", v44];
    uint64_t v31 = [v39 createValidationError:v29 rowId:v5];
    (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v31);
    goto LABEL_16;
  }
  if (v17 != [v44 longValue])
  {
    uint64_t v19 = a1[5];
    id v18 = (void *)a1[6];
    id v20 = [NSString stringWithFormat:@"HFD samples count mismatch: count in HFD=%lld, count in SQLite=%@", v56[3], v44];
    id v21 = [v18 createValidationError:v20 rowId:v5];
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v21);
  }
  double v22 = v8 - v52[3];
  if (v22 < 0.0) {
    double v22 = -v22;
  }
  if (v22 > 2.22044605e-16) {
    goto LABEL_11;
  }
  double v23 = v10 - v48[3];
  if (v23 < 0.0) {
    double v23 = -v23;
  }
  if (v23 > 2.22044605e-16)
  {
LABEL_11:
    id v24 = NSString;
    id v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v8];
    long long v26 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v10];
    id v27 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v52[3]];
    id v28 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v48[3]];
    [v24 stringWithFormat:@"Series date interval mismatch start_date=%@ end_date=%@ hfd_start_date=%@ hfd_end_date=%@", v25, v26, v27, v28];
    id v29 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v30 = a1[5];
    uint64_t v31 = [(id)a1[6] createValidationError:v29 rowId:v5];
    (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v31);
LABEL_16:

LABEL_18:
  }
  if (!v11)
  {
    uint64_t v41 = a1[5];
    id v42 = [(id)a1[6] createValidationError:@"UUID not set" rowId:v5];
    (*(void (**)(uint64_t, void *))(v41 + 16))(v41, v42);
  }
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  return 1;
}

void *__87__HDLocationSeriesSampleEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke_3(void *result, uint64_t a2, double a3, double a4)
{
  *(void *)(*(void *)(result[4] + 8) + 24) = a2;
  *(double *)(*(void *)(result[5] + 8) + 24) = a3;
  *(double *)(*(void *)(result[6] + 8) + 24) = a4;
  return result;
}

@end