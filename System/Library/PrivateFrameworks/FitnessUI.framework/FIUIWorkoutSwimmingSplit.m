@interface FIUIWorkoutSwimmingSplit
- (double)_fractionToFillTotalSplitDistance;
- (double)distanceInUserUnit;
- (double)duration;
- (double)durationScaledToFillSplit;
- (id)description;
- (id)formattedPaceWithFormattingManager:(id)a3;
- (id)formattedStrokeCount;
- (int64_t)splitDistance;
- (int64_t)strokeCount;
- (int64_t)strokeCountScaledToFillSplit;
- (void)setDistanceInUserUnit:(double)a3;
- (void)setDuration:(double)a3;
- (void)setDurationScaledToFillSplit:(double)a3;
- (void)setSplitDistance:(int64_t)a3;
- (void)setStrokeCount:(int64_t)a3;
- (void)setStrokeCountScaledToFillSplit:(int64_t)a3;
@end

@implementation FIUIWorkoutSwimmingSplit

- (double)_fractionToFillTotalSplitDistance
{
  double v3 = (double)[(FIUIWorkoutSwimmingSplit *)self splitDistance];
  [(FIUIWorkoutSwimmingSplit *)self distanceInUserUnit];
  return v3 / v4;
}

- (int64_t)strokeCountScaledToFillSplit
{
  [(FIUIWorkoutSwimmingSplit *)self _fractionToFillTotalSplitDistance];
  return llround(v3 * (double)[(FIUIWorkoutSwimmingSplit *)self strokeCount]);
}

- (double)durationScaledToFillSplit
{
  [(FIUIWorkoutSwimmingSplit *)self duration];
  double v4 = v3;
  [(FIUIWorkoutSwimmingSplit *)self _fractionToFillTotalSplitDistance];
  return v4 * v5;
}

- (id)formattedStrokeCount
{
  v2 = objc_msgSend(NSNumber, "numberWithInteger:", -[FIUIWorkoutSwimmingSplit strokeCountScaledToFillSplit](self, "strokeCountScaledToFillSplit"));
  double v3 = +[FIUIFormattingManager stringWithNumber:v2 decimalPrecision:1];

  return v3;
}

- (id)formattedPaceWithFormattingManager:(id)a3
{
  id v4 = a3;
  [(FIUIWorkoutSwimmingSplit *)self durationScaledToFillSplit];
  double v5 = objc_msgSend(v4, "stringWithDuration:durationFormat:", 1);

  return v5;
}

- (id)description
{
  double v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)FIUIWorkoutSwimmingSplit;
  id v4 = [(FIUIWorkoutSwimmingSplit *)&v11 description];
  double v5 = NSNumber;
  [(FIUIWorkoutSwimmingSplit *)self duration];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[FIUIWorkoutSwimmingSplit splitDistance](self, "splitDistance"));
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[FIUIWorkoutSwimmingSplit strokeCount](self, "strokeCount"));
  v9 = [v3 stringWithFormat:@"%@: %@ seconds, %@ m/yd, %@ strokes", v4, v6, v7, v8];

  return v9;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)splitDistance
{
  return self->_splitDistance;
}

- (void)setSplitDistance:(int64_t)a3
{
  self->_splitDistance = a3;
}

- (double)distanceInUserUnit
{
  return self->_distanceInUserUnit;
}

- (void)setDistanceInUserUnit:(double)a3
{
  self->_distanceInUserUnit = a3;
}

- (int64_t)strokeCount
{
  return self->_strokeCount;
}

- (void)setStrokeCount:(int64_t)a3
{
  self->_strokeCount = a3;
}

- (void)setStrokeCountScaledToFillSplit:(int64_t)a3
{
  self->_strokeCountScaledToFillSplit = a3;
}

- (void)setDurationScaledToFillSplit:(double)a3
{
  self->_durationScaledToFillSplit = a3;
}

@end