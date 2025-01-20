@interface MLCEmbeddingGPUDeviceOps
+ (id)deviceOps;
- (BOOL)scaleGradientByFrequency;
- (MLCEmbeddingGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4;
- (NSArray)embeddingParams;
- (NSNumber)paddingIndex;
- (id)gradientForWeights;
- (void)setEmbeddingParams:(id)a3;
- (void)setGradientForWeights:(id)a3;
- (void)setPaddingIndex:(id)a3;
- (void)setScaleGradientByFrequency:(BOOL)a3;
@end

@implementation MLCEmbeddingGPUDeviceOps

+ (id)deviceOps
{
  v2 = (void *)[objc_alloc((Class)a1) initWithForwardKernel:0 gradientKernel:0];

  return v2;
}

- (MLCEmbeddingGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MLCEmbeddingGPUDeviceOps;
  v4 = [(MLCGPUDeviceOps *)&v10 initWithForwardKernel:a3 gradientKernel:a4 secondaryGradientKernel:0 forwardStatistics:0 gradientStatistics:0];
  v5 = v4;
  if (v4)
  {
    paddingIndex = v4->_paddingIndex;
    v4->_paddingIndex = 0;

    embeddingParams = v5->_embeddingParams;
    v5->_embeddingParams = 0;

    v5->_scaleGradientByFrequency = 0;
    id gradientForWeights = v5->_gradientForWeights;
    v5->_id gradientForWeights = 0;
  }
  return v5;
}

- (id)gradientForWeights
{
  return self->_gradientForWeights;
}

- (void)setGradientForWeights:(id)a3
{
}

- (NSNumber)paddingIndex
{
  return self->_paddingIndex;
}

- (void)setPaddingIndex:(id)a3
{
}

- (NSArray)embeddingParams
{
  return self->_embeddingParams;
}

- (void)setEmbeddingParams:(id)a3
{
}

- (BOOL)scaleGradientByFrequency
{
  return self->_scaleGradientByFrequency;
}

- (void)setScaleGradientByFrequency:(BOOL)a3
{
  self->_scaleGradientByFrequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingParams, 0);
  objc_storeStrong((id *)&self->_paddingIndex, 0);

  objc_storeStrong(&self->_gradientForWeights, 0);
}

@end