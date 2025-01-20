@interface VCVideoCaptureServer
+ (id)VCVideoCaptureServerSingleton;
- (AVConferencePreviewDelegate)appDelegate;
- (BOOL)cameraSupportsWidth:(int)a3 height:(int)a4;
- (BOOL)canStopPreview;
- (BOOL)captureVideoWidth:(int *)a3 height:(int *)a4 frameRate:(int *)a5;
- (BOOL)deregisterCaptureConfig:(id)a3 forSource:(int)a4;
- (BOOL)deregisterForVideoFramesFromSource:(int)a3 withClient:(id)a4;
- (BOOL)deregisterSystemAudioConfig:(id)a3 forSource:(int)a4;
- (BOOL)dispatchedAddScreenCaptureAudioOutputForConfig:(id)a3;
- (BOOL)dispatchedRemoveScreenCaptureAudioOutput;
- (BOOL)dispatchedStartSystemAudioForClientKey:(id)a3;
- (BOOL)dispatchedStopSystemAudioForClientKey:(id)a3;
- (BOOL)followSystemCamera;
- (BOOL)internalRegisterStreamInput:(id)a3;
- (BOOL)internalUnregisterStreamInput:(id)a3;
- (BOOL)is1080pCameraAvailable;
- (BOOL)isAirPlayXPCHelper;
- (BOOL)isClientRegisteredForVideoFrames:(id)a3 fromSource:(int)a4;
- (BOOL)isFaceTimeScreenSharingWithDict:(id)a3;
- (BOOL)isValidStreamInput:(id)a3;
- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5;
- (BOOL)registerCaptureConfig:(id)a3 forSource:(int)a4;
- (BOOL)registerForFrames:(id)a3;
- (BOOL)registerForVideoFramesFromSource:(int)a3 sourceConfig:(id)a4;
- (BOOL)registerForVideoFramesFromSource:(int)a3 withClient:(id)a4 width:(int)a5 height:(int)a6 frameRate:(int)a7;
- (BOOL)registerStreamInput:(id)a3;
- (BOOL)registerSystemAudioConfig:(id)a3 forSource:(int)a4;
- (BOOL)setCaptureCameraWithToken:(_VCVideoSourceToken)a3;
- (BOOL)setLocalScreenAttributes:(id)a3;
- (BOOL)setLocalVideoAttributes:(id)a3;
- (BOOL)setUpScreenVideoCaptureSource:(id)a3;
- (BOOL)setupScreenCaptureForSource:(int)a3 config:(id)a4;
- (BOOL)setupStreamInputs;
- (BOOL)shouldSendVideoAttributeCallback:(id)a3;
- (BOOL)startScreenShareCapture:(id)a3;
- (BOOL)stopScreenShareCapture:(int64_t)a3;
- (BOOL)supportsPortraitResolution;
- (BOOL)unregisterStreamInputCaptureSourceWithCaptureSourceID:(int)a3;
- (CGSize)localExpectedRatioForScreenOrientation:(int)a3;
- (CGSize)localScreenRatioForScreenOrientation:(int)a3;
- (VCVideoCaptureServer)allocWithZone:(_NSZone *)a3;
- (VCVideoCaptureServer)init;
- (_VCVideoSourceToken)currentVideoSourceToken;
- (__CFDictionary)copyCameraColorInfo;
- (__CFDictionary)copyInitialStatsDictionary;
- (__CFDictionary)copyRealtimeStatsDictionary;
- (__CFDictionary)copyReportingStatsForCaptureSource:(int)a3;
- (id)copyLocalScreenAttributesForVideoAttributes:(id)a3;
- (id)localScreenAttributesForVideoAttributes:(id)a3;
- (id)localVideoAttributes;
- (id)updateScreenCapture:(int64_t)a3 withConfig:(id)a4;
- (id)videoRuleForClient:(id)a3;
- (int)bestCameraCaptureFrameRate;
- (int)createVideoCaptureWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5 useBackFacingCamera:(BOOL)a6;
- (int)findNextAvailableCaptureSourceID;
- (int)getCappedFrameRate:(int)a3;
- (int)getCaptureFrameRateForSource:(int)a3;
- (int)getFrameRateForPeakPowerLevel:(int)a3;
- (int)getFrameRateForThermalLevel:(int)a3;
- (int)getFrameRateForThermalLevel:(int)a3 peakPowerPressure:(int)a4;
- (int)getScreenFrameRateForThermalLevel:(int)a3;
- (int)registerStreamInputCaptureSourceWithConfiguration:(id)a3;
- (int)registerStreamInputCaptureSourceWithID:(int64_t)a3 frameRate:(unsigned int)a4;
- (int)screenFrameRateForThermalLevel:(int)a3 configuredFrameRate:(int)a4 captureSourceID:(id)a5;
- (int)setBoundsForRemoteLayerWithFacing:(BOOL)a3 frameRect:(CGRect)a4 fenceHandle:(id)a5;
- (int)thermalPressureLevel;
- (int64_t)streamInputIDForCaptureSourceID:(int)a3;
- (opaqueCMFormatDescription)newFormatDescriptionForCaptureSource:(int)a3;
- (tagAVConferencePreviewDelegateRealtimeRealtimeInstanceVTable)delegateFunctions;
- (unint64_t)retainCount;
- (unsigned)setLocalVideoDestination:(id *)a3;
- (unsigned)setLocalVideoDestination:(id)a3 facing:(BOOL)a4;
- (void)addObserveSystemPreferredCamera;
- (void)addScreenStatsToDict:(__CFDictionary *)a3;
- (void)addStreamInputStatsToDict:(__CFDictionary *)a3 captureSource:(int)a4;
- (void)beginPIPToPreviewAnimation;
- (void)beginPreviewToPIPAnimation;
- (void)captureSourceVideoFeatureStatusDidChange:(tagVCVideoCaptureFeatureStatus)a3;
- (void)centerStageEnabledDidChange:(BOOL)a3;
- (void)changeCameraToPendingSettingsWithReset:(BOOL)a3;
- (void)cleanupStreamInputs;
- (void)dealloc;
- (void)deregisterCaptureClientForScreenShare:(id)a3;
- (void)deregisterScreenVideoConfig:(id)a3 forSource:(int)a4;
- (void)didStopReacting;
- (void)dispatchedSetCaptureCameraWithToken:(_VCVideoSourceToken)a3;
- (void)dispatchedSetCaptureFrameRate:(int)a3;
- (void)dispatchedSetCaptureWidth:(int)a3 height:(int)a4 rate:(int)a5;
- (void)dispatchedStartSystemAudioForSource:(int)a3;
- (void)dispatchedStopSystemAudioForSource:(int)a3;
- (void)dispatchedUpdateCaptureRuleForClient:(id)a3 width:(int)a4 height:(int)a5 frameRate:(float)a6;
- (void)endPIPToPreviewAnimation;
- (void)endPreviewToPIPAnimation;
- (void)handleAVCaptureError:(int)a3 domain:(id)a4;
- (void)handleAVCaptureError:(int)a3 error:(id)a4;
- (void)handleCaptureEvent:(id)a3;
- (void)handleCaptureEvent:(id)a3 subType:(id)a4;
- (void)handleCaptureSourcePositionDidChange:(BOOL)a3;
- (void)init;
- (void)isAirPlayXPCHelper;
- (void)notifyCameraDidChangeAvailability:(id)a3 available:(BOOL)a4;
- (void)notifyFrameRateBeingThrottledForClients:(id)a3 newFrameRate:(int)a4 thermalLevelDidChange:(BOOL)a5 powerLevelDidChange:(BOOL)a6;
- (void)notifyThermalChangeForClients:(id)a3;
- (void)notifyThermalPressureObservers:(int)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onCaptureScreenFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 orientation:(int)a5;
- (void)pausePreview;
- (void)populateThermalFrameRateThresholdsForCaptureSourceID:(int64_t)a3 captureConfig:(id)a4;
- (void)portraitBlurEnabledDidChange:(BOOL)a3;
- (void)previewVideoWidth:(int *)a3 height:(int *)a4 frameRate:(int *)a5;
- (void)reactionDidStart:(id)a3;
- (void)reconnectClientLayerFront:(BOOL)a3;
- (void)registerBlocksForServer;
- (void)registerCaptureClientForScreenShare:(id)a3;
- (void)registerScreenVideoConfig:(id)a3 forSource:(int)a4;
- (void)registerVideoSink:(id)a3 withCaptureSource:(int)a4;
- (void)removeObserveSystemPreferredCamera;
- (void)resetCameraToPreviewSettingsForced:(BOOL)a3;
- (void)resumeVideoSink:(id)a3 withCaptureSource:(int)a4;
- (void)screenAndCameraMixingEnable:(BOOL)a3;
- (void)sendBiomeEventIsStarting:(BOOL)a3;
- (void)setAppDelegate:(id)a3;
- (void)setCFAvailabilityChange:(BOOL)a3;
- (void)setCameraZoomAvailable:(BOOL)a3 currentZoomFactor:(double)a4 maxZoomFactor:(double)a5;
- (void)setCameraZoomFactor:(double)a3;
- (void)setCameraZoomFactor:(double)a3 withRate:(double)a4;
- (void)setCaptureFrameRate:(int)a3;
- (void)setCaptureWidth:(int)a3 height:(int)a4 rate:(int)a5;
- (void)setCaptureWidth:(int)a3 height:(int)a4 rate:(int)a5 forced:(BOOL)a6;
- (void)setDelegateFunctions:(tagAVConferencePreviewDelegateRealtimeRealtimeInstanceVTable)a3;
- (void)setFollowSystemCamera:(BOOL)a3;
- (void)setLocalCamera:(id)a3;
- (void)setPauseCapture:(BOOL)a3;
- (void)setScreenCaptureFrameRate:(int)a3;
- (void)setScreenCaptureFrameRate:(int)a3 captureSourceID:(id)a4;
- (void)setSystemPreferredAsLocalCamera;
- (void)setUpDefaultAspectRatios;
- (void)setUpImageConverters;
- (void)setViewPointCorrectionEnabled:(BOOL)a3;
- (void)setupLogFiles;
- (void)setupStreamInputs;
- (void)sourceFrameRateDidChange:(unsigned int)a3;
- (void)startCaptureWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5;
- (void)startPreview;
- (void)startPreviewWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5;
- (void)stopCapture;
- (void)stopPreview;
- (void)suspendVideoSink:(id)a3 withCaptureSource:(int)a4;
- (void)tearDownImageConverters;
- (void)thermalLevelDidChange:(int)a3;
- (void)unregisterStreamInput:(id)a3;
- (void)unregisterVideoSink:(id)a3 withCaptureSource:(int)a4;
- (void)updateCaptureRuleForClient:(id)a3 width:(int)a4 height:(int)a5 frameRate:(float)a6;
- (void)updateCaptureWidth:(int *)a3 height:(int *)a4 frameRate:(int *)a5 withVideoRule:(id)a6;
- (void)updateCenterStageEnabled:(BOOL)a3 requestCaptureChange:(BOOL)a4;
- (void)updateImageQueueFrameRate:(int)a3;
- (void)updateLocalAspectRatios:(int)a3 localScreenAspectRatio:(CGSize)a4;
- (void)updatePreviewState;
- (void)updateViewPointCorrectionStatus;
@end

@implementation VCVideoCaptureServer

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_3(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  v5 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", [a2 objectForKeyedSubscript:@"localVideoAttributes"]);
  [*(id *)(a1 + 32) setLocalVideoAttributes:v5];
  v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "localVideoAttributes"), "copyEncodedDictionary");
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"localVideoAttributes", 0);

  return v7;
}

- (id)localVideoAttributes
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__31;
  v10 = __Block_byref_object_dispose__31;
  uint64_t v11 = 0;
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VCVideoCaptureServer_localVideoAttributes__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(captureServerQueue, block);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)setLocalVideoAttributes:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    captureServerQueue = self->captureServerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    block[5] = a3;
    dispatch_async(captureServerQueue, block);
  }
  return a3 != 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_8(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    int v4 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"previewCameraCinematicFraming"), "intValue");
    if ([a2 objectForKeyedSubscript:@"previewCameraCinematicFramingSet"]) {
      BOOL v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"previewCameraCinematicFramingSet"), "intValue") != 0;
    }
    else {
      BOOL v5 = 1;
    }
    [*(id *)(a1 + 32) updateCenterStageEnabled:v4 != 0 requestCaptureChange:v5];
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = [a2 objectForKeyedSubscript:@"CONTEXT"];
    if (v4)
    {
      BOOL v5 = (void *)v4;
      uint64_t v12 = 0;
      unsigned int v11 = 0;
      [*(id *)(a1 + 32) captureVideoWidth:(char *)&v12 + 4 height:&v12 frameRate:&v11];
      if (v12 * HIDWORD(v12) * v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          uint64_t v7 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v8 = [*(id *)(*(void *)(a1 + 32) + 120) count];
            uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 120);
            *(_DWORD *)buf = 136316162;
            uint64_t v14 = v6;
            __int16 v15 = 2080;
            v16 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke_2";
            __int16 v17 = 1024;
            int v18 = 839;
            __int16 v19 = 1024;
            int v20 = v8;
            __int16 v21 = 2112;
            uint64_t v22 = v9;
            _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d StartPreview when cameraVideoSinks count=%u, array=%@.", buf, 0x2Cu);
          }
        }
        [*(id *)(a1 + 32) startCaptureWithWidth:HIDWORD(v12) height:v12 frameRate:v11];
      }
      else
      {
        [*(id *)(a1 + 32) startPreview];
      }
      [v5 setStarted:1];
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2_cold_1();
        }
      }
      [*(id *)(a1 + 32) handleAVCaptureError:2148073489 domain:@"avCaptureStartPreviewFail"];
    }
  }
  return 0;
}

- (void)updateCenterStageEnabled:(BOOL)a3 requestCaptureChange:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__VCVideoCaptureServer_updateCenterStageEnabled_requestCaptureChange___block_invoke;
  block[3] = &unk_1E6DB4658;
  block[4] = self;
  BOOL v6 = a3;
  BOOL v7 = a4;
  dispatch_async(captureServerQueue, block);
}

- (void)startPreview
{
}

- (void)startPreviewWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(VCVideoCaptureServer *)self reconnectClientLayerFront:1];
  [(VCVideoCaptureServer *)self reconnectClientLayerFront:0];
  captureServerQueue = self->captureServerQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__VCVideoCaptureServer_startPreviewWithWidth_height_frameRate___block_invoke;
  v10[3] = &unk_1E6DB3F58;
  v10[4] = self;
  int v11 = a3;
  int v12 = a4;
  int v13 = a5;
  dispatch_async(captureServerQueue, v10);
}

- (void)reconnectClientLayerFront:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v18 = xmmword_1E25A1E00;
  *(_OWORD *)__int16 v19 = unk_1E25A1E10;
  *(_OWORD *)&v19[16] = xmmword_1E25A1E20;
  *(_OWORD *)&v19[32] = unk_1E25A1E30;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *(_OWORD *)&v19[8] = *MEMORY[0x1E4F1DB28];
  unsigned __int8 v20 = 0;
  *(void *)&long long v18 = 0;
  BYTE8(v18) = a3;
  *(void *)__int16 v19 = &v20;
  *(_OWORD *)&v19[24] = v5;
  *(_WORD *)&v19[40] = 256;
  uint64_t v6 = [(VCVideoCaptureServer *)self setLocalVideoDestination:&v18];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCVideoCaptureServer-connect layers");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v22 = v7;
      __int16 v23 = 2080;
      v24 = "-[VCVideoCaptureServer reconnectClientLayerFront:]";
      __int16 v25 = 1024;
      int v26 = 1413;
      __int16 v27 = 1024;
      BOOL v28 = v3;
      __int16 v29 = 1024;
      int v30 = v6;
      __int16 v31 = 1024;
      int v32 = v20;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @:@ VCVideoCaptureServer-connect layers reconnectClientLayerFront=%d(1-front), slot=%u layerHostMode=%d", buf, 0x2Eu);
    }
  }
  uint64_t v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v6];
  v10 = (void *)[objc_alloc(NSNumber) initWithBool:v3];
  int v11 = v20;
  id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  if (v11)
  {
    int v13 = objc_msgSend(v12, "initWithObjectsAndKeys:", v9, @"videoContextId", v10, @"videoSlotFacing", 0);
    delegateNotificationQueue = self->delegateNotificationQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__VCVideoCaptureServer_reconnectClientLayerFront___block_invoke_2;
    v16[3] = &unk_1E6DB3DC8;
    v16[4] = v13;
    __int16 v15 = v16;
  }
  else
  {
    int v13 = objc_msgSend(v12, "initWithObjectsAndKeys:", v9, @"videoSlotNumber", v10, @"videoSlotFacing", 0);
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__VCVideoCaptureServer_reconnectClientLayerFront___block_invoke;
    block[3] = &unk_1E6DB3DC8;
    block[4] = v13;
    __int16 v15 = block;
  }
  dispatch_async(delegateNotificationQueue, v15);
}

- (unsigned)setLocalVideoDestination:(id *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCVideoCaptureServer-setLocalVideoDestination");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id var0 = a3->var0;
      BOOL var1 = a3->var1;
      int v9 = *(unsigned __int8 *)a3->var2;
      v10 = NSStringFromRect(a3->var3);
      BOOL var4 = a3->var4;
      BOOL var5 = a3->var5;
      *(_DWORD *)buf = 136317186;
      uint64_t v32 = v5;
      __int16 v33 = 2080;
      v34 = "-[VCVideoCaptureServer setLocalVideoDestination:]";
      __int16 v35 = 1024;
      int v36 = 3856;
      __int16 v37 = 2048;
      *(void *)v38 = var0;
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)v39 = var1;
      *(_WORD *)&v39[4] = 1024;
      int v40 = v9;
      __int16 v41 = 2112;
      v42 = v10;
      __int16 v43 = 1024;
      BOOL v44 = var4;
      __int16 v45 = 1024;
      BOOL v46 = var5;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @:@ VCVideoCaptureServer-setLocalVideoDestination layer=%p front=%d layerHostMode=%d frameRect=%@ resetImageQueue=%d reconnectLayer=%d", buf, 0x48u);
    }
  }
  uint64_t v27 = 0;
  BOOL v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  BOOL v26 = 0;
  if (a3 && (var2 = a3->var2) != 0)
  {
    BOOL v26 = *var2;
    captureServerQueue = self->captureServerQueue;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __49__VCVideoCaptureServer_setLocalVideoDestination___block_invoke;
    v22[3] = &unk_1E6DB8C20;
    v22[4] = self;
    v22[5] = &v23;
    v22[6] = &v27;
    v22[7] = a3;
    dispatch_sync(captureServerQueue, v22);
    *a3->var2 = *((unsigned char *)v24 + 24);
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCVideoCaptureServer-setLocalVideoDestination");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = *((_DWORD *)v28 + 6);
        BOOL v18 = a3->var1;
        int v19 = *(unsigned __int8 *)a3->var2;
        *(_DWORD *)buf = 136316418;
        uint64_t v32 = v15;
        __int16 v33 = 2080;
        v34 = "-[VCVideoCaptureServer setLocalVideoDestination:]";
        __int16 v35 = 1024;
        int v36 = 3902;
        __int16 v37 = 1024;
        *(_DWORD *)v38 = v17;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v18;
        *(_WORD *)v39 = 1024;
        *(_DWORD *)&v39[2] = v19;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @:@ VCVideoCaptureServer-setLocalVideoDestination previewSlot=%u, front=%d layerHostMode=%d", buf, 0x2Eu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoCaptureServer setLocalVideoDestination:]();
    }
  }
  unsigned int v20 = *((_DWORD *)v28 + 6);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  return v20;
}

- (BOOL)captureVideoWidth:(int *)a3 height:(int *)a4 frameRate:(int *)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  captureClientQueue = self->captureClientQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__VCVideoCaptureServer_captureVideoWidth_height_frameRate___block_invoke;
  v8[3] = &unk_1E6DB8B30;
  v8[6] = a3;
  v8[7] = a4;
  v8[8] = a5;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(captureClientQueue, v8);
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_3(uint64_t a1)
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewDidStart", *(void *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"videoSlotFacing"];
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "setLocalVideoDestination:facing:", 0, objc_msgSend(v5, "BOOLValue"));
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ previewGetLocalVideoSlot");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      uint64_t v14 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke_5";
      __int16 v15 = 1024;
      int v16 = 959;
      __int16 v17 = 1024;
      int v18 = v6;
      __int16 v19 = 2112;
      unsigned int v20 = v5;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @:@ previewGetLocalVideoSlot slot=%u front=%@", buf, 0x2Cu);
    }
  }
  uint64_t v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v6];
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"videoSlotNumber", 0);

  return v4;
}

void *__47__VCVideoCaptureServer_registerBlocksForServer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "localVideoAttributes"), "copyEncodedDictionary");
  uint64_t v6 = objc_alloc_init(VCCameraPreview);
  int v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CLIENTPID"), "intValue");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke";
      *(_WORD *)&buf[22] = 1024;
      int v21 = 801;
      __int16 v22 = 1024;
      int v23 = v7;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Adding PID %d to client monitor", buf, 0x22u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(NSObject **)(v10 + 280);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_66;
  block[3] = &unk_1E6DB3EE0;
  int v19 = v7;
  block[4] = v10;
  void block[5] = v6;
  dispatch_async(v11, block);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v21) = 0;
  uint64_t v12 = *(void *)(a1 + 32);
  __int16 v13 = *(NSObject **)(v12 + 256);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_68;
  v17[3] = &unk_1E6DB4540;
  v17[4] = v12;
  v17[5] = buf;
  dispatch_sync(v13, v17);
  id v14 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = objc_msgSend(v14, "initWithObjectsAndKeys:", v5, @"localVideoAttributes", v6, @"CONTEXT", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(*(void *)&buf[8] + 24)), @"previewState", 0);
  uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 96) deviceNameForToken:*(unsigned int *)(*(void *)(a1 + 32) + 104)];
  if (v15) {
    [v4 setObject:v15 forKeyedSubscript:@"localCameraUIDString"];
  }

  _Block_object_dispose(buf, 8);
  return v4;
}

- (unsigned)setLocalVideoDestination:(id)a3 facing:(BOOL)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v6 = xmmword_1E25A1E00;
  *(_OWORD *)int v7 = unk_1E25A1E10;
  *(_OWORD *)&v7[16] = xmmword_1E25A1E20;
  *(_OWORD *)&v7[32] = unk_1E25A1E30;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *(_OWORD *)&v7[8] = *MEMORY[0x1E4F1DB28];
  char v8 = 0;
  *(void *)&long long v6 = a3;
  BYTE8(v6) = a4;
  *(void *)int v7 = &v8;
  *(_OWORD *)&v7[24] = v4;
  *(_WORD *)&v7[40] = 0;
  return [(VCVideoCaptureServer *)self setLocalVideoDestination:&v6];
}

- (void)sourceFrameRateDidChange:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VCVideoCaptureServer_sourceFrameRateDidChange___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  unsigned int v5 = a3;
  dispatch_async(captureServerQueue, block);
}

- (void)handleCaptureSourcePositionDidChange:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__VCVideoCaptureServer_handleCaptureSourcePositionDidChange___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(captureClientQueue, block);
}

- (void)captureSourceVideoFeatureStatusDidChange:(tagVCVideoCaptureFeatureStatus)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VCVideoCaptureServer_captureSourceVideoFeatureStatusDidChange___block_invoke;
  block[3] = &unk_1E6DB83E0;
  block[4] = self;
  tagVCVideoCaptureFeatureStatus v5 = a3;
  dispatch_async(captureClientQueue, block);
}

void __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    BOOL v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      long long v4 = *(void **)(*(void *)(a1 + 32) + 152);
      if (v4) {
        tagVCVideoCaptureFeatureStatus v5 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
      }
      else {
        tagVCVideoCaptureFeatureStatus v5 = "<nil>";
      }
      uint64_t v6 = *(void **)(a1 + 40);
      if (v6) {
        int v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
      }
      else {
        int v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = v2;
      __int16 v27 = 2080;
      BOOL v28 = "-[VCVideoCaptureServer setLocalVideoAttributes:]_block_invoke";
      __int16 v29 = 1024;
      int v30 = 3461;
      __int16 v31 = 2080;
      uint64_t v32 = v5;
      __int16 v33 = 2080;
      v34 = v7;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d camera and orientation changed from %s to %s", buf, 0x30u);
    }
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 328), "setOrientation:", objc_msgSend(*(id *)(a1 + 40), "orientation"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "setOrientation:", objc_msgSend(*(id *)(a1 + 40), "orientation"));
  if ([*(id *)(a1 + 32) shouldSendVideoAttributeCallback:*(void *)(a1 + 40)])
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 384);
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v8)
    {
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v26 = v10;
            __int16 v27 = 2080;
            BOOL v28 = "-[VCVideoCaptureServer setLocalVideoAttributes:]_block_invoke";
            __int16 v29 = 1024;
            int v30 = 3470;
            _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d notifying app of video attributes change", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_cold_2();
        }
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_318;
      block[3] = &unk_1E6DB3E40;
      long long v24 = *(_OWORD *)(a1 + 32);
      dispatch_async(*(dispatch_queue_t *)(v24 + 296), block);
    }
    else
    {
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        id v14 = *MEMORY[0x1E4F47A50];
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v26 = v13;
            __int16 v27 = 2080;
            BOOL v28 = "-[VCVideoCaptureServer setLocalVideoAttributes:]_block_invoke_2";
            __int16 v29 = 1024;
            int v30 = 3478;
            _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d notifying clients of video attributes change", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_cold_1();
        }
      }
      int v16 = (void *)[*(id *)(a1 + 40) copyEncodedDictionary];
      __int16 v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v16, @"localVideoAttributes", 0);
      int v18 = *(NSObject **)(*(void *)(a1 + 32) + 296);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_322;
      v22[3] = &unk_1E6DB3DC8;
      v22[4] = v17;
      dispatch_async(v18, v22);
    }
    CFMutableDictionaryRef EncodedCFDictionary = VideoAttributes_CreateEncodedCFDictionary(*(void **)(*(void *)(a1 + 32) + 152));
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 488));
    int v20 = [*(id *)(*(void *)(a1 + 32) + 152) camera];
    uint64_t v21 = 416;
    if (!v20) {
      uint64_t v21 = 408;
    }
    VCImageQueue_EnqueueAttributes(*(void *)(*(void *)(a1 + 32) + v21), EncodedCFDictionary);
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 488));
    if (EncodedCFDictionary) {
      CFRelease(EncodedCFDictionary);
    }
  }
}

- (BOOL)shouldSendVideoAttributeCallback:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![(VCVideoSource *)self->avCapture isPortraitResolutionCaptureActive])return 1; {
  if ([a3 orientation] && objc_msgSend(a3, "orientation") != 1)
  }
  {
    if ([a3 orientation] != 3 && objc_msgSend(a3, "orientation") != 2) {
      return 1;
    }
    [a3 ratio];
    double v8 = v7;
    [a3 ratio];
    if (v8 >= v9) {
      return 1;
    }
  }
  else
  {
    [a3 ratio];
    double v5 = v4;
    [a3 ratio];
    if (v5 <= v6) {
      return 1;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v12) {
      return result;
    }
    int v14 = [a3 orientation];
    [a3 ratio];
    uint64_t v16 = v15;
    [a3 ratio];
    int v18 = 136316418;
    uint64_t v19 = v10;
    __int16 v20 = 2080;
    uint64_t v21 = "-[VCVideoCaptureServer shouldSendVideoAttributeCallback:]";
    __int16 v22 = 1024;
    int v23 = 3449;
    __int16 v24 = 1024;
    int v25 = v14;
    __int16 v26 = 2048;
    uint64_t v27 = v16;
    __int16 v28 = 2048;
    uint64_t v29 = v17;
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Should not callback. isPortraitResolutionCaptureActive=YES, orientation=%d, width=%.0f, height=%.0f", (uint8_t *)&v18, 0x36u);
  }
  return 0;
}

uint64_t __42__VCVideoCaptureServer_updatePreviewState__block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"updatePreviewState" arguments:v3];
}

uint64_t __79__VCVideoCaptureServer_setCameraZoomAvailable_currentZoomFactor_maxZoomFactor___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"previewCameraZoomAvailablilty" arguments:v3];
}

uint64_t __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_318(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    double v4 = *(void **)(*(void *)(a1 + 32) + 384);
    return [v4 didChangeLocalVideoAttributes:v3];
  }
  return result;
}

uint64_t __50__VCVideoCaptureServer_reconnectClientLayerFront___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"previewDidLocalVideoSlotChange" arguments:v3];
}

uint64_t __44__VCVideoCaptureServer_localVideoAttributes__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[VideoAttributes videoAttributesWithVideoAttributes:*(void *)(*(void *)(a1 + 32) + 152)];
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) camera];
  if (result != 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      double v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315650;
        uint64_t v6 = v3;
        __int16 v7 = 2080;
        double v8 = "-[VCVideoCaptureServer localVideoAttributes]_block_invoke";
        __int16 v9 = 1024;
        int v10 = 3510;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d VideoAttributes camera should be only used for remote. Setting videoAttributes.camera to VideoAttributeCameraInvalid for local", (uint8_t *)&v5, 0x1Cu);
      }
    }
    return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCamera:3];
  }
  return result;
}

uint64_t __70__VCVideoCaptureServer_updateCenterStageEnabled_requestCaptureChange___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 458) = *(unsigned char *)(a1 + 40);
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 328);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 41);
    return [v3 updateCenterStageEnabled:v4 requestCaptureChange:v5];
  }
  return result;
}

- (void)dispatchedSetCaptureFrameRate:(int)a3
{
  uint64_t v4 = [(VCVideoCaptureServer *)self getCappedFrameRate:*(void *)&a3];
  uint64_t v5 = [(VCVideoSource *)self->avCapture setFrameRate:v4];
  if ((v5 & 0x80000000) != 0)
  {
    [(VCVideoCaptureServer *)self handleAVCaptureError:v5 domain:@"avCaptureSetFrameRateFail"];
  }
  else
  {
    self->currentFrameRate = v4;
  }
}

void __63__VCVideoCaptureServer_startPreviewWithWidth_height_frameRate___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 454);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v3)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v43 = v5;
        __int16 v44 = 2080;
        __int16 v45 = "-[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:]_block_invoke";
        __int16 v46 = 1024;
        int v47 = 4000;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Preview is already running", buf, 0x1Cu);
      }
    }
    [*v2 updatePreviewState];
    return;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    double v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *v2;
      int v10 = *((_DWORD *)*v2 + 26);
      *(_DWORD *)buf = 136316162;
      uint64_t v43 = v7;
      __int16 v44 = 2080;
      __int16 v45 = "-[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:]_block_invoke";
      __int16 v46 = 1024;
      int v47 = 4004;
      __int16 v48 = 2048;
      *(void *)v49 = v9;
      *(_WORD *)&v49[8] = 1024;
      *(_DWORD *)v50 = v10;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d self %p, current sourceToken=0x%x", buf, 0x2Cu);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)*v2 + 488));
  [*((id *)*v2 + 51) start];
  [*((id *)*v2 + 52) start];
  pthread_mutex_unlock((pthread_mutex_t *)((char *)*v2 + 488));
  id v11 = *v2;
  if (*((void *)*v2 + 41))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = *((_DWORD *)*v2 + 2);
        int v15 = *((_DWORD *)*v2 + 3);
        int v16 = *((_DWORD *)*v2 + 4);
        *(_DWORD *)buf = 136316418;
        uint64_t v43 = v12;
        __int16 v44 = 2080;
        __int16 v45 = "-[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:]_block_invoke";
        __int16 v46 = 1024;
        int v47 = 4042;
        __int16 v48 = 1024;
        *(_DWORD *)v49 = v14;
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = v15;
        *(_WORD *)v50 = 1024;
        *(_DWORD *)&v50[2] = v16;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %dx%d@%d", buf, 0x2Eu);
      }
    }
    uint64_t v17 = [*((id *)*v2 + 41) setWidth:*((unsigned int *)*v2 + 2) height:*((unsigned int *)*v2 + 3) frameRate:*((unsigned int *)*v2 + 4)];
    if ((v17 & 0x80000000) != 0)
    {
      uint64_t v18 = v17;
      id v19 = *v2;
      __int16 v20 = @"avCaptureSetCaptureOptionsFail";
LABEL_31:
      [v19 handleAVCaptureError:v18 domain:v20];
      return;
    }
  }
  else
  {
    unsigned int v22 = *(_DWORD *)(a1 + 40);
    unsigned int v21 = *(_DWORD *)(a1 + 44);
    unsigned int v40 = v21;
    unsigned int v41 = v22;
    unsigned int v23 = *(_DWORD *)(a1 + 48);
    unsigned int v39 = v23;
    if (!v22 || !v21 || !v23)
    {
      [v11 previewVideoWidth:&v41 height:&v40 frameRate:&v39];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        int v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v43 = v24;
          __int16 v44 = 2080;
          __int16 v45 = "-[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:]_block_invoke";
          __int16 v46 = 1024;
          int v47 = 4020;
          __int16 v48 = 1024;
          *(_DWORD *)v49 = v41;
          *(_WORD *)&v49[4] = 1024;
          *(_DWORD *)&v49[6] = v40;
          *(_WORD *)v50 = 1024;
          *(_DWORD *)&v50[2] = v39;
          _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Using preview settings=%dx%d@%d", buf, 0x2Eu);
        }
      }
    }
    if (([*v2 createVideoCaptureWithWidth:v41 height:v40 frameRate:v39 useBackFacingCamera:0] & 0x80000000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __63__VCVideoCaptureServer_startPreviewWithWidth_height_frameRate___block_invoke_cold_2();
        }
      }
      return;
    }
    dispatch_resume(*((dispatch_object_t *)*v2 + 7));
    *((_DWORD *)*v2 + 11) = 0;
    *((_DWORD *)*v2 + 12) = 0;
    *((_DWORD *)*v2 + 2) = v41;
    unsigned int v26 = v39;
    *((_DWORD *)*v2 + 3) = v40;
    *((_DWORD *)*v2 + 7) = v26;
    uint64_t v27 = *v2;
    if (!*((_DWORD *)*v2 + 4))
    {
      v27[4] = v26;
      uint64_t v27 = *v2;
    }
    objc_msgSend(v27, "setCurrentFrameRate:");
  }
  [*v2 updateImageQueueFrameRate:*((unsigned int *)*v2 + 4)];
  uint64_t v28 = [*((id *)*v2 + 41) startPreview];
  uint64_t v29 = v28;
  if ((v28 & 0x80000000) != 0 && v28 != -2146893775)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      __int16 v31 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __63__VCVideoCaptureServer_startPreviewWithWidth_height_frameRate___block_invoke_cold_1(v30, (uint64_t)v2, v31);
      }
    }
    id v19 = *v2;
    __int16 v20 = @"avCaptureStartPreviewFail";
    uint64_t v18 = v29;
    goto LABEL_31;
  }
  if (v28 != -2146893775)
  {
    *((unsigned char *)*v2 + 108) = 0;
    *((void *)*v2 + 50) = 0;
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)*v2 + 488));
  [*v2 setUpImageConverters];
  if (objc_opt_respondsToSelector()) {
    char v32 = [*((id *)*v2 + 41) isInternalCamera] ^ 1;
  }
  else {
    char v32 = 0;
  }
  *((unsigned char *)*v2 + 460) = v32;
  [*((id *)*v2 + 51) setIsExternalCamera:*((unsigned __int8 *)*v2 + 460)];
  [*((id *)*v2 + 52) setIsExternalCamera:*((unsigned __int8 *)*v2 + 460)];
  pthread_mutex_unlock((pthread_mutex_t *)((char *)*v2 + 488));
  if ([*((id *)*v2 + 15) count]) {
    [*((id *)*v2 + 41) startCaptureWithWidth:*((unsigned int *)*v2 + 8) height:*((unsigned int *)*v2 + 9) frameRate:*((unsigned int *)*v2 + 4)];
  }
  *((unsigned char *)*v2 + 454) = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
    v34 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v35 = *((_DWORD *)*v2 + 2);
      int v36 = *((_DWORD *)*v2 + 3);
      int v37 = *((_DWORD *)*v2 + 4);
      int v38 = *((unsigned __int8 *)*v2 + 454);
      *(_DWORD *)buf = 136316674;
      uint64_t v43 = v33;
      __int16 v44 = 2080;
      __int16 v45 = "-[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:]_block_invoke";
      __int16 v46 = 1024;
      int v47 = 4079;
      __int16 v48 = 1024;
      *(_DWORD *)v49 = v35;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v36;
      *(_WORD *)v50 = 1024;
      *(_DWORD *)&v50[2] = v37;
      __int16 v51 = 1024;
      int v52 = v38;
      _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d preview-started %dx%d @ %d, _isPreviewRunning=%d", buf, 0x34u);
    }
  }
}

void __49__VCVideoCaptureServer_sourceFrameRateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(a1 + 32) + 16) = *(_DWORD *)(a1 + 40);
  [*(id *)(a1 + 32) updateImageQueueFrameRate:*(unsigned int *)(*(void *)(a1 + 32) + 16)];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    int v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v2;
      __int16 v11 = 2080;
      uint64_t v12 = "-[VCVideoCaptureServer sourceFrameRateDidChange:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 4506;
      __int16 v15 = 1024;
      int v16 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d setting camera framerate to %d", buf, 0x22u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 264);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__VCVideoCaptureServer_sourceFrameRateDidChange___block_invoke_385;
  v7[3] = &unk_1E6DB3F08;
  v7[4] = v5;
  int v8 = *(_DWORD *)(a1 + 40);
  dispatch_async(v6, v7);
}

- (void)updateImageQueueFrameRate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [(VCImageQueue *)self->frontQueue frameRate];
      unsigned int v8 = [(VCImageQueue *)self->backQueue frameRate];
      int v9 = 136316418;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      uint64_t v12 = "-[VCVideoCaptureServer updateImageQueueFrameRate:]";
      __int16 v13 = 1024;
      int v14 = 2949;
      __int16 v15 = 1024;
      unsigned int v16 = v7;
      __int16 v17 = 1024;
      unsigned int v18 = v8;
      __int16 v19 = 1024;
      int v20 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Setting both front queue framerate %d and back queue framerate %d to %d", (uint8_t *)&v9, 0x2Eu);
    }
  }
  pthread_mutex_lock(&self->_enqueueLock);
  [(VCImageQueue *)self->frontQueue setFrameRate:v3];
  [(VCImageQueue *)self->backQueue setFrameRate:v3];
  pthread_mutex_unlock(&self->_enqueueLock);
}

- (void)updatePreviewState
{
  void block[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  int v4 = objc_msgSend(v3, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithBool:", self->_isPreviewRunning), @"previewState", 0);
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__VCVideoCaptureServer_updatePreviewState__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  void block[4] = v4;
  dispatch_async(delegateNotificationQueue, block);
}

- (void)previewVideoWidth:(int *)a3 height:(int *)a4 frameRate:(int *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([+[VCDefaults sharedInstance] forceHWI])
  {
    if (a3) {
      *a3 = [+[VCDefaults sharedInstance] forceCaptureWidth];
    }
    if (a4) {
      *a4 = [+[VCDefaults sharedInstance] forceCaptureHeight];
    }
    if (a5) {
      *a5 = [+[VCDefaults sharedInstance] forceFramerate];
    }
  }
  else
  {
    float v19 = NAN;
    int v9 = (void *)MEMORY[0x1E4E589F0]();
    [+[VCVideoRuleCollectionsCamera sharedInstance] getBestFrameWidth:a3 frameHeight:a4 frameRate:&v19];
    if (a5)
    {
      unsigned int v10 = (int)v19;
      if ((int)v19 <= 5) {
        unsigned int v10 = 5;
      }
      if (v10 >= 0x3C) {
        unsigned int v10 = 60;
      }
      *a5 = v10;
    }
    if (a3)
    {
      unsigned int v11 = *a3;
      if (*a3 <= 320) {
        unsigned int v11 = 320;
      }
      if (v11 >= 0x800) {
        unsigned int v11 = 2048;
      }
      *a3 = v11;
    }
    if (a4)
    {
      unsigned int v12 = *a4;
      if (*a4 <= 240) {
        unsigned int v12 = 240;
      }
      if (v12 >= 0x800) {
        unsigned int v12 = 2048;
      }
      *a4 = v12;
    }
  }
  if (a5) {
    p_currentFrameRate = a5;
  }
  else {
    p_currentFrameRate = &self->currentFrameRate;
  }
  self->_bestCameraCaptureFrameRate = *p_currentFrameRate;
  if (a3 && a4 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    __int16 v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = *a3;
      int v17 = *a4;
      int v18 = *p_currentFrameRate;
      float v19 = 4.8155e-34;
      uint64_t v20 = v14;
      __int16 v21 = 2080;
      unsigned int v22 = "-[VCVideoCaptureServer previewVideoWidth:height:frameRate:]";
      __int16 v23 = 1024;
      int v24 = 1471;
      __int16 v25 = 1024;
      int v26 = v16;
      __int16 v27 = 1024;
      int v28 = v17;
      __int16 v29 = 1024;
      int v30 = v18;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Camera preview settings %dx%d@%dfps", (uint8_t *)&v19, 0x2Eu);
    }
  }
}

- (int)getCappedFrameRate:(int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->captureServerQueue);
  if (!self->_forceDisableThermal)
  {
    int v5 = [(VCVideoCaptureServer *)self getFrameRateForThermalLevel:self->_thermalLevel peakPowerPressure:self->_peakPowerLevel];
    if (v5 < a3) {
      a3 = v5;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    unsigned int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int currentFrameRate = self->currentFrameRate;
      int thermalLevel = self->_thermalLevel;
      int v11 = 136316418;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = "-[VCVideoCaptureServer getCappedFrameRate:]";
      __int16 v15 = 1024;
      int v16 = 2858;
      __int16 v17 = 1024;
      int v18 = currentFrameRate;
      __int16 v19 = 1024;
      int v20 = a3;
      __int16 v21 = 1024;
      int v22 = thermalLevel;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Setting current camera framerate %d to %d, with thermal level %d", (uint8_t *)&v11, 0x2Eu);
    }
  }
  return a3;
}

- (int)getFrameRateForThermalLevel:(int)a3 peakPowerPressure:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  int v6 = [(VCVideoCaptureServer *)self getFrameRateForPeakPowerLevel:*(void *)&a4];
  int result = [(VCVideoCaptureServer *)self getFrameRateForThermalLevel:v4];
  if (v6 < result) {
    return v6;
  }
  return result;
}

- (int)getFrameRateForPeakPowerLevel:(int)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a3 <= 19)
  {
    if (a3)
    {
      if (a3 == 10) {
        int maxFrameRate = 30;
      }
      else {
        int maxFrameRate = 0;
      }
    }
    else
    {
      int maxFrameRate = self->_maxFrameRate;
    }
  }
  else
  {
    if (a3 == 40) {
      int v5 = 5;
    }
    else {
      int v5 = 0;
    }
    if (a3 == 30) {
      int v6 = 5;
    }
    else {
      int v6 = v5;
    }
    if (a3 == 20) {
      int maxFrameRate = 15;
    }
    else {
      int maxFrameRate = v6;
    }
  }
  int v8 = self->_maxFrameRate;
  if (v8 >= maxFrameRate) {
    uint64_t v9 = maxFrameRate;
  }
  else {
    uint64_t v9 = v8;
  }
  int v10 = [+[VCDefaults sharedInstance] forceThermalLevelFramerate:v9];
  if ((VCVideoCaptureServer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136316162;
        uint64_t v21 = v12;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCVideoCaptureServer getFrameRateForPeakPowerLevel:]";
        __int16 v24 = 1024;
        int v25 = 2080;
        __int16 v26 = 1024;
        *(_DWORD *)__int16 v27 = v10;
        *(_WORD *)&v27[4] = 1024;
        *(_DWORD *)&v27[6] = a3;
        uint64_t v14 = "VCVideoCaptureServer [%s] %s:%d Framerate is %d for peakPowerLevel:%d";
        __int16 v15 = v13;
        uint32_t v16 = 40;
LABEL_29:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v11 = (__CFString *)[(VCVideoCaptureServer *)self performSelector:sel_logPrefix];
    }
    else {
      int v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      int v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136316674;
        uint64_t v21 = v17;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCVideoCaptureServer getFrameRateForPeakPowerLevel:]";
        __int16 v24 = 1024;
        int v25 = 2080;
        __int16 v26 = 2112;
        *(void *)__int16 v27 = v11;
        *(_WORD *)&v27[8] = 2048;
        int v28 = self;
        __int16 v29 = 1024;
        int v30 = v10;
        __int16 v31 = 1024;
        int v32 = a3;
        uint64_t v14 = "VCVideoCaptureServer [%s] %s:%d %@(%p) Framerate is %d for peakPowerLevel:%d";
        __int16 v15 = v18;
        uint32_t v16 = 60;
        goto LABEL_29;
      }
    }
  }
  return v10;
}

- (int)getFrameRateForThermalLevel:(int)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3 > 29)
  {
    if (a3 == 30 || a3 == 40 || a3 == 50) {
      int maxFrameRate = 5;
    }
    else {
      int maxFrameRate = 0;
    }
  }
  else if (a3)
  {
    if (a3 == 20) {
      int v5 = 15;
    }
    else {
      int v5 = 0;
    }
    if (a3 == 10) {
      int maxFrameRate = 30;
    }
    else {
      int maxFrameRate = v5;
    }
  }
  else
  {
    int maxFrameRate = self->_maxFrameRate;
  }
  int v7 = self->_maxFrameRate;
  if (v7 >= maxFrameRate) {
    uint64_t v8 = maxFrameRate;
  }
  else {
    uint64_t v8 = v7;
  }
  int v9 = [+[VCDefaults sharedInstance] forceThermalLevelFramerate:v8];
  if ((VCVideoCaptureServer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136316162;
        uint64_t v20 = v11;
        __int16 v21 = 2080;
        __int16 v22 = "-[VCVideoCaptureServer getFrameRateForThermalLevel:]";
        __int16 v23 = 1024;
        int v24 = 2049;
        __int16 v25 = 1024;
        *(_DWORD *)__int16 v26 = v9;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = a3;
        __int16 v13 = "VCVideoCaptureServer [%s] %s:%d Framerate is %d for thermalLevel:%d";
        uint64_t v14 = v12;
        uint32_t v15 = 40;
LABEL_28:
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v10 = (__CFString *)[(VCVideoCaptureServer *)self performSelector:sel_logPrefix];
    }
    else {
      int v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136316674;
        uint64_t v20 = v16;
        __int16 v21 = 2080;
        __int16 v22 = "-[VCVideoCaptureServer getFrameRateForThermalLevel:]";
        __int16 v23 = 1024;
        int v24 = 2049;
        __int16 v25 = 2112;
        *(void *)__int16 v26 = v10;
        *(_WORD *)&v26[8] = 2048;
        __int16 v27 = self;
        __int16 v28 = 1024;
        int v29 = v9;
        __int16 v30 = 1024;
        int v31 = a3;
        __int16 v13 = "VCVideoCaptureServer [%s] %s:%d %@(%p) Framerate is %d for thermalLevel:%d";
        uint64_t v14 = v17;
        uint32_t v15 = 60;
        goto LABEL_28;
      }
    }
  }
  return v9;
}

- (int)createVideoCaptureWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5 useBackFacingCamera:(BOOL)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v22 = -2146893808;
  __int16 v21 = VCVideoCaptureServer_OnCaptureVideoFrame;
  id v10 = (id)VCDefaults_CopyStringValueForKey(@"cannedReplay");
  if ((v10
     || (id v10 = +[VCDefaults copyStringValueForKey:](VCDefaults, "copyStringValueForKey:", @"videoCannedReplay")) != 0)&& [v10 length]&& !-[VCDefaults useVirtualCapture](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "useVirtualCapture"))
  {
    LOBYTE(v20) = 1;
    self->avCapture = (VCVideoSource *)[[CannedVideoCapture alloc] initWithCaptureServer:self protocolFunctions:&v21 width:v8 height:v7 frameRate:v6 videoSourceToken:self->_currentVideoSourceToken.var0.var1 video:v10 isCamera:v20 error:&v22];
  }

  if (!self->avCapture)
  {
    if (!self->_currentVideoSourceToken.var0.var1)
    {
      if (self->_followSystemCamera)
      {
        uint64_t v11 = (__CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F16440], "systemPreferredCamera"), "uniqueID");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          __int16 v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v24 = v12;
            __int16 v25 = 2080;
            __int16 v26 = "-[VCVideoCaptureServer createVideoCaptureWithWidth:height:frameRate:useBackFacingCamera:]";
            __int16 v27 = 1024;
            int v28 = 1141;
            __int16 v29 = 2112;
            __int16 v30 = v11;
            _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Creating capture with system preferred camera=%@", buf, 0x26u);
          }
        }
      }
      else
      {
        uint64_t v11 = @"com.apple.avfoundation.avcapturedevice.built-in_video:1";
      }
      unsigned int v14 = objc_msgSend(+[VCVideoSourceTokenManager sharedManager](VCVideoSourceTokenManager, "sharedManager"), "tokenForDeviceName:sourceType:", v11, 1);
      self->_currentVideoSourceToken.var0.BOOL var1 = v14;
      if (!v14 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoCaptureServer createVideoCaptureWithWidth:height:frameRate:useBackFacingCamera:]();
        }
      }
    }
    if (self->_useAVCaptureSession)
    {
      uint32_t v15 = [VCAVFoundationCapture alloc];
      BOOL cinematicFramingEnabled = self->_cinematicFramingEnabled;
      HIDWORD(v19) = [self->localVideoAttributes orientation];
      LODWORD(v20) = self->_defaultCapturePixelFormat;
      LOBYTE(v19) = cinematicFramingEnabled;
      avCapture = -[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cinematicFramingEnabled:videoOrientation:capturePixelFormat:zoomFactor:](v15, "initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cinematicFramingEnabled:videoOrientation:capturePixelFormat:zoomFactor:", self, &v21, v8, v7, v6, self->_currentVideoSourceToken.var0.var1, self->_cameraZoomFactor, v19, v20);
      self->avCapture = avCapture;
      if (!avCapture) {
        return v22;
      }
    }
    else
    {
      avCapture = self->avCapture;
      if (!avCapture) {
        return v22;
      }
    }
    [(VCVideoCaptureServer *)self handleCaptureSourcePositionDidChange:[(VCVideoSource *)avCapture isFrontCamera]];
    if (objc_opt_respondsToSelector()) {
      [(VCVideoSource *)self->avCapture setBufferStatsBuffer:&self->_bufferStatsData];
    }
    return 0;
  }
  return v22;
}

void __28__VCVideoCaptureServer_init__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 328))
  {
    if (objc_opt_respondsToSelector()) {
      int v2 = [*(id *)(*(void *)(a1 + 32) + 328) frameCount:1];
    }
    else {
      int v2 = 0;
    }
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 488));
    int v3 = [*(id *)(*(void *)(a1 + 32) + 408) frameCount];
    [*(id *)(*(void *)(a1 + 32) + 408) resetFrameCount];
    int v4 = [*(id *)(*(void *)(a1 + 32) + 416) frameCount];
    [*(id *)(*(void *)(a1 + 32) + 416) resetFrameCount];
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 488));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = *(_DWORD *)(v7 + 44);
        LODWORD(v7) = *(_DWORD *)(v7 + 48);
        *(_DWORD *)buf = 136317186;
        uint64_t v16 = v5;
        __int16 v17 = 2080;
        int v18 = "-[VCVideoCaptureServer init]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 467;
        __int16 v21 = 1024;
        int v22 = v2;
        __int16 v23 = 1024;
        int v24 = v2;
        __int16 v25 = 1024;
        int v26 = v8;
        __int16 v27 = 1024;
        int v28 = v7;
        __int16 v29 = 1024;
        int v30 = v3;
        __int16 v31 = 1024;
        int v32 = v4;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @=@ Health: VideoCapture cameraPreviewCount=%d, cameraCaptureCount=%d, serverPreviewCount=%d, serverCaptureCount=%d, frontQueueCount=%d, backQueueCount=%d", buf, 0x40u);
      }
    }
    if (!v2 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v14 = 0;
      int v13 = 0;
      int v9 = [*(id *)(*(void *)(a1 + 32) + 328) frameBecameAvailableCount:(char *)&v14 + 4 figBufferQueueEmptyCount:&v14 figBufferQueueErrorCount:&v13];
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v9 < 0)
      {
        if (ErrorLogLevelForModule >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __28__VCVideoCaptureServer_init__block_invoke_cold_1();
          }
        }
      }
      else if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v16 = v11;
          __int16 v17 = 2080;
          int v18 = "-[VCVideoCaptureServer init]_block_invoke";
          __int16 v19 = 1024;
          int v20 = 477;
          __int16 v21 = 1024;
          int v22 = HIDWORD(v14);
          __int16 v23 = 1024;
          int v24 = v14;
          __int16 v25 = 1024;
          int v26 = v13;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d frameBecameAvailableCount = %d, figBufferQueueEmptyCount = %d, figBufferQueueErrorCount = %d", buf, 0x2Eu);
        }
      }
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 44) = 0;
    *(_DWORD *)(*(void *)(a1 + 32) + 48) = 0;
  }
}

uint64_t __49__VCVideoCaptureServer_setLocalVideoDestination___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 488));
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    int v4 = *(VCImageQueue **)(v3 + 408);
    if (*(unsigned char *)(v2 + 57))
    {
      uint64_t v5 = 424;
LABEL_6:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(v3 + v5);
      goto LABEL_8;
    }
  }
  else
  {
    int v4 = *(VCImageQueue **)(v3 + 416);
    if (*(unsigned char *)(v2 + 57))
    {
      uint64_t v5 = 425;
      goto LABEL_6;
    }
  }
  int v6 = [(VCImageQueue *)v4 isLayerHostMode];
  uint64_t v2 = *(void *)(a1 + 56);
  if (**(unsigned __int8 **)(v2 + 16) != v6)
  {

    uint64_t v2 = *(void *)(a1 + 56);
    goto LABEL_15;
  }
LABEL_8:
  if (v4)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
      && (VCImageQueue_setCALayerSize((uint64_t)v4, 0, *(CGFloat *)(v2 + 24), *(CGFloat *)(v2 + 32), *(CGFloat *)(v2 + 40), *(CGFloat *)(v2 + 48)) & 1) == 0)
    {
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __49__VCVideoCaptureServer_setLocalVideoDestination___block_invoke_cold_1();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v7 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        else {
          uint64_t v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          int v18 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            uint64_t v20 = *(void *)(a1 + 32);
            *(_DWORD *)__int16 v21 = 136316418;
            *(void *)&v21[4] = v17;
            *(_WORD *)&v21[12] = 2080;
            *(void *)&v21[14] = "-[VCVideoCaptureServer setLocalVideoDestination:]_block_invoke";
            *(_WORD *)&v21[22] = 1024;
            *(_DWORD *)&v21[24] = 3895;
            *(_WORD *)&v21[28] = 2112;
            *(void *)&v21[30] = v7;
            *(_WORD *)&v21[38] = 2048;
            *(void *)&v21[40] = v20;
            __int16 v22 = 2048;
            __int16 v23 = v4;
            _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d %@(%p) Fail to set layer size for queue=%p", v21, 0x3Au);
          }
        }
      }
    }
    goto LABEL_34;
  }
LABEL_15:
  *(_OWORD *)&v21[16] = xmmword_1E25A1E50;
  *(_OWORD *)&v21[32] = unk_1E25A1E60;
  *(_OWORD *)__int16 v21 = xmmword_1E25A1E40;
  uint64_t v8 = *(void *)(a1 + 32);
  v21[0] = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(_OWORD *)&v21[8] = *(_OWORD *)(v2 + 24);
  long long v9 = *(_OWORD *)(v2 + 40);
  v21[40] = 1;
  *(_OWORD *)&v21[24] = v9;
  v21[41] = *(unsigned char *)(v8 + 460);
  *(_DWORD *)&v21[44] = *(unsigned __int8 *)(v2 + 8) == 0;
  id v10 = [[VCImageQueue alloc] initWithFrameRate:30 imageQueueProtected:0 vcImageQueueConfig:v21];
  int v4 = v10;
  uint64_t v11 = 408;
  if (!*(unsigned char *)(*(void *)(a1 + 56) + 8)) {
    uint64_t v11 = 416;
  }
  uint64_t v12 = 424;
  if (!*(unsigned char *)(*(void *)(a1 + 56) + 8)) {
    uint64_t v12 = 425;
  }
  *(void *)(*(void *)(a1 + 32) + v11) = v10;
  *(unsigned char *)(*(void *)(a1 + 32) + v12) = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  CFMutableDictionaryRef EncodedCFDictionary = VideoAttributes_CreateEncodedCFDictionary(*(void **)(*(void *)(a1 + 32) + 152));
  VCImageQueue_EnqueueAttributes((uint64_t)v4, EncodedCFDictionary);
  if (EncodedCFDictionary) {
    CFRelease(EncodedCFDictionary);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint32_t v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(a1 + 56) + 8)) {
        uint64_t v16 = "front";
      }
      else {
        uint64_t v16 = "back";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = v14;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCVideoCaptureServer setLocalVideoDestination:]_block_invoke";
      __int16 v28 = 1024;
      int v29 = 3892;
      __int16 v30 = 2080;
      __int16 v31 = v16;
      __int16 v32 = 2112;
      uint64_t v33 = v4;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d camera=%5s, queueToUse=[%@]", buf, 0x30u);
    }
  }
LABEL_34:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -[VCImageQueue setVideoDestination:](v4, "setVideoDestination:", **(void **)(a1 + 56), *(_OWORD *)v21, *(_OWORD *)&v21[16], *(_OWORD *)&v21[32]);
  return pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 488));
}

uint64_t __61__VCVideoCaptureServer_handleCaptureSourcePositionDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 captureSourcePositionDidChange:*(unsigned __int8 *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __65__VCVideoCaptureServer_captureSourceVideoFeatureStatusDidChange___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          unint64_t v1 = v1 & 0xFF00000000000000 | *(unsigned int *)(a1 + 40) | ((unint64_t)(*(unsigned __int16 *)(a1 + 44) | (*(unsigned __int8 *)(a1 + 46) << 16)) << 32);
          [v8 updateCaptureSourceVideoFeatureStatus:v1];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v2;
      __int16 v58 = 2080;
      v59 = "-[VCVideoCaptureServer handleCaptureEvent:subType:]_block_invoke";
      __int16 v60 = 1024;
      int v61 = 1300;
      __int16 v62 = 2112;
      *(void *)v63 = v4;
      *(_WORD *)&v63[8] = 2112;
      uint64_t v64 = v5;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d eventType=%@, subType=%@", buf, 0x30u);
    }
  }
  uint64_t v6 = (id *)(a1 + 48);
  uint64_t v7 = [*(id *)(*(void *)(a1 + 48) + 96) deviceNameForToken:*(unsigned int *)(*(void *)(a1 + 48) + 104)];
  uint64_t v8 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) isEqualToString:@"avCaptureFail"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      long long v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v9;
        __int16 v58 = 2080;
        v59 = "-[VCVideoCaptureServer handleCaptureEvent:subType:]_block_invoke";
        __int16 v60 = 1024;
        int v61 = 1303;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d received AVCAPTURE_FAILURE_CAPTURE", buf, 0x1Cu);
      }
    }
    *(void *)buf = 0;
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", buf, 32023, 114, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoCaptureServer.m", 1308), @"Video capture failed.", @"Camera unavailable");
    id v11 = *v6;
    uint64_t v12 = *(void *)buf;
    uint64_t v13 = 32023;
LABEL_14:
    [v11 handleAVCaptureError:v13 error:v12];
    return;
  }
  if ([*v8 isEqualToString:@"avCaptureServerDied"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint32_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v14;
        __int16 v58 = 2080;
        v59 = "-[VCVideoCaptureServer handleCaptureEvent:subType:]_block_invoke";
        __int16 v60 = 1024;
        int v61 = 1314;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d received AVCAPTURE_FAILURE_CAPTURE_SERVER_DIED", buf, 0x1Cu);
      }
    }
    *(void *)buf = 0;
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", buf, 32032, 114, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoCaptureServer.m", 1319), @"Video capture failed.", @"Capture Server Died");
    id v11 = *v6;
    uint64_t v12 = *(void *)buf;
    uint64_t v13 = 32032;
    goto LABEL_14;
  }
  if ([*v8 isEqualToString:@"avCaptureCameraBecameAvailable"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v16;
        __int16 v58 = 2080;
        v59 = "-[VCVideoCaptureServer handleCaptureEvent:subType:]_block_invoke";
        __int16 v60 = 1024;
        int v61 = 1324;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d received AVCAPTURE_EVENT_CAMERA_AVAILABLE", buf, 0x1Cu);
      }
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    __int16 v19 = v18;
    if (v7)
    {
      [v18 setObject:v7 forKeyedSubscript:@"localCameraUIDString"];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_cold_1();
      }
    }
    __int16 v23 = *((void *)*v6 + 37);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_204;
    v56[3] = &unk_1E6DB3DC8;
    v56[4] = v19;
    dispatch_async(v23, v56);

    id v24 = *v6;
    uint64_t v25 = *((void *)*v6 + 15);
    uint64_t v26 = 1;
LABEL_32:
    [v24 notifyCameraDidChangeAvailability:v25 available:v26];
    return;
  }
  if (([*v8 isEqualToString:@"vcScreenCaptureFailStart"] & 1) != 0
    || [*v8 isEqualToString:@"vcScreenCaptureFailPreempt"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_cold_2();
      }
    }
    [*v6 stopCapture];
    id v20 = *v6;
    __int16 v21 = *((void *)*v6 + 33);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_213;
    block[3] = &unk_1E6DB3E40;
    id v22 = *v8;
    void block[4] = v20;
    void block[5] = v22;
    dispatch_async(v21, block);
    [*v6 sendBiomeEventIsStarting:0];
    return;
  }
  if ([*v8 isEqualToString:@"avCaptureCameraDidStart"])
  {
    id v27 = *v6;
    __int16 v28 = *((void *)*v6 + 37);
    if (*((void *)*v6 + 48))
    {
      int v29 = v54;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      __int16 v30 = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_2;
    }
    else
    {
      id v27 = 0;
      int v29 = v53;
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      __int16 v30 = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_3;
    }
    v29[2] = v30;
    v29[3] = &unk_1E6DB3DC8;
    v29[4] = v27;
    dispatch_async(v28, v29);
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      return;
    }
    uint64_t v36 = VRTraceErrorLogLevelToCSTR();
    int v37 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v38 = *((_DWORD *)*v6 + 2);
    int v39 = *((_DWORD *)*v6 + 3);
    int v40 = *((_DWORD *)*v6 + 4);
    int v41 = *((unsigned __int8 *)*v6 + 454);
    *(_DWORD *)buf = 136316674;
    *(void *)&uint8_t buf[4] = v36;
    __int16 v58 = 2080;
    v59 = "-[VCVideoCaptureServer handleCaptureEvent:subType:]_block_invoke_4";
    __int16 v60 = 1024;
    int v61 = 1363;
    __int16 v62 = 1024;
    *(_DWORD *)v63 = v38;
    *(_WORD *)&v63[4] = 1024;
    *(_DWORD *)&v63[6] = v39;
    LOWORD(v64) = 1024;
    *(_DWORD *)((char *)&v64 + 2) = v40;
    HIWORD(v64) = 1024;
    int v65 = v41;
    v42 = "VCVideoCaptureServer [%s] %s:%d %dx%d @ %d, _isPreviewRunning=%d";
    uint64_t v43 = v37;
    uint32_t v44 = 52;
LABEL_52:
    _os_log_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_DEFAULT, v42, buf, v44);
    return;
  }
  if (![*v8 isEqualToString:@"avCaptureCameraDidStop"])
  {
    if ([*v8 isEqualToString:@"avCaptureCameraInterrupted"])
    {
      uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", *(void *)(a1 + 40), @"previewInterruptionReason", 0);
      int v35 = v34;
      if (v7)
      {
        [v34 setObject:v7 forKeyedSubscript:@"localCameraUIDString"];
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_cold_3();
        }
      }
      v50 = *((void *)*v6 + 37);
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_238;
      v51[3] = &unk_1E6DB3DC8;
      v51[4] = v35;
      dispatch_async(v50, v51);
      id v24 = *v6;
      uint64_t v25 = *((void *)*v6 + 15);
      uint64_t v26 = 0;
      goto LABEL_32;
    }
    if ([*v8 isEqualToString:@"vcScreenCaptureScreenAndCameraMixingEnabled"])
    {
      id v45 = *v6;
      uint64_t v46 = 1;
    }
    else
    {
      if (![*v8 isEqualToString:@"vcScreenCaptureScreenAndCameraMixingDisabled"]) {
        return;
      }
      id v45 = *v6;
      uint64_t v46 = 0;
    }
    [v45 screenAndCameraMixingEnable:v46];
    return;
  }
  id v31 = *v6;
  __int16 v32 = *((void *)*v6 + 37);
  if (*((void *)*v6 + 48))
  {
    uint64_t v33 = v52;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_226;
    v52[3] = &unk_1E6DB3DC8;
    v52[4] = v31;
  }
  else
  {
    uint64_t v33 = &__block_literal_global_74;
  }
  dispatch_async(v32, v33);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v47 = VRTraceErrorLogLevelToCSTR();
    __int16 v48 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v49 = *((unsigned __int8 *)*v6 + 454);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v47;
      __int16 v58 = 2080;
      v59 = "-[VCVideoCaptureServer handleCaptureEvent:subType:]_block_invoke_3";
      __int16 v60 = 1024;
      int v61 = 1376;
      __int16 v62 = 1024;
      *(_DWORD *)v63 = v49;
      v42 = "VCVideoCaptureServer [%s] %s:%d _isPreviewRunning=%d";
      uint64_t v43 = v48;
      uint32_t v44 = 34;
      goto LABEL_52;
    }
  }
}

- (void)handleCaptureEvent:(id)a3 subType:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  captureServerQueue = self->captureServerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke;
  v5[3] = &unk_1E6DB43D8;
  v5[4] = a3;
  v5[5] = a4;
  v5[6] = self;
  dispatch_async(captureServerQueue, v5);
}

- (void)handleCaptureEvent:(id)a3
{
}

- (void)setCameraZoomAvailable:(BOOL)a3 currentZoomFactor:(double)a4 maxZoomFactor:(double)a5
{
  BOOL v7 = a3;
  v18[5] = *MEMORY[0x1E4F143B8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v10 = (void *)[objc_alloc(NSNumber) initWithBool:v7];
  id v11 = objc_alloc(NSNumber);
  *(float *)&double v12 = a4;
  uint64_t v13 = (void *)[v11 initWithFloat:v12];
  id v14 = objc_alloc(NSNumber);
  *(float *)&double v15 = a5;
  uint64_t v16 = (void *)[v14 initWithFloat:v15];
  [v9 setObject:v10 forKeyedSubscript:@"previewCameraZoomAvailabilty"];
  [v9 setObject:v13 forKeyedSubscript:@"previewCameraZoomFactor"];
  [v9 setObject:v16 forKeyedSubscript:@"previewCameraZoomMaxFactor"];
  captureServerQueue = self->captureServerQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__VCVideoCaptureServer_setCameraZoomAvailable_currentZoomFactor_maxZoomFactor___block_invoke;
  v18[3] = &unk_1E6DB3DC8;
  v18[4] = v9;
  dispatch_async(captureServerQueue, v18);
}

- (int)bestCameraCaptureFrameRate
{
  return self->_bestCameraCaptureFrameRate;
}

void __59__VCVideoCaptureServer_captureVideoWidth_height_frameRate___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 120) count])
  {
    int v13 = 2048;
    *(_DWORD *)buf = 2048;
    int v12 = 60;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v20 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v22 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(a1 + 32), "updateCaptureWidth:height:frameRate:withVideoRule:", buf, &v13, &v12, objc_msgSend(*(id *)(a1 + 32), "videoRuleForClient:", *(void *)(*((void *)&v21 + 1) + 8 * i)));
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v20 count:16];
      }
      while (v4);
    }
    BOOL v7 = *(_DWORD **)(a1 + 48);
    if (v7) {
      *BOOL v7 = *(_DWORD *)buf;
    }
    uint64_t v8 = *(int **)(a1 + 56);
    if (v8) {
      *uint64_t v8 = v13;
    }
    id v9 = *(int **)(a1 + 64);
    if (v9) {
      *id v9 = v12;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    id v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = v10;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCVideoCaptureServer captureVideoWidth:height:frameRate:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 1534;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d cameraVideoSinks is empty", buf, 0x1Cu);
    }
  }
}

+ (id)VCVideoCaptureServerSingleton
{
  uint64_t v3 = objc_opt_class();
  objc_sync_enter(v3);
  if (!_vcVideoCaptureServerSingleton) {
    _vcVideoCaptureServerSingleton = (uint64_t)objc_alloc_init((Class)a1);
  }
  objc_sync_exit(v3);
  return (id)_vcVideoCaptureServerSingleton;
}

- (VCVideoCaptureServer)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)VCVideoCaptureServer;
  uint64_t v2 = [(VCVideoCaptureServer *)&v26 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->snapshotRequestCount = 0;
    *(void *)&v2->currentWidth = 0;
    *(void *)&v2->int currentFrameRate = 0;
    v2->_screenCurrentFrameRate = 0;
    v2->_defaultCapturePixelFormat = VCVideoUtil_DefaultCameraCapturePixelFormat();
    v3->avCapture = 0;
    v3->appDelegate = 0;
    v3->_screenShareCaptureConfig = 0;
    v3->frontQueue = 0;
    v3->backQueue = 0;
    v3->_screenCaptureSource = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_screenCaptureConfig = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_screenClientToCaptureSourceID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_screenCaptureThermalFrameRateThresholds = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_systemAudioCapture = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_systemAudioCaptureConfig = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_systemAudioSourceToClients = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->cameraVideoSinks = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->screenCaptureClients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_cameraPreviewClients = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_cameraSinkVideoRules = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = objc_alloc_init(VideoAttributes);
    v3->localVideoAttributes = v4;
    [(VideoAttributes *)v4 setOrientation:0];
    v3->_tokenManager = (VCVideoSourceTokenManager *)+[VCVideoSourceTokenManager sharedManager];
    v3->_useAVCaptureSession = 1;
    [(VCVideoCaptureServer *)v3 setUpDefaultAspectRatios];
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v3->captureClientQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.captureClientQueue", 0, CustomRootQueue);
    v3->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.xpcCommandQueue", 0, CustomRootQueue);
    v3->delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.delegateNotificationQueue", 0, CustomRootQueue);
    uint64_t v6 = VCDispatchQueue_GetCustomRootQueue(37);
    v3->captureServerQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.captureServerQueue", 0, v6);
    v3->variablesQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.variablesQueue", MEMORY[0x1E4F14430], v6);
    v3->snapshotQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.snapshotQueue", 0, v6);
    v3->_cameraPreviewClientMonitorQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.clientMonitorQueue", 0, v6);
    BOOL v7 = (const dispatch_source_type_s *)MEMORY[0x1E4F14490];
    uint64_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v3->captureServerQueue);
    v3->cameraHealthMonitor = (OS_dispatch_source *)v8;
    dispatch_source_set_timer(v8, 0, 0x12A05F200uLL, 0x11E1A300uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __28__VCVideoCaptureServer_init__block_invoke;
    handler[3] = &unk_1E6DB3DC8;
    handler[4] = v3;
    dispatch_source_set_event_handler((dispatch_source_t)v3->cameraHealthMonitor, handler);
    dispatch_source_set_cancel_handler((dispatch_source_t)v3->cameraHealthMonitor, handler);
    id v9 = dispatch_source_create(v7, 0, 0, (dispatch_queue_t)v3->captureClientQueue);
    v3->screenHealthMonitor = (OS_dispatch_source *)v9;
    dispatch_source_set_timer(v9, 0, 0x12A05F200uLL, 0x11E1A300uLL);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __28__VCVideoCaptureServer_init__block_invoke_27;
    v24[3] = &unk_1E6DB3DC8;
    v24[4] = v3;
    dispatch_source_set_event_handler((dispatch_source_t)v3->screenHealthMonitor, v24);
    dispatch_source_set_cancel_handler((dispatch_source_t)v3->screenHealthMonitor, v24);
    [v3->localVideoAttributes setCamera:3];
    *(_WORD *)&v3->_viewPointCorrectionEnabledByThermal = 257;
    if (![(VCVideoCaptureServer *)v3 isAirPlayXPCHelper]) {
      [(VCVideoCaptureServer *)v3 registerBlocksForServer];
    }
    uint64_t v10 = (const char *)*MEMORY[0x1E4F14918];
    notify_register_check((const char *)*MEMORY[0x1E4F14918], &v3->_thermalNotificationToken);
    int thermalNotificationToken = v3->_thermalNotificationToken;
    *(void *)state64 = 0;
    notify_get_state(thermalNotificationToken, (uint64_t *)state64);
    int v12 = *(_DWORD *)state64;
    v3->_newThermalLevel = *(_DWORD *)state64;
    v3->_int thermalLevel = v12;
    v3->_forceDisableThermal = [+[VCDefaults sharedInstance] forceDisableThermal];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __28__VCVideoCaptureServer_init__block_invoke_31;
    v23[3] = &unk_1E6DB4D98;
    v23[4] = v3;
    int v13 = MEMORY[0x1E4F14428];
    notify_register_dispatch(v10, &v3->_thermalNotificationToken, MEMORY[0x1E4F14428], v23);
    notify_register_check("com.apple.system.peakpowerpressurelevel", &v3->_peakPowerNotificationToken);
    int peakPowerNotificationToken = v3->_peakPowerNotificationToken;
    *(void *)state64 = 0;
    notify_get_state(peakPowerNotificationToken, (uint64_t *)state64);
    int v15 = *(_DWORD *)state64;
    v3->_newPeakPowerLevel = *(_DWORD *)state64;
    v3->_peakPowerLevel = v15;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __28__VCVideoCaptureServer_init__block_invoke_2;
    v22[3] = &unk_1E6DB4D98;
    v22[4] = v3;
    notify_register_dispatch("com.apple.system.peakpowerpressurelevel", &v3->_peakPowerNotificationToken, v13, v22);
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&time, HostTimeClock);
    v3->_previousFrameTime = CMTimeGetSeconds(&time);
    if (![(VCVideoCaptureServer *)v3 isAirPlayXPCHelper]
      && +[VCHardwareSettings isExternalCameraSupported])
    {
      [(VCVideoCaptureServer *)v3 setFollowSystemCamera:1];
    }
    v3->_skipPreviewTransform = VCFeatureFlagManager_PreviewMSROptimizationForEmbedded();
    v3->_previewShouldMirrorOnly = VCDefaults_GetBoolValueForKey(@"previewShouldMirrorOnlyForEmbedded", v3->_previewShouldMirrorOnly);
    v3->_is1080pCameraAvailable = 1;
    [(VCVideoCaptureServer *)v3 setupStreamInputs];
    [(VCVideoCaptureServer *)v3 setUpImageConverters];
    [(VCVideoCaptureServer *)v3 setupLogFiles];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      int v19 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)state64 = 136315650;
          *(void *)&state64[4] = v17;
          __int16 v28 = 2080;
          int v29 = "-[VCVideoCaptureServer init]";
          __int16 v30 = 1024;
          int v31 = 567;
          _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d done initialization of singleton", state64, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        -[VCVideoCaptureServer init]();
      }
    }
    pthread_mutex_init(&v3->_enqueueLock, 0);
  }
  return v3;
}

void __28__VCVideoCaptureServer_init__block_invoke_27(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 336))
  {
    if (objc_opt_respondsToSelector()) {
      int v2 = [*(id *)(*(void *)(a1 + 32) + 336) frameCount:1];
    }
    else {
      int v2 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      int v3 = [*(id *)(*(void *)(a1 + 32) + 336) frameDropsWithShouldReset:1];
    }
    else {
      int v3 = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136316162;
        uint64_t v7 = v4;
        __int16 v8 = 2080;
        id v9 = "-[VCVideoCaptureServer init]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 504;
        __int16 v12 = 1024;
        int v13 = v2;
        __int16 v14 = 1024;
        int v15 = v3;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @=@ Health: ScreenCapture screenCaptureCount=%d screenCaptureFrameDrops=%d", (uint8_t *)&v6, 0x28u);
      }
    }
  }
}

uint64_t __28__VCVideoCaptureServer_init__block_invoke_31(uint64_t a1, int token)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1 + 32);
  v4[0] = 0;
  notify_get_state(token, v4);
  return [v2 thermalLevelDidChange:LODWORD(v4[0])];
}

uint64_t __28__VCVideoCaptureServer_init__block_invoke_2(uint64_t a1, int token)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  uint64_t result = notify_get_state(token, v4);
  *(_DWORD *)(*(void *)(a1 + 32) + 448) = v4[0];
  return result;
}

- (BOOL)isAirPlayXPCHelper
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  uint64_t v12 = 0;
  *(_OWORD *)pid = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  pid_t v2 = getpid();
  if (proc_pidinfo(v2, 17, 1uLL, &v9, 56) != 56)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer isAirPlayXPCHelper]();
      }
    }
    goto LABEL_11;
  }
  int v3 = proc_pidpath(pid[0], __b, 0x1000u);
  id v4 = [NSString alloc];
  uint64_t v5 = objc_msgSend(v4, "initWithBytes:length:encoding:", __b, v3, 4, v9);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer isAirPlayXPCHelper]();
      }
    }
LABEL_11:
    int v6 = 0;
    char v7 = 0;
    goto LABEL_4;
  }
  int v6 = v5;
  char v7 = objc_msgSend(@"AirPlayXPCHelper", "isEqualToString:", objc_msgSend(v5, "lastPathComponent"));
LABEL_4:

  return v7;
}

- (void)setupLogFiles
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d failed to open capture_statistics.log", v2, v3, v4, v5, v6);
}

- (void)setUpDefaultAspectRatios
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = +[VCHardwareSettings screenWidth];
  unsigned int v4 = +[VCHardwareSettings screenHeight];
  self->_defaultPortraitAspectRatio.width = (double)v4;
  self->_defaultPortraitAspectRatio.height = (double)v3;
  self->_defaultLandscapeAspectRatio.width = (double)v3;
  self->_defaultLandscapeAspectRatio.height = (double)v4;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint8_t v6 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    __int16 v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      NSSize defaultPortraitAspectRatio = self->_defaultPortraitAspectRatio;
      int v12 = 136315906;
      uint64_t v13 = v7;
      __int16 v14 = 2080;
      int v15 = "-[VCVideoCaptureServer setUpDefaultAspectRatios]";
      __int16 v16 = 1024;
      int v17 = 633;
      __int16 v18 = 2112;
      int v19 = NSStringFromSize(defaultPortraitAspectRatio);
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d _defaultPortraitAspectRatio=%@", (uint8_t *)&v12, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = NSStringFromSize(self->_defaultLandscapeAspectRatio);
      int v12 = 136315906;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      int v15 = "-[VCVideoCaptureServer setUpDefaultAspectRatios]";
      __int16 v16 = 1024;
      int v17 = 634;
      __int16 v18 = 2112;
      int v19 = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d _defaultLandscapeAspectRatio=%@", (uint8_t *)&v12, 0x26u);
    }
  }
  -[VCVideoCaptureServer updateLocalAspectRatios:localScreenAspectRatio:](self, "updateLocalAspectRatios:localScreenAspectRatio:", 0, self->_defaultPortraitAspectRatio.width, self->_defaultPortraitAspectRatio.height);
  -[VCVideoCaptureServer updateLocalAspectRatios:localScreenAspectRatio:](self, "updateLocalAspectRatios:localScreenAspectRatio:", 2, self->_defaultLandscapeAspectRatio.width, self->_defaultLandscapeAspectRatio.height);
}

- (void)dealloc
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((VCVideoCaptureServer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = v4;
        __int16 v21 = 2080;
        long long v22 = "-[VCVideoCaptureServer dealloc]";
        __int16 v23 = 1024;
        int v24 = 640;
        uint8_t v6 = "VCVideoCaptureServer [%s] %s:%d ";
        uint64_t v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unsigned int v3 = (__CFString *)[(VCVideoCaptureServer *)self performSelector:sel_logPrefix];
    }
    else {
      unsigned int v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v9;
        __int16 v21 = 2080;
        long long v22 = "-[VCVideoCaptureServer dealloc]";
        __int16 v23 = 1024;
        int v24 = 640;
        __int16 v25 = 2112;
        objc_super v26 = v3;
        __int16 v27 = 2048;
        __int16 v28 = self;
        uint8_t v6 = "VCVideoCaptureServer [%s] %s:%d %@(%p) ";
        uint64_t v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  notify_cancel(self->_thermalNotificationToken);
  notify_cancel(self->_peakPowerNotificationToken);
  if (self->_followSystemCamera) {
    [(VCVideoCaptureServer *)self removeObserveSystemPreferredCamera];
  }
  pthread_mutex_lock(&self->_enqueueLock);

  self->frontQueue = 0;
  self->backQueue = 0;
  pthread_mutex_unlock(&self->_enqueueLock);
  pthread_mutex_destroy(&self->_enqueueLock);

  [(NSMutableArray *)self->cameraVideoSinks removeAllObjects];
  [(NSMutableArray *)self->screenCaptureClients removeAllObjects];

  dispatch_release((dispatch_object_t)self->_cameraPreviewClientMonitorQueue);
  cameraHealthMonitor = self->cameraHealthMonitor;
  if (cameraHealthMonitor)
  {
    dispatch_source_cancel(cameraHealthMonitor);
    int v12 = self->cameraHealthMonitor;
    if (v12)
    {
      dispatch_release(v12);
      self->cameraHealthMonitor = 0;
    }
  }
  screenHealthMonitor = self->screenHealthMonitor;
  if (screenHealthMonitor)
  {
    dispatch_source_cancel(screenHealthMonitor);
    __int16 v14 = self->screenHealthMonitor;
    if (v14)
    {
      dispatch_release(v14);
      self->screenHealthMonitor = 0;
    }
  }
  dispatch_release((dispatch_object_t)self->captureServerQueue);
  dispatch_release((dispatch_object_t)self->captureClientQueue);
  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);
  dispatch_release((dispatch_object_t)self->delegateNotificationQueue);
  dispatch_release((dispatch_object_t)self->variablesQueue);
  dispatch_release((dispatch_object_t)self->snapshotQueue);
  transferSession = self->transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    CFRelease(self->transferSession);
  }
  bufferPool = self->bufferPool;
  if (bufferPool) {
    CVPixelBufferPoolRelease(bufferPool);
  }
  [(VCVideoCaptureServer *)self tearDownImageConverters];
  [(VCVideoCaptureServer *)self cleanupStreamInputs];
  bufferStatsDumpFile = self->_bufferStatsDumpFile;
  if (bufferStatsDumpFile) {
    fclose(bufferStatsDumpFile);
  }
  v18.receiver = self;
  v18.super_class = (Class)VCVideoCaptureServer;
  [(VCVideoCaptureServer *)&v18 dealloc];
}

- (VCVideoCaptureServer)allocWithZone:(_NSZone *)a3
{
  return (VCVideoCaptureServer *)_vcVideoCaptureServerSingleton;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)setUpImageConverters
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to create _previewImageRotationConverter", v2, v3, v4, v5, v6);
}

- (void)tearDownImageConverters
{
  self->_previewImageRotationConverter = 0;
  self->_previewMirroringConverter = 0;
}

- (void)registerBlocksForServer
{
  void v22[5] = *MEMORY[0x1E4F143B8];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke;
  v22[3] = &unk_1E6DB5478;
  v22[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewInitialize", v22, self->_xpcCommandQueue);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2;
  v21[3] = &unk_1E6DB5478;
  v21[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewStartPreview", v21, self->_xpcCommandQueue);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_88;
  v20[3] = &unk_1E6DB5478;
  v20[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewPausePreview", v20, self->_xpcCommandQueue);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_93;
  v19[3] = &unk_1E6DB5478;
  v19[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewStopPreview", v19, self->_xpcCommandQueue);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_96;
  v18[3] = &unk_1E6DB5478;
  v18[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewSetLocalCamera", v18, self->_xpcCommandQueue);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2_98;
  v17[3] = &unk_1E6DB5478;
  v17[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewGetLocalCamera", v17, self->_xpcCommandQueue);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_3;
  v16[3] = &unk_1E6DB5478;
  v16[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewSetLocalVideoAttributes", v16, self->_xpcCommandQueue);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_4;
  v15[3] = &unk_1E6DB5478;
  v15[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewSetLocalScreenAttributes", v15, self->_xpcCommandQueue);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_5;
  v14[3] = &unk_1E6DB5478;
  v14[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewGetLocalVideoSlot", v14, self->_xpcCommandQueue);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_110;
  v13[3] = &unk_1E6DB5478;
  v13[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewGetLocalVideoContext", v13, self->_xpcCommandQueue);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_118;
  v12[3] = &unk_1E6DB5478;
  v12[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewSetLayerBounds", v12, self->_xpcCommandQueue);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_125;
  v11[3] = &unk_1E6DB5478;
  v11[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewGetSnapShot", v11, self->_xpcCommandQueue);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2_127;
  v10[3] = &unk_1E6DB5478;
  v10[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewBeginPreviewToPIPAnimation", v10, self->_xpcCommandQueue);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_3_129;
  v9[3] = &unk_1E6DB5478;
  v9[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewEndPreviewToPIPAnimation", v9, self->_xpcCommandQueue);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_4_131;
  v8[3] = &unk_1E6DB5478;
  v8[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewBeginPIPToPreviewAnimation", v8, self->_xpcCommandQueue);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_5_133;
  v7[3] = &unk_1E6DB5478;
  v7[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewEndPIPToPreviewAnimation", v7, self->_xpcCommandQueue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_6;
  v6[3] = &unk_1E6DB5478;
  v6[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewCameraZoomFactor", v6, self->_xpcCommandQueue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_7;
  v5[3] = &unk_1E6DB5478;
  v5[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewCameraZoomFactorRate", v5, self->_xpcCommandQueue);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  uint64_t v4[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_8;
  v4[3] = &unk_1E6DB5478;
  v4[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewCameraCinematicFraming", v4, self->_xpcCommandQueue);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_9;
  v3[3] = &unk_1E6DB5478;
  v3[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewFollowSystemCamera", v3, self->_xpcCommandQueue);
}

void __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_66(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "setObject:forKeyedSubscript:", *(void *)(a1 + 40), objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(a1 + 48);
      int v5 = 136315906;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint32_t v8 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 804;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Initialized camera preview client pid=%u", (uint8_t *)&v5, 0x22u);
    }
  }
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_68(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 454);
  return result;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_88(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    int v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    if (v4)
    {
      [v4 setStarted:0];
      [*(id *)(a1 + 32) pausePreview];
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_88_cold_1();
        }
      }
      [*(id *)(a1 + 32) handleAVCaptureError:2148073489 domain:@"avCaptureStopFail"];
    }
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_93(uint64_t a1, void *a2)
{
  *(void *)&void v22[5] = *MEMORY[0x1E4F143B8];
  [a2 objectForKeyedSubscript:@"CONTEXT"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (isKindOfClass)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      __int16 v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        objc_super v18 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 879;
        __int16 v21 = 1024;
        *(_DWORD *)long long v22 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"CLIENTPID"), "intValue");
        v22[2] = 1024;
        *(_DWORD *)&v22[3] = [a2 objectForKey:@"CLIENTDIED"] != 0;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d stopPreview invoked by %d, client died %d", buf, 0x28u);
      }
    }
    uint32_t v8 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    if ([a2 objectForKeyedSubscript:@"CLIENTDIED"])
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = *(NSObject **)(v9 + 280);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_94;
      v14[3] = &unk_1E6DB3E40;
      v14[4] = a2;
      void v14[5] = v9;
      dispatch_async(v10, v14);
    }
    else
    {
      [v8 setStarted:0];
    }
    if ([*(id *)(a1 + 32) canStopPreview]) {
      [*(id *)(a1 + 32) stopPreview];
    }
  }
  else if (ErrorLogLevelForModule >= 5)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      objc_super v18 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 875;
      __int16 v21 = 2112;
      *(void *)long long v22 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "description");
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d VCVideoCaptureServer: context is not of type VCCameraPreview, %@", buf, 0x26u);
    }
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_94(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"CLIENTPID"), "intValue");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 887;
      __int16 v12 = 1024;
      int v13 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Removing camera preview client pid=%u", (uint8_t *)&v6, 0x22u);
    }
  }
  return objc_msgSend(*(id *)(*(void *)(a1 + 40) + 136), "removeObjectForKey:", objc_msgSend(NSNumber, "numberWithInt:", v2));
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_96(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend(*(id *)(a1 + 32), "setLocalCamera:", objc_msgSend(a2, "objectForKeyedSubscript:", @"localCameraUIDString"));
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2_98(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 96) deviceNameForToken:*(unsigned int *)(*(void *)(a1 + 32) + 104)];
  return objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v4, @"localCameraUIDString", 0);
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_4(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", [a2 objectForKeyedSubscript:@"localVideoAttributes"]);
    [*(id *)(a1 + 32) setLocalScreenAttributes:v4];
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_110(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  int v5 = (void *)[a2 objectForKeyedSubscript:@"videoSlotFacing"];
  NSRect v35 = NSRectFromString((NSString *)[a2 objectForKeyedSubscript:@"conferenceVisualRectangle"]);
  CGFloat x = v35.origin.x;
  CGFloat y = v35.origin.y;
  CGFloat width = v35.size.width;
  CGFloat height = v35.size.height;
  char v23 = 1;
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v22 = unk_1E25A1E38;
  uint64_t v15 = 0;
  LOBYTE(v16) = [v5 BOOLValue];
  __int16 v17 = &v23;
  CGFloat v18 = x;
  CGFloat v19 = y;
  CGFloat v20 = width;
  CGFloat v21 = height;
  LOWORD(v22) = 1;
  uint64_t v10 = [*(id *)(a1 + 32) setLocalVideoDestination:&v15];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ previewGetLocalVideoContext");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = v11;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke";
      __int16 v28 = 1024;
      int v29 = 984;
      __int16 v30 = 1024;
      int v31 = v10;
      __int16 v32 = 2112;
      uint64_t v33 = v5;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @:@ previewGetLocalVideoContext contextId=%u front=%@", buf, 0x2Cu);
    }
  }
  int v13 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v10];
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v13, @"videoContextId", 0);

  return v4;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  int v6 = (void *)[a2 objectForKeyedSubscript:@"videoSlotFacing"];
  uint64_t v7 = (NSString *)[a2 objectForKeyedSubscript:@"conferenceVisualRectangle"];
  if (v6 && v7)
  {
    NSRect v17 = NSRectFromString(v7);
    double x = v17.origin.x;
    double y = v17.origin.y;
    double width = v17.size.width;
    double height = v17.size.height;
    if (VideoUtil_LayerBoundsAreValid(v17.origin.x, v17.origin.y, v17.size.width, v17.size.height))
    {
      uint64_t v12 = [a2 objectForKeyedSubscript:@"USERXPCARGUMENTS"];
      uint64_t v13 = [MEMORY[0x1E4F39BB8] handleFromXPCRepresentation:v12];
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        uint64_t v15 = (int)objc_msgSend(*(id *)(a1 + 32), "setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:", objc_msgSend(v6, "BOOLValue"), v13, x, y, width, height);
        [v14 invalidate];
        if (!a3) {
          return 0;
        }
        goto LABEL_7;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_118_cold_2();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_118_cold_3();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_118_cold_1();
    }
  }
  uint64_t v15 = 1;
  if (!a3) {
    return 0;
  }
LABEL_7:
  if (v15) {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"GKVoiceChatServiceErrorDomain" code:v15 userInfo:0];
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_125(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 112), 1u);
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2_127(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    [*(id *)(a1 + 32) beginPreviewToPIPAnimation];
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_3_129(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    [*(id *)(a1 + 32) endPreviewToPIPAnimation];
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_4_131(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    [*(id *)(a1 + 32) beginPIPToPreviewAnimation];
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_5_133(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    [*(id *)(a1 + 32) endPIPToPreviewAnimation];
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_6(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"previewCameraZoomFactor"), "floatValue");
    [v4 setCameraZoomFactor:v5];
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_7(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"previewCameraZoomFactor"), "floatValue");
    double v6 = v5;
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"previewCameraZoomRate"), "floatValue");
    [v4 setCameraZoomFactor:v6 withRate:v7];
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_9(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend(*(id *)(a1 + 32), "setFollowSystemCamera:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"previewFollowSystemCamera"), "BOOLValue"));
  }
  return 0;
}

- (void)handleAVCaptureError:(int)a3 domain:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  if (a3 == -2146893807) {
    uint64_t v6 = 32006;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:a4 code:v6 userInfo:0];
  [(VCVideoCaptureServer *)self handleAVCaptureError:v4 error:v7];
}

- (void)handleAVCaptureError:(int)a3 error:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(a4, "domain", *(void *)&a3);
  if (([v6 isEqualToString:@"avCaptureSetCameraWithUIDFail"] & 1) == 0)
  {
    if (([v6 isEqualToString:@"avCaptureStartPreviewFail"] & 1) != 0
      || ([v6 isEqualToString:@"avCaptureStopFail"] & 1) != 0
      || ([v6 isEqualToString:@"avCaptureStartCaptureFail"] & 1) != 0)
    {
      int v8 = 1;
      int v7 = 1;
      goto LABEL_7;
    }
    if ([a4 code] != 32023)
    {
      [a4 code];
      int v8 = 0;
      int v7 = 0;
      goto LABEL_7;
    }
  }
  int v7 = 0;
  int v8 = 1;
LABEL_7:
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v10 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 3
    && (uint64_t v11 = VRTraceErrorLogLevelToCSTR(), v12 = *v10, os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR)))
  {
    int v30 = [a4 code];
    appDelegate = self->appDelegate;
    *(_DWORD *)buf = 136316418;
    uint64_t v37 = v11;
    __int16 v38 = 2080;
    int v39 = "-[VCVideoCaptureServer handleAVCaptureError:error:]";
    __int16 v40 = 1024;
    int v41 = 1248;
    __int16 v42 = 1024;
    *(_DWORD *)uint64_t v43 = v30;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v8;
    *(_WORD *)uint32_t v44 = 2048;
    *(void *)&v44[2] = appDelegate;
    _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d err=%d, informClient=%d, appDelegate=%p", buf, 0x32u);
    if (!v8) {
      goto LABEL_32;
    }
  }
  else if (!v8)
  {
    goto LABEL_32;
  }
  id v13 = [(VCVideoSourceTokenManager *)self->_tokenManager deviceNameForToken:self->_currentVideoSourceToken.var0.var1];
  uint64_t v14 = self->appDelegate;
  int v15 = VRTraceGetErrorLogLevelForModule();
  if (v14)
  {
    if (v15 >= 8)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      NSRect v17 = *v10;
      CGFloat v18 = *v10;
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v37 = v16;
          __int16 v38 = 2080;
          int v39 = "-[VCVideoCaptureServer handleAVCaptureError:error:]";
          __int16 v40 = 1024;
          int v41 = 1252;
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d notifying app of acvapture error", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[VCVideoCaptureServer handleAVCaptureError:error:]();
      }
    }
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__VCVideoCaptureServer_handleAVCaptureError_error___block_invoke;
    block[3] = &unk_1E6DB43D8;
    void block[4] = self;
    void block[5] = v13;
    void block[6] = a4;
    dispatch_async(delegateNotificationQueue, block);
  }
  else
  {
    if (v15 >= 8)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      CGFloat v20 = *v10;
      CGFloat v21 = *v10;
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v37 = v19;
          __int16 v38 = 2080;
          int v39 = "-[VCVideoCaptureServer handleAVCaptureError:error:]";
          __int16 v40 = 1024;
          int v41 = 1259;
          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d notifying clients of avcapture error", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        -[VCVideoCaptureServer handleAVCaptureError:error:]();
      }
    }
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v24 = v23;
    if (v13)
    {
      [v23 setObject:v13 forKeyedSubscript:@"localCameraUIDString"];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer handleAVCaptureError:error:]();
      }
    }
    uint64_t v25 = objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "newNSDictionaryFromNSError:", a4);
    [v24 setObject:v25 forKeyedSubscript:@"conferenceError"];

    __int16 v26 = self->delegateNotificationQueue;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __51__VCVideoCaptureServer_handleAVCaptureError_error___block_invoke_179;
    v34[3] = &unk_1E6DB3DC8;
    v34[4] = v24;
    dispatch_async(v26, v34);
  }
LABEL_32:
  if ([a4 code] == 32023)
  {
    [(VCVideoCaptureServer *)self pausePreview];
  }
  else if (v7)
  {
    [(VCVideoCaptureServer *)self stopPreview];
    captureClientQueue = self->captureClientQueue;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __51__VCVideoCaptureServer_handleAVCaptureError_error___block_invoke_2;
    v33[3] = &unk_1E6DB3E40;
    v33[4] = self;
    v33[5] = v6;
    dispatch_async(captureClientQueue, v33);
  }
  [(VCVideoCaptureServer *)self updatePreviewState];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    int v29 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = objc_msgSend((id)objc_msgSend(a4, "domain"), "UTF8String");
      *(_DWORD *)buf = 136316418;
      uint64_t v37 = v28;
      __int16 v38 = 2080;
      int v39 = "-[VCVideoCaptureServer handleAVCaptureError:error:]";
      __int16 v40 = 1024;
      int v41 = 1291;
      __int16 v42 = 2080;
      *(void *)uint64_t v43 = v32;
      *(_WORD *)&v43[8] = 1024;
      *(_DWORD *)uint32_t v44 = v8;
      *(_WORD *)&v44[4] = 1024;
      *(_DWORD *)&v44[6] = v7;
      _os_log_error_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d Error encountered while accessing camera in %s, informed client %d, stopped preview %d", buf, 0x32u);
    }
  }
}

uint64_t __51__VCVideoCaptureServer_handleAVCaptureError_error___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = *(void **)(a1[4] + 384);
    uint64_t v5 = a1[6];
    return [v4 didReceiveErrorFromCameraUniqueID:v3 error:v5];
  }
  return result;
}

uint64_t __51__VCVideoCaptureServer_handleAVCaptureError_error___block_invoke_179(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"previewDidReceiveCameraError" arguments:v3];
}

uint64_t __51__VCVideoCaptureServer_handleAVCaptureError_error___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) avConferencePreviewError:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_204(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"previewCameraDidBecomeAvailable" arguments:v3];
}

uint64_t __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_213(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(void **)(*(void *)(a1 + 32) + 128);
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 avConferenceScreenCaptureError:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 384);
    return [v3 didStartPreview];
  }
  return result;
}

uint64_t __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_226(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 384);
    return [v3 didStopPreview];
  }
  return result;
}

uint64_t __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_2_229()
{
  id v0 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  return [v0 sendMessageAsync:"previewDidStop" arguments:0];
}

void __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_238(uint64_t a1)
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewCameraDidBecomeInterrupted", *(void *)(a1 + 32));
  id v2 = *(void **)(a1 + 32);
}

- (void)screenAndCameraMixingEnable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      long long v9 = "-[VCVideoCaptureServer screenAndCameraMixingEnable:]";
      __int16 v10 = 1024;
      int v11 = 1398;
      __int16 v12 = 1024;
      BOOL v13 = v3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d enabled=%d", (uint8_t *)&v6, 0x22u);
    }
  }
  [+[VCSessionManager sharedInstance] setScreenAndCameraMixingEnabled:v3];
}

uint64_t __50__VCVideoCaptureServer_reconnectClientLayerFront___block_invoke_2(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"previewDidLocalVideoContextChange" arguments:v3];
}

- (id)videoRuleForClient:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->captureClientQueue);
  if (!a3) {
    return 0;
  }
  id result = (id)[a3 clientCaptureRule];
  if (!result)
  {
    id result = (id)[NSNumber numberWithUnsignedLong:a3];
    if (result)
    {
      id v6 = result;
      cameraSinkVideoRules = self->_cameraSinkVideoRules;
      return (id)[(NSMutableDictionary *)cameraSinkVideoRules objectForKeyedSubscript:v6];
    }
  }
  return result;
}

- (void)updateCaptureWidth:(int *)a3 height:(int *)a4 frameRate:(int *)a5 withVideoRule:(id)a6
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->captureClientQueue);
  if (a6)
  {
    if ((int)[a6 iWidth] < *a3) {
      *a3 = [a6 iWidth];
    }
    if ((int)[a6 iHeight] < *a4) {
      *a4 = [a6 iHeight];
    }
    [a6 fRate];
    if (v10 < (float)*a5)
    {
      [a6 fRate];
      *a5 = (int)v11;
    }
  }
}

- (int)thermalPressureLevel
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (dispatch_get_current_queue() == (dispatch_queue_t)MEMORY[0x1E4F14428]) {
    return self->_newThermalLevel;
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VCVideoCaptureServer_thermalPressureLevel__block_invoke;
  block[3] = &unk_1E6DB4540;
  void block[4] = self;
  void block[5] = &v6;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__VCVideoCaptureServer_thermalPressureLevel__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 436);
  return result;
}

- (void)notifyThermalPressureObservers:(int)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"VCVideoCaptureServer_NotificationKeyThermalPressureLevel";
  v5[0] = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"VCVideoCaptureServer_NotificationNameThermalPressureLevel", 0, v3);
}

- (void)populateThermalFrameRateThresholdsForCaptureSourceID:(int64_t)a3 captureConfig:(id)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if ([a4 objectForKeyedSubscript:@"CaptureThermalLevelModerate"])
  {
    if ([a4 objectForKeyedSubscript:@"CaptureThermalLevelHeavy"])
    {
      v8[0] = &unk_1F3DC5AC0;
      v8[1] = &unk_1F3DC5AD8;
      v9[0] = [a4 objectForKeyedSubscript:@"CaptureThermalLevelModerate"];
      v9[1] = [a4 objectForKeyedSubscript:@"CaptureThermalLevelHeavy"];
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_screenCaptureThermalFrameRateThresholds, "setObject:forKeyedSubscript:", v7, [NSNumber numberWithInteger:a3]);
    }
  }
}

- (void)setCameraZoomFactor:(double)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VCVideoCaptureServer_setCameraZoomFactor___block_invoke;
  block[3] = &unk_1E6DB4568;
  *(double *)&void block[5] = a3;
  void block[4] = self;
  dispatch_async(captureServerQueue, block);
}

uint64_t __44__VCVideoCaptureServer_setCameraZoomFactor___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 136315906;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      int v9 = "-[VCVideoCaptureServer setCameraZoomFactor:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 1853;
      __int16 v12 = 2048;
      uint64_t v13 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Setting Camera Zoom Factor to %f", (uint8_t *)&v6, 0x26u);
    }
  }
  *(void *)(*(void *)(a1 + 32) + 464) = *(void *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 328) setCameraZoomFactor:*(double *)(a1 + 40)];
}

- (void)setCameraZoomFactor:(double)a3 withRate:(double)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  captureServerQueue = self->captureServerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __53__VCVideoCaptureServer_setCameraZoomFactor_withRate___block_invoke;
  v5[3] = &unk_1E6DB4518;
  *(double *)&void v5[5] = a3;
  *(double *)&v5[6] = a4;
  v5[4] = self;
  dispatch_async(captureServerQueue, v5);
}

uint64_t __53__VCVideoCaptureServer_setCameraZoomFactor_withRate___block_invoke(double *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *((void *)a1 + 5);
      uint64_t v5 = *((void *)a1 + 6);
      int v7 = 136316162;
      uint64_t v8 = v2;
      __int16 v9 = 2080;
      __int16 v10 = "-[VCVideoCaptureServer setCameraZoomFactor:withRate:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 1862;
      __int16 v13 = 2048;
      uint64_t v14 = v4;
      __int16 v15 = 2048;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Setting Camera Zoom Factor to %f with Rate: %f", (uint8_t *)&v7, 0x30u);
    }
  }
  return [*(id *)(*((void *)a1 + 4) + 328) setCameraZoomFactor:a1[5] withRate:a1[6]];
}

- (void)setFollowSystemCamera:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCVideoCaptureServer_setFollowSystemCamera___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  void block[4] = self;
  BOOL v5 = a3;
  dispatch_async(captureServerQueue, block);
}

void __46__VCVideoCaptureServer_setFollowSystemCamera___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v2 + 88) == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      BOOL v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v4;
        __int16 v17 = 2080;
        CGFloat v18 = "-[VCVideoCaptureServer setFollowSystemCamera:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 1890;
        __int16 v21 = 1024;
        int v22 = v6;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d ignoring, _followSystemCamera=%d already", buf, 0x22u);
      }
    }
  }
  else
  {
    *(unsigned char *)(v2 + 88) = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v7;
        __int16 v17 = 2080;
        CGFloat v18 = "-[VCVideoCaptureServer setFollowSystemCamera:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 1881;
        __int16 v21 = 1024;
        int v22 = v9;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d updating _followSystemCamera=%d", buf, 0x22u);
      }
    }
    __int16 v10 = *(unsigned char **)(a1 + 32);
    if (v10[88])
    {
      [v10 setSystemPreferredAsLocalCamera];
      [*(id *)(a1 + 32) addObserveSystemPreferredCamera];
    }
    else
    {
      [v10 removeObserveSystemPreferredCamera];
    }
  }
  __int16 v11 = (void *)[objc_alloc(NSNumber) initWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 88)];
  int v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v11, @"previewFollowSystemCamera", 0);
  __int16 v13 = *(NSObject **)(*(void *)(a1 + 32) + 296);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCVideoCaptureServer_setFollowSystemCamera___block_invoke_257;
  block[3] = &unk_1E6DB3DC8;
  void block[4] = v12;
  dispatch_async(v13, block);
}

uint64_t __46__VCVideoCaptureServer_setFollowSystemCamera___block_invoke_257(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"previewFollowSystemCameraDidChange" arguments:v3];
}

uint64_t __VCVideoCaptureServer_ApplyPressureLevelChanges_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 432) = *(_DWORD *)(*(void *)(a1 + 32) + 436);
  objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "updateThermalLevel:", *(unsigned int *)(*(void *)(a1 + 32) + 432));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 432) < 0x15u;
  if (*(unsigned __int8 *)(v2 + 452) != v3)
  {
    *(unsigned char *)(v2 + 452) = v3;
    [*(id *)(a1 + 32) updateViewPointCorrectionStatus];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [(id)v2 notifyThermalChangeForClients:*(void *)(v2 + 120)];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[16];

  return [v4 notifyThermalChangeForClients:v5];
}

uint64_t __VCVideoCaptureServer_ApplyPressureLevelChanges_block_invoke_260(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 444) = *(_DWORD *)(*(void *)(result + 32) + 448);
  return result;
}

- (int)getScreenFrameRateForThermalLevel:(int)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!self->_isScreenCaptureForScreenShare)
  {
    if ((VCVideoCaptureServer *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return 60;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 60;
      }
      int v24 = 136315906;
      uint64_t v25 = v16;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCVideoCaptureServer getScreenFrameRateForThermalLevel:]";
      __int16 v28 = 1024;
      int v29 = 1975;
      __int16 v30 = 1024;
      *(_DWORD *)int v31 = a3;
      CGFloat v18 = "VCVideoCaptureServer [%s] %s:%d Ignoring thermalLevel=%d for this capture source";
      __int16 v19 = v17;
      uint32_t v20 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCVideoCaptureServer *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return 60;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      int v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 60;
      }
      int v24 = 136316418;
      uint64_t v25 = v21;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCVideoCaptureServer getScreenFrameRateForThermalLevel:]";
      __int16 v28 = 1024;
      int v29 = 1975;
      __int16 v30 = 2112;
      *(void *)int v31 = v8;
      *(_WORD *)&v31[8] = 2048;
      uint64_t v32 = self;
      __int16 v33 = 1024;
      int v34 = a3;
      CGFloat v18 = "VCVideoCaptureServer [%s] %s:%d %@(%p) Ignoring thermalLevel=%d for this capture source";
      __int16 v19 = v22;
      uint32_t v20 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v24, v20);
    return 60;
  }
  if (a3 == 20) {
    int v5 = 15;
  }
  else {
    int v5 = 0;
  }
  if (((1 << a3) & 0x401) != 0) {
    int v5 = 60;
  }
  if (((1 << a3) & 0x4010040000000) != 0) {
    int v5 = 5;
  }
  if (a3 <= 0x32) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  if ((VCVideoCaptureServer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 136316162;
        uint64_t v25 = v9;
        __int16 v26 = 2080;
        __int16 v27 = "-[VCVideoCaptureServer getScreenFrameRateForThermalLevel:]";
        __int16 v28 = 1024;
        int v29 = 1994;
        __int16 v30 = 1024;
        *(_DWORD *)int v31 = v6;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = a3;
        __int16 v11 = "VCVideoCaptureServer [%s] %s:%d Screen framerate=%d for thermalLevel=%d";
        int v12 = v10;
        uint32_t v13 = 40;
LABEL_25:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v24, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCVideoCaptureServer *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 136316674;
        uint64_t v25 = v14;
        __int16 v26 = 2080;
        __int16 v27 = "-[VCVideoCaptureServer getScreenFrameRateForThermalLevel:]";
        __int16 v28 = 1024;
        int v29 = 1994;
        __int16 v30 = 2112;
        *(void *)int v31 = v7;
        *(_WORD *)&v31[8] = 2048;
        uint64_t v32 = self;
        __int16 v33 = 1024;
        int v34 = v6;
        __int16 v35 = 1024;
        int v36 = a3;
        __int16 v11 = "VCVideoCaptureServer [%s] %s:%d %@(%p) Screen framerate=%d for thermalLevel=%d";
        int v12 = v15;
        uint32_t v13 = 60;
        goto LABEL_25;
      }
    }
  }
  return v6;
}

- (int)screenFrameRateForThermalLevel:(int)a3 configuredFrameRate:(int)a4 captureSourceID:(id)a5
{
  int v6 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3 <= 39)
  {
    if (a3 == 20)
    {
      uint64_t v13 = [(NSMutableDictionary *)self->_screenCaptureThermalFrameRateThresholds objectForKeyedSubscript:a5];
      int v9 = v6;
      if (!v13) {
        goto LABEL_12;
      }
      p_screenCaptureThermalFrameRateThresholds = &self->_screenCaptureThermalFrameRateThresholds;
      int v12 = &unk_1F3DC5AC0;
      goto LABEL_11;
    }
    int v9 = a4;
    if (a3 != 30) {
      goto LABEL_12;
    }
LABEL_7:
    uint64_t v10 = [(NSMutableDictionary *)self->_screenCaptureThermalFrameRateThresholds objectForKeyedSubscript:a5];
    int v9 = v6;
    if (!v10) {
      goto LABEL_12;
    }
    p_screenCaptureThermalFrameRateThresholds = &self->_screenCaptureThermalFrameRateThresholds;
    int v12 = &unk_1F3DC5AD8;
LABEL_11:
    int v9 = objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](*p_screenCaptureThermalFrameRateThresholds, "objectForKeyedSubscript:", a5), "objectForKeyedSubscript:", v12), "intValue");
    goto LABEL_12;
  }
  if (a3 == 40) {
    goto LABEL_7;
  }
  int v9 = a4;
  if (a3 == 50) {
    goto LABEL_7;
  }
LABEL_12:
  if (v9 < v6) {
    int v6 = v9;
  }
  if ((VCVideoCaptureServer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136316162;
        uint64_t v24 = v15;
        __int16 v25 = 2080;
        __int16 v26 = "-[VCVideoCaptureServer screenFrameRateForThermalLevel:configuredFrameRate:captureSourceID:]";
        __int16 v27 = 1024;
        int v28 = 2019;
        __int16 v29 = 1024;
        *(_DWORD *)__int16 v30 = v6;
        *(_WORD *)&v30[4] = 1024;
        *(_DWORD *)&v30[6] = a3;
        __int16 v17 = "VCVideoCaptureServer [%s] %s:%d Screen framerate=%d for thermalLevel=%d";
        CGFloat v18 = v16;
        uint32_t v19 = 40;
LABEL_24:
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, v19);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(VCVideoCaptureServer *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136316674;
        uint64_t v24 = v20;
        __int16 v25 = 2080;
        __int16 v26 = "-[VCVideoCaptureServer screenFrameRateForThermalLevel:configuredFrameRate:captureSourceID:]";
        __int16 v27 = 1024;
        int v28 = 2019;
        __int16 v29 = 2112;
        *(void *)__int16 v30 = v14;
        *(_WORD *)&v30[8] = 2048;
        int v31 = self;
        __int16 v32 = 1024;
        int v33 = v6;
        __int16 v34 = 1024;
        int v35 = a3;
        __int16 v17 = "VCVideoCaptureServer [%s] %s:%d %@(%p) Screen framerate=%d for thermalLevel=%d";
        CGFloat v18 = v21;
        uint32_t v19 = 60;
        goto LABEL_24;
      }
    }
  }
  return v6;
}

- (void)notifyThermalChangeForClients:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCVideoCaptureServer_notifyThermalChangeForClients___block_invoke;
  block[3] = &unk_1E6DB3E40;
  void block[4] = self;
  void block[5] = a3;
  dispatch_async(captureClientQueue, block);
}

uint64_t __54__VCVideoCaptureServer_notifyThermalChangeForClients___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) thermalLevelDidChange:*(unsigned int *)(*(void *)(a1 + 32) + 436)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)notifyCameraDidChangeAvailability:(id)a3 available:(BOOL)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VCVideoCaptureServer_notifyCameraDidChangeAvailability_available___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  void block[4] = a3;
  BOOL v6 = a4;
  dispatch_async(captureClientQueue, block);
}

uint64_t __68__VCVideoCaptureServer_notifyCameraDidChangeAvailability_available___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) cameraAvailabilityDidChange:*(unsigned __int8 *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)notifyFrameRateBeingThrottledForClients:(id)a3 newFrameRate:(int)a4 thermalLevelDidChange:(BOOL)a5 powerLevelDidChange:(BOOL)a6
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__VCVideoCaptureServer_notifyFrameRateBeingThrottledForClients_newFrameRate_thermalLevelDidChange_powerLevelDidChange___block_invoke;
  block[3] = &unk_1E6DB76D8;
  void block[4] = a3;
  int v8 = a4;
  BOOL v9 = a5;
  BOOL v10 = a6;
  dispatch_async(captureClientQueue, block);
}

uint64_t __119__VCVideoCaptureServer_notifyFrameRateBeingThrottledForClients_newFrameRate_thermalLevelDidChange_powerLevelDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 frameRateIsBeingThrottled:*(unsigned int *)(a1 + 40) thermalLevelDidChange:*(unsigned __int8 *)(a1 + 44) powerLevelDidChange:*(unsigned __int8 *)(a1 + 45)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)onCaptureScreenFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 orientation:(int)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = FigSampleBufferRetain();
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VCVideoCaptureServer_onCaptureScreenFrame_frameTime_orientation___block_invoke;
  block[3] = &unk_1E6DB8A58;
  int v11 = a5;
  void block[4] = self;
  void block[5] = v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
  dispatch_async(captureClientQueue, block);
  if (!self->_forceDisableThermal) {
    VCVideoCaptureServer_ApplyPressureLevelChanges((uint64_t)self);
  }
}

uint64_t __67__VCVideoCaptureServer_onCaptureScreenFrame_frameTime_orientation___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v2 = *(unsigned char *)(a1 + 48);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v3 = *(void **)(*(void *)(a1 + 32) + 128);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = v2 & 3 | 0x90;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12[0] = 0;
        v12[1] = 0;
        __int16 v14 = 0;
        char v15 = 0;
        uint64_t v10 = *(void *)(a1 + 40);
        long long v16 = *(_OWORD *)(a1 + 52);
        uint64_t v17 = *(void *)(a1 + 68);
        char v13 = v6;
        [v9 onVideoFrame:v10 frameTime:&v16 attribute:v12];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v5);
  }
  return FigSampleBufferRelease();
}

- (void)changeCameraToPendingSettingsWithReset:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VCVideoCaptureServer_changeCameraToPendingSettingsWithReset___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  void block[4] = self;
  BOOL v5 = a3;
  dispatch_async(captureServerQueue, block);
}

uint64_t __63__VCVideoCaptureServer_changeCameraToPendingSettingsWithReset___block_invoke(uint64_t result)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(*(void *)(result + 32) + 76) * *(_DWORD *)(*(void *)(result + 32) + 72))
  {
    uint64_t v1 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      int v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(v1 + 32);
        int v5 = *(_DWORD *)(v4 + 72);
        LODWORD(v4) = *(_DWORD *)(v4 + 76);
        int v6 = *(unsigned __int8 *)(v1 + 40);
        int v7 = 136316418;
        uint64_t v8 = v2;
        __int16 v9 = 2080;
        uint64_t v10 = "-[VCVideoCaptureServer changeCameraToPendingSettingsWithReset:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 2228;
        __int16 v13 = 1024;
        int v14 = v5;
        __int16 v15 = 1024;
        int v16 = v4;
        __int16 v17 = 1024;
        int v18 = v6;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d picking up pending camera change %dx%d reset %d", (uint8_t *)&v7, 0x2Eu);
      }
    }
    uint64_t result = [*(id *)(v1 + 32) setCaptureWidth:*(unsigned int *)(*(void *)(v1 + 32) + 72) height:*(unsigned int *)(*(void *)(v1 + 32) + 76) rate:*(unsigned int *)(*(void *)(v1 + 32) + 80)];
    *(_DWORD *)(*(void *)(v1 + 32) + 72) = 0;
    *(_DWORD *)(*(void *)(v1 + 32) + 76) = 0;
    *(_DWORD *)(*(void *)(v1 + 32) + 80) = 0;
    if (*(unsigned char *)(v1 + 40)) {
      return [*(id *)(v1 + 32) previewVideoWidth:*(void *)(v1 + 32) + 72 height:*(void *)(v1 + 32) + 76 frameRate:*(void *)(v1 + 32) + 80];
    }
  }
  return result;
}

- (BOOL)canStopPreview
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  cameraPreviewClientMonitorQueue = self->_cameraPreviewClientMonitorQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__VCVideoCaptureServer_canStopPreview__block_invoke;
  v7[3] = &unk_1E6DB3EB8;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(cameraPreviewClientMonitorQueue, v7);
  if (*((unsigned char *)v9 + 24))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v3;
        __int16 v14 = 2080;
        __int16 v15 = "-[VCVideoCaptureServer canStopPreview]";
        __int16 v16 = 1024;
        int v17 = 2275;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d All client stopped; can stop preview",
          buf,
          0x1Cu);
      }
    }
  }
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __38__VCVideoCaptureServer_canStopPreview__block_invoke(uint64_t a1)
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 136);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__VCVideoCaptureServer_canStopPreview__block_invoke_2;
  v3[3] = &unk_1E6DB8B58;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __38__VCVideoCaptureServer_canStopPreview__block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a3 isStarted])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315906;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        int v12 = "-[VCVideoCaptureServer canStopPreview]_block_invoke_2";
        __int16 v13 = 1024;
        int v14 = 2268;
        __int16 v15 = 1024;
        int v16 = [a2 intValue];
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Preview client pid=%u is not stopped", (uint8_t *)&v9, 0x22u);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)thermalLevelDidChange:(int)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_newThermalLevel != a3)
  {
    self->_newThermalLevel = a3;
    streamInputQueue = self->_streamInputQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__VCVideoCaptureServer_thermalLevelDidChange___block_invoke;
    block[3] = &unk_1E6DB3F08;
    void block[4] = self;
    int v6 = a3;
    dispatch_async(streamInputQueue, block);
    [(VCVideoCaptureServer *)self notifyThermalPressureObservers:self->_newThermalLevel];
  }
}

uint64_t __46__VCVideoCaptureServer_thermalLevelDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 560) allValues];
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) thermalLevelDidChange:*(unsigned int *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)addObserveSystemPreferredCamera
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F16440] addObserver:self forKeyPath:@"systemPreferredCamera" options:1 context:0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315906;
      uint64_t v5 = v2;
      __int16 v6 = 2080;
      uint64_t v7 = "-[VCVideoCaptureServer addObserveSystemPreferredCamera]";
      __int16 v8 = 1024;
      int v9 = 2296;
      __int16 v10 = 2112;
      long long v11 = @"systemPreferredCamera";
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d KeyPath=%@", (uint8_t *)&v4, 0x26u);
    }
  }
}

- (void)removeObserveSystemPreferredCamera
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F16440] removeObserver:self forKeyPath:@"systemPreferredCamera" context:0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315906;
      uint64_t v5 = v2;
      __int16 v6 = 2080;
      uint64_t v7 = "-[VCVideoCaptureServer removeObserveSystemPreferredCamera]";
      __int16 v8 = 1024;
      int v9 = 2303;
      __int16 v10 = 2112;
      long long v11 = @"systemPreferredCamera";
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d KeyPath=%@", (uint8_t *)&v4, 0x26u);
    }
  }
}

- (BOOL)registerCaptureConfig:(id)a3 forSource:(int)a4
{
  if ((a4 - 7) < 3 || a4 == 5)
  {
    return -[VCVideoCaptureServer registerSystemAudioConfig:forSource:](self, "registerSystemAudioConfig:forSource:", a3);
  }
  else
  {
    if (a4 == 1) {
      -[VCVideoCaptureServer registerScreenVideoConfig:forSource:](self, "registerScreenVideoConfig:forSource:", a3, v4, v5);
    }
    return 1;
  }
}

- (BOOL)deregisterCaptureConfig:(id)a3 forSource:(int)a4
{
  if ((a4 - 7) < 3 || a4 == 5)
  {
    return -[VCVideoCaptureServer deregisterSystemAudioConfig:forSource:](self, "deregisterSystemAudioConfig:forSource:", a3);
  }
  else
  {
    if (a4 == 1) {
      -[VCVideoCaptureServer deregisterScreenVideoConfig:forSource:](self, "deregisterScreenVideoConfig:forSource:", a3, v4, v5);
    }
    return 1;
  }
}

- (void)registerCaptureClientForScreenShare:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VCVideoCaptureServer_registerCaptureClientForScreenShare___block_invoke;
  block[3] = &unk_1E6DB3E40;
  void block[4] = a3;
  void block[5] = self;
  dispatch_async(captureClientQueue, block);
}

void __60__VCVideoCaptureServer_registerCaptureClientForScreenShare___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 592), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "hash")));
    uint64_t v4 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(v4 + 592), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "hash"))), "integerValue");
      objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 576), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v5)), "addSink:", *(void *)(a1 + 32));
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 584), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v5));
      [v7 setObject:v6 forKeyedSubscript:@"Client"];
    }
    else if (([*(id *)(v4 + 128) containsObject:*(void *)(a1 + 32)] & 1) == 0)
    {
      [*(id *)(*(void *)(a1 + 40) + 128) addObject:*(void *)(a1 + 32)];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          int v11 = 136315906;
          uint64_t v12 = v8;
          __int16 v13 = 2080;
          int v14 = "-[VCVideoCaptureServer registerCaptureClientForScreenShare:]_block_invoke";
          __int16 v15 = 1024;
          int v16 = 2357;
          __int16 v17 = 2112;
          uint64_t v18 = v10;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Client Registered: %@", (uint8_t *)&v11, 0x26u);
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __60__VCVideoCaptureServer_registerCaptureClientForScreenShare___block_invoke_cold_1();
    }
  }
}

- (void)deregisterCaptureClientForScreenShare:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    captureClientQueue = self->captureClientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__VCVideoCaptureServer_deregisterCaptureClientForScreenShare___block_invoke;
    block[3] = &unk_1E6DB3E40;
    void block[4] = self;
    void block[5] = a3;
    dispatch_async(captureClientQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoCaptureServer deregisterCaptureClientForScreenShare:]();
    }
  }
}

uint64_t __62__VCVideoCaptureServer_deregisterCaptureClientForScreenShare___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 592), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "hash")));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 592), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "hash"))), "integerValue");
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 576), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v4)), "removeSink:", *(void *)(a1 + 40));
    uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 584), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v4));
    return [v5 setObject:0 forKeyedSubscript:@"Client"];
  }
  else
  {
    uint64_t result = [*(id *)(v3 + 128) containsObject:*(void *)(a1 + 40)];
    if (result)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 128);
      return [v8 removeObject:v7];
    }
  }
  return result;
}

- (void)registerScreenVideoConfig:(id)a3 forSource:(int)a4
{
  void block[6] = *MEMORY[0x1E4F143B8];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VCVideoCaptureServer_registerScreenVideoConfig_forSource___block_invoke;
  block[3] = &unk_1E6DB3E40;
  void block[4] = a3;
  void block[5] = self;
  dispatch_async(captureClientQueue, block);
}

uint64_t __60__VCVideoCaptureServer_registerScreenVideoConfig_forSource___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = v2 ? (const char *)objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "Register screen config=%s", v3);
    if (__str)
    {
      __lasts = 0;
      uint64_t v4 = strtok_r(__str, "\n", &__lasts);
      uint64_t v5 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          uint64_t v7 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v19 = v6;
            __int16 v20 = 2080;
            long long v21 = "-[VCVideoCaptureServer registerScreenVideoConfig:forSource:]_block_invoke";
            __int16 v22 = 1024;
            int v23 = 2383;
            __int16 v24 = 2080;
            __int16 v25 = "";
            __int16 v26 = 2080;
            __int16 v27 = v4;
            _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint64_t v4 = strtok_r(0, "\n", &__lasts);
      }
      while (v4);
      free(__str);
    }
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"CaptureSourceID"), "integerValue");
  uint64_t v9 = *(void *)(a1 + 40);
  if (v8)
  {
    uint64_t v12 = v8;
    objc_msgSend(*(id *)(v9 + 584), "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithInteger:", v8));
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(a1 + 32)];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 584), "setObject:forKeyedSubscript:", v13, objc_msgSend(NSNumber, "numberWithInteger:", v12));
    int v14 = (void *)[*(id *)(a1 + 32) objectForKeyedSubscript:@"Client"];
    uint64_t v15 = [NSNumber numberWithInteger:v12];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 592), "setObject:forKeyedSubscript:", v15, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "hash")));
    return [*(id *)(a1 + 40) populateThermalFrameRateThresholdsForCaptureSourceID:v12 captureConfig:*(void *)(a1 + 32)];
  }
  else
  {

    *(void *)(*(void *)(a1 + 40) + 344) = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:*(void *)(a1 + 32)];
    int v10 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 344), "objectForKeyedSubscript:", @"FrameRate"), "intValue");
    *(_DWORD *)(*(void *)(a1 + 40) + 24) = v10;
    *(_DWORD *)(*(void *)(a1 + 40) + 20) = v10;
    uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 344), "objectForKeyedSubscript:", @"BiomeEventType"), "intValue");
    *(void *)(*(void *)(a1 + 40) + 352) = (int)result;
  }
  return result;
}

- (void)deregisterScreenVideoConfig:(id)a3 forSource:(int)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str[0] = 0;
    uint64_t v5 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    asprintf(__str, "Deregister screen config=%s", v5);
    if (__str[0])
    {
      __lasts = 0;
      uint64_t v6 = strtok_r(__str[0], "\n", &__lasts);
      uint64_t v7 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          uint64_t v9 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)&uint8_t buf[4] = v8;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = "-[VCVideoCaptureServer deregisterScreenVideoConfig:forSource:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)uint64_t v18 = 2404;
            *(_WORD *)&v18[4] = 2080;
            *(void *)&void v18[6] = "";
            __int16 v19 = 2080;
            __int16 v20 = v6;
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint64_t v6 = strtok_r(0, "\n", &__lasts);
      }
      while (v6);
      free(__str[0]);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(void *)uint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)uint64_t v18 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"CaptureSourceID"), "integerValue");
  int v10 = (void *)[a3 objectForKeyedSubscript:@"Client"];
  __str[0] = 0;
  __str[1] = (char *)__str;
  __str[2] = (char *)0x2020000000;
  uint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v15 = [v10 hash];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__VCVideoCaptureServer_deregisterScreenVideoConfig_forSource___block_invoke;
  block[3] = &unk_1E6DB7440;
  void block[4] = self;
  void block[5] = buf;
  void block[6] = __str;
  dispatch_async(captureClientQueue, block);
  _Block_object_dispose(__str, 8);
  _Block_object_dispose(buf, 8);
}

void __62__VCVideoCaptureServer_deregisterScreenVideoConfig_forSource___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(*(void *)(a1[5] + 8) + 24))
  {
    objc_msgSend(*(id *)(v2 + 584), "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithInteger:"));
    uint64_t v3 = *(void **)(a1[4] + 592);
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1[6] + 8) + 24)];
    [v3 setObject:0 forKeyedSubscript:v4];
  }
  else
  {

    *(void *)(a1[4] + 344) = 0;
    *(_DWORD *)(a1[4] + 24) = 0;
    *(_DWORD *)(a1[4] + 20) = 0;
  }
}

- (BOOL)registerSystemAudioConfig:(id)a3 forSource:(int)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VCVideoCaptureServer_registerSystemAudioConfig_forSource___block_invoke;
  block[3] = &unk_1E6DB6448;
  int v8 = a4;
  void block[4] = a3;
  void block[5] = self;
  void block[6] = &v9;
  dispatch_sync(captureClientQueue, block);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __60__VCVideoCaptureServer_registerSystemAudioConfig_forSource___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) objectForKeyedSubscript:@"SystemAudioCaptureClient"];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "hash"));
    long long v14 = 0u;
    memset(v13, 0, sizeof(v13));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"SystemAudioCaptureConfig"), "getValue:", v13);
    int v5 = v14;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)buf = 136316674;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCVideoCaptureServer registerSystemAudioConfig:forSource:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 2431;
        __int16 v21 = 2048;
        __int16 v22 = v3;
        __int16 v23 = 2112;
        uint64_t v24 = v4;
        __int16 v25 = 1024;
        int v26 = v8;
        __int16 v27 = 1024;
        BOOL v28 = v5 == 0;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d client=%p clientKey=%@ source=%d clientUsesScreenCaptureKit=%d", buf, 0x3Cu);
      }
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 616), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", *(void *)(a1 + 32)), v4);
    uint64_t v9 = *(void *)(a1 + 40);
    if (!*(unsigned char *)(v9 + 632) || v5)
    {
      uint64_t v11 = objc_msgSend(*(id *)(v9 + 624), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56)));
      if (v11)
      {
        [v11 addObject:v4];
      }
      else
      {
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", v4, 0);
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 624), "setObject:forKeyedSubscript:", v12, objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56)));
      }
      [*(id *)(a1 + 40) dispatchedUpdateSystemAudioConfigTapTypeForClientKey:v4 forSource:*(unsigned int *)(a1 + 56)];
      char v10 = [*(id *)(a1 + 40) dispatchedStartSystemAudioForClientKey:v4];
    }
    else
    {
      char v10 = [(id)v9 dispatchedAddScreenCaptureAudioOutputForConfig:*(void *)(a1 + 32)];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __60__VCVideoCaptureServer_registerSystemAudioConfig_forSource___block_invoke_cold_1();
    }
  }
}

- (BOOL)deregisterSystemAudioConfig:(id)a3 forSource:(int)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__VCVideoCaptureServer_deregisterSystemAudioConfig_forSource___block_invoke;
  block[3] = &unk_1E6DB6448;
  int v8 = a4;
  void block[4] = a3;
  void block[5] = self;
  void block[6] = &v9;
  dispatch_sync(captureClientQueue, block);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __62__VCVideoCaptureServer_deregisterSystemAudioConfig_forSource___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) objectForKeyedSubscript:@"SystemAudioCaptureClient"];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "hash"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *(_DWORD *)(a1 + 56);
        LODWORD(v11[0]) = 136316418;
        *(void *)((char *)v11 + 4) = v5;
        WORD6(v11[0]) = 2080;
        *(void *)((char *)v11 + 14) = "-[VCVideoCaptureServer deregisterSystemAudioConfig:forSource:]_block_invoke";
        WORD3(v11[1]) = 1024;
        DWORD2(v11[1]) = 2458;
        WORD6(v11[1]) = 2048;
        *(void *)((char *)&v11[1] + 14) = v3;
        WORD3(v11[2]) = 2112;
        *((void *)&v11[2] + 1) = v4;
        LOWORD(v12) = 1024;
        *(_DWORD *)((char *)&v12 + 2) = v7;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d client=%p clientKey=%@ source=%d", (uint8_t *)v11, 0x36u);
      }
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    memset(v11, 0, sizeof(v11));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"SystemAudioCaptureConfig", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), "getValue:", v11);
    uint64_t v8 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v8 + 632)) {
      BOOL v9 = v14 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      char v10 = [(id)v8 dispatchedRemoveScreenCaptureAudioOutput];
    }
    else
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v8 + 624), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56))), "removeObject:", v4);
      char v10 = [*(id *)(a1 + 40) dispatchedStopSystemAudioForClientKey:v4];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
    [*(id *)(*(void *)(a1 + 40) + 616) setObject:0 forKeyedSubscript:v4];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __62__VCVideoCaptureServer_deregisterSystemAudioConfig_forSource___block_invoke_cold_1();
    }
  }
}

- (void)dispatchedStartSystemAudioForSource:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_systemAudioSourceToClients, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v19 = v6;
      __int16 v20 = 2080;
      __int16 v21 = "-[VCVideoCaptureServer dispatchedStartSystemAudioForSource:]";
      __int16 v22 = 1024;
      int v23 = 2478;
      __int16 v24 = 2048;
      uint64_t v25 = [v5 count];
      __int16 v26 = 1024;
      int v27 = v3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d clients=%lu for source=%d", buf, 0x2Cu);
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        [(VCVideoCaptureServer *)self dispatchedUpdateSystemAudioConfigTapTypeForClientKey:v12 forSource:v3];
        [(VCVideoCaptureServer *)self dispatchedStartSystemAudioForClientKey:v12];
      }
      uint64_t v9 = [v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v9);
  }
}

- (void)dispatchedStopSystemAudioForSource:(int)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_systemAudioSourceToClients, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = v6;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCVideoCaptureServer dispatchedStopSystemAudioForSource:]";
      __int16 v21 = 1024;
      int v22 = 2487;
      __int16 v23 = 2048;
      uint64_t v24 = [v5 count];
      __int16 v25 = 1024;
      int v26 = a3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d clients=%lu for source=%d", buf, 0x2Cu);
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v5);
        }
        [(VCVideoCaptureServer *)self dispatchedStopSystemAudioForClientKey:*(void *)(*((void *)&v13 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v9);
  }
}

- (BOOL)dispatchedStartSystemAudioForClientKey:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v21 = v5;
      __int16 v22 = 2080;
      __int16 v23 = "-[VCVideoCaptureServer dispatchedStartSystemAudioForClientKey:]";
      __int16 v24 = 1024;
      int v25 = 2518;
      __int16 v26 = 2112;
      id v27 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d clientKey=%@", buf, 0x26u);
    }
  }
  if ([(NSMutableDictionary *)self->_systemAudioCapture objectForKeyedSubscript:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      long long v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v21 = v16;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCVideoCaptureServer dispatchedStartSystemAudioForClientKey:]";
        __int16 v24 = 1024;
        int v25 = 2522;
        __int16 v26 = 2112;
        id v27 = a3;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d System audio capture already started for clientKey=%@.", buf, 0x26u);
      }
    }
    goto LABEL_22;
  }
  if (![(NSMutableDictionary *)self->_systemAudioCaptureConfig objectForKeyedSubscript:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer dispatchedStartSystemAudioForClientKey:]();
      }
    }
    goto LABEL_22;
  }
  int v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_systemAudioCaptureConfig, "objectForKeyedSubscript:", a3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"SystemAudioCaptureConfig"), "getValue:", &v18);
  *((void *)&v19 + 1) = [v7 objectForKeyedSubscript:@"SystemAudioRemoteDeviceInfo"];
  uint64_t v8 = [[VCSystemAudioCapture alloc] initWithConfiguration:&v18];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer dispatchedStartSystemAudioForClientKey:]();
      }
    }
LABEL_22:
    uint64_t v9 = 0;
LABEL_23:
    BOOL v14 = 0;
    goto LABEL_12;
  }
  uint64_t v9 = v8;
  BOOL v10 = [(VCSystemAudioCapture *)v8 start];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v10)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer dispatchedStartSystemAudioForClientKey:]();
      }
    }
    goto LABEL_23;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    long long v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v21 = v12;
      __int16 v22 = 2080;
      __int16 v23 = "-[VCVideoCaptureServer dispatchedStartSystemAudioForClientKey:]";
      __int16 v24 = 1024;
      int v25 = 2542;
      __int16 v26 = 2112;
      id v27 = a3;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d System audio capture started for clientKey=%@.", buf, 0x26u);
    }
  }
  [(NSMutableDictionary *)self->_systemAudioCapture setObject:v9 forKeyedSubscript:a3];
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (BOOL)dispatchedStopSystemAudioForClientKey:(id)a3
{
  *(void *)&v21[13] = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v6 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315906;
      uint64_t v15 = v7;
      __int16 v16 = 2080;
      long long v17 = "-[VCVideoCaptureServer dispatchedStopSystemAudioForClientKey:]";
      __int16 v18 = 1024;
      int v19 = 2550;
      __int16 v20 = 2112;
      *(void *)uint64_t v21 = a3;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d clientKey=%@", (uint8_t *)&v14, 0x26u);
    }
  }
  uint64_t v9 = (void *)[(NSMutableDictionary *)self->_systemAudioCapture objectForKeyedSubscript:a3];
  if (v9)
  {
    int v10 = [v9 stop];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer dispatchedStopSystemAudioForClientKey:]();
      }
    }
    int v10 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136316162;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      long long v17 = "-[VCVideoCaptureServer dispatchedStopSystemAudioForClientKey:]";
      __int16 v18 = 1024;
      int v19 = 2563;
      __int16 v20 = 1024;
      *(_DWORD *)uint64_t v21 = v10;
      v21[2] = 2112;
      *(void *)&v21[3] = a3;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d System audio capture didStop=%d for clientKey=%@.", (uint8_t *)&v14, 0x2Cu);
    }
  }
  [(NSMutableDictionary *)self->_systemAudioCapture setObject:0 forKeyedSubscript:a3];
  return v10;
}

- (BOOL)dispatchedAddScreenCaptureAudioOutputForConfig:(id)a3
{
  return 0;
}

- (BOOL)dispatchedRemoveScreenCaptureAudioOutput
{
  return 0;
}

- (__CFDictionary)copyCameraColorInfo
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VCVideoCaptureServer_copyCameraColorInfo__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  void block[4] = self;
  void block[5] = &v6;
  dispatch_sync(captureServerQueue, block);
  uint64_t v3 = (__CFDictionary *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__VCVideoCaptureServer_copyCameraColorInfo__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 328);
  if (result)
  {
    uint64_t result = [(id)result copyColorInfo:*(void *)(*(void *)(a1 + 40) + 8) + 24];
    if ((result & 0x80000000) != 0) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  return result;
}

- (BOOL)registerForFrames:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t currentWidth = self->currentWidth;
  uint64_t currentHeight = self->currentHeight;
  unsigned int v10 = currentHeight;
  unsigned int v11 = currentWidth;
  uint64_t currentFrameRate = self->currentFrameRate;
  unsigned int v9 = currentFrameRate;
  if (!(currentHeight * currentWidth * currentFrameRate))
  {
    [(VCVideoCaptureServer *)self previewVideoWidth:&v11 height:&v10 frameRate:&v9];
    uint64_t currentHeight = v10;
    uint64_t currentWidth = v11;
    uint64_t currentFrameRate = v9;
  }
  return [(VCVideoCaptureServer *)self registerForVideoFramesFromSource:3 withClient:a3 width:currentWidth height:currentHeight frameRate:currentFrameRate];
}

- (BOOL)registerForVideoFramesFromSource:(int)a3 withClient:(id)a4 width:(int)a5 height:(int)a6 frameRate:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a3;
  v13[14] = *MEMORY[0x1E4F143B8];
  v13[0] = a4;
  v12[0] = @"Client";
  v12[1] = @"VideoWidth";
  v13[1] = [NSNumber numberWithInt:*(void *)&a5];
  void v12[2] = @"VideoHeight";
  v13[2] = [NSNumber numberWithInt:v8];
  v12[3] = @"FrameRate";
  v13[3] = [NSNumber numberWithInt:v7];
  v13[4] = &unk_1F3DC5AF0;
  v12[4] = @"ClientPid";
  void v12[5] = @"ScreenCaptureConfigurationDisplayMode";
  _OWORD v13[5] = &unk_1F3DC5AF0;
  v13[6] = MEMORY[0x1E4F1CC28];
  v12[6] = @"ShouldSendBlackFramesOnClearScreen";
  v12[7] = @"ResolutionScaling";
  v13[7] = &unk_1F3DC5B08;
  v13[8] = &unk_1F3DC5B20;
  v12[8] = @"PixelFormat";
  v12[9] = @"ScreenDisplayID";
  v13[9] = &unk_1F3DC5AF0;
  v13[10] = MEMORY[0x1E4F1CC28];
  v12[10] = @"EnableIdleFrameAdjustments";
  v12[11] = @"ScreenWatcherExempt";
  v13[11] = MEMORY[0x1E4F1CC28];
  v13[12] = MEMORY[0x1E4F1CC28];
  v12[12] = @"ShouldAllowReconfigureForLocalDisplay";
  v12[13] = @"ShouldOptimizeForLowLatency";
  v13[13] = MEMORY[0x1E4F1CC28];
  return -[VCVideoCaptureServer registerForVideoFramesFromSource:sourceConfig:](self, "registerForVideoFramesFromSource:sourceConfig:", v9, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:14]);
}

- (BOOL)setupScreenCaptureForSource:(int)a3 config:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_screenCapture)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 0;
    }
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    BOOL v7 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      screenCapture = self->_screenCapture;
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v5;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCVideoCaptureServer setupScreenCaptureForSource:config:]";
      __int16 v19 = 1024;
      int v20 = 2665;
      __int16 v21 = 2048;
      __int16 v22 = screenCapture;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d screenCapture=%p already created", buf, 0x26u);
      return 0;
    }
  }
  else
  {
    int v14 = VCVideoCaptureServer_OnCaptureVideoFrame;
    uint64_t v9 = [[VCScreenCapture alloc] initWithCaptureServer:self protocolFunctions:&v14 sourceConfig:a4];
    self->_screenCapture = (VCVideoSource *)v9;
    BOOL v7 = v9 != 0;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v9)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v16 = v11;
          __int16 v17 = 2080;
          __int16 v18 = "-[VCVideoCaptureServer setupScreenCaptureForSource:config:]";
          __int16 v19 = 1024;
          int v20 = 2686;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Setup screen capture source", buf, 0x1Cu);
        }
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer setupScreenCaptureForSource:config:]();
      }
    }
  }
  return v7;
}

- (void)dispatchedUpdateCaptureRuleForClient:(id)a3 width:(int)a4 height:(int)a5 frameRate:(float)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->captureClientQueue);
  if (a3)
  {
    uint64_t v11 = [VCVideoRule alloc];
    *(float *)&double v12 = a6;
    uint64_t v13 = [(VCVideoRule *)v11 initWithFrameWidth:v8 frameHeight:v7 frameRate:v12];
    if (v13)
    {
      id v14 = (id)v13;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cameraSinkVideoRules, "setObject:forKeyedSubscript:", v13, [NSNumber numberWithUnsignedLong:a3]);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer dispatchedUpdateCaptureRuleForClient:width:height:frameRate:]();
      }
    }
  }
}

- (void)updateCaptureRuleForClient:(id)a3 width:(int)a4 height:(int)a5 frameRate:(float)a6
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__VCVideoCaptureServer_updateCaptureRuleForClient_width_height_frameRate___block_invoke;
  block[3] = &unk_1E6DB7288;
  void block[4] = self;
  void block[5] = a3;
  int v8 = a4;
  int v9 = a5;
  float v10 = a6;
  dispatch_async(captureClientQueue, block);
}

uint64_t __74__VCVideoCaptureServer_updateCaptureRuleForClient_width_height_frameRate___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  return [*(id *)(a1 + 32) dispatchedUpdateCaptureRuleForClient:*(void *)(a1 + 40) width:*(unsigned int *)(a1 + 48) height:*(unsigned int *)(a1 + 52) frameRate:a2];
}

- (BOOL)registerForVideoFramesFromSource:(int)a3 sourceConfig:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return 0;
  }
  uint64_t v7 = [a4 objectForKeyedSubscript:@"Client"];
  if (!v7) {
    return 0;
  }
  int v8 = (const void *)v7;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __int16 v32 = 0;
    int v20 = v8;
    asprintf(&v32, "source=%d, client=%p, sourceConfig=%s", a3, v8, (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String"));
    if (v32)
    {
      __lasts = 0;
      int v9 = strtok_r(v32, "\n", &__lasts);
      float v10 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          double v12 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)&uint8_t buf[4] = v11;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = "-[VCVideoCaptureServer registerForVideoFramesFromSource:sourceConfig:]";
            *(_WORD *)&buf[22] = 1024;
            int v38 = 2724;
            __int16 v39 = 2080;
            __int16 v40 = "";
            __int16 v41 = 2080;
            __int16 v42 = v9;
            _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        int v9 = strtok_r(0, "\n", &__lasts);
      }
      while (v9);
      free(v32);
    }
    int v8 = v20;
  }
  uint64_t v36 = v8;
  -[VCVideoCaptureServer notifyThermalChangeForClients:](self, "notifyThermalChangeForClients:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1]);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v38) = 0;
  if (a3 == 3)
  {
    [(VCVideoCaptureServer *)self deregisterForVideoFramesFromSource:1 withClient:v8];
    __int16 v32 = 0;
    int v33 = &v32;
    uint64_t v34 = 0x2020000000;
    int v35 = -1431655766;
    int v35 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"VideoWidth"), "intValue");
    __lasts = 0;
    p_lasts = &__lasts;
    uint64_t v30 = 0x2020000000;
    int v31 = -1431655766;
    int v31 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"VideoHeight"), "intValue");
    uint64_t v24 = 0;
    int v25 = &v24;
    uint64_t v26 = 0x2020000000;
    int v27 = -1431655766;
    int v27 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"FrameRate"), "intValue");
    int currentWidth = *((_DWORD *)v33 + 6);
    if (!currentWidth) {
      int currentWidth = self->currentWidth;
    }
    *((_DWORD *)v33 + 6) = currentWidth;
    int currentHeight = *((_DWORD *)p_lasts + 6);
    if (!currentHeight) {
      int currentHeight = self->currentHeight;
    }
    *((_DWORD *)p_lasts + 6) = currentHeight;
    int currentFrameRate = *((_DWORD *)v25 + 6);
    if (!currentFrameRate) {
      int currentFrameRate = self->currentFrameRate;
    }
    *((_DWORD *)v25 + 6) = currentFrameRate;
    captureClientQueue = self->captureClientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__VCVideoCaptureServer_registerForVideoFramesFromSource_sourceConfig___block_invoke;
    block[3] = &unk_1E6DB8B80;
    void block[4] = self;
    void block[5] = v8;
    void block[6] = &v32;
    void block[7] = &__lasts;
    block[8] = &v24;
    block[9] = buf;
    dispatch_sync(captureClientQueue, block);
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&__lasts, 8);
    _Block_object_dispose(&v32, 8);
  }
  else if ((a3 - 1) > 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer registerForVideoFramesFromSource:sourceConfig:]();
      }
    }
  }
  else
  {
    [(VCVideoCaptureServer *)self deregisterForVideoFramesFromSource:3 withClient:v8];
    __int16 v18 = self->captureClientQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __70__VCVideoCaptureServer_registerForVideoFramesFromSource_sourceConfig___block_invoke_2;
    v21[3] = &unk_1E6DB8BA8;
    v21[4] = self;
    void v21[5] = v8;
    int v22 = a3;
    v21[6] = a4;
    v21[7] = buf;
    dispatch_sync(v18, v21);
  }
  BOOL v17 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
  return v17;
}

uint64_t __70__VCVideoCaptureServer_registerForVideoFramesFromSource_sourceConfig___block_invoke(uint64_t a1, double a2)
{
  *(float *)&a2 = (float)*(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  [*(id *)(a1 + 32) dispatchedUpdateCaptureRuleForClient:*(void *)(a1 + 40) width:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) height:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) frameRate:a2];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 120) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 120) addObject:*(void *)(a1 + 40)];
    uint64_t result = [*(id *)(a1 + 32) startCaptureWithWidth:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) height:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) frameRate:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __70__VCVideoCaptureServer_registerForVideoFramesFromSource_sourceConfig___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 128) count];
  if (([*(id *)(*(void *)(a1 + 32) + 128) containsObject:*(void *)(a1 + 40)] & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 128) addObject:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) setupScreenCaptureForSource:*(unsigned int *)(a1 + 64) config:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v2 && !*(unsigned char *)(v3 + 455))
  {
    dispatch_resume(*(dispatch_object_t *)(v3 + 64));
    uint64_t v3 = *(void *)(a1 + 32);
  }
  uint64_t result = [*(id *)(v3 + 336) startPreview];
  if ((result & 0x80000000) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v18 = v5;
        __int16 v19 = 2080;
        int v20 = "-[VCVideoCaptureServer registerForVideoFramesFromSource:sourceConfig:]_block_invoke_2";
        __int16 v21 = 1024;
        int v22 = 2767;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Started screen capture source", buf, 0x1Cu);
      }
    }
    int v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"FrameRate"), "intValue");
    *(_DWORD *)(*(void *)(a1 + 32) + 24) = v7;
    *(_DWORD *)(*(void *)(a1 + 32) + 20) = v7;
    *(void *)(*(void *)(a1 + 32) + 352) = (int)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"BiomeEventType"), "intValue");
    [*(id *)(a1 + 32) sendBiomeEventIsStarting:1];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v8 = *(void **)(*(void *)(a1 + 32) + 128);
    uint64_t result = [v8 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (result)
    {
      uint64_t v9 = result;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11++), "sourceFrameRateDidChange:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"FrameRate"), "intValue"));
        }
        while (v9 != v11);
        uint64_t result = [v8 countByEnumeratingWithState:&v13 objects:v12 count:16];
        uint64_t v9 = result;
      }
      while (result);
    }
  }
  return result;
}

- (BOOL)deregisterForVideoFramesFromSource:(int)a3 withClient:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      int v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v14 = v7;
        __int16 v15 = 2080;
        long long v16 = "-[VCVideoCaptureServer deregisterForVideoFramesFromSource:withClient:]";
        __int16 v17 = 1024;
        int v18 = 2790;
        __int16 v19 = 1024;
        int v20 = a3;
        __int16 v21 = 2048;
        id v22 = a4;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d source=%d, client=%p", buf, 0x2Cu);
      }
    }
    captureClientQueue = self->captureClientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__VCVideoCaptureServer_deregisterForVideoFramesFromSource_withClient___block_invoke;
    block[3] = &unk_1E6DB3EE0;
    int v12 = a3;
    void block[4] = self;
    void block[5] = a4;
    dispatch_async(captureClientQueue, block);
  }
  return a4 != 0;
}

void __70__VCVideoCaptureServer_deregisterForVideoFramesFromSource_withClient___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 48) - 1;
  if (v1 >= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __70__VCVideoCaptureServer_deregisterForVideoFramesFromSource_withClient___block_invoke_cold_1();
      }
    }
  }
  else
  {
    uint64_t v3 = qword_1E25A1E70[v1];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + v3);
    if (v5 && [*(id *)(v4 + v3) containsObject:*(void *)(a1 + 40)])
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithUnsignedLong:", *(void *)(a1 + 40)));
      [v5 removeObject:*(void *)(a1 + 40)];
      int v6 = *(_DWORD *)(a1 + 48);
      if ((v6 - 1) >= 2)
      {
        if (v6 == 3 && ![*(id *)(*(void *)(a1 + 32) + 120) count])
        {
          uint64_t v10 = *(void **)(a1 + 32);
          [v10 stopCapture];
        }
      }
      else if (![*(id *)(*(void *)(a1 + 32) + 128) count])
      {
        uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 336);
        if (v7)
        {
          [v7 stop:1];

          *(void *)(*(void *)(a1 + 32) + 336) = 0;
          *(_DWORD *)(*(void *)(a1 + 32) + 24) = 0;
          *(_DWORD *)(*(void *)(a1 + 32) + 20) = 0;
          uint64_t v8 = *(void *)(a1 + 32);
          if (!*(unsigned char *)(v8 + 455))
          {
            dispatch_suspend(*(dispatch_object_t *)(v8 + 64));
            uint64_t v8 = *(void *)(a1 + 32);
          }
          if (*(void *)(v8 + 384))
          {
            char v9 = objc_opt_respondsToSelector();
            uint64_t v8 = *(void *)(a1 + 32);
            if (v9)
            {
              [*(id *)(v8 + 384) didStopCapture];
              uint64_t v8 = *(void *)(a1 + 32);
            }
          }
          [(id)v8 sendBiomeEventIsStarting:0];
        }
      }
    }
  }
}

- (BOOL)isClientRegisteredForVideoFrames:(id)a3 fromSource:(int)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VCVideoCaptureServer_isClientRegisteredForVideoFrames_fromSource___block_invoke;
  block[3] = &unk_1E6DB8BD0;
  int v8 = a4;
  void block[5] = a3;
  void block[6] = &v9;
  void block[4] = self;
  dispatch_sync(captureClientQueue, block);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __68__VCVideoCaptureServer_isClientRegisteredForVideoFrames_fromSource___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  if ((v2 - 1) < 2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 128);
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 containsObject:v3];
    return;
  }
  if (v2 == 3)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 120);
    goto LABEL_5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __68__VCVideoCaptureServer_isClientRegisteredForVideoFrames_fromSource___block_invoke_cold_1();
    }
  }
}

- (void)setCaptureFrameRate:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VCVideoCaptureServer_setCaptureFrameRate___block_invoke;
  block[3] = &unk_1E6DB3F08;
  void block[4] = self;
  int v5 = a3;
  dispatch_async(captureServerQueue, block);
}

uint64_t __44__VCVideoCaptureServer_setCaptureFrameRate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetCaptureFrameRate:*(unsigned int *)(a1 + 40)];
}

- (void)setScreenCaptureFrameRate:(int)a3
{
}

- (void)setScreenCaptureFrameRate:(int)a3 captureSourceID:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  captureClientQueue = self->captureClientQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __66__VCVideoCaptureServer_setScreenCaptureFrameRate_captureSourceID___block_invoke;
  v5[3] = &unk_1E6DB3EE0;
  v5[4] = a4;
  void v5[5] = self;
  int v6 = a3;
  dispatch_async(captureClientQueue, v5);
}

void __66__VCVideoCaptureServer_setScreenCaptureFrameRate_captureSourceID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = objc_msgSend(*(id *)(v2 + 576), "objectForKeyedSubscript:");
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void **)(v2 + 336);
    if (v3)
    {
LABEL_3:
      if (([v3 setFrameRate:*(unsigned int *)(a1 + 48)] & 0x80000000) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __66__VCVideoCaptureServer_setScreenCaptureFrameRate_captureSourceID___block_invoke_cold_2();
          }
        }
      }
      else
      {
        uint64_t v4 = *(void *)(a1 + 40);
        if (v3 == *(void **)(v4 + 336))
        {
          *(_DWORD *)(v4 + 24) = *(_DWORD *)(a1 + 48);
        }
        else
        {
          uint64_t v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
          int v6 = (void *)[*(id *)(*(void *)(a1 + 40) + 584) objectForKeyedSubscript:*(void *)(a1 + 32)];
          [v6 setObject:v5 forKeyedSubscript:@"CurrentFrameRate"];
        }
      }
      return;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __66__VCVideoCaptureServer_setScreenCaptureFrameRate_captureSourceID___block_invoke_cold_1();
    }
  }
}

- (int)getCaptureFrameRateForSource:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  captureServerQueue = self->captureServerQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__VCVideoCaptureServer_getCaptureFrameRateForSource___block_invoke;
  v6[3] = &unk_1E6DB6470;
  int v7 = a3;
  v6[4] = self;
  void v6[5] = &v8;
  dispatch_sync(captureServerQueue, v6);
  int v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __53__VCVideoCaptureServer_getCaptureFrameRateForSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(_DWORD *)(a1 + 48) - 1) > 1)
  {
    int v4 = objc_msgSend(*(id *)(v2 + 552), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"));
    if (v4) {
      uint64_t result = [v4 frameRate];
    }
    else {
      uint64_t result = *(unsigned int *)(*(void *)(a1 + 32) + 16);
    }
  }
  else
  {
    uint64_t result = [*(id *)(v2 + 336) getFrameRate];
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setViewPointCorrectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BoolValueForKedouble y = VCDefaults_GetBoolValueForKey(@"disableViewPointCorrectionForSharing", +[VCHardwareSettings disableViewPointCorrectionForSharing]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      int v11 = "-[VCVideoCaptureServer setViewPointCorrectionEnabled:]";
      __int16 v12 = 1024;
      int v13 = 2924;
      __int16 v14 = 1024;
      BOOL v15 = v3;
      __int16 v16 = 1024;
      BOOL v17 = BoolValueForKey;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d enabled=%d, shouldUpdateViewPointCorrection=%d", (uint8_t *)&v8, 0x28u);
    }
  }
  if (BoolValueForKey && self->_viewPointCorrectionEnabledByClient != v3)
  {
    self->_viewPointCorrectionEnabledByClient = v3;
    [(VCVideoCaptureServer *)self updateViewPointCorrectionStatus];
  }
}

- (void)updateViewPointCorrectionStatus
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  captureServerQueue = self->captureServerQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__VCVideoCaptureServer_updateViewPointCorrectionStatus__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(captureServerQueue, v3);
}

uint64_t __55__VCVideoCaptureServer_updateViewPointCorrectionStatus__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 453)) {
    BOOL v3 = *(unsigned char *)(v2 + 452) != 0;
  }
  else {
    BOOL v3 = 0;
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 328);
    return [v5 setViewPointCorrectionEnabled:v3];
  }
  return result;
}

- (BOOL)isFaceTimeScreenSharingWithDict:(id)a3
{
  uint64_t v5 = [a3 objectForKeyedSubscript:@"ScreenCaptureUUID"];
  if (v5) {
    BOOL v6 = v5 != [MEMORY[0x1E4F1CA98] null];
  }
  else {
    BOOL v6 = 0;
  }
  if (+[VCHardwareSettings deviceClass] == 8
    && v5 == [MEMORY[0x1E4F1CA98] null])
  {
    uint64_t v8 = [a3 objectForKeyedSubscript:@"CaptureSourceID"];
    return self->_screenShareCaptureConfig
        && (!v8
         || [(NSMutableDictionary *)self->_screenCaptureConfig objectForKeyedSubscript:v8] == 0);
  }
  return v6;
}

- (BOOL)setUpScreenVideoCaptureSource:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = -[VCVideoCaptureServer isFaceTimeScreenSharingWithDict:](self, "isFaceTimeScreenSharingWithDict:");
  uint64_t v6 = [a3 objectForKeyedSubscript:@"CaptureSourceID"];
  if (!v5)
  {
    int v7 = (NSMutableDictionary *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_screenCaptureConfig, "objectForKeyedSubscript:", v6), "mutableCopy");
    p_screenCapture = &self->_screenCapture;
    if (!self->_screenCapture) {
      goto LABEL_8;
    }
LABEL_28:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer setUpScreenVideoCaptureSource:].cold.4();
      }
    }
    goto LABEL_38;
  }
  int v7 = self->_screenShareCaptureConfig;
  p_screenCapture = &self->_screenCapture;
  if (self->_screenCapture) {
    goto LABEL_28;
  }
  if ([(NSMutableDictionary *)self->_screenCaptureSource count])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer setUpScreenVideoCaptureSource:]();
      }
    }
LABEL_38:
    uint64_t v18 = 0;
    BOOL v21 = 0;
    goto LABEL_27;
  }
LABEL_8:
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer setUpScreenVideoCaptureSource:]();
      }
    }
    int v7 = 0;
    goto LABEL_38;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:@"ScreenCaptureIsWindowed"], @"ScreenCaptureIsWindowed");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:@"ScreenCaptureUUID"], @"ScreenCaptureUUID");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:@"ScreenDisplayID"], @"ScreenDisplayID");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:@"IsCursorCapturedForScreen"], @"IsCursorCapturedForScreen");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:@"CaptureExcludedBundleIDs"], @"CaptureExcludedBundleIDs");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:@"HasPrivateCaptureEntitlement"], @"HasPrivateCaptureEntitlement");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:@"ScreenVirtualDisplayLabel"], @"ScreenVirtualDisplayLabel");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:@"ScreenCaptureConfigurationDisplayMode"], @"ScreenCaptureConfigurationDisplayMode");
  if ([a3 objectForKeyedSubscript:@"ClientBundleID"]) {
    uint64_t v9 = [a3 objectForKeyedSubscript:@"ClientBundleID"];
  }
  else {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  [(NSMutableDictionary *)v7 setObject:v9 forKeyedSubscript:@"ClientBundleID"];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:@"AuditTokenData"], @"AuditTokenData");
  if (v5)
  {
    uint64_t screenConfiguredFrameRate = self->_screenConfiguredFrameRate;
    if (!self->_forceDisableThermal)
    {
      int v11 = [(VCVideoCaptureServer *)self getScreenFrameRateForThermalLevel:self->_thermalLevel];
      if ((int)screenConfiguredFrameRate >= v11) {
        uint64_t screenConfiguredFrameRate = v11;
      }
      else {
        uint64_t screenConfiguredFrameRate = screenConfiguredFrameRate;
      }
    }
    self->_uint64_t screenCurrentFrameRate = screenConfiguredFrameRate;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_screenShareCaptureConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:screenConfiguredFrameRate], @"FrameRate");
    screenCaptureClients = self->screenCaptureClients;
    uint64_t screenCurrentFrameRate = self->_screenCurrentFrameRate;
    __int16 v14 = self;
  }
  else
  {
    uint64_t v15 = -[VCVideoCaptureServer screenFrameRateForThermalLevel:configuredFrameRate:captureSourceID:](self, "screenFrameRateForThermalLevel:configuredFrameRate:captureSourceID:", self->_thermalLevel, objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", @"FrameRate"), "intValue"), v6);
    uint64_t v16 = [NSNumber numberWithInt:v15];
    objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_screenCaptureConfig, "objectForKeyedSubscript:", v6), "setObject:forKeyedSubscript:", v16, @"CurrentFrameRate");
    [(NSMutableDictionary *)v7 setObject:v16 forKeyedSubscript:@"CurrentFrameRate"];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v15], @"FrameRate");
    v30[0] = [(NSMutableDictionary *)v7 objectForKeyedSubscript:@"Client"];
    screenCaptureClients = (NSMutableArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    __int16 v14 = self;
    uint64_t screenCurrentFrameRate = v15;
  }
  [(VCVideoCaptureServer *)v14 notifyFrameRateBeingThrottledForClients:screenCaptureClients newFrameRate:screenCurrentFrameRate thermalLevelDidChange:0 powerLevelDidChange:0];
  uint64_t v23 = VCVideoCaptureServer_OnCaptureVideoFrame;
  BOOL v17 = [[VCScreenCapture alloc] initWithCaptureServer:self protocolFunctions:&v23 sourceConfig:v7];
  if (!v17)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer setUpScreenVideoCaptureSource:]();
      }
    }
    goto LABEL_38;
  }
  uint64_t v18 = v17;
  if (v5)
  {
    *p_screenCapture = (VCVideoSource *)v17;
  }
  else
  {
    [(VCVideoCapture *)v17 addSink:[(NSMutableDictionary *)v7 objectForKeyedSubscript:@"Client"]];
    [(NSMutableDictionary *)self->_screenCaptureSource setObject:v18 forKeyedSubscript:v6];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    int v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = v19;
      __int16 v26 = 2080;
      int v27 = "-[VCVideoCaptureServer setUpScreenVideoCaptureSource:]";
      __int16 v28 = 1024;
      int v29 = 3034;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Setup screen capture source", buf, 0x1Cu);
    }
  }
  BOOL v21 = 1;
LABEL_27:

  return v21;
}

- (BOOL)startScreenShareCapture:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  captureClientQueue = self->captureClientQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__VCVideoCaptureServer_startScreenShareCapture___block_invoke;
  v6[3] = &unk_1E6DB6928;
  v6[4] = a3;
  void v6[5] = self;
  void v6[6] = &v7;
  dispatch_sync(captureClientQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __48__VCVideoCaptureServer_startScreenShareCapture___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    uint64_t v2 = *(void **)(a1 + 32);
    BOOL v3 = v2 ? (const char *)objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "Starting Screen Capture with screenShareDict=%s", v3);
    if (__str)
    {
      __lasts = 0;
      char v4 = strtok_r(__str, "\n", &__lasts);
      BOOL v5 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          uint64_t v7 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v18 = v6;
            __int16 v19 = 2080;
            int v20 = "-[VCVideoCaptureServer startScreenShareCapture:]_block_invoke";
            __int16 v21 = 1024;
            int v22 = 3046;
            __int16 v23 = 2080;
            uint64_t v24 = "";
            __int16 v25 = 2080;
            __int16 v26 = v4;
            _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        char v4 = strtok_r(0, "\n", &__lasts);
      }
      while (v4);
      free(__str);
    }
  }
  int v8 = [*(id *)(a1 + 40) isFaceTimeScreenSharingWithDict:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(a1 + 40) + 455) = v8;
  if ([*(id *)(a1 + 40) setUpScreenVideoCaptureSource:*(void *)(a1 + 32)])
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v8) {
      char v10 = *(void **)(v9 + 336);
    }
    else {
      char v10 = objc_msgSend(*(id *)(v9 + 576), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"CaptureSourceID"));
    }
    if (v10)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (int)[v10 startScreenCapture] >= 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        __int16 v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v18 = v11;
          __int16 v19 = 2080;
          int v20 = "-[VCVideoCaptureServer startScreenShareCapture:]_block_invoke";
          __int16 v21 = 1024;
          int v22 = 3060;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Start screen capture", buf, 0x1Cu);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCVideoCaptureServer_startScreenShareCapture___block_invoke_cold_1();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __48__VCVideoCaptureServer_startScreenShareCapture___block_invoke_cold_2();
    }
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    int v14 = v8;
  }
  else {
    int v14 = 0;
  }
  if (v14 == 1)
  {
    dispatch_resume(*(dispatch_object_t *)(v13 + 64));
    [*(id *)(a1 + 40) sendBiomeEventIsStarting:1];
  }
  else
  {
    *(unsigned char *)(v13 + 455) = 0;
  }
}

- (BOOL)stopScreenShareCapture:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  captureClientQueue = self->captureClientQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__VCVideoCaptureServer_stopScreenShareCapture___block_invoke;
  v6[3] = &unk_1E6DB7008;
  void v6[5] = &v7;
  void v6[6] = a3;
  v6[4] = self;
  dispatch_sync(captureClientQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __47__VCVideoCaptureServer_stopScreenShareCapture___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 576), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 48)));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    char v4 = objc_msgSend(*(id *)(v3 + 576), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 48)));
    if (v4)
    {
LABEL_3:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (int)[v4 stopScreenCapture] >= 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          int v9 = 136315906;
          uint64_t v10 = v5;
          __int16 v11 = 2080;
          __int16 v12 = "-[VCVideoCaptureServer stopScreenShareCapture:]_block_invoke";
          __int16 v13 = 1024;
          int v14 = 3087;
          __int16 v15 = 1024;
          int v16 = v7;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d didStop=%d", (uint8_t *)&v9, 0x22u);
        }
      }
      goto LABEL_6;
    }
  }
  else
  {
    char v4 = *(void **)(v3 + 336);
    if (v4) {
      goto LABEL_3;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __47__VCVideoCaptureServer_stopScreenShareCapture___block_invoke_cold_1();
    }
  }
LABEL_6:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v2)
    {
      objc_msgSend(*(id *)(v8 + 576), "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 48)));
    }
    else
    {
      *(unsigned char *)(v8 + 455) = 0;
      dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 64));
      [*(id *)(a1 + 32) sendBiomeEventIsStarting:0];

      *(void *)(*(void *)(a1 + 32) + 336) = 0;
    }
  }
}

- (id)updateScreenCapture:(int64_t)a3 withConfig:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__VCVideoCaptureServer_updateScreenCapture_withConfig___block_invoke;
  block[3] = &unk_1E6DB85F0;
  void block[4] = a4;
  void block[5] = self;
  void block[6] = &v8;
  void block[7] = a3;
  dispatch_sync(captureClientQueue, block);
  uint64_t v5 = 0;
  if ((v9[3] & 0x80000000) != 0) {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"GKVoiceChatServiceErrorDomain");
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __55__VCVideoCaptureServer_updateScreenCapture_withConfig___block_invoke(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    uint64_t v2 = (void *)a1[4];
    uint64_t v3 = v2 ? (const char *)objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "Updating Screen Capture with screenShareDict=%s", v3);
    if (__str)
    {
      __lasts = 0;
      char v4 = strtok_r(__str, "\n", &__lasts);
      uint64_t v5 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          int v7 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v13 = v6;
            __int16 v14 = 2080;
            __int16 v15 = "-[VCVideoCaptureServer updateScreenCapture:withConfig:]_block_invoke";
            __int16 v16 = 1024;
            int v17 = 3116;
            __int16 v18 = 2080;
            __int16 v19 = "";
            __int16 v20 = 2080;
            __int16 v21 = v4;
            _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        char v4 = strtok_r(0, "\n", &__lasts);
      }
      while (v4);
      free(__str);
    }
  }
  if (objc_msgSend(*(id *)(a1[5] + 576), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a1[7])))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __55__VCVideoCaptureServer_updateScreenCapture_withConfig___block_invoke_cold_2();
      }
    }
  }
  else
  {
    uint64_t v8 = a1[5];
    int v9 = *(void **)(v8 + 344);
    if (v9)
    {
      [*(id *)(v8 + 344) addEntriesFromDictionary:a1[4]];
      [v9 removeObjectForKey:@"CaptureSourceID"];
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[5] + 336) updateScreenCapture:v9];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __55__VCVideoCaptureServer_updateScreenCapture_withConfig___block_invoke_cold_1();
      }
    }
  }
}

- (void)sendBiomeEventIsStarting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50438]) initWithIsStart:v3 type:self->_biomeEventType];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = @"stop";
      unint64_t biomeEventType = self->_biomeEventType;
      *(_DWORD *)int v11 = 136316162;
      *(void *)&v11[4] = v7;
      *(_WORD *)&v11[12] = 2080;
      if (v3) {
        int v9 = @"start";
      }
      *(void *)&v11[14] = "-[VCVideoCaptureServer sendBiomeEventIsStarting:]";
      __int16 v12 = 1024;
      int v13 = 3142;
      __int16 v14 = 2112;
      __int16 v15 = v9;
      __int16 v16 = 2048;
      unint64_t v17 = biomeEventType;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Sending Biome event for screen %@ of type=%lu", v11, 0x30u);
    }
  }
  objc_msgSend((id)objc_msgSend(v5, "source", *(_OWORD *)v11), "sendEvent:", v6);
}

- (BOOL)isValidStreamInput:(id)a3
{
  unsigned int v3 = objc_msgSend((id)objc_msgSend(a3, "streamInputID"), "unsignedIntValue");
  return v3 > 9 || (v3 & 0x3FF) == 6;
}

- (BOOL)setupStreamInputs
{
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  char v4 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.streamInput", 0, CustomRootQueue);
  self->_streamInputQueue = v4;
  if (v4)
  {
    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_streamInputs = v5;
    if (v5)
    {
      uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_streamInputCaptureSources = v6;
      if (v6) {
        return 1;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoCaptureServer setupStreamInputs]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoCaptureServer setupStreamInputs]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoCaptureServer setupStreamInputs]();
    }
  }
  [(VCVideoCaptureServer *)self cleanupStreamInputs];
  return 0;
}

- (void)cleanupStreamInputs
{
  self->_streamInputs = 0;
  self->_streamInputCaptureSources = 0;
  streamInputQueue = self->_streamInputQueue;
  if (streamInputQueue)
  {
    dispatch_release(streamInputQueue);
    self->_streamInputQueue = 0;
  }
}

- (void)registerVideoSink:(id)a3 withCaptureSource:(int)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  streamInputQueue = self->_streamInputQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __60__VCVideoCaptureServer_registerVideoSink_withCaptureSource___block_invoke;
  v5[3] = &unk_1E6DB3EE0;
  int v6 = a4;
  v5[4] = self;
  void v5[5] = a3;
  dispatch_sync(streamInputQueue, v5);
}

void __60__VCVideoCaptureServer_registerVideoSink_withCaptureSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 552), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 addSink:v3];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __60__VCVideoCaptureServer_registerVideoSink_withCaptureSource___block_invoke_cold_1();
    }
  }
}

- (void)unregisterVideoSink:(id)a3 withCaptureSource:(int)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  streamInputQueue = self->_streamInputQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __62__VCVideoCaptureServer_unregisterVideoSink_withCaptureSource___block_invoke;
  v5[3] = &unk_1E6DB3EE0;
  int v6 = a4;
  v5[4] = self;
  void v5[5] = a3;
  dispatch_sync(streamInputQueue, v5);
}

void __62__VCVideoCaptureServer_unregisterVideoSink_withCaptureSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 552), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 removeSink:v3];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __62__VCVideoCaptureServer_unregisterVideoSink_withCaptureSource___block_invoke_cold_1();
    }
  }
}

- (void)suspendVideoSink:(id)a3 withCaptureSource:(int)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  streamInputQueue = self->_streamInputQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __59__VCVideoCaptureServer_suspendVideoSink_withCaptureSource___block_invoke;
  v5[3] = &unk_1E6DB3EE0;
  int v6 = a4;
  v5[4] = self;
  void v5[5] = a3;
  dispatch_async(streamInputQueue, v5);
}

void __59__VCVideoCaptureServer_suspendVideoSink_withCaptureSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 552), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 didSuspendVideoSink:v3];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __59__VCVideoCaptureServer_suspendVideoSink_withCaptureSource___block_invoke_cold_1();
    }
  }
}

- (void)resumeVideoSink:(id)a3 withCaptureSource:(int)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  streamInputQueue = self->_streamInputQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __58__VCVideoCaptureServer_resumeVideoSink_withCaptureSource___block_invoke;
  v5[3] = &unk_1E6DB3EE0;
  int v6 = a4;
  v5[4] = self;
  void v5[5] = a3;
  dispatch_async(streamInputQueue, v5);
}

void __58__VCVideoCaptureServer_resumeVideoSink_withCaptureSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 552), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 didResumeVideoSink:v3];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __58__VCVideoCaptureServer_resumeVideoSink_withCaptureSource___block_invoke_cold_1();
    }
  }
}

- (opaqueCMFormatDescription)newFormatDescriptionForCaptureSource:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  streamInputQueue = self->_streamInputQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__VCVideoCaptureServer_newFormatDescriptionForCaptureSource___block_invoke;
  block[3] = &unk_1E6DB6790;
  int v12 = a3;
  void block[4] = self;
  void block[5] = &v13;
  dispatch_sync(streamInputQueue, block);
  int v6 = (opaqueCMFormatDescription *)v14[3];
  if (!v6)
  {
    captureServerQueue = self->captureServerQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__VCVideoCaptureServer_newFormatDescriptionForCaptureSource___block_invoke_2;
    void v9[3] = &unk_1E6DB8BF8;
    int v10 = a3;
    v9[4] = &v13;
    dispatch_sync(captureServerQueue, v9);
    int v6 = (opaqueCMFormatDescription *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  return v6;
}

void *__61__VCVideoCaptureServer_newFormatDescriptionForCaptureSource___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 552), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [result formatDescription];
    uint64_t result = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (result)
    {
      return (void *)CFRetain(result);
    }
  }
  return result;
}

uint64_t __61__VCVideoCaptureServer_newFormatDescriptionForCaptureSource___block_invoke_2(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 40);
  if ((v1 - 1) < 2) {
    return CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x76696465u, 0x34323066u, 0, (CMFormatDescriptionRef *)(*(void *)(*(void *)(result + 32) + 8) + 24));
  }
  if (v1 == 3) {
    return CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x34323076u, 0, 0, 0, (CMVideoFormatDescriptionRef *)(*(void *)(*(void *)(result + 32) + 8) + 24));
  }
  return result;
}

- (int)findNextAvailableCaptureSourceID
{
  LODWORD(v3) = 9;
  do
    uint64_t v3 = (v3 + 1);
  while (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputCaptureSources, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]));
  return v3;
}

- (int64_t)streamInputIDForCaptureSourceID:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  streamInputQueue = self->_streamInputQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__VCVideoCaptureServer_streamInputIDForCaptureSourceID___block_invoke;
  v6[3] = &unk_1E6DB6790;
  int v7 = a3;
  v6[4] = self;
  void v6[5] = &v8;
  dispatch_sync(streamInputQueue, v6);
  int64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __56__VCVideoCaptureServer_streamInputIDForCaptureSourceID___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 552), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))), "streamInputID");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)registerStreamInputCaptureSourceWithID:(int64_t)a3 frameRate:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = [+[VCStreamInputManager sharedInstance] streamInputWithID:a3];
  if (v7)
  {
    uint64_t v8 = [v7 streamFormat];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3), @"streamInputID");
    [v9 setObject:v8 forKeyedSubscript:@"formatDescription"];
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v4), @"framerate");
    int v10 = [(VCVideoCaptureServer *)self registerStreamInputCaptureSourceWithConfiguration:v9];

    LODWORD(v7) = v10;
  }
  return (int)v7;
}

- (int)registerStreamInputCaptureSourceWithConfiguration:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  streamInputQueue = self->_streamInputQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke;
  v6[3] = &unk_1E6DB6928;
  v6[4] = self;
  void v6[5] = a3;
  void v6[6] = &v7;
  dispatch_sync(streamInputQueue, v6);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) findNextAvailableCaptureSourceID];
  uint64_t v3 = [NSNumber numberWithUnsignedInt:v2];
  if ([*(id *)(*(void *)(a1 + 32) + 552) objectForKeyedSubscript:v3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_4();
      }
    }
    goto LABEL_26;
  }
  int v4 = [[VCStreamInputCaptureSource alloc] initWithCaptureSourceID:v2 configuration:*(void *)(a1 + 40)];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_1();
      }
    }
LABEL_26:
    uint64_t v5 = 0;
    goto LABEL_16;
  }
  uint64_t v5 = v4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 552) allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v11 streamInputID];
        if (v12 == [(VCStreamInputCaptureSource *)v5 streamInputID]
          && !CMFormatDescriptionEqual((CMFormatDescriptionRef)[v11 formatDescription], -[VCStreamInputCaptureSource formatDescription](v5, "formatDescription")))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_3();
            }
          }
          goto LABEL_16;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 560), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", -[VCStreamInputCaptureSource streamInputID](v5, "streamInputID")));
  if (!v13) {
    goto LABEL_15;
  }
  __int16 v14 = v13;
  if (objc_msgSend(v13, "isEqualFormat:", -[VCStreamInputCaptureSource formatDescription](v5, "formatDescription")))
  {
    [v14 addSink:v5];
    [(VCStreamInputCaptureSource *)v5 setDelegate:v14];
LABEL_15:
    [*(id *)(*(void *)(a1 + 32) + 552) setObject:v5 forKeyedSubscript:v3];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
    goto LABEL_16;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_2();
    }
  }
LABEL_16:
}

- (BOOL)unregisterStreamInputCaptureSourceWithCaptureSourceID:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  streamInputQueue = self->_streamInputQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__VCVideoCaptureServer_unregisterStreamInputCaptureSourceWithCaptureSourceID___block_invoke;
  v6[3] = &unk_1E6DB6790;
  int v7 = a3;
  v6[4] = self;
  void v6[5] = &v8;
  dispatch_sync(streamInputQueue, v6);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __78__VCVideoCaptureServer_unregisterStreamInputCaptureSourceWithCaptureSourceID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 552) objectForKeyedSubscript:v2];
  if (v3)
  {
    char v4 = v3;
    uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 560), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "streamInputID")));
    if (v5)
    {
      [v5 removeSink:v4];
      [v4 setDelegate:0];
    }
    [*(id *)(*(void *)(a1 + 32) + 552) setObject:0 forKeyedSubscript:v2];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __78__VCVideoCaptureServer_unregisterStreamInputCaptureSourceWithCaptureSourceID___block_invoke_cold_1();
    }
  }
}

- (BOOL)internalRegisterStreamInput:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!-[VCVideoCaptureServer isValidStreamInput:](self, "isValidStreamInput:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v13) {
        return v13;
      }
      -[VCVideoCaptureServer internalRegisterStreamInput:]();
    }
    goto LABEL_18;
  }
  uint64_t v5 = (void *)[a3 streamInputID];
  if ([(NSMutableDictionary *)self->_streamInputs objectForKeyedSubscript:v5])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v13) {
        return v13;
      }
      -[VCVideoCaptureServer internalRegisterStreamInput:]();
    }
LABEL_18:
    LOBYTE(v13) = 0;
    return v13;
  }
  int v6 = [v5 intValue];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v7 = (void *)[(NSMutableDictionary *)self->_streamInputCaptureSources allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (!v8)
  {
LABEL_13:
    [a3 thermalLevelDidChange:self->_newThermalLevel];
    [(NSMutableDictionary *)self->_streamInputs setObject:a3 forKeyedSubscript:v5];
    LOBYTE(v13) = 1;
    return v13;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v17;
LABEL_5:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v17 != v10) {
      objc_enumerationMutation(v7);
    }
    uint64_t v12 = (void *)[(NSMutableDictionary *)self->_streamInputCaptureSources objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * v11)];
    if ([v12 streamInputID] != v6) {
      goto LABEL_11;
    }
    if ((objc_msgSend(a3, "isEqualFormat:", objc_msgSend(v12, "formatDescription")) & 1) == 0) {
      break;
    }
    [a3 addSink:v12];
    [v12 setDelegate:a3];
LABEL_11:
    if (v9 == ++v11)
    {
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (v9) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_18;
  }
  VRTraceErrorLogLevelToCSTR();
  BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v13)
  {
    -[VCVideoCaptureServer internalRegisterStreamInput:]();
    goto LABEL_18;
  }
  return v13;
}

- (BOOL)internalUnregisterStreamInput:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!-[VCVideoCaptureServer isValidStreamInput:](self, "isValidStreamInput:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        return v14;
      }
      -[VCVideoCaptureServer internalUnregisterStreamInput:]();
    }
    goto LABEL_24;
  }
  uint64_t v5 = (void *)[a3 streamInputID];
  if (![(NSMutableDictionary *)self->_streamInputs objectForKeyedSubscript:v5])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        return v14;
      }
      -[VCVideoCaptureServer internalUnregisterStreamInput:]();
    }
    goto LABEL_24;
  }
  if ((id)[(NSMutableDictionary *)self->_streamInputs objectForKeyedSubscript:v5] != a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        return v14;
      }
      -[VCVideoCaptureServer internalUnregisterStreamInput:]();
    }
LABEL_24:
    LOBYTE(v14) = 0;
    return v14;
  }
  int v6 = [v5 intValue];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v7 = (void *)[(NSMutableDictionary *)self->_streamInputCaptureSources allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        BOOL v13 = (void *)[(NSMutableDictionary *)self->_streamInputCaptureSources objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * v12)];
        if ([v13 streamInputID] == v10)
        {
          [a3 removeSink:v13];
          [v13 setDelegate:0];
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v9);
  }
  [(NSMutableDictionary *)self->_streamInputs setObject:0 forKeyedSubscript:v5];
  LOBYTE(v14) = 1;
  return v14;
}

- (BOOL)registerStreamInput:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  streamInputQueue = self->_streamInputQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__VCVideoCaptureServer_registerStreamInput___block_invoke;
  v6[3] = &unk_1E6DB43B0;
  void v6[5] = a3;
  void v6[6] = &v7;
  v6[4] = self;
  dispatch_sync(streamInputQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __44__VCVideoCaptureServer_registerStreamInput___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) internalRegisterStreamInput:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)unregisterStreamInput:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  streamInputQueue = self->_streamInputQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCVideoCaptureServer_unregisterStreamInput___block_invoke;
  block[3] = &unk_1E6DB3E40;
  void block[4] = self;
  void block[5] = a3;
  dispatch_sync(streamInputQueue, block);
}

uint64_t __46__VCVideoCaptureServer_unregisterStreamInput___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) internalUnregisterStreamInput:*(void *)(a1 + 40)];
}

uint64_t __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_322(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"previewDidLocalVideoAttributesChange" arguments:v3];
}

uint64_t __VCVideoCaptureServer_CopyLocalVideoAttributes_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 152) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)updateLocalAspectRatios:(int)a3 localScreenAspectRatio:(CGSize)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a3 > 1)
  {
    self->long long localScreenLandscapeAspectRatio = a4;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    uint64_t v11 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      BOOL v13 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        CGFloat width = self->localScreenLandscapeAspectRatio.width;
        CGFloat height = self->localScreenLandscapeAspectRatio.height;
        int v25 = 136316162;
        uint64_t v26 = v12;
        __int16 v27 = 2080;
        __int16 v28 = "-[VCVideoCaptureServer updateLocalAspectRatios:localScreenAspectRatio:]";
        __int16 v29 = 1024;
        int v30 = 3548;
        __int16 v31 = 2048;
        CGFloat v32 = width;
        __int16 v33 = 2048;
        CGFloat v34 = height;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d [AR_RX] localScreenLandscapeAspectRatio=(%f, %f)", (uint8_t *)&v25, 0x30u);
      }
    }
    if (self->localScreenLandscapeAspectRatio.height / self->localScreenLandscapeAspectRatio.width >= 0.666666667) {
      long long localScreenLandscapeAspectRatio = (__int128)self->localScreenLandscapeAspectRatio;
    }
    else {
      long long localScreenLandscapeAspectRatio = xmmword_1E25A1DE0;
    }
    self->localExpectedLandscapeAspectRatio = (CGSize)localScreenLandscapeAspectRatio;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      long long v18 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v23 = self->localExpectedLandscapeAspectRatio.width;
        CGFloat v24 = self->localExpectedLandscapeAspectRatio.height;
        int v25 = 136316162;
        uint64_t v26 = v22;
        __int16 v27 = 2080;
        __int16 v28 = "-[VCVideoCaptureServer updateLocalAspectRatios:localScreenAspectRatio:]";
        __int16 v29 = 1024;
        int v30 = 3559;
        __int16 v31 = 2048;
        CGFloat v32 = v23;
        __int16 v33 = 2048;
        CGFloat v34 = v24;
        uint64_t v21 = "VCVideoCaptureServer [%s] %s:%d [AR_RX] localExpectedLandscapeAspectRatio=(%f, %f)";
        goto LABEL_20;
      }
    }
  }
  else
  {
    self->long long localScreenPortraitAspectRatio = a4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      int v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v7 = self->localScreenPortraitAspectRatio.width;
        CGFloat v8 = self->localScreenPortraitAspectRatio.height;
        int v25 = 136316162;
        uint64_t v26 = v5;
        __int16 v27 = 2080;
        __int16 v28 = "-[VCVideoCaptureServer updateLocalAspectRatios:localScreenAspectRatio:]";
        __int16 v29 = 1024;
        int v30 = 3534;
        __int16 v31 = 2048;
        CGFloat v32 = v7;
        __int16 v33 = 2048;
        CGFloat v34 = v8;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d [AR_RX] localScreenPortraitAspectRatio=(%f, %f)", (uint8_t *)&v25, 0x30u);
      }
    }
    if (self->localScreenPortraitAspectRatio.width / self->localScreenPortraitAspectRatio.height >= 0.666666667) {
      long long localScreenPortraitAspectRatio = (__int128)self->localScreenPortraitAspectRatio;
    }
    else {
      long long localScreenPortraitAspectRatio = xmmword_1E25A1DF0;
    }
    self->localExpectedPortraitAspectRatio = (CGSize)localScreenPortraitAspectRatio;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      long long v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v19 = self->localExpectedPortraitAspectRatio.width;
        CGFloat v20 = self->localExpectedPortraitAspectRatio.height;
        int v25 = 136316162;
        uint64_t v26 = v17;
        __int16 v27 = 2080;
        __int16 v28 = "-[VCVideoCaptureServer updateLocalAspectRatios:localScreenAspectRatio:]";
        __int16 v29 = 1024;
        int v30 = 3545;
        __int16 v31 = 2048;
        CGFloat v32 = v19;
        __int16 v33 = 2048;
        CGFloat v34 = v20;
        uint64_t v21 = "VCVideoCaptureServer [%s] %s:%d [AR_RX] localExpectedPortraitAspectRatio=(%f, %f)";
LABEL_20:
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v25, 0x30u);
      }
    }
  }
}

- (BOOL)setLocalScreenAttributes:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  [a3 ratio];
  if (v5 == 0.0) {
    return 0;
  }
  [a3 ratio];
  if (v6 == 0.0) {
    return 0;
  }
  variablesQueue = self->variablesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke;
  block[3] = &unk_1E6DB3E40;
  void block[4] = self;
  void block[5] = a3;
  dispatch_barrier_async(variablesQueue, block);
  return 1;
}

void __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) orientation];
  [*(id *)(a1 + 40) ratio];
  objc_msgSend(v2, "updateLocalAspectRatios:localScreenAspectRatio:", v3);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 384);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4)
  {
    if (ErrorLogLevelForModule >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      CGFloat v7 = *MEMORY[0x1E4F47A50];
      CGFloat v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v18 = v6;
          __int16 v19 = 2080;
          CGFloat v20 = "-[VCVideoCaptureServer setLocalScreenAttributes:]_block_invoke";
          __int16 v21 = 1024;
          int v22 = 3581;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d notifying app of video attributes change", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_cold_2();
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_324;
    block[3] = &unk_1E6DB3E40;
    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 296), block);
  }
  else
  {
    if (ErrorLogLevelForModule >= 8)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      char v10 = *MEMORY[0x1E4F47A50];
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v18 = v9;
          __int16 v19 = 2080;
          CGFloat v20 = "-[VCVideoCaptureServer setLocalScreenAttributes:]_block_invoke_2";
          __int16 v21 = 1024;
          int v22 = 3589;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d notifying clients of video attributes change", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_cold_1();
      }
    }
    uint64_t v12 = (void *)[*(id *)(a1 + 40) copyEncodedDictionary];
    BOOL v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v12, @"localVideoAttributes", 0);
    BOOL v14 = *(NSObject **)(*(void *)(a1 + 32) + 296);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_328;
    v15[3] = &unk_1E6DB3DC8;
    v15[4] = v13;
    dispatch_async(v14, v15);
  }
}

uint64_t __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_324(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 384);
    return [v4 didChangeLocalScreenAttributes:v3];
  }
  return result;
}

uint64_t __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_328(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"previewDidLocalScreenAttributesChange" arguments:v3];
}

- (CGSize)localScreenRatioForScreenOrientation:(int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v11 = (double *)&v10;
  uint64_t v12 = 0x3010000000;
  BOOL v13 = "";
  long long v14 = *MEMORY[0x1E4F1DB30];
  variablesQueue = self->variablesQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __61__VCVideoCaptureServer_localScreenRatioForScreenOrientation___block_invoke;
  v8[3] = &unk_1E6DB6470;
  int v9 = a3;
  v8[4] = self;
  void v8[5] = &v10;
  dispatch_sync(variablesQueue, v8);
  double v4 = v11[4];
  double v5 = v11[5];
  _Block_object_dispose(&v10, 8);
  double v6 = v4;
  double v7 = v5;
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

__n128 __61__VCVideoCaptureServer_localScreenRatioForScreenOrientation___block_invoke(uint64_t a1)
{
  uint64_t v1 = 176;
  if (*(_DWORD *)(a1 + 48) < 2u) {
    uint64_t v1 = 160;
  }
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + v1);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (CGSize)localExpectedRatioForScreenOrientation:(int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v11 = (double *)&v10;
  uint64_t v12 = 0x3010000000;
  BOOL v13 = "";
  long long v14 = *MEMORY[0x1E4F1DB30];
  variablesQueue = self->variablesQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __63__VCVideoCaptureServer_localExpectedRatioForScreenOrientation___block_invoke;
  v8[3] = &unk_1E6DB6470;
  int v9 = a3;
  v8[4] = self;
  void v8[5] = &v10;
  dispatch_sync(variablesQueue, v8);
  double v4 = v11[4];
  double v5 = v11[5];
  _Block_object_dispose(&v10, 8);
  double v6 = v4;
  double v7 = v5;
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

__n128 __63__VCVideoCaptureServer_localExpectedRatioForScreenOrientation___block_invoke(uint64_t a1)
{
  uint64_t v1 = 208;
  if (*(_DWORD *)(a1 + 48) < 2u) {
    uint64_t v1 = 192;
  }
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + v1);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (id)localScreenAttributesForVideoAttributes:(id)a3
{
  if (!a3) {
    return 0;
  }
  double v4 = +[VideoAttributes videoAttributesWithVideoAttributes:](VideoAttributes, "videoAttributesWithVideoAttributes:");
  [(VCVideoCaptureServer *)self localScreenRatioForScreenOrientation:[(VideoAttributes *)v4 orientation]];
  -[VideoAttributes setRatio:](v4, "setRatio:");
  return v4;
}

- (id)copyLocalScreenAttributesForVideoAttributes:(id)a3
{
  uint64_t v3 = (VideoAttributes *)a3;
  if (a3)
  {
    double v5 = (void *)MEMORY[0x1E4E589F0](self, a2);
    uint64_t v3 = +[VideoAttributes videoAttributesWithVideoAttributes:v3];
    [(VCVideoCaptureServer *)self localScreenRatioForScreenOrientation:[(VideoAttributes *)v3 orientation]];
    -[VideoAttributes setRatio:](v3, "setRatio:");
  }
  return v3;
}

- (void)centerStageEnabledDidChange:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__VCVideoCaptureServer_centerStageEnabledDidChange___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  void block[4] = self;
  BOOL v5 = a3;
  dispatch_async(captureClientQueue, block);
}

uint64_t __52__VCVideoCaptureServer_centerStageEnabledDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 captureSourceCenterStageEnabledDidChange:*(unsigned __int8 *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)portraitBlurEnabledDidChange:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__VCVideoCaptureServer_portraitBlurEnabledDidChange___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  void block[4] = self;
  BOOL v5 = a3;
  dispatch_async(captureClientQueue, block);
}

uint64_t __53__VCVideoCaptureServer_portraitBlurEnabledDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 captureSourcePortraitBlurEnabledDidChange:*(unsigned __int8 *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)reactionDidStart:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__VCVideoCaptureServer_reactionDidStart___block_invoke;
  block[3] = &unk_1E6DB3E40;
  void block[4] = self;
  void block[5] = a3;
  dispatch_async(captureClientQueue, block);
}

uint64_t __41__VCVideoCaptureServer_reactionDidStart___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 reactionDidStart:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)didStopReacting
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  captureClientQueue = self->captureClientQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__VCVideoCaptureServer_didStopReacting__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(captureClientQueue, v3);
}

uint64_t __39__VCVideoCaptureServer_didStopReacting__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t result = [v1 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          [v6 didStopReacting];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t result = [v1 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a3, "isEqualToString:", @"systemPreferredCamera", a4, a5, a6))
  {
    long long v8 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    if (v8)
    {
      long long v9 = v8;
      if ((objc_msgSend(v8, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")) & 1) == 0)
      {
        uint64_t v15 = [v9 uniqueID];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          uint64_t v17 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v23 = 136315906;
            uint64_t v24 = v16;
            __int16 v25 = 2080;
            uint64_t v26 = "-[VCVideoCaptureServer observeValueForKeyPath:ofObject:change:context:]";
            __int16 v27 = 1024;
            int v28 = 3727;
            __int16 v29 = 2112;
            uint64_t v30 = v15;
            _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d receiving updated systemPreferredCamera=%@", (uint8_t *)&v23, 0x26u);
          }
        }
        if (self->_followSystemCamera)
        {
          [(VCVideoCaptureServer *)self setCaptureCameraWithToken:[(VCVideoSourceTokenManager *)self->_tokenManager tokenForDeviceName:v15 sourceType:1]];
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return;
          }
          uint64_t v18 = VRTraceErrorLogLevelToCSTR();
          __int16 v19 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return;
          }
          BOOL followSystemCamera = self->_followSystemCamera;
          int v23 = 136315906;
          uint64_t v24 = v18;
          __int16 v25 = 2080;
          uint64_t v26 = "-[VCVideoCaptureServer observeValueForKeyPath:ofObject:change:context:]";
          __int16 v27 = 1024;
          int v28 = 3731;
          __int16 v29 = 1024;
          LODWORD(v30) = followSystemCamera;
          uint64_t v12 = "VCVideoCaptureServer [%s] %s:%d updating local camera because _followSystemCamera=%d";
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return;
          }
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          __int16 v19 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return;
          }
          BOOL v22 = self->_followSystemCamera;
          int v23 = 136315906;
          uint64_t v24 = v21;
          __int16 v25 = 2080;
          uint64_t v26 = "-[VCVideoCaptureServer observeValueForKeyPath:ofObject:change:context:]";
          __int16 v27 = 1024;
          int v28 = 3733;
          __int16 v29 = 1024;
          LODWORD(v30) = v22;
          uint64_t v12 = "VCVideoCaptureServer [%s] %s:%d ignoring because _followSystemCamera=%d";
        }
        uint64_t v13 = v19;
        uint32_t v14 = 34;
        goto LABEL_18;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315650;
        uint64_t v24 = v10;
        __int16 v25 = 2080;
        uint64_t v26 = "-[VCVideoCaptureServer observeValueForKeyPath:ofObject:change:context:]";
        __int16 v27 = 1024;
        int v28 = 3736;
        uint64_t v12 = "VCVideoCaptureServer [%s] %s:%d receiving updated systemPreferredCamera=NULL";
        uint64_t v13 = v11;
        uint32_t v14 = 28;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v23, v14);
      }
    }
  }
}

- (void)dispatchedSetCaptureCameraWithToken:(_VCVideoSourceToken)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t var1 = a3.var0.var1;
  id v6 = [(VCVideoSourceTokenManager *)self->_tokenManager deviceNameForToken:a3.var0.var1];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    long long v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v24 = v7;
      __int16 v25 = 2080;
      uint64_t v26 = "-[VCVideoCaptureServer dispatchedSetCaptureCameraWithToken:]";
      __int16 v27 = 1024;
      int v28 = 3745;
      __int16 v29 = 1024;
      $948446A44E2BC96870B572155DF52E0B var0 = a3.var0.var0;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d VCVideoSourceToken=0x%x, cameraUID=%@", buf, 0x2Cu);
    }
  }
  if (v6)
  {
    uint64_t v9 = [(VCVideoSource *)self->avCapture configureCaptureWithToken:var1];
    if ((v9 & 0x80000000) == 0 || (uint64_t v10 = v9, v9 == -2146893775))
    {
      int v11 = +[VCHardwareSettings preferPresentationTimestamp];
      if (v11)
      {
        if (objc_opt_respondsToSelector()) {
          LOBYTE(v11) = [(VCVideoSource *)self->avCapture isInternalCamera];
        }
        else {
          LOBYTE(v11) = 0;
        }
      }
      self->_preferPresentationTimeStamp = v11;
      self->_currentVideoSourceToken = a3;
      self->_firstPreviewFrameReceived = 0;
      char v12 = objc_opt_respondsToSelector();
      if (v12) {
        uint64_t v13 = [(VCVideoSource *)self->avCapture currentVideoFeatureStatus];
      }
      else {
        uint64_t v13 = 0;
      }
      captureClientQueue = self->captureClientQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__VCVideoCaptureServer_dispatchedSetCaptureCameraWithToken___block_invoke;
      block[3] = &unk_1E6DB4568;
      void block[4] = self;
      char v19 = v12 & 1;
      int v20 = v13;
      char v22 = BYTE6(v13);
      __int16 v21 = WORD2(v13);
      dispatch_async(captureClientQueue, block);
      uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"localCameraUIDString", 0);
      delegateNotificationQueue = self->delegateNotificationQueue;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __60__VCVideoCaptureServer_dispatchedSetCaptureCameraWithToken___block_invoke_2;
      v17[3] = &unk_1E6DB3DC8;
      v17[4] = v15;
      dispatch_async(delegateNotificationQueue, v17);
    }
    else
    {
      [(VCVideoCaptureServer *)self handleAVCaptureError:v9 domain:@"avCaptureSetCameraWithUIDFail"];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoCaptureServer dispatchedSetCaptureCameraWithToken:]();
    }
  }
}

uint64_t __60__VCVideoCaptureServer_dispatchedSetCaptureCameraWithToken___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 captureSource1080pAvailabilityDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 728)];
        }
        if (*(unsigned char *)(a1 + 40))
        {
          if (objc_opt_respondsToSelector())
          {
            unint64_t v1 = v1 & 0xFF00000000000000 | *(unsigned int *)(a1 + 41) | ((unint64_t)(*(unsigned __int16 *)(a1 + 45) | (*(unsigned __int8 *)(a1 + 47) << 16)) << 32);
            [v8 updateCaptureSourceVideoFeatureStatus:v1];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __60__VCVideoCaptureServer_dispatchedSetCaptureCameraWithToken___block_invoke_2(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"previewCameraUIDChanged" arguments:v3];
}

- (BOOL)setCaptureCameraWithToken:(_VCVideoSourceToken)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VCVideoCaptureServer_setCaptureCameraWithToken___block_invoke;
  block[3] = &unk_1E6DB3F08;
  void block[4] = self;
  $948446A44E2BC96870B572155DF52E0B var0 = a3.var0.var0;
  dispatch_async(captureServerQueue, block);
  return 1;
}

uint64_t __50__VCVideoCaptureServer_setCaptureCameraWithToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetCaptureCameraWithToken:*(unsigned int *)(a1 + 40)];
}

- (int)setBoundsForRemoteLayerWithFacing:(BOOL)a3 frameRect:(CGRect)a4 fenceHandle:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  BOOL v10 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  p_enqueueLock = &self->_enqueueLock;
  pthread_mutex_lock(&self->_enqueueLock);
  uint64_t v13 = 416;
  if (v10) {
    uint64_t v13 = 408;
  }
  uint64_t v14 = *(Class *)((char *)&self->super.isa + v13);
  if (!v14) {
    goto LABEL_10;
  }
  CFMutableDictionaryRef EncodedCFDictionary = VideoAttributes_CreateEncodedCFDictionary(self->localVideoAttributes);
  VCImageQueue_EnqueueAttributes((uint64_t)v14, EncodedCFDictionary);
  if (EncodedCFDictionary) {
    CFRelease(EncodedCFDictionary);
  }
  if (VCImageQueue_setCALayerSize((uint64_t)v14, (uint64_t)a5, x, y, width, height))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    {
LABEL_10:
      int v18 = 0;
      goto LABEL_22;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x1E4F47A50];
    int v18 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_msgSend((id)objc_msgSend(v14, "description"), "UTF8String");
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      int v24 = 136316418;
      uint64_t v25 = v16;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCVideoCaptureServer setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:]";
      __int16 v28 = 1024;
      int v29 = 3834;
      __int16 v30 = 2080;
      uint64_t v31 = v19;
      __int16 v32 = 2112;
      uint64_t v33 = (VCVideoCaptureServer *)NSStringFromRect(v37);
      __int16 v34 = 2048;
      id v35 = a5;
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d VCVideoCaptureServer: queue=%s --> set layer bounds=%@ caFenceHandle=%p", (uint8_t *)&v24, 0x3Au);
      goto LABEL_10;
    }
  }
  else
  {
    if ((VCVideoCaptureServer *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoCaptureServer setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v20 = (__CFString *)[(VCVideoCaptureServer *)self performSelector:sel_logPrefix];
      }
      else {
        int v20 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        char v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v24 = 136316418;
          uint64_t v25 = v21;
          __int16 v26 = 2080;
          __int16 v27 = "-[VCVideoCaptureServer setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:]";
          __int16 v28 = 1024;
          int v29 = 3832;
          __int16 v30 = 2112;
          uint64_t v31 = (uint64_t)v20;
          __int16 v32 = 2048;
          uint64_t v33 = self;
          __int16 v34 = 2048;
          id v35 = v14;
          _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d %@(%p) Fail to set layer size for queue=%p", (uint8_t *)&v24, 0x3Au);
        }
      }
    }
    int v18 = 4;
  }
LABEL_22:
  pthread_mutex_unlock(p_enqueueLock);
  return v18;
}

- (void)beginPreviewToPIPAnimation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      BOOL v10 = "-[VCVideoCaptureServer beginPreviewToPIPAnimation]";
      __int16 v11 = 1024;
      int v12 = 3908;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d ", (uint8_t *)&v7, 0x1Cu);
    }
  }
  if (self->pendingWidth == 1280 && self->pendingHeight == 720)
  {
    [self->localVideoAttributes ratio];
    if (v5 == 768.0)
    {
      [self->localVideoAttributes ratio];
      if (v6 == 1024.0) {
        self->resize = 1;
      }
    }
  }
}

- (void)endPreviewToPIPAnimation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCVideoCaptureServer endPreviewToPIPAnimation]";
      __int16 v9 = 1024;
      int v10 = 3916;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d ", (uint8_t *)&v5, 0x1Cu);
    }
  }
  [(VCVideoCaptureServer *)self changeCameraToPendingSettingsWithReset:1];
}

- (void)beginPIPToPreviewAnimation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCVideoCaptureServer beginPIPToPreviewAnimation]";
      __int16 v9 = 1024;
      int v10 = 3927;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d ", (uint8_t *)&v5, 0x1Cu);
    }
  }
  [(VCVideoCaptureServer *)self changeCameraToPendingSettingsWithReset:0];
}

- (void)endPIPToPreviewAnimation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCVideoCaptureServer endPIPToPreviewAnimation]";
      __int16 v9 = 1024;
      int v10 = 3938;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d ", (uint8_t *)&v5, 0x1Cu);
    }
  }
  [(VCVideoCaptureServer *)self resetCameraToPreviewSettingsForced:1];
}

- (BOOL)supportsPortraitResolution
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  avCapture = self->avCapture;

  return [(VCVideoSource *)avCapture supportsPortraitResolution];
}

- (void)setLocalCamera:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(MEMORY[0x1E4F16440], "deviceWithUniqueID:"))
  {
    if (self->_followSystemCamera)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          BOOL followSystemCamera = self->_followSystemCamera;
          int v14 = 136315906;
          uint64_t v15 = v5;
          __int16 v16 = 2080;
          uint64_t v17 = "-[VCVideoCaptureServer setLocalCamera:]";
          __int16 v18 = 1024;
          int v19 = 3966;
          __int16 v20 = 1024;
          BOOL v21 = followSystemCamera;
          uint64_t v8 = "VCVideoCaptureServer [%s] %s:%d Not setting yet because _followSystemCamera=%d, instead wait for KVO notification";
          __int16 v9 = v6;
          uint32_t v10 = 34;
LABEL_9:
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
        }
      }
    }
    else
    {
      uint64_t v13 = [(VCVideoSourceTokenManager *)self->_tokenManager tokenForDeviceName:a3 sourceType:1];
      [(VCVideoCaptureServer *)self setCaptureCameraWithToken:v13];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCVideoCaptureServer setLocalCamera:]";
      __int16 v18 = 1024;
      int v19 = 3962;
      uint64_t v8 = "VCVideoCaptureServer [%s] %s:%d ignoring because captureDevice is nil";
      __int16 v9 = v12;
      uint32_t v10 = 28;
      goto LABEL_9;
    }
  }
}

- (void)setSystemPreferredAsLocalCamera
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->captureServerQueue);
  uint64_t v3 = (void *)[MEMORY[0x1E4F16440] systemPreferredCamera];
  if (v3)
  {
    uint64_t v4 = [v3 uniqueID];
    v5.var0.$948446A44E2BC96870B572155DF52E0B var0 = ($948446A44E2BC96870B572155DF52E0B)[(VCVideoSourceTokenManager *)self->_tokenManager tokenForDeviceName:v4 sourceType:1];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      __int16 v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        uint64_t v11 = v6;
        __int16 v12 = 2080;
        uint64_t v13 = "-[VCVideoCaptureServer setSystemPreferredAsLocalCamera]";
        __int16 v14 = 1024;
        int v15 = 3984;
        __int16 v16 = 2112;
        uint64_t v17 = v4;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d systemPreferredCamera=%@", (uint8_t *)&v10, 0x26u);
      }
    }
    [(VCVideoCaptureServer *)self dispatchedSetCaptureCameraWithToken:v5.var0.var1];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    __int16 v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      uint64_t v13 = "-[VCVideoCaptureServer setSystemPreferredAsLocalCamera]";
      __int16 v14 = 1024;
      int v15 = 3979;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d systemPreferredCamera is nil", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)pausePreview
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  self->falteredRenderingtimeStamp = 0.0;
  captureServerQueue = self->captureServerQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__VCVideoCaptureServer_pausePreview__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(captureServerQueue, v3);
}

void __36__VCVideoCaptureServer_pausePreview__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v19 = v2;
      __int16 v20 = 2080;
      BOOL v21 = "-[VCVideoCaptureServer pausePreview]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 4087;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4[41])
  {
    uint64_t v5 = [v4 canStopPreview];
    int v6 = [*(id *)(*(void *)(a1 + 32) + 328) stop:v5];
    if (v5) {
      *(unsigned char *)(*(void *)(a1 + 32) + 454) = 0;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v6 < 0)
    {
      objc_msgSend((id)v7, "handleAVCaptureError:domain:");
    }
    else
    {
      pthread_mutex_lock((pthread_mutex_t *)(v7 + 488));
      [*(id *)(*(void *)(a1 + 32) + 408) pause];
      [*(id *)(*(void *)(a1 + 32) + 416) pause];
      pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 488));
      uint64_t v8 = *(void *)(a1 + 32);
      __int16 v9 = *(NSObject **)(v8 + 296);
      if (*(void *)(v8 + 384))
      {
        int v10 = v17;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __36__VCVideoCaptureServer_pausePreview__block_invoke_358;
        v17[3] = &unk_1E6DB3DC8;
        v17[4] = v8;
      }
      else
      {
        int v10 = &__block_literal_global_362_0;
      }
      dispatch_async(v9, v10);
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      __int16 v12 = (os_log_t *)MEMORY[0x1E4F47A50];
      if (ErrorLogLevelForModule > 6)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        __int16 v14 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v19 = v13;
          __int16 v20 = 2080;
          BOOL v21 = "-[VCVideoCaptureServer pausePreview]_block_invoke_3";
          __int16 v22 = 1024;
          int v23 = 4125;
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d completed", buf, 0x1Cu);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        __int16 v16 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v19 = v15;
          __int16 v20 = 2080;
          BOOL v21 = "-[VCVideoCaptureServer pausePreview]_block_invoke";
          __int16 v22 = 1024;
          int v23 = 4126;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d preview-paused", buf, 0x1Cu);
        }
      }
    }
  }
  else
  {
    [v4 updatePreviewState];
  }
}

uint64_t __36__VCVideoCaptureServer_pausePreview__block_invoke_358(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 384);
    return [v3 didPausePreview];
  }
  return result;
}

uint64_t __36__VCVideoCaptureServer_pausePreview__block_invoke_2()
{
  id v0 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  return [v0 sendMessageAsync:"previewDidPause" arguments:0];
}

- (void)stopPreview
{
  void v4[5] = *MEMORY[0x1E4F143B8];
  captureServerQueue = self->captureServerQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  uint64_t v4[2] = __35__VCVideoCaptureServer_stopPreview__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(captureServerQueue, v4);
  self->falteredRenderingtimeStamp = 0.0;
  self->resize = 0;
}

void __35__VCVideoCaptureServer_stopPreview__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v3 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v14 = 136315906;
      uint64_t v15 = v4;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCVideoCaptureServer stopPreview]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 4133;
      __int16 v20 = 2048;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d self %p", (uint8_t *)&v14, 0x26u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 328);
  if (v8)
  {
    [v8 stop:1];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(*(void *)(a1 + 32) + 328) invalidate];
    }

    *(void *)(*(void *)(a1 + 32) + 328) = 0;
    [*(id *)(a1 + 32) setCFAvailabilityChange:0];
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 56));
    uint64_t v7 = *(void *)(a1 + 32);
  }
  pthread_mutex_lock((pthread_mutex_t *)(v7 + 488));
  [*(id *)(a1 + 32) tearDownImageConverters];

  *(void *)(*(void *)(a1 + 32) + 408) = 0;
  *(void *)(*(void *)(a1 + 32) + 416) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 488));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "setRatio:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  *(_DWORD *)(*(void *)(a1 + 32) + 8) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 12) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 16) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 28) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 454) = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 454);
      int v14 = 136315906;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCVideoCaptureServer stopPreview]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 4165;
      __int16 v20 = 1024;
      LODWORD(v21) = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d _isPreviewRunning=%d", (uint8_t *)&v14, 0x22u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCVideoCaptureServer stopPreview]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 4166;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d preview-stopped", (uint8_t *)&v14, 0x1Cu);
    }
  }
}

- (void)setPauseCapture:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    captureClientQueue = self->captureClientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__VCVideoCaptureServer_setPauseCapture___block_invoke;
    block[3] = &unk_1E6DB3DF0;
    void block[4] = self;
    BOOL v8 = v3;
    dispatch_async(captureClientQueue, block);
    screenHealthMonitor = self->screenHealthMonitor;
    if (v3) {
      dispatch_suspend(screenHealthMonitor);
    }
    else {
      dispatch_resume(screenHealthMonitor);
    }
  }
}

void __40__VCVideoCaptureServer_setPauseCapture___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 336) setPauseCapture:*(unsigned __int8 *)(a1 + 40)];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    BOOL v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(unsigned __int8 *)(a1 + 40);
      int v6 = 136315906;
      if (v4) {
        uint64_t v5 = "Paused";
      }
      else {
        uint64_t v5 = "Resumed";
      }
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCVideoCaptureServer setPauseCapture:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 4179;
      __int16 v12 = 2080;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %s screen capture", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)startCaptureWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  self->_encodingWidth = a3;
  self->_encodingHeight = a4;
  -[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:](self, "startPreviewWithWidth:height:frameRate:");
  if (a4 * a3 * a5)
  {
    captureServerQueue = self->captureServerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__VCVideoCaptureServer_startCaptureWithWidth_height_frameRate___block_invoke;
    block[3] = &unk_1E6DB3F58;
    void block[4] = self;
    int v13 = a5;
    int v14 = a3;
    int v15 = a4;
    dispatch_async(captureServerQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    int v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v17 = v10;
      __int16 v18 = 2080;
      int v19 = "-[VCVideoCaptureServer startCaptureWithWidth:height:frameRate:]";
      __int16 v20 = 1024;
      int v21 = 4201;
      __int16 v22 = 1024;
      int v23 = a3;
      __int16 v24 = 1024;
      int v25 = a4;
      __int16 v26 = 1024;
      int v27 = a5;
      _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d received invalid settings %dx%d@%dfps, returning early", buf, 0x2Eu);
    }
  }
}

void __63__VCVideoCaptureServer_startCaptureWithWidth_height_frameRate___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 328))
  {
    if ([*(id *)(v2 + 120) count])
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 28) = *(_DWORD *)(a1 + 40);
      uint64_t v3 = [*(id *)(a1 + 32) getCappedFrameRate:*(unsigned int *)(a1 + 40)];
      int v4 = [*(id *)(*(void *)(a1 + 32) + 328) startCaptureWithWidth:*(unsigned int *)(a1 + 44) height:*(unsigned int *)(a1 + 48) frameRate:v3];
      uint64_t v5 = *(void *)(a1 + 32);
      if (v4 == -2146893775 && *(_DWORD *)(v5 + 16) != v3)
      {
        [(id)v5 setCurrentFrameRate:v3];
        uint64_t v5 = *(void *)(a1 + 32);
      }
      *(unsigned char *)(v5 + 457) = 1;
      *(_DWORD *)(*(void *)(a1 + 32) + 8) = *(_DWORD *)(a1 + 44);
      *(_DWORD *)(*(void *)(a1 + 32) + 12) = *(_DWORD *)(a1 + 48);
      *(_DWORD *)(*(void *)(a1 + 32) + 16) = v3;
      [*(id *)(a1 + 32) updateImageQueueFrameRate:*(unsigned int *)(*(void *)(a1 + 32) + 16)];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v9 = *(_DWORD *)(a1 + 44);
          int v8 = *(_DWORD *)(a1 + 48);
          int v10 = *(_DWORD *)(a1 + 40);
          *(_DWORD *)buf = 136316674;
          uint64_t v22 = v6;
          __int16 v23 = 2080;
          __int16 v24 = "-[VCVideoCaptureServer startCaptureWithWidth:height:frameRate:]_block_invoke";
          __int16 v25 = 1024;
          int v26 = 4242;
          __int16 v27 = 1024;
          int v28 = v9;
          __int16 v29 = 1024;
          int v30 = v8;
          __int16 v31 = 1024;
          int v32 = v10;
          __int16 v33 = 1024;
          int v34 = v3;
          int v11 = "VCVideoCaptureServer [%s] %s:%d capture-started, video settings width=%d height=%d rate=%dfps cappedFrameRate=%dfps";
          __int16 v12 = v7;
          uint32_t v13 = 52;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        }
      }
    }
    else
    {
      uint64_t v20 = 0;
      unsigned int v19 = 0;
      [*(id *)(a1 + 32) previewVideoWidth:(char *)&v20 + 4 height:&v20 frameRate:&v19];
      [*(id *)(a1 + 32) dispatchedSetCaptureWidth:HIDWORD(v20) height:v20 rate:v19];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        int v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v16 = *(_DWORD **)(a1 + 32);
          int v17 = v16[2];
          int v18 = v16[3];
          LODWORD(v16) = v16[4];
          *(_DWORD *)buf = 136316418;
          uint64_t v22 = v14;
          __int16 v23 = 2080;
          __int16 v24 = "-[VCVideoCaptureServer startCaptureWithWidth:height:frameRate:]_block_invoke";
          __int16 v25 = 1024;
          int v26 = 4216;
          __int16 v27 = 1024;
          int v28 = v17;
          __int16 v29 = 1024;
          int v30 = v18;
          __int16 v31 = 1024;
          int v32 = (int)v16;
          int v11 = "VCVideoCaptureServer [%s] %s:%d Skip startCapture and reset to preview width=%d height=%d and framerate=%d";
          __int16 v12 = v15;
          uint32_t v13 = 46;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    [(id)v2 updatePreviewState];
  }
}

- (void)stopCapture
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  captureServerQueue = self->captureServerQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__VCVideoCaptureServer_stopCapture__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(captureServerQueue, v3);
}

void __35__VCVideoCaptureServer_stopCapture__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCVideoCaptureServer-stopCapture");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      uint64_t v21 = v2;
      __int16 v22 = 2080;
      __int16 v23 = "-[VCVideoCaptureServer stopCapture]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 4248;
      __int16 v26 = 2048;
      *(void *)__int16 v27 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @:@ VCVideoCaptureServer-stopCapture (%p)", buf, 0x26u);
    }
  }
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5[41])
  {
    uint64_t v6 = [v5 canStopPreview];
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 328) stop:v6];
    if (v6)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 454) = 0;
    }
    else
    {
      uint64_t v19 = 0;
      int v18 = 0;
      [*(id *)(a1 + 32) previewVideoWidth:(char *)&v19 + 4 height:&v19 frameRate:&v18];
      uint64_t v8 = v19;
      *(_DWORD *)(*(void *)(a1 + 32) + 28) = v18;
      objc_msgSend(*(id *)(a1 + 32), "dispatchedSetCaptureWidth:height:rate:", HIDWORD(v19), v8);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        int v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = *(_DWORD **)(a1 + 32);
          int v12 = v11[2];
          int v13 = v11[3];
          LODWORD(v11) = v11[4];
          *(_DWORD *)buf = 136316418;
          uint64_t v21 = v9;
          __int16 v22 = 2080;
          __int16 v23 = "-[VCVideoCaptureServer stopCapture]_block_invoke";
          __int16 v24 = 1024;
          int v25 = 4266;
          __int16 v26 = 1024;
          *(_DWORD *)__int16 v27 = v12;
          *(_WORD *)&v27[4] = 1024;
          *(_DWORD *)&v27[6] = v13;
          __int16 v28 = 1024;
          int v29 = (int)v11;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Resetting preview width=%d height=%d and framerate=%d", buf, 0x2Eu);
        }
      }
    }
    long long v14 = *MEMORY[0x1E4F1DB30];
    *(_OWORD *)(*(void *)(a1 + 32) + 224) = *MEMORY[0x1E4F1DB30];
    *(_OWORD *)(*(void *)(a1 + 32) + 240) = v14;
    int v15 = *(unsigned char **)(a1 + 32);
    if ((v7 & 0x80000000) != 0)
    {
      [v15 handleAVCaptureError:v7 domain:@"avCaptureStopFail"];
    }
    else
    {
      v15[457] = 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        int v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v21 = v16;
          __int16 v22 = 2080;
          __int16 v23 = "-[VCVideoCaptureServer stopCapture]_block_invoke";
          __int16 v24 = 1024;
          int v25 = 4279;
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d capture-stopped", buf, 0x1Cu);
        }
      }
    }
  }
}

- (void)setCaptureWidth:(int)a3 height:(int)a4 rate:(int)a5 forced:(BOOL)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  captureServerQueue = self->captureServerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__VCVideoCaptureServer_setCaptureWidth_height_rate_forced___block_invoke;
  v7[3] = &unk_1E6DB4F10;
  BOOL v11 = a6;
  int v8 = a3;
  int v9 = a4;
  int v10 = a5;
  v7[4] = self;
  dispatch_async(captureServerQueue, v7);
}

void __59__VCVideoCaptureServer_setCaptureWidth_height_rate_forced___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(unsigned __int8 *)(a1 + 52);
      int v5 = *(_DWORD *)(a1 + 40);
      int v6 = *(_DWORD *)(a1 + 44);
      int v7 = *(_DWORD *)(a1 + 48);
      int v8 = 136316674;
      uint64_t v9 = v2;
      __int16 v10 = 2080;
      BOOL v11 = "-[VCVideoCaptureServer setCaptureWidth:height:rate:forced:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 4305;
      __int16 v14 = 1024;
      int v15 = v4;
      __int16 v16 = 1024;
      int v17 = v5;
      __int16 v18 = 1024;
      int v19 = v6;
      __int16 v20 = 1024;
      int v21 = v7;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d forced %d, %dx%d@%d", (uint8_t *)&v8, 0x34u);
    }
  }
  if (*(unsigned char *)(a1 + 52))
  {
    [*(id *)(a1 + 32) setCaptureWidth:*(unsigned int *)(a1 + 40) height:*(unsigned int *)(a1 + 44) rate:*(unsigned int *)(a1 + 48)];
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 72) = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(*(void *)(a1 + 32) + 76) = *(_DWORD *)(a1 + 44);
    *(_DWORD *)(*(void *)(a1 + 32) + 80) = *(_DWORD *)(a1 + 48);
  }
}

- (void)dispatchedSetCaptureWidth:(int)a3 height:(int)a4 rate:(int)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  avCapture = self->avCapture;
  if (avCapture)
  {
    uint64_t v7 = *(void *)&a5;
    if (self->currentWidth == a3 && self->currentHeight == a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        BOOL v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136316418;
          uint64_t v16 = v10;
          __int16 v17 = 2080;
          __int16 v18 = "-[VCVideoCaptureServer dispatchedSetCaptureWidth:height:rate:]";
          __int16 v19 = 1024;
          int v20 = 4325;
          __int16 v21 = 1024;
          int v22 = a3;
          __int16 v23 = 1024;
          int v24 = a4;
          __int16 v25 = 1024;
          int v26 = v7;
          __int16 v12 = "VCVideoCaptureServer [%s] %s:%d already at requested dimensions=%dx%d@%d";
LABEL_11:
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 0x2Eu);
        }
      }
    }
    else
    {
      uint64_t v13 = [(VCVideoSource *)avCapture setWidth:*(void *)&a3 height:*(void *)&a4 frameRate:*(void *)&a5];
      if ((v13 & 0x80000000) != 0)
      {
        [(VCVideoCaptureServer *)self handleAVCaptureError:v13 domain:@"avCaptureSetCaptureOptionsFail"];
      }
      else
      {
        self->int currentWidth = a3;
        self->int currentHeight = a4;
        [(VCVideoCaptureServer *)self setCurrentFrameRate:v7];
        [(VCVideoCaptureServer *)self updateImageQueueFrameRate:self->currentFrameRate];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          BOOL v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 136316418;
            uint64_t v16 = v14;
            __int16 v17 = 2080;
            __int16 v18 = "-[VCVideoCaptureServer dispatchedSetCaptureWidth:height:rate:]";
            __int16 v19 = 1024;
            int v20 = 4339;
            __int16 v21 = 1024;
            int v22 = a3;
            __int16 v23 = 1024;
            int v24 = a4;
            __int16 v25 = 1024;
            int v26 = v7;
            __int16 v12 = "VCVideoCaptureServer [%s] %s:%d changed to=%dx%d@%dfps";
            goto LABEL_11;
          }
        }
      }
    }
  }
}

- (void)setCaptureWidth:(int)a3 height:(int)a4 rate:(int)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a4 * a3 * a5)
  {
    captureServerQueue = self->captureServerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__VCVideoCaptureServer_setCaptureWidth_height_rate___block_invoke;
    block[3] = &unk_1E6DB3F58;
    void block[4] = self;
    int v9 = a3;
    int v10 = a4;
    int v11 = a5;
    dispatch_async(captureServerQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      int v15 = "-[VCVideoCaptureServer setCaptureWidth:height:rate:]";
      __int16 v16 = 1024;
      int v17 = 4344;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d received invalid settings, returning", buf, 0x1Cu);
    }
  }
}

uint64_t __52__VCVideoCaptureServer_setCaptureWidth_height_rate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetCaptureWidth:*(unsigned int *)(a1 + 40) height:*(unsigned int *)(a1 + 44) rate:*(unsigned int *)(a1 + 48)];
}

- (void)resetCameraToPreviewSettingsForced:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = -1431655766;
  unsigned int v7 = -1431655766;
  unsigned int v5 = -1431655766;
  [(VCVideoCaptureServer *)self previewVideoWidth:&v7 height:&v6 frameRate:&v5];
  [(VCVideoCaptureServer *)self setCaptureWidth:v7 height:v6 rate:v5 forced:v3];
}

- (BOOL)cameraSupportsWidth:(int)a3 height:(int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  captureServerQueue = self->captureServerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__VCVideoCaptureServer_cameraSupportsWidth_height___block_invoke;
  v7[3] = &unk_1E6DB3F80;
  v7[4] = self;
  void v7[5] = &v10;
  int v8 = a3;
  int v9 = a4;
  dispatch_sync(captureServerQueue, v7);
  char v5 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __51__VCVideoCaptureServer_cameraSupportsWidth_height___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 328) cameraSupportsFormatWidth:*(unsigned int *)(a1 + 48) height:*(unsigned int *)(a1 + 52)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setCFAvailabilityChange:(BOOL)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  unsigned int v7 = @"previewCameraCinematicFraming";
  v8[0] = [NSNumber numberWithBool:a3];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  captureServerQueue = self->captureServerQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__VCVideoCaptureServer_setCFAvailabilityChange___block_invoke;
  v6[3] = &unk_1E6DB3DC8;
  v6[4] = v4;
  dispatch_async(captureServerQueue, v6);
}

uint64_t __48__VCVideoCaptureServer_setCFAvailabilityChange___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"previewCameraCinematicFramingAvailablilty" arguments:v3];
}

- (__CFDictionary)copyReportingStatsForCaptureSource:(int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    if (a3 < 0xA)
    {
      captureServerQueue = self->captureServerQueue;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __59__VCVideoCaptureServer_copyReportingStatsForCaptureSource___block_invoke_2;
      _OWORD v11[3] = &unk_1E6DB3F58;
      int v12 = a3;
      v11[4] = self;
      void v11[5] = Mutable;
      unsigned int v7 = v11;
    }
    else
    {
      captureServerQueue = self->_streamInputQueue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __59__VCVideoCaptureServer_copyReportingStatsForCaptureSource___block_invoke;
      v13[3] = &unk_1E6DB3F58;
      v13[4] = self;
      _OWORD v13[5] = Mutable;
      int v14 = a3;
      unsigned int v7 = v13;
    }
    dispatch_sync(captureServerQueue, v7);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCVideoCaptureServer copyReportingStatsForCaptureSource:]";
      __int16 v19 = 1024;
      int v20 = 4397;
      __int16 v21 = 1024;
      int v22 = a3;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Failed to create the reporting stats dictionary. captureSourceID=%d", buf, 0x22u);
    }
  }
  return Mutable;
}

uint64_t __59__VCVideoCaptureServer_copyReportingStatsForCaptureSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addStreamInputStatsToDict:*(void *)(a1 + 40) captureSource:*(unsigned int *)(a1 + 48)];
}

void __59__VCVideoCaptureServer_copyReportingStatsForCaptureSource___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int v1 = *(_DWORD *)(a1 + 48);
  if (v1 <= 9)
  {
    if (((1 << v1) & 0x3F5) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        uint64_t v4 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v5 = *(_DWORD *)(a1 + 48);
          int v10 = 136315906;
          uint64_t v11 = v3;
          __int16 v12 = 2080;
          char v13 = "-[VCVideoCaptureServer copyReportingStatsForCaptureSource:]_block_invoke_2";
          __int16 v14 = 1024;
          int v15 = 4424;
          __int16 v16 = 1024;
          int v17 = v5;
          _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Requesting reporting stats for unsupported captureSourceID=%d", (uint8_t *)&v10, 0x22u);
        }
      }
    }
    else if (v1 == 1)
    {
      unsigned int v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      [v6 addScreenStatsToDict:v7];
    }
    else if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = *(void **)(*(void *)(a1 + 32) + 328);
      [v9 getReportingStats:v8];
    }
  }
}

- (__CFDictionary)copyRealtimeStatsDictionary
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (objc_opt_respondsToSelector()) {
    [(VCVideoSource *)self->avCapture getReportingStats:Mutable];
  }
  [(VCVideoCaptureServer *)self addScreenStatsToDict:Mutable];
  return Mutable;
}

- (__CFDictionary)copyInitialStatsDictionary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VCVideoCaptureServer_copyInitialStatsDictionary__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(captureServerQueue, block);
  uint64_t v4 = (__CFDictionary *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __50__VCVideoCaptureServer_copyInitialStatsDictionary__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 328);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    return [v3 retrieveInitialReportingStats:v4];
  }
  return result;
}

- (void)addStreamInputStatsToDict:(__CFDictionary *)a3 captureSource:(int)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_streamInputCaptureSources objectForKeyedSubscript:v6];
  if (v7)
  {
    uint64_t v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputs, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "streamInputID")));
    if (v8)
    {
      CFDictionaryRef v9 = (const __CFDictionary *)[v8 reportingStats];
      VCUtil_AppendFromDictionary(a3, v9);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315906;
      uint64_t v13 = v10;
      __int16 v14 = 2080;
      int v15 = "-[VCVideoCaptureServer addStreamInputStatsToDict:captureSource:]";
      __int16 v16 = 1024;
      int v17 = 4459;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Stream input capture source doesn't exist. captureSourceID=%@", (uint8_t *)&v12, 0x26u);
    }
  }
}

- (void)addScreenStatsToDict:(__CFDictionary *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  screenShareCaptureConfig = self->_screenShareCaptureConfig;
  if (screenShareCaptureConfig)
  {
    int v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](screenShareCaptureConfig, "objectForKeyedSubscript:", @"ScreenCaptureIsWindowed"), "BOOLValue");
    uint64_t v6 = v5 ^ 1u;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        CFDictionaryRef v9 = "YES";
        *(_DWORD *)uint64_t v10 = 136315906;
        *(void *)&v10[4] = v7;
        *(_WORD *)&v10[12] = 2080;
        *(void *)&v10[14] = "-[VCVideoCaptureServer addScreenStatsToDict:]";
        if (v5) {
          CFDictionaryRef v9 = "NO";
        }
        *(_WORD *)&v10[22] = 1024;
        int v11 = 4473;
        __int16 v12 = 2080;
        uint64_t v13 = v9;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d isFullScreen=%s", v10, 0x26u);
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CFDictionaryAddValue(a3, @"ScreenSharingIsFullScreen", (const void *)objc_msgSend(NSNumber, "numberWithBool:", v6, *(_OWORD *)v10, *(void *)&v10[16]));
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a5->var1)
  {
    BOOL var3 = a5->var3;
    uint64_t var2 = a5->var2;
    BOOL var4 = a5->var4;
    CMTime v10 = *(CMTime *)a4;
    VCVideoCaptureServer_OnCaptureVideoFrame((uint64_t)self, a3, &v10, var3, var2, var4);
  }
  else
  {
    uint64_t var5 = a5->var5;
    CMTime v10 = *(CMTime *)a4;
    [(VCVideoCaptureServer *)self onCaptureScreenFrame:a3 frameTime:&v10 orientation:var5];
  }
  return 1;
}

uint64_t __49__VCVideoCaptureServer_sourceFrameRateDidChange___block_invoke_385(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) sourceFrameRateDidChange:*(unsigned int *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (AVConferencePreviewDelegate)appDelegate
{
  return self->appDelegate;
}

- (void)setAppDelegate:(id)a3
{
}

- (tagAVConferencePreviewDelegateRealtimeRealtimeInstanceVTable)delegateFunctions
{
  return self->delegateFunctions;
}

- (void)setDelegateFunctions:(tagAVConferencePreviewDelegateRealtimeRealtimeInstanceVTable)a3
{
  self->delegateFunctions = a3;
}

- (BOOL)followSystemCamera
{
  return self->_followSystemCamera;
}

- (BOOL)is1080pCameraAvailable
{
  return self->_is1080pCameraAvailable;
}

- (_VCVideoSourceToken)currentVideoSourceToken
{
  return self->_currentVideoSourceToken;
}

void ___VCVideoCaptureServer_SendSnapshotFromFrame_block_invoke(uint64_t a1)
{
  void block[5] = *MEMORY[0x1E4F143B8];
  id v2 = +[VideoUtil convertPixelBuffer:*(void *)(a1 + 40) toImageType:0 withAssetIdentifier:0 cameraStatusBits:0 allowTimeMetaData:1];
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v2, @"snapShotFrame", 0);
  if (v3)
  {
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 296);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___VCVideoCaptureServer_SendSnapshotFromFrame_block_invoke_785;
    block[3] = &unk_1E6DB3DC8;
    void block[4] = v3;
    dispatch_async(v4, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      ___VCVideoCaptureServer_SendSnapshotFromFrame_block_invoke_cold_1();
    }
  }
}

uint64_t ___VCVideoCaptureServer_SendSnapshotFromFrame_block_invoke_785(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"previewDidGetSnapShot" arguments:v3];
}

uint64_t ___VCVideoCaptureServer_DidReceiveFirstPreviewFrame_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 384))
  {
    id v2 = *(uint64_t (**)(void, void))(v1 + 392);
    if (v2) {
      return v2(*(void *)(v1 + 384), *(void *)(result + 40));
    }
  }
  return result;
}

uint64_t ___VCVideoCaptureServer_DidReceiveFirstPreviewFrame_block_invoke_791(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"previewDidReceiveFirstFrame" arguments:v3];
}

uint64_t ___VCVideoCaptureServer_ProcessFrameSizeChange_block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 384);
    return [v4 didChangeLocalVideoAttributes:v3];
  }
  return result;
}

uint64_t ___VCVideoCaptureServer_ProcessFrameSizeChange_block_invoke_793(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"previewDidLocalVideoAttributesChange" arguments:v3];
}

uint64_t ___VCVideoCaptureServer_ProcessCaptureSampleBuffer_block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v2;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "_VCVideoCaptureServer_ProcessCaptureSampleBuffer_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        int v39 = 1725;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d sending frame to VideoConference", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      ___VCVideoCaptureServer_ProcessCaptureSampleBuffer_block_invoke_cold_1();
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v35;
    *(void *)&long long v7 = 136315650;
    long long v23 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ([v11 prepareVideoFrame:*(void *)(a1 + 40)] & 1) == 0
          && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          uint64_t v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            *(void *)&uint8_t buf[4] = v12;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = "_VCVideoCaptureServer_ProcessCaptureSampleBuffer_block_invoke";
            *(_WORD *)&buf[22] = 1024;
            int v39 = 1732;
            _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d prepareVideoFrame returned an error", buf, 0x1Cu);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v34 objects:v33 count:16];
    }
    while (v8);
  }
  char v14 = *(unsigned char *)(a1 + 72);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v15 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v28, 16, v23);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        uint64_t v21 = *(void *)(a1 + 40);
        *(_OWORD *)buf = *(_OWORD *)(a1 + 48);
        *(void *)&buf[16] = *(void *)(a1 + 64);
        v24[0] = 0;
        v24[1] = 0;
        char v25 = v14;
        __int16 v26 = 0;
        char v27 = 0;
        [v20 onVideoFrame:v21 frameTime:buf attribute:v24];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v28 count:16];
    }
    while (v17);
  }
  return FigSampleBufferRelease();
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d done initialization of singleton", v2, v3, v4, v5, v6);
}

void __28__VCVideoCaptureServer_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCVideoCaptureServer init]_block_invoke";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d frameBecameAvailableCount returned error 0x%x", v2, *(const char **)v3, (unint64_t)"-[VCVideoCaptureServer init]_block_invoke" >> 16, 479);
}

- (void)isAirPlayXPCHelper
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d proc_pidinfo failed", v2, v3, v4, v5, v6);
}

void __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d VCCameraPreview not found. Cannot start preview before initialize.", v2, v3, v4, v5, v6);
}

void __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_88_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d VCCameraPreview not found. Cannot pause preview before initialize.", v2, v3, v4, v5, v6);
}

void __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_118_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid camera facing and frameRect arguments", v2, v3, v4, v5, v6);
}

void __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_118_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid fenceHandle value", v2, v3, v4, v5, v6);
}

void __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_118_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid frameRect value", v2, v3, v4, v5, v6);
}

- (void)createVideoCaptureWithWidth:height:frameRate:useBackFacingCamera:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Error no camera available! camera name = %@");
}

- (void)handleAVCaptureError:error:.cold.1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Camera is not valid. _currentVideoSourceToken = 0x%x", v2, v3, v4, v5);
}

- (void)handleAVCaptureError:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d notifying clients of avcapture error", v2, v3, v4, v5, v6);
}

- (void)handleAVCaptureError:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d notifying app of acvapture error", v2, v3, v4, v5, v6);
}

void __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid camera, _currentVideoSourceToken=0x%x", v2, v3, v4, v5);
}

void __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*v2 UTF8String];
  int v4 = 136315906;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  int v6 = 1339;
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, v3, "VCVideoCaptureServer [%s] %s:%d received %s", (uint8_t *)&v4);
}

void __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid camera, _currentVideoSourceToken=0x%x", v2, v3, v4, v5);
}

void __60__VCVideoCaptureServer_registerCaptureClientForScreenShare___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Attempting to register a nil client", v2, v3, v4, v5, v6);
}

- (void)deregisterCaptureClientForScreenShare:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Attempting to deregister a nil client", v2, v3, v4, v5, v6);
}

void __60__VCVideoCaptureServer_registerSystemAudioConfig_forSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d client not found in config for source=%d", v2, v3, v4, v5);
}

void __62__VCVideoCaptureServer_deregisterSystemAudioConfig_forSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d client not found in config for source=%d", v2, v3, v4, v5);
}

- (void)dispatchedStartSystemAudioForClientKey:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d No audio config found for clientKey=%@.");
}

- (void)dispatchedStartSystemAudioForClientKey:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to create system audio capture object for clientKey=%@.");
}

- (void)dispatchedStartSystemAudioForClientKey:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to start system audio capture clientKey=%@.");
}

- (void)dispatchedStopSystemAudioForClientKey:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to find system audio capture object for clientKey=%@.");
}

- (void)setupScreenCaptureForSource:config:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to create screen capture object (iOS)", v2, v3, v4, v5, v6);
}

- (void)dispatchedUpdateCaptureRuleForClient:width:height:frameRate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to allocate video rule", v2, v3, v4, v5, v6);
}

- (void)registerForVideoFramesFromSource:sourceConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid VCCaptureSource", v2, v3, v4, v5, v6);
}

void __70__VCVideoCaptureServer_deregisterForVideoFramesFromSource_withClient___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid VCCaptureSource", v2, v3, v4, v5, v6);
}

void __68__VCVideoCaptureServer_isClientRegisteredForVideoFrames_fromSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid VCCaptureSource", v2, v3, v4, v5, v6);
}

void __66__VCVideoCaptureServer_setScreenCaptureFrameRate_captureSourceID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d No screen capture object found", v2, v3, v4, v5, v6);
}

void __66__VCVideoCaptureServer_setScreenCaptureFrameRate_captureSourceID___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to set screen capture frame rate", v2, v3, v4, v5, v6);
}

- (void)setUpScreenVideoCaptureSource:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d No Capture configuration, bailing set up screen capture source", v2, v3, v4, v5, v6);
}

- (void)setUpScreenVideoCaptureSource:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to create screen capture object (iOS)", v2, v3, v4, v5, v6);
}

- (void)setUpScreenVideoCaptureSource:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*v2 count];
  int v4 = 136315906;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_5_1();
  uint8_t v6 = "-[VCVideoCaptureServer setUpScreenVideoCaptureSource:]";
  OUTLINED_FUNCTION_3();
  int v7 = 2977;
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, v3, "VCVideoCaptureServer [%s] %s:%d screenCaptures=%lu already created", (uint8_t *)&v4);
}

- (void)setUpScreenVideoCaptureSource:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  LODWORD(v6) = 2976;
  WORD2(v6) = 2048;
  HIWORD(v6) = v0;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v1, v2, "VCVideoCaptureServer [%s] %s:%d screenCapture=%p already created", v3, v4, v5, v6);
}

void __48__VCVideoCaptureServer_startScreenShareCapture___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to start screen capture due to empty client list or no screen capture object", v2, v3, v4, v5, v6);
}

void __48__VCVideoCaptureServer_startScreenShareCapture___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to set up the screen capture source", v2, v3, v4, v5, v6);
}

void __47__VCVideoCaptureServer_stopScreenShareCapture___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to stop a screen capture as we don't have a screen capture object", v2, v3, v4, v5, v6);
}

void __55__VCVideoCaptureServer_updateScreenCapture_withConfig___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d No Capture configuration", v2, v3, v4, v5, v6);
}

void __55__VCVideoCaptureServer_updateScreenCapture_withConfig___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Updating screen sharing configuration is currently not supported for this use case", v2, v3, v4, v5, v6);
}

- (void)setupStreamInputs
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to allocate stream input capture source dictionary", v2, v3, v4, v5, v6);
}

void __60__VCVideoCaptureServer_registerVideoSink_withCaptureSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Missing stream input capture source. captureSourceID=%d", v2, v3, v4, v5);
}

void __62__VCVideoCaptureServer_unregisterVideoSink_withCaptureSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Missing stream input capture source. captureSourceID=%d", v2, v3, v4, v5);
}

void __59__VCVideoCaptureServer_suspendVideoSink_withCaptureSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Missing stream input capture source. captureSourceID=%d", v2, v3, v4, v5);
}

void __58__VCVideoCaptureServer_resumeVideoSink_withCaptureSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Missing stream input capture source. captureSourceID=%d", v2, v3, v4, v5);
}

void __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to allocate the stream input capture source", v2, v3, v4, v5, v6);
}

void __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Format doesn't match. streamInputID=%@");
}

void __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Format doesn't match", v2, v3, v4, v5, v6);
}

void __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Stream input capture source already registered. newCaptureSourceID=%@");
}

void __78__VCVideoCaptureServer_unregisterStreamInputCaptureSourceWithCaptureSourceID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Stream input capture source doesn't exist. captureSourceID=%@");
}

- (void)internalRegisterStreamInput:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Format doesn't match. captureSourceID=%@");
}

- (void)internalRegisterStreamInput:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Stream input already registered. StreamInputID=%@");
}

- (void)internalRegisterStreamInput:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [v2 streamInputID];
  int v4 = 136315906;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_5_1();
  uint8_t v6 = "-[VCVideoCaptureServer internalRegisterStreamInput:]";
  OUTLINED_FUNCTION_3();
  int v7 = 3371;
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, v3, "VCVideoCaptureServer [%s] %s:%d Stream input is invalid. StreamInputID=%@", (uint8_t *)&v4);
}

- (void)internalUnregisterStreamInput:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Stream input not registered. StreamInputID=%@");
}

- (void)internalUnregisterStreamInput:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Different stream input registered with the stream input ID", v2, v3, v4, v5, v6);
}

- (void)internalUnregisterStreamInput:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [v2 streamInputID];
  int v4 = 136315906;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_5_1();
  uint8_t v6 = "-[VCVideoCaptureServer internalUnregisterStreamInput:]";
  OUTLINED_FUNCTION_3();
  int v7 = 3397;
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, v3, "VCVideoCaptureServer [%s] %s:%d Stream input is invalid. StreamInputID=%@", (uint8_t *)&v4);
}

void __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d notifying clients of video attributes change", v2, v3, v4, v5, v6);
}

void __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d notifying app of video attributes change", v2, v3, v4, v5, v6);
}

void __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d notifying clients of video attributes change", v2, v3, v4, v5, v6);
}

void __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d notifying app of video attributes change", v2, v3, v4, v5, v6);
}

- (void)dispatchedSetCaptureCameraWithToken:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid cameraUID", v2, v3, v4, v5, v6);
}

- (void)setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCVideoCaptureServer setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Fail to set layer size for queue=%p", v2, *(const char **)v3, (unint64_t)"-[VCVideoCaptureServer setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:]" >> 16, v4);
}

- (void)setLocalVideoDestination:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid VCLocalDestinationConfig config", v2, v3, v4, v5, v6);
}

void __49__VCVideoCaptureServer_setLocalVideoDestination___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCVideoCaptureServer setLocalVideoDestination:]_block_invoke";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Fail to set layer size for queue=%p", v2, *(const char **)v3, (unint64_t)"-[VCVideoCaptureServer setLocalVideoDestination:]_block_invoke" >> 16, v4);
}

void __63__VCVideoCaptureServer_startPreviewWithWidth_height_frameRate___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)(*(void *)a2 + 8);
  int v4 = *(_DWORD *)(*(void *)a2 + 12);
  int v5 = *(_DWORD *)(*(void *)a2 + 16);
  int v6 = 136316418;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = "-[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:]_block_invoke";
  __int16 v10 = 1024;
  int v11 = 4053;
  __int16 v12 = 1024;
  int v13 = v3;
  __int16 v14 = 1024;
  int v15 = v4;
  __int16 v16 = 1024;
  int v17 = v5;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d error starting preview %d %d %d", (uint8_t *)&v6, 0x2Eu);
}

void __63__VCVideoCaptureServer_startPreviewWithWidth_height_frameRate___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d error creating AVCapture handle", v2, v3, v4, v5, v6);
}

void ___VCVideoCaptureServer_SendSnapshotFromFrame_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to create XPC snapshot frame", v2, v3, v4, v5, v6);
}

void ___VCVideoCaptureServer_ProcessCaptureSampleBuffer_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, "VCVideoCaptureServer [%s] %s:%d sending frame to VideoConference", v2, v3, v4, v5, v6);
}

@end