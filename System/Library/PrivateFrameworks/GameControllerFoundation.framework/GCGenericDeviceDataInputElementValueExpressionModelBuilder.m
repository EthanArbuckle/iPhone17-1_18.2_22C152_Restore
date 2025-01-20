@interface GCGenericDeviceDataInputElementValueExpressionModelBuilder
+ (Class)modelClass;
- (GCGenericDeviceDataInputElementValueExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (NSString)elementIdentifier;
- (id)build;
- (int64_t)scaleType;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setElementIdentifier:(id)a3;
- (void)setScaleType:(int64_t)a3;
@end

@implementation GCGenericDeviceDataInputElementValueExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModelBuilder;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v7 initializeWithModel:v4];
  v5 = objc_msgSend(v4, "elementIdentifier", v7.receiver, v7.super_class);
  [(GCGenericDeviceDataInputElementValueExpressionModelBuilder *)self setElementIdentifier:v5];

  uint64_t v6 = [v4 scaleType];
  [(GCGenericDeviceDataInputElementValueExpressionModelBuilder *)self setScaleType:v6];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModelBuilder;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v3 reset];
  [(GCGenericDeviceDataInputElementValueExpressionModelBuilder *)self setElementIdentifier:0];
  [(GCGenericDeviceDataInputElementValueExpressionModelBuilder *)self setScaleType:-2];
}

- (id)build
{
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModelBuilder;
  id v4 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v10 build];
  v5 = [(GCGenericDeviceDataInputElementValueExpressionModelBuilder *)self elementIdentifier];
  if (!v5)
  {
    v9 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v9 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataInputElementValueExpressionModel.m" lineNumber:119 description:@"'elementIdentifier' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  objc_super v7 = (void *)v4[1];
  v4[1] = v6;

  v4[2] = [(GCGenericDeviceDataInputElementValueExpressionModelBuilder *)self scaleType];

  return v4;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)setElementIdentifier:(id)a3
{
}

- (int64_t)scaleType
{
  return self->_scaleType;
}

- (void)setScaleType:(int64_t)a3
{
  self->_scaleType = a3;
}

- (void).cxx_destruct
{
}

- (GCGenericDeviceDataInputElementValueExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModelBuilder;
  objc_super v7 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v25 initWithDictionaryRepresentation:v6 error:a4];
  if (!v7) {
    goto LABEL_26;
  }
  id v24 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"ElementIdentifier", objc_opt_class(), &v24);
  id v9 = v24;
  if (!v8)
  {
    if (a4)
    {
      v30[0] = NSLocalizedDescriptionKey;
      v20 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v31[0] = v20;
      v30[1] = NSLocalizedFailureReasonErrorKey;
      v21 = [v9 localizedFailureReason];
      v31[1] = v21;
      v22 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_25;
  }
  [(GCGenericDeviceDataInputElementValueExpressionModelBuilder *)v7 setElementIdentifier:v8];

  id v23 = 0;
  objc_super v10 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"ScaleType", objc_opt_class(), &v23);
  id v11 = v23;
  id v9 = v11;
  if (!v10 && v11)
  {
    if (!a4) {
      goto LABEL_24;
    }
    v28[0] = NSLocalizedDescriptionKey;
    v15 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v29[0] = v15;
    v28[1] = NSLocalizedFailureReasonErrorKey;
    v16 = [v9 localizedFailureReason];
    v29[1] = v16;
    v17 = v29;
    v18 = v28;
LABEL_23:
    v19 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v18 count:2];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_24:
LABEL_25:

LABEL_26:
    v13 = 0;
    goto LABEL_20;
  }
  if (v10)
  {
    if ([v10 isEqualToString:@"Raw"])
    {
      uint64_t v12 = -3;
LABEL_18:
      [(GCGenericDeviceDataInputElementValueExpressionModelBuilder *)v7 setScaleType:v12];
      goto LABEL_19;
    }
    if ([v10 isEqualToString:@"None"])
    {
      uint64_t v12 = -2;
      goto LABEL_18;
    }
    if ([v10 isEqualToString:@"Logical"])
    {
      uint64_t v12 = -1;
      goto LABEL_18;
    }
    if ([v10 isEqualToString:@"Physical"])
    {
      uint64_t v12 = 1;
      goto LABEL_18;
    }
    if ([v10 isEqualToString:@"Exponent"])
    {
      uint64_t v12 = 2;
      goto LABEL_18;
    }
    if ([v10 isEqualToString:@"Calibrated"])
    {
      uint64_t v12 = 0;
      goto LABEL_18;
    }
    if (!a4) {
      goto LABEL_24;
    }
    v26[0] = NSLocalizedDescriptionKey;
    v15 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v27[0] = v15;
    v26[1] = NSLocalizedFailureReasonErrorKey;
    v16 = +[NSString stringWithFormat:@"'%@' is not a valid '%@'.", v10, @"ScaleType"];
    v27[1] = v16;
    v17 = v27;
    v18 = v26;
    goto LABEL_23;
  }
LABEL_19:

  v13 = v7;
LABEL_20:

  return v13;
}

@end