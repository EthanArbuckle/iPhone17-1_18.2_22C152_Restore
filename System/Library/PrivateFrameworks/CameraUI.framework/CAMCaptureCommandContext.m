@interface CAMCaptureCommandContext
- (AVCaptureDevice)currentAudioDevice;
- (AVCaptureDevice)currentVideoDevice;
- (AVCaptureDeviceFormat)currentDepthDataFormat;
- (AVCaptureDeviceFormat)currentVideoDeviceFormat;
- (AVCaptureDeviceInput)currentAudioDeviceInput;
- (AVCaptureDeviceInput)currentVideoDeviceInput;
- (AVCaptureFileOutputRecordingDelegate)currentRecordingDelegate;
- (AVCaptureMetadataOutput)currentMetadataOutput;
- (AVCaptureMovieFileOutput)currentMovieFileOutput;
- (AVCapturePhotoCaptureDelegate)currentStillImageDelegate;
- (AVCapturePhotoOutput)currentStillImageOutput;
- (AVCaptureSession)currentCaptureSession;
- (AVCaptureSlider)apertureSlider;
- (AVCaptureSlider)emulatedZoomSlider;
- (AVCaptureSystemExposureBiasSlider)systemExposureBiasSlider;
- (AVCaptureSystemLensSelector)lensSelector;
- (AVCaptureSystemLensSelector)systemLensSelector;
- (AVCaptureSystemZoomSlider)systemZoomSlider;
- (AVCaptureVideoDataOutput)currentEffectsPreviewOutput;
- (AVCaptureVideoPreviewLayer)currentVideoPreviewLayer;
- (AVCaptureVideoThumbnailOutput)currentVideoThumbnailOutput;
- (AVMomentCaptureMovieRecordingDelegate)currentMomentCaptureMovieRecordingDelegate;
- (BOOL)_shouldEnableApertureSliderForMode:(int64_t)a3 devicePosition:(int64_t)a4 recording:(BOOL)a5;
- (BOOL)_shouldEnableLensSelectorForMode:(int64_t)a3 devicePosition:(int64_t)a4 recording:(BOOL)a5;
- (BOOL)_shouldEnableSystemExposureForRecording:(BOOL)a3 mode:(int64_t)a4;
- (BOOL)_shouldEnableSystemStylePickerForMode:(int64_t)a3 recording:(BOOL)a4;
- (BOOL)_shouldEnableSystemZoomSliderForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (BOOL)_shouldEnableToneBiasForMode:(int64_t)a3 recording:(BOOL)a4;
- (CAMCaptureCommandContext)initWithCaptureEngine:(id)a3;
- (CAMCaptureEngine)_captureEngine;
- (CAMPanoramaConfiguration)currentPanoramaConfiguration;
- (CAMPanoramaOutput)currentPanoramaOutput;
- (NSString)currentVideoDevicePreset;
- (id)_captureEngineDeviceForMode:(int64_t)a3 desiredDevice:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 spatialVideoEnabled:(BOOL)a7 resolvedDevice:(int64_t *)a8;
- (id)_metadataOutputForMode:(int64_t)a3;
- (id)audioDeviceInput;
- (id)cachedMomentCaptureSettingsForIdentifier:(id)a3;
- (id)controlsForGraphConfiguration:(id)a3 recording:(BOOL)a4;
- (id)outputsForGraphConfiguration:(id)a3;
- (id)primaryOutputForMode:(int64_t)a3;
- (void)cacheMomentCaptureSettings:(id)a3 forIdentifier:(id)a4;
- (void)clear;
- (void)clearCachedMomentCaptureSettingsForIdentifier:(id)a3;
- (void)registerStillImageCaptureRequest:(id)a3 withSettings:(id)a4;
- (void)registerVideoCaptureRequest:(id)a3;
- (void)registerVideoEndZoomFactor:(double)a3;
- (void)setApertureSlider:(id)a3;
- (void)setCurrentAudioDevice:(id)a3;
- (void)setCurrentAudioDeviceInput:(id)a3;
- (void)setCurrentCaptureSession:(id)a3;
- (void)setCurrentDepthDataFormat:(id)a3;
- (void)setCurrentEffectsPreviewOutput:(id)a3;
- (void)setCurrentMetadataOutput:(id)a3;
- (void)setCurrentMovieFileOutput:(id)a3;
- (void)setCurrentPanoramaOutput:(id)a3;
- (void)setCurrentStillImageOutput:(id)a3;
- (void)setCurrentVideoDevice:(id)a3;
- (void)setCurrentVideoDeviceFormat:(id)a3;
- (void)setCurrentVideoDeviceInput:(id)a3;
- (void)setCurrentVideoDevicePreset:(id)a3;
- (void)setCurrentVideoPreviewLayer:(id)a3;
- (void)setCurrentVideoThumbnailOutput:(id)a3;
- (void)setEmulatedZoomSlider:(id)a3;
- (void)setSystemExposureBiasSlider:(id)a3;
- (void)setSystemLensSelector:(id)a3;
- (void)setSystemZoomSlider:(id)a3;
- (void)startPanoramaCaptureWithRequest:(id)a3;
- (void)stopPanoramaCaptureInterrupted:(BOOL)a3;
- (void)updateControlEnablementForFilters:(id)a3 captureMode:(int64_t)a4;
- (void)updateControlEnablementForRecording:(BOOL)a3 mode:(int64_t)a4 devicePosition:(int64_t)a5;
- (void)updateLensSelectorForRecording:(BOOL)a3 mode:(int64_t)a4 devicePosition:(int64_t)a5;
@end

@implementation CAMCaptureCommandContext

- (CAMCaptureCommandContext)initWithCaptureEngine:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMCaptureCommandContext;
  v5 = [(CAMCaptureCommandContext *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->__captureEngine, v4);
    v7 = v6;
  }

  return v6;
}

- (void)setCurrentCaptureSession:(id)a3
{
}

- (void)clear
{
  [(CAMCaptureCommandContext *)self setCurrentCaptureSession:0];
  [(CAMCaptureCommandContext *)self setCurrentVideoDevice:0];
  [(CAMCaptureCommandContext *)self setCurrentVideoDeviceFormat:0];
  [(CAMCaptureCommandContext *)self setCurrentDepthDataFormat:0];
  [(CAMCaptureCommandContext *)self setCurrentVideoDevicePreset:0];
  [(CAMCaptureCommandContext *)self setCurrentVideoDeviceInput:0];
  [(CAMCaptureCommandContext *)self setCurrentAudioDevice:0];
  [(CAMCaptureCommandContext *)self setCurrentAudioDeviceInput:0];
  [(CAMCaptureCommandContext *)self setCurrentStillImageOutput:0];
  [(CAMCaptureCommandContext *)self setCurrentMovieFileOutput:0];
  [(CAMCaptureCommandContext *)self setCurrentPanoramaOutput:0];
  [(CAMCaptureCommandContext *)self setCurrentMetadataOutput:0];
  [(CAMCaptureCommandContext *)self setCurrentEffectsPreviewOutput:0];
  [(CAMCaptureCommandContext *)self setCurrentVideoThumbnailOutput:0];
  [(CAMCaptureCommandContext *)self setSystemZoomSlider:0];
  [(CAMCaptureCommandContext *)self setSystemLensSelector:0];
  [(CAMCaptureCommandContext *)self setSystemExposureBiasSlider:0];
  [(CAMCaptureCommandContext *)self setApertureSlider:0];
  [(CAMCaptureCommandContext *)self setEmulatedZoomSlider:0];
  [(CAMCaptureCommandContext *)self setCurrentVideoPreviewLayer:0];
}

- (void)setCurrentVideoDevice:(id)a3
{
}

- (void)setCurrentVideoDeviceFormat:(id)a3
{
}

- (void)setCurrentDepthDataFormat:(id)a3
{
}

- (void)setCurrentVideoDevicePreset:(id)a3
{
}

- (void)setCurrentVideoDeviceInput:(id)a3
{
}

- (void)setCurrentAudioDevice:(id)a3
{
}

- (void)setCurrentAudioDeviceInput:(id)a3
{
}

- (void)setCurrentMovieFileOutput:(id)a3
{
}

- (void)setCurrentPanoramaOutput:(id)a3
{
}

- (void)setCurrentMetadataOutput:(id)a3
{
}

- (void)setCurrentEffectsPreviewOutput:(id)a3
{
}

- (void)setCurrentVideoThumbnailOutput:(id)a3
{
}

- (void)setCurrentVideoPreviewLayer:(id)a3
{
}

- (CAMCaptureEngine)_captureEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__captureEngine);
  return (CAMCaptureEngine *)WeakRetained;
}

- (AVCaptureSession)currentCaptureSession
{
  return self->_currentCaptureSession;
}

- (AVCaptureDeviceInput)currentVideoDeviceInput
{
  return self->_currentVideoDeviceInput;
}

- (AVCaptureDeviceInput)currentAudioDeviceInput
{
  return self->_currentAudioDeviceInput;
}

- (AVCapturePhotoOutput)currentStillImageOutput
{
  return self->_currentStillImageOutput;
}

- (AVCaptureMovieFileOutput)currentMovieFileOutput
{
  return self->_currentMovieFileOutput;
}

- (CAMPanoramaOutput)currentPanoramaOutput
{
  return self->_currentPanoramaOutput;
}

- (AVCaptureMetadataOutput)currentMetadataOutput
{
  return self->_currentMetadataOutput;
}

- (AVCaptureVideoDataOutput)currentEffectsPreviewOutput
{
  return self->_currentEffectsPreviewOutput;
}

- (AVCaptureVideoThumbnailOutput)currentVideoThumbnailOutput
{
  return self->_currentVideoThumbnailOutput;
}

- (id)primaryOutputForMode:(int64_t)a3
{
  id v4 = [(CAMCaptureCommandContext *)self _captureEngine];
  v5 = v4;
  if ((unint64_t)a3 > 9)
  {
    v7 = 0;
  }
  else
  {
    if (((1 << a3) & 0x271) != 0)
    {
      uint64_t v6 = [v4 stillImageOutput];
    }
    else
    {
      if (((1 << a3) & 0x186) != 0) {
        [v4 movieFileOutput];
      }
      else {
      uint64_t v6 = [v4 panoramaVideoDataOutput];
      }
    }
    v7 = (void *)v6;
  }

  return v7;
}

- (void)setCurrentStillImageOutput:(id)a3
{
}

- (AVCaptureDeviceFormat)currentVideoDeviceFormat
{
  return self->_currentVideoDeviceFormat;
}

- (AVCaptureDevice)currentVideoDevice
{
  return self->_currentVideoDevice;
}

- (NSString)currentVideoDevicePreset
{
  return self->_currentVideoDevicePreset;
}

- (AVCaptureVideoPreviewLayer)currentVideoPreviewLayer
{
  return self->_currentVideoPreviewLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemLensSelector, 0);
  objc_destroyWeak((id *)&self->__captureEngine);
  objc_storeStrong((id *)&self->_currentVideoPreviewLayer, 0);
  objc_storeStrong((id *)&self->_lensSelector, 0);
  objc_storeStrong((id *)&self->_emulatedZoomSlider, 0);
  objc_storeStrong((id *)&self->_apertureSlider, 0);
  objc_storeStrong((id *)&self->_systemExposureBiasSlider, 0);
  objc_storeStrong((id *)&self->_systemZoomSlider, 0);
  objc_storeStrong((id *)&self->_currentVideoThumbnailOutput, 0);
  objc_storeStrong((id *)&self->_currentEffectsPreviewOutput, 0);
  objc_storeStrong((id *)&self->_currentMetadataOutput, 0);
  objc_storeStrong((id *)&self->_currentPanoramaOutput, 0);
  objc_storeStrong((id *)&self->_currentMovieFileOutput, 0);
  objc_storeStrong((id *)&self->_currentStillImageOutput, 0);
  objc_storeStrong((id *)&self->_currentAudioDeviceInput, 0);
  objc_storeStrong((id *)&self->_currentAudioDevice, 0);
  objc_storeStrong((id *)&self->_currentVideoDeviceInput, 0);
  objc_storeStrong((id *)&self->_currentVideoDevicePreset, 0);
  objc_storeStrong((id *)&self->_currentDepthDataFormat, 0);
  objc_storeStrong((id *)&self->_currentVideoDeviceFormat, 0);
  objc_storeStrong((id *)&self->_currentVideoDevice, 0);
  objc_storeStrong((id *)&self->_currentCaptureSession, 0);
}

- (void)registerStillImageCaptureRequest:(id)a3 withSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CAMCaptureCommandContext *)self _captureEngine];
  [v8 registerStillImageCaptureRequest:v7 withSettings:v6];
}

- (AVCapturePhotoCaptureDelegate)currentStillImageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__captureEngine);
  return (AVCapturePhotoCaptureDelegate *)WeakRetained;
}

- (AVMomentCaptureMovieRecordingDelegate)currentMomentCaptureMovieRecordingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__captureEngine);
  return (AVMomentCaptureMovieRecordingDelegate *)WeakRetained;
}

- (void)cacheMomentCaptureSettings:(id)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CAMCaptureCommandContext *)self _captureEngine];
  [v8 cacheMomentCaptureSettings:v7 forIdentifier:v6];
}

- (id)cachedMomentCaptureSettingsForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CAMCaptureCommandContext *)self _captureEngine];
  id v6 = [v5 cachedMomentCaptureSettingsForIdentifier:v4];

  return v6;
}

- (void)clearCachedMomentCaptureSettingsForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCaptureCommandContext *)self _captureEngine];
  [v5 clearCachedMomentCaptureSettingsForIdentifier:v4];
}

- (void)registerVideoCaptureRequest:(id)a3
{
  id v4 = a3;
  id v7 = [(CAMCaptureCommandContext *)self _captureEngine];
  id v5 = [v7 movieFileOutput];
  id v6 = [NSDictionary dictionaryWithObject:v4 forKey:@"CAMCaptureEngineCurrentRequestKey"];
  [v5 setUserInfo:v6];
  [v7 registerVideoCaptureRequest:v4];
}

- (AVCaptureFileOutputRecordingDelegate)currentRecordingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__captureEngine);
  return (AVCaptureFileOutputRecordingDelegate *)WeakRetained;
}

- (void)registerVideoEndZoomFactor:(double)a3
{
  id v4 = [(CAMCaptureCommandContext *)self _captureEngine];
  [v4 registerVideoEndZoomFactor:a3];
}

- (CAMPanoramaConfiguration)currentPanoramaConfiguration
{
  return +[CAMPanoramaConfiguration sharedInstance];
}

- (void)startPanoramaCaptureWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCaptureCommandContext *)self _captureEngine];
  [v5 startPanoramaCaptureWithRequest:v4];
}

- (void)stopPanoramaCaptureInterrupted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMCaptureCommandContext *)self _captureEngine];
  [v4 stopPanoramaCaptureInterrupted:v3];
}

- (id)_captureEngineDeviceForMode:(int64_t)a3 desiredDevice:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 spatialVideoEnabled:(BOOL)a7 resolvedDevice:(int64_t *)a8
{
  BOOL v9 = a7;
  uint64_t v33 = *MEMORY[0x263EF8340];
  v14 = [(CAMCaptureCommandContext *)self _captureEngine];
  v15 = +[CAMCaptureCapabilities capabilities];
  unint64_t v16 = [v15 resolvedDeviceForDesiredDevice:a4 mode:a3 videoConfiguration:a5 videoStabilizationStrength:a6 spatialVideoEnabled:v9];
  switch(v16)
  {
    case 0uLL:
    case 2uLL:
      uint64_t v17 = [v14 backCameraDevice];
      goto LABEL_12;
    case 1uLL:
    case 8uLL:
      uint64_t v17 = [v14 frontCameraDevice];
      goto LABEL_12;
    case 3uLL:
      uint64_t v17 = [v14 backTelephotoCameraDevice];
      goto LABEL_12;
    case 4uLL:
      uint64_t v17 = [v14 backDualCameraDevice];
      goto LABEL_12;
    case 5uLL:
      uint64_t v17 = [v14 backSuperWideCameraDevice];
      goto LABEL_12;
    case 6uLL:
      uint64_t v17 = [v14 backWideDualCameraDevice];
      goto LABEL_12;
    case 7uLL:
      uint64_t v17 = [v14 backTripleCameraDevice];
      goto LABEL_12;
    case 9uLL:
      uint64_t v17 = [v14 frontPearlCameraDevice];
      goto LABEL_12;
    case 0xAuLL:
      uint64_t v17 = [v14 frontSuperWideCameraDevice];
      goto LABEL_12;
    case 0xBuLL:
      uint64_t v17 = [v14 systemPreferredCameraDevice];
LABEL_12:
      v18 = (void *)v17;
      if (v17)
      {
        int64_t v19 = v16;
        if (!a8) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      if (v16 - 8 < 4 || v16 == 1)
      {
        v18 = [v14 frontCameraDevice];
        v22 = @"FrontAuto";
        int64_t v19 = 1;
      }
      else
      {
LABEL_24:
        v18 = [v14 backCameraDevice];
        v22 = @"BackWide";
        int64_t v19 = 2;
      }
      v23 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        if (v16 > 0xB) {
          v24 = 0;
        }
        else {
          v24 = off_263FA2AE0[v16];
        }
        if ((unint64_t)a3 > 9) {
          v25 = 0;
        }
        else {
          v25 = off_263FA2B40[a3];
        }
        v26 = v22;
        int v27 = 138543874;
        v28 = v24;
        __int16 v29 = 2114;
        v30 = v25;
        __int16 v31 = 2114;
        v32 = v26;
        _os_log_error_impl(&dword_2099F8000, v23, OS_LOG_TYPE_ERROR, "Failed to find device %{public}@ for mode %{public}@. Falling back to %{public}@", (uint8_t *)&v27, 0x20u);
      }
      if (a8) {
LABEL_14:
      }
        *a8 = v19;
LABEL_15:

      return v18;
    default:
      goto LABEL_24;
  }
}

- (id)audioDeviceInput
{
  v2 = [(CAMCaptureCommandContext *)self _captureEngine];
  BOOL v3 = [v2 audioCaptureDeviceInput];

  return v3;
}

- (id)outputsForGraphConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCaptureCommandContext *)self _captureEngine];
  id v6 = +[CAMCaptureCapabilities capabilities];
  id v7 = [v4 videoThumbnailOutputConfiguration];

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  switch([v4 mode])
  {
    case 0:
    case 4:
    case 6:
    case 9:
      BOOL v9 = [v5 stillImageOutput];
      [v8 addObject:v9];

      if ([v6 isLiveFilteringSupported])
      {
        if (v7) {
          [v5 videoThumbnailOutput];
        }
        else {
        uint64_t v10 = [v5 effectsPreviewVideoDataOutput];
        }
        goto LABEL_11;
      }
      break;
    case 1:
    case 2:
      v11 = [v5 movieFileOutput];
      [v8 addObject:v11];

      v12 = +[CAMCaptureCapabilities capabilities];
      int v13 = objc_msgSend(v12, "isStillDuringVideoSupportedForVideoEncodingBehavior:", objc_msgSend(v4, "videoEncodingBehavior"));

      if (v13) {
        goto LABEL_7;
      }
      break;
    case 3:
      uint64_t v10 = [v5 panoramaVideoDataOutput];
      goto LABEL_11;
    case 5:
LABEL_7:
      uint64_t v10 = [v5 stillImageOutput];
      goto LABEL_11;
    case 7:
    case 8:
      uint64_t v10 = [v5 movieFileOutput];
LABEL_11:
      v14 = (void *)v10;
      [v8 addObject:v10];

      break;
    default:
      break;
  }
  v15 = -[CAMCaptureCommandContext _metadataOutputForMode:](self, "_metadataOutputForMode:", [v4 mode]);
  if (v15) {
    [v8 addObject:v15];
  }

  return v8;
}

- (id)controlsForGraphConfiguration:(id)a3 recording:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(CAMCaptureCommandContext *)self currentCaptureSession];
  if (![v7 supportsControls])
  {
    v59 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_53;
  }
  BOOL v99 = v4;
  uint64_t v8 = [v6 mode];
  uint64_t v9 = [v6 device];
  uint64_t v98 = [v6 devicePosition];
  uint64_t v10 = [(CAMCaptureCommandContext *)self _captureEngine];
  v11 = +[CAMCaptureCapabilities capabilities];
  uint64_t v12 = [v6 videoConfiguration];
  uint64_t v13 = [v6 videoStabilizationStrength];
  v14 = -[CAMCaptureCommandContext _captureEngineDeviceForMode:desiredDevice:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:resolvedDevice:](self, "_captureEngineDeviceForMode:desiredDevice:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:resolvedDevice:", v8, v9, v12, v13, [v6 enableStereoVideoCapture], 0);
  if (!v14)
  {
    v65 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      -[CAMCaptureCommandContext controlsForGraphConfiguration:recording:](v65);
    }
    v59 = (void *)MEMORY[0x263EFFA68];
    v57 = 0;
    v60 = v10;
    goto LABEL_52;
  }
  v95 = v6;
  v96 = v11;
  v92 = v10;
  v93 = v7;
  [v10 ensureControlsForGraphConfiguration:v6];
  id v90 = objc_alloc_init(MEMORY[0x263EFF980]);
  v100 = [v14 systemZoomSlider];
  v91 = v14;
  v101 = [v14 systemLensSelector];
  id v112 = 0;
  id v113 = 0;
  uint64_t v97 = v8;
  BOOL v15 = +[CAMZoomControlUtilities shouldApplyContinuousZoomForMode:v8 device:v9 videoConfiguration:v12 videoStabilizationStrength:v13 zoomFactors:&v113 displayZoomFactors:&v112];
  id v16 = v113;
  id v17 = v112;
  uint64_t v18 = v9;
  v94 = self;
  if (v15)
  {
    uint64_t v86 = v13;
    uint64_t v88 = v9;
    uint64_t v83 = v12;
    [v95 customLensGroup];
    id v84 = v16;
    int64_t v19 = v85 = v17;
    v20 = +[CAMZoomPoint zoomPointsWithFactors:displayZoomFactors:customLensGroup:](CAMZoomPoint, "zoomPointsWithFactors:displayZoomFactors:customLensGroup:", v16, v17);
    v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v22 = v20;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v108 objects:v115 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v109;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v109 != v25) {
            objc_enumerationMutation(v22);
          }
          int v27 = *(void **)(*((void *)&v108 + 1) + 8 * i);
          v28 = NSNumber;
          [v27 displayZoomFactor];
          __int16 v29 = objc_msgSend(v28, "numberWithDouble:");
          v30 = NSNumber;
          [v27 zoomFactor];
          __int16 v31 = objc_msgSend(v30, "numberWithDouble:");
          [v21 setObject:v29 forKeyedSubscript:v31];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v108 objects:v115 count:16];
      }
      while (v24);
    }

    [v100 setDisplayValuesByZoomFactorValue:v21];
    self = v94;
    uint64_t v12 = v83;
    id v16 = v84;
    uint64_t v13 = v86;
    uint64_t v18 = v88;
    id v17 = v85;
  }
  v32 = [MEMORY[0x263EFF9A0] dictionary];
  if (v98 == 1) {
    uint64_t v18 = 0;
  }
  BOOL v33 = -[CAMCaptureCommandContext _shouldEnableLensSelectorForMode:devicePosition:recording:](self, "_shouldEnableLensSelectorForMode:devicePosition:recording:", v97);
  if (v33) {
    uint64_t v34 = v18;
  }
  else {
    uint64_t v34 = 0;
  }
  if (v33) {
    uint64_t v35 = v97;
  }
  else {
    uint64_t v35 = 0;
  }
  id v106 = v17;
  id v107 = v16;
  +[CAMZoomControlUtilities shouldApplyContinuousZoomForMode:v35 device:v34 videoConfiguration:v12 videoStabilizationStrength:v13 zoomFactors:&v107 displayZoomFactors:&v106];
  id v36 = v107;

  id v37 = v106;
  v87 = v37;
  v89 = v36;
  v38 = +[CAMZoomPoint zoomPointsWithFactors:v36 displayZoomFactors:v37 customLensGroup:0];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v102 objects:v114 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v103;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v103 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = *(void **)(*((void *)&v102 + 1) + 8 * j);
        v44 = [v38 lastObject];

        if (v43 != v44)
        {
          v45 = NSNumber;
          [v43 displayZoomFactor];
          v46 = objc_msgSend(v45, "numberWithDouble:");
          v47 = NSNumber;
          if (v33) {
            [v43 zoomFactor];
          }
          else {
            [v43 displayZoomFactor];
          }
          v48 = objc_msgSend(v47, "numberWithDouble:");
          [v32 setObject:v46 forKeyedSubscript:v48];
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v102 objects:v114 count:16];
    }
    while (v40);
  }
  uint64_t v49 = v97;
  int v50 = [v96 isSupportedMode:v97 withDevice:1];
  int v52 = !v99;
  if (v98 == 1) {
    int v52 = 1;
  }
  if (v50 && v52)
  {
    v53 = (_DWORD *)MEMORY[0x263F30720];
    LODWORD(v51) = *MEMORY[0x263F30720];
    v54 = [NSNumber numberWithFloat:v51];
    LODWORD(v55) = *v53;
    v56 = [NSNumber numberWithFloat:v55];
    [v32 setObject:v54 forKeyedSubscript:v56];

    uint64_t v49 = v97;
  }
  [v101 setDisplayValuesByZoomFactorValue:v32];

  v57 = v14;
  v58 = [v14 systemExposureSlider];
  v59 = v90;
  [v90 addObject:v58];

  v60 = v92;
  v61 = [v92 apertureSlider];

  id v6 = v95;
  if (v61)
  {
    v62 = [v92 apertureSlider];
    [v90 addObject:v62];
  }
  [v90 addObject:v100];
  [v90 addObject:v101];
  if ([v96 smartStylesSupported])
  {
    char v63 = [v96 semanticStyleSupportForMode:v49 devicePosition:v98];
    if ((v63 & 8) != 0)
    {
      if ([v96 smartStylesShowExtraControls])
      {
        v66 = [v92 colorBiasSlider];
        [v90 addObject:v66];

        v67 = [v92 intensitySlider];
        [v90 addObject:v67];
      }
    }
    else if (v63)
    {
      uint64_t v64 = [v92 systemStylePicker];
LABEL_50:
      v68 = (void *)v64;
      [v90 addObject:v64];

      v69 = [v92 toneBiasSlider];
      [v90 addObject:v69];

      goto LABEL_51;
    }
    uint64_t v64 = [v92 creativeStylePicker];
    goto LABEL_50;
  }
LABEL_51:
  [v100 setEnabled:[(CAMCaptureCommandContext *)v94 _shouldEnableSystemZoomSliderForMode:v49 devicePosition:v98]];
  objc_msgSend(v101, "setEnabled:", -[CAMCaptureCommandContext _shouldEnableLensSelectorForMode:devicePosition:recording:](v94, "_shouldEnableLensSelectorForMode:devicePosition:recording:", v49, v98, v99));
  uint64_t v70 = [(CAMCaptureCommandContext *)v94 _shouldEnableSystemExposureForRecording:v99 mode:v49];
  [v91 systemExposureSlider];
  v72 = uint64_t v71 = v49;
  [v72 setEnabled:v70];

  uint64_t v73 = [(CAMCaptureCommandContext *)v94 _shouldEnableApertureSliderForMode:v71 devicePosition:v98 recording:v99];
  v74 = [v92 apertureSlider];
  [v74 setEnabled:v73];

  uint64_t v75 = [(CAMCaptureCommandContext *)v94 _shouldEnableSystemStylePickerForMode:v71 recording:v99];
  v76 = [v92 systemStylePicker];
  [v76 setEnabled:v75];

  uint64_t v77 = [(CAMCaptureCommandContext *)v94 _shouldEnableCreativeStylePickerForMode:v71 recording:v99];
  v78 = [v92 creativeStylePicker];
  [v78 setEnabled:v77];

  uint64_t v79 = v71;
  v11 = v96;
  uint64_t v80 = [(CAMCaptureCommandContext *)v94 _shouldEnableToneBiasForMode:v79 recording:v99];
  v81 = [v92 toneBiasSlider];
  [v81 setEnabled:v80];

  v65 = v100;
  id v7 = v93;
LABEL_52:

LABEL_53:
  return v59;
}

- (void)updateControlEnablementForRecording:(BOOL)a3 mode:(int64_t)a4 devicePosition:(int64_t)a5
{
  BOOL v7 = a3;
  id v22 = [(CAMCaptureCommandContext *)self currentCaptureSession];
  if ([v22 supportsControls])
  {
    uint64_t v9 = [(CAMCaptureCommandContext *)self _captureEngine];
    BOOL v10 = [(CAMCaptureCommandContext *)self _shouldEnableApertureSliderForMode:a4 devicePosition:a5 recording:v7];
    v11 = [v9 apertureSlider];
    [v11 setEnabled:v10];

    BOOL v12 = [(CAMCaptureCommandContext *)self _shouldEnableSystemExposureForRecording:v7 mode:a4];
    uint64_t v13 = [(CAMCaptureCommandContext *)self systemExposureBiasSlider];
    [v13 setEnabled:v12];

    BOOL v14 = [(CAMCaptureCommandContext *)self _shouldEnableLensSelectorForMode:a4 devicePosition:a5 recording:v7];
    BOOL v15 = [(CAMCaptureCommandContext *)self systemLensSelector];
    [v15 setEnabled:v14];

    BOOL v16 = [(CAMCaptureCommandContext *)self _shouldEnableSystemStylePickerForMode:a4 recording:v7];
    id v17 = [v9 systemStylePicker];
    [v17 setEnabled:v16];

    BOOL v18 = [(CAMCaptureCommandContext *)self _shouldEnableCreativeStylePickerForMode:a4 recording:v7];
    int64_t v19 = [v9 creativeStylePicker];
    [v19 setEnabled:v18];

    BOOL v20 = [(CAMCaptureCommandContext *)self _shouldEnableToneBiasForMode:a4 recording:v7];
    v21 = [v9 toneBiasSlider];
    [v21 setEnabled:v20];
  }
}

- (void)updateLensSelectorForRecording:(BOOL)a3 mode:(int64_t)a4 devicePosition:(int64_t)a5
{
  BOOL v7 = a3;
  id v22 = [(CAMCaptureCommandContext *)self systemLensSelector];
  uint64_t v8 = [v22 displayValuesByZoomFactorValue];
  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v8];
  BOOL v10 = +[CAMCaptureCapabilities capabilities];
  v11 = (_DWORD *)MEMORY[0x263F30720];
  LODWORD(v12) = *MEMORY[0x263F30720];
  uint64_t v13 = [NSNumber numberWithFloat:v12];
  BOOL v14 = [v8 objectForKeyedSubscript:v13];

  int v15 = [v10 isSupportedMode:a4 withDevice:1];
  BOOL v17 = a5 != 1 && v7;
  int v18 = v17 | v15 ^ 1;
  if ((v18 & 1) == 0 && !v14)
  {
    LODWORD(v16) = *v11;
    int64_t v19 = [NSNumber numberWithFloat:v16];
    LODWORD(v20) = *v11;
    v21 = [NSNumber numberWithFloat:v20];
    [v9 setObject:v19 forKeyedSubscript:v21];

LABEL_11:
    goto LABEL_12;
  }
  if (!v14) {
    int v18 = 0;
  }
  if (v18 == 1)
  {
    LODWORD(v16) = *v11;
    int64_t v19 = [NSNumber numberWithFloat:v16];
    [v9 setObject:0 forKeyedSubscript:v19];
    goto LABEL_11;
  }
LABEL_12:
  [v22 setDisplayValuesByZoomFactorValue:v9];
}

- (void)updateControlEnablementForFilters:(id)a3 captureMode:(int64_t)a4
{
  id v16 = a3;
  id v6 = [(CAMCaptureCommandContext *)self currentCaptureSession];
  if ([v6 supportsControls])
  {
    BOOL v7 = [(CAMCaptureCommandContext *)self _captureEngine];
    BOOL v8 = +[CAMEffectFilterManager isLightingEffectInFilters:v16];
    if (v8)
    {
      uint64_t v9 = [v7 systemStylePicker];
      [v9 setEnabled:0];

      BOOL v10 = 0;
    }
    else
    {
      BOOL v11 = [(CAMCaptureCommandContext *)self _shouldEnableSystemStylePickerForMode:a4 recording:0];
      double v12 = [v7 systemStylePicker];
      [v12 setEnabled:v11];

      BOOL v10 = [(CAMCaptureCommandContext *)self _shouldEnableCreativeStylePickerForMode:a4 recording:0];
    }
    uint64_t v13 = [v7 creativeStylePicker];
    [v13 setEnabled:v10];

    BOOL v14 = !v8
       && [(CAMCaptureCommandContext *)self _shouldEnableToneBiasForMode:a4 recording:0];
    int v15 = [v7 toneBiasSlider];
    [v15 setEnabled:v14];
  }
}

- (id)_metadataOutputForMode:(int64_t)a3
{
  BOOL v4 = [(CAMCaptureCommandContext *)self _captureEngine];
  id v5 = 0;
  if ((unint64_t)a3 <= 9)
  {
    if (((1 << a3) & 0x3D7) != 0
      || a3 == 5
      && (+[CAMCaptureCapabilities capabilities],
          BOOL v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 isExposureClippingIndicatorSupportedForMode:5 videoConfiguration:0],
          v7,
          id v5 = 0,
          v8))
    {
      id v5 = [v4 metadataOutput];
    }
  }

  return v5;
}

- (BOOL)_shouldEnableSystemZoomSliderForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  return (a4 != 1) & (((unint64_t)a3 > 9) | (0xD3u >> a3));
}

- (BOOL)_shouldEnableSystemExposureForRecording:(BOOL)a3 mode:(int64_t)a4
{
  return a4 != 3 && !a3;
}

- (BOOL)_shouldEnableApertureSliderForMode:(int64_t)a3 devicePosition:(int64_t)a4 recording:(BOOL)a5
{
  int v8 = +[CAMCaptureCapabilities capabilities];
  char v9 = [v8 isDepthEffectApertureSupportedForMode:a3 devicePosition:a4] & ~a5;

  return v9;
}

- (BOOL)_shouldEnableSystemStylePickerForMode:(int64_t)a3 recording:(BOOL)a4
{
  return (((unint64_t)a3 > 9) | (0x41u >> a3)) & !a4;
}

- (BOOL)_shouldEnableToneBiasForMode:(int64_t)a3 recording:(BOOL)a4
{
  return (((unint64_t)a3 > 9) | (0x41u >> a3)) & !a4;
}

- (BOOL)_shouldEnableLensSelectorForMode:(int64_t)a3 devicePosition:(int64_t)a4 recording:(BOOL)a5
{
  BOOL v7 = 1;
  if ((unint64_t)a3 <= 9)
  {
    if (((1 << a3) & 0x2C) != 0 || ((1 << a3) & 0x300) != 0)
    {
      BOOL v7 = 0;
    }
    else if (a3 == 1 && a5)
    {
      char v9 = [(CAMCaptureCommandContext *)self currentMovieFileOutput];
      BOOL v10 = [v9 bravoCameraSelectionBehaviorForRecording];
      BOOL v7 = v10 != (void *)*MEMORY[0x263EF95F8];
    }
  }
  return ((a4 != 1) | ~a5) & v7;
}

- (AVCaptureDeviceFormat)currentDepthDataFormat
{
  return self->_currentDepthDataFormat;
}

- (AVCaptureDevice)currentAudioDevice
{
  return self->_currentAudioDevice;
}

- (AVCaptureSystemZoomSlider)systemZoomSlider
{
  return self->_systemZoomSlider;
}

- (void)setSystemZoomSlider:(id)a3
{
}

- (AVCaptureSystemExposureBiasSlider)systemExposureBiasSlider
{
  return self->_systemExposureBiasSlider;
}

- (void)setSystemExposureBiasSlider:(id)a3
{
}

- (AVCaptureSlider)apertureSlider
{
  return self->_apertureSlider;
}

- (void)setApertureSlider:(id)a3
{
}

- (AVCaptureSlider)emulatedZoomSlider
{
  return self->_emulatedZoomSlider;
}

- (void)setEmulatedZoomSlider:(id)a3
{
}

- (AVCaptureSystemLensSelector)lensSelector
{
  return self->_lensSelector;
}

- (AVCaptureSystemLensSelector)systemLensSelector
{
  return self->_systemLensSelector;
}

- (void)setSystemLensSelector:(id)a3
{
}

- (void)controlsForGraphConfiguration:(os_log_t)log recording:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Unable to configure controls for nil CAMCaptureEngineDevice", v1, 2u);
}

@end