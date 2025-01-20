@interface VNGenerateSegmentationRequestConfiguration
- (VNGenerateSegmentationRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)outputPixelFormat;
- (void)setOutputPixelFormat:(unsigned int)a3;
@end

@implementation VNGenerateSegmentationRequestConfiguration

- (void)setOutputPixelFormat:(unsigned int)a3
{
  self->_outputPixelFormat = a3;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VNGenerateSegmentationRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v6 copyWithZone:a3];
  [v4 setOutputPixelFormat:self->_outputPixelFormat];
  return v4;
}

- (VNGenerateSegmentationRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNGenerateSegmentationRequestConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result) {
    result->_outputPixelFormat = 1278226488;
  }
  return result;
}

@end