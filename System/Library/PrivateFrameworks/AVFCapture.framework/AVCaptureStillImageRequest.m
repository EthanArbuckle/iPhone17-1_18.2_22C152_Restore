@interface AVCaptureStillImageRequest
+ (id)request;
- (AVCaptureBracketedStillImageSettings)bracketedSettings;
- (id)bracketedCaptureCompletionBlock;
- (id)iosurfaceCompletionBlock;
- (id)sbufCompletionBlock;
- (int64_t)settingsID;
- (unsigned)shutterSoundID;
- (void)dealloc;
- (void)setBracketedCaptureCompletionBlock:(id)a3;
- (void)setBracketedSettings:(id)a3;
- (void)setIosurfaceCompletionBlock:(id)a3;
- (void)setSbufCompletionBlock:(id)a3;
- (void)setSettingsID:(int64_t)a3;
- (void)setShutterSoundID:(unsigned int)a3;
@end

@implementation AVCaptureStillImageRequest

+ (id)request
{
  v2 = objc_alloc_init(AVCaptureStillImageRequest);

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureStillImageRequest;
  [(AVCaptureStillImageRequest *)&v3 dealloc];
}

- (id)sbufCompletionBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setSbufCompletionBlock:(id)a3
{
}

- (id)iosurfaceCompletionBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setIosurfaceCompletionBlock:(id)a3
{
}

- (id)bracketedCaptureCompletionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setBracketedCaptureCompletionBlock:(id)a3
{
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (void)setSettingsID:(int64_t)a3
{
  self->_settingsID = a3;
}

- (unsigned)shutterSoundID
{
  return self->_shutterSoundID;
}

- (void)setShutterSoundID:(unsigned int)a3
{
  self->_shutterSoundID = a3;
}

- (AVCaptureBracketedStillImageSettings)bracketedSettings
{
  return (AVCaptureBracketedStillImageSettings *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBracketedSettings:(id)a3
{
}

@end