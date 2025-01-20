@interface HKDataMetadataWorkoutActivitySection
- (HKDataMetadataWorkoutActivitySection)initWithSample:(id)a3 displayTypeController:(id)a4 unitController:(id)a5 healthStore:(id)a6;
- (HKDisplayTypeController)displayTypeController;
- (HKHealthStore)healthstore;
- (HKUnitPreferenceController)unitPreferenceController;
- (HKWorkout)workout;
- (HKWorkoutDurationNumberFormatter)durationFormatter;
- (NSDateComponentsFormatter)dateFormatter;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (id)sectionTitle;
- (unint64_t)numberOfRowsInSection;
- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5;
- (void)setDateFormatter:(id)a3;
- (void)setDisplayTypeController:(id)a3;
- (void)setDurationFormatter:(id)a3;
- (void)setHealthstore:(id)a3;
- (void)setUnitPreferenceController:(id)a3;
- (void)setWorkout:(id)a3;
@end

@implementation HKDataMetadataWorkoutActivitySection

- (HKDataMetadataWorkoutActivitySection)initWithSample:(id)a3 displayTypeController:(id)a4 unitController:(id)a5 healthStore:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v35.receiver = self;
  v35.super_class = (Class)HKDataMetadataWorkoutActivitySection;
  v15 = [(HKDataMetadataWorkoutActivitySection *)&v35 init];
  if (!v15) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_workout = (id *)&v15->_workout;
    objc_storeStrong((id *)&v15->_workout, a3);
    uint64_t v17 = [(HKWorkout *)v15->_workout workoutActivities];
    if (v17)
    {
      v18 = (void *)v17;
      id v33 = v12;
      id v34 = v13;
      v19 = [*p_workout workoutActivities];
      uint64_t v20 = [v19 count];

      if (!v20)
      {
        v25 = 0;
        id v12 = v33;
        goto LABEL_10;
      }
      v21 = [*p_workout workoutActivities];
      if ([v21 count] == 1)
      {
        v32 = [*p_workout workoutActivities];
        v22 = [v32 firstObject];
        v23 = [v22 UUID];
        v24 = [*p_workout UUID];
        char v31 = [v23 isEqual:v24];

        id v12 = v33;
        if (v31)
        {
          v25 = 0;
LABEL_10:
          id v13 = v34;
          goto LABEL_14;
        }
      }
      else
      {

        id v12 = v33;
      }
      objc_storeStrong((id *)&v15->_displayTypeController, a4);
      objc_storeStrong((id *)&v15->_unitPreferenceController, a5);
      objc_storeStrong((id *)&v15->_healthstore, a6);
      v26 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28C00]);
      dateFormatter = v15->_dateFormatter;
      v15->_dateFormatter = v26;

      [(NSDateComponentsFormatter *)v15->_dateFormatter setZeroFormattingBehavior:0x10000];
      [(NSDateComponentsFormatter *)v15->_dateFormatter setAllowedUnits:224];
      v28 = objc_alloc_init(HKWorkoutDurationNumberFormatter);
      durationFormatter = v15->_durationFormatter;
      v15->_durationFormatter = v28;

      [(HKTimePeriodWithSecondsNumberFormatter *)v15->_durationFormatter setAllowMillisecondPrecision:1];
      id v13 = v34;
LABEL_13:
      v25 = v15;
      goto LABEL_14;
    }
  }
  v25 = 0;
LABEL_14:

  return v25;
}

- (id)sectionTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"WORKOUT_ACTIVITIES_NUMBERLESS_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (unint64_t)numberOfRowsInSection
{
  v2 = [(HKWorkout *)self->_workout workoutActivities];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  v6 = [a4 dequeueReusableCellWithIdentifier:@"activitiesCell"];
  if (!v6)
  {
    v6 = [[HKDataMetadataSimpleTableViewCell alloc] initWithReuseIdentifier:@"activitiesCell"];
    [(HKDataMetadataSimpleTableViewCell *)v6 setAccessoryType:1];
  }
  v7 = [(HKWorkout *)self->_workout workoutActivities];
  v8 = [v7 objectAtIndexedSubscript:a3];

  v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v10 = (void *)MEMORY[0x1E4F2B718];
  id v11 = [v8 workoutConfiguration];
  id v12 = objc_msgSend(v10, "_stringFromWorkoutActivityType:", objc_msgSend(v11, "activityType"));
  id v13 = [v9 localizedStringForKey:v12 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  id v14 = [(HKDataMetadataSimpleTableViewCell *)v6 titleTextLabel];
  [v14 setText:v13];

  return v6;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  workout = self->_workout;
  id v8 = a4;
  v9 = [(HKWorkout *)workout workoutActivities];
  id v16 = [v9 objectAtIndexedSubscript:a3];

  v10 = [HKWorkoutActivityViewController alloc];
  id v11 = self->_workout;
  displayTypeController = self->_displayTypeController;
  unitPreferenceController = self->_unitPreferenceController;
  id v14 = [(HKDataMetadataWorkoutActivitySection *)self healthstore];
  v15 = [(HKWorkoutActivityViewController *)v10 initWithWorkout:v11 activity:v16 displayTypeController:displayTypeController unitController:unitPreferenceController healthStore:v14];
  [v8 pushViewController:v15 animated:1];
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (void)setWorkout:(id)a3
{
}

- (NSDateComponentsFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (HKWorkoutDurationNumberFormatter)durationFormatter
{
  return self->_durationFormatter;
}

- (void)setDurationFormatter:(id)a3
{
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (void)setDisplayTypeController:(id)a3
{
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (void)setUnitPreferenceController:(id)a3
{
}

- (HKHealthStore)healthstore
{
  return self->_healthstore;
}

- (void)setHealthstore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthstore, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_workout, 0);
}

@end