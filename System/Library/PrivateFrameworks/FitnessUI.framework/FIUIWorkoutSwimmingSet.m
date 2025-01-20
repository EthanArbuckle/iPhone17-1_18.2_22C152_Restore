@interface FIUIWorkoutSwimmingSet
+ (id)_decimalNumberFormatter;
- (HKQuantity)distance;
- (NSDate)endDate;
- (NSDate)movementEndDate;
- (NSDate)startDate;
- (double)_activeDuration;
- (double)_restingDuration;
- (id)description;
- (id)formattedActiveDurationWithFormattingManager:(id)a3;
- (id)formattedDistanceValueWithFormattingManager:(id)a3;
- (id)formattedDominantStrokeStyle;
- (id)formattedPaceUsingFormatType:(int64_t)a3 formattingManager:(id)a4;
- (id)formattedRestDurationWithFormattingManager:(id)a3;
- (id)formattedStrokeCountUsingFormatType:(int64_t)a3 formattingManager:(id)a4;
- (int64_t)dominantStrokeStyle;
- (int64_t)strokeCount;
- (void)setDistance:(id)a3;
- (void)setDominantStrokeStyle:(int64_t)a3;
- (void)setEndDate:(id)a3;
- (void)setMovementEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStrokeCount:(int64_t)a3;
@end

@implementation FIUIWorkoutSwimmingSet

- (double)_activeDuration
{
  v3 = [(FIUIWorkoutSwimmingSet *)self movementEndDate];
  v4 = [(FIUIWorkoutSwimmingSet *)self startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (double)_restingDuration
{
  v3 = [(FIUIWorkoutSwimmingSet *)self endDate];
  v4 = [(FIUIWorkoutSwimmingSet *)self movementEndDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (id)formattedActiveDurationWithFormattingManager:(id)a3
{
  id v4 = a3;
  [(FIUIWorkoutSwimmingSet *)self _activeDuration];
  double v5 = objc_msgSend(v4, "stringWithDuration:durationFormat:", 3);

  return v5;
}

- (id)formattedRestDurationWithFormattingManager:(id)a3
{
  id v4 = a3;
  [(FIUIWorkoutSwimmingSet *)self _restingDuration];
  double v5 = objc_msgSend(v4, "stringWithDuration:durationFormat:", 3);

  return v5;
}

+ (id)_decimalNumberFormatter
{
  if (_decimalNumberFormatter_onceToken_0 != -1) {
    dispatch_once(&_decimalNumberFormatter_onceToken_0, &__block_literal_global_18);
  }
  v2 = (void *)_decimalNumberFormatter_formatter_0;
  return v2;
}

uint64_t __49__FIUIWorkoutSwimmingSet__decimalNumberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)_decimalNumberFormatter_formatter_0;
  _decimalNumberFormatter_formatter_0 = (uint64_t)v0;

  [(id)_decimalNumberFormatter_formatter_0 setMinimumFractionDigits:0];
  [(id)_decimalNumberFormatter_formatter_0 setMaximumFractionDigits:2];
  v2 = (void *)_decimalNumberFormatter_formatter_0;
  return [v2 setNumberStyle:1];
}

- (id)formattedDistanceValueWithFormattingManager:(id)a3
{
  id v4 = a3;
  double v5 = [(FIUIWorkoutSwimmingSet *)self distance];
  double v6 = [MEMORY[0x263F0A830] meterUnit];
  [v5 doubleValueForUnit:v6];
  v7 = objc_msgSend(v4, "localizedStringWithDistanceInMeters:distanceType:unitStyle:", 3, 1);

  return v7;
}

- (id)formattedPaceUsingFormatType:(int64_t)a3 formattingManager:(id)a4
{
  id v6 = a4;
  [(FIUIWorkoutSwimmingSet *)self _activeDuration];
  double v8 = v7;
  v9 = [(FIUIWorkoutSwimmingSet *)self distance];
  v10 = [v6 localizedSwimmingPaceStringWithDistance:v9 overDuration:a3 paceFormat:v8];

  return v10;
}

- (id)formattedStrokeCountUsingFormatType:(int64_t)a3 formattingManager:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(FIUIWorkoutSwimmingSet *)self strokeCount];
  double v8 = [(FIUIWorkoutSwimmingSet *)self distance];
  v9 = [v6 localizedStrokeCountStringWithCount:v7 overDistance:v8 paceFormat:a3];

  return v9;
}

- (id)formattedDominantStrokeStyle
{
  [(FIUIWorkoutSwimmingSet *)self dominantStrokeStyle];
  return (id)FIUILocalizedStrokeStyleName();
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)FIUIWorkoutSwimmingSet;
  id v4 = [(FIUIWorkoutSwimmingSet *)&v12 description];
  double v5 = [(FIUIWorkoutSwimmingSet *)self startDate];
  id v6 = [(FIUIWorkoutSwimmingSet *)self endDate];
  int64_t v7 = [(FIUIWorkoutSwimmingSet *)self distance];
  double v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[FIUIWorkoutSwimmingSet strokeCount](self, "strokeCount"));
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[FIUIWorkoutSwimmingSet dominantStrokeStyle](self, "dominantStrokeStyle"));
  objc_msgSend(v3, "stringWithFormat:", @"%@: Start: %@; End: %@; Distance: %@; Stroke Count: %@; Stroke Style: %@",
    v4,
    v5,
    v6,
    v7,
    v8,
  v10 = v9);

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)movementEndDate
{
  return self->_movementEndDate;
}

- (void)setMovementEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (int64_t)dominantStrokeStyle
{
  return self->_dominantStrokeStyle;
}

- (void)setDominantStrokeStyle:(int64_t)a3
{
  self->_dominantStrokeStyle = a3;
}

- (int64_t)strokeCount
{
  return self->_strokeCount;
}

- (void)setStrokeCount:(int64_t)a3
{
  self->_strokeCount = a3;
}

- (HKQuantity)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_movementEndDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end