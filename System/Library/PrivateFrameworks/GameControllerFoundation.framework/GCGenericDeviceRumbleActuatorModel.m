@interface GCGenericDeviceRumbleActuatorModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceRumbleActuatorModel)init;
- (GCGenericDeviceRumbleActuatorModel)initWithCoder:(id)a3;
- (NSString)name;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceRumbleActuatorModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceRumbleActuatorModel)init
{
  return 0;
}

- (GCGenericDeviceRumbleActuatorModel)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceRumbleActuatorModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceRumbleActuatorModel *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"name", v8.receiver, v8.super_class);

  name = v4->_name;
  v4->_name = (NSString *)v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GCGenericDeviceRumbleActuatorModel *)self name];
  [v4 encodeObject:v5 forKey:@"name"];
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([(GCGenericDeviceRumbleActuatorModel *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
LABEL_7:
      char v7 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceRumbleActuatorModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_7;
    }
  }
  id v5 = [(GCGenericDeviceRumbleActuatorModel *)self name];
  v6 = [v4 name];
  char v7 = [v5 isEqual:v6];

LABEL_8:
  return v7;
}

+ (id)description
{
  return @"Rumble Actuator";
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(GCGenericDeviceRumbleActuatorModel *)self name];
  v6 = +[NSString stringWithFormat:@"<%@ %p> {\n\t name = %@\n}", v4, self, v5];

  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = objc_opt_new();
  v15[0] = 0;
  objc_super v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"Name", objc_opt_class(), v15);
  id v9 = v15[0];
  if (v8)
  {
    [v7 setName:v8];

    v10 = [v7 build];
  }
  else
  {
    if (a4)
    {
      v16[0] = NSLocalizedDescriptionKey;
      v12 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v17[0] = v12;
      v16[1] = NSLocalizedFailureReasonErrorKey;
      v13 = [v9 localizedFailureReason];
      v17[1] = v13;
      v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = 0;
  }

  return v10;
}

@end