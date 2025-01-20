@interface APAdvertiserBTLEManager
+ (id)stringForBTLEMode:(unsigned __int16)a3;
+ (id)stringForBTLEState:(int64_t)a3;
- (APAdvertiserBTLEManager)initWithEventContext:(void *)a3;
- (BOOL)canAdvertise;
- (BOOL)isAdvertising;
- (BOOL)isEnabled;
- (BOOL)isInvalidated;
- (BOOL)isScanning;
- (BOOL)shouldScanForSourceWithScreenOff;
- (CBAdvertiser)btleAdvertiser;
- (CBDiscovery)btleDiscoverer;
- (CUNetInterfaceMonitor)netInterfaceMonitor;
- (NSMutableDictionary)pendingLostLegacyDevices;
- (NSMutableDictionary)soloDevices;
- (OS_dispatch_queue)eventQueue;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_source)lostLegacyDeviceTimer;
- (id)createBTLEAdvertiser;
- (id)createBTLEDiscoverer;
- (int)btleAdvertiserSeed;
- (int)btleDiscovererSeed;
- (int)getBTLEMode:(unsigned __int16 *)a3;
- (int)setAccessControlType:(unsigned int)a3;
- (int)setBTLEMode:(unsigned __int16)a3;
- (int)setEventHandler:(void *)a3 withContext:(void *)a4;
- (int)setIsP2PAllowed:(BOOL)a3;
- (int)setProperty:(id)a3 withValue:(id)a4;
- (int)setReceiverPort:(unsigned __int16)a3;
- (int)setRequireAltBrowser:(BOOL)a3;
- (int)setupEventHandlerState;
- (int)showDebugWithDataBuffer:(id *)a3 verbose:(BOOL)a4;
- (int)start;
- (int)startMonitoringForNetworkChanges;
- (int)startP2PSoloQueryTimer;
- (int)stop;
- (int)stopMonitoringForNetworkChanges;
- (int)supportsSolo:(BOOL *)a3;
- (int)touchSetupActiveNotifyToken;
- (int)update;
- (int)updatePreferences;
- (int)updateSupportsSoloAndForceReadFromPrefs:(BOOL)a3;
- (int64_t)btleManagerState;
- (unsigned)seed;
- (unsigned)soloDeviceFlags;
- (void)cleanupEventHandlerState;
- (void)computeNearbyDeviceTypesAndDispatchEventIfNecessary;
- (void)dealloc;
- (void)dispatchEvent:(unsigned int)a3;
- (void)handleFoundDevice:(id)a3;
- (void)handleLostDevice:(id)a3 withGoodbye:(BOOL)a4;
- (void)handleP2PSoloQueryTimerCancelled;
- (void)handleP2PSoloQueryTimerFired;
- (void)invalidate;
- (void)removeExpiredDevices;
- (void)removeLostDeviceWithIdentifier:(id)a3;
- (void)restartAdvertisingIfNecessary;
- (void)setBtleAdvertiser:(id)a3;
- (void)setBtleAdvertiserSeed:(int)a3;
- (void)setBtleDiscoverer:(id)a3;
- (void)setBtleDiscovererSeed:(int)a3;
- (void)setIsAdvertising:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsInvalidated:(BOOL)a3;
- (void)setIsScanning:(BOOL)a3;
- (void)setLostLegacyDeviceTimer:(id)a3;
- (void)setNetInterfaceMonitor:(id)a3;
- (void)setPendingLostLegacyDevices:(id)a3;
- (void)setSeed:(unsigned __int8)a3;
- (void)setSoloDeviceFlags:(unsigned int)a3;
- (void)setSoloDevices:(id)a3;
- (void)setTouchSetupActiveNotifyToken:(int)a3;
- (void)startAdvertising;
- (void)startScanning;
- (void)stopAdvertising;
- (void)stopAdvertisingWithSeed:(int)a3;
- (void)stopScanning;
- (void)stopScanningWithSeed:(int)a3;
- (void)updateLostLegacyDeviceTimer;
@end

@implementation APAdvertiserBTLEManager

- (void)setNetInterfaceMonitor:(id)a3
{
  self->_netInterfaceMonitor = (CUNetInterfaceMonitor *)a3;
}

- (CUNetInterfaceMonitor)netInterfaceMonitor
{
  return self->_netInterfaceMonitor;
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setLostLegacyDeviceTimer:(id)a3
{
  self->_lostLegacyDeviceTimer = (OS_dispatch_source *)a3;
}

- (OS_dispatch_source)lostLegacyDeviceTimer
{
  return self->_lostLegacyDeviceTimer;
}

- (void)setTouchSetupActiveNotifyToken:(int)a3
{
  self->_touchSetupActiveNotifyToken = a3;
}

- (int)touchSetupActiveNotifyToken
{
  return self->_touchSetupActiveNotifyToken;
}

- (void)setPendingLostLegacyDevices:(id)a3
{
}

- (NSMutableDictionary)pendingLostLegacyDevices
{
  return self->_pendingLostLegacyDevices;
}

- (void)setSoloDevices:(id)a3
{
}

- (NSMutableDictionary)soloDevices
{
  return self->_soloDevices;
}

- (void)setSoloDeviceFlags:(unsigned int)a3
{
  self->_soloDeviceFlags = a3;
}

- (unsigned)soloDeviceFlags
{
  return self->_soloDeviceFlags;
}

- (void)setSeed:(unsigned __int8)a3
{
  self->_seed = a3;
}

- (unsigned)seed
{
  return self->_seed;
}

- (void)setIsInvalidated:(BOOL)a3
{
  self->_isInvalidated = a3;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setBtleDiscovererSeed:(int)a3
{
  self->_btleDiscovererSeed = a3;
}

- (int)btleDiscovererSeed
{
  return self->_btleDiscovererSeed;
}

- (void)setBtleAdvertiserSeed:(int)a3
{
  self->_btleAdvertiserSeed = a3;
}

- (int)btleAdvertiserSeed
{
  return self->_btleAdvertiserSeed;
}

- (void)setBtleDiscoverer:(id)a3
{
}

- (CBDiscovery)btleDiscoverer
{
  return self->_btleDiscoverer;
}

- (void)setBtleAdvertiser:(id)a3
{
}

- (CBAdvertiser)btleAdvertiser
{
  return self->_btleAdvertiser;
}

- (int)showDebugWithDataBuffer:(id *)a3 verbose:(BOOL)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  memset(v29, 0, sizeof(v29));
  if ([(APAdvertiserBTLEManager *)self isEnabled]) {
    v6 = "yes";
  }
  else {
    v6 = "no";
  }
  v16 = v6;
  DataBuffer_AppendF();
  char v28 = 0;
  int v7 = -[APAdvertiserBTLEManager supportsSolo:](self, "supportsSolo:", &v28, v16);
  DataBuffer_AppendF();
  if (self->_btleMode) {
    v8 = "presence";
  }
  else {
    v8 = "none";
  }
  v17 = v8;
  DataBuffer_AppendF();
  id v18 = +[APAdvertiserBTLEManager stringForBTLEState:[(APAdvertiserBTLEManager *)self btleManagerState]];
  DataBuffer_AppendF();
  if ([(APAdvertiserBTLEManager *)self isAdvertising]) {
    v9 = "yes";
  }
  else {
    v9 = "no";
  }
  v19 = v9;
  DataBuffer_AppendF();
  if ([(APAdvertiserBTLEManager *)self isScanning]) {
    v10 = "yes";
  }
  else {
    v10 = "no";
  }
  v20 = v10;
  DataBuffer_AppendF();
  if ([(APAdvertiserBTLEManager *)self btleAdvertiser])
  {
    [(CBAdvertiser *)[(APAdvertiserBTLEManager *)self btleAdvertiser] airplayTargetIPv4];
    IPv4AddressToCString();
    unsigned int v11 = [(CBAdvertiser *)[(APAdvertiserBTLEManager *)self btleAdvertiser] airplayTargetFlags];
    unsigned int v12 = [(CBAdvertiser *)[(APAdvertiserBTLEManager *)self btleAdvertiser] airplayTargetConfigSeed];
    v25 = v29;
    uint64_t v26 = [(CBAdvertiser *)[(APAdvertiserBTLEManager *)self btleAdvertiser] airplayTargetPort];
    v22 = &unk_22B497AFC;
    uint64_t v24 = v12;
    uint64_t v21 = v11;
    DataBuffer_AppendF();
  }
  if ([(APAdvertiserBTLEManager *)self soloDevices]) {
    uint64_t v13 = [(NSMutableDictionary *)[(APAdvertiserBTLEManager *)self soloDevices] count];
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v23 = [(APAdvertiserBTLEManager *)self soloDeviceFlags];
  DataBuffer_AppendF();
  if (v13)
  {
    DataBuffer_AppendF();
    v14 = [(APAdvertiserBTLEManager *)self soloDevices];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __59__APAdvertiserBTLEManager_showDebugWithDataBuffer_verbose___block_invoke;
    v27[3] = &__block_descriptor_40_e35_v32__0__NSString_8__NSNumber_16_B24l;
    v27[4] = a3;
    [(NSMutableDictionary *)v14 enumerateKeysAndObjectsUsingBlock:v27];
  }
  return v7;
}

uint64_t __59__APAdvertiserBTLEManager_showDebugWithDataBuffer_verbose___block_invoke()
{
  return DataBuffer_AppendF();
}

- (void)removeLostDeviceWithIdentifier:(id)a3
{
  if (gLogCategory_APAdvertiserBTLEManager <= 40
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    id v5 = a3;
    LogPrintF();
  }
  [(NSMutableDictionary *)[(APAdvertiserBTLEManager *)self soloDevices] removeObjectForKey:a3];

  [(APAdvertiserBTLEManager *)self computeNearbyDeviceTypesAndDispatchEventIfNecessary];
}

- (void)handleLostDevice:(id)a3 withGoodbye:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[NSMutableDictionary objectForKeyedSubscript:](-[APAdvertiserBTLEManager soloDevices](self, "soloDevices"), "objectForKeyedSubscript:", [a3 identifier]))
  {
    if (v4)
    {
      uint64_t v7 = [a3 identifier];
      [(APAdvertiserBTLEManager *)self removeLostDeviceWithIdentifier:v7];
    }
    else if (!-[NSMutableDictionary objectForKeyedSubscript:](-[APAdvertiserBTLEManager pendingLostLegacyDevices](self, "pendingLostLegacyDevices"), "objectForKeyedSubscript:", [a3 identifier]))
    {
      if (gLogCategory_APAdvertiserBTLEManager <= 40
        && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        [a3 identifier];
        LogPrintF();
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](-[APAdvertiserBTLEManager pendingLostLegacyDevices](self, "pendingLostLegacyDevices"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", dispatch_time(0, 15000000000)), objc_msgSend(a3, "identifier"));
      [(APAdvertiserBTLEManager *)self updateLostLegacyDeviceTimer];
    }
  }
}

- (void)handleFoundDevice:(id)a3
{
  if (gLogCategory_APAdvertiserBTLEManager <= 40)
  {
    if (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize())
    {
      uint64_t v5 = [a3 identifier];
      unsigned int v6 = [a3 airplaySourceFlags];
      uint64_t v10 = [a3 deviceFlags];
      unsigned int v11 = &unk_22B497BD9;
      uint64_t v8 = v6;
      v9 = &unk_22B497B7D;
      uint64_t v7 = v5;
      LogPrintF();
    }
    if (gLogCategory_APAdvertiserBTLEManager <= 40
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(a3, "identifier", v7, v8, v9, v10, v11);
      LogPrintF();
    }
  }
  if (APSShouldStartAdvertistingForAirPlaySourceBeacon())
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[APAdvertiserBTLEManager soloDevices](self, "soloDevices"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(a3, "airplaySourceFlags")), objc_msgSend(a3, "identifier"));
    -[NSMutableDictionary removeObjectForKey:](-[APAdvertiserBTLEManager pendingLostLegacyDevices](self, "pendingLostLegacyDevices"), "removeObjectForKey:", [a3 identifier]);
  }
  else
  {
    [(APAdvertiserBTLEManager *)self handleLostDevice:a3 withGoodbye:1];
  }

  [(APAdvertiserBTLEManager *)self computeNearbyDeviceTypesAndDispatchEventIfNecessary];
}

- (void)computeNearbyDeviceTypesAndDispatchEventIfNecessary
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  v3 = [(APAdvertiserBTLEManager *)self soloDevices];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__APAdvertiserBTLEManager_computeNearbyDeviceTypesAndDispatchEventIfNecessary__block_invoke;
  v11[3] = &unk_2648961B0;
  v11[4] = &v12;
  [(NSMutableDictionary *)v3 enumerateKeysAndObjectsUsingBlock:v11];
  int v4 = *((_DWORD *)v13 + 6);
  if (v4 == [(APAdvertiserBTLEManager *)self soloDeviceFlags]) {
    goto LABEL_16;
  }
  unsigned int v5 = [(APAdvertiserBTLEManager *)self soloDeviceFlags];
  int v6 = *((_DWORD *)v13 + 6);
  char v7 = [(APAdvertiserBTLEManager *)self soloDeviceFlags];
  unsigned int v8 = *((_DWORD *)v13 + 6);
  [(APAdvertiserBTLEManager *)self setSoloDeviceFlags:v8];
  if ((v6 & 0x80000000) == 0 || (v5 & 0x80000000) != 0)
  {
    if (v6 < 0 || (v5 & 0x80000000) == 0) {
      goto LABEL_9;
    }
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(APAdvertiserBTLEManager *)self dispatchEvent:v9];
LABEL_9:
  if ((v8 & 8) != 0 && (v7 & 8) == 0)
  {
    uint64_t v10 = 2;
LABEL_15:
    [(APAdvertiserBTLEManager *)self dispatchEvent:v10];
    goto LABEL_16;
  }
  if ((v8 & 8) == 0 && (v7 & 8) != 0)
  {
    uint64_t v10 = 3;
    goto LABEL_15;
  }
LABEL_16:
  _Block_object_dispose(&v12, 8);
}

uint64_t __78__APAdvertiserBTLEManager_computeNearbyDeviceTypesAndDispatchEventIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t result = CFGetInt64Ranged();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= 0x80000000;
  return result;
}

- (void)removeExpiredDevices
{
  dispatch_time_t v3 = dispatch_time(0, 0);
  uint64_t v4 = objc_opt_new();
  if (v4)
  {
    unsigned int v5 = (void *)v4;
    int v6 = [(APAdvertiserBTLEManager *)self pendingLostLegacyDevices];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__APAdvertiserBTLEManager_removeExpiredDevices__block_invoke;
    v7[3] = &unk_2648961D8;
    v7[5] = v5;
    v7[6] = v3;
    v7[4] = self;
    [(NSMutableDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v7];
    [(NSMutableDictionary *)[(APAdvertiserBTLEManager *)self pendingLostLegacyDevices] removeObjectsForKeys:v5];

    [(APAdvertiserBTLEManager *)self updateLostLegacyDeviceTimer];
  }
  else
  {
    APSLogErrorAt();
  }
}

unint64_t __47__APAdvertiserBTLEManager_removeExpiredDevices__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t result = [a3 unsignedLongLongValue];
  if (result <= *(void *)(a1 + 48))
  {
    [*(id *)(a1 + 32) removeLostDeviceWithIdentifier:a2];
    int v6 = *(void **)(a1 + 40);
    return [v6 addObject:a2];
  }
  return result;
}

- (void)updateLostLegacyDeviceTimer
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = -1;
  if ([(NSMutableDictionary *)[(APAdvertiserBTLEManager *)self pendingLostLegacyDevices] count])
  {
    dispatch_time_t v3 = [(APAdvertiserBTLEManager *)self pendingLostLegacyDevices];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__APAdvertiserBTLEManager_updateLostLegacyDeviceTimer__block_invoke;
    v11[3] = &unk_2648961B0;
    v11[4] = &v12;
    [(NSMutableDictionary *)v3 enumerateKeysAndObjectsUsingBlock:v11];
    if (![(APAdvertiserBTLEManager *)self lostLegacyDeviceTimer])
    {
      [(APAdvertiserBTLEManager *)self setLostLegacyDeviceTimer:dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_internalQueue)];
      if (![(APAdvertiserBTLEManager *)self lostLegacyDeviceTimer])
      {
        APSLogErrorAt();
        goto LABEL_8;
      }
      uint64_t v4 = self;
      unsigned int v5 = [(APAdvertiserBTLEManager *)self lostLegacyDeviceTimer];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __54__APAdvertiserBTLEManager_updateLostLegacyDeviceTimer__block_invoke_2;
      handler[3] = &unk_264895FB0;
      handler[4] = v4;
      dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
      int v6 = [(APAdvertiserBTLEManager *)self lostLegacyDeviceTimer];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __54__APAdvertiserBTLEManager_updateLostLegacyDeviceTimer__block_invoke_3;
      v9[3] = &unk_264895FB0;
      v9[4] = v4;
      dispatch_source_set_cancel_handler((dispatch_source_t)v6, v9);
      dispatch_source_set_timer((dispatch_source_t)[(APAdvertiserBTLEManager *)self lostLegacyDeviceTimer], 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      dispatch_resume((dispatch_object_t)[(APAdvertiserBTLEManager *)self lostLegacyDeviceTimer]);
    }
    char v7 = [(APAdvertiserBTLEManager *)self lostLegacyDeviceTimer];
    dispatch_source_set_timer((dispatch_source_t)v7, v13[3], 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    lostLegacyDeviceTimer = self->_lostLegacyDeviceTimer;
    if (lostLegacyDeviceTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_lostLegacyDeviceTimer);
      dispatch_release(lostLegacyDeviceTimer);
      self->_lostLegacyDeviceTimer = 0;
    }
  }
LABEL_8:
  _Block_object_dispose(&v12, 8);
}

unint64_t __54__APAdvertiserBTLEManager_updateLostLegacyDeviceTimer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t result = [a3 unsignedLongLongValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (result < *(void *)(v5 + 24)) {
    *(void *)(v5 + 24) = result;
  }
  return result;
}

uint64_t __54__APAdvertiserBTLEManager_updateLostLegacyDeviceTimer__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeExpiredDevices];
}

void __54__APAdvertiserBTLEManager_updateLostLegacyDeviceTimer__block_invoke_3(uint64_t a1)
{
}

- (void)dispatchEvent:(unsigned int)a3
{
  weakSelf = self->_weakSelf;
  pthread_mutex_lock((pthread_mutex_t *)self->_eventHandlerState.mutex);
  unsigned int seed = self->_eventHandlerState.seed;
  long long v8 = *(_OWORD *)&self->_eventHandlerState.func;
  pthread_mutex_unlock((pthread_mutex_t *)self->_eventHandlerState.mutex);
  if ((void)v8)
  {
    if (weakSelf) {
      CFRetain(weakSelf);
    }
    char v7 = [(APAdvertiserBTLEManager *)self eventQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__APAdvertiserBTLEManager_dispatchEvent___block_invoke;
    block[3] = &__block_descriptor_64_e5_v8__0l;
    block[4] = weakSelf;
    unsigned int v12 = seed;
    unsigned int v13 = a3;
    long long v11 = v9;
    dispatch_async((dispatch_queue_t)v7, block);
  }
}

void __41__APAdvertiserBTLEManager_dispatchEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    uint64_t v3 = v2;
    pthread_mutex_lock(*(pthread_mutex_t **)(v2 + 40));
    int v4 = *(_DWORD *)(a1 + 56);
    int v5 = *(_DWORD *)(v3 + 48);
    pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 40));
    if (v4 == v5) {
      (*(void (**)(void, void, void))(a1 + 40))(*(void *)(v3 + 72), *(unsigned int *)(a1 + 60), *(void *)(a1 + 48));
    }
    CFRelease((CFTypeRef)v3);
  }
  int v6 = *(const void **)(a1 + 32);
  if (v6)
  {
    CFRelease(v6);
  }
}

- (void)stopScanningWithSeed:(int)a3
{
  if ([(APAdvertiserBTLEManager *)self btleDiscovererSeed] == a3)
  {
    if ([(APAdvertiserBTLEManager *)self isScanning]
      && gLogCategory_APAdvertiserBTLEManager <= 50
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(CBDiscovery *)[(APAdvertiserBTLEManager *)self btleDiscoverer] invalidate];

    [(APAdvertiserBTLEManager *)self setBtleDiscoverer:0];
    [(APAdvertiserBTLEManager *)self setIsScanning:0];
    [(NSMutableDictionary *)[(APAdvertiserBTLEManager *)self pendingLostLegacyDevices] removeAllObjects];
    [(APAdvertiserBTLEManager *)self updateLostLegacyDeviceTimer];
    [(NSMutableDictionary *)[(APAdvertiserBTLEManager *)self soloDevices] removeAllObjects];
    [(APAdvertiserBTLEManager *)self computeNearbyDeviceTypesAndDispatchEventIfNecessary];
  }
}

- (void)stopScanning
{
  uint64_t v3 = [(APAdvertiserBTLEManager *)self btleDiscovererSeed];

  [(APAdvertiserBTLEManager *)self stopScanningWithSeed:v3];
}

- (void)startScanning
{
  if (![(APAdvertiserBTLEManager *)self isScanning])
  {
    [(APAdvertiserBTLEManager *)self setBtleDiscoverer:[(APAdvertiserBTLEManager *)self createBTLEDiscoverer]];
    if ([(APAdvertiserBTLEManager *)self btleDiscoverer])
    {
      [(APAdvertiserBTLEManager *)self setIsScanning:1];
      if (gLogCategory_APAdvertiserBTLEManager <= 50
        && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v3 = self;
      uint64_t v4 = [(APAdvertiserBTLEManager *)self btleDiscovererSeed] + 1;
      [(APAdvertiserBTLEManager *)self setBtleDiscovererSeed:v4];
      int v5 = [(APAdvertiserBTLEManager *)self btleDiscoverer];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __40__APAdvertiserBTLEManager_startScanning__block_invoke;
      v6[3] = &unk_264896168;
      v6[4] = v3;
      int v7 = v4;
      [(CBDiscovery *)v5 activateWithCompletion:v6];
    }
    else
    {
      APSLogErrorAt();
      [(APAdvertiserBTLEManager *)self stopScanning];
    }
  }
}

void __40__APAdvertiserBTLEManager_startScanning__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (gLogCategory_APAdvertiserBTLEManager <= 90
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "stopScanningWithSeed:", *(unsigned int *)(a1 + 40), a2);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "stopScanningWithSeed:", *(unsigned int *)(a1 + 40), v5);
    }
  }
  else if (gLogCategory_APAdvertiserBTLEManager <= 50 {
         && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  uint64_t v4 = *(void **)(a1 + 32);
}

- (void)restartAdvertisingIfNecessary
{
  [(APAdvertiserBTLEManager *)self stopAdvertising];

  [(APAdvertiserBTLEManager *)self update];
}

- (void)stopAdvertisingWithSeed:(int)a3
{
  if ([(APAdvertiserBTLEManager *)self btleAdvertiserSeed] == a3)
  {
    if ([(APAdvertiserBTLEManager *)self isAdvertising]
      && gLogCategory_APAdvertiserBTLEManager <= 50
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = self;
      uint64_t v5 = [(APAdvertiserBTLEManager *)self btleAdvertiser];
      LogPrintF();
    }
    [(CBAdvertiser *)[(APAdvertiserBTLEManager *)self btleAdvertiser] invalidate];

    [(APAdvertiserBTLEManager *)self setBtleAdvertiser:0];
    [(APAdvertiserBTLEManager *)self setIsAdvertising:0];
  }
}

- (void)stopAdvertising
{
  uint64_t v3 = [(APAdvertiserBTLEManager *)self btleAdvertiserSeed];

  [(APAdvertiserBTLEManager *)self stopAdvertisingWithSeed:v3];
}

- (void)startAdvertising
{
  if (![(APAdvertiserBTLEManager *)self isAdvertising]
    && [(APAdvertiserBTLEManager *)self canAdvertise])
  {
    [(APAdvertiserBTLEManager *)self setBtleAdvertiser:[(APAdvertiserBTLEManager *)self createBTLEAdvertiser]];
    if ([(APAdvertiserBTLEManager *)self btleAdvertiser])
    {
      [(APAdvertiserBTLEManager *)self setIsAdvertising:1];
      if (gLogCategory_APAdvertiserBTLEManager <= 50
        && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        [(APAdvertiserBTLEManager *)self btleAdvertiser];
        LogPrintF();
      }
      uint64_t v3 = self;
      uint64_t v4 = [(APAdvertiserBTLEManager *)self btleAdvertiser];
      uint64_t v5 = [(APAdvertiserBTLEManager *)self btleAdvertiserSeed] + 1;
      [(APAdvertiserBTLEManager *)self setBtleAdvertiserSeed:v5];
      int v6 = [(APAdvertiserBTLEManager *)self btleAdvertiser];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __43__APAdvertiserBTLEManager_startAdvertising__block_invoke;
      v9[3] = &unk_264896118;
      v9[4] = v3;
      void v9[5] = v4;
      int v10 = v5;
      [(CBAdvertiser *)v6 activateWithCompletion:v9];
      int v7 = [(APAdvertiserBTLEManager *)self btleAdvertiser];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __43__APAdvertiserBTLEManager_startAdvertising__block_invoke_2;
      v8[3] = &unk_264896140;
      v8[4] = v3;
      v8[5] = v4;
      [(CBAdvertiser *)v7 setInvalidationHandler:v8];
    }
    else
    {
      APSLogErrorAt();
      [(APAdvertiserBTLEManager *)self stopAdvertising];
    }
  }
}

void __43__APAdvertiserBTLEManager_startAdvertising__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (gLogCategory_APAdvertiserBTLEManager <= 90
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 32);
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "stopAdvertisingWithSeed:", *(unsigned int *)(a1 + 48), v6, v8, a2);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "stopAdvertisingWithSeed:", *(unsigned int *)(a1 + 48), v5, v7, v9);
    }
  }
  else if (gLogCategory_APAdvertiserBTLEManager <= 50 {
         && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  uint64_t v4 = *(void **)(a1 + 32);
}

uint64_t __43__APAdvertiserBTLEManager_startAdvertising__block_invoke_2()
{
  if (gLogCategory_APAdvertiserBTLEManager <= 50)
  {
    if (gLogCategory_APAdvertiserBTLEManager != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

- (int)stopMonitoringForNetworkChanges
{
  self->_netInterfaceMonitor = 0;
  return 0;
}

- (int)startMonitoringForNetworkChanges
{
  if ([(APAdvertiserBTLEManager *)self netInterfaceMonitor])
  {
    APSLogErrorAt();
    return -6709;
  }
  else
  {
    if (gLogCategory_APAdvertiserBTLEManager <= 40
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = objc_alloc_init(MEMORY[0x263F38590]);
    objc_msgSend(v3, "setDispatchQueue:", -[APAdvertiserBTLEManager internalQueue](self, "internalQueue"));
    [v3 setControlFlags:12];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__APAdvertiserBTLEManager_startMonitoringForNetworkChanges__block_invoke;
    v7[3] = &unk_2648960F0;
    v7[4] = v3;
    v7[5] = self;
    [v3 setPrimaryIPChangedHandler:v7];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __59__APAdvertiserBTLEManager_startMonitoringForNetworkChanges__block_invoke_2;
    v6[3] = &unk_264895FB0;
    v6[4] = self;
    [v3 setInvalidationHandler:v6];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __59__APAdvertiserBTLEManager_startMonitoringForNetworkChanges__block_invoke_3;
    v5[3] = &unk_2648960F0;
    v5[4] = self;
    v5[5] = v3;
    [v3 activateWithCompletion:v5];
    [(APAdvertiserBTLEManager *)self setNetInterfaceMonitor:v3];
    return 0;
  }
}

uint64_t __59__APAdvertiserBTLEManager_startMonitoringForNetworkChanges__block_invoke(uint64_t a1)
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  LODWORD(v19) = 0;
  uint64_t v18 = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2
    && ([v2 primaryIPv4Addr],
        id v3 = *(void **)(a1 + 32),
        uint64_t v12 = 0,
        uint64_t v13 = 0,
        LODWORD(v15) = 0,
        uint64_t v14 = 0,
        v3))
  {
    [v3 primaryIPv6Addr];
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    LODWORD(v15) = 0;
    uint64_t v14 = 0;
  }
  int v4 = gLogCategory_APAdvertiserBTLEManager;
  if (gLogCategory_APAdvertiserBTLEManager <= 40)
  {
    if (gLogCategory_APAdvertiserBTLEManager == -1)
    {
      if (!_LogCategory_Initialize()) {
        return objc_msgSend(*(id *)(a1 + 40), "handlePrimaryIPChanged", v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
      }
      int v4 = gLogCategory_APAdvertiserBTLEManager;
    }
    uint64_t v5 = *(void *)(a1 + 40);
    if (v4 > 30) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == -1 && _LogCategory_Initialize() == 0;
    }
    BOOL v10 = v6;
    long long v11 = &v12;
    uint64_t v8 = v5;
    uint64_t v9 = &v16;
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 40), "handlePrimaryIPChanged", v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
}

uint64_t __59__APAdvertiserBTLEManager_startMonitoringForNetworkChanges__block_invoke_2()
{
  if (gLogCategory_APAdvertiserBTLEManager <= 40)
  {
    if (gLogCategory_APAdvertiserBTLEManager != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

uint64_t __59__APAdvertiserBTLEManager_startMonitoringForNetworkChanges__block_invoke_3(uint64_t a1)
{
  if (gLogCategory_APAdvertiserBTLEManager <= 50
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    IsAppleInternalBuild();
    [*(id *)(a1 + 40) controlFlags];
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 handlePrimaryIPChanged];
}

- (void)cleanupEventHandlerState
{
  if (self->_eventHandlerState.mutex)
  {
    FigSimpleMutexDestroy();
    self->_eventHandlerState.mutex = 0;
  }
}

- (int)setEventHandler:(void *)a3 withContext:(void *)a4
{
  self->_eventHandlerState.func = a3;
  self->_eventHandlerState.context = a4;
  pthread_mutex_unlock((pthread_mutex_t *)self->_eventHandlerState.mutex);
  return 0;
}

- (int)setupEventHandlerState
{
  id v3 = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  self->_eventHandlerState.mutex = v3;
  if (v3) {
    return 0;
  }
  APSLogErrorAt();
  return -72312;
}

- (int)setProperty:(id)a3 withValue:(id)a4
{
  if ([a3 isEqualToString:@"isP2PAllowed"])
  {
    int v7 = -[APAdvertiserBTLEManager setIsP2PAllowed:](self, "setIsP2PAllowed:", [a4 BOOLValueSafe]);
    if (v7) {
LABEL_12:
    }
      APSLogErrorAt();
  }
  else if ([a3 isEqualToString:@"requireAltBrowser"])
  {
    int v7 = -[APAdvertiserBTLEManager setRequireAltBrowser:](self, "setRequireAltBrowser:", [a4 BOOLValueSafe]);
    if (v7) {
      goto LABEL_12;
    }
  }
  else if ([a3 isEqualToString:@"receiverPort"])
  {
    int v7 = -[APAdvertiserBTLEManager setReceiverPort:](self, "setReceiverPort:", (unsigned __int16)[a4 int64ValueSafe]);
    if (v7) {
      goto LABEL_12;
    }
  }
  else
  {
    if (![a3 isEqualToString:@"accessControlType"]) {
      return -72311;
    }
    int v7 = -[APAdvertiserBTLEManager setAccessControlType:](self, "setAccessControlType:", [a4 int64ValueSafe]);
    if (v7) {
      goto LABEL_12;
    }
  }
  return v7;
}

- (int)setAccessControlType:(unsigned int)a3
{
  uint64_t accessControlType = self->_accessControlType;
  if (accessControlType != a3)
  {
    uint64_t v4 = *(void *)&a3;
    if (gLogCategory_APAdvertiserBTLEManager <= 50)
    {
      if (gLogCategory_APAdvertiserBTLEManager == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_6;
        }
        uint64_t accessControlType = self->_accessControlType;
      }
      uint64_t v7 = accessControlType;
      uint64_t v8 = v4;
      LogPrintF();
    }
LABEL_6:
    self->_uint64_t accessControlType = v4;
    [(APAdvertiserBTLEManager *)self stopScanning];
    [(APAdvertiserBTLEManager *)self update];
  }
  return 0;
}

- (int)setReceiverPort:(unsigned __int16)a3
{
  unsigned int receiverPort = self->_receiverPort;
  if (receiverPort != a3)
  {
    uint64_t v4 = a3;
    if (gLogCategory_APAdvertiserBTLEManager <= 50)
    {
      if (gLogCategory_APAdvertiserBTLEManager == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_6;
        }
        unsigned int receiverPort = self->_receiverPort;
      }
      uint64_t v7 = receiverPort;
      uint64_t v8 = v4;
      LogPrintF();
    }
LABEL_6:
    self->_unsigned int receiverPort = v4;
    [(APAdvertiserBTLEManager *)self restartAdvertisingIfNecessary];
  }
  return 0;
}

- (int)setRequireAltBrowser:(BOOL)a3
{
  int v3 = a3;
  if (![(APAdvertiserBTLEManager *)self isAdvertising])
  {
    int requireAltBrowser = self->_requireAltBrowser;
    if (requireAltBrowser == v3) {
      return 0;
    }
    if (gLogCategory_APAdvertiserBTLEManager <= 40)
    {
      if (gLogCategory_APAdvertiserBTLEManager != -1)
      {
LABEL_5:
        BOOL v6 = "YES";
        if (requireAltBrowser) {
          uint64_t v7 = "YES";
        }
        else {
          uint64_t v7 = "NO";
        }
        if (!v3) {
          BOOL v6 = "NO";
        }
        uint64_t v9 = v7;
        BOOL v10 = v6;
        LogPrintF();
        goto LABEL_12;
      }
      if (_LogCategory_Initialize())
      {
        int requireAltBrowser = self->_requireAltBrowser;
        goto LABEL_5;
      }
    }
LABEL_12:
    self->_int requireAltBrowser = v3;
    [(APAdvertiserBTLEManager *)self update];
    return 0;
  }
  APSLogErrorAt();
  return -72314;
}

- (int)setIsP2PAllowed:(BOOL)a3
{
  BOOL isP2PAllowed = self->_isP2PAllowed;
  if (isP2PAllowed == a3) {
    return 0;
  }
  BOOL v4 = a3;
  if (gLogCategory_APAdvertiserBTLEManager <= 50)
  {
    if (gLogCategory_APAdvertiserBTLEManager != -1)
    {
LABEL_4:
      BOOL v6 = "YES";
      if (isP2PAllowed) {
        uint64_t v7 = "YES";
      }
      else {
        uint64_t v7 = "NO";
      }
      if (!v4) {
        BOOL v6 = "NO";
      }
      BOOL v10 = v7;
      long long v11 = v6;
      LogPrintF();
      goto LABEL_11;
    }
    if (_LogCategory_Initialize())
    {
      BOOL isP2PAllowed = self->_isP2PAllowed;
      goto LABEL_4;
    }
  }
LABEL_11:
  self->_BOOL isP2PAllowed = v4;
  int v8 = [(APAdvertiserBTLEManager *)self update];
  if (v8) {
    APSLogErrorAt();
  }
  return v8;
}

- (int)getBTLEMode:(unsigned __int16 *)a3
{
  *a3 = self->_btleMode;
  return 0;
}

- (int)setBTLEMode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (self->_btleMode == a3) {
    return 0;
  }
  if (gLogCategory_APAdvertiserBTLEManager <= 40
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    +[APAdvertiserBTLEManager stringForBTLEMode:](APAdvertiserBTLEManager, "stringForBTLEMode:");
    +[APAdvertiserBTLEManager stringForBTLEMode:v3];
    LogPrintF();
  }
  if (v3 == 1)
  {
    int v5 = [(APAdvertiserBTLEManager *)self start];
    if (v5) {
LABEL_11:
    }
      APSLogErrorAt();
  }
  else if (v3)
  {
    int v5 = -72313;
    if (gLogCategory_APAdvertiserBTLEManager <= 90
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    int v5 = [(APAdvertiserBTLEManager *)self stop];
    if (v5) {
      goto LABEL_11;
    }
  }
  return v5;
}

- (int64_t)btleManagerState
{
  if ([(APAdvertiserBTLEManager *)self btleAdvertiser])
  {
    int64_t result = [(APAdvertiserBTLEManager *)self btleAdvertiser];
    if (!result) {
      return result;
    }
  }
  else
  {
    int64_t result = [(APAdvertiserBTLEManager *)self btleDiscoverer];
    if (!result) {
      return result;
    }
  }

  return [(id)result bluetoothState];
}

- (BOOL)shouldScanForSourceWithScreenOff
{
  int v2 = IsAppleInternalBuild();
  if (v2)
  {
    if (APSSettingsGetIntWithDefault())
    {
      if (gLogCategory_APAdvertiserBTLEManager <= 50
        && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      LOBYTE(v2) = 1;
    }
    else
    {
      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

- (int)supportsSolo:(BOOL *)a3
{
  if (self->_p2pSoloQueried)
  {
    int result = 0;
    BOOL p2pSolo = self->_p2pSolo;
  }
  else
  {
    BOOL p2pSolo = 0;
    int result = -72310;
  }
  *a3 = p2pSolo;
  return result;
}

- (int)updateSupportsSoloAndForceReadFromPrefs:(BOOL)a3
{
  int result = 0;
  if (!self->_p2pSoloQueried || a3)
  {
    BOOL v6 = APSSettingsGetInt64() != 0;
    if (self->_p2pSolo == v6)
    {
      int result = 0;
    }
    else
    {
      if (gLogCategory_APAdvertiserBTLEManager <= 40
        && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        uint64_t v7 = "yes";
        if (v6) {
          int v8 = "no";
        }
        else {
          int v8 = "yes";
        }
        if (!v6) {
          uint64_t v7 = "no";
        }
        uint64_t v9 = v8;
        BOOL v10 = v7;
        LogPrintF();
      }
      self->_BOOL p2pSolo = v6;
      [(APAdvertiserBTLEManager *)self update];
      int result = 0;
    }
    self->_p2pSoloQueried = 1;
  }
  return result;
}

- (int)updatePreferences
{
  int v8 = 0;
  uint64_t v7 = 0;
  notify_get_state([(APAdvertiserBTLEManager *)self touchSetupActiveNotifyToken], &v7);
  uint64_t v3 = 0;
  if (!v7)
  {
    uint64_t Int64 = APSSettingsGetInt64();
    if (v8) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = Int64 == 0;
    }
    uint64_t v3 = !v5;
  }
  [(APAdvertiserBTLEManager *)self setIsEnabled:v3];
  int v8 = [(APAdvertiserBTLEManager *)self updateSupportsSoloAndForceReadFromPrefs:1];
  int result = [(APAdvertiserBTLEManager *)self update];
  int v8 = result;
  if (result)
  {
    APSLogErrorAt();
    return v8;
  }
  return result;
}

- (int)update
{
  if (gLogCategory_APAdvertiserBTLEManager <= 20
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    if ([(APAdvertiserBTLEManager *)self isEnabled]) {
      uint64_t v3 = "yes";
    }
    else {
      uint64_t v3 = "no";
    }
    uint64_t btleMode = self->_btleMode;
    id v7 = +[APAdvertiserBTLEManager stringForBTLEState:[(APAdvertiserBTLEManager *)self btleManagerState]];
    BOOL v5 = v3;
    LogPrintF();
  }
  if (![(APAdvertiserBTLEManager *)self isEnabled] || !self->_btleMode)
  {
    if ([(APAdvertiserBTLEManager *)self isAdvertising]) {
      [(APAdvertiserBTLEManager *)self stopAdvertising];
    }
    goto LABEL_17;
  }
  if ([(APAdvertiserBTLEManager *)self isEnabled] && self->_btleMode == 1)
  {
    [(APAdvertiserBTLEManager *)self startAdvertising];
    if (self->_p2pSolo)
    {
      if (self->_isP2PAllowed)
      {
        [(APAdvertiserBTLEManager *)self startScanning];
        return 0;
      }
    }
    else if (self->_isP2PAllowed)
    {
      return 0;
    }
LABEL_17:
    [(APAdvertiserBTLEManager *)self stopScanning];
  }
  return 0;
}

- (BOOL)canAdvertise
{
  return !self->_requireAltBrowser;
}

- (void)handleP2PSoloQueryTimerCancelled
{
  if (gLogCategory_APAdvertiserBTLEManager <= 40
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)handleP2PSoloQueryTimerFired
{
  if (![(APAdvertiserBTLEManager *)self updateSupportsSoloAndForceReadFromPrefs:0])
  {
    p2pSoloQueryTimer = self->_p2pSoloQueryTimer;
    if (p2pSoloQueryTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_p2pSoloQueryTimer);
      dispatch_release(p2pSoloQueryTimer);
      self->_p2pSoloQueryTimer = 0;
    }
  }
}

- (int)startP2PSoloQueryTimer
{
  if (self->_p2pSoloQueried || self->_p2pSoloQueryTimer) {
    return 0;
  }
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_internalQueue);
  self->_p2pSoloQueryTimer = v3;
  if (!v3)
  {
    APSLogErrorAt();
    return -72312;
  }
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __49__APAdvertiserBTLEManager_startP2PSoloQueryTimer__block_invoke;
  handler[3] = &unk_264895FB0;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v3, handler);
  p2pSoloQueryTimer = self->_p2pSoloQueryTimer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__APAdvertiserBTLEManager_startP2PSoloQueryTimer__block_invoke_2;
  v8[3] = &unk_264895FB0;
  v8[4] = self;
  dispatch_source_set_cancel_handler(p2pSoloQueryTimer, v8);
  BOOL v5 = self->_p2pSoloQueryTimer;
  dispatch_time_t v6 = dispatch_time(0, 500000000);
  dispatch_source_set_timer(v5, v6, 0x1DCD6500uLL, 0x3B9ACA00uLL);
  dispatch_resume((dispatch_object_t)self->_p2pSoloQueryTimer);
  if (gLogCategory_APAdvertiserBTLEManager > 40) {
    return 0;
  }
  if (gLogCategory_APAdvertiserBTLEManager != -1 || (int result = _LogCategory_Initialize()) != 0)
  {
    LogPrintF();
    return 0;
  }
  return result;
}

uint64_t __49__APAdvertiserBTLEManager_startP2PSoloQueryTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleP2PSoloQueryTimerFired];
}

uint64_t __49__APAdvertiserBTLEManager_startP2PSoloQueryTimer__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleP2PSoloQueryTimerCancelled];
}

- (int)stop
{
  if (gLogCategory_APAdvertiserBTLEManager <= 40
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_btleMode) {
    return 0;
  }
  self->_uint64_t btleMode = 0;
  int v3 = [(APAdvertiserBTLEManager *)self stopMonitoringForNetworkChanges];
  if (v3)
  {
    int v4 = v3;
    goto LABEL_11;
  }
  int v4 = [(APAdvertiserBTLEManager *)self update];
  if (v4) {
LABEL_11:
  }
    APSLogErrorAt();
  return v4;
}

- (int)start
{
  if (self->_btleMode == 1)
  {
    APSLogErrorAt();
  }
  else
  {
    if (gLogCategory_APAdvertiserBTLEManager <= 40
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      int v4 = self;
      LogPrintF();
    }
    self->_uint64_t btleMode = 1;
    [(APAdvertiserBTLEManager *)self startMonitoringForNetworkChanges];
    [(APAdvertiserBTLEManager *)self update];
  }
  return 0;
}

- (id)createBTLEDiscoverer
{
  uint64_t v12 = -75;
  id v3 = objc_alloc_init(MEMORY[0x263EFEF30]);
  if (v3)
  {
    objc_msgSend(v3, "setDispatchQueue:", -[APAdvertiserBTLEManager internalQueue](self, "internalQueue"));
    objc_msgSend(v3, "setDiscoveryFlags:", objc_msgSend(v3, "discoveryFlags") | 0x5000000000);
    if ([(APAdvertiserBTLEManager *)self shouldScanForSourceWithScreenOff])
    {
      objc_msgSend(v3, "setDiscoveryFlags:", objc_msgSend(v3, "discoveryFlags") | 0x2000000);
      [v3 setBleScanRateScreenOff:20];
    }
    int v4 = "no";
    if (IsAppleInternalBuild() && APSSettingsGetInt64IfPresent()) {
      int v4 = "yes";
    }
    if (gLogCategory_APAdvertiserBTLEManager <= 30
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = v12;
      int v8 = v4;
      LogPrintF();
    }
    objc_msgSend(v3, "setBleRSSIThresholdHint:", (char)v12, v7, v8);
    BOOL v5 = self;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __47__APAdvertiserBTLEManager_createBTLEDiscoverer__block_invoke;
    v11[3] = &unk_2648960C8;
    v11[4] = v5;
    [v3 setDeviceFoundHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__APAdvertiserBTLEManager_createBTLEDiscoverer__block_invoke_2;
    v10[3] = &unk_2648960C8;
    v10[4] = v5;
    [v3 setDeviceLostHandler:v10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__APAdvertiserBTLEManager_createBTLEDiscoverer__block_invoke_3;
    v9[3] = &unk_264895FB0;
    v9[4] = v5;
    [v3 setInvalidationHandler:v9];
  }
  else
  {
    APSLogErrorAt();
  }
  return v3;
}

uint64_t __47__APAdvertiserBTLEManager_createBTLEDiscoverer__block_invoke(uint64_t a1, void *a2)
{
  char v4 = [a2 airplaySourceFlags];
  BOOL v5 = *(void **)(a1 + 32);
  if (v4 < 0)
  {
    return [v5 handleLostDevice:a2 withGoodbye:1];
  }
  else
  {
    return [v5 handleFoundDevice:a2];
  }
}

uint64_t __47__APAdvertiserBTLEManager_createBTLEDiscoverer__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleLostDevice:a2 withGoodbye:0];
}

void __47__APAdvertiserBTLEManager_createBTLEDiscoverer__block_invoke_3(uint64_t a1)
{
}

- (id)createBTLEAdvertiser
{
  id v3 = objc_alloc_init(MEMORY[0x263EFEEF8]);
  if (!v3)
  {
    APSLogErrorAt();
    return v3;
  }
  objc_msgSend(v3, "setDispatchQueue:", -[APAdvertiserBTLEManager internalQueue](self, "internalQueue"));
  uint64_t v4 = [(APAdvertiserBTLEManager *)self seed];
  [(APAdvertiserBTLEManager *)self setSeed:(v4 + 1)];
  [v3 setAirplayTargetConfigSeed:v4];
  objc_msgSend(v3, "setAirplayTargetFlags:", objc_msgSend(v3, "airplayTargetFlags") | 2);
  if (self->_p2pSolo) {
    objc_msgSend(v3, "setAirplayTargetFlags:", objc_msgSend(v3, "airplayTargetFlags") | 1);
  }
  BOOL v5 = [(APAdvertiserBTLEManager *)self netInterfaceMonitor];
  if (v5) {
    [(CUNetInterfaceMonitor *)v5 primaryIPv4Addr];
  }
  else {
    long long v7 = 0uLL;
  }
  if (BYTE1(v7) != 2)
  {
LABEL_18:
    [v3 invalidate];

    return 0;
  }
  [v3 setAirplayTargetIPv4:bswap32(DWORD1(v7))];
  if (self->_receiverPort)
  {
    objc_msgSend(v3, "setAirplayTargetPort:");
    objc_msgSend(v3, "setAirplayTargetFlags:", objc_msgSend(v3, "airplayTargetFlags") | 0x10);
  }
  if (![v3 airplayTargetFlags])
  {
    APSLogErrorAt();
    goto LABEL_18;
  }
  if (gLogCategory_APAdvertiserBTLEManager <= 50
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    [v3 airplayTargetFlags];
    [v3 airplayTargetConfigSeed];
    [v3 airplayTargetPort];
    LogPrintF();
  }
  return v3;
}

- (void)invalidate
{
  if (![(APAdvertiserBTLEManager *)self isInvalidated])
  {
    [(APAdvertiserBTLEManager *)self setIsInvalidated:1];
    [(APAdvertiserBTLEManager *)self stop];
    [(CBAdvertiser *)self->_btleAdvertiser invalidate];
    [(CBDiscovery *)self->_btleDiscoverer invalidate];
    [(APAdvertiserBTLEManager *)self setEventHandler:0 withContext:0];
    p2pSoloQueryTimer = self->_p2pSoloQueryTimer;
    if (p2pSoloQueryTimer)
    {
      dispatch_release(p2pSoloQueryTimer);
      self->_p2pSoloQueryTimer = 0;
    }
  }
}

- (void)dealloc
{
  self->_eventContext = 0;
  [(APAdvertiserBTLEManager *)self cleanupEventHandlerState];

  self->_btleAdvertiser = 0;
  self->_btleDiscoverer = 0;

  self->_soloDevices = 0;
  self->_pendingLostLegacyDevices = 0;
  internalQueue = self->_internalQueue;
  if (internalQueue)
  {
    dispatch_release(internalQueue);
    self->_internalQueue = 0;
  }
  eventQueue = self->_eventQueue;
  if (eventQueue)
  {
    dispatch_release(eventQueue);
    self->_eventQueue = 0;
  }
  weakSelf = self->_weakSelf;
  if (weakSelf)
  {
    CFRelease(weakSelf);
    self->_weakSelf = 0;
  }
  int touchSetupActiveNotifyToken = self->_touchSetupActiveNotifyToken;
  if (touchSetupActiveNotifyToken != -1)
  {
    notify_cancel(touchSetupActiveNotifyToken);
    self->_int touchSetupActiveNotifyToken = -1;
  }
  v7.receiver = self;
  v7.super_class = (Class)APAdvertiserBTLEManager;
  [(APAdvertiserBTLEManager *)&v7 dealloc];
}

- (APAdvertiserBTLEManager)initWithEventContext:(void *)a3
{
  id v3 = self;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  if (!a3)
  {
    APSLogErrorAt();
    uint64_t v16 = v22;
    int v17 = -6705;
LABEL_19:
    *((_DWORD *)v16 + 6) = v17;
    goto LABEL_10;
  }
  v20.receiver = self;
  v20.super_class = (Class)APAdvertiserBTLEManager;
  BOOL v5 = [(APAdvertiserBTLEManager *)&v20 init];
  id v3 = v5;
  if (!v5) {
    goto LABEL_10;
  }
  v5->_eventContext = a3;
  uint64_t v6 = FigCFWeakReferenceHolderCreateWithReferencedObject();
  v3->_weakSelf = (OpaqueFigCFWeakReferenceHolder *)v6;
  if (!v6) {
    goto LABEL_18;
  }
  dispatch_queue_t v7 = dispatch_queue_create("APAdvertiserBTLEManagerInternalQueue", 0);
  v3->_internalQueue = (OS_dispatch_queue *)v7;
  if (!v7
    || (dispatch_queue_t v8 = dispatch_queue_create("APAdvertiserBTLEManagerEventQueue", 0),
        (v3->_eventQueue = (OS_dispatch_queue *)v8) == 0)
    || (uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]), (v3->_soloDevices = v9) == 0)
    || (BOOL v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]), (v3->_pendingLostLegacyDevices = v10) == 0))
  {
LABEL_18:
    APSLogErrorAt();
    uint64_t v16 = v22;
    int v17 = -72312;
    goto LABEL_19;
  }
  int v11 = [(APAdvertiserBTLEManager *)v3 setupEventHandlerState];
  *((_DWORD *)v22 + 6) = v11;
  if (v11)
  {
    APSLogErrorAt();
  }
  else
  {
    internalQueue = v3->_internalQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __48__APAdvertiserBTLEManager_initWithEventContext___block_invoke;
    handler[3] = &unk_2648960A0;
    handler[4] = v3;
    uint32_t v13 = notify_register_dispatch("com.apple.TouchRemote.deviceSetupActive", &v3->_touchSetupActiveNotifyToken, internalQueue, handler);
    *((_DWORD *)v22 + 6) = v13;
    uint64_t v14 = v3->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__APAdvertiserBTLEManager_initWithEventContext___block_invoke_2;
    block[3] = &unk_264896078;
    block[4] = v3;
    void block[5] = &v21;
    dispatch_sync(v14, block);
  }
LABEL_10:
  if (*((_DWORD *)v22 + 6))
  {
    if (gLogCategory_APAdvertiserBTLEManager <= 90
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    id v3 = 0;
  }
  _Block_object_dispose(&v21, 8);
  return v3;
}

uint64_t __48__APAdvertiserBTLEManager_initWithEventContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePreferences];
}

uint64_t __48__APAdvertiserBTLEManager_initWithEventContext___block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) startP2PSoloQueryTimer];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    || (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) updatePreferences], uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), result))
  {
    return APSLogErrorAt();
  }
  return result;
}

+ (id)stringForBTLEState:(int64_t)a3
{
  if ((unint64_t)a3 < 6) {
    return off_264896218[a3];
  }
  if (gLogCategory_APAdvertiserBTLEManager <= 60
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return @"unknown";
}

+ (id)stringForBTLEMode:(unsigned __int16)a3
{
  if (!a3) {
    return @"None";
  }
  if (a3 == 1) {
    return @"Discoverable";
  }
  if (gLogCategory_APAdvertiserBTLEManager <= 60
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return @"Unknown ";
}

@end