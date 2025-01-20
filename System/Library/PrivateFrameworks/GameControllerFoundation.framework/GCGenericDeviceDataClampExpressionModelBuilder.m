@interface GCGenericDeviceDataClampExpressionModelBuilder
+ (Class)modelClass;
- (GCGenericDeviceDataClampExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (GCGenericDeviceDataProcessorExpressionModel)inputExpression;
- (GCGenericDeviceDataProcessorExpressionModel)maxExpression;
- (GCGenericDeviceDataProcessorExpressionModel)minExpression;
- (id)build;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setInputExpression:(id)a3;
- (void)setMaxExpression:(id)a3;
- (void)setMinExpression:(id)a3;
@end

@implementation GCGenericDeviceDataClampExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceDataClampExpressionModelBuilder;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v8 initializeWithModel:v4];
  v5 = objc_msgSend(v4, "inputExpression", v8.receiver, v8.super_class);
  [(GCGenericDeviceDataClampExpressionModelBuilder *)self setInputExpression:v5];

  v6 = [v4 minExpression];
  [(GCGenericDeviceDataClampExpressionModelBuilder *)self setMinExpression:v6];

  v7 = [v4 maxExpression];

  [(GCGenericDeviceDataClampExpressionModelBuilder *)self setMaxExpression:v7];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataClampExpressionModelBuilder;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v3 reset];
  [(GCGenericDeviceDataClampExpressionModelBuilder *)self setInputExpression:0];
  [(GCGenericDeviceDataClampExpressionModelBuilder *)self setMinExpression:0];
  [(GCGenericDeviceDataClampExpressionModelBuilder *)self setMaxExpression:0];
}

- (id)build
{
  v16.receiver = self;
  v16.super_class = (Class)GCGenericDeviceDataClampExpressionModelBuilder;
  id v4 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v16 build];
  v5 = [(GCGenericDeviceDataClampExpressionModelBuilder *)self inputExpression];
  if (!v5)
  {
    v15 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v15 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataClampExpressionModel.m" lineNumber:114 description:@"'inputExpression' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  objc_super v8 = [(GCGenericDeviceDataClampExpressionModelBuilder *)self minExpression];
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = [(GCGenericDeviceDataClampExpressionModelBuilder *)self maxExpression];
  uint64_t v12 = [v11 copy];
  v13 = (void *)v4[3];
  v4[3] = v12;

  return v4;
}

- (GCGenericDeviceDataProcessorExpressionModel)inputExpression
{
  return self->_inputExpression;
}

- (void)setInputExpression:(id)a3
{
}

- (GCGenericDeviceDataProcessorExpressionModel)minExpression
{
  return self->_minExpression;
}

- (void)setMinExpression:(id)a3
{
}

- (GCGenericDeviceDataProcessorExpressionModel)maxExpression
{
  return self->_maxExpression;
}

- (void)setMaxExpression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxExpression, 0);
  objc_storeStrong((id *)&self->_minExpression, 0);

  objc_storeStrong((id *)&self->_inputExpression, 0);
}

- (GCGenericDeviceDataClampExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v59.receiver = self;
  v59.super_class = (Class)GCGenericDeviceDataClampExpressionModelBuilder;
  v7 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v59 initWithDictionaryRepresentation:v6 error:a4];
  if (!v7) {
    goto LABEL_42;
  }
  id v58 = 0;
  objc_super v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"InputExpression", objc_opt_class(), &v58);
  id v9 = v58;
  if (!v8)
  {
    if (a4)
    {
      v70[0] = NSLocalizedDescriptionKey;
      v19 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v71[0] = v19;
      v70[1] = NSLocalizedFailureReasonErrorKey;
      v20 = [v9 localizedFailureReason];
      v71[1] = v20;
      v21 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_42;
  }
  id v57 = 0;
  v10 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v57];
  id v11 = v57;

  if (!v10)
  {
    if (!a4)
    {
LABEL_40:

LABEL_41:
LABEL_42:
      v17 = 0;
      goto LABEL_17;
    }
    v68[0] = NSLocalizedDescriptionKey;
    uint64_t v22 = [v11 localizedDescription];
    v51 = (void *)v22;
    if (!v22)
    {
      uint64_t v22 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"InputExpression"];
    }
    v49 = (void *)v22;
    v69[0] = v22;
    v68[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v23 = [v11 localizedFailureReason];
    v24 = @"Invalid 'Expression' definition.";
    v25 = (void *)v23;
    if (v23) {
      v24 = (__CFString *)v23;
    }
    v69[1] = v24;
    v68[2] = NSUnderlyingErrorKey;
    uint64_t v26 = (uint64_t)v11;
    if (!v11)
    {
      uint64_t v26 = +[NSNull null];
    }
    v48 = (void *)v26;
    v69[2] = v26;
    v68[3] = @"GCFailingKeyPathErrorKey";
    v27 = objc_msgSend(v11, "gc_failingKeyPath");
    v28 = v27;
    if (!v27) {
      v27 = &__NSArray0__struct;
    }
    v29 = [v27 arrayByAddingObject:@"InputExpression"];
    v69[3] = v29;
    v30 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:4];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v30);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11) {
    v31 = v51;
    }
    if (!v51) {

    }
LABEL_39:
    goto LABEL_40;
  }
  [(GCGenericDeviceDataClampExpressionModelBuilder *)v7 setInputExpression:v10];

  id v56 = 0;
  objc_super v8 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"MinExpression", objc_opt_class(), &v56);
  id v12 = v56;
  v13 = v12;
  if (!v8 && v12)
  {
    if (a4)
    {
      v66[0] = NSLocalizedDescriptionKey;
      v10 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v67[0] = v10;
      v66[1] = NSLocalizedFailureReasonErrorKey;
      v31 = [v13 localizedFailureReason];
      v67[1] = v31;
      v32 = v67;
      v33 = v66;
LABEL_38:
      v34 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v33 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v34);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      id v11 = v13;
      goto LABEL_39;
    }
LABEL_43:
    id v11 = v13;
    goto LABEL_41;
  }
  if (v8)
  {
    id v55 = 0;
    v14 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v55];
    id v11 = v55;

    if (!v14)
    {
      if (!a4) {
        goto LABEL_41;
      }
      v64[0] = NSLocalizedDescriptionKey;
      v10 = [v11 localizedDescription];
      v31 = v10;
      if (!v10)
      {
        v31 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"MinExpression"];
      }
      v65[0] = v31;
      v64[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v35 = [v11 localizedFailureReason];
      v36 = @"Invalid 'Expression' definition.";
      v52 = (void *)v35;
      if (v35) {
        v36 = (__CFString *)v35;
      }
      v65[1] = v36;
      v64[2] = NSUnderlyingErrorKey;
      uint64_t v37 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v37 = +[NSNull null];
      }
      v50 = (void *)v37;
      v65[2] = v37;
      v64[3] = @"GCFailingKeyPathErrorKey";
      v38 = objc_msgSend(v11, "gc_failingKeyPath");
      v39 = v38;
      if (!v38) {
        v38 = &__NSArray0__struct;
      }
      v40 = [v38 arrayByAddingObject:@"MinExpression"];
      v65[3] = v40;
      v41 = v65;
      v42 = v64;
LABEL_64:
      v47 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v42 count:4];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v47);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v11) {
      if (v10)
      }
        goto LABEL_40;
      goto LABEL_39;
    }
    [(GCGenericDeviceDataClampExpressionModelBuilder *)v7 setMinExpression:v14];
  }
  else
  {
    id v11 = v12;
  }

  id v54 = 0;
  objc_super v8 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"MaxExpression", objc_opt_class(), &v54);
  id v15 = v54;
  v13 = v15;
  if (!v8 && v15)
  {
    if (a4)
    {
      v62[0] = NSLocalizedDescriptionKey;
      v10 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v63[0] = v10;
      v62[1] = NSLocalizedFailureReasonErrorKey;
      v31 = [v13 localizedFailureReason];
      v63[1] = v31;
      v32 = v63;
      v33 = v62;
      goto LABEL_38;
    }
    goto LABEL_43;
  }
  if (!v8)
  {
    id v11 = v15;
    goto LABEL_16;
  }
  id v53 = 0;
  objc_super v16 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v53];
  id v11 = v53;

  if (!v16)
  {
    if (!a4) {
      goto LABEL_41;
    }
    v60[0] = NSLocalizedDescriptionKey;
    v10 = [v11 localizedDescription];
    v31 = v10;
    if (!v10)
    {
      v31 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"MaxExpression"];
    }
    v61[0] = v31;
    v60[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v43 = [v11 localizedFailureReason];
    v44 = @"Invalid 'Expression' definition.";
    v52 = (void *)v43;
    if (v43) {
      v44 = (__CFString *)v43;
    }
    v61[1] = v44;
    v60[2] = NSUnderlyingErrorKey;
    uint64_t v45 = (uint64_t)v11;
    if (!v11)
    {
      uint64_t v45 = +[NSNull null];
    }
    v50 = (void *)v45;
    v61[2] = v45;
    v60[3] = @"GCFailingKeyPathErrorKey";
    v46 = objc_msgSend(v11, "gc_failingKeyPath");
    v39 = v46;
    if (!v46) {
      v46 = &__NSArray0__struct;
    }
    v40 = [v46 arrayByAddingObject:@"MaxExpression"];
    v61[3] = v40;
    v41 = v61;
    v42 = v60;
    goto LABEL_64;
  }
  [(GCGenericDeviceDataClampExpressionModelBuilder *)v7 setMaxExpression:v16];

LABEL_16:
  v17 = v7;
LABEL_17:

  return v17;
}

@end