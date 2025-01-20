@interface MLCNormalizationGPUDeviceOps
+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4;
- (BOOL)isFusedWithArithmeticLayer;
- (MLCNormalizationGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4;
- (NSArray)normalizedShape;
- (float)momentum;
- (float)varianceEpsilon;
- (id)batchNormBetaGammaDeltaKernel;
- (id)batchNormMeanKernel;
- (id)batchNormVarianceKernel;
- (id)instanceNormMovingMeanVarianceKernel;
- (id)normalizationBetaGradient;
- (id)normalizationComputedMean;
- (id)normalizationComputedVariance;
- (id)normalizationGammaGradient;
- (id)normalizationInputNormalized;
- (id)normalizationInverseSqrtVariance;
- (id)normalizationMultiGPUChildOps;
- (id)normalizationRecomputeResultKernel;
- (id)normalizationSumBetaGammaDeltaKernel;
- (unint64_t)groupCount;
- (void)setBatchNormBetaGammaDeltaKernel:(id)a3;
- (void)setBatchNormMeanKernel:(id)a3;
- (void)setBatchNormVarianceKernel:(id)a3;
- (void)setGroupCount:(unint64_t)a3;
- (void)setInstanceNormMovingMeanVarianceKernel:(id)a3;
- (void)setIsFusedWithArithmeticLayer:(BOOL)a3;
- (void)setMomentum:(float)a3;
- (void)setNormalizationBetaGradient:(id)a3;
- (void)setNormalizationComputedMean:(id)a3;
- (void)setNormalizationComputedVariance:(id)a3;
- (void)setNormalizationGammaGradient:(id)a3;
- (void)setNormalizationInputNormalized:(id)a3;
- (void)setNormalizationInverseSqrtVariance:(id)a3;
- (void)setNormalizationMultiGPUChildOps:(id)a3;
- (void)setNormalizationRecomputeResultKernel:(id)a3;
- (void)setNormalizationSumBetaGammaDeltaKernel:(id)a3;
- (void)setNormalizedShape:(id)a3;
- (void)setVarianceEpsilon:(float)a3;
@end

@implementation MLCNormalizationGPUDeviceOps

+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithForwardKernel:v7 gradientKernel:v6];

  return v8;
}

- (MLCNormalizationGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)MLCNormalizationGPUDeviceOps;
  v4 = [(MLCGPUDeviceOps *)&v20 initWithForwardKernel:a3 gradientKernel:a4 secondaryGradientKernel:0 forwardStatistics:0 gradientStatistics:0];
  v5 = v4;
  if (v4)
  {
    id normalizationGammaGradient = v4->_normalizationGammaGradient;
    v4->_id normalizationGammaGradient = 0;

    id normalizationBetaGradient = v5->_normalizationBetaGradient;
    v5->_id normalizationBetaGradient = 0;

    id normalizationInputNormalized = v5->_normalizationInputNormalized;
    v5->_id normalizationInputNormalized = 0;

    id normalizationInverseSqrtVariance = v5->_normalizationInverseSqrtVariance;
    v5->_id normalizationInverseSqrtVariance = 0;

    id normalizationComputedMean = v5->_normalizationComputedMean;
    v5->_id normalizationComputedMean = 0;

    id normalizationComputedVariance = v5->_normalizationComputedVariance;
    v5->_id normalizationComputedVariance = 0;

    id batchNormMeanKernel = v5->_batchNormMeanKernel;
    v5->_id batchNormMeanKernel = 0;

    id batchNormVarianceKernel = v5->_batchNormVarianceKernel;
    v5->_id batchNormVarianceKernel = 0;

    id batchNormBetaGammaDeltaKernel = v5->_batchNormBetaGammaDeltaKernel;
    v5->_id batchNormBetaGammaDeltaKernel = 0;

    id normalizationSumBetaGammaDeltaKernel = v5->_normalizationSumBetaGammaDeltaKernel;
    v5->_id normalizationSumBetaGammaDeltaKernel = 0;

    id instanceNormMovingMeanVarianceKernel = v5->_instanceNormMovingMeanVarianceKernel;
    v5->_id instanceNormMovingMeanVarianceKernel = 0;

    id normalizationRecomputeResultKernel = v5->_normalizationRecomputeResultKernel;
    v5->_id normalizationRecomputeResultKernel = 0;

    v5->_varianceEpsilon = 0.0;
    v5->_groupCount = 1;
    id normalizationMultiGPUChildOps = v5->_normalizationMultiGPUChildOps;
    v5->_id normalizationMultiGPUChildOps = 0;

    v5->_isFusedWithArithmeticLayer = 0;
  }
  return v5;
}

- (NSArray)normalizedShape
{
  return self->_normalizedShape;
}

- (void)setNormalizedShape:(id)a3
{
}

- (float)varianceEpsilon
{
  return self->_varianceEpsilon;
}

- (void)setVarianceEpsilon:(float)a3
{
  self->_varianceEpsilon = a3;
}

- (float)momentum
{
  return self->_momentum;
}

- (void)setMomentum:(float)a3
{
  self->_momentum = a3;
}

- (unint64_t)groupCount
{
  return self->_groupCount;
}

- (void)setGroupCount:(unint64_t)a3
{
  self->_groupCount = a3;
}

- (id)normalizationGammaGradient
{
  return self->_normalizationGammaGradient;
}

- (void)setNormalizationGammaGradient:(id)a3
{
}

- (id)normalizationBetaGradient
{
  return self->_normalizationBetaGradient;
}

- (void)setNormalizationBetaGradient:(id)a3
{
}

- (id)normalizationInverseSqrtVariance
{
  return self->_normalizationInverseSqrtVariance;
}

- (void)setNormalizationInverseSqrtVariance:(id)a3
{
}

- (id)normalizationInputNormalized
{
  return self->_normalizationInputNormalized;
}

- (void)setNormalizationInputNormalized:(id)a3
{
}

- (id)normalizationComputedMean
{
  return self->_normalizationComputedMean;
}

- (void)setNormalizationComputedMean:(id)a3
{
}

- (id)normalizationComputedVariance
{
  return self->_normalizationComputedVariance;
}

- (void)setNormalizationComputedVariance:(id)a3
{
}

- (id)batchNormMeanKernel
{
  return self->_batchNormMeanKernel;
}

- (void)setBatchNormMeanKernel:(id)a3
{
}

- (id)batchNormVarianceKernel
{
  return self->_batchNormVarianceKernel;
}

- (void)setBatchNormVarianceKernel:(id)a3
{
}

- (id)batchNormBetaGammaDeltaKernel
{
  return self->_batchNormBetaGammaDeltaKernel;
}

- (void)setBatchNormBetaGammaDeltaKernel:(id)a3
{
}

- (id)instanceNormMovingMeanVarianceKernel
{
  return self->_instanceNormMovingMeanVarianceKernel;
}

- (void)setInstanceNormMovingMeanVarianceKernel:(id)a3
{
}

- (id)normalizationRecomputeResultKernel
{
  return self->_normalizationRecomputeResultKernel;
}

- (void)setNormalizationRecomputeResultKernel:(id)a3
{
}

- (id)normalizationSumBetaGammaDeltaKernel
{
  return self->_normalizationSumBetaGammaDeltaKernel;
}

- (void)setNormalizationSumBetaGammaDeltaKernel:(id)a3
{
}

- (id)normalizationMultiGPUChildOps
{
  return self->_normalizationMultiGPUChildOps;
}

- (void)setNormalizationMultiGPUChildOps:(id)a3
{
}

- (BOOL)isFusedWithArithmeticLayer
{
  return self->_isFusedWithArithmeticLayer;
}

- (void)setIsFusedWithArithmeticLayer:(BOOL)a3
{
  self->_isFusedWithArithmeticLayer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_normalizationMultiGPUChildOps, 0);
  objc_storeStrong(&self->_normalizationSumBetaGammaDeltaKernel, 0);
  objc_storeStrong(&self->_normalizationRecomputeResultKernel, 0);
  objc_storeStrong(&self->_instanceNormMovingMeanVarianceKernel, 0);
  objc_storeStrong(&self->_batchNormBetaGammaDeltaKernel, 0);
  objc_storeStrong(&self->_batchNormVarianceKernel, 0);
  objc_storeStrong(&self->_batchNormMeanKernel, 0);
  objc_storeStrong(&self->_normalizationComputedVariance, 0);
  objc_storeStrong(&self->_normalizationComputedMean, 0);
  objc_storeStrong(&self->_normalizationInputNormalized, 0);
  objc_storeStrong(&self->_normalizationInverseSqrtVariance, 0);
  objc_storeStrong(&self->_normalizationBetaGradient, 0);
  objc_storeStrong(&self->_normalizationGammaGradient, 0);

  objc_storeStrong((id *)&self->_normalizedShape, 0);
}

@end