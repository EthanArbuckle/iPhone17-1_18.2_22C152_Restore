@interface MLCInstanceNormalizationLayer
+ (MLCInstanceNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon;
+ (MLCInstanceNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon momentum:(float)momentum;
+ (MLCInstanceNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount mean:(MLCTensor *)mean variance:(MLCTensor *)variance beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon momentum:(float)momentum;
- (BOOL)allocateDataForOptimizer:(id)a3;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isValidTrainingParameters;
- (MLCInstanceNormalizationLayer)initWithFeatureChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9;
- (MLCTensor)beta;
- (MLCTensor)gamma;
- (MLCTensor)mean;
- (MLCTensor)variance;
- (MLCTensorParameter)betaParameter;
- (MLCTensorParameter)gammaParameter;
- (NSUInteger)featureChannelCount;
- (float)momentum;
- (float)varianceEpsilon;
- (id)description;
- (id)summarizedDOTDescription;
- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4;
- (unint64_t)parametersCount;
- (void)linkAssociatedTensors;
- (void)unlinkAssociatedTensors;
@end

@implementation MLCInstanceNormalizationLayer

+ (MLCInstanceNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon
{
  v10 = gamma;
  v11 = beta;
  id v12 = objc_alloc((Class)a1);
  LODWORD(v13) = 1065185444;
  *(float *)&double v14 = varianceEpsilon;
  v15 = (void *)[v12 initWithFeatureChannelCount:featureChannelCount mean:0 variance:0 beta:v11 gamma:v10 varianceEpsilon:v14 momentum:v13];

  return (MLCInstanceNormalizationLayer *)v15;
}

+ (MLCInstanceNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon momentum:(float)momentum
{
  id v12 = gamma;
  double v13 = beta;
  id v14 = objc_alloc((Class)a1);
  *(float *)&double v15 = varianceEpsilon;
  *(float *)&double v16 = momentum;
  v17 = (void *)[v14 initWithFeatureChannelCount:featureChannelCount mean:0 variance:0 beta:v13 gamma:v12 varianceEpsilon:v15 momentum:v16];

  return (MLCInstanceNormalizationLayer *)v17;
}

+ (MLCInstanceNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount mean:(MLCTensor *)mean variance:(MLCTensor *)variance beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon momentum:(float)momentum
{
  double v16 = gamma;
  v17 = beta;
  v18 = variance;
  v19 = mean;
  id v20 = objc_alloc((Class)a1);
  *(float *)&double v21 = varianceEpsilon;
  *(float *)&double v22 = momentum;
  v23 = (void *)[v20 initWithFeatureChannelCount:featureChannelCount mean:v19 variance:v18 beta:v17 gamma:v16 varianceEpsilon:v21 momentum:v22];

  return (MLCInstanceNormalizationLayer *)v23;
}

- (MLCInstanceNormalizationLayer)initWithFeatureChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9
{
  id v15 = a4;
  id obj = a5;
  id v16 = a5;
  id v71 = a6;
  id v74 = a6;
  id v72 = a7;
  id v17 = a7;
  if (v15)
  {
    v18 = [v15 descriptor];
    v19 = [v18 shape];
    id v20 = [v19 objectAtIndexedSubscript:3];
    if ((unint64_t)[v20 unsignedIntegerValue] >= 2)
    {
    }
    else
    {
      [v15 descriptor];
      double v21 = v67 = self;
      double v22 = [v21 shape];
      [v22 objectAtIndexedSubscript:2];
      id v23 = v17;
      v25 = id v24 = v16;
      unint64_t v26 = [v25 unsignedIntegerValue];

      id v16 = v24;
      id v17 = v23;

      self = v67;
      if (v26 < 2) {
        goto LABEL_4;
      }
    }
    v60 = +[MLCLog framework];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      -[MLCInstanceNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.5(a2);
    }
    goto LABEL_35;
  }
LABEL_4:
  if (!v16) {
    goto LABEL_7;
  }
  v27 = [v16 descriptor];
  v28 = [v27 shape];
  v29 = [v28 objectAtIndexedSubscript:3];
  if ((unint64_t)[v29 unsignedIntegerValue] >= 2)
  {

LABEL_25:
    v60 = +[MLCLog framework];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      -[MLCInstanceNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.4(a2);
    }
    goto LABEL_35;
  }
  v30 = [v16 descriptor];
  [v30 shape];
  v32 = v31 = self;
  [v32 objectAtIndexedSubscript:2];
  id v33 = v17;
  v35 = id v34 = v16;
  v67 = (MLCInstanceNormalizationLayer *)[v35 unsignedIntegerValue];

  id v16 = v34;
  id v17 = v33;

  self = v31;
  if ((unint64_t)v67 >= 2) {
    goto LABEL_25;
  }
LABEL_7:
  if (!v74) {
    goto LABEL_10;
  }
  v36 = [v74 descriptor];
  v37 = [v36 shape];
  v38 = [v37 objectAtIndexedSubscript:3];
  if ((unint64_t)[v38 unsignedIntegerValue] >= 2)
  {

LABEL_28:
    v60 = +[MLCLog framework];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      -[MLCInstanceNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:](a2);
    }
    goto LABEL_35;
  }
  v39 = [v74 descriptor];
  [v39 shape];
  v41 = v40 = self;
  [v41 objectAtIndexedSubscript:2];
  id v42 = v17;
  v44 = id v43 = v16;
  v67 = (MLCInstanceNormalizationLayer *)[v44 unsignedIntegerValue];

  id v16 = v43;
  id v17 = v42;

  self = v40;
  if ((unint64_t)v67 >= 2) {
    goto LABEL_28;
  }
LABEL_10:
  if (!v17) {
    goto LABEL_13;
  }
  v45 = [v17 descriptor];
  v46 = [v45 shape];
  v47 = [v46 objectAtIndexedSubscript:3];
  if ((unint64_t)[v47 unsignedIntegerValue] >= 2)
  {

LABEL_31:
    v60 = +[MLCLog framework];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      -[MLCInstanceNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:](a2);
    }
    goto LABEL_35;
  }
  v48 = [v17 descriptor];
  [v48 shape];
  v50 = v49 = self;
  [v50 objectAtIndexedSubscript:2];
  id v51 = v17;
  v53 = id v52 = v16;
  v67 = (MLCInstanceNormalizationLayer *)[v53 unsignedIntegerValue];

  id v16 = v52;
  id v17 = v51;

  self = v49;
  if ((unint64_t)v67 >= 2) {
    goto LABEL_31;
  }
LABEL_13:
  BOOL v54 = v74 != 0;
  if (v17)
  {
    BOOL v54 = 0;
    BOOL v55 = v74 == 0;
  }
  else
  {
    BOOL v55 = 0;
  }
  if (v55 || v54)
  {
    v60 = +[MLCLog framework];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      -[MLCInstanceNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:](a2);
    }
LABEL_35:

    v61 = 0;
    goto LABEL_36;
  }
  v76.receiver = self;
  v76.super_class = (Class)MLCInstanceNormalizationLayer;
  v56 = [(MLCLayer *)&v76 initWithLabel:@"InstanceNorm"];
  v57 = v56;
  if (v56)
  {
    v56->_featureChannelCount = a3;
    objc_storeStrong((id *)&v56->_mean, a4);
    objc_storeStrong((id *)&v57->_variance, obj);
    objc_storeStrong((id *)&v57->_beta, v71);
    objc_storeStrong((id *)&v57->_gamma, v72);
    v57->_varianceEpsilon = a8;
    v57->_momentum = a9;
    if (v74)
    {
      uint64_t v58 = +[MLCTensorParameter parameterWithTensor:v74];
      betaParameter = v57->_betaParameter;
      v57->_betaParameter = (MLCTensorParameter *)v58;

      [(MLCTensor *)v57->_beta setIsLayerParameter:1];
    }
    else
    {
      v63 = v57->_betaParameter;
      v57->_betaParameter = 0;
    }
    if (v17)
    {
      uint64_t v64 = +[MLCTensorParameter parameterWithTensor:v17];
      gammaParameter = v57->_gammaParameter;
      v57->_gammaParameter = (MLCTensorParameter *)v64;

      [(MLCTensor *)v57->_gamma setIsLayerParameter:1];
    }
    else
    {
      v66 = v57->_gammaParameter;
      v57->_gammaParameter = 0;
    }
    v75.receiver = v57;
    v75.super_class = (Class)MLCInstanceNormalizationLayer;
    -[MLCLayer setIsUpdatable:](&v75, sel_setIsUpdatable_, 1, v67);
  }
  self = v57;
  v61 = self;
LABEL_36:

  return v61;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8 = a3;
  id v58 = a4;
  id v57 = a5;
  v9 = (void *)[&unk_1F3876F48 mutableCopy];
  if ([v8 type] == 3) {
    [v9 addObject:&unk_1F3876C78];
  }
  v10 = [(MLCInstanceNormalizationLayer *)self beta];

  if (v10)
  {
    v11 = [(MLCInstanceNormalizationLayer *)self beta];
    char v12 = [v11 isTensorDataTypeInListOfDataTypes:v9];

    if ((v12 & 1) == 0)
    {
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[MLCInstanceNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2, self);
      }
      goto LABEL_19;
    }
    double v13 = [(MLCInstanceNormalizationLayer *)self beta];
    id v14 = [v13 parentLayers];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[MLCInstanceNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2, self);
      }
LABEL_19:
      char v42 = 0;
      goto LABEL_20;
    }
  }
  id v17 = [(MLCInstanceNormalizationLayer *)self gamma];

  if (v17)
  {
    v18 = [(MLCInstanceNormalizationLayer *)self gamma];
    char v19 = [v18 isTensorDataTypeInListOfDataTypes:v9];

    if ((v19 & 1) == 0)
    {
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[MLCInstanceNormalizationLayer compileForDevice:sourceTensors:resultTensor:](a2, self);
      }
      goto LABEL_19;
    }
    id v20 = [(MLCInstanceNormalizationLayer *)self gamma];
    double v21 = [v20 parentLayers];
    uint64_t v22 = [v21 count];

    if (v22)
    {
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[MLCInstanceNormalizationLayer compileForDevice:sourceTensors:resultTensor:](a2, self);
      }
      goto LABEL_19;
    }
  }
  id v23 = [(MLCLayer *)self fusedLayers];
  uint64_t v24 = [v23 count];

  BOOL v55 = v8;
  if (v24)
  {
    v25 = [(MLCLayer *)self fusedLayers];
    BOOL v54 = [v25 objectAtIndexedSubscript:0];

    unint64_t v26 = [v8 computeEngine];
    uint64_t v27 = [v54 descriptor];
    NSUInteger v28 = [(MLCInstanceNormalizationLayer *)self featureChannelCount];
    uint64_t v29 = [(MLCInstanceNormalizationLayer *)self mean];
    v30 = [(MLCInstanceNormalizationLayer *)self variance];
    v31 = [(MLCInstanceNormalizationLayer *)self beta];
    v32 = [(MLCInstanceNormalizationLayer *)self gamma];
    [(MLCInstanceNormalizationLayer *)self varianceEpsilon];
    int v34 = v33;
    [(MLCInstanceNormalizationLayer *)self momentum];
    LODWORD(v36) = v35;
    v37 = (void *)v27;
    NSUInteger v38 = v28;
    v39 = (void *)v29;
    LODWORD(v40) = v34;
    id v16 = [v26 fusedInstanceNormalizationAndNeuronLayerWithDescriptor:v27 numOfFeatureChannels:v38 mean:v29 variance:v30 beta:v31 gamma:v32 varianceEpsilon:v40 momentum:v36];

    v41 = v54;
  }
  else
  {
    v41 = [v8 computeEngine];
    NSUInteger v44 = [(MLCInstanceNormalizationLayer *)self featureChannelCount];
    unint64_t v26 = [(MLCInstanceNormalizationLayer *)self mean];
    uint64_t v45 = [(MLCInstanceNormalizationLayer *)self variance];
    uint64_t v46 = [(MLCInstanceNormalizationLayer *)self beta];
    v30 = [(MLCInstanceNormalizationLayer *)self gamma];
    [(MLCInstanceNormalizationLayer *)self varianceEpsilon];
    int v48 = v47;
    [(MLCInstanceNormalizationLayer *)self momentum];
    LODWORD(v50) = v49;
    v37 = (void *)v45;
    v39 = (void *)v46;
    LODWORD(v51) = v48;
    id v16 = [v41 instanceNormalizationLayerWithChannelCount:v44 mean:v26 variance:v45 beta:v46 gamma:v30 varianceEpsilon:v51 momentum:v50];
  }

  if (v16 && [v16 count])
  {
    id v8 = v55;
    id v52 = [v55 computeEngine];
    char v42 = [v52 compileLayerDeviceOps:v16 sourceTensors:v58 resultTensor:v57];

    v59.receiver = self;
    v59.super_class = (Class)MLCInstanceNormalizationLayer;
    [(MLCLayer *)&v59 bindDevice:v55 deviceOps:v16];
  }
  else
  {
    v53 = +[MLCLog framework];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }

    char v42 = 0;
    id v8 = v55;
  }
LABEL_20:

  return v42;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  id v4 = a3;
  v5 = [(MLCInstanceNormalizationLayer *)self beta];

  if (v5)
  {
    v6 = [(MLCInstanceNormalizationLayer *)self betaParameter];
    v7 = [(MLCLayer *)self device];
    [v6 allocateDataForOptimizer:v4 device:v7 isVector:1];
  }
  id v8 = [(MLCInstanceNormalizationLayer *)self gamma];

  if (v8)
  {
    v9 = [(MLCInstanceNormalizationLayer *)self gammaParameter];
    v10 = [(MLCLayer *)self device];
    [v9 allocateDataForOptimizer:v4 device:v10 isVector:1];
  }
  v11 = [(MLCLayer *)self device];
  char v12 = [v11 computeEngine];
  double v13 = [(MLCLayer *)self deviceOps];
  id v14 = [(MLCInstanceNormalizationLayer *)self beta];
  uint64_t v15 = [(MLCInstanceNormalizationLayer *)self gamma];
  [v12 setNormalizationLayerOptimizerDataForDeviceOps:v13 beta:v14 gamma:v15];

  return 1;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(MLCInstanceNormalizationLayer *)self beta];
  id v8 = [v7 descriptor];
  uint64_t v9 = [v8 tensorAllocationSizeInBytes];
  v10 = [(MLCInstanceNormalizationLayer *)self gamma];
  v11 = [v10 descriptor];
  unint64_t v12 = [v11 tensorAllocationSizeInBytes] + v9;

  if (v4)
  {
    double v13 = [(MLCInstanceNormalizationLayer *)self gamma];
    id v14 = [v13 descriptor];
    uint64_t v15 = [v14 tensorAllocationSizeInBytes];
    id v16 = [(MLCInstanceNormalizationLayer *)self beta];
    id v17 = [v16 descriptor];
    uint64_t v18 = [v17 tensorAllocationSizeInBytes] + v15;
    v12 += v18 * [v6 numOptimizerDataBuffers];
  }
  return v12;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MLCInstanceNormalizationLayer *)self beta];
  v7 = [(MLCInstanceNormalizationLayer *)self gamma];
  [(MLCInstanceNormalizationLayer *)self varianceEpsilon];
  double v9 = v8;
  v10 = [(MLCLayer *)self conditionalTreeNode];
  v11 = [(MLCLayer *)self resultTensors];
  unint64_t v12 = [v3 stringWithFormat:@"%@: { beta=%@ : gamma=%@ : varianceEpsilon=%f : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, *(void *)&v9, v10, v11];

  return v12;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  NSUInteger v7 = [(MLCInstanceNormalizationLayer *)self featureChannelCount];
  [(MLCInstanceNormalizationLayer *)self varianceEpsilon];
  double v9 = v8;
  [(MLCInstanceNormalizationLayer *)self momentum];
  v11 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Feature Channel Count: %lu    Variance Epsilon: %.03f<BR />Momentum: %.03f</FONT>>", v5, v6, v7, *(void *)&v9, v10];

  return v11;
}

- (void)linkAssociatedTensors
{
  v3 = [(MLCInstanceNormalizationLayer *)self beta];
  BOOL v4 = [v3 childLayers];
  [v4 addObject:self];

  id v6 = [(MLCInstanceNormalizationLayer *)self gamma];
  v5 = [v6 childLayers];
  [v5 addObject:self];
}

- (void)unlinkAssociatedTensors
{
  v3 = [(MLCInstanceNormalizationLayer *)self beta];
  BOOL v4 = [v3 childLayers];
  [v4 removeObject:self];

  id v6 = [(MLCInstanceNormalizationLayer *)self gamma];
  v5 = [v6 childLayers];
  [v5 removeObject:self];
}

- (BOOL)isValidTrainingParameters
{
  v3 = [(MLCInstanceNormalizationLayer *)self beta];
  if (v3)
  {
    BOOL v4 = [(MLCInstanceNormalizationLayer *)self gamma];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)parametersCount
{
  v3 = [(MLCInstanceNormalizationLayer *)self betaParameter];

  BOOL v4 = [(MLCInstanceNormalizationLayer *)self gammaParameter];

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

- (MLCTensor)mean
{
  return self->_mean;
}

- (MLCTensor)variance
{
  return self->_variance;
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

- (float)momentum
{
  return self->_momentum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gammaParameter, 0);
  objc_storeStrong((id *)&self->_betaParameter, 0);
  objc_storeStrong((id *)&self->_gamma, 0);
  objc_storeStrong((id *)&self->_beta, 0);
  objc_storeStrong((id *)&self->_variance, 0);

  objc_storeStrong((id *)&self->_mean, 0);
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: beta tensor width or height cannot be > 1", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: gamma tensor width or height cannot be > 1", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Both gamma and beta must either be null or non-null", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: variance tensor width or height cannot be > 1", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: mean tensor width or height cannot be > 1", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.2(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 gamma];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v5, v6, "%@: gamma tensor used by InstanceNormalization cannot have a parent layer=%@", v7, v8, v9, v10, v11);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.3(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 gamma];
  uint64_t v5 = [a2 gamma];
  uint64_t v6 = [v5 descriptor];
  [v6 dataType];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1DD0C9000, v7, v8, "%@: gamma tensor (%@) in InstanceNormalization uses an unsupported data type=%d", v9, v10, v11, v12, v13);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.4(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 beta];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v5, v6, "%@: beta tensor used by InstanceNormalization cannot have a parent layer=%@", v7, v8, v9, v10, v11);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.5(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 beta];
  uint64_t v5 = [a2 beta];
  uint64_t v6 = [v5 descriptor];
  [v6 dataType];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1DD0C9000, v7, v8, "%@: beta tensor (%@) in InstanceNormalization uses an unsupported data type=%d", v9, v10, v11, v12, v13);
}

@end