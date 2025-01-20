@interface ADStereoPipelineParameters
- (ADStereoPipelineParameters)init;
- (unint64_t)networkVariantOverride;
- (void)setNetworkVariantOverride:(unint64_t)a3;
@end

@implementation ADStereoPipelineParameters

- (void)setNetworkVariantOverride:(unint64_t)a3
{
  self->_networkVariantOverride = a3;
}

- (unint64_t)networkVariantOverride
{
  return self->_networkVariantOverride;
}

- (ADStereoPipelineParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)ADStereoPipelineParameters;
  result = [(ADPipelineParameters *)&v3 init];
  if (result) {
    result->_networkVariantOverride = 0;
  }
  return result;
}

@end