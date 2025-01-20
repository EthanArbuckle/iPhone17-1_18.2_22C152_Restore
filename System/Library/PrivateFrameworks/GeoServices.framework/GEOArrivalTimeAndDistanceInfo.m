@interface GEOArrivalTimeAndDistanceInfo
+ (BOOL)supportsSecureCoding;
- (GEOArrivalTimeAndDistanceInfo)initWithCoder:(id)a3;
- (NSArray)arrivalTimeInfo;
- (double)distanceRemainingToEndOfLeg;
- (double)distanceRemainingToEndOfRoute;
- (void)encodeWithCoder:(id)a3;
- (void)setArrivalTimeInfo:(id)a3;
- (void)setDistanceRemainingToEndOfLeg:(double)a3;
- (void)setDistanceRemainingToEndOfRoute:(double)a3;
@end

@implementation GEOArrivalTimeAndDistanceInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOArrivalTimeAndDistanceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOArrivalTimeAndDistanceInfo;
  v5 = [(GEOArrivalTimeAndDistanceInfo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_arrivalTimeInfo"];
    arrivalTimeInfo = v5->_arrivalTimeInfo;
    v5->_arrivalTimeInfo = (NSArray *)v6;

    [v4 decodeDoubleForKey:@"_distanceRemainingToEndOfLeg"];
    v5->_distanceRemainingToEndOfLeg = v8;
    [v4 decodeDoubleForKey:@"_distanceRemainingToEndOfRoute"];
    v5->_distanceRemainingToEndOfRoute = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  arrivalTimeInfo = self->_arrivalTimeInfo;
  id v5 = a3;
  [v5 encodeObject:arrivalTimeInfo forKey:@"_arrivalTimeInfo"];
  [v5 encodeDouble:@"_distanceRemainingToEndOfLeg" forKey:self->_distanceRemainingToEndOfLeg];
  [v5 encodeDouble:@"_distanceRemainingToEndOfRoute" forKey:self->_distanceRemainingToEndOfRoute];
}

- (NSArray)arrivalTimeInfo
{
  return self->_arrivalTimeInfo;
}

- (void)setArrivalTimeInfo:(id)a3
{
}

- (double)distanceRemainingToEndOfLeg
{
  return self->_distanceRemainingToEndOfLeg;
}

- (void)setDistanceRemainingToEndOfLeg:(double)a3
{
  self->_distanceRemainingToEndOfLeg = a3;
}

- (double)distanceRemainingToEndOfRoute
{
  return self->_distanceRemainingToEndOfRoute;
}

- (void)setDistanceRemainingToEndOfRoute:(double)a3
{
  self->_distanceRemainingToEndOfRoute = a3;
}

- (void).cxx_destruct
{
}

@end