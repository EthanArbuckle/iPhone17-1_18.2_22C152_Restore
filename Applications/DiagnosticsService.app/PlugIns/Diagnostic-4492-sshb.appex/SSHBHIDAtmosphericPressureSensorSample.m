@interface SSHBHIDAtmosphericPressureSensorSample
- (NSString)description;
- (double)temperature;
- (double)timestamp;
- (float)level;
- (id)csv;
- (unsigned)sequence;
- (void)setLevel:(float)a3;
- (void)setSequence:(unsigned int)a3;
- (void)setTemperature:(double)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation SSHBHIDAtmosphericPressureSensorSample

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithString:v5];

  [(SSHBHIDAtmosphericPressureSensorSample *)self timestamp];
  [v6 appendFormat:@"\nt: %f" v7];
  [(SSHBHIDAtmosphericPressureSensorSample *)self level];
  [v6 appendFormat:@"\nlevel: %f" v8];
  [v6 appendFormat:@"\nsequence: %u" [self sequence]];
  [(SSHBHIDAtmosphericPressureSensorSample *)self temperature];
  [v6 appendFormat:@"\ntemperature: %f", v9];

  return (NSString *)v6;
}

- (id)csv
{
  [(SSHBHIDAtmosphericPressureSensorSample *)self timestamp];
  uint64_t v4 = v3;
  [(SSHBHIDAtmosphericPressureSensorSample *)self level];
  double v6 = v5;
  uint64_t v7 = [(SSHBHIDAtmosphericPressureSensorSample *)self sequence];
  [(SSHBHIDAtmosphericPressureSensorSample *)self temperature];
  return +[NSString stringWithFormat:@"%f,%f,%u,%f", v4, *(void *)&v6, v7, v8];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (float)level
{
  return self->_level;
}

- (void)setLevel:(float)a3
{
  self->_level = a3;
}

- (unsigned)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unsigned int)a3
{
  self->_sequence = a3;
}

- (double)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(double)a3
{
  self->_temperature = a3;
}

@end