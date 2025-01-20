@interface FIUIWorkoutStatistics
+ (id)_monthFormatter;
- (FIUIWorkoutStatistics)init;
- (FIUIWorkoutStatistics)initWithWorkouts:(id)a3;
- (HKQuantity)averageActiveEnergyBurn;
- (HKQuantity)averageDistance;
- (HKQuantity)totalActiveEnergyBurn;
- (HKQuantity)totalDistance;
- (HKWorkout)mostRecentWorkout;
- (NSDate)startOfMonth;
- (double)averageWorkoutDuration;
- (double)totalWorkoutDuration;
- (id)_formattedDuration:(double)a3 formattingManager:(id)a4;
- (id)_formattedEnergyBurn:(id)a3 formattingManager:(id)a4;
- (id)formattedActiveEnergyBurnWithFormattingManager:(id)a3;
- (id)formattedAverageActiveEnergyBurnWithFormattingManager:(id)a3;
- (id)formattedAverageWorkoutDurationWithFormattingManager:(id)a3;
- (id)formattedDistanceWithFormattingManager:(id)a3 distanceType:(unint64_t)a4 amountType:(unint64_t)a5;
- (id)formattedMonth;
- (id)formattedPaceWithFormattingManager:(id)a3 distanceType:(unint64_t)a4;
- (id)formattedTotalActiveEnergyBurnWithFormattingManager:(id)a3;
- (id)formattedTotalWorkoutDurationWithFormattingManager:(id)a3;
- (id)formattedWorkoutDurationWithFormattingManager:(id)a3;
- (id)simpleWorkoutCount;
- (unint64_t)workoutCount;
- (unint64_t)workoutsWithDistance;
- (unint64_t)workoutsWithEnergyBurned;
- (void)_calculateAverages;
- (void)_calculateStats;
@end

@implementation FIUIWorkoutStatistics

- (FIUIWorkoutStatistics)initWithWorkouts:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FIUIWorkoutStatistics;
  v5 = [(FIUIWorkoutStatistics *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    workouts = v5->_workouts;
    v5->_workouts = (NSArray *)v6;

    v5->_workoutsWithEnergyBurned = 0;
    v5->_workoutsWithDistance = 0;
    v8 = (void *)MEMORY[0x263F0A630];
    v9 = [MEMORY[0x263F0A830] meterUnit];
    uint64_t v10 = [v8 quantityWithUnit:v9 doubleValue:0.0];
    totalDistance = v5->_totalDistance;
    v5->_totalDistance = (HKQuantity *)v10;

    v12 = (void *)MEMORY[0x263F0A630];
    v13 = [MEMORY[0x263F0A830] meterUnit];
    uint64_t v14 = [v12 quantityWithUnit:v13 doubleValue:0.0];
    averageDistance = v5->_averageDistance;
    v5->_averageDistance = (HKQuantity *)v14;

    v16 = (void *)MEMORY[0x263F0A630];
    v17 = [MEMORY[0x263F0A830] kilocalorieUnit];
    uint64_t v18 = [v16 quantityWithUnit:v17 doubleValue:0.0];
    totalActiveEnergyBurn = v5->_totalActiveEnergyBurn;
    v5->_totalActiveEnergyBurn = (HKQuantity *)v18;

    v20 = (void *)MEMORY[0x263F0A630];
    v21 = [MEMORY[0x263F0A830] kilocalorieUnit];
    uint64_t v22 = [v20 quantityWithUnit:v21 doubleValue:0.0];
    averageActiveEnergyBurn = v5->_averageActiveEnergyBurn;
    v5->_averageActiveEnergyBurn = (HKQuantity *)v22;

    v5->_totalWorkoutDuration = 0.0;
    v5->_averageWorkoutDuration = 0.0;
    [(FIUIWorkoutStatistics *)v5 _calculateStats];
  }

  return v5;
}

- (FIUIWorkoutStatistics)init
{
  return 0;
}

- (unint64_t)workoutCount
{
  return [(NSArray *)self->_workouts count];
}

- (HKWorkout)mostRecentWorkout
{
  return (HKWorkout *)[(NSArray *)self->_workouts firstObject];
}

- (void)_calculateStats
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v3 = self->_workouts;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    uint64_t v31 = *MEMORY[0x263F09BC0];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v32 + 1) + 8 * v7);
        v9 = [(NSArray *)self->_workouts firstObject];

        if (v8 == v9)
        {
          uint64_t v10 = _CachedCurrentCalendar();
          v11 = [v8 startDate];
          v12 = [v10 components:14 fromDate:v11];

          v13 = _CachedCurrentCalendar();
          uint64_t v14 = [v13 dateFromComponents:v12];
          startOfMonth = self->_startOfMonth;
          self->_startOfMonth = v14;
        }
        [v8 duration];
        self->_totalWorkoutDuration = v16 + self->_totalWorkoutDuration;
        if ([v8 _activityMoveMode] != 2)
        {
          ++self->_workoutsWithEnergyBurned;
          v17 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v31];
          uint64_t v18 = [v8 statisticsForType:v17];
          totalActiveEnergyBurn = self->_totalActiveEnergyBurn;
          v20 = [v18 sumQuantity];
          v21 = [(HKQuantity *)totalActiveEnergyBurn _quantityByAddingQuantity:v20];
          uint64_t v22 = self->_totalActiveEnergyBurn;
          self->_totalActiveEnergyBurn = v21;
        }
        v23 = objc_msgSend(v8, "fiui_activityType");
        uint64_t v24 = FIUIDistanceTypeForActivityType(v23);
        if (v24)
        {
          ++self->_workoutsWithDistance;
          objc_super v25 = +[FIUIUnitManager quantityTypeForDistanceType:v24];
          v26 = [v8 statisticsForType:v25];
          totalDistance = self->_totalDistance;
          v28 = [v26 sumQuantity];
          v29 = [(HKQuantity *)totalDistance _quantityByAddingQuantity:v28];
          v30 = self->_totalDistance;
          self->_totalDistance = v29;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v5);
  }

  [(FIUIWorkoutStatistics *)self _calculateAverages];
}

- (void)_calculateAverages
{
  if ([(NSArray *)self->_workouts count])
  {
    self->_averageWorkoutDuration = self->_totalWorkoutDuration / (double)[(NSArray *)self->_workouts count];
    totalActiveEnergyBurn = self->_totalActiveEnergyBurn;
    if (_InternalEnergyUnit_onceToken != -1) {
      dispatch_once(&_InternalEnergyUnit_onceToken, &__block_literal_global_381);
    }
    [(HKQuantity *)totalActiveEnergyBurn doubleValueForUnit:_InternalEnergyUnit___unit];
    if (v4 > 2.22044605e-16)
    {
      unint64_t workoutsWithEnergyBurned = self->_workoutsWithEnergyBurned;
      if (workoutsWithEnergyBurned)
      {
        double v6 = v4 / (double)workoutsWithEnergyBurned;
        uint64_t v7 = (void *)MEMORY[0x263F0A630];
        if (_InternalEnergyUnit_onceToken != -1) {
          dispatch_once(&_InternalEnergyUnit_onceToken, &__block_literal_global_381);
        }
        id v8 = (id)_InternalEnergyUnit___unit;
        v9 = [v7 quantityWithUnit:v8 doubleValue:v6];
        averageActiveEnergyBurn = self->_averageActiveEnergyBurn;
        self->_averageActiveEnergyBurn = v9;
      }
    }
    totalDistance = self->_totalDistance;
    if (_InternalDistanceUnit_onceToken != -1) {
      dispatch_once(&_InternalDistanceUnit_onceToken, &__block_literal_global_383);
    }
    [(HKQuantity *)totalDistance doubleValueForUnit:_InternalDistanceUnit___unit];
    if (v12 > 2.22044605e-16)
    {
      unint64_t workoutsWithDistance = self->_workoutsWithDistance;
      if (workoutsWithDistance)
      {
        double v14 = v12 / (double)workoutsWithDistance;
        v15 = (void *)MEMORY[0x263F0A630];
        if (_InternalDistanceUnit_onceToken != -1) {
          dispatch_once(&_InternalDistanceUnit_onceToken, &__block_literal_global_383);
        }
        id v18 = (id)_InternalDistanceUnit___unit;
        double v16 = [v15 quantityWithUnit:v18 doubleValue:v14];
        averageDistance = self->_averageDistance;
        self->_averageDistance = v16;
      }
    }
  }
}

- (double)totalWorkoutDuration
{
  return self->_totalWorkoutDuration;
}

- (double)averageWorkoutDuration
{
  return self->_averageWorkoutDuration;
}

- (HKQuantity)totalActiveEnergyBurn
{
  return self->_totalActiveEnergyBurn;
}

- (HKQuantity)averageActiveEnergyBurn
{
  return self->_averageActiveEnergyBurn;
}

- (HKQuantity)totalDistance
{
  return self->_totalDistance;
}

- (HKQuantity)averageDistance
{
  return self->_averageDistance;
}

- (unint64_t)workoutsWithEnergyBurned
{
  return self->_workoutsWithEnergyBurned;
}

- (unint64_t)workoutsWithDistance
{
  return self->_workoutsWithDistance;
}

- (NSDate)startOfMonth
{
  return self->_startOfMonth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startOfMonth, 0);
  objc_storeStrong((id *)&self->_averageDistance, 0);
  objc_storeStrong((id *)&self->_totalDistance, 0);
  objc_storeStrong((id *)&self->_averageActiveEnergyBurn, 0);
  objc_storeStrong((id *)&self->_totalActiveEnergyBurn, 0);
  objc_storeStrong((id *)&self->_workouts, 0);
}

+ (id)_monthFormatter
{
  if (_monthFormatter_onceToken != -1) {
    dispatch_once(&_monthFormatter_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)_monthFormatter___formatter;
  return v2;
}

void __51__FIUIWorkoutStatistics_ViewModel___monthFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_monthFormatter___formatter;
  _monthFormatter___formatter = (uint64_t)v0;

  [(id)_monthFormatter___formatter setFormattingContext:2];
  v2 = (void *)MEMORY[0x263F08790];
  id v4 = [MEMORY[0x263EFF960] currentLocale];
  v3 = [v2 dateFormatFromTemplate:@"MMMM" options:0 locale:v4];
  [(id)_monthFormatter___formatter setDateFormat:v3];
}

- (id)formattedMonth
{
  v3 = [(id)objc_opt_class() _monthFormatter];
  id v4 = [v3 stringFromDate:self->_startOfMonth];

  return v4;
}

- (id)formattedWorkoutDurationWithFormattingManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FIUIWorkoutStatistics *)self formattedTotalWorkoutDurationWithFormattingManager:v4];
  double v6 = [(FIUIWorkoutStatistics *)self formattedAverageWorkoutDurationWithFormattingManager:v4];

  uint64_t v7 = NSString;
  id v8 = FIUIBundle();
  v9 = [v8 localizedStringForKey:@"WORKOUT_STATISTICS_FORMAT_%@_%@" value:&stru_26CF5F1B8 table:@"Localizable"];
  uint64_t v10 = objc_msgSend(v7, "stringWithFormat:", v9, v5, v6);

  return v10;
}

- (id)formattedActiveEnergyBurnWithFormattingManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FIUIWorkoutStatistics *)self formattedTotalActiveEnergyBurnWithFormattingManager:v4];
  double v6 = [(FIUIWorkoutStatistics *)self formattedAverageActiveEnergyBurnWithFormattingManager:v4];

  uint64_t v7 = NSString;
  id v8 = FIUIBundle();
  v9 = [v8 localizedStringForKey:@"WORKOUT_STATISTICS_FORMAT_%@_%@" value:&stru_26CF5F1B8 table:@"Localizable"];
  uint64_t v10 = objc_msgSend(v7, "stringWithFormat:", v9, v5, v6);

  return v10;
}

- (id)formattedPaceWithFormattingManager:(id)a3 distanceType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 localizedPaceAndUnitWithDistance:self->_totalDistance overDuration:FIUIPaceFormatForDistanceType() paceFormat:a4 distanceType:1 unitStyle:2 decimalTrimmingMode:self->_totalWorkoutDuration];

  id v8 = [v7 localizedUppercaseString];

  return v8;
}

- (id)formattedTotalWorkoutDurationWithFormattingManager:(id)a3
{
  return [(FIUIWorkoutStatistics *)self _formattedDuration:a3 formattingManager:self->_totalWorkoutDuration];
}

- (id)formattedAverageWorkoutDurationWithFormattingManager:(id)a3
{
  return [(FIUIWorkoutStatistics *)self _formattedDuration:a3 formattingManager:self->_averageWorkoutDuration];
}

- (id)_formattedDuration:(double)a3 formattingManager:(id)a4
{
  return (id)[a4 stringWithDuration:2 durationFormat:a3];
}

- (id)formattedTotalActiveEnergyBurnWithFormattingManager:(id)a3
{
  return [(FIUIWorkoutStatistics *)self _formattedEnergyBurn:self->_totalActiveEnergyBurn formattingManager:a3];
}

- (id)formattedAverageActiveEnergyBurnWithFormattingManager:(id)a3
{
  return [(FIUIWorkoutStatistics *)self _formattedEnergyBurn:self->_averageActiveEnergyBurn formattingManager:a3];
}

- (id)_formattedEnergyBurn:(id)a3 formattingManager:(id)a4
{
  id v5 = a4;
  id v6 = [v5 localizedStringWithActiveEnergy:a3 unitStyle:0];
  uint64_t v7 = NSString;
  id v8 = FIUIBundle();
  v9 = [v8 localizedStringForKey:@"WORKOUT_STATISTICS_UNIT_FORMAT" value:&stru_26CF5F1B8 table:@"Localizable"];
  uint64_t v10 = [v5 localizedShortActiveEnergyUnitString];

  v11 = objc_msgSend(v7, "stringWithFormat:", v9, v6, v10);

  double v12 = [v11 localizedUppercaseString];

  return v12;
}

- (id)formattedDistanceWithFormattingManager:(id)a3 distanceType:(unint64_t)a4 amountType:(unint64_t)a5
{
  if (!a5)
  {
    uint64_t v7 = 48;
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    uint64_t v7 = 56;
LABEL_5:
    id v8 = *(id *)((char *)&self->super.isa + v7);
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  v9 = (void *)MEMORY[0x263F0A830];
  id v10 = a3;
  v11 = [v9 meterUnit];
  [v8 doubleValueForUnit:v11];
  double v12 = objc_msgSend(v10, "localizedStringWithDistanceInMeters:distanceType:unitStyle:", a4, 1);

  v13 = [MEMORY[0x263F0A830] meterUnit];
  [v8 doubleValueForUnit:v13];
  double v14 = objc_msgSend(v10, "localizedStringWithDistanceInMeters:distanceType:unitStyle:", a4, 0);

  v15 = [v12 stringByReplacingOccurrencesOfString:v14 withString:&stru_26CF5F1B8];
  double v16 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v17 = [v15 stringByTrimmingCharactersInSet:v16];

  id v18 = NSString;
  v19 = FIUIBundle();
  v20 = [v19 localizedStringForKey:@"WORKOUT_STATISTICS_UNIT_FORMAT" value:&stru_26CF5F1B8 table:@"Localizable"];
  v21 = objc_msgSend(v18, "stringWithFormat:", v20, v14, v17);

  uint64_t v22 = [v21 localizedUppercaseString];

  return v22;
}

- (id)simpleWorkoutCount
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FIUIWorkoutStatistics workoutCount](self, "workoutCount"));
  v3 = +[FIUIFormattingManager stringWithNumber:v2 decimalPrecision:1];

  return v3;
}

@end