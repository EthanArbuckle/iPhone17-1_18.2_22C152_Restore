@interface GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder
+ (Class)modelClass;
- (GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (NSString)motorName;
- (id)build;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setMotorName:(id)a3;
@end

@implementation GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v6 initializeWithModel:v4];
  v5 = objc_msgSend(v4, "motorName", v6.receiver, v6.super_class);

  [(GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder *)self setMotorName:v5];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v3 reset];
  [(GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder *)self setMotorName:0];
}

- (id)build
{
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder;
  id v4 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v10 build];
  v5 = [(GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder *)self motorName];
  if (!v5)
  {
    v9 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v9 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataRumbleMotorValueExpressionModel.m" lineNumber:89 description:@"'motorName' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  return v4;
}

- (NSString)motorName
{
  return self->_motorName;
}

- (void)setMotorName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder;
  v7 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v16 initWithDictionaryRepresentation:v6 error:a4];
  if (!v7)
  {
LABEL_8:
    objc_super v10 = 0;
    goto LABEL_4;
  }
  id v15 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"MotorName", objc_opt_class(), &v15);
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
  [(GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder *)v7 setMotorName:v8];

  objc_super v10 = v7;
LABEL_4:

  return v10;
}

@end