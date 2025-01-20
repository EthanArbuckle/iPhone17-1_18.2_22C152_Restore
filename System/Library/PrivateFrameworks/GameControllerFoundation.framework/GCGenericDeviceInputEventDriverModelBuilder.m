@interface GCGenericDeviceInputEventDriverModelBuilder
+ (Class)modelClass;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceInputEventDriverModelBuilder)init;
- (NSSet)gamepadEventFields;
- (id)build;
- (unint64_t)hash;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setGamepadEventFields:(id)a3;
@end

@implementation GCGenericDeviceInputEventDriverModelBuilder

- (GCGenericDeviceInputEventDriverModelBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceInputEventDriverModelBuilder;
  return [(GCGenericDeviceInputEventDriverModelBuilder *)&v3 init];
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4 = [a3 gamepadEventFields];
  [(GCGenericDeviceInputEventDriverModelBuilder *)self setGamepadEventFields:v4];
}

- (void)reset
{
}

- (id)build
{
  id v4 = objc_alloc((Class)[(id)objc_opt_class() modelClass]);
  v5 = [(GCGenericDeviceInputEventDriverModelBuilder *)self gamepadEventFields];
  if (!v5)
  {
    v9 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v9 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceInputEventDriverModel.m" lineNumber:110 description:@"'gamepadEventFields' can not be nil"];
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
    v8.super_class = (Class)GCGenericDeviceInputEventDriverModelBuilder;
    unsigned __int8 v5 = [(GCGenericDeviceInputEventDriverModelBuilder *)&v8 isEqual:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (NSSet)gamepadEventFields
{
  return self->_gamepadEventFields;
}

- (void)setGamepadEventFields:(id)a3
{
}

- (void).cxx_destruct
{
}

@end