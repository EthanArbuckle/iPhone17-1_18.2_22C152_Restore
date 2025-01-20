@interface _HDFitnessFriendActivitySnapshotEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDFitnessFriendActivitySnapshotEntityEncoder

- (id)orderedProperties
{
  v8[18] = *MEMORY[0x1E4F143B8];
  v8[0] = @"friend_uuid";
  v8[1] = @"active_hours";
  v8[2] = @"active_hours_goal";
  v8[3] = @"brisk_minutes";
  v8[4] = @"brisk_minutes_goal";
  v8[5] = @"energy_burned";
  v8[6] = @"energy_burned_goal";
  v8[7] = @"move_minutes";
  v8[8] = @"move_minutes_goal";
  v8[9] = @"activity_move_mode";
  v8[10] = @"steps";
  v8[11] = @"walk_run_distance";
  v8[12] = @"snapshot_index";
  v8[13] = @"source_uuid";
  v8[14] = @"uploaded_date";
  v8[15] = @"vulcan_count";
  v8[16] = @"vulcan_condition";
  v8[17] = @"timezone_offset";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:18];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v8 = [(HDEntityEncoder *)self superclassEncoder];
  v9 = [v8 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableFitnessFriendActivitySnapshot);
    [(HDCodableFitnessFriendActivitySnapshot *)v10 setSample:v9];
    v11 = HDSQLiteColumnWithNameAsData();
    [(HDCodableFitnessFriendActivitySnapshot *)v10 setFriendUUID:v11];

    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setActiveHours:](v10, "setActiveHours:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setActiveHoursGoal:](v10, "setActiveHoursGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setBriskMinutes:](v10, "setBriskMinutes:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setBriskMinutesGoal:](v10, "setBriskMinutesGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setEnergyBurned:](v10, "setEnergyBurned:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setEnergyBurnedGoal:](v10, "setEnergyBurnedGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setMmv:](v10, "setMmv:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setMmg:](v10, "setMmg:");
    [(HDCodableFitnessFriendActivitySnapshot *)v10 setAmm:HDEntityActivityModeModeForRowAndColumnName((uint64_t)a4)];
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setWalkingAndRunningDistance:](v10, "setWalkingAndRunningDistance:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setStepCount:](v10, "setStepCount:");
    v12 = HDSQLiteColumnWithNameAsData();
    [(HDCodableFitnessFriendActivitySnapshot *)v10 setSourceUUID:v12];

    [(HDCodableFitnessFriendActivitySnapshot *)v10 setSnapshotIndex:HDSQLiteColumnWithNameAsInt64()];
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setUploadedDate:](v10, "setUploadedDate:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendActivitySnapshot setPushCount:](v10, "setPushCount:");
    [(HDCodableFitnessFriendActivitySnapshot *)v10 setWheelchairUse:HDSQLiteColumnWithNameAsInt64()];
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0) {
      [(HDCodableFitnessFriendActivitySnapshot *)v10 setTimeZoneOffsetFromUTCForNoon:HDSQLiteColumnWithNameAsInt64()];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B8F8]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    v13 = HDSQLiteColumnWithNameAsUUID();
    [v10 setFriendUUID:v13];

    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setActiveHours:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setActiveHoursGoal:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setBriskMinutes:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setBriskMinutesGoal:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setEnergyBurned:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setEnergyBurnedGoal:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setMmv:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setMmg:");
    [v10 setAmm:HDEntityActivityModeModeForRowAndColumnName((uint64_t)a5)];
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setWalkingAndRunningDistance:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setStepCount:");
    v14 = HDSQLiteColumnWithNameAsUUID();
    [v10 setSourceUUID:v14];

    [v10 setSnapshotIndex:HDSQLiteColumnWithNameAsInt64()];
    v15 = HDSQLiteColumnWithNameAsDate();
    [v10 setSnapshotUploadedDate:v15];

    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setPushCount:");
    [v10 setWheelchairUse:HDSQLiteColumnWithNameAsInt64()];
    int v16 = HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v16) & 1) == 0)
    {
      v17 = [NSNumber numberWithLongLong:HDSQLiteColumnAsInt64()];
      [v10 setTimeZoneOffsetFromUTCForNoon:v17];
    }
  }

  return v12;
}

@end