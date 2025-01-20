@interface CLFindMyAccessoryAccelerometerSlopeModeConfiguration
+ (BOOL)supportsSecureCoding;
+ (float)maximumThreshold;
+ (float)minimumThreshold;
+ (unsigned)maximumSampleCount;
+ (unsigned)minimumSampleCount;
- (CLFindMyAccessoryAccelerometerSlopeModeConfiguration)initWithCoder:(id)a3;
- (CLFindMyAccessoryAccelerometerSlopeModeConfiguration)initWithThreshold:(float)a3 sampleCount:(unsigned __int8)a4 sampleRate:(unsigned __int8)a5;
- (float)threshold;
- (unsigned)sampleCount;
- (unsigned)sampleRate;
- (void)encodeWithCoder:(id)a3;
- (void)setSampleCount:(unsigned __int8)a3;
- (void)setSampleRate:(unsigned __int8)a3;
- (void)setThreshold:(float)a3;
@end

@implementation CLFindMyAccessoryAccelerometerSlopeModeConfiguration

+ (unsigned)minimumSampleCount
{
  return 0;
}

+ (unsigned)maximumSampleCount
{
  return 3;
}

+ (float)minimumThreshold
{
  return 0.0;
}

+ (float)maximumThreshold
{
  return 7.97;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessoryAccelerometerSlopeModeConfiguration)initWithThreshold:(float)a3 sampleCount:(unsigned __int8)a4 sampleRate:(unsigned __int8)a5
{
  unsigned int v6 = a4;
  [(id)objc_opt_class() minimumThreshold];
  if (v9 > a3) {
    return 0;
  }
  [(id)objc_opt_class() maximumThreshold];
  if (v10 < a3
    || [(id)objc_opt_class() minimumSampleCount] > v6
    || [(id)objc_opt_class() maximumSampleCount] < v6)
  {
    return 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)CLFindMyAccessoryAccelerometerSlopeModeConfiguration;
  result = [(CLFindMyAccessoryAccelerometerSlopeModeConfiguration *)&v12 init];
  if (result)
  {
    result->_threshold = a3;
    result->_sampleCount = v6;
    result->_sampleRate = a5;
  }
  return result;
}

- (CLFindMyAccessoryAccelerometerSlopeModeConfiguration)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLFindMyAccessoryAccelerometerSlopeModeConfiguration;
  v4 = [(CLFindMyAccessoryAccelerometerSlopeModeConfiguration *)&v7 init];
  if (v4)
  {
    v4->_sampleCount = [a3 decodeIntForKey:@"sampleCount"];
    [a3 decodeFloatForKey:@"threshold"];
    v4->_threshold = v5;
    v4->_sampleRate = [a3 decodeIntForKey:@"sampleRate"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt:self->_sampleCount forKey:@"sampleCount"];
  *(float *)&double v5 = self->_threshold;
  [a3 encodeFloat:@"threshold" forKey:v5];
  uint64_t sampleRate = self->_sampleRate;

  [a3 encodeInt:sampleRate forKey:@"sampleRate"];
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (unsigned)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(unsigned __int8)a3
{
  self->_sampleCount = a3;
}

- (unsigned)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(unsigned __int8)a3
{
  self->_uint64_t sampleRate = a3;
}

@end