@interface SSHBHIDTemperatureSensorSample
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (float)temperature;
- (id)csv;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setTemperature:(float)a3;
@end

@implementation SSHBHIDTemperatureSensorSample

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithString:v5];

  v7 = [(SSHBHIDTemperatureSensorSample *)self identifier];
  [v6 appendFormat:@"\nidentifier: %@", v7];

  v8 = [(SSHBHIDTemperatureSensorSample *)self name];
  [v6 appendFormat:@"\nname: %@", v8];

  [(SSHBHIDTemperatureSensorSample *)self temperature];
  [v6 appendFormat:@"\ntemperature: %f", v9];

  return (NSString *)v6;
}

- (id)csv
{
  id v3 = [(SSHBHIDTemperatureSensorSample *)self identifier];
  v4 = [(SSHBHIDTemperatureSensorSample *)self name];
  [(SSHBHIDTemperatureSensorSample *)self temperature];
  id v6 = +[NSString stringWithFormat:@"%@,%@,%f", v3, v4, v5];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (float)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(float)a3
{
  self->_temperature = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end