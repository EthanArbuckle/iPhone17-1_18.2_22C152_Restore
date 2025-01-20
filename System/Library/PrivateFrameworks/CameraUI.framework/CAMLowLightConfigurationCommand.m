@interface CAMLowLightConfigurationCommand
- (BOOL)_isEnabled;
- (CAMLowLightConfigurationCommand)initWithCoder:(id)a3;
- (CAMLowLightConfigurationCommand)initWithLowLightEnabled:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMLowLightConfigurationCommand

- (CAMLowLightConfigurationCommand)initWithLowLightEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMLowLightConfigurationCommand;
  result = [(CAMCaptureCommand *)&v5 init];
  if (result) {
    result->__enabled = a3;
  }
  return result;
}

- (CAMLowLightConfigurationCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CAMLowLightConfigurationCommand;
  objc_super v5 = [(CAMCaptureCommand *)&v7 init];
  if (v5) {
    v5->__enabled = [v4 decodeBoolForKey:@"CAMLowLightConfigurationEnabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMLowLightConfigurationCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMLowLightConfigurationCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMLowLightConfigurationEnabled");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMLowLightConfigurationCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMLowLightConfigurationCommand *)self _isEnabled];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 currentStillImageOutput];
  objc_super v6 = [v4 currentVideoDeviceFormat];

  BOOL v7 = [(CAMLowLightConfigurationCommand *)self _isEnabled];
  v8 = [v5 supportedDigitalFlashModes];
  if ([v8 containsObject:&unk_26BDDDB60])
  {
    int v9 = [v6 isDigitalFlashSupported];

    if (v9)
    {
      [v5 setDigitalFlashCaptureEnabled:v7];
      v10 = [v5 photoSettingsForSceneMonitoring];
      if ([v10 digitalFlashMode] != v7)
      {
        v11 = [MEMORY[0x263EFA628] photoSettingsFromPhotoSettings:v10];
        [v11 setDigitalFlashMode:v7];
        [v5 setPhotoSettingsForSceneMonitoring:v11];
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  if (v7)
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Not enabling digital flash because the feature is not supported.", v13, 2u);
    }
  }
LABEL_11:
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end