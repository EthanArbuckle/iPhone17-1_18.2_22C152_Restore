@interface MLCDeviceANE
+ (BOOL)hasANE;
- (BOOL)allocateDeviceMemoryForSourceAndResultTensorsOfLayer:(id)a3 tensorLabelToIOSurfaceMap:(id *)a4;
- (BOOL)compileLayerDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)compileOptimizerDeviceOps:(id)a3;
- (BOOL)needToAllocateDeviceMemoryForTensor:(id)a3;
- (BOOL)postProcessCompiledGraph:(id)a3 compilerOptions:(unint64_t)a4;
- (BOOL)procedureInformationWithModelAttributes:(id)a3 procedureName:(id)a4 procedureID:(unint64_t *)a5 procedureInputSymbols:(id *)a6 procedureInputSymbolIndices:(id *)a7 procedureOutputSymbols:(id *)a8 procedureOutputSymbolIndices:(id *)a9;
- (BOOL)setConvolutionLayerOptimizerDataForDeviceOps:(id)a3 weights:(id)a4 bias:(id)a5;
- (BOOL)setLSTMLayerOptimizerDataForDeviceOps:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 biasTerms:(id)a6;
- (BOOL)setMHALayerOptimizerDataForDeviceOps:(id)a3 optimizerDataForWeights:(id)a4 optimizerDataForBias:(id)a5;
- (BOOL)setNormalizationLayerOptimizerDataForDeviceOps:(id)a3 beta:(id)a4 gamma:(id)a5;
- (BOOL)shareDeviceMemoryWithResultTensor:(id)a3 sourceTensor:(id)a4;
- (BOOL)synchronizeTensor:(id)a3;
- (BOOL)transferTensor:(id)a3 fromDevice:(id)a4;
- (BOOL)updateDeviceMemoryForTensor:(id)a3;
- (BOOL)updateTensorsForFusedLayers:(id)a3 ofInferenceGraph:(id)a4;
- (MLCDeviceANE)initWithType:(int)a3;
- (NSArray)deviceList;
- (NSString)description;
- (id)ANERequestWithModelAttributes:(id)a3 procedureName:(id)a4 tensorLabelToIOSurfaceMap:(id)a5;
- (id)arithmeticLayerWithOperation:(int)a3 activationDescriptor:(id)a4;
- (id)batchNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9;
- (id)compareLayerWithOperation:(int)a3;
- (id)concatLayerWithConcatDimension:(unint64_t)a3 sourceShapeCount:(unint64_t)a4;
- (id)convolutionLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5;
- (id)convolutionTransposeLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createOptimizerDeviceDataForTensor:(id)a3 optimizer:(id)a4 optimizerData:(id)a5 isVector:(BOOL)a6;
- (id)dropoutLayerWithRate:(float)a3 seed:(unint64_t)a4;
- (id)fullyConnectedLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5;
- (id)fusedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10;
- (id)fusedConvolutionAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6;
- (id)fusedConvolutionBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9 neuronDescriptor:(id)a10 weights:(id)a11 biasTerms:(id)a12;
- (id)fusedFullyConnectedAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6;
- (id)fusedFullyConnectedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9 neuronDescriptor:(id)a10 weights:(id)a11 biasTerms:(id)a12;
- (id)getHostPointerIfUnifiedDeviceMemory:(id)a3;
- (id)gramMatrixLayerWithScaleFactor:(float)a3;
- (id)groupNormalizationLayerWithFeatureChannelCount:(unint64_t)a3 groupCount:(unint64_t)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7;
- (id)imageReshapeWithWidth:(unint64_t)a3 height:(unint64_t)a4 alignCorners:(BOOL)a5;
- (id)instanceNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9;
- (id)layerNormalizationLayerWithNormalizedShape:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6 isFusedWithArithmeticLayer:(BOOL)a7;
- (id)lossLayerWithDescriptor:(id)a3;
- (id)lossYOLOLayerWithDescriptor:(id)a3;
- (id)lstmLayerWithDescriptor:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 peepholeWeights:(id)a6 biasTerms:(id)a7 gateActivations:(id)a8 outputResultActivation:(id)a9 inferenceOnly:(BOOL)a10;
- (id)matMulLayerWithDescriptor:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 inferenceOnly:(BOOL)a6;
- (id)multiheadAttentionLayerWithDescriptor:(id)a3 weights:(id)a4 bias:(id)a5 attnBias:(id)a6 inferenceOnly:(BOOL)a7;
- (id)neuronLayerWithDescriptor:(id)a3;
- (id)optimizerAdamWithDescriptor:(id)a3 beta1:(double)a4 beta2:(double)a5 epsilon:(float)a6 amsgrad:(BOOL)a7 timeStep:(unint64_t)a8 isAdamW:(BOOL)a9;
- (id)optimizerRMSPropWithDescriptor:(id)a3 momentumScale:(float)a4 alpha:(float)a5 epsilon:(float)a6 centered:(BOOL)a7;
- (id)optimizerSGDWithDescriptor:(id)a3 momentunScale:(float)a4 useNesterovMomentum:(BOOL)a5;
- (id)paddingLayerWithPaddingType:(int)a3 paddingLeft:(unint64_t)a4 paddingRight:(unint64_t)a5 paddingTop:(unint64_t)a6 paddingBottom:(unint64_t)a7 constantValue:(float)a8 dataType:(int)a9;
- (id)partitionInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4 aneDevice:(id)a5 secondaryDevice:(id)a6;
- (id)partitionInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4 aneDevice:(id)a5 secondaryDevice:(id)a6 configurationJSON:(id)a7;
- (id)poolingLayerWithDescriptor:(id)a3 paddingSizes:(unint64_t *)a4;
- (id)readTensor:(id)a3;
- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4;
- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 batchSize:(unint64_t)a5;
- (id)reductionLayerWithReduceType:(int)a3 dimensions:(id)a4 sourceShapeCount:(unint64_t)a5;
- (id)sliceLayerWithbegin:(id)a3 end:(id)a4 stride:(id)a5 inferenceOnly:(BOOL)a6;
- (id)softmaxLayerWithOperation:(int)a3 dimension:(unint64_t)a4 sourceShapeCount:(unint64_t)a5;
- (id)transposeLayerWithShape:(id)a3;
- (id)upsampleLayerWithScaleFactorX:(float)a3 scaleFactorY:(float)a4 sampleMode:(int)a5 alignCorners:(BOOL)a6;
- (int)deviceType;
- (unint64_t)allocatedDeviceDataSizeForTraining:(BOOL)a3 layer:(id)a4;
- (unint64_t)deviceMemorySizeForTensor:(id)a3;
- (unint64_t)deviceMemorySizeForTensor:(id)a3 interleave:(unint64_t *)a4;
- (unint64_t)numDevices;
- (unint64_t)numberOfDevices;
- (void)accumulateParams:(void *)a3 gradients:(void *)a4 accumulators:(void *)a5 numOfParameters:(unint64_t)a6 inArrayOfParams:(id)a7;
- (void)allocateDeviceDataForGlobalNormClippingWithOptimizer:(id)a3 updatableParameterCount:(unint64_t)a4;
- (void)allocateDeviceMemoryForTensor:(id)a3;
- (void)broadcastTensor:(id)a3;
- (void)broadcastTensor:(id)a3 batchSize:(unint64_t)a4;
- (void)commitAndWaitForCompletion:(id)a3;
- (void)commitAndWaitForCompletion:(id)a3 enableProfiling:(BOOL)a4 graphExecutionTime:(id)a5 graphResultTensor:(id)a6;
- (void)commitWithProfiling:(BOOL)a3 graphExecutionTime:(id)a4;
- (void)convertUpdatesToTensorDataForLayer:(id)a3;
- (void)convertUpdatesToTensorDataForTensorParameters:(id)a3;
- (void)deallocateDeviceMemoryForTensor:(id)a3;
- (void)dispatchForwardAndGradientLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultGradientTensor:(id)a9;
- (void)dispatchForwardCompareLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 resultTensor:(id)a6 compareOp:(int)a7 forTraining:(BOOL)a8;
- (void)dispatchForwardConcatLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (void)dispatchForwardEmbeddingLayer:(id)a3 weight:(id)a4 sourceTensor:(id)a5 resultTensor:(id)a6;
- (void)dispatchForwardFullyConnectedLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6;
- (void)dispatchForwardFusedArithmeticLayerNormalizationLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6;
- (void)dispatchForwardGatherLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6;
- (void)dispatchForwardLayer:(id)a3;
- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 tertiaryTensor:(id)a6 resultTensor:(id)a7 resultStateIsTemporary:(BOOL)a8 forTraining:(BOOL)a9;
- (void)dispatchForwardLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultStateIsTemporary:(BOOL)a9 forTraining:(BOOL)a10;
- (void)dispatchForwardMHALayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardMatMulLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (void)dispatchForwardReduceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7 forTraining:(BOOL)a8;
- (void)dispatchForwardReshapeLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardScatterLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6;
- (void)dispatchForwardSelectLayer:(id)a3 conditionTensor:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardSliceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6;
- (void)dispatchForwardSplitLayer:(id)a3 sourceTensor:(id)a4 resultTensors:(id)a5;
- (void)dispatchGradientConcatLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5;
- (void)dispatchGradientEmbeddingLayer:(id)a3 sourceGradientTensor:(id)a4;
- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5;
- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 secondaryResultGradientTensor:(id)a6;
- (void)dispatchGradientLossLayer:(id)a3 sourceGradientTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultGradientTensor:(id)a8;
- (void)dispatchGradientMHALayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5 resultStateIsTemporary:(BOOL)a6;
- (void)dispatchGradientMatMulLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5;
- (void)dispatchGradientReduceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7;
- (void)dispatchGradientReshapeLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5;
- (void)dispatchGradientSelectLayer:(id)a3 conditionTensor:(id)a4 sourceGradientTensor:(id)a5 resultGradientTensors:(id)a6;
- (void)dispatchGradientSliceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5;
- (void)dispatchGradientSplitLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensor:(id)a5;
- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5;
- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7;
- (void)dispatchRNNGradientLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensors:(id)a5;
- (void)dispatchReadTensor:(id)a3 targetBuffer:(void *)a4 batchSize:(unint64_t)a5;
- (void)fuseLayersForInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4;
- (void)fuseLayersForTrainingGraph:(id)a3 stopGradientTensorList:(id)a4;
- (void)incrementReadCountForGradientState:(id)a3 increment:(int64_t)a4;
- (void)incrementReadCountForTensorDeviceMemory:(id)a3 increment:(int64_t)a4;
- (void)optimizeComputationForTrainingGraph:(id)a3;
- (void)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 targetBuffer:(void *)a5 batchSize:(unint64_t)a6;
- (void)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 targetBuffer:(void *)a5 batchSize:(unint64_t)a6 reduceOverBatch:(BOOL)a7;
- (void)readTensor:(id)a3 targetBuffer:(void *)a4;
- (void)reloadParameterDataFromHostToDeviceMemoryForTensor:(id)a3;
- (void)resetLayer:(id)a3;
- (void)restoreRNNParamsWithDeviceOps:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8;
- (void)saveGraphPartitioning:(id)a3 toFile:(id)a4;
- (void)setDeviceMemoryForTensor:(id)a3 data:(id)a4;
- (void)setOptimizerLearningRate:(id)a3 learningRate:(float)a4;
- (void)setOptimizerTimeStep:(id)a3 timeStep:(unint64_t)a4;
- (void)sumSharedGradientsForConvolutionLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4;
- (void)sumSharedGradientsForNormalizationLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4 isBetaTensor:(BOOL)a5;
- (void)synchronizeOptimizerUpdatesForTensor:(id)a3;
- (void)synchronizeUpdatesForLayer:(id)a3;
- (void)updateAllParametersWithOptimizer:(id)a3 arrayOfParameters:(id)a4;
- (void)updateBatchNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 meanTensor:(id)a7 varianceTensor:(id)a8 arrayOfParams:(id)a9;
- (void)updateConvolutionLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateEmbeddingLayer:(id)a3 weightsParameter:(id)a4 optimizer:(id)a5 arrayOfParams:(id)a6;
- (void)updateFullyConnectedLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateGroupNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateInstanceNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateLayerNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateMultiheadAttentionLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateRNNLayer:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8;
- (void)updateTensorParameter:(id)a3 optimizer:(id)a4 gradient:(id)a5 arrayOfParams:(id)a6;
- (void)writeToAllDevices:(id)a3 allocateData:(BOOL)a4 batchSize:(unint64_t)a5;
- (void)writeToDevice:(id)a3 toDeviceIndex:(unint64_t)a4 batchSize:(unint64_t)a5;
@end

@implementation MLCDeviceANE

- (id)convolutionLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5
{
  return ANE_CreateConvolutionLayer(a4, a5, a3, 0);
}

- (id)fullyConnectedLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5
{
  return ANE_CreateFullyConnectedLayer();
}

- (id)convolutionTransposeLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5
{
  v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) convolutionTransposeLayerWithDescriptor:weights:biasTerms:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)poolingLayerWithDescriptor:(id)a3 paddingSizes:(unint64_t *)a4
{
  return ANE_CreatePoolingLayer(a3, a4);
}

- (id)neuronLayerWithDescriptor:(id)a3
{
  return ANE_CreateNeuronLayer(a3);
}

- (id)batchNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v14 = NSNumber;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = [v14 numberWithUnsignedInteger:a3];
  v23[0] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v21 = ANE_CreateNormalizationLayer(0, 0, v20, a8, 1, v18, v17, v16, v15);

  return v21;
}

- (id)layerNormalizationLayerWithNormalizedShape:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6 isFusedWithArithmeticLayer:(BOOL)a7
{
  return ANE_CreateNormalizationLayer(2, 0, a3, a6, 1, 0, 0, a4, a5);
}

- (id)instanceNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v14 = NSNumber;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = [v14 numberWithUnsignedInteger:a3];
  v23[0] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v21 = ANE_CreateNormalizationLayer(1, 0, v20, a8, 1, v18, v17, v16, v15);

  return v21;
}

- (id)groupNormalizationLayerWithFeatureChannelCount:(unint64_t)a3 groupCount:(unint64_t)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v11 = NSNumber;
  id v12 = a6;
  id v13 = a5;
  v14 = [v11 numberWithUnsignedInteger:a3];
  v18[0] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v16 = ANE_CreateNormalizationLayer(3, 0, v15, a7, a4, 0, 0, v13, v12);

  return v16;
}

- (id)arithmeticLayerWithOperation:(int)a3 activationDescriptor:(id)a4
{
  return ANE_CreateArithmeticLayer(a3);
}

- (id)compareLayerWithOperation:(int)a3
{
  return ANE_CreateComparisonLayer(a3);
}

- (id)reductionLayerWithReduceType:(int)a3 dimensions:(id)a4 sourceShapeCount:(unint64_t)a5
{
  return ANE_CreateReductionLayer(a3, a4, a5);
}

- (id)softmaxLayerWithOperation:(int)a3 dimension:(unint64_t)a4 sourceShapeCount:(unint64_t)a5
{
  return ANE_CreateSoftmaxLayer(a3, a4, a5);
}

- (id)lossLayerWithDescriptor:(id)a3
{
  v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)lossYOLOLayerWithDescriptor:(id)a3
{
  v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)dropoutLayerWithRate:(float)a3 seed:(unint64_t)a4
{
  v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)transposeLayerWithShape:(id)a3
{
  return ANE_CreateTransposeLayer(a3);
}

- (id)paddingLayerWithPaddingType:(int)a3 paddingLeft:(unint64_t)a4 paddingRight:(unint64_t)a5 paddingTop:(unint64_t)a6 paddingBottom:(unint64_t)a7 constantValue:(float)a8 dataType:(int)a9
{
  v10 = +[MLCLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)imageReshapeWithWidth:(unint64_t)a3 height:(unint64_t)a4 alignCorners:(BOOL)a5
{
  v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)lstmLayerWithDescriptor:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 peepholeWeights:(id)a6 biasTerms:(id)a7 gateActivations:(id)a8 outputResultActivation:(id)a9 inferenceOnly:(BOOL)a10
{
  v11 = +[MLCLog framework];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)gramMatrixLayerWithScaleFactor:(float)a3
{
  v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) convolutionTransposeLayerWithDescriptor:weights:biasTerms:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)upsampleLayerWithScaleFactorX:(float)a3 scaleFactorY:(float)a4 sampleMode:(int)a5 alignCorners:(BOOL)a6
{
  return ANE_CreateUpsampleLayer(a5, a3, *(double *)&a4);
}

- (id)concatLayerWithConcatDimension:(unint64_t)a3 sourceShapeCount:(unint64_t)a4
{
  return ANE_CreateConcatLayer(a3, a4);
}

- (id)matMulLayerWithDescriptor:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 inferenceOnly:(BOOL)a6
{
  return ANE_CreateMatMulLayer(a3);
}

- (id)optimizerSGDWithDescriptor:(id)a3 momentunScale:(float)a4 useNesterovMomentum:(BOOL)a5
{
  v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)optimizerAdamWithDescriptor:(id)a3 beta1:(double)a4 beta2:(double)a5 epsilon:(float)a6 amsgrad:(BOOL)a7 timeStep:(unint64_t)a8 isAdamW:(BOOL)a9
{
  v10 = +[MLCLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)optimizerRMSPropWithDescriptor:(id)a3 momentumScale:(float)a4 alpha:(float)a5 epsilon:(float)a6 centered:(BOOL)a7
{
  v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)allocatedDeviceDataSizeForTraining:(BOOL)a3 layer:(id)a4
{
  v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return 0;
}

- (BOOL)setConvolutionLayerOptimizerDataForDeviceOps:(id)a3 weights:(id)a4 bias:(id)a5
{
  v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return 0;
}

- (BOOL)setMHALayerOptimizerDataForDeviceOps:(id)a3 optimizerDataForWeights:(id)a4 optimizerDataForBias:(id)a5
{
  v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return 0;
}

- (BOOL)setNormalizationLayerOptimizerDataForDeviceOps:(id)a3 beta:(id)a4 gamma:(id)a5
{
  v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return 0;
}

- (BOOL)setLSTMLayerOptimizerDataForDeviceOps:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 biasTerms:(id)a6
{
  v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return 0;
}

- (id)createOptimizerDeviceDataForTensor:(id)a3 optimizer:(id)a4 optimizerData:(id)a5 isVector:(BOOL)a6
{
  v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)allocateDeviceDataForGlobalNormClippingWithOptimizer:(id)a3 updatableParameterCount:(unint64_t)a4
{
  v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }
}

- (void)resetLayer:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 setDevice:0];
  [v3 setDeviceOps:MEMORY[0x1E4F1CBF0]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = objc_msgSend(v3, "resultTensors", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setDevice:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)partitionInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4 aneDevice:(id)a5 secondaryDevice:(id)a6 configurationJSON:(id)a7
{
  unint64_t v54 = a4;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v61 = a5;
  id v10 = a6;
  id v11 = a7;
  long long v12 = [a3 graphLayerList];
  id v13 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v72 objects:v78 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v73 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "layerID", v54));
        [v13 setObject:v19 forKeyedSubscript:v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v72 objects:v78 count:16];
    }
    while (v16);
  }
  v56 = v10;
  v58 = v14;

  v21 = (void *)MEMORY[0x1E4F1CBF0];
  v62 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v63 = (void *)[v21 mutableCopy];
  v22 = [MEMORY[0x1E4F1CA80] set];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v55 = v11;
  obuint64_t j = [v11 objectForKeyedSubscript:@"ane_subgraphs"];
  uint64_t v23 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v60 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v69 != v60) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        v27 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v54);
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v28 = v26;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v64 objects:v76 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v65;
          do
          {
            for (uint64_t k = 0; k != v30; ++k)
            {
              if (*(void *)v65 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v64 + 1) + 8 * k)];
              [v27 addObject:v33];
              [v22 addObject:v33];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v64 objects:v76 count:16];
          }
          while (v30);
        }

        [v63 addObject:v27];
        v34 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        v35 = +[MLCDeviceGraph deviceGraphWithLayers:v34 device:v61];

        v36 = ANE_ComputeLiveOutputs(v27);
        v37 = (void *)[v36 mutableCopy];
        [v35 setLiveOutputs:v37];

        [v62 addObject:v35];
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
    }
    while (v24);
  }

  v38 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v39 = +[MLCDeviceGraph deviceGraphWithLayers:v38 device:v56];

  unint64_t v40 = [v58 count];
  unint64_t v41 = v54;
  if (v40 > v54)
  {
    unint64_t v42 = v40;
    do
    {
      unint64_t v43 = v41;
      v44 = [v58 objectAtIndexedSubscript:v54];
      if (([v44 skipLayer] & 1) == 0)
      {
        if ([v22 containsObject:v44])
        {
          uint64_t v45 = [v63 count];
          if (v45)
          {
            uint64_t v46 = v45;
            for (uint64_t m = 0; m != v46; ++m)
            {
              v48 = [v63 objectAtIndexedSubscript:m];
              int v49 = [v48 containsObject:v44];

              if (v49)
              {
                v50 = [v62 objectAtIndexedSubscript:m];
                v51 = [v50 graphLayerList];
                [v51 addObject:v44];
              }
            }
          }
        }
        else
        {
          [(MLCDeviceANE *)self resetLayer:v44];
          v52 = [v39 graphLayerList];
          [v52 addObject:v44];
        }
      }

      unint64_t v41 = v43 + 1;
    }
    while (v43 + 1 != v42);
  }
  objc_msgSend(v62, "addObject:", v39, v54);

  return v62;
}

- (void)saveGraphPartitioning:(id)a3 toFile:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v25 = a4;
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v5;
  uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v9 = [v8 graphLayerList];
        id v10 = [v9 lastObject];
        id v11 = [v10 device];
        int v12 = [v11 type];

        if (v12) {
          id v13 = @"ane_subgraphs";
        }
        else {
          id v13 = @"cpu_subgraphs";
        }
        id v14 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v15 = [v8 graphLayerList];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "layerID"));
              [v14 addObject:v20];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v17);
        }

        v21 = [v6 objectForKeyedSubscript:v13];

        if (!v21)
        {
          v22 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          [v6 setObject:v22 forKeyedSubscript:v13];
        }
        uint64_t v23 = [v6 objectForKeyedSubscript:v13];
        [v23 addObject:v14];
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v28);
  }

  uint64_t v24 = [MEMORY[0x1E4F1CAA8] outputStreamToFileAtPath:v25 append:0];
  [v24 open];
  [MEMORY[0x1E4F28D90] writeJSONObject:v6 toStream:v24 options:1 error:0];
  [v24 close];
}

- (id)partitionInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4 aneDevice:(id)a5 secondaryDevice:(id)a6
{
  uint64_t v186 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 graphLayerList];
  id v14 = v13;
  if (!v13 || ![v13 count])
  {
    uint64_t v39 = +[MLCLog framework];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceANE(MLCLayerOperations) partitionInferenceGraph:startAtLayerIndex:aneDevice:secondaryDevice:](a2);
    }
    goto LABEL_27;
  }
  if (!v11 || !v12)
  {
    uint64_t v39 = +[MLCLog framework];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceANE(MLCLayerOperations) partitionInferenceGraph:startAtLayerIndex:aneDevice:secondaryDevice:](a2);
    }
LABEL_27:
    unint64_t v40 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_28;
  }
  aSelector = a2;
  id v157 = v12;
  if (([v10 compilerOptions] & 3) == 0) {
    +[MLCComputeEngineCommon applyPatternMatcherForGraph:v14 stopGradientTensorList:0 startAtLayerIndex:a4 forInference:1];
  }
  uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
  v158 = [MEMORY[0x1E4F1CBF0] mutableCopy];
  v160 = (void *)[v15 mutableCopy];
  v163 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  v159 = objc_opt_new();
  v162 = v14;
  int64_t v16 = [v14 count];
  id v161 = v11;
  if (v16 > (uint64_t)a4)
  {
    int64_t v17 = v16;
    do
    {
      uint64_t v18 = [v14 objectAtIndexedSubscript:--v17];
      if (([v18 skipLayer] & 1) == 0)
      {
        v19 = [NSNumber numberWithInteger:v17];
        v20 = [v18 key];
        [v163 setObject:v19 forKeyedSubscript:v20];

        [v18 setCompileForInferenceOnly:1];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v22 = [v18 sourceTensors];
        uint64_t v23 = [v18 resultTensors];
        uint64_t v24 = v23;
        if (isKindOfClass)
        {
          char v25 = [v18 compileForDevice:v11 sourceTensors:v22 resultTensors:v23];

          if (v25) {
            goto LABEL_17;
          }
        }
        else
        {
          uint64_t v27 = [v23 objectAtIndexedSubscript:0];
          int v28 = [v18 compileForDevice:v11 sourceTensors:v22 resultTensor:v27];

          if (v28)
          {
LABEL_17:
            long long v29 = [v18 resultTensors];
            uint64_t v30 = [v29 count];

            id v11 = v161;
            if (v30)
            {
              unint64_t v31 = 0;
              do
              {
                long long v32 = [v18 resultTensors];
                long long v33 = [v32 objectAtIndexedSubscript:v31];
                [v33 setDevice:v161];

                ++v31;
                long long v34 = [v18 resultTensors];
                unint64_t v35 = [v34 count];
              }
              while (v31 < v35);
            }
            long long v36 = [v18 deviceOps];
            v37 = [v36 objectAtIndexedSubscript:0];

            [v37 setPlistBuilder:v159];
            [v158 addObject:v18];

            goto LABEL_21;
          }
        }
        v26 = +[MLCLog framework];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v38 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412546;
          v183 = v38;
          __int16 v184 = 2112;
          v185 = v18;
          _os_log_debug_impl(&dword_1DD0C9000, v26, OS_LOG_TYPE_DEBUG, "%@: ANE unsupported layer = %@", buf, 0x16u);
        }
        [(MLCDeviceANE *)self resetLayer:v18];
        id v11 = v161;
        if ((ANE_IsSupportedLayer(v18) & 1) == 0) {
          [v160 addObject:v18];
        }
      }
LABEL_21:
    }
    while (v17 > (uint64_t)a4);
  }
  v156 = v10;
  if (([v10 compilerOptions] & 3) != 0)
  {
    id v168 = v159;
    long long v176 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    uint64_t v39 = v158;
    obuint64_t j = [v158 reverseObjectEnumerator];
    uint64_t v42 = [obj countByEnumeratingWithState:&v176 objects:v181 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      unint64_t v44 = 0;
      uint64_t v165 = 0;
      uint64_t v45 = *(void *)v177;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v177 != v45) {
            objc_enumerationMutation(obj);
          }
          v47 = *(void **)(*((void *)&v176 + 1) + 8 * i);
          v48 = [v47 sourceTensors];
          uint64_t v49 = [v48 count];
          v50 = [v47 resultTensors];
          unint64_t v51 = [v50 count] + v49;

          if (v51 <= 0xFF)
          {
            v52 = [v47 deviceOps];
            v53 = [v52 objectAtIndexedSubscript:0];

            if (v51 + v44 <= 0xFF)
            {
              [v53 setPlistBuilder:v168];
              v44 += v51;
            }
            else if ((unint64_t)++v165 >= 0x10)
            {
              [(MLCDeviceANE *)self resetLayer:v47];
            }
            else
            {
              uint64_t v54 = objc_opt_new();

              [v53 setPlistBuilder:v54];
              unint64_t v44 = v51;
              id v168 = (id)v54;
            }
          }
          else
          {
            [(MLCDeviceANE *)self resetLayer:v47];
          }
        }
        uint64_t v43 = [obj countByEnumeratingWithState:&v176 objects:v181 count:16];
      }
      while (v43);
      id v10 = v156;
      id v12 = v157;
      id v11 = v161;
      id v14 = v162;
      uint64_t v39 = v158;
      v55 = v160;
      unint64_t v40 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      unint64_t v40 = (void *)MEMORY[0x1E4F1CBF0];
      id v12 = v157;
      v55 = v160;
    }
    goto LABEL_140;
  }
  v55 = v160;
  if (!+[MLCPlatformInfo isAneGraphPartitioningConfigSet])goto LABEL_60; {
  v56 = (void *)MEMORY[0x1E4F1C9B8];
  }
  v57 = +[MLCPlatformInfo aneGraphPartitioningConfigEnvVariable];
  uint64_t v58 = [v56 dataWithContentsOfFile:v57];

  uint64_t v39 = v158;
  if (!v58)
  {
    long long v64 = 0;
    uint64_t v60 = +[MLCLog framework];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      long long v65 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412290;
      v183 = v65;
      _os_log_impl(&dword_1DD0C9000, v60, OS_LOG_TYPE_INFO, "%@: cannot find config file to partition the graph", buf, 0xCu);
    }
    goto LABEL_59;
  }
  id v175 = 0;
  id v168 = (id)v58;
  uint64_t v59 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v58 options:0 error:&v175];
  uint64_t v60 = v175;
  if (v60 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v61 = (void *)v59;
    v62 = +[MLCLog framework];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      v63 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412290;
      v183 = v63;
      _os_log_impl(&dword_1DD0C9000, v62, OS_LOG_TYPE_INFO, "%@: cannot parse JSON", buf, 0xCu);
    }
    long long v64 = v168;
LABEL_59:

LABEL_60:
    +[_MLCANEDomTree computeDominationForGraph:](_MLCANEDomTree, "computeDominationForGraph:", v14, a4);
    id v168 = (id)objc_claimAutoreleasedReturnValue();
    long long v66 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    long long v67 = [MEMORY[0x1E4F1CA80] set];
    long long v171 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    long long v68 = [v14 reverseObjectEnumerator];
    uint64_t v69 = [v68 countByEnumeratingWithState:&v171 objects:v180 count:16];
    obuint64_t j = v66;
    v164 = v67;
    if (!v69) {
      goto LABEL_73;
    }
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v172;
    v166 = v68;
    while (1)
    {
      for (uint64_t j = 0; j != v70; ++j)
      {
        if (*(void *)v172 != v71) {
          objc_enumerationMutation(v68);
        }
        long long v73 = *(void **)(*((void *)&v171 + 1) + 8 * j);
        if (([v73 skipLayer] & 1) == 0)
        {
          if ([v55 containsObject:v73])
          {
            [v55 removeObject:v73];
          }
          else if (([v67 containsObject:v73] & 1) == 0)
          {
            long long v74 = [MEMORY[0x1E4F1CA80] set];
            long long v75 = [MEMORY[0x1E4F1CAD0] setWithArray:v55];
            v76 = [v73 key];
            v77 = [v163 objectForKeyedSubscript:v76];
            buildANESubgraph(v73, v74, v75, v168, v67, v163, [v77 unsignedIntegerValue]);

            if (![v74 count])
            {
              v152 = +[MLCLog framework];
              id v11 = v161;
              if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR)) {
                -[MLCDeviceANE(MLCLayerOperations) partitionInferenceGraph:startAtLayerIndex:aneDevice:secondaryDevice:].cold.4();
              }

              unint64_t v40 = (void *)MEMORY[0x1E4F1CBF0];
              id v10 = v156;
              id v12 = v157;
              id v14 = v162;
              uint64_t v39 = v158;
              v55 = v160;
LABEL_137:
              v153 = v164;

              v151 = v166;
              goto LABEL_139;
            }
            long long v66 = obj;
            [obj addObject:v74];
            [v67 unionSet:v74];

            v55 = v160;
            long long v68 = v166;
          }
        }
      }
      uint64_t v70 = [v68 countByEnumeratingWithState:&v171 objects:v180 count:16];
      if (!v70)
      {
LABEL_73:

        [v67 removeAllObjects];
        uint64_t v78 = [v66 count];
        uint64_t v79 = v168;
        if (v78)
        {
          unint64_t v80 = v78;
          uint64_t v81 = 0;
          do
          {
            uint64_t v167 = v81 + 1;
            if (v81 + 1 < v80)
            {
              uint64_t v82 = v81 + 1;
              do
              {
                v83 = [v66 objectAtIndexedSubscript:v81];
                v84 = [v66 objectAtIndexedSubscript:v82];
                id v85 = v83;
                id v86 = v84;
                id v87 = v79;
                id v88 = v163;
                int v89 = [v87 doesSubgraph:v85 dominatesSubgraph:v86];
                int v90 = [v87 doesSubgraph:v86 dominatesSubgraph:v85];
                if (v89 & 1) != 0 || (v90)
                {
                  if ((v89 & v90) == 1)
                  {
                    v93 = +[MLCLog framework];
                    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
                      -[MLCDeviceANE(MLCLayerOperations) partitionInferenceGraph:startAtLayerIndex:aneDevice:secondaryDevice:](buf, &v183, v93);
                    }

                    long long v66 = obj;
                  }
                  if (v89)
                  {
                    v94 = v85;
                    v95 = v86;
                  }
                  else
                  {
                    v94 = v86;
                    v95 = v85;
                  }
                  int v92 = canMergeANESubgraphsHelper(v94, v95, v87, v88);
                }
                else
                {
                  v91 = [v87 getPostDominanceFrontierForSubgraph:v85];
                  if ([v91 count])
                  {
                    int v92 = 0;
                  }
                  else
                  {
                    v96 = [v87 getPostDominanceFrontierForSubgraph:v86];
                    int v92 = [v96 count] == 0;

                    uint64_t v79 = v168;
                  }

                  long long v66 = obj;
                }

                if (v92)
                {
                  v97 = [v66 objectAtIndexedSubscript:v81];
                  [v66 objectAtIndexedSubscript:v82];

                  v98 = [v66 objectAtIndexedSubscript:v81];
                  v99 = [v66 objectAtIndexedSubscript:v82];
                  [v98 unionSet:v99];

                  id v85 = [v66 objectAtIndexedSubscript:v82];
                  [v85 removeAllObjects];
                }
                else
                {
                }
                ++v82;
              }
              while (v80 != v82);
            }
            ++v81;
          }
          while (v167 != v80);
        }
        id v100 = v156;
        id v101 = v66;
        uint64_t v102 = [v101 count];
        if (v102)
        {
          uint64_t v103 = v102;
          uint64_t v104 = 0;
          while (1)
          {
            v105 = [v101 objectAtIndexedSubscript:v104];
            if ([v105 count] != 1) {
              goto LABEL_103;
            }
            v106 = [v100 graphLayerList];
            if ((unint64_t)[v106 count] <= 1) {
              break;
            }
            v107 = [v101 objectAtIndexedSubscript:v104];
            v108 = [v107 anyObject];
            char v109 = [v108 isDebuggingEnabled];

            if ((v109 & 1) == 0)
            {
              v105 = [v101 objectAtIndexedSubscript:v104];
              [v105 removeAllObjects];
LABEL_103:
            }
            if (v103 == ++v104) {
              goto LABEL_105;
            }
          }

          goto LABEL_103;
        }
LABEL_105:
        v110 = [v101 sortedArrayUsingComparator:&__block_literal_global];
        if ([v110 count])
        {
          unint64_t v111 = 0;
          unint64_t v112 = 0;
          do
          {
            v113 = [v110 objectAtIndexedSubscript:v111];
            v114 = ANE_ComputeLiveInputs(v113);

            v115 = [v110 objectAtIndexedSubscript:v111];
            v116 = ANE_ComputeLiveOutputs(v115);

            unint64_t v117 = [v114 count] + v112;
            unint64_t v118 = v117 + [v116 count];
            if (v118 > 0xFF)
            {
              v119 = [v110 objectAtIndexedSubscript:v111];
              [v119 removeAllObjects];

              unint64_t v118 = v112;
            }

            ++v111;
            unint64_t v112 = v118;
          }
          while (v111 < [v110 count]);
        }

        uint64_t v120 = [v101 count];
        if (v120 >= 1)
        {
          unint64_t v121 = v120 + 1;
          do
          {
            v122 = [v101 objectAtIndexedSubscript:v121 - 2];
            uint64_t v123 = [v122 count];

            unint64_t v124 = v121 - 2;
            if (v123)
            {
              v125 = [v101 objectAtIndexedSubscript:v124];
              [v164 unionSet:v125];
            }
            else
            {
              [v101 removeObjectAtIndex:v124];
            }
            --v121;
          }
          while (v121 > 1);
        }
        v126 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        uint64_t v127 = [v101 count];
        if (v127)
        {
          uint64_t v128 = v127;
          for (uint64_t k = 0; k != v128; ++k)
          {
            v130 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
            v131 = +[MLCDeviceGraph deviceGraphWithLayers:v130 device:v161];

            v132 = [v101 objectAtIndexedSubscript:k];
            v133 = ANE_ComputeLiveOutputs(v132);
            v134 = (void *)[v133 mutableCopy];
            [v131 setLiveOutputs:v134];

            [v126 addObject:v131];
          }
        }
        v135 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        v166 = +[MLCDeviceGraph deviceGraphWithLayers:v135 device:v157];

        id v14 = v162;
        unint64_t v136 = [v162 count];
        unint64_t v137 = v154;
        v55 = v160;
        if (v136 > v154)
        {
          unint64_t v138 = v136;
          do
          {
            v139 = v14;
            unint64_t v140 = v137;
            v141 = objc_msgSend(v139, "objectAtIndexedSubscript:");
            if (([v141 skipLayer] & 1) == 0)
            {
              if ([v164 containsObject:v141])
              {
                uint64_t v142 = [v101 count];
                if (v142)
                {
                  uint64_t v143 = v142;
                  for (uint64_t m = 0; m != v143; ++m)
                  {
                    v145 = [v101 objectAtIndexedSubscript:m];
                    int v146 = [v145 containsObject:v141];

                    if (v146)
                    {
                      v147 = [v126 objectAtIndexedSubscript:m];
                      v148 = [v147 graphLayerList];
                      [v148 addObject:v141];
                    }
                  }
                }
              }
              else
              {
                [(MLCDeviceANE *)self resetLayer:v141];
                v149 = [v166 graphLayerList];
                [v149 addObject:v141];
              }
            }

            unint64_t v137 = v140 + 1;
            BOOL v150 = v140 + 1 == v138;
            id v14 = v162;
          }
          while (!v150);
        }
        unint64_t v40 = v126;
        v151 = v166;
        [v126 addObject:v166];
        if (+[MLCPlatformInfo isAneSaveGraphPartitioningConfigSet])
        {
          long long v74 = +[MLCPlatformInfo aneSaveGraphPartitioningConfig];
          [(MLCDeviceANE *)self saveGraphPartitioning:v126 toFile:v74];
          id v10 = v156;
          id v12 = v157;
          id v11 = v161;
          uint64_t v39 = v158;
          goto LABEL_137;
        }
        id v10 = v156;
        id v12 = v157;
        id v11 = v161;
        uint64_t v39 = v158;
        v153 = v164;
LABEL_139:

        goto LABEL_140;
      }
    }
  }
  id v12 = v157;
  obuint64_t j = (void *)v59;
  unint64_t v40 = [(MLCDeviceANE *)self partitionInferenceGraph:v10 startAtLayerIndex:a4 aneDevice:v11 secondaryDevice:v157 configurationJSON:v59];
LABEL_140:

LABEL_28:

  return v40;
}

- (BOOL)updateTensorsForFusedLayers:(id)a3 ofInferenceGraph:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v85 objects:v93 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v86;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v86 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v85 + 1) + 8 * v11);
      if (ANE_IsAneCompiledLayer(v12)) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v85 objects:v93 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = [v12 deviceOps];
    id v14 = [v13 objectAtIndexedSubscript:0];

    uint64_t v15 = [v14 plistBuilder];

    if (!v15) {
      goto LABEL_56;
    }
    int64_t v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    int64_t v17 = ANE_ComputeLiveInputs(v16);

    uint64_t v18 = [v17 allObjects];
    if ([v18 count])
    {
      v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
      v20 = ANE_ComputeLiveOutputs(v19);

      v21 = [v20 allObjects];
      if ([v15 buildProcedureWithRootLayer:v6 aneSubgraphLayerList:v7 liveInputs:v17 liveOutputs:v20])
      {
        long long v64 = v21;
        long long v65 = v18;
        id v61 = v17;
        v62 = v15;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v63 = v7;
        id v22 = v7;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v81 objects:v92 count:16];
        id v68 = v6;
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v82;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v82 != v25) {
                objc_enumerationMutation(v22);
              }
              id v27 = *(id *)(*((void *)&v81 + 1) + 8 * i);
              if (v27 != v6)
              {
                int v28 = [v6 fusedLayers];
                [v28 addObject:v27];

                [v27 setSkipLayer:1];
              }
              if ([v27 isLastLayer])
              {
                [v27 setIsLastFusedLayer:1];
              }
              else
              {
                long long v79 = 0u;
                long long v80 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                long long v29 = [v27 resultTensors];
                uint64_t v30 = [v29 countByEnumeratingWithState:&v77 objects:v91 count:16];
                if (v30)
                {
                  uint64_t v31 = v30;
                  uint64_t v32 = *(void *)v78;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v31; ++j)
                    {
                      if (*(void *)v78 != v32) {
                        objc_enumerationMutation(v29);
                      }
                      if ([v20 containsObject:*(void *)(*((void *)&v77 + 1) + 8 * j)])
                      {
                        [v27 setIsLastFusedLayer:1];
                        goto LABEL_32;
                      }
                    }
                    uint64_t v31 = [v29 countByEnumeratingWithState:&v77 objects:v91 count:16];
                    if (v31) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_32:

                id v6 = v68;
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v81 objects:v92 count:16];
          }
          while (v24);
        }

        long long v34 = [MEMORY[0x1E4F1CAD0] setWithArray:v22];
        unint64_t v35 = (void *)[v65 mutableCopy];
        [v6 setSourceTensors:v35];

        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        obuint64_t j = [v6 sourceTensors];
        uint64_t v36 = [obj countByEnumeratingWithState:&v73 objects:v90 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v67 = *(void *)v74;
          do
          {
            for (uint64_t k = 0; k != v37; ++k)
            {
              if (*(void *)v74 != v67) {
                objc_enumerationMutation(obj);
              }
              uint64_t v39 = *(void **)(*((void *)&v73 + 1) + 8 * k);
              unint64_t v40 = [MEMORY[0x1E4F28E60] indexSet];
              unint64_t v41 = [v39 childLayers];
              uint64_t v42 = [v41 count];

              if (v42)
              {
                for (uint64_t m = 0; m != v42; ++m)
                {
                  unint64_t v44 = [v39 childLayers];
                  uint64_t v45 = [v44 objectAtIndexedSubscript:m];

                  if ([v34 containsObject:v45]) {
                    [v40 addIndex:m];
                  }
                }
              }
              uint64_t v46 = [v39 childLayers];
              [v46 removeObjectsAtIndexes:v40];

              v47 = [v39 childLayers];
              id v6 = v68;
              [v47 addObject:v68];
            }
            uint64_t v37 = [obj countByEnumeratingWithState:&v73 objects:v90 count:16];
          }
          while (v37);
        }

        v48 = (void *)[v64 mutableCopy];
        [v6 setResultTensors:v48];

        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        uint64_t v49 = [v6 resultTensors];
        uint64_t v50 = [v49 countByEnumeratingWithState:&v69 objects:v89 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v70;
          while (2)
          {
            for (uint64_t n = 0; n != v51; ++n)
            {
              if (*(void *)v70 != v52) {
                objc_enumerationMutation(v49);
              }
              uint64_t v54 = *(void **)(*((void *)&v69 + 1) + 8 * n);
              v55 = [v54 parentLayers];
              uint64_t v56 = [v55 count];

              if (!v56)
              {
                uint64_t v59 = +[MLCLog framework];
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
                  -[MLCDeviceANE(MLCLayerOperations) updateTensorsForFusedLayers:ofInferenceGraph:]();
                }

                BOOL v58 = 0;
                id v6 = v68;
                goto LABEL_68;
              }
              v57 = [v54 parentLayers];
              id v6 = v68;
              [v57 setObject:v68 atIndexedSubscript:0];
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v69 objects:v89 count:16];
            if (v51) {
              continue;
            }
            break;
          }
        }
        BOOL v58 = 1;
LABEL_68:
        id v7 = v63;

        int64_t v17 = v61;
        uint64_t v15 = v62;
        v21 = v64;
        uint64_t v18 = v65;
      }
      else
      {
        long long v34 = +[MLCLog framework];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceANE(MLCLayerOperations) updateTensorsForFusedLayers:ofInferenceGraph:].cold.4();
        }
        BOOL v58 = 0;
      }
    }
    else
    {
      v20 = +[MLCLog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceANE(MLCLayerOperations) updateTensorsForFusedLayers:ofInferenceGraph:]();
      }
      BOOL v58 = 0;
    }
  }
  else
  {
LABEL_9:

LABEL_56:
    uint64_t v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceANE(MLCLayerOperations) updateTensorsForFusedLayers:ofInferenceGraph:](a2);
    }
    BOOL v58 = 0;
  }

  return v58;
}

- (void)fuseLayersForTrainingGraph:(id)a3 stopGradientTensorList:(id)a4
{
  id v24 = a3;
  id v5 = a4;
  if (v24)
  {
    if ((unint64_t)[v24 count] >= 2)
    {
      uint64_t v6 = [v24 count];
      id v7 = v24;
      if (v6)
      {
        unint64_t v8 = 0;
        while (1)
        {
          uint64_t v9 = [v7 objectAtIndexedSubscript:v8];
          if ([v9 isLastLayer]) {
            break;
          }
          if (([v9 skipLayer] & 1) == 0)
          {
            uint64_t v10 = [v9 resultTensors];
            uint64_t v11 = [v10 objectAtIndexedSubscript:0];
            id v12 = [v11 childLayers];
            uint64_t v13 = [v12 count];

            if (v13 == 1)
            {
              id v14 = [v9 resultTensors];
              uint64_t v15 = [v14 objectAtIndexedSubscript:0];
              int64_t v16 = [v15 childLayers];
              int64_t v17 = [v16 objectAtIndexedSubscript:0];

              if (([v17 skipLayer] & 1) == 0)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v18 = [v17 resultTensors];
                    v19 = [v18 objectAtIndexedSubscript:0];

                    v20 = [v9 resultTensors];
                    [v20 setObject:v19 atIndexedSubscript:0];

                    v21 = [v19 parentLayers];
                    [v21 setObject:v9 atIndexedSubscript:0];

                    id v22 = [v9 fusedLayers];
                    [v22 addObject:v17];

                    [v17 setSkipLayer:1];
                  }
                }
              }
            }
          }

          ++v8;
          unint64_t v23 = [v24 count];
          id v7 = v24;
          if (v8 >= v23) {
            goto LABEL_17;
          }
        }
      }
    }
  }
LABEL_17:
}

- (void)fuseLayersForInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    unint64_t v8 = [v7 lastObject];
    if ([(MLCDeviceANE *)self updateTensorsForFusedLayers:v8 ofInferenceGraph:v7])
    {
      uint64_t v9 = [v7 count];
      if (v9)
      {
        uint64_t v11 = v9;
        uint64_t v12 = 0;
        *(void *)&long long v10 = 138412546;
        long long v20 = v10;
        do
        {
          uint64_t v13 = objc_msgSend(v7, "objectAtIndexedSubscript:", v12, v20);
          if (([v13 skipLayer] & 1) == 0)
          {
            id v14 = [v13 fusedLayers];
            uint64_t v15 = [v14 count];

            if (v11 != 1 && !v15)
            {
              int64_t v16 = +[MLCLog framework];
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                int64_t v17 = NSStringFromSelector(a2);
                *(_DWORD *)buf = v20;
                id v22 = v17;
                __int16 v23 = 2112;
                id v24 = v13;
                _os_log_error_impl(&dword_1DD0C9000, v16, OS_LOG_TYPE_ERROR, "%@: failed to fuse layer = %@", buf, 0x16u);
              }
            }
          }

          ++v12;
        }
        while (v11 != v12);
      }
    }
    else
    {
      uint64_t v18 = +[MLCLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v22 = v19;
        __int16 v23 = 2112;
        id v24 = v8;
        __int16 v25 = 2112;
        v26 = v7;
        _os_log_error_impl(&dword_1DD0C9000, v18, OS_LOG_TYPE_ERROR, "%@: failed to update tensors for rootLayer = %@ and graphLayerList = %@", buf, 0x20u);
      }
    }
  }
}

- (id)fusedConvolutionAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6
{
  id v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)fusedFullyConnectedAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6
{
  id v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)fusedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10
{
  uint64_t v11 = +[MLCLog framework];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) convolutionTransposeLayerWithDescriptor:weights:biasTerms:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)fusedConvolutionBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9 neuronDescriptor:(id)a10 weights:(id)a11 biasTerms:(id)a12
{
  uint64_t v13 = +[MLCLog framework];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)fusedFullyConnectedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9 neuronDescriptor:(id)a10 weights:(id)a11 biasTerms:(id)a12
{
  uint64_t v13 = +[MLCLog framework];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)multiheadAttentionLayerWithDescriptor:(id)a3 weights:(id)a4 bias:(id)a5 attnBias:(id)a6 inferenceOnly:(BOOL)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)sliceLayerWithbegin:(id)a3 end:(id)a4 stride:(id)a5 inferenceOnly:(BOOL)a6
{
  return ANE_CreateSliceLayer(a3, a4, a5);
}

- (BOOL)compileLayerDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    long long v10 = [v7 objectAtIndexedSubscript:0];
    switch([v10 deviceOpType])
    {
      case 1u:
        uint64_t v11 = ANE_CompileArithmeticLayer(v7, (uint64_t)v8, v9);
        goto LABEL_26;
      case 2u:
        unsigned int v13 = 0;
        goto LABEL_18;
      case 4u:
        uint64_t v11 = ANE_CompileConvolutionLayer(v7, v8, v9);
        goto LABEL_26;
      case 7u:
        uint64_t v11 = ANE_CompileFullyConnectedLayer(v7, v8, v9);
        goto LABEL_26;
      case 0xAu:
        uint64_t v11 = ANE_CompileNeuronLayer(v7, (uint64_t)v8, v9);
        goto LABEL_26;
      case 0xBu:
        uint64_t v11 = ANE_CompilePoolingLayer(v7, v8, v9);
        goto LABEL_26;
      case 0xCu:
        uint64_t v11 = ANE_CompileSoftmaxLayer(v7, (uint64_t)v8, v9);
        goto LABEL_26;
      case 0xDu:
        unsigned int v13 = 1;
        goto LABEL_18;
      case 0x10u:
        uint64_t v11 = ANE_CompileUpsampleLayer(v7, v8, v9);
        goto LABEL_26;
      case 0x12u:
        uint64_t v11 = ANE_CompileReshapeLayer((uint64_t)v7, v8, v9);
        goto LABEL_26;
      case 0x13u:
        unsigned int v13 = 2;
        goto LABEL_18;
      case 0x17u:
        unsigned int v13 = 3;
LABEL_18:
        uint64_t v11 = ANE_CompileNormalizationLayer(v13, v7, v8, v9);
        goto LABEL_26;
      case 0x1Cu:
        uint64_t v11 = ANE_CompileTransposeLayer(v7, v8, v9);
        goto LABEL_26;
      case 0x1Eu:
        uint64_t v11 = ANE_CompileReductionLayer(v7, v8, v9);
        goto LABEL_26;
      case 0x1Fu:
        uint64_t v11 = ANE_CompileConcatLayer(v7, v8, v9);
        goto LABEL_26;
      case 0x20u:
        uint64_t v11 = ANE_CompileMatMulLayer(v7, v8, v9);
        goto LABEL_26;
      case 0x21u:
        uint64_t v11 = ANE_CompileSliceLayer(v7, v8, v9);
        goto LABEL_26;
      case 0x22u:
        uint64_t v11 = ANE_CompileComparisonLayer(v7, v8, v9);
        goto LABEL_26;
      case 0x23u:
        uint64_t v11 = ANE_CompileSelectionLayer(v7, v8, v9);
LABEL_26:
        id v14 = v11;
        if (v11 && [v11 count])
        {
          [v10 setUnits:v14];
          BOOL v12 = 1;
        }
        else
        {
          uint64_t v15 = +[MLCLog framework];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceANE(MLCLayerOperations) compileLayerDeviceOps:sourceTensors:resultTensor:]();
          }

LABEL_32:
          BOOL v12 = 0;
        }

        break;
      default:
        id v14 = +[MLCLog framework];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceANE(MLCLayerOperations) compileLayerDeviceOps:sourceTensors:resultTensor:]();
        }
        goto LABEL_32;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)compileOptimizerDeviceOps:(id)a3
{
  v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }

  return 0;
}

+ (BOOL)hasANE
{
  if (hasANE_onceToken != -1) {
    dispatch_once(&hasANE_onceToken, &__block_literal_global_2);
  }
  return hasANE_hasANE;
}

id __22__MLCDeviceANE_hasANE__block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken_1 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_189);
  }
  if (AppleNeuralEngineLibrary_frameworkLibrary_1)
  {
    id result = softLinkClass_ANEDeviceInfo_0();
    if (result)
    {
      id result = softLinkClass_ANERequest();
      if (result)
      {
        id result = softLinkClass_ANEQoSMapper();
        if (result)
        {
          id result = softLinkClass_ANEInMemoryModelDescriptor();
          if (result)
          {
            id result = softLinkClass_ANEInMemoryModel();
            if (result)
            {
              if (softLinkClass_ANEIOSurfaceObject_onceToken_0 != -1) {
                dispatch_once(&softLinkClass_ANEIOSurfaceObject_onceToken_0, &__block_literal_global_192);
              }
              id result = (id) softLinkClass_ANEIOSurfaceObject_softLinkClass_ANEIOSurfaceObject_0;
              if (result) {
                id result = (id)[softLinkClass_ANEDeviceInfo_0() hasANE];
              }
            }
          }
        }
      }
    }
  }
  else
  {
    id result = 0;
  }
  hasANE_hasANE = (char)result;
  return result;
}

- (MLCDeviceANE)initWithType:(int)a3
{
  if ([(id)objc_opt_class() hasANE])
  {
    v12.receiver = self;
    v12.super_class = (Class)MLCDeviceANE;
    id v6 = [(MLCDeviceANE *)&v12 init];
    id v7 = v6;
    if (v6)
    {
      v6->_deviceType = a3;
      deviceList = v6->_deviceList;
      v6->_deviceList = (NSArray *)&unk_1F3876DB0;
    }
    self = v7;
    id v9 = self;
  }
  else
  {
    long long v10 = +[MLCLog framework];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceANE initWithType:](a2);
    }

    id v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  id v3 = NSString;
  v4 = NSStringFromSelector(a2);
  uint64_t v5 = [(MLCDeviceANE *)self deviceType];
  id v6 = [softLinkClass_ANEDeviceInfo_0() aneSubType];
  id v7 = [v3 stringWithFormat:@"%@: { deviceType=%d, aneSubType=%@ }", v4, v5, v6];

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(MLCDeviceANE *)self deviceType];

  return (id)[v4 initWithType:v5];
}

- (unint64_t)numberOfDevices
{
  return 1;
}

- (unint64_t)deviceMemorySizeForTensor:(id)a3
{
  uint64_t v4 = 1;
  return [(MLCDeviceANE *)self deviceMemorySizeForTensor:a3 interleave:&v4];
}

- (unint64_t)deviceMemorySizeForTensor:(id)a3 interleave:(unint64_t *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [v6 interleave];
  unint64_t v8 = ANE_CalculatePlaneCountForTensor(v6, v7);
  uint64_t v9 = ANE_CalculatePlaneStrideForTensor(v6, v7);

  if (v8 && v9)
  {
    *a4 = v7;
    return v9 * v8;
  }
  else
  {
    uint64_t v11 = +[MLCLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_super v12 = NSStringFromSelector(a2);
      int v13 = 138412802;
      id v14 = v12;
      __int16 v15 = 2048;
      unint64_t v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      _os_log_error_impl(&dword_1DD0C9000, v11, OS_LOG_TYPE_ERROR, "%@: invalid plane count=%lu or plane stride=%lu", (uint8_t *)&v13, 0x20u);
    }
    return 0;
  }
}

- (BOOL)needToAllocateDeviceMemoryForTensor:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 deviceMemory];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [v3 device];

    if (!v6) {
      goto LABEL_5;
    }
    unint64_t v7 = [v3 device];
    int v8 = [v7 type];

    if (v8 == 3
      || ([v3 device],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 type],
          v9,
          v10))
    {
LABEL_5:
      BOOL v11 = 0;
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v19 = 0u;
      int v13 = objc_msgSend(v3, "deviceMemory", 0, 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              BOOL v11 = 0;
              goto LABEL_18;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
      BOOL v11 = 1;
LABEL_18:
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (void)allocateDeviceMemoryForTensor:(id)a3
{
  v25[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E01B11E0]();
  unint64_t v23 = 1;
  unint64_t v7 = [(MLCDeviceANE *)self deviceMemorySizeForTensor:v5 interleave:&v23];
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v9 = [v5 descriptor];
    int v10 = [v9 dataType];

    unint64_t v11 = ANE_CalculatePlaneCountForTensor(v5, v23);
    uint64_t v12 = ANE_CalculatePlaneStrideForTensor(v5, v23);
    unint64_t v13 = ANE_CalculateRowStrideForTensor(v5, v23);
    uint64_t v14 = ANE_GetANECIRDataTypeWithMLCDataType(v10);
    uint64_t v15 = v14;
    if (v14)
    {
      v25[0] = v14;
      v24[0] = @"Type";
      v24[1] = @"Interleave";
      uint64_t v16 = [NSNumber numberWithUnsignedInteger:v23];
      v25[1] = v16;
      v24[2] = @"PlaneCount";
      __int16 v17 = [NSNumber numberWithUnsignedInteger:v11];
      v25[2] = v17;
      v24[3] = @"RowStride";
      long long v18 = [NSNumber numberWithUnsignedInteger:v13];
      v25[3] = v18;
      v24[4] = @"PlaneStride";
      long long v19 = [NSNumber numberWithUnsignedInteger:v12];
      v25[4] = v19;
      long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];

      long long v21 = +[_MLCANEIOSurface objectWithDataLength:v8 liveIOStatus:v20];
      if (v21)
      {
        id v22 = [v5 deviceMemory];
        [v22 addObject:v21];
      }
      else
      {
        id v22 = +[MLCLog framework];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceANE allocateDeviceMemoryForTensor:](a2);
        }
      }
    }
    else
    {
      long long v20 = +[MLCLog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        [(MLCDeviceANE *)a2 allocateDeviceMemoryForTensor:v20];
      }
    }
  }
  else
  {
    uint64_t v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceANE allocateDeviceMemoryForTensor:](a2);
    }
  }
}

- (void)deallocateDeviceMemoryForTensor:(id)a3
{
  id v3 = [a3 deviceMemory];
  [v3 removeAllObjects];
}

- (BOOL)shareDeviceMemoryWithResultTensor:(id)a3 sourceTensor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6 != v5)
  {
    unint64_t v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v5 setDeviceMemory:v7];

    unint64_t v8 = [v6 deviceMemory];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      do
      {
        unint64_t v11 = [v5 deviceMemory];
        uint64_t v12 = [v6 deviceMemory];
        unint64_t v13 = [v12 objectAtIndexedSubscript:v10];
        [v11 addObject:v13];

        ++v10;
        uint64_t v14 = [v6 deviceMemory];
        unint64_t v15 = [v14 count];
      }
      while (v10 < v15);
    }
    uint64_t v16 = [v6 sharedMemoryTensor];
    if (v16)
    {
      __int16 v17 = [v6 sharedMemoryTensor];
      [v5 setSharedMemoryTensor:v17];
    }
    else
    {
      [v5 setSharedMemoryTensor:v6];
    }

    objc_msgSend(v5, "setDeviceIndex:", objc_msgSend(v6, "deviceIndex"));
  }

  return 1;
}

- (id)getHostPointerIfUnifiedDeviceMemory:(id)a3
{
  id v3 = a3;
  if (!VerifyTensorBeforeRead(v3))
  {
    unint64_t v23 = 0;
    goto LABEL_15;
  }
  uint64_t v4 = [v3 deviceMemory];
  id v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v3, "deviceIndex"));

  id v6 = [v5 liveIOStatus];
  unint64_t v7 = [v6 objectForKeyedSubscript:@"Interleave"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  uint64_t v9 = [v6 objectForKeyedSubscript:@"Type"];
  uint64_t v10 = ANE_ANECDataTypeToMLCDataType(v9);
  if (v8 == 1)
  {
    uint64_t v11 = v10;
    uint64_t v12 = [v3 descriptor];
    int v13 = [v12 dataType];

    if (v11 == v13)
    {
      id v26 = 0;
      ANE_GetTensor4DShapeWithOnePrepended(v3, &v26);
      id v14 = v26;
      unint64_t v15 = [v5 ioSurfaceObject];
      uint64_t v16 = (__IOSurface *)[v15 ioSurface];

      if (v16)
      {
        __int16 v17 = [v6 objectForKeyedSubscript:@"RowStride"];
        unint64_t v18 = [v17 unsignedIntegerValue];

        unint64_t v19 = v18 / ANE_GetANEElementByteCount(v11);
        long long v20 = [v14 objectAtIndexedSubscript:3];
        uint64_t v21 = [v20 unsignedIntegerValue];

        if (v19 == v21)
        {
          BaseAddress = IOSurfaceGetBaseAddress(v16);
          unint64_t v23 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:BaseAddress length:IOSurfaceGetAllocSize(v16) freeWhenDone:0];
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        id v24 = +[MLCLog framework];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceANE getHostPointerIfUnifiedDeviceMemory:]();
        }
      }
      unint64_t v23 = 0;
      goto LABEL_13;
    }
  }
  unint64_t v23 = 0;
LABEL_14:

LABEL_15:

  return v23;
}

- (id)readTensor:(id)a3
{
  id v4 = a3;
  id v5 = -[MLCDeviceANE readTensor:fromDeviceIndex:](self, "readTensor:fromDeviceIndex:", v4, [v4 deviceIndex]);

  return v5;
}

- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = -[MLCDeviceANE readTensor:fromDeviceIndex:batchSize:](self, "readTensor:fromDeviceIndex:batchSize:", v6, a4, [v6 calculateBatchSizeToUse]);

  return v7;
}

- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 batchSize:(unint64_t)a5
{
  id v8 = a3;
  size_t v9 = ANE_CalculateImageSizeForTensor(v8) * a5;
  uint64_t v10 = malloc_type_malloc(v9, 0xC6646363uLL);
  [(MLCDeviceANE *)self readTensor:v8 fromDeviceIndex:a4 targetBuffer:v10 batchSize:a5];

  uint64_t v11 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)[v11 dataWithBytesNoCopy:v10 length:v9 freeWhenDone:1];
}

- (void)readTensor:(id)a3 targetBuffer:(void *)a4
{
  id v7 = a3;
  -[MLCDeviceANE getHostPointerIfUnifiedDeviceMemory:](self, "getHostPointerIfUnifiedDeviceMemory:");
  id v6 = objc_claimAutoreleasedReturnValue();
  if ((void *)[v6 bytes] != a4) {
    -[MLCDeviceANE readTensor:fromDeviceIndex:targetBuffer:batchSize:](self, "readTensor:fromDeviceIndex:targetBuffer:batchSize:", v7, [v7 deviceIndex], a4, objc_msgSend(v7, "calculateBatchSizeToUse"));
  }
}

- (void)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 targetBuffer:(void *)a5 batchSize:(unint64_t)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (VerifyTensorBeforeRead(v10))
  {
    if ([v10 deviceIndex] != a4)
    {
      uint64_t v12 = +[MLCLog framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unint64_t v18 = NSStringFromSelector(a2);
        int v19 = 138412802;
        long long v20 = v18;
        __int16 v21 = 2048;
        unint64_t v22 = [v10 deviceIndex];
        __int16 v23 = 2048;
        unint64_t v24 = a4;
        _os_log_error_impl(&dword_1DD0C9000, v12, OS_LOG_TYPE_ERROR, "%@: -readTensor:fromDeviceIndex:targetBuffer:batchSize must be called with deviceIndex = %lu, but given deviceIndex = %lu", (uint8_t *)&v19, 0x20u);
      }
      goto LABEL_13;
    }
    uint64_t v11 = [v10 deviceMemory];
    uint64_t v12 = [v11 objectAtIndexedSubscript:a4];

    int v13 = [v12 liveIOStatus];
    unint64_t v14 = [v10 calculateBatchSizeToUse];
    if (v14 >= a6)
    {
      if (ANE_ReadOutputTensor(v10, v13, a4, (char *)a5, a6))
      {
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      uint64_t v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceANE readTensor:fromDeviceIndex:targetBuffer:batchSize:]();
      }
    }
    else
    {
      unint64_t v15 = v14;
      uint64_t v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v17 = NSStringFromSelector(a2);
        int v19 = 138412802;
        long long v20 = v17;
        __int16 v21 = 2048;
        unint64_t v22 = a6;
        __int16 v23 = 2048;
        unint64_t v24 = v15;
        _os_log_error_impl(&dword_1DD0C9000, v16, OS_LOG_TYPE_ERROR, "%@: invalid batchSize=%lu. batchSize cannot exceed the batch size of the tensor=%lu", (uint8_t *)&v19, 0x20u);
      }
    }

    goto LABEL_12;
  }
LABEL_14:
}

- (void)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 targetBuffer:(void *)a5 batchSize:(unint64_t)a6 reduceOverBatch:(BOOL)a7
{
  id v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }
}

- (void)dispatchReadTensor:(id)a3 targetBuffer:(void *)a4 batchSize:(unint64_t)a5
{
  id v8 = a3;
  -[MLCDeviceANE readTensor:fromDeviceIndex:targetBuffer:batchSize:](self, "readTensor:fromDeviceIndex:targetBuffer:batchSize:", v8, [v8 deviceIndex], a4, a5);
}

- (void)broadcastTensor:(id)a3
{
  id v4 = a3;
  -[MLCDeviceANE writeToAllDevices:allocateData:batchSize:](self, "writeToAllDevices:allocateData:batchSize:", v4, 0, [v4 calculateBatchSizeToUse]);
}

- (void)broadcastTensor:(id)a3 batchSize:(unint64_t)a4
{
}

- (void)writeToAllDevices:(id)a3 allocateData:(BOOL)a4 batchSize:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = v8;
  if (v6)
  {
    [(MLCDeviceANE *)self allocateDeviceMemoryForTensor:v8];
    id v8 = v9;
  }
  [(MLCDeviceANE *)self writeToDevice:v8 toDeviceIndex:0 batchSize:a5];
}

- (void)writeToDevice:(id)a3 toDeviceIndex:(unint64_t)a4 batchSize:(unint64_t)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [v8 data];
  uint64_t v10 = [v9 bytes];

  if (v10)
  {
    uint64_t v11 = [v8 deviceMemory];
    uint64_t v12 = [v11 count];

    if (!v12)
    {
      unint64_t v18 = +[MLCLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceANE writeToDevice:toDeviceIndex:batchSize:]();
      }
      goto LABEL_24;
    }
    if ([v8 deviceIndex] != a4)
    {
      unint64_t v18 = +[MLCLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = NSStringFromSelector(a2);
        int v32 = 138412802;
        long long v33 = v19;
        __int16 v34 = 2048;
        unint64_t v35 = [v8 deviceIndex];
        __int16 v36 = 2048;
        unint64_t v37 = a4;
        long long v20 = "%@: -writeToDevice:toDeviceIndex:batchSize must be called with deviceIndex = %lu, but given deviceIndex = %lu";
        goto LABEL_12;
      }
LABEL_24:

      goto LABEL_25;
    }
    int v13 = [v8 deviceMemory];
    unint64_t v14 = [v13 objectAtIndexedSubscript:a4];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      unint64_t v18 = +[MLCLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceANE writeToDevice:toDeviceIndex:batchSize:].cold.4(a2);
      }
      goto LABEL_24;
    }
    unint64_t v16 = [v8 calculateBatchSizeToUse];
    if (v16 < a5)
    {
      unint64_t v17 = v16;
      unint64_t v18 = +[MLCLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = NSStringFromSelector(a2);
        int v32 = 138412802;
        long long v33 = v19;
        __int16 v34 = 2048;
        unint64_t v35 = a5;
        __int16 v36 = 2048;
        unint64_t v37 = v17;
        long long v20 = "%@: invalid batchSize=%lu. batchSize cannot exceed the batch size of the tensor=%lu";
LABEL_12:
        _os_log_error_impl(&dword_1DD0C9000, v18, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v32, 0x20u);

        goto LABEL_24;
      }
      goto LABEL_24;
    }
    __int16 v21 = [v8 deviceMemory];
    unint64_t v18 = [v21 objectAtIndexedSubscript:a4];

    unint64_t v22 = [v18 liveIOStatus];
    __int16 v23 = v22;
    if (v22 && [v22 count])
    {
      unint64_t v24 = [v18 ioSurfaceObject];
      uint64_t v25 = (__IOSurface *)[v24 ioSurface];

      IOSurfaceLock(v25, 0, 0);
      BaseAddress = (char *)IOSurfaceGetBaseAddress(v25);
      id v27 = [v8 data];
      int v28 = (char *)[v27 bytes];
      long long v29 = [v8 data];
      char v30 = ANE_ConvertInputTensor(v8, v23, v28, [v29 length], BaseAddress, a5);

      IOSurfaceUnlock(v25, 0, 0);
      if (v30)
      {
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v31 = +[MLCLog framework];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceANE writeToDevice:toDeviceIndex:batchSize:]();
      }
    }
    else
    {
      uint64_t v31 = +[MLCLog framework];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceANE writeToDevice:toDeviceIndex:batchSize:]();
      }
    }

    goto LABEL_23;
  }
LABEL_25:
}

- (BOOL)synchronizeTensor:(id)a3
{
  return 1;
}

- (void)commitWithProfiling:(BOOL)a3 graphExecutionTime:(id)a4
{
}

- (void)commitAndWaitForCompletion:(id)a3
{
}

- (void)commitAndWaitForCompletion:(id)a3 enableProfiling:(BOOL)a4 graphExecutionTime:(id)a5 graphResultTensor:(id)a6
{
  BOOL v8 = a4;
  unint64_t v17 = (void (**)(id, id, void, double))a3;
  id v9 = a5;
  id v10 = a6;
  double v11 = 0.0;
  if (v8)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v11 = Current - *(double *)[v9 bytes];
  }
  if (v10)
  {
    id v13 = [v10 data];
    if ([v13 bytes])
    {
      unint64_t v14 = [v10 device];

      if (!v14) {
        goto LABEL_8;
      }
      id v13 = [v10 device];
      unint64_t v15 = [v13 computeEngine];
      id v16 = [v10 data];
      objc_msgSend(v15, "readTensor:targetBuffer:", v10, objc_msgSend(v16, "bytes"));
    }
  }
LABEL_8:
  if (v17) {
    v17[2](v17, v10, 0, v11);
  }
}

- (unint64_t)numDevices
{
  return 1;
}

- (BOOL)allocateDeviceMemoryForSourceAndResultTensorsOfLayer:(id)a3 tensorLabelToIOSurfaceMap:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  BOOL v8 = [v6 sourceTensors];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    unint64_t v10 = 0;
    do
    {
      double v11 = [v6 sourceTensors];
      uint64_t v12 = [v11 objectAtIndexedSubscript:v10];

      if ((ANE_CanProgramANECConstantTensorUnit(v12) & 1) == 0)
      {
        if ([(MLCDeviceANE *)self needToAllocateDeviceMemoryForTensor:v12]) {
          [(MLCDeviceANE *)self allocateDeviceMemoryForTensor:v12];
        }
        id v13 = [v12 deviceMemory];
        unint64_t v14 = [v12 deviceMemory];
        unint64_t v15 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v14, "count") - 1);

        if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          char v30 = +[MLCLog framework];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceANE allocateDeviceMemoryForSourceAndResultTensorsOfLayer:tensorLabelToIOSurfaceMap:]();
          }

LABEL_25:
          BOOL v28 = 0;
          goto LABEL_26;
        }
        id v16 = [v12 label];
        [v7 setObject:v15 forKeyedSubscript:v16];
      }
      ++v10;
      unint64_t v17 = [v6 sourceTensors];
      unint64_t v18 = [v17 count];
    }
    while (v10 < v18);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int v19 = [v6 resultTensors];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        unint64_t v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [(MLCDeviceANE *)self allocateDeviceMemoryForTensor:v24];
        uint64_t v25 = ANE_GetDeviceMemoryData(v24);
        if (!v25)
        {
          long long v29 = +[MLCLog framework];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceANE allocateDeviceMemoryForSourceAndResultTensorsOfLayer:tensorLabelToIOSurfaceMap:]();
          }

          goto LABEL_25;
        }
        id v26 = (void *)v25;
        id v27 = [v24 label];
        [v7 setObject:v26 forKeyedSubscript:v27];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  *a4 = (id)[v7 copy];
  BOOL v28 = 1;
LABEL_26:

  return v28;
}

- (BOOL)procedureInformationWithModelAttributes:(id)a3 procedureName:(id)a4 procedureID:(unint64_t *)a5 procedureInputSymbols:(id *)a6 procedureInputSymbolIndices:(id *)a7 procedureOutputSymbols:(id *)a8 procedureOutputSymbolIndices:(id *)a9
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  if (softLinkObjcConstantkANEFModelDescriptionKey_once_token != -1) {
    dispatch_once(&softLinkObjcConstantkANEFModelDescriptionKey_once_token, &__block_literal_global_198);
  }
  unint64_t v17 = (void *)softLinkObjcConstantkANEFModelDescriptionKey_constant;
  id v68 = a6;
  if (softLinkObjcConstantkANEFModelProcedureNameToIDMapKey_once_token != -1) {
    dispatch_once(&softLinkObjcConstantkANEFModelProcedureNameToIDMapKey_once_token, &__block_literal_global_201);
  }
  unint64_t v18 = (void *)softLinkObjcConstantkANEFModelProcedureNameToIDMapKey_constant;
  if (softLinkObjcConstantkANEFModelProceduresArrayKey_once_token != -1) {
    dispatch_once(&softLinkObjcConstantkANEFModelProceduresArrayKey_once_token, &__block_literal_global_204);
  }
  int v19 = (void *)softLinkObjcConstantkANEFModelProceduresArrayKey_constant;
  uint64_t v67 = a5;
  if (softLinkObjcConstantkANEFModelInputSymbolIndexArrayKey_once_token != -1) {
    dispatch_once(&softLinkObjcConstantkANEFModelInputSymbolIndexArrayKey_once_token, &__block_literal_global_207);
  }
  uint64_t v20 = (void *)softLinkObjcConstantkANEFModelInputSymbolIndexArrayKey_constant;
  if (softLinkObjcConstantkANEFModelInputSymbolsArrayKey_once_token != -1) {
    dispatch_once(&softLinkObjcConstantkANEFModelInputSymbolsArrayKey_once_token, &__block_literal_global_210);
  }
  uint64_t v21 = (void *)softLinkObjcConstantkANEFModelInputSymbolsArrayKey_constant;
  if (softLinkObjcConstantkANEFModelOutputSymbolIndexArrayKey_once_token != -1) {
    dispatch_once(&softLinkObjcConstantkANEFModelOutputSymbolIndexArrayKey_once_token, &__block_literal_global_213);
  }
  uint64_t v22 = softLinkObjcConstantkANEFModelOutputSymbolIndexArrayKey_constant;
  if (softLinkObjcConstantkANEFModelOutputSymbolsArrayKey_once_token != -1)
  {
    uint64_t v66 = softLinkObjcConstantkANEFModelOutputSymbolIndexArrayKey_constant;
    dispatch_once(&softLinkObjcConstantkANEFModelOutputSymbolsArrayKey_once_token, &__block_literal_global_216);
    uint64_t v22 = v66;
  }
  long long v69 = v15;
  if (v17 && v18 && v19 && v20 && v21 && v22 && softLinkObjcConstantkANEFModelOutputSymbolsArrayKey_constant)
  {
    aSelector = a2;
    v62 = (void *)softLinkObjcConstantkANEFModelOutputSymbolsArrayKey_constant;
    long long v64 = a8;
    long long v65 = (void *)v22;
    id v63 = a7;
    __int16 v23 = [v15 objectForKeyedSubscript:*v17];
    unint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v25 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    id v26 = (void *)[v24 mutableCopy];
    id v27 = [v23 objectForKeyedSubscript:*v18];
    BOOL v28 = [v27 objectForKeyedSubscript:v16];
    id v29 = v16;
    unint64_t v30 = [v28 unsignedIntegerValue];

    unint64_t v31 = v30;
    long long v32 = [v23 objectForKeyedSubscript:*v19];
    unint64_t v33 = [v32 count];
    BOOL v34 = v30 < v33;
    if (v30 >= v33)
    {
      id v16 = v29;
      uint64_t v51 = +[MLCLog framework];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        uint64_t v54 = v53 = v32;
        *(_DWORD *)buf = 138412802;
        long long v81 = v54;
        __int16 v82 = 2048;
        unint64_t v83 = v31;
        __int16 v84 = 2048;
        uint64_t v85 = [v53 count];
        _os_log_error_impl(&dword_1DD0C9000, v51, OS_LOG_TYPE_ERROR, "%@: procedureID=%lu can not exceed the count of procedures=%lu", buf, 0x20u);

        long long v32 = v53;
      }
    }
    else
    {
      BOOL v58 = v29;
      unint64_t v55 = v30;
      uint64_t v56 = v32;
      uint64_t v59 = [v32 objectAtIndexedSubscript:v30];
      long long v35 = [v59 objectForKeyedSubscript:*v20];
      aSelectora = (char *)v23;
      __int16 v36 = [v23 objectForKeyedSubscript:*v21];
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v37 = v35;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v74 objects:v79 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v75;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v75 != v40) {
              objc_enumerationMutation(v37);
            }
            uint64_t v42 = objc_msgSend(v36, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v74 + 1) + 8 * i), "unsignedIntegerValue"));
            [v25 addObject:v42];
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v74 objects:v79 count:16];
        }
        while (v39);
      }
      BOOL v57 = v34;

      uint64_t v43 = [v59 objectForKeyedSubscript:*v65];
      unint64_t v44 = [aSelectora objectForKeyedSubscript:*v62];
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v45 = v43;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v70 objects:v78 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v71;
        do
        {
          for (uint64_t j = 0; j != v47; ++j)
          {
            if (*(void *)v71 != v48) {
              objc_enumerationMutation(v45);
            }
            uint64_t v50 = objc_msgSend(v44, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v70 + 1) + 8 * j), "unsignedIntegerValue"));
            [v26 addObject:v50];
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v70 objects:v78 count:16];
        }
        while (v47);
      }

      *uint64_t v67 = v55;
      *id v68 = (id)[v25 copy];
      id *v63 = (id)[v37 copy];
      *long long v64 = (id)[v26 copy];
      *a9 = (id)[v45 copy];

      id v16 = v58;
      uint64_t v51 = v59;
      __int16 v23 = aSelectora;
      BOOL v34 = v57;
      long long v32 = v56;
    }
  }
  else
  {
    __int16 v23 = +[MLCLog framework];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceANE procedureInformationWithModelAttributes:procedureName:procedureID:procedureInputSymbols:procedureInputSymbolIndices:procedureOutputSymbols:procedureOutputSymbolIndices:](a2);
    }
    BOOL v34 = 0;
  }

  return v34;
}

- (id)ANERequestWithModelAttributes:(id)a3 procedureName:(id)a4 tensorLabelToIOSurfaceMap:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v11 count])
  {
    id v44 = 0;
    uint64_t v45 = -1;
    id v42 = 0;
    id v43 = 0;
    id v41 = 0;
    BOOL v12 = [(MLCDeviceANE *)self procedureInformationWithModelAttributes:v9 procedureName:v10 procedureID:&v45 procedureInputSymbols:&v44 procedureInputSymbolIndices:&v43 procedureOutputSymbols:&v42 procedureOutputSymbolIndices:&v41];
    id v13 = v44;
    id v14 = v43;
    id v39 = v42;
    id v15 = v41;
    uint64_t v38 = v13;
    if (v12)
    {
      id v37 = v10;
      id v16 = (void *)MEMORY[0x1E4F1CBF0];
      os_log_t log = (os_log_t)[MEMORY[0x1E4F1CBF0] mutableCopy];
      unint64_t v17 = (void *)[v16 mutableCopy];
      if ([v14 count])
      {
        uint64_t v18 = 0;
        while (1)
        {
          int v19 = [v14 objectAtIndexedSubscript:v18];
          [v17 addObject:v19];

          uint64_t v20 = [v13 objectAtIndexedSubscript:v18];
          uint64_t v21 = [v11 objectForKeyedSubscript:v20];
          uint64_t v22 = [v21 ioSurfaceObject];

          if (!v22) {
            break;
          }
          [log addObject:v22];

          if (++v18 >= (unint64_t)[v14 count]) {
            goto LABEL_7;
          }
        }
        unint64_t v24 = +[MLCLog framework];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceANE ANERequestWithModelAttributes:procedureName:tensorLabelToIOSurfaceMap:]();
        }
        unint64_t v31 = 0;
        id v10 = v37;
      }
      else
      {
LABEL_7:
        id v36 = v9;
        __int16 v23 = (void *)MEMORY[0x1E4F1CBF0];
        uint64_t v20 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        unint64_t v24 = [v23 mutableCopy];
        if ([v15 count])
        {
          uint64_t v25 = 0;
          while (1)
          {
            id v26 = [v15 objectAtIndexedSubscript:v25];
            [v24 addObject:v26];

            id v27 = [v39 objectAtIndexedSubscript:v25];
            BOOL v28 = [v11 objectForKeyedSubscript:v27];
            id v29 = [v28 ioSurfaceObject];

            if (!v29) {
              break;
            }
            [v20 addObject:v29];

            if (++v25 >= (unint64_t)[v15 count]) {
              goto LABEL_11;
            }
          }
          unint64_t v33 = +[MLCLog framework];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceANE ANERequestWithModelAttributes:procedureName:tensorLabelToIOSurfaceMap:]();
          }

          unint64_t v31 = 0;
        }
        else
        {
LABEL_11:
          id v30 = softLinkClass_ANERequest();
          id v27 = [NSNumber numberWithUnsignedInteger:v45];
          unint64_t v31 = [v30 requestWithInputs:log inputIndices:v17 outputs:v20 outputIndices:v24 procedureIndex:v27];
        }
        id v9 = v36;
        id v10 = v37;
      }
    }
    else
    {
      os_log_t log = +[MLCLog framework];
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        long long v35 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v47 = v35;
        __int16 v48 = 2112;
        id v49 = v10;
        __int16 v50 = 2112;
        id v51 = v9;
        _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%@: failed to get procedure information for procedure name=%@ from model attributes=%@", buf, 0x20u);
      }
      unint64_t v31 = 0;
    }
  }
  else
  {
    long long v32 = +[MLCLog framework];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceANE ANERequestWithModelAttributes:procedureName:tensorLabelToIOSurfaceMap:](a2);
    }

    unint64_t v31 = 0;
  }

  return v31;
}

- (BOOL)postProcessCompiledGraph:(id)a3 compilerOptions:(unint64_t)a4
{
  char v4 = a4;
  v106[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 graphLayerList];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    uint64_t v25 = +[MLCLog framework];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:]();
    }
    BOOL v27 = 0;
    goto LABEL_88;
  }
  unint64_t v83 = self;
  uint64_t v9 = v4 & 6;
  long long v74 = [MEMORY[0x1E4F1CBF0] mutableCopy];
  id v10 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  id v11 = [v6 graphLayerList];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    do
    {
      id v14 = [v6 graphLayerList];
      id v15 = [v14 objectAtIndexedSubscript:v13];

      if (([v15 skipLayer] & 1) == 0 && ANE_IsAneCompiledLayer(v15))
      {
        obuint64_t j = v15;
        id v16 = [v15 deviceOps];
        unint64_t v17 = [v16 objectAtIndexedSubscript:0];
        uint64_t v18 = [v17 plistBuilder];

        if (!v18)
        {
          uint64_t v67 = +[MLCLog framework];
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.8();
          }

          goto LABEL_86;
        }
        int v19 = [NSNumber numberWithUnsignedLong:v18];
        uint64_t v20 = [v10 objectForKeyedSubscript:v19];

        if (v20)
        {
          uint64_t v21 = [v10 objectForKeyedSubscript:v19];
          [v21 addObject:obj];
        }
        else
        {
          [v74 addObject:v18];
          v106[0] = obj;
          uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:1];
          uint64_t v22 = (void *)[v21 mutableCopy];
          [v10 setObject:v22 forKeyedSubscript:v19];
        }
        if (v9 && ([v18 buildProcedureWithLayer:obj] & 1) == 0)
        {
          id v68 = +[MLCLog framework];
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.9();
          }

LABEL_86:
          BOOL v27 = 0;
          uint64_t v25 = v74;
          goto LABEL_87;
        }

        id v15 = obj;
      }

      ++v13;
      __int16 v23 = [v6 graphLayerList];
      unint64_t v24 = [v23 count];
    }
    while (v13 < v24);
  }
  uint64_t v25 = v74;
  if (![v74 count])
  {
    obuint64_t j = +[MLCLog framework];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
      -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:](a2, obj);
    }
    goto LABEL_74;
  }
  unint64_t v26 = [v74 count];
  if (v9)
  {
    if (v26 > 0x10)
    {
      obuint64_t j = +[MLCLog framework];
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.7();
      }
LABEL_82:
      BOOL v27 = 0;
      goto LABEL_87;
    }
  }
  else if (v26 != 1)
  {
    obuint64_t j = +[MLCLog framework];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.6(a2);
    }
    goto LABEL_82;
  }
  long long v94 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v91 = 0u;
  obuint64_t j = v74;
  uint64_t v77 = [obj countByEnumeratingWithState:&v91 objects:v105 count:16];
  if (!v77)
  {
LABEL_74:
    BOOL v27 = 1;
    goto LABEL_87;
  }
  long long v73 = v10;
  uint64_t v29 = *(void *)v92;
  id v71 = v6;
  *(void *)&long long v28 = 138412546;
  long long v70 = v28;
  id v30 = obj;
  unint64_t v31 = v83;
  uint64_t v76 = *(void *)v92;
  while (2)
  {
    uint64_t v32 = 0;
    do
    {
      if (*(void *)v92 != v29) {
        objc_enumerationMutation(v30);
      }
      unint64_t v33 = *(void **)(*((void *)&v91 + 1) + 8 * v32);
      unsigned int v81 = [softLinkClass_ANEQoSMapper() aneUserInteractiveTaskQoS];
      BOOL v34 = [v33 plist];
      long long v35 = (void *)[v34 copy];

      id v36 = (void *)MEMORY[0x1E01B11E0]();
      id v37 = [v33 weightOps];
      uint64_t v38 = [v37 weights];
      id v39 = (void *)[v38 copy];

      if (+[MLCPlatformInfo isAnePlistKept]) {
        ANE_WriteANEModelFiles(v35, v39);
      }
      id v90 = 0;
      long long v79 = v35;
      uint64_t v40 = objc_msgSend(MEMORY[0x1E4F28F98], "dataWithPropertyList:format:options:error:", v35, 100, 0, &v90, v70);
      id v41 = v90;
      uint64_t v78 = v32;
      if (v40)
      {
        id v42 = [softLinkClass_ANEInMemoryModelDescriptor() modelWithNetworkDescription:v40 weights:v39 optionsPlist:0];
        if (v42)
        {
          id v43 = [softLinkClass_ANEInMemoryModel() inMemoryModelWithDescriptor:v42];
          id v89 = v41;
          char v44 = [v43 loadWithQoS:v81 options:MEMORY[0x1E4F1CC08] error:&v89];
          id v45 = v89;

          [v33 releaseWeights];
          if (v44)
          {
            int v46 = 1;
            id v41 = v45;
            unint64_t v31 = v83;
            goto LABEL_47;
          }
          uint64_t v47 = +[MLCLog framework];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            long long v65 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            v98 = v65;
            __int16 v99 = 2112;
            id v100 = v43;
            __int16 v101 = 2112;
            id v102 = v45;
            _os_log_error_impl(&dword_1DD0C9000, v47, OS_LOG_TYPE_ERROR, "%@: failed to load model=%@ : error=%@", buf, 0x20u);
          }
          id v41 = v45;
          unint64_t v31 = v83;
        }
        else
        {
          uint64_t v47 = +[MLCLog framework];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.5((uint64_t)v103, (uint64_t)a2);
          }
          id v43 = 0;
        }
      }
      else
      {
        id v42 = +[MLCLog framework];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.4((uint64_t)v104, (uint64_t)a2);
        }
        id v43 = 0;
      }
      int v46 = 0;
LABEL_47:

      if (v46)
      {
        __int16 v82 = +[_MLCANEModel objectWithModel:v43 options:MEMORY[0x1E4F1CC08] qos:v81 plist:v79];
        uint64_t v48 = [NSNumber numberWithUnsignedLong:v33];
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v75 = (void *)v48;
        id v49 = objc_msgSend(v73, "objectForKeyedSubscript:");
        uint64_t v50 = [v49 countByEnumeratingWithState:&v85 objects:v96 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v86;
          while (2)
          {
            for (uint64_t i = 0; i != v51; ++i)
            {
              if (*(void *)v86 != v52) {
                objc_enumerationMutation(v49);
              }
              uint64_t v54 = *(void **)(*((void *)&v85 + 1) + 8 * i);
              uint64_t v55 = [v54 deviceOps];
              uint64_t v56 = [(id)v55 objectAtIndexedSubscript:0];

              id v84 = 0;
              LOBYTE(v55) = [(MLCDeviceANE *)v31 allocateDeviceMemoryForSourceAndResultTensorsOfLayer:v54 tensorLabelToIOSurfaceMap:&v84];
              id v57 = v84;
              if ((v55 & 1) == 0)
              {
                long long v64 = +[MLCLog framework];
                if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v66 = NSStringFromSelector(a2);
                  *(_DWORD *)buf = v70;
                  v98 = v66;
                  __int16 v99 = 2112;
                  id v100 = v54;
                  _os_log_error_impl(&dword_1DD0C9000, v64, OS_LOG_TYPE_ERROR, "%@: failed to allocate device memory for source and result tensors of layer=%@", buf, 0x16u);
                }
                int v62 = 1;
                goto LABEL_69;
              }
              BOOL v58 = [v56 procedureName];
              uint64_t v59 = [v43 modelAttributes];
              uint64_t v60 = [(MLCDeviceANE *)v31 ANERequestWithModelAttributes:v59 procedureName:v58 tensorLabelToIOSurfaceMap:v57];

              if (v60)
              {
                [v56 setRequest:v60];
                [v56 setModel:v82];
              }
              else
              {
                id v61 = +[MLCLog framework];
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                  -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:]((uint64_t)v95, (uint64_t)a2);
                }
              }
              if (!v60)
              {
                int v62 = 1;
                unint64_t v31 = v83;
                goto LABEL_69;
              }
              unint64_t v31 = v83;
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v85 objects:v96 count:16];
            int v62 = 0;
            if (v51) {
              continue;
            }
            break;
          }
        }
        else
        {
          int v62 = 0;
        }
LABEL_69:

        uint64_t v29 = v76;
        id v63 = v79;
      }
      else
      {
        int v62 = 1;
        id v63 = v79;
        uint64_t v29 = v76;
      }

      if (v62)
      {
        BOOL v27 = 0;
        goto LABEL_76;
      }
      uint64_t v32 = v78 + 1;
      id v30 = obj;
    }
    while (v78 + 1 != v77);
    BOOL v27 = 1;
    uint64_t v77 = [obj countByEnumeratingWithState:&v91 objects:v105 count:16];
    if (v77) {
      continue;
    }
    break;
  }
LABEL_76:
  id v6 = v71;
  id v10 = v73;
  uint64_t v25 = v74;
LABEL_87:

LABEL_88:
  return v27;
}

- (BOOL)transferTensor:(id)a3 fromDevice:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (MLCDeviceANE *)a4;
  if (!v8 || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), self == v8) && (isKindOfClass & 1) != 0)
  {
    BOOL v10 = 1;
    goto LABEL_5;
  }
  uint64_t v12 = [v7 deviceIndex];
  unint64_t v13 = [v7 deviceMemory];
  id v14 = [v13 objectAtIndexedSubscript:v12];
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if (v15)
  {
    id v16 = [v7 deviceMemory];
    uint64_t v17 = [v16 count];

    uint64_t v18 = [v7 deviceMemory];
    uint64_t v19 = [v18 count];

    if (v19 == 1)
    {
      [(MLCDeviceANE *)self allocateDeviceMemoryForTensor:v7];
      uint64_t v20 = [v7 deviceMemory];
      if ([v20 count] == 1)
      {

        goto LABEL_20;
      }
      id v30 = [v7 deviceMemory];
      uint64_t v17 = 1;
      unint64_t v31 = [v30 objectAtIndexedSubscript:1];
      objc_opt_class();
      char v32 = objc_opt_isKindOfClass();

      if ((v32 & 1) == 0)
      {
LABEL_20:
        unint64_t v33 = +[MLCLog framework];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceANE transferTensor:fromDevice:]();
        }
LABEL_24:
        int v34 = 1;
LABEL_37:

        BOOL v10 = v34 == 0;
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v22 = [v7 deviceMemory];
      uint64_t v23 = [v22 count];

      if (v23 != 2)
      {
        unint64_t v33 = +[MLCLog framework];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceANE transferTensor:fromDevice:].cold.4();
        }
        goto LABEL_24;
      }
      unint64_t v24 = [v7 deviceMemory];
      uint64_t v25 = [v24 count];

      if (v25)
      {
        uint64_t v26 = 0;
        while (1)
        {
          BOOL v27 = [v7 deviceMemory];
          long long v28 = [v27 objectAtIndexedSubscript:v26];
          objc_opt_class();
          char v29 = objc_opt_isKindOfClass();

          if (v29) {
            break;
          }
          if (v25 == ++v26) {
            goto LABEL_26;
          }
        }
        uint64_t v17 = v26;
      }
    }
LABEL_26:
    uint64_t v35 = [v7 calculateBatchSizeToUse];
    id v36 = [v7 deviceMemory];
    unint64_t v33 = [v36 objectAtIndexedSubscript:v17];

    id v37 = [v33 liveIOStatus];
    uint64_t v38 = v37;
    if (v37 && [v37 count])
    {
      id v39 = [v33 ioSurfaceObject];
      uint64_t v40 = (__IOSurface *)[v39 ioSurface];

      IOSurfaceLock(v40, 0, 0);
      BaseAddress = (char *)IOSurfaceGetBaseAddress(v40);
      [v7 deviceMemory];
      v42 = unint64_t v41 = v35;
      id v43 = [(id)v42 objectAtIndexedSubscript:v12];

      char v44 = v43;
      LOBYTE(v42) = ANE_ConvertInputTensor(v7, v38, (char *)[v44 bytes], [v44 length], BaseAddress, v41);
      IOSurfaceUnlock(v40, 0, 0);
      if (v42)
      {
        [v7 setDeviceIndex:v17];
        int v34 = 0;
LABEL_36:

        goto LABEL_37;
      }
      id v45 = +[MLCLog framework];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceANE transferTensor:fromDevice:]();
      }
    }
    else
    {
      char v44 = +[MLCLog framework];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceANE transferTensor:fromDevice:]();
      }
    }
    int v34 = 1;
    goto LABEL_36;
  }
  uint64_t v21 = +[MLCLog framework];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v46 = NSStringFromSelector(a2);
    uint64_t v47 = [v7 deviceMemory];
    uint64_t v48 = [v47 objectAtIndexedSubscript:v12];
    *(_DWORD *)buf = 138412546;
    uint64_t v52 = v46;
    __int16 v53 = 2112;
    id v54 = (id)objc_opt_class();
    id v49 = v54;
    _os_log_error_impl(&dword_1DD0C9000, v21, OS_LOG_TYPE_ERROR, "%@: unsupported device memory class=%@", buf, 0x16u);
  }
  BOOL v10 = 0;
LABEL_5:

  return v10;
}

- (void)setDeviceMemoryForTensor:(id)a3 data:(id)a4
{
  id v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE setDeviceMemoryForTensor:data:](a2);
  }
}

- (BOOL)updateDeviceMemoryForTensor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 deviceMemory];
  uint64_t v6 = [v5 count];

  if (!v6) {
    goto LABEL_13;
  }
  id v7 = [v4 deviceMemory];
  unint64_t v8 = [v7 count];

  if (v8 < 3)
  {
    BOOL v10 = [v4 deviceMemory];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
LABEL_9:
      uint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceANE updateDeviceMemoryForTensor:](a2);
      }
      goto LABEL_11;
    }
    uint64_t v12 = 0;
    while (1)
    {
      unint64_t v13 = [v4 deviceMemory];
      id v14 = [v13 objectAtIndexedSubscript:v12];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      if (v11 == ++v12) {
        goto LABEL_9;
      }
    }
    [v4 setDeviceIndex:v12];
LABEL_13:
    BOOL v16 = 1;
    goto LABEL_14;
  }
  uint64_t v9 = +[MLCLog framework];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE updateDeviceMemoryForTensor:](a2);
  }
LABEL_11:

  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (NSArray)deviceList
{
  return self->_deviceList;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
}

- (void)dispatchForwardLayer:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectAtIndexedSubscript:0];
  id v5 = [v4 model];
  uint64_t v6 = [v5 anefModel];

  id v7 = [v4 request];
  unint64_t v8 = [v4 model];
  uint64_t v9 = [v8 qos];
  BOOL v10 = [v4 model];
  uint64_t v11 = [v10 options];
  id v16 = 0;
  char v12 = [v6 evaluateWithQoS:v9 options:v11 request:v7 error:&v16];
  id v13 = v16;

  if ((v12 & 1) == 0)
  {
    id v14 = +[MLCLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      char v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v6;
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_error_impl(&dword_1DD0C9000, v14, OS_LOG_TYPE_ERROR, "%@: failed to evaluate model=%@ : error=%@", buf, 0x20u);
    }
  }
}

- (void)dispatchForwardConcatLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchForwardSplitLayer:(id)a3 sourceTensor:(id)a4 resultTensors:(id)a5
{
  uint64_t v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchGradientConcatLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5
{
  uint64_t v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchGradientSplitLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensor:(id)a5
{
  uint64_t v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchForwardFullyConnectedLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
}

- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 tertiaryTensor:(id)a6 resultTensor:(id)a7 resultStateIsTemporary:(BOOL)a8 forTraining:(BOOL)a9
{
  BOOL v10 = +[MLCLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchForwardFusedArithmeticLayerNormalizationLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  id v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE setDeviceMemoryForTensor:data:](a2);
  }
}

- (void)dispatchForwardLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultStateIsTemporary:(BOOL)a9 forTraining:(BOOL)a10
{
  uint64_t v11 = +[MLCLog framework];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
  uint64_t v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 secondaryResultGradientTensor:(id)a6
{
  id v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchGradientLossLayer:(id)a3 sourceGradientTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultGradientTensor:(id)a8
{
  uint64_t v9 = +[MLCLog framework];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchForwardAndGradientLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultGradientTensor:(id)a9
{
  BOOL v10 = +[MLCLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5
{
  uint64_t v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchRNNGradientLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensors:(id)a5
{
  uint64_t v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)incrementReadCountForTensorDeviceMemory:(id)a3 increment:(int64_t)a4
{
  id v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)incrementReadCountForGradientState:(id)a3 increment:(int64_t)a4
{
  id v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchForwardMHALayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchGradientMHALayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5 resultStateIsTemporary:(BOOL)a6
{
  id v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchForwardMatMulLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchGradientMatMulLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5
{
  uint64_t v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchForwardSliceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  id v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchForwardReshapeLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchGradientSliceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
  uint64_t v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchGradientReshapeLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
  uint64_t v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchForwardEmbeddingLayer:(id)a3 weight:(id)a4 sourceTensor:(id)a5 resultTensor:(id)a6
{
  id v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchGradientEmbeddingLayer:(id)a3 sourceGradientTensor:(id)a4
{
  id v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)dispatchForwardReduceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7 forTraining:(BOOL)a8
{
  uint64_t v9 = +[MLCLog framework];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE setDeviceMemoryForTensor:data:](a2);
  }
}

- (void)dispatchGradientReduceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE setDeviceMemoryForTensor:data:](a2);
  }
}

- (void)dispatchForwardSelectLayer:(id)a3 conditionTensor:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6 forTraining:(BOOL)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE setDeviceMemoryForTensor:data:](a2);
  }
}

- (void)dispatchGradientSelectLayer:(id)a3 conditionTensor:(id)a4 sourceGradientTensor:(id)a5 resultGradientTensors:(id)a6
{
  id v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE setDeviceMemoryForTensor:data:](a2);
  }
}

- (void)dispatchForwardCompareLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 resultTensor:(id)a6 compareOp:(int)a7 forTraining:(BOOL)a8
{
  uint64_t v9 = +[MLCLog framework];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE setDeviceMemoryForTensor:data:](a2);
  }
}

- (void)optimizeComputationForTrainingGraph:(id)a3
{
  id v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE setDeviceMemoryForTensor:data:](a2);
  }
}

- (void)dispatchForwardGatherLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  id v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE setDeviceMemoryForTensor:data:](a2);
  }
}

- (void)dispatchForwardScatterLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  id v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE setDeviceMemoryForTensor:data:](a2);
  }
}

- (void)sumSharedGradientsForConvolutionLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4
{
  id v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }
}

- (void)sumSharedGradientsForNormalizationLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4 isBetaTensor:(BOOL)a5
{
  uint64_t v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:](a2);
  }
}

- (void)updateConvolutionLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)updateFullyConnectedLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)updateBatchNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 meanTensor:(id)a7 varianceTensor:(id)a8 arrayOfParams:(id)a9
{
  BOOL v10 = +[MLCLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)updateInstanceNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)updateLayerNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)updateGroupNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)updateRNNLayer:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8
{
  uint64_t v9 = +[MLCLog framework];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)restoreRNNParamsWithDeviceOps:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8
{
  uint64_t v9 = +[MLCLog framework];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)updateTensorParameter:(id)a3 optimizer:(id)a4 gradient:(id)a5 arrayOfParams:(id)a6
{
  id v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)updateMultiheadAttentionLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)updateEmbeddingLayer:(id)a3 weightsParameter:(id)a4 optimizer:(id)a5 arrayOfParams:(id)a6
{
  id v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)synchronizeUpdatesForLayer:(id)a3
{
  id v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)synchronizeOptimizerUpdatesForTensor:(id)a3
{
  id v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)convertUpdatesToTensorDataForLayer:(id)a3
{
  id v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)convertUpdatesToTensorDataForTensorParameters:(id)a3
{
  id v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)setOptimizerLearningRate:(id)a3 learningRate:(float)a4
{
  id v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)setOptimizerTimeStep:(id)a3 timeStep:(unint64_t)a4
{
  id v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)reloadParameterDataFromHostToDeviceMemoryForTensor:(id)a3
{
  id v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)accumulateParams:(void *)a3 gradients:(void *)a4 accumulators:(void *)a5 numOfParameters:(unint64_t)a6 inArrayOfParams:(id)a7
{
  unint64_t v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)updateAllParametersWithOptimizer:(id)a3 arrayOfParameters:(id)a4
{
  id v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:](a2);
  }
}

- (void)initWithType:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: no Apple Neural Engine available", v4, v5, v6, v7, v8);
}

- (void)allocateDeviceMemoryForTensor:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: invalid device memory size=%lu", v4, v5, v6, v7, v8);
}

- (void)allocateDeviceMemoryForTensor:(NSObject *)a3 .cold.2(const char *a1, int a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: failed to get the ANEC IR data type from MLCompute data type=%d", v6, 0x12u);
}

- (void)allocateDeviceMemoryForTensor:(const char *)a1 .cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: failed to allocate device memory", v4, v5, v6, v7, v8);
}

- (void)getHostPointerIfUnifiedDeviceMemory:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: no IOSurface allocated for tensor=%@", v2, v3, v4, v5, 2u);
}

- (void)readTensor:fromDeviceIndex:targetBuffer:batchSize:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to read tensor=%@", v4, v5, v6, v7, v8);
}

- (void)writeToDevice:toDeviceIndex:batchSize:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: the device memory has not been allocated for tensor=%@", v4, v5, v6, v7, v8);
}

- (void)writeToDevice:toDeviceIndex:batchSize:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: empty liveIOStatus in tensor=%@", v4, v5, v6, v7, v8);
}

- (void)writeToDevice:toDeviceIndex:batchSize:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to write tensor=%@", v4, v5, v6, v7, v8);
}

- (void)writeToDevice:(const char *)a1 toDeviceIndex:batchSize:.cold.4(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Tensor's device memory was not converted to ANE data structure", v4, v5, v6, v7, v8);
}

- (void)allocateDeviceMemoryForSourceAndResultTensorsOfLayer:tensorLabelToIOSurfaceMap:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to allocate device memory for tensor=%@", v4, v5, v6, v7, v8);
}

- (void)procedureInformationWithModelAttributes:(const char *)a1 procedureName:procedureID:procedureInputSymbols:procedureInputSymbolIndices:procedureOutputSymbols:procedureOutputSymbolIndices:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: one or more AppleNeuralEngine symbols cannot be found", v4, v5, v6, v7, v8);
}

- (void)ANERequestWithModelAttributes:(const char *)a1 procedureName:tensorLabelToIOSurfaceMap:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: empty tensor label to ioSurface map", v4, v5, v6, v7, v8);
}

- (void)ANERequestWithModelAttributes:procedureName:tensorLabelToIOSurfaceMap:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: can not find the IOSurface object of result tensor label=%@", v4, v5, v6, v7, v8);
}

- (void)ANERequestWithModelAttributes:procedureName:tensorLabelToIOSurfaceMap:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: can not find the IOSurface object of source tensor label=%@", v4, v5, v6, v7, v8);
}

- (void)postProcessCompiledGraph:compilerOptions:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: no layers in graph : %@", v4, v5, v6, v7, v8);
}

- (void)postProcessCompiledGraph:(const char *)a1 compilerOptions:(NSObject *)a2 .cold.2(const char *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_DEBUG, "%@: no ANE compiled layer in the graph", v4, 0xCu);
}

- (void)postProcessCompiledGraph:(uint64_t)a1 compilerOptions:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_7_1(a1, a2);
  uint64_t v5 = NSStringFromSelector(v4);
  *uint64_t v3 = 138412290;
  *uint64_t v2 = v5;
  OUTLINED_FUNCTION_6_1(&dword_1DD0C9000, v6, v7, "%@: failed to build an ANE request");
}

- (void)postProcessCompiledGraph:(uint64_t)a1 compilerOptions:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_7_1(a1, a2);
  uint64_t v5 = NSStringFromSelector(v4);
  *uint64_t v3 = 138412290;
  *uint64_t v2 = v5;
  OUTLINED_FUNCTION_6_1(&dword_1DD0C9000, v6, v7, "%@: failed to convert the ANEC IR plist in dictionary to NSData");
}

- (void)postProcessCompiledGraph:(uint64_t)a1 compilerOptions:(uint64_t)a2 .cold.5(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_7_1(a1, a2);
  uint64_t v5 = NSStringFromSelector(v4);
  *uint64_t v3 = 138412290;
  *uint64_t v2 = v5;
  OUTLINED_FUNCTION_6_1(&dword_1DD0C9000, v6, v7, "%@: failed to create ANE model descriptor");
}

- (void)postProcessCompiledGraph:(const char *)a1 compilerOptions:.cold.6(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: there must be only one plist when layer fusion is enabled", v4, v5, v6, v7, v8);
}

- (void)postProcessCompiledGraph:compilerOptions:.cold.7()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: there are at most %lu plists when layer fusion is disabled", v4, v5, v6, v7, v8);
}

- (void)postProcessCompiledGraph:compilerOptions:.cold.8()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: layer=%@ compiled for ANE device does not have a plist builder instance bound", v4, v5, v6, v7, v8);
}

- (void)postProcessCompiledGraph:compilerOptions:.cold.9()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to build an ANEC IR procedure with layer=%@", v4, v5, v6, v7, v8);
}

- (void)transferTensor:fromDevice:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to allocate ANEIOSurface for a tensor = %@", v4, v5, v6, v7, v8);
}

- (void)transferTensor:fromDevice:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: empty liveIOStatus in tensor = %@", v4, v5, v6, v7, v8);
}

- (void)transferTensor:fromDevice:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to write tensor = %@ to ANE device", v4, v5, v6, v7, v8);
}

- (void)transferTensor:fromDevice:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: tensor = %@ shouldn't have more than 2 elements within deviceMemory", v4, v5, v6, v7, v8);
}

- (void)setDeviceMemoryForTensor:(const char *)a1 data:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: not supported", v4, v5, v6, v7, v8);
}

- (void)updateDeviceMemoryForTensor:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: unsupported number of device memory", v4, v5, v6, v7, v8);
}

- (void)updateDeviceMemoryForTensor:(const char *)a1 .cold.2(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: cannot find IOSurface in device memory", v4, v5, v6, v7, v8);
}

@end