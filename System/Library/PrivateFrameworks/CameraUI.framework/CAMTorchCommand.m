@interface CAMTorchCommand
- (CAMTorchCommand)initWithCoder:(id)a3;
- (CAMTorchCommand)initWithTorchLevel:(float)a3;
- (CAMTorchCommand)initWithTorchMode:(int64_t)a3;
- (float)_level;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_torchMode;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMTorchCommand

- (CAMTorchCommand)initWithTorchMode:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMTorchCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__torchMode = a3;
    v4->__level = 3.4028e38;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMTorchCommand;
  v4 = [(CAMCaptureCommand *)&v7 copyWithZone:a3];
  v4[4] = [(CAMTorchCommand *)self _torchMode];
  [(CAMTorchCommand *)self _level];
  *((_DWORD *)v4 + 6) = v5;
  return v4;
}

- (int64_t)_torchMode
{
  return self->__torchMode;
}

- (float)_level
{
  return self->__level;
}

- (void)executeWithContext:(id)a3
{
  v4 = [a3 currentVideoDevice];
  uint64_t v5 = +[CAMCaptureConversions captureTorchModeForTorchMode:[(CAMTorchCommand *)self _torchMode]];
  [(CAMTorchCommand *)self _level];
  float v7 = v6;
  if ([v4 hasTorch] && objc_msgSend(v4, "isTorchModeSupported:", v5))
  {
    if (v7 >= 3.4028e38)
    {
      [v4 setTorchMode:v5];
    }
    else
    {
      id v12 = 0;
      *(float *)&double v8 = v7;
      [v4 setTorchModeOnWithLevel:&v12 error:v8];
      id v9 = v12;
      if (v9)
      {
        v10 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[CAMTorchCommand executeWithContext:]((uint64_t)v9, v10);
        }
      }
    }
  }
  else if ([v4 hasTorch])
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(CAMTorchCommand *)(uint64_t)v4 executeWithContext:v11];
    }
  }
}

- (CAMTorchCommand)initWithTorchLevel:(float)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMTorchCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->__torchMode = 1;
    v4->__level = a3;
    float v6 = v4;
  }

  return v5;
}

- (CAMTorchCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMTorchCommand;
  uint64_t v5 = [(CAMCaptureCommand *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->__torchMode = [v4 decodeIntegerForKey:@"CAMTorchCommandTorchMode"];
    [v4 decodeFloatForKey:@"CAMTorchCommandTorchLevel"];
    v5->__level = v6;
    float v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMTorchCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMTorchCommand _torchMode](self, "_torchMode", v5.receiver, v5.super_class), @"CAMTorchCommandTorchMode");
  [(CAMTorchCommand *)self _level];
  objc_msgSend(v4, "encodeFloat:forKey:", @"CAMTorchCommandTorchLevel");
}

- (void)executeWithContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Attempt to set explicit torch level failed with error %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)executeWithContext:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Ignoring request to set unsupported torch mode %ld on device %{public}@.", (uint8_t *)&v3, 0x16u);
}

@end