@interface CAMStillImageCaptureResolvedSettings
- (BOOL)isCaptureBeforeResolvingSettingsEnabled;
- (BOOL)isHDREnabled;
- (BOOL)isPortraitEffectEnabled;
- (BOOL)lowLightCaptureHasConstantPreviewFeedbackSensitivity;
- (BOOL)lowLightCaptureHasInitialPreviewFeedbackSensitivity;
- (CAMStillImageCaptureResolvedSettings)initWithHDREnabled:(BOOL)a3 portraitEffectEnabled:(BOOL)a4 lowLightCaptureTime:(double)a5 lowLightPreviewColorEstimate:(CGColor *)a6 lowLightCaptureHasInitialPreviewFeedbackSensitivity:(BOOL)a7 lowLightCaptureHasConstantPreviewFeedbackSensitivity:(BOOL)a8 captureBeforeResolvingSettingsEnabled:(BOOL)a9;
- (CGColor)lowLightPreviewColorEstimate;
- (double)lowLightCaptureTime;
- (void)dealloc;
@end

@implementation CAMStillImageCaptureResolvedSettings

- (BOOL)isHDREnabled
{
  return self->_HDREnabled;
}

- (BOOL)isPortraitEffectEnabled
{
  return self->_portraitEffectEnabled;
}

- (CAMStillImageCaptureResolvedSettings)initWithHDREnabled:(BOOL)a3 portraitEffectEnabled:(BOOL)a4 lowLightCaptureTime:(double)a5 lowLightPreviewColorEstimate:(CGColor *)a6 lowLightCaptureHasInitialPreviewFeedbackSensitivity:(BOOL)a7 lowLightCaptureHasConstantPreviewFeedbackSensitivity:(BOOL)a8 captureBeforeResolvingSettingsEnabled:(BOOL)a9
{
  v20.receiver = self;
  v20.super_class = (Class)CAMStillImageCaptureResolvedSettings;
  v16 = [(CAMStillImageCaptureResolvedSettings *)&v20 init];
  v17 = v16;
  if (v16)
  {
    v16->_HDREnabled = a3;
    v16->_portraitEffectEnabled = a4;
    v16->_lowLightCaptureTime = a5;
    v16->_lowLightPreviewColorEstimate = CGColorRetain(a6);
    v17->_lowLightCaptureHasInitialPreviewFeedbackSensitivity = a7;
    v17->_lowLightCaptureHasConstantPreviewFeedbackSensitivity = a8;
    v17->_captureBeforeResolvingSettingsEnabled = a9;
    v18 = v17;
  }

  return v17;
}

- (void)dealloc
{
  CGColorRelease(self->_lowLightPreviewColorEstimate);
  v3.receiver = self;
  v3.super_class = (Class)CAMStillImageCaptureResolvedSettings;
  [(CAMStillImageCaptureResolvedSettings *)&v3 dealloc];
}

- (double)lowLightCaptureTime
{
  return self->_lowLightCaptureTime;
}

- (CGColor)lowLightPreviewColorEstimate
{
  return self->_lowLightPreviewColorEstimate;
}

- (BOOL)lowLightCaptureHasInitialPreviewFeedbackSensitivity
{
  return self->_lowLightCaptureHasInitialPreviewFeedbackSensitivity;
}

- (BOOL)lowLightCaptureHasConstantPreviewFeedbackSensitivity
{
  return self->_lowLightCaptureHasConstantPreviewFeedbackSensitivity;
}

- (BOOL)isCaptureBeforeResolvingSettingsEnabled
{
  return self->_captureBeforeResolvingSettingsEnabled;
}

@end