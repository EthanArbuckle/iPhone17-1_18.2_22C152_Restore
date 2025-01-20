@interface APRKStreamRenderingManager
+ (BOOL)getAppHasSetAdvertisingAccessModeEntitlement;
+ (BOOL)listeningForAlternateBonjourBrowsing;
+ (BOOL)setAdvertisingAccessMode:(unint64_t)a3 withError:(id *)a4;
+ (id)sharedInstance;
+ (unint64_t)getAdvertisingAccessMode;
+ (void)setListeningForAlternateBonjourBrowsing:(BOOL)a3;
- (APRKStreamRenderingManager)init;
- (APRKStreamRenderingManagerDelegate)delegate;
- (BOOL)_isPermittedClient:(id)a3;
- (BOOL)altAdvertisingEnabled;
- (BOOL)assistedModeEnabled;
- (BOOL)demoModeEnabled;
- (BOOL)enableMixingMediaAudio;
- (BOOL)isAirPlayReceiverSupported;
- (BOOL)isAllowedToProceedForClientWithName:(id)a3 clientID:(id)a4;
- (BOOL)optimizeAudioRenderingLatency;
- (BOOL)shouldForwardLayers;
- (BOOL)supportRemoteControl;
- (BOOL)supportsSenderUIEvents;
- (BOOL)systemSupportsWiFiUDM;
- (BOOL)useCALayerForMirroring;
- (BOOL)usesHomeKitIntegration;
- (CGSize)_customDisplaySizeFromPrefsWithDefault:(CGSize)a3;
- (CGSize)_customDisplaySizeMaxFromPrefsWithDefault:(CGSize)a3;
- (__CFString)_getHDRModeString:(unint64_t)a3;
- (id)_rendererForUniqueIDInternal:(id)a3;
- (id)activeRenderers;
- (id)allClientNames;
- (id)allRenderers;
- (id)assistedInfoForAWDL;
- (id)assistedInfoForDiscovery;
- (id)assistedInfoForIPAddress:(id)a3;
- (id)assistedInfoForMode:(unint64_t)a3 options:(id)a4;
- (id)createStreamRendererWithUniqueID:(id)a3 clientName:(id)a4 UIController:(OpaqueAPReceiverUIController *)a5;
- (id)delegateQueue;
- (id)ensureUniqueClientName:(id)a3;
- (id)rendererForUniqueID:(id)a3;
- (int)_startReceiverServerWithSupportedModesMask:(unint64_t)a3;
- (int)forcePINRefresh;
- (int)startReceiverServer;
- (int)stopReceiverServer;
- (int64_t)permissionTimeout;
- (unint64_t)_customDisplayHDRModeFromPrefsWithDefault:(unint64_t)a3;
- (unint64_t)activeRenderersCount;
- (unint64_t)airPlayVideoVersionSupport;
- (unint64_t)concurrentPlaybackPolicy;
- (unint64_t)displayHDRMode;
- (unint64_t)maxNumberOfConcurrentSessions;
- (unint64_t)preemptionPolicy;
- (unint64_t)supportedModesMask;
- (void)_addPermittedClient:(id)a3;
- (void)_initPermittedClients;
- (void)_setPTPClockEnabled:(BOOL)a3;
- (void)_setRandomPassword;
- (void)processHideGlobalPasscodePromptRequest;
- (void)processShowGlobalPasscodePromptRequest:(id)a3 withClientName:(id)a4;
- (void)removeRendererWithUniqueID:(id)a3;
- (void)setAltAdvertisingEnabled:(BOOL)a3;
- (void)setAssistedModeEnabled:(BOOL)a3;
- (void)setConcurrentPlaybackPolicy:(unint64_t)a3;
- (void)setCustomDisplaySizeMax:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDemoModeEnabled:(BOOL)a3;
- (void)setDisplayHDRMode:(unint64_t)a3;
- (void)setEnableMixingMediaAudio:(BOOL)a3;
- (void)setForcePermissionDialog:(BOOL)a3;
- (void)setMaxNumberOfConcurrentSessions:(unint64_t)a3;
- (void)setOptimizeAudioRenderingLatency:(BOOL)a3;
- (void)setPermissionTimeout:(int64_t)a3;
- (void)setPreemptionPolicy:(unint64_t)a3;
- (void)setShouldForwardLayers:(BOOL)a3;
- (void)setSupportRemoteControl:(BOOL)a3;
- (void)setSupportsSenderUIEvents:(BOOL)a3;
- (void)setUseCALayerForMirroring:(BOOL)a3;
- (void)setUsesHomeKitIntegration:(BOOL)a3;
@end

@implementation APRKStreamRenderingManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_sharedManager;
  return v2;
}

uint64_t __44__APRKStreamRenderingManager_sharedInstance__block_invoke()
{
  if (IsAppleInternalBuild())
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LogControl();
  }
  v0 = objc_alloc_init(APRKStreamRenderingManager);
  uint64_t v1 = sharedInstance_sharedManager;
  sharedInstance_sharedManager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (BOOL)getAppHasSetAdvertisingAccessModeEntitlement
{
  return 1;
}

+ (BOOL)setAdvertisingAccessMode:(unint64_t)a3 withError:(id *)a4
{
  if (+[APRKStreamRenderingManager getAppHasSetAdvertisingAccessModeEntitlement])
  {
    if (!a3 || a3 == 3 || a3 == 1)
    {
      int v6 = APSSettingsSetInt64();
      if (v6)
      {
        int v8 = v6;
      }
      else
      {
        int v7 = APSSettingsRemoveValue();
        if (v7)
        {
          int v8 = v7;
        }
        else
        {
          int v8 = APSSettingsSetValue();
          if (!v8)
          {
            APSSettingsSynchronize();
            notify_post("com.apple.airplay.prefsChanged");
            goto LABEL_9;
          }
        }
      }
      APSLogErrorAt();
    }
    else
    {
      int v8 = -6705;
      APSLogErrorAt();
    }
  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v8 = -6773;
  }
  if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v8 userInfo:0];
  }
LABEL_9:
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v8 == 0;
}

+ (unint64_t)getAdvertisingAccessMode
{
  if (APSGetAccessControlConfig())
  {
    APSLogErrorAt();
  }
  else
  {
    int v2 = APSGetP2PAllow();
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v2 == 1) {
      return 0;
    }
    if (!v2) {
      return 1;
    }
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return -1;
}

+ (void)setListeningForAlternateBonjourBrowsing:(BOOL)a3
{
  if (APSSettingsSetInt64()
    && gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  APSSettingsSynchronize();
  if (!a3)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    notify_post("com.apple.airplay.alternatebonjourbrowsingdisabled");
  }
  notify_post("com.apple.airplay.prefsChanged");
}

+ (BOOL)listeningForAlternateBonjourBrowsing
{
  return APSSettingsGetInt64() != 0;
}

- (APRKStreamRenderingManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)APRKStreamRenderingManager;
  int v2 = [(APRKStreamRenderingManager *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_server = 0;
    *(_DWORD *)&v2->_useCALayerForMirroring = 1;
    v2->_supportRemoteControl = 0;
    CGSize v4 = (CGSize)*MEMORY[0x263F001B0];
    v2->_customDisplaySize = (CGSize)*MEMORY[0x263F001B0];
    v2->_customDisplaySizeMax = v4;
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.aprkstreamrenderingmanager.isolationqueue", 0);
    isolationQueue = v3->_isolationQueue;
    v3->_isolationQueue = (OS_dispatch_queue *)v5;

    objc_storeStrong((id *)&v3->_delegateQueue, MEMORY[0x263EF83A0]);
    int v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    renderersArray = v3->_renderersArray;
    v3->_renderersArray = v7;

    v3->_supportedModesMask = 0;
    v3->_maxNumberOfConcurrentSessions = 0;
    v3->_concurrentPlaybackPolicy = 0;
    *(_OWORD *)&v3->_displayHDRMode = xmmword_23D4FDA10;
    *(_OWORD *)&v3->_permissionTimeout = xmmword_23D4FDA20;
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.aprkstreamrenderingmanager.permissionqueue", 0);
    permittedClientsQueue = v3->_permittedClientsQueue;
    v3->_permittedClientsQueue = (OS_dispatch_queue *)v9;

    int IntWithDefault = APSSettingsGetIntWithDefault();
    v3->_permissionEnabled = IntWithDefault == 0;
    if (IntWithDefault
      && gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v12 = objc_alloc_init(AWDLActivator);
    awdlActivator = v3->_awdlActivator;
    v3->_awdlActivator = v12;

    v3->_preemptionPolicy = 0;
    v3->_useUniqueClientName = APSSettingsGetIntWithDefault() != 0;
  }
  return v3;
}

- (int)startReceiverServer
{
  return [(APRKStreamRenderingManager *)self _startReceiverServerWithSupportedModesMask:7];
}

- (int)stopReceiverServer
{
  if (!self->_server)
  {
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
LABEL_17:
    LogPrintF();
    return 0;
  }
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = AirPlayReceiverServerGetDispatchQueue();
  CFObjectControlAsync();

  CGSize v4 = AirPlayReceiverServerGetDispatchQueue();
  int v5 = CFObjectControlSync();

  server = self->_server;
  if (server)
  {
    CFRelease(server);
    self->_server = 0;
  }
  [(AWDLActivator *)self->_awdlActivator stop];
  if (!v5)
  {
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
    goto LABEL_17;
  }
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v5;
}

- (id)rendererForUniqueID:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    objc_super v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    id v17 = 0;
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__APRKStreamRenderingManager_rendererForUniqueID___block_invoke;
    block[3] = &unk_264EA1BD8;
    v11 = &v12;
    block[4] = self;
    id v10 = v4;
    dispatch_sync(isolationQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __50__APRKStreamRenderingManager_rendererForUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _rendererForUniqueIDInternal:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (unint64_t)activeRenderersCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__APRKStreamRenderingManager_activeRenderersCount__block_invoke;
  v5[3] = &unk_264EA1C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__APRKStreamRenderingManager_activeRenderersCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)allClientNames
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  isolationQueue = self->_isolationQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__APRKStreamRenderingManager_allClientNames__block_invoke;
  v6[3] = &unk_264EA2090;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __44__APRKStreamRenderingManager_allClientNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__APRKStreamRenderingManager_allClientNames__block_invoke_2;
  v3[3] = &unk_264EA2068;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __44__APRKStreamRenderingManager_allClientNames__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 managedClientName];
  [v2 addObject:v3];
}

- (id)allRenderers
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  isolationQueue = self->_isolationQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__APRKStreamRenderingManager_allRenderers__block_invoke;
  v6[3] = &unk_264EA1C28;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __42__APRKStreamRenderingManager_allRenderers__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (id)activeRenderers
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  isolationQueue = self->_isolationQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__APRKStreamRenderingManager_activeRenderers__block_invoke;
  v6[3] = &unk_264EA1C28;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __45__APRKStreamRenderingManager_activeRenderers__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (void)setMaxNumberOfConcurrentSessions:(unint64_t)a3
{
  self->_maxNumberOfConcurrentSessions = a3;
}

- (void)setPreemptionPolicy:(unint64_t)a3
{
  self->_preemptionPolicy = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_server)
  {
    AirPlayReceiverServerSetProperty();
  }
}

- (void)setUseCALayerForMirroring:(BOOL)a3
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_useCALayerForMirroring = a3;
}

- (BOOL)useCALayerForMirroring
{
  return self->_useCALayerForMirroring;
}

- (void)setOptimizeAudioRenderingLatency:(BOOL)a3
{
  self->_optimizeAudioRenderingLatency = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)optimizeAudioRenderingLatency
{
  return APSSettingsGetIntWithDefault() != 0;
}

- (void)setEnableMixingMediaAudio:(BOOL)a3
{
  self->_enableMixingMediaAudio = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)enableMixingMediaAudio
{
  return self->_enableMixingMediaAudio;
}

- (void)setCustomDisplaySizeMax:(CGSize)a3
{
  APSGetMaxSizePreservingAspectRatio();
  self->_customDisplaySizeMax.width = v4;
  self->_customDisplaySizeMax.height = v5;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_server)
  {
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(self->_customDisplaySizeMax);
    AirPlayReceiverServerSetProperty();
    if (DictionaryRepresentation)
    {
      CFRelease(DictionaryRepresentation);
    }
  }
}

- (void)setDisplayHDRMode:(unint64_t)a3
{
  -[APRKStreamRenderingManager _getHDRModeString:](self, "_getHDRModeString:");
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_displayHDRMode = a3;
  if (self->_server)
  {
    AirPlayReceiverServerSetProperty();
  }
}

- (unint64_t)displayHDRMode
{
  return self->_displayHDRMode;
}

- (unint64_t)airPlayVideoVersionSupport
{
  return self->_airPlayVideoVersionSupport;
}

- (void)setUsesHomeKitIntegration:(BOOL)a3
{
  BOOL v3 = a3;
  if (IsAppleInternalBuild())
  {
    int IntWithDefault = APSSettingsGetIntWithDefault();
    if (IntWithDefault) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v3;
    }
    self->_usesHomeKitIntegration = v6;
    if (v3 && IntWithDefault)
    {
      if (gLogCategory_AirPlayReceiverKit > 50) {
        return;
      }
      if (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
    }
  }
  else
  {
    self->_usesHomeKitIntegration = v3;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)usesHomeKitIntegration
{
  return self->_usesHomeKitIntegration;
}

- (void)setDemoModeEnabled:(BOOL)a3
{
  if (self->_server)
  {
    CFObjectSetProperty();
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (BOOL)demoModeEnabled
{
  server = self->_server;
  if (server) {
    LOBYTE(server) = CFObjectGetPropertyInt64Sync() != 0;
  }
  return (char)server;
}

- (void)setSupportsSenderUIEvents:(BOOL)a3
{
  if (self->_server)
  {
    CFObjectSetProperty();
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (BOOL)supportsSenderUIEvents
{
  server = self->_server;
  if (server) {
    LOBYTE(server) = CFObjectGetPropertyInt64Sync() != 0;
  }
  return (char)server;
}

- (void)setDelegateQueue:(id)a3
{
}

- (id)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setPermissionTimeout:(int64_t)a3
{
  self->_permissionTimeout = a3;
}

- (int64_t)permissionTimeout
{
  return self->_permissionTimeout;
}

- (int)forcePINRefresh
{
  if (!self->_server) {
    return 0;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  server = self->_server;
  return MEMORY[0x270F0BA88](server, 1, @"clearPIN", 0, 0, 0);
}

- (BOOL)systemSupportsWiFiUDM
{
  return APSSystemSupportsWiFiUDM() != 0;
}

- (BOOL)isAirPlayReceiverSupported
{
  if (isAirPlayReceiverSupported_once != -1) {
    dispatch_once(&isAirPlayReceiverSupported_once, &__block_literal_global_123);
  }
  return isAirPlayReceiverSupported_sIsReceiverSupported != 0;
}

uint64_t __56__APRKStreamRenderingManager_isAirPlayReceiverSupported__block_invoke()
{
  if (APSIsVirtualMachine()) {
    uint64_t result = IsAppleInternalBuild();
  }
  else {
    uint64_t result = APSSystemSupportsWiFiUDM();
  }
  isAirPlayReceiverSupported_sIsReceiverSupported = result;
  if (gLogCategory_AirPlayReceiverKit <= 50)
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

- (void)setAltAdvertisingEnabled:(BOOL)a3
{
  self->_altAdvertisingEnabled = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)altAdvertisingEnabled
{
  return self->_altAdvertisingEnabled;
}

- (void)setAssistedModeEnabled:(BOOL)a3
{
  self->_assistedModeEnabled = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)assistedModeEnabled
{
  return self->_assistedModeEnabled;
}

- (id)assistedInfoForAWDL
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v10, 0, sizeof(v10));
  if (self->_assistedModeEnabled && self->_server)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(AWDLActivator *)self->_awdlActivator startWithMaxDuration:30];
    uint64_t v3 = CUGetInterfaceAddresses();
    if (v3)
    {
      uint64_t v8 = v3;
    }
    else
    {
      uint64_t v4 = SockAddrToString();
      if (!v4)
      {
        CGFloat v5 = [NSString stringWithUTF8String:v10];
        BOOL v6 = [(APRKStreamRenderingManager *)self assistedInfoForIPAddress:v5];

        if (v6) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      uint64_t v8 = v4;
    }
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = v8;
      LogPrintF();
    }
  }
  else
  {
    APSLogErrorAt();
  }
LABEL_10:
  [(AWDLActivator *)self->_awdlActivator stop];
  BOOL v6 = 0;
LABEL_11:
  return v6;
}

- (id)assistedInfoForIPAddress:(id)a3
{
  id v4 = a3;
  int v17 = 0;
  if (!self->_assistedModeEnabled || !self->_server)
  {
    APSLogErrorAt();
    uint64_t v11 = 0;
    CGFloat v5 = 0;
    BOOL v6 = 0;
LABEL_26:
    id v12 = 0;
    goto LABEL_16;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    id v15 = v4;
    LogPrintF();
  }
  [(APRKStreamRenderingManager *)self _setRandomPassword];
  CGFloat v5 = (void *)AirPlayReceiverServerCopyProperty();
  BOOL v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = (void *)AirPlayReceiverServerCopyProperty();
  uint64_t v8 = [v7 intValue];

  if ((int)v8 <= 0)
  {
    APSLogErrorAt();
    uint64_t v11 = 0;
    goto LABEL_26;
  }
  uint64_t v9 = [NSNumber numberWithInt:v8];
  [v6 setObject:v9 forKey:@"NetworkPort"];

  [v6 setObject:self->_passwordString forKey:@"AuthString"];
  [v6 setObject:v4 forKey:@"NetworkAddress"];
  if ([v4 containsString:@"%awdl"])
  {
    id v10 = [NSNumber numberWithBool:1];
    [v6 setObject:v10 forKey:@"IsP2P"];
  }
  id v16 = 0;
  uint64_t v11 = [MEMORY[0x263F08AC0] dataWithPropertyList:v6 format:200 options:0 error:&v16];
  id v12 = v16;
  if (v12)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v11 = 0;
  }
LABEL_16:
  if (v17
    && gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v13 = v11;

  return v13;
}

- (id)assistedInfoForDiscovery
{
  CFTypeRef cf = 0;
  if (!self->_assistedModeEnabled || !self->_server)
  {
    APSLogErrorAt();
    int v6 = 0;
    id v9 = 0;
    uint64_t v8 = 0;
    id v4 = 0;
LABEL_31:
    uint64_t v7 = 0;
    goto LABEL_16;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  id v4 = Mutable;
  if (!Mutable)
  {
    APSLogErrorAt();
    id v9 = 0;
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    int v6 = -6728;
    goto LABEL_16;
  }
  CFDictionarySetValue(Mutable, @"AssistedOverAWDL", (const void *)*MEMORY[0x263EFFB40]);
  CFDictionarySetInt64();
  CGFloat v5 = AirPlayReceiverServerGetDispatchQueue();
  int v6 = CFObjectControlSync();

  if (v6)
  {
    APSLogErrorAt();
    id v9 = 0;
    uint64_t v8 = 0;
    goto LABEL_31;
  }
  [(APRKStreamRenderingManager *)self _setRandomPassword];
  uint64_t v7 = (void *)[(id)cf mutableCopy];
  [v7 setObject:self->_passwordString forKey:@"AuthString"];
  id v12 = 0;
  uint64_t v8 = [MEMORY[0x263F08AC0] dataWithPropertyList:v7 format:200 options:0 error:&v12];
  id v9 = v12;
  if (v9)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    int v6 = NSErrorToOSStatus();
    id v10 = AirPlayReceiverServerGetDispatchQueue();
    CFObjectControlAsync();

    uint64_t v8 = 0;
  }
  else
  {
    int v6 = 0;
  }
LABEL_16:
  if (cf) {
    CFRelease(cf);
  }
  if (v4) {
    CFRelease(v4);
  }
  if (v6
    && gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v8;
}

- (id)assistedInfoForMode:(unint64_t)a3 options:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3 == 2)
  {
    uint64_t v11 = [(APRKStreamRenderingManager *)self assistedInfoForDiscovery];
LABEL_9:
    id v10 = (void *)v11;
    goto LABEL_15;
  }
  if (a3 == 1)
  {
    uint64_t v11 = [(APRKStreamRenderingManager *)self assistedInfoForAWDL];
    goto LABEL_9;
  }
  if (a3)
  {
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
  }
  else if (v6)
  {
    uint64_t v8 = [v6 objectForKey:@"IPAddress"];

    if (v8)
    {
      id v9 = [v7 objectForKeyedSubscript:@"IPAddress"];
      id v10 = [(APRKStreamRenderingManager *)self assistedInfoForIPAddress:v9];

      goto LABEL_15;
    }
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
  }
  else
  {
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
  }
  LogPrintF();
LABEL_14:
  id v10 = 0;
LABEL_15:

  return v10;
}

- (void)setForcePermissionDialog:(BOOL)a3
{
  self->_forcePermissionDialog = a3;
  if (self->_server)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    AirPlayReceiverServerSetProperty();
  }
}

- (id)ensureUniqueClientName:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CGFloat v5 = v4;
  id v6 = v4;
  if (v4)
  {
    id v6 = v4;
    if (self->_useUniqueClientName)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v7 = self->_renderersArray;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = 1;
        uint64_t v11 = v5;
        while (2)
        {
          uint64_t v12 = *(void *)v18;
LABEL_6:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v7);
            }
            uint64_t v14 = [*(id *)(*((void *)&v17 + 1) + 8 * v13) managedClientName];
            char v15 = [v14 isEqualToString:v11];

            if (v15) {
              break;
            }
            if (v9 == ++v13)
            {
              uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
              if (v9) {
                goto LABEL_6;
              }
              id v6 = v11;
              goto LABEL_16;
            }
          }
          id v6 = [NSString stringWithFormat:@"%@-%d", v5, v10];

          uint64_t v10 = (v10 + 1);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          uint64_t v7 = self->_renderersArray;
          uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
          uint64_t v11 = v6;
          if (v9) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v6 = v5;
      }
LABEL_16:

      if (([v5 isEqualToString:v6] & 1) == 0
        && gLogCategory_AirPlayReceiverKit <= 50
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }

  return v6;
}

- (id)createStreamRendererWithUniqueID:(id)a3 clientName:(id)a4 UIController:(OpaqueAPReceiverUIController *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  [(AWDLActivator *)self->_awdlActivator stop];
  uint64_t v10 = AirPlayReceiverServerGetDispatchQueue();
  CFObjectControlAsync();

  if (v8)
  {
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__APRKStreamRenderingManager_createStreamRendererWithUniqueID_clientName_UIController___block_invoke;
    block[3] = &unk_264EA20B8;
    long long v17 = &v19;
    block[4] = self;
    id v15 = v8;
    id v16 = v9;
    long long v18 = a5;
    dispatch_sync(isolationQueue, block);
  }
  id v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __87__APRKStreamRenderingManager_createStreamRendererWithUniqueID_clientName_UIController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _rendererForUniqueIDInternal:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    CGFloat v5 = [*(id *)(a1 + 32) ensureUniqueClientName:*(void *)(a1 + 48)];
    id v6 = [[APRKStreamRenderer alloc] initWithUniqueID:*(void *)(a1 + 40) clientName:v5 UIController:*(void *)(a1 + 64) useCALayerForMirroring:*(unsigned __int8 *)(*(void *)(a1 + 32) + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "addObject:");
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(NSObject **)(v9 + 32);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __87__APRKStreamRenderingManager_createStreamRendererWithUniqueID_clientName_UIController___block_invoke_2;
      block[3] = &unk_264EA2090;
      uint64_t v11 = *(void *)(a1 + 56);
      block[4] = v9;
      void block[5] = v11;
      dispatch_async(v10, block);
    }
  }
}

void __87__APRKStreamRenderingManager_createStreamRendererWithUniqueID_clientName_UIController___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = [*(id *)(a1 + 32) delegate];
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate", v2, v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 didStartStreamingWithRenderer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)removeRendererWithUniqueID:(id)a3
{
  id v4 = a3;
  CGFloat v5 = v4;
  if (v4)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__1;
    v12[4] = __Block_byref_object_dispose__1;
    id v13 = 0;
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__APRKStreamRenderingManager_removeRendererWithUniqueID___block_invoke;
    block[3] = &unk_264EA1BD8;
    uint64_t v11 = v12;
    block[4] = self;
    id v10 = v4;
    dispatch_sync(isolationQueue, block);
    delegateQueue = self->_delegateQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__APRKStreamRenderingManager_removeRendererWithUniqueID___block_invoke_2;
    v8[3] = &unk_264EA2090;
    v8[4] = self;
    v8[5] = v12;
    dispatch_async(delegateQueue, v8);

    _Block_object_dispose(v12, 8);
  }
}

uint64_t __57__APRKStreamRenderingManager_removeRendererWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _rendererForUniqueIDInternal:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  if (gLogCategory_AirPlayReceiverKit <= 50)
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

void __57__APRKStreamRenderingManager_removeRendererWithUniqueID___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = [*(id *)(a1 + 32) delegate];
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate", v2, v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 didStopStreamingWithRenderer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)setShouldForwardLayers:(BOOL)a3
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_shouldForwardLayers = a3;
}

- (BOOL)shouldForwardLayers
{
  return self->_shouldForwardLayers;
}

- (void)processShowGlobalPasscodePromptRequest:(id)a3 withClientName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__APRKStreamRenderingManager_processShowGlobalPasscodePromptRequest_withClientName___block_invoke;
  block[3] = &unk_264EA1CF0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(delegateQueue, block);
}

void __84__APRKStreamRenderingManager_processShowGlobalPasscodePromptRequest_withClientName___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      id v4 = [*(id *)(a1 + 32) delegate];
      uint64_t v5 = *(void *)(a1 + 40);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate", v4, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 shouldShowGlobalPasscodeWithString:*(void *)(a1 + 48) withClientName:*(void *)(a1 + 40)];
  }
}

- (void)processHideGlobalPasscodePromptRequest
{
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__APRKStreamRenderingManager_processHideGlobalPasscodePromptRequest__block_invoke;
  block[3] = &unk_264EA1AE8;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __68__APRKStreamRenderingManager_processHideGlobalPasscodePromptRequest__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      id v4 = [*(id *)(a1 + 32) delegate];
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate", v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 shouldHideGlobalPasscode];
  }
}

- (BOOL)isAllowedToProceedForClientWithName:(id)a3 clientID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_permissionEnabled)
  {
    id v8 = [(APRKStreamRenderingManager *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      BOOL v9 = [(APRKStreamRenderingManager *)self _isPermittedClient:v7];

      if (!v9)
      {
        dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
        uint64_t v36 = 0;
        v37 = &v36;
        uint64_t v38 = 0x2020000000;
        char v39 = 0;
        uint64_t v11 = [MEMORY[0x263F08C38] UUID];
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __75__APRKStreamRenderingManager_isAllowedToProceedForClientWithName_clientID___block_invoke;
        aBlock[3] = &unk_264EA20E0;
        v35 = &v36;
        id v12 = v10;
        v34 = v12;
        id v13 = _Block_copy(aBlock);
        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __75__APRKStreamRenderingManager_isAllowedToProceedForClientWithName_clientID___block_invoke_2;
        block[3] = &unk_264EA2108;
        block[4] = self;
        id v15 = v6;
        id v30 = v15;
        id v16 = v11;
        id v31 = v16;
        id v17 = v13;
        id v32 = v17;
        dispatch_async(delegateQueue, block);
        int64_t permissionTimeout = self->_permissionTimeout;
        if (permissionTimeout < 0) {
          dispatch_time_t v19 = -1;
        }
        else {
          dispatch_time_t v19 = dispatch_time(0, 1000000000 * permissionTimeout);
        }
        if (dispatch_semaphore_wait(v12, v19))
        {
          if (gLogCategory_AirPlayReceiverKit <= 50
            && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
          {
            v25 = [(APRKStreamRenderingManager *)self delegate];
            id v26 = v15;
            LogPrintF();
          }
          uint64_t v22 = [(APRKStreamRenderingManager *)self delegate];
          char v23 = objc_opt_respondsToSelector();

          if (v23)
          {
            id v24 = self->_delegateQueue;
            v27[0] = MEMORY[0x263EF8330];
            v27[1] = 3221225472;
            v27[2] = __75__APRKStreamRenderingManager_isAllowedToProceedForClientWithName_clientID___block_invoke_3;
            v27[3] = &unk_264EA1B88;
            v27[4] = self;
            id v28 = v16;
            dispatch_async(v24, v27);
          }
        }
        else if (*((unsigned char *)v37 + 24))
        {
          [(APRKStreamRenderingManager *)self _addPermittedClient:v7];
          BOOL v20 = 1;
LABEL_24:

          _Block_object_dispose(&v36, 8);
          goto LABEL_8;
        }
        BOOL v20 = 0;
        goto LABEL_24;
      }
    }
    else
    {
    }
  }
  BOOL v20 = 1;
LABEL_8:
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v20;
}

intptr_t __75__APRKStreamRenderingManager_isAllowedToProceedForClientWithName_clientID___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __75__APRKStreamRenderingManager_isAllowedToProceedForClientWithName_clientID___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = [*(id *)(a1 + 32) delegate];
    uint64_t v3 = *(void *)(a1 + 40);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate", v2, v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 shouldAskPermissionWithRequestID:*(void *)(a1 + 48) forClientWithName:*(void *)(a1 + 40) withCompletionBlock:*(void *)(a1 + 56)];
}

void __75__APRKStreamRenderingManager_isAllowedToProceedForClientWithName_clientID___block_invoke_3(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = [*(id *)(a1 + 32) delegate];
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate", v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 shouldCancelPermissionRequestWithRequestID:*(void *)(a1 + 40)];
}

- (__CFString)_getHDRModeString:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      id v3 = (__CFString **)MEMORY[0x263F12518];
      return *v3;
    case 2uLL:
      id v3 = (__CFString **)MEMORY[0x263F12520];
      return *v3;
    case 1uLL:
      id v3 = (__CFString **)MEMORY[0x263F12528];
      return *v3;
  }
  return 0;
}

- (int)_startReceiverServerWithSupportedModesMask:(unint64_t)a3
{
  valuePtr = UIControllerCreate;
  -[APRKStreamRenderingManager _customDisplaySizeFromPrefsWithDefault:](self, "_customDisplaySizeFromPrefsWithDefault:", self->_customDisplaySize.width, self->_customDisplaySize.height);
  double v6 = v5;
  double v8 = v7;
  -[APRKStreamRenderingManager _customDisplaySizeMaxFromPrefsWithDefault:](self, "_customDisplaySizeMaxFromPrefsWithDefault:", self->_customDisplaySizeMax.width, self->_customDisplaySizeMax.height);
  double v10 = v9;
  double v12 = v11;
  unint64_t v13 = [(APRKStreamRenderingManager *)self _customDisplayHDRModeFromPrefsWithDefault:self->_displayHDRMode];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__APRKStreamRenderingManager__startReceiverServerWithSupportedModesMask___block_invoke;
  block[3] = &unk_264EA1AE8;
  block[4] = self;
  if (_startReceiverServerWithSupportedModesMask__onceToken != -1) {
    dispatch_once(&_startReceiverServerWithSupportedModesMask__onceToken, block);
  }
  if (self->_server)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return 0;
  }
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v16 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  Mutable = CFDictionaryCreateMutable(v15, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24938], v16);
  double v18 = *MEMORY[0x263F001B0];
  double v19 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v6 != *MEMORY[0x263F001B0] || v8 != v19)
  {
    v37.width = v6;
    v37.height = v8;
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v37);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F248F8], DictionaryRepresentation);
    CFRelease(DictionaryRepresentation);
  }
  if (v10 != v18 || v12 != v19)
  {
    v38.width = v10;
    v38.height = v12;
    CFDictionaryRef v23 = CGSizeCreateDictionaryRepresentation(v38);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24900], v23);
    CFRelease(v23);
  }
  id v24 = [(APRKStreamRenderingManager *)self _getHDRModeString:v13];
  if (v24) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F248F0], v24);
  }
  if (a3)
  {
    self->_supportedModesMask = a3;
    uint64_t v25 = APSFeaturesCreateMutable();
    if (!v25)
    {
      APSLogErrorAt();
      int v14 = -6728;
      goto LABEL_93;
    }
    id v26 = (const void *)v25;
    if ((a3 & 1) == 0)
    {
      if (gLogCategory_AirPlayReceiverKit <= 10
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      APSFeaturesSetFeature();
    }
    if ((a3 & 3) == 0)
    {
      if (gLogCategory_AirPlayReceiverKit <= 10
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      APSFeaturesSetFeature();
    }
    if ((a3 & 4) == 0)
    {
      if (gLogCategory_AirPlayReceiverKit <= 10
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      APSFeaturesSetFeature();
      APSFeaturesSetFeature();
      APSFeaturesSetFeature();
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24910], v26);
    CFRelease(v26);
  }
  v27 = (const void *)*MEMORY[0x263EFFB40];
  id v28 = (const void *)*MEMORY[0x263EFFB38];
  if (self->_usesHomeKitIntegration) {
    v29 = (const void *)*MEMORY[0x263EFFB40];
  }
  else {
    v29 = (const void *)*MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24950], v29);
  if (self->_maxNumberOfConcurrentSessions)
  {
    if (gLogCategory_AirPlayReceiverKit <= 10
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFDictionarySetInt64();
  }
  else if (gLogCategory_AirPlayReceiverKit <= 10 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  unint64_t concurrentPlaybackPolicy = self->_concurrentPlaybackPolicy;
  if (concurrentPlaybackPolicy)
  {
    if (concurrentPlaybackPolicy == 1) {
      id v31 = v27;
    }
    else {
      id v31 = v28;
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24920], v31);
  }
  if (self->_supportRemoteControl) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24930], v27);
  }
  if (self->_assistedModeEnabled)
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24928], v27);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24948], v27);
  }
  if (self->_altAdvertisingEnabled) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24940], v27);
  }
  if (self->_enableMixingMediaAudio) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24908], v27);
  }
  int v32 = AirPlayReceiverServerCreate();
  if (v32)
  {
    int v14 = v32;
    if (gLogCategory_AirPlayReceiverKit > 90
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_92;
    }
  }
  else
  {
    if (self->_assistedModeEnabled) {
      [(APRKStreamRenderingManager *)self _setRandomPassword];
    }
    v33 = AirPlayReceiverServerGetDispatchQueue();
    int v14 = CFObjectControlSync();

    if (!v14)
    {
      if (self->_preemptionPolicy) {
        AirPlayReceiverServerSetProperty();
      }
      if (self->_forcePermissionDialog)
      {
        if (gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        AirPlayReceiverServerSetProperty();
      }
      if (gLogCategory_AirPlayReceiverKit <= 50
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      int v14 = 0;
      goto LABEL_93;
    }
    if (gLogCategory_AirPlayReceiverKit > 90
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_92;
    }
  }
  LogPrintF();
LABEL_92:
  APSLogErrorAt();
LABEL_93:
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v16) {
    CFRelease(v16);
  }
  return v14;
}

uint64_t __73__APRKStreamRenderingManager__startReceiverServerWithSupportedModesMask___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_queue_create("APRKAlternateBonjourBrowsingDisabledNotificationQueue", 0);
  id v3 = (void *)_startReceiverServerWithSupportedModesMask__notificationQueue;
  _startReceiverServerWithSupportedModesMask__notificationQueue = (uint64_t)v2;

  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __73__APRKStreamRenderingManager__startReceiverServerWithSupportedModesMask___block_invoke_2;
  handler[3] = &unk_264EA2130;
  handler[4] = *(void *)(a1 + 32);
  return notify_register_dispatch("com.apple.airplay.alternatebonjourbrowsingdisabled", &_startReceiverServerWithSupportedModesMask__notifyOnceToken, (dispatch_queue_t)_startReceiverServerWithSupportedModesMask__notificationQueue, handler);
}

void __73__APRKStreamRenderingManager__startReceiverServerWithSupportedModesMask___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    dispatch_queue_t v2 = "com.apple.airplay.alternatebonjourbrowsingdisabled";
    id v3 = @"APRKAlternateBonjourBrowsingDisabled";
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v2, v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"APRKAlternateBonjourBrowsingDisabled" object:*(void *)(a1 + 32)];
}

- (id)_rendererForUniqueIDInternal:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  CFAllocatorRef v15 = __Block_byref_object_copy__1;
  CFNumberRef v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  renderersArray = self->_renderersArray;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__APRKStreamRenderingManager__rendererForUniqueIDInternal___block_invoke;
  v9[3] = &unk_264EA2158;
  id v6 = v4;
  id v10 = v6;
  double v11 = &v12;
  [(NSMutableArray *)renderersArray enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __59__APRKStreamRenderingManager__rendererForUniqueIDInternal___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 uniqueID];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_setPTPClockEnabled:(BOOL)a3
{
  if (self->_server)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    AirPlayReceiverServerSetProperty();
  }
}

- (CGSize)_customDisplaySizeFromPrefsWithDefault:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int IntWithDefault = APSSettingsGetIntWithDefault();
  int v6 = APSSettingsGetIntWithDefault();
  if (IntWithDefault > 0 || v6 >= 1)
  {
    int v8 = v6;
    if (v6 <= 0)
    {
      int v8 = (int)((double)IntWithDefault / 1.77777778);
    }
    else if (IntWithDefault <= 0)
    {
      int IntWithDefault = (int)((double)v6 * 1.77777778);
    }
    double width = (double)IntWithDefault;
    double height = (double)v8;
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  double v9 = width;
  double v10 = height;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)_customDisplaySizeMaxFromPrefsWithDefault:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int IntWithDefault = APSSettingsGetIntWithDefault();
  int v6 = APSSettingsGetIntWithDefault();
  if (IntWithDefault > 0 || v6 >= 1)
  {
    int v8 = v6;
    if (v6 <= 0)
    {
      int v8 = (int)((double)IntWithDefault / 1.77777778);
    }
    else if (IntWithDefault <= 0)
    {
      int IntWithDefault = (int)((double)v6 * 1.77777778);
    }
    double width = (double)IntWithDefault;
    double height = (double)v8;
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  double v9 = width;
  double v10 = height;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (unint64_t)_customDisplayHDRModeFromPrefsWithDefault:(unint64_t)a3
{
  CFStringGetTypeID();
  double v5 = (const void *)APSSettingsCopyValueEx();
  if (v5)
  {
    int v6 = v5;
    if (CFEqual(v5, (CFTypeRef)*MEMORY[0x263F12528]))
    {
      a3 = 1;
    }
    else if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F12520]))
    {
      a3 = 2;
    }
    else if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F12518]))
    {
      a3 = 3;
    }
    else
    {
      if (gLogCategory_AirPlayReceiverKit <= 90
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      a3 = 0;
    }
    CFRelease(v6);
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    if (a3) {
      [(APRKStreamRenderingManager *)self _getHDRModeString:a3];
    }
    LogPrintF();
  }
  return a3;
}

- (void)_initPermittedClients
{
  if (!self->_permittedClients)
  {
    id v3 = [MEMORY[0x263EFF9A0] dictionary];
    permittedClients = self->_permittedClients;
    self->_permittedClients = v3;

    double v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_permittedClientsQueue);
    permissionGrantTimer = self->_permissionGrantTimer;
    self->_permissionGrantTimer = v5;

    id v7 = self->_permissionGrantTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __51__APRKStreamRenderingManager__initPermittedClients__block_invoke;
    handler[3] = &unk_264EA1AE8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_permissionGrantTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume((dispatch_object_t)self->_permissionGrantTimer);
  }
}

uint64_t __51__APRKStreamRenderingManager__initPermittedClients__block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatch_queue_t v2 = *(void **)(*(void *)(a1 + 32) + 112);
  return [v2 removeAllObjects];
}

- (BOOL)_isPermittedClient:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  BOOL v6 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  if (!self->_forcePermissionDialog && v4 != 0)
  {
    permittedClientsQueue = self->_permittedClientsQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__APRKStreamRenderingManager__isPermittedClient___block_invoke;
    block[3] = &unk_264EA2180;
    block[4] = self;
    id v11 = v4;
    uint64_t v12 = &v13;
    dispatch_sync(permittedClientsQueue, block);

    BOOL v6 = *((unsigned char *)v14 + 24) != 0;
  }
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __49__APRKStreamRenderingManager__isPermittedClient___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _initPermittedClients];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 112) objectForKey:*(void *)(a1 + 40)];
  if (v5)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [v5 doubleValue];
    uint64_t v4 = *(void *)(a1 + 32);
    if (Current - v3 <= (double)*(uint64_t *)(v4 + 104)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else {
      [*(id *)(v4 + 112) removeObjectForKey:*(void *)(a1 + 40)];
    }
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_addPermittedClient:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    permittedClientsQueue = self->_permittedClientsQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__APRKStreamRenderingManager__addPermittedClient___block_invoke;
    v7[3] = &unk_264EA1B88;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(permittedClientsQueue, v7);
  }
}

void __50__APRKStreamRenderingManager__addPermittedClient___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _initPermittedClients];
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatch_queue_t v2 = *(void **)(*(void *)(a1 + 32) + 112);
  double v3 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 128);
  dispatch_time_t v6 = dispatch_time(0, 1000000000 * *(void *)(v4 + 104));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)_setRandomPassword
{
  if (self->_server)
  {
    double v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    passwordString = self->_passwordString;
    self->_passwordString = v4;

    if (AirPlayReceiverServerSetProperty())
    {
      if (gLogCategory_AirPlayReceiverKit <= 90
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
LABEL_8:
        LogPrintF();
      }
    }
    else if (gLogCategory_AirPlayReceiverKit <= 30 {
           && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    }
    {
      goto LABEL_8;
    }
  }
}

- (APRKStreamRenderingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APRKStreamRenderingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)supportedModesMask
{
  return self->_supportedModesMask;
}

- (unint64_t)maxNumberOfConcurrentSessions
{
  return self->_maxNumberOfConcurrentSessions;
}

- (unint64_t)concurrentPlaybackPolicy
{
  return self->_concurrentPlaybackPolicy;
}

- (void)setConcurrentPlaybackPolicy:(unint64_t)a3
{
  self->_unint64_t concurrentPlaybackPolicy = a3;
}

- (BOOL)supportRemoteControl
{
  return self->_supportRemoteControl;
}

- (void)setSupportRemoteControl:(BOOL)a3
{
  self->_supportRemoteControl = a3;
}

- (unint64_t)preemptionPolicy
{
  return self->_preemptionPolicy;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_awdlActivator, 0);
  objc_storeStrong((id *)&self->_passwordString, 0);
  objc_storeStrong((id *)&self->_permissionGrantTimer, 0);
  objc_storeStrong((id *)&self->_permittedClientsQueue, 0);
  objc_storeStrong((id *)&self->_permittedClients, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_renderersArray, 0);
}

@end