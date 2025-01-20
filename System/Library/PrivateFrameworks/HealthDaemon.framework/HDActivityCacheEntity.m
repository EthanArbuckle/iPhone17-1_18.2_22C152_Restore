@interface HDActivityCacheEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)isConcreteEntity;
+ (BOOL)supportsObjectMerging;
+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_createValidationError:(void *)a3 rowId:;
+ (id)activityCacheForIndex:(int64_t)a3 profile:(id)a4 encodingOptions:(id)a5 error:(id *)a6;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)indices;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8;
+ (void)_validateNonNegativeNumericProperty:(uint64_t)a3 row:(void *)a4 rowId:(void *)a5 validationErrorHandler:;
@end

@implementation HDActivityCacheEntity

+ (BOOL)supportsObjectMerging
{
  return 1;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDActivityCacheEntity.m", 204, @"Subclasses must override %s", "+[HDActivityCacheEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  self;
  v16 = [v12 dailyEnergyBurnedStatistics];

  if (v16
    && (v17 = (void *)MEMORY[0x1E4F28DB0],
        [v12 dailyEnergyBurnedStatistics],
        v18 = objc_claimAutoreleasedReturnValue(),
        [v17 archivedDataWithRootObject:v18 requiringSecureCoding:1 error:a7],
        v16 = objc_claimAutoreleasedReturnValue(),
        v18,
        !v16))
  {
    id v28 = 0;
  }
  else
  {
    v19 = [v12 dailyMoveMinutesStatistics];

    if (v19
      && (v20 = (void *)MEMORY[0x1E4F28DB0],
          [v12 dailyMoveMinutesStatistics],
          v21 = objc_claimAutoreleasedReturnValue(),
          [v20 archivedDataWithRootObject:v21 requiringSecureCoding:1 error:a7],
          v19 = objc_claimAutoreleasedReturnValue(),
          v21,
          !v19))
    {
      id v28 = 0;
    }
    else
    {
      v22 = [v12 dailyBriskMinutesStatistics];

      if (v22
        && (v23 = (void *)MEMORY[0x1E4F28DB0],
            [v12 dailyBriskMinutesStatistics],
            v24 = objc_claimAutoreleasedReturnValue(),
            [v23 archivedDataWithRootObject:v24 requiringSecureCoding:1 error:a7],
            v22 = objc_claimAutoreleasedReturnValue(),
            v24,
            !v22))
      {
        id v28 = 0;
      }
      else
      {
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __87__HDActivityCacheEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
        v31[3] = &unk_1E6306868;
        id v25 = v14;
        id v32 = v25;
        id v33 = v12;
        id v34 = v16;
        id v35 = v19;
        id v36 = v22;
        id v26 = v22;
        if ([v13 executeSQL:@"INSERT INTO activity_caches (data_id, cache_index, sequence, activity_mode, paused, wheelchair_use, energy_burned, energy_burned_goal, energy_burned_goal_date, move_minutes, move_minutes_goal, move_minutes_goal_date, brisk_minutes, brisk_minutes_goal, brisk_minutes_goal_date, active_hours, active_hours_goal, active_hours_goal_date, steps, pushes, walk_distance, deep_breathing_duration, flights, energy_burned_stats, move_minutes_stats, brisk_minutes_stats, version) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", a7, v31, 0 error bindingHandler enumerationHandler])v27 = v25; {
        else
        }
          v27 = 0;
        id v28 = v27;
      }
    }
  }

  return v28;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addActivityCaches:a3];
  }
  return a3 != 0;
}

+ (id)databaseTable
{
  return @"activity_caches";
}

uint64_t __87__HDActivityCacheEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 40) cacheIndex]);
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 40) sequence]);
  sqlite3_bind_int64(a2, 4, [*(id *)(a1 + 40) activityMoveMode]);
  sqlite3_bind_int(a2, 5, [*(id *)(a1 + 40) isPaused]);
  if ([*(id *)(a1 + 40) hasWheelchairUse]) {
    sqlite3_bind_int64(a2, 6, [*(id *)(a1 + 40) wheelchairUse]);
  }
  else {
    sqlite3_bind_null(a2, 6);
  }
  if ([*(id *)(a1 + 40) hasEnergyBurned])
  {
    v4 = [*(id *)(a1 + 40) energyBurned];
    v5 = [MEMORY[0x1E4F2B618] kilocalorieUnit];
    [v4 doubleValueForUnit:v5];
    sqlite3_bind_double(a2, 7, v6);
  }
  else
  {
    sqlite3_bind_null(a2, 7);
  }
  if ([*(id *)(a1 + 40) hasEnergyBurnedGoal])
  {
    v7 = [*(id *)(a1 + 40) energyBurnedGoal];
    v8 = [MEMORY[0x1E4F2B618] kilocalorieUnit];
    [v7 doubleValueForUnit:v8];
    sqlite3_bind_double(a2, 8, v9);

    v10 = [*(id *)(a1 + 40) energyBurnedGoalDate];
    [v10 timeIntervalSinceReferenceDate];
    sqlite3_bind_double(a2, 9, v11);
  }
  else
  {
    sqlite3_bind_null(a2, 8);
    sqlite3_bind_null(a2, 9);
  }
  if ([*(id *)(a1 + 40) hasMoveMinutes])
  {
    [*(id *)(a1 + 40) moveMinutes];
    sqlite3_bind_double(a2, 10, v12);
  }
  else
  {
    sqlite3_bind_null(a2, 10);
  }
  if ([*(id *)(a1 + 40) hasMoveMinutesGoal])
  {
    id v13 = [*(id *)(a1 + 40) moveMinutesGoal];
    id v14 = [MEMORY[0x1E4F2B618] minuteUnit];
    [v13 doubleValueForUnit:v14];
    sqlite3_bind_double(a2, 11, v15);

    v16 = [*(id *)(a1 + 40) moveMinutesGoalDate];
    [v16 timeIntervalSinceReferenceDate];
    sqlite3_bind_double(a2, 12, v17);
  }
  else
  {
    sqlite3_bind_null(a2, 11);
    sqlite3_bind_null(a2, 12);
  }
  if ([*(id *)(a1 + 40) hasBriskMinutes])
  {
    [*(id *)(a1 + 40) briskMinutes];
    sqlite3_bind_double(a2, 13, v18);
  }
  else
  {
    sqlite3_bind_null(a2, 13);
  }
  if ([*(id *)(a1 + 40) hasBriskMinutesGoal])
  {
    v19 = [*(id *)(a1 + 40) briskMinutesGoal];
    v20 = [MEMORY[0x1E4F2B618] minuteUnit];
    [v19 doubleValueForUnit:v20];
    sqlite3_bind_double(a2, 14, v21);
  }
  else
  {
    sqlite3_bind_null(a2, 14);
  }
  if ([*(id *)(a1 + 40) hasBriskMinutesGoalDate])
  {
    v22 = [*(id *)(a1 + 40) briskMinutesGoalDate];
    [v22 timeIntervalSinceReferenceDate];
    sqlite3_bind_double(a2, 15, v23);
  }
  else
  {
    sqlite3_bind_null(a2, 15);
  }
  if ([*(id *)(a1 + 40) hasActiveHours])
  {
    [*(id *)(a1 + 40) activeHours];
    sqlite3_bind_double(a2, 16, v24);
  }
  else
  {
    sqlite3_bind_null(a2, 16);
  }
  if ([*(id *)(a1 + 40) hasActiveHoursGoal])
  {
    id v25 = [*(id *)(a1 + 40) activeHoursGoal];
    id v26 = [MEMORY[0x1E4F2B618] countUnit];
    [v25 doubleValueForUnit:v26];
    sqlite3_bind_double(a2, 17, v27);
  }
  else
  {
    sqlite3_bind_null(a2, 17);
  }
  if ([*(id *)(a1 + 40) hasActiveHoursGoalDate])
  {
    id v28 = [*(id *)(a1 + 40) activeHoursGoalDate];
    [v28 timeIntervalSinceReferenceDate];
    sqlite3_bind_double(a2, 18, v29);
  }
  else
  {
    sqlite3_bind_null(a2, 18);
  }
  if ([*(id *)(a1 + 40) hasStepCount]) {
    sqlite3_bind_int64(a2, 19, [*(id *)(a1 + 40) stepCount]);
  }
  else {
    sqlite3_bind_null(a2, 19);
  }
  if ([*(id *)(a1 + 40) hasPushCount]) {
    sqlite3_bind_int64(a2, 20, [*(id *)(a1 + 40) pushCount]);
  }
  else {
    sqlite3_bind_null(a2, 20);
  }
  if ([*(id *)(a1 + 40) hasWalkingAndRunningDistance])
  {
    v30 = [*(id *)(a1 + 40) walkingAndRunningDistance];
    v31 = [MEMORY[0x1E4F2B618] meterUnit];
    [v30 doubleValueForUnit:v31];
    sqlite3_bind_double(a2, 21, v32);
  }
  else
  {
    sqlite3_bind_null(a2, 21);
  }
  if ([*(id *)(a1 + 40) hasDeepBreathingDuration])
  {
    [*(id *)(a1 + 40) deepBreathingDuration];
    sqlite3_bind_double(a2, 22, v33);
  }
  else
  {
    sqlite3_bind_null(a2, 22);
  }
  if ([*(id *)(a1 + 40) hasFlightsClimbed]) {
    sqlite3_bind_int64(a2, 23, [*(id *)(a1 + 40) flightsClimbed]);
  }
  else {
    sqlite3_bind_null(a2, 23);
  }
  if ([*(id *)(a1 + 40) hasDailyEnergyBurnedStatistics])
  {
    id v34 = _HDSQLiteValueForData();
    HDSQLiteBindFoundationValueToStatement();
  }
  else
  {
    sqlite3_bind_null(a2, 24);
  }
  if ([*(id *)(a1 + 40) hasDailyMoveMinutesStatistics])
  {
    id v35 = _HDSQLiteValueForData();
    HDSQLiteBindFoundationValueToStatement();
  }
  else
  {
    sqlite3_bind_null(a2, 25);
  }
  if ([*(id *)(a1 + 40) hasDailyBriskMinutesStatistics])
  {
    id v36 = _HDSQLiteValueForData();
    HDSQLiteBindFoundationValueToStatement();
  }
  else
  {
    sqlite3_bind_null(a2, 26);
  }
  sqlite3_int64 v37 = [*(id *)(a1 + 40) version];

  return sqlite3_bind_int64(a2, 27, v37);
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 27;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_73;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"data_id";
  v2 = +[HDDataEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)indices
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v3 = objc_opt_class();
  v9[0] = @"cache_index";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v5 = (void *)[v2 initWithEntity:v3 name:@"cache_index" columns:v4];

  v8 = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];

  return v6;
}

+ (id)activityCacheForIndex:(int64_t)a3 profile:(id)a4 encodingOptions:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  double v11 = HDActivityCacheEntityPredicateForCacheIndex(a3, 1);
  double v12 = [MEMORY[0x1E4F2B2C0] activityCacheType];
  id v13 = +[HDSampleEntity anySampleOfType:v12 profile:v10 encodingOptions:v9 predicate:v11 error:a6];

  return v13;
}

+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v38 = a4;
  id v14 = a5;
  id v37 = a6;
  id v36 = (void (**)(id, id, id *))a8;
  double v15 = HDActivityCacheEntityPredicateForCacheIndex([v13 cacheIndex], 1);
  v16 = [v38 sourceID];
  double v17 = HDDataEntityPredicateForSourceIdentifier((uint64_t)v16);

  double v18 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v17 otherPredicate:v15];
  if ([v13 sequence] < 1)
  {
    _HKInitializeLogging();
    double v24 = *MEMORY[0x1E4F29EF0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "Attempting to merge new activity cache (%@) with no sequence number, defaulting to old behavior of always replacing", buf, 0xCu);
    }
    id v21 = 0;
LABEL_16:
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v52 = __Block_byref_object_copy__145;
    v53 = __Block_byref_object_dispose__145;
    id v54 = 0;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __92__HDActivityCacheEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke;
    v40[3] = &unk_1E6301DD8;
    v40[4] = &v41;
    v40[5] = buf;
    [a1 deleteSamplesWithPredicate:v18 limit:0 generateDeletedObjects:0 transaction:v37 profile:v14 recursiveDeleteAuthorizationBlock:0 completionHandler:v40];
    if (*((unsigned char *)v42 + 24))
    {
      id v39 = 0;
      uint64_t v27 = v36[2](v36, v13, &v39);
      uint64_t v28 = (uint64_t)v39;
      if (!(v27 | v28))
      {
        _HKInitializeLogging();
        double v29 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v47 = 138543618;
          id v48 = v13;
          __int16 v49 = 2114;
          id v50 = v38;
          _os_log_fault_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_FAULT, "Unable to insert %{public}@ for %{public}@ when replacing existing cache, and no error was returned", v47, 0x16u);
        }
        uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 124, @"Failed to insert activity cache during merge replacement");
      }
      id v30 = (id)v28;
      id v31 = v30;
      if (v30)
      {
        if (a7) {
          *a7 = v30;
        }
        else {
          _HKLogDroppedError();
        }
      }

      goto LABEL_36;
    }
    id v32 = *(id *)(*(void *)&buf[8] + 40);
    id v31 = v32;
    if (v32)
    {
      if (a7)
      {
        id v31 = v32;
        uint64_t v27 = 0;
        *a7 = v31;
LABEL_36:

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(&v41, 8);
        goto LABEL_37;
      }
      _HKLogDroppedError();
    }
    uint64_t v27 = 0;
    goto LABEL_36;
  }
  v19 = [MEMORY[0x1E4F2B2C0] activityCacheType];
  id v45 = 0;
  id v46 = 0;
  v20 = [a1 mostRecentSampleWithType:v19 profile:v14 encodingOptions:0 predicate:v18 anchor:&v46 error:&v45];
  id v21 = v46;
  id v22 = v45;

  if (!v20 && v22)
  {
    _HKInitializeLogging();
    double v23 = *MEMORY[0x1E4F29EF0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v22;
      _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "Error retreiving most recent activity cache: %@", buf, 0xCu);
    }
    if (a7) {
      *a7 = v22;
    }
    else {
      _HKLogDroppedError();
    }

    uint64_t v27 = 0;
    goto LABEL_37;
  }
  if (!v20 || (uint64_t v25 = [v13 sequence], v25 > objc_msgSend(v20, "sequence")))
  {
    _HKInitializeLogging();
    id v26 = *MEMORY[0x1E4F29EF0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_debug_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEBUG, "Replacing existing activity cache (%@) with new activity cache (%@)", buf, 0x16u);
    }

    goto LABEL_16;
  }
  _HKInitializeLogging();
  double v33 = *MEMORY[0x1E4F29EF0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_DEFAULT, "Not replacing existing activity cache (%@) with new activity cache (%@)", buf, 0x16u);
  }

  id v21 = v21;
  uint64_t v27 = (uint64_t)v21;
LABEL_37:

  return (id)v27;
}

void __92__HDActivityCacheEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke(uint64_t a1, char a2, int a3, int a4, int a5, int a6, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 activityCaches];
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  double v15 = [(HDEntityEncoder *)[_HDActivityCacheEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  id v8 = a5;
  id v9 = [a3 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__HDActivityCacheEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke;
  v12[3] = &unk_1E62FB698;
  id v13 = @"SELECT ROWID, activity_mode, energy_burned, energy_burned_goal, move_minutes, move_minutes_goal, brisk_minutes, brisk_minutes_goal, active_hours, active_hours_goal, steps, pushes, walk_distance, flights, deep_breathing_duration FROM activity_caches";
  id v14 = v8;
  id v15 = a1;
  id v10 = v8;
  LOBYTE(a4) = [a1 performReadTransactionWithHealthDatabase:v9 error:a4 block:v12];

  return (char)a4;
}

uint64_t __80__HDActivityCacheEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 protectedDatabase];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__HDActivityCacheEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke_2;
  v11[3] = &unk_1E62F8820;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v12 = v7;
  uint64_t v13 = v8;
  uint64_t v9 = [v5 executeSQL:v6 error:a3 bindingHandler:0 enumerationHandler:v11];

  return v9;
}

uint64_t __80__HDActivityCacheEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4 = MEMORY[0x1C1879F70](a2, 0);
  v5 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v6 = v5;
  if (v5 && ((int)[v5 intValue] < 1 || (int)objc_msgSend(v6, "intValue") >= 3))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = [NSString stringWithFormat:@"Invalid HKActivityMoveMode %@", v6];
    id v10 = +[HDActivityCacheEntity _createValidationError:rowId:](v8, v9, v4);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
  }
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(void *)(a1 + 40), @"energy_burned", a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(void *)(a1 + 40), @"energy_burned_goal", a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(void *)(a1 + 40), @"move_minutes", a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(void *)(a1 + 40), @"move_minutes_goal", a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(void *)(a1 + 40), @"brisk_minutes", a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(void *)(a1 + 40), @"brisk_minutes_goal", a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(void *)(a1 + 40), @"active_hours", a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(void *)(a1 + 40), @"active_hours_goal", a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(void *)(a1 + 40), @"steps", a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(void *)(a1 + 40), @"pushes", a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(void *)(a1 + 40), @"walk_distance", a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(void *)(a1 + 40), @"deep_breathing_duration", a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(void *)(a1 + 40), @"flights", a2, v4, *(void **)(a1 + 32));

  return 1;
}

+ (id)_createValidationError:(void *)a3 rowId:
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 120, v5);

  v15[0] = *MEMORY[0x1E4F29B38];
  uint64_t v8 = [v6 databaseTable];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  v16[0] = v8;
  v16[1] = v7;
  uint64_t v10 = *MEMORY[0x1E4F29B30];
  v15[1] = v9;
  v15[2] = v10;
  v16[2] = v4;
  v15[3] = *MEMORY[0x1E4F29B48];
  id v11 = [NSString stringWithFormat:@"ROWID %@", v4];
  v16[3] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:userInfo:", 120, v12);

  return v13;
}

+ (void)_validateNonNegativeNumericProperty:(uint64_t)a3 row:(void *)a4 rowId:(void *)a5 validationErrorHandler:
{
  id v14 = a2;
  id v7 = a4;
  uint64_t v8 = a5;
  uint64_t v9 = self;
  uint64_t v10 = HDSQLiteColumnWithNameAsNumber();
  [v10 doubleValue];
  if (v11 < 0.0)
  {
    id v12 = [NSString stringWithFormat:@"Property value cannot be negative, name %@ value %@", v14, v10];
    uint64_t v13 = +[HDActivityCacheEntity _createValidationError:rowId:](v9, v12, v7);
    v8[2](v8, v13);
  }
}

@end