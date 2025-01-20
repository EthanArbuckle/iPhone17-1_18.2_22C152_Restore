@interface CLRacingRouteState
+ (BOOL)supportsSecureCoding;
- (CLRacingRouteState)initWithCoder:(id)a3;
- (CLRacingRouteState)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 odometer:(double)a6 timestamp:(double)a7 timeSinceStart:(double)a8 offRouteTime:(double)a9 distanceSinceStart:(double)a10 offRouteDistance:(double)a11 averagePace:(double)a12 distanceAlongReference:(double)a13;
- (double)altitude;
- (double)averagePace;
- (double)distanceAlongReference;
- (double)distanceSinceStart;
- (double)latitude;
- (double)longitude;
- (double)odometer;
- (double)offRouteDistance;
- (double)offRouteTime;
- (double)timeSinceStart;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLRacingRouteState

- (CLRacingRouteState)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 odometer:(double)a6 timestamp:(double)a7 timeSinceStart:(double)a8 offRouteTime:(double)a9 distanceSinceStart:(double)a10 offRouteDistance:(double)a11 averagePace:(double)a12 distanceAlongReference:(double)a13
{
  v22.receiver = self;
  v22.super_class = (Class)CLRacingRouteState;
  result = [(CLRacingRouteState *)&v22 init];
  if (result)
  {
    result->_latitude = a3;
    result->_longitude = a4;
    result->_altitude = a5;
    result->_odometer = a6;
    result->_timestamp = a7;
    result->_timeSinceStart = a8;
    result->_offRouteTime = a9;
    result->_distanceSinceStart = a10;
    result->_offRouteDistance = a11;
    result->_averagePace = a12;
    result->_distanceAlongReference = a13;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [[CLRacingRouteState alloc] initWithLatitude:self->_latitude longitude:self->_longitude altitude:self->_altitude odometer:self->_odometer timestamp:self->_timestamp timeSinceStart:self->_timeSinceStart offRouteTime:self->_offRouteTime distanceSinceStart:self->_distanceSinceStart offRouteDistance:*(void *)&self->_offRouteDistance averagePace:*(void *)&self->_averagePace distanceAlongReference:*(void *)&self->_distanceAlongReference];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [(CLRacingRouteState *)self latitude];
  objc_msgSend(a3, "encodeDouble:forKey:", @"latitude");
  [(CLRacingRouteState *)self longitude];
  objc_msgSend(a3, "encodeDouble:forKey:", @"longitude");
  [(CLRacingRouteState *)self altitude];
  objc_msgSend(a3, "encodeDouble:forKey:", @"altitude");
  [(CLRacingRouteState *)self odometer];
  objc_msgSend(a3, "encodeDouble:forKey:", @"odometer");
  [(CLRacingRouteState *)self timestamp];
  objc_msgSend(a3, "encodeDouble:forKey:", @"timestamp");
  [(CLRacingRouteState *)self timeSinceStart];
  objc_msgSend(a3, "encodeDouble:forKey:", @"timeSinceStart");
  [(CLRacingRouteState *)self offRouteTime];
  objc_msgSend(a3, "encodeDouble:forKey:", @"offRouteTime");
  [(CLRacingRouteState *)self distanceSinceStart];
  objc_msgSend(a3, "encodeDouble:forKey:", @"distanceSinceStart");
  [(CLRacingRouteState *)self offRouteDistance];
  objc_msgSend(a3, "encodeDouble:forKey:", @"offRouteDistance");
  [(CLRacingRouteState *)self averagePace];
  objc_msgSend(a3, "encodeDouble:forKey:", @"averagePace");
  [(CLRacingRouteState *)self distanceAlongReference];

  objc_msgSend(a3, "encodeDouble:forKey:", @"distanceAlongReference");
}

- (CLRacingRouteState)initWithCoder:(id)a3
{
  v4 = [CLRacingRouteState alloc];
  [a3 decodeDoubleForKey:@"latitude"];
  double v26 = v5;
  [a3 decodeDoubleForKey:@"longitude"];
  double v25 = v6;
  [a3 decodeDoubleForKey:@"altitude"];
  double v8 = v7;
  [a3 decodeDoubleForKey:@"odometer"];
  double v10 = v9;
  [a3 decodeDoubleForKey:@"timestamp"];
  double v12 = v11;
  [a3 decodeDoubleForKey:@"timeSinceStart"];
  double v14 = v13;
  [a3 decodeDoubleForKey:@"offRouteTime"];
  double v16 = v15;
  [a3 decodeDoubleForKey:@"distanceSinceStart"];
  double v18 = v17;
  [a3 decodeDoubleForKey:@"offRouteDistance"];
  uint64_t v20 = v19;
  [a3 decodeDoubleForKey:@"averagePace"];
  uint64_t v22 = v21;
  [a3 decodeDoubleForKey:@"distanceAlongReference"];
  return [(CLRacingRouteState *)v4 initWithLatitude:v26 longitude:v25 altitude:v8 odometer:v10 timestamp:v12 timeSinceStart:v14 offRouteTime:v16 distanceSinceStart:v18 offRouteDistance:v20 averagePace:v22 distanceAlongReference:v23];
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)odometer
{
  return self->_odometer;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)timeSinceStart
{
  return self->_timeSinceStart;
}

- (double)offRouteTime
{
  return self->_offRouteTime;
}

- (double)distanceSinceStart
{
  return self->_distanceSinceStart;
}

- (double)offRouteDistance
{
  return self->_offRouteDistance;
}

- (double)averagePace
{
  return self->_averagePace;
}

- (double)distanceAlongReference
{
  return self->_distanceAlongReference;
}

@end