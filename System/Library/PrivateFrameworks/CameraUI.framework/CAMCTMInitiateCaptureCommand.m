@interface CAMCTMInitiateCaptureCommand
- (CAMCTMInitiateCaptureCommand)initWithCoder:(id)a3;
- (CAMCTMInitiateCaptureCommand)initWithSettings:(id)a3;
- (CAMStillImageCaptureRequest)_settings;
- (id)_momentSettingsWithContext:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMCTMInitiateCaptureCommand

- (CAMCTMInitiateCaptureCommand)initWithSettings:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMCTMInitiateCaptureCommand;
  v6 = [(CAMCaptureCommand *)&v10 initWithSubcommands:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__settings, a3);
    v8 = v7;
  }

  return v7;
}

- (CAMCTMInitiateCaptureCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMCTMInitiateCaptureCommand;
  id v5 = [(CAMCaptureCommand *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"CAMCTMInitiateCaptureCommandSettings"];
    settings = v5->__settings;
    v5->__settings = (CAMStillImageCaptureRequest *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCTMInitiateCaptureCommand *)self _settings];
  [v4 encodeObject:v5 forKey:@"CAMCTMInitiateCaptureCommandSettings"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMCTMInitiateCaptureCommand;
  id v4 = [(CAMCaptureCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(CAMCTMInitiateCaptureCommand *)self _settings];
  uint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 currentStillImageOutput];
  uint64_t v6 = [v4 currentStillImageDelegate];
  v7 = [(CAMCTMInitiateCaptureCommand *)self _momentSettingsWithContext:v4];
  objc_super v8 = [(CAMCTMInitiateCaptureCommand *)self _settings];
  if ([v8 needsLivePhotoCaptureResumedOnPhotoOutput:v5]) {
    [v5 setLivePhotoCaptureSuspended:0];
  }
  v9 = [v8 persistenceUUID];
  [v4 cacheMomentCaptureSettings:v7 forIdentifier:v9];
  if ([v5 isMovieRecordingEnabled])
  {
    [v5 beginMomentCaptureWithSettings:v7 delegate:v6];
    objc_super v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      uint64_t v12 = [v7 uniqueID];
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "captureID:%lld Called beginMomentCaptureWithSettings:", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    objc_super v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CAMCTMInitiateCaptureCommand executeWithContext:](v7, v10);
    }
  }
}

- (id)_momentSettingsWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMCTMInitiateCaptureCommand *)self _settings];
  uint64_t v6 = [v4 currentVideoDevice];
  if ([v6 isTorchAvailable]) {
    uint64_t v7 = [v5 torchMode];
  }
  else {
    uint64_t v7 = 0;
  }
  objc_super v8 = [v5 capturePhotoSettingsWithContext:v4];
  v9 = [MEMORY[0x263EFA770] settingsWithPhotoSettings:v8];
  objc_msgSend(v9, "setTorchMode:", +[CAMCaptureConversions captureTorchModeForTorchMode:](CAMCaptureConversions, "captureTorchModeForTorchMode:", v7));
  objc_super v10 = [v9 bravoCameraSelectionBehaviorForRecording];
  if (([v10 isEqualToString:*MEMORY[0x263EF9608]] & 1) == 0)
  {
    int v11 = [v5 disablesCameraSwitchingDuringRecording];
    uint64_t v12 = (id *)MEMORY[0x263EF95F8];
    if (!v11) {
      uint64_t v12 = (id *)MEMORY[0x263EF9600];
    }
    id v13 = *v12;

    [v9 setBravoCameraSelectionBehaviorForRecording:v13];
    objc_super v10 = v13;
  }

  return v9;
}

- (CAMStillImageCaptureRequest)_settings
{
  return self->__settings;
}

- (void).cxx_destruct
{
}

- (void)executeWithContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 uniqueID];
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "captureID:%lld Attempting to beginMomentCaptureWithSettings but movieRecordingEnabled = NO!", (uint8_t *)&v3, 0xCu);
}

@end