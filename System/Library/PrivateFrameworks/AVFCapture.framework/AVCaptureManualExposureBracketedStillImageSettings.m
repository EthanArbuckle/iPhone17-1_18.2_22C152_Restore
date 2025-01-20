@interface AVCaptureManualExposureBracketedStillImageSettings
+ (AVCaptureManualExposureBracketedStillImageSettings)manualExposureSettingsWithExposureDuration:(CMTime *)duration ISO:(float)ISO;
+ (void)initialize;
- (CMTime)exposureDuration;
- (float)ISO;
- (id)_initManualExposureSettingsWithExposureDuration:(id *)a3 ISO:(float)a4;
- (id)debugDescription;
- (id)description;
@end

@implementation AVCaptureManualExposureBracketedStillImageSettings

+ (void)initialize
{
}

+ (AVCaptureManualExposureBracketedStillImageSettings)manualExposureSettingsWithExposureDuration:(CMTime *)duration ISO:(float)ISO
{
  return (AVCaptureManualExposureBracketedStillImageSettings *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initManualExposureSettingsWithExposureDuration:ISO:", &v5, COERCE_DOUBLE(__PAIR64__(HIDWORD(duration->value), LODWORD(ISO))));
}

- (id)_initManualExposureSettingsWithExposureDuration:(id *)a3 ISO:(float)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureManualExposureBracketedStillImageSettings;
  id result = [(AVCaptureBracketedStillImageSettings *)&v8 initSubclass];
  if (result)
  {
    int64_t var3 = a3->var3;
    *(_OWORD *)((char *)result + 8) = *(_OWORD *)&a3->var0;
    *((void *)result + 3) = var3;
    *((float *)result + 8) = a4;
  }
  return result;
}

- (id)debugDescription
{
  double ISO = self->_ISO;
  CMTime time = (CMTime)self->_exposureDuration;
  return (id)[NSString stringWithFormat:@"[ISO:%.2f dur:%.4f]", *(void *)&ISO, CMTimeGetSeconds(&time)];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCaptureManualExposureBracketedStillImageSettings debugDescription](self, "debugDescription")];
}

- (CMTime)exposureDuration
{
  objc_copyStruct(retstr, &self->_exposureDuration, 24, 1, 0);
  return result;
}

- (float)ISO
{
  return self->_ISO;
}

@end