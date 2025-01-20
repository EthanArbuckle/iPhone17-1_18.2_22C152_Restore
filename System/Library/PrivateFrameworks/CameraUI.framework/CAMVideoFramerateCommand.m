@interface CAMVideoFramerateCommand
- (CAMVideoFramerateCommand)initWithCoder:(id)a3;
- (CAMVideoFramerateCommand)initWithVideoConfiguration:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_videoConfiguration;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMVideoFramerateCommand

- (CAMVideoFramerateCommand)initWithVideoConfiguration:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoFramerateCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__videoConfiguration = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMVideoFramerateCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoFramerateCommand;
  v5 = [(CAMCaptureCommand *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->__videoConfiguration = [v4 decodeIntegerForKey:@"CAMVideoFramerateCommandVideoConfiguration"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMVideoFramerateCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMVideoFramerateCommand _videoConfiguration](self, "_videoConfiguration", v5.receiver, v5.super_class), @"CAMVideoFramerateCommandVideoConfiguration");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMVideoFramerateCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[3] = [(CAMVideoFramerateCommand *)self _videoConfiguration];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 currentVideoDevice];
  objc_super v6 = [v4 currentVideoDeviceInput];
  v7 = [v4 currentVideoDeviceFormat];

  int64_t v8 = [(CAMVideoFramerateCommand *)self _videoConfiguration];
  if (v7) {
    objc_msgSend(v7, "cam_frameDurationForVideoConfiguration:", v8);
  }
  memset(buf, 0, sizeof(buf));
  if (objc_msgSend(v7, "cam_supportsFrameDuration:", buf))
  {
    memset(buf, 0, sizeof(buf));
    [v5 setActiveVideoMinFrameDuration:buf];
    memset(buf, 0, sizeof(buf));
    [v5 setActiveVideoMaxFrameDuration:buf];
    memset(buf, 0, sizeof(buf));
    [v6 setVideoMinFrameDurationOverride:buf];
  }
  else
  {
    *(_OWORD *)buf = *MEMORY[0x263F01090];
    long long v12 = *(_OWORD *)buf;
    *(void *)&buf[16] = *(void *)(MEMORY[0x263F01090] + 16);
    uint64_t v9 = *(void *)&buf[16];
    [v6 setVideoMinFrameDurationOverride:buf];
    *(_OWORD *)buf = v12;
    *(void *)&buf[16] = v9;
    [v5 setActiveVideoMinFrameDuration:buf];
    *(_OWORD *)buf = v12;
    *(void *)&buf[16] = v9;
    [v5 setActiveVideoMaxFrameDuration:buf];
    if (v5)
    {
      [v5 activeVideoMinFrameDuration];
      [v5 activeVideoMaxFrameDuration];
    }
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      switch(v8)
      {
        case 0:
          v11 = @"Auto";
          break;
        case 1:
          v11 = @"1080p60";
          break;
        case 2:
          v11 = @"720p120";
          break;
        case 3:
          v11 = @"720p240";
          break;
        case 4:
          v11 = @"1080p120";
          break;
        case 5:
          v11 = @"4k30";
          break;
        case 6:
          v11 = @"720p30";
          break;
        case 7:
          v11 = @"1080p30";
          break;
        case 8:
          v11 = @"1080p240";
          break;
        case 9:
          v11 = @"4k60";
          break;
        case 10:
          v11 = @"4k24";
          break;
        case 11:
          v11 = @"1080p25";
          break;
        case 12:
          v11 = @"4k25";
          break;
        case 13:
          v11 = @"4k120";
          break;
        case 14:
          v11 = @"4k100";
          break;
        default:
          switch(v8)
          {
            case 10000:
              v11 = @"ImagePickerHigh";
              break;
            case 10001:
              v11 = @"ImagePickerMedium";
              break;
            case 10002:
              v11 = @"ImagePickerLow";
              break;
            case 10003:
              v11 = @"ImagePickerVGA";
              break;
            case 10004:
              v11 = @"ImagePickeriFrame720p";
              break;
            case 10005:
              v11 = @"ImagePickeriFrame540p";
              break;
            default:
              v11 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 134218754;
      *(void *)&buf[4] = 0 / 0;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0 / 0;
      *(_WORD *)&buf[22] = 2114;
      v14 = v11;
      __int16 v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Resetting video min/max framerate to %ld/%ld for configuration %{public}@ and current format %{public}@", buf, 0x2Au);
    }
  }
}

- (int64_t)_videoConfiguration
{
  return self->__videoConfiguration;
}

@end