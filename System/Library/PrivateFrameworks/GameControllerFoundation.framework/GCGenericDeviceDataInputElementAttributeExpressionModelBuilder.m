@interface GCGenericDeviceDataInputElementAttributeExpressionModelBuilder
+ (Class)modelClass;
- (GCGenericDeviceDataInputElementAttributeExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (NSString)attribute;
- (NSString)elementIdentifier;
- (id)build;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setAttribute:(id)a3;
- (void)setElementIdentifier:(id)a3;
@end

@implementation GCGenericDeviceDataInputElementAttributeExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModelBuilder;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v7 initializeWithModel:v4];
  v5 = objc_msgSend(v4, "elementIdentifier", v7.receiver, v7.super_class);
  [(GCGenericDeviceDataInputElementAttributeExpressionModelBuilder *)self setElementIdentifier:v5];

  v6 = [v4 attribute];

  [(GCGenericDeviceDataInputElementAttributeExpressionModelBuilder *)self setAttribute:v6];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModelBuilder;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v3 reset];
  [(GCGenericDeviceDataInputElementAttributeExpressionModelBuilder *)self setElementIdentifier:0];
  [(GCGenericDeviceDataInputElementAttributeExpressionModelBuilder *)self setAttribute:0];
}

- (id)build
{
  v14.receiver = self;
  v14.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModelBuilder;
  id v4 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v14 build];
  v5 = [(GCGenericDeviceDataInputElementAttributeExpressionModelBuilder *)self elementIdentifier];
  if (!v5)
  {
    v12 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v12 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataInputElementAttributeExpressionModel.m" lineNumber:98 description:@"'elementIdentifier' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  objc_super v7 = (void *)v4[1];
  v4[1] = v6;

  v8 = [(GCGenericDeviceDataInputElementAttributeExpressionModelBuilder *)self attribute];
  if (!v8)
  {
    v13 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v13 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataInputElementAttributeExpressionModel.m" lineNumber:102 description:@"'attribute' can not be nil"];
  }
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  return v4;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)setElementIdentifier:(id)a3
{
}

- (NSString)attribute
{
  return self->_attribute;
}

- (void)setAttribute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribute, 0);

  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

- (GCGenericDeviceDataInputElementAttributeExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModelBuilder;
  objc_super v7 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v20 initWithDictionaryRepresentation:v6 error:a4];
  if (!v7) {
    goto LABEL_12;
  }
  id v19 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"ElementIdentifier", objc_opt_class(), &v19);
  id v9 = v19;
  if (!v8)
  {
    if (a4)
    {
      v23[0] = NSLocalizedDescriptionKey;
      v13 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v24[0] = v13;
      v23[1] = NSLocalizedFailureReasonErrorKey;
      objc_super v14 = [v9 localizedFailureReason];
      v24[1] = v14;
      v15 = v24;
      v16 = v23;
LABEL_10:
      v17 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v16 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_11:

LABEL_12:
    v11 = 0;
    goto LABEL_5;
  }
  [(GCGenericDeviceDataInputElementAttributeExpressionModelBuilder *)v7 setElementIdentifier:v8];

  id v18 = 0;
  v10 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"Attribute", objc_opt_class(), &v18);
  id v9 = v18;
  if (!v10)
  {
    if (a4)
    {
      v21[0] = NSLocalizedDescriptionKey;
      v13 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v22[0] = v13;
      v21[1] = NSLocalizedFailureReasonErrorKey;
      objc_super v14 = [v9 localizedFailureReason];
      v22[1] = v14;
      v15 = v22;
      v16 = v21;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  [(GCGenericDeviceDataInputElementAttributeExpressionModelBuilder *)v7 setAttribute:v10];

  v11 = v7;
LABEL_5:

  return v11;
}

@end