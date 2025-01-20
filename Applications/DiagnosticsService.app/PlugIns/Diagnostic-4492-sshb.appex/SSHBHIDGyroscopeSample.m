@interface SSHBHIDGyroscopeSample
- (NSString)description;
- (double)temperature;
- (id)csv;
- (void)setTemperature:(double)a3;
@end

@implementation SSHBHIDGyroscopeSample

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithString:v5];

  v10.receiver = self;
  v10.super_class = (Class)SSHBHIDGyroscopeSample;
  v7 = [(SSHBHIDMotionSample *)&v10 description];
  [v6 appendFormat:@"\n%@", v7];

  [(SSHBHIDGyroscopeSample *)self temperature];
  [v6 appendFormat:@"\ntemperature: %f" v8];

  return (NSString *)v6;
}

- (id)csv
{
  v8.receiver = self;
  v8.super_class = (Class)SSHBHIDGyroscopeSample;
  id v3 = [(SSHBHIDMotionSample *)&v8 csv];
  [(SSHBHIDGyroscopeSample *)self temperature];
  v5 = +[NSString stringWithFormat:@",%f", v4];
  id v6 = [v3 stringByAppendingString:v5];

  return v6;
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