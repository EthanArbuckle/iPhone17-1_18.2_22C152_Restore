@interface GTReplayConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)disableHeapTextureCompression;
- (BOOL)disableOptimizeRestores;
- (BOOL)enableCapture;
- (BOOL)enableDisplayOnDevice;
- (BOOL)enableHUD;
- (BOOL)enableReplayFromOtherPlatforms;
- (BOOL)enableStopOnError;
- (BOOL)enableValidation;
- (BOOL)forceLoadActionClear;
- (BOOL)forceLoadUnusedResources;
- (BOOL)forceWaitUntilCompleted;
- (GTReplayConfiguration)init;
- (GTReplayConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDisableHeapTextureCompression:(BOOL)a3;
- (void)setDisableOptimizeRestores:(BOOL)a3;
- (void)setEnableCapture:(BOOL)a3;
- (void)setEnableDisplayOnDevice:(BOOL)a3;
- (void)setEnableHUD:(BOOL)a3;
- (void)setEnableReplayFromOtherPlatforms:(BOOL)a3;
- (void)setEnableStopOnError:(BOOL)a3;
- (void)setEnableValidation:(BOOL)a3;
- (void)setForceLoadActionClear:(BOOL)a3;
- (void)setForceLoadUnusedResources:(BOOL)a3;
- (void)setForceWaitUntilCompleted:(BOOL)a3;
@end

@implementation GTReplayConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)GTReplayConfiguration;
  v2 = [(GTReplayConfiguration *)&v6 init];
  v3 = (GTReplayConfiguration *)v2;
  if (v2)
  {
    *(_DWORD *)(v2 + 15) = 0;
    *((void *)v2 + 1) = 0;
    v4 = v2;
  }

  return v3;
}

- (GTReplayConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayConfiguration;
  v5 = [(GTReplayConfiguration *)&v8 init];
  if (v5)
  {
    v5->_forceLoadActionClear = [v4 decodeBoolForKey:@"forceLoadActionClear"];
    v5->_forceLoadUnusedResources = [v4 decodeBoolForKey:@"forceLoadUnusedResources"];
    v5->_forceWaitUntilCompleted = [v4 decodeBoolForKey:@"forceWaitUntilCompleted"];
    v5->_disableOptimizeRestores = [v4 decodeBoolForKey:@"disableOptimizeRestores"];
    v5->_disableHeapTextureCompression = [v4 decodeBoolForKey:@"disableHeapTextureCompression"];
    v5->_enableStopOnError = [v4 decodeBoolForKey:@"enableStopOnError"];
    v5->_enableDisplayOnDevice = [v4 decodeBoolForKey:@"enableDisplayOnDevice"];
    v5->_enableReplayFromOtherPlatforms = [v4 decodeBoolForKey:@"enableReplayFromOtherPlatforms"];
    v5->_enableValidation = [v4 decodeBoolForKey:@"enableValidation"];
    v5->_enableCapture = [v4 decodeBoolForKey:@"enableCapture"];
    v5->_enableHUD = [v4 decodeBoolForKey:@"enableHUD"];
    objc_super v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL forceLoadActionClear = self->_forceLoadActionClear;
  id v5 = a3;
  [v5 encodeBool:forceLoadActionClear forKey:@"forceLoadActionClear"];
  [v5 encodeBool:self->_forceLoadUnusedResources forKey:@"forceLoadUnusedResources"];
  [v5 encodeBool:self->_forceWaitUntilCompleted forKey:@"forceWaitUntilCompleted"];
  [v5 encodeBool:self->_disableOptimizeRestores forKey:@"disableOptimizeRestores"];
  [v5 encodeBool:self->_disableHeapTextureCompression forKey:@"disableHeapTextureCompression"];
  [v5 encodeBool:self->_enableStopOnError forKey:@"enableStopOnError"];
  [v5 encodeBool:self->_enableDisplayOnDevice forKey:@"enableDisplayOnDevice"];
  [v5 encodeBool:self->_enableReplayFromOtherPlatforms forKey:@"enableReplayFromOtherPlatforms"];
  [v5 encodeBool:self->_enableValidation forKey:@"enableValidation"];
  [v5 encodeBool:self->_enableCapture forKey:@"enableCapture"];
  [v5 encodeBool:self->_enableHUD forKey:@"enableHUD"];
}

- (BOOL)forceLoadActionClear
{
  return self->_forceLoadActionClear;
}

- (void)setForceLoadActionClear:(BOOL)a3
{
  self->_BOOL forceLoadActionClear = a3;
}

- (BOOL)forceLoadUnusedResources
{
  return self->_forceLoadUnusedResources;
}

- (void)setForceLoadUnusedResources:(BOOL)a3
{
  self->_forceLoadUnusedResources = a3;
}

- (BOOL)forceWaitUntilCompleted
{
  return self->_forceWaitUntilCompleted;
}

- (void)setForceWaitUntilCompleted:(BOOL)a3
{
  self->_forceWaitUntilCompleted = a3;
}

- (BOOL)disableOptimizeRestores
{
  return self->_disableOptimizeRestores;
}

- (void)setDisableOptimizeRestores:(BOOL)a3
{
  self->_disableOptimizeRestores = a3;
}

- (BOOL)disableHeapTextureCompression
{
  return self->_disableHeapTextureCompression;
}

- (void)setDisableHeapTextureCompression:(BOOL)a3
{
  self->_disableHeapTextureCompression = a3;
}

- (BOOL)enableStopOnError
{
  return self->_enableStopOnError;
}

- (void)setEnableStopOnError:(BOOL)a3
{
  self->_enableStopOnError = a3;
}

- (BOOL)enableDisplayOnDevice
{
  return self->_enableDisplayOnDevice;
}

- (void)setEnableDisplayOnDevice:(BOOL)a3
{
  self->_enableDisplayOnDevice = a3;
}

- (BOOL)enableReplayFromOtherPlatforms
{
  return self->_enableReplayFromOtherPlatforms;
}

- (void)setEnableReplayFromOtherPlatforms:(BOOL)a3
{
  self->_enableReplayFromOtherPlatforms = a3;
}

- (BOOL)enableValidation
{
  return self->_enableValidation;
}

- (void)setEnableValidation:(BOOL)a3
{
  self->_enableValidation = a3;
}

- (BOOL)enableCapture
{
  return self->_enableCapture;
}

- (void)setEnableCapture:(BOOL)a3
{
  self->_enableCapture = a3;
}

- (BOOL)enableHUD
{
  return self->_enableHUD;
}

- (void)setEnableHUD:(BOOL)a3
{
  self->_enableHUD = a3;
}

@end