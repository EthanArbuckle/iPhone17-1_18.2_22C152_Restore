@interface CAMPausePairedVideoRecordingCommand
- (BOOL)_isRecordingPaused;
- (CAMPausePairedVideoRecordingCommand)initWithCoder:(id)a3;
- (CAMPausePairedVideoRecordingCommand)initWithRecordingPaused:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPausePairedVideoRecordingCommand

- (CAMPausePairedVideoRecordingCommand)initWithRecordingPaused:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMPausePairedVideoRecordingCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->__recordingPaused = a3;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMPausePairedVideoRecordingCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMPausePairedVideoRecordingCommand *)self _isRecordingPaused];
  return v4;
}

- (BOOL)_isRecordingPaused
{
  return self->__recordingPaused;
}

- (void)executeWithContext:(id)a3
{
  id v6 = [a3 currentStillImageOutput];
  int v4 = [v6 isLivePhotoCaptureSupported];
  int v5 = [v6 isLivePhotoCaptureEnabled];
  if (v4 && v5) {
    objc_msgSend(v6, "setLivePhotoCaptureSuspended:", -[CAMPausePairedVideoRecordingCommand _isRecordingPaused](self, "_isRecordingPaused"));
  }
}

- (CAMPausePairedVideoRecordingCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMPausePairedVideoRecordingCommand;
  int v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__recordingPaused = [v4 decodeBoolForKey:@"CAMPausePairedVideoRecordingCommandPaused"];
    id v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPausePairedVideoRecordingCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMPausePairedVideoRecordingCommand _isRecordingPaused](self, "_isRecordingPaused", v5.receiver, v5.super_class), @"CAMPausePairedVideoRecordingCommandPaused");
}

@end