@interface CAMMaximumPhotoResolutionCommand
- (CAMMaximumPhotoResolutionCommand)initWithCoder:(id)a3;
- (CAMMaximumPhotoResolutionCommand)initWithMaximumPhotoResolution:(int64_t)a3;
- (CAMMaximumPhotoResolutionCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_maximumPhotoResolution;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMMaximumPhotoResolutionCommand

- (CAMMaximumPhotoResolutionCommand)initWithMaximumPhotoResolution:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMMaximumPhotoResolutionCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->__maximumPhotoResolution = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMMaximumPhotoResolutionCommand)initWithSubcommands:(id)a3
{
  return [(CAMMaximumPhotoResolutionCommand *)self initWithMaximumPhotoResolution:0];
}

- (CAMMaximumPhotoResolutionCommand)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"CAMMaximumPhotoResolutionKey"];
  return [(CAMMaximumPhotoResolutionCommand *)self initWithMaximumPhotoResolution:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMMaximumPhotoResolutionCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMMaximumPhotoResolutionCommand _maximumPhotoResolution](self, "_maximumPhotoResolution", v5.receiver, v5.super_class), @"CAMMaximumPhotoResolutionKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMMaximumPhotoResolutionCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[3] = [(CAMMaximumPhotoResolutionCommand *)self _maximumPhotoResolution];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 currentStillImageOutput];
  if ([(CAMMaximumPhotoResolutionCommand *)self _maximumPhotoResolution])
  {
    objc_super v6 = [v4 currentVideoDeviceFormat];
    v7 = [v6 supportedMaxPhotoDimensionsPrivate];

    if ([v7 count])
    {
      $2825F4736939C4A6D3AD43837233062D v10 = +[CAMCaptureConversions CMVideoDimensionsForCAMPhotoResolution:[(CAMMaximumPhotoResolutionCommand *)self _maximumPhotoResolution]];
      objc_super v8 = [MEMORY[0x263F08D40] valueWithBytes:&v10 objCType:"{?=ii}"];
      if ([v7 containsObject:v8])
      {
        [v5 setMaxPhotoDimensions:v10];
      }
      else
      {
        v9 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          int var0 = v10.var0;
          __int16 v13 = 1024;
          int var1 = v10.var1;
          _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "supportedMaxPhotoDimensions did not contain desired max photo dimensions (%d, %d)! Not setting AVCapturePhotoOutput maxPhotoDimensions", buf, 0xEu);
        }
      }
    }
    else
    {
      objc_super v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "current AVCaptureDeviceFormat has no supportedMaxPhotoDimensions! Not setting AVCapturePhotoOutput maxPhotoDimensions", buf, 2u);
      }
    }
  }
}

- (int64_t)_maximumPhotoResolution
{
  return self->__maximumPhotoResolution;
}

@end