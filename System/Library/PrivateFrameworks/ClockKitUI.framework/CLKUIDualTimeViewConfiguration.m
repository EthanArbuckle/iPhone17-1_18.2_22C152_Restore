@interface CLKUIDualTimeViewConfiguration
- (CLKUIAnalogTimeViewConfiguration)analogConfiguration;
- (CLKUIDigitalClockViewConfiguration)digitalConfiguration;
- (int64_t)timeStyle;
- (void)setAnalogConfiguration:(id)a3;
- (void)setDigitalConfiguration:(id)a3;
- (void)setTimeStyle:(int64_t)a3;
@end

@implementation CLKUIDualTimeViewConfiguration

- (int64_t)timeStyle
{
  return self->_timeStyle;
}

- (void)setTimeStyle:(int64_t)a3
{
  self->_timeStyle = a3;
}

- (CLKUIAnalogTimeViewConfiguration)analogConfiguration
{
  return self->_analogConfiguration;
}

- (void)setAnalogConfiguration:(id)a3
{
}

- (CLKUIDigitalClockViewConfiguration)digitalConfiguration
{
  return self->_digitalConfiguration;
}

- (void)setDigitalConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitalConfiguration, 0);
  objc_storeStrong((id *)&self->_analogConfiguration, 0);
}

@end