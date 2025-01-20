@interface GCGenericDeviceDataInterpolateExpressionModelBuilder
+ (Class)modelClass;
- (GCGenericDeviceDataInterpolateExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (GCGenericDeviceDataProcessorExpressionModel)inputExpression;
- (GCGenericDeviceDataProcessorExpressionModel)inputMaxExpression;
- (GCGenericDeviceDataProcessorExpressionModel)inputMinExpression;
- (GCGenericDeviceDataProcessorExpressionModel)outputMaxExpression;
- (GCGenericDeviceDataProcessorExpressionModel)outputMinExpression;
- (id)build;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setInputExpression:(id)a3;
- (void)setInputMaxExpression:(id)a3;
- (void)setInputMinExpression:(id)a3;
- (void)setOutputMaxExpression:(id)a3;
- (void)setOutputMinExpression:(id)a3;
@end

@implementation GCGenericDeviceDataInterpolateExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModelBuilder;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v10 initializeWithModel:v4];
  v5 = objc_msgSend(v4, "inputExpression", v10.receiver, v10.super_class);
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self setInputExpression:v5];

  v6 = [v4 inputMinExpression];
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self setInputMinExpression:v6];

  v7 = [v4 inputMaxExpression];
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self setInputMaxExpression:v7];

  v8 = [v4 outputMinExpression];
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self setOutputMinExpression:v8];

  v9 = [v4 outputMaxExpression];

  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self setOutputMaxExpression:v9];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModelBuilder;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v3 reset];
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self setInputExpression:0];
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self setInputMinExpression:0];
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self setInputMaxExpression:0];
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self setOutputMinExpression:0];
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self setOutputMaxExpression:0];
}

- (id)build
{
  v26.receiver = self;
  v26.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModelBuilder;
  id v4 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v26 build];
  v5 = [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self inputExpression];
  if (!v5)
  {
    v21 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v21 handleFailureInMethod:a2 object:self file:@"GCGCGenericDeviceDataInterpolateExpressionModel.m" lineNumber:136 description:@"'inputExpression' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  v8 = [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self inputMinExpression];
  if (!v8)
  {
    v22 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v22 handleFailureInMethod:a2 object:self file:@"GCGCGenericDeviceDataInterpolateExpressionModel.m" lineNumber:140 description:@"'inputMinExpression' can not be nil"];
  }
  uint64_t v9 = [v8 copy];
  objc_super v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self inputMaxExpression];
  if (!v11)
  {
    v23 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v23 handleFailureInMethod:a2 object:self file:@"GCGCGenericDeviceDataInterpolateExpressionModel.m" lineNumber:144 description:@"'inputMaxExpression' can not be nil"];
  }
  uint64_t v12 = [v11 copy];
  v13 = (void *)v4[3];
  v4[3] = v12;

  v14 = [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self outputMinExpression];
  if (!v14)
  {
    v24 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v24 handleFailureInMethod:a2 object:self file:@"GCGCGenericDeviceDataInterpolateExpressionModel.m" lineNumber:148 description:@"'outputMinExpression' can not be nil"];
  }
  uint64_t v15 = [v14 copy];
  v16 = (void *)v4[4];
  v4[4] = v15;

  v17 = [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)self outputMaxExpression];
  if (!v17)
  {
    v25 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v25 handleFailureInMethod:a2 object:self file:@"GCGCGenericDeviceDataInterpolateExpressionModel.m" lineNumber:152 description:@"'outputMaxExpression' can not be nil"];
  }
  uint64_t v18 = [v17 copy];
  v19 = (void *)v4[5];
  v4[5] = v18;

  return v4;
}

- (GCGenericDeviceDataProcessorExpressionModel)inputExpression
{
  return self->_inputExpression;
}

- (void)setInputExpression:(id)a3
{
}

- (GCGenericDeviceDataProcessorExpressionModel)inputMinExpression
{
  return self->_inputMinExpression;
}

- (void)setInputMinExpression:(id)a3
{
}

- (GCGenericDeviceDataProcessorExpressionModel)inputMaxExpression
{
  return self->_inputMaxExpression;
}

- (void)setInputMaxExpression:(id)a3
{
}

- (GCGenericDeviceDataProcessorExpressionModel)outputMinExpression
{
  return self->_outputMinExpression;
}

- (void)setOutputMinExpression:(id)a3
{
}

- (GCGenericDeviceDataProcessorExpressionModel)outputMaxExpression
{
  return self->_outputMaxExpression;
}

- (void)setOutputMaxExpression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputMaxExpression, 0);
  objc_storeStrong((id *)&self->_outputMinExpression, 0);
  objc_storeStrong((id *)&self->_inputMaxExpression, 0);
  objc_storeStrong((id *)&self->_inputMinExpression, 0);

  objc_storeStrong((id *)&self->_inputExpression, 0);
}

- (GCGenericDeviceDataInterpolateExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v67.receiver = self;
  v67.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModelBuilder;
  v7 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v67 initWithDictionaryRepresentation:v6 error:a4];
  if (!v7) {
    goto LABEL_82;
  }
  id v66 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"InputExpression", objc_opt_class(), &v66);
  id v9 = v66;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_65;
    }
    v86[0] = NSLocalizedDescriptionKey;
    uint64_t v18 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v87[0] = v18;
    v86[1] = NSLocalizedFailureReasonErrorKey;
    v19 = [v9 localizedFailureReason];
    v87[1] = v19;
    v20 = v87;
    v21 = v86;
LABEL_64:
    v46 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v21 count:2];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v46);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_65;
  }
  id v65 = 0;
  objc_super v10 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v65];
  id v11 = v65;

  if (!v10)
  {
    if (a4)
    {
      v84[0] = NSLocalizedDescriptionKey;
      uint64_t v22 = [v11 localizedDescription];
      v56 = (void *)v22;
      if (!v22)
      {
        uint64_t v22 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"InputExpression"];
      }
      v54 = (void *)v22;
      v85[0] = v22;
      v84[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v23 = [v11 localizedFailureReason];
      v24 = @"Invalid 'Expression' definition.";
      v55 = (void *)v23;
      if (v23) {
        v24 = (__CFString *)v23;
      }
      v85[1] = v24;
      v84[2] = NSUnderlyingErrorKey;
      uint64_t v25 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v25 = +[NSNull null];
      }
      v53 = (void *)v25;
      v85[2] = v25;
      v84[3] = @"GCFailingKeyPathErrorKey";
      objc_super v26 = objc_msgSend(v11, "gc_failingKeyPath");
      v27 = v26;
      if (!v26) {
        objc_super v26 = &__NSArray0__struct;
      }
      v28 = [v26 arrayByAddingObject:@"InputExpression"];
      v85[3] = v28;
      v29 = v85;
      v30 = v84;
      goto LABEL_76;
    }
    goto LABEL_81;
  }
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)v7 setInputExpression:v10];

  id v64 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"InputMinExpression", objc_opt_class(), &v64);
  id v9 = v64;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_65;
    }
    v82[0] = NSLocalizedDescriptionKey;
    uint64_t v18 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v83[0] = v18;
    v82[1] = NSLocalizedFailureReasonErrorKey;
    v19 = [v9 localizedFailureReason];
    v83[1] = v19;
    v20 = v83;
    v21 = v82;
    goto LABEL_64;
  }
  id v63 = 0;
  uint64_t v12 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v63];
  id v11 = v63;

  if (!v12)
  {
    if (a4)
    {
      v80[0] = NSLocalizedDescriptionKey;
      uint64_t v31 = [v11 localizedDescription];
      v56 = (void *)v31;
      if (!v31)
      {
        uint64_t v31 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"InputMinExpression"];
      }
      v54 = (void *)v31;
      v81[0] = v31;
      v80[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v32 = [v11 localizedFailureReason];
      v33 = @"Invalid 'Expression' definition.";
      v55 = (void *)v32;
      if (v32) {
        v33 = (__CFString *)v32;
      }
      v81[1] = v33;
      v80[2] = NSUnderlyingErrorKey;
      uint64_t v34 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v34 = +[NSNull null];
      }
      v53 = (void *)v34;
      v81[2] = v34;
      v80[3] = @"GCFailingKeyPathErrorKey";
      v35 = objc_msgSend(v11, "gc_failingKeyPath");
      v27 = v35;
      if (!v35) {
        v35 = &__NSArray0__struct;
      }
      v28 = [v35 arrayByAddingObject:@"InputMinExpression"];
      v81[3] = v28;
      v29 = v81;
      v30 = v80;
      goto LABEL_76;
    }
    goto LABEL_81;
  }
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)v7 setInputMinExpression:v12];

  id v62 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"InputMaxExpression", objc_opt_class(), &v62);
  id v9 = v62;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_65;
    }
    v78[0] = NSLocalizedDescriptionKey;
    uint64_t v18 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v79[0] = v18;
    v78[1] = NSLocalizedFailureReasonErrorKey;
    v19 = [v9 localizedFailureReason];
    v79[1] = v19;
    v20 = v79;
    v21 = v78;
    goto LABEL_64;
  }
  id v61 = 0;
  v13 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v61];
  id v11 = v61;

  if (!v13)
  {
    if (a4)
    {
      v76[0] = NSLocalizedDescriptionKey;
      uint64_t v36 = [v11 localizedDescription];
      v56 = (void *)v36;
      if (!v36)
      {
        uint64_t v36 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"InputMaxExpression"];
      }
      v54 = (void *)v36;
      v77[0] = v36;
      v76[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v37 = [v11 localizedFailureReason];
      v38 = @"Invalid 'Expression' definition.";
      v55 = (void *)v37;
      if (v37) {
        v38 = (__CFString *)v37;
      }
      v77[1] = v38;
      v76[2] = NSUnderlyingErrorKey;
      uint64_t v39 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v39 = +[NSNull null];
      }
      v53 = (void *)v39;
      v77[2] = v39;
      v76[3] = @"GCFailingKeyPathErrorKey";
      v40 = objc_msgSend(v11, "gc_failingKeyPath");
      v27 = v40;
      if (!v40) {
        v40 = &__NSArray0__struct;
      }
      v28 = [v40 arrayByAddingObject:@"InputMaxExpression"];
      v77[3] = v28;
      v29 = v77;
      v30 = v76;
      goto LABEL_76;
    }
    goto LABEL_81;
  }
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)v7 setInputMaxExpression:v13];

  id v60 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"OutputMinExpression", objc_opt_class(), &v60);
  id v9 = v60;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_65;
    }
    v74[0] = NSLocalizedDescriptionKey;
    uint64_t v18 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v75[0] = v18;
    v74[1] = NSLocalizedFailureReasonErrorKey;
    v19 = [v9 localizedFailureReason];
    v75[1] = v19;
    v20 = v75;
    v21 = v74;
    goto LABEL_64;
  }
  id v59 = 0;
  v14 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v59];
  id v11 = v59;

  if (!v14)
  {
    if (a4)
    {
      v72[0] = NSLocalizedDescriptionKey;
      uint64_t v41 = [v11 localizedDescription];
      v56 = (void *)v41;
      if (!v41)
      {
        uint64_t v41 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"OutputMinExpression"];
      }
      v54 = (void *)v41;
      v73[0] = v41;
      v72[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v42 = [v11 localizedFailureReason];
      v43 = @"Invalid 'Expression' definition.";
      v55 = (void *)v42;
      if (v42) {
        v43 = (__CFString *)v42;
      }
      v73[1] = v43;
      v72[2] = NSUnderlyingErrorKey;
      uint64_t v44 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v44 = +[NSNull null];
      }
      v53 = (void *)v44;
      v73[2] = v44;
      v72[3] = @"GCFailingKeyPathErrorKey";
      v45 = objc_msgSend(v11, "gc_failingKeyPath");
      v27 = v45;
      if (!v45) {
        v45 = &__NSArray0__struct;
      }
      v28 = [v45 arrayByAddingObject:@"OutputMinExpression"];
      v73[3] = v28;
      v29 = v73;
      v30 = v72;
      goto LABEL_76;
    }
LABEL_81:

    goto LABEL_82;
  }
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)v7 setOutputMinExpression:v14];

  id v58 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"OutputMaxExpression", objc_opt_class(), &v58);
  id v9 = v58;
  if (!v8)
  {
    if (a4)
    {
      v70[0] = NSLocalizedDescriptionKey;
      uint64_t v18 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v71[0] = v18;
      v70[1] = NSLocalizedFailureReasonErrorKey;
      v19 = [v9 localizedFailureReason];
      v71[1] = v19;
      v20 = v71;
      v21 = v70;
      goto LABEL_64;
    }
LABEL_65:

LABEL_82:
    v16 = 0;
    goto LABEL_13;
  }
  id v57 = 0;
  uint64_t v15 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v57];
  id v11 = v57;

  if (!v15)
  {
    if (a4)
    {
      v68[0] = NSLocalizedDescriptionKey;
      uint64_t v47 = [v11 localizedDescription];
      v56 = (void *)v47;
      if (!v47)
      {
        uint64_t v47 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"OutputMaxExpression"];
      }
      v54 = (void *)v47;
      v69[0] = v47;
      v68[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v48 = [v11 localizedFailureReason];
      v49 = @"Invalid 'Expression' definition.";
      v55 = (void *)v48;
      if (v48) {
        v49 = (__CFString *)v48;
      }
      v69[1] = v49;
      v68[2] = NSUnderlyingErrorKey;
      uint64_t v50 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v50 = +[NSNull null];
      }
      v53 = (void *)v50;
      v69[2] = v50;
      v68[3] = @"GCFailingKeyPathErrorKey";
      v51 = objc_msgSend(v11, "gc_failingKeyPath");
      v27 = v51;
      if (!v51) {
        v51 = &__NSArray0__struct;
      }
      v28 = [v51 arrayByAddingObject:@"OutputMaxExpression"];
      v69[3] = v28;
      v29 = v69;
      v30 = v68;
LABEL_76:
      v52 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v30 count:4];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v52);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v11) {
      if (!v56)
      }

      goto LABEL_81;
    }
    goto LABEL_81;
  }
  [(GCGenericDeviceDataInterpolateExpressionModelBuilder *)v7 setOutputMaxExpression:v15];

  v16 = v7;
LABEL_13:

  return v16;
}

@end