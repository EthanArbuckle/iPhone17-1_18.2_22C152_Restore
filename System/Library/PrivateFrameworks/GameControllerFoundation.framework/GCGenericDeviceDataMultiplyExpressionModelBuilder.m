@interface GCGenericDeviceDataMultiplyExpressionModelBuilder
+ (Class)modelClass;
- (GCGenericDeviceDataMultiplyExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (GCGenericDeviceDataProcessorExpressionModel)leftExpression;
- (GCGenericDeviceDataProcessorExpressionModel)rightExpression;
- (id)build;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setLeftExpression:(id)a3;
- (void)setRightExpression:(id)a3;
@end

@implementation GCGenericDeviceDataMultiplyExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GCGenericDeviceDataMultiplyExpressionModelBuilder;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v7 initializeWithModel:v4];
  v5 = objc_msgSend(v4, "leftExpression", v7.receiver, v7.super_class);
  [(GCGenericDeviceDataMultiplyExpressionModelBuilder *)self setLeftExpression:v5];

  v6 = [v4 rightExpression];

  [(GCGenericDeviceDataMultiplyExpressionModelBuilder *)self setRightExpression:v6];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataMultiplyExpressionModelBuilder;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v3 reset];
  [(GCGenericDeviceDataMultiplyExpressionModelBuilder *)self setLeftExpression:0];
  [(GCGenericDeviceDataMultiplyExpressionModelBuilder *)self setRightExpression:0];
}

- (id)build
{
  v14.receiver = self;
  v14.super_class = (Class)GCGenericDeviceDataMultiplyExpressionModelBuilder;
  id v4 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v14 build];
  v5 = [(GCGenericDeviceDataMultiplyExpressionModelBuilder *)self leftExpression];
  if (!v5)
  {
    v12 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v12 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataMultiplyExpressionModel.m" lineNumber:103 description:@"'leftExpression' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  objc_super v7 = (void *)v4[1];
  v4[1] = v6;

  v8 = [(GCGenericDeviceDataMultiplyExpressionModelBuilder *)self rightExpression];
  if (!v8)
  {
    v13 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v13 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataMultiplyExpressionModel.m" lineNumber:107 description:@"'rightExpression' can not be nil"];
  }
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  return v4;
}

- (GCGenericDeviceDataProcessorExpressionModel)leftExpression
{
  return self->_leftExpression;
}

- (void)setLeftExpression:(id)a3
{
}

- (GCGenericDeviceDataProcessorExpressionModel)rightExpression
{
  return self->_rightExpression;
}

- (void)setRightExpression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightExpression, 0);

  objc_storeStrong((id *)&self->_leftExpression, 0);
}

- (GCGenericDeviceDataMultiplyExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v43.receiver = self;
  v43.super_class = (Class)GCGenericDeviceDataMultiplyExpressionModelBuilder;
  objc_super v7 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v43 initWithDictionaryRepresentation:v6 error:a4];
  if (!v7) {
    goto LABEL_40;
  }
  id v42 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"LeftExpression", objc_opt_class(), &v42);
  id v9 = v42;
  if (!v8)
  {
    if (a4)
    {
      v50[0] = NSLocalizedDescriptionKey;
      v15 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v51[0] = v15;
      v50[1] = NSLocalizedFailureReasonErrorKey;
      v16 = [v9 localizedFailureReason];
      v51[1] = v16;
      v17 = v51;
      v18 = v50;
LABEL_22:
      v28 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v18 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_23:

LABEL_40:
    v13 = 0;
    goto LABEL_7;
  }
  id v41 = 0;
  v10 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v41];
  id v11 = v41;

  if (!v10)
  {
    if (a4)
    {
      v48[0] = NSLocalizedDescriptionKey;
      uint64_t v19 = [v11 localizedDescription];
      v38 = (void *)v19;
      if (!v19)
      {
        uint64_t v19 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"LeftExpression"];
      }
      v36 = (void *)v19;
      v49[0] = v19;
      v48[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v20 = [v11 localizedFailureReason];
      v21 = @"Invalid 'Expression' definition.";
      v37 = (void *)v20;
      if (v20) {
        v21 = (__CFString *)v20;
      }
      v49[1] = v21;
      v48[2] = NSUnderlyingErrorKey;
      uint64_t v22 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v22 = +[NSNull null];
      }
      v35 = (void *)v22;
      v49[2] = v22;
      v48[3] = @"GCFailingKeyPathErrorKey";
      v23 = objc_msgSend(v11, "gc_failingKeyPath");
      v24 = v23;
      if (!v23) {
        v23 = &__NSArray0__struct;
      }
      v25 = [v23 arrayByAddingObject:@"LeftExpression"];
      v49[3] = v25;
      v26 = v49;
      v27 = v48;
      goto LABEL_34;
    }
LABEL_39:

    goto LABEL_40;
  }
  [(GCGenericDeviceDataMultiplyExpressionModelBuilder *)v7 setLeftExpression:v10];

  id v40 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"RightExpression", objc_opt_class(), &v40);
  id v9 = v40;
  if (!v8)
  {
    if (a4)
    {
      v46[0] = NSLocalizedDescriptionKey;
      v15 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v47[0] = v15;
      v46[1] = NSLocalizedFailureReasonErrorKey;
      v16 = [v9 localizedFailureReason];
      v47[1] = v16;
      v17 = v47;
      v18 = v46;
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  id v39 = 0;
  v12 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v39];
  id v11 = v39;

  if (!v12)
  {
    if (a4)
    {
      v44[0] = NSLocalizedDescriptionKey;
      uint64_t v29 = [v11 localizedDescription];
      v38 = (void *)v29;
      if (!v29)
      {
        uint64_t v29 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"RightExpression"];
      }
      v36 = (void *)v29;
      v45[0] = v29;
      v44[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v30 = [v11 localizedFailureReason];
      v31 = @"Invalid 'Expression' definition.";
      v37 = (void *)v30;
      if (v30) {
        v31 = (__CFString *)v30;
      }
      v45[1] = v31;
      v44[2] = NSUnderlyingErrorKey;
      uint64_t v32 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v32 = +[NSNull null];
      }
      v35 = (void *)v32;
      v45[2] = v32;
      v44[3] = @"GCFailingKeyPathErrorKey";
      v33 = objc_msgSend(v11, "gc_failingKeyPath");
      v24 = v33;
      if (!v33) {
        v33 = &__NSArray0__struct;
      }
      v25 = [v33 arrayByAddingObject:@"RightExpression"];
      v45[3] = v25;
      v26 = v45;
      v27 = v44;
LABEL_34:
      v34 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v27 count:4];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v34);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v11) {
      if (!v38)
      }

      goto LABEL_39;
    }
    goto LABEL_39;
  }
  [(GCGenericDeviceDataMultiplyExpressionModelBuilder *)v7 setRightExpression:v12];

  v13 = v7;
LABEL_7:

  return v13;
}

@end