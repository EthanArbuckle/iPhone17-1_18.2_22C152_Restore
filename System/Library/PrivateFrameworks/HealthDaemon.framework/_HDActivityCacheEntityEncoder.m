@interface _HDActivityCacheEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)_decodeActivityQuantityStatisticsInfosWithRow:(int)a3 column:;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
- (uint64_t)_shouldIncludeActivityCachePrivateProperties;
- (uint64_t)_shouldIncludeActivityCacheStatistics;
@end

@implementation _HDActivityCacheEntityEncoder

- (id)orderedProperties
{
  v15[16] = *MEMORY[0x1E4F143B8];
  v15[0] = @"cache_index";
  v15[1] = @"sequence";
  v15[2] = @"activity_mode";
  v15[3] = @"energy_burned";
  v15[4] = @"move_minutes";
  v15[5] = @"brisk_minutes";
  v15[6] = @"active_hours";
  v15[7] = @"energy_burned_goal";
  v15[8] = @"energy_burned_goal_date";
  v15[9] = @"move_minutes_goal";
  v15[10] = @"move_minutes_goal_date";
  v15[11] = @"brisk_minutes_goal";
  v15[12] = @"brisk_minutes_goal_date";
  v15[13] = @"active_hours_goal";
  v15[14] = @"active_hours_goal_date";
  v15[15] = @"version";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:16];
  if (-[_HDActivityCacheEntityEncoder _shouldIncludeActivityCachePrivateProperties](self))
  {
    v14[0] = @"steps";
    v14[1] = @"pushes";
    v14[2] = @"walk_distance";
    v14[3] = @"deep_breathing_duration";
    v14[4] = @"flights";
    v14[5] = @"wheelchair_use";
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:6];
    uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

    v3 = (void *)v5;
  }
  if (-[_HDActivityCacheEntityEncoder _shouldIncludeActivityCacheStatistics](self))
  {
    v13[0] = @"energy_burned_stats";
    v13[1] = @"move_minutes_stats";
    v13[2] = @"brisk_minutes_stats";
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
    uint64_t v7 = [v3 arrayByAddingObjectsFromArray:v6];

    v3 = (void *)v7;
  }
  v8 = [v3 arrayByAddingObject:@"paused"];

  v9 = [(HDEntityEncoder *)self superclassEncoder];
  v10 = [v9 orderedProperties];
  v11 = [v8 arrayByAddingObjectsFromArray:v10];

  return v11;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if ((-[_HDActivityCacheEntityEncoder _shouldIncludeActivityCachePrivateProperties](self) & 1) == 0)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"HDActivityCacheEntity.m", 629, @"Invalid parameter not satisfying: %@", @"[self _shouldIncludeActivityCachePrivateProperties]" object file lineNumber description];
  }
  if ((-[_HDActivityCacheEntityEncoder _shouldIncludeActivityCacheStatistics](self) & 1) == 0)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"HDActivityCacheEntity.m", 630, @"Invalid parameter not satisfying: %@", @"[self _shouldIncludeActivityCacheStatistics]" object file lineNumber description];
  }
  v10 = [(HDEntityEncoder *)self superclassEncoder];
  v11 = [v10 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (v11)
  {
    v12 = objc_alloc_init(HDCodableActivityCache);
    [(HDCodableActivityCache *)v12 setSample:v11];
    [(HDCodableActivityCache *)v12 setCacheIndex:HDSQLiteColumnWithNameAsInt64()];
    [(HDCodableActivityCache *)v12 setSequence:HDSQLiteColumnWithNameAsInt64()];
    int v13 = HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a4, v13) & 1) == 0) {
      [(HDCodableActivityCache *)v12 setWheelchairUse:HDSQLiteColumnAsInt64()];
    }
    [(HDCodableActivityCache *)v12 setActivityMoveMode:HDEntityActivityModeModeForRowAndColumnName((uint64_t)a4)];
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0) {
      [(HDCodableActivityCache *)v12 setPaused:HDSQLiteColumnWithNameAsBoolean()];
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0) {
      [(HDCodableActivityCache *)v12 setVersion:HDSQLiteColumnWithNameAsInt64()];
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setEnergyBurned:](v12, "setEnergyBurned:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setEnergyBurnedGoal:](v12, "setEnergyBurnedGoal:");
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setEnergyBurnedGoalDate:](v12, "setEnergyBurnedGoalDate:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setMoveMinutes:](v12, "setMoveMinutes:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setMoveMinutesGoal:](v12, "setMoveMinutesGoal:");
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setMoveMinutesGoalDate:](v12, "setMoveMinutesGoalDate:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setBriskMinutes:](v12, "setBriskMinutes:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setBriskMinutesGoal:](v12, "setBriskMinutesGoal:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setBriskMinutesGoalDate:](v12, "setBriskMinutesGoalDate:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setActiveHours:](v12, "setActiveHours:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setActiveHoursGoal:](v12, "setActiveHoursGoal:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setActiveHoursGoalDate:](v12, "setActiveHoursGoalDate:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0) {
      [(HDCodableActivityCache *)v12 setStepCount:HDSQLiteColumnWithNameAsInt64()];
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0) {
      [(HDCodableActivityCache *)v12 setPushCount:HDSQLiteColumnWithNameAsInt64()];
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setWalkingAndRunningDistance:](v12, "setWalkingAndRunningDistance:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableActivityCache setDeepBreathingDuration:](v12, "setDeepBreathingDuration:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0) {
      [(HDCodableActivityCache *)v12 setFlightsClimbed:HDSQLiteColumnWithNameAsInt64()];
    }
    int v14 = HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a4, v14) & 1) == 0)
    {
      v15 = -[_HDActivityCacheEntityEncoder _decodeActivityQuantityStatisticsInfosWithRow:column:]((uint64_t)self, (uint64_t)a4, v14);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v47 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = [*(id *)(*((void *)&v46 + 1) + 8 * i) codableRepresentationForSync];
            [(HDCodableActivityCache *)v12 addDailyEnergyBurnedStatistics:v20];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v17);
      }
    }
    int v21 = HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a4, v21) & 1) == 0)
    {
      v22 = -[_HDActivityCacheEntityEncoder _decodeActivityQuantityStatisticsInfosWithRow:column:]((uint64_t)self, (uint64_t)a4, v21);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v43 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = [*(id *)(*((void *)&v42 + 1) + 8 * j) codableRepresentationForSync];
            [(HDCodableActivityCache *)v12 addDailyMoveMinutesStatistics:v27];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v24);
      }
    }
    int v28 = HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a4, v28) & 1) == 0)
    {
      v29 = -[_HDActivityCacheEntityEncoder _decodeActivityQuantityStatisticsInfosWithRow:column:]((uint64_t)self, (uint64_t)a4, v28);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v39;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v39 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = [*(id *)(*((void *)&v38 + 1) + 8 * k) codableRepresentationForSync];
            [(HDCodableActivityCache *)v12 addDailyBriskMinutesStatistics:v34];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v38 objects:v50 count:16];
        }
        while (v31);
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (uint64_t)_shouldIncludeActivityCachePrivateProperties
{
  if (!a1) {
    return 0;
  }
  if (![a1 purpose]) {
    return 1;
  }
  v2 = [a1 encodingOptions];
  v3 = [v2 objectForKeyedSubscript:@"IncludePrivateActivityCacheProperties"];

  if (v3) {
    uint64_t v4 = [v3 BOOLValue];
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

- (uint64_t)_shouldIncludeActivityCacheStatistics
{
  if (!a1) {
    return 0;
  }
  if (![a1 purpose]) {
    return 1;
  }
  v2 = [a1 encodingOptions];
  v3 = [v2 objectForKeyedSubscript:@"IncludeActivityCacheStatistics"];

  if (v3) {
    uint64_t v4 = [v3 BOOLValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_decodeActivityQuantityStatisticsInfosWithRow:(int)a3 column:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 72);
    if (!v6)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      v10 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v9;

      uint64_t v6 = *(void *)(a1 + 72);
    }
    v11 = (void *)MEMORY[0x1E4F28DC0];
    v12 = MEMORY[0x1C1879F20](a2, a3);
    id v17 = 0;
    int v13 = [v11 unarchivedObjectOfClasses:v6 fromData:v12 error:&v17];
    id v14 = v17;

    if (!v13)
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E4F29EF0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v14;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "Failed to decode activity statistics: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2AB98]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    [v10 _setCacheIndex:HDSQLiteColumnWithNameAsInt64()];
    [v10 _setSequence:HDSQLiteColumnWithNameAsInt64()];
    int v13 = (void *)MEMORY[0x1E4F2B370];
    id v14 = [MEMORY[0x1E4F2B618] kilocalorieUnit];
    HDSQLiteColumnWithNameAsDouble();
    v15 = objc_msgSend(v13, "quantityWithUnit:doubleValue:", v14);
    [v10 _setEnergyBurned:v15];

    uint64_t v16 = (void *)MEMORY[0x1E4F2B370];
    id v17 = [MEMORY[0x1E4F2B618] kilocalorieUnit];
    HDSQLiteColumnWithNameAsDouble();
    uint64_t v18 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v17);
    [v10 _setEnergyBurnedGoalOnly:v18];

    id v19 = HDSQLiteColumnWithNameAsDate();
    [v10 _setEnergyBurnedGoalDateOnly:v19];

    uint64_t v20 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v20) & 1) == 0)
    {
      MEMORY[0x1C1879F40](a5, v20);
      objc_msgSend(v10, "_setMoveMinutes:");
    }
    uint64_t v21 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v21) & 1) == 0)
    {
      v22 = (void *)MEMORY[0x1E4F2B370];
      uint64_t v23 = [MEMORY[0x1E4F2B618] minuteUnit];
      MEMORY[0x1C1879F40](a5, v21);
      uint64_t v24 = objc_msgSend(v22, "quantityWithUnit:doubleValue:", v23);
      [v10 _setMoveMinutesGoalOnly:v24];
    }
    uint64_t v25 = HDSQLiteColumnWithNameAsDate();
    [v10 _setMoveMinutesGoalDateOnly:v25];

    uint64_t v26 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v26) & 1) == 0)
    {
      MEMORY[0x1C1879F40](a5, v26);
      objc_msgSend(v10, "_setBriskMinutes:");
    }
    uint64_t v27 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v27) & 1) == 0)
    {
      int v28 = (void *)MEMORY[0x1E4F2B370];
      v29 = [MEMORY[0x1E4F2B618] minuteUnit];
      MEMORY[0x1C1879F40](a5, v27);
      uint64_t v30 = objc_msgSend(v28, "quantityWithUnit:doubleValue:", v29);
      [v10 _setBriskMinutesGoalOnly:v30];
    }
    uint64_t v31 = HDSQLiteColumnWithNameAsDate();
    [v10 _setBriskMinutesGoalDateOnly:v31];

    uint64_t v32 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v32) & 1) == 0)
    {
      MEMORY[0x1C1879F40](a5, v32);
      objc_msgSend(v10, "_setActiveHours:");
    }
    uint64_t v33 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v33) & 1) == 0)
    {
      v34 = (void *)MEMORY[0x1E4F2B370];
      v35 = [MEMORY[0x1E4F2B618] countUnit];
      MEMORY[0x1C1879F40](a5, v33);
      v36 = objc_msgSend(v34, "quantityWithUnit:doubleValue:", v35);
      [v10 _setActiveHoursGoalOnly:v36];
    }
    v37 = HDSQLiteColumnWithNameAsDate();
    [v10 _setActiveHoursGoalDateOnly:v37];

    [v10 _setActivityMoveMode:HDEntityActivityModeModeForRowAndColumnName((uint64_t)a5)];
    [v10 _setPaused:HDSQLiteColumnWithNameAsBoolean()];
    [v10 _setVersion:HDSQLiteColumnWithNameAsInt64()];
    if (-[_HDActivityCacheEntityEncoder _shouldIncludeActivityCachePrivateProperties](self))
    {
      id v38 = v10;
      if (self)
      {
        int v39 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1C1879FC0](a5, v39) & 1) == 0) {
          [v38 _setStepCount:HDSQLiteColumnAsInt64()];
        }
        long long v40 = (void *)MEMORY[0x1E4F2B370];
        long long v41 = [MEMORY[0x1E4F2B618] meterUnit];
        HDSQLiteColumnWithNameAsDouble();
        long long v42 = objc_msgSend(v40, "quantityWithUnit:doubleValue:", v41);
        [v38 _setWalkingAndRunningDistance:v42];

        int v43 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1C1879FC0](a5, v43) & 1) == 0) {
          [v38 _setPushCount:HDSQLiteColumnAsInt64()];
        }
        uint64_t v44 = (int)HDSQLiteColumnWithName();
        if ((MEMORY[0x1C1879FC0](a5, v44) & 1) == 0)
        {
          MEMORY[0x1C1879F40](a5, v44);
          objc_msgSend(v38, "_setDeepBreathingDuration:");
        }
        int v45 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1C1879FC0](a5, v45) & 1) == 0) {
          [v38 _setFlightsClimbed:HDSQLiteColumnAsInt64()];
        }
        int v46 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1C1879FC0](a5, v46) & 1) == 0) {
          [v38 _setWheelchairUse:HDSQLiteColumnAsInt64()];
        }
      }
    }
    if (-[_HDActivityCacheEntityEncoder _shouldIncludeActivityCacheStatistics](self))
    {
      id v47 = v10;
      if (self)
      {
        int v48 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1C1879FC0](a5, v48) & 1) == 0)
        {
          long long v49 = -[_HDActivityCacheEntityEncoder _decodeActivityQuantityStatisticsInfosWithRow:column:]((uint64_t)self, (uint64_t)a5, v48);
          [v47 _setDailyEnergyBurnedStatistics:v49];
        }
        int v50 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1C1879FC0](a5, v50) & 1) == 0)
        {
          v51 = -[_HDActivityCacheEntityEncoder _decodeActivityQuantityStatisticsInfosWithRow:column:]((uint64_t)self, (uint64_t)a5, v50);
          [v47 _setDailyMoveMinutesStatistics:v51];
        }
        int v52 = HDSQLiteColumnWithName();
        if ((MEMORY[0x1C1879FC0](a5, v52) & 1) == 0)
        {
          uint64_t v53 = -[_HDActivityCacheEntityEncoder _decodeActivityQuantityStatisticsInfosWithRow:column:]((uint64_t)self, (uint64_t)a5, v52);
          [v47 _setDailyBriskMinutesStatistics:v53];
        }
      }
    }
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end