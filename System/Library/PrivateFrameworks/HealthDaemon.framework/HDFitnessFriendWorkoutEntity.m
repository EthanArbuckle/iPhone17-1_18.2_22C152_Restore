@interface HDFitnessFriendWorkoutEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)enumerateWorkoutsWithPredicate:(id)a3 anchor:(id *)a4 profile:(id)a5 error:(id *)a6 handler:(id)a7;
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (int64_t)protectionClass;
@end

@implementation HDFitnessFriendWorkoutEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return @"fitness_friend_workouts";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 17;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_83;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[_HDFitnessFriendWorkoutEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  v27[17] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a5;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDFitnessFriendWorkoutEntity.m", 108, @"Subclasses must override %s", "+[HDFitnessFriendWorkoutEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v27[0] = @"data_id";
  v27[1] = @"friend_uuid";
  v27[2] = @"duration";
  v27[3] = @"total_energy_burned";
  v27[4] = @"total_basal_energy_burned";
  v27[5] = @"total_distance";
  v27[6] = @"activity_type";
  v27[7] = @"goal_type";
  v27[8] = @"goal";
  v27[9] = @"bundle_id";
  v27[10] = @"is_watch_workout";
  v27[11] = @"is_indoor_workout";
  v27[12] = @"device_manufacturer";
  v27[13] = @"device_model";
  v27[14] = @"activity_move_mode";
  v27[15] = @"seymour_catalog_workout_identifier";
  v27[16] = @"seymour_media_type";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:17];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __94__HDFitnessFriendWorkoutEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v24[3] = &unk_1E62F3A88;
  id v25 = v13;
  id v26 = v12;
  id v17 = v12;
  id v18 = v13;
  v19 = [a1 insertOrReplaceEntity:1 database:v14 properties:v16 error:a7 bindingHandler:v24];

  if (v19) {
    v20 = v18;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  return v21;
}

void __94__HDFitnessFriendWorkoutEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"data_id", [*(id *)(a1 + 32) longLongValue]);
  v4 = [*(id *)(a1 + 40) friendUUID];
  MEMORY[0x1C1879EF0](a2, @"friend_uuid", v4);

  [*(id *)(a1 + 40) duration];
  MEMORY[0x1C1879E50](a2, @"duration");
  MEMORY[0x1C1879E80](a2, @"activity_type", [*(id *)(a1 + 40) workoutActivityType]);
  MEMORY[0x1C1879E80](a2, @"goal_type", [*(id *)(a1 + 40) goalType]);
  v5 = [*(id *)(a1 + 40) bundleID];
  MEMORY[0x1C1879EC0](a2, @"bundle_id", v5);

  MEMORY[0x1C1879E80](a2, @"is_watch_workout", [*(id *)(a1 + 40) isWatchWorkout]);
  MEMORY[0x1C1879E80](a2, @"is_indoor_workout", [*(id *)(a1 + 40) isIndoorWorkout]);
  MEMORY[0x1C1879E80](a2, @"activity_move_mode", [*(id *)(a1 + 40) amm]);
  v6 = [*(id *)(a1 + 40) totalEnergyBurned];

  if (v6)
  {
    v7 = [*(id *)(a1 + 40) totalEnergyBurned];
    v8 = _HKWorkoutCanonicalEnergyBurnedUnit();
    [v7 doubleValueForUnit:v8];
    MEMORY[0x1C1879E50](a2, @"total_energy_burned");
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"total_energy_burned");
  }
  v9 = [*(id *)(a1 + 40) totalBasalEnergyBurned];

  if (v9)
  {
    v10 = [*(id *)(a1 + 40) totalBasalEnergyBurned];
    id v11 = _HKWorkoutCanonicalEnergyBurnedUnit();
    [v10 doubleValueForUnit:v11];
    MEMORY[0x1C1879E50](a2, @"total_basal_energy_burned");
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"total_basal_energy_burned");
  }
  id v12 = [*(id *)(a1 + 40) totalDistance];

  if (v12)
  {
    id v13 = [*(id *)(a1 + 40) totalDistance];
    id v14 = _HKWorkoutCanonicalDistanceUnit();
    [v13 doubleValueForUnit:v14];
    MEMORY[0x1C1879E50](a2, @"total_distance");
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"total_distance");
  }
  uint64_t v15 = [*(id *)(a1 + 40) goal];
  if (v15
    && (v16 = (void *)v15,
        [*(id *)(a1 + 40) goalType],
        int IsValidForGoal = _HKWorkoutGoalTypeIsValidForGoal(),
        v16,
        IsValidForGoal))
  {
    id v18 = [*(id *)(a1 + 40) goal];
    [*(id *)(a1 + 40) goalType];
    v19 = _HKWorkoutCanonicalUnitForGoalType();
    [v18 doubleValueForUnit:v19];
    MEMORY[0x1C1879E50](a2, @"goal");
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"goal");
  }
  v20 = [*(id *)(a1 + 40) deviceManufacturer];

  if (v20)
  {
    id v21 = [*(id *)(a1 + 40) deviceManufacturer];
    MEMORY[0x1C1879EC0](a2, @"device_manufacturer", v21);
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"device_manufacturer");
  }
  v22 = [*(id *)(a1 + 40) deviceModel];

  if (v22)
  {
    v23 = [*(id *)(a1 + 40) deviceModel];
    MEMORY[0x1C1879EC0](a2, @"device_model", v23);
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"device_model");
  }
  v24 = [*(id *)(a1 + 40) seymourCatalogWorkoutIdentifier];

  if (v24)
  {
    id v25 = [*(id *)(a1 + 40) seymourCatalogWorkoutIdentifier];
    MEMORY[0x1C1879EC0](a2, @"seymour_catalog_workout_identifier", v25);
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"seymour_catalog_workout_identifier");
  }
  id v26 = [*(id *)(a1 + 40) seymourMediaType];

  if (!v26)
  {
    JUMPOUT(0x1C1879E90);
  }
  id v27 = [*(id *)(a1 + 40) seymourMediaType];
  MEMORY[0x1C1879EC0](a2, @"seymour_media_type", v27);
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 fitnessFriendWorkouts];
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addFitnessFriendWorkouts:a3];
  }
  return a3 != 0;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (BOOL)enumerateWorkoutsWithPredicate:(id)a3 anchor:(id *)a4 profile:(id)a5 error:(id *)a6 handler:(id)a7
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v25 = a6;
  if (a4)
  {
    id v14 = *a4;
    uint64_t v15 = *MEMORY[0x1E4F65C70];
    if (v14)
    {
      v16 = [MEMORY[0x1E4F65D00] predicateWithProperty:*MEMORY[0x1E4F65C70] greaterThanValue:v14];
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    id v14 = 0;
    v16 = 0;
    uint64_t v15 = *MEMORY[0x1E4F65C70];
  }
  id v17 = [MEMORY[0x1E4F2B2C0] fitnessFriendWorkoutType];
  id v18 = +[HDSampleEntity entityEnumeratorWithType:v17 profile:v12];

  v19 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v11 otherPredicate:v16];
  [v18 setPredicate:v19];

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v32 = [v14 longLongValue];
  v20 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:v15 entityClass:objc_opt_class() ascending:1];
  v33[0] = v20;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  [v18 setOrderingTerms:v21];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __92__HDFitnessFriendWorkoutEntity_enumerateWorkoutsWithPredicate_anchor_profile_error_handler___block_invoke;
  v26[3] = &unk_1E6301DB0;
  v28 = &v29;
  id v22 = v13;
  id v27 = v22;
  char v23 = [v18 enumerateWithError:v25 handler:v26];
  if (a4)
  {
    *a4 = [NSNumber numberWithLongLong:v30[3]];
  }

  _Block_object_dispose(&v29, 8);
  return v23;
}

uint64_t __92__HDFitnessFriendWorkoutEntity_enumerateWorkoutsWithPredicate_anchor_profile_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  if (v4 <= a3) {
    uint64_t v4 = a3;
  }
  *(void *)(v3 + 24) = v4;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end