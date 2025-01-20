@interface GCGenericDeviceDataElementExistsExpressionModelBuilder
+ (Class)modelClass;
- (GCGenericDeviceDataElementExistsExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (GCGenericDeviceDataProcessorExpressionModel)falseExpression;
- (GCGenericDeviceDataProcessorExpressionModel)trueExpression;
- (NSString)elementIdentifier;
- (id)build;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setElementIdentifier:(id)a3;
- (void)setFalseExpression:(id)a3;
- (void)setTrueExpression:(id)a3;
@end

@implementation GCGenericDeviceDataElementExistsExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModelBuilder;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v8 initializeWithModel:v4];
  v5 = objc_msgSend(v4, "elementIdentifier", v8.receiver, v8.super_class);
  [(GCGenericDeviceDataElementExistsExpressionModelBuilder *)self setElementIdentifier:v5];

  v6 = [v4 trueExpression];
  [(GCGenericDeviceDataElementExistsExpressionModelBuilder *)self setTrueExpression:v6];

  v7 = [v4 falseExpression];

  [(GCGenericDeviceDataElementExistsExpressionModelBuilder *)self setFalseExpression:v7];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModelBuilder;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v3 reset];
  [(GCGenericDeviceDataElementExistsExpressionModelBuilder *)self setElementIdentifier:0];
}

- (id)build
{
  v18.receiver = self;
  v18.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModelBuilder;
  id v4 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v18 build];
  v5 = [(GCGenericDeviceDataElementExistsExpressionModelBuilder *)self elementIdentifier];
  if (!v5)
  {
    v15 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v15 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataElementExistsExpressionModel.m" lineNumber:110 description:@"'elementIdentifier' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  objc_super v8 = [(GCGenericDeviceDataElementExistsExpressionModelBuilder *)self trueExpression];
  if (!v8)
  {
    v16 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v16 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataElementExistsExpressionModel.m" lineNumber:114 description:@"'trueExpression' can not be nil"];
  }
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = [(GCGenericDeviceDataElementExistsExpressionModelBuilder *)self falseExpression];
  if (!v11)
  {
    v17 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v17 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataElementExistsExpressionModel.m" lineNumber:118 description:@"'falseExpression' can not be nil"];
  }
  uint64_t v12 = [v11 copy];
  v13 = (void *)v4[3];
  v4[3] = v12;

  return v4;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)setElementIdentifier:(id)a3
{
}

- (GCGenericDeviceDataProcessorExpressionModel)trueExpression
{
  return self->_trueExpression;
}

- (void)setTrueExpression:(id)a3
{
}

- (GCGenericDeviceDataProcessorExpressionModel)falseExpression
{
  return self->_falseExpression;
}

- (void)setFalseExpression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseExpression, 0);
  objc_storeStrong((id *)&self->_trueExpression, 0);

  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

- (GCGenericDeviceDataElementExistsExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v50.receiver = self;
  v50.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModelBuilder;
  v7 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v50 initWithDictionaryRepresentation:v6 error:a4];
  if (!v7) {
    goto LABEL_44;
  }
  id v49 = 0;
  objc_super v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"ElementIdentifier", objc_opt_class(), &v49);
  id v9 = v49;
  if (!v8)
  {
    if (a4)
    {
      v59[0] = NSLocalizedDescriptionKey;
      v17 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v60[0] = v17;
      v59[1] = NSLocalizedFailureReasonErrorKey;
      objc_super v18 = [v9 localizedFailureReason];
      v60[1] = v18;
      v19 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_44;
  }
  [(GCGenericDeviceDataElementExistsExpressionModelBuilder *)v7 setElementIdentifier:v8];

  id v48 = 0;
  v10 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"TrueExpression", objc_opt_class(), &v48);
  id v11 = v48;
  if (!v10)
  {
    if (a4)
    {
      v57[0] = NSLocalizedDescriptionKey;
      v20 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v58[0] = v20;
      v57[1] = NSLocalizedFailureReasonErrorKey;
      v21 = [v11 localizedFailureReason];
      v58[1] = v21;
      v22 = v58;
      v23 = v57;
LABEL_26:
      v35 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v35);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_27:

LABEL_44:
    v15 = 0;
    goto LABEL_8;
  }
  id v47 = 0;
  uint64_t v12 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v10 error:&v47];
  id v13 = v47;

  if (!v12)
  {
    if (a4)
    {
      v24 = a4;
      v55[0] = NSLocalizedDescriptionKey;
      uint64_t v25 = [v13 localizedDescription];
      v26 = (void *)v25;
      if (!v25)
      {
        uint64_t v25 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"TrueExpression"];
      }
      v43 = (void *)v25;
      v56[0] = v25;
      v55[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v27 = [v13 localizedFailureReason];
      v28 = @"Invalid 'Expression' definition.";
      v44 = (void *)v27;
      if (v27) {
        v28 = (__CFString *)v27;
      }
      v56[1] = v28;
      v55[2] = NSUnderlyingErrorKey;
      uint64_t v29 = (uint64_t)v13;
      if (!v13)
      {
        uint64_t v29 = +[NSNull null];
      }
      v42 = (void *)v29;
      v56[2] = v29;
      v55[3] = @"GCFailingKeyPathErrorKey";
      v30 = objc_msgSend(v13, "gc_failingKeyPath");
      v31 = v30;
      if (!v30) {
        v30 = &__NSArray0__struct;
      }
      v32 = [v30 arrayByAddingObject:@"TrueExpression"];
      v56[3] = v32;
      v33 = v56;
      v34 = v55;
      goto LABEL_38;
    }
LABEL_43:

    goto LABEL_44;
  }
  [(GCGenericDeviceDataElementExistsExpressionModelBuilder *)v7 setTrueExpression:v12];

  id v46 = 0;
  v10 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"FalseExpression", objc_opt_class(), &v46);
  id v11 = v46;
  if (!v10)
  {
    if (a4)
    {
      v53[0] = NSLocalizedDescriptionKey;
      v20 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v54[0] = v20;
      v53[1] = NSLocalizedFailureReasonErrorKey;
      v21 = [v11 localizedFailureReason];
      v54[1] = v21;
      v22 = v54;
      v23 = v53;
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  id v45 = 0;
  v14 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v10 error:&v45];
  id v13 = v45;

  if (!v14)
  {
    if (a4)
    {
      v24 = a4;
      v51[0] = NSLocalizedDescriptionKey;
      uint64_t v36 = [v13 localizedDescription];
      v26 = (void *)v36;
      if (!v36)
      {
        uint64_t v36 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"FalseExpression"];
      }
      v43 = (void *)v36;
      v52[0] = v36;
      v51[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v37 = [v13 localizedFailureReason];
      v38 = @"Invalid 'Expression' definition.";
      v44 = (void *)v37;
      if (v37) {
        v38 = (__CFString *)v37;
      }
      v52[1] = v38;
      v51[2] = NSUnderlyingErrorKey;
      uint64_t v39 = (uint64_t)v13;
      if (!v13)
      {
        uint64_t v39 = +[NSNull null];
      }
      v42 = (void *)v39;
      v52[2] = v39;
      v51[3] = @"GCFailingKeyPathErrorKey";
      v40 = objc_msgSend(v13, "gc_failingKeyPath");
      v31 = v40;
      if (!v40) {
        v40 = &__NSArray0__struct;
      }
      v32 = [v40 arrayByAddingObject:@"FalseExpression"];
      v52[3] = v32;
      v33 = v52;
      v34 = v51;
LABEL_38:
      v41 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v34 count:4];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v41);
      id *v24 = (id)objc_claimAutoreleasedReturnValue();

      if (!v13) {
      if (!v26)
      }

      goto LABEL_43;
    }
    goto LABEL_43;
  }
  [(GCGenericDeviceDataElementExistsExpressionModelBuilder *)v7 setFalseExpression:v14];

  v15 = v7;
LABEL_8:

  return v15;
}

@end