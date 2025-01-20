@interface BWCameraLockScreenLaunchAnalyticsPayload
- (BOOL)completed;
- (BOOL)ispStreamingStarted;
- (BOOL)prewarmed;
- (BWCameraLockScreenLaunchAnalyticsPayload)init;
- (id)eventDictionary;
- (id)eventName;
- (int)launchError;
- (void)reset;
- (void)setCompleted:(BOOL)a3;
- (void)setIspStreamingStarted:(BOOL)a3;
- (void)setLaunchError:(int)a3;
- (void)setPrewarmed:(BOOL)a3;
@end

@implementation BWCameraLockScreenLaunchAnalyticsPayload

- (BWCameraLockScreenLaunchAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWCameraLockScreenLaunchAnalyticsPayload;
  v2 = [(BWCameraLockScreenLaunchAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWCameraLockScreenLaunchAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  *(_WORD *)&self->_completed = 0;
  self->_ispStreamingStarted = 0;
  self->_launchError = 0;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.CameraAppLockScreenLaunch";
}

- (id)eventDictionary
{
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_completed), @"completed");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_prewarmed), @"prewarmed");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_ispStreamingStarted), @"ispStreamingStarted");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_launchError), @"launchError");
  return v3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)prewarmed
{
  return self->_prewarmed;
}

- (void)setPrewarmed:(BOOL)a3
{
  self->_prewarmed = a3;
}

- (BOOL)ispStreamingStarted
{
  return self->_ispStreamingStarted;
}

- (void)setIspStreamingStarted:(BOOL)a3
{
  self->_ispStreamingStarted = a3;
}

- (int)launchError
{
  return self->_launchError;
}

- (void)setLaunchError:(int)a3
{
  self->_launchError = a3;
}

@end