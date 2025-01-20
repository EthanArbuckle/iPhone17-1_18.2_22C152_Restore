@interface SSHBHIDCurrentSensorSample
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (float)current;
- (id)csv;
- (void)setCurrent:(float)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SSHBHIDCurrentSensorSample

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithString:v5];

  v7 = [(SSHBHIDCurrentSensorSample *)self identifier];
  [v6 appendFormat:@"\nidentifier: %@", v7];

  v8 = [(SSHBHIDCurrentSensorSample *)self name];
  [v6 appendFormat:@"\nname: %@", v8];

  [(SSHBHIDCurrentSensorSample *)self current];
  [v6 appendFormat:@"\ncurrent: %f" v9];

  return (NSString *)v6;
}

- (id)csv
{
  id v3 = [(SSHBHIDCurrentSensorSample *)self identifier];
  v4 = [(SSHBHIDCurrentSensorSample *)self name];
  [(SSHBHIDCurrentSensorSample *)self current];
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

- (float)current
{
  return self->_current;
}

- (void)setCurrent:(float)a3
{
  self->_current = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end