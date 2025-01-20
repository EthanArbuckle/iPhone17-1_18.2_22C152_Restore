@interface AVConferencePreview
+ (BOOL)isEyeContactSupported;
+ (id)AVConferencePreviewSingleton;
- (AVConferencePreview)allocWithZone:(_NSZone *)a3;
- (AVConferencePreview)init;
- (AVConferencePreviewClientDelegate)delegate;
- (BOOL)isCameraZoomAvailable;
- (BOOL)isPreviewRunning;
- (BOOL)setRootPreviewLayer:(id)a3 front:(BOOL)a4;
- (double)currentZoomFactor;
- (double)maxZoomFactor;
- (id)localCameraUID;
- (id)localScreenAttributesForVideoAttributes:(id)a3;
- (id)localVideoAttributes;
- (id)localVideoLayer:(BOOL)a3;
- (id)newXPCObjectForFenceHandle:(id *)a3 forLayerHost:(id)a4;
- (unint64_t)retainCount;
- (unsigned)localCamera;
- (void)beginPIPToPreviewAnimation;
- (void)beginPreviewToPIPAnimation;
- (void)cameraCFramingAvailabilityDidChange:(BOOL)a3;
- (void)cameraDidBecomeAvailableForUniqueID:(id)a3;
- (void)cameraDidBecomeInterruptedForForUniqueID:(id)a3 reason:(int64_t)a4;
- (void)cameraZoomAvailabilityDidChange:(BOOL)a3 currentZoomFactor:(double)a4 maxZoomFactor:(double)a5;
- (void)cleanupPreviewLayerHost:(id *)a3;
- (void)connectLayer:(id)a3 layerHost:(id)a4 withContextId:(unsigned int)a5;
- (void)connectLayer:(id)a3 withSlot:(unsigned int)a4;
- (void)createPreviewCALayerHostForRootLayer:(id)a3 withContextId:(unsigned int)a4 front:(BOOL)a5;
- (void)currentZoomFactor;
- (void)dealloc;
- (void)deregisterBlocksForDelegateNotifications;
- (void)didChangeLocalCameraUID:(id)a3;
- (void)didChangeLocalScreenAttributes:(id)a3;
- (void)didChangeLocalVideoAttributes:(id)a3;
- (void)didGetSnapshot:(id)a3;
- (void)didPausePreview;
- (void)didReceiveCommError;
- (void)didReceiveErrorFromCameraUniqueID:(id)a3 error:(id)a4;
- (void)didStartPreview;
- (void)didStopPreview;
- (void)endPIPToPreviewAnimation;
- (void)endPreviewToPIPAnimation;
- (void)followSystemCameraDidChange:(BOOL)a3;
- (void)getSnapshot;
- (void)isCameraZoomAvailable;
- (void)isPreviewRunning;
- (void)maxZoomFactor;
- (void)notifyCenterStageEnabled:(BOOL)a3;
- (void)pausePreview;
- (void)registerBlocksForDelegateNotifications;
- (void)resetLayersAfterServerDisconnect;
- (void)resetLocalCameraAfterServerDisconnect;
- (void)restartPreview;
- (void)setBounds:(CGRect)a3 forLayerHost:(id)a4;
- (void)setCameraZoomFactor:(double)a3;
- (void)setCameraZoomFactor:(double)a3 withRate:(double)a4;
- (void)setCinematicFramingEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFollowSystemCameraEnabled:(BOOL)a3;
- (void)setLocalCamera:(unsigned int)a3;
- (void)setLocalCameraWithUID:(id)a3;
- (void)setLocalScreenAttributes:(id)a3;
- (void)setLocalVideoAttributes:(id)a3;
- (void)setLocalVideoLayer:(id)a3 front:(BOOL)a4;
- (void)setLocalVideoLayerHost:(id)a3 front:(BOOL)a4;
- (void)startPreview;
- (void)startPreviewUnpausing:(BOOL)a3;
- (void)stopPreview;
@end

@implementation AVConferencePreview

id __37__AVConferencePreview_localCameraUID__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 144);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_3_123(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!(a3 | result))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 121) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"previewCameraZoomAvailabilty"), "BOOLValue");
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"previewCameraZoomMaxFactor"), "floatValue");
    *(double *)(*(void *)(a1 + 32) + 128) = v7;
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"previewCameraZoomMaxFactor"), "floatValue");
    *(double *)(*(void *)(a1 + 32) + 136) = v8;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(unsigned __int8 *)(v9 + 121);
    double v11 = *(double *)(v9 + 128);
    double v12 = *(double *)(v9 + 136);
    return [(id)v9 cameraZoomAvailabilityDidChange:v10 currentZoomFactor:v11 maxZoomFactor:v12];
  }
  return result;
}

- (id)localCameraUID
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  float v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__33;
  uint64_t v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__AVConferencePreview_localCameraUID__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(avConferencePreviewQueue, block);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (!(a3 | [a2 objectForKeyedSubscript:@"SERVERDIED"]))
  {
    uint64_t v6 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", [a2 objectForKeyedSubscript:@"localVideoAttributes"]);
    v5 = *(void **)(*(void *)(a1 + 32) + 56);
    *(void *)(*(void *)(a1 + 32) + 56) = v6;

    [*(id *)(a1 + 32) didChangeLocalVideoAttributes:v6];
  }
}

uint64_t __53__AVConferencePreview_didChangeLocalVideoAttributes___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        int v7 = 136316162;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        uint64_t v10 = "-[AVConferencePreview didChangeLocalVideoAttributes:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 226;
        __int16 v13 = 2048;
        uint64_t v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v6;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d (%p) videoAttributes=%@", (uint8_t *)&v7, 0x30u);
      }
    }
    return [*(id *)(*(void *)(a1 + 32) + 96) didChangeLocalVideoAttributes:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)didChangeLocalVideoAttributes:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AVConferencePreview_didChangeLocalVideoAttributes___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

VideoAttributes *__43__AVConferencePreview_localVideoAttributes__block_invoke(uint64_t a1)
{
  uint64_t result = +[VideoAttributes videoAttributesWithVideoAttributes:*(void *)(*(void *)(a1 + 32) + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)AVConferencePreviewSingleton
{
  uint64_t v3 = objc_opt_class();
  objc_sync_enter(v3);
  if (!_avConferencePreviewSingleton) {
    _avConferencePreviewSingleton = (uint64_t)objc_alloc_init((Class)a1);
  }
  objc_sync_exit(v3);
  return (id)_avConferencePreviewSingleton;
}

- (AVConferencePreview)init
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)AVConferencePreview;
  v2 = [(AVConferencePreview *)&v21 init];
  if (v2)
  {
    VRTraceReset();
    v2->clientWantsPreview = 0;
    v2->connectionAttempts = 0;
    v2->connection = (AVConferenceXPCClient *)+[AVConferenceXPCClient AVConferenceXPCClientSingleton];
    v2->caLayerFront = 0;
    v2->caLayerBack = 0;
    [(AVConferencePreview *)v2 cleanupPreviewLayerHost:&v2->_caLayerHostFront];
    [(AVConferencePreview *)v2 cleanupPreviewLayerHost:&v2->_caLayerHostBack];
    v2->localVideoAttributes = 0;
    v2->localScreenPortraitAspectRatio = (CGSize)xmmword_1E25A1EB0;
    v2->localScreenLandscapeAspectRatio = (CGSize)xmmword_1E25A1EC0;
    v2->delegate = 0;
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->avConferencePreviewQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.camera", 0, CustomRootQueue);
    v4 = VCDispatchQueue_GetCustomRootQueue(37);
    v2->avConferencePreviewNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.camera.notification", 0, v4);
    id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v6 = objc_msgSend(v5, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], @"CACHEAUTHTOKEN", 0);
    id v7 = [(AVConferenceXPCClient *)v2->connection sendMessageSync:"previewInitialize" arguments:v6];
    if ([v7 objectForKeyedSubscript:@"localVideoAttributes"]) {
      uint64_t v8 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", [v7 objectForKeyedSubscript:@"localVideoAttributes"]);
    }
    else {
      uint64_t v8 = objc_alloc_init(VideoAttributes);
    }
    v2->localVideoAttributes = v8;
    v2->_BOOL isPreviewRunning = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"previewState"), "BOOLValue");
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    uint64_t v10 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        BOOL isPreviewRunning = v2->_isPreviewRunning;
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = v11;
        __int16 v24 = 2080;
        v25 = "-[AVConferencePreview init]";
        __int16 v26 = 1024;
        int v27 = 728;
        __int16 v28 = 1024;
        LODWORD(v29) = isPreviewRunning;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d _isPreviewRunning=%d", buf, 0x22u);
      }
    }
    v2->_localCameraUID = (NSString *)(id)[v7 objectForKeyedSubscript:@"localCameraUIDString"];

    [(AVConferencePreview *)v2 registerBlocksForDelegateNotifications];
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v23 = v14;
        __int16 v24 = 2080;
        v25 = "-[AVConferencePreview init]";
        __int16 v26 = 1024;
        int v27 = 742;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d VICEROY_FEATURE_CINEMATICFRAMING", buf, 0x1Cu);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = v16;
        __int16 v24 = 2080;
        v25 = "-[AVConferencePreview init]";
        __int16 v26 = 1024;
        int v27 = 744;
        __int16 v28 = 2048;
        v29 = v2;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Done initialization of singleton %p", buf, 0x26u);
      }
    }
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVConferencePreview-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = v18;
        __int16 v24 = 2080;
        v25 = "-[AVConferencePreview init]";
        __int16 v26 = 1024;
        int v27 = 746;
        __int16 v28 = 2048;
        v29 = v2;
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-init (%p)", buf, 0x26u);
      }
    }
  }
  return v2;
}

- (void)cleanupPreviewLayerHost:(id *)a3
{
  if (*a3)
  {
    [*a3 removeFromSuperlayer];

    *a3 = 0;
  }
}

void __48__AVConferencePreview_setLocalVideoLayer_front___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setRootPreviewLayer:*(void *)(a1 + 40) front:*(unsigned __int8 *)(a1 + 48)];
  v2 = (void *)[objc_alloc(NSNumber) initWithBool:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v2, @"videoSlotFacing", 0);
  v8[0] = MEMORY[0x1E4F143A8];
  char v4 = *(unsigned char *)(a1 + 48);
  int8x16_t v5 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 8);
  v8[1] = 3221225472;
  v8[2] = __48__AVConferencePreview_setLocalVideoLayer_front___block_invoke_2;
  v8[3] = &unk_1E6DB8E38;
  char v10 = v4;
  int8x16_t v9 = v5;
  [v7 sendMessageAsync:"previewGetLocalVideoSlot" arguments:v3 reply:v8 queue:*(void *)(v6 + 104)];
}

void __35__AVConferencePreview_startPreview__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      char v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v14 = v3;
        __int16 v15 = 2080;
        uint64_t v16 = "-[AVConferencePreview startPreview]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 809;
        int8x16_t v5 = "AVConferencePreview [%s] %s:%d ";
        uint64_t v6 = v4;
        uint32_t v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int8x16_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136316162;
        uint64_t v14 = v8;
        __int16 v15 = 2080;
        uint64_t v16 = "-[AVConferencePreview startPreview]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 809;
        __int16 v19 = 2112;
        v20 = v2;
        __int16 v21 = 2048;
        uint64_t v22 = v10;
        int8x16_t v5 = "AVConferencePreview [%s] %s:%d %@(%p) ";
        uint64_t v6 = v9;
        uint32_t v7 = 48;
        goto LABEL_11;
      }
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  int v12 = objc_msgSend(v11, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], @"CACHEAUTHTOKEN", 0);
  [*(id *)(*(void *)(a1 + 32) + 8) sendMessageAsync:"previewStartPreview" arguments:v12 reply:0];
}

uint64_t __50__AVConferencePreview_setCinematicFramingEnabled___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"previewCameraCinematicFraming";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v4[1] = @"previewCameraCinematicFramingSet";
  v5[0] = v2;
  v5[1] = MEMORY[0x1E4F1CC38];
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewCameraCinematicFraming", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v5, v4, 2), 0);
}

void __47__AVConferencePreview_setLocalVideoAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  *(void *)(*(void *)(a1 + 32) + 56) = *(id *)(a1 + 40);

  id v4 = (id)[*(id *)(a1 + 40) copyEncodedDictionary];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v4, @"localVideoAttributes", 0);
  [*(id *)(*(void *)(a1 + 32) + 8) sendMessageAsync:"previewSetLocalVideoAttributes" arguments:v3 reply:0];
}

- (BOOL)setRootPreviewLayer:(id)a3 front:(BOOL)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a4) {
    uint64_t v5 = 24;
  }
  else {
    uint64_t v5 = 32;
  }
  id v6 = *(Class *)((char *)&self->super.isa + v5);
  if (v6 != a3)
  {
    BOOL v7 = a4;
    uint64_t v9 = 48;
    if (a4) {
      uint64_t v9 = 40;
    }
    [(AVConferencePreview *)self cleanupPreviewLayerHost:(char *)self + v9];
    uint64_t v10 = *(Class *)((char *)&self->super.isa + v5);
    *(Class *)((char *)&self->super.isa + v5) = (Class)a3;

    if ((AVConferencePreview *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        __int16 v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          caLayerFront = self->caLayerFront;
          caLayerBack = self->caLayerBack;
          int v24 = 136316674;
          uint64_t v25 = v12;
          __int16 v26 = 2080;
          int v27 = "-[AVConferencePreview setRootPreviewLayer:front:]";
          __int16 v28 = 1024;
          int v29 = 946;
          __int16 v30 = 2048;
          id v31 = a3;
          __int16 v32 = 1024;
          *(_DWORD *)v33 = v7;
          *(_WORD *)&v33[4] = 2048;
          *(void *)&v33[6] = caLayerFront;
          *(_WORD *)&v33[14] = 2048;
          *(void *)&v33[16] = caLayerBack;
          uint64_t v16 = "AVConferencePreview [%s] %s:%d rootLayer=%p front=%d caLayerFront=%p caLayerBack=%p ";
          __int16 v17 = v13;
          uint32_t v18 = 64;
LABEL_17:
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, v18);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v11 = (__CFString *)[(AVConferencePreview *)self performSelector:sel_logPrefix];
      }
      else {
        id v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v21 = self->caLayerFront;
          uint64_t v22 = self->caLayerBack;
          int v24 = 136317186;
          uint64_t v25 = v19;
          __int16 v26 = 2080;
          int v27 = "-[AVConferencePreview setRootPreviewLayer:front:]";
          __int16 v28 = 1024;
          int v29 = 946;
          __int16 v30 = 2112;
          id v31 = v11;
          __int16 v32 = 2048;
          *(void *)v33 = self;
          *(_WORD *)&v33[8] = 2048;
          *(void *)&v33[10] = a3;
          *(_WORD *)&v33[18] = 1024;
          *(_DWORD *)&v33[20] = v7;
          __int16 v34 = 2048;
          v35 = v21;
          __int16 v36 = 2048;
          v37 = v22;
          uint64_t v16 = "AVConferencePreview [%s] %s:%d %@(%p) rootLayer=%p front=%d caLayerFront=%p caLayerBack=%p ";
          __int16 v17 = v20;
          uint32_t v18 = 84;
          goto LABEL_17;
        }
      }
    }
  }
  return v6 != a3;
}

- (void)registerBlocksForDelegateNotifications
{
  v19[5] = *MEMORY[0x1E4F143B8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke;
  v19[3] = &unk_1E6DB4338;
  v19[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewDidReceiveFirstFrame" block:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_81;
  v18[3] = &unk_1E6DB4338;
  v18[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewCameraUIDChanged" block:v18 queue:self->avConferencePreviewQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_83;
  v17[3] = &unk_1E6DB4338;
  v17[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewDidStart" block:v17 queue:self->avConferencePreviewQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_88;
  v16[3] = &unk_1E6DB4338;
  v16[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewDidPause" block:v16 queue:self->avConferencePreviewQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_90;
  v15[3] = &unk_1E6DB4338;
  v15[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewDidStop" block:v15 queue:self->avConferencePreviewQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_92;
  v14[3] = &unk_1E6DB4338;
  v14[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewDidGetSnapShot" block:v14 queue:self->avConferencePreviewQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_2;
  v13[3] = &unk_1E6DB4338;
  v13[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewDidLocalVideoAttributesChange" block:v13 queue:self->avConferencePreviewQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_3;
  v12[3] = &unk_1E6DB4338;
  v12[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewDidLocalScreenAttributesChange" block:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_4;
  v11[3] = &unk_1E6DB4338;
  v11[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewDidReceiveCameraError" block:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5;
  v10[3] = &unk_1E6DB4338;
  v10[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewDidLocalVideoSlotChange" block:v10 queue:self->avConferencePreviewQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_111;
  v9[3] = &unk_1E6DB4338;
  v9[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewDidLocalVideoContextChange" block:v9 queue:self->avConferencePreviewQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_116;
  v8[3] = &unk_1E6DB4338;
  void v8[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewCameraDidBecomeAvailable" block:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_2_118;
  v7[3] = &unk_1E6DB4338;
  v7[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewCameraDidBecomeInterrupted" block:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_3_123;
  v6[3] = &unk_1E6DB4338;
  v6[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewCameraZoomAvailablilty" block:v6 queue:self->avConferencePreviewQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_4_131;
  void v5[3] = &unk_1E6DB4338;
  v5[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewCameraCinematicFramingAvailablilty" block:v5 queue:self->avConferencePreviewQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5_136;
  v4[3] = &unk_1E6DB4338;
  v4[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"updatePreviewState" block:v4 queue:self->avConferencePreviewQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_141;
  v3[3] = &unk_1E6DB4338;
  v3[4] = self;
  [(AVConferenceXPCClient *)self->connection registerBlockForService:"previewFollowSystemCameraDidChange" block:v3 queue:self->avConferencePreviewQueue];
}

uint64_t __45__AVConferencePreview_connectLayer_withSlot___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  objc_msgSend(MEMORY[0x1E4F39CF8], "activateBackground:", objc_msgSend(MEMORY[0x1E4F29060], "isMainThread") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "setContents:", objc_msgSend(MEMORY[0x1E4F39B58], "objectForSlot:", *(unsigned int *)(a1 + 40)));
  uint64_t v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 commit];
}

- (void)setLocalVideoAttributes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    id v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        BOOL v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        BOOL v7 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = v5;
      __int16 v12 = 2080;
      __int16 v13 = "-[AVConferencePreview setLocalVideoAttributes:]";
      __int16 v14 = 1024;
      int v15 = 1300;
      __int16 v16 = 2080;
      __int16 v17 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d videoAttrs=%s", buf, 0x26u);
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__AVConferencePreview_setLocalVideoAttributes___block_invoke;
  v9[3] = &unk_1E6DB3E40;
  v9[4] = self;
  void v9[5] = a3;
  dispatch_async(avConferencePreviewQueue, v9);
}

void __48__AVConferencePreview_setLocalVideoLayer_front___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__AVConferencePreview_setLocalVideoLayer_front___block_invoke_2_cold_1();
      }
    }
  }
  else
  {
    id v4 = (void *)[a2 objectForKeyedSubscript:@"videoSlotNumber"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      id v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v7 = *(void **)(a1 + 32);
        uint64_t v8 = [v7 name];
        int v9 = *(unsigned __int8 *)(a1 + 48);
        int v10 = 136316674;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "-[AVConferencePreview setLocalVideoLayer:front:]_block_invoke_2";
        __int16 v14 = 1024;
        int v15 = 973;
        __int16 v16 = 2112;
        __int16 v17 = v4;
        __int16 v18 = 2048;
        uint64_t v19 = v7;
        __int16 v20 = 2112;
        uint64_t v21 = v8;
        __int16 v22 = 1024;
        int v23 = v9;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Received slot %@ for layer %p named \"%@\" facing %d", (uint8_t *)&v10, 0x40u);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "connectLayer:withSlot:", *(void *)(a1 + 32), objc_msgSend(v4, "unsignedIntValue"));
  }
}

uint64_t ___AVConferencePreview_DidReceiveFirstPreviewFrameFromCamera_block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[VideoAttributes videoAttributeCameraForCameraUID:*(void *)(a1 + 32)];
  if (objc_opt_respondsToSelector())
  {
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVConferencePreview-didReceiveFirstPreviewFrameFromCamera");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      id v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v5 = *(void *)(a1 + 40);
        int v12 = 136316162;
        uint64_t v13 = v3;
        __int16 v14 = 2080;
        int v15 = "_AVConferencePreview_DidReceiveFirstPreviewFrameFromCamera_block_invoke";
        __int16 v16 = 1024;
        int v17 = 202;
        __int16 v18 = 2048;
        uint64_t v19 = v5;
        __int16 v20 = 2112;
        uint64_t v21 = v6;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-didReceiveFirstPreviewFrameFromCamera (%p) cameraUID=%@", (uint8_t *)&v12, 0x30u);
      }
    }
    [*(id *)(*(void *)(a1 + 40) + 96) didReceiveFirstPreviewFrameFromCamera:v2];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVConferencePreview-didReceiveFirstPreviewFrameFromCameraUniqueID");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        int v12 = 136316162;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        int v15 = "_AVConferencePreview_DidReceiveFirstPreviewFrameFromCamera_block_invoke";
        __int16 v16 = 1024;
        int v17 = 206;
        __int16 v18 = 2048;
        uint64_t v19 = v10;
        __int16 v20 = 2112;
        uint64_t v21 = v11;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-didReceiveFirstPreviewFrameFromCameraUniqueID (%p) cameraUID=%@", (uint8_t *)&v12, 0x30u);
      }
    }
    return [*(id *)(*(void *)(a1 + 40) + 96) didReceiveFirstPreviewFrameFromCameraUniqueID:*(void *)(a1 + 32)];
  }
  return result;
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3 | [a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        int v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          int v19 = 136316162;
          uint64_t v20 = v16;
          __int16 v21 = 2080;
          uint64_t v22 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v23 = 1024;
          int v24 = 558;
          __int16 v25 = 2112;
          *(void *)__int16 v26 = v5;
          *(_WORD *)&v26[8] = 2048;
          *(void *)&v26[10] = v18;
          _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d %@(%p) previewDidLocalVideoSlotChange failed", (uint8_t *)&v19, 0x30u);
        }
      }
    }
  }
  else
  {
    uint64_t v6 = (void *)[a2 objectForKeyedSubscript:@"videoSlotNumber"];
    BOOL v7 = (void *)[a2 objectForKeyedSubscript:@"videoSlotFacing"];
    int v8 = [v7 BOOLValue];
    uint64_t v9 = 32;
    if (v8) {
      uint64_t v9 = 24;
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + v9);
    if (v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        int v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136316418;
          uint64_t v20 = v11;
          __int16 v21 = 2080;
          uint64_t v22 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v23 = 1024;
          int v24 = 565;
          __int16 v25 = 1024;
          *(_DWORD *)__int16 v26 = [v6 intValue];
          *(_WORD *)&v26[4] = 2048;
          *(void *)&v26[6] = v10;
          *(_WORD *)&v26[14] = 1024;
          *(_DWORD *)&v26[16] = [v7 BOOLValue];
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidLocalVideoSlotChange: Received slot %u for layer %p facing %d", (uint8_t *)&v19, 0x32u);
        }
      }
      int v13 = [v7 BOOLValue];
      __int16 v14 = *(char **)(a1 + 32);
      uint64_t v15 = 48;
      if (v13) {
        uint64_t v15 = 40;
      }
      if (*(void *)&v14[v15])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5_cold_2();
          }
        }
      }
      else
      {
        objc_msgSend(v14, "connectLayer:withSlot:", v10, objc_msgSend(v6, "unsignedIntValue"));
      }
    }
  }
}

- (void)connectLayer:(id)a3 withSlot:(unsigned int)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__AVConferencePreview_connectLayer_withSlot___block_invoke;
    v11[3] = &unk_1E6DB3F08;
    v11[4] = a3;
    unsigned int v12 = a4;
    dispatch_async(MEMORY[0x1E4F14428], v11);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      BOOL v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [a3 name];
        *(_DWORD *)buf = 136316418;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        uint64_t v16 = "-[AVConferencePreview connectLayer:withSlot:]";
        __int16 v17 = 1024;
        int v18 = 348;
        __int16 v19 = 1024;
        *(_DWORD *)uint64_t v20 = a4;
        *(_WORD *)&v20[4] = 2048;
        *(void *)&v20[6] = a3;
        __int16 v21 = 2112;
        uint64_t v22 = v8;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Connected slot %u to layer %p named \"%@\"", buf, 0x36u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v14 = v9;
      __int16 v15 = 2080;
      uint64_t v16 = "-[AVConferencePreview connectLayer:withSlot:]";
      __int16 v17 = 1024;
      int v18 = 335;
      __int16 v19 = 2048;
      *(void *)uint64_t v20 = a3;
      *(_WORD *)&v20[8] = 1024;
      *(_DWORD *)&v20[10] = a4;
      _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d Invalid layer or slot: layer=%p, slot=%u", buf, 0x2Cu);
    }
  }
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AVConferencePreview_setCinematicFramingEnabled___block_invoke;
  v7[3] = &unk_1E6DB3DF0;
  BOOL v8 = a3;
  v7[4] = self;
  dispatch_async(avConferencePreviewQueue, v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      unsigned int v12 = "-[AVConferencePreview setCinematicFramingEnabled:]";
      __int16 v13 = 1024;
      int v14 = 1554;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d enabled=%d", buf, 0x22u);
    }
  }
}

- (id)localVideoAttributes
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x3052000000;
  __int16 v13 = __Block_byref_object_copy__33;
  int v14 = __Block_byref_object_dispose__33;
  uint64_t v15 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__AVConferencePreview_localVideoAttributes__block_invoke;
  v9[3] = &unk_1E6DB4540;
  v9[4] = self;
  void v9[5] = &v10;
  dispatch_sync(avConferencePreviewQueue, v9);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    id v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = (void *)v11[5];
      if (v5) {
        uint64_t v6 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      }
      else {
        uint64_t v6 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v3;
      __int16 v18 = 2080;
      __int16 v19 = "-[AVConferencePreview localVideoAttributes]";
      __int16 v20 = 1024;
      int v21 = 1340;
      __int16 v22 = 2080;
      uint64_t v23 = v6;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Returning %s", buf, 0x26u);
    }
  }
  BOOL v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)startPreview
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  id v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      int v14 = "-[AVConferencePreview startPreview]";
      __int16 v15 = 1024;
      int v16 = 805;
      __int16 v17 = 2048;
      __int16 v18 = self;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d self=%p", buf, 0x26u);
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AVConferencePreview_startPreview__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVConferencePreview-startPreview");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      int v14 = "-[AVConferencePreview startPreview]";
      __int16 v15 = 1024;
      int v16 = 826;
      __int16 v17 = 2048;
      __int16 v18 = self;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-startPreview (%p)", buf, 0x26u);
    }
  }
}

- (void)setDelegate:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AVConferencePreview_setDelegate___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

- (void)cameraZoomAvailabilityDidChange:(BOOL)a3 currentZoomFactor:(double)a4 maxZoomFactor:(double)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__AVConferencePreview_cameraZoomAvailabilityDidChange_currentZoomFactor_maxZoomFactor___block_invoke;
  block[3] = &unk_1E6DB8E10;
  BOOL v7 = a3;
  block[4] = self;
  *(double *)&void block[5] = a4;
  *(double *)&void block[6] = a5;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

uint64_t __38__AVConferencePreview_didStartPreview__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVConferencePreview-didStartPreview");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      id v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v6 = 136315906;
        uint64_t v7 = v3;
        __int16 v8 = 2080;
        uint64_t v9 = "-[AVConferencePreview didStartPreview]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 167;
        __int16 v12 = 2048;
        uint64_t v13 = v5;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-didStartPreview (%p)", (uint8_t *)&v6, 0x26u);
      }
    }
    return [*(id *)(*(void *)(a1 + 32) + 96) didStartPreview];
  }
  return result;
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_83(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!(a3 | result))
  {
    uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"videoSlotNumber"];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    uint64_t v9 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 24);
        int v16 = 136316162;
        uint64_t v17 = v10;
        __int16 v18 = 2080;
        uint64_t v19 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 471;
        __int16 v22 = 2112;
        uint64_t v23 = v7;
        __int16 v24 = 2048;
        uint64_t v25 = v12;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidStart: connect layer to preview slot %@ for layer %p", (uint8_t *)&v16, 0x30u);
      }
    }
    if (v7) {
      objc_msgSend(*(id *)(a1 + 32), "connectLayer:withSlot:", *(void *)(*(void *)(a1 + 32) + 24), objc_msgSend(v7, "unsignedIntValue"));
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 120) = 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 120);
        int v16 = 136315906;
        uint64_t v17 = v13;
        __int16 v18 = 2080;
        uint64_t v19 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 477;
        __int16 v22 = 1024;
        LODWORD(v23) = v15;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidStart: _isPreviewRunning=%d", (uint8_t *)&v16, 0x22u);
      }
    }
    return [*(id *)(a1 + 32) didStartPreview];
  }
  return result;
}

- (void)didStartPreview
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__AVConferencePreview_didStartPreview__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(avConferencePreviewNotificationQueue, v3);
  VCPacketFilterGetCMBaseObject("didStartPreview", 2);
}

void __87__AVConferencePreview_cameraZoomAvailabilityDidChange_currentZoomFactor_maxZoomFactor___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(unsigned __int8 *)(a1 + 56);
      int v7 = 136315906;
      uint64_t v8 = v2;
      __int16 v9 = 2080;
      uint64_t v10 = "-[AVConferencePreview cameraZoomAvailabilityDidChange:currentZoomFactor:maxZoomFactor:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 294;
      __int16 v13 = 1024;
      int v14 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d zoomAvailabilty=%d", (uint8_t *)&v7, 0x22u);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(*(void *)(a1 + 32) + 96) cameraZoomAvailabilityDidChange:*(unsigned __int8 *)(a1 + 56) currentZoomFactor:*(double *)(a1 + 40) maxZoomFactor:*(double *)(a1 + 48)];
  }
  else if (objc_opt_respondsToSelector())
  {
    [*(id *)(*(void *)(a1 + 32) + 96) cameraZoomAvailabilityDidChange:*(unsigned __int8 *)(a1 + 56)];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[AVConferencePreview cameraZoomAvailabilityDidChange:currentZoomFactor:maxZoomFactor:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 300;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Delegate does not respond to cameraZoomAvailabilityDidChange:", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5_136(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!(a3 | [a2 objectForKeyedSubscript:@"SERVERDIED"]))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 120) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"previewState"), "BOOLValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      int v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 120);
        int v8 = 136315906;
        uint64_t v9 = v5;
        __int16 v10 = 2080;
        __int16 v11 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke_5";
        __int16 v12 = 1024;
        int v13 = 641;
        __int16 v14 = 1024;
        int v15 = v7;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d updatePreviewState: _isPreviewRunning=%d", (uint8_t *)&v8, 0x22u);
      }
    }
  }
}

- (void)setLocalVideoLayer:(id)a3 front:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v13 = v7;
      __int16 v14 = 2080;
      int v15 = "-[AVConferencePreview setLocalVideoLayer:front:]";
      __int16 v16 = 1024;
      int v17 = 954;
      __int16 v18 = 2048;
      id v19 = a3;
      __int16 v20 = 1024;
      BOOL v21 = v4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d layer=%p, front=%d", buf, 0x2Cu);
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVConferencePreview_setLocalVideoLayer_front___block_invoke;
  block[3] = &unk_1E6DB3E18;
  block[4] = self;
  void block[5] = a3;
  BOOL v11 = v4;
  dispatch_async(avConferencePreviewQueue, block);
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    [*(id *)(a1 + 32) didReceiveCommError];
    [*(id *)(a1 + 32) didStopPreview];
    LODWORD(v6) = ++*(_DWORD *)(*(void *)(a1 + 32) + 20);
    if ((double)v6 + (double)v6 > 10.0) {
      double v7 = 10.0;
    }
    else {
      double v7 = 2.0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(_DWORD *)(*(void *)(a1 + 32) + 20);
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v18) = 410;
        WORD2(v18) = 2048;
        *(double *)((char *)&v18 + 6) = v7;
        HIWORD(v18) = 1024;
        LODWORD(v19) = v10;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidReceiveFirstFrame: Retrying connection to server in %g seconds, connection attempts %u", buf, 0x2Cu);
      }
    }
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    current_queue = dispatch_get_current_queue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_67;
    block[3] = &unk_1E6DB3DC8;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v11, current_queue, block);
  }
  else if (!a3)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 20) = 0;
    uint64_t v13 = [a2 objectForKeyedSubscript:@"localCameraUIDString"];
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14)
    {
      int v15 = *(NSObject **)(v14 + 112);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___AVConferencePreview_DidReceiveFirstPreviewFrameFromCamera_block_invoke;
      *(void *)&long long v18 = &unk_1E6DB3E40;
      *((void *)&v18 + 1) = v13;
      uint64_t v19 = v14;
      dispatch_async(v15, buf);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_cold_1();
      }
    }
  }
}

void __35__AVConferencePreview_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];

  *(void *)(*(void *)(a1 + 32) + 96) = *(id *)(a1 + 40);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = (objc_class *)objc_opt_class();
      unint64_t v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 96);
      uint64_t v8 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136316674;
      uint64_t v21 = v2;
      __int16 v22 = 2080;
      uint64_t v23 = "-[AVConferencePreview setDelegate:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 156;
      __int16 v26 = 2048;
      *(void *)uint64_t v27 = v4;
      *(_WORD *)&v27[8] = 2112;
      *(void *)&v27[10] = v6;
      *(_WORD *)&v27[18] = 2048;
      *(void *)&v27[20] = v7;
      __int16 v28 = 2112;
      int v29 = NSStringFromClass(v8);
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d self=%p (%@), delegate=%p (%@)", buf, 0x44u);
    }
  }
  unsigned int outCount = 0;
  long long v18 = protocol_copyMethodDescriptionList((Protocol *)&unk_1F3E48A30, 0, 1, &outCount);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v21 = v9;
      __int16 v22 = 2080;
      uint64_t v23 = "-[AVConferencePreview setDelegate:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 156;
      __int16 v26 = 1024;
      *(_DWORD *)uint64_t v27 = outCount;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Protocol AVConferencePreviewClientDelegate contains %u optional methods.", buf, 0x22u);
    }
  }
  if (outCount)
  {
    unint64_t v11 = 0;
    p_name = &v18->name;
    do
    {
      uint64_t v13 = NSStringFromSelector(*p_name);
      NSSelectorFromString(v13);
      char v14 = objc_opt_respondsToSelector();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        __int16 v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          int v17 = "does NOT respond";
          if (v14) {
            int v17 = "responds";
          }
          uint64_t v21 = v15;
          __int16 v22 = 2080;
          uint64_t v23 = "-[AVConferencePreview setDelegate:]_block_invoke";
          __int16 v24 = 1024;
          int v25 = 156;
          __int16 v26 = 1024;
          *(_DWORD *)uint64_t v27 = v11;
          *(_WORD *)&v27[4] = 2080;
          *(void *)&v27[6] = v17;
          *(_WORD *)&v27[14] = 2112;
          *(void *)&v27[16] = v13;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d %u: Delegate %s to \"%@\"", buf, 0x36u);
        }
      }
      ++v11;
      p_name += 2;
    }
    while (v11 < outCount);
  }
  free(v18);
}

- (AVConferencePreviewClientDelegate)delegate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__33;
  int v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__AVConferencePreview_delegate__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(avConferencePreviewNotificationQueue, block);
  uint64_t v3 = (AVConferencePreviewClientDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __31__AVConferencePreview_delegate__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 96);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)didPausePreview
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__AVConferencePreview_didPausePreview__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(avConferencePreviewNotificationQueue, v3);
}

uint64_t __38__AVConferencePreview_didPausePreview__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVConferencePreview-didPausePreview");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v6 = 136315906;
        uint64_t v7 = v3;
        __int16 v8 = 2080;
        uint64_t v9 = "-[AVConferencePreview didPausePreview]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 178;
        __int16 v12 = 2048;
        uint64_t v13 = v5;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-didPausePreview (%p)", (uint8_t *)&v6, 0x26u);
      }
    }
    return [*(id *)(*(void *)(a1 + 32) + 96) didPausePreview];
  }
  return result;
}

- (void)didStopPreview
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__AVConferencePreview_didStopPreview__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(avConferencePreviewNotificationQueue, v3);
  VCPacketFilterGetCMBaseObject("didStopPreview", 2);
}

uint64_t __37__AVConferencePreview_didStopPreview__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVConferencePreview-didStopPreview");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v6 = 136315906;
        uint64_t v7 = v3;
        __int16 v8 = 2080;
        uint64_t v9 = "-[AVConferencePreview didStopPreview]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 187;
        __int16 v12 = 2048;
        uint64_t v13 = v5;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-didStopPreview (%p)", (uint8_t *)&v6, 0x26u);
      }
    }
    return [*(id *)(*(void *)(a1 + 32) + 96) didStopPreview];
  }
  return result;
}

- (void)didChangeLocalCameraUID:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVConferencePreview_didChangeLocalCameraUID___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

uint64_t __47__AVConferencePreview_didChangeLocalCameraUID___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        int v7 = 136316162;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        __int16 v10 = "-[AVConferencePreview didChangeLocalCameraUID:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 217;
        __int16 v13 = 2048;
        uint64_t v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v6;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d self=[%p] cameraUID=%@", (uint8_t *)&v7, 0x30u);
      }
    }
    return [*(id *)(*(void *)(a1 + 32) + 96) didChangeLocalCameraUID:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)didChangeLocalScreenAttributes:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVConferencePreview_didChangeLocalScreenAttributes___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

uint64_t __54__AVConferencePreview_didChangeLocalScreenAttributes___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        int v7 = 136316162;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        __int16 v10 = "-[AVConferencePreview didChangeLocalScreenAttributes:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 235;
        __int16 v13 = 2048;
        uint64_t v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v6;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d (%p) screenAttributes=%@", (uint8_t *)&v7, 0x30u);
      }
    }
    return [*(id *)(*(void *)(a1 + 32) + 96) didChangeLocalScreenAttributes:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)didReceiveErrorFromCameraUniqueID:(id)a3 error:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AVConferencePreview_didReceiveErrorFromCameraUniqueID_error___block_invoke;
  void v5[3] = &unk_1E6DB43D8;
  v5[4] = self;
  void v5[5] = a3;
  v5[6] = a4;
  dispatch_async(avConferencePreviewNotificationQueue, v5);
}

uint64_t __63__AVConferencePreview_didReceiveErrorFromCameraUniqueID_error___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    uint64_t v4 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
        __63__AVConferencePreview_didReceiveErrorFromCameraUniqueID_error___block_invoke_cold_1(v5, (uint64_t)a1, v6);
      }
    }
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVConferencePreview-didReceiveErrorFromCamera");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = a1[4];
        uint64_t v10 = a1[5];
        uint64_t v11 = a1[6];
        int v12 = 136316418;
        uint64_t v13 = v7;
        __int16 v14 = 2080;
        __int16 v15 = "-[AVConferencePreview didReceiveErrorFromCameraUniqueID:error:]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 245;
        __int16 v18 = 2048;
        uint64_t v19 = v9;
        __int16 v20 = 2112;
        uint64_t v21 = v10;
        __int16 v22 = 2112;
        uint64_t v23 = v11;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-didReceiveErrorFromCamera (%p) cameraUID=%@, error=%@", (uint8_t *)&v12, 0x3Au);
      }
    }
    return [*(id *)(a1[4] + 96) didReceiveErrorFromCameraUniqueID:a1[5] error:a1[6]];
  }
  return result;
}

- (void)didReceiveCommError
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__AVConferencePreview_didReceiveCommError__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(avConferencePreviewNotificationQueue, v3);
}

uint64_t __42__AVConferencePreview_didReceiveCommError__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 96);
    return [v3 didReceiveCommError];
  }
  return result;
}

- (void)didGetSnapshot:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AVConferencePreview_didGetSnapshot___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

void __38__AVConferencePreview_didGetSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v2 = objc_opt_respondsToSelector();
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315906;
        uint64_t v7 = v4;
        __int16 v8 = 2080;
        uint64_t v9 = "-[AVConferencePreview didGetSnapshot:]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 262;
        __int16 v12 = 2048;
        uint64_t v13 = 8;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d size=%lu", (uint8_t *)&v6, 0x26u);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 96) didGetSnapshot:*(void *)(a1 + 40)];
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __38__AVConferencePreview_didGetSnapshot___block_invoke_cold_1();
    }
  }
}

- (void)cameraDidBecomeAvailableForUniqueID:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVConferencePreview_cameraDidBecomeAvailableForUniqueID___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

void __59__AVConferencePreview_cameraDidBecomeAvailableForUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v2 = objc_opt_respondsToSelector();
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [*(id *)(a1 + 40) UTF8String];
        int v7 = 136315906;
        uint64_t v8 = v4;
        __int16 v9 = 2080;
        __int16 v10 = "-[AVConferencePreview cameraDidBecomeAvailableForUniqueID:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 273;
        __int16 v13 = 2080;
        uint64_t v14 = v6;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d cameraUniqueID=%s", (uint8_t *)&v7, 0x26u);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 96) cameraDidBecomeAvailableForUniqueID:*(void *)(a1 + 40)];
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __59__AVConferencePreview_cameraDidBecomeAvailableForUniqueID___block_invoke_cold_1();
    }
  }
}

- (void)cameraDidBecomeInterruptedForForUniqueID:(id)a3 reason:(int64_t)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__AVConferencePreview_cameraDidBecomeInterruptedForForUniqueID_reason___block_invoke;
  void v5[3] = &unk_1E6DB5450;
  void v5[5] = self;
  v5[6] = a4;
  v5[4] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, v5);
}

void __71__AVConferencePreview_cameraDidBecomeInterruptedForForUniqueID_reason___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 32) UTF8String];
      uint64_t v5 = *(void *)(a1 + 48);
      int v6 = 136316162;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      __int16 v9 = "-[AVConferencePreview cameraDidBecomeInterruptedForForUniqueID:reason:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 283;
      __int16 v12 = 2080;
      uint64_t v13 = v4;
      __int16 v14 = 1024;
      int v15 = v5;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d cameraUID=%s, reason=%d", (uint8_t *)&v6, 0x2Cu);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(*(void *)(a1 + 40) + 96) cameraDidBecomeInterruptedForForUniqueID:*(void *)(a1 + 32) reason:*(void *)(a1 + 48)];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __71__AVConferencePreview_cameraDidBecomeInterruptedForForUniqueID_reason___block_invoke_cold_1();
    }
  }
}

- (void)cameraCFramingAvailabilityDidChange:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVConferencePreview_cameraCFramingAvailabilityDidChange___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  BOOL v5 = a3;
  block[4] = self;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

void __59__AVConferencePreview_cameraCFramingAvailabilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(unsigned __int8 *)(a1 + 40);
      int v7 = 136315906;
      uint64_t v8 = v2;
      __int16 v9 = 2080;
      __int16 v10 = "-[AVConferencePreview cameraCFramingAvailabilityDidChange:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 308;
      __int16 v13 = 1024;
      int v14 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d availability=%d", (uint8_t *)&v7, 0x22u);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(*(void *)(a1 + 32) + 96) cameraCinematicFramingAvailabilityDidChange:*(unsigned __int8 *)(a1 + 40)];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "-[AVConferencePreview cameraCFramingAvailabilityDidChange:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 313;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Delegate does not respond to cameraCinematicFramingAvailabilityDidChange:", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)followSystemCameraDidChange:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AVConferencePreview_followSystemCameraDidChange___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  BOOL v5 = a3;
  block[4] = self;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

void __51__AVConferencePreview_followSystemCameraDidChange___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(unsigned __int8 *)(a1 + 40);
      int v7 = 136315906;
      uint64_t v8 = v2;
      __int16 v9 = 2080;
      __int16 v10 = "-[AVConferencePreview followSystemCameraDidChange:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 321;
      __int16 v13 = 1024;
      int v14 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d enabled=%d", (uint8_t *)&v7, 0x22u);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(*(void *)(a1 + 32) + 96) followSystemCameraDidChange:*(unsigned __int8 *)(a1 + 40)];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "-[AVConferencePreview followSystemCameraDidChange:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 325;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Delegate does not respond to followSystemCameraDidChange:", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)connectLayer:(id)a3 layerHost:(id)a4 withContextId:(unsigned int)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v5 = *(void *)&a5;
    if ((id)[a4 superlayer] == a3)
    {
      if ([a4 contextId] != v5)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __60__AVConferencePreview_connectLayer_layerHost_withContextId___block_invoke;
        v11[3] = &unk_1E6DB3F08;
        v11[4] = a4;
        int v12 = v5;
        dispatch_async(MEMORY[0x1E4F14428], v11);
      }
    }
    else
    {
      [(AVConferencePreview *)self createPreviewCALayerHostForRootLayer:a3 withContextId:v5 front:self->_caLayerHostFront == a4];
    }
    [a3 bounds];
    -[AVConferencePreview setBounds:forLayerHost:](self, "setBounds:forLayerHost:", a4);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v14 = v9;
        __int16 v15 = 2080;
        uint64_t v16 = "-[AVConferencePreview connectLayer:layerHost:withContextId:]";
        __int16 v17 = 1024;
        int v18 = 368;
        __int16 v19 = 1024;
        int v20 = v5;
        __int16 v21 = 2048;
        id v22 = a3;
        __int16 v23 = 2048;
        id v24 = a4;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Connected contextId=%u to layer=%p layerHost=%p", buf, 0x36u);
      }
    }
  }
}

uint64_t __60__AVConferencePreview_connectLayer_layerHost_withContextId___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(a1 + 32) setContextId:*(unsigned int *)(a1 + 40)];
  uint64_t v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 commit];
}

- (void)resetLayersAfterServerDisconnect
{
  if (self->caLayerFront)
  {
    if (self->_caLayerHostFront) {
      -[AVConferencePreview setLocalVideoLayerHost:front:](self, "setLocalVideoLayerHost:front:");
    }
    else {
      -[AVConferencePreview setLocalVideoLayer:front:](self, "setLocalVideoLayer:front:");
    }
  }
  if (self->caLayerBack)
  {
    if (self->_caLayerHostBack)
    {
      -[AVConferencePreview setLocalVideoLayerHost:front:](self, "setLocalVideoLayerHost:front:");
    }
    else
    {
      -[AVConferencePreview setLocalVideoLayer:front:](self, "setLocalVideoLayer:front:");
    }
  }
}

- (void)restartPreview
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__AVConferencePreview_restartPreview__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(avConferencePreviewQueue, v3);
}

unsigned char *__37__AVConferencePreview_restartPreview__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
    int v14 = 136315906;
    uint64_t v15 = v3;
    __int16 v16 = 2080;
    __int16 v17 = "-[AVConferencePreview restartPreview]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 392;
    __int16 v20 = 1024;
    LODWORD(v21) = v5;
    uint64_t v6 = "AVConferencePreview [%s] %s:%d clientWantsPreview=%{BOOL}d";
    int v7 = v4;
    uint32_t v8 = 34;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
  }
  else {
    uint64_t v2 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = *(unsigned __int8 *)(v11 + 16);
      int v14 = 136316418;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      __int16 v17 = "-[AVConferencePreview restartPreview]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 392;
      __int16 v20 = 2112;
      __int16 v21 = v2;
      __int16 v22 = 2048;
      uint64_t v23 = v11;
      __int16 v24 = 1024;
      int v25 = v12;
      uint64_t v6 = "AVConferencePreview [%s] %s:%d %@(%p) clientWantsPreview=%{BOOL}d";
      int v7 = v10;
      uint32_t v8 = 54;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v14, v8);
    }
  }
LABEL_12:
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[16]) {
    return (unsigned char *)[result startPreview];
  }
  return result;
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_67(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v10 = v2;
      __int16 v11 = 2080;
      int v12 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 419;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidReceiveFirstFrame: Sending re-connect message to server", buf, 0x1Cu);
    }
  }
  id v4 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  int v5 = objc_msgSend(v4, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], @"CACHEAUTHTOKEN", 0);
  uint64_t v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) sendMessageSync:"previewInitialize" arguments:v5];
  if (![v6 objectForKeyedSubscript:@"TIMEOUT"]
    && ![v6 objectForKeyedSubscript:@"SERVERDIED"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint32_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        int v12 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
        __int16 v13 = 1024;
        int v14 = 426;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidReceiveFirstFrame: Connected to server", buf, 0x1Cu);
      }
    }
    [*(id *)(a1 + 32) resetLayersAfterServerDisconnect];
    [*(id *)(a1 + 32) resetLocalCameraAfterServerDisconnect];
    [*(id *)(a1 + 32) restartPreview];
  }
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_81(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!(a3 | [a2 objectForKeyedSubscript:@"SERVERDIED"]))
  {
    uint64_t v5 = [a2 objectForKeyedSubscript:@"localCameraUIDString"];
    if (v5)
    {
      uint64_t v6 = (void *)v5;

      *(void *)(*(void *)(a1 + 32) + 144) = v6;
      [*(id *)(a1 + 32) didChangeLocalCameraUID:*(void *)(*(void *)(a1 + 32) + 144)];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint32_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 144);
          int v10 = 136315906;
          uint64_t v11 = v7;
          __int16 v12 = 2080;
          __int16 v13 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v14 = 1024;
          int v15 = 457;
          __int16 v16 = 2112;
          uint64_t v17 = v9;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewCameraUIDChanged: cameraUID = %@", (uint8_t *)&v10, 0x26u);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_81_cold_1();
      }
    }
  }
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_88(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!(a3 | result))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 120);
        int v9 = 136315906;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        __int16 v12 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
        __int16 v13 = 1024;
        int v14 = 487;
        __int16 v15 = 1024;
        int v16 = v8;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidPause: _isPreviewRunning=%d", (uint8_t *)&v9, 0x22u);
      }
    }
    return [*(id *)(a1 + 32) didPausePreview];
  }
  return result;
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_90(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!(a3 | result))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 120);
        int v9 = 136315906;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        __int16 v12 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
        __int16 v13 = 1024;
        int v14 = 497;
        __int16 v15 = 1024;
        int v16 = v8;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidStop: _isPreviewRunning=%d", (uint8_t *)&v9, 0x22u);
      }
    }
    return [*(id *)(a1 + 32) didStopPreview];
  }
  return result;
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_92(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!(a3 | result))
  {
    uint64_t v7 = [a2 objectForKeyedSubscript:@"snapShotFrame"];
    int v8 = *(void **)(a1 + 32);
    return [v8 didGetSnapshot:v7];
  }
  return result;
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (!(a3 | [a2 objectForKeyedSubscript:@"SERVERDIED"]))
  {
    uint64_t v5 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", [a2 objectForKeyedSubscript:@"localVideoAttributes"]);
    [*(id *)(a1 + 32) didChangeLocalScreenAttributes:v5];
  }
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  if (!(a3 | [a2 objectForKeyedSubscript:@"SERVERDIED"]))
  {
    uint64_t v5 = [a2 objectForKeyedSubscript:@"localCameraUIDString"];
    id v6 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "newNSErrorFromNSDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"conferenceError"));
    [*(id *)(a1 + 32) didReceiveErrorFromCameraUniqueID:v5 error:v6];
  }
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_111(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 | [a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_111_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint64_t v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = *(void *)(a1 + 32);
          int v20 = 136316162;
          uint64_t v21 = v17;
          __int16 v22 = 2080;
          uint64_t v23 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v24 = 1024;
          int v25 = 579;
          __int16 v26 = 2112;
          *(void *)uint64_t v27 = v5;
          *(_WORD *)&v27[8] = 2048;
          *(void *)&v27[10] = v19;
          _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d %@(%p) previewDidLocalVideoContextChange failed", (uint8_t *)&v20, 0x30u);
        }
      }
    }
  }
  else
  {
    id v6 = (void *)[a2 objectForKeyedSubscript:@"videoContextId"];
    uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"videoSlotFacing"];
    int v8 = [v7 BOOLValue];
    uint64_t v9 = 32;
    if (v8) {
      uint64_t v9 = 24;
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + v9);
    if (v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        __int16 v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 136316418;
          uint64_t v21 = v11;
          __int16 v22 = 2080;
          uint64_t v23 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v24 = 1024;
          int v25 = 586;
          __int16 v26 = 1024;
          *(_DWORD *)uint64_t v27 = [v6 intValue];
          *(_WORD *)&v27[4] = 2048;
          *(void *)&v27[6] = v10;
          *(_WORD *)&v27[14] = 1024;
          *(_DWORD *)&v27[16] = [v7 BOOLValue];
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidLocalVideoContextChange: Received context %u for layer %p facing %d", (uint8_t *)&v20, 0x32u);
        }
      }
      int v13 = [v7 BOOLValue];
      int v14 = *(char **)(a1 + 32);
      uint64_t v15 = 48;
      if (v13) {
        uint64_t v15 = 40;
      }
      uint64_t v16 = *(void *)&v14[v15];
      if (v16)
      {
        objc_msgSend(v14, "connectLayer:layerHost:withContextId:", v10, v16, objc_msgSend(v6, "unsignedIntValue"));
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_111_cold_2();
        }
      }
    }
  }
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_116(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!(a3 | result))
  {
    objc_msgSend(*(id *)(a1 + 32), "cameraDidBecomeAvailableForUniqueID:", objc_msgSend(a2, "objectForKeyedSubscript:", @"localCameraUIDString"));
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 restartPreview];
  }
  return result;
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_2_118(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!(a3 | result))
  {
    uint64_t v7 = [a2 objectForKeyedSubscript:@"localCameraUIDString"];
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"previewInterruptionReason"), "integerValue");
    uint64_t v9 = *(void **)(a1 + 32);
    return [v9 cameraDidBecomeInterruptedForForUniqueID:v7 reason:v8];
  }
  return result;
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_4_131(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!(a3 | result))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 122) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"previewCameraCinematicFraming"), "intValue") != 0;
    uint64_t v7 = *(unsigned __int8 **)(a1 + 32);
    uint64_t v8 = v7[122];
    return [v7 cameraCFramingAvailabilityDidChange:v8];
  }
  return result;
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_141(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!(a3 | result))
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"previewFollowSystemCamera"), "BOOLValue");
    uint64_t v8 = *(void **)(a1 + 32);
    return [v8 followSystemCameraDidChange:v7];
  }
  return result;
}

- (void)deregisterBlocksForDelegateNotifications
{
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewDidReceiveFirstFrame"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewCameraUIDChanged"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewDidStart"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewDidPause"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewDidStop"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewDidGetSnapShot"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewDidLocalVideoAttributesChange"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewDidLocalScreenAttributesChange"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewDidReceiveCameraError"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewDidLocalVideoSlotChange"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewCameraDidBecomeAvailable"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewCameraDidBecomeInterrupted"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewCameraZoomAvailablilty"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewCameraCinematicFramingAvailablilty"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"updatePreviewState"];
  [(AVConferenceXPCClient *)self->connection deregisterFromService:"previewFollowSystemCameraDidChange"];
  connection = self->connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"previewDidLocalVideoContextChange"];
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];

  self->delegate = 0;
  dispatch_release((dispatch_object_t)self->avConferencePreviewQueue);
  dispatch_release((dispatch_object_t)self->avConferencePreviewNotificationQueue);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVConferencePreview-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    id v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[AVConferencePreview dealloc]";
      __int16 v10 = 1024;
      int v11 = 767;
      __int16 v12 = 2048;
      int v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-dealloc (%p)", buf, 0x26u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVConferencePreview;
  [(AVConferencePreview *)&v5 dealloc];
}

- (AVConferencePreview)allocWithZone:(_NSZone *)a3
{
  return (AVConferencePreview *)_avConferencePreviewSingleton;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)startPreviewUnpausing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    id v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316162;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "-[AVConferencePreview startPreviewUnpausing:]";
      __int16 v11 = 1024;
      int v12 = 831;
      __int16 v13 = 2048;
      uint64_t v14 = self;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d !!Deprecating!! Client is recommanded to use startPreview instead. AVConferencePreview startPreviewUnpausing, self %p, unpause=%d.", (uint8_t *)&v7, 0x2Cu);
    }
  }
  [(AVConferencePreview *)self startPreview];
}

- (void)pausePreview
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  id v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    id v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVConferencePreview pausePreview]";
      __int16 v15 = 1024;
      int v16 = 838;
      __int16 v17 = 2048;
      uint64_t v18 = self;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d self=%p", buf, 0x26u);
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AVConferencePreview_pausePreview__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVConferencePreview-pausePreview");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    __int16 v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVConferencePreview pausePreview]";
      __int16 v15 = 1024;
      int v16 = 852;
      __int16 v17 = 2048;
      uint64_t v18 = self;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-pausePreview (%p)", buf, 0x26u);
    }
  }
}

uint64_t __35__AVConferencePreview_pausePreview__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) sendMessageAsync:"previewPausePreview" arguments:0 reply:0];
}

- (void)stopPreview
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  id v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    id v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVConferencePreview stopPreview]";
      __int16 v15 = 1024;
      int v16 = 859;
      __int16 v17 = 2048;
      uint64_t v18 = self;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d self=%p", buf, 0x26u);
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AVConferencePreview_stopPreview__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVConferencePreview-stopPreview");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    __int16 v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVConferencePreview stopPreview]";
      __int16 v15 = 1024;
      int v16 = 875;
      __int16 v17 = 2048;
      uint64_t v18 = self;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-stopPreview (%p)", buf, 0x26u);
    }
  }
}

uint64_t __34__AVConferencePreview_stopPreview__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      id v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v12 = 136315650;
        *(void *)&v12[4] = v3;
        *(_WORD *)&v12[12] = 2080;
        *(void *)&v12[14] = "-[AVConferencePreview stopPreview]_block_invoke";
        *(_WORD *)&v12[22] = 1024;
        LODWORD(v13) = 863;
        uint64_t v5 = "AVConferencePreview [%s] %s:%d ";
        id v6 = v4;
        uint32_t v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v5, v12, v7);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      __int16 v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v12 = 136316162;
        *(void *)&v12[4] = v8;
        *(_WORD *)&v12[12] = 2080;
        *(void *)&v12[14] = "-[AVConferencePreview stopPreview]_block_invoke";
        *(_WORD *)&v12[22] = 1024;
        LODWORD(v13) = 863;
        WORD2(v13) = 2112;
        *(void *)((char *)&v13 + 6) = v2;
        HIWORD(v13) = 2048;
        uint64_t v14 = v10;
        uint64_t v5 = "AVConferencePreview [%s] %s:%d %@(%p) ";
        id v6 = v9;
        uint32_t v7 = 48;
        goto LABEL_11;
      }
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewStopPreview", 0, 0, *(_OWORD *)v12, *(void *)&v12[16], v13, v14);
}

- (BOOL)isPreviewRunning
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__AVConferencePreview_isPreviewRunning__block_invoke;
  v9[3] = &unk_1E6DB4540;
  v9[4] = self;
  void v9[5] = &v10;
  dispatch_sync(avConferencePreviewQueue, v9);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    id v4 = *MEMORY[0x1E4F47A50];
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *((unsigned __int8 *)v11 + 24);
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = v3;
        __int16 v16 = 2080;
        __int16 v17 = "-[AVConferencePreview isPreviewRunning]";
        __int16 v18 = 1024;
        int v19 = 886;
        __int16 v20 = 1024;
        int v21 = v6;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d _isPreviewRunning=%d", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[AVConferencePreview isPreviewRunning]();
    }
  }
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __39__AVConferencePreview_isPreviewRunning__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 120);
  return result;
}

- (BOOL)isCameraZoomAvailable
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__AVConferencePreview_isCameraZoomAvailable__block_invoke;
  v9[3] = &unk_1E6DB4540;
  v9[4] = self;
  void v9[5] = &v10;
  dispatch_sync(avConferencePreviewQueue, v9);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    id v4 = *MEMORY[0x1E4F47A50];
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *((unsigned __int8 *)v11 + 24);
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = v3;
        __int16 v16 = 2080;
        __int16 v17 = "-[AVConferencePreview isCameraZoomAvailable]";
        __int16 v18 = 1024;
        int v19 = 897;
        __int16 v20 = 1024;
        int v21 = v6;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d returning %d", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[AVConferencePreview isCameraZoomAvailable]();
    }
  }
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __44__AVConferencePreview_isCameraZoomAvailable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 121);
  return result;
}

- (double)currentZoomFactor
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  __int16 v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__AVConferencePreview_currentZoomFactor__block_invoke;
  v9[3] = &unk_1E6DB4540;
  v9[4] = self;
  void v9[5] = &v10;
  dispatch_sync(avConferencePreviewQueue, v9);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    id v4 = *MEMORY[0x1E4F47A50];
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *((void *)v11 + 3);
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = v3;
        __int16 v16 = 2080;
        __int16 v17 = "-[AVConferencePreview currentZoomFactor]";
        __int16 v18 = 1024;
        int v19 = 908;
        __int16 v20 = 2048;
        uint64_t v21 = v6;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d returning %f", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[AVConferencePreview currentZoomFactor]();
    }
  }
  double v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

double __40__AVConferencePreview_currentZoomFactor__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 128);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)maxZoomFactor
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  __int16 v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__AVConferencePreview_maxZoomFactor__block_invoke;
  v9[3] = &unk_1E6DB4540;
  v9[4] = self;
  void v9[5] = &v10;
  dispatch_sync(avConferencePreviewQueue, v9);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    id v4 = *MEMORY[0x1E4F47A50];
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *((void *)v11 + 3);
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = v3;
        __int16 v16 = 2080;
        __int16 v17 = "-[AVConferencePreview maxZoomFactor]";
        __int16 v18 = 1024;
        int v19 = 919;
        __int16 v20 = 2048;
        uint64_t v21 = v6;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d returning %f", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[AVConferencePreview maxZoomFactor]();
    }
  }
  double v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

double __36__AVConferencePreview_maxZoomFactor__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 136);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)getSnapshot
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d ERROR: cannot get snapshot if preview is not running!", v2, v3, v4, v5, v6);
}

- (id)localVideoLayer:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x3052000000;
  __int16 v11 = __Block_byref_object_copy__33;
  uint64_t v12 = __Block_byref_object_dispose__33;
  uint64_t v13 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__AVConferencePreview_localVideoLayer___block_invoke;
  v6[3] = &unk_1E6DB7A38;
  BOOL v7 = a3;
  v6[4] = self;
  void v6[5] = &v8;
  dispatch_sync(avConferencePreviewQueue, v6);
  uint64_t v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __39__AVConferencePreview_localVideoLayer___block_invoke(uint64_t result)
{
  uint64_t v1 = 24;
  if (!*(unsigned char *)(result + 48)) {
    uint64_t v1 = 32;
  }
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(result + 32) + v1);
  return result;
}

- (id)newXPCObjectForFenceHandle:(id *)a3 forLayerHost:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_5;
  }
  BOOL v7 = (void *)[MEMORY[0x1E4F39BB8] newFenceFromDefaultServer];
  *a3 = v7;
  if (v7)
  {
    if (objc_msgSend((id)objc_msgSend(a4, "context"), "addFence:", *a3))
    {
      id result = (id)[*a3 createXPCRepresentation];
      if (result) {
        return result;
      }
      goto LABEL_5;
    }
    if ((AVConferencePreview *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_5;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      uint64_t v13 = (__CFString *)*a3;
      int v22 = 136316418;
      uint64_t v23 = v11;
      __int16 v24 = 2080;
      int v25 = "-[AVConferencePreview newXPCObjectForFenceHandle:forLayerHost:]";
      __int16 v26 = 1024;
      int v27 = 1041;
      __int16 v28 = 2048;
      int v29 = v13;
      __int16 v30 = 2048;
      id v31 = a4;
      __int16 v32 = 2048;
      uint64_t v33 = [a4 context];
      uint64_t v14 = "AVConferencePreview [%s] %s:%d Failed to add fence=%p for layer=%p with context=%p";
      uint64_t v15 = v12;
      uint32_t v16 = 58;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[(AVConferencePreview *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_5;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      id v21 = *a3;
      int v22 = 136316930;
      uint64_t v23 = v19;
      __int16 v24 = 2080;
      int v25 = "-[AVConferencePreview newXPCObjectForFenceHandle:forLayerHost:]";
      __int16 v26 = 1024;
      int v27 = 1041;
      __int16 v28 = 2112;
      int v29 = v10;
      __int16 v30 = 2048;
      id v31 = self;
      __int16 v32 = 2048;
      uint64_t v33 = (uint64_t)v21;
      __int16 v34 = 2048;
      id v35 = a4;
      __int16 v36 = 2048;
      uint64_t v37 = [a4 context];
      uint64_t v14 = "AVConferencePreview [%s] %s:%d %@(%p) Failed to add fence=%p for layer=%p with context=%p";
      uint64_t v15 = v20;
      uint32_t v16 = 78;
    }
    goto LABEL_28;
  }
  if ((AVConferencePreview *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVConferencePreview newXPCObjectForFenceHandle:forLayerHost:]();
      }
    }
    goto LABEL_5;
  }
  if (objc_opt_respondsToSelector()) {
    __int16 v9 = (__CFString *)[(AVConferencePreview *)self performSelector:sel_logPrefix];
  }
  else {
    __int16 v9 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    __int16 v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v22 = 136316162;
      uint64_t v23 = v17;
      __int16 v24 = 2080;
      int v25 = "-[AVConferencePreview newXPCObjectForFenceHandle:forLayerHost:]";
      __int16 v26 = 1024;
      int v27 = 1038;
      __int16 v28 = 2112;
      int v29 = v9;
      __int16 v30 = 2048;
      id v31 = self;
      uint64_t v14 = "AVConferencePreview [%s] %s:%d %@(%p) Failed to create new fence";
      uint64_t v15 = v18;
      uint32_t v16 = 48;
LABEL_28:
      _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v22, v16);
    }
  }
LABEL_5:
  id result = *a3;
  if (*a3)
  {
    [result invalidate];

    id result = 0;
    *a3 = 0;
  }
  return result;
}

- (void)setBounds:(CGRect)a3 forLayerHost:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  caLayerHostFront = self->_caLayerHostFront;
  if ((AVConferencePreview *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v84.origin.CGFloat x = x;
        v84.origin.CGFloat y = y;
        v84.size.CGFloat width = width;
        v84.size.CGFloat height = height;
        uint64_t v14 = NSStringFromRect(v84);
        caLayerFront = self->caLayerFront;
        caLayerBack = self->caLayerBack;
        uint64_t v17 = self->_caLayerHostFront;
        caLayerHostBack = self->_caLayerHostBack;
        *(_DWORD *)buf = 136317442;
        uint64_t v60 = v12;
        __int16 v61 = 2080;
        v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
        __int16 v63 = 1024;
        int v64 = 1057;
        __int16 v65 = 2112;
        v66 = (__CFString *)v14;
        __int16 v67 = 2048;
        v68 = a4;
        __int16 v69 = 2048;
        v70 = caLayerFront;
        __int16 v71 = 2048;
        id v72 = caLayerBack;
        __int16 v73 = 2048;
        v74 = v17;
        __int16 v75 = 2048;
        v76 = caLayerHostBack;
        __int16 v77 = 1024;
        LODWORD(v78) = caLayerHostFront == a4;
        uint64_t v19 = "AVConferencePreview [%s] %s:%d bounds=%@ layerHost=%p caLayerFront=%p caLayerBack=%p caLayerHostFront=%p c"
              "aLayerHostBack=%p front=%d";
        __int16 v20 = v13;
        uint32_t v21 = 94;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = (__CFString *)[(AVConferencePreview *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v85.origin.CGFloat x = x;
        v85.origin.CGFloat y = y;
        v85.size.CGFloat width = width;
        v85.size.CGFloat height = height;
        __int16 v24 = NSStringFromRect(v85);
        int v25 = self->caLayerFront;
        __int16 v26 = self->caLayerBack;
        int v27 = self->_caLayerHostFront;
        __int16 v28 = self->_caLayerHostBack;
        *(_DWORD *)buf = 136317954;
        uint64_t v60 = v22;
        __int16 v61 = 2080;
        v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
        __int16 v63 = 1024;
        int v64 = 1057;
        __int16 v65 = 2112;
        v66 = v11;
        __int16 v67 = 2048;
        v68 = self;
        __int16 v69 = 2112;
        v70 = (CALayer *)v24;
        __int16 v71 = 2048;
        id v72 = a4;
        __int16 v73 = 2048;
        v74 = (AVCPreviewCALayerHost *)v25;
        __int16 v75 = 2048;
        v76 = (AVCPreviewCALayerHost *)v26;
        __int16 v77 = 2048;
        v78 = v27;
        __int16 v79 = 2048;
        v80 = v28;
        __int16 v81 = 1024;
        BOOL v82 = caLayerHostFront == a4;
        uint64_t v19 = "AVConferencePreview [%s] %s:%d %@(%p) bounds=%@ layerHost=%p caLayerFront=%p caLayerBack=%p caLayerHostFro"
              "nt=%p caLayerHostBack=%p front=%d";
        __int16 v20 = v23;
        uint32_t v21 = 114;
        goto LABEL_11;
      }
    }
  }
  if (VideoUtil_LayerBoundsAreValid(x, y, width, height))
  {
    id v56 = 0;
    v86.origin.CGFloat x = x;
    v86.origin.CGFloat y = y;
    v86.size.CGFloat width = width;
    v86.size.CGFloat height = height;
    int v29 = NSStringFromRect(v86);
    uint64_t v30 = [objc_alloc(NSNumber) initWithBool:caLayerHostFront == a4];
    id v31 = (void *)v30;
    if (v30)
    {
      v57[0] = @"videoSlotFacing";
      v57[1] = @"conferenceVisualRectangle";
      v58[0] = v30;
      v58[1] = v29;
      uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
      id v33 = [(AVConferencePreview *)self newXPCObjectForFenceHandle:&v56 forLayerHost:a4];
      if (v33)
      {
        __int16 v34 = v33;
        id v35 = [(AVConferenceXPCClient *)self->connection sendMessageSync:"previewSetLayerBounds" arguments:v32 xpcArguments:v33];
        if (!v35
          || (__int16 v36 = v35, [v35 objectForKeyedSubscript:@"ERROR"])
          || [v36 objectForKeyedSubscript:@"SERVERDIED"])
        {
          if ((AVConferencePreview *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[AVConferencePreview setBounds:forLayerHost:]();
              }
            }
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              v47 = (__CFString *)[(AVConferencePreview *)self performSelector:sel_logPrefix];
            }
            else {
              v47 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v50 = VRTraceErrorLogLevelToCSTR();
              v51 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v60 = v50;
                __int16 v61 = 2080;
                v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
                __int16 v63 = 1024;
                int v64 = 1081;
                __int16 v65 = 2112;
                v66 = v47;
                __int16 v67 = 2048;
                v68 = self;
                _os_log_error_impl(&dword_1E1EA4000, v51, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d %@(%p) Set preview layer bounds xpc call failed", buf, 0x30u);
              }
            }
          }
        }
        goto LABEL_18;
      }
      if ((AVConferencePreview *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVConferencePreview setBounds:forLayerHost:]();
          }
        }
        goto LABEL_62;
      }
      if (objc_opt_respondsToSelector()) {
        v49 = (__CFString *)[(AVConferencePreview *)self performSelector:sel_logPrefix];
      }
      else {
        v49 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v55 = VRTraceErrorLogLevelToCSTR(),
            v53 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_62:
        __int16 v34 = 0;
LABEL_18:
        if (v56)
        {
          [v56 invalidate];

          id v56 = 0;
        }

        xpc_release(v34);
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v60 = v55;
      __int16 v61 = 2080;
      v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
      __int16 v63 = 1024;
      int v64 = 1077;
      __int16 v65 = 2112;
      v66 = v49;
      __int16 v67 = 2048;
      v68 = self;
      v54 = "AVConferencePreview [%s] %s:%d %@(%p) Failed to create XPC representation for fence";
    }
    else
    {
      if ((AVConferencePreview *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVConferencePreview setBounds:forLayerHost:]();
          }
        }
        goto LABEL_62;
      }
      if (objc_opt_respondsToSelector()) {
        v48 = (__CFString *)[(AVConferencePreview *)self performSelector:sel_logPrefix];
      }
      else {
        v48 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_62;
      }
      uint64_t v52 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_62;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v60 = v52;
      __int16 v61 = 2080;
      v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
      __int16 v63 = 1024;
      int v64 = 1069;
      __int16 v65 = 2112;
      v66 = v48;
      __int16 v67 = 2048;
      v68 = self;
      v54 = "AVConferencePreview [%s] %s:%d %@(%p) Failed to allocate camera facing number";
    }
    _os_log_error_impl(&dword_1E1EA4000, v53, OS_LOG_TYPE_ERROR, v54, buf, 0x30u);
    goto LABEL_62;
  }
  if ((AVConferencePreview *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v38 = VRTraceErrorLogLevelToCSTR();
    v39 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    v87.origin.CGFloat x = x;
    v87.origin.CGFloat y = y;
    v87.size.CGFloat width = width;
    v87.size.CGFloat height = height;
    v40 = NSStringFromRect(v87);
    *(_DWORD *)buf = 136315906;
    uint64_t v60 = v38;
    __int16 v61 = 2080;
    v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
    __int16 v63 = 1024;
    int v64 = 1059;
    __int16 v65 = 2112;
    v66 = (__CFString *)v40;
    v41 = "AVConferencePreview [%s] %s:%d Invalid root layer bounds=%@, skip bounds configuration";
    v42 = v39;
    uint32_t v43 = 38;
LABEL_31:
    _os_log_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v37 = (__CFString *)[(AVConferencePreview *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v37 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v44 = VRTraceErrorLogLevelToCSTR();
    v45 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      v88.origin.CGFloat x = x;
      v88.origin.CGFloat y = y;
      v88.size.CGFloat width = width;
      v88.size.CGFloat height = height;
      v46 = NSStringFromRect(v88);
      *(_DWORD *)buf = 136316418;
      uint64_t v60 = v44;
      __int16 v61 = 2080;
      v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
      __int16 v63 = 1024;
      int v64 = 1059;
      __int16 v65 = 2112;
      v66 = v37;
      __int16 v67 = 2048;
      v68 = self;
      __int16 v69 = 2112;
      v70 = (CALayer *)v46;
      v41 = "AVConferencePreview [%s] %s:%d %@(%p) Invalid root layer bounds=%@, skip bounds configuration";
      v42 = v45;
      uint32_t v43 = 58;
      goto LABEL_31;
    }
  }
}

- (void)createPreviewCALayerHostForRootLayer:(id)a3 withContextId:(unsigned int)a4 front:(BOOL)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4)
  {
    if ((AVConferencePreview *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:]();
        }
      }
      goto LABEL_50;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v38 = (__CFString *)[(AVConferencePreview *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v38 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_50;
    }
    uint64_t v41 = VRTraceErrorLogLevelToCSTR();
    v42 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_50;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v50 = v41;
    __int16 v51 = 2080;
    uint64_t v52 = "-[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:]";
    __int16 v53 = 1024;
    int v54 = 1109;
    __int16 v55 = 2112;
    id v56 = v38;
    __int16 v57 = 2048;
    v58 = self;
    uint32_t v43 = "AVConferencePreview [%s] %s:%d %@(%p) Invalid rootLayer or contextId";
    goto LABEL_56;
  }
  BOOL v7 = a5;
  id v9 = [NSString alloc];
  uint64_t v10 = "Back";
  if (v7) {
    uint64_t v10 = "Front";
  }
  uint64_t v11 = objc_msgSend(v9, "initWithFormat:", @"AVCPreviewVideoCALayerHost%sFor%p", v10, a3);
  if (!v11)
  {
    if ((AVConferencePreview *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:]();
        }
      }
      goto LABEL_50;
    }
    if (objc_opt_respondsToSelector()) {
      v39 = (__CFString *)[(AVConferencePreview *)self performSelector:sel_logPrefix];
    }
    else {
      v39 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v44 = VRTraceErrorLogLevelToCSTR(),
          v42 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_50:
      uint64_t v12 = 0;
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v50 = v44;
    __int16 v51 = 2080;
    uint64_t v52 = "-[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:]";
    __int16 v53 = 1024;
    int v54 = 1111;
    __int16 v55 = 2112;
    id v56 = v39;
    __int16 v57 = 2048;
    v58 = self;
    uint32_t v43 = "AVConferencePreview [%s] %s:%d %@(%p) Failed to allocate layer host name";
LABEL_56:
    _os_log_error_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_ERROR, v43, buf, 0x30u);
    goto LABEL_50;
  }
  uint64_t v12 = (void *)v11;
  [a3 bounds];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  p_caLayerHostFront = &self->_caLayerHostFront;
  p_caLayerHostBack = &self->_caLayerHostBack;
  if (v7) {
    uint64_t v23 = 40;
  }
  else {
    uint64_t v23 = 48;
  }
  if (v7) {
    __int16 v24 = &self->_caLayerHostFront;
  }
  else {
    __int16 v24 = &self->_caLayerHostBack;
  }
  [(AVConferencePreview *)self cleanupPreviewLayerHost:v24];
  int v25 = [[AVCPreviewCALayerHost alloc] initWithPreview:self];
  *(Class *)((char *)&self->super.isa + v23) = (Class)v25;
  if (v25)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__AVConferencePreview_createPreviewCALayerHostForRootLayer_withContextId_front___block_invoke;
    block[3] = &unk_1E6DB8E60;
    void block[5] = a3;
    void block[6] = v24;
    unsigned int v48 = a4;
    void block[7] = v14;
    block[8] = v16;
    block[9] = v18;
    block[10] = v20;
    block[4] = v12;
    dispatch_async(MEMORY[0x1E4F14428], block);
    if ((AVConferencePreview *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        __int16 v28 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v29 = *p_caLayerHostFront;
          uint64_t v30 = *p_caLayerHostBack;
          *(_DWORD *)buf = 136316674;
          uint64_t v50 = v27;
          __int16 v51 = 2080;
          uint64_t v52 = "-[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:]";
          __int16 v53 = 1024;
          int v54 = 1139;
          __int16 v55 = 2048;
          id v56 = (__CFString *)v29;
          __int16 v57 = 2048;
          v58 = (AVConferencePreview *)v30;
          __int16 v59 = 2048;
          id v60 = a3;
          __int16 v61 = 1024;
          LODWORD(v62) = a4;
          id v31 = "AVConferencePreview [%s] %s:%d AVConferencePreview: createPreviewCALayerHostForRootLayer caLayerHostFron"
                "t=%p caLayerHostBack=%p rootLayer=%p contextId=%u";
          uint64_t v32 = v28;
          uint32_t v33 = 64;
LABEL_23:
          _os_log_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v26 = (__CFString *)[(AVConferencePreview *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v26 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v34 = VRTraceErrorLogLevelToCSTR();
        id v35 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          caLayerHostFront = self->_caLayerHostFront;
          caLayerHostBack = self->_caLayerHostBack;
          *(_DWORD *)buf = 136317186;
          uint64_t v50 = v34;
          __int16 v51 = 2080;
          uint64_t v52 = "-[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:]";
          __int16 v53 = 1024;
          int v54 = 1139;
          __int16 v55 = 2112;
          id v56 = v26;
          __int16 v57 = 2048;
          v58 = self;
          __int16 v59 = 2048;
          id v60 = caLayerHostFront;
          __int16 v61 = 2048;
          v62 = caLayerHostBack;
          __int16 v63 = 2048;
          id v64 = a3;
          __int16 v65 = 1024;
          unsigned int v66 = a4;
          id v31 = "AVConferencePreview [%s] %s:%d %@(%p) AVConferencePreview: createPreviewCALayerHostForRootLayer caLayerH"
                "ostFront=%p caLayerHostBack=%p rootLayer=%p contextId=%u";
          uint64_t v32 = v35;
          uint32_t v33 = 84;
          goto LABEL_23;
        }
      }
    }
  }
  else if ((AVConferencePreview *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v40 = (__CFString *)[(AVConferencePreview *)self performSelector:sel_logPrefix];
    }
    else {
      v40 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v45 = VRTraceErrorLogLevelToCSTR();
      v46 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v50 = v45;
        __int16 v51 = 2080;
        uint64_t v52 = "-[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:]";
        __int16 v53 = 1024;
        int v54 = 1117;
        __int16 v55 = 2112;
        id v56 = v40;
        __int16 v57 = 2048;
        v58 = self;
        _os_log_error_impl(&dword_1E1EA4000, v46, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d %@(%p) Failed to allocate CALayerHost", buf, 0x30u);
      }
    }
  }
LABEL_24:
}

uint64_t __80__AVConferencePreview_createPreviewCALayerHostForRootLayer_withContextId_front___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [**(id **)(a1 + 48) setContextId:*(unsigned int *)(a1 + 88)];
  objc_msgSend(**(id **)(a1 + 48), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(**(id **)(a1 + 48), "setPosition:", *(double *)(a1 + 72) * 0.5, *(double *)(a1 + 80) * 0.5);
  [**(id **)(a1 + 48) setName:*(void *)(a1 + 32)];
  [**(id **)(a1 + 48) setContentsGravity:*MEMORY[0x1E4F3A3E0]];
  [**(id **)(a1 + 48) setAllowsHitTesting:0];
  [*(id *)(a1 + 40) addSublayer:**(void **)(a1 + 48)];
  [*(id *)(a1 + 40) setAllowsHitTesting:0];
  [MEMORY[0x1E4F39CF8] commit];
  [MEMORY[0x1E4F39CF8] flush];
  uint64_t v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 synchronize];
}

- (void)setLocalVideoLayerHost:(id)a3 front:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ((AVConferencePreview *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      id v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        [a3 bounds];
        uint64_t v10 = NSStringFromRect(v43);
        [a3 frame];
        uint64_t v11 = NSStringFromRect(v44);
        objc_msgSend((id)objc_msgSend(a3, "superlayer"), "bounds");
        uint64_t v12 = NSStringFromRect(v45);
        objc_msgSend((id)objc_msgSend(a3, "superlayer"), "frame");
        *(_DWORD *)buf = 136317186;
        uint64_t v25 = v8;
        __int16 v26 = 2080;
        uint64_t v27 = "-[AVConferencePreview setLocalVideoLayerHost:front:]";
        __int16 v28 = 1024;
        int v29 = 1147;
        __int16 v30 = 2048;
        id v31 = a3;
        __int16 v32 = 1024;
        *(_DWORD *)uint32_t v33 = v4;
        *(_WORD *)&v33[4] = 2112;
        *(void *)&v33[6] = v10;
        *(_WORD *)&v33[14] = 2112;
        *(void *)&v33[16] = v11;
        __int16 v34 = 2112;
        id v35 = v12;
        __int16 v36 = 2112;
        uint64_t v37 = NSStringFromRect(v46);
        uint64_t v13 = "AVConferencePreview [%s] %s:%d layer=%p, front=%d, bounds=%@ frame=%@, super layer bounds=%@ frame=%@";
        uint64_t v14 = v9;
        uint32_t v15 = 84;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v7 = (__CFString *)[(AVConferencePreview *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        [a3 bounds];
        uint64_t v18 = NSStringFromRect(v47);
        [a3 frame];
        uint64_t v19 = NSStringFromRect(v48);
        objc_msgSend((id)objc_msgSend(a3, "superlayer"), "bounds");
        uint64_t v20 = NSStringFromRect(v49);
        objc_msgSend((id)objc_msgSend(a3, "superlayer"), "frame");
        *(_DWORD *)buf = 136317698;
        uint64_t v25 = v16;
        __int16 v26 = 2080;
        uint64_t v27 = "-[AVConferencePreview setLocalVideoLayerHost:front:]";
        __int16 v28 = 1024;
        int v29 = 1147;
        __int16 v30 = 2112;
        id v31 = v7;
        __int16 v32 = 2048;
        *(void *)uint32_t v33 = self;
        *(_WORD *)&v33[8] = 2048;
        *(void *)&v33[10] = a3;
        *(_WORD *)&v33[18] = 1024;
        *(_DWORD *)&v33[20] = v4;
        __int16 v34 = 2112;
        id v35 = v18;
        __int16 v36 = 2112;
        uint64_t v37 = v19;
        __int16 v38 = 2112;
        v39 = v20;
        __int16 v40 = 2112;
        uint64_t v41 = NSStringFromRect(v50);
        uint64_t v13 = "AVConferencePreview [%s] %s:%d %@(%p) layer=%p, front=%d, bounds=%@ frame=%@, super layer bounds=%@ frame=%@";
        uint64_t v14 = v17;
        uint32_t v15 = 104;
        goto LABEL_11;
      }
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke;
  block[3] = &unk_1E6DB3E18;
  block[4] = self;
  void block[5] = a3;
  BOOL v23 = v4;
  dispatch_async(avConferencePreviewQueue, block);
}

void __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) setRootPreviewLayer:*(void *)(a1 + 40) front:*(unsigned __int8 *)(a1 + 48)])
  {
    uint64_t v9 = 40;
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v9 = 48;
    }
    uint64_t v11 = *(char **)(a1 + 32);
    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)&v11[v9];
    [v10 bounds];
    objc_msgSend(v11, "setBounds:forLayerHost:", v12);
    goto LABEL_14;
  }
  if (!*(void *)(a1 + 40))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_1();
        }
      }
      goto LABEL_14;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v28 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      __int16 v28 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v34 = VRTraceErrorLogLevelToCSTR();
      id v35 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        __int16 v36 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136316162;
        uint64_t v44 = v34;
        __int16 v45 = 2080;
        NSRect v46 = "-[AVConferencePreview setLocalVideoLayerHost:front:]_block_invoke";
        __int16 v47 = 1024;
        int v48 = 1153;
        __int16 v49 = 2112;
        NSRect v50 = v28;
        __int16 v51 = 2048;
        uint64_t v52 = v36;
        uint64_t v37 = "AVConferencePreview [%s] %s:%d %@(%p) Invalid layer parameter";
LABEL_61:
        _os_log_error_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_ERROR, v37, buf, 0x30u);
      }
    }
LABEL_14:
    uint64_t v3 = 0;
LABEL_15:
    BOOL v4 = 0;
    goto LABEL_24;
  }
  uint64_t v2 = [objc_alloc(NSNumber) initWithBool:*(unsigned __int8 *)(a1 + 48)];
  if (!v2)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_2();
        }
      }
      goto LABEL_14;
    }
    if (objc_opt_respondsToSelector()) {
      int v29 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      int v29 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      id v35 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        v39 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136316162;
        uint64_t v44 = v38;
        __int16 v45 = 2080;
        NSRect v46 = "-[AVConferencePreview setLocalVideoLayerHost:front:]_block_invoke";
        __int16 v47 = 1024;
        int v48 = 1155;
        __int16 v49 = 2112;
        NSRect v50 = v29;
        __int16 v51 = 2048;
        uint64_t v52 = v39;
        uint64_t v37 = "AVConferencePreview [%s] %s:%d %@(%p) Failed to allocate camera facing";
        goto LABEL_61;
      }
    }
    goto LABEL_14;
  }
  uint64_t v3 = (void *)v2;
  [*(id *)(a1 + 40) bounds];
  BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v3, @"videoSlotFacing", NSStringFromRect(v62), @"conferenceVisualRectangle", 0);
  if (!v4)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_3();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v30 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        __int16 v30 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v40 = VRTraceErrorLogLevelToCSTR();
        uint64_t v41 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v42 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          uint64_t v44 = v40;
          __int16 v45 = 2080;
          NSRect v46 = "-[AVConferencePreview setLocalVideoLayerHost:front:]_block_invoke";
          __int16 v47 = 1024;
          int v48 = 1159;
          __int16 v49 = 2112;
          NSRect v50 = v30;
          __int16 v51 = 2048;
          uint64_t v52 = v42;
          _os_log_error_impl(&dword_1E1EA4000, v41, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d %@(%p) Failed to allocate args dictionary", buf, 0x30u);
        }
      }
    }
    goto LABEL_15;
  }
  uint64_t v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) sendMessageSync:"previewGetLocalVideoContext" arguments:v4 xpcArguments:0];
  if (!v5
    || (uint8_t v6 = v5, [v5 objectForKeyedSubscript:@"ERROR"])
    || [v6 objectForKeyedSubscript:@"SERVERDIED"])
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_4();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v27 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v27 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        __int16 v32 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint32_t v33 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          uint64_t v44 = v31;
          __int16 v45 = 2080;
          NSRect v46 = "-[AVConferencePreview setLocalVideoLayerHost:front:]_block_invoke";
          __int16 v47 = 1024;
          int v48 = 1161;
          __int16 v49 = 2112;
          NSRect v50 = v27;
          __int16 v51 = 2048;
          uint64_t v52 = v33;
          _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d %@(%p) Set preview layer bounds xpc call failed", buf, 0x30u);
        }
      }
    }
  }
  else
  {
    BOOL v7 = (__CFString *)[v6 objectForKeyedSubscript:@"videoContextId"];
    objc_msgSend(*(id *)(a1 + 32), "createPreviewCALayerHostForRootLayer:withContextId:front:", *(void *)(a1 + 40), -[__CFString unsignedIntValue](v7, "unsignedIntValue"), *(unsigned __int8 *)(a1 + 48));
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint32_t v15 = *(void **)(a1 + 40);
          uint64_t v16 = [v15 name];
          int v17 = *(unsigned __int8 *)(a1 + 48);
          *(_DWORD *)buf = 136316674;
          uint64_t v44 = v13;
          __int16 v45 = 2080;
          NSRect v46 = "-[AVConferencePreview setLocalVideoLayerHost:front:]_block_invoke";
          __int16 v47 = 1024;
          int v48 = 1164;
          __int16 v49 = 2112;
          NSRect v50 = v7;
          __int16 v51 = 2048;
          uint64_t v52 = v15;
          __int16 v53 = 2112;
          uint64_t v54 = v16;
          __int16 v55 = 1024;
          LODWORD(v56) = v17;
          uint64_t v18 = "AVConferencePreview [%s] %s:%d Received contextId=%@ for layer=%p named=\"%@\" facing=%d";
          uint64_t v19 = v14;
          uint32_t v20 = 64;
LABEL_23:
          _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        uint64_t v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v24 = *(void **)(a1 + 32);
          BOOL v23 = *(void **)(a1 + 40);
          uint64_t v25 = [v23 name];
          int v26 = *(unsigned __int8 *)(a1 + 48);
          *(_DWORD *)buf = 136317186;
          uint64_t v44 = v21;
          __int16 v45 = 2080;
          NSRect v46 = "-[AVConferencePreview setLocalVideoLayerHost:front:]_block_invoke";
          __int16 v47 = 1024;
          int v48 = 1164;
          __int16 v49 = 2112;
          NSRect v50 = v8;
          __int16 v51 = 2048;
          uint64_t v52 = v24;
          __int16 v53 = 2112;
          uint64_t v54 = (uint64_t)v7;
          __int16 v55 = 2048;
          id v56 = v23;
          __int16 v57 = 2112;
          uint64_t v58 = v25;
          __int16 v59 = 1024;
          int v60 = v26;
          uint64_t v18 = "AVConferencePreview [%s] %s:%d %@(%p) Received contextId=%@ for layer=%p named=\"%@\" facing=%d";
          uint64_t v19 = v22;
          uint32_t v20 = 84;
          goto LABEL_23;
        }
      }
    }
  }
LABEL_24:
}

- (void)setLocalCamera:(unsigned int)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  BOOL v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      -[AVConferencePreview setLocalCamera:]();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint8_t v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[AVConferencePreview setLocalCamera:]";
      __int16 v11 = 1024;
      int v12 = 1188;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d -setLocalCamera: called on embedded, ignoring", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)resetLocalCameraAfterServerDisconnect
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d localCameraUID is nil UID", v2, v3, v4, v5, v6);
}

void __60__AVConferencePreview_resetLocalCameraAfterServerDisconnect__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 144);
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      __int16 v9 = "-[AVConferencePreview resetLocalCameraAfterServerDisconnect]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 1206;
      __int16 v12 = 2112;
      uint64_t v13 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Server disconnected, reseting local camera to: %@", buf, 0x26u);
    }
  }
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", *(void *)(*(void *)(a1 + 32) + 144), @"localCameraUIDString", 0);
  [*(id *)(*(void *)(a1 + 32) + 8) sendMessageAsync:"previewSetLocalCamera" arguments:v5];
}

- (void)setLocalCameraWithUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint8_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVConferencePreview setLocalCameraWithUID:]";
      __int16 v15 = 1024;
      int v16 = 1218;
      __int16 v17 = 2112;
      id v18 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d requestedCameraUniqueID = %@", buf, 0x26u);
    }
  }
  if (a3)
  {
    if ([a3 isEqualToString:self->_localCameraUID])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        __int16 v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v12 = v7;
          __int16 v13 = 2080;
          uint64_t v14 = "-[AVConferencePreview setLocalCameraWithUID:]";
          __int16 v15 = 1024;
          int v16 = 1230;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d camera already set", buf, 0x1Cu);
        }
      }
    }
    else
    {

      self->_localCameraUID = (NSString *)a3;
      avConferencePreviewQueue = self->avConferencePreviewQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__AVConferencePreview_setLocalCameraWithUID___block_invoke;
      block[3] = &unk_1E6DB3DC8;
      block[4] = self;
      dispatch_async(avConferencePreviewQueue, block);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[AVConferencePreview setLocalCameraWithUID:]();
    }
  }
}

void __45__AVConferencePreview_setLocalCameraWithUID___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", *(void *)(*(void *)(a1 + 32) + 144), @"localCameraUIDString", 0);
  [*(id *)(*(void *)(a1 + 32) + 8) sendMessageAsync:"previewSetLocalCamera" arguments:v2];
}

- (void)setFollowSystemCameraEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      __int16 v9 = "-[AVConferencePreview setFollowSystemCameraEnabled:]";
      __int16 v10 = 1024;
      int v11 = 1239;
      __int16 v12 = 1024;
      BOOL v13 = v3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d enabled=%d", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (unsigned)localCamera
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  BOOL v3 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 5)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v4;
      __int16 v11 = 2080;
      __int16 v12 = "-[AVConferencePreview localCamera]";
      __int16 v13 = 1024;
      int v14 = 1263;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d -localCamera called on embedded, ignoring", (uint8_t *)&v9, 0x1Cu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315906;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      __int16 v12 = "-[AVConferencePreview localCamera]";
      __int16 v13 = 1024;
      int v14 = 1276;
      __int16 v15 = 1024;
      int v16 = 0;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d localCamera=%u", (uint8_t *)&v9, 0x22u);
    }
  }
  return 0;
}

- (void)setLocalScreenAttributes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = v5;
      __int16 v12 = 2080;
      __int16 v13 = "-[AVConferencePreview setLocalScreenAttributes:]";
      __int16 v14 = 1024;
      int v15 = 1350;
      __int16 v16 = 2080;
      uint64_t v17 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d screenAttributes=%s", buf, 0x26u);
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__AVConferencePreview_setLocalScreenAttributes___block_invoke;
  v9[3] = &unk_1E6DB3E40;
  v9[4] = a3;
  void v9[5] = self;
  dispatch_async(avConferencePreviewQueue, v9);
}

void __48__AVConferencePreview_setLocalScreenAttributes___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) orientation]
    && [*(id *)(a1 + 32) orientation] != 1)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) ratio];
    *(void *)(v5 + 80) = v6;
    *(void *)(v5 + 88) = v7;
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) ratio];
    *(void *)(v2 + 64) = v3;
    *(void *)(v2 + 72) = v4;
  }
  id v9 = (id)[*(id *)(a1 + 32) copyEncodedDictionary];
  __int16 v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"localVideoAttributes", 0);
  [*(id *)(*(void *)(a1 + 40) + 8) sendMessageAsync:"previewSetLocalScreenAttributes" arguments:v8 reply:0];
}

- (id)localScreenAttributesForVideoAttributes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3052000000;
  __int16 v14 = __Block_byref_object_copy__33;
  int v15 = __Block_byref_object_dispose__33;
  uint64_t v16 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AVConferencePreview_localScreenAttributesForVideoAttributes___block_invoke;
  block[3] = &unk_1E6DB43B0;
  void block[5] = self;
  void block[6] = &v11;
  block[4] = a3;
  dispatch_sync(avConferencePreviewQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (void *)v12[5];
      if (v6) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = v4;
      __int16 v19 = 2080;
      uint32_t v20 = "-[AVConferencePreview localScreenAttributesForVideoAttributes:]";
      __int16 v21 = 1024;
      int v22 = 1412;
      __int16 v23 = 2080;
      __int16 v24 = v7;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Returning %s", buf, 0x26u);
    }
  }
  __int16 v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __63__AVConferencePreview_localScreenAttributesForVideoAttributes___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = +[VideoAttributes videoAttributesWithVideoAttributes:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 32) orientation]
    && [*(id *)(a1 + 32) orientation] != 1)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v3 = (double *)(v5 + 80);
    uint64_t v4 = (double *)(v5 + 88);
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = (double *)(v2 + 64);
    uint64_t v4 = (double *)(v2 + 72);
  }
  double v6 = *v3;
  double v7 = *v4;
  __int16 v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return objc_msgSend(v8, "setRatio:", v6, v7);
}

- (void)beginPreviewToPIPAnimation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVConferencePreview_beginPreviewToPIPAnimation__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      id v9 = "-[AVConferencePreview beginPreviewToPIPAnimation]";
      __int16 v10 = 1024;
      int v11 = 1432;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d beginPreviewToPIPAnimation", buf, 0x1Cu);
    }
  }
}

uint64_t __49__AVConferencePreview_beginPreviewToPIPAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) sendMessageAsync:"previewBeginPreviewToPIPAnimation" arguments:0 reply:0];
}

- (void)endPreviewToPIPAnimation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVConferencePreview_endPreviewToPIPAnimation__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      id v9 = "-[AVConferencePreview endPreviewToPIPAnimation]";
      __int16 v10 = 1024;
      int v11 = 1450;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d endPreviewToPIPAnimation", buf, 0x1Cu);
    }
  }
}

uint64_t __47__AVConferencePreview_endPreviewToPIPAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) sendMessageAsync:"previewEndPreviewToPIPAnimation" arguments:0 reply:0];
}

- (void)beginPIPToPreviewAnimation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVConferencePreview_beginPIPToPreviewAnimation__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      id v9 = "-[AVConferencePreview beginPIPToPreviewAnimation]";
      __int16 v10 = 1024;
      int v11 = 1468;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d beginPIPToPreviewAnimation", buf, 0x1Cu);
    }
  }
}

uint64_t __49__AVConferencePreview_beginPIPToPreviewAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) sendMessageAsync:"previewBeginPIPToPreviewAnimation" arguments:0 reply:0];
}

- (void)endPIPToPreviewAnimation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVConferencePreview_endPIPToPreviewAnimation__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      id v9 = "-[AVConferencePreview endPIPToPreviewAnimation]";
      __int16 v10 = 1024;
      int v11 = 1486;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d endPIPToPreviewAnimation", buf, 0x1Cu);
    }
  }
}

uint64_t __47__AVConferencePreview_endPIPToPreviewAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) sendMessageAsync:"previewEndPIPToPreviewAnimation" arguments:0 reply:0];
}

- (void)setCameraZoomFactor:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AVConferencePreview_setCameraZoomFactor___block_invoke;
  v7[3] = &unk_1E6DB4568;
  v7[4] = self;
  *(double *)&void v7[5] = a3;
  dispatch_async(avConferencePreviewQueue, v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    double v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      int v11 = "-[AVConferencePreview setCameraZoomFactor:]";
      __int16 v12 = 1024;
      int v13 = 1518;
      __int16 v14 = 2048;
      double v15 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d cameraZoomFactor=%f", buf, 0x26u);
    }
  }
}

void __43__AVConferencePreview_setCameraZoomFactor___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 121))
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v5 = (id)objc_msgSend(v2, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithDouble:", *(double *)(a1 + 40)), @"previewCameraZoomFactor", 0);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewCameraZoomFactor");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[AVConferencePreview setCameraZoomFactor:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 1515;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d cameraZoom not available", buf, 0x1Cu);
    }
  }
}

- (void)setCameraZoomFactor:(double)a3 withRate:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVConferencePreview_setCameraZoomFactor_withRate___block_invoke;
  block[3] = &unk_1E6DB4518;
  block[4] = self;
  *(double *)&void block[5] = a3;
  *(double *)&void block[6] = a4;
  dispatch_async(avConferencePreviewQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    __int16 v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      int v13 = "-[AVConferencePreview setCameraZoomFactor:withRate:]";
      __int16 v14 = 1024;
      int v15 = 1537;
      __int16 v16 = 2048;
      double v17 = a3;
      __int16 v18 = 2048;
      double v19 = a4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d cameraZoomFactor=%f with rate=%f", buf, 0x30u);
    }
  }
}

void __52__AVConferencePreview_setCameraZoomFactor_withRate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 121))
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    id v6 = (id)objc_msgSend(v2, "initWithObjectsAndKeys:", v3, @"previewCameraZoomFactor", objc_msgSend(NSNumber, "numberWithDouble:", *(double *)(a1 + 48)), @"previewCameraZoomRate", 0);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewCameraZoomFactorRate");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    id v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      __int16 v10 = "-[AVConferencePreview setCameraZoomFactor:withRate:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 1534;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d cameraZoom not available", buf, 0x1Cu);
    }
  }
}

- (void)notifyCenterStageEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__AVConferencePreview_notifyCenterStageEnabled___block_invoke;
  v7[3] = &unk_1E6DB3DF0;
  BOOL v8 = a3;
  v7[4] = self;
  dispatch_async(avConferencePreviewQueue, v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    id v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      int v12 = "-[AVConferencePreview notifyCenterStageEnabled:]";
      __int16 v13 = 1024;
      int v14 = 1570;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d enabled=%d", buf, 0x22u);
    }
  }
}

uint64_t __48__AVConferencePreview_notifyCenterStageEnabled___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"previewCameraCinematicFraming";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v4[1] = @"previewCameraCinematicFramingSet";
  v5[0] = v2;
  v5[1] = MEMORY[0x1E4F1CC28];
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewCameraCinematicFraming", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v5, v4, 2), 0);
}

+ (BOOL)isEyeContactSupported
{
  return +[VCHardwareSettings isViewPointCorrectionSupported];
}

void __63__AVConferencePreview_didReceiveErrorFromCameraUniqueID_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(a2 + 40) UTF8String];
  uint64_t v7 = *(void *)(a2 + 48);
  int v8 = 136316162;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  __int16 v11 = "-[AVConferencePreview didReceiveErrorFromCameraUniqueID:error:]_block_invoke";
  __int16 v12 = 1024;
  int v13 = 244;
  __int16 v14 = 2080;
  uint64_t v15 = v6;
  __int16 v16 = 2112;
  uint64_t v17 = v7;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d cameraUID=%s, error=%@", (uint8_t *)&v8, 0x30u);
}

void __38__AVConferencePreview_didGetSnapshot___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Delegate does not respond to didGetSnapshot:", v2, v3, v4, v5, v6);
}

void __59__AVConferencePreview_cameraDidBecomeAvailableForUniqueID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Delegate does not respond to cameraDidBecomeAvailableForUniqueID:", v2, v3, v4, v5, v6);
}

void __71__AVConferencePreview_cameraDidBecomeInterruptedForForUniqueID_reason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Delegate does not respond to cameraDidBecomeInterruptedForForUniqueID:reason:", v2, v3, v4, v5, v6);
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d preview must not be NULL", v2, v3, v4, v5, v6);
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_81_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d previewCameraUIDChanged: cameraUID is nil", v2, v3, v4, v5, v6);
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d previewDidLocalVideoSlotChange failed", v2, v3, v4, v5, v6);
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Mismatched layer configuration, in layerhost mode, ignore reconnect until applications associates the layer", v2, v3, v4, v5, v6);
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_111_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d previewDidLocalVideoContextChange failed", v2, v3, v4, v5, v6);
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_111_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Mismatched layer configuration, not in layer host mode, ignore reconnect until applications associates the layer", v2, v3, v4, v5, v6);
}

- (void)isPreviewRunning
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d _isPreviewRunning=%d", v2, v3, v4, 886);
}

- (void)isCameraZoomAvailable
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d returning %d", v2, v3, v4, 897);
}

- (void)currentZoomFactor
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d returning %f", v2, v3, v4, v5);
}

- (void)maxZoomFactor
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d returning %f", v2, v3, v4, v5);
}

void __48__AVConferencePreview_setLocalVideoLayer_front___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Received error from server in setLocalVideoLayer", v2, v3, v4, v5, v6);
}

- (void)newXPCObjectForFenceHandle:forLayerHost:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to create new fence", v2, v3, v4, v5, v6);
}

- (void)setBounds:forLayerHost:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to allocate camera facing number", v2, v3, v4, v5, v6);
}

- (void)setBounds:forLayerHost:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to create XPC representation for fence", v2, v3, v4, v5, v6);
}

- (void)setBounds:forLayerHost:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Set preview layer bounds xpc call failed", v2, v3, v4, v5, v6);
}

- (void)createPreviewCALayerHostForRootLayer:withContextId:front:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Invalid rootLayer or contextId", v2, v3, v4, v5, v6);
}

- (void)createPreviewCALayerHostForRootLayer:withContextId:front:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to allocate layer host name", v2, v3, v4, v5, v6);
}

- (void)createPreviewCALayerHostForRootLayer:withContextId:front:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to allocate CALayerHost", v2, v3, v4, v5, v6);
}

void __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Invalid layer parameter", v2, v3, v4, v5, v6);
}

void __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to allocate camera facing", v2, v3, v4, v5, v6);
}

void __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to allocate args dictionary", v2, v3, v4, v5, v6);
}

void __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d Set preview layer bounds xpc call failed", v2, v3, v4, v5, v6);
}

- (void)setLocalCamera:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[AVConferencePreview setLocalCamera:]";
  __int16 v6 = 1024;
  int v7 = 1182;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d ---- STOP! ---- setLocalCamera is deprecated! Use setLocalCameraWithUID instead! AVConferencePreview setLocalCamera %u", v3, 0x22u);
}

- (void)setLocalCameraWithUID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d requestedCamera returned nil UID", v2, v3, v4, v5, v6);
}

@end