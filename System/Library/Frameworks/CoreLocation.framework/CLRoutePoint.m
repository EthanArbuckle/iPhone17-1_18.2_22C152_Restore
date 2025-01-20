@interface CLRoutePoint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLRoutePoint)initWithCoder:(id)a3;
- (CLRoutePoint)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 odometer:(double)a6 timestamp:(double)a7 signalEnvironmentType:(int)a8;
- (double)altitude_m;
- (double)latitude_deg;
- (double)longitude_deg;
- (double)odometer_m;
- (double)timestamp_s;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)signalEnvironmentType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLRoutePoint

- (CLRoutePoint)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 odometer:(double)a6 timestamp:(double)a7 signalEnvironmentType:(int)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CLRoutePoint;
  result = [(CLRoutePoint *)&v15 init];
  if (result)
  {
    result->_latitude_deg = a3;
    result->_longitude_deg = a4;
    result->_altitude_m = a5;
    result->_odometer_m = a6;
    result->_timestamp_s = a7;
    result->_signalEnvironmentType = a8;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(CLRoutePoint *)self latitude_deg];
  uint64_t v6 = v5;
  [(CLRoutePoint *)self longitude_deg];
  uint64_t v8 = v7;
  [(CLRoutePoint *)self altitude_m];
  uint64_t v10 = v9;
  [(CLRoutePoint *)self odometer_m];
  uint64_t v12 = v11;
  [(CLRoutePoint *)self timestamp_s];
  return (id)[v3 stringWithFormat:@"<%@ latitude: %.7lf, longitude: %.7lf, altitude: %.3lf, odometer: %.3lf, timestamp: %.3lf, signalEnvironment: %d>", v4, v6, v8, v10, v12, v13, -[CLRoutePoint signalEnvironmentType](self, "signalEnvironmentType")];
}

- (BOOL)isEqual:(id)a3
{
  [(CLRoutePoint *)self latitude_deg];
  double v6 = v5;
  objc_msgSend(a3, "latitude_deg");
  if (vabdd_f64(v6, v7) >= 0.0000001) {
    return 0;
  }
  [(CLRoutePoint *)self longitude_deg];
  double v9 = v8;
  objc_msgSend(a3, "longitude_deg");
  if (vabdd_f64(v9, v10) >= 0.0000001) {
    return 0;
  }
  [(CLRoutePoint *)self altitude_m];
  double v12 = v11;
  objc_msgSend(a3, "altitude_m");
  if (vabdd_f64(v12, v13) >= 0.0000001) {
    return 0;
  }
  [(CLRoutePoint *)self odometer_m];
  double v15 = v14;
  objc_msgSend(a3, "odometer_m");
  if (vabdd_f64(v15, v16) >= 0.0000001) {
    return 0;
  }
  [(CLRoutePoint *)self timestamp_s];
  double v18 = v17;
  objc_msgSend(a3, "timestamp_s");
  if (vabdd_f64(v18, v19) >= 0.0000001) {
    return 0;
  }
  int v20 = [(CLRoutePoint *)self signalEnvironmentType];
  return v20 == [a3 signalEnvironmentType];
}

- (unint64_t)hash
{
  v3 = NSNumber;
  [(CLRoutePoint *)self latitude_deg];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "numberWithDouble:"), "hash");
  double v5 = NSNumber;
  [(CLRoutePoint *)self longitude_deg];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "numberWithDouble:"), "hash") ^ v4;
  double v7 = NSNumber;
  [(CLRoutePoint *)self altitude_m];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "numberWithDouble:"), "hash");
  double v9 = NSNumber;
  [(CLRoutePoint *)self odometer_m];
  uint64_t v10 = v6 ^ v8 ^ objc_msgSend((id)objc_msgSend(v9, "numberWithDouble:"), "hash");
  double v11 = NSNumber;
  [(CLRoutePoint *)self timestamp_s];
  uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "numberWithDouble:"), "hash");
  return v10 ^ v12 ^ [(CLRoutePoint *)self signalEnvironmentType];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CLRoutePoint *)self latitude_deg];
  *(void *)(v4 + 16) = v5;
  [(CLRoutePoint *)self longitude_deg];
  *(void *)(v4 + 24) = v6;
  [(CLRoutePoint *)self altitude_m];
  *(void *)(v4 + 32) = v7;
  [(CLRoutePoint *)self odometer_m];
  *(void *)(v4 + 40) = v8;
  [(CLRoutePoint *)self timestamp_s];
  *(void *)(v4 + 48) = v9;
  *(_DWORD *)(v4 + 8) = [(CLRoutePoint *)self signalEnvironmentType];
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [(CLRoutePoint *)self latitude_deg];
  objc_msgSend(a3, "encodeDouble:forKey:", @"latitude");
  [(CLRoutePoint *)self longitude_deg];
  objc_msgSend(a3, "encodeDouble:forKey:", @"longitude");
  [(CLRoutePoint *)self altitude_m];
  objc_msgSend(a3, "encodeDouble:forKey:", @"altitude");
  [(CLRoutePoint *)self odometer_m];
  objc_msgSend(a3, "encodeDouble:forKey:", @"odometer");
  [(CLRoutePoint *)self timestamp_s];
  objc_msgSend(a3, "encodeDouble:forKey:", @"timestamp");
  uint64_t v5 = [(CLRoutePoint *)self signalEnvironmentType];

  [a3 encodeInteger:v5 forKey:@"signalEnvironment"];
}

- (CLRoutePoint)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CLRoutePoint;
  uint64_t v4 = [(CLRoutePoint *)&v11 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"latitude"];
    v4->_latitude_deg = v5;
    [a3 decodeDoubleForKey:@"longitude"];
    v4->_longitude_deg = v6;
    [a3 decodeDoubleForKey:@"altitude"];
    v4->_altitude_m = v7;
    [a3 decodeDoubleForKey:@"odometer"];
    v4->_odometer_m = v8;
    [a3 decodeDoubleForKey:@"timestamp"];
    v4->_timestamp_s = v9;
    v4->_signalEnvironmentType = [a3 decodeIntegerForKey:@"signalEnvironment"];
  }
  return v4;
}

- (double)latitude_deg
{
  return self->_latitude_deg;
}

- (double)longitude_deg
{
  return self->_longitude_deg;
}

- (double)altitude_m
{
  return self->_altitude_m;
}

- (double)odometer_m
{
  return self->_odometer_m;
}

- (double)timestamp_s
{
  return self->_timestamp_s;
}

- (int)signalEnvironmentType
{
  return self->_signalEnvironmentType;
}

@end