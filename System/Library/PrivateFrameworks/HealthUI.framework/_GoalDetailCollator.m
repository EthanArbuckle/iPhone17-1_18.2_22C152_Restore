@interface _GoalDetailCollator
- (_GoalDetailCollator)init;
- (id)activitySummaryDetailStringWithActivitySummary:(id)a3 unitPreferenceController:(id)a4 activityValue:(int64_t)a5 displayTypeController:(id)a6;
- (id)detailStringWithTimeScope:(int64_t)a3;
- (void)processCoordinateUserInfo:(id)a3;
@end

@implementation _GoalDetailCollator

- (_GoalDetailCollator)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GoalDetailCollator;
  result = [(_GoalDetailCollator *)&v3 init];
  if (result)
  {
    result->_entryCount = 0;
    result->_entriesExceedingGoal = 0;
    result->_totalPercentFromGoal = 0.0;
  }
  return result;
}

- (void)processCoordinateUserInfo:(id)a3
{
  id v27 = a3;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v27;
  if (isKindOfClass)
  {
    id v6 = v27;
    v7 = [v6 activitySummaryData];
    if (([v6 activityPaused] & 1) == 0)
    {
      switch([v6 activityValue])
      {
        case 0:
          v8 = [v7 activeEnergyBurned];
          v9 = [v8 _unit];

          v10 = [v7 activeEnergyBurned];
          [v10 doubleValueForUnit:v9];
          double v12 = v11;

          v13 = [v7 activeEnergyBurnedGoal];
          goto LABEL_9;
        case 1:
          v14 = [v7 appleMoveTime];
          v9 = [v14 _unit];

          v15 = [v7 appleMoveTime];
          [v15 doubleValueForUnit:v9];
          double v12 = v16;

          v13 = [v7 appleMoveTimeGoal];
          goto LABEL_9;
        case 2:
          v17 = [v7 appleExerciseTime];
          v9 = [v17 _unit];

          v18 = [v7 appleExerciseTime];
          [v18 doubleValueForUnit:v9];
          double v12 = v19;

          v13 = [v7 exerciseTimeGoal];
          goto LABEL_9;
        case 3:
          v20 = [v7 appleStandHours];
          v9 = [v20 _unit];

          v21 = [v7 appleStandHours];
          [v21 doubleValueForUnit:v9];
          double v12 = v22;

          v13 = [v7 standHoursGoal];
LABEL_9:
          v23 = v13;
          [v13 doubleValueForUnit:v9];
          double v25 = v24;

          if (v9)
          {
            ++self->_entryCount;
            if (v25 > 0.0)
            {
              double v26 = v12 / v25 + -1.0;
              if (v26 >= 0.0) {
                ++self->_entriesExceedingGoal;
              }
              self->_totalPercentFromGoal = v26 + self->_totalPercentFromGoal;
            }
          }
          break;
        default:
          v9 = 0;
          break;
      }
    }
    id v5 = v27;
  }
  MEMORY[0x1F41817F8](isKindOfClass, v5);
}

- (id)activitySummaryDetailStringWithActivitySummary:(id)a3 unitPreferenceController:(id)a4 activityValue:(int64_t)a5 displayTypeController:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  switch(a5)
  {
    case 0:
      double v12 = _DisplayTypeForActivityValue(0, v11);
      v13 = [v10 unitForDisplayType:v12];

      v14 = [v9 activeEnergyBurned];
      double v15 = (double)(int)_HKWorkoutFlooredValueForQuantity();

      double v16 = [v9 activeEnergyBurnedGoal];
      double v17 = (double)(int)_HKWorkoutFlooredValueForQuantity();
      goto LABEL_6;
    case 1:
      v18 = [v9 appleMoveTime];
      v13 = [v18 _unit];

      double v19 = [v9 appleMoveTime];
      [v19 doubleValueForUnit:v13];
      double v15 = v20;

      v21 = [v9 appleMoveTimeGoal];
      goto LABEL_5;
    case 2:
      double v22 = [v9 appleExerciseTime];
      v13 = [v22 _unit];

      v23 = [v9 appleExerciseTime];
      [v23 doubleValueForUnit:v13];
      double v15 = v24;

      v21 = [v9 exerciseTimeGoal];
LABEL_5:
      double v16 = v21;
      [v21 doubleValueForUnit:v13];
      double v17 = v25;
LABEL_6:

      if (!v13) {
        goto LABEL_13;
      }
      double v26 = [NSNumber numberWithDouble:v15];
      id v27 = [v10 localizedDisplayNameForUnit:v13 value:v26];

      id v47 = v11;
      if (a5) {
        goto LABEL_11;
      }
      uint64_t v28 = HKActiveEnergyIntegerNumberFormatter();
      goto LABEL_12;
    case 3:
      v29 = [v9 appleStandHours];
      v13 = [v29 _unit];

      v30 = [v9 appleStandHours];
      [v30 doubleValueForUnit:v13];
      double v15 = v31;

      v32 = [v9 standHoursGoal];
      [v32 doubleValueForUnit:v13];
      double v17 = v33;

      if (!v13) {
        goto LABEL_13;
      }
      id v47 = v11;
      v34 = NSString;
      v35 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v36 = [v35 localizedStringForKey:@"HOURS_MEDIUM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      id v27 = [v34 localizedStringWithFormat:v36];

LABEL_11:
      uint64_t v28 = HKIntegerFormatter();
LABEL_12:
      v37 = (void *)v28;
      v38 = [NSNumber numberWithDouble:v15];
      v39 = [v37 stringFromNumber:v38];

      v40 = [NSNumber numberWithDouble:v17];
      v41 = [v37 stringFromNumber:v40];

      v42 = NSString;
      v43 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v44 = [v43 localizedStringForKey:@"ACTIVITY_GOAL_IN_LEGEND %@ %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      objc_msgSend(v42, "stringWithFormat:", v44, v39, v41, v27);
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

      id v11 = v47;
      break;
    default:
LABEL_13:
      v45 = &stru_1F3B9CF20;
      break;
  }

  return v45;
}

- (id)detailStringWithTimeScope:(int64_t)a3
{
  if (self->_entryCount < 1) {
    goto LABEL_5;
  }
  if ((unint64_t)a3 > 8)
  {
    objc_super v3 = 0;
  }
  else
  {
    if (((1 << a3) & 0xF) != 0 || ((1 << a3) & 0x1C0) != 0)
    {
LABEL_5:
      objc_super v3 = &stru_1F3B9CF20;
      goto LABEL_6;
    }
    id v6 = NSString;
    v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v8 = [v7 localizedStringForKey:@"DAYS_EXCEEDING_GOAL %ld %ld" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    objc_msgSend(v6, "localizedStringWithFormat:", v8, self->_entriesExceedingGoal, self->_entryCount);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  return v3;
}

@end