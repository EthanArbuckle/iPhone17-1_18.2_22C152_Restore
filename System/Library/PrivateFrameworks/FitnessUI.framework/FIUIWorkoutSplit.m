@interface FIUIWorkoutSplit
- (FIUIWorkoutSplit)initWithCoder:(id)a3;
- (FIUIWorkoutSplit)initWithDistance:(double)a3 duration:(double)a4;
- (FIUIWorkoutSplit)initWithDistance:(double)a3 duration:(double)a4 dateInterval:(id)a5;
- (NSDateInterval)dateInterval;
- (double)distanceInMeters;
- (double)duration;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setDistanceInMeters:(double)a3;
- (void)setDuration:(double)a3;
@end

@implementation FIUIWorkoutSplit

- (FIUIWorkoutSplit)initWithDistance:(double)a3 duration:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)FIUIWorkoutSplit;
  v6 = [(FIUIWorkoutSplit *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(FIUIWorkoutSplit *)v6 setDistanceInMeters:a3];
    [(FIUIWorkoutSplit *)v7 setDuration:a4];
  }
  return v7;
}

- (FIUIWorkoutSplit)initWithDistance:(double)a3 duration:(double)a4 dateInterval:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)FIUIWorkoutSplit;
  objc_super v9 = [(FIUIWorkoutSplit *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(FIUIWorkoutSplit *)v9 setDistanceInMeters:a3];
    [(FIUIWorkoutSplit *)v10 setDuration:a4];
    [(FIUIWorkoutSplit *)v10 setDateInterval:v8];
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)FIUIWorkoutSplit;
  v4 = [(FIUIWorkoutSplit *)&v10 description];
  [(FIUIWorkoutSplit *)self distanceInMeters];
  uint64_t v6 = v5;
  [(FIUIWorkoutSplit *)self duration];
  id v8 = [v3 stringWithFormat:@"%@: distanceInMeters: %f duration: %f", v4, v6, v7];

  return v8;
}

- (FIUIWorkoutSplit)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIUIWorkoutSplit;
  uint64_t v5 = [(FIUIWorkoutSplit *)&v9 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"distance"];
    v5->_distanceInMeters = v6;
    [v4 decodeDoubleForKey:@"duration"];
    v5->_duration = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double distanceInMeters = self->_distanceInMeters;
  id v5 = a3;
  [v5 encodeDouble:@"distance" forKey:distanceInMeters];
  [v5 encodeDouble:@"duration" forKey:self->_duration];
}

- (double)distanceInMeters
{
  return self->_distanceInMeters;
}

- (void)setDistanceInMeters:(double)a3
{
  self->_double distanceInMeters = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (void).cxx_destruct
{
}

@end