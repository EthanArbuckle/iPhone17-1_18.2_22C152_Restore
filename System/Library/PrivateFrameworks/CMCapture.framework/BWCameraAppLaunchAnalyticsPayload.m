@interface BWCameraAppLaunchAnalyticsPayload
- (BOOL)deviceIsLocked;
- (BOOL)isColdLaunch;
- (BOOL)isPrewarmed;
- (BWCameraAppLaunchAnalyticsPayload)init;
- (NSString)launchMode;
- (NSString)prewarmReason;
- (id)eventDictionary;
- (id)eventName;
- (int)devicePosition;
- (int)deviceStolenCondition;
- (int)deviceStolenDuration;
- (int)ispStartDuration;
- (int)launchDuration;
- (int)memoryStatusLevel;
- (int)numberOfGraphStartsDuringLaunch;
- (int)thermalLevel;
- (void)dealloc;
- (void)reset;
- (void)setDeviceIsLocked:(BOOL)a3;
- (void)setDevicePosition:(int)a3;
- (void)setDeviceStolenCondition:(int)a3;
- (void)setDeviceStolenDuration:(int)a3;
- (void)setIsColdLaunch:(BOOL)a3;
- (void)setIsPrewarmed:(BOOL)a3;
- (void)setIspStartDuration:(int)a3;
- (void)setLaunchDuration:(int)a3;
- (void)setLaunchMode:(id)a3;
- (void)setMemoryStatusLevel:(int)a3;
- (void)setNumberOfGraphStartsDuringLaunch:(int)a3;
- (void)setPrewarmReason:(id)a3;
- (void)setThermalLevel:(int)a3;
@end

@implementation BWCameraAppLaunchAnalyticsPayload

- (void)setThermalLevel:(int)a3
{
  self->_thermalLevel = a3;
}

- (void)setPrewarmReason:(id)a3
{
}

- (void)setNumberOfGraphStartsDuringLaunch:(int)a3
{
  self->_numberOfGraphStartsDuringLaunch = a3;
}

- (void)setMemoryStatusLevel:(int)a3
{
  self->_memoryStatusLevel = a3;
}

- (void)setLaunchMode:(id)a3
{
}

- (void)setLaunchDuration:(int)a3
{
  self->_launchDuration = a3;
}

- (void)setIspStartDuration:(int)a3
{
  self->_ispStartDuration = a3;
}

- (void)setIsPrewarmed:(BOOL)a3
{
  self->_isPrewarmed = a3;
}

- (void)setIsColdLaunch:(BOOL)a3
{
  self->_isColdLaunch = a3;
}

- (void)setDeviceStolenDuration:(int)a3
{
  self->_deviceStolenDuration = a3;
}

- (void)setDeviceStolenCondition:(int)a3
{
  self->_deviceStolenCondition = a3;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (void)setDeviceIsLocked:(BOOL)a3
{
  self->_deviceIsLocked = a3;
}

- (BWCameraAppLaunchAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWCameraAppLaunchAnalyticsPayload;
  v2 = [(BWCameraAppLaunchAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWCameraAppLaunchAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  self->_isPrewarmed = 0;
  self->_launchMode = (NSString *)@"Unknown";
  self->_devicePosition = 0;
  self->_prewarmReason = (NSString *)@"Unknown";
  *(_OWORD *)&self->_launchDuration = xmmword_1A5F0C940;
  self->_deviceIsLocked = 0;
  self->_deviceStolenDuration = 0;
  self->_deviceStolenCondition = 0;
  self->_isColdLaunch = 0;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.CameraAppLaunch";
}

- (id)eventDictionary
{
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_isPrewarmed), @"isPrewarmed");
  [v3 setObject:self->_launchMode forKeyedSubscript:@"launchMode"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_devicePosition), @"devicePosition");
  [v3 setObject:self->_prewarmReason forKeyedSubscript:@"prewarmReason"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_ispStartDuration), @"ispStartDuration");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_numberOfGraphStartsDuringLaunch), @"numberOfGraphStartsDuringLaunch");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_deviceIsLocked), @"deviceIsLocked");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deviceStolenDuration), @"deviceStolenDuration");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deviceStolenCondition), @"deviceStolenCondition");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_isColdLaunch), @"isColdLaunch");
  if (self->_launchDuration)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"launchDuration");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (self->_launchDuration - self->_ispStartDuration)), @"launchDurationExcludingISP");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (self->_launchDuration - (self->_ispStartDuration + self->_deviceStolenDuration))), @"netLaunchDuration");
  }
  if ((self->_memoryStatusLevel & 0x80000000) == 0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"memoryStatusLevel");
  }
  if ((self->_thermalLevel & 0x80000000) == 0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"thermalLevel");
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWCameraAppLaunchAnalyticsPayload;
  [(BWCameraAppLaunchAnalyticsPayload *)&v3 dealloc];
}

- (BOOL)isPrewarmed
{
  return self->_isPrewarmed;
}

- (NSString)launchMode
{
  return self->_launchMode;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (NSString)prewarmReason
{
  return self->_prewarmReason;
}

- (int)launchDuration
{
  return self->_launchDuration;
}

- (int)memoryStatusLevel
{
  return self->_memoryStatusLevel;
}

- (int)thermalLevel
{
  return self->_thermalLevel;
}

- (int)ispStartDuration
{
  return self->_ispStartDuration;
}

- (int)numberOfGraphStartsDuringLaunch
{
  return self->_numberOfGraphStartsDuringLaunch;
}

- (BOOL)deviceIsLocked
{
  return self->_deviceIsLocked;
}

- (int)deviceStolenDuration
{
  return self->_deviceStolenDuration;
}

- (int)deviceStolenCondition
{
  return self->_deviceStolenCondition;
}

- (BOOL)isColdLaunch
{
  return self->_isColdLaunch;
}

@end