@interface CAMCaptureEngineDevice
- (AVCaptureDevice)captureDevice;
- (AVCaptureDeviceFormat)_cachedPanoramaDeviceFormat;
- (AVCaptureDeviceFormat)_cachedPortraitDeviceFormat;
- (AVCaptureDeviceInput)captureDeviceInput;
- (AVCaptureSystemExposureBiasSlider)systemExposureSlider;
- (AVCaptureSystemLensSelector)systemLensSelector;
- (AVCaptureSystemZoomSlider)systemZoomSlider;
- (CAMCaptureEngine)_captureEngine;
- (CAMCaptureEngineDevice)initWithEngine:(id)a3 captureDevice:(id)a4;
- (CAMCaptureEngineDeviceSystemAction)systemDeviceActionDelegate;
- (CAMMemoizationCache)_videoDeviceFormatForVideoConfiguration;
- (CAMMemoizationCache)_videoSessionPresetForVideoConfiguration;
- (id)_highestQualityDeviceFormatForVideoConfiguration:(int64_t)a3 videoEncodingBehavior:(int64_t)a4 colorSpace:(int64_t)a5;
- (id)_highestQualitySessionPresetForVideoConfiguration:(int64_t)a3 videoEncodingBehavior:(int64_t)a4 colorSpace:(int64_t)a5;
- (id)_keyForVideoConfiguration:(int64_t)a3 videoEncodingBehavior:(int64_t)a4 colorSpace:(int64_t)a5;
- (id)_panoramaDeviceFormatForConfiguration:(id)a3;
- (id)_portraitModeDeviceFormat;
- (id)_portraitModeSessionPreset;
- (id)_timelapseSessionPreset;
- (id)videoDeviceFormatForGraphConfiguration:(id)a3;
- (id)videoDevicePresetForGraphConfiguration:(id)a3;
- (void)captureDeviceInput;
- (void)setSystemDeviceActionDelegate:(id)a3;
@end

@implementation CAMCaptureEngineDevice

- (CAMCaptureEngineDevice)initWithEngine:(id)a3 captureDevice:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  id v7 = objc_loadWeakRetained(&location);

  v8 = 0;
  if (v6 && v7)
  {
    v35.receiver = self;
    v35.super_class = (Class)CAMCaptureEngineDevice;
    self = [(CAMCaptureEngineDevice *)&v35 init];
    if (self)
    {
      id v9 = objc_loadWeakRetained(&location);
      objc_storeWeak((id *)&self->__captureEngine, v9);

      p_captureDevice = &self->_captureDevice;
      objc_storeStrong((id *)&self->_captureDevice, a4);
      id v11 = objc_loadWeakRetained(&location);
      int v12 = [v11 controlsSupported];

      if (v12)
      {
        objc_initWeak(&from, self);
        v13 = (AVCaptureSystemZoomSlider *)[objc_alloc(MEMORY[0x263EFA698]) initWithDevice:*p_captureDevice];
        systemZoomSlider = self->_systemZoomSlider;
        self->_systemZoomSlider = v13;

        id v15 = objc_alloc(MEMORY[0x263EFA678]);
        v16 = *p_captureDevice;
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __55__CAMCaptureEngineDevice_initWithEngine_captureDevice___block_invoke;
        v32[3] = &unk_263FA0910;
        objc_copyWeak(&v33, &from);
        v17 = (AVCaptureSystemExposureBiasSlider *)[v15 initWithDevice:v16 action:v32];
        systemExposureSlider = self->_systemExposureSlider;
        self->_systemExposureSlider = v17;

        id v19 = objc_alloc(MEMORY[0x263EFA680]);
        uint64_t v27 = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        v29 = __55__CAMCaptureEngineDevice_initWithEngine_captureDevice___block_invoke_2;
        v30 = &unk_263FA0938;
        objc_copyWeak(&v31, &from);
        v20 = (AVCaptureSystemLensSelector *)[v19 initWithDevice:v6 action:&v27];
        systemLensSelector = self->_systemLensSelector;
        self->_systemLensSelector = v20;

        -[AVCaptureSystemLensSelector setPickerChangesVideoZoomFactor:](self->_systemLensSelector, "setPickerChangesVideoZoomFactor:", 0, v27, v28, v29, v30);
        objc_destroyWeak(&v31);
        objc_destroyWeak(&v33);
        objc_destroyWeak(&from);
      }
      v22 = [[CAMMemoizationCache alloc] initWithMemoizesNil:1];
      videoDeviceFormatForVideoConfiguration = self->__videoDeviceFormatForVideoConfiguration;
      self->__videoDeviceFormatForVideoConfiguration = v22;

      v24 = [[CAMMemoizationCache alloc] initWithMemoizesNil:1];
      videoSessionPresetForVideoConfiguration = self->__videoSessionPresetForVideoConfiguration;
      self->__videoSessionPresetForVideoConfiguration = v24;

      self = self;
      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }

  objc_destroyWeak(&location);
  return v8;
}

- (AVCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (AVCaptureDeviceInput)captureDeviceInput
{
  captureDeviceInput = self->_captureDeviceInput;
  if (!captureDeviceInput)
  {
    v4 = [(CAMCaptureEngineDevice *)self captureDevice];
    id WeakRetained = objc_loadWeakRetained((id *)&self->__captureEngine);
    id v6 = [v4 deviceType];
    objc_msgSend(WeakRetained, "prewarmedVideoDeviceInput:position:device:", v6, objc_msgSend(v4, "position"), v4);
    id v7 = (AVCaptureDeviceInput *)objc_claimAutoreleasedReturnValue();
    v8 = self->_captureDeviceInput;
    self->_captureDeviceInput = v7;

    if (!self->_captureDeviceInput)
    {
      id v14 = 0;
      id v9 = [MEMORY[0x263EFA5B8] deviceInputWithDevice:v4 error:&v14];
      id v10 = v14;
      id v11 = self->_captureDeviceInput;
      self->_captureDeviceInput = v9;

      if (v10)
      {
        int v12 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          [(CAMCaptureEngineDevice *)(uint64_t)v4 captureDeviceInput];
        }
      }
    }

    captureDeviceInput = self->_captureDeviceInput;
  }
  return captureDeviceInput;
}

void __55__CAMCaptureEngineDevice_initWithEngine_captureDevice___block_invoke(uint64_t a1, float a2)
{
  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained systemDeviceActionDelegate];
  id v5 = objc_loadWeakRetained(v3);
  *(float *)&double v6 = a2;
  [v4 captureEngineDevice:v5 didChangeSystemExposureTargetBias:v6];
}

void __55__CAMCaptureEngineDevice_initWithEngine_captureDevice___block_invoke_2(uint64_t a1, double a2)
{
  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained systemDeviceActionDelegate];
  id v5 = objc_loadWeakRetained(v3);
  *(float *)&double v6 = a2;
  [v4 captureEngineDevice:v5 didChangeLensSelectorZoomFactor:v6];
}

- (id)_highestQualityDeviceFormatForVideoConfiguration:(int64_t)a3 videoEncodingBehavior:(int64_t)a4 colorSpace:(int64_t)a5
{
  id v9 = [(CAMCaptureEngineDevice *)self _videoDeviceFormatForVideoConfiguration];
  id v10 = [(CAMCaptureEngineDevice *)self _keyForVideoConfiguration:a3 videoEncodingBehavior:a4 colorSpace:a5];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __108__CAMCaptureEngineDevice__highestQualityDeviceFormatForVideoConfiguration_videoEncodingBehavior_colorSpace___block_invoke;
  v13[3] = &unk_263FA0960;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a5;
  id v11 = [v9 objectForKey:v10 memoizationBlock:v13];

  return v11;
}

id __108__CAMCaptureEngineDevice__highestQualityDeviceFormatForVideoConfiguration_videoEncodingBehavior_colorSpace___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) captureDevice];
  id v5 = 0;
  [v2 cameraVideoFormat:&v5 orPreset:0 forVideoConfiguration:*(void *)(a1 + 40) videoEncodingBehavior:*(void *)(a1 + 48) colorSpace:*(void *)(a1 + 56)];
  id v3 = v5;

  return v3;
}

- (id)_highestQualitySessionPresetForVideoConfiguration:(int64_t)a3 videoEncodingBehavior:(int64_t)a4 colorSpace:(int64_t)a5
{
  id v9 = [(CAMCaptureEngineDevice *)self _videoSessionPresetForVideoConfiguration];
  id v10 = [(CAMCaptureEngineDevice *)self _keyForVideoConfiguration:a3 videoEncodingBehavior:a4 colorSpace:a5];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __109__CAMCaptureEngineDevice__highestQualitySessionPresetForVideoConfiguration_videoEncodingBehavior_colorSpace___block_invoke;
  v13[3] = &unk_263FA0988;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a5;
  id v11 = [v9 objectForKey:v10 memoizationBlock:v13];

  return v11;
}

id __109__CAMCaptureEngineDevice__highestQualitySessionPresetForVideoConfiguration_videoEncodingBehavior_colorSpace___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) captureDevice];
  id v5 = 0;
  [v2 cameraVideoFormat:0 orPreset:&v5 forVideoConfiguration:*(void *)(a1 + 40) videoEncodingBehavior:*(void *)(a1 + 48) colorSpace:*(void *)(a1 + 56)];
  id v3 = v5;

  return v3;
}

- (id)_keyForVideoConfiguration:(int64_t)a3 videoEncodingBehavior:(int64_t)a4 colorSpace:(int64_t)a5
{
  return (id)[NSString stringWithFormat:@"videoConfiguration=%lu, encoding=%lu, colorSpace=%lu", a3, a4, a5];
}

- (id)_panoramaDeviceFormatForConfiguration:(id)a3
{
  cachedPanoramaDeviceFormat = self->__cachedPanoramaDeviceFormat;
  if (!cachedPanoramaDeviceFormat)
  {
    id v5 = a3;
    double v6 = [(CAMCaptureEngineDevice *)self captureDevice];
    id v7 = [v6 cameraPanoramaFormatForConfiguration:v5];

    v8 = self->__cachedPanoramaDeviceFormat;
    self->__cachedPanoramaDeviceFormat = v7;

    cachedPanoramaDeviceFormat = self->__cachedPanoramaDeviceFormat;
  }
  return cachedPanoramaDeviceFormat;
}

- (id)_timelapseSessionPreset
{
  v2 = [(CAMCaptureEngineDevice *)self captureDevice];
  id v3 = (void *)*MEMORY[0x263EF9738];
  if (([v2 supportsAVCaptureSessionPreset:*MEMORY[0x263EF9738]] & 1) == 0)
  {
    id v3 = (void *)*MEMORY[0x263EF9730];
    if (![v2 supportsAVCaptureSessionPreset:*MEMORY[0x263EF9730]]) {
      id v3 = (void *)*MEMORY[0x263EF9750];
    }
  }
  id v4 = v3;

  return v4;
}

- (id)_portraitModeSessionPreset
{
  v2 = [(CAMCaptureEngineDevice *)self _portraitModeDeviceFormat];

  if (v2) {
    id v3 = 0;
  }
  else {
    id v3 = (id)*MEMORY[0x263EF9780];
  }
  return v3;
}

- (id)_portraitModeDeviceFormat
{
  id v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 usePortraitFrontFacingZoomedCaptureDeviceFormat];

  cachedPortraitDeviceFormat = self->__cachedPortraitDeviceFormat;
  if (cachedPortraitDeviceFormat) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    id v7 = [(CAMCaptureEngineDevice *)self captureDevice];
    if ([v7 position] == 2)
    {
      objc_msgSend(v7, "cam_formatForPortraitFrontFacingZoomed");
      v8 = (AVCaptureDeviceFormat *)objc_claimAutoreleasedReturnValue();
      id v9 = self->__cachedPortraitDeviceFormat;
      self->__cachedPortraitDeviceFormat = v8;
    }
    cachedPortraitDeviceFormat = self->__cachedPortraitDeviceFormat;
  }
  return cachedPortraitDeviceFormat;
}

- (id)videoDeviceFormatForGraphConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 mode];
  BOOL v6 = 0;
  if (v5 <= 8)
  {
    if (((1 << v5) & 0x186) != 0)
    {
      uint64_t v7 = -[CAMCaptureEngineDevice _highestQualityDeviceFormatForVideoConfiguration:videoEncodingBehavior:colorSpace:](self, "_highestQualityDeviceFormatForVideoConfiguration:videoEncodingBehavior:colorSpace:", [v4 videoConfiguration], objc_msgSend(v4, "videoEncodingBehavior"), objc_msgSend(v4, "colorSpace"));
LABEL_7:
      BOOL v6 = (void *)v7;
      goto LABEL_8;
    }
    if (v5 != 3)
    {
      if (v5 != 6) {
        goto LABEL_8;
      }
      uint64_t v7 = [(CAMCaptureEngineDevice *)self _portraitModeDeviceFormat];
      goto LABEL_7;
    }
    id v9 = +[CAMPanoramaConfiguration sharedInstance];
    BOOL v6 = [(CAMCaptureEngineDevice *)self _panoramaDeviceFormatForConfiguration:v9];
  }
LABEL_8:

  return v6;
}

- (id)videoDevicePresetForGraphConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 0;
  switch([v4 mode])
  {
    case 0:
    case 4:
    case 9:
      id v6 = (id)*MEMORY[0x263EF9780];
      goto LABEL_6;
    case 1:
    case 2:
    case 7:
    case 8:
      -[CAMCaptureEngineDevice _highestQualitySessionPresetForVideoConfiguration:videoEncodingBehavior:colorSpace:](self, "_highestQualitySessionPresetForVideoConfiguration:videoEncodingBehavior:colorSpace:", [v4 videoConfiguration], objc_msgSend(v4, "videoEncodingBehavior"), objc_msgSend(v4, "colorSpace"));
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 5:
      id v6 = [(CAMCaptureEngineDevice *)self _timelapseSessionPreset];
      goto LABEL_6;
    case 6:
      id v6 = [(CAMCaptureEngineDevice *)self _portraitModeSessionPreset];
LABEL_6:
      unint64_t v5 = v6;
      break;
    default:
      break;
  }

  return v5;
}

- (AVCaptureSystemZoomSlider)systemZoomSlider
{
  return self->_systemZoomSlider;
}

- (AVCaptureSystemLensSelector)systemLensSelector
{
  return self->_systemLensSelector;
}

- (AVCaptureSystemExposureBiasSlider)systemExposureSlider
{
  return self->_systemExposureSlider;
}

- (CAMCaptureEngineDeviceSystemAction)systemDeviceActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemDeviceActionDelegate);
  return (CAMCaptureEngineDeviceSystemAction *)WeakRetained;
}

- (void)setSystemDeviceActionDelegate:(id)a3
{
}

- (CAMCaptureEngine)_captureEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__captureEngine);
  return (CAMCaptureEngine *)WeakRetained;
}

- (CAMMemoizationCache)_videoDeviceFormatForVideoConfiguration
{
  return self->__videoDeviceFormatForVideoConfiguration;
}

- (CAMMemoizationCache)_videoSessionPresetForVideoConfiguration
{
  return self->__videoSessionPresetForVideoConfiguration;
}

- (AVCaptureDeviceFormat)_cachedPanoramaDeviceFormat
{
  return self->__cachedPanoramaDeviceFormat;
}

- (AVCaptureDeviceFormat)_cachedPortraitDeviceFormat
{
  return self->__cachedPortraitDeviceFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedPortraitDeviceFormat, 0);
  objc_storeStrong((id *)&self->__cachedPanoramaDeviceFormat, 0);
  objc_storeStrong((id *)&self->__videoSessionPresetForVideoConfiguration, 0);
  objc_storeStrong((id *)&self->__videoDeviceFormatForVideoConfiguration, 0);
  objc_destroyWeak((id *)&self->__captureEngine);
  objc_destroyWeak((id *)&self->_systemDeviceActionDelegate);
  objc_storeStrong((id *)&self->_systemExposureSlider, 0);
  objc_storeStrong((id *)&self->_systemLensSelector, 0);
  objc_storeStrong((id *)&self->_systemZoomSlider, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);
  objc_storeStrong((id *)&self->_captureDeviceInput, 0);
}

- (void)captureDeviceInput
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Creating an AVCaptureDeviceInput for the captureDevice (%{public}@) failed: (%{public}@)", (uint8_t *)&v3, 0x16u);
}

@end