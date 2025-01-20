@interface APCarPlayPolicyMonitor
- (APCarPlayPolicyMonitor)initWithEndpoint:(OpaqueFigEndpoint *)a3;
- (APCarPlayPolicyMonitorDelegate)delegate;
- (void)dealloc;
- (void)endpointAuthenticationSucceeded;
- (void)setDelegate:(id)a3;
- (void)willDisableVehicleTrackedByMonitor:(id)a3;
- (void)willEnableVehicleTrackedByMonitor:(id)a3;
@end

@implementation APCarPlayPolicyMonitor

- (APCarPlayPolicyMonitor)initWithEndpoint:(OpaqueFigEndpoint *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)APCarPlayPolicyMonitor;
  v4 = [(APCarPlayPolicyMonitor *)&v8 init];
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.APCarPlayPolicyMonitor", 0);
    v4->_weakEndpoint = (OpaqueFigCFWeakReferenceHolder *)FigCFWeakReferenceHolderCreateWithReferencedObject();
    v4->_observedEndpoint = a3;
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    queue = v4->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__APCarPlayPolicyMonitor_initWithEndpoint___block_invoke;
    block[3] = &unk_1E6895E88;
    block[4] = v4;
    dispatch_sync(queue, block);
  }
  return v4;
}

uint64_t __43__APCarPlayPolicyMonitor_initWithEndpoint___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endpointAuthenticationSucceeded];
}

- (void)dealloc
{
  CMNotificationCenterGetDefaultLocalCenter();
  FigNotificationCenterRemoveWeakListener();
  monitor = self->_monitor;
  if (monitor)
  {
    [(CRVehiclePolicyMonitor *)monitor stopMonitoring];
    [(CRVehiclePolicyMonitor *)self->_monitor setDelegate:0];

    self->_monitor = 0;
  }
  weakEndpoint = self->_weakEndpoint;
  if (weakEndpoint)
  {
    CFRelease(weakEndpoint);
    self->_weakEndpoint = 0;
  }
  self->_observedEndpoint = 0;
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)APCarPlayPolicyMonitor;
  [(APCarPlayPolicyMonitor *)&v6 dealloc];
}

- (void)endpointAuthenticationSucceeded
{
  uint64_t v11 = 0;
  if (!self->_monitor)
  {
    uint64_t v3 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v3)
    {
      v4 = (const void *)v3;
      uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      objc_super v8 = *(unsigned int (**)(uint64_t, void, void, uint64_t *))(v7 + 48);
      if (v8)
      {
        if (!v8(CMBaseObject, *MEMORY[0x1E4F20CF8], *MEMORY[0x1E4F1CF80], &v11))
        {
          id v9 = objc_alloc(getCRVehiclePolicyMonitorClass());
          v10 = (CRVehiclePolicyMonitor *)[v9 initWithVehicleCertificateSerial:v11];
          self->_monitor = v10;
          if (v10)
          {
            [(CRVehiclePolicyMonitor *)v10 setDelegate:self];
            [(CRVehiclePolicyMonitor *)self->_monitor startMonitoring];
            if (gLogCategory_APCarPlayPolicyMonitor <= 40
              && (gLogCategory_APCarPlayPolicyMonitor != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
          }
        }
      }
      CFRelease(v4);
    }
  }
}

- (void)willDisableVehicleTrackedByMonitor:(id)a3
{
  if (gLogCategory_APCarPlayPolicyMonitor <= 40
    && (gLogCategory_APCarPlayPolicyMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v4)
  {
    v5 = (const void *)v4;
    if (gLogCategory_APCarPlayPolicyMonitor <= 50
      && (gLogCategory_APCarPlayPolicyMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v6 = dispatch_semaphore_create(0);
    dispatch_retain(v6);
    [(APCarPlayPolicyMonitorDelegate *)self->_delegate setEndpoint:v5 isAllowed:0];
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = *(unsigned int (**)(const void *, void, void (*)(int, int, int, int, dispatch_semaphore_t), NSObject *))(v8 + 16);
    if (!v9 || v9(v5, 0, policyMonitorEndpointDeactivated, v6))
    {
      dispatch_release(v6);
    }
    else
    {
      dispatch_time_t v10 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v6, v10);
      if (gLogCategory_APCarPlayPolicyMonitor <= 50
        && (gLogCategory_APCarPlayPolicyMonitor != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    CFRelease(v5);
    if (v6)
    {
      dispatch_release(v6);
    }
  }
}

- (void)willEnableVehicleTrackedByMonitor:(id)a3
{
  if (gLogCategory_APCarPlayPolicyMonitor <= 40
    && (gLogCategory_APCarPlayPolicyMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v4)
  {
    v5 = (const void *)v4;
    [(APCarPlayPolicyMonitorDelegate *)self->_delegate setEndpoint:v4 isAllowed:1];
    CFRelease(v5);
  }
}

- (APCarPlayPolicyMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (APCarPlayPolicyMonitorDelegate *)a3;
}

@end