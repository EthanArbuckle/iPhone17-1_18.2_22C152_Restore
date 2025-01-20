@interface HKActivityGoalSchedule(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport;
- (HDCodableActivityGoalSchedule)codableRepresentationForSync;
@end

@implementation HKActivityGoalSchedule(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = (void *)[[a1 alloc] _init];
    if ([v5 applyToObject:v6])
    {
      uint64_t v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      v9 = objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
      if (v9) {
        v10 = 0;
      }
      else {
        v10 = v6;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (HDCodableActivityGoalSchedule)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableActivityGoalSchedule);
  v15.receiver = a1;
  v15.super_class = (Class)&off_1F187AF98;
  v3 = objc_msgSendSuper2(&v15, sel_codableRepresentationForSync);
  [(HDCodableActivityGoalSchedule *)v2 setSample:v3];
  -[HDCodableActivityGoalSchedule setGoalType:](v2, "setGoalType:", [a1 goalType]);
  id v4 = [a1 mondayGoal];
  id v5 = [v4 _unit];

  v6 = [v5 unitString];
  [(HDCodableActivityGoalSchedule *)v2 setUnitString:v6];

  uint64_t v7 = [a1 mondayGoal];
  [v7 doubleValueForUnit:v5];
  -[HDCodableActivityGoalSchedule setMondayGoal:](v2, "setMondayGoal:");

  uint64_t v8 = [a1 tuesdayGoal];
  [v8 doubleValueForUnit:v5];
  -[HDCodableActivityGoalSchedule setTuesdayGoal:](v2, "setTuesdayGoal:");

  v9 = [a1 wednesdayGoal];
  [v9 doubleValueForUnit:v5];
  -[HDCodableActivityGoalSchedule setWednesdayGoal:](v2, "setWednesdayGoal:");

  v10 = [a1 thursdayGoal];
  [v10 doubleValueForUnit:v5];
  -[HDCodableActivityGoalSchedule setThursdayGoal:](v2, "setThursdayGoal:");

  id v11 = [a1 fridayGoal];
  [v11 doubleValueForUnit:v5];
  -[HDCodableActivityGoalSchedule setFridayGoal:](v2, "setFridayGoal:");

  v12 = [a1 saturdayGoal];
  [v12 doubleValueForUnit:v5];
  -[HDCodableActivityGoalSchedule setSaturdayGoal:](v2, "setSaturdayGoal:");

  v13 = [a1 sundayGoal];
  [v13 doubleValueForUnit:v5];
  -[HDCodableActivityGoalSchedule setSundayGoal:](v2, "setSundayGoal:");

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4 = a3;
  id v5 = [a1 codableRepresentationForSync];
  if (v5) {
    [v4 addActivityGoalSchedules:v5];
  }

  return v5 != 0;
}

@end