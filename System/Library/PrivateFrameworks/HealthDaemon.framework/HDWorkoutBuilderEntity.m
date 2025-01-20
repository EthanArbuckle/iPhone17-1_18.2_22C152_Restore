@interface HDWorkoutBuilderEntity
+ (BOOL)discardBuilderWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (HDWorkoutBuilderEntity)workoutBuilderEntityWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_workoutBuilderEntitiesForPredicate:(void *)a3 profile:(uint64_t)a4 error:;
+ (id)createEntityForBuilderConfiguration:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)finishWorkoutBuilderWithIdentifier:(id)a3 dateInterval:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)foreignKeys;
+ (id)privateSubEntities;
+ (id)workoutBuilderEntitiesExcludingSessions:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)workoutBuilderEntitiesForSource:(id)a3 profile:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
- (BOOL)_setupForEnumerationOfTypes:(void *)a3 interval:(void *)a4 profile:(uint64_t)a5 error:(void *)a6 handler:;
- (BOOL)_setupForEnumerationOfTypes:(void *)a3 interval:(void *)a4 transaction:(void *)a5 error:(void *)a6 handler:;
- (BOOL)enumerateAssociatedSampleValuesOfType:(id)a3 interval:(id)a4 profile:(id)a5 error:(id *)a6 sampleHandler:(id)a7;
- (BOOL)enumerateAssociatedSamplesOfTypes:(id)a3 interval:(id)a4 profile:(id)a5 error:(id *)a6 sampleHandler:(id)a7;
- (BOOL)enumerateAssociatedUUIDsWithTransaction:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)enumerateDataSourcesForProfile:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)enumerateStatisticsInTransaction:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)insertPrimaryWorkoutActivity:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)insertWorkoutActivity:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)insertWorkoutEvent:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)pruneAssociatedSamplesToDateInterval:(id)a3 transaction:(id)a4 error:(id *)a5 zonesHandler:(id)a6;
- (BOOL)removeDataSourceWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
- (BOOL)setArchivedState:(id)a3 forDataSourceIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
- (BOOL)setDataInterval:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setDeviceEntity:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setEndDate:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setMetadata:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setQuantityTypesIncludedWhilePaused:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setSessionIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setStartDate:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setWorkoutConfiguration:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)storeStatisticsCalculator:(id)a3 anchor:(id)a4 activityUUID:(id)a5 transaction:(id)a6 error:(id *)a7;
- (BOOL)updateWorkoutActivityEndDate:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)updateWorkoutActivityMetadata:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)configurationWithTransaction:(id)a3 error:(id *)a4;
- (id)dataIntervalInTransaction:(id)a3 error:(id *)a4;
- (id)endDateInTransaction:(id)a3 error:(id *)a4;
- (id)metadataWithTransaction:(id)a3 error:(id *)a4;
- (id)quantityTypesIncludedWhilePausedInTransaction:(id)a3 error:(id *)a4;
- (id)sessionIdentifierWithTransaction:(id)a3 error:(id *)a4;
- (id)startDateInTransaction:(id)a3 error:(id *)a4;
- (id)workoutActivitiesInTransaction:(id)a3 error:(id *)a4;
- (id)workoutEventsInTransaction:(id)a3 error:(id *)a4;
- (int64_t)associateObject:(id)a3 timestamp:(double)a4 transaction:(id)a5 error:(id *)a6;
@end

@implementation HDWorkoutBuilderEntity

+ (HDWorkoutBuilderEntity)workoutBuilderEntityWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"uuid" equalToValue:a3];
  v10 = [v8 database];
  v11 = [a1 anyWithPredicate:v9 healthDatabase:v10 error:a5];

  return (HDWorkoutBuilderEntity *)v11;
}

+ (id)_workoutBuilderEntitiesForPredicate:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = self;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10 = [v7 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__HDWorkoutBuilderEntity__workoutBuilderEntitiesForPredicate_profile_error___block_invoke;
  v16[3] = &unk_1E6307FB8;
  v19 = v8;
  id v11 = v6;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  LODWORD(a4) = [v8 performReadTransactionWithHealthDatabase:v10 error:a4 block:v16];

  if (a4) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

uint64_t __76__HDWorkoutBuilderEntity__workoutBuilderEntitiesForPredicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 48);
  id v6 = [a2 databaseForEntityClass:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__HDWorkoutBuilderEntity__workoutBuilderEntitiesForPredicate_profile_error___block_invoke_2;
  v10[3] = &unk_1E6304180;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  uint64_t v8 = [v5 enumerateEntitiesInDatabase:v6 predicate:v7 error:a3 enumerationHandler:v10];

  return v8;
}

uint64_t __76__HDWorkoutBuilderEntity__workoutBuilderEntitiesForPredicate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (id)workoutBuilderEntitiesForSource:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x1E4F65D00];
  id v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
  id v12 = [v10 predicateWithProperty:@"source_id" equalToValue:v11];

  v13 = +[HDWorkoutBuilderEntity _workoutBuilderEntitiesForPredicate:profile:error:]((uint64_t)a1, v12, v9, (uint64_t)a5);

  return v13;
}

+ (id)workoutBuilderEntitiesExcludingSessions:(id)a3 profile:(id)a4 error:(id *)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F65D10] doesNotContainPredicateWithProperty:@"session" values:v8];
  id v11 = [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"session"];
  id v12 = (void *)MEMORY[0x1E4F65D08];
  v17[0] = v11;
  v17[1] = v10;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v14 = [v12 predicateMatchingAnyPredicates:v13];

  v15 = +[HDWorkoutBuilderEntity _workoutBuilderEntitiesForPredicate:profile:error:]((uint64_t)a1, v14, v9, (uint64_t)a5);

  return v15;
}

+ (id)createEntityForBuilderConfiguration:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__158;
  v22 = __Block_byref_object_dispose__158;
  id v23 = 0;
  id v9 = [a4 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__HDWorkoutBuilderEntity_createEntityForBuilderConfiguration_profile_error___block_invoke;
  v14[3] = &unk_1E63039B8;
  v16 = &v18;
  id v17 = a1;
  id v10 = v8;
  id v15 = v10;
  LODWORD(a5) = [a1 performWriteTransactionWithHealthDatabase:v9 error:a5 block:v14];

  if (a5) {
    id v11 = (void *)v19[5];
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  _Block_object_dispose(&v18, 8);

  return v12;
}

BOOL __76__HDWorkoutBuilderEntity_createEntityForBuilderConfiguration_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v16[8] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v16[0] = @"uuid";
  v16[1] = @"workout_configuration";
  v16[2] = @"source_id";
  v16[3] = @"source_version";
  void v16[4] = @"device_id";
  v16[5] = @"goal_type";
  v16[6] = @"goal";
  v16[7] = @"should_collect_events";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:8];
  uint64_t v7 = *(void **)(a1 + 48);
  id v8 = [v5 databaseForEntityClass:v7];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__HDWorkoutBuilderEntity_createEntityForBuilderConfiguration_profile_error___block_invoke_2;
  v14[3] = &unk_1E6304248;
  id v15 = *(id *)(a1 + 32);
  uint64_t v9 = [v7 insertOrReplaceEntity:0 database:v8 properties:v6 error:a3 bindingHandler:v14];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  BOOL v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  return v12;
}

void __76__HDWorkoutBuilderEntity_createEntityForBuilderConfiguration_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) builderIdentifier];
  MEMORY[0x1C1879EF0](a2, @"uuid");

  id v8 = [*(id *)(a1 + 32) workoutConfiguration];
  HDSQLiteBindSecureCodingObjectToProperty();

  id v9 = [*(id *)(a1 + 32) sourceEntity];
  MEMORY[0x1C1879E80](a2, @"source_id", [v9 persistentID]);

  id v10 = [*(id *)(a1 + 32) sourceVersion];
  MEMORY[0x1C1879EC0](a2, @"source_version");

  v4 = [*(id *)(a1 + 32) deviceEntity];
  id v11 = v4;
  if (v4) {
    MEMORY[0x1C1879E80](a2, @"device_id", [v4 persistentID]);
  }
  else {
    MEMORY[0x1C1879E90](a2, @"device_id");
  }
  MEMORY[0x1C1879E80](a2, @"goal_type", [*(id *)(a1 + 32) goalType]);
  id v5 = [*(id *)(a1 + 32) goal];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) goal];
    HDSQLiteBindSecureCodingObjectToProperty();
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"goal");
  }
  MEMORY[0x1C1879E20](a2, @"should_collect_events", [*(id *)(a1 + 32) shouldCollectWorkoutEvents]);
}

+ (BOOL)discardBuilderWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [[HDDiscardWorkoutOperation alloc] initWithBuilderIdentifier:v7];
  LOBYTE(a5) = [(HDJournalableOperation *)v9 performOrJournalWithProfile:v8 error:a5];

  return (char)a5;
}

+ (id)finishWorkoutBuilderWithIdentifier:(id)a3 dateInterval:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__158;
  v29 = __Block_byref_object_dispose__158;
  id v30 = 0;
  v13 = [v12 database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__HDWorkoutBuilderEntity_finishWorkoutBuilderWithIdentifier_dateInterval_profile_error___block_invoke;
  v19[3] = &unk_1E6308030;
  id v24 = a1;
  id v14 = v10;
  id v20 = v14;
  id v15 = v12;
  id v21 = v15;
  id v23 = &v25;
  id v16 = v11;
  id v22 = v16;
  LOBYTE(a1) = [a1 performReadTransactionWithHealthDatabase:v13 error:a6 block:v19];

  if ((a1 & 1) != 0
    && ([(id)v26[5] performOrJournalWithProfile:v15 error:a6] & 1) != 0)
  {
    id v17 = [(id)v26[5] createdWorkout];
  }
  else
  {
    id v17 = 0;
  }

  _Block_object_dispose(&v25, 8);

  return v17;
}

uint64_t __88__HDWorkoutBuilderEntity_finishWorkoutBuilderWithIdentifier_dateInterval_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 64) workoutBuilderEntityWithIdentifier:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) error:a3];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 configurationWithTransaction:v5 error:a3];
    if (!v8)
    {
      uint64_t v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    v55[0] = 0;
    id v9 = [v7 metadataWithTransaction:v5 error:v55];
    id v10 = v55[0];
    id v11 = v10;
    if (!v9 && v10)
    {
      id v12 = v10;
      v13 = v12;
      if (a3)
      {
        uint64_t v14 = 0;
        *a3 = v12;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v14 = 0;
      }
      goto LABEL_38;
    }
    id v49 = v10;
    id v15 = [v8 deviceEntity];

    if (v15)
    {
      id v16 = [*(id *)(a1 + 40) deviceManager];
      id v17 = NSNumber;
      uint64_t v18 = [v8 deviceEntity];
      v19 = objc_msgSend(v17, "numberWithLongLong:", objc_msgSend(v18, "persistentID"));
      uint64_t v20 = [v16 deviceForPersistentID:v19 error:a3];

      if (!v20)
      {
        uint64_t v14 = 0;
        id v11 = v49;
LABEL_39:

        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
    v47 = (void *)v20;
    v48 = v8;
    id v21 = [*(id *)(a1 + 40) sourceManager];
    id v22 = NSNumber;
    id v23 = [v8 sourceEntity];
    id v24 = objc_msgSend(v22, "numberWithLongLong:", objc_msgSend(v23, "persistentID"));
    id v54 = 0;
    uint64_t v25 = [v21 clientSourceForPersistentID:v24 error:&v54];
    id v26 = v54;

    if (v25)
    {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __88__HDWorkoutBuilderEntity_finishWorkoutBuilderWithIdentifier_dateInterval_profile_error___block_invoke_2;
      v52[3] = &unk_1E6307FE0;
      id v28 = v27;
      id v53 = v28;
      if (+[HDWorkoutBuilderAssociatedSeriesEntity enumerateSeriesForBuilder:v7 transaction:v5 error:a3 block:v52])
      {
        v46 = [v7 workoutEventsInTransaction:v5 error:a3];
        if (v46)
        {
          uint64_t v14 = [v7 workoutActivitiesInTransaction:v5 error:a3];
          v45 = (void *)v14;
          if (v14)
          {
            v29 = objc_alloc_init(HDWorkoutBuilderStatisticsCalculators);
            v50[0] = MEMORY[0x1E4F143A8];
            v50[1] = 3221225472;
            v50[2] = __88__HDWorkoutBuilderEntity_finishWorkoutBuilderWithIdentifier_dateInterval_profile_error___block_invoke_3;
            v50[3] = &unk_1E6308008;
            v44 = v29;
            v51 = v44;
            if ([v7 enumerateStatisticsInTransaction:v5 error:a3 block:v50])
            {
              id v30 = (void *)v25;
              v31 = [v7 quantityTypesIncludedWhilePausedInTransaction:v5 error:a3];
              uint64_t v14 = v31 != 0;
              if (v31)
              {
                id v43 = v31;
                v40 = [HDCreateWorkoutOperation alloc];
                v42 = [v48 workoutConfiguration];
                uint64_t v38 = *(void *)(a1 + 48);
                uint64_t v39 = *(void *)(a1 + 32);
                v41 = [v48 sourceVersion];
                uint64_t v32 = [v48 goalType];
                v37 = [v48 goal];
                uint64_t v33 = [(HDCreateWorkoutOperation *)v40 initWithWorkoutConfiguration:v42 identifier:v39 dateInterval:v38 metadata:v9 device:v47 source:v30 sourceVersion:v41 events:v46 activities:v45 statisticsCalculators:v44 associatedSeries:v28 goalType:v32 goal:v37 quantityTypesIncludedWhilePaused:v43];
                uint64_t v34 = *(void *)(*(void *)(a1 + 56) + 8);
                v35 = *(void **)(v34 + 40);
                *(void *)(v34 + 40) = v33;

                v31 = v43;
              }
            }
            else
            {
              id v30 = (void *)v25;
              uint64_t v14 = 0;
            }
          }
          else
          {
            id v30 = (void *)v25;
          }
        }
        else
        {
          id v30 = (void *)v25;
          uint64_t v14 = 0;
        }
      }
      else
      {
        id v30 = (void *)v25;
        uint64_t v14 = 0;
      }

      goto LABEL_37;
    }
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 4, @"Could not find source for application");
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        id v30 = 0;
        id v26 = 0;
        uint64_t v14 = 0;
LABEL_37:

        id v8 = v48;
        id v11 = v49;
        v13 = v47;
LABEL_38:

        goto LABEL_39;
      }
    }
    id v30 = 0;
    if (a3)
    {
      id v28 = v28;
      uint64_t v14 = 0;
      *a3 = v28;
    }
    else
    {
      _HKLogDroppedError();
      uint64_t v14 = 0;
    }
    id v26 = v28;
    goto LABEL_37;
  }
  uint64_t v14 = 0;
LABEL_41:

  return v14;
}

uint64_t __88__HDWorkoutBuilderEntity_finishWorkoutBuilderWithIdentifier_dateInterval_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

void __88__HDWorkoutBuilderEntity_finishWorkoutBuilderWithIdentifier_dateInterval_profile_error___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = a2;
  id v8 = a3;
  id v9 = a5;
  if (v9) {
    [*(id *)(a1 + 32) setCalculator:v9 forQuantityType:v10 activityUUID:v8];
  }
}

- (id)configurationWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = NSString;
  id v8 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  id v9 = [v7 stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?", @"uuid", @"workout_configuration", @"source_id", @"source_version", @"device_id", @"session", @"goal_type", @"goal", @"should_collect_events", v8, *MEMORY[0x1E4F65C70]];

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__158;
  uint64_t v20 = __Block_byref_object_dispose__158;
  id v21 = 0;
  id v10 = [v6 databaseForEntity:self];
  void v14[4] = &v16;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__HDWorkoutBuilderEntity_configurationWithTransaction_error___block_invoke;
  v15[3] = &unk_1E62F52C8;
  v15[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__HDWorkoutBuilderEntity_configurationWithTransaction_error___block_invoke_2;
  v14[3] = &unk_1E62F5278;
  LODWORD(a4) = [v10 executeSQL:v9 error:a4 bindingHandler:v15 enumerationHandler:v14];

  if (a4) {
    id v11 = (void *)v17[5];
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  _Block_object_dispose(&v16, 8);

  return v12;
}

uint64_t __61__HDWorkoutBuilderEntity_configurationWithTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __61__HDWorkoutBuilderEntity_configurationWithTransaction_error___block_invoke_2(uint64_t a1)
{
  v2 = objc_alloc_init(HDWorkoutBuilderPersistedConfiguration);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = HDSQLiteColumnWithNameAsUUID();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setBuilderIdentifier:v5];

  objc_opt_class();
  id v6 = HDSQLiteColumnWithNameAsObject();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setWorkoutConfiguration:v6];

  id v7 = [(HDSQLiteEntity *)[HDSourceEntity alloc] initWithPersistentID:HDSQLiteColumnWithNameAsInt64()];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setSourceEntity:v7];

  id v8 = HDSQLiteColumnWithNameAsString();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setSourceVersion:v8];

  if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
  {
    id v9 = [(HDSQLiteEntity *)[HDDeviceEntity alloc] initWithPersistentID:HDSQLiteColumnWithNameAsInt64()];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDeviceEntity:v9];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setGoalType:HDSQLiteColumnWithNameAsInt64()];
  objc_opt_class();
  id v10 = HDSQLiteColumnWithNameAsObject();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setGoal:v10];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setShouldCollectWorkoutEvents:HDSQLiteColumnWithNameAsBoolean()];
  return 1;
}

- (id)sessionIdentifierWithTransaction:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__158;
  id v17 = __Block_byref_object_dispose__158;
  id v18 = 0;
  v19[0] = @"session";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v8 = objc_msgSend(v6, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__HDWorkoutBuilderEntity_sessionIdentifierWithTransaction_error___block_invoke;
  v12[3] = &unk_1E62FFCA8;
  v12[4] = &v13;
  LODWORD(a4) = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v12];

  if (a4) {
    id v9 = (void *)v14[5];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __65__HDWorkoutBuilderEntity_sessionIdentifierWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)setSessionIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v16[0] = @"session";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v11 = objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__HDWorkoutBuilderEntity_setSessionIdentifier_transaction_error___block_invoke;
  v14[3] = &unk_1E6304248;
  id v12 = v8;
  id v15 = v12;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v10 database:v11 error:a5 bindingHandler:v14];

  return (char)a5;
}

void __65__HDWorkoutBuilderEntity_setSessionIdentifier_transaction_error___block_invoke()
{
}

- (id)startDateInTransaction:(id)a3 error:(id *)a4
{
  v4 = [(HDHealthEntity *)self dateForProperty:@"start_date" transaction:a3 error:a4];

  return v4;
}

- (BOOL)setStartDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return [(HDHealthEntity *)self setDate:a3 forProperty:@"start_date" transaction:a4 error:a5];
}

- (id)endDateInTransaction:(id)a3 error:(id *)a4
{
  v4 = [(HDHealthEntity *)self dateForProperty:@"end_date" transaction:a3 error:a4];

  return v4;
}

- (BOOL)setEndDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return [(HDHealthEntity *)self setDate:a3 forProperty:@"end_date" transaction:a4 error:a5];
}

- (id)dataIntervalInTransaction:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__158;
  uint64_t v16 = __Block_byref_object_dispose__158;
  id v17 = 0;
  v18[0] = @"data_interval";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v7 = objc_msgSend(v5, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HDWorkoutBuilderEntity_dataIntervalInTransaction_error___block_invoke;
  v11[3] = &unk_1E62FFCA8;
  v11[4] = &v12;
  LODWORD(self) = [(HDSQLiteEntity *)self getValuesForProperties:v6 database:v7 handler:v11];

  if (self) {
    id v8 = (void *)v13[5];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __58__HDWorkoutBuilderEntity_dataIntervalInTransaction_error___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = HDSQLiteColumnWithNameAsObject();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)setDataInterval:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v16[0] = @"data_interval";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v11 = objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__HDWorkoutBuilderEntity_setDataInterval_transaction_error___block_invoke;
  v14[3] = &unk_1E6304248;
  id v12 = v8;
  id v15 = v12;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v10 database:v11 error:a5 bindingHandler:v14];

  return (char)a5;
}

uint64_t __60__HDWorkoutBuilderEntity_setDataInterval_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (id)quantityTypesIncludedWhilePausedInTransaction:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__158;
  uint64_t v16 = __Block_byref_object_dispose__158;
  id v17 = 0;
  v18[0] = @"types_while_paused";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v7 = objc_msgSend(v5, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__HDWorkoutBuilderEntity_quantityTypesIncludedWhilePausedInTransaction_error___block_invoke;
  v11[3] = &unk_1E62FFCA8;
  v11[4] = &v12;
  LODWORD(self) = [(HDSQLiteEntity *)self getValuesForProperties:v6 database:v7 handler:v11];

  if (self) {
    id v8 = (void *)v13[5];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __78__HDWorkoutBuilderEntity_quantityTypesIncludedWhilePausedInTransaction_error___block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v4 = [v2 setWithArray:v3];
  uint64_t v5 = HDSQLiteColumnWithNameAsObjectWithClasses();
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!*(void *)(v8 + 40)) {
    *(void *)(v8 + 40) = MEMORY[0x1E4F1CBF0];
  }
}

- (BOOL)setQuantityTypesIncludedWhilePaused:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v16[0] = @"types_while_paused";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v11 = objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__HDWorkoutBuilderEntity_setQuantityTypesIncludedWhilePaused_transaction_error___block_invoke;
  v14[3] = &unk_1E6304248;
  id v12 = v8;
  id v15 = v12;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v10 database:v11 error:a5 bindingHandler:v14];

  return (char)a5;
}

uint64_t __80__HDWorkoutBuilderEntity_setQuantityTypesIncludedWhilePaused_transaction_error___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) count])
  {
    JUMPOUT(0x1C1879E90);
  }

  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (BOOL)setMetadata:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v16[0] = @"metadata";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v11 = [v9 databaseForEntity:self];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__HDWorkoutBuilderEntity_setMetadata_transaction_error___block_invoke;
  v14[3] = &unk_1E6304248;
  id v12 = v8;
  id v15 = v12;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v10 database:v11 error:a5 bindingHandler:v14];

  return (char)a5;
}

void __56__HDWorkoutBuilderEntity_setMetadata_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (![*(id *)(a1 + 32) count])
  {
    JUMPOUT(0x1C1879E90);
  }
  objc_msgSend(*(id *)(a1 + 32), "hk_codableMetadata");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [v5 data];
  MEMORY[0x1C1879E30](a2, @"metadata", v4);
}

- (id)metadataWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = NSString;
  id v8 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  id v9 = [v7 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ?", @"metadata", v8, *MEMORY[0x1E4F65C70]];

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__158;
  uint64_t v20 = __Block_byref_object_dispose__158;
  id v21 = 0;
  id v10 = [v6 databaseForEntity:self];
  void v14[4] = &v16;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__HDWorkoutBuilderEntity_metadataWithTransaction_error___block_invoke;
  v15[3] = &unk_1E62F52C8;
  v15[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__HDWorkoutBuilderEntity_metadataWithTransaction_error___block_invoke_2;
  v14[3] = &unk_1E62F5278;
  if ([v10 executeSQL:v9 error:a4 bindingHandler:v15 enumerationHandler:v14])
  {
    id v11 = (void *)v17[5];
    if (!v11) {
      id v11 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    id v11 = 0;
  }
  id v12 = v11;

  _Block_object_dispose(&v16, 8);

  return v12;
}

uint64_t __56__HDWorkoutBuilderEntity_metadataWithTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __56__HDWorkoutBuilderEntity_metadataWithTransaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  sqlite3_int64 v3 = MEMORY[0x1C1879F20](a2, 0);
  if (v3)
  {
    uint64_t v4 = +[HDCodableMetadataDictionary decodeMetadataFromData:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  return 1;
}

- (BOOL)setDeviceEntity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v16[0] = @"device_id";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v11 = [v9 databaseForEntity:self];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__HDWorkoutBuilderEntity_setDeviceEntity_transaction_error___block_invoke;
  v14[3] = &unk_1E6304248;
  id v12 = v8;
  id v15 = v12;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v10 database:v11 error:a5 bindingHandler:v14];

  return (char)a5;
}

void __60__HDWorkoutBuilderEntity_setDeviceEntity_transaction_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) persistentID];

  JUMPOUT(0x1C1879E80);
}

- (BOOL)setWorkoutConfiguration:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v16[0] = @"workout_configuration";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v11 = [v9 databaseForEntity:self];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__HDWorkoutBuilderEntity_setWorkoutConfiguration_transaction_error___block_invoke;
  v14[3] = &unk_1E6304248;
  id v12 = v8;
  id v15 = v12;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v10 database:v11 error:a5 bindingHandler:v14];

  return (char)a5;
}

uint64_t __68__HDWorkoutBuilderEntity_setWorkoutConfiguration_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (int64_t)associateObject:(id)a3 timestamp:(double)a4 transaction:(id)a5 error:(id *)a6
{
  return +[HDWorkoutBuilderAssociatedObjectEntity associateObject:a3 timestamp:self withBuilder:a5 transaction:a6 error:a4];
}

- (BOOL)enumerateAssociatedUUIDsWithTransaction:(id)a3 error:(id *)a4 block:(id)a5
{
  return +[HDWorkoutBuilderAssociatedObjectEntity enumerateAssociatedUUIDsForBuilder:self transaction:a3 error:a4 block:a5];
}

- (BOOL)enumerateAssociatedSampleValuesOfType:(id)a3 interval:(id)a4 profile:(id)a5 error:(id *)a6 sampleHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v12)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
  }
  else
  {
    uint64_t v16 = 0;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __101__HDWorkoutBuilderEntity_enumerateAssociatedSampleValuesOfType_interval_profile_error_sampleHandler___block_invoke;
  v20[3] = &unk_1E6308080;
  id v17 = v15;
  id v21 = v17;
  BOOL v18 = -[HDWorkoutBuilderEntity _setupForEnumerationOfTypes:interval:profile:error:handler:]((uint64_t)self, v16, v13, v14, (uint64_t)a6, v20);

  return v18;
}

BOOL __101__HDWorkoutBuilderEntity_enumerateAssociatedSampleValuesOfType_interval_profile_error_sampleHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__HDWorkoutBuilderEntity_enumerateAssociatedSampleValuesOfType_interval_profile_error_sampleHandler___block_invoke_2;
  v10[3] = &unk_1E6308058;
  id v11 = *(id *)(a1 + 32);
  BOOL v8 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:a3 transaction:a2 options:5 error:a5 handler:v10];

  return v8;
}

uint64_t __101__HDWorkoutBuilderEntity_enumerateAssociatedSampleValuesOfType_interval_profile_error_sampleHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_setupForEnumerationOfTypes:(void *)a3 interval:(void *)a4 profile:(uint64_t)a5 error:(void *)a6 handler:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (a1)
  {
    id v15 = [v13 database];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __85__HDWorkoutBuilderEntity__setupForEnumerationOfTypes_interval_profile_error_handler___block_invoke;
    v18[3] = &unk_1E6308120;
    v18[4] = a1;
    id v19 = v11;
    id v20 = v12;
    id v21 = v14;
    BOOL v16 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v15 error:a5 block:v18];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)enumerateAssociatedSamplesOfTypes:(id)a3 interval:(id)a4 profile:(id)a5 error:(id *)a6 sampleHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __97__HDWorkoutBuilderEntity_enumerateAssociatedSamplesOfTypes_interval_profile_error_sampleHandler___block_invoke;
  v19[3] = &unk_1E63080D0;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  LOBYTE(a6) = -[HDWorkoutBuilderEntity _setupForEnumerationOfTypes:interval:profile:error:handler:]((uint64_t)self, v17, a4, v16, (uint64_t)a6, v19);

  return (char)a6;
}

uint64_t __97__HDWorkoutBuilderEntity_enumerateAssociatedSamplesOfTypes_interval_profile_error_sampleHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = +[HDSampleEntity entityEnumeratorWithTypes:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) error:a5];
  id v9 = v8;
  if (v8)
  {
    [v8 setPredicate:v7];
    id v10 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"start_date" entityClass:objc_opt_class() ascending:1];
    v16[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v9 setOrderingTerms:v11];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__HDWorkoutBuilderEntity_enumerateAssociatedSamplesOfTypes_interval_profile_error_sampleHandler___block_invoke_2;
    v14[3] = &unk_1E63080A8;
    id v15 = *(id *)(a1 + 48);
    uint64_t v12 = [v9 enumerateWithError:a5 handler:v14];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __97__HDWorkoutBuilderEntity_enumerateAssociatedSamplesOfTypes_interval_profile_error_sampleHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__HDWorkoutBuilderEntity__createTemporaryProtectedAssociatedSampleListInTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__HDWorkoutBuilderEntity__createTemporaryProtectedAssociatedSampleListInTransaction_error___block_invoke_2;
  v10[3] = &unk_1E62F52C8;
  id v11 = v5;
  id v7 = v5;
  uint64_t v8 = [v6 performStatementWithError:a3 bindingHandler:v10];

  return v8;
}

uint64_t __91__HDWorkoutBuilderEntity__createTemporaryProtectedAssociatedSampleListInTransaction_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

- (BOOL)_setupForEnumerationOfTypes:(void *)a3 interval:(void *)a4 transaction:(void *)a5 error:(void *)a6 handler:
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v68 = a2;
  id v69 = a3;
  id v11 = a4;
  id v67 = a6;
  v71 = v11;
  if (a1)
  {
    uint64_t v12 = [v11 protectedDatabase];
    [v12 setPermitWritesInReadTransaction:1];

    id v13 = v11;
    id v14 = [v13 databaseForEntityClass:objc_opt_class()];
    id v15 = [MEMORY[0x1E4F29128] UUID];
    id v16 = [v15 UUIDString];
    id v17 = [v16 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1F1728D60];

    BOOL v18 = [NSString stringWithFormat:@"%@_%@", objc_opt_class(), v17];
    id v19 = [NSString stringWithFormat:@"CREATE TEMPORARY TABLE %@ (%@ BLOB NOT NULL)", v18, @"uuid"];
    char v20 = [v14 executeUncachedSQL:v19 error:a5 bindingHandler:0 enumerationHandler:0];

    if (v20)
    {
      id v21 = [NSString stringWithFormat:@"INSERT INTO %@ (%@) VALUES (?)", v18, @"uuid"];
      id v22 = (void *)[objc_alloc(MEMORY[0x1E4F65D80]) initWithSQL:v21 database:v14];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v80 = __91__HDWorkoutBuilderEntity__createTemporaryProtectedAssociatedSampleListInTransaction_error___block_invoke;
      v81 = &unk_1E6307FE0;
      id v23 = v22;
      id v82 = v23;
      if (+[HDWorkoutBuilderAssociatedObjectEntity enumerateAssociatedUUIDsForBuilder:a1 transaction:v13 error:a5 block:&buf])
      {
        id v24 = [NSString stringWithFormat:@"CREATE INDEX %@_idx ON %@ (%@)", v18, v18, @"uuid"];
        int v25 = [v14 executeUncachedSQL:v24 error:a5 bindingHandler:0 enumerationHandler:0];

        if (v25) {
          id v26 = v18;
        }
        else {
          id v26 = 0;
        }
        id v70 = v26;
      }
      else
      {
        id v70 = 0;
      }
    }
    else
    {
      id v70 = 0;
    }

    if (v70)
    {
      id v27 = v68;
      id v28 = v69;
      id v66 = v70;
      id v29 = v13;
      v64 = v27;
      if (v27)
      {
        uint64_t v30 = HDSampleEntityPredicateForDataTypes(v27);
      }
      else
      {
        uint64_t v30 = 0;
      }
      v65 = (void *)v30;
      uint64_t v34 = objc_alloc_init(HDWorkoutBuilderAssociatedSamplePredicate);
      v35 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v30 otherPredicate:v34];
      id v36 = v35;
      if (v28)
      {
        id v78 = 0;
        v37 = [a1 dataIntervalInTransaction:v29 error:&v78];
        id v38 = v78;
        v62 = v38;
        v63 = v37;
        if (v37)
        {
          uint64_t v39 = [v28 endDate];
          v61 = HDSampleEntityPredicateForStartDate(4);

          v40 = [v28 startDate];
          HDSampleEntityPredicateForEndDate(6);
          v41 = (uint64_t (*)(uint64_t, void *, uint64_t))objc_claimAutoreleasedReturnValue();

          v42 = [v37 startDate];
          id v43 = HDSampleEntityPredicateForStartDate(6);

          v44 = (void *)MEMORY[0x1E4F65D08];
          *(void *)&long long buf = v43;
          *((void *)&buf + 1) = v61;
          v80 = v41;
          v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:3];
          v46 = [v44 predicateMatchingAllPredicates:v45];

          v47 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v36 otherPredicate:v46];

          id v36 = v47;
          v48 = v36;
        }
        else if (v38)
        {
          id v49 = v38;
          v50 = v49;
          if (a5) {
            *a5 = v49;
          }
          else {
            _HKLogDroppedError();
          }

          v48 = 0;
        }
        else
        {
          id v36 = v36;
          v48 = v36;
        }
      }
      else
      {
        id v36 = v35;
        v48 = v36;
      }

      if (v48)
      {
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __89__HDWorkoutBuilderEntity__setupForEnumerationOfTypes_interval_transaction_error_handler___block_invoke;
        v73[3] = &unk_1E63080F8;
        id v77 = v67;
        id v51 = v29;
        id v74 = v51;
        id v75 = v48;
        id v52 = v66;
        id v76 = v52;
        BOOL v33 = +[HDWorkoutBuilderAssociatedSampleTemporaryTableEntity withLocalTableName:v52 error:a5 block:v73];
        id v53 = [v51 databaseForEntityClass:objc_opt_class()];
        id v54 = [NSString stringWithFormat:@"DROP TABLE %@", v52];
        id v72 = 0;
        char v55 = [v53 executeUncachedSQL:v54 error:&v72 bindingHandler:0 enumerationHandler:0];
        id v56 = v72;

        if ((v55 & 1) == 0)
        {
          _HKInitializeLogging();
          v57 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v56;
            _os_log_error_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_ERROR, "Failed to drop temporary table after sample enumeration: %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
        v58 = [v51 protectedDatabase];
        [v58 setPermitWritesInReadTransaction:0];
      }
      else
      {
        v59 = [v29 protectedDatabase];
        [v59 setPermitWritesInReadTransaction:0];

        BOOL v33 = 0;
      }

      uint64_t v32 = v70;
    }
    else
    {
      v31 = [v13 protectedDatabase];
      uint64_t v32 = 0;
      [v31 setPermitWritesInReadTransaction:0];

      BOOL v33 = 0;
    }
  }
  else
  {
    BOOL v33 = 0;
  }

  return v33;
}

uint64_t __89__HDWorkoutBuilderEntity__setupForEnumerationOfTypes_interval_transaction_error_handler___block_invoke(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a2);
}

BOOL __85__HDWorkoutBuilderEntity__setupForEnumerationOfTypes_interval_profile_error_handler___block_invoke(void **a1, void *a2, void *a3)
{
  return -[HDWorkoutBuilderEntity _setupForEnumerationOfTypes:interval:transaction:error:handler:](a1[4], a1[5], a1[6], a2, a3, a1[7]);
}

- (BOOL)pruneAssociatedSamplesToDateInterval:(id)a3 transaction:(id)a4 error:(id *)a5 zonesHandler:(id)a6
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  id v11 = a4;
  id v12 = a6;
  v65 = v11;
  id v13 = [v11 protectedDatabase];

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"A protected data transaction is required.");
    BOOL v42 = 0;
    goto LABEL_74;
  }
  v64 = v12;
  id v14 = [v66 startDate];
  [v14 timeIntervalSinceReferenceDate];
  uint64_t v16 = v15;

  id v17 = [v66 endDate];
  [v17 timeIntervalSinceReferenceDate];
  uint64_t v19 = v18;

  char v20 = [(HDWorkoutBuilderEntity *)self workoutEventsInTransaction:v11 error:a5];
  if (!v20)
  {
    BOOL v42 = 0;
    goto LABEL_73;
  }
  v63 = v20;
  id v21 = [(HDWorkoutBuilderEntity *)self quantityTypesIncludedWhilePausedInTransaction:v11 error:a5];
  if (!v21)
  {
    BOOL v42 = 0;
    goto LABEL_72;
  }
  v61 = a5;
  v62 = self;
  long long v85 = 0u;
  long long v86 = 0u;
  float v87 = 1.0;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v60 = v21;
  id v22 = v21;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v81 objects:v91 count:16];
  if (!v23) {
    goto LABEL_49;
  }
  uint64_t v24 = *(void *)v82;
  do
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v82 != v24) {
        objc_enumerationMutation(v22);
      }
      unint64_t v26 = objc_msgSend(*(id *)(*((void *)&v81 + 1) + 8 * i), "code", v60);
      unint64_t v27 = v26;
      unint64_t v28 = *((void *)&v85 + 1);
      if (*((void *)&v85 + 1))
      {
        uint8x8_t v29 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v85 + 8));
        v29.i16[0] = vaddlv_u8(v29);
        if (v29.u32[0] > 1uLL)
        {
          unint64_t v6 = v26;
          if (*((void *)&v85 + 1) <= v26) {
            unint64_t v6 = v26 % *((void *)&v85 + 1);
          }
        }
        else
        {
          unint64_t v6 = (*((void *)&v85 + 1) - 1) & v26;
        }
        uint64_t v30 = *(void **)(v85 + 8 * v6);
        if (v30)
        {
          for (j = (void *)*v30; j; j = (void *)*j)
          {
            unint64_t v32 = j[1];
            if (v32 == v26)
            {
              if (j[2] == v26) {
                goto LABEL_47;
              }
            }
            else
            {
              if (v29.u32[0] > 1uLL)
              {
                if (v32 >= *((void *)&v85 + 1)) {
                  v32 %= *((void *)&v85 + 1);
                }
              }
              else
              {
                v32 &= *((void *)&v85 + 1) - 1;
              }
              if (v32 != v6) {
                break;
              }
            }
          }
        }
      }
      BOOL v33 = operator new(0x18uLL);
      *BOOL v33 = 0;
      v33[1] = v27;
      v33[2] = v27;
      float v34 = (float)(unint64_t)(*((void *)&v86 + 1) + 1);
      if (!v28 || (float)(v87 * (float)v28) < v34)
      {
        BOOL v35 = (v28 & (v28 - 1)) != 0;
        if (v28 < 3) {
          BOOL v35 = 1;
        }
        unint64_t v36 = v35 | (2 * v28);
        unint64_t v37 = vcvtps_u32_f32(v34 / v87);
        if (v36 <= v37) {
          size_t v38 = v37;
        }
        else {
          size_t v38 = v36;
        }
        std::__hash_table<_HKDataTypeCode,std::hash<_HKDataTypeCode>,std::equal_to<_HKDataTypeCode>,std::allocator<_HKDataTypeCode>>::__rehash<true>((uint64_t)&v85, v38);
        unint64_t v28 = *((void *)&v85 + 1);
        if ((*((void *)&v85 + 1) & (*((void *)&v85 + 1) - 1)) != 0)
        {
          if (*((void *)&v85 + 1) <= v27) {
            unint64_t v6 = v27 % *((void *)&v85 + 1);
          }
          else {
            unint64_t v6 = v27;
          }
        }
        else
        {
          unint64_t v6 = (*((void *)&v85 + 1) - 1) & v27;
        }
      }
      uint64_t v39 = v85;
      v40 = *(void **)(v85 + 8 * v6);
      if (v40)
      {
        *BOOL v33 = *v40;
LABEL_45:
        void *v40 = v33;
        goto LABEL_46;
      }
      *BOOL v33 = v86;
      *(void *)&long long v86 = v33;
      *(void *)(v39 + 8 * v6) = &v86;
      if (*v33)
      {
        unint64_t v41 = *(void *)(*v33 + 8);
        if ((v28 & (v28 - 1)) != 0)
        {
          if (v41 >= v28) {
            v41 %= v28;
          }
        }
        else
        {
          v41 &= v28 - 1;
        }
        v40 = (void *)(v85 + 8 * v41);
        goto LABEL_45;
      }
LABEL_46:
      ++*((void *)&v86 + 1);
LABEL_47:
      ;
    }
    uint64_t v23 = [v22 countByEnumeratingWithState:&v81 objects:v91 count:16];
  }
  while (v23);
LABEL_49:

  BOOL v42 = (char)v62;
  _HKPausedIntervalsWithWorkoutEvents();
  id v78 = 0;
  v79 = 0;
  uint64_t v80 = 0;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v44 = [v43 countByEnumeratingWithState:&v74 objects:v90 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v75;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v75 != v45) {
          objc_enumerationMutation(v43);
        }
        v47 = *(void **)(*((void *)&v74 + 1) + 8 * k);
        v48 = objc_msgSend(v47, "startDate", v60);
        [v48 timeIntervalSinceReferenceDate];
        double v50 = v49;
        id v51 = [v47 endDate];
        [v51 timeIntervalSinceReferenceDate];
        if (v52 >= v50) {
          double v53 = v50;
        }
        else {
          double v53 = v52;
        }
        if (v50 >= v52) {
          double v54 = v50;
        }
        else {
          double v54 = v52;
        }
        HKIntervalMask<double>::_insertInterval((uint64_t *)&v78, v53, v54);
      }
      uint64_t v44 = [v43 countByEnumeratingWithState:&v74 objects:v90 count:16];
    }
    while (v44);
  }

  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3321888768;
  v67[2] = __94__HDWorkoutBuilderEntity_pruneAssociatedSamplesToDateInterval_transaction_error_zonesHandler___block_invoke;
  v67[3] = &unk_1F1721068;
  id v69 = v64;
  v67[4] = v62;
  id v68 = v65;
  uint64_t v70 = v19;
  uint64_t v71 = v16;
  std::unordered_set<_HKDataTypeCode>::unordered_set((uint64_t)v72, (uint64_t)&v85);
  memset(__p, 0, sizeof(__p));
  std::vector<HKRawInterval<double>>::__init_with_size[abi:ne180100]<HKRawInterval<double>*,HKRawInterval<double>*>(__p, v78, (uint64_t)v79, (v79 - (unsigned char *)v78) >> 4);
  id v55 = v68;
  id v56 = v67;
  v57 = v56;
  if (v62)
  {
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __90__HDWorkoutBuilderEntity__enumerateAssociatedSamplePropertiesInTransaction_error_handler___block_invoke;
    v88[3] = &unk_1E6308080;
    v89 = v56;
    BOOL v42 = -[HDWorkoutBuilderEntity _setupForEnumerationOfTypes:interval:transaction:error:handler:](v62, 0, 0, v55, v61, v88);
  }
  v58 = __p[0];
  if (__p[0])
  {
    v57[15] = __p[0];
    operator delete(v58);
  }
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v72);

  if (v78)
  {
    v79 = v78;
    operator delete(v78);
  }

  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&v85);
  id v21 = v60;
LABEL_72:

  char v20 = v63;
LABEL_73:

  id v12 = v64;
LABEL_74:

  return v42;
}

BOOL __94__HDWorkoutBuilderEntity_pruneAssociatedSamplesToDateInterval_transaction_error_zonesHandler___block_invoke(uint64_t a1, unint64_t a2, void *a3, int a4, char a5, uint64_t a6, double a7, double a8)
{
  id v15 = a3;
  if (a5)
  {
    BOOL v16 = 0;
  }
  else
  {
    if (a2 - 289 > 1)
    {
      BOOL v18 = *(double *)(a1 + 56) < a7 || *(double *)(a1 + 64) > a8;
      int8x8_t v19 = *(int8x8_t *)(a1 + 80);
      if (v19)
      {
        uint8x8_t v20 = (uint8x8_t)vcnt_s8(v19);
        v20.i16[0] = vaddlv_u8(v20);
        if (v20.u32[0] > 1uLL)
        {
          unint64_t v21 = a2;
          if (*(void *)&v19 <= a2) {
            unint64_t v21 = a2 % *(void *)&v19;
          }
        }
        else
        {
          unint64_t v21 = (*(void *)&v19 - 1) & a2;
        }
        id v22 = *(void **)(*(void *)(a1 + 72) + 8 * v21);
        if (v22)
        {
          for (uint64_t i = (void *)*v22; i; uint64_t i = (void *)*i)
          {
            unint64_t v24 = i[1];
            if (v24 == a2)
            {
              if (i[2] == a2) {
                goto LABEL_35;
              }
            }
            else
            {
              if (v20.u32[0] > 1uLL)
              {
                if (v24 >= *(void *)&v19) {
                  v24 %= *(void *)&v19;
                }
              }
              else
              {
                v24 &= *(void *)&v19 - 1;
              }
              if (v24 != v21) {
                break;
              }
            }
          }
        }
      }
      for (j = *(double **)(a1 + 112); j != *(double **)(a1 + 120) && *j <= a8; j += 2)
      {
        if (*j <= a7 && j[1] >= a8) {
          goto LABEL_36;
        }
      }
LABEL_35:
      if ((v18 | a4) != 1)
      {
        BOOL v16 = 1;
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 48);
      if (v17) {
        (*(void (**)(uint64_t, id))(v17 + 16))(v17, v15);
      }
    }
LABEL_36:
    BOOL v16 = +[HDWorkoutBuilderAssociatedObjectEntity removeAssociationFromBuilder:*(void *)(a1 + 32) toUUID:v15 transaction:*(void *)(a1 + 40) error:a6];
  }
LABEL_38:

  return v16;
}

uint64_t __90__HDWorkoutBuilderEntity__enumerateAssociatedSamplePropertiesInTransaction_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = NSString;
  id v11 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v12 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v13 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v14 = [v10 stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@ FROM %@ INNER JOIN %@ USING (%@) INNER JOIN %@ USING (%@) LEFT JOIN %@ USING (%@)", @"uuid", @"type", @"data_type", @"start_date", @"end_date", @"insertion_era", v11, v12, @"data_id", v9, @"uuid", v13, @"data_id"];

  id v15 = [v8 protectedDatabase];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __90__HDWorkoutBuilderEntity__enumerateAssociatedSamplePropertiesInTransaction_error_handler___block_invoke_2;
  v18[3] = &unk_1E62F5740;
  id v19 = *(id *)(a1 + 32);
  uint64_t v16 = [v15 executeUncachedSQL:v14 error:a5 bindingHandler:0 enumerationHandler:v18];

  return v16;
}

uint64_t __90__HDWorkoutBuilderEntity__enumerateAssociatedSamplePropertiesInTransaction_error_handler___block_invoke_2(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  uint64_t v1 = HKWithAutoreleasePool();

  return v1;
}

uint64_t __90__HDWorkoutBuilderEntity__enumerateAssociatedSamplePropertiesInTransaction_error_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1C1879F90](*(void *)(a1 + 40), 0);
  HDSQLiteColumnAsInt64();
  HDSQLiteColumnAsInt64();
  double v3 = MEMORY[0x1C1879F40](*(void *)(a1 + 40), 3);
  double v4 = MEMORY[0x1C1879F40](*(void *)(a1 + 40), 4);
  MEMORY[0x1C1879FC0](*(void *)(a1 + 40), 5);
  uint64_t v5 = (*(uint64_t (**)(double, double))(*(void *)(a1 + 32) + 16))(v3, v4);

  return v5;
}

- (BOOL)insertWorkoutEvent:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
  id v11 = [v9 databaseForEntity:self];
  id v12 = +[HDWorkoutEventEntity insertPersistableWorkoutEvent:v8 ownerID:v10 database:v11 error:a5];

  return v12 != 0;
}

- (id)workoutEventsInTransaction:(id)a3 error:(id *)a4
{
  double v4 = +[HDWorkoutBuilderEventEntity workoutEventsWithWorkoutBuilder:self transaction:a3 error:a4];

  return v4;
}

- (BOOL)insertPrimaryWorkoutActivity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 databaseForEntityClass:objc_opt_class()];
  LOBYTE(a5) = +[HDWorkoutActivityEntity insertPrimaryActivity:v8 ownerID:[(HDSQLiteEntity *)self persistentID] database:v10 error:a5];

  return (char)a5;
}

- (BOOL)insertWorkoutActivity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 databaseForEntityClass:objc_opt_class()];
  v13[0] = v8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  LOBYTE(a5) = +[HDWorkoutActivityEntity insertSubActivities:v11 ownerID:[(HDSQLiteEntity *)self persistentID] database:v10 error:a5];

  return (char)a5;
}

- (BOOL)updateWorkoutActivityEndDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 UUID];
  id v20 = 0;
  id v10 = +[HDWorkoutActivityEntity activityEntityWithUUID:v9 transaction:v8 error:&v20];
  id v11 = v20;

  if (!v10)
  {
    if (v11)
    {
      id v11 = v11;
    }
    else
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = [v7 UUID];
      uint64_t v17 = [v16 UUIDString];
      BOOL v18 = objc_msgSend(v15, "hk_error:format:", 118, @"Could not find activity with UUID %@", v17);

      id v11 = v18;
      if (!v11)
      {
        char v14 = 1;
LABEL_12:

        goto LABEL_13;
      }
    }
    if (a5)
    {
      id v11 = v11;
      char v14 = 0;
      *a5 = v11;
    }
    else
    {
      _HKLogDroppedError();
      char v14 = 0;
    }
    goto LABEL_12;
  }
  id v12 = [v7 endDate];
  char v13 = [v10 setEndDate:v12 transaction:v8 error:a5];

  if (v13)
  {
    [v7 duration];
    char v14 = objc_msgSend(v10, "setDuration:transaction:error:", v8, a5);
  }
  else
  {
    char v14 = 0;
  }
LABEL_13:

  return v14;
}

- (BOOL)updateWorkoutActivityMetadata:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 UUID];
  id v19 = 0;
  id v10 = +[HDWorkoutActivityEntity activityEntityWithUUID:v9 transaction:v8 error:&v19];
  id v11 = v19;

  if (v10)
  {
    id v12 = [v7 metadata];
    char v13 = [v10 setMetadata:v12 transaction:v8 error:a5];
  }
  else
  {
    if (v11)
    {
      id v12 = v11;
    }
    else
    {
      char v14 = (void *)MEMORY[0x1E4F28C58];
      id v15 = [v7 UUID];
      uint64_t v16 = [v15 UUIDString];
      uint64_t v17 = objc_msgSend(v14, "hk_error:format:", 118, @"Could not find activity with UUID %@", v16);

      id v12 = v17;
      if (!v12)
      {
        id v11 = 0;
        char v13 = 1;
        goto LABEL_11;
      }
    }
    if (a5)
    {
      id v12 = v12;
      char v13 = 0;
      *a5 = v12;
    }
    else
    {
      _HKLogDroppedError();
      char v13 = 0;
    }
    id v11 = v12;
  }
LABEL_11:

  return v13;
}

- (id)workoutActivitiesInTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 databaseForEntityClass:objc_opt_class()];
  id v8 = +[HDWorkoutActivityEntity subActivitiesWithOwnerID:[(HDSQLiteEntity *)self persistentID] database:v7 error:a4];

  return v8;
}

- (BOOL)storeStatisticsCalculator:(id)a3 anchor:(id)a4 activityUUID:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v20 = 0;
  id v15 = +[HDWorkoutActivityEntity activityEntityWithUUID:v13 transaction:v14 error:&v20];
  id v16 = v20;
  id v17 = v16;
  if (!v15)
  {
    if (v16)
    {
      id v17 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 118, @"Could not find activity with UUID %@", v13);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        BOOL v18 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    if (a7)
    {
      id v17 = v17;
      BOOL v18 = 0;
      *a7 = v17;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v18 = 0;
    }
    goto LABEL_10;
  }
  BOOL v18 = +[HDStatisticsCalculatorEntity setCalculator:v11 forOwner:v15 anchor:v12 transaction:v14 error:a7];
LABEL_11:

  return v18;
}

- (BOOL)enumerateStatisticsInTransaction:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = [(HDSQLiteEntity *)self persistentID];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__HDWorkoutBuilderEntity_enumerateStatisticsInTransaction_error_block___block_invoke;
  v14[3] = &unk_1E6308198;
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  LOBYTE(a4) = +[HDWorkoutActivityEntity enumerateActivityEntitiesForOwnerID:v10 transaction:v11 error:a4 enumerationHandler:v14];

  return (char)a4;
}

BOOL __71__HDWorkoutBuilderEntity_enumerateStatisticsInTransaction_error_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 UUIDInTransaction:*(void *)(a1 + 32) error:a3];
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__HDWorkoutBuilderEntity_enumerateStatisticsInTransaction_error_block___block_invoke_2;
    v10[3] = &unk_1E6308170;
    uint64_t v7 = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v11 = v6;
    BOOL v8 = +[HDStatisticsCalculatorEntity enumerateStatisticsForOwner:v5 transaction:v7 error:a3 block:v10];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __71__HDWorkoutBuilderEntity_enumerateStatisticsInTransaction_error_block___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v15 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  if (v10)
  {
    id v14 = [v10 currentStatistics];
  }
  else
  {
    id v14 = v9;
  }
  (*(void (**)(uint64_t, id, uint64_t, void *, id, id))(v13 + 16))(v13, v15, v12, v14, v10, v11);
  if (v10) {
}
  }

- (BOOL)setArchivedState:(id)a3 forDataSourceIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [a5 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __81__HDWorkoutBuilderEntity_setArchivedState_forDataSourceIdentifier_profile_error___block_invoke;
  v16[3] = &unk_1E62FC928;
  id v13 = v11;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  id v19 = self;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v12 error:a6 block:v16];

  return (char)a6;
}

BOOL __81__HDWorkoutBuilderEntity_setArchivedState_forDataSourceIdentifier_profile_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  return +[HDWorkoutBuilderDataSourceEntity storeDataSourceWithIdentifier:a1[4] archivedState:a1[5] workoutBuilder:a1[6] transaction:a2 error:a3];
}

- (BOOL)removeDataSourceWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__HDWorkoutBuilderEntity_removeDataSourceWithIdentifier_profile_error___block_invoke;
  v12[3] = &unk_1E62FCBE0;
  id v10 = v8;
  id v13 = v10;
  id v14 = self;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v9 error:a5 block:v12];

  return (char)a5;
}

BOOL __71__HDWorkoutBuilderEntity_removeDataSourceWithIdentifier_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDWorkoutBuilderDataSourceEntity removeDataSourceWithIdentifier:*(void *)(a1 + 32) fromWorkoutBuilder:*(void *)(a1 + 40) transaction:a2 error:a3];
}

- (BOOL)enumerateDataSourcesForProfile:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = [a3 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__HDWorkoutBuilderEntity_enumerateDataSourcesForProfile_error_block___block_invoke;
  v12[3] = &unk_1E63081C0;
  void v12[4] = self;
  id v10 = v8;
  id v13 = v10;
  LOBYTE(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v9 error:a4 block:v12];

  return (char)a4;
}

BOOL __69__HDWorkoutBuilderEntity_enumerateDataSourcesForProfile_error_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDWorkoutBuilderDataSourceEntity enumerateDataSourcesForWorkoutBuilder:*(void *)(a1 + 32) transaction:a2 error:a3 block:*(void *)(a1 + 40)];
}

+ (id)databaseTable
{
  return @"workout_builders";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  {
    id v5 = a3;
    a3 = v5;
    if (v4)
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_2, 0, &dword_1BCB7D000);
      a3 = v5;
    }
  }
  *a3 = 15;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)+[HDWorkoutBuilderEntity columnDefinitionsWithCount:]::columnDefinitions;
}

+ (id)foreignKeys
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"source_id";
  uint64_t v2 = +[HDHealthEntity defaultForeignKey];
  v6[1] = @"device_id";
  v7[0] = v2;
  double v3 = +[HDHealthEntity defaultForeignKey];
  v7[1] = v3;
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)privateSubEntities
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];

  return v2;
}

@end