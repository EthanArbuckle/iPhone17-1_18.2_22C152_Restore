@interface MLCMHAGPUDeviceOps
+ (id)deviceOps;
- (BOOL)mhaHasAttentionMask;
- (BOOL)mhaHasAttnBias;
- (BOOL)mhaHasBias;
- (BOOL)mhaHasKeyMask;
- (BOOL)mhaHasZeroAttention;
- (MLCMHAGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4;
- (NSArray)mhaAttentionBiasTensors;
- (NSArray)mhaReduceSumKernels;
- (NSMutableArray)mhaInputProjResults;
- (NSMutableArray)mhaMatMulSourcesQKV;
- (NSMutableArray)mhaMatrixDescriptors;
- (NSMutableArray)mhaMatrixDescriptorsForBias;
- (NSMutableArray)mhaNDArrayDescriptors;
- (NSMutableArray)mhaNDArrayDescriptorsForBias;
- (NSMutableArray)mhaSourcesQKV;
- (id)mhaBiasAddKernel;
- (id)mhaDropoutForwardKernel;
- (id)mhaDropoutGradientKernel;
- (id)mhaDropoutSource;
- (id)mhaDropoutState;
- (id)mhaMaskSoftmaxFastForwardKernel;
- (id)mhaMaskSoftmaxForwardKernel;
- (id)mhaMatMulKernel;
- (id)mhaMatMulKernelWithScale;
- (id)mhaMultiGPUChildOps;
- (id)mhaQKSoftmaxResultMatrix;
- (id)mhaSoftmaxGradientKernel;
- (unint64_t)mhaHeadCount;
- (unint64_t)mhaModelDimension;
- (void)setMhaAttentionBiasTensors:(id)a3;
- (void)setMhaBiasAddKernel:(id)a3;
- (void)setMhaDropoutForwardKernel:(id)a3;
- (void)setMhaDropoutGradientKernel:(id)a3;
- (void)setMhaDropoutSource:(id)a3;
- (void)setMhaDropoutState:(id)a3;
- (void)setMhaHasAttentionMask:(BOOL)a3;
- (void)setMhaHasAttnBias:(BOOL)a3;
- (void)setMhaHasBias:(BOOL)a3;
- (void)setMhaHasKeyMask:(BOOL)a3;
- (void)setMhaHasZeroAttention:(BOOL)a3;
- (void)setMhaHeadCount:(unint64_t)a3;
- (void)setMhaInputProjResults:(id)a3;
- (void)setMhaMaskSoftmaxFastForwardKernel:(id)a3;
- (void)setMhaMaskSoftmaxForwardKernel:(id)a3;
- (void)setMhaMatMulKernel:(id)a3;
- (void)setMhaMatMulKernelWithScale:(id)a3;
- (void)setMhaMatMulSourcesQKV:(id)a3;
- (void)setMhaMatrixDescriptors:(id)a3;
- (void)setMhaMatrixDescriptorsForBias:(id)a3;
- (void)setMhaModelDimension:(unint64_t)a3;
- (void)setMhaMultiGPUChildOps:(id)a3;
- (void)setMhaNDArrayDescriptors:(id)a3;
- (void)setMhaNDArrayDescriptorsForBias:(id)a3;
- (void)setMhaQKSoftmaxResultMatrix:(id)a3;
- (void)setMhaReduceSumKernels:(id)a3;
- (void)setMhaSoftmaxGradientKernel:(id)a3;
- (void)setMhaSourcesQKV:(id)a3;
@end

@implementation MLCMHAGPUDeviceOps

+ (id)deviceOps
{
  v2 = (void *)[objc_alloc((Class)a1) initWithForwardKernel:0 gradientKernel:0];

  return v2;
}

- (MLCMHAGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  v35.receiver = self;
  v35.super_class = (Class)MLCMHAGPUDeviceOps;
  v4 = [(MLCGPUDeviceOps *)&v35 initWithForwardKernel:a3 gradientKernel:a4 secondaryGradientKernel:0 forwardStatistics:0 gradientStatistics:0];
  v5 = v4;
  if (v4)
  {
    v4->_mhaHeadCount = 1;
    v4->_mhaHasZeroAttention = 0;
    v6 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v7 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    mhaAttentionBiasTensors = v5->_mhaAttentionBiasTensors;
    v5->_mhaAttentionBiasTensors = (NSArray *)v7;

    id mhaDropoutForwardKernel = v5->_mhaDropoutForwardKernel;
    v5->_id mhaDropoutForwardKernel = 0;

    id mhaDropoutGradientKernel = v5->_mhaDropoutGradientKernel;
    v5->_id mhaDropoutGradientKernel = 0;

    id mhaDropoutState = v5->_mhaDropoutState;
    v5->_id mhaDropoutState = 0;

    id mhaDropoutSource = v5->_mhaDropoutSource;
    v5->_id mhaDropoutSource = 0;

    v5->_mhaHasKeyMask = 0;
    v5->_mhaHasAttentionMask = 0;
    uint64_t v13 = [v6 mutableCopy];
    mhaInputProjResults = v5->_mhaInputProjResults;
    v5->_mhaInputProjResults = (NSMutableArray *)v13;

    id mhaQKSoftmaxResultMatrix = v5->_mhaQKSoftmaxResultMatrix;
    v5->_id mhaQKSoftmaxResultMatrix = 0;

    uint64_t v16 = [v6 mutableCopy];
    mhaMatMulSourcesQKV = v5->_mhaMatMulSourcesQKV;
    v5->_mhaMatMulSourcesQKV = (NSMutableArray *)v16;

    uint64_t v18 = [v6 mutableCopy];
    mhaSourcesQKV = v5->_mhaSourcesQKV;
    v5->_mhaSourcesQKV = (NSMutableArray *)v18;

    uint64_t v20 = [v6 mutableCopy];
    id mhaMultiGPUChildOps = v5->_mhaMultiGPUChildOps;
    v5->_id mhaMultiGPUChildOps = (id)v20;

    uint64_t v22 = [v6 copy];
    mhaReduceSumKernels = v5->_mhaReduceSumKernels;
    v5->_mhaReduceSumKernels = (NSArray *)v22;

    id mhaMatMulKernel = v5->_mhaMatMulKernel;
    v5->_id mhaMatMulKernel = 0;

    id mhaMatMulKernelWithScale = v5->_mhaMatMulKernelWithScale;
    v5->_id mhaMatMulKernelWithScale = 0;

    uint64_t v26 = [v6 mutableCopy];
    mhaMatrixDescriptors = v5->_mhaMatrixDescriptors;
    v5->_mhaMatrixDescriptors = (NSMutableArray *)v26;

    uint64_t v28 = [v6 mutableCopy];
    mhaNDArrayDescriptors = v5->_mhaNDArrayDescriptors;
    v5->_mhaNDArrayDescriptors = (NSMutableArray *)v28;

    uint64_t v30 = [v6 mutableCopy];
    mhaMatrixDescriptorsForBias = v5->_mhaMatrixDescriptorsForBias;
    v5->_mhaMatrixDescriptorsForBias = (NSMutableArray *)v30;

    uint64_t v32 = [v6 mutableCopy];
    mhaNDArrayDescriptorsForBias = v5->_mhaNDArrayDescriptorsForBias;
    v5->_mhaNDArrayDescriptorsForBias = (NSMutableArray *)v32;
  }
  return v5;
}

- (unint64_t)mhaHeadCount
{
  return self->_mhaHeadCount;
}

- (void)setMhaHeadCount:(unint64_t)a3
{
  self->_mhaHeadCount = a3;
}

- (unint64_t)mhaModelDimension
{
  return self->_mhaModelDimension;
}

- (void)setMhaModelDimension:(unint64_t)a3
{
  self->_mhaModelDimension = a3;
}

- (NSMutableArray)mhaSourcesQKV
{
  return self->_mhaSourcesQKV;
}

- (void)setMhaSourcesQKV:(id)a3
{
}

- (NSMutableArray)mhaInputProjResults
{
  return self->_mhaInputProjResults;
}

- (void)setMhaInputProjResults:(id)a3
{
}

- (NSMutableArray)mhaMatMulSourcesQKV
{
  return self->_mhaMatMulSourcesQKV;
}

- (void)setMhaMatMulSourcesQKV:(id)a3
{
}

- (id)mhaQKSoftmaxResultMatrix
{
  return self->_mhaQKSoftmaxResultMatrix;
}

- (void)setMhaQKSoftmaxResultMatrix:(id)a3
{
}

- (id)mhaMaskSoftmaxForwardKernel
{
  return self->_mhaMaskSoftmaxForwardKernel;
}

- (void)setMhaMaskSoftmaxForwardKernel:(id)a3
{
}

- (id)mhaMaskSoftmaxFastForwardKernel
{
  return self->_mhaMaskSoftmaxFastForwardKernel;
}

- (void)setMhaMaskSoftmaxFastForwardKernel:(id)a3
{
}

- (id)mhaSoftmaxGradientKernel
{
  return self->_mhaSoftmaxGradientKernel;
}

- (void)setMhaSoftmaxGradientKernel:(id)a3
{
}

- (id)mhaMatMulKernel
{
  return self->_mhaMatMulKernel;
}

- (void)setMhaMatMulKernel:(id)a3
{
}

- (id)mhaMatMulKernelWithScale
{
  return self->_mhaMatMulKernelWithScale;
}

- (void)setMhaMatMulKernelWithScale:(id)a3
{
}

- (id)mhaBiasAddKernel
{
  return self->_mhaBiasAddKernel;
}

- (void)setMhaBiasAddKernel:(id)a3
{
}

- (NSMutableArray)mhaMatrixDescriptors
{
  return self->_mhaMatrixDescriptors;
}

- (void)setMhaMatrixDescriptors:(id)a3
{
}

- (NSMutableArray)mhaNDArrayDescriptors
{
  return self->_mhaNDArrayDescriptors;
}

- (void)setMhaNDArrayDescriptors:(id)a3
{
}

- (NSMutableArray)mhaMatrixDescriptorsForBias
{
  return self->_mhaMatrixDescriptorsForBias;
}

- (void)setMhaMatrixDescriptorsForBias:(id)a3
{
}

- (NSMutableArray)mhaNDArrayDescriptorsForBias
{
  return self->_mhaNDArrayDescriptorsForBias;
}

- (void)setMhaNDArrayDescriptorsForBias:(id)a3
{
}

- (NSArray)mhaReduceSumKernels
{
  return self->_mhaReduceSumKernels;
}

- (void)setMhaReduceSumKernels:(id)a3
{
}

- (BOOL)mhaHasBias
{
  return self->_mhaHasBias;
}

- (void)setMhaHasBias:(BOOL)a3
{
  self->_mhaHasBias = a3;
}

- (BOOL)mhaHasAttnBias
{
  return self->_mhaHasAttnBias;
}

- (void)setMhaHasAttnBias:(BOOL)a3
{
  self->_mhaHasAttnBias = a3;
}

- (NSArray)mhaAttentionBiasTensors
{
  return self->_mhaAttentionBiasTensors;
}

- (void)setMhaAttentionBiasTensors:(id)a3
{
}

- (BOOL)mhaHasZeroAttention
{
  return self->_mhaHasZeroAttention;
}

- (void)setMhaHasZeroAttention:(BOOL)a3
{
  self->_mhaHasZeroAttention = a3;
}

- (BOOL)mhaHasKeyMask
{
  return self->_mhaHasKeyMask;
}

- (void)setMhaHasKeyMask:(BOOL)a3
{
  self->_mhaHasKeyMask = a3;
}

- (BOOL)mhaHasAttentionMask
{
  return self->_mhaHasAttentionMask;
}

- (void)setMhaHasAttentionMask:(BOOL)a3
{
  self->_mhaHasAttentionMask = a3;
}

- (id)mhaDropoutForwardKernel
{
  return self->_mhaDropoutForwardKernel;
}

- (void)setMhaDropoutForwardKernel:(id)a3
{
}

- (id)mhaDropoutGradientKernel
{
  return self->_mhaDropoutGradientKernel;
}

- (void)setMhaDropoutGradientKernel:(id)a3
{
}

- (id)mhaDropoutSource
{
  return self->_mhaDropoutSource;
}

- (void)setMhaDropoutSource:(id)a3
{
}

- (id)mhaDropoutState
{
  return self->_mhaDropoutState;
}

- (void)setMhaDropoutState:(id)a3
{
}

- (id)mhaMultiGPUChildOps
{
  return self->_mhaMultiGPUChildOps;
}

- (void)setMhaMultiGPUChildOps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mhaMultiGPUChildOps, 0);
  objc_storeStrong(&self->_mhaDropoutState, 0);
  objc_storeStrong(&self->_mhaDropoutSource, 0);
  objc_storeStrong(&self->_mhaDropoutGradientKernel, 0);
  objc_storeStrong(&self->_mhaDropoutForwardKernel, 0);
  objc_storeStrong((id *)&self->_mhaAttentionBiasTensors, 0);
  objc_storeStrong((id *)&self->_mhaReduceSumKernels, 0);
  objc_storeStrong((id *)&self->_mhaNDArrayDescriptorsForBias, 0);
  objc_storeStrong((id *)&self->_mhaMatrixDescriptorsForBias, 0);
  objc_storeStrong((id *)&self->_mhaNDArrayDescriptors, 0);
  objc_storeStrong((id *)&self->_mhaMatrixDescriptors, 0);
  objc_storeStrong(&self->_mhaBiasAddKernel, 0);
  objc_storeStrong(&self->_mhaMatMulKernelWithScale, 0);
  objc_storeStrong(&self->_mhaMatMulKernel, 0);
  objc_storeStrong(&self->_mhaSoftmaxGradientKernel, 0);
  objc_storeStrong(&self->_mhaMaskSoftmaxFastForwardKernel, 0);
  objc_storeStrong(&self->_mhaMaskSoftmaxForwardKernel, 0);
  objc_storeStrong(&self->_mhaQKSoftmaxResultMatrix, 0);
  objc_storeStrong((id *)&self->_mhaMatMulSourcesQKV, 0);
  objc_storeStrong((id *)&self->_mhaInputProjResults, 0);

  objc_storeStrong((id *)&self->_mhaSourcesQKV, 0);
}

@end