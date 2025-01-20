@interface FIUIWorkoutSegment
+ (id)_decimalNumberFormatter;
- (HKQuantity)activeEnergy;
- (HKQuantity)distance;
- (NSDate)endDate;
- (NSDate)startDate;
- (double)elapsedTime;
- (id)description;
- (id)formattedActiveEnergyValueForUnit:(id)a3;
- (id)formattedDistanceValueForUnit:(id)a3;
- (id)formattedDurationValueWithFormattingManager:(id)a3;
- (id)formattedPaceUsingFormatType:(int64_t)a3 formattingManager:(id)a4 distanceType:(unint64_t)a5;
- (void)setActiveEnergy:(id)a3;
- (void)setDistance:(id)a3;
- (void)setElapsedTime:(double)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation FIUIWorkoutSegment

- (id)formattedDurationValueWithFormattingManager:(id)a3
{
  id v4 = a3;
  [(FIUIWorkoutSegment *)self elapsedTime];
  v5 = objc_msgSend(v4, "stringWithDuration:durationFormat:", 3);

  return v5;
}

- (id)formattedActiveEnergyValueForUnit:(id)a3
{
  id v4 = a3;
  v5 = [(FIUIWorkoutSegment *)self activeEnergy];
  [v5 doubleValueForUnit:v4];
  double v7 = v6;

  v8 = [NSNumber numberWithDouble:v7];
  v9 = +[FIUIFormattingManager stringWithNumber:v8 decimalPrecision:1];

  return v9;
}

+ (id)_decimalNumberFormatter
{
  if (_decimalNumberFormatter_onceToken != -1) {
    dispatch_once(&_decimalNumberFormatter_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)_decimalNumberFormatter_formatter;
  return v2;
}

uint64_t __45__FIUIWorkoutSegment__decimalNumberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)_decimalNumberFormatter_formatter;
  _decimalNumberFormatter_formatter = (uint64_t)v0;

  [(id)_decimalNumberFormatter_formatter setMinimumFractionDigits:0];
  [(id)_decimalNumberFormatter_formatter setMaximumFractionDigits:2];
  v2 = (void *)_decimalNumberFormatter_formatter;
  return [v2 setNumberStyle:1];
}

- (id)formattedDistanceValueForUnit:(id)a3
{
  id v4 = a3;
  v5 = [(FIUIWorkoutSegment *)self distance];
  [v5 doubleValueForUnit:v4];
  double v7 = v6;

  v8 = [(id)objc_opt_class() _decimalNumberFormatter];
  v9 = [NSNumber numberWithDouble:v7];
  v10 = [v8 stringFromNumber:v9];

  return v10;
}

- (id)formattedPaceUsingFormatType:(int64_t)a3 formattingManager:(id)a4 distanceType:(unint64_t)a5
{
  id v8 = a4;
  [(FIUIWorkoutSegment *)self elapsedTime];
  double v10 = v9;
  if (fabs(v9) < 2.22044605e-16)
  {
    v11 = [(FIUIWorkoutSegment *)self endDate];
    v12 = [(FIUIWorkoutSegment *)self startDate];
    [v11 timeIntervalSinceDate:v12];
    double v10 = v13;
  }
  v14 = [(FIUIWorkoutSegment *)self distance];
  v15 = [v8 localizedPaceStringWithDistance:v14 overDuration:a3 paceFormat:a5 distanceType:v10];

  return v15;
}

- (id)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)FIUIWorkoutSegment;
  id v4 = [(FIUIWorkoutSegment *)&v14 description];
  v5 = NSNumber;
  [(FIUIWorkoutSegment *)self elapsedTime];
  double v7 = [v5 numberWithDouble:v6 / 60.0];
  id v8 = [MEMORY[0x263F0A830] kilocalorieUnit];
  double v9 = [(FIUIWorkoutSegment *)self formattedActiveEnergyValueForUnit:v8];
  double v10 = [MEMORY[0x263F0A830] mileUnit];
  v11 = [(FIUIWorkoutSegment *)self formattedDistanceValueForUnit:v10];
  v12 = [v3 stringWithFormat:@"%@: Duration: %@ min; Energy: %@; Distance: %@", v4, v7, v9, v11];

  return v12;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (HKQuantity)activeEnergy
{
  return self->_activeEnergy;
}

- (void)setActiveEnergy:(id)a3
{
}

- (HKQuantity)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_activeEnergy, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end