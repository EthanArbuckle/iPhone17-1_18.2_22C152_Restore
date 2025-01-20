@interface SSHBHIDHumiditySensorSample
- (NSString)description;
- (double)humidity;
- (double)timestamp;
- (id)csv;
- (unsigned)sequence;
- (void)setHumidity:(double)a3;
- (void)setSequence:(unsigned int)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation SSHBHIDHumiditySensorSample

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithString:v5];

  [(SSHBHIDHumiditySensorSample *)self timestamp];
  [v6 appendFormat:@"\nt: %f" v7];
  [v6 appendFormat:@"\nsequence: %u" , [self sequence]];
  [(SSHBHIDHumiditySensorSample *)self humidity];
  [v6 appendFormat:@"\nhumidity: %f" v8];

  return (NSString *)v6;
}

- (id)csv
{
  [(SSHBHIDHumiditySensorSample *)self timestamp];
  uint64_t v4 = v3;
  uint64_t v5 = [(SSHBHIDHumiditySensorSample *)self sequence];
  [(SSHBHIDHumiditySensorSample *)self humidity];
  return +[NSString stringWithFormat:@"%f,%u,%f", v4, v5, v6];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unsigned)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unsigned int)a3
{
  self->_sequence = a3;
}

- (double)humidity
{
  return self->_humidity;
}

- (void)setHumidity:(double)a3
{
  self->_humidity = a3;
}

@end