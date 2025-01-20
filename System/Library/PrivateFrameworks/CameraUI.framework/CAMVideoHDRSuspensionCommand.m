@interface CAMVideoHDRSuspensionCommand
- (BOOL)isVideoHDRSuspended;
- (CAMVideoHDRSuspensionCommand)initWithCoder:(id)a3;
- (CAMVideoHDRSuspensionCommand)initWithVideoHDRSuspended:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMVideoHDRSuspensionCommand

- (CAMVideoHDRSuspensionCommand)initWithVideoHDRSuspended:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoHDRSuspensionCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->_videoHDRSuspended = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMVideoHDRSuspensionCommand)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CAMVideoHDRSuspensionCommand;
  [(CAMCaptureCommand *)&v3 encodeWithCoder:a3];
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"NSCoding not implemented"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMVideoHDRSuspensionCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMVideoHDRSuspensionCommand *)self isVideoHDRSuspended];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 currentVideoDevice];
  objc_super v6 = [v4 currentVideoDeviceFormat];

  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    if ([v5 isVideoHDREnabled]
      && [v6 isVideoHDRSuspensionSupported])
    {
      BOOL v7 = [(CAMVideoHDRSuspensionCommand *)self isVideoHDRSuspended];
      if (v7 || [v5 isVideoHDRSuspended])
      {
        objc_super v8 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = @"NO";
          if (v7) {
            v9 = @"YES";
          }
          v10 = v9;
          int v12 = 138543362;
          v13 = v10;
          _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Setting videoHDRSuspended=%{public}@", (uint8_t *)&v12, 0xCu);
        }
      }
      [v5 setVideoHDRSuspended:v7];
    }
  }
  else
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "videoHDRSuspended SPI unavailable!", (uint8_t *)&v12, 2u);
    }
  }
}

- (BOOL)isVideoHDRSuspended
{
  return self->_videoHDRSuspended;
}

@end