@interface MLCGroupNormalizationLayer
+ (MLCGroupNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount groupCount:(NSUInteger)groupCount beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon;
- (BOOL)allocateDataForOptimizer:(id)a3;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (BOOL)isValidTrainingParameters;
- (MLCGroupNormalizationLayer)initWithFeatureChannelCount:(unint64_t)a3 groupCount:(unint64_t)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7;
- (MLCTensor)beta;
- (MLCTensor)gamma;
- (MLCTensorParameter)betaParameter;
- (MLCTensorParameter)gammaParameter;
- (NSUInteger)featureChannelCount;
- (NSUInteger)groupCount;
- (float)varianceEpsilon;
- (id)description;
- (id)summarizedDOTDescription;
- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4;
- (unint64_t)parametersCount;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
- (void)linkAssociatedTensors;
- (void)unlinkAssociatedTensors;
@end

@implementation MLCGroupNormalizationLayer

+ (MLCGroupNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount groupCount:(NSUInteger)groupCount beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon
{
  v12 = gamma;
  v13 = beta;
  id v14 = objc_alloc((Class)a1);
  *(float *)&double v15 = varianceEpsilon;
  v16 = (void *)[v14 initWithFeatureChannelCount:featureChannelCount groupCount:groupCount beta:v13 gamma:v12 varianceEpsilon:v15];

  return (MLCGroupNormalizationLayer *)v16;
}

- (MLCGroupNormalizationLayer)initWithFeatureChannelCount:(unint64_t)a3 groupCount:(unint64_t)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7
{
  id v14 = a5;
  id v15 = a6;
  if (!a3)
  {
    v16 = +[MLCLog framework];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:](a2);
    }
    goto LABEL_45;
  }
  if (!a4)
  {
    v16 = +[MLCLog framework];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:](a2);
    }
    goto LABEL_45;
  }
  if (a4 > a3)
  {
    v16 = +[MLCLog framework];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:](a2);
    }
LABEL_45:

    v37 = 0;
    goto LABEL_46;
  }
  if (a3 % a4)
  {
    v16 = +[MLCLog framework];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:].cold.7(a2);
    }
    goto LABEL_45;
  }
  if (a7 < 0.0)
  {
    v16 = +[MLCLog framework];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:].cold.4(a2);
    }
    goto LABEL_45;
  }
  if (v14)
  {
    v59 = [v14 descriptor];
    v17 = [v59 shape];
    v18 = [v17 objectAtIndexedSubscript:3];
    if ([v18 unsignedIntegerValue] == 1)
    {
      v55 = v18;
      v57 = v17;
      v53 = [v14 descriptor];
      v19 = [v53 shape];
      v20 = [v19 objectAtIndexedSubscript:2];
      if ([v20 unsignedIntegerValue] == 1)
      {
        v49 = v20;
        v51 = v19;
        v47 = [v14 descriptor];
        v45 = [v47 shape];
        v21 = [v45 objectAtIndexedSubscript:1];
        if ([v21 unsignedIntegerValue] == a3)
        {
          v41 = [v14 descriptor];
          v39 = [v41 shape];
          v22 = [v39 objectAtIndexedSubscript:0];
          uint64_t v43 = [v22 unsignedIntegerValue];

          if (v43 == 1) {
            goto LABEL_21;
          }
LABEL_32:
          v16 = +[MLCLog framework];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:].cold.6(a2);
          }
          goto LABEL_45;
        }

        v20 = v49;
      }

      v18 = v55;
      v17 = v57;
    }

    goto LABEL_32;
  }
LABEL_21:
  if (v15)
  {
    v60 = [v15 descriptor];
    v23 = [v60 shape];
    v24 = [v23 objectAtIndexedSubscript:3];
    if ([v24 unsignedIntegerValue] == 1)
    {
      v56 = v24;
      v58 = v23;
      v54 = [v15 descriptor];
      v25 = [v54 shape];
      v26 = [v25 objectAtIndexedSubscript:2];
      if ([v26 unsignedIntegerValue] == 1)
      {
        v50 = v26;
        v52 = v25;
        v48 = [v15 descriptor];
        v46 = [v48 shape];
        v27 = [v46 objectAtIndexedSubscript:1];
        if ([v27 unsignedIntegerValue] == a3)
        {
          v42 = [v15 descriptor];
          v40 = [v42 shape];
          v28 = [v40 objectAtIndexedSubscript:0];
          uint64_t v44 = [v28 unsignedIntegerValue];

          if (v44 == 1) {
            goto LABEL_26;
          }
LABEL_43:
          v16 = +[MLCLog framework];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:].cold.5(a2);
          }
          goto LABEL_45;
        }

        v26 = v50;
      }

      v24 = v56;
      v23 = v58;
    }

    goto LABEL_43;
  }
LABEL_26:
  v62.receiver = self;
  v62.super_class = (Class)MLCGroupNormalizationLayer;
  v29 = [(MLCLayer *)&v62 initWithLabel:@"GroupNorm"];
  v30 = v29;
  if (v29)
  {
    v29->_featureChannelCount = a3;
    v29->_groupCount = a4;
    objc_storeStrong((id *)&v29->_beta, a5);
    objc_storeStrong((id *)&v30->_gamma, a6);
    v30->_varianceEpsilon = a7;
    if (v14)
    {
      uint64_t v31 = +[MLCTensorParameter parameterWithTensor:v14];
      betaParameter = v30->_betaParameter;
      v30->_betaParameter = (MLCTensorParameter *)v31;

      [(MLCTensor *)v30->_beta setIsLayerParameter:1];
    }
    else
    {
      v33 = v30->_betaParameter;
      v30->_betaParameter = 0;
    }
    if (v15)
    {
      uint64_t v34 = +[MLCTensorParameter parameterWithTensor:v15];
      gammaParameter = v30->_gammaParameter;
      v30->_gammaParameter = (MLCTensorParameter *)v34;

      [(MLCTensor *)v30->_gamma setIsLayerParameter:1];
    }
    else
    {
      v36 = v30->_gammaParameter;
      v30->_gammaParameter = 0;
    }
    v61.receiver = v30;
    v61.super_class = (Class)MLCGroupNormalizationLayer;
    [(MLCLayer *)&v61 setIsUpdatable:1];
  }
  self = v30;
  v37 = self;
LABEL_46:

  return v37;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(MLCGroupNormalizationLayer *)self beta];

  if (v12)
  {
    v13 = [(MLCGroupNormalizationLayer *)self beta];
    id v14 = [v13 parentLayers];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:](a2, self);
      }
LABEL_19:
      char v39 = 0;
      goto LABEL_20;
    }
  }
  v17 = [(MLCGroupNormalizationLayer *)self gamma];

  if (v17)
  {
    v18 = [(MLCGroupNormalizationLayer *)self gamma];
    v19 = [v18 parentLayers];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:](a2, self);
      }
      goto LABEL_19;
    }
  }
  v21 = [(MLCLayer *)self fusedLayers];
  uint64_t v22 = [v21 count];

  uint64_t v43 = v9;
  if (v22)
  {
    v23 = [(MLCLayer *)self fusedLayers];
    v24 = [v23 objectAtIndexedSubscript:0];

    v25 = [v9 computeEngine];
    v26 = [v24 descriptor];
    NSUInteger v27 = [(MLCGroupNormalizationLayer *)self featureChannelCount];
    id v28 = v11;
    id v29 = v10;
    NSUInteger v30 = [(MLCGroupNormalizationLayer *)self groupCount];
    uint64_t v31 = [(MLCGroupNormalizationLayer *)self beta];
    v32 = [(MLCGroupNormalizationLayer *)self gamma];
    [(MLCGroupNormalizationLayer *)self varianceEpsilon];
    NSUInteger v33 = v30;
    id v10 = v29;
    id v11 = v28;
    v16 = objc_msgSend(v25, "fusedGroupNormalizationAndNeuronLayerWithDescriptor:featureChannelCount:groupCount:beta:gamma:varianceEpsilon:", v26, v27, v33, v31, v32);
  }
  else
  {
    v24 = objc_msgSend(v9, "computeEngine", a2);
    NSUInteger v34 = [(MLCGroupNormalizationLayer *)self featureChannelCount];
    NSUInteger v35 = [(MLCGroupNormalizationLayer *)self groupCount];
    v25 = [(MLCGroupNormalizationLayer *)self beta];
    v26 = [(MLCGroupNormalizationLayer *)self gamma];
    [(MLCGroupNormalizationLayer *)self varianceEpsilon];
    v16 = objc_msgSend(v24, "groupNormalizationLayerWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:", v34, v35, v25, v26);
  }

  if (!v16 || ![v16 count])
  {
    v40 = +[MLCLog framework];
    id v9 = v43;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:](v42);
    }

    goto LABEL_19;
  }
  id v9 = v43;
  v36 = [v43 computeEngine];
  char v37 = objc_opt_respondsToSelector();

  if (v37)
  {
    v38 = [v43 computeEngine];
    char v39 = [v38 compileLayerDeviceOps:v16 sourceTensors:v10 resultTensor:v11];
  }
  else
  {
    char v39 = 1;
  }
  v44.receiver = self;
  v44.super_class = (Class)MLCGroupNormalizationLayer;
  [(MLCLayer *)&v44 bindDevice:v43 deviceOps:v16];
LABEL_20:

  return v39;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  id v4 = a3;
  v5 = [(MLCGroupNormalizationLayer *)self beta];

  if (v5)
  {
    v6 = [(MLCGroupNormalizationLayer *)self betaParameter];
    v7 = [(MLCLayer *)self device];
    [v6 allocateDataForOptimizer:v4 device:v7 isVector:1];
  }
  v8 = [(MLCGroupNormalizationLayer *)self gamma];

  if (v8)
  {
    id v9 = [(MLCGroupNormalizationLayer *)self gammaParameter];
    id v10 = [(MLCLayer *)self device];
    [v9 allocateDataForOptimizer:v4 device:v10 isVector:1];
  }
  id v11 = [(MLCLayer *)self device];
  v12 = [v11 computeEngine];
  v13 = [(MLCLayer *)self deviceOps];
  id v14 = [(MLCGroupNormalizationLayer *)self beta];
  uint64_t v15 = [(MLCGroupNormalizationLayer *)self gamma];
  [v12 setNormalizationLayerOptimizerDataForDeviceOps:v13 beta:v14 gamma:v15];

  return 1;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(MLCGroupNormalizationLayer *)self beta];
  v8 = [v7 descriptor];
  uint64_t v9 = [v8 tensorAllocationSizeInBytes];
  id v10 = [(MLCGroupNormalizationLayer *)self gamma];
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
  NSUInteger v6 = [(MLCGroupNormalizationLayer *)self featureChannelCount];
  NSUInteger v7 = [(MLCGroupNormalizationLayer *)self groupCount];
  v8 = [(MLCGroupNormalizationLayer *)self beta];
  uint64_t v9 = [(MLCGroupNormalizationLayer *)self gamma];
  [(MLCGroupNormalizationLayer *)self varianceEpsilon];
  double v11 = v10;
  unint64_t v12 = [(MLCLayer *)self conditionalTreeNode];
  v13 = [(MLCLayer *)self resultTensors];
  id v14 = [v3 stringWithFormat:@"%@: { featureChannelCount=%lu : groupCount=%lu : beta=%@ : gamma=%@ : varianceEpsilon=%f : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8, v9, *(void *)&v11, v12, v13];

  return v14;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  NSUInteger v7 = [(MLCGroupNormalizationLayer *)self featureChannelCount];
  NSUInteger v8 = [(MLCGroupNormalizationLayer *)self groupCount];
  [(MLCGroupNormalizationLayer *)self varianceEpsilon];
  float v10 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Feature Channel Count: %lu    Group Count: %lu<BR />Variance Epsilon: %.03f</FONT>>", v5, v6, v7, v8, v9];

  return v10;
}

- (void)linkAssociatedTensors
{
  v3 = [(MLCGroupNormalizationLayer *)self beta];
  BOOL v4 = [v3 childLayers];
  [v4 addObject:self];

  id v6 = [(MLCGroupNormalizationLayer *)self gamma];
  v5 = [v6 childLayers];
  [v5 addObject:self];
}

- (void)unlinkAssociatedTensors
{
  v3 = [(MLCGroupNormalizationLayer *)self beta];
  BOOL v4 = [v3 childLayers];
  [v4 removeObject:self];

  id v6 = [(MLCGroupNormalizationLayer *)self gamma];
  v5 = [v6 childLayers];
  [v5 removeObject:self];
}

- (BOOL)isValidTrainingParameters
{
  v3 = [(MLCGroupNormalizationLayer *)self beta];
  if (v3)
  {
    BOOL v4 = [(MLCGroupNormalizationLayer *)self gamma];
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
      NSUInteger v7 = [v6 shape];
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
  id v3 = [(MLCGroupNormalizationLayer *)self betaParameter];

  unint64_t v4 = [(MLCGroupNormalizationLayer *)self gammaParameter];

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

- (NSUInteger)featureChannelCount
{
  return self->_featureChannelCount;
}

- (NSUInteger)groupCount
{
  return self->_groupCount;
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
}

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: the number of channels must be greater than zero", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: the number of groups must be greater than zero", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: the number of groups cannot exceed the number of channels", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: the variance must be greater than zero", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: gamma must be of size (1,C,1,1)", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.6(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: beta must be of size (1,C,1,1)", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.7(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: The number of channels must be divisible by the number of groups", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.2(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 gamma];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v5, v6, "%@: gamma tensor used by GroupNormalization cannot have a parent layer=%@", v7, v8, v9, v10, v11);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.3(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 beta];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v5, v6, "%@: beta tensor used by GroupNormalization cannot have a parent layer=%@", v7, v8, v9, v10, v11);
}

@end