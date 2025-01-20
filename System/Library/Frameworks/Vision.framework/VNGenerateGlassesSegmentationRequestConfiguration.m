@interface VNGenerateGlassesSegmentationRequestConfiguration
- (VNGenerateGlassesSegmentationRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)qualityLevel;
- (void)setQualityLevel:(int64_t)a3;
@end

@implementation VNGenerateGlassesSegmentationRequestConfiguration

- (void)setQualityLevel:(int64_t)a3
{
  self->_qualityLevel = a3;
}

- (int64_t)qualityLevel
{
  return self->_qualityLevel;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VNGenerateGlassesSegmentationRequestConfiguration;
  id v4 = [(VNGenerateSegmentationRequestConfiguration *)&v6 copyWithZone:a3];
  [v4 setQualityLevel:self->_qualityLevel];
  return v4;
}

- (VNGenerateGlassesSegmentationRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNGenerateGlassesSegmentationRequestConfiguration;
  result = [(VNGenerateSegmentationRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result) {
    result->_qualityLevel = 0;
  }
  return result;
}

@end