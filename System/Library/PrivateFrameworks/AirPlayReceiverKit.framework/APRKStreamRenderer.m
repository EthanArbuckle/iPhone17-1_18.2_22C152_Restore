@interface APRKStreamRenderer
- (APRKStreamRenderer)initWithUniqueID:(id)a3 clientName:(id)a4 UIController:(OpaqueAPReceiverUIController *)a5 useCALayerForMirroring:(BOOL)a6;
- (APRKStreamRendererDelegate)delegate;
- (BOOL)_isRotatedTransform:(unint64_t)a3;
- (BOOL)_performStartRecordingWithOutputURL:(id)a3;
- (BOOL)_performStopRecording;
- (BOOL)_receiverSupportsMirroring;
- (BOOL)_sampleBufferRepresentsKeyFrame:(opaqueCMSampleBuffer *)a3;
- (BOOL)_shouldFlip:(unsigned int)a3;
- (BOOL)autoRotateLayerFollowingClientRotation;
- (BOOL)canRecord;
- (BOOL)isActive;
- (BOOL)isMirroringAudioStreamPaused;
- (BOOL)isMirroringVideoStreamPaused;
- (BOOL)isP2PWiFi;
- (BOOL)isPaused;
- (BOOL)isRecording;
- (BOOL)isWiredLink;
- (BOOL)processAudioSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (BOOL)processStopAudioSessionRequestWithSessionID:(unsigned int)a3;
- (BOOL)processStopScreenPresentationWithSessionID:(unsigned int)a3;
- (BOOL)processStopVideoPlaybackRequestWithSessionID:(unsigned int)a3;
- (BOOL)processVideoSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (BOOL)startRecordingWithOutputURL:(id)a3;
- (BOOL)stopRecording;
- (CGSize)videoFrameSize;
- (NSString)managedClientName;
- (NSUUID)uniqueID;
- (float)mirroringVolume;
- (id)HUDLayer;
- (id)backingMediaPlayer;
- (id)demoDeviceInfo;
- (id)ensembleInfo;
- (id)mediaPlayer;
- (id)mirroringLayer;
- (id)player;
- (id)sampleBufferDelegate;
- (id)videoQueuePerformanceDictionary;
- (int)_enqueueSampleBufferForRecording:(opaqueCMSampleBuffer *)a3 isAudioSBuf:(BOOL)a4;
- (int)_enqueueVideoFrameForRendering:(opaqueCMSampleBuffer *)a3;
- (signed)_ensureFigVideoQueue;
- (unint64_t)currentVideoPlaybackVersion;
- (unint64_t)streamRendererMode;
- (unsigned)audioSessionCount;
- (unsigned)currentVideoSessionID;
- (unsigned)screenSessionCount;
- (unsigned)videoSessionCount;
- (void)_cleanupInternalPlayer;
- (void)_cleanupPreviousRecordingIfExisting;
- (void)_ensureInternalPlayerFor:(int)a3;
- (void)_performUIControllerActionWithBlock:(id)a3;
- (void)_registerForFigVideoQueueNotifications;
- (void)_unregisterForFigVideoQueueNotifications;
- (void)_updateStreamingMode;
- (void)dealloc;
- (void)makeNowPlayingRenderer;
- (void)mediaPlayer:(id)a3 didGenerateFPSSecureStopRecordPayload:(id)a4;
- (void)mediaPlayer:(id)a3 wantsToPostNotification:(id)a4 withPayload:(id)a5;
- (void)mediaPlayer:(id)a3 wantsToSendUpstreamMessageWithDictionary:(id)a4;
- (void)mediaPlayerNeedsTLSInfo:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)postVideoV1EventWithType:(const char *)a3 params:(__CFDictionary *)a4;
- (void)processHidePasscodePromptRequest;
- (void)processSenderUIEvent:(id)a3;
- (void)processShowPasscodePromptRequest:(id)a3;
- (void)processStartAudioSessionRequestWithSessionID:(unsigned int)a3 isScreenAudio:(BOOL)a4;
- (void)processStartScreenPresentationWithSessionID:(unsigned int)a3;
- (void)processStartVideoPlaybackRequestWithWithSessionID:(unsigned int)a3 version:(unint64_t)a4;
- (void)setAutoRotateLayerFollowingClientRotation:(BOOL)a3;
- (void)setCanRecord:(BOOL)a3;
- (void)setDeferLayerRendering:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDemoDeviceInfo:(id)a3;
- (void)setEnsembleInfo:(id)a3;
- (void)setIsMirroringAudioStreamPaused:(BOOL)a3;
- (void)setIsMirroringVideoStreamPaused:(BOOL)a3;
- (void)setIsP2PWiFi:(BOOL)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setIsWiredLink:(BOOL)a3;
- (void)setMirroringVolume:(float)a3;
- (void)setReceiverNetworkClock:(OpaqueAPSNetworkClock *)a3;
- (void)setSampleBufferDelegate:(id)a3;
- (void)setSessionReceiverAddress:(OpaqueAPSNetworkAddress *)a3;
- (void)setVideoV1Delegate:(id)a3 withDelegateQueue:(id)a4;
- (void)stop;
- (void)updateDisplayInfo;
@end

@implementation APRKStreamRenderer

- (void)dealloc
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  backingUIControllerWeakRef = self->_backingUIControllerWeakRef;
  if (backingUIControllerWeakRef)
  {
    CFRelease(backingUIControllerWeakRef);
    self->_backingUIControllerWeakRef = 0;
  }
  sessionReceiverAddr = self->_sessionReceiverAddr;
  if (sessionReceiverAddr)
  {
    CFRelease(sessionReceiverAddr);
    self->_sessionReceiverAddr = 0;
  }
  receiverNetworkClock = self->_receiverNetworkClock;
  if (receiverNetworkClock)
  {
    CFRelease(receiverNetworkClock);
    self->_receiverNetworkClock = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)APRKStreamRenderer;
  [(APRKStreamRenderer *)&v6 dealloc];
}

- (void)stop
{
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__APRKStreamRenderer_stop__block_invoke;
  block[3] = &unk_264EA1AE8;
  block[4] = self;
  dispatch_async(rendererStateUpdateQueue, block);
}

uint64_t __26__APRKStreamRenderer_stop__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(unsigned char *)(v2 + 16))
  {
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1) {
        return LogPrintF();
      }
      result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (v3 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(v1 + 32), v3))
      {
        uint64_t v5 = v2;
        LogPrintF();
        uint64_t v2 = *(void *)(v1 + 32);
      }
    }
    *(unsigned char *)(v2 + 16) = 1;
    objc_msgSend(*(id *)(*(void *)(v1 + 32) + 88), "removeObserver:forKeyPath:", *(void *)(v1 + 32), @"bounds", v5);
    v4 = *(CFTypeRef **)(v1 + 32);
    if (v4[33])
    {
      CFRelease(v4[33]);
      *(void *)(*(void *)(v1 + 32) + 264) = 0;
      v4 = *(CFTypeRef **)(v1 + 32);
    }
    if (v4[34])
    {
      CFRelease(v4[34]);
      *(void *)(*(void *)(v1 + 32) + 272) = 0;
      v4 = *(CFTypeRef **)(v1 + 32);
    }
    return [(CFTypeRef *)v4 _performUIControllerActionWithBlock:&__block_literal_global_1];
  }
  return result;
}

uint64_t __26__APRKStreamRenderer_stop__block_invoke_2()
{
  return UIControllerPostNotificationForRendererStoppedEvent();
}

- (BOOL)startRecordingWithOutputURL:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    [v4 absoluteString];
    v9 = v8 = self;
    LogPrintF();
  }
  if ([(APRKStreamRenderer *)self canRecord])
  {
    rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__APRKStreamRenderer_startRecordingWithOutputURL___block_invoke;
    block[3] = &unk_264EA1BD8;
    v12 = &v13;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(rendererVideoBufferQueue, block);

    BOOL v6 = *((unsigned char *)v14 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
    *((unsigned char *)v14 + 24) = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v6;
}

uint64_t __50__APRKStreamRenderer_startRecordingWithOutputURL___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _performStartRecordingWithOutputURL:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)stopRecording
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__APRKStreamRenderer_stopRecording__block_invoke;
  block[3] = &unk_264EA1C28;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(rendererVideoBufferQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __35__APRKStreamRenderer_stopRecording__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _performStopRecording];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)makeNowPlayingRenderer
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_streamRendererMode == 2)
  {
    [(APRKStreamRenderer *)self _performUIControllerActionWithBlock:&__block_literal_global_9];
  }
}

uint64_t __44__APRKStreamRenderer_makeNowPlayingRenderer__block_invoke()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

- (id)mirroringLayer
{
  return self->_mirroringLayer;
}

- (id)player
{
  return [(APRKMediaPlayer *)self->_player backingAVQueuePlayer];
}

- (id)mediaPlayer
{
  return self->_player;
}

- (void)updateDisplayInfo
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(APRKStreamRenderer *)self _performUIControllerActionWithBlock:&__block_literal_global_12];
}

uint64_t __39__APRKStreamRenderer_updateDisplayInfo__block_invoke()
{
  return UIControllerPostNotificationForUpdateDisplayInfo();
}

- (BOOL)isRecording
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__APRKStreamRenderer_isRecording__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererVideoBufferQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__APRKStreamRenderer_isRecording__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 104) != 0;
  return result;
}

- (BOOL)canRecord
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__APRKStreamRenderer_canRecord__block_invoke;
  v6[3] = &unk_264EA1C28;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(rendererStateUpdateQueue, v6);
  if (*((unsigned char *)v8 + 24))
  {
    char v3 = +[APRKStreamRenderingManager sharedInstance];
    int v4 = [v3 optimizeAudioRenderingLatency] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __31__APRKStreamRenderer_canRecord__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 19);
  return result;
}

- (CGSize)videoFrameSize
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  id v11 = &unk_23D4FE793;
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__APRKStreamRenderer_videoFrameSize__block_invoke;
  v7[3] = &unk_264EA1C28;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(rendererVideoBufferQueue, v7);
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

__n128 __36__APRKStreamRenderer_videoFrameSize__block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 168);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (void)setMirroringVolume:(float)a3
{
}

- (float)mirroringVolume
{
  [(AVSampleBufferAudioRenderer *)self->_audioRenderer volume];
  return result;
}

- (void)setIsPaused:(BOOL)a3
{
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__APRKStreamRenderer_setIsPaused___block_invoke;
  v6[3] = &unk_264EA1DA8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(rendererVideoBufferQueue, v6);
  self->_isMirroringAudioStreamPaused = a3;
}

uint64_t __34__APRKStreamRenderer_setIsPaused___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 25) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isPaused
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__APRKStreamRenderer_isPaused__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererVideoBufferQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__APRKStreamRenderer_isPaused__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 25);
  return result;
}

- (void)setIsMirroringVideoStreamPaused:(BOOL)a3
{
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__APRKStreamRenderer_setIsMirroringVideoStreamPaused___block_invoke;
  v4[3] = &unk_264EA1DA8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(rendererVideoBufferQueue, v4);
}

uint64_t __54__APRKStreamRenderer_setIsMirroringVideoStreamPaused___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(unsigned char *)(v2 + 25) && !*(unsigned char *)(result + 40))
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 24) = 1;
    float result = [*(id *)(v1 + 32) _performUIControllerActionWithBlock:&__block_literal_global_15];
    uint64_t v2 = *(void *)(v1 + 32);
  }
  *(unsigned char *)(v2 + 25) = *(unsigned char *)(v1 + 40);
  if (gLogCategory_AirPlayReceiverKit <= 30)
  {
    if (gLogCategory_AirPlayReceiverKit != -1) {
      return LogPrintF();
    }
    float result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

uint64_t __54__APRKStreamRenderer_setIsMirroringVideoStreamPaused___block_invoke_2()
{
  return UIControllerPostNotificationForKeyFrameRequest();
}

- (BOOL)isMirroringVideoStreamPaused
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__APRKStreamRenderer_isMirroringVideoStreamPaused__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererVideoBufferQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__APRKStreamRenderer_isMirroringVideoStreamPaused__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 25);
  return result;
}

- (void)setIsMirroringAudioStreamPaused:(BOOL)a3
{
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__APRKStreamRenderer_setIsMirroringAudioStreamPaused___block_invoke;
  v4[3] = &unk_264EA1DA8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(rendererVideoBufferQueue, v4);
}

uint64_t __54__APRKStreamRenderer_setIsMirroringAudioStreamPaused___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 26) = *(unsigned char *)(result + 40);
  if (gLogCategory_AirPlayReceiverKit <= 30)
  {
    if (gLogCategory_AirPlayReceiverKit != -1) {
      return LogPrintF();
    }
    float result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

- (void)setSampleBufferDelegate:(id)a3
{
  id v4 = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__APRKStreamRenderer_setSampleBufferDelegate___block_invoke;
  block[3] = &unk_264EA1B88;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(rendererVideoBufferQueue, block);
}

id __46__APRKStreamRenderer_setSampleBufferDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 320), *(id *)(a1 + 40));
}

- (void)postVideoV1EventWithType:(const char *)a3 params:(__CFDictionary *)a4
{
  if (a3)
  {
    if (gLogCategory_AirPlayReceiverKit <= 10
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      BOOL v7 = a3;
      id v8 = a4;
      LogPrintF();
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__APRKStreamRenderer_postVideoV1EventWithType_params___block_invoke;
    v9[3] = &__block_descriptor_48_e39_v16__0__OpaqueAPReceiverUIController__8l;
    v9[4] = a3;
    v9[5] = a4;
    -[APRKStreamRenderer _performUIControllerActionWithBlock:](self, "_performUIControllerActionWithBlock:", v9, v7, v8);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

uint64_t __54__APRKStreamRenderer_postVideoV1EventWithType_params___block_invoke(uint64_t a1, uint64_t a2)
{
  return UIControllerPostVideoV1Event(a2, *(const char **)(a1 + 32), *(const __CFDictionary **)(a1 + 40));
}

- (void)setVideoV1Delegate:(id)a3 withDelegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__APRKStreamRenderer_setVideoV1Delegate_withDelegateQueue___block_invoke;
    v9[3] = &unk_264EA1DF0;
    id v10 = v6;
    id v11 = v8;
    [(APRKStreamRenderer *)self _performUIControllerActionWithBlock:v9];
  }
  else if (gLogCategory_AirPlayReceiverKit <= 90 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __59__APRKStreamRenderer_setVideoV1Delegate_withDelegateQueue___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)setIsWiredLink:(BOOL)a3
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__APRKStreamRenderer_setIsWiredLink___block_invoke;
  block[3] = &unk_264EA1DA8;
  block[4] = self;
  BOOL v7 = a3;
  dispatch_sync(rendererStateUpdateQueue, block);
}

uint64_t __37__APRKStreamRenderer_setIsWiredLink___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 17) = *(unsigned char *)(result + 40);
  *(unsigned char *)(*(void *)(result + 32) + 19) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isWiredLink
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__APRKStreamRenderer_isWiredLink__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__APRKStreamRenderer_isWiredLink__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 17);
  return result;
}

- (void)setIsP2PWiFi:(BOOL)a3
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__APRKStreamRenderer_setIsP2PWiFi___block_invoke;
  block[3] = &unk_264EA1DA8;
  block[4] = self;
  BOOL v7 = a3;
  dispatch_sync(rendererStateUpdateQueue, block);
}

uint64_t __35__APRKStreamRenderer_setIsP2PWiFi___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 18) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isP2PWiFi
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__APRKStreamRenderer_isP2PWiFi__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__APRKStreamRenderer_isP2PWiFi__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 18);
  return result;
}

- (void)setCanRecord:(BOOL)a3
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__APRKStreamRenderer_setCanRecord___block_invoke;
  block[3] = &unk_264EA1DA8;
  block[4] = self;
  BOOL v7 = a3;
  dispatch_sync(rendererStateUpdateQueue, block);
}

uint64_t __35__APRKStreamRenderer_setCanRecord___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 19) = *(unsigned char *)(result + 40);
  return result;
}

- (unint64_t)currentVideoPlaybackVersion
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__APRKStreamRenderer_currentVideoPlaybackVersion__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererVideoBufferQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__APRKStreamRenderer_currentVideoPlaybackVersion__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 304);
  return result;
}

- (id)videoQueuePerformanceDictionary
{
  id v9 = 0;
  if (self->_figVideoQueue
    && ((CMBaseObject = FigVideoQueueGetCMBaseObject(), (uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v4 = 0)
      : (uint64_t v4 = v3),
        (BOOL v5 = *(void (**)(uint64_t, void, void, id *))(v4 + 48)) != 0))
  {
    v5(CMBaseObject, *MEMORY[0x263F12500], *MEMORY[0x263EFFB08], &v9);
    id v6 = v9;
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)sampleBufferDelegate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__APRKStreamRenderer_sampleBufferDelegate__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererVideoBufferQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __42__APRKStreamRenderer_sampleBufferDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 320));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
  return MEMORY[0x270F9A758](WeakRetained, v4);
}

- (id)HUDLayer
{
  return self->_debugLayer;
}

- (id)ensembleInfo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__APRKStreamRenderer_ensembleInfo__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__APRKStreamRenderer_ensembleInfo__block_invoke(uint64_t a1)
{
}

- (id)demoDeviceInfo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__APRKStreamRenderer_demoDeviceInfo__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__APRKStreamRenderer_demoDeviceInfo__block_invoke(uint64_t a1)
{
}

- (APRKStreamRenderer)initWithUniqueID:(id)a3 clientName:(id)a4 UIController:(OpaqueAPReceiverUIController *)a5 useCALayerForMirroring:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v38.receiver = self;
  v38.super_class = (Class)APRKStreamRenderer;
  uint64_t v13 = [(APRKStreamRenderer *)&v38 init];
  if (v13)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)v13 + 44, a3);
    *((void *)v13 + 4) = 0;
    *((_DWORD *)v13 + 7) = 0;
    uint64_t v14 = [v12 copy];
    uint64_t v15 = (void *)*((void *)v13 + 45);
    *((void *)v13 + 45) = v14;

    *((_WORD *)v13 + 8) = 0;
    v13[19] = 0;
    char v16 = (void *)*((void *)v13 + 11);
    *((void *)v13 + 11) = 0;

    v13[20] = a6;
    *(_WORD *)(v13 + 21) = 0;
    *((_DWORD *)v13 + 6) = 0x1000000;
    v13[344] = 1;
    *((void *)v13 + 47) = 0;
    *((void *)v13 + 38) = 0;
    *(_OWORD *)(v13 + 168) = *MEMORY[0x263F001B0];
    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.APRKStreamRenderer.rendererVideoBufferQueue", v17);
    v19 = (void *)*((void *)v13 + 17);
    *((void *)v13 + 17) = v18;

    v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.APRKStreamRenderer.rendererAudioBufferQueue", v20);
    v22 = (void *)*((void *)v13 + 18);
    *((void *)v13 + 18) = v21;

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.APRKStreamRenderer.rendererStateUpdateQueue", 0);
    v24 = (void *)*((void *)v13 + 19);
    *((void *)v13 + 19) = v23;

    v25 = +[APRKStreamRenderingManager sharedInstance];
    uint64_t v26 = [v25 delegateQueue];
    v27 = (void *)*((void *)v13 + 20);
    *((void *)v13 + 20) = v26;

    uint64_t v28 = MEMORY[0x263F01090];
    long long v29 = *MEMORY[0x263F01090];
    *(_OWORD *)(v13 + 44) = *MEMORY[0x263F01090];
    uint64_t v30 = *(void *)(v28 + 16);
    *(void *)(v13 + 60) = v30;
    *(_OWORD *)(v13 + 232) = v29;
    *((void *)v13 + 31) = v30;
    if (a5)
    {
      uint64_t v31 = FigCFWeakReferenceHolderCreateWithReferencedObject();
      *((void *)v13 + 1) = v31;
      if (!v31
        && gLogCategory_AirPlayReceiverKit <= 90
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterAddListener();
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__APRKStreamRenderer_initWithUniqueID_clientName_UIController_useCALayerForMirroring___block_invoke;
    aBlock[3] = &unk_264EA1AE8;
    v37 = v13;
    v32 = (void (**)(void))_Block_copy(aBlock);
    if (pthread_main_np())
    {
      v32[2](v32);
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __86__APRKStreamRenderer_initWithUniqueID_clientName_UIController_useCALayerForMirroring___block_invoke_2;
      block[3] = &unk_264EA1C78;
      v35 = v32;
      dispatch_sync(MEMORY[0x263EF83A0], block);
    }
  }

  return (APRKStreamRenderer *)v13;
}

uint64_t __86__APRKStreamRenderer_initWithUniqueID_clientName_UIController_useCALayerForMirroring___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[20] && [v2 _receiverSupportsMirroring])
  {
    uint64_t v3 = [MEMORY[0x263F157E8] layer];
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = v3;

    [*(id *)(*(void *)(a1 + 32) + 88) setName:@"APRKStreamRendererMirroringLayer"];
    [*(id *)(*(void *)(a1 + 32) + 88) addObserver:*(void *)(a1 + 32) forKeyPath:@"bounds" options:1 context:VideoRenderingLayerContext];
  }
  uint64_t v6 = [MEMORY[0x263F157E8] layer];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 96);
  *(void *)(v7 + 96) = v6;

  id v9 = *(void **)(*(void *)(a1 + 32) + 96);
  return [v9 setName:@"APRKHUDLayer"];
}

uint64_t __86__APRKStreamRenderer_initWithUniqueID_clientName_UIController_useCALayerForMirroring___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)backingMediaPlayer
{
  return self->_player;
}

- (unsigned)screenSessionCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__APRKStreamRenderer_screenSessionCount__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__APRKStreamRenderer_screenSessionCount__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 28);
  return result;
}

- (unsigned)audioSessionCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__APRKStreamRenderer_audioSessionCount__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__APRKStreamRenderer_audioSessionCount__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 36);
  return result;
}

- (unsigned)videoSessionCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__APRKStreamRenderer_videoSessionCount__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__APRKStreamRenderer_videoSessionCount__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 32);
  return result;
}

- (unsigned)currentVideoSessionID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__APRKStreamRenderer_currentVideoSessionID__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__APRKStreamRenderer_currentVideoSessionID__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 40);
  return result;
}

- (BOOL)isActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__APRKStreamRenderer_isActive__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__APRKStreamRenderer_isActive__block_invoke(uint64_t result)
{
  uint64_t v1 = *(_DWORD **)(result + 32);
  BOOL v2 = v1[7] || v1[9] || v1[8] != 0;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (void)setDeferLayerRendering:(BOOL)a3
{
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__APRKStreamRenderer_setDeferLayerRendering___block_invoke;
  v4[3] = &unk_264EA1DA8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(rendererStateUpdateQueue, v4);
}

uint64_t __45__APRKStreamRenderer_setDeferLayerRendering___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 21) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setSessionReceiverAddress:(OpaqueAPSNetworkAddress *)a3
{
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__APRKStreamRenderer_setSessionReceiverAddress___block_invoke;
  v4[3] = &unk_264EA1E18;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(rendererStateUpdateQueue, v4);
}

void __48__APRKStreamRenderer_setSessionReceiverAddress___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(const void **)(a1 + 40);
  char v3 = *(const void **)(v2 + 264);
  *(void *)(v2 + 264) = v1;
  if (v1) {
    CFRetain(v1);
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

- (void)setReceiverNetworkClock:(OpaqueAPSNetworkClock *)a3
{
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__APRKStreamRenderer_setReceiverNetworkClock___block_invoke;
  v4[3] = &unk_264EA1E18;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(rendererStateUpdateQueue, v4);
}

void __46__APRKStreamRenderer_setReceiverNetworkClock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(const void **)(a1 + 40);
  char v3 = *(const void **)(v2 + 272);
  *(void *)(v2 + 272) = v1;
  if (v1) {
    CFRetain(v1);
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

- (void)setEnsembleInfo:(id)a3
{
  id v4 = a3;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__APRKStreamRenderer_setEnsembleInfo___block_invoke;
  v7[3] = &unk_264EA1B88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(rendererStateUpdateQueue, v7);
}

void __38__APRKStreamRenderer_setEnsembleInfo___block_invoke(uint64_t a1)
{
}

- (void)setDemoDeviceInfo:(id)a3
{
  id v4 = a3;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__APRKStreamRenderer_setDemoDeviceInfo___block_invoke;
  v7[3] = &unk_264EA1B88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(rendererStateUpdateQueue, v7);
}

void __40__APRKStreamRenderer_setDemoDeviceInfo___block_invoke(uint64_t a1)
{
}

- (void)processShowPasscodePromptRequest:(id)a3
{
  id v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__APRKStreamRenderer_processShowPasscodePromptRequest___block_invoke;
  v7[3] = &unk_264EA1B88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(delegateQueue, v7);
}

void __55__APRKStreamRenderer_processShowPasscodePromptRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      id v4 = [*(id *)(a1 + 32) delegate];
      uint64_t v5 = *(void *)(a1 + 32);
      LogPrintF();
    }
    if (IsAppleInternalBuild()
      && gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      id v4 = *(void **)(a1 + 40);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate", v4, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 shouldShowPasscodePromptWithString:*(void *)(a1 + 40) forRenderer:*(void *)(a1 + 32)];
  }
}

- (void)processHidePasscodePromptRequest
{
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__APRKStreamRenderer_processHidePasscodePromptRequest__block_invoke;
  block[3] = &unk_264EA1AE8;
  void block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __54__APRKStreamRenderer_processHidePasscodePromptRequest__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      id v4 = [*(id *)(a1 + 32) delegate];
      uint64_t v5 = *(void *)(a1 + 32);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate", v4, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 shouldHidePasscodePromptForRenderer:*(void *)(a1 + 32)];
  }
}

- (void)processStartScreenPresentationWithSessionID:(unsigned int)a3
{
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__APRKStreamRenderer_processStartScreenPresentationWithSessionID___block_invoke;
  v4[3] = &unk_264EA1D18;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_sync(rendererStateUpdateQueue, v4);
}

uint64_t __66__APRKStreamRenderer_processStartScreenPresentationWithSessionID___block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(unsigned int *)(a1 + 40);
    LogPrintF();
  }
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[20] && [v2 _receiverSupportsMirroring])
  {
    char v3 = +[APRKStreamRenderingManager sharedInstance];
    char v4 = [v3 shouldForwardLayers];

    if (v4)
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        LogPrintF();
      }
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(NSObject **)(v5 + 136);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__APRKStreamRenderer_processStartScreenPresentationWithSessionID___block_invoke_2;
      block[3] = &unk_264EA1AE8;
      void block[4] = v5;
      dispatch_async(v6, block);
    }
  }
  ++*(_DWORD *)(*(void *)(a1 + 32) + 28);
  return objc_msgSend(*(id *)(a1 + 32), "_updateStreamingMode", v8, v9);
}

void __66__APRKStreamRenderer_processStartScreenPresentationWithSessionID___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__APRKStreamRenderer_processStartScreenPresentationWithSessionID___block_invoke_3;
  block[3] = &unk_264EA1AE8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

uint64_t __66__APRKStreamRenderer_processStartScreenPresentationWithSessionID___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _ensureFigVideoQueue];
  if (result)
  {
    if (gLogCategory_AirPlayReceiverKit <= 90)
    {
      if (gLogCategory_AirPlayReceiverKit != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

- (BOOL)processStopScreenPresentationWithSessionID:(unsigned int)a3
{
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__APRKStreamRenderer_processStopScreenPresentationWithSessionID___block_invoke;
  block[3] = &unk_264EA1AE8;
  void block[4] = self;
  dispatch_sync(rendererStateUpdateQueue, block);
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__APRKStreamRenderer_processStopScreenPresentationWithSessionID___block_invoke_2;
  v7[3] = &unk_264EA1AE8;
  v7[4] = self;
  dispatch_sync(rendererVideoBufferQueue, v7);
  [(APRKStreamRenderer *)self _updateStreamingMode];
  return 1;
}

uint64_t __65__APRKStreamRenderer_processStopScreenPresentationWithSessionID___block_invoke(uint64_t result)
{
  return result;
}

uint64_t __65__APRKStreamRenderer_processStopScreenPresentationWithSessionID___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _unregisterForFigVideoQueueNotifications];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 128);
  *(void *)(v2 + 1--*(_DWORD *)(*(void *)(result + 32) + 28) = 0;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__APRKStreamRenderer_processStopScreenPresentationWithSessionID___block_invoke_3;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  char v4 = *(CFTypeRef **)(a1 + 32);
  if (v4[28])
  {
    CFRelease(v4[28]);
    *(void *)(*(void *)(a1 + 32) + 224) = 0;
    char v4 = *(CFTypeRef **)(a1 + 32);
  }
  return [(CFTypeRef *)v4 _performStopRecording];
}

void __65__APRKStreamRenderer_processStopScreenPresentationWithSessionID___block_invoke_3(uint64_t a1)
{
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  if (CMBaseObject)
  {
    uint64_t v3 = CMBaseObject;
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v5 = v4 ? v4 : 0;
    id v6 = *(void (**)(uint64_t))(v5 + 24);
    if (v6) {
      v6(v3);
    }
  }
  uint64_t v7 = *(const void **)(a1 + 32);
  CFRelease(v7);
}

- (void)processStartVideoPlaybackRequestWithWithSessionID:(unsigned int)a3 version:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v17 = 0;
  dispatch_queue_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__APRKStreamRenderer_processStartVideoPlaybackRequestWithWithSessionID_version___block_invoke;
  block[3] = &unk_264EA1E60;
  unsigned int v12 = a3;
  void block[4] = self;
  void block[5] = &v17;
  dispatch_sync(rendererStateUpdateQueue, block);
  if (*((unsigned char *)v18 + 24)) {
    [(APRKStreamRenderer *)self processStopVideoPlaybackRequestWithSessionID:self->_currentVideoSessionID];
  }
  uint64_t v8 = self->_rendererStateUpdateQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__APRKStreamRenderer_processStartVideoPlaybackRequestWithWithSessionID_version___block_invoke_2;
  v9[3] = &unk_264EA1E88;
  int v10 = v5;
  v9[5] = &v13;
  void v9[6] = a4;
  void v9[4] = self;
  dispatch_sync(v8, v9);
  if (*((unsigned char *)v14 + 24)) {
    [(APRKStreamRenderer *)self _ensureInternalPlayerFor:v5];
  }
  if (self->_receiverNetworkClock) {
    -[APRKMediaPlayer setReceiverNetworkClock:](self->_player, "setReceiverNetworkClock:");
  }
  [(APRKStreamRenderer *)self _updateStreamingMode];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

uint64_t __80__APRKStreamRenderer_processStartVideoPlaybackRequestWithWithSessionID_version___block_invoke(uint64_t result)
{
  if (*(_DWORD *)(*(void *)(result + 32) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
        uint64_t result = LogPrintF();
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __80__APRKStreamRenderer_processStartVideoPlaybackRequestWithWithSessionID_version___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (gLogCategory_AirPlayReceiverKit <= 30)
  {
    if (gLogCategory_AirPlayReceiverKit != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  *(void *)(*(void *)(v1 + 32) + 304) = *(void *)(v1 + 48);
  ++*(_DWORD *)(*(void *)(v1 + 32) + 32);
  *(_DWORD *)(*(void *)(v1 + 32) + 40) = *(_DWORD *)(v1 + 56);
  if (*(void *)(*(void *)(v1 + 32) + 304) == 2) {
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)processStopVideoPlaybackRequestWithSessionID:(unsigned int)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__APRKStreamRenderer_processStopVideoPlaybackRequestWithSessionID___block_invoke;
  v7[3] = &unk_264EA1EB0;
  unsigned int v8 = a3;
  v7[4] = self;
  void v7[5] = &v13;
  void v7[6] = &v9;
  dispatch_sync(rendererStateUpdateQueue, v7);
  if (*((unsigned char *)v14 + 24)) {
    [(APRKStreamRenderer *)self _cleanupInternalPlayer];
  }
  if (*((unsigned char *)v10 + 24))
  {
    [(APRKStreamRenderer *)self _updateStreamingMode];
    BOOL v5 = *((unsigned char *)v10 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __67__APRKStreamRenderer_processStopVideoPlaybackRequestWithSessionID___block_invoke(uint64_t result)
{
  uint64_t v1 = (void *)result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(_DWORD *)(v2 + 40) == *(_DWORD *)(result + 56))
  {
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (result = _LogCategory_Initialize(), uint64_t v2 = v1[4], result))
      {
        uint64_t result = LogPrintF();
        uint64_t v2 = v1[4];
      }
    }
    if (*(void *)(v2 + 304) == 2)
    {
      *(unsigned char *)(*(void *)(v1[5] + 8) + 24) = 1;
      uint64_t v2 = v1[4];
    }
    *(void *)(v2 + 304) = 0;
    --*(_DWORD *)(v1[4] + 32);
    *(_DWORD *)(v1[4] + 40) = 0;
    *(unsigned char *)(*(void *)(v1[6] + 8) + 24) = 1;
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30)
  {
    if (gLogCategory_AirPlayReceiverKit != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

- (void)processStartAudioSessionRequestWithSessionID:(unsigned int)a3 isScreenAudio:(BOOL)a4
{
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __81__APRKStreamRenderer_processStartAudioSessionRequestWithSessionID_isScreenAudio___block_invoke;
  v5[3] = &unk_264EA1ED8;
  v5[4] = self;
  unsigned int v6 = a3;
  BOOL v7 = a4;
  dispatch_async(rendererStateUpdateQueue, v5);
}

uint64_t __81__APRKStreamRenderer_processStartAudioSessionRequestWithSessionID_isScreenAudio___block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = *(unsigned int *)(a1 + 40);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 44);
    uint64_t v7 = *(void *)(a1 + 32);
    LogPrintF();
  }
  if (*(unsigned char *)(a1 + 44))
  {
    uint64_t v2 = +[APRKStreamRenderingManager sharedInstance];
    int v3 = [v2 optimizeAudioRenderingLatency];

    if (v3)
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      uint64_t v4 = *(void *)(a1 + 32);
      BOOL v5 = *(NSObject **)(v4 + 144);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __81__APRKStreamRenderer_processStartAudioSessionRequestWithSessionID_isScreenAudio___block_invoke_2;
      block[3] = &unk_264EA1AE8;
      void block[4] = v4;
      dispatch_sync(v5, block);
    }
  }
  ++*(_DWORD *)(*(void *)(a1 + 32) + 36);
  return objc_msgSend(*(id *)(a1 + 32), "_updateStreamingMode", v7, v8, v9);
}

uint64_t __81__APRKStreamRenderer_processStartAudioSessionRequestWithSessionID_isScreenAudio___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 23) = 1;
  id v2 = objc_alloc_init(MEMORY[0x263EFA880]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  id v5 = objc_alloc_init(MEMORY[0x263EFA890]);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v5;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 72);
  uint64_t v10 = *(void *)(v8 + 80);
  return [v9 addRenderer:v10];
}

- (BOOL)processStopAudioSessionRequestWithSessionID:(unsigned int)a3
{
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__APRKStreamRenderer_processStopAudioSessionRequestWithSessionID___block_invoke;
  v5[3] = &unk_264EA1D18;
  v5[4] = self;
  unsigned int v6 = a3;
  dispatch_async(rendererStateUpdateQueue, v5);
  return 1;
}

uint64_t __66__APRKStreamRenderer_processStopAudioSessionRequestWithSessionID___block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 144);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__APRKStreamRenderer_processStopAudioSessionRequestWithSessionID___block_invoke_2;
  block[3] = &unk_264EA1AE8;
  void block[4] = v2;
  dispatch_sync(v3, block);
  --*(_DWORD *)(*(void *)(a1 + 32) + 36);
  return [*(id *)(a1 + 32) _updateStreamingMode];
}

void __66__APRKStreamRenderer_processStopAudioSessionRequestWithSessionID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 72);
  uint64_t v4 = *(void *)(v2 + 80);
  long long v12 = *MEMORY[0x263F01090];
  long long v11 = v12;
  uint64_t v13 = *(void *)(MEMORY[0x263F01090] + 16);
  uint64_t v5 = v13;
  [v3 removeRenderer:v4 atTime:&v12 completionHandler:&__block_literal_global_76];
  *(unsigned char *)(*(void *)(a1 + 32) + 23) = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  *(_OWORD *)(v6 + 44) = v11;
  *(void *)(v6 + 60) = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 80);
  *(void *)(v7 + 80) = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 72);
  *(void *)(v9 + 72) = 0;
}

void __66__APRKStreamRenderer_processStopAudioSessionRequestWithSessionID___block_invoke_3()
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)processVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke;
  block[3] = &unk_264EA1F70;
  void block[5] = &v7;
  void block[6] = a3;
  void block[4] = self;
  dispatch_sync(rendererVideoBufferQueue, block);
  BOOL v4 = *((_DWORD *)v8 + 6) == 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke(uint64_t a1)
{
  int valuePtr = 0;
  uint64_t v2 = *(const void **)(a1 + 48);
  if (!v2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -6705;
    goto LABEL_55;
  }
  CFRetain(v2);
  uint64_t v3 = *(void *)(a1 + 32);
  CMSampleBufferGetOutputPresentationTimeStamp(&v55, *(CMSampleBufferRef *)(a1 + 48));
  *(CMTime *)(v3 + 232) = v55;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 25)) {
    goto LABEL_43;
  }
  CFTypeRef v4 = (CFTypeRef)*MEMORY[0x263EFFB40];
  CFTypeRef v5 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x263F01048], 0);
  int v6 = v4 == v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v7 + 27) != v6)
  {
    *(unsigned char *)(v7 + 27) = v6;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(NSObject **)(v8 + 160);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_2;
    block[3] = &unk_264EA1DA8;
    void block[4] = v8;
    BOOL v54 = v4 == v5;
    dispatch_async(v9, block);
  }
  if (v4 == v5)
  {
    double v24 = *MEMORY[0x263F001B0];
    double v25 = *(double *)(MEMORY[0x263F001B0] + 8);
    goto LABEL_25;
  }
  CFDictionaryRef v10 = (const __CFDictionary *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x263F015E8], 0);
  if (!v10 || (CFDictionaryRef v11 = v10, v12 = CFGetTypeID(v10), v12 != CFDictionaryGetTypeID()))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -6705;
LABEL_55:
    APSLogErrorAt();
    goto LABEL_43;
  }
  if (!CGRectMakeWithDictionaryRepresentation(v11, (CGRect *)(*(void *)(a1 + 32) + 192)))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -6705;
    goto LABEL_55;
  }
  CFNumberRef v13 = (const __CFNumber *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x263F015F0], 0);
  if (!v13 || (v14 = v13, CFTypeID v15 = CFGetTypeID(v13), v15 != CFNumberGetTypeID()))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -6705;
    goto LABEL_55;
  }
  CFNumberGetValue(v14, kCFNumberSInt32Type, &valuePtr);
  FormatDescription = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(a1 + 48));
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(FormatDescription);
  int32_t v18 = Dimensions;
  unint64_t v19 = HIDWORD(Dimensions);
  int v20 = valuePtr;
  uint64_t v21 = *(void *)(a1 + 32);
  if (valuePtr != *(_DWORD *)(v21 + 260))
  {
    *(_DWORD *)(v21 + 260) = valuePtr;
    uint64_t v22 = *(void *)(a1 + 32);
    dispatch_queue_t v23 = *(NSObject **)(v22 + 160);
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_3;
    v51[3] = &unk_264EA1D18;
    v51[4] = v22;
    int v52 = v20;
    dispatch_async(v23, v51);
    uint64_t v21 = *(void *)(a1 + 32);
  }
  double v24 = (double)v18;
  double v25 = (double)(int)v19;
  if (*(unsigned char *)(v21 + 344))
  {
    *(_DWORD *)(v21 + 256) = valuePtr;
    int v26 = [*(id *)(a1 + 32) _isRotatedTransform:*(unsigned int *)(*(void *)(a1 + 32) + 256)];
    if (v26) {
      double v27 = (double)(int)v19;
    }
    else {
      double v27 = (double)v18;
    }
    if (v26) {
      double v25 = (double)v18;
    }
    uint64_t v21 = *(void *)(a1 + 32);
    double v24 = v27;
  }
  uint64_t v28 = *(const void **)(v21 + 224);
  *(void *)(v21 + 224) = FormatDescription;
  if (FormatDescription) {
    CFRetain(FormatDescription);
  }
  if (v28) {
    CFRelease(v28);
  }
LABEL_25:
  uint64_t v29 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v29 + 24))
  {
    if (![(id)v29 _sampleBufferRepresentsKeyFrame:*(void *)(a1 + 48)])
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_37;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
    uint64_t v29 = *(void *)(a1 + 32);
  }
  if (*(void *)(v29 + 88) && !*(unsigned char *)(v29 + 21))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(id)v29 _enqueueVideoFrameForRendering:*(void *)(a1 + 48)];
    uint64_t v29 = *(void *)(a1 + 32);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v29 + 320));
  char v31 = objc_opt_respondsToSelector();

  if (v31)
  {
    id v32 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 320));
    [v32 renderer:*(void *)(a1 + 32) didOutputVideoSampleBuffer:*(void *)(a1 + 48)];
  }
LABEL_37:
  uint64_t v33 = *(void *)(a1 + 32);
  if (v4 != v5 && *(unsigned char *)(v33 + 22))
  {
    [(id)v33 _enqueueSampleBufferForRecording:*(void *)(a1 + 48) isAudioSBuf:0];
    uint64_t v33 = *(void *)(a1 + 32);
  }
  if (v24 != *(double *)(v33 + 168) || v25 != *(double *)(v33 + 176))
  {
    *(double *)(v33 + 168) = v24;
    *(double *)(v33 + 176) = v25;
    uint64_t v34 = *(void *)(a1 + 32);
    v35 = *(NSObject **)(v34 + 160);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    long long v36 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    long long v46 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    long long v47 = v36;
    long long v37 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    long long v48 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    long long v38 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    long long v42 = *MEMORY[0x263F15740];
    long long v43 = v38;
    long long v39 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    long long v44 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    long long v45 = v39;
    v41[2] = __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_4;
    v41[3] = &unk_264EA1F48;
    v41[4] = v34;
    long long v49 = v37;
    BOOL v50 = v4 == v5;
    dispatch_async(v35, v41);
  }
LABEL_43:
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v40 = *(const void **)(a1 + 48);
  if (v40) {
    CFRelease(v40);
  }
}

void __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 videoStreamIsCleared:*(unsigned __int8 *)(a1 + 40) forRenderer:*(void *)(a1 + 32)];
  }
}

void __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 videoLayerOrientationDidChangeTo:*(unsigned int *)(a1 + 40) forRenderer:*(void *)(a1 + 32)];
  }
}

void __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_5;
  block[3] = &unk_264EA1F20;
  void block[4] = *(void *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 120);
  long long v13 = *(_OWORD *)(a1 + 104);
  long long v14 = v2;
  long long v15 = *(_OWORD *)(a1 + 136);
  long long v16 = *(_OWORD *)(a1 + 152);
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v9 = *(_OWORD *)(a1 + 40);
  long long v10 = v3;
  long long v4 = *(_OWORD *)(a1 + 88);
  long long v11 = *(_OWORD *)(a1 + 72);
  long long v12 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
  if (!*(unsigned char *)(a1 + 168))
  {
    CFTypeRef v5 = [*(id *)(a1 + 32) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) delegate];
      [v7 videoLayerSizeDidChangeTo:*(double *)(*(void *)(a1 + 32) + 168) forRenderer:*(double *)(*(void *)(a1 + 32) + 176)];
    }
  }
}

uint64_t __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_5(uint64_t a1)
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v2 = *(void **)(*(void *)(a1 + 32) + 88);
  long long v3 = *(_OWORD *)(a1 + 120);
  v8[4] = *(_OWORD *)(a1 + 104);
  v8[5] = v3;
  long long v4 = *(_OWORD *)(a1 + 152);
  v8[6] = *(_OWORD *)(a1 + 136);
  v8[7] = v4;
  long long v5 = *(_OWORD *)(a1 + 56);
  v8[0] = *(_OWORD *)(a1 + 40);
  v8[1] = v5;
  long long v6 = *(_OWORD *)(a1 + 88);
  v8[2] = *(_OWORD *)(a1 + 72);
  v8[3] = v6;
  [v2 setTransform:v8];
  return [MEMORY[0x263F158F8] commit];
}

- (BOOL)processAudioSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  if (a3) {
    CFRetain(a3);
  }
  rendererAudioBufferQueue = self->_rendererAudioBufferQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__APRKStreamRenderer_processAudioSampleBuffer___block_invoke;
  block[3] = &unk_264EA1F98;
  void block[5] = &v9;
  void block[6] = a3;
  void block[4] = self;
  dispatch_sync(rendererAudioBufferQueue, block);
  if (a3) {
    CFRelease(a3);
  }
  BOOL v6 = *((_DWORD *)v10 + 6) == 0;
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __47__APRKStreamRenderer_processAudioSampleBuffer___block_invoke(uint64_t result)
{
  uint64_t v1 = (void *)result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(unsigned char *)(v2 + 23) && !*(unsigned char *)(v2 + 26))
  {
    if ((*(unsigned char *)(v2 + 56) & 1) == 0)
    {
      CMSampleBufferGetOutputPresentationTimeStamp(&v12, *(CMSampleBufferRef *)(result + 48));
      *(CMTime *)(v2 + 44) = v12;
      long long v3 = *(void **)(v1[4] + 72);
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(&v11, HostTimeClock);
      LODWORD(v5) = 1.0;
      [v3 setRate:&v11 time:v5];
      uint64_t v2 = v1[4];
    }
    int v6 = [*(id *)(v2 + 80) isReadyForMoreMediaData];
    uint64_t v7 = *(void **)(v1[4] + 80);
    if (v6)
    {
      [v7 enqueueSampleBuffer:v1[6]];
      id WeakRetained = objc_loadWeakRetained((id *)(v1[4] + 320));
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)(v1[4] + 320));
        [v10 renderer:v1[4] didOutputAudioSampleBuffer:v1[6]];
      }
      uint64_t result = v1[4];
      if (*(unsigned char *)(result + 22)) {
        uint64_t result = [(id)result _enqueueSampleBufferForRecording:v1[6] isAudioSBuf:1];
      }
    }
    else
    {
      uint64_t result = [v7 status];
      if (result == 2)
      {
        *(_DWORD *)(*(void *)(v1[5] + 8) + 24) = -6762;
        uint64_t result = APSLogErrorAt();
      }
    }
  }
  if (*(_DWORD *)(*(void *)(v1[5] + 8) + 24))
  {
    if (gLogCategory_AirPlayReceiverKit <= 90)
    {
      if (gLogCategory_AirPlayReceiverKit != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

- (void)_registerForFigVideoQueueNotifications
{
  if (self->_figVideoQueue)
  {
    if (!self->_figVideoQueueNotifObserver)
    {
      objc_initWeak(&location, self);
      uint64_t v7 = MEMORY[0x263EF8330];
      uint64_t v8 = 3221225472;
      char v9 = __60__APRKStreamRenderer__registerForFigVideoQueueNotifications__block_invoke;
      id v10 = &unk_264EA1FC0;
      objc_copyWeak(&v11, &location);
      long long v3 = _Block_copy(&v7);
      long long v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v7, v8, v9, v10);
      double v5 = [v4 addObserverForName:*MEMORY[0x263F124C8] object:self->_figVideoQueue queue:0 usingBlock:v3];
      figVideoQueueNotifObserver = self->_figVideoQueueNotifObserver;
      self->_figVideoQueueNotifObserver = v5;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __60__APRKStreamRenderer__registerForFigVideoQueueNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [WeakRetained _performUIControllerActionWithBlock:&__block_literal_global_96];
}

uint64_t __60__APRKStreamRenderer__registerForFigVideoQueueNotifications__block_invoke_2()
{
  return UIControllerPostNotificationForRendererStoppedEvent();
}

- (void)_unregisterForFigVideoQueueNotifications
{
  if (self->_figVideoQueueNotifObserver)
  {
    long long v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_figVideoQueueNotifObserver];

    figVideoQueueNotifObserver = self->_figVideoQueueNotifObserver;
    self->_figVideoQueueNotifObserver = 0;
  }
}

- (signed)_ensureFigVideoQueue
{
  CFTypeRef cf = 0;
  CMTimebaseRef timebaseOut = 0;
  p_figVideoQueue = (uint64_t *)&self->_figVideoQueue;
  if (self->_figVideoQueue)
  {
    int v20 = 0;
  }
  else
  {
    int v4 = MEMORY[0x23ED02A50](*MEMORY[0x263EFFB08], p_figVideoQueue);
    if (v4)
    {
      int v20 = v4;
    }
    else
    {
      [(APRKStreamRenderer *)self _registerForFigVideoQueueNotifications];
      HostTimeClock = CMClockGetHostTimeClock();
      OSStatus v6 = CMTimebaseCreateWithSourceClock(0, HostTimeClock, &timebaseOut);
      if (v6)
      {
        int v20 = v6;
      }
      else
      {
        OSStatus v7 = CMTimebaseSetRate(timebaseOut, 1.0);
        if (v7)
        {
          int v20 = v7;
        }
        else
        {
          uint64_t v8 = timebaseOut;
          char v9 = CMClockGetHostTimeClock();
          CMClockGetTime(&time, v9);
          OSStatus v10 = CMTimebaseSetTime(v8, &time);
          if (v10)
          {
            int v20 = v10;
          }
          else
          {
            int OnlyTimebase = CMTimebaseCreateReadOnlyTimebase();
            if (OnlyTimebase)
            {
              int v20 = OnlyTimebase;
            }
            else
            {
              uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
              uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
              if (v13) {
                uint64_t v14 = v13;
              }
              else {
                uint64_t v14 = 0;
              }
              long long v15 = *(uint64_t (**)(uint64_t, void, void))(v14 + 56);
              if (v15)
              {
                int v16 = v15(CMBaseObject, *MEMORY[0x263F124D0], *MEMORY[0x263EFFB38]);
                if (v16)
                {
                  int v20 = v16;
                }
                else
                {
                  int v17 = FigVideoQueueSetProperty(*p_figVideoQueue, *MEMORY[0x263F124D8], (uint64_t)cf);
                  if (v17)
                  {
                    int v20 = v17;
                  }
                  else
                  {
                    int v18 = FigVideoQueueSetProperty((uint64_t)self->_figVideoQueue, *MEMORY[0x263F124F0], (uint64_t)self->_mirroringLayer);
                    if (v18)
                    {
                      int v20 = v18;
                    }
                    else
                    {
                      int v19 = FigVideoQueueSetProperty(*p_figVideoQueue, *MEMORY[0x263F124F8], *MEMORY[0x263EFFB40]);
                      if (v19)
                      {
                        int v20 = v19;
                      }
                      else
                      {
                        int v20 = FigVideoQueueStart(*p_figVideoQueue);
                        if (!v20) {
                          goto LABEL_19;
                        }
                      }
                    }
                  }
                }
              }
              else
              {
                int v20 = -12782;
              }
            }
          }
        }
      }
    }
    APSLogErrorAt();
  }
LABEL_19:
  if (timebaseOut) {
    CFRelease(timebaseOut);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v20
    && gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v20;
}

- (void)_ensureInternalPlayerFor:(int)a3
{
  if (!self->_player)
  {
    int v4 = [[APRKMediaPlayer alloc] initWithP2PWiFiSupport:self->_isP2PWiFiSession isInterstitialPlayer:0 playerSessionID:*(void *)&a3];
    player = self->_player;
    self->_player = v4;

    [(APRKMediaPlayer *)self->_player addObserver:self forKeyPath:@"currentItemMetadata" options:1 context:APRKMediaPlayerContext];
    [(APRKMediaPlayer *)self->_player setMessagingDelegate:self];
    OSStatus v6 = self->_player;
    sessionReceiverAddr = self->_sessionReceiverAddr;
    [(APRKMediaPlayer *)v6 setSessionReceiverAddress:sessionReceiverAddr];
  }
}

- (void)_cleanupInternalPlayer
{
  long long v3 = self->_player;
  player = self->_player;
  self->_player = 0;

  [(APRKMediaPlayer *)v3 removeObserver:self forKeyPath:@"currentItemMetadata"];
  [(APRKMediaPlayer *)v3 setMessagingDelegate:0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__APRKStreamRenderer__cleanupInternalPlayer__block_invoke;
  v6[3] = &unk_264EA1AE8;
  OSStatus v7 = v3;
  double v5 = v3;
  [(APRKMediaPlayer *)v5 stopWithCompletionBlock:v6];
}

uint64_t __44__APRKStreamRenderer__cleanupInternalPlayer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (int)_enqueueVideoFrameForRendering:(opaqueCMSampleBuffer *)a3
{
  CFTypeRef cf = a3;
  if (!a3)
  {
    if (!self->_figVideoQueue) {
      goto LABEL_24;
    }
    formatDesc = self->_formatDesc;
    if (!formatDesc) {
      goto LABEL_24;
    }
    sampleTimingArray.presentationTimeStamp = (CMTime)self->_lastPTS;
    sampleTimingArray.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01090];
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x263F010E0];
    sampleTimingArray.duration.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
    OSStatus v5 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 1u, 0, 0, formatDesc, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&cf);
    if (v5)
    {
      int v24 = v5;
LABEL_14:
      APSLogErrorAt();
      goto LABEL_15;
    }
LABEL_7:
    [(CALayer *)self->_mirroringLayer frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    figVideoQueue = self->_figVideoQueue;
    CFTypeRef v15 = cf;
    uint64_t transform = self->_transform;
    double x = self->_sourceRect.origin.x;
    double y = self->_sourceRect.origin.y;
    double width = self->_sourceRect.size.width;
    double height = self->_sourceRect.size.height;
    uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
    dispatch_queue_t v23 = *(uint64_t (**)(OpaqueFigVideoQueue *, CFTypeRef, uint64_t, double, double, double, double, double, double, double, double))(v22 + 16);
    if (v23)
    {
      int v24 = v23(figVideoQueue, v15, transform, x, y, width, height, v7, v9, v11, v13);
      if (!v24) {
        goto LABEL_15;
      }
    }
    else
    {
      int v24 = -12782;
    }
    goto LABEL_14;
  }
  CFRetain(a3);
  if (self->_figVideoQueue) {
    goto LABEL_7;
  }
LABEL_24:
  int v24 = 0;
LABEL_15:
  if (cf) {
    CFRelease(cf);
  }
  if (v24)
  {
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_isMirroringVideoStreamPaused = 1;
    [(APRKStreamRenderer *)self _performUIControllerActionWithBlock:&__block_literal_global_106];
  }
  return v24;
}

uint64_t __53__APRKStreamRenderer__enqueueVideoFrameForRendering___block_invoke()
{
  return UIControllerPostNotificationForRendererStoppedEvent();
}

- (int)_enqueueSampleBufferForRecording:(opaqueCMSampleBuffer *)a3 isAudioSBuf:(BOOL)a4
{
  if (a3) {
    CFRetain(a3);
  }
  if (!a4)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(FormatDescription);
    unint64_t v9 = Dimensions;
    unint64_t v10 = HIDWORD(Dimensions);
    if (*(void *)&self->_lastVideoSampleBufferSize == Dimensions)
    {
      BOOL recorderNeedsKeyFrame = self->_recorderNeedsKeyFrame;
      self->_lastVideoSampleBufferSize = ($470D365275581EF16070F5A11344F73E)Dimensions;
      if (!recorderNeedsKeyFrame) {
        goto LABEL_13;
      }
    }
    else
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        unint64_t v21 = v9;
        unint64_t v22 = v10;
        uint64_t width = (int)self->_presentationVideoSize.width;
        uint64_t v20 = width;
        LogPrintF();
      }
      [(APRKStreamRenderer *)self _performStopRecording];
      self->_BOOL recorderNeedsKeyFrame = 1;
      self->_lastVideoSampleBufferSize.uint64_t width = v9;
      self->_lastVideoSampleBufferSize.double height = v10;
    }
    self->_BOOL recorderNeedsKeyFrame = ![(APRKStreamRenderer *)self _sampleBufferRepresentsKeyFrame:a3];
  }
LABEL_13:
  if (self->_recorder || self->_recorderNeedsKeyFrame) {
    goto LABEL_35;
  }
  dispatch_source_cancel((dispatch_source_t)self->_recorderKeyFrameTimer);
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  double v12 = objc_alloc_init(APRKStreamRecorder);
  recorder = self->_recorder;
  self->_recorder = v12;

  uint64_t v14 = [(APRKStreamRecorder *)self->_recorder startRecordingAtURL:self->_currentRecordingURL];
  if (!v14)
  {
LABEL_35:
    if (!self->_recorderNeedsKeyFrame)
    {
      CFTypeRef v15 = self->_recorder;
      if (a4) {
        [(APRKStreamRecorder *)v15 recordAudioSampleBuffer:a3];
      }
      else {
        [(APRKStreamRecorder *)v15 recordVideoSampleBuffer:a3];
      }
    }
    LODWORD(v16) = 0;
    if (a3) {
LABEL_25:
    }
      CFRelease(a3);
  }
  else
  {
    uint64_t v16 = v14;
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      uint64_t width = v16;
      LogPrintF();
    }
    [(APRKStreamRenderer *)self _performStopRecording];
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__APRKStreamRenderer__enqueueSampleBufferForRecording_isAudioSBuf___block_invoke;
    block[3] = &unk_264EA1AE8;
    void block[4] = self;
    dispatch_async(delegateQueue, block);
    if (a3) {
      goto LABEL_25;
    }
  }
  return v16;
}

void __67__APRKStreamRenderer__enqueueSampleBufferForRecording_isAudioSBuf___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 recordingSessionDidFailForRenderer:*(void *)(a1 + 32)];
  }
}

- (BOOL)_sampleBufferRepresentsKeyFrame:(opaqueCMSampleBuffer *)a3
{
  SampleAttachmentsArradouble y = CMSampleBufferGetSampleAttachmentsArray(a3, 0);
  if (!SampleAttachmentsArray) {
    return 1;
  }
  CFArrayRef v4 = SampleAttachmentsArray;
  CFIndex Count = CFArrayGetCount(SampleAttachmentsArray);
  CFIndex v6 = Count - 1;
  if (Count < 1) {
    return 1;
  }
  CFIndex v7 = 0;
  do
  {
    CFArrayGetValueAtIndex(v4, v7);
    if (FigCFDictionaryGetBooleanIfPresent()) {
      break;
    }
  }
  while (v6 != v7++);
  return 1;
}

- (BOOL)_performStartRecordingWithOutputURL:(id)a3
{
  CFArrayRef v4 = (NSURL *)a3;
  if (self->_recorder) {
    [(APRKStreamRenderer *)self _performStopRecording];
  }
  currentRecordingURL = self->_currentRecordingURL;
  self->_currentRecordingURL = v4;
  CFIndex v6 = v4;

  self->_BOOL recorderNeedsKeyFrame = 1;
  self->_shouldRecordFrames = 1;
  [(APRKStreamRenderer *)self _cleanupPreviousRecordingIfExisting];
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(APRKStreamRenderer *)self _performUIControllerActionWithBlock:&__block_literal_global_115];
  CFIndex v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_rendererVideoBufferQueue);
  recorderKeyFrameTimer = self->_recorderKeyFrameTimer;
  self->_recorderKeyFrameTimer = v7;

  unint64_t v9 = self->_recorderKeyFrameTimer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __58__APRKStreamRenderer__performStartRecordingWithOutputURL___block_invoke_2;
  handler[3] = &unk_264EA1AE8;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  unint64_t v10 = self->_recorderKeyFrameTimer;
  dispatch_time_t v11 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  dispatch_resume((dispatch_object_t)self->_recorderKeyFrameTimer);
  [(APRKStreamRenderer *)self _performUIControllerActionWithBlock:&__block_literal_global_118];

  return 1;
}

uint64_t __58__APRKStreamRenderer__performStartRecordingWithOutputURL___block_invoke()
{
  return UIControllerPostNotificationForKeyFrameRequest();
}

void __58__APRKStreamRenderer__performStartRecordingWithOutputURL___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 288))
  {
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(a1 + 32) _performStopRecording];
    uint64_t v2 = *(void *)(a1 + 32);
    char v3 = *(NSObject **)(v2 + 160);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__APRKStreamRenderer__performStartRecordingWithOutputURL___block_invoke_3;
    block[3] = &unk_264EA1AE8;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __58__APRKStreamRenderer__performStartRecordingWithOutputURL___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 recordingSessionDidFailForRenderer:*(void *)(a1 + 32)];
  }
}

uint64_t __58__APRKStreamRenderer__performStartRecordingWithOutputURL___block_invoke_4()
{
  return UIControllerPostNotificationForStartRecordingEvent();
}

- (BOOL)_performStopRecording
{
  if (self->_recorder)
  {
    dispatch_source_cancel((dispatch_source_t)self->_recorderKeyFrameTimer);
    [(APRKStreamRenderer *)self _performUIControllerActionWithBlock:&__block_literal_global_121];
    currentRecordingURL = self->_currentRecordingURL;
    self->_currentRecordingURL = 0;

    self->_BOOL recorderNeedsKeyFrame = 0;
    self->_shouldRecordFrames = 0;
    BOOL v4 = [(APRKStreamRecorder *)self->_recorder finalizeRecording];
    recorder = self->_recorder;
    self->_recorder = 0;

    return !v4;
  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return 1;
  }
}

uint64_t __43__APRKStreamRenderer__performStopRecording__block_invoke()
{
  return UIControllerPostNotificationForStopRecordingEvent();
}

- (void)_cleanupPreviousRecordingIfExisting
{
  char v10 = 0;
  char v3 = [MEMORY[0x263F08850] defaultManager];
  BOOL v4 = [(NSURL *)self->_currentRecordingURL path];
  int v5 = [v3 fileExistsAtPath:v4 isDirectory:&v10];

  id v6 = 0;
  if (!v10)
  {
    if (v5)
    {
      CFIndex v7 = [MEMORY[0x263F08850] defaultManager];
      double v8 = [(NSURL *)self->_currentRecordingURL path];
      id v9 = 0;
      [v7 removeItemAtPath:v8 error:&v9];
      id v6 = v9;

      if (v6)
      {
        if (gLogCategory_AirPlayReceiverKit <= 90
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
    }
  }
}

- (BOOL)_isRotatedTransform:(unint64_t)a3
{
  return a3 == 7 || a3 == 4;
}

- (BOOL)_shouldFlip:(unsigned int)a3
{
  BOOL v5 = [(APRKStreamRenderer *)self _isRotatedTransform:self->_transform];
  return v5 ^ [(APRKStreamRenderer *)self _isRotatedTransform:a3];
}

- (void)_updateStreamingMode
{
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__APRKStreamRenderer__updateStreamingMode__block_invoke;
  block[3] = &unk_264EA1AE8;
  void block[4] = self;
  dispatch_async(rendererStateUpdateQueue, block);
}

void __42__APRKStreamRenderer__updateStreamingMode__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 32))
  {
    uint64_t v3 = 4;
  }
  else if (*(_DWORD *)(v2 + 28))
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 2 * (*(_DWORD *)(v2 + 36) != 0);
  }
  uint64_t v4 = *(void *)(v2 + 376);
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v4 != v3)
  {
    *(void *)(*(void *)(a1 + 32) + 376) = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(NSObject **)(v5 + 160);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__APRKStreamRenderer__updateStreamingMode__block_invoke_2;
    block[3] = &unk_264EA1E18;
    void block[4] = v5;
    void block[5] = v3;
    dispatch_async(v6, block);
  }
}

void __42__APRKStreamRenderer__updateStreamingMode__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = [*(id *)(a1 + 32) delegate];
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v5 = v4;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate", v5, v6, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v8 didChangeStreamRendererModeTo:*(void *)(a1 + 40) forRenderer:*(void *)(a1 + 32)];
  }
}

- (BOOL)_receiverSupportsMirroring
{
  uint64_t v2 = +[APRKStreamRenderingManager sharedInstance];
  BOOL v3 = [v2 supportedModesMask] & 1;

  return v3;
}

- (void)_performUIControllerActionWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(void, uint64_t))a3;
  uint64_t backingUIControllerWeakRef = (uint64_t)self->_backingUIControllerWeakRef;
  uint64_t v7 = v4;
  if (backingUIControllerWeakRef)
  {
    uint64_t backingUIControllerWeakRef = FigCFWeakReferenceHolderCopyReferencedObject();
    if (backingUIControllerWeakRef)
    {
      uint64_t v6 = (const void *)backingUIControllerWeakRef;
      if (v7) {
        v7[2](v7, backingUIControllerWeakRef);
      }
      CFRelease(v6);
      goto LABEL_6;
    }
    uint64_t v4 = v7;
    if (gLogCategory_AirPlayReceiverKit <= 60)
    {
      if (gLogCategory_AirPlayReceiverKit != -1
        || (backingUIControllerWeakRef = _LogCategory_Initialize(), uint64_t v4 = v7, backingUIControllerWeakRef))
      {
LABEL_15:
        uint64_t backingUIControllerWeakRef = LogPrintF();
LABEL_6:
        uint64_t v4 = v7;
      }
    }
  }
  else if (gLogCategory_AirPlayReceiverKit <= 60)
  {
    if (gLogCategory_AirPlayReceiverKit != -1) {
      goto LABEL_15;
    }
    uint64_t backingUIControllerWeakRef = _LogCategory_Initialize();
    uint64_t v4 = v7;
    if (backingUIControllerWeakRef) {
      goto LABEL_15;
    }
  }
  MEMORY[0x270F9A758](backingUIControllerWeakRef, v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)VideoRenderingLayerContext == a6)
  {
    if (![v10 isEqualToString:@"bounds"]) {
      goto LABEL_8;
    }
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __69__APRKStreamRenderer_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v17[3] = &unk_264EA1AE8;
    v17[4] = self;
    delegateQueue = MEMORY[0x263EF83A0];
    uint64_t v14 = v17;
LABEL_7:
    dispatch_async(delegateQueue, v14);
    goto LABEL_8;
  }
  if ((void *)APRKMediaPlayerContext == a6)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__APRKStreamRenderer_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    block[3] = &unk_264EA1AE8;
    void block[4] = self;
    uint64_t v14 = block;
    goto LABEL_7;
  }
  v15.receiver = self;
  v15.super_class = (Class)APRKStreamRenderer;
  [(APRKStreamRenderer *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_8:
}

uint64_t __69__APRKStreamRenderer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueVideoFrameForRendering:0];
}

void __69__APRKStreamRenderer_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 368));
    LogPrintF();
  }
  id v2 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 368));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 368));
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 112) currentItemMetadata];
    [v6 didUpdateMetadata:v4 forRenderer:*(void *)(a1 + 32)];
  }
}

- (void)mediaPlayer:(id)a3 wantsToSendUpstreamMessageWithDictionary:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__APRKStreamRenderer_mediaPlayer_wantsToSendUpstreamMessageWithDictionary___block_invoke;
  v7[3] = &unk_264EA1FE8;
  id v8 = v5;
  id v6 = v5;
  [(APRKStreamRenderer *)self _performUIControllerActionWithBlock:v7];
}

void __75__APRKStreamRenderer_mediaPlayer_wantsToSendUpstreamMessageWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)mediaPlayer:(id)a3 didGenerateFPSSecureStopRecordPayload:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__APRKStreamRenderer_mediaPlayer_didGenerateFPSSecureStopRecordPayload___block_invoke;
  v7[3] = &unk_264EA1FE8;
  id v8 = v5;
  id v6 = v5;
  [(APRKStreamRenderer *)self _performUIControllerActionWithBlock:v7];
}

uint64_t __72__APRKStreamRenderer_mediaPlayer_didGenerateFPSSecureStopRecordPayload___block_invoke()
{
  return UIControllerPostNotificationForFPSSecureStopGeneratedEvent();
}

- (void)mediaPlayerNeedsTLSInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__APRKStreamRenderer_mediaPlayerNeedsTLSInfo___block_invoke;
  v6[3] = &unk_264EA1FE8;
  id v7 = v4;
  id v5 = v4;
  [(APRKStreamRenderer *)self _performUIControllerActionWithBlock:v6];
}

void __46__APRKStreamRenderer_mediaPlayerNeedsTLSInfo___block_invoke(uint64_t a1)
{
  id v2 = (id)UIControllerCopyTLSInfo();
  [*(id *)(a1 + 32) processTLSInfoDictionary:v2];
}

- (void)mediaPlayer:(id)a3 wantsToPostNotification:(id)a4 withPayload:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__APRKStreamRenderer_mediaPlayer_wantsToPostNotification_withPayload___block_invoke;
  v11[3] = &unk_264EA1DF0;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(APRKStreamRenderer *)self _performUIControllerActionWithBlock:v11];
}

uint64_t __70__APRKStreamRenderer_mediaPlayer_wantsToPostNotification_withPayload___block_invoke()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

- (void)processSenderUIEvent:(id)a3
{
  id v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__APRKStreamRenderer_processSenderUIEvent___block_invoke;
  v7[3] = &unk_264EA1B88;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(delegateQueue, v7);
}

void __43__APRKStreamRenderer_processSenderUIEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (gLogCategory_AirPlayReceiverKit <= 10
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      id v4 = [*(id *)(a1 + 32) delegate];
      uint64_t v5 = *(void *)(a1 + 32);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate", v4, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 handleSenderUIEvent:*(void *)(a1 + 40) forRenderer:*(void *)(a1 + 32)];
  }
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (NSString)managedClientName
{
  return self->_managedClientName;
}

- (APRKStreamRendererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APRKStreamRendererDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isMirroringAudioStreamPaused
{
  return self->_isMirroringAudioStreamPaused;
}

- (BOOL)autoRotateLayerFollowingClientRotation
{
  return self->_autoRotateLayerFollowingClientRotation;
}

- (void)setAutoRotateLayerFollowingClientRotation:(BOOL)a3
{
  self->_autoRotateLayerFollowingClientRotation = a3;
}

- (unint64_t)streamRendererMode
{
  return self->_streamRendererMode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedClientName, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_demoDeviceInfo, 0);
  objc_storeStrong((id *)&self->_ensembleInfo, 0);
  objc_destroyWeak((id *)&self->_sampleBufferDelegate);
  objc_destroyWeak((id *)&self->_airPlayReceiverUIDelegate);
  objc_storeStrong((id *)&self->_currentRecordingURL, 0);
  objc_storeStrong((id *)&self->_recorderKeyFrameTimer, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_rendererStateUpdateQueue, 0);
  objc_storeStrong((id *)&self->_rendererAudioBufferQueue, 0);
  objc_storeStrong((id *)&self->_rendererVideoBufferQueue, 0);
  objc_storeStrong((id *)&self->_figVideoQueueNotifObserver, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_recorder, 0);
  objc_storeStrong((id *)&self->_debugLayer, 0);
  objc_storeStrong((id *)&self->_mirroringLayer, 0);
  objc_storeStrong((id *)&self->_audioRenderer, 0);
  objc_storeStrong((id *)&self->_synchronizer, 0);
}

@end