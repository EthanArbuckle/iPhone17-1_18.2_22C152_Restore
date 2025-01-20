@interface HDSleepScheduleEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)indices;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)mostRecentSleepScheduleForWeekday:(unint64_t)a3 beforeDate:(id)a4 profile:(id)a5 encodingOptions:(id)a6 error:(id *)a7;
@end

@implementation HDSleepScheduleEntity

+ (id)databaseTable
{
  return @"sleep_schedule_samples";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 13;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_98;
}

+ (id)indices
{
  v7[7] = *MEMORY[0x1E4F143B8];
  v7[0] = @"monday";
  v7[1] = @"tuesday";
  v7[2] = @"wednesday";
  v7[3] = @"thursday";
  v7[4] = @"friday";
  v7[5] = @"saturday";
  v7[6] = @"sunday";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__HDSleepScheduleEntity_indices__block_invoke;
  v6[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v6[4] = a1;
  v4 = objc_msgSend(v3, "hk_map:", v6);

  return v4;
}

id __32__HDSleepScheduleEntity_indices__block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F65D28];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = *(void *)(a1 + 32);
  v11[0] = v4;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [NSString stringWithFormat:@"%@ = 1", v4];
  v9 = (void *)[v5 initWithEntity:v6 name:v4 columns:v7 unique:0 predicateString:v8];

  return v9;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  v27[13] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a5;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDSleepScheduleEntity.m", 95, @"Subclasses must override %s", "+[HDSleepScheduleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v27[0] = @"data_id";
  v27[1] = @"monday";
  v27[2] = @"tuesday";
  v27[3] = @"wednesday";
  v27[4] = @"thursday";
  v27[5] = @"friday";
  v27[6] = @"saturday";
  v27[7] = @"sunday";
  v27[8] = @"wake_hour";
  v27[9] = @"wake_minute";
  v27[10] = @"bed_hour";
  v27[11] = @"bed_minute";
  v27[12] = @"override_day_index";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:13];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __87__HDSleepScheduleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v24[3] = &unk_1E62F3A88;
  id v25 = v12;
  id v26 = v13;
  id v17 = v13;
  id v18 = v12;
  v19 = [a1 insertOrReplaceEntity:1 database:v14 properties:v16 error:a7 bindingHandler:v24];

  if (v19) {
    v20 = v17;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  return v21;
}

void __87__HDSleepScheduleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = [*(id *)(a1 + 32) weekdays];
  MEMORY[0x1C1879E80](a2, @"data_id", [*(id *)(a1 + 40) longLongValue]);
  MEMORY[0x1C1879E20](a2, @"monday", v4 & 1);
  MEMORY[0x1C1879E20](a2, @"tuesday", (v4 >> 1) & 1);
  MEMORY[0x1C1879E20](a2, @"wednesday", (v4 >> 2) & 1);
  MEMORY[0x1C1879E20](a2, @"thursday", (v4 >> 3) & 1);
  MEMORY[0x1C1879E20](a2, @"friday", (v4 >> 4) & 1);
  MEMORY[0x1C1879E20](a2, @"saturday", (v4 >> 5) & 1);
  MEMORY[0x1C1879E20](a2, @"sunday", (v4 >> 6) & 1);
  id v5 = [*(id *)(a1 + 32) wakeTimeComponents];
  uint64_t v6 = objc_msgSend(v5, "hk_hourNumber");
  MEMORY[0x1C1879EA0](a2, @"wake_hour", v6);

  v7 = [*(id *)(a1 + 32) wakeTimeComponents];
  v8 = objc_msgSend(v7, "hk_minuteNumber");
  MEMORY[0x1C1879EA0](a2, @"wake_minute", v8);

  v9 = [*(id *)(a1 + 32) bedTimeComponents];
  v10 = objc_msgSend(v9, "hk_hourNumber");
  MEMORY[0x1C1879EA0](a2, @"bed_hour", v10);

  v11 = [*(id *)(a1 + 32) bedTimeComponents];
  id v12 = objc_msgSend(v11, "hk_minuteNumber");
  MEMORY[0x1C1879EA0](a2, @"bed_minute", v12);

  id v13 = [*(id *)(a1 + 32) overrideDayIndex];
  MEMORY[0x1C1879EA0](a2, @"override_day_index", v13);
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 sleepSchedules];
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addSleepSchedules:a3];
  }
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[_HDSleepScheduleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)mostRecentSleepScheduleForWeekday:(unint64_t)a3 beforeDate:(id)a4 profile:(id)a5 encodingOptions:(id)a6 error:(id *)a7
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a5;
  if ((HKSleepScheduleWeekdaysIsSingleDay() & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"HDSleepScheduleEntity.m", 212, @"Invalid parameter not satisfying: %@", @"HKSleepScheduleWeekdaysIsSingleDay(weekday)" object file lineNumber description];
  }
  if (v13) {
    HDSleepScheduleEntityPredicateForWeekdayBeforeDate(a3, v13);
  }
  else {
  v16 = HDSleepScheduleEntityPredicateForWeekday(a3);
  }
  id v17 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:198];
  id v18 = +[HDSampleEntity mostRecentSampleWithType:v17 profile:v15 encodingOptions:v14 predicate:v16 anchor:0 error:a7];

  return v18;
}

@end