@interface MLCConvolutionGPUDeviceOps
+ (id)deviceOpsWithForwardMPSGraph:(id)a3 gradientMPSGraph:(id)a4;
- (BOOL)convolutionTranspose;
- (BOOL)depthWiseConvolution;
- (BOOL)hasBias;
- (MLCConvolutionGPUDeviceOps)initWithForwardMPSGraph:(id)a3 gradientMPSGraph:(id)a4;
- (NSMutableArray)descriptorsForMPSGraph;
- (NSMutableArray)mpsGraphTensors;
- (NSMutableArray)transposedTensors;
- (id)convolutionMultiGPUChildOps;
- (id)forwardMPSGraph;
- (id)gradientMPSGraph;
- (id)transposeDeviceOps;
- (unint64_t)biasChannelCount;
- (void)setBiasChannelCount:(unint64_t)a3;
- (void)setConvolutionMultiGPUChildOps:(id)a3;
- (void)setConvolutionTranspose:(BOOL)a3;
- (void)setDepthWiseConvolution:(BOOL)a3;
- (void)setDescriptorsForMPSGraph:(id)a3;
- (void)setForwardMPSGraph:(id)a3;
- (void)setGradientMPSGraph:(id)a3;
- (void)setHasBias:(BOOL)a3;
- (void)setMpsGraphTensors:(id)a3;
- (void)setTransposeDeviceOps:(id)a3;
- (void)setTransposedTensors:(id)a3;
@end

@implementation MLCConvolutionGPUDeviceOps

+ (id)deviceOpsWithForwardMPSGraph:(id)a3 gradientMPSGraph:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithForwardMPSGraph:v7 gradientMPSGraph:v6];

  return v8;
}

- (MLCConvolutionGPUDeviceOps)initWithForwardMPSGraph:(id)a3 gradientMPSGraph:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MLCConvolutionGPUDeviceOps;
  v9 = [(MLCGPUDeviceOps *)&v20 initWithForwardKernel:0 gradientKernel:0 secondaryGradientKernel:0 forwardStatistics:0 gradientStatistics:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_forwardMPSGraph, a3);
    objc_storeStrong(&v10->_gradientMPSGraph, a4);
    v10->_depthWiseConvolution = 0;
    v10->_convolutionTranspose = 0;
    v10->_hasBias = 0;
    v10->_biasChannelCount = 0;
    v11 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v12 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    descriptorsForMPSGraph = v10->_descriptorsForMPSGraph;
    v10->_descriptorsForMPSGraph = (NSMutableArray *)v12;

    uint64_t v14 = [v11 mutableCopy];
    mpsGraphTensors = v10->_mpsGraphTensors;
    v10->_mpsGraphTensors = (NSMutableArray *)v14;

    id convolutionMultiGPUChildOps = v10->_convolutionMultiGPUChildOps;
    v10->_id convolutionMultiGPUChildOps = 0;

    id transposeDeviceOps = v10->_transposeDeviceOps;
    v10->_id transposeDeviceOps = 0;

    transposedTensors = v10->_transposedTensors;
    v10->_transposedTensors = 0;
  }
  return v10;
}

- (id)forwardMPSGraph
{
  return self->_forwardMPSGraph;
}

- (void)setForwardMPSGraph:(id)a3
{
}

- (id)gradientMPSGraph
{
  return self->_gradientMPSGraph;
}

- (void)setGradientMPSGraph:(id)a3
{
}

- (BOOL)depthWiseConvolution
{
  return self->_depthWiseConvolution;
}

- (void)setDepthWiseConvolution:(BOOL)a3
{
  self->_depthWiseConvolution = a3;
}

- (BOOL)convolutionTranspose
{
  return self->_convolutionTranspose;
}

- (void)setConvolutionTranspose:(BOOL)a3
{
  self->_convolutionTranspose = a3;
}

- (BOOL)hasBias
{
  return self->_hasBias;
}

- (void)setHasBias:(BOOL)a3
{
  self->_hasBias = a3;
}

- (unint64_t)biasChannelCount
{
  return self->_biasChannelCount;
}

- (void)setBiasChannelCount:(unint64_t)a3
{
  self->_biasChannelCount = a3;
}

- (NSMutableArray)descriptorsForMPSGraph
{
  return self->_descriptorsForMPSGraph;
}

- (void)setDescriptorsForMPSGraph:(id)a3
{
}

- (NSMutableArray)mpsGraphTensors
{
  return self->_mpsGraphTensors;
}

- (void)setMpsGraphTensors:(id)a3
{
}

- (id)transposeDeviceOps
{
  return self->_transposeDeviceOps;
}

- (void)setTransposeDeviceOps:(id)a3
{
}

- (NSMutableArray)transposedTensors
{
  return self->_transposedTensors;
}

- (void)setTransposedTensors:(id)a3
{
}

- (id)convolutionMultiGPUChildOps
{
  return self->_convolutionMultiGPUChildOps;
}

- (void)setConvolutionMultiGPUChildOps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_convolutionMultiGPUChildOps, 0);
  objc_storeStrong((id *)&self->_transposedTensors, 0);
  objc_storeStrong(&self->_transposeDeviceOps, 0);
  objc_storeStrong((id *)&self->_mpsGraphTensors, 0);
  objc_storeStrong((id *)&self->_descriptorsForMPSGraph, 0);
  objc_storeStrong(&self->_gradientMPSGraph, 0);

  objc_storeStrong(&self->_forwardMPSGraph, 0);
}

@end