@interface WDWorkoutListDataProvider
- (id)sampleTypes;
- (id)textForObject:(id)a3;
- (id)timePeriodFormatter;
- (id)titleForSection:(unint64_t)a3;
@end

@implementation WDWorkoutListDataProvider

- (id)sampleTypes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F0A598] workoutType];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)titleForSection:(unint64_t)a3
{
  v3 = [(WDSampleListDataProvider *)self samples];
  if ([v3 count] < 1)
  {
    v5 = &stru_26D2EA890;
  }
  else
  {
    v4 = WDBundle();
    v5 = [v4 localizedStringForKey:@"WORKOUTS" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  }

  return v5;
}

- (id)textForObject:(id)a3
{
  v4 = NSNumber;
  [a3 duration];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v6 = [(WDWorkoutListDataProvider *)self timePeriodFormatter];
  v7 = [v6 stringFromNumber:v5 displayType:0 unitController:0];

  return v7;
}

- (id)timePeriodFormatter
{
  v2 = (void *)timePeriodFormatter___formatter;
  if (!timePeriodFormatter___formatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F46A68]);
    v4 = (void *)timePeriodFormatter___formatter;
    timePeriodFormatter___formatter = (uint64_t)v3;

    v2 = (void *)timePeriodFormatter___formatter;
  }

  return v2;
}

@end