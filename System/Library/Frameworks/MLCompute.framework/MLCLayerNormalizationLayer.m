@interface MLCLayerNormalizationLayer
+ (MLCLayerNormalizationLayer)layerWithNormalizedShape:(NSArray *)normalizedShape beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon;
- (BOOL)allocateDataForOptimizer:(id)a3;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (BOOL)isValidTrainingParameters;
- (MLCLayerNormalizationLayer)initWithNormalizedShape:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6;
- (MLCTensor)beta;
- (MLCTensor)gamma;
- (MLCTensorParameter)betaParameter;
- (MLCTensorParameter)gammaParameter;
- (NSArray)normalizedShape;
- (float)varianceEpsilon;
- (id)description;
- (id)summarizedDOTDescription;
- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4;
- (unint64_t)parametersCount;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
- (void)linkAssociatedTensors;
- (void)unlinkAssociatedTensors;
@end

@implementation MLCLayerNormalizationLayer

+ (MLCLayerNormalizationLayer)layerWithNormalizedShape:(NSArray *)normalizedShape beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon
{
  v10 = gamma;
  v11 = beta;
  v12 = normalizedShape;
  id v13 = objc_alloc((Class)a1);
  *(float *)&double v14 = varianceEpsilon;
  v15 = (void *)[v13 initWithNormalizedShape:v12 beta:v11 gamma:v10 varianceEpsilon:v14];

  return (MLCLayerNormalizationLayer *)v15;
}

- (MLCLayerNormalizationLayer)initWithNormalizedShape:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (![v12 count] || (unint64_t)objc_msgSend(v12, "count") >= 4)
  {
    v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCLayerNormalizationLayer initWithNormalizedShape:beta:gamma:varianceEpsilon:](a2);
    }
LABEL_5:

    v16 = 0;
    goto LABEL_6;
  }
  if (a6 < 0.0)
  {
    v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCLayerNormalizationLayer initWithNormalizedShape:beta:gamma:varianceEpsilon:](a2);
    }
    goto LABEL_5;
  }
  v42 = a2;
  uint64_t v18 = [v12 count];
  id v43 = v14;
  v44 = v13;
  if (v13)
  {
    v19 = [v13 descriptor];
    uint64_t v20 = [v19 dimensionCount];

    v21 = [v44 descriptor];
    v22 = [v21 shape];
    v23 = objc_msgSend(v22, "subarrayWithRange:", v20 - v18, v18);
    char v24 = [v23 isEqualToArray:v12];

    id v14 = v43;
    id v13 = v44;
    if ((v24 & 1) == 0)
    {
      v15 = +[MLCLog framework];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MLCLayerNormalizationLayer initWithNormalizedShape:beta:gamma:varianceEpsilon:].cold.5(v42);
      }
      goto LABEL_5;
    }
  }
  if (!v14) {
    goto LABEL_14;
  }
  v25 = [v14 descriptor];
  uint64_t v26 = [v25 dimensionCount];

  v27 = [v14 descriptor];
  v28 = [v27 shape];
  v29 = objc_msgSend(v28, "subarrayWithRange:", v26 - v18, v18);
  char v30 = [v29 isEqualToArray:v12];

  id v14 = v43;
  if ((v30 & 1) == 0)
  {
    v37 = +[MLCLog framework];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[MLCLayerNormalizationLayer initWithNormalizedShape:beta:gamma:varianceEpsilon:].cold.4(v42);
    }

    v16 = 0;
    id v13 = v44;
  }
  else
  {
LABEL_14:
    id v13 = v44;
    BOOL v31 = v44 != 0;
    if (v14)
    {
      BOOL v31 = 0;
      BOOL v32 = v44 == 0;
    }
    else
    {
      BOOL v32 = 0;
    }
    if (v32 || v31)
    {
      v15 = +[MLCLog framework];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MLCLayerNormalizationLayer initWithNormalizedShape:beta:gamma:varianceEpsilon:](v42);
      }
      goto LABEL_5;
    }
    v46.receiver = self;
    v46.super_class = (Class)MLCLayerNormalizationLayer;
    v33 = [(MLCLayer *)&v46 initWithLabel:@"LayerNorm"];
    v34 = v33;
    if (v33)
    {
      objc_storeStrong((id *)&v33->_normalizedShape, a3);
      objc_storeStrong((id *)&v34->_beta, a4);
      objc_storeStrong((id *)&v34->_gamma, a5);
      v34->_varianceEpsilon = a6;
      if (v44)
      {
        uint64_t v35 = +[MLCTensorParameter parameterWithTensor:v44];
        betaParameter = v34->_betaParameter;
        v34->_betaParameter = (MLCTensorParameter *)v35;

        [(MLCTensor *)v34->_beta setIsLayerParameter:1];
      }
      else
      {
        v38 = v34->_betaParameter;
        v34->_betaParameter = 0;
      }
      if (v14)
      {
        uint64_t v39 = +[MLCTensorParameter parameterWithTensor:v14];
        gammaParameter = v34->_gammaParameter;
        v34->_gammaParameter = (MLCTensorParameter *)v39;

        [(MLCTensor *)v34->_gamma setIsLayerParameter:1];
      }
      else
      {
        v41 = v34->_gammaParameter;
        v34->_gammaParameter = 0;
      }
      v45.receiver = v34;
      v45.super_class = (Class)MLCLayerNormalizationLayer;
      [(MLCLayer *)&v45 setIsUpdatable:1];
    }
    self = v34;
    v16 = self;
  }
LABEL_6:

  return v16;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)[&unk_1F3876DF8 mutableCopy];
  if ([v9 type] == 3) {
    [v12 addObject:&unk_1F3876888];
  }
  id v13 = [(MLCLayerNormalizationLayer *)self beta];

  if (!v13) {
    goto LABEL_8;
  }
  id v14 = [(MLCLayerNormalizationLayer *)self beta];
  char v15 = [v14 isTensorDataTypeInListOfDataTypes:v12];

  if ((v15 & 1) == 0)
  {
    v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MLCLayerNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.6(a2, self);
    }
    goto LABEL_21;
  }
  v16 = [(MLCLayerNormalizationLayer *)self beta];
  v17 = [v16 parentLayers];
  uint64_t v18 = [v17 count];

  if (!v18)
  {
LABEL_8:
    uint64_t v20 = [(MLCLayerNormalizationLayer *)self gamma];

    if (v20)
    {
      v21 = [(MLCLayerNormalizationLayer *)self gamma];
      char v22 = [v21 isTensorDataTypeInListOfDataTypes:v12];

      if ((v22 & 1) == 0)
      {
        v19 = +[MLCLog framework];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[MLCLayerNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2, self);
        }
        goto LABEL_21;
      }
      v23 = [(MLCLayerNormalizationLayer *)self gamma];
      char v24 = [v23 parentLayers];
      uint64_t v25 = [v24 count];

      if (v25)
      {
        v19 = +[MLCLog framework];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[MLCLayerNormalizationLayer compileForDevice:sourceTensors:resultTensor:](a2, self);
        }
        goto LABEL_21;
      }
    }
    v55 = a2;
    id v56 = v11;
    v19 = [v10 objectAtIndexedSubscript:0];
    uint64_t v26 = [(MLCLayerNormalizationLayer *)self normalizedShape];
    uint64_t v27 = [v26 count];

    v28 = [v19 descriptor];
    uint64_t v29 = [v28 dimensionCount];

    char v30 = [v19 descriptor];
    BOOL v31 = [v30 shape];
    BOOL v32 = objc_msgSend(v31, "subarrayWithRange:", v29 - v27, v27);
    v33 = [(MLCLayerNormalizationLayer *)self normalizedShape];
    char v34 = [v32 isEqualToArray:v33];

    if (v34)
    {
      uint64_t v35 = [(MLCLayer *)self fusedLayers];
      uint64_t v36 = [v35 count];

      if (!v36) {
        goto LABEL_18;
      }
      v37 = [(MLCLayer *)self fusedLayers];
      v38 = [v37 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_super v46 = [(MLCLayer *)self fusedLayers];
        v54 = [v46 objectAtIndexedSubscript:0];

        v41 = [v9 computeEngine];
        v42 = [v54 descriptor];
        id v43 = [(MLCLayerNormalizationLayer *)self normalizedShape];
        v53 = [(MLCLayerNormalizationLayer *)self beta];
        v47 = [(MLCLayerNormalizationLayer *)self gamma];
        [(MLCLayerNormalizationLayer *)self varianceEpsilon];
        v44 = objc_msgSend(v41, "fusedLayerNormalizationAndNeuronLayerWithDescriptor:normalizedShape:beta:gamma:varianceEpsilon:", v42, v43, v53, v47);

        v40 = v54;
      }
      else
      {
LABEL_18:
        v40 = [v9 computeEngine];
        v41 = [(MLCLayerNormalizationLayer *)self normalizedShape];
        v42 = [(MLCLayerNormalizationLayer *)self beta];
        id v43 = [(MLCLayerNormalizationLayer *)self gamma];
        [(MLCLayerNormalizationLayer *)self varianceEpsilon];
        v44 = objc_msgSend(v40, "layerNormalizationLayerWithNormalizedShape:beta:gamma:varianceEpsilon:isFusedWithArithmeticLayer:", v41, v42, v43, 1);
      }

      if (v44 && [v44 count])
      {
        v48 = [v9 computeEngine];
        char v49 = objc_opt_respondsToSelector();

        id v11 = v56;
        if (v49)
        {
          v50 = [v9 computeEngine];
          char v45 = [v50 compileLayerDeviceOps:v44 sourceTensors:v10 resultTensor:v56];
        }
        else
        {
          char v45 = 1;
        }
        v57.receiver = self;
        v57.super_class = (Class)MLCLayerNormalizationLayer;
        [(MLCLayer *)&v57 bindDevice:v9 deviceOps:v44];
        goto LABEL_33;
      }
      v51 = +[MLCLog framework];
      id v11 = v56;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:](v55);
      }
    }
    else
    {
      v44 = +[MLCLog framework];
      id v11 = v56;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[MLCLayerNormalizationLayer compileForDevice:sourceTensors:resultTensor:](v55);
      }
    }
    char v45 = 0;
LABEL_33:

    goto LABEL_34;
  }
  v19 = +[MLCLog framework];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[MLCLayerNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2, self);
  }
LABEL_21:
  char v45 = 0;
LABEL_34:

  return v45;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  id v4 = a3;
  v5 = [(MLCLayerNormalizationLayer *)self beta];

  if (v5)
  {
    v6 = [(MLCLayerNormalizationLayer *)self betaParameter];
    v7 = [(MLCLayer *)self device];
    [v6 allocateDataForOptimizer:v4 device:v7 isVector:1];
  }
  v8 = [(MLCLayerNormalizationLayer *)self gamma];

  if (v8)
  {
    id v9 = [(MLCLayerNormalizationLayer *)self gammaParameter];
    id v10 = [(MLCLayer *)self device];
    [v9 allocateDataForOptimizer:v4 device:v10 isVector:1];
  }
  id v11 = [(MLCLayer *)self device];
  id v12 = [v11 computeEngine];
  id v13 = [(MLCLayer *)self deviceOps];
  id v14 = [(MLCLayerNormalizationLayer *)self beta];
  char v15 = [(MLCLayerNormalizationLayer *)self gamma];
  [v12 setNormalizationLayerOptimizerDataForDeviceOps:v13 beta:v14 gamma:v15];

  return 1;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(MLCLayerNormalizationLayer *)self beta];
  v8 = [v7 descriptor];
  uint64_t v9 = [v8 tensorAllocationSizeInBytes];
  id v10 = [(MLCLayerNormalizationLayer *)self gamma];
  id v11 = [v10 descriptor];
  unint64_t v12 = [v11 tensorAllocationSizeInBytes] + v9;

  if (v4) {
    v12 += v12 * [v6 numOptimizerDataBuffers];
  }

  return v12;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  return a3;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MLCLayerNormalizationLayer *)self beta];
  v7 = [(MLCLayerNormalizationLayer *)self gamma];
  [(MLCLayerNormalizationLayer *)self varianceEpsilon];
  double v9 = v8;
  id v10 = [(MLCLayer *)self conditionalTreeNode];
  id v11 = [(MLCLayer *)self resultTensors];
  unint64_t v12 = [v3 stringWithFormat:@"%@: { beta=%@ : gamma=%@ : varianceEpsilon=%f : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, *(void *)&v9, v10, v11];

  return v12;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  v7 = [(MLCLayerNormalizationLayer *)self normalizedShape];
  [(MLCLayerNormalizationLayer *)self varianceEpsilon];
  double v9 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Normalized Shape: %@<BR />Variance Epsilon: %.03f</FONT>>", v5, v6, v7, v8];

  return v9;
}

- (void)linkAssociatedTensors
{
  v3 = [(MLCLayerNormalizationLayer *)self beta];
  BOOL v4 = [v3 childLayers];
  [v4 addObject:self];

  id v6 = [(MLCLayerNormalizationLayer *)self gamma];
  v5 = [v6 childLayers];
  [v5 addObject:self];
}

- (void)unlinkAssociatedTensors
{
  v3 = [(MLCLayerNormalizationLayer *)self beta];
  BOOL v4 = [v3 childLayers];
  [v4 removeObject:self];

  id v6 = [(MLCLayerNormalizationLayer *)self gamma];
  v5 = [v6 childLayers];
  [v5 removeObject:self];
}

- (BOOL)isValidTrainingParameters
{
  v3 = [(MLCLayerNormalizationLayer *)self beta];
  if (v3)
  {
    BOOL v4 = [(MLCLayerNormalizationLayer *)self gamma];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unint64_t v4 = 0;
    do
    {
      BOOL v5 = [v3 objectAtIndexedSubscript:v4];
      id v6 = [v5 descriptor];
      v7 = [v6 shape];
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
  id v3 = [(MLCLayerNormalizationLayer *)self betaParameter];

  unint64_t v4 = [(MLCLayerNormalizationLayer *)self gammaParameter];

  unint64_t v5 = 1;
  if (v3) {
    unint64_t v5 = 2;
  }
  if (v4) {
    return v5;
  }
  else {
    return v3 != 0;
  }
}

- (NSArray)normalizedShape
{
  return self->_normalizedShape;
}

- (MLCTensor)beta
{
  return self->_beta;
}

- (MLCTensor)gamma
{
  return self->_gamma;
}

- (MLCTensorParameter)betaParameter
{
  return self->_betaParameter;
}

- (MLCTensorParameter)gammaParameter
{
  return self->_gammaParameter;
}

- (float)varianceEpsilon
{
  return self->_varianceEpsilon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gammaParameter, 0);
  objc_storeStrong((id *)&self->_betaParameter, 0);
  objc_storeStrong((id *)&self->_gamma, 0);
  objc_storeStrong((id *)&self->_beta, 0);

  objc_storeStrong((id *)&self->_normalizedShape, 0);
}

- (void)initWithNormalizedShape:(const char *)a1 beta:gamma:varianceEpsilon:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: normalized shape size must be in range 1 to 3", v4, v5, v6, v7, v8);
}

- (void)initWithNormalizedShape:(const char *)a1 beta:gamma:varianceEpsilon:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: the variance must be greater than zero", v4, v5, v6, v7, v8);
}

- (void)initWithNormalizedShape:(const char *)a1 beta:gamma:varianceEpsilon:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Both gamma and beta must either be null or non-null", v4, v5, v6, v7, v8);
}

- (void)initWithNormalizedShape:(const char *)a1 beta:gamma:varianceEpsilon:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: shape of gamma does not match the normailzed shape", v4, v5, v6, v7, v8);
}

- (void)initWithNormalizedShape:(const char *)a1 beta:gamma:varianceEpsilon:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: shape of beta does not match the normailzed shape", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: shape of the normalized dimensions of source tensor does not match the normailzed shape", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.3(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 gamma];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v5, v6, "%@: gamma tensor used by LayerNormalization cannot have a parent layer=%@", v7, v8, v9, v10, v11);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.4(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 gamma];
  uint64_t v5 = [a2 gamma];
  uint64_t v6 = [v5 descriptor];
  [v6 dataType];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1DD0C9000, v7, v8, "%@: gamma tensor (%@) in LayerNormalization uses an unsupported data type=%d", v9, v10, v11, v12, v13);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.5(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 beta];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v5, v6, "%@: beta tensor used by LayerNormalization cannot have a parent layer=%@", v7, v8, v9, v10, v11);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.6(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 beta];
  uint64_t v5 = [a2 beta];
  uint64_t v6 = [v5 descriptor];
  [v6 dataType];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1DD0C9000, v7, v8, "%@: beta tensor (%@) in LayerNormalization uses an unsupported data type=%d", v9, v10, v11, v12, v13);
}

@end