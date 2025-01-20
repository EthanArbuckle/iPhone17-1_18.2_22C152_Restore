@interface VCRecommendedNetworkSettings
- (VCRecommendedNetworkSettings)initWithTargetBitrateCap:(unsigned int)a3;
- (unsigned)targetBitrateCap;
- (void)dealloc;
@end

@implementation VCRecommendedNetworkSettings

- (VCRecommendedNetworkSettings)initWithTargetBitrateCap:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCRecommendedNetworkSettings;
  result = [(VCRecommendedNetworkSettings *)&v5 init];
  if (result) {
    result->_targetBitrateCap = a3;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)VCRecommendedNetworkSettings;
  [(VCRecommendedNetworkSettings *)&v2 dealloc];
}

- (unsigned)targetBitrateCap
{
  return self->_targetBitrateCap;
}

@end