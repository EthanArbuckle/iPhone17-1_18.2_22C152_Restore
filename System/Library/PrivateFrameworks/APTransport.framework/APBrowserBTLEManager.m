@interface APBrowserBTLEManager
+ (id)stringForBTLEMode:(unsigned __int16)a3;
+ (id)stringForBTLEState:(int64_t)a3;
+ (int)createEventInfoDictionary:(id *)a3 withDeviceID:(id)a4 IPAddress:(id)a5 port:(id)a6 supportsSolo:(id)a7 rssi:(id)a8;
- (APBrowserBTLEManager)initWithEventContext:(void *)a3;
- (BOOL)browseForAltReceiver;
- (BOOL)isAdvertising;
- (BOOL)isEnabled;
- (BOOL)isInvalidated;
- (BOOL)isScanning;
- (BOOL)isSoloBeaconDisabled;
- (BOOL)preferencesUpdated;
- (BOOL)shouldAdvertiseSourcePresence;
- (CBAdvertiser)btleAdvertiser;
- (CBDiscovery)btleDiscoverer;
- (NSMutableDictionary)btleDevices;
- (OS_dispatch_queue)eventQueue;
- (OS_dispatch_queue)queue;
- (const)btleDiscoveryManagerToken;
- (id)createBTLEAdvertiser;
- (id)createBTLEDiscoverer;
- (int)btleAdvertiserSeed;
- (int)btleDiscovererSeed;
- (int)copyShowInfo:(id *)a3 verbose:(BOOL)a4;
- (int)dispatchEvent:(unsigned int)a3 withEventInfo:(id)a4;
- (int)ensureAdvertisingStarted;
- (int)ensureAdvertisingStopped;
- (int)ensureAdvertisingStoppedWithSeed:(int)a3;
- (int)ensurePreferencesUpdatedWithShouldForce:(BOOL)a3;
- (int)ensureScanningStarted;
- (int)ensureScanningStopped;
- (int)ensureScanningStoppedWithSeed:(int)a3;
- (int)getBTLEMode:(unsigned __int16 *)a3;
- (int)handleFoundDevice:(id)a3;
- (int)handleLostDevice:(id)a3;
- (int)invalidate;
- (int)setBTLEMode:(unsigned __int16)a3;
- (int)setEventHandler:(void *)a3 context:(void *)a4 managerRef:(OpaqueAPBrowserBTLEManager *)a5;
- (int)setSupportsSolo:(BOOL)a3;
- (int)startMode:(unsigned __int16)a3;
- (int)stop;
- (int)update;
- (int64_t)btleManagerState;
- (unint64_t)nearbySoloDevicesCount;
- (void)dealloc;
- (void)eventHandlerContext;
- (void)eventHandlerFunc;
- (void)setBrowseForAltReceiver:(BOOL)a3;
- (void)setBtleAdvertiser:(id)a3;
- (void)setBtleAdvertiserSeed:(int)a3;
- (void)setBtleDevices:(id)a3;
- (void)setBtleDiscoverer:(id)a3;
- (void)setBtleDiscovererSeed:(int)a3;
- (void)setBtleDiscoveryManagerToken:(const void *)a3;
- (void)setEventHandlerContext:(void *)a3;
- (void)setEventHandlerFunc:(void *)a3;
- (void)setIsAdvertising:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsInvalidated:(BOOL)a3;
- (void)setIsScanning:(BOOL)a3;
- (void)setIsSoloBeaconDisabled:(BOOL)a3;
- (void)setPreferencesUpdated:(BOOL)a3;
@end

@implementation APBrowserBTLEManager

- (id)createBTLEDiscoverer
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BD48]);
  if (v3)
  {
    objc_msgSend(v3, "setDispatchQueue:", -[APBrowserBTLEManager queue](self, "queue"));
    objc_msgSend(v3, "setDiscoveryFlags:", objc_msgSend(v3, "discoveryFlags") | 0x8000000000);
    v4 = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__APBrowserBTLEManager_createBTLEDiscoverer__block_invoke;
    v8[3] = &unk_1E688ACC0;
    v8[4] = v4;
    [v3 setDeviceFoundHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__APBrowserBTLEManager_createBTLEDiscoverer__block_invoke_2;
    v7[3] = &unk_1E688ACC0;
    v7[4] = v4;
    [v3 setDeviceLostHandler:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__APBrowserBTLEManager_createBTLEDiscoverer__block_invoke_3;
    v6[3] = &unk_1E688AC98;
    v6[4] = v4;
    [v3 setInvalidationHandler:v6];
  }
  else
  {
    APSLogErrorAt();
  }
  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int)ensurePreferencesUpdatedWithShouldForce:(BOOL)a3
{
  if ([(APBrowserBTLEManager *)self isInvalidated]) {
    return -72224;
  }
  if (!a3 && [(APBrowserBTLEManager *)self preferencesUpdated]) {
    return 0;
  }
  BOOL v13 = APSIsDemoModeEnabled() == 0;
  int BooleanIfPresent = APSSettingsGetBooleanIfPresent();
  if (gLogCategory_APBrowserBTLEManager <= 50)
  {
    int v6 = BooleanIfPresent;
    if (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize())
    {
      v7 = "yes";
      if (v13) {
        v8 = "yes";
      }
      else {
        v8 = "no";
      }
      if (!v6) {
        v7 = "no";
      }
      v11 = v8;
      v12 = v7;
      LogPrintF();
    }
  }
  -[APBrowserBTLEManager setIsEnabled:](self, "setIsEnabled:", v13, v11, v12);
  [(APBrowserBTLEManager *)self setIsSoloBeaconDisabled:0];
  int v9 = [(APBrowserBTLEManager *)self update];
  if (v9) {
    APSLogErrorAt();
  }
  else {
    [(APBrowserBTLEManager *)self setPreferencesUpdated:1];
  }
  return v9;
}

- (int)setBTLEMode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if ([(APBrowserBTLEManager *)self isInvalidated]) {
    return -72224;
  }
  if (self->_btleMode == v3) {
    return 0;
  }
  if ((v3 - 1) >= 2)
  {
    if (v3)
    {
      if (gLogCategory_APBrowserBTLEManager <= 90
        && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return -6705;
    }
    else
    {
      int v5 = [(APBrowserBTLEManager *)self stop];
      if (v5) {
LABEL_8:
      }
        APSLogErrorAt();
    }
  }
  else
  {
    int v5 = [(APBrowserBTLEManager *)self startMode:v3];
    if (v5) {
      goto LABEL_8;
    }
  }
  return v5;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (int)startMode:(unsigned __int16)a3
{
  if (!a3)
  {
    APSLogErrorAt();
    return -72221;
  }
  uint64_t v3 = a3;
  if (self->_btleMode == a3) {
    return 0;
  }
  int v5 = [(APBrowserBTLEManager *)self ensurePreferencesUpdatedWithShouldForce:0];
  if (v5)
  {
    int v6 = v5;
LABEL_13:
    APSLogErrorAt();
    return v6;
  }
  if (gLogCategory_APBrowserBTLEManager <= 40
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    id v8 = +[APBrowserBTLEManager stringForBTLEMode:v3];
    LogPrintF();
  }
  self->_btleMode = v3;
  int v6 = [(APBrowserBTLEManager *)self update];
  if (v6) {
    goto LABEL_13;
  }
  return v6;
}

- (int)update
{
  if ([(APBrowserBTLEManager *)self isEnabled] && self->_btleMode)
  {
    if ([(APBrowserBTLEManager *)self isEnabled] && self->_btleMode)
    {
      int v3 = [(APBrowserBTLEManager *)self ensureScanningStarted];
      if (v3)
      {
        int v5 = v3;
        goto LABEL_25;
      }
      if (!APSIsAPMSpeaker())
      {
        if (self->_btleMode == 2
          && self->_p2pSoloSupported
          && ![(APBrowserBTLEManager *)self isSoloBeaconDisabled]
          && [(APBrowserBTLEManager *)self shouldAdvertiseSourcePresence])
        {
          int v4 = [(APBrowserBTLEManager *)self ensureAdvertisingStarted];
          if (v4)
          {
            int v5 = v4;
LABEL_25:
            APSLogErrorAt();
            return v5;
          }
        }
        else
        {
          int v9 = [(APBrowserBTLEManager *)self ensureAdvertisingStopped];
          if (v9)
          {
            int v5 = v9;
            goto LABEL_25;
          }
        }
      }
    }
  }
  else
  {
    int v6 = [(APBrowserBTLEManager *)self ensureAdvertisingStopped];
    if (v6)
    {
      int v5 = v6;
      goto LABEL_25;
    }
    int v7 = [(APBrowserBTLEManager *)self ensureScanningStopped];
    if (v7)
    {
      int v5 = v7;
      goto LABEL_25;
    }
  }
  if (gLogCategory_APBrowserBTLEManager <= 10
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    [(APBrowserBTLEManager *)self isSoloBeaconDisabled];
    [(APBrowserBTLEManager *)self nearbySoloDevicesCount];
    LogPrintF();
  }
  return 0;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)preferencesUpdated
{
  return self->_preferencesUpdated;
}

- (int)ensureScanningStarted
{
  if (![(APBrowserBTLEManager *)self isScanning])
  {
    [(APBrowserBTLEManager *)self setBtleDiscoverer:[(APBrowserBTLEManager *)self createBTLEDiscoverer]];
    if (![(APBrowserBTLEManager *)self btleDiscoverer])
    {
      APSLogErrorAt();
      [(APBrowserBTLEManager *)self ensureScanningStopped];
      return -72220;
    }
    [(APBrowserBTLEManager *)self setIsScanning:1];
    if (gLogCategory_APBrowserBTLEManager <= 50
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v3 = self;
    uint64_t v4 = [(APBrowserBTLEManager *)self btleDiscovererSeed] + 1;
    [(APBrowserBTLEManager *)self setBtleDiscovererSeed:v4];
    int v5 = [(APBrowserBTLEManager *)self btleDiscoverer];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__APBrowserBTLEManager_ensureScanningStarted__block_invoke;
    v7[3] = &unk_1E688AD10;
    v7[4] = v3;
    int v8 = v4;
    [(CBDiscovery *)v5 activateWithCompletion:v7];
  }
  return 0;
}

- (CBDiscovery)btleDiscoverer
{
  return self->_btleDiscoverer;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (void)setBtleDiscovererSeed:(int)a3
{
  self->_btleDiscovererSeed = a3;
}

- (void)setBtleDiscoverer:(id)a3
{
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (int)ensureAdvertisingStopped
{
  uint64_t v3 = [(APBrowserBTLEManager *)self btleAdvertiserSeed];
  return [(APBrowserBTLEManager *)self ensureAdvertisingStoppedWithSeed:v3];
}

- (int)ensureAdvertisingStoppedWithSeed:(int)a3
{
  if ([(APBrowserBTLEManager *)self btleAdvertiserSeed] == a3)
  {
    if ([(APBrowserBTLEManager *)self isAdvertising]
      && gLogCategory_APBrowserBTLEManager <= 50
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(CBAdvertiser *)[(APBrowserBTLEManager *)self btleAdvertiser] invalidate];

    [(APBrowserBTLEManager *)self setBtleAdvertiser:0];
    [(APBrowserBTLEManager *)self setIsAdvertising:0];
  }
  return 0;
}

- (CBAdvertiser)btleAdvertiser
{
  return self->_btleAdvertiser;
}

- (int)btleAdvertiserSeed
{
  return self->_btleAdvertiserSeed;
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (void)setBtleAdvertiser:(id)a3
{
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (int)btleDiscovererSeed
{
  return self->_btleDiscovererSeed;
}

+ (id)stringForBTLEMode:(unsigned __int16)a3
{
  if (a3 < 3u) {
    return off_1E688AD58[(__int16)a3];
  }
  if (gLogCategory_APBrowserBTLEManager <= 60
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return @"Unknown";
}

void __45__APBrowserBTLEManager_ensureScanningStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (gLogCategory_APBrowserBTLEManager <= 90
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "ensureScanningStoppedWithSeed:", *(unsigned int *)(a1 + 40), a2);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "ensureScanningStoppedWithSeed:", *(unsigned int *)(a1 + 40), v5);
    }
  }
  else if (gLogCategory_APBrowserBTLEManager <= 50 {
         && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  uint64_t v4 = *(void **)(a1 + 32);
}

- (APBrowserBTLEManager)initWithEventContext:(void *)a3
{
  uint64_t v3 = self;
  if (!a3) {
    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)APBrowserBTLEManager;
  uint64_t v5 = [(APBrowserBTLEManager *)&v10 init];
  uint64_t v3 = v5;
  if (v5)
  {
    v5->_eventContext = a3;
    dispatch_queue_t v6 = dispatch_queue_create("APBrowserBTLEManagerInternalQueue", 0);
    v3->_queue = (OS_dispatch_queue *)v6;
    if (!v6
      || (dispatch_queue_t v7 = dispatch_queue_create("APBrowserBTLEManagerEventQueue", 0),
          (v3->_eventQueue = (OS_dispatch_queue *)v7) == 0)
      || (int v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]), (v3->_btleDevices = v8) == 0))
    {
LABEL_7:
      APSLogErrorAt();
      if (gLogCategory_APBrowserBTLEManager <= 90
        && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  self->_eventContext = 0;

  self->_btleAdvertiser = 0;
  self->_btleDiscoverer = 0;

  self->_btleDevices = 0;
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  eventQueue = self->_eventQueue;
  if (eventQueue)
  {
    dispatch_release(eventQueue);
    self->_eventQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)APBrowserBTLEManager;
  [(APBrowserBTLEManager *)&v5 dealloc];
}

- (int)invalidate
{
  if ([(APBrowserBTLEManager *)self isInvalidated]) {
    return -72224;
  }
  [(APBrowserBTLEManager *)self setIsInvalidated:1];
  [(APBrowserBTLEManager *)self stop];
  int v3 = [(APBrowserBTLEManager *)self dispatchEvent:4 withEventInfo:0];
  [(CBAdvertiser *)[(APBrowserBTLEManager *)self btleAdvertiser] invalidate];
  [(CBDiscovery *)[(APBrowserBTLEManager *)self btleDiscoverer] invalidate];
  uint64_t v4 = [(APBrowserBTLEManager *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__APBrowserBTLEManager_invalidate__block_invoke;
  block[3] = &unk_1E688AC98;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)v4, block);
  return v3;
}

uint64_t __34__APBrowserBTLEManager_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEventHandlerFunc:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setEventHandlerContext:0];
}

- (id)createBTLEAdvertiser
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BD10]);
  if (v3)
  {
    objc_msgSend(v3, "setDispatchQueue:", -[APBrowserBTLEManager queue](self, "queue"));
    [v3 setAirplaySourceFlags:18];
    if (APSSettingsGetInt64()) {
      objc_msgSend(v3, "setAirplaySourceFlags:", objc_msgSend(v3, "airplaySourceFlags") | 1);
    }
    if ([(APBrowserBTLEManager *)self browseForAltReceiver]) {
      objc_msgSend(v3, "setAirplaySourceFlags:", objc_msgSend(v3, "airplaySourceFlags") | 4);
    }
    if (APSIsProximitySenderEnabled()) {
      objc_msgSend(v3, "setAirplaySourceFlags:", objc_msgSend(v3, "airplaySourceFlags") | 8);
    }
    if (gLogCategory_APBrowserBTLEManager <= 40
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      [v3 airplaySourceFlags];
      LogPrintF();
    }
  }
  else
  {
    APSLogErrorAt();
  }
  return v3;
}

uint64_t __44__APBrowserBTLEManager_createBTLEDiscoverer__block_invoke(uint64_t a1, void *a2)
{
  char v4 = [a2 airplayTargetFlags];
  objc_super v5 = *(void **)(a1 + 32);
  if (v4 < 0)
  {
    return [v5 handleLostDevice:a2];
  }
  else
  {
    return [v5 handleFoundDevice:a2];
  }
}

uint64_t __44__APBrowserBTLEManager_createBTLEDiscoverer__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleLostDevice:a2];
}

void __44__APBrowserBTLEManager_createBTLEDiscoverer__block_invoke_3(uint64_t a1)
{
}

- (int)stop
{
  if (!self->_btleMode) {
    return 0;
  }
  if (gLogCategory_APBrowserBTLEManager <= 40
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_btleMode = 0;
  int v3 = [(APBrowserBTLEManager *)self update];
  if (v3)
  {
    int v4 = v3;
    goto LABEL_11;
  }
  int v4 = [(APBrowserBTLEManager *)self dispatchEvent:3 withEventInfo:0];
  if (v4) {
LABEL_11:
  }
    APSLogErrorAt();
  return v4;
}

- (int)setEventHandler:(void *)a3 context:(void *)a4 managerRef:(OpaqueAPBrowserBTLEManager *)a5
{
  int v8 = -72224;
  if (![(APBrowserBTLEManager *)self isInvalidated])
  {
    if (self->_btleMode)
    {
      APSLogErrorAt();
      return -72223;
    }
    else
    {
      int v9 = [(APBrowserBTLEManager *)self eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__APBrowserBTLEManager_setEventHandler_context_managerRef___block_invoke;
      block[3] = &unk_1E688ACE8;
      block[4] = self;
      void block[5] = a3;
      block[6] = a4;
      dispatch_sync((dispatch_queue_t)v9, block);
      return 0;
    }
  }
  return v8;
}

uint64_t __59__APBrowserBTLEManager_setEventHandler_context_managerRef___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEventHandlerFunc:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = *(void **)(a1 + 32);
  return [v3 setEventHandlerContext:v2];
}

- (unint64_t)nearbySoloDevicesCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = (void *)[(NSMutableDictionary *)[(APBrowserBTLEManager *)self btleDevices] allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v2);
      }
      v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) airplayTargetFlags] & 1;
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (BOOL)shouldAdvertiseSourcePresence
{
  if (!APSIsAPMSpeaker()) {
    return 1;
  }
  APSCopyTightSyncInfo();
  return 0;
}

- (int)setSupportsSolo:(BOOL)a3
{
  int v3 = a3;
  if ([(APBrowserBTLEManager *)self isInvalidated]) {
    return -72224;
  }
  self->_p2pSoloSupportedIsSet = 1;
  int p2pSoloSupported = self->_p2pSoloSupported;
  if (p2pSoloSupported == v3) {
    return 0;
  }
  if (gLogCategory_APBrowserBTLEManager <= 40)
  {
    if (gLogCategory_APBrowserBTLEManager != -1)
    {
LABEL_6:
      dispatch_queue_t v7 = "yes";
      if (p2pSoloSupported) {
        int v8 = "yes";
      }
      else {
        int v8 = "no";
      }
      if (!v3) {
        dispatch_queue_t v7 = "no";
      }
      long long v10 = v8;
      long long v11 = v7;
      LogPrintF();
      goto LABEL_13;
    }
    if (_LogCategory_Initialize())
    {
      int p2pSoloSupported = self->_p2pSoloSupported;
      goto LABEL_6;
    }
  }
LABEL_13:
  self->_int p2pSoloSupported = v3;
  int v6 = [(APBrowserBTLEManager *)self update];
  if (v6) {
    APSLogErrorAt();
  }
  return v6;
}

- (int)getBTLEMode:(unsigned __int16 *)a3
{
  if ([(APBrowserBTLEManager *)self isInvalidated]) {
    return -72224;
  }
  int result = 0;
  *a3 = self->_btleMode;
  return result;
}

- (int)ensureAdvertisingStarted
{
  if (![(APBrowserBTLEManager *)self isAdvertising])
  {
    [(APBrowserBTLEManager *)self setBtleAdvertiser:[(APBrowserBTLEManager *)self createBTLEAdvertiser]];
    if (![(APBrowserBTLEManager *)self btleAdvertiser])
    {
      APSLogErrorAt();
      [(APBrowserBTLEManager *)self ensureAdvertisingStopped];
      return -72220;
    }
    [(APBrowserBTLEManager *)self setIsAdvertising:1];
    if (gLogCategory_APBrowserBTLEManager <= 50
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v3 = self;
    uint64_t v4 = [(APBrowserBTLEManager *)self btleAdvertiserSeed] + 1;
    [(APBrowserBTLEManager *)self setBtleAdvertiserSeed:v4];
    unint64_t v5 = [(APBrowserBTLEManager *)self btleAdvertiser];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__APBrowserBTLEManager_ensureAdvertisingStarted__block_invoke;
    v7[3] = &unk_1E688AD10;
    v7[4] = v3;
    int v8 = v4;
    [(CBAdvertiser *)v5 activateWithCompletion:v7];
  }
  return 0;
}

void __48__APBrowserBTLEManager_ensureAdvertisingStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (gLogCategory_APBrowserBTLEManager <= 90
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "ensureAdvertisingStoppedWithSeed:", *(unsigned int *)(a1 + 40), a2);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "ensureAdvertisingStoppedWithSeed:", *(unsigned int *)(a1 + 40), v5);
    }
  }
  else if (gLogCategory_APBrowserBTLEManager <= 50 {
         && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  uint64_t v4 = *(void **)(a1 + 32);
}

- (int)ensureScanningStopped
{
  uint64_t v3 = [(APBrowserBTLEManager *)self btleDiscovererSeed];
  return [(APBrowserBTLEManager *)self ensureScanningStoppedWithSeed:v3];
}

- (int)ensureScanningStoppedWithSeed:(int)a3
{
  if ([(APBrowserBTLEManager *)self btleDiscovererSeed] == a3)
  {
    if ([(APBrowserBTLEManager *)self isScanning]
      && gLogCategory_APBrowserBTLEManager <= 50
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(CBDiscovery *)[(APBrowserBTLEManager *)self btleDiscoverer] invalidate];

    [(APBrowserBTLEManager *)self setBtleDiscoverer:0];
    [(APBrowserBTLEManager *)self setIsScanning:0];
    [(NSMutableDictionary *)[(APBrowserBTLEManager *)self btleDevices] removeAllObjects];
  }
  return 0;
}

- (int)dispatchEvent:(unsigned int)a3 withEventInfo:(id)a4
{
  objc_initWeak(&location, self);
  dispatch_queue_t v7 = [(APBrowserBTLEManager *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__APBrowserBTLEManager_dispatchEvent_withEventInfo___block_invoke;
  block[3] = &unk_1E688AD38;
  objc_copyWeak(&v10, &location);
  unsigned int v11 = a3;
  block[4] = self;
  void block[5] = a4;
  dispatch_async((dispatch_queue_t)v7, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return 0;
}

uint64_t __52__APBrowserBTLEManager_dispatchEvent_withEventInfo___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t result = [Weak eventHandlerFunc];
  if (result)
  {
    int v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))[Weak eventHandlerFunc];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
    uint64_t v6 = *(unsigned int *)(a1 + 56);
    uint64_t v7 = [Weak eventHandlerContext];
    return v8(v5, v6, v4, v7);
  }
  return result;
}

+ (int)createEventInfoDictionary:(id *)a3 withDeviceID:(id)a4 IPAddress:(id)a5 port:(id)a6 supportsSolo:(id)a7 rssi:(id)a8
{
  if (a4)
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
    if (v14)
    {
      v15 = v14;
      [v14 setObject:a4 forKeyedSubscript:@"deviceID"];
      if (a5) {
        [v15 setObject:a5 forKeyedSubscript:@"ipAddress"];
      }
      if (a6) {
        [v15 setObject:a6 forKeyedSubscript:@"port"];
      }
      if (a7) {
        [v15 setObject:a7 forKeyedSubscript:@"supportsSolo"];
      }
      if (a8) {
        [v15 setObject:a8 forKeyedSubscript:@"rssi"];
      }
      int v16 = 0;
      *a3 = v15;
    }
    else
    {
      APSLogErrorAt();
      return -72220;
    }
  }
  else
  {
    int v16 = -72221;
    APSLogErrorAt();
  }
  return v16;
}

- (int)handleFoundDevice:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v33 = 0;
  memset(v34, 0, sizeof(v34));
  if (!self->_btleMode)
  {
LABEL_32:
    int v20 = 0;
    goto LABEL_22;
  }
  [a3 airplayTargetIPv4];
  IPv4AddressToCString();
  uint64_t v5 = [a3 airplayTargetPort];
  if (!v5)
  {
    if (([a3 airplayTargetFlags] & 2) != 0) {
      uint64_t v5 = 7000;
    }
    else {
      uint64_t v5 = 5000;
    }
  }
  if (gLogCategory_APBrowserBTLEManager <= 40
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = [a3 identifier];
    uint64_t v28 = [a3 airplayTargetFlags];
    v30 = &unk_1D093C36C;
    v24 = v34;
    uint64_t v26 = v5;
    uint64_t v22 = v6;
    LogPrintF();
  }
  if (!objc_msgSend(a3, "airplayTargetIPv4", v22, v24, v26, v28, v30)
    && ![a3 airplayTargetFlags])
  {
    if (gLogCategory_APBrowserBTLEManager <= 40
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_32;
  }
  if (gLogCategory_APBrowserBTLEManager <= 10
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = [a3 identifier];
    uint64_t v8 = [a3 bleRSSI];
    unsigned int v9 = [a3 airplayTargetFlags];
    uint64_t v31 = [a3 airplayTargetConfigSeed];
    v32 = v34;
    uint64_t v27 = v9;
    v29 = &unk_1D093C36C;
    uint64_t v23 = v7;
    uint64_t v25 = v8;
    LogPrintF();
  }
  id v10 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](-[APBrowserBTLEManager btleDevices](self, "btleDevices", v23, v25, v27, v29, v31, v32), "objectForKeyedSubscript:", [a3 identifier]);
  int v11 = [a3 airplayTargetConfigSeed];
  int v12 = [v10 airplayTargetConfigSeed];
  -[NSMutableDictionary setObject:forKeyedSubscript:](-[APBrowserBTLEManager btleDevices](self, "btleDevices"), "setObject:forKeyedSubscript:", a3, [a3 identifier]);
  if (!v10 || v11 != v12)
  {
    uint64_t v13 = [NSString stringWithUTF8String:v34];
    if (!v13)
    {
      APSLogErrorAt();
      int v20 = -72222;
      goto LABEL_22;
    }
    uint64_t v14 = v13;
    uint64_t v15 = [a3 identifier];
    uint64_t v16 = [NSNumber numberWithUnsignedShort:v5];
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "airplayTargetFlags") & 1);
    int v18 = +[APBrowserBTLEManager createEventInfoDictionary:withDeviceID:IPAddress:port:supportsSolo:rssi:](APBrowserBTLEManager, "createEventInfoDictionary:withDeviceID:IPAddress:port:supportsSolo:rssi:", &v33, v15, v14, v16, v17, objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "bleRSSI")));
    if (v18)
    {
      int v20 = v18;
    }
    else
    {
      int v19 = [(APBrowserBTLEManager *)self dispatchEvent:v10 != 0 withEventInfo:v33];
      if (!v19) {
        goto LABEL_21;
      }
      int v20 = v19;
    }
LABEL_27:
    APSLogErrorAt();
    goto LABEL_22;
  }
LABEL_21:
  int v20 = [(APBrowserBTLEManager *)self update];
  if (v20) {
    goto LABEL_27;
  }
LABEL_22:

  return v20;
}

- (int)handleLostDevice:(id)a3
{
  id v17 = 0;
  if (!self->_btleMode
    || !-[NSMutableDictionary objectForKey:](-[APBrowserBTLEManager btleDevices](self, "btleDevices"), "objectForKey:", [a3 identifier]))
  {
    int v9 = 0;
    goto LABEL_14;
  }
  if (gLogCategory_APBrowserBTLEManager <= 40
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = [a3 identifier];
    uint64_t v13 = [a3 airplayTargetFlags];
    uint64_t v15 = &unk_1D093C36C;
    uint64_t v11 = v5;
    LogPrintF();
  }
  int v6 = +[APBrowserBTLEManager createEventInfoDictionary:withDeviceID:IPAddress:port:supportsSolo:rssi:](APBrowserBTLEManager, "createEventInfoDictionary:withDeviceID:IPAddress:port:supportsSolo:rssi:", &v17, objc_msgSend(a3, "identifier", v11, v13, v15), 0, 0, 0, 0);
  if (v6)
  {
    int v9 = v6;
LABEL_18:
    APSLogErrorAt();
    goto LABEL_14;
  }
  int v7 = [(APBrowserBTLEManager *)self dispatchEvent:2 withEventInfo:v17];
  if (v7)
  {
    int v9 = v7;
    goto LABEL_18;
  }
  -[NSMutableDictionary removeObjectForKey:](-[APBrowserBTLEManager btleDevices](self, "btleDevices"), "removeObjectForKey:", [a3 identifier]);
  if (gLogCategory_APBrowserBTLEManager <= 40
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = [a3 identifier];
    uint64_t v14 = [(NSMutableDictionary *)[(APBrowserBTLEManager *)self btleDevices] count];
    unint64_t v16 = [(APBrowserBTLEManager *)self nearbySoloDevicesCount];
    uint64_t v12 = v8;
    LogPrintF();
  }
  int v9 = [(APBrowserBTLEManager *)self update];
  if (v9) {
    goto LABEL_18;
  }
LABEL_14:

  return v9;
}

+ (id)stringForBTLEState:(int64_t)a3
{
  if ((unint64_t)a3 < 6) {
    return off_1E688AD70[a3];
  }
  if (gLogCategory_APBrowserBTLEManager <= 60
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return @"unknown";
}

- (int64_t)btleManagerState
{
  if ([(APBrowserBTLEManager *)self btleAdvertiser])
  {
    int64_t result = [(APBrowserBTLEManager *)self btleAdvertiser];
    if (!result) {
      return result;
    }
  }
  else
  {
    int64_t result = [(APBrowserBTLEManager *)self btleDiscoverer];
    if (!result) {
      return result;
    }
  }
  return [(id)result bluetoothState];
}

- (int)copyShowInfo:(id *)a3 verbose:(BOOL)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v6 = -72224;
  memset(v33, 0, sizeof(v33));
  if (![(APBrowserBTLEManager *)self isInvalidated])
  {
    int v7 = [(APBrowserBTLEManager *)self ensurePreferencesUpdatedWithShouldForce:0];
    if (v7)
    {
      int v25 = v7;
      APSLogErrorAt();
      return v25;
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      if (v8)
      {
        int v9 = v8;
        uint64_t v26 = a3;
        [v8 appendString:@"+-+ APBrowserBTLEManager state +-+\n"];
        [v9 appendString:@"\n"];
        if ([(APBrowserBTLEManager *)self isEnabled]) {
          id v10 = "yes";
        }
        else {
          id v10 = "no";
        }
        objc_msgSend(v9, "appendFormat:", @"BTLE: enabled=%s", v10);
        if (self->_p2pSoloSupportedIsSet)
        {
          if (self->_p2pSoloSupported) {
            uint64_t v11 = "yes";
          }
          else {
            uint64_t v11 = "no";
          }
        }
        else
        {
          uint64_t v11 = "<not set, assuming no>";
        }
        objc_msgSend(v9, "appendFormat:", @" soloSupported=%s", v11);
        if ([(APBrowserBTLEManager *)self isSoloBeaconDisabled]) {
          uint64_t v12 = "yes";
        }
        else {
          uint64_t v12 = "no";
        }
        objc_msgSend(v9, "appendFormat:", @" beaconDisabled=%s", v12);
        [v9 appendFormat:@" mode=%@", +[APBrowserBTLEManager stringForBTLEMode:](APBrowserBTLEManager, "stringForBTLEMode:", self->_btleMode)];
        [v9 appendFormat:@" coreBluetoothState=%@", +[APBrowserBTLEManager stringForBTLEState:](APBrowserBTLEManager, "stringForBTLEState:", -[APBrowserBTLEManager btleManagerState](self, "btleManagerState"))];
        if ([(APBrowserBTLEManager *)self isAdvertising]) {
          uint64_t v13 = "yes";
        }
        else {
          uint64_t v13 = "no";
        }
        objc_msgSend(v9, "appendFormat:", @" advertising=%s", v13);
        if ([(APBrowserBTLEManager *)self isScanning]) {
          uint64_t v14 = "yes";
        }
        else {
          uint64_t v14 = "no";
        }
        objc_msgSend(v9, "appendFormat:", @" scanning=%s", v14);
        uint64_t v15 = [(NSMutableDictionary *)[(APBrowserBTLEManager *)self btleDevices] count];
        objc_msgSend(v9, "appendFormat:", @" targetBeaconsNearby=%d", v15);
        if (v15)
        {
          objc_msgSend(v9, "appendFormat:", @" (%d support Solo)", -[APBrowserBTLEManager nearbySoloDevicesCount](self, "nearbySoloDevicesCount"));
          [v9 appendString:@"\n"];
          [v9 appendString:@"Detected BTLE Target Presence beacons:\n"];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id obj = (id)[(NSMutableDictionary *)[(APBrowserBTLEManager *)self btleDevices] allValues];
          uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v29;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v29 != v18) {
                  objc_enumerationMutation(obj);
                }
                int v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                [v9 appendFormat:@"    %@:", objc_msgSend(v20, "identifier")];
                objc_msgSend(v9, "appendFormat:", @" supportsSolo=%d", objc_msgSend(v20, "airplayTargetFlags") & 1);
                objc_msgSend(v9, "appendFormat:", @" supportsMediaControlPort=%d", (objc_msgSend(v20, "airplayTargetFlags") >> 1) & 1);
                [v20 airplayTargetIPv4];
                IPv4AddressToCString();
                [v20 airplayTargetFlags];
                uint64_t v21 = CUPrintFlags32();
                uint64_t v22 = [v20 airplayTargetConfigSeed];
                unsigned int v23 = [v20 airplayTargetPort];
                if (!v23)
                {
                  if (([v20 airplayTargetFlags] & 2) != 0) {
                    unsigned int v23 = 7000;
                  }
                  else {
                    unsigned int v23 = 5000;
                  }
                }
                [v9 appendFormat:@" data=<flags=%@ config=%-3u IPv4=%-15s Port=%-5hu>\n", v21, v22, v33, v23];
              }
              uint64_t v17 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
            }
            while (v17);
          }
        }
        else
        {
          [v9 appendString:@"\n"];
        }
        int v6 = 0;
        *uint64_t v26 = v9;
      }
      else
      {
        APSLogErrorAt();
        return -72220;
      }
    }
  }
  return v6;
}

- (void)setBtleAdvertiserSeed:(int)a3
{
  self->_btleAdvertiserSeed = a3;
}

- (BOOL)browseForAltReceiver
{
  return self->_browseForAltReceiver;
}

- (void)setBrowseForAltReceiver:(BOOL)a3
{
  self->_browseForAltReceiver = a3;
}

- (void)eventHandlerContext
{
  return self->_eventHandlerContext;
}

- (void)setEventHandlerContext:(void *)a3
{
  self->_eventHandlerContext = a3;
}

- (void)eventHandlerFunc
{
  return self->_eventHandlerFunc;
}

- (void)setEventHandlerFunc:(void *)a3
{
  self->_eventHandlerFunc = a3;
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (void)setPreferencesUpdated:(BOOL)a3
{
  self->_preferencesUpdated = a3;
}

- (NSMutableDictionary)btleDevices
{
  return self->_btleDevices;
}

- (void)setBtleDevices:(id)a3
{
}

- (void)setIsInvalidated:(BOOL)a3
{
  self->_isInvalidated = a3;
}

- (BOOL)isSoloBeaconDisabled
{
  return self->_isSoloBeaconDisabled;
}

- (void)setIsSoloBeaconDisabled:(BOOL)a3
{
  self->_isSoloBeaconDisabled = a3;
}

- (const)btleDiscoveryManagerToken
{
  return self->_btleDiscoveryManagerToken;
}

- (void)setBtleDiscoveryManagerToken:(const void *)a3
{
  self->_btleDiscoveryManagerToken = a3;
}

@end