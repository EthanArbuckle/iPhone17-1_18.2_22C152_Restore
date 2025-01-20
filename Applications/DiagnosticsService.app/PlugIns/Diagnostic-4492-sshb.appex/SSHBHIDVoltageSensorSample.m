@interface SSHBHIDVoltageSensorSample
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (float)voltage;
- (id)csv;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setVoltage:(float)a3;
@end

@implementation SSHBHIDVoltageSensorSample

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithString:v5];

  v7 = [(SSHBHIDVoltageSensorSample *)self identifier];
  [v6 appendFormat:@"\nidentifier: %@", v7];

  v8 = [(SSHBHIDVoltageSensorSample *)self name];
  [v6 appendFormat:@"\nname: %@", v8];

  [(SSHBHIDVoltageSensorSample *)self voltage];
  [v6 appendFormat:@"\nvoltage: %f" v9];

  return (NSString *)v6;
}

- (id)csv
{
  id v3 = [(SSHBHIDVoltageSensorSample *)self identifier];
  v4 = [(SSHBHIDVoltageSensorSample *)self name];
  [(SSHBHIDVoltageSensorSample *)self voltage];
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

- (float)voltage
{
  return self->_voltage;
}

- (void)setVoltage:(float)a3
{
  self->_voltage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end