@interface GCGenericDeviceRumbleOutputModelBuilder
+ (Class)modelClass;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceRumbleOutputModelBuilder)init;
- (NSArray)fields;
- (NSString)elementIdentifier;
- (id)build;
- (unint64_t)hash;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setElementIdentifier:(id)a3;
- (void)setFields:(id)a3;
@end

@implementation GCGenericDeviceRumbleOutputModelBuilder

- (GCGenericDeviceRumbleOutputModelBuilder)init
{
  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceRumbleOutputModelBuilder;
  v2 = [(GCGenericDeviceRumbleOutputModelBuilder *)&v4 init];
  [(GCGenericDeviceRumbleOutputModelBuilder *)v2 reset];
  return v2;
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 elementIdentifier];
  [(GCGenericDeviceRumbleOutputModelBuilder *)self setElementIdentifier:v5];

  id v6 = [v4 fields];

  [(GCGenericDeviceRumbleOutputModelBuilder *)self setFields:v6];
}

- (void)reset
{
  [(GCGenericDeviceRumbleOutputModelBuilder *)self setElementIdentifier:0];

  [(GCGenericDeviceRumbleOutputModelBuilder *)self setFields:0];
}

- (id)build
{
  id v4 = objc_alloc((Class)[(id)objc_opt_class() modelClass]);
  v5 = [(GCGenericDeviceRumbleOutputModelBuilder *)self elementIdentifier];
  if (!v5)
  {
    v12 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v12 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceRumbleOutputModel.m" lineNumber:129 description:@"'elementIdentifier' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  v8 = [(GCGenericDeviceRumbleOutputModelBuilder *)self fields];
  if (!v8)
  {
    v13 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v13 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceRumbleOutputModel.m" lineNumber:133 description:@"'fields' can not be nil"];
  }
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

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
    v8.super_class = (Class)GCGenericDeviceRumbleOutputModelBuilder;
    unsigned __int8 v5 = [(GCGenericDeviceRumbleOutputModelBuilder *)&v8 isEqual:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)setElementIdentifier:(id)a3
{
}

- (NSArray)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);

  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

@end