@interface CAMVideoRecordOrientationCommand
- (BOOL)_isEnabled;
- (CAMVideoRecordOrientationCommand)initWithCoder:(id)a3;
- (CAMVideoRecordOrientationCommand)initWithEnabled:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMVideoRecordOrientationCommand

- (CAMVideoRecordOrientationCommand)initWithEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoRecordOrientationCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  v4 = [a3 currentMovieFileOutput];
  v5 = [v4 connectionWithMediaType:*MEMORY[0x263EF9D48]];
  BOOL v6 = [(CAMVideoRecordOrientationCommand *)self _isEnabled];
  if (v5)
  {
    [v4 setRecordsVideoOrientationAndMirroringChanges:v6 asMetadataTrackForConnection:v5];
  }
  else if (v6)
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v8 = 0;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Unable to opt-in to video orientation and mirroring timed metadata, the connection is invalid.", v8, 2u);
    }
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMVideoRecordOrientationCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoRecordOrientationCommand;
  v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__enabled = [v4 decodeBoolForKey:@"CAMVideoRecordOrientationCommandEnabled"];
    BOOL v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMVideoRecordOrientationCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoRecordOrientationCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMVideoRecordOrientationCommandEnabled");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMVideoRecordOrientationCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMVideoRecordOrientationCommand *)self _isEnabled];
  return v4;
}

@end