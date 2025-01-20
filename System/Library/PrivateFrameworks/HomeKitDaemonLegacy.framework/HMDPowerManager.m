@interface HMDPowerManager
- (BOOL)isNetworkAccessRequired;
- (HMDPowerManager)init;
- (int)_ensureNetworkInterfaceMonitorStarted;
- (void)_ensureNetworkInterfaceMonitorStopped;
- (void)_update;
- (void)dealloc;
- (void)setNetworkAccessRequired:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation HMDPowerManager

- (void).cxx_destruct
{
}

- (BOOL)isNetworkAccessRequired
{
  return self->_networkAccessRequired;
}

- (void)_ensureNetworkInterfaceMonitorStopped
{
  scStore = self->_scStore;
  if (scStore)
  {
    SCDynamicStoreSetDispatchQueue(scStore, 0);
    CFRelease(self->_scStore);
    self->_scStore = 0;
    if (gLogCategory_HMDPowerManager <= 30
      && (gLogCategory_HMDPowerManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  scContext = self->_scContext;
  if (scContext)
  {

    self->_scContext = 0;
  }
  self->_networkInterfaceActive = 0;
}

- (int)_ensureNetworkInterfaceMonitorStarted
{
  memset(&context, 0, sizeof(context));
  if (self->_scStore)
  {
    LODWORD(v9) = 0;
    return v9;
  }
  v3 = self;
  v3->_scContext = v3;
  context.info = v3;
  SCDynamicStoreRef v4 = SCDynamicStoreCreate(0, @"HomeKit:NetworkInterfaceMonitor", (SCDynamicStoreCallBack)_handleNetworkInterfaceChanged, &context);
  if (v4)
  {
LABEL_3:
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    if (!Mutable)
    {
      uint64_t v9 = 4294960568;
      if (!v4)
      {
LABEL_25:
        if (!v9) {
          return v9;
        }
        goto LABEL_26;
      }
LABEL_24:
      CFRelease(v4);
      goto LABEL_25;
    }
    v6 = Mutable;
    CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41AB8], (CFStringRef)*MEMORY[0x1E4F41B28]);
    if (!NetworkInterfaceEntity)
    {
      uint64_t v9 = 4294960568;
      goto LABEL_23;
    }
    CFStringRef v8 = NetworkInterfaceEntity;
    CFArrayAppendValue(v6, NetworkInterfaceEntity);
    CFRelease(v8);
    if (!SCDynamicStoreSetNotificationKeys(v4, 0, v6))
    {
      if (!SCError()) {
        goto LABEL_19;
      }
      uint64_t v10 = SCError();
      if (v10) {
        goto LABEL_18;
      }
    }
    if (SCDynamicStoreSetDispatchQueue(v4, (dispatch_queue_t)v3->_dispatchQueue)) {
      goto LABEL_7;
    }
    if (SCError())
    {
      uint64_t v10 = SCError();
      if (!v10)
      {
LABEL_7:
        self->_scStore = v4;
        v3->_networkInterfaceActive = _isNetworkIntefaceActive();
        if (gLogCategory_HMDPowerManager <= 30
          && (gLogCategory_HMDPowerManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        SCDynamicStoreRef v4 = 0;
        uint64_t v9 = 0;
LABEL_23:
        CFRelease(v6);
        if (!v4) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
LABEL_18:
      uint64_t v9 = v10;
      goto LABEL_23;
    }
LABEL_19:
    uint64_t v9 = 4294960596;
    goto LABEL_23;
  }
  if (SCError())
  {
    uint64_t v9 = SCError();
    if (!v9) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = 4294960596;
  }
LABEL_26:
  if (gLogCategory_HMDPowerManager <= 60
    && (gLogCategory_HMDPowerManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    [(HMDPowerManager *)v3 _ensureNetworkInterfaceMonitorStopped];
  }
  else
  {
    [(HMDPowerManager *)v3 _ensureNetworkInterfaceMonitorStopped];
  }
  return v9;
}

- (void)_update
{
  if (self->_started && self->_networkAccessRequired && isAppleTV()) {
    [(HMDPowerManager *)self _ensureNetworkInterfaceMonitorStarted];
  }
  else {
    [(HMDPowerManager *)self _ensureNetworkInterfaceMonitorStopped];
  }
  BOOL networkInterfaceActive = self->_networkInterfaceActive;
  p_powerAssertion = &self->_powerAssertion;
  IOPMAssertionID v5 = *p_powerAssertion;
  if (!networkInterfaceActive)
  {
    if (!v5) {
      return;
    }
    IOPMAssertionRelease(v5);
    unsigned int *p_powerAssertion = 0;
    if (gLogCategory_HMDPowerManager > 30
      || gLogCategory_HMDPowerManager == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_18:
    goto LABEL_20;
  }
  if (v5) {
    return;
  }
  if (!IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", @"HomeKit remote access", 0, 0, 0, 0.0, 0, p_powerAssertion))
  {
    if (gLogCategory_HMDPowerManager > 30
      || gLogCategory_HMDPowerManager == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_18;
  }
  if (gLogCategory_HMDPowerManager <= 60
    && (gLogCategory_HMDPowerManager != -1 || _LogCategory_Initialize()))
  {
LABEL_20:
    LogPrintF();
  }
}

- (void)stop
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__HMDPowerManager_stop__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __23__HMDPowerManager_stop__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  return [*(id *)(a1 + 32) _update];
}

- (void)start
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__HMDPowerManager_start__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __24__HMDPowerManager_start__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  return [*(id *)(a1 + 32) _update];
}

- (void)setNetworkAccessRequired:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__HMDPowerManager_setNetworkAccessRequired___block_invoke;
  v4[3] = &unk_1E6A19B58;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __44__HMDPowerManager_setNetworkAccessRequired___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 17))
  {
    *(unsigned char *)(v2 + 17) = v1;
    return [*(id *)(result + 32) _update];
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)HMDPowerManager;
  [(HMDPowerManager *)&v2 dealloc];
}

- (HMDPowerManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)HMDPowerManager;
  objc_super v2 = [(HMDPowerManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.HMDPowerManager", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

@end