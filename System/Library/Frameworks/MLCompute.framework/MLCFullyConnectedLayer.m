@interface MLCFullyConnectedLayer
+ (MLCFullyConnectedLayer)layerWithWeights:(MLCTensor *)weights biases:(MLCTensor *)biases descriptor:(MLCConvolutionDescriptor *)descriptor;
- (BOOL)allocateDataForOptimizer:(id)a3;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCConvolutionDescriptor)descriptor;
- (MLCFullyConnectedLayer)initWithWeights:(id)a3 biases:(id)a4 descriptor:(id)a5;
- (MLCTensor)biases;
- (MLCTensor)weights;
- (MLCTensorParameter)biasesParameter;
- (MLCTensorParameter)weightsParameter;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (int)accumulatorPrecisionOption;
- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4;
- (unint64_t)parametersCount;
- (void)linkAssociatedTensors;
- (void)unlinkAssociatedTensors;
@end

@implementation MLCFullyConnectedLayer

+ (MLCFullyConnectedLayer)layerWithWeights:(MLCTensor *)weights biases:(MLCTensor *)biases descriptor:(MLCConvolutionDescriptor *)descriptor
{
  v8 = descriptor;
  v9 = biases;
  v10 = weights;
  v11 = (void *)[objc_alloc((Class)a1) initWithWeights:v10 biases:v9 descriptor:v8];

  return (MLCFullyConnectedLayer *)v11;
}

- (MLCFullyConnectedLayer)initWithWeights:(id)a3 biases:(id)a4 descriptor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 descriptor];
  v12 = [v11 shape];
  v13 = [v12 objectAtIndexedSubscript:0];
  unint64_t v14 = [v13 unsignedIntegerValue];

  if (v14 >= 2)
  {
    v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:](a2);
    }
    goto LABEL_11;
  }
  v16 = [v8 data];

  if (!v16)
  {
    v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:](a2);
    }
    goto LABEL_11;
  }
  id v69 = v10;
  if (v9)
  {
    v17 = [v9 descriptor];
    v18 = [v17 shape];
    v19 = [v18 objectAtIndexedSubscript:0];
    unint64_t v20 = [v19 unsignedIntegerValue];

    if (v20 >= 2)
    {
      v15 = +[MLCLog framework];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:](a2);
      }
      goto LABEL_11;
    }
    v24 = [v9 descriptor];
    v25 = [v24 shape];
    v26 = [v25 objectAtIndexedSubscript:1];
    uint64_t v27 = [v26 unsignedIntegerValue];
    uint64_t v28 = [v10 outputFeatureChannelCount];

    if (v27 != v28)
    {
      v34 = +[MLCLog framework];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:].cold.7(a2);
      }

      v21 = 0;
      id v10 = v69;
      goto LABEL_12;
    }
    v29 = [v9 descriptor];
    v68 = [v29 shape];
    unint64_t v30 = [v68 count];
    if (v30 >= 4)
    {
      v31 = [v9 descriptor];
      v32 = [v31 shape];
      v33 = [v32 objectAtIndexedSubscript:3];
      if ((unint64_t)[v33 unsignedIntegerValue] > 1)
      {

        id v10 = v69;
LABEL_28:
        v15 = +[MLCLog framework];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:].cold.4(a2);
        }
        goto LABEL_11;
      }
      v61 = v33;
      v63 = v32;
      v64 = v31;
    }
    unint64_t v67 = v30;
    v35 = objc_msgSend(v9, "descriptor", v61);
    v36 = [v35 shape];
    if ((unint64_t)[v36 count] < 3)
    {
      BOOL v40 = 0;
    }
    else
    {
      v65 = [v9 descriptor];
      v66 = v29;
      v37 = [v65 shape];
      v38 = [v37 objectAtIndexedSubscript:2];
      BOOL v39 = (unint64_t)[v38 unsignedIntegerValue] > 1;

      BOOL v40 = v39;
      v29 = v66;
    }
    id v10 = v69;

    if (v67 >= 4)
    {
    }
    if (v40) {
      goto LABEL_28;
    }
    v41 = [v8 childLayers];
    uint64_t v42 = [v41 count];
    v43 = [v9 childLayers];
    uint64_t v44 = [v43 count];

    if (v42 != v44)
    {
      v15 = +[MLCLog framework];
      id v10 = v69;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        v21 = 0;
LABEL_12:
        v22 = self;
        goto LABEL_13;
      }
LABEL_42:
      -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:].cold.5(a2);
      goto LABEL_11;
    }
    v45 = [v8 childLayers];
    uint64_t v46 = [v45 count];

    if (v46)
    {
      unint64_t v47 = 0;
      while (1)
      {
        v48 = [v8 childLayers];
        v49 = [v48 objectAtIndexedSubscript:v47];
        v50 = [v9 childLayers];
        v51 = [v50 objectAtIndexedSubscript:v47];

        if (v49 != v51) {
          break;
        }
        ++v47;
        v52 = [v8 childLayers];
        unint64_t v53 = [v52 count];

        if (v47 >= v53) {
          goto LABEL_35;
        }
      }
      v15 = +[MLCLog framework];
      id v10 = v69;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      goto LABEL_42;
    }
  }
LABEL_35:
  v73.receiver = self;
  v73.super_class = (Class)MLCFullyConnectedLayer;
  v54 = [(MLCLayer *)&v73 initWithLabel:@"FullyConnected"];
  v55 = v54;
  if (v54)
  {
    v54->_accumulatorPrecisionOption = 0;
    objc_storeStrong((id *)&v54->_weights, a3);
    objc_storeStrong((id *)&v55->_descriptor, a5);
    objc_storeStrong((id *)&v55->_biases, a4);
    uint64_t v56 = +[MLCTensorParameter parameterWithTensor:v8];
    weightsParameter = v55->_weightsParameter;
    v55->_weightsParameter = (MLCTensorParameter *)v56;

    [(MLCTensor *)v55->_weights setIsLayerParameter:1];
    if (v9)
    {
      uint64_t v58 = +[MLCTensorParameter parameterWithTensor:v9];
      biasesParameter = v55->_biasesParameter;
      v55->_biasesParameter = (MLCTensorParameter *)v58;

      [(MLCTensor *)v55->_biases setIsLayerParameter:1];
    }
    else
    {
      v60 = v55->_biasesParameter;
      v55->_biasesParameter = 0;
    }
    v72.receiver = v55;
    v72.super_class = (Class)MLCFullyConnectedLayer;
    [(MLCLayer *)&v72 setIsUpdatable:1];
  }
  v22 = v55;
  v21 = v22;
  id v10 = v69;
LABEL_13:

  return v21;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(MLCFullyConnectedLayer *)self weights];
  v13 = [v12 parentLayers];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCFullyConnectedLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2, self);
    }
    goto LABEL_7;
  }
  v16 = [(MLCFullyConnectedLayer *)self biases];
  v17 = [v16 parentLayers];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCFullyConnectedLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2, self);
    }
    goto LABEL_7;
  }
  v85 = a2;
  id v86 = v10;
  v21 = [(MLCFullyConnectedLayer *)self biases];
  v22 = [v21 childLayers];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    v24 = [(MLCFullyConnectedLayer *)self weights];
    v25 = [v24 childLayers];
    uint64_t v26 = [v25 count];
    uint64_t v27 = [(MLCFullyConnectedLayer *)self biases];
    uint64_t v28 = [v27 childLayers];
    uint64_t v29 = [v28 count];

    if (v26 != v29)
    {
      v15 = +[MLCLog framework];
      id v10 = v86;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_7:
        char v19 = 0;
        goto LABEL_8;
      }
LABEL_20:
      -[MLCFullyConnectedLayer compileForDevice:sourceTensors:resultTensor:](v85);
      goto LABEL_7;
    }
    unint64_t v30 = [(MLCFullyConnectedLayer *)self weights];
    v31 = [v30 childLayers];
    uint64_t v32 = [v31 count];

    if (v32)
    {
      unint64_t v33 = 0;
      while (1)
      {
        v34 = [(MLCFullyConnectedLayer *)self weights];
        v35 = [v34 childLayers];
        v36 = [v35 objectAtIndexedSubscript:v33];
        v37 = [(MLCFullyConnectedLayer *)self biases];
        v38 = [v37 childLayers];
        BOOL v39 = [v38 objectAtIndexedSubscript:v33];

        if (v36 != v39) {
          break;
        }
        ++v33;
        BOOL v40 = [(MLCFullyConnectedLayer *)self weights];
        v41 = [v40 childLayers];
        unint64_t v42 = [v41 count];

        if (v33 >= v42) {
          goto LABEL_15;
        }
      }
      v15 = +[MLCLog framework];
      id v10 = v86;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      goto LABEL_20;
    }
  }
LABEL_15:
  v43 = [(MLCLayer *)self fusedLayers];
  uint64_t v44 = [v43 count];

  if (v44)
  {
    v45 = [(MLCLayer *)self fusedLayers];
    uint64_t v46 = [v45 objectAtIndexedSubscript:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v48 = [(MLCLayer *)self fusedLayers];
    v49 = [v48 objectAtIndexedSubscript:0];
    if (isKindOfClass)
    {

      v50 = [(MLCLayer *)self fusedLayers];
      unint64_t v51 = [v50 count];

      if (v51 < 2)
      {
        uint64_t v83 = 0;
      }
      else
      {
        v52 = [(MLCLayer *)self fusedLayers];
        unint64_t v53 = [v52 objectAtIndexedSubscript:1];
        uint64_t v83 = [v53 descriptor];
      }
      v81 = [v9 computeEngine];
      uint64_t v84 = [(MLCFullyConnectedLayer *)self descriptor];
      v82 = [v49 mean];
      v80 = [v49 variance];
      v60 = [v49 beta];
      v61 = [v49 gamma];
      [v49 varianceEpsilon];
      int v63 = v62;
      [v49 momentum];
      int v65 = v64;
      v79 = [(MLCFullyConnectedLayer *)self weights];
      v66 = [(MLCFullyConnectedLayer *)self biases];
      v55 = v81;
      LODWORD(v67) = v63;
      LODWORD(v68) = v65;
      v54 = (void *)v83;
      v15 = [v81 fusedFullyConnectedBatchNormalizationAndNeuronLayerWithDescriptor:v84 mean:v82 variance:v80 beta:v60 gamma:v61 varianceEpsilon:v83 momentum:v67 neuronDescriptor:v68 weights:v79 biasTerms:v66];

      uint64_t v56 = (void *)v84;
    }
    else
    {
      objc_opt_class();
      char v57 = objc_opt_isKindOfClass();

      uint64_t v58 = [(MLCLayer *)self fusedLayers];
      v49 = [v58 objectAtIndexedSubscript:0];

      v54 = [v9 computeEngine];
      if (v57)
      {
        v55 = [(MLCFullyConnectedLayer *)self descriptor];
        uint64_t v56 = [(MLCFullyConnectedLayer *)self weights];
        v59 = [(MLCFullyConnectedLayer *)self biases];
        v15 = objc_msgSend(v54, "fusedFullyConnectedAndSoftmaxLayerWithDescriptor:weights:biasTerms:softmaxOp:", v55, v56, v59, objc_msgSend(v49, "operation"));
      }
      else
      {
        v55 = [v49 descriptor];
        uint64_t v56 = [(MLCFullyConnectedLayer *)self descriptor];
        v59 = [(MLCFullyConnectedLayer *)self weights];
        id v69 = [(MLCFullyConnectedLayer *)self biases];
        v15 = [v54 fusedFullyConnectedAndNeuronLayerWithDescriptor:v55 convolutionDescriptor:v56 weights:v59 biasTerms:v69];
      }
    }
  }
  else
  {
    v49 = [v9 computeEngine];
    v54 = [(MLCFullyConnectedLayer *)self descriptor];
    v55 = [(MLCFullyConnectedLayer *)self weights];
    uint64_t v56 = [(MLCFullyConnectedLayer *)self biases];
    v15 = [v49 fullyConnectedLayerWithDescriptor:v54 weights:v55 biasTerms:v56];
  }

  if (!v15 || ![v15 count])
  {
    v78 = +[MLCLog framework];
    id v10 = v86;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
      -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:](v85);
    }

    goto LABEL_7;
  }
  v70 = [v9 computeEngine];
  id v10 = v86;
  char v19 = [v70 compileLayerDeviceOps:v15 sourceTensors:v86 resultTensor:v11];

  v87.receiver = self;
  v87.super_class = (Class)MLCFullyConnectedLayer;
  [(MLCLayer *)&v87 bindDevice:v9 deviceOps:v15];
  v71 = [(MLCLayer *)self fusedLayers];
  uint64_t v72 = [v71 count];

  if (v72)
  {
    unint64_t v73 = 0;
    do
    {
      v74 = [(MLCLayer *)self fusedLayers];
      v75 = [v74 objectAtIndexedSubscript:v73];
      [v75 bindDevice:v9 deviceOps:v15];

      ++v73;
      v76 = [(MLCLayer *)self fusedLayers];
      unint64_t v77 = [v76 count];
    }
    while (v73 < v77);
  }
LABEL_8:

  return v19;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  id v4 = a3;
  v5 = [(MLCFullyConnectedLayer *)self weightsParameter];
  v6 = [(MLCLayer *)self device];
  [v5 allocateDataForOptimizer:v4 device:v6 isVector:1];

  v7 = [(MLCFullyConnectedLayer *)self biases];

  if (v7)
  {
    id v8 = [(MLCFullyConnectedLayer *)self biasesParameter];
    id v9 = [(MLCLayer *)self device];
    [v8 allocateDataForOptimizer:v4 device:v9 isVector:1];
  }
  id v10 = [(MLCLayer *)self device];
  id v11 = [v10 computeEngine];
  v12 = [(MLCLayer *)self deviceOps];
  v13 = [(MLCFullyConnectedLayer *)self weights];
  uint64_t v14 = [(MLCFullyConnectedLayer *)self biases];
  [v11 setConvolutionLayerOptimizerDataForDeviceOps:v12 weights:v13 bias:v14];

  return 1;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(MLCFullyConnectedLayer *)self weights];
  id v8 = [v7 descriptor];
  uint64_t v9 = [v8 tensorAllocationSizeInBytes];
  id v10 = [(MLCFullyConnectedLayer *)self biases];
  id v11 = [v10 descriptor];
  unint64_t v12 = [v11 tensorAllocationSizeInBytes] + v9;

  if (v4) {
    v12 *= [v6 numOptimizerDataBuffers] + 2;
  }

  return v12;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectAtIndexedSubscript:0];
  id v6 = [v5 descriptor];
  v7 = [v6 shape];
  id v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [v4 objectAtIndexedSubscript:0];
  id v10 = [v9 descriptor];
  id v11 = [v10 shape];
  uint64_t v12 = [v11 count];

  if (v12 == 4)
  {
    v13 = [v4 objectAtIndexedSubscript:0];
    uint64_t v14 = [v13 descriptor];
    v15 = [v14 shape];
    v16 = [v15 objectAtIndexedSubscript:3];
    if ([v16 unsignedIntegerValue] == 1)
    {
      v17 = [v4 objectAtIndexedSubscript:0];
      uint64_t v18 = [v17 descriptor];
      [v18 shape];
      char v19 = v36 = self;
      [v19 objectAtIndexedSubscript:2];
      unint64_t v20 = v35 = v13;
      uint64_t v34 = [v20 unsignedIntegerValue];

      self = v36;
      if (v34 == 1)
      {
        v21 = NSNumber;
        v22 = [(MLCFullyConnectedLayer *)v36 descriptor];
        uint64_t v23 = objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "outputFeatureChannelCount"));
        v24 = v8;
        v25 = v23;
        uint64_t v26 = 1;
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v27 = NSNumber;
  v22 = [(MLCFullyConnectedLayer *)self descriptor];
  uint64_t v23 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v22, "outputFeatureChannelCount"));
  uint64_t v26 = v12 - 1;
  v24 = v8;
  v25 = v23;
LABEL_7:
  [v24 setObject:v25 atIndexedSubscript:v26];

  uint64_t v28 = (void *)[v8 copy];
  uint64_t v29 = [v4 objectAtIndexedSubscript:0];
  unint64_t v30 = [v29 descriptor];
  v31 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v28, [v30 dataType]);

  uint64_t v32 = +[MLCTensor tensorWithDescriptor:v31];

  return v32;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCFullyConnectedLayer *)self accumulatorPrecisionOption];
  v7 = [(MLCFullyConnectedLayer *)self weights];
  id v8 = [(MLCFullyConnectedLayer *)self biases];
  uint64_t v9 = [(MLCFullyConnectedLayer *)self descriptor];
  id v10 = [(MLCLayer *)self conditionalTreeNode];
  id v11 = [(MLCLayer *)self resultTensors];
  uint64_t v12 = [v3 stringWithFormat:@"%@: { accumulatorPrecisionOption=%d : weights=%@ : biasTerms=%@ : descriptor=%@ : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  v7 = [(MLCFullyConnectedLayer *)self descriptor];
  uint64_t v8 = [v7 inputFeatureChannelCount];
  uint64_t v9 = [(MLCFullyConnectedLayer *)self descriptor];
  id v10 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Input Feature Channel Count: %lu<BR />Output Feature Channel Count: %lu<BR /></FONT>>", v5, v6, v8, objc_msgSend(v9, "outputFeatureChannelCount")];

  return v10;
}

- (void)linkAssociatedTensors
{
  v3 = [(MLCFullyConnectedLayer *)self weights];
  id v4 = [v3 childLayers];
  [v4 addObject:self];

  v5 = [(MLCFullyConnectedLayer *)self biases];

  if (v5)
  {
    id v7 = [(MLCFullyConnectedLayer *)self biases];
    NSUInteger v6 = [v7 childLayers];
    [v6 addObject:self];
  }
}

- (void)unlinkAssociatedTensors
{
  v3 = [(MLCFullyConnectedLayer *)self weights];
  id v4 = [v3 childLayers];
  [v4 removeObject:self];

  v5 = [(MLCFullyConnectedLayer *)self biases];

  if (v5)
  {
    id v7 = [(MLCFullyConnectedLayer *)self biases];
    NSUInteger v6 = [v7 childLayers];
    [v6 removeObject:self];
  }
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [v3 objectAtIndexedSubscript:v4];
      NSUInteger v6 = [v5 descriptor];
      id v7 = [v6 shape];
      unint64_t v8 = [v7 count];

      BOOL v9 = v8 > 1;
      if (v8 <= 1) {
        break;
      }
      ++v4;
    }
    while (v4 < [v3 count]);
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (unint64_t)parametersCount
{
  v2 = [(MLCFullyConnectedLayer *)self biasesParameter];

  if (v2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (MLCConvolutionDescriptor)descriptor
{
  return self->_descriptor;
}

- (MLCTensor)weights
{
  return self->_weights;
}

- (MLCTensor)biases
{
  return self->_biases;
}

- (MLCTensorParameter)weightsParameter
{
  return self->_weightsParameter;
}

- (MLCTensorParameter)biasesParameter
{
  return self->_biasesParameter;
}

- (int)accumulatorPrecisionOption
{
  return self->_accumulatorPrecisionOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasesParameter, 0);
  objc_storeStrong((id *)&self->_weightsParameter, 0);
  objc_storeStrong((id *)&self->_biases, 0);
  objc_storeStrong((id *)&self->_weights, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: weights batch size > 1", v4, v5, v6, v7, v8);
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: missing weights", v4, v5, v6, v7, v8);
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: biasTerms batch size > 1", v4, v5, v6, v7, v8);
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: biasTerms width or height size > 1", v4, v5, v6, v7, v8);
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: weights and bias terms must be shared with the same convolution layers", v4, v5, v6, v7, v8);
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.7(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: number of channels in biasTerms does not match output feature channels", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: weights and bias tensors must be associated with the same layers", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.4(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 biases];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v5, v6, "%@: biasTerms tensor used by FullyConnected cannot have a parent layer=%@", v7, v8, v9, v10, v11);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.5(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 weights];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v5, v6, "%@: weights tensor used by FullyConnected cannot have a parent layer=%@", v7, v8, v9, v10, v11);
}

@end