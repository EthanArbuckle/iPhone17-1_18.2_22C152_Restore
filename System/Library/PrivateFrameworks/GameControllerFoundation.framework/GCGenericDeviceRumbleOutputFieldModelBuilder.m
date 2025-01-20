@interface GCGenericDeviceRumbleOutputFieldModelBuilder
+ (Class)modelClass;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModel)offsetExpression;
- (GCGenericDeviceDataProcessorExpressionModel)sizeExpression;
- (GCGenericDeviceDataProcessorExpressionModel)valueExpression;
- (GCGenericDeviceRumbleOutputFieldModelBuilder)init;
- (id)build;
- (unint64_t)hash;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setOffsetExpression:(id)a3;
- (void)setSizeExpression:(id)a3;
- (void)setValueExpression:(id)a3;
@end

@implementation GCGenericDeviceRumbleOutputFieldModelBuilder

- (GCGenericDeviceRumbleOutputFieldModelBuilder)init
{
  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceRumbleOutputFieldModelBuilder;
  v2 = [(GCGenericDeviceRumbleOutputFieldModelBuilder *)&v4 init];
  [(GCGenericDeviceRumbleOutputFieldModelBuilder *)v2 reset];
  return v2;
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 valueExpression];
  [(GCGenericDeviceRumbleOutputFieldModelBuilder *)self setValueExpression:v5];

  v6 = [v4 offsetExpression];
  [(GCGenericDeviceRumbleOutputFieldModelBuilder *)self setOffsetExpression:v6];

  id v7 = [v4 sizeExpression];

  [(GCGenericDeviceRumbleOutputFieldModelBuilder *)self setSizeExpression:v7];
}

- (void)reset
{
  [(GCGenericDeviceRumbleOutputFieldModelBuilder *)self setValueExpression:0];
  [(GCGenericDeviceRumbleOutputFieldModelBuilder *)self setOffsetExpression:0];

  [(GCGenericDeviceRumbleOutputFieldModelBuilder *)self setSizeExpression:0];
}

- (id)build
{
  id v4 = objc_alloc((Class)[(id)objc_opt_class() modelClass]);
  v5 = [(GCGenericDeviceRumbleOutputFieldModelBuilder *)self valueExpression];
  if (!v5)
  {
    v15 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v15 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceRumbleOutputFieldModel.m" lineNumber:127 description:@"'valueExpression' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  id v7 = (void *)v4[1];
  v4[1] = v6;

  v8 = [(GCGenericDeviceRumbleOutputFieldModelBuilder *)self offsetExpression];
  if (!v8)
  {
    v16 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v16 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceRumbleOutputFieldModel.m" lineNumber:131 description:@"'offsetExpression' can not be nil"];
  }
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = [(GCGenericDeviceRumbleOutputFieldModelBuilder *)self sizeExpression];
  if (!v11)
  {
    v17 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v17 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceRumbleOutputFieldModel.m" lineNumber:135 description:@"'sizeExpression' can not be nil"];
  }
  uint64_t v12 = [v11 copy];
  v13 = (void *)v4[3];
  v4[3] = v12;

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
    v8.super_class = (Class)GCGenericDeviceRumbleOutputFieldModelBuilder;
    unsigned __int8 v5 = [(GCGenericDeviceRumbleOutputFieldModelBuilder *)&v8 isEqual:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (GCGenericDeviceDataProcessorExpressionModel)valueExpression
{
  return self->_valueExpression;
}

- (void)setValueExpression:(id)a3
{
}

- (GCGenericDeviceDataProcessorExpressionModel)offsetExpression
{
  return self->_offsetExpression;
}

- (void)setOffsetExpression:(id)a3
{
}

- (GCGenericDeviceDataProcessorExpressionModel)sizeExpression
{
  return self->_sizeExpression;
}

- (void)setSizeExpression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeExpression, 0);
  objc_storeStrong((id *)&self->_offsetExpression, 0);

  objc_storeStrong((id *)&self->_valueExpression, 0);
}

@end