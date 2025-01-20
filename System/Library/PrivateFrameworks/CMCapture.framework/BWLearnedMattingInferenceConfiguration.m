@interface BWLearnedMattingInferenceConfiguration
- (BOOL)appliesFinalCropRect;
- (BOOL)produceLowResPersonMaskClone;
- (float)mainImageDownscalingFactor;
- (float)targetAspectRatio;
- (void)dealloc;
- (void)setAppliesFinalCropRect:(BOOL)a3;
- (void)setMainImageDownscalingFactor:(float)a3;
- (void)setProduceLowResPersonMaskClone:(BOOL)a3;
- (void)setTargetAspectRatio:(float)a3;
@end

@implementation BWLearnedMattingInferenceConfiguration

- (void)setTargetAspectRatio:(float)a3
{
  self->_targetAspectRatio = a3;
}

- (void)setMainImageDownscalingFactor:(float)a3
{
  self->_mainImageDownscalingFactor = a3;
}

- (void)setAppliesFinalCropRect:(BOOL)a3
{
  self->_appliesFinalCropRect = a3;
}

- (BOOL)produceLowResPersonMaskClone
{
  return self->_produceLowResPersonMaskClone;
}

- (float)mainImageDownscalingFactor
{
  return self->_mainImageDownscalingFactor;
}

- (float)targetAspectRatio
{
  return self->_targetAspectRatio;
}

- (BOOL)appliesFinalCropRect
{
  return self->_appliesFinalCropRect;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWLearnedMattingInferenceConfiguration;
  [(BWTiledEspressoInferenceConfiguration *)&v2 dealloc];
}

- (void)setProduceLowResPersonMaskClone:(BOOL)a3
{
  self->_produceLowResPersonMaskClone = a3;
}

@end