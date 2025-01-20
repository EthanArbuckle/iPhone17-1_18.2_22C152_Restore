@interface CAMVideoRecordingCameraSelectionBehaviorCommand
- (BOOL)_isCameraSwitchingEnabled;
- (CAMVideoRecordingCameraSelectionBehaviorCommand)initWithCameraSwitchingEnabled:(BOOL)a3;
- (CAMVideoRecordingCameraSelectionBehaviorCommand)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMVideoRecordingCameraSelectionBehaviorCommand

- (CAMVideoRecordingCameraSelectionBehaviorCommand)initWithCameraSwitchingEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoRecordingCameraSelectionBehaviorCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__cameraSwitchingEnabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMVideoRecordingCameraSelectionBehaviorCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoRecordingCameraSelectionBehaviorCommand;
  v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__cameraSwitchingEnabled = [v4 decodeBoolForKey:@"CAMVideoRecordingCameraSelectionBehaviorCommandCameraSwitchingEnabled"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMVideoRecordingCameraSelectionBehaviorCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoRecordingCameraSelectionBehaviorCommand _isCameraSwitchingEnabled](self, "_isCameraSwitchingEnabled", v5.receiver, v5.super_class), @"CAMVideoRecordingCameraSelectionBehaviorCommandCameraSwitchingEnabled");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMVideoRecordingCameraSelectionBehaviorCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMVideoRecordingCameraSelectionBehaviorCommand *)self _isCameraSwitchingEnabled];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  id v9 = [v4 currentVideoDevice];
  objc_super v5 = [v4 currentMovieFileOutput];

  BOOL v6 = [(CAMVideoRecordingCameraSelectionBehaviorCommand *)self _isCameraSwitchingEnabled];
  v7 = [v9 bravoCameraSelectionBehavior];
  if (([v7 isEqualToString:*MEMORY[0x263EF9608]] & 1) == 0)
  {
    objc_super v8 = (void *)MEMORY[0x263EF9600];
    if (!v6) {
      objc_super v8 = (void *)MEMORY[0x263EF95F8];
    }
    [v5 setBravoCameraSelectionBehaviorForRecording:*v8];
  }
}

- (BOOL)_isCameraSwitchingEnabled
{
  return self->__cameraSwitchingEnabled;
}

@end