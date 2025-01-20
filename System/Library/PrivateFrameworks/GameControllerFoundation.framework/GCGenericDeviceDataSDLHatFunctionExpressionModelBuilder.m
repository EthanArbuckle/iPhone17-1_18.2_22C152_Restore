@interface GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder
+ (Class)modelClass;
- (GCGenericDeviceDataProcessorExpressionModel)falseExpression;
- (GCGenericDeviceDataProcessorExpressionModel)inputExpression;
- (GCGenericDeviceDataProcessorExpressionModel)inputMaxExpression;
- (GCGenericDeviceDataProcessorExpressionModel)inputMinExpression;
- (GCGenericDeviceDataProcessorExpressionModel)maskExpression;
- (GCGenericDeviceDataProcessorExpressionModel)trueExpression;
- (GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (id)build;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setFalseExpression:(id)a3;
- (void)setInputExpression:(id)a3;
- (void)setInputMaxExpression:(id)a3;
- (void)setInputMinExpression:(id)a3;
- (void)setMaskExpression:(id)a3;
- (void)setTrueExpression:(id)a3;
@end

@implementation GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v11 initializeWithModel:v4];
  v5 = objc_msgSend(v4, "inputExpression", v11.receiver, v11.super_class);
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self setInputExpression:v5];

  v6 = [v4 inputMinExpression];
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self setInputMinExpression:v6];

  v7 = [v4 inputMaxExpression];
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self setInputMaxExpression:v7];

  v8 = [v4 maskExpression];
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self setMaskExpression:v8];

  v9 = [v4 trueExpression];
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self setTrueExpression:v9];

  v10 = [v4 falseExpression];

  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self setFalseExpression:v10];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder;
  [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v3 reset];
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self setInputExpression:0];
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self setInputMinExpression:0];
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self setInputMaxExpression:0];
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self setMaskExpression:0];
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self setTrueExpression:0];
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self setFalseExpression:0];
}

- (id)build
{
  v30.receiver = self;
  v30.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder;
  id v4 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v30 build];
  v5 = [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self inputExpression];
  if (!v5)
  {
    v24 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v24 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataSDLHatFunctionExpressionModel.m" lineNumber:147 description:@"'inputExpression' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  v8 = [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self inputMinExpression];
  if (!v8)
  {
    v25 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v25 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataSDLHatFunctionExpressionModel.m" lineNumber:151 description:@"'inputMinExpression' can not be nil"];
  }
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  objc_super v11 = [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self inputMaxExpression];
  if (!v11)
  {
    v26 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v26 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataSDLHatFunctionExpressionModel.m" lineNumber:155 description:@"'inputMaxExpression' can not be nil"];
  }
  uint64_t v12 = [v11 copy];
  v13 = (void *)v4[3];
  v4[3] = v12;

  v14 = [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self maskExpression];
  if (!v14)
  {
    v27 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v27 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataSDLHatFunctionExpressionModel.m" lineNumber:159 description:@"'maskExpression' can not be nil"];
  }
  uint64_t v15 = [v14 copy];
  v16 = (void *)v4[4];
  v4[4] = v15;

  v17 = [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self trueExpression];
  if (!v17)
  {
    v28 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v28 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataSDLHatFunctionExpressionModel.m" lineNumber:163 description:@"'trueExpression' can not be nil"];
  }
  uint64_t v18 = [v17 copy];
  v19 = (void *)v4[5];
  v4[5] = v18;

  v20 = [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)self falseExpression];
  if (!v20)
  {
    v29 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v29 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceDataSDLHatFunctionExpressionModel.m" lineNumber:167 description:@"'falseExpression' can not be nil"];
  }
  uint64_t v21 = [v20 copy];
  v22 = (void *)v4[6];
  v4[6] = v21;

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseExpression, 0);
  objc_storeStrong((id *)&self->_trueExpression, 0);
  objc_storeStrong((id *)&self->_maskExpression, 0);
  objc_storeStrong((id *)&self->_inputMaxExpression, 0);
  objc_storeStrong((id *)&self->_inputMinExpression, 0);

  objc_storeStrong((id *)&self->_inputExpression, 0);
}

- (GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v75.receiver = self;
  v75.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder;
  v7 = [(GCGenericDeviceDataProcessorExpressionModelBuilder *)&v75 initWithDictionaryRepresentation:v6 error:a4];
  if (!v7) {
    goto LABEL_96;
  }
  id v74 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"InputExpression", objc_opt_class(), &v74);
  id v9 = v74;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_79;
    }
    v98[0] = NSLocalizedDescriptionKey;
    v19 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v99[0] = v19;
    v98[1] = NSLocalizedFailureReasonErrorKey;
    v20 = [v9 localizedFailureReason];
    v99[1] = v20;
    uint64_t v21 = v99;
    v22 = v98;
LABEL_78:
    v52 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v22 count:2];
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v52);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_79;
  }
  id v73 = 0;
  v10 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v73];
  id v11 = v73;

  if (!v10)
  {
    if (a4)
    {
      v96[0] = NSLocalizedDescriptionKey;
      uint64_t v23 = [v11 localizedDescription];
      v62 = (void *)v23;
      if (!v23)
      {
        uint64_t v23 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"InputExpression"];
      }
      v60 = (void *)v23;
      v97[0] = v23;
      v96[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v24 = [v11 localizedFailureReason];
      v25 = @"Invalid 'Expression' definition.";
      v61 = (void *)v24;
      if (v24) {
        v25 = (__CFString *)v24;
      }
      v97[1] = v25;
      v96[2] = NSUnderlyingErrorKey;
      uint64_t v26 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v26 = +[NSNull null];
      }
      v59 = (void *)v26;
      v97[2] = v26;
      v96[3] = @"GCFailingKeyPathErrorKey";
      v27 = objc_msgSend(v11, "gc_failingKeyPath");
      v28 = v27;
      if (!v27) {
        v27 = &__NSArray0__struct;
      }
      v29 = [v27 arrayByAddingObject:@"InputExpression"];
      v97[3] = v29;
      objc_super v30 = v97;
      v31 = v96;
      goto LABEL_90;
    }
    goto LABEL_95;
  }
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)v7 setInputExpression:v10];

  id v72 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"InputMinExpression", objc_opt_class(), &v72);
  id v9 = v72;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_79;
    }
    v94[0] = NSLocalizedDescriptionKey;
    v19 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v95[0] = v19;
    v94[1] = NSLocalizedFailureReasonErrorKey;
    v20 = [v9 localizedFailureReason];
    v95[1] = v20;
    uint64_t v21 = v95;
    v22 = v94;
    goto LABEL_78;
  }
  id v71 = 0;
  uint64_t v12 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v71];
  id v11 = v71;

  if (!v12)
  {
    if (a4)
    {
      v92[0] = NSLocalizedDescriptionKey;
      uint64_t v32 = [v11 localizedDescription];
      v62 = (void *)v32;
      if (!v32)
      {
        uint64_t v32 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"InputMinExpression"];
      }
      v60 = (void *)v32;
      v93[0] = v32;
      v92[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v33 = [v11 localizedFailureReason];
      v34 = @"Invalid 'Expression' definition.";
      v61 = (void *)v33;
      if (v33) {
        v34 = (__CFString *)v33;
      }
      v93[1] = v34;
      v92[2] = NSUnderlyingErrorKey;
      uint64_t v35 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v35 = +[NSNull null];
      }
      v59 = (void *)v35;
      v93[2] = v35;
      v92[3] = @"GCFailingKeyPathErrorKey";
      v36 = objc_msgSend(v11, "gc_failingKeyPath");
      v28 = v36;
      if (!v36) {
        v36 = &__NSArray0__struct;
      }
      v29 = [v36 arrayByAddingObject:@"InputMinExpression"];
      v93[3] = v29;
      objc_super v30 = v93;
      v31 = v92;
      goto LABEL_90;
    }
    goto LABEL_95;
  }
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)v7 setInputMinExpression:v12];

  id v70 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"InputMaxExpression", objc_opt_class(), &v70);
  id v9 = v70;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_79;
    }
    v90[0] = NSLocalizedDescriptionKey;
    v19 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v91[0] = v19;
    v90[1] = NSLocalizedFailureReasonErrorKey;
    v20 = [v9 localizedFailureReason];
    v91[1] = v20;
    uint64_t v21 = v91;
    v22 = v90;
    goto LABEL_78;
  }
  id v69 = 0;
  v13 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v69];
  id v11 = v69;

  if (!v13)
  {
    if (a4)
    {
      v88[0] = NSLocalizedDescriptionKey;
      uint64_t v37 = [v11 localizedDescription];
      v62 = (void *)v37;
      if (!v37)
      {
        uint64_t v37 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"InputMaxExpression"];
      }
      v60 = (void *)v37;
      v89[0] = v37;
      v88[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v38 = [v11 localizedFailureReason];
      v39 = @"Invalid 'Expression' definition.";
      v61 = (void *)v38;
      if (v38) {
        v39 = (__CFString *)v38;
      }
      v89[1] = v39;
      v88[2] = NSUnderlyingErrorKey;
      uint64_t v40 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v40 = +[NSNull null];
      }
      v59 = (void *)v40;
      v89[2] = v40;
      v88[3] = @"GCFailingKeyPathErrorKey";
      v41 = objc_msgSend(v11, "gc_failingKeyPath");
      v28 = v41;
      if (!v41) {
        v41 = &__NSArray0__struct;
      }
      v29 = [v41 arrayByAddingObject:@"InputMaxExpression"];
      v89[3] = v29;
      objc_super v30 = v89;
      v31 = v88;
      goto LABEL_90;
    }
    goto LABEL_95;
  }
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)v7 setInputMaxExpression:v13];

  id v68 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"MaskExpression", objc_opt_class(), &v68);
  id v9 = v68;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_79;
    }
    v86[0] = NSLocalizedDescriptionKey;
    v19 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v87[0] = v19;
    v86[1] = NSLocalizedFailureReasonErrorKey;
    v20 = [v9 localizedFailureReason];
    v87[1] = v20;
    uint64_t v21 = v87;
    v22 = v86;
    goto LABEL_78;
  }
  id v67 = 0;
  v14 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v67];
  id v11 = v67;

  if (!v14)
  {
    if (a4)
    {
      v84[0] = NSLocalizedDescriptionKey;
      uint64_t v42 = [v11 localizedDescription];
      v62 = (void *)v42;
      if (!v42)
      {
        uint64_t v42 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"MaskExpression"];
      }
      v60 = (void *)v42;
      v85[0] = v42;
      v84[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v43 = [v11 localizedFailureReason];
      v44 = @"Invalid 'Expression' definition.";
      v61 = (void *)v43;
      if (v43) {
        v44 = (__CFString *)v43;
      }
      v85[1] = v44;
      v84[2] = NSUnderlyingErrorKey;
      uint64_t v45 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v45 = +[NSNull null];
      }
      v59 = (void *)v45;
      v85[2] = v45;
      v84[3] = @"GCFailingKeyPathErrorKey";
      v46 = objc_msgSend(v11, "gc_failingKeyPath");
      v28 = v46;
      if (!v46) {
        v46 = &__NSArray0__struct;
      }
      v29 = [v46 arrayByAddingObject:@"MaskExpression"];
      v85[3] = v29;
      objc_super v30 = v85;
      v31 = v84;
      goto LABEL_90;
    }
    goto LABEL_95;
  }
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)v7 setMaskExpression:v14];

  id v66 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"TrueExpression", objc_opt_class(), &v66);
  id v9 = v66;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_79;
    }
    v82[0] = NSLocalizedDescriptionKey;
    v19 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
    v83[0] = v19;
    v82[1] = NSLocalizedFailureReasonErrorKey;
    v20 = [v9 localizedFailureReason];
    v83[1] = v20;
    uint64_t v21 = v83;
    v22 = v82;
    goto LABEL_78;
  }
  id v65 = 0;
  uint64_t v15 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v65];
  id v11 = v65;

  if (!v15)
  {
    if (a4)
    {
      v80[0] = NSLocalizedDescriptionKey;
      uint64_t v47 = [v11 localizedDescription];
      v62 = (void *)v47;
      if (!v47)
      {
        uint64_t v47 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"TrueExpression"];
      }
      v60 = (void *)v47;
      v81[0] = v47;
      v80[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v48 = [v11 localizedFailureReason];
      v49 = @"Invalid 'Expression' definition.";
      v61 = (void *)v48;
      if (v48) {
        v49 = (__CFString *)v48;
      }
      v81[1] = v49;
      v80[2] = NSUnderlyingErrorKey;
      uint64_t v50 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v50 = +[NSNull null];
      }
      v59 = (void *)v50;
      v81[2] = v50;
      v80[3] = @"GCFailingKeyPathErrorKey";
      v51 = objc_msgSend(v11, "gc_failingKeyPath");
      v28 = v51;
      if (!v51) {
        v51 = &__NSArray0__struct;
      }
      v29 = [v51 arrayByAddingObject:@"TrueExpression"];
      v81[3] = v29;
      objc_super v30 = v81;
      v31 = v80;
      goto LABEL_90;
    }
LABEL_95:

    goto LABEL_96;
  }
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)v7 setTrueExpression:v15];

  id v64 = 0;
  v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"FalseExpression", objc_opt_class(), &v64);
  id v9 = v64;
  if (!v8)
  {
    if (a4)
    {
      v78[0] = NSLocalizedDescriptionKey;
      v19 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v79[0] = v19;
      v78[1] = NSLocalizedFailureReasonErrorKey;
      v20 = [v9 localizedFailureReason];
      v79[1] = v20;
      uint64_t v21 = v79;
      v22 = v78;
      goto LABEL_78;
    }
LABEL_79:

LABEL_96:
    v17 = 0;
    goto LABEL_15;
  }
  id v63 = 0;
  v16 = +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:v8 error:&v63];
  id v11 = v63;

  if (!v16)
  {
    if (a4)
    {
      v76[0] = NSLocalizedDescriptionKey;
      uint64_t v53 = [v11 localizedDescription];
      v62 = (void *)v53;
      if (!v53)
      {
        uint64_t v53 = +[NSString stringWithFormat:@"Error instantiating model for '%@'.", @"FalseExpression"];
      }
      v60 = (void *)v53;
      v77[0] = v53;
      v76[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v54 = [v11 localizedFailureReason];
      v55 = @"Invalid 'Expression' definition.";
      v61 = (void *)v54;
      if (v54) {
        v55 = (__CFString *)v54;
      }
      v77[1] = v55;
      v76[2] = NSUnderlyingErrorKey;
      uint64_t v56 = (uint64_t)v11;
      if (!v11)
      {
        uint64_t v56 = +[NSNull null];
      }
      v59 = (void *)v56;
      v77[2] = v56;
      v76[3] = @"GCFailingKeyPathErrorKey";
      v57 = objc_msgSend(v11, "gc_failingKeyPath");
      v28 = v57;
      if (!v57) {
        v57 = &__NSArray0__struct;
      }
      v29 = [v57 arrayByAddingObject:@"FalseExpression"];
      v77[3] = v29;
      objc_super v30 = v77;
      v31 = v76;
LABEL_90:
      v58 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v31 count:4];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v58);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v11) {
      if (!v62)
      }

      goto LABEL_95;
    }
    goto LABEL_95;
  }
  [(GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *)v7 setFalseExpression:v16];

  v17 = v7;
LABEL_15:

  return v17;
}

@end