@interface MLCDeviceOptimizer
+ (MLCDeviceOptimizer)deviceOptimizerWithFunction:(unsigned int)a3 optimizerAlgFields:(id)a4 accumulatorBufferCount:(unint64_t)a5;
+ (MLCDeviceOptimizer)deviceOptimizerWithKernel:(id)a3;
- (BOOL)amsgrad;
- (BOOL)centered;
- (BOOL)decoupleWeightDecay;
- (BOOL)usesNesterov;
- (MLCDeviceOptimizer)initWithFunction:(unsigned int)a3 optimizerAlgFields:(id)a4 accumulatorBufferCount:(unint64_t)a5;
- (MLCDeviceOptimizer)initWithKernel:(id)a3;
- (MLCOptimizerDescriptor)descriptor;
- (MTLBuffer)l2NormBuffer;
- (MTLComputePipelineState)computeL2NormKernel;
- (MTLComputePipelineState)sumL2NormKernel;
- (NSData)optimizerAlgFields;
- (float)alpha;
- (float)beta1;
- (float)beta2;
- (float)epsilon;
- (float)learningRate;
- (float)momentumScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)kernel;
- (int)gpuOptimizerKernelType;
- (unint64_t)accumulatorBufferCount;
- (unint64_t)timeStep;
- (unsigned)function;
- (void)setAccumulatorBufferCount:(unint64_t)a3;
- (void)setAlpha:(float)a3;
- (void)setAmsgrad:(BOOL)a3;
- (void)setBeta1:(float)a3;
- (void)setBeta2:(float)a3;
- (void)setCentered:(BOOL)a3;
- (void)setComputeL2NormKernel:(id)a3;
- (void)setDecoupleWeightDecay:(BOOL)a3;
- (void)setDescriptor:(id)a3;
- (void)setEpsilon:(float)a3;
- (void)setGpuOptimizerKernelType:(int)a3;
- (void)setL2NormBuffer:(id)a3;
- (void)setLearningRate:(float)a3;
- (void)setMomentumScale:(float)a3;
- (void)setSumL2NormKernel:(id)a3;
- (void)setTimeStep:(unint64_t)a3;
- (void)setUsesNesterov:(BOOL)a3;
@end

@implementation MLCDeviceOptimizer

+ (MLCDeviceOptimizer)deviceOptimizerWithKernel:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithKernel:v4];

  return (MLCDeviceOptimizer *)v5;
}

+ (MLCDeviceOptimizer)deviceOptimizerWithFunction:(unsigned int)a3 optimizerAlgFields:(id)a4 accumulatorBufferCount:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v9 = (void *)[objc_alloc((Class)a1) initWithFunction:v6 optimizerAlgFields:v8 accumulatorBufferCount:a5];

  return (MLCDeviceOptimizer *)v9;
}

- (MLCDeviceOptimizer)initWithKernel:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MLCDeviceOptimizer;
  uint64_t v6 = [(MLCDeviceOptimizer *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_kernel, a3);
    descriptor = v7->_descriptor;
    v7->_descriptor = 0;

    optimizerAlgFields = v7->_optimizerAlgFields;
    v7->_optimizerAlgFields = 0;

    v7->_accumulatorBufferCount = 0;
    v7->_timeStep = 0;
    computeL2NormKernel = v7->_computeL2NormKernel;
    v7->_computeL2NormKernel = 0;

    sumL2NormKernel = v7->_sumL2NormKernel;
    v7->_sumL2NormKernel = 0;
  }
  return v7;
}

- (MLCDeviceOptimizer)initWithFunction:(unsigned int)a3 optimizerAlgFields:(id)a4 accumulatorBufferCount:(unint64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MLCDeviceOptimizer;
  v10 = [(MLCDeviceOptimizer *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_function = a3;
    objc_storeStrong((id *)&v10->_optimizerAlgFields, a4);
    v11->_accumulatorBufferCount = a5;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCDeviceOptimizer *)self kernel];
  v7 = [v3 stringWithFormat:@"%@: { kernel=%@ }", v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(MLCDeviceOptimizer *)self kernel];
  uint64_t v6 = (void *)[v4 initWithKernel:v5];

  return v6;
}

- (id)kernel
{
  return self->_kernel;
}

- (MTLComputePipelineState)computeL2NormKernel
{
  return self->_computeL2NormKernel;
}

- (void)setComputeL2NormKernel:(id)a3
{
}

- (MTLComputePipelineState)sumL2NormKernel
{
  return self->_sumL2NormKernel;
}

- (void)setSumL2NormKernel:(id)a3
{
}

- (MTLBuffer)l2NormBuffer
{
  return self->_l2NormBuffer;
}

- (void)setL2NormBuffer:(id)a3
{
}

- (int)gpuOptimizerKernelType
{
  return self->_gpuOptimizerKernelType;
}

- (void)setGpuOptimizerKernelType:(int)a3
{
  self->_gpuOptimizerKernelType = a3;
}

- (float)momentumScale
{
  return self->_momentumScale;
}

- (void)setMomentumScale:(float)a3
{
  self->_momentumScale = a3;
}

- (BOOL)usesNesterov
{
  return self->_usesNesterov;
}

- (void)setUsesNesterov:(BOOL)a3
{
  self->_usesNesterov = a3;
}

- (float)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(float)a3
{
  self->_learningRate = a3;
}

- (MLCOptimizerDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (float)beta1
{
  return self->_beta1;
}

- (void)setBeta1:(float)a3
{
  self->_beta1 = a3;
}

- (float)beta2
{
  return self->_beta2;
}

- (void)setBeta2:(float)a3
{
  self->_beta2 = a3;
}

- (float)epsilon
{
  return self->_epsilon;
}

- (void)setEpsilon:(float)a3
{
  self->_epsilon = a3;
}

- (BOOL)amsgrad
{
  return self->_amsgrad;
}

- (void)setAmsgrad:(BOOL)a3
{
  self->_amsgrad = a3;
}

- (BOOL)decoupleWeightDecay
{
  return self->_decoupleWeightDecay;
}

- (void)setDecoupleWeightDecay:(BOOL)a3
{
  self->_decoupleWeightDecay = a3;
}

- (float)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(float)a3
{
  self->_alpha = a3;
}

- (BOOL)centered
{
  return self->_centered;
}

- (void)setCentered:(BOOL)a3
{
  self->_centered = a3;
}

- (unsigned)function
{
  return self->_function;
}

- (NSData)optimizerAlgFields
{
  return self->_optimizerAlgFields;
}

- (unint64_t)accumulatorBufferCount
{
  return self->_accumulatorBufferCount;
}

- (void)setAccumulatorBufferCount:(unint64_t)a3
{
  self->_accumulatorBufferCount = a3;
}

- (unint64_t)timeStep
{
  return self->_timeStep;
}

- (void)setTimeStep:(unint64_t)a3
{
  self->_timeStep = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizerAlgFields, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_l2NormBuffer, 0);
  objc_storeStrong((id *)&self->_sumL2NormKernel, 0);
  objc_storeStrong((id *)&self->_computeL2NormKernel, 0);

  objc_storeStrong(&self->_kernel, 0);
}

@end