@interface GCGenericDeviceRumbleActuatorModelBuilder
+ (Class)modelClass;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceRumbleActuatorModelBuilder)init;
- (NSString)name;
- (id)build;
- (unint64_t)hash;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setName:(id)a3;
@end

@implementation GCGenericDeviceRumbleActuatorModelBuilder

- (GCGenericDeviceRumbleActuatorModelBuilder)init
{
  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceRumbleActuatorModelBuilder;
  v2 = [(GCGenericDeviceRumbleActuatorModelBuilder *)&v4 init];
  [(GCGenericDeviceRumbleActuatorModelBuilder *)v2 reset];
  return v2;
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4 = [a3 name];
  [(GCGenericDeviceRumbleActuatorModelBuilder *)self setName:v4];
}

- (void)reset
{
}

- (id)build
{
  id v4 = objc_alloc((Class)[(id)objc_opt_class() modelClass]);
  v5 = [(GCGenericDeviceRumbleActuatorModelBuilder *)self name];
  if (!v5)
  {
    v9 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v9 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceRumbleActuatorModel.m" lineNumber:116 description:@"'name' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  return v4;
}

- (unint64_t)hash
{
  v2 = (void *)[(id)objc_opt_class() modelClass];

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = [v4 isEqual:self];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GCGenericDeviceRumbleActuatorModelBuilder;
    unsigned __int8 v5 = [(GCGenericDeviceRumbleActuatorModelBuilder *)&v8 isEqual:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end