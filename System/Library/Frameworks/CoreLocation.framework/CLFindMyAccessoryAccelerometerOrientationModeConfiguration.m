@interface CLFindMyAccessoryAccelerometerOrientationModeConfiguration
+ (BOOL)supportsSecureCoding;
- (CLFindMyAccessoryAccelerometerOrientationModeConfiguration)initWithCoder:(id)a3;
- (CLFindMyAccessoryAccelerometerOrientationModeConfiguration)initWithThreshold:(unsigned int)a3 sleepDuration:(unsigned __int16)a4;
- (unsigned)sleepDuration_ms;
- (unsigned)threshold;
- (void)encodeWithCoder:(id)a3;
- (void)setSleepDuration_ms:(unsigned __int16)a3;
- (void)setThreshold:(unsigned int)a3;
@end

@implementation CLFindMyAccessoryAccelerometerOrientationModeConfiguration

- (CLFindMyAccessoryAccelerometerOrientationModeConfiguration)initWithThreshold:(unsigned int)a3 sleepDuration:(unsigned __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CLFindMyAccessoryAccelerometerOrientationModeConfiguration;
  result = [(CLFindMyAccessoryAccelerometerOrientationModeConfiguration *)&v7 init];
  if (result)
  {
    result->_threshold = a3;
    result->_sleepDuration_ms = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessoryAccelerometerOrientationModeConfiguration)initWithCoder:(id)a3
{
  [a3 decodeIntForKey:@"threshold"];
  [a3 decodeIntForKey:@"sleepDuration"];

  return (CLFindMyAccessoryAccelerometerOrientationModeConfiguration *)MEMORY[0x1F4181798](self, sel_initWithThreshold_sleepDuration_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt:self->_threshold forKey:@"threshold"];
  uint64_t sleepDuration_ms = self->_sleepDuration_ms;

  [a3 encodeInt:sleepDuration_ms forKey:@"sleepDuration"];
}

- (unsigned)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(unsigned int)a3
{
  self->_threshold = a3;
}

- (unsigned)sleepDuration_ms
{
  return self->_sleepDuration_ms;
}

- (void)setSleepDuration_ms:(unsigned __int16)a3
{
  self->_uint64_t sleepDuration_ms = a3;
}

@end