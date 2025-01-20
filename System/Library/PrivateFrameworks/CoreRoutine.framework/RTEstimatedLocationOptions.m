@interface RTEstimatedLocationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)enableFallbackModel;
- (RTEstimatedLocationOptions)init;
- (RTEstimatedLocationOptions)initWithAverageSpeed:(double)a3 enableFallbackModel:(BOOL)a4 timeInterval:(double)a5;
- (RTEstimatedLocationOptions)initWithCoder:(id)a3;
- (double)averageSpeed;
- (double)timeInterval;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTEstimatedLocationOptions

- (RTEstimatedLocationOptions)init
{
  return [(RTEstimatedLocationOptions *)self initWithAverageSpeed:0 enableFallbackModel:-1.0 timeInterval:-1.0];
}

- (RTEstimatedLocationOptions)initWithAverageSpeed:(double)a3 enableFallbackModel:(BOOL)a4 timeInterval:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)RTEstimatedLocationOptions;
  result = [(RTEstimatedLocationOptions *)&v9 init];
  if (result)
  {
    result->_enableFallbackModel = a4;
    result->_averageSpeed = a3;
    result->_timeInterval = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTEstimatedLocationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"averageSpeed"];
  double v6 = v5;
  uint64_t v7 = [v4 decodeBoolForKey:@"enableFallbackModel"];
  [v4 decodeDoubleForKey:@"timeInterval"];
  double v9 = v8;

  return [(RTEstimatedLocationOptions *)self initWithAverageSpeed:v7 enableFallbackModel:v6 timeInterval:v9];
}

- (void)encodeWithCoder:(id)a3
{
  double averageSpeed = self->_averageSpeed;
  id v5 = a3;
  [v5 encodeDouble:@"averageSpeed" forKey:averageSpeed];
  [v5 encodeBool:self->_enableFallbackModel forKey:@"enableFallbackModel"];
  [v5 encodeDouble:@"timeInterval" forKey:self->_timeInterval];
}

- (double)averageSpeed
{
  return self->_averageSpeed;
}

- (BOOL)enableFallbackModel
{
  return self->_enableFallbackModel;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

@end