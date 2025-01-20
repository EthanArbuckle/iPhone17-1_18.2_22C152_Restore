@interface CAMIrisVideoRecordingCommand
- (BOOL)_isEnabled;
- (CAMIrisVideoRecordingCommand)initWithCoder:(id)a3;
- (CAMIrisVideoRecordingCommand)initWithVideoRecordingEnabled:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMIrisVideoRecordingCommand

- (CAMIrisVideoRecordingCommand)initWithVideoRecordingEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMIrisVideoRecordingCommand;
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
  id v5 = [a3 currentStillImageOutput];
  BOOL v4 = [(CAMIrisVideoRecordingCommand *)self _isEnabled];
  if ([v5 isLivePhotoCaptureSupported]) {
    [v5 setLivePhotoCaptureEnabled:v4];
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMIrisVideoRecordingCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMIrisVideoRecordingCommand;
  id v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__enabled = [v4 decodeBoolForKey:@"CAMIrisVideoRecordingCommandEnabled"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMIrisVideoRecordingCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMIrisVideoRecordingCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMIrisVideoRecordingCommandEnabled");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMIrisVideoRecordingCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMIrisVideoRecordingCommand *)self _isEnabled];
  return v4;
}

@end