@interface HDActivityGoalScheduleEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
@end

@implementation HDActivityGoalScheduleEntity

+ (id)databaseTable
{
  return @"activity_goal_schedule_samples";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 10;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_1;
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

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  v27[10] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a5;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDActivityGoalScheduleEntity.m", 65, @"Subclasses must override %s", "+[HDActivityGoalScheduleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v27[0] = @"data_id";
  v27[1] = @"goal_type";
  v27[2] = @"unit_string";
  v27[3] = @"monday_goal";
  v27[4] = @"tuesday_goal";
  v27[5] = @"wednesday_goal";
  v27[6] = @"thursday_goal";
  v27[7] = @"friday_goal";
  v27[8] = @"saturday_goal";
  v27[9] = @"sunday_goal";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:10];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __94__HDActivityGoalScheduleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
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

void __94__HDActivityGoalScheduleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"data_id", [*(id *)(a1 + 32) longLongValue]);
  MEMORY[0x1C1879E80](a2, @"goal_type", [*(id *)(a1 + 40) goalType]);
  v4 = [*(id *)(a1 + 40) mondayGoal];
  id v13 = [v4 _unit];

  v5 = [v13 unitString];
  MEMORY[0x1C1879EC0](a2, @"unit_string", v5);

  v6 = [*(id *)(a1 + 40) mondayGoal];
  [v6 doubleValueForUnit:v13];
  MEMORY[0x1C1879E50](a2, @"monday_goal");

  v7 = [*(id *)(a1 + 40) tuesdayGoal];
  [v7 doubleValueForUnit:v13];
  MEMORY[0x1C1879E50](a2, @"tuesday_goal");

  v8 = [*(id *)(a1 + 40) wednesdayGoal];
  [v8 doubleValueForUnit:v13];
  MEMORY[0x1C1879E50](a2, @"wednesday_goal");

  v9 = [*(id *)(a1 + 40) thursdayGoal];
  [v9 doubleValueForUnit:v13];
  MEMORY[0x1C1879E50](a2, @"thursday_goal");

  v10 = [*(id *)(a1 + 40) fridayGoal];
  [v10 doubleValueForUnit:v13];
  MEMORY[0x1C1879E50](a2, @"friday_goal");

  v11 = [*(id *)(a1 + 40) saturdayGoal];
  [v11 doubleValueForUnit:v13];
  MEMORY[0x1C1879E50](a2, @"saturday_goal");

  id v12 = [*(id *)(a1 + 40) sundayGoal];
  [v12 doubleValueForUnit:v13];
  MEMORY[0x1C1879E50](a2, @"sunday_goal");
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 activityGoalSchedules];
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addActivityGoalSchedules:a3];
  }
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[_HDActivityGoalScheduleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

@end