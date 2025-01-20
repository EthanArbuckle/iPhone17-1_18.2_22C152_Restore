@interface _HDFitnessFriendWorkoutEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDFitnessFriendWorkoutEntityEncoder

- (id)orderedProperties
{
  v9[16] = *MEMORY[0x1E4F143B8];
  v9[0] = @"friend_uuid";
  v9[1] = @"duration";
  v9[2] = @"total_energy_burned";
  v9[3] = @"total_basal_energy_burned";
  v9[4] = @"total_distance";
  v9[5] = @"activity_type";
  v9[6] = @"goal_type";
  v9[7] = @"goal";
  v9[8] = @"bundle_id";
  v9[9] = @"is_watch_workout";
  v9[10] = @"is_indoor_workout";
  v9[11] = @"device_manufacturer";
  v9[12] = @"device_model";
  v9[13] = @"activity_move_mode";
  v9[14] = @"seymour_catalog_workout_identifier";
  v9[15] = @"seymour_media_type";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:16];
  v8.receiver = self;
  v8.super_class = (Class)_HDFitnessFriendWorkoutEntityEncoder;
  v4 = [(HDEntityEncoder *)&v8 superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  objc_super v8 = [(HDEntityEncoder *)self superclassEncoder];
  v9 = [v8 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableFitnessFriendWorkout);
    [(HDCodableFitnessFriendWorkout *)v10 setSample:v9];
    v11 = HDSQLiteColumnWithNameAsData();
    [(HDCodableFitnessFriendWorkout *)v10 setFriendUUID:v11];

    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendWorkout setDuration:](v10, "setDuration:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendWorkout setTotalEnergyBurnedInCanonicalUnit:](v10, "setTotalEnergyBurnedInCanonicalUnit:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendWorkout setTotalBasalEnergyBurnedInCanonicalUnit:](v10, "setTotalBasalEnergyBurnedInCanonicalUnit:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableFitnessFriendWorkout setTotalDistanceInCanonicalUnit:](v10, "setTotalDistanceInCanonicalUnit:");
    [(HDCodableFitnessFriendWorkout *)v10 setType:HDSQLiteColumnWithNameAsInt64()];
    [(HDCodableFitnessFriendWorkout *)v10 setAmm:HDEntityActivityModeModeForRowAndColumnName((uint64_t)a4)];
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      [(HDCodableFitnessFriendWorkout *)v10 setGoalType:HDSQLiteColumnWithNameAsInt64()];
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableFitnessFriendWorkout setGoal:](v10, "setGoal:");
    }
    v12 = HDSQLiteColumnWithNameAsString();
    [(HDCodableFitnessFriendWorkout *)v10 setBundleID:v12];

    [(HDCodableFitnessFriendWorkout *)v10 setIsWatchWorkout:HDSQLiteColumnWithNameAsInt64()];
    [(HDCodableFitnessFriendWorkout *)v10 setIsIndoorWorkout:HDSQLiteColumnWithNameAsInt64()];
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v13 = HDSQLiteColumnWithNameAsString();
      [(HDCodableFitnessFriendWorkout *)v10 setDeviceManufacturer:v13];
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v14 = HDSQLiteColumnWithNameAsString();
      [(HDCodableFitnessFriendWorkout *)v10 setDeviceModel:v14];
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v15 = HDSQLiteColumnWithNameAsString();
      [(HDCodableFitnessFriendWorkout *)v10 setSeymourCatalogWorkoutIdentifier:v15];
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v16 = HDSQLiteColumnWithNameAsString();
      [(HDCodableFitnessFriendWorkout *)v10 setSeymourMediaType:v16];
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
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B900]) _init];

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
    objc_msgSend(v10, "setDuration:");
    uint64_t v14 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v14) & 1) == 0)
    {
      double v15 = MEMORY[0x1C1879F40](a5, v14);
      v16 = (void *)MEMORY[0x1E4F2B370];
      v17 = _HKWorkoutCanonicalEnergyBurnedUnit();
      v18 = [v16 quantityWithUnit:v17 doubleValue:v15];

      [v10 setTotalEnergyBurned:v18];
    }
    uint64_t v19 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v19) & 1) == 0)
    {
      double v20 = MEMORY[0x1C1879F40](a5, v19);
      v21 = (void *)MEMORY[0x1E4F2B370];
      v22 = _HKWorkoutCanonicalEnergyBurnedUnit();
      v23 = [v21 quantityWithUnit:v22 doubleValue:v20];

      [v10 setTotalBasalEnergyBurned:v23];
    }
    uint64_t v24 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v24) & 1) == 0)
    {
      double v25 = MEMORY[0x1C1879F40](a5, v24);
      v26 = (void *)MEMORY[0x1E4F2B370];
      v27 = _HKWorkoutCanonicalDistanceUnit();
      v28 = [v26 quantityWithUnit:v27 doubleValue:v25];

      [v10 setTotalDistance:v28];
    }
    [v10 setWorkoutActivityType:HDSQLiteColumnWithNameAsInt64()];
    [v10 setAmm:HDEntityActivityModeModeForRowAndColumnName((uint64_t)a5)];
    uint64_t v29 = HDSQLiteColumnWithNameAsInt64();
    uint64_t v30 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v30) & 1) == 0 && _HKWorkoutGoalTypeIsValidForGoal())
    {
      v31 = (void *)MEMORY[0x1E4F2B370];
      v32 = _HKWorkoutCanonicalUnitForGoalType();
      MEMORY[0x1C1879F40](a5, v30);
      v33 = objc_msgSend(v31, "quantityWithUnit:doubleValue:", v32);

      [v10 setGoal:v33];
      [v10 setGoalType:v29];
    }
    v34 = HDSQLiteColumnWithNameAsString();
    [v10 setBundleID:v34];

    [v10 setIsWatchWorkout:HDSQLiteColumnWithNameAsInt64() != 0];
    [v10 setIsIndoorWorkout:HDSQLiteColumnWithNameAsInt64() != 0];
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v35 = HDSQLiteColumnWithNameAsString();
      [v10 setDeviceManufacturer:v35];
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v36 = HDSQLiteColumnWithNameAsString();
      [v10 setDeviceModel:v36];
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v37 = HDSQLiteColumnWithNameAsString();
      [v10 setSeymourCatalogWorkoutIdentifier:v37];
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v38 = HDSQLiteColumnWithNameAsString();
      [v10 setSeymourMediaType:v38];
    }
  }

  return v12;
}

@end