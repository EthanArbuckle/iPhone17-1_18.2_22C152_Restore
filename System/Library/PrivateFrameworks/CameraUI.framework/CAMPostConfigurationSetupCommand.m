@interface CAMPostConfigurationSetupCommand
- (CAMCaptureGraphConfiguration)graphConfiguration;
- (CAMPostConfigurationSetupCommand)initWithCoder:(id)a3;
- (CAMPostConfigurationSetupCommand)initWithGraphConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_configure48MPZSL:(id)a3;
- (void)_configureAudioConfigurationForContext:(id)a3;
- (void)_configureAudioSessionMixesWithOthersForContext:(id)a3;
- (void)_configureAudioWindNoiseRemovalEnabledForContext:(id)a3;
- (void)_configureControlCenterVideoEffectsForContext:(id)a3;
- (void)_configureLivePhotoPreservationSuspension:(id)a3;
- (void)_configureSmoothZoomingForContext:(id)a3;
- (void)_configureSpatialPhotoCaptureEnabled:(id)a3;
- (void)_configureStereoVideoCaptureEnabled:(id)a3;
- (void)_configureTrueVideoEnabled:(id)a3;
- (void)_configureVideoGreenGhostMitigationForContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPostConfigurationSetupCommand

- (CAMPostConfigurationSetupCommand)initWithGraphConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMPostConfigurationSetupCommand;
  v6 = [(CAMCaptureCommand *)&v10 initWithSubcommands:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphConfiguration, a3);
    v8 = v7;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMPostConfigurationSetupCommand;
  v4 = [(CAMCaptureCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(CAMPostConfigurationSetupCommand *)self graphConfiguration];
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (CAMPostConfigurationSetupCommand)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CAMPostConfigurationSetupCommand;
  [(CAMCaptureCommand *)&v3 encodeWithCoder:a3];
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"NSCoding not implemented"];
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  [(CAMPostConfigurationSetupCommand *)self _configureControlCenterVideoEffectsForContext:v4];
  [(CAMPostConfigurationSetupCommand *)self _configureSmoothZoomingForContext:v4];
  [(CAMPostConfigurationSetupCommand *)self _configureVideoGreenGhostMitigationForContext:v4];
  [(CAMPostConfigurationSetupCommand *)self _configureLivePhotoPreservationSuspension:v4];
  [(CAMPostConfigurationSetupCommand *)self _configureAudioSessionMixesWithOthersForContext:v4];
  [(CAMPostConfigurationSetupCommand *)self _configureStereoVideoCaptureEnabled:v4];
  [(CAMPostConfigurationSetupCommand *)self _configureAudioConfigurationForContext:v4];
  [(CAMPostConfigurationSetupCommand *)self _configureAudioWindNoiseRemovalEnabledForContext:v4];
  [(CAMPostConfigurationSetupCommand *)self _configureSpatialPhotoCaptureEnabled:v4];
  [(CAMPostConfigurationSetupCommand *)self _configureTrueVideoEnabled:v4];
  [(CAMPostConfigurationSetupCommand *)self _configure48MPZSL:v4];
}

- (void)_configureControlCenterVideoEffectsForContext:(id)a3
{
  id v3 = [a3 currentVideoDeviceInput];
  [v3 setBackgroundBlurAllowed:0];
  [v3 setCenterStageAllowed:0];
}

- (void)_configureSmoothZoomingForContext:(id)a3
{
  id v4 = [a3 currentMovieFileOutput];
  id v3 = [v4 connectionWithMediaType:*MEMORY[0x263EF9D48]];
  if ([v3 isVideoZoomSmoothingSupported]) {
    objc_msgSend(v3, "setVideoZoomSmoothingEnabled:", objc_msgSend(v3, "isVideoZoomSmoothingSupported"));
  }
}

- (void)_configureVideoGreenGhostMitigationForContext:(id)a3
{
  id v4 = [a3 currentMovieFileOutput];
  id v3 = [v4 connectionWithMediaType:*MEMORY[0x263EF9D48]];
  if ([v3 isVideoGreenGhostMitigationSupported]) {
    [v3 setVideoGreenGhostMitigationEnabled:1];
  }
}

- (void)_configureLivePhotoPreservationSuspension:(id)a3
{
  id v3 = [a3 currentStillImageOutput];
  if [v3 isLivePhotoCaptureSupported] && (objc_opt_respondsToSelector()) {
    [v3 setPreservesLivePhotoCaptureSuspendedOnSessionStop:1];
  }
}

- (void)_configureAudioSessionMixesWithOthersForContext:(id)a3
{
  id v5 = [a3 currentCaptureSession];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(CAMPostConfigurationSetupCommand *)self graphConfiguration];
    objc_msgSend(v5, "setConfiguresApplicationAudioSessionToMixWithOthers:", objc_msgSend(v4, "mixAudioWithOthers"));
  }
}

- (void)_configureStereoVideoCaptureEnabled:(id)a3
{
  id v4 = a3;
  id v12 = [v4 currentMovieFileOutput];
  id v5 = [v4 currentVideoDeviceInput];

  if (v12 && v5)
  {
    v6 = [(CAMPostConfigurationSetupCommand *)self graphConfiguration];
    uint64_t v7 = [v6 enableStereoVideoCapture];

    objc_super v8 = +[CAMCaptureCapabilities capabilities];
    int v9 = [v8 isSpatialModeSupported];

    if (v9)
    {
      objc_super v10 = [(CAMPostConfigurationSetupCommand *)self graphConfiguration];
      uint64_t v11 = [v10 mode];

      if (v11 == 8) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = v7;
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v12 isStereoVideoCaptureSupported]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v12 setStereoVideoCaptureEnabled:v7];
    }
  }
}

- (void)_configureAudioConfigurationForContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = [a3 currentAudioDeviceInput];
  if (v4)
  {
    id v5 = [(CAMPostConfigurationSetupCommand *)self graphConfiguration];
    uint64_t v6 = [v5 audioConfiguration];

    int64_t v7 = +[CAMCaptureConversions AVCaptureDeviceAudioCaptureModeForCAMAudioConfiguration:v6];
    int v8 = [v4 isAudioCaptureModeSupported:v7];
    if (v8) {
      BOOL v9 = v6 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if ((v8 & 1) == 0)
      {
        objc_super v10 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [NSNumber numberWithInteger:v7];
          int v12 = 138543362;
          v13 = v11;
          _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Requested audio capture mode not supported: %{public}@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
    else
    {
      [v4 setAudioCaptureMode:v7];
    }
  }
}

- (void)_configureAudioWindNoiseRemovalEnabledForContext:(id)a3
{
  id v4 = [a3 currentAudioDeviceInput];
  id v5 = v4;
  if (v4)
  {
    int64_t v7 = v4;
    id v4 = (void *)[v4 isWindNoiseRemovalSupported];
    id v5 = v7;
    if (v4)
    {
      uint64_t v6 = [(CAMPostConfigurationSetupCommand *)self graphConfiguration];
      objc_msgSend(v7, "setWindNoiseRemovalEnabled:", objc_msgSend(v6, "windNoiseRemovalEnabled"));

      id v5 = v7;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_configureSpatialPhotoCaptureEnabled:(id)a3
{
  id v6 = [a3 currentStillImageOutput];
  if (v6)
  {
    id v4 = [(CAMPostConfigurationSetupCommand *)self graphConfiguration];
    uint64_t v5 = [v4 mode];

    if ([v6 isSpatialPhotoCaptureSupported]) {
      [v6 setSpatialPhotoCaptureEnabled:v5 == 9];
    }
  }
}

- (void)_configureTrueVideoEnabled:(id)a3
{
  id v4 = [a3 currentMovieFileOutput];
  uint64_t v5 = v4;
  if (v4)
  {
    int64_t v7 = v4;
    id v4 = (void *)[v4 isTrueVideoCaptureSupported];
    uint64_t v5 = v7;
    if (v4)
    {
      id v6 = [(CAMPostConfigurationSetupCommand *)self graphConfiguration];
      objc_msgSend(v7, "setTrueVideoCaptureEnabled:", objc_msgSend(v6, "trueVideoEnabled"));

      uint64_t v5 = v7;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_configure48MPZSL:(id)a3
{
  id v4 = [a3 currentStillImageOutput];
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v5 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[CAMUltraHighResolutionZeroShutterLagEnabledCommand executeWithContext:](v5);
      }
      goto LABEL_8;
    }
    if ([v4 isUltraHighResolutionZeroShutterLagSupported])
    {
      uint64_t v5 = [(CAMPostConfigurationSetupCommand *)self graphConfiguration];
      objc_msgSend(v4, "setUltraHighResolutionZeroShutterLagSupportEnabled:", -[NSObject maximumPhotoResolution](v5, "maximumPhotoResolution") == 3);
LABEL_8:
    }
  }
}

- (CAMCaptureGraphConfiguration)graphConfiguration
{
  return self->_graphConfiguration;
}

- (void).cxx_destruct
{
}

@end