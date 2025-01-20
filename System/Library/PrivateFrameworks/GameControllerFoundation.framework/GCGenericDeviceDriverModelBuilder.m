@interface GCGenericDeviceDriverModelBuilder
+ (Class)modelClass;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDriverModelBuilder)init;
- (GCGenericDeviceDriverPropertiesModel)properties;
- (GCGenericDeviceInputEventDriverModel)input;
- (GCGenericDeviceRumbleModel)rumble;
- (NSSet)elements;
- (id)build;
- (unint64_t)hash;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setElements:(id)a3;
- (void)setInput:(id)a3;
- (void)setProperties:(id)a3;
- (void)setRumble:(id)a3;
@end

@implementation GCGenericDeviceDriverModelBuilder

- (GCGenericDeviceDriverModelBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDriverModelBuilder;
  return [(GCGenericDeviceDriverModelBuilder *)&v3 init];
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 elements];
  [(GCGenericDeviceDriverModelBuilder *)self setElements:v5];

  v6 = [v4 properties];
  [(GCGenericDeviceDriverModelBuilder *)self setProperties:v6];

  v7 = [v4 input];
  [(GCGenericDeviceDriverModelBuilder *)self setInput:v7];

  id v8 = [v4 rumble];

  [(GCGenericDeviceDriverModelBuilder *)self setRumble:v8];
}

- (void)reset
{
  [(GCGenericDeviceDriverModelBuilder *)self setElements:0];
  [(GCGenericDeviceDriverModelBuilder *)self setProperties:0];
  [(GCGenericDeviceDriverModelBuilder *)self setInput:0];

  [(GCGenericDeviceDriverModelBuilder *)self setRumble:0];
}

- (id)build
{
  id v4 = objc_alloc((Class)[(id)objc_opt_class() modelClass]);
  v5 = [(GCGenericDeviceDriverModelBuilder *)self elements];
  if (!v5)
  {
    v18 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v18 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDriverModel.m" lineNumber:140 description:@"'elements' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  id v8 = [(GCGenericDeviceDriverModelBuilder *)self properties];
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = [(GCGenericDeviceDriverModelBuilder *)self input];
  uint64_t v12 = [v11 copy];
  v13 = (void *)v4[3];
  v4[3] = v12;

  v14 = [(GCGenericDeviceDriverModelBuilder *)self rumble];
  uint64_t v15 = [v14 copy];
  v16 = (void *)v4[4];
  v4[4] = v15;

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
    v8.super_class = (Class)GCGenericDeviceDriverModelBuilder;
    unsigned __int8 v5 = [(GCGenericDeviceDriverModelBuilder *)&v8 isEqual:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (NSSet)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (GCGenericDeviceDriverPropertiesModel)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (GCGenericDeviceInputEventDriverModel)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (GCGenericDeviceRumbleModel)rumble
{
  return self->_rumble;
}

- (void)setRumble:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rumble, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_elements, 0);
}

@end