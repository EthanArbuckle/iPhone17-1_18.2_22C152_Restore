@interface MLCBatchNormalizationLayer
+ (MLCBatchNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount mean:(MLCTensor *)mean variance:(MLCTensor *)variance beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon;
+ (MLCBatchNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount mean:(MLCTensor *)mean variance:(MLCTensor *)variance beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon momentum:(float)momentum;
- (BOOL)allocateDataForOptimizer:(id)a3;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (BOOL)isValidTrainingParameters;
- (MLCBatchNormalizationLayer)initWithFeatureChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9;
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

@implementation MLCBatchNormalizationLayer

+ (MLCBatchNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount mean:(MLCTensor *)mean variance:(MLCTensor *)variance beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon
{
  return (MLCBatchNormalizationLayer *)objc_msgSend(a1, "layerWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:", featureChannelCount, mean, variance, beta, gamma);
}

+ (MLCBatchNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount mean:(MLCTensor *)mean variance:(MLCTensor *)variance beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon momentum:(float)momentum
{
  v16 = gamma;
  v17 = beta;
  v18 = variance;
  v19 = mean;
  id v20 = objc_alloc((Class)a1);
  *(float *)&double v21 = varianceEpsilon;
  *(float *)&double v22 = momentum;
  v23 = (void *)[v20 initWithFeatureChannelCount:featureChannelCount mean:v19 variance:v18 beta:v17 gamma:v16 varianceEpsilon:v21 momentum:v22];

  return (MLCBatchNormalizationLayer *)v23;
}

- (MLCBatchNormalizationLayer)initWithFeatureChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9
{
  id v15 = a4;
  id obj = a5;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = [v15 descriptor];
  id v20 = [v19 shape];
  double v21 = [v20 objectAtIndexedSubscript:0];
  if ((unint64_t)[v21 unsignedIntegerValue] > 1) {
    goto LABEL_4;
  }
  id v73 = a6;
  id v74 = a7;
  v83 = self;
  double v22 = [v15 descriptor];
  v23 = [v22 shape];
  v24 = [v23 objectAtIndexedSubscript:3];
  if ((unint64_t)[v24 unsignedIntegerValue] > 1)
  {

    self = v83;
LABEL_4:

    goto LABEL_5;
  }
  [v15 descriptor];
  v28 = id v77 = v15;
  [v28 shape];
  v29 = v76 = v16;
  [v29 objectAtIndexedSubscript:2];
  v30 = v75 = v17;
  id v78 = v18;
  unint64_t v31 = [v30 unsignedIntegerValue];

  id v17 = v75;
  id v16 = v76;

  id v15 = v77;
  BOOL v32 = v31 > 1;
  id v18 = v78;
  self = v83;
  if (v32)
  {
LABEL_5:
    v25 = +[MLCLog framework];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MLCBatchNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:](a2);
    }
LABEL_7:

    v26 = 0;
    goto LABEL_8;
  }
  v33 = [v76 descriptor];
  v34 = [v33 shape];
  v35 = [v34 objectAtIndexedSubscript:0];
  if ((unint64_t)[v35 unsignedIntegerValue] > 1) {
    goto LABEL_13;
  }
  v36 = [v76 descriptor];
  v37 = [v36 shape];
  v38 = [v37 objectAtIndexedSubscript:3];
  if ((unint64_t)[v38 unsignedIntegerValue] > 1)
  {

    self = v83;
LABEL_13:

    goto LABEL_14;
  }
  v39 = [v76 descriptor];
  v40 = [v39 shape];
  v41 = [v40 objectAtIndexedSubscript:2];
  unint64_t v42 = [v41 unsignedIntegerValue];

  id v16 = v76;
  id v15 = v77;

  id v18 = v78;
  BOOL v32 = v42 > 1;
  id v17 = v75;
  self = v83;
  if (v32)
  {
LABEL_14:
    v25 = +[MLCLog framework];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MLCBatchNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:](a2);
    }
    goto LABEL_7;
  }
  if (v75)
  {
    v43 = [v75 descriptor];
    v44 = [v43 shape];
    v45 = [v44 objectAtIndexedSubscript:0];
    if ((unint64_t)[v45 unsignedIntegerValue] > 1)
    {
LABEL_21:

      goto LABEL_22;
    }
    v46 = [v75 descriptor];
    v47 = [v46 shape];
    v48 = [v47 objectAtIndexedSubscript:3];
    if ((unint64_t)[v48 unsignedIntegerValue] > 1)
    {

      self = v83;
      goto LABEL_21;
    }
    v49 = [v75 descriptor];
    v50 = [v49 shape];
    v51 = [v50 objectAtIndexedSubscript:2];
    unint64_t v52 = [v51 unsignedIntegerValue];

    id v16 = v76;
    id v15 = v77;

    id v18 = v78;
    BOOL v32 = v52 > 1;
    id v17 = v75;
    self = v83;
    if (v32)
    {
LABEL_22:
      v25 = +[MLCLog framework];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[MLCBatchNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:](a2);
      }
      goto LABEL_7;
    }
  }
  if (v18)
  {
    v53 = [v18 descriptor];
    v54 = [v53 shape];
    v55 = [v54 objectAtIndexedSubscript:0];
    if ((unint64_t)[v55 unsignedIntegerValue] > 1)
    {
LABEL_29:

      goto LABEL_30;
    }
    v56 = [v18 descriptor];
    v57 = [v56 shape];
    v58 = [v57 objectAtIndexedSubscript:3];
    if ((unint64_t)[v58 unsignedIntegerValue] > 1)
    {

      self = v83;
      goto LABEL_29;
    }
    v59 = [v18 descriptor];
    v60 = [v59 shape];
    v61 = [v60 objectAtIndexedSubscript:2];
    unint64_t v62 = [v61 unsignedIntegerValue];

    id v16 = v76;
    id v15 = v77;

    id v18 = v78;
    BOOL v32 = v62 > 1;
    id v17 = v75;
    self = v83;
    if (v32)
    {
LABEL_30:
      v25 = +[MLCLog framework];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[MLCBatchNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.4(a2);
      }
      goto LABEL_7;
    }
  }
  BOOL v63 = v17 != 0;
  if (v18)
  {
    BOOL v63 = 0;
    BOOL v64 = v17 == 0;
  }
  else
  {
    BOOL v64 = 0;
  }
  if (v64 || v63)
  {
    v25 = +[MLCLog framework];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MLCBatchNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.5(a2);
    }
    goto LABEL_7;
  }
  v85.receiver = self;
  v85.super_class = (Class)MLCBatchNormalizationLayer;
  v65 = [(MLCLayer *)&v85 initWithLabel:@"BatchNorm"];
  v66 = v65;
  if (v65)
  {
    v65->_featureChannelCount = a3;
    objc_storeStrong((id *)&v65->_mean, a4);
    objc_storeStrong((id *)&v66->_variance, obj);
    objc_storeStrong((id *)&v66->_beta, v73);
    objc_storeStrong((id *)&v66->_gamma, v74);
    v66->_varianceEpsilon = a8;
    v66->_momentum = a9;
    [(MLCTensor *)v66->_mean setIsLayerParameter:1];
    [(MLCTensor *)v66->_variance setIsLayerParameter:1];
    if (v17)
    {
      uint64_t v67 = +[MLCTensorParameter parameterWithTensor:v17];
      betaParameter = v66->_betaParameter;
      v66->_betaParameter = (MLCTensorParameter *)v67;

      [(MLCTensor *)v66->_beta setIsLayerParameter:1];
    }
    else
    {
      v69 = v66->_betaParameter;
      v66->_betaParameter = 0;
    }
    if (v78)
    {
      uint64_t v70 = +[MLCTensorParameter parameterWithTensor:v78];
      gammaParameter = v66->_gammaParameter;
      v66->_gammaParameter = (MLCTensorParameter *)v70;

      [(MLCTensor *)v66->_gamma setIsLayerParameter:1];
    }
    else
    {
      v72 = v66->_gammaParameter;
      v66->_gammaParameter = 0;
    }
    id v18 = v78;
    v84.receiver = v66;
    v84.super_class = (Class)MLCBatchNormalizationLayer;
    [(MLCLayer *)&v84 setIsUpdatable:1];
  }
  self = v66;
  v26 = self;
LABEL_8:

  return v26;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MLCBatchNormalizationLayer *)self mean];
  v12 = [v11 parentLayers];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    v14 = [&unk_1F3876D20 mutableCopy];
    if ([v8 type] == 3) {
      [v14 addObject:&unk_1F38764F8];
    }
    id v16 = [(MLCBatchNormalizationLayer *)self mean];
    char v17 = [v16 isTensorDataTypeInListOfDataTypes:v14];

    if ((v17 & 1) == 0)
    {
      double v21 = +[MLCLog framework];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.8();
      }
      goto LABEL_13;
    }
    id v18 = [(MLCBatchNormalizationLayer *)self variance];
    v19 = [v18 parentLayers];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      double v21 = +[MLCLog framework];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.7();
      }
    }
    else
    {
      v23 = [(MLCBatchNormalizationLayer *)self variance];
      char v24 = [v23 isTensorDataTypeInListOfDataTypes:v14];

      if ((v24 & 1) == 0)
      {
        double v21 = +[MLCLog framework];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.6();
        }
        goto LABEL_13;
      }
      v25 = [(MLCBatchNormalizationLayer *)self beta];

      if (!v25) {
        goto LABEL_24;
      }
      v26 = [(MLCBatchNormalizationLayer *)self beta];
      char v27 = [v26 isTensorDataTypeInListOfDataTypes:v14];

      if ((v27 & 1) == 0)
      {
        double v21 = +[MLCLog framework];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.5();
        }
        goto LABEL_13;
      }
      v28 = [(MLCBatchNormalizationLayer *)self beta];
      v29 = [v28 parentLayers];
      uint64_t v30 = [v29 count];

      if (v30)
      {
        double v21 = +[MLCLog framework];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.4();
        }
      }
      else
      {
LABEL_24:
        unint64_t v31 = [(MLCBatchNormalizationLayer *)self gamma];

        if (!v31) {
          goto LABEL_31;
        }
        BOOL v32 = [(MLCBatchNormalizationLayer *)self gamma];
        char v33 = [v32 isTensorDataTypeInListOfDataTypes:v14];

        if ((v33 & 1) == 0)
        {
          double v21 = +[MLCLog framework];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:]();
          }
          goto LABEL_13;
        }
        v34 = [(MLCBatchNormalizationLayer *)self gamma];
        v35 = [v34 parentLayers];
        uint64_t v36 = [v35 count];

        if (v36)
        {
          double v21 = +[MLCLog framework];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:]();
          }
        }
        else
        {
LABEL_31:
          v37 = [(MLCLayer *)self fusedLayers];
          uint64_t v38 = [v37 count];

          if (v38)
          {
            v39 = [(MLCLayer *)self fusedLayers];
            BOOL v64 = [v39 objectAtIndexedSubscript:0];

            v40 = [v8 computeEngine];
            v69 = [v64 descriptor];
            NSUInteger v67 = [(MLCBatchNormalizationLayer *)self featureChannelCount];
            uint64_t v41 = [(MLCBatchNormalizationLayer *)self mean];
            uint64_t v65 = [(MLCBatchNormalizationLayer *)self variance];
            BOOL v63 = [(MLCBatchNormalizationLayer *)self beta];
            unint64_t v42 = [(MLCBatchNormalizationLayer *)self gamma];
            [(MLCBatchNormalizationLayer *)self varianceEpsilon];
            int v44 = v43;
            [(MLCBatchNormalizationLayer *)self momentum];
            LODWORD(v46) = v45;
            NSUInteger v47 = v67;
            v68 = (void *)v41;
            uint64_t v48 = v41;
            v49 = (void *)v65;
            LODWORD(v50) = v44;
            double v21 = [v40 fusedBatchNormalizationAndNeuronLayerWithDescriptor:v69 numOfFeatureChannels:v47 mean:v48 variance:v65 beta:v63 gamma:v42 varianceEpsilon:v50 momentum:v46];

            v51 = v64;
          }
          else
          {
            v51 = [v8 computeEngine];
            NSUInteger v70 = [(MLCBatchNormalizationLayer *)self featureChannelCount];
            v40 = [(MLCBatchNormalizationLayer *)self mean];
            uint64_t v52 = [(MLCBatchNormalizationLayer *)self variance];
            uint64_t v53 = [(MLCBatchNormalizationLayer *)self beta];
            uint64_t v66 = [(MLCBatchNormalizationLayer *)self gamma];
            [(MLCBatchNormalizationLayer *)self varianceEpsilon];
            int v55 = v54;
            [(MLCBatchNormalizationLayer *)self momentum];
            LODWORD(v57) = v56;
            NSUInteger v58 = v70;
            v68 = (void *)v53;
            v69 = (void *)v52;
            uint64_t v59 = v53;
            v49 = (void *)v66;
            LODWORD(v60) = v55;
            double v21 = [v51 batchNormalizationLayerWithChannelCount:v58 mean:v40 variance:v52 beta:v59 gamma:v66 varianceEpsilon:v60 momentum:v57];
          }

          if (v21 && [v21 count])
          {
            v61 = [v8 computeEngine];
            char v15 = [v61 compileLayerDeviceOps:v21 sourceTensors:v9 resultTensor:v10];

            v71.receiver = self;
            v71.super_class = (Class)MLCBatchNormalizationLayer;
            [(MLCLayer *)&v71 bindDevice:v8 deviceOps:v21];
            goto LABEL_14;
          }
          unint64_t v62 = +[MLCLog framework];
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
            -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:]();
          }
        }
      }
    }
LABEL_13:
    char v15 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v14 = +[MLCLog framework];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.9();
  }
  char v15 = 0;
LABEL_15:

  return v15;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  id v4 = a3;
  v5 = [(MLCBatchNormalizationLayer *)self beta];

  if (v5)
  {
    v6 = [(MLCBatchNormalizationLayer *)self betaParameter];
    v7 = [(MLCLayer *)self device];
    [v6 allocateDataForOptimizer:v4 device:v7 isVector:1];
  }
  id v8 = [(MLCBatchNormalizationLayer *)self gamma];

  if (v8)
  {
    id v9 = [(MLCBatchNormalizationLayer *)self gammaParameter];
    id v10 = [(MLCLayer *)self device];
    [v9 allocateDataForOptimizer:v4 device:v10 isVector:1];
  }
  v11 = [(MLCLayer *)self device];
  v12 = [v11 computeEngine];
  uint64_t v13 = [(MLCLayer *)self deviceOps];
  v14 = [(MLCBatchNormalizationLayer *)self beta];
  char v15 = [(MLCBatchNormalizationLayer *)self gamma];
  [v12 setNormalizationLayerOptimizerDataForDeviceOps:v13 beta:v14 gamma:v15];

  return 1;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  BOOL v31 = a3;
  id v27 = a4;
  v5 = [(MLCBatchNormalizationLayer *)self mean];
  v6 = [v5 descriptor];
  uint64_t v30 = [v6 tensorAllocationSizeInBytes];
  v7 = [(MLCBatchNormalizationLayer *)self variance];
  id v8 = [v7 descriptor];
  uint64_t v29 = [v8 tensorAllocationSizeInBytes];
  id v9 = [(MLCBatchNormalizationLayer *)self beta];
  id v10 = [v9 descriptor];
  uint64_t v28 = [v10 tensorAllocationSizeInBytes];
  v11 = [(MLCBatchNormalizationLayer *)self gamma];
  v12 = [v11 descriptor];
  uint64_t v13 = [v12 tensorAllocationSizeInBytes];

  v14 = [(MLCBatchNormalizationLayer *)self mean];
  char v15 = [v14 descriptor];
  uint64_t v16 = [v15 tensorAllocationSizeInBytes];
  char v17 = [(MLCBatchNormalizationLayer *)self variance];
  id v18 = [v17 descriptor];
  unint64_t v19 = v29 + v30 + v28 + v13 + v16 + [v18 tensorAllocationSizeInBytes];

  if (v31)
  {
    uint64_t v20 = [(MLCBatchNormalizationLayer *)self gamma];
    double v21 = [v20 descriptor];
    uint64_t v22 = [v21 tensorAllocationSizeInBytes];
    v23 = [(MLCBatchNormalizationLayer *)self beta];
    char v24 = [v23 descriptor];
    uint64_t v25 = [v24 tensorAllocationSizeInBytes] + v22;
    v19 += v25 * [v27 numOptimizerDataBuffers];
  }
  return v19;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MLCBatchNormalizationLayer *)self mean];
  v7 = [(MLCBatchNormalizationLayer *)self variance];
  id v8 = [(MLCBatchNormalizationLayer *)self beta];
  id v9 = [(MLCBatchNormalizationLayer *)self gamma];
  [(MLCBatchNormalizationLayer *)self varianceEpsilon];
  double v11 = v10;
  v12 = [(MLCLayer *)self conditionalTreeNode];
  uint64_t v13 = [(MLCLayer *)self resultTensors];
  v14 = [v3 stringWithFormat:@"%@: { mean=%@ : variance=%@ : beta=%@ : gamma=%@ : varianceEpsilon=%f : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8, v9, *(void *)&v11, v12, v13];

  return v14;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  NSUInteger v7 = [(MLCBatchNormalizationLayer *)self featureChannelCount];
  [(MLCBatchNormalizationLayer *)self varianceEpsilon];
  double v9 = v8;
  [(MLCBatchNormalizationLayer *)self momentum];
  double v11 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Feature Channel Count: %lu    Variance Epsilon: %.03f<BR />Momentum: %.03f</FONT>>", v5, v6, v7, *(void *)&v9, v10];

  return v11;
}

- (void)linkAssociatedTensors
{
  v3 = [(MLCBatchNormalizationLayer *)self mean];
  id v4 = [v3 childLayers];
  [v4 addObject:self];

  v5 = [(MLCBatchNormalizationLayer *)self variance];
  NSUInteger v6 = [v5 childLayers];
  [v6 addObject:self];

  NSUInteger v7 = [(MLCBatchNormalizationLayer *)self beta];
  float v8 = [v7 childLayers];
  [v8 addObject:self];

  id v10 = [(MLCBatchNormalizationLayer *)self gamma];
  double v9 = [v10 childLayers];
  [v9 addObject:self];
}

- (void)unlinkAssociatedTensors
{
  v3 = [(MLCBatchNormalizationLayer *)self mean];
  id v4 = [v3 childLayers];
  [v4 removeObject:self];

  v5 = [(MLCBatchNormalizationLayer *)self variance];
  NSUInteger v6 = [v5 childLayers];
  [v6 removeObject:self];

  NSUInteger v7 = [(MLCBatchNormalizationLayer *)self beta];
  float v8 = [v7 childLayers];
  [v8 removeObject:self];

  id v10 = [(MLCBatchNormalizationLayer *)self gamma];
  double v9 = [v10 childLayers];
  [v9 removeObject:self];
}

- (BOOL)isValidTrainingParameters
{
  v3 = [(MLCBatchNormalizationLayer *)self beta];
  if (v3)
  {
    id v4 = [(MLCBatchNormalizationLayer *)self gamma];
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
      NSUInteger v6 = [v5 descriptor];
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
  id v3 = [(MLCBatchNormalizationLayer *)self betaParameter];

  unint64_t v4 = [(MLCBatchNormalizationLayer *)self gammaParameter];

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
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: mean tensor batch size, width or height cannot be > 1", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: variance tensor batch size, width or height cannot be > 1", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: beta tensor batch size, width or height cannot be > 1", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: gamma tensor batch size, width or height cannot be > 1", v4, v5, v6, v7, v8);
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Both gamma and beta must either be null or non-null", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_9_0() gamma];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v3, v4, "%@: gamma tensor used by BatchNormalization cannot have a parent layer=%@", v5, v6, v7, v8, v9);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.3()
{
  OUTLINED_FUNCTION_8_0();
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_7_0() gamma];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_10() gamma];
  uint64_t v4 = [v3 descriptor];
  [v4 dataType];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1DD0C9000, v5, v6, "%@: gamma tensor (%@) in BatchNormalization uses an unsupported data type=%d", v7, v8, v9, v10, v11);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  SEL v2 = [(id)OUTLINED_FUNCTION_9_0() beta];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v3, v4, "%@: beta tensor used by BatchNormalization cannot have a parent layer=%@", v5, v6, v7, v8, v9);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.5()
{
  OUTLINED_FUNCTION_8_0();
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_7_0() beta];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_10() beta];
  uint64_t v4 = [v3 descriptor];
  [v4 dataType];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1DD0C9000, v5, v6, "%@: beta tensor (%@) in BatchNormalization uses an unsupported data type=%d", v7, v8, v9, v10, v11);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.6()
{
  OUTLINED_FUNCTION_8_0();
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_7_0() variance];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_10() variance];
  uint64_t v4 = [v3 descriptor];
  [v4 dataType];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1DD0C9000, v5, v6, "%@: variance tensor (%@) in BatchNormalization uses an unsupported data type=%d", v7, v8, v9, v10, v11);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.7()
{
  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  SEL v2 = [(id)OUTLINED_FUNCTION_9_0() variance];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v3, v4, "%@: variance tensor used by BatchNormalization cannot have a parent layer=%@", v5, v6, v7, v8, v9);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.8()
{
  OUTLINED_FUNCTION_8_0();
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_7_0() mean];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_10() mean];
  uint64_t v4 = [v3 descriptor];
  [v4 dataType];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1DD0C9000, v5, v6, "%@: mean tensor (%@) in BatchNormalization uses an unsupported data type=%d", v7, v8, v9, v10, v11);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.9()
{
  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  SEL v2 = [(id)OUTLINED_FUNCTION_9_0() mean];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v3, v4, "%@: mean tensor used by BatchNormalization cannot have a parent layer=%@", v5, v6, v7, v8, v9);
}

@end