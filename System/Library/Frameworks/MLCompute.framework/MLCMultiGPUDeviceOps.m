@interface MLCMultiGPUDeviceOps
+ (id)multiGPUDeviceOpsWithGPUDeviceOps:(id)a3;
- (MLCMultiGPUDeviceOps)initWithGPUDevicOps:(id)a3;
- (NSArray)localGradientMatrices;
- (NSArray)matrixSumKernels;
- (NSArray)receivedGradientMatrices;
- (NSArray)remoteGradientBuffers;
- (NSMutableArray)allReducedGradientMatrices;
- (NSMutableArray)rnnTrainableWeightGradients;
- (int)multiGPUReduction;
- (void)setAllReducedGradientMatrices:(id)a3;
- (void)setLocalGradientMatrices:(id)a3;
- (void)setMatrixSumKernels:(id)a3;
- (void)setMultiGPUReduction:(int)a3;
- (void)setReceivedGradientMatrices:(id)a3;
- (void)setRemoteGradientBuffers:(id)a3;
- (void)setRnnTrainableWeightGradients:(id)a3;
@end

@implementation MLCMultiGPUDeviceOps

+ (id)multiGPUDeviceOpsWithGPUDeviceOps:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithGPUDevicOps:v4];

  return v5;
}

- (MLCMultiGPUDeviceOps)initWithGPUDevicOps:(id)a3
{
  id v4 = a3;
  v5 = [v4 forwardKernel];
  v6 = [v4 gradientKernel];
  v7 = [v4 secondaryGradientKernel];
  v8 = [v4 forwardStatisticsKernel];
  v9 = [v4 gradientStatisticsKernel];
  v14.receiver = self;
  v14.super_class = (Class)MLCMultiGPUDeviceOps;
  v10 = [(MLCGPUDeviceOps *)&v14 initWithForwardKernel:v5 gradientKernel:v6 secondaryGradientKernel:v7 forwardStatistics:v8 gradientStatistics:v9];

  if (v10)
  {
    v10->_multiGPUReduction = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v4 rnnTrainableWeightGradients];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    }
    rnnTrainableWeightGradients = v10->_rnnTrainableWeightGradients;
    v10->_rnnTrainableWeightGradients = (NSMutableArray *)v11;
  }
  return v10;
}

- (int)multiGPUReduction
{
  return self->_multiGPUReduction;
}

- (void)setMultiGPUReduction:(int)a3
{
  self->_multiGPUReduction = a3;
}

- (NSArray)localGradientMatrices
{
  return self->_localGradientMatrices;
}

- (void)setLocalGradientMatrices:(id)a3
{
}

- (NSArray)remoteGradientBuffers
{
  return self->_remoteGradientBuffers;
}

- (void)setRemoteGradientBuffers:(id)a3
{
}

- (NSArray)receivedGradientMatrices
{
  return self->_receivedGradientMatrices;
}

- (void)setReceivedGradientMatrices:(id)a3
{
}

- (NSArray)matrixSumKernels
{
  return self->_matrixSumKernels;
}

- (void)setMatrixSumKernels:(id)a3
{
}

- (NSMutableArray)allReducedGradientMatrices
{
  return self->_allReducedGradientMatrices;
}

- (void)setAllReducedGradientMatrices:(id)a3
{
}

- (NSMutableArray)rnnTrainableWeightGradients
{
  return self->_rnnTrainableWeightGradients;
}

- (void)setRnnTrainableWeightGradients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rnnTrainableWeightGradients, 0);
  objc_storeStrong((id *)&self->_allReducedGradientMatrices, 0);
  objc_storeStrong((id *)&self->_matrixSumKernels, 0);
  objc_storeStrong((id *)&self->_receivedGradientMatrices, 0);
  objc_storeStrong((id *)&self->_remoteGradientBuffers, 0);

  objc_storeStrong((id *)&self->_localGradientMatrices, 0);
}

@end