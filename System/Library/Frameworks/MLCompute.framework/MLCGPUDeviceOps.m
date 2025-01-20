@interface MLCGPUDeviceOps
+ (id)deviceOps;
+ (id)deviceOpsWithForwardKernel:(id)a3;
+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4;
+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5;
+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5 forwardStatistics:(id)a6 gradientStatistics:(id)a7;
- (BOOL)computeWeightsAndBiasOnly;
- (BOOL)countIncludesPadding;
- (BOOL)isMPSGraph;
- (BOOL)isMPSKernel;
- (BOOL)recomputeResultTensor;
- (BOOL)useSourceGradientDeviceMemoryForResultGradientTensor;
- (BOOL)useSourceGradientDeviceMemoryForSecondaryResultGradientTensor;
- (MLCActivationDescriptor)neuronDescriptor;
- (MLCGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4;
- (MLCGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5 forwardStatistics:(id)a6 gradientStatistics:(id)a7;
- (NSArray)begin;
- (NSArray)centerWeightVectors;
- (NSArray)end;
- (NSArray)momentumVectors;
- (NSArray)source0Shape;
- (NSArray)source1Shape;
- (NSArray)source2Shape;
- (NSArray)stride;
- (NSArray)velocityVectors;
- (NSMutableArray)transposeGradientShape;
- (NSMutableArray)transposeShape;
- (_MLCGPULayer)layer;
- (float)gramMatrixScale;
- (id)combinedForwardAndGradientLossKernel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)exportableState;
- (id)forwardKernel;
- (id)forwardStatisticsKernel;
- (id)gradientKernel;
- (id)gradientState;
- (id)gradientStatisticsKernel;
- (id)lossInitialGradientKernel;
- (id)movingState;
- (id)poolingIndicesBuffer;
- (id)reduceLossKernel;
- (id)secondaryGradientKernel;
- (int)arithmeticOp;
- (int)biasesDataType;
- (int)constantArithmeticSourcesFlags;
- (int)metalKernelType;
- (int)scatterReduceType;
- (int)weightsDataType;
- (unint64_t)dilationRateInX;
- (unint64_t)dilationRateInY;
- (unint64_t)kernelSizeInX;
- (unint64_t)kernelSizeInY;
- (unint64_t)paddingBottom;
- (unint64_t)paddingLeft;
- (unint64_t)paddingRight;
- (unint64_t)paddingTop;
- (unint64_t)scatterGatherDimension;
- (unint64_t)softmaxAxis;
- (unint64_t)strideInX;
- (unint64_t)strideInY;
- (unint64_t)temporaryHeapIndex;
- (unint64_t)totalElementsPerChannel;
- (void)setArithmeticOp:(int)a3;
- (void)setBegin:(id)a3;
- (void)setBiasesDataType:(int)a3;
- (void)setCenterWeightVectors:(id)a3;
- (void)setCombinedForwardAndGradientLossKernel:(id)a3;
- (void)setComputeWeightsAndBiasOnly:(BOOL)a3;
- (void)setConstantArithmeticSourcesFlags:(int)a3;
- (void)setCountIncludesPadding:(BOOL)a3;
- (void)setDilationRateInX:(unint64_t)a3;
- (void)setDilationRateInY:(unint64_t)a3;
- (void)setEnd:(id)a3;
- (void)setExportableState:(id)a3;
- (void)setForwardStatisticsKernel:(id)a3;
- (void)setGradientState:(id)a3;
- (void)setGradientStatisticsKernel:(id)a3;
- (void)setGramMatrixScale:(float)a3;
- (void)setIsMPSGraph:(BOOL)a3;
- (void)setIsMPSKernel:(BOOL)a3;
- (void)setKernelSizeInX:(unint64_t)a3;
- (void)setKernelSizeInY:(unint64_t)a3;
- (void)setLayer:(id)a3;
- (void)setLossInitialGradientKernel:(id)a3;
- (void)setMetalKernelType:(int)a3;
- (void)setMomentumVectors:(id)a3;
- (void)setMovingState:(id)a3;
- (void)setNeuronDescriptor:(id)a3;
- (void)setPaddingBottom:(unint64_t)a3;
- (void)setPaddingLeft:(unint64_t)a3;
- (void)setPaddingRight:(unint64_t)a3;
- (void)setPaddingTop:(unint64_t)a3;
- (void)setPoolingIndicesBuffer:(id)a3;
- (void)setRecomputeResultTensor:(BOOL)a3;
- (void)setReduceLossKernel:(id)a3;
- (void)setScatterGatherDimension:(unint64_t)a3;
- (void)setScatterReduceType:(int)a3;
- (void)setSoftmaxAxis:(unint64_t)a3;
- (void)setSource0Shape:(id)a3;
- (void)setSource1Shape:(id)a3;
- (void)setSource2Shape:(id)a3;
- (void)setStride:(id)a3;
- (void)setStrideInX:(unint64_t)a3;
- (void)setStrideInY:(unint64_t)a3;
- (void)setTemporaryHeapIndex:(unint64_t)a3;
- (void)setTotalElementsPerChannel:(unint64_t)a3;
- (void)setTransposeGradientShape:(id)a3;
- (void)setTransposeShape:(id)a3;
- (void)setUseSourceGradientDeviceMemoryForResultGradientTensor:(BOOL)a3;
- (void)setUseSourceGradientDeviceMemoryForSecondaryResultGradientTensor:(BOOL)a3;
- (void)setVelocityVectors:(id)a3;
- (void)setWeightsDataType:(int)a3;
@end

@implementation MLCGPUDeviceOps

+ (id)deviceOps
{
  v2 = (void *)[objc_alloc((Class)a1) initWithForwardKernel:0 gradientKernel:0];

  return v2;
}

+ (id)deviceOpsWithForwardKernel:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithForwardKernel:v4 gradientKernel:0];

  return v5;
}

+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithForwardKernel:v7 gradientKernel:v6];

  return v8;
}

+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithForwardKernel:v10 gradientKernel:v9 secondaryGradientKernel:v8 forwardStatistics:0 gradientStatistics:0];

  return v11;
}

- (MLCGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  return [(MLCGPUDeviceOps *)self initWithForwardKernel:a3 gradientKernel:a4 secondaryGradientKernel:0 forwardStatistics:0 gradientStatistics:0];
}

+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5 forwardStatistics:(id)a6 gradientStatistics:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[objc_alloc((Class)a1) initWithForwardKernel:v16 gradientKernel:v15 secondaryGradientKernel:v14 forwardStatistics:v13 gradientStatistics:v12];

  return v17;
}

- (MLCGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5 forwardStatistics:(id)a6 gradientStatistics:(id)a7
{
  id v26 = a3;
  id v25 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MLCGPUDeviceOps;
  id v16 = [(MLCDeviceOps *)&v27 initWithSource:0 secondarySource:0 result:0 batchSize:1];
  v17 = v16;
  if (v16)
  {
    *(_WORD *)&v16->_isMPSKernel = 1;
    v16->_metalKernelType = 0;
    objc_storeStrong(&v16->_forwardKernel, a3);
    objc_storeStrong(&v17->_gradientKernel, a4);
    objc_storeStrong(&v17->_secondaryGradientKernel, a5);
    id lossInitialGradientKernel = v17->_lossInitialGradientKernel;
    v17->_id lossInitialGradientKernel = 0;

    id combinedForwardAndGradientLossKernel = v17->_combinedForwardAndGradientLossKernel;
    v17->_id combinedForwardAndGradientLossKernel = 0;

    id gradientState = v17->_gradientState;
    v17->_id gradientState = 0;

    id movingState = v17->_movingState;
    v17->_id movingState = 0;

    id exportableState = v17->_exportableState;
    v17->_id exportableState = 0;

    objc_storeStrong(&v17->_forwardStatisticsKernel, a6);
    objc_storeStrong(&v17->_gradientStatisticsKernel, a7);
    neuronDescriptor = v17->_neuronDescriptor;
    v17->_neuronDescriptor = 0;

    v17->_computeWeightsAndBiasOnly = 0;
    v17->_useSourceGradientDeviceMemoryForResultGradientTensor = 0;
    v17->_useSourceGradientDeviceMemoryForSecondaryResultGradientTensor = 0;
    v17->_recomputeResultTensor = 0;
    v17->_temporaryHeapIndex = 0;
  }

  return v17;
}

- (id)description
{
  id v16 = NSString;
  v3 = (objc_class *)objc_opt_class();
  id v15 = NSStringFromClass(v3);
  id v4 = [(MLCGPUDeviceOps *)self forwardKernel];
  v5 = [(MLCGPUDeviceOps *)self gradientKernel];
  id v6 = [(MLCGPUDeviceOps *)self secondaryGradientKernel];
  id v7 = [(MLCGPUDeviceOps *)self lossInitialGradientKernel];
  id v8 = [(MLCGPUDeviceOps *)self gradientState];
  id v9 = [(MLCDeviceOps *)self source];
  id v10 = [(MLCDeviceOps *)self secondarySource];
  v11 = [(MLCGPUDeviceOps *)self forwardStatisticsKernel];
  id v12 = [(MLCGPUDeviceOps *)self gradientStatisticsKernel];
  id v13 = [v16 stringWithFormat:@"%@: { forwardKernel=%@ : gradientKernel=%@ : secondaryGradientKernel= %@ : lossInitialGradientKernel=%@ : gradientState=%@ : source=%@ : secondarySource=%@ : forwardStatisticsKernel=%@ : gradientStatisticsKernel=%@ }", v15, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(MLCGPUDeviceOps *)self forwardKernel];
  id v6 = [(MLCGPUDeviceOps *)self gradientKernel];
  id v7 = (void *)[v4 initWithForwardKernel:v5 gradientKernel:v6];

  return v7;
}

- (_MLCGPULayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
}

- (BOOL)isMPSKernel
{
  return self->_isMPSKernel;
}

- (void)setIsMPSKernel:(BOOL)a3
{
  self->_isMPSKernel = a3;
}

- (BOOL)isMPSGraph
{
  return self->_isMPSGraph;
}

- (void)setIsMPSGraph:(BOOL)a3
{
  self->_isMPSGraph = a3;
}

- (int)metalKernelType
{
  return self->_metalKernelType;
}

- (void)setMetalKernelType:(int)a3
{
  self->_metalKernelType = a3;
}

- (id)forwardKernel
{
  return self->_forwardKernel;
}

- (id)gradientKernel
{
  return self->_gradientKernel;
}

- (id)secondaryGradientKernel
{
  return self->_secondaryGradientKernel;
}

- (id)lossInitialGradientKernel
{
  return self->_lossInitialGradientKernel;
}

- (void)setLossInitialGradientKernel:(id)a3
{
}

- (id)combinedForwardAndGradientLossKernel
{
  return self->_combinedForwardAndGradientLossKernel;
}

- (void)setCombinedForwardAndGradientLossKernel:(id)a3
{
}

- (id)reduceLossKernel
{
  return self->_reduceLossKernel;
}

- (void)setReduceLossKernel:(id)a3
{
}

- (id)gradientState
{
  return self->_gradientState;
}

- (void)setGradientState:(id)a3
{
}

- (id)forwardStatisticsKernel
{
  return self->_forwardStatisticsKernel;
}

- (void)setForwardStatisticsKernel:(id)a3
{
}

- (id)gradientStatisticsKernel
{
  return self->_gradientStatisticsKernel;
}

- (void)setGradientStatisticsKernel:(id)a3
{
}

- (NSArray)momentumVectors
{
  return self->_momentumVectors;
}

- (void)setMomentumVectors:(id)a3
{
}

- (NSArray)velocityVectors
{
  return self->_velocityVectors;
}

- (void)setVelocityVectors:(id)a3
{
}

- (NSArray)centerWeightVectors
{
  return self->_centerWeightVectors;
}

- (void)setCenterWeightVectors:(id)a3
{
}

- (id)exportableState
{
  return self->_exportableState;
}

- (void)setExportableState:(id)a3
{
}

- (id)movingState
{
  return self->_movingState;
}

- (void)setMovingState:(id)a3
{
}

- (BOOL)computeWeightsAndBiasOnly
{
  return self->_computeWeightsAndBiasOnly;
}

- (void)setComputeWeightsAndBiasOnly:(BOOL)a3
{
  self->_computeWeightsAndBiasOnly = a3;
}

- (unint64_t)totalElementsPerChannel
{
  return self->_totalElementsPerChannel;
}

- (void)setTotalElementsPerChannel:(unint64_t)a3
{
  self->_totalElementsPerChannel = a3;
}

- (unint64_t)paddingLeft
{
  return self->_paddingLeft;
}

- (void)setPaddingLeft:(unint64_t)a3
{
  self->_paddingLeft = a3;
}

- (unint64_t)paddingRight
{
  return self->_paddingRight;
}

- (void)setPaddingRight:(unint64_t)a3
{
  self->_paddingRight = a3;
}

- (unint64_t)paddingTop
{
  return self->_paddingTop;
}

- (void)setPaddingTop:(unint64_t)a3
{
  self->_paddingTop = a3;
}

- (unint64_t)paddingBottom
{
  return self->_paddingBottom;
}

- (void)setPaddingBottom:(unint64_t)a3
{
  self->_paddingBottom = a3;
}

- (BOOL)countIncludesPadding
{
  return self->_countIncludesPadding;
}

- (void)setCountIncludesPadding:(BOOL)a3
{
  self->_countIncludesPadding = a3;
}

- (unint64_t)kernelSizeInX
{
  return self->_kernelSizeInX;
}

- (void)setKernelSizeInX:(unint64_t)a3
{
  self->_kernelSizeInX = a3;
}

- (unint64_t)kernelSizeInY
{
  return self->_kernelSizeInY;
}

- (void)setKernelSizeInY:(unint64_t)a3
{
  self->_kernelSizeInY = a3;
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

- (int)weightsDataType
{
  return self->_weightsDataType;
}

- (void)setWeightsDataType:(int)a3
{
  self->_weightsDataType = a3;
}

- (int)biasesDataType
{
  return self->_biasesDataType;
}

- (void)setBiasesDataType:(int)a3
{
  self->_biasesDataType = a3;
}

- (id)poolingIndicesBuffer
{
  return self->_poolingIndicesBuffer;
}

- (void)setPoolingIndicesBuffer:(id)a3
{
}

- (BOOL)useSourceGradientDeviceMemoryForResultGradientTensor
{
  return self->_useSourceGradientDeviceMemoryForResultGradientTensor;
}

- (void)setUseSourceGradientDeviceMemoryForResultGradientTensor:(BOOL)a3
{
  self->_useSourceGradientDeviceMemoryForResultGradientTensor = a3;
}

- (BOOL)useSourceGradientDeviceMemoryForSecondaryResultGradientTensor
{
  return self->_useSourceGradientDeviceMemoryForSecondaryResultGradientTensor;
}

- (void)setUseSourceGradientDeviceMemoryForSecondaryResultGradientTensor:(BOOL)a3
{
  self->_useSourceGradientDeviceMemoryForSecondaryResultGradientTensor = a3;
}

- (MLCActivationDescriptor)neuronDescriptor
{
  return self->_neuronDescriptor;
}

- (void)setNeuronDescriptor:(id)a3
{
}

- (int)arithmeticOp
{
  return self->_arithmeticOp;
}

- (void)setArithmeticOp:(int)a3
{
  self->_arithmeticOp = a3;
}

- (NSArray)source0Shape
{
  return self->_source0Shape;
}

- (void)setSource0Shape:(id)a3
{
}

- (NSArray)source1Shape
{
  return self->_source1Shape;
}

- (void)setSource1Shape:(id)a3
{
}

- (NSArray)source2Shape
{
  return self->_source2Shape;
}

- (void)setSource2Shape:(id)a3
{
}

- (int)constantArithmeticSourcesFlags
{
  return self->_constantArithmeticSourcesFlags;
}

- (void)setConstantArithmeticSourcesFlags:(int)a3
{
  self->_constantArithmeticSourcesFlags = a3;
}

- (NSMutableArray)transposeShape
{
  return self->_transposeShape;
}

- (void)setTransposeShape:(id)a3
{
}

- (NSMutableArray)transposeGradientShape
{
  return self->_transposeGradientShape;
}

- (void)setTransposeGradientShape:(id)a3
{
}

- (NSArray)begin
{
  return self->_begin;
}

- (void)setBegin:(id)a3
{
}

- (NSArray)stride
{
  return self->_stride;
}

- (void)setStride:(id)a3
{
}

- (NSArray)end
{
  return self->_end;
}

- (void)setEnd:(id)a3
{
}

- (unint64_t)softmaxAxis
{
  return self->_softmaxAxis;
}

- (void)setSoftmaxAxis:(unint64_t)a3
{
  self->_softmaxAxis = a3;
}

- (unint64_t)scatterGatherDimension
{
  return self->_scatterGatherDimension;
}

- (void)setScatterGatherDimension:(unint64_t)a3
{
  self->_scatterGatherDimension = a3;
}

- (int)scatterReduceType
{
  return self->_scatterReduceType;
}

- (void)setScatterReduceType:(int)a3
{
  self->_scatterReduceType = a3;
}

- (float)gramMatrixScale
{
  return self->_gramMatrixScale;
}

- (void)setGramMatrixScale:(float)a3
{
  self->_gramMatrixScale = a3;
}

- (BOOL)recomputeResultTensor
{
  return self->_recomputeResultTensor;
}

- (void)setRecomputeResultTensor:(BOOL)a3
{
  self->_recomputeResultTensor = a3;
}

- (unint64_t)temporaryHeapIndex
{
  return self->_temporaryHeapIndex;
}

- (void)setTemporaryHeapIndex:(unint64_t)a3
{
  self->_temporaryHeapIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_stride, 0);
  objc_storeStrong((id *)&self->_begin, 0);
  objc_storeStrong((id *)&self->_transposeGradientShape, 0);
  objc_storeStrong((id *)&self->_transposeShape, 0);
  objc_storeStrong((id *)&self->_source2Shape, 0);
  objc_storeStrong((id *)&self->_source1Shape, 0);
  objc_storeStrong((id *)&self->_source0Shape, 0);
  objc_storeStrong((id *)&self->_neuronDescriptor, 0);
  objc_storeStrong(&self->_poolingIndicesBuffer, 0);
  objc_storeStrong(&self->_movingState, 0);
  objc_storeStrong(&self->_exportableState, 0);
  objc_storeStrong((id *)&self->_centerWeightVectors, 0);
  objc_storeStrong((id *)&self->_velocityVectors, 0);
  objc_storeStrong((id *)&self->_momentumVectors, 0);
  objc_storeStrong(&self->_gradientStatisticsKernel, 0);
  objc_storeStrong(&self->_forwardStatisticsKernel, 0);
  objc_storeStrong(&self->_gradientState, 0);
  objc_storeStrong(&self->_reduceLossKernel, 0);
  objc_storeStrong(&self->_combinedForwardAndGradientLossKernel, 0);
  objc_storeStrong(&self->_lossInitialGradientKernel, 0);
  objc_storeStrong(&self->_secondaryGradientKernel, 0);
  objc_storeStrong(&self->_gradientKernel, 0);
  objc_storeStrong(&self->_forwardKernel, 0);

  objc_storeStrong((id *)&self->_layer, 0);
}

@end