@interface VCScreenCapture
- (BOOL)cameraSupportsFormatWidth:(int)a3 height:(int)a4;
- (BOOL)isClearScreenThreadRunning;
- (BOOL)isFrontCamera;
- (BOOL)isPortraitResolutionCaptureActive;
- (BOOL)isPreviewRunning;
- (VCScreenCapture)initWithCaptureServer:(id)a3 protocolFunctions:(const tagVCVideoCaptureServerProtocolRealtimeInstanceVTable *)a4 sourceConfig:(id)a5;
- (int)_startCapture;
- (int)configureCaptureWithToken:(_VCVideoSourceToken)a3;
- (int)copyColorInfo:(const __CFDictionary *)a3;
- (int)frameBecameAvailableCount:(int *)a3 figBufferQueueEmptyCount:(int *)a4 figBufferQueueErrorCount:(int *)a5;
- (int)frameCount:(BOOL)a3;
- (int)getFrameRate;
- (int)setFrameRate:(int)a3;
- (int)setWidth:(int)a3 height:(int)a4 frameRate:(int)a5;
- (int)stop:(BOOL)a3;
- (int)stopScreenCapture;
- (int)updateScreenCapture:(id)a3;
- (void)_startCapture;
- (void)dealloc;
- (void)processAndSendIdleBlackFrame;
- (void)screenCaptureSourceProcessEventString:(id)a3;
- (void)screenCaptureSourceShouldClearScreen:(BOOL)a3;
- (void)setPauseCapture:(BOOL)a3;
- (void)startClearScreenProc;
- (void)stopClearScreenProc;
@end

@implementation VCScreenCapture

- (void)processAndSendIdleBlackFrame
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCScreenCapture [%s] %s:%d Failed to get image buffer", v2, v3, v4, v5, v6);
}

- (VCScreenCapture)initWithCaptureServer:(id)a3 protocolFunctions:(const tagVCVideoCaptureServerProtocolRealtimeInstanceVTable *)a4 sourceConfig:(id)a5
{
  v95[1] = *MEMORY[0x1E4F143B8];
  unsigned int v81 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"VideoWidth"), "intValue");
  unsigned int v80 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"VideoHeight"), "intValue");
  int v8 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:"), "intValue");
  char v77 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"ShouldSendBlackFramesOnClearScreen"), "BOOLValue");
  int v76 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"ResolutionScaling"), "intValue");
  char v78 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"EnableIdleFrameAdjustments"), "BOOLValue");
  if ([a5 objectForKeyedSubscript:@"CaptureSourceID"]) {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"CaptureSourceID"), "integerValue");
  }
  else {
    uint64_t v9 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v84 = v10;
      __int16 v85 = 2080;
      v86 = "-[VCScreenCapture initWithCaptureServer:protocolFunctions:sourceConfig:]";
      __int16 v87 = 1024;
      int v88 = 764;
      __int16 v89 = 1024;
      *(_DWORD *)v90 = v81;
      *(_WORD *)&v90[4] = 1024;
      *(_DWORD *)&v90[6] = v80;
      LOWORD(v91) = 1024;
      *(_DWORD *)((char *)&v91 + 2) = v8;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCScreenCapture [%s] %s:%d width=%d, height=%d, frameRate=%d", buf, 0x2Eu);
    }
  }
  if (!a3 || !v81 || !v80 || !v8)
  {

    return 0;
  }
  if (v9) {
    id v12 = 0;
  }
  else {
    id v12 = a3;
  }
  v82.receiver = self;
  v82.super_class = (Class)VCScreenCapture;
  v13 = [(VCVideoCapture *)&v82 initWithCaptureServer:v12 protocolFunctions:a4];
  v14 = v13;
  if (v13)
  {
    *((void *)v13 + 20) = v9;
    v15 = (_OWORD *)MEMORY[0x1E4F1FA48];
    *(void *)(v13 + 412) = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)(v13 + 396) = *v15;
    v13[486] = 0;
    v13[376] = v77;
    *((_DWORD *)v13 + 120) = v76;
    *((_DWORD *)v13 + 114) = v81;
    *((_DWORD *)v13 + 115) = v80;
    *((_DWORD *)v13 + 77) = v8;
    int v16 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"VideoWidth"), "intValue");
    int v17 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"VideoHeight"), "intValue");
    v96.width = (double)v16;
    v96.height = (double)v17;
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v96);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v19 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x1E4F34EC0]];
    uint64_t v20 = [a5 objectForKeyedSubscript:@"ScreenCaptureUUID"];
    if (v20 == [MEMORY[0x1E4F1CA98] null]) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = [a5 objectForKeyedSubscript:@"ScreenCaptureUUID"];
    }
    [v19 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F34EC8]];
    v22 = (void *)[a5 objectForKeyedSubscript:@"RemoteDeviceName"];
    if ((objc_msgSend(v22, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")) & 1) == 0)
    {
      uint64_t v23 = [a5 objectForKeyedSubscript:@"RemoteDeviceName"];
      [v19 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F34EB0]];
    }
    CFRelease(DictionaryRepresentation);
    int v24 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"HDRMode"), "intValue");
    int v25 = v24;
    v26 = (uint64_t *)MEMORY[0x1E4F35000];
    v27 = (uint64_t *)MEMORY[0x1E4F34D80];
    v28 = (uint64_t *)MEMORY[0x1E4F34FF8];
    v29 = (uint64_t *)MEMORY[0x1E4F34D88];
    if (v24 == 2)
    {
      v29 = (uint64_t *)MEMORY[0x1E4F34D78];
      v28 = (uint64_t *)MEMORY[0x1E4F35000];
    }
    if (v24 != 1)
    {
      v27 = v29;
      v26 = v28;
    }
    uint64_t v30 = *v27;
    uint64_t v31 = *v26;
    uint64_t v94 = *MEMORY[0x1E4F34D90];
    v95[0] = v30;
    uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:&v94 count:1];
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v34 = [a5 objectForKeyedSubscript:@"FrameRate"];
    [v33 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F34F58]];
    uint64_t v35 = [a5 objectForKeyedSubscript:@"FrameRate"];
    [v33 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F34DB8]];
    uint64_t v36 = [a5 objectForKeyedSubscript:@"PixelFormat"];
    [v33 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F34DC0]];
    [v33 setObject:&unk_1F3DC37B0 forKeyedSubscript:*MEMORY[0x1E4F34E58]];
    [v33 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F34E78]];
    [v33 setObject:&unk_1F3DC37C8 forKeyedSubscript:*MEMORY[0x1E4F34DF0]];
    uint64_t v37 = [a5 objectForKeyedSubscript:@"ShouldSupressDRMContent"];
    [v33 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F34E60]];
    uint64_t v38 = [a5 objectForKeyedSubscript:@"ScreenCaptureUUID"];
    if (v38 == [MEMORY[0x1E4F1CA98] null]) {
      uint64_t v39 = 0;
    }
    else {
      uint64_t v39 = [a5 objectForKeyedSubscript:@"ScreenCaptureUUID"];
    }
    [v33 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F34E48]];
    if (+[VCDefaults BOOLeanValueForKey:@"forceScreenCaptureToMod16" defaultValue:0])
    {
      [v33 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F34DD8]];
    }
    if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"ClientPid"), "intValue"))
    {
      uint64_t v40 = [a5 objectForKeyedSubscript:@"ClientPid"];
      [v33 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F34DA8]];
    }
    v41 = (void *)[a5 objectForKeyedSubscript:@"ClientBundleID"];
    if (v41)
    {
      v42 = v41;
      if ((objc_msgSend(v41, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")) & 1) == 0) {
        [v33 setObject:v42 forKeyedSubscript:*MEMORY[0x1E4F34DA0]];
      }
    }
    signed int v43 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"ScreenCaptureConfigurationDisplayMode"), "intValue");
    v44 = (void *)MEMORY[0x1E4F34E10];
    if (v43 <= 2)
    {
      uint64_t v45 = qword_1E6DB58C0[v43];
      [v33 setObject:qword_1E6DB58A8[v43] forKeyedSubscript:*MEMORY[0x1E4F34E08]];
      [v33 setObject:v45 forKeyedSubscript:*v44];
    }
    int v46 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"HasPrivateCaptureEntitlement"), "BOOLValue");
    int v47 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-screen-capture-private-content-capture-disabled", @"screenCaptureDisablePrivateContentCapture", &unk_1F3DC37E0, 0), "BOOLValue");
    if (v46)
    {
      int v48 = v47;
      if ((v47 & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v49 = VRTraceErrorLogLevelToCSTR();
          v50 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v84 = v49;
            __int16 v85 = 2080;
            v86 = "_VCScreenCapture_canCapturePrivateContent";
            __int16 v87 = 1024;
            int v88 = 654;
            __int16 v89 = 1024;
            *(_DWORD *)v90 = 1;
            *(_WORD *)&v90[4] = 1024;
            *(_DWORD *)&v90[6] = v48;
            _os_log_impl(&dword_1E1EA4000, v50, OS_LOG_TYPE_DEFAULT, "VCScreenCapture [%s] %s:%d hasPrivateCaptureEntitlement=%d privateContentCaptureDisable=%d", buf, 0x28u);
          }
        }
        [v33 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F34DE0]];
        v44 = (void *)MEMORY[0x1E4F34E10];
      }
    }
    v51 = (void *)[a5 objectForKeyedSubscript:@"ScreenVirtualDisplayLabel"];
    if (v51)
    {
      v52 = v51;
      if ((objc_msgSend(v51, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")) & 1) == 0)
      {
        [v33 setObject:v52 forKeyedSubscript:*MEMORY[0x1E4F34DC8]];
        [v33 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F34E80]];
        uint64_t v53 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F39B60], "mainDisplay"), "pointScale"));
        [v19 setObject:v53 forKeyedSubscript:*MEMORY[0x1E4F34EE0]];
        v54 = NSNumber;
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F39B60], "mainDisplay"), "bounds");
        uint64_t v56 = [v54 numberWithDouble:v55];
        [v33 setObject:v56 forKeyedSubscript:*MEMORY[0x1E4F34E20]];
        v57 = NSNumber;
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F39B60], "mainDisplay"), "bounds");
        uint64_t v59 = [v57 numberWithDouble:v58];
        [v33 setObject:v59 forKeyedSubscript:*MEMORY[0x1E4F34E18]];
      }
    }
    uint64_t v60 = [a5 objectForKeyedSubscript:@"AllowRemoteControlLayers"];
    [v33 setObject:v60 forKeyedSubscript:*MEMORY[0x1E4F34D98]];
    if (v25)
    {
      [v33 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F34ED0]];
      [v33 setObject:&unk_1F3DC37B0 forKeyedSubscript:*v44];
    }
    [v33 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F34F68]];

    *((void *)v14 + 18) = v33;
    v14[468] = v78;
    *((_DWORD *)v14 + 118) = 0;
    v14[476] = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v61 = VRTraceErrorLogLevelToCSTR();
      v62 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v63 = *((_DWORD *)v14 + 114);
        int v64 = *((_DWORD *)v14 + 115);
        *(_DWORD *)buf = 136316162;
        uint64_t v84 = v61;
        __int16 v85 = 2080;
        v86 = "-[VCScreenCapture initWithCaptureServer:protocolFunctions:sourceConfig:]";
        __int16 v87 = 1024;
        int v88 = 788;
        __int16 v89 = 1024;
        *(_DWORD *)v90 = v63;
        *(_WORD *)&v90[4] = 1024;
        *(_DWORD *)&v90[6] = v64;
        _os_log_impl(&dword_1E1EA4000, v62, OS_LOG_TYPE_DEFAULT, "VCScreenCapture [%s] %s:%d VCScreenCapture init width=%d height=%d", buf, 0x28u);
      }
    }
    pthread_mutex_init((pthread_mutex_t *)(v14 + 168), 0);
    pthread_mutex_init((pthread_mutex_t *)(v14 + 312), 0);
    pthread_cond_init((pthread_cond_t *)(v14 + 248), 0);
    CFAllocatorRef v65 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v66 = (uint64_t *)(v14 + 440);
    VTImageRotationSessionCreate();
    v67 = (CVPixelBufferPoolRef *)(v14 + 448);
    createPixelBufferPool((CVPixelBufferPoolRef *)v14 + 56, v81, v80);
    VTPixelTransferSessionCreate(v65, (VTPixelTransferSessionRef *)v14 + 54);
    VTSessionSetProperty(*((VTSessionRef *)v14 + 54), (CFStringRef)*MEMORY[0x1E4F45168], (CFTypeRef)*MEMORY[0x1E4F45458]);
    int PixelBufferPool = createPixelBufferPool((CVPixelBufferPoolRef *)v14 + 53, v81, v80);
    if (!*((void *)v14 + 56) || !*v66 || !*((void *)v14 + 18) || PixelBufferPool)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v69 = VRTraceErrorLogLevelToCSTR();
        v70 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v73 = *v66;
          CVPixelBufferPoolRef v74 = *v67;
          uint64_t v75 = *((void *)v14 + 18);
          *(_DWORD *)buf = 136316418;
          uint64_t v84 = v69;
          __int16 v85 = 2080;
          v86 = "-[VCScreenCapture initWithCaptureServer:protocolFunctions:sourceConfig:]";
          __int16 v87 = 1024;
          int v88 = 807;
          __int16 v89 = 2048;
          *(void *)v90 = v73;
          *(_WORD *)&v90[8] = 2048;
          CVPixelBufferPoolRef v91 = v74;
          __int16 v92 = 2048;
          uint64_t v93 = v75;
          _os_log_error_impl(&dword_1E1EA4000, v70, OS_LOG_TYPE_ERROR, "VCScreenCapture [%s] %s:%d VCScreenCapture init failed rotationSession(%p) rotationBufferPool(%p) options(%p)", buf, 0x3Au);
        }
      }
      if (*v67) {
        CVPixelBufferPoolRelease(*v67);
      }
      if (*v66) {
        VTImageRotationSessionRelease();
      }
      v71 = (void *)*((void *)v14 + 18);
      if (v71) {

      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCScreenCapture initWithCaptureServer:protocolFunctions:sourceConfig:]();
        }
      }

      return 0;
    }
  }
  return (VCScreenCapture *)v14;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(VCScreenCapture *)self stop:1];
  rotationSession = self->_rotationSession;
  if (rotationSession) {
    CVPixelBufferPoolRelease(rotationSession);
  }
  if (self->_resizeTransferSession) {
    VTImageRotationSessionRelease();
  }
  resizeBufferPool = self->_resizeBufferPool;
  if (resizeBufferPool)
  {
    VTPixelTransferSessionInvalidate(resizeBufferPool);
    uint64_t v5 = self->_resizeBufferPool;
    if (v5)
    {
      CFRelease(v5);
      self->_resizeBufferPool = 0;
    }
  }
  CVPixelBufferPoolRelease(*(CVPixelBufferPoolRef *)&self->_shouldClearScreen);
  blackFrame = self->_blackFrame;
  if (blackFrame) {
    CFRelease(blackFrame);
  }
  previousCompleteFrame = self->_previousCompleteFrame;
  if (previousCompleteFrame) {
    CFRelease(previousCompleteFrame);
  }
  pthread_mutex_destroy(&self->_clearScreenLock);
  pthread_cond_destroy(&self->_clearScreenChanged);
  pthread_mutex_destroy(&self->_screenCaptureLock);

  v8.receiver = self;
  v8.super_class = (Class)VCScreenCapture;
  [(VCVideoCapture *)&v8 dealloc];
}

- (int)_startCapture
{
  v10[2] = *MEMORY[0x1E4F143B8];
  p_screenCaptureLock = &self->_screenCaptureLock;
  pthread_mutex_lock(&self->_screenCaptureLock);
  blackFrame = self->_blackFrame;
  if (blackFrame)
  {
    CFRelease(blackFrame);
    self->_blackFrame = 0;
  }
  previousCompleteFrame = self->_previousCompleteFrame;
  if (previousCompleteFrame)
  {
    CFRelease(previousCompleteFrame);
    self->_previousCompleteFrame = 0;
  }
  v10[0] = self;
  v10[1] = _VCScreenCapture_handleFrame;
  uint8_t v6 = off_1E6DB3060;
  if ((VCFeatureFlagManager_UseAvconferencedOniOSSpecficFeatures([(VCScreenCapture *)self startClearScreenProc]) & 1) == 0
    && !+[VCDefaults BOOLeanValueForKey:@"useScreenCaptureController" defaultValue:0])
  {
    uint8_t v6 = off_1E6DB3068;
  }
  v7 = (VCScreenCaptureSource *)[objc_alloc(*v6) initWithDelegate:self screenCaptureSourceContext:v10];
  self->_screenCapture = v7;
  if (!v7)
  {
    int v8 = -2146893820;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCScreenCapture _startCapture]();
      }
    }
    goto LABEL_18;
  }
  int v8 = [(VCScreenCaptureSource *)v7 startScreenCaptureWithConfig:self->_options];
  if (v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
      -[VCScreenCapture _startCapture]();
      if ((v8 & 0x80000000) == 0) {
        goto LABEL_11;
      }
    }
    else if ((v8 & 0x80000000) == 0)
    {
      goto LABEL_11;
    }
LABEL_18:
    [(VCScreenCapture *)self stopClearScreenProc];
    goto LABEL_11;
  }
  self->_isCapturing = 1;
  self->_isPreviewing = 1;
LABEL_11:
  pthread_mutex_unlock(p_screenCaptureLock);
  return v8;
}

- (int)stopScreenCapture
{
  return [(VCScreenCapture *)self stop:1];
}

- (int)stop:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint8_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      uint64_t v11 = v5;
      __int16 v12 = 2080;
      v13 = "-[VCScreenCapture stop:]";
      __int16 v14 = 1024;
      int v15 = 910;
      __int16 v16 = 1024;
      BOOL v17 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCScreenCapture [%s] %s:%d shouldClosePreview=%d", (uint8_t *)&v10, 0x22u);
    }
  }
  pthread_mutex_lock(&self->_screenCaptureLock);
  [(VCScreenCaptureSource *)self->_screenCapture stopScreenCapture];
  [(VCScreenCaptureSource *)self->_screenCapture finalize];

  self->_screenCapture = 0;
  [(VCScreenCapture *)self stopClearScreenProc];
  blackFrame = self->_blackFrame;
  if (blackFrame)
  {
    CFRelease(blackFrame);
    self->_blackFrame = 0;
  }
  previousCompleteFrame = self->_previousCompleteFrame;
  if (previousCompleteFrame)
  {
    CFRelease(previousCompleteFrame);
    self->_previousCompleteFrame = 0;
  }
  pthread_mutex_unlock(&self->_screenCaptureLock);
  return 0;
}

- (int)updateScreenCapture:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((VCScreenCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint8_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315650;
        uint64_t v14 = v5;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCScreenCapture updateScreenCapture:]";
        __int16 v17 = 1024;
        int v18 = 926;
        v7 = "VCScreenCapture [%s] %s:%d Update is not supported";
        int v8 = v6;
        uint32_t v9 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[(VCScreenCapture *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316162;
        uint64_t v14 = v10;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCScreenCapture updateScreenCapture:]";
        __int16 v17 = 1024;
        int v18 = 926;
        __int16 v19 = 2112;
        uint64_t v20 = v4;
        __int16 v21 = 2048;
        v22 = self;
        v7 = "VCScreenCapture [%s] %s:%d %@(%p) Update is not supported";
        int v8 = v11;
        uint32_t v9 = 48;
        goto LABEL_11;
      }
    }
  }
  return 0;
}

- (int)setWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  return 0;
}

- (int)copyColorInfo:(const __CFDictionary *)a3
{
  return 0;
}

- (void)setPauseCapture:(BOOL)a3
{
  screenCapture = self->_screenCapture;
  if (screenCapture)
  {
    -[VCScreenCaptureSource pauseScreenCapture:](screenCapture, "pauseScreenCapture:");
    self->_capturePaused = a3;
  }
}

- (BOOL)isPreviewRunning
{
  return self->_isPreviewing;
}

- (void)startClearScreenProc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCScreenCapture [%s] %s:%d Failed to create clearScreenProc", v2, v3, v4, v5, v6);
}

- (void)stopClearScreenProc
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = self;
  p_clearScreenLock = &self->_clearScreenLock;
  pthread_mutex_lock(&self->_clearScreenLock);
  if (self->_clearScreenProc && self->_isClearScreenThreadRunning)
  {
    self->_isClearScreenThreadRunning = 0;
    BYTE4(self->_previousFrameTime.epoch) = 0;
    if ((VCScreenCapture *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_14;
      }
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint8_t v6 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = v5;
      __int16 v23 = 2080;
      int v24 = "-[VCScreenCapture stopClearScreenProc]";
      __int16 v25 = 1024;
      int v26 = 965;
      v7 = "VCScreenCapture [%s] %s:%d Signal condition clearScreenChanged";
      int v8 = v6;
      uint32_t v9 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[(VCScreenCapture *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_14;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = v10;
      __int16 v23 = 2080;
      int v24 = "-[VCScreenCapture stopClearScreenProc]";
      __int16 v25 = 1024;
      int v26 = 965;
      __int16 v27 = 2112;
      v28 = v4;
      __int16 v29 = 2048;
      uint64_t v30 = self;
      v7 = "VCScreenCapture [%s] %s:%d %@(%p) Signal condition clearScreenChanged";
      int v8 = v11;
      uint32_t v9 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
LABEL_14:
    pthread_cond_signal(&self->_clearScreenChanged);
  }
  pthread_mutex_unlock(p_clearScreenLock);
  pthread_join(self->_clearScreenProc, &v20);
  *((void *)v20 + 30) = 0;
  if (objc_opt_class() == v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v22 = v13;
        __int16 v23 = 2080;
        int v24 = "-[VCScreenCapture stopClearScreenProc]";
        __int16 v25 = 1024;
        int v26 = 971;
        __int16 v15 = "VCScreenCapture [%s] %s:%d Stopped clearScreenProc";
        __int16 v16 = v14;
        uint32_t v17 = 28;
LABEL_25:
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = (__CFString *)[v20 performSelector:sel_logPrefix];
    }
    else {
      __int16 v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v22 = v18;
        __int16 v23 = 2080;
        int v24 = "-[VCScreenCapture stopClearScreenProc]";
        __int16 v25 = 1024;
        int v26 = 971;
        __int16 v27 = 2112;
        v28 = v12;
        __int16 v29 = 2048;
        uint64_t v30 = v20;
        __int16 v15 = "VCScreenCapture [%s] %s:%d %@(%p) Stopped clearScreenProc";
        __int16 v16 = v19;
        uint32_t v17 = 48;
        goto LABEL_25;
      }
    }
  }
}

- (int)frameCount:(BOOL)a3
{
  unsigned int currentTransform = self->_currentTransform;
  if (a3) {
    self->_unsigned int currentTransform = 0;
  }
  return currentTransform;
}

- (int)configureCaptureWithToken:(_VCVideoSourceToken)a3
{
  return -2146893808;
}

- (int)setFrameRate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_screenCaptureLock = &self->_screenCaptureLock;
  pthread_mutex_lock(&self->_screenCaptureLock);
  if ((VCScreenCapture *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      uint8_t v6 = (__CFString *)[(VCScreenCapture *)self performSelector:sel_logPrefix];
    }
    else {
      uint8_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int captureFramerate = self->_captureFramerate;
    *(_DWORD *)__int16 v21 = 136316674;
    *(void *)&v21[4] = v13;
    *(_WORD *)&v21[12] = 2080;
    *(void *)&v21[14] = "-[VCScreenCapture setFrameRate:]";
    *(_WORD *)&v21[22] = 1024;
    LODWORD(v22) = 990;
    WORD2(v22) = 2112;
    *(void *)((char *)&v22 + 6) = v6;
    HIWORD(v22) = 2048;
    __int16 v23 = self;
    LOWORD(v24) = 1024;
    *(_DWORD *)((char *)&v24 + 2) = captureFramerate;
    HIWORD(v24) = 1024;
    LODWORD(v25) = v3;
    uint64_t v10 = "VCScreenCapture [%s] %s:%d %@(%p) Changing currentFrameRate= %d to newFrameRate=%d";
    uint64_t v11 = v14;
    uint32_t v12 = 60;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = self->_captureFramerate;
      *(_DWORD *)__int16 v21 = 136316162;
      *(void *)&v21[4] = v7;
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "-[VCScreenCapture setFrameRate:]";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 990;
      WORD2(v22) = 1024;
      *(_DWORD *)((char *)&v22 + 6) = v9;
      WORD5(v22) = 1024;
      HIDWORD(v22) = v3;
      uint64_t v10 = "VCScreenCapture [%s] %s:%d Changing currentFrameRate= %d to newFrameRate=%d";
      uint64_t v11 = v8;
      uint32_t v12 = 40;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v21, v12);
    }
  }
LABEL_12:
  self->_int captureFramerate = v3;
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", v3, *(_OWORD *)v21, *(void *)&v21[16], v22, v23, v24, v25);
  [(NSMutableDictionary *)self->_options setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F34DB8]];
  uint64_t v17 = [NSNumber numberWithInt:v3];
  [(NSMutableDictionary *)self->_options setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F34F58]];
  screenCapture = self->_screenCapture;
  if (screenCapture && (self->_isCapturing || !self->_capturePaused))
  {
    [(VCScreenCaptureSource *)screenCapture stopScreenCapture];
    int v19 = [(VCScreenCaptureSource *)self->_screenCapture startScreenCaptureWithConfig:self->_options];
    if (v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCScreenCapture setFrameRate:]();
        }
      }
    }
  }
  else
  {
    int v19 = 0;
  }
  pthread_mutex_unlock(p_screenCaptureLock);
  return v19;
}

- (int)getFrameRate
{
  return self->_captureFramerate;
}

- (BOOL)isFrontCamera
{
  return 1;
}

- (BOOL)cameraSupportsFormatWidth:(int)a3 height:(int)a4
{
  return 0;
}

- (int)frameBecameAvailableCount:(int *)a3 figBufferQueueEmptyCount:(int *)a4 figBufferQueueErrorCount:(int *)a5
{
  return -2146893808;
}

- (BOOL)isPortraitResolutionCaptureActive
{
  return 0;
}

- (void)screenCaptureSourceShouldClearScreen:(BOOL)a3
{
}

- (void)screenCaptureSourceProcessEventString:(id)a3
{
  uint64_t v4 = [(VCVideoCapture *)self captureServer];

  [(VCVideoCaptureServer *)v4 handleCaptureEvent:a3];
}

- (BOOL)isClearScreenThreadRunning
{
  return self->_isClearScreenThreadRunning;
}

- (void)initWithCaptureServer:protocolFunctions:sourceConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCScreenCapture [%s] %s:%d VCScreenCapture init failed", v2, v3, v4, v5, v6);
}

- (void)_startCapture
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCScreenCapture [%s] %s:%d Screen Capture start failed error=%d", v2, v3, v4, v5);
}

- (void)setFrameRate:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCScreenCapture [%s] %s:%d Screen Capture start failed error=%d", v2, v3, v4, v5);
}

@end