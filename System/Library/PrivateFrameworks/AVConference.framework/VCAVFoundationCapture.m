@interface VCAVFoundationCapture
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDurationForFrameRateRangeWithMinFrameRate:(SEL)a3 maxFrameRate:(double)a4 minFrameDuration:(double)a5 maxFrameDuration:(id *)a6 desiredFrameRate:(id *)a7;
+ (BOOL)captureDeviceformatSupportsVideoEffects:(id)a3;
+ (BOOL)deviceInputSupportsCenterStage:(id)a3;
+ (BOOL)deviceInputSupportsVideoEffects:(id)a3;
+ (BOOL)isServerProcess;
+ (CGRect)calculateRegionOfInterest:(CGSize)a3 requestSize:(CGSize)a4;
+ (id)newCaptureSession;
+ (id)newVideoCaptureOutput;
+ (id)newVideoDeviceInput:(id)a3 error:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDurationForVideoDeviceFormat:(SEL)a3 frameRate:(id)a4;
- (AVCaptureDepthDataOutput)depthDataOutput;
- (BOOL)cameraContainsCaptureFormatWithWidth:(int)a3 height:(int)a4;
- (BOOL)cameraSupportsFormatWidth:(int)a3 height:(int)a4;
- (BOOL)cameraSupportsNoQueueFormatWidth:(int)a3 height:(int)a4;
- (BOOL)effectsApplied;
- (BOOL)faceMeshTrackingEnabled;
- (BOOL)hasRequiredAttributes:(id)a3;
- (BOOL)isBackCamera;
- (BOOL)isBackgroundReplacementSupported;
- (BOOL)isBackgroundReplacementSupportedForContinuityCamera;
- (BOOL)isCenterStageSupported;
- (BOOL)isCurrentCaptureDeviceAppleProduct;
- (BOOL)isFormatMaxFrameRateSupported:(id)a3 frameRate:(int)a4;
- (BOOL)isFrameRateActive:(int)a3 captureFormat:(id)a4;
- (BOOL)isFrontCamera;
- (BOOL)isInternalCamera;
- (BOOL)isPortraitModeSupported;
- (BOOL)isPortraitResolutionCaptureActive;
- (BOOL)isPreviewRunning;
- (BOOL)isReactionSupported;
- (BOOL)isStudioLightSupported;
- (BOOL)setCaptureDeviceMinFrameRateIfNeeded:(int)a3;
- (BOOL)shouldAddDepthData;
- (BOOL)shouldAddTrackedFacesData;
- (BOOL)shouldAdjustCaptureWithOrientation:(int)a3;
- (BOOL)shouldResizeWithCaptureSize:(CGSize)a3 requestSize:(CGSize)a4;
- (BOOL)shouldUseCameraVideoStabilization;
- (BOOL)supportsDepthDataFormats;
- (BOOL)supportsPortraitResolution;
- (CGSize)getOptimizedCameraCaptureWidth:(int)a3 height:(int)a4;
- (VCAVFoundationCapture)initWithCaptureServer:(id)a3 protocolFunctions:(const tagVCVideoCaptureServerProtocolRealtimeInstanceVTable *)a4 width:(int)a5 height:(int)a6 frameRate:(int)a7 videoSourceToken:(_VCVideoSourceToken)a8 cinematicFramingEnabled:(BOOL)a9 videoOrientation:(int)a10 capturePixelFormat:(unsigned int)a11 zoomFactor:(double)a12;
- (char)featureStatusForFeatureSupported:(BOOL)a3 enabled:(BOOL)a4;
- (double)setUpVideoZoomFactor;
- (id)cameraFormatForWidth:(int)a3 height:(int)a4;
- (id)cameraFormatForWidth:(int)a3 height:(int)a4 frameRate:(int)a5;
- (id)cameraFormatForWidthWithList:(int)a3 height:(int)a4 frameRate:(int)a5 formatList:(id)a6;
- (id)getCaptureFormatList;
- (id)newCaptureDevice:(id)a3;
- (int)captureDeviceActiveFrameRate;
- (int)configureCaptureWithToken:(_VCVideoSourceToken)a3;
- (int)copyColorInfo:(const __CFDictionary *)a3;
- (int)frameBecameAvailableCount:(int *)a3 figBufferQueueEmptyCount:(int *)a4 figBufferQueueErrorCount:(int *)a5;
- (int)frameCount:(BOOL)a3;
- (int)getFrameRate;
- (int)getMaxAllowedFrameRate:(int)a3;
- (int)getSupportedMaxDeviceFrameRateWithFrameRateCap:(int)a3;
- (int)invalidate;
- (int)setCamera:(_VCVideoSourceToken)a3 width:(int)a4 height:(int)a5 frameRate:(int)a6;
- (int)setFrameRate:(int)a3;
- (int)setFrameRateInternal:(int)a3 forceSourceFrameRateDidChange:(BOOL)a4;
- (int)setVideoDeviceToSelectedDevice:(id)a3;
- (int)setVideoDeviceToWidth:(int)a3 height:(int)a4 frameRate:(int)a5;
- (int)setWidth:(int)a3 height:(int)a4 frameRate:(int)a5;
- (int)startCaptureWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5;
- (int)startPreview;
- (int)stop:(BOOL)a3;
- (int64_t)captureDevicePosition;
- (int64_t)captureTierForEncodingSize:(CGSize)a3;
- (int64_t)videoOrientationForDevice:(id)a3;
- (tagVCVideoCaptureFeatureStatus)currentVideoFeatureStatus;
- (void)applyBlockToAllAvailableCaptureFormats:(id)a3;
- (void)applyVideoRetainedBufferCountHint;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureSessionNotification:(id)a3;
- (void)collectCaptureFrameRateStats:(__CFDictionary *)a3;
- (void)configCaptureConnectionForDevice:(id)a3;
- (void)configureCaptureDeviceDepthFormat;
- (void)configureMetadataTypesForOutput:(id)a3;
- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4;
- (void)dealloc;
- (void)dispatchedCurrentVideoFeatureStatus:(tagVCVideoCaptureFeatureStatus *)a3;
- (void)encodeProcessedPixelBuffer:(__CVBuffer *)a3 time:(id *)a4 imageData:(id)a5 processTime:(id)a6;
- (void)getReportingStats:(__CFDictionary *)a3;
- (void)initializeMetadataOutput;
- (void)initializeOutputs;
- (void)initializeSynchronizedOutputs;
- (void)initializeVideoCaptureOutput;
- (void)initializeViewpointCorrection;
- (void)lockAVCaptureDeviceInputForConfiguration;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareSynchronizedOutputs:(id)a3;
- (void)processMetadataObjects:(id)a3;
- (void)processReactionStatus:(id)a3 oldReactions:(id)a4;
- (void)reportStatus:(__CFDictionary *)a3 forKey:(__CFString *)a4 supported:(BOOL)a5 enabled:(BOOL)a6;
- (void)resetDepthDataOutput;
- (void)resetViewPointLogging;
- (void)retrieveInitialReportingStats:(__CFDictionary *)a3;
- (void)setBufferStatsBuffer:(tagVCVideoBufferStatistics *)a3;
- (void)setCameraZoomFactor:(double)a3;
- (void)setCameraZoomFactor:(double)a3 withRate:(double)a4;
- (void)setEffectsApplied:(BOOL)a3;
- (void)setFaceMeshTrackingEnabled:(BOOL)a3;
- (void)setMetaDataObjectsDelegate;
- (void)setOrientation:(int)a3;
- (void)setReactionActive:(BOOL)a3;
- (void)setUpBackgroundBlurDelegate:(BOOL)a3;
- (void)setUpCaptureDeviceObserver:(BOOL)a3 keyPath:(id)a4;
- (void)setUpCaptureDevicePropertyObservers:(BOOL)a3;
- (void)setVideoCaptureOutputDelegate;
- (void)setVideoStabilization:(BOOL)a3;
- (void)setViewPointCorrectionEnabled:(BOOL)a3;
- (void)tearDownSynchronizer;
- (void)unlockAVCaptureDeviceInputForConfiguration;
- (void)updateCameraZoomCapability;
- (void)updateCaptureDeviceProperties;
- (void)updateCaptureServerWithCaptureDeviceActiveFrameRate;
- (void)updateCenterStageEnabled:(BOOL)a3 requestCaptureChange:(BOOL)a4;
- (void)updateCenterStageRegionOfInterestWithLock:(BOOL)a3;
- (void)updateDepthFrameRate;
- (void)updateRenderProcessFrameRate:(id)a3;
@end

@implementation VCAVFoundationCapture

+ (BOOL)deviceInputSupportsCenterStage:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend((id)objc_msgSend(a3, "device"), "formats");
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * v7) isCenterStageSupported])
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (void)dispatchedCurrentVideoFeatureStatus:(tagVCVideoCaptureFeatureStatus *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v30 = v17;
    __int16 v31 = 2080;
    v32 = "-[VCAVFoundationCapture dispatchedCurrentVideoFeatureStatus:]";
    __int16 v33 = 1024;
    int v34 = 1950;
    v19 = " [%s] %s:%d Feature status cannot be NULL";
LABEL_23:
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x1Cu);
    return;
  }
  if (self->_isViewpointSupported) {
    char viewPointCorrectionEnabled = self->_viewPointCorrectionEnabled;
  }
  else {
    char viewPointCorrectionEnabled = -1;
  }
  a3->var0 = viewPointCorrectionEnabled;
  captureDevice = self->_captureDevice;
  if (!captureDevice)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v30 = v20;
    __int16 v31 = 2080;
    v32 = "-[VCAVFoundationCapture dispatchedCurrentVideoFeatureStatus:]";
    __int16 v33 = 1024;
    int v34 = 1955;
    v19 = " [%s] %s:%d Cannot get current video feature status without captureDevice";
    goto LABEL_23;
  }
  v21 = self;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = [(AVCaptureDevice *)captureDevice formats];
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v8 |= [v16 isCenterStageSupported];
        v9 |= [v16 isPortraitEffectSupported];
        v10 |= [v16 reactionEffectsSupported];
        v11 |= [v16 isStudioLightSupported];
        v12 |= [v16 isBackgroundReplacementSupported];
        v13 |= [v16 isBackgroundReplacementSupportedForContinuityCamera];
      }
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v24 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
    LOBYTE(v13) = 0;
  }
  a3->var1 = -[VCAVFoundationCapture featureStatusForFeatureSupported:enabled:](v21, "featureStatusForFeatureSupported:enabled:", v8 & 1, [MEMORY[0x1E4F16440] isCenterStageEnabled]);
  a3->var2 = -[VCAVFoundationCapture featureStatusForFeatureSupported:enabled:](v21, "featureStatusForFeatureSupported:enabled:", v9 & 1, [MEMORY[0x1E4F16440] isPortraitEffectEnabled]);
  a3->var4 = -[VCAVFoundationCapture featureStatusForFeatureSupported:enabled:](v21, "featureStatusForFeatureSupported:enabled:", v10 & 1, [MEMORY[0x1E4F16440] reactionEffectsEnabled]);
  a3->var3 = -[VCAVFoundationCapture featureStatusForFeatureSupported:enabled:](v21, "featureStatusForFeatureSupported:enabled:", v11 & 1, [MEMORY[0x1E4F16440] isStudioLightEnabled]);
  a3->var5 = -[VCAVFoundationCapture featureStatusForFeatureSupported:enabled:](v21, "featureStatusForFeatureSupported:enabled:", v12 & 1, [MEMORY[0x1E4F16440] isBackgroundReplacementEnabled]);
  a3->var6 = -[VCAVFoundationCapture featureStatusForFeatureSupported:enabled:](v21, "featureStatusForFeatureSupported:enabled:", v13 & 1, [MEMORY[0x1E4F16440] isBackgroundReplacementEnabled]);
}

- (char)featureStatusForFeatureSupported:(BOOL)a3 enabled:(BOOL)a4
{
  if (a3) {
    return a4;
  }
  else {
    return -1;
  }
}

void __55__VCAVFoundationCapture_setViewPointCorrectionEnabled___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 225);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2 == v3)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)int v13 = 136315906;
        *(void *)&v13[4] = v5;
        __int16 v14 = 2080;
        v15 = "-[VCAVFoundationCapture setViewPointCorrectionEnabled:]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 1806;
        __int16 v18 = 1024;
        int v19 = v7;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d already in enabled=%d", v13, 0x22u);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 225);
        int v11 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)int v13 = 136316162;
        *(void *)&v13[4] = v8;
        __int16 v14 = 2080;
        v15 = "-[VCAVFoundationCapture setViewPointCorrectionEnabled:]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 1808;
        __int16 v18 = 1024;
        int v19 = v10;
        __int16 v20 = 1024;
        int v21 = v11;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %d->%d", v13, 0x28u);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 176) beginConfiguration];
    *(unsigned char *)(*(void *)(a1 + 32) + 225) = *(unsigned char *)(a1 + 40);
    [*(id *)(a1 + 32) resetDepthDataOutput];
    [*(id *)(*(void *)(a1 + 32) + 176) commitConfiguration];
    [*(id *)(a1 + 32) captureServer];
    if (objc_opt_respondsToSelector())
    {
      *(_DWORD *)int v13 = -256;
      *(_DWORD *)&v13[3] = -1;
      [*(id *)(a1 + 32) dispatchedCurrentVideoFeatureStatus:v13];
      int v12 = (void *)[*(id *)(a1 + 32) captureServer];
      [v12 captureSourceVideoFeatureStatusDidChange:*(unsigned int *)v13 | ((unint64_t)(*(unsigned __int16 *)&v13[4] | (v13[6] << 16)) << 32)];
    }
  }
}

- (int)setVideoDeviceToSelectedDevice:(id)a3
{
  v57[2] = *MEMORY[0x1E4F143B8];
  int v3 = -2146893792;
  if (!a3) {
    return -2146893823;
  }
  [(AVCaptureSession *)self->_captureSession beginConfiguration];
  if (self->_videoDeviceInput)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        videoDeviceInput = self->_videoDeviceInput;
        *(_DWORD *)buf = 136315906;
        uint64_t v44 = v6;
        __int16 v45 = 2080;
        v46 = "-[VCAVFoundationCapture setVideoDeviceToSelectedDevice:]";
        __int16 v47 = 1024;
        int v48 = 2448;
        __int16 v49 = 2112;
        *(void *)v50 = videoDeviceInput;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession removeInput:%@", buf, 0x26u);
      }
    }
    [(VCAVFoundationCapture *)self unlockAVCaptureDeviceInputForConfiguration];
    [(AVCaptureSession *)self->_captureSession removeInput:self->_videoDeviceInput];
    self->_videoDeviceInput = 0;
  }
  uint64_t v42 = 0;
  int v9 = VCCallSession;
  int v10 = +[VCAVFoundationCapture newVideoDeviceInput:a3 error:&v42];
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAVFoundationCapture setVideoDeviceToSelectedDevice:]();
      }
    }
    goto LABEL_46;
  }
  int v11 = v10;
  if ((objc_msgSend(a3, "supportsAVCaptureSessionPreset:", -[AVCaptureSession sessionPreset](self->_captureSession, "sessionPreset")) & 1) == 0)
  {
    uint64_t v12 = *MEMORY[0x1E4F159C0];
    v57[0] = *MEMORY[0x1E4F159B0];
    v57[1] = v12;
    int v13 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v52 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v54;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v54 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          if ([a3 supportsAVCaptureSessionPreset:v18])
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v19 = VRTraceErrorLogLevelToCSTR();
              __int16 v20 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                uint64_t v44 = v19;
                __int16 v45 = 2080;
                v46 = "-[VCAVFoundationCapture setVideoDeviceToSelectedDevice:]";
                __int16 v47 = 1024;
                int v48 = 2462;
                __int16 v49 = 2112;
                *(void *)v50 = v18;
                _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession setSessionPreset=%@", buf, 0x26u);
              }
            }
            [(AVCaptureSession *)self->_captureSession setSessionPreset:v18];
            int v9 = VCCallSession;
            goto LABEL_26;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v53 objects:v52 count:16];
        int v9 = VCCallSession;
        if (v15) {
          continue;
        }
        break;
      }
    }
  }
LABEL_26:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    uint64_t v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v44 = v21;
      __int16 v45 = 2080;
      v46 = "-[VCAVFoundationCapture setVideoDeviceToSelectedDevice:]";
      __int16 v47 = 1024;
      int v48 = 2468;
      __int16 v49 = 2112;
      *(void *)v50 = v11;
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession addInput:%@", buf, 0x26u);
    }
  }
  [(AVCaptureSession *)self->_captureSession addInput:v11];
  self->_videoDeviceInput = v11;
  [(VCAVFoundationCapture *)self lockAVCaptureDeviceInputForConfiguration];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    v23 = [[(AVCaptureDeviceInput *)self->_videoDeviceInput device] formats]
        ? [(NSString *)[(NSArray *)[[(AVCaptureDeviceInput *)self->_videoDeviceInput device] formats] description] UTF8String]: "<nil>";
    asprintf(&__str, "%s", v23);
    if (__str)
    {
      __lasts = 0;
      v24 = strtok_r(__str, "\n", &__lasts);
      long long v25 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v26 = VRTraceErrorLogLevelToCSTR();
          long long v27 = *v25;
          if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v44 = v26;
            __int16 v45 = 2080;
            v46 = "-[VCAVFoundationCapture setVideoDeviceToSelectedDevice:]";
            __int16 v47 = 1024;
            int v48 = 2472;
            __int16 v49 = 2080;
            *(void *)v50 = "AVCaptureDevice:";
            *(_WORD *)&v50[8] = 2080;
            v51[0] = v24;
            _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v24 = strtok_r(0, "\n", &__lasts);
      }
      while (v24);
      free(__str);
      int v9 = VCCallSession;
    }
  }
  uint64_t v28 = [&v9[89] deviceInputSupportsCenterStage:self->_videoDeviceInput];
  int v29 = v28;
  if (self->_deviceSupportCinematicFraming != v28)
  {
    self->_deviceSupportCinematicFraming = v28;
    [(VCVideoCaptureServer *)[(VCVideoCapture *)self captureServer] setCFAvailabilityChange:v28];
  }
  self->_BOOL deviceSupportVideoEffects = [&v9[89] deviceInputSupportsVideoEffects:self->_videoDeviceInput];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    __int16 v31 = *MEMORY[0x1E4F47A50];
    int v3 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    v32 = self->_videoDeviceInput;
    BOOL deviceSupportVideoEffects = self->_deviceSupportVideoEffects;
    *(_DWORD *)buf = 136316418;
    uint64_t v44 = v30;
    __int16 v45 = 2080;
    v46 = "-[VCAVFoundationCapture setVideoDeviceToSelectedDevice:]";
    __int16 v47 = 1024;
    int v48 = 2484;
    __int16 v49 = 2112;
    *(void *)v50 = v32;
    *(_WORD *)&v50[8] = 1024;
    LODWORD(v51[0]) = v29;
    WORD2(v51[0]) = 1024;
    *(_DWORD *)((char *)v51 + 6) = deviceSupportVideoEffects;
    _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Set camera to %@, CFraming support=%d, _deviceSupportVideoEffects=%d", buf, 0x32u);
  }
  int v3 = 0;
LABEL_46:
  [(VCAVFoundationCapture *)self configCaptureConnectionForDevice:[(AVCaptureDeviceInput *)self->_videoDeviceInput device]];
  [(VCAVFoundationCapture *)self resetDepthDataOutput];
  if ([(AVCaptureDevice *)self->_captureDevice isCenterStageMetadataDeliverySupported])
  {
    BOOL v34 = self->_needCenterStageMetadataForViewpointCorrection && (unint64_t)self->_viewPointCorrectionEnabled;
    [(AVCaptureDevice *)self->_captureDevice setCenterStageMetadataDeliveryEnabled:v34];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL needCenterStageMetadataForViewpointCorrection = self->_needCenterStageMetadataForViewpointCorrection;
        BOOL viewPointCorrectionEnabled = self->_viewPointCorrectionEnabled;
        *(_DWORD *)buf = 136316162;
        uint64_t v44 = v35;
        __int16 v45 = 2080;
        v46 = "-[VCAVFoundationCapture setVideoDeviceToSelectedDevice:]";
        __int16 v47 = 1024;
        int v48 = 2496;
        __int16 v49 = 1024;
        *(_DWORD *)v50 = needCenterStageMetadataForViewpointCorrection;
        *(_WORD *)&v50[4] = 1024;
        *(_DWORD *)&v50[6] = viewPointCorrectionEnabled;
        _os_log_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _needCenterStageMetadataForViewpointCorrection=%d, _viewPointCorrectionEnabled=%d", buf, 0x28u);
      }
    }
  }
  [(AVCaptureSession *)self->_captureSession commitConfiguration];
  [(VCAVFoundationCapture *)self updateCaptureDeviceProperties];
  [(VCVideoCapture *)self captureServer];
  if (objc_opt_respondsToSelector()) {
    [(VCVideoCaptureServer *)[(VCVideoCapture *)self captureServer] handleCaptureSourcePositionDidChange:[(VCAVFoundationCapture *)self isFrontCamera]];
  }
  return v3;
}

- (void)updateCaptureServerWithCaptureDeviceActiveFrameRate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VCAVFoundationCapture *)self captureDeviceActiveFrameRate];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int activeFrameRate = self->_activeFrameRate;
      int v7 = 136316162;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      int v10 = "-[VCAVFoundationCapture updateCaptureServerWithCaptureDeviceActiveFrameRate]";
      __int16 v11 = 1024;
      int v12 = 2571;
      __int16 v13 = 1024;
      int v14 = v3;
      __int16 v15 = 1024;
      int v16 = activeFrameRate;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d captureDeviceActiveFrameRate=%d, _activeFrameRate=%d", (uint8_t *)&v7, 0x28u);
    }
  }
  [(VCVideoCaptureServer *)[(VCVideoCapture *)self captureServer] sourceFrameRateDidChange:v3];
}

- (int)captureDeviceActiveFrameRate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  captureDevice = self->_captureDevice;
  if (captureDevice)
  {
    [(AVCaptureDevice *)captureDevice activeVideoMinFrameDuration];
    double Seconds = CMTimeGetSeconds(&v5);
    if (Seconds <= 0.0) {
      LODWORD(captureDevice) = 0;
    }
    else {
      LODWORD(captureDevice) = llround(1.0 / Seconds);
    }
  }
  return (int)captureDevice;
}

- (void)resetDepthDataOutput
{
  *(void *)&v25[13] = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = [(VCAVFoundationCapture *)self shouldAddDepthData];
      depthDataOutput = self->_depthDataOutput;
      int v18 = 136316162;
      uint64_t v19 = v3;
      __int16 v20 = 2080;
      uint64_t v21 = "-[VCAVFoundationCapture resetDepthDataOutput]";
      __int16 v22 = 1024;
      int v23 = 558;
      __int16 v24 = 1024;
      *(_DWORD *)long long v25 = v5;
      v25[2] = 2048;
      *(void *)&v25[3] = depthDataOutput;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d shouldAddDepthData=%d, _depthDataOutput=%p", (uint8_t *)&v18, 0x2Cu);
    }
  }
  if (![(VCAVFoundationCapture *)self shouldAddDepthData] && self->_depthDataOutput)
  {
    if ([(NSArray *)[(AVCaptureSession *)self->_captureSession outputs] containsObject:self->_depthDataOutput])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v9 = self->_depthDataOutput;
          int v18 = 136315906;
          uint64_t v19 = v7;
          __int16 v20 = 2080;
          uint64_t v21 = "-[VCAVFoundationCapture resetDepthDataOutput]";
          __int16 v22 = 1024;
          int v23 = 563;
          __int16 v24 = 2112;
          *(void *)long long v25 = v9;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession removeOutput _depthDataOutput=%@", (uint8_t *)&v18, 0x26u);
        }
      }
      [(AVCaptureSession *)self->_captureSession removeOutput:self->_depthDataOutput];
    }

    self->_depthDataOutput = 0;
  }
  if ([(VCAVFoundationCapture *)self shouldAddDepthData] && !self->_depthDataOutput)
  {
    int v10 = (AVCaptureDepthDataOutput *)objc_alloc_init(MEMORY[0x1E4F16438]);
    self->_depthDataOutput = v10;
    BOOL v11 = [(AVCaptureSession *)self->_captureSession canAddOutput:v10];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v11)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        int v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v15 = self->_depthDataOutput;
          int v18 = 136315906;
          uint64_t v19 = v13;
          __int16 v20 = 2080;
          uint64_t v21 = "-[VCAVFoundationCapture resetDepthDataOutput]";
          __int16 v22 = 1024;
          int v23 = 574;
          __int16 v24 = 2112;
          *(void *)long long v25 = v15;
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession addOutput _depthDataOutput=%@", (uint8_t *)&v18, 0x26u);
        }
      }
      [(AVCaptureSession *)self->_captureSession addOutput:self->_depthDataOutput];
      [(AVCaptureDepthDataOutput *)self->_depthDataOutput setAlwaysDiscardsLateDepthData:1];
      [(AVCaptureDepthDataOutput *)self->_depthDataOutput setFilteringEnabled:0];
      [(VCAVFoundationCapture *)self configureCaptureDeviceDepthFormat];
    }
    else
    {
      if (ErrorLogLevelForModule >= 5)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        uint64_t v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315650;
          uint64_t v19 = v16;
          __int16 v20 = 2080;
          uint64_t v21 = "-[VCAVFoundationCapture resetDepthDataOutput]";
          __int16 v22 = 1024;
          int v23 = 580;
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cannot add depth data output", (uint8_t *)&v18, 0x1Cu);
        }
      }

      self->_depthDataOutput = 0;
    }
  }
}

- (BOOL)shouldAddDepthData
{
  BOOL result = [(VCAVFoundationCapture *)self supportsDepthDataFormats];
  if (self->_cframingEnabled) {
    return 0;
  }
  return result;
}

- (int)getMaxAllowedFrameRate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_effectsApplied)
  {
    if (a3 >= 0x10 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136316162;
        uint64_t v20 = v5;
        __int16 v21 = 2080;
        __int16 v22 = "-[VCAVFoundationCapture getMaxAllowedFrameRate:]";
        __int16 v23 = 1024;
        int v24 = 1595;
        __int16 v25 = 1024;
        int v26 = 15;
        __int16 v27 = 2080;
        uint64_t v28 = "Effect";
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d framerate throttled to %3d by %-20s", (uint8_t *)&v19, 0x2Cu);
      }
    }
    if ((int)v3 >= 15) {
      uint64_t v3 = 15;
    }
    else {
      uint64_t v3 = v3;
    }
  }
  if (self->_deviceSupportCinematicFraming && v3 >= 0x1F && self->_cframingEnabled)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    {
      uint64_t v3 = 30;
    }
    else
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      uint64_t v3 = 30;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136316162;
        uint64_t v20 = v7;
        __int16 v21 = 2080;
        __int16 v22 = "-[VCAVFoundationCapture getMaxAllowedFrameRate:]";
        __int16 v23 = 1024;
        int v24 = 1604;
        __int16 v25 = 1024;
        int v26 = 30;
        __int16 v27 = 2080;
        uint64_t v28 = "Center Stage";
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d framerate throttled to %3d by %-20s", (uint8_t *)&v19, 0x2Cu);
      }
    }
  }
  if ([(AVCaptureDevice *)self->_captureDevice isBackgroundBlurActive])
  {
    unsigned int v9 = +[VCHardwareSettings maxFrameRateSupportedBackgroundBlur];
    if (v3 > v9)
    {
      unsigned int v10 = v9;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        int v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136316162;
          uint64_t v20 = v11;
          __int16 v21 = 2080;
          __int16 v22 = "-[VCAVFoundationCapture getMaxAllowedFrameRate:]";
          __int16 v23 = 1024;
          int v24 = 1614;
          __int16 v25 = 1024;
          int v26 = v10;
          __int16 v27 = 2080;
          uint64_t v28 = "Blur";
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d framerate throttled to %3d by %-20s", (uint8_t *)&v19, 0x2Cu);
        }
      }
      if (v3 >= v10) {
        uint64_t v3 = v10;
      }
      else {
        uint64_t v3 = v3;
      }
    }
  }
  int v13 = [(VCAVFoundationCapture *)self getSupportedMaxDeviceFrameRateWithFrameRateCap:v3];
  if (v13 < 1) {
    return v3;
  }
  int v14 = v13;
  if (v13 >= (int)v3) {
    return v3;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
      int v19 = 136316418;
      uint64_t v20 = v15;
      __int16 v21 = 2080;
      __int16 v22 = "-[VCAVFoundationCapture getMaxAllowedFrameRate:]";
      __int16 v23 = 1024;
      int v24 = 1622;
      __int16 v25 = 1024;
      int v26 = v3;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v17;
      __int16 v29 = 1024;
      int v30 = v14;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d frameRate=%d is not supported by device=%@. Using frameRate=%d instead", (uint8_t *)&v19, 0x32u);
    }
  }
  return v14;
}

- (int)getSupportedMaxDeviceFrameRateWithFrameRateCap:(int)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = [(VCAVFoundationCapture *)self getCaptureFormatList];
  uint64_t v19 = [obj countByEnumeratingWithState:&v27 objects:v26 count:16];
  int v5 = 0;
  if (v19)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([(VCAVFoundationCapture *)self hasRequiredAttributes:v7])
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v8 = (void *)[v7 videoSupportedFrameRateRanges];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v21 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v23;
            while (2)
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v23 != v11) {
                  objc_enumerationMutation(v8);
                }
                int v13 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                [v13 minFrameRate];
                int v15 = (int)v14;
                [v13 maxFrameRate];
                if (v15 <= a3)
                {
                  if ((int)v16 >= a3) {
                    return a3;
                  }
                  if (v5 <= (int)v16) {
                    int v5 = (int)v16;
                  }
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v21 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v27 objects:v26 count:16];
    }
    while (v19);
  }
  return v5;
}

- (id)getCaptureFormatList
{
  int v2 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];

  return [(AVCaptureDevice *)v2 formats];
}

- (void)configCaptureConnectionForDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AVCaptureVideoDataOutput *)self->_videoCaptureOutput connectionWithMediaType:*MEMORY[0x1E4F15C18]];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    int64_t v7 = [(VCAVFoundationCapture *)self videoOrientationForDevice:a3];
    if ([v6 videoOrientation] != v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315906;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          int v15 = "-[VCAVFoundationCapture configCaptureConnectionForDevice:]";
          __int16 v16 = 1024;
          int v17 = 3047;
          __int16 v18 = 1024;
          int v19 = v7;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d orientation=%d", (uint8_t *)&v12, 0x22u);
        }
      }
      [v6 setVideoOrientation:v7];
    }
    [v6 setVideoMirrored:0];
    if ([v6 isCameraIntrinsicMatrixDeliverySupported]) {
      [v6 setCameraIntrinsicMatrixDeliveryEnabled:1];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      uint64_t v13 = v10;
      __int16 v14 = 2080;
      int v15 = "-[VCAVFoundationCapture configCaptureConnectionForDevice:]";
      __int16 v16 = 1024;
      int v17 = 3040;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d no AVCaptureConnection found, failed to set", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

- (int64_t)videoOrientationForDevice:(id)a3
{
  uint64_t v4 = [a3 position];
  if (v4)
  {
    int64_t v5 = 0xAAAAAAAAAAAAAAAALL;
    if (v4 == 1) {
      int64_t v5 = 3;
    }
    if (v4 == 2) {
      return 4;
    }
    else {
      return v5;
    }
  }
  else if (self->_shouldRemoveExtraRotation)
  {
    return 3;
  }
  else
  {
    return 4;
  }
}

- (void)updateCaptureDeviceProperties
{
  self->_supportPortraitResolution = 0;
}

- (void)setUpBackgroundBlurDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int isBackgroundBlurActive = self->_isBackgroundBlurActive;
  if (isBackgroundBlurActive != [(AVCaptureDevice *)self->_captureDevice isBackgroundBlurActive])
  {
    [(VCVideoCapture *)self captureServer];
    if (objc_opt_respondsToSelector()) {
      [(VCVideoCaptureServer *)[(VCVideoCapture *)self captureServer] portraitBlurEnabledDidChange:[(AVCaptureDevice *)self->_captureDevice isBackgroundBlurActive]];
    }
  }
  self->_int isBackgroundBlurActive = [(AVCaptureDevice *)self->_captureDevice isBackgroundBlurActive];
  if ((VCAVFoundationCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v9 = self->_isBackgroundBlurActive;
        int v16 = 136316162;
        uint64_t v17 = v7;
        __int16 v18 = 2080;
        int v19 = "-[VCAVFoundationCapture setUpBackgroundBlurDelegate:]";
        __int16 v20 = 1024;
        int v21 = 2580;
        __int16 v22 = 1024;
        *(_DWORD *)long long v23 = v9;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = v3;
        uint64_t v10 = " [%s] %s:%d _isBackgroundBlurActive=%d, observe=%d";
        uint64_t v11 = v8;
        uint32_t v12 = 40;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCAVFoundationCapture *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v15 = self->_isBackgroundBlurActive;
        int v16 = 136316674;
        uint64_t v17 = v13;
        __int16 v18 = 2080;
        int v19 = "-[VCAVFoundationCapture setUpBackgroundBlurDelegate:]";
        __int16 v20 = 1024;
        int v21 = 2580;
        __int16 v22 = 2112;
        *(void *)long long v23 = v6;
        *(_WORD *)&v23[8] = 2048;
        long long v24 = self;
        __int16 v25 = 1024;
        BOOL v26 = v15;
        __int16 v27 = 1024;
        BOOL v28 = v3;
        uint64_t v10 = " [%s] %s:%d %@(%p) _isBackgroundBlurActive=%d, observe=%d";
        uint64_t v11 = v14;
        uint32_t v12 = 60;
        goto LABEL_14;
      }
    }
  }
}

- (void)lockAVCaptureDeviceInputForConfiguration
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCaptureInputDevice lockForConfiguration failed, _avCaptureDeviceInputLocked=%d", v2, v3, v4, 2426);
}

- (void)initializeViewpointCorrection
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self->_isViewpointSupported = 0;
  BOOL v3 = +[VCHardwareSettings isViewPointCorrectionSupported];
  int v4 = _os_feature_enabled_impl();
  self->_isViewpointSupported = v3 & v4;
  int64_t v5 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-viewpoint-correction-enabled");
  uint64_t v6 = v5;
  if (v5 && ([v5 BOOLValue] & 1) == 0) {
    self->_isViewpointSupported = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v14 = 136316418;
      *(void *)&v14[4] = v7;
      __int16 v15 = 2080;
      int v16 = "-[VCAVFoundationCapture initializeViewpointCorrection]";
      __int16 v17 = 1024;
      int v18 = 1770;
      __int16 v19 = 1024;
      BOOL v20 = v3;
      __int16 v21 = 1024;
      int v22 = v4;
      __int16 v23 = 2112;
      long long v24 = v6;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d hardwareSupport=%d, featureFlag=%d, storeBagValue=%@", v14, 0x32u);
    }
  }
  if (VCDefaults_GetBoolValueForKey(@"VPCForceEnable", 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v14 = 136315650;
        *(void *)&v14[4] = v9;
        __int16 v15 = 2080;
        int v16 = "-[VCAVFoundationCapture initializeViewpointCorrection]";
        __int16 v17 = 1024;
        int v18 = 1773;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Defaults overwrite support Viewpoint Correction to 1", v14, 0x1Cu);
      }
    }
    self->_isViewpointSupported = 1;
  }
  else if (!self->_isViewpointSupported)
  {
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint32_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v14 = 136315650;
      *(void *)&v14[4] = v11;
      __int16 v15 = 2080;
      int v16 = "-[VCAVFoundationCapture initializeViewpointCorrection]";
      __int16 v17 = 1024;
      int v18 = 1778;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Viewpoint Correction is supported", v14, 0x1Cu);
    }
  }
  self->_viewpointCorrection = (VCViewpointCorrection *)objc_opt_new();
  [(VCAVFoundationCapture *)self setViewPointCorrectionEnabled:VCDefaults_GetEyeContactEnabledBoolValue(1)];
LABEL_17:
  [(VCVideoCapture *)self captureServer];
  if (objc_opt_respondsToSelector())
  {
    *(_DWORD *)__int16 v14 = -256;
    *(_DWORD *)&v14[3] = -1;
    [(VCAVFoundationCapture *)self dispatchedCurrentVideoFeatureStatus:v14];
    uint64_t v13 = [(VCVideoCapture *)self captureServer];
    [(VCVideoCaptureServer *)v13 captureSourceVideoFeatureStatusDidChange:*(unsigned int *)v14 | ((unint64_t)(*(unsigned __int16 *)&v14[4] | (v14[6] << 16)) << 32)];
  }
}

- (void)setViewPointCorrectionEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_isViewpointSupported)
  {
    captureSessionQueue = self->_captureSessionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__VCAVFoundationCapture_setViewPointCorrectionEnabled___block_invoke;
    block[3] = &unk_1E6DB3DF0;
    block[4] = self;
    BOOL v5 = a3;
    dispatch_async(captureSessionQueue, block);
  }
}

- (id)cameraFormatForWidthWithList:(int)a3 height:(int)a4 frameRate:(int)a5 formatList:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v42 = a3;
  int v43 = a4;
  long long v59 = 0u;
  long long v60 = 0u;
  double v11 = (double)a3 / (double)a4;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v12 = [a6 countByEnumeratingWithState:&v59 objects:v58 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(a6);
        }
        int v16 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        if ([(VCAVFoundationCapture *)self hasRequiredAttributes:v16])
        {
          if (!v7) {
            goto LABEL_13;
          }
          memset(buf, 170, sizeof(buf));
          uint64_t v17 = v7;
          if (self->_effectsApplied)
          {
            int lastClientRequestedFrameRate = self->_lastClientRequestedFrameRate;
            if (lastClientRequestedFrameRate <= (int)v7) {
              uint64_t v17 = v7;
            }
            else {
              uint64_t v17 = lastClientRequestedFrameRate;
            }
          }
          [(VCAVFoundationCapture *)self frameDurationForVideoDeviceFormat:v16 frameRate:v17];
          if (buf[12])
          {
LABEL_13:
            CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v16 formatDescription]);
            if (Dimensions.width == v42 && Dimensions.height == a4)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
              {
                uint64_t v21 = VRTraceErrorLogLevelToCSTR();
                int v22 = *MEMORY[0x1E4F47A50];
                __int16 v23 = *MEMORY[0x1E4F47A50];
                if (*MEMORY[0x1E4F47A40])
                {
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315906;
                    *(void *)&uint8_t buf[4] = v21;
                    *(_WORD *)&buf[12] = 2080;
                    *(void *)&buf[14] = "-[VCAVFoundationCapture cameraFormatForWidthWithList:height:frameRate:formatList:]";
                    *(_WORD *)&buf[22] = 1024;
                    int v47 = 2932;
                    __int16 v48 = 2112;
                    *(void *)__int16 v49 = v16;
                    _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Perfect match format=%@", buf, 0x26u);
                  }
                }
                else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315906;
                  *(void *)&uint8_t buf[4] = v21;
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "-[VCAVFoundationCapture cameraFormatForWidthWithList:height:frameRate:formatList:]";
                  *(_WORD *)&buf[22] = 1024;
                  int v47 = 2932;
                  __int16 v48 = 2112;
                  *(void *)__int16 v49 = v16;
                  _os_log_debug_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Perfect match format=%@", buf, 0x26u);
                }
              }
              [v41 addObject:v16];
            }
            [obj addObject:v16];
          }
        }
      }
      uint64_t v13 = [a6 countByEnumeratingWithState:&v59 objects:v58 count:16];
    }
    while (v13);
  }
  *(double *)&v45[1] = v11;
  v45[0] = self;
  if ([v41 count])
  {
    [v41 sortUsingFunction:_VCAVFoundationCapture_compare context:v45];
    long long v24 = (void *)[v41 firstObject];
  }
  else
  {
    [obj sortUsingFunction:_VCAVFoundationCapture_compare context:v45];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v28 = [obj countByEnumeratingWithState:&v54 objects:v53 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      long long v30 = 0;
      unint64_t v31 = 0;
      unint64_t v32 = 0;
      uint64_t v40 = *(void *)v55;
      float v33 = v11;
      do
      {
        uint64_t v34 = 0;
        long long v24 = v30;
        unint64_t v35 = v31;
        do
        {
          if (*(void *)v55 != v40) {
            objc_enumerationMutation(obj);
          }
          long long v30 = *(void **)(*((void *)&v54 + 1) + 8 * v34);
          unint64_t v31 = _VCAVFoundationCapture_effectiveResolution(v30, v33);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v36 = VRTraceErrorLogLevelToCSTR();
            v37 = *MEMORY[0x1E4F47A50];
            v38 = *MEMORY[0x1E4F47A50];
            if (*MEMORY[0x1E4F47A40])
            {
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                *(void *)&uint8_t buf[4] = v36;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "-[VCAVFoundationCapture cameraFormatForWidthWithList:height:frameRate:formatList:]";
                *(_WORD *)&buf[22] = 1024;
                int v47 = 2952;
                __int16 v48 = 2112;
                *(void *)__int16 v49 = v30;
                *(_WORD *)&v49[8] = 1024;
                *(_DWORD *)v50 = v31 == v35;
                _os_log_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d format %@. sameTierToPrevious = %d", buf, 0x2Cu);
              }
            }
            else if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136316162;
              *(void *)&uint8_t buf[4] = v36;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[VCAVFoundationCapture cameraFormatForWidthWithList:height:frameRate:formatList:]";
              *(_WORD *)&buf[22] = 1024;
              int v47 = 2952;
              __int16 v48 = 2112;
              *(void *)__int16 v49 = v30;
              *(_WORD *)&v49[8] = 1024;
              *(_DWORD *)v50 = v31 == v35;
              _os_log_debug_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_DEBUG, " [%s] %s:%d format %@. sameTierToPrevious = %d", buf, 0x2Cu);
            }
          }
          if (v31 == v35)
          {
            long long v30 = v24;
          }
          else
          {
            BOOL v39 = v32 >= v43 * (uint64_t)v42;
            unint64_t v32 = v31;
            if (v39) {
              goto LABEL_30;
            }
          }
          ++v34;
          long long v24 = v30;
          unint64_t v35 = v31;
        }
        while (v29 != v34);
        uint64_t v29 = [obj countByEnumeratingWithState:&v54 objects:v53 count:16];
        long long v24 = v30;
      }
      while (v29);
    }
    else
    {
      long long v24 = 0;
    }
  }
LABEL_30:

  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCaptureDeviceFormat-cameraFormatForWidth");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    BOOL v26 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAVFoundationCapture cameraFormatForWidthWithList:height:frameRate:formatList:]";
      *(_WORD *)&buf[22] = 1024;
      int v47 = 2967;
      __int16 v48 = 1024;
      *(_DWORD *)__int16 v49 = v42;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v43;
      *(_WORD *)v50 = 1024;
      *(_DWORD *)&v50[2] = v7;
      __int16 v51 = 2112;
      v52 = v24;
      _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCaptureDeviceFormat-cameraFormatForWidth width=%d height=%d frameRate=%d cameraFormat=%@", buf, 0x38u);
    }
  }
  return v24;
}

- (BOOL)hasRequiredAttributes:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[a3 formatDescription]);
  int v7 = !self->_deviceSupportVideoEffects && MediaSubType == 875704438;
  if (self->_deviceSupportVideoEffects && MediaSubType == 875704438) {
    int v7 = +[VCAVFoundationCapture captureDeviceformatSupportsVideoEffects:a3];
  }
  int captureSIFRPreferredOverride = self->_captureSIFRPreferredOverride;
  switch(captureSIFRPreferredOverride)
  {
    case 0:
      goto LABEL_22;
    case 2:
      v7 &= [a3 isVideoHDRSupported] ^ 1;
      break;
    case 1:
      v7 &= [a3 isVideoHDRSupported];
      break;
    default:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        double v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = self->_captureSIFRPreferredOverride;
          int v16 = 136315906;
          uint64_t v17 = v10;
          __int16 v18 = 2080;
          __int16 v19 = "-[VCAVFoundationCapture hasRequiredAttributes:]";
          __int16 v20 = 1024;
          int v21 = 2839;
          __int16 v22 = 1024;
          int v23 = v12;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown default value %d, do not overwrite capture SIFR preference", (uint8_t *)&v16, 0x22u);
        }
      }
      break;
  }
  if (self->_captureSIFRPreferredOverride != 2)
  {
LABEL_22:
    uint64_t v13 = [[(AVCaptureDeviceInput *)self->_videoDeviceInput device] deviceType];
    if (v13 == (NSString *)*MEMORY[0x1E4F15820])
    {
      uint64_t v14 = (void *)[a3 supportedDepthDataFormats];
      if (!v14 || ![v14 count]) {
        int v7 = 0;
      }
    }
  }
  if (self->_captureFormatNonBinOnlyOverride) {
    return v7 & ~[a3 isVideoBinned];
  }
  return v7;
}

+ (BOOL)captureDeviceformatSupportsVideoEffects:(id)a3
{
  if (a3) {
    return [a3 isPortraitEffectSupported];
  }
  else {
    return 0;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDurationForVideoDeviceFormat:(SEL)a3 frameRate:(id)a4
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v7 = (void *)[a4 videoSupportedFrameRateRanges];
  BOOL result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[v7 countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)v25;
    double v11 = (double)(int)v5;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v25 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
      [v13 minFrameRate];
      if (v14 + -1.0 <= v11)
      {
        BOOL result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[v13 maxFrameRate];
        if (v15 + 1.0 >= v11) {
          break;
        }
      }
      if (v9 == ($3CC8671D27C23BF42ADDB32F2B5E48AE *)++v12)
      {
        BOOL result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[v7 countByEnumeratingWithState:&v24 objects:v23 count:16];
        uint64_t v9 = result;
        if (result) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    if (!v13) {
      goto LABEL_13;
    }
    [v13 minFrameRate];
    double v17 = v16;
    [v13 maxFrameRate];
    double v19 = v18;
    [v13 minFrameDuration];
    [v13 maxFrameDuration];
    return +[VCAVFoundationCapture frameDurationForFrameRateRangeWithMinFrameRate:v22 maxFrameRate:&v21 minFrameDuration:v5 maxFrameDuration:v17 desiredFrameRate:v19];
  }
  else
  {
LABEL_13:
    uint64_t v20 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v20 + 16);
  }
  return result;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDurationForFrameRateRangeWithMinFrameRate:(SEL)a3 maxFrameRate:(double)a4 minFrameDuration:(double)a5 maxFrameDuration:(id *)a6 desiredFrameRate:(id *)a7
{
  double v12 = a4;
  float v14 = a4;
  float v15 = a5;
  BOOL result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)VCMU_CompareWithAccuracy(v14, v15, 0.0001);
  if (result) {
    goto LABEL_2;
  }
  double v18 = (double)a8;
  if ((double)a8 < v12
    || (BOOL result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)VCMU_CompareWithAccuracy(v14, (float)a8, 0.1), result))
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a7->var0;
    int64_t var3 = a7->var3;
    goto LABEL_6;
  }
  if (v18 > a5
    || (BOOL result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)VCMU_CompareWithAccuracy(v15, (float)a8, 0.1),
        (result & 1) != 0))
  {
LABEL_2:
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a6->var0;
    int64_t var3 = a6->var3;
LABEL_6:
    retstr->int64_t var3 = var3;
    return result;
  }
  do
  {
    double v19 = v12;
    double v12 = v12 + 1.0;
  }
  while (v19 <= a5 + -1.0 && v12 <= v18);
  if (v19 == 0.0)
  {
    uint64_t v21 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    int64_t var3 = *(void *)(v21 + 16);
    goto LABEL_6;
  }
  int var1 = a6->var1;
  int64_t v23 = llround((double)var1 / v19 * 10.0);

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, v23, 10 * var1);
}

+ (BOOL)deviceInputSupportsVideoEffects:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = objc_msgSend((id)objc_msgSend(a3, "device"), "formats");
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (+[VCAVFoundationCapture captureDeviceformatSupportsVideoEffects:*(void *)(*((void *)&v10 + 1) + 8 * v7)])
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (BOOL)isPortraitResolutionCaptureActive
{
  return 0;
}

- (void)setOrientation:(int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_orientation != a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        long long v10 = "-[VCAVFoundationCapture setOrientation:]";
        __int16 v11 = 1024;
        int v12 = 2152;
        __int16 v13 = 1024;
        int v14 = a3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d orientation=%d", (uint8_t *)&v7, 0x22u);
      }
    }
    self->_orientation = a3;
    if (self->_supportPortraitResolution) {
      [(VCAVFoundationCapture *)self setVideoDeviceToWidth:(int)self->_requestSize.width height:(int)self->_requestSize.height frameRate:self->_lastClientRequestedFrameRate];
    }
  }
}

- (VCAVFoundationCapture)initWithCaptureServer:(id)a3 protocolFunctions:(const tagVCVideoCaptureServerProtocolRealtimeInstanceVTable *)a4 width:(int)a5 height:(int)a6 frameRate:(int)a7 videoSourceToken:(_VCVideoSourceToken)a8 cinematicFramingEnabled:(BOOL)a9 videoOrientation:(int)a10 capturePixelFormat:(unsigned int)a11 zoomFactor:(double)a12
{
  uint64_t v13 = *(void *)&a7;
  uint64_t v14 = *(void *)&a6;
  uint64_t v15 = *(void *)&a5;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v55.receiver = self;
  v55.super_class = (Class)VCAVFoundationCapture;
  double v17 = [(VCVideoCapture *)&v55 initWithCaptureServer:a3 protocolFunctions:a4];
  if (!v17) {
    return v17;
  }
  if ((VCAVFoundationCapture *)objc_opt_class() == v17)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317442;
        uint64_t v57 = v19;
        __int16 v58 = 2080;
        long long v59 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:ci"
              "nematicFramingEnabled:videoOrientation:capturePixelFormat:zoomFactor:]";
        __int16 v60 = 1024;
        int v61 = 351;
        __int16 v62 = 1024;
        *(_DWORD *)uint64_t v63 = v15;
        *(_WORD *)&v63[4] = 1024;
        *(_DWORD *)&v63[6] = v14;
        LOWORD(v64) = 1024;
        *(_DWORD *)((char *)&v64 + 2) = v13;
        HIWORD(v64) = 1024;
        *(_VCVideoSourceToken *)v65 = a8;
        *(_WORD *)&v65[4] = 1024;
        *(_DWORD *)v66 = a9;
        *(_WORD *)&v66[4] = 1024;
        *(_DWORD *)v67 = a10;
        *(_WORD *)&v67[4] = 2048;
        double v68 = a12;
        uint64_t v21 = " [%s] %s:%d width=%d, height=%d, frameRate=%d, sourceToken=0x%x, cinematicFramingEnabled=%d, orientation=%d zoomFactor=%f";
        __int16 v22 = v20;
        uint32_t v23 = 74;
LABEL_12:
        _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      double v18 = (__CFString *)[(VCAVFoundationCapture *)v17 performSelector:sel_logPrefix];
    }
    else {
      double v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      long long v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317954;
        uint64_t v57 = v24;
        __int16 v58 = 2080;
        long long v59 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:ci"
              "nematicFramingEnabled:videoOrientation:capturePixelFormat:zoomFactor:]";
        __int16 v60 = 1024;
        int v61 = 351;
        __int16 v62 = 2112;
        *(void *)uint64_t v63 = v18;
        *(_WORD *)&v63[8] = 2048;
        v64 = v17;
        *(_WORD *)v65 = 1024;
        *(_DWORD *)&v65[2] = v15;
        *(_WORD *)v66 = 1024;
        *(_DWORD *)&v66[2] = v14;
        *(_WORD *)v67 = 1024;
        *(_DWORD *)&v67[2] = v13;
        LOWORD(v68) = 1024;
        *(_VCVideoSourceToken *)((char *)&v68 + 2) = a8;
        HIWORD(v68) = 1024;
        BOOL v69 = a9;
        __int16 v70 = 1024;
        int v71 = a10;
        __int16 v72 = 2048;
        double v73 = a12;
        uint64_t v21 = " [%s] %s:%d %@(%p) width=%d, height=%d, frameRate=%d, sourceToken=0x%x, cinematicFramingEnabled=%d, orient"
              "ation=%d zoomFactor=%f";
        __int16 v22 = v25;
        uint32_t v23 = 94;
        goto LABEL_12;
      }
    }
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v17->_captureSessionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAVCaptureSession.captureSessionQueue", 0, CustomRootQueue);
  v17->_viewPointCorrectionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCViewPointcorrection.viewPointCorrectionQueue", 0, CustomRootQueue);
  if (VCAllocatorFirstCome_Create((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (uint64_t)"VCAVFCaptureNumberPropertyAllocator", &v17->_numberPropertyAllocator))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cinematicFramingEnabled:videoOrientation:capturePixelFormat:zoomFactor:]();
      }
    }
  }
  v17->_captureSession = (AVCaptureSession *)+[VCAVFoundationCapture newCaptureSession];
  v17->_capturePixelFormat = a11;
  BOOL v27 = ([(id)objc_opt_class() isServerProcess] & 1) != 0
     || [+[VCDefaults sharedInstance] forceUseAvconferenced];
  v17->_BOOL isServerProcess = v27;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    uint64_t v29 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL isServerProcess = v17->_isServerProcess;
      *(_DWORD *)buf = 136315906;
      uint64_t v57 = v28;
      __int16 v58 = 2080;
      long long v59 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cine"
            "maticFramingEnabled:videoOrientation:capturePixelFormat:zoomFactor:]";
      __int16 v60 = 1024;
      int v61 = 363;
      __int16 v62 = 1024;
      *(_DWORD *)uint64_t v63 = isServerProcess;
      _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _isServerProcess=%d", buf, 0x22u);
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v17, sel_captureSessionNotification_, 0, v17->_captureSession);
  v17->_int lastClientRequestedFrameRate = v13;
  v17->_faceMeshTrackingEnabled = 0;
  v17->_isCaptureSIFRPreferred = +[VCHardwareSettings isCaptureSIFRPreferred];
  v17->_int captureSIFRPreferredOverride = VCDefaults_GetIntValueForKey(@"overrideAVCaptureSIFR", 0);
  v17->_captureFormatNonBinOnlyOverride = VCDefaults_GetIntValueForKey(@"overrideAVCaptureNonBinnedOnly", 0) != 0;
  int IntValueForKey = VCDefaults_GetIntValueForKey(@"captureDeviceFrameRateMin", 0);
  v17->_int deviceMinFrameRate = IntValueForKey;
  if (IntValueForKey)
  {
    if ((VCAVFoundationCapture *)objc_opt_class() == v17)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v33 = VRTraceErrorLogLevelToCSTR();
        uint64_t v34 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int deviceMinFrameRate = v17->_deviceMinFrameRate;
          *(_DWORD *)buf = 136315906;
          uint64_t v57 = v33;
          __int16 v58 = 2080;
          long long v59 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:"
                "cinematicFramingEnabled:videoOrientation:capturePixelFormat:zoomFactor:]";
          __int16 v60 = 1024;
          int v61 = 373;
          __int16 v62 = 1024;
          *(_DWORD *)uint64_t v63 = deviceMinFrameRate;
          uint64_t v36 = " [%s] %s:%d kVCDefaultCaptureDeviceFrameRateMin is set to %d";
          v37 = v34;
          uint32_t v38 = 34;
LABEL_34:
          _os_log_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unint64_t v32 = (__CFString *)[(VCAVFoundationCapture *)v17 performSelector:sel_logPrefix];
      }
      else {
        unint64_t v32 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v39 = VRTraceErrorLogLevelToCSTR();
        uint64_t v40 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v41 = v17->_deviceMinFrameRate;
          *(_DWORD *)buf = 136316418;
          uint64_t v57 = v39;
          __int16 v58 = 2080;
          long long v59 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:"
                "cinematicFramingEnabled:videoOrientation:capturePixelFormat:zoomFactor:]";
          __int16 v60 = 1024;
          int v61 = 373;
          __int16 v62 = 2112;
          *(void *)uint64_t v63 = v32;
          *(_WORD *)&v63[8] = 2048;
          v64 = v17;
          *(_WORD *)v65 = 1024;
          *(_DWORD *)&v65[2] = v41;
          uint64_t v36 = " [%s] %s:%d %@(%p) kVCDefaultCaptureDeviceFrameRateMin is set to %d";
          v37 = v40;
          uint32_t v38 = 54;
          goto LABEL_34;
        }
      }
    }
  }
  if (v17->_captureFormatNonBinOnlyOverride)
  {
    if ((VCAVFoundationCapture *)objc_opt_class() == v17)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_47;
      }
      uint64_t v43 = VRTraceErrorLogLevelToCSTR();
      uint64_t v44 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_47;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v57 = v43;
      __int16 v58 = 2080;
      long long v59 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cine"
            "maticFramingEnabled:videoOrientation:capturePixelFormat:zoomFactor:]";
      __int16 v60 = 1024;
      int v61 = 376;
      __int16 v45 = " [%s] %s:%d Pick only non binned AVCaptureDeviceFormat";
      v46 = v44;
      uint32_t v47 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v42 = (__CFString *)[(VCAVFoundationCapture *)v17 performSelector:sel_logPrefix];
      }
      else {
        int v42 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_47;
      }
      uint64_t v48 = VRTraceErrorLogLevelToCSTR();
      __int16 v49 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_47;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v57 = v48;
      __int16 v58 = 2080;
      long long v59 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cine"
            "maticFramingEnabled:videoOrientation:capturePixelFormat:zoomFactor:]";
      __int16 v60 = 1024;
      int v61 = 376;
      __int16 v62 = 2112;
      *(void *)uint64_t v63 = v42;
      *(_WORD *)&v63[8] = 2048;
      v64 = v17;
      __int16 v45 = " [%s] %s:%d %@(%p) Pick only non binned AVCaptureDeviceFormat";
      v46 = v49;
      uint32_t v47 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v46, OS_LOG_TYPE_DEFAULT, v45, buf, v47);
  }
LABEL_47:
  v17->_captureFormatPrefer16By9ForSquare = +[VCHardwareSettings captureFormatPrefer16by9ForSquare];
  v17->_BOOL needCenterStageMetadataForViewpointCorrection = VCDefaults_GetBoolValueForKey(@"VPCCenterStageMetadata", 1);
  v17->_requestSize.width = (double)(int)v15;
  v17->_requestSize.height = (double)(int)v14;
  v17->_orientation = a10;
  v17->_useAVConferenced = VCFeatureFlagManager_UseAvconferenced();
  v17->_beginCommitConfigForFormatSwitch = 1;
  v17->_cameraZoomFactor = a12;
  [(AVCaptureSession *)v17->_captureSession beginConfiguration];
  [(VCAVFoundationCapture *)v17 setCamera:a8.var0.var1 width:v15 height:v14 frameRate:v13];
  [(VCAVFoundationCapture *)v17 initializeOutputs];
  [(VCAVFoundationCapture *)v17 initializeViewpointCorrection];
  [(VCAVFoundationCapture *)v17 updateCenterStageEnabled:a9 requestCaptureChange:1];
  [(AVCaptureSession *)v17->_captureSession commitConfiguration];
  objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "setDelegate:", v17);
  if (objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "isFaceMeshTrackingEnabled"))-[VCAVFoundationCapture setFaceMeshTrackingEnabled:](v17, "setFaceMeshTrackingEnabled:", 1); {
  uint64_t v50 = VCEffectsManager_SharedManager();
  }
  if (VCEffectsManager_IsEffectsOn(v50)) {
    [(VCAVFoundationCapture *)v17 setEffectsApplied:1];
  }
  v17->_cachedDataArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17->_renderFrameTimes = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", @"effectsProcessWindow", 60));
  v17->_processTimeSum = 0.0;
  v17->_imageCopyingConverter = [[VCImageResizingConverter alloc] initWithOutputWidth:(int)v15 outputHeight:(int)v14 formatType:v17->_capturePixelFormat];
  v17->_imageRotationConverter = [[VCImageRotationConverter alloc] initWithRotationAngle:90 width:(int)v15 height:(int)v14 formatType:v17->_capturePixelFormat];
  v17->_forceMirrorCapture = [+[VCDefaults sharedInstance] forceMirroredCapture];
  v17->_forceDynamicEffectsFramerate = [+[VCDefaults sharedInstance] forceDynamicEffectsFramerate];
  [+[VCDefaults sharedInstance] depthFrameRateMultiplier];
  v17->_depthFrameRateMultplier = 1.0 / v51;
  v17->_forcePearlCamera = [+[VCDefaults sharedInstance] forceEnablePearlCamera];
  [(VCAVFoundationCapture *)v17 resetViewPointLogging];
  v17->_enableBufferStatsDump = VCDefaults_GetBoolValueForKey(@"enableVideoCaptureStatistics", 0);
  +[VCVisualAlert start];
  v17->_shouldRemoveExtraRotation = _os_feature_enabled_impl();
  v17->_shouldUseCompressedPixelFormat = VCVideoUtil_ShouldUseCompressedPixelFormat();
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAVFoundationCapture-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v52 = VRTraceErrorLogLevelToCSTR();
    long long v53 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v57 = v52;
      __int16 v58 = 2080;
      long long v59 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cine"
            "maticFramingEnabled:videoOrientation:capturePixelFormat:zoomFactor:]";
      __int16 v60 = 1024;
      int v61 = 428;
      __int16 v62 = 2048;
      *(void *)uint64_t v63 = v17;
      _os_log_impl(&dword_1E1EA4000, v53, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAVFoundationCapture-init (%p)", buf, 0x26u);
    }
  }
  return v17;
}

- (void)updateCenterStageEnabled:(BOOL)a3 requestCaptureChange:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__VCAVFoundationCapture_updateCenterStageEnabled_requestCaptureChange___block_invoke;
  block[3] = &unk_1E6DB4658;
  block[4] = self;
  BOOL v6 = a3;
  BOOL v7 = a4;
  dispatch_async(captureSessionQueue, block);
}

- (int)startPreview
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__VCAVFoundationCapture_startPreview__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(captureSessionQueue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)setFrameRate:(int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  int lastClientRequestedFrameRate = a3;
  if (self->_effectsApplied) {
    int lastClientRequestedFrameRate = self->_lastClientRequestedFrameRate;
  }
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__VCAVFoundationCapture_setFrameRate___block_invoke;
  v7[3] = &unk_1E6DB7008;
  v7[4] = self;
  v7[5] = &v10;
  int v8 = a3;
  int v9 = lastClientRequestedFrameRate;
  dispatch_sync(captureSessionQueue, v7);
  int v5 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)setBufferStatsBuffer:(tagVCVideoBufferStatistics *)a3
{
  self->_statsBuffer = a3;
}

- (void)resetViewPointLogging
{
  self->_VPCProcessedFrameCount = 0;
  self->_VPCModifiedFrameCount = 0;
  self->_viewpointProcessTime = 0.0;
}

- (BOOL)isInternalCamera
{
  captureDevice = self->_captureDevice;
  if (!captureDevice) {
    return 1;
  }
  uint64_t v3 = [(AVCaptureDevice *)captureDevice deviceType];
  return v3 != *MEMORY[0x1E4F15838];
}

- (int)frameCount:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  captureSessionQueue = self->_captureSessionQueue;
  int v11 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__VCAVFoundationCapture_frameCount___block_invoke;
  v6[3] = &unk_1E6DB7A38;
  v6[4] = self;
  v6[5] = &v8;
  BOOL v7 = a3;
  dispatch_sync(captureSessionQueue, v6);
  int v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (int)setVideoDeviceToWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  v53[3] = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
      *(_WORD *)&buf[22] = 1024;
      int v47 = 2651;
      __int16 v48 = 1024;
      *(_DWORD *)__int16 v49 = v7;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v6;
      __int16 v50 = 1024;
      int v51 = v5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d width=%d, height=%d, frameRate=%d", buf, 0x2Eu);
    }
  }
  [(VCAVFoundationCapture *)self getOptimizedCameraCaptureWidth:v7 height:v6];
  uint64_t v12 = (int)v11;
  HIDWORD(v44) = (int)v13;
  id v14 = [(VCAVFoundationCapture *)self cameraFormatForWidth:(int)v13 height:v12 frameRate:[(VCAVFoundationCapture *)self getSupportedMaxDeviceFrameRateWithFrameRateCap:v5]];
  uint64_t v15 = [(VCAVFoundationCapture *)self getMaxAllowedFrameRate:v5];
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
        *(_WORD *)&buf[22] = 1024;
        int v47 = 2708;
        __int16 v48 = 1024;
        *(_DWORD *)__int16 v49 = HIDWORD(v44);
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = v12;
        __int16 v50 = 1024;
        int v51 = v5;
        _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d camera doesn't support resolution=%dx%d@%d", buf, 0x2Eu);
      }
    }
    goto LABEL_30;
  }
  uint64_t v16 = v15;
  BOOL v17 = [(VCAVFoundationCapture *)self isFrameRateActive:v15 captureFormat:v14];
  if (objc_msgSend(v14, "isEqual:", -[AVCaptureDevice activeFormat](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "activeFormat")))BOOL v18 = !v17; {
  else
  }
    BOOL v18 = 1;
  if (!v18)
  {
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      BOOL v27 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
        *(_WORD *)&buf[22] = 1024;
        int v47 = 2669;
        __int16 v48 = 2112;
        *(void *)__int16 v49 = v14;
        _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Same device format and frame rate. Skip configuration. cameraFormat=%@", buf, 0x26u);
      }
    }
    self->_int activeFrameRate = v16;
    [(VCAVFoundationCapture *)self updateCaptureServerWithCaptureDeviceActiveFrameRate];
    int v28 = 0;
    goto LABEL_46;
  }
  memset(v45, 170, sizeof(v45));
  [(VCAVFoundationCapture *)self frameDurationForVideoDeviceFormat:v14 frameRate:v16];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    uint64_t v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
      *(_WORD *)&buf[22] = 1024;
      int v47 = 2676;
      __int16 v48 = 1024;
      *(_DWORD *)__int16 v49 = HIDWORD(v44);
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v12;
      __int16 v50 = 1024;
      int v51 = v16;
      __int16 v52 = 1024;
      LODWORD(v53[0]) = *(_DWORD *)v45;
      WORD2(v53[0]) = 1024;
      *(_DWORD *)((char *)v53 + 6) = *(_DWORD *)&v45[8];
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d for cameraFormat %dx%d/%d, found frameDuration = %d / %d", buf, 0x3Au);
    }
  }
  if (![[(AVCaptureDeviceInput *)self->_videoDeviceInput device] lockForConfiguration:0])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]();
      }
    }
LABEL_30:
    int v28 = 0;
LABEL_31:
    if ((int)VRTraceGetErrorLogLevelForModule() > 4)
    {
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      long long v30 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if ([[(AVCaptureDeviceInput *)self->_videoDeviceInput device] activeFormat])
        {
          unint64_t v31 = (const char *)objc_msgSend((id)-[AVCaptureDeviceFormat description](-[AVCaptureDevice activeFormat](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "activeFormat"), "description"), "UTF8String");
        }
        else
        {
          unint64_t v31 = "<nil>";
        }
        *(_DWORD *)buf = 136316674;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
        *(_WORD *)&buf[22] = 1024;
        int v47 = 2713;
        __int16 v48 = 1024;
        *(_DWORD *)__int16 v49 = HIDWORD(v44);
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = v12;
        __int16 v50 = 1024;
        int v51 = v5;
        __int16 v52 = 2080;
        v53[0] = v31;
        _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d failed to set video device format to %dx%d/%d. Using format %s", buf, 0x38u);
      }
    }
    goto LABEL_46;
  }
  if (self->_beginCommitConfigForFormatSwitch) {
    [(AVCaptureSession *)self->_captureSession beginConfiguration];
  }
  [[(AVCaptureDeviceInput *)self->_videoDeviceInput device] setActiveFormat:v14];
  LODWORD(v44) = *(_DWORD *)&v45[12];
  if (v45[12])
  {
    unint64_t v32 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
    *(_OWORD *)buf = *(_OWORD *)v45;
    *(void *)&buf[16] = *(void *)&v45[16];
    [(AVCaptureDevice *)v32 setActiveVideoMaxFrameDuration:buf];
    uint64_t v33 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
    *(_OWORD *)buf = *(_OWORD *)v45;
    *(void *)&buf[16] = *(void *)&v45[16];
    [(AVCaptureDevice *)v33 setActiveVideoMinFrameDuration:buf];
    [(VCAVFoundationCapture *)self setCaptureDeviceMinFrameRateIfNeeded:v16];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    __int16 v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
      *(_WORD *)&buf[22] = 1024;
      int v47 = 2693;
      __int16 v48 = 1024;
      *(_DWORD *)__int16 v49 = HIDWORD(v44);
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v12;
      __int16 v50 = 1024;
      int v51 = v16;
      _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d %dx%d/%d, frameRateInRange not found!", buf, 0x2Eu);
    }
  }
  [(VCAVFoundationCapture *)self configureCaptureDeviceDepthFormat];
  if ([(AVCaptureDevice *)self->_captureDevice isFaceDetectionSupported]) {
    [(AVCaptureDevice *)self->_captureDevice setFaceDetectionDrivenImageProcessingEnabled:1];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    unint64_t v35 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
      *(_WORD *)&buf[22] = 1024;
      int v47 = 2700;
      __int16 v48 = 2112;
      *(void *)__int16 v49 = v14;
      _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d set video device format to %@", buf, 0x26u);
    }
  }
  self->_int activeFrameRate = v16;
  [(VCAVFoundationCapture *)self updateCaptureServerWithCaptureDeviceActiveFrameRate];
  int v28 = 1;
  if ((v44 & 1) == 0) {
    goto LABEL_31;
  }
LABEL_46:
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions([(AVCaptureDeviceFormat *)[[(AVCaptureDeviceInput *)self->_videoDeviceInput device] activeFormat] formatDescription]);
  int32_t v37 = Dimensions;
  unint64_t v38 = HIDWORD(Dimensions);
  *(void *)&self->_int activeWidth = Dimensions;
  if ((int)Dimensions < SHIDWORD(v44) && SHIDWORD(Dimensions) < (int)v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v40 = VRTraceErrorLogLevelToCSTR();
      int v41 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        *(void *)&uint8_t buf[4] = v40;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
        *(_WORD *)&buf[22] = 1024;
        int v47 = 2722;
        __int16 v48 = 1024;
        *(_DWORD *)__int16 v49 = v37;
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = v38;
        __int16 v50 = 1024;
        int v51 = HIDWORD(v44);
        __int16 v52 = 1024;
        LODWORD(v53[0]) = v12;
        _os_log_impl(&dword_1E1EA4000, v41, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d video device format resolution (%dx%d) is lower than requested (%dx%d)", buf, 0x34u);
      }
    }
    LODWORD(v38) = self->_activeHeight;
  }
  int activeWidth = self->_activeWidth;
  self->_captureSize.width = (double)activeWidth;
  self->_captureSize.height = (double)(int)v38;
  if (self->_requestSize.width == 1088.0
    && self->_requestSize.height == 1088.0
    && activeWidth != 1920
    && v38 != 1080)
  {
    self->_requestSize = (CGSize)vdupq_n_s64(0x4086800000000000uLL);
  }
  self->_resize = -[VCAVFoundationCapture shouldResizeWithCaptureSize:requestSize:](self, "shouldResizeWithCaptureSize:requestSize:");
  [(VCAVFoundationCapture *)self updateCenterStageRegionOfInterestWithLock:v28 ^ 1u];
  if (((v28 ^ 1) & 1) == 0)
  {
    if (self->_beginCommitConfigForFormatSwitch) {
      [(AVCaptureSession *)self->_captureSession commitConfiguration];
    }
    [[(AVCaptureDeviceInput *)self->_videoDeviceInput device] unlockForConfiguration];
  }
  return 0;
}

- (BOOL)setCaptureDeviceMinFrameRateIfNeeded:(int)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int deviceMinFrameRate = self->_deviceMinFrameRate;
  if (!deviceMinFrameRate) {
    return 0;
  }
  if (deviceMinFrameRate >= a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      BOOL v7 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return v7;
      }
      int v11 = self->_deviceMinFrameRate;
      LODWORD(time1.value) = 136316162;
      *(CMTimeValue *)((char *)&time1.value + 4) = v9;
      LOWORD(time1.flags) = 2080;
      *(void *)((char *)&time1.flags + 2) = "-[VCAVFoundationCapture setCaptureDeviceMinFrameRateIfNeeded:]";
      HIWORD(time1.epoch) = 1024;
      int v19 = 2224;
      __int16 v20 = 1024;
      int v21 = v11;
      __int16 v22 = 1024;
      LODWORD(v23) = a3;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _deviceMinFrameRate=%d is not smaller than targetFrameRate=%d. NO change to captureDeviceFrameRate", (uint8_t *)&time1, 0x28u);
    }
    return 0;
  }
  memset(&v17[1], 170, sizeof(CMTime));
  [(VCAVFoundationCapture *)self frameDurationForVideoDeviceFormat:[[(AVCaptureDeviceInput *)self->_videoDeviceInput device] activeFormat] frameRate:self->_deviceMinFrameRate];
  CMTime time1 = v17[1];
  v17[0] = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  int32_t v6 = CMTimeCompare(&time1, v17);
  BOOL v7 = v6 != 0;
  if (v6)
  {
    uint64_t v8 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
    CMTime time1 = v17[1];
    [(AVCaptureDevice *)v8 setActiveVideoMaxFrameDuration:&time1];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    id v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = self->_deviceMinFrameRate;
      uint64_t v16 = [[(AVCaptureDeviceInput *)self->_videoDeviceInput device] activeFormat];
      LODWORD(time1.value) = 136316162;
      *(CMTimeValue *)((char *)&time1.value + 4) = v13;
      LOWORD(time1.flags) = 2080;
      *(void *)((char *)&time1.flags + 2) = "-[VCAVFoundationCapture setCaptureDeviceMinFrameRateIfNeeded:]";
      HIWORD(time1.epoch) = 1024;
      int v19 = 2229;
      __int16 v20 = 1024;
      int v21 = v15;
      __int16 v22 = 2112;
      uint64_t v23 = v16;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Can not find frameDuration for framerate=%d, activeFormat=%@!", (uint8_t *)&time1, 0x2Cu);
    }
  }
  return v7;
}

- (void)configureCaptureDeviceDepthFormat
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retain lock for capture deivce %@");
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFRetain(a4);
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  memset(&v12, 170, sizeof(v12));
  CMSampleBufferGetPresentationTimeStamp(&v12, a4);
  IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
  if (IOSurface) {
    IOSurfaceGetID(IOSurface);
  }
  CMTime time = v12;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  if (self->_useAVConferenced)
  {
    _VCAVFoundationCapture_ProcessSampleBufferWithCaptureOutput((CVImageBufferRef)self, a4, a3);
    FigSampleBufferRelease();
  }
  else
  {
    captureSessionQueue = self->_captureSessionQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__VCAVFoundationCapture_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
    v11[3] = &unk_1E6DB5450;
    v11[5] = a3;
    v11[6] = a4;
    v11[4] = self;
    dispatch_async(captureSessionQueue, v11);
  }
}

- (void)updateDepthFrameRate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = !self->_faceMeshTrackingEnabled;
  int v4 = (uint64_t *)(MEMORY[0x1E4F1FA10] + 16);
  if (self->_faceMeshTrackingEnabled) {
    int v4 = (uint64_t *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  uint64_t v5 = *v4;
  if (self->_faceMeshTrackingEnabled) {
    int32_t v6 = (void *)MEMORY[0x1E4F1F9F8];
  }
  else {
    int32_t v6 = (void *)MEMORY[0x1E4F1FA10];
  }
  captureDevice = self->_captureDevice;
  v13[0] = *v6;
  v13[1] = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v3), 0x1FuLL)), *(int8x8_t *)(MEMORY[0x1E4F1FA10] + 8), *(int8x8_t *)(MEMORY[0x1E4F1F9F8] + 8));
  v13[2] = v5;
  [(AVCaptureDevice *)captureDevice setActiveDepthDataMinFrameDuration:v13];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = self->_captureDevice;
      if (v10) {
        [(AVCaptureDevice *)v10 activeDepthDataMinFrameDuration];
      }
      else {
        memset(&v12, 0, sizeof(v12));
      }
      Float64 Seconds = CMTimeGetSeconds(&v12);
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = v8;
      __int16 v16 = 2080;
      BOOL v17 = "-[VCAVFoundationCapture updateDepthFrameRate]";
      __int16 v18 = 1024;
      int v19 = 2388;
      __int16 v20 = 2048;
      Float64 v21 = Seconds;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting depth frame rate to %f", buf, 0x26u);
    }
  }
}

- (BOOL)isFrontCamera
{
  return ([(VCAVFoundationCapture *)self captureDevicePosition] & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (int64_t)captureDevicePosition
{
  return [(AVCaptureDevice *)self->_captureDevice position];
}

uint64_t __38__VCAVFoundationCapture_setFrameRate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) getMaxAllowedFrameRate:*(unsigned int *)(a1 + 48)];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "setFrameRateInternal:forceSourceFrameRateDidChange:");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *(_DWORD *)(*(void *)(a1 + 32) + 280) = *(_DWORD *)(a1 + 52);
  return result;
}

- (void)updateCenterStageRegionOfInterestWithLock:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_deviceSupportCinematicFraming)
  {
    BOOL v3 = a3;
    if ([MEMORY[0x1E4F16440] isCenterStageEnabled])
    {
      if (v3
        && ![[(AVCaptureDeviceInput *)self->_videoDeviceInput device] lockForConfiguration:0])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAVFoundationCapture updateCenterStageRegionOfInterestWithLock:]();
          }
        }
      }
      else
      {
        if (self->_resize)
        {
          +[VCAVFoundationCapture calculateRegionOfInterest:requestSize:](VCAVFoundationCapture, "calculateRegionOfInterest:requestSize:", self->_captureSize.width, self->_captureSize.height, self->_requestSize.width, self->_requestSize.height);
          double v6 = v5;
          double v8 = v7;
          double v10 = v9;
          double v12 = v11;
        }
        else
        {
          double v10 = 1.0;
          double v6 = 0.0;
          double v8 = 0.0;
          double v12 = 1.0;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          uint64_t v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v24.origin.x = v6;
            v24.origin.y = v8;
            v24.size.width = v10;
            v24.size.height = v12;
            int v15 = 136315906;
            uint64_t v16 = v13;
            __int16 v17 = 2080;
            __int16 v18 = "-[VCAVFoundationCapture updateCenterStageRegionOfInterestWithLock:]";
            __int16 v19 = 1024;
            int v20 = 810;
            __int16 v21 = 2112;
            uint64_t v22 = NSStringFromRect(v24);
            _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d centerStageRectOfInterest=%@", (uint8_t *)&v15, 0x26u);
          }
        }
        -[AVCaptureDevice setCenterStageRectOfInterest:]([(AVCaptureDeviceInput *)self->_videoDeviceInput device], "setCenterStageRectOfInterest:", v6, v8, v10, v12);
        if (v3) {
          [[(AVCaptureDeviceInput *)self->_videoDeviceInput device] unlockForConfiguration];
        }
      }
    }
  }
}

- (BOOL)shouldResizeWithCaptureSize:(CGSize)a3 requestSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  CGFloat v6 = a3.height;
  CGFloat v7 = a3.width;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  float v9 = a4.width / a4.height;
  float v10 = a3.width / a3.height;
  if (VCMU_CompareWithAccuracy(v9, v10, 0.01)
    || self->_supportPortraitResolution && VCMU_CompareWithAccuracy(v9, 1.0 / v10, 0.01))
  {
    BOOL v11 = 0;
LABEL_10:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136316930;
        uint64_t v22 = v15;
        __int16 v23 = 2080;
        NSRect v24 = "-[VCAVFoundationCapture shouldResizeWithCaptureSize:requestSize:]";
        __int16 v25 = 1024;
        int v26 = 775;
        __int16 v27 = 1024;
        *(_DWORD *)int v28 = v11;
        *(_WORD *)&v28[4] = 2048;
        *(CGFloat *)&v28[6] = v7;
        *(_WORD *)&v28[14] = 2048;
        *(CGFloat *)&v28[16] = v6;
        __int16 v29 = 2048;
        double v30 = width;
        __int16 v31 = 2048;
        double v32 = height;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AR_TX] Frame Transform resize. shouldResize=%d, catpure=%4.0fx%4.0f, request=%4.0fx%4.0f,", (uint8_t *)&v21, 0x4Au);
      }
    }
    return v11;
  }
  if ([+[VCDefaults sharedInstance] forceMultiwayHWI])
  {
    unint64_t v12 = [+[VCDefaults sharedInstance] forceEncodeWidth];
    unint64_t v13 = [+[VCDefaults sharedInstance] forceEncodeHeight];
  }
  else
  {
    unint64_t v12 = (unint64_t)width;
    unint64_t v13 = (unint64_t)height;
  }

  uint64_t v14 = [[VCImageResizingConverter alloc] initWithOutputWidth:v12 outputHeight:v13 formatType:self->_capturePixelFormat];
  self->_imageResizingConverter = v14;
  if (v14)
  {
    BOOL v11 = 1;
    goto LABEL_10;
  }
  if ((VCAVFoundationCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAVFoundationCapture shouldResizeWithCaptureSize:requestSize:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v18 = (__CFString *)[(VCAVFoundationCapture *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      int v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v21 = 136316162;
        uint64_t v22 = v19;
        __int16 v23 = 2080;
        NSRect v24 = "-[VCAVFoundationCapture shouldResizeWithCaptureSize:requestSize:]";
        __int16 v25 = 1024;
        int v26 = 772;
        __int16 v27 = 2112;
        *(void *)int v28 = v18;
        *(_WORD *)&v28[8] = 2048;
        *(void *)&v28[10] = self;
        _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Allocating VCResizeImageBuffer failed", (uint8_t *)&v21, 0x30u);
      }
    }
  }
  LOBYTE(v11) = 0;
  return v11;
}

- (int)setFrameRateInternal:(int)a3 forceSourceFrameRateDidChange:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  if (a3 <= 0)
  {
    int v10 = -2146893823;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:]();
      }
    }
  }
  else
  {
    BOOL v5 = a4;
    if ([[(AVCaptureDeviceInput *)self->_videoDeviceInput device] lockForConfiguration:&v18])
    {
      memset(v17, 170, sizeof(v17));
      [(VCAVFoundationCapture *)self frameDurationForVideoDeviceFormat:[[(AVCaptureDeviceInput *)self->_videoDeviceInput device] activeFormat] frameRate:v4];
      if (v17[12])
      {
        int activeFrameRate = self->_activeFrameRate;
        self->_int activeFrameRate = v4;
        unint64_t v12 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
        *(_OWORD *)buf = *(_OWORD *)v17;
        *(void *)&buf[16] = *(void *)&v17[16];
        [(AVCaptureDevice *)v12 setActiveVideoMaxFrameDuration:buf];
        unint64_t v13 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
        *(_OWORD *)buf = *(_OWORD *)v17;
        *(void *)&buf[16] = *(void *)&v17[16];
        [(AVCaptureDevice *)v13 setActiveVideoMinFrameDuration:buf];
        [(VCAVFoundationCapture *)self setCaptureDeviceMinFrameRateIfNeeded:v4];
        [[(AVCaptureDeviceInput *)self->_videoDeviceInput device] unlockForConfiguration];
        if (activeFrameRate != v4 || v5) {
          [(VCVideoCaptureServer *)[(VCVideoCapture *)self captureServer] sourceFrameRateDidChange:v4];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          uint64_t v15 = *MEMORY[0x1E4F47A50];
          int v10 = 0;
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return v10;
          }
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v14;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:]";
          *(_WORD *)&buf[22] = 1024;
          int v20 = 1555;
          __int16 v21 = 1024;
          int v22 = v4;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Frame rate set to %d", buf, 0x22u);
        }
        return 0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        double v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          float v9 = [[(AVCaptureDeviceInput *)self->_videoDeviceInput device] activeFormat];
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v7;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:]";
          *(_WORD *)&buf[22] = 1024;
          int v20 = 1558;
          __int16 v21 = 1024;
          int v22 = v4;
          __int16 v23 = 2112;
          NSRect v24 = v9;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Frame rate %d is not found in format %@ active ", buf, 0x2Cu);
        }
      }
      [[(AVCaptureDeviceInput *)self->_videoDeviceInput device] unlockForConfiguration];
      return -2146893820;
    }
    else
    {
      int v10 = -2146893818;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:]();
          return -2146893818;
        }
      }
    }
  }
  return v10;
}

- (CGSize)getOptimizedCameraCaptureWidth:(int)a3 height:(int)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v6 = (double)a3;
  double v7 = (double)a4;
  if (!a3 || !a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_25;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    int v19 = 136316162;
    uint64_t v20 = v9;
    __int16 v21 = 2080;
    int v22 = "-[VCAVFoundationCapture getOptimizedCameraCaptureWidth:height:]";
    __int16 v23 = 1024;
    int v24 = 2611;
    __int16 v25 = 1024;
    int v26 = a3;
    __int16 v27 = 1024;
    int v28 = a4;
    BOOL v11 = " [%s] %s:%d Unexpected request width=%d, height=%d";
    unint64_t v12 = v10;
    goto LABEL_24;
  }
  if (a3 == a4)
  {
    if (self->_supportPortraitResolution
      && [(VCAVFoundationCapture *)self cameraSupportsNoQueueFormatWidth:1552 height:1552])
    {
      double v6 = 1552.0;
      double v7 = 1552.0;
    }
    else if (self->_captureFormatPrefer16By9ForSquare)
    {
      if (a3 == 1088) {
        double v6 = 1920.0;
      }
      else {
        double v6 = 1280.0;
      }
      double v7 = dbl_1E25A00C0[a3 == 1088];
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_25;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    __int16 v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    int v19 = 136316162;
    uint64_t v20 = v16;
    __int16 v21 = 2080;
    int v22 = "-[VCAVFoundationCapture getOptimizedCameraCaptureWidth:height:]";
    __int16 v23 = 1024;
    int v24 = 2627;
    __int16 v25 = 1024;
    int v26 = (int)v6;
    __int16 v27 = 1024;
    int v28 = (int)v7;
    BOOL v11 = " [%s] %s:%d square video, capture request %dx%d";
    unint64_t v12 = v17;
LABEL_24:
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, 0x28u);
LABEL_25:
    double v15 = v6;
    goto LABEL_26;
  }
  if (!self->_supportPortraitResolution
    || ![(VCAVFoundationCapture *)self shouldAdjustCaptureWithOrientation:self->_orientation])
  {
    goto LABEL_25;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136316162;
      uint64_t v20 = v13;
      __int16 v21 = 2080;
      int v22 = "-[VCAVFoundationCapture getOptimizedCameraCaptureWidth:height:]";
      __int16 v23 = 1024;
      int v24 = 2632;
      __int16 v25 = 1024;
      int v26 = a4;
      __int16 v27 = 1024;
      int v28 = a3;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d optimize capture for orientation, request %dx%d instead", (uint8_t *)&v19, 0x28u);
    }
  }
  double v15 = v7;
  double v7 = v6;
LABEL_26:
  double v18 = v7;
  result.double height = v18;
  result.double width = v15;
  return result;
}

- (id)cameraFormatForWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  id v9 = [(VCAVFoundationCapture *)self getCaptureFormatList];

  return [(VCAVFoundationCapture *)self cameraFormatForWidthWithList:v7 height:v6 frameRate:v5 formatList:v9];
}

uint64_t __36__VCAVFoundationCapture_frameCount___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 352);
  if (*(unsigned char *)(result + 48)) {
    *(_DWORD *)(*(void *)(result + 32) + 352) = 0;
  }
  return result;
}

+ (BOOL)isServerProcess
{
  int v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
  if ([v2 isEqualToString:@"avconferenced"]) {
    return 1;
  }

  return [v2 isEqualToString:@"mediaserverd"];
}

void __52__VCAVFoundationCapture_captureSessionNotification___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    BOOL v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 32) name];
      int v37 = 136315906;
      uint64_t v38 = v2;
      __int16 v39 = 2080;
      uint64_t v40 = "-[VCAVFoundationCapture captureSessionNotification:]_block_invoke";
      __int16 v41 = 1024;
      int v42 = 1330;
      __int16 v43 = 2112;
      uint64_t v44 = (__CFString *)v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d notification.name=%@", (uint8_t *)&v37, 0x26u);
    }
  }
  uint64_t v5 = (id *)(a1 + 32);
  uint64_t v6 = (void *)[*(id *)(a1 + 32) name];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F159D0]];
  double v8 = *(void **)(a1 + 32);
  if (v7)
  {
    id v9 = (void *)[v8 userInfo];
    uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F159A8]), "stringValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      unint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315906;
        uint64_t v38 = v11;
        __int16 v39 = 2080;
        uint64_t v40 = "-[VCAVFoundationCapture captureSessionNotification:]_block_invoke";
        __int16 v41 = 1024;
        int v42 = 1334;
        __int16 v43 = 2112;
        uint64_t v44 = (__CFString *)v10;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session interrupted. reason=%@", (uint8_t *)&v37, 0x26u);
      }
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureServer"), "handleCaptureEvent:subType:", @"avCaptureCameraInterrupted", v10);
    return;
  }
  uint64_t v13 = (void *)[v8 name];
  if ([v13 isEqualToString:*MEMORY[0x1E4F159A0]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      double v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315650;
        uint64_t v38 = v14;
        __int16 v39 = 2080;
        uint64_t v40 = "-[VCAVFoundationCapture captureSessionNotification:]_block_invoke";
        __int16 v41 = 1024;
        int v42 = 1337;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session interruption ended", (uint8_t *)&v37, 0x1Cu);
      }
    }
    uint64_t v16 = (void *)[*(id *)(a1 + 40) captureServer];
    __int16 v17 = @"avCaptureCameraBecameAvailable";
LABEL_35:
    [v16 handleCaptureEvent:v17];
    return;
  }
  double v18 = (void *)[*v5 name];
  int v19 = [v18 isEqualToString:*MEMORY[0x1E4F159C8]];
  id v20 = *v5;
  if (v19)
  {
    __int16 v21 = (void *)[v20 userInfo];
    int v22 = (void *)[v21 objectForKey:*MEMORY[0x1E4F15998]];
    BOOL v23 = VCFeatureFlagManager_DaemonCrashRecovery();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      __int16 v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v35 = [v22 code];
        int v36 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 345);
        int v37 = 136316674;
        uint64_t v38 = v24;
        __int16 v39 = 2080;
        uint64_t v40 = "-[VCAVFoundationCapture captureSessionNotification:]_block_invoke";
        __int16 v41 = 1024;
        int v42 = 1343;
        __int16 v43 = 2112;
        uint64_t v44 = @"avCaptureFail";
        __int16 v45 = 1024;
        BOOL v46 = v23;
        __int16 v47 = 1024;
        int v48 = v35;
        __int16 v49 = 1024;
        int v50 = v36;
        _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d eventType=%@, daemonCrashRecoveryEnabled=%d, error.code=%d, _isPreviewing=%d", (uint8_t *)&v37, 0x38u);
      }
    }
    if ([v22 code] == -11819)
    {
      uint64_t v26 = *(void *)(a1 + 40);
      if (*(unsigned char *)(v26 + 345)) {
        BOOL v27 = v23;
      }
      else {
        BOOL v27 = 0;
      }
      if (v27)
      {
        [*(id *)(v26 + 176) stopRunning];
        [*(id *)(*(void *)(a1 + 40) + 176) startRunning];
      }
      int v28 = @"avCaptureServerDied";
    }
    else
    {
      int v28 = @"avCaptureFail";
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __52__VCAVFoundationCapture_captureSessionNotification___block_invoke_cold_1();
      }
    }
    uint64_t v16 = (void *)[*(id *)(a1 + 40) captureServer];
    __int16 v17 = v28;
    goto LABEL_35;
  }
  uint64_t v29 = (void *)[v20 name];
  if ([v29 isEqualToString:*MEMORY[0x1E4F15988]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      __int16 v31 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315650;
        uint64_t v38 = v30;
        __int16 v39 = 2080;
        uint64_t v40 = "-[VCAVFoundationCapture captureSessionNotification:]_block_invoke";
        __int16 v41 = 1024;
        int v42 = 1356;
        _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session started running", (uint8_t *)&v37, 0x1Cu);
      }
    }
    uint64_t v16 = (void *)[*(id *)(a1 + 40) captureServer];
    __int16 v17 = @"avCaptureCameraDidStart";
    goto LABEL_35;
  }
  double v32 = (void *)[*v5 name];
  if ([v32 isEqualToString:*MEMORY[0x1E4F15990]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      uint64_t v34 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315650;
        uint64_t v38 = v33;
        __int16 v39 = 2080;
        uint64_t v40 = "-[VCAVFoundationCapture captureSessionNotification:]_block_invoke";
        __int16 v41 = 1024;
        int v42 = 1359;
        _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session stopped running", (uint8_t *)&v37, 0x1Cu);
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int v9 = objc_msgSend(a3, "isEqualToString:", @"backgroundBlurActive", a4, a5, a6);
  uint64_t v10 = *MEMORY[0x1E4F284C8];
  uint64_t v11 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
  unint64_t v12 = v11;
  if (v9)
  {
    int isBackgroundBlurActive = self->_isBackgroundBlurActive;
    if (isBackgroundBlurActive != [v11 BOOLValue])
    {
      [(VCVideoCapture *)self captureServer];
      if (objc_opt_respondsToSelector()) {
        -[VCVideoCaptureServer portraitBlurEnabledDidChange:](-[VCVideoCapture captureServer](self, "captureServer"), "portraitBlurEnabledDidChange:", [v12 BOOLValue]);
      }
    }
    self->_int isBackgroundBlurActive = [v12 BOOLValue];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      double v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v16 = self->_isBackgroundBlurActive;
        int v29 = 136315906;
        uint64_t v30 = v14;
        __int16 v31 = 2080;
        double v32 = "-[VCAVFoundationCapture observeValueForKeyPath:ofObject:change:context:]";
        __int16 v33 = 1024;
        int v34 = 2550;
        __int16 v35 = 1024;
        LODWORD(v36) = v16;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _isBackgroundBlurActive=%d", (uint8_t *)&v29, 0x22u);
      }
    }
  }
  else if ([a3 isEqualToString:@"reactionEffectsInProgress"])
  {
    __int16 v17 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (!a5 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      int v19 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 136315906;
        uint64_t v30 = v18;
        __int16 v31 = 2080;
        double v32 = "-[VCAVFoundationCapture observeValueForKeyPath:ofObject:change:context:]";
        __int16 v33 = 1024;
        int v34 = 2553;
        __int16 v35 = 2112;
        int v36 = @"reactionEffectsInProgress";
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d key=%@, change is nil", (uint8_t *)&v29, 0x26u);
      }
    }
    uint64_t v20 = [a5 objectForKeyedSubscript:v10];
    uint64_t v21 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      BOOL v23 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 136315906;
        uint64_t v30 = v22;
        __int16 v31 = 2080;
        double v32 = "-[VCAVFoundationCapture observeValueForKeyPath:ofObject:change:context:]";
        __int16 v33 = 1024;
        int v34 = 2557;
        __int16 v35 = 2112;
        int v36 = (__CFString *)v20;
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d newReactionArray=%@", (uint8_t *)&v29, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      __int16 v25 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 136315906;
        uint64_t v30 = v24;
        __int16 v31 = 2080;
        double v32 = "-[VCAVFoundationCapture observeValueForKeyPath:ofObject:change:context:]";
        __int16 v33 = 1024;
        int v34 = 2558;
        __int16 v35 = 2112;
        int v36 = (__CFString *)v21;
        _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d oldReactionsArray=%@", (uint8_t *)&v29, 0x26u);
      }
    }
    [(VCAVFoundationCapture *)self processReactionStatus:v20 oldReactions:v21];
  }
  if (([a3 isEqualToString:@"backgroundBlurActive"] & 1) != 0
    || ([a3 isEqualToString:@"studioLightingActive"] & 1) != 0
    || [a3 isEqualToString:@"backgroundReplacementActive"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      BOOL v27 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v28 = [v12 intValue];
        int v29 = 136316162;
        uint64_t v30 = v26;
        __int16 v31 = 2080;
        double v32 = "-[VCAVFoundationCapture observeValueForKeyPath:ofObject:change:context:]";
        __int16 v33 = 1024;
        int v34 = 2564;
        __int16 v35 = 2112;
        int v36 = (__CFString *)a3;
        __int16 v37 = 1024;
        int v38 = v28;
        _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d keyPath=%@, value=%d", (uint8_t *)&v29, 0x2Cu);
      }
    }
    [(VCAVFoundationCapture *)self updateCaptureServerWithCaptureDeviceActiveFrameRate];
  }
}

- (void)initializeOutputs
{
  [(VCAVFoundationCapture *)self initializeVideoCaptureOutput];
  [(VCAVFoundationCapture *)self initializeMetadataOutput];

  [(VCAVFoundationCapture *)self resetDepthDataOutput];
}

- (void)initializeVideoCaptureOutput
{
  v19[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[VCAVFoundationCapture newVideoCaptureOutput];
  self->_videoCaptureOutput = v3;
  [(AVCaptureVideoDataOutput *)v3 setAllLossyVideoCVPixelFormatTypesEnabled:1];
  uint64_t v18 = *MEMORY[0x1E4F24D70];
  v19[0] = [NSNumber numberWithUnsignedInt:self->_capturePixelFormat];
  -[AVCaptureVideoDataOutput setVideoSettings:](self->_videoCaptureOutput, "setVideoSettings:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1]);
  [(AVCaptureVideoDataOutput *)self->_videoCaptureOutput setAlwaysDiscardsLateVideoFrames:1];
  [(VCAVFoundationCapture *)self setVideoCaptureOutputDelegate];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      videoCaptureOutput = self->_videoCaptureOutput;
      int v7 = FourccToCStr(self->_capturePixelFormat);
      int v8 = 136316162;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCAVFoundationCapture initializeVideoCaptureOutput]";
      __int16 v12 = 1024;
      int v13 = 547;
      __int16 v14 = 2112;
      double v15 = videoCaptureOutput;
      __int16 v16 = 2080;
      __int16 v17 = v7;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession addOutput=%@ pixelFormat=%s", (uint8_t *)&v8, 0x30u);
    }
  }
  [(AVCaptureSession *)self->_captureSession addOutput:self->_videoCaptureOutput];
  [(VCAVFoundationCapture *)self applyVideoRetainedBufferCountHint];
  [(VCAVFoundationCapture *)self configCaptureConnectionForDevice:[(AVCaptureDeviceInput *)self->_videoDeviceInput device]];
}

- (void)setVideoCaptureOutputDelegate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_isServerProcess)
  {
    BOOL useAVConferenced = self->_useAVConferenced;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (useAVConferenced)
    {
      if (ErrorLogLevelForModule > 6)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          captureSessionQueue = self->_captureSessionQueue;
          int v14 = 136315906;
          uint64_t v15 = v5;
          __int16 v16 = 2080;
          __int16 v17 = "-[VCAVFoundationCapture setVideoCaptureOutputDelegate]";
          __int16 v18 = 1024;
          int v19 = 502;
          __int16 v20 = 2048;
          uint64_t v21 = captureSessionQueue;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSessionQueue=%p", (uint8_t *)&v14, 0x26u);
        }
      }
      videoCaptureOutput = self->_videoCaptureOutput;
      int v13 = self->_captureSessionQueue;
      __int16 v12 = self;
    }
    else
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        __int16 v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315650;
          uint64_t v15 = v9;
          __int16 v16 = 2080;
          __int16 v17 = "-[VCAVFoundationCapture setVideoCaptureOutputDelegate]";
          __int16 v18 = 1024;
          int v19 = 505;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setSampleBufferDelegate queue is set to nil.", (uint8_t *)&v14, 0x1Cu);
        }
      }
      videoCaptureOutput = self->_videoCaptureOutput;
      __int16 v12 = self;
      int v13 = 0;
    }
    [(AVCaptureVideoDataOutput *)videoCaptureOutput setSampleBufferDelegate:v12 queue:v13];
  }
  else
  {
    int v8 = self->_videoCaptureOutput;
    [(AVCaptureVideoDataOutput *)v8 setSampleBufferDelegate:0 queue:0];
  }
}

- (void)initializeMetadataOutput
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Cannot add metadata output to the capture session.", v2, v3, v4, v5, v6);
}

- (void)setMetaDataObjectsDelegate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_isServerProcess)
  {
    if (self->_useAVConferenced)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() > 6)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        uint64_t v4 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          captureSessionQueue = self->_captureSessionQueue;
          int v8 = 136315906;
          uint64_t v9 = v3;
          __int16 v10 = 2080;
          uint64_t v11 = "-[VCAVFoundationCapture setMetaDataObjectsDelegate]";
          __int16 v12 = 1024;
          int v13 = 628;
          __int16 v14 = 2048;
          uint64_t v15 = captureSessionQueue;
          _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSessionQueue=%p", (uint8_t *)&v8, 0x26u);
        }
      }
      [(AVCaptureMetadataOutput *)self->_metadataOutput setMetadataObjectsDelegate:self queue:self->_captureSessionQueue];
      return;
    }
    metadataOutput = self->_metadataOutput;
    int v7 = self;
  }
  else
  {
    metadataOutput = self->_metadataOutput;
    int v7 = 0;
  }

  [(AVCaptureMetadataOutput *)metadataOutput setMetadataObjectsDelegate:v7 queue:0];
}

- (int)setCamera:(_VCVideoSourceToken)a3 width:(int)a4 height:(int)a5 frameRate:(int)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a3.var0.var0)
  {
    uint64_t v8 = *(void *)&a6;
    uint64_t v9 = *(void *)&a5;
    uint64_t v10 = *(void *)&a4;
    uint64_t v11 = objc_msgSend(+[VCVideoSourceTokenManager sharedManager](VCVideoSourceTokenManager, "sharedManager"), "deviceNameForToken:", a3.var0.var1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 136316930;
        uint64_t v31 = v12;
        __int16 v32 = 2080;
        __int16 v33 = "-[VCAVFoundationCapture setCamera:width:height:frameRate:]";
        __int16 v34 = 1024;
        int v35 = 2272;
        __int16 v36 = 1024;
        *(_VCVideoSourceToken *)__int16 v37 = a3;
        *(_WORD *)&v37[4] = 2112;
        *(void *)&v37[6] = v11;
        *(_WORD *)&v37[14] = 1024;
        *(_DWORD *)&v37[16] = v10;
        *(_WORD *)int v38 = 1024;
        *(_DWORD *)&v38[2] = v9;
        *(_WORD *)uint64_t v39 = 1024;
        *(_DWORD *)&v39[2] = v8;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sourceToken=0x%x, camera=%@, width=%d, height=%d, frameRate=%d", (uint8_t *)&v30, 0x3Eu);
      }
    }
    int v14 = -2146893792;
    if ([[(AVCaptureDeviceInput *)self->_videoDeviceInput device] uniqueID]
      && (objc_msgSend(v11, "isEqualToString:", -[AVCaptureDevice uniqueID](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "uniqueID")) & 1) != 0)
    {
      return -2146893775;
    }
    else
    {
      uint64_t v15 = [(AVCaptureDevice *)self->_captureDevice uniqueID];
      if (self->_captureDevice)
      {
        [(VCAVFoundationCapture *)self setUpCaptureDevicePropertyObservers:0];
      }
      uint64_t v16 = [(VCAVFoundationCapture *)self newCaptureDevice:v11];
      self->_captureDevice = v16;
      if (v16)
      {
        if ([(NSString *)v15 isEqualToString:v11])
        {
          [(VCAVFoundationCapture *)self setFrameRateInternal:v8 forceSourceFrameRateDidChange:0];
        }
        else
        {
          id v19 = +[VCEffectsManager sharedManager];
          if (VCEffectsManager_IsEffectsOn((uint64_t)v19)) {
            [v19 flushRemoteQueue];
          }
          [(AVCaptureSession *)self->_captureSession beginConfiguration];
          if ([(VCAVFoundationCapture *)self setVideoDeviceToSelectedDevice:self->_captureDevice])
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCAVFoundationCapture setCamera:width:height:frameRate:]();
              }
            }
          }
          int v14 = [(VCAVFoundationCapture *)self setVideoDeviceToWidth:v10 height:v9 frameRate:v8];
          [(VCAVFoundationCapture *)self configureMetadataTypesForOutput:self->_metadataOutput];
          BOOL v20 = [(VCAVFoundationCapture *)self shouldUseCameraVideoStabilization];
          [(VCAVFoundationCapture *)self setVideoStabilization:v20];
          [(VCAVFoundationCapture *)self setUpVideoZoomFactor];
          uint64_t v22 = v21;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v23 = VRTraceErrorLogLevelToCSTR();
            uint64_t v24 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              captureSession = self->_captureSession;
              int v30 = 136317186;
              uint64_t v31 = v23;
              __int16 v32 = 2080;
              __int16 v33 = "-[VCAVFoundationCapture setCamera:width:height:frameRate:]";
              __int16 v34 = 1024;
              int v35 = 2312;
              __int16 v36 = 2048;
              *(void *)__int16 v37 = captureSession;
              *(_WORD *)&v37[8] = 2048;
              *(void *)&v37[10] = v22;
              *(_WORD *)&v37[18] = 1024;
              *(_DWORD *)int v38 = v20;
              *(_WORD *)&v38[4] = 1024;
              *(_DWORD *)uint64_t v39 = v10;
              *(_WORD *)&v39[4] = 1024;
              int v40 = v9;
              __int16 v41 = 1024;
              int v42 = v8;
              _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d captureSession=%p zoomFactor=%f, stabilization=%d, width=%d, height=%d, frameRate=%d", (uint8_t *)&v30, 0x48u);
            }
          }
          [(AVCaptureSession *)self->_captureSession commitConfiguration];
        }
        [(VCAVFoundationCapture *)self setUpCaptureDevicePropertyObservers:1];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v26 = VRTraceErrorLogLevelToCSTR();
          BOOL v27 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v28 = [(AVCaptureDevice *)self->_captureDevice uniqueID];
            int v30 = 136315906;
            uint64_t v31 = v26;
            __int16 v32 = 2080;
            __int16 v33 = "-[VCAVFoundationCapture setCamera:width:height:frameRate:]";
            __int16 v34 = 1024;
            int v35 = 2320;
            __int16 v36 = 2112;
            *(void *)__int16 v37 = v28;
            _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Camera is set to %@", (uint8_t *)&v30, 0x26u);
          }
        }
        [(VCAVFoundationCapture *)self updateCameraZoomCapability];
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAVFoundationCapture setCamera:width:height:frameRate:]();
        }
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 136315650;
        uint64_t v31 = v17;
        __int16 v32 = 2080;
        __int16 v33 = "-[VCAVFoundationCapture setCamera:width:height:frameRate:]";
        __int16 v34 = 1024;
        int v35 = 2266;
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCVideoSourceToken is invalid!", (uint8_t *)&v30, 0x1Cu);
      }
    }
    [(VCVideoCaptureServer *)[(VCVideoCapture *)self captureServer] handleCaptureEvent:@"avCaptureSetCameraWithUIDFail"];
    return -2146893823;
  }
  return v14;
}

- (void)configureMetadataTypesForOutput:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = (void *)[a3 availableMetadataObjectTypes];
    uint8_t v6 = objc_opt_new();
    uint64_t v7 = *MEMORY[0x1E4F15E48];
    if ([v5 containsObject:*MEMORY[0x1E4F15E48]]
      && [(VCAVFoundationCapture *)self shouldAddTrackedFacesData])
    {
      [v6 addObject:v7];
    }
    uint64_t v8 = *MEMORY[0x1E4F15E30];
    if ([v5 containsObject:*MEMORY[0x1E4F15E30]]) {
      [v6 addObject:v8];
    }
    if ([v6 count]) {
      [a3 setMetadataObjectTypes:v6];
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315906;
        uint64_t v12 = v9;
        __int16 v13 = 2080;
        int v14 = "-[VCAVFoundationCapture configureMetadataTypesForOutput:]";
        __int16 v15 = 1024;
        int v16 = 620;
        __int16 v17 = 2112;
        __int16 v18 = v6;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setMetadataObjectTypes %@", (uint8_t *)&v11, 0x26u);
      }
    }
  }
}

- (void)updateCameraZoomCapability
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCAVFoundationCapture *)self isBackCamera];
  double v4 = 0.0;
  double v5 = 0.0;
  if (v3)
  {
    [[(AVCaptureDeviceInput *)self->_videoDeviceInput device] videoZoomFactor];
    double v4 = v6;
    [(AVCaptureDeviceFormat *)[[(AVCaptureDeviceInput *)self->_videoDeviceInput device] activeFormat] videoMaxZoomFactor];
    double v5 = v7;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316418;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      __int16 v13 = "-[VCAVFoundationCapture updateCameraZoomCapability]";
      __int16 v14 = 1024;
      int v15 = 2343;
      __int16 v16 = 1024;
      BOOL v17 = v3;
      __int16 v18 = 2048;
      double v19 = v4;
      __int16 v20 = 2048;
      double v21 = v5;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cameraZoomAvailable=%d, currentZoomFactor=%f, maxZoomFactor=%f", (uint8_t *)&v10, 0x36u);
    }
  }
  [(VCVideoCaptureServer *)[(VCVideoCapture *)self captureServer] setCameraZoomAvailable:v3 currentZoomFactor:v4 maxZoomFactor:v5];
}

- (BOOL)shouldUseCameraVideoStabilization
{
  uint64_t v2 = +[VCDefaults sharedInstance];

  return [(VCDefaults *)v2 cameraVideoStablization];
}

- (BOOL)shouldAddTrackedFacesData
{
  BOOL result = [(VCAVFoundationCapture *)self supportsDepthDataFormats];
  if (self->_cframingEnabled) {
    return 0;
  }
  return result;
}

- (void)setVideoStabilization:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v4 = (void *)[(AVCaptureVideoDataOutput *)self->_videoCaptureOutput connectionWithMediaType:*MEMORY[0x1E4F15C18]];
  if ([v4 isVideoStabilizationSupported])
  {
    [v4 setPreferredVideoStabilizationMode:v3];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        int v10 = "-[VCAVFoundationCapture setVideoStabilization:]";
        __int16 v11 = 1024;
        int v12 = 3083;
        __int16 v13 = 1024;
        int v14 = [v4 preferredVideoStabilizationMode];
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d preferred stabilization mode %d", (uint8_t *)&v7, 0x22u);
      }
    }
  }
}

- (double)setUpVideoZoomFactor
{
  BOOL v3 = [(AVCaptureDevice *)self->_captureDevice deviceType];
  if (v3 == (NSString *)*MEMORY[0x1E4F15818]
    || (double v4 = [(AVCaptureDevice *)self->_captureDevice deviceType],
        double cameraZoomFactor = 0.0,
        v4 == (NSString *)*MEMORY[0x1E4F157F0]))
  {
    double cameraZoomFactor = self->_cameraZoomFactor;
    if (cameraZoomFactor == 0.0)
    {
      objc_msgSend(-[NSArray firstObject](-[AVCaptureDevice virtualDeviceSwitchOverVideoZoomFactors](self->_captureDevice, "virtualDeviceSwitchOverVideoZoomFactors"), "firstObject"), "floatValue");
      double cameraZoomFactor = v6;
    }
    [(VCAVFoundationCapture *)self setCameraZoomFactor:cameraZoomFactor];
  }
  return cameraZoomFactor;
}

- (void)setUpCaptureDevicePropertyObservers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [&unk_1F3DC7818 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(&unk_1F3DC7818);
        }
        [(VCAVFoundationCapture *)self setUpCaptureDeviceObserver:v3 keyPath:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [&unk_1F3DC7818 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
  [(VCAVFoundationCapture *)self setUpBackgroundBlurDelegate:v3];
}

- (void)setUpCaptureDeviceObserver:(BOOL)a3 keyPath:(id)a4
{
  BOOL v5 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  captureDevice = self->_captureDevice;
  uint64_t v8 = (VCAVFoundationCapture *)objc_opt_class();
  if (captureDevice)
  {
    if (v8 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_16;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      long long v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v26 = 136316162;
      uint64_t v27 = v11;
      __int16 v28 = 2080;
      int v29 = "-[VCAVFoundationCapture setUpCaptureDeviceObserver:keyPath:]";
      __int16 v30 = 1024;
      int v31 = 2598;
      __int16 v32 = 1024;
      *(_DWORD *)__int16 v33 = v5;
      *(_WORD *)&v33[4] = 2112;
      *(void *)&v33[6] = a4;
      long long v13 = " [%s] %s:%d observe=%d, keyPath=%@";
      uint64_t v14 = v12;
      uint32_t v15 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v9 = (__CFString *)[(VCAVFoundationCapture *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_16;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      BOOL v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v26 = 136316674;
      uint64_t v27 = v16;
      __int16 v28 = 2080;
      int v29 = "-[VCAVFoundationCapture setUpCaptureDeviceObserver:keyPath:]";
      __int16 v30 = 1024;
      int v31 = 2598;
      __int16 v32 = 2112;
      *(void *)__int16 v33 = v9;
      *(_WORD *)&v33[8] = 2048;
      *(void *)&v33[10] = self;
      __int16 v34 = 1024;
      BOOL v35 = v5;
      __int16 v36 = 2112;
      id v37 = a4;
      long long v13 = " [%s] %s:%d %@(%p) observe=%d, keyPath=%@";
      uint64_t v14 = v17;
      uint32_t v15 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v26, v15);
LABEL_16:
    __int16 v18 = self->_captureDevice;
    if (v5) {
      [(AVCaptureDevice *)v18 addObserver:self forKeyPath:a4 options:7 context:self];
    }
    else {
      [(AVCaptureDevice *)v18 removeObserver:self forKeyPath:a4 context:self];
    }
    return;
  }
  if (v8 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 136315650;
        uint64_t v27 = v19;
        __int16 v28 = 2080;
        int v29 = "-[VCAVFoundationCapture setUpCaptureDeviceObserver:keyPath:]";
        __int16 v30 = 1024;
        int v31 = 2595;
        double v21 = " [%s] %s:%d _captureDevice is Null";
        uint64_t v22 = v20;
        uint32_t v23 = 28;
LABEL_26:
        _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v26, v23);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v10 = (__CFString *)[(VCAVFoundationCapture *)self performSelector:sel_logPrefix];
    }
    else {
      long long v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      __int16 v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 136316162;
        uint64_t v27 = v24;
        __int16 v28 = 2080;
        int v29 = "-[VCAVFoundationCapture setUpCaptureDeviceObserver:keyPath:]";
        __int16 v30 = 1024;
        int v31 = 2595;
        __int16 v32 = 2112;
        *(void *)__int16 v33 = v10;
        *(_WORD *)&v33[8] = 2048;
        *(void *)&v33[10] = self;
        double v21 = " [%s] %s:%d %@(%p) _captureDevice is Null";
        uint64_t v22 = v25;
        uint32_t v23 = 48;
        goto LABEL_26;
      }
    }
  }
}

- (id)newCaptureDevice:(id)a3
{
  if ([+[VCDefaults sharedInstance] useVirtualCapture])
  {
    BOOL v5 = [VCVirtualAVCaptureDevice alloc];
    uint64_t orientation = self->_orientation;
    return [(VCVirtualAVCaptureDevice *)v5 initWithUniqueID:a3 orientation:orientation];
  }
  else
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F16440] deviceWithUniqueID:a3];
    return v8;
  }
}

- (BOOL)isBackCamera
{
  return [(VCAVFoundationCapture *)self captureDevicePosition] == 1;
}

- (void)applyVideoRetainedBufferCountHint
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (+[VCHardwareSettings retainPixelBufferForMediaRecordingEnabled])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    BOOL v3 = (void *)[(AVCaptureVideoDataOutput *)self->_videoCaptureOutput connections];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v37 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v39;
      uint64_t v8 = &OBJC_IVAR___VCCallSession_peerCN;
      *(void *)&long long v5 = 136316418;
      long long v22 = v5;
      uint32_t v23 = v3;
      do
      {
        uint64_t v9 = 0;
        uint64_t v24 = v6;
        do
        {
          if (*(void *)v39 != v7) {
            objc_enumerationMutation(v3);
          }
          long long v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
          if (objc_msgSend(v10, "isVideoRetainedBufferCountHintSupported", v22, v23))
          {
            int v11 = *(_DWORD *)((char *)&self->super.super.isa + v8[410]);
            [(VCVideoCapture *)self captureServer];
            if (objc_opt_respondsToSelector())
            {
              int v12 = [(VCVideoCaptureServer *)[(VCVideoCapture *)self captureServer] bestCameraCaptureFrameRate];
              if (v12 > v11) {
                int v11 = v12;
              }
            }
            [v10 setVideoRetainedBufferCountHint:(3 * v11)];
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v13 = VRTraceErrorLogLevelToCSTR();
              uint64_t v14 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v15 = v7;
                uint64_t v16 = v8;
                captureSession = self->_captureSession;
                videoCaptureOutput = self->_videoCaptureOutput;
                int v19 = [v10 videoRetainedBufferCountHint];
                *(_DWORD *)buf = v22;
                uint64_t v26 = v13;
                __int16 v27 = 2080;
                __int16 v28 = "-[VCAVFoundationCapture applyVideoRetainedBufferCountHint]";
                __int16 v29 = 1024;
                int v30 = 530;
                __int16 v31 = 2112;
                __int16 v32 = captureSession;
                uint64_t v8 = v16;
                uint64_t v7 = v15;
                uint64_t v6 = v24;
                __int16 v33 = 2112;
                __int16 v34 = videoCaptureOutput;
                BOOL v3 = v23;
                __int16 v35 = 1024;
                int v36 = v19;
                _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession=%@ videoCaptureOutput=%@ videoRetainedBufferCountHint=%d", buf, 0x36u);
              }
            }
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v3 countByEnumeratingWithState:&v38 objects:v37 count:16];
      }
      while (v6);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    double v21 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = v20;
      __int16 v27 = 2080;
      __int16 v28 = "-[VCAVFoundationCapture applyVideoRetainedBufferCountHint]";
      __int16 v29 = 1024;
      int v30 = 520;
      _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoRetainedBufferCountHint is not supported on this platform", buf, 0x1Cu);
    }
  }
}

+ (id)newVideoCaptureOutput
{
  BOOL v2 = [+[VCDefaults sharedInstance] useVirtualCapture];
  BOOL v3 = (objc_class **)&off_1E6DB30B8;
  if (!v2) {
    BOOL v3 = (objc_class **)0x1E4F164C0;
  }
  uint64_t v4 = *v3;

  return objc_alloc_init(v4);
}

+ (id)newCaptureSession
{
  if ([+[VCDefaults sharedInstance] useVirtualCapture])
  {
    return objc_alloc_init(VCVirtualAVCaptureSession);
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F16498]);
    AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout();
    return v3;
  }
}

+ (id)newVideoDeviceInput:(id)a3 error:(id *)a4
{
  BOOL v6 = [+[VCDefaults sharedInstance] useVirtualCapture];
  uint64_t v7 = (Class *)off_1E6DB30B0;
  if (!v6) {
    uint64_t v7 = (Class *)0x1E4F16450;
  }
  id v8 = objc_alloc(*v7);

  return (id)[v8 initWithDevice:a3 error:a4];
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  void block[6] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_useAVConferenced)
  {
    [(VCAVFoundationCapture *)self processMetadataObjects:a4];
  }
  else
  {
    captureSessionQueue = self->_captureSessionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[4] = self;
    void block[5] = a4;
    block[2] = __79__VCAVFoundationCapture_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke;
    block[3] = &unk_1E6DB3E40;
    dispatch_async(captureSessionQueue, block);
  }
}

- (void)processMetadataObjects:(id)a3
{
  if ([(NSMutableArray *)self->_cachedDataArray count] == 5) {
    [(NSMutableArray *)self->_cachedDataArray removeObjectAtIndex:0];
  }
  cachedDataArray = self->_cachedDataArray;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithArray:a3];

  [(NSMutableArray *)cachedDataArray addObject:v6];
}

void __71__VCAVFoundationCapture_updateCenterStageEnabled_requestCaptureChange___block_invoke(uint64_t a1)
{
  *(void *)&v33[5] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 144) || !*(unsigned char *)(v1 + 238)) {
    return;
  }
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 228) == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      long long v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(unsigned __int8 *)(a1 + 40);
        int v26 = 136315906;
        if (v6) {
          uint64_t v7 = "enabled";
        }
        else {
          uint64_t v7 = "disabled";
        }
        uint64_t v27 = v4;
        __int16 v28 = 2080;
        __int16 v29 = "-[VCAVFoundationCapture updateCenterStageEnabled:requestCaptureChange:]_block_invoke";
        __int16 v30 = 1024;
        int v31 = 2171;
        __int16 v32 = 2080;
        *(void *)__int16 v33 = v7;
        id v8 = " [%s] %s:%d already %s.";
        uint64_t v9 = v5;
        uint32_t v10 = 38;
        goto LABEL_30;
      }
    }
    return;
  }
  *(unsigned char *)(v1 + 228) = v3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *(unsigned __int8 *)(a1 + 40);
      int v14 = *(unsigned __int8 *)(a1 + 41);
      int v26 = 136316162;
      uint64_t v27 = v11;
      __int16 v28 = 2080;
      __int16 v29 = "-[VCAVFoundationCapture updateCenterStageEnabled:requestCaptureChange:]_block_invoke";
      __int16 v30 = 1024;
      int v31 = 2176;
      __int16 v32 = 1024;
      *(_DWORD *)__int16 v33 = v13;
      v33[2] = 1024;
      *(_DWORD *)&v33[3] = v14;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d enabled=%d, requestCaptureChange=%d", (uint8_t *)&v26, 0x28u);
    }
  }
  [*(id *)(a1 + 32) captureServer];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureServer"), "centerStageEnabledDidChange:", *(unsigned __int8 *)(a1 + 40));
  }
  [*(id *)(*(void *)(a1 + 32) + 176) beginConfiguration];
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "device"), "lockForConfiguration:", 0))
  {
    if (*(unsigned char *)(a1 + 41))
    {
      [MEMORY[0x1E4F16440] setCenterStageControlMode:2];
      [MEMORY[0x1E4F16440] setCenterStageEnabled:*(unsigned __int8 *)(a1 + 40)];
    }
    uint64_t v15 = *(unsigned int **)(a1 + 32);
    uint64_t v16 = v15[70];
    if (*(unsigned char *)(a1 + 40))
    {
      if ((int)v16 < 31)
      {
LABEL_26:
        [*(id *)(a1 + 32) updateCenterStageRegionOfInterestWithLock:0];
        [*(id *)(a1 + 32) configureMetadataTypesForOutput:*(void *)(*(void *)(a1 + 32) + 200)];
        [*(id *)(a1 + 32) resetDepthDataOutput];
        objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "device"), "unlockForConfiguration");
        goto LABEL_27;
      }
      BOOL v17 = *(unsigned int **)(a1 + 32);
      uint64_t v18 = 30;
    }
    else
    {
      uint64_t v18 = [*(id *)(a1 + 32) getMaxAllowedFrameRate:v16];
      BOOL v17 = v15;
    }
    [v17 setFrameRateInternal:v18 forceSourceFrameRateDidChange:0];
    goto LABEL_26;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    uint64_t v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 144);
      int v26 = 136315906;
      uint64_t v27 = v19;
      __int16 v28 = 2080;
      __int16 v29 = "-[VCAVFoundationCapture updateCenterStageEnabled:requestCaptureChange:]_block_invoke";
      __int16 v30 = 1024;
      int v31 = 2202;
      __int16 v32 = 2112;
      *(void *)__int16 v33 = v21;
      _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to retain lock for video device input: %@", (uint8_t *)&v26, 0x26u);
    }
  }
LABEL_27:
  [*(id *)(*(void *)(a1 + 32) + 176) commitConfiguration];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint32_t v23 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v24 = [MEMORY[0x1E4F16440] isCenterStageEnabled];
      int v25 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "device"), "isCenterStageActive");
      int v26 = 136316162;
      uint64_t v27 = v22;
      __int16 v28 = 2080;
      __int16 v29 = "-[VCAVFoundationCapture updateCenterStageEnabled:requestCaptureChange:]_block_invoke";
      __int16 v30 = 1024;
      int v31 = 2205;
      __int16 v32 = 1024;
      *(_DWORD *)__int16 v33 = v24;
      v33[2] = 1024;
      *(_DWORD *)&v33[3] = v25;
      id v8 = " [%s] %s:%d Device enabled = %d, active = %d";
      uint64_t v9 = v23;
      uint32_t v10 = 40;
LABEL_30:
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v26, v10);
    }
  }
}

void __37__VCAVFoundationCapture_startPreview__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 345))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -2146893775;
  }
  else
  {
    *(unsigned char *)(v2 + 345) = 1;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    uint64_t v4 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      int v6 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315650;
        uint64_t v10 = v5;
        __int16 v11 = 2080;
        int v12 = "-[VCAVFoundationCapture startPreview]_block_invoke";
        __int16 v13 = 1024;
        int v14 = 1378;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession startRunning", (uint8_t *)&v9, 0x1Cu);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 176) startRunning];
    *(double *)(*(void *)(a1 + 32) + 296) = micro();
    [*(id *)(a1 + 32) unlockAVCaptureDeviceInputForConfiguration];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      id v8 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315650;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        int v12 = "-[VCAVFoundationCapture startPreview]_block_invoke";
        __int16 v13 = 1024;
        int v14 = 1382;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
      }
    }
  }
}

- (void)unlockAVCaptureDeviceInputForConfiguration
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL avCaptureDeviceInputLocked = self->_avCaptureDeviceInputLocked;
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      int v9 = "-[VCAVFoundationCapture unlockAVCaptureDeviceInputForConfiguration]";
      __int16 v10 = 1024;
      int v11 = 2432;
      __int16 v12 = 1024;
      BOOL v13 = avCaptureDeviceInputLocked;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unlock AVCaptureInputDevice for configuration, _avCaptureDeviceInputLocked=%d", (uint8_t *)&v6, 0x22u);
    }
  }
  if (self->_avCaptureDeviceInputLocked)
  {
    [[(AVCaptureDeviceInput *)self->_videoDeviceInput device] unlockForConfiguration];
    self->_BOOL avCaptureDeviceInputLocked = 0;
  }
}

- (void)captureSessionNotification:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  if ([(VCVideoCapture *)self captureServer])
  {
    captureSessionQueue = self->_captureSessionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__VCAVFoundationCapture_captureSessionNotification___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = a3;
    void block[5] = self;
    dispatch_async(captureSessionQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAVFoundationCapture captureSessionNotification:]();
    }
  }
}

- (BOOL)isFrameRateActive:(int)a3 captureFormat:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  memset(&v38, 170, sizeof(v38));
  if (self) {
    [(VCAVFoundationCapture *)self frameDurationForVideoDeviceFormat:a4 frameRate:*(void *)&a3];
  }
  else {
    memset(&v38, 0, sizeof(v38));
  }
  uint64_t v5 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
  if (v5) {
    [(AVCaptureDevice *)v5 activeVideoMinFrameDuration];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime time1 = v38;
  if (CMTimeCompare(&time1, &time2))
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
    if (v7) {
      [(AVCaptureDevice *)v7 activeVideoMaxFrameDuration];
    }
    else {
      memset(&v36, 0, sizeof(v36));
    }
    CMTime time1 = v38;
    BOOL v6 = CMTimeCompare(&time1, &v36) == 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x1E4F47A50];
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
        if (v11)
        {
          [(AVCaptureDevice *)v11 activeVideoMinFrameDuration];
          int v12 = v35;
        }
        else
        {
          int v12 = 0;
        }
        uint64_t v15 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
        if (v15)
        {
          [(AVCaptureDevice *)v15 activeVideoMinFrameDuration];
          int v16 = v34;
        }
        else
        {
          int v16 = 0;
        }
        BOOL v17 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
        if (v17)
        {
          [(AVCaptureDevice *)v17 activeVideoMaxFrameDuration];
          int v18 = v33;
        }
        else
        {
          int v18 = 0;
        }
        uint64_t v19 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
        if (v19)
        {
          [(AVCaptureDevice *)v19 activeVideoMaxFrameDuration];
          int v20 = v32;
        }
        else
        {
          int v20 = 0;
        }
        LODWORD(time1.value) = 136316930;
        *(CMTimeValue *)((char *)&time1.value + 4) = v8;
        LOWORD(time1.flags) = 2080;
        *(void *)((char *)&time1.flags + 2) = "-[VCAVFoundationCapture isFrameRateActive:captureFormat:]";
        HIWORD(time1.epoch) = 1024;
        int v40 = 2642;
        __int16 v41 = 1024;
        BOOL v42 = v6;
        __int16 v43 = 1024;
        int v44 = v12;
        __int16 v45 = 1024;
        int v46 = v16;
        __int16 v47 = 1024;
        int v48 = v18;
        __int16 v49 = 1024;
        int v50 = v20;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sameFrameDuration=%d, activeVideoMinFrameDuration.value=%d, activeVideoMinFrameDuration.timescale=%d,  activeVideoMaxFrameDuration.value=%d, activeVideoMaxFrameDuration.timescale=%d", (uint8_t *)&time1, 0x3Au);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      BOOL v13 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
      if (v13)
      {
        [(AVCaptureDevice *)v13 activeVideoMinFrameDuration];
        int v14 = v31;
      }
      else
      {
        int v14 = 0;
      }
      uint64_t v22 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
      if (v22)
      {
        [(AVCaptureDevice *)v22 activeVideoMinFrameDuration];
        int v23 = v30;
      }
      else
      {
        int v23 = 0;
      }
      int v24 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
      if (v24)
      {
        [(AVCaptureDevice *)v24 activeVideoMaxFrameDuration];
        int v25 = v29;
      }
      else
      {
        int v25 = 0;
      }
      int v26 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
      if (v26)
      {
        [(AVCaptureDevice *)v26 activeVideoMaxFrameDuration];
        int v27 = v28;
      }
      else
      {
        int v27 = 0;
      }
      LODWORD(time1.value) = 136316930;
      *(CMTimeValue *)((char *)&time1.value + 4) = v8;
      LOWORD(time1.flags) = 2080;
      *(void *)((char *)&time1.flags + 2) = "-[VCAVFoundationCapture isFrameRateActive:captureFormat:]";
      HIWORD(time1.epoch) = 1024;
      int v40 = 2642;
      __int16 v41 = 1024;
      BOOL v42 = v6;
      __int16 v43 = 1024;
      int v44 = v14;
      __int16 v45 = 1024;
      int v46 = v23;
      __int16 v47 = 1024;
      int v48 = v25;
      __int16 v49 = 1024;
      int v50 = v27;
      _os_log_debug_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d sameFrameDuration=%d, activeVideoMinFrameDuration.value=%d, activeVideoMinFrameDuration.timescale=%d,  activeVideoMaxFrameDuration.value=%d, activeVideoMaxFrameDuration.timescale=%d", (uint8_t *)&time1, 0x3Au);
    }
  }
  return v6;
}

void *__101__VCAVFoundationCapture_frameBecameAvailableCount_figBufferQueueEmptyCount_figBufferQueueErrorCount___block_invoke(void *result)
{
  uint64_t v1 = (_DWORD *)result[5];
  if (v1) {
    *uint64_t v1 = *(_DWORD *)(result[4] + 352);
  }
  uint64_t v2 = (_DWORD *)result[6];
  if (v2) {
    *uint64_t v2 = 0;
  }
  uint64_t v3 = (_DWORD *)result[7];
  if (v3) {
    _DWORD *v3 = 0;
  }
  return result;
}

- (int)frameBecameAvailableCount:(int *)a3 figBufferQueueEmptyCount:(int *)a4 figBufferQueueErrorCount:(int *)a5
{
  block[8] = *MEMORY[0x1E4F143B8];
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__VCAVFoundationCapture_frameBecameAvailableCount_figBufferQueueEmptyCount_figBufferQueueErrorCount___block_invoke;
  block[3] = &unk_1E6DB6ED8;
  block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  void block[7] = a5;
  dispatch_sync(captureSessionQueue, block);
  return 0;
}

- (void)dealloc
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAVFoundationCapture-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v34 = v3;
      __int16 v35 = 2080;
      CMTime v36 = "-[VCAVFoundationCapture dealloc]";
      __int16 v37 = 1024;
      int v38 = 434;
      __int16 v39 = 2048;
      int v40 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAVFoundationCapture-dealloc (%p)", buf, 0x26u);
    }
  }
  +[VCVisualAlert stop];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v5 = [(AVCaptureSession *)self->_captureSession inputs];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AVCaptureSession *)self->_captureSession removeInput:*(void *)(*((void *)&v29 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v28 count:16];
    }
    while (v7);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  __int16 v10 = [(AVCaptureSession *)self->_captureSession outputs];
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(AVCaptureSession *)self->_captureSession removeOutput:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v23 count:16];
    }
    while (v12);
  }
  [(VCAVFoundationCapture *)self unlockAVCaptureDeviceInputForConfiguration];

  [(AVCaptureVideoDataOutput *)self->_videoCaptureOutput setSampleBufferDelegate:0 queue:0];
  dispatch_release((dispatch_object_t)self->_captureSessionQueue);
  dispatch_release((dispatch_object_t)self->_viewPointCorrectionQueue);
  numberPropertyAllocator = self->_numberPropertyAllocator;
  if (numberPropertyAllocator)
  {
    CFRelease(numberPropertyAllocator);
    self->_numberPropertyAllocator = 0;
  }
  uncompressTransferSession = self->_uncompressTransferSession;
  if (uncompressTransferSession)
  {
    VTPixelTransferSessionInvalidate(uncompressTransferSession);
    BOOL v17 = self->_uncompressTransferSession;
    if (v17)
    {
      CFRelease(v17);
      self->_uncompressTransferSession = 0;
    }
  }
  uncompressedPixelFormatBufferPool = self->_uncompressedPixelFormatBufferPool;
  if (uncompressedPixelFormatBufferPool) {
    CVPixelBufferPoolRelease(uncompressedPixelFormatBufferPool);
  }
  compressTransferSession = self->_compressTransferSession;
  if (compressTransferSession)
  {
    VTPixelTransferSessionInvalidate(compressTransferSession);
    int v20 = self->_compressTransferSession;
    if (v20)
    {
      CFRelease(v20);
      self->_compressTransferSession = 0;
    }
  }
  compressedPixelFormatBufferPool = self->_compressedPixelFormatBufferPool;
  if (compressedPixelFormatBufferPool) {
    CVPixelBufferPoolRelease(compressedPixelFormatBufferPool);
  }
  v22.receiver = self;
  v22.super_class = (Class)VCAVFoundationCapture;
  [(VCVideoCapture *)&v22 dealloc];
}

- (void)tearDownSynchronizer
{
  self->_outputSynchronizer = 0;
  self->_outputSynchronizerOutputs = 0;
  [(VCAVFoundationCapture *)self setVideoCaptureOutputDelegate];

  [(VCAVFoundationCapture *)self setMetaDataObjectsDelegate];
}

- (void)initializeSynchronizedOutputs
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Video device input not in capture session inputs", v2, v3, v4, v5, v6);
}

+ (CGRect)calculateRegionOfInterest:(CGSize)a3 requestSize:(CGSize)a4
{
  float v4 = a4.width / a4.height;
  float v5 = a3.width / a3.height;
  double v6 = v4;
  BOOL v7 = v4 < v5;
  double v8 = a3.width / v4;
  double v9 = v8 / a3.height;
  double v10 = a3.width - a3.height * v6;
  double v11 = a3.height * v6 / a3.width;
  if (v7) {
    double v12 = v10 * 0.5 / a3.width;
  }
  else {
    double v12 = 0.0;
  }
  if (v7) {
    double v13 = 0.0;
  }
  else {
    double v13 = (a3.height - v8) * 0.5 / a3.height;
  }
  if (v7) {
    double v14 = v11;
  }
  else {
    double v14 = 1.0;
  }
  if (v7) {
    double v15 = 1.0;
  }
  else {
    double v15 = v9;
  }
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setFaceMeshTrackingEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__VCAVFoundationCapture_setFaceMeshTrackingEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(captureSessionQueue, block);
}

void __52__VCAVFoundationCapture_setFaceMeshTrackingEnabled___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 224) = *(unsigned char *)(a1 + 40);
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[224]) {
    [v2 initializeSynchronizedOutputs];
  }
  else {
    [v2 tearDownSynchronizer];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    float v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      uint64_t v14 = v3;
      __int16 v15 = 2080;
      int v16 = "-[VCAVFoundationCapture setFaceMeshTrackingEnabled:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 880;
      __int16 v19 = 1024;
      LODWORD(v20) = v5;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Face mesh tracking enabled %d", buf, 0x22u);
    }
  }
  int v11 = 15;
  if ([+[VCDefaults sharedInstance] shouldOverrideEffectsFramerate:&v11])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      BOOL v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        int v16 = "-[VCAVFoundationCapture setFaceMeshTrackingEnabled:]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 884;
        __int16 v19 = 1024;
        LODWORD(v20) = v11;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing Effects frame rate: %d", buf, 0x22u);
      }
    }
  }
  if ([*(id *)(a1 + 32) supportsDepthDataFormats])
  {
    if ([*(id *)(*(void *)(a1 + 32) + 216) lockForConfiguration:&v12])
    {
      [*(id *)(a1 + 32) updateDepthFrameRate];
      [*(id *)(*(void *)(a1 + 32) + 216) unlockForConfiguration];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      double v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 216);
        *(_DWORD *)buf = 136316162;
        uint64_t v14 = v8;
        __int16 v15 = 2080;
        int v16 = "-[VCAVFoundationCapture setFaceMeshTrackingEnabled:]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 892;
        __int16 v19 = 2112;
        uint64_t v20 = v10;
        __int16 v21 = 2112;
        uint64_t v22 = v12;
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to retain lock for capture device=%@. Error=%@", buf, 0x30u);
      }
    }
  }
}

- (void)setEffectsApplied:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VCAVFoundationCapture_setEffectsApplied___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  BOOL v5 = a3;
  block[4] = self;
  dispatch_async(captureSessionQueue, block);
}

uint64_t __43__VCAVFoundationCapture_setEffectsApplied___block_invoke(uint64_t result)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 227))
  {
    uint64_t v3 = result;
    *(unsigned char *)(v2 + 227) = v1;
    uint64_t v4 = *(void *)(result + 32);
    if (*(unsigned char *)(v4 + 227))
    {
      unsigned int v11 = 15;
      if ([+[VCDefaults sharedInstance] shouldOverrideEffectsFramerate:&v11])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v5 = VRTraceErrorLogLevelToCSTR();
          uint64_t v6 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v13 = v5;
            __int16 v14 = 2080;
            __int16 v15 = "-[VCAVFoundationCapture setEffectsApplied:]_block_invoke";
            __int16 v16 = 1024;
            int v17 = 904;
            __int16 v18 = 1024;
            unsigned int v19 = v11;
            _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing Effects frame rate: %d", buf, 0x22u);
          }
        }
      }
    }
    else
    {
      unsigned int v11 = *(_DWORD *)(v4 + 280);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v9 = *(unsigned __int8 *)(v3 + 40);
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v7;
        __int16 v14 = 2080;
        __int16 v15 = "-[VCAVFoundationCapture setEffectsApplied:]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 906;
        __int16 v18 = 1024;
        unsigned int v19 = v9;
        __int16 v20 = 1024;
        unsigned int v21 = v11;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Effects applied %d, framerate %d", buf, 0x28u);
      }
    }
    CGRect result = *(void *)(v3 + 32);
    if (*(_DWORD *)(result + 272) != v11)
    {
      uint64_t v10 = (void *)[(id)result captureServer];
      return [v10 setCaptureFrameRate:v11];
    }
  }
  return result;
}

- (void)encodeProcessedPixelBuffer:(__CVBuffer *)a3 time:(id *)a4 imageData:(id)a5 processTime:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int64_t var0 = a4->var0;
        *(_DWORD *)buf = 136315906;
        uint64_t v20 = v11;
        __int16 v21 = 2080;
        uint64_t v22 = "-[VCAVFoundationCapture encodeProcessedPixelBuffer:time:imageData:processTime:]";
        __int16 v23 = 1024;
        int v24 = 917;
        __int16 v25 = 2048;
        int64_t v26 = var0;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Send processed video frame to encoder %lld", buf, 0x26u);
        if (!a3) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[VCAVFoundationCapture encodeProcessedPixelBuffer:time:imageData:processTime:]();
      if (!a3) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  if (a3) {
LABEL_8:
  }
    CFRetain(a3);
LABEL_9:
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__VCAVFoundationCapture_encodeProcessedPixelBuffer_time_imageData_processTime___block_invoke;
  block[3] = &unk_1E6DB79E8;
  block[4] = self;
  void block[5] = a6;
  long long v17 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  void block[6] = a5;
  void block[7] = a3;
  dispatch_async(captureSessionQueue, block);
}

void __79__VCAVFoundationCapture_encodeProcessedPixelBuffer_time_imageData_processTime___block_invoke(uint64_t a1)
{
  v16[1] = *(CMSampleBufferRef *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[348]) {
    [v2 updateRenderProcessFrameRate:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(__CVBuffer **)(a1 + 56);
  long long v14 = *(_OWORD *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 80);
  uint64_t v4 = createSampleBufferWithPixelBuffer(v3, &v14);
  v16[0] = v4;
  uint64_t v5 = [*(id *)(a1 + 32) isFrontCamera];
  if (*(void *)(a1 + 48))
  {
    *(void *)&long long v14 = 0;
    uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
    if (VCAVFoundationGetARImageData_onceToken != -1) {
      dispatch_once(&VCAVFoundationGetARImageData_onceToken, &__block_literal_global_5);
    }
    uint64_t v7 = (void *)[v6 unarchivedObjectOfClass:VCAVFoundationGetARImageData_cls fromData:*(void *)(a1 + 48) error:&v14];
    BOOL v8 = objc_msgSend(v7, "cameraPosition", (void)v14) != 1;
  }
  else
  {
    BOOL v8 = v5;
  }
  unsigned int v9 = (long long *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v10 + 448))
  {
    uint64_t v11 = *(OpaqueVTPixelTransferSession **)(v10 + 472);
    uint64_t v12 = *(__CVPixelBufferPool **)(v10 + 480);
    long long v14 = *v9;
    uint64_t v15 = *(void *)(a1 + 80);
    _VCAVFoundationCapture_ConvertPixelFormat(v11, v12, v16, (uint64_t)&v14);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v4 = v16[0];
  }
  long long v14 = *v9;
  uint64_t v15 = *(void *)(a1 + 80);
  _VCAVFoundationCapture_PushFrameToCaptureServer((_DWORD *)v10, v4, &v14, v8 ^ 1, v8);
  FigSampleBufferRelease();
  uint64_t v13 = *(const void **)(a1 + 56);
  if (v13) {
    CFRelease(v13);
  }
}

- (void)updateRenderProcessFrameRate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [a3 floatValue];
    uint64_t v5 = [(NSMutableArray *)self->_renderFrameTimes count];
    if (v5 == +[VCDefaults integerValueForKey:@"effectsProcessWindow" defaultValue:60])
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_renderFrameTimes, "objectAtIndexedSubscript:", 0), "floatValue");
      self->_processTimeSum = self->_processTimeSum - v6;
      [(NSMutableArray *)self->_renderFrameTimes removeObjectAtIndex:0];
    }
    [(NSMutableArray *)self->_renderFrameTimes addObject:a3];
    [a3 floatValue];
    float v8 = v7 + self->_processTimeSum;
    self->_processTimeSum = v8;
    float v9 = v8 / (float)(unint64_t)[(NSMutableArray *)self->_renderFrameTimes count];
    uint64_t v10 = [(AVCaptureDeviceInput *)self->_videoDeviceInput device];
    if (v10) {
      [(AVCaptureDevice *)v10 activeVideoMaxFrameDuration];
    }
    else {
      memset(&v19, 0, sizeof(v19));
    }
    float Seconds = CMTimeGetSeconds(&v19);
    double v12 = Seconds;
    +[VCDefaults getDoubleValueForKey:@"effectsProcessBoundPercentage" defaultValue:0.1];
    float v14 = v12 - v12 * v13;
    +[VCDefaults getDoubleValueForKey:@"effectsProcessBoundPercentage" defaultValue:0.1];
    float v17 = v12 + v12 * v16;
    if (v9 < v14 || v9 > v17)
    {
      LODWORD(v15) = vcvtms_s32_f32(1.0 / v9);
      [(VCAVFoundationCapture *)self setFrameRateInternal:v15 forceSourceFrameRateDidChange:0];
    }
  }
}

void __79__VCAVFoundationCapture_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) processMetadataObjects:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 40);
}

uint64_t __76__VCAVFoundationCapture_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1)
{
  _VCAVFoundationCapture_ProcessSampleBufferWithCaptureOutput(*(CVImageBufferRef *)(a1 + 32), *(opaqueCMSampleBuffer **)(a1 + 48), *(void **)(a1 + 40));

  return FigSampleBufferRelease();
}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  float v7 = (void *)[a4 objectForKeyedSubscript:self->_videoCaptureOutput];
  float v8 = (void *)[a4 objectForKeyedSubscript:self->_metadataOutput];
  if (self->_depthDataOutput) {
    float v9 = objc_msgSend(a4, "objectForKeyedSubscript:");
  }
  else {
    float v9 = 0;
  }
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "dataOutputs"), "firstObject");
  uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "connectionWithMediaType:", *MEMORY[0x1E4F15C18]), "inputPorts"), "firstObject");
  uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "input"), "device");
  if (v7)
  {
    double v13 = (void *)v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v14 = (opaqueCMSampleBuffer *)[v7 sampleBuffer];
      if ([v7 sampleBufferWasDropped])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          double v16 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAVFoundationCapture dataOutputSynchronizer:didOutputSynchronizedDataCollection:](v15, v7, v16);
          }
        }
      }
      else
      {
        [v11 clock];
        _VCAVFoundationCapture_ProcessSampleBuffer((CVImageBufferRef)self, v14, v9, v8, v13);
      }
    }
  }
}

- (int)startCaptureWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAVFoundationCapture startCaptureWithWidth:height:frameRate:]";
      *(_WORD *)&buf[22] = 1024;
      int v19 = 1389;
      __int16 v20 = 1024;
      int v21 = a3;
      __int16 v22 = 1024;
      int v23 = a4;
      __int16 v24 = 1024;
      int v25 = a5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d width=%d, height=%d, frameRate=%d", buf, 0x2Eu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  int v19 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__VCAVFoundationCapture_startCaptureWithWidth_height_frameRate___block_invoke;
  v14[3] = &unk_1E6DB5210;
  int v15 = a3;
  int v16 = a4;
  v14[4] = self;
  v14[5] = buf;
  int v17 = a5;
  dispatch_sync(captureSessionQueue, v14);
  int v12 = *(_DWORD *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v12;
}

void __64__VCAVFoundationCapture_startCaptureWithWidth_height_frameRate___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) captureServer];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureServer"), "centerStageEnabledDidChange:", *(unsigned __int8 *)(*(void *)(a1 + 32) + 228));
  }
  [*(id *)(a1 + 32) captureServer];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureServer"), "portraitBlurEnabledDidChange:", *(unsigned __int8 *)(*(void *)(a1 + 32) + 240));
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 346)
    && *(double *)(v2 + 312) == (double)*(int *)(a1 + 48)
    && *(double *)(v2 + 320) == (double)*(int *)(a1 + 52))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = v3;
        __int16 v14 = 2080;
        int v15 = "-[VCAVFoundationCapture startCaptureWithWidth:height:frameRate:]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 1404;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Capture is already running with the same camera format", (uint8_t *)&v12, 0x1Cu);
      }
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    int v6 = -2146893775;
LABEL_22:
    *(_DWORD *)(v5 + 24) = v6;
    return;
  }
  if (!*(unsigned char *)(v2 + 345))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __64__VCAVFoundationCapture_startCaptureWithWidth_height_frameRate___block_invoke_cold_1();
      }
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    int v6 = -2146893820;
    goto LABEL_22;
  }
  float v7 = (double *)(v2 + 312);
  int v8 = *(_DWORD *)(a1 + 52);
  *float v7 = (double)*(int *)(a1 + 48);
  v7[1] = (double)v8;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setVideoDeviceToWidth:height:frameRate:");
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 346) = 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 346);
      int v12 = 136315906;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      int v15 = "-[VCAVFoundationCapture startCaptureWithWidth:height:frameRate:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 1426;
      __int16 v18 = 1024;
      int v19 = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _isCapturing = %d", (uint8_t *)&v12, 0x22u);
    }
  }
}

- (int64_t)captureTierForEncodingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int64_t v6 = 0;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int64_t v7 = -1;
  uint64_t v8 = -1;
  double v9 = a3.width / a3.height;
  while (1)
  {
    +[VideoUtil sizeForVideoResolution:v6];
    double v11 = v10;
    double v13 = v12;
    int v14 = (int)v10;
    int v15 = (int)v12;
    if (![(VCAVFoundationCapture *)self cameraSupportsNoQueueFormatWidth:(int)v10 height:(int)v12])
    {
      int64_t v17 = v8;
      goto LABEL_15;
    }
    if (width == (double)v14 && height == (double)v15) {
      goto LABEL_23;
    }
    int64_t v17 = v6;
    if (vabdd_f64(v11 / v13, v9) < 0.05) {
      break;
    }
LABEL_15:
    ++v6;
    uint64_t v8 = v17;
    if (v6 == 28) {
      goto LABEL_24;
    }
  }
  if (v11 <= width || v13 <= height)
  {
    int64_t v17 = v8;
    int64_t v7 = v6;
    goto LABEL_15;
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (ErrorLogLevelForModule >= 8)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    int v21 = *MEMORY[0x1E4F47A50];
    __int16 v22 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 136316418;
        uint64_t v25 = v20;
        __int16 v26 = 2080;
        uint64_t v27 = "-[VCAVFoundationCapture captureTierForEncodingSize:]";
        __int16 v28 = 1024;
        int v29 = 1449;
        __int16 v30 = 2048;
        int64_t v31 = v6;
        __int16 v32 = 2048;
        double v33 = v11;
        __int16 v34 = 2048;
        double v35 = v13;
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d resolution uint64_t i = %ld, found optimal capture tier. width=%f, height=%f", (uint8_t *)&v24, 0x3Au);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      int v24 = 136316418;
      uint64_t v25 = v20;
      __int16 v26 = 2080;
      uint64_t v27 = "-[VCAVFoundationCapture captureTierForEncodingSize:]";
      __int16 v28 = 1024;
      int v29 = 1449;
      __int16 v30 = 2048;
      int64_t v31 = v6;
      __int16 v32 = 2048;
      double v33 = v11;
      __int16 v34 = 2048;
      double v35 = v13;
      _os_log_debug_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEBUG, " [%s] %s:%d resolution uint64_t i = %ld, found optimal capture tier. width=%f, height=%f", (uint8_t *)&v24, 0x3Au);
    }
  }
LABEL_23:
  int64_t v17 = v8;
  int64_t v7 = v6;
LABEL_24:
  if (v7 == -1) {
    return v17;
  }
  else {
    return v7;
  }
}

- (int)stop:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL isPreviewing = self->_isPreviewing;
      BOOL isCapturing = self->_isCapturing;
      *(_DWORD *)buf = 136316418;
      uint64_t v14 = v5;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCAVFoundationCapture stop:]";
      __int16 v17 = 1024;
      int v18 = 1460;
      __int16 v19 = 1024;
      BOOL v20 = v3;
      __int16 v21 = 1024;
      BOOL v22 = isPreviewing;
      __int16 v23 = 1024;
      BOOL v24 = isCapturing;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d shouldStopPreview=%d _isPreviewing=%d _isCapturing=%d", buf, 0x2Eu);
    }
  }
  captureSessionQueue = self->_captureSessionQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__VCAVFoundationCapture_stop___block_invoke;
  v11[3] = &unk_1E6DB3DF0;
  v11[4] = self;
  BOOL v12 = v3;
  dispatch_sync(captureSessionQueue, v11);
  return 0;
}

void __30__VCAVFoundationCapture_stop___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 346) || *(unsigned char *)(v2 + 345))
  {
    *(unsigned char *)(v2 + 346) = 0;
    if (*(unsigned char *)(a1 + 40))
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 345) = 0;
      [*(id *)(*(void *)(a1 + 32) + 176) stopRunning];
      *(double *)(*(void *)(a1 + 32) + 304) = micro()
                                                - *(double *)(*(void *)(a1 + 32) + 296)
                                                + *(double *)(*(void *)(a1 + 32) + 304);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        uint64_t v4 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315650;
          uint64_t v11 = v3;
          __int16 v12 = 2080;
          double v13 = "-[VCAVFoundationCapture stop:]_block_invoke";
          __int16 v14 = 1024;
          int v15 = 1472;
          _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession stopRunning", (uint8_t *)&v10, 0x1Cu);
        }
      }
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureServer"), "handleCaptureEvent:", @"avCaptureCameraDidStop");
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(unsigned __int8 *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = *(unsigned __int8 *)(v8 + 345);
      LODWORD(v8) = *(unsigned __int8 *)(v8 + 346);
      int v10 = 136316418;
      uint64_t v11 = v5;
      __int16 v12 = 2080;
      double v13 = "-[VCAVFoundationCapture stop:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 1464;
      __int16 v16 = 1024;
      int v17 = v7;
      __int16 v18 = 1024;
      int v19 = v9;
      __int16 v20 = 1024;
      int v21 = v8;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d preview already stopped! shouldStopPreview=%d _isPreviewing=%d _isCapturing=%d", (uint8_t *)&v10, 0x2Eu);
    }
  }
}

- (int)invalidate
{
  v4[5] = *MEMORY[0x1E4F143B8];
  captureSessionQueue = self->_captureSessionQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__VCAVFoundationCapture_invalidate__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_sync(captureSessionQueue, v4);
  return 0;
}

uint64_t __35__VCAVFoundationCapture_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUpCaptureDevicePropertyObservers:0];
}

- (int)setWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VCAVFoundationCapture_setWidth_height_frameRate___block_invoke;
  block[3] = &unk_1E6DB5210;
  int v9 = a3;
  int v10 = a4;
  block[4] = self;
  void block[5] = &v12;
  int v11 = a5;
  dispatch_sync(captureSessionQueue, block);
  int v6 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v6;
}

void __51__VCAVFoundationCapture_setWidth_height_frameRate___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (double *)(*(void *)(a1 + 32) + 312);
  int v3 = *(_DWORD *)(a1 + 52);
  *uint64_t v2 = (double)*(int *)(a1 + 48);
  v2[1] = (double)v3;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setVideoDeviceToWidth:height:frameRate:");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(_DWORD *)(a1 + 48);
      int v7 = *(_DWORD *)(a1 + 52);
      int v8 = *(_DWORD *)(a1 + 56);
      int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v10 = 136316674;
      uint64_t v11 = v4;
      __int16 v12 = 2080;
      double v13 = "-[VCAVFoundationCapture setWidth:height:frameRate:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 1493;
      __int16 v16 = 1024;
      int v17 = v6;
      __int16 v18 = 1024;
      int v19 = v7;
      __int16 v20 = 1024;
      int v21 = v8;
      __int16 v22 = 1024;
      int v23 = v9;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %dx%d/%d, error=%d", (uint8_t *)&v10, 0x34u);
    }
  }
}

- (int)copyColorInfo:(const __CFDictionary *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  captureSessionQueue = self->_captureSessionQueue;
  int v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__VCAVFoundationCapture_copyColorInfo___block_invoke;
  v6[3] = &unk_1E6DB3F80;
  v6[5] = &v7;
  void v6[6] = a3;
  v6[4] = self;
  dispatch_sync(captureSessionQueue, v6);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __39__VCAVFoundationCapture_copyColorInfo___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    Mutable = CFDictionaryCreateMutable(0, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32)+ 144), "device"), "activeFormat"), "formatDescription"));
    int v4 = (const void *)[(__CFDictionary *)Extensions objectForKeyedSubscript:*MEMORY[0x1E4F24A90]];
    uint64_t v5 = (const void *)[(__CFDictionary *)Extensions objectForKeyedSubscript:*MEMORY[0x1E4F24BC8]];
    int v6 = (const void *)[(__CFDictionary *)Extensions objectForKeyedSubscript:*MEMORY[0x1E4F24C18]];
    if (v4) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F44868], v4);
    }
    if (v5) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F44B58], v5);
    }
    if (v6) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F44BB0], v6);
    }
    **(void **)(a1 + 48) = Mutable;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -2146893823;
  }
}

- (BOOL)isPreviewRunning
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__VCAVFoundationCapture_isPreviewRunning__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(captureSessionQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__VCAVFoundationCapture_isPreviewRunning__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 345);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    char v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v5 = 136315906;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCAVFoundationCapture isPreviewRunning]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 1531;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isPreviewRunning=%d", (uint8_t *)&v5, 0x22u);
    }
  }
}

- (int)getFrameRate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__VCAVFoundationCapture_getFrameRate__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(captureSessionQueue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__VCAVFoundationCapture_getFrameRate__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 272);
  return result;
}

- (BOOL)isCurrentCaptureDeviceAppleProduct
{
  uint64_t v2 = [(AVCaptureDevice *)self->_captureDevice manufacturer];

  return [(NSString *)v2 containsString:@"Apple Inc."];
}

- (BOOL)supportsPortraitResolution
{
  return self->_supportPortraitResolution;
}

- (int)configureCaptureWithToken:(_VCVideoSourceToken)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  captureSessionQueue = self->_captureSessionQueue;
  int v11 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__VCAVFoundationCapture_configureCaptureWithToken___block_invoke;
  v6[3] = &unk_1E6DB6790;
  v6[4] = self;
  v6[5] = &v8;
  $948446A44E2BC96870B572155DF52E0B var0 = a3.var0.var0;
  dispatch_sync(captureSessionQueue, v6);
  int v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __51__VCAVFoundationCapture_configureCaptureWithToken___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 176) beginConfiguration];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) setCamera:*(unsigned int *)(a1 + 48) width:(int)*(double *)(*(void *)(a1 + 32)+ 312) height:(int)*(double *)(*(void *)(a1 + 32)+ 320) frameRate:*(unsigned int *)(*(void *)(a1 + 32) + 280)];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    int v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(a1 + 48);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v5 + 312);
      uint64_t v6 = *(void *)(v5 + 320);
      int v8 = *(_DWORD *)(v5 + 280);
      int v9 = *(unsigned __int8 *)(v5 + 345);
      uint64_t v10 = *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v13 = 136317186;
      uint64_t v14 = v2;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCAVFoundationCapture configureCaptureWithToken:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 1745;
      __int16 v19 = 1024;
      int v20 = v4;
      __int16 v21 = 2048;
      uint64_t v22 = v7;
      __int16 v23 = 2048;
      uint64_t v24 = v6;
      __int16 v25 = 1024;
      int v26 = v8;
      __int16 v27 = 1024;
      int v28 = v9;
      __int16 v29 = 2048;
      uint64_t v30 = v10;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoSourceToken=0x%x(%4.0fx%4.0f/%d), isPreviewing=%d, error=0x%lx", (uint8_t *)&v13, 0x4Cu);
    }
  }
  int v11 = *(unsigned char **)(a1 + 32);
  if (v11[345])
  {
    [v11 unlockAVCaptureDeviceInputForConfiguration];
    int v11 = *(unsigned char **)(a1 + 32);
  }
  [v11 applyVideoRetainedBufferCountHint];
  return [*(id *)(*(void *)(a1 + 32) + 176) commitConfiguration];
}

- (void)getReportingStats:(__CFDictionary *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3 && self->_isCapturing)
  {
    int VPCProcessedFrameCount = self->_VPCProcessedFrameCount;
    if (VPCProcessedFrameCount) {
      float v6 = (float)(self->_viewpointProcessTime / (float)VPCProcessedFrameCount) * 1000.0;
    }
    else {
      float v6 = 0.0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      int v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = self->_VPCProcessedFrameCount;
        int VPCModifiedFrameCount = self->_VPCModifiedFrameCount;
        int v13 = 136316418;
        uint64_t v14 = v7;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCAVFoundationCapture getReportingStats:]";
        __int16 v17 = 1024;
        int v18 = 1837;
        __int16 v19 = 1024;
        int v20 = v9;
        __int16 v21 = 1024;
        int v22 = VPCModifiedFrameCount;
        __int16 v23 = 2048;
        double v24 = v6;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Viewpoint Health - processed frames:%d (modified=%u), average process time ms: %4.3f", (uint8_t *)&v13, 0x32u);
      }
    }
    uint64_t v11 = [(VCAVFoundationCapture *)self isFrontCamera] ^ 1;
    CFDictionaryAddValue(a3, @"VPCFRAMECOUNT", (const void *)[NSNumber numberWithInt:self->_VPCProcessedFrameCount]);
    CFDictionaryAddValue(a3, @"VPCMODIFYCOUNT", (const void *)[NSNumber numberWithInt:self->_VPCModifiedFrameCount]);
    *(float *)&double v12 = v6;
    CFDictionaryAddValue(a3, @"VPCPROCESSTIME", (const void *)[NSNumber numberWithFloat:v12]);
    CFDictionaryAddValue(a3, @"CAMRESW", (const void *)[NSNumber numberWithInt:self->_activeWidth]);
    CFDictionaryAddValue(a3, @"CAMRESH", (const void *)[NSNumber numberWithInt:self->_activeHeight]);
    CFDictionaryAddValue(a3, @"CAMPOSCUR", (const void *)[NSNumber numberWithInt:v11]);
    [(VCAVFoundationCapture *)self collectCaptureFrameRateStats:a3];
    CFDictionaryAddValue(a3, @"CAMSLA", (const void *)objc_msgSend(NSNumber, "numberWithBool:", -[AVCaptureDevice isStudioLightActive](self->_captureDevice, "isStudioLightActive")));
    CFDictionaryAddValue(a3, @"CAMBGRA", (const void *)objc_msgSend(NSNumber, "numberWithBool:", -[AVCaptureDevice isBackgroundReplacementActive](self->_captureDevice, "isBackgroundReplacementActive")));
    [(VCAVFoundationCapture *)self resetViewPointLogging];
  }
}

- (void)applyBlockToAllAvailableCaptureFormats:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v4 = [&unk_1F3DC7800 countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(&unk_1F3DC7800);
        }
        int v8 = (void *)[MEMORY[0x1E4F16440] deviceWithUniqueID:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        int v9 = (void *)[v8 formats];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v26 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v28 != v12) {
                objc_enumerationMutation(v9);
              }
              (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v27 + 1) + 8 * j));
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v26 count:16];
          }
          while (v11);
        }
      }
      uint64_t v5 = [&unk_1F3DC7800 countByEnumeratingWithState:&v32 objects:v31 count:16];
    }
    while (v5);
  }
  captureDevice = self->_captureDevice;
  if (captureDevice)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    __int16 v15 = [(AVCaptureDevice *)captureDevice formats];
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v22 objects:v21 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t k = 0; k != v17; ++k)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v22 + 1) + 8 * k));
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v22 objects:v21 count:16];
      }
      while (v17);
    }
  }
}

- (BOOL)isCenterStageSupported
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__VCAVFoundationCapture_isCenterStageSupported__block_invoke;
  v4[3] = &unk_1E6DB7A10;
  v4[4] = &v5;
  [(VCAVFoundationCapture *)self applyBlockToAllAvailableCaptureFormats:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __47__VCAVFoundationCapture_isCenterStageSupported__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCenterStageSupported];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

- (BOOL)isPortraitModeSupported
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__VCAVFoundationCapture_isPortraitModeSupported__block_invoke;
  v4[3] = &unk_1E6DB7A10;
  v4[4] = &v5;
  [(VCAVFoundationCapture *)self applyBlockToAllAvailableCaptureFormats:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __48__VCAVFoundationCapture_isPortraitModeSupported__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isPortraitEffectSupported];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

- (BOOL)isStudioLightSupported
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__VCAVFoundationCapture_isStudioLightSupported__block_invoke;
  v4[3] = &unk_1E6DB7A10;
  v4[4] = &v5;
  [(VCAVFoundationCapture *)self applyBlockToAllAvailableCaptureFormats:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __47__VCAVFoundationCapture_isStudioLightSupported__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isStudioLightSupported];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

- (BOOL)isReactionSupported
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__VCAVFoundationCapture_isReactionSupported__block_invoke;
  v4[3] = &unk_1E6DB7A10;
  v4[4] = &v5;
  [(VCAVFoundationCapture *)self applyBlockToAllAvailableCaptureFormats:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__VCAVFoundationCapture_isReactionSupported__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 reactionEffectsSupported];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

- (BOOL)isBackgroundReplacementSupported
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__VCAVFoundationCapture_isBackgroundReplacementSupported__block_invoke;
  v4[3] = &unk_1E6DB7A10;
  v4[4] = &v5;
  [(VCAVFoundationCapture *)self applyBlockToAllAvailableCaptureFormats:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __57__VCAVFoundationCapture_isBackgroundReplacementSupported__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isBackgroundReplacementSupported];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

- (BOOL)isBackgroundReplacementSupportedForContinuityCamera
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__VCAVFoundationCapture_isBackgroundReplacementSupportedForContinuityCamera__block_invoke;
  v4[3] = &unk_1E6DB7A10;
  v4[4] = &v5;
  [(VCAVFoundationCapture *)self applyBlockToAllAvailableCaptureFormats:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __76__VCAVFoundationCapture_isBackgroundReplacementSupportedForContinuityCamera__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isBackgroundReplacementSupportedForContinuityCamera];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

- (void)reportStatus:(__CFDictionary *)a3 forKey:(__CFString *)a4 supported:(BOOL)a5 enabled:(BOOL)a6
{
  uint64_t v8 = [(VCAVFoundationCapture *)self featureStatusForFeatureSupported:a5 enabled:a6];
  uint64_t v9 = (const void *)[NSNumber numberWithChar:v8];

  CFDictionaryAddValue(a3, a4, v9);
}

- (void)retrieveInitialReportingStats:(__CFDictionary *)a3
{
  if (a3)
  {
    if (self->_isViewpointSupported) {
      char viewPointCorrectionEnabled = self->_viewPointCorrectionEnabled;
    }
    else {
      char viewPointCorrectionEnabled = -1;
    }
    CFDictionaryAddValue(a3, @"VideoEyeContact", (const void *)[NSNumber numberWithChar:viewPointCorrectionEnabled]);
    BOOL v6 = [(VCAVFoundationCapture *)self isPortraitModeSupported];
    -[VCAVFoundationCapture reportStatus:forKey:supported:enabled:](self, "reportStatus:forKey:supported:enabled:", a3, @"PMFENB", v6, [MEMORY[0x1E4F16440] isPortraitEffectEnabled]);
    BOOL v7 = [(VCAVFoundationCapture *)self isStudioLightSupported];
    -[VCAVFoundationCapture reportStatus:forKey:supported:enabled:](self, "reportStatus:forKey:supported:enabled:", a3, @"SLFENB", v7, [MEMORY[0x1E4F16440] isStudioLightEnabled]);
    BOOL v8 = [(VCAVFoundationCapture *)self isCenterStageSupported];
    -[VCAVFoundationCapture reportStatus:forKey:supported:enabled:](self, "reportStatus:forKey:supported:enabled:", a3, @"CSFENB", v8, [MEMORY[0x1E4F16440] isCenterStageEnabled]);
    BOOL v9 = [(VCAVFoundationCapture *)self isReactionSupported];
    -[VCAVFoundationCapture reportStatus:forKey:supported:enabled:](self, "reportStatus:forKey:supported:enabled:", a3, @"REFENB", v9, [MEMORY[0x1E4F16440] reactionEffectsEnabled]);
    BOOL v10 = [(VCAVFoundationCapture *)self isBackgroundReplacementSupported];
    -[VCAVFoundationCapture reportStatus:forKey:supported:enabled:](self, "reportStatus:forKey:supported:enabled:", a3, @"BGRFENB", v10, [MEMORY[0x1E4F16440] isBackgroundReplacementEnabled]);
    BOOL v11 = [(VCAVFoundationCapture *)self isBackgroundReplacementSupportedForContinuityCamera];
    uint64_t v12 = [MEMORY[0x1E4F16440] isBackgroundReplacementEnabled];
    [(VCAVFoundationCapture *)self reportStatus:a3 forKey:@"BGRCCFENB" supported:v11 enabled:v12];
  }
}

- (tagVCVideoCaptureFeatureStatus)currentVideoFeatureStatus
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2810000000;
  BOOL v11 = "";
  v12[0] = -256;
  *(_DWORD *)((char *)v12 + 3) = -1;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__VCAVFoundationCapture_currentVideoFeatureStatus__block_invoke;
  v7[3] = &unk_1E6DB3EB8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(captureSessionQueue, v7);
  int v3 = *((unsigned __int8 *)v9 + 38);
  int v4 = *((unsigned __int16 *)v9 + 18);
  uint64_t v5 = *((unsigned int *)v9 + 8);
  _Block_object_dispose(&v8, 8);
  return (tagVCVideoCaptureFeatureStatus)(v5 | ((unint64_t)(v4 | (v3 << 16)) << 32));
}

uint64_t __50__VCAVFoundationCapture_currentVideoFeatureStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedCurrentVideoFeatureStatus:*(void *)(*(void *)(a1 + 40) + 8) + 32];
}

- (void)collectCaptureFrameRateStats:(__CFDictionary *)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCAVFoundationCapture_collectCaptureFrameRateStats___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(captureSessionQueue, block);
}

void __54__VCAVFoundationCapture_collectCaptureFrameRateStats___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 346) || *(unsigned char *)(v2 + 345))
  {
    double v3 = micro();
    *(double *)(*(void *)(a1 + 32) + 304) = v3
                                              - *(double *)(*(void *)(a1 + 32) + 296)
                                              + *(double *)(*(void *)(a1 + 32) + 304);
    *(double *)(*(void *)(a1 + 32) + 296) = v3;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(double *)(v2 + 304) >= 2.0)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 40), @"CAMFC", (const void *)[NSNumber numberWithInt:*(unsigned int *)(v2 + 292)]);
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 40), @"CAMDUR", (const void *)[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 304)]);
    *(_DWORD *)(*(void *)(a1 + 32) + 292) = 0;
    *(void *)(*(void *)(a1 + 32) + 304) = 0;
  }
}

- (BOOL)cameraSupportsFormatWidth:(int)a3 height:(int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__VCAVFoundationCapture_cameraSupportsFormatWidth_height___block_invoke;
  v7[3] = &unk_1E6DB3F80;
  v7[4] = self;
  v7[5] = &v10;
  int v8 = a3;
  int v9 = a4;
  dispatch_sync(captureSessionQueue, v7);
  char v5 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __58__VCAVFoundationCapture_cameraSupportsFormatWidth_height___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cameraFormatForWidth:*(unsigned int *)(a1 + 48) height:*(unsigned int *)(a1 + 52)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (BOOL)cameraSupportsNoQueueFormatWidth:(int)a3 height:(int)a4
{
  return [(VCAVFoundationCapture *)self cameraFormatForWidth:*(void *)&a3 height:*(void *)&a4] != 0;
}

- (BOOL)cameraContainsCaptureFormatWithWidth:(int)a3 height:(int)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = [(VCAVFoundationCapture *)self getCaptureFormatList];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[*(id *)(*((void *)&v15 + 1)+ 8 * v10) formatDescription]);
        if (Dimensions.width == a3 && Dimensions.height == a4)
        {
          LOBYTE(v7) = 1;
          return v7;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v14 count:16];
      uint64_t v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v7;
}

- (void)setCameraZoomFactor:(double)a3
{
  if ([(VCAVFoundationCapture *)self isBackCamera])
  {
    p_videoDeviceInput = &self->_videoDeviceInput;
    if ([[(AVCaptureDeviceInput *)self->_videoDeviceInput device] lockForConfiguration:0])
    {
      [(AVCaptureDeviceFormat *)[[(AVCaptureDeviceInput *)*p_videoDeviceInput device] activeFormat] videoMaxZoomFactor];
      double v7 = 1.0;
      if (a3 >= 1.0) {
        double v7 = a3;
      }
      if (v6 >= v7) {
        double v8 = v7;
      }
      else {
        double v8 = v6;
      }
      [[(AVCaptureDeviceInput *)*p_videoDeviceInput device] setVideoZoomFactor:v8];
      [[(AVCaptureDeviceInput *)*p_videoDeviceInput device] unlockForConfiguration];
      self->_double cameraZoomFactor = v8;
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAVFoundationCapture setCameraZoomFactor:]();
      }
    }
  }
}

- (void)setCameraZoomFactor:(double)a3 withRate:(double)a4
{
  if ([(VCAVFoundationCapture *)self isBackCamera])
  {
    p_videoDeviceInput = &self->_videoDeviceInput;
    if ([[(AVCaptureDeviceInput *)*p_videoDeviceInput device] lockForConfiguration:0])
    {
      [(AVCaptureDeviceFormat *)[[(AVCaptureDeviceInput *)*p_videoDeviceInput device] activeFormat] videoMaxZoomFactor];
      double v9 = 1.0;
      if (a3 >= 1.0) {
        double v9 = a3;
      }
      if (v8 >= v9) {
        double v10 = v9;
      }
      else {
        double v10 = v8;
      }
      BOOL v11 = [(AVCaptureDeviceInput *)*p_videoDeviceInput device];
      *(float *)&double v12 = a4;
      [(AVCaptureDevice *)v11 rampToVideoZoomFactor:v10 withRate:v12];
      char v13 = [(AVCaptureDeviceInput *)*p_videoDeviceInput device];
      [(AVCaptureDevice *)v13 unlockForConfiguration];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAVFoundationCapture setCameraZoomFactor:withRate:]();
      }
    }
  }
}

- (BOOL)shouldAdjustCaptureWithOrientation:(int)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if ((a3 & 0xFFFFFFFE) == 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    p_requestSize = &self->_requestSize;
    double width = self->_requestSize.width;
    double height = self->_requestSize.height;
    if (width <= height)
    {
      BOOL v3 = 0;
    }
    else
    {
      id v8 = [(VCAVFoundationCapture *)self cameraFormatForWidth:(int)height height:(int)width frameRate:self->_lastClientRequestedFrameRate];
      id v9 = [(VCAVFoundationCapture *)self cameraFormatForWidth:(int)p_requestSize->width height:(int)p_requestSize->height frameRate:self->_lastClientRequestedFrameRate];
      float v10 = p_requestSize->height / p_requestSize->width;
      unint64_t v11 = _VCAVFoundationCapture_effectiveResolution(v8, v10);
      float v12 = p_requestSize->width / p_requestSize->height;
      unint64_t v13 = _VCAVFoundationCapture_effectiveResolution(v9, v12);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        long long v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int lastClientRequestedFrameRate = self->_lastClientRequestedFrameRate;
          double v18 = p_requestSize->width;
          CGFloat v17 = p_requestSize->height;
          int v27 = 136317186;
          uint64_t v28 = v14;
          __int16 v29 = 2080;
          long long v30 = "-[VCAVFoundationCapture shouldAdjustCaptureWithOrientation:]";
          __int16 v31 = 1024;
          int v32 = 2142;
          __int16 v33 = 2080;
          long long v34 = "Portrait";
          __int16 v35 = 2048;
          unint64_t v36 = v11;
          __int16 v37 = 2048;
          double v38 = v17;
          __int16 v39 = 2048;
          double v40 = v18;
          __int16 v41 = 1024;
          int v42 = lastClientRequestedFrameRate;
          __int16 v43 = 2112;
          id v44 = v8;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %-10s, resolution=%12llu, %4.0fx%4.0f@%d from %@", (uint8_t *)&v27, 0x54u);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        int v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v21 = self->_lastClientRequestedFrameRate;
          double v22 = p_requestSize->width;
          CGFloat v23 = p_requestSize->height;
          int v27 = 136317186;
          uint64_t v28 = v19;
          __int16 v29 = 2080;
          long long v30 = "-[VCAVFoundationCapture shouldAdjustCaptureWithOrientation:]";
          __int16 v31 = 1024;
          int v32 = 2143;
          __int16 v33 = 2080;
          long long v34 = "Landscape";
          __int16 v35 = 2048;
          unint64_t v36 = v13;
          __int16 v37 = 2048;
          double v38 = v22;
          __int16 v39 = 2048;
          double v40 = v23;
          __int16 v41 = 1024;
          int v42 = v21;
          __int16 v43 = 2112;
          id v44 = v9;
          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %-10s, resolution=%12llu, %4.0fx%4.0f@%d from %@", (uint8_t *)&v27, 0x54u);
        }
      }
      BOOL v3 = v11 == v13;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      long long v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 136315906;
        uint64_t v28 = v24;
        __int16 v29 = 2080;
        long long v30 = "-[VCAVFoundationCapture shouldAdjustCaptureWithOrientation:]";
        __int16 v31 = 1024;
        int v32 = 2146;
        __int16 v33 = 1024;
        LODWORD(v34) = v3;
        _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d better capture in portrait fashion = %d", (uint8_t *)&v27, 0x22u);
      }
    }
  }
  return v3;
}

- (BOOL)supportsDepthDataFormats
{
  BOOL v3 = [(AVCaptureDevice *)self->_captureDevice deviceType];
  if (v3 == (NSString *)*MEMORY[0x1E4F15820])
  {
    int v4 = [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_captureDevice activeFormat] supportedDepthDataFormats];
    if (v4) {
      LOBYTE(v4) = [(NSArray *)v4 count] != 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)setReactionActive:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_isReactionActive != a3)
  {
    BOOL v3 = a3;
    self->_isReactionActive = a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        float v10 = "-[VCAVFoundationCapture setReactionActive:]";
        __int16 v11 = 1024;
        int v12 = 2513;
        __int16 v13 = 1024;
        BOOL v14 = v3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d active=%d", (uint8_t *)&v7, 0x22u);
      }
    }
    if (!self->_isReactionActive) {
      [(VCVideoCaptureServer *)[(VCVideoCapture *)self captureServer] didStopReacting];
    }
  }
}

- (void)processReactionStatus:(id)a3 oldReactions:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 count];
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VCAVFoundationCapture_processReactionStatus_oldReactions___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  uint64_t v24 = self;
  block[4] = self;
  BOOL v29 = v7 != 0;
  dispatch_async(captureSessionQueue, block);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = a3;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v44 objects:v43 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v45;
    *(void *)&long long v10 = 136315906;
    long long v23 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(obj);
        }
        BOOL v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v15 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v39, v38, 16, v23);
        if (!v15) {
          goto LABEL_20;
        }
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v40;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v40 != v17) {
              objc_enumerationMutation(a4);
            }
            uint64_t v19 = *(void **)(*((void *)&v39 + 1) + 8 * j);
            uint64_t v20 = [v14 reactionType];
            if (v20 != [v19 reactionType]) {
              continue;
            }
            if (v14)
            {
              [v14 startTime];
              if (v19) {
                goto LABEL_14;
              }
            }
            else
            {
              memset(&time1, 0, sizeof(time1));
              if (v19)
              {
LABEL_14:
                [v19 startTime];
                goto LABEL_17;
              }
            }
            memset(&time2, 0, sizeof(time2));
LABEL_17:
            if (!CMTimeCompare(&time1, &time2)) {
              goto LABEL_24;
            }
          }
          uint64_t v16 = [a4 countByEnumeratingWithState:&v39 objects:v38 count:16];
        }
        while (v16);
LABEL_20:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          double v22 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            uint64_t v31 = v21;
            __int16 v32 = 2080;
            __int16 v33 = "-[VCAVFoundationCapture processReactionStatus:oldReactions:]";
            __int16 v34 = 1024;
            int v35 = 2536;
            __int16 v36 = 2112;
            __int16 v37 = v14;
            _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d reaction start=%@", buf, 0x26u);
          }
        }
        -[VCVideoCaptureServer reactionDidStart:](-[VCVideoCapture captureServer](v24, "captureServer"), "reactionDidStart:", [v14 reactionType]);
LABEL_24:
        ;
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v43 count:16];
    }
    while (v11);
  }
}

uint64_t __60__VCAVFoundationCapture_processReactionStatus_oldReactions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setReactionActive:*(unsigned __int8 *)(a1 + 40)];
}

- (id)cameraFormatForWidth:(int)a3 height:(int)a4
{
  return [(VCAVFoundationCapture *)self cameraFormatForWidth:*(void *)&a3 height:*(void *)&a4 frameRate:0];
}

- (BOOL)isFormatMaxFrameRateSupported:(id)a3 frameRate:(int)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = (void *)[a3 videoSupportedFrameRateRanges];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    char v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v11 maxFrameRate];
        if (v12 > 60.0 || a4 == 0)
        {
          v9 &= v12 <= 60.0;
        }
        else
        {
          [v11 maxFrameRate];
          if (v14 < (double)a4) {
            char v9 = 0;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    char v9 = 1;
  }
  return v9 & 1;
}

- (void)prepareSynchronizedOutputs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_outputSynchronizerOutputs) {
    self->_outputSynchronizerOutputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (([(NSMutableArray *)self->_outputSynchronizerOutputs containsObject:v9] & 1) == 0) {
          [(NSMutableArray *)self->_outputSynchronizerOutputs addObject:v9];
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
}

- (AVCaptureDepthDataOutput)depthDataOutput
{
  return self->_depthDataOutput;
}

- (BOOL)faceMeshTrackingEnabled
{
  return self->_faceMeshTrackingEnabled;
}

- (BOOL)effectsApplied
{
  return self->_effectsApplied;
}

- (void)initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cinematicFramingEnabled:videoOrientation:capturePixelFormat:zoomFactor:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8();
  int v3 = 358;
  __int16 v4 = v0;
  uint64_t v5 = "VCAVFCaptureNumberPropertyAllocator";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate %s", v2, 0x26u);
}

- (void)shouldResizeWithCaptureSize:requestSize:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Allocating VCResizeImageBuffer failed", v2, v3, v4, v5, v6);
}

- (void)updateCenterStageRegionOfInterestWithLock:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retain lock for capture device=%@.");
}

- (void)encodeProcessedPixelBuffer:time:imageData:processTime:.cold.1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  int v3 = 917;
  __int16 v4 = 2048;
  uint64_t v5 = v0;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Send processed video frame to encoder %lld", v2, 0x26u);
}

- (void)dataOutputSynchronizer:(NSObject *)a3 didOutputSynchronizedDataCollection:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [a2 droppedReason];
  OUTLINED_FUNCTION_7_1();
  uint64_t v7 = "-[VCAVFoundationCapture dataOutputSynchronizer:didOutputSynchronizedDataCollection:]";
  OUTLINED_FUNCTION_3();
  int v8 = 1316;
  __int16 v9 = v4;
  int v10 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Sample buffer was dropped. AVCaptureOutputDataDroppedReason: %d", v6, 0x22u);
}

- (void)captureSessionNotification:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d captureServer is nil!", v2, v3, v4, v5, v6);
}

void __52__VCAVFoundationCapture_captureSessionNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d session run time error %@");
}

void __64__VCAVFoundationCapture_startCaptureWithWidth_height_frameRate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Capture called before Preview, failing", v2, v3, v4, v5, v6);
}

- (void)setFrameRateInternal:forceSourceFrameRateDidChange:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid frame rate %d", v2, *(const char **)v3, (unint64_t)"-[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:]" >> 16, v4);
}

- (void)setFrameRateInternal:forceSourceFrameRateDidChange:.cold.2()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to lock device %@");
}

- (void)setCameraZoomFactor:.cold.1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retain lock for video device input: %@");
}

- (void)setCameraZoomFactor:withRate:.cold.1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retain lock for video device input: %@");
}

- (void)setCamera:width:height:frameRate:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Camera not found for UID=%@");
}

- (void)setCamera:width:height:frameRate:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCAVFoundationCapture setCamera:width:height:frameRate:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setVideoDeviceToSelectedDevice failed, result=0x%x", v2, *(const char **)v3, (unint64_t)"-[VCAVFoundationCapture setCamera:width:height:frameRate:]" >> 16, v4);
}

- (void)setVideoDeviceToSelectedDevice:.cold.1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d initWithDevice() failed, error=%@");
}

- (void)setVideoDeviceToWidth:height:frameRate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d failed locking for configuration", v2, v3, v4, v5, v6);
}

@end