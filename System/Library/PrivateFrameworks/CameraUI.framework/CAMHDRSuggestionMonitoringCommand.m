@interface CAMHDRSuggestionMonitoringCommand
- (BOOL)_isEnabled;
- (CAMHDRSuggestionMonitoringCommand)initWithCoder:(id)a3;
- (CAMHDRSuggestionMonitoringCommand)initWithHDRSuggestionMonitoringEnabled:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMHDRSuggestionMonitoringCommand

- (CAMHDRSuggestionMonitoringCommand)initWithHDRSuggestionMonitoringEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMHDRSuggestionMonitoringCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMHDRSuggestionMonitoringCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMHDRSuggestionMonitoringCommand *)self _isEnabled];
  return v4;
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (void)executeWithContext:(id)a3
{
  v4 = [a3 currentStillImageOutput];
  if (v4)
  {
    if ([(CAMHDRSuggestionMonitoringCommand *)self _isEnabled]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 0;
    }
    objc_super v6 = [v4 photoSettingsForSceneMonitoring];
    if ([v6 HDRMode] != v5)
    {
      v7 = [MEMORY[0x263EFA628] photoSettingsFromPhotoSettings:v6];
      [v7 setHDRMode:v5];
      [v4 setPhotoSettingsForSceneMonitoring:v7];
    }
  }
  else
  {
    objc_super v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v8 = 0;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Trying to update HDR mode in a capture mode that doesn't support HDR. Ignoring.", v8, 2u);
    }
  }
}

- (CAMHDRSuggestionMonitoringCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMHDRSuggestionMonitoringCommand;
  uint64_t v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__enabled = [v4 decodeBoolForKey:@"CAMHDRSuggestionMonitoringEnabled"];
    objc_super v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMHDRSuggestionMonitoringCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMHDRSuggestionMonitoringCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMHDRSuggestionMonitoringEnabled");
}

@end