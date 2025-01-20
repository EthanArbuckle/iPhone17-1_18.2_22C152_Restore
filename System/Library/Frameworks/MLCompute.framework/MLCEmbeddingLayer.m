@interface MLCEmbeddingLayer
+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4;
+ (MLCEmbeddingLayer)layerWithDescriptor:(MLCEmbeddingDescriptor *)descriptor weights:(MLCTensor *)weights;
- (BOOL)allocateDataForOptimizer:(id)a3;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCEmbeddingDescriptor)descriptor;
- (MLCEmbeddingLayer)initWithDescriptor:(id)a3 weight:(id)a4;
- (MLCTensor)weights;
- (MLCTensorParameter)weightsParameter;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4;
- (unint64_t)parametersCount;
- (void)allocateGradientsForParameters;
- (void)linkAssociatedTensors;
- (void)unlinkAssociatedTensors;
@end

@implementation MLCEmbeddingLayer

+ (MLCEmbeddingLayer)layerWithDescriptor:(MLCEmbeddingDescriptor *)descriptor weights:(MLCTensor *)weights
{
  v6 = weights;
  v7 = descriptor;
  v8 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v7 weight:v6];

  return (MLCEmbeddingLayer *)v8;
}

- (MLCEmbeddingLayer)initWithDescriptor:(id)a3 weight:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 paddingIndex];

  if (v9)
  {
    v10 = [v8 descriptor];
    v11 = [v10 stride];
    v12 = [v8 descriptor];
    v13 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v12, "dimensionCount") - 1);
    uint64_t v14 = [v13 unsignedIntegerValue];

    v15 = [v7 paddingIndex];
    uint64_t v16 = [v15 unsignedIntegerValue];
    v17 = [v7 embeddingDimension];
    uint64_t v18 = [v17 unsignedIntegerValue] * v16;

    id v19 = [v8 data];
    v20 = (void *)([v19 bytes] + 4 * v18);
    v21 = [v7 embeddingDimension];
    bzero(v20, [v21 unsignedIntegerValue] * v14);
  }
  v28.receiver = self;
  v28.super_class = (Class)MLCEmbeddingLayer;
  v22 = [(MLCLayer *)&v28 initWithLabel:@"Embedding"];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_descriptor, a3);
    objc_storeStrong((id *)&v23->_weights, a4);
    uint64_t v24 = +[MLCTensorParameter parameterWithTensor:v8];
    weightsParameter = v23->_weightsParameter;
    v23->_weightsParameter = (MLCTensorParameter *)v24;

    [(MLCTensor *)v23->_weights setIsLayerParameter:1];
    v27.receiver = v23;
    v27.super_class = (Class)MLCEmbeddingLayer;
    [(MLCLayer *)&v27 setIsUpdatable:1];
  }

  return v23;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8 = a3;
  id v76 = a4;
  id v9 = a5;
  v10 = [(MLCEmbeddingLayer *)self weights];
  v74 = [v10 descriptor];
  v11 = [v74 shape];
  v12 = [(MLCTensor *)self->_weights descriptor];
  v72 = v11;
  v13 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v12, "dimensionCount") - 1);
  uint64_t v14 = [v13 unsignedIntegerValue];
  v15 = [(MLCEmbeddingLayer *)self descriptor];
  uint64_t v16 = [v15 embeddingDimension];
  if (v14 != [v16 unsignedIntegerValue])
  {

    goto LABEL_13;
  }
  v65 = [(MLCEmbeddingLayer *)self weights];
  [v65 descriptor];
  v17 = v70 = v9;
  [v17 shape];
  uint64_t v18 = v67 = v10;
  id v19 = [(MLCTensor *)self->_weights descriptor];
  objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v19, "dimensionCount") - 2);
  v20 = v71 = v8;
  uint64_t v63 = [v20 unsignedIntegerValue];
  v21 = [(MLCEmbeddingLayer *)self descriptor];
  [v21 embeddingCount];
  v22 = v60 = self;
  uint64_t v61 = [v22 unsignedIntegerValue];

  id v8 = v71;
  id v9 = v70;

  if (v63 != v61)
  {
LABEL_13:
    v50 = +[MLCLog framework];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[MLCEmbeddingLayer compileForDevice:sourceTensors:resultTensor:].cold.6(a2);
    }
    BOOL v51 = 0;
    v34 = v76;
    goto LABEL_16;
  }
  v23 = [v70 descriptor];
  uint64_t v24 = [v23 shape];
  v25 = [v70 descriptor];
  v26 = objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v25, "dimensionCount") - 1);
  uint64_t v27 = [v26 unsignedIntegerValue];
  objc_super v28 = [(MLCEmbeddingLayer *)v60 descriptor];
  v29 = [v28 embeddingDimension];
  uint64_t v30 = [v29 unsignedIntegerValue];

  if (v27 != v30)
  {
    v50 = +[MLCLog framework];
    v34 = v76;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[MLCEmbeddingLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2);
    }
    BOOL v51 = 0;
    id v9 = v70;
    id v8 = v71;
    goto LABEL_16;
  }
  v31 = [v70 descriptor];
  v32 = [v31 shape];
  v75 = [v70 descriptor];
  v73 = objc_msgSend(v32, "objectAtIndexedSubscript:", objc_msgSend(v75, "dimensionCount") - 2);
  uint64_t v33 = [v73 unsignedIntegerValue];
  v34 = v76;
  v68 = [v76 objectAtIndexedSubscript:0];
  v66 = [v68 descriptor];
  v35 = [v66 shape];
  v36 = [v76 objectAtIndexedSubscript:0];
  v37 = [v36 descriptor];
  v38 = objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v37, "dimensionCount") - 1);
  id v9 = v70;
  if (v33 != [v38 unsignedIntegerValue])
  {

LABEL_21:
    v50 = +[MLCLog framework];
    id v8 = v71;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[MLCEmbeddingLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2);
    }
    goto LABEL_23;
  }
  v57 = [v70 descriptor];
  v39 = [v57 shape];
  [v39 objectAtIndexedSubscript:0];
  v40 = v64 = v31;
  uint64_t v62 = [v40 unsignedIntegerValue];
  v41 = [v76 objectAtIndexedSubscript:0];
  [v41 descriptor];
  v42 = v59 = v32;
  v43 = [v42 shape];
  v44 = [v43 objectAtIndexedSubscript:0];
  uint64_t v58 = [v44 unsignedIntegerValue];

  v34 = v76;
  id v9 = v70;

  if (v62 != v58) {
    goto LABEL_21;
  }
  v45 = [v76 objectAtIndexedSubscript:0];
  v46 = [v45 descriptor];
  int v47 = [v46 dataType];

  id v8 = v71;
  if (v47 != 5)
  {
    v50 = +[MLCLog framework];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[MLCEmbeddingLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_23;
  }
  if ([v71 type] == 1
    && ![(MLCLayer *)v60 compileForInferenceOnly])
  {
    v48 = [(MLCEmbeddingLayer *)v60 descriptor];
    int v49 = [v48 scalesGradientByFrequency];

    if (v49)
    {
      v50 = +[MLCLog framework];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        -[MLCEmbeddingLayer compileForDevice:sourceTensors:resultTensor:](a2);
      }
LABEL_23:
      BOOL v51 = 0;
      goto LABEL_16;
    }
  }
  v53 = [v71 computeEngine];
  v54 = [(MLCEmbeddingLayer *)v60 descriptor];
  v55 = [(MLCEmbeddingLayer *)v60 weights];
  v50 = objc_msgSend(v53, "embeddingLayerWithDescriptor:weights:inferenceOnly:", v54, v55, -[MLCLayer compileForInferenceOnly](v60, "compileForInferenceOnly"));

  if (v50 && [v50 count])
  {
    v77.receiver = v60;
    v77.super_class = (Class)MLCEmbeddingLayer;
    [(MLCLayer *)&v77 bindDevice:v71 deviceOps:v50];
    v56 = [(MLCEmbeddingLayer *)v60 weights];
    [v56 setDevice:v71];
    BOOL v51 = 1;
  }
  else
  {
    v56 = +[MLCLog framework];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:](a2, (uint64_t)v50, v56);
    }
    BOOL v51 = 0;
  }

LABEL_16:
  return v51;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  id v4 = a3;
  v5 = [(MLCEmbeddingLayer *)self weightsParameter];
  v6 = [(MLCLayer *)self device];
  [v5 allocateDataForOptimizer:v4 device:v6 isVector:0];

  id v7 = [(MLCLayer *)self device];
  id v8 = [v7 computeEngine];
  id v9 = [(MLCLayer *)self deviceOps];
  v10 = [(MLCEmbeddingLayer *)self weights];
  [v8 setConvolutionLayerOptimizerDataForDeviceOps:v9 weights:v10 bias:0];

  return 1;
}

- (void)allocateGradientsForParameters
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [(MLCLayer *)self device];
  id v4 = [v3 computeEngine];
  v5 = [(MLCLayer *)self deviceOps];
  v6 = [(MLCEmbeddingLayer *)self weights];
  v8[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 allocateParameterGradientsForDeviceOps:v5 parameters:v7];
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MLCEmbeddingLayer *)self weights];
  id v8 = [v7 descriptor];
  unint64_t v9 = [v8 tensorAllocationSizeInBytes];

  if (v4) {
    v9 *= [v6 numOptimizerDataBuffers] + 2;
  }

  return v9;
}

- (id)resultTensorFromSources:(id)a3
{
  BOOL v4 = [a3 objectAtIndexedSubscript:0];
  v5 = [v4 descriptor];
  id v6 = [v5 shape];
  id v7 = (void *)[v6 mutableCopy];

  id v8 = [(MLCEmbeddingLayer *)self descriptor];
  unint64_t v9 = [v8 embeddingDimension];
  [v7 addObject:v9];

  v10 = [(MLCEmbeddingLayer *)self weights];
  v11 = [v10 descriptor];
  v12 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v7, [v11 dataType]);

  v13 = +[MLCTensor tensorWithDescriptor:v12];

  return v13;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MLCEmbeddingLayer *)self descriptor];
  id v7 = [(MLCEmbeddingLayer *)self weights];
  id v8 = [(MLCLayer *)self resultTensors];
  unint64_t v9 = [v3 stringWithFormat:@"%@: { descriptor=%@ : weight=%@ : resultTensor=%@ }", v5, v6, v7, v8];

  return v9;
}

- (id)summarizedDOTDescription
{
  v17 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v3);
  NSUInteger v16 = [(MLCLayer *)self layerID];
  id v19 = [(MLCEmbeddingLayer *)self descriptor];
  BOOL v4 = [v19 embeddingCount];
  uint64_t v18 = [(MLCEmbeddingLayer *)self descriptor];
  v5 = [v18 embeddingDimension];
  id v6 = [(MLCEmbeddingLayer *)self descriptor];
  id v7 = [v6 paddingIndex];
  id v8 = [(MLCEmbeddingLayer *)self descriptor];
  unint64_t v9 = [v8 maximumNorm];
  v10 = [(MLCEmbeddingLayer *)self descriptor];
  v11 = [v10 pNorm];
  v12 = [(MLCEmbeddingLayer *)self descriptor];
  v13 = [v17 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Embedding Count: %@    Embedding Dimension: %@<BR />PaddingIndex: %@   Maximum Norm: %@   P Norm: %@<BR />Scale Gradient By Frequency: %hhd</FONT>>", v15, v16, v4, v5, v7, v9, v11, objc_msgSend(v12, "scalesGradientByFrequency")];

  return v13;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (void)linkAssociatedTensors
{
  id v4 = [(MLCEmbeddingLayer *)self weights];
  v3 = [v4 childLayers];
  [v3 addObject:self];
}

- (void)unlinkAssociatedTensors
{
  id v4 = [(MLCEmbeddingLayer *)self weights];
  v3 = [v4 childLayers];
  [v3 removeObject:self];
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  return a3 == 5;
}

- (unint64_t)parametersCount
{
  return 1;
}

- (MLCEmbeddingDescriptor)descriptor
{
  return self->_descriptor;
}

- (MLCTensor)weights
{
  return self->_weights;
}

- (MLCTensorParameter)weightsParameter
{
  return self->_weightsParameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightsParameter, 0);
  objc_storeStrong((id *)&self->_weights, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: scaling gradient by frequency not supported by GPU", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: source tensor data type must be MLCDataTypeInt64 for embedding layer", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: result tensor dimensions do not match the source tensor dimensions", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: result tensor last dimension must be equal to embedding dimension", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.6(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: weight tensor must be of size embeddingCount x embeddingDimension", v4, v5, v6, v7, v8);
}

@end