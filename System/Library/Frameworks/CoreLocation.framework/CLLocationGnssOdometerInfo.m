@interface CLLocationGnssOdometerInfo
+ (BOOL)supportsSecureCoding;
- (CLLocationGnssOdometerInfo)initWithCoder:(id)a3;
- (CLLocationGnssOdometerInfo)initWithOdometer:(double)a3 deltaDistance:(double)a4 deltaDistanceAccuracy:(double)a5;
- (double)deltaDistance;
- (double)deltaDistanceAccuracy;
- (double)odometer;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLLocationGnssOdometerInfo

- (CLLocationGnssOdometerInfo)initWithOdometer:(double)a3 deltaDistance:(double)a4 deltaDistanceAccuracy:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLLocationGnssOdometerInfo;
  result = [(CLLocationGnssOdometerInfo *)&v9 init];
  if (result)
  {
    result->_odometer = a3;
    result->_deltaDistance = a4;
    result->_deltaDistanceAccuracy = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLLocationGnssOdometerInfo)initWithCoder:(id)a3
{
  *(double *)&unint64_t v14 = -1.0;
  *(double *)&unint64_t v15 = -1.0;
  *(double *)&unint64_t v13 = -1.0;
  if ([a3 allowsKeyedCoding])
  {
    double v5 = -1.0;
    double v6 = -1.0;
    if ([a3 containsValueForKey:@"odometer"])
    {
      [a3 decodeDoubleForKey:@"odometer"];
      double v6 = v7;
      *(double *)&unint64_t v15 = v7;
    }
    if ([a3 containsValueForKey:@"deltaDistance"])
    {
      [a3 decodeDoubleForKey:@"deltaDistance"];
      double v5 = v8;
      *(double *)&unint64_t v14 = v8;
    }
    int v9 = [a3 containsValueForKey:@"deltaDistanceAccuracy"];
    double v10 = -1.0;
    if (v9)
    {
      [a3 decodeDoubleForKey:@"deltaDistanceAccuracy"];
      double v10 = v11;
      *(double *)&unint64_t v13 = v11;
    }
  }
  else
  {
    [a3 decodeValueOfObjCType:"d" at:&v15];
    [a3 decodeValueOfObjCType:"d" at:&v14];
    [a3 decodeValueOfObjCType:"d" at:&v13];
    double v5 = *(double *)&v14;
    double v6 = *(double *)&v15;
    double v10 = *(double *)&v13;
  }
  return [(CLLocationGnssOdometerInfo *)self initWithOdometer:v6 deltaDistance:v5 deltaDistanceAccuracy:v10];
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeDouble:@"odometer" forKey:self->_odometer];
    [a3 encodeDouble:@"deltaDistance" forKey:self->_deltaDistance];
    double deltaDistanceAccuracy = self->_deltaDistanceAccuracy;
    [a3 encodeDouble:@"deltaDistanceAccuracy" forKey:deltaDistanceAccuracy];
  }
  else
  {
    [a3 encodeValueOfObjCType:"d" at:&self->_odometer];
    [a3 encodeValueOfObjCType:"d" at:&self->_deltaDistance];
    [a3 encodeValueOfObjCType:"d" at:&self->_deltaDistanceAccuracy];
  }
}

- (double)odometer
{
  return self->_odometer;
}

- (double)deltaDistance
{
  return self->_deltaDistance;
}

- (double)deltaDistanceAccuracy
{
  return self->_deltaDistanceAccuracy;
}

@end