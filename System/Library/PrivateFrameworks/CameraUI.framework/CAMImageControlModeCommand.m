@interface CAMImageControlModeCommand
- (BOOL)_capturing;
- (CAMImageControlModeCommand)initWithCaptureMode:(int64_t)a3 capturing:(BOOL)a4;
- (CAMImageControlModeCommand)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_captureMode;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMImageControlModeCommand

- (void)executeWithContext:(id)a3
{
  v4 = [a3 currentVideoDevice];
  unint64_t v5 = [(CAMImageControlModeCommand *)self _captureMode];
  if (v5 <= 9)
  {
    if (((1 << v5) & 0x3D7) != 0)
    {
      [v4 setAutomaticallyAdjustsImageControlMode:1];
      goto LABEL_4;
    }
    if (v5 == 3)
    {
      if ([v4 isImageControlModeSupported:4])
      {
        [v4 setAutomaticallyAdjustsImageControlMode:0];
        v6 = v4;
        uint64_t v7 = 4;
LABEL_18:
        [v6 setImageControlMode:v7];
        goto LABEL_4;
      }
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        v10 = "Unable to set the proper image control mode for panorama, results will be unexpected!";
        v11 = (uint8_t *)&v13;
LABEL_23:
        _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else
    {
      if ([v4 isImageControlModeSupported:5]
        && [v4 isImageControlModeSupported:6])
      {
        if ([(CAMImageControlModeCommand *)self _capturing]) {
          uint64_t v8 = 6;
        }
        else {
          uint64_t v8 = 5;
        }
      }
      else
      {
        uint64_t v8 = 2;
      }
      if ([v4 isImageControlModeSupported:v8])
      {
        if ([v4 isTorchModeSupported:0]) {
          [v4 setTorchMode:0];
        }
        [v4 setAutomaticallyAdjustsImageControlMode:0];
        v6 = v4;
        uint64_t v7 = v8;
        goto LABEL_18;
      }
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        v10 = "Unable to set the proper image control mode for timelapse, results will be unexpected!";
        v11 = (uint8_t *)&v12;
        goto LABEL_23;
      }
    }
  }
LABEL_4:
}

- (int64_t)_captureMode
{
  return self->__captureMode;
}

- (CAMImageControlModeCommand)initWithCaptureMode:(int64_t)a3 capturing:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CAMImageControlModeCommand;
  v6 = [(CAMCaptureCommand *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->__captureMode = a3;
    v6->__capturing = a4;
    uint64_t v8 = v6;
  }

  return v7;
}

- (CAMImageControlModeCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMImageControlModeCommand;
  unint64_t v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__captureMode = [v4 decodeIntegerForKey:@"CAMImageControlModeCommandCaptureMode"];
    v5->__capturing = [v4 decodeBoolForKey:@"CAMImageControlModeCommandCapturing"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMImageControlModeCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMImageControlModeCommand _captureMode](self, "_captureMode", v5.receiver, v5.super_class), @"CAMImageControlModeCommandCaptureMode");
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMImageControlModeCommand _capturing](self, "_capturing"), @"CAMImageControlModeCommandCapturing");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMImageControlModeCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[4] = [(CAMImageControlModeCommand *)self _captureMode];
  *((unsigned char *)v4 + 24) = [(CAMImageControlModeCommand *)self _capturing];
  return v4;
}

- (BOOL)_capturing
{
  return self->__capturing;
}

@end