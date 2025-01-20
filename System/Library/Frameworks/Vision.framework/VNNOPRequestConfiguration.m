@interface VNNOPRequestConfiguration
- (BOOL)detectorWantsAnisotropicScaling;
- (VNNOPRequestConfiguration)initWithRequestClass:(Class)a3;
- (VNSupportedImageSize)detectorPreferredImageSize;
- (double)detectorExecutionTimeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDetectorExecutionTimeInterval:(double)a3;
- (void)setDetectorPreferredImageSize:(id)a3;
- (void)setDetectorWantsAnisotropicScaling:(BOOL)a3;
@end

@implementation VNNOPRequestConfiguration

- (void).cxx_destruct
{
}

- (void)setDetectorExecutionTimeInterval:(double)a3
{
  self->_detectorExecutionTimeInterval = a3;
}

- (double)detectorExecutionTimeInterval
{
  return self->_detectorExecutionTimeInterval;
}

- (void)setDetectorWantsAnisotropicScaling:(BOOL)a3
{
  self->_detectorWantsAnisotropicScaling = a3;
}

- (BOOL)detectorWantsAnisotropicScaling
{
  return self->_detectorWantsAnisotropicScaling;
}

- (void)setDetectorPreferredImageSize:(id)a3
{
}

- (VNSupportedImageSize)detectorPreferredImageSize
{
  return self->_detectorPreferredImageSize;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNNOPRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setDetectorPreferredImageSize:self->_detectorPreferredImageSize];
    [v5 setDetectorWantsAnisotropicScaling:self->_detectorWantsAnisotropicScaling];
    [v5 setDetectorExecutionTimeInterval:self->_detectorExecutionTimeInterval];
  }
  return v5;
}

- (VNNOPRequestConfiguration)initWithRequestClass:(Class)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VNNOPRequestConfiguration;
  v3 = [(VNImageBasedRequestConfiguration *)&v9 initWithRequestClass:a3];
  if (v3)
  {
    id v4 = [[VNSizeRange alloc] initWithMinimumDimension:299 maximumDimension:299 idealDimension:299];
    v5 = [[VNSupportedImageSize alloc] initWithIdealFormat:1111970369 pixelsWideRange:v4 pixelsHighRange:v4 aspectRatioHandling:0 idealOrientation:1 orientationAgnostic:1];

    detectorPreferredImageSize = v3->_detectorPreferredImageSize;
    v3->_detectorPreferredImageSize = v5;

    v3->_detectorWantsAnisotropicScaling = 1;
    objc_super v7 = v3;
  }

  return v3;
}

@end