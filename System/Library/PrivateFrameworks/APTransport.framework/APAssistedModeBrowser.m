@interface APAssistedModeBrowser
- (APAssistedModeBrowser)init;
- (BOOL)isBrowsing;
- (BonjourBrowser)bonjourBrowser;
- (NSString)bonjourProtocol;
- (NSString)bonjourServiceName;
- (NSString)instanceName;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)internalBrowserQueue;
- (OS_dispatch_source)timeoutTimer;
- (id)deviceFoundHandlerBlock;
- (id)getExpectedBonjourService;
- (id)getExpectedServiceInstanceName;
- (int)setupBonjourBrowser;
- (int)startBonjourBrowser;
- (int)startTimerWithTimeout:(double)a3;
- (void)callDeviceFoundHandlerOnce:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)setBonjourBrowser:(BonjourBrowser *)a3;
- (void)setBonjourProtocol:(id)a3;
- (void)setBonjourServiceName:(id)a3;
- (void)setDeviceFoundHandlerBlock:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInstanceName:(id)a3;
- (void)setInternalBrowserQueue:(id)a3;
- (void)setIsBrowsing:(BOOL)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)startBrowsingFor:(id)a3 withTimeout:(double)a4 deviceFoundHandler:(id)a5;
- (void)stopBrowsing;
- (void)stopBrowsingWithError:(int)a3;
@end

@implementation APAssistedModeBrowser

- (APAssistedModeBrowser)init
{
  v4.receiver = self;
  v4.super_class = (Class)APAssistedModeBrowser;
  v2 = [(APAssistedModeBrowser *)&v4 init];
  if (v2)
  {
    [(APAssistedModeBrowser *)v2 setInternalBrowserQueue:dispatch_queue_create("APAPAssistedModeBrowserInternalQueue", 0)];
    [(APAssistedModeBrowser *)v2 setDispatchQueue:MEMORY[0x1E4F14428]];
    dispatch_retain((dispatch_object_t)[(APAssistedModeBrowser *)v2 dispatchQueue]);
  }
  return v2;
}

- (void)dealloc
{
  self->_instanceName = 0;
  self->_bonjourServiceName = 0;

  self->_bonjourProtocol = 0;
  if (self->_bonjourBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_bonjourBrowser);
    self->_bonjourBrowser = 0;
  }
  id deviceFoundHandlerBlock = self->_deviceFoundHandlerBlock;
  if (deviceFoundHandlerBlock)
  {
    _Block_release(deviceFoundHandlerBlock);
    self->_id deviceFoundHandlerBlock = 0;
  }
  internalBrowserQueue = self->_internalBrowserQueue;
  if (internalBrowserQueue)
  {
    dispatch_release(internalBrowserQueue);
    self->_internalBrowserQueue = 0;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_timeoutTimer);
    dispatch_release(timeoutTimer);
    self->_timeoutTimer = 0;
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_release(dispatchQueue);
    self->_dispatchQueue = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)APAssistedModeBrowser;
  [(APAssistedModeBrowser *)&v7 dealloc];
}

- (void)startBrowsingFor:(id)a3 withTimeout:(double)a4 deviceFoundHandler:(id)a5
{
  v9 = [(APAssistedModeBrowser *)self internalBrowserQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__APAssistedModeBrowser_startBrowsingFor_withTimeout_deviceFoundHandler___block_invoke;
  v10[3] = &unk_1E688D0E0;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a5;
  *(double *)&v10[7] = a4;
  dispatch_async((dispatch_queue_t)v9, v10);
}

uint64_t __73__APAssistedModeBrowser_startBrowsingFor_withTimeout_deviceFoundHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isBrowsing])
  {
    APSLogErrorAt();
    uint64_t v5 = 4294960587;
  }
  else
  {
    if (gLogCategory_APAssistedModeBrowser <= 30
      && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "setInstanceName:", (id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"AssistedInstanceName", v7));
    if ([*(id *)(a1 + 32) instanceName]
      && (objc_msgSend(*(id *)(a1 + 32), "setBonjourServiceName:", (id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"AssistedBonjourServiceName")), objc_msgSend(*(id *)(a1 + 32), "bonjourServiceName"))&& (objc_msgSend(*(id *)(a1 + 32), "setBonjourProtocol:", (id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"AssistedBonjourProtocol")), objc_msgSend(*(id *)(a1 + 32), "bonjourProtocol")))
    {
      [*(id *)(a1 + 32) setDeviceFoundHandlerBlock:_Block_copy(*(const void **)(a1 + 48))];
      uint64_t v2 = [*(id *)(a1 + 32) startBonjourBrowser];
      if (!v2)
      {
        [*(id *)(a1 + 32) startTimerWithTimeout:*(double *)(a1 + 56)];
        v3 = *(void **)(a1 + 32);
        return [v3 setIsBrowsing:1];
      }
      uint64_t v5 = v2;
      APSLogErrorAt();
    }
    else
    {
      APSLogErrorAt();
      uint64_t v5 = 4294960591;
    }
  }
  v6 = *(void **)(a1 + 32);
  return [v6 stopBrowsingWithError:v5];
}

- (void)stopBrowsing
{
  v3 = [(APAssistedModeBrowser *)self internalBrowserQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__APAssistedModeBrowser_stopBrowsing__block_invoke;
  block[3] = &unk_1E688AC98;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)v3, block);
}

uint64_t __37__APAssistedModeBrowser_stopBrowsing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopBrowsingWithError:4294960573];
}

- (void)setDispatchQueue:(id)a3
{
  uint64_t v5 = [(APAssistedModeBrowser *)self internalBrowserQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__APAssistedModeBrowser_setDispatchQueue___block_invoke;
  v6[3] = &unk_1E688D108;
  v6[4] = a3;
  v6[5] = self;
  dispatch_sync((dispatch_queue_t)v5, v6);
}

void __42__APAssistedModeBrowser_setDispatchQueue___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v2 = *(NSObject **)(a1 + 32);
  }
  else {
    uint64_t v2 = MEMORY[0x1E4F14428];
  }
  dispatch_retain(v2);
  uint64_t v3 = *(void *)(a1 + 40);
  objc_super v4 = *(NSObject **)(v3 + 16);
  if (v4)
  {
    dispatch_release(v4);
    uint64_t v3 = *(void *)(a1 + 40);
  }
  *(void *)(v3 + 16) = v2;
}

- (int)startBonjourBrowser
{
  int v3 = [(APAssistedModeBrowser *)self setupBonjourBrowser];
  if (v3)
  {
    int v4 = v3;
LABEL_9:
    APSLogErrorAt();
    return v4;
  }
  if (gLogCategory_APAssistedModeBrowser <= 50
    && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
  {
    v6 = self;
    id v7 = [(APAssistedModeBrowser *)self getExpectedServiceInstanceName];
    LogPrintF();
  }
  [(APAssistedModeBrowser *)self bonjourBrowser];
  objc_msgSend(-[APAssistedModeBrowser getExpectedBonjourService](self, "getExpectedBonjourService"), "UTF8String");
  int v4 = BonjourBrowser_Start();
  if (v4) {
    goto LABEL_9;
  }
  return v4;
}

- (int)setupBonjourBrowser
{
  if (![(APAssistedModeBrowser *)self bonjourBrowser])
  {
    int v3 = BonjourBrowser_CreateEx();
    if (v3)
    {
      int v4 = v3;
      APSLogErrorAt();
      return v4;
    }
    [(APAssistedModeBrowser *)self bonjourBrowser];
    [(APAssistedModeBrowser *)self internalBrowserQueue];
    BonjourBrowser_SetDispatchQueue();
  }
  [(APAssistedModeBrowser *)self bonjourBrowser];
  BonjourBrowser_SetEventHandlerBlock();
  return 0;
}

uint64_t __44__APAssistedModeBrowser_setupBonjourBrowser__block_invoke(uint64_t result, int a2, CFDictionaryRef theDict)
{
  uint64_t v5 = result;
  if (gLogCategory_APAssistedModeBrowser <= 30
    && (gLogCategory_APAssistedModeBrowser != -1 || (result = _LogCategory_Initialize(), result)))
  {
    if ((a2 - 1) >= 3)
    {
      v6 = "UNKNOWN";
      if (a2 == 4) {
        v6 = "Restarted";
      }
    }
    else
    {
      v6 = off_1E688D178[a2 - 1];
    }
    v11 = v6;
    CFDictionaryRef v12 = theDict;
    v10 = *(void **)(v5 + 32);
    result = LogPrintF();
    if (!theDict) {
      goto LABEL_12;
    }
  }
  else if (!theDict)
  {
    goto LABEL_12;
  }
  result = objc_msgSend((id)objc_msgSend((id)CFDictionaryGetValue(theDict, @"dnsName"), "lowercaseString"), "hasPrefix:", objc_msgSend((id)objc_msgSend(*(id *)(v5 + 32), "getExpectedServiceInstanceName"), "lowercaseString"));
  if ((result & 1) == 0)
  {
    if (gLogCategory_APAssistedModeBrowser > 30) {
      return result;
    }
    if (gLogCategory_APAssistedModeBrowser == -1)
    {
      result = _LogCategory_Initialize();
      if (!result) {
        return result;
      }
    }
    objc_msgSend(*(id *)(v5 + 32), "getExpectedServiceInstanceName", v10, v11, v12);
    return LogPrintF();
  }
LABEL_12:
  if (a2 != 1)
  {
    if (gLogCategory_APAssistedModeBrowser > 30) {
      return result;
    }
    if (gLogCategory_APAssistedModeBrowser == -1)
    {
      result = _LogCategory_Initialize();
      if (!result) {
        return result;
      }
    }
    return LogPrintF();
  }
  if (gLogCategory_APAssistedModeBrowser <= 50
    && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
  {
    id v7 = *(void **)(v5 + 32);
    uint64_t v8 = objc_msgSend(v7, "getExpectedServiceInstanceName", v10, v11, v12);
    v11 = "Add";
    CFDictionaryRef v12 = (CFDictionaryRef)v8;
    v10 = v7;
    LogPrintF();
  }
  objc_msgSend(*(id *)(v5 + 32), "callDeviceFoundHandlerOnce:error:", theDict, 0, v10, v11, v12);
  v9 = *(void **)(v5 + 32);
  return [v9 stopBrowsingWithError:0];
}

- (int)startTimerWithTimeout:(double)a3
{
  if ([(APAssistedModeBrowser *)self isBrowsing]
    || [(APAssistedModeBrowser *)self timeoutTimer])
  {
    APSLogErrorAt();
    return -6709;
  }
  else
  {
    uint64_t v5 = [(APAssistedModeBrowser *)self internalBrowserQueue];
    [(APAssistedModeBrowser *)self setTimeoutTimer:dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v5)];
    if ([(APAssistedModeBrowser *)self timeoutTimer])
    {
      v6 = [(APAssistedModeBrowser *)self timeoutTimer];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __47__APAssistedModeBrowser_startTimerWithTimeout___block_invoke;
      handler[3] = &unk_1E688AC98;
      handler[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v6, handler);
      if (gLogCategory_APAssistedModeBrowser <= 30
        && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
      {
        double v11 = a3;
        v10 = self;
        LogPrintF();
      }
      id v7 = [(APAssistedModeBrowser *)self timeoutTimer];
      dispatch_time_t v8 = dispatch_time(0, 1000000000 * (uint64_t)a3);
      dispatch_source_set_timer((dispatch_source_t)v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_resume((dispatch_object_t)[(APAssistedModeBrowser *)self timeoutTimer]);
      return 0;
    }
    else
    {
      APSLogErrorAt();
      return -6728;
    }
  }
}

uint64_t __47__APAssistedModeBrowser_startTimerWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isBrowsing];
  if (result)
  {
    if (gLogCategory_APAssistedModeBrowser <= 30
      && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v3 = *(void **)(a1 + 32);
    return [v3 stopBrowsingWithError:4294960574];
  }
  return result;
}

- (void)stopBrowsingWithError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(APAssistedModeBrowser *)self timeoutTimer])
  {
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      dispatch_release(timeoutTimer);
      self->_timeoutTimer = 0;
    }
  }
  if ([(APAssistedModeBrowser *)self bonjourBrowser])
  {
    [(APAssistedModeBrowser *)self bonjourBrowser];
    BonjourBrowser_Stop();
    [(APAssistedModeBrowser *)self bonjourBrowser];
    BonjourBrowser_SetEventHandlerBlock();
  }
  if ([(APAssistedModeBrowser *)self isBrowsing]
    && gLogCategory_APAssistedModeBrowser <= 50
    && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
  {
    id v8 = [(APAssistedModeBrowser *)self getExpectedServiceInstanceName];
    uint64_t v9 = v3;
    id v7 = self;
    LogPrintF();
  }

  self->_instanceName = 0;
  self->_bonjourServiceName = 0;

  self->_bonjourProtocol = 0;
  if (v3) {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:(int)v3 userInfo:0];
  }
  else {
    uint64_t v6 = 0;
  }
  -[APAssistedModeBrowser callDeviceFoundHandlerOnce:error:](self, "callDeviceFoundHandlerOnce:error:", 0, v6, v7, v8, v9);
  [(APAssistedModeBrowser *)self setIsBrowsing:0];
}

- (void)callDeviceFoundHandlerOnce:(id)a3 error:(id)a4
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  uint64_t v19 = 0;
  if ([(APAssistedModeBrowser *)self deviceFoundHandlerBlock])
  {
    if (gLogCategory_APAssistedModeBrowser <= 30
      && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
    {
      id v11 = [(APAssistedModeBrowser *)self deviceFoundHandlerBlock];
      id v12 = a4;
      v10 = self;
      LogPrintF();
    }
    id v7 = _Block_copy([(APAssistedModeBrowser *)self deviceFoundHandlerBlock]);
    v15[5] = (uint64_t)v7;
    id deviceFoundHandlerBlock = self->_deviceFoundHandlerBlock;
    if (deviceFoundHandlerBlock)
    {
      _Block_release(deviceFoundHandlerBlock);
      self->_id deviceFoundHandlerBlock = 0;
    }
    uint64_t v9 = [(APAssistedModeBrowser *)self dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__APAssistedModeBrowser_callDeviceFoundHandlerOnce_error___block_invoke;
    block[3] = &unk_1E688D158;
    void block[5] = a4;
    block[6] = &v14;
    block[4] = a3;
    dispatch_async((dispatch_queue_t)v9, block);
  }
  _Block_object_dispose(&v14, 8);
}

void __58__APAssistedModeBrowser_callDeviceFoundHandlerOnce_error___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
  uint64_t v2 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    _Block_release(v2);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = 0;
  }
}

- (id)getExpectedBonjourService
{
  return (id)[NSString stringWithFormat:@"_%@._%@.", -[APAssistedModeBrowser bonjourServiceName](self, "bonjourServiceName"), -[APAssistedModeBrowser bonjourProtocol](self, "bonjourProtocol")];
}

- (id)getExpectedServiceInstanceName
{
  return (id)[NSString stringWithFormat:@"%@.%@", -[APAssistedModeBrowser instanceName](self, "instanceName"), -[APAssistedModeBrowser getExpectedBonjourService](self, "getExpectedBonjourService")];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)isBrowsing
{
  return self->_isBrowsing;
}

- (void)setIsBrowsing:(BOOL)a3
{
  self->_isBrowsing = a3;
}

- (NSString)instanceName
{
  return self->_instanceName;
}

- (void)setInstanceName:(id)a3
{
  self->_instanceName = (NSString *)a3;
}

- (NSString)bonjourServiceName
{
  return self->_bonjourServiceName;
}

- (void)setBonjourServiceName:(id)a3
{
  self->_bonjourServiceName = (NSString *)a3;
}

- (NSString)bonjourProtocol
{
  return self->_bonjourProtocol;
}

- (void)setBonjourProtocol:(id)a3
{
  self->_bonjourProtocol = (NSString *)a3;
}

- (BonjourBrowser)bonjourBrowser
{
  return self->_bonjourBrowser;
}

- (void)setBonjourBrowser:(BonjourBrowser *)a3
{
  self->_bonjourBrowser = a3;
}

- (id)deviceFoundHandlerBlock
{
  return self->_deviceFoundHandlerBlock;
}

- (void)setDeviceFoundHandlerBlock:(id)a3
{
  self->_id deviceFoundHandlerBlock = a3;
}

- (OS_dispatch_queue)internalBrowserQueue
{
  return self->_internalBrowserQueue;
}

- (void)setInternalBrowserQueue:(id)a3
{
  self->_internalBrowserQueue = (OS_dispatch_queue *)a3;
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  self->_timeoutTimer = (OS_dispatch_source *)a3;
}

@end