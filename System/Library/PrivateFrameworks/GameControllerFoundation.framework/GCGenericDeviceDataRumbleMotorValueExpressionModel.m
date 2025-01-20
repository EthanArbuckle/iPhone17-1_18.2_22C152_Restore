@interface GCGenericDeviceDataRumbleMotorValueExpressionModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataRumbleMotorValueExpressionModel)initWithCoder:(id)a3;
- (NSString)motorName;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceDataRumbleMotorValueExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataRumbleMotorValueExpressionModel)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceDataProcessorExpressionModel *)&v8 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"motorName", v8.receiver, v8.super_class);

  motorName = v4->_motorName;
  v4->_motorName = (NSString *)v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModel;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModel *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(GCGenericDeviceDataRumbleMotorValueExpressionModel *)self motorName];
  [v4 encodeObject:v5 forKey:@"motorName"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModel;
  if ([(GCGenericDeviceDataProcessorExpressionModel *)&v9 isEqual:v4])
  {
    uint64_t v5 = [(GCGenericDeviceDataRumbleMotorValueExpressionModel *)self motorName];
    objc_super v6 = [v4 motorName];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)description
{
  return @"Rumble Motor Value Expression";
}

- (id)description
{
  v2 = [(GCGenericDeviceDataRumbleMotorValueExpressionModel *)self motorName];
  id v3 = +[NSString stringWithFormat:@"(rumble-motor-value %@)", v2];

  return v3;
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(GCGenericDeviceDataRumbleMotorValueExpressionModel *)self motorName];
  objc_super v6 = +[NSString stringWithFormat:@"<%@ %p> {\n\t motorName = %@\n}", v4, self, v5];

  return v6;
}

- (NSString)motorName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end