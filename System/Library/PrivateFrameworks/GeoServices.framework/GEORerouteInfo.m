@interface GEORerouteInfo
+ (BOOL)supportsSecureCoding;
- (GEORerouteInfo)initWithCoder:(id)a3;
- (NSDate)time;
- (double)distanceFromDestination;
- (double)penalty;
- (void)encodeWithCoder:(id)a3;
- (void)setDistanceFromDestination:(double)a3;
- (void)setTime:(id)a3;
- (void)updateWithCurrentTime:(id)a3 location:(id)a4 isMostRecentReroute:(BOOL)a5 destinationCoordinate:(id)a6 numThrottledReroutes:(unint64_t)a7;
@end

@implementation GEORerouteInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORerouteInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self)
  {
    [v4 decodeDoubleForKey:@"DistancePenaltyKey"];
    self->_distancePenalty = v6;
    [v5 decodeDoubleForKey:@"ThrottledReroutesPenaltyKey"];
    self->_throttledReroutesPenalty = v7;
    [v5 decodeDoubleForKey:@"PenaltyKey"];
    self->_penalty = v8;
    v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"TimeKey"];
    time = self->_time;
    self->_time = v9;

    [v5 decodeDoubleForKey:@"DistanceFromDestinationKey"];
    self->_distanceFromDestination = v11;
    v12 = self;
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"DistancePenaltyKey" forKey:self->_distancePenalty];
  [v4 encodeDouble:@"ThrottledReroutesPenaltyKey" forKey:self->_throttledReroutesPenalty];
  [v4 encodeDouble:@"PenaltyKey" forKey:self->_penalty];
  [v4 encodeObject:self->_time forKey:@"TimeKey"];
  [v4 encodeDouble:@"DistanceFromDestinationKey" forKey:self->_distanceFromDestination];
}

- (void)updateWithCurrentTime:(id)a3 location:(id)a4 isMostRecentReroute:(BOOL)a5 destinationCoordinate:(id)a6 numThrottledReroutes:(unint64_t)a7
{
  double var1 = a6.var1;
  double var0 = a6.var0;
  BOOL v10 = a5;
  id v25 = a3;
  id v13 = a4;
  v14 = v13;
  if (v10)
  {
    v15 = [v13 latLng];
    [v15 coordinate];
    double v17 = v16;
    double v19 = v18;

    double v20 = GEOCalculateDistanceRadius(v17, v19, var0, var1, 6367000.0) - self->_distanceFromDestination;
    if (v20 > 100.0) {
      self->_distancePenalty = (v20 + -100.0) * 0.002;
    }
    self->_throttledReroutesPenalty = (1.0 - pow((double)(a7 + 1), -0.7)) * 0.2;
  }
  [v25 timeIntervalSinceDate:self->_time];
  double v22 = v21 / 600.0;
  if (v22 < 0.0) {
    double v22 = 0.0;
  }
  if (v22 > 1.0) {
    double v22 = 1.0;
  }
  double v23 = self->_distancePenalty + 0.2 + self->_throttledReroutesPenalty;
  float v24 = v22;
  self->_penalty = v23 + (0.0 - v23) * v24;
}

- (double)penalty
{
  return self->_penalty;
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (double)distanceFromDestination
{
  return self->_distanceFromDestination;
}

- (void)setDistanceFromDestination:(double)a3
{
  self->_distanceFromDestination = a3;
}

- (void).cxx_destruct
{
}

@end