@interface GCGenericDeviceInputGamepadEventFieldModelBuilder
+ (Class)modelClass;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModel)sourceExpression;
- (GCGenericDeviceInputGamepadEventFieldModelBuilder)init;
- (id)build;
- (int64_t)extendedIndex;
- (unint64_t)hash;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setExtendedIndex:(int64_t)a3;
- (void)setSourceExpression:(id)a3;
@end

@implementation GCGenericDeviceInputGamepadEventFieldModelBuilder

- (GCGenericDeviceInputGamepadEventFieldModelBuilder)init
{
  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceInputGamepadEventFieldModelBuilder;
  v2 = [(GCGenericDeviceInputGamepadEventFieldModelBuilder *)&v4 init];
  [(GCGenericDeviceInputGamepadEventFieldModelBuilder *)v2 reset];
  return v2;
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4 = a3;
  -[GCGenericDeviceInputGamepadEventFieldModelBuilder setExtendedIndex:](self, "setExtendedIndex:", [v4 extendedIndex]);
  id v5 = [v4 sourceExpression];

  [(GCGenericDeviceInputGamepadEventFieldModelBuilder *)self setSourceExpression:v5];
}

- (void)reset
{
}

- (id)build
{
  v3 = objc_alloc((Class)[(id)objc_opt_class() modelClass]);
  v3[1] = [(GCGenericDeviceInputGamepadEventFieldModelBuilder *)self extendedIndex];
  id v4 = [(GCGenericDeviceInputGamepadEventFieldModelBuilder *)self sourceExpression];
  uint64_t v5 = [v4 copy];
  v6 = (void *)v3[2];
  v3[2] = v5;

  return v3;
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
    v8.super_class = (Class)GCGenericDeviceInputGamepadEventFieldModelBuilder;
    unsigned __int8 v5 = [(GCGenericDeviceInputGamepadEventFieldModelBuilder *)&v8 isEqual:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (int64_t)extendedIndex
{
  return self->_extendedIndex;
}

- (void)setExtendedIndex:(int64_t)a3
{
  self->_extendedIndex = a3;
}

- (GCGenericDeviceDataProcessorExpressionModel)sourceExpression
{
  return self->_sourceExpression;
}

- (void)setSourceExpression:(id)a3
{
}

- (void).cxx_destruct
{
}

@end