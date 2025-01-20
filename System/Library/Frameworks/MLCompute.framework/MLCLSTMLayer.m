@interface MLCLSTMLayer
+ (MLCLSTMLayer)layerWithDescriptor:(MLCLSTMDescriptor *)descriptor inputWeights:(NSArray *)inputWeights hiddenWeights:(NSArray *)hiddenWeights biases:(NSArray *)biases;
+ (MLCLSTMLayer)layerWithDescriptor:(MLCLSTMDescriptor *)descriptor inputWeights:(NSArray *)inputWeights hiddenWeights:(NSArray *)hiddenWeights peepholeWeights:(NSArray *)peepholeWeights biases:(NSArray *)biases;
+ (MLCLSTMLayer)layerWithDescriptor:(MLCLSTMDescriptor *)descriptor inputWeights:(NSArray *)inputWeights hiddenWeights:(NSArray *)hiddenWeights peepholeWeights:(NSArray *)peepholeWeights biases:(NSArray *)biases gateActivations:(NSArray *)gateActivations outputResultActivation:(MLCActivationDescriptor *)outputResultActivation;
- (BOOL)allocateDataForOptimizer:(id)a3;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCActivationDescriptor)outputResultActivation;
- (MLCLSTMDescriptor)descriptor;
- (MLCLSTMLayer)initWithDescriptor:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 peepholeWeights:(id)a6 biases:(id)a7 gateActivations:(id)a8 outputResultActivation:(id)a9;
- (NSArray)biases;
- (NSArray)biasesParameters;
- (NSArray)gateActivations;
- (NSArray)hiddenWeights;
- (NSArray)hiddenWeightsParameters;
- (NSArray)inputWeights;
- (NSArray)inputWeightsParameters;
- (NSArray)peepholeWeights;
- (NSArray)peepholeWeightsParameters;
- (id)description;
- (id)resultStateTensorWithSources:(id)a3;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4;
- (unint64_t)parametersCount;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
- (void)allocateGradientsForParameters;
- (void)linkAssociatedTensors;
- (void)unlinkAssociatedTensors;
@end

@implementation MLCLSTMLayer

+ (MLCLSTMLayer)layerWithDescriptor:(MLCLSTMDescriptor *)descriptor inputWeights:(NSArray *)inputWeights hiddenWeights:(NSArray *)hiddenWeights biases:(NSArray *)biases
{
  return (MLCLSTMLayer *)[a1 layerWithDescriptor:descriptor inputWeights:inputWeights hiddenWeights:hiddenWeights peepholeWeights:0 biases:biases];
}

+ (MLCLSTMLayer)layerWithDescriptor:(MLCLSTMDescriptor *)descriptor inputWeights:(NSArray *)inputWeights hiddenWeights:(NSArray *)hiddenWeights peepholeWeights:(NSArray *)peepholeWeights biases:(NSArray *)biases
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v12 = biases;
  v13 = peepholeWeights;
  v14 = hiddenWeights;
  v15 = inputWeights;
  v16 = descriptor;
  v17 = +[MLCActivationDescriptor descriptorWithType:3];
  v18 = +[MLCActivationDescriptor descriptorWithType:5];
  v22[0] = v17;
  v22[1] = v17;
  v22[2] = v18;
  v22[3] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
  v20 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v16 inputWeights:v15 hiddenWeights:v14 peepholeWeights:v13 biases:v12 gateActivations:v19 outputResultActivation:v18];

  return (MLCLSTMLayer *)v20;
}

+ (MLCLSTMLayer)layerWithDescriptor:(MLCLSTMDescriptor *)descriptor inputWeights:(NSArray *)inputWeights hiddenWeights:(NSArray *)hiddenWeights peepholeWeights:(NSArray *)peepholeWeights biases:(NSArray *)biases gateActivations:(NSArray *)gateActivations outputResultActivation:(MLCActivationDescriptor *)outputResultActivation
{
  v16 = outputResultActivation;
  v17 = gateActivations;
  v18 = biases;
  v19 = peepholeWeights;
  v20 = hiddenWeights;
  v21 = inputWeights;
  v22 = descriptor;
  v23 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v22 inputWeights:v21 hiddenWeights:v20 peepholeWeights:v19 biases:v18 gateActivations:v17 outputResultActivation:v16];

  return (MLCLSTMLayer *)v23;
}

- (MLCLSTMLayer)initWithDescriptor:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 peepholeWeights:(id)a6 biases:(id)a7 gateActivations:(id)a8 outputResultActivation:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v73 = a6;
  id v74 = a7;
  id obj = a8;
  id v72 = a8;
  id v71 = a9;
  uint64_t v18 = [v15 layerCount];
  v19 = v15;
  uint64_t v20 = 4 * (v18 << [v15 isBidirectional]);
  id v21 = v16;
  if ([v16 count] != v20)
  {
    v28 = +[MLCLog framework];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:].cold.8();
    }

    v29 = 0;
    v24 = v16;
    v25 = v19;
    v22 = v17;
    goto LABEL_16;
  }
  v22 = v17;
  if ([v17 count] != v20)
  {
    v30 = +[MLCLog framework];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:].cold.7();
    }

    v29 = 0;
    v24 = v21;
    v25 = v19;
LABEL_16:
    v23 = v73;
LABEL_17:
    v27 = v72;
LABEL_18:
    v32 = self;
    v31 = v71;
    goto LABEL_19;
  }
  v23 = v73;
  if (v73 && [v73 count] != v20)
  {
    v34 = +[MLCLog framework];
    v24 = v21;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:].cold.6();
    }
    goto LABEL_31;
  }
  v24 = v21;
  if (!v74)
  {
    v25 = v19;
    if ([v19 usesBiases])
    {
      v26 = +[MLCLog framework];
      v27 = v72;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:](a2);
      }
      goto LABEL_34;
    }
    goto LABEL_25;
  }
  if ([v74 count] != v20)
  {
    v34 = +[MLCLog framework];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:].cold.5();
    }
LABEL_31:

    v29 = 0;
    v25 = v19;
    goto LABEL_17;
  }
  v25 = v19;
  if (([v19 usesBiases] & 1) == 0)
  {
    v26 = +[MLCLog framework];
    v27 = v72;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:].cold.4(a2);
    }
LABEL_34:

    v29 = 0;
    goto LABEL_18;
  }
LABEL_25:
  v27 = v72;
  if ([v72 count] != 4)
  {
    v26 = +[MLCLog framework];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:](a2);
    }
    goto LABEL_34;
  }
  if (v73)
  {
    v26 = +[MLCLog framework];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:](a2);
    }
    goto LABEL_34;
  }
  v76.receiver = self;
  v76.super_class = (Class)MLCLSTMLayer;
  v35 = [(MLCLayer *)&v76 initWithLabel:@"LSTM"];
  v36 = v35;
  if (v35)
  {
    objc_storeStrong((id *)&v35->_descriptor, a3);
    v70 = v22;
    p_inputWeights = (id *)&v36->_inputWeights;
    objc_storeStrong((id *)&v36->_inputWeights, a4);
    v38 = v36;
    p_hiddenWeights = (id *)&v36->_hiddenWeights;
    objc_storeStrong(p_hiddenWeights, a5);
    peepholeWeights = v38->_peepholeWeights;
    v38->_peepholeWeights = 0;

    p_biases = (id *)&v38->_biases;
    objc_storeStrong((id *)&v38->_biases, a7);
    objc_storeStrong((id *)&v38->_gateActivations, obj);
    objc_storeStrong((id *)&v38->_outputResultActivation, a9);
    peepholeWeightsParameters = v38->_peepholeWeightsParameters;
    v42 = (void *)MEMORY[0x1E4F1CBF0];
    obja = v38;
    v38->_peepholeWeightsParameters = (NSArray *)MEMORY[0x1E4F1CBF0];

    v43 = (void *)[v42 mutableCopy];
    v44 = (void *)[v42 mutableCopy];
    id v64 = (id)[v42 mutableCopy];
    if ([v24 count])
    {
      unint64_t v45 = 0;
      do
      {
        v46 = [v24 objectAtIndexedSubscript:v45];
        v47 = +[MLCTensorParameter parameterWithTensor:v46];
        [v43 setObject:v47 atIndexedSubscript:v45];

        v48 = [v70 objectAtIndexedSubscript:v45];
        v49 = +[MLCTensorParameter parameterWithTensor:v48];
        [v44 setObject:v49 atIndexedSubscript:v45];

        v50 = [*p_inputWeights objectAtIndexedSubscript:v45];
        [v50 setIsLayerParameter:1];

        v51 = [*p_hiddenWeights objectAtIndexedSubscript:v45];
        [v51 setIsLayerParameter:1];

        ++v45;
      }
      while (v45 < [v24 count]);
    }
    v68 = v43;
    if (v74)
    {
      v52 = v64;
      if ([v74 count])
      {
        unint64_t v53 = 0;
        do
        {
          v54 = [v74 objectAtIndexedSubscript:v53];
          v55 = +[MLCTensorParameter parameterWithTensor:v54];
          [v64 setObject:v55 atIndexedSubscript:v53];

          v56 = [*p_biases objectAtIndexedSubscript:v53];
          [v56 setIsLayerParameter:1];

          ++v53;
        }
        while (v53 < [v74 count]);
      }
      uint64_t v57 = [v64 copy];
      v36 = obja;
      biasesParameters = obja->_biasesParameters;
      obja->_biasesParameters = (NSArray *)v57;
    }
    else
    {
      v52 = v64;
      v36 = obja;
      biasesParameters = obja->_biasesParameters;
      obja->_biasesParameters = 0;
    }
    v22 = v70;
    v27 = v72;

    uint64_t v59 = [v68 copy];
    inputWeightsParameters = v36->_inputWeightsParameters;
    v36->_inputWeightsParameters = (NSArray *)v59;

    uint64_t v61 = [v44 copy];
    hiddenWeightsParameters = v36->_hiddenWeightsParameters;
    v36->_hiddenWeightsParameters = (NSArray *)v61;

    v75.receiver = v36;
    v75.super_class = (Class)MLCLSTMLayer;
    [(MLCLayer *)&v75 setIsUpdatable:1];

    v23 = v73;
  }
  v32 = v36;
  v29 = v32;
  v31 = v71;
LABEL_19:

  return v29;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v34 = a5;
  uint64_t v11 = [v10 count];
  if (!v11)
  {
LABEL_10:
    v33 = [v9 computeEngine];
    uint64_t v18 = [(MLCLSTMLayer *)self descriptor];
    v19 = [(MLCLSTMLayer *)self inputWeights];
    uint64_t v20 = [(MLCLSTMLayer *)self hiddenWeights];
    v32 = [(MLCLSTMLayer *)self peepholeWeights];
    id v21 = [(MLCLSTMLayer *)self biases];
    v22 = [(MLCLSTMLayer *)self gateActivations];
    v23 = [(MLCLSTMLayer *)self outputResultActivation];
    LOBYTE(v31) = [(MLCLayer *)self compileForInferenceOnly];
    v24 = [v33 lstmLayerWithDescriptor:v18 inputWeights:v19 hiddenWeights:v20 peepholeWeights:v32 biasTerms:v21 gateActivations:v22 outputResultActivation:v23 inferenceOnly:v31];

    if (v24 && [v24 count])
    {
      v25 = [v9 computeEngine];
      v26 = v34;
      char v27 = [v25 compileLayerDeviceOps:v24 sourceTensors:v10 resultTensor:v34];

      v35.receiver = self;
      v35.super_class = (Class)MLCLSTMLayer;
      [(MLCLayer *)&v35 bindDevice:v9 deviceOps:v24];
    }
    else
    {
      v28 = +[MLCLog framework];
      v26 = v34;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:]();
      }

      char v27 = 0;
    }
    goto LABEL_19;
  }
  uint64_t v12 = v11;
  if (v11 == 2)
  {
    uint64_t v12 = 1;
  }
  else
  {
    if (v11 != 4) {
      goto LABEL_7;
    }
    uint64_t v12 = 3;
  }
  v13 = [v10 objectAtIndexedSubscript:v12];
  objc_msgSend(v13, "setComputeFlags:", objc_msgSend(v13, "computeFlags") | 8);

LABEL_7:
  uint64_t v14 = 0;
  while (1)
  {
    id v15 = [v10 objectAtIndexedSubscript:v14];
    id v16 = [v15 descriptor];
    uint64_t v17 = [v16 dataType];

    if (!+[MLCLayer supportsDataType:v17 onDevice:v9]) {
      break;
    }
    if (v12 == ++v14) {
      goto LABEL_10;
    }
  }
  v24 = +[MLCLog framework];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v30 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v37 = v30;
    __int16 v38 = 2048;
    uint64_t v39 = v14;
    __int16 v40 = 1024;
    int v41 = v17;
    __int16 v42 = 2112;
    id v43 = v9;
    _os_log_error_impl(&dword_1DD0C9000, v24, OS_LOG_TYPE_ERROR, "%@: sourceTensor[%lu] uses unsupported data type = %d on a device = %@", buf, 0x26u);
  }
  char v27 = 0;
  v26 = v34;
LABEL_19:

  return v27;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  v7 = [(MLCLSTMLayer *)self descriptor];
  char v8 = [v7 batchFirst];

  if ((v8 & 1) == 0)
  {
    if (a4 != 2) {
      return a3;
    }
LABEL_5:
    id v9 = [(MLCLSTMLayer *)self descriptor];
    uint64_t v10 = [v9 hiddenSize];
    uint64_t v11 = [(MLCLSTMLayer *)self descriptor];
    a3 = v10 << [v11 isBidirectional];

    return a3;
  }
  if (a4 == 1) {
    goto LABEL_5;
  }
  v13.receiver = self;
  v13.super_class = (Class)MLCLSTMLayer;
  return [(MLCLayer *)&v13 resultSizeFromSourceSize:a3 dimension:a4];
}

- (id)resultTensorFromSources:(id)a3
{
  v104[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectAtIndexedSubscript:0];
  v6 = [v5 descriptor];
  v7 = [v6 shape];
  uint64_t v8 = [v7 count];

  if (v8 == 3)
  {
    id v9 = [(MLCLSTMLayer *)self descriptor];
    int v10 = [v9 returnsSequences];

    uint64_t v11 = [v4 objectAtIndexedSubscript:0];
    uint64_t v12 = [v11 descriptor];
    objc_super v13 = [v12 shape];
    uint64_t v14 = [v13 objectAtIndexedSubscript:2];
    uint64_t v15 = [v14 unsignedIntegerValue];

    uint64_t v16 = 1;
    unint64_t v17 = [(MLCLSTMLayer *)self resultSizeFromSourceSize:v15 dimension:1];
    uint64_t v18 = [v4 objectAtIndexedSubscript:0];
    v19 = [v18 descriptor];
    uint64_t v20 = [v19 shape];
    id v21 = [v20 objectAtIndexedSubscript:0];
    uint64_t v22 = [v21 unsignedIntegerValue];

    if (v10)
    {
      v23 = [v4 objectAtIndexedSubscript:0];
      v24 = [v23 descriptor];
      v25 = [v24 shape];
      v26 = [v25 objectAtIndexedSubscript:1];
      uint64_t v16 = [v26 unsignedIntegerValue];
    }
    char v27 = [v4 objectAtIndexedSubscript:0];
    v28 = [v27 descriptor];
    char v29 = [v28 variableLengthSequences];

    uint64_t v30 = [NSNumber numberWithUnsignedInteger:v22];
    uint64_t v31 = (void *)v30;
    if (v29)
    {
      v103[0] = v30;
      v100 = [NSNumber numberWithUnsignedInteger:v16];
      v103[1] = v100;
      v98 = [NSNumber numberWithUnsignedInteger:v17];
      v103[2] = v98;
      uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:3];
      v96 = [v4 objectAtIndexedSubscript:0];
      v33 = [v96 descriptor];
      id v34 = [v33 sequenceLengths];
      objc_super v35 = [v4 objectAtIndexedSubscript:0];
      v36 = [v35 descriptor];
      uint64_t v37 = [v36 sortedSequences];
      [v4 objectAtIndexedSubscript:0];
      __int16 v38 = v95 = v31;
      uint64_t v39 = [v38 descriptor];
      __int16 v40 = (void *)v32;
      int v41 = +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v32, v34, v37, [v39 dataType]);
    }
    else
    {
      v104[0] = v30;
      v89 = [NSNumber numberWithUnsignedInteger:v16];
      v104[1] = v89;
      v90 = [NSNumber numberWithUnsignedInteger:v17];
      v104[2] = v90;
      v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:3];
      v92 = [v4 objectAtIndexedSubscript:0];
      v93 = [v92 descriptor];
      int v41 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v91, [v93 dataType]);
    }
    v46 = +[MLCTensor tensorWithDescriptor:v41];
  }
  else
  {
    __int16 v42 = [v4 objectAtIndexedSubscript:0];
    id v43 = [v42 descriptor];
    uint64_t v44 = [v43 shape];
    uint64_t v45 = [v44 count];

    v46 = 0;
    if (v45 == 4)
    {
      v47 = [(MLCLSTMLayer *)self descriptor];
      int v48 = [v47 returnsSequences];

      v49 = [v4 objectAtIndexedSubscript:0];
      v50 = [v49 descriptor];
      v51 = [v50 shape];
      uint64_t v52 = 1;
      unint64_t v53 = [v51 objectAtIndexedSubscript:1];
      uint64_t v54 = [v53 unsignedIntegerValue];

      unint64_t v55 = [(MLCLSTMLayer *)self resultSizeFromSourceSize:v54 dimension:1];
      if (v48)
      {
        v56 = [v4 objectAtIndexedSubscript:0];
        uint64_t v57 = [v56 descriptor];
        v58 = [v57 shape];
        uint64_t v59 = [v58 objectAtIndexedSubscript:3];
        uint64_t v52 = [v59 unsignedIntegerValue];
      }
      unint64_t v60 = [(MLCLSTMLayer *)self resultSizeFromSourceSize:v52 dimension:3];
      uint64_t v61 = [v4 objectAtIndexedSubscript:0];
      v62 = [v61 descriptor];
      v63 = [v62 shape];
      id v64 = [v63 objectAtIndexedSubscript:2];
      uint64_t v65 = [v64 unsignedIntegerValue];

      unint64_t v66 = [(MLCLSTMLayer *)self resultSizeFromSourceSize:v65 dimension:2];
      v67 = [v4 objectAtIndexedSubscript:0];
      v68 = [v67 descriptor];
      v69 = [v68 shape];
      v70 = [v69 objectAtIndexedSubscript:0];
      uint64_t v71 = [v70 unsignedIntegerValue];

      id v72 = [v4 objectAtIndexedSubscript:0];
      id v73 = [v72 descriptor];
      LODWORD(v69) = [v73 variableLengthSequences];

      if (v69)
      {
        id v74 = [v4 objectAtIndexedSubscript:0];
        objc_super v75 = [v74 descriptor];
        objc_super v76 = [v75 sequenceLengths];
        v77 = [v76 objectAtIndexedSubscript:0];
        uint64_t v78 = [v77 unsignedIntegerValue];

        v101 = [NSNumber numberWithUnsignedInteger:v71];
        v102[0] = v101;
        v99 = [NSNumber numberWithUnsignedInteger:v55];
        v102[1] = v99;
        v102[2] = &unk_1F3876C30;
        v97 = [NSNumber numberWithUnsignedInteger:v78];
        v102[3] = v97;
        v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:4];
        v80 = [v4 objectAtIndexedSubscript:0];
        v81 = [v80 descriptor];
        v82 = [v81 sequenceLengths];
        v83 = [v4 objectAtIndexedSubscript:0];
        v84 = [v83 descriptor];
        uint64_t v85 = [v84 sortedSequences];
        v86 = [v4 objectAtIndexedSubscript:0];
        v87 = [v86 descriptor];
        v88 = +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v79, v82, v85, [v87 dataType]);

        v46 = +[MLCTensor tensorWithDescriptor:v88];
      }
      else
      {
        v46 = +[MLCTensor tensorWithWidth:v60 height:v66 featureChannelCount:v55 batchSize:v71];
      }
    }
  }

  return v46;
}

- (id)resultStateTensorWithSources:(id)a3
{
  v33[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MLCLSTMLayer *)self descriptor];
  uint64_t v6 = [v5 layerCount];

  v7 = [(MLCLSTMLayer *)self descriptor];
  if ([v7 isBidirectional]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }

  id v9 = [v4 objectAtIndexedSubscript:0];

  int v10 = [v9 descriptor];
  uint64_t v11 = [v10 shape];
  uint64_t v12 = [v11 objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 unsignedIntegerValue];

  uint64_t v14 = [(MLCLSTMLayer *)self descriptor];
  uint64_t v30 = [v14 hiddenSize];

  uint64_t v15 = [NSNumber numberWithUnsignedInteger:v6];
  v33[0] = v15;
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:v8];
  v33[1] = v16;
  unint64_t v17 = [NSNumber numberWithUnsignedInteger:v13];
  v33[2] = v17;
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:v30];
  v33[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  uint64_t v20 = +[MLCTensor tensorWithShape:v19];

  id v21 = [NSNumber numberWithUnsignedInteger:v6];
  v32[0] = v21;
  uint64_t v22 = [NSNumber numberWithUnsignedInteger:v8];
  v32[1] = v22;
  v23 = [NSNumber numberWithUnsignedInteger:v13];
  v32[2] = v23;
  v24 = [NSNumber numberWithUnsignedInteger:v30];
  v32[3] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  v26 = +[MLCTensor tensorWithShape:v25];

  v31[0] = v20;
  v31[1] = v26;
  char v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v28 = (void *)[v27 copy];

  return v28;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(MLCLSTMLayer *)self inputWeights];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(MLCLSTMLayer *)self inputWeights];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      do
      {
        uint64_t v11 = [(MLCLSTMLayer *)self inputWeightsParameters];
        uint64_t v12 = [v11 objectAtIndexedSubscript:v10];
        uint64_t v13 = [(MLCLayer *)self device];
        [v12 allocateDataForOptimizer:v5 device:v13 isVector:0];

        uint64_t v14 = [(MLCLSTMLayer *)self hiddenWeightsParameters];
        uint64_t v15 = [v14 objectAtIndexedSubscript:v10];
        uint64_t v16 = [(MLCLayer *)self device];
        [v15 allocateDataForOptimizer:v5 device:v16 isVector:0];

        ++v10;
        unint64_t v17 = [(MLCLSTMLayer *)self inputWeights];
        unint64_t v18 = [v17 count];
      }
      while (v10 < v18);
    }
    v19 = [(MLCLSTMLayer *)self biases];

    if (v19)
    {
      uint64_t v20 = [(MLCLSTMLayer *)self biases];
      uint64_t v21 = [v20 count];

      if (v21)
      {
        unint64_t v22 = 0;
        do
        {
          v23 = [(MLCLSTMLayer *)self biasesParameters];
          v24 = [v23 objectAtIndexedSubscript:v22];
          v25 = [(MLCLayer *)self device];
          [v24 allocateDataForOptimizer:v5 device:v25 isVector:0];

          ++v22;
          v26 = [(MLCLSTMLayer *)self biases];
          unint64_t v27 = [v26 count];
        }
        while (v22 < v27);
      }
    }
    v28 = [(MLCLayer *)self device];
    char v29 = [v28 computeEngine];
    uint64_t v30 = [(MLCLayer *)self deviceOps];
    uint64_t v31 = [(MLCLSTMLayer *)self inputWeights];
    uint64_t v32 = [(MLCLSTMLayer *)self hiddenWeights];
    v33 = [(MLCLSTMLayer *)self biases];
    [v29 setLSTMLayerOptimizerDataForDeviceOps:v30 inputWeights:v31 hiddenWeights:v32 biasTerms:v33];
  }
  else
  {
    id v34 = +[MLCLog framework];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[MLCLSTMLayer allocateDataForOptimizer:](a2);
    }
  }
  return v7 != 0;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = [(MLCLSTMLayer *)self inputWeights];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      unint64_t v10 = [(MLCLSTMLayer *)self inputWeights];
      uint64_t v11 = [v10 objectAtIndexedSubscript:v8];
      uint64_t v12 = [v11 descriptor];
      v9 += [v12 tensorAllocationSizeInBytes];

      ++v8;
      uint64_t v13 = [(MLCLSTMLayer *)self inputWeights];
      unint64_t v14 = [v13 count];
    }
    while (v8 < v14);
  }
  else
  {
    unint64_t v9 = 0;
  }
  uint64_t v15 = [(MLCLSTMLayer *)self hiddenWeights];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    unint64_t v17 = 0;
    do
    {
      unint64_t v18 = [(MLCLSTMLayer *)self hiddenWeights];
      v19 = [v18 objectAtIndexedSubscript:v17];
      uint64_t v20 = [v19 descriptor];
      v9 += [v20 tensorAllocationSizeInBytes];

      ++v17;
      uint64_t v21 = [(MLCLSTMLayer *)self hiddenWeights];
      unint64_t v22 = [v21 count];
    }
    while (v17 < v22);
  }
  v23 = [(MLCLSTMLayer *)self peepholeWeights];

  if (v23)
  {
    v24 = [(MLCLSTMLayer *)self peepholeWeights];
    uint64_t v25 = [v24 count];

    if (v25)
    {
      unint64_t v26 = 0;
      do
      {
        unint64_t v27 = [(MLCLSTMLayer *)self peepholeWeights];
        v28 = [v27 objectAtIndexedSubscript:v26];
        char v29 = [v28 descriptor];
        v9 += [v29 tensorAllocationSizeInBytes];

        ++v26;
        uint64_t v30 = [(MLCLSTMLayer *)self peepholeWeights];
        unint64_t v31 = [v30 count];
      }
      while (v26 < v31);
    }
  }
  uint64_t v32 = [(MLCLSTMLayer *)self biases];

  if (v32)
  {
    v33 = [(MLCLSTMLayer *)self biases];
    uint64_t v34 = [v33 count];

    if (v34)
    {
      unint64_t v35 = 0;
      do
      {
        v36 = [(MLCLSTMLayer *)self biases];
        uint64_t v37 = [v36 objectAtIndexedSubscript:v35];
        __int16 v38 = [v37 descriptor];
        v9 += [v38 tensorAllocationSizeInBytes];

        ++v35;
        uint64_t v39 = [(MLCLSTMLayer *)self biases];
        unint64_t v40 = [v39 count];
      }
      while (v35 < v40);
    }
  }
  v48.receiver = self;
  v48.super_class = (Class)MLCLSTMLayer;
  int v41 = [(MLCLayer *)&v48 device];

  if (v41)
  {
    v47.receiver = self;
    v47.super_class = (Class)MLCLSTMLayer;
    __int16 v42 = [(MLCLayer *)&v47 device];
    id v43 = [v42 computeEngine];
    v46.receiver = self;
    v46.super_class = (Class)MLCLSTMLayer;
    uint64_t v44 = [(MLCLayer *)&v46 deviceOps];
    v9 += [v43 allocatedDeviceDataSizeForTraining:v4 layer:v44];
  }
  return v9;
}

- (void)allocateGradientsForParameters
{
  v3 = [(MLCLSTMLayer *)self inputWeights];
  id v11 = (id)[v3 mutableCopy];

  BOOL v4 = [(MLCLSTMLayer *)self hiddenWeights];
  [v11 addObjectsFromArray:v4];

  id v5 = [(MLCLSTMLayer *)self descriptor];
  int v6 = [v5 usesBiases];

  if (v6)
  {
    uint64_t v7 = [(MLCLSTMLayer *)self biases];
    [v11 addObjectsFromArray:v7];
  }
  unint64_t v8 = [(MLCLayer *)self device];
  unint64_t v9 = [v8 computeEngine];
  unint64_t v10 = [(MLCLayer *)self deviceOps];
  [v9 allocateParameterGradientsForDeviceOps:v10 parameters:v11];
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v5 = a3;
  int v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 descriptor];
  unint64_t v8 = [v7 shape];
  v68 = v5;
  if ([v8 count] == 3)
  {
  }
  else
  {
    unint64_t v9 = [v5 objectAtIndexedSubscript:0];
    unint64_t v10 = [v9 descriptor];
    id v11 = [v10 shape];
    uint64_t v12 = [v11 count];

    id v5 = v68;
    if (v12 != 4)
    {
LABEL_37:
      BOOL v52 = 0;
      goto LABEL_39;
    }
  }
  uint64_t v57 = a2;
  if ([v5 count] == 3 || objc_msgSend(v5, "count") == 4)
  {
    uint64_t v13 = [(MLCLSTMLayer *)self descriptor];
    uint64_t v14 = 1;
    if ([v13 isBidirectional]) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
    uint64_t v73 = v15;

    uint64_t v16 = [(MLCLSTMLayer *)self descriptor];
    uint64_t v67 = [v16 layerCount];

    unint64_t v17 = [(MLCLSTMLayer *)self descriptor];
    int v18 = [v17 batchFirst];
    v19 = [v5 objectAtIndexedSubscript:0];
    uint64_t v20 = [v19 descriptor];
    uint64_t v21 = [v20 shape];
    unint64_t v22 = [v21 objectAtIndexedSubscript:v18 ^ 1u];
    uint64_t v62 = [v22 unsignedIntegerValue];

    id v5 = v68;
    v23 = [(MLCLSTMLayer *)self descriptor];
    uint64_t v58 = [v23 hiddenSize];

    while (1)
    {
      v24 = [v5 objectAtIndexedSubscript:v14];
      uint64_t v25 = [v24 descriptor];
      unint64_t v26 = [v25 shape];
      if ([v26 count] == 4) {
        goto LABEL_16;
      }
      unint64_t v27 = [v5 objectAtIndexedSubscript:v14];
      v28 = [v27 descriptor];
      char v29 = [v28 shape];
      uint64_t v30 = [v29 objectAtIndexedSubscript:0];
      if ([v30 unsignedIntegerValue] != v73) {
        break;
      }
      id v72 = [v5 objectAtIndexedSubscript:v14];
      uint64_t v71 = [v72 descriptor];
      v70 = [v71 shape];
      v69 = [v70 objectAtIndexedSubscript:1];
      if ([v69 unsignedIntegerValue] == v67)
      {
        unint64_t v66 = [v5 objectAtIndexedSubscript:v14];
        uint64_t v65 = [v66 descriptor];
        id v64 = [v65 shape];
        v63 = [v64 objectAtIndexedSubscript:2];
        if ([v63 unsignedIntegerValue] == v62)
        {
          uint64_t v61 = [v5 objectAtIndexedSubscript:v14];
          unint64_t v60 = [v61 descriptor];
          uint64_t v59 = [v60 shape];
          unint64_t v31 = [v59 objectAtIndexedSubscript:3];
          BOOL v32 = [v31 unsignedIntegerValue] == v58;

          id v5 = v68;
        }
        else
        {
          BOOL v32 = 0;
        }
      }
      else
      {
        BOOL v32 = 0;
      }

      if (v32) {
        goto LABEL_37;
      }
LABEL_21:
      if (++v14 == 3) {
        goto LABEL_22;
      }
    }

LABEL_16:
    goto LABEL_21;
  }
LABEL_22:
  if ([v5 count] != 2 && objc_msgSend(v5, "count") != 4)
  {
    BOOL v52 = 1;
    goto LABEL_39;
  }
  if ([v5 count] == 2) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = 3;
  }
  uint64_t v34 = [v5 objectAtIndexedSubscript:v33];
  [v34 setSkipWritingToDevice:1];
  unint64_t v35 = [v34 descriptor];
  int v36 = [v35 dataType];

  if (v36 != 7)
  {
    unint64_t v55 = +[MLCLog framework];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      -[MLCLSTMLayer isSupportedShapeForTensorSources:](v57);
    }

    goto LABEL_37;
  }
  uint64_t v37 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  __int16 v38 = [v34 descriptor];
  unint64_t v39 = [v38 tensorAllocationSizeInBytes];
  unint64_t v40 = [v34 descriptor];
  unint64_t v41 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", [v40 dataType]);

  id v42 = [v34 data];
  uint64_t v43 = [v42 bytes];

  if (v41 <= v39)
  {
    uint64_t v44 = 0;
    if (v39 / v41 <= 1) {
      uint64_t v45 = 1;
    }
    else {
      uint64_t v45 = v39 / v41;
    }
    do
    {
      objc_super v46 = [NSNumber numberWithInt:*(unsigned int *)(v43 + 4 * v44)];
      [v37 setObject:v46 atIndexedSubscript:v44];

      ++v44;
    }
    while (v45 != v44);
  }
  objc_super v47 = [v68 objectAtIndexedSubscript:0];
  objc_super v48 = [v47 descriptor];
  v49 = [v48 shape];
  v50 = [v68 objectAtIndexedSubscript:0];
  v51 = [v50 descriptor];
  BOOL v52 = 1;
  unint64_t v53 = +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v49, v37, 1, [v51 dataType]);
  uint64_t v54 = [v68 objectAtIndexedSubscript:0];
  [v54 setDescriptor:v53];

LABEL_39:
  return v52;
}

- (void)linkAssociatedTensors
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v3 = [(MLCLSTMLayer *)self inputWeights];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v40;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = [*(id *)(*((void *)&v39 + 1) + 8 * v7) childLayers];
        [v8 addObject:self];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v5);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  unint64_t v9 = [(MLCLSTMLayer *)self hiddenWeights];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v35 + 1) + 8 * v13) childLayers];
        [v14 addObject:self];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v11);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v15 = [(MLCLSTMLayer *)self peepholeWeights];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v31 + 1) + 8 * v19) childLayers];
        [v20 addObject:self];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v17);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v21 = [(MLCLSTMLayer *)self biases];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v28;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v21);
        }
        unint64_t v26 = [*(id *)(*((void *)&v27 + 1) + 8 * v25) childLayers];
        [v26 addObject:self];

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v23);
  }
}

- (void)unlinkAssociatedTensors
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v3 = [(MLCLSTMLayer *)self inputWeights];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v40;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = [*(id *)(*((void *)&v39 + 1) + 8 * v7) childLayers];
        [v8 removeObject:self];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v5);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  unint64_t v9 = [(MLCLSTMLayer *)self hiddenWeights];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v35 + 1) + 8 * v13) childLayers];
        [v14 removeObject:self];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v11);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v15 = [(MLCLSTMLayer *)self peepholeWeights];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v31 + 1) + 8 * v19) childLayers];
        [v20 removeObject:self];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v17);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v21 = [(MLCLSTMLayer *)self biases];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v28;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v21);
        }
        unint64_t v26 = [*(id *)(*((void *)&v27 + 1) + 8 * v25) childLayers];
        [v26 removeObject:self];

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v23);
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCLSTMLayer *)self descriptor];
  uint64_t v7 = [(MLCLayer *)self conditionalTreeNode];
  unint64_t v8 = [(MLCLayer *)self resultTensors];
  unint64_t v9 = [v3 stringWithFormat:@"%@: { lstmDescriptor=%@ : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8];

  return v9;
}

- (id)summarizedDOTDescription
{
  uint64_t v25 = NSString;
  v3 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v3);
  NSUInteger v22 = [(MLCLayer *)self layerID];
  long long v27 = [(MLCLSTMLayer *)self descriptor];
  uint64_t v21 = [v27 inputSize];
  unint64_t v26 = [(MLCLSTMLayer *)self descriptor];
  uint64_t v20 = [v26 hiddenSize];
  uint64_t v24 = [(MLCLSTMLayer *)self descriptor];
  uint64_t v19 = [v24 layerCount];
  uint64_t v4 = [(MLCLSTMLayer *)self descriptor];
  unsigned int v18 = [v4 usesBiases];
  uint64_t v5 = [(MLCLSTMLayer *)self descriptor];
  unsigned int v6 = [v5 batchFirst];
  uint64_t v7 = [(MLCLSTMLayer *)self descriptor];
  unsigned int v8 = [v7 isBidirectional];
  unint64_t v9 = [(MLCLSTMLayer *)self descriptor];
  unsigned int v10 = [v9 returnsSequences];
  uint64_t v11 = [(MLCLSTMLayer *)self descriptor];
  [v11 dropout];
  double v13 = v12;
  uint64_t v14 = [(MLCLSTMLayer *)self descriptor];
  uint64_t v15 = MLCLSTMResultModeDebugDescription((MLCLSTMResultMode)[v14 resultMode]);
  uint64_t v16 = [v25 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Input Size: %lu     Hidden Size: %lu     Layer Count: %lu<BR />Uses Biases: %hhd    Batch First: %hhd    Bidirectional: %hhd<BR />Returns Sequences: %hhd                   Dropout: %.03f<BR />Result Mode: %@</FONT>>", v23, v22, v21, v20, v19, v18, v6, v8, v10, *(void *)&v13, v15];

  return v16;
}

- (unint64_t)parametersCount
{
  v3 = [(MLCLSTMLayer *)self inputWeightsParameters];
  uint64_t v4 = [v3 count];

  uint64_t v5 = [(MLCLSTMLayer *)self hiddenWeightsParameters];
  unint64_t v6 = [v5 count] + v4;

  uint64_t v7 = [(MLCLSTMLayer *)self descriptor];
  LODWORD(v5) = [v7 usesBiases];

  if (v5) {
    return v6 + 4;
  }
  else {
    return v6;
  }
}

- (MLCLSTMDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSArray)gateActivations
{
  return self->_gateActivations;
}

- (MLCActivationDescriptor)outputResultActivation
{
  return self->_outputResultActivation;
}

- (NSArray)inputWeights
{
  return self->_inputWeights;
}

- (NSArray)hiddenWeights
{
  return self->_hiddenWeights;
}

- (NSArray)peepholeWeights
{
  return self->_peepholeWeights;
}

- (NSArray)biases
{
  return self->_biases;
}

- (NSArray)inputWeightsParameters
{
  return self->_inputWeightsParameters;
}

- (NSArray)hiddenWeightsParameters
{
  return self->_hiddenWeightsParameters;
}

- (NSArray)peepholeWeightsParameters
{
  return self->_peepholeWeightsParameters;
}

- (NSArray)biasesParameters
{
  return self->_biasesParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasesParameters, 0);
  objc_storeStrong((id *)&self->_peepholeWeightsParameters, 0);
  objc_storeStrong((id *)&self->_hiddenWeightsParameters, 0);
  objc_storeStrong((id *)&self->_inputWeightsParameters, 0);
  objc_storeStrong((id *)&self->_biases, 0);
  objc_storeStrong((id *)&self->_peepholeWeights, 0);
  objc_storeStrong((id *)&self->_hiddenWeights, 0);
  objc_storeStrong((id *)&self->_inputWeights, 0);
  objc_storeStrong((id *)&self->_outputResultActivation, 0);
  objc_storeStrong((id *)&self->_gateActivations, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)initWithDescriptor:(const char *)a1 inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: LSTM descriptor bias is enabled but bias terms are nil", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: peephole weights are not supported for LSTM", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: gate activations array size must be %lu", v4, v5, v6, v7, 2u);
}

- (void)initWithDescriptor:(const char *)a1 inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: LSTM descriptor bias is disabled but bias terms are not nil", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.5()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: bias terms array size must be %lu", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.6()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: peephole weights array size must be %lu", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.7()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: hidden weights array size must be %lu", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.8()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: input weights array size must be %lu", v4, v5, v6, v7, v8);
}

- (void)allocateDataForOptimizer:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: inputWeights are empty for LSTM", v4, v5, v6, v7, v8);
}

- (void)isSupportedShapeForTensorSources:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@the sequence length tensor must be of type MLCDataTypeInt32", v4, v5, v6, v7, v8);
}

@end