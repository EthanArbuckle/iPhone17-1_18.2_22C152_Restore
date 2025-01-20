@interface GCGenericDeviceDataConstantExpressionModelBuilder
+ (Class)modelClass;
- (GCGenericDeviceDataConstantExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (double)value;
- (id)build;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setValue:(double)a3;
@end

@implementation GCGenericDeviceDataConstantExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GCGenericDeviceDataConstantExpressionModelBuilder;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v7 initializeWithModel:v4];
  objc_msgSend(v4, "value", v7.receiver, v7.super_class);
  double v6 = v5;

  [(GCGenericDeviceDataConstantExpressionModelBuilder *)self setValue:v6];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataConstantExpressionModelBuilder;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v3 reset];
  [(GCGenericDeviceDataConstantExpressionModelBuilder *)self setValue:0.0];
}

- (id)build
{
  v6.receiver = self;
  v6.super_class = (Class)GCGenericDeviceDataConstantExpressionModelBuilder;
  objc_super v3 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v6 build];
  [(GCGenericDeviceDataConstantExpressionModelBuilder *)self value];
  v3[1] = v4;

  return v3;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (GCGenericDeviceDataConstantExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GCGenericDeviceDataConstantExpressionModelBuilder;
  objc_super v7 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v16 initWithDictionaryRepresentation:v6 error:a4];
  if (!v7)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_4;
  }
  id v15 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"Value", objc_opt_class(), &v15);
  id v9 = v15;
  if (!v8)
  {
    if (a4)
    {
      v17[0] = NSLocalizedDescriptionKey;
      v12 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v18[0] = v12;
      v17[1] = NSLocalizedFailureReasonErrorKey;
      v13 = [v9 localizedFailureReason];
      v18[1] = v13;
      v14 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_8;
  }
  [v8 doubleValue];
  -[GCGenericDeviceDataConstantExpressionModelBuilder setValue:](v7, "setValue:");

  v10 = v7;
LABEL_4:

  return v10;
}

@end