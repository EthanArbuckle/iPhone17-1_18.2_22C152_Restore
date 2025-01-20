@interface ADMonocularV2PipelineParameters
- (ADMonocularV2PipelineParameters)init;
- (unint64_t)networkVariantOverride;
- (void)setNetworkVariantOverride:(unint64_t)a3;
@end

@implementation ADMonocularV2PipelineParameters

- (ADMonocularV2PipelineParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)ADMonocularV2PipelineParameters;
  result = [(ADPipelineParameters *)&v3 init];
  if (result) {
    result->_networkVariantOverride = 0;
  }
  return result;
}

- (unint64_t)networkVariantOverride
{
  return self->_networkVariantOverride;
}

- (void)setNetworkVariantOverride:(unint64_t)a3
{
  self->_networkVariantOverride = a3;
}

@end