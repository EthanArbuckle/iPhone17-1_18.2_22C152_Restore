@interface HKDataMetadataWorkoutEventSection
- (HKDataMetadataWorkoutEventSection)initWithSample:(id)a3;
- (HKWorkout)workout;
- (HKWorkoutDurationNumberFormatter)durationFormatter;
- (NSDateComponentsFormatter)dateFormatter;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (id)sectionTitle;
- (unint64_t)numberOfRowsInSection;
- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5;
- (void)setDateFormatter:(id)a3;
- (void)setDurationFormatter:(id)a3;
- (void)setWorkout:(id)a3;
@end

@implementation HKDataMetadataWorkoutEventSection

- (HKDataMetadataWorkoutEventSection)initWithSample:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKDataMetadataWorkoutEventSection;
  v6 = [(HKDataMetadataWorkoutEventSection *)&v15 init];
  if (!v6) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_workout, a3);
  v7 = [(HKWorkout *)v6->_workout workoutEvents];
  if (v7)
  {
    v8 = [(HKWorkout *)v6->_workout workoutEvents];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v10 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28C00]);
      dateFormatter = v6->_dateFormatter;
      v6->_dateFormatter = v10;

      [(NSDateComponentsFormatter *)v6->_dateFormatter setZeroFormattingBehavior:0x10000];
      [(NSDateComponentsFormatter *)v6->_dateFormatter setAllowedUnits:224];
      v12 = objc_alloc_init(HKWorkoutDurationNumberFormatter);
      durationFormatter = v6->_durationFormatter;
      v6->_durationFormatter = v12;

      [(HKTimePeriodWithSecondsNumberFormatter *)v6->_durationFormatter setAllowMillisecondPrecision:1];
LABEL_6:
      v7 = v6;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (id)sectionTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"WORKOUT_EVENTS_NUMBERLESS_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (unint64_t)numberOfRowsInSection
{
  v2 = [(HKWorkout *)self->_workout workoutEvents];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  v6 = [a4 dequeueReusableCellWithIdentifier:@"eventCell"];
  if (!v6)
  {
    v6 = [[HKDataMetadataSimpleTableViewCell alloc] initWithReuseIdentifier:@"eventCell"];
    [(HKDataMetadataSimpleTableViewCell *)v6 setAccessoryType:1];
  }
  v7 = [(HKWorkout *)self->_workout workoutEvents];
  v8 = [v7 objectAtIndexedSubscript:a3];

  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  [v8 type];
  v10 = _HKWorkoutEventTypeName();
  v11 = [v9 localizedStringForKey:v10 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  v12 = [v8 dateInterval];
  [v12 duration];
  double v14 = v13;

  if (v14 > 0.0)
  {
    durationFormatter = self->_durationFormatter;
    v16 = NSNumber;
    v17 = [v8 dateInterval];
    [v17 duration];
    v18 = objc_msgSend(v16, "numberWithDouble:");
    v19 = [(HKTimePeriodWithSecondsNumberFormatter *)durationFormatter stringFromNumber:v18 displayType:0 unitController:0];

    uint64_t v20 = [NSString stringWithFormat:@"%@ (%@)", v11, v19];

    v11 = (void *)v20;
  }
  v21 = [v8 dateInterval];
  v22 = [v21 startDate];
  v23 = [(HKWorkout *)self->_workout startDate];
  [v22 timeIntervalSinceDate:v23];
  double v25 = v24;

  v26 = [(HKDataMetadataSimpleTableViewCell *)v6 titleTextLabel];
  [v26 setText:v11];

  v27 = [(HKDataMetadataSimpleTableViewCell *)v6 subtitleTextLabel];
  v28 = [(NSDateComponentsFormatter *)self->_dateFormatter stringFromTimeInterval:v25];
  [v27 setText:v28];

  return v6;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  workout = self->_workout;
  id v7 = a4;
  v8 = [(HKWorkout *)workout workoutEvents];
  id v10 = [v8 objectAtIndexedSubscript:a3];

  uint64_t v9 = [[HKWorkoutEventDetailViewController alloc] initWithEvent:v10];
  [v7 pushViewController:v9 animated:1];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_workout, 0);
}

@end