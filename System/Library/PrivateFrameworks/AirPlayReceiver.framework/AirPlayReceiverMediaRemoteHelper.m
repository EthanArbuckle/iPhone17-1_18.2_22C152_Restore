@interface AirPlayReceiverMediaRemoteHelper
+ (void)becomeNowPlayingApplication;
+ (void)resignAsNowPlayingApplication;
+ (void)setIsNowPlayingApplication:(unsigned __int8)a3;
- (AirPlayReceiverMediaRemoteHelper)initWithPlayerID:(__CFString *)a3 withSystemInfo:(OpaqueAPReceiverSystemInfo *)a4 withReceiverServer:(AirPlayReceiverServerPrivate *)a5;
- (unsigned)handleMediaRemoteCommand:(unsigned int)a3 withOptions:(__CFDictionary *)a4;
- (void)associateNowPlayingSessionWithAudioSession:(unsigned int)a3;
- (void)broadcastPauseCommand;
- (void)dealloc;
- (void)handleActiveSessionWillBeHijacked:(id)a3;
- (void)handleLocalDeviceRoutingContextIDDidChange:(id)a3;
- (void)handlePlaybackStateDidChange:(id)a3;
- (void)handleSilentPrimaryStateDidChange:(id)a3;
- (void)makeNowPlayingPlayer;
- (void)registerCommandHandler;
- (void)removeNowPlayingArtwork;
- (void)setAPNowPlayingInfo:(__CFDictionary *)a3;
- (void)setDelegate:(id)a3;
- (void)setIsNowPlaying:(unsigned __int8)a3;
- (void)setMRNowPlayingClient:(__CFData *)a3;
- (void)setMRNowPlayingInfo:(__CFDictionary *)a3 withMergePolicy:(unsigned __int8)a4;
- (void)setMRPlaybackState:(unsigned int)a3;
- (void)setMRSupportedCommands:(__CFArray *)a3;
- (void)setMRSupportedCommandsFromSerializedArray:(__CFArray *)a3;
- (void)startNowPlayingSession;
- (void)stopNowPlayingSession;
- (void)unregisterCommandHandler;
@end

@implementation AirPlayReceiverMediaRemoteHelper

- (void)dealloc
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    v11 = self;
    LogPrintF();
  }
  [(AirPlayReceiverMediaRemoteHelper *)self unregisterCommandHandler];
  softLinkMRMediaRemoteSetWantsNowPlayingNotifications(0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  if (APSMultiPrimariesEnabled() && APSNowPlayingSessionDataSourceEnabled())
  {
    v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:getMRNowPlayingSessionManagerIsSilentPrimaryDidChange() object:0];
    v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:getMRNowPlayingSessionManagerLocalDeviceRoutingContextIDDidChange() object:0];
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:self name:getMRNowPlayingSessionManagerActiveSessionWillBeHijackedByNativePlayback() object:0];
  }
  [(NSOperationQueue *)self->_dataTransferQueue cancelAllOperations];
  softLinkMRMediaRemoteRemovePlayer((uint64_t)self->_state.playerPath, 0, 0);

  self->_state.playerPath = 0;
  weakDelegate = self->_state.weakDelegate;
  if (weakDelegate)
  {
    CFRelease(weakDelegate);
    self->_state.weakDelegate = 0;
  }
  systemInfo = self->_systemInfo;
  if (systemInfo)
  {
    CFRelease(systemInfo);
    self->_systemInfo = 0;
  }
  server = self->_server;
  if (server)
  {
    CFRelease(server);
    self->_server = 0;
  }

  self->_dataTransferQueue = 0;
  dataTransferQueueInternal = self->_dataTransferQueueInternal;
  if (dataTransferQueueInternal)
  {
    dispatch_release(dataTransferQueueInternal);
    self->_dataTransferQueueInternal = 0;
  }
  notificationQueue = self->_notificationQueue;
  if (notificationQueue)
  {
    dispatch_release(notificationQueue);
    self->_notificationQueue = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)AirPlayReceiverMediaRemoteHelper;
  [(AirPlayReceiverMediaRemoteHelper *)&v12 dealloc];
}

- (AirPlayReceiverMediaRemoteHelper)initWithPlayerID:(__CFString *)a3 withSystemInfo:(OpaqueAPReceiverSystemInfo *)a4 withReceiverServer:(AirPlayReceiverServerPrivate *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)AirPlayReceiverMediaRemoteHelper;
  v8 = [(AirPlayReceiverMediaRemoteHelper *)&v19 init];
  v9 = v8;
  if (v8)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    *(_OWORD *)label = 0u;
    v17 = v8;
    SNPrintF();
    v9->_dataTransferQueueInternal = (OS_dispatch_queue *)dispatch_queue_create(label, 0);
    v10 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    v9->_dataTransferQueue = v10;
    -[NSOperationQueue setUnderlyingQueue:](v10, "setUnderlyingQueue:", v9->_dataTransferQueueInternal, v17);
    v18 = v9;
    SNPrintF();
    v9->_notificationQueue = (OS_dispatch_queue *)dispatch_queue_create(label, 0);
    if (a3)
    {
      v11 = objc_msgSend(objc_alloc(getMRPlayerClass()), "initWithIdentifier:displayName:", a3, a3, v9);
      v9->_state.playerPath = (MRPlayerPath *)[objc_alloc(getMRPlayerPathClass()) initWithOrigin:0 client:0 player:v11];
    }
    else
    {
      v11 = 0;
    }
    v9->_systemInfo = (OpaqueAPReceiverSystemInfo *)CFRetain(a4);
    v9->_server = (AirPlayReceiverServerPrivate *)CFRetain(a5);
    objc_super v12 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v9 selector:sel_handlePlaybackStateDidChange_ name:getkMRMediaRemotePlayerPlaybackStateDidChangeNotification() object:0];
    softLinkMRMediaRemoteSetWantsNowPlayingNotifications(1);
    if (APSMultiPrimariesEnabled() && APSNowPlayingSessionDataSourceEnabled())
    {
      v13 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v13 addObserver:v9 selector:sel_handleSilentPrimaryStateDidChange_ name:getMRNowPlayingSessionManagerIsSilentPrimaryDidChange() object:0];
      v14 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v14 addObserver:v9 selector:sel_handleLocalDeviceRoutingContextIDDidChange_ name:getMRNowPlayingSessionManagerLocalDeviceRoutingContextIDDidChange() object:0];
      v15 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v15 addObserver:v9 selector:sel_handleActiveSessionWillBeHijacked_ name:getMRNowPlayingSessionManagerActiveSessionWillBeHijackedByNativePlayback() object:0];
      [(AirPlayReceiverMediaRemoteHelper *)v9 handleSilentPrimaryStateDidChange:0];
      [(AirPlayReceiverMediaRemoteHelper *)v9 handleLocalDeviceRoutingContextIDDidChange:0];
    }
    if (_getDefaultMRSupportedCommandInfos_s_onceToken != -1) {
      dispatch_once(&_getDefaultMRSupportedCommandInfos_s_onceToken, &__block_literal_global_145);
    }
    -[AirPlayReceiverMediaRemoteHelper setMRSupportedCommands:](v9, "setMRSupportedCommands:", _getDefaultMRSupportedCommandInfos_s_defaultCommandInfos, v18);
  }
  else
  {
    v11 = 0;
  }
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v9;
}

- (void)handleActiveSessionWillBeHijacked:(id)a3
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFObjectControlAsync();
}

- (void)handleLocalDeviceRoutingContextIDDidChange:(id)a3
{
  uint64_t v6 = softLinkMRNowPlayingSessionManagerLocalDeviceRoutingContextID();
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  systemInfo = self->_systemInfo;

  APReceiverSystemInfoSetProperty((uint64_t)systemInfo, v4, @"RoutingContextID", v5, v6);
}

- (void)handleSilentPrimaryStateDidChange:(id)a3
{
  softLinkMRNowPlayingSessionManagerIsSilentPrimary();
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  CFObjectSetProperty();
}

- (void)handlePlaybackStateDidChange:(id)a3
{
  uint64_t v5 = (void *)[a3 userInfo];
  uint64_t v6 = (void *)[v5 objectForKeyedSubscript:getkMRNowPlayingPlayerPathUserInfoKey()];
  v7 = (void *)[a3 userInfo];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", getkMRMediaRemotePlaybackStateUserInfoKey()), "intValue");
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 30
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    unsigned int v9 = objc_msgSend((id)objc_msgSend(v6, "origin"), "isLocal");
    uint64_t v10 = objc_msgSend((id)objc_msgSend(v6, "client"), "displayName");
    uint64_t v17 = objc_msgSend((id)objc_msgSend(v6, "client"), "processIdentifier");
    uint64_t v18 = v8;
    uint64_t v15 = v9;
    uint64_t v16 = v10;
    v14 = self;
    LogPrintF();
  }
  if (objc_msgSend((id)objc_msgSend(v6, "origin", v14, v15, v16, v17, v18), "isLocal"))
  {
    if (objc_msgSend((id)objc_msgSend(v6, "client"), "processIdentifier"))
    {
      v11 = self;
      id v12 = v6;
      notificationQueue = self->_notificationQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__AirPlayReceiverMediaRemoteHelper_handlePlaybackStateDidChange___block_invoke;
      block[3] = &unk_264895288;
      block[4] = self;
      block[5] = v6;
      int v20 = v8;
      dispatch_async(notificationQueue, block);
    }
  }
}

void __65__AirPlayReceiverMediaRemoteHelper_handlePlaybackStateDidChange___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    LogPrintF();
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "client", v4, v5), "processIdentifier")), @"APReceiverMediaRemoteHelperUserInfoKeyNowPlayingAppProcessIdentifier");
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "client"), "displayName")) {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "client"), "displayName"), @"kAPReceiverMediaRemoteHelperUserInfoKeyNowPlayingAppProcessDisplayName");
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", *(_DWORD *)(a1 + 48) == 1), @"APReceiverMediaRemoteHelperUserInfoKeyNowPlayingAppIsPlaying");
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"APReceiverMediaRemoteHelperNowPlayingAppStartedPlayingNotification", *(void *)(a1 + 32), v2);

  v3 = *(void **)(a1 + 40);
}

- (void)setMRNowPlayingClient:(__CFData *)a3
{
  uint64_t v4 = (const void *)softLinkMRNowPlayingClientCreateFromExternalRepresentation((uint64_t)a3);
  if (v4)
  {
    uint64_t v5 = v4;
    CFRetain(v4);
    dataTransferQueue = self->_dataTransferQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__AirPlayReceiverMediaRemoteHelper_setMRNowPlayingClient___block_invoke;
    v7[3] = &unk_264896140;
    v7[4] = self;
    v7[5] = v5;
    [(NSOperationQueue *)dataTransferQueue addOperationWithBlock:v7];
    CFRelease(v5);
  }
  else
  {
    APSLogErrorAt();
  }
}

void __58__AirPlayReceiverMediaRemoteHelper_setMRNowPlayingClient___block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "client", v6, v7);
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) origin];
  softLinkMRMediaRemoteSyncClientProperties(v2, v3, v4, 0, 0);
  uint64_t v5 = *(const void **)(a1 + 40);

  CFRelease(v5);
}

- (void)setAPNowPlayingInfo:(__CFDictionary *)a3
{
  CFDictionaryGetValue(a3, @"artworkData");
  if (FigCFEqual()) {
    [(AirPlayReceiverMediaRemoteHelper *)self removeNowPlayingArtwork];
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    uint64_t v5 = Mutable;
    CFDictionaryApplyBlock();
    uint64_t v6 = (const void *)getkMRMediaRemoteNowPlayingInfoUniqueIdentifier();
    if (CFDictionaryContainsKey(v5, v6))
    {
      uint64_t v7 = (const void *)getkMRMediaRemoteNowPlayingInfoMediaType();
      uint64_t v8 = (const void *)getkMRMediaRemoteMediaTypeMusic();
      CFDictionaryAddValue(v5, v7, v8);
    }
    [(AirPlayReceiverMediaRemoteHelper *)self setMRNowPlayingInfo:v5 withMergePolicy:0];
    CFRelease(v5);
  }
  else
  {
    APSLogErrorAt();
    APSLogErrorAt();
  }
}

- (void)removeNowPlayingArtwork
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  dataTransferQueue = self->_dataTransferQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__AirPlayReceiverMediaRemoteHelper_removeNowPlayingArtwork__block_invoke;
  v6[3] = &unk_264896078;
  v6[4] = self;
  v6[5] = &v7;
  [(NSOperationQueue *)dataTransferQueue addOperationWithBlock:v6];
  [(NSOperationQueue *)self->_dataTransferQueue waitUntilAllOperationsAreFinished];
  if (v8[3])
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = self;
      LogPrintF();
    }
    -[AirPlayReceiverMediaRemoteHelper setMRNowPlayingInfo:withMergePolicy:](self, "setMRNowPlayingInfo:withMergePolicy:", v8[3], 1, v5);
    uint64_t v4 = (const void *)v8[3];
    if (v4) {
      CFRelease(v4);
    }
  }
  _Block_object_dispose(&v7, 8);
}

void __59__AirPlayReceiverMediaRemoteHelper_removeNowPlayingArtwork__block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 48);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__AirPlayReceiverMediaRemoteHelper_removeNowPlayingArtwork__block_invoke_2;
  v6[3] = &unk_264894E68;
  uint64_t v5 = *(void *)(a1 + 40);
  v6[4] = v2;
  v6[5] = v5;
  softLinkMRMediaRemoteGetNowPlayingInfoForPlayer(v3, 0, (uint64_t)global_queue, (uint64_t)v6);
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v2);
}

intptr_t __59__AirPlayReceiverMediaRemoteHelper_removeNowPlayingArtwork__block_invoke_2(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFTypeRef v3 = CFRetain(cf);
  }
  else {
    CFTypeRef v3 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  uint64_t v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

- (void)makeNowPlayingPlayer
{
  dataTransferQueue = self->_dataTransferQueue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__AirPlayReceiverMediaRemoteHelper_makeNowPlayingPlayer__block_invoke;
  v3[3] = &unk_264895FB0;
  v3[4] = self;
  [(NSOperationQueue *)dataTransferQueue addOperationWithBlock:v3];
}

uint64_t __56__AirPlayReceiverMediaRemoteHelper_makeNowPlayingPlayer__block_invoke(uint64_t a1)
{
  return softLinkMRMediaRemoteSetNowPlayingPlayer(*(void *)(*(void *)(a1 + 32) + 48), 0, 0);
}

- (void)setMRSupportedCommandsFromSerializedArray:(__CFArray *)a3
{
  uint64_t Count = CFArrayGetCount(a3);
  uint64_t v6 = *MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], Count, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
        uint64_t v10 = (const void *)((uint64_t (*)(uint64_t, uint64_t))softLinkMRMediaRemoteCommandInfoCreateFromExternalRepresentation)(v6, (uint64_t)ValueAtIndex);
        CFArrayAppendValue(Mutable, v10);
        CFRelease(v10);
      }
    }
    if (CFArrayGetCount(Mutable))
    {
      [(AirPlayReceiverMediaRemoteHelper *)self setMRSupportedCommands:Mutable];
      v11 = Mutable;
LABEL_19:
      CFRelease(v11);
      return;
    }
  }
  else
  {
    APSLogErrorAt();
  }
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    id v12 = self;
    LogPrintF();
  }
  if (_getDefaultMRSupportedCommandInfos_s_onceToken != -1) {
    dispatch_once(&_getDefaultMRSupportedCommandInfos_s_onceToken, &__block_literal_global_145);
  }
  v11 = (__CFArray *)_getDefaultMRSupportedCommandInfos_s_defaultCommandInfos;
  if (_getDefaultMRSupportedCommandInfos_s_defaultCommandInfos) {
    CFRetain((CFTypeRef)_getDefaultMRSupportedCommandInfos_s_defaultCommandInfos);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  -[AirPlayReceiverMediaRemoteHelper setMRSupportedCommands:](self, "setMRSupportedCommands:", v11, v12);
  if (v11) {
    goto LABEL_19;
  }
}

- (void)setMRSupportedCommands:(__CFArray *)a3
{
  if (a3)
  {
    CFRetain(a3);
    dataTransferQueue = self->_dataTransferQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__AirPlayReceiverMediaRemoteHelper_setMRSupportedCommands___block_invoke;
    v7[3] = &unk_264896140;
    v7[4] = self;
    v7[5] = a3;
    [(NSOperationQueue *)dataTransferQueue addOperationWithBlock:v7];
  }
  else
  {
    APSLogErrorAt();
  }
}

void __59__AirPlayReceiverMediaRemoteHelper_setMRSupportedCommands___block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    CFArrayGetCount(*(CFArrayRef *)(a1 + 40));
    LogPrintF();
  }
  softLinkMRMediaRemoteSetSupportedCommandsForPlayer(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 48), 0, 0);
  uint64_t v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

- (void)unregisterCommandHandler
{
  if (self->_state.commandHandlerToken)
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    softLinkMRMediaRemoteRemoveCommandHandlerBlockForPlayer((uint64_t)self->_state.playerPath, (uint64_t)self->_state.commandHandlerToken);
    self->_state.commandHandlerToken = 0;
  }
}

- (void)registerCommandHandler
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__AirPlayReceiverMediaRemoteHelper_registerCommandHandler__block_invoke;
  v3[3] = &unk_264894E40;
  objc_copyWeak(&v4, &location);
  if (self->_state.commandHandlerToken) {
    [(AirPlayReceiverMediaRemoteHelper *)self unregisterCommandHandler];
  }
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_state.commandHandlerToken = (void *)softLinkMRMediaRemoteAddCommandHandlerBlockForPlayer((uint64_t)self->_state.playerPath, (uint64_t)v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

CFArrayRef __58__AirPlayReceiverMediaRemoteHelper_registerCommandHandler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [objc_loadWeak((id *)(a1 + 32)) handleMediaRemoteCommand:a2 withOptions:a3];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  values = (void *)FigCFNumberCreateUInt32();
  CFArrayRef v4 = CFArrayCreate(v3, (const void **)&values, 1, MEMORY[0x263EFFF70]);
  CFRelease(values);
  return v4;
}

- (unsigned)handleMediaRemoteCommand:(unsigned int)a3 withOptions:(__CFDictionary *)a4
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a4
    && ((uint64_t v7 = (const void *)getkMRMediaRemoteOptionRemoteControlInterfaceIdentifier(),
         Value = (__CFString *)CFDictionaryGetValue(a4, v7),
         Value == @"com.apple.airplay.mrhelper")
     || Value && CFEqual(Value, @"com.apple.airplay.mrhelper")))
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    dataTransferQueueInternal = self->_dataTransferQueueInternal;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__AirPlayReceiverMediaRemoteHelper_handleMediaRemoteCommand_withOptions___block_invoke;
    block[3] = &unk_264896078;
    block[4] = self;
    block[5] = &v17;
    dispatch_sync(dataTransferQueueInternal, block);
    uint64_t v10 = (const void *)v18[3];
    if (v10)
    {
      CFRetain(v10);
      if (a4) {
        CFRetain(a4);
      }
      notificationQueue = self->_notificationQueue;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __73__AirPlayReceiverMediaRemoteHelper_handleMediaRemoteCommand_withOptions___block_invoke_2;
      v14[3] = &unk_264895420;
      unsigned int v15 = a3;
      v14[4] = &v17;
      v14[5] = a4;
      dispatch_async(notificationQueue, v14);
    }
    else if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 60 {
           && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  id v12 = (const void *)v18[3];
  if (v12) {
    CFRelease(v12);
  }
  _Block_object_dispose(&v17, 8);
  return 0;
}

uint64_t __73__AirPlayReceiverMediaRemoteHelper_handleMediaRemoteCommand_withOptions___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 64);
  if (result)
  {
    uint64_t result = FigCFWeakReferenceHolderCopyReferencedObject();
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

void __73__AirPlayReceiverMediaRemoteHelper_handleMediaRemoteCommand_withOptions___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), "handleMRCommand:translatedAPCommand:withOptions:");
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)setMRPlaybackState:(unsigned int)a3
{
  dataTransferQueue = self->_dataTransferQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__AirPlayReceiverMediaRemoteHelper_setMRPlaybackState___block_invoke;
  v4[3] = &unk_2648952B0;
  v4[4] = self;
  unsigned int v5 = a3;
  [(NSOperationQueue *)dataTransferQueue addOperationWithBlock:v4];
}

uint64_t __55__AirPlayReceiverMediaRemoteHelper_setMRPlaybackState___block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  CFArrayRef v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkMRMediaRemoteSetPlaybackStateForPlayer;

  return v4(v2, v3, 0, 0);
}

- (void)setMRNowPlayingInfo:(__CFDictionary *)a3 withMergePolicy:(unsigned __int8)a4
{
  if (a3)
  {
    CFRetain(a3);
    dataTransferQueue = self->_dataTransferQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __72__AirPlayReceiverMediaRemoteHelper_setMRNowPlayingInfo_withMergePolicy___block_invoke;
    v8[3] = &unk_264894E18;
    unsigned __int8 v9 = a4;
    v8[4] = self;
    v8[5] = a3;
    [(NSOperationQueue *)dataTransferQueue addOperationWithBlock:v8];
  }
}

void __72__AirPlayReceiverMediaRemoteHelper_setMRNowPlayingInfo_withMergePolicy___block_invoke(uint64_t a1)
{
  int v2 = gLogCategory_AirPlayReceiverMediaRemoteHelper;
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50)
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_9;
      }
      int v2 = gLogCategory_AirPlayReceiverMediaRemoteHelper;
    }
    if (v2 == -1) {
      _LogCategory_Initialize();
    }
    LogPrintF();
  }
LABEL_9:
  softLinkMRMediaRemoteSetNowPlayingInfoForPlayer(*(void *)(*(void *)(a1 + 32) + 48), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 0, 0);
  uint64_t v3 = *(const void **)(a1 + 40);

  CFRelease(v3);
}

- (void)broadcastPauseCommand
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v3 = (const void *)getkMRMediaRemoteOptionRemoteControlInterfaceIdentifier();
  CFDictionarySetValue(Mutable, v3, @"com.apple.airplay.mrhelper");
  uint64_t LocalOrigin = softLinkMRMediaRemoteGetLocalOrigin();
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2, 0);
  softLinkMRMediaRemoteBroadcastCommand(1, (uint64_t)Mutable, LocalOrigin, 0, (uint64_t)global_queue, (uint64_t)&__block_literal_global_113);
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

void __57__AirPlayReceiverMediaRemoteHelper_broadcastPauseCommand__block_invoke()
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)associateNowPlayingSessionWithAudioSession:(unsigned int)a3
{
  if (APSMultiPrimariesEnabled())
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 90
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = self;
      LogPrintF();
    }
    dataTransferQueue = self->_dataTransferQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __79__AirPlayReceiverMediaRemoteHelper_associateNowPlayingSessionWithAudioSession___block_invoke;
    v7[3] = &unk_2648952B0;
    v7[4] = self;
    unsigned int v8 = a3;
    -[NSOperationQueue addOperationWithBlock:](dataTransferQueue, "addOperationWithBlock:", v7, v6);
    [(NSOperationQueue *)self->_dataTransferQueue waitUntilAllOperationsAreFinished];
  }
}

void __79__AirPlayReceiverMediaRemoteHelper_associateNowPlayingSessionWithAudioSession___block_invoke(uint64_t a1)
{
  int v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 48);
  uint64_t v5 = *(unsigned int *)(a1 + 40);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__AirPlayReceiverMediaRemoteHelper_associateNowPlayingSessionWithAudioSession___block_invoke_2;
  v7[3] = &unk_264894DD0;
  v7[4] = v3;
  void v7[5] = v2;
  softLinkMRMediaRemoteSetAVAudioSessionOpaqueSessionIDForPlayer(v4, v5, (uint64_t)global_queue, (uint64_t)v7);
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v2);
}

intptr_t __79__AirPlayReceiverMediaRemoteHelper_associateNowPlayingSessionWithAudioSession___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 90
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50 {
         && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  uint64_t v3 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v3);
}

- (void)stopNowPlayingSession
{
  if (APSMultiPrimariesEnabled())
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = self;
      LogPrintF();
    }
    [(NSOperationQueue *)self->_dataTransferQueue cancelAllOperations];
    dataTransferQueue = self->_dataTransferQueue;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __57__AirPlayReceiverMediaRemoteHelper_stopNowPlayingSession__block_invoke;
    v5[3] = &unk_264895FB0;
    v5[4] = self;
    [(NSOperationQueue *)dataTransferQueue addOperationWithBlock:v5];
    [(NSOperationQueue *)self->_dataTransferQueue waitUntilAllOperationsAreFinished];
  }
  else if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 90 {
         && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __57__AirPlayReceiverMediaRemoteHelper_stopNowPlayingSession__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 48) = 0;
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)startNowPlayingSession
{
  if (APSMultiPrimariesEnabled())
  {
    [(NSOperationQueue *)self->_dataTransferQueue cancelAllOperations];
    uint64_t v3 = mach_absolute_time();
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = self;
      LogPrintF();
    }
    dataTransferQueue = self->_dataTransferQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__AirPlayReceiverMediaRemoteHelper_startNowPlayingSession__block_invoke;
    v6[3] = &unk_264896140;
    v6[4] = self;
    v6[5] = v3;
    -[NSOperationQueue addOperationWithBlock:](dataTransferQueue, "addOperationWithBlock:", v6, v5);
    [(NSOperationQueue *)self->_dataTransferQueue waitUntilAllOperationsAreFinished];
  }
  else if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 90 {
         && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __58__AirPlayReceiverMediaRemoteHelper_startNowPlayingSession__block_invoke(uint64_t a1)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = __Block_byref_object_copy_;
  unsigned int v15 = __Block_byref_object_dispose_;
  uint64_t v16 = 0;
  int v2 = dispatch_semaphore_create(0);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__AirPlayReceiverMediaRemoteHelper_startNowPlayingSession__block_invoke_25;
  v10[3] = &unk_264894DA8;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v10[6] = &v11;
  v10[7] = v5;
  v10[4] = v4;
  v10[5] = v2;
  softLinkMRNowPlayingSessionManagerStartSession((uint64_t)global_queue, (uint64_t)v10);
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v2);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 48);
  unsigned int v8 = (void *)v12[5];
  id v9 = v8;
  *(void *)(v6 + 48) = v8;

  softLinkMRMediaRemoteSetCanBeNowPlayingForPlayer(*(void *)(*(void *)(a1 + 32) + 48), 1);
  _Block_object_dispose(&v11, 8);
}

intptr_t __58__AirPlayReceiverMediaRemoteHelper_startNowPlayingSession__block_invoke_25(uint64_t a1, void *a2)
{
  mach_absolute_time();
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    UpTicksToMilliseconds();
    LogPrintF();
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a2;
  uint64_t v4 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v4);
}

- (void)setIsNowPlaying:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = objc_opt_class();

  [v4 setIsNowPlayingApplication:v3];
}

- (void)setDelegate:(id)a3
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dataTransferQueueInternal = self->_dataTransferQueueInternal;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__AirPlayReceiverMediaRemoteHelper_setDelegate___block_invoke;
  block[3] = &unk_2648960F0;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(dataTransferQueueInternal, block);
}

uint64_t __48__AirPlayReceiverMediaRemoteHelper_setDelegate___block_invoke(uint64_t a1)
{
  int v2 = *(const void **)(*(void *)(a1 + 32) + 64);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(a1 + 32) + 64) = 0;
  }
  if (*(void *)(a1 + 40))
  {
    *(void *)(*(void *)(a1 + 32) + 64) = FigCFWeakReferenceHolderCreateWithReferencedObject();
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 registerCommandHandler];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 unregisterCommandHandler];
  }
}

+ (void)setIsNowPlayingApplication:(unsigned __int8)a3
{
  int v3 = a3;
  if (APSMultiPrimariesEnabled())
  {
    APSLogErrorAt();
  }
  else if (v3)
  {
    [a1 becomeNowPlayingApplication];
  }
  else
  {
    [a1 resignAsNowPlayingApplication];
  }
}

+ (void)resignAsNowPlayingApplication
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50)
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 30
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  softLinkMRMediaRemoteSetNowPlayingApplicationOverrideEnabled(0);
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 30
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v2 = (void (*)(uint64_t))softLinkMRMediaRemoteSetCanBeNowPlayingApplication;

  v2(0);
}

+ (void)becomeNowPlayingApplication
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50)
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 30
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  softLinkMRMediaRemoteSetCanBeNowPlayingApplication(1);
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 30
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v2 = softLinkMRMediaRemoteSetNowPlayingApplicationOverrideEnabled;

  v2(1);
}

@end