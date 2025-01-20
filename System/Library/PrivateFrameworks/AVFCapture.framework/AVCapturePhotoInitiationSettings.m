@interface AVCapturePhotoInitiationSettings
+ (id)photoInitiationSettingsWithUserInitiatedRequestTimestamp:(unint64_t)a3;
- (BOOL)burstQualityCaptureEnabled;
- (BOOL)isAutoStillImageStabilizationEnabled;
- (id)_initWithTimestamp:(unint64_t)a3;
- (int64_t)HDRMode;
- (int64_t)flashMode;
- (int64_t)uniqueID;
- (unint64_t)timestamp;
- (void)dealloc;
- (void)setAutoStillImageStabilizationEnabled:(BOOL)a3;
- (void)setBurstQualityCaptureEnabled:(BOOL)a3;
- (void)setFlashMode:(int64_t)a3;
- (void)setHDRMode:(int64_t)a3;
@end

@implementation AVCapturePhotoInitiationSettings

+ (id)photoInitiationSettingsWithUserInitiatedRequestTimestamp:(unint64_t)a3
{
  id v3 = [[AVCapturePhotoInitiationSettings alloc] _initWithTimestamp:a3];

  return v3;
}

- (id)_initWithTimestamp:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVCapturePhotoInitiationSettings;
  v4 = [(AVCapturePhotoInitiationSettings *)&v6 init];
  if (v4)
  {
    v4->_internal = objc_alloc_init(AVCapturePhotoInitiationSettingsInternal);
    v4->_internal->uniqueID = +[AVCapturePhotoSettings uniqueID];
    v4->_internal->timestamp = a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCapturePhotoInitiationSettings;
  [(AVCapturePhotoInitiationSettings *)&v3 dealloc];
}

- (unint64_t)timestamp
{
  return self->_internal->timestamp;
}

- (int64_t)uniqueID
{
  return self->_internal->uniqueID;
}

- (int64_t)flashMode
{
  return self->_internal->flashMode;
}

- (void)setFlashMode:(int64_t)a3
{
  self->_internal->flashMode = a3;
}

- (BOOL)isAutoStillImageStabilizationEnabled
{
  return self->_internal->autoStillImageStabilizationEnabled;
}

- (void)setAutoStillImageStabilizationEnabled:(BOOL)a3
{
  self->_internal->autoStillImageStabilizationEnabled = a3;
}

- (int64_t)HDRMode
{
  return self->_internal->HDRMode;
}

- (void)setHDRMode:(int64_t)a3
{
  self->_internal->HDRMode = a3;
}

- (BOOL)burstQualityCaptureEnabled
{
  return self->_internal->burstQualityCaptureEnabled;
}

- (void)setBurstQualityCaptureEnabled:(BOOL)a3
{
  self->_internal->burstQualityCaptureEnabled = a3;
}

@end