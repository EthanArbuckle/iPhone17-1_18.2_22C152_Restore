@interface CAMFaceDrivenImageProcessingCommand
- (BOOL)isFaceDrivenImageProcessingEnabled;
- (CAMFaceDrivenImageProcessingCommand)initWithCoder:(id)a3;
- (CAMFaceDrivenImageProcessingCommand)initWithFaceDrivenImageProcessingEnabled:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMFaceDrivenImageProcessingCommand

- (CAMFaceDrivenImageProcessingCommand)initWithFaceDrivenImageProcessingEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMFaceDrivenImageProcessingCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_faceDrivenImageProcessingEnabled = a3;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMFaceDrivenImageProcessingCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMFaceDrivenImageProcessingCommand *)self isFaceDrivenImageProcessingEnabled];
  return v4;
}

- (BOOL)isFaceDrivenImageProcessingEnabled
{
  return self->_faceDrivenImageProcessingEnabled;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 currentVideoDevice];
  if ([v5 isFaceDetectionSupported])
  {
    BOOL v6 = [(CAMFaceDrivenImageProcessingCommand *)self isFaceDrivenImageProcessingEnabled];
    uint64_t v7 = [v4 currentMovieFileOutput];
    objc_super v8 = v7;
    if (v7) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v6;
    }
    if (v7 && v6) {
      uint64_t v9 = [v5 isFaceDetectionDuringVideoPreviewSupported];
    }
    if (v9 != [v5 isFaceDetectionDrivenImageProcessingEnabled]) {
      [v5 setFaceDetectionDrivenImageProcessingEnabled:v9];
    }
  }
  else
  {
    objc_super v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CAMFaceDrivenImageProcessingCommand executeWithContext:](v8);
    }
  }
}

- (CAMFaceDrivenImageProcessingCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMFaceDrivenImageProcessingCommand;
  v5 = [(CAMCaptureCommand *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_faceDrivenImageProcessingEnabled = [v4 decodeBoolForKey:@"CAMFaceDrivenImageProcessingCommandEnabled"];
    BOOL v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMFaceDrivenImageProcessingCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMFaceDrivenImageProcessingCommand isFaceDrivenImageProcessingEnabled](self, "isFaceDrivenImageProcessingEnabled", v5.receiver, v5.super_class), @"CAMFaceDrivenImageProcessingCommandEnabled");
}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "Attempted to execute a face detection command on a device which doesn't support face detection – ignoring the command", v1, 2u);
}

@end