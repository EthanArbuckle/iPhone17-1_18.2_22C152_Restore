@interface CAMLowLightModeCommand
- (CAMLowLightModeCommand)initWithCoder:(id)a3;
- (CAMLowLightModeCommand)initWithLowLightMode:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_lowLightMode;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMLowLightModeCommand

- (CAMLowLightModeCommand)initWithLowLightMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMLowLightModeCommand;
  result = [(CAMCaptureCommand *)&v5 init];
  if (result) {
    result->__lowLightMode = a3;
  }
  return result;
}

- (CAMLowLightModeCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CAMLowLightModeCommand;
  objc_super v5 = [(CAMCaptureCommand *)&v7 init];
  if (v5) {
    v5->__lowLightMode = [v4 decodeBoolForKey:@"CAMLowLightModeKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMLowLightModeCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMLowLightModeCommand _lowLightMode](self, "_lowLightMode", v5.receiver, v5.super_class) != 0, @"CAMLowLightModeKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMLowLightModeCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[3] = [(CAMLowLightModeCommand *)self _lowLightMode];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 currentVideoDevice];
  objc_super v6 = [v4 currentVideoDeviceFormat];
  objc_super v7 = [v4 currentStillImageOutput];

  unint64_t v8 = [(CAMLowLightModeCommand *)self _lowLightMode];
  if ([v6 isDigitalFlashSupported])
  {
    int64_t v9 = +[CAMCaptureConversions captureDigitalFlashModeForLowLightMode:v8];
    v10 = [v7 supportedDigitalFlashModes];
    v11 = [NSNumber numberWithInteger:v9];
    char v12 = [v10 containsObject:v11];

    if (v12)
    {
      [v5 setDigitalFlashMode:v9];
    }
    else
    {
      v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (v8 > 2) {
          v15 = 0;
        }
        else {
          v15 = off_263FA0790[v8];
        }
        int v16 = 138543362;
        v17 = v15;
        _os_log_impl(&dword_2099F8000, v14, OS_LOG_TYPE_DEFAULT, "Not setting night mode to %{public}@ because the output doesn't support it.", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  else
  {
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "Not changing night mode because the feature isn't supported.", (uint8_t *)&v16, 2u);
    }
  }
}

- (int64_t)_lowLightMode
{
  return self->__lowLightMode;
}

@end