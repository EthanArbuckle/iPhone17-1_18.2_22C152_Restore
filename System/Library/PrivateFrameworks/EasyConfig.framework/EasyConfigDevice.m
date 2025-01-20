@interface EasyConfigDevice
+ (BOOL)supportedScanRecord:(id)a3;
+ (id)deviceWithInfo:(id)a3;
+ (id)deviceWithScanRecord:(id)a3;
- (BOOL)pausesAfterApply;
- (BOOL)removed:(id)a3;
- (BOOL)skipPairSetup;
- (BOOL)updated:(id)a3;
- (EasyConfigDevice)init;
- (NSDictionary)configuration;
- (NSString)model;
- (NSString)name;
- (OS_dispatch_queue)dispatchQueue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)progressHandler;
- (int)_applyConfigStart;
- (int)_configureStart:(id)a3;
- (int)_findDevicePostConfigStart;
- (int)_findDevicePreConfigStart;
- (int)_mfiSAPNext:(HTTPMessagePrivate *)a3;
- (int)_mfiSAPStart;
- (int)_pairSetupNext:(HTTPMessagePrivate *)a3;
- (int)_pairSetupStart;
- (int)_pairVerifyNext:(HTTPMessagePrivate *)a3;
- (int)_pairVerifyStart;
- (int)_setupClient:(id)a3;
- (int)_startBonjourWithTimeout:(int)a3 handler:(id)a4;
- (int)_timeoutTimerStart:(int)a3 block:(id)a4;
- (unint64_t)deviceIdentifier;
- (unint64_t)features;
- (unsigned)pairSetupFlags;
- (unsigned)pairVerifyFlags;
- (void)_applyConfigCompletion:(HTTPMessagePrivate *)a3;
- (void)_findDevicePostConfigEvent:(unsigned int)a3 info:(id)a4;
- (void)_findDevicePreConfigEvent:(unsigned int)a3 info:(id)a4;
- (void)_handleError:(int)a3;
- (void)_logEnded;
- (void)_postConfigCheckCompletion:(HTTPMessagePrivate *)a3;
- (void)_postConfigCheckStart:(id)a3;
- (void)_postNote:(id)a3 info:(id)a4;
- (void)_postProgress:(int)a3 info:(id)a4;
- (void)_postProgress:(int)a3 withResponse:(id)a4;
- (void)_start;
- (void)_stop:(int)a3;
- (void)_trySetupCode:(id)a3;
- (void)dealloc;
- (void)resumePostConfig;
- (void)setConfiguration:(id)a3;
- (void)setDeviceIdentifier:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFeatures:(unint64_t)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPairSetupFlags:(unsigned int)a3;
- (void)setPairVerifyFlags:(unsigned int)a3;
- (void)setPairingDelegate:(const void *)a3;
- (void)setPausesAfterApply:(BOOL)a3;
- (void)setPostConfigMetrics:(id *)a3;
- (void)setPreConfigMetrics:(id *)a3;
- (void)setProgressHandler:(id)a3;
- (void)setPromptForSetupCodeHandler:(id)a3;
- (void)setSkipPairSetup:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)trySetupCode:(id)a3;
@end

@implementation EasyConfigDevice

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_configResponse, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong(&self->_promptForSetupCodeBlock, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_hapBonjourInfo, 0);
  objc_storeStrong((id *)&self->_mfiConfigBonjourInfo, 0);
  objc_storeStrong((id *)&self->_raopBonjourInfo, 0);
  objc_storeStrong((id *)&self->_airplayBonjourInfo, 0);
  objc_storeStrong((id *)&self->_scanRecord, 0);
  objc_storeStrong((id *)&self->_userQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setSkipPairSetup:(BOOL)a3
{
  self->_skipPairSetup = a3;
}

- (BOOL)skipPairSetup
{
  return self->_skipPairSetup;
}

- (void)setPausesAfterApply:(BOOL)a3
{
  self->_pausesAfterApply = a3;
}

- (BOOL)pausesAfterApply
{
  return self->_pausesAfterApply;
}

- (void)setPairVerifyFlags:(unsigned int)a3
{
  self->_pairVerifyFlags = a3;
}

- (unsigned)pairVerifyFlags
{
  return self->_pairVerifyFlags;
}

- (void)setPairSetupFlags:(unsigned int)a3
{
  self->_pairSetupFlags = a3;
}

- (unsigned)pairSetupFlags
{
  return self->_pairSetupFlags;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setModel:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setFeatures:(unint64_t)a3
{
  self->_features = a3;
}

- (unint64_t)features
{
  return self->_features;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_userQueue;
}

- (void)setDeviceIdentifier:(unint64_t)a3
{
  self->_deviceIdentifier = a3;
}

- (unint64_t)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setConfiguration:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (int)_timeoutTimerStart:(int)a3 block:(id)a4
{
  id v6 = a4;
  p_timeoutTimer = (id *)&self->_timeoutTimer;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v9 = timeoutTimer;
    dispatch_source_cancel(v9);
    id v10 = *p_timeoutTimer;
    id *p_timeoutTimer = 0;
  }
  dispatch_source_t v11 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_internalQueue);
  objc_storeStrong(p_timeoutTimer, v11);
  if (v11)
  {
    dispatch_source_set_event_handler(v11, v6);
    dispatch_time_t v12 = dispatch_time(0, 1000000000 * a3);
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_resume(v11);
    int v13 = 0;
  }
  else
  {
    int v13 = -6700;
  }

  return v13;
}

- (int)_startBonjourWithTimeout:(int)a3 handler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (!self->_supportsHAP2)
  {
    p_airplayBrowser = &self->_airplayBrowser;
    if (self->_airplayBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(*p_airplayBrowser);
      *p_airplayBrowser = 0;
    }
    int v8 = BonjourBrowser_Create();
    if (v8) {
      goto LABEL_20;
    }
    BonjourBrowser_SetDispatchQueue();
    BonjourBrowser_SetEventHandlerBlock();
    int v8 = BonjourBrowser_Start();
    if (v8) {
      goto LABEL_20;
    }
    dispatch_source_t v11 = self;

    p_raopBrowser = (CFTypeRef *)&v11->_raopBrowser;
    if (v11->_raopBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(*p_raopBrowser);
      CFTypeRef *p_raopBrowser = 0;
    }
    int v8 = BonjourBrowser_Create();
    if (v8) {
      goto LABEL_20;
    }
    BonjourBrowser_SetDispatchQueue();
    BonjourBrowser_SetEventHandlerBlock();
    int v8 = BonjourBrowser_Start();
    if (v8) {
      goto LABEL_20;
    }
    int v13 = v11;

    p_mfiConfigBrowser = (CFTypeRef *)&v13->_mfiConfigBrowser;
    if (v13->_mfiConfigBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(*p_mfiConfigBrowser);
      CFTypeRef *p_mfiConfigBrowser = 0;
    }
    int v8 = BonjourBrowser_Create();
    if (v8) {
      goto LABEL_20;
    }
    BonjourBrowser_SetDispatchQueue();
    BonjourBrowser_SetEventHandlerBlock();
    int v8 = BonjourBrowser_Start();
    if (v8) {
      goto LABEL_20;
    }
  }
  p_hapBrowser = &self->_hapBrowser;
  if (self->_hapBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(*p_hapBrowser);
    *p_hapBrowser = 0;
  }
  int v8 = BonjourBrowser_Create();
  if (v8) {
    goto LABEL_20;
  }
  BonjourBrowser_SetDispatchQueue();
  BonjourBrowser_SetEventHandlerBlock();
  int v8 = BonjourBrowser_Start();
  if (v8) {
    goto LABEL_20;
  }
  v9 = self;

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__EasyConfigDevice__startBonjourWithTimeout_handler___block_invoke;
  v16[3] = &unk_26452D5F8;
  v16[4] = v9;
  int v8 = [(EasyConfigDevice *)v9 _timeoutTimerStart:v4 block:v16];
  if (v8)
  {
LABEL_20:
    if (self->_airplayBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(self->_airplayBrowser);
      self->_airplayBrowser = 0;
    }
    if (self->_raopBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(self->_raopBrowser);
      self->_raopBrowser = 0;
    }
    if (self->_mfiConfigBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(self->_mfiConfigBrowser);
      self->_mfiConfigBrowser = 0;
    }
    if (self->_hapBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(self->_hapBrowser);
      self->_hapBrowser = 0;
    }
  }

  return v8;
}

uint64_t __53__EasyConfigDevice__startBonjourWithTimeout_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleError:4294960574];
}

- (int)_setupClient:(id)a3
{
  id v4 = a3;
  p_httpClient = &self->_httpClient;
  if (self->_httpClient)
  {
    HTTPClientInvalidate();
    CFRelease(*p_httpClient);
    *p_httpClient = 0;
  }
  int DNSName = HTTPClientCreate();
  if (DNSName
    || (HTTPClientSetDispatchQueue(),
        HTTPClientSetFlags(),
        HTTPClientSetLogging(),
        (int DNSName = BonjourDevice_GetDNSName()) != 0)
    || (int DNSName = HTTPClientSetDestination()) != 0)
  {
    if (*p_httpClient)
    {
      HTTPClientInvalidate();
      CFRelease(*p_httpClient);
      *p_httpClient = 0;
    }
  }

  return DNSName;
}

- (void)_postProgress:(int)a3 withResponse:(id)a4
{
  id v6 = a4;
  userQueue = self->_userQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__EasyConfigDevice__postProgress_withResponse___block_invoke;
  block[3] = &unk_26452D6C0;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(userQueue, block);
}

void __47__EasyConfigDevice__postProgress_withResponse___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 496);
  if (v2)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 40);
    v14 = @"EasyConfigKey_Response";
    v15[0] = v4;
    v5 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v5);
  }
  if (*(_DWORD *)(a1 + 48) == 2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 496);
    *(void *)(v6 + 496) = 0;
  }
  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v9 = *(void *)(a1 + 32);
  v12[0] = @"EasyConfigKey_Progress";
  id v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v12[1] = @"EasyConfigKey_Response";
  v13[0] = v10;
  v13[1] = *(void *)(a1 + 40);
  int v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v8 postNotificationName:@"EasyConfigDeviceProgressNotification" object:v9 userInfo:v11];
}

- (void)_postProgress:(int)a3 info:(id)a4
{
  id v6 = a4;
  userQueue = self->_userQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__EasyConfigDevice__postProgress_info___block_invoke;
  block[3] = &unk_26452D6C0;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(userQueue, block);
}

void __39__EasyConfigDevice__postProgress_info___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 496);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
  }
  if (*(_DWORD *)(a1 + 48) == 2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 496);
    *(void *)(v3 + 496) = 0;
  }
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v9 = @"EasyConfigKey_Progress";
  v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v10[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 postNotificationName:@"EasyConfigDeviceProgressNotification" object:v6 userInfo:v8];
}

- (void)_postNote:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  userQueue = self->_userQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__EasyConfigDevice__postNote_info___block_invoke;
  block[3] = &unk_26452D698;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(userQueue, block);
}

void __35__EasyConfigDevice__postNote_info___block_invoke(void *a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:a1[4] object:a1[5] userInfo:a1[6]];
}

- (void)_logEnded
{
  if (gLogCategory_EasyConfigDevice <= 50
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_handleError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = CFAbsoluteTimeGetCurrent() - self->_configStartTime;
  if (gLogCategory_EasyConfigDevice <= 40
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_firstErr) {
    self->_firstErr = v3;
  }
  if ((self->_state - 1) <= 1)
  {
    if (v5 >= 120.0)
    {
      if (gLogCategory_EasyConfigDevice <= 60
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __33__EasyConfigDevice__handleError___block_invoke;
      v6[3] = &unk_26452D5F8;
      v6[4] = self;
      uint64_t v3 = [(EasyConfigDevice *)self _timeoutTimerStart:5 block:v6];
    }
  }
  if (v3) {
    [(EasyConfigDevice *)self _stop:v3];
  }
}

uint64_t __33__EasyConfigDevice__handleError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findDevicePreConfigStart];
}

- (void)_postConfigCheckCompletion:(HTTPMessagePrivate *)a3
{
  self->_postConfigCheckFinishTime = CFAbsoluteTimeGetCurrent();
  uint64_t var21 = a3->var21;
  if (!var21)
  {
    int var12 = a3->var2.var12;
    if ((var12 - 300) >= 0xFFFFFF9C)
    {
      if (gLogCategory_EasyConfigDevice <= 30
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        unint64_t deviceIdentifier = self->_deviceIdentifier;
        LogPrintF();
      }
      -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 70, 0, deviceIdentifier);
      [(EasyConfigDevice *)self _postProgress:100 info:0];
      [(EasyConfigDevice *)self _stop:0];
      return;
    }
    uint64_t var21 = (var12 + 200000);
    if (var12 == -200000) {
      return;
    }
  }
  if (gLogCategory_EasyConfigDevice <= 60
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(EasyConfigDevice *)self _handleError:var21];
}

- (void)_postConfigCheckStart:(id)a3
{
  id v12 = 0;
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  self->_postConfigCheckStartTime = Current;
  self->_postConfigCheckFinishTime = Current;
  if (gLogCategory_EasyConfigDevice <= 30
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    unint64_t deviceIdentifier = self->_deviceIdentifier;
    LogPrintF();
  }
  -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 60, 0, deviceIdentifier);
  uint64_t v6 = [(EasyConfigDevice *)self _setupClient:v4];

  if (!v6)
  {
    uint64_t v6 = HTTPMessageCreate();
    if (!v6)
    {
      HTTPHeader_InitRequest();
      HTTPHeader_SetField();
      v11[5] = MEMORY[0x263EF8330];
      v11[6] = 3221225472;
      v11[7] = __42__EasyConfigDevice__postConfigCheckStart___block_invoke;
      v11[8] = &unk_26452D670;
      v11[9] = self;
      HTTPMessageSetCompletionBlock();
      v12[8512] = 1;
      uint64_t v6 = HTTPClientSendMessage();
      if (!v6)
      {
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __42__EasyConfigDevice__postConfigCheckStart___block_invoke_2;
        v11[3] = &unk_26452D5F8;
        v11[4] = self;
        uint64_t v6 = [(EasyConfigDevice *)self _timeoutTimerStart:20 block:v11];
      }
    }
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v6)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t v9 = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", v6, v9, v6);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", v6, v8, v10);
    }
  }
}

uint64_t __42__EasyConfigDevice__postConfigCheckStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _postConfigCheckCompletion:a2];
}

uint64_t __42__EasyConfigDevice__postConfigCheckStart___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleError:4294960574];
}

- (void)_findDevicePostConfigEvent:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  if (a3 != 1
    || !self->_started
    || !self->_airplayBrowser && !self->_raopBrowser && !self->_mfiConfigBrowser && !self->_hapBrowser
    || BonjourDevice_GetDeviceID() != self->_deviceIdentifier)
  {
    goto LABEL_34;
  }
  uint64_t Int64 = BonjourDevice_GetInt64();
  if (self->_configSeed != Int64) {
    goto LABEL_21;
  }
  CFStringGetTypeID();
  uint64_t v8 = CFDictionaryGetTypedValue();
  if (![v8 caseInsensitiveCompare:@"_hap._tcp."])
  {
    uint64_t v9 = BonjourDevice_GetInt64();
    if ((v9 & 2) == 0)
    {
      if (gLogCategory_EasyConfigDevice <= 40
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        uint64_t v12 = Int64;
        uint64_t v14 = v9;
        unint64_t deviceIdentifier = self->_deviceIdentifier;
        LogPrintF();
      }

LABEL_21:
      self->_findPostConfigFoundTime = CFAbsoluteTimeGetCurrent();
      if (self->_airplayBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_airplayBrowser);
        self->_airplayBrowser = 0;
      }
      if (self->_raopBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_raopBrowser);
        self->_raopBrowser = 0;
      }
      if (self->_mfiConfigBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_mfiConfigBrowser);
        self->_mfiConfigBrowser = 0;
      }
      if (self->_hapBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_hapBrowser);
        self->_hapBrowser = 0;
      }
      if (gLogCategory_EasyConfigDevice <= 30
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        uint64_t configSeed = self->_configSeed;
        unint64_t v11 = self->_deviceIdentifier;
        LogPrintF();
        -[EasyConfigDevice _postConfigCheckStart:](self, "_postConfigCheckStart:", v6, v11, configSeed, Int64);
      }
      else
      {
        -[EasyConfigDevice _postConfigCheckStart:](self, "_postConfigCheckStart:", v6, deviceIdentifier, v12, v14);
      }
      goto LABEL_34;
    }
  }
  if (gLogCategory_EasyConfigDevice <= 40
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

LABEL_34:
}

- (int)_findDevicePostConfigStart
{
  self->_state = 3;
  double Current = CFAbsoluteTimeGetCurrent();
  self->_findPostConfigStartTime = Current;
  self->_findPostConfigFoundTime = Current;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__EasyConfigDevice__findDevicePostConfigStart__block_invoke;
  v9[3] = &unk_26452D648;
  v9[4] = self;
  uint64_t v4 = [(EasyConfigDevice *)self _startBonjourWithTimeout:60 handler:v9];
  if (v4)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t deviceIdentifier = self->_deviceIdentifier;
      uint64_t v8 = v4;
      LogPrintF();
    }
    -[EasyConfigDevice _handleError:](self, "_handleError:", v4, deviceIdentifier, v8);
  }
  else if (gLogCategory_EasyConfigDevice <= 30 {
         && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  }
  {
    unint64_t v7 = self->_deviceIdentifier;
    LogPrintF();
    -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 50, 0, v7);
  }
  else
  {
    -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 50, 0, deviceIdentifier);
  }
  return v4;
}

uint64_t __46__EasyConfigDevice__findDevicePostConfigStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _findDevicePostConfigEvent:a2 info:a3];
}

- (void)_applyConfigCompletion:(HTTPMessagePrivate *)a3
{
  unsigned int v18 = 0;
  uint64_t var21 = a3->var21;
  if (var21)
  {
    unsigned int v18 = var21;
  }
  else
  {
    int var12 = a3->var2.var12;
    if ((var12 - 200) >= 0x64)
    {
      int v13 = var12 + 196608;
      uint64_t var21 = (v13 + 3392);
      unsigned int v18 = v13 + 3392;
      if (v13 == -3392) {
        return;
      }
    }
    else if (!self->_mfiSAP || (uint64_t var21 = MFiSAP_Decrypt(), (v18 = var21) == 0))
    {
      CFDictionaryGetTypeID();
      DictionaryFromTLV = (NSDictionary *)CFCreateWithPlistBytes();
      if (!DictionaryFromTLV)
      {
        DictionaryFromTLV = (NSDictionary *)EasyConfigCreateDictionaryFromTLV((uint64_t)a3->var6, a3->var7, (int *)&v18);
        if (!DictionaryFromTLV) {
          goto LABEL_20;
        }
      }
      configResponse = self->_configResponse;
      self->_configResponse = DictionaryFromTLV;

      self->_applyConfigFinishTime = CFAbsoluteTimeGetCurrent();
      if (gLogCategory_EasyConfigDevice <= 30
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        unint64_t deviceIdentifier = self->_deviceIdentifier;
        LogPrintF();
      }
      -[EasyConfigDevice _postProgress:withResponse:](self, "_postProgress:withResponse:", 40, self->_configResponse, deviceIdentifier);
      if (self->_pausesAfterApply)
      {
        timeoutTimer = self->_timeoutTimer;
        if (timeoutTimer)
        {
          uint64_t v10 = timeoutTimer;
          dispatch_source_cancel(v10);
          unint64_t v11 = self->_timeoutTimer;
          self->_timeoutTimer = 0;
        }
        if (gLogCategory_EasyConfigDevice <= 30
          && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
LABEL_20:
        uint64_t var21 = v18;
        if (!v18) {
          return;
        }
        goto LABEL_21;
      }
      uint64_t var21 = [(EasyConfigDevice *)self _findDevicePostConfigStart];
      unsigned int v18 = var21;
      if (!var21) {
        return;
      }
    }
  }
LABEL_21:
  if (gLogCategory_EasyConfigDevice <= 60
    && (gLogCategory_EasyConfigDevice != -1 || (int v12 = _LogCategory_Initialize(), var21 = v18, v12)))
  {
    unint64_t v15 = self->_deviceIdentifier;
    uint64_t v17 = var21;
    LogPrintF();
    -[EasyConfigDevice _handleError:](self, "_handleError:", v18, v15, v17);
  }
  else
  {
    -[EasyConfigDevice _handleError:](self, "_handleError:", var21, deviceIdentifier, v16);
  }
}

- (int)_applyConfigStart
{
  unsigned int v18 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  self->_applyConfigStartTime = CFAbsoluteTimeGetCurrent();
  if (self->_supportsTLV)
  {
    uint64_t v3 = EasyConfigCreateTLVfromDictionary((const __CFDictionary *)self->_configuration, (uint64_t)&v16, &v18);
    id v4 = 0;
    if (v18)
    {
      double v5 = (void *)v3;
      goto LABEL_8;
    }
    unint64_t v7 = "application/x-tlv8";
    double v5 = (void *)v3;
  }
  else
  {
    id v6 = [MEMORY[0x263F08AC0] dataWithPropertyList:self->_configuration format:200 options:0 error:0];
    if (!v6)
    {
      id v4 = 0;
      unsigned int v18 = -6732;
      goto LABEL_10;
    }
    id v4 = v6;
    [v4 bytes];
    double v5 = 0;
    uint64_t v16 = [v4 length];
    unint64_t v7 = "application/octet-stream";
  }
  unsigned int v18 = HTTPMessageCreate();
  if (!v18)
  {
    HTTPHeader_InitRequest();
    HTTPHeader_SetField();
    unint64_t deviceIdentifier = (unint64_t)v7;
    HTTPHeader_SetField();
    if (self->_mfiSAP)
    {
      unsigned int v18 = HTTPMessageSetBodyLength();
      if (v18) {
        goto LABEL_8;
      }
      unsigned int v10 = MFiSAP_Encrypt();
    }
    else
    {
      unsigned int v10 = HTTPMessageSetBody();
    }
    unsigned int v18 = v10;
    if (!v10)
    {
      v15[5] = MEMORY[0x263EF8330];
      v15[6] = 3221225472;
      v15[7] = __37__EasyConfigDevice__applyConfigStart__block_invoke;
      v15[8] = &unk_26452D670;
      v15[9] = self;
      HTTPMessageSetCompletionBlock();
      v17[8512] = 1;
      unsigned int v18 = HTTPClientSendMessage();
      if (!v18)
      {
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        void v15[2] = __37__EasyConfigDevice__applyConfigStart__block_invoke_2;
        v15[3] = &unk_26452D5F8;
        v15[4] = self;
        unsigned int v18 = -[EasyConfigDevice _timeoutTimerStart:block:](self, "_timeoutTimerStart:block:", 20, v15, v7);
        if (!v18)
        {
          if (gLogCategory_EasyConfigDevice <= 30
            && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
          {
            unint64_t deviceIdentifier = self->_deviceIdentifier;
            LogPrintF();
          }
          -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 30, 0, deviceIdentifier);
        }
      }
    }
  }
LABEL_8:
  if (v5) {
    free(v5);
  }
LABEL_10:
  if (v17) {
    CFRelease(v17);
  }
  uint64_t v8 = v18;
  if (v18)
  {
    if (gLogCategory_EasyConfigDevice <= 60)
    {
      if (gLogCategory_EasyConfigDevice != -1 || (int v11 = _LogCategory_Initialize(), v8 = v18, v11))
      {
        unint64_t deviceIdentifier = self->_deviceIdentifier;
        uint64_t v14 = v8;
        LogPrintF();
        uint64_t v8 = v18;
      }
    }
    -[EasyConfigDevice _handleError:](self, "_handleError:", v8, deviceIdentifier, v14);
    int v9 = v18;
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

uint64_t __37__EasyConfigDevice__applyConfigStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _applyConfigCompletion:a2];
}

uint64_t __37__EasyConfigDevice__applyConfigStart__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleError:4294960574];
}

- (int)_pairVerifyNext:(HTTPMessagePrivate *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!a3) {
    goto LABEL_4;
  }
  uint64_t var21 = a3->var21;
  if (var21) {
    goto LABEL_5;
  }
  int var12 = a3->var2.var12;
  if ((var12 - 200) >= 0x64)
  {
    uint64_t var21 = (var12 + 200000);
  }
  else
  {
LABEL_4:
    uint64_t var21 = PairingSessionExchange();
    if (!var21)
    {
      uint64_t var21 = HTTPMessageCreate();
      if (!var21)
      {
        unint64_t v7 = "pair-verify";
        HTTPHeader_InitRequestF();
        uint64_t var21 = HTTPMessageSetBody();
        if (!var21)
        {
          HTTPMessageSetCompletionBlock();
          uint64_t var21 = HTTPClientSendMessage();
        }
      }
    }
  }
LABEL_5:
  if (var21)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t deviceIdentifier = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, deviceIdentifier, var21);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, v7, v9);
    }
  }
  return var21;
}

uint64_t __36__EasyConfigDevice__pairVerifyNext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _pairVerifyNext:a2];
}

- (int)_pairVerifyStart
{
  if (gLogCategory_EasyConfigDevice <= 30
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    unint64_t deviceIdentifier = self->_deviceIdentifier;
    LogPrintF();
  }
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  long long v10 = 0u;
  memset(v11, 0, sizeof(v11));
  void v9[5] = self;
  if (self->_hasPairingDelegate)
  {
    *(_OWORD *)((char *)v11 + 8) = *(_OWORD *)&self->_pairingDelegate.copyIdentity_f;
    *((void *)&v11[1] + 1) = self->_pairingDelegate.savePeer_f;
  }
  uint64_t v4 = PairingSessionCreate();
  if (v4) {
    goto LABEL_26;
  }
  if (self->_supportsHAP || self->_supportsHAP2 || self->_supportsPairSetup)
  {
    LODWORD(deviceIdentifier) = 1;
    PairingSessionSetKeychainInfo();
  }
  if (self->_pairVerifyFlags) {
    PairingSessionSetFlags();
  }
  PairingSessionSetLogging();
  uint64_t v4 = [(EasyConfigDevice *)self _pairVerifyNext:0];
  if (v4
    || (v9[0] = MEMORY[0x263EF8330],
        v9[1] = 3221225472,
        v9[2] = __36__EasyConfigDevice__pairVerifyStart__block_invoke,
        v9[3] = &unk_26452D5F8,
        v9[4] = self,
        uint64_t v4 = [(EasyConfigDevice *)self _timeoutTimerStart:20 block:v9],
        v4))
  {
LABEL_26:
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t v7 = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", v4, v7, v4);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", v4, deviceIdentifier, v8);
    }
  }
  return v4;
}

uint64_t __36__EasyConfigDevice__pairVerifyStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleError:4294960574];
}

- (int)_pairSetupNext:(HTTPMessagePrivate *)a3
{
  uint64_t v14 = 0;
  unint64_t v15 = 0;
  char v13 = 0;
  CFTypeRef v12 = 0;
  if (!a3) {
    goto LABEL_4;
  }
  uint64_t var21 = a3->var21;
  if (var21) {
    goto LABEL_10;
  }
  int var12 = a3->var2.var12;
  if ((var12 - 200) >= 0x64)
  {
    uint64_t var21 = (var12 + 200000);
  }
  else
  {
LABEL_4:
    unsigned int v6 = PairingSessionExchange();
    if (v6)
    {
      if (v6 == -6771) {
        uint64_t var21 = 0;
      }
      else {
        uint64_t var21 = v6;
      }
    }
    else
    {
      uint64_t var21 = HTTPMessageCreate();
      if (!var21)
      {
        uint64_t v8 = "pair-setup";
        HTTPHeader_InitRequestF();
        uint64_t var21 = HTTPMessageSetBody();
        if (!var21)
        {
          v11[5] = MEMORY[0x263EF8330];
          v11[6] = 3221225472;
          v11[7] = __35__EasyConfigDevice__pairSetupNext___block_invoke;
          v11[8] = &unk_26452D670;
          v11[9] = self;
          HTTPMessageSetCompletionBlock();
          uint64_t var21 = HTTPClientSendMessage();
          if (!var21)
          {
            if (self->_timeoutTimer)
            {
              uint64_t var21 = 0;
            }
            else
            {
              v11[0] = MEMORY[0x263EF8330];
              v11[1] = 3221225472;
              v11[2] = __35__EasyConfigDevice__pairSetupNext___block_invoke_2;
              _OWORD v11[3] = &unk_26452D5F8;
              v11[4] = self;
              uint64_t var21 = -[EasyConfigDevice _timeoutTimerStart:block:](self, "_timeoutTimerStart:block:", 20, v11, "pair-setup");
            }
          }
        }
      }
    }
  }
LABEL_10:
  if (v12) {
    CFRelease(v12);
  }
  if (v15) {
    free(v15);
  }
  if (var21)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t deviceIdentifier = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, deviceIdentifier, var21);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, v8, v10);
    }
  }
  return var21;
}

uint64_t __35__EasyConfigDevice__pairSetupNext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _pairSetupNext:a2];
}

uint64_t __35__EasyConfigDevice__pairSetupNext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleError:4294960574];
}

- (int)_pairSetupStart
{
  self->_securityStartTime = CFAbsoluteTimeGetCurrent();
  if (gLogCategory_EasyConfigDevice <= 30
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    unint64_t deviceIdentifier = self->_deviceIdentifier;
    LogPrintF();
  }
  -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 20, 0, deviceIdentifier);
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  uint64_t v4 = PairingSessionCreate();
  if (v4) {
    goto LABEL_23;
  }
  if (self->_supportsHAP || self->_supportsHAP2 || self->_supportsPairSetup)
  {
    LODWORD(v7) = 1;
    PairingSessionSetKeychainInfo();
  }
  if (self->_pairSetupFlags) {
    PairingSessionSetFlags();
  }
  PairingSessionSetLogging();
  uint64_t v4 = [(EasyConfigDevice *)self _pairSetupNext:0];
  if (v4)
  {
LABEL_23:
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t v8 = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", v4, v8, v4);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", v4, v7, v9);
    }
  }
  return v4;
}

- (int)_mfiSAPNext:(HTTPMessagePrivate *)a3
{
  if (!a3) {
    goto LABEL_4;
  }
  uint64_t var21 = a3->var21;
  if (var21) {
    goto LABEL_8;
  }
  int var12 = a3->var2.var12;
  if ((var12 - 200) >= 0x64)
  {
    uint64_t var21 = (var12 + 200000);
  }
  else
  {
LABEL_4:
    uint64_t var21 = MFiSAP_Exchange();
    if (!var21)
    {
      uint64_t var21 = HTTPMessageCreate();
      if (!var21)
      {
        HTTPHeader_InitRequest();
        HTTPHeader_SetField();
        uint64_t var21 = HTTPMessageSetBody();
        if (!var21)
        {
          HTTPMessageSetCompletionBlock();
          uint64_t var21 = HTTPClientSendMessage();
        }
      }
    }
  }
LABEL_8:
  if (var21)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t deviceIdentifier = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, deviceIdentifier, var21);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, v7, v9);
    }
  }
  return var21;
}

uint64_t __32__EasyConfigDevice__mfiSAPNext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _mfiSAPNext:a2];
}

- (int)_mfiSAPStart
{
  self->_securityStartTime = CFAbsoluteTimeGetCurrent();
  if (gLogCategory_EasyConfigDevice <= 30
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    unint64_t deviceIdentifier = self->_deviceIdentifier;
    LogPrintF();
  }
  -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 20, 0, deviceIdentifier);
  if (self->_mfiSAP)
  {
    MFiSAP_Delete();
    self->_mfiSAP = 0;
  }
  uint64_t v3 = MFiSAP_Create();
  if (v3
    || (uint64_t v3 = [(EasyConfigDevice *)self _mfiSAPNext:0], v3)
    || (v9[0] = MEMORY[0x263EF8330],
        v9[1] = 3221225472,
        v9[2] = __32__EasyConfigDevice__mfiSAPStart__block_invoke,
        v9[3] = &unk_26452D5F8,
        v9[4] = self,
        uint64_t v3 = [(EasyConfigDevice *)self _timeoutTimerStart:20 block:v9],
        v3))
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t v7 = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", v3, v7, v3);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", v3, v6, v8);
    }
  }
  return v3;
}

uint64_t __32__EasyConfigDevice__mfiSAPStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleError:4294960574];
}

- (int)_configureStart:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  self->_state = 2;
  int v5 = gLogCategory_EasyConfigDevice;
  if (gLogCategory_EasyConfigDevice <= 30)
  {
    if (gLogCategory_EasyConfigDevice == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_16;
      }
      int v5 = gLogCategory_EasyConfigDevice;
    }
    unint64_t deviceIdentifier = self->_deviceIdentifier;
    if (v5 > 20 || v5 == -1 && !_LogCategory_Initialize()) {
      unint64_t v7 = (const char *)&unk_21FC91CBA;
    }
    else {
      unint64_t v7 = ":\n";
    }
    if (gLogCategory_EasyConfigDevice > 20) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize() != 0;
    }
    unint64_t v21 = deviceIdentifier;
    uint64_t v22 = (uint64_t)v7;
    BOOL v23 = v8;
    CFDictionaryRef v24 = v4;
    LogPrintF();
  }
LABEL_16:
  unsigned int v26 = 0;
  uint8_t valueLen = 0;
  self->_uint64_t configSeed = BonjourDevice_GetInt64();
  if (v26)
  {
    self->_uint64_t configSeed = BonjourDevice_GetInt64();
    if (v26)
    {
      self->_uint64_t configSeed = BonjourDevice_GetInt64();
      if (v26)
      {
        if (gLogCategory_EasyConfigDevice <= 50
          && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
        {
          unint64_t v21 = self->_deviceIdentifier;
          LogPrintF();
        }
        self->_uint64_t configSeed = 1;
      }
    }
  }
  self->_supportsTLV = 0;
  CFStringGetTypeID();
  CFStringRef TypedValue = (const __CFString *)CFDictionaryGetTypedValue();
  if (!TypedValue) {
    goto LABEL_53;
  }
  CFStringRef v10 = TypedValue;
  if (CFStringCompare(TypedValue, @"_airplay._tcp.", 1uLL) == kCFCompareEqualTo
    || CFStringCompare(v10, @"_raop._tcp.", 1uLL) == kCFCompareEqualTo)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v4, @"txt");
    if (Value)
    {
      CFDataRef v13 = Value;
      BytePtr = CFDataGetBytePtr(Value);
      uint16_t Length = CFDataGetLength(v13);
      if (TXTRecordGetValuePtr(Length, BytePtr, "srcvers", &valueLen)
        || TXTRecordGetValuePtr(Length, BytePtr, "vs", &valueLen))
      {
        LOBYTE(v11) = TextToSourceVersion() > 0x1B903F;
LABEL_34:
        self->_supportsTLV = v11;
        goto LABEL_35;
      }
      uint64_t v16 = 4294960581;
LABEL_55:
      unsigned int v26 = v16;
      goto LABEL_46;
    }
LABEL_53:
    uint64_t v16 = 4294960534;
    goto LABEL_55;
  }
  if (CFStringCompare(v10, @"_mfi-config._tcp.", 1uLL) == kCFCompareEqualTo)
  {
    unsigned int v11 = (BonjourDevice_GetInt64() >> 2) & 1;
    goto LABEL_34;
  }
  LOBYTE(v11) = 1;
  if (CFStringCompare(v10, @"_hap._tcp.", 1uLL) == kCFCompareEqualTo) {
    goto LABEL_34;
  }
LABEL_35:
  uint64_t v16 = -[EasyConfigDevice _setupClient:](self, "_setupClient:", v4, v21, v22, v23, v24);
  unsigned int v26 = v16;
  if (!v16)
  {
    if (CFDictionaryGetInt64() && (self->_supportsHAP2 || self->_supportsPairSetup || !self->_supportsMFi)) {
      uint64_t v17 = self->_skipPairSetup
    }
          ? [(EasyConfigDevice *)self _pairVerifyStart]
          : [(EasyConfigDevice *)self _pairSetupStart];
    else {
      uint64_t v17 = [(EasyConfigDevice *)self _mfiSAPStart];
    }
    uint64_t v16 = v17;
    unsigned int v26 = v17;
    if (!v17)
    {
      int v19 = 0;
      goto LABEL_51;
    }
  }
LABEL_46:
  if (gLogCategory_EasyConfigDevice <= 60)
  {
    if (gLogCategory_EasyConfigDevice != -1 || (v18 = _LogCategory_Initialize(), uint64_t v16 = v26, v18))
    {
      unint64_t v21 = self->_deviceIdentifier;
      uint64_t v22 = v16;
      LogPrintF();
      uint64_t v16 = v26;
    }
  }
  -[EasyConfigDevice _handleError:](self, "_handleError:", v16, v21, v22);
  int v19 = v26;
LABEL_51:

  return v19;
}

- (void)_findDevicePreConfigEvent:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  if (a3 == 1
    && self->_started
    && (self->_airplayBrowser || self->_raopBrowser || self->_mfiConfigBrowser || self->_hapBrowser))
  {
    id v11 = v6;
    BOOL v7 = BonjourDevice_GetDeviceID() == self->_deviceIdentifier;
    id v6 = v11;
    if (v7)
    {
      self->_findPreConfigFoundTime = CFAbsoluteTimeGetCurrent();
      BonjourDevice_Reconfirm();
      if (self->_airplayBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_airplayBrowser);
        self->_airplayBrowser = 0;
      }
      if (self->_raopBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_raopBrowser);
        self->_raopBrowser = 0;
      }
      if (self->_mfiConfigBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_mfiConfigBrowser);
        self->_mfiConfigBrowser = 0;
      }
      if (self->_hapBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_hapBrowser);
        self->_hapBrowser = 0;
      }
      timeoutTimer = self->_timeoutTimer;
      if (timeoutTimer)
      {
        uint64_t v9 = timeoutTimer;
        dispatch_source_cancel(v9);
        CFStringRef v10 = self->_timeoutTimer;
        self->_timeoutTimer = 0;
      }
      [(EasyConfigDevice *)self _configureStart:v11];
      id v6 = v11;
    }
  }
}

- (int)_findDevicePreConfigStart
{
  self->_state = 1;
  double Current = CFAbsoluteTimeGetCurrent();
  self->_findPreConfigStartTime = Current;
  self->_findPreConfigFoundTime = Current;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__EasyConfigDevice__findDevicePreConfigStart__block_invoke;
  v9[3] = &unk_26452D648;
  v9[4] = self;
  uint64_t v4 = [(EasyConfigDevice *)self _startBonjourWithTimeout:20 handler:v9];
  if (v4)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t deviceIdentifier = self->_deviceIdentifier;
      uint64_t v8 = v4;
      LogPrintF();
    }
    -[EasyConfigDevice _handleError:](self, "_handleError:", v4, deviceIdentifier, v8);
  }
  else if (gLogCategory_EasyConfigDevice <= 30 {
         && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  }
  {
    unint64_t v7 = self->_deviceIdentifier;
    LogPrintF();
    -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 10, 0, v7);
  }
  else
  {
    -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 10, 0, deviceIdentifier);
  }
  return v4;
}

uint64_t __45__EasyConfigDevice__findDevicePreConfigStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _findDevicePreConfigEvent:a2 info:a3];
}

- (void)_trySetupCode:(id)a3
{
  id v5 = a3;
  self->_enterSetupCodeMs = ((CFAbsoluteTimeGetCurrent() - self->_promptForSetupCodeTime) * 1000.0);
  if (!self->_pairingSession)
  {
    uint64_t v4 = 4294960593;
LABEL_4:
    [(EasyConfigDevice *)self _handleError:v4];
    goto LABEL_5;
  }
  [v5 UTF8String];
  uint64_t v4 = PairingSessionSetSetupCode();
  if (v4) {
    goto LABEL_4;
  }
  uint64_t v4 = [(EasyConfigDevice *)self _pairSetupNext:0];
  if (v4) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)trySetupCode:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__EasyConfigDevice_trySetupCode___block_invoke;
  v7[3] = &unk_26452D620;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __33__EasyConfigDevice_trySetupCode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trySetupCode:*(void *)(a1 + 40)];
}

- (void)setPromptForSetupCodeHandler:(id)a3
{
  id v4 = (void *)MEMORY[0x223C5CE50](a3, a2);
  if (v4)
  {
    id v5 = v4;
    id v8 = (id)[v4 copy];
  }
  else
  {
    id v8 = 0;
  }
  id v6 = (void *)MEMORY[0x223C5CE50](v8);
  id promptForSetupCodeBlock = self->_promptForSetupCodeBlock;
  self->_id promptForSetupCodeBlock = v6;
}

- (void)setPostConfigMetrics:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_postConfigMetrics.secondsToGetLinkUpOnDestination = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_postConfigMetrics.rssiOfDestinationAP = v3;
  self->_postConfigMetricsSet = 1;
}

- (void)setPreConfigMetrics:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var8;
  *(_OWORD *)&self->_preConfigMetrics.secondsToGetLinkUpOnSWAP = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_preConfigMetrics.rssiOfSWAP = v4;
  *(_OWORD *)&self->_preConfigMetrics.startTime = v3;
  self->_preConfigMetricsSet = 1;
}

- (void)setPairingDelegate:(const void *)a3
{
  if (a3)
  {
    *(_OWORD *)&self->_pairingDelegate.context = *(_OWORD *)a3;
    long long v3 = *((_OWORD *)a3 + 1);
    long long v4 = *((_OWORD *)a3 + 2);
    long long v5 = *((_OWORD *)a3 + 3);
    self->_pairingDelegate.resumeResponse_f = (void *)*((void *)a3 + 8);
    *(_OWORD *)&self->_pairingDelegate.copyIdentity_f = v4;
    *(_OWORD *)&self->_pairingDelegate.savePeer_f = v5;
    *(_OWORD *)&self->_pairingDelegate.hideSetupCode_f = v3;
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }
  self->_hasPairingDelegate = v6;
}

- (void)resumePostConfig
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__EasyConfigDevice_resumePostConfig__block_invoke;
  block[3] = &unk_26452D5F8;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __36__EasyConfigDevice_resumePostConfig__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 232))
  {
    uint64_t v1 = result;
    if (gLogCategory_EasyConfigDevice <= 30
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(void **)(v1 + 32);
    return [v2 _findDevicePostConfigStart];
  }
  else if (gLogCategory_EasyConfigDevice <= 60)
  {
    if (gLogCategory_EasyConfigDevice != -1 || (result = _LogCategory_Initialize(), result))
    {
      return LogPrintF();
    }
  }
  return result;
}

- (void)_stop:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v31[1] = *MEMORY[0x263EF8340];
  BOOL started = self->_started;
  self->_BOOL started = 0;
  if (!self->_firstErr) {
    self->_firstErr = a3;
  }
  if (started)
  {
    [(EasyConfigDevice *)self _logEnded];
    unint64_t v6 = 0x267EF8000uLL;
    if (gLogCategory_EasyConfigDevice <= 30
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v25 = v3;
      LogPrintF();
    }
    unint64_t v7 = 0x263F08000uLL;
    if (v3)
    {
      v30 = @"EasyConfigKey_ReasonError";
      id v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F08410];
      uint64_t v10 = (int)v3;
      uint64_t v28 = *MEMORY[0x263F08320];
      uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
      CFTypeRef v12 = (void *)v11;
      CFDataRef v13 = @"?";
      if (v11) {
        CFDataRef v13 = (__CFString *)v11;
      }
      v29 = v13;
      uint64_t v14 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1, v25);
      unint64_t v15 = [v8 errorWithDomain:v9 code:(int)v3 userInfo:v14];
      v31[0] = v15;
      uint64_t v16 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
      [(EasyConfigDevice *)self _postProgress:2 info:v16];

      unint64_t v7 = 0x263F08000;
      unint64_t v6 = 0x267EF8000;
    }
    else
    {
      [(EasyConfigDevice *)self _postProgress:2 info:0];
      uint64_t v10 = 0;
      uint64_t v9 = *MEMORY[0x263F08410];
    }
    uint64_t v17 = objc_msgSend(*(id *)(v7 + 2024), "errorWithDomain:code:userInfo:", v9, v10, 0, v25, @"EasyConfigKey_ReasonError");
    v27 = v17;
    int v18 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [(EasyConfigDevice *)self _postNote:@"EasyConfigDeviceStoppedNotification" info:v18];

    int v19 = *(_DWORD *)(v6 + 808);
    if (v19 <= 30 && (v19 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  if (self->_airplayBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_airplayBrowser);
    self->_airplayBrowser = 0;
  }
  if (self->_raopBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_raopBrowser);
    self->_raopBrowser = 0;
  }
  if (self->_mfiConfigBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_mfiConfigBrowser);
    self->_mfiConfigBrowser = 0;
  }
  if (self->_hapBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_hapBrowser);
    self->_hapBrowser = 0;
  }
  if (self->_httpClient)
  {
    HTTPClientInvalidate();
    CFRelease(self->_httpClient);
    self->_httpClient = 0;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    unint64_t v21 = timeoutTimer;
    dispatch_source_cancel(v21);
    uint64_t v22 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  if (self->_mfiSAP)
  {
    MFiSAP_Delete();
    self->_mfiSAP = 0;
  }
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  id promptForSetupCodeBlock = self->_promptForSetupCodeBlock;
  self->_id promptForSetupCodeBlock = 0;
}

- (void)stop
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__EasyConfigDevice_stop__block_invoke;
  block[3] = &unk_26452D5F8;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __24__EasyConfigDevice_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop:4294960573];
}

- (void)_start
{
  if (!self->_started)
  {
    if (gLogCategory_EasyConfigDevice <= 30
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_BOOL started = 1;
    self->_firstErr = 0;
    self->_configStartTime = CFAbsoluteTimeGetCurrent();
    configResponse = self->_configResponse;
    self->_configResponse = 0;

    scanRecord = self->_scanRecord;
    if (scanRecord)
    {
      long long v5 = [(NSDictionary *)scanRecord objectForKey:@"IE"];
      id v6 = v5;
      if (v5)
      {
        if ([v5 length])
        {
          id v6 = v6;
          [v6 bytes];
          uint64_t v7 = IEGetVendorSpecific();
          unsigned int v13 = v7;
          if (v7 || (v7 = TLV8Get(), (unsigned int v13 = v7) != 0))
          {
            uint64_t v8 = v7;
LABEL_21:
            if (gLogCategory_EasyConfigDevice <= 60
              && (gLogCategory_EasyConfigDevice != -1 || (int v10 = _LogCategory_Initialize(), v8 = v13, v10)))
            {
              uint64_t v12 = v8;
              LogPrintF();
              -[EasyConfigDevice _stop:](self, "_stop:", v13, v12);
            }
            else
            {
              -[EasyConfigDevice _stop:](self, "_stop:", v8, v11);
            }
            goto LABEL_26;
          }
          uint64_t v8 = 4294960553;
        }
        else
        {
          uint64_t v8 = 4294960546;
        }
      }
      else
      {
        uint64_t v8 = 4294960569;
      }
    }
    else
    {
      if (self->_deviceInfo)
      {
        self->_unint64_t deviceIdentifier = CFDictionaryGetHardwareAddress();
        unsigned int Int64 = CFDictionaryGetInt64();
        id v6 = 0;
        self->_supportsHAP = (Int64 & 0x20000) != 0;
        self->_supportsHAP2 = (Int64 & 0x40000) != 0;
        self->_supportsMFi = (Int64 & 4) != 0;
        self->_supportsPairSetup = (Int64 & 0x100000) != 0;
        if (((Int64 >> 17) & 1) == 0 && ((Int64 >> 18) & 1) == 0 && ((Int64 >> 2) & 1) == 0 && ((Int64 >> 20) & 1) == 0)
        {
          uint64_t v8 = 4294960562;
          goto LABEL_34;
        }
        if (self->_configuration)
        {
          [(EasyConfigDevice *)self _findDevicePreConfigStart];
          goto LABEL_26;
        }
      }
      else
      {
        id v6 = 0;
      }
      uint64_t v8 = 4294960551;
    }
LABEL_34:
    unsigned int v13 = v8;
    goto LABEL_21;
  }
  if (gLogCategory_EasyConfigDevice <= 60
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v6 = 0;
LABEL_26:
}

- (void)start
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__EasyConfigDevice_start__block_invoke;
  block[3] = &unk_26452D5F8;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __25__EasyConfigDevice_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (BOOL)removed:(id)a3
{
  long long v4 = [a3 objectForKey:@"serviceType"];
  if ([v4 isEqual:@"_airplay._tcp."])
  {
    uint64_t v5 = 48;
LABEL_9:
    id v6 = *(Class *)((char *)&self->super.isa + v5);
    *(Class *)((char *)&self->super.isa + v5) = 0;

    goto LABEL_10;
  }
  if ([v4 isEqual:@"_raop._tcp."])
  {
    uint64_t v5 = 64;
    goto LABEL_9;
  }
  if ([v4 isEqual:@"_mfi-config._tcp."])
  {
    uint64_t v5 = 80;
    goto LABEL_9;
  }
  if ([v4 isEqual:@"_hap._tcp."])
  {
    uint64_t v5 = 96;
    goto LABEL_9;
  }
LABEL_10:
  BOOL v7 = !self->_airplayBonjourInfo
    && !self->_raopBonjourInfo
    && !self->_mfiConfigBonjourInfo
    && self->_hapBonjourInfo == 0;

  return v7;
}

- (BOOL)updated:(id)a3
{
  id v5 = a3;
  id v6 = [v5 objectForKey:@"name"];
  char v7 = [(NSString *)self->_name isEqual:v6];
  if ((v7 & 1) == 0) {
    [(EasyConfigDevice *)self setName:v6];
  }
  unint64_t DeviceID = BonjourDevice_GetDeviceID();
  if (DeviceID == self->_deviceIdentifier)
  {
    char v9 = v7 ^ 1;
  }
  else
  {
    self->_unint64_t deviceIdentifier = DeviceID;
    char v9 = 1;
  }
  int v10 = [v5 objectForKey:@"serviceType"];
  if ([v10 isEqual:@"_airplay._tcp."])
  {
    airplayBonjourInfo = self->_airplayBonjourInfo;
    p_airplayBonjourInfo = &self->_airplayBonjourInfo;
    uint64_t v11 = airplayBonjourInfo;
  }
  else if ([v10 isEqual:@"_raop._tcp."])
  {
    raopBonjourInfo = self->_raopBonjourInfo;
    p_airplayBonjourInfo = &self->_raopBonjourInfo;
    uint64_t v11 = raopBonjourInfo;
  }
  else if ([v10 isEqual:@"_mfi-config._tcp."])
  {
    mfiConfigBonjourInfo = self->_mfiConfigBonjourInfo;
    p_airplayBonjourInfo = &self->_mfiConfigBonjourInfo;
    uint64_t v11 = mfiConfigBonjourInfo;
  }
  else
  {
    if (![v10 isEqual:@"_hap._tcp."]) {
      goto LABEL_16;
    }
    hapBonjourInfo = self->_hapBonjourInfo;
    p_airplayBonjourInfo = &self->_hapBonjourInfo;
    uint64_t v11 = hapBonjourInfo;
  }
  if (([(NSDictionary *)v11 isEqual:v5] & 1) == 0)
  {

    objc_storeStrong((id *)p_airplayBonjourInfo, a3);
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSDictionary *)self->_scanRecord copy];
  id v6 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v5;

  uint64_t v7 = [(NSDictionary *)self->_airplayBonjourInfo copy];
  uint64_t v8 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v7;

  uint64_t v9 = [(NSDictionary *)self->_raopBonjourInfo copy];
  int v10 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v9;

  uint64_t v11 = [(NSDictionary *)self->_mfiConfigBonjourInfo copy];
  uint64_t v12 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v11;

  uint64_t v13 = [(NSDictionary *)self->_hapBonjourInfo copy];
  uint64_t v14 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v13;

  *(_DWORD *)(v4 + 104) = self->_configSeed;
  [(id)v4 setDeviceIdentifier:self->_deviceIdentifier];
  *(void *)(v4 + 184) = self->_features;
  [(id)v4 setModel:self->_model];
  [(id)v4 setName:self->_name];
  [(id)v4 setConfiguration:self->_configuration];
  return (id)v4;
}

- (void)dealloc
{
  internalQueue = self->_internalQueue;
  if (internalQueue)
  {
    self->_internalQueue = 0;
  }
  userQueue = self->_userQueue;
  if (userQueue)
  {
    self->_userQueue = 0;
  }
  scanRecord = self->_scanRecord;
  self->_scanRecord = 0;

  airplayBonjourInfo = self->_airplayBonjourInfo;
  self->_airplayBonjourInfo = 0;

  raopBonjourInfo = self->_raopBonjourInfo;
  self->_raopBonjourInfo = 0;

  mfiConfigBonjourInfo = self->_mfiConfigBonjourInfo;
  self->_mfiConfigBonjourInfo = 0;

  hapBonjourInfo = self->_hapBonjourInfo;
  self->_hapBonjourInfo = 0;

  model = self->_model;
  self->_model = 0;

  name = self->_name;
  self->_name = 0;

  configuration = self->_configuration;
  self->_configuration = 0;

  configResponse = self->_configResponse;
  self->_configResponse = 0;

  id promptForSetupCodeBlock = self->_promptForSetupCodeBlock;
  self->_id promptForSetupCodeBlock = 0;

  id progressHandler = self->_progressHandler;
  self->_id progressHandler = 0;

  deviceInfo = self->_deviceInfo;
  self->_deviceInfo = 0;

  v17.receiver = self;
  v17.super_class = (Class)EasyConfigDevice;
  [(EasyConfigDevice *)&v17 dealloc];
}

- (EasyConfigDevice)init
{
  v7.receiver = self;
  v7.super_class = (Class)EasyConfigDevice;
  id v2 = [(EasyConfigDevice *)&v7 init];
  if (v2
    && (dispatch_queue_t v3 = dispatch_queue_create("EasyConfigDevice", 0),
        internalQueue = v2->_internalQueue,
        v2->_internalQueue = (OS_dispatch_queue *)v3,
        internalQueue,
        v2->_internalQueue))
  {
    objc_storeStrong((id *)&v2->_userQueue, MEMORY[0x263EF83A0]);
    uint64_t v5 = v2;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)deviceWithScanRecord:(id)a3
{
  dispatch_queue_t v3 = (NSDictionary *)a3;
  uint64_t v4 = objc_alloc_init(EasyConfigDevice);
  scanRecord = v4->_scanRecord;
  v4->_scanRecord = v3;

  return v4;
}

+ (id)deviceWithInfo:(id)a3
{
  dispatch_queue_t v3 = (NSDictionary *)a3;
  uint64_t v4 = objc_alloc_init(EasyConfigDevice);
  deviceInfo = v4->_deviceInfo;
  v4->_deviceInfo = v3;

  return v4;
}

+ (BOOL)supportedScanRecord:(id)a3
{
  dispatch_queue_t v3 = [a3 objectForKey:@"IE"];
  uint64_t v4 = v3;
  if (!v3 || ![v3 length]) {
    goto LABEL_5;
  }
  [v4 bytes];
  int v5 = IEGetVendorSpecific();
  if (!v5)
  {
    TLV8Get();
LABEL_5:
    int v5 = -6727;
  }
  BOOL v6 = v5 == 0;

  return v6;
}

@end