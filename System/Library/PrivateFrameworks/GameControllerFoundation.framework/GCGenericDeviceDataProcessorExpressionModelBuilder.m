@interface GCGenericDeviceDataProcessorExpressionModelBuilder
+ (Class)modelClass;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModelBuilder)init;
- (id)build;
- (unint64_t)hash;
@end

@implementation GCGenericDeviceDataProcessorExpressionModelBuilder

- (GCGenericDeviceDataProcessorExpressionModelBuilder)init
{
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class()) {
    [(GCGenericDeviceDataProcessorExpressionModelBuilder *)self doesNotRecognizeSelector:a2];
  }
  v7.receiver = self;
  v7.super_class = (Class)GCGenericDeviceDataProcessorExpressionModelBuilder;
  v5 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v7 init];
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)v5 reset];
  return v5;
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (id)build
{
  id v2 = objc_alloc((Class)[(id)objc_opt_class() modelClass]);

  return v2;
}

- (unint64_t)hash
{
  id v2 = (void *)[(id)objc_opt_class() modelClass];

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
    v8.super_class = (Class)GCGenericDeviceDataProcessorExpressionModelBuilder;
    unsigned __int8 v5 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v8 isEqual:v4];
  }
  BOOL v6 = v5;

  return v6;
}

@end