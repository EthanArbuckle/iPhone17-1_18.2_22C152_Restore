@interface GCGenericDeviceDataBitTestExpressionModelBuilder
+ (Class)modelClass;
- (BOOL)partialMatch;
- (GCGenericDeviceDataBitTestExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (GCGenericDeviceDataProcessorExpressionModel)falseExpression;
- (GCGenericDeviceDataProcessorExpressionModel)inputExpression;
- (GCGenericDeviceDataProcessorExpressionModel)maskExpression;
- (GCGenericDeviceDataProcessorExpressionModel)trueExpression;
- (id)build;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setFalseExpression:(id)a3;
- (void)setInputExpression:(id)a3;
- (void)setMaskExpression:(id)a3;
- (void)setPartialMatch:(BOOL)a3;
- (void)setTrueExpression:(id)a3;
@end

@implementation GCGenericDeviceDataBitTestExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataBitTestExpressionModelBuilder;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v10 initializeWithModel:v4];
  v5 = objc_msgSend(v4, "inputExpression", v10.receiver, v10.super_class);
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self setInputExpression:v5];

  v6 = [v4 maskExpression];
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self setMaskExpression:v6];

  v7 = [v4 trueExpression];
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self setTrueExpression:v7];

  v8 = [v4 falseExpression];
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self setFalseExpression:v8];

  uint64_t v9 = [v4 partialMatch];
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self setPartialMatch:v9];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataBitTestExpressionModelBuilder;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v3 reset];
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self setInputExpression:0];
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self setMaskExpression:0];
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self setTrueExpression:0];
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self setFalseExpression:0];
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self setPartialMatch:0];
}

- (id)build
{
  v22.receiver = self;
  v22.super_class = (Class)GCGenericDeviceDataBitTestExpressionModelBuilder;
  uint64_t v4 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v22 build];
  v5 = [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self inputExpression];
  if (!v5)
  {
    v18 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v18 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataBitTestExpressionModel.m" lineNumber:135 description:@"'inputExpression' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  v7 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v6;

  v8 = [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self maskExpression];
  if (!v8)
  {
    v19 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v19 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataBitTestExpressionModel.m" lineNumber:139 description:@"'maskExpression' can not be nil"];
  }
  uint64_t v9 = [v8 copy];
  objc_super v10 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v9;

  v11 = [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self trueExpression];
  if (!v11)
  {
    v20 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v20 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataBitTestExpressionModel.m" lineNumber:143 description:@"'trueExpression' can not be nil"];
  }
  uint64_t v12 = [v11 copy];
  v13 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v12;

  v14 = [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self falseExpression];
  if (!v14)
  {
    v21 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v21 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataBitTestExpressionModel.m" lineNumber:147 description:@"'falseExpression' can not be nil"];
  }
  uint64_t v15 = [v14 copy];
  v16 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v15;

  *(unsigned char *)(v4 + 40) = [(GCGenericDeviceDataBitTestExpressionModelBuilder *)self partialMatch];

  return (id)v4;
}

- (GCGenericDeviceDataProcessorExpressionModel)inputExpression
{
  return self->_inputExpression;
}

- (void)setInputExpression:(id)a3
{
}

- (GCGenericDeviceDataProcessorExpressionModel)maskExpression
{
  return self->_maskExpression;
}

- (void)setMaskExpression:(id)a3
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

- (BOOL)partialMatch
{
  return self->_partialMatch;
}

- (void)setPartialMatch:(BOOL)a3
{
  self->_partialMatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseExpression, 0);
  objc_storeStrong((id *)&self->_trueExpression, 0);
  objc_storeStrong((id *)&self->_maskExpression, 0);

  objc_storeStrong((id *)&self->_inputExpression, 0);
}

- (GCGenericDeviceDataBitTestExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v66.receiver = self;
  v66.super_class = (Class)GCGenericDeviceDataBitTestExpressionModelBuilder;
  v7 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v66 initWithDictionaryRepresentation:v6 error:a4];
  if (!v7) {
    goto LABEL_72;
  }
  id v65 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"InputExpression", objc_opt_class(), &v65);
  id v9 = v65;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_55;
    }
    v83[0] = NSLocalizedDescriptionKey;
    v20 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v84[0] = v20;
    v83[1] = NSLocalizedFailureReasonErrorKey;
    v21 = [v9 localizedFailureReason];
    v84[1] = v21;
    objc_super v22 = v84;
    v23 = v83;
LABEL_54:
    v43 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:2];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v43);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_55;
  }
  id v64 = 0;
  objc_super v10 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v64];
  id v11 = v64;

  if (!v10)
  {
    if (a4)
    {
      v81[0] = NSLocalizedDescriptionKey;
      uint64_t v24 = [v11 localizedDescription];
      v56 = (void *)v24;
      if (!v24)
      {
        uint64_t v24 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"InputExpression"];
      }
      v54 = (void *)v24;
      v82[0] = v24;
      v81[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v25 = [v11 localizedFailureReason];
      v26 = @"Invalid 'Expression' definition.";
      v55 = (void *)v25;
      if (v25) {
        v26 = (__CFString *)v25;
      }
      v82[1] = v26;
      v81[2] = NSUnderlyingErrorKey;
      uint64_t v27 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v27 = +[NSNull null];
      }
      v53 = (void *)v27;
      v82[2] = v27;
      v81[3] = @"GCFailingKeyPathErrorKey";
      v28 = objc_msgSend(v11, "gc_failingKeyPath");
      v29 = v28;
      if (!v28) {
        v28 = &__NSArray0__struct;
      }
      v30 = [v28 arrayByAddingObject:@"InputExpression"];
      v82[3] = v30;
      v31 = v82;
      v32 = v81;
      goto LABEL_66;
    }
    goto LABEL_71;
  }
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)v7 setInputExpression:v10];

  id v63 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"MaskExpression", objc_opt_class(), &v63);
  id v9 = v63;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_55;
    }
    v79[0] = NSLocalizedDescriptionKey;
    v20 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v80[0] = v20;
    v79[1] = NSLocalizedFailureReasonErrorKey;
    v21 = [v9 localizedFailureReason];
    v80[1] = v21;
    objc_super v22 = v80;
    v23 = v79;
    goto LABEL_54;
  }
  id v62 = 0;
  uint64_t v12 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v62];
  id v11 = v62;

  if (!v12)
  {
    if (a4)
    {
      v77[0] = NSLocalizedDescriptionKey;
      uint64_t v33 = [v11 localizedDescription];
      v56 = (void *)v33;
      if (!v33)
      {
        uint64_t v33 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"MaskExpression"];
      }
      v54 = (void *)v33;
      v78[0] = v33;
      v77[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v34 = [v11 localizedFailureReason];
      v35 = @"Invalid 'Expression' definition.";
      v55 = (void *)v34;
      if (v34) {
        v35 = (__CFString *)v34;
      }
      v78[1] = v35;
      v77[2] = NSUnderlyingErrorKey;
      uint64_t v36 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v36 = +[NSNull null];
      }
      v53 = (void *)v36;
      v78[2] = v36;
      v77[3] = @"GCFailingKeyPathErrorKey";
      v37 = objc_msgSend(v11, "gc_failingKeyPath");
      v29 = v37;
      if (!v37) {
        v37 = &__NSArray0__struct;
      }
      v30 = [v37 arrayByAddingObject:@"MaskExpression"];
      v78[3] = v30;
      v31 = v78;
      v32 = v77;
      goto LABEL_66;
    }
    goto LABEL_71;
  }
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)v7 setMaskExpression:v12];

  id v61 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"TrueExpression", objc_opt_class(), &v61);
  id v9 = v61;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_55;
    }
    v75[0] = NSLocalizedDescriptionKey;
    v20 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v76[0] = v20;
    v75[1] = NSLocalizedFailureReasonErrorKey;
    v21 = [v9 localizedFailureReason];
    v76[1] = v21;
    objc_super v22 = v76;
    v23 = v75;
    goto LABEL_54;
  }
  id v60 = 0;
  v13 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v60];
  id v11 = v60;

  if (!v13)
  {
    if (a4)
    {
      v73[0] = NSLocalizedDescriptionKey;
      uint64_t v38 = [v11 localizedDescription];
      v56 = (void *)v38;
      if (!v38)
      {
        uint64_t v38 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"TrueExpression"];
      }
      v54 = (void *)v38;
      v74[0] = v38;
      v73[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v39 = [v11 localizedFailureReason];
      v40 = @"Invalid 'Expression' definition.";
      v55 = (void *)v39;
      if (v39) {
        v40 = (__CFString *)v39;
      }
      v74[1] = v40;
      v73[2] = NSUnderlyingErrorKey;
      uint64_t v41 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v41 = +[NSNull null];
      }
      v53 = (void *)v41;
      v74[2] = v41;
      v73[3] = @"GCFailingKeyPathErrorKey";
      v42 = objc_msgSend(v11, "gc_failingKeyPath");
      v29 = v42;
      if (!v42) {
        v42 = &__NSArray0__struct;
      }
      v30 = [v42 arrayByAddingObject:@"TrueExpression"];
      v74[3] = v30;
      v31 = v74;
      v32 = v73;
      goto LABEL_66;
    }
LABEL_71:

    goto LABEL_72;
  }
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)v7 setTrueExpression:v13];

  id v59 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"FalseExpression", objc_opt_class(), &v59);
  id v9 = v59;
  if (!v8)
  {
    if (a4)
    {
      v71[0] = NSLocalizedDescriptionKey;
      v20 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v72[0] = v20;
      v71[1] = NSLocalizedFailureReasonErrorKey;
      v21 = [v9 localizedFailureReason];
      v72[1] = v21;
      objc_super v22 = v72;
      v23 = v71;
      goto LABEL_54;
    }
LABEL_55:

LABEL_72:
    v18 = 0;
    goto LABEL_15;
  }
  id v58 = 0;
  v14 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v58];
  id v11 = v58;

  if (!v14)
  {
    if (a4)
    {
      v69[0] = NSLocalizedDescriptionKey;
      uint64_t v44 = [v11 localizedDescription];
      v56 = (void *)v44;
      if (!v44)
      {
        uint64_t v44 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"FalseExpression"];
      }
      v54 = (void *)v44;
      v70[0] = v44;
      v69[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v45 = [v11 localizedFailureReason];
      v46 = @"Invalid 'Expression' definition.";
      v55 = (void *)v45;
      if (v45) {
        v46 = (__CFString *)v45;
      }
      v70[1] = v46;
      v69[2] = NSUnderlyingErrorKey;
      uint64_t v47 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v47 = +[NSNull null];
      }
      v53 = (void *)v47;
      v70[2] = v47;
      v69[3] = @"GCFailingKeyPathErrorKey";
      v48 = objc_msgSend(v11, "gc_failingKeyPath");
      v29 = v48;
      if (!v48) {
        v48 = &__NSArray0__struct;
      }
      v30 = [v48 arrayByAddingObject:@"FalseExpression"];
      v70[3] = v30;
      v31 = v70;
      v32 = v69;
LABEL_66:
      v49 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v32 count:4];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v49);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v11) {
      if (!v56)
      }

      goto LABEL_71;
    }
    goto LABEL_71;
  }
  [(GCGenericDeviceDataBitTestExpressionModelBuilder *)v7 setFalseExpression:v14];

  id v57 = 0;
  uint64_t v15 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"PartialMatch", objc_opt_class(), &v57);
  id v16 = v57;
  v17 = v16;
  if (!v15 && v16)
  {
    if (a4)
    {
      v67[0] = NSLocalizedDescriptionKey;
      v50 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v68[0] = v50;
      v67[1] = NSLocalizedFailureReasonErrorKey;
      v51 = [v17 localizedFailureReason];
      v68[1] = v51;
      v52 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v52);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_72;
  }
  if (v15) {
    -[GCGenericDeviceDataBitTestExpressionModelBuilder setPartialMatch:](v7, "setPartialMatch:", [v15 BOOLValue]);
  }

  v18 = v7;
LABEL_15:

  return v18;
}

@end