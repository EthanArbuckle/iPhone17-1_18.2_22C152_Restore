@interface APBonjourCacheManager
- (APBonjourCacheManager)init;
- (BOOL)_writeCachedItems:(id)a3;
- (BOOL)deviceLost:(id)a3;
- (NSString)label;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (id)_getCacheDirectoryURLCreateIfNecessary:(BOOL)a3 error:(id *)a4;
- (id)_getCacheFileURLCreateIfNecessary:(BOOL)a3 error:(id *)a4;
- (id)_readCachedItems;
- (id)invalidationHandler;
- (id)reportDeviceFoundHandler;
- (id)reportDeviceLostHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_addDeviceToCache:(id)a3 pairedPeerInfo:(id)a4 event:(int64_t)a5;
- (void)_auditCachesIfNecessary:(id)a3 event:(int64_t)a4;
- (void)_cancelRetryGetPairedPeers;
- (void)_deviceFound:(id)a3 altPairedInfo:(id)a4 recheck:(BOOL)a5 event:(int64_t)a6;
- (void)_ensureKnownNetworkProfileMonitoringStarted;
- (void)_flushCachedItems;
- (void)_handleKnownNetworkProfileUpdate:(BOOL)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_migrateCacheDirectoryIfNecessary;
- (void)_networkSignatureChanged;
- (void)_pairedPeersChanged;
- (void)_recheckDevices:(int64_t)a3;
- (void)_refreshCachedItems;
- (void)_refreshOrRemoveCachedItem:(id)a3;
- (void)_removeIfDuplicatesFoundOrIfNoLongerCacheable:(unint64_t)a3 identifier:(id)a4 serialNumber:(id)a5 manufacturer:(id)a6 isCacheable:(BOOL)a7;
- (void)_replaceIfnameFromDNSString:(id)a3;
- (void)_reportCachedItemLost:(id)a3 event:(int64_t)a4;
- (void)_reportCachedItemsFound:(int64_t)a3;
- (void)_reportCachedItemsLost:(int64_t)a3;
- (void)_sanitizeDNSStrings:(id)a3;
- (void)_startRetryGetPairedPeersTimer;
- (void)_updateCachedDeviceInfoWhenRealDeviceIsFound:(id)a3 event:(int64_t)a4;
- (void)_updateLastSeenTimestamp:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)cacheHKPeerIfNeeded:(id)a3 pairedPeerInfo:(id)a4;
- (void)dealloc;
- (void)deviceFound:(id)a3;
- (void)forceReportCachedDevices;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setReportDeviceFoundHandler:(id)a3;
- (void)setReportDeviceLostHandler:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation APBonjourCacheManager

- (void)forceReportCachedDevices
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__APBonjourCacheManager_forceReportCachedDevices__block_invoke;
  block[3] = &unk_1E688C900;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_reportCachedItemsFound:(int64_t)a3
{
  if (self->_isPublicAirPlayNetwork)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    cachedItems = self->_cachedItems;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__APBonjourCacheManager__reportCachedItemsFound___block_invoke;
    v6[3] = &unk_1E688CA40;
    v6[4] = self;
    v6[5] = a3;
    [(NSMutableDictionary *)cachedItems enumerateKeysAndObjectsUsingBlock:v6];
  }
}

uint64_t __49__APBonjourCacheManager_forceReportCachedDevices__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(result + 104);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), uint64_t result = *(void *)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t result = *(void *)(a1 + 32);
    }
  }
  if (*(void *)(result + 96))
  {
    return [(id)result _reportCachedItemsFound:5];
  }
  return result;
}

- (APBonjourCacheManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  *(_OWORD *)label = 0u;
  long long v12 = 0u;
  v10.receiver = self;
  v10.super_class = (Class)APBonjourCacheManager;
  v2 = [(APBonjourCacheManager *)&v10 init];
  int v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_pairedPeersChangedToken = -1;
    v3->_ucat = (LogCategory *)&gLogCategory_APBonjourCache;
    SNPrintF();
    dispatch_queue_t v4 = dispatch_queue_create(label, 0);
    coreWiFiQueue = v3->_coreWiFiQueue;
    v3->_coreWiFiQueue = (OS_dispatch_queue *)v4;

    if (v3->_coreWiFiQueue
      && (uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F5E318]), "initWithServiceType:", 2, v3),
          coreWiFiInterface = v3->_coreWiFiInterface,
          v3->_coreWiFiInterface = (CWFInterface *)v6,
          coreWiFiInterface,
          (v8 = v3->_coreWiFiInterface) != 0))
    {
      [(CWFInterface *)v8 activate];
      v3->_auditCaches = APSSettingsGetInt64() != 0;
      [(APBonjourCacheManager *)v3 _migrateCacheDirectoryIfNecessary];
    }
    else
    {
      APSLogErrorAt();

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)APBonjourCacheManager;
  [(APBonjourCacheManager *)&v4 dealloc];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__APBonjourCacheManager_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E688C8D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __48__APBonjourCacheManager_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  [(APBonjourCacheManager *)self _ensureKnownNetworkProfileMonitoringStarted];
  if (!self->_systemMonitor)
  {
    v5 = (CUSystemMonitor *)objc_alloc_init(MEMORY[0x1E4F5E1F0]);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v5;

    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__APBonjourCacheManager__activateWithCompletion___block_invoke;
    v14[3] = &unk_1E688C900;
    v14[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setPrimaryNetworkChangedHandler:v14];
    v7 = self->_systemMonitor;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__APBonjourCacheManager__activateWithCompletion___block_invoke_2;
    v13[3] = &unk_1E688C900;
    v13[4] = self;
    [(CUSystemMonitor *)v7 activateWithCompletion:v13];
  }
  if (self->_pairedPeersChangedToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __49__APBonjourCacheManager__activateWithCompletion___block_invoke_3;
    handler[3] = &unk_1E688C928;
    handler[4] = self;
    notify_register_dispatch("com.apple.pairing.peerChanged", &self->_pairedPeersChangedToken, dispatchQueue, handler);
    [(APBonjourCacheManager *)self _pairedPeersChanged];
  }
  if (!self->_writeCoaleser)
  {
    v9 = (CUCoalescer *)objc_alloc_init(MEMORY[0x1E4F5E0F8]);
    writeCoaleser = self->_writeCoaleser;
    self->_writeCoaleser = v9;

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__APBonjourCacheManager__activateWithCompletion___block_invoke_4;
    v11[3] = &unk_1E688C900;
    v11[4] = self;
    [(CUCoalescer *)self->_writeCoaleser setActionHandler:v11];
    [(CUCoalescer *)self->_writeCoaleser setDispatchQueue:self->_dispatchQueue];
    [(CUCoalescer *)self->_writeCoaleser setMinDelay:5.0];
    [(CUCoalescer *)self->_writeCoaleser setMaxDelay:300.0];
    if (!v4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v4) {
LABEL_7:
  }
    v4[2](v4, 0);
LABEL_8:
}

uint64_t __49__APBonjourCacheManager__activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkSignatureChanged];
}

uint64_t __49__APBonjourCacheManager__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkSignatureChanged];
}

uint64_t __49__APBonjourCacheManager__activateWithCompletion___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(_DWORD *)(v1 + 40) != -1)
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 104);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 32), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 32);
      }
    }
    return [(id)v1 _pairedPeersChanged];
  }
  return result;
}

uint64_t __49__APBonjourCacheManager__activateWithCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushCachedItems];
}

- (void)_handleKnownNetworkProfileUpdate:(BOOL)a3
{
  BOOL isPublicAirPlayNetwork = self->_isPublicAirPlayNetwork;
  if (isPublicAirPlayNetwork == a3) {
    return;
  }
  BOOL v4 = a3;
  int var0 = self->_ucat->var0;
  if (var0 <= 30)
  {
    if (var0 != -1)
    {
LABEL_4:
      v7 = "yes";
      if (isPublicAirPlayNetwork) {
        id v8 = "yes";
      }
      else {
        id v8 = "no";
      }
      if (!v4) {
        v7 = "no";
      }
      v9 = v8;
      objc_super v10 = v7;
      LogPrintF();
      goto LABEL_11;
    }
    if (_LogCategory_Initialize())
    {
      BOOL isPublicAirPlayNetwork = self->_isPublicAirPlayNetwork;
      goto LABEL_4;
    }
  }
LABEL_11:
  self->_BOOL isPublicAirPlayNetwork = v4;
  -[APBonjourCacheManager _auditCachesIfNecessary:event:](self, "_auditCachesIfNecessary:event:", 0, 9, v9, v10);
  if (self->_isPublicAirPlayNetwork)
  {
    [(APBonjourCacheManager *)self _reportCachedItemsLost:9];
  }
  else
  {
    [(APBonjourCacheManager *)self _reportCachedItemsFound:9];
  }
}

- (void)_ensureKnownNetworkProfileMonitoringStarted
{
  objc_initWeak(&location, self);
  if (!self->_isMonitoringKnownNetworkProfile)
  {
    self->_isMonitoringKnownNetworkProfile = 1;
    coreWiFiQueue = self->_coreWiFiQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke;
    v4[3] = &unk_1E688C9C8;
    objc_copyWeak(&v5, &location);
    dispatch_async(coreWiFiQueue, v4);
    objc_destroyWeak(&v5);
  }
  objc_destroyWeak(&location);
}

void __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = (void *)WeakRetained[14];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke_2;
    v15[3] = &unk_1E688C978;
    objc_copyWeak(&v16, v1);
    [v4 setEventHandler:v15];
    id v5 = (void *)*((void *)v3 + 14);
    id v14 = 0;
    [v5 startMonitoringEventType:30 error:&v14];
    id v6 = v14;
    v7 = [*((id *)v3 + 14) currentKnownNetworkProfile];
    LOBYTE(v4) = [v7 isPublicAirPlayNetwork];

    id v8 = *((void *)v3 + 17);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke_4;
    block[3] = &unk_1E688C9A0;
    id v9 = v6;
    id v11 = v9;
    id v12 = v3;
    char v13 = (char)v4;
    dispatch_sync(v8, block);

    objc_destroyWeak(&v16);
  }
  else
  {
    id v9 = 0;
  }
}

void __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [v3 type] == 30)
  {
    id v5 = [*((id *)WeakRetained + 14) currentKnownNetworkProfile];
    char v6 = [v5 isPublicAirPlayNetwork];

    v7 = *((void *)WeakRetained + 17);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke_3;
    v8[3] = &unk_1E688C950;
    id v9 = WeakRetained;
    char v10 = v6;
    dispatch_sync(v7, v8);
  }
}

uint64_t __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleKnownNetworkProfileUpdate:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 128) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v2 = 0;
  }
  if (v2) {
    int v3 = 90;
  }
  else {
    int v3 = 30;
  }
  BOOL v4 = *(_DWORD ***)(a1 + 40);
  int v5 = *v4[13];
  if (v3 >= v5)
  {
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), BOOL v4 = *(_DWORD ***)(a1 + 40), v6))
    {
      LogPrintF();
      BOOL v4 = *(_DWORD ***)(a1 + 40);
    }
  }
  uint64_t v7 = *(unsigned __int8 *)(a1 + 48);
  return [v4 _handleKnownNetworkProfileUpdate:v7];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__APBonjourCacheManager_invalidate__block_invoke;
  block[3] = &unk_1E688C900;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__APBonjourCacheManager_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      int v5 = retryTimer;
      dispatch_source_cancel(v5);
      int v6 = self->_retryTimer;
      self->_retryTimer = 0;
    }
    if (self->_cacheChanged)
    {
      [(APBonjourCacheManager *)self _flushCachedItems];
      self->_cacheChanged = 0;
    }
    int pairedPeersChangedToken = self->_pairedPeersChangedToken;
    if (pairedPeersChangedToken != -1)
    {
      notify_cancel(pairedPeersChangedToken);
      self->_int pairedPeersChangedToken = -1;
    }
    [(CUCoalescer *)self->_writeCoaleser invalidate];
    writeCoaleser = self->_writeCoaleser;
    self->_writeCoaleser = 0;

    [(CUSystemMonitor *)self->_systemMonitor invalidate];
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    [(CWFInterface *)self->_coreWiFiInterface invalidate];
    coreWiFiInterface = self->_coreWiFiInterface;
    self->_coreWiFiInterface = 0;

    coreWiFiQueue = self->_coreWiFiQueue;
    if (coreWiFiQueue)
    {
      self->_coreWiFiQueue = 0;
    }
    [(APBonjourCacheManager *)self _invalidated];
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, a2);
      id v4 = self->_invalidationHandler;
    }
    else
    {
      id v4 = 0;
    }
    self->_invalidationHandler = 0;

    id reportDeviceFoundHandler = self->_reportDeviceFoundHandler;
    self->_id reportDeviceFoundHandler = 0;

    id reportDeviceLostHandler = self->_reportDeviceLostHandler;
    self->_id reportDeviceLostHandler = 0;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)deviceFound:(id)a3
{
}

- (void)_deviceFound:(id)a3 altPairedInfo:(id)a4 recheck:(BOOL)a5 event:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t DeviceID = BonjourDevice_GetDeviceID();
  char v13 = [v10 objectForKeyedSubscript:@"name"];
  uint64_t v14 = BonjourDevice_CopyCFString();
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    id v16 = (const void *)APSFeaturesCreateFromStringRepresentation();
  }
  else
  {
    BonjourDevice_GetInt64();
    id v16 = (const void *)APSFeaturesCreateFromLegacyFlags();
    APSFeaturesCopyStringRepresentation();
    uint64_t v15 = 0;
  }
  if (APSFeaturesHasFeature())
  {
    BOOL v17 = APSFeaturesHasFeature() != 0;
    if (!v16) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v17 = 0;
  if (v16) {
LABEL_6:
  }
    CFRelease(v16);
LABEL_7:
  v18 = (void *)BonjourDevice_CopyCFString();
  if (v18)
  {
    int64_t v51 = a6;
    if (v7 || !v17) {
      goto LABEL_14;
    }
    uint64_t v19 = DeviceID;
    id v20 = v11;
    v21 = [(CUSystemMonitor *)self->_systemMonitor primaryNetworkSignature];

    if (v21)
    {
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v24 = self->_deviceMap;
        self->_deviceMap = v23;

        deviceMap = self->_deviceMap;
      }
      [(NSMutableDictionary *)deviceMap setObject:v10 forKeyedSubscript:v18];
      id v11 = v20;
      uint64_t DeviceID = v19;
LABEL_14:
      v25 = (void *)BonjourDevice_CopyCFString();
      v52 = (void *)BonjourDevice_CopyCFString();
      -[APBonjourCacheManager _removeIfDuplicatesFoundOrIfNoLongerCacheable:identifier:serialNumber:manufacturer:isCacheable:](self, "_removeIfDuplicatesFoundOrIfNoLongerCacheable:identifier:serialNumber:manufacturer:isCacheable:", DeviceID, v18, v25);
      if (!v17)
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        goto LABEL_51;
      }
      BOOL v48 = v7;
      v49 = v25;
      id v26 = [(NSMutableDictionary *)self->_pairedPeersMap objectForKeyedSubscript:v18];
      if (!v26) {
        id v26 = v11;
      }
      uint64_t v27 = DeviceID;
      v28 = [(NSMutableDictionary *)self->_cachedItems objectForKeyedSubscript:v18];
      v50 = v28;
      if (v28)
      {
        [v28 objectForKeyedSubscript:@"HKPeer"];
        v29 = v13;
        v31 = id v30 = v11;
        BOOL v32 = CFGetInt64() == 0;

        id v11 = v30;
        char v13 = v29;
      }
      else
      {
        BOOL v32 = 1;
      }
      int v36 = (BonjourDevice_GetInt64() & 0x400) == 0 || v32;
      v37 = v26;
      if (v26 || !v36)
      {
        if (v50)
        {
          [(APBonjourCacheManager *)self _updateCachedDeviceInfoWhenRealDeviceIsFound:v10 event:v51];
          goto LABEL_50;
        }
        if (CFAbsoluteTimeGetCurrent() - self->_networkSignatureWasValidAt >= 10.0)
        {
          if (v26)
          {
            [(APBonjourCacheManager *)self _auditCachesIfNecessary:v10 event:v51];
            int v40 = self->_ucat->var0;
            if (!self->_isPublicAirPlayNetwork)
            {
              if (v40 <= 30 && (v40 != -1 || _LogCategory_Initialize()))
              {
                v42 = "";
                if (v48) {
                  v42 = "(recheck)";
                }
                networkSignature = self->_networkSignature;
                v47 = v42;
                uint64_t v43 = v27;
                v44 = v13;
                LogPrintF();
              }
              v37 = v26;
              -[APBonjourCacheManager _addDeviceToCache:pairedPeerInfo:event:](self, "_addDeviceToCache:pairedPeerInfo:event:", v10, v26, v51, v43, v44, networkSignature, v47);
              goto LABEL_50;
            }
            v37 = v26;
            if (v40 > 30 || v40 == -1 && !_LogCategory_Initialize())
            {
LABEL_50:

              v25 = v49;
LABEL_51:

              goto LABEL_52;
            }
          }
          else
          {
            int v41 = self->_ucat->var0;
            if (v41 > 30 || v41 == -1 && !_LogCategory_Initialize()) {
              goto LABEL_50;
            }
          }
        }
        else
        {
          int v39 = self->_ucat->var0;
          if (v39 > 30 || v39 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_50;
          }
        }
      }
      else
      {
        int v38 = self->_ucat->var0;
        if (v38 > 30 || v38 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_50;
        }
      }
      LogPrintF();
      goto LABEL_50;
    }
    int v35 = self->_ucat->var0;
    id v11 = v20;
    if (v35 <= 30 && (v35 != -1 || _LogCategory_Initialize()))
    {
      v46 = [(CUSystemMonitor *)self->_systemMonitor primaryNetworkSignature];
      LogPrintF();

      id v11 = v20;
    }
  }
  else
  {
    int v33 = self->_ucat->var0;
    if (v33 <= 90 && (v33 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_52:
}

- (void)_auditCachesIfNecessary:(id)a3 event:(int64_t)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  if (!self->_auditCaches)
  {
    char v13 = 0;
    id v17 = 0;
    id v11 = 0;
    goto LABEL_59;
  }
  double v8 = Current;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    if ((unint64_t)(a4 - 1) > 8) {
      id v10 = "Unknown";
    }
    else {
      id v10 = off_1E688CA88[a4 - 1];
    }
    id v12 = "yes";
    if (!v6) {
      id v12 = "no";
    }
    int v39 = v10;
    int v41 = v12;
    LogPrintF();
    if (v6) {
      goto LABEL_8;
    }
  }
  else if (v6)
  {
LABEL_8:
    id v11 = (void *)BonjourDevice_CopyCFString();
    if (v11)
    {
      uint64_t DeviceID = BonjourDevice_GetDeviceID();
      goto LABEL_15;
    }
    APSLogErrorAt();
    char v13 = 0;
    id v17 = 0;
LABEL_59:
    id v18 = 0;
    goto LABEL_55;
  }
  id v11 = 0;
  uint64_t DeviceID = 0;
LABEL_15:
  id v58 = 0;
  char v13 = -[APBonjourCacheManager _getCacheDirectoryURLCreateIfNecessary:error:](self, "_getCacheDirectoryURLCreateIfNecessary:error:", 0, &v58, v39, v41);
  id v14 = v58;
  if (NSErrorToOSStatus())
  {
    id v17 = 0;
    id v18 = v14;
    goto LABEL_55;
  }
  uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = [v13 path];
  id v57 = v14;
  id v17 = [v15 contentsOfDirectoryAtPath:v16 error:&v57];
  id v18 = v57;

  if (!NSErrorToOSStatus())
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v17 = v17;
    uint64_t v51 = [v17 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (!v51)
    {

      goto LABEL_55;
    }
    id v46 = v18;
    id obj = v17;
    int v52 = 0;
    v49 = v13;
    uint64_t v50 = *(void *)v54;
    while (1)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v54 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v53 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1E4F1C9E8];
        v22 = objc_msgSend(v13, "path", v40, *(void *)&v42, *(void *)&v43, *(void *)&v44, v45);
        v23 = [v22 stringByAppendingPathComponent:v20];
        v24 = [v21 dictionaryWithContentsOfFile:v23];

        if (!v24)
        {
          APSLogErrorAt();
          v29 = 0;
          id v30 = 0;
          double v25 = 0.0;
          goto LABEL_39;
        }
        double v25 = [v24 objectForKeyedSubscript:@"networkSignature"];
        int v26 = [*(id *)&v25 isEqualToString:self->_networkSignature];
        if (v26)
        {
          if (self->_isPublicAirPlayNetwork)
          {
            int v27 = self->_ucat->var0;
            if (v27 <= 60 && (v27 != -1 || _LogCategory_Initialize()))
            {
              uint64_t v40 = v20;
              double v42 = v25;
              LogPrintF();
            }
          }
        }
        if (!v11)
        {
          v29 = 0;
LABEL_44:
          id v30 = 0;
          goto LABEL_39;
        }
        CFDictionaryGetTypeID();
        v28 = CFDictionaryGetTypedValue();
        v29 = v28;
        if (!v28)
        {
          APSLogErrorAt();
          goto LABEL_44;
        }
        id v30 = [v28 objectForKeyedSubscript:v11];
        if (v30)
        {
          CFDictionaryGetDouble();
          double v32 = v31;
          CFDictionaryGetDouble();
          v52 += v26 ^ 1;
          int v34 = self->_ucat->var0;
          if (v34 <= 30)
          {
            double v35 = v33;
            if (v34 != -1 || _LogCategory_Initialize())
            {
              int v36 = "Other";
              if (v26) {
                int v36 = "Current";
              }
              double v42 = v8 - v32;
              double v43 = v8 - v35;
              uint64_t v40 = DeviceID;
              double v44 = v25;
              v45 = v36;
              LogPrintF();
            }
          }
        }
LABEL_39:

        ++v19;
        char v13 = v49;
      }
      while (v51 != v19);
      id v17 = obj;
      uint64_t v37 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
      uint64_t v51 = v37;
      if (!v37)
      {

        if (v52)
        {
          int v38 = self->_ucat->var0;
          id v18 = v46;
          if (v38 <= 90 && (v38 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
        }
        else
        {
          id v18 = v46;
        }
        break;
      }
    }
  }
LABEL_55:
}

- (BOOL)deviceLost:(id)a3
{
  id v4 = a3;
  int v5 = (void *)BonjourDevice_CopyCFString();
  if (!v5)
  {
    BonjourDevice_GetDeviceID();
    id v6 = [v4 objectForKeyedSubscript:@"name"];
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_11;
  }
  [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v5];
  [(NSMutableSet *)self->_removedItems removeObject:v5];
  id v6 = (void (**)(void, void, void))_Block_copy(self->_reportDeviceFoundHandler);
  if (!v6)
  {
LABEL_11:
    BOOL v8 = 0;
    goto LABEL_15;
  }
  BOOL v7 = [(NSMutableDictionary *)self->_cachedItems objectForKeyedSubscript:v5];
  BOOL v8 = v7 != 0;
  if (v7)
  {
    BonjourDevice_GetDeviceID();
    id v9 = [v7 objectForKeyedSubscript:@"name"];
    int v10 = self->_ucat->var0;
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    ((void (**)(void, void *, uint64_t))v6)[2](v6, v7, 2);
  }
LABEL_15:

  return v8;
}

- (void)cacheHKPeerIfNeeded:(id)a3 pairedPeerInfo:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t DeviceID = BonjourDevice_GetDeviceID();
  int var0 = self->_ucat->var0;
  if (var0 <= 30)
  {
    uint64_t v9 = DeviceID;
    int v10 = v13;
    if (var0 != -1)
    {
LABEL_3:
      [v10 objectForKeyedSubscript:@"name"];
      id v12 = v11 = v9;
      LogPrintF();

      goto LABEL_5;
    }
    if (_LogCategory_Initialize())
    {
      int v10 = v13;
      goto LABEL_3;
    }
  }
LABEL_5:
  -[APBonjourCacheManager _deviceFound:altPairedInfo:recheck:event:](self, "_deviceFound:altPairedInfo:recheck:event:", v13, v6, 1, 6, v11, v12);
}

- (void)_refreshOrRemoveCachedItem:(id)a3
{
  id v15 = a3;
  CFDictionaryGetDouble();
  double v5 = CFAbsoluteTimeGetCurrent() - v4;
  if (v5 >= 864000.0)
  {
    id v6 = (void *)BonjourDevice_CopyCFString();
    if (v6)
    {
      [(NSMutableDictionary *)self->_cachedItems setObject:0 forKeyedSubscript:v6];
      [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v6];
      [(NSMutableSet *)self->_removedItems removeObject:v6];
      self->_cacheChanged = 1;
      uint64_t DeviceID = BonjourDevice_GetDeviceID();
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && ((uint64_t v9 = DeviceID, var0 != -1) || _LogCategory_Initialize()))
      {
        id v13 = [v15 objectForKeyedSubscript:@"name"];
        LogPrintF();

        [(CUCoalescer *)self->_writeCoaleser trigger];
      }
      else
      {
        [(CUCoalescer *)self->_writeCoaleser trigger];
      }
    }
    else
    {
      int v10 = self->_ucat->var0;
      if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

- (void)_removeIfDuplicatesFoundOrIfNoLongerCacheable:(unint64_t)a3 identifier:(id)a4 serialNumber:(id)a5 manufacturer:(id)a6 isCacheable:(BOOL)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  cachedItems = self->_cachedItems;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __120__APBonjourCacheManager__removeIfDuplicatesFoundOrIfNoLongerCacheable_identifier_serialNumber_manufacturer_isCacheable___block_invoke;
  v19[3] = &unk_1E688C9F0;
  v23 = self;
  unint64_t v24 = a3;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  BOOL v25 = a7;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  [(NSMutableDictionary *)cachedItems enumerateKeysAndObjectsUsingBlock:v19];
}

void __120__APBonjourCacheManager__removeIfDuplicatesFoundOrIfNoLongerCacheable_identifier_serialNumber_manufacturer_isCacheable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  uint64_t DeviceID = BonjourDevice_GetDeviceID();
  if (!v17 || ![v17 caseInsensitiveCompare:*(void *)(a1 + 32)])
  {
    if (*(unsigned char *)(a1 + 72)) {
      goto LABEL_25;
    }
    int v11 = **(_DWORD **)(*(void *)(a1 + 56) + 104);
    if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = DeviceID;
      LogPrintF();
    }
    uint64_t v12 = 8;
    goto LABEL_23;
  }
  BOOL v7 = (void *)BonjourDevice_CopyCFString();
  uint64_t v8 = BonjourDevice_CopyCFString();
  uint64_t v9 = (void *)v8;
  if (DeviceID != *(void *)(a1 + 64)
    && (!*(void *)(a1 + 40)
     || !v7
     || !*(void *)(a1 + 48)
     || !v8
     || objc_msgSend(v7, "compare:")
     || [v9 caseInsensitiveCompare:*(void *)(a1 + 48)]))
  {

    goto LABEL_25;
  }
  int v10 = **(_DWORD **)(*(void *)(a1 + 56) + 104);
  if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
  {
    id v15 = [v5 objectForKeyedSubscript:@"name"];
    id v16 = v9;
    uint64_t v14 = DeviceID;
    LogPrintF();
  }
  uint64_t v13 = *(void *)(a1 + 64);

  if (DeviceID != v13)
  {
    uint64_t v12 = 7;
LABEL_23:
    objc_msgSend(*(id *)(a1 + 56), "_reportCachedItemLost:event:", v5, v12, v14, v15, v16);
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 56) + 16), "setObject:forKeyedSubscript:", 0, v17, v14);
  [*(id *)(*(void *)(a1 + 56) + 32) setObject:0 forKeyedSubscript:v17];
  [*(id *)(*(void *)(a1 + 56) + 24) removeObject:v17];
  *(unsigned char *)(*(void *)(a1 + 56) + 9) = 1;
  [*(id *)(*(void *)(a1 + 56) + 88) trigger];
LABEL_25:
}

- (void)_replaceIfnameFromDNSString:(id)a3
{
  id v6 = a3;
  int v3 = [v6 objectForKeyedSubscript:@"dnsName"];
  unint64_t v4 = [v3 rangeOfString:@"%"];
  if (v4 < [v3 length])
  {
    id v5 = [v3 substringToIndex:v4];
    [v6 setObject:v5 forKey:@"dnsName"];
  }
}

- (void)_sanitizeDNSStrings:(id)a3
{
  id v12 = a3;
  unint64_t v4 = [v12 objectForKeyedSubscript:@"services"];
  id v5 = (void *)[v4 mutableCopy];

  [(APBonjourCacheManager *)self _replaceIfnameFromDNSString:v12];
  if (v5)
  {
    uint64_t v6 = [v5 count];
    if (v6 >= 1)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      for (uint64_t i = 0; i != v7; ++i)
      {
        int v10 = v8;
        int v11 = [v5 objectAtIndexedSubscript:i];
        uint64_t v8 = (void *)[v11 mutableCopy];

        [(APBonjourCacheManager *)self _replaceIfnameFromDNSString:v8];
        [v5 replaceObjectAtIndex:i withObject:v8];
      }
    }
  }
  [v12 setObject:v5 forKey:@"services"];
}

- (void)_networkSignatureChanged
{
  if (!self->_systemMonitor) {
    return;
  }
  [(APBonjourCacheManager *)self _ensureKnownNetworkProfileMonitoringStarted];
  int v3 = [(CUSystemMonitor *)self->_systemMonitor primaryNetworkSignature];
  networkSignature = self->_networkSignature;
  id v15 = v3;
  id v5 = networkSignature;
  if (v15 != v5)
  {
    uint64_t v6 = v5;
    if ((v15 == 0) != (v5 != 0))
    {
      char v7 = [(NSString *)v15 isEqual:v5];

      if (v7) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 30)
    {
      uint64_t v9 = v15;
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_13;
        }
        uint64_t v9 = v15;
      }
      uint64_t v14 = v9;
      LogPrintF();
    }
LABEL_13:
    if (self->_networkSignature) {
      [(APBonjourCacheManager *)self _flushCachedItems];
    }
    -[APBonjourCacheManager _reportCachedItemsLost:](self, "_reportCachedItemsLost:", 3, v14);
    if ([(NSString *)v15 containsString:@"Cellular"])
    {
      int v10 = self->_ucat->var0;
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }

      int v11 = 0;
    }
    else
    {
      int v11 = v15;
    }
    id v15 = v11;
    objc_storeStrong((id *)&self->_networkSignature, v11);
    self->_networkSignatureWasValidAt = CFAbsoluteTimeGetCurrent();
    [(APBonjourCacheManager *)self _auditCachesIfNecessary:0 event:3];
    id v12 = [(APBonjourCacheManager *)self _readCachedItems];
    cachedItems = self->_cachedItems;
    self->_cachedItems = v12;

    [(APBonjourCacheManager *)self _refreshCachedItems];
    [(APBonjourCacheManager *)self _reportCachedItemsFound:3];
    [(APBonjourCacheManager *)self _recheckDevices:3];
    goto LABEL_23;
  }

LABEL_23:
}

- (void)_pairedPeersChanged
{
  if (!self->_pairedPeersGetting)
  {
    self->_pairedPeersGetting = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4F5E190]);
    [v4 setDispatchQueue:self->_dispatchQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__APBonjourCacheManager__pairedPeersChanged__block_invoke;
    v5[3] = &unk_1E688CA18;
    v5[4] = self;
    v5[5] = v4;
    [v4 getPairedPeersWithOptions:4 completion:v5];
  }
}

void __44__APBonjourCacheManager__pairedPeersChanged__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 44) = 0;
  [*(id *)(a1 + 40) invalidate];
  char v7 = *(_DWORD ***)(a1 + 32);
  if (v6)
  {
    int v8 = *v7[13];
    if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v21 = (uint64_t)v6;
      LogPrintF();
    }
    if (objc_msgSend(v6, "code", v21) == 4099 || objc_msgSend(v6, "code") == 4097) {
      [*(id *)(a1 + 32) _startRetryGetPairedPeersTimer];
    }
  }
  else
  {
    [v7 _cancelRetryGetPairedPeers];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v5;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v16 = [v15 identifier];
          id v17 = [v16 UUIDString];

          if (v17) {
            [v9 setObject:v15 forKeyedSubscript:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v9);
    id v18 = *(_DWORD ***)(a1 + 32);
    int v19 = *v18[13];
    if (v19 <= 30)
    {
      if (v19 != -1 || (int v20 = _LogCategory_Initialize(), v18 = *(_DWORD ***)(a1 + 32), v20))
      {
        uint64_t v21 = [v9 count];
        LogPrintF();
        id v18 = *(_DWORD ***)(a1 + 32);
      }
    }
    objc_msgSend(v18, "_recheckDevices:", 4, v21);

    id v5 = v22;
  }
}

- (void)_startRetryGetPairedPeersTimer
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    id v5 = retryTimer;
    dispatch_source_cancel(v5);
    id v6 = self->_retryTimer;
    self->_retryTimer = 0;
  }
  char v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  int v8 = self->_retryTimer;
  self->_retryTimer = v7;

  id v9 = self->_retryTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __55__APBonjourCacheManager__startRetryGetPairedPeersTimer__block_invoke;
  handler[3] = &unk_1E688C900;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  CUDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_retryTimer);
}

int *__55__APBonjourCacheManager__startRetryGetPairedPeersTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(int **)(v2 + 104);
  if (*result <= 30)
  {
    if (*result != -1 || (uint64_t result = (int *)_LogCategory_Initialize(), v2 = *(void *)(a1 + 32), result))
    {
      uint64_t result = (int *)LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  if (!*(unsigned char *)(v2 + 64))
  {
    id v4 = *(void **)(v2 + 56);
    if (v4)
    {
      id v5 = v4;
      dispatch_source_cancel(v5);
      uint64_t v6 = *(void *)(a1 + 32);
      char v7 = *(void **)(v6 + 56);
      *(void *)(v6 + 56) = 0;
    }
    int v8 = *(void **)(a1 + 32);
    return (int *)[v8 _pairedPeersChanged];
  }
  return result;
}

- (void)_cancelRetryGetPairedPeers
{
  if (self->_retryTimer)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      uint64_t v6 = retryTimer;
      dispatch_source_cancel(v6);
      id v5 = self->_retryTimer;
      self->_retryTimer = 0;
    }
  }
}

- (void)_recheckDevices:(int64_t)a3
{
  if (self->_networkSignature)
  {
    deviceMap = self->_deviceMap;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __41__APBonjourCacheManager__recheckDevices___block_invoke;
    v4[3] = &unk_1E688CA40;
    void v4[4] = self;
    v4[5] = a3;
    [(NSMutableDictionary *)deviceMap enumerateKeysAndObjectsUsingBlock:v4];
  }
}

void __41__APBonjourCacheManager__recheckDevices___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = (id)[a3 mutableCopy];
  [v4 _deviceFound:v5 altPairedInfo:0 recheck:1 event:*(void *)(a1 + 40)];
}

- (void)_refreshCachedItems
{
  cachedItems = self->_cachedItems;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__APBonjourCacheManager__refreshCachedItems__block_invoke;
  v3[3] = &unk_1E688CA68;
  v3[4] = self;
  [(NSMutableDictionary *)cachedItems enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __44__APBonjourCacheManager__refreshCachedItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshOrRemoveCachedItem:");
}

void __49__APBonjourCacheManager__reportCachedItemsFound___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = (void (**)(void *, id, void))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 160));
  if (v4)
  {
    BonjourDevice_GetDeviceID();
    id v5 = [v7 objectForKeyedSubscript:@"name"];
    int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 104);
    if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v4[2](v4, v7, *(void *)(a1 + 40));
  }
}

- (void)_reportCachedItemLost:(id)a3 event:(int64_t)a4
{
  id v9 = a3;
  int v6 = (void (**)(void *, void *, int64_t))_Block_copy(self->_reportDeviceLostHandler);
  if (v6)
  {
    id v7 = (void *)[v9 mutableCopy];
    int v8 = [v7 objectForKeyedSubscript:@"services"];
    [v7 removeObjectForKey:@"services"];
    [v7 setObject:v8 forKeyedSubscript:@"removedServices"];
    [v7 removeObjectForKey:@"cached"];
    [v7 removeObjectForKey:@"wakeArray"];
    [v7 removeObjectForKey:@"wakeAddr"];
    v6[2](v6, v7, a4);
  }
}

- (void)_reportCachedItemsLost:(int64_t)a3
{
  cachedItems = self->_cachedItems;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__APBonjourCacheManager__reportCachedItemsLost___block_invoke;
  v4[3] = &unk_1E688CA40;
  void v4[4] = self;
  v4[5] = a3;
  [(NSMutableDictionary *)cachedItems enumerateKeysAndObjectsUsingBlock:v4];
}

void __48__APBonjourCacheManager__reportCachedItemsLost___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v14 = a3;
  uint64_t DeviceID = BonjourDevice_GetDeviceID();
  id v5 = [v14 objectForKeyedSubscript:@"name"];
  int v6 = *(_DWORD ***)(a1 + 32);
  int v7 = *v6[13];
  if (v7 <= 30)
  {
    if (v7 != -1 || (v10 = _LogCategory_Initialize(), int v6 = *(_DWORD ***)(a1 + 32), v10))
    {
      unint64_t v8 = *(void *)(a1 + 40) - 1;
      if (v8 > 8) {
        id v9 = "Unknown";
      }
      else {
        id v9 = off_1E688CA88[v8];
      }
      uint64_t v12 = v5;
      uint64_t v13 = v9;
      uint64_t v11 = DeviceID;
      LogPrintF();
      int v6 = *(_DWORD ***)(a1 + 32);
    }
  }
  objc_msgSend(v6, "_reportCachedItemLost:event:", v14, *(void *)(a1 + 40), v11, v12, v13);
}

- (void)_updateLastSeenTimestamp:(id)a3
{
  id v14 = a3;
  id v4 = (void *)BonjourDevice_CopyCFString();
  if (v4)
  {
    if ([(NSMutableSet *)self->_removedItems containsObject:v4])
    {
      id v5 = [(NSMutableDictionary *)self->_cachedItems objectForKeyedSubscript:v4];
      int v6 = (void *)[v5 mutableCopy];

      int v7 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
      [v6 setObject:v7 forKeyedSubscript:@"lastSeen"];

      [(APBonjourCacheManager *)self _sanitizeDNSStrings:v6];
      [(NSMutableDictionary *)self->_cachedItems setObject:v6 forKeyedSubscript:v4];
      self->_cacheChanged = 1;
      uint64_t DeviceID = BonjourDevice_GetDeviceID();
      int var0 = self->_ucat->var0;
      if (var0 <= 30)
      {
        uint64_t v10 = DeviceID;
        if (var0 != -1 || _LogCategory_Initialize())
        {
          [v14 objectForKeyedSubscript:@"name"];
          v13 = uint64_t v12 = v10;
          LogPrintF();
        }
      }
      [(CUCoalescer *)self->_writeCoaleser trigger];
    }
  }
  else
  {
    int v11 = self->_ucat->var0;
    if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_updateCachedDeviceInfoWhenRealDeviceIsFound:(id)a3 event:(int64_t)a4
{
  id v34 = a3;
  uint64_t DeviceID = BonjourDevice_GetDeviceID();
  int v7 = (void *)BonjourDevice_CopyCFString();
  if (v7)
  {
    unint64_t v8 = [(NSMutableDictionary *)self->_cachedItems objectForKeyedSubscript:v7];
    id v9 = v8;
    if (!v8)
    {
LABEL_21:

      goto LABEL_22;
    }
    uint64_t v10 = [v8 objectForKeyedSubscript:@"name"];
    uint64_t v11 = BonjourDevice_GetDeviceID();
    uint64_t v12 = [v34 objectForKeyedSubscript:@"name"];
    if ([v10 isEqualToString:v12])
    {
      [v9 objectForKeyedSubscript:@"txt"];
      uint64_t v33 = DeviceID;
      uint64_t v13 = v10;
      int64_t v14 = a4;
      v16 = uint64_t v15 = v11;
      id v17 = [v34 objectForKeyedSubscript:@"txt"];
      char v18 = [v16 isEqual:v17];

      uint64_t v11 = v15;
      a4 = v14;
      uint64_t v10 = v13;
      uint64_t DeviceID = v33;

      if (v18)
      {
LABEL_12:
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v31 = v11;
          double v32 = v10;
          LogPrintF();
        }
        removedItems = self->_removedItems;
        if (!removedItems)
        {
          long long v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          int v27 = self->_removedItems;
          self->_removedItems = v26;

          removedItems = self->_removedItems;
        }
        -[NSMutableSet addObject:](removedItems, "addObject:", v7, v31, v32);
        [(APBonjourCacheManager *)self _updateLastSeenTimestamp:v34];
        uint64_t v28 = (void *)[v9 mutableCopy];
        [v28 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"cached"];
        v29 = _Block_copy(self->_reportDeviceFoundHandler);
        id v30 = v29;
        if (v29) {
          (*((void (**)(void *, void *, int64_t))v29 + 2))(v29, v28, a4);
        }

        goto LABEL_21;
      }
    }
    else
    {
    }
    int v19 = (void *)[v9 mutableCopy];
    int v20 = [v34 objectForKeyedSubscript:@"name"];
    [v19 setObject:v20 forKey:@"name"];

    uint64_t v21 = [v34 objectForKeyedSubscript:@"txt"];
    [v19 setObject:v21 forKey:@"txt"];

    id v22 = [v34 objectForKeyedSubscript:@"services"];
    [v19 setObject:v22 forKey:@"services"];

    [(APBonjourCacheManager *)self _sanitizeDNSStrings:v19];
    int v23 = self->_ucat->var0;
    if (v23 <= 30 && (v23 != -1 || _LogCategory_Initialize()))
    {
      [v34 objectForKeyedSubscript:@"name"];
      double v32 = v31 = DeviceID;
      LogPrintF();
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedItems, "setObject:forKeyedSubscript:", v19, v7, v31, v32);
    self->_cacheChanged = 1;
    [(CUCoalescer *)self->_writeCoaleser trigger];

    goto LABEL_12;
  }
LABEL_22:
}

- (void)_addDeviceToCache:(id)a3 pairedPeerInfo:(id)a4 event:(int64_t)a5
{
  id v18 = a3;
  id v8 = a4;
  if (!self->_cachedItems)
  {
    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedItems = self->_cachedItems;
    self->_cachedItems = v9;
  }
  uint64_t v11 = (void *)BonjourDevice_CopyCFString();
  if (v11)
  {
    uint64_t v12 = (void *)[v18 mutableCopy];
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"cached"];
    uint64_t v13 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
    [v12 setObject:v13 forKeyedSubscript:@"lastSeen"];

    [(APBonjourCacheManager *)self _sanitizeDNSStrings:v12];
    int64_t v14 = [v8 info];
    CFArrayGetTypeID();
    uint64_t v15 = CFDictionaryGetTypedValue();

    if (v15) {
      [v12 setObject:v15 forKeyedSubscript:@"wakeArray"];
    }
    id v16 = [v8 info];
    CFDataGetTypeID();
    id v17 = CFDictionaryGetTypedValue();

    if (v17) {
      [v12 setObject:v17 forKeyedSubscript:@"wakeAddr"];
    }
    if (a5 == 6) {
      [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HKPeer"];
    }
    [(NSMutableDictionary *)self->_cachedItems setObject:v12 forKeyedSubscript:v11];
    self->_cacheChanged = 1;
    [(CUCoalescer *)self->_writeCoaleser trigger];
  }
}

- (void)_flushCachedItems
{
  if (self->_cachedItems)
  {
    -[APBonjourCacheManager _writeCachedItems:](self, "_writeCachedItems:");
    self->_cacheChanged = 0;
  }
}

- (id)_getCacheDirectoryURLCreateIfNecessary:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  int v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v21 = 0;
  int v7 = [v6 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:v5 error:&v21];
  id v8 = v21;
  if (v8)
  {
    int64_t v14 = v8;
    APSLogErrorAt();
    uint64_t v10 = 0;
    goto LABEL_9;
  }
  id v9 = [v7 URLByAppendingPathComponent:@"com.apple.airplay/APBonjourCache" isDirectory:1];
  uint64_t v10 = v9;
  if (!v9)
  {
    APSLogErrorAt();
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28760];
    uint64_t v17 = -6728;
    goto LABEL_8;
  }
  uint64_t v11 = [v9 path];
  char v12 = [v6 fileExistsAtPath:v11 isDirectory:0];

  if (v12)
  {
LABEL_6:
    int64_t v14 = 0;
    goto LABEL_9;
  }
  if (!v5)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28760];
    uint64_t v17 = -6727;
LABEL_8:
    int64_t v14 = [v15 errorWithDomain:v16 code:v17 userInfo:0];
    goto LABEL_9;
  }
  id v20 = 0;
  [v6 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v20];
  id v13 = v20;
  if (!v13) {
    goto LABEL_6;
  }
  id v19 = v13;
  APSLogErrorAt();
  int64_t v14 = v19;
LABEL_9:
  if (a4) {
    *a4 = v14;
  }
  if (v14)
  {

    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_getCacheFileURLCreateIfNecessary:(BOOL)a3 error:(id *)a4
{
  if (!self->_serviceType)
  {
    int var0 = self->_ucat->var0;
    if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_24;
    }
LABEL_16:
    LogPrintF();
LABEL_24:
    char v12 = 0;
    id v9 = 0;
    id v8 = 0;
LABEL_25:
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  BOOL v6 = a3;
  if (![(NSString *)self->_networkSignature UTF8String])
  {
    int v15 = self->_ucat->var0;
    if (v15 > 90 || v15 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_24;
    }
    goto LABEL_16;
  }
  [(NSString *)self->_networkSignature UTF8String];
  strlen([(NSString *)self->_networkSignature UTF8String]);
  uint64_t v7 = SipHash();
  serviceType = self->_serviceType;
  uint64_t v18 = v7;
  id v8 = NSPrintF();
  id v19 = 0;
  id v9 = -[APBonjourCacheManager _getCacheDirectoryURLCreateIfNecessary:error:](self, "_getCacheDirectoryURLCreateIfNecessary:error:", v6, &v19, serviceType, v18);
  id v10 = v19;
  if (v10)
  {
    char v12 = v10;
    int v16 = self->_ucat->var0;
    if (v16 <= 90 && (v16 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_25;
  }
  uint64_t v11 = [v9 URLByAppendingPathComponent:v8 isDirectory:0];
  if (v11)
  {
    char v12 = 0;
  }
  else
  {
    APSLogErrorAt();
    char v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-6728 userInfo:0];
  }
LABEL_6:
  if (a4) {
    *a4 = v12;
  }

  return v11;
}

- (id)_readCachedItems
{
  id v18 = 0;
  int v3 = [(APBonjourCacheManager *)self _getCacheFileURLCreateIfNecessary:0 error:&v18];
  id v4 = v18;
  if (!v3)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_18;
  }
  BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v6 = [v3 path];
  int v7 = [v5 fileExistsAtPath:v6];

  if (!v7)
  {
LABEL_18:
    int64_t v14 = 0;
    id v9 = v4;
    goto LABEL_27;
  }
  id v17 = v4;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3 error:&v17];
  id v9 = v17;

  if (v8)
  {
    CFDictionaryGetTypeID();
    id v10 = CFDictionaryGetTypedValue();
    int v11 = self->_ucat->var0;
    if (v10)
    {
      if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v16 = [v10 count];
        LogPrintF();
      }
      int64_t v14 = objc_msgSend(v10, "mutableCopy", v16);
    }
    else
    {
      if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      int64_t v14 = 0;
    }
  }
  else
  {
    int v13 = self->_ucat->var0;
    if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int64_t v14 = 0;
  }

LABEL_27:
  return v14;
}

- (BOOL)_writeCachedItems:(id)a3
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v19 = [v4 count];
    LogPrintF();
  }
  id v22 = 0;
  BOOL v6 = -[APBonjourCacheManager _getCacheFileURLCreateIfNecessary:error:](self, "_getCacheFileURLCreateIfNecessary:error:", 1, &v22, v19);
  id v7 = v22;
  if (v6)
  {
    v23[0] = @"cachedItems";
    v23[1] = @"networkSignature";
    networkSignature = self->_networkSignature;
    v24[0] = v4;
    v24[1] = networkSignature;
    v23[2] = @"serviceType";
    v24[2] = self->_serviceType;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
    id v21 = 0;
    id v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v9 format:200 options:0 error:&v21];
    id v11 = v21;

    if (v10)
    {
      id v20 = v11;
      BOOL v12 = 1;
      char v13 = [v10 writeToURL:v6 options:1 error:&v20];
      id v14 = v20;

      if ((v13 & 1) == 0)
      {
        int v15 = self->_ucat->var0;
        if (v15 <= 90 && (v15 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        BOOL v12 = 0;
      }
      id v11 = v14;
    }
    else
    {
      int v17 = self->_ucat->var0;
      if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      BOOL v12 = 0;
    }

    id v7 = v11;
  }
  else
  {
    int v16 = self->_ucat->var0;
    if (v16 <= 90 && (v16 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_migrateCacheDirectoryIfNecessary
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  long long v56 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v72 = 0;
  v59 = self;
  uint64_t v3 = [(APBonjourCacheManager *)self _getCacheDirectoryURLCreateIfNecessary:1 error:&v72];
  id v4 = v72;
  id v57 = (void *)v3;
  if (!v3)
  {
    int var0 = v59->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_75;
  }
  BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v71 = v4;
  BOOL v6 = [v5 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:&v71];
  id v7 = v71;

  if (!v6)
  {
    APSLogErrorAt();
    goto LABEL_74;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v8 = [&unk_1F26CC310 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (!v8) {
    goto LABEL_73;
  }
  uint64_t v9 = v8;
  id v58 = 0;
  uint64_t v10 = *(void *)v68;
  uint64_t v51 = *(void *)v68;
  int v52 = v6;
  do
  {
    uint64_t v11 = 0;
    uint64_t v53 = v9;
    do
    {
      if (*(void *)v68 != v10) {
        objc_enumerationMutation(&unk_1F26CC310);
      }
      BOOL v12 = objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", *(void *)(*((void *)&v67 + 1) + 8 * v11), 1, v49, v50);

      id v58 = v12;
      if (![v57 isEqual:v12])
      {
        uint64_t v54 = v11;
        id v14 = [v12 path];
        int v15 = [v56 fileExistsAtPath:v14 isDirectory:0];

        if (!v15)
        {
          uint64_t v11 = v54;
          goto LABEL_66;
        }
        int v16 = v59->_ucat->var0;
        if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
        {
          id v49 = v58;
          LogPrintF();
        }
        int v17 = objc_msgSend(v58, "path", v49);
        id v66 = v7;
        id v18 = [v56 contentsOfDirectoryAtPath:v17 error:&v66];
        id v19 = v66;

        if (v19)
        {
          int v20 = v59->_ucat->var0;
          uint64_t v11 = v54;
          if (v20 <= 90 && (v20 != -1 || _LogCategory_Initialize()))
          {
            id v49 = v19;
            goto LABEL_24;
          }
          goto LABEL_64;
        }
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id obj = v18;
        uint64_t v21 = [obj countByEnumeratingWithState:&v62 objects:v73 count:16];
        id v22 = v58;
        if (v21)
        {
          uint64_t v23 = v21;
          uint64_t v24 = *(void *)v63;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v63 != v24) {
                objc_enumerationMutation(obj);
              }
              long long v26 = *(void **)(*((void *)&v62 + 1) + 8 * v25);
              int v27 = v59->_ucat->var0;
              if (v27 <= 30 && (v27 != -1 || _LogCategory_Initialize()))
              {
                uint64_t v28 = objc_msgSend(v22, "path", v49);
                v29 = [v28 stringByAppendingPathComponent:v26];
                id v30 = [v57 path];
                [v30 stringByAppendingPathComponent:v26];
                uint64_t v50 = v49 = v29;
                LogPrintF();

                id v22 = v58;
              }
              uint64_t v31 = objc_msgSend(v22, "path", v49);
              double v32 = [v31 stringByAppendingPathComponent:v26];
              uint64_t v33 = [v57 path];
              id v34 = [v33 stringByAppendingPathComponent:v26];
              id v61 = 0;
              [v56 moveItemAtPath:v32 toPath:v34 error:&v61];
              id v35 = v61;

              id v22 = v58;
              if (v35)
              {
                uint64_t v36 = [v35 code];
                int v37 = v59->_ucat->var0;
                if (v36 == 516)
                {
                  if (v37 <= 30 && (v37 != -1 || _LogCategory_Initialize()))
                  {
                    id v49 = v26;
                    LogPrintF();
                  }
                  int v38 = objc_msgSend(v58, "path", v49);
                  int v39 = [v38 stringByAppendingPathComponent:v26];
                  [v56 removeItemAtPath:v39 error:0];
                }
                else if (v37 <= 90 && (v37 != -1 || _LogCategory_Initialize()))
                {
                  id v49 = v26;
                  uint64_t v50 = v35;
                  LogPrintF();
                }
              }
              ++v25;
            }
            while (v23 != v25);
            uint64_t v40 = [obj countByEnumeratingWithState:&v62 objects:v73 count:16];
            uint64_t v23 = v40;
          }
          while (v40);
        }

        int v41 = [v22 path];
        double v42 = [v56 contentsOfDirectoryAtPath:v41 error:0];
        uint64_t v43 = [v42 count];

        BOOL v6 = v52;
        uint64_t v9 = v53;
        uint64_t v10 = v51;
        uint64_t v11 = v54;
        if (!v43)
        {
          int v44 = v59->_ucat->var0;
          if (v44 <= 50 && (v44 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          v45 = objc_msgSend(v58, "path", v49);
          id v60 = 0;
          [v56 removeItemAtPath:v45 error:&v60];
          id v19 = v60;

          if (v19)
          {
            int v46 = v59->_ucat->var0;
            if (v46 <= 90 && (v46 != -1 || _LogCategory_Initialize()))
            {
              id v49 = v19;
LABEL_24:
              LogPrintF();
            }
LABEL_64:
          }
        }

        id v7 = 0;
        goto LABEL_66;
      }
      int v13 = v59->_ucat->var0;
      if (v13 <= 90 && (v13 != -1 || _LogCategory_Initialize()))
      {
        id v49 = v12;
        LogPrintF();
      }
LABEL_66:
      ++v11;
    }
    while (v11 != v9);
    uint64_t v47 = [&unk_1F26CC310 countByEnumeratingWithState:&v67 objects:v74 count:16];
    uint64_t v9 = v47;
  }
  while (v47);

LABEL_73:
LABEL_74:
  id v4 = v7;
LABEL_75:
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (id)reportDeviceFoundHandler
{
  return self->_reportDeviceFoundHandler;
}

- (void)setReportDeviceFoundHandler:(id)a3
{
}

- (id)reportDeviceLostHandler
{
  return self->_reportDeviceLostHandler;
}

- (void)setReportDeviceLostHandler:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong(&self->_reportDeviceLostHandler, 0);
  objc_storeStrong(&self->_reportDeviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_coreWiFiQueue, 0);
  objc_storeStrong((id *)&self->_coreWiFiInterface, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_writeCoaleser, 0);
  objc_storeStrong((id *)&self->_networkSignature, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_pairedPeersMap, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_removedItems, 0);
  objc_storeStrong((id *)&self->_cachedItems, 0);
}

@end