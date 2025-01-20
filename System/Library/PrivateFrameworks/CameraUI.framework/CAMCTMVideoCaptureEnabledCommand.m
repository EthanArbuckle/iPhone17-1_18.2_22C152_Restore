@interface CAMCTMVideoCaptureEnabledCommand
- (BOOL)_isEnabled;
- (CAMCTMVideoCaptureEnabledCommand)initWithCoder:(id)a3;
- (CAMCTMVideoCaptureEnabledCommand)initWithEnabled:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMCTMVideoCaptureEnabledCommand

- (CAMCTMVideoCaptureEnabledCommand)initWithEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMCTMVideoCaptureEnabledCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMCTMVideoCaptureEnabledCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMCTMVideoCaptureEnabledCommand;
  v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__enabled = [v4 decodeBoolForKey:@"CAMCTMVideoCaptureEnabledCommandEnabled"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMCTMVideoCaptureEnabledCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMCTMVideoCaptureEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMCTMVideoCaptureEnabledCommandEnabled");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMCTMVideoCaptureEnabledCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMCTMVideoCaptureEnabledCommand *)self _isEnabled];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = [a3 currentStillImageOutput];
  BOOL v5 = [(CAMCTMVideoCaptureEnabledCommand *)self _isEnabled];
  if ([v4 isMovieRecordingSupported])
  {
    [v4 setMovieRecordingEnabled:v5];
  }
  else if (v5)
  {
    objc_super v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CAMCTMVideoCaptureEnabledCommand executeWithContext:](v6);
    }
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Attempting to set AVCapturePhotoOutput movieRecordingEnabled = YES, but isMovieRecordingSupported = NO", v1, 2u);
}

@end