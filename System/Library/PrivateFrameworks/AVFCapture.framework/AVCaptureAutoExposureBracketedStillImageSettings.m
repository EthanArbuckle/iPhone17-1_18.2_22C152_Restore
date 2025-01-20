@interface AVCaptureAutoExposureBracketedStillImageSettings
+ (AVCaptureAutoExposureBracketedStillImageSettings)autoExposureSettingsWithExposureTargetBias:(float)exposureTargetBias;
+ (void)initialize;
- (float)exposureTargetBias;
- (id)_initAutoExposureSettingsWithExposureTargetBias:(float)a3;
- (id)debugDescription;
- (id)description;
@end

@implementation AVCaptureAutoExposureBracketedStillImageSettings

+ (void)initialize
{
}

+ (AVCaptureAutoExposureBracketedStillImageSettings)autoExposureSettingsWithExposureTargetBias:(float)exposureTargetBias
{
  id v4 = objc_alloc((Class)objc_opt_class());
  *(float *)&double v5 = exposureTargetBias;
  v6 = (void *)[v4 _initAutoExposureSettingsWithExposureTargetBias:v5];

  return (AVCaptureAutoExposureBracketedStillImageSettings *)v6;
}

- (id)_initAutoExposureSettingsWithExposureTargetBias:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureAutoExposureBracketedStillImageSettings;
  id result = [(AVCaptureBracketedStillImageSettings *)&v5 initSubclass];
  if (result) {
    *((float *)result + 2) = a3;
  }
  return result;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"[bias:%.2f]", self->_exposureTargetBias];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCaptureAutoExposureBracketedStillImageSettings debugDescription](self, "debugDescription")];
}

- (float)exposureTargetBias
{
  return self->_exposureTargetBias;
}

@end