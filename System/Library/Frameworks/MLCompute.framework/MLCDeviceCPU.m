@interface MLCDeviceCPU
- ($ADD8B2928F54472B65CB84445603561F)getGateDesc:(SEL)a3 lstmParams:(unint64_t)a4;
- (BOOL)compileLayerDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)compileLayerDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5;
- (BOOL)needToAllocateDeviceMemoryForTensor:(id)a3;
- (BOOL)setConvolutionLayerOptimizerDataForDeviceOps:(id)a3 weights:(id)a4 bias:(id)a5;
- (BOOL)setLSTMLayerOptimizerDataForDeviceOps:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 biasTerms:(id)a6;
- (BOOL)setMHALayerOptimizerDataForDeviceOps:(id)a3 optimizerDataForWeights:(id)a4 optimizerDataForBias:(id)a5;
- (BOOL)setNormalizationLayerOptimizerDataForDeviceOps:(id)a3 beta:(id)a4 gamma:(id)a5;
- (BOOL)shareDeviceMemoryWithResultTensor:(id)a3 sourceTensor:(id)a4;
- (BOOL)synchronizeTensor:(id)a3;
- (BOOL)transferTensor:(id)a3 fromDevice:(id)a4;
- (BOOL)updateDeviceMemoryForTensor:(id)a3;
- (MLCDeviceCPU)initWithType:(int)a3;
- (NSArray)deviceList;
- (NSData)deviceHeap;
- (NSString)description;
- (id)arithmeticLayerWithOperation:(int)a3 activationDescriptor:(id)a4;
- (id)batchNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9;
- (id)betaGradients:(id)a3;
- (id)biasesGradients:(id)a3;
- (id)compareLayerWithOperation:(int)a3;
- (id)convolutionLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5;
- (id)convolutionTransposeLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createOptimizerDeviceDataForTensor:(id)a3 optimizer:(id)a4 optimizerData:(id)a5 isVector:(BOOL)a6;
- (id)dropoutLayerWithRate:(float)a3 seed:(unint64_t)a4;
- (id)embeddingLayerWithDescriptor:(id)a3 weights:(id)a4 inferenceOnly:(BOOL)a5;
- (id)embeddingWeightsGradients:(id)a3 embeddingCount:(unint64_t)a4 embeddingDimension:(unint64_t)a5;
- (id)fullyConnectedLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5;
- (id)fusedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10;
- (id)fusedConvolutionAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6;
- (id)fusedConvolutionBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9 neuronDescriptor:(id)a10 weights:(id)a11 biasTerms:(id)a12;
- (id)fusedConvolutionGroupNormalizationAndNeuronLayerWithDescriptor:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6 momentum:(float)a7 groupCount:(unint64_t)a8 neuronDescriptor:(id)a9 weights:(id)a10 biasTerms:(id)a11;
- (id)fusedConvolutionInstanceNormalizationAndNeuronLayerWithDescriptor:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6 momentum:(float)a7 neuronDescriptor:(id)a8 weights:(id)a9 biasTerms:(id)a10;
- (id)fusedFullyConnectedAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6;
- (id)fusedFullyConnectedAndSoftmaxLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5 softmaxOp:(int)a6;
- (id)fusedFullyConnectedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9 neuronDescriptor:(id)a10 weights:(id)a11 biasTerms:(id)a12;
- (id)fusedGroupNormalizationAndNeuronLayerWithDescriptor:(id)a3 featureChannelCount:(unint64_t)a4 groupCount:(unint64_t)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8;
- (id)fusedInstanceNormalizationAndNeuronLayerWithDescriptor:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10;
- (id)fusedLayerNormalizationAndNeuronLayerWithDescriptor:(id)a3 normalizedShape:(id)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7;
- (id)gammaGradients:(id)a3;
- (id)gatherLayerWithDimension:(unint64_t)a3;
- (id)getHostPointerIfUnifiedDeviceMemory:(id)a3;
- (id)gramMatrixLayerWithScaleFactor:(float)a3;
- (id)groupNormalizationLayerWithFeatureChannelCount:(unint64_t)a3 groupCount:(unint64_t)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7;
- (id)instanceNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9;
- (id)layerNormalizationLayerWithNormalizedShape:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6 isFusedWithArithmeticLayer:(BOOL)a7;
- (id)lossLayerWithDescriptor:(id)a3;
- (id)lossYOLOLayerWithDescriptor:(id)a3;
- (id)lstmBiasGradient:(id)a3 mlcBiasIndex:(unint64_t)a4;
- (id)lstmHiddenWeightGradient:(id)a3 mlcWeightIndex:(unint64_t)a4;
- (id)lstmInputWeightGradient:(id)a3 mlcWeightIndex:(unint64_t)a4;
- (id)lstmLayerWithDescriptor:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 peepholeWeights:(id)a6 biasTerms:(id)a7 gateActivations:(id)a8 outputResultActivation:(id)a9 inferenceOnly:(BOOL)a10;
- (id)matMulLayerWithDescriptor:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 inferenceOnly:(BOOL)a6;
- (id)mhaAttnBiasGradient:(id)a3 withSize:(unint64_t)a4 index:(unint64_t)a5;
- (id)mhaBiasGradient:(id)a3 withSize:(unint64_t)a4 index:(unint64_t)a5;
- (id)mhaWeightGradient:(id)a3 withSize:(unint64_t)a4 index:(unint64_t)a5;
- (id)multiheadAttentionLayerWithDescriptor:(id)a3 weights:(id)a4 bias:(id)a5 attnBias:(id)a6 inferenceOnly:(BOOL)a7;
- (id)neuronLayerWithDescriptor:(id)a3;
- (id)optimizerAdamWithDescriptor:(id)a3 beta1:(float)a4 beta2:(float)a5 epsilon:(float)a6 amsgrad:(BOOL)a7 timeStep:(unint64_t)a8 isAdamW:(BOOL)a9;
- (id)optimizerRMSPropWithDescriptor:(id)a3 momentumScale:(float)a4 alpha:(float)a5 epsilon:(float)a6 centered:(BOOL)a7;
- (id)optimizerSGDWithDescriptor:(id)a3 momentunScale:(float)a4 useNesterovMomentum:(BOOL)a5;
- (id)paddingLayerWithPaddingType:(int)a3 paddingLeft:(unint64_t)a4 paddingRight:(unint64_t)a5 paddingTop:(unint64_t)a6 paddingBottom:(unint64_t)a7 constantValue:(float)a8 dataType:(int)a9;
- (id)poolingLayerWithDescriptor:(id)a3 paddingSizes:(unint64_t *)a4;
- (id)readFromDevice:(id)a3 deviceIndex:(unint64_t)a4 allocateData:(BOOL)a5 batchSize:(unint64_t)a6;
- (id)readTensor:(id)a3;
- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4;
- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 batchSize:(unint64_t)a5;
- (id)reductionLayerWithReduceType:(int)a3 dimensions:(id)a4 sourceShapeCount:(unint64_t)a5;
- (id)reshapeLayerWithShape:(id)a3;
- (id)scatterLayerWithDimension:(unint64_t)a3 reduceType:(int)a4;
- (id)selectLayer;
- (id)sliceLayerWithbegin:(id)a3 end:(id)a4 stride:(id)a5 inferenceOnly:(BOOL)a6;
- (id)softmaxLayerWithOperation:(int)a3 dimension:(unint64_t)a4 sourceShapeCount:(unint64_t)a5;
- (id)splitLayerWithDimension:(unint64_t)a3;
- (id)transposeLayerWithShape:(id)a3;
- (id)upsampleLayerWithScaleFactorX:(float)a3 scaleFactorY:(float)a4 sampleMode:(int)a5 alignCorners:(BOOL)a6;
- (id)weightsGradients:(id)a3;
- (int)deviceType;
- (unint64_t)allocatedDeviceDataSizeForTraining:(BOOL)a3 layer:(id)a4;
- (unint64_t)deviceMemorySizeForTensor:(id)a3;
- (unint64_t)deviceMemorySizeForTensor:(id)a3 batchSize:(unint64_t)a4;
- (unint64_t)numDevices;
- (void)accumulateParams:(void *)a3 gradients:(void *)a4 accumulators:(void *)a5 numOfParameters:(unint64_t)a6 inArrayOfParams:(id)a7;
- (void)allocateDeviceDataForGlobalNormClippingWithOptimizer:(id)a3 updatableParameterCount:(unint64_t)a4;
- (void)allocateDeviceMemoryForTensor:(id)a3;
- (void)allocateParameterGradientsForDeviceOps:(id)a3 parameters:(id)a4;
- (void)allocateResultTensor:(id)a3;
- (void)broadcastTensor:(id)a3;
- (void)broadcastTensor:(id)a3 batchSize:(unint64_t)a4;
- (void)commitAndWaitForCompletion:(id)a3;
- (void)commitAndWaitForCompletion:(id)a3 enableProfiling:(BOOL)a4 graphExecutionTime:(id)a5 graphResultTensor:(id)a6;
- (void)commitWithCompletionHandler:(id)a3 enableProfiling:(BOOL)a4 graphExecutionTime:(id)a5 graphResultTensor:(id)a6;
- (void)convertUpdatesToTensorDataForLayer:(id)a3;
- (void)copyBiasFromBNNSToMLCTensor:(id)a3 biasTensors:(id)a4 baseGateIndex:(unint64_t)a5 lstmDescriptor:(id)a6;
- (void)createBNNSDesc2DForLSTMWeights:(id)a3 tensorParameters:(id)a4 deviceOptimizers:(id)a5 isInputWeight:(BOOL)a6;
- (void)deallocateDeviceMemoryForTensor:(id)a3;
- (void)dispatchBroadcastTensor:(id)a3;
- (void)dispatchBroadcastTensor:(id)a3 batchSize:(unint64_t)a4;
- (void)dispatchForwardAndGradientLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultGradientTensor:(id)a9;
- (void)dispatchForwardCompareLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 resultTensor:(id)a6 compareOp:(int)a7 forTraining:(BOOL)a8;
- (void)dispatchForwardConcatLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (void)dispatchForwardEmbeddingLayer:(id)a3 weight:(id)a4 sourceTensor:(id)a5 resultTensor:(id)a6;
- (void)dispatchForwardFullyConnectedLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6;
- (void)dispatchForwardFusedArithmeticLayerNormalizationLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6;
- (void)dispatchForwardGatherLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6;
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
- (void)dispatchForwardSplitLayer:(id)a3 sourceTensor:(id)a4 resultTensors:(id)a5 forConcat:(BOOL)a6;
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
- (void)dispatchGradientSplitLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensor:(id)a5 forConcat:(BOOL)a6;
- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5;
- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7;
- (void)dispatchRNNGradientLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensors:(id)a5;
- (void)dispatchReadTensor:(id)a3 targetBuffer:(void *)a4 batchSize:(unint64_t)a5;
- (void)exportBiasGateOptimizerDataForDeviceOps:(id)a3 biasTensors:(id)a4 gateIndex:(unint64_t)a5 optimizerDataIndex:(unint64_t)a6;
- (void)fuseLayersForGraph:(id)a3 stopGradientTensorList:(id)a4 startAtLayerIndex:(unint64_t)a5 forInference:(BOOL)a6;
- (void)fuseLayersForInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4;
- (void)fuseLayersForTrainingGraph:(id)a3 stopGradientTensorList:(id)a4;
- (void)identifySourceAndOrResultTensorsNeededByGradient:(id)a3;
- (void)optimizerStepForSingleParameterLSTM:(id)a3 tensorParameters:(id)a4 parameterForGateDesc:(id *)a5 gradientsForGateDesc:(id *)a6 parameterMomentumDescData:(id)a7 gateIndex:(unint64_t)a8 deviceOptimizers:(id)a9 isStackedInputWeight:(BOOL)a10;
- (void)readTensor:(id)a3 targetBuffer:(void *)a4;
- (void)reloadParameterDataFromHostToDeviceMemoryForTensor:(id)a3;
- (void)restoreRNNParamsWithDeviceOps:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8;
- (void)saveOrRestoreLSTMBiasesAndAccumulators:(id)a3 auxParameter:(id)a4 auxAccumulators:(id)a5 mlcIndex:(unint64_t)a6 auxIndex:(unint64_t)a7 saveParameter:(BOOL)a8;
- (void)setConvolutionGradientComputeWeightsAndBiasOnly:(id)a3;
- (void)setDeviceHeap:(id)a3;
- (void)setDeviceMemoryForTensor:(id)a3 data:(id)a4;
- (void)setFullyConnectedGradientComputeWeightsAndBiasOnly:(id)a3;
- (void)setOptimizerLearningRate:(id)a3 learningRate:(float)a4;
- (void)setOptimizerTimeStep:(id)a3 timeStep:(unint64_t)a4;
- (void)shareResultTensor:(id)a3 sourceTensor:(id)a4 deviceOps:(id)a5;
- (void)sumSharedGradientsForConvolutionLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4;
- (void)sumSharedGradientsForNormalizationLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4 isBetaTensor:(BOOL)a5;
- (void)synchronizeUpdatesForLayer:(id)a3;
- (void)updateAllParametersWithOptimizer:(id)a3 arrayOfParameters:(id)a4;
- (void)updateBatchNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 meanTensor:(id)a7 varianceTensor:(id)a8 arrayOfParams:(id)a9;
- (void)updateEmbeddingLayer:(id)a3 weightsParameter:(id)a4 optimizer:(id)a5 arrayOfParams:(id)a6;
- (void)updateFullyConnectedLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateGradientDescriptorsForDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (void)updateGroupNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateInstanceNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateLayerNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateMultiheadAttentionLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateRNNLayer:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8;
- (void)updateTensorParameter:(id)a3 optimizer:(id)a4 gradient:(id)a5 arrayOfParams:(id)a6;
- (void)writeToAllDevices:(id)a3 allocateData:(BOOL)a4 batchSize:(unint64_t)a5;
- (void)writeToDevice:(id)a3 batchSize:(unint64_t)a4;
- (void)writeToDevice:(id)a3 sourceBuffer:(void *)a4 batchSize:(unint64_t)a5;
@end

@implementation MLCDeviceCPU

- (id)arithmeticLayerWithOperation:(int)a3 activationDescriptor:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E01B11E0]();
  v8 = +[_MLCCPUArithmetic layerWithDevice:self operation:v4];
  v9 = [v8 deviceOps];
  v10 = (void *)[v9 copy];

  [v8 setDeviceOps:0];
  v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    v11 = v10;
  }
  id v12 = v11;

  return v12;
}

- (id)batchNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v16 = NSNumber;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = [v16 numberWithUnsignedInteger:a3];
  v25[0] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  v23 = CPU_CreateNormalizationLayer(0, a8, a9, (uint64_t)self, 0, v22, 1, v20, v19, v18, v17);

  return v23;
}

- (id)fusedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v18 = NSNumber;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a3;
  v24 = [v18 numberWithUnsignedInteger:a4];
  v28[0] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  v26 = CPU_CreateNormalizationLayer(0, a9, a10, (uint64_t)self, v23, v25, 1, v22, v21, v20, v19);

  return v26;
}

- (id)instanceNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v16 = NSNumber;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = [v16 numberWithUnsignedInteger:a3];
  v25[0] = v21;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v23 = CPU_CreateNormalizationLayer(1u, a8, a9, (uint64_t)self, 0, v22, 1, v20, v19, v18, v17);

  return v23;
}

- (id)fusedInstanceNormalizationAndNeuronLayerWithDescriptor:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v18 = NSNumber;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a3;
  v24 = [v18 numberWithUnsignedInteger:a4];
  v28[0] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  v26 = CPU_CreateNormalizationLayer(1u, a9, a10, (uint64_t)self, v23, v25, 1, v22, v21, v20, v19);

  return v26;
}

- (id)layerNormalizationLayerWithNormalizedShape:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6 isFusedWithArithmeticLayer:(BOOL)a7
{
  return CPU_CreateNormalizationLayer(2u, a6, 1.0, (uint64_t)self, 0, a3, 1, 0, 0, a4, a5);
}

- (id)fusedLayerNormalizationAndNeuronLayerWithDescriptor:(id)a3 normalizedShape:(id)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7
{
  return CPU_CreateNormalizationLayer(2u, a7, 1.0, (uint64_t)self, a3, a4, 1, 0, 0, a5, a6);
}

- (id)groupNormalizationLayerWithFeatureChannelCount:(unint64_t)a3 groupCount:(unint64_t)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v12 = NSNumber;
  id v13 = a6;
  id v14 = a5;
  v15 = [v12 numberWithUnsignedInteger:a3];
  v19[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v17 = CPU_CreateNormalizationLayer(3u, a7, 1.0, (uint64_t)self, 0, v16, a4, 0, 0, v14, v13);

  return v17;
}

- (id)fusedGroupNormalizationAndNeuronLayerWithDescriptor:(id)a3 featureChannelCount:(unint64_t)a4 groupCount:(unint64_t)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v14 = NSNumber;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  id v18 = [v14 numberWithUnsignedInteger:a4];
  v22[0] = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v20 = CPU_CreateNormalizationLayer(3u, a8, 1.0, (uint64_t)self, v17, v19, a5, 0, 0, v16, v15);

  return v20;
}

- (id)convolutionLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E01B11E0]();
  id v12 = +[_MLCCPUConvolution layerWithDevice:self weights:v9 biasTerms:v10 convolutionDescriptor:v8 neuronDescriptor:0];
  id v13 = [v12 deviceOps];
  id v14 = (void *)[v13 copy];

  [v12 setDeviceOps:0];
  id v15 = (void *)MEMORY[0x1E4F1CBF0];
  if (v14) {
    id v15 = v14;
  }
  id v16 = v15;

  return v16;
}

- (id)fusedConvolutionAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x1E01B11E0]();
  id v15 = +[_MLCCPUConvolution layerWithDevice:self weights:v12 biasTerms:v13 convolutionDescriptor:v11 neuronDescriptor:v10];
  id v16 = [v15 deviceOps];
  id v17 = (void *)[v16 copy];

  [v15 setDeviceOps:0];
  id v18 = (void *)MEMORY[0x1E4F1CBF0];
  if (v17) {
    id v18 = v17;
  }
  id v19 = v18;

  return v19;
}

- (id)fusedConvolutionBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9 neuronDescriptor:(id)a10 weights:(id)a11 biasTerms:(id)a12
{
  id v21 = a12;
  id v22 = a11;
  id v23 = a10;
  id v24 = a7;
  id v25 = a6;
  id v26 = a5;
  id v27 = a4;
  id v28 = a3;
  if ([v28 isConvolutionTranspose]) {
    unsigned int v29 = 7;
  }
  else {
    unsigned int v29 = 6;
  }
  v30 = CPU_CreateFusedConvolutionNormalizationAndNeuronLayer(a8, a9, (uint64_t)self, v22, v21, v28, v23, v27, v26, v25, v24, 0, v29);

  return v30;
}

- (id)fusedConvolutionInstanceNormalizationAndNeuronLayerWithDescriptor:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6 momentum:(float)a7 neuronDescriptor:(id)a8 weights:(id)a9 biasTerms:(id)a10
{
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  if ([v23 isConvolutionTranspose]) {
    unsigned int v24 = 23;
  }
  else {
    unsigned int v24 = 22;
  }
  id v25 = CPU_CreateFusedConvolutionNormalizationAndNeuronLayer(a6, a7, (uint64_t)self, v19, v18, v23, v20, 0, 0, v22, v21, 0, v24);

  return v25;
}

- (id)fusedConvolutionGroupNormalizationAndNeuronLayerWithDescriptor:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6 momentum:(float)a7 groupCount:(unint64_t)a8 neuronDescriptor:(id)a9 weights:(id)a10 biasTerms:(id)a11
{
  id v20 = a11;
  id v21 = a10;
  id v22 = a9;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  if ([v25 isConvolutionTranspose]) {
    unsigned int v26 = 36;
  }
  else {
    unsigned int v26 = 35;
  }
  id v27 = CPU_CreateFusedConvolutionNormalizationAndNeuronLayer(a6, a7, (uint64_t)self, v21, v20, v25, v22, 0, 0, v24, v23, a8, v26);

  return v27;
}

- (id)convolutionTransposeLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E01B11E0]();
  id v12 = +[_MLCCPUConvolution layerWithDevice:self weights:v9 biasTerms:v10 convolutionDescriptor:v8 neuronDescriptor:0];
  id v13 = [v12 deviceOps];
  id v14 = (void *)[v13 copy];

  [v12 setDeviceOps:0];
  id v15 = (void *)MEMORY[0x1E4F1CBF0];
  if (v14) {
    id v15 = v14;
  }
  id v16 = v15;

  return v16;
}

- (id)dropoutLayerWithRate:(float)a3 seed:(unint64_t)a4
{
  v7 = (void *)MEMORY[0x1E01B11E0](self, a2);
  *(float *)&double v8 = a3;
  id v9 = +[_MLCCPUDropout layerWithDevice:self rate:a4 seed:v8];
  id v10 = [v9 deviceOps];
  id v11 = (void *)[v10 copy];

  [v9 setDeviceOps:0];
  id v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v11) {
    id v12 = v11;
  }
  id v13 = v12;

  return v13;
}

- (id)fullyConnectedLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E01B11E0]();
  id v12 = +[_MLCCPUFullyConnected layerWithDevice:self weights:v9 biasTerms:v10 convolutionDescriptor:v8 neuronDescriptor:0 opType:9];
  id v13 = [v12 deviceOps];
  id v14 = (void *)[v13 copy];

  [v12 setDeviceOps:0];
  id v15 = (void *)MEMORY[0x1E4F1CBF0];
  if (v14) {
    id v15 = v14;
  }
  id v16 = v15;

  return v16;
}

- (id)fusedFullyConnectedAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x1E01B11E0]();
  id v15 = +[_MLCCPUFullyConnected layerWithDevice:self weights:v12 biasTerms:v13 convolutionDescriptor:v11 neuronDescriptor:v10 opType:10];
  id v16 = [v15 deviceOps];
  id v17 = (void *)[v16 copy];

  [v15 setDeviceOps:0];
  id v18 = (void *)MEMORY[0x1E4F1CBF0];
  if (v17) {
    id v18 = v17;
  }
  id v19 = v18;

  return v19;
}

- (id)fusedFullyConnectedAndSoftmaxLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5 softmaxOp:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x1E01B11E0]();
  if (a6) {
    uint64_t v14 = 41;
  }
  else {
    uint64_t v14 = 40;
  }
  id v15 = +[_MLCCPUFullyConnected layerWithDevice:self weights:v11 biasTerms:v12 convolutionDescriptor:v10 neuronDescriptor:0 opType:v14];
  id v16 = [v15 deviceOps];
  id v17 = (void *)[v16 copy];

  [v15 setDeviceOps:0];
  id v18 = (void *)MEMORY[0x1E4F1CBF0];
  if (v17) {
    id v18 = v17;
  }
  id v19 = v18;

  return v19;
}

- (id)fusedFullyConnectedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9 neuronDescriptor:(id)a10 weights:(id)a11 biasTerms:(id)a12
{
  id v36 = a3;
  id v37 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = (void *)MEMORY[0x1E01B11E0]();
  LODWORD(v34) = 11;
  *(float *)&double v26 = a8;
  *(float *)&double v27 = a9;
  id v28 = +[_MLCCPUFullyConnected layerWithDevice:self weights:v23 biasTerms:v24 convolutionDescriptor:v36 neuronDescriptor:v22 fusedBatchNormAndNeuronLayers:1 mean:v26 variance:v27 beta:v37 gamma:v19 varianceEpsilon:v20 momentum:v21 opType:v34];
  unsigned int v29 = [v28 deviceOps];
  v30 = (void *)[v29 copy];

  [v28 setDeviceOps:0];
  v31 = (void *)MEMORY[0x1E4F1CBF0];
  if (v30) {
    v31 = v30;
  }
  id v32 = v31;

  return v32;
}

- (id)lossLayerWithDescriptor:(id)a3
{
  return CPU_CreateLossLayer((uint64_t)self, a3);
}

- (id)lossYOLOLayerWithDescriptor:(id)a3
{
  return CPU_CreateYOLOLossLayer((uint64_t)self, a3);
}

- (id)neuronLayerWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E01B11E0]();
  id v6 = +[_MLCCPUNeuron layerWithDevice:self descriptor:v4];
  v7 = [v6 deviceOps];
  id v8 = (void *)[v7 copy];

  [v6 setDeviceOps:0];
  id v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    id v9 = v8;
  }
  id v10 = v9;

  return v10;
}

- (id)lstmLayerWithDescriptor:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 peepholeWeights:(id)a6 biasTerms:(id)a7 gateActivations:(id)a8 outputResultActivation:(id)a9 inferenceOnly:(BOOL)a10
{
  id v30 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = (void *)MEMORY[0x1E01B11E0]();
  LOBYTE(v29) = a10;
  id v23 = +[_MLCCPULSTM layerWithDevice:self lstmDescriptor:v30 inputWeights:v16 hiddenWeights:v17 peepholeWeights:v18 biasTerms:v19 gateActivations:v20 ouputResultActivation:v21 inferenceOnly:v29];
  id v24 = [v23 deviceOps];
  id v25 = (void *)[v24 copy];

  [v23 setDeviceOps:0];
  double v26 = (void *)MEMORY[0x1E4F1CBF0];
  if (v25) {
    double v26 = v25;
  }
  id v27 = v26;

  return v27;
}

- (id)gramMatrixLayerWithScaleFactor:(float)a3
{
  v5 = (void *)MEMORY[0x1E01B11E0](self, a2);
  *(float *)&double v6 = a3;
  v7 = +[_MLCCPUGramMatrix layerWithDevice:self scale:v6];
  id v8 = [v7 deviceOps];
  id v9 = (void *)[v8 copy];

  [v7 setDeviceOps:0];
  id v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9) {
    id v10 = v9;
  }
  id v11 = v10;

  return v11;
}

- (id)upsampleLayerWithScaleFactorX:(float)a3 scaleFactorY:(float)a4 sampleMode:(int)a5 alignCorners:(BOOL)a6
{
  return CPU_CreateUpsampleLayer((uint64_t)self, a5, a6);
}

- (id)optimizerSGDWithDescriptor:(id)a3 momentunScale:(float)a4 useNesterovMomentum:(BOOL)a5
{
  return CPU_CreateSGDOptimizer(a4, (uint64_t)self, a5, a3);
}

- (id)optimizerAdamWithDescriptor:(id)a3 beta1:(float)a4 beta2:(float)a5 epsilon:(float)a6 amsgrad:(BOOL)a7 timeStep:(unint64_t)a8 isAdamW:(BOOL)a9
{
  return CPU_CreateAdamOptimizer(a4, a5, a6, (uint64_t)self, a7, a8, a9, a3);
}

- (id)optimizerRMSPropWithDescriptor:(id)a3 momentumScale:(float)a4 alpha:(float)a5 epsilon:(float)a6 centered:(BOOL)a7
{
  return CPU_CreateRMSPropOptimizer(a4, a5, a6, (uint64_t)self, a7, a3);
}

- (id)poolingLayerWithDescriptor:(id)a3 paddingSizes:(unint64_t *)a4
{
  id v5 = a3;
  double v6 = (void *)MEMORY[0x1E01B11E0]();
  v7 = +[_MLCCPUPooling layerWithDevice:self descriptor:v5];
  id v8 = [v7 deviceOps];
  id v9 = (void *)[v8 copy];

  [v7 setDeviceOps:0];
  id v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9) {
    id v10 = v9;
  }
  id v11 = v10;

  return v11;
}

- (id)reshapeLayerWithShape:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E01B11E0]();
  double v6 = +[_MLCCPUReshape layerWithDevice:self];
  v7 = [v6 deviceOps];
  id v8 = (void *)[v7 copy];

  [v6 setDeviceOps:0];
  id v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    id v9 = v8;
  }
  id v10 = v9;

  return v10;
}

- (id)splitLayerWithDimension:(unint64_t)a3
{
  id v5 = (void *)MEMORY[0x1E01B11E0](self, a2);
  double v6 = +[_MLCCPUSplit layerWithDevice:self dimension:a3];
  v7 = [v6 deviceOps];
  id v8 = (void *)[v7 copy];

  [v6 setDeviceOps:0];
  id v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    id v9 = v8;
  }
  id v10 = v9;

  return v10;
}

- (id)softmaxLayerWithOperation:(int)a3 dimension:(unint64_t)a4 sourceShapeCount:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = (void *)MEMORY[0x1E01B11E0](self, a2, *(void *)&a3, a4, a5);
  id v9 = +[_MLCCPUSoftmax layerWithDevice:self operation:v6 dimension:a4];
  id v10 = [v9 deviceOps];
  id v11 = (void *)[v10 copy];

  [v9 setDeviceOps:0];
  id v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v11) {
    id v12 = v11;
  }
  id v13 = v12;

  return v13;
}

- (id)multiheadAttentionLayerWithDescriptor:(id)a3 weights:(id)a4 bias:(id)a5 attnBias:(id)a6 inferenceOnly:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void *)MEMORY[0x1E01B11E0]();
  id v17 = +[_MLCCPUMHAttention layerWithDevice:self descriptor:v12 weights:v13 bias:v14 attnBias:v15 inferenceOnly:v7];
  id v18 = [v17 deviceOps];
  id v19 = (void *)[v18 copy];

  [v17 setDeviceOps:0];
  id v20 = (void *)MEMORY[0x1E4F1CBF0];
  if (v19) {
    id v20 = v19;
  }
  id v21 = v20;

  return v21;
}

- (id)matMulLayerWithDescriptor:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 inferenceOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x1E01B11E0]();
  id v14 = +[_MLCCPUMatMul layerWithDevice:self descriptor:v10 inferenceOnly:v6];
  id v15 = [v14 deviceOps];
  id v16 = (void *)[v15 copy];

  [v14 setDeviceOps:0];
  id v17 = (void *)MEMORY[0x1E4F1CBF0];
  if (v16) {
    id v17 = v16;
  }
  id v18 = v17;

  return v18;
}

- (id)sliceLayerWithbegin:(id)a3 end:(id)a4 stride:(id)a5 inferenceOnly:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)MEMORY[0x1E01B11E0]();
  id v13 = +[_MLCCPUSlice layerWithDevice:self begin:v9 end:v10 stride:v11];
  id v14 = [v13 deviceOps];
  id v15 = (void *)[v14 copy];

  [v13 setDeviceOps:0];
  id v16 = (void *)MEMORY[0x1E4F1CBF0];
  if (v15) {
    id v16 = v15;
  }
  id v17 = v16;

  return v17;
}

- (id)embeddingLayerWithDescriptor:(id)a3 weights:(id)a4 inferenceOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1E01B11E0]();
  id v11 = +[_MLCCPUEmbedding layerWithDevice:self descriptor:v8 weights:v9 inferenceOnly:v5];
  id v12 = [v11 deviceOps];
  id v13 = (void *)[v12 copy];

  [v11 setDeviceOps:0];
  id v14 = (void *)MEMORY[0x1E4F1CBF0];
  if (v13) {
    id v14 = v13;
  }
  id v15 = v14;

  return v15;
}

- (id)transposeLayerWithShape:(id)a3
{
  return CPU_CreateTransposeLayer((uint64_t)self, a3);
}

- (id)paddingLayerWithPaddingType:(int)a3 paddingLeft:(unint64_t)a4 paddingRight:(unint64_t)a5 paddingTop:(unint64_t)a6 paddingBottom:(unint64_t)a7 constantValue:(float)a8 dataType:(int)a9
{
  return CPU_CreatePaddingLayer(a8, (uint64_t)self, a3, a4, a5, a6, a7, a9);
}

- (id)compareLayerWithOperation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = (void *)MEMORY[0x1E01B11E0](self, a2);
  BOOL v6 = +[_MLCCPUCompare layerWithDevice:self operation:v3];
  BOOL v7 = [v6 deviceOps];
  id v8 = (void *)[v7 copy];

  [v6 setDeviceOps:0];
  id v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    id v9 = v8;
  }
  id v10 = v9;

  return v10;
}

- (id)reductionLayerWithReduceType:(int)a3 dimensions:(id)a4 sourceShapeCount:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E01B11E0]();
  id v10 = +[_MLCCPUReduction layerWithDevice:self reduceType:v6 dimensions:v8 sourceShapeCount:a5];
  id v11 = [v10 deviceOps];
  id v12 = (void *)[v11 copy];

  [v10 setDeviceOps:0];
  id v13 = (void *)MEMORY[0x1E4F1CBF0];
  if (v12) {
    id v13 = v12;
  }
  id v14 = v13;

  return v14;
}

- (id)selectLayer
{
  uint64_t v3 = (void *)MEMORY[0x1E01B11E0](self, a2);
  id v4 = +[_MLCCPUSelect layerWithDevice:self];
  BOOL v5 = [v4 deviceOps];
  uint64_t v6 = (void *)[v5 copy];

  [v4 setDeviceOps:0];
  BOOL v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    BOOL v7 = v6;
  }
  id v8 = v7;

  return v8;
}

- (id)gatherLayerWithDimension:(unint64_t)a3
{
  BOOL v5 = (void *)MEMORY[0x1E01B11E0](self, a2);
  uint64_t v6 = +[_MLCCPUGather layerWithDevice:self dimension:a3];
  BOOL v7 = [v6 deviceOps];
  id v8 = (void *)[v7 copy];

  [v6 setDeviceOps:0];
  id v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    id v9 = v8;
  }
  id v10 = v9;

  return v10;
}

- (id)scatterLayerWithDimension:(unint64_t)a3 reduceType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v7 = (void *)MEMORY[0x1E01B11E0](self, a2);
  id v8 = +[_MLCCPUScatter layerWithDevice:self dimension:a3 reduceType:v4];
  id v9 = [v8 deviceOps];
  id v10 = (void *)[v9 copy];

  [v8 setDeviceOps:0];
  id v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    id v11 = v10;
  }
  id v12 = v11;

  return v12;
}

- (void)fuseLayersForGraph:(id)a3 stopGradientTensorList:(id)a4 startAtLayerIndex:(unint64_t)a5 forInference:(BOOL)a6
{
  BOOL v6 = a6;
  id v63 = a3;
  id v9 = a4;
  if (v63)
  {
    if ([v63 count] >= a5 + 2)
    {
      +[MLCComputeEngineCommon applyPatternMatcherForGraph:v63 stopGradientTensorList:v9 startAtLayerIndex:a5 forInference:v6];
      if ([v63 count] > a5)
      {
        while (1)
        {
          id v10 = [v63 objectAtIndexedSubscript:a5];
          if ([v10 isLastLayer] & 1) != 0 || (objc_msgSend(v10, "skipLayer")) {
            goto LABEL_20;
          }
          id v11 = [v10 resultTensors];
          if ((unint64_t)[v11 count] > 1) {
            goto LABEL_7;
          }
          id v12 = [v10 resultTensors];
          id v13 = [v12 objectAtIndexedSubscript:0];
          id v14 = [v13 childLayers];
          uint64_t v15 = [v14 count];

          if (v15 != 1) {
            goto LABEL_20;
          }
          id v16 = [v10 resultTensors];
          id v17 = [v16 objectAtIndexedSubscript:0];
          char v18 = [v17 computeFlags];

          if (v18) {
            goto LABEL_20;
          }
          id v19 = [v10 resultTensors];
          id v20 = [v19 objectAtIndexedSubscript:0];
          id v21 = [v20 childLayers];
          id v11 = [v21 objectAtIndexedSubscript:0];

          if ([v11 skipLayer]) {
            goto LABEL_7;
          }
          int v22 = [v10 isTrainable];
          if (v22 != [v11 isTrainable]) {
            goto LABEL_7;
          }
          id v23 = [v10 resultTensors];
          id v24 = [v23 objectAtIndexedSubscript:0];
          BOOL v25 = +[MLCComputeEngineCommon isResultTensorInStopGradientTensorList:v9 resultTensor:v24 forInference:v6];

          if (v25) {
            goto LABEL_7;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v26 = v10;
              id v11 = v11;
              if (![v26 paddingType])
              {
                id v27 = [v11 descriptor];
                if ([v27 paddingPolicy] == 1
                  && (uint64_t v28 = [v26 paddingTop], v28 == objc_msgSend(v26, "paddingBottom")))
                {
                  uint64_t v29 = [v26 paddingLeft];
                  uint64_t v30 = [v26 paddingRight];

                  if (v29 == v30) {
                    +[MLCComputeEngineCommon updateTensorsForFusedPaddingAndConvolutionLayer:v26 layerNext:v11];
                  }
                }
                else
                {
                }
              }

              goto LABEL_7;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_7;
            }
            if (+[MLCComputeEngineCommon doesActivationRequireInput:v11 forInference:v6])
            {
              goto LABEL_7;
            }
            v42 = [v11 fusedLayers];
            uint64_t v43 = [v42 count];

            if (v43) {
              goto LABEL_7;
            }
LABEL_61:
            +[MLCComputeEngineCommon updateTensorsForTwoFusedLayers:v10 layerNext:v11];
            goto LABEL_7;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            if ((isKindOfClass & 1) != 0
              && ([v11 fusedLayers],
                  v52 = objc_claimAutoreleasedReturnValue(),
                  v55 = v52,
                  ![v52 count]))
            {
            }
            else
            {
              objc_opt_class();
              char v53 = objc_opt_isKindOfClass();
              if (isKindOfClass) {

              }
              if ((v53 & 1) == 0) {
                goto LABEL_7;
              }
            }
LABEL_60:
            if (!+[MLCComputeEngineCommon doesActivationRequireInput:v11 forInference:v6])goto LABEL_61; {
          }
            }
LABEL_7:

LABEL_20:
          if (++a5 >= [v63 count]) {
            goto LABEL_64;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ([v11 fusedLayers],
              v31 = objc_claimAutoreleasedReturnValue(),
              uint64_t v32 = [v31 count],
              v31,
              v32))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_7;
              }
            }
          }
          v33 = [v11 sourceTensors];
          uint64_t v34 = [v33 objectAtIndexedSubscript:0];
          v35 = [v34 descriptor];
          id v36 = [v35 shape];
          unint64_t v61 = [v36 count];

          if (v61 < 3) {
            goto LABEL_7;
          }
          id v37 = [v11 resultTensors];
          v38 = [v37 objectAtIndexedSubscript:0];
          v39 = [v38 childLayers];
          if ([v39 count])
          {
            v56 = [v11 resultTensors];
            [v56 objectAtIndexedSubscript:0];
            v40 = v59 = v38;
            v41 = [v40 childLayers];
            v62 = [v41 objectAtIndexedSubscript:0];

            v38 = v59;
          }
          else
          {
            v62 = 0;
          }

          v44 = [v11 resultTensors];
          v45 = [v44 objectAtIndexedSubscript:0];
          BOOL v46 = +[MLCComputeEngineCommon isResultTensorInStopGradientTensorList:v9 resultTensor:v45 forInference:v6];

          if (v46) {
            goto LABEL_50;
          }
          v47 = [v11 resultTensors];
          v48 = [v47 objectAtIndexedSubscript:0];
          v49 = [v48 childLayers];
          if ([v49 count] != 1) {
            goto LABEL_49;
          }
          v60 = [v11 resultTensors];
          v50 = [v60 objectAtIndexedSubscript:0];
          if (([v50 computeFlags] & 1) == 0
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && (int v57 = [v62 isTrainable], v57 == objc_msgSend(v10, "isTrainable"))
            && !+[MLCComputeEngineCommon doesActivationRequireInput:v62 forInference:v6])
          {
            v54 = [v62 fusedLayers];
            uint64_t v58 = [v54 count];

            if (v58) {
              goto LABEL_50;
            }
            +[MLCComputeEngineCommon updateTensorsForThreeFusedLayers:v10 layerNext:v11 layerNext2:v62];
          }
          else
          {

LABEL_49:
LABEL_50:
            +[MLCComputeEngineCommon updateTensorsForTwoFusedLayers:v10 layerNext:v11];
          }

          goto LABEL_7;
        }
        goto LABEL_60;
      }
    }
  }
LABEL_64:
}

- (void)fuseLayersForTrainingGraph:(id)a3 stopGradientTensorList:(id)a4
{
}

- (void)fuseLayersForInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4
{
}

- (void)identifySourceAndOrResultTensorsNeededByGradient:(id)a3
{
  id v16 = [a3 objectAtIndexedSubscript:0];
  uint64_t v3 = 0;
  int v4 = [v16 deviceOpType] - 1;
  uint64_t v5 = 0;
  switch(v4)
  {
    case 0:
      objc_msgSend(v16, "params", 0);
      id v12 = objc_claimAutoreleasedReturnValue();
      id v13 = (unsigned int *)[v12 bytes];

      unsigned int v8 = *v13;
      if (*v13 >= 0x18) {
        goto LABEL_11;
      }
      uint64_t v3 = (0xC20030u >> v8) & 1;
      unsigned int v9 = 4062732;
      goto LABEL_10;
    case 1:
    case 13:
    case 19:
    case 23:
    case 26:
    case 27:
    case 32:
    case 38:
    case 41:
    case 45:
    case 47:
    case 48:
      break;
    case 2:
    case 15:
    case 20:
    case 28:
    case 33:
      uint64_t v5 = 0;
      uint64_t v3 = 1;
      break;
    case 3:
    case 7:
    case 8:
    case 11:
    case 16:
    case 17:
    case 18:
    case 24:
    case 43:
    case 44:
    case 46:
    case 49:
    case 50:
      goto LABEL_11;
    case 4:
    case 5:
    case 6:
    case 9:
    case 10:
    case 21:
    case 22:
    case 25:
    case 29:
    case 30:
    case 31:
    case 34:
    case 35:
    case 36:
    case 37:
    case 39:
    case 40:
      uint64_t v3 = 1;
      goto LABEL_12;
    case 12:
      objc_msgSend(v16, "params", 0);
      id v6 = objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [v6 bytes];

      unsigned int v8 = *(_DWORD *)(v7 + 352);
      if (v8 < 0x18)
      {
        uint64_t v3 = (0x84001Eu >> v8) & 1;
        unsigned int v9 = 8126433;
        goto LABEL_10;
      }
LABEL_11:
      uint64_t v3 = 0;
LABEL_12:
      uint64_t v5 = 1;
      break;
    case 14:
      objc_msgSend(v16, "params", 0);
      id v14 = objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 bytes];

      uint64_t v3 = *(_DWORD *)(v15 + 576) == 4;
      goto LABEL_17;
    case 42:
      objc_msgSend(v16, "params", 0);
      id v10 = objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 bytes];

      unsigned int v8 = *(_DWORD *)(v11 + 528);
      if (v8 >= 0xA)
      {
        uint64_t v3 = 0;
        uint64_t v5 = 0;
      }
      else
      {
        uint64_t v3 = (3u >> v8) & 1;
        unsigned int v9 = 531;
LABEL_10:
        uint64_t v5 = (v9 >> v8) & 1;
      }
      break;
    default:
LABEL_17:
      uint64_t v5 = v3;
      break;
  }
  [v16 setSourceOfForwardNeededForGradient:v5];
  [v16 setResultOfForwardNeededForGradient:v3];
}

- (BOOL)compileLayerDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [a3 objectAtIndexedSubscript:0];
  int v8 = [v7 deviceOpType];
  if (v8 == 46)
  {
    [v7 setBNNSFilter:0];
    unsigned int v9 = [v6 objectAtIndexedSubscript:0];
    id v10 = [v9 descriptor];
    uint64_t v11 = [v10 shape];
    id v12 = [v11 objectAtIndexedSubscript:0];
    objc_msgSend(v7, "setBatchSize:", objc_msgSend(v12, "unsignedIntegerValue"));
  }
  return v8 == 46;
}

- (BOOL)compileLayerDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 objectAtIndexedSubscript:0];
  uint64_t v12 = 0;
  int v13 = 1;
  char v14 = 1;
  switch([v11 deviceOpType])
  {
    case 1u:
      if (+[_MLCCPUArithmetic compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
        goto LABEL_58;
      }
      id v16 = +[MLCLog framework];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_66;
      }
      goto LABEL_95;
    case 2u:
    case 3u:
      unsigned int v17 = 0;
      goto LABEL_16;
    case 4u:
    case 5u:
      if (+[_MLCCPUConvolution compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10 convolutionTranspose:0])
      {
        goto LABEL_58;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 6u:
    case 7u:
    case 0x16u:
    case 0x17u:
    case 0x1Eu:
    case 0x1Fu:
    case 0x23u:
    case 0x24u:
      uint64_t v15 = (uint64_t)CPU_CompileFusedConvolutionNormalizationAndNeuronLayer(v8, v9, v10);
      goto LABEL_17;
    case 8u:
      if (+[_MLCCPUDropout compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
        goto LABEL_58;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 9u:
    case 0xAu:
    case 0x28u:
    case 0x29u:
      if (+[_MLCCPUFullyConnected compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
        goto LABEL_58;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 0xBu:
      if (+[_MLCCPUFullyConnected compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10 fusedBatchNormAndNeuron:1])
      {
        goto LABEL_58;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 0xCu:
      uint64_t v18 = CPU_CompileLossLayer(v8, v9, v10);
      goto LABEL_42;
    case 0xDu:
      if (+[_MLCCPUNeuron compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
        goto LABEL_58;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 0xEu:
      uint64_t v15 = CPU_CompilePaddingLayer(v8, v9, v10);
      goto LABEL_17;
    case 0xFu:
      if (+[_MLCCPUPooling compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
        goto LABEL_58;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 0x10u:
      if (+[_MLCCPUSoftmax compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
        goto LABEL_58;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 0x11u:
      if (+[_MLCCPULSTM compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
        goto LABEL_89;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 0x12u:
      uint64_t v18 = CPU_CompileYOLOLossLayer(v8, v9, v10);
LABEL_42:
      uint64_t v12 = v18;
      int v13 = 0;
      goto LABEL_59;
    case 0x13u:
      if (+[_MLCCPUGramMatrix compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
        goto LABEL_58;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 0x14u:
    case 0x15u:
      unsigned int v17 = 1;
      goto LABEL_16;
    case 0x18u:
      uint64_t v15 = CPU_CompileUpsampleLayer(v8, v9, v10);
      goto LABEL_17;
    case 0x19u:
    case 0x1Au:
      if (+[_MLCCPUConvolution compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10 convolutionTranspose:1])
      {
        goto LABEL_58;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 0x1Bu:
      goto LABEL_61;
    case 0x1Cu:
    case 0x1Du:
      unsigned int v17 = 2;
      goto LABEL_16;
    case 0x21u:
    case 0x22u:
      unsigned int v17 = 3;
LABEL_16:
      uint64_t v15 = (uint64_t)CPU_CompileNormalizationLayer(v17, v8, v9, v10);
      goto LABEL_17;
    case 0x27u:
      uint64_t v15 = CPU_CompileTransposeLayer(v8, v9, v10);
LABEL_17:
      uint64_t v12 = v15;
      goto LABEL_59;
    case 0x2Au:
      if (+[_MLCCPUCompare compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
        goto LABEL_89;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 0x2Bu:
      if (+[_MLCCPUReduction compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
        goto LABEL_58;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 0x2Cu:
      if (+[_MLCCPUMHAttention compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
LABEL_58:
        id v20 = [v11 layer];
        uint64_t v12 = [v20 filter];

LABEL_59:
        if (v12)
        {
          char v14 = 0;
          goto LABEL_61;
        }
LABEL_64:
        id v16 = +[MLCLog framework];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceCPU(MLCLayerOperations) compileLayerDeviceOps:sourceTensors:resultTensor:]();
        }
        goto LABEL_66;
      }
      id v16 = +[MLCLog framework];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_66;
      }
      goto LABEL_95;
    case 0x2Du:
      if (+[_MLCCPUMatMul compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
        uint64_t v43 = [v11 layer];
        uint64_t v12 = [v43 filter];

        goto LABEL_61;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceCPU(MLCLayerOperations) compileLayerDeviceOps:sourceTensors:resultTensor:]7();
      }
      goto LABEL_66;
    case 0x30u:
      if (+[_MLCCPUSlice compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
        goto LABEL_89;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 0x32u:
      if (+[_MLCCPUGather compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
        goto LABEL_89;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      goto LABEL_66;
    case 0x33u:
      if (+[_MLCCPUScatter compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10])
      {
LABEL_89:
        uint64_t v12 = 0;
LABEL_61:
        [(MLCDeviceCPU *)self identifySourceAndOrResultTensorsNeededByGradient:v8];
        [v11 setBNNSFilter:v12];
        BOOL v46 = self;
        if (v13)
        {
          id v21 = [v10 descriptor];
          int v22 = [v21 shape];
          if ([v22 count] == 1)
          {
            [v11 setBatchSize:1];
LABEL_72:

            id v36 = [v11 layer];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v38 = [v10 descriptor];
              v39 = [v38 shape];
              v40 = [v39 objectAtIndexedSubscript:0];
              objc_msgSend(v11, "setBatchSize:", objc_msgSend(v40, "unsignedIntegerValue"));

              v41 = v46;
            }
            else
            {
              v41 = v46;
              if ([v11 deviceOpType] == 39) {
                [v11 setBatchSize:1];
              }
            }
            if ((v14 & 1) == 0) {
              [(MLCDeviceCPU *)v41 updateGradientDescriptorsForDeviceOps:v8 sourceTensors:v9 resultTensor:v10];
            }
            BOOL v23 = 1;
            goto LABEL_79;
          }
          id v24 = [v10 descriptor];
          [v24 shape];
          id v25 = v8;
          v27 = id v26 = v9;
          [v27 objectAtIndexedSubscript:0];
          v29 = uint64_t v28 = v11;
          objc_msgSend(v28, "setBatchSize:", objc_msgSend(v29, "unsignedIntegerValue"));

          uint64_t v11 = v28;
          id v9 = v26;
          id v8 = v25;
        }
        else
        {
          id v21 = [v9 objectAtIndexedSubscript:0];
          int v22 = [v21 descriptor];
          id v24 = [v22 shape];
          if ([v24 count] == 1)
          {
            [v11 setBatchSize:1];
          }
          else
          {
            [v9 objectAtIndexedSubscript:0];
            id v44 = v8;
            id v45 = v10;
            v31 = id v30 = v9;
            [v31 descriptor];
            v33 = uint64_t v32 = v11;
            uint64_t v34 = [v33 shape];
            v35 = [v34 objectAtIndexedSubscript:0];
            objc_msgSend(v32, "setBatchSize:", objc_msgSend(v35, "unsignedIntegerValue"));

            uint64_t v11 = v32;
            id v9 = v30;
            id v8 = v44;
            id v10 = v45;
          }
        }

        goto LABEL_72;
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
LABEL_95:
      }
        -[MLCDeviceCPU(MLCLayerOperations) compileLayerDeviceOps:sourceTensors:resultTensor:]();
LABEL_66:

      BOOL v23 = 0;
LABEL_79:

      return v23;
    default:
      id v19 = +[MLCLog framework];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceCPU(MLCLayerOperations) compileLayerDeviceOps:sourceTensors:resultTensor:]();
      }

      goto LABEL_64;
  }
}

- (BOOL)setConvolutionLayerOptimizerDataForDeviceOps:(id)a3 weights:(id)a4 bias:(id)a5
{
  return CPU_SetOptimizerDataForConvolutionLayer(a3, a4, a5);
}

- (BOOL)setMHALayerOptimizerDataForDeviceOps:(id)a3 optimizerDataForWeights:(id)a4 optimizerDataForBias:(id)a5
{
  return +[_MLCCPUMHAttention setOptimizerDataForDevice:self deviceOps:a3 dataForWeights:a4 dataForBias:a5];
}

- (BOOL)setNormalizationLayerOptimizerDataForDeviceOps:(id)a3 beta:(id)a4 gamma:(id)a5
{
  return CPU_SetOptimizerDataForNormalizationLayer(a3, a4, a5);
}

- (BOOL)setLSTMLayerOptimizerDataForDeviceOps:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 biasTerms:(id)a6
{
  return +[_MLCCPULSTM setOptimizerDataForDevice:self deviceOps:a3 dataForInputWeights:a4 dataForHiddenWeights:a5 dataForPeepholeWeights:0 dataForBias:a6];
}

- (id)createOptimizerDeviceDataForTensor:(id)a3 optimizer:(id)a4 optimizerData:(id)a5 isVector:(BOOL)a6
{
  return CPU_CreateOptimizerDeviceDataForTensor((uint64_t)self, a3, a5);
}

- (void)allocateDeviceDataForGlobalNormClippingWithOptimizer:(id)a3 updatableParameterCount:(unint64_t)a4
{
  id v26 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E01B11E0]();
  id v6 = [v26 oneStepOptimizerBuffers];
  [v6 removeAllObjects];

  uint64_t v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [v26 setOneStepOptimizerBuffers:v7];

  id v8 = malloc_type_malloc(8 * a4, 0x9AAFE5B2uLL);
  id v9 = [v26 oneStepOptimizerBuffers];
  id v10 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v8 length:8 * a4 freeWhenDone:1];
  [v9 addObject:v10];

  uint64_t v11 = malloc_type_malloc(8 * a4, 0x96763E82uLL);
  uint64_t v12 = [v26 oneStepOptimizerBuffers];
  int v13 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v11 length:8 * a4 freeWhenDone:1];
  [v12 addObject:v13];

  char v14 = malloc_type_malloc(8 * a4 * [v26 numOptimizerDataBuffers], 0x733717B0uLL);
  uint64_t v15 = [v26 oneStepOptimizerBuffers];
  id v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v14, 8 * a4 * objc_msgSend(v26, "numOptimizerDataBuffers"), 1);
  [v15 addObject:v16];

  unsigned int v17 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  *unsigned int v17 = a4;
  uint64_t v18 = [v26 oneStepOptimizerBuffers];
  id v19 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v17 length:8 freeWhenDone:1];
  [v18 addObject:v19];

  id v20 = malloc_type_calloc(8uLL, 1uLL, 0x6E2C2D23uLL);
  id v21 = [v26 oneStepOptimizerBuffers];
  int v22 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v20 length:8 freeWhenDone:1];
  [v21 addObject:v22];

  BOOL v23 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  void *v23 = [v26 numOptimizerDataBuffers];
  id v24 = [v26 oneStepOptimizerBuffers];
  id v25 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v23 length:8 freeWhenDone:1];
  [v24 addObject:v25];
}

- (void)updateGradientDescriptorsForDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  v147[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [a3 objectAtIndexedSubscript:0];
  if ([v9 deviceOpType] == 44 || objc_msgSend(v9, "deviceOpType") == 1) {
    goto LABEL_31;
  }
  id v10 = [v9 inDeltaData];
  id v11 = [v10 objectAtIndexedSubscript:0];
  uint64_t v139 = [v11 bytes];

  uint64_t v12 = [v9 outDeltaData];
  id v13 = [v12 objectAtIndexedSubscript:0];
  uint64_t v14 = [v13 bytes];

  id v141 = v7;
  v142 = v8;
  uint64_t v140 = v14;
  if ([v9 deviceOpType] != 16 && objc_msgSend(v9, "deviceOpType") != 18) {
    goto LABEL_10;
  }
  uint64_t v15 = [v7 objectAtIndexedSubscript:0];
  id v16 = [v15 descriptor];
  unsigned int v17 = [v16 shape];
  uint64_t v18 = [v17 count];

  if ((unint64_t)(v18 - 1) < 2)
  {
    BOOL v27 = 1;
    goto LABEL_15;
  }
  if (v18 == 3)
  {
    uint64_t v28 = [v7 objectAtIndexedSubscript:0];
    uint64_t v29 = [v28 descriptor];
    id v30 = [v29 shape];
    v31 = [v30 objectAtIndexedSubscript:2];
    BOOL v27 = [v31 unsignedIntegerValue] == 1;

    goto LABEL_15;
  }
  if (v18 != 4)
  {
LABEL_10:
    BOOL v27 = 0;
    goto LABEL_15;
  }
  id v19 = [v7 objectAtIndexedSubscript:0];
  id v20 = [v19 descriptor];
  id v21 = [v20 shape];
  int v22 = [v21 objectAtIndexedSubscript:3];
  if ([v22 unsignedIntegerValue] == 1)
  {
    BOOL v23 = [v7 objectAtIndexedSubscript:0];
    id v24 = [v23 descriptor];
    id v25 = [v24 shape];
    id v26 = [v25 objectAtIndexedSubscript:2];
    BOOL v27 = [v26 unsignedIntegerValue] == 1;

    id v8 = v142;
    id v7 = v141;
  }
  else
  {
    BOOL v27 = 0;
  }

LABEL_15:
  if ([v9 deviceOpType] == 9
    || [v9 deviceOpType] == 10
    || [v9 deviceOpType] == 40
    || ([v9 deviceOpType] == 41 ? (int v32 = 1) : (int v32 = v27), v32 == 1))
  {
    v138 = v9;
    v33 = [v7 objectAtIndexedSubscript:0];
    uint64_t v34 = [v33 descriptor];
    v35 = [v34 shape];
    uint64_t v36 = [v35 count];

    id v37 = [v7 objectAtIndexedSubscript:0];
    v38 = [v37 descriptor];
    v39 = [v38 shape];
    v40 = [v39 objectAtIndexedSubscript:v36 - 1];
    uint64_t v41 = [v40 unsignedIntegerValue];

    v42 = [v7 objectAtIndexedSubscript:0];
    uint64_t v43 = [v42 descriptor];
    id v44 = [v43 stride];
    uint64_t v137 = v36 - 1;
    id v45 = [v44 objectAtIndexedSubscript:v36 - 1];
    uint64_t v46 = [v45 unsignedIntegerValue];

    uint64_t v143 = v46;
    if (v36 == 4)
    {
      v47 = [v7 objectAtIndexedSubscript:0];
      v48 = [v47 descriptor];
      v49 = [v48 shape];
      v50 = [v49 objectAtIndexedSubscript:3];
      uint64_t v51 = [v50 unsignedIntegerValue];
      BOOL v52 = v51 == 1;
      if (v51 == 1)
      {
        uint64_t v135 = v41;
        char v53 = [v7 objectAtIndexedSubscript:0];
        v54 = [v53 descriptor];
        v55 = [v54 shape];
        [v55 objectAtIndexedSubscript:2];
        int v57 = v56 = v7;
        uint64_t v136 = [v57 unsignedIntegerValue];

        if (v136 != 1)
        {
          BOOL v52 = 0;
          id v7 = v56;
          uint64_t v46 = v143;
          uint64_t v41 = v135;
          goto LABEL_28;
        }
        v47 = [v56 objectAtIndexedSubscript:0];
        v48 = [v47 descriptor];
        v49 = [v48 shape];
        v50 = [v49 objectAtIndexedSubscript:1];
        uint64_t v41 = [v50 unsignedIntegerValue];
        id v7 = v56;
        uint64_t v46 = v143;
      }
    }
    else
    {
      BOOL v52 = 0;
    }
LABEL_28:
    uint64_t v58 = [NSNumber numberWithUnsignedInteger:v41];
    v147[0] = v58;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:1];
    v60 = [NSNumber numberWithUnsignedInteger:v46];
    v146 = v60;
    unint64_t v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v146 count:1];
    v62 = [v7 objectAtIndexedSubscript:0];
    id v63 = [v62 descriptor];
    CPU_BuildBNNSNDArrayDescriptor(v139, v59, v61, 0, [v63 dataType], v52, 0);

    id v8 = v142;
    v64 = [v142 descriptor];
    v65 = [v64 shape];
    v66 = [v65 objectAtIndexedSubscript:v137];
    uint64_t v67 = [v66 unsignedIntegerValue];

    if (v52)
    {
      v68 = [v142 descriptor];
      v69 = [v68 shape];
      v70 = [v69 objectAtIndexedSubscript:1];
      uint64_t v67 = [v70 unsignedIntegerValue];
    }
    v71 = [NSNumber numberWithUnsignedInteger:v67];
    v145 = v71;
    v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v145 count:1];
    v73 = [NSNumber numberWithUnsignedInteger:v143];
    v144 = v73;
    v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v144 count:1];
    v75 = [v142 descriptor];
    CPU_BuildBNNSNDArrayDescriptor(v140, v72, v74, 0, [v75 dataType], v52, 0);

    id v7 = v141;
    id v9 = v138;
    goto LABEL_31;
  }
  if ([v9 deviceOpType] == 19)
  {
    v76 = [v7 objectAtIndexedSubscript:0];
    v77 = [v76 descriptor];
    v78 = [v77 shape];
    v79 = [v7 objectAtIndexedSubscript:0];
    v80 = [v79 descriptor];
    v81 = [v80 stride];
    [v7 objectAtIndexedSubscript:0];
    v83 = id v82 = v7;
    v84 = [v83 descriptor];
    CPU_BuildBNNSNDArrayDescriptor(v139, v78, v81, 0, [v84 dataType], 1, 0);

    id v8 = v142;
    id v7 = v82;

    v85 = [v142 descriptor];
    v86 = [v85 shape];
    v87 = [v142 descriptor];
    v88 = [v87 stride];
    v89 = [v142 descriptor];
    CPU_BuildBNNSNDArrayDescriptor(v140, v86, v88, 0, [v89 dataType], 1, 0);

    goto LABEL_31;
  }
  if ([v9 deviceOpType] == 39)
  {
    v90 = [v7 objectAtIndexedSubscript:0];
    v91 = [v90 descriptor];
    v92 = [v91 shape];
    v93 = [v7 objectAtIndexedSubscript:0];
    v94 = [v93 descriptor];
    v95 = [v94 stride];
    [v7 objectAtIndexedSubscript:0];
    v97 = id v96 = v7;
    v98 = [v97 descriptor];
    CPU_BuildPermuteBNNSNDArrayDescriptor(v139, v92, v95, 0, [v98 dataType]);

    id v8 = v142;
    id v7 = v96;

    v99 = [v142 descriptor];
    v100 = [v99 shape];
    v101 = [v142 descriptor];
    v102 = [v101 stride];
    v103 = [v142 descriptor];
    CPU_BuildPermuteBNNSNDArrayDescriptor(v140, v100, v102, 0, [v103 dataType]);
LABEL_39:

    goto LABEL_31;
  }
  int v104 = [v9 deviceOpType];
  v105 = [v7 objectAtIndexedSubscript:0];
  v106 = [v105 descriptor];
  v107 = [v106 shape];
  v108 = v107;
  if (v104 == 43)
  {
    v109 = [v7 objectAtIndexedSubscript:0];
    v110 = [v109 descriptor];
    v111 = [v110 stride];
    [v7 objectAtIndexedSubscript:0];
    v113 = id v112 = v7;
    v114 = [v113 descriptor];
    CPU_BuildBNNSNDArrayLastMajorDescriptor(v139, v108, v111, 0, [v114 dataType]);

    id v8 = v142;
    id v7 = v112;

    v99 = [v142 descriptor];
    v100 = [v99 shape];
    v101 = [v142 descriptor];
    v102 = [v101 stride];
    v103 = [v142 descriptor];
    CPU_BuildBNNSNDArrayLastMajorDescriptor(v140, v100, v102, 0, [v103 dataType]);
    goto LABEL_39;
  }
  v115 = (void *)[v107 mutableCopy];

  v116 = [v7 objectAtIndexedSubscript:0];
  v117 = [v116 descriptor];
  v118 = [v117 stride];
  v119 = (void *)[v118 mutableCopy];

  unsigned int v120 = [v9 deviceOpType];
  if (v120 <= 0x22)
  {
    if (((1 << v120) & 0x60030000CLL) != 0)
    {
      if ([v115 count] == 2)
      {
        [v115 insertObject:&unk_1F3876720 atIndex:2];
        v121 = [v119 objectAtIndexedSubscript:1];
        [v119 insertObject:v121 atIndex:2];
      }
    }
    else if (((1 << v120) & 0x30000000) != 0 && [v115 count] != 4)
    {
      unint64_t v122 = 0;
      do
      {
        [v115 insertObject:&unk_1F3876720 atIndex:1];
        v123 = [v119 objectAtIndexedSubscript:0];
        [v119 insertObject:v123 atIndex:1];

        ++v122;
      }
      while (v122 < 4 - [v115 count]);
    }
  }
  v124 = [v7 objectAtIndexedSubscript:0];
  v125 = [v124 descriptor];
  CPU_BuildBNNSNDArrayDescriptor(v139, v115, v119, 0, [v125 dataType], 1, 0);

  v126 = [v8 descriptor];
  v127 = [v126 shape];
  v128 = (void *)[v127 mutableCopy];

  v129 = [v8 descriptor];
  v130 = [v129 stride];
  v131 = (void *)[v130 mutableCopy];

  if (([v9 deviceOpType] == 28 || objc_msgSend(v9, "deviceOpType") == 29)
    && [v128 count] != 4)
  {
    unint64_t v132 = 0;
    do
    {
      [v128 insertObject:&unk_1F3876720 atIndex:1];
      v133 = [v131 objectAtIndexedSubscript:0];
      [v131 insertObject:v133 atIndex:1];

      ++v132;
    }
    while (v132 < 4 - [v128 count]);
  }
  v134 = [v8 descriptor];
  CPU_BuildBNNSNDArrayDescriptor(v140, v128, v131, 0, [v134 dataType], 1, 0);

LABEL_31:
}

- (unint64_t)allocatedDeviceDataSizeForTraining:(BOOL)a3 layer:(id)a4
{
  return 0;
}

- (void)setConvolutionGradientComputeWeightsAndBiasOnly:(id)a3
{
  id v3 = [a3 objectAtIndexedSubscript:0];
  [v3 setComputeWeightsAndBiasOnly:1];
}

- (void)setFullyConnectedGradientComputeWeightsAndBiasOnly:(id)a3
{
  id v3 = [a3 objectAtIndexedSubscript:0];
  [v3 setComputeWeightsAndBiasOnly:1];
}

- (id)weightsGradients:(id)a3
{
  id v3 = [a3 objectAtIndexedSubscript:0];
  id v4 = [v3 weightsDeltaData];
  uint64_t v5 = [v4 bytes];

  uint64_t v6 = 32;
  if (*(_DWORD *)(v5 + 4) == 0x20000) {
    uint64_t v6 = 16;
  }
  uint64_t v7 = 96;
  if (*(_DWORD *)(v5 + 4) == 0x20000) {
    uint64_t v7 = 80;
  }
  id v8 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*(void *)(v5 + 136) length:CPU_BNNSDataTypeSizeInBytes(*(_DWORD *)(v5 + 144)) * *(void *)(v5 + v6) * *(void *)(v5 + v7) freeWhenDone:0];

  return v8;
}

- (id)biasesGradients:(id)a3
{
  id v3 = [a3 objectAtIndexedSubscript:0];
  id v4 = [v3 biasDeltaData];
  uint64_t v5 = [v4 bytes];

  uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*(void *)(v5 + 136) length:CPU_BNNSDataTypeSizeInBytes(*(_DWORD *)(v5 + 144)) * *(void *)(v5 + 8) freeWhenDone:0];

  return v6;
}

- (id)mhaWeightGradient:(id)a3 withSize:(unint64_t)a4 index:(unint64_t)a5
{
  uint64_t v7 = [a3 objectAtIndexedSubscript:0];
  id v8 = v7;
  if (a5 > 2)
  {
    id v9 = [v7 outDeltaData];
    id v10 = v9;
    unint64_t v11 = 0;
  }
  else
  {
    id v9 = [v7 inDeltaData];
    id v10 = v9;
    unint64_t v11 = a5;
  }
  id v12 = [v9 objectAtIndexedSubscript:v11];
  uint64_t v13 = *(void *)([v12 bytes] + 312);

  uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v13 length:a4 freeWhenDone:0];

  return v14;
}

- (id)mhaBiasGradient:(id)a3 withSize:(unint64_t)a4 index:(unint64_t)a5
{
  uint64_t v7 = [a3 objectAtIndexedSubscript:0];
  id v8 = 0;
  if ([v7 hasBias])
  {
    if (a5 > 2)
    {
      id v9 = [v7 outDeltaData];
      id v10 = v9;
      unint64_t v11 = 0;
    }
    else
    {
      id v9 = [v7 inDeltaData];
      id v10 = v9;
      unint64_t v11 = a5;
    }
    id v12 = [v9 objectAtIndexedSubscript:v11];
    uint64_t v13 = *(void *)([v12 bytes] + 488);

    id v8 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v13 length:a4 freeWhenDone:0];
  }

  return v8;
}

- (id)mhaAttnBiasGradient:(id)a3 withSize:(unint64_t)a4 index:(unint64_t)a5
{
  uint64_t v7 = [a3 objectAtIndexedSubscript:0];
  id v8 = 0;
  if ([v7 hasAttnBias])
  {
    id v9 = [v7 attnBiasDeltaData];
    id v10 = [v9 objectAtIndexedSubscript:a5];
    uint64_t v11 = [v10 bytes];

    id v8 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*(void *)(v11 + 136) length:a4 freeWhenDone:0];
  }

  return v8;
}

- (id)lstmInputWeightGradient:(id)a3 mlcWeightIndex:(unint64_t)a4
{
  uint64_t v5 = [a3 objectAtIndexedSubscript:0];
  id v6 = [v5 lstmDeltaParams];
  uint64_t v7 = (uint64_t *)[v6 bytes];

  char v8 = [v5 biDirectional];
  unint64_t v9 = [v5 numLayers];
  unsigned __int8 v10 = [v5 biDirectional];
  unint64_t v11 = 4 * v9;
  if (v9 < 2 || (v10 & 1) != 0)
  {
    if ((v10 ^ 1)) {
      unint64_t v12 = 0;
    }
    else {
      unint64_t v12 = (a4 - v11) >> 2;
    }
    if (v9 < 2) {
      unint64_t v12 = 0;
    }
  }
  else
  {
    unint64_t v12 = a4 >> 2;
  }
  uint64_t v13 = a4 >= v11;
  unint64_t v14 = a4 & 3;
  uint64_t v15 = v7 + 276;
  id v16 = v7 + 508;
  if ((a4 & 3) == 0) {
    id v16 = v7 + 160;
  }
  if (v14 != 1) {
    uint64_t v15 = v16;
  }
  if (v14 == 2) {
    unsigned int v17 = v7 + 392;
  }
  else {
    unsigned int v17 = v15;
  }
  uint64_t v18 = v17[22 * (v12 != 0) + 17];
  if (v12)
  {
    v13 += (v12 - 1) << v8;
    uint64_t v19 = v7[1];
  }
  else
  {
    uint64_t v19 = *v7;
  }
  id v20 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*(void *)(v18 + 8 * v13) length:4 * v7[1] * v19 freeWhenDone:0];

  return v20;
}

- (id)lstmHiddenWeightGradient:(id)a3 mlcWeightIndex:(unint64_t)a4
{
  uint64_t v5 = [a3 objectAtIndexedSubscript:0];
  id v6 = [v5 lstmDeltaParams];
  uint64_t v7 = [v6 bytes];

  char v8 = [v5 biDirectional];
  unint64_t v9 = [v5 numLayers];
  unsigned __int8 v10 = [v5 biDirectional];
  unint64_t v11 = 4 * v9;
  if (v9 < 2 || (v10 & 1) != 0)
  {
    if ((v10 ^ 1)) {
      unint64_t v12 = 0;
    }
    else {
      unint64_t v12 = (a4 - v11) >> 2;
    }
    if (v9 < 2) {
      unint64_t v12 = 0;
    }
  }
  else
  {
    unint64_t v12 = a4 >> 2;
  }
  unint64_t v13 = a4 & 3;
  unint64_t v14 = (uint64_t *)(v7 + 2696);
  uint64_t v15 = v7 + 4552;
  if ((a4 & 3) == 0) {
    uint64_t v15 = v7 + 1768;
  }
  if (v13 != 1) {
    unint64_t v14 = (uint64_t *)v15;
  }
  if (v13 == 2) {
    id v16 = (uint64_t *)(v7 + 3624);
  }
  else {
    id v16 = v14;
  }
  uint64_t v17 = *v16;
  BOOL v18 = a4 >= v11;
  unint64_t v19 = v12 << v8;
  if (v18) {
    ++v19;
  }
  id v20 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*(void *)(v17 + 8 * v19) length:4 * *(void *)(v7 + 8) * *(void *)(v7 + 8) freeWhenDone:0];

  return v20;
}

- (id)lstmBiasGradient:(id)a3 mlcBiasIndex:(unint64_t)a4
{
  uint64_t v5 = [a3 objectAtIndexedSubscript:0];
  id v6 = [v5 lstmDeltaParams];
  uint64_t v7 = [v6 bytes];

  char v8 = [v5 biDirectional];
  unint64_t v9 = [v5 numLayers];
  unsigned __int8 v10 = [v5 biDirectional];
  unint64_t v11 = 4 * v9;
  if (v9 < 2 || (v10 & 1) != 0)
  {
    if ((v10 ^ 1)) {
      unint64_t v12 = 0;
    }
    else {
      unint64_t v12 = (a4 - v11) >> 2;
    }
    if (v9 < 2) {
      unint64_t v12 = 0;
    }
  }
  else
  {
    unint64_t v12 = a4 >> 2;
  }
  unint64_t v13 = a4 & 3;
  unint64_t v14 = (uint64_t *)(v7 + 3048);
  uint64_t v15 = v7 + 4904;
  if ((a4 & 3) == 0) {
    uint64_t v15 = v7 + 2120;
  }
  if (v13 != 1) {
    unint64_t v14 = (uint64_t *)v15;
  }
  if (v13 == 2) {
    id v16 = (uint64_t *)(v7 + 3976);
  }
  else {
    id v16 = v14;
  }
  uint64_t v17 = *v16;
  unint64_t v18 = v12 << v8;
  if (a4 >= v11) {
    uint64_t v19 = *(void *)(v7 + 8);
  }
  else {
    uint64_t v19 = 0;
  }
  id v20 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v17 + 4 * (v19 + *(void *)(v7 + 8) * v18) length:4 * *(void *)(v7 + 8) freeWhenDone:0];

  return v20;
}

- (id)betaGradients:(id)a3
{
  id v3 = [a3 objectAtIndexedSubscript:0];
  id v4 = [v3 betaDeltaData];
  uint64_t v5 = [v4 bytes];

  int v6 = *(_DWORD *)(v5 + 4);
  if (v6 == 196608)
  {
    uint64_t v7 = *(void *)(v5 + 16) * *(void *)(v5 + 8) * *(void *)(v5 + 24);
  }
  else if (v6 == 0x20000)
  {
    uint64_t v7 = *(void *)(v5 + 16) * *(void *)(v5 + 8);
  }
  else
  {
    uint64_t v7 = 0;
    if (v6 == 0x10000) {
      uint64_t v7 = *(void *)(v5 + 8);
    }
  }
  char v8 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*(void *)(v5 + 136) length:CPU_BNNSDataTypeSizeInBytes(*(_DWORD *)(v5 + 144)) * v7 freeWhenDone:0];

  return v8;
}

- (id)gammaGradients:(id)a3
{
  id v3 = [a3 objectAtIndexedSubscript:0];
  id v4 = [v3 gammaDeltaData];
  uint64_t v5 = [v4 bytes];

  int v6 = *(_DWORD *)(v5 + 4);
  if (v6 == 196608)
  {
    uint64_t v7 = *(void *)(v5 + 16) * *(void *)(v5 + 8) * *(void *)(v5 + 24);
  }
  else if (v6 == 0x20000)
  {
    uint64_t v7 = *(void *)(v5 + 16) * *(void *)(v5 + 8);
  }
  else
  {
    uint64_t v7 = 0;
    if (v6 == 0x10000) {
      uint64_t v7 = *(void *)(v5 + 8);
    }
  }
  char v8 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*(void *)(v5 + 136) length:CPU_BNNSDataTypeSizeInBytes(*(_DWORD *)(v5 + 144)) * v7 freeWhenDone:0];

  return v8;
}

- (id)embeddingWeightsGradients:(id)a3 embeddingCount:(unint64_t)a4 embeddingDimension:(unint64_t)a5
{
  id v8 = a3;
  unint64_t v9 = [v8 objectAtIndexedSubscript:0];
  id v10 = [v9 source];
  uint64_t v32 = [v10 bytes];
  unint64_t v11 = [v10 length];
  unint64_t v12 = a5 * a4;
  unint64_t v13 = (char *)malloc_type_calloc(a5 * a4, 4uLL, 0x100004052888210uLL);
  if (v13)
  {
    unint64_t v14 = v13;
    uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v13 length:4 * v12 freeWhenDone:1];
    id v16 = [v9 weightsDeltaDataBytes];
    uint64_t v17 = [v16 bytes];

    if (v11 >= 8)
    {
      id v31 = v8;
      uint64_t v29 = v15;
      id v30 = v10;
      uint64_t v18 = 0;
      if (v11 >> 3 <= 1) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = v11 >> 3;
      }
      do
      {
        uint64_t v20 = [v9 paddingIndex];
        if (!v20
          || (id v21 = (void *)v20,
              [v9 paddingIndex],
              int v22 = objc_claimAutoreleasedReturnValue(),
              uint64_t v23 = [v22 longLongValue],
              uint64_t v24 = *(void *)(v32 + 8 * v18),
              v22,
              v21,
              v23 != v24))
        {
          if (a5)
          {
            uint64_t v25 = 0;
            id v26 = &v14[4 * *(void *)(v32 + 8 * v18) * a5];
            do
            {
              *(float *)&v26[4 * v25] = *(float *)(v17 + 4 * v25) + *(float *)&v26[4 * v25];
              ++v25;
            }
            while (a5 != v25);
          }
        }
        ++v18;
        v17 += 4 * a5;
      }
      while (v18 != v19);
      id v10 = v30;
      id v8 = v31;
      uint64_t v15 = v29;
    }
  }
  else
  {
    BOOL v27 = +[MLCLog framework];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCLayerOperations) embeddingWeightsGradients:embeddingCount:embeddingDimension:](a2);
    }

    uint64_t v15 = 0;
  }

  return v15;
}

- (void)allocateParameterGradientsForDeviceOps:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 objectAtIndexedSubscript:0];
  switch([v7 deviceOpType])
  {
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0x16u:
    case 0x17u:
    case 0x19u:
    case 0x1Au:
    case 0x1Eu:
    case 0x1Fu:
    case 0x20u:
    case 0x23u:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x28u:
    case 0x29u:
      id v8 = [v7 weightsDeltaDataBytes];

      if (!v8)
      {
        unint64_t v9 = [v6 objectAtIndexedSubscript:0];
        id v10 = [v9 descriptor];
        unint64_t v11 = malloc_type_calloc([v10 tensorAllocationSizeInBytes], 1uLL, 0xE69C1D3FuLL);

        if (!v11)
        {
          id v26 = +[MLCLog framework];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceCPU(MLCLayerOperations) allocateParameterGradientsForDeviceOps:parameters:](a2);
          }
          goto LABEL_13;
        }
        id v12 = [v7 weightsDeltaData];
        *(void *)([v12 bytes] + 136) = v11;

        unint64_t v13 = (void *)MEMORY[0x1E4F1C9B8];
        unint64_t v14 = [v6 objectAtIndexedSubscript:0];
        uint64_t v15 = [v14 descriptor];
        id v16 = objc_msgSend(v13, "dataWithBytesNoCopy:length:freeWhenDone:", v11, objc_msgSend(v15, "tensorAllocationSizeInBytes"), 1);

        [v7 setWeightsDeltaDataBytes:v16];
      }
      if ([v6 count] == 2)
      {
        uint64_t v17 = [v7 biasDeltaDataBytes];

        if (!v17)
        {
          uint64_t v18 = [v6 objectAtIndexedSubscript:1];
          uint64_t v19 = [v18 descriptor];
          uint64_t v20 = malloc_type_calloc([v19 tensorAllocationSizeInBytes], 1uLL, 0x45A00827uLL);

          if (v20)
          {
            id v21 = [v7 biasDeltaData];
            *(void *)([v21 bytes] + 136) = v20;

            int v22 = (void *)MEMORY[0x1E4F1C9B8];
            uint64_t v23 = [v6 objectAtIndexedSubscript:1];
            uint64_t v24 = [v23 descriptor];
            objc_msgSend(v22, "dataWithBytesNoCopy:length:freeWhenDone:", v20, objc_msgSend(v24, "tensorAllocationSizeInBytes"), 1);
            id v25 = (id)objc_claimAutoreleasedReturnValue();

            [v7 setBiasDeltaDataBytes:v25];
            goto LABEL_48;
          }
          id v26 = +[MLCLog framework];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceCPU(MLCLayerOperations) allocateParameterGradientsForDeviceOps:parameters:](a2);
          }
          goto LABEL_13;
        }
      }
      goto LABEL_75;
    case 0x11u:
      v154 = v7;
      id v155 = v6;
      id v25 = v7;
      id v153 = [v25 params];
      uint64_t v27 = [v153 bytes];
      id v152 = [v25 lstmDeltaParams];
      v156 = (void *)[v152 bytes];
      int v28 = *(_DWORD *)(v27 + 44) & 1;
      unint64_t v165 = *(void *)(v27 + 24);
      unint64_t v157 = v165 << v28;
      uint64_t v158 = *(void *)(v27 + 8);
      if (v165 << v28)
      {
        uint64_t v29 = 0;
        unint64_t v30 = 0;
        uint64_t v159 = *(void *)v27;
        do
        {
          uint64_t v31 = 0;
          unint64_t v162 = v30;
          uint64_t v32 = v158;
          if (!(v30 % v165)) {
            uint64_t v32 = v159;
          }
          size_t v33 = 4 * v158 * v32;
          do
          {
            id v34 = (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v33, 1uLL, 0x3CFAEAD9uLL), v33, 1);
            v35 = [v25 inputWeightsDeltaPointers];
            [v35 setObject:v34 atIndexedSubscript:v29 + v31];

            id v36 = (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(4 * v158 * v158, 1uLL, 0x3CFAEAD9uLL), 4 * v158 * v158, 1);
            id v37 = [v25 hiddenWeightsDeltaPointers];
            [v37 setObject:v36 atIndexedSubscript:v29 + v31];

            ++v31;
          }
          while (v31 != 4);
          unint64_t v30 = v162 + 1;
          v29 += 4;
        }
        while (v162 + 1 != v157);
      }
      uint64_t v38 = 0;
      if (v28) {
        size_t v39 = 16;
      }
      else {
        size_t v39 = 8;
      }
      uint64_t v40 = 4 * v165;
      do
      {
        uint64_t v41 = malloc_type_malloc(v39, 0x80040B8603338uLL);
        v42 = [v25 inputWeightsDeltaPointers];
        id v43 = [v42 objectAtIndexedSubscript:v38];
        void *v41 = [v43 bytes];

        if (v28)
        {
          id v44 = [v25 inputWeightsDeltaPointers];
          id v45 = [v44 objectAtIndexedSubscript:v40 + v38];
          v41[1] = [v45 bytes];
        }
        uint64_t v46 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v41 length:v39 freeWhenDone:1];
        v47 = [v25 bnnsInputWeightsDeltaPointers];
        [v47 setObject:v46 atIndexedSubscript:v38];

        ++v38;
      }
      while (v38 != 4);
      v48 = [v25 bnnsInputWeightsDeltaPointers];
      id v49 = [v48 objectAtIndexedSubscript:0];
      v156[177] = [v49 bytes];

      v50 = [v25 bnnsInputWeightsDeltaPointers];
      id v51 = [v50 objectAtIndexedSubscript:1];
      v156[293] = [v51 bytes];

      BOOL v52 = [v25 bnnsInputWeightsDeltaPointers];
      id v53 = [v52 objectAtIndexedSubscript:2];
      v156[409] = [v53 bytes];

      v54 = [v25 bnnsInputWeightsDeltaPointers];
      id v55 = [v54 objectAtIndexedSubscript:3];
      v156[525] = [v55 bytes];

      if (v165 >= 2)
      {
        uint64_t v56 = 0;
        size_t v57 = 8 * ((v165 - 1) << v28);
        uint64_t v58 = 4;
        do
        {
          uint64_t v163 = v56;
          v59 = malloc_type_malloc(v57, 0x80040B8603338uLL);
          uint64_t v60 = 0;
          uint64_t v160 = v58;
          do
          {
            unint64_t v61 = [v25 inputWeightsDeltaPointers];
            id v62 = [v61 objectAtIndexedSubscript:v58];
            v59[v60 << v28] = [v62 bytes];

            if (v28)
            {
              id v63 = [v25 inputWeightsDeltaPointers];
              id v64 = [v63 objectAtIndexedSubscript:v40 + v58];
              *(void *)((char *)v59 + ((8 * (v60 << v28)) | 8)) = [v64 bytes];
            }
            v58 += 4;
            ++v60;
          }
          while (v165 - 1 != v60);
          size_t v57 = 8 * ((v165 - 1) << v28);
          v65 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v59 length:v57 freeWhenDone:1];
          v66 = [v25 bnnsInputWeightsDeltaPointers];
          [v66 setObject:v65 atIndexedSubscript:v163 + 4];

          uint64_t v56 = v163 + 1;
          uint64_t v58 = v160 + 1;
        }
        while (v163 != 3);
        uint64_t v67 = [v25 bnnsInputWeightsDeltaPointers];
        id v68 = [v67 objectAtIndexedSubscript:4];
        v156[199] = [v68 bytes];

        v69 = [v25 bnnsInputWeightsDeltaPointers];
        id v70 = [v69 objectAtIndexedSubscript:5];
        v156[315] = [v70 bytes];

        v71 = [v25 bnnsInputWeightsDeltaPointers];
        id v72 = [v71 objectAtIndexedSubscript:6];
        v156[431] = [v72 bytes];

        v73 = [v25 bnnsInputWeightsDeltaPointers];
        id v74 = [v73 objectAtIndexedSubscript:7];
        v156[547] = [v74 bytes];
      }
      uint64_t v75 = 0;
      size_t v76 = 8 * v157;
      do
      {
        v77 = malloc_type_malloc(v76, 0x80040B8603338uLL);
        if (v165)
        {
          uint64_t v78 = 0;
          uint64_t v79 = v75;
          do
          {
            v80 = [v25 hiddenWeightsDeltaPointers];
            id v81 = [v80 objectAtIndexedSubscript:v79];
            v77[v78 << v28] = [v81 bytes];

            if (v28)
            {
              id v82 = [v25 hiddenWeightsDeltaPointers];
              id v83 = [v82 objectAtIndexedSubscript:v40 + v79];
              *(void *)((char *)v77 + ((8 * (v78 << v28)) | 8)) = [v83 bytes];
            }
            ++v78;
            v79 += 4;
          }
          while (v165 != v78);
        }
        size_t v76 = 8 * v157;
        v84 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v77 length:8 * v157 freeWhenDone:1];
        v85 = [v25 bnnsHiddenWeightsDeltaPointers];
        [v85 setObject:v84 atIndexedSubscript:v75];

        ++v75;
      }
      while (v75 != 4);
      v86 = [v25 bnnsHiddenWeightsDeltaPointers];
      id v87 = [v86 objectAtIndexedSubscript:0];
      v156[221] = [v87 bytes];

      v88 = [v25 bnnsHiddenWeightsDeltaPointers];
      id v89 = [v88 objectAtIndexedSubscript:1];
      v156[337] = [v89 bytes];

      v90 = [v25 bnnsHiddenWeightsDeltaPointers];
      id v91 = [v90 objectAtIndexedSubscript:2];
      v156[453] = [v91 bytes];

      v92 = [v25 bnnsHiddenWeightsDeltaPointers];
      id v93 = [v92 objectAtIndexedSubscript:3];
      v156[569] = [v93 bytes];

      uint64_t v7 = v154;
      id v6 = v155;
      if ([v25 hasBias])
      {
        for (uint64_t i = 0; i != 4; ++i)
        {
          id v95 = (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc((v40 << v28) * v158, 1uLL, 0x3CFAEAD9uLL), (v40 << v28) * v158, 1);
          id v96 = [v25 weightAndBiasGateDeltaBuffers];
          [v96 setObject:v95 atIndexedSubscript:i];
        }
        v97 = [v25 weightAndBiasGateDeltaBuffers];
        id v98 = [v97 objectAtIndexedSubscript:0];
        v156[265] = [v98 bytes];

        v99 = [v25 weightAndBiasGateDeltaBuffers];
        id v100 = [v99 objectAtIndexedSubscript:1];
        v156[381] = [v100 bytes];

        v101 = [v25 weightAndBiasGateDeltaBuffers];
        id v102 = [v101 objectAtIndexedSubscript:2];
        v156[497] = [v102 bytes];

        v103 = [v25 weightAndBiasGateDeltaBuffers];
        id v104 = [v103 objectAtIndexedSubscript:3];
        v156[613] = [v104 bytes];
      }
      goto LABEL_48;
    case 0x2Cu:
      v105 = [v7 biasDeltaDataBytesArray];
      uint64_t v106 = [v105 count];

      if (v106) {
        goto LABEL_50;
      }
      if ([v6 count] == 6)
      {
        int v107 = 0;
        int v161 = 1;
        uint64_t v164 = 4;
      }
      else
      {
        if ([v6 count] == 8)
        {
          uint64_t v164 = 0;
          int v161 = 0;
        }
        else
        {
          if ([v6 count] != 10)
          {
LABEL_50:
            uint64_t v164 = 0;
            int v161 = 0;
            int v107 = 0;
            goto LABEL_63;
          }
          int v161 = 1;
          uint64_t v164 = 8;
        }
        int v107 = 1;
      }
LABEL_63:
      v118 = [v7 weightsDeltaDataBytesArray];
      v119 = [v7 biasDeltaDataBytesArray];
      unsigned int v120 = [v7 weightsDeltaDataBytesArray];
      uint64_t v121 = [v120 count];

      v166 = v118;
      if (!v121)
      {
        for (uint64_t j = 0; j != 4; ++j)
        {
          v123 = v7;
          if (j == 3)
          {
            v124 = [v7 outDeltaData];
            v125 = v124;
            uint64_t v126 = 0;
          }
          else
          {
            v124 = [v7 inDeltaData];
            v125 = v124;
            uint64_t v126 = j;
          }
          v127 = [v124 objectAtIndexedSubscript:v126];

          v128 = [v6 objectAtIndexedSubscript:j];
          v129 = [v128 descriptor];
          size_t v130 = [v129 tensorAllocationSizeInBytes];

          v131 = malloc_type_malloc(v130, 0x66A9F490uLL);
          unint64_t v132 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v131 length:v130 freeWhenDone:1];
          [v118 addObject:v132];
          id v133 = v127;
          *(void *)([v133 bytes] + 312) = v131;
          if (v107)
          {
            v134 = [v6 objectAtIndexedSubscript:j + 4];
            uint64_t v135 = [v134 descriptor];
            id v136 = v6;
            size_t v137 = [v135 tensorAllocationSizeInBytes];

            v138 = malloc_type_malloc(v137, 0xE62CB0FuLL);
            size_t v139 = v137;
            id v6 = v136;
            v118 = v166;
            uint64_t v140 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v138 length:v139 freeWhenDone:1];
            [v119 addObject:v140];
            *(void *)([v133 bytes] + 488) = v138;
          }
          uint64_t v7 = v123;
        }
      }
      if (v161)
      {
        uint64_t v141 = 0;
        char v142 = 1;
        do
        {
          char v143 = v142;
          v144 = [v7 attnBiasDeltaData];
          v145 = [v144 objectAtIndexedSubscript:v141];

          v146 = [v6 objectAtIndexedSubscript:v141 | v164];
          v147 = [v146 descriptor];
          size_t v148 = [v147 tensorAllocationSizeInBytes];

          v149 = malloc_type_malloc(v148, 0x84B0DDC2uLL);
          v150 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v149 length:v148 freeWhenDone:1];
          [v119 addObject:v150];
          id v151 = v145;
          *(void *)([v151 bytes] + 136) = v149;

          char v142 = 0;
          uint64_t v141 = 1;
        }
        while ((v143 & 1) != 0);
      }

LABEL_75:
      return;
    case 0x2Fu:
      v108 = [v7 weightsDeltaDataBytesArray];
      uint64_t v109 = [v108 count];

      if (!v109)
      {
        v110 = [v6 objectAtIndexedSubscript:0];
        v111 = [v110 descriptor];
        id v112 = malloc_type_calloc([v111 tensorAllocationSizeInBytes], 1uLL, 0xEFBE7BB1uLL);

        if (v112)
        {
          id v113 = [v7 weightsDeltaData];
          *(void *)([v113 bytes] + 136) = v112;

          v114 = (void *)MEMORY[0x1E4F1C9B8];
          v115 = [v6 objectAtIndexedSubscript:0];
          v116 = [v115 descriptor];
          objc_msgSend(v114, "dataWithBytesNoCopy:length:freeWhenDone:", v112, objc_msgSend(v116, "tensorAllocationSizeInBytes"), 1);
          id v25 = (id)objc_claimAutoreleasedReturnValue();

          v117 = [v7 weightsDeltaDataBytesArray];
          [v117 addObject:v25];

LABEL_48:
        }
        else
        {
          id v26 = +[MLCLog framework];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceCPU(MLCLayerOperations) allocateParameterGradientsForDeviceOps:parameters:](a2);
          }
LABEL_13:
        }
      }
      goto LABEL_75;
    default:
      goto LABEL_75;
  }
}

- (void)allocateResultTensor:(id)a3
{
  id v5 = a3;
  id v6 = [v5 deviceMemory];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [v5 deviceMemory];
    uint64_t v9 = [v8 count];

    if (v9 == 1)
    {
      id v10 = [v5 deviceMemory];
      unint64_t v11 = [v10 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        unint64_t v13 = [v5 deviceMemory];
        unint64_t v14 = [v13 objectAtIndexedSubscript:0];
        objc_opt_class();
        char v15 = objc_opt_isKindOfClass();

        if (v15)
        {
          size_t v16 = [(MLCDeviceCPU *)self deviceMemorySizeForTensor:v5];
          uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_malloc(v16, 0x1BF17510uLL), v16, 1);
          uint64_t v18 = [v5 deviceMemory];
          [v18 addObject:v17];

          [v5 setDeviceIndex:1];
        }
        else
        {
          uint64_t v19 = +[MLCLog framework];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceCPU(MLCEngineDispatch) allocateResultTensor:](a2);
          }
        }
      }
    }
  }
  else
  {
    [(MLCDeviceCPU *)self allocateDeviceMemoryForTensor:v5];
  }
}

- (void)shareResultTensor:(id)a3 sourceTensor:(id)a4 deviceOps:(id)a5
{
  id v16 = a3;
  id v7 = a4;
  id v8 = [v16 deviceMemory];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = CPU_GetDeviceMemoryData(v16);
    unint64_t v11 = CPU_GetDeviceMemoryData(v7);

    if (v10 != v11)
    {
      id v12 = CPU_GetDeviceMemoryData(v7);
      CPU_GetDeviceMemoryData(v16);
      id v13 = objc_claimAutoreleasedReturnValue();
      unint64_t v14 = (void *)[v13 bytes];
      id v15 = v12;
      memcpy(v14, (const void *)[v15 bytes], objc_msgSend(v15, "length"));
    }
  }
  else
  {
    [(MLCDeviceCPU *)self shareDeviceMemoryWithResultTensor:v16 sourceTensor:v7];
  }
}

- (void)dispatchForwardSplitLayer:(id)a3 sourceTensor:(id)a4 resultTensors:(id)a5 forConcat:(BOOL)a6
{
  BOOL v62 = a6;
  SEL v59 = a2;
  id v64 = a4;
  id v8 = a5;
  id v63 = [a3 objectAtIndexedSubscript:0];
  memset(&src, 0, sizeof(src));
  memset(&dest, 0, sizeof(dest));
  if ([v8 count])
  {
    uint64_t v9 = 0;
    uint64_t v60 = v8;
    while (1)
    {
      id v10 = objc_msgSend(v8, "objectAtIndexedSubscript:", v9, v59);
      [(MLCDeviceCPU *)self allocateResultTensor:v10];

      unint64_t v11 = [v8 objectAtIndexedSubscript:v9];
      id v12 = [v11 descriptor];
      id v13 = [v12 shape];
      unint64_t v14 = [v64 descriptor];
      id v15 = [v14 stride];
      id v16 = [v64 descriptor];
      CPU_BuildBNNSNDArrayDescriptor((uint64_t)&src, v13, v15, 0, [v16 dataType], 1, 0);

      uint64_t v17 = [v8 objectAtIndexedSubscript:v9];
      uint64_t v18 = v17;
      if (v62) {
        uint64_t BNNSConcatLayerTensorDataOffset = getBNNSConcatLayerTensorDataOffset(v17);
      }
      else {
        uint64_t BNNSConcatLayerTensorDataOffset = getBNNSSplitLayerTensorDataOffset(v17);
      }
      uint64_t v20 = BNNSConcatLayerTensorDataOffset;

      CPU_GetDeviceMemoryData(v64);
      id v21 = objc_claimAutoreleasedReturnValue();
      src.data = (void *)([v21 bytes] + v20);

      id v8 = v60;
      int v22 = [v60 objectAtIndexedSubscript:v9];
      uint64_t v23 = [v22 descriptor];
      uint64_t v24 = [v23 shape];
      id v25 = [v60 objectAtIndexedSubscript:v9];
      id v26 = [v25 descriptor];
      uint64_t v27 = [v26 stride];
      int v28 = [v60 objectAtIndexedSubscript:v9];
      uint64_t v29 = [v28 descriptor];
      CPU_BuildBNNSNDArrayDescriptor((uint64_t)&dest, v24, v27, 0, [v29 dataType], 1, 0);

      unint64_t v30 = [v60 objectAtIndexedSubscript:v9];
      CPU_GetDeviceMemoryData(v30);
      id v31 = objc_claimAutoreleasedReturnValue();
      dest.data = (void *)[v31 bytes];

      uint64_t v32 = [v64 descriptor];
      int v33 = [v32 dataType];

      if (src.layout == BNNSDataLayoutVector) {
        uint64_t v34 = 1;
      }
      else {
        uint64_t v34 = 3;
      }
      if (src.layout == BNNSDataLayoutVector) {
        BNNSDataLayout v35 = BNNSDataLayout2DLastMajor;
      }
      else {
        BNNSDataLayout v35 = BNNSDataLayout4DLastMajor;
      }
      src.layout = v35;
      if (dest.layout == BNNSDataLayoutVector) {
        BNNSDataLayout v36 = BNNSDataLayout2DLastMajor;
      }
      else {
        BNNSDataLayout v36 = BNNSDataLayout4DLastMajor;
      }
      dest.layout = v36;
      unint64_t v37 = [v63 batchSize];
      uint64_t v38 = [v60 objectAtIndexedSubscript:v9];
      size_t v39 = [v38 descriptor];
      uint64_t v40 = [v39 shape];
      uint64_t v41 = [v40 objectAtIndexedSubscript:0];
      unint64_t v42 = [v41 unsignedIntegerValue];

      if (v37 > v42)
      {
        id v43 = [v60 objectAtIndexedSubscript:v9];
        id v44 = [v43 descriptor];
        id v45 = [v44 shape];
        uint64_t v46 = [v45 objectAtIndexedSubscript:0];
        unint64_t v37 = [v46 unsignedIntegerValue];
      }
      v47 = (char *)&src + 8 * v34;
      *((void *)v47 + 1) = v37;
      v48 = [v64 descriptor];
      id v49 = [v48 stride];
      v50 = [v49 objectAtIndexedSubscript:0];
      unint64_t v51 = [v50 unsignedIntegerValue];
      char v52 = v33 == 1 ? 2 : v33 == 3;
      *((void *)v47 + 9) = v51 >> v52;

      id v53 = (char *)&dest + 8 * v34;
      *((void *)v53 + 1) = v37;
      v54 = [v60 objectAtIndexedSubscript:v9];
      id v55 = [v54 descriptor];
      uint64_t v56 = [v55 stride];
      size_t v57 = [v56 objectAtIndexedSubscript:0];
      *((void *)v53 + 9) = (unint64_t)[v57 unsignedIntegerValue] >> v52;

      if (BNNSCopy(&dest, &src, 0)) {
        break;
      }
      if (++v9 >= (unint64_t)[v60 count]) {
        goto LABEL_26;
      }
    }
    uint64_t v58 = +[MLCLog framework];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardSplitLayer:sourceTensor:resultTensors:forConcat:]();
    }
  }
LABEL_26:
}

- (void)dispatchForwardSliceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  [(MLCDeviceCPU *)self allocateResultTensor:v9];
  id v12 = [v11 objectAtIndexedSubscript:0];

  id v13 = CPU_GetDeviceMemoryData(v10);

  unint64_t v14 = CPU_GetDeviceMemoryData(v9);

  id v15 = [v12 inDeltaData];
  id v16 = [v15 objectAtIndexedSubscript:0];
  uint64_t v17 = (const BNNSNDArrayDescriptor *)[v16 bytes];

  uint64_t v18 = [v12 outDeltaData];
  id v19 = [v18 objectAtIndexedSubscript:0];
  uint64_t v20 = (BNNSNDArrayDescriptor *)[v19 bytes];

  uint64_t v21 = [v12 beginOffset];
  id v22 = v13;
  v17->data = (void *)([v22 bytes] + v21);
  id v23 = v14;
  v20->data = (void *)[v23 bytes];
  if (BNNSCopy(v20, v17, 0))
  {
    uint64_t v24 = +[MLCLog framework];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardSliceLayer:sourceTensor:resultTensor:forTraining:]();
    }
  }
}

- (void)dispatchGradientReshapeLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
}

- (void)dispatchGradientSliceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(MLCDeviceCPU *)self allocateResultTensor:v8];
  id v11 = [v10 objectAtIndexedSubscript:0];

  id v12 = CPU_GetDeviceMemoryData(v9);

  id v13 = CPU_GetDeviceMemoryData(v8);

  id v14 = v13;
  bzero((void *)[v14 bytes], objc_msgSend(v14, "length"));
  id v15 = [v11 inDeltaData];
  id v16 = [v15 objectAtIndexedSubscript:0];
  uint64_t v17 = (BNNSNDArrayDescriptor *)[v16 bytes];

  uint64_t v18 = [v11 outDeltaData];
  id v19 = [v18 objectAtIndexedSubscript:0];
  uint64_t v20 = (const BNNSNDArrayDescriptor *)[v19 bytes];

  id v21 = v12;
  v20->data = (void *)[v21 bytes];
  uint64_t v22 = [v11 beginOffset];
  id v23 = v14;
  v17->data = (void *)([v23 bytes] + v22);
  if (BNNSCopy(v17, v20, 0))
  {
    uint64_t v24 = +[MLCLog framework];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardSliceLayer:sourceTensor:resultTensor:forTraining:]();
    }
  }
}

- (void)dispatchGradientSplitLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensor:(id)a5 forConcat:(BOOL)a6
{
  BOOL v66 = a6;
  id v9 = a4;
  id v10 = a5;
  uint64_t v67 = [a3 objectAtIndexedSubscript:0];
  memset(&src, 0, sizeof(src));
  memset(&dest, 0, sizeof(dest));
  id v68 = v10;
  [(MLCDeviceCPU *)self allocateResultTensor:v10];
  if ([v9 count])
  {
    uint64_t v11 = 0;
    while (1)
    {
      id v12 = [v9 objectAtIndexedSubscript:v11];
      id v13 = [v12 deviceMemory];
      uint64_t v14 = [v13 count];

      if (v14)
      {
        id v15 = [v9 objectAtIndexedSubscript:v11];
        id v16 = [v15 descriptor];
        uint64_t v17 = [v16 shape];
        uint64_t v18 = [v9 objectAtIndexedSubscript:v11];
        id v19 = [v18 descriptor];
        uint64_t v20 = [v19 stride];
        id v21 = [v9 objectAtIndexedSubscript:v11];
        uint64_t v22 = [v21 descriptor];
        CPU_BuildBNNSNDArrayDescriptor((uint64_t)&src, v17, v20, 0, [v22 dataType], 1, 0);

        id v23 = [v9 objectAtIndexedSubscript:v11];
        CPU_GetDeviceMemoryData(v23);
        id v24 = objc_claimAutoreleasedReturnValue();
        src.data = (void *)[v24 bytes];

        id v25 = [v9 objectAtIndexedSubscript:v11];
        id v26 = [v25 descriptor];
        uint64_t v27 = [v26 shape];
        int v28 = [v68 descriptor];
        uint64_t v29 = [v28 stride];
        unint64_t v30 = [v68 descriptor];
        CPU_BuildBNNSNDArrayDescriptor((uint64_t)&dest, v27, v29, 0, [v30 dataType], 1, 0);

        id v31 = [v9 objectAtIndexedSubscript:v11];
        uint64_t v32 = v31;
        if (v66) {
          uint64_t BNNSConcatLayerTensorDataOffset = getBNNSConcatLayerTensorDataOffset(v31);
        }
        else {
          uint64_t BNNSConcatLayerTensorDataOffset = getBNNSSplitLayerTensorDataOffset(v31);
        }
        uint64_t v34 = BNNSConcatLayerTensorDataOffset;

        CPU_GetDeviceMemoryData(v68);
        id v35 = objc_claimAutoreleasedReturnValue();
        dest.data = (void *)([v35 bytes] + v34);

        BNNSDataLayout v36 = [v68 descriptor];
        int v37 = [v36 dataType];

        if (src.layout == BNNSDataLayoutVector) {
          uint64_t v38 = 1;
        }
        else {
          uint64_t v38 = 3;
        }
        if (src.layout == BNNSDataLayoutVector) {
          BNNSDataLayout v39 = BNNSDataLayout2DLastMajor;
        }
        else {
          BNNSDataLayout v39 = BNNSDataLayout4DLastMajor;
        }
        src.layout = v39;
        if (dest.layout == BNNSDataLayoutVector) {
          BNNSDataLayout v40 = BNNSDataLayout2DLastMajor;
        }
        else {
          BNNSDataLayout v40 = BNNSDataLayout4DLastMajor;
        }
        dest.layout = v40;
        unint64_t v41 = [v67 batchSize];
        unint64_t v42 = [v9 objectAtIndexedSubscript:v11];
        id v43 = [v42 descriptor];
        id v44 = [v43 shape];
        id v45 = [v44 objectAtIndexedSubscript:0];
        unint64_t v46 = [v45 unsignedIntegerValue];

        if (v41 > v46)
        {
          v47 = [v9 objectAtIndexedSubscript:v11];
          v48 = [v47 descriptor];
          id v49 = [v48 shape];
          v50 = [v49 objectAtIndexedSubscript:0];
          unint64_t v41 = [v50 unsignedIntegerValue];
        }
        unint64_t v51 = v41;
        char v52 = v9;
        uint64_t v53 = v38;
        v54 = (char *)&src + 8 * v38;
        *((void *)v54 + 1) = v51;
        id v55 = [v52 objectAtIndexedSubscript:v11];
        uint64_t v56 = [v55 descriptor];
        size_t v57 = [v56 stride];
        uint64_t v58 = [v57 objectAtIndexedSubscript:0];
        unint64_t v59 = [v58 unsignedIntegerValue];
        char v60 = v37 == 1 ? 2 : v37 == 3;
        *((void *)v54 + 9) = v59 >> v60;

        unint64_t v61 = (char *)&dest + 8 * v53;
        id v9 = v52;
        *((void *)v61 + 1) = v51;
        BOOL v62 = [v68 descriptor];
        id v63 = [v62 stride];
        id v64 = [v63 objectAtIndexedSubscript:0];
        *((void *)v61 + 9) = (unint64_t)[v64 unsignedIntegerValue] >> v60;

        if (BNNSCopy(&dest, &src, 0)) {
          break;
        }
      }
      if (++v11 >= (unint64_t)[v9 count]) {
        goto LABEL_27;
      }
    }
    v65 = +[MLCLog framework];
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardSplitLayer:sourceTensor:resultTensors:forConcat:]();
    }
  }
LABEL_27:
}

- (void)dispatchForwardSplitLayer:(id)a3 sourceTensor:(id)a4 resultTensors:(id)a5
{
}

- (void)dispatchGradientSplitLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensor:(id)a5
{
}

- (void)dispatchForwardConcatLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 objectAtIndexedSubscript:0];
  uint64_t v12 = [v11 concatDimension];

  if (v12 == 1)
  {
    if ([v9 count])
    {
      unint64_t v13 = 0;
      do
      {
        uint64_t v14 = [v9 objectAtIndexedSubscript:v13];
        v16[0] = v14;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
        [(MLCDeviceCPU *)self dispatchGradientSplitLayer:v8 sourceGradientTensors:v15 resultGradientTensor:v10 forConcat:1];

        ++v13;
      }
      while (v13 < [v9 count]);
    }
  }
  else
  {
    [(MLCDeviceCPU *)self dispatchGradientSplitLayer:v8 sourceGradientTensors:v9 resultGradientTensor:v10 forConcat:1];
  }
}

- (void)dispatchGradientConcatLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 objectAtIndexedSubscript:0];
  uint64_t v12 = [v11 concatDimension];

  if (v12 == 1)
  {
    if ([v10 count])
    {
      unint64_t v13 = 0;
      do
      {
        uint64_t v14 = [v10 objectAtIndexedSubscript:v13];
        v16[0] = v14;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
        [(MLCDeviceCPU *)self dispatchForwardSplitLayer:v8 sourceTensor:v9 resultTensors:v15 forConcat:1];

        ++v13;
      }
      while (v13 < [v10 count]);
    }
  }
  else
  {
    [(MLCDeviceCPU *)self dispatchForwardSplitLayer:v8 sourceTensor:v9 resultTensors:v10 forConcat:1];
  }
}

- (void)dispatchForwardMatMulLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [v8 objectAtIndexedSubscript:0];
  uint64_t v12 = [v8 objectAtIndexedSubscript:1];
  [(MLCDeviceCPU *)self allocateResultTensor:v9];
  unint64_t v13 = [v10 objectAtIndexedSubscript:0];

  BNNSDataLayout v39 = v11;
  uint64_t v14 = CPU_GetDeviceMemoryData(v11);
  uint64_t v38 = v12;
  id v15 = CPU_GetDeviceMemoryData(v12);
  id v16 = CPU_GetDeviceMemoryData(v9);

  if ([v8 count] == 3)
  {
    uint64_t v17 = [v8 objectAtIndexedSubscript:2];
    uint64_t v18 = CPU_GetDeviceMemoryData(v17);

    [v8 objectAtIndexedSubscript:2];
    id v19 = v18;
    uint64_t v20 = [v19 bytes];
    id v21 = [v13 fusedPrimitiveParams];
    *(void *)([v21 bytes] + 312) = v20;

    uint64_t v22 = [v16 bytes];
    id v23 = [v13 params];
    *(void *)([v23 bytes] + 504) = v22;

    id v24 = [v13 params];
    id v25 = (BNNSNDArrayDescriptor *)([v24 bytes] + 368);
    id v26 = [v13 fusedPrimitiveParams];
    LODWORD(v25) = BNNSCopy(v25, (const BNNSNDArrayDescriptor *)([v26 bytes] + 176), 0);

    if (v25)
    {
      uint64_t v27 = +[MLCLog framework];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardMatMulLayer:sourceTensors:resultTensor:]();
      }
    }
  }
  filter = objc_msgSend(v13, "BNNSFilter", a2);
  id v28 = v14;
  uint64_t v29 = (const void *)[v28 bytes];
  size_t v30 = [v13 sourceStride];
  id v31 = v15;
  uint64_t v32 = (const void *)[v31 bytes];
  size_t v33 = [v13 sourceStrideSecondary];
  id v34 = v16;
  if (BNNSFilterApplyTwoInputBatch(filter, 1uLL, v29, v30, v32, v33, (void *)[v34 bytes], objc_msgSend(v13, "resultStride")))
  {
    id v35 = +[MLCLog framework];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardMatMulLayer:sourceTensors:resultTensor:]();
    }
  }
  [v13 setSource:v28];
  [v13 setSecondarySource:v31];
}

- (void)dispatchForwardEmbeddingLayer:(id)a3 weight:(id)a4 sourceTensor:(id)a5 resultTensor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(MLCDeviceCPU *)self allocateResultTensor:v13];
  id v55 = v10;
  uint64_t v14 = [v10 objectAtIndexedSubscript:0];
  id v15 = CPU_GetDeviceMemoryData(v12);
  [v14 setSource:v15];
  id v58 = v15;
  id v16 = (uint64_t *)[v58 bytes];
  id v57 = [v11 data];
  uint64_t v17 = [v57 bytes];
  unint64_t v59 = v13;
  CPU_GetDeviceMemoryData(v13);
  id v56 = objc_claimAutoreleasedReturnValue();
  uint64_t v18 = (char *)[v56 bytes];
  id v19 = [v11 descriptor];
  uint64_t v20 = [v19 shape];
  unint64_t v61 = v11;
  id v21 = [v11 descriptor];
  uint64_t v22 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v21, "dimensionCount") - 1);
  uint64_t v23 = [v22 unsignedIntegerValue];

  vDSP_Length __N = v23;
  id v24 = [v12 descriptor];
  unint64_t v25 = [v24 tensorAllocationSizeInBytes];
  char v60 = v12;
  id v26 = [v12 descriptor];
  unint64_t v27 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", [v26 dataType]);
  unint64_t v28 = v25 / v27;

  uint64_t v29 = [v14 embeddingParams];

  if (v29)
  {
    size_t v30 = [v14 embeddingParams];
    id v31 = [v30 objectAtIndexedSubscript:0];
    [v31 floatValue];
    float v33 = v32;

    id v34 = [v14 embeddingParams];
    id v35 = [v34 objectAtIndexedSubscript:1];
    [v35 floatValue];
    float v37 = v36;
    float v64 = v36;

    if (v37 == INFINITY)
    {
      uint64_t v38 = v55;
      if (v27 <= v25)
      {
        if (v28 <= 1) {
          uint64_t v39 = 1;
        }
        else {
          uint64_t v39 = v25 / v27;
        }
        do
        {
          float __C = 0.0;
          uint64_t v40 = *v16++;
          unint64_t v41 = (float *)(v17 + 4 * v23 * v40);
          vDSP_maxmgv(v41, 1, &__C, v23);
          if (__C > (float)(v33 + 0.00001))
          {
            float __B = v33 / __C;
            vDSP_vsmul(v41, 1, &__B, v41, 1, v23);
          }
          memcpy(v18, v41, 4 * v23);
          v18 += 4 * v23;
          --v39;
        }
        while (v39);
      }
    }
    else if (v37 == 1.0)
    {
      uint64_t v38 = v55;
      if (v27 <= v25)
      {
        if (v28 <= 1) {
          uint64_t v44 = 1;
        }
        else {
          uint64_t v44 = v25 / v27;
        }
        do
        {
          float __C = 0.0;
          uint64_t v45 = *v16++;
          unint64_t v46 = (float *)(v17 + 4 * v23 * v45);
          vDSP_svemg(v46, 1, &__C, v23);
          if (__C > (float)(v33 + 0.00001))
          {
            float __B = v33 / __C;
            vDSP_vsmul(v46, 1, &__B, v46, 1, v23);
          }
          memcpy(v18, v46, 4 * v23);
          v18 += 4 * v23;
          --v44;
        }
        while (v44);
      }
    }
    else
    {
      uint64_t v38 = v55;
      if (v37 == 2.0)
      {
        if (v27 <= v25)
        {
          if (v28 <= 1) {
            uint64_t v47 = 1;
          }
          else {
            uint64_t v47 = v25 / v27;
          }
          do
          {
            float __C = 0.0;
            uint64_t v48 = *v16++;
            id v49 = (float *)(v17 + 4 * v23 * v48);
            vDSP_svesq(v49, 1, &__C, v23);
            float v50 = sqrtf(__C);
            float __C = v50;
            if (v50 > (float)(v33 + 0.00001))
            {
              float __B = v33 / v50;
              vDSP_vsmul(v49, 1, &__B, v49, 1, v23);
            }
            memcpy(v18, v49, 4 * v23);
            v18 += 4 * v23;
            --v47;
          }
          while (v47);
        }
      }
      else if (v27 <= v25)
      {
        if (v28 <= 1) {
          uint64_t v51 = 1;
        }
        else {
          uint64_t v51 = v25 / v27;
        }
        do
        {
          float __C = 0.0;
          uint64_t v52 = *v16++;
          uint64_t v53 = (void *)(v17 + 4 * v23 * v52);
          memcpy(v18, v53, 4 * v23);
          vDSP_vabs((const float *)v18, 1, (float *)v18, 1, v23);
          vvpowsf((float *)v18, &v64, (const float *)v18, (const int *)&__N);
          vDSP_sve((const float *)v18, 1, &__C, __N);
          float v54 = powf(__C, 1.0 / v64);
          float __C = v54;
          if (v54 > (float)(v33 + 0.00001))
          {
            float __B = v33 / v54;
            vDSP_vsmul((const float *)v53, 1, &__B, (float *)v53, 1, __N);
          }
          uint64_t v23 = __N;
          memcpy(v18, v53, 4 * __N);
          v18 += 4 * v23;
          --v51;
        }
        while (v51);
      }
    }
  }
  else
  {
    uint64_t v38 = v55;
    if (v27 <= v25)
    {
      if (v28 <= 1) {
        uint64_t v42 = 1;
      }
      else {
        uint64_t v42 = v25 / v27;
      }
      do
      {
        uint64_t v43 = *v16++;
        memcpy(v18, (const void *)(v17 + 4 * v23 * v43), 4 * v23);
        v18 += 4 * v23;
        --v42;
      }
      while (v42);
    }
  }
}

- (void)dispatchForwardMHALayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  id v7 = (id)a7;
  id v11 = a4;
  id v12 = a5;
  id v13 = a3;
  [(MLCDeviceCPU *)self allocateResultTensor:v12];
  uint64_t v14 = [v11 objectAtIndexedSubscript:0];
  id v15 = CPU_GetDeviceMemoryData(v14);

  id v16 = [v11 objectAtIndexedSubscript:1];
  uint64_t v17 = CPU_GetDeviceMemoryData(v16);

  uint64_t v18 = [v11 objectAtIndexedSubscript:2];
  id v19 = CPU_GetDeviceMemoryData(v18);

  unint64_t v59 = CPU_GetDeviceMemoryData(v12);

  [v11 objectAtIndexedSubscript:0];
  [v11 objectAtIndexedSubscript:1];

  [v11 objectAtIndexedSubscript:2];
  uint64_t v20 = [v13 objectAtIndexedSubscript:0];

  unint64_t v61 = (void *)[v20 BNNSFilter];
  if ([v20 hasKeyMask])
  {
    id v21 = [v11 objectAtIndexedSubscript:3];
    uint64_t v22 = CPU_GetDeviceMemoryData(v21);

    id v23 = [v20 keyMask];
    uint64_t v24 = [v23 bytes];

    id v25 = v22;
    *(void *)(v24 + 136) = [v25 bytes];
  }
  if ([v20 hasKeyMask])
  {
    if ([v20 hasAttnMask]) {
      uint64_t v26 = 4;
    }
    else {
      uint64_t v26 = 3;
    }
  }
  else
  {
    uint64_t v26 = 3;
  }
  if ([v20 hasAttnMask])
  {
    unint64_t v27 = [v11 objectAtIndexedSubscript:v26];
    unint64_t v28 = CPU_GetDeviceMemoryData(v27);

    id v29 = [v20 attnMask];
    uint64_t v30 = [v29 bytes];

    id v31 = v28;
    *(void *)(v30 + 136) = [v31 bytes];
  }
  BOOL v62 = 0;
  id v63 = 0;
  size_t workspace_size = 0;
  backprop_cache_size[0] = 0;
  if (v7)
  {
    if (BNNSApplyMultiheadAttention(v61, [v20 batchSize], (const void *)objc_msgSend(v15, "bytes"), 0, (const void *)objc_msgSend(objc_retainAutorelease(v17), "bytes"), 0, 0, 0, (const void *)objc_msgSend(objc_retainAutorelease(v19), "bytes"), 0, objc_msgSend(objc_retainAutorelease(v59), "bytes"), 0, 0, backprop_cache_size, 0, &workspace_size, 0))
    {
      float v32 = +[MLCLog framework];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardMHALayer:sourceTensors:resultTensor:resultStateIsTemporary:forTraining:]();
      }
    }
    if (backprop_cache_size[0]) {
      id v63 = malloc_type_malloc(backprop_cache_size[0], 0x4790C500uLL);
    }
    else {
      id v63 = 0;
    }
    if (workspace_size) {
      BOOL v62 = malloc_type_malloc(workspace_size, 0x27382CF9uLL);
    }
    else {
      BOOL v62 = 0;
    }
  }
  id v58 = v11;
  size_t v54 = [v20 batchSize];
  id v33 = v15;
  uint64_t v53 = (const void *)[v33 bytes];
  size_t v52 = [v20 sourceStride];
  id v34 = v17;
  uint64_t v51 = (const void *)[v34 bytes];
  uint64_t key_stride = [v20 sourceStrideSecondary];
  int v57 = (int)v7;
  id v56 = v34;
  int v49 = [v20 hasKeyMask];
  if (v49)
  {
    id v48 = [v20 keyMask];
    id v35 = (const BNNSNDArrayDescriptor *)[v48 bytes];
  }
  else
  {
    id v35 = 0;
  }
  size_t v36 = [v20 keyMaskStride];
  id v55 = v19;
  value = (const void *)[v55 bytes];
  size_t value_stride = [v20 sourceStrideTertiary];
  id v60 = v59;
  uint64_t v39 = (void *)[v60 bytes];
  size_t output_stride = [v20 resultStride];
  int v41 = [v20 hasAttnMask];
  if (v41)
  {
    id v7 = [v20 attnMask];
    uint64_t v42 = (const BNNSNDArrayDescriptor *)[v7 bytes];
  }
  else
  {
    uint64_t v42 = 0;
  }
  uint64_t v43 = backprop_cache_size;
  if (!backprop_cache_size[0]) {
    uint64_t v43 = 0;
  }
  p_size_t workspace_size = &workspace_size;
  if (!workspace_size) {
    p_size_t workspace_size = 0;
  }
  int v45 = BNNSApplyMultiheadAttention(v61, v54, v53, v52, v51, key_stride, v35, v36, value, value_stride, v39, output_stride, v42, v43, v63, p_workspace_size, v62);
  if (v41) {

  }
  if (v49) {
  if (v45)
  }
  {
    unint64_t v46 = +[MLCLog framework];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardMHALayer:sourceTensors:resultTensor:resultStateIsTemporary:forTraining:]();
    }
  }
  if (workspace_size) {
    free(v62);
  }
  if (!backprop_cache_size[0])
  {
    uint64_t v47 = 0;
    if (!v57) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  uint64_t v47 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v63 length:backprop_cache_size[0] freeWhenDone:1];
  if (v57)
  {
LABEL_43:
    [v20 setSource:v33];
    [v20 setSecondarySource:v56];
    [v20 setTertiarySource:v55];
    [v20 setResult:v60];
    [v20 setSourceDataOffset:0];
    [v20 setSecondarySourceDataOffset:0];
    [v20 setTertiarySourceDataOffset:0];
    [v20 setResultDataOffset:0];
    [v20 setBackpropCacheSize:backprop_cache_size[0]];
    [v20 setBackpropCacheData:v47];
  }
LABEL_44:
}

- (void)dispatchForwardReshapeLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
}

- (void)dispatchForwardFullyConnectedLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
}

- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a4;
  id v12 = a5;
  id v13 = [a3 objectAtIndexedSubscript:0];
  [(MLCDeviceCPU *)self allocateResultTensor:v12];
  CPU_GetDeviceMemoryData(v11);
  id v72 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = CPU_GetDeviceMemoryData(v12);
  id v15 = (void *)[v13 BNNSFilter];
  uint64_t v16 = [v13 batchSize];
  unsigned int v17 = [v13 deviceOpType];
  if (v17 <= 0x29)
  {
    if (((1 << v17) & 0x36100000E00) != 0)
    {
      uint64_t v18 = adjustBatchSizeForFC(v11, v16);
LABEL_4:
      [v13 setBatchSize:v18];
      goto LABEL_5;
    }
    if (v17 == 39)
    {
      uint64_t v18 = 1;
      goto LABEL_4;
    }
  }
LABEL_5:
  if ([v13 isFusedBNNSFilter])
  {
    size_t traininga = [v13 batchSize];
    uint64_t v70 = v16;
    id v19 = (const void *)[v72 bytes];
    size_t v20 = [v13 sourceStride];
    id v21 = v15;
    BOOL v22 = v7;
    uint64_t v23 = [v14 bytes];
    size_t v24 = [v13 resultStride];
    id v25 = v21;
    uint64_t v26 = v70;
    unint64_t v27 = (void *)v23;
    BOOL v28 = v22;
    int v29 = BNNSFusedFilterApplyBatch(v25, traininga, v19, v20, v27, v24, v22);
LABEL_10:
    int v37 = v29;
    goto LABEL_11;
  }
  BOOL training = v7;
  unsigned int v30 = [v13 deviceOpType];
  if (v30 > 0x22) {
    goto LABEL_26;
  }
  if (((1 << v30) & 0x63030000CLL) != 0)
  {
    uint64_t v31 = [v13 batchSize];
    uint64_t v26 = v16;
    float v32 = (const void *)[v72 bytes];
    size_t v33 = [v13 sourceStride];
    id v34 = (void *)[v14 bytes];
    size_t v35 = [v13 resultStride];
    size_t v36 = v31;
    BOOL v28 = training;
    int v29 = BNNSNormalizationFilterApplyBatch(v15, v36, v32, v33, v34, v35, training);
    goto LABEL_10;
  }
  if (v30 == 15)
  {
    if (!v7)
    {
      uint64_t v57 = [v13 batchSize];
      id v58 = v15;
      uint64_t v59 = v16;
      id v60 = (const void *)[v72 bytes];
      size_t v61 = [v13 sourceStride];
      BOOL v62 = (void *)[v14 bytes];
      size_t v63 = [v13 resultStride];
      float v64 = v58;
      size_t v65 = v57;
      BOOL v28 = 0;
      uint64_t v26 = v59;
      int v29 = BNNSFilterApplyBatch(v64, v65, v60, v61, v62, v63);
      goto LABEL_10;
    }
    uint64_t v71 = v16;
    id v39 = [v13 params];
    uint64_t v40 = [v39 bytes];

    if (!*(_DWORD *)(v40 + 576))
    {
      int v41 = [v13 poolingIndicesBuffer];

      if (!v41)
      {
        uint64_t v42 = [v12 descriptor];
        size_t v43 = 2 * ([v42 tensorAllocationSizeInBytes] & 0x1FFFFFFFFFFFFFFFLL);

        uint64_t v44 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v43, 1uLL, 0x7DCB5C59uLL), v43, 1);
        [v13 setPoolingIndicesBuffer:v44];
      }
    }
    size_t v45 = [v13 batchSize];
    uint64_t v67 = (const void *)[v72 bytes];
    size_t v66 = [v13 sourceStride];
    unint64_t v46 = (void *)[v14 bytes];
    size_t v47 = [v13 resultStride];
    id v48 = [v13 poolingIndicesBuffer];
    int v37 = BNNSPoolingFilterApplyBatch(v15, v45, v67, v66, v46, v47, (size_t *)[v48 bytes], objc_msgSend(v13, "resultStride"));

    BOOL v28 = training;
    uint64_t v26 = v71;
  }
  else
  {
LABEL_26:
    size_t v49 = [v13 batchSize];
    float v50 = v15;
    uint64_t v51 = v16;
    size_t v52 = (const void *)[v72 bytes];
    size_t v53 = [v13 sourceStride];
    size_t v54 = (void *)[v14 bytes];
    size_t v55 = [v13 resultStride];
    id v56 = v50;
    uint64_t v26 = v51;
    int v37 = BNNSFilterApplyBatch(v56, v49, v52, v53, v54, v55);
    BOOL v28 = training;
  }
LABEL_11:
  if (v37)
  {
    uint64_t v38 = +[MLCLog framework];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:]();
    }
  }
  objc_msgSend(v13, "setBatchSize:", v26, v66);
  if (v28)
  {
    [v13 setSource:v72];
    [v13 setResult:v14];
    [v13 setSourceDataOffset:0];
    [v13 setResultDataOffset:0];
  }
}

- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 tertiaryTensor:(id)a6 resultTensor:(id)a7 resultStateIsTemporary:(BOOL)a8 forTraining:(BOOL)a9
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a7;
  id v15 = a4;
  uint64_t v16 = [a3 objectAtIndexedSubscript:0];
  unsigned int v17 = (void *)[v16 BNNSFilter];
  [(MLCDeviceCPU *)self allocateResultTensor:v14];
  uint64_t v18 = CPU_GetDeviceMemoryData(v15);

  id v19 = CPU_GetDeviceMemoryData(v14);

  id v20 = v18;
  in = (void *)[v20 bytes];
  uint64_t v34 = 0;
  size_t in_stride = [v16 sourceStride];
  uint64_t v32 = 0;
  id v21 = 0;
  if ([v16 binaryOperation])
  {
    CPU_GetDeviceMemoryData(v13);
    id v21 = objc_claimAutoreleasedReturnValue();
    uint64_t v34 = [v21 bytes];
    uint64_t v32 = [v16 sourceStrideSecondary];
    if (a9)
    {
      [v16 setSecondarySource:v21];
      [v16 setSecondarySourceDataOffset:0];
    }
  }
  int v22 = [v16 deviceOpType];
  if (v22 == 1)
  {
    size_t v27 = [v16 batchSize];
    if ([v16 binaryOperation]) {
      size_t v28 = 2;
    }
    else {
      size_t v28 = 1;
    }
    int v26 = BNNSArithmeticFilterApplyBatch(v17, v27, v28, (const void **)&in, &in_stride, (void *)[v19 bytes], objc_msgSend(v16, "resultStride"));
  }
  else
  {
    if (v22 != 42) {
      goto LABEL_18;
    }
    id v23 = [v16 params];
    uint64_t v24 = [v23 bytes];

    BNNSRelationalOperator op = *(_DWORD *)v24;
    *(void *)(v24 + 144) = [v20 bytes];
    *(void *)(v24 + 320) = [v21 bytes];
    *(void *)(v24 + 496) = [v19 bytes];
    if ([v16 binaryOperation]) {
      id v25 = (const BNNSNDArrayDescriptor *)(v24 + 184);
    }
    else {
      id v25 = (const BNNSNDArrayDescriptor *)(v24 + 8);
    }
    int v26 = BNNSCompareTensor((const BNNSNDArrayDescriptor *)(v24 + 8), v25, op, (BNNSNDArrayDescriptor *)(v24 + 360));
  }
  if (v26)
  {
LABEL_18:
    int v29 = +[MLCLog framework];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:]();
    }

    if (a9) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (a9)
  {
LABEL_16:
    [v16 setSource:v20];
    [v16 setResult:v19];
    [v16 setSourceDataOffset:0];
    [v16 setResultDataOffset:0];
  }
LABEL_17:
}

- (void)dispatchForwardFusedArithmeticLayerNormalizationLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  BOOL v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE setDeviceMemoryForTensor:data:](a2);
  }
}

- (void)dispatchForwardLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultStateIsTemporary:(BOOL)a9 forTraining:(BOOL)a10
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  [(MLCDeviceCPU *)self allocateResultTensor:v15];
  id v20 = [v19 objectAtIndexedSubscript:0];

  id v21 = CPU_GetDeviceMemoryData(v18);

  int v22 = CPU_GetDeviceMemoryData(v15);

  id v23 = CPU_GetDeviceMemoryData(v17);

  uint64_t v24 = CPU_GetDeviceMemoryData(v16);

  [v20 lossWeight];
  float v26 = v25;
  float v43 = v25;
  id v27 = v24;
  int v41 = v27;
  if ([v27 bytes])
  {
    id v28 = v27;
    weights = (float *)[v28 bytes];
    size_t v29 = (unint64_t)[v28 length] >> 2;
  }
  else
  {
    size_t v29 = v26 != 1.0;
    unsigned int v30 = &v43;
    if (v26 == 1.0) {
      unsigned int v30 = 0;
    }
    weights = v30;
  }
  uint64_t v31 = (void *)[v20 BNNSFilter];
  size_t v32 = [v20 batchSize];
  id v33 = v21;
  uint64_t v34 = (const void *)[v33 bytes];
  size_t v35 = [v20 sourceStride];
  id v36 = v23;
  int v37 = (const void *)[v36 bytes];
  id v38 = v22;
  if (BNNSLossFilterApplyBatch(v31, v32, v34, v35, v37, a6, weights, v29, (void *)[v38 bytes], 0, 0))
  {
    id v39 = +[MLCLog framework];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardLossLayer:sourceTensor:labelsTensor:labelsTensorStride:weightsTensor:resultTensor:resultStateIsTemporary:forTraining:]();
    }
  }
  if (a10)
  {
    [v20 setSource:v33];
    [v20 setSourceDataOffset:0];
  }
}

- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
  v73[4] = *(BNNSNDArrayDescriptor **)MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 objectAtIndexedSubscript:0];
  [(MLCDeviceCPU *)self allocateResultTensor:v9];
  id v11 = [v8 deviceMemory];
  id v12 = [v9 deviceMemory];

  uint64_t v13 = [v10 batchSize];
  unsigned int v14 = [v10 deviceOpType];
  if (v14 <= 0x29)
  {
    if (((1 << v14) & 0x36100000E00) != 0)
    {
      uint64_t v15 = adjustBatchSizeForFC(v8, v13);
LABEL_4:
      [v10 setBatchSize:v15];
      goto LABEL_5;
    }
    if (v14 == 39)
    {
      uint64_t v15 = 1;
      goto LABEL_4;
    }
  }
LABEL_5:
  uint64_t v69 = v13;
  id v16 = [v10 inDeltaData];
  id v17 = [v16 objectAtIndexedSubscript:0];
  id v18 = (BNNSNDArrayDescriptor *)[v17 bytes];

  id v19 = [v10 outDeltaData];
  id v20 = [v19 objectAtIndexedSubscript:0];
  out_delta = (BNNSNDArrayDescriptor *)[v20 bytes];

  id v22 = [v12 objectAtIndexedSubscript:0];
  v18->data = (void *)[v22 bytes];

  id v23 = [v11 objectAtIndexedSubscript:0];
  out_delta->data = (void *)[v23 bytes];

  out = 0;
  if ([v10 resultOfForwardNeededForGradient])
  {
    uint64_t v24 = [v10 result];
    uint64_t v25 = [v10 resultDataOffset];
    id v26 = v24;
    out = (void *)([v26 bytes] + v25);
  }
  if ([v10 sourceOfForwardNeededForGradient])
  {
    id v27 = [v10 source];
    uint64_t v28 = [v10 sourceDataOffset];
    id v29 = v27;
    unsigned int v30 = (const void *)([v29 bytes] + v28);
  }
  else
  {
    unsigned int v30 = 0;
  }
  uint64_t v70 = v12;
  uint64_t v71 = v11;
  if ([v10 isFusedBNNSFilter])
  {
    id v31 = [v10 weightsDeltaData];
    v73[0] = (BNNSNDArrayDescriptor *)[v31 bytes];
    id v32 = [v10 biasDeltaData];
    v73[1] = (BNNSNDArrayDescriptor *)[v32 bytes];
    id v33 = [v10 betaDeltaData];
    v73[2] = (BNNSNDArrayDescriptor *)[v33 bytes];
    id v34 = [v10 gammaDeltaData];
    v73[3] = (BNNSNDArrayDescriptor *)[v34 bytes];

    size_t v35 = (void *)[v10 BNNSFilter];
    size_t v36 = [v10 batchSize];
    size_t v37 = [v10 sourceStride];
    if ([v10 computeWeightsAndBiasOnly]) {
      id v38 = 0;
    }
    else {
      id v38 = v18;
    }
    int v39 = BNNSFusedFilterApplyBackwardBatch(v35, v36, v30, v37, v38, [v10 sourceStride], out, objc_msgSend(v10, "resultStride"), out_delta, objc_msgSend(v10, "resultStride"), v73);
  }
  else
  {
    id v68 = v8;
    if ([v10 deviceOpType] == 2
      || [v10 deviceOpType] == 3
      || [v10 deviceOpType] == 20
      || [v10 deviceOpType] == 21
      || [v10 deviceOpType] == 28
      || [v10 deviceOpType] == 29
      || [v10 deviceOpType] == 33
      || [v10 deviceOpType] == 34)
    {
      uint64_t v40 = (void *)[v10 BNNSFilter];
      uint64_t batch_sizea = [v10 batchSize];
      size_t v41 = [v10 sourceStride];
      size_t v42 = [v10 resultStride];
      size_t v43 = [v10 resultStride];
      id v44 = [v10 betaDeltaData];
      size_t v45 = (BNNSNDArrayDescriptor *)[v44 bytes];
      [v10 gammaDeltaData];
      unint64_t v46 = out_delta;
      id v47 = objc_claimAutoreleasedReturnValue();
      int v39 = BNNSNormalizationFilterApplyBackwardBatch(v40, batch_sizea, v18, v41, out, v42, v46, v43, v45, (BNNSNDArrayDescriptor *)[v47 bytes]);
    }
    else
    {
      int v49 = [v10 deviceOpType];
      float v50 = (void *)[v10 BNNSFilter];
      uint64_t batch_size = [v10 batchSize];
      size_t v65 = [v10 sourceStride];
      if (v49 == 15)
      {
        size_t v51 = [v10 sourceStride];
        size_t v52 = [v10 resultStride];
        size_t out_delta_stride = [v10 resultStride];
        id v54 = [v10 poolingIndicesBuffer];
        int v39 = BNNSPoolingFilterApplyBackwardBatch(v50, batch_size, v30, v65, v18, v51, out, v52, out_delta, out_delta_stride, 0, (const size_t *)[v54 bytes], objc_msgSend(v10, "resultStride"));
      }
      else
      {
        if ([v10 computeWeightsAndBiasOnly]) {
          size_t v55 = 0;
        }
        else {
          size_t v55 = v18;
        }
        in_delta = v55;
        size_t v56 = [v10 sourceStride];
        size_t v57 = [v10 resultStride];
        size_t v58 = [v10 resultStride];
        id v59 = [v10 weightsDeltaData];
        id v60 = v50;
        size_t v61 = out_delta;
        weights_delta = (BNNSNDArrayDescriptor *)[v59 bytes];
        id v63 = [v10 biasDeltaData];
        int v39 = BNNSFilterApplyBackwardBatch(v60, batch_size, v30, v65, in_delta, v56, out, v57, v61, v58, weights_delta, (BNNSNDArrayDescriptor *)[v63 bytes]);
      }
    }
    id v8 = v68;
  }
  if (v39)
  {
    id v48 = +[MLCLog framework];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientLayer:sourceGradientTensor:resultGradientTensor:]();
    }
  }
  [v10 setBatchSize:v69];
}

- (void)dispatchGradientMatMulLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 objectAtIndexedSubscript:0];
  id v12 = [v10 objectAtIndexedSubscript:1];
  uint64_t v67 = v8;
  uint64_t v13 = [v8 objectAtIndexedSubscript:0];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v69 != v17) {
          objc_enumerationMutation(v14);
        }
        [(MLCDeviceCPU *)self allocateResultTensor:*(void *)(*((void *)&v68 + 1) + 8 * i)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v68 objects:v72 count:16];
    }
    while (v16);
  }

  size_t v66 = v9;
  id v19 = [v9 deviceMemory];
  id v20 = [v19 objectAtIndexedSubscript:0];

  size_t v65 = v11;
  id v21 = [v11 deviceMemory];
  id v22 = [v21 objectAtIndexedSubscript:0];

  id v23 = [v12 deviceMemory];
  uint64_t v24 = [v23 objectAtIndexedSubscript:0];

  uint64_t v25 = [v13 inDeltaData];
  id v26 = [v25 objectAtIndexedSubscript:0];
  uint64_t v27 = [v26 bytes];

  id v64 = v22;
  inA_delta = (BNNSNDArrayDescriptor *)v27;
  *(void *)(v27 + 136) = [v64 bytes];
  uint64_t v28 = [v13 inDeltaData];
  id v29 = [v28 objectAtIndexedSubscript:1];
  uint64_t v30 = [v29 bytes];

  id v62 = v24;
  inB_delta = (BNNSNDArrayDescriptor *)v30;
  *(void *)(v30 + 136) = [v62 bytes];
  id v31 = [v13 outDeltaData];
  id v32 = [v31 objectAtIndexedSubscript:0];
  uint64_t v33 = [v32 bytes];

  id v61 = v20;
  *(void *)(v33 + 136) = [v61 bytes];
  if ([v14 count] == 3)
  {
    id v34 = [v14 objectAtIndexedSubscript:2];
    size_t v35 = [v34 deviceMemory];
    size_t v36 = [v35 objectAtIndexedSubscript:0];

    [v14 objectAtIndexedSubscript:2];
    size_t v37 = [v13 layer];
    id v38 = (void *)[v37 secondaryFilter];
    int v39 = *(const void **)(v33 + 136);
    id v40 = v36;
    LODWORD(v38) = BNNSFilterApply(v38, v39, (void *)[v40 bytes]);

    if (v38)
    {
      size_t v41 = +[MLCLog framework];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientMatMulLayer:sourceGradientTensor:resultGradientTensors:]();
      }
    }
  }
  size_t v58 = (void *)[v13 BNNSFilter];
  size_t v42 = [v13 source];
  uint64_t v43 = [v13 sourceDataOffset];
  id v59 = v42;
  size_t v57 = (const void *)([v59 bytes] + v43);
  uint64_t inA_stride = [v13 sourceStride];
  size_t v55 = [v13 sourceStride];
  id v44 = [v13 secondarySource];
  out_delta = (const BNNSNDArrayDescriptor *)v33;
  uint64_t v45 = [v13 secondarySourceDataOffset];
  id v46 = v44;
  id v47 = (const void *)([v46 bytes] + v45);
  size_t v48 = [v13 sourceStrideSecondary];
  size_t v49 = [v13 sourceStrideSecondary];
  float v50 = [v13 result];
  uint64_t v51 = [v13 resultDataOffset];
  id v52 = v50;
  LODWORD(v47) = BNNSFilterApplyBackwardTwoInputBatch(v58, 1uLL, v57, inA_stride, inA_delta, v55, v47, v48, inB_delta, v49, (const void *)([v52 bytes] + v51), objc_msgSend(v13, "resultStride"), out_delta, objc_msgSend(v13, "resultStride"), 0, 0);

  if (v47)
  {
    size_t v53 = +[MLCLog framework];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientMatMulLayer:sourceGradientTensor:resultGradientTensors:]();
    }
  }
}

- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 secondaryResultGradientTensor:(id)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 objectAtIndexedSubscript:0];
  if (![v14 binaryOperation]
    || ![v14 useSourceGradientDeviceMemoryForSecondaryResultGradientTensor]
    || ![v14 useSourceGradientDeviceMemoryForResultGradientTensor])
  {
    if (v12) {
      [(MLCDeviceCPU *)self allocateResultTensor:v12];
    }
    id v57 = v10;
    if (v13) {
      [(MLCDeviceCPU *)self allocateResultTensor:v13];
    }
    uint64_t v16 = [v11 deviceMemory];
    uint64_t v17 = [v12 deviceMemory];
    size_t v58 = [v13 deviceMemory];
    id v18 = [v14 inDeltaData];
    id v19 = [v18 objectAtIndexedSubscript:0];
    id v20 = (BNNSNDArrayDescriptor *)[v19 bytes];

    size_t v55 = v17;
    id v21 = [v17 objectAtIndexedSubscript:0];
    v20->data = (void *)[v21 bytes];

    id v22 = [v14 outDeltaData];
    id v23 = [v22 objectAtIndexedSubscript:0];
    out_delta = (BNNSNDArrayDescriptor *)[v23 bytes];

    size_t v56 = v16;
    id v25 = [v16 objectAtIndexedSubscript:0];
    out_delta->data = (void *)[v25 bytes];

    in = 0;
    id v64 = 0;
    size_t in_delta_stride = [v14 sourceStride];
    uint64_t v62 = 0;
    in_delta = v20;
    uint64_t v60 = 0;
    if ([v14 binaryOperation])
    {
      id v26 = [v14 source];
      uint64_t v27 = [v14 sourceDataOffset];
      id v28 = v26;
      id v29 = (void *)([v28 bytes] + v27);

      if ([v14 sourceOfForwardNeededForGradient]) {
        in = v29;
      }
      uint64_t v30 = [v14 inDeltaData];
      id v31 = [v30 objectAtIndexedSubscript:1];
      uint64_t v32 = [v31 bytes];

      id v33 = [v58 objectAtIndexedSubscript:0];
      *(void *)(v32 + 136) = [v33 bytes];

      id v34 = [v14 secondarySource];
      uint64_t v35 = [v14 secondarySourceDataOffset];
      id v36 = v34;
      size_t v37 = (void *)([v36 bytes] + v35);

      if ([v14 sourceOfForwardNeededForGradient]) {
        id v64 = v37;
      }
      uint64_t v62 = [v14 sourceStrideSecondary];
      if (v29 == v37) {
        uint64_t v38 = (uint64_t)v20;
      }
      else {
        uint64_t v38 = v32;
      }
      uint64_t v60 = v38;
      id v39 = [v14 params];
      uint64_t v40 = [v39 bytes];

      uint64_t v41 = *(void *)(v40 + 8);
      if (!*(_DWORD *)(v41 + 176)) {
        in_delta = 0;
      }
      size_t v42 = 0;
      if (!*(_DWORD *)(v41 + 360)) {
        uint64_t v60 = 0;
      }
    }
    else if ([v14 resultOfForwardNeededForGradient])
    {
      uint64_t v43 = [v14 result];
      uint64_t v44 = [v14 resultDataOffset];
      id v45 = v43;
      size_t v42 = (const void *)([v45 bytes] + v44);
    }
    else
    {
      id v46 = [v14 source];
      uint64_t v47 = [v14 sourceDataOffset];
      id v48 = v46;
      size_t v49 = (void *)([v48 bytes] + v47);

      size_t v42 = 0;
      in = v49;
    }
    if ([v14 deviceOpType] == 1)
    {
      float v50 = (void *)[v14 BNNSFilter];
      size_t v51 = [v14 batchSize];
      if ([v14 binaryOperation]) {
        size_t v52 = 2;
      }
      else {
        size_t v52 = 1;
      }
      int v53 = BNNSArithmeticFilterApplyBackwardBatch(v50, v51, v52, (const void **)&in, &in_delta_stride, &in_delta, &in_delta_stride, v42, [v14 resultStride], out_delta, objc_msgSend(v14, "resultStride"));
      id v10 = v57;
      if (!v53)
      {
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {
      id v10 = v57;
    }
    id v54 = +[MLCLog framework];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientLayer:sourceGradientTensor:resultGradientTensor:]();
    }

    goto LABEL_35;
  }
  uint64_t v15 = (void *)MEMORY[0x1E01B11E0]();
  [(MLCDeviceCPU *)self shareDeviceMemoryWithResultTensor:v12 sourceTensor:v11];
  [(MLCDeviceCPU *)self shareDeviceMemoryWithResultTensor:v13 sourceTensor:v11];
LABEL_36:
}

- (void)dispatchGradientMHALayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5 resultStateIsTemporary:(BOOL)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [a3 objectAtIndexedSubscript:0];
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v13 = [v10 objectAtIndexedSubscript:i];
    [(MLCDeviceCPU *)self allocateResultTensor:v13];
  }
  v88 = v9;
  id v87 = [v9 deviceMemory];
  id v14 = [v87 objectAtIndexedSubscript:0];
  uint64_t v15 = [v14 bytes];
  uint64_t v16 = [v11 outDeltaData];
  id v17 = [v16 objectAtIndexedSubscript:0];
  *(void *)([v17 bytes] + 136) = v15;

  for (uint64_t j = 0; j != 3; ++j)
  {
    id v19 = [v10 objectAtIndexedSubscript:j];
    id v20 = [v19 deviceMemory];

    [v10 objectAtIndexedSubscript:j];
    id v21 = [v20 objectAtIndexedSubscript:0];
    uint64_t v22 = [v21 bytes];
    id v23 = [v11 inDeltaData];
    id v24 = [v23 objectAtIndexedSubscript:j];
    *(void *)([v24 bytes] + 136) = v22;
  }
  id v81 = (void *)[v11 BNNSFilter];
  size_t v80 = [v11 batchSize];
  id v25 = [v11 source];
  uint64_t v26 = [v11 sourceDataOffset];
  id v27 = v25;
  uint64_t v28 = [v27 bytes];
  size_t v79 = [v11 sourceStride];
  id v29 = [v11 inDeltaData];
  id v30 = [v29 objectAtIndexedSubscript:0];
  v77 = (BNNSMHAProjectionParameters *)[v30 bytes];
  id v31 = [v11 secondarySource];
  uint64_t v32 = [v11 secondarySourceDataOffset];
  id v33 = v31;
  uint64_t v34 = [v33 bytes];
  size_t v75 = [v11 sourceStrideSecondary];
  v86 = v27;
  id v83 = v33;
  int v82 = [v11 hasKeyMask];
  if (v82)
  {
    id v57 = [v11 keyMask];
    id v61 = (const BNNSNDArrayDescriptor *)[v57 bytes];
  }
  else
  {
    id v61 = 0;
  }
  size_t key_mask_stride = [v11 keyMaskStride];
  uint64_t v78 = [v11 inDeltaData];
  id v76 = [v78 objectAtIndexedSubscript:1];
  key_param_delta = (BNNSMHAProjectionParameters *)[v76 bytes];
  uint64_t v35 = [v11 tertiarySource];
  uint64_t v36 = [v11 tertiarySourceDataOffset];
  id v74 = v35;
  uint64_t v37 = [v74 bytes];
  uint64_t value_stride = [v11 sourceStrideTertiary];
  uint64_t v73 = [v11 inDeltaData];
  id v72 = [v73 objectAtIndexedSubscript:2];
  size_t v66 = (BNNSMHAProjectionParameters *)[v72 bytes];
  int v70 = [v11 hasAttnMask];
  if (v70)
  {
    id v56 = [v11 attnMask];
    add_to_attention = (const BNNSNDArrayDescriptor *)[v56 bytes];
  }
  else
  {
    add_to_attention = 0;
  }
  uint64_t v38 = (void *)(v28 + v26);
  id v39 = (const void *)(v34 + v32);
  int v67 = [v11 hasAttnBias];
  if (v67)
  {
    size_t v55 = [v11 attnBiasDeltaData];
    id v54 = [v55 objectAtIndexedSubscript:0];
    id v59 = (BNNSNDArrayDescriptor *)[v54 bytes];
  }
  else
  {
    id v59 = 0;
  }
  v84 = v30;
  v85 = v29;
  query = v38;
  uint64_t v65 = v39;
  int v63 = [v11 hasAttnBias];
  value = (void *)(v37 + v36);
  if (v63)
  {
    int v53 = [v11 attnBiasDeltaData];
    id v52 = [v53 objectAtIndexedSubscript:1];
    value_attn_bias_delta = (BNNSNDArrayDescriptor *)[v52 bytes];
  }
  else
  {
    value_attn_bias_delta = 0;
  }
  uint64_t v40 = [v11 result];
  uint64_t v41 = [v11 resultDataOffset];
  id v42 = v40;
  uint64_t v43 = (const void *)([v42 bytes] + v41);
  size_t output_stride = [v11 resultStride];
  id v45 = [v11 outDeltaData];
  id v46 = [v45 objectAtIndexedSubscript:0];
  uint64_t v47 = (BNNSMHAProjectionParameters *)[v46 bytes];
  size_t backprop_cache_size = [v11 backpropCacheSize];
  id v49 = [v11 backpropCacheData];
  int v50 = BNNSApplyMultiheadAttentionBackward(v81, v80, query, v79, v77, v65, v75, v61, key_mask_stride, key_param_delta, value, value_stride, v66, add_to_attention, v59, value_attn_bias_delta, v43, output_stride, v47,
          backprop_cache_size,
          (void *)[v49 bytes],
          0,
          0);

  if (v63)
  {
  }
  if (v67)
  {
  }
  if (v70) {

  }
  if (v82) {
  if (v50)
  }
  {
    size_t v51 = +[MLCLog framework];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientMHALayer:sourceGradientTensor:resultGradientTensors:resultStateIsTemporary:]();
    }
  }
}

- (void)dispatchGradientLossLayer:(id)a3 sourceGradientTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultGradientTensor:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  [(MLCDeviceCPU *)self allocateResultTensor:v13];
  id v18 = [v17 objectAtIndexedSubscript:0];

  id v19 = [v16 deviceMemory];

  id v20 = [v13 deviceMemory];

  id v21 = [v15 deviceMemory];

  uint64_t v22 = [v14 deviceMemory];

  id v23 = [v18 inDeltaData];
  id v24 = [v23 objectAtIndexedSubscript:0];
  uint64_t v25 = [v24 bytes];

  uint64_t v26 = [v18 outDeltaData];
  id v27 = [v26 objectAtIndexedSubscript:0];
  uint64_t v28 = [v27 bytes];

  id v54 = v20;
  id v29 = [v20 objectAtIndexedSubscript:0];
  size_t v51 = (BNNSNDArrayDescriptor *)v25;
  *(void *)(v25 + 136) = [v29 bytes];

  id v56 = v19;
  id v30 = [v19 objectAtIndexedSubscript:0];
  out_delta = (const BNNSNDArrayDescriptor *)v28;
  *(void *)(v28 + 136) = [v30 bytes];

  int v53 = v21;
  id v31 = [v21 objectAtIndexedSubscript:0];
  id v52 = v22;
  uint64_t v32 = [v22 objectAtIndexedSubscript:0];
  [v18 lossWeight];
  float v34 = v33;
  float v57 = v33;
  id v35 = v32;
  if ([v35 bytes])
  {
    id v36 = v35;
    weights = (float *)[v36 bytes];
    size_t v48 = (unint64_t)[v36 length] >> 2;
  }
  else
  {
    size_t v48 = v34 != 1.0;
    uint64_t v37 = &v57;
    if (v34 == 1.0) {
      uint64_t v37 = 0;
    }
    weights = v37;
  }
  uint64_t v38 = (void *)[v18 BNNSFilter];
  size_t v39 = [v18 batchSize];
  uint64_t v40 = [v18 source];
  uint64_t v41 = [v18 sourceDataOffset];
  id v42 = v40;
  uint64_t v43 = (const void *)([v42 bytes] + v41);
  size_t v44 = [v18 sourceStride];
  size_t v45 = [v18 sourceStride];
  id v46 = v31;
  LODWORD(v38) = BNNSLossFilterApplyBackwardBatch(v38, v39, v43, v44, v51, v45, (const void *)[v46 bytes], a6, weights, v48, out_delta, objc_msgSend(v18, "resultStride"));

  if (v38)
  {
    uint64_t v47 = +[MLCLog framework];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientLossLayer:sourceGradientTensor:labelsTensor:labelsTensorStride:weightsTensor:resultGradientTensor:]();
    }
  }
}

- (void)dispatchGradientEmbeddingLayer:(id)a3 sourceGradientTensor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v6 deviceMemory];
  id v9 = [v8 objectAtIndexedSubscript:0];
  uint64_t v10 = [v9 bytes];

  id v11 = [v8 objectAtIndexedSubscript:0];
  uint64_t v12 = [v11 length];

  id v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v10 length:v12];
  if ([v7 scaleGradientByFrequency])
  {
    id v40 = v13;
    uint64_t v37 = v8;
    uint64_t v38 = v7;
    id v14 = [v7 source];
    id v15 = (uint64_t *)[v14 bytes];
    id v36 = v14;
    unint64_t v16 = [v14 length];
    id v17 = [v6 descriptor];
    id v18 = [v17 shape];
    id v39 = v6;
    id v19 = [v6 descriptor];
    id v20 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v19, "dimensionCount") - 1);
    uint64_t __N = [v20 unsignedIntegerValue];

    id v21 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    if (v16 > 7)
    {
      id v35 = v5;
      if (v16 >> 3 <= 1) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = v16 >> 3;
      }
      id v23 = v15;
      uint64_t v24 = v22;
      do
      {
        uint64_t v25 = *v23++;
        uint64_t v26 = objc_msgSend(NSNumber, "numberWithLongLong:", v25, v35);
        id v27 = [v21 objectForKeyedSubscript:v26];
        uint64_t v28 = v27;
        if (v27)
        {
          id v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "unsignedIntegerValue") + 1);
          [v21 setObject:v29 forKey:v26];
        }
        else
        {
          [v21 setObject:&unk_1F38767E0 forKeyedSubscript:v26];
        }

        --v24;
      }
      while (v24);
      id v13 = v40;
      id v30 = (float *)[v40 bytes];
      id v5 = v35;
      do
      {
        float __B = 0.0;
        uint64_t v31 = *v15++;
        uint64_t v32 = [NSNumber numberWithLongLong:v31];
        float v33 = [v21 objectForKeyedSubscript:v32];
        float v34 = 1.0 / (float)(unint64_t)[v33 unsignedIntegerValue];

        float __B = v34;
        vDSP_vsmul(v30, 1, &__B, v30, 1, __N);
        v30 += __N;
        --v22;
      }
      while (v22);
    }
    else
    {
      id v13 = v40;
      [v40 bytes];
    }
    BOOL v7 = v38;
    [v38 setWeightsDeltaDataBytes:v13];

    id v6 = v39;
    id v8 = v37;
  }
  else
  {
    [v7 setWeightsDeltaDataBytes:v13];
  }
}

- (void)dispatchForwardAndGradientLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultGradientTensor:(id)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a3;
  [(MLCDeviceCPU *)self allocateResultTensor:v17];
  [(MLCDeviceCPU *)self allocateResultTensor:v16];
  id v20 = [v19 objectAtIndexedSubscript:0];

  id v76 = v14;
  id v21 = [v14 deviceMemory];
  size_t v75 = v15;
  uint64_t v22 = [v15 deviceMemory];
  id v23 = [v18 deviceMemory];

  uint64_t v24 = [v17 deviceMemory];

  uint64_t v25 = [v16 deviceMemory];
  uint64_t v26 = [v20 inDeltaData];
  id v27 = [v26 objectAtIndexedSubscript:0];
  uint64_t v28 = [v27 bytes];

  id v74 = v25;
  id v29 = [v25 objectAtIndexedSubscript:0];
  in_delta = (BNNSNDArrayDescriptor *)v28;
  *(void *)(v28 + 136) = [v29 bytes];

  id v30 = [v21 objectAtIndexedSubscript:0];
  long long v69 = v24;
  uint64_t v31 = [v24 objectAtIndexedSubscript:0];
  uint64_t v32 = [v22 objectAtIndexedSubscript:0];
  int v70 = v23;
  float v33 = [v23 objectAtIndexedSubscript:0];
  [v20 lossWeight];
  float v35 = v34;
  float v77 = v34;
  if ([v20 deviceOpType] == 18)
  {
    size_t weights_size = 0;
    int v63 = 0;
  }
  else
  {
    id v36 = v33;
    if ([v36 bytes])
    {
      id v37 = v36;
      int v63 = (float *)[v37 bytes];
      size_t weights_size = (unint64_t)[v37 length] >> 2;
    }
    else
    {
      size_t weights_size = v35 != 1.0;
      uint64_t v38 = &v77;
      if (v35 == 1.0) {
        uint64_t v38 = 0;
      }
      int v63 = v38;
    }
  }
  id v72 = v21;
  uint64_t v73 = v16;
  long long v71 = v22;
  size_t v66 = v32;
  int v67 = v30;
  uint64_t v65 = v33;
  if ([v20 deviceOpType] == 18)
  {
    id v39 = (void *)MEMORY[0x1E4F1C9B8];
    id v40 = v30;
    objc_msgSend(v39, "dataWithBytes:length:", objc_msgSend(v40, "bytes"), objc_msgSend(v40, "length"));
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    id v42 = (void *)MEMORY[0x1E4F1C9B8];
    id v43 = v32;
    objc_msgSend(v42, "dataWithBytes:length:", objc_msgSend(v43, "bytes"), objc_msgSend(v43, "length"));
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    size_t v45 = [v76 descriptor];
    convertDataLayout(v45, v40, v41, 0, 1);

    id v46 = [v75 descriptor];
    convertDataLayout(v46, v43, v44, 0, 1);
  }
  else
  {
    id v41 = v30;
    id v44 = v32;
  }
  uint64_t v47 = (void *)[v20 BNNSFilter];
  size_t v48 = [v20 batchSize];
  id v49 = v41;
  int v50 = (const void *)[v49 bytes];
  size_t v51 = [v20 sourceStride];
  id v52 = v44;
  int v53 = (const void *)[v52 bytes];
  id v54 = v31;
  int v55 = BNNSLossFilterApplyBatch(v47, v48, v50, v51, v53, a6, v63, weights_size, (void *)[v54 bytes], in_delta, objc_msgSend(v20, "sourceStride"));
  if ([v20 deviceOpType] == 18)
  {
    id v56 = [v74 objectAtIndexedSubscript:0];
    float v57 = (void *)MEMORY[0x1E4F1C9B8];
    id v58 = v56;
    id v59 = objc_msgSend(v57, "dataWithBytes:length:", objc_msgSend(v58, "bytes"), objc_msgSend(v58, "length"));
    uint64_t v60 = [v73 descriptor];
    convertDataLayout(v60, v59, v58, 1, 0);
  }
  if (v55)
  {
    id v61 = +[MLCLog framework];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardAndGradientLossLayer:sourceTensor:labelsTensor:labelsTensorStride:weightsTensor:resultTensor:resultGradientTensor:]();
    }
  }
}

- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5
{
}

- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  BOOL v124 = a7;
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v12 count])
  {
    unint64_t v13 = 0;
    do
    {
      id v14 = [v12 objectAtIndexedSubscript:v13];
      [(MLCDeviceCPU *)self allocateResultTensor:v14];

      ++v13;
    }
    while (v13 < [v12 count]);
  }
  id v15 = [v11 objectAtIndexedSubscript:0];
  id v16 = [v15 descriptor];
  id v17 = [v16 shape];
  if ([v17 count] == 4)
  {

    goto LABEL_7;
  }
  [v11 objectAtIndexedSubscript:0];
  v19 = id v18 = v10;
  id v20 = [v19 descriptor];
  id v21 = [v20 shape];
  uint64_t v22 = [v21 count];

  id v10 = v18;
  if (v22 == 3)
  {
LABEL_7:
    id v23 = [v11 objectAtIndexedSubscript:0];
    uint64_t v24 = CPU_GetDeviceMemoryData(v23);

    uint64_t v25 = [v12 objectAtIndexedSubscript:0];
    uint64_t v26 = CPU_GetDeviceMemoryData(v25);

    [v11 objectAtIndexedSubscript:0];
    [v12 objectAtIndexedSubscript:0];

    id v121 = v10;
    id v27 = [v10 objectAtIndexedSubscript:0];
    id v120 = [v27 params];
    uint64_t v28 = [v120 bytes];
    id v29 = v24;
    uint64_t v30 = [v29 bytes];
    id v119 = v26;
    __dst = (_DWORD *)[v119 bytes];
    bzero(__dst, [v119 length]);
    int v117 = [v27 returnsSequences];
    unint64_t v31 = [v27 batchSize];
    *(void *)(v28 + 16) = v31;
    int v32 = [v27 biDirectional];
    uint64_t v33 = 1;
    if (v32) {
      uint64_t v33 = 2;
    }
    unint64_t v114 = v33;
    char v115 = v32;
    v123 = v27;
    if (![v27 batchFirst]) {
      goto LABEL_13;
    }
    float v34 = [v11 objectAtIndexedSubscript:0];
    float v35 = [v34 descriptor];
    id v36 = [v35 shape];
    uint64_t v37 = [v36 count];

    if (v37 == 3)
    {
      uint64_t v38 = *(void *)(v28 + 32);
      *(void *)(v28 + 232) = *(void *)v28;
      *(void *)(v28 + 240) = v38;
      *(void *)(v28 + 248) = v31;
      *(_DWORD *)(v28 + 368) = 65568;
      *(_DWORD *)(v28 + 228) = 196610;
      if (v117)
      {
        *(void *)(v28 + 784) = 0;
        *(void *)(v28 + 776) = v31;
        *(void *)(v28 + 768) = v38;
        *(void *)(v28 + 760) = *(void *)(v28 + 8) << v115;
        *(_DWORD *)(v28 + 756) = 196610;
        *(void *)(v28 + 888) = __dst;
        goto LABEL_15;
      }
    }
    else
    {
LABEL_13:
      *(void *)(v28 + 240) = v31;
    }
    *(void *)(v28 + 776) = v31;
LABEL_15:
    *(void *)(v28 + 416) = v31;
    *(void *)(v28 + 592) = v31;
    *(void *)(v28 + 944) = v31;
    *(void *)(v28 + 1120) = v31;
    id v39 = [v11 objectAtIndexedSubscript:0];
    id v40 = [v39 descriptor];
    id v41 = [v40 shape];
    uint64_t v42 = [v41 count];

    if (v42 == 4)
    {
      id v43 = [v11 objectAtIndexedSubscript:0];
      convertNCHWtoTNC(v43, v31, v30, *(_DWORD **)(v28 + 360));

LABEL_17:
      id v44 = v123;
      goto LABEL_23;
    }
    id v44 = v123;
    if (![v123 batchFirst]) {
      goto LABEL_22;
    }
    size_t v45 = [v11 objectAtIndexedSubscript:0];
    id v46 = [v45 descriptor];
    uint64_t v47 = [v46 shape];
    uint64_t v48 = [v47 count];

    BOOL v49 = v48 == 3;
    id v44 = v123;
    if (v49)
    {
      *(void *)(v28 + 360) = v30;
    }
    else
    {
LABEL_22:
      if (([v44 batchFirst] & 1) == 0)
      {
        int v107 = [v11 objectAtIndexedSubscript:0];
        v108 = [v107 descriptor];
        uint64_t v109 = [v108 shape];
        uint64_t v110 = [v109 count];

        if (v110 != 3)
        {
          log = +[MLCLog framework];
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNForwardLayer:sourceTensors:resultTensors:resultStateIsTemporary:forTraining:](log);
          }
          id v10 = v121;
          id v44 = v123;
          goto LABEL_56;
        }
        *(void *)(v28 + 360) = v30;
        goto LABEL_17;
      }
    }
LABEL_23:
    int v50 = [v11 objectAtIndexedSubscript:0];
    size_t v51 = [v50 descriptor];
    log = [v51 batchSizePerSequenceStep];

    id v52 = [v11 objectAtIndexedSubscript:0];
    int v53 = [v52 descriptor];
    int v54 = [v53 variableLengthSequences];

    if (v54)
    {
      id v113 = v29;
      int v55 = [v11 objectAtIndexedSubscript:0];
      id v56 = [v55 descriptor];
      float v57 = [v56 sequenceLengths];

      id v112 = v57;
      id v58 = [v57 objectAtIndexedSubscript:0];
      uint64_t v59 = [v58 unsignedIntegerValue];

      uint64_t v60 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v59];
      long long v126 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id v61 = log;
      uint64_t v62 = [v61 countByEnumeratingWithState:&v126 objects:v130 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        uint64_t v64 = *(void *)v127;
        do
        {
          for (uint64_t i = 0; i != v63; ++i)
          {
            if (*(void *)v127 != v64) {
              objc_enumerationMutation(v61);
            }
            size_t v66 = *(void **)(*((void *)&v126 + 1) + 8 * i);
            uint64_t v125 = 0;
            uint64_t v125 = [v66 unsignedIntegerValue];
            [v60 appendBytes:&v125 length:4];
          }
          uint64_t v63 = [v61 countByEnumeratingWithState:&v126 objects:v130 count:16];
        }
        while (v63);
      }

      id v67 = v60;
      *(void *)(v28 + 184) = [v67 bytes];
      *(_DWORD *)(v28 + 52) = 0x10000;
      *(_DWORD *)(v28 + 192) = 65568;
      *(void *)(v28 + 56) = v59;
      *(void *)(v28 + 212) = 1065353216;

      id v29 = v113;
      id v44 = v123;
    }
    if ([v11 count] == 3 || objc_msgSend(v11, "count") == 4)
    {
      long long v68 = [v11 objectAtIndexedSubscript:1];
      long long v69 = CPU_GetDeviceMemoryData(v68);

      int v70 = [v11 objectAtIndexedSubscript:2];
      long long v71 = CPU_GetDeviceMemoryData(v70);

      id v72 = [v11 objectAtIndexedSubscript:1];
      id v73 = v69;
      *(void *)(v28 + 536) = [v73 bytes];

      id v74 = [v11 objectAtIndexedSubscript:2];
      id v75 = v71;
      *(void *)(v28 + 712) = [v75 bytes];
    }
    if ([v12 count] == 3)
    {
      id v76 = [v12 objectAtIndexedSubscript:1];
      float v77 = CPU_GetDeviceMemoryData(v76);

      uint64_t v78 = [v12 objectAtIndexedSubscript:2];
      size_t v79 = CPU_GetDeviceMemoryData(v78);

      size_t v80 = [v12 objectAtIndexedSubscript:1];
      id v81 = v77;
      *(void *)(v28 + 1064) = [v81 bytes];

      int v82 = [v12 objectAtIndexedSubscript:2];
      id v83 = v79;
      *(void *)(v28 + 1240) = [v83 bytes];
    }
    if (v124)
    {
      size_t v84 = MEMORY[0x1E01B0C00](v28);
      v85 = malloc_type_malloc(v84, 0x2C272D16uLL);
    }
    else
    {
      size_t v84 = 0;
      v85 = 0;
    }
    if (MEMORY[0x1E01B0C30](v28, 0, v85, v84))
    {
      v86 = +[MLCLog framework];
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNForwardLayer:sourceTensors:resultTensors:resultStateIsTemporary:forTraining:]();
      }
    }
    if (v124)
    {
      id v87 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v85 length:v84 freeWhenDone:1];
      [v44 setTrainingCache:v87];
    }
    v88 = [v11 objectAtIndexedSubscript:0];
    id v89 = [v88 descriptor];
    v90 = [v89 shape];
    uint64_t v91 = [v90 count];

    if (v91 == 4)
    {
      v92 = [v11 objectAtIndexedSubscript:0];
      id v93 = [v12 objectAtIndexedSubscript:0];
      convertTNCtoNCHW(v92, v93, v31, *(_DWORD **)(v28 + 888), __dst, [v44 returnsSequences]);
    }
    else
    {
      if ([v44 batchFirst])
      {
        v94 = [v11 objectAtIndexedSubscript:0];
        id v95 = [v94 descriptor];
        id v96 = [v95 shape];
        uint64_t v97 = [v96 count];

        if (v97 == 3)
        {
          id v10 = v121;
          if ((v117 & 1) == 0)
          {
            uint64_t v98 = *(void *)(v28 + 1064);
            v99 = [v12 objectAtIndexedSubscript:0];
            convertHiddenBNNStoMLC(v98, (uint64_t)__dst, v99, [v44 numLayers], v114);
          }
          goto LABEL_56;
        }
      }
      id v100 = [v11 objectAtIndexedSubscript:0];
      v101 = [v100 descriptor];
      id v102 = [v101 shape];
      uint64_t v103 = [v102 count];

      if (v103 == 3)
      {
        id v10 = v121;
        if (v117)
        {
          id v104 = *(const void **)(v28 + 888);
        }
        else
        {
          uint64_t v111 = ([v44 numLayers] - 1) << v115;
          id v104 = (const void *)(*(void *)(v28 + 1064) + 4 * [v44 hiddenSize] * v31 * v111);
        }
        uint64_t v106 = v119;
        memcpy(__dst, v104, [v119 length]);
        v105 = v120;
        goto LABEL_57;
      }
    }
    id v10 = v121;
LABEL_56:
    uint64_t v106 = v119;
    v105 = v120;
LABEL_57:

    goto LABEL_60;
  }
  id v29 = +[MLCLog framework];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNForwardLayer:sourceTensors:resultTensors:resultStateIsTemporary:forTraining:](a2);
  }
LABEL_60:
}

- (void)dispatchRNNGradientLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensors:(id)a5
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 count];
  uint64_t v12 = [v10 count];
  unint64_t v13 = [v10 objectAtIndexedSubscript:0];
  [(MLCDeviceCPU *)self allocateResultTensor:v13];

  if ((unint64_t)[v9 count] >= 2)
  {
    unint64_t v14 = 1;
    do
    {
      id v15 = [v9 objectAtIndexedSubscript:v14];
      [(MLCDeviceCPU *)self allocateResultTensor:v15];

      ++v14;
    }
    while (v14 < [v9 count]);
  }
  unint64_t v16 = v12 - 3;
  if (v16 < 2)
  {
    id v17 = [v10 objectAtIndexedSubscript:1];
    [(MLCDeviceCPU *)self allocateResultTensor:v17];

    id v18 = [v10 objectAtIndexedSubscript:2];
    [(MLCDeviceCPU *)self allocateResultTensor:v18];
  }
  id v123 = v8;
  id v19 = [v8 objectAtIndexedSubscript:0];
  id v122 = [v19 params];
  uint64_t v130 = [v122 bytes];
  uint64_t v135 = v19;
  id v121 = [v19 lstmDeltaParams];
  uint64_t v20 = [v121 bytes];
  id v21 = [v9 objectAtIndexedSubscript:0];
  uint64_t v22 = [v21 deviceMemory];

  id v23 = [v10 objectAtIndexedSubscript:0];
  uint64_t v24 = [v23 deviceMemory];

  long long v126 = v22;
  uint64_t v25 = [v22 objectAtIndexedSubscript:0];
  uint64_t v125 = v24;
  uint64_t v26 = [v24 objectAtIndexedSubscript:0];
  [v9 objectAtIndexedSubscript:0];

  [v10 objectAtIndexedSubscript:0];
  if (v11 == 3)
  {
    id v27 = [v9 objectAtIndexedSubscript:1];
    uint64_t v28 = [v27 deviceMemory];

    id v29 = [v28 objectAtIndexedSubscript:0];
    [v9 objectAtIndexedSubscript:1];

    id v30 = v29;
    *(void *)(v20 + 1064) = [v30 bytes];
    unint64_t v31 = [v9 objectAtIndexedSubscript:2];
    int v32 = [v31 deviceMemory];

    uint64_t v33 = [v32 objectAtIndexedSubscript:0];
    [v9 objectAtIndexedSubscript:2];

    id v34 = v33;
    *(void *)(v20 + 1240) = [v34 bytes];
  }
  if (v16 <= 1)
  {
    float v35 = [v10 objectAtIndexedSubscript:1];
    id v36 = [v35 deviceMemory];

    uint64_t v37 = [v36 objectAtIndexedSubscript:0];
    [v10 objectAtIndexedSubscript:1];

    id v38 = v37;
    *(void *)(v20 + 536) = [v38 bytes];
    id v39 = [v10 objectAtIndexedSubscript:2];
    id v40 = [v39 deviceMemory];

    id v41 = [v40 objectAtIndexedSubscript:0];
    [v10 objectAtIndexedSubscript:2];

    id v42 = v41;
    *(void *)(v20 + 712) = [v42 bytes];
  }
  v134 = v10;
  id v43 = [v9 objectAtIndexedSubscript:0];
  id v44 = [v43 descriptor];
  int v45 = [v44 variableLengthSequences];

  if (v45)
  {
    id v46 = v26;
    bzero((void *)[v46 bytes], objc_msgSend(v46, "length"));
  }
  uint64_t v47 = [v135 batchSize];
  *(void *)(v20 + 16) = v47;
  *(void *)(v20 + 240) = v47;
  *(void *)(v20 + 416) = v47;
  *(void *)(v20 + 592) = v47;
  *(void *)(v20 + 776) = v47;
  *(void *)(v20 + 944) = v47;
  *(void *)(v20 + 1120) = v47;
  id v48 = v25;
  uint64_t v49 = [v48 bytes];
  id v50 = v26;
  size_t v51 = (_DWORD *)[v50 bytes];
  objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v51, objc_msgSend(v50, "length"));
  id v129 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v124 = v48;
  long long v127 = v50;
  unint64_t v128 = v47;
  uint64_t v119 = v49;
  __dst = v51;
  if ([v135 returnsSequences])
  {
    bzero(v51, [v50 length]);
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v49, objc_msgSend(v48, "length"));
    id v52 = (id)objc_claimAutoreleasedReturnValue();
    int v53 = [v9 objectAtIndexedSubscript:0];
    int v54 = [v53 descriptor];
    int v55 = [v54 shape];
    uint64_t v56 = [v55 count];

    if (v56 == 4)
    {
      float v57 = [v9 objectAtIndexedSubscript:0];
      id v52 = v52;
      uint64_t v47 = v128;
      convertNCHWtoTNC(v57, v128, v49, (_DWORD *)[v52 bytes]);

      id v58 = v135;
    }
    else
    {
      id v58 = v135;
      uint64_t v47 = v128;
      if ([v135 batchFirst])
      {
        size_t v66 = [v9 objectAtIndexedSubscript:0];
        id v67 = [v66 descriptor];
        long long v68 = [v67 shape];
        [v68 count];
      }
    }
    uint64_t v65 = v134;
  }
  else
  {
    uint64_t v59 = [v48 bytes];
    uint64_t v60 = *(void *)(v130 + 8);
    uint64_t v61 = *(void *)(v130 + 32);
    if (*(_DWORD *)(v130 + 44)) {
      uint64_t v62 = 2;
    }
    else {
      uint64_t v62 = 1;
    }
    size_t v63 = 4 * v60 * ((v61 * v47) << (*(_DWORD *)(v130 + 44) & 1));
    uint64_t v64 = malloc_type_malloc(v63, 0x100004052888210uLL);
    convertNCtoTNC(v61, v60, v62, v47, v59, v64);
    uint64_t v65 = v134;
    id v58 = v135;
    id v52 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v64 length:v63 freeWhenDone:1];
  }
  long long v69 = [v9 objectAtIndexedSubscript:0];
  int v70 = [v69 descriptor];
  id v133 = [v70 batchSizePerSequenceStep];

  long long v71 = [v9 objectAtIndexedSubscript:0];
  id v72 = [v71 descriptor];
  int v73 = [v72 variableLengthSequences];

  if (v73)
  {
    id v117 = v52;
    id v74 = [v9 objectAtIndexedSubscript:0];
    id v75 = [v74 descriptor];
    id v76 = [v75 sequenceLengths];

    float v77 = [v76 objectAtIndexedSubscript:0];
    uint64_t v78 = [v77 unsignedIntegerValue];

    size_t v79 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v78];
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v80 = v133;
    uint64_t v81 = [v80 countByEnumeratingWithState:&v137 objects:v141 count:16];
    if (v81)
    {
      uint64_t v82 = v81;
      uint64_t v83 = *(void *)v138;
      do
      {
        for (uint64_t i = 0; i != v82; ++i)
        {
          if (*(void *)v138 != v83) {
            objc_enumerationMutation(v80);
          }
          v85 = *(void **)(*((void *)&v137 + 1) + 8 * i);
          uint64_t v136 = 0;
          uint64_t v136 = [v85 unsignedIntegerValue];
          [v79 appendBytes:&v136 length:4];
        }
        uint64_t v82 = [v80 countByEnumeratingWithState:&v137 objects:v141 count:16];
      }
      while (v82);
    }

    id v86 = v79;
    *(void *)(v130 + 184) = [v86 bytes];
    *(_DWORD *)(v130 + 52) = 0x10000;
    *(_DWORD *)(v130 + 192) = 65568;
    *(void *)(v130 + 56) = v78;
    *(void *)(v130 + 212) = 1065353216;
    id v87 = v86;
    *(void *)(v20 + 184) = [v87 bytes];
    *(_DWORD *)(v20 + 52) = 0x10000;
    *(_DWORD *)(v20 + 192) = 65568;
    *(void *)(v20 + 56) = v78;
    *(void *)(v20 + 212) = 1065353216;

    uint64_t v65 = v134;
    id v52 = v117;
    uint64_t v47 = v128;
  }
  if (![v58 returnsSequences]) {
    goto LABEL_35;
  }
  if (![v58 batchFirst]) {
    goto LABEL_35;
  }
  v88 = [v9 objectAtIndexedSubscript:0];
  id v89 = [v88 descriptor];
  v90 = [v89 shape];
  uint64_t v91 = [v90 count];

  if (v91 == 3)
  {
    char v92 = [v58 biDirectional];
    *(void *)(v20 + 776) = v47;
    *(void *)(v20 + 768) = *(void *)(v130 + 32);
    *(void *)(v20 + 760) = *(void *)(v130 + 8) << v92;
    *(_DWORD *)(v20 + 756) = 196610;
    uint64_t v93 = v119;
  }
  else
  {
LABEL_35:
    uint64_t v93 = [v52 bytes];
  }
  *(void *)(v20 + 888) = v93;
  if (![v58 batchFirst]) {
    goto LABEL_39;
  }
  v94 = [v65 objectAtIndexedSubscript:0];
  id v95 = [v94 descriptor];
  id v96 = [v95 shape];
  uint64_t v97 = [v96 count];

  if (v97 == 3)
  {
    uint64_t v98 = v129;
    *(void *)(v20 + 232) = *(void *)v130;
    *(void *)(v20 + 240) = *(void *)(v130 + 32);
    *(void *)(v20 + 248) = v47;
    *(_DWORD *)(v20 + 228) = 196610;
    uint64_t v99 = (uint64_t)__dst;
  }
  else
  {
LABEL_39:
    uint64_t v98 = v129;
    uint64_t v99 = [v129 bytes];
  }
  *(void *)(v20 + 360) = v99;
  id v100 = v65;
  if (!*(void *)(v20 + 1416)
    || !*(void *)(v20 + 2344)
    || !*(void *)(v20 + 3272)
    || !*(void *)(v20 + 4200)
    || !*(void *)(v20 + 1768)
    || !*(void *)(v20 + 2696)
    || !*(void *)(v20 + 3624)
    || !*(void *)(v20 + 4552))
  {
    v101 = v52;
    id v113 = +[MLCLog framework];
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNGradientLayer:sourceGradientTensors:resultGradientTensors:](a2);
    }
    goto LABEL_66;
  }
  if (*(void *)(v130 + 24) >= 2uLL
    && (!*(void *)(v20 + 1592) || !*(void *)(v20 + 2520) || !*(void *)(v20 + 3448) || !*(void *)(v20 + 4376)))
  {
    v101 = v52;
    id v113 = +[MLCLog framework];
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNGradientLayer:sourceGradientTensors:resultGradientTensors:](a2);
    }
    goto LABEL_66;
  }
  if ([v58 hasBias]
    && (!*(void *)(v20 + 2120) || !*(void *)(v20 + 3048) || !*(void *)(v20 + 3976) || !*(void *)(v20 + 4904)))
  {
    v101 = v52;
    id v113 = +[MLCLog framework];
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNGradientLayer:sourceGradientTensors:resultGradientTensors:](a2);
    }
LABEL_66:

    v105 = v122;
    id v104 = v123;
    uint64_t v106 = v121;
    goto LABEL_67;
  }
  v101 = v52;
  uint64_t v102 = MEMORY[0x1E01B0C00](v130);
  id v103 = [v58 trainingCache];
  LODWORD(v102) = MEMORY[0x1E01B0C20](v130, v20, 0, [v103 bytes], v102);

  v105 = v122;
  id v104 = v123;
  uint64_t v106 = v121;
  if (v102)
  {
    int v107 = +[MLCLog framework];
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNGradientLayer:sourceGradientTensors:resultGradientTensors:].cold.4();
    }
  }
  v108 = [v100 objectAtIndexedSubscript:0];
  uint64_t v109 = [v108 descriptor];
  uint64_t v110 = [v109 shape];
  uint64_t v131 = [v110 count];

  if (v131 == 4)
  {
    uint64_t v111 = [v134 objectAtIndexedSubscript:0];
    id v112 = [v134 objectAtIndexedSubscript:0];
    uint64_t v98 = v129;
    convertTNCtoNCHW(v111, v112, v128, (_DWORD *)[v129 bytes], __dst, 1);
  }
  else
  {
    uint64_t v98 = v129;
    if (![v58 batchFirst]) {
      goto LABEL_74;
    }
    unint64_t v114 = [v100 objectAtIndexedSubscript:0];
    char v115 = [v114 descriptor];
    v116 = [v115 shape];
    uint64_t v132 = [v116 count];

    uint64_t v98 = v129;
    if (v132 != 3) {
LABEL_74:
    }
      memcpy(__dst, (const void *)[v98 bytes], objc_msgSend(v127, "length"));
  }
LABEL_67:
}

- (void)dispatchForwardReduceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7 forTraining:(BOOL)a8
{
  BOOL v8 = a8;
  id v12 = a5;
  id v13 = a4;
  unint64_t v14 = [a3 objectAtIndexedSubscript:0];
  [(MLCDeviceCPU *)self allocateResultTensor:v12];
  id v15 = CPU_GetDeviceMemoryData(v13);

  unint64_t v16 = CPU_GetDeviceMemoryData(v12);

  id v17 = (void *)[v14 BNNSFilter];
  id v18 = v15;
  id v19 = (const void *)[v18 bytes];
  size_t v20 = [v14 sourceStride];
  id v21 = v16;
  if (BNNSFilterApplyBatch(v17, 1uLL, v19, v20, (void *)[v21 bytes], objc_msgSend(v14, "resultStride")))
  {
    uint64_t v22 = +[MLCLog framework];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:]();
    }
  }
  [v14 setBatchSize:1];
  if (v8)
  {
    [v14 setSource:v18];
    [v14 setResult:v21];
    [v14 setSourceDataOffset:0];
    [v14 setResultDataOffset:0];
  }
}

- (void)dispatchGradientReduceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7
{
  id v10 = a5;
  id v11 = a4;
  id v12 = [a3 objectAtIndexedSubscript:0];
  [(MLCDeviceCPU *)self allocateResultTensor:v10];
  id v13 = [v11 deviceMemory];

  unint64_t v14 = [v10 deviceMemory];

  id v15 = [v12 inDeltaData];
  id v16 = [v15 objectAtIndexedSubscript:0];
  id v17 = (BNNSNDArrayDescriptor *)[v16 bytes];

  id v18 = [v12 outDeltaData];
  id v19 = [v18 objectAtIndexedSubscript:0];
  uint64_t v20 = [v19 bytes];

  id v21 = [v14 objectAtIndexedSubscript:0];
  v17->data = (void *)[v21 bytes];

  id v22 = [v13 objectAtIndexedSubscript:0];
  *(void *)(v20 + 136) = [v22 bytes];

  id v23 = 0;
  if ([v12 resultOfForwardNeededForGradient])
  {
    uint64_t v24 = [v12 result];
    uint64_t v25 = [v12 resultDataOffset];
    id v26 = v24;
    id v23 = (const void *)([v26 bytes] + v25);
  }
  id v42 = v14;
  id v43 = v13;
  id v40 = v23;
  out_delta = (const BNNSNDArrayDescriptor *)v20;
  if ([v12 sourceOfForwardNeededForGradient])
  {
    id v27 = [v12 source];
    uint64_t v28 = [v12 sourceDataOffset];
    id v29 = v27;
    in = (void *)([v29 bytes] + v28);
  }
  else
  {
    in = 0;
  }
  id v30 = (void *)[v12 BNNSFilter];
  size_t v31 = [v12 sourceStride];
  if ([v12 computeWeightsAndBiasOnly]) {
    id v17 = 0;
  }
  size_t v32 = [v12 sourceStride];
  size_t v33 = [v12 resultStride];
  size_t v34 = [v12 resultStride];
  id v35 = [v12 weightsDeltaData];
  weights_delta = (BNNSNDArrayDescriptor *)[v35 bytes];
  id v37 = [v12 biasDeltaData];
  LODWORD(weights_delta) = BNNSFilterApplyBackwardBatch(v30, 1uLL, in, v31, v17, v32, v40, v33, out_delta, v34, weights_delta, (BNNSNDArrayDescriptor *)[v37 bytes]);

  if (weights_delta)
  {
    id v38 = +[MLCLog framework];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientLayer:sourceGradientTensor:resultGradientTensor:]();
    }
  }
  [v12 setBatchSize:1];
}

- (void)dispatchForwardSelectLayer:(id)a3 conditionTensor:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6 forTraining:(BOOL)a7
{
  BOOL v8 = +[MLCLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE setDeviceMemoryForTensor:data:](a2);
  }
}

- (void)dispatchGradientSelectLayer:(id)a3 conditionTensor:(id)a4 sourceGradientTensor:(id)a5 resultGradientTensors:(id)a6
{
  BOOL v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceANE setDeviceMemoryForTensor:data:](a2);
  }
}

- (void)dispatchForwardScatterLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  v69[2] = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v65 = [v60 objectAtIndexedSubscript:0];
  [(MLCDeviceCPU *)self allocateResultTensor:v10];
  id v11 = [v9 objectAtIndexedSubscript:2];

  if (v11 == v10)
  {
    [v9 objectAtIndexedSubscript:1];

    id v12 = [v9 objectAtIndexedSubscript:0];
    unint64_t v14 = 0;
  }
  else
  {
    [v9 objectAtIndexedSubscript:2];

    [v9 objectAtIndexedSubscript:1];
    [v9 objectAtIndexedSubscript:0];

    id v12 = [v9 objectAtIndexedSubscript:2];
    CPU_GetDeviceMemoryData(v12);
    id v13 = objc_claimAutoreleasedReturnValue();
    unint64_t v14 = (const void *)[v13 bytes];
  }
  id v15 = [v9 objectAtIndexedSubscript:1];
  CPU_GetDeviceMemoryData(v15);
  id v16 = objc_claimAutoreleasedReturnValue();
  uint64_t v64 = [v16 bytes];

  id v17 = [v9 objectAtIndexedSubscript:0];
  CPU_GetDeviceMemoryData(v17);
  id v18 = objc_claimAutoreleasedReturnValue();
  uint64_t v63 = [v18 bytes];

  CPU_GetDeviceMemoryData(v10);
  id v19 = objc_claimAutoreleasedReturnValue();
  uint64_t v20 = (void *)[v19 bytes];

  id v21 = [v10 descriptor];
  size_t v22 = [v21 tensorAllocationSizeInBytes];
  if (v11 == v10) {
    bzero(v20, v22);
  }
  else {
    memcpy(v20, v14, v22);
  }

  unsigned int v23 = [v65 scatterGatherDimension];
  v69[0] = 0;
  v69[1] = 0;
  uint64_t v24 = [v9 objectAtIndexedSubscript:1];
  uint64_t v25 = [v24 descriptor];
  uint64_t v26 = [v25 elementCount];

  if (v26)
  {
    uint64_t v27 = 0;
    id v67 = v9;
    uint64_t v68 = v23;
    uint64_t v61 = v20;
    id v62 = v10;
    while (1)
    {
      int v28 = *(_DWORD *)(v64 + 4 * v27);
      uint64_t v66 = v27;
      float v29 = *(float *)(v63 + 4 * v27);
      id v30 = objc_msgSend(v10, "descriptor", v60);
      size_t v31 = [v30 shape];
      int v32 = [v31 count];

      size_t v33 = (float *)v20;
      if (v32 >= 1)
      {
        uint64_t v34 = 0;
        size_t v33 = (float *)v20;
        do
        {
          int v35 = v28;
          if (v68 != v34) {
            int v35 = *((_DWORD *)v69 + v34);
          }
          id v36 = [v10 descriptor];
          id v37 = [v36 stride];
          id v38 = [v37 objectAtIndexedSubscript:v34];
          size_t v33 = (float *)((char *)v33 + (int)(v35 * [v38 unsignedIntegerValue]));

          ++v34;
          id v39 = [v10 descriptor];
          id v40 = [v39 shape];
          LODWORD(v38) = [v40 count];
        }
        while (v34 < (int)v38);
      }
      int v41 = [v65 scatterReduceType];
      if (!v41) {
        break;
      }
      id v9 = v67;
      if (v41 == 1)
      {
        float v29 = v29 + *v33;
LABEL_18:
        float *v33 = v29;
      }
      id v42 = [v10 descriptor];
      id v43 = [v42 shape];
      uint64_t v44 = [v43 count];
      ++*((_DWORD *)v69 + v44 - 1);

      int v45 = [v9 objectAtIndexedSubscript:1];
      id v46 = [v45 descriptor];
      uint64_t v47 = [v46 shape];
      int v48 = [v47 count];

      if (v48 >= 2)
      {
        uint64_t v49 = v48;
        do
        {
          uint64_t v50 = v49 - 1;
          int v51 = *((_DWORD *)v69 + (v49 - 1));
          id v52 = [v9 objectAtIndexedSubscript:1];
          int v53 = [v52 descriptor];
          int v54 = [v53 shape];
          int v55 = [v54 objectAtIndexedSubscript:(v49 - 1)];
          int v56 = [v55 unsignedIntegerValue];

          if (v51 == v56)
          {
            *((_DWORD *)v69 + (v49 - 1)) = 0;
            ++*((_DWORD *)v69 + (v49 - 2));
          }
          --v49;
          id v9 = v67;
        }
        while ((unint64_t)(v50 + 1) > 2);
      }
      uint64_t v27 = v66 + 1;
      float v57 = [v9 objectAtIndexedSubscript:1];
      id v58 = [v57 descriptor];
      unint64_t v59 = [v58 elementCount];

      uint64_t v20 = v61;
      id v10 = v62;
      if (v66 + 1 >= v59) {
        goto LABEL_25;
      }
    }
    id v9 = v67;
    goto LABEL_18;
  }
LABEL_25:
}

- (void)dispatchForwardGatherLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  v64[2] = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v58 objectAtIndexedSubscript:0];
  [(MLCDeviceCPU *)self allocateResultTensor:v10];
  [v9 objectAtIndexedSubscript:0];

  [v9 objectAtIndexedSubscript:1];
  id v12 = [v9 objectAtIndexedSubscript:0];
  CPU_GetDeviceMemoryData(v12);
  id v13 = objc_claimAutoreleasedReturnValue();
  uint64_t v61 = [v13 bytes];

  unint64_t v14 = [v9 objectAtIndexedSubscript:1];
  CPU_GetDeviceMemoryData(v14);
  id v15 = objc_claimAutoreleasedReturnValue();
  uint64_t v60 = [v15 bytes];

  float v57 = v10;
  CPU_GetDeviceMemoryData(v10);
  id v16 = objc_claimAutoreleasedReturnValue();
  uint64_t v59 = [v16 bytes];

  v64[0] = 0;
  v64[1] = 0;
  int v56 = v11;
  unsigned int v17 = [v11 scatterGatherDimension];
  id v18 = [v9 objectAtIndexedSubscript:1];
  id v19 = [v18 descriptor];
  uint64_t v20 = [v19 elementCount];

  if (v20)
  {
    uint64_t v21 = 0;
    uint64_t v63 = v17;
    do
    {
      uint64_t v22 = 0;
      unsigned int v23 = (_DWORD *)v61;
      int v24 = *(_DWORD *)(v60 + 4 * v21);
      while (1)
      {
        uint64_t v25 = [v9 objectAtIndexedSubscript:0];
        uint64_t v26 = [v25 descriptor];
        uint64_t v27 = [v26 shape];
        int v28 = [v27 count];

        if (v22 >= v28) {
          break;
        }
        int v29 = v24;
        if (v63 != v22) {
          int v29 = *((_DWORD *)v64 + v22);
        }
        id v30 = [v9 objectAtIndexedSubscript:0];
        size_t v31 = [v30 descriptor];
        int v32 = [v31 stride];
        size_t v33 = [v32 objectAtIndexedSubscript:v22];
        unsigned int v23 = (_DWORD *)((char *)v23 + (int)(v29 * [v33 unsignedIntegerValue]));

        ++v22;
      }
      uint64_t v62 = v21;
      *(_DWORD *)(v59 + 4 * v21) = *v23;
      uint64_t v34 = [v9 objectAtIndexedSubscript:1];
      int v35 = [v34 descriptor];
      id v36 = [v35 shape];
      uint64_t v37 = [v36 count];
      ++*((_DWORD *)v64 + v37 - 1);

      id v38 = [v9 objectAtIndexedSubscript:1];
      id v39 = [v38 descriptor];
      id v40 = [v39 shape];
      int v41 = [v40 count];

      if (v41 >= 2)
      {
        uint64_t v42 = v41;
        do
        {
          uint64_t v43 = v42 - 1;
          int v44 = *((_DWORD *)v64 + (v42 - 1));
          int v45 = [v9 objectAtIndexedSubscript:1];
          id v46 = [v45 descriptor];
          uint64_t v47 = [v46 shape];
          int v48 = [v47 objectAtIndexedSubscript:(v42 - 1)];
          int v49 = [v48 unsignedIntegerValue];

          if (v44 == v49)
          {
            *((_DWORD *)v64 + (v42 - 1)) = 0;
            ++*((_DWORD *)v64 + (v42 - 2));
          }
          --v42;
        }
        while ((unint64_t)(v43 + 1) > 2);
      }
      uint64_t v21 = v62 + 1;
      uint64_t v50 = [v9 objectAtIndexedSubscript:1];
      int v51 = [v50 descriptor];
      unint64_t v52 = [v51 elementCount];
    }
    while (v62 + 1 < v52);
  }
  if (a6)
  {
    int v53 = [v9 objectAtIndexedSubscript:1];
    int v54 = CPU_GetDeviceMemoryData(v53);
    [v56 setSource:v54];

    [v56 setSourceDataOffset:0];
  }
}

- (void)dispatchForwardCompareLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 resultTensor:(id)a6 compareOp:(int)a7 forTraining:(BOOL)a8
{
  LOBYTE(v8) = a8;
  [(MLCDeviceCPU *)self dispatchForwardLayer:a3 sourceTensor:a4 secondaryTensor:a5 tertiaryTensor:0 resultTensor:a6 resultStateIsTemporary:0 forTraining:v8];
}

- (MLCDeviceCPU)initWithType:(int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MLCDeviceCPU;
  id v4 = [(MLCDeviceCPU *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_deviceType = a3;
    deviceList = v4->_deviceList;
    v4->_deviceList = (NSArray *)&unk_1F3876E10;

    deviceHeap = v5->_deviceHeap;
    v5->_deviceHeap = 0;
  }
  return v5;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCDeviceCPU *)self deviceType];
  BOOL v7 = [(MLCDeviceCPU *)self deviceList];
  uint64_t v8 = [v3 stringWithFormat:@"%@: { deviceType=%d : deviceList=%@}", v5, v6, v7];

  return (NSString *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(MLCDeviceCPU *)self deviceType];

  return (id)[v4 initWithType:v5];
}

- (unint64_t)deviceMemorySizeForTensor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 descriptor];
  unint64_t v5 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", [v4 dataType]);

  if (v5)
  {
    uint64_t v6 = [v3 descriptor];
    BOOL v7 = [v6 shape];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      unint64_t v9 = 0;
      uint64_t v10 = 1;
      do
      {
        id v11 = [v3 descriptor];
        id v12 = [v11 shape];
        id v13 = [v12 objectAtIndexedSubscript:v9];
        v10 *= [v13 unsignedIntegerValue];

        ++v9;
        unint64_t v14 = [v3 descriptor];
        id v15 = [v14 shape];
        unint64_t v16 = [v15 count];
      }
      while (v9 < v16);
    }
    else
    {
      uint64_t v10 = 1;
    }
    unint64_t v18 = v10 * v5;
  }
  else
  {
    unsigned int v17 = +[MLCLog framework];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU deviceMemorySizeForTensor:]();
    }

    unint64_t v18 = 0;
  }

  return v18;
}

- (unint64_t)deviceMemorySizeForTensor:(id)a3 batchSize:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 descriptor];
  unint64_t v7 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", [v6 dataType]);

  if (v7)
  {
    uint64_t v8 = [v5 descriptor];
    unint64_t v9 = [v8 shape];
    uint64_t v10 = [v9 count];

    if (v10 == 1)
    {
      id v11 = [v5 descriptor];
      id v12 = [v11 shape];
      id v13 = [v12 objectAtIndexedSubscript:0];
      unint64_t v14 = [v13 unsignedIntegerValue] * v7;
    }
    else
    {
      unint64_t v14 = v7 * a4;
      unint64_t v16 = [v5 descriptor];
      unsigned int v17 = [v16 shape];
      unint64_t v18 = [v17 count];

      if (v18 >= 2)
      {
        unint64_t v19 = 1;
        do
        {
          uint64_t v20 = [v5 descriptor];
          uint64_t v21 = [v20 shape];
          uint64_t v22 = [v21 objectAtIndexedSubscript:v19];
          v14 *= [v22 unsignedIntegerValue];

          ++v19;
          unsigned int v23 = [v5 descriptor];
          int v24 = [v23 shape];
          unint64_t v25 = [v24 count];
        }
        while (v19 < v25);
      }
    }
  }
  else
  {
    id v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU deviceMemorySizeForTensor:]();
    }

    unint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)needToAllocateDeviceMemoryForTensor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 deviceMemory];
  uint64_t v5 = [v4 count];

  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v3 device];

  if (!v6) {
    goto LABEL_6;
  }
  unint64_t v7 = [v3 device];
  int v8 = [v7 type];

  if (!v8
    || ([v3 device],
        unint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 type],
        v9,
        v10 == 3))
  {
    BOOL v11 = 0;
  }
  else
  {
LABEL_6:
    BOOL v11 = 1;
  }

  return v11;
}

- (void)allocateDeviceMemoryForTensor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [v4 setDeviceMemory:v5];

  size_t v6 = [(MLCDeviceCPU *)self deviceMemorySizeForTensor:v4];
  objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v6, 1uLL, 0xF3298B3DuLL), v6, 1);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = [v4 deviceMemory];

  [v7 setObject:v8 atIndexedSubscript:0];
}

- (void)deallocateDeviceMemoryForTensor:(id)a3
{
  id v5 = a3;
  id v3 = (void *)MEMORY[0x1E01B11E0]();
  id v4 = [v5 deviceMemory];
  [v4 removeAllObjects];
}

- (BOOL)shareDeviceMemoryWithResultTensor:(id)a3 sourceTensor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6 != v5)
  {
    unint64_t v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v5 setDeviceMemory:v7];

    id v8 = [v6 deviceMemory];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      do
      {
        BOOL v11 = [v5 deviceMemory];
        id v12 = [v6 deviceMemory];
        id v13 = [v12 objectAtIndexedSubscript:v10];
        [v11 addObject:v13];

        ++v10;
        unint64_t v14 = [v6 deviceMemory];
        unint64_t v15 = [v14 count];
      }
      while (v10 < v15);
    }
    unint64_t v16 = [v6 sharedMemoryTensor];
    if (v16)
    {
      unsigned int v17 = [v6 sharedMemoryTensor];
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
  id v4 = [v3 deviceMemory];
  uint64_t v5 = [v3 deviceIndex];

  id v6 = [v4 objectAtIndexedSubscript:v5];

  return v6;
}

- (id)readTensor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[MLCDeviceCPU readTensor:fromDeviceIndex:](self, "readTensor:fromDeviceIndex:", v4, [v4 deviceIndex]);

  return v5;
}

- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 descriptor];
  id v8 = [v7 shape];
  if ([v8 count] == 1)
  {
    uint64_t v9 = 1;
  }
  else
  {
    unint64_t v10 = [v6 descriptor];
    BOOL v11 = [v10 shape];
    id v12 = [v11 objectAtIndexedSubscript:0];
    uint64_t v9 = [v12 unsignedIntegerValue];
  }
  id v13 = [(MLCDeviceCPU *)self readFromDevice:v6 deviceIndex:a4 allocateData:0 batchSize:v9];

  return v13;
}

- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 batchSize:(unint64_t)a5
{
  return [(MLCDeviceCPU *)self readFromDevice:a3 deviceIndex:a4 allocateData:0 batchSize:a5];
}

- (id)readFromDevice:(id)a3 deviceIndex:(unint64_t)a4 allocateData:(BOOL)a5 batchSize:(unint64_t)a6
{
  BOOL v7 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if ([v11 deviceIndex] != a4)
  {
    id v13 = +[MLCLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = NSStringFromSelector(a2);
      int v23 = 138412802;
      int v24 = v22;
      __int16 v25 = 2048;
      uint64_t v26 = [v11 deviceIndex];
      __int16 v27 = 2048;
      unint64_t v28 = a4;
      _os_log_error_impl(&dword_1DD0C9000, v13, OS_LOG_TYPE_ERROR, "%@: -readTensor:deviceIndex:allocateData:batchSize must be called with deviceIndex = %lu, but given deviceIndex = %lu", (uint8_t *)&v23, 0x20u);
    }
    goto LABEL_6;
  }
  id v12 = [v11 deviceMemory];
  id v13 = [v12 objectAtIndexedSubscript:a4];

  size_t v14 = [(MLCDeviceCPU *)self deviceMemorySizeForTensor:v11 batchSize:a6];
  size_t v15 = v14;
  if (!v7)
  {
    id v19 = [v11 data];
    unint64_t v16 = (void *)[v19 bytes];

    if (v16) {
      goto LABEL_8;
    }
    uint64_t v21 = +[MLCLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[MLCDeviceCPU readFromDevice:deviceIndex:allocateData:batchSize:](v21);
    }

LABEL_6:
    unint64_t v18 = 0;
    goto LABEL_11;
  }
  unint64_t v16 = malloc_type_malloc(v14, 0x511AFD09uLL);
  unsigned int v17 = [MEMORY[0x1E4F1CA58] dataWithBytesNoCopy:v16 length:v15 freeWhenDone:1];
  [v11 setData:v17];

LABEL_8:
  id v13 = v13;
  if ((void *)[v13 bytes] != v16) {
    memcpy(v16, (const void *)[v13 bytes], v15);
  }
  unint64_t v18 = [v11 data];
LABEL_11:

  return v18;
}

- (void)readTensor:(id)a3 targetBuffer:(void *)a4
{
  id v7 = a3;
  CPU_GetDeviceMemoryData(v7);
  id v6 = objc_claimAutoreleasedReturnValue();
  if ((void *)[v6 bytes] != a4) {
    memcpy(a4, (const void *)[v6 bytes], -[MLCDeviceCPU deviceMemorySizeForTensor:](self, "deviceMemorySizeForTensor:", v7));
  }
}

- (void)dispatchReadTensor:(id)a3 targetBuffer:(void *)a4 batchSize:(unint64_t)a5
{
  id v9 = a3;
  CPU_GetDeviceMemoryData(v9);
  id v8 = objc_claimAutoreleasedReturnValue();
  if ((void *)[v8 bytes] != a4) {
    memcpy(a4, (const void *)[v8 bytes], -[MLCDeviceCPU deviceMemorySizeForTensor:batchSize:](self, "deviceMemorySizeForTensor:batchSize:", v9, a5));
  }
}

- (void)broadcastTensor:(id)a3
{
  id v10 = a3;
  id v4 = [v10 descriptor];
  uint64_t v5 = [v4 shape];
  if ([v5 count] == 1)
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = [v10 descriptor];
    id v8 = [v7 shape];
    id v9 = [v8 objectAtIndexedSubscript:0];
    uint64_t v6 = [v9 unsignedIntegerValue];
  }
  [(MLCDeviceCPU *)self writeToAllDevices:v10 allocateData:0 batchSize:v6];
}

- (void)broadcastTensor:(id)a3 batchSize:(unint64_t)a4
{
}

- (void)dispatchBroadcastTensor:(id)a3
{
  id v10 = a3;
  id v4 = [v10 descriptor];
  uint64_t v5 = [v4 shape];
  if ([v5 count] == 1)
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = [v10 descriptor];
    id v8 = [v7 shape];
    id v9 = [v8 objectAtIndexedSubscript:0];
    uint64_t v6 = [v9 unsignedIntegerValue];
  }
  [(MLCDeviceCPU *)self writeToAllDevices:v10 allocateData:0 batchSize:v6];
}

- (void)dispatchBroadcastTensor:(id)a3 batchSize:(unint64_t)a4
{
}

- (void)writeToAllDevices:(id)a3 allocateData:(BOOL)a4 batchSize:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = v8;
  if (v6)
  {
    [(MLCDeviceCPU *)self allocateDeviceMemoryForTensor:v8];
    id v8 = v9;
  }
  [(MLCDeviceCPU *)self writeToDevice:v8 batchSize:a5];
}

- (void)writeToDevice:(id)a3 batchSize:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 data];
  -[MLCDeviceCPU writeToDevice:sourceBuffer:batchSize:](self, "writeToDevice:sourceBuffer:batchSize:", v6, [v7 bytes], a4);
}

- (void)writeToDevice:(id)a3 sourceBuffer:(void *)a4 batchSize:(unint64_t)a5
{
  id v8 = a3;
  id v9 = CPU_GetDeviceMemoryData(v8);
  size_t v10 = [(MLCDeviceCPU *)self deviceMemorySizeForTensor:v8 batchSize:a5];

  id v11 = v9;
  if ((void *)[v11 bytes] != a4) {
    memcpy((void *)[v11 bytes], a4, v10);
  }
}

- (void)commitAndWaitForCompletion:(id)a3 enableProfiling:(BOOL)a4 graphExecutionTime:(id)a5 graphResultTensor:(id)a6
{
  BOOL v8 = a4;
  unint64_t v16 = (void (**)(id, id, void, double))a3;
  id v10 = a5;
  id v11 = a6;
  double v12 = 0.0;
  if (v8)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v12 = Current - *(double *)[v10 bytes];
  }
  if (v11)
  {
    id v14 = [v11 data];
    if ([v14 bytes])
    {
      size_t v15 = [v11 device];

      if (!v15) {
        goto LABEL_8;
      }
      id v14 = [v11 data];
      -[MLCDeviceCPU readTensor:targetBuffer:](self, "readTensor:targetBuffer:", v11, [v14 bytes]);
    }
  }
LABEL_8:
  if (v16) {
    v16[2](v16, v11, 0, v12);
  }
}

- (void)commitAndWaitForCompletion:(id)a3
{
}

- (void)commitWithCompletionHandler:(id)a3 enableProfiling:(BOOL)a4 graphExecutionTime:(id)a5 graphResultTensor:(id)a6
{
  BOOL v8 = a4;
  unint64_t v16 = (void (**)(id, id, void, double))a3;
  id v10 = a5;
  id v11 = a6;
  double v12 = 0.0;
  if (v8)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v12 = Current - *(double *)[v10 bytes];
  }
  if (v11)
  {
    id v14 = [v11 data];
    if ([v14 bytes])
    {
      size_t v15 = [v11 device];

      if (!v15) {
        goto LABEL_8;
      }
      id v14 = [v11 data];
      -[MLCDeviceCPU readTensor:targetBuffer:](self, "readTensor:targetBuffer:", v11, [v14 bytes]);
    }
  }
LABEL_8:
  if (v16) {
    v16[2](v16, v11, 0, v12);
  }
}

- (BOOL)synchronizeTensor:(id)a3
{
  return 1;
}

- (unint64_t)numDevices
{
  return 1;
}

- (BOOL)transferTensor:(id)a3 fromDevice:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (MLCDeviceCPU *)a4;
  if (v8)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (self != v8 || (isKindOfClass & 1) == 0)
    {
      uint64_t v11 = [v7 deviceIndex];
      double v12 = [v7 deviceMemory];
      id v13 = [v12 objectAtIndexedSubscript:v11];
      objc_opt_class();
      char v14 = objc_opt_isKindOfClass();

      if ((v14 & 1) == 0)
      {
        int v23 = +[MLCLog framework];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          int v24 = NSStringFromSelector(a2);
          __int16 v25 = [v7 deviceMemory];
          uint64_t v26 = [v25 objectAtIndexedSubscript:v11];
          *(_DWORD *)buf = 138412546;
          uint64_t v42 = v24;
          __int16 v43 = 2112;
          id v44 = (id)objc_opt_class();
          id v27 = v44;
          _os_log_error_impl(&dword_1DD0C9000, v23, OS_LOG_TYPE_ERROR, "%@: unsupported device memory class=%@", buf, 0x16u);
        }
        goto LABEL_25;
      }
      size_t v15 = [v7 deviceMemory];
      uint64_t v16 = [v15 count];

      unsigned int v17 = [v7 deviceMemory];
      uint64_t v18 = [v17 count];

      if (v18 == 1)
      {
        size_t v19 = [(MLCDeviceCPU *)self deviceMemorySizeForTensor:v7];
        uint64_t v20 = (char *)malloc_type_malloc(v19, 0x6C79BDF3uLL);
        uint64_t v16 = 1;
        uint64_t v21 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v20 length:v19 freeWhenDone:1];
        id v22 = [v7 deviceMemory];
        [v22 addObject:v21];
      }
      else
      {
        unint64_t v28 = [v7 deviceMemory];
        uint64_t v29 = [v28 count];

        if (v29 != 2)
        {
          int v23 = +[MLCLog framework];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceANE transferTensor:fromDevice:].cold.4();
          }
          goto LABEL_25;
        }
        id v30 = [v7 deviceMemory];
        uint64_t v31 = [v30 count];

        if (v31)
        {
          uint64_t v32 = 0;
          while (1)
          {
            size_t v33 = [v7 deviceMemory];
            uint64_t v34 = [v33 objectAtIndexedSubscript:v32];
            objc_opt_class();
            char v35 = objc_opt_isKindOfClass();

            if (v35) {
              break;
            }
            if (v31 == ++v32) {
              goto LABEL_19;
            }
          }
          uint64_t v16 = v32;
        }
LABEL_19:
        uint64_t v21 = [v7 deviceMemory];
        id v22 = [v21 objectAtIndexedSubscript:v16];
        uint64_t v20 = (char *)[v22 bytes];
      }

      id v36 = [v7 deviceMemory];
      int v23 = [v36 objectAtIndexedSubscript:v11];

      unint64_t v37 = [v7 calculateBatchSizeToUse];
      id v38 = [v23 liveIOStatus];
      LOBYTE(v37) = ANE_ReadOutputTensor(v7, v38, [v7 deviceIndex], v20, v37);

      if (v37)
      {
        [v7 setDeviceIndex:v16];
        BOOL v10 = 1;
LABEL_26:

        goto LABEL_27;
      }
      id v39 = +[MLCLog framework];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceCPU transferTensor:fromDevice:]();
      }

LABEL_25:
      BOOL v10 = 0;
      goto LABEL_26;
    }
  }
  BOOL v10 = 1;
LABEL_27:

  return v10;
}

- (void)setDeviceMemoryForTensor:(id)a3 data:(id)a4
{
  id v5 = a3;
  id v8 = [a4 data];
  id v6 = [v5 deviceMemory];
  uint64_t v7 = [v5 deviceIndex];

  [v6 setObject:v8 atIndexedSubscript:v7];
}

- (BOOL)updateDeviceMemoryForTensor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 deviceMemory];
  uint64_t v6 = [v5 count];

  if (!v6) {
    goto LABEL_13;
  }
  uint64_t v7 = [v4 deviceMemory];
  unint64_t v8 = [v7 count];

  if (v8 < 3)
  {
    BOOL v10 = [v4 deviceMemory];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
LABEL_9:
      id v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceCPU updateDeviceMemoryForTensor:](a2);
      }
      goto LABEL_11;
    }
    uint64_t v12 = 0;
    while (1)
    {
      id v13 = [v4 deviceMemory];
      char v14 = [v13 objectAtIndexedSubscript:v12];
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
  id v9 = +[MLCLog framework];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceCPU updateDeviceMemoryForTensor:](a2);
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

- (NSData)deviceHeap
{
  return self->_deviceHeap;
}

- (void)setDeviceHeap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceHeap, 0);

  objc_storeStrong((id *)&self->_deviceList, 0);
}

- (void)updateInstanceNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7
{
}

- (void)updateLayerNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7
{
}

- (void)updateGroupNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7
{
}

- (void)updateBatchNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 meanTensor:(id)a7 varianceTensor:(id)a8 arrayOfParams:(id)a9
{
  int v53 = self;
  v56[2] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a9;
  unsigned int v17 = [a3 objectAtIndexedSubscript:0];
  uint64_t v18 = [v17 fusedPrimitiveParams];
  if (v18) {
    [v17 fusedPrimitiveParams];
  }
  else {
  size_t v19 = [v17 params];
  }

  id v20 = v19;
  uint64_t v21 = [v20 bytes];
  v56[0] = 0;
  v56[1] = 0;
  v55[0] = 0;
  v55[1] = 0;
  if (v14 && [v14 isUpdatable])
  {
    v56[0] = v21 + 352;
    id v22 = [v17 betaDeltaData];
    v55[0] = [v22 bytes];

    char v23 = 0;
    uint64_t v24 = 1;
    if (!v15) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v24 = 0;
    char v23 = 1;
    if (!v15) {
      goto LABEL_11;
    }
  }
  if ([v15 isUpdatable])
  {
    id v51 = v20;
    id v52 = v15;
    SEL v49 = a2;
    v56[v24] = v21 + 528;
    id v25 = [v17 gammaDeltaData];
    v55[v24] = [v25 bytes];

    uint64_t v26 = v24 + 1;
    goto LABEL_13;
  }
LABEL_11:
  if (v23) {
    goto LABEL_33;
  }
  id v51 = v20;
  id v52 = v15;
  SEL v49 = a2;
  uint64_t v26 = 1;
LABEL_13:
  id v54 = v16;
  id v27 = v13;
  unint64_t v28 = [v13 objectAtIndexedSubscript:0];
  uint64_t v29 = [v28 accumulatorBufferCount];

  uint64_t v50 = &v48;
  unint64_t v30 = 8 * v29 * v26;
  uint64_t v31 = (char *)&v48 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v30 >= 0x200) {
    size_t v32 = 512;
  }
  else {
    size_t v32 = 8 * v29 * v26;
  }
  bzero((char *)&v48 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), v32);
  bzero((char *)&v48 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v29 * v26);
  if (v26 == 2)
  {
    if (v29)
    {
      uint64_t v33 = 0;
      uint64_t v34 = v31 + 8;
      do
      {
        char v35 = [v17 betaMomentumData];
        id v36 = [v35 objectAtIndexedSubscript:v33];
        *(v34 - 1) = [v36 bytes];

        unint64_t v37 = [v17 gammaMomentumData];
        id v38 = [v37 objectAtIndexedSubscript:v33];
        *uint64_t v34 = [v38 bytes];
        v34 += 2;

        ++v33;
      }
      while (v29 != v33);
    }
  }
  else if (v29)
  {
    for (uint64_t i = 0; i != v29; ++i)
    {
      if ([v14 isUpdatable]) {
        [v17 betaMomentumData];
      }
      else {
      id v40 = [v17 gammaMomentumData];
      }
      id v41 = [v40 objectAtIndexedSubscript:i];
      *(void *)&v31[8 * i] = [v41 bytes];
    }
  }
  id v16 = v54;
  if (v54)
  {
    [(MLCDeviceCPU *)v53 accumulateParams:v56 gradients:v55 accumulators:v31 numOfParameters:v26 inArrayOfParams:v54];
    id v13 = v27;
    id v20 = v51;
    id v15 = v52;
  }
  else
  {
    uint64_t v42 = [v27 objectAtIndexedSubscript:0];
    uint64_t v43 = [v42 function];
    id v44 = [v27 objectAtIndexedSubscript:0];
    id v45 = [v44 optimizerAlgFields];
    int v46 = MEMORY[0x1E01B0E10](v43, [v45 bytes], v26, v56, v55, v31, 0);

    id v13 = v27;
    id v16 = v54;

    id v20 = v51;
    id v15 = v52;
    if (v46)
    {
      uint64_t v47 = +[MLCLog framework];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateBatchNormalizationLayer:optimizer:betaParameter:gammaParameter:meanTensor:varianceTensor:arrayOfParams:]();
      }
    }
  }
LABEL_33:
}

- (void)sumSharedGradientsForConvolutionLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4
{
  id v42 = a3;
  id v5 = [v42 childLayers];
  uint64_t v6 = [v5 count];

  if (v6 == 1) {
    goto LABEL_33;
  }
  uint64_t v7 = [v42 childLayers];
  unint64_t v8 = [v7 objectAtIndexedSubscript:a4];

  id v9 = [v8 deviceOps];
  BOOL v10 = [v9 objectAtIndexedSubscript:0];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v12 = [v8 weights];

  if (isKindOfClass)
  {
    if (v12 == v42)
    {
      id v13 = [v10 weightsDeltaData];
      id v14 = (void *)[v13 bytes];

      uint64_t v15 = v14[12];
      uint64_t v16 = v14[4];
LABEL_8:
      uint64_t v18 = v16 * v15;
      goto LABEL_9;
    }
  }
  else if (v12 == v42)
  {
    id v19 = [v10 weightsDeltaData];
    id v14 = (void *)[v19 bytes];

    uint64_t v15 = v14[10];
    uint64_t v16 = v14[2];
    goto LABEL_8;
  }
  id v17 = [v10 biasDeltaData];
  id v14 = (void *)[v17 bytes];

  uint64_t v18 = v14[1];
LABEL_9:
  id v20 = (float *)v14[17];
  uint64_t v21 = [v42 childLayers];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    unint64_t v23 = 0;
    while (1)
    {
      uint64_t v24 = v8;
      id v25 = [v42 childLayers];
      unint64_t v8 = [v25 objectAtIndexedSubscript:v23];

      if (v23 == a4 || ![v8 isTrainable]) {
        goto LABEL_30;
      }
      uint64_t v26 = [v8 deviceOps];
      id v27 = [v26 objectAtIndexedSubscript:0];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
LABEL_29:
      BOOL v10 = v27;
LABEL_30:
      id v36 = v42;
LABEL_31:
      ++v23;
      id v40 = [v36 childLayers];
      unint64_t v41 = [v40 count];

      if (v23 >= v41) {
        goto LABEL_32;
      }
    }
    id v28 = v8;
    if (v12 == v42)
    {
      uint64_t v29 = [v28 weightsParameter];
      if (!v29) {
        goto LABEL_24;
      }
      uint64_t v33 = [v28 weightsParameter];
      int v34 = [v33 isUpdatable];

      if (v34)
      {
        size_t v32 = [v27 weightsDeltaData];
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v29 = [v28 biasesParameter];
      if (!v29) {
        goto LABEL_24;
      }
      unint64_t v30 = [v28 biasesParameter];
      int v31 = [v30 isUpdatable];

      if (v31)
      {
        size_t v32 = [v27 biasDeltaData];
LABEL_22:
        id v35 = v32;
        uint64_t v29 = *(float **)([v35 bytes] + 136);

        goto LABEL_24;
      }
    }
    uint64_t v29 = 0;
LABEL_24:

    if (v29)
    {
      id v36 = v42;
      if (v18)
      {
        unint64_t v37 = v20;
        uint64_t v38 = v18;
        do
        {
          float v39 = *v29++;
          *unint64_t v37 = v39 + *v37;
          ++v37;
          --v38;
        }
        while (v38);
      }
      BOOL v10 = v27;
      goto LABEL_31;
    }
    goto LABEL_29;
  }
LABEL_32:

LABEL_33:
}

- (void)sumSharedGradientsForNormalizationLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4 isBetaTensor:(BOOL)a5
{
  BOOL v5 = a5;
  id v43 = a3;
  uint64_t v7 = [v43 childLayers];
  uint64_t v8 = [v7 count];

  if (v8 != 1)
  {
    id v9 = [v43 childLayers];
    BOOL v10 = [v9 objectAtIndexedSubscript:a4];

    uint64_t v11 = [v10 deviceOps];
    id v12 = [v11 objectAtIndexedSubscript:0];

    if (v5) {
      [v12 betaDeltaData];
    }
    else {
    id v13 = [v12 gammaDeltaData];
    }
    uint64_t v14 = [v13 bytes];

    uint64_t v15 = *(void *)(v14 + 8);
    if (v15)
    {
      uint64_t v16 = (uint64_t *)(v14 + 16);
      uint64_t v17 = 1;
      uint64_t v18 = v43;
      do
      {
        v17 *= v15;
        uint64_t v19 = *v16++;
        uint64_t v15 = v19;
      }
      while (v19);
    }
    else
    {
      uint64_t v17 = 1;
      uint64_t v18 = v43;
    }
    id v20 = *(float **)(v14 + 136);
    uint64_t v21 = [v18 childLayers];
    uint64_t v22 = [v21 count];

    if (v22)
    {
      unint64_t v23 = 0;
      while (1)
      {
        uint64_t v24 = v10;
        id v25 = [v43 childLayers];
        BOOL v10 = [v25 objectAtIndexedSubscript:v23];

        if (v23 == a4 || ![v10 isTrainable]) {
          goto LABEL_33;
        }
        uint64_t v26 = [v10 deviceOps];
        id v27 = [v26 objectAtIndexedSubscript:0];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
LABEL_32:
        id v12 = v27;
LABEL_33:
        float v39 = v43;
LABEL_34:
        ++v23;
        unint64_t v41 = [v39 childLayers];
        unint64_t v42 = [v41 count];

        if (v23 >= v42) {
          goto LABEL_35;
        }
      }
      id v28 = v10;
      uint64_t v29 = v28;
      if (v5)
      {
        unint64_t v30 = [v28 betaParameter];
        if (v30)
        {
          int v31 = [v29 betaParameter];
          int v32 = [v31 isUpdatable];

          if (v32)
          {
            uint64_t v33 = [v27 betaDeltaData];
LABEL_25:
            id v36 = v33;
            unint64_t v30 = *(float **)([v36 bytes] + 136);

            goto LABEL_27;
          }
          goto LABEL_26;
        }
      }
      else
      {
        unint64_t v30 = [v28 gammaParameter];
        if (v30)
        {
          int v34 = [v29 gammaParameter];
          int v35 = [v34 isUpdatable];

          if (v35)
          {
            uint64_t v33 = [v27 gammaDeltaData];
            goto LABEL_25;
          }
LABEL_26:
          unint64_t v30 = 0;
        }
      }
LABEL_27:

      if (v30 && v17)
      {
        unint64_t v37 = v20;
        uint64_t v38 = v17;
        float v39 = v43;
        do
        {
          float v40 = *v30++;
          *unint64_t v37 = v40 + *v37;
          ++v37;
          --v38;
        }
        while (v38);
        id v12 = v27;
        goto LABEL_34;
      }
      goto LABEL_32;
    }
LABEL_35:
  }
}

- (void)updateFullyConnectedLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7
{
  uint64_t v50 = self;
  v53[2] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [a3 objectAtIndexedSubscript:0];
  id v51 = [v16 params];
  uint64_t v17 = [v51 bytes];
  v53[0] = 0;
  v53[1] = 0;
  v52[0] = 0;
  v52[1] = 0;
  int v18 = [v13 isUpdatable];
  uint64_t v19 = 0;
  if (v18)
  {
    v53[0] = v17 + 176;
    id v20 = [v16 weightsDeltaData];
    v52[0] = [v20 bytes];

    uint64_t v19 = 1;
  }
  if (v14 && [v14 isUpdatable])
  {
    SEL v46 = a2;
    id v49 = v14;
    v53[v19] = v17 + 528;
    id v21 = [v16 biasDeltaData];
    v52[v19] = [v21 bytes];

    uint64_t v22 = v19 + 1;
  }
  else
  {
    if (!v18) {
      goto LABEL_28;
    }
    SEL v46 = a2;
    id v49 = v14;
    uint64_t v22 = 1;
  }
  unint64_t v23 = v12;
  uint64_t v24 = [v12 objectAtIndexedSubscript:0];
  uint64_t v25 = [v24 accumulatorBufferCount];

  uint64_t v48 = &v45;
  unint64_t v26 = 8 * v25 * v22;
  id v27 = (char *)&v45 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v26 >= 0x200) {
    size_t v28 = 512;
  }
  else {
    size_t v28 = 8 * v25 * v22;
  }
  bzero((char *)&v45 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0), v28);
  bzero((char *)&v45 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v25 * v22);
  uint64_t v47 = v22;
  if (v22 == 2)
  {
    if (v25)
    {
      uint64_t v29 = 0;
      unint64_t v30 = v27 + 8;
      do
      {
        int v31 = [v16 weightsMomentumData];
        id v32 = [v31 objectAtIndexedSubscript:v29];
        *(v30 - 1) = [v32 bytes];

        uint64_t v33 = [v16 biasMomentumData];
        id v34 = [v33 objectAtIndexedSubscript:v29];
        void *v30 = [v34 bytes];
        v30 += 2;

        ++v29;
      }
      while (v25 != v29);
    }
  }
  else if (v25)
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if ([v13 isUpdatable]) {
        [v16 weightsMomentumData];
      }
      else {
      id v36 = [v16 biasMomentumData];
      }
      id v37 = [v36 objectAtIndexedSubscript:i];
      *(void *)&v27[8 * i] = [v37 bytes];
    }
  }
  if (v15)
  {
    [(MLCDeviceCPU *)v50 accumulateParams:v53 gradients:v52 accumulators:v27 numOfParameters:v47 inArrayOfParams:v15];
    id v12 = v23;
    id v14 = v49;
  }
  else
  {
    uint64_t v38 = [v23 objectAtIndexedSubscript:0];
    uint64_t v39 = [v38 function];
    float v40 = [v23 objectAtIndexedSubscript:0];
    id v41 = [v40 optimizerAlgFields];
    uint64_t v42 = [v41 bytes];
    int v43 = MEMORY[0x1E01B0E10](v39, v42, v47, v53, v52, v27, 0);

    id v12 = v23;
    id v14 = v49;
    if (v43)
    {
      id v44 = +[MLCLog framework];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateFullyConnectedLayer:optimizer:weightsParameter:biasesParameter:arrayOfParams:]();
      }
    }
  }
LABEL_28:
}

- ($ADD8B2928F54472B65CB84445603561F)getGateDesc:(SEL)a3 lstmParams:(unint64_t)a4
{
  p_var11 = &a5->var11;
  p_var13 = &a5->var13;
  if (!a4) {
    p_var13 = &a5->var10;
  }
  if (a4 != 1) {
    p_var11 = p_var13;
  }
  if (a4 == 2) {
    p_var12 = &a5->var12;
  }
  else {
    p_var12 = p_var11;
  }
  return ($ADD8B2928F54472B65CB84445603561F *)memcpy(retstr, p_var12, sizeof($ADD8B2928F54472B65CB84445603561F));
}

- (void)saveOrRestoreLSTMBiasesAndAccumulators:(id)a3 auxParameter:(id)a4 auxAccumulators:(id)a5 mlcIndex:(unint64_t)a6 auxIndex:(unint64_t)a7 saveParameter:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v35 = a4;
  id v38 = a5;
  id v34 = [v13 params];
  [v34 bytes];
  uint64_t count = [v13 hiddenSize];
  char v14 = [v13 biDirectional];
  unint64_t v15 = [v13 numLayers];
  uint64_t v16 = [v13 numAccumulatorsPerParameter];
  unint64_t v17 = 4 * v15;
  if (v15 < 2)
  {
    unint64_t v18 = 0;
  }
  else if ([v13 biDirectional])
  {
    if ([v13 biDirectional]) {
      unint64_t v18 = (a6 - v17) >> 2;
    }
    else {
      unint64_t v18 = 0;
    }
  }
  else
  {
    unint64_t v18 = a6 >> 2;
  }
  unint64_t v37 = a6 & 3;
  -[MLCDeviceCPU getGateDesc:lstmParams:](self, "getGateDesc:lstmParams:", a7);
  if (a6 >= v17) {
    uint64_t v19 = count;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = v19 + (v18 << v14) * count;
  id v21 = v13;
  if (v8)
  {
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(count, 4uLL, 0x100004052888210uLL), count, 1);
    [v35 addObject:v22];
    uint64_t v23 = v32;
  }
  else
  {
    uint64_t v23 = v32;
    uint64_t v22 = [v35 objectAtIndexedSubscript:v32];
  }
  id v33 = v22;
  saveOrRestoreLSTMWeightsAndAccumulatorsHelper(v39, v20, (void *)[v33 bytes], 4 * count, v8);
  if (v16)
  {
    uint64_t v24 = v16 * v23;
    do
    {
      if (v8)
      {
        uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(count, 4uLL, 0x100004052888210uLL), count, 1);
        [v38 addObject:v25];
      }
      else
      {
        uint64_t v25 = [v38 objectAtIndexedSubscript:v24];
      }
      unint64_t v26 = [v21 biasMomentumData];
      id v27 = [v26 objectAtIndexedSubscript:v37];
      uint64_t v28 = [v27 bytes];

      uint64_t v29 = *(void *)(v28 + 136);
      id v30 = v25;
      saveOrRestoreLSTMWeightsAndAccumulatorsHelper(v29, v20, (void *)[v30 bytes], 4 * count, v8);

      ++v24;
      --v16;
    }
    while (v16);
  }
}

- (void)createBNNSDesc2DForLSTMWeights:(id)a3 tensorParameters:(id)a4 deviceOptimizers:(id)a5 isInputWeight:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 params];
  uint64_t v57 = [v12 bytes];

  id v13 = [v9 lstmDeltaParams];
  uint64_t v56 = [v13 bytes];

  uint64_t v14 = [v9 numLayers];
  int v59 = [v9 biDirectional];
  uint64_t v48 = v11;
  unint64_t v15 = [v11 objectAtIndexedSubscript:0];
  uint64_t v16 = [v15 accumulatorBufferCount];

  uint64_t v17 = v6;
  id v49 = v10;
  uint64_t v63 = [v10 count];
  uint64_t v55 = [v9 inputSize];
  uint64_t v54 = [v9 hiddenSize];
  if (v6)
  {
    uint64_t v62 = [v9 bnnsDesc2DInputWeightParams];
    uint64_t v61 = [v9 bnnsDesc2DInputWeightGrads];
    [v9 bnnsDesc2DInputWeightAccumulators];
  }
  else
  {
    uint64_t v62 = [v9 bnnsDesc2DHiddenWeightParams];
    uint64_t v61 = [v9 bnnsDesc2DHiddenWeightGrads];
    [v9 bnnsDesc2DHiddenWeightAccumulators];
  unint64_t v18 = };
  if (![v18 count] && v16)
  {
    uint64_t v19 = 0;
    uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      id v21 = (void *)[v20 mutableCopy];
      [v18 setObject:v21 atIndexedSubscript:v19];

      ++v19;
    }
    while (v16 != v19);
  }
  uint64_t v53 = v16;
  uint64_t v60 = v18;
  uint64_t v50 = v9;
  if (v17) {
    [v9 inputWeightsMomentumDescData];
  }
  else {
  uint64_t v22 = [v9 hiddenWeightsMomentumDescData];
  }
  if (v63)
  {
    unint64_t v23 = 0;
    unint64_t v52 = 4 * v14;
    uint64_t v51 = v17 << 63 >> 63;
    long long v24 = 0uLL;
    unint64_t v25 = 0x1E4F1C000uLL;
    int v64 = v17;
    do
    {
      BOOL v26 = v23 >= v52;
      uint64_t v27 = v59 & v26;
      *(_OWORD *)id v121 = v24;
      *(_OWORD *)&v121[16] = v24;
      if ((v59 & v26) != 0) {
        unint64_t v28 = v52;
      }
      else {
        unint64_t v28 = 0;
      }
      unint64_t v29 = v23 - v28;
      long long v130 = v24;
      unint64_t v30 = (v23 - v28) >> 2;
      long long v129 = v24;
      long long v128 = v24;
      long long v127 = v24;
      long long v126 = v24;
      long long v125 = v24;
      long long v124 = v24;
      long long v123 = v24;
      long long v122 = v24;
      LODWORD(v129) = 65568;
      int v31 = (v23 - v28 < 4) & v17;
      uint64_t v32 = v55;
      if (!v31) {
        uint64_t v32 = v54;
      }
      *(void *)&v121[8] = v32;
      *(void *)&v121[16] = v54;
      *(_DWORD *)&v121[4] = 0x20000;
      v110[0] = 0x2000000000000;
      long long v120 = v24;
      long long v119 = v24;
      long long v118 = v24;
      long long v117 = v24;
      long long v116 = v24;
      long long v115 = v24;
      long long v114 = v24;
      long long v113 = v24;
      long long v112 = v24;
      LODWORD(v119) = 65568;
      v110[1] = v32;
      long long v111 = (unint64_t)v54;
      unint64_t v33 = v23 & 3;
      long long v109 = v24;
      long long v108 = v24;
      long long v107 = v24;
      long long v106 = v24;
      long long v105 = v24;
      long long v104 = v24;
      long long v103 = v24;
      long long v102 = v24;
      long long v101 = v24;
      long long v100 = v24;
      long long v99 = v24;
      long long v98 = v24;
      long long v97 = v24;
      long long v96 = v24;
      long long v95 = v24;
      long long v94 = v24;
      long long v93 = v24;
      long long v92 = v24;
      long long v91 = v24;
      long long v90 = v24;
      long long v89 = v24;
      long long v88 = v24;
      long long v87 = v24;
      long long v86 = v24;
      v85[57] = v24;
      v85[56] = v24;
      v85[55] = v24;
      v85[54] = v24;
      v85[53] = v24;
      v85[52] = v24;
      v85[51] = v24;
      v85[50] = v24;
      [(MLCDeviceCPU *)self getGateDesc:v33 lstmParams:v57];
      memset(v85, 0, 384);
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      [(MLCDeviceCPU *)self getGateDesc:v33 lstmParams:v56];
      if (v31 == 1)
      {
        unint64_t v34 = v30;
        id v35 = (void *)(*((void *)&v86 + 1) + 8 * v27);
        id v36 = (char *)v85 + 8;
        uint64_t v37 = v27;
      }
      else if (v17)
      {
        unint64_t v34 = v30;
        uint64_t v37 = ((v30 - 1) << v59) + v27;
        id v35 = (void *)(*((void *)&v97 + 1) + 8 * v37);
        id v36 = (char *)&v85[11] + 8;
      }
      else
      {
        unint64_t v34 = v30;
        uint64_t v37 = (v30 << v59) + v27;
        id v35 = (void *)(*((void *)&v108 + 1) + 8 * v37);
        id v36 = (char *)&v85[22] + 8;
      }
      *((void *)&v128 + 1) = *v35;
      *((void *)&v118 + 1) = *(void *)(*(void *)v36 + 8 * v37);
      id v38 = [*(id *)(v25 + 2488) dataWithBytes:v121 length:176];
      [v62 setObject:v38 atIndexedSubscript:v23];

      uint64_t v39 = [*(id *)(v25 + 2488) dataWithBytes:v110 length:176];
      [v61 setObject:v39 atIndexedSubscript:v23];

      long long v24 = 0uLL;
      if (v53)
      {
        uint64_t v40 = 0;
        if ((v64 & (v29 > 3)) != 0) {
          v33 |= 4uLL;
        }
        uint64_t v41 = (v34 + v51) << v59;
        if (v31) {
          uint64_t v41 = 0;
        }
        uint64_t v42 = v41 + v27;
        do
        {
          uint64_t v65 = 0x2000000000000;
          uint64_t v67 = 0;
          long long v75 = v24;
          long long v76 = v24;
          long long v73 = v24;
          long long v74 = v24;
          long long v71 = v24;
          long long v72 = v24;
          long long v69 = v24;
          long long v70 = v24;
          long long v68 = v24;
          LODWORD(v75) = 65568;
          long long v66 = *(_OWORD *)&v121[8];
          int v43 = [v22 objectAtIndexedSubscript:v40];
          id v44 = [v43 objectAtIndexedSubscript:v33];
          uint64_t v45 = [v44 bytes];

          *((void *)&v74 + 1) = *(void *)(*(void *)(v45 + 136) + 8 * v42);
          SEL v46 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v65 length:176];
          uint64_t v47 = [v60 objectAtIndexedSubscript:v40];
          [v47 setObject:v46 atIndexedSubscript:v23];

          long long v24 = 0uLL;
          ++v40;
        }
        while (v53 != v40);
      }
      ++v23;
      LODWORD(v17) = v64;
      unint64_t v25 = 0x1E4F1C000;
    }
    while (v23 != v63);
  }
}

- (void)optimizerStepForSingleParameterLSTM:(id)a3 tensorParameters:(id)a4 parameterForGateDesc:(id *)a5 gradientsForGateDesc:(id *)a6 parameterMomentumDescData:(id)a7 gateIndex:(unint64_t)a8 deviceOptimizers:(id)a9 isStackedInputWeight:(BOOL)a10
{
  uint64_t v67 = a6;
  v104[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a9;
  uint64_t v18 = [v14 numLayers];
  id v56 = v14;
  unsigned int v72 = [v14 biDirectional];
  id v69 = v17;
  uint64_t v19 = [v17 objectAtIndexedSubscript:0];
  uint64_t v20 = [v19 accumulatorBufferCount];

  uint64_t v55 = (uint64_t)&v55;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v95 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  DWORD1(v89) = 0x20000;
  unint64_t v21 = a5->var2[1];
  *((void *)&v89 + 1) = a5->var2[0];
  *(void *)&long long v90 = v21;
  unint64_t v22 = a5->var3[1];
  *((void *)&v93 + 1) = a5->var3[0];
  *(void *)&long long v94 = v22;
  v104[0] = &v89;
  LODWORD(v98) = a5->var5;
  v77[0] = 0x2000000000000;
  long long v78 = 0u;
  uint64_t v81 = 0;
  long long v83 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v84 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v77[1] = *((void *)&v89 + 1);
  *(void *)&long long v78 = v21;
  uint64_t v82 = *((void *)&v93 + 1);
  *(void *)&long long v83 = v22;
  LODWORD(v87) = v98;
  long long v103 = v77;
  if ((unint64_t)(8 * v20) >= 0x200) {
    size_t v23 = 512;
  }
  else {
    size_t v23 = 8 * v20;
  }
  bzero((char *)&v55 - ((8 * v20 + 15) & 0xFFFFFFFFFFFFFFF0), v23);
  long long v71 = (char *)&v55 - ((8 * v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v71, 8 * v20);
  long long v24 = objc_msgSend(MEMORY[0x1E4F1CBF0], "mutableCopy", v55);
  uint64_t v26 = v20;
  if (v20)
  {
    uint64_t v27 = 0;
    do
    {
      memset(v100, 0, sizeof(v100));
      long long v101 = 0u;
      long long v102 = 0u;
      LODWORD(v101) = a5->var5;
      *(_OWORD *)((char *)v100 + 8) = *(_OWORD *)a5->var2;
      DWORD1(v100[0]) = 0x20000;
      unint64_t v28 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v100 length:176];
      [v24 setObject:v28 atIndexedSubscript:v27];

      id v29 = [v24 objectAtIndexedSubscript:v27];
      uint64_t v30 = [v29 bytes];
      *(void *)&v71[8 * v27] = v30;

      ++v27;
    }
    while (v26 != v27);
  }
  id v68 = v24;
  uint64_t v75 = v26;
  unint64_t v60 = a5->var2[3];
  if (v60)
  {
    uint64_t v31 = 0;
    uint64_t v58 = v72;
    BOOL v59 = a10;
    unint64_t v32 = a8 + 4;
    if (!a10) {
      unint64_t v32 = a8;
    }
    unint64_t v62 = v32;
    *(void *)&long long v25 = 67109120;
    long long v57 = v25;
    id v65 = v15;
    unint64_t v66 = a8;
    uint64_t v63 = v18;
    int v64 = a5;
    do
    {
      uint64_t v33 = 0;
      uint64_t v73 = v31 + v59;
      uint64_t v61 = v31;
      uint64_t v70 = v31 << v58;
      int v34 = 1;
      do
      {
        int v74 = v34;
        id v35 = [v15 objectAtIndexedSubscript:a8 + 4 * (v73 + v33 * v18)];
        int v36 = [v35 isUpdatable];

        if (v36)
        {
          uint64_t v37 = v33 + v70;
          *((void *)&v97 + 1) = *((void *)a5->var4 + v33 + v70);
          id v38 = v68;
          *((void *)&v86 + 1) = *((void *)v67->var4 + v37);
          unint64_t v39 = v62;
          if (v75)
          {
            for (uint64_t i = 0; i != v75; ++i)
            {
              id v41 = [v38 objectAtIndexedSubscript:i];
              uint64_t v76 = [v41 bytes];
              uint64_t v42 = [v16 objectAtIndexedSubscript:i];
              [v42 objectAtIndexedSubscript:v39];
              uint64_t v43 = v37;
              id v44 = v16;
              id v45 = objc_claimAutoreleasedReturnValue();
              uint64_t v46 = [v45 bytes];

              id v16 = v44;
              uint64_t v37 = v43;

              *(void *)(v76 + 136) = *(void *)(*(void *)(v46 + 136) + 8 * v43);
            }
          }
          id v47 = v69;
          uint64_t v48 = [v69 objectAtIndexedSubscript:0];
          uint64_t v49 = [v48 function];
          uint64_t v50 = [v47 objectAtIndexedSubscript:0];
          id v51 = [v50 optimizerAlgFields];
          uint64_t v52 = [v51 bytes];
          unsigned int v53 = MEMORY[0x1E01B0E10](v49, v52, 1, v104, &v103, v71, 0);

          id v15 = v65;
          a8 = v66;
          uint64_t v18 = v63;
          a5 = v64;
          if (v53)
          {
            uint64_t v54 = +[MLCLog framework];
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(void *)&v100[0] = __PAIR64__(v53, v57);
              _os_log_error_impl(&dword_1DD0C9000, v54, OS_LOG_TYPE_ERROR, "Optimizer update for LSTM with BNNS failed:%d", (uint8_t *)v100, 8u);
            }
          }
        }
        uint64_t v33 = 1;
        int v34 = 0;
      }
      while ((v72 & v74 & 1) != 0);
      uint64_t v31 = v61 + 1;
    }
    while (v61 + 1 != v60);
  }
}

- (void)updateRNNLayer:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8
{
  SEL v98 = a2;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0, v98);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v104 = [v19 params];
  uint64_t v108 = [v104 bytes];
  id v20 = [v19 lstmDeltaParams];
  uint64_t v103 = [v20 bytes];

  unint64_t v21 = [v19 auxBiasTerms];
  [v21 removeAllObjects];

  unint64_t v22 = [v19 auxBiasTermsAccumulators];
  [v22 removeAllObjects];

  [(MLCDeviceCPU *)self createBNNSDesc2DForLSTMWeights:v19 tensorParameters:v15 deviceOptimizers:v14 isInputWeight:1];
  id v105 = v14;
  long long v106 = self;
  [(MLCDeviceCPU *)self createBNNSDesc2DForLSTMWeights:v19 tensorParameters:v16 deviceOptimizers:v14 isInputWeight:0];
  uint64_t v23 = 0;
  if ([v15 count])
  {
    unint64_t v24 = 0;
    do
    {
      long long v25 = [v15 objectAtIndexedSubscript:v24];
      unsigned int v26 = [v25 isUpdatable];

      v23 += v26;
      ++v24;
    }
    while (v24 < [v15 count]);
  }
  if ([v16 count])
  {
    unint64_t v27 = 0;
    do
    {
      unint64_t v28 = [v16 objectAtIndexedSubscript:v27];
      unsigned int v29 = [v28 isUpdatable];

      v23 += v29;
      ++v27;
    }
    while (v27 < [v16 count]);
  }
  if (v17) {
    int v109 = [v17 count] != 0;
  }
  else {
    int v109 = 0;
  }
  id v107 = v17;
  id v110 = v19;
  if ([v19 hasBias])
  {
    id v30 = v18;
    int v31 = 0;
    if ([v17 count])
    {
      unint64_t v32 = 0;
      id v17 = v107;
      do
      {
        uint64_t v33 = [v17 objectAtIndexedSubscript:v32];
        int v34 = [v33 isUpdatable];

        if ((v34 & 1) == 0)
        {
          id v35 = [v110 auxBiasTerms];
          int v36 = [v110 auxBiasTermsAccumulators];
          [(MLCDeviceCPU *)v106 saveOrRestoreLSTMBiasesAndAccumulators:v110 auxParameter:v35 auxAccumulators:v36 mlcIndex:v32 auxIndex:0 saveParameter:1];
        }
        v31 |= v34;
        ++v32;
        id v17 = v107;
      }
      while (v32 < [v107 count]);
    }
    else
    {
      id v17 = v107;
    }
    v109 &= v31;
    if (v109) {
      v23 += 4;
    }
    id v18 = v30;
    id v19 = v110;
  }
  if (v23)
  {
    long long v101 = &v98;
    id v102 = v18;
    unint64_t v37 = (8 * v23 + 15) & 0xFFFFFFFFFFFFFFF0;
    id v38 = (char *)&v98 - v37;
    if ((unint64_t)(8 * v23) >= 0x200) {
      size_t v39 = 512;
    }
    else {
      size_t v39 = 8 * v23;
    }
    bzero((char *)&v98 - v37, v39);
    bzero((char *)&v98 - v37, 8 * v23);
    uint64_t v40 = (char *)&v98 - v37;
    bzero((char *)&v98 - v37, v39);
    bzero((char *)&v98 - v37, 8 * v23);
    if ([v15 count])
    {
      unint64_t v41 = 0;
      uint64_t v42 = 0;
      do
      {
        uint64_t v43 = [v15 objectAtIndexedSubscript:v41];
        int v44 = [v43 isUpdatable];

        if (v44)
        {
          id v45 = [v19 bnnsDesc2DInputWeightParams];
          id v46 = [v45 objectAtIndexedSubscript:v41];
          *(void *)&v38[8 * v42] = [v46 bytes];

          id v47 = [v19 bnnsDesc2DInputWeightGrads];
          id v48 = [v47 objectAtIndexedSubscript:v41];
          *(void *)&v40[8 * v42] = [v48 bytes];

          ++v42;
        }
        ++v41;
      }
      while (v41 < [v15 count]);
    }
    else
    {
      uint64_t v42 = 0;
    }
    if ([v16 count])
    {
      unint64_t v49 = 0;
      do
      {
        uint64_t v50 = [v16 objectAtIndexedSubscript:v49];
        int v51 = [v50 isUpdatable];

        if (v51)
        {
          uint64_t v52 = [v19 bnnsDesc2DHiddenWeightParams];
          id v53 = [v52 objectAtIndexedSubscript:v49];
          *(void *)&v38[8 * v42] = [v53 bytes];

          uint64_t v54 = [v19 bnnsDesc2DHiddenWeightGrads];
          id v55 = [v54 objectAtIndexedSubscript:v49];
          *(void *)&v40[8 * v42] = [v55 bytes];

          ++v42;
        }
        ++v49;
      }
      while (v49 < [v16 count]);
    }
    int v56 = [v19 hasBias];
    if (v56 & v109)
    {
      uint64_t v57 = v108;
      *(void *)&v38[8 * v42] = v108 + 1984;
      uint64_t v58 = 8 * v42 + 8;
      *(void *)&v38[v58] = v57 + 2912;
      uint64_t v59 = 8 * v42 + 16;
      *(void *)&v38[v59] = v57 + 3840;
      uint64_t v60 = 8 * v42 + 24;
      *(void *)&v38[v60] = v57 + 4768;
      uint64_t v61 = v103;
      *(void *)&v40[8 * v42] = v103 + 1984;
      *(void *)&v40[v58] = v61 + 2912;
      *(void *)&v40[v59] = v61 + 3840;
      *(void *)&v40[v60] = v61 + 4768;
    }
    long long v99 = v40;
    long long v100 = v38;
    unint64_t v62 = [v105 objectAtIndexedSubscript:0];
    uint64_t v63 = [v62 accumulatorBufferCount];

    uint64_t v103 = v23;
    size_t v64 = 8 * v63 * v23;
    id v65 = (char *)&v98 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v64 >= 0x200) {
      size_t v66 = 512;
    }
    else {
      size_t v66 = v64;
    }
    bzero((char *)&v98 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0), v66);
    bzero((char *)&v98 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0), v64);
    uint64_t v108 = v63;
    if (v63)
    {
      uint64_t v67 = 0;
      uint64_t v68 = 0;
      do
      {
        if ([v15 count])
        {
          unint64_t v69 = 0;
          do
          {
            uint64_t v70 = [v15 objectAtIndexedSubscript:v69];
            int v71 = [v70 isUpdatable];

            if (v71)
            {
              unsigned int v72 = [v19 bnnsDesc2DInputWeightAccumulators];
              uint64_t v73 = [v72 objectAtIndexedSubscript:v67];
              id v74 = [v73 objectAtIndexedSubscript:v69];
              *(void *)&v65[8 * v68] = [v74 bytes];

              ++v68;
              id v19 = v110;
            }
            ++v69;
          }
          while (v69 < [v15 count]);
        }
        if ([v16 count])
        {
          unint64_t v75 = 0;
          do
          {
            uint64_t v76 = [v16 objectAtIndexedSubscript:v75];
            int v77 = [v76 isUpdatable];

            if (v77)
            {
              long long v78 = [v19 bnnsDesc2DHiddenWeightAccumulators];
              long long v79 = [v78 objectAtIndexedSubscript:v67];
              id v80 = [v79 objectAtIndexedSubscript:v75];
              *(void *)&v65[8 * v68] = [v80 bytes];

              ++v68;
              id v19 = v110;
            }
            ++v75;
          }
          while (v75 < [v16 count]);
        }
        int v81 = [v19 hasBias];
        if (v81 & v109)
        {
          uint64_t v82 = [v19 biasMomentumData];
          id v83 = [v82 objectAtIndexedSubscript:4 * v67];
          long long v84 = &v65[8 * v68];
          *(void *)long long v84 = [v83 bytes];

          long long v85 = [v19 biasMomentumData];
          id v86 = [v85 objectAtIndexedSubscript:(4 * v67) | 1];
          *((void *)v84 + 1) = [v86 bytes];

          long long v87 = [v19 biasMomentumData];
          id v88 = [v87 objectAtIndexedSubscript:(4 * v67) | 2];
          *((void *)v84 + 2) = [v88 bytes];

          long long v89 = [v19 biasMomentumData];
          id v90 = [v89 objectAtIndexedSubscript:(4 * v67) | 3];
          v68 += 4;
          *((void *)v84 + 3) = [v90 bytes];
        }
        ++v67;
      }
      while (v67 != v108);
    }
    id v18 = v102;
    if (v102)
    {
      [(MLCDeviceCPU *)v106 accumulateParams:v100 gradients:v99 accumulators:v65 numOfParameters:v103 inArrayOfParams:v102];
      id v17 = v107;
    }
    else
    {
      id v91 = v105;
      long long v92 = [v105 objectAtIndexedSubscript:0];
      uint64_t v93 = [v92 function];
      long long v94 = [v91 objectAtIndexedSubscript:0];
      id v95 = [v94 optimizerAlgFields];
      uint64_t v96 = [v95 bytes];
      LODWORD(v93) = MEMORY[0x1E01B0E10](v93, v96, v103, v100, v99, v65, 0);

      id v17 = v107;
      if (v93)
      {
        long long v97 = +[MLCLog framework];
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateRNNLayer:optimizer:inputWeightsParameter:hiddenWeightsParameter:biasesParameter:arrayOfParams:]();
        }
      }
    }
  }
}

- (void)updateMultiheadAttentionLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7
{
  SEL v112 = a2;
  long long v119 = self;
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0, v112);
  id v16 = [v15 params];
  uint64_t v120 = [v16 bytes];
  uint64_t v17 = 0;
  if ([v12 count])
  {
    unint64_t v18 = 0;
    do
    {
      id v19 = [v12 objectAtIndexedSubscript:v18];
      unsigned int v20 = [v19 isUpdatable];

      v17 += v20;
      ++v18;
    }
    while (v18 < [v12 count]);
  }
  if (v13 && [v13 count])
  {
    unint64_t v21 = 0;
    do
    {
      unint64_t v22 = [v13 objectAtIndexedSubscript:v21];
      unsigned int v23 = [v22 isUpdatable];

      v17 += v23;
      ++v21;
    }
    while (v21 < [v13 count]);
  }
  if (v17)
  {
    id v116 = v16;
    id v117 = v14;
    long long v114 = &v112;
    unint64_t v24 = (8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0;
    long long v25 = (SEL *)((char *)&v112 - v24);
    if ((unint64_t)(8 * v17) >= 0x200) {
      size_t v26 = 512;
    }
    else {
      size_t v26 = 8 * v17;
    }
    bzero((char *)&v112 - v24, v26);
    bzero((char *)&v112 - v24, 8 * v17);
    unint64_t v27 = (char *)&v112 - v24;
    bzero(v27, v26);
    bzero(v27, 8 * v17);
    id v118 = v11;
    unint64_t v28 = [v11 objectAtIndexedSubscript:0];
    uint64_t v29 = [v28 accumulatorBufferCount];

    uint64_t v121 = v29;
    size_t v30 = 8 * v29 * v17;
    unint64_t v31 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0;
    unint64_t v32 = (char *)&v112 - v31;
    if (v30 >= 0x200) {
      size_t v33 = 512;
    }
    else {
      size_t v33 = v30;
    }
    int v34 = v27;
    bzero((char *)&v112 - v31, v33);
    long long v122 = v32;
    bzero(v32, v30);
    id v35 = [v12 objectAtIndexedSubscript:0];
    int v36 = [v35 isUpdatable];

    uint64_t v37 = 0;
    uint64_t v38 = v120;
    if (v36)
    {
      void *v25 = v120 + 176;
      size_t v39 = [v15 inDeltaData];
      id v40 = [v39 objectAtIndexedSubscript:0];
      *int v34 = [v40 bytes] + 176;

      uint64_t v37 = 1;
    }
    unint64_t v41 = [v12 objectAtIndexedSubscript:1];
    int v42 = [v41 isUpdatable];

    if (v42)
    {
      v25[v37] = v38 + 704;
      uint64_t v43 = [v15 inDeltaData];
      id v44 = [v43 objectAtIndexedSubscript:1];
      v34[v37] = [v44 bytes] + 176;

      ++v37;
    }
    id v45 = [v12 objectAtIndexedSubscript:2];
    int v46 = [v45 isUpdatable];

    if (v46)
    {
      v25[v37] = v38 + 1232;
      id v47 = [v15 inDeltaData];
      id v48 = [v47 objectAtIndexedSubscript:2];
      v34[v37] = [v48 bytes] + 176;

      ++v37;
    }
    unint64_t v49 = [v12 objectAtIndexedSubscript:3];
    int v50 = [v49 isUpdatable];

    if (v50)
    {
      v25[v37] = v38 + 2120;
      int v51 = [v15 outDeltaData];
      id v52 = [v51 objectAtIndexedSubscript:0];
      v34[v37] = [v52 bytes] + 176;

      ++v37;
    }
    int v53 = [v15 hasBias];
    uint64_t v54 = 4;
    if (!v53) {
      uint64_t v54 = 0;
    }
    uint64_t v113 = v54;
    int v55 = [v15 hasBias];
    uint64_t v115 = v17;
    if (v55)
    {
      int v56 = [v13 objectAtIndexedSubscript:0];
      int v57 = [v56 isUpdatable];

      if (v57)
      {
        v25[v37] = v38 + 352;
        uint64_t v58 = [v15 inDeltaData];
        id v59 = [v58 objectAtIndexedSubscript:0];
        v34[v37] = [v59 bytes] + 352;

        ++v37;
      }
      uint64_t v60 = [v13 objectAtIndexedSubscript:1];
      int v61 = [v60 isUpdatable];

      if (v61)
      {
        v25[v37] = v38 + 880;
        unint64_t v62 = [v15 inDeltaData];
        id v63 = [v62 objectAtIndexedSubscript:1];
        v34[v37] = [v63 bytes] + 352;

        ++v37;
      }
      size_t v64 = [v13 objectAtIndexedSubscript:2];
      int v65 = [v64 isUpdatable];

      if (v65)
      {
        v25[v37] = v38 + 1408;
        size_t v66 = [v15 inDeltaData];
        id v67 = [v66 objectAtIndexedSubscript:2];
        v34[v37] = [v67 bytes] + 352;

        ++v37;
      }
      uint64_t v68 = [v13 objectAtIndexedSubscript:3];
      int v69 = [v68 isUpdatable];

      if (v69)
      {
        v25[v37] = v38 + 2296;
        uint64_t v70 = [v15 outDeltaData];
        id v71 = [v70 objectAtIndexedSubscript:0];
        v34[v37] = [v71 bytes] + 352;

        ++v37;
      }
    }
    if ([v15 hasAttnBias])
    {
      unsigned int v72 = [v13 objectAtIndexedSubscript:v113];
      int v73 = [v72 isUpdatable];

      if (v73)
      {
        v25[v37] = v38 + 1592;
        id v74 = [v15 attnBiasDeltaData];
        id v75 = [v74 objectAtIndexedSubscript:0];
        v34[v37] = [v75 bytes];

        ++v37;
      }
      uint64_t v76 = [v13 objectAtIndexedSubscript:v113 | 1];
      int v77 = [v76 isUpdatable];

      if (v77)
      {
        v25[v37] = v38 + 1768;
        long long v78 = [v15 attnBiasDeltaData];
        id v79 = [v78 objectAtIndexedSubscript:1];
        v34[v37] = [v79 bytes];
      }
    }
    uint64_t v113 = (uint64_t)v34;
    uint64_t v120 = (uint64_t)v25;
    if (v121)
    {
      uint64_t v80 = 0;
      uint64_t v81 = 0;
      id v82 = v12;
      do
      {
        id v83 = v13;
        long long v84 = [v15 weightsMomentumDeltaDataArray];
        uint64_t v85 = [v84 count];

        if (v85)
        {
          unint64_t v86 = 0;
          do
          {
            long long v87 = [v12 objectAtIndexedSubscript:v86];
            int v88 = [v87 isUpdatable];

            if (v88)
            {
              long long v89 = [v15 weightsMomentumDeltaDataArray];
              id v90 = [v89 objectAtIndexedSubscript:v86];
              id v91 = [v90 objectAtIndexedSubscript:v80];
              uint64_t v92 = [v91 bytes];
              *(void *)&v122[8 * v81] = v92;

              ++v81;
              id v12 = v82;
            }
            ++v86;
            uint64_t v93 = [v15 weightsMomentumDeltaDataArray];
            unint64_t v94 = [v93 count];
          }
          while (v86 < v94);
        }
        id v95 = [v15 biasMomentumDeltaDataArray];
        uint64_t v96 = [v95 count];

        if (v96)
        {
          unint64_t v97 = 0;
          id v13 = v83;
          do
          {
            SEL v98 = [v13 objectAtIndexedSubscript:v97];
            int v99 = [v98 isUpdatable];

            if (v99)
            {
              long long v100 = [v15 biasMomentumDeltaDataArray];
              long long v101 = [v100 objectAtIndexedSubscript:v97];
              id v102 = [v101 objectAtIndexedSubscript:v80];
              uint64_t v103 = [v102 bytes];
              *(void *)&v122[8 * v81] = v103;

              id v13 = v83;
              ++v81;
              id v12 = v82;
            }
            ++v97;
            id v104 = [v15 biasMomentumDeltaDataArray];
            unint64_t v105 = [v104 count];
          }
          while (v97 < v105);
        }
        else
        {
          id v13 = v83;
        }
        ++v80;
      }
      while (v80 != v121);
    }
    id v14 = v117;
    if (v117)
    {
      [(MLCDeviceCPU *)v119 accumulateParams:v120 gradients:v113 accumulators:v122 numOfParameters:v115 inArrayOfParams:v117];
      id v11 = v118;
    }
    else
    {
      id v11 = v118;
      long long v106 = [v118 objectAtIndexedSubscript:0];
      uint64_t v107 = [v106 function];
      uint64_t v108 = [v11 objectAtIndexedSubscript:0];
      id v109 = [v108 optimizerAlgFields];
      uint64_t v110 = [v109 bytes];
      LODWORD(v107) = MEMORY[0x1E01B0E10](v107, v110, v115, v120, v113, v122, 0);

      if (v107)
      {
        uint64_t v111 = +[MLCLog framework];
        if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateMultiheadAttentionLayer:optimizer:weightsParameter:biasesParameter:arrayOfParams:]();
        }
      }
    }
    id v16 = v116;
  }
}

- (void)updateEmbeddingLayer:(id)a3 weightsParameter:(id)a4 optimizer:(id)a5 arrayOfParams:(id)a6
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v12 isUpdatable])
  {
    int v56 = self;
    id v62 = v14;
    id v65 = v11;
    id v15 = objc_msgSend(v11, "objectAtIndexedSubscript:", 0, a2);
    id v64 = v12;
    id v16 = [v12 tensor];
    id v17 = [v15 params];
    v67[0] = [v17 bytes];

    id v63 = v13;
    unint64_t v18 = [v13 objectAtIndexedSubscript:0];
    uint64_t v19 = [v18 accumulatorBufferCount];

    uint64_t v60 = &v55;
    uint64_t v57 = v19;
    size_t v20 = 8 * v19;
    unint64_t v21 = (char *)&v55 - ((8 * v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v20 >= 0x200) {
      size_t v22 = 512;
    }
    else {
      size_t v22 = v20;
    }
    bzero(v21, v22);
    uint64_t v58 = v21;
    bzero(v21, v20);
    id v23 = [v15 source];
    unint64_t v24 = (uint64_t *)[v23 bytes];
    id v59 = v23;
    unint64_t v25 = [v23 length];
    unint64_t v26 = v25 >> 3;
    unint64_t v27 = [v16 descriptor];
    unint64_t v28 = [v27 shape];
    uint64_t v29 = [v16 descriptor];
    size_t v30 = objc_msgSend(v28, "objectAtIndexedSubscript:", objc_msgSend(v29, "dimensionCount") - 1);
    vDSP_Length v31 = [v30 unsignedIntegerValue];

    id v32 = [v15 weightsDeltaData];
    size_t v33 = *(void **)([v32 bytes] + 136);

    id v61 = v16;
    int v34 = [v16 descriptor];
    bzero(v33, [v34 tensorAllocationSizeInBytes]);

    id v35 = [v15 weightsDeltaDataBytes];
    int v36 = (const float *)[v35 bytes];

    uint64_t v37 = [v15 paddingIndex];

    if (v37)
    {
      if (v25 >= 8)
      {
        if (v26 <= 1) {
          uint64_t v38 = 1;
        }
        else {
          uint64_t v38 = v25 >> 3;
        }
        do
        {
          size_t v39 = [v15 paddingIndex];
          uint64_t v40 = [v39 longLongValue];
          uint64_t v41 = *v24;

          if (v40 != v41) {
            vDSP_vadd((const float *)v33 + *v24 * v31, 1, v36, 1, (float *)v33 + *v24 * v31, 1, v31);
          }
          ++v24;
          v36 += v31;
          --v38;
        }
        while (v38);
      }
    }
    else if (v25 >= 8)
    {
      if (v26 <= 1) {
        uint64_t v42 = 1;
      }
      else {
        uint64_t v42 = v25 >> 3;
      }
      do
      {
        uint64_t v43 = *v24++;
        vDSP_vadd((const float *)v33 + v43 * v31, 1, v36, 1, (float *)v33 + v43 * v31, 1, v31);
        v36 += v31;
        --v42;
      }
      while (v42);
    }
    id v44 = [v15 weightsDeltaData];
    uint64_t v66 = [v44 bytes];

    uint64_t v45 = v57;
    int v46 = v58;
    if (v57)
    {
      uint64_t v47 = 0;
      do
      {
        id v48 = [v15 weightsMomentumData];
        id v49 = [v48 objectAtIndexedSubscript:v47];
        *(void *)&v46[8 * v47] = [v49 bytes];

        ++v47;
      }
      while (v45 != v47);
    }
    id v14 = v62;
    id v13 = v63;
    if (v62)
    {
      [(MLCDeviceCPU *)v56 accumulateParams:v67 gradients:&v66 accumulators:v46 numOfParameters:1 inArrayOfParams:v62];
      id v12 = v64;
      id v11 = v65;
    }
    else
    {
      int v50 = [v63 objectAtIndexedSubscript:0];
      uint64_t v51 = [v50 function];
      id v52 = [v13 objectAtIndexedSubscript:0];
      id v53 = [v52 optimizerAlgFields];
      LODWORD(v51) = MEMORY[0x1E01B0E10](v51, [v53 bytes], 1, v67, &v66, v46, 0);

      id v12 = v64;
      id v11 = v65;
      if (v51)
      {
        uint64_t v54 = +[MLCLog framework];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateMultiheadAttentionLayer:optimizer:weightsParameter:biasesParameter:arrayOfParams:]();
        }
      }
    }
  }
}

- (void)updateAllParametersWithOptimizer:(id)a3 arrayOfParameters:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectAtIndexedSubscript:0];
  uint64_t v30 = [v7 bytes];

  id v8 = [v6 objectAtIndexedSubscript:1];
  uint64_t v29 = [v8 bytes];

  id v9 = [v6 objectAtIndexedSubscript:2];
  uint64_t v31 = [v9 bytes];

  id v10 = [v6 objectAtIndexedSubscript:3];
  uint64_t v11 = *(void *)[v10 bytes];

  id v12 = [v6 objectAtIndexedSubscript:4];
  uint64_t v13 = *(void *)[v12 bytes];

  if (v11 != v13)
  {
    id v14 = [v5 objectAtIndexedSubscript:0];
    unint64_t v15 = [v14 accumulatorBufferCount];

    if (v15 >= 2)
    {
      uint64_t v16 = 8 * v11;
      id v17 = (char *)(v31 + 8 * v11);
      unint64_t v18 = 1;
      uint64_t v19 = (char *)(v31 + 8 * v13);
      do
      {
        memmove(v19, v17, 8 * v13);
        ++v18;
        size_t v20 = [v5 objectAtIndexedSubscript:0];
        unint64_t v21 = [v20 accumulatorBufferCount];

        v17 += v16;
        v19 += 8 * v13;
      }
      while (v18 < v21);
    }
  }
  size_t v22 = objc_msgSend(v5, "objectAtIndexedSubscript:", 0, a2);
  uint64_t v23 = [v22 function];
  unint64_t v24 = [v5 objectAtIndexedSubscript:0];
  id v25 = [v24 optimizerAlgFields];
  LODWORD(v23) = MEMORY[0x1E01B0E10](v23, [v25 bytes], v13, v30, v29, v31, 0);

  if (v23)
  {
    unint64_t v26 = +[MLCLog framework];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateAllParametersWithOptimizer:arrayOfParameters:]();
    }
  }
  id v27 = [v6 objectAtIndexedSubscript:4];
  *(void *)[v27 bytes] = 0;
}

- (void)updateTensorParameter:(id)a3 optimizer:(id)a4 gradient:(id)a5 arrayOfParams:(id)a6
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v11 isUpdatable])
  {
    uint64_t v40 = self;
    unint64_t v15 = objc_msgSend(v11, "tensor", a2);
    uint64_t v16 = [v15 optimizerDeviceData];
    id v17 = [v16 objectAtIndexedSubscript:0];

    unint64_t v18 = [v11 tensor];
    uint64_t v19 = [v18 deviceMemory];

    id v45 = v19;
    size_t v20 = [v19 objectAtIndexedSubscript:0];
    id v44 = [v13 deviceMemory];
    unint64_t v21 = [v44 objectAtIndexedSubscript:0];
    id v22 = [v17 sourceBNNSDesc];
    uint64_t v23 = [v22 bytes];

    id v24 = [v17 gradientBNNSDesc];
    uint64_t v25 = [v24 bytes];

    id v43 = v20;
    *(void *)(v23 + 136) = [v43 bytes];
    id v42 = v21;
    *(void *)(v25 + 136) = [v42 bytes];
    uint64_t v46 = v25;
    v47[0] = v23;
    unint64_t v26 = [v12 objectAtIndexedSubscript:0];
    uint64_t v27 = [v26 accumulatorBufferCount];

    uint64_t v41 = &v39;
    unint64_t v28 = (char *)&v39 - ((8 * v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    if ((unint64_t)(8 * v27) >= 0x200) {
      size_t v29 = 512;
    }
    else {
      size_t v29 = 8 * v27;
    }
    bzero((char *)&v39 - ((8 * v27 + 15) & 0xFFFFFFFFFFFFFFF0), v29);
    bzero((char *)&v39 - ((8 * v27 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v27);
    if (v27)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        uint64_t v31 = [v17 momentumData];
        id v32 = [v31 objectAtIndexedSubscript:i];
        *(void *)&v28[8 * i] = [v32 bytes];
      }
    }
    if (v14)
    {
      [(MLCDeviceCPU *)v40 accumulateParams:v47 gradients:&v46 accumulators:(char *)&v39 - ((8 * v27 + 15) & 0xFFFFFFFFFFFFFFF0) numOfParameters:1 inArrayOfParams:v14];
    }
    else
    {
      size_t v33 = [v12 objectAtIndexedSubscript:0];
      uint64_t v34 = [v33 function];
      id v35 = [v12 objectAtIndexedSubscript:0];
      id v36 = [v35 optimizerAlgFields];
      int v37 = MEMORY[0x1E01B0E10](v34, [v36 bytes], 1, v47, &v46, v28, 0);

      if (v37)
      {
        uint64_t v38 = +[MLCLog framework];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateTensorParameter:optimizer:gradient:arrayOfParams:]();
        }
      }
    }
  }
}

- (void)copyBiasFromBNNSToMLCTensor:(id)a3 biasTensors:(id)a4 baseGateIndex:(unint64_t)a5 lstmDescriptor:(id)a6
{
  id v19 = a3;
  id v23 = a4;
  id v9 = a6;
  uint64_t v10 = [v9 layerCount];
  uint64_t v11 = [v9 hiddenSize];
  int v21 = [v9 isBidirectional];
  id v22 = [v19 objectAtIndexedSubscript:a5];
  if (v10)
  {
    uint64_t v12 = 0;
    uint64_t v20 = 4 * v10;
    do
    {
      id v13 = [v23 objectAtIndexedSubscript:a5];
      id v14 = [v13 data];
      unint64_t v15 = (void *)[v14 bytes];
      id v16 = v22;
      memcpy(v15, (const void *)([v16 bytes] + 4 * (v12 << v21)), 4 * v11);

      if (v21)
      {
        id v17 = [v23 objectAtIndexedSubscript:v20 + a5];
        id v18 = [v17 data];
        memcpy((void *)[v18 bytes], (const void *)(objc_msgSend(v16, "bytes") + 4 * ((v12 << v21) + v11)), 4 * v11);
      }
      a5 += 4;
      v12 += v11;
      --v10;
    }
    while (v10);
  }
}

- (void)synchronizeUpdatesForLayer:(id)a3
{
  id v21 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v21;
    id v5 = [v4 descriptor];
    if ([v5 isBidirectional])
    {
    }
    else
    {
      id v6 = [v4 descriptor];
      unint64_t v7 = [v6 layerCount];

      if (v7 < 2)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    id v8 = [v4 deviceOps];
    id v9 = [v8 objectAtIndexedSubscript:0];

    uint64_t v10 = [v9 combinedGateWeightsAndBias];
    uint64_t v11 = [v4 descriptor];
    int v12 = [v11 usesBiases];

    if (v12)
    {
      id v13 = [v4 biases];
      id v14 = [v4 descriptor];
      [(MLCDeviceCPU *)self copyBiasFromBNNSToMLCTensor:v10 biasTensors:v13 baseGateIndex:0 lstmDescriptor:v14];

      unint64_t v15 = [v4 biases];
      id v16 = [v4 descriptor];
      [(MLCDeviceCPU *)self copyBiasFromBNNSToMLCTensor:v10 biasTensors:v15 baseGateIndex:1 lstmDescriptor:v16];

      id v17 = [v4 biases];
      id v18 = [v4 descriptor];
      [(MLCDeviceCPU *)self copyBiasFromBNNSToMLCTensor:v10 biasTensors:v17 baseGateIndex:2 lstmDescriptor:v18];

      id v19 = [v4 biases];
      uint64_t v20 = [v4 descriptor];
      [(MLCDeviceCPU *)self copyBiasFromBNNSToMLCTensor:v10 biasTensors:v19 baseGateIndex:3 lstmDescriptor:v20];
    }
    goto LABEL_8;
  }
LABEL_9:

  MEMORY[0x1F41817F8]();
}

- (void)exportBiasGateOptimizerDataForDeviceOps:(id)a3 biasTensors:(id)a4 gateIndex:(unint64_t)a5 optimizerDataIndex:(unint64_t)a6
{
  id v31 = a3;
  id v9 = a4;
  uint64_t v10 = [v31 numLayers];
  char v11 = [v31 biDirectional];
  uint64_t v12 = [v31 hiddenSize];
  id v13 = [v31 biasMomentumData];
  id v14 = [v13 objectAtIndexedSubscript:a5 + 4 * a6];

  id v30 = v14;
  uint64_t v35 = [v30 bytes];
  if (v10)
  {
    uint64_t v15 = v12;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 4 * v15;
    char v34 = v11;
    uint64_t v32 = v10;
    uint64_t v33 = v15;
    do
    {
      uint64_t v19 = 0;
      uint64_t v20 = 4 * v17;
      char v21 = 1;
      uint64_t v36 = v16;
      do
      {
        size_t v22 = v18;
        [v9 objectAtIndexedSubscript:a5 + 4 * (v16 + v19 * v10)];
        v24 = id v23 = v9;
        uint64_t v25 = [v24 optimizerData];
        [v25 objectAtIndexedSubscript:a6];
        unint64_t v26 = a5;
        v28 = unint64_t v27 = a6;
        memcpy((void *)[v28 bytes], (const void *)(*(void *)(v35 + 136) + v20), v22);

        a6 = v27;
        a5 = v26;

        uint64_t v18 = v22;
        uint64_t v16 = v36;
        id v9 = v23;
        uint64_t v10 = v32;
        v17 += v33;
        char v29 = v34 & v21;
        v20 += v22;
        uint64_t v19 = 1;
        char v21 = 0;
      }
      while ((v29 & 1) != 0);
      uint64_t v16 = v36 + 1;
    }
    while (v36 + 1 != v32);
  }
}

- (void)convertUpdatesToTensorDataForLayer:(id)a3
{
  id v13 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v13;
    id v5 = [v4 deviceOps];
    id v6 = [v5 objectAtIndexedSubscript:0];

    unint64_t v7 = [v4 biases];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 objectAtIndexedSubscript:0];
      uint64_t v10 = [v9 optimizerData];
      uint64_t v11 = [v10 count];

      if (v11)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          [(MLCDeviceCPU *)self exportBiasGateOptimizerDataForDeviceOps:v6 biasTensors:v8 gateIndex:0 optimizerDataIndex:i];
          [(MLCDeviceCPU *)self exportBiasGateOptimizerDataForDeviceOps:v6 biasTensors:v8 gateIndex:1 optimizerDataIndex:i];
          [(MLCDeviceCPU *)self exportBiasGateOptimizerDataForDeviceOps:v6 biasTensors:v8 gateIndex:2 optimizerDataIndex:i];
          [(MLCDeviceCPU *)self exportBiasGateOptimizerDataForDeviceOps:v6 biasTensors:v8 gateIndex:3 optimizerDataIndex:i];
        }
      }
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)setOptimizerLearningRate:(id)a3 learningRate:(float)a4
{
  id v5 = [a3 objectAtIndexedSubscript:0];
  id v6 = [v5 optimizerAlgFields];

  id v7 = v6;
  *(float *)[v7 bytes] = a4;
}

- (void)setOptimizerTimeStep:(id)a3 timeStep:(unint64_t)a4
{
  id v5 = [a3 objectAtIndexedSubscript:0];
  id v6 = [v5 optimizerAlgFields];

  id v7 = v6;
  *(float *)([v7 bytes] + 12) = (float)a4;
}

- (void)reloadParameterDataFromHostToDeviceMemoryForTensor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 childLayers];
  id v5 = [v4 objectAtIndexedSubscript:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    unint64_t v7 = [v6 biases];

    if (v7
      && ([v6 biases],
          id v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 count],
          v8,
          unint64_t v7 = 0,
          v9))
    {
      while (1)
      {
        uint64_t v10 = [v6 biases];
        id v11 = [v10 objectAtIndexedSubscript:v7];

        BOOL v12 = v11 == v3;
        if (v11 == v3) {
          break;
        }
        ++v7;
        id v13 = [v6 biases];
        unint64_t v14 = [v13 count];

        if (v7 >= v14)
        {
          unint64_t v7 = 0;
          break;
        }
      }
    }
    else
    {
      BOOL v12 = 0;
    }
    id v15 = v6;
    id v39 = v3;
    uint64_t v16 = [v15 deviceOps];
    uint64_t v17 = [v16 objectAtIndexedSubscript:0];

    id v18 = [v17 params];
    uint64_t v19 = [v18 bytes];
    [v17 inputSize];
    uint64_t v20 = [v17 hiddenSize];
    char v37 = [v17 biDirectional];
    unint64_t v21 = [v17 numLayers];
    unint64_t v22 = 0;
    unint64_t v38 = 4 * v21;
    if (v21 >= 2)
    {
      if ([v17 biDirectional])
      {
        if ([v17 biDirectional])
        {
          unint64_t v22 = (v7 - v38) >> 2;
          if (!v12) {
            goto LABEL_31;
          }
        }
        else
        {
          unint64_t v22 = 0;
          if (!v12) {
            goto LABEL_31;
          }
        }
        goto LABEL_15;
      }
      unint64_t v22 = v7 >> 2;
    }
    if (!v12)
    {
LABEL_31:

      goto LABEL_32;
    }
LABEL_15:
    id v23 = [v15 biases];

    if (v23)
    {
      unint64_t v24 = v7 & 3;
      uint64_t v25 = (void *)(v19 + 3048);
      uint64_t v26 = v19 + 4904;
      if ((v7 & 3) == 0) {
        uint64_t v26 = v19 + 2120;
      }
      if (v24 != 1) {
        uint64_t v25 = (void *)v26;
      }
      if (v24 == 2) {
        unint64_t v27 = (void *)(v19 + 3976);
      }
      else {
        unint64_t v27 = v25;
      }
      unint64_t v28 = objc_msgSend(v39, "data", *v27);
      uint64_t v29 = [v28 length];

      if (v29 != 4 * v20)
      {
        id v30 = +[MLCLog framework];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          [(MLCDeviceCPU(MLComputeEngineOptimizerUpdate) *)v39 reloadParameterDataFromHostToDeviceMemoryForTensor:v30];
        }
      }
      if (v7 >= v38) {
        uint64_t v31 = v20;
      }
      else {
        uint64_t v31 = 0;
      }
      uint64_t v32 = (void *)(v36 + 4 * (v31 + (v22 << v37) * v20));
      id v33 = [v39 data];
      char v34 = (const void *)[v33 bytes];
      uint64_t v35 = [v39 data];
      memcpy(v32, v34, [v35 length]);
    }
    goto LABEL_31;
  }
LABEL_32:
}

- (void)accumulateParams:(void *)a3 gradients:(void *)a4 accumulators:(void *)a5 numOfParameters:(unint64_t)a6 inArrayOfParams:(id)a7
{
  id v23 = a7;
  id v10 = [v23 objectAtIndexedSubscript:0];
  uint64_t v11 = [v10 bytes];

  id v12 = [v23 objectAtIndexedSubscript:1];
  uint64_t v13 = [v12 bytes];

  id v14 = [v23 objectAtIndexedSubscript:2];
  uint64_t v15 = [v14 bytes];

  id v16 = [v23 objectAtIndexedSubscript:3];
  uint64_t v17 = *(void *)[v16 bytes];

  id v18 = [v23 objectAtIndexedSubscript:4];
  uint64_t v19 = (void *)[v18 bytes];

  id v20 = [v23 objectAtIndexedSubscript:5];
  uint64_t v21 = *(void *)[v20 bytes];

  memcpy((void *)(v11 + 8 * *v19), a3, 8 * a6);
  memcpy((void *)(v13 + 8 * *v19), a4, 8 * a6);
  for (; v21; --v21)
  {
    memcpy((void *)(v15 + 8 * *v19), a5, 8 * a6);
    v15 += 8 * v17;
    a5 += a6;
  }
  *v19 += a6;
}

- (void)restoreRNNParamsWithDeviceOps:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8
{
  id v36 = a4;
  id v11 = a7;
  id v12 = [a3 objectAtIndexedSubscript:0];
  id v13 = [v12 params];
  [v13 bytes];
  id v14 = [v12 lstmDeltaParams];
  [v14 bytes];

  if ([v12 hasBias])
  {
    uint64_t v15 = [v36 objectAtIndexedSubscript:0];
    uint64_t v16 = [v15 accumulatorBufferCount];

    if (v11)
    {
      if ([v11 count])
      {
        if ([v11 count])
        {
          unint64_t v17 = 0;
          char v18 = 0;
          do
          {
            uint64_t v19 = [v11 objectAtIndexedSubscript:v17];
            char v20 = [v19 isUpdatable];

            v18 |= v20;
            ++v17;
          }
          while (v17 < [v11 count]);
          if (v18)
          {
            if (v16)
            {
              uint64_t v21 = 3;
              do
              {
                unint64_t v22 = [v12 biasMomentumData];
                id v23 = [v22 objectAtIndexedSubscript:v21 - 3];
                [v23 bytes];

                unint64_t v24 = [v12 biasMomentumData];
                id v25 = [v24 objectAtIndexedSubscript:v21 - 2];
                [v25 bytes];

                uint64_t v26 = [v12 biasMomentumData];
                id v27 = [v26 objectAtIndexedSubscript:v21 - 1];
                [v27 bytes];

                unint64_t v28 = [v12 biasMomentumData];
                id v29 = [v28 objectAtIndexedSubscript:v21];
                [v29 bytes];

                v21 += 4;
                --v16;
              }
              while (v16);
            }
            if ([v11 count])
            {
              unint64_t v30 = 0;
              uint64_t v31 = 0;
              do
              {
                uint64_t v32 = [v11 objectAtIndexedSubscript:v30];
                char v33 = [v32 isUpdatable];

                if ((v33 & 1) == 0)
                {
                  char v34 = [v12 auxBiasTerms];
                  uint64_t v35 = [v12 auxBiasTermsAccumulators];
                  [(MLCDeviceCPU *)self saveOrRestoreLSTMBiasesAndAccumulators:v12 auxParameter:v34 auxAccumulators:v35 mlcIndex:v30 auxIndex:v31 saveParameter:0];

                  ++v31;
                }
                ++v30;
              }
              while (v30 < [v11 count]);
            }
          }
        }
      }
    }
  }
}

- (void)deviceMemorySizeForTensor:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v2 = NSStringFromSelector(v1);
  id v3 = [v0 descriptor];
  [v3 dataType];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v4, v5, "%@: Illegal tensor data type:%d", v6, v7, v8, v9, v10);
}

- (void)readFromDevice:(os_log_t)log deviceIndex:allocateData:batchSize:.cold.1(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_fault_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_FAULT, "NULL tensor.tensorData.bytes", v1, 2u);
}

- (void)transferTensor:fromDevice:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  SEL v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to read ANE device memory in tensor=%@", v4, v5, v6, v7, v8);
}

- (void)updateDeviceMemoryForTensor:(const char *)a1 .cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: unsupported number of device memory", v4, v5, v6, v7, 2u);
}

- (void)updateDeviceMemoryForTensor:(const char *)a1 .cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: cannot find NSData in device memory", v4, v5, v6, v7, 2u);
}

@end