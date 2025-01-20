@interface VNGenerateAnimalSegmentationRequestConfiguration
- (VNGenerateAnimalSegmentationRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation VNGenerateAnimalSegmentationRequestConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNGenerateAnimalSegmentationRequestConfiguration;
  id result = [(VNImageBasedRequestConfiguration *)&v5 copyWithZone:a3];
  if (result)
  {
    *((void *)result + 19) = self->_qualityLevel;
    *((_DWORD *)result + 36) = self->_outputPixelFormat;
  }
  return result;
}

- (VNGenerateAnimalSegmentationRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNGenerateAnimalSegmentationRequestConfiguration;
  id result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result)
  {
    result->_qualityLevel = 0;
    result->_outputPixelFormat = 1278226488;
  }
  return result;
}

@end