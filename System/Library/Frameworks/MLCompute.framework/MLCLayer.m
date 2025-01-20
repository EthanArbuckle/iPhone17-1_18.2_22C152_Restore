@interface MLCLayer
+ (BOOL)supportsDataType:(MLCDataType)dataType onDevice:(MLCDevice *)device;
- (BOOL)allocateDataForOptimizer:(id)a3;
- (BOOL)allocateGradientTensors;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5;
- (BOOL)compileForInferenceOnly;
- (BOOL)disableUpdate;
- (BOOL)isDebuggingEnabled;
- (BOOL)isFirstLayer;
- (BOOL)isGradientNeededForTensor:(id)a3;
- (BOOL)isLastFusedLayer;
- (BOOL)isLastLayer;
- (BOOL)isStaticBatchSize;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (BOOL)isTensorSharedAcrossMultipleTrainingLayers:(id)a3;
- (BOOL)isTrainable;
- (BOOL)isUpdatable;
- (BOOL)isValidTrainingParameters;
- (BOOL)skipLayer;
- (BOOL)zeroIntermediateGradientTensors;
- (MLCControlTreeNode)conditionalTreeNode;
- (MLCDevice)device;
- (MLCDeviceType)deviceType;
- (MLCLayer)initWithLabel:(id)a3;
- (MLCLayer)intermediateSumLayer;
- (NSArray)deviceOps;
- (NSMutableArray)fusedLayers;
- (NSMutableArray)intermediateGradientTensors;
- (NSMutableArray)resultGradientTensors;
- (NSMutableArray)resultTensors;
- (NSMutableArray)sourceGradientTensors;
- (NSMutableArray)sourceTensors;
- (NSNumber)key;
- (NSString)description;
- (NSString)label;
- (NSString)originalLabel;
- (NSString)summarizedDOTDescription;
- (NSUInteger)layerID;
- (id)getDeviceForInference;
- (id)getDeviceForTraining;
- (id)resultTensorFromSources:(id)a3;
- (id)resultTensorsFromBroadcastableSources:(id)a3 resultTensorDataType:(int)a4;
- (int)paddingPolicy;
- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4;
- (unint64_t)deviceMemorySizeForForward;
- (unint64_t)deviceMemorySizeWithOptimizer:(id)a3 device:(id)a4;
- (unint64_t)dilationRateInX;
- (unint64_t)dilationRateInY;
- (unint64_t)intermediateGradientTensorIndex;
- (unint64_t)kernelHeight;
- (unint64_t)kernelWidth;
- (unint64_t)paddingSizeInX;
- (unint64_t)paddingSizeInY;
- (unint64_t)parametersCount;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
- (unint64_t)resultSizeFromSourceSizes:(id)a3 dimension:(unint64_t)a4;
- (unint64_t)strideInX;
- (unint64_t)strideInY;
- (void)assignLayerID:(unint64_t)a3;
- (void)bindDevice:(id)a3 deviceOps:(id)a4;
- (void)getDeviceForInference;
- (void)getDeviceForTraining;
- (void)resetLayerID;
- (void)setAllocateGradientTensors:(BOOL)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setCompileForInferenceOnly:(BOOL)a3;
- (void)setConditionalTreeNode:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceOps:(id)a3;
- (void)setDilationRateInX:(unint64_t)a3;
- (void)setDilationRateInY:(unint64_t)a3;
- (void)setDisableUpdate:(BOOL)a3;
- (void)setIntermediateGradientTensorIndex:(unint64_t)a3;
- (void)setIntermediateGradientTensors:(id)a3;
- (void)setIntermediateSumLayer:(id)a3;
- (void)setIsDebuggingEnabled:(BOOL)a3 isPrivate:(BOOL)a4;
- (void)setIsDebuggingEnabled:(BOOL)isDebuggingEnabled;
- (void)setIsLastFusedLayer:(BOOL)a3;
- (void)setIsTrainable:(BOOL)a3;
- (void)setIsUpdatable:(BOOL)a3;
- (void)setKernelHeight:(unint64_t)a3;
- (void)setKernelWidth:(unint64_t)a3;
- (void)setLabel:(NSString *)label;
- (void)setLayerID:(unint64_t)a3;
- (void)setPaddingPolicy:(int)a3;
- (void)setPaddingSizeInX:(unint64_t)a3;
- (void)setPaddingSizeInY:(unint64_t)a3;
- (void)setResultGradientTensors:(id)a3;
- (void)setResultTensors:(id)a3;
- (void)setSkipLayer:(BOOL)a3;
- (void)setSourceGradientTensors:(id)a3;
- (void)setSourceTensors:(id)a3;
- (void)setStrideInX:(unint64_t)a3;
- (void)setStrideInY:(unint64_t)a3;
- (void)setZeroIntermediateGradientTensors:(BOOL)a3;
@end

@implementation MLCLayer

- (MLCLayer)initWithLabel:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MLCLayer;
  v6 = [(MLCLayer *)&v28 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_label, a3);
    objc_storeStrong((id *)&v7->_originalLabel, a3);
    int64x2_t v8 = vdupq_n_s64(1uLL);
    *(int64x2_t *)&v7->_kernelWidth = v8;
    *(int64x2_t *)&v7->_dilationRateInX = v8;
    *(int64x2_t *)&v7->_strideInX = v8;
    v7->_paddingPolicy = 0;
    v7->_paddingSizeInX = 0;
    v7->_paddingSizeInY = 0;
    v9 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v10 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    sourceTensors = v7->_sourceTensors;
    v7->_sourceTensors = (NSMutableArray *)v10;

    uint64_t v12 = [v9 mutableCopy];
    resultTensors = v7->_resultTensors;
    v7->_resultTensors = (NSMutableArray *)v12;

    uint64_t v14 = [v9 mutableCopy];
    sourceGradientTensors = v7->_sourceGradientTensors;
    v7->_sourceGradientTensors = (NSMutableArray *)v14;

    uint64_t v16 = [v9 mutableCopy];
    resultGradientTensors = v7->_resultGradientTensors;
    v7->_resultGradientTensors = (NSMutableArray *)v16;

    uint64_t v18 = [v9 mutableCopy];
    fusedLayers = v7->_fusedLayers;
    v7->_fusedLayers = (NSMutableArray *)v18;

    intermediateSumLayer = v7->_intermediateSumLayer;
    v7->_intermediateSumLayer = 0;

    uint64_t v21 = [v9 mutableCopy];
    intermediateGradientTensors = v7->_intermediateGradientTensors;
    v7->_intermediateGradientTensors = (NSMutableArray *)v21;

    v7->_intermediateGradientTensorIndex = 0;
    v7->_zeroIntermediateGradientTensors = 0;
    device = v7->_device;
    v7->_device = 0;

    uint64_t v24 = [v9 mutableCopy];
    deviceOps = v7->_deviceOps;
    v7->_deviceOps = (NSArray *)v24;

    *(_WORD *)&v7->_isDebuggingEnabled = 0;
    v7->_allocateGradientTensors = 1;
    v7->_compileForInferenceOnly = 0;
    *(_DWORD *)&v7->_isLastFusedLayer = 0;
    conditionalTreeNode = v7->_conditionalTreeNode;
    v7->_conditionalTreeNode = 0;
  }
  return v7;
}

- (BOOL)isFirstLayer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(MLCLayer *)self sourceTensors];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "parentLayers", (void)v11);
        uint64_t v8 = [v7 count];

        if (v8)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)isLastLayer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(MLCLayer *)self resultTensors];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "childLayers", (void)v11);
        uint64_t v8 = [v7 count];

        if (v8)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)bindDevice:(id)a3 deviceOps:(id)a4
{
  id v6 = a4;
  [(MLCLayer *)self setDevice:a3];
  [(MLCLayer *)self setDeviceOps:v6];
}

- (void)assignLayerID:(unint64_t)a3
{
  -[MLCLayer setLayerID:](self, "setLayerID:");
  if (self->_label) {
    [NSString stringWithFormat:@"%@-%lu", self->_label, a3];
  }
  else {
    objc_msgSend(NSString, "stringWithFormat:", @"layer-%lu", a3, v5);
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(MLCLayer *)self setLabel:v6];
}

- (void)resetLayerID
{
  [(MLCLayer *)self setLayerID:0];
  id v3 = [(MLCLayer *)self originalLabel];
  [(MLCLayer *)self setLabel:v3];
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  if (a4 >= 2)
  {
    if (a4 == 3)
    {
      unint64_t v6 = [(MLCLayer *)self kernelWidth];
      unint64_t v7 = [(MLCLayer *)self dilationRateInX];
      unint64_t v8 = [(MLCLayer *)self strideInX];
      unint64_t v9 = [(MLCLayer *)self paddingSizeInX];
    }
    else
    {
      unint64_t v6 = [(MLCLayer *)self kernelHeight];
      unint64_t v7 = [(MLCLayer *)self dilationRateInY];
      unint64_t v8 = [(MLCLayer *)self strideInY];
      unint64_t v9 = [(MLCLayer *)self paddingSizeInY];
    }
    unint64_t v10 = v9;
    if ([(MLCLayer *)self paddingPolicy])
    {
      if ([(MLCLayer *)self paddingPolicy] != 1) {
        return vcvtms_u32_f32((float)((float)(~(v7 * (v6 - 1)) + a3 + 2 * v10) / (float)v8) + 1.0);
      }
      if (!v8) {
        return 0;
      }
      unint64_t v11 = v6 - 1;
      if (v8 == 1)
      {
        a3 -= v11 * v7;
        return a3;
      }
      unint64_t v12 = v8 + ((a3 - v11 * v7) & ~((uint64_t)(a3 - v11 * v7) >> 63));
      return (v12 - 1) / v8;
    }
    if (!v8) {
      return 0;
    }
    if (v8 != 1)
    {
      unint64_t v12 = a3 + v8;
      return (v12 - 1) / v8;
    }
  }
  return a3;
}

- (unint64_t)resultSizeFromSourceSizes:(id)a3 dimension:(unint64_t)a4
{
  unint64_t v6 = [a3 objectAtIndexedSubscript:a4];
  unint64_t v7 = -[MLCLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", [v6 unsignedIntegerValue], a4);

  return v7;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v7 = [v4 objectAtIndexedSubscript:0];
    unint64_t v8 = [v7 descriptor];
    unint64_t v9 = [v8 shape];
    unint64_t v10 = [v9 count];

    if (i >= v10) {
      break;
    }
    uint64_t v11 = i;
    if (i == 2)
    {
      unint64_t v12 = [v4 objectAtIndexedSubscript:0];
      long long v13 = [v12 descriptor];
      long long v14 = [v13 shape];
      uint64_t v15 = [v14 count];

      if (v15 == 3) {
        uint64_t v11 = 3;
      }
      else {
        uint64_t v11 = 2;
      }
    }
    uint64_t v16 = [v4 objectAtIndexedSubscript:0];
    v17 = [v16 descriptor];
    uint64_t v18 = [v17 shape];
    v19 = [v18 objectAtIndexedSubscript:i];
    unint64_t v20 = -[MLCLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", [v19 unsignedIntegerValue], v11);

    uint64_t v21 = [NSNumber numberWithUnsignedInteger:v20];
    [v5 setObject:v21 atIndexedSubscript:i];
  }
  v22 = (void *)[v5 copy];
  v23 = [v4 objectAtIndexedSubscript:0];
  uint64_t v24 = [v23 descriptor];
  v25 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v22, [v24 dataType]);

  v26 = +[MLCTensor tensorWithDescriptor:v25];

  return v26;
}

- (id)resultTensorsFromBroadcastableSources:(id)a3 resultTensorDataType:(int)a4
{
  id v5 = a3;
  unint64_t v6 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  unint64_t v7 = [v5 objectAtIndexedSubscript:0];
  unint64_t v8 = [v7 descriptor];
  unint64_t v9 = [v8 shape];
  unint64_t v89 = [v9 count];

  unsigned int v85 = a4;
  if ((unint64_t)[v5 count] >= 2)
  {
    unint64_t v10 = [v5 objectAtIndexedSubscript:1];
    uint64_t v11 = [v10 descriptor];
    unint64_t v12 = [v11 shape];
    unint64_t v13 = [v12 count];

    if (v13 > v89)
    {
      long long v14 = [v5 objectAtIndexedSubscript:1];
      uint64_t v15 = [v14 descriptor];
      uint64_t v16 = [v15 shape];
      unint64_t v89 = [v16 count];
    }
  }
  if ([v5 count] != 1)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
    v25 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v26 = (void *)[v24 mutableCopy];
    v27 = [v5 objectAtIndexedSubscript:0];
    objc_super v28 = [v27 descriptor];
    v29 = [v28 shape];
    uint64_t v30 = [v29 count];

    v31 = [v5 objectAtIndexedSubscript:0];
    v32 = [v31 descriptor];
    v33 = [v32 shape];
    v34 = v33;
    v88 = v5;
    v84 = v6;
    if (v89 == v30)
    {
      uint64_t v35 = [v33 copy];

      v25 = (void *)v35;
    }
    else
    {
      uint64_t v36 = [v33 count];

      if (v89)
      {
        unint64_t v37 = 0;
        unint64_t v38 = v89 - v36;
        unint64_t v86 = v36 - v89;
        unint64_t v39 = 0x1E4F28000uLL;
        do
        {
          if (v37 >= v38)
          {
            [v5 objectAtIndexedSubscript:0];
            v41 = v26;
            unint64_t v42 = v38;
            v43 = v25;
            v45 = unint64_t v44 = v39;
            v46 = [v45 descriptor];
            v47 = [v46 shape];
            v48 = [v47 objectAtIndexedSubscript:v86 + v37];
            uint64_t v40 = [v48 unsignedIntegerValue];

            id v5 = v88;
            unint64_t v39 = v44;
            v25 = v43;
            unint64_t v38 = v42;
            v26 = v41;
          }
          else
          {
            uint64_t v40 = 1;
          }
          v49 = [*(id *)(v39 + 3792) numberWithUnsignedInteger:v40];
          [v25 setObject:v49 atIndexedSubscript:v37];

          ++v37;
        }
        while (v89 != v37);
      }
    }
    v50 = [v5 objectAtIndexedSubscript:1];
    v51 = [v50 descriptor];
    v52 = [v51 shape];
    uint64_t v53 = [v52 count];

    id v5 = v88;
    v54 = [v88 objectAtIndexedSubscript:1];
    v55 = [v54 descriptor];
    v56 = [v55 shape];
    v57 = v56;
    if (v89 == v53)
    {
      uint64_t v58 = [v56 copy];

      v26 = (void *)v58;
    }
    else
    {
      uint64_t v59 = [v56 count];

      if (!v89) {
        goto LABEL_32;
      }
      unint64_t v60 = 0;
      unint64_t v61 = v89 - v59;
      unint64_t v87 = v59 - v89;
      unint64_t v62 = 0x1E4F28000uLL;
      do
      {
        if (v60 >= v61)
        {
          v64 = [v5 objectAtIndexedSubscript:1];
          v65 = [v64 descriptor];
          [v65 shape];
          v67 = unint64_t v66 = v62;
          v68 = [v67 objectAtIndexedSubscript:v87 + v60];
          uint64_t v63 = [v68 unsignedIntegerValue];

          unint64_t v62 = v66;
          id v5 = v88;
        }
        else
        {
          uint64_t v63 = 1;
        }
        v69 = [*(id *)(v62 + 3792) numberWithUnsignedInteger:v63];
        [v26 setObject:v69 atIndexedSubscript:v60];

        ++v60;
      }
      while (v89 != v60);
    }
    if (v89)
    {
      uint64_t v70 = 0;
      unint64_t v6 = v84;
      do
      {
        v71 = [v25 objectAtIndexedSubscript:v70];
        unint64_t v72 = [v71 unsignedIntegerValue];
        v73 = [v26 objectAtIndexedSubscript:v70];
        unint64_t v74 = [v73 unsignedIntegerValue];

        v75 = NSNumber;
        if (v72 >= v74) {
          v76 = v25;
        }
        else {
          v76 = v26;
        }
        v77 = [v76 objectAtIndexedSubscript:v70];
        v78 = objc_msgSend(v75, "numberWithUnsignedInteger:", objc_msgSend(v77, "unsignedIntegerValue"));
        [v84 setObject:v78 atIndexedSubscript:v70];

        ++v70;
      }
      while (v89 != v70);
      id v5 = v88;
      goto LABEL_33;
    }
LABEL_32:
    unint64_t v6 = v84;
LABEL_33:

    goto LABEL_34;
  }
  if (v89)
  {
    for (uint64_t i = 0; i != v89; ++i)
    {
      uint64_t v18 = [v5 objectAtIndexedSubscript:0];
      v19 = [v18 descriptor];
      unint64_t v20 = [v19 shape];
      uint64_t v21 = [v20 objectAtIndexedSubscript:i];
      uint64_t v22 = [v21 unsignedIntegerValue];

      v23 = [NSNumber numberWithUnsignedInteger:v22];
      [v6 setObject:v23 atIndexedSubscript:i];
    }
  }
LABEL_34:
  v79 = v5;
  v80 = (void *)[v6 copy];
  v81 = +[MLCTensorDescriptor descriptorWithShape:v80 dataType:v85];

  v82 = +[MLCTensor tensorWithDescriptor:v81];

  return v82;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  return 0;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  return 0;
}

- (unint64_t)deviceMemorySizeWithOptimizer:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MLCLayer *)self skipLayer])
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
LABEL_25:
    unint64_t v42 = 0;
    goto LABEL_26;
  }
  unint64_t v10 = [(MLCLayer *)self resultTensors];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    uint64_t v8 = 0;
    do
    {
      unint64_t v13 = [(MLCLayer *)self resultTensors];
      long long v14 = [v13 objectAtIndexedSubscript:v12];
      uint64_t v15 = [v14 sharedMemoryTensor];

      if (!v15)
      {
        uint64_t v16 = [v7 computeEngine];
        v17 = [(MLCLayer *)self resultTensors];
        uint64_t v18 = [v17 objectAtIndexedSubscript:v12];
        v8 += [v16 deviceMemorySizeForTensor:v18];
      }
      ++v12;
      v19 = [(MLCLayer *)self resultTensors];
      unint64_t v20 = [v19 count];
    }
    while (v12 < v20);
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (![(MLCLayer *)self isTrainable]) {
    goto LABEL_22;
  }
  uint64_t v21 = [(MLCLayer *)self intermediateGradientTensors];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    v23 = [(MLCLayer *)self intermediateGradientTensors];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      unint64_t v25 = 0;
      uint64_t v9 = 0;
      do
      {
        v26 = [v7 computeEngine];
        v27 = [(MLCLayer *)self intermediateGradientTensors];
        objc_super v28 = [v27 objectAtIndexedSubscript:v25];
        v9 += [v26 deviceMemorySizeForTensor:v28];

        ++v25;
        v29 = [(MLCLayer *)self intermediateGradientTensors];
        unint64_t v30 = [v29 count];
      }
      while (v25 < v30);
      goto LABEL_23;
    }
LABEL_22:
    uint64_t v9 = 0;
    goto LABEL_23;
  }
  v31 = [(MLCLayer *)self sourceGradientTensors];
  uint64_t v32 = [v31 count];

  if (!v32) {
    goto LABEL_22;
  }
  unint64_t v33 = 0;
  uint64_t v9 = 0;
  do
  {
    v34 = [(MLCLayer *)self sourceGradientTensors];
    uint64_t v35 = [v34 objectAtIndexedSubscript:v33];
    uint64_t v36 = [v35 sharedMemoryTensor];

    if (!v36)
    {
      unint64_t v37 = [v7 computeEngine];
      unint64_t v38 = [(MLCLayer *)self sourceGradientTensors];
      unint64_t v39 = [v38 objectAtIndexedSubscript:v33];
      v9 += [v37 deviceMemorySizeForTensor:v39];
    }
    ++v33;
    uint64_t v40 = [(MLCLayer *)self sourceGradientTensors];
    unint64_t v41 = [v40 count];
  }
  while (v33 < v41);
LABEL_23:
  if (![(MLCLayer *)self isUpdatable]) {
    goto LABEL_25;
  }
  unint64_t v42 = [(MLCLayer *)self allocatedDataSizeForTraining:[(MLCLayer *)self isTrainable] optimizer:v6];
LABEL_26:
  unint64_t v43 = v9 + v8 + v42;

  return v43;
}

- (unint64_t)deviceMemorySizeForForward
{
  if ([(MLCLayer *)self skipLayer]) {
    return 0;
  }
  id v4 = [(MLCLayer *)self resultTensors];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [(MLCLayer *)self resultTensors];
      uint64_t v9 = [v8 objectAtIndexedSubscript:v6];
      unint64_t v10 = [v9 sharedMemoryTensor];

      if (!v10)
      {
        uint64_t v11 = [(MLCLayer *)self device];
        unint64_t v12 = [v11 computeEngine];
        unint64_t v13 = [(MLCLayer *)self resultTensors];
        long long v14 = [v13 objectAtIndexedSubscript:v6];
        v7 += [v12 deviceMemorySizeForTensor:v14];
      }
      ++v6;
      uint64_t v15 = [(MLCLayer *)self resultTensors];
      unint64_t v16 = [v15 count];
    }
    while (v6 < v16);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return [(MLCLayer *)self allocatedDataSizeForTraining:0 optimizer:0]
       + v7;
}

- (NSString)description
{
  unint64_t v16 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(MLCLayer *)self device];
  unint64_t v6 = [(MLCLayer *)self sourceTensors];
  NSUInteger v7 = [(MLCLayer *)self layerID];
  uint64_t v8 = [(MLCLayer *)self label];
  BOOL v9 = [(MLCLayer *)self isFirstLayer];
  BOOL v10 = [(MLCLayer *)self isLastLayer];
  BOOL v11 = [(MLCLayer *)self skipLayer];
  unint64_t v12 = [(MLCLayer *)self conditionalTreeNode];
  unint64_t v13 = [(MLCLayer *)self resultTensors];
  long long v14 = [v16 stringWithFormat:@"%@: { device=%@ : sourceTensors=%@ : layerID=%lu : label=%@ : isFirstLayer=%d : isLastLayer=%d : skipLayer=%d : conditionalTreeNode=%@ : resultTensor=%@ }", v4, v5, v6, v7, v8, v9, v10, v11, v12, v13];

  return (NSString *)v14;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  return 0;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5
{
  return 0;
}

- (id)getDeviceForTraining
{
  id v4 = [(MLCLayer *)self device];

  if (!v4)
  {
    uint64_t v5 = +[MLCLog framework];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MLCLayer getDeviceForTraining](a2);
    }
  }
  unint64_t v6 = [(MLCLayer *)self device];

  return v6;
}

- (id)getDeviceForInference
{
  id v4 = [(MLCLayer *)self device];

  if (!v4)
  {
    uint64_t v5 = +[MLCLog framework];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MLCLayer getDeviceForInference](a2);
    }
  }
  unint64_t v6 = [(MLCLayer *)self device];

  return v6;
}

- (void)setBatchSize:(unint64_t)a3
{
  id v3 = self;
  unint64_t v4 = 0xFFFFFFFFLL;
  if (a3) {
    unint64_t v4 = a3;
  }
  uint64_t v5 = [(MLCLayer *)self sourceTensors];
  unint64_t v6 = [v5 count];

  v103 = v3;
  if (v6 < 2)
  {
    unint64_t v18 = 0;
  }
  else
  {
    unint64_t v7 = 0;
    unint64_t v8 = 1;
    do
    {
      BOOL v9 = [(MLCLayer *)v3 sourceTensors];
      unint64_t v104 = v7;
      BOOL v10 = [v9 objectAtIndexedSubscript:v7];
      BOOL v11 = [v10 descriptor];
      unint64_t v12 = [v11 shape];
      unint64_t v106 = [v12 count];
      unint64_t v13 = [(MLCLayer *)v3 sourceTensors];
      long long v14 = [v13 objectAtIndexedSubscript:v8];
      uint64_t v15 = [v14 descriptor];
      unint64_t v16 = [v15 shape];
      unint64_t v17 = [v16 count];

      id v3 = v103;
      unint64_t v18 = v8;
      if (v106 >= v17)
      {
        v19 = [(MLCLayer *)v103 sourceTensors];
        unint64_t v20 = [v19 objectAtIndexedSubscript:v104];
        uint64_t v21 = [v20 descriptor];
        uint64_t v22 = [v21 shape];
        uint64_t v107 = [v22 count];
        v23 = [(MLCLayer *)v103 sourceTensors];
        uint64_t v24 = [v23 objectAtIndexedSubscript:v8];
        unint64_t v25 = [v24 descriptor];
        v26 = [v25 shape];
        uint64_t v27 = [v26 count];

        if (v107 == v27)
        {
          id v3 = v103;
          objc_super v28 = [(MLCLayer *)v103 sourceTensors];
          v29 = [v28 objectAtIndexedSubscript:v104];
          unint64_t v30 = [v29 descriptor];
          v31 = [v30 shape];
          uint64_t v32 = [v31 objectAtIndexedSubscript:0];
          unint64_t v33 = [v32 unsignedIntegerValue];

          v34 = [(MLCLayer *)v103 sourceTensors];
          uint64_t v35 = [v34 objectAtIndexedSubscript:v8];
          uint64_t v36 = [v35 descriptor];
          unint64_t v37 = [v36 shape];
          unint64_t v38 = [v37 objectAtIndexedSubscript:0];
          unint64_t v39 = [v38 unsignedIntegerValue];

          if (v33 >= v39) {
            unint64_t v18 = v104;
          }
          else {
            unint64_t v18 = v8;
          }
        }
        else
        {
          id v3 = v103;
          unint64_t v18 = v104;
        }
      }
      ++v8;
      uint64_t v40 = [(MLCLayer *)v3 sourceTensors];
      unint64_t v41 = [v40 count];

      unint64_t v7 = v18;
    }
    while (v8 < v41);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    unint64_t v18 = 0;
  }
  unint64_t v42 = [(MLCLayer *)v3 sourceTensors];
  uint64_t v43 = [v42 count];

  unint64_t v44 = v102;
  unint64_t v45 = v102;
  if (v43)
  {
    v46 = [(MLCLayer *)v3 sourceTensors];
    v47 = [v46 objectAtIndexedSubscript:v18];
    v48 = [v47 descriptor];
    v49 = [v48 shape];
    if ([v49 count] == 1)
    {

      unint64_t v45 = 1;
    }
    else
    {
      v50 = [(MLCLayer *)v3 sourceTensors];
      v51 = [v50 objectAtIndexedSubscript:v18];
      v52 = [v51 descriptor];
      uint64_t v53 = [v52 shape];
      v54 = [v53 objectAtIndexedSubscript:0];
      uint64_t v108 = [v54 unsignedIntegerValue];

      if (v108 == 1)
      {
        unint64_t v45 = 1;
        unint64_t v44 = v102;
        id v3 = v103;
      }
      else
      {
        id v3 = v103;
        v55 = [(MLCLayer *)v103 sourceTensors];
        v56 = [v55 objectAtIndexedSubscript:v18];
        v57 = [v56 descriptor];
        uint64_t v58 = [v57 shape];
        uint64_t v59 = [v58 objectAtIndexedSubscript:0];
        unint64_t v60 = [v59 unsignedIntegerValue];

        unint64_t v44 = v102;
        if (v60 >= v102) {
          unint64_t v45 = v102;
        }
        else {
          unint64_t v45 = v60;
        }
      }
    }
  }
  unint64_t v61 = [(MLCLayer *)v3 device];
  unint64_t v62 = [v61 computeEngine];
  unint64_t v63 = [v62 numDevices];

  uint64_t v64 = 1;
  if (v45 != 1) {
    uint64_t v64 = v45 / v63;
  }
  if (v63 >= 2) {
    unint64_t v65 = v64;
  }
  else {
    unint64_t v65 = v45;
  }
  unint64_t v66 = [(MLCLayer *)v3 deviceOps];
  uint64_t v67 = [v66 count];

  if (v67)
  {
    unint64_t v68 = 0;
    do
    {
      v69 = [(MLCLayer *)v3 deviceOps];
      uint64_t v70 = [v69 objectAtIndexedSubscript:v68];
      [v70 setBatchSize:v65];

      ++v68;
      v71 = [(MLCLayer *)v3 deviceOps];
      unint64_t v72 = [v71 count];
    }
    while (v68 < v72);
  }
  v73 = [(MLCLayer *)v3 intermediateSumLayer];

  if (v73)
  {
    unint64_t v74 = [(MLCLayer *)v3 resultTensors];
    uint64_t v75 = [v74 count];

    if (v75)
    {
      unint64_t v105 = v63;
      unint64_t v76 = 0;
      while (1)
      {
        v77 = [(MLCLayer *)v3 resultTensors];
        v78 = [v77 objectAtIndexedSubscript:v76];
        v79 = [v78 descriptor];
        v80 = [v79 shape];
        if ([v80 count] == 1)
        {
        }
        else
        {
          v81 = [(MLCLayer *)v3 resultTensors];
          v82 = [v81 objectAtIndexedSubscript:v76];
          v83 = [v82 descriptor];
          v84 = [v83 shape];
          unsigned int v85 = [v84 objectAtIndexedSubscript:0];
          uint64_t v109 = [v85 unsignedIntegerValue];

          id v3 = v103;
          if (v109 != 1)
          {
            v88 = [(MLCLayer *)v103 resultTensors];
            unint64_t v89 = [v88 objectAtIndexedSubscript:v76];
            v90 = [v89 descriptor];
            v91 = [v90 shape];
            v92 = [v91 objectAtIndexedSubscript:0];
            unint64_t v93 = [v92 unsignedIntegerValue];

            unint64_t v44 = v102;
            if (v93 < v102) {
              unint64_t v44 = v93;
            }
            unint64_t v63 = v105;
            break;
          }
        }
        ++v76;
        unint64_t v86 = [(MLCLayer *)v3 resultTensors];
        unint64_t v87 = [v86 count];

        if (v76 >= v87)
        {
          unint64_t v44 = 1;
          goto LABEL_47;
        }
      }
    }
    if (v63 >= 2 && v44 != 1) {
      v44 /= v63;
    }
LABEL_47:
    v94 = [(MLCLayer *)v3 deviceOps];
    uint64_t v95 = [v94 count];

    if (v95)
    {
      unint64_t v96 = 0;
      do
      {
        v97 = [(MLCLayer *)v3 intermediateSumLayer];
        v98 = [v97 deviceOps];
        v99 = [v98 objectAtIndexedSubscript:v96];
        [v99 setBatchSize:v44];

        ++v96;
        v100 = [(MLCLayer *)v3 deviceOps];
        unint64_t v101 = [v100 count];
      }
      while (v96 < v101);
    }
  }
}

- (void)setIsDebuggingEnabled:(BOOL)isDebuggingEnabled
{
}

- (void)setIsDebuggingEnabled:(BOOL)a3 isPrivate:(BOOL)a4
{
  unint64_t v8 = [(MLCLayer *)self device];

  if (v8)
  {
    if (!a4)
    {
      BOOL v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MLCLayer setIsDebuggingEnabled:isPrivate:](a2);
      }
    }
  }
  else
  {
    self->_isDebuggingEnabled = a3;
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
      uint64_t v5 = [v3 objectAtIndexedSubscript:v4];
      unint64_t v6 = [v5 descriptor];
      unint64_t v7 = [v6 shape];
      unint64_t v8 = [v7 count];

      BOOL v9 = v8 > 2;
      if (v8 <= 2) {
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

- (BOOL)isValidTrainingParameters
{
  return 1;
}

- (BOOL)isStaticBatchSize
{
  return 1;
}

- (BOOL)isGradientNeededForTensor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MLCLayer *)self sourceTensors];
  unint64_t v6 = (void *)[v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      unint64_t v6 = [(MLCLayer *)self sourceTensors];
      id v8 = [v6 objectAtIndexedSubscript:v7];

      LOBYTE(v6) = v8 == v4;
      if (v8 == v4) {
        break;
      }
      ++v7;
      BOOL v9 = [(MLCLayer *)self sourceTensors];
      unint64_t v10 = [v9 count];
    }
    while (v7 < v10);
  }

  return (char)v6;
}

- (BOOL)isTensorSharedAcrossMultipleTrainingLayers:(id)a3
{
  id v3 = a3;
  id v4 = [v3 childLayers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      id v8 = [v3 childLayers];
      BOOL v9 = [v8 objectAtIndexedSubscript:v6];
      int v10 = [v9 compileForInferenceOnly];

      v7 += v10 ^ 1u;
      ++v6;
      BOOL v11 = [v3 childLayers];
      unint64_t v12 = [v11 count];
    }
    while (v6 < v12);
    BOOL v13 = v7 > 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (NSString)summarizedDOTDescription
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [v3 stringWithFormat:@"<%@ (%lu)>", v5, -[MLCLayer layerID](self, "layerID")];

  return (NSString *)v6;
}

+ (BOOL)supportsDataType:(MLCDataType)dataType onDevice:(MLCDevice *)device
{
  unint64_t v6 = device;
  if ([a1 isEqual:objc_opt_class()])
  {
    BOOL v7 = 0;
  }
  else if ([(MLCDevice *)v6 type] == MLCDeviceTypeANE)
  {
    BOOL v7 = ((dataType - 1) & 0xFFFFFFFD) == 0;
  }
  else
  {
    BOOL v7 = dataType == MLCDataTypeFloat32;
  }

  return v7;
}

- (unint64_t)parametersCount
{
  return 0;
}

- (MLCDeviceType)deviceType
{
  id v3 = [(MLCLayer *)self device];

  if (!v3) {
    return 0x7FFFFFFF;
  }
  id v4 = [(MLCLayer *)self device];
  MLCDeviceType v5 = [v4 actualDeviceType];

  return v5;
}

- (NSNumber)key
{
  return (NSNumber *)[NSNumber numberWithUnsignedLong:self];
}

- (NSUInteger)layerID
{
  return self->_layerID;
}

- (void)setLayerID:(unint64_t)a3
{
  self->_layerID = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
}

- (BOOL)isDebuggingEnabled
{
  return self->_isDebuggingEnabled;
}

- (NSString)originalLabel
{
  return self->_originalLabel;
}

- (unint64_t)kernelWidth
{
  return self->_kernelWidth;
}

- (void)setKernelWidth:(unint64_t)a3
{
  self->_kernelWidth = a3;
}

- (unint64_t)kernelHeight
{
  return self->_kernelHeight;
}

- (void)setKernelHeight:(unint64_t)a3
{
  self->_kernelHeight = a3;
}

- (unint64_t)dilationRateInX
{
  return self->_dilationRateInX;
}

- (void)setDilationRateInX:(unint64_t)a3
{
  self->_dilationRateInX = a3;
}

- (unint64_t)dilationRateInY
{
  return self->_dilationRateInY;
}

- (void)setDilationRateInY:(unint64_t)a3
{
  self->_dilationRateInY = a3;
}

- (unint64_t)strideInX
{
  return self->_strideInX;
}

- (void)setStrideInX:(unint64_t)a3
{
  self->_strideInX = a3;
}

- (unint64_t)strideInY
{
  return self->_strideInY;
}

- (void)setStrideInY:(unint64_t)a3
{
  self->_strideInY = a3;
}

- (unint64_t)paddingSizeInX
{
  return self->_paddingSizeInX;
}

- (void)setPaddingSizeInX:(unint64_t)a3
{
  self->_paddingSizeInX = a3;
}

- (unint64_t)paddingSizeInY
{
  return self->_paddingSizeInY;
}

- (void)setPaddingSizeInY:(unint64_t)a3
{
  self->_paddingSizeInY = a3;
}

- (MLCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSArray)deviceOps
{
  return self->_deviceOps;
}

- (void)setDeviceOps:(id)a3
{
}

- (BOOL)skipLayer
{
  return self->_skipLayer;
}

- (void)setSkipLayer:(BOOL)a3
{
  self->_skipLayer = a3;
}

- (BOOL)allocateGradientTensors
{
  return self->_allocateGradientTensors;
}

- (void)setAllocateGradientTensors:(BOOL)a3
{
  self->_allocateGradientTensors = a3;
}

- (BOOL)isLastFusedLayer
{
  return self->_isLastFusedLayer;
}

- (void)setIsLastFusedLayer:(BOOL)a3
{
  self->_isLastFusedLayer = a3;
}

- (BOOL)disableUpdate
{
  return self->_disableUpdate;
}

- (void)setDisableUpdate:(BOOL)a3
{
  self->_disableUpdate = a3;
}

- (BOOL)isUpdatable
{
  return self->_isUpdatable;
}

- (void)setIsUpdatable:(BOOL)a3
{
  self->_isUpdatable = a3;
}

- (BOOL)isTrainable
{
  return self->_isTrainable;
}

- (void)setIsTrainable:(BOOL)a3
{
  self->_isTrainable = a3;
}

- (NSMutableArray)sourceTensors
{
  return self->_sourceTensors;
}

- (void)setSourceTensors:(id)a3
{
}

- (NSMutableArray)resultTensors
{
  return self->_resultTensors;
}

- (void)setResultTensors:(id)a3
{
}

- (NSMutableArray)sourceGradientTensors
{
  return self->_sourceGradientTensors;
}

- (void)setSourceGradientTensors:(id)a3
{
}

- (NSMutableArray)resultGradientTensors
{
  return self->_resultGradientTensors;
}

- (void)setResultGradientTensors:(id)a3
{
}

- (NSMutableArray)fusedLayers
{
  return self->_fusedLayers;
}

- (MLCLayer)intermediateSumLayer
{
  return self->_intermediateSumLayer;
}

- (void)setIntermediateSumLayer:(id)a3
{
}

- (NSMutableArray)intermediateGradientTensors
{
  return self->_intermediateGradientTensors;
}

- (void)setIntermediateGradientTensors:(id)a3
{
}

- (unint64_t)intermediateGradientTensorIndex
{
  return self->_intermediateGradientTensorIndex;
}

- (void)setIntermediateGradientTensorIndex:(unint64_t)a3
{
  self->_intermediateGradientTensorIndex = a3;
}

- (BOOL)zeroIntermediateGradientTensors
{
  return self->_zeroIntermediateGradientTensors;
}

- (void)setZeroIntermediateGradientTensors:(BOOL)a3
{
  self->_zeroIntermediateGradientTensors = a3;
}

- (BOOL)compileForInferenceOnly
{
  return self->_compileForInferenceOnly;
}

- (void)setCompileForInferenceOnly:(BOOL)a3
{
  self->_compileForInferenceOnly = a3;
}

- (MLCControlTreeNode)conditionalTreeNode
{
  return self->_conditionalTreeNode;
}

- (void)setConditionalTreeNode:(id)a3
{
}

- (int)paddingPolicy
{
  return self->_paddingPolicy;
}

- (void)setPaddingPolicy:(int)a3
{
  self->_paddingPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionalTreeNode, 0);
  objc_storeStrong((id *)&self->_intermediateGradientTensors, 0);
  objc_storeStrong((id *)&self->_intermediateSumLayer, 0);
  objc_storeStrong((id *)&self->_fusedLayers, 0);
  objc_storeStrong((id *)&self->_resultGradientTensors, 0);
  objc_storeStrong((id *)&self->_sourceGradientTensors, 0);
  objc_storeStrong((id *)&self->_resultTensors, 0);
  objc_storeStrong((id *)&self->_sourceTensors, 0);
  objc_storeStrong((id *)&self->_deviceOps, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_originalLabel, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (void)getDeviceForTraining
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: no device specified.  The training graph that this layer is associated with may not have been compiled", v4, v5, v6, v7, 2u);
}

- (void)getDeviceForInference
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: no device specified.  The inference graph that this layer is associated with may not have been compiled", v4, v5, v6, v7, 2u);
}

- (void)setIsDebuggingEnabled:(const char *)a1 isPrivate:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: isDebuggingEnabled cannot be set once layer has been compiled", v4, v5, v6, v7, 2u);
}

@end