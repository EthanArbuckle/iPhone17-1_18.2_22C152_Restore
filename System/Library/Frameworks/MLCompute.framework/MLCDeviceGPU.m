@interface MLCDeviceGPU
+ (BOOL)multiGPUNotSupportedInFilteredGPUList:(id)a3;
+ (id)filteredGPUListIncludingLowPoweredBuiltin:(BOOL)a3;
+ (unint64_t)calculateImageSizeForTensor:(id)a3;
- (BOOL)canFuseConvolutionLayerForInference:(id)a3;
- (BOOL)canFuseFullyConnectedLayerForInference:(id)a3;
- (BOOL)checkToConvertTensor:(id)a3 inLayer:(id)a4;
- (BOOL)compileLayerDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)compileLayerDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5;
- (BOOL)createPipelineStatesForMissingActivationFunctions;
- (BOOL)isAppleSoCGPU;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResultTensorUsedForGradientComputationByLayer:(id)a3;
- (BOOL)needToAllocateDeviceMemoryForTensor:(id)a3;
- (BOOL)needToAllocateDeviceMemoryForTensor:(id)a3 batchSize:(unint64_t)a4;
- (BOOL)setConvolutionLayerOptimizerDataForDeviceOps:(id)a3 weights:(id)a4 bias:(id)a5;
- (BOOL)setLSTMLayerOptimizerDataForDeviceOps:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 biasTerms:(id)a6;
- (BOOL)setMHALayerOptimizerDataForDeviceOps:(id)a3 optimizerDataForWeights:(id)a4 optimizerDataForBias:(id)a5;
- (BOOL)setNormalizationLayerOptimizerDataForDeviceOps:(id)a3 beta:(id)a4 gamma:(id)a5;
- (BOOL)shareDeviceMemoryWithResultTensor:(id)a3 sourceTensor:(id)a4;
- (BOOL)synchronizeTensor:(id)a3;
- (BOOL)synchronizeTensorOnHost:(id)a3;
- (BOOL)transferTensor:(id)a3 fromDevice:(id)a4;
- (BOOL)updateDeviceMemoryForTensor:(id)a3;
- (MLCDeviceGPU)initWithDeviceList:(id)a3;
- (MLCDeviceGPU)initWithType:(int)a3 gpuDeviceList:(id)a4 gpuLocalEventList:(id)a5 gpuSharedEventList:(id)a6 currentEventValue:(unint64_t *)a7 gpuCommandQueueList:(id)a8 gpuCommandBufferList:(id)a9 gpuMPSCommandBufferList:(id)a10;
- (MLCDeviceGPU)initWithType:(int)a3 selectsMultipleComputeDevices:(BOOL)a4;
- (NSArray)deviceList;
- (NSArray)gpuLocalEventList;
- (NSArray)gpuSharedEventList;
- (NSMutableArray)gpuCommandBufferList;
- (NSMutableArray)gpuCommandQueueList;
- (NSMutableArray)gpuConcurrentEncoderFence;
- (NSMutableArray)gpuHeapTemporaryResourceAllocator;
- (NSMutableArray)gpuLibrary;
- (NSMutableArray)gpuMPSCommandBufferList;
- (NSMutableArray)gpuPipelineStatesArithmeticBinaryForward;
- (NSMutableArray)gpuPipelineStatesArithmeticBinaryGradient;
- (NSMutableArray)gpuPipelineStatesArithmeticReduceGradientAll;
- (NSMutableArray)gpuPipelineStatesArithmeticReduceGradientAny;
- (NSMutableArray)gpuPipelineStatesArithmeticUnaryForward;
- (NSMutableArray)gpuPipelineStatesArithmeticUnaryGradient;
- (NSMutableArray)gpuPipelineStatesCompareLogicalOpForward;
- (NSMutableArray)gpuPipelineStatesCompareRelationalOpForward;
- (NSMutableArray)gpuPipelineStatesConcatBool;
- (NSMutableArray)gpuPipelineStatesConcatFloat;
- (NSMutableArray)gpuPipelineStatesEmbeddingForward;
- (NSMutableArray)gpuPipelineStatesEmbeddingGradient;
- (NSMutableArray)gpuPipelineStatesEmbeddingRenormalizeWeights;
- (NSMutableArray)gpuPipelineStatesForwardConcat2D;
- (NSMutableArray)gpuPipelineStatesForwardConcat2DArray;
- (NSMutableArray)gpuPipelineStatesMemCopy;
- (NSMutableArray)gpuPipelineStatesMemFillFloat;
- (NSMutableArray)gpuPipelineStatesPad2D;
- (NSMutableArray)gpuPipelineStatesPad2DArray;
- (NSMutableArray)gpuPipelineStatesReduceAcrossBatch;
- (NSMutableArray)gpuPipelineStatesReduceAcrossChannel;
- (NSMutableArray)gpuReadTensorKernelList;
- (NSMutableArray)gpuWriteTensorKernelList;
- (NSString)description;
- (double)executionTimeInterval;
- (id)allocateDeviceMemoryForTensor:(id)a3 device:(id)a4 count:(unint64_t)a5;
- (id)arithmeticLayerWithOperation:(int)a3 activationDescriptor:(id)a4;
- (id)batchNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9;
- (id)betaGradients:(id)a3;
- (id)biasesGradients:(id)a3;
- (id)compareLayerWithOperation:(int)a3;
- (id)convolutionLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createOptimizerDeviceDataForTensor:(id)a3 optimizer:(id)a4 optimizerData:(id)a5 isVector:(BOOL)a6;
- (id)dropoutLayerWithRate:(float)a3 seed:(unint64_t)a4;
- (id)embeddingLayerWithDescriptor:(id)a3 weights:(id)a4 inferenceOnly:(BOOL)a5;
- (id)embeddingWeightsGradients:(id)a3 embeddingCount:(unint64_t)a4 embeddingDimension:(unint64_t)a5;
- (id)fullyConnectedLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5;
- (id)fusedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10;
- (id)fusedConvolutionAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6;
- (id)fusedFullyConnectedAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6;
- (id)fusedInstanceNormalizationAndNeuronLayerWithDescriptor:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10;
- (id)gammaGradients:(id)a3;
- (id)gatherLayerWithDimension:(unint64_t)a3;
- (id)getGradientBufferForNormalizationState:(id)a3 layer:(id)a4 isBetaTensor:(BOOL)a5;
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
- (os_unfair_lock_s)l;
- (unint64_t)allocatedDeviceDataSizeForTraining:(BOOL)a3 layer:(id)a4;
- (unint64_t)currentEventValue;
- (unint64_t)deviceMemorySizeForTensor:(id)a3;
- (unint64_t)numDevicesToUse;
- (unint64_t)numDevicesUsedWithFirstBatch;
- (void)allReduceOverXGMI:(id)a3 deviceIndex:(unint64_t)a4 stateBuffers:(id)a5;
- (void)allocateCommandBufferForDeviceAtIndex:(unint64_t)a3;
- (void)allocateDeviceDataForGlobalNormClippingWithOptimizer:(id)a3 updatableParameterCount:(unint64_t)a4;
- (void)allocateDeviceHeapForGraph:(id)a3 forInference:(BOOL)a4;
- (void)allocateDeviceMemoryForTensor:(id)a3;
- (void)allocateDeviceMemoryForTensor:(id)a3 batchSize:(unint64_t)a4;
- (void)allocateResultTensor:(id)a3;
- (void)broadcastTensor:(id)a3;
- (void)broadcastTensor:(id)a3 batchSize:(unint64_t)a4;
- (void)commitAndWaitForCompletion:(id)a3;
- (void)commitAndWaitForCompletion:(id)a3 enableProfiling:(BOOL)a4 graphExecutionTime:(id)a5 graphResultTensor:(id)a6;
- (void)commitDeviceAtIndex:(unint64_t)a3;
- (void)commitWithCompletionHandler:(id)a3 enableProfiling:(BOOL)a4 graphExecutionTime:(id)a5 graphResultTensor:(id)a6;
- (void)commitWithProfiling:(BOOL)a3 graphExecutionTime:(id)a4;
- (void)convertUpdatesToTensorDataForLayer:(id)a3;
- (void)convertUpdatesToTensorDataForTensorParameters:(id)a3;
- (void)copyMTLBuffer:(id)a3 toBytes:(void *)a4 length:(unint64_t)a5;
- (void)copyMTLBuffer:(id)a3 toNSData:(id)a4;
- (void)dealloc;
- (void)deallocateDeviceMemoryForTensor:(id)a3;
- (void)dispatchBroadcastTensor:(id)a3;
- (void)dispatchBroadcastTensor:(id)a3 batchSize:(unint64_t)a4;
- (void)dispatchFillTensor:(id)a3 deviceIndex:(unint64_t)a4;
- (void)dispatchForwardActivationsKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchForwardAndGradientLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultGradientTensor:(id)a9;
- (void)dispatchForwardArithmeticBinaryKernel:(id)a3 sourceTensor:(id)a4 sourceSecondaryTensor:(id)a5 resultTensor:(id)a6 deviceIndex:(unint64_t)a7;
- (void)dispatchForwardArithmeticTertiaryKernel:(id)a3 sourceTensor:(id)a4 sourceSecondaryTensor:(id)a5 sourceTertiaryTensor:(id)a6 resultTensor:(id)a7 deviceIndex:(unint64_t)a8;
- (void)dispatchForwardArithmeticUnaryKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchForwardBatchNormalizationKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardCompareLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 resultTensor:(id)a6 compareOp:(int)a7 forTraining:(BOOL)a8;
- (void)dispatchForwardConcatLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (void)dispatchForwardEmbeddingLayer:(id)a3 weight:(id)a4 sourceTensor:(id)a5 resultTensor:(id)a6;
- (void)dispatchForwardFullyConnectedLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6;
- (void)dispatchForwardFusedArithmeticLayerNormalizationLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6;
- (void)dispatchForwardGatherLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6;
- (void)dispatchForwardGramMatrixKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardGroupNormalizationKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardInstanceNormalizationKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 tertiaryTensor:(id)a6 resultTensor:(id)a7 resultStateIsTemporary:(BOOL)a8 forTraining:(BOOL)a9;
- (void)dispatchForwardLayerNormalizationKernel:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultStateIsTemporary:(BOOL)a9 forTraining:(BOOL)a10;
- (void)dispatchForwardMHALayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardMPSGraphWithDeviceOps:(id)a3 sourceBuffer:(id)a4 resultBuffer:(id)a5 deviceIndex:(unint64_t)a6 dataType:(unsigned int)a7;
- (void)dispatchForwardMatMulLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (void)dispatchForwardPaddingKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchForwardPoolingKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardReduceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7 forTraining:(BOOL)a8;
- (void)dispatchForwardReshapeLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardResizeKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchForwardScatterLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6;
- (void)dispatchForwardSelectLayer:(id)a3 conditionTensor:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6 forTraining:(BOOL)a7;
- (void)dispatchForwardSliceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6;
- (void)dispatchForwardSoftmaxKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchForwardSplitLayer:(id)a3 sourceTensor:(id)a4 resultTensors:(id)a5;
- (void)dispatchForwardSplitLayer:(id)a3 sourceTensor:(id)a4 resultTensors:(id)a5 forConcat:(BOOL)a6;
- (void)dispatchGradientActivationsKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchGradientArithmeticBinaryKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 secondaryResultGradientTensor:(id)a6 deviceIndex:(unint64_t)a7;
- (void)dispatchGradientArithmeticUnaryKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchGradientBatchNormalizationKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchGradientConcatLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5;
- (void)dispatchGradientEmbeddingLayer:(id)a3 sourceGradientTensor:(id)a4;
- (void)dispatchGradientFullyConnectedLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 resultStateIsTemporary:(BOOL)a6;
- (void)dispatchGradientGramMatrixKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchGradientGroupNormalizationKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchGradientInstanceNormalizationKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5;
- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 secondaryResultGradientTensor:(id)a6;
- (void)dispatchGradientLayerNormalizationKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchGradientLossLayer:(id)a3 sourceGradientTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultGradientTensor:(id)a8;
- (void)dispatchGradientMHALayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5 resultStateIsTemporary:(BOOL)a6;
- (void)dispatchGradientMPSGraphWithDeviceOps:(id)a3 sourceBuffer:(id)a4 souceGradientBuffer:(id)a5 resultGradientBuffer:(id)a6 deviceIndex:(unint64_t)a7 dataType:(unsigned int)a8;
- (void)dispatchGradientMatMulLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5;
- (void)dispatchGradientPaddingKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchGradientPoolingKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchGradientReduceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7;
- (void)dispatchGradientReshapeLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5;
- (void)dispatchGradientResizeKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchGradientSelectLayer:(id)a3 conditionTensor:(id)a4 sourceGradientTensor:(id)a5 resultGradientTensors:(id)a6;
- (void)dispatchGradientSliceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5;
- (void)dispatchGradientSoftmaxKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchGradientSplitLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensor:(id)a5;
- (void)dispatchGradientSplitLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensor:(id)a5 forConcat:(BOOL)a6;
- (void)dispatchPadChannelsKernel:(id)a3 sourceImageBatch:(id)a4 resultImageBatch:(id)a5 deviceIndex:(unint64_t)a6;
- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5;
- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7;
- (void)dispatchRNNGradientLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensors:(id)a5;
- (void)dispatchReadTensor:(id)a3 targetBuffer:(void *)a4 batchSize:(unint64_t)a5;
- (void)dispatchReadTensorFromAllDevices:(id)a3 targetBuffer:(void *)a4 batchSize:(unint64_t)a5;
- (void)dispatchTransposeKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forward:(BOOL)a7;
- (void)encodePrimitiveToCommandBuffer:(id)a3 gpuDeviceOps:(id)a4 sourceTensor:(id)a5 secondaryTensor:(id)a6 tertiaryTensor:(id)a7 resultTensor:(id)a8 params:(CompareParams *)a9 sizeOfParams:(unint64_t)a10 pipelineState:(id)a11 deviceIndex:(unint64_t)a12;
- (void)fuseLayersForGraph:(id)a3 stopGradientTensorList:(id)a4 startAtLayerIndex:(unint64_t)a5 forInference:(BOOL)a6;
- (void)fuseLayersForInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4;
- (void)fuseLayersForTrainingGraph:(id)a3 stopGradientTensorList:(id)a4;
- (void)incrementReadCountForGradientState:(id)a3 increment:(int64_t)a4;
- (void)incrementReadCountForTensorDeviceMemory:(id)a3 increment:(int64_t)a4;
- (void)multiDeviceTensorReduction:(id)a3 sourceBuffer:(void *)a4 targetBuffer:(void *)a5;
- (void)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 targetBuffer:(void *)a5 batchSize:(unint64_t)a6;
- (void)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 targetBuffer:(void *)a5 batchSize:(unint64_t)a6 reduceOverBatch:(BOOL)a7;
- (void)readTensor:(id)a3 targetBuffer:(void *)a4;
- (void)reduceAcrossBatchForSource:(id)a3 result:(id)a4 batchSize:(unint64_t)a5 batchStride:(unint64_t)a6 numEntries:(unint64_t)a7 deviceIndex:(unint64_t)a8 commandBuffer:(id)a9;
- (void)reloadLSTMParameters:(id)a3 rnnGPUDeviceOps:(id)a4 mlcParameterIndex:(unint64_t)a5 tensor:(id)a6 isInputWeight:(BOOL)a7 isHiddenWeight:(BOOL)a8 isBias:(BOOL)a9 deviceNumber:(unint64_t)a10;
- (void)reloadParameterDataFromHostToDeviceMemoryForTensor:(id)a3;
- (void)restoreConvolutionParamsWithDeviceOps:(id)a3;
- (void)restoreRNNParamsWithDeviceOps:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8;
- (void)rotateAndCopyMTLBuffer:(id)a3 toNSData:(id)a4 withTensorDescriptor:(id)a5;
- (void)saveOrRestoreTempMatrixDisableUpdates:(id)a3 commandBuffer:(id)a4 auxiliaryWeightsMemory:(id)a5 auxiliaryMomentumMemory:(id)a6 auxiliaryVelocityMemory:(id)a7 auxiliaryCenterWeightMemory:(id)a8 deviceNumber:(unint64_t)a9 kernelNumber:(unint64_t)a10 mlcIndex:(unint64_t)a11 auxIndex:(unint64_t)a12 numOptimizerData:(unint64_t)a13 saveToAux:(BOOL)a14 isInputWeight:(BOOL)a15 isHiddenWeight:(BOOL)a16 isBias:(BOOL)a17;
- (void)selectDevicesWithBatchSize:(unint64_t)a3;
- (void)selectDevicesWithBatchSize:(unint64_t)a3 calledfromBindAndWrite:(BOOL)a4;
- (void)setConvolutionGradientComputeWeightsAndBiasOnly:(id)a3;
- (void)setDeviceMemoryForTensor:(id)a3 data:(id)a4;
- (void)setFullyConnectedGradientComputeWeightsAndBiasOnly:(id)a3;
- (void)setGpuConcurrentEncoderFence:(id)a3;
- (void)setGpuHeapTemporaryResourceAllocator:(id)a3;
- (void)setGpuLocalEventList:(id)a3;
- (void)setGpuPipelineStatesArithmeticBinaryForward:(id)a3;
- (void)setGpuPipelineStatesArithmeticBinaryGradient:(id)a3;
- (void)setGpuPipelineStatesArithmeticReduceGradientAll:(id)a3;
- (void)setGpuPipelineStatesArithmeticReduceGradientAny:(id)a3;
- (void)setGpuPipelineStatesArithmeticUnaryForward:(id)a3;
- (void)setGpuPipelineStatesArithmeticUnaryGradient:(id)a3;
- (void)setGpuPipelineStatesCompareLogicalOpForward:(id)a3;
- (void)setGpuPipelineStatesCompareRelationalOpForward:(id)a3;
- (void)setGpuPipelineStatesConcatBool:(id)a3;
- (void)setGpuPipelineStatesConcatFloat:(id)a3;
- (void)setGpuPipelineStatesEmbeddingForward:(id)a3;
- (void)setGpuPipelineStatesEmbeddingGradient:(id)a3;
- (void)setGpuPipelineStatesEmbeddingRenormalizeWeights:(id)a3;
- (void)setGpuPipelineStatesForwardConcat2D:(id)a3;
- (void)setGpuPipelineStatesForwardConcat2DArray:(id)a3;
- (void)setGpuPipelineStatesMemCopy:(id)a3;
- (void)setGpuPipelineStatesMemFillFloat:(id)a3;
- (void)setGpuPipelineStatesPad2D:(id)a3;
- (void)setGpuPipelineStatesPad2DArray:(id)a3;
- (void)setGpuPipelineStatesReduceAcrossBatch:(id)a3;
- (void)setGpuPipelineStatesReduceAcrossChannel:(id)a3;
- (void)setGpuSharedEventList:(id)a3;
- (void)setL:(os_unfair_lock_s)a3;
- (void)setNumDevicesToUse:(unint64_t)a3;
- (void)setNumDevicesUsedWithFirstBatch:(unint64_t)a3;
- (void)setOptimizerLearningRate:(id)a3 learningRate:(float)a4;
- (void)setOptimizerTimeStep:(id)a3 timeStep:(unint64_t)a4;
- (void)signalAllDevicesExcludingDevice:(unint64_t)a3 eventValue:(unint64_t)a4;
- (void)signalNextEvent;
- (void)sumSharedGradientsForConvolutionLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4;
- (void)sumSharedGradientsForNormalizationLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4 isBetaTensor:(BOOL)a5;
- (void)synchronizeOptimizerBuffers:(id)a3 commandBuffer:(id)a4;
- (void)synchronizeOptimizerUpdatesForTensor:(id)a3;
- (void)synchronizeUpdatesForLayer:(id)a3;
- (void)synchronizeWeightMatrixForRNNLayer:(id)a3 matrixId:(unint64_t)a4 parameterType:(unint64_t)a5 accumulatorIndex:(unint64_t)a6 forLSTMNum:(unint64_t)a7 forDeviceNum:(unint64_t)a8 forGate:(unint64_t)a9;
- (void)unsafe_signalAllDevicesExcludingDevice:(unint64_t)a3 eventValue:(unint64_t)a4;
- (void)updateAllParametersWithOptimizer:(id)a3 arrayOfParameters:(id)a4;
- (void)updateBatchNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 meanTensor:(id)a7 varianceTensor:(id)a8 arrayOfParams:(id)a9;
- (void)updateConvolutionLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateEmbeddingLayer:(id)a3 weightsParameter:(id)a4 optimizer:(id)a5 arrayOfParams:(id)a6;
- (void)updateFullyConnectedLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateGraphExecutionTime:(id)a3 atIndex:(int)a4 gpuTime:(double)a5;
- (void)updateLayerNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateMultiheadAttentionLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7;
- (void)updateRNNLayer:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8;
- (void)updateTensorParameter:(id)a3 optimizer:(id)a4 gradient:(id)a5 arrayOfParams:(id)a6;
- (void)updateTensorsForFMAFusedLayers:(id)a3 layerNext:(id)a4;
- (void)updateTensorsForFusedArithmeticAndLayerNormalizationLayer:(id)a3 layerNext:(id)a4;
- (void)updateWithAdamOptimizer:(id)a3 encoder:(id)a4 deviceParameter:(id)a5 source:(id)a6 gradient:(id)a7 result:(id)a8 momentumIndex:(unint64_t)a9;
- (void)updateWithOptimizer:(id)a3 arrayOfParams:(id)a4 commandBuffer:(id)a5 deviceParameter:(id)a6 source:(id)a7 gradient:(id)a8 result:(id)a9 momentumIndex:(unint64_t)a10;
- (void)updateWithRMSPropOptimizer:(id)a3 encoder:(id)a4 deviceParameter:(id)a5 source:(id)a6 gradient:(id)a7 result:(id)a8 momentumIndex:(unint64_t)a9;
- (void)updateWithSGDOptimizer:(id)a3 encoder:(id)a4 deviceParameter:(id)a5 source:(id)a6 gradient:(id)a7 result:(id)a8 momentumIndex:(unint64_t)a9;
- (void)waitForAllDevicesExcludingDevice:(unint64_t)a3 eventValue:(unint64_t)a4;
- (void)waitForOthers;
@end

@implementation MLCDeviceGPU

- (id)arithmeticLayerWithOperation:(int)a3 activationDescriptor:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E01B11E0]();
  v8 = +[_MLCGPUArithmetic layerWithDevice:self operation:v4 activationDescriptor:v6];
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
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v20 = (void *)MEMORY[0x1E01B11E0]();
  *(float *)&double v21 = a8;
  *(float *)&double v22 = a9;
  v23 = +[_MLCGPUBatchNormalization layerWithDevice:self numOfFeatureChannels:a3 mean:v16 variance:v17 beta:v18 gamma:v19 varianceEpsilon:v21 momentum:v22];
  v24 = [v23 deviceOps];
  v25 = (void *)[v24 copy];

  [v23 setDeviceOps:0];
  v26 = (void *)MEMORY[0x1E4F1CBF0];
  if (v25) {
    v26 = v25;
  }
  id v27 = v26;

  return v27;
}

- (id)groupNormalizationLayerWithFeatureChannelCount:(unint64_t)a3 groupCount:(unint64_t)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7
{
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x1E01B11E0]();
  *(float *)&double v15 = a7;
  id v16 = +[_MLCGPUGroupNormalization layerWithDevice:self numOfFeatureChannels:a3 groupCount:a4 beta:v12 gamma:v13 varianceEpsilon:v15];
  id v17 = [v16 deviceOps];
  id v18 = (void *)[v17 copy];

  [v16 setDeviceOps:0];
  id v19 = (void *)MEMORY[0x1E4F1CBF0];
  if (v18) {
    id v19 = v18;
  }
  id v20 = v19;

  return v20;
}

- (id)layerNormalizationLayerWithNormalizedShape:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6 isFusedWithArithmeticLayer:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  double v15 = (void *)MEMORY[0x1E01B11E0]();
  *(float *)&double v16 = a6;
  id v17 = +[_MLCGPULayerNormalization layerWithDevice:self normalizedShape:v12 beta:v13 gamma:v14 varianceEpsilon:v7 isFusedWithArithmeticLayer:v16];
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

- (id)fusedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  v23 = (void *)MEMORY[0x1E01B11E0]();
  *(float *)&double v24 = a9;
  *(float *)&double v25 = a10;
  v26 = +[_MLCGPUBatchNormalization layerWithDevice:self fusedWithNeuronDescriptor:v18 numOfFeatureChannels:a4 mean:v19 variance:v20 beta:v21 gamma:v24 varianceEpsilon:v25 momentum:v22];
  id v27 = [v26 deviceOps];
  v28 = (void *)[v27 copy];

  [v26 setDeviceOps:0];
  v29 = (void *)MEMORY[0x1E4F1CBF0];
  if (v28) {
    v29 = v28;
  }
  id v30 = v29;

  return v30;
}

- (id)instanceNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = (void *)MEMORY[0x1E01B11E0]();
  *(float *)&double v21 = a8;
  *(float *)&double v22 = a9;
  v23 = +[_MLCGPUInstanceNormalization layerWithDevice:self numOfFeatureChannels:a3 mean:v16 variance:v17 beta:v18 gamma:v19 varianceEpsilon:v21 momentum:v22];
  double v24 = [v23 deviceOps];
  double v25 = (void *)[v24 copy];

  [v23 setDeviceOps:0];
  v26 = (void *)MEMORY[0x1E4F1CBF0];
  if (v25) {
    v26 = v25;
  }
  id v27 = v26;

  return v27;
}

- (id)fusedInstanceNormalizationAndNeuronLayerWithDescriptor:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  v23 = (void *)MEMORY[0x1E01B11E0]();
  *(float *)&double v24 = a9;
  *(float *)&double v25 = a10;
  v26 = +[_MLCGPUInstanceNormalization layerWithDevice:self fusedWithNeuronDescriptor:v18 numOfFeatureChannels:a4 mean:v19 variance:v20 beta:v21 gamma:v24 varianceEpsilon:v25 momentum:v22];
  id v27 = [v26 deviceOps];
  v28 = (void *)[v27 copy];

  [v26 setDeviceOps:0];
  v29 = (void *)MEMORY[0x1E4F1CBF0];
  if (v28) {
    v29 = v28;
  }
  id v30 = v29;

  return v30;
}

- (id)convolutionLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E01B11E0]();
  id v12 = +[_MLCGPUConvolution layerWithDevice:self weights:v9 biasTerms:v10 descriptor:v8 neuronDescriptor:0];
  id v13 = [v12 deviceOps];
  id v14 = (void *)[v13 copy];

  [v12 setDeviceOps:0];
  double v15 = (void *)MEMORY[0x1E4F1CBF0];
  if (v14) {
    double v15 = v14;
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
  double v15 = +[_MLCGPUConvolution layerWithDevice:self weights:v12 biasTerms:v13 descriptor:v11 neuronDescriptor:v10];
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

- (id)dropoutLayerWithRate:(float)a3 seed:(unint64_t)a4
{
  BOOL v7 = (void *)MEMORY[0x1E01B11E0](self, a2);
  *(float *)&double v8 = a3;
  id v9 = +[_MLCGPUDropout layerWithDevice:self rate:a4 seed:v8];
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
  id v12 = +[_MLCGPUFullyConnected layerWithDevice:self weights:v9 biasTerms:v10 descriptor:v8 neuronDescriptor:0];
  id v13 = [v12 deviceOps];
  id v14 = (void *)[v13 copy];

  [v12 setDeviceOps:0];
  double v15 = (void *)MEMORY[0x1E4F1CBF0];
  if (v14) {
    double v15 = v14;
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
  double v15 = +[_MLCGPUFullyConnected layerWithDevice:self weights:v12 biasTerms:v13 descriptor:v11 neuronDescriptor:v10];
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

- (id)paddingLayerWithPaddingType:(int)a3 paddingLeft:(unint64_t)a4 paddingRight:(unint64_t)a5 paddingTop:(unint64_t)a6 paddingBottom:(unint64_t)a7 constantValue:(float)a8 dataType:(int)a9
{
  uint64_t v15 = *(void *)&a3;
  id v17 = (void *)MEMORY[0x1E01B11E0](self, a2);
  LODWORD(v25) = a9;
  *(float *)&double v18 = a8;
  id v19 = +[_MLCGPUPadding layerWithDevice:self paddingType:v15 paddingLeft:a4 paddingRight:a5 paddingTop:a6 paddingBottom:a7 constantValue:v18 dataType:v25];
  id v20 = [v19 deviceOps];
  id v21 = (void *)[v20 copy];

  [v19 setDeviceOps:0];
  id v22 = (void *)MEMORY[0x1E4F1CBF0];
  if (v21) {
    id v22 = v21;
  }
  id v23 = v22;

  return v23;
}

- (id)lossLayerWithDescriptor:(id)a3
{
  return GPU_CreateLossLayer(self, a3);
}

- (id)lossYOLOLayerWithDescriptor:(id)a3
{
  return GPU_CreateYOLOLossLayer(self, a3);
}

- (id)neuronLayerWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E01B11E0]();
  id v6 = +[_MLCGPUNeuron layerWithDevice:self descriptor:v4];
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
  id v23 = +[_MLCGPULSTM layerWithDevice:self descriptor:v30 inputWeights:v16 hiddenWeights:v17 peepholeWeights:v18 biasTerms:v19 gateActivations:v20 outputResultActivation:v21 inferenceOnly:v29];
  double v24 = [v23 deviceOps];
  uint64_t v25 = (void *)[v24 copy];

  [v23 setDeviceOps:0];
  v26 = (void *)MEMORY[0x1E4F1CBF0];
  if (v25) {
    v26 = v25;
  }
  id v27 = v26;

  return v27;
}

- (id)poolingLayerWithDescriptor:(id)a3 paddingSizes:(unint64_t *)a4
{
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x1E01B11E0]();
  id v8 = +[_MLCGPUPooling layerWithDevice:self descriptor:v6 paddingSizes:a4];
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

- (id)reshapeLayerWithShape:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E01B11E0]();
  id v6 = +[_MLCGPUReshape layerWithDevice:self];
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

- (id)splitLayerWithDimension:(unint64_t)a3
{
  v5 = (void *)MEMORY[0x1E01B11E0](self, a2);
  id v6 = +[_MLCGPUSplit layerWithDevice:self dimension:a3];
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

- (id)softmaxLayerWithOperation:(int)a3 dimension:(unint64_t)a4 sourceShapeCount:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = (void *)MEMORY[0x1E01B11E0](self, a2, *(void *)&a3, a4, a5);
  id v9 = +[_MLCGPUSoftmax layerWithDevice:self operation:v6 dimension:a4];
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

- (id)gramMatrixLayerWithScaleFactor:(float)a3
{
  v5 = (void *)MEMORY[0x1E01B11E0](self, a2);
  *(float *)&double v6 = a3;
  BOOL v7 = +[_MLCGPUGramMatrix layerWithDevice:self scale:v6];
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
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v11 = (void *)MEMORY[0x1E01B11E0](self, a2);
  *(float *)&double v12 = a3;
  *(float *)&double v13 = a4;
  id v14 = +[_MLCGPUUpsample layerWithDevice:self scaleFactorX:v7 scaleFactorY:v6 sampleMode:v12 alignCorners:v13];
  uint64_t v15 = [v14 deviceOps];
  id v16 = (void *)[v15 copy];

  [v14 setDeviceOps:0];
  id v17 = (void *)MEMORY[0x1E4F1CBF0];
  if (v16) {
    id v17 = v16;
  }
  id v18 = v17;

  return v18;
}

- (id)transposeLayerWithShape:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E01B11E0]();
  BOOL v6 = +[_MLCGPUTranspose layerWithDevice:self shape:v4];
  uint64_t v7 = [v6 deviceOps];
  id v8 = (void *)[v7 copy];

  [v6 setDeviceOps:0];
  id v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    id v9 = v8;
  }
  id v10 = v9;

  return v10;
}

- (id)embeddingLayerWithDescriptor:(id)a3 weights:(id)a4 inferenceOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1E01B11E0]();
  id v11 = +[_MLCGPUEmbedding layerWithDevice:self descriptor:v8 weights:v9 inferenceOnly:v5];
  double v12 = [v11 deviceOps];
  double v13 = (void *)[v12 copy];

  [v11 setDeviceOps:0];
  id v14 = (void *)MEMORY[0x1E4F1CBF0];
  if (v13) {
    id v14 = v13;
  }
  id v15 = v14;

  return v15;
}

- (id)selectLayer
{
  v3 = (void *)MEMORY[0x1E01B11E0](self, a2);
  id v4 = +[_MLCGPUSelect layerWithDevice:self];
  BOOL v5 = [v4 deviceOps];
  BOOL v6 = (void *)[v5 copy];

  [v4 setDeviceOps:0];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    uint64_t v7 = v6;
  }
  id v8 = v7;

  return v8;
}

- (id)optimizerSGDWithDescriptor:(id)a3 momentunScale:(float)a4 useNesterovMomentum:(BOOL)a5
{
  return GPU_CreateSGDOptimizer(self, a5, a3, a4);
}

- (id)optimizerAdamWithDescriptor:(id)a3 beta1:(float)a4 beta2:(float)a5 epsilon:(float)a6 amsgrad:(BOOL)a7 timeStep:(unint64_t)a8 isAdamW:(BOOL)a9
{
  return GPU_CreateAdamOptimizer(self, a7, a4, a5, a6, a8, a9, a3);
}

- (id)optimizerRMSPropWithDescriptor:(id)a3 momentumScale:(float)a4 alpha:(float)a5 epsilon:(float)a6 centered:(BOOL)a7
{
  return GPU_CreateRMSPropOptimizer(self, a7, a3, a4, a5, a6);
}

- (void)updateTensorsForFMAFusedLayers:(id)a3 layerNext:(id)a4
{
  id v26 = a3;
  id v5 = a4;
  BOOL v6 = [v5 resultTensors];
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];

  id v8 = [v5 sourceTensors];
  id v9 = [v8 objectAtIndexedSubscript:0];
  id v10 = [v26 resultTensors];
  id v11 = [v10 objectAtIndexedSubscript:0];

  double v12 = [v5 sourceTensors];
  double v13 = [v12 objectAtIndexedSubscript:v9 == v11];
  id v14 = [v26 sourceTensors];
  [v14 setObject:v13 atIndexedSubscript:2];

  id v15 = [v26 sourceGradientTensors];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    id v17 = [v5 sourceGradientTensors];
    id v18 = [v17 objectAtIndexedSubscript:0];
    id v19 = [v26 sourceGradientTensors];
    [v19 setObject:v18 atIndexedSubscript:0];
  }
  id v20 = [v26 resultTensors];
  [v20 setObject:v7 atIndexedSubscript:0];

  id v21 = [v7 parentLayers];
  [v21 setObject:v26 atIndexedSubscript:0];

  id v22 = [v26 fusedLayers];
  [v22 addObject:v5];

  [v5 setSkipLayer:1];
  [v5 setIsLastFusedLayer:1];
  id v23 = [v26 deviceOps];
  uint64_t v24 = [v23 count];

  if (v24)
  {
    uint64_t v25 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v26 setDeviceOps:v25];
  }
}

- (void)updateTensorsForFusedArithmeticAndLayerNormalizationLayer:(id)a3 layerNext:(id)a4
{
  id v21 = a3;
  id v5 = a4;
  BOOL v6 = [v21 sourceTensors];
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];

  id v8 = [v5 sourceTensors];
  [v8 setObject:v7 atIndexedSubscript:0];

  id v9 = [v7 childLayers];
  [v9 setObject:v5 atIndexedSubscript:0];

  id v10 = [v21 sourceTensors];
  id v11 = [v10 objectAtIndexedSubscript:1];

  double v12 = [v5 sourceTensors];
  [v12 setObject:v11 atIndexedSubscript:1];

  double v13 = [v21 sourceTensors];
  id v14 = [v13 objectAtIndexedSubscript:0];
  BOOL v15 = v11 == v14;

  uint64_t v16 = [v11 childLayers];
  [v16 setObject:v5 atIndexedSubscript:v15];

  [v21 setSkipLayer:1];
  [v21 setIsLastFusedLayer:0];
  id v17 = [v5 fusedLayers];
  [v17 addObject:v21];

  id v18 = [v5 deviceOps];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    id v20 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v5 setDeviceOps:v20];
  }
}

- (BOOL)canFuseConvolutionLayerForInference:(id)a3
{
  id v3 = a3;
  id v4 = [v3 weights];
  id v5 = [v4 childLayers];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    char v7 = [v3 compileForInferenceOnly];
  }
  else
  {
    id v8 = [v3 weights];
    id v9 = [v8 childLayers];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      unint64_t v11 = 0;
      do
      {
        double v12 = [v3 weights];
        double v13 = [v12 childLayers];
        id v14 = [v13 objectAtIndexedSubscript:v11];

        char v7 = [v14 compileForInferenceOnly];
        if ((v7 & 1) == 0) {
          break;
        }
        ++v11;
        BOOL v15 = [v3 weights];
        uint64_t v16 = [v15 childLayers];
        unint64_t v17 = [v16 count];
      }
      while (v11 < v17);
    }
    else
    {
      char v7 = 1;
    }
  }

  return v7;
}

- (BOOL)canFuseFullyConnectedLayerForInference:(id)a3
{
  id v3 = a3;
  id v4 = [v3 weights];
  id v5 = [v4 childLayers];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    char v7 = [v3 compileForInferenceOnly];
  }
  else
  {
    id v8 = [v3 weights];
    id v9 = [v8 childLayers];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      unint64_t v11 = 0;
      do
      {
        double v12 = [v3 weights];
        double v13 = [v12 childLayers];
        id v14 = [v13 objectAtIndexedSubscript:v11];

        char v7 = [v14 compileForInferenceOnly];
        if ((v7 & 1) == 0) {
          break;
        }
        ++v11;
        BOOL v15 = [v3 weights];
        uint64_t v16 = [v15 childLayers];
        unint64_t v17 = [v16 count];
      }
      while (v11 < v17);
    }
    else
    {
      char v7 = 1;
    }
  }

  return v7;
}

- (void)fuseLayersForGraph:(id)a3 stopGradientTensorList:(id)a4 startAtLayerIndex:(unint64_t)a5 forInference:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (!v10 || [v10 count] < a5 + 2) {
    goto LABEL_75;
  }
  v88 = self;
  BOOL v89 = v6;
  +[MLCComputeEngineCommon applyPatternMatcherForGraph:v10 stopGradientTensorList:v11 startAtLayerIndex:a5 forInference:v6];
  double v12 = [MEMORY[0x1E4F1CA80] set];
  if ([v10 count] <= a5) {
    goto LABEL_74;
  }
  id v90 = v11;
  while (1)
  {
    double v13 = [v10 objectAtIndexedSubscript:a5];
    [v12 addObject:v13];
    if ([v13 isLastLayer]) {
      break;
    }
    if (([v13 skipLayer] & 1) == 0)
    {
      id v14 = [v13 fusedLayers];
      if (![v14 count])
      {
        id v15 = [v13 resultTensors];
        if ((unint64_t)[v15 count] >= 2) {
          goto LABEL_9;
        }
        uint64_t v16 = [v13 resultTensors];
        unint64_t v17 = [v16 objectAtIndexedSubscript:0];
        id v18 = [v17 childLayers];
        uint64_t v19 = [v18 count];

        id v11 = v90;
        if (v19 != 1) {
          goto LABEL_11;
        }
        id v20 = [v13 resultTensors];
        id v21 = [v20 objectAtIndexedSubscript:0];
        char v22 = [v21 computeFlags];

        if (v22) {
          goto LABEL_11;
        }
        id v23 = [v13 resultTensors];
        uint64_t v24 = [v23 objectAtIndexedSubscript:0];
        uint64_t v25 = [v24 childLayers];
        id v14 = [v25 objectAtIndexedSubscript:0];

        if (([v14 skipLayer] & 1) == 0)
        {
          int v26 = [v13 isTrainable];
          if (v26 == [v14 isTrainable])
          {
            id v27 = [v13 resultTensors];
            v28 = [v27 objectAtIndexedSubscript:0];
            BOOL v29 = +[MLCComputeEngineCommon isResultTensorInStopGradientTensorList:v90 resultTensor:v28 forInference:v89];

            if (!v29)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                if (v89)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    if ([(MLCDeviceGPU *)v88 canFuseConvolutionLayerForInference:v13])
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v34 = [v14 fusedLayers];
                        uint64_t v35 = [v34 count];

                        if (!v35)
                        {
                          id v14 = v14;
                          v36 = [v14 descriptor];
                          BOOL IsFusableWithMPSGraph = activationIsFusableWithMPSGraph(v36);

                          if (IsFusableWithMPSGraph) {
                            +[MLCComputeEngineCommon updateTensorsForTwoFusedLayers:v13 layerNext:v14];
                          }
                        }
                      }
                    }
                    goto LABEL_10;
                  }
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v38 = [v14 fusedLayers];
                    uint64_t v39 = [v38 count];

                    if (!v39) {
                      goto LABEL_56;
                    }
                  }
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                  && ([v14 fusedLayers],
                      v40 = objc_claimAutoreleasedReturnValue(),
                      uint64_t v41 = [v40 count],
                      v40,
                      !v41))
                {
LABEL_56:
                  if (+[MLCComputeEngineCommon doesActivationRequireInput:v14 forInference:v89])
                  {
                    goto LABEL_10;
                  }
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    goto LABEL_10;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0
                    || ([v14 fusedLayers],
                        v42 = objc_claimAutoreleasedReturnValue(),
                        uint64_t v43 = [v42 count],
                        v42,
                        v43))
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v44 = v13;
                      id v14 = v14;
                      if ([v44 operation] == 2
                        && ![v14 operation])
                      {
                        [v44 resultTensors];
                        v45 = id v81 = v44;
                        v46 = [v45 objectAtIndexedSubscript:0];
                        v47 = [v14 resultTensors];
                        v48 = [v47 objectAtIndexedSubscript:0];
                        int v49 = [v46 doesShapeMatchWithTensor:v48];

                        id v44 = v81;
                        if (v49)
                        {
                          long long v93 = 0u;
                          long long v94 = 0u;
                          long long v91 = 0u;
                          long long v92 = 0u;
                          id obj = [v14 sourceTensors];
                          uint64_t v50 = [obj countByEnumeratingWithState:&v91 objects:v95 count:16];
                          if (v50)
                          {
                            uint64_t v51 = v50;
                            uint64_t v52 = *(void *)v92;
                            while (2)
                            {
                              for (uint64_t i = 0; i != v51; ++i)
                              {
                                if (*(void *)v92 != v52) {
                                  objc_enumerationMutation(obj);
                                }
                                v54 = [*(id *)(*((void *)&v91 + 1) + 8 * i) parentLayers];
                                v55 = [v54 lastObject];

                                if (v55 && ([v12 containsObject:v55] & 1) == 0)
                                {

                                  id v44 = v81;
                                  goto LABEL_69;
                                }
                              }
                              uint64_t v51 = [obj countByEnumeratingWithState:&v91 objects:v95 count:16];
                              if (v51) {
                                continue;
                              }
                              break;
                            }
                          }

                          id v44 = v81;
                          [(MLCDeviceGPU *)v88 updateTensorsForFMAFusedLayers:v81 layerNext:v14];
                        }
                      }
LABEL_69:
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        goto LABEL_10;
                      }
                      id v56 = v13;
                      if (![v56 operation])
                      {
                        id objb = [v56 sourceTensors];
                        v82 = [objb objectAtIndexedSubscript:0];
                        v77 = [v82 descriptor];
                        v57 = [v77 shape];
                        uint64_t v79 = [v57 count];
                        [v56 sourceTensors];
                        v58 = id v70 = v56;
                        v59 = [v58 objectAtIndexedSubscript:1];
                        v60 = [v59 descriptor];
                        v61 = [v60 shape];
                        uint64_t v75 = [v61 count];

                        id v56 = v70;
                        if (v79 == v75)
                        {
                          obja = 0;
                          while (1)
                          {
                            v62 = [v56 sourceTensors];
                            v63 = [v62 objectAtIndexedSubscript:0];
                            v64 = [v63 descriptor];
                            v65 = [v64 shape];
                            unint64_t v83 = [v65 count];

                            if ((unint64_t)obja >= v83) {
                              break;
                            }
                            v84 = [v56 sourceTensors];
                            v80 = [v84 objectAtIndexedSubscript:0];
                            v78 = [v80 descriptor];
                            v74 = [v78 shape];
                            v73 = [v74 objectAtIndexedSubscript:obja];
                            uint64_t v76 = [v73 unsignedIntegerValue];
                            v72 = [v56 sourceTensors];
                            v66 = [v72 objectAtIndexedSubscript:1];
                            v67 = [v66 descriptor];
                            v68 = [v67 shape];
                            v69 = [v68 objectAtIndexedSubscript:obja];
                            uint64_t v71 = [v69 unsignedIntegerValue];

                            ++obja;
                            id v56 = v70;
                            if (v76 != v71) {
                              goto LABEL_71;
                            }
                          }
                          [(MLCDeviceGPU *)v88 updateTensorsForFusedArithmeticAndLayerNormalizationLayer:v56 layerNext:v14];
                        }
                      }
LABEL_71:
                    }
                    id v11 = v90;
                    goto LABEL_10;
                  }
                }
                +[MLCComputeEngineCommon updateTensorsForTwoFusedLayers:v13 layerNext:v14];
                goto LABEL_10;
              }
              id v15 = v13;
              id v14 = v14;
              if (![v15 paddingType])
              {
                id v30 = [v14 descriptor];
                if ([v30 paddingPolicy] == 1
                  && (uint64_t v31 = [v15 paddingTop], v31 == objc_msgSend(v15, "paddingBottom")))
                {
                  uint64_t v32 = [v15 paddingLeft];
                  uint64_t v33 = [v15 paddingRight];

                  id v11 = v90;
                  if (v32 == v33) {
                    +[MLCComputeEngineCommon updateTensorsForFusedPaddingAndConvolutionLayer:v15 layerNext:v14];
                  }
                }
                else
                {

                  id v11 = v90;
                }
              }

LABEL_9:
            }
          }
        }
      }
LABEL_10:
    }
LABEL_11:

    if (++a5 >= [v10 count]) {
      goto LABEL_74;
    }
  }

LABEL_74:
LABEL_75:
}

- (void)fuseLayersForTrainingGraph:(id)a3 stopGradientTensorList:(id)a4
{
}

- (void)fuseLayersForInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4
{
}

- (BOOL)compileLayerDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectAtIndexedSubscript:0];
  double v12 = [v11 layer];
  double v13 = objc_opt_class();

  if (!v13)
  {
    double v13 = objc_opt_class();
  }
  char v14 = [v13 compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensor:v10];
  id v15 = [v9 objectAtIndexedSubscript:0];
  objc_msgSend(v10, "setMultiDeviceReductionType:", objc_msgSend(v15, "multiDeviceReductionType"));

  uint64_t v16 = [v11 layer];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v34 = v14;
    char v17 = [v11 batchFirst];
    id v18 = [v9 objectAtIndexedSubscript:0];
    uint64_t v19 = [v18 descriptor];
    id v20 = [v19 shape];
    int v26 = [v20 objectAtIndexedSubscript:(v17 & 1) == 0];
    uint64_t v27 = [v26 unsignedIntegerValue];
  }
  else
  {
    uint64_t v33 = v13;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v18 = [v9 objectAtIndexedSubscript:0];
    uint64_t v19 = [v18 descriptor];
    char v22 = [v19 shape];
    id v20 = v22;
    if (isKindOfClass)
    {
      char v34 = v14;
      int v26 = [v22 objectAtIndexedSubscript:0];
      id v30 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v26, "unsignedIntegerValue") == 1);
      [v30 descriptor];
      id v23 = v31 = v16;
      [v23 shape];
      uint64_t v24 = v32 = v8;
      uint64_t v25 = [v24 objectAtIndexedSubscript:0];
      uint64_t v27 = [v25 unsignedIntegerValue];

      id v8 = v32;
      uint64_t v16 = v31;
    }
    else
    {
      unint64_t v28 = [v22 count];

      if (v28 < 2)
      {
        uint64_t v27 = 1;
        double v13 = v33;
        goto LABEL_11;
      }
      char v34 = v14;
      id v18 = [v9 objectAtIndexedSubscript:0];
      uint64_t v19 = [v18 descriptor];
      id v20 = [v19 shape];
      int v26 = [v20 objectAtIndexedSubscript:0];
      uint64_t v27 = [v26 unsignedIntegerValue];
    }
    double v13 = v33;
  }

  char v14 = v34;
LABEL_11:
  [v11 setBatchSize:v27];

  return v14;
}

- (BOOL)compileLayerDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectAtIndexedSubscript:0];
  double v12 = [v11 layer];
  double v13 = objc_opt_class();

  if (!v13)
  {
    double v13 = objc_opt_class();
  }
  char v14 = [v13 compileWithDevice:self deviceOps:v8 sourceTensors:v9 resultTensors:v10];
  id v15 = [v9 objectAtIndexedSubscript:0];
  uint64_t v16 = [v15 descriptor];
  char v17 = [v16 shape];
  unint64_t v18 = [v17 count];

  if (v18 < 2)
  {
    uint64_t v25 = 1;
  }
  else
  {
    uint64_t v27 = [v9 objectAtIndexedSubscript:0];
    uint64_t v19 = [v27 descriptor];
    id v20 = [v19 shape];
    [v20 objectAtIndexedSubscript:0];
    id v21 = v8;
    id v22 = v10;
    uint64_t v24 = v23 = v14;
    uint64_t v25 = [v24 unsignedIntegerValue];

    char v14 = v23;
    id v10 = v22;
    id v8 = v21;
  }
  [v11 setBatchSize:v25];

  return v14;
}

- (BOOL)setConvolutionLayerOptimizerDataForDeviceOps:(id)a3 weights:(id)a4 bias:(id)a5
{
  return +[_MLCGPUConvolution setOptimizerDataForDevice:self deviceOps:a3 weights:a4 bias:a5];
}

- (BOOL)setNormalizationLayerOptimizerDataForDeviceOps:(id)a3 beta:(id)a4 gamma:(id)a5
{
  return +[_MLCGPUBatchNormalization setOptimizerDataForDevice:self deviceOps:a3 beta:a4 gamma:a5];
}

- (id)createOptimizerDeviceDataForTensor:(id)a3 optimizer:(id)a4 optimizerData:(id)a5 isVector:(BOOL)a6
{
  if (a6) {
    GPU_CreateOptimizerDeviceVectorDataForTensor(self, (uint64_t)a3, a5);
  }
  else {
  BOOL v6 = GPU_CreateOptimizerDeviceDataForTensor(self, a3, a5);
  }

  return v6;
}

- (void)allocateDeviceDataForGlobalNormClippingWithOptimizer:(id)a3 updatableParameterCount:(unint64_t)a4
{
  id v6 = a3;
  if ([(MLCDeviceGPU *)self numDevicesToUse] == 1)
  {
    id v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v6 setOneStepOptimizerBuffers:v5];
  }
}

- (unint64_t)allocatedDeviceDataSizeForTraining:(BOOL)a3 layer:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v4 = [a4 objectAtIndexedSubscript:0];
  id v5 = [v4 forwardKernel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  unint64_t v7 = 0;
  if (isKindOfClass)
  {
    id v8 = [v4 gradientKernel];
    uint64_t v9 = [v8 count];

    BOOL v29 = v4;
    id v10 = v4;
    unint64_t v7 = 0;
    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        double v12 = [v10 rnnTrainableWeightGradients];
        double v13 = [v12 objectAtIndexedSubscript:i];

        char v14 = [v10 rnnMomentumMatrices];
        id v15 = [v14 objectAtIndexedSubscript:i];

        uint64_t v16 = [v10 rnnVelocityMatrices];
        char v17 = [v16 objectAtIndexedSubscript:i];

        unint64_t v18 = [v10 rnnCenterWeightMatrices];
        uint64_t v19 = [v18 objectAtIndexedSubscript:i];

        if ([v13 count])
        {
          unint64_t v20 = 0;
          do
          {
            id v21 = [v13 objectAtIndexedSubscript:v20];
            v7 += [v21 matrixBytes];

            ++v20;
          }
          while (v20 < [v13 count]);
        }
        if ([v15 count])
        {
          unint64_t v22 = 0;
          do
          {
            char v23 = [v15 objectAtIndexedSubscript:v22];
            v7 += [v23 matrixBytes];

            ++v22;
          }
          while (v22 < [v15 count]);
        }
        if ([v17 count])
        {
          unint64_t v24 = 0;
          do
          {
            uint64_t v25 = [v17 objectAtIndexedSubscript:v24];
            v7 += [v25 matrixBytes];

            ++v24;
          }
          while (v24 < [v17 count]);
        }
        if ([v19 count])
        {
          unint64_t v26 = 0;
          do
          {
            uint64_t v27 = [v19 objectAtIndexedSubscript:v26];
            v7 += [v27 matrixBytes];

            ++v26;
          }
          while (v26 < [v19 count]);
        }
      }
    }

    id v4 = v29;
  }

  return v7;
}

- (id)compareLayerWithOperation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (void *)MEMORY[0x1E01B11E0](self, a2);
  id v6 = +[_MLCGPUCompare layerWithDevice:self operation:v3];
  unint64_t v7 = [v6 deviceOps];
  id v8 = (void *)[v7 copy];

  [v6 setDeviceOps:0];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    uint64_t v9 = v8;
  }
  id v10 = v9;

  return v10;
}

- (id)reductionLayerWithReduceType:(int)a3 dimensions:(id)a4 sourceShapeCount:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1E01B11E0]();
  id v10 = +[_MLCGPUReduction layerWithDevice:self reduceType:v6 dimensions:v8 sourceShapeCount:a5];
  id v11 = [v10 deviceOps];
  double v12 = (void *)[v11 copy];

  [v10 setDeviceOps:0];
  double v13 = (void *)MEMORY[0x1E4F1CBF0];
  if (v12) {
    double v13 = v12;
  }
  id v14 = v13;

  return v14;
}

- (id)multiheadAttentionLayerWithDescriptor:(id)a3 weights:(id)a4 bias:(id)a5 attnBias:(id)a6 inferenceOnly:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void *)MEMORY[0x1E01B11E0]();
  char v17 = +[_MLCGPUMHAttention layerWithDevice:self desciptor:v12 weights:v13 bias:v14 attnBias:v15 inferenceOnly:v7];
  unint64_t v18 = [v17 deviceOps];
  uint64_t v19 = (void *)[v18 copy];

  [v17 setDeviceOps:0];
  unint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
  if (v19) {
    unint64_t v20 = v19;
  }
  id v21 = v20;

  return v21;
}

- (BOOL)setMHALayerOptimizerDataForDeviceOps:(id)a3 optimizerDataForWeights:(id)a4 optimizerDataForBias:(id)a5
{
  return +[_MLCGPUMHAttention setOptimizerDataForDevice:self deviceOps:a3 dataForWeights:a4 dataForBias:a5];
}

- (BOOL)setLSTMLayerOptimizerDataForDeviceOps:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 biasTerms:(id)a6
{
  return +[_MLCGPULSTM setOptimizerDataForDevice:self deviceOps:a3 inputWeights:a4 hiddenWeights:a5 biasTerms:a6];
}

- (id)matMulLayerWithDescriptor:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 inferenceOnly:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)MEMORY[0x1E01B11E0]();
  id v13 = +[_MLCGPUMatMul layerWithDevice:self descriptor:v9 sourceTensors:v10 resultTensor:v11];
  id v14 = [v13 deviceOps];
  id v15 = (void *)[v14 copy];

  [v13 setDeviceOps:0];
  uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  if (v15) {
    uint64_t v16 = v15;
  }
  id v17 = v16;

  return v17;
}

- (id)sliceLayerWithbegin:(id)a3 end:(id)a4 stride:(id)a5 inferenceOnly:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)MEMORY[0x1E01B11E0]();
  id v13 = +[_MLCGPUSlice layerWithDevice:self begin:v9 end:v10 stride:v11];
  id v14 = [v13 deviceOps];
  id v15 = (void *)[v14 copy];

  [v13 setDeviceOps:0];
  uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  if (v15) {
    uint64_t v16 = v15;
  }
  id v17 = v16;

  return v17;
}

- (id)scatterLayerWithDimension:(unint64_t)a3 reduceType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v7 = (void *)MEMORY[0x1E01B11E0](self, a2);
  id v8 = +[_MLCGPUScatter layerWithDevice:self dimension:a3 reduceType:v4];
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

- (id)gatherLayerWithDimension:(unint64_t)a3
{
  id v5 = (void *)MEMORY[0x1E01B11E0](self, a2);
  uint64_t v6 = +[_MLCGPUGather layerWithDevice:self dimension:a3];
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

- (void)setConvolutionGradientComputeWeightsAndBiasOnly:(id)a3
{
}

- (void)setFullyConnectedGradientComputeWeightsAndBiasOnly:(id)a3
{
}

- (id)weightsGradients:(id)a3
{
  v73[4] = *MEMORY[0x1E4F143B8];
  id v70 = a3;
  uint64_t v4 = 0;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v5 = 0;
    v69 = self;
    while (1)
    {
      uint64_t v6 = [v70 objectAtIndexedSubscript:v5];
      BOOL v7 = [v6 gradientState];
      id v8 = [v7 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      id v10 = [v6 gradientState];
      id v11 = [v10 objectAtIndexedSubscript:0];
      if (isKindOfClass)
      {

        id v12 = [v11 gradientForWeights];
        id v13 = [v6 forwardKernel];
        id v14 = [v13 dataSource];
        id v15 = [v14 weight];
        uint64_t v16 = [v15 descriptor];
        uint64_t v17 = [v16 tensorAllocationSizeInBytes];

        self = v69;
      }
      else
      {
        objc_opt_class();
        char v18 = objc_opt_isKindOfClass();

        uint64_t v19 = [v6 gradientState];
        unint64_t v20 = [v19 objectAtIndexedSubscript:0];
        id v12 = v20;
        if (v18)
        {
          id v21 = [v20 data];

          uint64_t v17 = [v21 length];
          id v12 = v21;
        }
        else
        {

          uint64_t v17 = [v12 length];
        }
      }
      unint64_t v22 = [(MLCDeviceGPU *)self gpuCommandQueueList];
      char v23 = [v22 objectAtIndexedSubscript:v5];
      unint64_t v24 = [v23 commandBuffer];

      +[MLCGPUHelper synchronizeResource:v12 commandBuffer:v24];
      [v24 commit];
      [v24 waitUntilCompleted];
      if (!v5) {
        break;
      }
      if ((unint64_t)[v4 length] >= 4)
      {
        unint64_t v25 = 0;
        do
        {
          float v26 = *(float *)([v12 contents] + 4 * v25);
          id v27 = v4;
          uint64_t v28 = [v27 bytes];
          *(float *)(v28 + 4 * v25) = v26 + *(float *)(v28 + 4 * v25);
          ++v25;
        }
        while (v25 < (unint64_t)[v27 length] >> 2);
        goto LABEL_14;
      }
LABEL_15:
      if ([(MLCDeviceGPU *)self numDevicesToUse] - 1 == v5
        && ([v6 forwardKernel],
            BOOL v29 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char v30 = objc_opt_isKindOfClass(),
            v29,
            (v30 & 1) != 0))
      {
        uint64_t v67 = MEMORY[0x1E01B11E0]();
        uint64_t v31 = (void *)MEMORY[0x1E4F1C9B8];
        id v32 = v4;
        v64 = objc_msgSend(v31, "dataWithBytes:length:", objc_msgSend(v32, "bytes"), objc_msgSend(v32, "length"));
        v66 = v6;
        uint64_t v33 = [v6 forwardKernel];
        v73[0] = &unk_1F38765D0;
        char v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "outputFeatureChannels") * objc_msgSend(v33, "inputFeatureChannels"));
        v73[1] = v34;
        uint64_t v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "kernelHeight"));
        v73[2] = v35;
        v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "kernelWidth"));
        v73[3] = v36;
        v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:4];

        self = v69;
        v38 = v64;

        uint64_t v39 = (void *)v67;
        rotateWeightsTensorBy180Degree(v37, v64, v32);
      }
      else
      {
        if ([(MLCDeviceGPU *)self numDevicesToUse] - 1 != v5) {
          goto LABEL_30;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_30;
        }
        uint64_t v68 = MEMORY[0x1E01B11E0]();
        v40 = (void *)MEMORY[0x1E4F1C9B8];
        id v41 = v4;
        v42 = objc_msgSend(v40, "dataWithBytes:length:", objc_msgSend(v41, "bytes"), objc_msgSend(v41, "length"));
        uint64_t v43 = [v6 mpsGraphTensors];
        id v44 = [v43 objectAtIndexedSubscript:0];

        v37 = [v44 shape];
        v66 = v6;
        int v45 = [v6 convolutionTranspose];
        id v65 = v42;
        uint64_t v61 = [v65 bytes];
        uint64_t v60 = [v41 bytes];
        v62 = [v37 objectAtIndexedSubscript:1];
        uint64_t v59 = [v62 unsignedIntegerValue];
        v46 = [v37 objectAtIndexedSubscript:0];
        uint64_t v58 = [v46 unsignedIntegerValue];
        v63 = v44;
        if (v45)
        {
          v47 = [v37 objectAtIndexedSubscript:3];
          uint64_t v56 = [v47 unsignedIntegerValue];
          v48 = [v37 objectAtIndexedSubscript:2];
          uint64_t v49 = [v48 unsignedIntegerValue];
          LODWORD(v55) = GPU_GetDataTypeFromMPSDataType([v44 dataType]);
          BOOL v50 = +[MLCDataHelper convertSourceHWOI:v61 toResultOIHW:v60 width:v59 height:v58 inputFeatureChannelCount:v56 outputFeatureChannelCount:v49 dataType:v55];
        }
        else
        {
          v47 = [v37 objectAtIndexedSubscript:2];
          uint64_t v57 = [v47 unsignedIntegerValue];
          v48 = [v37 objectAtIndexedSubscript:3];
          uint64_t v51 = [v48 unsignedIntegerValue];
          LODWORD(v55) = GPU_GetDataTypeFromMPSDataType([v44 dataType]);
          BOOL v50 = +[MLCDataHelper convertSourceHWIO:v61 toResultOIHW:v60 width:v59 height:v58 inputFeatureChannelCount:v57 outputFeatureChannelCount:v51 dataType:v55];
        }
        BOOL v52 = v50;

        if (v52)
        {
          uint64_t v39 = (void *)v68;
          self = v69;
        }
        else
        {
          v53 = +[MLCLog framework];
          uint64_t v39 = (void *)v68;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
            [(MLCDeviceGPU(MLCLayerOperations) *)buf weightsGradients:v53];
          }

          self = v69;
        }
        uint64_t v33 = v63;
        v38 = v65;
      }

      uint64_t v6 = v66;
LABEL_30:

      if (++v5 >= [(MLCDeviceGPU *)self numDevicesToUse]) {
        goto LABEL_31;
      }
    }
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v12, "contents"), v17, 0);
    id v27 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
    uint64_t v4 = v27;
    goto LABEL_15;
  }
LABEL_31:

  return v4;
}

- (id)biasesGradients:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0x1E4F35000uLL;
    id v35 = v4;
    do
    {
      id v8 = [v4 objectAtIndexedSubscript:v6];
      id v9 = [v8 gradientState];
      id v10 = [v9 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      id v12 = [v8 gradientState];
      id v13 = [v12 objectAtIndexedSubscript:0];
      v37 = v8;
      if (isKindOfClass)
      {

        id v14 = [v13 gradientForBiases];
        id v15 = [v8 forwardKernel];
        [v15 dataSource];
        unint64_t v16 = v7;
        v18 = uint64_t v17 = self;
        uint64_t v19 = [v18 biasTerm];
        unint64_t v20 = [v19 descriptor];
        uint64_t v36 = [v20 tensorAllocationSizeInBytes];

        self = v17;
        unint64_t v7 = v16;

        id v4 = v35;
      }
      else
      {
        objc_opt_class();
        char v21 = objc_opt_isKindOfClass();

        unint64_t v22 = [v8 gradientState];
        char v23 = [v22 objectAtIndexedSubscript:1];
        id v14 = v23;
        if (v21)
        {
          unint64_t v24 = [v23 data];

          uint64_t v36 = [v24 length];
          id v14 = v24;
        }
        else
        {

          uint64_t v36 = [v14 length];
        }
      }
      unint64_t v25 = [(MLCDeviceGPU *)self gpuCommandQueueList];
      float v26 = [v25 objectAtIndexedSubscript:v6];
      id v27 = [v26 commandBuffer];

      +[MLCGPUHelper synchronizeResource:v14 commandBuffer:v27];
      [v27 commit];
      [v27 waitUntilCompleted];
      if (v6)
      {
        if ((unint64_t)[v5 length] >= 4)
        {
          unint64_t v28 = 0;
          BOOL v29 = v37;
          do
          {
            float v30 = *(float *)([v14 contents] + 4 * v28);
            id v31 = v5;
            uint64_t v32 = [v31 bytes];
            *(float *)(v32 + 4 * v28) = v30 + *(float *)(v32 + 4 * v28);
            ++v28;
          }
          while (v28 < (unint64_t)[v31 length] >> 2);
          uint64_t v5 = v31;
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v14, "contents"), v36, 0);

        uint64_t v5 = (void *)v33;
      }
      BOOL v29 = v37;
LABEL_15:

      ++v6;
    }
    while (v6 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }

  return v5;
}

- (id)mhaWeightGradient:(id)a3 withSize:(unint64_t)a4 index:(unint64_t)a5
{
  id v7 = a3;
  id v8 = 0;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v9 = 0;
    BOOL v29 = self;
    unint64_t v30 = a4;
    if (a4 >> 2 <= 1) {
      unint64_t v10 = 1;
    }
    else {
      unint64_t v10 = a4 >> 2;
    }
    do
    {
      id v11 = [v7 objectAtIndexedSubscript:v9];
      id v12 = [(MLCDeviceGPU *)self gpuCommandQueueList];
      id v13 = [v12 objectAtIndexedSubscript:v9];
      id v14 = [v13 commandBuffer];

      id v15 = [v11 gradientState];
      unint64_t v16 = [v15 objectAtIndexedSubscript:a5];
      uint64_t v17 = [v16 data];

      +[MLCGPUHelper synchronizeResource:v17 commandBuffer:v14];
      [v14 commit];
      [v14 waitUntilCompleted];
      char v18 = [MEMORY[0x1E4F1CA58] data];
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9B8];
      id v20 = v17;
      char v21 = objc_msgSend(v19, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v20, "contents"), v30, 0);
      [v18 appendData:v21];

      if (v9)
      {
        if (v30 >= 4)
        {
          id v22 = v7;
          uint64_t v23 = 0;
          do
          {
            float v24 = *(float *)([v18 bytes] + 4 * v23);
            id v25 = v8;
            uint64_t v26 = [v25 bytes];
            *(float *)(v26 + 4 * v23) = v24 + *(float *)(v26 + 4 * v23);
            ++v23;
          }
          while (v10 != v23);
          id v8 = v25;
          id v7 = v22;
        }
      }
      else
      {
        id v27 = v18;

        id v8 = v27;
      }
      self = v29;

      ++v9;
    }
    while (v9 < [(MLCDeviceGPU *)v29 numDevicesToUse]);
  }

  return v8;
}

- (id)mhaBiasGradient:(id)a3 withSize:(unint64_t)a4 index:(unint64_t)a5
{
  id v31 = a3;
  id v8 = 0;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v9 = 0;
    unint64_t v29 = a4;
    unint64_t v30 = a5 + 4;
    if (a4 >> 2 <= 1) {
      unint64_t v10 = 1;
    }
    else {
      unint64_t v10 = a4 >> 2;
    }
    do
    {
      id v11 = [v31 objectAtIndexedSubscript:v9];
      id v12 = self;
      id v13 = [(MLCDeviceGPU *)self gpuCommandQueueList];
      id v14 = [v13 objectAtIndexedSubscript:v9];
      id v15 = [v14 commandBuffer];

      unint64_t v16 = [v11 gradientState];
      uint64_t v17 = [v16 objectAtIndexedSubscript:v30];
      char v18 = [v17 data];

      +[MLCGPUHelper synchronizeResource:v18 commandBuffer:v15];
      [v15 commit];
      [v15 waitUntilCompleted];
      uint64_t v19 = [MEMORY[0x1E4F1CA58] data];
      id v20 = (void *)MEMORY[0x1E4F1C9B8];
      id v21 = v18;
      id v22 = objc_msgSend(v20, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v21, "contents"), a4, 0);
      [v19 appendData:v22];

      if (v9)
      {
        if (a4 >= 4)
        {
          uint64_t v23 = 0;
          do
          {
            float v24 = *(float *)([v19 bytes] + 4 * v23);
            id v25 = v8;
            uint64_t v26 = [v25 bytes];
            *(float *)(v26 + 4 * v23) = v24 + *(float *)(v26 + 4 * v23);
            ++v23;
          }
          while (v10 != v23);
          id v8 = v25;
          a4 = v29;
        }
      }
      else
      {
        id v27 = v19;

        id v8 = v27;
      }
      self = v12;

      ++v9;
    }
    while (v9 < [(MLCDeviceGPU *)v12 numDevicesToUse]);
  }

  return v8;
}

- (id)mhaAttnBiasGradient:(id)a3 withSize:(unint64_t)a4 index:(unint64_t)a5
{
  id v35 = a3;
  id v8 = 0;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v9 = 0;
    uint64_t v33 = self;
    unint64_t v34 = a5 + 4;
    if (a4 >> 2 <= 1) {
      unint64_t v10 = 1;
    }
    else {
      unint64_t v10 = a4 >> 2;
    }
    do
    {
      id v11 = [v35 objectAtIndexedSubscript:v9];
      id v12 = [(MLCDeviceGPU *)self gpuCommandQueueList];
      id v13 = [v12 objectAtIndexedSubscript:v9];
      id v14 = [v13 commandBuffer];

      int v15 = [v11 mhaHasBias];
      uint64_t v16 = 4;
      if (!v15) {
        uint64_t v16 = 0;
      }
      unint64_t v17 = v34 + v16;
      char v18 = [v11 gradientState];
      uint64_t v19 = [v18 objectAtIndexedSubscript:v17];
      [v19 data];
      uint64_t v21 = v20 = a4;

      +[MLCGPUHelper synchronizeResource:v21 commandBuffer:v14];
      [v14 commit];
      [v14 waitUntilCompleted];
      id v22 = [MEMORY[0x1E4F1CA58] data];
      uint64_t v23 = (void *)MEMORY[0x1E4F1C9B8];
      float v24 = (void *)v21;
      a4 = v20;
      id v25 = v24;
      uint64_t v26 = objc_msgSend(v23, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v25, "contents"), v20, 0);
      [v22 appendData:v26];

      if (v9)
      {
        if (v20 >= 4)
        {
          uint64_t v27 = 0;
          do
          {
            float v28 = *(float *)([v22 bytes] + 4 * v27);
            id v29 = v8;
            uint64_t v30 = [v29 bytes];
            *(float *)(v30 + 4 * v27) = v28 + *(float *)(v30 + 4 * v27);
            ++v27;
          }
          while (v10 != v27);
          id v8 = v29;
          a4 = v20;
        }
      }
      else
      {
        id v31 = v22;

        id v8 = v31;
      }
      self = v33;

      ++v9;
    }
    while (v9 < [(MLCDeviceGPU *)v33 numDevicesToUse]);
  }

  return v8;
}

- (id)lstmInputWeightGradient:(id)a3 mlcWeightIndex:(unint64_t)a4
{
  id v36 = a3;
  unint64_t v6 = 0;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v7 = 0;
    unint64_t v34 = a4 & 3;
    unint64_t v35 = a4 >> 2;
    uint64_t v32 = self;
    unint64_t v33 = a4;
    do
    {
      id v8 = [v36 objectAtIndexedSubscript:v7];
      unint64_t v9 = [v8 gradientKernel];
      unint64_t v10 = (void *)qword_1E6CB4AD8[v34];
      id v11 = [v8 rnnExportedInputWeightGradientMatrices];
      id v12 = [v11 objectAtIndexedSubscript:a4];

      id v13 = (void *)MEMORY[0x1E01B11E0]();
      id v14 = [(MLCDeviceGPU *)self gpuCommandQueueList];
      int v15 = [v14 objectAtIndexedSubscript:v7];
      uint64_t v16 = [v15 commandBuffer];

      v37 = v9;
      unint64_t v17 = [v9 objectAtIndexedSubscript:v35];
      char v18 = [v8 rnnTrainableWeightGradients];
      uint64_t v19 = [v18 objectAtIndexedSubscript:v35];
      uint64_t v20 = [v10 unsignedIntegerValue];
      memset(v38, 0, sizeof(v38));
      [v17 encodeCopyWeightsToCommandBuffer:v16 weights:v19 matrixId:v20 matrix:v12 copyFromWeightsToMatrix:1 matrixOffset:v38];

      [v12 synchronizeOnCommandBuffer:v16];
      [v16 commit];
      [v16 waitUntilCompleted];

      if (v7)
      {
        if ((unint64_t)[v6 length] >= 4)
        {
          unint64_t v21 = 0;
          self = v32;
          do
          {
            id v22 = [v12 data];
            float v23 = *(float *)([v22 contents] + 4 * v21);
            id v24 = v6;
            uint64_t v25 = [v24 bytes];
            *(float *)(v25 + 4 * v21) = v23 + *(float *)(v25 + 4 * v21);

            ++v21;
          }
          while (v21 < (unint64_t)[v24 length] >> 2);
          unint64_t v6 = v24;
          a4 = v33;
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v26 = (void *)MEMORY[0x1E4F1C9B8];
        id v27 = [v12 data];
        uint64_t v28 = [v27 contents];
        id v29 = [v12 data];
        uint64_t v30 = objc_msgSend(v26, "dataWithBytesNoCopy:length:freeWhenDone:", v28, objc_msgSend(v29, "length"), 0);

        unint64_t v6 = (void *)v30;
      }
      self = v32;
      a4 = v33;
LABEL_10:

      ++v7;
    }
    while (v7 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }

  return v6;
}

- (id)lstmHiddenWeightGradient:(id)a3 mlcWeightIndex:(unint64_t)a4
{
  id v36 = a3;
  unint64_t v6 = 0;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v7 = 0;
    unint64_t v34 = a4 & 3;
    unint64_t v35 = a4 >> 2;
    uint64_t v32 = self;
    unint64_t v33 = a4;
    do
    {
      id v8 = [v36 objectAtIndexedSubscript:v7];
      unint64_t v9 = [v8 gradientKernel];
      unint64_t v10 = (void *)qword_1E6CB4AF8[v34];
      id v11 = [v8 rnnExportedHiddenWeightGradientMatrices];
      id v12 = [v11 objectAtIndexedSubscript:a4];

      id v13 = (void *)MEMORY[0x1E01B11E0]();
      id v14 = [(MLCDeviceGPU *)self gpuCommandQueueList];
      int v15 = [v14 objectAtIndexedSubscript:v7];
      uint64_t v16 = [v15 commandBuffer];

      v37 = v9;
      unint64_t v17 = [v9 objectAtIndexedSubscript:v35];
      char v18 = [v8 rnnTrainableWeightGradients];
      uint64_t v19 = [v18 objectAtIndexedSubscript:v35];
      uint64_t v20 = [v10 unsignedIntegerValue];
      memset(v38, 0, sizeof(v38));
      [v17 encodeCopyWeightsToCommandBuffer:v16 weights:v19 matrixId:v20 matrix:v12 copyFromWeightsToMatrix:1 matrixOffset:v38];

      [v12 synchronizeOnCommandBuffer:v16];
      [v16 commit];
      [v16 waitUntilCompleted];

      if (v7)
      {
        if ((unint64_t)[v6 length] >= 4)
        {
          unint64_t v21 = 0;
          self = v32;
          do
          {
            id v22 = [v12 data];
            float v23 = *(float *)([v22 contents] + 4 * v21);
            id v24 = v6;
            uint64_t v25 = [v24 bytes];
            *(float *)(v25 + 4 * v21) = v23 + *(float *)(v25 + 4 * v21);

            ++v21;
          }
          while (v21 < (unint64_t)[v24 length] >> 2);
          unint64_t v6 = v24;
          a4 = v33;
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v26 = (void *)MEMORY[0x1E4F1C9B8];
        id v27 = [v12 data];
        uint64_t v28 = [v27 contents];
        id v29 = [v12 data];
        uint64_t v30 = objc_msgSend(v26, "dataWithBytesNoCopy:length:freeWhenDone:", v28, objc_msgSend(v29, "length"), 0);

        unint64_t v6 = (void *)v30;
      }
      self = v32;
      a4 = v33;
LABEL_10:

      ++v7;
    }
    while (v7 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }

  return v6;
}

- (id)lstmBiasGradient:(id)a3 mlcBiasIndex:(unint64_t)a4
{
  id v36 = a3;
  unint64_t v6 = 0;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v7 = 0;
    unint64_t v34 = a4 & 3;
    unint64_t v35 = a4 >> 2;
    uint64_t v32 = self;
    unint64_t v33 = a4;
    do
    {
      id v8 = [v36 objectAtIndexedSubscript:v7];
      unint64_t v9 = [v8 gradientKernel];
      unint64_t v10 = (void *)qword_1E6CB4B18[v34];
      id v11 = [v8 rnnExportedBiasGradientMatrices];
      id v12 = [v11 objectAtIndexedSubscript:a4];

      id v13 = (void *)MEMORY[0x1E01B11E0]();
      id v14 = [(MLCDeviceGPU *)self gpuCommandQueueList];
      int v15 = [v14 objectAtIndexedSubscript:v7];
      uint64_t v16 = [v15 commandBuffer];

      v37 = v9;
      unint64_t v17 = [v9 objectAtIndexedSubscript:v35];
      char v18 = [v8 rnnTrainableWeightGradients];
      uint64_t v19 = [v18 objectAtIndexedSubscript:v35];
      uint64_t v20 = [v10 unsignedIntegerValue];
      memset(v38, 0, sizeof(v38));
      [v17 encodeCopyWeightsToCommandBuffer:v16 weights:v19 matrixId:v20 matrix:v12 copyFromWeightsToMatrix:1 matrixOffset:v38];

      [v12 synchronizeOnCommandBuffer:v16];
      [v16 commit];
      [v16 waitUntilCompleted];

      if (v7)
      {
        if ((unint64_t)[v6 length] >= 4)
        {
          unint64_t v21 = 0;
          self = v32;
          do
          {
            id v22 = [v12 data];
            float v23 = *(float *)([v22 contents] + 4 * v21);
            id v24 = v6;
            uint64_t v25 = [v24 bytes];
            *(float *)(v25 + 4 * v21) = v23 + *(float *)(v25 + 4 * v21);

            ++v21;
          }
          while (v21 < (unint64_t)[v24 length] >> 2);
          unint64_t v6 = v24;
          a4 = v33;
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v26 = (void *)MEMORY[0x1E4F1C9B8];
        id v27 = [v12 data];
        uint64_t v28 = [v27 contents];
        id v29 = [v12 data];
        uint64_t v30 = objc_msgSend(v26, "dataWithBytesNoCopy:length:freeWhenDone:", v28, objc_msgSend(v29, "length"), 0);

        unint64_t v6 = (void *)v30;
      }
      self = v32;
      a4 = v33;
LABEL_10:

      ++v7;
    }
    while (v7 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }

  return v6;
}

- (id)betaGradients:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = [v4 objectAtIndexedSubscript:v6];
      id v8 = [v7 normalizationBetaGradient];
      unint64_t v9 = [v7 normalizationSumBetaGammaDeltaKernel];

      unint64_t v10 = [v8 length];
      if (v9) {
        v10 /= (unint64_t)[v7 batchSize];
      }
      id v11 = [(MLCDeviceGPU *)self gpuCommandQueueList];
      id v12 = [v11 objectAtIndexedSubscript:v6];
      id v13 = [v12 commandBuffer];

      +[MLCGPUHelper synchronizeResource:v8 commandBuffer:v13];
      [v13 commit];
      [v13 waitUntilCompleted];
      if (!v6) {
        break;
      }
      if ((unint64_t)[v5 length] >= 4)
      {
        unint64_t v14 = 0;
        do
        {
          float v15 = *(float *)([v8 contents] + 4 * v14);
          id v16 = v5;
          uint64_t v17 = [v16 bytes];
          *(float *)(v17 + 4 * v14) = v15 + *(float *)(v17 + 4 * v14);
          ++v14;
        }
        while (v14 < (unint64_t)[v16 length] >> 2);
        goto LABEL_11;
      }
LABEL_12:

      if (++v6 >= [(MLCDeviceGPU *)self numDevicesToUse]) {
        goto LABEL_13;
      }
    }
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v8, "contents"), v10, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
    uint64_t v5 = v16;
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (id)gammaGradients:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = [v4 objectAtIndexedSubscript:v6];
      id v8 = [v7 normalizationGammaGradient];
      unint64_t v9 = [v7 normalizationSumBetaGammaDeltaKernel];

      unint64_t v10 = [v8 length];
      if (v9) {
        v10 /= (unint64_t)[v7 batchSize];
      }
      id v11 = [(MLCDeviceGPU *)self gpuCommandQueueList];
      id v12 = [v11 objectAtIndexedSubscript:v6];
      id v13 = [v12 commandBuffer];

      +[MLCGPUHelper synchronizeResource:v8 commandBuffer:v13];
      [v13 commit];
      [v13 waitUntilCompleted];
      if (!v6) {
        break;
      }
      if ((unint64_t)[v5 length] >= 4)
      {
        unint64_t v14 = 0;
        do
        {
          float v15 = *(float *)([v8 contents] + 4 * v14);
          id v16 = v5;
          uint64_t v17 = [v16 bytes];
          *(float *)(v17 + 4 * v14) = v15 + *(float *)(v17 + 4 * v14);
          ++v14;
        }
        while (v14 < (unint64_t)[v16 length] >> 2);
        goto LABEL_11;
      }
LABEL_12:

      if (++v6 >= [(MLCDeviceGPU *)self numDevicesToUse]) {
        goto LABEL_13;
      }
    }
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v8, "contents"), v10, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
    uint64_t v5 = v16;
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (id)embeddingWeightsGradients:(id)a3 embeddingCount:(unint64_t)a4 embeddingDimension:(unint64_t)a5
{
  id v6 = a3;
  unint64_t v7 = 0;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0x1E6CB4000uLL;
    while (1)
    {
      unint64_t v10 = [v6 objectAtIndexedSubscript:v8];
      id v11 = [v10 gradientForWeights];
      id v12 = [(MLCDeviceGPU *)self gpuCommandQueueList];
      id v13 = [v12 objectAtIndexedSubscript:v8];
      unint64_t v14 = [v13 commandBuffer];

      [*(id *)(v9 + 1088) synchronizeResource:v11 commandBuffer:v14];
      [v14 commit];
      [v14 waitUntilCompleted];
      if (!v8) {
        break;
      }
      if ((unint64_t)[v7 length] >= 4)
      {
        unint64_t v15 = 0;
        do
        {
          float v16 = *(float *)([v11 contents] + 4 * v15);
          id v17 = v7;
          uint64_t v18 = [v17 bytes];
          *(float *)(v18 + 4 * v15) = v16 + *(float *)(v18 + 4 * v15);
          ++v15;
        }
        while (v15 < (unint64_t)[v17 length] >> 2);
        goto LABEL_9;
      }
LABEL_10:

      if (++v8 >= [(MLCDeviceGPU *)self numDevicesToUse]) {
        goto LABEL_11;
      }
    }
    id v27 = (void *)MEMORY[0x1E4F1C9B8];
    id v19 = v11;
    uint64_t v20 = self;
    id v21 = v6;
    unint64_t v22 = v9;
    uint64_t v23 = [v19 contents];
    uint64_t v24 = [v19 length];
    uint64_t v25 = v23;
    unint64_t v9 = v22;
    id v6 = v21;
    self = v20;
    id v17 = [v27 dataWithBytesNoCopy:v25 length:v24 freeWhenDone:0];

LABEL_9:
    unint64_t v7 = v17;
    goto LABEL_10;
  }
LABEL_11:

  return v7;
}

- (void)rotateAndCopyMTLBuffer:(id)a3 toNSData:(id)a4 withTensorDescriptor:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = (void *)MEMORY[0x1E01B11E0]();
  id v11 = (void *)MEMORY[0x1E4F1C9B8];
  id v14 = v7;
  id v12 = objc_msgSend(v11, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v14, "contents"), objc_msgSend(v8, "length"), 0);
  id v13 = [v9 shape];
  rotateWeightsTensorBy180Degree(v13, v12, v8);
}

+ (unint64_t)calculateImageSizeForTensor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 descriptor];
  uint64_t v5 = [v4 shape];
  unint64_t v6 = [v5 count] != 1;

  id v7 = [v3 descriptor];
  unint64_t v8 = [v7 dimensionCount];

  uint64_t v9 = 1;
  if (v8 > v6)
  {
    do
    {
      unint64_t v10 = [v3 descriptor];
      id v11 = [v10 shape];
      id v12 = [v11 objectAtIndexedSubscript:v6];
      v9 *= [v12 unsignedIntegerValue];

      ++v6;
      id v13 = [v3 descriptor];
      unint64_t v14 = [v13 dimensionCount];
    }
    while (v6 < v14);
  }
  unint64_t v15 = [v3 descriptor];
  int v16 = [v15 dataType];

  if ((v16 - 1) > 6) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = qword_1DD1F0B88[v16 - 1];
  }
  unint64_t v18 = v17 * v9;

  return v18;
}

+ (id)filteredGPUListIncludingLowPoweredBuiltin:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = MTLCreateSystemDefaultDevice();
  id v4 = v3;
  if (v3 && [v3 supportsFamily:1006])
  {
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

+ (BOOL)multiGPUNotSupportedInFilteredGPUList:(id)a3
{
  return 1;
}

- (MLCDeviceGPU)initWithType:(int)a3 selectsMultipleComputeDevices:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v8 = [(id)objc_opt_class() filteredGPUListIncludingLowPoweredBuiltin:1];
  if ([v8 count])
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (a3 == 1 && v4 && ([(id)objc_opt_class() multiGPUNotSupportedInFilteredGPUList:v8] & 1) == 0)
    {
      unint64_t v10 = v9;
      uint64_t v9 = (void *)[v8 mutableCopy];
    }
    else
    {
      unint64_t v10 = [v8 objectAtIndexedSubscript:0];
      [v9 addObject:v10];
    }

    self = [(MLCDeviceGPU *)self initWithDeviceList:v9];
    id v12 = self;
  }
  else
  {
    id v11 = +[MLCLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceGPU initWithType:selectsMultipleComputeDevices:](a2);
    }

    id v12 = 0;
  }

  return v12;
}

- (MLCDeviceGPU)initWithDeviceList:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      unint64_t v6 = [v4 objectAtIndexedSubscript:v5];
      char v7 = [v6 supportsFamily:1006];

      if ((v7 & 1) == 0) {
        break;
      }
      if (++v5 >= (unint64_t)[v4 count]) {
        goto LABEL_5;
      }
    }
    unint64_t v10 = +[MLCLog framework];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceGPU initWithDeviceList:](a2);
    }
    unint64_t v35 = 0;
  }
  else
  {
LABEL_5:
    v38 = self;
    unint64_t v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[MLCDeviceGPU initWithDeviceList:](v4, v8);
    }

    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
    unint64_t v10 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    id v11 = (void *)[v9 mutableCopy];
    id v41 = (void *)[v9 mutableCopy];
    v40 = (void *)[v9 mutableCopy];
    id v12 = (void *)[v9 mutableCopy];
    if ([v4 count])
    {
      unint64_t v13 = 0;
      do
      {
        unint64_t v14 = [v4 objectAtIndexedSubscript:v13];
        unint64_t v15 = (void *)[v14 newEvent];

        if (v15)
        {
          [v10 setObject:v15 atIndexedSubscript:v13];
        }
        else
        {
          int v16 = +[MLCLog framework];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v25 = NSStringFromSelector(a2);
            uint64_t v26 = [v4 objectAtIndexedSubscript:v13];
            *(_DWORD *)buf = 138412802;
            uint64_t v43 = v25;
            __int16 v44 = 2048;
            unint64_t v45 = v13;
            __int16 v46 = 2112;
            uint64_t v47 = (uint64_t)v26;
            _os_log_error_impl(&dword_1DD0C9000, v16, OS_LOG_TYPE_ERROR, "%@: No MTLLocalEvent: gpuDeviceList[%lu]=%@", buf, 0x20u);
          }
        }
        uint64_t v17 = [v4 objectAtIndexedSubscript:v13];
        unint64_t v18 = (void *)[v17 newSharedEvent];

        if (v18)
        {
          [v11 setObject:v18 atIndexedSubscript:v13];
        }
        else
        {
          id v19 = +[MLCLog framework];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            id v27 = NSStringFromSelector(a2);
            uint64_t v28 = [v4 objectAtIndexedSubscript:v13];
            *(_DWORD *)buf = 138412802;
            uint64_t v43 = v27;
            __int16 v44 = 2048;
            unint64_t v45 = v13;
            __int16 v46 = 2112;
            uint64_t v47 = (uint64_t)v28;
            _os_log_error_impl(&dword_1DD0C9000, v19, OS_LOG_TYPE_ERROR, "%@: No MTLSharedEvent: gpuDeviceList[%lu]=%@", buf, 0x20u);
          }
        }
        uint64_t v20 = [v4 objectAtIndexedSubscript:v13];
        id v21 = (void *)[v20 newCommandQueue];

        if (v21)
        {
          [v41 setObject:v21 atIndexedSubscript:v13];
          unint64_t v22 = [MEMORY[0x1E4F35520] commandBufferFromCommandQueue:v21];
          [v12 setObject:v22 atIndexedSubscript:v13];

          uint64_t v23 = [v12 objectAtIndexedSubscript:v13];
          uint64_t v24 = [v23 rootCommandBuffer];
          [v40 setObject:v24 atIndexedSubscript:v13];
        }
        else
        {
          uint64_t v23 = +[MLCLog framework];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v37 = NSStringFromSelector(a2);
            uint64_t v29 = [v4 objectAtIndexedSubscript:v13];
            *(_DWORD *)buf = 138412802;
            uint64_t v43 = v37;
            __int16 v44 = 2048;
            unint64_t v45 = v13;
            __int16 v46 = 2112;
            uint64_t v47 = v29;
            uint64_t v30 = (void *)v29;
            _os_log_error_impl(&dword_1DD0C9000, v23, OS_LOG_TYPE_ERROR, "%@: No MTLCommandQueue: gpuDeviceList[%lu]=%@", buf, 0x20u);
          }
        }

        ++v13;
      }
      while (v13 < [v4 count]);
    }
    id v31 = malloc_type_calloc([v4 count], 8uLL, 0x100004000313F17uLL);
    uint64_t v32 = (void *)[v4 copy];
    id v33 = [v10 copy];
    unint64_t v34 = (void *)[v11 copy];
    self = [(MLCDeviceGPU *)v38 initWithType:1 gpuDeviceList:v32 gpuLocalEventList:v33 gpuSharedEventList:v34 currentEventValue:v31 gpuCommandQueueList:v41 gpuCommandBufferList:v40 gpuMPSCommandBufferList:v12];

    unint64_t v35 = self;
  }

  return v35;
}

- (MLCDeviceGPU)initWithType:(int)a3 gpuDeviceList:(id)a4 gpuLocalEventList:(id)a5 gpuSharedEventList:(id)a6 currentEventValue:(unint64_t *)a7 gpuCommandQueueList:(id)a8 gpuCommandBufferList:(id)a9 gpuMPSCommandBufferList:(id)a10
{
  id v17 = a4;
  id v42 = a5;
  id v41 = a6;
  id v40 = a8;
  id v39 = a9;
  id v38 = a10;
  v43.receiver = self;
  v43.super_class = (Class)MLCDeviceGPU;
  unint64_t v18 = [(MLCDeviceGPU *)&v43 init];
  id v19 = v18;
  if (!v18) {
    goto LABEL_6;
  }
  v18->_l._os_unfair_lock_opaque = 0;
  [v17 objectAtIndexedSubscript:0];
  id obj = a9;
  id v21 = v20 = a7;
  v19->_isAppleSoCGPU = GPU_isAppleFamily(v21);

  v19->_deviceType = a3;
  objc_storeStrong((id *)&v19->_deviceList, a4);
  v19->_numDevicesToUse = [v17 count];
  v19->_numDevicesUsedWithFirstBatch = 0;
  objc_storeStrong((id *)&v19->_gpuLocalEventList, a5);
  objc_storeStrong((id *)&v19->_gpuSharedEventList, a6);
  v19->_currentEventValue = v20;
  objc_storeStrong((id *)&v19->_gpuCommandQueueList, a8);
  objc_storeStrong((id *)&v19->_gpuMPSCommandBufferList, a10);
  objc_storeStrong((id *)&v19->_gpuCommandBufferList, a9);
  unint64_t v22 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v23 = [MEMORY[0x1E4F1CBF0] mutableCopy];
  gpuHeapTemporaryResourceAllocator = v19->_gpuHeapTemporaryResourceAllocator;
  v19->_gpuHeapTemporaryResourceAllocator = (NSMutableArray *)v23;

  v19->_executionTimeInterval = (double *)malloc_type_calloc([v17 count], 8uLL, 0x100004000313F17uLL);
  uint64_t v25 = [v22 mutableCopy];
  gpuWriteTensorKernelList = v19->_gpuWriteTensorKernelList;
  v19->_gpuWriteTensorKernelList = (NSMutableArray *)v25;

  uint64_t v27 = [v22 mutableCopy];
  gpuReadTensorKernelList = v19->_gpuReadTensorKernelList;
  v19->_gpuReadTensorKernelList = (NSMutableArray *)v27;

  uint64_t v29 = [v22 mutableCopy];
  gpuLibrary = v19->_gpuLibrary;
  v19->_gpuLibrary = (NSMutableArray *)v29;

  if ([v17 count])
  {
    unint64_t v31 = 0;
    do
    {
      uint64_t v32 = objc_msgSend(v17, "objectAtIndexedSubscript:", v31, obj);
      id v33 = (void *)[objc_alloc(MEMORY[0x1E4F35630]) initWithDevice:v32 dataLayout:1];
      [(NSMutableArray *)v19->_gpuWriteTensorKernelList setObject:v33 atIndexedSubscript:v31];

      unint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F35570]) initWithDevice:v32 dataLayout:1];
      [(NSMutableArray *)v19->_gpuReadTensorKernelList setObject:v34 atIndexedSubscript:v31];

      ++v31;
    }
    while (v31 < [v17 count]);
  }
  if (![(MLCDeviceGPU *)v19 createPipelineStatesForMissingActivationFunctions])unint64_t v35 = 0; {
  else
  }
LABEL_6:
    unint64_t v35 = v19;

  return v35;
}

- (BOOL)createPipelineStatesForMissingActivationFunctions
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesForwardConcat2DArray:v5];

  unint64_t v6 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesForwardConcat2D:v6];

  char v7 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesConcatFloat:v7];

  unint64_t v8 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesConcatBool:v8];

  uint64_t v9 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesPad2DArray:v9];

  unint64_t v10 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesPad2D:v10];

  id v11 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesReduceAcrossBatch:v11];

  id v12 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesReduceAcrossChannel:v12];

  unint64_t v13 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesArithmeticUnaryForward:v13];

  unint64_t v14 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesArithmeticUnaryGradient:v14];

  unint64_t v15 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesArithmeticBinaryForward:v15];

  int v16 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesArithmeticBinaryGradient:v16];

  id v17 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesArithmeticReduceGradientAny:v17];

  unint64_t v18 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesArithmeticReduceGradientAll:v18];

  id v19 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesEmbeddingRenormalizeWeights:v19];

  uint64_t v20 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesEmbeddingForward:v20];

  id v21 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesEmbeddingGradient:v21];

  unint64_t v22 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesCompareRelationalOpForward:v22];

  uint64_t v23 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesCompareLogicalOpForward:v23];

  uint64_t v24 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuConcurrentEncoderFence:v24];

  uint64_t v25 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesMemFillFloat:v25];

  uint64_t v26 = (void *)[v4 mutableCopy];
  [(MLCDeviceGPU *)self setGpuPipelineStatesMemCopy:v26];

  memset(&v171, 0, sizeof(v171));
  BOOL v27 = 0;
  if (dladdr("/System/Library/Frameworks/MLCompute.framework/", &v171) && v171.dli_fname)
  {
    size_t v28 = strlen(v171.dli_fname);
    bzero(v181, 0x400uLL);
    __strncpy_chk();
    uint64_t v29 = &v181[v28 - 1];
    do
    {
      BOOL v30 = v29 > v181;
      int v32 = *v29--;
      int v31 = v32;
    }
    while (v30 && v31 != 47);
    v29[1] = 0;
    memset(&v170, 0, sizeof(v170));
    if (stat(v181, &v170)) {
      id v33 = "/System/Library/Frameworks/MLCompute.framework/";
    }
    else {
      id v33 = v181;
    }
    snprintf(__str, 0x400uLL, "%s/%s.metallib", v33, "default");
    v122 = [NSString stringWithUTF8String:__str];
    unint64_t v34 = [(MLCDeviceGPU *)self deviceList];
    uint64_t v35 = [v34 count];

    if (v35)
    {
      aSelector = a2;
      id v36 = 0;
      unint64_t v37 = 0;
      while (1)
      {
        id v38 = [(MLCDeviceGPU *)self deviceList];
        id v39 = [v38 objectAtIndexedSubscript:v37];

        id v169 = v36;
        uint64_t v40 = [v39 newLibraryWithFile:v122 error:&v169];
        id v41 = v169;

        BOOL v121 = v40 != 0;
        if (!v40) {
          break;
        }
        id v42 = [(MLCDeviceGPU *)self gpuLibrary];
        [v42 setObject:v40 atIndexedSubscript:v37];

        buf[0] = 1;
        char v168 = 0;
        objc_super v43 = objc_opt_new();
        [v43 setConstantValue:buf type:53 atIndex:0];
        [v43 setConstantValue:&v168 type:53 atIndex:1];
        [(MLCDeviceGPU *)self gpuLibrary];
        __int16 v44 = v151 = (void *)v40;
        unint64_t v45 = [v44 objectAtIndexedSubscript:v37];
        id v167 = v41;
        v150 = (void *)[v45 newFunctionWithName:@"concat_channels_forward" constantValues:v43 error:&v167];
        id v46 = v167;

        v165 = (void *)[v39 newComputePipelineStateWithFunction:v150 error:0];
        buf[0] = 0;
        char v168 = 1;
        [v43 setConstantValue:buf type:53 atIndex:0];
        [v43 setConstantValue:&v168 type:53 atIndex:1];
        uint64_t v47 = [(MLCDeviceGPU *)self gpuLibrary];
        uint64_t v48 = [v47 objectAtIndexedSubscript:v37];
        v149 = (void *)[v48 newFunctionWithName:@"concat_channels_forward" constantValues:v43 error:0];

        v164 = (void *)[v39 newComputePipelineStateWithFunction:v149 error:0];
        buf[0] = 1;
        char v168 = 0;
        [v43 setConstantValue:buf type:53 atIndex:0];
        [v43 setConstantValue:&v168 type:53 atIndex:1];
        uint64_t v49 = [(MLCDeviceGPU *)self gpuLibrary];
        BOOL v50 = [v49 objectAtIndexedSubscript:v37];
        id v166 = v46;
        v147 = (void *)[v50 newFunctionWithName:@"pad_channels_mps_image" constantValues:v43 error:&v166];
        id v148 = v166;

        v163 = (void *)[v39 newComputePipelineStateWithFunction:v147 error:0];
        buf[0] = 0;
        char v168 = 1;
        [v43 setConstantValue:buf type:53 atIndex:0];
        v146 = v43;
        [v43 setConstantValue:&v168 type:53 atIndex:1];
        uint64_t v51 = [(MLCDeviceGPU *)self gpuLibrary];
        BOOL v52 = [v51 objectAtIndexedSubscript:v37];
        v145 = (void *)[v52 newFunctionWithName:@"pad_channels_mps_image" constantValues:v43 error:0];

        v162 = (void *)[v39 newComputePipelineStateWithFunction:v145 error:0];
        v53 = [(MLCDeviceGPU *)self gpuLibrary];
        v54 = [v53 objectAtIndexedSubscript:v37];
        v144 = (void *)[v54 newFunctionWithName:@"reduce_across_batch"];

        v161 = (void *)[v39 newComputePipelineStateWithFunction:v144 error:0];
        uint64_t v55 = [(MLCDeviceGPU *)self gpuLibrary];
        uint64_t v56 = [v55 objectAtIndexedSubscript:v37];
        v143 = (void *)[v56 newFunctionWithName:@"reduce_across_channel"];

        v160 = (void *)[v39 newComputePipelineStateWithFunction:v143 error:0];
        uint64_t v57 = [(MLCDeviceGPU *)self gpuLibrary];
        uint64_t v58 = [v57 objectAtIndexedSubscript:v37];
        v142 = (void *)[v58 newFunctionWithName:@"arithmetic_unary_forward_float"];

        v159 = (void *)[v39 newComputePipelineStateWithFunction:v142 error:0];
        uint64_t v59 = [(MLCDeviceGPU *)self gpuLibrary];
        uint64_t v60 = [v59 objectAtIndexedSubscript:v37];
        v141 = (void *)[v60 newFunctionWithName:@"arithmetic_unary_gradient_float"];

        v158 = (void *)[v39 newComputePipelineStateWithFunction:v141 error:0];
        uint64_t v61 = [(MLCDeviceGPU *)self gpuLibrary];
        v62 = [v61 objectAtIndexedSubscript:v37];
        v140 = (void *)[v62 newFunctionWithName:@"arithmetic_binary_forward_float"];

        v157 = (void *)[v39 newComputePipelineStateWithFunction:v140 error:0];
        v63 = [(MLCDeviceGPU *)self gpuLibrary];
        v64 = [v63 objectAtIndexedSubscript:v37];
        v139 = (void *)[v64 newFunctionWithName:@"arithmetic_binary_gradient_float"];

        v156 = (void *)[v39 newComputePipelineStateWithFunction:v139 error:0];
        id v65 = [(MLCDeviceGPU *)self gpuLibrary];
        v66 = [v65 objectAtIndexedSubscript:v37];
        uint64_t v67 = (void *)[v66 newFunctionWithName:@"arithmetic_reduce_gradient_any"];

        v155 = (void *)[v39 newComputePipelineStateWithFunction:v67 error:0];
        uint64_t v68 = [(MLCDeviceGPU *)self gpuLibrary];
        v69 = [v68 objectAtIndexedSubscript:v37];
        v138 = (void *)[v69 newFunctionWithName:@"arithmetic_reduce_gradient_all"];

        v154 = (void *)[v39 newComputePipelineStateWithFunction:v138 error:0];
        id v70 = [(MLCDeviceGPU *)self gpuLibrary];
        uint64_t v71 = [v70 objectAtIndexedSubscript:v37];
        v137 = (void *)[v71 newFunctionWithName:@"embedding_renormalize_weights"];

        v152 = (void *)[v39 newComputePipelineStateWithFunction:v137 error:0];
        uint64_t v72 = [(MLCDeviceGPU *)self gpuLibrary];
        v73 = [v72 objectAtIndexedSubscript:v37];
        v136 = (void *)[v73 newFunctionWithName:@"embedding_forward_training"];

        v153 = (void *)[v39 newComputePipelineStateWithFunction:v136 error:0];
        v74 = [(MLCDeviceGPU *)self gpuLibrary];
        uint64_t v75 = [v74 objectAtIndexedSubscript:v37];
        v135 = (void *)[v75 newFunctionWithName:@"embedding_gradient_training"];

        v131 = (void *)[v39 newComputePipelineStateWithFunction:v135 error:0];
        uint64_t v76 = [(MLCDeviceGPU *)self gpuLibrary];
        v77 = [v76 objectAtIndexedSubscript:v37];
        v134 = (void *)[v77 newFunctionWithName:@"compare_relationalop_forward"];

        v129 = (void *)[v39 newComputePipelineStateWithFunction:v134 error:0];
        v78 = [(MLCDeviceGPU *)self gpuLibrary];
        uint64_t v79 = [v78 objectAtIndexedSubscript:v37];
        v133 = (void *)[v79 newFunctionWithName:@"compare_logicalop_forward"];

        v128 = (void *)[v39 newComputePipelineStateWithFunction:v133 error:0];
        v80 = [(MLCDeviceGPU *)self gpuLibrary];
        id v81 = [v80 objectAtIndexedSubscript:v37];
        v132 = (void *)[v81 newFunctionWithName:@"concat_float"];

        v125 = (void *)[v39 newComputePipelineStateWithFunction:v132 error:0];
        v82 = [(MLCDeviceGPU *)self gpuLibrary];
        unint64_t v83 = [v82 objectAtIndexedSubscript:v37];
        v130 = (void *)[v83 newFunctionWithName:@"concat_BOOL"];

        v123 = (void *)[v39 newComputePipelineStateWithFunction:v130 error:0];
        v84 = [(MLCDeviceGPU *)self gpuLibrary];
        v85 = [v84 objectAtIndexedSubscript:v37];
        v127 = (void *)[v85 newFunctionWithName:@"mem_fill_float"];

        v86 = (void *)[v39 newComputePipelineStateWithFunction:v127 error:0];
        v87 = [(MLCDeviceGPU *)self gpuLibrary];
        v88 = [v87 objectAtIndexedSubscript:v37];
        v126 = (void *)[v88 newFunctionWithName:@"memcpy"];

        v124 = (void *)[v39 newComputePipelineStateWithFunction:v126 error:0];
        BOOL v89 = [(MLCDeviceGPU *)self gpuPipelineStatesForwardConcat2DArray];
        [v89 setObject:v165 atIndexedSubscript:v37];

        id v90 = [(MLCDeviceGPU *)self gpuPipelineStatesForwardConcat2D];
        [v90 setObject:v164 atIndexedSubscript:v37];

        long long v91 = [(MLCDeviceGPU *)self gpuPipelineStatesConcatFloat];
        [v91 setObject:v125 atIndexedSubscript:v37];

        long long v92 = [(MLCDeviceGPU *)self gpuPipelineStatesConcatBool];
        [v92 setObject:v123 atIndexedSubscript:v37];

        long long v93 = [(MLCDeviceGPU *)self gpuPipelineStatesPad2DArray];
        [v93 setObject:v163 atIndexedSubscript:v37];

        long long v94 = [(MLCDeviceGPU *)self gpuPipelineStatesPad2D];
        [v94 setObject:v162 atIndexedSubscript:v37];

        v95 = [(MLCDeviceGPU *)self gpuPipelineStatesReduceAcrossBatch];
        [v95 setObject:v161 atIndexedSubscript:v37];

        uint64_t v96 = [(MLCDeviceGPU *)self gpuPipelineStatesReduceAcrossChannel];
        [v96 setObject:v160 atIndexedSubscript:v37];

        v97 = [(MLCDeviceGPU *)self gpuPipelineStatesArithmeticUnaryForward];
        [v97 setObject:v159 atIndexedSubscript:v37];

        v98 = [(MLCDeviceGPU *)self gpuPipelineStatesArithmeticUnaryGradient];
        [v98 setObject:v158 atIndexedSubscript:v37];

        v99 = [(MLCDeviceGPU *)self gpuPipelineStatesArithmeticBinaryForward];
        [v99 setObject:v157 atIndexedSubscript:v37];

        v100 = [(MLCDeviceGPU *)self gpuPipelineStatesArithmeticBinaryGradient];
        [v100 setObject:v156 atIndexedSubscript:v37];

        v101 = [(MLCDeviceGPU *)self gpuPipelineStatesArithmeticReduceGradientAny];
        [v101 setObject:v155 atIndexedSubscript:v37];

        v102 = [(MLCDeviceGPU *)self gpuPipelineStatesArithmeticReduceGradientAll];
        [v102 setObject:v154 atIndexedSubscript:v37];

        v103 = [(MLCDeviceGPU *)self gpuPipelineStatesEmbeddingRenormalizeWeights];
        [v103 setObject:v152 atIndexedSubscript:v37];

        v104 = [(MLCDeviceGPU *)self gpuPipelineStatesEmbeddingForward];
        [v104 setObject:v153 atIndexedSubscript:v37];

        v105 = [(MLCDeviceGPU *)self gpuPipelineStatesEmbeddingGradient];
        [v105 setObject:v131 atIndexedSubscript:v37];

        v106 = [(MLCDeviceGPU *)self gpuPipelineStatesCompareRelationalOpForward];
        [v106 setObject:v129 atIndexedSubscript:v37];

        v107 = [(MLCDeviceGPU *)self gpuPipelineStatesCompareLogicalOpForward];
        [v107 setObject:v128 atIndexedSubscript:v37];

        v108 = [(MLCDeviceGPU *)self gpuPipelineStatesMemFillFloat];
        [v108 setObject:v86 atIndexedSubscript:v37];

        v109 = [(MLCDeviceGPU *)self gpuPipelineStatesMemCopy];
        [v109 setObject:v124 atIndexedSubscript:v37];

        v110 = (void *)[v39 newFence];
        v111 = [(MLCDeviceGPU *)self gpuConcurrentEncoderFence];
        [v111 setObject:v110 atIndexedSubscript:v37];

        ++v37;
        v112 = [(MLCDeviceGPU *)self deviceList];
        unint64_t v113 = [v112 count];

        BOOL v114 = v37 >= v113;
        id v36 = v148;
        if (v114) {
          goto LABEL_20;
        }
      }
      v115 = +[MLCLog framework];
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
      {
        v117 = NSStringFromSelector(aSelector);
        v118 = [(MLCDeviceGPU *)self deviceList];
        v119 = [v118 objectAtIndexedSubscript:v37];
        *(_DWORD *)buf = 138413058;
        v173 = v117;
        __int16 v174 = 2080;
        v175 = __str;
        __int16 v176 = 2048;
        unint64_t v177 = v37;
        __int16 v178 = 2112;
        v179 = v119;
        _os_log_error_impl(&dword_1DD0C9000, v115, OS_LOG_TYPE_ERROR, "%@: MTLLibrary(%s) not found: gpuDeviceList[%lu]=%@", buf, 0x2Au);
      }
      id v36 = v41;
LABEL_20:

      BOOL v27 = v121;
    }
    else
    {
      BOOL v27 = 1;
    }
  }
  return v27;
}

- (void)dealloc
{
  currentEventValue = self->_currentEventValue;
  if (currentEventValue) {
    free(currentEventValue);
  }
  executionTimeInterval = self->_executionTimeInterval;
  if (executionTimeInterval) {
    free(executionTimeInterval);
  }
  v5.receiver = self;
  v5.super_class = (Class)MLCDeviceGPU;
  [(MLCDeviceGPU *)&v5 dealloc];
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = NSStringFromSelector(a2);
  uint64_t v5 = [(MLCDeviceGPU *)self deviceType];
  unint64_t v6 = [(MLCDeviceGPU *)self deviceList];
  char v7 = [(MLCDeviceGPU *)self gpuCommandQueueList];
  unint64_t v8 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v9 = [v3 stringWithFormat:@"%@: { deviceType=%d : gpuDeviceList=%@ : gpuCommandQueueList=%@ : gpuCommandBufferList=%@ }", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(MLCDeviceGPU *)self deviceList];
  unint64_t v6 = malloc_type_calloc([v5 count], 8uLL, 0x100004000313F17uLL);

  [(MLCDeviceGPU *)self currentEventValue];
  char v7 = [(MLCDeviceGPU *)self deviceList];
  [v7 count];

  unint64_t v8 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v9 = [(MLCDeviceGPU *)self deviceType];
  unint64_t v10 = [(MLCDeviceGPU *)self deviceList];
  id v11 = [(MLCDeviceGPU *)self gpuLocalEventList];
  id v12 = [(MLCDeviceGPU *)self gpuSharedEventList];
  unint64_t v13 = [(MLCDeviceGPU *)self gpuCommandQueueList];
  unint64_t v14 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  unint64_t v15 = [(MLCDeviceGPU *)self gpuMPSCommandBufferList];
  int v16 = (void *)[v8 initWithType:v9 gpuDeviceList:v10 gpuLocalEventList:v11 gpuSharedEventList:v12 currentEventValue:v6 gpuCommandQueueList:v13 gpuCommandBufferList:v14 gpuMPSCommandBufferList:v15];

  return v16;
}

- (BOOL)synchronizeTensor:(id)a3
{
  id v4 = [a3 deviceMemory];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = -1;
    do
      ++v6;
    while (v6 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
  return v5 != 0;
}

- (BOOL)synchronizeTensorOnHost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 deviceMemory];
  uint64_t v6 = [v5 count];

  uint64_t v23 = v6;
  if (v6 && [(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = (void *)MEMORY[0x1E01B11E0]();
      uint64_t v9 = [(MLCDeviceGPU *)self gpuCommandQueueList];
      unint64_t v10 = [v9 objectAtIndexedSubscript:v7];
      id v11 = [v10 commandBuffer];

      if ([v4 isLayerParameter]) {
        break;
      }
LABEL_17:
      [v11 commit];
      [v11 waitUntilCompleted];

      if (++v7 >= [(MLCDeviceGPU *)self numDevicesToUse]) {
        goto LABEL_18;
      }
    }
    id v12 = [v4 childLayers];
    unint64_t v13 = [v12 objectAtIndexedSubscript:0];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_16:

      goto LABEL_17;
    }
    unint64_t v14 = [v13 deviceOps];
    unint64_t v15 = [v14 objectAtIndexedSubscript:v7];

    if ([v15 isMPSGraph])
    {
LABEL_15:

      goto LABEL_16;
    }
    int v16 = [v15 forwardKernel];
    id v17 = [v16 exportWeightsAndBiasesWithCommandBuffer:v11 resultStateCanBeTemporary:0];
    id v18 = [v13 weights];

    if (v18 == v4)
    {
      uint64_t v21 = [v17 weights];
    }
    else
    {
      id v19 = [v13 biases];
      if (v19 != v4)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v20 = [v17 biases];

      if (!v20)
      {
LABEL_14:
        [v15 setExportableState:v17];

        goto LABEL_15;
      }
      uint64_t v21 = [v17 biases];
    }
    id v19 = (id)v21;
    +[MLCGPUHelper synchronizeResource:v21 commandBuffer:v11];
    goto LABEL_13;
  }
LABEL_18:

  return v23 != 0;
}

- (void)allocateCommandBufferForDeviceAtIndex:(unint64_t)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F35520];
  uint64_t v6 = [(MLCDeviceGPU *)self gpuCommandQueueList];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
  unint64_t v8 = [v5 commandBufferFromCommandQueue:v7];
  uint64_t v9 = [(MLCDeviceGPU *)self gpuMPSCommandBufferList];
  [v9 setObject:v8 atIndexedSubscript:a3];

  id v13 = [(MLCDeviceGPU *)self gpuMPSCommandBufferList];
  unint64_t v10 = [v13 objectAtIndexedSubscript:a3];
  id v11 = [v10 rootCommandBuffer];
  id v12 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  [v12 setObject:v11 atIndexedSubscript:a3];
}

- (void)commitDeviceAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(MLCDeviceGPU *)self gpuMPSCommandBufferList];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v7 = [v6 rootCommandBuffer];
  [v7 commit];

  [(MLCDeviceGPU *)self allocateCommandBufferForDeviceAtIndex:a3];
}

- (void)updateGraphExecutionTime:(id)a3 atIndex:(int)a4 gpuTime:(double)a5
{
  uint64_t v8 = [a3 bytes];
  p_l = &self->_l;
  os_unfair_lock_lock(p_l);
  double v10 = *(double *)(v8 + 8 * a4);
  if (v10 <= a5) {
    double v10 = a5;
  }
  *(double *)(v8 + 8 * a4) = v10;

  os_unfair_lock_unlock(p_l);
}

- (void)commitWithProfiling:(BOOL)a3 graphExecutionTime:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      double v10 = [v9 objectAtIndexedSubscript:v8];

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __55__MLCDeviceGPU_commitWithProfiling_graphExecutionTime___block_invoke;
      v20[3] = &unk_1E6CB4B80;
      SEL v23 = a2;
      unint64_t v24 = v8;
      BOOL v25 = v4;
      v20[4] = self;
      id v21 = v10;
      id v22 = v7;
      id v11 = v10;
      [v11 addCompletedHandler:v20];
      id v12 = [(MLCDeviceGPU *)self gpuMPSCommandBufferList];
      [v12 objectAtIndexedSubscript:v8];
      id v13 = a2;
      unint64_t v15 = v14 = v4;
      [v15 commitAndContinue];

      int v16 = [(MLCDeviceGPU *)self gpuMPSCommandBufferList];
      id v17 = [v16 objectAtIndexedSubscript:v8];
      id v18 = [v17 rootCommandBuffer];
      id v19 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      [v19 setObject:v18 atIndexedSubscript:v8];

      BOOL v4 = v14;
      a2 = v13;

      ++v8;
    }
    while (v8 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

void __55__MLCDeviceGPU_commitWithProfiling_graphExecutionTime___block_invoke(uint64_t a1, void *a2)
{
  if ((unint64_t)([a2 status] - 5) <= 1)
  {
    id v3 = +[MLCLog framework];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__MLCDeviceGPU_commitWithProfiling_graphExecutionTime___block_invoke_cold_1(a1);
    }
  }
  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(a1 + 40) GPUEndTime];
    double v5 = v4;
    [*(id *)(a1 + 40) GPUStartTime];
    [*(id *)(a1 + 32) updateGraphExecutionTime:*(void *)(a1 + 48) atIndex:1 gpuTime:v5 - v6];
  }
}

- (void)commitWithCompletionHandler:(id)a3 enableProfiling:(BOOL)a4 graphExecutionTime:(id)a5 graphResultTensor:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  atomic_store([(MLCDeviceGPU *)self numDevicesToUse], &v28);
  [(MLCDeviceGPU *)self signalNextEvent];
  [(MLCDeviceGPU *)self waitForOthers];
  for (unint64_t i = 0; i < [(MLCDeviceGPU *)self numDevicesToUse]; ++i)
  {
    unint64_t v15 = [(MLCDeviceGPU *)self gpuCommandBufferList];
    int v16 = [v15 objectAtIndexedSubscript:i];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __97__MLCDeviceGPU_commitWithCompletionHandler_enableProfiling_graphExecutionTime_graphResultTensor___block_invoke;
    v18[3] = &unk_1E6CB4BA8;
    SEL v24 = a2;
    unint64_t v25 = i;
    v18[4] = self;
    BOOL v26 = a4;
    id v17 = v16;
    id v19 = v17;
    id v20 = v12;
    SEL v23 = v27;
    id v21 = v13;
    id v22 = v11;
    [v17 addCompletedHandler:v18];
    [(MLCDeviceGPU *)self commitDeviceAtIndex:i];
  }
  _Block_object_dispose(v27, 8);
}

void __97__MLCDeviceGPU_commitWithCompletionHandler_enableProfiling_graphExecutionTime_graphResultTensor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)([v3 status] - 5) > 1)
  {
    double v4 = 0;
  }
  else
  {
    double v4 = [v3 error];
    double v5 = +[MLCLog framework];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __97__MLCDeviceGPU_commitWithCompletionHandler_enableProfiling_graphExecutionTime_graphResultTensor___block_invoke_cold_1(a1);
    }
  }
  if (*(unsigned char *)(a1 + 96))
  {
    [*(id *)(a1 + 40) GPUEndTime];
    double v7 = v6;
    [*(id *)(a1 + 40) GPUStartTime];
    [*(id *)(a1 + 32) updateGraphExecutionTime:*(void *)(a1 + 48) atIndex:2 gpuTime:v7 - v8];
  }
  if (atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 0xFFFFFFFFFFFFFFFFLL) == 1)
  {
    uint64_t v9 = *(void **)(a1 + 56);
    if (v9)
    {
      id v10 = [v9 data];
      if (![v10 bytes])
      {
LABEL_13:

        goto LABEL_14;
      }
      id v11 = [*(id *)(a1 + 56) device];

      if (v11)
      {
        id v12 = *(void **)(a1 + 32);
        id v13 = *(void **)(a1 + 56);
        id v10 = [v13 data];
        objc_msgSend(v12, "readTensor:targetBuffer:", v13, objc_msgSend(v10, "bytes"));
        goto LABEL_13;
      }
    }
LABEL_14:
    if (*(unsigned char *)(a1 + 96))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
      uint64_t v14 = [*(id *)(a1 + 48) bytes];
      double v15 = *(double *)(v14 + 8) + *(double *)(v14 + 16);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    }
    else
    {
      double v15 = 0.0;
    }
    uint64_t v16 = *(void *)(a1 + 64);
    if (v16) {
      (*(void (**)(uint64_t, void, void *, double))(v16 + 16))(v16, *(void *)(a1 + 56), v4, v15);
    }
  }
}

- (void)commitAndWaitForCompletion:(id)a3 enableProfiling:(BOOL)a4 graphExecutionTime:(id)a5 graphResultTensor:(id)a6
{
  BOOL v8 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v40 = (void (**)(id, id, void *, double))a3;
  id v10 = a5;
  id v11 = a6;
  [(MLCDeviceGPU *)self signalNextEvent];
  [(MLCDeviceGPU *)self waitForOthers];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v12 = 0;
    do
    {
      id v13 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      uint64_t v14 = [v13 objectAtIndexedSubscript:v12];
      [v14 commit];

      ++v12;
    }
    while (v12 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
  id v41 = v10;
  double v15 = 0;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v16 = 0;
    do
    {
      id v17 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      id v18 = [v17 objectAtIndexedSubscript:v16];
      [v18 waitUntilCompleted];

      id v19 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      id v20 = [v19 objectAtIndexedSubscript:v16];

      if ((unint64_t)([v20 status] - 5) <= 1)
      {
        uint64_t v21 = [v20 error];

        id v22 = +[MLCLog framework];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          BOOL v30 = NSStringFromSelector(a2);
          [(MLCDeviceGPU *)self gpuCommandQueueList];
          int v31 = v38 = v11;
          int v32 = [v31 objectAtIndexedSubscript:v16];
          *(_DWORD *)buf = 138412802;
          objc_super v43 = v30;
          __int16 v44 = 2048;
          unint64_t v45 = v16;
          __int16 v46 = 2112;
          uint64_t v47 = v32;
          _os_log_error_impl(&dword_1DD0C9000, v22, OS_LOG_TYPE_ERROR, "%@: Internal Error: CommandBuffer failure: gpuCommandQueueList[%lu]=%@", buf, 0x20u);

          id v10 = v41;
          id v11 = v38;
        }
        double v15 = (void *)v21;
      }
      if (v8)
      {
        [v20 GPUEndTime];
        double v24 = v23;
        [v20 GPUStartTime];
        double v26 = v24 - v25;
        os_unfair_lock_lock(&self->_l);
        uint64_t v27 = [v10 bytes];
        [(MLCDeviceGPU *)self executionTimeInterval][8 * v16] = v26;
        double v28 = *(double *)(v27 + 8);
        uint64_t v29 = [(MLCDeviceGPU *)self executionTimeInterval];
        v29[v16] = v28 + v29[v16];
        os_unfair_lock_unlock(&self->_l);
      }

      ++v16;
    }
    while (v16 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
  if (v11)
  {
    id v33 = [v11 data];
    if ([v33 bytes])
    {
      unint64_t v34 = [v11 device];

      if (!v34) {
        goto LABEL_18;
      }
      id v33 = [v11 data];
      -[MLCDeviceGPU readTensor:targetBuffer:](self, "readTensor:targetBuffer:", v11, [v33 bytes]);
    }
  }
LABEL_18:
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v35 = 0;
    do
      [(MLCDeviceGPU *)self allocateCommandBufferForDeviceAtIndex:v35++];
    while (v35 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
  if (v40)
  {
    double v36 = 0.0;
    if (v8)
    {
      os_unfair_lock_lock(&self->_l);
      if ([(MLCDeviceGPU *)self numDevicesToUse])
      {
        unint64_t v37 = 0;
        do
        {
          if (v36 <= [(MLCDeviceGPU *)self executionTimeInterval][8 * v37]) {
            double v36 = [(MLCDeviceGPU *)self executionTimeInterval][8 * v37];
          }
          ++v37;
        }
        while (v37 < [(MLCDeviceGPU *)self numDevicesToUse]);
      }
      os_unfair_lock_unlock(&self->_l);
    }
    v40[2](v40, v11, v15, v36);
  }
}

- (void)commitAndWaitForCompletion:(id)a3
{
}

- (void)allocateDeviceHeapForGraph:(id)a3 forInference:(BOOL)a4
{
  BOOL v175 = a4;
  id v5 = a3;
  if ([v5 count])
  {
    NSUInteger bytes = 0;
    unint64_t v183 = 0;
    unint64_t v180 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      BOOL v8 = [(MLCDeviceGPU *)self deviceList];
      uint64_t v9 = [v8 objectAtIndexedSubscript:0];

      id v10 = [v5 objectAtIndexedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {

LABEL_6:
        if (!v175
          || ([v5 objectAtIndexedSubscript:v7],
              id v13 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v13,
              (isKindOfClass & 1) == 0))
        {
          unint64_t v178 = v6;
          uint64_t v184 = 0;
          uint64_t v185 = 0;
          double v15 = [v5 objectAtIndexedSubscript:v7];
          unint64_t v16 = [v15 sourceTensors];
          id v17 = [v16 objectAtIndexedSubscript:0];

          GPU_GetTensorWidthAndHeight(v17, &v185, &v184);
          id v18 = [v17 descriptor];
          id v19 = [v18 shape];
          unint64_t v20 = [v19 count];

          uint64_t v21 = [v17 descriptor];
          id v22 = [v21 shape];
          double v23 = [v22 objectAtIndexedSubscript:0];
          uint64_t v24 = [v23 unsignedIntegerValue];

          if (v20 < 2)
          {
            unint64_t v28 = v24;
            uint64_t v24 = 1;
          }
          else
          {
            double v25 = [v17 descriptor];
            double v26 = [v25 shape];
            uint64_t v27 = [v26 objectAtIndexedSubscript:1];
            unint64_t v28 = [v27 unsignedIntegerValue];
          }
          uint64_t v29 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:125 width:v185 height:v184 mipmapped:0];
          BOOL v30 = v29;
          if (v28 <= 4) {
            uint64_t v31 = 2;
          }
          else {
            uint64_t v31 = 3;
          }
          [v29 setTextureType:v31];
          [v30 setArrayLength:(v28 + 3) >> 2];
          __int16 v176 = v9;
          uint64_t v32 = [v9 heapTextureSizeAndAlignWithDescriptor:v30];
          unint64_t v34 = v183;
          if ((v32 + v33 - 1) / v33 * v33 * v24 > v183) {
            unint64_t v34 = (v32 + v33 - 1) / v33 * v33 * v24;
          }
          NSUInteger v35 = bytes;
          if (v33 > bytes) {
            NSUInteger v35 = v33;
          }
          NSUInteger bytesa = v35;
          unint64_t v183 = v34;
          double v36 = [v5 objectAtIndexedSubscript:v7];
          unint64_t v37 = [v36 resultTensors];
          id v38 = [v37 objectAtIndexedSubscript:0];

          GPU_GetTensorWidthAndHeight(v38, &v185, &v184);
          id v39 = [v38 descriptor];
          uint64_t v40 = [v39 shape];
          unint64_t v41 = [v40 count];

          id v42 = [v38 descriptor];
          objc_super v43 = [v42 shape];
          __int16 v44 = [v43 objectAtIndexedSubscript:0];
          uint64_t v45 = [v44 unsignedIntegerValue];

          if (v41 < 2)
          {
            unint64_t v49 = v45;
            uint64_t v45 = 1;
          }
          else
          {
            __int16 v46 = [v38 descriptor];
            uint64_t v47 = [v46 shape];
            uint64_t v48 = [v47 objectAtIndexedSubscript:1];
            unint64_t v49 = [v48 unsignedIntegerValue];
          }
          uint64_t v9 = v176;
          BOOL v50 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:125 width:v185 height:v184 mipmapped:0];

          if (v49 <= 4) {
            uint64_t v51 = 2;
          }
          else {
            uint64_t v51 = 3;
          }
          [v50 setTextureType:v51];
          [v50 setStorageMode:2];
          [v50 setUsage:3];
          [v50 setArrayLength:(v49 + 3) >> 2];
          uint64_t v52 = [v176 heapTextureSizeAndAlignWithDescriptor:v50];
          unint64_t v6 = v178;
          unint64_t v54 = v180;
          if ((v52 + v53 - 1) / v53 * v53 * v45 > v180) {
            unint64_t v54 = (v52 + v53 - 1) / v53 * v53 * v45;
          }
          if (v53 <= bytesa) {
            NSUInteger v55 = bytesa;
          }
          else {
            NSUInteger v55 = v53;
          }
          unint64_t v180 = v54;
          NSUInteger bytes = v55;
          if (v178 <= 3) {
            unint64_t v6 = 3;
          }
        }
        goto LABEL_60;
      }
      id v11 = [v5 objectAtIndexedSubscript:v7];
      objc_opt_class();
      char v12 = objc_opt_isKindOfClass();

      if (v12) {
        goto LABEL_6;
      }
      uint64_t v56 = [v5 objectAtIndexedSubscript:v7];
      objc_opt_class();
      uint64_t v57 = v9;
      if (objc_opt_isKindOfClass())
      {
      }
      else
      {
        uint64_t v58 = [v5 objectAtIndexedSubscript:v7];
        objc_opt_class();
        char v59 = objc_opt_isKindOfClass();

        if ((v59 & 1) == 0)
        {
          v69 = [v5 objectAtIndexedSubscript:v7];
          objc_opt_class();
          char v70 = objc_opt_isKindOfClass();

          if (v70)
          {
            unint64_t v179 = v6;
            uint64_t v71 = [v5 objectAtIndexedSubscript:v7];
            uint64_t v72 = [v71 sourceTensors];
            v73 = [v72 objectAtIndexedSubscript:0];

            v74 = [v5 objectAtIndexedSubscript:v7];
            uint64_t v75 = [v74 sourceTensors];
            uint64_t v76 = [v75 objectAtIndexedSubscript:1];

            v77 = [v73 descriptor];
            v78 = [v77 shape];
            uint64_t v79 = [v78 objectAtIndexedSubscript:0];
            uint64_t v80 = [v79 unsignedIntegerValue];

            unint64_t v177 = v73;
            id v81 = [v73 descriptor];
            v82 = [v81 shape];
            unint64_t v83 = [v82 objectAtIndexedSubscript:1];
            uint64_t v172 = [v83 unsignedIntegerValue];

            __int16 v174 = v76;
            v84 = [v76 descriptor];
            v85 = [v84 shape];
            v86 = [v85 objectAtIndexedSubscript:1];
            uint64_t v87 = [v86 unsignedIntegerValue];

            v88 = [v5 objectAtIndexedSubscript:v7];
            BOOL v89 = [v88 descriptor];
            LODWORD(v85) = [v89 hasAttentionBiases];

            uint64_t v90 = v87 + v85;
            long long v91 = [v88 descriptor];
            LODWORD(v85) = [v91 addsZeroAttention];

            uint64_t v92 = v90 + v85;
            long long v93 = [v88 descriptor];
            uint64_t v94 = [v93 headCount];

            uint64_t v171 = v80;
            uint64_t v95 = 4 * v172 * v80;
            unint64_t v96 = v95 * v92 * v94;
            unint64_t v97 = 1;
            if (!v175)
            {
              v98 = [v88 descriptor];
              uint64_t v99 = [v98 modelDimension];

              v100 = [v88 descriptor];
              uint64_t v173 = v92;
              uint64_t v101 = [v100 valueDimension];

              unint64_t v102 = v95 * v99;
              unint64_t v103 = v95 * v101;
              if (v95 * v101 <= (unint64_t)(4 * v173 * v171 * v99)) {
                unint64_t v103 = 4 * v173 * v171 * v99;
              }
              if (v102 <= v103) {
                unint64_t v102 = v103;
              }
              if (v102 > v96) {
                unint64_t v96 = v102;
              }
              unint64_t v97 = 6;
            }
            unint64_t v104 = v183;
            if (v96 > v183) {
              unint64_t v104 = v96;
            }
            unint64_t v183 = v104;
            unint64_t v6 = v179;
            if (v97 > v179) {
              unint64_t v6 = v97;
            }
            NSUInteger v105 = bytes;
            if (*MEMORY[0x1E4F14B00] > bytes) {
              NSUInteger v105 = *MEMORY[0x1E4F14B00];
            }
            NSUInteger bytes = v105;
          }
          goto LABEL_59;
        }
      }
      if (!v175)
      {
        uint64_t v60 = [v5 objectAtIndexedSubscript:v7];
        uint64_t v61 = [v60 sourceTensors];
        v62 = [v61 objectAtIndexedSubscript:0];

        v63 = [v62 descriptor];
        uint64_t v64 = objc_msgSend(v57, "heapBufferSizeAndAlignWithLength:options:", objc_msgSend(v63, "tensorAllocationSizeInBytes"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
        NSUInteger v66 = v65;

        unint64_t v67 = v183;
        if ((v64 + v66 - 1) / v66 * v66 > v183) {
          unint64_t v67 = (v64 + v66 - 1) / v66 * v66;
        }
        NSUInteger v68 = bytes;
        if (v66 > bytes) {
          NSUInteger v68 = v66;
        }
        NSUInteger bytes = v68;
        unint64_t v183 = v67;
        if (v6 <= 1) {
          unint64_t v6 = 1;
        }
      }
LABEL_59:
      uint64_t v9 = v57;
LABEL_60:

      if (++v7 >= (unint64_t)[v5 count]) {
        goto LABEL_63;
      }
    }
  }
  unint64_t v6 = 0;
  unint64_t v180 = 0;
  NSUInteger bytes = 0;
  unint64_t v183 = 0;
LABEL_63:
  if (v183 | v180)
  {
    if (v183 <= v180) {
      unint64_t v106 = v180;
    }
    else {
      unint64_t v106 = v183;
    }
    NSUInteger v107 = NSRoundUpToMultipleOfPageSize(bytes);
    unint64_t v108 = (v107 + v106 - 1) / v107 * v107;
    v109 = [(MLCDeviceGPU *)self gpuHeapTemporaryResourceAllocator];
    uint64_t v110 = [v109 count];

    if (!v110) {
      goto LABEL_73;
    }
    unint64_t v111 = 0;
    while (1)
    {
      v112 = [(MLCDeviceGPU *)self gpuHeapTemporaryResourceAllocator];
      unint64_t v113 = [v112 objectAtIndexedSubscript:v111];

      unint64_t v114 = [v113 heapSize];
      if (v114 >= v108 * v6) {
        break;
      }
      v115 = [(MLCDeviceGPU *)self deviceList];
      v111 += [v115 count];

      v116 = [(MLCDeviceGPU *)self gpuHeapTemporaryResourceAllocator];
      unint64_t v117 = [v116 count];

      if (v111 >= v117) {
        goto LABEL_73;
      }
    }
    if (v111 == 0xFFFFFFFF)
    {
LABEL_73:
      v118 = [(MLCDeviceGPU *)self gpuHeapTemporaryResourceAllocator];
      unint64_t v111 = [v118 count];

      v119 = [(MLCDeviceGPU *)self deviceList];
      uint64_t v120 = [v119 count];

      if (v120)
      {
        unint64_t v121 = 0;
        unint64_t v122 = v108 * v6;
        unint64_t v123 = v6;
        do
        {
          v124 = [(MLCDeviceGPU *)self deviceList];
          v125 = [v124 objectAtIndexedSubscript:v121];

          v126 = [[MLCDeviceGPUHeapAllocator alloc] initWithDevice:v125 heapSize:v122 resourceSize:v108 numResources:v123];
          [(MLCDeviceGPU *)self gpuHeapTemporaryResourceAllocator];
          v128 = unint64_t v127 = v108;
          [v128 setObject:v126 atIndexedSubscript:v111 + v121];

          unint64_t v108 = v127;
          ++v121;
          v129 = [(MLCDeviceGPU *)self deviceList];
          unint64_t v130 = [v129 count];
        }
        while (v121 < v130);
      }
    }
    if ([v5 count])
    {
      uint64_t v131 = 0;
      while (1)
      {
        v132 = [v5 objectAtIndexedSubscript:v131];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        v133 = [v5 objectAtIndexedSubscript:v131];
        objc_opt_class();
        char v134 = objc_opt_isKindOfClass();

        if (v134) {
          goto LABEL_81;
        }
        v149 = [v5 objectAtIndexedSubscript:v131];
        char v150 = [v149 skipLayer];

        if ((v150 & 1) == 0)
        {
          v151 = [v5 objectAtIndexedSubscript:v131];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_91;
          }
          v152 = [v5 objectAtIndexedSubscript:v131];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {

LABEL_91:
          }
          else
          {
            v161 = [v5 objectAtIndexedSubscript:v131];
            objc_opt_class();
            char v162 = objc_opt_isKindOfClass();

            if ((v162 & 1) == 0)
            {
              v163 = [(MLCDeviceGPU *)self deviceList];
              uint64_t v164 = [v163 count];

              if (v164)
              {
                unint64_t v165 = 0;
                do
                {
                  id v166 = [v5 objectAtIndexedSubscript:v131];
                  id v167 = [v166 deviceOps];
                  char v168 = [v167 objectAtIndexedSubscript:v165];

                  [v168 setTemporaryHeapIndex:0];
                  ++v165;
                  id v169 = [(MLCDeviceGPU *)self deviceList];
                  unint64_t v170 = [v169 count];
                }
                while (v165 < v170);
              }
              goto LABEL_95;
            }
          }
          v153 = [(MLCDeviceGPU *)self deviceList];
          uint64_t v154 = [v153 count];

          if (v154)
          {
            unint64_t v155 = 0;
            do
            {
              v156 = [v5 objectAtIndexedSubscript:v131];
              v157 = [v156 deviceOps];
              v158 = [v157 objectAtIndexedSubscript:v155];

              [v158 setTemporaryHeapIndex:v111 + v155];
              ++v155;
              v159 = [(MLCDeviceGPU *)self deviceList];
              unint64_t v160 = [v159 count];
            }
            while (v155 < v160);
          }
        }
LABEL_95:
        if (++v131 >= (unint64_t)[v5 count]) {
          goto LABEL_102;
        }
      }

LABEL_81:
      v135 = [(MLCDeviceGPU *)self deviceList];
      uint64_t v136 = [v135 count];

      if (v136)
      {
        unint64_t v137 = 0;
        do
        {
          v138 = [v5 objectAtIndexedSubscript:v131];
          v139 = [v138 deviceOps];
          v140 = [v139 objectAtIndexedSubscript:v137];

          if (([v140 isMPSGraph] & 1) == 0)
          {
            v141 = [v140 forwardKernel];
            v142 = [(MLCDeviceGPU *)self gpuHeapTemporaryResourceAllocator];
            v143 = [v142 objectAtIndexedSubscript:v111 + v137];
            [v141 setDestinationImageAllocator:v143];

            v144 = [v140 gradientKernel];

            v145 = [(MLCDeviceGPU *)self gpuHeapTemporaryResourceAllocator];
            v146 = [v145 objectAtIndexedSubscript:v111 + v137];
            [v144 setDestinationImageAllocator:v146];
          }
          ++v137;
          v147 = [(MLCDeviceGPU *)self deviceList];
          unint64_t v148 = [v147 count];
        }
        while (v137 < v148);
      }
      goto LABEL_95;
    }
  }
LABEL_102:
}

- (BOOL)needToAllocateDeviceMemoryForTensor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 descriptor];
  unint64_t v6 = [v5 shape];
  if ([v6 count] == 1)
  {
    uint64_t v7 = 1;
  }
  else
  {
    BOOL v8 = [v4 descriptor];
    uint64_t v9 = [v8 shape];
    id v10 = [v9 objectAtIndexedSubscript:0];
    uint64_t v7 = [v10 unsignedIntegerValue];
  }
  BOOL v11 = [(MLCDeviceGPU *)self needToAllocateDeviceMemoryForTensor:v4 batchSize:v7];

  return v11;
}

- (BOOL)needToAllocateDeviceMemoryForTensor:(id)a3 batchSize:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 deviceMemory];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [v6 device];
    if (!v9) {
      goto LABEL_5;
    }
    id v10 = (void *)v9;
    BOOL v11 = [v6 device];
    char v12 = [v11 computeEngine];
    BOOL v13 = [(MLCDeviceGPU *)self isEqual:v12];

    if (v13)
    {
      LOBYTE(v14) = 0;
    }
    else
    {
LABEL_5:
      uint64_t v15 = [v6 calculateBatchSizeToUse:a4];
      unint64_t v16 = [(MLCDeviceGPU *)self numDevicesToUse];
      id v17 = [v6 descriptor];
      unint64_t v18 = [v17 tensorAllocationSizeInBytes];
      if (v15 == 1) {
        unint64_t v19 = v18;
      }
      else {
        unint64_t v19 = v18 / v16;
      }

      unint64_t v20 = [v6 deviceMemory];
      unint64_t v14 = [v20 count];

      if (v14)
      {
        unint64_t v21 = 0;
        do
        {
          id v22 = [v6 deviceMemory];
          double v23 = [v22 objectAtIndexedSubscript:v21];

          unint64_t v14 = [v23 length];
          BOOL v24 = v14 >= v19;
          LOBYTE(v14) = v14 < v19;
          if (!v24) {
            break;
          }
          ++v21;
          double v25 = [v6 deviceMemory];
          unint64_t v26 = [v25 count];
        }
        while (v21 < v26);
      }
    }
  }
  else
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (void)allocateDeviceMemoryForTensor:(id)a3
{
  id v4 = a3;
  -[MLCDeviceGPU allocateDeviceMemoryForTensor:batchSize:](self, "allocateDeviceMemoryForTensor:batchSize:", v4, [v4 calculateBatchSizeToUse]);
}

- (void)allocateDeviceMemoryForTensor:(id)a3 batchSize:(unint64_t)a4
{
  id v15 = a3;
  unint64_t v6 = [v15 calculateBatchSizeToUse:a4];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [v15 setDeviceMemory:v7];

  unint64_t v8 = [(MLCDeviceGPU *)self numDevicesToUse];
  unint64_t v9 = v8;
  if (v8 < 2 || v6 < 2)
  {
    if (!v8) {
      goto LABEL_9;
    }
  }
  else if (!(v6 % v8))
  {
    v6 /= v8;
  }
  uint64_t v10 = 0;
  do
  {
    BOOL v11 = [(MLCDeviceGPU *)self deviceList];
    char v12 = [v11 objectAtIndexedSubscript:v10];

    BOOL v13 = [v15 deviceMemory];
    unint64_t v14 = [(MLCDeviceGPU *)self allocateDeviceMemoryForTensor:v15 device:v12 count:v6];
    [v13 addObject:v14];

    ++v10;
  }
  while (v9 != v10);
LABEL_9:
}

- (void)selectDevicesWithBatchSize:(unint64_t)a3
{
}

- (void)selectDevicesWithBatchSize:(unint64_t)a3 calledfromBindAndWrite:(BOOL)a4
{
  uint64_t v7 = [(MLCDeviceGPU *)self deviceList];
  unint64_t v8 = [v7 count];

  if (a3 && v8 >= 2 && a3 % v8 && a3 > 1) {
    unint64_t v8 = 1;
  }
  if ([(MLCDeviceGPU *)self numDevicesUsedWithFirstBatch])
  {
    unint64_t v10 = [(MLCDeviceGPU *)self numDevicesUsedWithFirstBatch];
    unint64_t v11 = v10;
    if (a3 != 1 || !a4)
    {
      unint64_t v11 = v8;
      if (v8 > v10) {
        unint64_t v11 = [(MLCDeviceGPU *)self numDevicesUsedWithFirstBatch];
      }
    }
  }
  else
  {
    [(MLCDeviceGPU *)self setNumDevicesUsedWithFirstBatch:v8];
    unint64_t v11 = v8;
  }

  [(MLCDeviceGPU *)self setNumDevicesToUse:v11];
}

- (void)deallocateDeviceMemoryForTensor:(id)a3
{
  id v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceGPU deallocateDeviceMemoryForTensor:](a2);
  }
}

- (id)getHostPointerIfUnifiedDeviceMemory:(id)a3
{
  id v4 = a3;
  if ([(MLCDeviceGPU *)self isAppleSoCGPU])
  {
    uint64_t v5 = [v4 data];
    if (v5)
    {
      unint64_t v6 = (void *)v5;
      uint64_t v7 = [v4 data];
      if (!v7)
      {
LABEL_6:

        goto LABEL_8;
      }
      id v8 = [v4 data];
      uint64_t v9 = [v8 bytes];
      unint64_t v10 = [v4 deviceMemory];
      id v11 = [v10 objectAtIndexedSubscript:0];
      uint64_t v12 = [v11 contents];

      uint64_t v7 = 0;
      if (v9 != v12) {
        goto LABEL_8;
      }
    }
    BOOL v13 = (void *)MEMORY[0x1E4F1C9B8];
    unint64_t v6 = [v4 deviceMemory];
    id v14 = [v6 objectAtIndexedSubscript:0];
    uint64_t v15 = [v14 contents];
    unint64_t v16 = [v4 descriptor];
    uint64_t v7 = objc_msgSend(v13, "dataWithBytesNoCopy:length:freeWhenDone:", v15, objc_msgSend(v16, "tensorAllocationSizeInBytes"), 0);

    goto LABEL_6;
  }
  uint64_t v7 = 0;
LABEL_8:

  return v7;
}

- (BOOL)shareDeviceMemoryWithResultTensor:(id)a3 sourceTensor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6 != v5)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v5 setDeviceMemory:v7];

    id v8 = [v6 deviceMemory];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      do
      {
        id v11 = [v5 deviceMemory];
        uint64_t v12 = [v6 deviceMemory];
        BOOL v13 = [v12 objectAtIndexedSubscript:v10];
        [v11 addObject:v13];

        ++v10;
        id v14 = [v6 deviceMemory];
        unint64_t v15 = [v14 count];
      }
      while (v10 < v15);
    }
    unint64_t v16 = [v6 sharedMemoryTensor];
    if (v16)
    {
      id v17 = [v6 sharedMemoryTensor];
      [v5 setSharedMemoryTensor:v17];
    }
    else
    {
      [v5 setSharedMemoryTensor:v6];
    }
  }
  return 1;
}

- (void)multiDeviceTensorReduction:(id)a3 sourceBuffer:(void *)a4 targetBuffer:(void *)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 descriptor];
  uint64_t v10 = [v9 elementCount];

  if (!v10) {
    goto LABEL_14;
  }
  unint64_t v11 = 0;
  while (1)
  {
    uint64_t v12 = [v8 descriptor];
    int v13 = [v12 dataType];

    if (v13 == 1)
    {
      *((float *)a5 + v11) = *((float *)a4 + v11) + *((float *)a5 + v11);
      goto LABEL_9;
    }
    if (v13 == 3)
    {
      *((short float *)a5 + v11) = *((short float *)a5 + v11) + *((short float *)a4 + v11);
      goto LABEL_9;
    }
    if (v13 != 6) {
      break;
    }
    *((unsigned char *)a5 + v11) += *((unsigned char *)a4 + v11);
LABEL_9:
    ++v11;
    id v14 = [v8 descriptor];
    unint64_t v15 = [v14 elementCount];

    if (v11 >= v15) {
      goto LABEL_14;
    }
  }
  unint64_t v16 = +[MLCLog framework];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[MLCDeviceGPU multiDeviceTensorReduction:sourceBuffer:targetBuffer:](a2);
  }

LABEL_14:
}

- (id)readTensor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 descriptor];
  unint64_t v6 = [v5 tensorAllocationSizeInBytes];

  uint64_t v7 = [v4 descriptor];
  size_t v8 = v6 / [v7 elementCount];

  uint64_t v9 = [v4 descriptor];
  uint64_t v10 = malloc_type_calloc([v9 elementCount], v8, 0x64A4C2DEuLL);

  [(MLCDeviceGPU *)self readTensor:v4 targetBuffer:v10];
  unint64_t v11 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)[v11 dataWithBytesNoCopy:v10 length:v6 freeWhenDone:1];
}

- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 descriptor];
  size_t v8 = [v7 shape];
  if ([v8 count] == 1)
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v10 = [v6 descriptor];
    unint64_t v11 = [v10 shape];
    uint64_t v12 = [v11 objectAtIndexedSubscript:0];
    uint64_t v9 = [v12 unsignedIntegerValue];
  }
  int v13 = [(MLCDeviceGPU *)self readTensor:v6 fromDeviceIndex:a4 batchSize:v9];

  return v13;
}

- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 batchSize:(unint64_t)a5
{
  id v8 = a3;
  size_t v9 = [(id)objc_opt_class() calculateImageSizeForTensor:v8] * a5;
  uint64_t v10 = malloc_type_malloc(v9, 0x9BD9B4FCuLL);
  [(MLCDeviceGPU *)self readTensor:v8 fromDeviceIndex:a4 targetBuffer:v10 batchSize:a5];

  unint64_t v11 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)[v11 dataWithBytesNoCopy:v10 length:v9 freeWhenDone:1];
}

- (void)readTensor:(id)a3 targetBuffer:(void *)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  __dst = (char *)a4;
  if (!a4)
  {
    unint64_t v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceGPU readTensor:targetBuffer:](a2);
    }
    goto LABEL_9;
  }
  unint64_t context = [v7 calculateBatchSizeToUse];
  if ([v8 isLayerParameter])
  {
    size_t v9 = [v8 childLayers];
    uint64_t v10 = [v9 objectAtIndexedSubscript:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      uint64_t v12 = [v11 deviceOps];
      int v13 = [(id)v12 objectAtIndexedSubscript:0];

      LOBYTE(v12) = [v13 isMPSGraph];
      id v14 = [v11 weights];
      unint64_t v15 = v14;
      if (v12)
      {

        if (v15 != v8)
        {
          unint64_t v16 = [v13 exportableState];
          id v17 = [v16 objectAtIndexedSubscript:1];
          unint64_t v18 = (const void *)[v17 contents];
          unint64_t v19 = [v8 descriptor];
          memcpy(a4, v18, [v19 tensorAllocationSizeInBytes]);

LABEL_64:
          goto LABEL_65;
        }
        contexta = (void *)MEMORY[0x1E01B11E0]();
        objc_super v43 = [v13 exportableState];
        id v44 = [v43 objectAtIndexedSubscript:0];
        uint64_t v45 = (void *)[v44 contents];

        size_t __n = (size_t)v45;
        if (v45 == a4)
        {
          uint64_t v56 = [v8 descriptor];
          uint64_t v57 = malloc_type_malloc([v56 tensorAllocationSizeInBytes], 0xA8C01C0BuLL);

          __int16 v46 = [v13 exportableState];
          id v47 = [v46 objectAtIndexedSubscript:0];
          uint64_t v58 = (const void *)[v47 contents];
          char v59 = [v8 descriptor];
          uint64_t v83 = (uint64_t)v57;
          memcpy(v57, v58, [v59 tensorAllocationSizeInBytes]);
        }
        else
        {
          __int16 v46 = [v13 exportableState];
          id v47 = [v46 objectAtIndexedSubscript:0];
          uint64_t v83 = [v47 contents];
        }

        uint64_t v60 = [v11 descriptor];
        int v61 = [v60 isConvolutionTranspose];

        v62 = [v11 descriptor];
        uint64_t v63 = [v62 kernelWidth];
        v86 = [v11 descriptor];
        uint64_t v64 = [v86 kernelHeight];
        NSUInteger v65 = [v11 descriptor];
        v85 = v65;
        if (v61)
        {
          unint64_t v66 = [v65 outputFeatureChannelCount];
          v84 = [v11 descriptor];
          unint64_t v80 = v66 / [v84 groupCount];
          unint64_t v67 = [v11 descriptor];
          uint64_t v78 = [v67 inputFeatureChannelCount];
          NSUInteger v68 = [v11 weights];
          v69 = [v68 descriptor];
          LODWORD(v75) = [v69 dataType];
          char v70 = (void *)v83;
          +[MLCDataHelper convertSourceHWOI:v83 toResultOIHW:__dst width:v63 height:v64 inputFeatureChannelCount:v80 outputFeatureChannelCount:v78 dataType:v75];
        }
        else
        {
          uint64_t v79 = v64;
          uint64_t v81 = v63;
          unint64_t v71 = [v65 inputFeatureChannelCount];
          v84 = [v11 descriptor];
          unint64_t v76 = v71 / [v84 groupCount];
          unint64_t v67 = [v11 descriptor];
          v69 = (void *)[v67 usesDepthwiseConvolution];
          NSUInteger v68 = [v11 descriptor];
          unint64_t v72 = [v68 outputFeatureChannelCount];
          int v77 = (int)v69;
          v82 = v62;
          if (v69)
          {
            v69 = [v11 descriptor];
            v72 /= (unint64_t)[v69 inputFeatureChannelCount];
          }
          v73 = [v11 weights];
          v74 = [v73 descriptor];
          LODWORD(v75) = [v74 dataType];
          char v70 = (void *)v83;
          +[MLCDataHelper convertSourceHWIO:v83 toResultOIHW:__dst width:v81 height:v79 inputFeatureChannelCount:v76 outputFeatureChannelCount:v72 dataType:v75];

          v62 = v82;
          if (!v77) {
            goto LABEL_60;
          }
        }

LABEL_60:
        if ((char *)__n == __dst && v70) {
          free(v70);
        }
        goto LABEL_64;
      }
      uint64_t v40 = [v13 exportableState];
      unint64_t v41 = v40;
      if (v15 == v8) {
        [v40 weights];
      }
      else {
      uint64_t v48 = [v40 biases];
      }

      unint64_t v49 = [v11 descriptor];
      if ([v49 isConvolutionTranspose])
      {
        BOOL v50 = [v11 weights];

        if (v50 == v8)
        {
          uint64_t v51 = (void *)MEMORY[0x1E4F1C9B8];
          uint64_t v52 = [v8 descriptor];
          NSUInteger v53 = objc_msgSend(v51, "dataWithBytesNoCopy:length:freeWhenDone:", a4, objc_msgSend(v52, "tensorAllocationSizeInBytes"), 0);
          unint64_t v54 = [v8 descriptor];
          [(MLCDeviceGPU *)self rotateAndCopyMTLBuffer:v48 toNSData:v53 withTensorDescriptor:v54];

LABEL_52:
          goto LABEL_64;
        }
      }
      else
      {
      }
      NSUInteger v55 = (const void *)[v48 contents];
      uint64_t v52 = [v8 descriptor];
      memcpy(a4, v55, [v52 tensorAllocationSizeInBytes]);
      goto LABEL_52;
    }
  }
  unint64_t v21 = [v8 deviceMemory];
  id v22 = [v21 objectAtIndexedSubscript:0];
  int v23 = [v22 conformsToProtocol:&unk_1F38930A0];

  if (!v23)
  {
    if (context >= [(MLCDeviceGPU *)self numDevicesToUse]
      || [v8 multiDeviceReductionType])
    {
      unint64_t v28 = [v8 descriptor];
      size_t v29 = [v28 tensorAllocationSizeInBytes];

      if ([(MLCDeviceGPU *)self numDevicesToUse])
      {
        unint64_t v30 = 0;
        unint64_t v31 = 0;
        do
        {
          if ([v8 multiDeviceReductionType]
            && [(MLCDeviceGPU *)self numDevicesToUse] > 1)
          {
            if (!v31) {
              bzero(__dst, v29);
            }
            id v32 = [(MLCDeviceGPU *)self readTensor:v8 fromDeviceIndex:v31 batchSize:context];
            -[MLCDeviceGPU multiDeviceTensorReduction:sourceBuffer:targetBuffer:](self, "multiDeviceTensorReduction:sourceBuffer:targetBuffer:", v8, [v32 bytes], __dst);
          }
          else
          {
            [(MLCDeviceGPU *)self readTensor:v8 fromDeviceIndex:v31 targetBuffer:&__dst[v30 / [(MLCDeviceGPU *)self numDevicesToUse]] batchSize:context / [(MLCDeviceGPU *)self numDevicesToUse]];
          }
          ++v31;
          v30 += v29;
        }
        while (v31 < [(MLCDeviceGPU *)self numDevicesToUse]);
      }
      goto LABEL_65;
    }
    unint64_t v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v42 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v92 = v42;
      __int16 v93 = 2048;
      unint64_t v94 = context;
      __int16 v95 = 2048;
      unint64_t v96 = [(MLCDeviceGPU *)self numDevicesToUse];
      _os_log_error_impl(&dword_1DD0C9000, v20, OS_LOG_TYPE_ERROR, "%@: Reading tensor with batchSize %lu from %lu GPUs without reduction", buf, 0x20u);
    }
LABEL_9:

    goto LABEL_65;
  }
  BOOL v24 = [v8 descriptor];
  size_t v25 = [v24 tensorAllocationSizeInBytes];

  unint64_t v26 = [(MLCDeviceGPU *)self numDevicesToUse];
  unint64_t v27 = v26;
  if (context == 1 && v26 == 2)
  {
    if ([v8 multiDeviceReductionType]) {
      unint64_t v27 = 2;
    }
    else {
      unint64_t v27 = 1;
    }
  }
  else if (!v26)
  {
    goto LABEL_65;
  }
  unint64_t v33 = 0;
  uint64_t v34 = 0;
  do
  {
    if ([v8 multiDeviceReductionType]
      && [(MLCDeviceGPU *)self numDevicesToUse] > 1)
    {
      if (!v34) {
        bzero(__dst, v25);
      }
      id v39 = [(MLCDeviceGPU *)self readTensor:v8 fromDeviceIndex:v34 batchSize:context];
      -[MLCDeviceGPU multiDeviceTensorReduction:sourceBuffer:targetBuffer:](self, "multiDeviceTensorReduction:sourceBuffer:targetBuffer:", v8, [v39 bytes], __dst);
    }
    else
    {
      NSUInteger v35 = &__dst[v33 / v27];
      double v36 = [v8 deviceMemory];
      id v37 = [v36 objectAtIndexedSubscript:v34];
      id v38 = (char *)[v37 contents];

      if (v35 != v38) {
        memcpy(v35, v38, v25 / v27);
      }
    }
    ++v34;
    v33 += v25;
  }
  while (v27 != v34);
LABEL_65:
}

- (void)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 targetBuffer:(void *)a5 batchSize:(unint64_t)a6
{
}

- (void)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 targetBuffer:(void *)a5 batchSize:(unint64_t)a6 reduceOverBatch:(BOOL)a7
{
  id v36 = a3;
  id v11 = [v36 deviceMemory];
  uint64_t v12 = [v11 objectAtIndexedSubscript:a4];
  char v13 = [v12 conformsToProtocol:&unk_1F38930A0];

  id v14 = [v36 deviceMemory];
  unint64_t v15 = [v14 objectAtIndexedSubscript:a4];

  if (v13)
  {
    unint64_t v16 = (void *)[v15 contents];
    if (v16 != a5)
    {
      id v17 = v16;
      uint64_t v18 = [(id)objc_opt_class() calculateImageSizeForTensor:v36];
      memcpy(a5, v17, v18 * a6);
    }
  }
  else
  {
    size_t v19 = [(id)objc_opt_class() calculateImageSizeForTensor:v36];
    unint64_t v20 = v19;
    if (a7)
    {
      unint64_t v21 = (float *)malloc_type_malloc(v19, 0xAAF1080AuLL);
      id v22 = v15;
      if (a6)
      {
        int v23 = v22;
        uint64_t v24 = 0;
        if (v20 >> 2 <= 1) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = v20 >> 2;
        }
        do
        {
          unint64_t v26 = [v23 objectAtIndexedSubscript:v24];
          unint64_t v27 = v26;
          if (v24)
          {
            [v26 readBytes:v21 dataLayout:1 imageIndex:0];
            if (v20 >= 4)
            {
              unint64_t v28 = v21;
              size_t v29 = (float *)a5;
              uint64_t v30 = v25;
              do
              {
                float v31 = *v28++;
                float *v29 = v31 + *v29;
                ++v29;
                --v30;
              }
              while (v30);
            }
          }
          else
          {
            [v26 readBytes:a5 dataLayout:1 imageIndex:0];
          }

          ++v24;
        }
        while (v24 != a6);
      }
      free(v21);
    }
    else
    {
      id v32 = v15;
      if (a6)
      {
        unint64_t v33 = v32;
        uint64_t v34 = 0;
        do
        {
          NSUInteger v35 = [v33 objectAtIndexedSubscript:v34];
          [v35 readBytes:a5 dataLayout:1 imageIndex:0];
          a5 = (char *)a5 + v20;

          ++v34;
        }
        while (a6 != v34);
      }
    }
  }
}

- (void)dispatchReadTensor:(id)a3 targetBuffer:(void *)a4 batchSize:(unint64_t)a5
{
  id v10 = a3;
  id v8 = [v10 deviceMemory];
  size_t v9 = [v8 objectAtIndexedSubscript:0];

  if ([(MLCDeviceGPU *)self numDevicesToUse] != 1
    || (void *)[v9 contents] != a4)
  {
    [(MLCDeviceGPU *)self dispatchReadTensorFromAllDevices:v10 targetBuffer:a4 batchSize:a5];
  }
}

- (void)dispatchReadTensorFromAllDevices:(id)a3 targetBuffer:(void *)a4 batchSize:(unint64_t)a5
{
  id v32 = a3;
  id v8 = [v32 deviceMemory];
  id v9 = [v8 objectAtIndexedSubscript:0];
  id v10 = (void *)[v9 contents];

  if (v10 == a4 && [(MLCDeviceGPU *)self numDevicesToUse] < 2)
  {
    id v11 = [v32 deviceMemory];
    id v22 = [v11 objectAtIndexedSubscript:0];
    int v23 = [(MLCDeviceGPU *)self gpuCommandBufferList];
    uint64_t v24 = [v23 objectAtIndexedSubscript:0];
    +[MLCGPUHelper synchronizeResource:v22 commandBuffer:v24];
  }
  else
  {
    id v11 = [v32 descriptor];
    uint64_t v12 = [v11 shape];
    unint64_t v13 = [v12 count] != 1;

    id v14 = [v11 shape];
    unint64_t v15 = [v14 count];

    uint64_t v16 = 1;
    if (v15 > v13)
    {
      do
      {
        id v17 = [v11 shape];
        uint64_t v18 = [v17 objectAtIndexedSubscript:v13];
        v16 *= [v18 unsignedIntegerValue];

        ++v13;
        size_t v19 = [v11 shape];
        unint64_t v20 = [v19 count];
      }
      while (v13 < v20);
    }
    uint64_t v21 = 0;
    switch([v11 dataType])
    {
      case 1u:
        uint64_t v21 = 4 * v16;
        break;
      case 3u:
        uint64_t v21 = 2 * v16;
        break;
      case 4u:
      case 6u:
        uint64_t v21 = v16;
        break;
      default:
        break;
    }
    unint64_t v25 = v21 * a5;
    unint64_t v26 = [(MLCDeviceGPU *)self deviceList];
    id v22 = [v26 objectAtIndexedSubscript:0];

    int v23 = (void *)[v22 newBufferWithBytesNoCopy:a4 length:NSRoundUpToMultipleOfPageSize(v21 * a5) options:0 deallocator:0];
    unint64_t v27 = [(MLCDeviceGPU *)self numDevicesToUse];
    if (a5 != 1 && v27 != 1) {
      unint64_t v25 = a5 / [(MLCDeviceGPU *)self numDevicesToUse] * v21;
    }
    unint64_t v28 = [(MLCDeviceGPU *)self gpuCommandBufferList];
    size_t v29 = [v28 objectAtIndexedSubscript:0];
    uint64_t v24 = [v29 blitCommandEncoder];

    uint64_t v30 = [v32 deviceMemory];
    float v31 = [v30 objectAtIndexedSubscript:0];
    [v24 copyFromBuffer:v31 sourceOffset:0 toBuffer:v23 destinationOffset:0 size:v25];

    [v24 endEncoding];
  }
}

- (void)broadcastTensor:(id)a3
{
  id v10 = a3;
  id v4 = [v10 descriptor];
  id v5 = [v4 shape];
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
  [(MLCDeviceGPU *)self broadcastTensor:v10 batchSize:v6];
}

- (void)broadcastTensor:(id)a3 batchSize:(unint64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = [(MLCDeviceGPU *)self numDevicesToUse];
  unint64_t v9 = [(MLCDeviceGPU *)self numDevicesToUse];
  id v10 = [v7 deviceMemory];
  uint64_t v11 = [v10 count];

  if (v9 != v11)
  {
    float v31 = +[MLCLog framework];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = NSStringFromSelector(a2);
      unint64_t v33 = [v7 deviceMemory];
      int v34 = 138412802;
      NSUInteger v35 = v32;
      __int16 v36 = 2048;
      uint64_t v37 = [v33 count];
      __int16 v38 = 2048;
      unint64_t v39 = [(MLCDeviceGPU *)self numDevicesToUse];
      _os_log_error_impl(&dword_1DD0C9000, v31, OS_LOG_TYPE_ERROR, "%@: tensor deviceMemory count:%lu not matching numDeviceUsed:%lu", (uint8_t *)&v34, 0x20u);
    }
    goto LABEL_25;
  }
  uint64_t v12 = [v7 deviceMemory];
  unint64_t v13 = [v12 objectAtIndexedSubscript:0];
  int v14 = [v13 conformsToProtocol:&unk_1F38930A0];

  if (!v14)
  {
    float v31 = +[MLCLog framework];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceGPU broadcastTensor:batchSize:](a2);
    }
LABEL_25:

    goto LABEL_26;
  }
  unint64_t v15 = a4 / v8;
  if (a4 % v8) {
    char v16 = 0;
  }
  else {
    char v16 = -1;
  }
  if (a4 % v8) {
    unint64_t v15 = a4;
  }
  if (v8 < 2)
  {
    char v16 = 0;
    unint64_t v15 = a4;
  }
  if (a4 >= 2) {
    char v17 = v16;
  }
  else {
    char v17 = 0;
  }
  if (a4 >= 2) {
    unint64_t v18 = v15;
  }
  else {
    unint64_t v18 = a4;
  }
  uint64_t v19 = [(id)objc_opt_class() calculateImageSizeForTensor:v7];
  id v20 = [v7 data];
  uint64_t v21 = (char *)[v20 bytes];

  id v22 = (void *)MEMORY[0x1E01B11E0]();
  uint64_t v23 = 0;
  size_t v24 = v19 * v18;
  if (v17) {
    size_t v25 = v24;
  }
  else {
    size_t v25 = 0;
  }
  do
  {
    unint64_t v26 = [v7 deviceMemory];
    unint64_t v27 = [v26 objectAtIndexedSubscript:v23];

    id v28 = v27;
    size_t v29 = memcpy((void *)[v28 contents], v21, v24);
    uint64_t v30 = (void *)MEMORY[0x1E01B11E0](v29);
    +[MLCGPUHelper didModifyRange:buffer:](MLCGPUHelper, "didModifyRange:buffer:", 0, v24, v28);
    v21 += v25;

    ++v23;
  }
  while (v8 != v23);
LABEL_26:
}

- (void)dispatchBroadcastTensor:(id)a3
{
  id v10 = a3;
  id v4 = [v10 descriptor];
  id v5 = [v4 shape];
  if ([v5 count] == 1)
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = [v10 descriptor];
    unint64_t v8 = [v7 shape];
    unint64_t v9 = [v8 objectAtIndexedSubscript:0];
    uint64_t v6 = [v9 unsignedIntegerValue];
  }
  [(MLCDeviceGPU *)self dispatchBroadcastTensor:v10 batchSize:v6];
}

- (void)dispatchBroadcastTensor:(id)a3 batchSize:(unint64_t)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = [(MLCDeviceGPU *)self numDevicesToUse];
  unint64_t v9 = [(MLCDeviceGPU *)self numDevicesToUse];
  id v10 = [v7 deviceMemory];
  uint64_t v11 = [v10 count];

  if (v9 != v11)
  {
    float v31 = +[MLCLog framework];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = NSStringFromSelector(a2);
      unint64_t v33 = [v7 deviceMemory];
      int v44 = 138412802;
      uint64_t v45 = v32;
      __int16 v46 = 2048;
      uint64_t v47 = [v33 count];
      __int16 v48 = 2048;
      unint64_t v49 = [(MLCDeviceGPU *)self numDevicesToUse];
      _os_log_error_impl(&dword_1DD0C9000, v31, OS_LOG_TYPE_ERROR, "%@: tensor deviceMemory count:%lu not matching numDeviceUsed:%lu", (uint8_t *)&v44, 0x20u);
    }
    goto LABEL_22;
  }
  uint64_t v12 = [v7 deviceMemory];
  unint64_t v13 = [v12 objectAtIndexedSubscript:0];
  int v14 = [v13 conformsToProtocol:&unk_1F38930A0];

  if (!v14)
  {
    float v31 = +[MLCLog framework];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceGPU broadcastTensor:batchSize:](a2);
    }
LABEL_22:

    goto LABEL_29;
  }
  unint64_t v15 = a4 / v8;
  if (a4 % v8) {
    char v16 = 0;
  }
  else {
    char v16 = -1;
  }
  if (a4 % v8) {
    unint64_t v15 = a4;
  }
  if (v8 < 2)
  {
    char v16 = 0;
    unint64_t v15 = a4;
  }
  if (a4 >= 2) {
    char v17 = v16;
  }
  else {
    char v17 = 0;
  }
  if (a4 >= 2) {
    unint64_t v18 = v15;
  }
  else {
    unint64_t v18 = a4;
  }
  size_t v19 = [(id)objc_opt_class() calculateImageSizeForTensor:v7] * v18;
  if ([(MLCDeviceGPU *)self isAppleSoCGPU])
  {
    uint64_t v20 = MEMORY[0x1E01B11E0]();
    uint64_t v21 = [(MLCDeviceGPU *)self deviceList];
    id v22 = [v21 objectAtIndexedSubscript:0];

    id v23 = [v7 data];
    size_t v24 = objc_msgSend(v22, "newBufferWithBytes:length:options:", objc_msgSend(v23, "bytes"), v19, 0);

    size_t v25 = [(MLCDeviceGPU *)self gpuCommandBufferList];
    unint64_t v26 = [v25 objectAtIndexedSubscript:0];
    unint64_t v27 = [v26 blitCommandEncoder];

    id v28 = [v7 deviceMemory];
    size_t v29 = [v28 objectAtIndexedSubscript:0];
    [v27 copyFromBuffer:v24 sourceOffset:0 toBuffer:v29 destinationOffset:0 size:v19];

    [v27 endEncoding];
    uint64_t v30 = (void *)v20;
  }
  else
  {
    id v34 = [v7 data];
    NSUInteger v35 = (char *)[v34 bytes];

    uint64_t v36 = MEMORY[0x1E01B11E0]();
    uint64_t v37 = 0;
    if (v17) {
      size_t v38 = v19;
    }
    else {
      size_t v38 = 0;
    }
    do
    {
      unint64_t v39 = [v7 deviceMemory];
      uint64_t v40 = [v39 objectAtIndexedSubscript:v37];

      id v41 = v40;
      id v42 = memcpy((void *)[v41 contents], v35, v19);
      objc_super v43 = (void *)MEMORY[0x1E01B11E0](v42);
      +[MLCGPUHelper didModifyRange:buffer:](MLCGPUHelper, "didModifyRange:buffer:", 0, v19, v41);
      v35 += v38;

      ++v37;
    }
    while (v8 != v37);
    uint64_t v30 = (void *)v36;
  }
LABEL_29:
}

- (void)signalNextEvent
{
  p_l = &self->_l;
  os_unfair_lock_lock(&self->_l);
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v4 = 0;
    do
    {
      [(MLCDeviceGPU *)self unsafe_signalAllDevicesExcludingDevice:v4 eventValue:[(MLCDeviceGPU *)self currentEventValue][8 * v4] + 1];
      ++v4;
    }
    while (v4 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }

  os_unfair_lock_unlock(p_l);
}

- (void)signalAllDevicesExcludingDevice:(unint64_t)a3 eventValue:(unint64_t)a4
{
  p_l = &self->_l;
  os_unfair_lock_lock(&self->_l);
  [(MLCDeviceGPU *)self unsafe_signalAllDevicesExcludingDevice:a3 eventValue:a4];

  os_unfair_lock_unlock(p_l);
}

- (void)unsafe_signalAllDevicesExcludingDevice:(unint64_t)a3 eventValue:(unint64_t)a4
{
  id v7 = [(MLCDeviceGPU *)self gpuSharedEventList];
  id v11 = [v7 objectAtIndexedSubscript:a3];

  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v8 = 0;
    do
    {
      if (a3 == v8)
      {
        [(MLCDeviceGPU *)self currentEventValue][8 * a3] = a4;
      }
      else
      {
        unint64_t v9 = [(MLCDeviceGPU *)self gpuCommandBufferList];
        id v10 = [v9 objectAtIndexedSubscript:v8];

        [v10 encodeSignalEvent:v11 value:a4];
      }
      ++v8;
    }
    while (v8 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

- (void)waitForOthers
{
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v3 = 0;
    do
    {
      os_unfair_lock_lock(&self->_l);
      uint64_t v4 = [(MLCDeviceGPU *)self currentEventValue][8 * v3];
      os_unfair_lock_unlock(&self->_l);
      [(MLCDeviceGPU *)self waitForAllDevicesExcludingDevice:v3++ eventValue:v4];
    }
    while (v3 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

- (void)waitForAllDevicesExcludingDevice:(unint64_t)a3 eventValue:(unint64_t)a4
{
  p_l = &self->_l;
  os_unfair_lock_lock(&self->_l);
  unint64_t v8 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  id v12 = [v8 objectAtIndexedSubscript:a3];

  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v9 = 0;
    do
    {
      if (a3 != v9)
      {
        id v10 = [(MLCDeviceGPU *)self gpuSharedEventList];
        id v11 = [v10 objectAtIndexedSubscript:v9];

        [v12 encodeWaitForEvent:v11 value:a4];
      }
      ++v9;
    }
    while (v9 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
  os_unfair_lock_unlock(p_l);
}

- (unint64_t)deviceMemorySizeForTensor:(id)a3
{
  uint64_t v4 = [a3 descriptor];
  unint64_t v5 = [v4 tensorAllocationSizeInBytes];
  unint64_t v6 = v5 / [(MLCDeviceGPU *)self numDevicesToUse];

  return v6;
}

- (id)allocateDeviceMemoryForTensor:(id)a3 device:(id)a4 count:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [v7 descriptor];
  id v10 = [v9 shape];
  if ([v10 count] == 1)
  {
    unint64_t v11 = 1;
  }
  else
  {
    id v12 = [v7 descriptor];
    unint64_t v13 = [v12 shape];
    int v14 = [v13 objectAtIndexedSubscript:0];
    unint64_t v11 = [v14 unsignedIntegerValue];
  }
  unint64_t v15 = v11 / a5;

  char v16 = [v7 descriptor];
  int v17 = [v16 dataType];

  if (v17 == 5) {
    unint64_t v18 = 1;
  }
  else {
    unint64_t v18 = v15;
  }
  size_t v19 = [v7 descriptor];
  uint64_t v20 = objc_msgSend(v8, "newBufferWithLength:options:", objc_msgSend(v19, "tensorAllocationSizeInBytes") / v18, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

  return v20;
}

- (void)allReduceOverXGMI:(id)a3 deviceIndex:(unint64_t)a4 stateBuffers:(id)a5
{
  v79[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if ([(MLCDeviceGPU *)self numDevicesToUse] <= 1)
  {
    unint64_t v11 = +[MLCLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceGPU allReduceOverXGMI:deviceIndex:stateBuffers:](a2, self, v11);
    }
  }
  id v12 = [v9 objectAtIndexedSubscript:a4];
  unint64_t v77 = ~a4;
  v74 = v9;
  uint64_t v75 = objc_msgSend(v9, "objectAtIndexedSubscript:", -[MLCDeviceGPU numDevicesToUse](self, "numDevicesToUse") + ~a4);
  unint64_t v13 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  int v14 = [v13 objectAtIndexedSubscript:a4];

  unint64_t v15 = [(MLCDeviceGPU *)self currentEventValue];
  ++v15[a4];
  char v16 = [(MLCDeviceGPU *)self gpuLocalEventList];
  int v17 = [v16 objectAtIndexedSubscript:a4];
  objc_msgSend(v14, "encodeSignalEvent:value:", v17, -[MLCDeviceGPU currentEventValue](self, "currentEventValue")[8 * a4]);

  unint64_t v18 = [(MLCDeviceGPU *)self gpuLocalEventList];
  size_t v19 = [v18 objectAtIndexedSubscript:a4];
  unint64_t v20 = a4;
  objc_msgSend(v14, "encodeWaitForEvent:value:", v19, -[MLCDeviceGPU currentEventValue](self, "currentEventValue")[8 * a4]);

  uint64_t v21 = [v12 localGradientMatrices];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    unint64_t v23 = 0;
    do
    {
      size_t v24 = [v10 objectAtIndexedSubscript:v23];
      size_t v25 = [v12 localGradientMatrices];
      unint64_t v26 = [v25 objectAtIndexedSubscript:v23];

      unint64_t v27 = [v26 data];
      id v28 = [v14 blitCommandEncoder];
      objc_msgSend(v28, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v24, 0, v27, 0, objc_msgSend(v27, "length"));
      [v28 endEncoding];

      ++v23;
      size_t v29 = [v12 localGradientMatrices];
      unint64_t v30 = [v29 count];
    }
    while (v23 < v30);
  }
  unint64_t v76 = v10;
  float v31 = [(MLCDeviceGPU *)self currentEventValue];
  ++v31[v20];
  id v32 = [(MLCDeviceGPU *)self gpuSharedEventList];
  unint64_t v33 = [v32 objectAtIndexedSubscript:v20];
  objc_msgSend(v14, "encodeSignalEvent:value:", v33, -[MLCDeviceGPU currentEventValue](self, "currentEventValue")[8 * v20]);

  id v34 = [(MLCDeviceGPU *)self gpuSharedEventList];
  NSUInteger v35 = objc_msgSend(v34, "objectAtIndexedSubscript:", -[MLCDeviceGPU numDevicesToUse](self, "numDevicesToUse") + v77);
  objc_msgSend(v14, "encodeWaitForEvent:value:", v35, -[MLCDeviceGPU currentEventValue](self, "currentEventValue")[8 * v20]);

  uint64_t v36 = [v12 receivedGradientMatrices];
  uint64_t v37 = [v36 count];

  size_t v38 = v14;
  if (v37)
  {
    unint64_t v39 = 0;
    do
    {
      uint64_t v40 = [v75 remoteGradientBuffers];
      id v41 = [v40 objectAtIndexedSubscript:v39];

      id v42 = [v12 receivedGradientMatrices];
      objc_super v43 = [v42 objectAtIndexedSubscript:v39];

      int v44 = [v43 data];
      uint64_t v45 = [v38 blitCommandEncoder];
      objc_msgSend(v45, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v41, 0, v44, 0, objc_msgSend(v44, "length"));
      [v45 endEncoding];

      ++v39;
      __int16 v46 = [v12 receivedGradientMatrices];
      unint64_t v47 = [v46 count];
    }
    while (v39 < v47);
  }
  uint64_t v78 = v38;
  __int16 v48 = [v12 localGradientMatrices];
  uint64_t v49 = [v48 count];

  if (v49)
  {
    unint64_t v50 = 0;
    do
    {
      uint64_t v51 = [v12 localGradientMatrices];
      uint64_t v52 = [v51 objectAtIndexedSubscript:v50];

      NSUInteger v53 = objc_msgSend(MEMORY[0x1E4F35640], "matrixDescriptorWithRows:columns:rowBytes:dataType:", objc_msgSend(v52, "rows"), objc_msgSend(v52, "columns"), objc_msgSend(v52, "rowBytes"), objc_msgSend(v52, "dataType"));
      id v54 = objc_alloc(MEMORY[0x1E4F35618]);
      NSUInteger v55 = [v76 objectAtIndexedSubscript:v50];
      uint64_t v56 = (void *)[v54 initWithBuffer:v55 descriptor:v53];
      uint64_t v57 = [v12 allReducedGradientMatrices];
      [v57 setObject:v56 atIndexedSubscript:v50];

      ++v50;
      uint64_t v58 = [v12 localGradientMatrices];
      unint64_t v59 = [v58 count];
    }
    while (v50 < v59);
  }
  uint64_t v60 = [v12 localGradientMatrices];
  uint64_t v61 = [v60 count];

  if (v61)
  {
    unint64_t v62 = 0;
    do
    {
      uint64_t v63 = [v12 matrixSumKernels];
      uint64_t v64 = [v63 objectAtIndexedSubscript:v62];

      NSUInteger v65 = [v12 localGradientMatrices];
      unint64_t v66 = [v65 objectAtIndexedSubscript:v62];
      v79[0] = v66;
      unint64_t v67 = [v12 receivedGradientMatrices];
      NSUInteger v68 = [v67 objectAtIndexedSubscript:v62];
      v79[1] = v68;
      v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
      char v70 = [v12 allReducedGradientMatrices];
      unint64_t v71 = [v70 objectAtIndexedSubscript:v62];
      [v64 encodeToCommandBuffer:v78 sourceMatrices:v69 resultMatrix:v71 scaleVector:0 offsetVector:0 biasVector:0 startIndex:0];

      ++v62;
      unint64_t v72 = [v12 localGradientMatrices];
      unint64_t v73 = [v72 count];
    }
    while (v62 < v73);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(MLCDeviceGPU *)self deviceList];
    uint64_t v7 = [v6 count];
    id v8 = [v5 deviceList];
    uint64_t v9 = [v8 count];

    if (v7 == v9)
    {
      id v10 = [(MLCDeviceGPU *)self deviceList];
      uint64_t v11 = [v10 count];

      if (v11)
      {
        unint64_t v12 = 0;
        do
        {
          unint64_t v13 = [(MLCDeviceGPU *)self deviceList];
          int v14 = [v13 objectAtIndexedSubscript:v12];
          unint64_t v15 = [v5 deviceList];
          char v16 = [v15 objectAtIndexedSubscript:v12];

          BOOL v17 = v14 == v16;
          if (v14 != v16) {
            break;
          }
          ++v12;
          unint64_t v18 = [(MLCDeviceGPU *)self deviceList];
          unint64_t v19 = [v18 count];
        }
        while (v12 < v19);
      }
      else
      {
        BOOL v17 = 1;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)transferTensor:(id)a3 fromDevice:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (MLCDeviceGPU *)a4;
  if (!v8 || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), self == v8) && (isKindOfClass & 1) != 0)
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v11 = +[MLCLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unint64_t v13 = NSStringFromSelector(a2);
      int v14 = 138412802;
      unint64_t v15 = v13;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      unint64_t v19 = v8;
      _os_log_error_impl(&dword_1DD0C9000, v11, OS_LOG_TYPE_ERROR, "%@: cannot transfer tensor = %@ to GPU from device = %@", (uint8_t *)&v14, 0x20u);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (void)setDeviceMemoryForTensor:(id)a3 data:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [(MLCDeviceGPU *)self deviceList];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    do
    {
      BOOL v10 = [(MLCDeviceGPU *)self deviceList];
      uint64_t v11 = [v10 objectAtIndexedSubscript:v9];

      id v12 = [v6 data];
      uint64_t v13 = [v12 bytes];
      int v14 = [v6 data];
      unint64_t v15 = objc_msgSend(v11, "newBufferWithBytesNoCopy:length:options:deallocator:", v13, objc_msgSend(v14, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"), 0);
      __int16 v16 = [v19 deviceMemory];
      [v16 setObject:v15 atIndexedSubscript:v9];

      ++v9;
      id v17 = [(MLCDeviceGPU *)self deviceList];
      unint64_t v18 = [v17 count];
    }
    while (v9 < v18);
  }
}

- (BOOL)updateDeviceMemoryForTensor:(id)a3
{
  return 1;
}

- (NSArray)deviceList
{
  return self->_deviceList;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (BOOL)isAppleSoCGPU
{
  return self->_isAppleSoCGPU;
}

- (NSMutableArray)gpuHeapTemporaryResourceAllocator
{
  return self->_gpuHeapTemporaryResourceAllocator;
}

- (void)setGpuHeapTemporaryResourceAllocator:(id)a3
{
}

- (NSMutableArray)gpuCommandQueueList
{
  return self->_gpuCommandQueueList;
}

- (NSMutableArray)gpuCommandBufferList
{
  return self->_gpuCommandBufferList;
}

- (NSMutableArray)gpuMPSCommandBufferList
{
  return self->_gpuMPSCommandBufferList;
}

- (NSMutableArray)gpuWriteTensorKernelList
{
  return self->_gpuWriteTensorKernelList;
}

- (NSMutableArray)gpuReadTensorKernelList
{
  return self->_gpuReadTensorKernelList;
}

- (NSMutableArray)gpuLibrary
{
  return self->_gpuLibrary;
}

- (NSMutableArray)gpuPipelineStatesForwardConcat2DArray
{
  return self->_gpuPipelineStatesForwardConcat2DArray;
}

- (void)setGpuPipelineStatesForwardConcat2DArray:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesForwardConcat2D
{
  return self->_gpuPipelineStatesForwardConcat2D;
}

- (void)setGpuPipelineStatesForwardConcat2D:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesConcatFloat
{
  return self->_gpuPipelineStatesConcatFloat;
}

- (void)setGpuPipelineStatesConcatFloat:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesConcatBool
{
  return self->_gpuPipelineStatesConcatBool;
}

- (void)setGpuPipelineStatesConcatBool:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesPad2DArray
{
  return self->_gpuPipelineStatesPad2DArray;
}

- (void)setGpuPipelineStatesPad2DArray:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesPad2D
{
  return self->_gpuPipelineStatesPad2D;
}

- (void)setGpuPipelineStatesPad2D:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesReduceAcrossBatch
{
  return self->_gpuPipelineStatesReduceAcrossBatch;
}

- (void)setGpuPipelineStatesReduceAcrossBatch:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesReduceAcrossChannel
{
  return self->_gpuPipelineStatesReduceAcrossChannel;
}

- (void)setGpuPipelineStatesReduceAcrossChannel:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesArithmeticUnaryForward
{
  return self->_gpuPipelineStatesArithmeticUnaryForward;
}

- (void)setGpuPipelineStatesArithmeticUnaryForward:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesArithmeticUnaryGradient
{
  return self->_gpuPipelineStatesArithmeticUnaryGradient;
}

- (void)setGpuPipelineStatesArithmeticUnaryGradient:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesArithmeticBinaryForward
{
  return self->_gpuPipelineStatesArithmeticBinaryForward;
}

- (void)setGpuPipelineStatesArithmeticBinaryForward:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesArithmeticBinaryGradient
{
  return self->_gpuPipelineStatesArithmeticBinaryGradient;
}

- (void)setGpuPipelineStatesArithmeticBinaryGradient:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesArithmeticReduceGradientAny
{
  return self->_gpuPipelineStatesArithmeticReduceGradientAny;
}

- (void)setGpuPipelineStatesArithmeticReduceGradientAny:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesArithmeticReduceGradientAll
{
  return self->_gpuPipelineStatesArithmeticReduceGradientAll;
}

- (void)setGpuPipelineStatesArithmeticReduceGradientAll:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesEmbeddingRenormalizeWeights
{
  return self->_gpuPipelineStatesEmbeddingRenormalizeWeights;
}

- (void)setGpuPipelineStatesEmbeddingRenormalizeWeights:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesEmbeddingForward
{
  return self->_gpuPipelineStatesEmbeddingForward;
}

- (void)setGpuPipelineStatesEmbeddingForward:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesEmbeddingGradient
{
  return self->_gpuPipelineStatesEmbeddingGradient;
}

- (void)setGpuPipelineStatesEmbeddingGradient:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesCompareRelationalOpForward
{
  return self->_gpuPipelineStatesCompareRelationalOpForward;
}

- (void)setGpuPipelineStatesCompareRelationalOpForward:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesCompareLogicalOpForward
{
  return self->_gpuPipelineStatesCompareLogicalOpForward;
}

- (void)setGpuPipelineStatesCompareLogicalOpForward:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesMemFillFloat
{
  return self->_gpuPipelineStatesMemFillFloat;
}

- (void)setGpuPipelineStatesMemFillFloat:(id)a3
{
}

- (NSMutableArray)gpuPipelineStatesMemCopy
{
  return self->_gpuPipelineStatesMemCopy;
}

- (void)setGpuPipelineStatesMemCopy:(id)a3
{
}

- (NSMutableArray)gpuConcurrentEncoderFence
{
  return self->_gpuConcurrentEncoderFence;
}

- (void)setGpuConcurrentEncoderFence:(id)a3
{
}

- (os_unfair_lock_s)l
{
  return self->_l;
}

- (void)setL:(os_unfair_lock_s)a3
{
  self->_l = a3;
}

- (double)executionTimeInterval
{
  return self->_executionTimeInterval;
}

- (NSArray)gpuLocalEventList
{
  return self->_gpuLocalEventList;
}

- (void)setGpuLocalEventList:(id)a3
{
}

- (NSArray)gpuSharedEventList
{
  return self->_gpuSharedEventList;
}

- (void)setGpuSharedEventList:(id)a3
{
}

- (unint64_t)currentEventValue
{
  return self->_currentEventValue;
}

- (unint64_t)numDevicesToUse
{
  return self->_numDevicesToUse;
}

- (void)setNumDevicesToUse:(unint64_t)a3
{
  self->_numDevicesToUse = a3;
}

- (unint64_t)numDevicesUsedWithFirstBatch
{
  return self->_numDevicesUsedWithFirstBatch;
}

- (void)setNumDevicesUsedWithFirstBatch:(unint64_t)a3
{
  self->_numDevicesUsedWithFirstBatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gpuSharedEventList, 0);
  objc_storeStrong((id *)&self->_gpuLocalEventList, 0);
  objc_storeStrong((id *)&self->_gpuConcurrentEncoderFence, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesMemCopy, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesMemFillFloat, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesCompareLogicalOpForward, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesCompareRelationalOpForward, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesEmbeddingGradient, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesEmbeddingForward, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesEmbeddingRenormalizeWeights, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesArithmeticReduceGradientAll, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesArithmeticReduceGradientAny, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesArithmeticBinaryGradient, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesArithmeticBinaryForward, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesArithmeticUnaryGradient, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesArithmeticUnaryForward, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesReduceAcrossChannel, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesReduceAcrossBatch, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesPad2D, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesPad2DArray, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesConcatBool, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesConcatFloat, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesForwardConcat2D, 0);
  objc_storeStrong((id *)&self->_gpuPipelineStatesForwardConcat2DArray, 0);
  objc_storeStrong((id *)&self->_gpuLibrary, 0);
  objc_storeStrong((id *)&self->_gpuReadTensorKernelList, 0);
  objc_storeStrong((id *)&self->_gpuWriteTensorKernelList, 0);
  objc_storeStrong((id *)&self->_gpuMPSCommandBufferList, 0);
  objc_storeStrong((id *)&self->_gpuCommandBufferList, 0);
  objc_storeStrong((id *)&self->_gpuCommandQueueList, 0);
  objc_storeStrong((id *)&self->_gpuHeapTemporaryResourceAllocator, 0);

  objc_storeStrong((id *)&self->_deviceList, 0);
}

- (void)allocateResultTensor:(id)a3
{
  id v4 = a3;
  if (-[MLCDeviceGPU needToAllocateDeviceMemoryForTensor:](self, "needToAllocateDeviceMemoryForTensor:")) {
    [(MLCDeviceGPU *)self allocateDeviceMemoryForTensor:v4];
  }
}

- (void)reduceAcrossBatchForSource:(id)a3 result:(id)a4 batchSize:(unint64_t)a5 batchStride:(unint64_t)a6 numEntries:(unint64_t)a7 deviceIndex:(unint64_t)a8 commandBuffer:(id)a9
{
  int v11 = a6;
  int v12 = a5;
  id v25 = a3;
  id v15 = a4;
  id v16 = a9;
  unint64_t context = (void *)MEMORY[0x1E01B11E0]();
  id v17 = [(MLCDeviceGPU *)self gpuPipelineStatesReduceAcrossBatch];
  unint64_t v18 = [v17 objectAtIndexedSubscript:a8];
  unint64_t v19 = [v18 maxTotalThreadsPerThreadgroup];

  if (v19 >= a7) {
    unint64_t v20 = a7;
  }
  else {
    unint64_t v20 = v19;
  }
  v31[0] = 0;
  v31[1] = v12;
  v31[2] = v11;
  v31[3] = a7;
  v31[4] = 0;
  unint64_t v21 = (a7 + v20 - 1) / v20;
  uint64_t v22 = [v16 computeCommandEncoderWithDispatchType:0];
  unint64_t v23 = [(MLCDeviceGPU *)self gpuPipelineStatesReduceAcrossBatch];
  size_t v24 = [v23 objectAtIndexedSubscript:a8];
  [v22 setComputePipelineState:v24];

  [v22 setBuffer:v25 offset:0 atIndex:0];
  [v22 setBuffer:v15 offset:0 atIndex:1];
  [v22 setBytes:v31 length:20 atIndex:2];
  unint64_t v29 = v21;
  int64x2_t v30 = vdupq_n_s64(1uLL);
  unint64_t v27 = v20;
  int64x2_t v28 = v30;
  [v22 dispatchThreadgroups:&v29 threadsPerThreadgroup:&v27];
  [v22 endEncoding];
}

- (void)dispatchFillTensor:(id)a3 deviceIndex:(unint64_t)a4
{
  id v6 = [a3 deviceMemory];
  id v10 = [v6 objectAtIndexedSubscript:a4];

  id v7 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a4];

  unint64_t v9 = [v8 blitCommandEncoder];
  objc_msgSend(v9, "fillBuffer:range:value:", v10, 0, objc_msgSend(v10, "length"), 0);
  [v9 endEncoding];
}

- (void)dispatchPadChannelsKernel:(id)a3 sourceImageBatch:(id)a4 resultImageBatch:(id)a5 deviceIndex:(unint64_t)a6
{
  id v36 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v13 = [v12 objectAtIndexedSubscript:a6];

  unint64_t context = (void *)MEMORY[0x1E01B11E0]();
  int v14 = [v10 objectAtIndexedSubscript:0];
  unint64_t v15 = [v14 width];

  id v16 = [v10 objectAtIndexedSubscript:0];
  unint64_t v17 = [v16 height];

  unint64_t v33 = v15;
  BOOL v19 = v15 < 9 || v17 < 9;
  if (v19) {
    uint64_t v20 = 8;
  }
  else {
    uint64_t v20 = 16;
  }
  if (v19) {
    char v21 = 3;
  }
  else {
    char v21 = 4;
  }
  uint64_t v22 = [v11 objectAtIndexedSubscript:0];
  unint64_t v23 = [v22 featureChannels];

  unint64_t v39 = v23;
  NSUInteger v35 = v13;
  size_t v24 = [v13 computeCommandEncoderWithDispatchType:1];
  if (v23 > 4) {
    [(MLCDeviceGPU *)self gpuPipelineStatesPad2DArray];
  }
  else {
  id v25 = [(MLCDeviceGPU *)self gpuPipelineStatesPad2D];
  }
  unint64_t v26 = [v25 objectAtIndexedSubscript:a6];
  [v24 setComputePipelineState:v26];

  [v24 memoryBarrierWithScope:2];
  if ([v10 count])
  {
    unint64_t v27 = 0;
    unint64_t v28 = (v20 - 1 + v17) >> v21;
    do
    {
      unint64_t v29 = [v10 objectAtIndexedSubscript:v27];
      int64x2_t v30 = [v29 texture];
      [v24 setTexture:v30 atIndex:0];

      float v31 = [v11 objectAtIndexedSubscript:v27];
      id v32 = [v31 texture];
      [v24 setTexture:v32 atIndex:1];

      [v24 setBytes:&v39 length:8 atIndex:0];
      v38[0] = (v20 - 1 + v33) >> v21;
      v38[1] = v28;
      v38[2] = 1;
      v37[0] = v20;
      v37[1] = v20;
      v37[2] = 1;
      [v24 dispatchThreadgroups:v38 threadsPerThreadgroup:v37];
      ++v27;
    }
    while (v27 < [v10 count]);
  }
  [v24 endEncoding];
}

- (void)dispatchForwardActivationsKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  int v12 = [a4 deviceMemory];
  uint64_t v13 = [v11 deviceMemory];
  unint64_t v47 = v10;
  int v14 = [v10 objectAtIndexedSubscript:a6];
  unint64_t v15 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  id v16 = [v15 objectAtIndexedSubscript:a6];

  __int16 v46 = v12;
  unint64_t v17 = [v12 objectAtIndexedSubscript:a6];
  uint64_t v45 = v13;
  unint64_t v18 = [v13 objectAtIndexedSubscript:a6];
  BOOL v19 = [v14 neuronDescriptor];
  [v19 a];
  v52[0] = v20;

  char v21 = [v14 neuronDescriptor];
  [v21 b];
  v52[1] = v22;

  unint64_t v23 = [v14 neuronDescriptor];
  v52[2] = [v23 activationType];

  uint64_t v24 = [v14 batchSize];
  id v25 = [v11 descriptor];
  unint64_t v26 = [v25 shape];
  uint64_t v27 = [v26 count];

  unint64_t v28 = [v11 descriptor];
  unint64_t v29 = [v28 shape];
  int64x2_t v30 = v29;
  if (v27 == 1)
  {
    float v31 = [v29 objectAtIndexedSubscript:0];
    uint64_t v24 = [v31 unsignedIntegerValue];
  }
  else
  {
    unint64_t v32 = [v29 count];

    if (v32 >= 2)
    {
      unint64_t v33 = 1;
      do
      {
        id v34 = [v11 descriptor];
        NSUInteger v35 = [v34 shape];
        id v36 = [v35 objectAtIndexedSubscript:v33];
        v24 *= [v36 unsignedIntegerValue];

        ++v33;
        uint64_t v37 = [v11 descriptor];
        size_t v38 = [v37 shape];
        unint64_t v39 = [v38 count];
      }
      while (v33 < v39);
    }
  }
  v52[3] = v24;
  uint64_t v40 = [v14 forwardKernel];
  unint64_t v41 = [v40 maxTotalThreadsPerThreadgroup];

  unint64_t v42 = (v24 + v41 - 1) / v41;
  objc_super v43 = [v16 computeCommandEncoderWithDispatchType:0];
  int v44 = [v14 forwardKernel];
  [v43 setComputePipelineState:v44];

  [v43 setBuffer:v17 offset:0 atIndex:0];
  [v43 setBuffer:v18 offset:0 atIndex:1];
  [v43 setBytes:v52 length:16 atIndex:2];
  unint64_t v50 = v42;
  int64x2_t v51 = vdupq_n_s64(1uLL);
  unint64_t v48 = v41;
  int64x2_t v49 = v51;
  [v43 dispatchThreadgroups:&v50 threadsPerThreadgroup:&v48];
  [v43 endEncoding];
}

- (void)dispatchGradientActivationsKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  int v12 = [a4 deviceMemory];
  uint64_t v13 = [v11 deviceMemory];
  unint64_t v48 = v10;
  int v14 = [v10 objectAtIndexedSubscript:a6];
  unint64_t v15 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v44 = [v15 objectAtIndexedSubscript:a6];

  unint64_t v47 = v12;
  id v16 = [v12 objectAtIndexedSubscript:a6];
  __int16 v46 = v13;
  unint64_t v17 = [v13 objectAtIndexedSubscript:a6];
  unint64_t v18 = [v14 source];
  BOOL v19 = [v14 neuronDescriptor];
  [v19 a];
  v53[0] = v20;

  char v21 = [v14 neuronDescriptor];
  [v21 b];
  v53[1] = v22;

  unint64_t v23 = [v14 neuronDescriptor];
  v53[2] = [v23 activationType];

  uint64_t v24 = [v14 batchSize];
  id v25 = [v11 descriptor];
  unint64_t v26 = [v25 shape];
  uint64_t v27 = [v26 count];

  unint64_t v28 = [v11 descriptor];
  unint64_t v29 = [v28 shape];
  int64x2_t v30 = v29;
  if (v27 == 1)
  {
    float v31 = [v29 objectAtIndexedSubscript:0];
    uint64_t v24 = [v31 unsignedIntegerValue];
  }
  else
  {
    unint64_t v32 = [v29 count];

    if (v32 >= 2)
    {
      unint64_t v33 = 1;
      do
      {
        id v34 = objc_msgSend(v11, "descriptor", v44);
        NSUInteger v35 = [v34 shape];
        id v36 = [v35 objectAtIndexedSubscript:v33];
        v24 *= [v36 unsignedIntegerValue];

        ++v33;
        uint64_t v37 = [v11 descriptor];
        size_t v38 = [v37 shape];
        unint64_t v39 = [v38 count];
      }
      while (v33 < v39);
    }
  }
  v53[3] = v24;
  uint64_t v40 = objc_msgSend(v14, "gradientKernel", v44);
  unint64_t v41 = [v40 maxTotalThreadsPerThreadgroup];

  unint64_t v42 = [v45 computeCommandEncoderWithDispatchType:0];
  objc_super v43 = [v14 gradientKernel];
  [v42 setComputePipelineState:v43];

  [v42 setBuffer:v18 offset:0 atIndex:0];
  [v42 setBuffer:v16 offset:0 atIndex:1];
  [v42 setBuffer:v17 offset:0 atIndex:2];
  [v42 setBytes:v53 length:16 atIndex:3];
  unint64_t v51 = (v24 + v41 - 1) / v41;
  int64x2_t v52 = vdupq_n_s64(1uLL);
  unint64_t v49 = v41;
  int64x2_t v50 = v52;
  [v42 dispatchThreadgroups:&v51 threadsPerThreadgroup:&v49];
  [v42 endEncoding];
}

- (void)encodePrimitiveToCommandBuffer:(id)a3 gpuDeviceOps:(id)a4 sourceTensor:(id)a5 secondaryTensor:(id)a6 tertiaryTensor:(id)a7 resultTensor:(id)a8 params:(CompareParams *)a9 sizeOfParams:(unint64_t)a10 pipelineState:(id)a11 deviceIndex:(unint64_t)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v102 = a11;
  unint64_t v103 = [v19 deviceMemory];
  uint64_t v97 = v20;
  if (v20)
  {
    uint64_t v23 = [v20 deviceMemory];
  }
  else
  {
    uint64_t v23 = 0;
  }
  uint64_t v101 = (void *)v23;
  if (v21)
  {
    BOOL v89 = [v21 deviceMemory];
    unint64_t v94 = v89;
  }
  else
  {
    unint64_t v94 = 0;
    BOOL v89 = v103;
  }
  __int16 v93 = objc_msgSend(v22, "deviceMemory", a10);
  uint64_t v24 = [v18 source0Shape];
  id v25 = [v18 source1Shape];
  unint64_t v26 = [v18 source2Shape];
  uint64_t v27 = [v22 descriptor];
  unint64_t v28 = [v27 shape];

  unint64_t context = (void *)MEMORY[0x1E01B11E0]();
  v100 = v17;
  v98 = v18;
  uint64_t v99 = v26;
  __int16 v95 = v22;
  unint64_t v96 = v21;
  long long v91 = v25;
  uint64_t v92 = v24;
  if ([v28 count] == 1)
  {
    *(void *)&a9->var1[3].unsigned int var0 = 0x100000001;
    *(void *)&a9->var1[2].unsigned int var0 = 0x100000001;
    *(void *)&a9->var1[1].unsigned int var0 = 0x100000001;
    *(void *)&a9->var1[0].unsigned int var0 = 0x100000001;
    a9->var1[3].unint64_t var2 = 1;
    a9->var1[2].unint64_t var2 = 1;
    a9->var1[1].unint64_t var2 = 1;
    a9->var1[0].unint64_t var2 = 1;
    unint64_t v29 = [v24 objectAtIndexedSubscript:0];
    a9->var1[0].uint64_t var3 = [v29 unsignedIntegerValue];

    int64x2_t v30 = [v25 objectAtIndexedSubscript:0];
    a9->var1[1].uint64_t var3 = [v30 unsignedIntegerValue];

    float v31 = [v28 objectAtIndexedSubscript:0];
    a9->var1[2].uint64_t var3 = [v31 unsignedIntegerValue];

    unint64_t v32 = v26;
    uint64_t v33 = 0;
LABEL_11:
    unint64_t v41 = [v32 objectAtIndexedSubscript:v33];
    a9->var1[3].uint64_t var3 = [v41 unsignedIntegerValue];

    goto LABEL_27;
  }
  if ([v28 count] == 2)
  {
    *(void *)&a9->var1[3].unsigned int var0 = 0x100000001;
    *(void *)&a9->var1[2].unsigned int var0 = 0x100000001;
    *(void *)&a9->var1[1].unsigned int var0 = 0x100000001;
    *(void *)&a9->var1[0].unsigned int var0 = 0x100000001;
    id v34 = [v24 objectAtIndexedSubscript:0];
    a9->var1[0].unint64_t var2 = [v34 unsignedIntegerValue];

    NSUInteger v35 = [v25 objectAtIndexedSubscript:0];
    a9->var1[1].unint64_t var2 = [v35 unsignedIntegerValue];

    id v36 = [v28 objectAtIndexedSubscript:0];
    a9->var1[2].unint64_t var2 = [v36 unsignedIntegerValue];

    uint64_t v37 = [v26 objectAtIndexedSubscript:0];
    a9->var1[3].unint64_t var2 = [v37 unsignedIntegerValue];

    size_t v38 = [v24 objectAtIndexedSubscript:1];
    a9->var1[0].uint64_t var3 = [v38 unsignedIntegerValue];

    unint64_t v39 = [v25 objectAtIndexedSubscript:1];
    a9->var1[1].uint64_t var3 = [v39 unsignedIntegerValue];

    uint64_t v40 = [v28 objectAtIndexedSubscript:1];
    a9->var1[2].uint64_t var3 = [v40 unsignedIntegerValue];

    unint64_t v32 = v26;
    uint64_t v33 = 1;
    goto LABEL_11;
  }
  unint64_t v42 = [v24 objectAtIndexedSubscript:0];
  unint64_t v43 = [v42 unsignedIntegerValue];
  if (v43 <= [v18 batchSize])
  {
    uint64_t v44 = [v24 objectAtIndexedSubscript:0];
    a9->var1[0].unsigned int var0 = [v44 unsignedIntegerValue];
  }
  else
  {
    a9->var1[0].unsigned int var0 = [v18 batchSize];
  }

  id v45 = [v25 objectAtIndexedSubscript:0];
  unint64_t v46 = [v45 unsignedIntegerValue];
  if (v46 <= [v18 batchSize])
  {
    unint64_t v47 = [v25 objectAtIndexedSubscript:0];
    a9->var1[1].unsigned int var0 = [v47 unsignedIntegerValue];
  }
  else
  {
    a9->var1[1].unsigned int var0 = [v18 batchSize];
  }

  unint64_t v48 = [v28 objectAtIndexedSubscript:0];
  unint64_t v49 = [v48 unsignedIntegerValue];
  if (v49 <= [v18 batchSize])
  {
    int64x2_t v50 = [v28 objectAtIndexedSubscript:0];
    a9->var1[2].unsigned int var0 = [v50 unsignedIntegerValue];
  }
  else
  {
    a9->var1[2].unsigned int var0 = [v18 batchSize];
  }

  unint64_t v51 = [v99 objectAtIndexedSubscript:0];
  unint64_t v52 = [v51 unsignedIntegerValue];
  if (v52 <= [v18 batchSize])
  {
    NSUInteger v53 = [v99 objectAtIndexedSubscript:0];
    a9->var1[3].unsigned int var0 = [v53 unsignedIntegerValue];
  }
  else
  {
    a9->var1[3].unsigned int var0 = [v18 batchSize];
  }

  uint64_t v54 = [v28 count];
  NSUInteger v55 = [v24 objectAtIndexedSubscript:1];
  a9->var1[0].int var1 = [v55 unsignedIntegerValue];

  uint64_t v56 = [v25 objectAtIndexedSubscript:1];
  a9->var1[1].int var1 = [v56 unsignedIntegerValue];

  uint64_t v57 = [v28 objectAtIndexedSubscript:1];
  a9->var1[2].int var1 = [v57 unsignedIntegerValue];

  uint64_t v58 = [v99 objectAtIndexedSubscript:1];
  a9->var1[3].int var1 = [v58 unsignedIntegerValue];

  unint64_t v59 = [v24 objectAtIndexedSubscript:2];
  int v60 = [v59 unsignedIntegerValue];
  if (v54 == 3)
  {
    a9->var1[0].uint64_t var3 = v60;

    uint64_t v61 = [v25 objectAtIndexedSubscript:2];
    a9->var1[1].uint64_t var3 = [v61 unsignedIntegerValue];

    unint64_t v62 = [v28 objectAtIndexedSubscript:2];
    a9->var1[2].uint64_t var3 = [v62 unsignedIntegerValue];

    uint64_t v63 = [v99 objectAtIndexedSubscript:2];
    a9->var1[3].uint64_t var3 = [v63 unsignedIntegerValue];

    a9->var1[3].unint64_t var2 = 1;
    a9->var1[2].unint64_t var2 = 1;
    a9->var1[1].unint64_t var2 = 1;
    a9->var1[0].unint64_t var2 = 1;
  }
  else
  {
    a9->var1[0].unint64_t var2 = v60;

    uint64_t v64 = [v25 objectAtIndexedSubscript:2];
    a9->var1[1].unint64_t var2 = [v64 unsignedIntegerValue];

    NSUInteger v65 = [v28 objectAtIndexedSubscript:2];
    a9->var1[2].unint64_t var2 = [v65 unsignedIntegerValue];

    unint64_t v66 = [v99 objectAtIndexedSubscript:2];
    a9->var1[3].unint64_t var2 = [v66 unsignedIntegerValue];

    unint64_t v67 = [v24 objectAtIndexedSubscript:3];
    a9->var1[0].uint64_t var3 = [v67 unsignedIntegerValue];

    NSUInteger v68 = [v25 objectAtIndexedSubscript:3];
    a9->var1[1].uint64_t var3 = [v68 unsignedIntegerValue];

    v69 = [v28 objectAtIndexedSubscript:3];
    a9->var1[2].uint64_t var3 = [v69 unsignedIntegerValue];

    char v70 = [v99 objectAtIndexedSubscript:3];
    a9->var1[3].uint64_t var3 = [v70 unsignedIntegerValue];
  }
LABEL_27:
  unsigned int var0 = (unsigned __int16)a9->var1[2].var0;
  unsigned int v72 = __clz(__rbit32(var0)) << 16;
  if (((a9->var1[2].var0 - 1) & var0) != 0) {
    int v73 = -65536;
  }
  else {
    int v73 = v72;
  }
  a9->unint64_t var2 = ($592003E226E87ABC59F31FE2B41069BE)(v73 & 0xFFFF0000 | (unsigned __int16)a9->var1[2].var0);
  unint64_t v74 = [v102 maxTotalThreadsPerThreadgroup];
  int v76 = a9->var1[2].var0;
  int var1 = a9->var1[2].var1;
  unint64_t var2 = a9->var1[2].var2;
  uint64_t var3 = a9->var1[2].var3;
  uint64_t v79 = [v17 computeCommandEncoderWithDispatchType:0];
  [v79 setComputePipelineState:v102];
  unint64_t v80 = [v103 objectAtIndexedSubscript:a12];
  [v79 setBuffer:v80 offset:0 atIndex:0];

  if (v101)
  {
    uint64_t v81 = [v101 objectAtIndexedSubscript:a12];
    [v79 setBuffer:v81 offset:0 atIndex:1];
  }
  else
  {
    [v79 setBuffer:0 offset:0 atIndex:1];
  }
  v82 = [v93 objectAtIndexedSubscript:a12];
  [v79 setBuffer:v82 offset:0 atIndex:2];

  [v79 setBytes:a9 length:v88 atIndex:3];
  uint64_t v83 = [v89 objectAtIndexedSubscript:a12];
  [v79 setBuffer:v83 offset:0 atIndex:4];

  char v84 = 5;
  if ((int)var3 < 32) {
    char v84 = 3;
  }
  unint64_t v85 = v74 >> v84;
  uint64_t v86 = 32;
  if ((int)var3 < 32) {
    uint64_t v86 = 8;
  }
  if (v85 >= var2) {
    unint64_t v85 = var2;
  }
  unint64_t v87 = v74 / (v85 << v84);
  if (v87 >= v76 * (uint64_t)var1) {
    unint64_t v87 = v76 * (uint64_t)var1;
  }
  v105[0] = (unint64_t)(var3 + v86 - 1) >> v84;
  v105[1] = (var2 + v85 - 1) / v85;
  v105[2] = (v87 + v76 * (uint64_t)var1 - 1) / v87;
  v104[0] = v86;
  v104[1] = v85;
  v104[2] = v87;
  [v79 dispatchThreadgroups:v105 threadsPerThreadgroup:v104];
  [v79 endEncoding];
}

- (void)dispatchForwardCompareLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 resultTensor:(id)a6 compareOp:(int)a7 forTraining:(BOOL)a8
{
  id v23 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v16 = 0;
    do
    {
      id v17 = [v23 objectAtIndexedSubscript:v16];
      id v18 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      id v19 = [v18 objectAtIndexedSubscript:v16];

      [(MLCDeviceGPU *)self allocateResultTensor:v15];
      memset(v24, 0, 76);
      if (a7 < 6)
      {
        LODWORD(v24[0]) = a7;
        [(MLCDeviceGPU *)self gpuPipelineStatesCompareRelationalOpForward];
      }
      else
      {
        LODWORD(v24[0]) = a7 - 6;
        [(MLCDeviceGPU *)self gpuPipelineStatesCompareLogicalOpForward];
      id v20 = };
      id v21 = [v20 objectAtIndexedSubscript:v16];

      id v22 = [v13 descriptor];
      DWORD2(v24[4]) = [v22 dataType] == 4;

      [(MLCDeviceGPU *)self encodePrimitiveToCommandBuffer:v19 gpuDeviceOps:v17 sourceTensor:v13 secondaryTensor:v14 tertiaryTensor:0 resultTensor:v15 params:v24 sizeOfParams:76 pipelineState:v21 deviceIndex:v16];
      ++v16;
    }
    while (v16 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

- (void)dispatchForwardPaddingKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v10 deviceMemory];
  id v14 = [v11 deviceMemory];
  id v15 = [v12 objectAtIndexedSubscript:a6];

  unint64_t v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  v69 = [v16 objectAtIndexedSubscript:a6];

  unint64_t v71 = v13;
  NSUInteger v68 = [v13 objectAtIndexedSubscript:a6];
  char v70 = v14;
  unint64_t v67 = [v14 objectAtIndexedSubscript:a6];
  id v17 = [v15 forwardKernel];
  unint64_t v18 = [v17 maxTotalThreadsPerThreadgroup];

  uint64_t v79 = 0;
  uint64_t v80 = 0;
  uint64_t v77 = 0;
  uint64_t v78 = 0;
  GPU_GetTensorWidthAndHeight(v10, &v80, &v79);
  GPU_GetTensorWidthAndHeight(v11, &v78, &v77);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v74 = 0u;
  id v19 = [v11 descriptor];
  id v20 = [v19 shape];
  unint64_t v21 = [v20 count];
  id v22 = [v11 descriptor];
  id v23 = [v22 shape];
  uint64_t v24 = v23;
  if (v21 <= 3) {
    uint64_t v25 = 2;
  }
  else {
    uint64_t v25 = 3;
  }
  unint64_t v26 = [v23 objectAtIndexedSubscript:v25];
  LODWORD(v75) = [v26 unsignedIntegerValue];

  uint64_t v27 = [v11 descriptor];
  unint64_t v28 = [v27 shape];
  if ((unint64_t)[v28 count] <= 3)
  {
    DWORD1(v75) = 1;
  }
  else
  {
    unint64_t v29 = [v11 descriptor];
    int64x2_t v30 = [v29 shape];
    float v31 = [v30 objectAtIndexedSubscript:2];
    DWORD1(v75) = [v31 unsignedIntegerValue];
  }
  int v32 = [v15 batchSize];
  uint64_t v33 = [v11 descriptor];
  id v34 = [v33 shape];
  NSUInteger v35 = [v34 objectAtIndexedSubscript:1];
  int v65 = [v35 unsignedIntegerValue] * v32;
  DWORD2(v75) = v65;

  id v36 = [v10 descriptor];
  uint64_t v37 = [v36 shape];
  unint64_t v38 = [v37 count];
  unint64_t v39 = [v10 descriptor];
  uint64_t v40 = [v39 shape];
  unint64_t v41 = v40;
  if (v38 <= 3) {
    uint64_t v42 = 2;
  }
  else {
    uint64_t v42 = 3;
  }
  unint64_t v43 = [v40 objectAtIndexedSubscript:v42];
  DWORD1(v74) = [v43 unsignedIntegerValue];

  uint64_t v44 = [v10 descriptor];
  id v45 = [v44 shape];
  unint64_t v66 = v11;
  if ((unint64_t)[v45 count] <= 3)
  {
    DWORD2(v74) = 1;
  }
  else
  {
    unint64_t v46 = [v10 descriptor];
    unint64_t v47 = [v46 shape];
    unint64_t v48 = [v47 objectAtIndexedSubscript:2];
    DWORD2(v74) = [v48 unsignedIntegerValue];
  }
  unint64_t v49 = v10;
  uint64_t v64 = v10;
  BOOL v50 = v18 >= 0x400;
  unint64_t v51 = v18;
  if (v18 >= 0x400) {
    uint64_t v52 = 32;
  }
  else {
    uint64_t v52 = 16;
  }
  if (v50) {
    char v53 = 5;
  }
  else {
    char v53 = 4;
  }
  unint64_t v54 = v51 >> v53;

  int v55 = [v15 batchSize];
  uint64_t v56 = [v49 descriptor];
  uint64_t v57 = [v56 shape];
  uint64_t v58 = [v57 objectAtIndexedSubscript:1];
  HIDWORD(v74) = [v58 unsignedIntegerValue] * v55;

  HIDWORD(v75) = [v15 paddingLeft];
  LODWORD(v76) = [v15 paddingRight];
  DWORD1(v76) = [v15 paddingTop];
  DWORD2(v76) = [v15 paddingBottom];
  LODWORD(v74) = [v15 paddingType];
  [v15 paddingValue];
  HIDWORD(v76) = v59;
  unint64_t v60 = (unint64_t)(v52 + (int)v75 - 1) >> v53;
  unint64_t v61 = (v54 + SDWORD1(v75)) / v54;
  unint64_t v62 = [v69 computeCommandEncoderWithDispatchType:0];
  uint64_t v63 = [v15 forwardKernel];
  [v62 setComputePipelineState:v63];

  [v62 setBuffer:v68 offset:0 atIndex:0];
  [v62 setBuffer:v67 offset:0 atIndex:1];
  [v62 setBytes:&v74 length:48 atIndex:2];
  v73[0] = v52;
  v73[1] = v54;
  v73[2] = 1;
  v72[0] = v60;
  v72[1] = v61;
  v72[2] = v65;
  [v62 dispatchThreadgroups:v72 threadsPerThreadgroup:v73];
  [v62 endEncoding];
}

- (void)dispatchGradientPaddingKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v10 deviceMemory];
  id v14 = [v11 deviceMemory];
  id v15 = [v12 objectAtIndexedSubscript:a6];

  char v70 = self;
  unint64_t v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v78 = [v16 objectAtIndexedSubscript:a6];

  long long v74 = v13;
  unsigned int v72 = [v13 objectAtIndexedSubscript:a6];
  int v73 = v14;
  unint64_t v71 = a6;
  long long v76 = [v14 objectAtIndexedSubscript:a6];
  uint64_t v90 = 0;
  uint64_t v91 = 0;
  uint64_t v88 = 0;
  uint64_t v89 = 0;
  GPU_GetTensorWidthAndHeight(v10, &v91, &v90);
  GPU_GetTensorWidthAndHeight(v11, &v89, &v88);
  int v75 = [v15 paddingType];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v85 = 0u;
  id v17 = [v11 descriptor];
  unint64_t v18 = [v17 shape];
  unint64_t v19 = [v18 count];
  id v20 = [v11 descriptor];
  unint64_t v21 = [v20 shape];
  id v22 = v21;
  if (v19 <= 3) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 3;
  }
  uint64_t v24 = [v21 objectAtIndexedSubscript:v23];
  LODWORD(v86) = [v24 unsignedIntegerValue];

  uint64_t v25 = [v11 descriptor];
  unint64_t v26 = [v25 shape];
  if ((unint64_t)[v26 count] <= 3)
  {
    DWORD1(v86) = 1;
  }
  else
  {
    uint64_t v27 = [v11 descriptor];
    unint64_t v28 = [v27 shape];
    unint64_t v29 = [v28 objectAtIndexedSubscript:2];
    DWORD1(v86) = [v29 unsignedIntegerValue];
  }
  int v30 = [v15 batchSize];
  float v31 = [v11 descriptor];
  int v32 = [v31 shape];
  uint64_t v33 = [v32 objectAtIndexedSubscript:1];
  int v77 = [v33 unsignedIntegerValue] * v30;
  DWORD2(v86) = v77;

  id v34 = [v10 descriptor];
  NSUInteger v35 = [v34 shape];
  unint64_t v36 = [v35 count];
  uint64_t v37 = [v10 descriptor];
  unint64_t v38 = [v37 shape];
  unint64_t v39 = v38;
  if (v36 <= 3) {
    uint64_t v40 = 2;
  }
  else {
    uint64_t v40 = 3;
  }
  unint64_t v41 = [v38 objectAtIndexedSubscript:v40];
  DWORD1(v85) = [v41 unsignedIntegerValue];

  uint64_t v42 = [v10 descriptor];
  unint64_t v43 = [v42 shape];
  if ((unint64_t)[v43 count] <= 3)
  {
    DWORD2(v85) = 1;
  }
  else
  {
    uint64_t v44 = [v10 descriptor];
    id v45 = [v44 shape];
    unint64_t v46 = [v45 objectAtIndexedSubscript:2];
    DWORD2(v85) = [v46 unsignedIntegerValue];
  }
  unint64_t v47 = &v86;

  int v48 = [v15 batchSize];
  unint64_t v49 = [v10 descriptor];
  BOOL v50 = [v49 shape];
  unint64_t v51 = [v50 objectAtIndexedSubscript:1];
  int v69 = [v51 unsignedIntegerValue] * v48;
  HIDWORD(v85) = v69;

  uint64_t v52 = [v78 computeCommandEncoderWithDispatchType:0];
  int v53 = v75;
  if ((v75 - 1) <= 1)
  {
    unint64_t v54 = [(MLCDeviceGPU *)v70 gpuPipelineStatesMemFillFloat];
    int v55 = [v54 objectAtIndexedSubscript:v71];
    unint64_t v56 = [v55 maxTotalThreadsPerThreadgroup];

    LODWORD(v79[0]) = 0;
    HIDWORD(v79[0]) = DWORD1(v86) * v86 * v77;
    unint64_t v68 = (v56 + ((unint64_t)(HIDWORD(v79[0]) + 3) >> 2) - 1) / v56;
    uint64_t v57 = [(MLCDeviceGPU *)v70 gpuPipelineStatesMemFillFloat];
    uint64_t v58 = [v57 objectAtIndexedSubscript:v71];
    [v52 setComputePipelineState:v58];

    int v53 = v75;
    [v52 setBuffer:v76 offset:0 atIndex:0];
    [v52 setBytes:v79 length:8 atIndex:1];
    unint64_t v83 = v68;
    int64x2_t v84 = vdupq_n_s64(1uLL);
    unint64_t v81 = v56;
    int64x2_t v82 = v84;
    [v52 dispatchThreadgroups:&v83 threadsPerThreadgroup:&v81];
  }
  int v59 = [v15 gradientKernel];
  unint64_t v60 = [v59 maxTotalThreadsPerThreadgroup];

  HIDWORD(v86) = [v15 paddingLeft];
  LODWORD(v87) = [v15 paddingRight];
  DWORD1(v87) = [v15 paddingTop];
  DWORD2(v87) = [v15 paddingBottom];
  LODWORD(v85) = [v15 paddingType];
  if (v53)
  {
    unint64_t v61 = (char *)&v86 + 4;
    if (v53 != 3)
    {
      unint64_t v47 = (long long *)((char *)&v85 + 4);
      int v77 = v69;
      unint64_t v61 = (char *)&v85 + 8;
    }
  }
  else
  {
    unint64_t v61 = (char *)&v86 + 4;
  }
  char v62 = 4;
  if (v60 < 0x400)
  {
    uint64_t v63 = 16;
  }
  else
  {
    char v62 = 5;
    uint64_t v63 = 32;
  }
  unint64_t v64 = (unint64_t)(v63 + *(int *)v47 - 1) >> v62;
  unint64_t v65 = v60 >> v62;
  unint64_t v66 = ((v60 >> v62) + *(int *)v61) / (v60 >> v62);
  unint64_t v67 = [v15 gradientKernel];
  [v52 setComputePipelineState:v67];

  [v52 setBuffer:v72 offset:0 atIndex:0];
  [v52 setBuffer:v76 offset:0 atIndex:1];
  [v52 setBytes:&v85 length:48 atIndex:2];
  v80[0] = v63;
  v80[1] = v65;
  v80[2] = 1;
  v79[0] = v64;
  v79[1] = v66;
  v79[2] = v77;
  [v52 dispatchThreadgroups:v79 threadsPerThreadgroup:v80];
  [v52 endEncoding];
}

- (void)dispatchForwardSoftmaxKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v11 deviceMemory];
  int v55 = v12;
  id v14 = [v12 deviceMemory];
  id v15 = [v10 objectAtIndexedSubscript:a6];
  unint64_t v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  unint64_t v56 = [v16 objectAtIndexedSubscript:a6];

  unint64_t v51 = v13;
  uint64_t v17 = [v13 objectAtIndexedSubscript:a6];
  uint64_t v52 = [v14 objectAtIndexedSubscript:a6];
  unint64_t v18 = [v15 forwardKernel];
  unint64_t v19 = [v18 maxTotalThreadsPerThreadgroup];

  id v20 = [v11 descriptor];
  unint64_t v21 = [v20 shape];
  id v22 = objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v15, "softmaxAxis"));
  unint64_t v23 = [v22 unsignedIntegerValue];

  if (v19 > v23)
  {
    uint64_t v24 = [v11 descriptor];
    uint64_t v25 = [v24 shape];
    unint64_t v26 = objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v15, "softmaxAxis"));
    uint64_t v27 = [v26 unsignedIntegerValue];

    unint64_t v28 = 1 << -(char)__clz(v27);
    if ((v27 & (v27 - 1)) != 0) {
      unint64_t v29 = v28;
    }
    else {
      unint64_t v29 = v27;
    }
    int v30 = [v15 forwardKernel];
    unint64_t v31 = [v30 threadExecutionWidth];

    if (v29 <= v31) {
      unint64_t v19 = v31;
    }
    else {
      unint64_t v19 = v29;
    }
  }
  int v32 = [v11 descriptor];
  uint64_t v33 = [v32 shape];
  uint64_t v34 = [v33 count];

  unint64_t v35 = v34 - 1;
  unint64_t v54 = v14;
  for (uint64_t i = 1; v35 > [v15 softmaxAxis]; --v35)
  {
    uint64_t v37 = [v11 descriptor];
    unint64_t v38 = [v37 shape];
    unint64_t v39 = [v38 objectAtIndexedSubscript:v35];
    i *= [v39 unsignedIntegerValue];
  }
  if ([v15 softmaxAxis]) {
    uint64_t v40 = [v15 batchSize];
  }
  else {
    uint64_t v40 = 1;
  }
  int v53 = (void *)v17;
  unint64_t v41 = v10;
  if ((unint64_t)[v15 softmaxAxis] >= 2)
  {
    unint64_t v42 = 1;
    do
    {
      unint64_t v43 = [v11 descriptor];
      uint64_t v44 = [v43 shape];
      id v45 = [v44 objectAtIndexedSubscript:v42];
      v40 *= [v45 unsignedIntegerValue];

      ++v42;
    }
    while (v42 < [v15 softmaxAxis]);
  }
  unint64_t v46 = [v11 descriptor];
  unint64_t v47 = [v46 shape];
  int v48 = objc_msgSend(v47, "objectAtIndexedSubscript:", objc_msgSend(v15, "softmaxAxis"));
  v60[0] = [v48 unsignedIntegerValue];

  BOOL v61 = v19 >= v60[0];
  v60[1] = [v15 softmaxAxis];
  int v62 = i;
  int v63 = v60[0] * i;
  unint64_t v49 = [v56 computeCommandEncoderWithDispatchType:0];
  if (v19 < v60[0]) {
    [v15 forwardKernel];
  }
  else {
  BOOL v50 = [v15 forwardStatisticsKernel];
  }
  [v49 setComputePipelineState:v50];

  [v49 setBuffer:v53 offset:0 atIndex:0];
  [v49 setBuffer:v52 offset:0 atIndex:1];
  [v49 setBytes:v60 length:20 atIndex:2];
  [v49 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * (v19 + v19 * v61)) atIndex:0];
  v59[0] = i;
  v59[1] = v40;
  v59[2] = 1;
  unint64_t v57 = v19;
  int64x2_t v58 = vdupq_n_s64(1uLL);
  [v49 dispatchThreadgroups:v59 threadsPerThreadgroup:&v57];
  [v49 endEncoding];
}

- (void)dispatchGradientSoftmaxKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v11 deviceMemory];
  unint64_t v51 = v12;
  id v14 = [v12 deviceMemory];
  uint64_t v52 = v10;
  id v15 = [v10 objectAtIndexedSubscript:a6];
  unint64_t v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  int v48 = [v16 objectAtIndexedSubscript:a6];

  BOOL v50 = v13;
  unint64_t v47 = [v13 objectAtIndexedSubscript:a6];
  unint64_t v49 = v14;
  unint64_t v46 = [v14 objectAtIndexedSubscript:a6];
  id v45 = [v15 result];
  uint64_t v17 = [v15 gradientKernel];
  unint64_t v18 = [v17 maxTotalThreadsPerThreadgroup];

  unint64_t v19 = [v11 descriptor];
  id v20 = [v19 shape];
  unint64_t v21 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v15, "softmaxAxis"));
  unint64_t v22 = [v21 unsignedIntegerValue];

  if (v18 > v22)
  {
    unint64_t v23 = [v11 descriptor];
    uint64_t v24 = [v23 shape];
    uint64_t v25 = objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v15, "softmaxAxis"));
    unint64_t v18 = [v25 unsignedIntegerValue];

    if ((v18 & (v18 - 1)) != 0) {
      unint64_t v18 = 1 << -(char)__clz(v18);
    }
  }
  unint64_t v26 = [v11 descriptor];
  uint64_t v27 = [v26 shape];
  uint64_t v28 = [v27 count];

  unint64_t v29 = v28 - 1;
  unint64_t v30 = [v15 softmaxAxis];
  uint64_t v31 = 1;
  while (v29 > v30)
  {
    int v32 = [v11 descriptor];
    uint64_t v33 = [v32 shape];
    uint64_t v34 = [v33 objectAtIndexedSubscript:v29];
    v31 *= [v34 unsignedIntegerValue];

    --v29;
    unint64_t v30 = [v15 softmaxAxis];
  }
  if ([v15 softmaxAxis]) {
    uint64_t v35 = [v15 batchSize];
  }
  else {
    uint64_t v35 = 1;
  }
  if ((unint64_t)[v15 softmaxAxis] >= 2)
  {
    unint64_t v36 = 1;
    do
    {
      uint64_t v37 = [v11 descriptor];
      unint64_t v38 = [v37 shape];
      unint64_t v39 = [v38 objectAtIndexedSubscript:v36];
      v35 *= [v39 unsignedIntegerValue];

      ++v36;
    }
    while (v36 < [v15 softmaxAxis]);
  }
  uint64_t v40 = [v11 descriptor];
  unint64_t v41 = [v40 shape];
  unint64_t v42 = objc_msgSend(v41, "objectAtIndexedSubscript:", objc_msgSend(v15, "softmaxAxis"));
  v56[0] = [v42 unsignedIntegerValue];

  BOOL v57 = v18 >= v56[0];
  v56[1] = [v15 softmaxAxis];
  int v58 = v31;
  int v59 = v56[0] * v31;
  unint64_t v43 = [v48 computeCommandEncoderWithDispatchType:0];
  uint64_t v44 = [v15 gradientKernel];
  [v43 setComputePipelineState:v44];

  [v43 setBuffer:v47 offset:0 atIndex:0];
  [v43 setBuffer:v46 offset:0 atIndex:1];
  [v43 setBuffer:v45 offset:0 atIndex:2];
  [v43 setBytes:v56 length:20 atIndex:3];
  [v43 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * (v18 + v18 * v57)) atIndex:0];
  v55[0] = v31;
  v55[1] = v35;
  v55[2] = 1;
  unint64_t v53 = v18;
  int64x2_t v54 = vdupq_n_s64(1uLL);
  [v43 dispatchThreadgroups:v55 threadsPerThreadgroup:&v53];
  [v43 endEncoding];
}

- (void)dispatchForwardPoolingKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forTraining:(BOOL)a7
{
  BOOL v96 = a7;
  id v11 = a4;
  id v12 = a5;
  id v13 = a3;
  v98 = v11;
  id v14 = [v11 deviceMemory];
  id v15 = [v12 deviceMemory];
  unint64_t v16 = [v13 objectAtIndexedSubscript:a6];

  uint64_t v17 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v18 = [v17 objectAtIndexedSubscript:a6];

  unint64_t v19 = [(MLCDeviceGPU *)self deviceList];
  uint64_t v20 = [v19 objectAtIndexedSubscript:a6];

  uint64_t v95 = [v14 objectAtIndexedSubscript:a6];
  uint64_t v97 = [v15 objectAtIndexedSubscript:a6];
  unint64_t v21 = [v16 forwardKernel];
  unint64_t v87 = [v21 maxTotalThreadsPerThreadgroup];

  unint64_t v22 = [v12 descriptor];
  unint64_t v23 = [v22 shape];
  uint64_t v24 = [v23 count];

  uint64_t v92 = v14;
  uint64_t v89 = (void *)v20;
  uint64_t v90 = (void *)v18;
  if (v24 == 4)
  {
    uint64_t v25 = [v12 descriptor];
    unint64_t v26 = [v25 shape];
    uint64_t v27 = v26;
    uint64_t v28 = 3;
  }
  else
  {
    if (v24 != 3)
    {
      uint64_t v31 = 8;
      goto LABEL_11;
    }
    uint64_t v25 = [v12 descriptor];
    unint64_t v26 = [v25 shape];
    uint64_t v27 = v26;
    uint64_t v28 = 2;
  }
  unint64_t v29 = [v26 objectAtIndexedSubscript:v28];
  unint64_t v30 = [v29 unsignedIntegerValue];

  uint64_t v31 = 8;
  uint64_t v32 = 32;
  if (v30 < 0x20) {
    uint64_t v32 = 16;
  }
  if (v30 >= 0x10) {
    uint64_t v31 = v32;
  }
LABEL_11:
  unint64_t v88 = v31;
  uint64_t v33 = [v12 descriptor];
  uint64_t v34 = [v33 shape];
  int v35 = 1;
  unint64_t v36 = [v34 objectAtIndexedSubscript:1];
  uint64_t v94 = [v36 unsignedIntegerValue];

  uint64_t v93 = [v16 batchSize];
  long long v120 = 0u;
  long long v116 = 0u;
  BOOL v101 = v96;
  int v102 = [v16 kernelSizeInX];
  int v103 = [v16 kernelSizeInY];
  int v104 = [v16 strideInX];
  int v105 = [v16 strideInY];
  int v106 = [v16 dilationRateInX];
  int v107 = [v16 dilationRateInY];
  int v108 = [v16 paddingLeft];
  int v109 = [v16 paddingTop];
  int v110 = [v16 paddingRight];
  int v111 = [v16 paddingBottom];
  float v112 = 1.0 / (float)(v103 * v102);
  int v113 = [v16 batchSize];
  uint64_t v37 = [v98 descriptor];
  unint64_t v38 = [v37 shape];
  unint64_t v39 = [v38 objectAtIndexedSubscript:1];
  int v40 = [v39 unsignedIntegerValue];
  int v114 = v40;

  int v117 = [v16 batchSize];
  unint64_t v41 = [v98 descriptor];
  unint64_t v42 = [v41 shape];
  unint64_t v43 = [v42 objectAtIndexedSubscript:1];
  int v44 = [v43 unsignedIntegerValue];
  int v118 = v44;

  uint64_t v115 = 0x100000001;
  uint64_t v119 = 0x100000001;
  id v45 = [v12 descriptor];
  unint64_t v46 = [v45 shape];
  uint64_t v47 = [v46 count];

  uint64_t v91 = v15;
  if (v47 == 4)
  {
    int v58 = [v98 descriptor];
    [v58 shape];
    v60 = int v59 = v40;
    BOOL v61 = [v60 objectAtIndexedSubscript:2];
    int v49 = [v61 unsignedIntegerValue];
    LODWORD(v115) = v49;

    int v62 = [v98 descriptor];
    int v63 = [v62 shape];
    unint64_t v64 = [v63 objectAtIndexedSubscript:3];
    uint64_t v86 = [v64 unsignedIntegerValue];
    HIDWORD(v115) = v86;

    unint64_t v65 = [v12 descriptor];
    unint64_t v66 = [v65 shape];
    unint64_t v67 = [v66 objectAtIndexedSubscript:2];
    LODWORD(v119) = [v67 unsignedIntegerValue];

    unint64_t v68 = [v12 descriptor];
    int v69 = [v68 shape];
    char v70 = [v69 objectAtIndexedSubscript:3];
    HIDWORD(v119) = [v70 unsignedIntegerValue];

    int v40 = v59;
    unsigned int v48 = HIDWORD(v119);
    int v35 = v119;
    unsigned int v50 = v86;
  }
  else
  {
    unsigned int v48 = 1;
    int v49 = 1;
    unsigned int v50 = 1;
    if (v47 == 3)
    {
      unint64_t v51 = [v98 descriptor];
      uint64_t v52 = [v51 shape];
      unint64_t v53 = [v52 objectAtIndexedSubscript:2];
      unsigned int v50 = [v53 unsignedIntegerValue];
      HIDWORD(v115) = v50;

      int v35 = 1;
      LODWORD(v115) = 1;
      int64x2_t v54 = [v12 descriptor];
      int v55 = [v54 shape];
      [v55 objectAtIndexedSubscript:2];
      v57 = int v56 = v40;
      unsigned int v48 = [v57 unsignedIntegerValue];
      HIDWORD(v119) = v48;

      int v40 = v56;
      LODWORD(v119) = 1;
      int v49 = 1;
    }
  }
  *((void *)&v116 + 1) = v50 | 0x100000000;
  LODWORD(v116) = v49 * v50 * v40;
  DWORD1(v116) = v49 * v50;
  DWORD1(v120) = v35 * v48;
  *((void *)&v120 + 1) = v48 | 0x100000000;
  LODWORD(v120) = v35 * v48 * v44;
  if (!v96 || [v16 metalKernelType] != 15)
  {
    unint64_t v71 = v12;
    int v75 = 0;
    long long v74 = v92;
    goto LABEL_20;
  }
  unint64_t v71 = v12;
  uint64_t v72 = [v16 batchSize];
  int v73 = [v16 poolingIndicesBuffer];

  long long v74 = v92;
  if (v73)
  {
    int v75 = 1;
LABEL_20:
    int v77 = v90;
    long long v76 = v91;
    uint64_t v78 = v89;
    goto LABEL_21;
  }
  uint64_t v84 = 4 * v72 * (int)(v35 * v44 * v48);
  uint64_t v78 = v89;
  long long v85 = objc_msgSend(v89, "newBufferWithLength:options:", v84, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
  [v16 setPoolingIndicesBuffer:v85];

  int v75 = 1;
  int v77 = v90;
  long long v76 = v91;
LABEL_21:
  uint64_t v79 = objc_msgSend(v77, "computeCommandEncoderWithDispatchType:", 0, v86);
  uint64_t v80 = [v16 forwardKernel];
  [v79 setComputePipelineState:v80];

  [v79 setBuffer:v95 offset:0 atIndex:0];
  [v79 setBuffer:v97 offset:0 atIndex:1];
  if (v75)
  {
    [v16 poolingIndicesBuffer];
    v82 = unint64_t v81 = (void *)v95;
    [v79 setBuffer:v82 offset:0 atIndex:2];
  }
  else
  {
    [v79 setBuffer:v95 offset:0 atIndex:2];
    unint64_t v81 = (void *)v95;
  }
  if (v87 / v88 >= v88) {
    unint64_t v83 = v88;
  }
  else {
    unint64_t v83 = v87 / v88;
  }
  [v79 setBytes:&v101 length:112 atIndex:3];
  [v79 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v88 * v83) atIndex:0];
  v100[0] = v94;
  v100[1] = v93;
  v100[2] = 1;
  v99[0] = v88;
  v99[1] = v83;
  v99[2] = 1;
  [v79 dispatchThreadgroups:v100 threadsPerThreadgroup:v99];
  [v79 endEncoding];
}

- (void)dispatchGradientPoolingKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v10 deviceMemory];
  id v14 = [v11 deviceMemory];
  id v15 = [v12 objectAtIndexedSubscript:a6];

  unint64_t v88 = self;
  unint64_t v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v93 = [v16 objectAtIndexedSubscript:a6];

  uint64_t v92 = [v13 objectAtIndexedSubscript:a6];
  uint64_t v91 = [v14 objectAtIndexedSubscript:a6];
  uint64_t v90 = [v15 source];
  uint64_t v89 = [v15 result];
  uint64_t v17 = [v15 gradientKernel];
  unint64_t v18 = [v17 maxTotalThreadsPerThreadgroup];

  unint64_t v19 = [v15 gradientKernel];
  uint64_t v85 = [v19 threadExecutionWidth];

  uint64_t v20 = [v10 descriptor];
  unint64_t v21 = [v20 shape];
  uint64_t v22 = [v21 count];

  uint64_t v99 = v10;
  uint64_t v94 = v14;
  uint64_t v95 = v13;
  if (v22 == 4)
  {
    unint64_t v23 = [v10 descriptor];
    uint64_t v24 = [v23 shape];
    uint64_t v25 = v24;
    uint64_t v26 = 3;
  }
  else
  {
    if (v22 != 3)
    {
      unint64_t v30 = 8;
      goto LABEL_11;
    }
    unint64_t v23 = [v10 descriptor];
    uint64_t v24 = [v23 shape];
    uint64_t v25 = v24;
    uint64_t v26 = 2;
  }
  uint64_t v27 = [v24 objectAtIndexedSubscript:v26];
  unint64_t v28 = [v27 unsignedIntegerValue];

  uint64_t v29 = 32;
  if (v28 < 0x20) {
    uint64_t v29 = 16;
  }
  if (v28 >= 0x10) {
    unint64_t v30 = v29;
  }
  else {
    unint64_t v30 = 8;
  }
LABEL_11:
  unint64_t v31 = v18 / v30;
  if (v18 / v30 >= v30) {
    unint64_t v31 = v30;
  }
  unint64_t v96 = v31;
  uint64_t v32 = [v11 descriptor];
  uint64_t v33 = [v32 shape];
  int v34 = 1;
  int v35 = [v33 objectAtIndexedSubscript:1];
  uint64_t v87 = [v35 unsignedIntegerValue];

  uint64_t v86 = [v15 batchSize];
  long long v130 = 0u;
  long long v126 = 0u;
  int v111 = 0;
  int v112 = [v15 kernelSizeInX];
  int v113 = [v15 kernelSizeInY];
  int v114 = [v15 strideInX];
  int v115 = [v15 strideInY];
  int v116 = [v15 dilationRateInX];
  int v117 = [v15 dilationRateInY];
  int v118 = [v15 paddingLeft];
  int v119 = [v15 paddingTop];
  int v120 = [v15 paddingRight];
  int v121 = [v15 paddingBottom];
  float v122 = 1.0 / (float)(v113 * v112);
  int v123 = [v15 batchSize];
  unint64_t v36 = [v11 descriptor];
  uint64_t v37 = [v36 shape];
  unint64_t v38 = [v37 objectAtIndexedSubscript:1];
  int v39 = [v38 unsignedIntegerValue];
  int v124 = v39;

  int v127 = [v15 batchSize];
  int v40 = [v11 descriptor];
  unint64_t v41 = [v40 shape];
  unint64_t v42 = [v41 objectAtIndexedSubscript:1];
  int v43 = [v42 unsignedIntegerValue];
  int v128 = v43;

  uint64_t v125 = 0x100000001;
  uint64_t v129 = 0x100000001;
  int v44 = [v11 descriptor];
  id v45 = [v44 shape];
  uint64_t v46 = [v45 count];

  unint64_t v97 = v30;
  v98 = v11;
  if (v46 == 4)
  {
    int v56 = [v11 descriptor];
    BOOL v57 = [v56 shape];
    int v58 = [v57 objectAtIndexedSubscript:2];
    int v48 = [v58 unsignedIntegerValue];
    LODWORD(v125) = v48;

    int v59 = [v11 descriptor];
    unint64_t v60 = [v59 shape];
    BOOL v61 = [v60 objectAtIndexedSubscript:3];
    int v49 = [v61 unsignedIntegerValue];
    HIDWORD(v125) = v49;

    int v62 = [v99 descriptor];
    int v63 = [v62 shape];
    unint64_t v64 = [v63 objectAtIndexedSubscript:2];
    int v34 = [v64 unsignedIntegerValue];
    LODWORD(v129) = v34;

    unint64_t v65 = [v99 descriptor];
    unint64_t v66 = [v65 shape];
    unint64_t v67 = [v66 objectAtIndexedSubscript:3];
    HIDWORD(v129) = [v67 unsignedIntegerValue];

    unsigned int v47 = HIDWORD(v129);
  }
  else
  {
    unsigned int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    if (v46 == 3)
    {
      unsigned int v50 = [v98 descriptor];
      unint64_t v51 = [v50 shape];
      uint64_t v52 = [v51 objectAtIndexedSubscript:2];
      int v49 = [v52 unsignedIntegerValue];
      HIDWORD(v125) = v49;

      int v34 = 1;
      LODWORD(v125) = 1;
      unint64_t v53 = [v99 descriptor];
      int64x2_t v54 = [v53 shape];
      int v55 = [v54 objectAtIndexedSubscript:2];
      unsigned int v47 = [v55 unsignedIntegerValue];
      HIDWORD(v129) = v47;

      LODWORD(v129) = 1;
      int v48 = 1;
    }
  }
  HIDWORD(v126) = 1;
  int v68 = v48 * v49;
  int v69 = v48 * v49 * v39;
  LODWORD(v126) = v69;
  *(void *)((char *)&v126 + 4) = __PAIR64__(v49, v68);
  *((void *)&v130 + 1) = v47 | 0x100000000;
  LODWORD(v130) = v34 * v47 * v43;
  DWORD1(v130) = v34 * v47;
  char v70 = [v93 computeCommandEncoderWithDispatchType:0];
  unint64_t v71 = [(MLCDeviceGPU *)v88 gpuPipelineStatesMemFillFloat];
  uint64_t v72 = [v71 objectAtIndexedSubscript:a6];
  unint64_t v73 = [v72 maxTotalThreadsPerThreadgroup];

  int v109 = 0;
  int v110 = v69 * [v15 batchSize];
  unint64_t v74 = (v73 + ((unint64_t)(v110 + 3) >> 2) - 1) / v73;
  int v75 = [(MLCDeviceGPU *)v88 gpuPipelineStatesMemFillFloat];
  long long v76 = [v75 objectAtIndexedSubscript:a6];
  [v70 setComputePipelineState:v76];

  [v70 setBuffer:v91 offset:0 atIndex:0];
  [v70 setBytes:&v109 length:8 atIndex:1];
  unint64_t v107 = v74;
  int64x2_t v108 = vdupq_n_s64(1uLL);
  unint64_t v105 = v73;
  int64x2_t v106 = v108;
  [v70 dispatchThreadgroups:&v107 threadsPerThreadgroup:&v105];
  int v77 = [v15 gradientKernel];
  [v70 setComputePipelineState:v77];

  [v70 setBuffer:v92 offset:0 atIndex:0];
  [v70 setBuffer:v91 offset:0 atIndex:1];
  if ([v15 metalKernelType] == 15)
  {
    uint64_t v78 = [v15 poolingIndicesBuffer];
    [v70 setBuffer:v78 offset:0 atIndex:2];

    uint64_t v80 = v98;
    uint64_t v79 = v99;
    unint64_t v81 = v94;
    int64x2_t v82 = (void *)v90;
  }
  else
  {
    int64x2_t v82 = (void *)v90;
    [v70 setBuffer:v90 offset:0 atIndex:2];
    uint64_t v80 = v98;
    uint64_t v79 = v99;
    unint64_t v81 = v94;
  }
  [v70 setBuffer:v89 offset:0 atIndex:3];
  [v70 setBytes:&v111 length:112 atIndex:4];
  [v70 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v97 * v96) atIndex:0];
  if (v112 <= v114 && v113 <= v115)
  {
    v101[0] = v87;
    v101[1] = v86;
    v101[2] = 1;
    v100[0] = v97;
    v100[1] = v96;
    v100[2] = 1;
    unint64_t v83 = v101;
    uint64_t v84 = v100;
  }
  else
  {
    v104[0] = v87;
    v104[1] = v86;
    v104[2] = 1;
    uint64_t v102 = v85;
    int64x2_t v103 = vdupq_n_s64(1uLL);
    unint64_t v83 = v104;
    uint64_t v84 = &v102;
  }
  [v70 dispatchThreadgroups:v83 threadsPerThreadgroup:v84];
  [v70 endEncoding];
}

- (void)dispatchForwardResizeKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v10 deviceMemory];
  id v14 = [v11 deviceMemory];
  id v15 = [v12 objectAtIndexedSubscript:a6];

  unint64_t v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v17 = [v16 objectAtIndexedSubscript:a6];

  uint64_t v18 = [v13 objectAtIndexedSubscript:a6];
  unint64_t v64 = [v14 objectAtIndexedSubscript:a6];
  unint64_t v19 = [v10 descriptor];
  uint64_t v20 = [v19 shape];
  uint64_t v21 = [v20 count];

  int v68 = v13;
  int v69 = v11;
  unint64_t v66 = (void *)v17;
  unint64_t v67 = v14;
  unint64_t v65 = (void *)v18;
  if (v21 == 3)
  {
    unint64_t v42 = [v10 descriptor];
    int v43 = [v42 shape];
    unint64_t v41 = 1;
    int v44 = [v43 objectAtIndexedSubscript:1];
    uint64_t v25 = [v44 unsignedIntegerValue];

    id v45 = [v10 descriptor];
    uint64_t v46 = [v45 shape];
    unsigned int v47 = [v46 objectAtIndexedSubscript:2];
    unint64_t v29 = [v47 unsignedIntegerValue];

    unint64_t v38 = [v11 descriptor];
    int v39 = [v38 shape];
    int v40 = [v39 objectAtIndexedSubscript:2];
    unint64_t v37 = [v40 unsignedIntegerValue];
    uint64_t v33 = 1;
    goto LABEL_5;
  }
  if (v21 == 4)
  {
    uint64_t v22 = [v10 descriptor];
    unint64_t v23 = [v22 shape];
    uint64_t v24 = [v23 objectAtIndexedSubscript:1];
    uint64_t v25 = [v24 unsignedIntegerValue];

    uint64_t v26 = [v10 descriptor];
    uint64_t v27 = [v26 shape];
    unint64_t v28 = [v27 objectAtIndexedSubscript:3];
    unint64_t v29 = [v28 unsignedIntegerValue];

    unint64_t v30 = [v10 descriptor];
    unint64_t v31 = [v30 shape];
    uint64_t v32 = [v31 objectAtIndexedSubscript:2];
    uint64_t v33 = [v32 unsignedIntegerValue];

    int v34 = [v11 descriptor];
    int v35 = [v34 shape];
    unint64_t v36 = [v35 objectAtIndexedSubscript:3];
    unint64_t v37 = [v36 unsignedIntegerValue];

    unint64_t v38 = [v11 descriptor];
    int v39 = [v38 shape];
    int v40 = [v39 objectAtIndexedSubscript:2];
    unint64_t v41 = [v40 unsignedIntegerValue];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v25 = 1;
  unint64_t v41 = 1;
  unint64_t v37 = 1;
  uint64_t v33 = 1;
  unint64_t v29 = 1;
LABEL_7:
  LODWORD(v72[6]) = 1;
  LODWORD(v72[7]) = v29;
  LODWORD(v72[8]) = v29 * v33;
  LODWORD(v72[9]) = v29 * v33 * v25;
  LODWORD(v72[10]) = 1;
  LODWORD(v72[11]) = v37;
  LODWORD(v72[12]) = v37 * v41;
  LODWORD(v72[13]) = v37 * v41 * v25;
  LODWORD(v72[2]) = v29;
  LODWORD(v72[3]) = v33;
  LODWORD(v72[4]) = v37;
  LODWORD(v72[5]) = v41;
  [v15 scaleFactorX];
  v72[0] = 1.0 / v48;
  [v15 scaleFactorY];
  v72[1] = 1.0 / v49;
  LODWORD(v72[14]) = [v15 alignCorners];
  unsigned __int16 v50 = [v15 batchSize];
  unsigned int v51 = __clz(__rbit32(v50)) << 16;
  if (((unsigned __int16)(v50 - 1) & v50) != 0) {
    int v52 = -65536;
  }
  else {
    int v52 = v51;
  }
  LODWORD(v72[15]) = v52 & 0xFFFF0000 | v50;
  unint64_t v53 = [v15 forwardKernel];
  unint64_t v54 = [v53 maxTotalThreadsPerThreadgroup];

  if ([v15 isSpecialCasedNearestForwardKernel])
  {
    if (v29 >= v54) {
      unint64_t v55 = v54;
    }
    else {
      unint64_t v55 = v29;
    }
    unint64_t v56 = 1;
  }
  else
  {
    if (v37 >= 0x10) {
      unint64_t v55 = 16;
    }
    else {
      unint64_t v55 = 8;
    }
    if (v54 < 0x400)
    {
      BOOL v59 = v41 >= 0x10;
      uint64_t v57 = 16;
      uint64_t v58 = 8;
    }
    else
    {
      uint64_t v57 = 32;
      if (v37 >= 0x20) {
        unint64_t v55 = 32;
      }
      uint64_t v58 = 16;
      if (v41 < 0x10) {
        uint64_t v58 = 8;
      }
      BOOL v59 = v41 >= 0x20;
    }
    if (v59) {
      unint64_t v56 = v57;
    }
    else {
      unint64_t v56 = v58;
    }
    uint64_t v33 = v41;
    unint64_t v29 = v37;
  }
  unint64_t v60 = (v55 + v29 - 1) / v55;
  unint64_t v61 = (v33 + v56 - 1) / v56;
  int v62 = [v66 computeCommandEncoderWithDispatchType:0];
  int v63 = [v15 forwardKernel];
  [v62 setComputePipelineState:v63];

  [v62 setBuffer:v65 offset:0 atIndex:0];
  [v62 setBuffer:v64 offset:0 atIndex:1];
  [v62 setBytes:v72 length:64 atIndex:2];
  v71[0] = v60;
  v71[1] = v61;
  v71[2] = [v15 batchSize] * v25;
  v70[0] = v55;
  v70[1] = v56;
  v70[2] = 1;
  [v62 dispatchThreadgroups:v71 threadsPerThreadgroup:v70];
  [v62 endEncoding];
}

- (void)dispatchTransposeKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forward:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  unint64_t v74 = [v13 deviceMemory];
  unint64_t v73 = [v14 deviceMemory];
  int v77 = v12;
  id v15 = [v12 objectAtIndexedSubscript:a6];
  unint64_t v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  unint64_t v17 = a6;
  uint64_t v18 = v15;
  uint64_t v78 = [v16 objectAtIndexedSubscript:v17];

  memset(v84, 0, 76);
  unint64_t v19 = [v15 transposeShape];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    unint64_t v21 = 0;
    do
    {
      if (v7) {
        [v18 transposeShape];
      }
      else {
      uint64_t v22 = [v18 transposeGradientShape];
      }
      unint64_t v23 = v18;
      uint64_t v24 = [v22 objectAtIndexedSubscript:v21];
      __int16 v25 = [v24 unsignedIntegerValue];

      *((_WORD *)v84 + v21) = v25;
      uint64_t v26 = [v13 descriptor];
      uint64_t v27 = [v26 stride];
      unint64_t v28 = [v27 objectAtIndexedSubscript:v21];
      unint64_t v29 = (char *)v84 + 4 * v21;
      *((_DWORD *)v29 + 11) = (unint64_t)[v28 unsignedIntegerValue] >> 2;

      unint64_t v30 = [v14 descriptor];
      unint64_t v31 = [v30 stride];
      uint64_t v32 = [v31 objectAtIndexedSubscript:v21];
      *((_DWORD *)v29 + 15) = (unint64_t)[v32 unsignedIntegerValue] >> 2;

      ++v21;
      uint64_t v33 = [v23 transposeShape];
      unint64_t v34 = [v33 count];

      uint64_t v18 = v23;
    }
    while (v21 < v34);
  }
  int v35 = [v13 descriptor];
  unint64_t v36 = [v35 shape];
  uint64_t v37 = [v36 count];

  long long v76 = v14;
  if (v37 == 4)
  {
    if (v7) {
      uint64_t v38 = [v18 batchSize];
    }
    else {
      uint64_t v38 = 0;
    }
    uint64_t v79 = [v13 calculateBatchSizeToUse:v38];
    unint64_t v39 = 1;
    HIDWORD(v84[0]) = 1;
  }
  else
  {
    unint64_t v39 = 0;
    uint64_t v79 = 1;
  }
  int v40 = [v18 forwardKernel];
  unint64_t v41 = [v40 maxTotalThreadsPerThreadgroup];

  long long v86 = xmmword_1DD1F0C50;
  long long v87 = xmmword_1DD1F0C60;
  v85[0] = xmmword_1DD1F0C50;
  v85[1] = xmmword_1DD1F0C60;
  unint64_t v42 = [v13 descriptor];
  int v43 = [v42 shape];
  unint64_t v44 = [v43 count];

  if (v39 < v44)
  {
    unint64_t v45 = v39;
    do
    {
      uint64_t v46 = [v13 descriptor];
      unsigned int v47 = [v46 shape];
      float v48 = [v47 objectAtIndexedSubscript:v45];
      unint64_t v49 = [v48 unsignedIntegerValue];

      if (v49 <= v41)
      {
        *((void *)&v86 + v45) = v49;
        unint64_t v50 = v49;
      }
      else if (v49 % v41)
      {
        *((void *)&v86 + v45) = 1;
        unint64_t v50 = 1;
      }
      else
      {
        *((void *)&v86 + v45) = v41;
        unint64_t v50 = v41;
      }
      *((void *)v85 + v45++) = (v49 + v50 - 1) / v50;
      v41 /= v50;
      unsigned int v51 = [v13 descriptor];
      int v52 = [v51 shape];
      unint64_t v53 = [v52 count];
    }
    while (v45 < v53);
  }
  unint64_t v54 = [v13 descriptor];
  unint64_t v55 = [v54 shape];
  uint64_t v56 = [v55 count];

  if (v56)
  {
    unint64_t v57 = 0;
    do
    {
      if (v7) {
        [v18 transposeShape];
      }
      else {
      uint64_t v58 = [v18 transposeGradientShape];
      }
      BOOL v59 = [v58 objectAtIndexedSubscript:v57];
      uint64_t v60 = [v59 unsignedIntegerValue];

      *(_DWORD *)(((unint64_t)v84 | 0xC) + 4 * v57++) = *((void *)&v86 + v60);
      unint64_t v61 = [v13 descriptor];
      int v62 = [v61 shape];
      unint64_t v63 = [v62 count];
    }
    while (v57 < v63);
  }
  unint64_t v64 = [v78 computeCommandEncoderWithDispatchType:0];
  unint64_t v65 = [v18 forwardKernel];
  [v64 setComputePipelineState:v65];

  if (v79)
  {
    uint64_t v66 = 0;
    uint64_t v67 = 4 * v86 * *((void *)&v86 + 1) * v87 * *((void *)&v87 + 1);
    uint64_t v68 = v39 | 2;
    do
    {
      DWORD2(v84[0]) = v66;
      int v69 = [v74 objectAtIndexedSubscript:a6];
      [v64 setBuffer:v69 offset:0 atIndex:0];

      char v70 = [v73 objectAtIndexedSubscript:a6];
      [v64 setBuffer:v70 offset:0 atIndex:1];

      [v64 setBytes:v84 length:76 atIndex:2];
      [v64 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(v67) atIndex:0];
      uint64_t v71 = *((void *)v85 + v68);
      long long v82 = *(_OWORD *)((unint64_t)v85 | (8 * v39));
      uint64_t v83 = v71;
      uint64_t v72 = *((void *)&v86 + v68);
      long long v80 = *(_OWORD *)((unint64_t)&v86 & 0xFFFFFFFFFFFFFFF7 | (8 * (v39 & 1)));
      uint64_t v81 = v72;
      [v64 dispatchThreadgroups:&v82 threadsPerThreadgroup:&v80];
      ++v66;
    }
    while (v79 != v66);
  }
  [v64 endEncoding];
}

- (void)dispatchGradientResizeKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v10 deviceMemory];
  id v14 = [v11 deviceMemory];
  id v15 = [v12 objectAtIndexedSubscript:a6];

  int v69 = self;
  unint64_t v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  int v77 = [v16 objectAtIndexedSubscript:a6];

  unint64_t v74 = v13;
  uint64_t v72 = [v13 objectAtIndexedSubscript:a6];
  unint64_t v73 = v14;
  unint64_t v70 = a6;
  uint64_t v71 = [v14 objectAtIndexedSubscript:a6];
  unint64_t v17 = [v10 descriptor];
  uint64_t v18 = [v17 shape];
  uint64_t v19 = [v18 count];

  if (v19 == 3)
  {
    unint64_t v39 = [v10 descriptor];
    int v40 = [v39 shape];
    unint64_t v38 = 1;
    unint64_t v41 = [v40 objectAtIndexedSubscript:1];
    uint64_t v68 = [v41 unsignedIntegerValue];

    unint64_t v42 = [v10 descriptor];
    int v43 = [v42 shape];
    unint64_t v44 = [v43 objectAtIndexedSubscript:2];
    uint64_t v26 = [v44 unsignedIntegerValue];

    int v35 = [v11 descriptor];
    unint64_t v36 = [v35 shape];
    uint64_t v37 = [v36 objectAtIndexedSubscript:2];
    unint64_t v34 = [v37 unsignedIntegerValue];
    uint64_t v30 = 1;
    goto LABEL_5;
  }
  if (v19 == 4)
  {
    uint64_t v20 = [v10 descriptor];
    unint64_t v21 = [v20 shape];
    uint64_t v22 = [v21 objectAtIndexedSubscript:1];
    uint64_t v68 = [v22 unsignedIntegerValue];

    unint64_t v23 = [v10 descriptor];
    uint64_t v24 = [v23 shape];
    __int16 v25 = [v24 objectAtIndexedSubscript:3];
    uint64_t v26 = [v25 unsignedIntegerValue];

    uint64_t v27 = [v10 descriptor];
    unint64_t v28 = [v27 shape];
    unint64_t v29 = [v28 objectAtIndexedSubscript:2];
    uint64_t v30 = [v29 unsignedIntegerValue];

    unint64_t v31 = [v11 descriptor];
    uint64_t v32 = [v31 shape];
    uint64_t v33 = [v32 objectAtIndexedSubscript:3];
    unint64_t v34 = [v33 unsignedIntegerValue];

    int v35 = [v11 descriptor];
    unint64_t v36 = [v35 shape];
    uint64_t v37 = [v36 objectAtIndexedSubscript:2];
    unint64_t v38 = [v37 unsignedIntegerValue];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v68 = 1;
  unint64_t v38 = 1;
  unint64_t v34 = 1;
  uint64_t v30 = 1;
  uint64_t v26 = 1;
LABEL_7:
  unint64_t v45 = [v15 gradientKernel];
  unint64_t v46 = [v45 maxTotalThreadsPerThreadgroup];

  if (v34 >= 0x10) {
    unint64_t v47 = 16;
  }
  else {
    unint64_t v47 = 8;
  }
  int v75 = v11;
  long long v76 = v10;
  if (v46 < 0x400)
  {
    BOOL v50 = v38 >= 0x10;
    uint64_t v48 = 16;
    uint64_t v49 = 8;
  }
  else
  {
    uint64_t v48 = 32;
    if (v34 >= 0x20) {
      unint64_t v47 = 32;
    }
    uint64_t v49 = 16;
    if (v38 < 0x10) {
      uint64_t v49 = 8;
    }
    BOOL v50 = v38 >= 0x20;
  }
  if (v50) {
    unint64_t v51 = v48;
  }
  else {
    unint64_t v51 = v49;
  }
  LODWORD(v86[6]) = 1;
  LODWORD(v86[7]) = v26;
  LODWORD(v86[8]) = v26 * v30;
  LODWORD(v86[9]) = v26 * v30 * v68;
  LODWORD(v86[10]) = 1;
  LODWORD(v86[11]) = v34;
  LODWORD(v52) = v34 * v38 * v68;
  LODWORD(v86[12]) = v34 * v38;
  v86[13] = v52;
  LODWORD(v86[2]) = v26;
  LODWORD(v86[3]) = v30;
  LODWORD(v86[4]) = v34;
  LODWORD(v86[5]) = v38;
  [v15 scaleFactorX];
  v86[0] = 1.0 / v53;
  [v15 scaleFactorY];
  v86[1] = 1.0 / v54;
  LODWORD(v86[14]) = [v15 alignCorners];
  unsigned __int16 v55 = [v15 batchSize];
  unsigned int v56 = __clz(__rbit32(v55)) << 16;
  if (((unsigned __int16)(v55 - 1) & v55) != 0) {
    int v57 = -65536;
  }
  else {
    int v57 = v56;
  }
  LODWORD(v86[15]) = v57 & 0xFFFF0000 | v55;
  unint64_t v66 = (v30 + v51 - 1) / v51;
  unint64_t v67 = (v26 + v47 - 1) / v47;
  uint64_t v58 = [v77 computeCommandEncoderWithDispatchType:0];
  BOOL v59 = [(MLCDeviceGPU *)v69 gpuPipelineStatesMemFillFloat];
  uint64_t v60 = [v59 objectAtIndexedSubscript:v70];
  unint64_t v61 = [v60 maxTotalThreadsPerThreadgroup];

  int v84 = 0;
  int v85 = LODWORD(v52) * [v15 batchSize];
  unint64_t v62 = (v61 + ((unint64_t)(v85 + 3) >> 2) - 1) / v61;
  unint64_t v63 = [(MLCDeviceGPU *)v69 gpuPipelineStatesMemFillFloat];
  unint64_t v64 = [v63 objectAtIndexedSubscript:v70];
  [v58 setComputePipelineState:v64];

  [v58 setBuffer:v71 offset:0 atIndex:0];
  [v58 setBytes:&v84 length:8 atIndex:1];
  unint64_t v82 = v62;
  int64x2_t v83 = vdupq_n_s64(1uLL);
  unint64_t v80 = v61;
  int64x2_t v81 = v83;
  [v58 dispatchThreadgroups:&v82 threadsPerThreadgroup:&v80];
  unint64_t v65 = [v15 gradientKernel];
  [v58 setComputePipelineState:v65];

  [v58 setBuffer:v72 offset:0 atIndex:0];
  [v58 setBuffer:v71 offset:0 atIndex:1];
  [v58 setBytes:v86 length:64 atIndex:2];
  v79[0] = v67;
  v79[1] = v66;
  v79[2] = [v15 batchSize] * v68;
  v78[0] = v47;
  v78[1] = v51;
  v78[2] = 1;
  [v58 dispatchThreadgroups:v79 threadsPerThreadgroup:v78];
  [v58 endEncoding];
}

- (void)dispatchForwardArithmeticUnaryKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v11 deviceMemory];
  unint64_t v51 = [v13 objectAtIndexedSubscript:a6];

  float v52 = v12;
  id v14 = [v12 deviceMemory];
  BOOL v50 = [v14 objectAtIndexedSubscript:a6];

  float v53 = v10;
  id v15 = [v10 objectAtIndexedSubscript:a6];
  unint64_t v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v48 = [v16 objectAtIndexedSubscript:a6];

  uint64_t v17 = [v15 batchSize];
  uint64_t v18 = [v11 descriptor];
  uint64_t v19 = [v18 shape];
  uint64_t v20 = [v19 count];

  unint64_t v21 = [v11 descriptor];
  uint64_t v22 = [v21 shape];
  unint64_t v23 = v22;
  if (v20 == 1)
  {
    uint64_t v24 = [v22 objectAtIndexedSubscript:0];
    uint64_t v17 = [v24 unsignedIntegerValue];
  }
  else
  {
    unint64_t v25 = [v22 count];

    if (v25 >= 2)
    {
      unint64_t v26 = 1;
      do
      {
        uint64_t v27 = objc_msgSend(v11, "descriptor", v48);
        unint64_t v28 = [v27 shape];
        unint64_t v29 = [v28 objectAtIndexedSubscript:v26];
        v17 *= [v29 unsignedIntegerValue];

        ++v26;
        uint64_t v30 = [v11 descriptor];
        unint64_t v31 = [v30 shape];
        unint64_t v32 = [v31 count];
      }
      while (v26 < v32);
    }
  }
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  v58[0] = objc_msgSend(v15, "arithmeticOp", v48) - 4;
  v58[1] = v17;
  uint64_t v33 = [v15 neuronDescriptor];

  if (v33)
  {
    unint64_t v34 = [v15 neuronDescriptor];
    [v34 a];
    LODWORD(v59) = v35;

    unint64_t v36 = [v15 neuronDescriptor];
    [v36 b];
    HIDWORD(v59) = v37;

    unint64_t v38 = [v15 neuronDescriptor];
    LODWORD(v60) = [v38 activationType];
  }
  unint64_t v39 = (void *)MEMORY[0x1E01B11E0]();
  int v40 = [(MLCDeviceGPU *)self gpuPipelineStatesArithmeticUnaryForward];
  unint64_t v41 = [v40 objectAtIndexedSubscript:a6];
  unint64_t v42 = [v41 maxTotalThreadsPerThreadgroup];

  int v43 = self;
  unint64_t v44 = (v17 + v42 - 1) / v42;
  unint64_t v45 = [v49 computeCommandEncoderWithDispatchType:0];
  unint64_t v46 = [(MLCDeviceGPU *)v43 gpuPipelineStatesArithmeticUnaryForward];
  unint64_t v47 = [v46 objectAtIndexedSubscript:a6];
  [v45 setComputePipelineState:v47];

  [v45 memoryBarrierWithScope:2];
  [v45 setBuffer:v51 offset:0 atIndex:0];
  [v45 setBuffer:v50 offset:0 atIndex:1];
  [v45 setBytes:v58 length:24 atIndex:2];
  unint64_t v56 = v44;
  int64x2_t v57 = vdupq_n_s64(1uLL);
  unint64_t v54 = v42;
  int64x2_t v55 = v57;
  [v45 dispatchThreadgroups:&v56 threadsPerThreadgroup:&v54];
  [v45 endEncoding];
}

- (void)dispatchGradientArithmeticUnaryKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  float v52 = v10;
  id v13 = [v10 objectAtIndexedSubscript:a6];
  id v14 = [v11 deviceMemory];
  BOOL v50 = [v14 objectAtIndexedSubscript:a6];

  unint64_t v51 = v12;
  id v15 = [v12 deviceMemory];
  uint64_t v49 = [v15 objectAtIndexedSubscript:a6];

  uint64_t v48 = [v13 source];
  unint64_t v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  unint64_t v47 = [v16 objectAtIndexedSubscript:a6];

  uint64_t v17 = [v13 batchSize];
  uint64_t v18 = [v11 descriptor];
  uint64_t v19 = [v18 shape];
  uint64_t v20 = [v19 count];

  unint64_t v21 = [v11 descriptor];
  uint64_t v22 = [v21 shape];
  unint64_t v23 = v22;
  if (v20 == 1)
  {
    uint64_t v24 = [v22 objectAtIndexedSubscript:0];
    uint64_t v17 = [v24 unsignedIntegerValue];
  }
  else
  {
    unint64_t v25 = [v22 count];

    if (v25 >= 2)
    {
      unint64_t v26 = 1;
      do
      {
        uint64_t v27 = [v11 descriptor];
        unint64_t v28 = [v27 shape];
        unint64_t v29 = [v28 objectAtIndexedSubscript:v26];
        v17 *= [v29 unsignedIntegerValue];

        ++v26;
        uint64_t v30 = [v11 descriptor];
        unint64_t v31 = [v30 shape];
        unint64_t v32 = [v31 count];
      }
      while (v26 < v32);
    }
  }
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  v57[0] = [v13 arithmeticOp] - 4;
  v57[1] = v17;
  uint64_t v33 = [v13 neuronDescriptor];

  if (v33)
  {
    unint64_t v34 = [v13 neuronDescriptor];
    [v34 a];
    LODWORD(v58) = v35;

    unint64_t v36 = [v13 neuronDescriptor];
    [v36 b];
    HIDWORD(v58) = v37;

    unint64_t v38 = [v13 neuronDescriptor];
    LODWORD(v59) = [v38 activationType];
  }
  unint64_t context = (void *)MEMORY[0x1E01B11E0]();
  unint64_t v39 = [(MLCDeviceGPU *)self gpuPipelineStatesArithmeticUnaryGradient];
  int v40 = [v39 objectAtIndexedSubscript:a6];
  unint64_t v41 = [v40 maxTotalThreadsPerThreadgroup];

  unint64_t v42 = (v17 + v41 - 1) / v41;
  int v43 = [v47 computeCommandEncoderWithDispatchType:0];
  unint64_t v44 = [(MLCDeviceGPU *)self gpuPipelineStatesArithmeticUnaryGradient];
  unint64_t v45 = [v44 objectAtIndexedSubscript:a6];
  [v43 setComputePipelineState:v45];

  [v43 memoryBarrierWithScope:2];
  [v43 setBuffer:v48 offset:0 atIndex:0];
  [v43 setBuffer:v50 offset:0 atIndex:1];
  [v43 setBuffer:v49 offset:0 atIndex:2];
  [v43 setBytes:v57 length:24 atIndex:3];
  unint64_t v55 = v42;
  int64x2_t v56 = vdupq_n_s64(1uLL);
  unint64_t v53 = v41;
  int64x2_t v54 = v56;
  [v43 dispatchThreadgroups:&v55 threadsPerThreadgroup:&v53];
  [v43 endEncoding];
}

- (void)dispatchForwardArithmeticBinaryKernel:(id)a3 sourceTensor:(id)a4 sourceSecondaryTensor:(id)a5 resultTensor:(id)a6 deviceIndex:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [a3 objectAtIndexedSubscript:a7];
  unint64_t v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v17 = [v16 objectAtIndexedSubscript:a7];

  long long v28 = 0u;
  memset(v27, 0, sizeof(v27));
  switch([v15 arithmeticOp])
  {
    case 0x15u:
      int v18 = 4;
      goto LABEL_8;
    case 0x1Au:
      int v18 = 5;
      goto LABEL_8;
    case 0x1Bu:
      int v18 = 6;
      goto LABEL_8;
    case 0x1Cu:
      int v18 = 7;
      goto LABEL_8;
    case 0x1Du:
      int v18 = 8;
LABEL_8:
      LODWORD(v27[0]) = v18;
      break;
    default:
      LODWORD(v27[0]) = [v15 arithmeticOp];
      break;
  }
  uint64_t v19 = [v15 neuronDescriptor];

  if (v19)
  {
    uint64_t v20 = [v15 neuronDescriptor];
    [v20 a];
    LODWORD(v28) = v21;

    uint64_t v22 = [v15 neuronDescriptor];
    [v22 b];
    DWORD1(v28) = v23;

    uint64_t v24 = [v15 neuronDescriptor];
    DWORD2(v28) = [v24 activationType];
  }
  unint64_t v25 = [(MLCDeviceGPU *)self gpuPipelineStatesArithmeticBinaryForward];
  unint64_t v26 = [v25 objectAtIndexedSubscript:a7];
  [(MLCDeviceGPU *)self encodePrimitiveToCommandBuffer:v17 gpuDeviceOps:v15 sourceTensor:v14 secondaryTensor:v13 tertiaryTensor:0 resultTensor:v12 params:v27 sizeOfParams:96 pipelineState:v26 deviceIndex:a7];
}

- (void)dispatchForwardArithmeticTertiaryKernel:(id)a3 sourceTensor:(id)a4 sourceSecondaryTensor:(id)a5 sourceTertiaryTensor:(id)a6 resultTensor:(id)a7 deviceIndex:(unint64_t)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  int v18 = [a3 objectAtIndexedSubscript:a8];
  uint64_t v19 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v20 = [v19 objectAtIndexedSubscript:a8];

  memset(v34, 0, sizeof(v34));
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  int v29 = 10;
  int v21 = [v18 neuronDescriptor];

  if (v21)
  {
    uint64_t v22 = [v18 neuronDescriptor];
    [v22 a];
    v34[3] = v23;

    uint64_t v24 = [v18 neuronDescriptor];
    [v24 b];
    v34[4] = v25;

    unint64_t v26 = [v18 neuronDescriptor];
    v34[5] = [v26 activationType];
  }
  uint64_t v27 = [(MLCDeviceGPU *)self gpuPipelineStatesArithmeticBinaryForward];
  long long v28 = [v27 objectAtIndexedSubscript:a8];
  [(MLCDeviceGPU *)self encodePrimitiveToCommandBuffer:v20 gpuDeviceOps:v18 sourceTensor:v17 secondaryTensor:v16 tertiaryTensor:v15 resultTensor:v14 params:&v29 sizeOfParams:96 pipelineState:v28 deviceIndex:a8];
}

- (void)dispatchGradientArithmeticBinaryKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 secondaryResultGradientTensor:(id)a6 deviceIndex:(unint64_t)a7
{
  uint64_t v211 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  unint64_t v189 = a7;
  id v15 = [v11 objectAtIndexedSubscript:a7];
  unint64_t v178 = v15;
  id v173 = v11;
  if ([v15 useSourceGradientDeviceMemoryForResultGradientTensor]
    && [v15 useSourceGradientDeviceMemoryForSecondaryResultGradientTensor])
  {
    id v16 = [v15 neuronDescriptor];

    if (!v16) {
      goto LABEL_139;
    }
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
  }
  int v18 = v178;
  uint64_t v19 = [v178 source0Shape];
  __int16 v176 = [v178 source1Shape];
  uint64_t v20 = [v19 count];
  int v21 = [v19 objectAtIndexedSubscript:0];
  unint64_t v22 = [v21 unsignedIntegerValue];
  if (v20 == 1)
  {

    int v23 = v176;
  }
  else
  {
    if (v22 <= [v178 batchSize])
    {
      uint64_t v24 = [v19 objectAtIndexedSubscript:0];
      [v24 unsignedIntegerValue];
    }
    else
    {
      [v178 batchSize];
    }
    int v23 = v176;

    if ((unint64_t)[v19 count] >= 2)
    {
      unint64_t v25 = 1;
      do
      {
        unint64_t v26 = [v19 objectAtIndexedSubscript:v25];
        [v26 unsignedIntegerValue];

        ++v25;
      }
      while (v25 < [v19 count]);
    }
  }
  uint64_t v27 = [v23 count];
  long long v28 = v23;
  uint64_t v29 = v27;
  long long v30 = [v28 objectAtIndexedSubscript:0];
  unint64_t v31 = [v30 unsignedIntegerValue];
  if (v29 == 1)
  {
  }
  else
  {
    if (v31 <= [v178 batchSize])
    {
      long long v32 = v176;
      long long v33 = [v176 objectAtIndexedSubscript:0];
      [v33 unsignedIntegerValue];
    }
    else
    {
      [v178 batchSize];
      long long v32 = v176;
    }

    if ((unint64_t)[v32 count] >= 2)
    {
      unint64_t v34 = 1;
      do
      {
        int v35 = [v32 objectAtIndexedSubscript:v34];
        [v35 unsignedIntegerValue];

        ++v34;
      }
      while (v34 < [v32 count]);
    }
  }
  unint64_t v36 = [v12 descriptor];
  int v37 = [v36 shape];

  uint64_t v38 = [v37 count];
  BOOL v175 = v37;
  unint64_t v39 = [v37 objectAtIndexedSubscript:0];
  unint64_t v40 = [v39 unsignedIntegerValue];
  if (v38 == 1)
  {
  }
  else
  {
    if (v40 <= [v178 batchSize])
    {
      unint64_t v41 = v175;
      unint64_t v42 = [v175 objectAtIndexedSubscript:0];
      uint64_t v38 = [v42 unsignedIntegerValue];
    }
    else
    {
      uint64_t v38 = [v178 batchSize];
      unint64_t v41 = v175;
    }

    unint64_t v40 = 1;
    if ((unint64_t)[v41 count] >= 2)
    {
      unint64_t v43 = 1;
      do
      {
        unint64_t v44 = [v175 objectAtIndexedSubscript:v43];
        v40 *= [v44 unsignedIntegerValue];

        ++v43;
      }
      while (v43 < [v175 count]);
      int v18 = v178;
    }
  }
  unint64_t v177 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v38 columns:v40 rowBytes:4 * v40 dataType:268435488];
  __int16 v174 = [v12 deviceMemory];
  v188 = [v13 deviceMemory];
  unint64_t v183 = [v14 deviceMemory];
  unint64_t v45 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  v187 = [v45 objectAtIndexedSubscript:v189];

  long long v205 = 0u;
  long long v206 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  switch([v18 arithmeticOp])
  {
    case 0x15u:
      int v46 = 4;
      goto LABEL_39;
    case 0x1Au:
      int v46 = 5;
      goto LABEL_39;
    case 0x1Bu:
      int v46 = 6;
      goto LABEL_39;
    case 0x1Cu:
      int v46 = 7;
      goto LABEL_39;
    case 0x1Du:
      int v46 = 8;
LABEL_39:
      LODWORD(v201) = v46;
      uint64_t v48 = v175;
      break;
    default:
      if (v17) {
        int v47 = 9;
      }
      else {
        int v47 = [v18 arithmeticOp];
      }
      uint64_t v48 = v175;
      LODWORD(v201) = v47;
      break;
  }
  uint64_t v49 = [v18 neuronDescriptor];

  if (v49)
  {
    BOOL v50 = [v18 neuronDescriptor];
    [v50 a];
    LODWORD(v206) = v51;

    float v52 = [v18 neuronDescriptor];
    [v52 b];
    DWORD1(v206) = v53;

    int64x2_t v54 = [v18 neuronDescriptor];
    DWORD2(v206) = [v54 activationType];
  }
  int v55 = [v18 constantArithmeticSourcesFlags];
  HIDWORD(v205) = v55;
  int64x2_t v56 = [v18 source];

  if (!v56) {
    HIDWORD(v205) = v55 | 0x100;
  }
  unint64_t context = (void *)MEMORY[0x1E01B11E0]();
  id v171 = v13;
  id v172 = v12;
  id v169 = v19;
  id v170 = v14;
  if ([v48 count] == 1)
  {
    *(void *)((char *)&v203 + 4) = 0x100000001;
    *(void *)((char *)&v202 + 4) = 0x100000001;
    *(void *)((char *)&v201 + 4) = 0x100000001;
    int v57 = 1;
    HIDWORD(v203) = 1;
    HIDWORD(v202) = 1;
    HIDWORD(v201) = 1;
    uint64_t v58 = [v19 objectAtIndexedSubscript:0];
    LODWORD(v202) = [v58 unsignedIntegerValue];

    uint64_t v59 = [v176 objectAtIndexedSubscript:0];
    LODWORD(v203) = [v59 unsignedIntegerValue];

    uint64_t v60 = [v48 objectAtIndexedSubscript:0];
    int v61 = [v60 unsignedIntegerValue];
    LODWORD(v204) = v61;

    int v180 = 1;
    int v184 = 1;
  }
  else if ([v48 count] == 2)
  {
    *(void *)((char *)&v203 + 4) = 0x100000001;
    *(void *)((char *)&v202 + 4) = 0x100000001;
    *(void *)((char *)&v201 + 4) = 0x100000001;
    unint64_t v62 = [v19 objectAtIndexedSubscript:0];
    HIDWORD(v201) = [v62 unsignedIntegerValue];

    unint64_t v63 = [v176 objectAtIndexedSubscript:0];
    HIDWORD(v202) = [v63 unsignedIntegerValue];

    unint64_t v64 = [v48 objectAtIndexedSubscript:0];
    HIDWORD(v203) = [v64 unsignedIntegerValue];

    unint64_t v65 = [v19 objectAtIndexedSubscript:1];
    LODWORD(v202) = [v65 unsignedIntegerValue];

    unint64_t v66 = [v176 objectAtIndexedSubscript:1];
    LODWORD(v203) = [v66 unsignedIntegerValue];

    unint64_t v67 = [v48 objectAtIndexedSubscript:1];
    int v61 = [v67 unsignedIntegerValue];
    LODWORD(v204) = v61;

    int v57 = HIDWORD(v203);
    int v180 = 1;
    int v184 = 1;
  }
  else
  {
    uint64_t v68 = [v19 objectAtIndexedSubscript:0];
    unint64_t v69 = [v68 unsignedIntegerValue];
    if (v69 <= [v178 batchSize])
    {
      uint64_t v71 = [v19 objectAtIndexedSubscript:0];
      int v70 = [v71 unsignedIntegerValue];
    }
    else
    {
      int v70 = [v178 batchSize];
    }
    DWORD1(v201) = v70;

    uint64_t v72 = [v176 objectAtIndexedSubscript:0];
    unint64_t v73 = [v72 unsignedIntegerValue];
    if (v73 <= [v178 batchSize])
    {
      int v75 = [v176 objectAtIndexedSubscript:0];
      int v74 = [v75 unsignedIntegerValue];
    }
    else
    {
      int v74 = [v178 batchSize];
    }
    DWORD1(v202) = v74;

    long long v76 = [v48 objectAtIndexedSubscript:0];
    unint64_t v77 = [v76 unsignedIntegerValue];
    if (v77 <= [v178 batchSize])
    {
      uint64_t v79 = [v48 objectAtIndexedSubscript:0];
      int v78 = [v79 unsignedIntegerValue];
    }
    else
    {
      int v78 = [v178 batchSize];
    }
    DWORD1(v203) = v78;

    uint64_t v80 = [v48 count];
    int64x2_t v81 = [v19 objectAtIndexedSubscript:1];
    DWORD2(v201) = [v81 unsignedIntegerValue];

    unint64_t v82 = [v176 objectAtIndexedSubscript:1];
    DWORD2(v202) = [v82 unsignedIntegerValue];

    int64x2_t v83 = [v48 objectAtIndexedSubscript:1];
    int v180 = [v83 unsignedIntegerValue];
    DWORD2(v203) = v180;

    int v84 = [v19 objectAtIndexedSubscript:2];
    int v85 = [v84 unsignedIntegerValue];
    int v184 = v78;
    if (v80 == 3)
    {
      LODWORD(v202) = v85;

      long long v86 = [v176 objectAtIndexedSubscript:2];
      LODWORD(v203) = [v86 unsignedIntegerValue];

      long long v87 = [v48 objectAtIndexedSubscript:2];
      int v61 = [v87 unsignedIntegerValue];
      LODWORD(v204) = v61;

      HIDWORD(v203) = 1;
      int v57 = 1;
      HIDWORD(v202) = 1;
      HIDWORD(v201) = 1;
    }
    else
    {
      HIDWORD(v201) = v85;

      uint64_t v88 = [v176 objectAtIndexedSubscript:2];
      HIDWORD(v202) = [v88 unsignedIntegerValue];

      uint64_t v89 = [v48 objectAtIndexedSubscript:2];
      HIDWORD(v203) = [v89 unsignedIntegerValue];

      uint64_t v90 = [v19 objectAtIndexedSubscript:3];
      LODWORD(v202) = [v90 unsignedIntegerValue];

      uint64_t v91 = [v176 objectAtIndexedSubscript:3];
      LODWORD(v203) = [v91 unsignedIntegerValue];

      uint64_t v92 = [v48 objectAtIndexedSubscript:3];
      int v61 = [v92 unsignedIntegerValue];
      LODWORD(v204) = v61;

      int v57 = HIDWORD(v203);
    }
  }
  uint64_t v93 = 0;
  v208 = 0;
  uint64_t v209 = 0;
  v207[0] = 0;
  v207[1] = 0;
  char v94 = 1;
  uint64_t v95 = v178;
  while (1)
  {
    char v96 = v94;
    int v97 = [v95 constantArithmeticSourcesFlags];
    if (v96) {
      int v98 = 1;
    }
    else {
      int v98 = 2;
    }
    if ((v97 & v98) == 0)
    {
      BOOL v101 = &v201 + v93;
      int v102 = *((_DWORD *)v101 + 1) != v184;
      if (*((_DWORD *)v101 + 2) != v180) {
        v102 |= 2u;
      }
      int v104 = *((_DWORD *)v101 + 3);
      int v103 = *((_DWORD *)v101 + 4);
      if (v104 != v57) {
        v102 |= 4u;
      }
      int v105 = v103 == v61 ? v102 : v102 | 8;
      v210[v93] = v105;
      if (v105)
      {
        uint64_t v106 = [MEMORY[0x1E4F35980] temporaryMatrixWithCommandBuffer:v187 matrixDescriptor:v177];
        unint64_t v107 = (void *)v207[v93];
        v207[v93] = v106;

        int64x2_t v108 = (void *)v106;
        uint64_t v95 = v178;
        uint64_t v109 = [v108 data];
        v100 = *(&v208 + v93);
        *(&v208 + v93) = (void *)v109;
        goto LABEL_76;
      }
    }
    if ((v96 & 1) == 0) {
      break;
    }
    uint64_t v99 = [v188 objectAtIndexedSubscript:v189];
    v100 = v208;
    v208 = (void *)v99;
LABEL_76:

    char v94 = 0;
    uint64_t v93 = 1;
    if ((v96 & 1) == 0) {
      goto LABEL_79;
    }
  }
  uint64_t v110 = [v183 objectAtIndexedSubscript:v189];
  int v111 = *(&v208 + v93);
  *(&v208 + v93) = (void *)v110;

LABEL_79:
  unsigned int v112 = __clz(__rbit32((unsigned __int16)v184)) << 16;
  if (((unsigned __int16)(v184 - 1) & (unsigned __int16)v184) != 0) {
    int v113 = -65536;
  }
  else {
    int v113 = v112;
  }
  DWORD1(v205) = v113 & 0xFFFF0000 | (unsigned __int16)v184;
  int v114 = self;
  [(MLCDeviceGPU *)self gpuPipelineStatesArithmeticBinaryGradient];
  v116 = int v115 = v95;
  int v117 = [v116 objectAtIndexedSubscript:v189];
  unint64_t v118 = [v117 maxTotalThreadsPerThreadgroup];

  int v119 = v184 * v180;
  if (v61 >= 32) {
    uint64_t v120 = 32;
  }
  else {
    uint64_t v120 = 8;
  }
  uint64_t v185 = v120;
  char v121 = 5;
  if (v61 < 32) {
    char v121 = 3;
  }
  if (v118 >> v121 >= v57) {
    unint64_t v122 = v57;
  }
  else {
    unint64_t v122 = v118 >> v121;
  }
  if (v118 / (v122 << v121) >= v119) {
    unint64_t v123 = v119;
  }
  else {
    unint64_t v123 = v118 / (v122 << v121);
  }
  unint64_t v181 = (unint64_t)(v120 + v61 - 1) >> v121;
  unint64_t v124 = (v123 + v119 - 1) / v123;
  uint64_t v125 = [v187 computeCommandEncoderWithDispatchType:0];
  long long v126 = [(MLCDeviceGPU *)self gpuPipelineStatesArithmeticBinaryGradient];
  int v127 = [v126 objectAtIndexedSubscript:v189];
  [v125 setComputePipelineState:v127];

  int v128 = [v115 source];
  [v125 setBuffer:v128 offset:0 atIndex:0];

  uint64_t v129 = [v115 secondarySource];
  [v125 setBuffer:v129 offset:0 atIndex:1];

  long long v130 = [v174 objectAtIndexedSubscript:v189];
  [v125 setBuffer:v130 offset:0 atIndex:2];

  [v125 setBuffer:v208 offset:0 atIndex:3];
  [v125 setBuffer:v209 offset:0 atIndex:4];
  [v125 setBytes:&v201 length:96 atIndex:5];
  uint64_t v198 = v181;
  unint64_t v199 = (v122 + v57 - 1) / v122;
  unint64_t v200 = v124;
  v197[0] = v185;
  v197[1] = v122;
  v197[2] = v123;
  [v125 dispatchThreadgroups:&v198 threadsPerThreadgroup:v197];
  id v167 = v125;
  [v125 endEncoding];
  uint64_t v131 = 0;
  char v132 = 1;
  do
  {
    char v133 = v132;
    int v134 = v210[v131];
    if (v134)
    {
      WORD4(v205) = v210[v131];
      WORD5(v205) = v131;
      switch(v134)
      {
        case 1:
          char v186 = v133;
          int v135 = DWORD1(v203);
          signed int v136 = HIDWORD(v203) * DWORD2(v203) * v204;
          goto LABEL_101;
        case 2:
          char v186 = v133;
          int v135 = DWORD2(v203);
          signed int v136 = v204 * HIDWORD(v203);
          unint64_t v137 = [(MLCDeviceGPU *)v114 gpuPipelineStatesReduceAcrossChannel];
          v138 = [v137 objectAtIndexedSubscript:v189];

          uint64_t v139 = SDWORD1(v203);
          goto LABEL_102;
        case 3:
          char v186 = v133;
          signed int v136 = v204 * HIDWORD(v203);
          int v135 = DWORD2(v203) * DWORD1(v203);
LABEL_101:
          v147 = [(MLCDeviceGPU *)v114 gpuPipelineStatesReduceAcrossBatch];
          v138 = [v147 objectAtIndexedSubscript:v189];

          uint64_t v139 = 1;
LABEL_102:
          uint64_t v148 = v135;
          unint64_t v149 = [v138 maxTotalThreadsPerThreadgroup];
          unint64_t v150 = 1 << -(char)__clz(v136);
          if ((v136 & (unint64_t)(v136 - 1)) == 0) {
            unint64_t v150 = v136;
          }
          if (v149 < v136) {
            unint64_t v151 = (v136 + v149 - 1) / v149;
          }
          else {
            unint64_t v151 = 1;
          }
          if (v149 < v136) {
            unint64_t v152 = v149;
          }
          else {
            unint64_t v152 = v150;
          }
          v153 = [v187 computeCommandEncoderWithDispatchType:0];
          uint64_t v182 = v138;
          [v153 setComputePipelineState:v138];
          uint64_t v198 = 0x100000000;
          LODWORD(v199) = v136;
          HIDWORD(v199) = v136;
          LODWORD(v200) = DWORD2(v203);
          if (v148)
          {
            uint64_t v154 = (uint64_t)*(&v208 + v131);
            if (v186) {
              unint64_t v155 = v188;
            }
            else {
              unint64_t v155 = v183;
            }
            do
            {
              [v153 setBuffer:v154 offset:0 atIndex:0];
              v156 = [v155 objectAtIndexedSubscript:v189];
              [v153 setBuffer:v156 offset:0 atIndex:1];

              [v153 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v152) atIndex:0];
              [v153 setBytes:&v198 length:20 atIndex:2];
              v196[0] = v151;
              v196[1] = v139;
              v196[2] = 1;
              unint64_t v194 = v152;
              int64x2_t v195 = vdupq_n_s64(1uLL);
              [v153 dispatchThreadgroups:v196 threadsPerThreadgroup:&v194];
              LODWORD(v198) = v198 + 1;
              --v148;
            }
            while (v148);
          }
          [v153 endEncoding];
          int v114 = self;
          v157 = v182;
          char v133 = v186;
          goto LABEL_132;
        case 8:
          char v145 = v133;
          LODWORD(v146) = v204;
          uint64_t v144 = SDWORD2(v203) * (uint64_t)SDWORD1(v203) * SHIDWORD(v203);
          goto LABEL_119;
        case 12:
          char v145 = v133;
          uint64_t v144 = SDWORD2(v203) * (uint64_t)SDWORD1(v203);
          LODWORD(v146) = v204 * HIDWORD(v203);
          goto LABEL_119;
        case 14:
          char v145 = v133;
          uint64_t v144 = SDWORD1(v203);
          LODWORD(v146) = HIDWORD(v203) * DWORD2(v203) * v204;
          goto LABEL_119;
        case 15:
          char v145 = v133;
          LODWORD(v146) = DWORD2(v203) * DWORD1(v203) * HIDWORD(v203) * v204;
          uint64_t v144 = 1;
LABEL_119:
          unint64_t v141 = v189;
          v158 = [(MLCDeviceGPU *)v114 gpuPipelineStatesArithmeticReduceGradientAll];
          v159 = [v158 objectAtIndexedSubscript:v189];

          v142 = v159;
          unint64_t v160 = [v159 maxTotalThreadsPerThreadgroup];
          if (v160 <= (int)v146)
          {
            uint64_t v143 = v160;
          }
          else
          {
            unint64_t v161 = 1 << -(char)__clz(v146);
            if (((int)v146 & (unint64_t)((int)v146 - 1)) != 0) {
              unint64_t v146 = v161;
            }
            else {
              unint64_t v146 = (int)v146;
            }
            unint64_t v162 = [v159 threadExecutionWidth];
            if (v146 <= v162) {
              uint64_t v143 = v162;
            }
            else {
              uint64_t v143 = v146;
            }
          }
          char v133 = v145;
          break;
        default:
          v140 = [(MLCDeviceGPU *)v114 gpuPipelineStatesArithmeticReduceGradientAny];
          unint64_t v141 = v189;
          v142 = [v140 objectAtIndexedSubscript:v189];

          uint64_t v143 = [v142 maxTotalThreadsPerThreadgroup];
          uint64_t v144 = 1;
          break;
      }
      v153 = [v187 computeCommandEncoderWithDispatchType:0];
      [v153 setComputePipelineState:v142];
      [v153 setBuffer:*(&v208 + v131) offset:0 atIndex:0];
      if (v133) {
        v163 = v188;
      }
      else {
        v163 = v183;
      }
      [v163 objectAtIndexedSubscript:v141];
      uint64_t v164 = v157 = v142;
      [v153 setBuffer:v164 offset:0 atIndex:1];

      [v153 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v143) atIndex:0];
      [v153 setBytes:&v201 length:96 atIndex:2];
      uint64_t v192 = v144;
      int64x2_t v193 = vdupq_n_s64(1uLL);
      uint64_t v190 = v143;
      int64x2_t v191 = v193;
      [v153 dispatchThreadgroups:&v192 threadsPerThreadgroup:&v190];
      [v153 endEncoding];
LABEL_132:
    }
    char v132 = 0;
    uint64_t v131 = 1;
  }
  while ((v133 & 1) != 0);

  for (uint64_t i = 1; i != -1; --i)
  uint64_t v166 = 8;
  id v12 = v172;
  id v11 = v173;
  id v14 = v170;
  id v13 = v171;
  do
  {

    v166 -= 8;
  }
  while (v166 != -8);

LABEL_139:
}

- (void)dispatchForwardGramMatrixKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forTraining:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v49 = [v12 deviceMemory];
  uint64_t v48 = [v13 deviceMemory];
  id v14 = [v11 objectAtIndexedSubscript:a6];
  id v15 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  int v47 = [v15 objectAtIndexedSubscript:a6];

  id v16 = [(MLCDeviceGPU *)self deviceList];
  int v46 = [v16 objectAtIndexedSubscript:a6];

  char v17 = [v12 descriptor];
  int v18 = [v17 shape];
  unint64_t v19 = [v18 count];

  id v44 = v13;
  if (v19 < 3)
  {
    unint64_t v21 = 1;
  }
  else
  {
    unint64_t v20 = 2;
    unint64_t v21 = 1;
    do
    {
      unint64_t v22 = objc_msgSend(v12, "descriptor", v44);
      int v23 = [v22 shape];
      uint64_t v24 = [v23 objectAtIndexedSubscript:v20];
      v21 *= [v24 unsignedIntegerValue];

      ++v20;
      unint64_t v25 = [v12 descriptor];
      unint64_t v26 = [v25 shape];
      unint64_t v27 = [v26 count];
    }
    while (v20 < v27);
  }
  long long v28 = objc_msgSend(v12, "descriptor", v44);
  uint64_t v29 = [v28 shape];
  long long v30 = [v29 objectAtIndexedSubscript:1];
  uint64_t v31 = [v30 unsignedIntegerValue];

  [v14 gramMatrixScale];
  int v53 = v32;
  int v55 = v31;
  int v57 = v21;
  int v58 = v21;
  int v59 = v31 * v21;
  int v60 = v31;
  int v61 = v31 * v31;
  long long v33 = [v14 forwardKernel];
  uint64_t v34 = [v33 maxTotalThreadsPerThreadgroup];

  int v35 = [v14 forwardKernel];
  unint64_t v36 = [v35 threadExecutionWidth];

  if (v21 <= v36) {
    unint64_t v37 = v36;
  }
  else {
    unint64_t v37 = v34;
  }
  if (v21 <= v36) {
    uint64_t v38 = 0;
  }
  else {
    uint64_t v38 = 4 * (v34 + v31);
  }
  BOOL v54 = v21 > v36;
  int v56 = (v21 + v37 - 1) / v37;
  if (v56 <= 1)
  {
    unint64_t v39 = v45;
  }
  else
  {
    unint64_t v39 = v45;
    if (v37 + v31 > (unint64_t)[v46 maxThreadgroupMemoryLength] >> 2)
    {
      uint64_t v38 = 4 * v37;
      BOOL v54 = 0;
    }
  }
  unint64_t v40 = [v47 computeCommandEncoderWithDispatchType:0];
  unint64_t v41 = [v14 forwardKernel];
  [v40 setComputePipelineState:v41];

  unint64_t v42 = [v49 objectAtIndexedSubscript:a6];
  [v40 setBuffer:v42 offset:0 atIndex:0];

  unint64_t v43 = [v48 objectAtIndexedSubscript:a6];
  [v40 setBuffer:v43 offset:0 atIndex:1];

  [v40 setBytes:&v53 length:36 atIndex:2];
  if (v38) {
    [v40 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(v38) atIndex:0];
  }
  v52[0] = v31;
  v52[1] = [v14 batchSize];
  v52[2] = 1;
  unint64_t v50 = v37;
  int64x2_t v51 = vdupq_n_s64(1uLL);
  [v40 dispatchThreadgroups:v52 threadsPerThreadgroup:&v50];
  [v40 endEncoding];
}

- (void)dispatchGradientGramMatrixKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  unint64_t v39 = [a4 deviceMemory];
  id v12 = [v11 deviceMemory];
  unint64_t v40 = v10;
  id v13 = [v10 objectAtIndexedSubscript:a6];
  id v14 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  id v15 = [v14 objectAtIndexedSubscript:a6];

  id v16 = [v11 descriptor];
  char v17 = [v16 shape];
  unint64_t v18 = [v17 count];

  if (v18 < 3)
  {
    int v20 = 1;
  }
  else
  {
    unint64_t v19 = 2;
    int v20 = 1;
    do
    {
      unint64_t v21 = [v11 descriptor];
      unint64_t v22 = [v21 shape];
      int v23 = [v22 objectAtIndexedSubscript:v19];
      v20 *= [v23 unsignedIntegerValue];

      ++v19;
      uint64_t v24 = [v11 descriptor];
      unint64_t v25 = [v24 shape];
      unint64_t v26 = [v25 count];
    }
    while (v19 < v26);
  }
  unint64_t v27 = [v11 descriptor];
  long long v28 = [v27 shape];
  uint64_t v29 = [v28 objectAtIndexedSubscript:1];
  uint64_t v30 = [v29 unsignedIntegerValue];

  v44[3] = 0;
  [v13 gramMatrixScale];
  v44[0] = v31;
  v44[4] = v20;
  v44[5] = v30;
  v44[6] = v30 * v30;
  v44[7] = v20;
  v44[8] = v30 * v20;
  v44[1] = 0;
  v44[2] = v30;
  int v32 = [v13 gradientKernel];
  uint64_t v33 = [v32 maxTotalThreadsPerThreadgroup];

  uint64_t v34 = [v15 computeCommandEncoderWithDispatchType:0];
  int v35 = [v13 gradientKernel];
  [v34 setComputePipelineState:v35];

  unint64_t v36 = [v13 source];
  [v34 setBuffer:v36 offset:0 atIndex:0];

  unint64_t v37 = [v39 objectAtIndexedSubscript:a6];
  [v34 setBuffer:v37 offset:0 atIndex:1];

  uint64_t v38 = [v12 objectAtIndexedSubscript:a6];
  [v34 setBuffer:v38 offset:0 atIndex:2];

  [v34 setBytes:v44 length:36 atIndex:3];
  [v34 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(8 * v30) atIndex:0];
  v43[0] = v30;
  v43[1] = [v13 batchSize];
  v43[2] = 1;
  uint64_t v41 = v33;
  int64x2_t v42 = vdupq_n_s64(1uLL);
  [v34 dispatchThreadgroups:v43 threadsPerThreadgroup:&v41];
  [v34 endEncoding];
}

- (void)dispatchForwardLayerNormalizationKernel:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forTraining:(BOOL)a7
{
  LODWORD(v7) = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [v13 objectAtIndexedSubscript:0];
  uint64_t v72 = [v15 deviceMemory];

  int v75 = [v14 deviceMemory];
  id v16 = [v12 objectAtIndexedSubscript:a6];
  int v74 = [v16 exportableState];
  char v17 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  unint64_t v73 = [v17 objectAtIndexedSubscript:a6];

  unint64_t v18 = [(MLCDeviceGPU *)self deviceList];
  int v70 = [v18 objectAtIndexedSubscript:a6];

  int v80 = 0;
  uint64_t v81 = 0;
  uint64_t v82 = 0;
  BOOL v79 = [v13 count] != 1;
  int v84 = v7;
  [v16 varianceEpsilon];
  int v83 = v19;
  int v20 = [v16 normalizedShape];
  uint64_t v21 = [v20 count];

  unint64_t v22 = [v16 normalizedShape];
  int v23 = v22;
  int v71 = v7;
  unint64_t v67 = v14;
  uint64_t v68 = v12;
  if (v21 == 3)
  {
    uint64_t v24 = [v22 objectAtIndexedSubscript:0];
    int v25 = [v24 unsignedIntegerValue];
    unint64_t v26 = [v16 normalizedShape];
    unint64_t v27 = [v26 objectAtIndexedSubscript:1];
    int v28 = [v27 unsignedIntegerValue] * v25;
    uint64_t v29 = [v16 normalizedShape];
    uint64_t v7 = [v29 objectAtIndexedSubscript:2];
    int v30 = v28 * [(id)v7 unsignedIntegerValue];
    HIDWORD(v79) = v30;

    LOBYTE(v7) = v71;
  }
  else
  {
    uint64_t v31 = [v22 count];

    int v23 = [v16 normalizedShape];
    uint64_t v24 = [v23 objectAtIndexedSubscript:0];
    int v32 = [v24 unsignedIntegerValue];
    int v30 = v32;
    if (v31 == 2)
    {
      uint64_t v33 = [v16 normalizedShape];
      uint64_t v34 = [v33 objectAtIndexedSubscript:1];
      v30 *= [v34 unsignedIntegerValue];
      HIDWORD(v79) = v30;
    }
    else
    {
      HIDWORD(v79) = v32;
    }
  }

  int v69 = v30;
  *((float *)&v82 + 1) = 1.0 / (float)v30;
  unint64_t v35 = 1;
  uint64_t v36 = 1;
  while (1)
  {
    unint64_t v37 = [v13 objectAtIndexedSubscript:0];
    uint64_t v38 = [v37 descriptor];
    unint64_t v39 = [v38 shape];
    unint64_t v40 = [v39 count];

    if (v35 >= v40) {
      break;
    }
    uint64_t v41 = [v13 objectAtIndexedSubscript:0];
    int64x2_t v42 = [v41 descriptor];
    unint64_t v43 = [v42 shape];
    id v44 = [v43 objectAtIndexedSubscript:v35];
    v36 *= [v44 unsignedIntegerValue];

    ++v35;
  }
  uint64_t v45 = [v16 batchSize];
  if (v7)
  {
    unint64_t v46 = 4 * v36 * v45;
    int v47 = [v16 normalizationInputNormalized];

    if (!v47)
    {
      uint64_t v48 = objc_msgSend(v70, "newBufferWithLength:options:", v46, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
      [v16 setNormalizationInputNormalized:v48];
    }
    uint64_t v49 = [v16 normalizationInverseSqrtVariance];

    if (!v49)
    {
      unint64_t v50 = objc_msgSend(v70, "newBufferWithLength:options:", v46 / v69, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
      [v16 setNormalizationInverseSqrtVariance:v50];
    }
  }
  int v80 = v36;
  LODWORD(v81) = v36;
  HIDWORD(v81) = v36;
  int64x2_t v51 = [v16 forwardKernel];
  uint64_t v52 = [v51 threadExecutionWidth];

  uint64_t v53 = [v16 batchSize];
  BOOL v54 = [v73 computeCommandEncoderWithDispatchType:0];
  if (v7) {
    [v16 forwardKernel];
  }
  else {
  int v55 = [v16 forwardStatisticsKernel];
  }
  [v54 setComputePipelineState:v55];

  int v56 = v72;
  int v57 = [v72 objectAtIndexedSubscript:a6];
  [v54 setBuffer:v57 offset:0 atIndex:0];

  int v58 = [v75 objectAtIndexedSubscript:a6];
  [v54 setBuffer:v58 offset:0 atIndex:1];

  [v54 setBytes:&v79 length:36 atIndex:2];
  int v59 = [v74 beta];
  [v54 setBuffer:v59 offset:0 atIndex:3];

  int v60 = [v74 gamma];
  [v54 setBuffer:v60 offset:0 atIndex:4];

  [v54 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * SHIDWORD(v79)) atIndex:0];
  if (v71)
  {
    int v61 = [v16 normalizationInputNormalized];
    [v54 setBuffer:v61 offset:0 atIndex:5];

    [v16 normalizationInverseSqrtVariance];
  }
  else
  {
    unint64_t v62 = [v72 objectAtIndexedSubscript:a6];
    [v54 setBuffer:v62 offset:0 atIndex:5];

    [v72 objectAtIndexedSubscript:a6];
  unint64_t v63 = };
  [v54 setBuffer:v63 offset:0 atIndex:6];

  if (v79)
  {
    unint64_t v64 = [v13 objectAtIndexedSubscript:1];
    unint64_t v65 = [v64 deviceMemory];
    unint64_t v66 = [v65 objectAtIndexedSubscript:a6];
    [v54 setBuffer:v66 offset:0 atIndex:7];

    int v56 = v72;
  }
  else
  {
    unint64_t v64 = [v72 objectAtIndexedSubscript:a6];
    [v54 setBuffer:v64 offset:0 atIndex:7];
  }

  v78[0] = (int)v36 / v69;
  v78[1] = v53;
  v78[2] = 1;
  uint64_t v76 = v52;
  int64x2_t v77 = vdupq_n_s64(1uLL);
  [v54 dispatchThreadgroups:v78 threadsPerThreadgroup:&v76];
  [v54 endEncoding];
}

- (void)dispatchGradientLayerNormalizationKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v11 deviceMemory];
  int v71 = v12;
  int v70 = [v12 deviceMemory];
  uint64_t v72 = v10;
  id v14 = [v10 objectAtIndexedSubscript:a6];
  int v69 = [v14 exportableState];
  id v15 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  id v16 = [v15 objectAtIndexedSubscript:a6];

  uint64_t v78 = 0;
  uint64_t v79 = 0;
  uint64_t v80 = 0;
  float v81 = 0.0;
  int v83 = 1;
  [v14 varianceEpsilon];
  int v82 = v17;
  unint64_t v18 = [v14 normalizedShape];
  uint64_t v19 = [v18 count];

  int v20 = [v14 normalizedShape];
  uint64_t v21 = v20;
  unint64_t v73 = (void *)v13;
  unint64_t v67 = a6;
  if (v19 == 3)
  {
    unint64_t v22 = [v20 objectAtIndexedSubscript:0];
    int v23 = [v22 unsignedIntegerValue];
    uint64_t v24 = [v14 normalizedShape];
    int v25 = [v24 objectAtIndexedSubscript:1];
    int v26 = [v25 unsignedIntegerValue] * v23;
    unint64_t v27 = [v14 normalizedShape];
    int v28 = [v27 objectAtIndexedSubscript:2];
    int v29 = v26 * [v28 unsignedIntegerValue];
    HIDWORD(v78) = v29;
  }
  else
  {
    uint64_t v30 = [v20 count];

    uint64_t v21 = [v14 normalizedShape];
    unint64_t v22 = [v21 objectAtIndexedSubscript:0];
    int v31 = [v22 unsignedIntegerValue];
    int v32 = v31;
    if (v30 == 2)
    {
      uint64_t v33 = [v14 normalizedShape];
      uint64_t v34 = [v33 objectAtIndexedSubscript:1];
      int v29 = [v34 unsignedIntegerValue] * v32;
      HIDWORD(v78) = v29;
    }
    else
    {
      HIDWORD(v78) = v31;
      int v29 = v31;
    }
  }

  float v81 = 1.0 / (float)v29;
  unint64_t v35 = [v11 descriptor];
  uint64_t v36 = [v35 shape];
  unint64_t v37 = [v36 count];

  int v38 = 1;
  if (v37 >= 2)
  {
    unint64_t v39 = 1;
    do
    {
      unint64_t v40 = objc_msgSend(v11, "descriptor", v67);
      uint64_t v41 = [v40 shape];
      int64x2_t v42 = [v41 objectAtIndexedSubscript:v39];
      v38 *= [v42 unsignedIntegerValue];

      ++v39;
      unint64_t v43 = [v11 descriptor];
      id v44 = [v43 shape];
      unint64_t v45 = [v44 count];
    }
    while (v39 < v45);
  }
  LODWORD(v79) = v38;
  HIDWORD(v79) = v38;
  LODWORD(v80) = v38;
  HIDWORD(v80) = objc_msgSend(v14, "batchSize", v67);
  unint64_t v46 = [v14 gradientStatisticsKernel];
  unint64_t v47 = [v46 maxTotalThreadsPerThreadgroup];

  if (v47 <= v29)
  {
    unint64_t v48 = (v29 + v47 - 1) / v47;
  }
  else
  {
    unint64_t v47 = v29;
    unint64_t v48 = 1;
  }
  uint64_t v49 = [v16 computeCommandEncoderWithDispatchType:0];
  unint64_t v50 = [v14 gradientStatisticsKernel];
  [v49 setComputePipelineState:v50];

  int64x2_t v51 = [v73 objectAtIndexedSubscript:v68];
  [v49 setBuffer:v51 offset:0 atIndex:0];

  [v49 setBytes:&v78 length:36 atIndex:2];
  uint64_t v52 = [v14 normalizationBetaGradient];
  [v49 setBuffer:v52 offset:0 atIndex:3];

  uint64_t v53 = [v14 normalizationGammaGradient];
  [v49 setBuffer:v53 offset:0 atIndex:4];

  BOOL v54 = [v14 normalizationInputNormalized];
  [v49 setBuffer:v54 offset:0 atIndex:5];

  [v49 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(8 * v47) atIndex:0];
  unint64_t v76 = v48;
  unint64_t v55 = 1;
  int64x2_t v77 = vdupq_n_s64(1uLL);
  unint64_t v74 = v47;
  int64x2_t v75 = v77;
  [v49 dispatchThreadgroups:&v76 threadsPerThreadgroup:&v74];
  int v56 = (int)v80 / SHIDWORD(v78);
  unint64_t v57 = (int)v80 / SHIDWORD(v78);
  int v58 = [v14 forwardKernel];
  unint64_t v59 = [v58 maxTotalThreadsPerThreadgroup];

  if (v59 <= v56)
  {
    unint64_t v57 = v59;
    unint64_t v55 = (v56 + v59 - 1) / v59;
  }
  uint64_t v60 = [v14 batchSize];
  int v61 = [v14 gradientKernel];
  [v49 setComputePipelineState:v61];

  unint64_t v62 = [v73 objectAtIndexedSubscript:v68];
  [v49 setBuffer:v62 offset:0 atIndex:0];

  unint64_t v63 = [v70 objectAtIndexedSubscript:v68];
  [v49 setBuffer:v63 offset:0 atIndex:1];

  [v49 setBytes:&v78 length:36 atIndex:2];
  unint64_t v64 = [v69 gamma];
  [v49 setBuffer:v64 offset:0 atIndex:4];

  unint64_t v65 = [v14 normalizationInputNormalized];
  [v49 setBuffer:v65 offset:0 atIndex:5];

  unint64_t v66 = [v14 normalizationInverseSqrtVariance];
  [v49 setBuffer:v66 offset:0 atIndex:6];

  unint64_t v76 = v55;
  v77.i64[0] = v60;
  v77.i64[1] = 1;
  unint64_t v74 = v57;
  int64x2_t v75 = vdupq_n_s64(1uLL);
  [v49 dispatchThreadgroups:&v76 threadsPerThreadgroup:&v74];
  [v49 endEncoding];
}

- (void)dispatchForwardInstanceNormalizationKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forTraining:(BOOL)a7
{
  BOOL v97 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v91 = [v12 deviceMemory];
  uint64_t v92 = v13;
  uint64_t v90 = [v13 deviceMemory];
  uint64_t v93 = v11;
  id v14 = [v11 objectAtIndexedSubscript:a6];
  uint64_t v15 = [v14 exportableState];
  id v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v95 = [v16 objectAtIndexedSubscript:a6];

  int v17 = [(MLCDeviceGPU *)self deviceList];
  char v94 = [v17 objectAtIndexedSubscript:a6];

  uint64_t v109 = 0;
  long long v108 = 0u;
  long long v107 = 0u;
  unint64_t v18 = (void *)v15;
  if (v15) {
    int v19 = 12;
  }
  else {
    int v19 = 0;
  }
  int v106 = v19;
  [v14 varianceEpsilon];
  LODWORD(v108) = v20;
  [v14 momentum];
  DWORD1(v108) = v21;
  unint64_t v22 = [v12 descriptor];
  int v23 = [v22 shape];
  unint64_t v24 = 1;
  int v25 = [v23 objectAtIndexedSubscript:1];
  uint64_t v96 = [v25 unsignedIntegerValue];

  uint64_t v89 = [v14 batchSize];
  int v26 = [v12 descriptor];
  unint64_t v27 = [v26 shape];
  unint64_t v28 = [v27 count];

  if (v28 >= 3)
  {
    unint64_t v29 = 2;
    unint64_t v24 = 1;
    do
    {
      uint64_t v30 = [v12 descriptor];
      int v31 = [v30 shape];
      int v32 = [v31 objectAtIndexedSubscript:v29];
      v24 *= [v32 unsignedIntegerValue];

      ++v29;
      uint64_t v33 = [v12 descriptor];
      uint64_t v34 = [v33 shape];
      unint64_t v35 = [v34 count];
    }
    while (v29 < v35);
  }
  LODWORD(v107) = v24;
  DWORD1(v107) = v24 * v96;
  *((float *)&v107 + 2) = 1.0 / (float)v24;
  HIDWORD(v107) = v96;
  uint64_t v36 = [v14 neuronDescriptor];

  if (v36)
  {
    v19 |= 0x10u;
    int v106 = v19;
    unint64_t v37 = [v14 neuronDescriptor];
    [v37 a];
    DWORD2(v108) = v38;

    unint64_t v39 = [v14 neuronDescriptor];
    [v39 b];
    HIDWORD(v108) = v40;

    uint64_t v41 = [v14 neuronDescriptor];
    LODWORD(v109) = [v41 activationType];
  }
  int64x2_t v42 = [v14 movingState];

  if (v42) {
    int v106 = v19 | 3;
  }
  uint64_t v43 = [v14 batchSize];
  if (v97)
  {
    uint64_t v44 = v43;
    uint64_t v45 = 4 * v96;
    uint64_t v46 = [v14 batchSize];
    unint64_t v47 = [v14 normalizationInputNormalized];

    if (!v47)
    {
      unint64_t v48 = objc_msgSend(v94, "newBufferWithLength:options:", v45 * v24 * v44, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
      [v14 setNormalizationInputNormalized:v48];
    }
    uint64_t v49 = [v14 normalizationInverseSqrtVariance];

    if (!v49)
    {
      unint64_t v50 = objc_msgSend(v94, "newBufferWithLength:options:", v45 * v46, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
      [v14 setNormalizationInverseSqrtVariance:v50];
    }
    int64x2_t v51 = [v14 movingState];

    if (v51)
    {
      uint64_t v52 = [v14 normalizationComputedMean];

      if (!v52)
      {
        uint64_t v53 = objc_msgSend(v94, "newBufferWithLength:options:", v45 * objc_msgSend(v14, "batchSize"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
        [v14 setNormalizationComputedMean:v53];
      }
      BOOL v54 = [v14 normalizationComputedVariance];

      if (!v54)
      {
        unint64_t v55 = objc_msgSend(v94, "newBufferWithLength:options:", v45 * objc_msgSend(v14, "batchSize"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
        [v14 setNormalizationComputedVariance:v55];
      }
    }
  }
  int v56 = [v14 forwardKernel];
  unint64_t v57 = [v56 maxTotalThreadsPerThreadgroup];

  if (v57 > v24)
  {
    unint64_t v58 = 1 << -(char)__clz(v24);
    unint64_t v59 = (v24 & (v24 - 1)) != 0 ? v58 : v24;
    uint64_t v60 = [v14 gradientKernel];
    unint64_t v57 = [v60 threadExecutionWidth];

    if (v59 > v57) {
      unint64_t v57 = v59;
    }
  }
  int v61 = [v95 computeCommandEncoderWithDispatchType:0];
  if (v97) {
    [v14 forwardKernel];
  }
  else {
  unint64_t v62 = [v14 forwardStatisticsKernel];
  }
  [v61 setComputePipelineState:v62];

  unint64_t v63 = [v91 objectAtIndexedSubscript:a6];
  [v61 setBuffer:v63 offset:0 atIndex:0];

  unint64_t v64 = [v90 objectAtIndexedSubscript:a6];
  [v61 setBuffer:v64 offset:0 atIndex:1];

  [v61 setBytes:&v106 length:44 atIndex:2];
  if (v18)
  {
    unint64_t v65 = [v18 beta];
    [v61 setBuffer:v65 offset:0 atIndex:3];

    unint64_t v66 = [v18 gamma];
    [v61 setBuffer:v66 offset:0 atIndex:4];
  }
  unint64_t v67 = v96;
  if (v97)
  {
    uint64_t v68 = [v14 normalizationInputNormalized];
    [v61 setBuffer:v68 offset:0 atIndex:5];

    int v69 = [v14 normalizationInverseSqrtVariance];
    [v61 setBuffer:v69 offset:0 atIndex:6];

    int v70 = [v14 movingState];

    if (v70)
    {
      int v71 = [v14 normalizationComputedMean];
      [v61 setBuffer:v71 offset:0 atIndex:7];

      uint64_t v72 = [v14 normalizationComputedVariance];
      [v61 setBuffer:v72 offset:0 atIndex:8];
LABEL_37:
    }
  }
  else
  {
    unint64_t v73 = [v14 movingState];

    if (v73)
    {
      uint64_t v72 = [v14 movingState];
      unint64_t v74 = [v72 mean];
      [v61 setBuffer:v74 offset:0 atIndex:7];

      int64x2_t v75 = [v72 variance];
      [v61 setBuffer:v75 offset:0 atIndex:8];

      unint64_t v67 = v96;
      goto LABEL_37;
    }
  }
  [v61 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v57) atIndex:0];
  v105[0] = v67;
  v105[1] = v89;
  v105[2] = 1;
  unint64_t v103 = v57;
  int64x2_t v104 = vdupq_n_s64(1uLL);
  [v61 dispatchThreadgroups:v105 threadsPerThreadgroup:&v103];
  if (v97)
  {
    unint64_t v76 = [v14 movingState];

    if (v76)
    {
      v102[1] = v67;
      v102[0] = [v14 batchSize];
      [v14 momentum];
      v102[2] = v77;
      float v78 = 0.0;
      if (v24 != 1) {
        float v78 = (float)v24 / (float)(v24 - 1);
      }
      *(float *)&v102[3] = v78;
      uint64_t v79 = [v14 instanceNormMovingMeanVarianceKernel];
      unint64_t v80 = [v79 maxTotalThreadsPerThreadgroup];

      if (v80 <= v67)
      {
        unint64_t v81 = v80;
        unint64_t v82 = (v67 + v80 - 1) / v80;
      }
      else
      {
        unint64_t v81 = v67;
        unint64_t v82 = 1;
      }
      int v83 = [v14 instanceNormMovingMeanVarianceKernel];
      [v61 setComputePipelineState:v83];

      int v84 = [v14 normalizationComputedMean];
      [v61 setBuffer:v84 offset:0 atIndex:0];

      int v85 = [v14 normalizationComputedVariance];
      [v61 setBuffer:v85 offset:0 atIndex:1];

      [v61 setBytes:v102 length:16 atIndex:2];
      long long v86 = [v14 movingState];
      long long v87 = [v86 mean];
      [v61 setBuffer:v87 offset:0 atIndex:3];

      uint64_t v88 = [v86 variance];
      [v61 setBuffer:v88 offset:0 atIndex:4];

      unint64_t v100 = v82;
      int64x2_t v101 = vdupq_n_s64(1uLL);
      unint64_t v98 = v81;
      int64x2_t v99 = v101;
      [v61 dispatchThreadgroups:&v100 threadsPerThreadgroup:&v98];
    }
  }
  [v61 endEncoding];
}

- (void)dispatchGradientInstanceNormalizationKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v83 = [v11 deviceMemory];
  int v84 = v12;
  uint64_t v89 = [v12 deviceMemory];
  int v85 = v10;
  id v13 = [v10 objectAtIndexedSubscript:a6];
  uint64_t v91 = [v13 exportableState];
  id v14 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v88 = [v14 objectAtIndexedSubscript:a6];

  unint64_t v81 = self;
  uint64_t v15 = [(MLCDeviceGPU *)self deviceList];
  unint64_t v82 = a6;
  long long v87 = [v15 objectAtIndexedSubscript:a6];

  uint64_t v106 = 0;
  long long v105 = 0u;
  long long v104 = 0u;
  int v103 = 12;
  [v13 varianceEpsilon];
  LODWORD(v105) = v16;
  int v17 = [v11 descriptor];
  unint64_t v18 = [v17 shape];
  unint64_t v19 = 1;
  int v20 = [v18 objectAtIndexedSubscript:1];
  unint64_t v21 = [v20 unsignedIntegerValue];

  uint64_t v86 = [v13 batchSize];
  unint64_t v22 = [v11 descriptor];
  int v23 = [v22 shape];
  unint64_t v24 = [v23 count];

  if (v24 >= 3)
  {
    unint64_t v25 = 2;
    unint64_t v19 = 1;
    do
    {
      int v26 = [v11 descriptor];
      unint64_t v27 = [v26 shape];
      unint64_t v28 = [v27 objectAtIndexedSubscript:v25];
      v19 *= [v28 unsignedIntegerValue];

      ++v25;
      unint64_t v29 = [v11 descriptor];
      uint64_t v30 = [v29 shape];
      unint64_t v31 = [v30 count];
    }
    while (v25 < v31);
  }
  uint64_t v90 = [v13 result];
  unint64_t v32 = v19 * v21;
  uint64_t v80 = [v13 batchSize];
  uint64_t v33 = [v13 normalizationGammaGradient];
  if (!v33)
  {
    uint64_t v37 = 4 * v21;
    goto LABEL_8;
  }
  uint64_t v34 = (void *)v33;
  unint64_t v35 = [v13 normalizationGammaGradient];
  unint64_t v36 = [v35 length];
  uint64_t v37 = 4 * v21;
  unint64_t v38 = 4 * v21 * [v13 batchSize];

  if (v36 < v38)
  {
LABEL_8:
    unint64_t v39 = objc_msgSend(v87, "newBufferWithLength:options:", objc_msgSend(v13, "batchSize") * v37, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
    int v40 = objc_msgSend(v87, "newBufferWithLength:options:", objc_msgSend(v13, "batchSize") * v37, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
    [v13 setNormalizationGammaGradient:v39];
    [v13 setNormalizationBetaGradient:v40];
  }
  uint64_t v41 = [v88 computeCommandEncoderWithDispatchType:0];
  int64x2_t v42 = [v13 gradientKernel];
  unint64_t v43 = [v42 maxTotalThreadsPerThreadgroup];

  if (v43 > v19)
  {
    unint64_t v44 = 1 << -(char)__clz(v19);
    if ((v19 & (v19 - 1)) != 0) {
      unint64_t v45 = v44;
    }
    else {
      unint64_t v45 = v19;
    }
    uint64_t v46 = [v13 gradientKernel];
    unint64_t v47 = [v46 threadExecutionWidth];

    if (v45 <= v47) {
      unint64_t v43 = v47;
    }
    else {
      unint64_t v43 = v45;
    }
  }
  *(void *)&long long v104 = __PAIR64__(v32, v19);
  *((float *)&v104 + 2) = 1.0 / (float)v19;
  HIDWORD(v104) = v21;
  unint64_t v48 = [v13 neuronDescriptor];

  if (v48)
  {
    int v103 = 28;
    uint64_t v49 = [v13 neuronDescriptor];
    [v49 a];
    DWORD2(v105) = v50;

    int64x2_t v51 = [v13 neuronDescriptor];
    [v51 b];
    HIDWORD(v105) = v52;

    uint64_t v53 = [v13 neuronDescriptor];
    LODWORD(v106) = [v53 activationType];

    if ([v13 recomputeResultTensor])
    {
      uint64_t v54 = 4 * v32 * v80;
      unint64_t v55 = [(MLCDeviceGPU *)v81 gpuHeapTemporaryResourceAllocator];
      int v56 = objc_msgSend(v55, "objectAtIndexedSubscript:", objc_msgSend(v13, "temporaryHeapIndex"));
      uint64_t v57 = [v56 allocateBuffer:v54];

      unint64_t v58 = [v13 normalizationRecomputeResultKernel];
      [v41 setComputePipelineState:v58];

      unint64_t v59 = [v13 normalizationInputNormalized];
      [v41 setBuffer:v59 offset:0 atIndex:0];

      [v41 setBuffer:v57 offset:0 atIndex:1];
      [v41 setBytes:&v103 length:44 atIndex:2];
      uint64_t v60 = [v91 beta];
      [v41 setBuffer:v60 offset:0 atIndex:3];

      int v61 = [v91 gamma];
      [v41 setBuffer:v61 offset:0 atIndex:4];

      [v41 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v43) atIndex:0];
      v102[0] = v21;
      v102[1] = v86;
      v102[2] = 1;
      unint64_t v100 = v43;
      int64x2_t v101 = vdupq_n_s64(1uLL);
      [v41 dispatchThreadgroups:v102 threadsPerThreadgroup:&v100];
      uint64_t v90 = (void *)v57;
    }
  }
  unint64_t v62 = [v13 gradientKernel];
  [v41 setComputePipelineState:v62];

  unint64_t v63 = [v83 objectAtIndexedSubscript:v82];
  [v41 setBuffer:v63 offset:0 atIndex:0];

  unint64_t v64 = [v89 objectAtIndexedSubscript:v82];
  [v41 setBuffer:v64 offset:0 atIndex:1];

  [v41 setBytes:&v103 length:44 atIndex:2];
  unint64_t v65 = [v91 beta];
  [v41 setBuffer:v65 offset:0 atIndex:3];

  unint64_t v66 = [v91 gamma];
  [v41 setBuffer:v66 offset:0 atIndex:4];

  unint64_t v67 = [v13 normalizationInputNormalized];
  [v41 setBuffer:v67 offset:0 atIndex:5];

  uint64_t v68 = [v13 normalizationInverseSqrtVariance];
  [v41 setBuffer:v68 offset:0 atIndex:6];

  int v69 = [v13 normalizationBetaGradient];
  [v41 setBuffer:v69 offset:0 atIndex:7];

  int v70 = [v13 normalizationGammaGradient];
  [v41 setBuffer:v70 offset:0 atIndex:8];

  int v71 = [v13 neuronDescriptor];

  if (v71)
  {
    [v41 setBuffer:v90 offset:0 atIndex:9];
  }
  else
  {
    uint64_t v72 = [v83 objectAtIndexedSubscript:v82];
    [v41 setBuffer:v72 offset:0 atIndex:9];
  }
  [v41 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v43) atIndex:0];
  v99[0] = v21;
  v99[1] = v86;
  uint64_t v73 = 1;
  v99[2] = 1;
  unint64_t v97 = v43;
  int64x2_t v98 = vdupq_n_s64(1uLL);
  [v41 dispatchThreadgroups:v99 threadsPerThreadgroup:&v97];
  v96[0] = v21;
  v96[1] = [v13 batchSize];
  unint64_t v74 = [v13 normalizationSumBetaGammaDeltaKernel];
  unint64_t v75 = [v74 maxTotalThreadsPerThreadgroup];

  if (v75 < v21)
  {
    unint64_t v76 = v21 + v75 - 1;
    unint64_t v21 = v75;
    uint64_t v73 = v76 / v75;
  }
  int v77 = [v13 normalizationSumBetaGammaDeltaKernel];
  [v41 setComputePipelineState:v77];

  float v78 = [v13 normalizationBetaGradient];
  [v41 setBuffer:v78 offset:0 atIndex:0];

  uint64_t v79 = [v13 normalizationGammaGradient];
  [v41 setBuffer:v79 offset:0 atIndex:1];

  [v41 setBytes:v96 length:8 atIndex:2];
  uint64_t v94 = v73;
  int64x2_t v95 = vdupq_n_s64(1uLL);
  unint64_t v92 = v21;
  int64x2_t v93 = v95;
  [v41 dispatchThreadgroups:&v94 threadsPerThreadgroup:&v92];
  [v41 endEncoding];
}

- (void)dispatchForwardBatchNormalizationKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forTraining:(BOOL)a7
{
  BOOL v92 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  long long v87 = [v12 deviceMemory];
  uint64_t v88 = v13;
  uint64_t v86 = [v13 deviceMemory];
  uint64_t v89 = v11;
  id v14 = [v11 objectAtIndexedSubscript:a6];
  int v85 = [v14 movingState];
  uint64_t v15 = [v14 exportableState];
  int v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  uint64_t v91 = [v16 objectAtIndexedSubscript:a6];

  int v17 = [(MLCDeviceGPU *)self deviceList];
  uint64_t v90 = [v17 objectAtIndexedSubscript:a6];

  long long v106 = 0u;
  long long v107 = 0u;
  long long v105 = 0u;
  int v84 = (void *)v15;
  if (v15) {
    int v18 = 12;
  }
  else {
    int v18 = 0;
  }
  int v104 = v18;
  [v14 varianceEpsilon];
  DWORD1(v106) = v19;
  [v14 momentum];
  DWORD2(v106) = v20;
  unint64_t v21 = [v12 descriptor];
  unint64_t v22 = [v21 shape];
  unint64_t v23 = 1;
  unint64_t v24 = [v22 objectAtIndexedSubscript:1];
  uint64_t v25 = [v24 unsignedIntegerValue];

  uint64_t v83 = [v14 batchSize];
  int v26 = [v12 descriptor];
  unint64_t v27 = [v26 shape];
  unint64_t v28 = [v27 count];

  if (v28 >= 3)
  {
    unint64_t v23 = 1;
    unint64_t v29 = 2;
    do
    {
      uint64_t v30 = [v12 descriptor];
      unint64_t v31 = [v30 shape];
      unint64_t v32 = [v31 objectAtIndexedSubscript:v29];
      v23 *= [v32 unsignedIntegerValue];

      ++v29;
      uint64_t v33 = [v12 descriptor];
      uint64_t v34 = [v33 shape];
      unint64_t v35 = [v34 count];
    }
    while (v29 < v35);
  }
  uint64_t v36 = [v14 batchSize] * v23;
  LODWORD(v105) = v23;
  DWORD1(v105) = v23 * v25;
  *((float *)&v105 + 2) = 1.0 / (float)(unint64_t)v36;
  HIDWORD(v105) = v25;
  LODWORD(v106) = [v14 batchSize];
  float v37 = 0.0;
  if (v36 != 1) {
    float v37 = (float)(unint64_t)v36 / (float)(unint64_t)(v36 - 1);
  }
  *((float *)&v106 + 3) = v37;
  unint64_t v38 = [v14 neuronDescriptor];

  if (v38)
  {
    v18 |= 0x10u;
    int v104 = v18;
    unint64_t v39 = [v14 neuronDescriptor];
    [v39 a];
    LODWORD(v107) = v40;

    uint64_t v41 = [v14 neuronDescriptor];
    [v41 b];
    DWORD1(v107) = v42;

    unint64_t v43 = [v14 neuronDescriptor];
    DWORD2(v107) = [v43 activationType];
  }
  uint64_t v44 = [v14 batchSize];
  if (v92)
  {
    uint64_t v45 = v44;
    uint64_t v46 = [v14 normalizationInputNormalized];

    if (!v46)
    {
      unint64_t v47 = objc_msgSend(v90, "newBufferWithLength:options:", 4 * v25 * v23 * v45, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
      [v14 setNormalizationInputNormalized:v47];
    }
    unint64_t v48 = [v14 normalizationComputedMean];

    if (!v48)
    {
      uint64_t v49 = objc_msgSend(v90, "newBufferWithLength:options:", 4 * v25, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
      [v14 setNormalizationComputedMean:v49];
    }
    int v50 = [v14 normalizationComputedVariance];

    if (!v50)
    {
      int64x2_t v51 = objc_msgSend(v90, "newBufferWithLength:options:", 4 * v25, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
      [v14 setNormalizationComputedVariance:v51];
    }
  }
  int v52 = [v91 computeCommandEncoderWithDispatchType:0];
  uint64_t v53 = [v14 forwardKernel];
  unint64_t v54 = [v53 maxTotalThreadsPerThreadgroup];

  if (v54 > v23)
  {
    unint64_t v55 = 1 << -(char)__clz(v23);
    if ((v23 & (v23 - 1)) != 0) {
      unint64_t v23 = v55;
    }
    int v56 = [v14 gradientKernel];
    unint64_t v57 = [v56 threadExecutionWidth];

    if (v23 <= v57) {
      unint64_t v54 = v57;
    }
    else {
      unint64_t v54 = v23;
    }
  }
  if (v92)
  {
    int v104 = v18 | 3;
    unint64_t v58 = [v14 batchNormMeanKernel];
    [v52 setComputePipelineState:v58];

    unint64_t v59 = v87;
    uint64_t v60 = [v87 objectAtIndexedSubscript:a6];
    [v52 setBuffer:v60 offset:0 atIndex:0];

    int v61 = [v14 normalizationComputedMean];
    [v52 setBuffer:v61 offset:0 atIndex:1];

    unint64_t v62 = v85;
    unint64_t v63 = [v85 mean];
    [v52 setBuffer:v63 offset:0 atIndex:2];

    [v52 setBytes:&v104 length:52 atIndex:3];
    [v52 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v54) atIndex:0];
    uint64_t v102 = v25;
    int64x2_t v82 = vdupq_n_s64(1uLL);
    int64x2_t v103 = v82;
    unint64_t v100 = v54;
    int64x2_t v101 = v82;
    [v52 dispatchThreadgroups:&v102 threadsPerThreadgroup:&v100];
    unint64_t v64 = [v14 batchNormVarianceKernel];
    [v52 setComputePipelineState:v64];

    unint64_t v65 = [v87 objectAtIndexedSubscript:a6];
    [v52 setBuffer:v65 offset:0 atIndex:0];

    unint64_t v66 = [v14 normalizationComputedMean];
    [v52 setBuffer:v66 offset:0 atIndex:1];

    unint64_t v67 = [v14 normalizationComputedVariance];
    [v52 setBuffer:v67 offset:0 atIndex:2];

    uint64_t v68 = [v85 variance];
    [v52 setBuffer:v68 offset:0 atIndex:3];

    [v52 setBytes:&v104 length:52 atIndex:4];
    [v52 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v54) atIndex:0];
    uint64_t v98 = v25;
    int64x2_t v99 = v82;
    unint64_t v96 = v54;
    int64x2_t v97 = v82;
    [v52 dispatchThreadgroups:&v98 threadsPerThreadgroup:&v96];
    int v69 = [v14 forwardKernel];
    [v52 setComputePipelineState:v69];
  }
  else
  {
    int v70 = [v14 forwardStatisticsKernel];
    [v52 setComputePipelineState:v70];

    unint64_t v59 = v87;
    unint64_t v62 = v85;
  }
  int v71 = [v59 objectAtIndexedSubscript:a6];
  [v52 setBuffer:v71 offset:0 atIndex:0];

  uint64_t v72 = [v86 objectAtIndexedSubscript:a6];
  [v52 setBuffer:v72 offset:0 atIndex:1];

  [v52 setBytes:&v104 length:52 atIndex:2];
  if (v84)
  {
    uint64_t v73 = [v84 beta];
    [v52 setBuffer:v73 offset:0 atIndex:3];

    unint64_t v74 = [v84 gamma];
    [v52 setBuffer:v74 offset:0 atIndex:4];
  }
  if (v92)
  {
    unint64_t v75 = [v14 normalizationComputedMean];
    [v52 setBuffer:v75 offset:0 atIndex:5];

    unint64_t v76 = [v14 normalizationComputedVariance];
    [v52 setBuffer:v76 offset:0 atIndex:6];

    int v77 = [v14 normalizationInputNormalized];
    float v78 = v52;
    uint64_t v79 = v77;
    uint64_t v80 = 7;
  }
  else
  {
    unint64_t v81 = [v62 mean];
    [v52 setBuffer:v81 offset:0 atIndex:5];

    int v77 = [v62 variance];
    float v78 = v52;
    uint64_t v79 = v77;
    uint64_t v80 = 6;
  }
  [v78 setBuffer:v79 offset:0 atIndex:v80];

  v95[0] = v25;
  v95[1] = v83;
  v95[2] = 1;
  unint64_t v93 = v54;
  int64x2_t v94 = vdupq_n_s64(1uLL);
  [v52 dispatchThreadgroups:v95 threadsPerThreadgroup:&v93];
  [v52 endEncoding];
}

- (void)dispatchGradientBatchNormalizationKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v11 deviceMemory];
  uint64_t v98 = v12;
  long long v106 = [v12 deviceMemory];
  int64x2_t v99 = v10;
  id v14 = [v10 objectAtIndexedSubscript:a6];
  uint64_t v15 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  int v16 = [v15 objectAtIndexedSubscript:a6];

  unint64_t v96 = self;
  int v17 = [(MLCDeviceGPU *)self deviceList];
  unint64_t v103 = a6;
  int64x2_t v101 = [v17 objectAtIndexedSubscript:a6];

  long long v124 = 0u;
  long long v123 = 0u;
  long long v122 = 0u;
  int v121 = 12;
  [v14 varianceEpsilon];
  DWORD1(v123) = v18;
  [v14 momentum];
  DWORD2(v123) = v19;
  int v20 = [v11 descriptor];
  unint64_t v21 = [v20 shape];
  unint64_t v22 = 1;
  unint64_t v23 = [v21 objectAtIndexedSubscript:1];
  unint64_t v24 = [v23 unsignedIntegerValue];

  uint64_t v105 = [v14 batchSize];
  uint64_t v25 = [v11 descriptor];
  int v26 = [v25 shape];
  unint64_t v27 = [v26 count];

  if (v27 >= 3)
  {
    unint64_t v28 = 2;
    unint64_t v22 = 1;
    do
    {
      unint64_t v29 = [v11 descriptor];
      uint64_t v30 = [v29 shape];
      unint64_t v31 = [v30 objectAtIndexedSubscript:v28];
      v22 *= [v31 unsignedIntegerValue];

      ++v28;
      unint64_t v32 = [v11 descriptor];
      uint64_t v33 = [v32 shape];
      unint64_t v34 = [v33 count];
    }
    while (v28 < v34);
  }
  unint64_t v100 = (void *)v13;
  uint64_t v35 = [v14 batchSize] * v22;
  int64x2_t v97 = v16;
  uint64_t v36 = [v16 computeCommandEncoderWithDispatchType:0];
  uint64_t v102 = [v14 exportableState];
  LODWORD(v122) = v22;
  DWORD1(v122) = v22 * v24;
  unint64_t v95 = v22 * v24;
  *((float *)&v122 + 2) = 1.0 / (float)(unint64_t)v35;
  HIDWORD(v122) = v24;
  LODWORD(v123) = [v14 batchSize];
  int v104 = [v14 result];
  uint64_t v94 = [v14 batchSize];
  uint64_t v37 = [v14 normalizationGammaGradient];
  if (!v37)
  {
    uint64_t v41 = 4 * v24;
    goto LABEL_8;
  }
  unint64_t v38 = (void *)v37;
  unint64_t v39 = [v14 normalizationGammaGradient];
  unint64_t v40 = [v39 length];
  uint64_t v41 = 4 * v24;
  unint64_t v42 = 4 * v24 * [v14 batchSize];

  if (v40 < v42)
  {
LABEL_8:
    unint64_t v43 = objc_msgSend(v101, "newBufferWithLength:options:", objc_msgSend(v14, "batchSize") * v41, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
    uint64_t v44 = objc_msgSend(v101, "newBufferWithLength:options:", objc_msgSend(v14, "batchSize") * v41, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
    [v14 setNormalizationGammaGradient:v43];
    [v14 setNormalizationBetaGradient:v44];
  }
  uint64_t v45 = [v14 gradientKernel];
  unint64_t v46 = [v45 maxTotalThreadsPerThreadgroup];

  if (v46 > v22)
  {
    unint64_t v47 = 1 << -(char)__clz(v22);
    if ((v22 & (v22 - 1)) != 0) {
      unint64_t v22 = v47;
    }
    unint64_t v48 = [v14 gradientKernel];
    unint64_t v49 = [v48 threadExecutionWidth];

    if (v22 <= v49) {
      unint64_t v46 = v49;
    }
    else {
      unint64_t v46 = v22;
    }
  }
  int v50 = [v14 neuronDescriptor];

  int64x2_t v51 = v100;
  if (v50)
  {
    int v121 = 28;
    int v52 = [v14 neuronDescriptor];
    [v52 a];
    LODWORD(v124) = v53;

    unint64_t v54 = [v14 neuronDescriptor];
    [v54 b];
    DWORD1(v124) = v55;

    int v56 = [v14 neuronDescriptor];
    DWORD2(v124) = [v56 activationType];

    if ([v14 recomputeResultTensor])
    {
      unint64_t v57 = [(MLCDeviceGPU *)v96 gpuHeapTemporaryResourceAllocator];
      unint64_t v58 = objc_msgSend(v57, "objectAtIndexedSubscript:", objc_msgSend(v14, "temporaryHeapIndex"));
      uint64_t v59 = [v58 allocateBuffer:4 * v95 * v94];

      int64x2_t v51 = v100;
      uint64_t v60 = [v14 normalizationRecomputeResultKernel];
      [v36 setComputePipelineState:v60];

      int v61 = [v14 normalizationInputNormalized];
      [v36 setBuffer:v61 offset:0 atIndex:0];

      [v36 setBuffer:v59 offset:0 atIndex:1];
      [v36 setBytes:&v121 length:52 atIndex:2];
      unint64_t v62 = [v102 beta];
      [v36 setBuffer:v62 offset:0 atIndex:3];

      unint64_t v63 = [v102 gamma];
      [v36 setBuffer:v63 offset:0 atIndex:4];

      v120[0] = v24;
      v120[1] = v105;
      v120[2] = 1;
      unint64_t v118 = v46;
      int64x2_t v119 = vdupq_n_s64(1uLL);
      [v36 dispatchThreadgroups:v120 threadsPerThreadgroup:&v118];
      int v104 = (void *)v59;
    }
  }
  unint64_t v64 = [v14 batchNormBetaGammaDeltaKernel];
  [v36 setComputePipelineState:v64];

  unint64_t v65 = [v51 objectAtIndexedSubscript:v103];
  [v36 setBuffer:v65 offset:0 atIndex:0];

  unint64_t v66 = [v106 objectAtIndexedSubscript:v103];
  [v36 setBuffer:v66 offset:0 atIndex:1];

  [v36 setBytes:&v121 length:52 atIndex:2];
  unint64_t v67 = [v102 beta];
  [v36 setBuffer:v67 offset:0 atIndex:3];

  uint64_t v68 = [v102 gamma];
  [v36 setBuffer:v68 offset:0 atIndex:4];

  int v69 = [v14 normalizationInputNormalized];
  [v36 setBuffer:v69 offset:0 atIndex:5];

  int v70 = [v14 normalizationComputedVariance];
  [v36 setBuffer:v70 offset:0 atIndex:6];

  int v71 = [v14 normalizationBetaGradient];
  [v36 setBuffer:v71 offset:0 atIndex:7];

  uint64_t v72 = [v14 normalizationGammaGradient];
  [v36 setBuffer:v72 offset:0 atIndex:8];

  uint64_t v73 = [v14 neuronDescriptor];

  if (v73)
  {
    [v36 setBuffer:v104 offset:0 atIndex:9];
  }
  else
  {
    unint64_t v74 = [v51 objectAtIndexedSubscript:v103];
    [v36 setBuffer:v74 offset:0 atIndex:9];
  }
  [v36 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v46) atIndex:0];
  v117[0] = v24;
  v117[1] = v105;
  unint64_t v75 = 1;
  v117[2] = 1;
  unint64_t v115 = v46;
  int64x2_t v116 = vdupq_n_s64(1uLL);
  [v36 dispatchThreadgroups:v117 threadsPerThreadgroup:&v115];
  v114[0] = v24;
  v114[1] = [v14 batchSize];
  unint64_t v76 = [v14 normalizationSumBetaGammaDeltaKernel];
  unint64_t v77 = [v76 maxTotalThreadsPerThreadgroup];

  unint64_t v78 = v24;
  if (v77 < v24)
  {
    unint64_t v78 = v77;
    unint64_t v75 = (v24 + v77 - 1) / v77;
  }
  uint64_t v79 = [v14 normalizationSumBetaGammaDeltaKernel];
  [v36 setComputePipelineState:v79];

  uint64_t v80 = [v14 normalizationBetaGradient];
  [v36 setBuffer:v80 offset:0 atIndex:0];

  unint64_t v81 = [v14 normalizationGammaGradient];
  [v36 setBuffer:v81 offset:0 atIndex:1];

  [v36 setBytes:v114 length:8 atIndex:2];
  unint64_t v112 = v75;
  int64x2_t v113 = vdupq_n_s64(1uLL);
  unint64_t v110 = v78;
  int64x2_t v111 = v113;
  [v36 dispatchThreadgroups:&v112 threadsPerThreadgroup:&v110];
  int64x2_t v82 = [v14 gradientKernel];
  [v36 setComputePipelineState:v82];

  uint64_t v83 = [v51 objectAtIndexedSubscript:v103];
  [v36 setBuffer:v83 offset:0 atIndex:0];

  int v84 = [v106 objectAtIndexedSubscript:v103];
  [v36 setBuffer:v84 offset:0 atIndex:1];

  [v36 setBytes:&v121 length:52 atIndex:2];
  int v85 = [v102 beta];
  [v36 setBuffer:v85 offset:0 atIndex:3];

  uint64_t v86 = [v102 gamma];
  [v36 setBuffer:v86 offset:0 atIndex:4];

  long long v87 = [v14 normalizationInputNormalized];
  [v36 setBuffer:v87 offset:0 atIndex:5];

  uint64_t v88 = [v14 normalizationComputedVariance];
  [v36 setBuffer:v88 offset:0 atIndex:6];

  uint64_t v89 = [v14 normalizationBetaGradient];
  [v36 setBuffer:v89 offset:0 atIndex:7];

  uint64_t v90 = [v14 normalizationGammaGradient];
  [v36 setBuffer:v90 offset:0 atIndex:8];

  uint64_t v91 = [v14 neuronDescriptor];

  if (v91)
  {
    BOOL v92 = v104;
    [v36 setBuffer:v104 offset:0 atIndex:9];
  }
  else
  {
    unint64_t v93 = [v51 objectAtIndexedSubscript:v103];
    [v36 setBuffer:v93 offset:0 atIndex:9];

    BOOL v92 = v104;
  }
  v109[0] = v24;
  v109[1] = v105;
  v109[2] = 1;
  unint64_t v107 = v46;
  int64x2_t v108 = vdupq_n_s64(1uLL);
  [v36 dispatchThreadgroups:v109 threadsPerThreadgroup:&v107];
  [v36 endEncoding];
}

- (void)dispatchForwardGroupNormalizationKernel:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 deviceIndex:(unint64_t)a6 forTraining:(BOOL)a7
{
  BOOL v65 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  int v61 = [v12 deviceMemory];
  unint64_t v62 = v13;
  uint64_t v60 = [v13 deviceMemory];
  unint64_t v63 = v11;
  id v14 = [v11 objectAtIndexedSubscript:a6];
  uint64_t v15 = [v14 exportableState];
  int v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  unint64_t v66 = [v16 objectAtIndexedSubscript:a6];

  int v17 = [(MLCDeviceGPU *)self deviceList];
  unint64_t v64 = [v17 objectAtIndexedSubscript:a6];

  int v18 = [v12 descriptor];
  int v19 = [v18 shape];
  unint64_t v20 = 1;
  unint64_t v21 = [v19 objectAtIndexedSubscript:1];
  unint64_t v22 = [v21 unsignedIntegerValue];

  uint64_t v59 = [v14 groupCount];
  uint64_t v58 = [v14 batchSize];
  unint64_t v23 = [v12 descriptor];
  unint64_t v24 = [v23 shape];
  unint64_t v25 = [v24 count];

  if (v25 >= 3)
  {
    unint64_t v20 = 1;
    unint64_t v26 = 2;
    do
    {
      unint64_t v27 = [v12 descriptor];
      unint64_t v28 = [v27 shape];
      unint64_t v29 = [v28 objectAtIndexedSubscript:v26];
      v20 *= [v29 unsignedIntegerValue];

      ++v26;
      uint64_t v30 = [v12 descriptor];
      unint64_t v31 = [v30 shape];
      unint64_t v32 = [v31 count];
    }
    while (v26 < v32);
  }
  int v73 = 0;
  v70[0] = v65;
  int v71 = v22 / [v14 groupCount];
  [v14 varianceEpsilon];
  int v75 = v33;
  int v72 = [v14 groupCount];
  float v74 = 1.0 / (float)(v20 * v71);
  v70[1] = v20;
  v70[2] = v20 * v22;
  uint64_t v34 = [v14 batchSize];
  uint64_t v35 = v15;
  if (v65)
  {
    uint64_t v36 = v34;
    uint64_t v37 = 4 * v22;
    uint64_t v38 = [v14 batchSize];
    unint64_t v39 = [v14 normalizationInputNormalized];

    if (!v39)
    {
      unint64_t v40 = objc_msgSend(v64, "newBufferWithLength:options:", v37 * v20 * v36, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
      [v14 setNormalizationInputNormalized:v40];
    }
    uint64_t v41 = [v14 normalizationInverseSqrtVariance];

    if (!v41)
    {
      unint64_t v42 = objc_msgSend(v64, "newBufferWithLength:options:", v37 * v38, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
      [v14 setNormalizationInverseSqrtVariance:v42];
    }
  }
  unint64_t v43 = [v14 forwardKernel];
  unint64_t v44 = [v43 maxTotalThreadsPerThreadgroup];

  if (v44 > v20)
  {
    unint64_t v45 = 1 << -(char)__clz(v20);
    if ((v20 & (v20 - 1)) != 0) {
      unint64_t v46 = v45;
    }
    else {
      unint64_t v46 = v20;
    }
    unint64_t v47 = [v14 forwardKernel];
    unint64_t v48 = [v47 threadExecutionWidth];

    if (v46 <= v48) {
      unint64_t v44 = v48;
    }
    else {
      unint64_t v44 = v46;
    }
  }
  unint64_t v49 = [v66 computeCommandEncoderWithDispatchType:0];
  int v50 = [v14 forwardKernel];
  [v49 setComputePipelineState:v50];

  int64x2_t v51 = [v61 objectAtIndexedSubscript:a6];
  [v49 setBuffer:v51 offset:0 atIndex:0];

  int v52 = [v60 objectAtIndexedSubscript:a6];
  [v49 setBuffer:v52 offset:0 atIndex:1];

  [v49 setBytes:v70 length:32 atIndex:2];
  int v53 = [v15 beta];
  [v49 setBuffer:v53 offset:0 atIndex:3];

  unint64_t v54 = [v15 gamma];
  [v49 setBuffer:v54 offset:0 atIndex:4];

  if (v65)
  {
    int v55 = [v14 normalizationInputNormalized];
    [v49 setBuffer:v55 offset:0 atIndex:5];

    [v14 normalizationInverseSqrtVariance];
  }
  else
  {
    int v56 = [v61 objectAtIndexedSubscript:a6];
    [v49 setBuffer:v56 offset:0 atIndex:5];

    [v61 objectAtIndexedSubscript:a6];
  unint64_t v57 = };
  [v49 setBuffer:v57 offset:0 atIndex:6];

  [v49 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v44) atIndex:0];
  v69[0] = v59;
  v69[1] = v58;
  v69[2] = 1;
  unint64_t v67 = v44;
  int64x2_t v68 = vdupq_n_s64(1uLL);
  [v49 dispatchThreadgroups:v69 threadsPerThreadgroup:&v67];
  [v49 endEncoding];
}

- (void)dispatchGradientGroupNormalizationKernel:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 deviceIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v72 = [v11 deviceMemory];
  int v73 = v12;
  [v12 deviceMemory];
  v71 = int v70 = v10;
  id v13 = [v10 objectAtIndexedSubscript:a6];
  uint64_t v14 = [v13 exportableState];
  uint64_t v15 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  int v16 = [v15 objectAtIndexedSubscript:a6];

  int v17 = [(MLCDeviceGPU *)self deviceList];
  unint64_t v66 = a6;
  float v74 = [v17 objectAtIndexedSubscript:a6];

  int v18 = [v11 descriptor];
  int v19 = [v18 shape];
  unint64_t v20 = 1;
  unint64_t v21 = [v19 objectAtIndexedSubscript:1];
  unint64_t v22 = [v21 unsignedIntegerValue];

  uint64_t v68 = [v13 groupCount];
  uint64_t v67 = [v13 batchSize];
  unint64_t v23 = [v11 descriptor];
  unint64_t v24 = [v23 shape];
  unint64_t v25 = [v24 count];

  if (v25 >= 3)
  {
    unint64_t v26 = 2;
    unint64_t v20 = 1;
    do
    {
      unint64_t v27 = [v11 descriptor];
      unint64_t v28 = [v27 shape];
      unint64_t v29 = [v28 objectAtIndexedSubscript:v26];
      v20 *= [v29 unsignedIntegerValue];

      ++v26;
      uint64_t v30 = [v11 descriptor];
      unint64_t v31 = [v30 shape];
      unint64_t v32 = [v31 count];
    }
    while (v26 < v32);
  }
  int v69 = (void *)v14;
  uint64_t v33 = [v13 normalizationGammaGradient];
  if (v33)
  {
    uint64_t v34 = (void *)v33;
    uint64_t v35 = [v13 normalizationGammaGradient];
    unint64_t v36 = [v35 length];
    uint64_t v37 = 4 * v22;
    uint64_t v38 = v16;
    unint64_t v39 = 4 * v22 * [v13 batchSize];

    BOOL v40 = v36 >= v39;
    int v16 = v38;
    if (v40) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v37 = 4 * v22;
  }
  uint64_t v41 = objc_msgSend(v74, "newBufferWithLength:options:", objc_msgSend(v13, "batchSize") * v37, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
  unint64_t v42 = objc_msgSend(v74, "newBufferWithLength:options:", objc_msgSend(v13, "batchSize") * v37, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
  [v13 setNormalizationGammaGradient:v41];
  [v13 setNormalizationBetaGradient:v42];

LABEL_10:
  v83[0] = 1;
  int v86 = v22;
  int v84 = v22 / [v13 groupCount];
  [v13 varianceEpsilon];
  int v88 = v43;
  int v85 = [v13 groupCount];
  float v87 = 1.0 / (float)(v20 * v84);
  v83[1] = v20;
  v83[2] = v20 * v22;
  unint64_t v44 = [v13 gradientKernel];
  unint64_t v45 = [v44 maxTotalThreadsPerThreadgroup];

  if (v45 > v20)
  {
    unint64_t v46 = 1 << -(char)__clz(v20);
    unint64_t v47 = (v20 & (v20 - 1)) != 0 ? v46 : v20;
    unint64_t v48 = [v13 gradientKernel];
    unint64_t v45 = [v48 threadExecutionWidth];

    if (v47 > v45) {
      unint64_t v45 = v47;
    }
  }
  unint64_t v49 = [v16 computeCommandEncoderWithDispatchType:0];
  int v50 = [v13 gradientKernel];
  [v49 setComputePipelineState:v50];

  int64x2_t v51 = [v72 objectAtIndexedSubscript:v66];
  [v49 setBuffer:v51 offset:0 atIndex:0];

  int v52 = [v71 objectAtIndexedSubscript:v66];
  uint64_t v53 = 1;
  [v49 setBuffer:v52 offset:0 atIndex:1];

  [v49 setBytes:v83 length:32 atIndex:2];
  unint64_t v54 = [v69 beta];
  [v49 setBuffer:v54 offset:0 atIndex:3];

  int v55 = [v69 gamma];
  [v49 setBuffer:v55 offset:0 atIndex:4];

  int v56 = [v13 normalizationInputNormalized];
  [v49 setBuffer:v56 offset:0 atIndex:5];

  unint64_t v57 = [v13 normalizationInverseSqrtVariance];
  [v49 setBuffer:v57 offset:0 atIndex:6];

  uint64_t v58 = [v13 normalizationBetaGradient];
  [v49 setBuffer:v58 offset:0 atIndex:7];

  uint64_t v59 = [v13 normalizationGammaGradient];
  [v49 setBuffer:v59 offset:0 atIndex:8];

  [v49 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v45) atIndex:0];
  v82[0] = v68;
  v82[1] = v67;
  v82[2] = 1;
  unint64_t v80 = v45;
  int64x2_t v81 = vdupq_n_s64(1uLL);
  [v49 dispatchThreadgroups:v82 threadsPerThreadgroup:&v80];
  v79[0] = v22;
  v79[1] = [v13 batchSize];
  uint64_t v60 = [v13 normalizationSumBetaGammaDeltaKernel];
  unint64_t v61 = [v60 maxTotalThreadsPerThreadgroup];

  if (v61 < v22)
  {
    unint64_t v62 = v22 + v61 - 1;
    unint64_t v22 = v61;
    uint64_t v53 = v62 / v61;
  }
  unint64_t v63 = [v13 normalizationSumBetaGammaDeltaKernel];
  [v49 setComputePipelineState:v63];

  unint64_t v64 = [v13 normalizationBetaGradient];
  [v49 setBuffer:v64 offset:0 atIndex:0];

  BOOL v65 = [v13 normalizationGammaGradient];
  [v49 setBuffer:v65 offset:0 atIndex:1];

  [v49 setBytes:v79 length:8 atIndex:2];
  uint64_t v77 = v53;
  int64x2_t v78 = vdupq_n_s64(1uLL);
  unint64_t v75 = v22;
  int64x2_t v76 = v78;
  [v49 dispatchThreadgroups:&v77 threadsPerThreadgroup:&v75];
  [v49 endEncoding];
}

- (void)dispatchForwardSplitLayer:(id)a3 sourceTensor:(id)a4 resultTensors:(id)a5 forConcat:(BOOL)a6
{
  id v107 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v109 = v9;
  int64x2_t v108 = [v9 deviceMemory];
  if ([v10 count])
  {
    unint64_t v11 = 0;
    do
    {
      id v12 = [v10 objectAtIndexedSubscript:v11];
      [(MLCDeviceGPU *)self allocateResultTensor:v12];

      ++v11;
    }
    while (v11 < [v10 count]);
  }
  id v13 = [v109 descriptor];
  unint64_t v112 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", [v13 dataType]);

  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v14 = 0;
    int64x2_t v113 = self;
    while (1)
    {
      int64x2_t v111 = [v108 objectAtIndexedSubscript:v14];
      uint64_t v15 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      unint64_t v110 = [v15 objectAtIndexedSubscript:v14];

      if ([v10 count]) {
        break;
      }
LABEL_58:

      ++v14;
      self = v113;
      if (v14 >= [(MLCDeviceGPU *)v113 numDevicesToUse]) {
        goto LABEL_59;
      }
    }
    uint64_t v16 = 0;
    unint64_t v114 = v14;
    while (1)
    {
      int v17 = [v10 objectAtIndexedSubscript:v16];
      int v18 = [v17 deviceMemory];

      uint64_t v115 = [v18 objectAtIndexedSubscript:v14];
      int v19 = [v10 objectAtIndexedSubscript:v16];
      unint64_t v20 = v19;
      uint64_t v21 = a6 ? [v19 concatDimension] : objc_msgSend(v19, "splitDimension");
      uint64_t v22 = v21;

      unint64_t v23 = [v10 objectAtIndexedSubscript:v16];
      unint64_t v24 = [v23 descriptor];
      unint64_t v25 = [v24 shape];
      uint64_t v26 = [v25 count];

      unint64_t v27 = [v10 objectAtIndexedSubscript:v16];
      uint64_t v28 = [v27 calculateBatchSizeToUse];

      unint64_t v29 = [v10 objectAtIndexedSubscript:v16];
      uint64_t v30 = v29;
      int64x2_t v116 = v18;
      uint64_t v31 = a6 ? [v29 concatOffset] : objc_msgSend(v29, "splitOffset");
      uint64_t v32 = v31;
      uint64_t v117 = v22;
      uint64_t v118 = v26;
      unint64_t v119 = v22 + 1;
      unint64_t v33 = v22 + 1 != v26;

      while (1)
      {
        uint64_t v34 = [v10 objectAtIndexedSubscript:v16];
        uint64_t v35 = [v34 descriptor];
        unint64_t v36 = [v35 shape];
        unint64_t v37 = [v36 count];

        if (v33 >= v37) {
          break;
        }
        uint64_t v38 = [v10 objectAtIndexedSubscript:v16];
        unint64_t v39 = [v38 descriptor];
        BOOL v40 = [v39 shape];
        uint64_t v41 = [v40 objectAtIndexedSubscript:v33];
        uint64_t v42 = [v41 unsignedIntegerValue];

        int v43 = [v10 objectAtIndexedSubscript:v16];
        unint64_t v44 = [v43 descriptor];
        unint64_t v45 = [v44 shape];
        unint64_t v46 = [v45 count];

        if (v46 >= 2)
        {
          if (v16)
          {
            unint64_t v47 = [v10 objectAtIndexedSubscript:v16 - 1];
            unint64_t v48 = [v47 descriptor];
            unint64_t v49 = [v48 shape];
            int v50 = [v49 objectAtIndexedSubscript:v33];
            v32 *= [v50 unsignedIntegerValue];
          }
        }
        v28 *= v42;
        ++v33;
      }
      if (v117 || ((v28 * v112) & 3) != 0) {
        break;
      }
      int v88 = [v110 blitCommandEncoder];
      unint64_t v89 = v32 * v112;
      uint64_t v90 = (void *)v115;
      [v88 copyFromBuffer:v111 sourceOffset:v89 toBuffer:v115 destinationOffset:0 size:v28 * v112];
      [v88 endEncoding];

      unint64_t v14 = v114;
LABEL_57:

      if (++v16 >= (unint64_t)[v10 count]) {
        goto LABEL_58;
      }
    }
    long long v125 = 0u;
    long long v126 = 0u;
    long long v124 = 0u;
    int64x2_t v51 = [v10 objectAtIndexedSubscript:v16];
    int v52 = v51;
    if (a6) {
      int v53 = [v51 concatOffset];
    }
    else {
      int v53 = [v51 splitOffset];
    }
    int v54 = v53;
    uint64_t v55 = v118;

    if (v119 == v118)
    {
      uint64_t v67 = [v10 objectAtIndexedSubscript:v16];
      uint64_t v68 = [v67 descriptor];
      int v69 = [v68 shape];
      int v70 = [v69 objectAtIndexedSubscript:v117];
      LODWORD(v124) = [v70 unsignedIntegerValue];

      DWORD1(v124) = 1;
      if (v117)
      {
        for (uint64_t i = 0; i != v117; ++i)
        {
          int v72 = [v10 objectAtIndexedSubscript:v16];
          int v73 = [v72 descriptor];
          float v74 = [v73 shape];
          unint64_t v75 = [v74 objectAtIndexedSubscript:i];
          int v76 = [v75 unsignedIntegerValue];
          DWORD1(v124) *= v76;
        }
      }
      DWORD2(v124) = 1;
    }
    else
    {
      LODWORD(v124) = 1;
      for (unint64_t j = v119; ; ++j)
      {
        unint64_t v57 = [v10 objectAtIndexedSubscript:v16];
        uint64_t v58 = [v57 descriptor];
        uint64_t v59 = [v58 shape];
        unint64_t v60 = [v59 count];

        unint64_t v61 = [v10 objectAtIndexedSubscript:v16];
        unint64_t v62 = [v61 descriptor];
        unint64_t v63 = [v62 shape];
        unint64_t v64 = v63;
        if (j >= v60) {
          break;
        }
        BOOL v65 = [v63 objectAtIndexedSubscript:j];
        int v66 = [v65 unsignedIntegerValue];
        LODWORD(v124) = v124 * v66;
      }
      uint64_t v77 = [v63 objectAtIndexedSubscript:v117];
      DWORD1(v124) = [v77 unsignedIntegerValue];

      DWORD2(v124) = 1;
      uint64_t v55 = v118;
      if (v117)
      {
        for (uint64_t k = 0; k != v117; ++k)
        {
          uint64_t v79 = [v10 objectAtIndexedSubscript:v16];
          unint64_t v80 = [v79 descriptor];
          int64x2_t v81 = [v80 shape];
          int64x2_t v82 = [v81 objectAtIndexedSubscript:k];
          int v83 = [v82 unsignedIntegerValue];
          DWORD2(v124) *= v83;
        }
      }
    }
    if (v119 == v55)
    {
      DWORD1(v126) = v54;
      HIDWORD(v124) = 1;
      int v85 = [v109 descriptor];
      int v86 = [v85 shape];
      float v87 = [v86 objectAtIndexedSubscript:v117];
      LODWORD(v125) = [v87 unsignedIntegerValue];

      *(void *)((char *)&v125 + 4) = 0x100000001;
      HIDWORD(v125) = v124;
      LODWORD(v126) = 1;
      HIDWORD(v126) = 1;
    }
    else
    {
      HIDWORD(v126) = 0;
      DWORD1(v126) = v54;
      if (v117 == 2)
      {
        int v91 = v124;
        HIDWORD(v124) = 1;
        LODWORD(v125) = v124;
        BOOL v92 = [v109 descriptor];
        unint64_t v93 = [v92 shape];
        uint64_t v94 = v93;
        uint64_t v95 = 2;
      }
      else
      {
        if (v117 != 1)
        {
          unint64_t v84 = v114;
          if (!v117)
          {
            HIDWORD(v124) = 1;
            LODWORD(v125) = v124;
            *(void *)((char *)&v125 + 4) = 0x100000001;
            HIDWORD(v125) = v124;
            LODWORD(v126) = 1;
          }
          goto LABEL_47;
        }
        int v91 = v124;
        HIDWORD(v124) = 1;
        LODWORD(v125) = v124;
        BOOL v92 = [v109 descriptor];
        unint64_t v93 = [v92 shape];
        uint64_t v94 = v93;
        uint64_t v95 = 1;
      }
      unint64_t v96 = [v93 objectAtIndexedSubscript:v95];
      DWORD1(v125) = v91 * [v96 unsignedIntegerValue];

      DWORD2(v125) = 1;
      HIDWORD(v125) = v124;
      LODWORD(v126) = DWORD1(v124) * v124;
    }
    unint64_t v84 = v114;
LABEL_47:
    int64x2_t v97 = [(MLCDeviceGPU *)v113 gpuPipelineStatesConcatFloat];
    uint64_t v98 = [v97 objectAtIndexedSubscript:v84];
    unint64_t v99 = [v98 maxTotalThreadsPerThreadgroup];

    unint64_t v100 = (int)v124;
    if (v99 <= (int)v124)
    {
      unint64_t v121 = SDWORD1(v124);
      unint64_t v100 = v99;
      unint64_t v101 = 1;
      unint64_t v102 = (v99 + (int)v124 - 1) / v99;
    }
    else
    {
      if (v99 / (int)v124 >= SDWORD1(v124)) {
        unint64_t v101 = SDWORD1(v124);
      }
      else {
        unint64_t v101 = v99 / (int)v124;
      }
      unint64_t v102 = 1;
      unint64_t v121 = (SDWORD1(v124) + v101 - 1) / v101;
    }
    uint64_t v103 = SDWORD2(v124);
    int v104 = [v110 computeCommandEncoderWithDispatchType:0];
    if (v112 == 1) {
      [(MLCDeviceGPU *)v113 gpuPipelineStatesConcatBool];
    }
    else {
    uint64_t v105 = [(MLCDeviceGPU *)v113 gpuPipelineStatesConcatFloat];
    }
    unint64_t v14 = v114;
    long long v106 = [v105 objectAtIndexedSubscript:v114];
    [v104 setComputePipelineState:v106];

    [v104 setBuffer:v111 offset:0 atIndex:0];
    uint64_t v90 = (void *)v115;
    [v104 setBuffer:v115 offset:0 atIndex:1];
    [v104 setBytes:&v124 length:48 atIndex:2];
    v123[0] = v102;
    v123[1] = v121;
    v123[2] = v103;
    v122[0] = v100;
    v122[1] = v101;
    v122[2] = 1;
    [v104 dispatchThreadgroups:v123 threadsPerThreadgroup:v122];
    [v104 endEncoding];

    goto LABEL_57;
  }
LABEL_59:
}

- (void)dispatchGradientSplitLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensor:(id)a5 forConcat:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v120 = self;
  id v111 = a5;
  if (-[MLCDeviceGPU needToAllocateDeviceMemoryForTensor:](self, "needToAllocateDeviceMemoryForTensor:"))
  {
    [(MLCDeviceGPU *)self allocateDeviceMemoryForTensor:v111];
    if ((unint64_t)[v10 count] >= 2)
    {
      if ([v10 count])
      {
        uint64_t v11 = 0;
        while (1)
        {
          id v12 = [v10 objectAtIndexedSubscript:v11];
          id v13 = [v12 deviceMemory];

          uint64_t v14 = [v13 count];
          if (!v14) {
            break;
          }
          if (++v11 >= (unint64_t)[v10 count]) {
            goto LABEL_11;
          }
        }
        if ([(MLCDeviceGPU *)v120 numDevicesToUse])
        {
          unint64_t v15 = 0;
          do
            [(MLCDeviceGPU *)v120 dispatchFillTensor:v111 deviceIndex:v15++];
          while (v15 < [(MLCDeviceGPU *)v120 numDevicesToUse]);
        }
      }
    }
  }
LABEL_11:
  unint64_t v110 = [v111 deviceMemory];
  uint64_t v16 = [v111 descriptor];
  unint64_t v119 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", [v16 dataType]);

  int v17 = [v10 objectAtIndexedSubscript:0];
  uint64_t v18 = [v17 calculateBatchSizeToUse];

  int v19 = [v10 objectAtIndexedSubscript:0];
  unint64_t v20 = v19;
  if (a6) {
    uint64_t v21 = objc_msgSend(v19, "concatDimension", v9);
  }
  else {
    uint64_t v21 = objc_msgSend(v19, "splitDimension", v9);
  }
  uint64_t v22 = v21;

  BOOL v23 = [(MLCDeviceGPU *)v120 isAppleSoCGPU];
  uint64_t v24 = 3;
  if (v23) {
    uint64_t v24 = 0;
  }
  if ((v24 & v119) != 0)
  {
    int v122 = 0;
  }
  else if (!v22 || (int v122 = 0, v22 == 1) && v18 == 1)
  {
    int v122 = 1;
  }
  unint64_t v25 = [v10 objectAtIndexedSubscript:0];
  uint64_t v26 = [v25 descriptor];
  unint64_t v27 = [v26 shape];
  uint64_t v118 = [v27 count];

  uint64_t v28 = v120;
  if ([(MLCDeviceGPU *)v120 numDevicesToUse])
  {
    unint64_t v29 = 0;
    uint64_t v117 = v22 + 1;
    while (1)
    {
      uint64_t v30 = [(MLCDeviceGPU *)v28 gpuCommandBufferList];
      uint64_t v31 = [v30 objectAtIndexedSubscript:v29];

      unint64_t v112 = v31;
      if (v122)
      {
        int64x2_t v113 = [v31 blitCommandEncoder];
      }
      else
      {
        int64x2_t v113 = 0;
      }
      unint64_t v121 = [v110 objectAtIndexedSubscript:v29];
      if ([v10 count]) {
        break;
      }
LABEL_76:
      if (v122) {
        [v113 endEncoding];
      }

      ++v29;
      uint64_t v28 = v120;
      if (v29 >= [(MLCDeviceGPU *)v120 numDevicesToUse]) {
        goto LABEL_79;
      }
    }
    uint64_t v32 = 0;
    uint64_t v127 = 0;
    unint64_t v123 = v29;
    while (1)
    {
      if (v32)
      {
        unint64_t v33 = 0;
        uint64_t v34 = 1;
        while (1)
        {
          uint64_t v35 = [v10 objectAtIndexedSubscript:v32];
          unint64_t v36 = [v35 descriptor];
          unint64_t v37 = [v36 shape];
          unint64_t v38 = [v37 count];

          if (v33 >= v38) {
            break;
          }
          unint64_t v39 = [v10 objectAtIndexedSubscript:v32 - 1];
          BOOL v40 = [v39 descriptor];
          uint64_t v41 = [v40 shape];
          uint64_t v42 = [v41 objectAtIndexedSubscript:v33];
          v34 *= [v42 unsignedIntegerValue];

          ++v33;
        }
        v127 += v34;
        unint64_t v29 = v123;
      }
      int v43 = [v10 objectAtIndexedSubscript:v32];
      unint64_t v44 = [v43 deviceMemory];

      if (!a6 && ![v44 count]) {
        goto LABEL_75;
      }
      long long v126 = v44;
      uint64_t v125 = [v44 objectAtIndexedSubscript:v29];
      unint64_t v45 = [v10 objectAtIndexedSubscript:v32];
      uint64_t v46 = [v45 calculateBatchSizeToUse];

      unint64_t v47 = [v10 objectAtIndexedSubscript:v32];
      unint64_t v48 = [v47 descriptor];
      unint64_t v49 = [v48 shape];
      unint64_t v50 = [v49 count] != 1;

      while (1)
      {
        int64x2_t v51 = [v10 objectAtIndexedSubscript:v32];
        int v52 = [v51 descriptor];
        int v53 = [v52 shape];
        unint64_t v54 = [v53 count];

        if (v50 >= v54) {
          break;
        }
        uint64_t v55 = [v10 objectAtIndexedSubscript:v32];
        int v56 = [v55 descriptor];
        unint64_t v57 = [v56 shape];
        uint64_t v58 = [v57 objectAtIndexedSubscript:v50];
        v46 *= [v58 unsignedIntegerValue];

        ++v50;
      }
      if ((v122 & 1) == 0) {
        break;
      }
      uint64_t v59 = (void *)v125;
      [v113 copyFromBuffer:v125 sourceOffset:0 toBuffer:v121 destinationOffset:v127 * v119 size:v46 * v119];
LABEL_74:
      unint64_t v44 = v126;

LABEL_75:
      if (++v32 >= (unint64_t)[v10 count]) {
        goto LABEL_76;
      }
    }
    long long v131 = 0u;
    long long v132 = 0u;
    long long v130 = 0u;
    unint64_t v60 = [v10 objectAtIndexedSubscript:v32];
    unint64_t v61 = v60;
    if (a6) {
      unsigned int v62 = [v60 concatOffset];
    }
    else {
      unsigned int v62 = [v60 splitOffset];
    }
    unsigned int v115 = v62;

    unint64_t v63 = v22 + 1;
    if (v117 == v118)
    {
      unint64_t v64 = [v10 objectAtIndexedSubscript:v32];
      BOOL v65 = [v64 descriptor];
      int v66 = [v65 shape];
      uint64_t v67 = [v66 objectAtIndexedSubscript:v22];
      LODWORD(v130) = [v67 unsignedIntegerValue];

      DWORD1(v130) = 1;
      if (v22)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          int v69 = [v10 objectAtIndexedSubscript:v32];
          int v70 = [v69 descriptor];
          int v71 = [v70 shape];
          int v72 = [v71 objectAtIndexedSubscript:i];
          int v73 = [v72 unsignedIntegerValue];
          DWORD1(v130) *= v73;
        }
      }
      DWORD2(v130) = 1;
    }
    else
    {
      LODWORD(v130) = 1;
      while (1)
      {
        float v74 = [v10 objectAtIndexedSubscript:v32];
        unint64_t v75 = [v74 descriptor];
        int v76 = [v75 shape];
        unint64_t v77 = [v76 count];

        int64x2_t v78 = [v10 objectAtIndexedSubscript:v32];
        uint64_t v79 = [v78 descriptor];
        unint64_t v80 = [v79 shape];
        int64x2_t v81 = v80;
        if (v63 >= v77) {
          break;
        }
        int64x2_t v82 = [v80 objectAtIndexedSubscript:v63];
        int v83 = [v82 unsignedIntegerValue];
        LODWORD(v130) = v130 * v83;

        ++v63;
      }
      unint64_t v84 = [v80 objectAtIndexedSubscript:v22];
      DWORD1(v130) = [v84 unsignedIntegerValue];

      DWORD2(v130) = 1;
      if (v22)
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          int v86 = [v10 objectAtIndexedSubscript:v32];
          float v87 = [v86 descriptor];
          int v88 = [v87 shape];
          unint64_t v89 = [v88 objectAtIndexedSubscript:j];
          int v90 = [v89 unsignedIntegerValue];
          DWORD2(v130) *= v90;
        }
      }
    }
    if (v117 == v118)
    {
      HIDWORD(v130) = 1;
      LODWORD(v131) = v130;
      *(void *)((char *)&v131 + 4) = 0x100000001;
      int v91 = [v111 descriptor];
      BOOL v92 = [v91 shape];
      unint64_t v93 = [v92 objectAtIndexedSubscript:v22];
      HIDWORD(v131) = [v93 unsignedIntegerValue];

      LODWORD(v132) = 1;
      *((void *)&v132 + 1) = v115 | 0x100000000;
    }
    else
    {
      *((void *)&v132 + 1) = v115;
      if (v22 == 2)
      {
        int v94 = v130;
        HIDWORD(v130) = 1;
        LODWORD(v131) = v130;
        DWORD1(v131) = DWORD1(v130) * v130;
        DWORD2(v131) = 1;
        HIDWORD(v131) = v130;
        uint64_t v95 = [v111 descriptor];
        unint64_t v96 = [v95 shape];
        int64x2_t v97 = v96;
        uint64_t v98 = 2;
      }
      else
      {
        if (v22 != 1)
        {
          unint64_t v29 = v123;
          if (!v22)
          {
            HIDWORD(v130) = 1;
            LODWORD(v131) = v130;
            *(void *)((char *)&v131 + 4) = 0x100000001;
            HIDWORD(v131) = v130;
            LODWORD(v132) = 1;
          }
          goto LABEL_64;
        }
        int v94 = v130;
        HIDWORD(v130) = 1;
        LODWORD(v131) = v130;
        DWORD1(v131) = DWORD1(v130) * v130;
        DWORD2(v131) = 1;
        HIDWORD(v131) = v130;
        uint64_t v95 = [v111 descriptor];
        unint64_t v96 = [v95 shape];
        int64x2_t v97 = v96;
        uint64_t v98 = 1;
      }
      unint64_t v99 = [v96 objectAtIndexedSubscript:v98];
      LODWORD(v132) = v94 * [v99 unsignedIntegerValue];

      unint64_t v29 = v123;
    }
LABEL_64:
    unint64_t v100 = [(MLCDeviceGPU *)v120 gpuPipelineStatesConcatFloat];
    unint64_t v101 = [v100 objectAtIndexedSubscript:v29];
    unint64_t v102 = [v101 maxTotalThreadsPerThreadgroup];

    unint64_t v103 = (int)v130;
    if (v102 <= (int)v130)
    {
      unint64_t v103 = v102;
      unint64_t v104 = 1;
      unint64_t v114 = (v102 + (int)v130 - 1) / v102;
      unint64_t v116 = SDWORD1(v130);
    }
    else
    {
      if (v102 / (int)v130 >= SDWORD1(v130)) {
        unint64_t v104 = SDWORD1(v130);
      }
      else {
        unint64_t v104 = v102 / (int)v130;
      }
      unint64_t v114 = 1;
      unint64_t v116 = (SDWORD1(v130) + v104 - 1) / v104;
    }
    uint64_t v105 = SDWORD2(v130);
    long long v106 = [v112 computeCommandEncoderWithDispatchType:0];
    if (v119 == 1) {
      [(MLCDeviceGPU *)v120 gpuPipelineStatesConcatBool];
    }
    else {
    id v107 = [(MLCDeviceGPU *)v120 gpuPipelineStatesConcatFloat];
    }
    unint64_t v29 = v123;
    int64x2_t v108 = [v107 objectAtIndexedSubscript:v123];
    [v106 setComputePipelineState:v108];

    uint64_t v59 = (void *)v125;
    [v106 setBuffer:v125 offset:0 atIndex:0];
    [v106 setBuffer:v121 offset:0 atIndex:1];
    [v106 setBytes:&v130 length:48 atIndex:2];
    v129[0] = v114;
    v129[1] = v116;
    v129[2] = v105;
    v128[0] = v103;
    v128[1] = v104;
    v128[2] = 1;
    [v106 dispatchThreadgroups:v129 threadsPerThreadgroup:v128];
    [v106 endEncoding];

    goto LABEL_74;
  }
LABEL_79:
}

- (void)dispatchForwardSplitLayer:(id)a3 sourceTensor:(id)a4 resultTensors:(id)a5
{
}

- (void)dispatchGradientSplitLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensor:(id)a5
{
}

- (void)dispatchForwardConcatLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
}

- (void)dispatchGradientConcatLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5
{
}

- (void)dispatchForwardReduceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7 forTraining:(BOOL)a8
{
  id v70 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  int v69 = v12;
  int v72 = [v12 deviceMemory];
  [(MLCDeviceGPU *)self allocateResultTensor:v13];
  int v66 = v13;
  int v73 = [v13 deviceMemory];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v15 = 0;
    char v75 = (a6 - 5) < 2;
    int64x2_t v78 = v14;
    uint64_t v67 = self;
    while (1)
    {
      uint64_t v16 = [v70 objectAtIndexedSubscript:v15];
      int v17 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      unint64_t v77 = [v17 objectAtIndexedSubscript:v15];

      uint64_t v18 = [v69 descriptor];
      int v19 = [v18 shape];
      unint64_t v20 = (void *)[v19 mutableCopy];

      if ((unint64_t)[v20 count] >= 2)
      {
        uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "batchSize"));
        [v20 setObject:v21 atIndexedSubscript:0];
      }
      uint64_t v22 = (void *)[v20 mutableCopy];
      BOOL v23 = (void *)MEMORY[0x1E01B11E0]();
      if ([v14 count]) {
        break;
      }
LABEL_47:
      if (a8)
      {
        unint64_t v64 = [v72 objectAtIndexedSubscript:v15];
        [v16 setSource:v64];

        if ((a6 - 3) <= 1)
        {
          BOOL v65 = [v73 objectAtIndexedSubscript:v15];
          [v16 setResult:v65];
        }
      }

      if (++v15 >= [(MLCDeviceGPU *)self numDevicesToUse]) {
        goto LABEL_51;
      }
    }
    int v71 = v23;
    uint64_t v79 = v16;
    uint64_t v74 = v15;
    uint64_t v24 = 0;
    unint64_t v25 = 0;
    uint64_t v26 = 0;
    while (1)
    {
      unint64_t v27 = [v14 objectAtIndexedSubscript:v24];
      unint64_t v28 = [v27 unsignedIntegerValue];

      unint64_t v29 = [NSNumber numberWithUnsignedInteger:1];
      [v22 setObject:v29 atIndexedSubscript:v28];

      memset(&v92[4], 0, 32);
      *(_DWORD *)BOOL v92 = a6;
      uint64_t v30 = [v20 objectAtIndexedSubscript:v28];
      *(_DWORD *)&v92[20] = [v30 unsignedIntegerValue];

      *(void *)&long long v31 = 0x100000001;
      *((void *)&v31 + 1) = 0x100000001;
      *(_OWORD *)&v92[4] = v31;
      *(_DWORD *)&v92[28] = 0;
      *(_WORD *)&v92[32] = 0;
      for (unint64_t i = v28; i < [v20 count]; ++i)
      {
        unint64_t v33 = [v20 objectAtIndexedSubscript:i];
        int v34 = [v33 unsignedIntegerValue];
        *(_DWORD *)&v92[4] *= v34;

        uint64_t v35 = [v22 objectAtIndexedSubscript:i];
        int v36 = [v35 unsignedIntegerValue];
        *(_DWORD *)&v92[12] *= v36;

        if (i > v28)
        {
          unint64_t v37 = [v20 objectAtIndexedSubscript:i];
          int v38 = [v37 unsignedIntegerValue];
          *(_DWORD *)&v92[8] *= v38;

          unint64_t v39 = [v22 objectAtIndexedSubscript:i];
          int v40 = [v39 unsignedIntegerValue];
          *(_DWORD *)&v92[16] *= v40;
        }
      }
      if ([v20 count]) {
        break;
      }
      uint64_t v43 = 1;
      uint64_t v42 = 1;
LABEL_21:
      *(float *)&v92[24] = 1.0 / (float)*(int *)&v92[20];
      if (v24)
      {
        id v45 = v25;
      }
      else
      {
        id v45 = [v72 objectAtIndexedSubscript:v74];
      }
      id v46 = v45;

      int64x2_t v81 = v46;
      uint64_t v82 = v24;
      if ([v22 count])
      {
        unint64_t v47 = 0;
        int v48 = 1;
        unint64_t v49 = v79;
        do
        {
          unint64_t v50 = [v22 objectAtIndexedSubscript:v47];
          v48 *= [v50 unsignedIntegerValue];

          ++v47;
        }
        while (v47 < [v22 count]);
      }
      else
      {
        int v48 = 1;
        unint64_t v49 = v79;
      }
      if ([v78 count] - 1 == v82) {
        [v73 objectAtIndexedSubscript:v74];
      }
      else {
      unint64_t v80 = MPSGetTemporaryBufferFromCommandBufferCache();
      }

      int64x2_t v51 = [v49 forwardKernel];
      unint64_t v52 = [v51 maxTotalThreadsPerThreadgroup];

      int v53 = [v20 objectAtIndexedSubscript:v28];
      unint64_t v54 = [v53 unsignedIntegerValue];

      long long v89 = *(_OWORD *)v92;
      long long v90 = *(_OWORD *)&v92[16];
      int v91 = *(_DWORD *)&v92[32];
      if (v54 <= 16 * v52)
      {
        int v83 = 0;
        unint64_t v55 = 1;
        int v56 = v77;
      }
      else
      {
        unint64_t v55 = (v52 + v54 - 1) / v52;
        v92[32] = 1;
        *(_DWORD *)&v92[12] *= v55;
        *(_DWORD *)&v92[28] = v55 * v48;
        int v56 = v77;
        int v83 = MPSGetTemporaryBufferFromCommandBufferCache();
      }
      unint64_t v57 = [v56 computeCommandEncoderWithDispatchType:0];
      uint64_t v58 = [v79 forwardKernel];
      [v57 setComputePipelineState:v58];

      [v57 setBuffer:v81 offset:0 atIndex:0];
      if (v92[32]) {
        uint64_t v59 = v83;
      }
      else {
        uint64_t v59 = v80;
      }
      [v57 setBuffer:v59 offset:0 atIndex:1];
      [v57 setBytes:v92 length:36 atIndex:2];
      uint64_t v60 = 4 * v52;
      if ((a6 & 0xFFFFFFFE) == 8) {
        uint64_t v60 = v52;
      }
      uint64_t v61 = v60 << v75;
      [v57 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(v60 << v75) atIndex:0];
      uint64_t v86 = v43;
      uint64_t v87 = v42;
      uint64_t v88 = v55;
      unint64_t v84 = v52;
      int64x2_t v85 = vdupq_n_s64(1uLL);
      [v57 dispatchThreadgroups:&v86 threadsPerThreadgroup:&v84];
      if (v92[32])
      {
        *(void *)((char *)&v89 + 4) = *(void *)&v92[12];
        *(void *)((char *)&v90 + 4) = v55 | 0x3F80000000000000;
        LOWORD(v91) = 256;
        [v57 setBuffer:v83 offset:0 atIndex:0];
        [v57 setBuffer:v80 offset:0 atIndex:1];
        [v57 setBytes:&v89 length:36 atIndex:2];
        [v57 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(v61) atIndex:0];
        uint64_t v86 = v43;
        uint64_t v87 = v42;
        uint64_t v88 = 1;
        unint64_t v84 = v52;
        int64x2_t v85 = vdupq_n_s64(1uLL);
        [v57 dispatchThreadgroups:&v86 threadsPerThreadgroup:&v84];
      }
      [v57 endEncoding];
      if ([v20 count])
      {
        unint64_t v62 = 0;
        do
        {
          unint64_t v63 = [v22 objectAtIndexedSubscript:v62];
          [v20 setObject:v63 atIndexedSubscript:v62];

          ++v62;
        }
        while (v62 < [v20 count]);
      }

      uint64_t v24 = v82 + 1;
      id v14 = v78;
      unint64_t v25 = v80;
      uint64_t v26 = v81;
      if (v82 + 1 >= (unint64_t)[v78 count])
      {

        self = v67;
        uint64_t v15 = v74;
        uint64_t v16 = v79;
        BOOL v23 = v71;
        goto LABEL_47;
      }
    }
    unint64_t v41 = 0;
    uint64_t v42 = 1;
    uint64_t v43 = 1;
    while (v41 >= v28)
    {
      if (v41 > v28)
      {
        unint64_t v44 = [v20 objectAtIndexedSubscript:v41];
        v43 *= [v44 unsignedIntegerValue];
        goto LABEL_17;
      }
LABEL_18:
      if (++v41 >= [v20 count]) {
        goto LABEL_21;
      }
    }
    unint64_t v44 = [v20 objectAtIndexedSubscript:v41];
    v42 *= [v44 unsignedIntegerValue];
LABEL_17:

    goto LABEL_18;
  }
LABEL_51:
}

- (void)dispatchGradientReduceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7
{
  id v85 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  unint64_t v84 = v11;
  uint64_t v87 = [v11 deviceMemory];
  [(MLCDeviceGPU *)self allocateResultTensor:v12];
  uint64_t v88 = [v12 deviceMemory];
  if (![(MLCDeviceGPU *)self numDevicesToUse]) {
    goto LABEL_53;
  }
  uint64_t v14 = 0;
  int v94 = v13;
  int v83 = self;
  do
  {
    unint64_t v96 = [v85 objectAtIndexedSubscript:v14];
    uint64_t v15 = [(MLCDeviceGPU *)self gpuCommandBufferList];
    uint64_t v89 = v14;
    int v91 = [v15 objectAtIndexedSubscript:v14];

    uint64_t v16 = (void *)MEMORY[0x1E01B11E0]();
    int v17 = [v84 descriptor];
    uint64_t v18 = [v17 shape];
    int v19 = (void *)[v18 mutableCopy];

    unint64_t v20 = [v84 descriptor];
    uint64_t v21 = [v20 shape];
    uint64_t v22 = (void *)[v21 mutableCopy];

    if (![v13 count]) {
      goto LABEL_52;
    }
    uint64_t v86 = v16;
    uint64_t v23 = 0;
    BOOL v92 = 0;
    uint64_t v95 = 0;
    uint64_t v24 = 0;
    uint64_t v98 = 0;
    do
    {
      unint64_t v93 = v24;
      uint64_t v97 = v23;
      unint64_t v25 = [v13 objectAtIndexedSubscript:v23];
      unint64_t v26 = [v25 unsignedIntegerValue];

      if (v26
        || ([v12 descriptor],
            unint64_t v27 = objc_claimAutoreleasedReturnValue(),
            [v27 shape],
            unint64_t v28 = objc_claimAutoreleasedReturnValue(),
            uint64_t v29 = [v28 count],
            v28,
            v27,
            v29))
      {
        uint64_t v30 = [v12 descriptor];
        long long v31 = [v30 shape];
        uint64_t v32 = [v31 objectAtIndexedSubscript:v26];
        unint64_t v33 = (void *)[v32 copy];
        [v22 setObject:v33 atIndexedSubscript:v26];
      }
      else
      {
        uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v96, "batchSize"));
        [v22 setObject:v30 atIndexedSubscript:0];
      }

      long long v103 = 0u;
      long long v104 = 0u;
      int v102 = a6;
      int v34 = [v22 objectAtIndexedSubscript:v26];
      LODWORD(v104) = [v34 unsignedIntegerValue];

      *(void *)&long long v35 = 0x100000001;
      *((void *)&v35 + 1) = 0x100000001;
      long long v103 = v35;
      for (unint64_t i = v26; i < [v22 count]; ++i)
      {
        unint64_t v37 = [v22 objectAtIndexedSubscript:i];
        int v38 = [v37 unsignedIntegerValue];
        LODWORD(v103) = v103 * v38;

        unint64_t v39 = [v19 objectAtIndexedSubscript:i];
        int v40 = [v39 unsignedIntegerValue];
        DWORD2(v103) *= v40;

        if (i > v26)
        {
          unint64_t v41 = [v22 objectAtIndexedSubscript:i];
          int v42 = [v41 unsignedIntegerValue];
          DWORD1(v103) *= v42;

          uint64_t v43 = [v19 objectAtIndexedSubscript:i];
          int v44 = [v43 unsignedIntegerValue];
          HIDWORD(v103) *= v44;
        }
      }
      if ([v22 count])
      {
        unint64_t v45 = 0;
        uint64_t v46 = 1;
        unint64_t v47 = 1;
        while (v45 >= v26)
        {
          if (v45 > v26)
          {
            int v48 = [v22 objectAtIndexedSubscript:v45];
            v47 *= [v48 unsignedIntegerValue];
            goto LABEL_18;
          }
LABEL_19:
          if (++v45 >= [v22 count]) {
            goto LABEL_22;
          }
        }
        int v48 = [v22 objectAtIndexedSubscript:v45];
        v46 *= [v48 unsignedIntegerValue];
LABEL_18:

        goto LABEL_19;
      }
      unint64_t v47 = 1;
      uint64_t v46 = 1;
LABEL_22:
      *((float *)&v104 + 1) = 1.0 / (float)(int)v104;
      unint64_t v49 = [v12 descriptor];
      unint64_t v50 = [v49 shape];
      unint64_t v51 = [v50 count];

      if (v51 >= 2)
      {
        unint64_t v52 = 1;
        do
        {
          int v53 = [v12 descriptor];
          unint64_t v54 = [v53 shape];
          unint64_t v55 = [v54 objectAtIndexedSubscript:v52];
          [v55 unsignedIntegerValue];

          ++v52;
          int v56 = [v12 descriptor];
          unint64_t v57 = [v56 shape];
          unint64_t v58 = [v57 count];
        }
        while (v52 < v58);
      }
      uint64_t v59 = v97;
      if (v97)
      {
        uint64_t v60 = v93;
        id v61 = v93;
        unint64_t v62 = v94;
LABEL_29:

        uint64_t v98 = v61;
        goto LABEL_30;
      }
      uint64_t v63 = [v96 source];

      id v61 = [v87 objectAtIndexedSubscript:v89];

      unint64_t v64 = [v96 result];

      if (v64)
      {
        [v96 result];
        BOOL v92 = v98 = v92;
        uint64_t v95 = (void *)v63;
        uint64_t v60 = v93;
        unint64_t v62 = v94;
        uint64_t v59 = 0;
        goto LABEL_29;
      }
      uint64_t v98 = v61;
      uint64_t v95 = (void *)v63;
      uint64_t v60 = v93;
      unint64_t v62 = v94;
      uint64_t v59 = 0;
LABEL_30:
      if ([v62 count] - 1 == v59)
      {
        uint64_t v65 = [v88 objectAtIndexedSubscript:v89];
      }
      else
      {
        if ([v22 count])
        {
          unint64_t v66 = 0;
          uint64_t v67 = 1;
          do
          {
            uint64_t v68 = [v22 objectAtIndexedSubscript:v66];
            v67 *= [v68 unsignedIntegerValue];

            ++v66;
          }
          while (v66 < [v22 count]);
        }
        uint64_t v65 = MPSGetTemporaryBufferFromCommandBufferCache();
      }
      int v69 = (void *)v65;

      id v70 = [v96 gradientKernel];
      unint64_t v71 = [v70 maxTotalThreadsPerThreadgroup];

      int v72 = [v22 objectAtIndexedSubscript:v26];
      unint64_t v73 = [v72 unsignedIntegerValue];

      if (v46 == 1 && v47 == 1)
      {
        BOOL v74 = v73 > 32 * v71;
        if (v73 > 32 * v71)
        {
          uint64_t v46 = 1;
          unint64_t v47 = (v71 + v73 - 1) / v71;
        }
      }
      else
      {
        BOOL v74 = 0;
      }
      BYTE12(v104) = v74;
      char v75 = [v91 computeCommandEncoderWithDispatchType:0];
      int v76 = [v96 gradientKernel];
      [v75 setComputePipelineState:v76];

      [v75 setBuffer:v98 offset:0 atIndex:0];
      [v75 setBuffer:v69 offset:0 atIndex:1];
      [v75 setBuffer:v95 offset:0 atIndex:2];
      unint64_t v77 = [v96 result];

      if (v77 && v92)
      {
        int64x2_t v78 = v75;
        uint64_t v79 = v92;
      }
      else
      {
        int64x2_t v78 = v75;
        uint64_t v79 = v95;
      }
      [v78 setBuffer:v79 offset:0 atIndex:3];
      id v13 = v94;
      [v75 setBytes:&v102 length:36 atIndex:4];
      v101[0] = v47;
      v101[1] = v46;
      v101[2] = 1;
      unint64_t v99 = v71;
      int64x2_t v100 = vdupq_n_s64(1uLL);
      [v75 dispatchThreadgroups:v101 threadsPerThreadgroup:&v99];
      [v75 endEncoding];
      if ([v19 count])
      {
        unint64_t v80 = 0;
        do
        {
          int64x2_t v81 = [v22 objectAtIndexedSubscript:v80];
          [v19 setObject:v81 atIndexedSubscript:v80];

          ++v80;
        }
        while (v80 < [v19 count]);
      }

      uint64_t v23 = v97 + 1;
      unint64_t v82 = [v94 count];
      uint64_t v24 = v69;
    }
    while (v97 + 1 < v82);

    self = v83;
    uint64_t v16 = v86;
LABEL_52:

    uint64_t v14 = v89 + 1;
  }
  while (v89 + 1 < [(MLCDeviceGPU *)self numDevicesToUse]);
LABEL_53:
}

- (void)dispatchForwardSelectLayer:(id)a3 conditionTensor:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6 forTraining:(BOOL)a7
{
  id v73 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(MLCDeviceGPU *)self allocateResultTensor:v13];
  id v70 = [v13 deviceMemory];
  uint64_t v14 = [v13 descriptor];
  uint64_t v15 = [v14 shape];
  uint64_t v16 = [v15 count];

  int v72 = v11;
  int v17 = [v11 descriptor];
  uint64_t v18 = (void *)[v17 newShapeWithCount:v16];

  int v19 = [v12 objectAtIndexedSubscript:0];
  unint64_t v20 = [v19 descriptor];
  char v75 = (void *)[v20 newShapeWithCount:v16];

  unint64_t v71 = v12;
  uint64_t v21 = [v12 objectAtIndexedSubscript:1];
  uint64_t v22 = [v21 descriptor];
  BOOL v74 = (void *)[v22 newShapeWithCount:v16];

  uint64_t v65 = v13;
  uint64_t v23 = [v13 descriptor];
  uint64_t v24 = [v23 shape];

  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v25 = 0;
    int64x2_t v66 = vdupq_n_s64(8uLL);
    uint64_t v68 = v18;
    int v69 = self;
    uint64_t v67 = v24;
    while (1)
    {
      unint64_t v26 = [v73 objectAtIndexedSubscript:v25];
      unint64_t v27 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      unint64_t v28 = [v27 objectAtIndexedSubscript:v25];

      unsigned int v86 = 0;
      memset_pattern16(__b, &unk_1DD1F0C40, 0x40uLL);
      if ([v24 count] == 1) {
        break;
      }
      uint64_t v30 = [v24 count];
      long long v31 = [v18 objectAtIndexedSubscript:0];
      int v32 = [v31 unsignedIntegerValue];
      if (v30 == 2)
      {
        uint64_t v33 = 0;
        uint64_t v29 = 1;
        goto LABEL_10;
      }
      __b[0] = v32;

      int v34 = [v75 objectAtIndexedSubscript:0];
      __b[4] = [v34 unsignedIntegerValue];

      long long v35 = [v74 objectAtIndexedSubscript:0];
      __b[8] = [v35 unsignedIntegerValue];

      int v36 = [v24 objectAtIndexedSubscript:0];
      int v82 = [v36 unsignedIntegerValue];

      uint64_t v37 = [v24 count];
      int v38 = [v18 objectAtIndexedSubscript:1];
      __b[1] = [v38 unsignedIntegerValue];

      unint64_t v39 = [v75 objectAtIndexedSubscript:1];
      __b[5] = [v39 unsignedIntegerValue];

      int v40 = [v74 objectAtIndexedSubscript:1];
      __b[9] = [v40 unsignedIntegerValue];

      unint64_t v41 = [v24 objectAtIndexedSubscript:1];
      int v83 = [v41 unsignedIntegerValue];

      long long v31 = [v18 objectAtIndexedSubscript:2];
      int v32 = [v31 unsignedIntegerValue];
      if (v37 != 3)
      {
        uint64_t v33 = 2;
        uint64_t v29 = 3;
LABEL_10:
        __b[2] = v32;

        int v42 = [v75 objectAtIndexedSubscript:v33];
        __b[6] = [v42 unsignedIntegerValue];

        uint64_t v43 = [v74 objectAtIndexedSubscript:v33];
        __b[10] = [v43 unsignedIntegerValue];

        int v44 = [v24 objectAtIndexedSubscript:v33];
        int v84 = [v44 unsignedIntegerValue];

LABEL_11:
        long long v31 = [v18 objectAtIndexedSubscript:v29];
        int v32 = [v31 unsignedIntegerValue];
        goto LABEL_12;
      }
      uint64_t v29 = 2;
LABEL_12:
      __b[3] = v32;

      unint64_t v45 = [v75 objectAtIndexedSubscript:v29];
      __b[7] = [v45 unsignedIntegerValue];

      uint64_t v46 = [v74 objectAtIndexedSubscript:v29];
      __b[11] = [v46 unsignedIntegerValue];

      unint64_t v47 = [v24 objectAtIndexedSubscript:v29];
      int v85 = [v47 unsignedIntegerValue];

      unsigned int v48 = __clz(__rbit32((unsigned __int16)v82)) << 16;
      if (((v82 - 1) & (unsigned __int16)v82) != 0) {
        int v49 = -65536;
      }
      else {
        int v49 = v48;
      }
      unsigned int v86 = v49 & 0xFFFF0000 | (unsigned __int16)v82;
      unint64_t v50 = [v26 forwardKernel];
      unint64_t v51 = [v50 maxTotalThreadsPerThreadgroup];

      if (v51 >> 6 >= v82 * (uint64_t)v83) {
        unint64_t v52 = v82 * (uint64_t)v83;
      }
      else {
        unint64_t v52 = v51 >> 6;
      }
      unint64_t v76 = (unint64_t)(v85 + 7) >> 3;
      unint64_t v77 = (unint64_t)(v84 + 7) >> 3;
      unint64_t v53 = (v52 + v82 * (uint64_t)v83 - 1) / v52;
      unint64_t v54 = [v28 computeCommandEncoderWithDispatchType:0];
      unint64_t v55 = [v26 forwardKernel];
      [v54 setComputePipelineState:v55];

      int v56 = [v72 deviceMemory];
      unint64_t v57 = [v56 objectAtIndexedSubscript:v25];
      [v54 setBuffer:v57 offset:0 atIndex:0];

      unint64_t v58 = [v71 objectAtIndexedSubscript:0];
      uint64_t v59 = [v58 deviceMemory];
      uint64_t v60 = [v59 objectAtIndexedSubscript:v25];
      [v54 setBuffer:v60 offset:0 atIndex:1];

      id v61 = [v71 objectAtIndexedSubscript:1];
      unint64_t v62 = [v61 deviceMemory];
      uint64_t v63 = [v62 objectAtIndexedSubscript:v25];
      [v54 setBuffer:v63 offset:0 atIndex:2];

      unint64_t v64 = [v70 objectAtIndexedSubscript:v25];
      [v54 setBuffer:v64 offset:0 atIndex:3];

      [v54 setBytes:__b length:68 atIndex:4];
      v80[0] = v76;
      v80[1] = v77;
      v80[2] = v53;
      int64x2_t v78 = v66;
      unint64_t v79 = v52;
      uint64_t v24 = v67;
      [v54 dispatchThreadgroups:v80 threadsPerThreadgroup:&v78];
      [v54 endEncoding];

      ++v25;
      self = v69;
      uint64_t v18 = v68;
      if (v25 >= [(MLCDeviceGPU *)v69 numDevicesToUse]) {
        goto LABEL_19;
      }
    }
    uint64_t v29 = 0;
    goto LABEL_11;
  }
LABEL_19:
}

- (void)dispatchGradientSelectLayer:(id)a3 conditionTensor:(id)a4 sourceGradientTensor:(id)a5 resultGradientTensors:(id)a6
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v103 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v12 objectAtIndexedSubscript:0];
  [(MLCDeviceGPU *)self allocateResultTensor:v13];

  uint64_t v14 = [v12 objectAtIndexedSubscript:1];
  [(MLCDeviceGPU *)self allocateResultTensor:v14];

  uint64_t v15 = [v11 descriptor];
  uint64_t v16 = [v15 shape];
  uint64_t v17 = [v16 count];

  int v102 = [v10 deviceMemory];
  unint64_t v101 = [v11 deviceMemory];
  uint64_t v18 = [v12 objectAtIndexedSubscript:0];
  unint64_t v114 = [v18 deviceMemory];

  int v19 = [v12 objectAtIndexedSubscript:1];
  unint64_t v112 = [v19 deviceMemory];

  unint64_t v20 = [v10 descriptor];
  uint64_t v21 = (void *)[v20 newShapeWithCount:v17];

  uint64_t v22 = [v12 objectAtIndexedSubscript:0];
  uint64_t v23 = [v22 descriptor];
  uint64_t v105 = (void *)[v23 newShapeWithCount:v17];

  uint64_t v98 = v12;
  uint64_t v24 = [v12 objectAtIndexedSubscript:1];
  unint64_t v25 = [v24 descriptor];
  long long v104 = (void *)[v25 newShapeWithCount:v17];

  unint64_t v99 = v11;
  unint64_t v26 = [v11 descriptor];
  unint64_t v27 = [v26 shape];

  if (![(MLCDeviceGPU *)self numDevicesToUse]) {
    goto LABEL_54;
  }
  unint64_t v28 = 0;
  int64x2_t v100 = vdupq_n_s64(8uLL);
  unint64_t v29 = 0x1E4F35000;
  long long v106 = v27;
  int64x2_t v113 = self;
  uint64_t v109 = v21;
  do
  {
    uint64_t v30 = [v103 objectAtIndexedSubscript:v28];
    long long v31 = [(MLCDeviceGPU *)self gpuCommandBufferList];
    int v32 = [v31 objectAtIndexedSubscript:v28];

    uint64_t v33 = [v27 count];
    int v34 = [v27 objectAtIndexedSubscript:0];
    unint64_t v35 = [v34 unsignedIntegerValue];
    unint64_t v110 = v30;
    if (v33 == 1)
    {

      int v36 = v109;
    }
    else
    {
      if (v35 <= [v30 batchSize])
      {
        uint64_t v37 = [v27 objectAtIndexedSubscript:0];
        uint64_t v33 = [v37 unsignedIntegerValue];
      }
      else
      {
        uint64_t v33 = [v30 batchSize];
      }
      int v36 = v109;

      unint64_t v35 = 1;
      if ((unint64_t)[v27 count] >= 2)
      {
        unint64_t v38 = 1;
        do
        {
          unint64_t v39 = [v27 objectAtIndexedSubscript:v38];
          v35 *= [v39 unsignedIntegerValue];

          ++v38;
        }
        while (v38 < [v27 count]);
        unint64_t v29 = 0x1E4F35000uLL;
      }
    }
    id v111 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v33 columns:v35 rowBytes:4 * v35 dataType:268435488];
    unsigned int v129 = 0;
    memset_pattern16(__b, &unk_1DD1F0C40, 0x40uLL);
    if ([v27 count] == 1)
    {
      uint64_t v40 = 0;
LABEL_20:
      int v42 = [v36 objectAtIndexedSubscript:v40];
      int v43 = [v42 unsignedIntegerValue];
      goto LABEL_21;
    }
    uint64_t v41 = [v27 count];
    int v42 = [v36 objectAtIndexedSubscript:0];
    int v43 = [v42 unsignedIntegerValue];
    if (v41 == 2)
    {
      uint64_t v44 = 0;
      uint64_t v40 = 1;
LABEL_19:
      __b[2] = v43;

      unint64_t v53 = [v105 objectAtIndexedSubscript:v44];
      DWORD2(v126) = [v53 unsignedIntegerValue];

      unint64_t v54 = [v104 objectAtIndexedSubscript:v44];
      DWORD2(v127) = [v54 unsignedIntegerValue];

      unint64_t v55 = [v27 objectAtIndexedSubscript:v44];
      DWORD2(v128) = [v55 unsignedIntegerValue];

      goto LABEL_20;
    }
    __b[0] = v43;

    unint64_t v45 = [v105 objectAtIndexedSubscript:0];
    LODWORD(v126) = [v45 unsignedIntegerValue];

    uint64_t v46 = [v104 objectAtIndexedSubscript:0];
    LODWORD(v127) = [v46 unsignedIntegerValue];

    unint64_t v47 = [v106 objectAtIndexedSubscript:0];
    LODWORD(v128) = [v47 unsignedIntegerValue];

    uint64_t v48 = [v106 count];
    int v49 = [v36 objectAtIndexedSubscript:1];
    __b[1] = [v49 unsignedIntegerValue];

    unint64_t v27 = v106;
    unint64_t v50 = [v105 objectAtIndexedSubscript:1];
    DWORD1(v126) = [v50 unsignedIntegerValue];

    unint64_t v51 = [v104 objectAtIndexedSubscript:1];
    DWORD1(v127) = [v51 unsignedIntegerValue];

    unint64_t v52 = [v106 objectAtIndexedSubscript:1];
    DWORD1(v128) = [v52 unsignedIntegerValue];

    int v42 = [v36 objectAtIndexedSubscript:2];
    int v43 = [v42 unsignedIntegerValue];
    if (v48 != 3)
    {
      uint64_t v44 = 2;
      uint64_t v40 = 3;
      goto LABEL_19;
    }
    uint64_t v40 = 2;
LABEL_21:
    __b[3] = v43;

    int v56 = [v105 objectAtIndexedSubscript:v40];
    HIDWORD(v126) = [v56 unsignedIntegerValue];

    unint64_t v57 = [v104 objectAtIndexedSubscript:v40];
    HIDWORD(v127) = [v57 unsignedIntegerValue];

    unint64_t v58 = [v27 objectAtIndexedSubscript:v40];
    HIDWORD(v128) = [v58 unsignedIntegerValue];

    uint64_t v59 = 0;
    long long v131 = 0;
    uint64_t v132 = 0;
    char v60 = 1;
    v130[0] = 0;
    v130[1] = 0;
    while (1)
    {
      char v61 = v60;
      unint64_t v62 = &__b[4 * v59];
      int v63 = v62[4] != v128;
      if (v62[5] != DWORD1(v128)) {
        v63 |= 2u;
      }
      int v65 = v62[6];
      int v64 = v62[7];
      if (v65 != DWORD2(v128)) {
        v63 |= 4u;
      }
      int v66 = v64 == HIDWORD(v128) ? v63 : v63 | 8;
      v133[v59] = v66;
      if (!v66) {
        break;
      }
      uint64_t v67 = [*(id *)(v29 + 2432) temporaryMatrixWithCommandBuffer:v32 matrixDescriptor:v111];
      uint64_t v68 = (void *)v130[v59];
      v130[v59] = v67;

      uint64_t v69 = [(id)v130[v59] data];
      id v70 = *(&v131 + v59);
      *(&v131 + v59) = (void *)v69;
LABEL_33:

      char v60 = 0;
      uint64_t v59 = 1;
      if ((v61 & 1) == 0) {
        goto LABEL_36;
      }
    }
    if (v61)
    {
      uint64_t v71 = [v114 objectAtIndexedSubscript:v28];
      id v70 = v131;
      long long v131 = (void *)v71;
      goto LABEL_33;
    }
    uint64_t v72 = [v112 objectAtIndexedSubscript:v28];
    id v73 = *(&v131 + v59);
    *(&v131 + v59) = (void *)v72;

LABEL_36:
    unsigned int v74 = __clz(__rbit32((unsigned __int16)v128)) << 16;
    if (((v128 - 1) & (unsigned __int16)v128) != 0) {
      int v75 = -65536;
    }
    else {
      int v75 = v74;
    }
    unsigned int v129 = v75 & 0xFFFF0000 | (unsigned __int16)v128;
    unint64_t v76 = [v110 gradientKernel];
    unint64_t v77 = [v76 maxTotalThreadsPerThreadgroup];

    if (v77 >> 6 >= (int)v128 * (uint64_t)SDWORD1(v128)) {
      unint64_t v78 = (int)v128 * (uint64_t)SDWORD1(v128);
    }
    else {
      unint64_t v78 = v77 >> 6;
    }
    unint64_t v79 = (unint64_t)(SHIDWORD(v128) + 7) >> 3;
    unint64_t v107 = (unint64_t)(SDWORD2(v128) + 7) >> 3;
    unint64_t v80 = (v78 + (int)v128 * (uint64_t)SDWORD1(v128) - 1) / v78;
    int64x2_t v81 = [v32 computeCommandEncoderWithDispatchType:0];
    int v82 = [v110 gradientKernel];
    [v81 setComputePipelineState:v82];

    int v83 = [v102 objectAtIndexedSubscript:v28];
    [v81 setBuffer:v83 offset:0 atIndex:0];

    int v84 = [v101 objectAtIndexedSubscript:v28];
    char v85 = 1;
    [v81 setBuffer:v84 offset:0 atIndex:1];

    [v81 setBuffer:v131 offset:0 atIndex:2];
    [v81 setBuffer:v132 offset:0 atIndex:3];
    [v81 setBytes:__b length:68 atIndex:4];
    *(void *)unint64_t v119 = v79;
    *(void *)&v119[8] = v107;
    *(void *)&v119[16] = v80;
    int64x2_t v123 = v100;
    unint64_t v124 = v78;
    [v81 dispatchThreadgroups:v119 threadsPerThreadgroup:&v123];
    int64x2_t v108 = v81;
    [v81 endEncoding];
    uint64_t v86 = 0;
    long long v122 = 0u;
    *(_OWORD *)&v120[12] = 0u;
    long long v121 = 0u;
    *(_DWORD *)unint64_t v119 = 0;
    *(_OWORD *)&v119[4] = v126;
    *(_OWORD *)&v119[20] = v127;
    *(_OWORD *)uint64_t v120 = v128;
    do
    {
      char v87 = v85;
      if (v133[v86])
      {
        WORD4(v121) = v133[v86];
        WORD5(v121) = v86;
        uint64_t v88 = [(MLCDeviceGPU *)v113 gpuPipelineStatesArithmeticReduceGradientAny];
        uint64_t v89 = [v88 objectAtIndexedSubscript:v28];
        uint64_t v90 = [v89 maxTotalThreadsPerThreadgroup];

        int v91 = [v32 computeCommandEncoderWithDispatchType:0];
        BOOL v92 = [(MLCDeviceGPU *)v113 gpuPipelineStatesArithmeticReduceGradientAny];
        unint64_t v93 = [v92 objectAtIndexedSubscript:v28];
        [v91 setComputePipelineState:v93];

        [v91 setBuffer:*(&v131 + v86) offset:0 atIndex:0];
        if (v87) {
          int v94 = v114;
        }
        else {
          int v94 = v112;
        }
        uint64_t v95 = [v94 objectAtIndexedSubscript:v28];
        [v91 setBuffer:v95 offset:0 atIndex:1];

        [v91 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v90) atIndex:0];
        [v91 setBytes:v119 length:96 atIndex:2];
        int64x2_t v116 = vdupq_n_s64(1uLL);
        int64x2_t v117 = v116;
        uint64_t v118 = 1;
        uint64_t v115 = v90;
        [v91 dispatchThreadgroups:&v117 threadsPerThreadgroup:&v115];
        [v91 endEncoding];
      }
      char v85 = 0;
      uint64_t v86 = 1;
    }
    while ((v87 & 1) != 0);

    for (uint64_t i = 1; i != -1; --i)
    uint64_t v97 = 8;
    uint64_t v21 = v109;
    unint64_t v27 = v106;
    unint64_t v29 = 0x1E4F35000;
    do
    {

      v97 -= 8;
    }
    while (v97 != -8);

    ++v28;
    self = v113;
  }
  while (v28 < [(MLCDeviceGPU *)v113 numDevicesToUse]);
LABEL_54:
}

- (void)dispatchForwardScatterLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  id v106 = a3;
  id v9 = a4;
  id v10 = a5;
  [(MLCDeviceGPU *)self allocateResultTensor:v10];
  id v11 = [v9 objectAtIndexedSubscript:2];
  id v103 = [v11 deviceMemory];

  id v12 = [v9 objectAtIndexedSubscript:1];
  uint64_t v105 = [v12 deviceMemory];

  id v13 = [v9 objectAtIndexedSubscript:0];
  long long v104 = [v13 deviceMemory];

  unint64_t v114 = [v10 deviceMemory];
  id v14 = [v9 objectAtIndexedSubscript:2];

  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v15 = 0;
    id v112 = v14;
    int64x2_t v113 = self;
    while (2)
    {
      uint64_t v16 = [v106 objectAtIndexedSubscript:v15];
      uint64_t v17 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      uint64_t v18 = [v17 objectAtIndexedSubscript:v15];

      int v19 = [v18 computeCommandEncoderWithDispatchType:0];
      unint64_t v110 = v18;
      uint64_t v111 = v15;
      uint64_t v115 = (void *)v16;
      uint64_t v109 = v19;
      if (v14 == v10)
      {
        unint64_t v27 = [(MLCDeviceGPU *)self gpuPipelineStatesMemFillFloat];
        unint64_t v28 = [v27 objectAtIndexedSubscript:v15];
        uint64_t v29 = [v28 maxTotalThreadsPerThreadgroup];

        *(void *)&v119[0] = 0;
        uint64_t v30 = [v9 objectAtIndexedSubscript:2];
        long long v31 = [v30 descriptor];
        int v32 = [v31 shape];
        unint64_t v108 = v29;
        if ([v32 count] == 1) {
          int v33 = 1;
        }
        else {
          int v33 = [v115 batchSize];
        }

        for (unint64_t i = 1; ; ++i)
        {
          uint64_t v48 = [v9 objectAtIndexedSubscript:2];
          int v49 = [v48 descriptor];
          unint64_t v50 = [v49 shape];
          unint64_t v51 = [v50 count];

          if (i >= v51) {
            break;
          }
          unint64_t v52 = [v9 objectAtIndexedSubscript:2];
          unint64_t v53 = [v52 descriptor];
          unint64_t v54 = [v53 shape];
          unint64_t v55 = [v54 objectAtIndexedSubscript:i];
          v33 *= [v55 unsignedIntegerValue];
        }
        LODWORD(v119[0]) = 0;
        DWORD1(v119[0]) = v33;
        int v56 = [(MLCDeviceGPU *)v113 gpuPipelineStatesMemFillFloat];
        unint64_t v57 = [v56 objectAtIndexedSubscript:v15];
        [v19 setComputePipelineState:v57];

        unint64_t v45 = [v114 objectAtIndexedSubscript:v15];
        [v19 setBuffer:v45 offset:0 atIndex:0];
        [v19 setBytes:v119 length:8 atIndex:1];
        unint64_t v128 = (v108 + ((unint64_t)(v33 + 3) >> 2) - 1) / v108;
        int64x2_t v129 = vdupq_n_s64(1uLL);
        unint64_t v126 = v108;
        int64x2_t v127 = v129;
        [v19 dispatchThreadgroups:&v128 threadsPerThreadgroup:&v126];
      }
      else
      {
        unint64_t v20 = [(MLCDeviceGPU *)self gpuPipelineStatesMemCopy];
        uint64_t v21 = [v20 objectAtIndexedSubscript:v15];
        uint64_t v22 = [v21 maxTotalThreadsPerThreadgroup];

        LODWORD(v119[0]) = 0;
        uint64_t v23 = [v9 objectAtIndexedSubscript:0];
        uint64_t v24 = [v23 descriptor];
        unint64_t v25 = [v24 shape];
        unint64_t v107 = v22;
        if ([v25 count] == 1) {
          int v26 = 1;
        }
        else {
          int v26 = [v115 batchSize];
        }

        for (unint64_t j = 1; ; ++j)
        {
          unint64_t v35 = [v9 objectAtIndexedSubscript:2];
          int v36 = [v35 descriptor];
          uint64_t v37 = [v36 shape];
          unint64_t v38 = [v37 count];

          if (j >= v38) {
            break;
          }
          unint64_t v39 = [v9 objectAtIndexedSubscript:2];
          uint64_t v40 = [v39 descriptor];
          uint64_t v41 = [v40 shape];
          int v42 = [v41 objectAtIndexedSubscript:j];
          v26 *= [v42 unsignedIntegerValue];
        }
        LODWORD(v119[0]) = 4 * v26;
        int v43 = [(MLCDeviceGPU *)v113 gpuPipelineStatesMemCopy];
        uint64_t v44 = [v43 objectAtIndexedSubscript:v15];
        [v19 setComputePipelineState:v44];

        unint64_t v45 = [v103 objectAtIndexedSubscript:v15];
        uint64_t v46 = [v114 objectAtIndexedSubscript:v15];
        [v19 setBuffer:v45 offset:0 atIndex:0];
        [v19 setBuffer:v46 offset:0 atIndex:1];
        [v19 setBytes:v119 length:4 atIndex:2];
        unint64_t v124 = (v107 + (v26 & 0x3FFFFFFF) - 1) / v107;
        int64x2_t v125 = vdupq_n_s64(1uLL);
        unint64_t v122 = v107;
        int64x2_t v123 = v125;
        [v19 dispatchThreadgroups:&v124 threadsPerThreadgroup:&v122];
      }
      long long v120 = 0u;
      long long v121 = 0u;
      memset(v119, 0, sizeof(v119));
      unint64_t v58 = [v9 objectAtIndexedSubscript:1];
      uint64_t v59 = [v58 descriptor];
      char v60 = [v59 shape];
      DWORD1(v121) = [v60 count];

      LODWORD(v121) = [v115 scatterGatherDimension];
      DWORD2(v121) = [v115 scatterReduceType] == 1;
      char v61 = [v9 objectAtIndexedSubscript:1];
      unint64_t v62 = [v61 descriptor];
      int v63 = [v62 shape];
      uint64_t v64 = [v63 count];

      if (v64 >= 1)
      {
        int v65 = (_DWORD *)v119 + v64;
        do
        {
          uint64_t v66 = v64 - 1;
          int v67 = 1;
          uint64_t v68 = [v9 objectAtIndexedSubscript:1];
          uint64_t v69 = [v68 descriptor];
          id v70 = [v69 shape];
          uint64_t v71 = [v70 objectAtIndexedSubscript:v64 - 1];
          *(v65 - 1) = [v71 unsignedIntegerValue];

          uint64_t v72 = [v9 objectAtIndexedSubscript:1];
          id v73 = [v72 descriptor];
          unsigned int v74 = [v73 shape];
          if (v64 != [v74 count]) {
            int v67 = v65[4] * *v65;
          }
          v65[3] = v67;

          --v65;
          --v64;
        }
        while ((unint64_t)(v66 + 1) > 1);
      }
      int v75 = [v10 descriptor];
      unint64_t v76 = [v75 shape];
      uint64_t v77 = [v76 count];

      if (v77 >= 1)
      {
        unint64_t v78 = (_DWORD *)&v120 + v77;
        do
        {
          uint64_t v79 = v77 - 1;
          unint64_t v80 = [v10 descriptor];
          int64x2_t v81 = [v80 shape];
          int v82 = [v81 objectAtIndexedSubscript:v77 - 1];
          *(v78 - 5) = [v82 unsignedIntegerValue];

          int v83 = [v10 descriptor];
          int v84 = [v83 shape];
          if (v77 == [v84 count]) {
            int v85 = 1;
          }
          else {
            int v85 = *v78 * *(v78 - 4);
          }
          *--unint64_t v78 = v85;

          --v77;
        }
        while ((unint64_t)(v79 + 1) > 1);
      }
      if (SDWORD1(v121) <= 1)
      {
        unsigned int v88 = 1;
      }
      else
      {
        unsigned int v86 = __clz(__rbit32(LOWORD(v119[0]))) << 16;
        if (((unsigned __int16)(LOWORD(v119[0]) - 1) & v119[0]) != 0) {
          int v87 = -65536;
        }
        else {
          int v87 = v86;
        }
        unsigned int v88 = v87 & 0xFFFF0000 | LOWORD(v119[0]);
      }
      HIDWORD(v121) = v88;
      uint64_t v89 = [v115 forwardKernel];
      unint64_t v90 = [v89 maxTotalThreadsPerThreadgroup];

      switch(DWORD1(v121))
      {
        case 1:
          unint64_t v91 = SLODWORD(v119[0]);
          goto LABEL_39;
        case 2:
          unint64_t v91 = SDWORD1(v119[0]) * (uint64_t)SLODWORD(v119[0]);
          goto LABEL_39;
        case 3:
          unint64_t v91 = SDWORD1(v119[0]) * (uint64_t)SLODWORD(v119[0]);
          uint64_t v93 = SDWORD2(v119[0]);
          uint64_t v92 = 1;
          goto LABEL_42;
        case 4:
          unint64_t v91 = SDWORD1(v119[0]) * (uint64_t)SLODWORD(v119[0]);
          uint64_t v93 = SDWORD2(v119[0]);
          uint64_t v92 = SHIDWORD(v119[0]);
          goto LABEL_42;
        default:
          unint64_t v91 = 1;
LABEL_39:
          uint64_t v92 = 1;
          uint64_t v93 = 1;
LABEL_42:
          unint64_t v94 = v90 >> 6;
          if (v91 < v90 >> 6) {
            unint64_t v94 = v91;
          }
          if (v94 <= 1) {
            unint64_t v95 = 1;
          }
          else {
            unint64_t v95 = v94;
          }
          unint64_t v96 = (unint64_t)(v92 + 7) >> 3;
          unint64_t v97 = (unint64_t)(v93 + 7) >> 3;
          unint64_t v98 = (v91 + v95 - 1) / v95;
          if (v112 == v10) {
            [v115 gradientKernel];
          }
          else {
          unint64_t v99 = [v115 forwardKernel];
          }
          [v109 setComputePipelineState:v99];

          int64x2_t v100 = [v105 objectAtIndexedSubscript:v111];
          [v109 setBuffer:v100 offset:0 atIndex:0];

          unint64_t v101 = [v104 objectAtIndexedSubscript:v111];
          [v109 setBuffer:v101 offset:0 atIndex:1];

          int v102 = [v114 objectAtIndexedSubscript:v111];
          [v109 setBuffer:v102 offset:0 atIndex:2];

          [v109 setBytes:v119 length:80 atIndex:3];
          v118[0] = v96;
          v118[1] = v97;
          v118[2] = v98;
          int64x2_t v116 = vdupq_n_s64(8uLL);
          unint64_t v117 = v95;
          [v109 dispatchThreadgroups:v118 threadsPerThreadgroup:&v116];
          [v109 endEncoding];

          uint64_t v15 = v111 + 1;
          self = v113;
          id v14 = v112;
          if (v111 + 1 >= [(MLCDeviceGPU *)v113 numDevicesToUse]) {
            break;
          }
          continue;
      }
      break;
    }
  }
}

- (void)dispatchForwardGatherLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  id v64 = a3;
  id v9 = a4;
  id v10 = a5;
  [(MLCDeviceGPU *)self allocateResultTensor:v10];
  id v11 = [v9 objectAtIndexedSubscript:0];
  int v63 = [v11 deviceMemory];

  id v12 = [v9 objectAtIndexedSubscript:1];
  unint64_t v62 = [v12 deviceMemory];

  char v61 = [v10 deviceMemory];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v13 = 0;
    int64x2_t v59 = vdupq_n_s64(8uLL);
    char v60 = self;
    while (2)
    {
      id v14 = [v64 objectAtIndexedSubscript:v13];
      uint64_t v15 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      uint64_t v66 = [v15 objectAtIndexedSubscript:v13];

      long long v71 = 0u;
      memset(v72, 0, 28);
      memset(v70, 0, sizeof(v70));
      uint64_t v16 = [v9 objectAtIndexedSubscript:1];
      uint64_t v17 = [v16 descriptor];
      uint64_t v18 = [v17 shape];
      v72[5] = [v18 count];

      int v65 = v14;
      v72[4] = [v14 scatterGatherDimension];
      int v19 = [v9 objectAtIndexedSubscript:0];
      unint64_t v20 = [v19 descriptor];
      uint64_t v21 = [v20 shape];
      uint64_t v22 = [v21 count];

      if (v22 >= 1)
      {
        uint64_t v23 = (_DWORD *)v70 + v22;
        do
        {
          uint64_t v24 = v22 - 1;
          unint64_t v25 = [v9 objectAtIndexedSubscript:0];
          int v26 = [v25 descriptor];
          unint64_t v27 = [v26 shape];
          unint64_t v28 = [v27 objectAtIndexedSubscript:v22 - 1];
          *(v23 - 1) = [v28 unsignedIntegerValue];

          uint64_t v29 = [v9 objectAtIndexedSubscript:0];
          uint64_t v30 = [v29 descriptor];
          long long v31 = [v30 shape];
          if (v22 == [v31 count]) {
            int v32 = 1;
          }
          else {
            int v32 = v23[4] * *v23;
          }
          v23[3] = v32;

          --v23;
          --v22;
        }
        while ((unint64_t)(v24 + 1) > 1);
      }
      int v33 = [v10 descriptor];
      int v34 = [v33 shape];
      uint64_t v35 = [v34 count];

      if (v35 >= 1)
      {
        int v36 = &v72[v35];
        do
        {
          uint64_t v37 = v35 - 1;
          unint64_t v38 = [v10 descriptor];
          unint64_t v39 = [v38 shape];
          uint64_t v40 = [v39 objectAtIndexedSubscript:v35 - 1];
          *(v36 - 5) = [v40 unsignedIntegerValue];

          uint64_t v41 = [v10 descriptor];
          int v42 = [v41 shape];
          if (v35 == [v42 count]) {
            int v43 = 1;
          }
          else {
            int v43 = *v36 * *(v36 - 4);
          }
          *--int v36 = v43;

          --v35;
        }
        while ((unint64_t)(v37 + 1) > 1);
      }
      if (v72[5] <= 1)
      {
        unsigned int v46 = 1;
      }
      else
      {
        unsigned int v44 = __clz(__rbit32((unsigned __int16)v71)) << 16;
        if (((unsigned __int16)(v71 - 1) & (unsigned __int16)v71) != 0) {
          int v45 = -65536;
        }
        else {
          int v45 = v44;
        }
        unsigned int v46 = v45 & 0xFFFF0000 | (unsigned __int16)v71;
      }
      v72[6] = v46;
      unint64_t v47 = [v65 forwardKernel];
      unint64_t v48 = [v47 maxTotalThreadsPerThreadgroup];

      switch(v72[5])
      {
        case 1:
          unint64_t v49 = (int)v71;
          goto LABEL_25;
        case 2:
          unint64_t v49 = SDWORD1(v71) * (uint64_t)(int)v71;
          goto LABEL_25;
        case 3:
          unint64_t v49 = SDWORD1(v71) * (uint64_t)(int)v71;
          uint64_t v51 = SDWORD2(v71);
          uint64_t v50 = 1;
          goto LABEL_28;
        case 4:
          unint64_t v49 = SDWORD1(v71) * (uint64_t)(int)v71;
          uint64_t v51 = SDWORD2(v71);
          uint64_t v50 = SHIDWORD(v71);
          goto LABEL_28;
        default:
          unint64_t v49 = 1;
LABEL_25:
          uint64_t v50 = 1;
          uint64_t v51 = 1;
LABEL_28:
          unint64_t v52 = v48 >> 6;
          if (v49 < v48 >> 6) {
            unint64_t v52 = v49;
          }
          if (v52 <= 1) {
            unint64_t v53 = 1;
          }
          else {
            unint64_t v53 = v52;
          }
          unint64_t v54 = [v66 computeCommandEncoderWithDispatchType:0];
          if ([v65 metalKernelType] == 13) {
            [v65 gradientKernel];
          }
          else {
          unint64_t v55 = [v65 forwardKernel];
          }
          [v54 setComputePipelineState:v55];

          int v56 = [v62 objectAtIndexedSubscript:v13];
          [v54 setBuffer:v56 offset:0 atIndex:0];

          unint64_t v57 = [v63 objectAtIndexedSubscript:v13];
          [v54 setBuffer:v57 offset:0 atIndex:1];

          unint64_t v58 = [v61 objectAtIndexedSubscript:v13];
          [v54 setBuffer:v58 offset:0 atIndex:2];

          [v54 setBytes:v70 length:76 atIndex:3];
          v69[0] = (unint64_t)(v50 + 7) >> 3;
          v69[1] = (unint64_t)(v51 + 7) >> 3;
          v69[2] = (v49 + v53 - 1) / v53;
          int64x2_t v67 = v59;
          unint64_t v68 = v53;
          [v54 dispatchThreadgroups:v69 threadsPerThreadgroup:&v67];
          [v54 endEncoding];

          ++v13;
          self = v60;
          if (v13 >= [(MLCDeviceGPU *)v60 numDevicesToUse]) {
            break;
          }
          continue;
      }
      break;
    }
  }
}

- (void)dispatchForwardEmbeddingLayer:(id)a3 weight:(id)a4 sourceTensor:(id)a5 resultTensor:(id)a6
{
  id v60 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int64x2_t v59 = v11;
  unint64_t v13 = [v11 deviceMemory];
  [(MLCDeviceGPU *)self allocateResultTensor:v12];
  unint64_t v54 = v12;
  unint64_t v58 = [v12 deviceMemory];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v14 = 0;
    int64x2_t v55 = vdupq_n_s64(1uLL);
    int v56 = v13;
    unint64_t v57 = self;
    do
    {
      uint64_t v15 = [v60 objectAtIndexedSubscript:v14];
      uint64_t v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      unint64_t v62 = [v16 objectAtIndexedSubscript:v14];

      uint64_t v73 = 0;
      long long v71 = 0u;
      long long v72 = 0u;
      uint64_t v17 = [v15 embeddingParams];

      if (v17)
      {
        uint64_t v18 = [v15 embeddingParams];
        int v19 = [v18 objectAtIndexedSubscript:0];
        [v19 floatValue];
        LODWORD(v72) = v20;

        uint64_t v21 = [v15 embeddingParams];
        uint64_t v22 = [v21 objectAtIndexedSubscript:1];
        [v22 floatValue];
        DWORD1(v72) = v23;

        float v24 = *((float *)&v72 + 1);
      }
      else
      {
        *(void *)&long long v72 = 0;
        float v24 = 0.0;
      }
      *((float *)&v72 + 2) = 1.0 / v24;
      unint64_t v25 = [v10 descriptor];
      int v26 = [v25 shape];
      unint64_t v27 = [v10 descriptor];
      unint64_t v28 = objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v27, "dimensionCount") - 1);
      id v29 = v10;
      unsigned int v30 = [v28 unsignedIntegerValue];

      long long v31 = [v59 descriptor];
      unint64_t v32 = [v31 tensorAllocationSizeInBytes];
      int v33 = [v59 descriptor];
      unint64_t v34 = v32
          / +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", [v33 dataType]);

      *(void *)&long long v71 = __PAIR64__(v34, v30);
      id v10 = v29;
      unint64_t context = (void *)MEMORY[0x1E01B11E0]();
      [v15 batchSize];
      uint64_t v35 = [v62 computeCommandEncoderWithDispatchType:0];
      unint64_t v13 = v56;
      self = v57;
      if (v17)
      {
        int v36 = [(MLCDeviceGPU *)v57 gpuPipelineStatesEmbeddingRenormalizeWeights];
        uint64_t v37 = [v36 objectAtIndexedSubscript:v14];
        uint64_t v38 = [v37 maxTotalThreadsPerThreadgroup];

        unint64_t v39 = [(MLCDeviceGPU *)v57 gpuPipelineStatesEmbeddingRenormalizeWeights];
        uint64_t v40 = [v39 objectAtIndexedSubscript:v14];
        [v35 setComputePipelineState:v40];

        uint64_t v41 = [v56 objectAtIndexedSubscript:v14];
        [v35 setBuffer:v41 offset:0 atIndex:0];

        int v42 = [v10 deviceMemory];
        int v43 = [v42 objectAtIndexedSubscript:v14];
        [v35 setBuffer:v43 offset:0 atIndex:2];

        [v35 setBytes:&v71 length:40 atIndex:3];
        [v35 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * v38) atIndex:0];
        int64x2_t v68 = vdupq_n_s64(1uLL);
        int64x2_t v69 = v68;
        uint64_t v70 = 1;
        uint64_t v67 = v38;
        [v35 dispatchThreadgroups:&v69 threadsPerThreadgroup:&v67];
      }
      unsigned int v44 = [(MLCDeviceGPU *)v57 gpuPipelineStatesEmbeddingForward];
      int v45 = [v44 objectAtIndexedSubscript:v14];
      uint64_t v46 = [v45 maxTotalThreadsPerThreadgroup];

      unint64_t v47 = [(MLCDeviceGPU *)v57 gpuPipelineStatesEmbeddingForward];
      unint64_t v48 = [v47 objectAtIndexedSubscript:v14];
      [v35 setComputePipelineState:v48];

      unint64_t v49 = [v56 objectAtIndexedSubscript:v14];
      [v35 setBuffer:v49 offset:0 atIndex:0];

      uint64_t v50 = [v58 objectAtIndexedSubscript:v14];
      [v35 setBuffer:v50 offset:0 atIndex:1];

      uint64_t v51 = [v10 deviceMemory];
      unint64_t v52 = [v51 objectAtIndexedSubscript:v14];
      [v35 setBuffer:v52 offset:0 atIndex:2];

      [v35 setBytes:&v71 length:40 atIndex:3];
      unint64_t v65 = v34;
      int64x2_t v66 = v55;
      uint64_t v63 = v46;
      int64x2_t v64 = v55;
      [v35 dispatchThreadgroups:&v65 threadsPerThreadgroup:&v63];
      [v35 endEncoding];

      unint64_t v53 = [v56 objectAtIndexedSubscript:v14];
      [v15 setSource:v53];

      ++v14;
    }
    while (v14 < [(MLCDeviceGPU *)v57 numDevicesToUse]);
  }
}

- (void)dispatchGradientEmbeddingLayer:(id)a3 sourceGradientTensor:(id)a4
{
  id v32 = a3;
  id v31 = a4;
  unsigned int v30 = [v31 deviceMemory];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v6 = 0;
    int64x2_t v29 = vdupq_n_s64(1uLL);
    do
    {
      uint64_t v7 = objc_msgSend(v32, "objectAtIndexedSubscript:", v6, *(_OWORD *)&v29);
      uint64_t v8 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      id v9 = [v8 objectAtIndexedSubscript:v6];

      uint64_t v39 = 0;
      memset(v38, 0, sizeof(v38));
      id v10 = [v31 descriptor];
      id v11 = [v10 shape];
      id v12 = [v31 descriptor];
      unint64_t v13 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v12, "dimensionCount") - 1);
      int v14 = [v13 unsignedIntegerValue];

      uint64_t v15 = [v7 source];
      uint64_t v16 = [v7 gradientForWeights];
      LODWORD(v38[0]) = v14;
      DWORD1(v38[0]) = (unint64_t)[v15 length] >> 3;
      DWORD2(v38[0]) = (unint64_t)[v16 length] >> 2;
      uint64_t v17 = [v7 paddingIndex];
      HIDWORD(v38[0]) = v17 != 0;

      if (HIDWORD(v38[0]))
      {
        uint64_t v18 = [v7 paddingIndex];
        uint64_t v39 = [v18 longLongValue];
      }
      unint64_t context = (void *)MEMORY[0x1E01B11E0]();
      int v19 = [(MLCDeviceGPU *)self gpuPipelineStatesEmbeddingGradient];
      int v20 = [v19 objectAtIndexedSubscript:v6];
      uint64_t v21 = [v20 maxTotalThreadsPerThreadgroup];

      uint64_t v22 = [v9 computeCommandEncoderWithDispatchType:0];
      int v23 = [(MLCDeviceGPU *)self gpuPipelineStatesEmbeddingGradient];
      [v23 objectAtIndexedSubscript:v6];
      float v24 = self;
      v26 = unint64_t v25 = v9;
      [v22 setComputePipelineState:v26];

      unint64_t v27 = [v7 source];
      [v22 setBuffer:v27 offset:0 atIndex:0];

      unint64_t v28 = [v30 objectAtIndexedSubscript:v6];
      [v22 setBuffer:v28 offset:0 atIndex:1];

      [v22 setBuffer:v16 offset:0 atIndex:2];
      [v22 setBytes:v38 length:40 atIndex:3];
      int64x2_t v35 = v29;
      int64x2_t v36 = v29;
      uint64_t v37 = 1;
      uint64_t v34 = v21;
      [v22 dispatchThreadgroups:&v36 threadsPerThreadgroup:&v34];
      [v22 endEncoding];

      self = v24;

      ++v6;
    }
    while (v6 < [(MLCDeviceGPU *)v24 numDevicesToUse]);
  }
}

- (void)dispatchForwardReshapeLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
}

- (void)dispatchForwardSliceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v62 = [v9 deviceMemory];
  [(MLCDeviceGPU *)self allocateResultTensor:v10];
  char v61 = [v10 deviceMemory];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v11 = 0;
    int64x2_t v59 = &v73;
    id v60 = self;
    do
    {
      id v12 = objc_msgSend(v63, "objectAtIndexedSubscript:", v11, v59);
      unint64_t v13 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      uint64_t v66 = v11;
      unint64_t v65 = [v13 objectAtIndexedSubscript:v11];

      unint64_t context = (void *)MEMORY[0x1E01B11E0]();
      uint64_t v75 = 0;
      long long v73 = 0u;
      memset(v74, 0, sizeof(v74));
      memset(v72, 0, sizeof(v72));
      int v14 = [v10 descriptor];
      uint64_t v15 = [v14 shape];
      uint64_t v67 = [v15 count];

      uint64_t v16 = [v10 descriptor];
      uint64_t v17 = [v16 shape];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        unint64_t v19 = 0;
        int v20 = (_DWORD *)v74 - v67;
        do
        {
          uint64_t v21 = [v12 stride];
          uint64_t v22 = [v21 objectAtIndexedSubscript:v19];
          *(v20 - 12) = [v22 unsignedIntegerValue];

          int v23 = [v12 begin];
          float v24 = [v23 objectAtIndexedSubscript:v19];
          *(v20 - 8) = [v24 unsignedIntegerValue];

          unint64_t v25 = [v9 descriptor];
          int v26 = [v25 shape];
          unint64_t v27 = [v26 objectAtIndexedSubscript:v19];
          *(v20 - 4) = [v27 unsignedIntegerValue];

          unint64_t v28 = [v9 descriptor];
          int64x2_t v29 = [v28 stride];
          unsigned int v30 = [v29 objectAtIndexedSubscript:v19];
          _DWORD *v20 = (unint64_t)[v30 unsignedIntegerValue] >> 2;

          v20[4] = 0;
          id v31 = [v10 descriptor];
          id v32 = [v31 shape];
          int v33 = [v32 objectAtIndexedSubscript:v19];
          v20[8] = [v33 unsignedIntegerValue];

          uint64_t v34 = [v10 descriptor];
          int64x2_t v35 = [v34 stride];
          int64x2_t v36 = [v35 objectAtIndexedSubscript:v19];
          v20[12] = (unint64_t)[v36 unsignedIntegerValue] >> 2;

          ++v19;
          uint64_t v37 = [v10 descriptor];
          uint64_t v38 = [v37 shape];
          unint64_t v39 = [v38 count];

          ++v20;
        }
        while (v19 < v39);
      }
      if (v67 != 4)
      {
        uint64_t v40 = 4 - v67;
        if (v67 == 3 || v67 == 4) {
          uint64_t v40 = 1;
        }
        uint64_t v41 = v59;
        do
        {
          *((_DWORD *)v41 - 12) = 0;
          *((_DWORD *)v41 - 8) = 0;
          *((_DWORD *)v41 - 4) = 1;
          *(_DWORD *)uint64_t v41 = 0;
          *((_DWORD *)v41 + 4) = 0;
          *((_DWORD *)v41 + 8) = 1;
          *((_DWORD *)v41 + 12) = 0;
          uint64_t v41 = (long long *)((char *)v41 + 4);
          --v40;
        }
        while (v40);
      }
      LODWORD(v75) = 0;
      int v42 = [v12 forwardKernel];
      unint64_t v43 = [v42 maxTotalThreadsPerThreadgroup];

      uint64_t v44 = 0;
      long long v78 = xmmword_1DD1F0C50;
      int8x16_t v79 = (int8x16_t)xmmword_1DD1F0C60;
      long long v76 = xmmword_1DD1F0C50;
      int8x16_t v77 = (int8x16_t)xmmword_1DD1F0C60;
      do
      {
        unint64_t v45 = *((int *)&v74[1] + v44 + 3);
        if (v43 >= v45)
        {
          v79.i64[v44 + 1] = v45;
          unint64_t v47 = v45;
        }
        else
        {
          uint64_t v46 = (char *)&v78 + 8 * v44;
          if (v45 % v43)
          {
            *((void *)v46 + 3) = 1;
            unint64_t v47 = 1;
          }
          else
          {
            *((void *)v46 + 3) = v43;
            unint64_t v47 = v43;
          }
        }
        v77.i64[v44 + 1] = (v45 + v47 - 1) / v47;
        unint64_t v48 = v44 + 3;
        --v44;
        v43 /= v47;
      }
      while (v48 > 1);
      unint64_t v49 = [v10 descriptor];
      uint64_t v50 = [v49 shape];
      uint64_t v51 = [v50 count];

      if (v51 == 4)
      {
        unsigned int v52 = __clz(__rbit32(LOWORD(v74[1]))) << 16;
        if (((unsigned __int16)(LOWORD(v74[1]) - 1) & v74[1]) != 0) {
          int v53 = -65536;
        }
        else {
          int v53 = v52;
        }
        HIDWORD(v75) = v53 & 0xFFFF0000 | LOWORD(v74[1]);
        uint64_t v54 = *((void *)&v76 + 1) * SLODWORD(v74[1]);
      }
      else
      {
        HIDWORD(v75) = 1;
        uint64_t v54 = *((void *)&v76 + 1);
      }
      int64x2_t v55 = [v65 computeCommandEncoderWithDispatchType:0];
      int v56 = [v12 forwardKernel];
      [v55 setComputePipelineState:v56];

      unint64_t v57 = [v62 objectAtIndexedSubscript:v66];
      [v55 setBuffer:v57 offset:0 atIndex:0];

      unint64_t v58 = [v61 objectAtIndexedSubscript:v66];
      [v55 setBuffer:v58 offset:0 atIndex:1];

      [v55 setBytes:v72 length:120 atIndex:2];
      int8x16_t v70 = vextq_s8(v77, v77, 8uLL);
      uint64_t v71 = v54;
      int8x16_t v68 = vextq_s8(v79, v79, 8uLL);
      uint64_t v69 = *((void *)&v78 + 1);
      [v55 dispatchThreadgroups:&v70 threadsPerThreadgroup:&v68];
      [v55 endEncoding];

      uint64_t v11 = v66 + 1;
      self = v60;
    }
    while (v66 + 1 < [(MLCDeviceGPU *)v60 numDevicesToUse]);
  }
}

- (void)dispatchForwardMPSGraphWithDeviceOps:(id)a3 sourceBuffer:(id)a4 resultBuffer:(id)a5 deviceIndex:(unint64_t)a6 dataType:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  v56[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v45 = a5;
  id v11 = a4;
  int v12 = [v10 hasBias];
  unint64_t v13 = [v10 mpsGraphTensors];
  int v14 = v13;
  if (v12) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  uint64_t v16 = [v13 objectAtIndexedSubscript:v15];

  id v17 = objc_alloc(MEMORY[0x1E4F35A90]);
  unint64_t v48 = v16;
  uint64_t v18 = [v16 shape];
  uint64_t v50 = (void *)[v17 initWithMTLBuffer:v11 shape:v18 dataType:v7];

  unint64_t v19 = [v10 mpsGraphTensors];
  int v20 = [v19 objectAtIndexedSubscript:0];

  id v21 = objc_alloc(MEMORY[0x1E4F35A90]);
  uint64_t v22 = [v10 exportableState];
  int v23 = [v22 objectAtIndexedSubscript:0];
  float v24 = [v20 shape];
  unint64_t v49 = (void *)[v21 initWithMTLBuffer:v23 shape:v24 dataType:v7];

  if ([v10 hasBias])
  {
    unint64_t v25 = [v10 mpsGraphTensors];
    int v26 = [v25 objectAtIndexedSubscript:1];

    id v27 = objc_alloc(MEMORY[0x1E4F35A90]);
    unint64_t v28 = [v10 exportableState];
    int64x2_t v29 = [v28 objectAtIndexedSubscript:1];
    unsigned int v30 = [v26 shape];
    unsigned int v44 = v7;
    id v31 = (void *)[v27 initWithMTLBuffer:v29 shape:v30 dataType:v7];

    v55[0] = v48;
    v55[1] = v20;
    v56[0] = v50;
    v56[1] = v49;
    v55[2] = v26;
    _DWORD v56[2] = v31;
    id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:3];

    uint64_t v7 = v44;
  }
  else
  {
    v53[0] = v48;
    v53[1] = v20;
    v54[0] = v50;
    v54[1] = v49;
    id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
  }
  int v33 = [v10 mpsGraphTensors];
  uint64_t v34 = v33;
  if (v12) {
    uint64_t v35 = 3;
  }
  else {
    uint64_t v35 = 2;
  }
  int64x2_t v36 = [v33 objectAtIndexedSubscript:v35];

  id v37 = objc_alloc(MEMORY[0x1E4F35A90]);
  uint64_t v38 = [v36 shape];
  unint64_t v39 = (void *)[v37 initWithMTLBuffer:v45 shape:v38 dataType:v7];

  uint64_t v40 = [v10 forwardMPSGraph];
  uint64_t v41 = [(MLCDeviceGPU *)self gpuMPSCommandBufferList];
  int v42 = [v41 objectAtIndexedSubscript:a6];
  uint64_t v51 = v36;
  unsigned int v52 = v39;
  unint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  [v40 encodeToCommandBuffer:v42 feeds:v32 targetOperations:0 resultsDictionary:v43 executionDescriptor:0];
}

- (void)dispatchGradientMPSGraphWithDeviceOps:(id)a3 sourceBuffer:(id)a4 souceGradientBuffer:(id)a5 resultGradientBuffer:(id)a6 deviceIndex:(unint64_t)a7 dataType:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  v101[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  int v16 = [v12 hasBias];
  id v17 = [v12 mpsGraphTensors];
  uint64_t v18 = v17;
  int v83 = v16;
  if (v16) {
    uint64_t v19 = 4;
  }
  else {
    uint64_t v19 = 3;
  }
  if (v16) {
    uint64_t v20 = 5;
  }
  else {
    uint64_t v20 = 4;
  }
  if (v16) {
    uint64_t v21 = 6;
  }
  else {
    uint64_t v21 = 5;
  }
  uint64_t v22 = 6;
  if (v16) {
    uint64_t v22 = 7;
  }
  uint64_t v88 = v22;
  int v23 = [v17 objectAtIndexedSubscript:v19];

  id v24 = objc_alloc(MEMORY[0x1E4F35A90]);
  unint64_t v94 = v23;
  unint64_t v25 = [v23 shape];
  uint64_t v93 = (void *)[v24 initWithMTLBuffer:v14 shape:v25 dataType:v8];

  int v26 = [v12 mpsGraphTensors];
  id v27 = [v26 objectAtIndexedSubscript:v20];

  id v28 = objc_alloc(MEMORY[0x1E4F35A90]);
  int64x2_t v29 = [v12 exportableState];
  unsigned int v30 = [v29 objectAtIndexedSubscript:0];
  int v87 = v27;
  id v31 = [v27 shape];
  unsigned int v86 = (void *)[v28 initWithMTLBuffer:v30 shape:v31 dataType:v8];

  id v32 = [v12 mpsGraphTensors];
  int v33 = [v32 objectAtIndexedSubscript:v21];

  id v34 = objc_alloc(MEMORY[0x1E4F35A90]);
  uint64_t v35 = [v33 shape];
  uint64_t v36 = [v34 initWithMTLBuffer:v13 shape:v35 dataType:v8];

  id v37 = [v12 mpsGraphTensors];
  uint64_t v38 = [v37 objectAtIndexedSubscript:v88];

  id v39 = objc_alloc(MEMORY[0x1E4F35A90]);
  int v85 = v38;
  uint64_t v40 = [v38 shape];
  int v84 = (void *)[v39 initWithMTLBuffer:v15 shape:v40 dataType:v8];

  uint64_t v41 = [v12 gradientState];
  uint64_t v42 = [v41 count];

  if (v42)
  {
    unint64_t v43 = [v12 gradientState];
    uint64_t v44 = [v43 objectAtIndexedSubscript:0];

    unint64_t v45 = a7;
  }
  else
  {
    uint64_t v46 = [(MLCDeviceGPU *)self deviceList];
    unint64_t v45 = a7;
    unint64_t v47 = [v46 objectAtIndexedSubscript:a7];

    unint64_t v48 = [v12 exportableState];
    unint64_t v49 = [v48 objectAtIndexedSubscript:0];
    uint64_t v44 = objc_msgSend(v47, "newBufferWithLength:options:", objc_msgSend(v49, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

    v101[0] = v44;
    uint64_t v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:1];
    uint64_t v51 = (void *)[v50 mutableCopy];
    [v12 setGradientState:v51];
  }
  unsigned int v52 = [v12 mpsGraphTensors];
  int v53 = v52;
  if (v83) {
    uint64_t v54 = 8;
  }
  else {
    uint64_t v54 = 7;
  }
  int64x2_t v55 = [v52 objectAtIndexedSubscript:v54];

  id v56 = objc_alloc(MEMORY[0x1E4F35A90]);
  unint64_t v57 = [v55 shape];
  int v82 = (void *)v44;
  uint64_t v58 = [v56 initWithMTLBuffer:v44 shape:v57 dataType:v8];

  uint64_t v89 = (void *)v58;
  unint64_t v91 = v55;
  if ([v12 hasBias])
  {
    unint64_t v59 = v45;
    id v60 = objc_msgSend(v12, "mpsGraphTensors", v33, v36);
    char v61 = v60;
    if (v83) {
      uint64_t v62 = 9;
    }
    else {
      uint64_t v62 = 8;
    }
    id v63 = [v60 objectAtIndexedSubscript:v62];

    uint64_t v64 = [v12 biasChannelCount];
    unint64_t v65 = [v12 gradientState];
    unint64_t v66 = [v65 count];

    if (v66 < 2)
    {
      uint64_t v71 = [(MLCDeviceGPU *)self deviceList];
      uint64_t v67 = [v71 objectAtIndexedSubscript:v59];

      int8x16_t v68 = objc_msgSend(v67, "newBufferWithLength:options:", 4 * v64, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
      long long v72 = [v12 gradientState];
      [v72 setObject:v68 atIndexedSubscript:1];
    }
    else
    {
      uint64_t v67 = [v12 gradientState];
      int8x16_t v68 = [v67 objectAtIndexedSubscript:1];
    }
    uint64_t v69 = v12;

    id v73 = objc_alloc(MEMORY[0x1E4F35A90]);
    unsigned int v74 = [v63 shape];
    uint64_t v75 = (void *)[v73 initWithMTLBuffer:v68 shape:v74 dataType:v8];

    v99[0] = v33;
    v99[1] = v91;
    v100[0] = v36;
    v100[1] = v89;
    v99[2] = v63;
    v100[2] = v75;
    int8x16_t v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:3];

    unint64_t v45 = v59;
  }
  else
  {
    uint64_t v69 = v12;
    v97[0] = v33;
    v97[1] = v55;
    v98[0] = v36;
    v98[1] = v58;
    int8x16_t v70 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v98, v97, 2, v33, v36);
  }
  v95[0] = v94;
  v95[1] = v87;
  v96[0] = v93;
  v96[1] = v86;
  v95[2] = v85;
  _DWORD v96[2] = v84;
  long long v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:3];
  int8x16_t v77 = [v69 gradientMPSGraph];
  long long v78 = [(MLCDeviceGPU *)self gpuMPSCommandBufferList];
  int8x16_t v79 = [v78 objectAtIndexedSubscript:v45];
  [v77 encodeToCommandBuffer:v79 feeds:v76 targetOperations:0 resultsDictionary:v70 executionDescriptor:0];
}

- (void)dispatchForwardFullyConnectedLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  BOOL v95 = a6;
  id v100 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v99 = [v9 deviceMemory];
  [(MLCDeviceGPU *)self allocateResultTensor:v10];
  uint64_t v111 = v10;
  unint64_t v96 = [v10 deviceMemory];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v11 = 0;
    uint64_t v110 = 1;
    uint64_t v105 = self;
    unint64_t v97 = v9;
    do
    {
      long long v104 = (void *)MEMORY[0x1E01B11E0]();
      id v12 = [v100 objectAtIndexedSubscript:v11];
      id v13 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      uint64_t v109 = [v13 objectAtIndexedSubscript:v11];

      id v14 = [v9 descriptor];
      id v15 = [v14 shape];
      unint64_t v16 = [v15 count];

      id v17 = [v9 descriptor];
      uint64_t v18 = [v17 shape];
      uint64_t v19 = [v18 objectAtIndexedSubscript:v16 - 1];
      uint64_t v20 = [v19 unsignedIntegerValue];

      uint64_t v21 = [v111 descriptor];
      uint64_t v22 = [v21 shape];
      int v23 = [v22 objectAtIndexedSubscript:v16 - 1];
      uint64_t v24 = [v23 unsignedIntegerValue];

      uint64_t v25 = [v12 batchSize];
      if (v16 < 3)
      {
        int v98 = 0;
      }
      else
      {
        int v26 = [v9 descriptor];
        id v27 = [v26 shape];
        id v28 = [v27 objectAtIndexedSubscript:1];
        v25 *= [v28 unsignedIntegerValue];

        if (v16 == 3) {
          goto LABEL_9;
        }
        int64x2_t v29 = [v9 descriptor];
        unsigned int v30 = [v29 shape];
        id v31 = [v30 objectAtIndexedSubscript:2];
        v25 *= [v31 unsignedIntegerValue];

        if (v16 != 4)
        {
LABEL_9:
          int v98 = 0;
        }
        else
        {
          id v112 = [v9 descriptor];
          unint64_t v107 = [v112 shape];
          id v32 = [v107 objectAtIndexedSubscript:2];
          uint64_t v33 = [v32 unsignedIntegerValue];
          id v34 = [v9 descriptor];
          uint64_t v35 = [v34 shape];
          uint64_t v36 = [v35 objectAtIndexedSubscript:3];
          uint64_t v37 = [v36 unsignedIntegerValue] * v33;

          if (v37 == 1)
          {
            uint64_t v25 = [v12 batchSize];
            id v9 = v97;
            uint64_t v38 = [v97 descriptor];
            id v39 = [v38 shape];
            int v98 = 1;
            uint64_t v40 = [v39 objectAtIndexedSubscript:1];
            uint64_t v20 = [v40 unsignedIntegerValue];

            uint64_t v41 = [v111 descriptor];
            uint64_t v42 = [v41 shape];
            unint64_t v43 = [v42 objectAtIndexedSubscript:1];
            uint64_t v24 = [v43 unsignedIntegerValue];
          }
          else
          {
            int v98 = 0;
            id v9 = v97;
          }
        }
        self = v105;
      }
      if ([v12 totalElementsPerChannel] != v25)
      {
        uint64_t v44 = [(MLCDeviceGPU *)self deviceList];
        unint64_t v45 = [v44 objectAtIndexedSubscript:v11];

        uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F35660]) initWithDevice:v45 transposeLeft:0 transposeRight:1 resultRows:v25 resultColumns:v24 interiorColumns:v20 alpha:1.0 beta:0.0];
        unint64_t v47 = [v12 forwardStatisticsKernel];
        [v47 setObject:v46 atIndexedSubscript:0];

        unint64_t v48 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        [v12 setGradientStatisticsKernel:v48];

        [v12 setTotalElementsPerChannel:v25];
      }
      unint64_t v49 = (void *)MEMORY[0x1E4F35640];
      uint64_t v50 = [v9 descriptor];
      uint64_t v51 = [v50 elementByteCount] * v20;
      unsigned int v52 = [v9 descriptor];
      uint64_t v53 = objc_msgSend(v49, "matrixDescriptorWithRows:columns:rowBytes:dataType:", v25, v20, v51, GPU_GetDataType(objc_msgSend(v52, "dataType")));

      id v54 = objc_alloc(MEMORY[0x1E4F35618]);
      int64x2_t v55 = [v99 objectAtIndexedSubscript:v11];
      id v103 = (void *)v53;
      uint64_t v108 = [v54 initWithBuffer:v55 descriptor:v53];

      id v56 = (void *)MEMORY[0x1E4F35640];
      unint64_t v57 = [v111 descriptor];
      uint64_t v58 = [v57 elementByteCount] * v24;
      unint64_t v59 = [v111 descriptor];
      uint64_t v60 = objc_msgSend(v56, "matrixDescriptorWithRows:columns:rowBytes:dataType:", v25, v24, v58, GPU_GetDataType(objc_msgSend(v59, "dataType")));

      id v61 = objc_alloc(MEMORY[0x1E4F35618]);
      uint64_t v106 = v11;
      uint64_t v62 = [v96 objectAtIndexedSubscript:v11];
      int v102 = (void *)v60;
      uint64_t v63 = [v61 initWithBuffer:v62 descriptor:v60];

      uint64_t v64 = [v12 weightsDataType];
      uint64_t v65 = v24;
      unint64_t v66 = objc_msgSend(MEMORY[0x1E4F35640], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v24, v20, +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", v64) * v20, GPU_GetDataType(v64));
      uint64_t v67 = (void *)v108;
      id v68 = objc_alloc(MEMORY[0x1E4F35618]);
      uint64_t v69 = [v12 exportableState];
      int8x16_t v70 = [v69 objectAtIndexedSubscript:0];
      uint64_t v71 = (void *)[v68 initWithBuffer:v70 descriptor:v66];

      long long v72 = [v12 forwardStatisticsKernel];
      id v73 = [v72 objectAtIndexedSubscript:0];

      unsigned int v74 = (void *)v109;
      unint64_t v101 = (void *)v63;
      [v73 encodeToCommandBuffer:v109 leftMatrix:v108 rightMatrix:v71 resultMatrix:v63];
      uint64_t v75 = [v12 exportableState];
      unint64_t v76 = [v75 count];

      if (v76 >= 2)
      {
        unint64_t v94 = v66;
        uint64_t v77 = MEMORY[0x1E01B11E0]();
        long long v78 = [v111 descriptor];
        int8x16_t v79 = [v78 shape];
        [v12 setSource0Shape:v79];

        uint64_t v80 = (void *)[&unk_1F3876DC8 mutableCopy];
        int64x2_t v81 = [NSNumber numberWithUnsignedInteger:v65];
        if (v98)
        {
          objc_msgSend(v80, "setObject:atIndexedSubscript:", v81, 1, v77);
        }
        else
        {
          int v82 = objc_msgSend(v111, "descriptor", v77);
          int v83 = [v82 shape];
          objc_msgSend(v80, "setObject:atIndexedSubscript:", v81, objc_msgSend(v83, "count") - 1);
        }
        int v84 = (void *)[v80 copy];
        [v12 setSource1Shape:v84];

        int v85 = [v12 source1Shape];
        unsigned int v86 = +[MLCTensor tensorWithShape:v85];

        uint64_t v87 = v110;
        do
        {
          uint64_t v88 = [v86 deviceMemory];
          uint64_t v89 = [v12 exportableState];
          unint64_t v90 = [v89 objectAtIndexedSubscript:1];
          [v88 addObject:v90];

          --v87;
        }
        while (v87);
        [(MLCDeviceGPU *)v105 dispatchForwardArithmeticBinaryKernel:v100 sourceTensor:v111 sourceSecondaryTensor:v86 resultTensor:v111 deviceIndex:v106];

        uint64_t v67 = (void *)v108;
        unsigned int v74 = (void *)v109;
        unint64_t v66 = v94;
      }
      if (v95)
      {
        [v99 objectAtIndexedSubscript:v106];
        v92 = unint64_t v91 = v66;
        [v12 setSource:v92];

        unint64_t v66 = v91;
      }

      uint64_t v11 = v106 + 1;
      self = v105;
      ++v110;
      id v9 = v97;
    }
    while (v106 + 1 < [(MLCDeviceGPU *)v105 numDevicesToUse]);
  }
}

- (void)dispatchGradientFullyConnectedLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 resultStateIsTemporary:(BOOL)a6
{
  BOOL v112 = a6;
  v129[2] = *MEMORY[0x1E4F143B8];
  id v109 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = v9;
  id v12 = a5;
  int64x2_t v113 = [v11 deviceMemory];
  [(MLCDeviceGPU *)self allocateResultTensor:v12];
  unint64_t v124 = v12;
  uint64_t v108 = [v12 deviceMemory];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v13 = 0;
    uint64_t v110 = v11;
    int64x2_t v123 = self;
    do
    {
      unint64_t context = (void *)MEMORY[0x1E01B11E0]();
      id v14 = [v109 objectAtIndexedSubscript:v13];
      id v15 = [(MLCDeviceGPU *)v10 gpuCommandBufferList];
      uint64_t v122 = [v15 objectAtIndexedSubscript:v13];

      unint64_t v16 = [v11 descriptor];
      id v17 = [v16 shape];
      unint64_t v18 = [v17 count];

      uint64_t v19 = [v11 descriptor];
      uint64_t v20 = [v19 shape];
      uint64_t v21 = [v20 objectAtIndexedSubscript:v18 - 1];
      uint64_t v127 = [v21 unsignedIntegerValue];

      uint64_t v22 = [v124 descriptor];
      int v23 = [v22 shape];
      uint64_t v24 = [v23 objectAtIndexedSubscript:v18 - 1];
      uint64_t v120 = [v24 unsignedIntegerValue];

      uint64_t v25 = [v14 batchSize];
      if (v18 < 3) {
        goto LABEL_9;
      }
      int v26 = [v11 descriptor];
      id v27 = [v26 shape];
      id v28 = [v27 objectAtIndexedSubscript:1];
      v25 *= [v28 unsignedIntegerValue];

      if (v18 == 3) {
        goto LABEL_9;
      }
      int64x2_t v29 = [v11 descriptor];
      unsigned int v30 = [v29 shape];
      id v31 = [v30 objectAtIndexedSubscript:2];
      v25 *= [v31 unsignedIntegerValue];

      if (v18 != 4)
      {
LABEL_9:
        uint64_t v40 = v123;
      }
      else
      {
        int64x2_t v125 = [v11 descriptor];
        unint64_t v117 = [v125 shape];
        id v32 = [v117 objectAtIndexedSubscript:2];
        uint64_t v33 = [v32 unsignedIntegerValue];
        id v34 = [v11 descriptor];
        uint64_t v35 = [v34 shape];
        uint64_t v36 = [v35 objectAtIndexedSubscript:3];
        uint64_t v37 = v25;
        uint64_t v38 = [v36 unsignedIntegerValue] * v33;

        id v11 = v110;
        BOOL v39 = v38 == 1;
        uint64_t v25 = v37;
        uint64_t v40 = v123;
        if (v39)
        {
          uint64_t v25 = [v14 batchSize];
          uint64_t v41 = [v110 descriptor];
          uint64_t v42 = [v41 shape];
          unint64_t v43 = [v42 objectAtIndexedSubscript:1];
          uint64_t v127 = [v43 unsignedIntegerValue];

          uint64_t v44 = [v124 descriptor];
          unint64_t v45 = [v44 shape];
          uint64_t v46 = [v45 objectAtIndexedSubscript:1];
          uint64_t v120 = [v46 unsignedIntegerValue];
        }
      }
      unint64_t v47 = [v14 gradientStatisticsKernel];
      uint64_t v48 = [v47 count];

      if (!v48)
      {
        unint64_t v49 = [(MLCDeviceGPU *)v40 deviceList];
        uint64_t v50 = [v49 objectAtIndexedSubscript:v13];

        uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F35660]) initWithDevice:v50 transposeLeft:0 transposeRight:0 resultRows:v25 resultColumns:v120 interiorColumns:v127 alpha:1.0 beta:0.0];
        unsigned int v52 = [v14 gradientStatisticsKernel];
        [v52 setObject:v51 atIndexedSubscript:0];

        uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F35660]) initWithDevice:v50 transposeLeft:1 transposeRight:0 resultRows:v127 resultColumns:v120 interiorColumns:v25 alpha:1.0 beta:0.0];
        id v54 = [v14 gradientStatisticsKernel];
        [v54 setObject:v53 atIndexedSubscript:1];
      }
      int64x2_t v55 = (void *)MEMORY[0x1E4F35640];
      id v56 = [v11 descriptor];
      uint64_t v114 = 4 * v127;
      uint64_t v57 = objc_msgSend(v55, "matrixDescriptorWithRows:columns:rowBytes:dataType:", v25, v127, 4 * v127, GPU_GetDataType(objc_msgSend(v56, "dataType")));

      id v58 = objc_alloc(MEMORY[0x1E4F35618]);
      unint64_t v59 = [v113 objectAtIndexedSubscript:v13];
      uint64_t v118 = (void *)v57;
      uint64_t v60 = (void *)[v58 initWithBuffer:v59 descriptor:v57];

      id v61 = (void *)MEMORY[0x1E4F35640];
      uint64_t v62 = [v124 descriptor];
      uint64_t v111 = v25;
      uint64_t v63 = objc_msgSend(v61, "matrixDescriptorWithRows:columns:rowBytes:dataType:", v25, v120, 4 * v120, GPU_GetDataType(objc_msgSend(v62, "dataType")));

      id v64 = objc_alloc(MEMORY[0x1E4F35618]);
      unint64_t v116 = v13;
      uint64_t v65 = [v108 objectAtIndexedSubscript:v13];
      unint64_t v126 = (void *)v63;
      uint64_t v66 = [v64 initWithBuffer:v65 descriptor:v63];

      uint64_t v67 = (void *)MEMORY[0x1E4F35640];
      id v68 = v14;
      uint64_t v69 = [v124 descriptor];
      int8x16_t v70 = objc_msgSend(v67, "matrixDescriptorWithRows:columns:rowBytes:dataType:", v127, v120, 4 * v120, GPU_GetDataType(objc_msgSend(v69, "dataType")));

      id v71 = objc_alloc(MEMORY[0x1E4F35618]);
      long long v72 = [v14 exportableState];
      id v73 = [v72 objectAtIndexedSubscript:0];
      unsigned int v74 = (void *)[v71 initWithBuffer:v73 descriptor:v70];

      uint64_t v75 = (void *)v122;
      if (([v68 computeWeightsAndBiasOnly] & 1) == 0)
      {
        unint64_t v76 = [v68 gradientStatisticsKernel];
        uint64_t v77 = [v76 objectAtIndexedSubscript:0];
        [v77 encodeToCommandBuffer:v122 leftMatrix:v60 rightMatrix:v74 resultMatrix:v66];
      }
      long long v121 = (void *)v66;
      id v78 = objc_alloc(MEMORY[0x1E4F35618]);
      int8x16_t v79 = [v68 source];
      uint64_t v80 = (void *)[v78 initWithBuffer:v79 descriptor:v126];

      uint64_t v115 = v74;
      if (v112)
      {
        int64x2_t v81 = [MEMORY[0x1E4F35980] temporaryMatrixWithCommandBuffer:v122 matrixDescriptor:v70];
        id v10 = v123;
        unint64_t v82 = v116;
      }
      else
      {
        int v83 = [v68 gradientState];
        uint64_t v84 = [v83 count];

        id v10 = v123;
        unint64_t v82 = v116;
        if (v84)
        {
          int v85 = [v68 gradientState];
          int64x2_t v81 = [v85 objectAtIndexedSubscript:0];
        }
        else
        {
          unsigned int v86 = [(MLCDeviceGPU *)v123 deviceList];
          int v85 = [v86 objectAtIndexedSubscript:v116];

          uint64_t v87 = [v74 data];
          uint64_t v88 = objc_msgSend(v85, "newBufferWithLength:options:", objc_msgSend(v87, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

          int64x2_t v81 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v88 descriptor:v70];
        }
      }
      uint64_t v89 = [v68 gradientStatisticsKernel];
      unint64_t v90 = [v89 objectAtIndexedSubscript:1];
      [v90 encodeToCommandBuffer:v122 leftMatrix:v60 rightMatrix:v80 resultMatrix:v81];

      unint64_t v91 = [v68 exportableState];
      unint64_t v92 = [v91 count];

      if (v92 < 2)
      {
        unint64_t v128 = v81;
        BOOL v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v128 count:1];
        unint64_t v96 = (void *)[v95 copy];
        [v68 setGradientState:v96];
      }
      else
      {
        uint64_t v93 = (void *)MEMORY[0x1E4F35640];
        unint64_t v94 = [v124 descriptor];
        BOOL v95 = objc_msgSend(v93, "matrixDescriptorWithRows:columns:rowBytes:dataType:", 1, v127, v114, GPU_GetDataType(objc_msgSend(v94, "dataType")));

        unint64_t v107 = v60;
        if (v112)
        {
          unint64_t v96 = [MEMORY[0x1E4F35980] temporaryMatrixWithCommandBuffer:v122 matrixDescriptor:v95];
        }
        else
        {
          unint64_t v97 = [v68 gradientState];
          unint64_t v98 = [v97 count];

          if (v98 < 2)
          {
            id v100 = [(MLCDeviceGPU *)v123 deviceList];
            unint64_t v101 = [v100 objectAtIndexedSubscript:v82];

            int v102 = objc_msgSend(v101, "newBufferWithLength:options:", v114, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
            unint64_t v96 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v102 descriptor:v95];
          }
          else
          {
            unint64_t v99 = [v68 gradientState];
            unint64_t v96 = [v99 objectAtIndexedSubscript:1];
          }
        }
        id v103 = [v113 objectAtIndexedSubscript:v82];
        long long v104 = [v96 data];
        [(MLCDeviceGPU *)v123 reduceAcrossBatchForSource:v103 result:v104 batchSize:v111 batchStride:v127 numEntries:v127 deviceIndex:v82 commandBuffer:v122];

        v129[0] = v81;
        v129[1] = v96;
        uint64_t v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:2];
        uint64_t v106 = (void *)[v105 copy];
        [v68 setGradientState:v106];

        id v10 = v123;
        uint64_t v75 = (void *)v122;
        uint64_t v60 = v107;
      }

      unint64_t v13 = v82 + 1;
      id v11 = v110;
    }
    while (v13 < [(MLCDeviceGPU *)v10 numDevicesToUse]);
  }
}

- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  uint64_t v7 = a7;
  BOOL v48 = a6;
  v62[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = self;
  id v15 = v13;
  id v58 = [v12 deviceMemory];
  [(MLCDeviceGPU *)v14 allocateResultTensor:v15];
  id v56 = v15;
  uint64_t v57 = [v15 deviceMemory];
  if ([(MLCDeviceGPU *)v14 numDevicesToUse])
  {
    unint64_t v16 = 0;
    id v55 = v11;
    unsigned int v54 = v7;
    id v49 = v12;
    uint64_t v53 = v14;
    do
    {
      id v17 = [v11 objectAtIndexedSubscript:v16];
      unint64_t v18 = [(MLCDeviceGPU *)v14 gpuCommandBufferList];
      uint64_t v19 = [v18 objectAtIndexedSubscript:v16];

      uint64_t v20 = [v17 forwardKernel];
      if ([v17 isMPSKernel])
      {
        unint64_t v59 = v19;
        if ([v17 isMPSGraph])
        {
          uint64_t v21 = v20;
          uint64_t v22 = (void *)MEMORY[0x1E01B11E0]();
          int v23 = [v58 objectAtIndexedSubscript:v16];
          uint64_t v24 = [v57 objectAtIndexedSubscript:v16];
          uint64_t v25 = [v12 descriptor];
          -[MLCDeviceGPU dispatchForwardMPSGraphWithDeviceOps:sourceBuffer:resultBuffer:deviceIndex:dataType:](v14, "dispatchForwardMPSGraphWithDeviceOps:sourceBuffer:resultBuffer:deviceIndex:dataType:", v17, v23, v24, v16, GPU_GetDataType([v25 dataType]));

          if (v7)
          {
            int v26 = [v58 objectAtIndexedSubscript:v16];
            [v17 setSource:v26];
          }
          uint64_t v19 = v59;
          uint64_t v20 = v21;
          id v11 = v55;
        }
        else
        {
          uint64_t v50 = [v17 batchSize];
          id v27 = [(MLCDeviceGPU *)v14 gpuWriteTensorKernelList];
          id v28 = [v27 objectAtIndexedSubscript:v16];
          int64x2_t v29 = [v58 objectAtIndexedSubscript:v16];
          unsigned int v30 = [v12 descriptor];
          uint64_t v31 = [v30 dataType];
          id v32 = [v20 destinationImageAllocator];
          id v33 = v12;
          id v34 = v20;
          uint64_t v35 = v59;
          uint64_t v36 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:v33 commandBuffer:v59 batchSize:v50 copyingKernel:v28 sourceMTLBuffer:v29 MLCDataType:v31 heapAllocator:v32];

          uint64_t v51 = (void *)v36;
          unsigned int v52 = v34;
          if (v54)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v61 = 0;
              uint64_t v35 = v59;
              uint64_t v37 = [v34 encodeBatchToCommandBuffer:v59 sourceImages:v36 convolutionGradientStates:0 destinationStates:&v61 destinationStateIsTemporary:v48];
              uint64_t v38 = v61;
            }
            else
            {
              uint64_t v60 = 0;
              uint64_t v35 = v59;
              uint64_t v37 = [v34 encodeBatchToCommandBuffer:v59 sourceImages:v36 destinationStates:&v60 destinationStateIsTemporary:v48];
              uint64_t v38 = v60;
            }
            id v39 = v38;
          }
          else
          {
            uint64_t v37 = [v34 encodeBatchToCommandBuffer:v59 sourceImages:v36];
            id v39 = 0;
          }
          uint64_t v40 = [(MLCDeviceGPU *)v53 gpuReadTensorKernelList];
          uint64_t v41 = [v40 objectAtIndexedSubscript:v16];
          uint64_t v42 = [v57 objectAtIndexedSubscript:v16];
          unint64_t v43 = [v56 descriptor];
          +[MLCGPUHelper copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:](MLCGPUHelper, "copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:", v41, v35, v37, v42, [v43 dataType]);

          uint64_t v7 = v54;
          uint64_t v19 = v35;
          if (v54)
          {
            [v17 setGradientState:v39];
            uint64_t v44 = [v58 objectAtIndexedSubscript:v16];
            [v17 setSource:v44];

            uint64_t v19 = v59;
          }

          id v11 = v55;
          id v12 = v49;
          uint64_t v20 = v52;
          id v14 = v53;
        }
      }
      else
      {
        switch([v17 metalKernelType])
        {
          case 1u:
            [(MLCDeviceGPU *)v14 dispatchForwardActivationsKernel:v11 sourceTensor:v12 resultTensor:v56 deviceIndex:v16];
            if (v7) {
              goto LABEL_38;
            }
            break;
          case 2u:
            [(MLCDeviceGPU *)v14 dispatchForwardPaddingKernel:v11 sourceTensor:v12 resultTensor:v56 deviceIndex:v16];
            if (v7) {
              goto LABEL_38;
            }
            break;
          case 3u:
            [(MLCDeviceGPU *)v14 dispatchForwardSoftmaxKernel:v11 sourceTensor:v12 resultTensor:v56 deviceIndex:v16];
            if (v7) {
              goto LABEL_38;
            }
            break;
          case 4u:
            v62[0] = v12;
            unint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
            [(MLCDeviceGPU *)v14 dispatchForwardLayerNormalizationKernel:v11 sourceTensors:v45 resultTensor:v56 deviceIndex:v16 forTraining:v7];

            if (v7) {
              goto LABEL_38;
            }
            break;
          case 5u:
          case 6u:
            [(MLCDeviceGPU *)v14 dispatchForwardInstanceNormalizationKernel:v11 sourceTensor:v12 resultTensor:v56 deviceIndex:v16 forTraining:v7];
            if (v7) {
              goto LABEL_38;
            }
            break;
          case 7u:
          case 8u:
            [(MLCDeviceGPU *)v14 dispatchForwardBatchNormalizationKernel:v11 sourceTensor:v12 resultTensor:v56 deviceIndex:v16 forTraining:v7];
            if (v7) {
              goto LABEL_38;
            }
            break;
          case 9u:
            [(MLCDeviceGPU *)v14 dispatchForwardGroupNormalizationKernel:v11 sourceTensor:v12 resultTensor:v56 deviceIndex:v16 forTraining:v7];
            if (v7) {
              goto LABEL_38;
            }
            break;
          case 0xAu:
            [(MLCDeviceGPU *)v14 dispatchForwardResizeKernel:v11 sourceTensor:v12 resultTensor:v56 deviceIndex:v16];
            goto LABEL_37;
          case 0xCu:
            [(MLCDeviceGPU *)v14 dispatchTransposeKernel:v11 sourceTensor:v12 resultTensor:v56 deviceIndex:v16 forward:1];
            if (!v7) {
              break;
            }
            goto LABEL_38;
          case 0xFu:
          case 0x10u:
          case 0x11u:
            [(MLCDeviceGPU *)v14 dispatchForwardPoolingKernel:v11 sourceTensor:v12 resultTensor:v56 deviceIndex:v16 forTraining:v7];
            if (!v7) {
              break;
            }
            goto LABEL_38;
          case 0x12u:
            [(MLCDeviceGPU *)v14 dispatchForwardGramMatrixKernel:v11 sourceTensor:v12 resultTensor:v56 deviceIndex:v16 forTraining:v7];
            if (!v7) {
              break;
            }
            goto LABEL_38;
          default:
LABEL_37:
            if (v7)
            {
LABEL_38:
              [v17 setGradientState:0];
              uint64_t v46 = [v58 objectAtIndexedSubscript:v16];
              [v17 setSource:v46];

              if ([v17 metalKernelType] == 3
                || [v17 metalKernelType] == 8
                || [v17 metalKernelType] == 6
                || [v17 metalKernelType] == 17)
              {
                unint64_t v47 = [v57 objectAtIndexedSubscript:v16];
                [v17 setResult:v47];
              }
            }
            break;
        }
      }

      ++v16;
    }
    while (v16 < [(MLCDeviceGPU *)v14 numDevicesToUse]);
  }
}

- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 tertiaryTensor:(id)a6 resultTensor:(id)a7 resultStateIsTemporary:(BOOL)a8 forTraining:(BOOL)a9
{
  id v25 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  unint64_t v18 = [v14 deviceMemory];
  uint64_t v24 = [v15 deviceMemory];
  [(MLCDeviceGPU *)self allocateResultTensor:v17];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    for (unint64_t i = 0; i < [(MLCDeviceGPU *)self numDevicesToUse]; ++i)
    {
      uint64_t v20 = [v25 objectAtIndexedSubscript:i];
      uint64_t v21 = v20;
      if (a9)
      {
        [v20 setGradientState:0];
        uint64_t v22 = [v18 objectAtIndexedSubscript:i];
        [v21 setSource:v22];

        if (v16)
        {
          [(MLCDeviceGPU *)self dispatchForwardArithmeticTertiaryKernel:v25 sourceTensor:v14 sourceSecondaryTensor:v15 sourceTertiaryTensor:v16 resultTensor:v17 deviceIndex:i];
        }
        else
        {
          if (!v15) {
            goto LABEL_13;
          }
          [(MLCDeviceGPU *)self dispatchForwardArithmeticBinaryKernel:v25 sourceTensor:v14 sourceSecondaryTensor:v15 resultTensor:v17 deviceIndex:i];
        }
        int v23 = [v24 objectAtIndexedSubscript:i];
        [v21 setSecondarySource:v23];
      }
      else if (v16)
      {
        [(MLCDeviceGPU *)self dispatchForwardArithmeticTertiaryKernel:v25 sourceTensor:v14 sourceSecondaryTensor:v15 sourceTertiaryTensor:v16 resultTensor:v17 deviceIndex:i];
      }
      else
      {
        if (!v15)
        {
LABEL_13:
          [(MLCDeviceGPU *)self dispatchForwardArithmeticUnaryKernel:v25 sourceTensor:v14 resultTensor:v17 deviceIndex:i];
          goto LABEL_14;
        }
        [(MLCDeviceGPU *)self dispatchForwardArithmeticBinaryKernel:v25 sourceTensor:v14 sourceSecondaryTensor:v15 resultTensor:v17 deviceIndex:i];
      }
LABEL_14:
    }
  }
}

- (void)dispatchForwardFusedArithmeticLayerNormalizationLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  BOOL v6 = a6;
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v10 objectAtIndexedSubscript:0];
  id v13 = [v12 deviceMemory];

  [(MLCDeviceGPU *)self allocateResultTensor:v11];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v14 = 0;
    do
    {
      id v15 = [v17 objectAtIndexedSubscript:v14];
      [(MLCDeviceGPU *)self dispatchForwardLayerNormalizationKernel:v17 sourceTensors:v10 resultTensor:v11 deviceIndex:v14 forTraining:v6];
      if (v6)
      {
        [v15 setGradientState:0];
        id v16 = [v13 objectAtIndexedSubscript:v14];
        [v15 setSource:v16];
      }
      ++v14;
    }
    while (v14 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

- (void)dispatchForwardMatMulLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  v94[3] = *MEMORY[0x1E4F143B8];
  id v85 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t context = (void *)MEMORY[0x1E01B11E0]();
  id v10 = [v8 objectAtIndexedSubscript:0];
  id v11 = [v10 descriptor];
  unsigned int DataType = GPU_GetDataType([v11 dataType]);

  id v12 = [v8 objectAtIndexedSubscript:0];
  id v13 = [v12 deviceMemory];

  uint64_t v84 = v8;
  unint64_t v14 = [v8 objectAtIndexedSubscript:1];
  id v15 = [v14 deviceMemory];

  [(MLCDeviceGPU *)self allocateResultTensor:v9];
  int8x16_t v79 = v9;
  int v83 = [v9 deviceMemory];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v16 = 0;
    int64x2_t v81 = v13;
    unint64_t v82 = self;
    uint64_t v80 = v15;
    do
    {
      id v17 = [v85 objectAtIndexedSubscript:v16];
      unint64_t v18 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      unint64_t v90 = [v18 objectAtIndexedSubscript:v16];

      uint64_t v87 = [v17 matmulKernel];
      uint64_t v89 = [v17 shapes];
      uint64_t v19 = [v13 objectAtIndexedSubscript:v16];
      v94[0] = v19;
      uint64_t v20 = [v15 objectAtIndexedSubscript:v16];
      v94[1] = v20;
      uint64_t v86 = v16;
      uint64_t v21 = [v83 objectAtIndexedSubscript:v16];
      v94[2] = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:3];
      int v23 = (void *)[v22 copy];

      uint64_t v24 = [v17 transposeLeft];
      id v25 = [v24 objectAtIndexedSubscript:0];
      v93[0] = v25;
      int v26 = [v17 transposeRight];
      id v27 = [v26 objectAtIndexedSubscript:0];
      v93[1] = v27;
      id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
      uint64_t v88 = (void *)[v28 copy];

      int64x2_t v29 = [v17 forwardMatricesOrNDArrays];
      for (uint64_t i = 0; i != 3; ++i)
      {
        uint64_t v31 = [v17 matrixDescs];
        id v32 = [v31 objectAtIndexedSubscript:i];

        unint64_t v33 = [v32 matrices];
        if (v33 > [v17 batchSize])
        {
          id v34 = objc_msgSend(MEMORY[0x1E4F35640], "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", objc_msgSend(v32, "rows"), objc_msgSend(v32, "columns"), objc_msgSend(v17, "batchSize"), objc_msgSend(v32, "rowBytes"), objc_msgSend(v32, "matrixBytes"), DataType);
          uint64_t v35 = [v17 matrixDescs];
          [v35 setObject:v34 atIndexedSubscript:i];
        }
      }
      uint64_t v36 = [v17 broadcastingFlags];
      uint64_t v37 = [v36 objectAtIndexedSubscript:0];
      if ([v37 unsignedIntegerValue])
      {
      }
      else
      {
        uint64_t v38 = [v17 broadcastingFlags];
        id v39 = [v38 objectAtIndexedSubscript:1];
        uint64_t v40 = [v39 unsignedIntegerValue];

        if (!v40)
        {
          for (unint64_t j = 0; j != 3; ++j)
          {
            if ([v29 count] <= j) {
              goto LABEL_27;
            }
            uint64_t v69 = [v29 objectAtIndexedSubscript:j];
            int8x16_t v70 = [v69 data];
            id v71 = [v23 objectAtIndexedSubscript:j];

            if (v70 != v71)
            {
LABEL_27:
              id v72 = objc_alloc(MEMORY[0x1E4F35618]);
              id v73 = [v23 objectAtIndexedSubscript:j];
              unsigned int v74 = [v17 matrixDescs];
              uint64_t v75 = [v74 objectAtIndexedSubscript:j];
              unint64_t v76 = (void *)[v72 initWithBuffer:v73 descriptor:v75];

              uint64_t v77 = [v17 forwardMatricesOrNDArrays];
              [v77 setObject:v76 atIndexedSubscript:j];
            }
          }
          id v61 = [v17 forwardKernel];
          uint64_t v62 = [v29 objectAtIndexedSubscript:0];
          uint64_t v63 = [v29 objectAtIndexedSubscript:1];
          id v64 = [v29 objectAtIndexedSubscript:2];
          [v61 encodeToCommandBuffer:v90 leftMatrix:v62 rightMatrix:v63 resultMatrix:v64];
          goto LABEL_20;
        }
      }
      unint64_t v41 = 0;
      for (unint64_t k = 0; k != 3; ++k)
      {
        if ([v29 count] <= v41) {
          goto LABEL_13;
        }
        unint64_t v43 = [v29 objectAtIndexedSubscript:v41];
        uint64_t v44 = [v43 data];
        unint64_t v45 = [v23 objectAtIndexedSubscript:k];

        if (v44 != v45)
        {
LABEL_13:
          id v46 = objc_alloc(MEMORY[0x1E4F35618]);
          unint64_t v47 = [v23 objectAtIndexedSubscript:k];
          BOOL v48 = [v17 matrixDescs];
          id v49 = [v48 objectAtIndexedSubscript:k];
          uint64_t v50 = (void *)[v46 initWithBuffer:v47 descriptor:v49];

          uint64_t v51 = (void *)MEMORY[0x1E4F35720];
          unsigned int v52 = [v89 objectAtIndexedSubscript:k];
          uint64_t v53 = [v51 descriptorWithDataType:DataType shape:v52];

          [v53 setPreferPackedRows:1];
          unsigned int v54 = [v50 ndArrayWithCommandBuffer:v90 descriptor:v53 aliasing:1];
          if (k <= 1
            && ([v88 objectAtIndexedSubscript:k],
                id v55 = objc_claimAutoreleasedReturnValue(),
                int v56 = [v55 BOOLValue],
                v55,
                v56))
          {
            uint64_t v57 = [v54 descriptor];
            [v57 transposeDimension:0 withDimension:1];
            id v58 = [v54 arrayViewWithCommandBuffer:v90 descriptor:v57 aliasing:1];
          }
          else
          {
            id v58 = v54;
          }
          unint64_t v59 = [v17 forwardMatricesOrNDArrays];
          [v59 setObject:v50 atIndexedSubscript:v41];

          uint64_t v60 = [v17 forwardMatricesOrNDArrays];
          [v60 setObject:v58 atIndexedSubscript:v41 + 1];
        }
        v41 += 2;
      }
      id v61 = [v29 objectAtIndexedSubscript:1];
      v92[0] = v61;
      uint64_t v62 = [v29 objectAtIndexedSubscript:3];
      v92[1] = v62;
      uint64_t v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
      id v64 = [v29 objectAtIndexedSubscript:5];
      [v87 encodeToCommandBuffer:v90 sourceArrays:v63 destinationArray:v64];
LABEL_20:

      self = v82;
      if ((unint64_t)[v84 count] >= 3)
      {
        uint64_t v65 = [v84 objectAtIndexedSubscript:2];
        [(MLCDeviceGPU *)v82 dispatchForwardArithmeticBinaryKernel:v85 sourceTensor:v79 sourceSecondaryTensor:v65 resultTensor:v79 deviceIndex:v86];
      }
      id v13 = v81;
      uint64_t v66 = [v81 objectAtIndexedSubscript:v86];
      [v17 setSource:v66];

      id v15 = v80;
      uint64_t v67 = [v80 objectAtIndexedSubscript:v86];
      [v17 setSecondarySource:v67];

      uint64_t v16 = v86 + 1;
    }
    while (v86 + 1 < [(MLCDeviceGPU *)v82 numDevicesToUse]);
  }
}

- (void)dispatchGradientMatMulLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5
{
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  id v172 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t context = (void *)MEMORY[0x1E01B11E0]();
  id v10 = [v8 descriptor];
  unsigned int DataType = GPU_GetDataType([v10 dataType]);

  id v167 = v8;
  id v170 = [v8 deviceMemory];
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v189 objects:v196 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v190;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v190 != v14) {
          objc_enumerationMutation(v11);
        }
        [(MLCDeviceGPU *)self allocateResultTensor:*(void *)(*((void *)&v189 + 1) + 8 * i)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v189 objects:v196 count:16];
    }
    while (v13);
  }

  uint64_t v16 = [v11 objectAtIndexedSubscript:0];
  id v169 = [v16 deviceMemory];

  id v17 = [v11 objectAtIndexedSubscript:1];
  char v168 = [v17 deviceMemory];

  if (![(MLCDeviceGPU *)self numDevicesToUse]) {
    goto LABEL_104;
  }
  uint64_t v18 = 0;
  id v178 = v11;
  id v171 = self;
  do
  {
    uint64_t v19 = [v172 objectAtIndexedSubscript:v18];
    uint64_t v20 = self;
    uint64_t v21 = (void *)v19;
    uint64_t v22 = [(MLCDeviceGPU *)v20 gpuCommandBufferList];
    int v23 = [v22 objectAtIndexedSubscript:v18];

    if ((unint64_t)[v11 count] >= 3)
    {
      uint64_t v24 = [v11 objectAtIndexedSubscript:2];
      [(MLCDeviceGPU *)v171 dispatchGradientArithmeticBinaryKernel:v172 sourceGradientTensor:v167 resultGradientTensor:v167 secondaryResultGradientTensor:v24 deviceIndex:v18];
    }
    unint64_t v181 = [v21 shapes];
    id v25 = [v169 objectAtIndexedSubscript:v18];
    v195[0] = v25;
    int v26 = [v168 objectAtIndexedSubscript:v18];
    v195[1] = v26;
    uint64_t v173 = v18;
    id v27 = [v170 objectAtIndexedSubscript:v18];
    v195[2] = v27;
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:3];
    char v186 = (void *)[v28 copy];

    int64x2_t v29 = [v21 broadcastingFlags];
    unsigned int v30 = [v29 objectAtIndexedSubscript:0];
    if ([v30 unsignedIntegerValue])
    {
      BOOL v31 = 0;
    }
    else
    {
      id v32 = [v21 broadcastingFlags];
      unint64_t v33 = [v32 objectAtIndexedSubscript:1];
      BOOL v31 = [v33 unsignedIntegerValue] == 0;
    }
    BOOL v34 = 0;
    for (unint64_t j = 0; j != 3; ++j)
    {
      if (v31)
      {
        if (j <= 1)
        {
          uint64_t v38 = 3 * j + 2;
        }
        else
        {
          uint64_t v36 = [v21 gradientLeftRightMatrixSelectionFlags];
          uint64_t v37 = [v36 objectAtIndexedSubscript:0];
          uint64_t v38 = 1 - [v37 unsignedIntegerValue];
        }
      }
      else
      {
        uint64_t v38 = j + 6;
      }
      id v39 = [v21 gradientMatricesOrNDArrays];
      if (![v39 count])
      {

        if (!v31)
        {
          BOOL v34 = 0;
LABEL_62:
          int v184 = [v21 matmulKernel];
          uint64_t v86 = [v21 gradientMatricesOrNDArrays];
          uint64_t v185 = v23;
          if (!v34)
          {
            uint64_t v87 = (void *)MEMORY[0x1E4F1CBF0];
            uint64_t v88 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
            int v180 = (void *)[v87 mutableCopy];
            uint64_t v89 = 0;
            unint64_t v90 = 0x1E4F35000uLL;
            v187 = v88;
            do
            {
              id v91 = objc_alloc(*(Class *)(v90 + 1560));
              unint64_t v92 = [v186 objectAtIndexedSubscript:v89];
              uint64_t v93 = [v21 matrixDescs];
              unint64_t v94 = [v93 objectAtIndexedSubscript:v89];
              BOOL v95 = (void *)[v91 initWithBuffer:v92 descriptor:v94];

              [v180 setObject:v95 atIndexedSubscript:v89];
              unint64_t v96 = (void *)MEMORY[0x1E4F35720];
              unint64_t v97 = [v181 objectAtIndexedSubscript:v89];
              unint64_t v98 = [v96 descriptorWithDataType:DataType shape:v97];

              [v98 setPreferPackedRows:1];
              unint64_t v99 = [v95 ndArrayWithCommandBuffer:v185 descriptor:v98 aliasing:1];
              [v88 addObject:v99];
              if (v89 != 2)
              {
                id v100 = objc_alloc(*(Class *)(v90 + 1560));
                if (v89) {
                  [v21 secondarySource];
                }
                else {
                unint64_t v101 = [v21 source];
                }
                int v102 = [v21 matrixDescs];
                id v103 = [v102 objectAtIndexedSubscript:v89];
                long long v104 = (void *)[v100 initWithBuffer:v101 descriptor:v103];

                uint64_t v105 = [v104 ndArrayWithCommandBuffer:v185 descriptor:v98 aliasing:1];
                uint64_t v88 = v187;
                [v187 addObject:v105];

                unint64_t v90 = 0x1E4F35000;
              }

              ++v89;
            }
            while (v89 != 3);
            uint64_t v106 = 0;
            char v107 = 1;
            do
            {
              char v108 = v107;
              id v109 = [v21 gradientLeftRightMatrixSelectionFlags];
              uint64_t v110 = [v109 objectAtIndexedSubscript:v106];
              int v111 = [v110 BOOLValue];

              uint64_t v112 = 4;
              if ((v108 & 1) == 0) {
                uint64_t v112 = 1;
              }
              uint64_t v113 = 3;
              if ((v108 & 1) == 0) {
                uint64_t v113 = 4;
              }
              if (v111) {
                uint64_t v114 = v112;
              }
              else {
                uint64_t v114 = v113;
              }
              if (v111) {
                uint64_t v115 = v113;
              }
              else {
                uint64_t v115 = v112;
              }
              unint64_t v116 = [v88 objectAtIndexedSubscript:v114];
              unint64_t v117 = [v88 objectAtIndexedSubscript:v115];
              uint64_t v118 = [v21 transposeLeft];
              unint64_t v119 = [v118 objectAtIndexedSubscript:v106 + 1];
              int v120 = [v119 BOOLValue];

              if (v120)
              {
                long long v121 = [v116 descriptor];
                [v121 transposeDimension:0 withDimension:1];
                uint64_t v122 = [v116 arrayViewWithCommandBuffer:v185 descriptor:v121 aliasing:1];
                [v86 setObject:v122 atIndexedSubscript:3 * v106];
              }
              else
              {
                [v86 setObject:v116 atIndexedSubscript:3 * v106];
              }
              int64x2_t v123 = [v21 transposeRight];
              unint64_t v124 = [v123 objectAtIndexedSubscript:v106 + 1];
              int v125 = [v124 BOOLValue];

              if (v125)
              {
                unint64_t v126 = [v117 descriptor];
                [v126 transposeDimension:0 withDimension:1];
                uint64_t v127 = [v117 arrayViewWithCommandBuffer:v185 descriptor:v126 aliasing:1];
                uint64_t v128 = 3 * v106;
                [v86 setObject:v127 atIndexedSubscript:3 * v106 + 1];
              }
              else
              {
                uint64_t v128 = 3 * v106;
                [v86 setObject:v117 atIndexedSubscript:3 * v106 + 1];
              }
              int64x2_t v129 = [v187 objectAtIndexedSubscript:2 * v106];
              uint64_t v130 = v128 + 2;
              uint64_t v88 = v187;
              [v86 setObject:v129 atIndexedSubscript:v130];

              char v107 = 0;
              uint64_t v106 = 1;
            }
            while ((v108 & 1) != 0);
            for (uint64_t k = 0; k != 3; ++k)
            {
              uint64_t v132 = [v180 objectAtIndexedSubscript:k];
              [v86 setObject:v132 atIndexedSubscript:k + 6];
            }
            int v23 = v185;
          }
          uint64_t v133 = 0;
          char v134 = 1;
          id v11 = v178;
          uint64_t v182 = v86;
          do
          {
            char v188 = v134;
            int v135 = [v21 broadcastingFlags];
            signed int v136 = [v135 objectAtIndexedSubscript:v133];
            uint64_t v137 = [v136 unsignedIntegerValue];

            uint64_t v138 = 3 * v133;
            uint64_t v139 = [v86 objectAtIndexedSubscript:3 * v133];
            id v140 = (id)v139;
            uint64_t v141 = 3 * v133 + 1;
            if (v137)
            {
              v193[0] = v139;
              v142 = [v86 objectAtIndexedSubscript:v141];
              v193[1] = v142;
              uint64_t v143 = [MEMORY[0x1E4F1C978] arrayWithObjects:v193 count:2];
              uint64_t v144 = [v184 encodeToCommandBuffer:v23 sourceArrays:v143];

              id v140 = v144;
              uint64_t v145 = v138 + 2;
              unint64_t v146 = [v86 objectAtIndexedSubscript:v138 + 2];
              v147 = [v21 broadcastingFlags];
              uint64_t v148 = [v147 objectAtIndexedSubscript:v133];
              unint64_t v149 = [v148 unsignedIntegerValue];

              if (v149 < 2)
              {
                v163 = v140;
                int v23 = v185;
                uint64_t v86 = v182;
                char v165 = v188;
              }
              else
              {
                unint64_t v150 = [v140 descriptor];
                unint64_t v151 = [v21 reductionShapes];
                uint64_t v152 = 2 * v133;
                v153 = [v151 objectAtIndexedSubscript:2 * v133];
                [v150 reshapeWithShape:v153];

                uint64_t v154 = [v21 broadcastingFlags];
                unint64_t v155 = [v154 objectAtIndexedSubscript:v133];
                uint64_t v156 = [v155 unsignedIntegerValue];

                if (v156 == 2)
                {
                  v157 = [v182 objectAtIndexedSubscript:v145];
                  v158 = [v157 descriptor];

                  v159 = [v21 reductionShapes];
                  unint64_t v160 = [v159 objectAtIndexedSubscript:v152 | 1];
                  [v158 reshapeWithShape:v160];

                  unint64_t v161 = [v182 objectAtIndexedSubscript:v145];
                  int v23 = v185;
                  uint64_t v162 = [v161 arrayViewWithCommandBuffer:v185 descriptor:v158 aliasing:1];

                  unint64_t v146 = (void *)v162;
                }
                else
                {
                  int v23 = v185;
                }
                char v165 = v188;
                v163 = [v140 arrayViewWithCommandBuffer:v23 descriptor:v150 aliasing:1];

                id v11 = v178;
                uint64_t v86 = v182;
              }
              uint64_t v164 = [v21 reduceSumKernel];
              [v164 encodeToCommandBuffer:v23 sourceArray:v163 destinationArray:v146];
            }
            else
            {
              v194[0] = v139;
              v163 = [v86 objectAtIndexedSubscript:v141];
              v194[1] = v163;
              unint64_t v146 = [MEMORY[0x1E4F1C978] arrayWithObjects:v194 count:2];
              uint64_t v164 = [v86 objectAtIndexedSubscript:v138 + 2];
              [v184 encodeToCommandBuffer:v23 sourceArrays:v146 destinationArray:v164];
              char v165 = v188;
            }

            char v134 = 0;
            uint64_t v133 = 1;
          }
          while ((v165 & 1) != 0);

          unint64_t v45 = v184;
          goto LABEL_103;
        }
        unint64_t v45 = [v21 gradientMatricesOrNDArrays];
        unint64_t v44 = 0x1E4F35000uLL;
LABEL_29:
        unint64_t v183 = v45;
        id v46 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        for (uint64_t m = 0; ; ++m)
        {
          id v48 = objc_alloc(*(Class *)(v44 + 1560));
          id v49 = [v186 objectAtIndexedSubscript:m];
          uint64_t v50 = [v21 matrixDescs];
          uint64_t v51 = [v50 objectAtIndexedSubscript:m];
          unsigned int v52 = (void *)[v48 initWithBuffer:v49 descriptor:v51];

          [v46 addObject:v52];
          if (m == 2) {
            break;
          }
          id v53 = objc_alloc(*(Class *)(v44 + 1560));
          if (m) {
            [v21 secondarySource];
          }
          else {
          unsigned int v54 = [v21 source];
          }
          id v55 = [v21 matrixDescs];
          int v56 = [v55 objectAtIndexedSubscript:m];
          uint64_t v57 = (void *)[v53 initWithBuffer:v54 descriptor:v56];

          [v46 addObject:v57];
        }

        uint64_t v58 = 0;
        char v59 = 1;
        id v11 = v178;
        while (1)
        {
          uint64_t v60 = [v21 gradientLeftRightMatrixSelectionFlags];
          id v61 = [v60 objectAtIndexedSubscript:v58];
          int v62 = [v61 BOOLValue];

          if (!v62) {
            break;
          }
          if (v59)
          {
            uint64_t v63 = [v46 objectAtIndexedSubscript:4];
            BOOL v175 = (void *)v63;
          }
          else
          {
            uint64_t v63 = [v46 objectAtIndexedSubscript:1];
            __int16 v174 = (void *)v63;
          }
          uint64_t v65 = [v21 gradientMatricesOrNDArrays];
          uint64_t v66 = 3 * v58;
          [v65 setObject:v63 atIndexedSubscript:3 * v58];

          if ((v59 & 1) == 0)
          {
            int8x16_t v70 = v174;
LABEL_48:

            uint64_t v67 = v46;
            uint64_t v68 = 4;
            goto LABEL_50;
          }

          uint64_t v67 = v46;
          uint64_t v68 = 3;
LABEL_50:
          id v71 = [v67 objectAtIndexedSubscript:v68];
          id v72 = [v21 gradientMatricesOrNDArrays];
          [v72 setObject:v71 atIndexedSubscript:v66 + 1];

          uint64_t v73 = v66 + 2;
          unsigned int v74 = [v46 objectAtIndexedSubscript:2 * v58];
          uint64_t v75 = [v21 gradientMatricesOrNDArrays];
          unint64_t v76 = v75;
          int v77 = v59 & 1;
          if (v59) {
            uint64_t v78 = 2;
          }
          else {
            uint64_t v78 = v73;
          }
          [v75 setObject:v74 atIndexedSubscript:v78];

          char v59 = 0;
          uint64_t v58 = 1;
          if (!v77)
          {

            unint64_t v45 = v183;
            goto LABEL_55;
          }
        }
        if (v59)
        {
          uint64_t v64 = [v46 objectAtIndexedSubscript:3];
          __int16 v176 = (void *)v64;
        }
        else
        {
          uint64_t v64 = [v46 objectAtIndexedSubscript:4];
          unint64_t v177 = (void *)v64;
        }
        uint64_t v69 = [v21 gradientMatricesOrNDArrays];
        uint64_t v66 = 3 * v58;
        [v69 setObject:v64 atIndexedSubscript:3 * v58];

        if ((v59 & 1) == 0)
        {

          uint64_t v67 = v46;
          uint64_t v68 = 1;
          goto LABEL_50;
        }
        int8x16_t v70 = v176;
        goto LABEL_48;
      }
      uint64_t v40 = [v21 gradientMatricesOrNDArrays];
      unint64_t v41 = [v40 objectAtIndexedSubscript:v38];
      uint64_t v42 = [v41 data];
      unint64_t v43 = [v186 objectAtIndexedSubscript:j];

      if (v42 != v43) {
        break;
      }
      BOOL v34 = j > 1;
    }
    unint64_t v44 = 0x1E4F35000;
    if (!v31) {
      goto LABEL_62;
    }
    unint64_t v45 = [v21 gradientMatricesOrNDArrays];
    if (!v34) {
      goto LABEL_29;
    }
    id v11 = v178;
LABEL_55:
    uint64_t v79 = 0;
    char v80 = 1;
    do
    {
      char v81 = v80;
      if (v80) {
        [v21 gradientKernel];
      }
      else {
      unint64_t v82 = [v21 secondaryGradientKernel];
      }
      int v83 = [v45 objectAtIndexedSubscript:v79];
      uint64_t v84 = [v45 objectAtIndexedSubscript:v79 + 1];
      id v85 = [v45 objectAtIndexedSubscript:v79 + 2];
      [v82 encodeToCommandBuffer:v23 leftMatrix:v83 rightMatrix:v84 resultMatrix:v85];

      char v80 = 0;
      uint64_t v79 = 3;
    }
    while ((v81 & 1) != 0);
LABEL_103:

    uint64_t v18 = v173 + 1;
    self = v171;
  }
  while (v173 + 1 < [(MLCDeviceGPU *)v171 numDevicesToUse]);
LABEL_104:
}

- (void)dispatchForwardMHALayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  BOOL v312 = a7;
  BOOL v284 = a6;
  v384[2] = *MEMORY[0x1E4F143B8];
  id v283 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t context = (void *)MEMORY[0x1E01B11E0]();
  uint64_t v12 = [v10 objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 descriptor];
  uint64_t v14 = [v13 stride];
  v315 = v10;
  id v15 = [v10 objectAtIndexedSubscript:0];
  uint64_t v16 = [v15 descriptor];
  id v17 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v16, "dimensionCount") - 1);
  uint64_t v311 = [v17 unsignedIntegerValue];

  [(MLCDeviceGPU *)self allocateResultTensor:v11];
  v285 = v11;
  v310 = [v11 deviceMemory];
  v360 = self;
  if (![(MLCDeviceGPU *)self numDevicesToUse]) {
    goto LABEL_104;
  }
  uint64_t v18 = 0;
  do
  {
    uint64_t v19 = [v283 objectAtIndexedSubscript:v18];
    uint64_t v20 = [(MLCDeviceGPU *)v360 deviceList];
    v328 = [v20 objectAtIndexedSubscript:v18];

    uint64_t v21 = [(MLCDeviceGPU *)v360 gpuCommandBufferList];
    v361 = [v21 objectAtIndexedSubscript:v18];

    int v307 = [v19 mhaHeadCount];
    uint64_t v22 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v19 setMhaSourcesQKV:v22];

    unint64_t v23 = 0;
    uint64_t v24 = 2;
    uint64_t v356 = v18;
    v351 = v19;
    do
    {
      id v25 = [v19 mhaMatrixDescriptors];
      uint64_t v26 = [v25 objectAtIndexedSubscript:v24 - 2];

      id v27 = [v19 mhaNDArrayDescriptors];
      uint64_t v28 = [v27 objectAtIndexedSubscript:v24 - 2];

      int64x2_t v29 = (void *)v26;
      id v30 = objc_alloc(MEMORY[0x1E4F35618]);
      BOOL v31 = [v315 objectAtIndexedSubscript:v23];
      id v32 = [v31 deviceMemory];
      unint64_t v33 = [v32 objectAtIndexedSubscript:v18];
      v344 = v29;
      BOOL v34 = (void *)[v30 initWithBuffer:v33 descriptor:v29];

      v352 = v34;
      v357 = (void *)v28;
      uint64_t v35 = [v34 ndArrayWithCommandBuffer:v361 descriptor:v28 aliasing:1];
      uint64_t v36 = [v35 descriptor];
      [v36 transposeDimension:0 withDimension:1];
      v365 = v35;
      v347 = v36;
      uint64_t v362 = [v35 arrayViewWithCommandBuffer:v361 descriptor:v36 aliasing:1];
      uint64_t v37 = [v19 mhaMatrixDescriptors];
      uint64_t v38 = [v37 objectAtIndexedSubscript:v24 - 1];

      id v39 = [v19 mhaNDArrayDescriptors];
      uint64_t v40 = [v39 objectAtIndexedSubscript:v24 - 1];

      id v41 = objc_alloc(MEMORY[0x1E4F35618]);
      uint64_t v42 = [v19 exportableState];
      unint64_t v43 = [v42 objectAtIndexedSubscript:v23];
      v341 = (void *)v38;
      uint64_t v44 = v38;
      unint64_t v45 = (void *)v40;
      id v46 = (void *)[v41 initWithBuffer:v43 descriptor:v44];

      uint64_t v47 = [v46 ndArrayWithCommandBuffer:v361 descriptor:v40 aliasing:1];
      id v48 = [v19 mhaMatrixDescriptors];
      id v49 = [v48 objectAtIndexedSubscript:v24];

      uint64_t v50 = [v19 mhaNDArrayDescriptors];
      uint64_t v51 = [v50 objectAtIndexedSubscript:v24];

      unsigned int v52 = [v19 mhaMatMulSourcesQKV];
      v338 = v46;
      if ([v52 count] <= v23)
      {
      }
      else
      {
        id v53 = [v19 mhaMatMulSourcesQKV];
        unsigned int v54 = [v53 objectAtIndexedSubscript:v23];

        if (v54)
        {
          id v55 = [v351 mhaMatMulSourcesQKV];
          int v56 = [v55 objectAtIndexedSubscript:v23];
          uint64_t v57 = [v56 data];

          goto LABEL_9;
        }
      }
      uint64_t v57 = objc_msgSend(v328, "newBufferWithLength:options:", objc_msgSend(v49, "matrixBytes") * objc_msgSend(v49, "matrices"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
LABEL_9:
      uint64_t v58 = (void *)v362;
      v325 = (void *)v57;
      v332 = v49;
      v322 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v57 descriptor:v49];
      v329 = (void *)v51;
      char v59 = [v322 ndArrayWithCommandBuffer:v361 descriptor:v51 aliasing:1];
      uint64_t v19 = v351;
      uint64_t v60 = [v351 mhaMatMulKernel];
      v335 = (void *)v47;
      v384[0] = v47;
      v384[1] = v362;
      id v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v384 count:2];
      [v60 encodeToCommandBuffer:v361 sourceArrays:v61 destinationArray:v59];

      if (v312)
      {
        int v62 = [v351 mhaSourcesQKV];
        [v62 addObject:v365];
      }
      if ([v351 mhaHasBias])
      {
        uint64_t v63 = [v351 mhaMatrixDescriptorsForBias];
        v319 = [v63 objectAtIndexedSubscript:v23];

        id v64 = objc_alloc(MEMORY[0x1E4F35618]);
        uint64_t v65 = [v351 exportableState];
        uint64_t v66 = [v65 objectAtIndexedSubscript:v23 + 4];
        v316 = (void *)[v64 initWithBuffer:v66 descriptor:v319];

        uint64_t v67 = [v351 mhaNDArrayDescriptorsForBias];
        uint64_t v68 = [v67 objectAtIndexedSubscript:v23];

        uint64_t v69 = [v316 ndArrayWithCommandBuffer:v361 descriptor:v68 aliasing:1];
        int8x16_t v70 = [v351 mhaBiasAddKernel];
        v383[0] = v59;
        v383[1] = v69;
        id v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v383 count:2];
        [v70 encodeToCommandBuffer:v361 sourceArrays:v71 destinationArray:v59];

        uint64_t v58 = (void *)v362;
      }
      id v72 = [v351 mhaInputProjResults];
      [v72 setObject:v325 atIndexedSubscript:v23];

      ++v23;
      v24 += 3;
      uint64_t v73 = v360;
      uint64_t v18 = v356;
    }
    while (v23 != 3);
    unsigned int v74 = [v351 mhaHasZeroAttention];
    unsigned int v75 = [v351 mhaHasAttnBias];
    if (([v351 mhaHasAttnBias] & 1) != 0 || objc_msgSend(v351, "mhaHasZeroAttention"))
    {
      uint64_t v76 = 0;
      unint64_t v348 = v75 + (unint64_t)v74;
      char v77 = 1;
      if (v75) {
        uint64_t v78 = 2;
      }
      else {
        uint64_t v78 = 1;
      }
      uint64_t v330 = v78 + v74;
      do
      {
        char v313 = v77;
        uint64_t v79 = v76;
        char v80 = [(MLCDeviceGPU *)v73 gpuPipelineStatesConcatFloat];
        char v81 = [v80 objectAtIndexedSubscript:v18];
        uint64_t v82 = [v81 maxTotalThreadsPerThreadgroup];

        uint64_t v83 = [v19 batchSize];
        uint64_t v317 = v79;
        uint64_t v84 = v79 + 1;
        id v85 = [v315 objectAtIndexedSubscript:v79 + 1];
        uint64_t v86 = [v85 descriptor];
        uint64_t v87 = [v86 shape];
        uint64_t v88 = [v87 objectAtIndexedSubscript:1];
        uint64_t v89 = [v88 unsignedIntegerValue];

        uint64_t v19 = v351;
        uint64_t v90 = [v351 mhaModelDimension];
        uint64_t v91 = 0;
        int v358 = v89;
        unsigned int v320 = v89 + 1;
        uint64_t v323 = v90 * v311;
        unsigned int v339 = v90;
        int v342 = v89 + v348;
        unint64_t v345 = v82;
        uint64_t v326 = v82 - 1;
        long long v373 = 0u;
        v374[0] = 0u;
        int v336 = v90 * (v89 + v348);
        uint64_t v333 = 4 * v90 * (v89 + v348) * v83;
        long long v372 = 0u;
        uint64_t v353 = v84;
        do
        {
          if (v348 == v91 && [v19 mhaHasZeroAttention])
          {
            unint64_t v92 = [(MLCDeviceGPU *)v360 gpuHeapTemporaryResourceAllocator];
            uint64_t v93 = objc_msgSend(v92, "objectAtIndexedSubscript:", objc_msgSend(v19, "temporaryHeapIndex"));
            unint64_t v94 = [v93 allocateBuffer:v323];

            BOOL v95 = [v361 blitCommandEncoder];
            objc_msgSend(v95, "fillBuffer:range:value:", v94, 0, objc_msgSend(v94, "length"), 0);
            [v95 endEncoding];
          }
          else
          {
            unint64_t v94 = 0;
          }
          if (v91 == 2)
          {
            v366 = v94;
            unsigned int v98 = v320;
          }
          else if (v91 == 1)
          {
            if ([v19 mhaHasAttnBias])
            {
              unint64_t v99 = [v19 mhaAttentionBiasTensors];
              id v100 = [v99 objectAtIndexedSubscript:v317];
              unint64_t v101 = [v100 deviceMemory];
              uint64_t v102 = [v101 objectAtIndexedSubscript:v356];

              v366 = (void *)v102;
              uint64_t v84 = v353;
            }
            else
            {
              v366 = v94;
            }
            unsigned int v98 = v358;
          }
          else if (v91)
          {
            v366 = v94;
            unsigned int v98 = 0;
          }
          else
          {
            unint64_t v96 = [v19 mhaInputProjResults];
            uint64_t v97 = [v96 objectAtIndexedSubscript:v84];

            unsigned int v98 = 0;
            v366 = (void *)v97;
          }
          if (v91) {
            int v103 = 1;
          }
          else {
            int v103 = v358;
          }
          *(void *)&long long v372 = __PAIR64__(v339, v103);
          unsigned int v104 = [v19 batchSize];
          *((void *)&v372 + 1) = v104 | 0x100000000;
          unint64_t v105 = (int)v372;
          unint64_t v106 = SDWORD1(v372);
          unsigned int v107 = DWORD1(v372) * v372;
          if (v91) {
            unsigned int v107 = 0;
          }
          *(void *)&long long v373 = __PAIR64__(v107, v372);
          DWORD2(v373) = 1;
          HIDWORD(v373) = v342;
          LODWORD(v374[0]) = v336;
          *((void *)&v374[0] + 1) = v98 | 0x100000000;
          if (v345 <= (int)v372)
          {
            unint64_t v108 = 1;
            unint64_t v105 = v345;
            unint64_t v363 = (v326 + (int)v372) / v345;
          }
          else
          {
            if (v345 / (int)v372 >= SDWORD1(v372)) {
              unint64_t v108 = SDWORD1(v372);
            }
            else {
              unint64_t v108 = v345 / (int)v372;
            }
            unint64_t v363 = 1;
            unint64_t v106 = (SDWORD1(v372) + v108 - 1) / v108;
          }
          id v109 = [v19 mhaInputProjResults];
          [v109 objectAtIndexedSubscript:v84];
          v111 = uint64_t v110 = v84;
          uint64_t v112 = [v111 length];

          if (v112 == v333)
          {
            uint64_t v113 = [v19 mhaInputProjResults];
            uint64_t v114 = [v113 objectAtIndexedSubscript:v110];
          }
          else
          {
            uint64_t v114 = objc_msgSend(v328, "newBufferWithLength:options:", v333, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
            uint64_t v113 = [v19 mhaInputProjResults];
            [v113 setObject:v114 atIndexedSubscript:v110];
          }
          uint64_t v115 = (int)v104;

          unint64_t v116 = [v361 computeCommandEncoderWithDispatchType:0];
          unint64_t v117 = [(MLCDeviceGPU *)v360 gpuPipelineStatesConcatFloat];
          uint64_t v118 = [v117 objectAtIndexedSubscript:v356];
          [v116 setComputePipelineState:v118];

          [v116 setBuffer:v366 offset:0 atIndex:0];
          [v116 setBuffer:v114 offset:0 atIndex:1];
          [v116 setBytes:&v372 length:48 atIndex:2];
          uint64_t v376 = v363;
          unint64_t v377 = v106;
          uint64_t v378 = v115;
          v375[0] = v105;
          v375[1] = v108;
          v375[2] = 1;
          [v116 dispatchThreadgroups:&v376 threadsPerThreadgroup:v375];
          [v116 endEncoding];

          ++v91;
          uint64_t v19 = v351;
          uint64_t v84 = v353;
        }
        while (v330 != v91);
        char v77 = 0;
        uint64_t v76 = 1;
        uint64_t v73 = v360;
        uint64_t v18 = v356;
      }
      while ((v313 & 1) != 0);
    }
    unint64_t v119 = [v19 mhaMatMulSourcesQKV];
    unint64_t v120 = [v119 count];

    unint64_t v121 = 0x1E4F35000uLL;
    if (v120 <= 2)
    {
      for (uint64_t i = 0; i != 3; ++i)
      {
        int64x2_t v123 = [v19 mhaInputProjResults];
        unint64_t v124 = [v123 objectAtIndexedSubscript:i];

        id v125 = objc_alloc(MEMORY[0x1E4F35618]);
        unint64_t v126 = [v19 mhaMatrixDescriptors];
        uint64_t v127 = [v126 objectAtIndexedSubscript:i + 9];
        uint64_t v128 = (void *)[v125 initWithBuffer:v124 descriptor:v127];

        uint64_t v19 = v351;
        int64x2_t v129 = [v351 mhaMatMulSourcesQKV];
        [v129 setObject:v128 atIndexedSubscript:i];
      }
    }
    uint64_t v130 = [v19 mhaMatMulSourcesQKV];
    long long v131 = [v130 objectAtIndexedSubscript:0];

    uint64_t v132 = [v19 mhaMatMulSourcesQKV];
    uint64_t v133 = [v132 objectAtIndexedSubscript:1];

    char v134 = [v19 mhaNDArrayDescriptors];
    uint64_t v135 = [v134 objectAtIndexedSubscript:9];

    v346 = v131;
    v340 = (void *)v135;
    signed int v136 = [v131 ndArrayWithCommandBuffer:v361 descriptor:v135 aliasing:1];
    uint64_t v137 = [v136 descriptor];
    [v137 transposeDimension:0 withDimension:1];
    v334 = v137;
    v337 = v136;
    uint64_t v138 = [v136 arrayViewWithCommandBuffer:v361 descriptor:v137 aliasing:1];
    uint64_t v139 = [v19 mhaNDArrayDescriptors];
    uint64_t v140 = [v139 objectAtIndexedSubscript:10];

    v343 = v133;
    v327 = (void *)v140;
    uint64_t v141 = [v133 ndArrayWithCommandBuffer:v361 descriptor:v140 aliasing:1];
    v142 = [v19 mhaMatrixDescriptors];
    uint64_t v143 = [v142 objectAtIndexedSubscript:12];

    uint64_t v144 = [v143 matrices];
    uint64_t v145 = [v143 matrixBytes] * v144;
    unint64_t v146 = [(MLCDeviceGPU *)v73 gpuHeapTemporaryResourceAllocator];
    v147 = objc_msgSend(v146, "objectAtIndexedSubscript:", objc_msgSend(v19, "temporaryHeapIndex"));
    uint64_t v148 = [v147 allocateBuffer:v145];

    unint64_t v149 = v143;
    v318 = (void *)v148;
    unint64_t v150 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v148 descriptor:v143];
    unint64_t v151 = [v19 mhaNDArrayDescriptors];
    uint64_t v152 = [v151 objectAtIndexedSubscript:12];

    v314 = (void *)v152;
    uint64_t v153 = [v150 ndArrayWithCommandBuffer:v361 descriptor:v152 aliasing:1];
    uint64_t v154 = [v19 mhaMatMulKernelWithScale];
    v331 = (void *)v138;
    v382[0] = v138;
    v382[1] = v141;
    v324 = (void *)v141;
    unint64_t v155 = [MEMORY[0x1E4F1C978] arrayWithObjects:v382 count:2];
    v309 = (void *)v153;
    [v154 encodeToCommandBuffer:v361 sourceArrays:v155 destinationArray:v153];

    uint64_t v156 = [v19 mhaQKSoftmaxResultMatrix];

    v321 = v149;
    if (v156)
    {
      v157 = [v19 mhaQKSoftmaxResultMatrix];
      v158 = [v157 data];
    }
    else
    {
      v158 = objc_msgSend(v328, "newBufferWithLength:options:", objc_msgSend(v150, "matrixBytes") * objc_msgSend(v150, "matrices"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
      v157 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v158 descriptor:v149];
      [v19 setMhaQKSoftmaxResultMatrix:v157];
    }

    v364 = [v19 mhaQKSoftmaxResultMatrix];
    v159 = (void *)MEMORY[0x1E01B11E0]();
    unint64_t v160 = [v150 columns];
    [v19 setResult:v158];
    v354 = [v150 data];
    id v359 = v158;
    unint64_t v161 = [v19 mhaMaskSoftmaxForwardKernel];
    unint64_t v162 = [v161 maxTotalThreadsPerThreadgroup];

    if (v162 > v160)
    {
      unint64_t v163 = 1 << -(char)__clz(v160);
      if ((v160 & (v160 - 1)) != 0) {
        unint64_t v164 = v163;
      }
      else {
        unint64_t v164 = v160;
      }
      char v165 = [v19 mhaMaskSoftmaxForwardKernel];
      unint64_t v166 = [v165 threadExecutionWidth];

      if (v164 <= v166) {
        unint64_t v162 = v166;
      }
      else {
        unint64_t v162 = v164;
      }
    }
    long long v373 = 0u;
    memset(v374, 0, 28);
    long long v372 = 0u;
    int v349 = [v19 mhaHasKeyMask];
    v367 = v150;
    if (([v19 mhaHasAttentionMask] & 1) != 0 || objc_msgSend(v19, "mhaHasKeyMask"))
    {
      LODWORD(v372) = [v150 matrices];
      DWORD1(v372) = [v150 rows];
      DWORD2(v372) = 1;
      HIDWORD(v372) = [v150 columns];
      LODWORD(v374[1]) = v307;
      if ([v19 mhaHasAttentionMask])
      {
        if (v349) {
          uint64_t v167 = 4;
        }
        else {
          uint64_t v167 = 3;
        }
        char v168 = [v315 objectAtIndexedSubscript:v167];
        id v169 = [v168 descriptor];
        if ([v169 isFloatingPoint]) {
          int v170 = 1;
        }
        else {
          int v170 = 2;
        }
        DWORD1(v374[1]) = v170;

        id v171 = [v315 objectAtIndexedSubscript:v167];
        id v172 = [v171 descriptor];
        uint64_t v173 = [v172 shape];
        __int16 v174 = [v173 objectAtIndexedSubscript:0];
        LODWORD(v373) = [v174 unsignedIntegerValue];

        unint64_t v150 = v367;
        DWORD1(v373) = [v367 rows];
        DWORD2(v373) = 1;
        BOOL v175 = [v315 objectAtIndexedSubscript:v167];
        __int16 v176 = [v175 descriptor];
        unint64_t v177 = [v176 shape];
        id v178 = [v177 objectAtIndexedSubscript:2];
        HIDWORD(v373) = [v178 unsignedIntegerValue];

        uint64_t v19 = v351;
      }
      else
      {
        DWORD1(v374[1]) = 0;
      }
      if ([v19 mhaHasKeyMask])
      {
        DWORD2(v374[1]) = 1;
        LODWORD(v374[0]) = [v19 batchSize];
        *(void *)((char *)v374 + 4) = 0x100000001;
        unint64_t v179 = [v315 objectAtIndexedSubscript:3];
        int v180 = [v179 descriptor];
        unint64_t v181 = [v180 shape];
        uint64_t v182 = [v181 objectAtIndexedSubscript:1];
        HIDWORD(v374[0]) = [v182 unsignedIntegerValue];
      }
      else
      {
        DWORD2(v374[1]) = 0;
      }
      unint64_t v121 = 0x1E4F35000;
    }
    uint64_t v183 = [v150 matrices];
    uint64_t v184 = [v150 rows];
    uint64_t v376 = v160 | 0x200000000;
    LODWORD(v377) = v162 >= (int)v160;
    HIDWORD(v377) = 1;
    LODWORD(v378) = v160;
    uint64_t v185 = [v361 computeCommandEncoderWithDispatchType:0];
    if (v377) {
      [v351 mhaMaskSoftmaxForwardKernel];
    }
    else {
    char v186 = [v351 mhaMaskSoftmaxFastForwardKernel];
    }
    [v185 setComputePipelineState:v186];

    [v185 setBuffer:v354 offset:0 atIndex:0];
    [v185 setBuffer:v359 offset:0 atIndex:1];

    if ([v351 mhaHasAttentionMask])
    {
      if (v349) {
        uint64_t v187 = 4;
      }
      else {
        uint64_t v187 = 3;
      }
      char v188 = [v315 objectAtIndexedSubscript:v187];
      long long v189 = [v188 descriptor];
      if ([v189 isFloatingPoint]) {
        uint64_t v190 = 2;
      }
      else {
        uint64_t v190 = 3;
      }

      long long v191 = [v315 objectAtIndexedSubscript:v187];
      long long v192 = [v191 deviceMemory];
      int64x2_t v193 = [v192 objectAtIndexedSubscript:v356];
      [v185 setBuffer:v193 offset:0 atIndex:v190];

      unint64_t v121 = 0x1E4F35000;
    }
    if ([v351 mhaHasKeyMask])
    {
      unint64_t v194 = [v315 objectAtIndexedSubscript:3];
      int64x2_t v195 = [v194 deviceMemory];
      v196 = [v195 objectAtIndexedSubscript:v356];
      [v185 setBuffer:v196 offset:0 atIndex:4];

      unint64_t v121 = 0x1E4F35000uLL;
    }
    [v185 setBytes:&v376 length:20 atIndex:5];
    [v185 setBytes:&v372 length:60 atIndex:6];
    [v185 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * (v162 + v162 * (int)v377)) atIndex:0];
    v371[0] = 1;
    v371[1] = v184 * v183;
    v371[2] = 1;
    unint64_t v369 = v162;
    int64x2_t v370 = vdupq_n_s64(1uLL);
    [v185 dispatchThreadgroups:v371 threadsPerThreadgroup:&v369];
    [v185 endEncoding];

    uint64_t v197 = [v351 mhaMatMulSourcesQKV];
    uint64_t v198 = [v197 objectAtIndexedSubscript:2];

    unint64_t v199 = [v351 mhaMatMulSourcesQKV];
    unint64_t v200 = [v199 count];

    if (v200 > 3)
    {
      long long v202 = [v351 mhaMatMulSourcesQKV];
      long long v206 = [v202 objectAtIndexedSubscript:3];
    }
    else
    {
      long long v201 = [v351 mhaMatrixDescriptors];
      long long v202 = [v201 objectAtIndexedSubscript:13];

      long long v203 = objc_msgSend(v328, "newBufferWithLength:options:", objc_msgSend(v202, "matrixBytes") * objc_msgSend(v202, "matrices"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
      uint64_t v204 = [objc_alloc(*(Class *)(v121 + 1560)) initWithBuffer:v203 descriptor:v202];
      long long v205 = [v351 mhaMatMulSourcesQKV];
      [v205 setObject:v204 atIndexedSubscript:3];

      long long v206 = (void *)v204;
    }

    v207 = [v351 mhaNDArrayDescriptors];
    uint64_t v208 = [v207 objectAtIndexedSubscript:11];

    v308 = v198;
    v305 = (void *)v208;
    uint64_t v209 = [v198 ndArrayWithCommandBuffer:v361 descriptor:v208 aliasing:1];
    v210 = [v351 mhaNDArrayDescriptors];
    uint64_t v211 = [v210 objectAtIndexedSubscript:12];

    v303 = (void *)v211;
    v212 = [v364 ndArrayWithCommandBuffer:v361 descriptor:v211 aliasing:1];
    v213 = [v212 descriptor];
    [v213 transposeDimension:0 withDimension:1];
    v301 = v213;
    v302 = v212;
    uint64_t v214 = [v212 arrayViewWithCommandBuffer:v361 descriptor:v213 aliasing:1];
    v215 = [v351 mhaNDArrayDescriptors];
    uint64_t v216 = [v215 objectAtIndexedSubscript:13];

    v299 = (void *)v216;
    uint64_t v217 = [v206 ndArrayWithCommandBuffer:v361 descriptor:v216 aliasing:1];
    v218 = [v351 mhaMatMulKernel];
    v304 = (void *)v209;
    v381[0] = v209;
    v381[1] = v214;
    v300 = (void *)v214;
    v219 = [MEMORY[0x1E4F1C978] arrayWithObjects:v381 count:2];
    v355 = (void *)v217;
    [v218 encodeToCommandBuffer:v361 sourceArrays:v219 destinationArray:v217];

    v220 = [v351 mhaMatrixDescriptors];
    uint64_t v221 = [v220 objectAtIndexedSubscript:2];

    id v222 = objc_alloc(*(Class *)(v121 + 1560));
    v306 = v206;
    v223 = [v206 data];
    v298 = (void *)v221;
    v224 = (void *)[v222 initWithBuffer:v223 descriptor:v221];

    v225 = [v351 mhaNDArrayDescriptors];
    uint64_t v226 = [v225 objectAtIndexedSubscript:2];

    v296 = (void *)v226;
    v297 = v224;
    v227 = [v224 ndArrayWithCommandBuffer:v361 descriptor:v226 aliasing:1];
    v228 = [v227 descriptor];
    [v228 transposeDimension:0 withDimension:1];
    v294 = v228;
    v295 = v227;
    uint64_t v229 = [v227 arrayViewWithCommandBuffer:v361 descriptor:v228 aliasing:1];
    v230 = [v351 mhaMatrixDescriptors];
    uint64_t v231 = [v230 objectAtIndexedSubscript:14];

    id v232 = objc_alloc(*(Class *)(v121 + 1560));
    v233 = [v351 exportableState];
    v234 = [v233 objectAtIndexedSubscript:3];
    v292 = (void *)v231;
    v235 = (void *)[v232 initWithBuffer:v234 descriptor:v231];

    v236 = [v351 mhaNDArrayDescriptors];
    uint64_t v237 = [v236 objectAtIndexedSubscript:14];

    v291 = (void *)v237;
    v238 = [v235 ndArrayWithCommandBuffer:v361 descriptor:v237 aliasing:1];
    v239 = [v238 descriptor];
    [v239 transposeDimension:0 withDimension:1];
    v289 = v239;
    v290 = v238;
    v240 = [v238 arrayViewWithCommandBuffer:v361 descriptor:v239 aliasing:1];
    v241 = [v351 mhaMatrixDescriptors];
    uint64_t v242 = [v241 objectAtIndexedSubscript:15];

    id v243 = objc_alloc(*(Class *)(v121 + 1560));
    v244 = [v310 objectAtIndexedSubscript:v356];
    v288 = (void *)v242;
    v245 = (void *)[v243 initWithBuffer:v244 descriptor:v242];

    v246 = [v351 mhaNDArrayDescriptors];
    uint64_t v247 = [v246 objectAtIndexedSubscript:15];

    v286 = (void *)v247;
    v287 = v245;
    uint64_t v248 = [v245 ndArrayWithCommandBuffer:v361 descriptor:v247 aliasing:1];
    v249 = [v351 mhaMatMulKernel];
    v293 = (void *)v229;
    v380[0] = v229;
    v380[1] = v240;
    v250 = [MEMORY[0x1E4F1C978] arrayWithObjects:v380 count:2];
    v350 = (void *)v248;
    [v249 encodeToCommandBuffer:v361 sourceArrays:v250 destinationArray:v248];

    v251 = v351;
    v252 = v367;
    if ([v351 mhaHasBias])
    {
      v253 = [v351 mhaMatrixDescriptorsForBias];
      v254 = [v253 objectAtIndexedSubscript:3];

      id v255 = objc_alloc(*(Class *)(v121 + 1560));
      v256 = [v351 exportableState];
      v257 = [v256 objectAtIndexedSubscript:7];
      v258 = (void *)[v255 initWithBuffer:v257 descriptor:v254];

      v259 = [v351 mhaNDArrayDescriptorsForBias];
      v260 = [v259 objectAtIndexedSubscript:3];

      v261 = [v258 ndArrayWithCommandBuffer:v361 descriptor:v260 aliasing:1];
      v262 = [v351 mhaBiasAddKernel];
      v379[0] = v350;
      v379[1] = v261;
      v263 = [MEMORY[0x1E4F1C978] arrayWithObjects:v379 count:2];
      [v262 encodeToCommandBuffer:v361 sourceArrays:v263 destinationArray:v350];

      v252 = v367;
      v251 = v351;
    }
    v264 = [v251 mhaDropoutForwardKernel];

    v265 = v355;
    if (v264)
    {
      v266 = [(MLCDeviceGPU *)v360 gpuWriteTensorKernelList];
      v267 = [v266 objectAtIndexedSubscript:v356];
      +[MLCGPUHelper allocateMPSImageBatchForTensor:commandBuffer:kernel:batchSize:heapAllocator:imageBatchIsTemporary:](MLCGPUHelper, "allocateMPSImageBatchForTensor:commandBuffer:kernel:batchSize:heapAllocator:imageBatchIsTemporary:", v285, v361, v267, [v251 batchSize], 0, v284);
      v268 = (MPSImageBatch *)objc_claimAutoreleasedReturnValue();

      if (v284 && v312) {
        MPSImageBatchIncrementReadCount(v268, 1);
      }
      v269 = [(MLCDeviceGPU *)v360 gpuWriteTensorKernelList];
      v270 = [v269 objectAtIndexedSubscript:v356];
      v271 = [v310 objectAtIndexedSubscript:v356];
      v272 = [v285 descriptor];
      +[MLCGPUHelper copyMTLBufferToMPSImageBatch:commandBuffer:sourceMTLBuffer:destinationImageBatch:MLCDataType:](MLCGPUHelper, "copyMTLBufferToMPSImageBatch:commandBuffer:sourceMTLBuffer:destinationImageBatch:MLCDataType:", v270, v361, v271, v268, [v272 dataType]);

      v273 = [v351 mhaDropoutForwardKernel];
      v274 = [MEMORY[0x1E4F35978] defaultAllocator];
      [v273 setDestinationImageAllocator:v274];

      id v368 = 0;
      v275 = [v273 encodeBatchToCommandBuffer:v361 sourceImages:v268 destinationStates:&v368 destinationStateIsTemporary:v284];
      id v276 = v368;
      v277 = v268;
      [v351 setMhaDropoutSource:v268];
      [v351 setMhaDropoutState:v276];

      v278 = [(MLCDeviceGPU *)v360 gpuReadTensorKernelList];
      v279 = [v278 objectAtIndexedSubscript:v356];
      v280 = [v310 objectAtIndexedSubscript:v356];
      v281 = [v285 descriptor];
      +[MLCGPUHelper copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:](MLCGPUHelper, "copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:", v279, v361, v275, v280, [v281 dataType]);

      v251 = v351;
      v252 = v367;
      v265 = v355;
    }
    if (v312) {
      [v251 setSource:v293];
    }

    uint64_t v18 = v356 + 1;
  }
  while (v356 + 1 < [(MLCDeviceGPU *)v360 numDevicesToUse]);
LABEL_104:
}

- (void)dispatchGradientMHALayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5 resultStateIsTemporary:(BOOL)a6
{
  BOOL v348 = a6;
  uint64_t v402 = *MEMORY[0x1E4F143B8];
  id v283 = a3;
  id v9 = a4;
  id v10 = a5;
  v281 = (void *)MEMORY[0x1E01B11E0]();
  id v11 = [v9 descriptor];
  uint64_t v12 = [v11 stride];
  v329 = v9;
  uint64_t v13 = [v9 descriptor];
  uint64_t v14 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v13, "dimensionCount") - 1);
  uint64_t v333 = [v14 unsignedIntegerValue];

  id v15 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v389 = 0u;
  long long v390 = 0u;
  long long v391 = 0u;
  long long v392 = 0u;
  id obj = v10;
  uint64_t v16 = [obj countByEnumeratingWithState:&v389 objects:v401 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v390;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v390 != v18) {
          objc_enumerationMutation(obj);
        }
        [(MLCDeviceGPU *)self allocateResultTensor:*(void *)(*((void *)&v389 + 1) + 8 * i)];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v389 objects:v401 count:16];
    }
    while (v17);
  }

  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v20 = 0;
    unint64_t v21 = 0x1E4F35000uLL;
    long long v373 = self;
    v282 = v15;
    do
    {
      uint64_t v22 = [v283 objectAtIndexedSubscript:v20];
      unint64_t v23 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      uint64_t v24 = [v23 objectAtIndexedSubscript:v20];

      id v25 = [(MLCDeviceGPU *)self deviceList];
      uint64_t v356 = [v25 objectAtIndexedSubscript:v20];

      uint64_t v26 = [v22 mhaDropoutGradientKernel];

      uint64_t v374 = v20;
      int v349 = v22;
      long long v372 = (void *)v24;
      if (v26)
      {
        uint64_t v27 = [v22 batchSize];
        uint64_t v28 = [(MLCDeviceGPU *)self gpuWriteTensorKernelList];
        int64x2_t v29 = [v28 objectAtIndexedSubscript:v20];
        id v30 = [v329 deviceMemory];
        BOOL v31 = [v30 objectAtIndexedSubscript:v374];
        [v329 descriptor];
        v33 = id v32 = v15;
        BOOL v34 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:](MLCGPUHelper, "allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:", v329, v372, v27, v29, v31, [v33 dataType], 0);

        uint64_t v35 = [v22 mhaDropoutGradientKernel];
        uint64_t v36 = [MEMORY[0x1E4F35978] defaultAllocator];
        [v35 setDestinationImageAllocator:v36];

        uint64_t v37 = [v22 batchSize];
        uint64_t v38 = [v22 mhaDropoutSource];
        id v39 = objc_msgSend(v38, "subarrayWithRange:", 0, v37);
        uint64_t v40 = [v22 mhaDropoutState];
        id v41 = [v35 encodeBatchToCommandBuffer:v372 sourceGradients:v34 sourceImages:v39 gradientStates:v40];

        uint64_t v42 = [v329 deviceMemory];
        unint64_t v43 = [v42 objectAtIndexedSubscript:v374];
        uint64_t v44 = [v43 length];

        unint64_t v45 = [(MLCDeviceGPU *)v373 gpuHeapTemporaryResourceAllocator];
        id v46 = objc_msgSend(v45, "objectAtIndexedSubscript:", objc_msgSend(v22, "temporaryHeapIndex"));
        uint64_t v47 = [v46 allocateBuffer:v44];

        id v48 = [(MLCDeviceGPU *)v373 gpuReadTensorKernelList];
        id v49 = [v48 objectAtIndexedSubscript:v374];
        uint64_t v50 = [v329 descriptor];
        +[MLCGPUHelper copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:](MLCGPUHelper, "copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:", v49, v372, v41, v47, [v50 dataType]);

        unint64_t v21 = 0x1E4F35000;
        id v15 = v32;
        uint64_t v24 = (uint64_t)v372;

        self = v373;
        [v15 setObject:v47 atIndexedSubscript:v374];

        uint64_t v20 = v374;
      }
      else
      {
        BOOL v34 = [v329 deviceMemory];
        uint64_t v35 = [v34 objectAtIndexedSubscript:v20];
        [v15 setObject:v35 atIndexedSubscript:v20];
      }

      uint64_t v51 = [v22 mhaMatrixDescriptors];
      uint64_t v52 = [v51 objectAtIndexedSubscript:15];

      id v53 = objc_alloc(*(Class *)(v21 + 1560));
      unsigned int v54 = [v15 objectAtIndexedSubscript:v20];
      v322 = (void *)v52;
      id v55 = (void *)[v53 initWithBuffer:v54 descriptor:v52];

      int v56 = [v22 mhaNDArrayDescriptors];
      uint64_t v57 = [v56 objectAtIndexedSubscript:15];

      unsigned int v320 = (void *)v57;
      v321 = v55;
      uint64_t v58 = [v55 ndArrayWithCommandBuffer:v24 descriptor:v57 aliasing:1];
      char v59 = [v58 descriptor];
      [v59 transposeDimension:0 withDimension:1];
      v332 = v58;
      v319 = v59;
      uint64_t v60 = [v58 arrayViewWithCommandBuffer:v24 descriptor:v59 aliasing:1];
      id v61 = [v22 mhaMatrixDescriptors];
      uint64_t v62 = [v61 objectAtIndexedSubscript:14];

      id v63 = objc_alloc(*(Class *)(v21 + 1560));
      id v64 = [v22 exportableState];
      uint64_t v65 = [v64 objectAtIndexedSubscript:3];
      v331 = (void *)v62;
      uint64_t v66 = (void *)[v63 initWithBuffer:v65 descriptor:v62];

      uint64_t v67 = [v22 mhaNDArrayDescriptors];
      uint64_t v68 = [v67 objectAtIndexedSubscript:14];

      uint64_t v317 = v66;
      uint64_t v330 = (void *)v68;
      uint64_t v69 = [v66 ndArrayWithCommandBuffer:v24 descriptor:v68 aliasing:1];
      int8x16_t v70 = [v69 descriptor];
      [v70 transposeDimension:0 withDimension:1];
      v315 = v70;
      v316 = v69;
      uint64_t v71 = [v69 arrayViewWithCommandBuffer:v24 descriptor:v70 aliasing:1];
      id v72 = [v22 mhaMatrixDescriptors];
      [v72 objectAtIndexedSubscript:2];
      v74 = uint64_t v73 = v24;

      unsigned int v75 = [(MLCDeviceGPU *)self gpuHeapTemporaryResourceAllocator];
      uint64_t v76 = objc_msgSend(v75, "objectAtIndexedSubscript:", objc_msgSend(v22, "temporaryHeapIndex"));
      uint64_t v77 = objc_msgSend(v76, "allocateBuffer:", objc_msgSend(v74, "matrixBytes") * objc_msgSend(v74, "matrices"));

      v327 = (void *)v77;
      char v313 = v74;
      uint64_t v78 = (void *)[objc_alloc(*(Class *)(v21 + 1560)) initWithBuffer:v77 descriptor:v74];
      uint64_t v79 = [v22 mhaNDArrayDescriptors];
      uint64_t v80 = [v79 objectAtIndexedSubscript:2];

      uint64_t v311 = (void *)v80;
      BOOL v312 = v78;
      uint64_t v81 = [v78 ndArrayWithCommandBuffer:v73 descriptor:v80 aliasing:1];
      uint64_t v82 = [v22 mhaMatMulKernel];
      v314 = (void *)v71;
      v400[0] = v71;
      v400[1] = v60;
      v318 = (void *)v60;
      uint64_t v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v400 count:2];
      v310 = (void *)v81;
      [v82 encodeToCommandBuffer:v73 sourceArrays:v83 destinationArray:v81];

      uint64_t v84 = 0;
      v341 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
      do
      {
        id v85 = [v22 mhaMatrixDescriptors];
        uint64_t v86 = [v85 objectAtIndexedSubscript:v84 + 9];

        uint64_t v87 = [(MLCDeviceGPU *)self gpuHeapTemporaryResourceAllocator];
        uint64_t v88 = objc_msgSend(v87, "objectAtIndexedSubscript:", objc_msgSend(v22, "temporaryHeapIndex"));
        uint64_t v89 = objc_msgSend(v88, "allocateBuffer:", objc_msgSend(v86, "matrices") * objc_msgSend(v86, "matrixBytes"));

        uint64_t v90 = (void *)[objc_alloc(*(Class *)(v21 + 1560)) initWithBuffer:v89 descriptor:v86];
        [v341 setObject:v90 atIndexedSubscript:v84];

        ++v84;
      }
      while (v84 != 3);
      uint64_t v91 = [v22 mhaMatrixDescriptors];
      uint64_t v92 = [v91 objectAtIndexedSubscript:13];

      v309 = (void *)v92;
      uint64_t v93 = (void *)[objc_alloc(*(Class *)(v21 + 1560)) initWithBuffer:v327 descriptor:v92];
      unint64_t v94 = [v22 mhaNDArrayDescriptors];
      uint64_t v95 = [v94 objectAtIndexedSubscript:13];

      int v307 = (void *)v95;
      v308 = v93;
      unint64_t v96 = [v93 ndArrayWithCommandBuffer:v73 descriptor:v95 aliasing:1];
      v328 = [v22 mhaQKSoftmaxResultMatrix];
      uint64_t v97 = [v22 mhaNDArrayDescriptors];
      uint64_t v98 = [v97 objectAtIndexedSubscript:12];

      uint64_t v326 = (void *)v98;
      uint64_t v99 = [v328 ndArrayWithCommandBuffer:v73 descriptor:v98 aliasing:1];
      id v100 = [v22 mhaNDArrayDescriptors];
      uint64_t v101 = [v100 objectAtIndexedSubscript:11];

      uint64_t v102 = [v341 objectAtIndexedSubscript:2];
      v304 = (void *)v101;
      uint64_t v103 = [v102 ndArrayWithCommandBuffer:v73 descriptor:v101 aliasing:1];

      unsigned int v104 = [v22 mhaMatMulKernel];
      v399[0] = v96;
      v305 = (void *)v99;
      v399[1] = v99;
      unint64_t v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:v399 count:2];
      uint64_t v106 = v73;
      v303 = (void *)v103;
      [v104 encodeToCommandBuffer:v73 sourceArrays:v105 destinationArray:v103];

      unsigned int v107 = [v96 descriptor];
      [v107 transposeDimension:0 withDimension:1];
      v306 = v96;
      v302 = v107;
      v325 = [v96 arrayViewWithCommandBuffer:v73 descriptor:v107 aliasing:1];
      unint64_t v108 = [v22 mhaMatMulSourcesQKV];
      id v109 = [v108 objectAtIndexedSubscript:2];

      uint64_t v110 = [v22 mhaNDArrayDescriptors];
      int v111 = [v110 objectAtIndexedSubscript:11];
      v301 = v109;
      v324 = [v109 ndArrayWithCommandBuffer:v73 descriptor:v111 aliasing:1];

      uint64_t v112 = [(MLCDeviceGPU *)self gpuHeapTemporaryResourceAllocator];
      uint64_t v113 = objc_msgSend(v112, "objectAtIndexedSubscript:", objc_msgSend(v22, "temporaryHeapIndex"));
      uint64_t v114 = objc_msgSend(v113, "allocateBuffer:", objc_msgSend(v328, "matrices") * objc_msgSend(v328, "matrixBytes"));

      uint64_t v115 = [v22 mhaMatrixDescriptors];
      uint64_t v116 = [v115 objectAtIndexedSubscript:12];

      unint64_t v117 = (void *)[objc_alloc(*(Class *)(v21 + 1560)) initWithBuffer:v114 descriptor:v116];
      uint64_t v118 = [v22 mhaNDArrayDescriptors];
      uint64_t v119 = [v118 objectAtIndexedSubscript:12];

      v297 = (void *)v119;
      v298 = v117;
      uint64_t v120 = [v117 ndArrayWithCommandBuffer:v106 descriptor:v119 aliasing:1];
      unint64_t v121 = [v22 mhaMatMulKernel];
      v398[0] = v325;
      v398[1] = v324;
      uint64_t v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:v398 count:2];
      uint64_t v123 = v106;
      unint64_t v124 = v114;
      v296 = (void *)v120;
      [v121 encodeToCommandBuffer:v123 sourceArrays:v122 destinationArray:v120];

      id v125 = [(MLCDeviceGPU *)self gpuHeapTemporaryResourceAllocator];
      unint64_t v126 = objc_msgSend(v125, "objectAtIndexedSubscript:", objc_msgSend(v22, "temporaryHeapIndex"));
      uint64_t v127 = objc_msgSend(v126, "allocateBuffer:", objc_msgSend(v114, "length"));

      v299 = (void *)v116;
      uint64_t v128 = (void *)[objc_alloc(*(Class *)(v21 + 1560)) initWithBuffer:v127 descriptor:v116];
      unint64_t context = (void *)MEMORY[0x1E01B11E0]();
      unint64_t v129 = [v328 columns];
      uint64_t v130 = [v22 mhaSoftmaxGradientKernel];
      unint64_t v131 = [v130 maxTotalThreadsPerThreadgroup];

      unint64_t v132 = 1 << -(char)__clz(v129);
      if ((v129 & (v129 - 1)) == 0) {
        unint64_t v132 = v129;
      }
      if (v131 > v129) {
        unint64_t v131 = v132;
      }
      uint64_t v133 = [v328 matrices];
      uint64_t v134 = [v328 rows] * v133;
      int v377 = v129;
      int v378 = 2;
      LODWORD(v379) = v131 >= (int)v129;
      HIDWORD(v379) = 1;
      int v380 = v129;
      uint64_t v135 = [v372 computeCommandEncoderWithDispatchType:0];
      signed int v136 = [v22 mhaSoftmaxGradientKernel];
      [v135 setComputePipelineState:v136];

      v300 = v124;
      [v135 setBuffer:v124 offset:0 atIndex:0];
      v295 = (void *)v127;
      [v135 setBuffer:v127 offset:0 atIndex:1];
      uint64_t v137 = [v22 result];
      [v135 setBuffer:v137 offset:0 atIndex:2];

      [v135 setBytes:&v377 length:20 atIndex:3];
      [v135 setThreadgroupMemoryLength:GPU_AlignForThreadGroupMemorySize(4 * (v131 + v131 * (int)v379)) atIndex:0];
      v388[0] = 1;
      v388[1] = v134;
      v388[2] = 1;
      unint64_t v386 = v131;
      int64x2_t v387 = vdupq_n_s64(1uLL);
      [v135 dispatchThreadgroups:v388 threadsPerThreadgroup:&v386];
      [v135 endEncoding];

      v294 = v128;
      uint64_t v323 = [v128 ndArrayWithCommandBuffer:v372 descriptor:v326 aliasing:1];
      uint64_t v138 = [v323 descriptor];
      [v138 transposeDimension:0 withDimension:1];
      v293 = v138;
      uint64_t v139 = [v323 arrayViewWithCommandBuffer:v372 descriptor:v138 aliasing:1];
      uint64_t v140 = [v22 mhaMatMulSourcesQKV];
      uint64_t v141 = [v140 objectAtIndexedSubscript:1];

      v142 = [v22 mhaNDArrayDescriptors];
      uint64_t v143 = [v142 objectAtIndexedSubscript:9];

      uint64_t v144 = [v22 mhaNDArrayDescriptors];
      uint64_t v145 = [v144 objectAtIndexedSubscript:10];

      v291 = v141;
      uint64_t v146 = [v141 ndArrayWithCommandBuffer:v372 descriptor:v145 aliasing:1];
      v147 = [v341 objectAtIndexedSubscript:0];
      uint64_t v148 = [v147 ndArrayWithCommandBuffer:v372 descriptor:v143 aliasing:1];

      unint64_t v149 = [v22 mhaMatMulKernelWithScale];
      v288 = (void *)v146;
      v397[0] = v146;
      v292 = (void *)v139;
      v397[1] = v139;
      unint64_t v150 = [MEMORY[0x1E4F1C978] arrayWithObjects:v397 count:2];
      v287 = (void *)v148;
      [v149 encodeToCommandBuffer:v372 sourceArrays:v150 destinationArray:v148];

      unint64_t v151 = [v22 mhaMatMulSourcesQKV];
      uint64_t v152 = [v151 objectAtIndexedSubscript:0];

      v286 = v152;
      v290 = (void *)v143;
      uint64_t v153 = [v152 ndArrayWithCommandBuffer:v372 descriptor:v143 aliasing:1];
      uint64_t v154 = [v341 objectAtIndexedSubscript:1];
      v289 = (void *)v145;
      uint64_t v155 = [v154 ndArrayWithCommandBuffer:v372 descriptor:v145 aliasing:1];

      uint64_t v156 = [v22 mhaMatMulKernelWithScale];
      v285 = (void *)v153;
      v396[0] = v153;
      v396[1] = v323;
      v157 = [MEMORY[0x1E4F1C978] arrayWithObjects:v396 count:2];
      BOOL v284 = (void *)v155;
      [v156 encodeToCommandBuffer:v372 sourceArrays:v157 destinationArray:v155];

      v158 = [v341 objectAtIndexedSubscript:0];
      v159 = [v158 data];
      v395[0] = v159;
      unint64_t v160 = [v341 objectAtIndexedSubscript:1];
      unint64_t v161 = [v160 data];
      v395[1] = v161;
      unint64_t v162 = [v341 objectAtIndexedSubscript:2];
      unint64_t v163 = [v162 data];
      v395[2] = v163;
      unint64_t v164 = [MEMORY[0x1E4F1C978] arrayWithObjects:v395 count:3];
      id v368 = (void *)[v164 mutableCopy];

      v335 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      if (([v22 mhaHasAttnBias] & 1) != 0 || objc_msgSend(v22, "mhaHasZeroAttention"))
      {
        int v165 = [v22 mhaHasZeroAttention];
        int v350 = [v22 mhaHasAttnBias];
        uint64_t v166 = [v22 batchSize];
        uint64_t v167 = 0;
        uint64_t v336 = v166 * v333;
        int v338 = v166;
        int v334 = v350 + v165;
        char v168 = 1;
        do
        {
          char v345 = v168;
          uint64_t v342 = v167;
          uint64_t v169 = v167 + 1;
          int v170 = [obj objectAtIndexedSubscript:v167 + 1];
          id v171 = [v170 descriptor];
          id v172 = [v171 shape];
          char v173 = 1;
          __int16 v174 = [v172 objectAtIndexedSubscript:1];
          uint64_t v175 = [v174 unsignedIntegerValue];

          uint64_t v176 = [v349 mhaModelDimension];
          uint64_t v353 = v169;
          contexta = [v368 objectAtIndexedSubscript:v169];
          uint64_t v363 = v336 * v176;
          uint64_t v365 = v175;
          int v360 = v334 + v175;
          int v357 = v176 * v338;
          while (1)
          {
            unint64_t v177 = +[MLCGPUHelper mtlResourceOptions];
            uint64_t v178 = (v173 & 1) != 0 ? v365 : 1;
            int v179 = (v173 & 1) != 0 ? 0 : v365;
            int v180 = (void *)[v356 newBufferWithLength:v363 * v178 options:v177];
            int v384 = v179;
            int v377 = v178;
            int v378 = v357;
            uint64_t v379 = 0x100000001;
            int v380 = v360;
            uint64_t v381 = 0x100000001;
            int v382 = v178;
            int v383 = 1;
            uint64_t v385 = 0x100000000;
            unint64_t v181 = [(MLCDeviceGPU *)v373 gpuPipelineStatesConcatFloat];
            uint64_t v182 = [v181 objectAtIndexedSubscript:v374];
            unint64_t v183 = [v182 maxTotalThreadsPerThreadgroup];

            unint64_t v184 = v377;
            if (v183 <= v377)
            {
              unint64_t v187 = v378;
              unint64_t v185 = 1;
              unint64_t v184 = v183;
              unint64_t v186 = (v183 + v377 - 1) / v183;
            }
            else
            {
              unint64_t v185 = v183 / v377 >= v378 ? v378 : v183 / v377;
              unint64_t v186 = 1;
              unint64_t v187 = (v378 + v185 - 1) / v185;
            }
            uint64_t v188 = (int)v379;
            long long v189 = [v372 computeCommandEncoderWithDispatchType:0];
            uint64_t v190 = [(MLCDeviceGPU *)v373 gpuPipelineStatesConcatFloat];
            long long v191 = [v190 objectAtIndexedSubscript:v374];
            [v189 setComputePipelineState:v191];

            [v189 setBuffer:contexta offset:0 atIndex:0];
            [v189 setBuffer:v180 offset:0 atIndex:1];
            [v189 setBytes:&v377 length:48 atIndex:2];
            v376[0] = v186;
            v376[1] = v187;
            v376[2] = v188;
            v375[0] = v184;
            v375[1] = v185;
            v375[2] = 1;
            [v189 dispatchThreadgroups:v376 threadsPerThreadgroup:v375];
            [v189 endEncoding];
            if ((v173 & 1) == 0) {
              break;
            }
            [v368 setObject:v180 atIndexedSubscript:v353];

            char v192 = v350 & v173;
            char v173 = 0;
            if ((v192 & 1) == 0) {
              goto LABEL_39;
            }
          }
          [v335 setObject:v180 atIndexedSubscript:v342];

LABEL_39:
          char v168 = 0;
          uint64_t v167 = 1;
        }
        while ((v345 & 1) != 0);
      }
      v346 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      int64x2_t v193 = 0;
      unint64_t v194 = 0;
      int64x2_t v195 = v349;
      v196 = v372;
      do
      {
        contextb = v193;
        if (v194 == 3)
        {
          id v364 = v331;
          id v197 = v330;
          id v198 = v332;
        }
        else
        {
          unint64_t v199 = [v195 mhaMatrixDescriptors];
          v366 = [v199 objectAtIndexedSubscript:v193 + 2];

          id v200 = objc_alloc(MEMORY[0x1E4F35618]);
          long long v201 = [v368 objectAtIndexedSubscript:v194];
          int v358 = (void *)[v200 initWithBuffer:v201 descriptor:v366];

          long long v202 = [v195 mhaNDArrayDescriptors];
          v354 = [v202 objectAtIndexedSubscript:v193 + 2];

          v351 = [v358 ndArrayWithCommandBuffer:v196 descriptor:v354 aliasing:1];
          v343 = [v351 descriptor];
          [v343 transposeDimension:0 withDimension:1];
          uint64_t v339 = [v351 arrayViewWithCommandBuffer:v196 descriptor:v343 aliasing:1];
          long long v203 = [v195 mhaMatrixDescriptors];
          uint64_t v204 = v193 + 1;
          id v364 = [v203 objectAtIndexedSubscript:v193 + 1];

          id v205 = objc_alloc(MEMORY[0x1E4F35618]);
          long long v206 = [v195 exportableState];
          v207 = [v206 objectAtIndexedSubscript:v194];
          v337 = (void *)[v205 initWithBuffer:v207 descriptor:v364];

          uint64_t v208 = [v195 mhaNDArrayDescriptors];
          uint64_t v361 = [v208 objectAtIndexedSubscript:v204];

          uint64_t v209 = [v337 ndArrayWithCommandBuffer:v196 descriptor:v361 aliasing:1];
          v210 = [v195 mhaMatrixDescriptors];
          uint64_t v211 = [v210 objectAtIndexedSubscript:contextb];

          id v212 = objc_alloc(MEMORY[0x1E4F35618]);
          v213 = [obj objectAtIndexedSubscript:v194];
          [v213 deviceMemory];
          v215 = uint64_t v214 = v196;
          uint64_t v216 = [v215 objectAtIndexedSubscript:v374];
          uint64_t v217 = (void *)[v212 initWithBuffer:v216 descriptor:v211];

          v218 = [v195 mhaNDArrayDescriptors];
          v219 = [v218 objectAtIndexedSubscript:contextb];

          v220 = [v217 ndArrayWithCommandBuffer:v214 descriptor:v219 aliasing:1];
          uint64_t v221 = [v195 mhaMatMulKernel];
          id v198 = (id)v339;
          v394[0] = v339;
          v394[1] = v209;
          id v222 = [MEMORY[0x1E4F1C978] arrayWithObjects:v394 count:2];
          [v221 encodeToCommandBuffer:v214 sourceArrays:v222 destinationArray:v220];

          id v197 = (id)v361;
          int64x2_t v193 = contextb;
        }
        if (v348)
        {
          v196 = v372;
          v223 = [MEMORY[0x1E4F35980] temporaryMatrixWithCommandBuffer:v372 matrixDescriptor:v364];
          int64x2_t v195 = v349;
        }
        else
        {
          int64x2_t v195 = v349;
          v224 = [v349 gradientState];
          unint64_t v225 = [v224 count];

          v196 = v372;
          if (v225 <= v194)
          {
            v227 = [v349 exportableState];
            v228 = [v227 objectAtIndexedSubscript:v194];
            uint64_t v229 = objc_msgSend(v356, "newBufferWithLength:options:", objc_msgSend(v228, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

            v223 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v229 descriptor:v364];
          }
          else
          {
            uint64_t v226 = [v349 gradientState];
            v223 = [v226 objectAtIndexedSubscript:v194];
          }
        }
        [v197 setPreferPackedRows:1];
        v367 = [v223 ndArrayWithCommandBuffer:v196 descriptor:v197 aliasing:1];
        v230 = [v198 descriptor];
        [v230 transposeDimension:0 withDimension:1];
        v352 = v230;
        uint64_t v231 = [v198 arrayViewWithCommandBuffer:v196 descriptor:v230 aliasing:1];
        if (v194 == 3)
        {
          uint64_t v232 = [v195 source];
        }
        else
        {
          v233 = [v195 mhaSourcesQKV];
          uint64_t v232 = [v233 objectAtIndexedSubscript:v194];
        }
        v234 = [v195 mhaMatMulKernel];
        id v359 = (void *)v231;
        v393[0] = v231;
        v355 = (void *)v232;
        v393[1] = v232;
        v235 = [MEMORY[0x1E4F1C978] arrayWithObjects:v393 count:2];
        v236 = [v234 encodeToCommandBuffer:v196 sourceArrays:v235];

        uint64_t v237 = [v195 mhaReduceSumKernels];
        v238 = [v237 objectAtIndexedSubscript:0];
        [v238 encodeToCommandBuffer:v196 sourceArray:v236 destinationArray:v367];

        v239 = [v195 gradientState];
        [v239 setObject:v223 atIndexedSubscript:v194];

        if ([v195 mhaHasBias])
        {
          v344 = v223;
          uint64_t v240 = [v195 mhaModelDimension];
          v241 = [v195 mhaMatrixDescriptorsForBias];
          uint64_t v242 = [v241 objectAtIndexedSubscript:3];

          id v362 = v197;
          v340 = (void *)v242;
          if (v348)
          {
            id v243 = [MEMORY[0x1E4F35980] temporaryMatrixWithCommandBuffer:v196 matrixDescriptor:v242];
          }
          else
          {
            v244 = [v195 gradientState];
            unint64_t v245 = [v244 count];

            if (v245 < 5)
            {
              v246 = objc_msgSend(v356, "newBufferWithLength:options:", v240 * v333, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
              uint64_t v247 = [objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v246 descriptor:v242];
            }
            else
            {
              v246 = [v195 gradientState];
              uint64_t v247 = [v246 objectAtIndexedSubscript:v194 + 4];
            }
            id v243 = (void *)v247;
          }
          uint64_t v248 = [v195 mhaNDArrayDescriptorsForBias];
          v249 = [v248 objectAtIndexedSubscript:3];

          v250 = [v243 ndArrayWithCommandBuffer:v196 descriptor:v249 aliasing:1];
          id v251 = v198;
          v252 = [v195 mhaReduceSumKernels];
          [v252 objectAtIndexedSubscript:0];
          v254 = id v253 = v198;
          id v255 = [v254 encodeToCommandBuffer:v196 sourceArray:v251];

          int64x2_t v195 = v349;
          v256 = [v349 mhaReduceSumKernels];
          v257 = [v256 objectAtIndexedSubscript:1];
          [v257 encodeToCommandBuffer:v372 sourceArray:v255 destinationArray:v250];

          [v346 setObject:v243 atIndexedSubscript:v194];
          v196 = v372;

          id v198 = v253;
          int64x2_t v193 = contextb;
          id v197 = v362;
          v223 = v344;
        }

        ++v194;
        v193 += 3;
      }
      while (v194 != 4);
      if ([v195 mhaHasAttnBias])
      {
        uint64_t v258 = 0;
        char v259 = 1;
        do
        {
          char v260 = v259;
          uint64_t v261 = [v195 mhaModelDimension];
          uint64_t v262 = [v195 batchSize];
          v263 = (void *)MEMORY[0x1E4F35640];
          v264 = [v329 descriptor];
          v265 = objc_msgSend(v263, "matrixDescriptorWithRows:columns:rowBytes:dataType:", 1, v261, v261 * v333, GPU_GetDataType(objc_msgSend(v264, "dataType")));

          if (v348)
          {
            v266 = v372;
            v267 = [MEMORY[0x1E4F35980] temporaryMatrixWithCommandBuffer:v372 matrixDescriptor:v265];
          }
          else
          {
            v268 = [v195 gradientState];
            unint64_t v269 = [v268 count];

            if (v269 < 5)
            {
              v270 = objc_msgSend(v356, "newBufferWithLength:options:", v261 * v333, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
              uint64_t v273 = [objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v270 descriptor:v265];
            }
            else
            {
              v270 = [v195 gradientState];
              int v271 = [v195 mhaHasBias];
              uint64_t v272 = 4;
              if (v271) {
                uint64_t v272 = 8;
              }
              uint64_t v273 = [v270 objectAtIndexedSubscript:v272 | v258];
            }
            v267 = (void *)v273;

            v266 = v372;
          }
          v274 = [v335 objectAtIndexedSubscript:v258];
          v275 = [v267 data];
          [(MLCDeviceGPU *)v373 reduceAcrossBatchForSource:v274 result:v275 batchSize:v262 batchStride:v261 numEntries:v261 deviceIndex:v374 commandBuffer:v266];

          int v276 = [v195 mhaHasBias];
          uint64_t v277 = 4;
          if (!v276) {
            uint64_t v277 = 0;
          }
          [v346 setObject:v267 atIndexedSubscript:v277 | v258];

          char v259 = 0;
          uint64_t v258 = 1;
        }
        while ((v260 & 1) != 0);
      }
      v278 = [v195 gradientState];
      unint64_t v279 = [v278 count];

      if (v279 <= 4)
      {
        v280 = [v195 gradientState];
        [v280 addObjectsFromArray:v346];
      }
      uint64_t v20 = v374 + 1;
      self = v373;
      unint64_t v21 = 0x1E4F35000;
      id v15 = v282;
    }
    while (v374 + 1 < [(MLCDeviceGPU *)v373 numDevicesToUse]);
  }
}

- (void)dispatchForwardLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultStateIsTemporary:(BOOL)a9 forTraining:(BOOL)a10
{
  id v64 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v63 = v15;
  [v15 deviceMemory];
  uint64_t v67 = v66 = v16;
  uint64_t v62 = [v16 deviceMemory];
  uint64_t v65 = v17;
  uint64_t v60 = [v17 deviceMemory];
  [(MLCDeviceGPU *)self allocateResultTensor:v18];
  unsigned int v74 = v18;
  id v61 = [v18 deviceMemory];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v19 = 0;
    uint64_t v73 = self;
    do
    {
      uint64_t v20 = [v64 objectAtIndexedSubscript:v19];
      unint64_t v21 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      uint64_t v78 = [v21 objectAtIndexedSubscript:v19];

      uint64_t v79 = [v20 forwardKernel];
      uint64_t v77 = [v20 reduceLossKernel];
      uint64_t v22 = [v20 batchSize];
      unint64_t v23 = [(MLCDeviceGPU *)self gpuWriteTensorKernelList];
      uint64_t v24 = [v23 objectAtIndexedSubscript:v19];
      id v25 = [v67 objectAtIndexedSubscript:v19];
      [v63 descriptor];
      uint64_t v27 = v26 = self;
      uint64_t v76 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:](MLCGPUHelper, "allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:", v63, v78, v22, v24, v25, [v27 dataType], 0);

      uint64_t v28 = [v20 batchSize];
      int64x2_t v29 = [(MLCDeviceGPU *)v26 gpuWriteTensorKernelList];
      id v30 = [v29 objectAtIndexedSubscript:v19];
      BOOL v31 = [v62 objectAtIndexedSubscript:v19];
      id v32 = [v66 descriptor];
      unsigned int v75 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:](MLCGPUHelper, "allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:", v66, v78, v28, v30, v31, [v32 dataType], 0);

      uint64_t v69 = v20;
      if (v65)
      {
        uint64_t v33 = [v20 batchSize];
        BOOL v34 = [(MLCDeviceGPU *)v73 gpuWriteTensorKernelList];
        uint64_t v35 = [v34 objectAtIndexedSubscript:v19];
        uint64_t v36 = [v60 objectAtIndexedSubscript:v19];
        uint64_t v37 = [v65 descriptor];
        uint64_t v38 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:](MLCGPUHelper, "allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:", v65, v78, v33, v35, v36, [v37 dataType], 0);
      }
      else
      {
        uint64_t v38 = 0;
      }
      if (a10)
      {
        v80[0] = 0;
        id v39 = [v79 encodeBatchToCommandBuffer:v78 sourceImages:v76 labels:v75 weights:v38 destinationStates:v80 destinationStateIsTemporary:a9];
        id v68 = v80[0];
      }
      else
      {
        id v39 = [v79 encodeBatchToCommandBuffer:v78 sourceImages:v76 labels:v75 weights:v38 destinationStates:0 destinationStateIsTemporary:a9];
        id v68 = 0;
      }
      self = v73;
      id v72 = (void *)v38;
      if (v77)
      {
        uint64_t v40 = [MEMORY[0x1E4F35978] defaultAllocator];
        [v77 setDestinationImageAllocator:v40];

        id v41 = [v77 encodeBatchToCommandBuffer:v78 sourceImages:v39];
      }
      else
      {
        id v41 = v39;
      }
      uint64_t v42 = v41;
      uint64_t v71 = v39;
      if ([(MLCDeviceGPU *)v73 numDevicesToUse] >= 2
        && [v79 reductionType] == 2)
      {
        unint64_t v43 = (void *)MEMORY[0x1E01B11E0]();
        uint64_t v44 = [v20 secondaryGradientKernel];
        GPU_ScaleMPSImageBatchWithKernel(v44, v78, v42, 1);
      }
      int8x16_t v70 = v42;
      unint64_t v45 = (void *)MEMORY[0x1E01B11E0]();
      id v46 = [v74 descriptor];
      uint64_t v47 = [v46 shape];
      id v48 = [v47 objectAtIndexedSubscript:0];
      unint64_t v49 = [v48 unsignedIntegerValue];
      if (v49 >= [v20 batchSize])
      {
        uint64_t v53 = [v20 batchSize];
      }
      else
      {
        uint64_t v50 = [v74 descriptor];
        uint64_t v51 = [v50 shape];
        uint64_t v52 = [v51 objectAtIndexedSubscript:0];
        uint64_t v53 = [v52 unsignedIntegerValue];

        uint64_t v20 = v69;
        self = v73;
      }
      unsigned int v54 = [(MLCDeviceGPU *)self gpuReadTensorKernelList];
      id v55 = [v54 objectAtIndexedSubscript:v19];
      int v56 = objc_msgSend(v70, "subarrayWithRange:", 0, v53);
      uint64_t v57 = [v61 objectAtIndexedSubscript:v19];
      uint64_t v58 = [v74 descriptor];
      +[MLCGPUHelper copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:](MLCGPUHelper, "copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:", v55, v78, v56, v57, [v58 dataType]);

      GPU_clearTemporaryImageBatchReadCount(v70);
      if (a10)
      {
        [v20 setGradientState:v68];
        char v59 = [v67 objectAtIndexedSubscript:v19];
        [v20 setSource:v59];
      }
      ++v19;
    }
    while (v19 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
  v94[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v90 = v9;
  id v85 = [v9 deviceMemory];
  [(MLCDeviceGPU *)self allocateResultTensor:v10];
  uint64_t v89 = v10;
  uint64_t v84 = [v10 deviceMemory];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v11 = 0;
    id v83 = v8;
    uint64_t v92 = self;
    do
    {
      uint64_t v12 = [v8 objectAtIndexedSubscript:v11];
      uint64_t v13 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      uint64_t v14 = [v13 objectAtIndexedSubscript:v11];

      id v15 = [v12 gradientKernel];
      if ([v12 isMPSKernel])
      {
        uint64_t v88 = v14;
        uint64_t v91 = v15;
        if ([v12 isMPSGraph])
        {
          id v16 = [v89 descriptor];
          id v17 = +[MLCTensor tensorWithDescriptor:v16];

          id v18 = [v12 source];
          unint64_t v19 = [v17 deviceMemory];
          [v19 setObject:v18 atIndexedSubscript:v11];

          uint64_t v20 = [v12 transposedTensors];
          unint64_t v21 = [v20 objectAtIndexedSubscript:0];

          uint64_t v22 = [(MLCDeviceGPU *)self gpuHeapTemporaryResourceAllocator];
          unint64_t v23 = objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v12, "temporaryHeapIndex"));
          uint64_t v24 = [v12 source];
          id v25 = objc_msgSend(v23, "allocateBuffer:", objc_msgSend(v24, "length"));
          uint64_t v86 = v21;
          uint64_t v26 = [v21 deviceMemory];
          [v26 setObject:v25 atIndexedSubscript:v11];

          if ([(MLCDeviceGPU *)self numDevicesToUse] < 2)
          {
            uint64_t v27 = [v12 transposeDeviceOps];
            uint64_t v93 = v27;
            uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
            uint64_t v33 = (void *)[v28 copy];
          }
          else
          {
            uint64_t v27 = [v8 objectAtIndexedSubscript:0];
            uint64_t v28 = [v27 transposeDeviceOps];
            v94[0] = v28;
            int64x2_t v29 = [v8 objectAtIndexedSubscript:1];
            id v30 = [v29 transposeDeviceOps];
            v94[1] = v30;
            [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
            v32 = BOOL v31 = v17;
            uint64_t v33 = (void *)[v32 copy];

            id v17 = v31;
          }
          uint64_t v80 = v33;
          contexta = v17;

          uint64_t v53 = [v12 batchSize];
          unsigned int v54 = [v33 objectAtIndexedSubscript:v11];
          [v54 setBatchSize:v53];

          [(MLCDeviceGPU *)self dispatchTransposeKernel:v33 sourceTensor:v17 resultTensor:v86 deviceIndex:v11 forward:1];
          id v55 = [v12 transposedTensors];
          int v56 = [v55 objectAtIndexedSubscript:1];

          uint64_t v57 = [(MLCDeviceGPU *)self gpuHeapTemporaryResourceAllocator];
          uint64_t v58 = objc_msgSend(v57, "objectAtIndexedSubscript:", objc_msgSend(v12, "temporaryHeapIndex"));
          char v59 = [v85 objectAtIndexedSubscript:v11];
          uint64_t v60 = objc_msgSend(v58, "allocateBuffer:", objc_msgSend(v59, "length"));
          id v61 = [v56 deviceMemory];
          [v61 setObject:v60 atIndexedSubscript:v11];

          uint64_t v78 = v56;
          [(MLCDeviceGPU *)v92 dispatchTransposeKernel:v33 sourceTensor:v90 resultTensor:v56 deviceIndex:v11 forward:1];
          uint64_t v62 = [v12 transposedTensors];
          id v63 = [v62 objectAtIndexedSubscript:2];

          id v64 = [(MLCDeviceGPU *)v92 gpuHeapTemporaryResourceAllocator];
          uint64_t v65 = objc_msgSend(v64, "objectAtIndexedSubscript:", objc_msgSend(v12, "temporaryHeapIndex"));
          uint64_t v66 = [v84 objectAtIndexedSubscript:v11];
          uint64_t v67 = objc_msgSend(v65, "allocateBuffer:", objc_msgSend(v66, "length"));
          id v68 = [v63 deviceMemory];
          [v68 setObject:v67 atIndexedSubscript:v11];

          uint64_t v69 = [v86 deviceMemory];
          int8x16_t v70 = [v69 objectAtIndexedSubscript:v11];
          uint64_t v71 = [v56 deviceMemory];
          id v72 = [v71 objectAtIndexedSubscript:v11];
          uint64_t v73 = [v63 deviceMemory];
          unsigned int v74 = [v73 objectAtIndexedSubscript:v11];
          unsigned int v75 = [v90 descriptor];
          -[MLCDeviceGPU dispatchGradientMPSGraphWithDeviceOps:sourceBuffer:souceGradientBuffer:resultGradientBuffer:deviceIndex:dataType:](v92, "dispatchGradientMPSGraphWithDeviceOps:sourceBuffer:souceGradientBuffer:resultGradientBuffer:deviceIndex:dataType:", v12, v70, v72, v74, v11, GPU_GetDataType([v75 dataType]));

          self = v92;
          [(MLCDeviceGPU *)v92 dispatchTransposeKernel:v80 sourceTensor:v63 resultTensor:v89 deviceIndex:v11 forward:0];

          id v8 = v83;
          uint64_t v14 = v88;
          id v15 = v91;
        }
        else
        {
          unint64_t context = (void *)MEMORY[0x1E01B11E0]();
          uint64_t v34 = [v12 batchSize];
          uint64_t v35 = [(MLCDeviceGPU *)self gpuWriteTensorKernelList];
          uint64_t v36 = [v35 objectAtIndexedSubscript:v11];
          uint64_t v37 = [v85 objectAtIndexedSubscript:v11];
          uint64_t v38 = [v90 descriptor];
          uint64_t v39 = [v38 dataType];
          uint64_t v40 = [v15 destinationImageAllocator];
          uint64_t v87 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:v90 commandBuffer:v88 batchSize:v34 copyingKernel:v36 sourceMTLBuffer:v37 MLCDataType:v39 heapAllocator:v40];

          id v41 = v89;
          uint64_t v79 = [v12 source];
          uint64_t v76 = [v12 batchSize];
          uint64_t v42 = [(MLCDeviceGPU *)v92 gpuWriteTensorKernelList];
          unint64_t v43 = [v42 objectAtIndexedSubscript:v11];
          uint64_t v44 = [v41 descriptor];
          uint64_t v45 = [v44 dataType];
          id v46 = [v91 destinationImageAllocator];
          uint64_t v77 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:v41 commandBuffer:v88 batchSize:v76 copyingKernel:v43 sourceMTLBuffer:v79 MLCDataType:v45 heapAllocator:v46];

          uint64_t v47 = [v12 gradientState];
          uint64_t v14 = v88;
          id v48 = [v91 encodeBatchToCommandBuffer:v88 sourceGradients:v87 sourceImages:v77 gradientStates:v47];

          unint64_t v49 = [(MLCDeviceGPU *)v92 gpuReadTensorKernelList];
          uint64_t v50 = [v49 objectAtIndexedSubscript:v11];
          uint64_t v51 = [v84 objectAtIndexedSubscript:v11];
          uint64_t v52 = [v41 descriptor];

          +[MLCGPUHelper copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:](MLCGPUHelper, "copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:", v50, v88, v48, v51, [v52 dataType]);
          id v15 = v91;

          self = v92;
          id v8 = v83;
        }
      }
      else
      {
        switch([v12 metalKernelType])
        {
          case 1u:
            [(MLCDeviceGPU *)self dispatchGradientActivationsKernel:v8 sourceGradientTensor:v90 resultGradientTensor:v89 deviceIndex:v11];
            break;
          case 2u:
            [(MLCDeviceGPU *)self dispatchGradientPaddingKernel:v8 sourceGradientTensor:v90 resultGradientTensor:v89 deviceIndex:v11];
            break;
          case 3u:
            [(MLCDeviceGPU *)self dispatchGradientSoftmaxKernel:v8 sourceGradientTensor:v90 resultGradientTensor:v89 deviceIndex:v11];
            break;
          case 4u:
            [(MLCDeviceGPU *)self dispatchGradientLayerNormalizationKernel:v8 sourceGradientTensor:v90 resultGradientTensor:v89 deviceIndex:v11];
            break;
          case 5u:
          case 6u:
            [(MLCDeviceGPU *)self dispatchGradientInstanceNormalizationKernel:v8 sourceGradientTensor:v90 resultGradientTensor:v89 deviceIndex:v11];
            break;
          case 7u:
          case 8u:
            [(MLCDeviceGPU *)self dispatchGradientBatchNormalizationKernel:v8 sourceGradientTensor:v90 resultGradientTensor:v89 deviceIndex:v11];
            break;
          case 9u:
            [(MLCDeviceGPU *)self dispatchGradientGroupNormalizationKernel:v8 sourceGradientTensor:v90 resultGradientTensor:v89 deviceIndex:v11];
            break;
          case 0xAu:
            [(MLCDeviceGPU *)self dispatchGradientResizeKernel:v8 sourceGradientTensor:v90 resultGradientTensor:v89 deviceIndex:v11];
            break;
          case 0xCu:
            [(MLCDeviceGPU *)self dispatchTransposeKernel:v8 sourceTensor:v90 resultTensor:v89 deviceIndex:v11 forward:0];
            break;
          case 0xFu:
          case 0x10u:
          case 0x11u:
            [(MLCDeviceGPU *)self dispatchGradientPoolingKernel:v8 sourceGradientTensor:v90 resultGradientTensor:v89 deviceIndex:v11];
            break;
          case 0x12u:
            [(MLCDeviceGPU *)self dispatchGradientGramMatrixKernel:v8 sourceGradientTensor:v90 resultGradientTensor:v89 deviceIndex:v11];
            break;
          default:
            break;
        }
      }

      ++v11;
    }
    while (v11 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 secondaryResultGradientTensor:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    uint64_t v13 = [v17 objectAtIndexedSubscript:0];
    int v14 = [v13 useSourceGradientDeviceMemoryForResultGradientTensor];
    int v15 = [v13 useSourceGradientDeviceMemoryForSecondaryResultGradientTensor];
    if (v14) {
      [(MLCDeviceGPU *)self shareDeviceMemoryWithResultTensor:v11 sourceTensor:v10];
    }
    else {
      [(MLCDeviceGPU *)self allocateResultTensor:v11];
    }
    if (v15) {
      [(MLCDeviceGPU *)self shareDeviceMemoryWithResultTensor:v12 sourceTensor:v10];
    }
    else {
      [(MLCDeviceGPU *)self allocateResultTensor:v12];
    }
  }
  else
  {
    [(MLCDeviceGPU *)self allocateResultTensor:v11];
  }
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v16 = 0;
    do
    {
      if (v12) {
        [(MLCDeviceGPU *)self dispatchGradientArithmeticBinaryKernel:v17 sourceGradientTensor:v10 resultGradientTensor:v11 secondaryResultGradientTensor:v12 deviceIndex:v16];
      }
      else {
        [(MLCDeviceGPU *)self dispatchGradientArithmeticUnaryKernel:v17 sourceGradientTensor:v10 resultGradientTensor:v11 deviceIndex:v16];
      }
      ++v16;
    }
    while (v16 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

- (void)dispatchGradientReshapeLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
}

- (void)dispatchGradientSliceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v8 = a4;
  id v9 = a5;
  id v61 = [v8 deviceMemory];
  [(MLCDeviceGPU *)self allocateResultTensor:v9];
  uint64_t v60 = [v9 deviceMemory];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v10 = 0;
    uint64_t v58 = &v72;
    char v59 = self;
    do
    {
      id v11 = objc_msgSend(v62, "objectAtIndexedSubscript:", v10, v58);
      id v12 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      id v64 = [v12 objectAtIndexedSubscript:v10];

      uint64_t v65 = v10;
      unint64_t context = (void *)MEMORY[0x1E01B11E0]([(MLCDeviceGPU *)self dispatchFillTensor:v9 deviceIndex:v10]);
      uint64_t v74 = 0;
      long long v72 = 0u;
      memset(v73, 0, sizeof(v73));
      memset(v71, 0, sizeof(v71));
      uint64_t v13 = [v9 descriptor];
      int v14 = [v13 shape];
      uint64_t v66 = [v14 count];

      int v15 = [v9 descriptor];
      unint64_t v16 = [v15 shape];
      uint64_t v17 = [v16 count];

      if (v17)
      {
        unint64_t v18 = 0;
        unint64_t v19 = (_DWORD *)v73 - v66;
        do
        {
          uint64_t v20 = [v11 stride];
          unint64_t v21 = [v20 objectAtIndexedSubscript:v18];
          *(v19 - 12) = [v21 unsignedIntegerValue];

          *(v19 - 8) = 0;
          uint64_t v22 = [v8 descriptor];
          unint64_t v23 = [v22 shape];
          uint64_t v24 = [v23 objectAtIndexedSubscript:v18];
          *(v19 - 4) = [v24 unsignedIntegerValue];

          id v25 = [v8 descriptor];
          uint64_t v26 = [v25 stride];
          uint64_t v27 = [v26 objectAtIndexedSubscript:v18];
          *unint64_t v19 = (unint64_t)[v27 unsignedIntegerValue] >> 2;

          uint64_t v28 = [v11 begin];
          int64x2_t v29 = [v28 objectAtIndexedSubscript:v18];
          v19[4] = [v29 unsignedIntegerValue];

          id v30 = [v9 descriptor];
          BOOL v31 = [v30 shape];
          id v32 = [v31 objectAtIndexedSubscript:v18];
          v19[8] = [v32 unsignedIntegerValue];

          uint64_t v33 = [v9 descriptor];
          uint64_t v34 = [v33 stride];
          uint64_t v35 = [v34 objectAtIndexedSubscript:v18];
          v19[12] = (unint64_t)[v35 unsignedIntegerValue] >> 2;

          ++v18;
          uint64_t v36 = [v9 descriptor];
          uint64_t v37 = [v36 shape];
          unint64_t v38 = [v37 count];

          ++v19;
        }
        while (v18 < v38);
      }
      if (v66 != 4)
      {
        uint64_t v39 = 4 - v66;
        if (v66 == 3 || v66 == 4) {
          uint64_t v39 = 1;
        }
        uint64_t v40 = v58;
        do
        {
          *((_DWORD *)v40 - 12) = 0;
          *((_DWORD *)v40 - 8) = 0;
          *((_DWORD *)v40 - 4) = 1;
          *(_DWORD *)uint64_t v40 = 0;
          *((_DWORD *)v40 + 4) = 0;
          *((_DWORD *)v40 + 8) = 1;
          *((_DWORD *)v40 + 12) = 0;
          uint64_t v40 = (long long *)((char *)v40 + 4);
          --v39;
        }
        while (v39);
      }
      LODWORD(v74) = 1;
      id v41 = [v11 forwardKernel];
      unint64_t v42 = [v41 maxTotalThreadsPerThreadgroup];

      uint64_t v43 = 0;
      long long v77 = xmmword_1DD1F0C50;
      int8x16_t v78 = (int8x16_t)xmmword_1DD1F0C60;
      long long v75 = xmmword_1DD1F0C50;
      int8x16_t v76 = (int8x16_t)xmmword_1DD1F0C60;
      do
      {
        unint64_t v44 = *((int *)&v73[1] + v43 + 3);
        if (v42 >= v44)
        {
          v78.i64[v43 + 1] = v44;
          unint64_t v46 = v44;
        }
        else
        {
          uint64_t v45 = (char *)&v77 + 8 * v43;
          if (v44 % v42)
          {
            *((void *)v45 + 3) = 1;
            unint64_t v46 = 1;
          }
          else
          {
            *((void *)v45 + 3) = v42;
            unint64_t v46 = v42;
          }
        }
        v76.i64[v43 + 1] = (v44 + v46 - 1) / v46;
        unint64_t v47 = v43 + 3;
        --v43;
        v42 /= v46;
      }
      while (v47 > 1);
      id v48 = [v9 descriptor];
      unint64_t v49 = [v48 shape];
      uint64_t v50 = [v49 count];

      if (v50 == 4)
      {
        unsigned int v51 = __clz(__rbit32(LOWORD(v73[1]))) << 16;
        if (((unsigned __int16)(LOWORD(v73[1]) - 1) & v73[1]) != 0) {
          int v52 = -65536;
        }
        else {
          int v52 = v51;
        }
        HIDWORD(v74) = v52 & 0xFFFF0000 | LOWORD(v73[1]);
        uint64_t v53 = *((void *)&v75 + 1) * SLODWORD(v73[1]);
      }
      else
      {
        HIDWORD(v74) = 1;
        uint64_t v53 = *((void *)&v75 + 1);
      }
      unsigned int v54 = [v64 computeCommandEncoderWithDispatchType:0];
      id v55 = [v11 forwardKernel];
      [v54 setComputePipelineState:v55];

      int v56 = [v61 objectAtIndexedSubscript:v65];
      [v54 setBuffer:v56 offset:0 atIndex:0];

      uint64_t v57 = [v60 objectAtIndexedSubscript:v65];
      [v54 setBuffer:v57 offset:0 atIndex:1];

      [v54 setBytes:v71 length:120 atIndex:2];
      int8x16_t v69 = vextq_s8(v76, v76, 8uLL);
      uint64_t v70 = v53;
      int8x16_t v67 = vextq_s8(v78, v78, 8uLL);
      uint64_t v68 = *((void *)&v77 + 1);
      [v54 dispatchThreadgroups:&v69 threadsPerThreadgroup:&v67];
      [v54 endEncoding];

      uint64_t v10 = v65 + 1;
      self = v59;
    }
    while (v65 + 1 < [(MLCDeviceGPU *)v59 numDevicesToUse]);
  }
}

- (void)dispatchGradientLossLayer:(id)a3 sourceGradientTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultGradientTensor:(id)a8
{
  id v72 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  int8x16_t v69 = [v13 deviceMemory];
  uint64_t v71 = v14;
  uint64_t v17 = v14;
  unint64_t v18 = self;
  uint64_t v68 = [v17 deviceMemory];
  uint64_t v70 = v15;
  uint64_t v66 = [v15 deviceMemory];
  [(MLCDeviceGPU *)self allocateResultTensor:v16];
  long long v75 = v16;
  int8x16_t v67 = [v16 deviceMemory];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v19 = 0;
    uint64_t v74 = v13;
    id v83 = self;
    do
    {
      uint64_t v20 = [v72 objectAtIndexedSubscript:v19];
      unint64_t v21 = [(MLCDeviceGPU *)v18 gpuCommandBufferList];
      uint64_t v22 = [v21 objectAtIndexedSubscript:v19];

      unint64_t v23 = [v20 gradientKernel];
      uint64_t v24 = [MEMORY[0x1E4F35978] defaultAllocator];
      uint64_t v79 = v23;
      [v23 setDestinationImageAllocator:v24];

      uint64_t v25 = [v20 batchSize];
      uint64_t v26 = [(MLCDeviceGPU *)v18 gpuWriteTensorKernelList];
      uint64_t v27 = [v26 objectAtIndexedSubscript:v19];
      uint64_t v28 = [v20 source];
      int64x2_t v29 = [v75 descriptor];
      uint64_t v73 = v22;
      uint64_t v82 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:](MLCGPUHelper, "allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:", v75, v22, v25, v27, v28, [v29 dataType], 0);

      id v30 = [v74 descriptor];
      BOOL v31 = [v30 shape];
      id v32 = [v31 objectAtIndexedSubscript:0];
      unint64_t v33 = [v32 unsignedIntegerValue];
      uint64_t v80 = v20;
      if (v33 >= [v20 batchSize])
      {
        uint64_t v38 = [v20 batchSize];
        uint64_t v36 = v74;
      }
      else
      {
        uint64_t v34 = [v74 descriptor];
        uint64_t v35 = [v34 shape];
        [v35 objectAtIndexedSubscript:0];
        v37 = uint64_t v36 = v74;
        uint64_t v38 = [v37 unsignedIntegerValue];
      }
      uint64_t v39 = [(MLCDeviceGPU *)v83 gpuWriteTensorKernelList];
      uint64_t v40 = [v39 objectAtIndexedSubscript:v19];
      id v41 = [v69 objectAtIndexedSubscript:v19];
      unint64_t v42 = [v36 descriptor];
      int8x16_t v78 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:](MLCGPUHelper, "allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:", v36, v73, v38, v40, v41, [v42 dataType], 0);

      uint64_t v43 = [v80 batchSize];
      unint64_t v44 = [(MLCDeviceGPU *)v83 gpuWriteTensorKernelList];
      uint64_t v45 = [v44 objectAtIndexedSubscript:v19];
      unint64_t v46 = [v68 objectAtIndexedSubscript:v19];
      unint64_t v47 = [v71 descriptor];
      uint64_t v81 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:](MLCGPUHelper, "allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:", v71, v73, v43, v45, v46, [v47 dataType], 0);

      if (v70)
      {
        uint64_t v76 = [v80 batchSize];
        id v48 = v83;
        unint64_t v49 = [(MLCDeviceGPU *)v83 gpuWriteTensorKernelList];
        uint64_t v50 = [v49 objectAtIndexedSubscript:v19];
        unsigned int v51 = [v66 objectAtIndexedSubscript:v19];
        int v52 = [v70 descriptor];
        uint64_t v53 = (void *)v73;
        long long v77 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:](MLCGPUHelper, "allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:", v70, v73, v76, v50, v51, [v52 dataType], 0);
      }
      else
      {
        uint64_t v53 = (void *)v73;
        long long v77 = 0;
        id v48 = v83;
      }
      unsigned int v54 = [v80 reduceLossKernel];

      if (v54)
      {
        id v55 = v53;
        +[MLCGPUHelper allocateTemporaryMPSImageBatchForTensor:commandBuffer:kernel:batchSize:](MLCGPUHelper, "allocateTemporaryMPSImageBatchForTensor:commandBuffer:kernel:batchSize:", v75, v53, v79, [v80 batchSize]);
        id v56 = (id)objc_claimAutoreleasedReturnValue();
        [(MLCDeviceGPU *)v48 dispatchPadChannelsKernel:v72 sourceImageBatch:v78 resultImageBatch:v56 deviceIndex:v19];
      }
      else
      {
        id v56 = v78;
        id v55 = v53;
      }
      uint64_t v57 = [v80 gradientState];
      uint64_t v58 = [v79 encodeBatchToCommandBuffer:v55 sourceGradients:v56 sourceImages:v82 labels:v81 weights:v77 sourceStates:v57];

      GPU_clearTemporaryImageBatchReadCount(v56);
      if ([(MLCDeviceGPU *)v48 numDevicesToUse] >= 2
        && [v79 reductionType] == 2)
      {
        NSUInteger Count = MPSImageBatchIncrementReadCount(v58, 1);
        uint64_t v60 = (void *)MEMORY[0x1E01B11E0](Count);
        id v61 = [v80 secondaryGradientKernel];
        GPU_ScaleMPSImageBatchWithKernel(v61, v55, v58, 1);
      }
      id v62 = [(MLCDeviceGPU *)v48 gpuReadTensorKernelList];
      id v63 = [v62 objectAtIndexedSubscript:v19];
      id v64 = [v67 objectAtIndexedSubscript:v19];
      uint64_t v65 = [v75 descriptor];
      +[MLCGPUHelper copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:](MLCGPUHelper, "copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:", v63, v55, v58, v64, [v65 dataType]);

      unint64_t v18 = v83;
      GPU_clearTemporaryImageBatchReadCount(v58);

      ++v19;
      id v13 = v74;
    }
    while (v19 < [(MLCDeviceGPU *)v83 numDevicesToUse]);
  }
}

- (void)dispatchForwardAndGradientLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultGradientTensor:(id)a9
{
  id v156 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  uint64_t v154 = [v14 deviceMemory];
  v159 = v15;
  uint64_t v153 = [v15 deviceMemory];
  uint64_t v148 = [v16 deviceMemory];
  [(MLCDeviceGPU *)self allocateResultTensor:v17];
  [(MLCDeviceGPU *)self allocateResultTensor:v18];
  uint64_t v152 = [v17 deviceMemory];
  uint64_t v155 = v18;
  unint64_t v151 = [v18 deviceMemory];
  v158 = v17;
  unint64_t v150 = [v17 descriptor];
  v157 = [v14 descriptor];
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v160 = v16;
    uint64_t v161 = 0;
    uint64_t v19 = 0;
    id v149 = v14;
    char v168 = self;
    while (1)
    {
      uint64_t v163 = v19;
      uint64_t v20 = [v156 objectAtIndexedSubscript:v19];
      unint64_t v21 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      uint64_t v169 = [v21 objectAtIndexedSubscript:v19];

      uint64_t v22 = [v20 combinedForwardAndGradientLossKernel];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      uint64_t v167 = [v20 combinedForwardAndGradientLossKernel];
      float v24 = 0.0;
      char v165 = isKindOfClass;
      if (isKindOfClass)
      {
        if ([(MLCDeviceGPU *)self numDevicesToUse] < 2)
        {
          float v29 = 0.0;
          float v26 = 0.0;
        }
        else
        {
          [v167 scaleXY];
          float v26 = v25;
          *(float *)&double v27 = v25 / (float)[(MLCDeviceGPU *)self numDevicesToUse];
          [v167 setScaleXY:v27];
          [v167 scaleWH];
          float v29 = v28;
          *(float *)&double v30 = v28 / (float)[(MLCDeviceGPU *)self numDevicesToUse];
          [v167 setScaleWH:v30];
          [v167 scaleClass];
          float v24 = v31;
          *(float *)&double v32 = v31 / (float)[(MLCDeviceGPU *)self numDevicesToUse];
          [v167 setScaleClass:v32];
        }
        unint64_t v164 = v167;
        uint64_t v167 = 0;
      }
      else
      {
        unint64_t v164 = 0;
        float v29 = 0.0;
        float v26 = 0.0;
      }
      unint64_t v33 = [v14 descriptor];
      uint64_t v34 = [v33 shape];
      uint64_t v35 = [v34 objectAtIndexedSubscript:0];
      unint64_t v36 = [v35 unsignedIntegerValue];
      uint64_t v166 = v20;
      if (v36 >= [v20 batchSize])
      {
        uint64_t v178 = [v20 batchSize];
      }
      else
      {
        uint64_t v37 = [v14 descriptor];
        uint64_t v38 = [v37 shape];
        uint64_t v39 = [v38 objectAtIndexedSubscript:0];
        uint64_t v178 = [v39 unsignedIntegerValue];
      }
      uint64_t v40 = [(MLCDeviceGPU *)self gpuWriteTensorKernelList];
      id v41 = [v40 objectAtIndexedSubscript:v19];
      unint64_t v42 = [v154 objectAtIndexedSubscript:v19];
      uint64_t v43 = [v14 descriptor];
      unint64_t v162 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:](MLCGPUHelper, "allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:", v14, v169, v178, v41, v42, [v43 dataType], 0);

      unint64_t v44 = [(MLCDeviceGPU *)self gpuWriteTensorKernelList];
      uint64_t v45 = [v44 objectAtIndexedSubscript:v19];
      unint64_t v46 = [v153 objectAtIndexedSubscript:v19];
      unint64_t v47 = [v159 descriptor];
      unint64_t v177 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:](MLCGPUHelper, "allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:", v159, v169, v178, v45, v46, [v47 dataType], 0);

      if (v160)
      {
        id v48 = [(MLCDeviceGPU *)self gpuWriteTensorKernelList];
        unint64_t v49 = [v48 objectAtIndexedSubscript:v19];
        uint64_t v50 = [v148 objectAtIndexedSubscript:v19];
        unsigned int v51 = [v160 descriptor];
        uint64_t v52 = v178;
        uint64_t v176 = +[MLCGPUHelper allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:](MLCGPUHelper, "allocateAndCopyToTemporaryMPSImageBatchForTensor:commandBuffer:batchSize:copyingKernel:sourceMTLBuffer:MLCDataType:heapAllocator:", v160, v169, v178, v49, v50, [v51 dataType], 0);

        uint64_t v53 = v150;
        unsigned int v54 = v166;
      }
      else
      {
        uint64_t v176 = 0;
        uint64_t v53 = v150;
        unsigned int v54 = v166;
        uint64_t v52 = v178;
      }
      id v55 = [v53 shape];
      BOOL v56 = [v55 count] != 1;
      uint64_t v57 = [v53 shape];
      uint64_t v58 = [v57 objectAtIndexedSubscript:v56];
      uint64_t v59 = [v58 unsignedIntegerValue];

      uint64_t v60 = [v54 reduceLossKernel];

      if (v60)
      {
        id v61 = [v157 shape];
        id v62 = [v61 objectAtIndexedSubscript:1];
        uint64_t v59 = [v62 unsignedIntegerValue];
      }
      id v63 = [v53 shape];
      unint64_t v64 = [v63 count];

      if (v64 >= 3)
      {
        int8x16_t v67 = [v53 shape];
        uint64_t v68 = [v67 count];

        int8x16_t v69 = [v53 shape];
        uint64_t v70 = v69;
        if (v68 == 3)
        {
          uint64_t v71 = [v69 objectAtIndexedSubscript:2];
          uint64_t v66 = [v71 unsignedIntegerValue];
          uint64_t v65 = 1;
        }
        else
        {
          uint64_t v71 = [v69 objectAtIndexedSubscript:3];
          uint64_t v66 = [v71 unsignedIntegerValue];
          id v72 = [v53 shape];
          uint64_t v73 = [v72 objectAtIndexedSubscript:2];
          uint64_t v65 = [v73 unsignedIntegerValue];
        }
      }
      else
      {
        uint64_t v65 = 1;
        uint64_t v66 = 1;
      }
      uint64_t v74 = [MEMORY[0x1E4F1CBF0] mutableCopy];
      long long v75 = (void *)v74;
      if ((v165 & 1) == 0) {
        break;
      }
      uint64_t v76 = v59;
      long long v77 = [v157 shape];
      int8x16_t v78 = [v77 objectAtIndexedSubscript:3];
      uint64_t v174 = [v78 unsignedIntegerValue];
      uint64_t v79 = [v157 shape];
      uint64_t v80 = [v79 objectAtIndexedSubscript:2];
      uint64_t v173 = [v80 unsignedIntegerValue];
      uint64_t v81 = [v157 shape];
      [v81 objectAtIndexedSubscript:1];
      v82 = uint64_t v179 = v52;
      uint64_t v172 = [v82 unsignedIntegerValue];

      id v83 = [v159 data];
      uint64_t v84 = [v83 bytes];

      uint64_t v52 = v179;
      if (v179)
      {
        uint64_t v171 = v65;
        id v85 = 0;
        uint64_t v86 = v173 * v174 * v172;
        unint64_t v181 = v75;
        uint64_t v87 = v179;
        uint64_t v88 = 4 * v86;
        uint64_t v89 = v84 + v86 * v179 * v161;
        uint64_t v170 = v66;
        uint64_t v90 = v169;
        uint64_t v91 = v76;
        do
        {
          uint64_t v92 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v89 length:v88];
          uint64_t v183 = v174;
          uint64_t v184 = v173;
          uint64_t v185 = v172;
          uint64_t v93 = [MEMORY[0x1E4F35458] cnnLossDataDescriptorWithData:v92 layout:1 size:&v183];
          id v94 = objc_alloc(MEMORY[0x1E4F35468]);
          uint64_t v95 = [v169 device];
          uint64_t v183 = v170;
          uint64_t v184 = v171;
          uint64_t v185 = v91;
          unint64_t v96 = (void *)[v94 initWithDevice:v95 lossImageSize:&v183 labelsDescriptor:v93 weightsDescriptor:0];

          [v181 addObject:v96];
          v89 += v88;
          id v85 = v96;
          --v87;
        }
        while (v87);
LABEL_31:
        unint64_t v105 = v164;
        unsigned int v54 = v166;
        uint64_t v106 = v90;
        uint64_t v52 = v179;
        long long v75 = v181;
        if (v165) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
      unint64_t v96 = 0;
      unint64_t v105 = v164;
      unsigned int v54 = v166;
      uint64_t v106 = v169;
LABEL_36:
      unsigned int v107 = v106;
      objc_msgSend(v105, "encodeBatchToCommandBuffer:sourceImages:labels:");
      int v180 = (MPSImageBatch *)objc_claimAutoreleasedReturnValue();
      unint64_t v108 = [v54 reduceLossKernel];

      id v109 = v75;
      if (v108)
      {
        uint64_t v110 = (void *)MEMORY[0x1E01B11E0]();
        int v111 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        if (v52)
        {
          for (uint64_t i = 0; i != v52; ++i)
          {
            uint64_t v113 = [v75 objectAtIndexedSubscript:i];
            uint64_t v114 = [v113 lossImage];
            [v111 addObject:v114];

            long long v75 = v109;
          }
        }
        uint64_t v115 = [v54 reduceLossKernel];
        uint64_t v116 = [MEMORY[0x1E4F35978] defaultAllocator];
        [v115 setDestinationImageAllocator:v116];

        unint64_t v117 = [v115 encodeBatchToCommandBuffer:v107 sourceImages:v111];
      }
      else
      {
        uint64_t v118 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        if (v52)
        {
          for (uint64_t j = 0; j != v52; ++j)
          {
            uint64_t v120 = [v75 objectAtIndexedSubscript:j];
            unint64_t v121 = [v120 lossImage];
            [v118 addObject:v121];
          }
        }
        unint64_t v117 = (MPSImageBatch *)[v118 copy];
      }
      if ([(MLCDeviceGPU *)v168 numDevicesToUse] >= 2)
      {
        if (v165)
        {
          *(float *)&double v122 = v26;
          [v164 setScaleXY:v122];
          *(float *)&double v123 = v29;
          [v164 setScaleWH:v123];
          *(float *)&double v124 = v24;
          [v164 setScaleClass:v124];
        }
        if ([v167 reductionType] == 2)
        {
          MPSImageBatchIncrementReadCount(v117, 1);
          NSUInteger Count = MPSImageBatchIncrementReadCount(v180, 1);
          unint64_t v126 = (void *)MEMORY[0x1E01B11E0](Count);
          uint64_t v127 = [v54 secondaryGradientKernel];
          GPU_ScaleMPSImageBatchWithKernel(v127, v107, v117, 0);

          uint64_t v128 = [v54 secondaryGradientKernel];
          GPU_ScaleMPSImageBatchWithKernel(v128, v107, v180, 0);
        }
      }
      uint64_t v129 = MEMORY[0x1E01B11E0]();
      uint64_t v130 = v158;
      unint64_t v131 = [v158 descriptor];
      unint64_t v132 = [v131 shape];
      uint64_t v133 = [v132 objectAtIndexedSubscript:0];
      unint64_t v134 = [v133 unsignedIntegerValue];
      uint64_t v182 = v117;
      uint64_t v175 = (void *)v129;
      if (v134 >= [v54 batchSize])
      {
        uint64_t v138 = [v54 batchSize];
      }
      else
      {
        uint64_t v135 = [v158 descriptor];
        signed int v136 = [v135 shape];
        uint64_t v137 = [v136 objectAtIndexedSubscript:0];
        uint64_t v138 = [v137 unsignedIntegerValue];

        uint64_t v130 = v158;
      }

      uint64_t v139 = [(MLCDeviceGPU *)v168 gpuReadTensorKernelList];
      uint64_t v140 = [v139 objectAtIndexedSubscript:v163];
      uint64_t v141 = -[MPSImageBatch subarrayWithRange:](v182, "subarrayWithRange:", 0, v138);
      v142 = [v152 objectAtIndexedSubscript:v163];
      uint64_t v143 = [v130 descriptor];
      +[MLCGPUHelper copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:](MLCGPUHelper, "copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:", v140, v169, v141, v142, [v143 dataType]);

      uint64_t v144 = [(MLCDeviceGPU *)v168 gpuReadTensorKernelList];
      uint64_t v145 = [v144 objectAtIndexedSubscript:v163];
      uint64_t v146 = [v151 objectAtIndexedSubscript:v163];
      v147 = [v155 descriptor];
      +[MLCGPUHelper copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:](MLCGPUHelper, "copyMPSImageBatchToMTLBuffer:commandBuffer:sourceImageBatch:destinationMTLBuffer:MLCDataType:", v145, v169, v180, v146, [v147 dataType]);

      GPU_clearTemporaryImageBatchReadCount(v162);
      GPU_clearTemporaryImageBatchReadCount(v177);
      GPU_clearTemporaryImageBatchReadCount(v176);
      GPU_clearTemporaryImageBatchReadCount(v182);
      GPU_clearTemporaryImageBatchReadCount(v180);
      [v166 setGradientState:0];
      [v166 setSource:0];

      self = v168;
      uint64_t v19 = v163 + 1;
      id v16 = v160;
      v161 += 4;
      id v14 = v149;
      if (v163 + 1 >= [(MLCDeviceGPU *)v168 numDevicesToUse]) {
        goto LABEL_54;
      }
    }
    if (v52)
    {
      uint64_t v179 = v52;
      unint64_t v181 = (void *)v74;
      uint64_t v97 = 0;
      uint64_t v98 = 0;
      uint64_t v99 = v65;
      uint64_t v100 = v66;
      uint64_t v90 = v169;
      do
      {
        id v101 = objc_alloc(MEMORY[0x1E4F35468]);
        uint64_t v102 = [v169 device];
        uint64_t v103 = [v177 objectAtIndexedSubscript:v97];
        unsigned int v104 = [v176 objectAtIndexedSubscript:v97];
        uint64_t v183 = v100;
        uint64_t v184 = v99;
        uint64_t v185 = v59;
        unint64_t v96 = (void *)[v101 initWithDevice:v102 lossImageSize:&v183 labelsImage:v103 weightsImage:v104];

        [v181 addObject:v96];
        ++v97;
        uint64_t v98 = v96;
      }
      while (v179 != v97);
      goto LABEL_31;
    }
    unint64_t v96 = 0;
    uint64_t v106 = v169;
LABEL_35:
    unint64_t v105 = v167;
    goto LABEL_36;
  }
LABEL_54:
}

- (BOOL)isResultTensorUsedForGradientComputationByLayer:(id)a3
{
  unint64_t v3 = [a3 objectAtIndexedSubscript:0];
  if ([v3 isMPSKernel]) {
    goto LABEL_7;
  }
  unsigned int v4 = [v3 metalKernelType];
  BOOL v5 = 0;
  if (v4 <= 0x11)
  {
    if (((1 << v4) & 0x30008) != 0)
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }
    if (((1 << v4) & 0x140) == 0) {
      goto LABEL_8;
    }
    [v3 setRecomputeResultTensor:1];
LABEL_7:
    BOOL v5 = 0;
  }
LABEL_8:

  return v5;
}

- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5
{
  uint64_t v406 = *MEMORY[0x1E4F143B8];
  id v365 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 count])
  {
    unint64_t v10 = 0;
    do
    {
      id v11 = [v9 objectAtIndexedSubscript:v10];
      [(MLCDeviceGPU *)self allocateResultTensor:v11];

      ++v10;
    }
    while (v10 < [v9 count]);
  }
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v12 = 0;
    long long v363 = xmmword_1DD1F0C30;
    id v368 = self;
    id v385 = v8;
    id v405 = v9;
    while (1)
    {
      objc_msgSend(v365, "objectAtIndexedSubscript:", v12, v363, v364);
      id v403 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      unint64_t v404 = v12;
      v399 = [v13 objectAtIndexedSubscript:v12];

      id v14 = [v8 objectAtIndexedSubscript:0];
      id v15 = [v14 descriptor];
      id v16 = [v15 shape];
      uint64_t v376 = [v16 count];

      id v17 = [v8 objectAtIndexedSubscript:0];
      id v18 = [v17 descriptor];
      uint64_t v19 = [v18 shape];
      uint64_t v373 = [v19 count];

      BOOL v20 = [v8 count] == 3 || objc_msgSend(v8, "count") == 4;
      LODWORD(v389) = v20;
      id v21 = v403;
      uint64_t v402 = [v403 batchSize];
      uint64_t v375 = [v21 isBidirectional];
      uint64_t v22 = 1;
      if (v375) {
        uint64_t v22 = 2;
      }
      uint64_t v393 = v22;
      unint64_t v23 = [v8 objectAtIndexedSubscript:0];
      float v24 = [v23 descriptor];
      float v25 = 0;
      if ([v24 variableLengthSequences])
      {
        float v26 = [v8 objectAtIndexedSubscript:0];
        double v27 = [v26 descriptor];
        float v25 = [v27 batchSizePerSequenceStep];
      }
      float v28 = [v8 objectAtIndexedSubscript:0];
      float v29 = [v28 descriptor];
      int v30 = [v29 variableLengthSequences];
      id v395 = 0;
      if (v30)
      {
        float v31 = [v8 objectAtIndexedSubscript:0];
        double v32 = [v31 descriptor];
        id v395 = [v32 sequenceLengths];
      }
      if ([v403 batchFirst] && v373 == 4)
      {
        unint64_t v33 = [v403 rnnBuffers];
        int v378 = [v33 objectAtIndexedSubscript:0];
      }
      else
      {
        unint64_t v33 = [v8 objectAtIndexedSubscript:0];
        uint64_t v34 = [v33 deviceMemory];
        int v378 = [v34 objectAtIndexedSubscript:v404];
      }
      if ([v403 returnsSequences] && v376 == 3)
      {
        uint64_t v35 = [v9 objectAtIndexedSubscript:0];
        unint64_t v36 = [v35 deviceMemory];
        v396 = [v36 objectAtIndexedSubscript:v404];
      }
      else
      {
        uint64_t v35 = [v403 rnnBuffers];
        v396 = [v35 objectAtIndexedSubscript:1];
      }

      id v37 = v403;
      int v369 = [v403 returnsSequences];
      int v38 = [v37 batchFirst];
      uint64_t v374 = v25;
      if (v38 && v373 == 4)
      {
        uint64_t v39 = [v8 objectAtIndexedSubscript:0];
        uint64_t v40 = [v39 descriptor];
        id v41 = [v40 shape];
        unint64_t v42 = [v41 objectAtIndexedSubscript:1];
        uint64_t v43 = [v42 unsignedIntegerValue];

        unint64_t v44 = [v8 objectAtIndexedSubscript:0];
        uint64_t v45 = [v44 descriptor];
        unint64_t v46 = [v45 shape];
        unint64_t v47 = [v46 objectAtIndexedSubscript:3];
        uint64_t v48 = [v47 unsignedIntegerValue];

        unint64_t v49 = [v9 objectAtIndexedSubscript:0];
        uint64_t v50 = [v49 descriptor];
        unsigned int v51 = [v50 shape];
        uint64_t v52 = [v51 objectAtIndexedSubscript:1];
        unint64_t v53 = [v52 unsignedIntegerValue];

        uint64_t v54 = v53 >> v375;
        id v55 = v25;
        uint64_t v56 = v402;
        uint64_t v57 = v378;
        createMatrices(v48, v402, v43, v43, v55, 0, v378);
        id v400 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v379 = v53;
        uint64_t v377 = v54;
        createMatrices(v48, v56, v53, v54, v55, 0, v396);
        id v382 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v58 = [(MLCDeviceGPU *)self deviceList];
        unint64_t v59 = v404;
        uint64_t v60 = [v58 objectAtIndexedSubscript:v404];
        id v61 = [v385 objectAtIndexedSubscript:0];
        id v62 = [v61 deviceMemory];
        unint64_t v63 = v59;
        uint64_t v64 = v56;
        uint64_t v65 = [v62 objectAtIndexedSubscript:v63];
        uint64_t v383 = v43;
        uint64_t v66 = v57;
        uint64_t v67 = v48;
        copyNC1TtoNTCMTLBuffer(v399, v60, v64, v43, v48, v65, v66);
      }
      else
      {
        int v68 = [v403 batchFirst];
        int8x16_t v69 = [v8 objectAtIndexedSubscript:0];
        uint64_t v70 = [v69 descriptor];
        uint64_t v71 = [v70 shape];
        id v72 = v71;
        if (v68 && v376 == 3)
        {
          uint64_t v73 = [v71 objectAtIndexedSubscript:1];
          uint64_t v74 = [v73 unsignedIntegerValue];

          long long v75 = [v8 objectAtIndexedSubscript:0];
          uint64_t v76 = [v75 descriptor];
          long long v77 = [v76 shape];
          int8x16_t v78 = [v77 objectAtIndexedSubscript:2];
          uint64_t v79 = [v78 unsignedIntegerValue];

          uint64_t v80 = [v9 objectAtIndexedSubscript:0];
          uint64_t v81 = [v80 descriptor];
          uint64_t v82 = [v81 shape];
          id v83 = [v82 objectAtIndexedSubscript:2];
          unint64_t v84 = [v83 unsignedIntegerValue];

          uint64_t v67 = v74;
          uint64_t v85 = v84 >> v375;
          uint64_t v64 = v402;
          uint64_t v383 = v79;
          uint64_t v86 = v374;
          createMatrices(v74, v402, v79, v79, v374, 0, v378);
          id v400 = (id)objc_claimAutoreleasedReturnValue();
          unint64_t v379 = v84;
          uint64_t v377 = v85;
          uint64_t v87 = createMatrices(v74, v64, v84, v85, v86, 0, v396);
        }
        else
        {
          uint64_t v88 = [v71 objectAtIndexedSubscript:2];
          uint64_t v89 = [v88 unsignedIntegerValue];

          uint64_t v90 = [v8 objectAtIndexedSubscript:0];
          uint64_t v91 = [v90 descriptor];
          uint64_t v92 = [v91 shape];
          uint64_t v93 = [v92 objectAtIndexedSubscript:0];
          uint64_t v94 = [v93 unsignedIntegerValue];

          uint64_t v95 = [v9 objectAtIndexedSubscript:0];
          unint64_t v96 = [v95 descriptor];
          uint64_t v97 = [v96 shape];
          uint64_t v98 = [v97 objectAtIndexedSubscript:2];
          unint64_t v99 = [v98 unsignedIntegerValue];

          uint64_t v67 = v94;
          uint64_t v100 = v99 >> v375;
          uint64_t v64 = v402;
          uint64_t v383 = v89;
          id v101 = v374;
          createMatricesForTNCBuffer(v94, v402, v89, v89, v374, v378);
          id v400 = (id)objc_claimAutoreleasedReturnValue();
          unint64_t v379 = v99;
          uint64_t v377 = v100;
          uint64_t v87 = createMatricesForTNCBuffer(v94, v64, v99, v100, v101, v396);
        }
        id v382 = v87;
      }
      id v102 = v395;
      int64x2_t v370 = &v363;
      uint64_t v103 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
      unint64_t v105 = (char *)&v363 - (((unint64_t)v104 + 15) & 0xFFFFFFFFFFFFFFF0);
      id v381 = v104;
      MEMORY[0x1F4188790](v103);
      unsigned int v107 = (char *)&v363 - v106;
      if ([v403 batchFirst] && v67)
      {
        uint64_t v108 = 0;
        uint64_t v109 = 0;
        uint64_t v110 = 4 * v383;
        do
        {
          *(void *)&v105[8 * v109++] = v108;
          v108 += v110;
        }
        while (v67 != v109);
        uint64_t v111 = 0;
        uint64_t v112 = 4 * v379;
        uint64_t v113 = v107;
        uint64_t v114 = v67;
        do
        {
          *v113++ = v111;
          v111 += v112;
          --v114;
        }
        while (v114);
      }
      v401 = v107;
      uint64_t v115 = v9;
      uint64_t v116 = v399;
      if (v102)
      {
        unint64_t v117 = v396;
        bzero((void *)[v117 contents], objc_msgSend(v117, "length"));
        +[MLCGPUHelper didModifyRange:buffer:](MLCGPUHelper, "didModifyRange:buffer:", 0, [v117 length], v117);
      }
      id v390 = [v403 forwardKernel];
      unint64_t v118 = [v390 count];
      unint64_t v119 = v118 >> v375;
      uint64_t v120 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      uint64_t v398 = v119;
      unint64_t v388 = v119 - 1;
      unint64_t v121 = v119 - 1;
      int v380 = (char *)(v119 - 1);
      uint64_t v122 = v379;
      if (v119 != 1)
      {
        do
        {
          double v123 = [v115 objectAtIndexedSubscript:0];
          double v124 = createTemporaryMatrixViews(v123, v116, 2, v67, v64, v122);

          [v120 addObject:v124];
          --v121;
        }
        while (v121);
      }
      id v384 = v120;
      uint64_t v371 = v67;
      id v125 = (char *)v400;
      id v126 = v403;
      int v127 = [v403 batchFirst];
      int v128 = [v126 batchFirst];
      uint64_t v129 = v401;
      if (!v128) {
        uint64_t v129 = 0;
      }
      v394 = v129;
      long long v372 = v125;
      id v130 = v390;
      unint64_t v131 = v116;
      id v9 = v115;
      if (v398)
      {
        unint64_t v132 = 0;
        uint64_t v133 = 0;
        id v125 = 0;
        if (v127) {
          uint64_t v134 = (uint64_t)v105;
        }
        else {
          uint64_t v134 = 0;
        }
        uint64_t v387 = 4 * v402 * v377;
        uint64_t v135 = (uint64_t)v372;
        do
        {
          uint64_t v391 = v134;
          if (v388 == v133)
          {
            signed int v136 = (char *)v382;
          }
          else
          {
            signed int v136 = [v384 objectAtIndexedSubscript:v133];
          }
          v401 = v136;
          uint64_t v397 = v135;

          uint64_t v137 = [v403 rnnTrainableStates];
          uint64_t v138 = [v137 objectAtIndexedSubscript:v133];

          id v400 = v138;
          [v138 removeAllObjects];
          if (v389)
          {
            uint64_t v139 = [v130 objectAtIndexedSubscript:v133];
            uint64_t v140 = v399;
            uint64_t v141 = [v139 temporaryRecurrentStateForCommandBuffer:v399 batchSize:v402 forGradientPass:0];

            v142 = [v141 getRecurrentOutputMatrixForLayerIndex:0];
            uint64_t v143 = [v142 data];
            long long v392 = v132;
            uint64_t v144 = (void *)v143;

            uint64_t v145 = [v141 getMemoryCellMatrixForLayerIndex:0];
            id v386 = [v145 data];

            uint64_t v146 = [v140 blitCommandEncoder];
            id v147 = v385;
            uint64_t v148 = [v385 objectAtIndexedSubscript:1];
            id v149 = [v148 deviceMemory];
            unint64_t v150 = v404;
            unint64_t v151 = [v149 objectAtIndexedSubscript:v404];
            uint64_t v152 = v144;
            unint64_t v132 = v392;
            objc_msgSend(v146, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v151, v392, v152, 0, objc_msgSend(v152, "length"));

            uint64_t v153 = v147;
            id v130 = v390;
            uint64_t v154 = [v153 objectAtIndexedSubscript:2];
            uint64_t v155 = [v154 deviceMemory];
            id v156 = [v155 objectAtIndexedSubscript:v150];
            id v157 = v386;
            objc_msgSend(v146, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v156, v132, v386, 0, objc_msgSend(v386, "length"));

            id v9 = v405;
            [v146 endEncoding];
            v158 = [v130 objectAtIndexedSubscript:v133];
            [v158 setRecurrentOutputIsTemporary:1];

            v159 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          }
          else
          {
            uint64_t v141 = 0;
            v159 = 0;
          }
          unint64_t v160 = [v130 objectAtIndexedSubscript:v133];
          [v160 setPropagateFullRecurrentRows:1];

          uint64_t v161 = [v130 objectAtIndexedSubscript:v133];
          unint64_t v162 = [v403 rnnTrainableWeights];
          uint64_t v163 = [v162 objectAtIndexedSubscript:v133];
          long long v392 = v141;
          id v362 = v141;
          id v164 = (id)v397;
          [v161 encodeForwardSequenceToCommandBuffer:v399 sourceMatrices:v397 sourceOffsets:v391 destinationMatrices:v401 destinationOffsets:v394 trainingStates:v400 recurrentInputState:v362 recurrentOutputStates:v159 weights:v163];

          if ([v9 count] == 3 && v159 && objc_msgSend(v159, "count"))
          {
            char v165 = [v159 objectAtIndexedSubscript:0];
            uint64_t v166 = [v165 getRecurrentOutputMatrixForLayerIndex:0];
            uint64_t v167 = [v166 data];

            char v168 = [v159 objectAtIndexedSubscript:0];
            uint64_t v169 = [v168 getMemoryCellMatrixForLayerIndex:0];
            uint64_t v170 = [v169 data];

            uint64_t v171 = [v399 blitCommandEncoder];
            uint64_t v172 = [v9 objectAtIndexedSubscript:1];
            uint64_t v173 = [v172 deviceMemory];
            unint64_t v174 = v404;
            uint64_t v175 = [v173 objectAtIndexedSubscript:v404];
            objc_msgSend(v171, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v167, 0, v175, v132, objc_msgSend(v167, "length"));

            uint64_t v176 = [v405 objectAtIndexedSubscript:2];
            unint64_t v177 = [v176 deviceMemory];
            unint64_t v178 = v174;
            id v130 = v390;
            uint64_t v179 = [v177 objectAtIndexedSubscript:v178];
            objc_msgSend(v171, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v170, 0, v179, v132, objc_msgSend(v170, "length"));

            id v164 = (id)v397;
            id v9 = v405;

            [v171 endEncoding];
            [v159 removeAllObjects];
          }
          id v125 = v401;

          ++v133;
          v132 += v387;
          uint64_t v134 = (uint64_t)v394;
          uint64_t v135 = (uint64_t)v125;
        }
        while (v398 != v133);

        unint64_t v131 = v399;
      }
      uint64_t v180 = [v403 isBidirectional];
      self = v368;
      id v181 = v385;
      v367 = v125;
      if (v180) {
        break;
      }
LABEL_110:
      id v278 = v181;
      unint64_t v279 = [v181 objectAtIndexedSubscript:0];
      [v403 setSource:v279];

      if (v376 == 3) {
        int v280 = v369 ^ 1;
      }
      else {
        int v280 = 1;
      }
      unint64_t v281 = 0x1E4F35000uLL;
      id v282 = v384;
      if (v280 == 1)
      {
        if (v373 == 4) {
          char v283 = v369 ^ 1;
        }
        else {
          char v283 = 1;
        }
        if (v283)
        {
          if (v395) {
            char v284 = 1;
          }
          else {
            char v284 = v369;
          }
          if (v284)
          {
            char v285 = v369;
            if (!v395) {
              char v285 = 1;
            }
            if (v285) {
              goto LABEL_146;
            }
            LODWORD(v388) = 1;
            char v286 = v375;
            long long v389 = (void *)MEMORY[0x1E01B11E0]();
            id v287 = objc_alloc(MEMORY[0x1E4F35628]);
            v288 = [(MLCDeviceGPU *)self deviceList];
            unint64_t v289 = v404;
            v290 = [v288 objectAtIndexedSubscript:v404];
            uint64_t v291 = v402;
            long long v392 = (char *)[v287 initWithDevice:v290 count:v402 << v286];

            id v292 = objc_alloc(MEMORY[0x1E4F35620]);
            uint64_t v293 = v291;
            v294 = [(MLCDeviceGPU *)self deviceList];
            v295 = [v294 objectAtIndexedSubscript:v289];
            uint64_t v296 = v377;
            uint64_t v387 = [v292 initWithDevice:v295 copyRows:1 copyColumns:v377 sourcesAreTransposed:0 destinationsAreTransposed:0];

            uint64_t v297 = v379;
            uint64_t v298 = v371;
            v401 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v371 columns:v379 rowBytes:4 * v379 dataType:268435488];
            id v400 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:1 columns:v297 rowBytes:4 * v297 dataType:268435488];
            if (v293)
            {
              uint64_t v398 = 0;
              unsigned int v299 = 0;
              uint64_t v300 = v296 << 32;
              uint64_t v391 = 4 * v298;
              do
              {
                uint64_t v301 = 0;
                uint64_t v302 = v398;
                uint64_t v397 = v391 * v398 * v379;
                v394 = (char *)(4 * v398 * v379);
                do
                {
                  v303 = [v395 objectAtIndexedSubscript:v398];
                  int v304 = [v303 unsignedIntegerValue];

                  uint64_t v305 = (v304 - 1);
                  uint64_t v306 = v299;
                  id v307 = objc_alloc(MEMORY[0x1E4F35618]);
                  v308 = (void *)[v307 initWithBuffer:v396 offset:v397 descriptor:v401];
                  id v309 = objc_alloc(MEMORY[0x1E4F35618]);
                  v310 = [v405 objectAtIndexedSubscript:0];
                  uint64_t v311 = [v310 deviceMemory];
                  BOOL v312 = [v311 objectAtIndexedSubscript:v404];
                  char v313 = (void *)[v309 initWithBuffer:v312 offset:v394 descriptor:v400];

                  if (v301 == 1) {
                    uint64_t v314 = v300;
                  }
                  else {
                    uint64_t v314 = 0;
                  }
                  unsigned int v299 = v314 | v306;
                  if (v301 == 1) {
                    uint64_t v315 = v300;
                  }
                  else {
                    uint64_t v315 = v305;
                  }
                  objc_msgSend(v392, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", v302, v308, v313, v315, v314 | v306);

                  ++v301;
                  v302 += v402;
                }
                while (v393 != v301);
                ++v398;
              }
              while (v398 != v402);
            }
            id v316 = (id)v387;
            unint64_t v131 = v399;
            id v317 = v392;
            [(id)v387 encodeToCommandBuffer:v399 copyDescriptor:v392];
          }
          else
          {
            LODWORD(v388) = 1;
            long long v389 = (void *)MEMORY[0x1E01B11E0]();
            id v343 = objc_alloc(MEMORY[0x1E4F35628]);
            v344 = [(MLCDeviceGPU *)self deviceList];
            unint64_t v345 = v404;
            v346 = [v344 objectAtIndexedSubscript:v404];
            long long v392 = (char *)[v343 initWithDevice:v346 count:v393];

            id v347 = objc_alloc(MEMORY[0x1E4F35620]);
            BOOL v348 = [(MLCDeviceGPU *)self deviceList];
            int v349 = [v348 objectAtIndexedSubscript:v345];
            uint64_t v350 = v402;
            uint64_t v351 = v377;
            uint64_t v387 = [v347 initWithDevice:v349 copyRows:v402 copyColumns:v377 sourcesAreTransposed:0 destinationsAreTransposed:0];

            uint64_t v352 = v379;
            uint64_t v398 = ((v371 - 1) * v379);
            uint64_t v353 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v350 columns:v371 * v379 rowBytes:4 * v371 * v379 dataType:268435488];
            v354 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v350 columns:v352 rowBytes:4 * v352 dataType:268435488];
            id v355 = objc_alloc(MEMORY[0x1E4F35618]);
            v401 = v353;
            uint64_t v356 = (void *)[v355 initWithBuffer:v396 offset:0 descriptor:v353];
            id v317 = v392;
            id v357 = objc_alloc(MEMORY[0x1E4F35618]);
            int v358 = [v9 objectAtIndexedSubscript:0];
            id v359 = [v358 deviceMemory];
            int v360 = [v359 objectAtIndexedSubscript:v345];
            id v400 = v354;
            uint64_t v361 = (void *)[v357 initWithBuffer:v360 offset:0 descriptor:v354];

            objc_msgSend(v317, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", 0, v356, v361, v398 << 32, 0);
            if ([v403 isBidirectional]) {
              objc_msgSend(v317, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", 1, v356, v361, v351 << 32, v351 << 32);
            }
            id v316 = (id)v387;
            [(id)v387 encodeToCommandBuffer:v131 copyDescriptor:v317];
          }
          id v278 = v385;
          id v9 = v405;
          id v130 = v390;
          id v282 = v384;
          id v125 = v367;
          LOBYTE(v280) = v388;
        }
        else
        {
          LODWORD(v388) = 1;
          long long v389 = (void *)MEMORY[0x1E01B11E0]();
          id v318 = objc_alloc(MEMORY[0x1E4F35628]);
          v319 = [(MLCDeviceGPU *)self deviceList];
          unint64_t v320 = v404;
          v321 = [v319 objectAtIndexedSubscript:v404];
          uint64_t v322 = v402;
          uint64_t v323 = [v318 initWithDevice:v321 count:v402];

          id v324 = objc_alloc(MEMORY[0x1E4F35620]);
          v325 = [(MLCDeviceGPU *)self deviceList];
          uint64_t v326 = [v325 objectAtIndexedSubscript:v320];
          uint64_t v327 = v371;
          uint64_t v328 = v379;
          uint64_t v387 = [v324 initWithDevice:v326 copyRows:v371 copyColumns:v379 sourcesAreTransposed:0 destinationsAreTransposed:1];

          v329 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v327 columns:v328 rowBytes:4 * v328 dataType:268435488];
          uint64_t v330 = v327;
          id v400 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v328 columns:v327 rowBytes:4 * v327 dataType:268435488];
          v401 = v329;
          v331 = v396;
          if (v322)
          {
            uint64_t v332 = 0;
            uint64_t v333 = 0;
            uint64_t v398 = 4 * v330 * v328;
            do
            {
              int v334 = (void *)[objc_alloc(*(Class *)(v281 + 1560)) initWithBuffer:v331 offset:v332 descriptor:v329];
              id v335 = objc_alloc(MEMORY[0x1E4F35618]);
              [v405 objectAtIndexedSubscript:0];
              v337 = uint64_t v336 = (void *)v323;
              [v337 deviceMemory];
              int v338 = v331;
              v340 = uint64_t v339 = v322;
              v341 = [v340 objectAtIndexedSubscript:v404];
              uint64_t v342 = (void *)[v335 initWithBuffer:v341 offset:v332 descriptor:v400];

              uint64_t v322 = v339;
              v331 = v338;

              uint64_t v323 = (uint64_t)v336;
              objc_msgSend(v336, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", v333, v334, v342, 0, 0);

              v329 = v401;
              unint64_t v281 = 0x1E4F35000;
              ++v333;
              v332 += v398;
            }
            while (v322 != v333);
          }
          id v316 = (id)v387;
          unint64_t v131 = v399;
          [(id)v387 encodeToCommandBuffer:v399 copyDescriptor:v323];
          id v278 = v385;
          id v9 = v405;
          id v130 = v390;
          id v282 = v384;
          id v125 = v367;
          LOBYTE(v280) = v388;
          id v317 = (id)v323;
        }

        self = v368;
      }
LABEL_146:

      id v8 = v278;
      if (v280)
      {
        unint64_t v12 = v404 + 1;
        if (v12 < [(MLCDeviceGPU *)self numDevicesToUse]) {
          continue;
        }
      }
      goto LABEL_148;
    }
    uint64_t v182 = MEMORY[0x1F4188790](v180);
    uint64_t v391 = (uint64_t)&v363 - ((v183 + 15) & 0xFFFFFFFFFFFFFFF0);
    MEMORY[0x1F4188790](v182);
    v394 = (char *)&v363 - v184;
    int v185 = [v403 batchFirst];
    id v364 = &v363;
    if (v185)
    {
      uint64_t v186 = v371;
      uint64_t v187 = v402;
      uint64_t v188 = v383;
      long long v189 = v374;
      createMatrices(v371, v402, v383, v383, v374, 1, v378);
      v366 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v190 = v379;
      uint64_t v191 = v377;
      createMatrices(v186, v187, v379, v377, v189, 1, v396);
      id v381 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v377 = v191;
      if (v186)
      {
        uint64_t v192 = 0;
        unint64_t v193 = (v186 + 1) & 0xFFFFFFFFFFFFFFFELL;
        uint64x2_t v194 = (uint64x2_t)vdupq_n_s64(v186 - 1);
        uint64_t v195 = 4 * v188 * (v186 - 1);
        int64x2_t v196 = (int64x2_t)v363;
        uint64_t v197 = v391;
        do
        {
          int32x2_t v198 = vmovn_s64((int64x2_t)vcgeq_u64(v194, (uint64x2_t)v196));
          if (v198.i8[0]) {
            *(void *)(v197 + 8 * v192) = v195;
          }
          if (v198.i8[4]) {
            *(void *)(v197 + 8 * v192 + 8) = 4 * v188 * (v186 + (v192 ^ 0xFFFFFFFFFFFFFFFELL));
          }
          v192 += 2;
          int64x2_t v196 = vaddq_s64(v196, vdupq_n_s64(2uLL));
          v195 -= 8 * v188;
        }
        while (v193 != v192);
        uint64_t v199 = 0;
        uint64_t v200 = 4 * v190 * (v186 - 1) + 4 * v191;
        int64x2_t v201 = (int64x2_t)v363;
        long long v202 = v380;
        do
        {
          int32x2_t v203 = vmovn_s64((int64x2_t)vcgeq_u64(v194, (uint64x2_t)v201));
          if (v203.i8[0]) {
            *(void *)&v394[8 * v199] = v200;
          }
          if (v203.i8[4]) {
            *(void *)&v394[8 * v199 + 8] = 4 * (v191 + (v186 + (v199 ^ 0x3FFFFFFFFFFFFFFELL)) * v190);
          }
          v199 += 2;
          int64x2_t v201 = vaddq_s64(v201, vdupq_n_s64(2uLL));
          v200 -= 8 * v190;
        }
        while (v193 != v199);
        goto LABEL_91;
      }
    }
    else
    {
      uint64_t v204 = v371;
      uint64_t v187 = v402;
      uint64_t v205 = v383;
      long long v206 = v374;
      createMatricesForTNCBufferNoOffset(v371, v402, v383, v383, v374, v378);
      v366 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v190 = v379;
      uint64_t v207 = v377;
      createMatricesForTNCBufferNoOffset(v204, v187, v379, v377, v206, v396);
      id v381 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v377 = v207;
      if (v204)
      {
        uint64_t v208 = 0;
        uint64_t v209 = 4 * v187 * v205;
        unint64_t v210 = (v204 + 1) & 0xFFFFFFFFFFFFFFFELL;
        uint64x2_t v211 = (uint64x2_t)vdupq_n_s64(v204 - 1);
        uint64_t v212 = v209 * (v204 - 1);
        int64x2_t v213 = (int64x2_t)v363;
        uint64_t v214 = v391;
        do
        {
          int32x2_t v215 = vmovn_s64((int64x2_t)vcgeq_u64(v211, (uint64x2_t)v213));
          if (v215.i8[0]) {
            *(void *)(v214 + 8 * v208) = v212;
          }
          if (v215.i8[4]) {
            *(void *)(v214 + 8 * v208 + 8) = v209 * (v204 + (v208 ^ 0xFFFFFFFFFFFFFFFELL));
          }
          v208 += 2;
          int64x2_t v213 = vaddq_s64(v213, vdupq_n_s64(2uLL));
          v212 -= 8 * v187 * v205;
        }
        while (v210 != v208);
        uint64_t v216 = 0;
        uint64_t v217 = 4 * v190 * v187 * (v204 - 1) + 4 * v207;
        int64x2_t v218 = (int64x2_t)v363;
        long long v202 = v380;
        do
        {
          int32x2_t v219 = vmovn_s64((int64x2_t)vcgeq_u64(v211, (uint64x2_t)v218));
          if (v219.i8[0]) {
            *(void *)&v394[8 * v216] = v217;
          }
          if (v219.i8[4]) {
            *(void *)&v394[8 * v216 + 8] = 4 * (v207 + v190 * v187 * (v204 + (v216 ^ 0x3FFFFFFFFFFFFFFELL)));
          }
          v216 += 2;
          int64x2_t v218 = vaddq_s64(v218, vdupq_n_s64(2uLL));
          v217 -= 8 * v190 * v187;
        }
        while (v210 != v216);
LABEL_91:
        v220 = (char *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        uint64_t v221 = v371;
        if (v202)
        {
          do
          {
            [v9 objectAtIndexedSubscript:0];
            v223 = id v222 = v202;
            v224 = createTemporaryMatrixViews(v223, v131, 2, v221, v187, v190);

            [v220 addObject:v224];
            long long v202 = v222 - 1;
          }
          while (v222 != (char *)1);
          unint64_t v225 = v366;
          uint64_t v226 = v366;
          if (!v398)
          {
            v227 = v226;
            id v181 = v385;
LABEL_109:

            self = v368;
            id v130 = v390;
            id v125 = v367;
            goto LABEL_110;
          }
        }
        else
        {
          unint64_t v225 = v366;
          v228 = v366;
        }
        int v380 = v220;
        uint64_t v229 = 0;
        v227 = 0;
        uint64_t v387 = 4 * v187 * v377;
        long long v392 = (char *)v387;
        v401 = v225;
        uint64_t v230 = v391;
        do
        {
          uint64_t v391 = v230;
          if (v388 == v229)
          {
            id v231 = v381;
          }
          else
          {
            id v231 = [v380 objectAtIndexedSubscript:v229];
          }
          id v400 = v231;

          uint64_t v232 = v398 + v229;
          v233 = [v403 rnnTrainableStates];
          v234 = [v233 objectAtIndexedSubscript:v232];

          uint64_t v397 = (uint64_t)v234;
          [v234 removeAllObjects];
          if (v389)
          {
            v235 = [v390 objectAtIndexedSubscript:v232];
            v236 = [v235 temporaryRecurrentStateForCommandBuffer:v131 batchSize:v402 forGradientPass:0];

            uint64_t v237 = [v236 getRecurrentOutputMatrixForLayerIndex:0];
            v238 = [v237 data];

            v239 = [v236 getMemoryCellMatrixForLayerIndex:0];
            uint64_t v383 = [v239 data];

            uint64_t v240 = [v131 blitCommandEncoder];
            id v241 = v385;
            uint64_t v242 = [v385 objectAtIndexedSubscript:1];
            id v243 = [v242 deviceMemory];
            v244 = [v243 objectAtIndexedSubscript:v404];
            id v386 = v238;
            uint64_t v245 = [v238 length];
            v246 = v392;
            [v240 copyFromBuffer:v244 sourceOffset:v392 toBuffer:v238 destinationOffset:0 size:v245];

            uint64_t v247 = v241;
            id v248 = v390;
            v249 = [v247 objectAtIndexedSubscript:2];
            v250 = [v249 deviceMemory];
            id v251 = [v250 objectAtIndexedSubscript:v404];
            uint64_t v252 = v229;
            id v253 = (id)v383;
            objc_msgSend(v240, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v251, v246, v383, 0, objc_msgSend((id)v383, "length"));

            unint64_t v131 = v399;
            [v240 endEncoding];
            v254 = [v248 objectAtIndexedSubscript:v232];
            [v254 setRecurrentOutputIsTemporary:1];

            id v255 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
            uint64_t v229 = v252;
            id v9 = v405;

            id v256 = v403;
          }
          else
          {
            v236 = 0;
            id v255 = 0;
            id v256 = v403;
            id v248 = v390;
          }
          v257 = [v248 objectAtIndexedSubscript:v232];
          uint64_t v258 = [v256 rnnTrainableWeights];
          char v259 = [v258 objectAtIndexedSubscript:v232];
          char v260 = v236;
          [v257 encodeForwardSequenceToCommandBuffer:v131 sourceMatrices:v401 sourceOffsets:v391 destinationMatrices:v400 destinationOffsets:v394 trainingStates:v397 recurrentInputState:v236 recurrentOutputStates:v255 weights:v259];

          if ([v9 count] == 3 && v255 && objc_msgSend(v255, "count"))
          {
            uint64_t v261 = [v255 objectAtIndexedSubscript:0];
            uint64_t v262 = [v261 getRecurrentOutputMatrixForLayerIndex:0];
            v263 = [v262 data];

            v264 = [v255 objectAtIndexedSubscript:0];
            v265 = [v264 getMemoryCellMatrixForLayerIndex:0];
            v266 = [v265 data];

            v267 = [v131 blitCommandEncoder];
            v268 = [v405 objectAtIndexedSubscript:1];
            unint64_t v269 = [v268 deviceMemory];
            unint64_t v270 = v404;
            int v271 = [v269 objectAtIndexedSubscript:v404];
            uint64_t v391 = (uint64_t)v263;
            uint64_t v272 = [v263 length];
            uint64_t v273 = v263;
            v274 = v392;
            [v267 copyFromBuffer:v273 sourceOffset:0 toBuffer:v271 destinationOffset:v392 size:v272];

            v275 = [v405 objectAtIndexedSubscript:2];
            int v276 = [v275 deviceMemory];
            uint64_t v277 = [v276 objectAtIndexedSubscript:v270];
            objc_msgSend(v267, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v266, 0, v277, v274, objc_msgSend(v266, "length"));

            unint64_t v131 = v399;
            [v267 endEncoding];
            [v255 removeAllObjects];

            id v9 = v405;
          }
          ++v229;
          v227 = (char *)v400;

          v392 += v387;
          uint64_t v230 = (uint64_t)v394;
          v401 = v227;
        }
        while (v398 != v229);

        id v181 = v385;
        unint64_t v225 = v366;
        v220 = v380;
        goto LABEL_109;
      }
    }
    long long v202 = v380;
    goto LABEL_91;
  }
LABEL_148:
}

- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  SEL v391 = a2;
  *(void *)&v438[12] = *MEMORY[0x1E4F143B8];
  id v396 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v11 count])
  {
    unint64_t v12 = 0;
    do
    {
      id v13 = [v11 objectAtIndexedSubscript:v12];
      [(MLCDeviceGPU *)self allocateResultTensor:v13];

      ++v12;
    }
    while (v12 < [v11 count]);
  }
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v14 = 0;
    id v390 = v438;
    unint64_t v15 = 0x1E6CB4000uLL;
    long long v392 = xmmword_1DD1F0C30;
    v412 = self;
    id v410 = v10;
    id v435 = v11;
    while (1)
    {
      objc_msgSend(v396, "objectAtIndexedSubscript:", v14, v390);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      unint64_t v432 = v14;
      v431 = [v17 objectAtIndexedSubscript:v14];

      id v18 = [v10 objectAtIndexedSubscript:0];
      uint64_t v19 = [v18 descriptor];
      BOOL v20 = [v19 shape];
      uint64_t v21 = [v20 count];

      uint64_t v22 = [v10 objectAtIndexedSubscript:0];
      unint64_t v23 = [v22 descriptor];
      float v24 = [v23 shape];
      uint64_t v406 = [v24 count];

      BOOL v25 = [v10 count] == 3 || objc_msgSend(v10, "count") == 4;
      LODWORD(v418) = v25;
      float v26 = [v10 objectAtIndexedSubscript:0];
      double v27 = [v26 descriptor];
      int v28 = [v27 variableLengthSequences];

      int v29 = [v16 returnsSequences];
      uint64_t v30 = [v16 isBidirectional];
      id v424 = 0;
      v407 = 0;
      uint64_t v405 = v30;
      if (v30) {
        uint64_t v31 = 2;
      }
      else {
        uint64_t v31 = 1;
      }
      uint64_t v423 = v31;
      LODWORD(v434) = v28;
      if (v28)
      {
        double v32 = [v10 objectAtIndexedSubscript:0];
        unint64_t v33 = [v32 descriptor];
        v407 = [v33 batchSizePerSequenceStep];

        uint64_t v34 = [v10 objectAtIndexedSubscript:0];
        uint64_t v35 = [v34 descriptor];
        id v424 = [v35 sequenceLengths];
      }
      uint64_t v433 = [v16 batchSize];
      unint64_t v36 = [v10 objectAtIndexedSubscript:0];
      id v37 = [v36 descriptor];
      int v38 = [v37 variableLengthSequences];

      if (v38)
      {
        uint64_t v39 = [v16 rnnBuffers];
        uint64_t v40 = [v39 objectAtIndexedSubscript:0];

        id v41 = v40;
        bzero((void *)[v41 contents], objc_msgSend(v41, "length"));
        objc_msgSend(*(id *)(v15 + 1088), "didModifyRange:buffer:", 0, objc_msgSend(v41, "length"), v41);
        unint64_t v42 = [v16 rnnBuffers];
        uint64_t v43 = [v42 objectAtIndexedSubscript:1];

        id v44 = v43;
        bzero((void *)[v44 contents], objc_msgSend(v44, "length"));
        objc_msgSend(*(id *)(v15 + 1088), "didModifyRange:buffer:", 0, objc_msgSend(v44, "length"), v44);
        uint64_t v45 = [v16 rnnBuffers];
        unint64_t v46 = [v45 objectAtIndexedSubscript:2];

        id v47 = v46;
        bzero((void *)[v47 contents], objc_msgSend(v47, "length"));
        objc_msgSend(*(id *)(v15 + 1088), "didModifyRange:buffer:", 0, objc_msgSend(v47, "length"), v47);
        uint64_t v48 = [v16 rnnBuffers];
        unint64_t v49 = [v48 objectAtIndexedSubscript:3];

        id v50 = v49;
        bzero((void *)[v50 contents], objc_msgSend(v50, "length"));
        objc_msgSend(*(id *)(v15 + 1088), "didModifyRange:buffer:", 0, objc_msgSend(v50, "length"), v50);
        if ([v16 isBidirectional])
        {
          unsigned int v51 = [v16 rnnBuffers];
          uint64_t v52 = [v51 objectAtIndexedSubscript:4];

          id v53 = v52;
          bzero((void *)[v53 contents], objc_msgSend(v53, "length"));
          objc_msgSend(*(id *)(v15 + 1088), "didModifyRange:buffer:", 0, objc_msgSend(v53, "length"), v53);
          uint64_t v54 = [v16 rnnBuffers];
          id v55 = [v54 objectAtIndexedSubscript:5];

          id v50 = v55;
          bzero((void *)[v50 contents], objc_msgSend(v50, "length"));
          objc_msgSend(*(id *)(v15 + 1088), "didModifyRange:buffer:", 0, objc_msgSend(v50, "length"), v50);
        }
        uint64_t v56 = [v435 objectAtIndexedSubscript:0];
        uint64_t v57 = [v56 deviceMemory];
        uint64_t v58 = [v57 objectAtIndexedSubscript:v432];

        id v59 = v58;
        bzero((void *)[v59 contents], objc_msgSend(v59, "length"));
        objc_msgSend(*(id *)(v15 + 1088), "didModifyRange:buffer:", 0, objc_msgSend(v59, "length"), v59);
      }
      if ([v16 batchFirst] && v406 == 4)
      {
        uint64_t v60 = [v16 rnnBuffers];
        id v61 = [v60 objectAtIndexedSubscript:0];
      }
      else
      {
        uint64_t v60 = [v10 objectAtIndexedSubscript:0];
        id v62 = [v60 deviceMemory];
        id v61 = [v62 objectAtIndexedSubscript:v432];
      }
      int v395 = v29;
      int v63 = v29 ^ 1;
      int v397 = v29 ^ 1;
      if (v21 != 3) {
        int v63 = 1;
      }
      int v400 = v63;
      if (v63 == 1)
      {
        uint64_t v64 = [v16 rnnBuffers];
        uint64_t v65 = [v64 objectAtIndexedSubscript:1];
      }
      else
      {
        uint64_t v64 = [v435 objectAtIndexedSubscript:0];
        uint64_t v66 = [v64 deviceMemory];
        uint64_t v65 = [v66 objectAtIndexedSubscript:v432];
      }
      int v67 = [v16 batchFirst];
      v428 = v65;
      if (v67 && v406 == 4)
      {
        int v68 = [v10 objectAtIndexedSubscript:0];
        int8x16_t v69 = [v68 descriptor];
        uint64_t v70 = [v69 shape];
        uint64_t v71 = [v70 objectAtIndexedSubscript:1];
        id v403 = (id)[v71 unsignedIntegerValue];

        id v72 = [v10 objectAtIndexedSubscript:0];
        uint64_t v73 = [v72 descriptor];
        uint64_t v74 = [v73 shape];
        long long v75 = [v74 objectAtIndexedSubscript:3];
        uint64_t v414 = [v75 unsignedIntegerValue];

        uint64_t v76 = [v435 objectAtIndexedSubscript:0];
        long long v77 = [v76 descriptor];
        int8x16_t v78 = [v77 shape];
        uint64_t v79 = [v78 objectAtIndexedSubscript:1];
        uint64_t v80 = self;
        unint64_t v81 = [v79 unsignedIntegerValue];

        uint64_t v82 = v81 >> v405;
        id v83 = [(MLCDeviceGPU *)v80 deviceList];
        unint64_t v84 = v61;
        unint64_t v85 = v432;
        uint64_t v86 = [v83 objectAtIndexedSubscript:v432];
        uint64_t v87 = [v10 objectAtIndexedSubscript:0];
        uint64_t v88 = [v87 deviceMemory];
        uint64_t v89 = [v88 objectAtIndexedSubscript:v85];
        uint64_t v90 = v433;
        copyNC1TtoNTCMTLBuffer(v431, v86, v433, (uint64_t)v403, v414, v89, v84);

        id v61 = v84;
        uint64_t v65 = v428;
      }
      else
      {
        if (![v16 batchFirst] || v21 != 3)
        {
          unint64_t v404 = +[MLCLog framework];
          if (os_log_type_enabled(v404, OS_LOG_TYPE_ERROR)) {
            -[MLCDeviceGPU(MLCEngineDispatch) dispatchRNNForwardLayer:sourceTensors:resultTensors:resultStateIsTemporary:forTraining:](v437, v391, v390, v404);
          }
          int v145 = 1;
          id v11 = v435;
          uint64_t v144 = v431;
          goto LABEL_141;
        }
        uint64_t v91 = [v10 objectAtIndexedSubscript:0];
        uint64_t v92 = [v91 descriptor];
        uint64_t v93 = [v92 shape];
        uint64_t v94 = [v93 objectAtIndexedSubscript:1];
        uint64_t v414 = [v94 unsignedIntegerValue];

        uint64_t v95 = [v10 objectAtIndexedSubscript:0];
        unint64_t v96 = [v95 descriptor];
        uint64_t v97 = [v96 shape];
        uint64_t v98 = [v97 objectAtIndexedSubscript:2];
        id v403 = (id)[v98 unsignedIntegerValue];

        unint64_t v99 = [v435 objectAtIndexedSubscript:0];
        uint64_t v100 = [v99 descriptor];
        id v101 = [v100 shape];
        id v102 = [v101 objectAtIndexedSubscript:2];
        unint64_t v81 = [v102 unsignedIntegerValue];

        uint64_t v82 = v81 >> v405;
        uint64_t v90 = v433;
      }
      uint64_t v103 = v414;
      uint64_t v104 = (uint64_t)v403;
      unint64_t v105 = v407;
      createMatrices(v414, v90, (uint64_t)v403, (uint64_t)v403, v407, 0, v61);
      id v430 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v415 = v81;
      uint64_t v402 = v82;
      createMatrices(v103, v90, v81, v82, v105, 0, v65);
      id v409 = (id)objc_claimAutoreleasedReturnValue();
      v399 = &v390;
      uint64_t v106 = MEMORY[0x1F4188790](v409);
      uint64_t v394 = v107;
      MEMORY[0x1F4188790](v106);
      v426 = (char *)&v390 - v109;
      int v110 = v423;
      uint64_t v111 = v412;
      if (v103)
      {
        uint64_t v112 = 0;
        for (uint64_t i = 0; i != v103; ++i)
        {
          v108[i] = v112;
          v112 += 4 * v104;
        }
        uint64_t v114 = 0;
        uint64_t v115 = 4 * v415;
        uint64_t v116 = v426;
        do
        {
          *(void *)uint64_t v116 = v114;
          v116 += 8;
          v114 += v115;
          --v103;
        }
        while (v103);
      }
      id v425 = v108;
      v401 = v61;
      unint64_t v117 = [v16 gradientKernel];
      unint64_t v422 = [v117 count];
      unint64_t v118 = (void *)MEMORY[0x1E4F1CBF0];
      unint64_t v119 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      id v120 = (id)[v118 mutableCopy];
      uint64_t v121 = [v16 rnnStackedLayersResults];
      id v427 = v16;
      id v429 = v117;
      id v417 = v120;
      if (!v121) {
        goto LABEL_44;
      }
      uint64_t v122 = (void *)v121;
      double v123 = [v16 rnnStackedLayersResults];
      int v124 = [v123 count] ? v434 : 1;

      BOOL v125 = v124 == 1;
      id v120 = v417;
      if (v125)
      {
LABEL_44:
        int v126 = [v117 count];
        int v127 = v111;
        int v128 = v126 - v110;
        id v129 = v435;
        unint64_t v130 = v432;
        unint64_t v131 = v119;
        if (v128 >= 1)
        {
          uint64_t v434 = 4 * v433 * v415 * v414;
          do
          {
            unint64_t v132 = [(MLCDeviceGPU *)v127 deviceList];
            [v132 objectAtIndexedSubscript:v130];
            uint64_t v134 = v133 = v131;
            unint64_t v135 = +[MLCGPUHelper mtlResourceOptions];
            signed int v136 = (void *)[v134 newBufferWithLength:v434 options:v135];

            uint64_t v137 = [v129 objectAtIndexedSubscript:0];
            uint64_t v138 = [v137 descriptor];
            [v138 batchSizePerSequenceStep];
            v140 = id v139 = v129;
            uint64_t v141 = createMatrices(v414, v433, v415, v415, v140, 0, v136);

            id v129 = v139;
            unint64_t v131 = v133;

            id v120 = v417;
            [v133 addObject:v141];
            [v120 addObject:v136];

            int v127 = v412;
            --v128;
          }
          while (v128);
        }
        id v16 = v427;
        [v427 setRnnStackedLayersResults:v131];
        [v16 setRnnStackedLayersBufferResults:v120];
        unint64_t v119 = v131;
        id v142 = v129;
        unint64_t v15 = 0x1E6CB4000uLL;
        unint64_t v143 = 0x1E4F35000;
        uint64_t v144 = v431;
      }
      else
      {
        uint64_t v146 = [v16 rnnStackedLayersResults];
        uint64_t v147 = [v146 count];

        uint64_t v144 = v431;
        unint64_t v15 = 0x1E6CB4000;
        if (v147)
        {
          uint64_t v148 = [v16 rnnStackedLayersResults];

          id v149 = [v16 rnnStackedLayersBufferResults];

          unint64_t v119 = (void *)v148;
          id v417 = v149;
        }
        id v142 = v435;
        unint64_t v143 = 0x1E4F35000;
      }
      id v411 = v119;
      unint64_t v150 = [v16 lstmDropoutSource];
      [v150 removeAllObjects];

      unint64_t v151 = [v16 lstmDropoutState];
      [v151 removeAllObjects];

      uint64_t v152 = v430;
      uint64_t v153 = [v16 rnnTrainableStates];
      uint64_t v154 = [v153 count];

      if (v154)
      {
        unint64_t v155 = 0;
        do
        {
          id v156 = [v16 rnnTrainableStates];
          id v157 = [v156 objectAtIndexedSubscript:v155];

          [v157 removeAllObjects];
          ++v155;
          v158 = [v16 rnnTrainableStates];
          unint64_t v159 = [v158 count];
        }
        while (v155 < v159);
      }
      unint64_t v404 = v152;
      unint64_t v160 = v152;
      id v161 = v429;
      uint64_t v419 = v422 >> v405;
      id v11 = v142;
      if (v422 >> v405)
      {
        unint64_t v162 = 0;
        uint64_t v163 = 0;
        unint64_t v160 = 0;
        v420 = (char *)((v422 >> v405) - 1);
        uint64_t v416 = 4 * v433 * v402;
        uint64_t v434 = (uint64_t)v404;
        do
        {
          if (v420 == v163)
          {
            id v164 = v409;
          }
          else
          {
            id v164 = [v411 objectAtIndexedSubscript:v163];
          }
          id v430 = v164;

          unint64_t v422 = (unint64_t)v162;
          if (v418)
          {
            char v165 = [v161 objectAtIndexedSubscript:v163];
            uint64_t v166 = [v165 temporaryRecurrentStateForCommandBuffer:v144 batchSize:v433 forGradientPass:0];

            uint64_t v167 = [v166 getRecurrentOutputMatrixForLayerIndex:0];
            char v168 = [v167 data];

            uint64_t v169 = [v166 getMemoryCellMatrixForLayerIndex:0];
            id v413 = [v169 data];

            uint64_t v170 = [v144 blitCommandEncoder];
            id v171 = v410;
            uint64_t v172 = [v410 objectAtIndexedSubscript:1];
            uint64_t v173 = [v172 deviceMemory];
            unint64_t v174 = v432;
            uint64_t v175 = [v173 objectAtIndexedSubscript:v432];
            id v421 = v168;
            objc_msgSend(v170, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v175, v162, v168, 0, objc_msgSend(v168, "length"));

            uint64_t v176 = v171;
            id v177 = v435;
            unint64_t v178 = [v176 objectAtIndexedSubscript:2];
            uint64_t v179 = [v178 deviceMemory];
            unint64_t v180 = v174;
            id v16 = v427;
            id v181 = [v179 objectAtIndexedSubscript:v180];
            id v182 = v413;
            uint64_t v183 = [v413 length];
            uint64_t v184 = v162;
            int v185 = v166;
            [v170 copyFromBuffer:v181 sourceOffset:v184 toBuffer:v182 destinationOffset:0 size:v183];

            [v170 endEncoding];
            uint64_t v186 = [v429 objectAtIndexedSubscript:v163];
            [v186 setRecurrentOutputIsTemporary:1];

            uint64_t v187 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
            id v161 = v429;
          }
          else
          {
            int v185 = 0;
            uint64_t v187 = 0;
            id v177 = v11;
          }
          uint64_t v188 = [v161 objectAtIndexedSubscript:v163];
          [v188 setPropagateFullRecurrentRows:1];

          long long v189 = [v161 objectAtIndexedSubscript:v163];
          uint64_t v190 = [v16 rnnTrainableStates];
          uint64_t v191 = [v190 objectAtIndexedSubscript:v163];
          uint64_t v192 = [v16 rnnTrainableWeights];
          unint64_t v193 = [v192 objectAtIndexedSubscript:v163];
          id v421 = v185;
          long long v389 = v185;
          uint64x2_t v194 = v431;
          [v189 encodeForwardSequenceToCommandBuffer:v431 sourceMatrices:v434 sourceOffsets:v425 destinationMatrices:v430 destinationOffsets:v426 trainingStates:v191 recurrentInputState:v389 recurrentOutputStates:v187 weights:v193];

          uint64_t v195 = [v177 count];
          id v11 = v177;
          uint64_t v144 = v194;
          unint64_t v196 = v422;
          if (v195 == 3 && v187 && [v187 count])
          {
            uint64_t v197 = [v187 objectAtIndexedSubscript:0];
            int32x2_t v198 = [v197 getRecurrentOutputMatrixForLayerIndex:0];
            uint64_t v199 = [v198 data];

            uint64_t v200 = [v187 objectAtIndexedSubscript:0];
            int64x2_t v201 = [v200 getMemoryCellMatrixForLayerIndex:0];
            long long v202 = [v201 data];

            int32x2_t v203 = [v144 blitCommandEncoder];
            uint64_t v204 = [v435 objectAtIndexedSubscript:1];
            uint64_t v205 = [v204 deviceMemory];
            unint64_t v206 = v432;
            uint64_t v207 = [v205 objectAtIndexedSubscript:v432];
            objc_msgSend(v203, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v199, 0, v207, v196, objc_msgSend(v199, "length"));

            uint64_t v208 = [v435 objectAtIndexedSubscript:2];
            uint64_t v209 = [v208 deviceMemory];
            unint64_t v210 = v206;
            uint64_t v144 = v431;
            uint64x2_t v211 = [v209 objectAtIndexedSubscript:v210];
            objc_msgSend(v203, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v202, 0, v211, v196, objc_msgSend(v202, "length"));

            [v203 endEncoding];
            [v187 removeAllObjects];

            id v16 = v427;
            id v11 = v435;
          }
          uint64_t v212 = (char *)v419;
          if (v419 != 1 && v420 != v163)
          {
            [v16 lstmDropout];
            if (v213 > 0.0 && ([v16 isBidirectional] & 1) == 0)
            {
              uint64_t v214 = [MEMORY[0x1E4F35578] imageDescriptorWithChannelFormat:4 width:1 height:v415 featureChannels:v414];
              id v425 = v214;
              int32x2_t v215 = [MEMORY[0x1E4F35978] defaultAllocator];
              id v413 = v215;
              uint64_t v216 = v412;
              uint64_t v217 = [(MLCDeviceGPU *)v412 gpuWriteTensorKernelList];
              unint64_t v218 = v432;
              int32x2_t v219 = [v217 objectAtIndexedSubscript:v432];
              uint64_t v220 = [v427 batchSize];
              uint64_t v221 = [v215 imageBatchForCommandBuffer:v431 imageDescriptor:v214 kernel:v219 count:v220];

              MPSImageBatchIncrementReadCount(v221, 1);
              id v222 = [(MLCDeviceGPU *)v216 gpuWriteTensorKernelList];
              v223 = [v222 objectAtIndexedSubscript:v218];
              v224 = [v417 objectAtIndexedSubscript:v163];
              +[MLCGPUHelper copyMTLBufferToMPSImageBatch:v223 commandBuffer:v431 sourceMTLBuffer:v224 destinationImageBatch:v221 MLCDataType:1];

              unint64_t v225 = [v427 lstmDropoutForwardKernel];
              uint64_t v226 = [v225 objectAtIndexedSubscript:v163];

              v227 = [MEMORY[0x1E4F35978] defaultAllocator];
              [v226 setDestinationImageAllocator:v227];

              id v436 = 0;
              id v408 = [v226 encodeBatchToCommandBuffer:v431 sourceImages:v221 destinationStates:&v436 destinationStateIsTemporary:1];
              id v228 = v436;
              uint64_t v229 = [v427 lstmDropoutSource];
              [v229 addObject:v221];

              uint64_t v230 = [v427 lstmDropoutState];
              [v230 addObject:v228];

              id v231 = [(MLCDeviceGPU *)v216 gpuReadTensorKernelList];
              unint64_t v232 = v218;
              uint64_t v144 = v431;
              v233 = [v231 objectAtIndexedSubscript:v232];
              v234 = [v417 objectAtIndexedSubscript:v163];
              id v235 = v408;
              +[MLCGPUHelper copyMPSImageBatchToMTLBuffer:v233 commandBuffer:v144 sourceImageBatch:v408 destinationMTLBuffer:v234 MLCDataType:1];

              id v16 = v427;
              uint64_t v212 = (char *)v419;

              id v11 = v435;
            }
          }
          unint64_t v160 = v430;

          ++v163;
          unint64_t v162 = (char *)(v196 + v416);
          id v425 = v426;
          uint64_t v434 = (uint64_t)v160;
          unint64_t v143 = 0x1E4F35000;
          id v161 = v429;
        }
        while (v212 != v163);

        unint64_t v15 = 0x1E6CB4000;
      }
      uint64_t v398 = v160;
      if ([v16 isBidirectional])
      {
        id v236 = v11;
        uint64_t v237 = v414;
        uint64_t v238 = v433;
        uint64_t v239 = (uint64_t)v403;
        uint64_t v240 = v407;
        createMatrices(v414, v433, (uint64_t)v403, (uint64_t)v403, v407, 1, v401);
        id v430 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v241 = v238;
        uint64_t v242 = v415;
        uint64_t v243 = v402;
        createMatrices(v237, v241, v415, v402, v240, 1, v428);
        id v408 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v393 = &v390;
        MEMORY[0x1F4188790](v408);
        uint64_t v245 = (void *)MEMORY[0x1F4188790]((char *)&v390 - ((v244 + 15) & 0xFFFFFFFFFFFFFFF0));
        uint64_t v434 = (uint64_t)&v390 - v246;
        if (v237)
        {
          uint64_t v247 = 0;
          unint64_t v248 = (v237 + 1) & 0xFFFFFFFFFFFFFFFELL;
          uint64x2_t v249 = (uint64x2_t)vdupq_n_s64(v237 - 1);
          uint64_t v250 = 4 * v239 * (v237 - 1);
          int64x2_t v251 = (int64x2_t)v392;
          do
          {
            int32x2_t v252 = vmovn_s64((int64x2_t)vcgeq_u64(v249, (uint64x2_t)v251));
            if (v252.i8[0]) {
              v245[v247] = v250;
            }
            if (v252.i8[4]) {
              v245[v247 + 1] = 4 * v239 * (v237 + (v247 ^ 0xFFFFFFFFFFFFFFFELL));
            }
            v247 += 2;
            int64x2_t v251 = vaddq_s64(v251, vdupq_n_s64(2uLL));
            v250 -= 8 * v239;
          }
          while (v248 != v247);
          uint64_t v253 = 0;
          uint64_t v254 = 4 * v242 * (v237 - 1) + 4 * v243;
          int64x2_t v255 = (int64x2_t)v392;
          do
          {
            int32x2_t v256 = vmovn_s64((int64x2_t)vcgeq_u64(v249, (uint64x2_t)v255));
            if (v256.i8[0]) {
              *(void *)(v434 + 8 * v253) = v254;
            }
            if (v256.i8[4]) {
              *(void *)(v434 + 8 * v253 + 8) = 4 * (v243 + (v237 + (v253 ^ 0x3FFFFFFFFFFFFFFELL)) * v242);
            }
            v253 += 2;
            int64x2_t v255 = vaddq_s64(v255, vdupq_n_s64(2uLL));
            v254 -= 8 * v242;
          }
          while (v248 != v253);
        }
        id v421 = v245;
        id v257 = v430;
        uint64_t v258 = v257;
        char v259 = (char *)v257;
        uint64_t v260 = v419;
        id v11 = v236;
        uint64_t v144 = v431;
        if (v419)
        {
          uint64_t v261 = 0;
          char v259 = 0;
          v420 = (char *)(v419 - 1);
          uint64_t v416 = 4 * v433 * v402;
          unint64_t v422 = v416;
          id v403 = v257;
          id v430 = v257;
          do
          {
            if (v420 == v261)
            {
              uint64_t v262 = (char *)v408;
            }
            else
            {
              uint64_t v262 = [v411 objectAtIndexedSubscript:&v261[v260 - 1]];
            }
            v426 = v262;

            v263 = &v261[v260];
            if (v418)
            {
              v264 = [v161 objectAtIndexedSubscript:&v261[v260]];
              v265 = [v264 temporaryRecurrentStateForCommandBuffer:v144 batchSize:v433 forGradientPass:0];

              id v425 = v265;
              v266 = [v265 getRecurrentOutputMatrixForLayerIndex:0];
              v267 = [v266 data];

              v268 = [v265 getMemoryCellMatrixForLayerIndex:0];
              id v413 = [v268 data];

              unint64_t v269 = [v144 blitCommandEncoder];
              id v270 = v410;
              int v271 = [v410 objectAtIndexedSubscript:1];
              uint64_t v272 = [v271 deviceMemory];
              unint64_t v273 = v432;
              v274 = [v272 objectAtIndexedSubscript:v432];
              uint64_t v275 = [v267 length];
              unint64_t v276 = v422;
              [v269 copyFromBuffer:v274 sourceOffset:v422 toBuffer:v267 destinationOffset:0 size:v275];

              uint64_t v277 = v270;
              id v161 = v429;
              id v278 = [v277 objectAtIndexedSubscript:2];
              unint64_t v279 = [v278 deviceMemory];
              int v280 = [v279 objectAtIndexedSubscript:v273];
              unint64_t v281 = v261;
              id v282 = v413;
              objc_msgSend(v269, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v280, v276, v413, 0, objc_msgSend(v413, "length"));

              id v16 = v427;
              [v269 endEncoding];
              char v283 = [v161 objectAtIndexedSubscript:v263];
              [v283 setRecurrentOutputIsTemporary:1];

              char v284 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
              uint64_t v261 = v281;
              unint64_t v15 = 0x1E6CB4000;

              id v285 = v425;
            }
            else
            {
              id v285 = 0;
              char v284 = 0;
            }
            char v286 = [v161 objectAtIndexedSubscript:v263];
            id v287 = [v16 rnnTrainableStates];
            v288 = [v287 objectAtIndexedSubscript:v263];
            unint64_t v289 = [v16 rnnTrainableWeights];
            v290 = [v289 objectAtIndexedSubscript:v263];
            id v425 = v285;
            [v286 encodeForwardSequenceToCommandBuffer:v431 sourceMatrices:v430 sourceOffsets:v421 destinationMatrices:v426 destinationOffsets:v434 trainingStates:v288 recurrentInputState:v285 recurrentOutputStates:v284 weights:v290];

            id v11 = v435;
            if ([v435 count] == 3 && v284 && objc_msgSend(v284, "count"))
            {
              uint64_t v291 = [v284 objectAtIndexedSubscript:0];
              id v292 = [v291 getRecurrentOutputMatrixForLayerIndex:0];
              uint64_t v293 = [v292 data];

              v294 = [v284 objectAtIndexedSubscript:0];
              v295 = [v294 getMemoryCellMatrixForLayerIndex:0];
              uint64_t v296 = [v295 data];

              uint64_t v297 = [v431 blitCommandEncoder];
              uint64_t v298 = [v435 objectAtIndexedSubscript:1];
              unsigned int v299 = [v298 deviceMemory];
              unint64_t v300 = v432;
              uint64_t v301 = [v299 objectAtIndexedSubscript:v432];
              uint64_t v302 = [v293 length];
              unint64_t v303 = v422;
              [v297 copyFromBuffer:v293 sourceOffset:0 toBuffer:v301 destinationOffset:v422 size:v302];

              int v304 = [v435 objectAtIndexedSubscript:2];
              uint64_t v305 = [v304 deviceMemory];
              unint64_t v306 = v300;
              unint64_t v15 = 0x1E6CB4000;
              id v307 = [v305 objectAtIndexedSubscript:v306];
              objc_msgSend(v297, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v296, 0, v307, v303, objc_msgSend(v296, "length"));

              id v161 = v429;
              [v297 endEncoding];
              [v284 removeAllObjects];

              id v11 = v435;
            }
            ++v261;
            char v259 = v426;

            id v421 = (id)v434;
            v422 += v416;
            id v430 = v259;
            uint64_t v260 = v419;
            id v16 = v427;
            uint64_t v144 = v431;
          }
          while ((char *)v419 != v261);

          unint64_t v143 = 0x1E4F35000uLL;
          uint64_t v258 = v403;
        }
      }
      id v10 = v410;
      v308 = [v410 objectAtIndexedSubscript:0];
      [v16 setSource:v308];

      id v309 = [v11 objectAtIndexedSubscript:0];
      [v16 setResult:v309];

      uint64_t v310 = MEMORY[0x1E01B11E0]();
      uint64_t v311 = (void *)v310;
      self = v412;
      if (v400) {
        break;
      }
      int v145 = 1;
      id v61 = v401;
LABEL_140:

LABEL_141:
      if (!v145)
      {
        unint64_t v14 = v432 + 1;
        if (v14 < [(MLCDeviceGPU *)self numDevicesToUse]) {
          continue;
        }
      }
      goto LABEL_145;
    }
    if (v406 == 4) {
      char v312 = v397;
    }
    else {
      char v312 = 1;
    }
    if (v312)
    {
      char v313 = v395;
      if (v424) {
        char v313 = 1;
      }
      if ((v313 & 1) == 0)
      {
        v418 = (void *)v310;
        id v369 = objc_alloc(MEMORY[0x1E4F35628]);
        int64x2_t v370 = [(MLCDeviceGPU *)self deviceList];
        unint64_t v371 = v432;
        long long v372 = [v370 objectAtIndexedSubscript:v432];
        id v430 = (id)[v369 initWithDevice:v372 count:v423];

        id v373 = objc_alloc(MEMORY[0x1E4F35620]);
        uint64_t v374 = [(MLCDeviceGPU *)self deviceList];
        uint64_t v375 = [v374 objectAtIndexedSubscript:v371];
        uint64_t v376 = v433;
        uint64_t v416 = [v373 initWithDevice:v375 copyRows:v433 copyColumns:v402 sourcesAreTransposed:0 destinationsAreTransposed:0];

        uint64_t v377 = v415;
        uint64_t v378 = ((v414 - 1) * v415);
        unint64_t v379 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v376 columns:v414 * v415 rowBytes:4 * v414 * v415 dataType:268435488];
        int v380 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v376 columns:v377 rowBytes:4 * v377 dataType:268435488];
        id v381 = objc_alloc(MEMORY[0x1E4F35618]);
        v420 = v379;
        id v382 = (void *)[v381 initWithBuffer:v428 offset:0 descriptor:v379];
        id v383 = objc_alloc(MEMORY[0x1E4F35618]);
        id v384 = [v435 objectAtIndexedSubscript:0];
        id v385 = [v384 deviceMemory];
        id v386 = [v385 objectAtIndexedSubscript:v371];
        v426 = v380;
        uint64_t v387 = (void *)[v383 initWithBuffer:v386 offset:0 descriptor:v380];

        id v16 = v427;
        id v368 = v430;
        objc_msgSend(v430, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", 0, v382, v387, v378 << 32, 0);
        if ([v16 isBidirectional]) {
          objc_msgSend(v368, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", 1, v382, v387, v402 << 32, v402 << 32);
        }
        id v367 = (id)v416;
        unint64_t v388 = v431;
        [(id)v416 encodeToCommandBuffer:v431 copyDescriptor:v368];

        uint64_t v144 = v388;
        id v61 = v401;
        self = v412;
        goto LABEL_138;
      }
      if (v424) {
        int v314 = v397;
      }
      else {
        int v314 = 0;
      }
      if (v314 != 1)
      {
        int v145 = 0;
        uint64_t v144 = v431;
        id v61 = v401;
        goto LABEL_139;
      }
      v418 = (void *)v310;
      char v315 = v405;
      id v316 = objc_alloc(MEMORY[0x1E4F35628]);
      id v317 = [(MLCDeviceGPU *)self deviceList];
      unint64_t v318 = v432;
      v319 = [v317 objectAtIndexedSubscript:v432];
      uint64_t v320 = v433;
      id v430 = (id)[v316 initWithDevice:v319 count:v433 << v315];

      id v321 = objc_alloc(MEMORY[0x1E4F35620]);
      uint64_t v322 = [(MLCDeviceGPU *)self deviceList];
      uint64_t v323 = [v322 objectAtIndexedSubscript:v318];
      uint64_t v324 = v402;
      uint64_t v416 = [v321 initWithDevice:v323 copyRows:1 copyColumns:v402 sourcesAreTransposed:0 destinationsAreTransposed:0];

      uint64_t v325 = v415;
      uint64_t v326 = v414;
      v420 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v414 columns:v415 rowBytes:4 * v415 dataType:268435488];
      v426 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:1 columns:v325 rowBytes:4 * v325 dataType:268435488];
      if (v320)
      {
        id v425 = 0;
        LODWORD(v327) = 0;
        uint64_t v328 = v324 << 32;
        uint64_t v419 = 4 * v326;
        do
        {
          uint64_t v329 = 0;
          uint64_t v330 = (char *)v425;
          id v421 = (id)(4 * (void)v425 * v415);
          unint64_t v422 = v419 * (void)v425 * v415;
          do
          {
            v331 = [v424 objectAtIndexedSubscript:v425];
            int v332 = [v331 unsignedIntegerValue];

            uint64_t v434 = (v332 - 1);
            uint64_t v333 = v327;
            id v334 = objc_alloc(MEMORY[0x1E4F35618]);
            id v335 = (void *)[v334 initWithBuffer:v428 offset:v422 descriptor:v420];
            id v336 = objc_alloc(MEMORY[0x1E4F35618]);
            v337 = [v435 objectAtIndexedSubscript:0];
            int v338 = [v337 deviceMemory];
            uint64_t v339 = [v338 objectAtIndexedSubscript:v318];
            v340 = (void *)[v336 initWithBuffer:v339 offset:v421 descriptor:v426];

            if (v329 == 1) {
              uint64_t v341 = v328;
            }
            else {
              uint64_t v341 = 0;
            }
            uint64_t v327 = v341 | v333;
            uint64_t v342 = v433;
            if (v329 == 1) {
              uint64_t v343 = v328;
            }
            else {
              uint64_t v343 = v434;
            }
            objc_msgSend(v430, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", v330, v335, v340, v343, v327);

            unint64_t v318 = v432;
            ++v329;
            v330 += v342;
          }
          while (v423 != v329);
          id v425 = (char *)v425 + 1;
        }
        while (v425 != (id)v342);
      }
    }
    else
    {
      v418 = (void *)v310;
      id v344 = objc_alloc(MEMORY[0x1E4F35628]);
      unint64_t v345 = [(MLCDeviceGPU *)self deviceList];
      unint64_t v346 = v432;
      id v347 = [v345 objectAtIndexedSubscript:v432];
      uint64_t v348 = v433;
      id v430 = (id)[v344 initWithDevice:v347 count:v433];

      id v349 = objc_alloc(MEMORY[0x1E4F35620]);
      uint64_t v350 = [(MLCDeviceGPU *)self deviceList];
      uint64_t v351 = [v350 objectAtIndexedSubscript:v346];
      uint64_t v352 = v414;
      uint64_t v353 = v415;
      uint64_t v416 = [v349 initWithDevice:v351 copyRows:v414 copyColumns:v415 sourcesAreTransposed:0 destinationsAreTransposed:1];

      v354 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v352 columns:v353 rowBytes:4 * v353 dataType:268435488];
      v426 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v353 columns:v352 rowBytes:4 * v352 dataType:268435488];
      id v355 = v435;
      uint64_t v356 = v428;
      if (v348)
      {
        unint64_t v357 = v143;
        uint64_t v358 = 0;
        uint64_t v359 = 0;
        uint64_t v434 = 4 * v352 * v353;
        do
        {
          int v360 = (void *)[objc_alloc(*(Class *)(v357 + 1560)) initWithBuffer:v356 offset:v358 descriptor:v354];
          uint64_t v361 = v354;
          id v362 = objc_alloc(*(Class *)(v357 + 1560));
          long long v363 = [v355 objectAtIndexedSubscript:0];
          id v364 = [v363 deviceMemory];
          id v365 = [v364 objectAtIndexedSubscript:v432];
          v366 = (void *)[v362 initWithBuffer:v365 offset:v358 descriptor:v426];

          objc_msgSend(v430, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", v359, v360, v366, 0, 0);
          v354 = v361;

          uint64_t v356 = v428;
          ++v359;
          v358 += v434;
        }
        while (v433 != v359);
      }
      v420 = v354;
    }
    id v367 = (id)v416;
    id v368 = v430;
    uint64_t v144 = v431;
    [(id)v416 encodeToCommandBuffer:v431 copyDescriptor:v430];
    self = v412;
    id v10 = v410;
    unint64_t v15 = 0x1E6CB4000;
    id v16 = v427;
    id v61 = v401;
LABEL_138:
    uint64_t v311 = v418;

    int v145 = 0;
LABEL_139:
    id v11 = v435;
    goto LABEL_140;
  }
LABEL_145:
}

- (void)dispatchRNNGradientLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensors:(id)a5
{
  v339[2] = *MEMORY[0x1E4F143B8];
  id v299 = a3;
  id v334 = a4;
  id v8 = a5;
  id v9 = [v8 objectAtIndexedSubscript:0];
  [(MLCDeviceGPU *)self allocateResultTensor:v9];

  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v10 = 0;
    long long v298 = xmmword_1DD1F0C30;
    uint64_t v320 = self;
    id v311 = v8;
    while (1)
    {
      objc_msgSend(v299, "objectAtIndexedSubscript:", v10, v298);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v12 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      unint64_t v338 = v10;
      uint64_t v326 = [v12 objectAtIndexedSubscript:v10];

      int v13 = [v11 returnsSequences];
      unint64_t v14 = [v11 source];
      unint64_t v15 = [v14 descriptor];
      int v16 = [v15 variableLengthSequences];

      id v17 = [v14 descriptor];
      id v18 = [v17 shape];
      uint64_t v306 = [v18 count];

      uint64_t v19 = [v14 descriptor];
      BOOL v20 = [v19 shape];
      uint64_t v304 = [v20 count];

      id v324 = (id)[v11 isBidirectional];
      if (v324) {
        uint64_t v21 = 2;
      }
      else {
        uint64_t v21 = 1;
      }
      LODWORD(v333) = v16;
      if (v16)
      {
        uint64_t v22 = [v14 descriptor];
        id v309 = [v22 batchSizePerSequenceStep];

        unint64_t v23 = [v14 descriptor];
        id v335 = [v23 sequenceLengths];
      }
      else
      {
        id v335 = 0;
        id v309 = 0;
      }
      uint64_t v337 = [v11 batchSize];
      float v24 = [v11 rnnBuffers];
      BOOL v25 = [v24 objectAtIndexedSubscript:0];

      float v26 = [v11 rnnBuffers];
      id v336 = [v26 objectAtIndexedSubscript:2];

      double v27 = [v11 rnnBuffers];
      int v28 = [v27 objectAtIndexedSubscript:3];

      if ([v11 batchFirst] && v306 == 3)
      {
        int v29 = [v14 deviceMemory];
        unint64_t v30 = v338;
        id v307 = [v29 objectAtIndexedSubscript:v338];

        uint64_t v31 = [v311 objectAtIndexedSubscript:0];
        double v32 = [v31 deviceMemory];
        v308 = [v32 objectAtIndexedSubscript:v30];

        if (v13)
        {
          unint64_t v33 = [v334 objectAtIndexedSubscript:0];
          uint64_t v34 = [v33 deviceMemory];
          uint64_t v35 = [v34 objectAtIndexedSubscript:v30];

          id v336 = v35;
        }
      }
      else
      {
        v308 = v28;
        id v307 = v25;
      }
      unint64_t v36 = [v14 descriptor];
      int v37 = [v36 variableLengthSequences];

      if (v37)
      {
        int v38 = v308;
        bzero((void *)[v38 contents], objc_msgSend(v38, "length"));
        +[MLCGPUHelper didModifyRange:buffer:](MLCGPUHelper, "didModifyRange:buffer:", 0, [v38 length], v38);
      }
      int v39 = [v11 batchFirst];
      uint64_t v331 = v21;
      if (v39 && v304 == 4)
      {
        uint64_t v40 = [v14 descriptor];
        id v41 = [v40 shape];
        unint64_t v42 = [v41 objectAtIndexedSubscript:1];
        uint64_t v310 = [v42 unsignedIntegerValue];

        uint64_t v43 = [v14 descriptor];
        id v44 = [v43 shape];
        uint64_t v45 = [v44 objectAtIndexedSubscript:3];
        uint64_t v46 = [v45 unsignedIntegerValue];

        id v47 = [v334 objectAtIndexedSubscript:0];
        uint64_t v48 = [v47 descriptor];
        unint64_t v49 = [v48 shape];
        id v50 = v49;
        uint64_t v51 = 1;
      }
      else
      {
        if (![v11 batchFirst] || v306 != 3)
        {
          uint64_t v310 = 0;
          unint64_t v305 = 0;
          unint64_t v53 = 0;
          uint64_t v46 = 1;
          goto LABEL_23;
        }
        v290 = [v14 descriptor];
        uint64_t v291 = [v290 shape];
        id v292 = [v291 objectAtIndexedSubscript:1];
        uint64_t v46 = [v292 unsignedIntegerValue];

        uint64_t v293 = [v14 descriptor];
        v294 = [v293 shape];
        v295 = [v294 objectAtIndexedSubscript:2];
        uint64_t v310 = [v295 unsignedIntegerValue];

        id v47 = [v334 objectAtIndexedSubscript:0];
        uint64_t v48 = [v47 descriptor];
        unint64_t v49 = [v48 shape];
        id v50 = v49;
        uint64_t v51 = 2;
      }
      uint64_t v52 = [v49 objectAtIndexedSubscript:v51];
      unint64_t v53 = [v52 unsignedIntegerValue];

      unint64_t v305 = v53 >> (char)v324;
LABEL_23:
      id v54 = v335;
      int v55 = [v11 batchFirst];
      uint64_t v56 = 4 * v53;
      id v328 = v11;
      id v335 = v54;
      uint64_t v321 = v46;
      unint64_t v313 = v53;
      id v327 = (id)(4 * v53);
      id v303 = v14;
      if (v55 && v304 == 4 && ((v13 ^ 1) & 1) == 0)
      {
        uint64_t v330 = (void *)MEMORY[0x1E01B11E0]();
        uint64_t v57 = v46;
        id v58 = objc_alloc(MEMORY[0x1E4F35628]);
        id v59 = [(MLCDeviceGPU *)self deviceList];
        unint64_t v60 = v338;
        id v61 = [v59 objectAtIndexedSubscript:v338];
        uint64_t v62 = v337;
        uint64_t v333 = [v58 initWithDevice:v61 count:v337];

        id v63 = objc_alloc(MEMORY[0x1E4F35620]);
        uint64_t v64 = [(MLCDeviceGPU *)self deviceList];
        uint64_t v65 = [v64 objectAtIndexedSubscript:v60];
        uint64_t v329 = [v63 initWithDevice:v65 copyRows:v57 copyColumns:v53 sourcesAreTransposed:1 destinationsAreTransposed:0];

        uint64_t v332 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v53 columns:v57 rowBytes:4 * v57 dataType:268435488];
        uint64_t v66 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v57 columns:v53 rowBytes:4 * v53 dataType:268435488];
        id v67 = v334;
        int v68 = v336;
        if (v62)
        {
          uint64_t v69 = 0;
          uint64_t v70 = 0;
          uint64_t v331 = 4 * v321 * v313;
          do
          {
            id v71 = objc_alloc(MEMORY[0x1E4F35618]);
            id v72 = [v67 objectAtIndexedSubscript:0];
            uint64_t v73 = [v72 deviceMemory];
            [v73 objectAtIndexedSubscript:v338];
            long long v75 = v74 = v66;
            uint64_t v76 = (void *)[v71 initWithBuffer:v75 offset:v69 descriptor:v332];

            uint64_t v66 = v74;
            uint64_t v62 = v337;
            long long v77 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v68 offset:v69 descriptor:v74];
            objc_msgSend((id)v333, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", v70, v76, v77, 0, 0);

            ++v70;
            v69 += v331;
          }
          while (v62 != v70);
        }
        id v78 = (id)v329;
        uint64_t v79 = (void *)v326;
        id v80 = (id)v333;
        [(id)v329 encodeToCommandBuffer:v326 copyDescriptor:v333];

        id v11 = v328;
      }
      else
      {
        int v81 = [v11 batchFirst];
        int v82 = v333;
        if ((v81 ^ 1 | v13 | v333))
        {
          char v83 = [v11 batchFirst] ^ 1 | v13;
          uint64_t v79 = (void *)v326;
          uint64_t v62 = v337;
          if ((v83 & 1) == 0 && ((v82 ^ 1) & 1) == 0)
          {
            uint64_t v323 = (char *)MEMORY[0x1E01B11E0]();
            id v84 = objc_alloc(MEMORY[0x1E4F35628]);
            unint64_t v85 = [(MLCDeviceGPU *)self deviceList];
            uint64_t v86 = v46;
            unint64_t v87 = v338;
            uint64_t v88 = [v85 objectAtIndexedSubscript:v338];
            uint64_t v89 = (void *)[v84 initWithDevice:v88 count:v62 << (char)v324];

            id v90 = objc_alloc(MEMORY[0x1E4F35620]);
            uint64_t v91 = [(MLCDeviceGPU *)self deviceList];
            uint64_t v92 = [v91 objectAtIndexedSubscript:v87];
            id v322 = (id)[v90 initWithDevice:v92 copyRows:1 copyColumns:v305 sourcesAreTransposed:0 destinationsAreTransposed:0];

            uint64_t v93 = v313;
            uint64_t v330 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:1 columns:v313 rowBytes:v327 dataType:268435488];
            uint64_t v56 = (uint64_t)v327;
            uint64_t v329 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v86 columns:v93 rowBytes:v327 dataType:268435488];
            if (v62)
            {
              uint64_t v94 = 0;
              uint64_t v95 = v305 << 32;
              uint64_t v325 = 4 * v321 * v313;
              do
              {
                uint64_t v96 = 0;
                uint64_t v97 = v94;
                uint64_t v332 = v325 * v94;
                uint64_t v333 = v56 * v94;
                do
                {
                  uint64_t v98 = [v335 objectAtIndexedSubscript:v94];
                  int v99 = [v98 unsignedIntegerValue];

                  uint64_t v100 = v89;
                  uint64_t v101 = (v99 - 1);
                  id v102 = objc_alloc(MEMORY[0x1E4F35618]);
                  uint64_t v103 = [v334 objectAtIndexedSubscript:0];
                  uint64_t v104 = [v103 deviceMemory];
                  unint64_t v105 = [v104 objectAtIndexedSubscript:v338];
                  uint64_t v106 = (void *)[v102 initWithBuffer:v105 offset:v333 descriptor:v330];

                  id v107 = objc_alloc(MEMORY[0x1E4F35618]);
                  uint64_t v108 = (void *)[v107 initWithBuffer:v336 offset:v332 descriptor:v329];
                  if (v96 == 1) {
                    uint64_t v109 = v95;
                  }
                  else {
                    uint64_t v109 = v101;
                  }
                  uint64_t v89 = v100;
                  if (v96 == 1) {
                    uint64_t v110 = v95;
                  }
                  else {
                    uint64_t v110 = 0;
                  }
                  objc_msgSend(v100, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", v97, v106, v108, v110, v109);

                  ++v96;
                  v97 += v337;
                }
                while (v331 != v96);
                ++v94;
                uint64_t v62 = v337;
                uint64_t v56 = (uint64_t)v327;
              }
              while (v94 != v337);
            }
            id v111 = v322;
            uint64_t v79 = (void *)v326;
            [v322 encodeToCommandBuffer:v326 copyDescriptor:v89];

            id v11 = v328;
            uint64_t v46 = v321;
          }
          goto LABEL_49;
        }
        uint64_t v112 = 4 * v53;
        id v113 = objc_alloc(MEMORY[0x1E4F35628]);
        uint64_t v114 = [(MLCDeviceGPU *)self deviceList];
        unint64_t v115 = v338;
        uint64_t v116 = [v114 objectAtIndexedSubscript:v338];
        unint64_t v117 = (void *)[v113 initWithDevice:v116 count:v331];

        uint64_t v118 = v46;
        id v119 = objc_alloc(MEMORY[0x1E4F35620]);
        id v120 = [(MLCDeviceGPU *)self deviceList];
        uint64_t v121 = [v120 objectAtIndexedSubscript:v115];
        uint64_t v122 = v337;
        uint64_t v333 = [v119 initWithDevice:v121 copyRows:v337 copyColumns:v305 sourcesAreTransposed:0 destinationsAreTransposed:0];

        uint64_t v123 = v313;
        unint64_t v124 = (unint64_t)(v313 * (v118 - 1)) << 32;
        BOOL v125 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v122 columns:v118 * v313 rowBytes:4 * v118 * v313 dataType:268435488];
        int v126 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v122 columns:v123 rowBytes:v112 dataType:268435488];
        id v127 = objc_alloc(MEMORY[0x1E4F35618]);
        int v128 = (void *)[v127 initWithBuffer:v336 offset:0 descriptor:v125];
        id v129 = objc_alloc(MEMORY[0x1E4F35618]);
        unint64_t v130 = [v334 objectAtIndexedSubscript:0];
        unint64_t v131 = [v130 deviceMemory];
        unint64_t v132 = [v131 objectAtIndexedSubscript:v115];
        uint64_t v133 = (void *)[v129 initWithBuffer:v132 offset:0 descriptor:v126];

        id v11 = v328;
        objc_msgSend(v117, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", 0, v133, v128, 0, v124);
        if ([v11 isBidirectional]) {
          objc_msgSend(v117, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", 1, v133, v128, v305 << 32, v305 << 32);
        }
        id v134 = (id)v333;
        uint64_t v79 = (void *)v326;
        [(id)v333 encodeToCommandBuffer:v326 copyDescriptor:v117];

        uint64_t v62 = v337;
      }
      uint64_t v46 = v321;
      uint64_t v56 = (uint64_t)v327;
LABEL_49:
      uint64_t v135 = v46;
      uint64_t v136 = v310;
      uint64_t v137 = v309;
      createMatrices(v135, v62, v310, v310, v309, 0, v307);
      id v315 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v138 = v313;
      uint64_t v333 = createMatrices(v321, v62, v313, v305, v137, 0, v336);
      uint64_t v139 = v321;
      createMatrices(v321, v62, v136, v136, v137, 0, v308);
      id v314 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v302 = &v298;
      uint64_t v140 = MEMORY[0x1F4188790](v314);
      uint64_t v300 = v141;
      MEMORY[0x1F4188790](v140);
      uint64_t v323 = (char *)&v298 - v143;
      id v144 = v334;
      if (v139)
      {
        uint64_t v145 = 0;
        uint64_t v146 = 0;
        uint64_t v147 = 4 * v310;
        do
        {
          v142[v146++] = v145;
          v145 += v147;
        }
        while (v139 != v146);
        uint64_t v148 = 0;
        id v149 = v323;
        uint64_t v150 = v139;
        do
        {
          *v149++ = v148;
          v148 += v56;
          --v150;
        }
        while (v150);
      }
      char v312 = v142;
      uint64_t v325 = [v11 gradientKernel];
      unint64_t v151 = [(id)v325 count];
      unint64_t v152 = v151 >> (char)v324;
      id v327 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
      id v324 = (id)v152;
      uint64_t v154 = (char *)(v152 - 1);
      BOOL v153 = v152 == 1;
      uint64_t v155 = v138;
      id v156 = v154;
      if (!v153)
      {
        do
        {
          id v157 = [v144 objectAtIndexedSubscript:0];
          v158 = createTemporaryMatrixViews(v157, v79, 1, v139, v62, v155);

          [v327 addObject:v158];
          --v156;
        }
        while (v156);
      }
      id v322 = [v11 rnnStackedLayersResults];
      id v159 = (id)v333;
      char v160 = [v11 isBidirectional];
      id v319 = (id)MEMORY[0x1E4F1CBF0];
      if (v160)
      {
        id v161 = [v11 rnnBuffers];
        unint64_t v162 = [v161 objectAtIndexedSubscript:4];
        createMatrices(v321, v62, v310, v310, v309, 0, v162);
        id v319 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v301 = v159;
      if (v324)
      {
        id v163 = 0;
        id v164 = 0;
        uint64_t v165 = (uint64_t)v323;
        uint64_t v333 = (uint64_t)v159;
        do
        {
          uint64_t v329 = v165;
          if (v154)
          {
            id v166 = [v322 objectAtIndexedSubscript:v154 - 1];

            uint64_t v332 = [v327 objectAtIndexedSubscript:v154 - 1];
            uint64_t v167 = v323;
          }
          else
          {
            id v166 = v315;

            int v168 = [v11 isBidirectional];
            id v169 = v314;
            if (v168) {
              id v169 = v319;
            }
            uint64_t v332 = (uint64_t)v169;
            uint64_t v167 = v312;
          }

          uint64_t v170 = [(id)v325 objectAtIndexedSubscript:v154];
          id v171 = [v11 rnnTrainableWeightGradients];
          uint64_t v172 = [v171 objectAtIndexedSubscript:v154];
          uint64_t v173 = [v11 rnnTrainableStates];
          unint64_t v174 = [v173 objectAtIndexedSubscript:v154];
          uint64_t v175 = [v11 rnnTrainableWeights];
          uint64_t v176 = [v175 objectAtIndexedSubscript:v154];
          uint64_t v296 = v167;
          uint64_t v330 = v167;
          uint64_t v331 = (uint64_t)v166;
          id v177 = v166;
          unint64_t v178 = v167;
          id v179 = (id)v332;
          id v180 = (id)v333;
          [v170 encodeGradientSequenceToCommandBuffer:v326 forwardSources:v177 forwardSourceOffsets:v178 sourceGradients:v333 sourceGradientOffsets:v329 destinationGradients:v332 destinationOffsets:v296 weightGradients:v172 trainingStates:v174 recurrentInputState:0 recurrentOutputStates:0 weights:v176];

          id v11 = v328;
          if (v324 != (id)1)
          {
            if (v154)
            {
              [v11 lstmDropout];
              if (v181 > 0.0)
              {
                id v182 = [v11 rnnStackedLayersBufferResults];
                id v316 = v154 - 1;
                uint64_t v183 = objc_msgSend(v182, "objectAtIndexedSubscript:");
                id v317 = (void *)v183;

                uint64_t v184 = [MEMORY[0x1E4F35578] imageDescriptorWithChannelFormat:4 width:1 height:v313 featureChannels:v321];
                uint64_t v329 = (uint64_t)v184;
                int v185 = [MEMORY[0x1E4F35978] defaultAllocator];
                id v318 = v185;
                uint64_t v186 = v320;
                uint64_t v187 = [(MLCDeviceGPU *)v320 gpuWriteTensorKernelList];
                unint64_t v188 = v338;
                long long v189 = [v187 objectAtIndexedSubscript:v338];
                uint64_t v190 = [v11 batchSize];
                uint64_t v191 = v185;
                uint64_t v192 = v326;
                unint64_t v193 = [v191 imageBatchForCommandBuffer:v326 imageDescriptor:v184 kernel:v189 count:v190];

                uint64x2_t v194 = [(MLCDeviceGPU *)v186 gpuWriteTensorKernelList];
                unint64_t v195 = v188;
                unint64_t v196 = [v194 objectAtIndexedSubscript:v188];
                +[MLCGPUHelper copyMTLBufferToMPSImageBatch:v196 commandBuffer:v192 sourceMTLBuffer:v183 destinationImageBatch:v193 MLCDataType:1];

                uint64_t v197 = [v11 batchSize];
                int32x2_t v198 = [v11 lstmDropoutSource];
                uint64_t v199 = v316;
                uint64_t v200 = [v198 objectAtIndexedSubscript:v316];
                int64x2_t v201 = objc_msgSend(v200, "subarrayWithRange:", 0, v197);

                long long v202 = [v328 lstmDropoutState];
                int32x2_t v203 = [v202 objectAtIndexedSubscript:v199];

                uint64_t v204 = [v328 lstmDropoutGradientKernel];
                uint64_t v205 = [v204 objectAtIndexedSubscript:v199];

                unint64_t v206 = [MEMORY[0x1E4F35978] defaultAllocator];
                [v205 setDestinationImageAllocator:v206];

                uint64_t v207 = [v205 encodeBatchToCommandBuffer:v192 sourceGradients:v193 sourceImages:v201 gradientStates:v203];
                uint64_t v208 = [(MLCDeviceGPU *)v320 gpuReadTensorKernelList];
                uint64_t v209 = [v208 objectAtIndexedSubscript:v195];
                id v11 = v328;
                uint64_t v210 = v192;
                uint64x2_t v211 = v317;
                +[MLCGPUHelper copyMPSImageBatchToMTLBuffer:v209 commandBuffer:v210 sourceImageBatch:v207 destinationMTLBuffer:v317 MLCDataType:1];

                id v180 = (id)v333;
                id v179 = (id)v332;
              }
            }
          }
          id v163 = v179;

          --v154;
          uint64_t v212 = v163;
          uint64_t v333 = (uint64_t)v163;
          uint64_t v165 = (uint64_t)v330;
          id v164 = (void *)v331;
        }
        while (v154 != (char *)-1);
      }
      else
      {
        id v164 = 0;
        uint64_t v212 = 0;
        id v163 = v159;
      }
      char v213 = [v11 isBidirectional];
      unint64_t v214 = v338;
      int32x2_t v215 = (void *)v326;
      if (v213)
      {
        uint64_t v331 = (uint64_t)v164;
        uint64_t v216 = v321;
        uint64_t v217 = v337;
        uint64_t v218 = v310;
        int32x2_t v219 = v309;
        uint64_t v333 = createMatrices(v321, v337, v310, v310, v309, 1, v307);
        uint64_t v220 = v305;
        uint64_t v332 = createMatrices(v216, v217, v313, v305, v219, 1, v336);
        uint64_t v221 = [v11 rnnBuffers];
        id v222 = [v221 objectAtIndexedSubscript:5];
        uint64_t v330 = createMatrices(v216, v217, v218, v218, v219, 1, v222);

        uint64_t v329 = (uint64_t)&v298;
        uint64_t v224 = MEMORY[0x1F4188790](v223);
        uint64_t v226 = (char *)&v298 - ((v225 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v227 = MEMORY[0x1F4188790](v224);
        uint64_t v229 = (char *)&v298 - v228;
        MEMORY[0x1F4188790](v227);
        id v231 = (char *)&v298 - v230;
        if (v216)
        {
          uint64_t v232 = 0;
          uint64_t v233 = 4 * v218;
          unint64_t v234 = (v216 + 1) & 0xFFFFFFFFFFFFFFFELL;
          uint64x2_t v235 = (uint64x2_t)vdupq_n_s64(v216 - 1);
          uint64_t v236 = 4 * v218 * (v216 - 1);
          uint64_t v237 = 8 * v218;
          uint64_t v238 = v236;
          int64x2_t v239 = (int64x2_t)v298;
          uint64_t v240 = v313;
          do
          {
            int32x2_t v241 = vmovn_s64((int64x2_t)vcgeq_u64(v235, (uint64x2_t)v239));
            if (v241.i8[0]) {
              *(void *)&v226[8 * v232] = v238;
            }
            if (v241.i8[4]) {
              *(void *)&v226[8 * v232 + 8] = v233 * (v216 + (v232 ^ 0xFFFFFFFFFFFFFFFELL));
            }
            v232 += 2;
            int64x2_t v239 = vaddq_s64(v239, vdupq_n_s64(2uLL));
            v238 -= v237;
          }
          while (v234 != v232);
          uint64_t v242 = 0;
          uint64_t v243 = 4 * v240 * (v216 - 1) + 4 * v220;
          int64x2_t v244 = (int64x2_t)v298;
          do
          {
            int32x2_t v245 = vmovn_s64((int64x2_t)vcgeq_u64(v235, (uint64x2_t)v244));
            if (v245.i8[0]) {
              *(void *)&v229[8 * v242] = v243;
            }
            if (v245.i8[4]) {
              *(void *)&v229[8 * v242 + 8] = 4 * (v220 + (v216 + (v242 ^ 0x3FFFFFFFFFFFFFFELL)) * v240);
            }
            v242 += 2;
            int64x2_t v244 = vaddq_s64(v244, vdupq_n_s64(2uLL));
            v243 -= 8 * v240;
          }
          while (v234 != v242);
          uint64_t v246 = 0;
          int64x2_t v247 = (int64x2_t)v298;
          do
          {
            int32x2_t v248 = vmovn_s64((int64x2_t)vcgeq_u64(v235, (uint64x2_t)v247));
            if (v248.i8[0]) {
              *(void *)&v231[8 * v246] = v236;
            }
            if (v248.i8[4]) {
              *(void *)&v231[8 * v246 + 8] = v233 * (v216 + (v246 ^ 0xFFFFFFFFFFFFFFFELL));
            }
            v246 += 2;
            int64x2_t v247 = vaddq_s64(v247, vdupq_n_s64(2uLL));
            v236 -= v237;
          }
          while (v234 != v246);
        }
        id v318 = [(id)v325 objectAtIndexedSubscript:1];
        id v249 = v328;
        id v324 = [v328 rnnTrainableWeightGradients];
        uint64_t v250 = [v324 objectAtIndexedSubscript:1];
        uint64_t v323 = [v249 rnnTrainableStates];
        int64x2_t v251 = [v323 objectAtIndexedSubscript:1];
        int32x2_t v252 = [v249 rnnTrainableWeights];
        uint64_t v253 = [v252 objectAtIndexedSubscript:1];
        uint64_t v297 = v231;
        id v254 = v318;
        int64x2_t v255 = v229;
        id v11 = v249;
        [v318 encodeGradientSequenceToCommandBuffer:v326 forwardSources:v333 forwardSourceOffsets:v226 sourceGradients:v332 sourceGradientOffsets:v255 destinationGradients:v330 destinationOffsets:v297 weightGradients:v250 trainingStates:v251 recurrentInputState:0 recurrentOutputStates:0 weights:v253];

        int32x2_t v256 = [v249 biDirectionalGradientResult];
        if ([v249 batchFirst] && v306 == 3)
        {
          id v257 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v337 columns:v321 * v310 rowBytes:4 * v321 * v310 dataType:268435488];
          id v258 = objc_alloc(MEMORY[0x1E4F35618]);
          uint64_t v259 = [v258 initWithBuffer:v308 descriptor:v257];

          int32x2_t v256 = (void *)v259;
        }
        unint64_t v214 = v338;
        int32x2_t v215 = (void *)v326;
        uint64_t v260 = [v249 biDirectionalSumKernel];
        uint64_t v261 = [v249 forwardTimeGradientResult];
        v339[0] = v261;
        uint64_t v262 = [v249 reverseTimeGradientResult];
        v339[1] = v262;
        v263 = [MEMORY[0x1E4F1C978] arrayWithObjects:v339 count:2];
        [v260 encodeToCommandBuffer:v215 sourceMatrices:v263 resultMatrix:v256 scaleVector:0 offsetVector:0 biasVector:0 startIndex:0];

        id v164 = (void *)v331;
      }
      int v264 = [v11 batchFirst] ^ 1;
      if (v306 == 3) {
        LODWORD(v265) = v264;
      }
      else {
        LODWORD(v265) = 1;
      }
      if (v265 == 1 && [v11 batchFirst] && v304 == 4)
      {
        LODWORD(v324) = 1;
        uint64_t v331 = (uint64_t)v164;
        uint64_t v323 = (char *)MEMORY[0x1E01B11E0]();
        id v266 = objc_alloc(MEMORY[0x1E4F35628]);
        v267 = v320;
        v268 = [(MLCDeviceGPU *)v320 deviceList];
        unint64_t v269 = [v268 objectAtIndexedSubscript:v214];
        id v270 = v266;
        uint64_t v271 = v337;
        uint64_t v333 = [v270 initWithDevice:v269 count:v337];

        id v272 = objc_alloc(MEMORY[0x1E4F35620]);
        unint64_t v273 = [(MLCDeviceGPU *)v267 deviceList];
        v274 = [v273 objectAtIndexedSubscript:v214];
        uint64_t v275 = v272;
        uint64_t v276 = v321;
        uint64_t v277 = v310;
        id v318 = (id)[v275 initWithDevice:v274 copyRows:v321 copyColumns:v310 sourcesAreTransposed:0 destinationsAreTransposed:1];

        uint64_t v332 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v276 columns:v277 rowBytes:4 * v277 dataType:268435488];
        uint64_t v330 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v277 columns:v276 rowBytes:4 * v276 dataType:268435488];
        if (v271)
        {
          uint64_t v278 = 0;
          uint64_t v279 = 0;
          uint64_t v329 = 4 * v276 * v277;
          do
          {
            id v280 = objc_alloc(MEMORY[0x1E4F35618]);
            unint64_t v281 = [v328 rnnBuffers];
            id v282 = [v281 objectAtIndexedSubscript:3];
            char v283 = (void *)[v280 initWithBuffer:v282 offset:v278 descriptor:v332];

            id v284 = objc_alloc(MEMORY[0x1E4F35618]);
            id v285 = [v311 objectAtIndexedSubscript:0];
            char v286 = [v285 deviceMemory];
            id v287 = [v286 objectAtIndexedSubscript:v338];
            v288 = (void *)[v284 initWithBuffer:v287 offset:v278 descriptor:v330];

            objc_msgSend((id)v333, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", v279, v283, v288, 0, 0);
            ++v279;
            v278 += v329;
          }
          while (v337 != v279);
        }
        id v289 = v318;
        int32x2_t v215 = (void *)v326;
        id v265 = (id)v333;
        [v318 encodeToCommandBuffer:v326 copyDescriptor:v333];

        unint64_t v214 = v338;
        id v11 = v328;
        id v164 = (void *)v331;
        LOBYTE(v265) = (_BYTE)v324;
      }

      self = v320;
      id v8 = v311;
      if (v265)
      {
        unint64_t v10 = v214 + 1;
        if (v10 < [(MLCDeviceGPU *)v320 numDevicesToUse]) {
          continue;
        }
      }
      break;
    }
  }
}

- (void)incrementReadCountForTensorDeviceMemory:(id)a3 increment:(int64_t)a4
{
  id v13 = a3;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v13 objectAtIndexedSubscript:v6];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v9 = [v13 objectAtIndexedSubscript:v6];
        unint64_t v10 = [v9 objectAtIndexedSubscript:0];
        objc_opt_class();
        char v11 = objc_opt_isKindOfClass();

        if (v11)
        {
          unint64_t v12 = [v13 objectAtIndexedSubscript:v6];
          MPSImageBatchIncrementReadCount(v12, a4);
        }
      }
      ++v6;
    }
    while (v6 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

- (void)incrementReadCountForGradientState:(id)a3 increment:(int64_t)a4
{
  id v11 = a3;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v11 objectAtIndexedSubscript:v6];
      id v8 = [v7 gradientState];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        unint64_t v10 = [v7 gradientState];
        MPSStateBatchIncrementReadCount(v10, a4);
      }
      ++v6;
    }
    while (v6 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

- (void)sumSharedGradientsForConvolutionLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4
{
  id v68 = a3;
  unint64_t v6 = (void *)MEMORY[0x1E01B11E0]();
  uint64_t v7 = [v68 childLayers];
  uint64_t v8 = [v7 count];

  if (v8 != 1)
  {
    id v59 = v6;
    id v9 = [v68 childLayers];
    id v61 = [v9 objectAtIndexedSubscript:a4];

    if ([(MLCDeviceGPU *)self numDevicesToUse])
    {
      unint64_t v10 = 0;
      unint64_t v60 = self;
      while (1)
      {
        id v11 = [v61 deviceOps];
        unint64_t v12 = [v11 objectAtIndexedSubscript:v10];

        id v13 = [(MLCDeviceGPU *)self deviceList];
        uint64_t v64 = [v13 objectAtIndexedSubscript:v10];

        uint64_t v14 = [(MLCDeviceGPU *)self gpuCommandBufferList];
        id v63 = [(id)v14 objectAtIndexedSubscript:v10];

        objc_opt_class();
        LOBYTE(v14) = objc_opt_isKindOfClass();
        id v15 = [v61 weights];

        uint64_t v66 = v12;
        if ((v14 & 1) == 0) {
          break;
        }
        int v16 = [v12 isMPSGraph];
        id v17 = [v12 gradientState];
        if (v15 != v68)
        {
          if (v16)
          {
            id v18 = [v17 objectAtIndexedSubscript:1];
            goto LABEL_13;
          }
          uint64_t v19 = [v17 objectAtIndexedSubscript:0];
          uint64_t v20 = [v19 gradientForBiases];
          goto LABEL_12;
        }
        uint64_t v21 = [v17 objectAtIndexedSubscript:0];
        id v18 = v21;
        if ((v16 & 1) == 0)
        {
          uint64_t v22 = [v21 gradientForWeights];

          id v18 = (void *)v22;
        }
LABEL_13:

        objc_msgSend(MEMORY[0x1E4F35640], "matrixDescriptorWithRows:columns:rowBytes:dataType:", 1, (unint64_t)objc_msgSend(v18, "length") >> 2, objc_msgSend(v18, "length"), 268435488);
        v67 = uint64_t v65 = v18;
        uint64_t v23 = [objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v18 descriptor:v67];
        id v24 = objc_alloc(MEMORY[0x1E4F1CA48]);
        BOOL v25 = [v68 childLayers];
        float v26 = objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v25, "count") + 1);

        uint64_t v62 = (void *)v23;
        [v26 addObject:v23];
        double v27 = [v68 childLayers];
        uint64_t v28 = [v27 count];

        if (v28)
        {
          unint64_t v29 = 0;
          while (2)
          {
            unint64_t v30 = [v68 childLayers];
            uint64_t v31 = [v30 objectAtIndexedSubscript:v29];

            if (a4 == v29 || ![v31 isTrainable]) {
              goto LABEL_43;
            }
            double v32 = [v31 deviceOps];
            unint64_t v33 = [v32 objectAtIndexedSubscript:v10];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v34 = v31;
              if (v15 == v68)
              {
                uint64_t v35 = [v34 weightsParameter];
                if (!v35) {
                  goto LABEL_40;
                }
                uint64_t v46 = [v34 weightsParameter];
                int v47 = [v46 isUpdatable];

                if (v47)
                {
                  char v48 = [v66 isMPSGraph];
                  uint64_t v40 = [v33 gradientState];
                  unint64_t v49 = [v40 objectAtIndexedSubscript:0];
                  uint64_t v35 = v49;
                  if ((v48 & 1) == 0)
                  {
                    uint64_t v50 = [v49 gradientForWeights];

                    uint64_t v35 = (void *)v50;
                  }
                  goto LABEL_39;
                }
              }
              else
              {
                uint64_t v35 = [v34 biasesParameter];
                if (!v35) {
                  goto LABEL_40;
                }
                unint64_t v36 = [v34 biasesParameter];
                int v37 = [v36 isUpdatable];

                if (v37)
                {
                  int v38 = [v66 isMPSGraph];
                  int v39 = [v33 gradientState];
                  uint64_t v40 = v39;
                  if (v38)
                  {
                    uint64_t v35 = [v39 objectAtIndexedSubscript:1];
                    goto LABEL_39;
                  }
                  unint64_t v53 = [v39 objectAtIndexedSubscript:0];
                  uint64_t v54 = [v53 gradientForBiases];
LABEL_38:
                  uint64_t v35 = (void *)v54;

LABEL_39:
LABEL_40:

                  if (v35)
                  {
                    int v55 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v35 descriptor:v67];
                    [v26 addObject:v55];
                  }
LABEL_42:

LABEL_43:
                  ++v29;
                  uint64_t v56 = [v68 childLayers];
                  unint64_t v57 = [v56 count];

                  if (v29 >= v57) {
                    goto LABEL_44;
                  }
                  continue;
                }
              }
LABEL_36:
              uint64_t v35 = 0;
              goto LABEL_40;
            }
            break;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_42;
          }
          id v41 = v31;
          if (v15 == v68)
          {
            uint64_t v35 = [v41 weightsParameter];
            if (!v35) {
              goto LABEL_40;
            }
            uint64_t v51 = [v41 weightsParameter];
            int v52 = [v51 isUpdatable];

            if (!v52) {
              goto LABEL_36;
            }
            id v44 = [v33 gradientState];
            uint64_t v40 = v44;
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v35 = [v41 biasesParameter];
            if (!v35) {
              goto LABEL_40;
            }
            unint64_t v42 = [v41 biasesParameter];
            int v43 = [v42 isUpdatable];

            if (!v43) {
              goto LABEL_36;
            }
            id v44 = [v33 gradientState];
            uint64_t v40 = v44;
            uint64_t v45 = 1;
          }
          unint64_t v53 = [v44 objectAtIndexedSubscript:v45];
          uint64_t v54 = [v53 data];
          goto LABEL_38;
        }
LABEL_44:
        if ((unint64_t)[v26 count] > 1)
        {
          id v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F35688]), "initWithDevice:count:rows:columns:transpose:", v64, objc_msgSend(v26, "count"), 1, (unint64_t)objc_msgSend(v65, "length") >> 2, 0);
          [v58 encodeToCommandBuffer:v63 sourceMatrices:v26 resultMatrix:v62 scaleVector:0 offsetVector:0 biasVector:0 startIndex:0];
        }
        ++v10;
        self = v60;
        if (v10 >= [(MLCDeviceGPU *)v60 numDevicesToUse]) {
          goto LABEL_47;
        }
      }
      id v17 = [v12 gradientState];
      uint64_t v19 = [v17 objectAtIndexedSubscript:v15 != v68];
      uint64_t v20 = [v19 data];
LABEL_12:
      id v18 = (void *)v20;

      goto LABEL_13;
    }
LABEL_47:

    unint64_t v6 = v59;
  }
}

- (id)getGradientBufferForNormalizationState:(id)a3 layer:(id)a4 isBetaTensor:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = v8;
    unint64_t v10 = v9;
    if (v5)
    {
      id v11 = [v9 betaParameter];
      if (v11)
      {
        unint64_t v12 = [v10 betaParameter];
        int v13 = [v12 isUpdatable];

        if (v13)
        {
          uint64_t v14 = [v7 normalizationBetaGradient];
LABEL_12:
          id v11 = (void *)v14;
          goto LABEL_14;
        }
        goto LABEL_13;
      }
    }
    else
    {
      id v11 = [v9 gammaParameter];
      if (v11)
      {
        id v15 = [v10 gammaParameter];
        int v16 = [v15 isUpdatable];

        if (v16)
        {
          uint64_t v14 = [v7 normalizationGammaGradient];
          goto LABEL_12;
        }
LABEL_13:
        id v11 = 0;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  id v11 = 0;
LABEL_15:

  return v11;
}

- (void)sumSharedGradientsForNormalizationLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4 isBetaTensor:(BOOL)a5
{
  uint64_t v5 = a5;
  id v45 = a3;
  id v8 = (void *)MEMORY[0x1E01B11E0]();
  id v9 = [v45 childLayers];
  uint64_t v10 = [v9 count];

  if (v10 != 1)
  {
    int v37 = v8;
    id v11 = [v45 childLayers];
    id v44 = [v11 objectAtIndexedSubscript:a4];

    if ([(MLCDeviceGPU *)self numDevicesToUse])
    {
      unint64_t v12 = 0;
      unsigned int v43 = v5;
      do
      {
        int v13 = [v44 deviceOps];
        uint64_t v14 = [v13 objectAtIndexedSubscript:v12];

        id v15 = [(MLCDeviceGPU *)self deviceList];
        int v16 = [v15 objectAtIndexedSubscript:v12];

        id v17 = [(MLCDeviceGPU *)self gpuCommandBufferList];
        id v18 = [v17 objectAtIndexedSubscript:v12];

        uint64_t v19 = [(MLCDeviceGPU *)self getGradientBufferForNormalizationState:v14 layer:v44 isBetaTensor:v5];
        uint64_t v20 = v19;
        if (v19)
        {
          uint64_t v40 = v14;
          id v41 = v18;
          int v39 = v16;
          unint64_t v42 = objc_msgSend(MEMORY[0x1E4F35640], "matrixDescriptorWithRows:columns:rowBytes:dataType:", 1, (unint64_t)objc_msgSend(v19, "length") >> 2, objc_msgSend(v19, "length"), 268435488);
          uint64_t v21 = [objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v20 descriptor:v42];
          id v22 = objc_alloc(MEMORY[0x1E4F1CA48]);
          uint64_t v23 = [v45 childLayers];
          id v24 = objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count") + 1);

          int v38 = (void *)v21;
          [v24 addObject:v21];
          BOOL v25 = [v45 childLayers];
          uint64_t v26 = [v25 count];

          if (v26)
          {
            unint64_t v27 = 0;
            do
            {
              uint64_t v28 = [v45 childLayers];
              unint64_t v29 = [v28 objectAtIndexedSubscript:v27];

              if (a4 != v27 && [v29 isTrainable])
              {
                unint64_t v30 = [v29 deviceOps];
                uint64_t v31 = [v30 objectAtIndexedSubscript:v12];

                double v32 = [(MLCDeviceGPU *)self getGradientBufferForNormalizationState:v31 layer:v44 isBetaTensor:v43];
                if (v32)
                {
                  unint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v32 descriptor:v42];
                  [v24 addObject:v33];
                }
              }

              ++v27;
              id v34 = [v45 childLayers];
              unint64_t v35 = [v34 count];
            }
            while (v27 < v35);
          }
          int v16 = v39;
          if ((unint64_t)[v24 count] > 1)
          {
            unint64_t v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F35688]), "initWithDevice:count:rows:columns:transpose:", v39, objc_msgSend(v24, "count"), 1, (unint64_t)objc_msgSend(v20, "length") >> 2, 0);
            [v36 encodeToCommandBuffer:v41 sourceMatrices:v24 resultMatrix:v38 scaleVector:0 offsetVector:0 biasVector:0 startIndex:0];
          }
          uint64_t v5 = v43;
          uint64_t v14 = v40;
          id v18 = v41;
        }

        ++v12;
      }
      while (v12 < [(MLCDeviceGPU *)self numDevicesToUse]);
    }

    id v8 = v37;
  }
}

- (void)updateConvolutionLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7
{
  _DWORD v79[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v68 = a4;
  id v69 = a5;
  id v13 = a6;
  id v67 = a7;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v14 = 0;
    id v57 = v12;
    uint64_t v70 = self;
    id v66 = v13;
    do
    {
      id v15 = [v12 objectAtIndexedSubscript:v14];
      if ([(MLCDeviceGPU *)self numDevicesToUse] == 2
        && [v15 multiGPUReduction] == 1)
      {
        char v16 = [v15 isMPSGraph];
        id v17 = [v15 gradientState];
        id v18 = v17;
        if ((v16 & 1) == 0)
        {
          uint64_t v19 = [v17 objectAtIndexedSubscript:0];

          uint64_t v20 = [v19 gradientForWeights];
          v79[0] = v20;
          uint64_t v21 = [v19 gradientForBiases];
          v79[1] = v21;
          id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
        }
        [(MLCDeviceGPU *)self allReduceOverXGMI:v12 deviceIndex:v14 stateBuffers:v18];
      }
      id v22 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      uint64_t v23 = [v22 objectAtIndexedSubscript:v14];

      uint64_t v73 = (void *)v23;
      if ([v15 isMPSGraph])
      {
        id v24 = 0;
        id v71 = 0;
      }
      else
      {
        BOOL v25 = [v15 forwardKernel];
        id v24 = [v25 exportWeightsAndBiasesWithCommandBuffer:v23 resultStateCanBeTemporary:0];

        uint64_t v26 = [v15 gradientState];
        id v71 = [v26 objectAtIndexedSubscript:0];

        [v15 setExportableState:v24];
      }
      unint64_t v27 = [v15 momentumVectors];
      uint64_t v28 = [v15 velocityVectors];
      unint64_t v29 = [v15 centerWeightVectors];
      id v72 = deviceParameterWithVectors(v27, v28, v29);

      if ([v69 isUpdatable])
      {
        unint64_t v30 = [v68 objectAtIndexedSubscript:v14];
        int v31 = [v15 isMPSGraph];
        if (v31)
        {
          uint64_t v62 = [v15 exportableState];
          uint64_t v32 = [v62 objectAtIndexedSubscript:0];
          unint64_t v60 = (void *)v32;
        }
        else
        {
          uint64_t v32 = [v24 weights];
          uint64_t v64 = (void *)v32;
        }
        int v33 = [v15 isMPSGraph];
        if (v33)
        {
          id v63 = [v15 gradientState];
          uint64_t v34 = [v63 objectAtIndexedSubscript:0];
          id v61 = (void *)v34;
        }
        else
        {
          uint64_t v34 = [v71 gradientForWeights];
          uint64_t v65 = (void *)v34;
        }
        if ([v15 isMPSGraph])
        {
          unint64_t v35 = [v15 exportableState];
          unint64_t v36 = [v35 objectAtIndexedSubscript:0];
          [(MLCDeviceGPU *)v70 updateWithOptimizer:v30 arrayOfParams:v67 commandBuffer:v73 deviceParameter:v72 source:v32 gradient:v34 result:v36 momentumIndex:0];

          id v12 = v57;
        }
        else
        {
          unint64_t v35 = [v24 weights];
          [(MLCDeviceGPU *)v70 updateWithOptimizer:v30 arrayOfParams:v67 commandBuffer:v73 deviceParameter:v72 source:v32 gradient:v34 result:v35 momentumIndex:0];
        }

        int v37 = v65;
        if (v33)
        {

          int v37 = v63;
        }

        int v38 = v64;
        id v13 = v66;
        if (v31)
        {

          int v38 = v62;
        }

        self = v70;
      }
      if (v13 && [v13 isUpdatable])
      {
        int v39 = [v68 objectAtIndexedSubscript:v14];
        int v40 = [v15 isMPSGraph];
        if (v40)
        {
          int v55 = [v15 exportableState];
          uint64_t v41 = [v55 objectAtIndexedSubscript:1];
          unint64_t v53 = (void *)v41;
        }
        else
        {
          uint64_t v41 = [v24 biases];
          id v58 = (void *)v41;
        }
        int v42 = [v15 isMPSGraph];
        if (v42)
        {
          uint64_t v56 = [v15 gradientState];
          uint64_t v43 = [v56 objectAtIndexedSubscript:1];
          uint64_t v54 = (void *)v43;
        }
        else
        {
          uint64_t v43 = [v71 gradientForBiases];
          id v59 = (void *)v43;
        }
        if ([v15 isMPSGraph])
        {
          id v44 = [v15 exportableState];
          id v45 = [v44 objectAtIndexedSubscript:1];
          [(MLCDeviceGPU *)v70 updateWithOptimizer:v39 arrayOfParams:v67 commandBuffer:v73 deviceParameter:v72 source:v41 gradient:v43 result:v45 momentumIndex:1];

          id v12 = v57;
        }
        else
        {
          id v44 = [v24 biases];
          [(MLCDeviceGPU *)v70 updateWithOptimizer:v39 arrayOfParams:v67 commandBuffer:v73 deviceParameter:v72 source:v41 gradient:v43 result:v44 momentumIndex:1];
        }

        uint64_t v46 = v59;
        if (v42)
        {

          uint64_t v46 = v56;
        }

        int v47 = v58;
        id v13 = v66;
        if (v40)
        {

          int v47 = v55;
        }

        self = v70;
      }
      if (([v15 isMPSGraph] & 1) == 0)
      {
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        char v48 = [v15 gradientState];
        uint64_t v49 = [v48 countByEnumeratingWithState:&v74 objects:v78 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v75;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v75 != v51) {
                objc_enumerationMutation(v48);
              }
              [*(id *)(*((void *)&v74 + 1) + 8 * i) setReadCount:0];
            }
            uint64_t v50 = [v48 countByEnumeratingWithState:&v74 objects:v78 count:16];
          }
          while (v50);
        }
      }
      ++v14;
    }
    while (v14 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
  if (!v67) {
    [(MLCDeviceGPU *)self restoreConvolutionParamsWithDeviceOps:v12];
  }
}

- (void)restoreConvolutionParamsWithDeviceOps:(id)a3
{
  id v13 = a3;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [v13 objectAtIndexedSubscript:v4];
      unint64_t v6 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      id v7 = [v6 objectAtIndexedSubscript:v4];

      if (([v5 isMPSGraph] & 1) == 0)
      {
        id v8 = (void *)MEMORY[0x1E01B11E0]();
        id v9 = [v5 forwardKernel];
        uint64_t v10 = [v5 exportableState];
        [v9 reloadWeightsAndBiasesWithCommandBuffer:v7 state:v10];

        id v11 = [v5 gradientKernel];
        id v12 = [v5 exportableState];
        [v11 reloadWeightsAndBiasesWithCommandBuffer:v7 state:v12];

        [v5 setExportableState:0];
      }

      ++v4;
    }
    while (v4 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

- (void)updateFullyConnectedLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v55 = a4;
  id v58 = a5;
  id v12 = a6;
  id v54 = a7;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v13 = 0;
    unint64_t v60 = self;
    id v53 = v12;
    do
    {
      unint64_t v14 = [v59 objectAtIndexedSubscript:v13];
      if ([(MLCDeviceGPU *)self numDevicesToUse] == 2
        && [v14 multiGPUReduction] == 1)
      {
        unint64_t v15 = v13;
        char v16 = [v14 gradientState];
        id v17 = [v16 objectAtIndexedSubscript:0];
        id v18 = [v17 data];
        v68[0] = v18;
        uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
        uint64_t v20 = (void *)[v19 mutableCopy];

        uint64_t v21 = [v14 gradientState];
        unint64_t v22 = [v21 count];

        if (v22 >= 2)
        {
          uint64_t v23 = [v14 gradientState];
          id v24 = [v23 objectAtIndexedSubscript:1];
          BOOL v25 = [v24 data];
          [v20 setObject:v25 atIndexedSubscript:1];
        }
        uint64_t v26 = (void *)[v20 copy];
        unint64_t v13 = v15;
        [(MLCDeviceGPU *)self allReduceOverXGMI:v59 deviceIndex:v15 stateBuffers:v26];
      }
      unint64_t v27 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      uint64_t v62 = [v27 objectAtIndexedSubscript:v13];

      uint64_t v28 = [v14 momentumVectors];
      unint64_t v29 = [v14 velocityVectors];
      unint64_t v30 = [v14 centerWeightVectors];
      id v61 = deviceParameterWithVectors(v28, v29, v30);

      if ([v58 isUpdatable])
      {
        int v31 = [v55 objectAtIndexedSubscript:v13];
        uint64_t v56 = [v14 exportableState];
        uint64_t v32 = [v56 objectAtIndexedSubscript:0];
        int v33 = [v14 gradientState];
        uint64_t v34 = [v33 objectAtIndexedSubscript:0];
        unint64_t v35 = [v34 data];
        [v14 exportableState];
        v37 = unint64_t v36 = v13;
        int v38 = [v37 objectAtIndexedSubscript:0];
        [(MLCDeviceGPU *)v60 updateWithOptimizer:v31 arrayOfParams:v54 commandBuffer:v62 deviceParameter:v61 source:v32 gradient:v35 result:v38 momentumIndex:0];

        self = v60;
        unint64_t v13 = v36;

        id v12 = v53;
      }
      if (v12 && [v12 isUpdatable])
      {
        int v39 = [v55 objectAtIndexedSubscript:v13];
        id v57 = [v14 exportableState];
        int v40 = [v57 objectAtIndexedSubscript:1];
        uint64_t v41 = [v14 gradientState];
        int v42 = [v41 objectAtIndexedSubscript:1];
        uint64_t v43 = [v42 data];
        [v14 exportableState];
        v45 = unint64_t v44 = v13;
        uint64_t v46 = [v45 objectAtIndexedSubscript:1];
        [(MLCDeviceGPU *)v60 updateWithOptimizer:v39 arrayOfParams:v54 commandBuffer:v62 deviceParameter:v61 source:v40 gradient:v43 result:v46 momentumIndex:1];

        self = v60;
        unint64_t v13 = v44;

        id v12 = v53;
      }
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      int v47 = [v14 gradientState];
      uint64_t v48 = [v47 countByEnumeratingWithState:&v63 objects:v67 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v64;
        do
        {
          uint64_t v51 = 0;
          do
          {
            if (*(void *)v64 != v50) {
              objc_enumerationMutation(v47);
            }
            int v52 = *(void **)(*((void *)&v63 + 1) + 8 * v51);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v52 readCount]) {
              [v52 setReadCount:0];
            }
            ++v51;
          }
          while (v49 != v51);
          uint64_t v49 = [v47 countByEnumeratingWithState:&v63 objects:v67 count:16];
        }
        while (v49);
      }

      ++v13;
    }
    while (v13 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

- (void)updateLayerNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7
{
  v63[2] = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v60 = a4;
  id v59 = a5;
  id v58 = a6;
  id v57 = a7;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v12 = 0;
    do
    {
      unint64_t v13 = [v61 objectAtIndexedSubscript:v12];
      if ([(MLCDeviceGPU *)self numDevicesToUse] == 2)
      {
        unint64_t v14 = [v13 normalizationMultiGPUChildOps];
        int v15 = [v14 multiGPUReduction];

        if (v15 == 1)
        {
          id v54 = [v61 objectAtIndexedSubscript:0];
          char v16 = [v54 normalizationMultiGPUChildOps];
          v63[0] = v16;
          id v17 = [v61 objectAtIndexedSubscript:1];
          id v18 = [v17 normalizationMultiGPUChildOps];
          v63[1] = v18;
          uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
          uint64_t v20 = [v13 normalizationGammaGradient];
          v62[0] = v20;
          uint64_t v21 = [v13 normalizationBetaGradient];
          v62[1] = v21;
          unint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
          [(MLCDeviceGPU *)self allReduceOverXGMI:v19 deviceIndex:v12 stateBuffers:v22];
        }
      }
      uint64_t v23 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      id v24 = [v23 objectAtIndexedSubscript:v12];

      BOOL v25 = [v13 exportableState];
      uint64_t v26 = [v13 momentumVectors];
      unint64_t v27 = [v13 velocityVectors];
      uint64_t v28 = [v13 centerWeightVectors];
      unint64_t v29 = deviceParameterWithVectors(v26, v27, v28);

      uint64_t v30 = [v13 normalizationGammaGradient];
      if (v30)
      {
        int v31 = (void *)v30;
        int v32 = [v58 isUpdatable];

        if (v32)
        {
          int v33 = [v13 normalizationGammaGradient];
          if ([(MLCDeviceGPU *)self numDevicesToUse] == 2)
          {
            uint64_t v34 = [v13 normalizationMultiGPUChildOps];
            int v35 = [v34 multiGPUReduction];

            if (v35 == 1)
            {
              unint64_t v36 = [v13 normalizationMultiGPUChildOps];
              int v37 = [v36 allReducedGradientMatrices];
              int v38 = [v37 objectAtIndexedSubscript:0];
              uint64_t v55 = [v38 data];

              int v33 = (void *)v55;
            }
          }
          int v39 = [v60 objectAtIndexedSubscript:v12];
          int v40 = [v25 gamma];
          uint64_t v41 = [v25 gamma];
          [(MLCDeviceGPU *)self updateWithOptimizer:v39 arrayOfParams:v57 commandBuffer:v24 deviceParameter:v29 source:v40 gradient:v33 result:v41 momentumIndex:0];
        }
      }
      uint64_t v42 = [v13 normalizationBetaGradient];
      if (v42)
      {
        uint64_t v43 = (void *)v42;
        int v44 = [v59 isUpdatable];

        if (v44)
        {
          id v45 = [v13 normalizationBetaGradient];
          if ([(MLCDeviceGPU *)self numDevicesToUse] == 2)
          {
            uint64_t v46 = [v13 normalizationMultiGPUChildOps];
            int v47 = [v46 multiGPUReduction];

            if (v47 == 1)
            {
              uint64_t v48 = [v13 normalizationMultiGPUChildOps];
              uint64_t v49 = [v48 allReducedGradientMatrices];
              uint64_t v50 = [v49 objectAtIndexedSubscript:1];
              uint64_t v56 = [v50 data];

              id v45 = (void *)v56;
            }
          }
          uint64_t v51 = [v60 objectAtIndexedSubscript:v12];
          int v52 = [v25 beta];
          id v53 = [v25 beta];
          [(MLCDeviceGPU *)self updateWithOptimizer:v51 arrayOfParams:v57 commandBuffer:v24 deviceParameter:v29 source:v52 gradient:v45 result:v53 momentumIndex:1];
        }
      }

      ++v12;
    }
    while (v12 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

- (void)updateBatchNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 meanTensor:(id)a7 varianceTensor:(id)a8 arrayOfParams:(id)a9
{
}

- (void)updateEmbeddingLayer:(id)a3 weightsParameter:(id)a4 optimizer:(id)a5 arrayOfParams:(id)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v37 = a5;
  id v36 = a6;
  if ([v11 isUpdatable])
  {
    id v32 = v11;
    int v35 = [v11 tensor];
    if ([(MLCDeviceGPU *)self numDevicesToUse])
    {
      unint64_t v12 = 0;
      int v33 = self;
      id v34 = v10;
      do
      {
        unint64_t v13 = [v10 objectAtIndexedSubscript:v12];
        if ([(MLCDeviceGPU *)self numDevicesToUse] == 2
          && [v13 multiGPUReduction] == 1)
        {
          unint64_t v14 = [v13 gradientForWeights];
          v39[0] = v14;
          int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
          [(MLCDeviceGPU *)self allReduceOverXGMI:v10 deviceIndex:v12 stateBuffers:v15];
        }
        char v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
        id v17 = [v16 objectAtIndexedSubscript:v12];

        id v18 = [v13 momentumVectors];
        uint64_t v19 = [v13 velocityVectors];
        uint64_t v20 = [v13 centerWeightVectors];
        uint64_t v21 = deviceParameterWithVectors(v18, v19, v20);

        unint64_t v22 = [v13 gradientForWeights];

        if (v22)
        {
          uint64_t v23 = [v13 gradientForWeights];
          if ([(MLCDeviceGPU *)self numDevicesToUse] == 2
            && [v13 multiGPUReduction] == 1)
          {
            id v24 = [v13 allReducedGradientMatrices];
            BOOL v25 = [v24 objectAtIndexedSubscript:0];
            uint64_t v26 = [v25 data];

            unint64_t v27 = (void *)v26;
          }
          else
          {
            unint64_t v27 = v23;
          }
          uint64_t v28 = [v37 objectAtIndexedSubscript:v12];
          int v38 = [v35 deviceMemory];
          unint64_t v29 = [v38 objectAtIndexedSubscript:v12];
          uint64_t v30 = [v35 deviceMemory];
          int v31 = [v30 objectAtIndexedSubscript:v12];
          self = v33;
          [(MLCDeviceGPU *)v33 updateWithOptimizer:v28 arrayOfParams:v36 commandBuffer:v17 deviceParameter:v21 source:v29 gradient:v27 result:v31 momentumIndex:0];

          id v10 = v34;
        }

        ++v12;
      }
      while (v12 < [(MLCDeviceGPU *)self numDevicesToUse]);
    }

    id v11 = v32;
  }
}

- (void)saveOrRestoreTempMatrixDisableUpdates:(id)a3 commandBuffer:(id)a4 auxiliaryWeightsMemory:(id)a5 auxiliaryMomentumMemory:(id)a6 auxiliaryVelocityMemory:(id)a7 auxiliaryCenterWeightMemory:(id)a8 deviceNumber:(unint64_t)a9 kernelNumber:(unint64_t)a10 mlcIndex:(unint64_t)a11 auxIndex:(unint64_t)a12 numOptimizerData:(unint64_t)a13 saveToAux:(BOOL)a14 isInputWeight:(BOOL)a15 isHiddenWeight:(BOOL)a16 isBias:(BOOL)a17
{
  id v22 = a3;
  id v23 = a4;
  id v59 = a5;
  id v58 = a6;
  id v56 = a7;
  id v53 = a8;
  id v60 = [v22 gradientKernel];
  id v24 = [v22 rnnTrainableWeights];
  BOOL v25 = [v22 rnnMomentumMatrices];
  uint64_t v26 = [v22 rnnVelocityMatrices];
  unint64_t v27 = [v22 rnnCenterWeightMatrices];
  uint64_t v51 = v24;
  uint64_t v55 = [v24 objectAtIndexedSubscript:a10];
  uint64_t v50 = v25;
  id v57 = [v25 objectAtIndexedSubscript:a10];
  uint64_t v49 = v26;
  id v54 = [v26 objectAtIndexedSubscript:a10];
  uint64_t v48 = v27;
  int v52 = [v27 objectAtIndexedSubscript:a10];
  uint64_t v28 = [v22 inputSize];
  uint64_t v29 = [v22 hiddenSize];
  uint64_t v30 = v29;
  if (a15)
  {
    int v31 = (void *)qword_1E6CB4F40[a11 & 3];
    id v32 = (void *)v55;
    if ((unint64_t)[v22 numLayers] < 2
      || (int v33 = [v22 isBidirectional], v34 = a10, v33))
    {
      if ((unint64_t)[v22 numLayers] < 2 || !objc_msgSend(v22, "isBidirectional"))
      {
        uint64_t v35 = v30;
        uint64_t v30 = v28;
        goto LABEL_24;
      }
      unint64_t v34 = a10 % [v22 numLayers];
    }
    uint64_t v35 = v30;
    if (!v34) {
      uint64_t v30 = v28;
    }
  }
  else if (a16)
  {
    int v31 = &unk_1F3876AF8;
    id v32 = (void *)v55;
    uint64_t v35 = v29;
    switch(a11 & 3)
    {
      case 1uLL:
        int v31 = &unk_1F3876B10;
        goto LABEL_20;
      case 2uLL:
        int v31 = &unk_1F3876B28;
        goto LABEL_20;
      case 3uLL:
        int v31 = &unk_1F3876B40;
LABEL_20:
        uint64_t v35 = v29;
        break;
      default:
        break;
    }
  }
  else
  {
    id v32 = (void *)v55;
    if (a17)
    {
      int v31 = &unk_1F3876B58;
      uint64_t v35 = 1;
      switch(a11 & 3)
      {
        case 1uLL:
          int v31 = &unk_1F3876B70;
          goto LABEL_23;
        case 2uLL:
          int v31 = &unk_1F3876B88;
          goto LABEL_23;
        case 3uLL:
          int v31 = &unk_1F3876BA0;
LABEL_23:
          uint64_t v35 = 1;
          break;
        default:
          break;
      }
    }
    else
    {
      uint64_t v35 = 0;
      uint64_t v30 = 0;
      int v31 = &unk_1F3876A80;
    }
  }
LABEL_24:
  long long v63 = 0uLL;
  uint64_t v64 = 0;
  id v36 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v35 columns:v30 rowBytes:4 * v30 dataType:268435488];
  if (a14)
  {
    id v37 = [MEMORY[0x1E4F35980] temporaryMatrixWithCommandBuffer:v23 matrixDescriptor:v36];
    [v59 addObject:v37];
  }
  else
  {
    id v37 = [v59 objectAtIndexedSubscript:a12];
  }
  int v38 = [v60 objectAtIndexedSubscript:a10];
  long long v61 = 0uLL;
  uint64_t v62 = 0;
  objc_msgSend(v38, "encodeCopyWeightsToCommandBuffer:weights:matrixId:matrix:copyFromWeightsToMatrix:matrixOffset:", v23, v32, objc_msgSend(v31, "unsignedIntegerValue"), v37, a14, &v61);

  if (a13)
  {
    if (a14)
    {
      int v39 = [MEMORY[0x1E4F35980] temporaryMatrixWithCommandBuffer:v23 matrixDescriptor:v36];
      [v58 addObject:v39];
    }
    else
    {
      int v39 = [v58 objectAtIndexedSubscript:a12];
    }
    int v40 = [v60 objectAtIndexedSubscript:a10];
    uint64_t v41 = [v31 unsignedIntegerValue];
    long long v61 = v63;
    uint64_t v62 = v64;
    [v40 encodeCopyWeightsToCommandBuffer:v23 weights:v57 matrixId:v41 matrix:v39 copyFromWeightsToMatrix:a14 matrixOffset:&v61];

    if (a13 >= 2)
    {
      if (a14)
      {
        uint64_t v42 = [MEMORY[0x1E4F35980] temporaryMatrixWithCommandBuffer:v23 matrixDescriptor:v36];
        [v56 addObject:v42];
      }
      else
      {
        uint64_t v42 = [v56 objectAtIndexedSubscript:a12];
      }
      uint64_t v43 = [v60 objectAtIndexedSubscript:a10];
      uint64_t v44 = [v31 unsignedIntegerValue];
      long long v61 = v63;
      uint64_t v62 = v64;
      [v43 encodeCopyWeightsToCommandBuffer:v23 weights:v54 matrixId:v44 matrix:v42 copyFromWeightsToMatrix:a14 matrixOffset:&v61];

      if (a13 >= 3)
      {
        if (a14)
        {
          id v45 = [MEMORY[0x1E4F35980] temporaryMatrixWithCommandBuffer:v23 matrixDescriptor:v36];
          [v53 addObject:v45];
        }
        else
        {
          id v45 = [v53 objectAtIndexedSubscript:a12];
        }
        uint64_t v46 = [v60 objectAtIndexedSubscript:a10];
        uint64_t v47 = [v31 unsignedIntegerValue];
        long long v61 = v63;
        uint64_t v62 = v64;
        [v46 encodeCopyWeightsToCommandBuffer:v23 weights:v52 matrixId:v47 matrix:v45 copyFromWeightsToMatrix:a14 matrixOffset:&v61];
      }
      id v32 = (void *)v55;
    }
  }
}

- (void)updateRNNLayer:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8
{
  v135[2] = *MEMORY[0x1E4F143B8];
  id v113 = a3;
  id v14 = a4;
  int v15 = self;
  id v119 = v14;
  id v122 = a5;
  id v121 = a6;
  id v117 = a7;
  id v118 = a8;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v16 = 0;
    int v128 = self;
    do
    {
      id v17 = [v113 objectAtIndexedSubscript:v16];
      uint64_t v130 = v16;
      id v134 = v17;
      if ([(MLCDeviceGPU *)v15 numDevicesToUse] == 2)
      {
        id v18 = [v17 lstmMultiGPUChildOps];
        int v19 = [v18 multiGPUReduction];

        if (v19 == 1)
        {
          uint64_t v20 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          uint64_t v21 = [v17 rnnTrainableWeightGradients];
          if ([v21 count])
          {
            unint64_t v22 = 0;
            do
            {
              id v23 = [v21 objectAtIndexedSubscript:v22];
              if ([v23 count])
              {
                unint64_t v24 = 0;
                do
                {
                  BOOL v25 = [v23 objectAtIndexedSubscript:v24];
                  uint64_t v26 = [v25 data];
                  [v20 addObject:v26];

                  ++v24;
                }
                while (v24 < [v23 count]);
              }

              ++v22;
            }
            while (v22 < [v21 count]);
          }
          unint64_t v131 = [v113 objectAtIndexedSubscript:0];
          unint64_t v27 = [v131 lstmMultiGPUChildOps];
          v135[0] = v27;
          uint64_t v28 = [v113 objectAtIndexedSubscript:1];
          uint64_t v29 = [v28 lstmMultiGPUChildOps];
          v135[1] = v29;
          uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:2];
          int v31 = (void *)[v30 copy];
          id v32 = (void *)[v20 copy];
          [(MLCDeviceGPU *)v128 allReduceOverXGMI:v31 deviceIndex:v16 stateBuffers:v32];

          int v15 = v128;
        }
      }
      int v33 = [(MLCDeviceGPU *)v15 gpuCommandBufferList];
      id v129 = [v33 objectAtIndexedSubscript:v16];

      uint64_t v114 = [v17 gradientKernel];
      uint64_t v34 = [v114 count];
      uint64_t v35 = [v122 objectAtIndexedSubscript:0];
      id v36 = [v35 tensor];
      id v37 = [v36 optimizerData];
      uint64_t v126 = [v37 count];

      int v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v34];
      [v17 setAuxiliaryWeightsMemory:v38];

      int v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v34];
      [v17 setAuxiliaryMomentumMemory:v39];

      int v40 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v34];
      [v17 setAuxiliaryVelocityMemory:v40];

      uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v34];
      [v17 setAuxiliaryCenterWeightMemory:v41];

      uint64_t v42 = v17;
      uint64_t v115 = v34;
      if (v34)
      {
        uint64_t v43 = 0;
        do
        {
          uint64_t v44 = (void *)MEMORY[0x1E4F1CBF0];
          id v45 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          uint64_t v46 = [v42 auxiliaryWeightsMemory];
          [v46 setObject:v45 atIndexedSubscript:v43];

          uint64_t v47 = (void *)[v44 mutableCopy];
          uint64_t v48 = [v42 auxiliaryMomentumMemory];
          [v48 setObject:v47 atIndexedSubscript:v43];

          uint64_t v49 = (void *)[v44 mutableCopy];
          uint64_t v50 = [v42 auxiliaryVelocityMemory];
          [v50 setObject:v49 atIndexedSubscript:v43];

          uint64_t v51 = (void *)[v44 mutableCopy];
          int v52 = [v42 auxiliaryCenterWeightMemory];
          [v52 setObject:v51 atIndexedSubscript:v43];

          uint64_t v53 = 4 * v43;
          if (4 * v43 != -4)
          {
            unint64_t v54 = v53 + 4;
            unint64_t v55 = 4 * v43;
            uint64_t v132 = v53 + 4;
            do
            {
              id v56 = [v122 objectAtIndexedSubscript:v55];
              char v57 = [v56 isUpdatable];

              if ((v57 & 1) == 0)
              {
                uint64_t v123 = [v134 auxiliaryWeightsMemory];
                id v58 = [v123 objectAtIndexedSubscript:v43];
                id v59 = [v134 auxiliaryMomentumMemory];
                id v60 = [v59 objectAtIndexedSubscript:v43];
                long long v61 = [v134 auxiliaryVelocityMemory];
                uint64_t v62 = [v61 objectAtIndexedSubscript:v43];
                long long v63 = [v134 auxiliaryCenterWeightMemory];
                uint64_t v64 = [v63 objectAtIndexedSubscript:v43];
                LODWORD(v112) = 257;
                -[MLCDeviceGPU saveOrRestoreTempMatrixDisableUpdates:commandBuffer:auxiliaryWeightsMemory:auxiliaryMomentumMemory:auxiliaryVelocityMemory:auxiliaryCenterWeightMemory:deviceNumber:kernelNumber:mlcIndex:auxIndex:numOptimizerData:saveToAux:isInputWeight:isHiddenWeight:isBias:](v128, "saveOrRestoreTempMatrixDisableUpdates:commandBuffer:auxiliaryWeightsMemory:auxiliaryMomentumMemory:auxiliaryVelocityMemory:auxiliaryCenterWeightMemory:deviceNumber:kernelNumber:mlcIndex:auxIndex:numOptimizerData:saveToAux:isInputWeight:isHiddenWeight:isBias:", v134, v129, v58, v60, v62, v64, v130, v43, v55, 0, v126, v112);

                unint64_t v54 = v132;
              }
              ++v55;
            }
            while (v55 < v54);
            unint64_t v65 = 4 * v43;
            do
            {
              long long v66 = [v121 objectAtIndexedSubscript:v65];
              char v67 = [v66 isUpdatable];

              if ((v67 & 1) == 0)
              {
                unint64_t v124 = [v134 auxiliaryWeightsMemory];
                id v68 = [v124 objectAtIndexedSubscript:v43];
                id v69 = [v134 auxiliaryMomentumMemory];
                uint64_t v70 = [v69 objectAtIndexedSubscript:v43];
                id v71 = [v134 auxiliaryVelocityMemory];
                id v72 = [v71 objectAtIndexedSubscript:v43];
                uint64_t v73 = [v134 auxiliaryCenterWeightMemory];
                long long v74 = [v73 objectAtIndexedSubscript:v43];
                LODWORD(v112) = 65537;
                -[MLCDeviceGPU saveOrRestoreTempMatrixDisableUpdates:commandBuffer:auxiliaryWeightsMemory:auxiliaryMomentumMemory:auxiliaryVelocityMemory:auxiliaryCenterWeightMemory:deviceNumber:kernelNumber:mlcIndex:auxIndex:numOptimizerData:saveToAux:isInputWeight:isHiddenWeight:isBias:](v128, "saveOrRestoreTempMatrixDisableUpdates:commandBuffer:auxiliaryWeightsMemory:auxiliaryMomentumMemory:auxiliaryVelocityMemory:auxiliaryCenterWeightMemory:deviceNumber:kernelNumber:mlcIndex:auxIndex:numOptimizerData:saveToAux:isInputWeight:isHiddenWeight:isBias:", v134, v129, v68, v70, v72, v74, v130, v43, v65, 0, v126, v112);

                unint64_t v54 = v132;
              }
              ++v65;
            }
            while (v65 < v54);
            uint64_t v42 = v134;
            unint64_t v75 = 4 * v43;
            if (v117)
            {
              do
              {
                long long v76 = [v117 objectAtIndexedSubscript:v75];
                char v77 = [v76 isUpdatable];

                if ((v77 & 1) == 0)
                {
                  id v78 = [v42 auxiliaryWeightsMemory];
                  uint64_t v79 = [v78 objectAtIndexedSubscript:v43];
                  id v80 = [v134 auxiliaryMomentumMemory];
                  int v81 = [v80 objectAtIndexedSubscript:v43];
                  int v82 = [v134 auxiliaryVelocityMemory];
                  char v83 = [v82 objectAtIndexedSubscript:v43];
                  id v84 = [v134 auxiliaryCenterWeightMemory];
                  unint64_t v85 = [v84 objectAtIndexedSubscript:v43];
                  LODWORD(v112) = 16777217;
                  -[MLCDeviceGPU saveOrRestoreTempMatrixDisableUpdates:commandBuffer:auxiliaryWeightsMemory:auxiliaryMomentumMemory:auxiliaryVelocityMemory:auxiliaryCenterWeightMemory:deviceNumber:kernelNumber:mlcIndex:auxIndex:numOptimizerData:saveToAux:isInputWeight:isHiddenWeight:isBias:](v128, "saveOrRestoreTempMatrixDisableUpdates:commandBuffer:auxiliaryWeightsMemory:auxiliaryMomentumMemory:auxiliaryVelocityMemory:auxiliaryCenterWeightMemory:deviceNumber:kernelNumber:mlcIndex:auxIndex:numOptimizerData:saveToAux:isInputWeight:isHiddenWeight:isBias:", v134, v129, v79, v81, v83, v85, v130, v43, v75, 0, v126, v112);

                  unint64_t v54 = v132;
                  uint64_t v42 = v134;
                }
                ++v75;
              }
              while (v75 < v54);
            }
          }
          ++v43;
        }
        while (v43 != v115);
        int v15 = v128;
        if (v115)
        {
          uint64_t v86 = 0;
          uint64_t v116 = 0;
          do
          {
            unint64_t v87 = [v42 rnnTrainableWeights];
            uint64_t v88 = [v87 objectAtIndexedSubscript:v86];

            id v120 = v88;
            if ([v88 count])
            {
              unint64_t v89 = 0;
              uint64_t v133 = v86;
              do
              {
                id v90 = [v42 rnnTrainableWeightGradients];
                uint64_t v91 = [v90 objectAtIndexedSubscript:v86];
                uint64_t v92 = [v91 objectAtIndexedSubscript:v89];

                if ([(MLCDeviceGPU *)v15 numDevicesToUse] == 2)
                {
                  uint64_t v93 = [v42 lstmMultiGPUChildOps];
                  int v94 = [v93 multiGPUReduction];

                  uint64_t v95 = v130;
                  if (v94 == 1)
                  {
                    uint64_t v96 = [v42 lstmMultiGPUChildOps];
                    uint64_t v97 = [v96 allReducedGradientMatrices];
                    uint64_t v98 = [v97 objectAtIndexedSubscript:v116];

                    ++v116;
                    id v127 = (void *)v98;
                    uint64_t v95 = v130;
                  }
                  else
                  {
                    id v127 = v92;
                  }
                }
                else
                {
                  id v127 = v92;
                  uint64_t v95 = v130;
                }
                int v99 = [v42 rnnMomentumMatrices];
                uint64_t v100 = [v99 objectAtIndexedSubscript:v86];
                uint64_t v101 = [v42 rnnVelocityMatrices];
                id v102 = [v101 objectAtIndexedSubscript:v86];
                uint64_t v103 = [v42 rnnCenterWeightMatrices];
                uint64_t v104 = [v103 objectAtIndexedSubscript:v133];
                unint64_t v105 = deviceParameterWithVectors(v100, v102, v104);

                uint64_t v106 = [v119 objectAtIndexedSubscript:v95];
                BOOL v125 = [v42 rnnTrainableWeights];
                id v107 = [v125 objectAtIndexedSubscript:v133];
                uint64_t v108 = [v107 objectAtIndexedSubscript:v89];
                uint64_t v109 = [v42 rnnTrainableWeights];
                uint64_t v110 = [v109 objectAtIndexedSubscript:v133];
                id v111 = [v110 objectAtIndexedSubscript:v89];
                int v15 = v128;
                [(MLCDeviceGPU *)v128 updateWithOptimizer:v106 arrayOfParams:v118 commandBuffer:v129 deviceParameter:v105 source:v108 gradient:v127 result:v111 momentumIndex:v89];

                uint64_t v42 = v134;
                uint64_t v86 = v133;

                ++v89;
              }
              while (v89 < [v120 count]);
            }

            ++v86;
          }
          while (v86 != v115);
        }
      }

      uint64_t v16 = v130 + 1;
    }
    while (v130 + 1 < [(MLCDeviceGPU *)v15 numDevicesToUse]);
  }
}

- (void)updateTensorParameter:(id)a3 optimizer:(id)a4 gradient:(id)a5 arrayOfParams:(id)a6
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v44 = a4;
  id v46 = a5;
  id v45 = a6;
  uint64_t v49 = self;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v10 = 0;
    do
    {
      id v11 = [(MLCDeviceGPU *)v49 gpuCommandBufferList];
      uint64_t v48 = [v11 objectAtIndexedSubscript:v10];

      unint64_t v12 = [v47 tensor];
      unint64_t v13 = [v12 optimizerDeviceData];
      id v14 = [v13 objectAtIndexedSubscript:v10];

      int v15 = [v47 tensor];
      uint64_t v16 = [v15 deviceMemory];
      id v17 = [v16 objectAtIndexedSubscript:v10];

      id v18 = [v46 deviceMemory];
      int v19 = [v18 objectAtIndexedSubscript:v10];

      uint64_t v20 = (void *)MEMORY[0x1E4F35640];
      uint64_t v21 = [v47 tensor];
      unint64_t v22 = [v21 descriptor];
      unint64_t v23 = (unint64_t)[v22 tensorAllocationSizeInBytes] >> 2;
      unint64_t v24 = [v47 tensor];
      BOOL v25 = [v24 descriptor];
      uint64_t v26 = objc_msgSend(v20, "matrixDescriptorWithRows:columns:rowBytes:dataType:", 1, v23, objc_msgSend(v25, "tensorAllocationSizeInBytes"), 268435488);

      unint64_t v27 = v14;
      uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v17 descriptor:v26];
      uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v19 descriptor:v26];
      if ([(MLCDeviceGPU *)v49 numDevicesToUse] == 2)
      {
        uint64_t v30 = [v14 gpuOps];
        int v31 = [v30 multiGPUReduction];

        if (v31 == 1)
        {
          uint64_t v43 = [v47 tensor];
          uint64_t v42 = [v43 optimizerDeviceData];
          uint64_t v41 = [v42 objectAtIndexedSubscript:0];
          int v40 = [v41 gpuOps];
          v51[0] = v40;
          int v38 = [v47 tensor];
          id v32 = [v38 optimizerDeviceData];
          int v33 = [v32 objectAtIndexedSubscript:1];
          [v33 gpuOps];
          uint64_t v35 = v34 = v19;
          v51[1] = v35;
          int v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];

          int v19 = v34;
          uint64_t v50 = v34;
          id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
          [(MLCDeviceGPU *)v49 allReduceOverXGMI:v39 deviceIndex:v10 stateBuffers:v36];
        }
      }
      id v37 = [v44 objectAtIndexedSubscript:v10];
      [(MLCDeviceGPU *)v49 updateWithOptimizer:v37 arrayOfParams:v45 commandBuffer:v48 deviceParameter:v27 source:v28 gradient:v29 result:v28 momentumIndex:0];

      ++v10;
    }
    while (v10 < [(MLCDeviceGPU *)v49 numDevicesToUse]);
  }
}

- (void)updateWithAdamOptimizer:(id)a3 encoder:(id)a4 deviceParameter:(id)a5 source:(id)a6 gradient:(id)a7 result:(id)a8 momentumIndex:(unint64_t)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  float v18 = (float)(unint64_t)[v13 timeStep];
  [v13 learningRate];
  float v20 = v19;
  [v13 beta2];
  float v22 = v20 * sqrtf(1.0 - powf(v21, v18));
  [v13 beta1];
  v87[0] = 0;
  float v24 = v22 / (float)(1.0 - powf(v23, v18));
  [v13 beta1];
  v87[1] = v25;
  [v13 beta2];
  v87[2] = v26;
  [v13 epsilon];
  v87[5] = v27;
  [v13 learningRate];
  v87[3] = v28;
  *(float *)&v87[4] = v24;
  uint64_t v29 = [v13 descriptor];
  [v29 gradientRescale];
  float v31 = v30;
  float v88 = v30;

  id v32 = [v13 descriptor];
  [v32 gradientClipMin];
  v87[6] = v33;

  uint64_t v34 = [v13 descriptor];
  [v34 gradientClipMax];
  v87[7] = v35;

  id v36 = [v13 descriptor];
  [v36 maximumClippingNorm];
  float v38 = v37;
  *(float *)&v87[8] = v37;

  int v39 = [v13 descriptor];
  [v39 regularizationScale];
  int v89 = v40;

  uint64_t v41 = [v13 descriptor];
  int v90 = [v41 regularizationType];

  int v92 = [v13 decoupleWeightDecay];
  int v91 = 0;
  uint64_t v42 = [v13 descriptor];
  LODWORD(a7) = [v42 appliesGradientClipping];

  if (!a7) {
    goto LABEL_9;
  }
  uint64_t v43 = [v13 descriptor];
  if ([v43 gradientClippingType] != 2)
  {

    goto LABEL_7;
  }
  id v44 = [v13 descriptor];
  [v44 customGlobalNorm];
  float v46 = v45;

  if (v46 == 0.0)
  {
LABEL_7:
    uint64_t v50 = [v13 descriptor];
    int v91 = [v50 gradientClippingType] + 1;
    goto LABEL_8;
  }
  id v47 = [v13 descriptor];
  [v47 customGlobalNorm];
  float v49 = v48;

  if (v49 > v38)
  {
    uint64_t v50 = [v13 descriptor];
    [v50 customGlobalNorm];
    float v88 = v31 * (float)(v38 / v51);
LABEL_8:
  }
LABEL_9:
  objc_opt_class();
  id v80 = v16;
  int v81 = v17;
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v52 = [v17 data];
    id v53 = [v16 data];
  }
  else
  {
    id v52 = v17;
    id v53 = v16;
  }
  uint64_t v79 = v53;
  unint64_t v54 = (unint64_t)[v52 length] >> 2;
  v87[0] = v54;
  unint64_t v55 = [v15 momentumVectors];
  id v56 = [v55 objectAtIndexedSubscript:a9];
  objc_opt_class();
  objc_opt_isKindOfClass();

  char v57 = [v15 momentumVectors];
  id v58 = [v57 objectAtIndexedSubscript:a9];
  int v82 = [v58 data];

  id v59 = [v15 velocityVectors];
  id v60 = [v59 objectAtIndexedSubscript:a9];
  objc_opt_class();
  objc_opt_isKindOfClass();

  long long v61 = [v15 velocityVectors];
  uint64_t v62 = [v61 objectAtIndexedSubscript:a9];
  long long v63 = [v62 data];

  if ([v13 amsgrad])
  {
    uint64_t v64 = [v15 centerWeightVectors];
    unint64_t v65 = [v64 objectAtIndexedSubscript:a9];
    objc_opt_class();
    objc_opt_isKindOfClass();

    long long v66 = [v15 centerWeightVectors];
    char v67 = [v66 objectAtIndexedSubscript:a9];
    id v68 = [v67 data];
  }
  else
  {
    id v68 = 0;
  }
  id v69 = [v13 kernel];
  unint64_t v70 = [v69 threadExecutionWidth];
  unint64_t v71 = [v69 maxTotalThreadsPerThreadgroup];
  if (v71 > (int)v54)
  {
    unint64_t v72 = (v70 + (int)v54 - 1) / v70 * v70;
    uint64_t v73 = [v13 descriptor];
    int v74 = [v73 gradientClippingType];

    unint64_t v75 = 1 << -(char)__clz(v72);
    if (v74 == 1) {
      unint64_t v71 = v75;
    }
    else {
      unint64_t v71 = v72;
    }
  }
  [v14 setBuffer:v79 offset:0 atIndex:0];
  [v14 setBuffer:v82 offset:0 atIndex:1];
  [v14 setBuffer:v63 offset:0 atIndex:2];
  [v14 setBuffer:v52 offset:0 atIndex:3];
  [v14 setBytes:v87 length:56 atIndex:4];
  if ([v13 amsgrad]) {
    long long v76 = v68;
  }
  else {
    long long v76 = v63;
  }
  [v14 setBuffer:v76 offset:0 atIndex:5];
  char v77 = [v13 l2NormBuffer];

  if (v77)
  {
    id v78 = [v13 l2NormBuffer];
    [v14 setBuffer:v78 offset:0 atIndex:6];
  }
  else
  {
    [v14 setBuffer:v52 offset:0 atIndex:6];
  }
  [v14 setThreadgroupMemoryLength:4 * v71 atIndex:0];
  int64x2_t v84 = vdupq_n_s64(1uLL);
  int64x2_t v85 = v84;
  uint64_t v86 = 1;
  unint64_t v83 = v71;
  [v14 dispatchThreadgroups:&v85 threadsPerThreadgroup:&v83];
}

- (void)updateWithSGDOptimizer:(id)a3 encoder:(id)a4 deviceParameter:(id)a5 source:(id)a6 gradient:(id)a7 result:(id)a8 momentumIndex:(unint64_t)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  long long v77 = 0u;
  v75[0] = 0;
  [v13 learningRate];
  v75[1] = v18;
  float v19 = [v13 descriptor];
  [v19 gradientRescale];
  float v21 = v20;
  float v76 = v20;

  float v22 = [v13 descriptor];
  [v22 gradientClipMin];
  v75[3] = v23;

  float v24 = [v13 descriptor];
  [v24 gradientClipMax];
  v75[4] = v25;

  int v26 = [v13 descriptor];
  [v26 maximumClippingNorm];
  float v28 = v27;
  *(float *)&v75[5] = v27;

  uint64_t v29 = [v13 descriptor];
  [v29 regularizationScale];
  LODWORD(v77) = v30;

  float v31 = [v13 descriptor];
  *(void *)((char *)&v77 + 4) = [v31 regularizationType];

  [v13 momentumScale];
  v75[2] = v32;
  BYTE12(v77) = [v13 usesNesterov];
  int v33 = [v13 descriptor];
  int v34 = [v33 appliesGradientClipping];

  if (!v34) {
    goto LABEL_9;
  }
  int v35 = [v13 descriptor];
  if ([v35 gradientClippingType] != 2)
  {

    goto LABEL_7;
  }
  id v36 = [v13 descriptor];
  [v36 customGlobalNorm];
  float v38 = v37;

  if (v38 == 0.0)
  {
LABEL_7:
    uint64_t v42 = [v13 descriptor];
    DWORD2(v77) = [v42 gradientClippingType] + 1;
    goto LABEL_8;
  }
  int v39 = [v13 descriptor];
  [v39 customGlobalNorm];
  float v41 = v40;

  if (v41 > v28)
  {
    uint64_t v42 = [v13 descriptor];
    [v42 customGlobalNorm];
    float v76 = v21 * (float)(v28 / v43);
LABEL_8:
  }
LABEL_9:
  objc_opt_class();
  id v67 = v16;
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_msgSend(v17, "data", v16);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    id v45 = [v16 data];
  }
  else
  {
    id v44 = v17;
    id v45 = v16;
  }
  id v46 = v45;
  unint64_t v47 = (unint64_t)objc_msgSend(v44, "length", v67) >> 2;
  v75[0] = v47;
  [v13 momentumScale];
  id v69 = v17;
  unint64_t v70 = v15;
  if (v48 == 0.0)
  {
    unint64_t v54 = 0;
  }
  else
  {
    [v15 momentumVectors];
    v50 = float v49 = v15;
    float v51 = [v50 objectAtIndexedSubscript:a9];
    objc_opt_class();
    objc_opt_isKindOfClass();

    id v52 = [v49 momentumVectors];
    id v53 = [v52 objectAtIndexedSubscript:a9];
    unint64_t v54 = [v53 data];
  }
  unint64_t v55 = v46;
  id v56 = [v13 kernel];
  unint64_t v57 = [v56 threadExecutionWidth];
  unint64_t v58 = [v56 maxTotalThreadsPerThreadgroup];
  if (v58 > (int)v47)
  {
    unint64_t v59 = (v57 + (int)v47 - 1) / v57 * v57;
    id v60 = [v13 descriptor];
    int v61 = [v60 gradientClippingType];

    unint64_t v62 = 1 << -(char)__clz(v59);
    if (v61 == 1) {
      unint64_t v58 = v62;
    }
    else {
      unint64_t v58 = v59;
    }
  }
  [v14 setBuffer:v55 offset:0 atIndex:0];
  [v13 momentumScale];
  if (v63 == 0.0) {
    id v64 = v44;
  }
  else {
    id v64 = v54;
  }
  [v14 setBuffer:v64 offset:0 atIndex:1];
  [v14 setBuffer:v44 offset:0 atIndex:3];
  [v14 setBytes:v75 length:44 atIndex:4];
  unint64_t v65 = [v13 l2NormBuffer];

  if (v65)
  {
    long long v66 = [v13 l2NormBuffer];
    [v14 setBuffer:v66 offset:0 atIndex:5];
  }
  else
  {
    [v14 setBuffer:v44 offset:0 atIndex:5];
  }
  [v14 setThreadgroupMemoryLength:4 * v58 atIndex:0];
  int64x2_t v72 = vdupq_n_s64(1uLL);
  int64x2_t v73 = v72;
  uint64_t v74 = 1;
  unint64_t v71 = v58;
  [v14 dispatchThreadgroups:&v73 threadsPerThreadgroup:&v71];
}

- (void)updateWithRMSPropOptimizer:(id)a3 encoder:(id)a4 deviceParameter:(id)a5 source:(id)a6 gradient:(id)a7 result:(id)a8 momentumIndex:(unint64_t)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v84[0] = 0;
  [v13 learningRate];
  v84[1] = v18;
  float v19 = [v13 descriptor];
  [v19 gradientRescale];
  float v21 = v20;
  float v85 = v20;

  float v22 = [v13 descriptor];
  [v22 gradientClipMin];
  _OWORD v84[5] = v23;

  float v24 = [v13 descriptor];
  [v24 gradientClipMax];
  v84[6] = v25;

  int v26 = [v13 descriptor];
  [v26 maximumClippingNorm];
  float v28 = v27;
  *(float *)&v84[7] = v27;

  uint64_t v29 = [v13 descriptor];
  [v29 regularizationScale];
  int v86 = v30;

  float v31 = [v13 descriptor];
  uint64_t v87 = [v31 regularizationType];

  [v13 momentumScale];
  v84[2] = v32;
  [v13 alpha];
  v84[3] = v33;
  [v13 epsilon];
  v84[4] = v34;
  int v88 = [v13 centered];
  int v35 = [v13 descriptor];
  LODWORD(a7) = [v35 appliesGradientClipping];

  if (!a7) {
    goto LABEL_9;
  }
  id v36 = [v13 descriptor];
  if ([v36 gradientClippingType] != 2)
  {

    goto LABEL_7;
  }
  float v37 = [v13 descriptor];
  [v37 customGlobalNorm];
  float v39 = v38;

  if (v39 == 0.0)
  {
LABEL_7:
    float v43 = [v13 descriptor];
    HIDWORD(v87) = [v43 gradientClippingType] + 1;
    goto LABEL_8;
  }
  float v40 = [v13 descriptor];
  [v40 customGlobalNorm];
  float v42 = v41;

  if (v42 > v28)
  {
    float v43 = [v13 descriptor];
    [v43 customGlobalNorm];
    float v85 = v21 * (float)(v28 / v44);
LABEL_8:
  }
LABEL_9:
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v45 = [v17 data];
    id v46 = [v16 data];
  }
  else
  {
    id v45 = v17;
    id v46 = v16;
  }
  uint64_t v79 = v46;
  unint64_t v47 = [v15 momentumVectors];
  float v48 = [v47 objectAtIndexedSubscript:a9];

  objc_opt_class();
  int64x2_t v72 = v17;
  int64x2_t v73 = v16;
  unint64_t v75 = v48;
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v49 = [v48 data];
  }
  else
  {
    id v49 = v48;
  }
  id v78 = v49;
  unint64_t v50 = (unint64_t)[v45 length] >> 2;
  v84[0] = v50;
  [v13 momentumScale];
  float v52 = v51;
  int v53 = [v13 centered];
  int v54 = v53;
  float v76 = v45;
  long long v77 = v15;
  if (v52 == 0.0)
  {
    if (!v53)
    {
      id v60 = 0;
      uint64_t v74 = 0;
      id v56 = 0;
      goto LABEL_35;
    }
    unint64_t v57 = [v15 velocityVectors];
    unint64_t v58 = [v57 objectAtIndexedSubscript:a9];
    id v56 = 0;
  }
  else
  {
    unint64_t v55 = [v15 velocityVectors];
    id v56 = [v55 objectAtIndexedSubscript:a9];

    if (!v54)
    {
      unint64_t v58 = 0;
      goto LABEL_27;
    }
    unint64_t v57 = [v15 centerWeightVectors];
    [v57 objectAtIndexedSubscript:a9];
    id v56 = v58 = v56;
  }

  if (!v58)
  {
LABEL_27:
    id v60 = 0;
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v59 = [v58 data];
  }
  else
  {
    id v59 = v58;
    unint64_t v58 = v59;
  }
  id v60 = v59;
LABEL_31:
  uint64_t v74 = v58;
  if (v56)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v61 = [v56 data];
    }
    else
    {
      id v61 = v56;
      id v56 = v61;
    }
    unint64_t v62 = v61;
    goto LABEL_38;
  }
LABEL_35:
  unint64_t v62 = 0;
LABEL_38:
  float v63 = [v13 kernel];
  unint64_t v64 = [v63 threadExecutionWidth];
  unint64_t v65 = [v63 maxTotalThreadsPerThreadgroup];
  if (v65 > (int)v50)
  {
    unint64_t v66 = (v64 + (int)v50 - 1) / v64 * v64;
    id v67 = [v13 descriptor];
    int v68 = [v67 gradientClippingType];

    unint64_t v69 = 1 << -(char)__clz(v66);
    if (v68 == 1) {
      unint64_t v65 = v69;
    }
    else {
      unint64_t v65 = v66;
    }
  }
  [v14 setBuffer:v79 offset:0 atIndex:0];
  [v14 setBuffer:v78 offset:0 atIndex:1];
  [v14 setBuffer:v60 offset:0 atIndex:2];
  [v14 setBuffer:v76 offset:0 atIndex:3];
  [v14 setBytes:v84 length:52 atIndex:4];
  [v14 setBuffer:v62 offset:0 atIndex:5];
  unint64_t v70 = [v13 l2NormBuffer];

  if (v70)
  {
    unint64_t v71 = [v13 l2NormBuffer];
    [v14 setBuffer:v71 offset:0 atIndex:6];
  }
  else
  {
    [v14 setBuffer:v76 offset:0 atIndex:6];
  }
  [v14 setThreadgroupMemoryLength:4 * v65 atIndex:0];
  int64x2_t v81 = vdupq_n_s64(1uLL);
  int64x2_t v82 = v81;
  uint64_t v83 = 1;
  unint64_t v80 = v65;
  [v14 dispatchThreadgroups:&v82 threadsPerThreadgroup:&v80];
}

- (void)updateWithOptimizer:(id)a3 arrayOfParams:(id)a4 commandBuffer:(id)a5 deviceParameter:(id)a6 source:(id)a7 gradient:(id)a8 result:(id)a9 momentumIndex:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (v18)
  {
    [v18 addObject:v19];
    [v18 addObject:v20];
    if (v21)
    {
      [v18 addObject:v21];
    }
    else
    {
      int v26 = [MEMORY[0x1E4F1CA98] null];
      [v18 addObject:v26];
    }
    [v18 addObject:v22];
    float v27 = [NSNumber numberWithUnsignedInteger:a10];
    [v18 addObject:v27];
  }
  else
  {
    uint64_t v29 = a2;
    int v23 = [a5 computeCommandEncoderWithDispatchType:0];
    float v24 = [v17 kernel];
    [v23 setComputePipelineState:v24];
    int v25 = [v17 gpuOptimizerKernelType];
    switch(v25)
    {
      case 3:
        [(MLCDeviceGPU *)self updateWithRMSPropOptimizer:v17 encoder:v23 deviceParameter:v19 source:v20 gradient:v21 result:v22 momentumIndex:a10];
        break;
      case 2:
        [(MLCDeviceGPU *)self updateWithSGDOptimizer:v17 encoder:v23 deviceParameter:v19 source:v20 gradient:v21 result:v22 momentumIndex:a10];
        break;
      case 1:
        [(MLCDeviceGPU *)self updateWithAdamOptimizer:v17 encoder:v23 deviceParameter:v19 source:v20 gradient:v21 result:v22 momentumIndex:a10];
        break;
      default:
        float v28 = +[MLCLog framework];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[MLCDeviceGPU(MLCEngineDispatch) updateWithOptimizer:arrayOfParams:commandBuffer:deviceParameter:source:gradient:result:momentumIndex:](v29, v28);
        }

        break;
    }
    [v23 endEncoding];
  }
}

- (void)updateAllParametersWithOptimizer:(id)a3 arrayOfParameters:(id)a4
{
  v77[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v67 = v6;
  int v68 = self;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v8 = 0;
    do
    {
      v77[0] = 0;
      id v9 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      unint64_t v10 = [v9 objectAtIndexedSubscript:v8];

      id v11 = [v6 objectAtIndexedSubscript:v8];
      unint64_t v12 = [v11 computeL2NormKernel];

      if (v12)
      {
        id v13 = [v6 objectAtIndexedSubscript:v8];
        id v14 = [v13 l2NormBuffer];

        if (!v14)
        {
          id v15 = [v10 device];
          id v16 = objc_msgSend(v15, "newBufferWithLength:options:", 4096, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
          id v17 = [v6 objectAtIndexedSubscript:v8];
          [v17 setL2NormBuffer:v16];
        }
        unint64_t v65 = v10;
        id v18 = [v10 computeCommandEncoderWithDispatchType:1];
        id v19 = [v6 objectAtIndexedSubscript:v8];
        id v20 = [v19 computeL2NormKernel];
        [v18 setComputePipelineState:v20];

        id v21 = [v6 objectAtIndexedSubscript:v8];
        id v22 = [v21 computeL2NormKernel];
        unint64_t v23 = [v22 maxTotalThreadsPerThreadgroup];

        if ([v7 count])
        {
          unint64_t v24 = 0;
          do
          {
            int v25 = [v7 objectAtIndexedSubscript:v24 + 2];
            int v26 = [MEMORY[0x1E4F1CA98] null];
            int v27 = [v25 isEqual:v26];

            if (v27)
            {

              int v25 = 0;
            }
            unint64_t v28 = (unint64_t)[v25 length] >> 2;
            LODWORD(v77[0]) = v28;
            if (v28 >= v23) {
              unint64_t v28 = v23;
            }
            unint64_t v29 = 1 << -(char)__clz(v28);
            if ((v28 & (v28 - 1)) != 0) {
              unint64_t v30 = v29;
            }
            else {
              unint64_t v30 = v28;
            }
            [v18 setBuffer:v25 offset:0 atIndex:0];
            float v31 = [v67 objectAtIndexedSubscript:v8];
            int v32 = [v31 l2NormBuffer];
            [v18 setBuffer:v32 offset:0 atIndex:1];

            [v18 setBytes:v77 length:8 atIndex:2];
            [v18 setThreadgroupMemoryLength:4 * v30 atIndex:0];
            int64x2_t v74 = vdupq_n_s64(1uLL);
            int64x2_t v75 = v74;
            uint64_t v76 = 1;
            unint64_t v73 = v30;
            [v18 dispatchThreadgroups:&v75 threadsPerThreadgroup:&v73];
            ++HIDWORD(v77[0]);

            v24 += 5;
          }
          while (v24 < [v7 count]);
        }
        [v18 memoryBarrierWithScope:1];
        id v6 = v67;
        int v33 = [v67 objectAtIndexedSubscript:v8];
        int v34 = [v33 sumL2NormKernel];
        [v18 setComputePipelineState:v34];

        int v35 = [v67 objectAtIndexedSubscript:v8];
        id v36 = [v35 sumL2NormKernel];
        unint64_t v37 = [v36 maxTotalThreadsPerThreadgroup];

        unint64_t v38 = [v7 count];
        if (v38 / 5 >= v37) {
          unint64_t v39 = v37;
        }
        else {
          unint64_t v39 = v38 / 5;
        }
        unint64_t v40 = 1 << -(char)__clz(v39);
        if ((v39 & (v39 - 1)) != 0) {
          unint64_t v41 = v40;
        }
        else {
          unint64_t v41 = v39;
        }
        LODWORD(v77[0]) = v38 / 5;
        float v42 = [v67 objectAtIndexedSubscript:v8];
        float v43 = [v42 l2NormBuffer];
        [v18 setBuffer:v43 offset:0 atIndex:0];

        [v18 setBytes:v77 length:4 atIndex:1];
        [v18 setThreadgroupMemoryLength:4 * v41 atIndex:0];
        int64x2_t v70 = vdupq_n_s64(1uLL);
        int64x2_t v71 = v70;
        uint64_t v72 = 1;
        unint64_t v69 = v41;
        [v18 dispatchThreadgroups:&v71 threadsPerThreadgroup:&v69];
        [v18 endEncoding];

        self = v68;
        unint64_t v10 = v65;
      }

      ++v8;
    }
    while (v8 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v44 = 0;
    do
    {
      id v45 = [v6 objectAtIndexedSubscript:v44];
      id v46 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      uint64_t v66 = v44;
      unint64_t v47 = [v46 objectAtIndexedSubscript:v44];

      unint64_t v64 = v47;
      float v48 = [v47 computeCommandEncoderWithDispatchType:1];
      float v63 = [v45 kernel];
      objc_msgSend(v48, "setComputePipelineState:");
      [v48 memoryBarrierWithScope:1];
      if ([v7 count])
      {
        uint64_t v49 = 0;
        do
        {
          unint64_t v50 = [v7 objectAtIndexedSubscript:v49];
          float v51 = [v7 objectAtIndexedSubscript:v49 + 1];
          uint64_t v52 = v49 + 2;
          int v53 = [v7 objectAtIndexedSubscript:v49 + 2];
          int v54 = [MEMORY[0x1E4F1CA98] null];
          int v55 = [v53 isEqual:v54];

          if (v55)
          {

            int v53 = 0;
          }
          id v56 = [v7 objectAtIndexedSubscript:v52 + 1];
          uint64_t v57 = v52 + 2;
          unint64_t v58 = [v7 objectAtIndexedSubscript:v57];
          uint64_t v59 = [v58 unsignedIntegerValue];

          int v60 = [v45 gpuOptimizerKernelType];
          switch(v60)
          {
            case 3:
              [(MLCDeviceGPU *)v68 updateWithRMSPropOptimizer:v45 encoder:v48 deviceParameter:v50 source:v51 gradient:v53 result:v56 momentumIndex:v59];
              break;
            case 2:
              [(MLCDeviceGPU *)v68 updateWithSGDOptimizer:v45 encoder:v48 deviceParameter:v50 source:v51 gradient:v53 result:v56 momentumIndex:v59];
              break;
            case 1:
              [(MLCDeviceGPU *)v68 updateWithAdamOptimizer:v45 encoder:v48 deviceParameter:v50 source:v51 gradient:v53 result:v56 momentumIndex:v59];
              break;
            default:
              id v61 = +[MLCLog framework];
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                [(MLCDeviceGPU(MLCEngineDispatch) *)(uint8_t *)v77 updateAllParametersWithOptimizer:(void *)((char *)v77 + 4) arrayOfParameters:v61];
              }

              break;
          }

          uint64_t v49 = v57 + 1;
        }
        while (v57 + 1 < (unint64_t)[v7 count]);
      }
      [v48 endEncoding];

      uint64_t v44 = v66 + 1;
      self = v68;
      id v6 = v67;
    }
    while (v66 + 1 < [(MLCDeviceGPU *)v68 numDevicesToUse]);
  }
  [v7 removeAllObjects];
}

- (void)synchronizeWeightMatrixForRNNLayer:(id)a3 matrixId:(unint64_t)a4 parameterType:(unint64_t)a5 accumulatorIndex:(unint64_t)a6 forLSTMNum:(unint64_t)a7 forDeviceNum:(unint64_t)a8 forGate:(unint64_t)a9
{
  id v13 = a3;
  id v14 = [v13 deviceOps];
  id v15 = [v14 objectAtIndexedSubscript:a8];

  id v16 = [(MLCDeviceGPU *)self gpuCommandBufferList];
  id v17 = [v16 objectAtIndexedSubscript:a8];

  unint64_t v64 = [v15 gradientKernel];
  id v18 = v13;
  id v19 = [v18 descriptor];
  uint64_t v20 = [v19 hiddenSize];

  id v21 = [v18 descriptor];
  uint64_t v22 = [v21 inputSize];

  if (a5 == 2)
  {
    uint64_t v22 = v20;
    uint64_t v20 = 1;
  }
  else if (a5 == 1)
  {
    uint64_t v22 = v20;
  }
  else if (a5)
  {
    uint64_t v22 = 0;
    uint64_t v20 = 0;
  }
  else
  {
    unint64_t v23 = [v18 descriptor];
    if (a7 % [v23 layerCount]) {
      uint64_t v22 = v20;
    }
  }
  uint64_t v24 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v20 columns:v22 rowBytes:4 * v22 dataType:268435488];
  id v25 = objc_alloc(MEMORY[0x1E4F35618]);
  int v26 = [(MLCDeviceGPU *)self deviceList];
  int v27 = [v26 objectAtIndexedSubscript:a8];
  id v61 = (void *)v24;
  unint64_t v28 = (void *)[v25 initWithDevice:v27 descriptor:v24];

  long long v67 = 0uLL;
  uint64_t v68 = 0;
  unint64_t v29 = v64;
  unint64_t v30 = [v64 objectAtIndexedSubscript:a7];
  float v31 = [v15 rnnTrainableWeights];
  int v32 = [v31 objectAtIndexedSubscript:a7];
  long long v65 = 0uLL;
  uint64_t v66 = 0;
  [v30 encodeCopyWeightsToCommandBuffer:v17 weights:v32 matrixId:a4 matrix:v28 copyFromWeightsToMatrix:1 matrixOffset:&v65];

  [v28 synchronizeOnCommandBuffer:v17];
  if (a5 <= 1)
  {
    int v33 = [v15 rnnExportedWeightMatrices];
    unint64_t v34 = a6;
    unint64_t v35 = a4;
LABEL_15:
    [v33 addObject:v28];

    goto LABEL_16;
  }
  BOOL v36 = a5 == 2;
  unint64_t v34 = a6;
  unint64_t v35 = a4;
  if (v36)
  {
    int v33 = [v15 rnnExportedBiasTerms];
    goto LABEL_15;
  }
LABEL_16:
  unint64_t v37 = [v15 momentumVectors];
  uint64_t v38 = [v37 count];

  if (v38)
  {
    int v60 = [v15 momentumVectors];
    unint64_t v39 = [v60 objectAtIndexedSubscript:v34];
    unint64_t v40 = [v64 objectAtIndexedSubscript:a7];
    unint64_t v41 = [v15 rnnMomentumMatrices];
    float v42 = [v41 objectAtIndexedSubscript:a7];
    long long v65 = 0uLL;
    uint64_t v66 = 0;
    [v40 encodeCopyWeightsToCommandBuffer:v17 weights:v42 matrixId:v35 matrix:v39 copyFromWeightsToMatrix:1 matrixOffset:&v65];

    [v39 synchronizeOnCommandBuffer:v17];
    float v43 = [v15 velocityVectors];
    uint64_t v44 = [v43 count];

    if (v44)
    {
      uint64_t v59 = [v15 velocityVectors];
      id v45 = [v59 objectAtIndexedSubscript:a6];
      id v46 = [v64 objectAtIndexedSubscript:a7];
      unint64_t v47 = [v15 rnnVelocityMatrices];
      uint64_t v48 = [v47 objectAtIndexedSubscript:a7];
      unint64_t v49 = v35;
      unint64_t v50 = (void *)v48;
      long long v65 = 0uLL;
      uint64_t v66 = 0;
      [v46 encodeCopyWeightsToCommandBuffer:v17 weights:v48 matrixId:v49 matrix:v45 copyFromWeightsToMatrix:1 matrixOffset:&v65];

      unint64_t v58 = v45;
      [v45 synchronizeOnCommandBuffer:v17];
      float v51 = [v15 centerWeightVectors];
      uint64_t v52 = [v51 count];

      if (v52)
      {
        int v53 = [v15 centerWeightVectors];
        int v54 = [v53 objectAtIndexedSubscript:a6];
        int v55 = [v64 objectAtIndexedSubscript:a7];
        id v56 = [v15 rnnCenterWeightMatrices];
        uint64_t v57 = [v56 objectAtIndexedSubscript:a7];
        long long v65 = v67;
        uint64_t v66 = v68;
        [v55 encodeCopyWeightsToCommandBuffer:v17 weights:v57 matrixId:a4 matrix:v54 copyFromWeightsToMatrix:1 matrixOffset:&v65];

        [v54 synchronizeOnCommandBuffer:v17];
      }
    }
    unint64_t v29 = v64;
  }
}

- (void)synchronizeOptimizerBuffers:(id)a3 commandBuffer:(id)a4
{
  id v18 = a3;
  id v5 = a4;
  id v6 = [v18 momentumVectors];
  if ([v6 count])
  {
    unint64_t v7 = 0;
    do
    {
      unint64_t v8 = [v6 objectAtIndexedSubscript:v7];
      id v9 = [v8 data];
      +[MLCGPUHelper synchronizeResource:v9 commandBuffer:v5];

      ++v7;
    }
    while (v7 < [v6 count]);
  }
  unint64_t v10 = [v18 velocityVectors];
  if ([v10 count])
  {
    unint64_t v11 = 0;
    do
    {
      unint64_t v12 = [v10 objectAtIndexedSubscript:v11];
      id v13 = [v12 data];
      +[MLCGPUHelper synchronizeResource:v13 commandBuffer:v5];

      ++v11;
    }
    while (v11 < [v10 count]);
  }
  id v14 = [v18 centerWeightVectors];
  if ([v14 count])
  {
    unint64_t v15 = 0;
    do
    {
      id v16 = [v14 objectAtIndexedSubscript:v15];
      id v17 = [v16 data];
      +[MLCGPUHelper synchronizeResource:v17 commandBuffer:v5];

      ++v15;
    }
    while (v15 < [v14 count]);
  }
}

- (void)synchronizeUpdatesForLayer:(id)a3
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0x1E6CB4000uLL;
    unint64_t v7 = 0x1E6CB4000uLL;
    id v111 = v4;
    while (1)
    {
      unint64_t v8 = [v4 deviceOps];
      id v9 = [v8 objectAtIndexedSubscript:v5];

      unint64_t v10 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      unint64_t v11 = [v10 objectAtIndexedSubscript:v5];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = *(void **)(v7 + 1088);
          id v21 = [v9 exportableState];
          uint64_t v22 = [v21 objectAtIndexedSubscript:0];
          [v20 synchronizeResource:v22 commandBuffer:v11];

          unint64_t v23 = [v9 exportableState];
          unint64_t v24 = [v23 count];

          if (v24 >= 2)
          {
            id v25 = *(void **)(v7 + 1088);
            int v26 = [v9 exportableState];
            int v27 = [v26 objectAtIndexedSubscript:1];
            [v25 synchronizeResource:v27 commandBuffer:v11];
          }
          goto LABEL_14;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          BOOL v36 = [v9 exportableState];
          unint64_t v37 = v36;
          if (v36)
          {
            uint64_t v38 = *(void **)(v7 + 1088);
            unint64_t v39 = [v36 gamma];
            [v38 synchronizeResource:v39 commandBuffer:v11];

            unint64_t v40 = *(void **)(v7 + 1088);
            unint64_t v41 = [v37 beta];
            [v40 synchronizeResource:v41 commandBuffer:v11];
          }
          float v42 = [v9 movingState];
          float v43 = v42;
          if (v42)
          {
            uint64_t v44 = *(void **)(v7 + 1088);
            id v45 = [v42 mean];
            [v44 synchronizeResource:v45 commandBuffer:v11];

            id v46 = [v43 variance];
            +[MLCGPUHelper synchronizeResource:v46 commandBuffer:v11];

            unint64_t v7 = 0x1E6CB4000;
          }
          [(MLCDeviceGPU *)self synchronizeOptimizerBuffers:v9 commandBuffer:v11];

          goto LABEL_24;
        }
        objc_opt_class();
        uint64_t v112 = v11;
        if (objc_opt_isKindOfClass())
        {
          uint64_t v109 = v9;
          id v47 = v9;
          uint64_t v48 = (void *)MEMORY[0x1E4F1CBF0];
          unint64_t v49 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          [v47 setRnnExportedWeightMatrices:v49];

          unint64_t v50 = (void *)[v48 mutableCopy];
          uint64_t v108 = v47;
          [v47 setRnnExportedBiasTerms:v50];

          id v51 = v4;
          uint64_t v52 = [v51 descriptor];
          uint64_t v53 = [v52 layerCount];

          int v54 = [v51 descriptor];
          char v55 = [v54 isBidirectional];

          uint64_t v110 = v53 << v55;
          if (v53 << v55)
          {
            uint64_t v56 = 0;
            uint64_t v57 = 0;
            do
            {
              for (uint64_t i = 0; i != 4; ++i)
              {
                uint64_t v59 = [&unk_1F3876EA0 objectAtIndexedSubscript:i];
                -[MLCDeviceGPU synchronizeWeightMatrixForRNNLayer:matrixId:parameterType:accumulatorIndex:forLSTMNum:forDeviceNum:forGate:](self, "synchronizeWeightMatrixForRNNLayer:matrixId:parameterType:accumulatorIndex:forLSTMNum:forDeviceNum:forGate:", v51, [v59 unsignedIntegerValue], 0, v56 + i, v57, v5, i);
              }
              for (uint64_t j = 0; j != 4; ++j)
              {
                id v61 = [&unk_1F3876EB8 objectAtIndexedSubscript:j];
                -[MLCDeviceGPU synchronizeWeightMatrixForRNNLayer:matrixId:parameterType:accumulatorIndex:forLSTMNum:forDeviceNum:forGate:](self, "synchronizeWeightMatrixForRNNLayer:matrixId:parameterType:accumulatorIndex:forLSTMNum:forDeviceNum:forGate:", v51, [v61 unsignedIntegerValue], 1, v56 + 4 + j, v57, v5, j);
              }
              unint64_t v62 = [v51 biases];

              v56 += 8;
              if (v62)
              {
                for (uint64_t k = 0; k != 4; ++k)
                {
                  unint64_t v64 = [&unk_1F3876ED0 objectAtIndexedSubscript:k];
                  -[MLCDeviceGPU synchronizeWeightMatrixForRNNLayer:matrixId:parameterType:accumulatorIndex:forLSTMNum:forDeviceNum:forGate:](self, "synchronizeWeightMatrixForRNNLayer:matrixId:parameterType:accumulatorIndex:forLSTMNum:forDeviceNum:forGate:", v51, [v64 unsignedIntegerValue], 2, v56, v57, v5, k);

                  ++v56;
                }
              }
              ++v57;
            }
            while (v57 != v110);
          }

          id v4 = v111;
          unint64_t v6 = 0x1E6CB4000;
          unint64_t v7 = 0x1E6CB4000;
LABEL_65:
          id v9 = v109;
          unint64_t v11 = v112;
          goto LABEL_24;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v109 = v9;
          id v65 = v9;
          long long v113 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          uint64_t v66 = [v65 exportableState];
          uint64_t v67 = [v66 countByEnumeratingWithState:&v113 objects:v117 count:16];
          if (v67)
          {
            uint64_t v68 = v67;
            uint64_t v69 = *(void *)v114;
            do
            {
              for (uint64_t m = 0; m != v68; ++m)
              {
                if (*(void *)v114 != v69) {
                  objc_enumerationMutation(v66);
                }
                [*(id *)(v7 + 1088) synchronizeResource:*(void *)(*((void *)&v113 + 1) + 8 * m) commandBuffer:v112];
              }
              uint64_t v68 = [v66 countByEnumeratingWithState:&v113 objects:v117 count:16];
            }
            while (v68);
          }

          int64x2_t v71 = [v65 momentumVectors];
          uint64_t v72 = [v71 count];

          if (v72)
          {
            unint64_t v73 = 0;
            do
            {
              int64x2_t v74 = [v65 momentumVectors];
              int64x2_t v75 = [v74 objectAtIndexedSubscript:v73];

              if ([v75 count])
              {
                unint64_t v76 = 0;
                do
                {
                  long long v77 = *(void **)(v7 + 1088);
                  id v78 = [v75 objectAtIndexedSubscript:v76];
                  uint64_t v79 = [v78 data];
                  [v77 synchronizeResource:v79 commandBuffer:v112];

                  unint64_t v7 = 0x1E6CB4000uLL;
                  ++v76;
                }
                while (v76 < [v75 count]);
              }

              ++v73;
              unint64_t v80 = [v65 momentumVectors];
              unint64_t v81 = [v80 count];
            }
            while (v73 < v81);
          }
          int64x2_t v82 = [v65 velocityVectors];
          uint64_t v83 = [v82 count];

          if (v83)
          {
            unint64_t v84 = 0;
            do
            {
              float v85 = [v65 velocityVectors];
              int v86 = [v85 objectAtIndexedSubscript:v84];

              if ([v86 count])
              {
                unint64_t v87 = 0;
                do
                {
                  int v88 = *(void **)(v7 + 1088);
                  int v89 = [v86 objectAtIndexedSubscript:v87];
                  int v90 = [v89 data];
                  [v88 synchronizeResource:v90 commandBuffer:v112];

                  unint64_t v7 = 0x1E6CB4000uLL;
                  ++v87;
                }
                while (v87 < [v86 count]);
              }

              ++v84;
              int v91 = [v65 velocityVectors];
              unint64_t v92 = [v91 count];
            }
            while (v84 < v92);
          }
          uint64_t v93 = [v65 centerWeightVectors];
          uint64_t v94 = [v93 count];

          if (v94)
          {
            unint64_t v95 = 0;
            do
            {
              uint64_t v96 = [v65 centerWeightVectors];
              uint64_t v97 = [v96 objectAtIndexedSubscript:v95];

              if ([v97 count])
              {
                unint64_t v98 = 0;
                do
                {
                  int v99 = *(void **)(v7 + 1088);
                  uint64_t v100 = [v97 objectAtIndexedSubscript:v98];
                  uint64_t v101 = [v100 data];
                  [v99 synchronizeResource:v101 commandBuffer:v112];

                  unint64_t v7 = 0x1E6CB4000;
                  ++v98;
                }
                while (v98 < [v97 count]);
              }

              ++v95;
              id v102 = [v65 centerWeightVectors];
              unint64_t v103 = [v102 count];
            }
            while (v95 < v103);
          }

          id v4 = v111;
          unint64_t v6 = 0x1E6CB4000;
          goto LABEL_65;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_24;
        }
        uint64_t v104 = v9;
        unint64_t v105 = *(void **)(v7 + 1088);
        id v18 = [v4 weights];
        id v19 = [v18 deviceMemory];
        uint64_t v106 = [v19 objectAtIndexedSubscript:v5];
        id v107 = v105;
        id v9 = v104;
        unint64_t v11 = v112;
        [v107 synchronizeResource:v106 commandBuffer:v112];

        goto LABEL_13;
      }
      if (![v9 isMPSGraph]) {
        break;
      }
      unint64_t v12 = *(void **)(v7 + 1088);
      id v13 = [v9 exportableState];
      id v14 = [v13 objectAtIndexedSubscript:0];
      [v12 synchronizeResource:v14 commandBuffer:v11];

      unint64_t v15 = [v9 exportableState];
      unint64_t v16 = [v15 count];

      if (v16 >= 2)
      {
        id v17 = *(void **)(v7 + 1088);
        id v18 = [v9 exportableState];
        id v19 = [v18 objectAtIndexedSubscript:1];
        [v17 synchronizeResource:v19 commandBuffer:v11];
LABEL_13:
      }
LABEL_14:
      [(MLCDeviceGPU *)self synchronizeOptimizerBuffers:v9 commandBuffer:v11];
LABEL_24:

      if (++v5 >= [(MLCDeviceGPU *)self numDevicesToUse]) {
        goto LABEL_68;
      }
    }
    unint64_t v28 = v6;
    unint64_t v29 = v9;
    id v18 = [v9 forwardKernel];
    id v19 = [v18 exportWeightsAndBiasesWithCommandBuffer:v11 resultStateCanBeTemporary:0];
    unint64_t v30 = *(void **)(v7 + 1088);
    [v19 weights];
    v32 = unint64_t v31 = v7;
    [v30 synchronizeResource:v32 commandBuffer:v11];

    int v33 = [v19 biases];

    if (v33)
    {
      unint64_t v34 = *(void **)(v31 + 1088);
      unint64_t v35 = [v19 biases];
      [v34 synchronizeResource:v35 commandBuffer:v11];
    }
    [v29 setExportableState:v19];
    unint64_t v7 = v31;
    id v9 = v29;
    unint64_t v6 = v28;
    id v4 = v111;
    goto LABEL_13;
  }
LABEL_68:
}

- (void)synchronizeOptimizerUpdatesForTensor:(id)a3
{
  id v11 = a3;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      unint64_t v6 = [v5 objectAtIndexedSubscript:v4];

      unint64_t v7 = [v11 deviceMemory];
      unint64_t v8 = [v7 objectAtIndexedSubscript:v4];

      +[MLCGPUHelper synchronizeResource:v8 commandBuffer:v6];
      id v9 = [v11 optimizerDeviceData];
      unint64_t v10 = [v9 objectAtIndexedSubscript:v4];
      [(MLCDeviceGPU *)self synchronizeOptimizerBuffers:v10 commandBuffer:v6];

      ++v4;
    }
    while (v4 < [(MLCDeviceGPU *)self numDevicesToUse]);
  }
}

- (void)copyMTLBuffer:(id)a3 toNSData:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = (void *)[v5 bytes];
  id v8 = v6;
  id v9 = (const void *)[v8 contents];

  size_t v10 = [v5 length];

  memcpy(v7, v9, v10);
}

- (void)copyMTLBuffer:(id)a3 toBytes:(void *)a4 length:(unint64_t)a5
{
  unint64_t v7 = (const void *)[a3 contents];

  memcpy(a4, v7, a5);
}

- (BOOL)checkToConvertTensor:(id)a3 inLayer:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(a3, "childLayers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 isTrainable])
        {
          BOOL v12 = v11 == v5;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (void)convertUpdatesToTensorDataForLayer:(id)a3
{
  *(void *)((char *)&v591[1] + 4) = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(MLCDeviceGPU *)self numDevicesToUse]) {
    goto LABEL_231;
  }
  uint64_t v5 = 0;
  v587 = self;
  v516 = v4;
  do
  {
    id v6 = [v4 deviceOps];
    uint64_t v532 = v5;
    uint64_t v7 = [v6 objectAtIndexedSubscript:v5];

    id v4 = v516;
    objc_opt_class();
    v586 = v7;
    if (objc_opt_isKindOfClass())
    {
      id v8 = v516;
      uint64_t v9 = [v8 weights];
      BOOL v10 = [(MLCDeviceGPU *)self checkToConvertTensor:v9 inLayer:v8];

      id v585 = v8;
      if (!v10)
      {
        unint64_t v84 = v8;
LABEL_96:
        uint64_t v168 = [v84 biases];
        if (v168)
        {
          id v169 = (void *)v168;
          uint64_t v170 = [v585 biases];
          BOOL v171 = [(MLCDeviceGPU *)v587 checkToConvertTensor:v170 inLayer:v585];

          if (v171)
          {
            int v172 = [v586 isMPSGraph];
            uint64_t v173 = [v586 exportableState];
            unint64_t v174 = v173;
            if (v172) {
              [v173 objectAtIndexedSubscript:1];
            }
            else {
            uint64_t v175 = [v173 biases];
            }
            uint64_t v176 = [v585 biases];
            id v177 = [v176 data];
            [(MLCDeviceGPU *)v587 copyMTLBuffer:v175 toNSData:v177];
          }
        }
        uint64_t v7 = v586;
        v582 = [v586 momentumVectors];
        unint64_t v178 = [v586 momentumVectors];
        uint64_t v179 = [v178 count];

        if (v179)
        {
          unint64_t v180 = 0;
          while (v180 != 1)
          {
            if (!v180)
            {
              v572 = [v582 objectAtIndexedSubscript:0];
              float v181 = [v572 data];
              v555 = [v585 weightsParameter];
              v541 = [v555 tensor];
              id v182 = [v541 optimizerData];
              uint64_t v183 = [v182 objectAtIndexedSubscript:0];
              uint64_t v184 = [v183 bytes];
              int v185 = [v585 weightsParameter];
LABEL_108:
              uint64_t v186 = v185;
              uint64_t v187 = [v185 tensor];
              unint64_t v188 = [v187 optimizerData];
              long long v189 = [v188 objectAtIndexedSubscript:0];
              -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v181, v184, [v189 length]);

              uint64_t v7 = v586;
            }
            ++v180;
            uint64_t v190 = [v7 momentumVectors];
            unint64_t v191 = [v190 count];

            if (v180 >= v191) {
              goto LABEL_110;
            }
          }
          v572 = [v582 objectAtIndexedSubscript:1];
          float v181 = [v572 data];
          v555 = [v585 biasesParameter];
          v541 = [v555 tensor];
          id v182 = [v541 optimizerData];
          uint64_t v183 = [v182 objectAtIndexedSubscript:0];
          uint64_t v184 = [v183 bytes];
          int v185 = [v585 biasesParameter];
          goto LABEL_108;
        }
LABEL_110:
        v527 = [v7 velocityVectors];
        uint64_t v192 = [v7 velocityVectors];
        uint64_t v193 = [v192 count];

        if (v193)
        {
          unint64_t v194 = 0;
          while (v194 != 1)
          {
            if (!v194)
            {
              v573 = [v527 objectAtIndexedSubscript:0];
              unint64_t v195 = [v573 data];
              v556 = [v585 weightsParameter];
              v542 = [v556 tensor];
              unint64_t v196 = [v542 optimizerData];
              uint64_t v197 = [v196 objectAtIndexedSubscript:1];
              uint64_t v198 = [v197 bytes];
              uint64_t v199 = [v585 weightsParameter];
LABEL_116:
              uint64_t v200 = v199;
              int64x2_t v201 = [v199 tensor];
              long long v202 = [v201 optimizerData];
              int32x2_t v203 = [v202 objectAtIndexedSubscript:1];
              -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v195, v198, [v203 length]);

              uint64_t v7 = v586;
            }
            ++v194;
            uint64_t v204 = [v7 velocityVectors];
            unint64_t v205 = [v204 count];

            if (v194 >= v205) {
              goto LABEL_118;
            }
          }
          v573 = [v527 objectAtIndexedSubscript:1];
          unint64_t v195 = [v573 data];
          v556 = [v585 biasesParameter];
          v542 = [v556 tensor];
          unint64_t v196 = [v542 optimizerData];
          uint64_t v197 = [v196 objectAtIndexedSubscript:1];
          uint64_t v198 = [v197 bytes];
          uint64_t v199 = [v585 biasesParameter];
          goto LABEL_116;
        }
LABEL_118:
        v523 = [v7 centerWeightVectors];
        unint64_t v206 = [v7 centerWeightVectors];
        uint64_t v207 = [v206 count];

        if (v207)
        {
          unint64_t v208 = 0;
          while (v208 != 1)
          {
            if (!v208)
            {
              v574 = [v523 objectAtIndexedSubscript:0];
              uint64_t v209 = [v574 data];
              v557 = [v585 weightsParameter];
              v543 = [v557 tensor];
              uint64_t v210 = [v543 optimizerData];
              uint64x2_t v211 = [v210 objectAtIndexedSubscript:2];
              uint64_t v212 = [v211 bytes];
              char v213 = [v585 weightsParameter];
LABEL_124:
              unint64_t v214 = v213;
              int32x2_t v215 = [v213 tensor];
              uint64_t v216 = [v215 optimizerData];
              uint64_t v217 = [v216 objectAtIndexedSubscript:2];
              -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v209, v212, [v217 length]);

              uint64_t v7 = v586;
            }
            ++v208;
            uint64_t v218 = [v7 centerWeightVectors];
            unint64_t v219 = [v218 count];

            if (v208 >= v219) {
              goto LABEL_126;
            }
          }
          v574 = [v523 objectAtIndexedSubscript:1];
          uint64_t v209 = [v574 data];
          v557 = [v585 biasesParameter];
          v543 = [v557 tensor];
          uint64_t v210 = [v543 optimizerData];
          uint64x2_t v211 = [v210 objectAtIndexedSubscript:2];
          uint64_t v212 = [v211 bytes];
          char v213 = [v585 biasesParameter];
          goto LABEL_124;
        }
        goto LABEL_126;
      }
      id v11 = [v8 descriptor];
      if ([v11 isConvolutionTranspose])
      {
        BOOL v12 = [v8 weights];
        id v13 = [v12 data];

        if (v13)
        {
          if ([v586 isMPSGraph])
          {
            id v581 = [v586 exportableState];
            id v564 = [v581 objectAtIndexedSubscript:0];
            uint64_t v522 = [v564 contents];
            v547 = [v585 weights];
            id v533 = [v547 data];
            uint64_t v517 = [v533 bytes];
            long long v14 = [v585 descriptor];
            uint64_t v512 = [v14 kernelWidth];
            long long v15 = [v585 descriptor];
            uint64_t v16 = [v15 kernelHeight];
            long long v17 = [v585 descriptor];
            unint64_t v18 = [v17 outputFeatureChannelCount];
            uint64_t v19 = [v585 descriptor];
            unint64_t v20 = v18 / [v19 groupCount];
            id v21 = [v585 descriptor];
            uint64_t v22 = [v21 inputFeatureChannelCount];
            unint64_t v23 = [v585 weights];
            unint64_t v24 = [v23 descriptor];
            LODWORD(v505) = [v24 dataType];
            LOBYTE(v20) = +[MLCDataHelper convertSourceHWOI:v522 toResultOIHW:v517 width:v512 height:v16 inputFeatureChannelCount:v20 outputFeatureChannelCount:v22 dataType:v505];

            if ((v20 & 1) == 0)
            {
              id v25 = +[MLCLog framework];
              self = v587;
              id v4 = v516;
              if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                uint64_t v7 = v586;
LABEL_11:
                int v26 = v25;
                goto LABEL_130;
              }
              [(MLCDeviceGPU(MLCEngineDispatch) *)v590 convertUpdatesToTensorDataForLayer:v25];
              int v26 = v25;
LABEL_228:
              uint64_t v7 = v586;
              goto LABEL_130;
            }
            goto LABEL_95;
          }
          id v157 = [v586 exportableState];
          v158 = [v157 weights];
          id v159 = [v585 weights];
          char v160 = [v159 data];
          id v166 = [v585 weights];
          uint64_t v167 = [v166 descriptor];
          [(MLCDeviceGPU *)v587 rotateAndCopyMTLBuffer:v158 toNSData:v160 withTensorDescriptor:v167];

          goto LABEL_93;
        }
      }
      else
      {
      }
      if ([v586 isMPSGraph])
      {
        id v583 = [v586 exportableState];
        id v571 = [v583 objectAtIndexedSubscript:0];
        uint64_t v514 = [v571 contents];
        v554 = [v585 weights];
        id v540 = [v554 data];
        uint64_t v511 = [v540 bytes];
        v529 = [v585 descriptor];
        uint64_t v510 = [v529 kernelWidth];
        v519 = [v585 descriptor];
        uint64_t v509 = [v519 kernelHeight];
        uint64_t v148 = [v585 descriptor];
        unint64_t v149 = [v148 inputFeatureChannelCount];
        uint64_t v150 = [v585 descriptor];
        unint64_t v151 = [v150 groupCount];
        unint64_t v152 = [v585 descriptor];
        int v153 = [v152 usesDepthwiseConvolution];
        uint64_t v154 = [v585 descriptor];
        unint64_t v155 = [v154 outputFeatureChannelCount];
        if (v153)
        {
          v506 = [v585 descriptor];
          v155 /= (unint64_t)[v506 inputFeatureChannelCount];
          id v156 = v508;
        }
        else
        {
          id v156 = v154;
          uint64_t v154 = v507;
        }
        unint64_t v161 = v149 / v151;
        unint64_t v162 = [v585 weights];
        id v163 = [v162 descriptor];
        LODWORD(v505) = [v163 dataType];
        BOOL v164 = +[MLCDataHelper convertSourceHWIO:v514 toResultOIHW:v511 width:v510 height:v509 inputFeatureChannelCount:v161 outputFeatureChannelCount:v155 dataType:v505];

        uint64_t v165 = v156;
        if (v153)
        {

          uint64_t v165 = v154;
        }

        v508 = v156;
        if (v164)
        {
          v507 = v154;
LABEL_95:
          unint64_t v84 = v585;
          goto LABEL_96;
        }
        id v157 = +[MLCLog framework];
        if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR)) {
          [(MLCDeviceGPU(MLCEngineDispatch) *)v588 convertUpdatesToTensorDataForLayer:v157];
        }
        v507 = v154;
LABEL_94:

        goto LABEL_95;
      }
      id v157 = [v586 exportableState];
      v158 = [v157 weights];
      id v159 = [v585 weights];
      char v160 = [v159 data];
      [(MLCDeviceGPU *)v587 copyMTLBuffer:v158 toNSData:v160];
LABEL_93:

      goto LABEL_94;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = v516;
      unint64_t v28 = [v27 weights];
      BOOL v29 = [(MLCDeviceGPU *)self checkToConvertTensor:v28 inLayer:v27];

      if (v29)
      {
        unint64_t v30 = [v7 exportableState];
        unint64_t v31 = [v30 objectAtIndexedSubscript:0];
        int v32 = [v27 weights];
        int v33 = [v32 data];
        [(MLCDeviceGPU *)v587 copyMTLBuffer:v31 toNSData:v33];
      }
      uint64_t v34 = [v27 biases];
      if (v34)
      {
        unint64_t v35 = (void *)v34;
        BOOL v36 = [v27 biases];
        BOOL v37 = [(MLCDeviceGPU *)v587 checkToConvertTensor:v36 inLayer:v27];

        if (v37)
        {
          uint64_t v38 = [v586 exportableState];
          unint64_t v39 = [v38 objectAtIndexedSubscript:1];
          unint64_t v40 = [v27 biases];
          unint64_t v41 = [v40 data];
          [(MLCDeviceGPU *)v587 copyMTLBuffer:v39 toNSData:v41];
        }
      }
      id v585 = v27;
      uint64_t v7 = v586;
      v582 = [v586 momentumVectors];
      float v42 = [v586 momentumVectors];
      uint64_t v43 = [v42 count];

      if (v43)
      {
        unint64_t v44 = 0;
        while (v44 != 1)
        {
          if (!v44)
          {
            v565 = [v582 objectAtIndexedSubscript:0];
            id v45 = [v565 data];
            v548 = [v585 weightsParameter];
            v534 = [v548 tensor];
            id v46 = [v534 optimizerData];
            id v47 = [v46 objectAtIndexedSubscript:0];
            uint64_t v48 = [v47 bytes];
            unint64_t v49 = [v585 weightsParameter];
LABEL_24:
            unint64_t v50 = v49;
            id v51 = [v49 tensor];
            uint64_t v52 = [v51 optimizerData];
            uint64_t v53 = [v52 objectAtIndexedSubscript:0];
            -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v45, v48, [v53 length]);

            uint64_t v7 = v586;
          }
          ++v44;
          int v54 = [v7 momentumVectors];
          unint64_t v55 = [v54 count];

          if (v44 >= v55) {
            goto LABEL_26;
          }
        }
        v565 = [v582 objectAtIndexedSubscript:1];
        id v45 = [v565 data];
        v548 = [v585 biasesParameter];
        v534 = [v548 tensor];
        id v46 = [v534 optimizerData];
        id v47 = [v46 objectAtIndexedSubscript:0];
        uint64_t v48 = [v47 bytes];
        unint64_t v49 = [v585 biasesParameter];
        goto LABEL_24;
      }
LABEL_26:
      v527 = [v7 velocityVectors];
      uint64_t v56 = [v7 velocityVectors];
      uint64_t v57 = [v56 count];

      if (v57)
      {
        unint64_t v58 = 0;
        while (v58 != 1)
        {
          if (!v58)
          {
            v566 = [v527 objectAtIndexedSubscript:0];
            uint64_t v59 = [v566 data];
            v549 = [v585 weightsParameter];
            v535 = [v549 tensor];
            int v60 = [v535 optimizerData];
            id v61 = [v60 objectAtIndexedSubscript:1];
            uint64_t v62 = [v61 bytes];
            float v63 = [v585 weightsParameter];
LABEL_32:
            unint64_t v64 = v63;
            id v65 = [v63 tensor];
            uint64_t v66 = [v65 optimizerData];
            uint64_t v67 = [v66 objectAtIndexedSubscript:1];
            -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v59, v62, [v67 length]);

            uint64_t v7 = v586;
          }
          ++v58;
          uint64_t v68 = [v7 velocityVectors];
          unint64_t v69 = [v68 count];

          if (v58 >= v69) {
            goto LABEL_34;
          }
        }
        v566 = [v527 objectAtIndexedSubscript:1];
        uint64_t v59 = [v566 data];
        v549 = [v585 biasesParameter];
        v535 = [v549 tensor];
        int v60 = [v535 optimizerData];
        id v61 = [v60 objectAtIndexedSubscript:1];
        uint64_t v62 = [v61 bytes];
        float v63 = [v585 biasesParameter];
        goto LABEL_32;
      }
LABEL_34:
      v523 = [v7 centerWeightVectors];
      int64x2_t v70 = [v7 centerWeightVectors];
      uint64_t v71 = [v70 count];

      if (!v71)
      {
LABEL_126:

        uint64_t v147 = v527;
        goto LABEL_127;
      }
      unint64_t v72 = 0;
      while (v72 != 1)
      {
        if (!v72)
        {
          v567 = [v523 objectAtIndexedSubscript:0];
          unint64_t v73 = [v567 data];
          v550 = [v585 weightsParameter];
          v536 = [v550 tensor];
          int64x2_t v74 = [v536 optimizerData];
          int64x2_t v75 = [v74 objectAtIndexedSubscript:2];
          uint64_t v76 = [v75 bytes];
          long long v77 = [v585 weightsParameter];
LABEL_40:
          id v78 = v77;
          uint64_t v79 = [v77 tensor];
          unint64_t v80 = [v79 optimizerData];
          unint64_t v81 = [v80 objectAtIndexedSubscript:2];
          -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v73, v76, [v81 length]);

          uint64_t v7 = v586;
        }
        ++v72;
        int64x2_t v82 = [v7 centerWeightVectors];
        unint64_t v83 = [v82 count];

        if (v72 >= v83) {
          goto LABEL_126;
        }
      }
      v567 = [v523 objectAtIndexedSubscript:1];
      unint64_t v73 = [v567 data];
      v550 = [v585 biasesParameter];
      v536 = [v550 tensor];
      int64x2_t v74 = [v536 optimizerData];
      int64x2_t v75 = [v74 objectAtIndexedSubscript:2];
      uint64_t v76 = [v75 bytes];
      long long v77 = [v585 biasesParameter];
      goto LABEL_40;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v585 = [v7 exportableState];
      float v85 = v516;
      int v86 = [v85 gamma];
      unint64_t v87 = self;
      BOOL v88 = [(MLCDeviceGPU *)self checkToConvertTensor:v86 inLayer:v85];

      if (v88)
      {
        int v89 = [v585 gamma];
        int v90 = [v85 gamma];
        int v91 = [v90 data];
        [(MLCDeviceGPU *)v87 copyMTLBuffer:v89 toNSData:v91];

        uint64_t v7 = v586;
      }
      unint64_t v92 = [v85 beta];
      v582 = v85;
      BOOL v93 = [(MLCDeviceGPU *)v87 checkToConvertTensor:v92 inLayer:v85];

      if (v93)
      {
        uint64_t v94 = [v585 beta];
        unint64_t v95 = [v85 beta];
        uint64_t v96 = [v95 data];
        [(MLCDeviceGPU *)v587 copyMTLBuffer:v94 toNSData:v96];

        uint64_t v7 = v586;
      }
      uint64_t v97 = [v7 movingState];
      unint64_t v98 = v97;
      if (v97)
      {
        int v99 = [v97 mean];
        uint64_t v100 = [v85 mean];
        uint64_t v101 = [v100 data];
        [(MLCDeviceGPU *)v587 copyMTLBuffer:v99 toNSData:v101];

        id v102 = [v98 variance];
        unint64_t v103 = [v85 variance];
        uint64_t v104 = [v103 data];
        [(MLCDeviceGPU *)v587 copyMTLBuffer:v102 toNSData:v104];

        uint64_t v7 = v586;
      }
      v528 = [v7 momentumVectors];
      unint64_t v105 = [v7 momentumVectors];
      uint64_t v106 = [v105 count];

      v513 = v98;
      if (v106)
      {
        unint64_t v107 = 0;
        while (v107 != 1)
        {
          if (!v107)
          {
            v568 = [v528 objectAtIndexedSubscript:0];
            uint64_t v108 = [v568 data];
            v551 = [v582 betaParameter];
            v537 = [v551 tensor];
            uint64_t v109 = [v537 optimizerData];
            uint64_t v110 = [v109 objectAtIndexedSubscript:0];
            uint64_t v111 = [v110 bytes];
            uint64_t v112 = [v582 betaParameter];
LABEL_60:
            long long v113 = v112;
            long long v114 = [v112 tensor];
            long long v115 = [v114 optimizerData];
            long long v116 = [v115 objectAtIndexedSubscript:0];
            -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v108, v111, [v116 length]);

            uint64_t v7 = v586;
          }
          ++v107;
          id v117 = [v7 momentumVectors];
          unint64_t v118 = [v117 count];

          if (v107 >= v118) {
            goto LABEL_62;
          }
        }
        v568 = [v528 objectAtIndexedSubscript:1];
        uint64_t v108 = [v568 data];
        v551 = [v582 gammaParameter];
        v537 = [v551 tensor];
        uint64_t v109 = [v537 optimizerData];
        uint64_t v110 = [v109 objectAtIndexedSubscript:0];
        uint64_t v111 = [v110 bytes];
        uint64_t v112 = [v582 gammaParameter];
        goto LABEL_60;
      }
LABEL_62:
      v524 = [v7 velocityVectors];
      id v119 = [v7 velocityVectors];
      uint64_t v120 = [v119 count];

      if (v120)
      {
        unint64_t v121 = 0;
        while (v121 != 1)
        {
          if (!v121)
          {
            v569 = [v524 objectAtIndexedSubscript:0];
            id v122 = [v569 data];
            v552 = [v582 betaParameter];
            v538 = [v552 tensor];
            uint64_t v123 = [v538 optimizerData];
            unint64_t v124 = [v123 objectAtIndexedSubscript:1];
            uint64_t v125 = [v124 bytes];
            uint64_t v126 = [v582 betaParameter];
LABEL_68:
            id v127 = v126;
            int v128 = [v126 tensor];
            id v129 = [v128 optimizerData];
            uint64_t v130 = [v129 objectAtIndexedSubscript:1];
            -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v122, v125, [v130 length]);

            uint64_t v7 = v586;
          }
          ++v121;
          unint64_t v131 = [v7 velocityVectors];
          unint64_t v132 = [v131 count];

          if (v121 >= v132) {
            goto LABEL_70;
          }
        }
        v569 = [v524 objectAtIndexedSubscript:1];
        id v122 = [v569 data];
        v552 = [v582 gammaParameter];
        v538 = [v552 tensor];
        uint64_t v123 = [v538 optimizerData];
        unint64_t v124 = [v123 objectAtIndexedSubscript:1];
        uint64_t v125 = [v124 bytes];
        uint64_t v126 = [v582 gammaParameter];
        goto LABEL_68;
      }
LABEL_70:
      v518 = [v7 centerWeightVectors];
      uint64_t v133 = [v7 centerWeightVectors];
      uint64_t v134 = [v133 count];

      if (!v134)
      {
LABEL_78:

        uint64_t v147 = v513;
LABEL_127:

LABEL_128:
        self = v587;
        id v4 = v516;
        goto LABEL_129;
      }
      unint64_t v135 = 0;
      while (v135 != 1)
      {
        if (!v135)
        {
          v570 = [v518 objectAtIndexedSubscript:0];
          uint64_t v136 = [v570 data];
          v553 = [v582 betaParameter];
          v539 = [v553 tensor];
          uint64_t v137 = [v539 optimizerData];
          uint64_t v138 = [v137 objectAtIndexedSubscript:2];
          uint64_t v139 = [v138 bytes];
          uint64_t v140 = [v582 betaParameter];
LABEL_76:
          uint64_t v141 = v140;
          id v142 = [v140 tensor];
          uint64_t v143 = [v142 optimizerData];
          id v144 = [v143 objectAtIndexedSubscript:2];
          -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v136, v139, [v144 length]);

          uint64_t v7 = v586;
        }
        ++v135;
        uint64_t v145 = [v7 centerWeightVectors];
        unint64_t v146 = [v145 count];

        if (v135 >= v146) {
          goto LABEL_78;
        }
      }
      v570 = [v518 objectAtIndexedSubscript:1];
      uint64_t v136 = [v570 data];
      v553 = [v582 gammaParameter];
      v539 = [v553 tensor];
      uint64_t v137 = [v539 optimizerData];
      uint64_t v138 = [v137 objectAtIndexedSubscript:2];
      uint64_t v139 = [v138 bytes];
      uint64_t v140 = [v582 gammaParameter];
      goto LABEL_76;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v220 = v516;
      uint64_t v221 = [v220 weights];
      id v585 = v220;
      BOOL v222 = [(MLCDeviceGPU *)self checkToConvertTensor:v221 inLayer:v220];

      if (v222)
      {
        uint64_t v223 = [v220 weights];
        uint64_t v224 = [v223 deviceMemory];
        uint64_t v225 = [v224 objectAtIndexedSubscript:v532];
        uint64_t v226 = [v220 weights];
        uint64_t v227 = [v226 data];
        [(MLCDeviceGPU *)v587 copyMTLBuffer:v225 toNSData:v227];

        uint64_t v7 = v586;
      }
      uint64_t v228 = [v7 momentumVectors];
      uint64_t v229 = v228;
      if (v228)
      {
        id v584 = [v228 objectAtIndexedSubscript:0];
        uint64_t v230 = [v584 data];
        v575 = [v585 weightsParameter];
        id v231 = [v575 tensor];
        uint64_t v232 = [v231 optimizerData];
        uint64_t v233 = [v232 objectAtIndexedSubscript:0];
        uint64_t v234 = [v233 bytes];
        uint64x2_t v235 = [v585 weightsParameter];
        uint64_t v236 = [v235 tensor];
        uint64_t v237 = [v236 optimizerData];
        uint64_t v238 = [v237 objectAtIndexedSubscript:0];
        -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v230, v234, [v238 length]);

        uint64_t v7 = v586;
      }
      v582 = v229;
      int64x2_t v239 = [v7 velocityVectors];
      uint64_t v240 = v239;
      v576 = v239;
      if (v239)
      {
        v558 = [v239 objectAtIndexedSubscript:0];
        int32x2_t v241 = [v558 data];
        uint64_t v242 = [v585 weightsParameter];
        uint64_t v243 = [v242 tensor];
        int64x2_t v244 = [v243 optimizerData];
        int32x2_t v245 = [v244 objectAtIndexedSubscript:1];
        uint64_t v246 = [v245 bytes];
        int64x2_t v247 = [v585 weightsParameter];
        int32x2_t v248 = [v247 tensor];
        id v249 = [v248 optimizerData];
        uint64_t v250 = [v249 objectAtIndexedSubscript:1];
        -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v241, v246, [v250 length]);

        uint64_t v7 = v586;
        uint64_t v240 = v576;
      }
      int64x2_t v251 = [v7 centerWeightVectors];
      int32x2_t v252 = v251;
      if (v251)
      {
        v559 = [v251 objectAtIndexedSubscript:0];
        uint64_t v253 = [v559 data];
        v544 = [v585 weightsParameter];
        id v254 = [v544 tensor];
        int64x2_t v255 = [v254 optimizerData];
        int32x2_t v256 = [v255 objectAtIndexedSubscript:2];
        uint64_t v257 = [v256 bytes];
        id v258 = [v585 weightsParameter];
        uint64_t v259 = [v258 tensor];
        uint64_t v260 = [v259 optimizerData];
        uint64_t v261 = [v260 objectAtIndexedSubscript:2];
        -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v253, v257, [v261 length]);

        uint64_t v7 = v586;
        uint64_t v240 = v576;
      }
      goto LABEL_128;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v262 = v516;
      v263 = v7;
      id v585 = v262;
      int v264 = [v262 descriptor];
      uint64_t v265 = [v264 layerCount];

      v582 = v263;
      uint64_t v515 = v265 << [v263 isBidirectional];
      if (v515)
      {
        uint64_t v530 = 0;
        uint64_t v266 = 0;
        do
        {
          unint64_t v267 = 0;
          uint64_t v520 = v266;
          uint64_t v525 = 4 * v266;
          do
          {
            unint64_t v268 = v267 & 3 | v525;
            unint64_t v269 = [v582 rnnExportedWeightMatrices];
            id v270 = [v269 objectAtIndexedSubscript:v530 + v267];

            v560 = v270;
            unint64_t v577 = v267;
            if (v267 < 4)
            {
              uint64_t v275 = [v585 inputWeights];
              uint64_t v276 = [v275 objectAtIndexedSubscript:v268];

              uint64_t v277 = [v270 data];
              v545 = v276;
              uint64_t v278 = [v276 data];
              [(MLCDeviceGPU *)v587 copyMTLBuffer:v277 toNSData:v278];

              [v585 inputWeightsParameters];
            }
            else
            {
              uint64_t v271 = [v585 hiddenWeights];
              id v272 = [v271 objectAtIndexedSubscript:v268];

              unint64_t v273 = [v270 data];
              v545 = v272;
              v274 = [v272 data];
              [(MLCDeviceGPU *)v587 copyMTLBuffer:v273 toNSData:v274];

              [v585 hiddenWeightsParameters];
            uint64_t v279 = };
            id v280 = [v279 objectAtIndexedSubscript:v268];

            unint64_t v281 = [v280 tensor];
            id v282 = [v281 optimizerData];
            uint64_t v283 = [v282 count];

            if (v283)
            {
              id v284 = [v280 tensor];
              id v285 = [v284 optimizerDeviceData];
              char v286 = [v285 objectAtIndexedSubscript:v532];
              id v287 = [v286 momentumVectors];
              v288 = [v287 objectAtIndexedSubscript:0];

              id v289 = [v288 data];
              v290 = [v280 tensor];
              uint64_t v291 = [v290 optimizerData];
              id v292 = [v291 objectAtIndexedSubscript:0];
              uint64_t v293 = [v292 bytes];
              v294 = [v280 tensor];
              v295 = [v294 optimizerData];
              uint64_t v296 = [v295 objectAtIndexedSubscript:0];
              -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v289, v293, [v296 length]);
            }
            uint64_t v297 = [v280 tensor];
            long long v298 = [v297 optimizerData];
            unint64_t v299 = [v298 count];

            if (v299 >= 2)
            {
              uint64_t v300 = [v280 tensor];
              id v301 = [v300 optimizerDeviceData];
              uint64_t v302 = [v301 objectAtIndexedSubscript:v532];
              id v303 = [v302 velocityVectors];
              uint64_t v304 = [v303 objectAtIndexedSubscript:0];

              unint64_t v305 = [v304 data];
              uint64_t v306 = [v280 tensor];
              id v307 = [v306 optimizerData];
              v308 = [v307 objectAtIndexedSubscript:1];
              uint64_t v309 = [v308 bytes];
              uint64_t v310 = [v280 tensor];
              id v311 = [v310 optimizerData];
              char v312 = [v311 objectAtIndexedSubscript:1];
              -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v305, v309, [v312 length]);
            }
            unint64_t v313 = [v280 tensor];
            id v314 = [v313 optimizerData];
            unint64_t v315 = [v314 count];

            if (v315 >= 3)
            {
              id v316 = [v280 tensor];
              id v317 = [v316 optimizerDeviceData];
              id v318 = [v317 objectAtIndexedSubscript:v532];
              id v319 = [v318 centerWeightVectors];
              uint64_t v320 = [v319 objectAtIndexedSubscript:0];

              uint64_t v321 = [v320 data];
              id v322 = [v280 tensor];
              uint64_t v323 = [v322 optimizerData];
              id v324 = [v323 objectAtIndexedSubscript:2];
              uint64_t v325 = [v324 bytes];
              uint64_t v326 = [v280 tensor];
              id v327 = [v326 optimizerData];
              id v328 = [v327 objectAtIndexedSubscript:2];
              -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v321, v325, [v328 length]);
            }
            unint64_t v267 = v577 + 1;
          }
          while (v577 != 7);
          uint64_t v266 = v520 + 1;
          v530 += 8;
        }
        while (v520 + 1 != v515);
      }
      uint64_t v329 = [v585 biases];

      self = v587;
      if (v329)
      {
        int v26 = v582;
        if (v515)
        {
          uint64_t v526 = 0;
          uint64_t v330 = 0;
          do
          {
            uint64_t v521 = v330;
            uint64_t v331 = 0;
            do
            {
              uint64_t v578 = v331;
              uint64_t v332 = v526 + v331;
              uint64_t v333 = [v26 rnnExportedBiasTerms];
              id v334 = [v333 objectAtIndexedSubscript:v332];

              id v335 = [v585 biases];
              id v336 = [v335 objectAtIndexedSubscript:v332];

              v561 = v334;
              uint64_t v337 = [v334 data];
              v546 = v336;
              unint64_t v338 = [v336 data];
              [(MLCDeviceGPU *)v587 copyMTLBuffer:v337 toNSData:v338];

              uint64_t v339 = [v585 biasesParameters];
              v340 = [v339 objectAtIndexedSubscript:v332];

              uint64_t v341 = [v340 tensor];
              uint64_t v342 = [v341 optimizerData];
              uint64_t v343 = [v342 count];

              if (v343)
              {
                id v344 = [v340 tensor];
                unint64_t v345 = [v344 optimizerDeviceData];
                unint64_t v346 = [v345 objectAtIndexedSubscript:v532];
                id v347 = [v346 momentumVectors];
                v531 = [v347 objectAtIndexedSubscript:0];

                uint64_t v348 = [v531 data];
                id v349 = [v340 tensor];
                uint64_t v350 = [v349 optimizerData];
                uint64_t v351 = [v350 objectAtIndexedSubscript:0];
                uint64_t v352 = [v351 bytes];
                uint64_t v353 = [v340 tensor];
                v354 = [v353 optimizerData];
                id v355 = [v354 objectAtIndexedSubscript:0];
                -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v348, v352, [v355 length]);
              }
              uint64_t v356 = [v340 tensor];
              unint64_t v357 = [v356 optimizerData];
              unint64_t v358 = [v357 count];

              if (v358 >= 2)
              {
                uint64_t v359 = [v340 tensor];
                int v360 = [v359 optimizerDeviceData];
                uint64_t v361 = [v360 objectAtIndexedSubscript:v532];
                id v362 = [v361 velocityVectors];
                long long v363 = [v362 objectAtIndexedSubscript:0];

                id v364 = [v363 data];
                id v365 = [v340 tensor];
                v366 = [v365 optimizerData];
                id v367 = [v366 objectAtIndexedSubscript:1];
                uint64_t v368 = [v367 bytes];
                id v369 = [v340 tensor];
                int64x2_t v370 = [v369 optimizerData];
                unint64_t v371 = [v370 objectAtIndexedSubscript:1];
                -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v364, v368, [v371 length]);
              }
              long long v372 = [v340 tensor];
              id v373 = [v372 optimizerData];
              unint64_t v374 = [v373 count];

              if (v374 >= 3)
              {
                uint64_t v375 = [v340 tensor];
                uint64_t v376 = [v375 optimizerDeviceData];
                uint64_t v377 = [v376 objectAtIndexedSubscript:v532];
                uint64_t v378 = [v377 centerWeightVectors];
                unint64_t v379 = [v378 objectAtIndexedSubscript:0];

                int v380 = [v379 data];
                id v381 = [v340 tensor];
                id v382 = [v381 optimizerData];
                id v383 = [v382 objectAtIndexedSubscript:2];
                uint64_t v384 = [v383 bytes];
                id v385 = [v340 tensor];
                id v386 = [v385 optimizerData];
                uint64_t v387 = [v386 objectAtIndexedSubscript:2];
                -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v380, v384, [v387 length]);
              }
              int v26 = v582;
              uint64_t v331 = v578 + 1;
            }
            while (v578 != 3);
            uint64_t v330 = v521 + 1;
            v526 += 4;
          }
          while (v521 + 1 != v515);
          self = v587;
        }
        id v4 = v516;
        goto LABEL_228;
      }
      id v4 = v516;
      uint64_t v7 = v586;
LABEL_129:
      int v26 = v582;
      goto LABEL_130;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_131;
    }
    id v585 = v516;
    v582 = v7;
    for (uint64_t i = 0; i != 4; ++i)
    {
      long long v389 = [v585 weights];
      id v390 = [v389 objectAtIndexedSubscript:i];
      SEL v391 = [v390 descriptor];
      uint64_t v392 = [v391 tensorAllocationSizeInBytes];

      uint64_t v393 = [v582 exportableState];
      uint64_t v394 = [v393 objectAtIndexedSubscript:i];
      int v395 = [v585 weights];
      id v396 = [v395 objectAtIndexedSubscript:i];
      id v397 = [v396 data];
      uint64_t v562 = v392;
      -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v394, [v397 bytes], v392);

      uint64_t v398 = [v585 biases];
      if (!v398)
      {
        uint64_t v579 = 1;
        uint64_t v7 = v586;
        uint64_t v403 = v392;
        goto LABEL_181;
      }
      v399 = (void *)v398;
      int v400 = [v585 biases];
      if ((unint64_t)[v400 count] < 4)
      {
        uint64_t v579 = 1;
        uint64_t v7 = v586;
        uint64_t v403 = v392;
        goto LABEL_180;
      }
      v401 = [v585 biases];
      uint64_t v402 = [v401 objectAtIndexedSubscript:i];

      uint64_t v403 = v392;
      if (v402)
      {
        unint64_t v404 = [v585 biases];
        uint64_t v405 = [v404 objectAtIndexedSubscript:i];
        uint64_t v406 = [v405 descriptor];
        uint64_t v407 = [v406 tensorAllocationSizeInBytes];

        v399 = [v582 exportableState];
        int v400 = [v399 objectAtIndexedSubscript:i + 4];
        id v408 = [v585 biases];
        id v409 = [v408 objectAtIndexedSubscript:i];
        id v410 = [v409 data];
        uint64_t v579 = v407;
        -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v400, [v410 bytes], v407);

        uint64_t v7 = v586;
LABEL_180:

        goto LABEL_181;
      }
      uint64_t v579 = 1;
      uint64_t v7 = v586;
LABEL_181:
      id v411 = [v582 momentumVectors];
      v412 = [v411 objectAtIndexedSubscript:i];

      if ([v412 count])
      {
        uint64_t v413 = 0;
        while (v413 != 1)
        {
          if (!v413)
          {
            uint64_t v414 = [v412 objectAtIndexedSubscript:0];
            unint64_t v415 = [v414 data];
            uint64_t v416 = [v585 weights];
            id v417 = [v416 objectAtIndexedSubscript:i];
            v418 = [v417 optimizerData];
            uint64_t v419 = [v418 objectAtIndexedSubscript:0];
            uint64_t v420 = [v419 bytes];
            id v421 = v587;
            unint64_t v422 = v415;
            uint64_t v423 = v403;
LABEL_187:
            [(MLCDeviceGPU *)v421 copyMTLBuffer:v422 toBytes:v420 length:v423];

            uint64_t v7 = v586;
          }
          if (++v413 >= (unint64_t)[v412 count]) {
            goto LABEL_189;
          }
        }
        uint64_t v414 = [v412 objectAtIndexedSubscript:1];
        unint64_t v415 = [v414 data];
        uint64_t v416 = [v585 biases];
        id v417 = [v416 objectAtIndexedSubscript:i];
        v418 = [v417 optimizerData];
        uint64_t v419 = [v418 objectAtIndexedSubscript:0];
        uint64_t v420 = [v419 bytes];
        id v421 = v587;
        unint64_t v422 = v415;
        uint64_t v423 = v579;
        goto LABEL_187;
      }
LABEL_189:
      id v424 = v582;
      uint64_t v425 = [v582 velocityVectors];
      if (v425)
      {
        v426 = (void *)v425;
        id v427 = [v582 velocityVectors];
        unint64_t v428 = [v427 count];

        BOOL v429 = v428 >= 4;
        uint64_t v7 = v586;
        if (v429)
        {
          id v430 = [v582 velocityVectors];
          v431 = [v430 objectAtIndexedSubscript:i];

          if (![v431 count])
          {
LABEL_200:

            id v424 = v582;
            goto LABEL_201;
          }
          uint64_t v432 = 0;
          while (2)
          {
            if (v432 == 1)
            {
              uint64_t v433 = [v431 objectAtIndexedSubscript:1];
              uint64_t v434 = [v433 data];
              id v435 = [v585 biases];
              id v436 = [v435 objectAtIndexedSubscript:i];
              v437 = [v436 optimizerData];
              v438 = [v437 objectAtIndexedSubscript:1];
              uint64_t v439 = [v438 bytes];
              v440 = v587;
              v441 = v434;
              uint64_t v442 = v579;
LABEL_198:
              [(MLCDeviceGPU *)v440 copyMTLBuffer:v441 toBytes:v439 length:v442];

              uint64_t v7 = v586;
            }
            else if (!v432)
            {
              uint64_t v433 = [v431 objectAtIndexedSubscript:0];
              uint64_t v434 = [v433 data];
              id v435 = [v585 weights];
              id v436 = [v435 objectAtIndexedSubscript:i];
              v437 = [v436 optimizerData];
              v438 = [v437 objectAtIndexedSubscript:1];
              uint64_t v439 = [v438 bytes];
              v440 = v587;
              v441 = v434;
              uint64_t v442 = v562;
              goto LABEL_198;
            }
            if (++v432 >= (unint64_t)[v431 count]) {
              goto LABEL_200;
            }
            continue;
          }
        }
      }
LABEL_201:
      uint64_t v443 = [v424 centerWeightVectors];
      if (v443)
      {
        v444 = (void *)v443;
        v445 = [v582 centerWeightVectors];
        unint64_t v446 = [v445 count];

        BOOL v429 = v446 >= 4;
        uint64_t v7 = v586;
        if (v429)
        {
          v447 = [v582 centerWeightVectors];
          v448 = [v447 objectAtIndexedSubscript:i];

          if (![v448 count])
          {
LABEL_212:

            goto LABEL_213;
          }
          uint64_t v449 = 0;
          while (2)
          {
            if (v449 == 1)
            {
              v450 = [v448 objectAtIndexedSubscript:1];
              v451 = [v450 data];
              v452 = [v585 biases];
              v453 = [v452 objectAtIndexedSubscript:i];
              v454 = [v453 optimizerData];
              v455 = [v454 objectAtIndexedSubscript:2];
              uint64_t v456 = [v455 bytes];
              v457 = v587;
              v458 = v451;
              uint64_t v459 = v579;
LABEL_210:
              [(MLCDeviceGPU *)v457 copyMTLBuffer:v458 toBytes:v456 length:v459];

              uint64_t v7 = v586;
            }
            else if (!v449)
            {
              v450 = [v448 objectAtIndexedSubscript:0];
              v451 = [v450 data];
              v452 = [v585 weights];
              v453 = [v452 objectAtIndexedSubscript:i];
              v454 = [v453 optimizerData];
              v455 = [v454 objectAtIndexedSubscript:2];
              uint64_t v456 = [v455 bytes];
              v457 = v587;
              v458 = v451;
              uint64_t v459 = v562;
              goto LABEL_210;
            }
            if (++v449 >= (unint64_t)[v448 count]) {
              goto LABEL_212;
            }
            continue;
          }
        }
      }
LABEL_213:
    }
    id v25 = v582;
    v460 = [v582 mhaAttentionBiasTensors];
    uint64_t v461 = [v460 count];

    if (!v461)
    {
      self = v587;
      id v4 = v516;
      goto LABEL_11;
    }
    v462 = [v582 mhaAttentionBiasTensors];
    uint64_t v463 = [v462 count];

    if (!v463) {
      goto LABEL_128;
    }
    unint64_t v464 = 0;
    do
    {
      v465 = [v582 mhaAttentionBiasTensors];
      v466 = [v465 objectAtIndexedSubscript:v464];
      v467 = [(MLCDeviceGPU *)v587 readTensor:v466 fromDeviceIndex:0];

      v468 = [v585 biasesParameters];
      LODWORD(v466) = (unint64_t)[v468 count] > 3;

      v469 = [v585 biasesParameters];
      unint64_t v470 = v464 + 4 * v466;
      v471 = [v469 objectAtIndexedSubscript:v470];
      v472 = [v471 tensor];

      v473 = [v472 descriptor];
      size_t v474 = [v473 tensorAllocationSizeInBytes];

      id v475 = [v472 data];
      v476 = (void *)[v475 bytes];
      id v580 = v467;
      memcpy(v476, (const void *)[v580 bytes], v474);

      v477 = [v582 momentumVectors];
      v478 = [v477 objectAtIndexedSubscript:v470];

      v563 = v478;
      v479 = [v478 objectAtIndexedSubscript:0];
      v480 = [v479 data];
      v481 = [v472 optimizerData];
      v482 = [v481 objectAtIndexedSubscript:0];
      -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v480, [v482 bytes], v474);

      uint64_t v483 = [v582 velocityVectors];
      if (v483)
      {
        v484 = (void *)v483;
        v485 = [v582 velocityVectors];
        uint64_t v486 = [v485 count];

        if (v486)
        {
          v487 = [v582 velocityVectors];
          v488 = [v487 objectAtIndexedSubscript:v470];

          v489 = [v488 objectAtIndexedSubscript:0];
          v490 = [v489 data];
          v491 = [v472 optimizerData];
          v492 = [v491 objectAtIndexedSubscript:1];
          -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v490, [v492 bytes], v474);
        }
      }
      uint64_t v493 = [v582 centerWeightVectors];
      if (v493)
      {
        v494 = (void *)v493;
        v495 = [v582 centerWeightVectors];
        uint64_t v496 = [v495 count];

        if (v496)
        {
          v497 = [v582 centerWeightVectors];
          v498 = [v497 objectAtIndexedSubscript:v470];

          v499 = [v498 objectAtIndexedSubscript:0];
          v500 = [v499 data];
          v501 = [v472 optimizerData];
          v502 = [v501 objectAtIndexedSubscript:2];
          -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v587, "copyMTLBuffer:toBytes:length:", v500, [v502 bytes], v474);
        }
      }

      ++v464;
      v503 = [v582 mhaAttentionBiasTensors];
      unint64_t v504 = [v503 count];
    }
    while (v464 < v504);
    uint64_t v7 = v586;
    self = v587;
    id v4 = v516;
    int v26 = v582;
LABEL_130:

LABEL_131:
    uint64_t v5 = v532 + 1;
  }
  while (v532 + 1 < [(MLCDeviceGPU *)self numDevicesToUse]);
LABEL_231:
}

- (void)convertUpdatesToTensorDataForTensorParameters:(id)a3
{
  id v43 = a3;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v4 = 0;
    float v42 = self;
    do
    {
      uint64_t v5 = [v43 descriptor];
      id v6 = [v5 shape];
      uint64_t v7 = [v6 objectAtIndexedSubscript:0];
      uint64_t v8 = objc_msgSend(v43, "calculateBatchSizeToUse:", objc_msgSend(v7, "unsignedIntegerValue"));

      id v9 = [v43 data];
      -[MLCDeviceGPU readTensor:fromDeviceIndex:targetBuffer:batchSize:](self, "readTensor:fromDeviceIndex:targetBuffer:batchSize:", v43, v4, [v9 bytes], v8);

      BOOL v10 = [v43 optimizerDeviceData];
      uint64_t v40 = v4;
      id v11 = [v10 objectAtIndexedSubscript:v4];

      unint64_t v41 = v11;
      BOOL v12 = [v11 momentumVectors];
      if ([v12 count])
      {
        unint64_t v13 = 0;
        do
        {
          long long v14 = [v12 objectAtIndexedSubscript:v13];
          long long v15 = [v14 data];
          uint64_t v16 = [v43 optimizerData];
          long long v17 = [v16 objectAtIndexedSubscript:0];
          uint64_t v18 = [v17 bytes];
          uint64_t v19 = [v43 optimizerData];
          unint64_t v20 = [v19 objectAtIndexedSubscript:0];
          -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](self, "copyMTLBuffer:toBytes:length:", v15, v18, [v20 length]);

          ++v13;
        }
        while (v13 < [v12 count]);
      }
      unint64_t v39 = v12;
      id v21 = [v41 velocityVectors];
      if ([v21 count])
      {
        unint64_t v22 = 0;
        do
        {
          unint64_t v23 = [v21 objectAtIndexedSubscript:v22];
          unint64_t v24 = [v23 data];
          id v25 = [v43 optimizerData];
          int v26 = [v25 objectAtIndexedSubscript:1];
          uint64_t v27 = [v26 bytes];
          unint64_t v28 = [v43 optimizerData];
          BOOL v29 = [v28 objectAtIndexedSubscript:1];
          -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](self, "copyMTLBuffer:toBytes:length:", v24, v27, [v29 length]);

          ++v22;
        }
        while (v22 < [v21 count]);
      }
      unint64_t v30 = [v41 centerWeightVectors];
      if ([v30 count])
      {
        unint64_t v31 = 0;
        do
        {
          int v32 = [v30 objectAtIndexedSubscript:v31];
          int v33 = [v32 data];
          uint64_t v34 = [v43 optimizerData];
          unint64_t v35 = [v34 objectAtIndexedSubscript:2];
          uint64_t v36 = [v35 bytes];
          BOOL v37 = [v43 optimizerData];
          uint64_t v38 = [v37 objectAtIndexedSubscript:2];
          -[MLCDeviceGPU copyMTLBuffer:toBytes:length:](v42, "copyMTLBuffer:toBytes:length:", v33, v36, [v38 length]);

          ++v31;
        }
        while (v31 < [v30 count]);
      }

      uint64_t v4 = v40 + 1;
      self = v42;
    }
    while (v40 + 1 < [(MLCDeviceGPU *)v42 numDevicesToUse]);
  }
}

- (void)setOptimizerLearningRate:(id)a3 learningRate:(float)a4
{
  id v8 = a3;
  if ([v8 count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [v8 objectAtIndexedSubscript:v5];
      *(float *)&double v7 = a4;
      [v6 setLearningRate:v7];

      ++v5;
    }
    while (v5 < [v8 count]);
  }
}

- (void)setOptimizerTimeStep:(id)a3 timeStep:(unint64_t)a4
{
  id v7 = a3;
  if ([v7 count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [v7 objectAtIndexedSubscript:v5];
      [v6 setTimeStep:a4];

      ++v5;
    }
    while (v5 < [v7 count]);
  }
}

- (void)updateMultiheadAttentionLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v89 = a4;
  id v86 = a5;
  id v94 = a6;
  id v88 = a7;
  unint64_t context = (void *)MEMORY[0x1E01B11E0]();
  unint64_t v83 = v12;
  unint64_t v13 = [v12 objectAtIndexedSubscript:0];
  int v14 = [v13 mhaHasAttnBias];
  uint64_t v15 = 4;
  if (v14) {
    uint64_t v15 = 6;
  }
  uint64_t v93 = v15;

  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v16 = 0;
    int v90 = self;
    do
    {
      long long v17 = [v83 objectAtIndexedSubscript:v16];
      uint64_t v97 = v17;
      if ([(MLCDeviceGPU *)self numDevicesToUse] == 2)
      {
        uint64_t v18 = [v17 mhaMultiGPUChildOps];
        int v19 = [v18 multiGPUReduction];

        if (v19 == 1)
        {
          unint64_t v20 = v17;
          uint64_t v21 = v16;
          unint64_t v22 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          long long v103 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          unint64_t v23 = [v20 gradientState];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v103 objects:v109 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v104;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v104 != v26) {
                  objc_enumerationMutation(v23);
                }
                unint64_t v28 = [*(id *)(*((void *)&v103 + 1) + 8 * i) data];
                [v22 addObject:v28];
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v103 objects:v109 count:16];
            }
            while (v25);
          }

          BOOL v29 = [v83 objectAtIndexedSubscript:0];
          unint64_t v30 = [v29 mhaMultiGPUChildOps];
          v108[0] = v30;
          unint64_t v31 = [v83 objectAtIndexedSubscript:1];
          int v32 = [v31 mhaMultiGPUChildOps];
          v108[1] = v32;
          int v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:2];
          uint64_t v34 = (void *)[v22 copy];
          self = v90;
          [(MLCDeviceGPU *)v90 allReduceOverXGMI:v33 deviceIndex:v21 stateBuffers:v34];

          uint64_t v16 = v21;
          long long v17 = v97;
        }
      }
      unint64_t v35 = [v83 objectAtIndexedSubscript:v16];
      int v36 = [v35 mhaHasBias];

      BOOL v37 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      uint64_t v92 = v16;
      int v91 = [v37 objectAtIndexedSubscript:v16];

      unint64_t v38 = 0;
      if (v36) {
        uint64_t v39 = 0;
      }
      else {
        uint64_t v39 = -4;
      }
      uint64_t v40 = 4;
      if (!v36) {
        uint64_t v40 = 0;
      }
      uint64_t v84 = v40;
      uint64_t v85 = v39;
      if (v94) {
        int v41 = v36;
      }
      else {
        int v41 = 0;
      }
      int v87 = v41;
      do
      {
        float v42 = [v17 momentumVectors];
        id v43 = [v42 objectAtIndexedSubscript:v38];
        unint64_t v44 = [v17 velocityVectors];
        uint64_t v45 = [v44 count];
        if (v45)
        {
          uint64_t v96 = [v17 velocityVectors];
          id v46 = [v96 objectAtIndexedSubscript:v38];
          unint64_t v95 = v46;
        }
        else
        {
          id v46 = 0;
        }
        id v47 = [v17 centerWeightVectors];
        if ([v47 count])
        {
          uint64_t v48 = [v17 centerWeightVectors];
          unint64_t v49 = [v48 objectAtIndexedSubscript:v38];
          unint64_t v98 = deviceParameterWithVectors(v43, v46, v49);
        }
        else
        {
          unint64_t v98 = deviceParameterWithVectors(v43, v46, 0);
        }

        if (v45)
        {
        }
        long long v17 = v97;
        if (v38 > 3)
        {
          if (v94)
          {
            unint64_t v73 = [v94 objectAtIndexedSubscript:v85 + v38];
            int v74 = [v73 isUpdatable];

            if (v74)
            {
              uint64_t v75 = [v89 objectAtIndexedSubscript:v92];
              float v63 = [v97 exportableState];
              unint64_t v64 = [v63 objectAtIndexedSubscript:v84 + v38];
              id v65 = [v97 gradientState];
              uint64_t v66 = [v65 objectAtIndexedSubscript:v84 + v38];
              unint64_t v69 = [v66 data];
              int64x2_t v70 = [v97 exportableState];
              uint64_t v71 = (void *)v75;
              unint64_t v72 = [v70 objectAtIndexedSubscript:v84 + v38];
              [(MLCDeviceGPU *)v90 updateWithOptimizer:v71 arrayOfParams:v88 commandBuffer:v91 deviceParameter:v98 source:v64 gradient:v69 result:v72 momentumIndex:0];
              goto LABEL_41;
            }
          }
        }
        else
        {
          unint64_t v50 = [v86 objectAtIndexedSubscript:v38];
          int v51 = [v50 isUpdatable];

          if (v51)
          {
            uint64_t v52 = [v89 objectAtIndexedSubscript:v92];
            uint64_t v53 = [v97 exportableState];
            int v54 = [v53 objectAtIndexedSubscript:v38];
            unint64_t v55 = [v97 gradientState];
            uint64_t v56 = [v55 objectAtIndexedSubscript:v38];
            uint64_t v57 = [v56 data];
            unint64_t v58 = [v97 exportableState];
            uint64_t v59 = [v58 objectAtIndexedSubscript:v38];
            [(MLCDeviceGPU *)v90 updateWithOptimizer:v52 arrayOfParams:v88 commandBuffer:v91 deviceParameter:v98 source:v54 gradient:v57 result:v59 momentumIndex:0];

            long long v17 = v97;
          }
          if (v87)
          {
            int v60 = [v94 objectAtIndexedSubscript:v38];
            int v61 = [v60 isUpdatable];

            if (v61)
            {
              uint64_t v62 = [v89 objectAtIndexedSubscript:v92];
              float v63 = [v17 exportableState];
              unint64_t v64 = [v63 objectAtIndexedSubscript:v38 + 4];
              id v65 = [v17 gradientState];
              uint64_t v66 = [v65 objectAtIndexedSubscript:v38 + 4];
              uint64_t v67 = [v66 data];
              uint64_t v68 = v17;
              unint64_t v69 = (void *)v67;
              int64x2_t v70 = [v68 exportableState];
              uint64_t v71 = (void *)v62;
              unint64_t v72 = [v70 objectAtIndexedSubscript:v38 + 4];
              [(MLCDeviceGPU *)v90 updateWithOptimizer:v71 arrayOfParams:v88 commandBuffer:v91 deviceParameter:v98 source:v64 gradient:v69 result:v72 momentumIndex:1];
LABEL_41:

              long long v17 = v97;
            }
          }
        }

        ++v38;
      }
      while (v93 != v38);
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      uint64_t v76 = [v17 gradientState];
      uint64_t v77 = [v76 countByEnumeratingWithState:&v99 objects:v107 count:16];
      if (v77)
      {
        uint64_t v78 = v77;
        uint64_t v79 = *(void *)v100;
        do
        {
          for (uint64_t j = 0; j != v78; ++j)
          {
            if (*(void *)v100 != v79) {
              objc_enumerationMutation(v76);
            }
            unint64_t v81 = *(void **)(*((void *)&v99 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v81 readCount]) {
              [v81 setReadCount:0];
            }
          }
          uint64_t v78 = [v76 countByEnumeratingWithState:&v99 objects:v107 count:16];
        }
        while (v78);
      }

      uint64_t v16 = v92 + 1;
      self = v90;
    }
    while (v92 + 1 < [(MLCDeviceGPU *)v90 numDevicesToUse]);
  }
}

- (void)reloadLSTMParameters:(id)a3 rnnGPUDeviceOps:(id)a4 mlcParameterIndex:(unint64_t)a5 tensor:(id)a6 isInputWeight:(BOOL)a7 isHiddenWeight:(BOOL)a8 isBias:(BOOL)a9 deviceNumber:(unint64_t)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  id v83 = a3;
  id v16 = a4;
  id v17 = a6;
  uint64_t v84 = [v16 gradientKernel];
  unint64_t v18 = [v16 numLayers];
  if (v18 < 2) {
    goto LABEL_5;
  }
  unint64_t v19 = v18;
  int v20 = [v16 isBidirectional];
  unint64_t v21 = a5 >> 2;
  if (!v20) {
    goto LABEL_6;
  }
  if ([v16 isBidirectional]) {
    unint64_t v21 = (a5 - 4 * v19) >> 2;
  }
  else {
LABEL_5:
  }
    unint64_t v21 = 0;
LABEL_6:
  unint64_t v77 = v21;
  unint64_t v81 = a5 >> 2;
  unint64_t context = a5 & 3;
  unint64_t v22 = [v17 deviceMemory];
  unint64_t v80 = self;
  int64x2_t v82 = v16;
  if ([v22 count])
  {
    unint64_t v23 = [v17 deviceMemory];
    uint64_t v24 = [v23 objectAtIndexedSubscript:a10];
    char v25 = [v24 conformsToProtocol:&unk_1F38930A0];

    if (v25)
    {
      uint64_t v26 = [v17 deviceMemory];
      unint64_t v27 = a10;
      unint64_t v28 = [v26 objectAtIndexedSubscript:a10];

      id v29 = v28;
      unint64_t v30 = (void *)[v29 contents];
      id v31 = [v17 data];
      int v32 = (const void *)[v31 bytes];
      int v33 = [v17 data];
      memcpy(v30, v32, [v33 length]);

      uint64_t v34 = [v17 descriptor];
      uint64_t v35 = [v34 tensorAllocationSizeInBytes];

      +[MLCGPUHelper didModifyRange:buffer:](MLCGPUHelper, "didModifyRange:buffer:", 0, v35, v29);
      if (!v11) {
        goto LABEL_9;
      }
LABEL_18:
      uint64_t v67 = (void *)qword_1E6CB4F40[context];
      uint64_t v68 = [v83 descriptor];
      uint64_t v69 = [v68 hiddenSize];

      int64x2_t v70 = [v83 descriptor];
      uint64_t v71 = v70;
      if (v77) {
        uint64_t v72 = [v70 hiddenSize];
      }
      else {
        uint64_t v72 = [v70 inputSize];
      }
      uint64_t v73 = v72;

      float v42 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v69 columns:v73 rowBytes:4 * v73 dataType:268435488];
      id v43 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v29 descriptor:v42];
      contexta = (void *)MEMORY[0x1E01B11E0]();
      int v74 = [(MLCDeviceGPU *)v80 gpuCommandQueueList];
      uint64_t v75 = [v74 objectAtIndexedSubscript:v27];
      id v46 = [v75 commandBuffer];

      id v47 = [v84 objectAtIndexedSubscript:v81];
      uint64_t v48 = v82;
      unint64_t v49 = [v82 rnnTrainableWeights];
      unint64_t v50 = [v49 objectAtIndexedSubscript:v81];
      uint64_t v51 = [v67 unsignedIntegerValue];
      memset(v87, 0, sizeof(v87));
      uint64_t v52 = v87;
      goto LABEL_22;
    }
  }
  else
  {
  }
  BOOL v76 = v11;
  BOOL v53 = v10;
  int v54 = [(MLCDeviceGPU *)self deviceList];
  unint64_t v55 = [v54 objectAtIndexedSubscript:a10];
  id v56 = [v17 data];
  uint64_t v57 = [v56 bytes];
  unint64_t v58 = [v17 data];
  id v29 = (id)objc_msgSend(v55, "newBufferWithBytes:length:options:", v57, objc_msgSend(v58, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

  uint64_t v59 = [v17 deviceMemory];
  uint64_t v60 = [v59 count];

  int v61 = [v17 deviceMemory];
  uint64_t v62 = v61;
  unint64_t v27 = a10;
  if (v60) {
    [v61 setObject:v29 atIndexedSubscript:a10];
  }
  else {
    [v61 addObject:v29];
  }

  BOOL v10 = v53;
  if (v76) {
    goto LABEL_18;
  }
LABEL_9:
  unint64_t v36 = v27;
  if (v10)
  {
    BOOL v37 = (void *)qword_1E6CB4F60[context];
    unint64_t v38 = [v83 descriptor];
    uint64_t v39 = [v38 hiddenSize];

    uint64_t v40 = [v83 descriptor];
    uint64_t v41 = [v40 hiddenSize];

    float v42 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v39 columns:v41 rowBytes:4 * v41 dataType:268435488];
    id v43 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v29 descriptor:v42];
    contexta = (void *)MEMORY[0x1E01B11E0]();
    unint64_t v44 = [(MLCDeviceGPU *)v80 gpuCommandQueueList];
    uint64_t v45 = [v44 objectAtIndexedSubscript:v27];
    id v46 = [v45 commandBuffer];

    id v47 = [v84 objectAtIndexedSubscript:v81];
    uint64_t v48 = v82;
    unint64_t v49 = [v82 rnnTrainableWeights];
    unint64_t v50 = [v49 objectAtIndexedSubscript:v81];
    uint64_t v51 = [v37 unsignedIntegerValue];
    memset(v86, 0, sizeof(v86));
    uint64_t v52 = v86;
LABEL_22:
    [v47 encodeCopyWeightsToCommandBuffer:v46 weights:v50 matrixId:v51 matrix:v43 copyFromWeightsToMatrix:0 matrixOffset:v52];

    [v46 commit];
    [v46 waitUntilCompleted];

    goto LABEL_23;
  }
  uint64_t v48 = v82;
  if (a9)
  {
    float v63 = (void *)qword_1E6CB4F80[context];
    uint64_t v64 = [v82 hiddenSize];
    float v42 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:1 columns:v64 rowBytes:4 * v64 dataType:268435488];
    id v43 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v29 descriptor:v42];
    contexta = (void *)MEMORY[0x1E01B11E0]();
    id v65 = [(MLCDeviceGPU *)v80 gpuCommandQueueList];
    uint64_t v66 = [v65 objectAtIndexedSubscript:v36];
    id v46 = [v66 commandBuffer];

    id v47 = [v84 objectAtIndexedSubscript:v81];
    unint64_t v49 = [v82 rnnTrainableWeights];
    unint64_t v50 = [v49 objectAtIndexedSubscript:v81];
    uint64_t v51 = [v63 unsignedIntegerValue];
    memset(v85, 0, sizeof(v85));
    uint64_t v52 = v85;
    goto LABEL_22;
  }
LABEL_23:
}

- (void)reloadParameterDataFromHostToDeviceMemoryForTensor:(id)a3
{
  *(void *)((char *)&v161[1] + 4) = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 childLayers];
  id v6 = [v5 objectAtIndexedSubscript:0];

  id v159 = self;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = [v6 deviceOps];
      id v9 = [v8 objectAtIndexedSubscript:v7];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        unint64_t v19 = [v4 descriptor];
        uint64_t v20 = [v19 tensorAllocationSizeInBytes];

        unint64_t v21 = [v4 deviceMemory];
        unint64_t v22 = [v21 objectAtIndexedSubscript:v7];

        id v13 = v22;
        unint64_t v23 = (void *)[v13 contents];
        id v24 = [v4 data];
        char v25 = (const void *)[v24 bytes];
        uint64_t v26 = [v4 data];
        memcpy(v23, v25, [v26 length]);

        uint64_t v27 = v20;
LABEL_32:
        +[MLCGPUHelper didModifyRange:buffer:](MLCGPUHelper, "didModifyRange:buffer:", 0, v27, v13);
        goto LABEL_33;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v6;
        id v60 = v9;
        int v61 = [v13 inputWeights];
        uint64_t v62 = [v61 count];

        if (v62)
        {
          unint64_t v63 = 0;
          while (1)
          {
            uint64_t v64 = [v13 inputWeights];
            id v65 = [v64 objectAtIndexedSubscript:v63];

            if (v65 == v4) {
              break;
            }
            ++v63;
            uint64_t v66 = [v13 inputWeights];
            unint64_t v67 = [v66 count];

            if (v63 >= v67) {
              goto LABEL_41;
            }
          }
          BOOL v156 = 0;
          uint64_t v75 = 1;
        }
        else
        {
LABEL_41:
          uint64_t v68 = [v13 hiddenWeights];
          uint64_t v69 = [v68 count];

          if (v69)
          {
            unint64_t v63 = 0;
            while (1)
            {
              int64x2_t v70 = [v13 hiddenWeights];
              id v71 = [v70 objectAtIndexedSubscript:v63];

              BOOL v81 = v71 == v4;
              BOOL v72 = v71 == v4;
              if (v81) {
                break;
              }
              ++v63;
              uint64_t v73 = [v13 hiddenWeights];
              unint64_t v74 = [v73 count];

              if (v63 >= v74)
              {
                BOOL v156 = v72;
                uint64_t v75 = 0;
                unint64_t v63 = 0;
                goto LABEL_63;
              }
            }
            BOOL v156 = v72;
            uint64_t v75 = 0;
          }
          else
          {
            uint64_t v75 = 0;
            unint64_t v63 = 0;
            BOOL v156 = 0;
          }
        }
LABEL_63:
        id v86 = [v13 biases];

        BOOL v87 = 0;
        if (v86 && (v75 & 1) == 0 && !v156)
        {
          id v153 = v60;
          id v88 = [v13 biases];
          uint64_t v89 = [v88 count];

          if (v89)
          {
            unsigned int v149 = v75;
            unint64_t v90 = 0;
            while (1)
            {
              int v91 = [v13 biases];
              id v92 = [v91 objectAtIndexedSubscript:v90];

              BOOL v87 = v92 == v4;
              if (v92 == v4) {
                break;
              }
              ++v90;
              uint64_t v93 = [v13 biases];
              unint64_t v94 = [v93 count];

              if (v90 >= v94) {
                goto LABEL_74;
              }
            }
            unint64_t v63 = v90;
LABEL_74:
            id v60 = v153;
            uint64_t v75 = v149;
          }
          else
          {
            BOOL v87 = 0;
            id v60 = v153;
          }
        }
        LOBYTE(v129) = v87;
        [(MLCDeviceGPU *)v159 reloadLSTMParameters:v13 rnnGPUDeviceOps:v60 mlcParameterIndex:v63 tensor:v4 isInputWeight:v75 isHiddenWeight:v156 isBias:v129 deviceNumber:v7];

        goto LABEL_33;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_34;
      }
      id v13 = v6;
      BOOL v76 = [v13 weights];
      uint64_t v77 = [v76 count];

      if (v77)
      {
        unint64_t v78 = 0;
        while (1)
        {
          uint64_t v79 = [v13 weights];
          id v80 = [v79 objectAtIndexedSubscript:v78];

          if (v80 == v4 && v78 <= 2) {
            break;
          }
          BOOL v81 = v80 == v4 && v78 == 3;
          int v82 = v81;

          if (v82 != 1)
          {
            ++v78;
            id v83 = [v13 weights];
            unint64_t v84 = [v83 count];

            if (v78 < v84) {
              continue;
            }
          }
          int v85 = 0;
          goto LABEL_77;
        }

        int v82 = 0;
        int v85 = 1;
      }
      else
      {
        int v85 = 0;
        int v82 = 0;
      }
LABEL_77:
      unint64_t v95 = [v13 descriptor];
      int v96 = [v95 hasBiases];

      if (v96)
      {
        uint64_t v97 = [v13 biases];
        uint64_t v98 = [v97 count];

        if (v98)
        {
          unint64_t v99 = 0;
          while (1)
          {
            long long v100 = [v13 biases];
            id v101 = [v100 objectAtIndexedSubscript:v99];

            if (v101 == v4 && v99 <= 2)
            {

              int v85 = 1;
              goto LABEL_88;
            }

            if (v101 == v4 && v99 == 3) {
              break;
            }
            ++v99;
            long long v102 = [v13 biases];
            unint64_t v103 = [v102 count];

            if (v99 >= v103) {
              goto LABEL_88;
            }
          }
          int v82 = 1;
        }
      }
LABEL_88:
      long long v104 = [v13 descriptor];
      int v105 = [v104 hasAttentionBiases];

      if (v105)
      {
        int v150 = v85;
        int v154 = v82;
        long long v106 = [v13 attentionBiases];
        uint64_t v107 = [v106 count];

        if (v107)
        {
          unint64_t v108 = 0;
          int v109 = 0;
          char v110 = 0;
          do
          {
            uint64_t v111 = [v13 attentionBiases];
            id v112 = [v111 objectAtIndexedSubscript:v108];

            BOOL v113 = v112 == v4;
            BOOL v114 = v108 == 0;
            BOOL v115 = v108 == 1;
            BOOL v116 = v113 && v115;
            if (v113 && v115) {
              int v117 = 1;
            }
            else {
              int v117 = v109;
            }
            BOOL v157 = v113 && v114;
            if (v113 && v114) {
              char v110 = 1;
            }
            else {
              int v109 = v117;
            }

            if (v157) {
              break;
            }
            if (v116) {
              break;
            }
            ++v108;
            unint64_t v118 = [v13 attentionBiases];
            unint64_t v119 = [v118 count];
          }
          while (v108 < v119);
        }
        else
        {
          char v110 = 0;
          LOBYTE(v109) = 0;
        }
        char v120 = v110;
        int v121 = v109 & 1;
        int v82 = v154;
        int v85 = v150;
      }
      else
      {
        char v120 = 0;
        int v121 = 0;
      }
      if (((v85 | v82) & 1) != 0 || (v120 & 1) != 0 || v121)
      {
        id v122 = [v4 descriptor];
        uint64_t v158 = [v122 tensorAllocationSizeInBytes];

        uint64_t v123 = [v4 deviceMemory];
        unint64_t v124 = [v123 objectAtIndexedSubscript:v7];

        id v28 = v124;
        uint64_t v125 = (void *)[v28 contents];
        id v126 = [v4 data];
        id v127 = (const void *)[v126 bytes];
        int v128 = [v4 data];
        memcpy(v125, v127, [v128 length]);

        +[MLCGPUHelper didModifyRange:buffer:](MLCGPUHelper, "didModifyRange:buffer:", 0, v158, v28);
LABEL_18:
      }
LABEL_33:

LABEL_34:
      if (++v7 >= [(MLCDeviceGPU *)v159 numDevicesToUse]) {
        goto LABEL_108;
      }
    }
    if ([v9 isMPSGraph])
    {
      BOOL v10 = [v4 descriptor];
      uint64_t v11 = [v10 tensorAllocationSizeInBytes];

      id v12 = [v4 deviceMemory];
      id v13 = [v12 objectAtIndexedSubscript:v7];

      id v14 = [v6 weights];

      if (v14 != v4)
      {
        uint64_t v15 = (void *)[v13 contents];
        id v16 = [v4 data];
        id v17 = (const void *)[v16 bytes];
        unint64_t v18 = [v4 data];
        memcpy(v15, v17, [v18 length]);

        goto LABEL_30;
      }
      float v42 = [v6 descriptor];
      int v43 = [v42 isConvolutionTranspose];

      uint64_t v155 = v11;
      if (v43)
      {
        id v151 = [v4 data];
        uint64_t v144 = [v151 bytes];
        uint64_t v141 = [v13 contents];
        unint64_t v146 = [v6 descriptor];
        uint64_t v139 = [v146 kernelWidth];
        uint64_t v143 = [v6 descriptor];
        uint64_t v137 = [v143 kernelHeight];
        unint64_t v44 = [v6 descriptor];
        uint64_t v135 = [v44 inputFeatureChannelCount];
        uint64_t v45 = [v6 descriptor];
        unint64_t v46 = [v45 outputFeatureChannelCount];
        id v47 = [v6 descriptor];
        unint64_t v48 = v46 / [v47 groupCount];
        unint64_t v49 = [v4 descriptor];
        LODWORD(v129) = [v49 dataType];
        LOBYTE(v48) = +[MLCDataHelper convertSourceOIHW:v144 toResultHWOI:v141 width:v139 height:v137 inputFeatureChannelCount:v135 outputFeatureChannelCount:v48 dataType:v129];

        uint64_t v11 = v155;
        if (v48) {
          goto LABEL_31;
        }
      }
      else
      {
        unint64_t v50 = [v6 descriptor];
        int v51 = [v50 usesDepthwiseConvolution];

        id v152 = [v4 data];
        uint64_t v140 = [v152 bytes];
        uint64_t v138 = [v13 contents];
        uint64_t v147 = [v6 descriptor];
        uint64_t v134 = [v147 kernelWidth];
        uint64_t v145 = [v6 descriptor];
        uint64_t v133 = [v145 kernelHeight];
        id v142 = [v6 descriptor];
        unint64_t v52 = [v142 inputFeatureChannelCount];
        uint64_t v136 = [v6 descriptor];
        unint64_t v53 = [v136 groupCount];
        int v54 = [v6 descriptor];
        unint64_t v55 = [v54 outputFeatureChannelCount];
        int v148 = v51;
        if (v51)
        {
          unint64_t v131 = [v6 descriptor];
          uint64_t v130 = v54;
          v55 /= (unint64_t)[v131 inputFeatureChannelCount];
          id v56 = v132;
        }
        else
        {
          id v56 = v54;
        }
        uint64_t v57 = [v4 descriptor];
        LODWORD(v129) = [v57 dataType];
        BOOL v58 = +[MLCDataHelper convertSourceOIHW:v140 toResultHWIO:v138 width:v134 height:v133 inputFeatureChannelCount:v52 / v53 outputFeatureChannelCount:v55 dataType:v129];

        uint64_t v59 = v56;
        if (v148)
        {

          uint64_t v59 = v130;
        }
        unint64_t v132 = v56;

        uint64_t v11 = v155;
        if (v58) {
          goto LABEL_31;
        }
      }
      id v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        [(MLCDeviceGPU(MLCEngineDispatch) *)v160 reloadParameterDataFromHostToDeviceMemoryForTensor:v16];
      }
LABEL_30:

LABEL_31:
      uint64_t v27 = v11;
      goto LABEL_32;
    }
    id v13 = [v9 forwardKernel];
    id v28 = [v9 gradientKernel];
    id v29 = [v6 descriptor];
    int v30 = [v29 isConvolutionTranspose];

    if (v30)
    {
      id v31 = [v6 weights];

      if (v31 == v4)
      {
        int v32 = [v4 descriptor];
        int v33 = malloc_type_malloc([v32 tensorAllocationSizeInBytes], 0xDAAF2094uLL);

        uint64_t v34 = (void *)MEMORY[0x1E4F1C9B8];
        uint64_t v35 = [v4 descriptor];
        unint64_t v36 = objc_msgSend(v34, "dataWithBytesNoCopy:length:freeWhenDone:", v33, objc_msgSend(v35, "tensorAllocationSizeInBytes"), 1);

        BOOL v37 = [v4 descriptor];
        unint64_t v38 = [v37 shape];
        uint64_t v39 = [v4 data];
        rotateWeightsTensorBy180Degree(v38, v39, v36);

        uint64_t v40 = [v13 dataSource];
        uint64_t v41 = [v40 weight];
        [v41 setData:v36];
      }
    }
    [v13 reloadWeightsAndBiasesFromDataSource];
    [v28 reloadWeightsAndBiasesFromDataSource];
    goto LABEL_18;
  }
LABEL_108:
}

- (void)restoreRNNParamsWithDeviceOps:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8
{
  v84[2] = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  id v75 = a5;
  id v74 = a6;
  id v67 = a7;
  if ([(MLCDeviceGPU *)self numDevicesToUse])
  {
    uint64_t v12 = 0;
    uint64_t v77 = self;
    do
    {
      id v13 = [v64 objectAtIndexedSubscript:v12];
      uint64_t v79 = v13;
      uint64_t v80 = v12;
      if ([(MLCDeviceGPU *)self numDevicesToUse] == 2)
      {
        id v14 = [v13 lstmMultiGPUChildOps];
        int v15 = [v14 multiGPUReduction];

        if (v15 == 1)
        {
          id v16 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          id v17 = [v13 rnnTrainableWeightGradients];
          if ([v17 count])
          {
            unint64_t v18 = 0;
            do
            {
              unint64_t v19 = [v17 objectAtIndexedSubscript:v18];
              if ([v19 count])
              {
                unint64_t v20 = 0;
                do
                {
                  unint64_t v21 = [v19 objectAtIndexedSubscript:v20];
                  unint64_t v22 = [v21 data];
                  [v16 addObject:v22];

                  ++v20;
                }
                while (v20 < [v19 count]);
              }

              ++v18;
            }
            while (v18 < [v17 count]);
          }
          int v82 = [v64 objectAtIndexedSubscript:0];
          unint64_t v23 = [v82 lstmMultiGPUChildOps];
          v84[0] = v23;
          id v24 = [v64 objectAtIndexedSubscript:1];
          char v25 = [v24 lstmMultiGPUChildOps];
          v84[1] = v25;
          uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
          uint64_t v27 = (void *)[v26 copy];
          id v28 = (void *)[v16 copy];
          self = v77;
          uint64_t v12 = v80;
          [(MLCDeviceGPU *)v77 allReduceOverXGMI:v27 deviceIndex:v80 stateBuffers:v28];

          id v13 = v79;
        }
      }
      id v29 = [(MLCDeviceGPU *)self gpuCommandBufferList];
      unint64_t v78 = [v29 objectAtIndexedSubscript:v12];

      id v65 = [v13 gradientKernel];
      uint64_t v30 = [v65 count];
      id v31 = [v75 objectAtIndexedSubscript:0];
      int v32 = [v31 tensor];
      int v33 = [v32 optimizerData];
      uint64_t v76 = [v33 count];

      uint64_t v66 = v30;
      if (v30)
      {
        uint64_t v34 = 0;
        do
        {
          unint64_t v35 = 4 * v34;
          if (4 * v34 != -4)
          {
            uint64_t v83 = 0;
            unint64_t v36 = v35 + 4;
            unint64_t v81 = v35 + 4;
            do
            {
              BOOL v37 = [v75 objectAtIndexedSubscript:v35];
              char v38 = [v37 isUpdatable];

              if ((v38 & 1) == 0)
              {
                id v71 = [v79 auxiliaryWeightsMemory];
                uint64_t v68 = [v71 objectAtIndexedSubscript:v34];
                uint64_t v39 = [v79 auxiliaryMomentumMemory];
                uint64_t v40 = [v39 objectAtIndexedSubscript:v34];
                uint64_t v41 = [v79 auxiliaryVelocityMemory];
                float v42 = [v41 objectAtIndexedSubscript:v34];
                int v43 = [v79 auxiliaryCenterWeightMemory];
                unint64_t v44 = [v43 objectAtIndexedSubscript:v34];
                LODWORD(v63) = 256;
                -[MLCDeviceGPU saveOrRestoreTempMatrixDisableUpdates:commandBuffer:auxiliaryWeightsMemory:auxiliaryMomentumMemory:auxiliaryVelocityMemory:auxiliaryCenterWeightMemory:deviceNumber:kernelNumber:mlcIndex:auxIndex:numOptimizerData:saveToAux:isInputWeight:isHiddenWeight:isBias:](v77, "saveOrRestoreTempMatrixDisableUpdates:commandBuffer:auxiliaryWeightsMemory:auxiliaryMomentumMemory:auxiliaryVelocityMemory:auxiliaryCenterWeightMemory:deviceNumber:kernelNumber:mlcIndex:auxIndex:numOptimizerData:saveToAux:isInputWeight:isHiddenWeight:isBias:", v79, v78, v68, v40, v42, v44, v80, v34, v35, v83, v76, v63);

                ++v83;
                unint64_t v36 = v81;
              }
              ++v35;
            }
            while (v35 < v36);
            unint64_t v45 = 4 * v34;
            do
            {
              unint64_t v46 = [v74 objectAtIndexedSubscript:v45];
              char v47 = [v46 isUpdatable];

              if ((v47 & 1) == 0)
              {
                BOOL v72 = [v79 auxiliaryWeightsMemory];
                uint64_t v69 = [v72 objectAtIndexedSubscript:v34];
                unint64_t v48 = [v79 auxiliaryMomentumMemory];
                unint64_t v49 = [v48 objectAtIndexedSubscript:v34];
                unint64_t v50 = [v79 auxiliaryVelocityMemory];
                int v51 = [v50 objectAtIndexedSubscript:v34];
                unint64_t v52 = [v79 auxiliaryCenterWeightMemory];
                unint64_t v53 = [v52 objectAtIndexedSubscript:v34];
                LODWORD(v63) = 0x10000;
                -[MLCDeviceGPU saveOrRestoreTempMatrixDisableUpdates:commandBuffer:auxiliaryWeightsMemory:auxiliaryMomentumMemory:auxiliaryVelocityMemory:auxiliaryCenterWeightMemory:deviceNumber:kernelNumber:mlcIndex:auxIndex:numOptimizerData:saveToAux:isInputWeight:isHiddenWeight:isBias:](v77, "saveOrRestoreTempMatrixDisableUpdates:commandBuffer:auxiliaryWeightsMemory:auxiliaryMomentumMemory:auxiliaryVelocityMemory:auxiliaryCenterWeightMemory:deviceNumber:kernelNumber:mlcIndex:auxIndex:numOptimizerData:saveToAux:isInputWeight:isHiddenWeight:isBias:", v79, v78, v69, v49, v51, v53, v80, v34, v45, v83, v76, v63);

                ++v83;
                unint64_t v36 = v81;
              }
              ++v45;
            }
            while (v45 < v36);
            unint64_t v54 = 4 * v34;
            if (v67)
            {
              do
              {
                unint64_t v55 = [v67 objectAtIndexedSubscript:v54];
                char v56 = [v55 isUpdatable];

                if ((v56 & 1) == 0)
                {
                  uint64_t v73 = [v79 auxiliaryWeightsMemory];
                  int64x2_t v70 = [v73 objectAtIndexedSubscript:v34];
                  uint64_t v57 = [v79 auxiliaryMomentumMemory];
                  BOOL v58 = [v57 objectAtIndexedSubscript:v34];
                  uint64_t v59 = [v79 auxiliaryVelocityMemory];
                  id v60 = [v59 objectAtIndexedSubscript:v34];
                  int v61 = [v79 auxiliaryCenterWeightMemory];
                  uint64_t v62 = [v61 objectAtIndexedSubscript:v34];
                  LODWORD(v63) = 0x1000000;
                  -[MLCDeviceGPU saveOrRestoreTempMatrixDisableUpdates:commandBuffer:auxiliaryWeightsMemory:auxiliaryMomentumMemory:auxiliaryVelocityMemory:auxiliaryCenterWeightMemory:deviceNumber:kernelNumber:mlcIndex:auxIndex:numOptimizerData:saveToAux:isInputWeight:isHiddenWeight:isBias:](v77, "saveOrRestoreTempMatrixDisableUpdates:commandBuffer:auxiliaryWeightsMemory:auxiliaryMomentumMemory:auxiliaryVelocityMemory:auxiliaryCenterWeightMemory:deviceNumber:kernelNumber:mlcIndex:auxIndex:numOptimizerData:saveToAux:isInputWeight:isHiddenWeight:isBias:", v79, v78, v70, v58, v60, v62, v80, v34, v54, v83, v76, v63);

                  ++v83;
                  unint64_t v36 = v81;
                }
                ++v54;
              }
              while (v54 < v36);
            }
          }
          ++v34;
        }
        while (v34 != v66);
      }

      uint64_t v12 = v80 + 1;
      self = v77;
    }
    while (v80 + 1 < [(MLCDeviceGPU *)v77 numDevicesToUse]);
  }
}

- (void)initWithType:(const char *)a1 selectsMultipleComputeDevices:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: No devices avilable", v4, v5, v6, v7, v8);
}

- (void)initWithDeviceList:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_DEBUG, "Number of devices used = %lu", v3, 0xCu);
}

- (void)initWithDeviceList:(const char *)a1 .cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Device not supported", v4, v5, v6, v7, v8);
}

void __55__MLCDeviceGPU_commitWithProfiling_graphExecutionTime___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = NSStringFromSelector(*(SEL *)(a1 + 56));
  uint64_t v3 = [*(id *)(a1 + 32) gpuCommandQueueList];
  uint64_t v4 = [v3 objectAtIndexedSubscript:*(void *)(a1 + 64)];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1DD0C9000, v5, v6, "%@: Internal Error: CommandBuffer failure: gpuCommandQueueList[%lu]=%@", v7, v8, v9, v10, v11);
}

void __97__MLCDeviceGPU_commitWithCompletionHandler_enableProfiling_graphExecutionTime_graphResultTensor___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = NSStringFromSelector(*(SEL *)(a1 + 80));
  uint64_t v3 = [*(id *)(a1 + 32) gpuCommandQueueList];
  uint64_t v4 = [v3 objectAtIndexedSubscript:*(void *)(a1 + 88)];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1DD0C9000, v5, v6, "%@: Internal Error: CommandBuffer failure: gpuCommandQueueList[%lu]=%@", v7, v8, v9, v10, v11);
}

- (void)deallocateDeviceMemoryForTensor:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Unimplemented", v4, v5, v6, v7, v8);
}

- (void)multiDeviceTensorReduction:(const char *)a1 sourceBuffer:targetBuffer:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Unsupported data type.", v4, v5, v6, v7, v8);
}

- (void)readTensor:(const char *)a1 targetBuffer:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Reading tensor to a nil buffer", v4, v5, v6, v7, v8);
}

- (void)broadcastTensor:(const char *)a1 batchSize:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: tensor deviceMemory cannot be other than MTLBuffer", v4, v5, v6, v7, v8);
}

- (void)allReduceOverXGMI:(const char *)a1 deviceIndex:(void *)a2 stateBuffers:(NSObject *)a3 .cold.1(const char *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 numDevicesToUse];
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: allReduceOverXGMI attempted while using %lu GPUs", (uint8_t *)&v6, 0x16u);
}

@end