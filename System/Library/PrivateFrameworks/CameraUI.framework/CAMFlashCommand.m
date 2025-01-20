@interface CAMFlashCommand
- (CAMFlashCommand)initWithCoder:(id)a3;
- (CAMFlashCommand)initWithFlashMode:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_flashMode;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMFlashCommand

- (CAMFlashCommand)initWithFlashMode:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMFlashCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__flashMode = a3;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMFlashCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[3] = [(CAMFlashCommand *)self _flashMode];
  return v4;
}

- (int64_t)_flashMode
{
  return self->__flashMode;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 currentVideoDevice];
  objc_super v6 = [v4 currentStillImageOutput];

  if (v6)
  {
    uint64_t v7 = +[CAMCaptureConversions captureFlashModeForFlashMode:[(CAMFlashCommand *)self _flashMode]];
    if ([v5 hasFlash] && objc_msgSend(v5, "isFlashModeSupported:", v7))
    {
      [v5 setFlashMode:v7];
    }
    else if ([v5 hasFlash])
    {
      objc_super v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(CAMFlashCommand *)(uint64_t)v5 executeWithContext:v8];
      }
    }
    v9 = [v6 photoSettingsForSceneMonitoring];
    v10 = [MEMORY[0x263EFA628] photoSettingsFromPhotoSettings:v9];
    [v10 setFlashMode:v7];
    [v6 setPhotoSettingsForSceneMonitoring:v10];
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Trying to update flash mode in a capture mode that doesn't support flash. Ignoring.", v11, 2u);
    }
  }
}

- (CAMFlashCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMFlashCommand;
  v5 = [(CAMCaptureCommand *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->__flashMode = [v4 decodeIntegerForKey:@"CAMFlashCommandFlashMode"];
    objc_super v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMFlashCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMFlashCommand _flashMode](self, "_flashMode", v5.receiver, v5.super_class), @"CAMFlashCommandFlashMode");
}

- (void)executeWithContext:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Ignoring request to set unsupported flash mode %ld on device %{public}@.", (uint8_t *)&v3, 0x16u);
}

@end