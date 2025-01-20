@interface JFXEffectContinousLiveCapturePreviewOptions
- (BOOL)rotateCameraFrameToInterfaceOrientation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initLiveCaptureOptions;
- (void)setRotateCameraFrameToInterfaceOrientation:(BOOL)a3;
@end

@implementation JFXEffectContinousLiveCapturePreviewOptions

- (id)initLiveCaptureOptions
{
  v5.receiver = self;
  v5.super_class = (Class)JFXEffectContinousLiveCapturePreviewOptions;
  id v2 = [(JFXEffectContinousPreviewOptions *)&v5 initContinousPreviewOptions];
  v3 = v2;
  if (v2) {
    [v2 setBackgroundType:1];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JFXEffectContinousLiveCapturePreviewOptions;
  id result = [(JFXEffectContinousPreviewOptions *)&v5 copyWithZone:a3];
  *((unsigned char *)result + 88) = self->_rotateCameraFrameToInterfaceOrientation;
  return result;
}

- (BOOL)rotateCameraFrameToInterfaceOrientation
{
  return self->_rotateCameraFrameToInterfaceOrientation;
}

- (void)setRotateCameraFrameToInterfaceOrientation:(BOOL)a3
{
  self->_rotateCameraFrameToInterfaceOrientation = a3;
}

@end