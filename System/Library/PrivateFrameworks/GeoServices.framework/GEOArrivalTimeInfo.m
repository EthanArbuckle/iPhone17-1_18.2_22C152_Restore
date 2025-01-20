@interface GEOArrivalTimeInfo
+ (BOOL)supportsSecureCoding;
- (GEOArrivalTimeInfo)initWithCoder:(id)a3;
- (GEOArrivalTimeInfo)initWithLegIndex:(unint64_t)a3 remainingTime:(double)a4;
- (double)remainingTime;
- (unint64_t)legIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setLegIndex:(unint64_t)a3;
- (void)setRemainingTime:(double)a3;
@end

@implementation GEOArrivalTimeInfo

- (GEOArrivalTimeInfo)initWithLegIndex:(unint64_t)a3 remainingTime:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GEOArrivalTimeInfo;
  result = [(GEOArrivalTimeInfo *)&v7 init];
  if (result)
  {
    result->_legIndex = a3;
    result->_remainingTime = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOArrivalTimeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOArrivalTimeInfo;
  v5 = [(GEOArrivalTimeInfo *)&v8 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_remainingTime"];
    v5->_remainingTime = v6;
    v5->_legIndex = [v4 decodeIntegerForKey:@"_legIndex"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double remainingTime = self->_remainingTime;
  id v5 = a3;
  [v5 encodeDouble:@"_remainingTime" forKey:remainingTime];
  [v5 encodeInteger:self->_legIndex forKey:@"_legIndex"];
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(double)a3
{
  self->_double remainingTime = a3;
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (void)setLegIndex:(unint64_t)a3
{
  self->_legIndex = a3;
}

@end