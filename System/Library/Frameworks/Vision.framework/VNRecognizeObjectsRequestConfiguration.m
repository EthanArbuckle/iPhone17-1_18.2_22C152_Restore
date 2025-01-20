@interface VNRecognizeObjectsRequestConfiguration
- (BOOL)useImageAnalyzerScaling;
- (NSArray)targetedIdentifiers;
- (VNRecognizeObjectsRequestConfiguration)initWithRequestClass:(Class)a3;
- (float)modelMinimumDetectionConfidence;
- (float)modelNonMaximumSuppressionThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)imageCropAndScaleOption;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
- (void)setModelMinimumDetectionConfidence:(float)a3;
- (void)setModelNonMaximumSuppressionThreshold:(float)a3;
- (void)setTargetedIdentifiers:(id)a3;
- (void)setUseImageAnalyzerScaling:(BOOL)a3;
@end

@implementation VNRecognizeObjectsRequestConfiguration

- (void).cxx_destruct
{
}

- (void)setTargetedIdentifiers:(id)a3
{
}

- (NSArray)targetedIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setModelNonMaximumSuppressionThreshold:(float)a3
{
  self->_modelNonMaximumSuppressionThreshold = a3;
}

- (float)modelNonMaximumSuppressionThreshold
{
  return self->_modelNonMaximumSuppressionThreshold;
}

- (void)setModelMinimumDetectionConfidence:(float)a3
{
  self->_modelMinimumDetectionConfidence = a3;
}

- (float)modelMinimumDetectionConfidence
{
  return self->_modelMinimumDetectionConfidence;
}

- (void)setUseImageAnalyzerScaling:(BOOL)a3
{
  self->_useImageAnalyzerScaling = a3;
}

- (BOOL)useImageAnalyzerScaling
{
  return self->_useImageAnalyzerScaling;
}

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  self->_imageCropAndScaleOption = a3;
}

- (unint64_t)imageCropAndScaleOption
{
  return self->_imageCropAndScaleOption;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VNRecognizeObjectsRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v9 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setImageCropAndScaleOption:self->_imageCropAndScaleOption];
    [v5 setUseImageAnalyzerScaling:self->_useImageAnalyzerScaling];
    *(float *)&double v6 = self->_modelMinimumDetectionConfidence;
    [v5 setModelMinimumDetectionConfidence:v6];
    *(float *)&double v7 = self->_modelNonMaximumSuppressionThreshold;
    [v5 setModelNonMaximumSuppressionThreshold:v7];
    [v5 setTargetedIdentifiers:self->_targetedIdentifiers];
  }
  return v5;
}

- (VNRecognizeObjectsRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNRecognizeObjectsRequestConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result)
  {
    result->_imageCropAndScaleOption = 2;
    result->_modelMinimumDetectionConfidence = 0.1;
    result->_modelNonMaximumSuppressionThreshold = 0.3;
  }
  return result;
}

@end