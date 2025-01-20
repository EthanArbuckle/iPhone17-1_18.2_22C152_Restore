@interface GCGenericDeviceDriverPropertyModelBuilder
+ (Class)modelClass;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModel)valueExpression;
- (GCGenericDeviceDriverPropertyModelBuilder)init;
- (NSString)name;
- (id)build;
- (unint64_t)hash;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setName:(id)a3;
- (void)setValueExpression:(id)a3;
@end

@implementation GCGenericDeviceDriverPropertyModelBuilder

- (GCGenericDeviceDriverPropertyModelBuilder)init
{
  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceDriverPropertyModelBuilder;
  v2 = [(GCGenericDeviceDriverPropertyModelBuilder *)&v4 init];
  [(GCGenericDeviceDriverPropertyModelBuilder *)v2 reset];
  return v2;
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  [(GCGenericDeviceDriverPropertyModelBuilder *)self setName:v5];

  id v6 = [v4 valueExpression];

  [(GCGenericDeviceDriverPropertyModelBuilder *)self setValueExpression:v6];
}

- (void)reset
{
  [(GCGenericDeviceDriverPropertyModelBuilder *)self setName:0];

  [(GCGenericDeviceDriverPropertyModelBuilder *)self setValueExpression:0];
}

- (id)build
{
  id v4 = objc_alloc((Class)[(id)objc_opt_class() modelClass]);
  v5 = [(GCGenericDeviceDriverPropertyModelBuilder *)self name];
  if (!v5)
  {
    v12 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v12 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDriverPropertyModel.m" lineNumber:122 description:@"'name' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  v8 = [(GCGenericDeviceDriverPropertyModelBuilder *)self valueExpression];
  if (!v8)
  {
    v13 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v13 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDriverPropertyModel.m" lineNumber:126 description:@"'valueExpression' can not be nil"];
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
    v8.super_class = (Class)GCGenericDeviceDriverPropertyModelBuilder;
    unsigned __int8 v5 = [(GCGenericDeviceDriverPropertyModelBuilder *)&v8 isEqual:v4];
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

- (GCGenericDeviceDataProcessorExpressionModel)valueExpression
{
  return self->_valueExpression;
}

- (void)setValueExpression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueExpression, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end