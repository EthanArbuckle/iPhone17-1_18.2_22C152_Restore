@interface APCarSessionRequestHandler
- (APCarSessionRequestHandler)init;
- (void)_startAdvertisingCarPlayControlForUSB;
- (void)_startAdvertisingCarPlayControlForWiFiUUID:(id)a3;
- (void)addCarPlayHelper:(OpaqueAPCarPlayHelperHelper *)a3;
- (void)cancelRequests;
- (void)checkCarPlayControlAdvertisingForUSB;
- (void)checkCarPlayControlAdvertisingForWiFiUUID:(id)a3;
- (void)dealloc;
- (void)prepareForRemovingWiFiUUID:(id)a3 completion:(id)a4;
- (void)registerSessionRequestHandlerMachService;
- (void)removeCarPlayHelper:(OpaqueAPCarPlayHelperHelper *)a3;
- (void)startAdvertisingCarPlayControlForUSB;
- (void)startAdvertisingCarPlayControlForWiFiUUID:(id)a3;
- (void)startSessionWithHost:(id)a3 requestIdentifier:(id)a4 completion:(id)a5;
- (void)stoppedSessionForHostIdentifier:(id)a3;
@end

@implementation APCarSessionRequestHandler

- (APCarSessionRequestHandler)init
{
  v4.receiver = self;
  v4.super_class = (Class)APCarSessionRequestHandler;
  v2 = [(APCarSessionRequestHandler *)&v4 init];
  if (v2)
  {
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.airplay.APCarSessionRequestHandler", 0);
    v2->_carPlayHelpers = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D548]);
  }
  return v2;
}

- (void)dealloc
{
  carPlayHelpers = self->_carPlayHelpers;
  if (carPlayHelpers)
  {
    CFRelease(carPlayHelpers);
    self->_carPlayHelpers = 0;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)APCarSessionRequestHandler;
  [(APCarSessionRequestHandler *)&v5 dealloc];
}

- (void)registerSessionRequestHandlerMachService
{
  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_agent = (CARSessionRequestAgent *)[objc_alloc(getCARSessionRequestAgentClass()) initWithRequestHandler:self];
}

- (void)addCarPlayHelper:(OpaqueAPCarPlayHelperHelper *)a3
{
  if (self->_agent)
  {
    APSLogErrorAt();
    if (gLogCategory_APBrowserCarSessionHelper <= 90
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __47__APCarSessionRequestHandler_addCarPlayHelper___block_invoke;
    v4[3] = &unk_1E688BFA0;
    v4[4] = self;
    v4[5] = a3;
    dispatch_sync(queue, v4);
  }
}

void __47__APCarSessionRequestHandler_addCarPlayHelper___block_invoke(uint64_t a1)
{
}

- (void)removeCarPlayHelper:(OpaqueAPCarPlayHelperHelper *)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__APCarSessionRequestHandler_removeCarPlayHelper___block_invoke;
  v4[3] = &unk_1E688BFA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __50__APCarSessionRequestHandler_removeCarPlayHelper___block_invoke(uint64_t a1)
{
}

- (void)startSessionWithHost:(id)a3 requestIdentifier:(id)a4 completion:(id)a5
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__APCarSessionRequestHandler_startSessionWithHost_requestIdentifier_completion___block_invoke;
  block[3] = &unk_1E688D6E0;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_sync(queue, block);
  if (a5) {
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 1, 0);
  }
}

uint64_t __80__APCarSessionRequestHandler_startSessionWithHost_requestIdentifier_completion___block_invoke()
{
  return CFSetApplyBlock();
}

void __80__APCarSessionRequestHandler_startSessionWithHost_requestIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_super v5 = *(NSObject **)(DerivedStorage + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__APCarSessionRequestHandler_startSessionWithHost_requestIdentifier_completion___block_invoke_3;
  v6[3] = &unk_1E688D690;
  uint64_t v8 = DerivedStorage;
  uint64_t v9 = a2;
  long long v7 = *(_OWORD *)(a1 + 32);
  dispatch_sync(v5, v6);
}

uint64_t __80__APCarSessionRequestHandler_startSessionWithHost_requestIdentifier_completion___block_invoke_3(uint64_t result)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 48);
  if (*(unsigned char *)(v1 + 160))
  {
    uint64_t v2 = result;
    if (!*(void *)(v1 + 240) && !*(unsigned char *)(v1 + 248))
    {
      SNPrintF();
      if (gLogCategory_APBrowserCarSessionHelper <= 50
        && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v3 = os_transaction_create();
      uint64_t v1 = *(void *)(v2 + 48);
      *(void *)(v1 + 240) = v3;
      *(unsigned char *)(v1 + 248) = 1;
    }
    if (*(void *)(v1 + 256))
    {
      APSEventRecorderRecordEvent();
      uint64_t v4 = LogCategoryCopyOSLogHandle();
      objc_super v5 = (void *)v4;
      if (v4) {
        v6 = v4;
      }
      else {
        v6 = MEMORY[0x1E4F14500];
      }
      if (os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D087F000, v6, OS_SIGNPOST_EVENT, 0x2B8D0800uLL, "AP_SIGNPOST_CAR_STARTSESSIONHOST", "", buf, 2u);
      }
      if (v5) {
    }
      }
    if (gLogCategory_APBrowserCarSessionHelper <= 50
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    id v7 = *(id *)(v2 + 40);
    uint64_t v8 = *(void *)(v2 + 48);
    *(void *)(v8 + 168) = v7;
    uint64_t v9 = *(const void **)(v8 + 176);
    v10 = *(const void **)(v2 + 32);
    *(void *)(v8 + 176) = v10;
    if (v10) {
      CFRetain(v10);
    }
    if (v9) {
      CFRelease(v9);
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v12 = *(void *)(v2 + 48);
    *(CFAbsoluteTime *)(v12 + 184) = Current;
    v13 = *(const void **)(v12 + 136);
    v14 = (const void *)[*(id *)(v2 + 40) carplayWiFiUUID];
    *(void *)(*(void *)(v2 + 48) + 136) = v14;
    if (v14) {
      CFRetain(v14);
    }
    if (v13) {
      CFRelease(v13);
    }
    if (*(void *)(*(void *)(v2 + 48) + 136)) {
      carPlayHelperSession_connectivityHelperCheckIfWiFiUUIDChanged();
    }
    return carPlayHelperSession_updateNetworkAndSessionState(*(const void **)(v2 + 56));
  }
  return result;
}

- (void)stoppedSessionForHostIdentifier:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__APCarSessionRequestHandler_stoppedSessionForHostIdentifier___block_invoke;
  v4[3] = &unk_1E688D108;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __62__APCarSessionRequestHandler_stoppedSessionForHostIdentifier___block_invoke()
{
  return CFSetApplyBlock();
}

void __62__APCarSessionRequestHandler_stoppedSessionForHostIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_super v5 = *(NSObject **)(DerivedStorage + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__APCarSessionRequestHandler_stoppedSessionForHostIdentifier___block_invoke_3;
  block[3] = &unk_1E688ACE8;
  block[5] = DerivedStorage;
  block[6] = a2;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v5, block);
}

uint64_t __62__APCarSessionRequestHandler_stoppedSessionForHostIdentifier___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(unsigned char *)(v1 + 160) && *(void *)(v1 + 168))
  {
    uint64_t v2 = result;
    if (gLogCategory_APBrowserCarSessionHelper <= 50)
    {
      if (gLogCategory_APBrowserCarSessionHelper != -1
        || (v3 = _LogCategory_Initialize(), uint64_t v1 = *(void *)(v2 + 40), v3))
      {
        [*(id *)(v1 + 168) deviceIdentifier];
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }
    uint64_t v4 = *(const void **)(v1 + 136);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(*(void *)(v2 + 40) + 136) = 0;
      uint64_t v1 = *(void *)(v2 + 40);
    }

    uint64_t v5 = *(void *)(v2 + 40);
    *(void *)(v5 + 168) = 0;
    v6 = *(const void **)(v5 + 176);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(*(void *)(v2 + 40) + 176) = 0;
      uint64_t v5 = *(void *)(v2 + 40);
    }
    *(void *)(v5 + 184) = 0;
    *(_DWORD *)(v5 + 192) = 0;
    if (*(void *)(v5 + 240))
    {
      id v7 = (void *)os_transaction_copy_description();
      if (gLogCategory_APBrowserCarSessionHelper <= 50
        && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      free(v7);
      uint64_t v8 = *(void **)(*(void *)(v2 + 40) + 240);
      if (v8)
      {

        *(void *)(*(void *)(v2 + 40) + 240) = 0;
      }
    }
    uint64_t v9 = *(const void **)(v2 + 48);
    return carPlayHelperSession_updateNetworkAndSessionState(v9);
  }
  return result;
}

- (void)_startAdvertisingCarPlayControlForUSB
{
  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFSetApplyBlock();
}

void __67__APCarSessionRequestHandler__startAdvertisingCarPlayControlForUSB__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v4 = *(NSObject **)(DerivedStorage + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__APCarSessionRequestHandler__startAdvertisingCarPlayControlForUSB__block_invoke_2;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = DerivedStorage;
  v5[5] = a2;
  dispatch_sync(v4, v5);
}

uint64_t __67__APCarSessionRequestHandler__startAdvertisingCarPlayControlForUSB__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 160) && *(unsigned char *)(v1 + 64))
  {
    uint64_t v2 = result;
    if (!*(void *)(v1 + 240) && !*(unsigned char *)(v1 + 248))
    {
      SNPrintF();
      if (gLogCategory_APBrowserCarSessionHelper <= 50
        && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v3 = os_transaction_create();
      uint64_t v4 = *(void *)(v2 + 32);
      *(void *)(v4 + 240) = v3;
      *(unsigned char *)(v4 + 248) = 1;
    }
    if (gLogCategory_APBrowserCarSessionHelper <= 50
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(CFAbsoluteTime *)(*(void *)(v2 + 32) + 96) = CFAbsoluteTimeGetCurrent();
    return carPlayHelperSession_updateNetworkAndSessionState(*(const void **)(v2 + 40));
  }
  return result;
}

- (void)startAdvertisingCarPlayControlForUSB
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__APCarSessionRequestHandler_startAdvertisingCarPlayControlForUSB__block_invoke;
  block[3] = &unk_1E688AC98;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __66__APCarSessionRequestHandler_startAdvertisingCarPlayControlForUSB__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startAdvertisingCarPlayControlForUSB];
}

- (void)checkCarPlayControlAdvertisingForUSB
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__APCarSessionRequestHandler_checkCarPlayControlAdvertisingForUSB__block_invoke;
  block[3] = &unk_1E688AC98;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __66__APCarSessionRequestHandler_checkCarPlayControlAdvertisingForUSB__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) wantsCarPlayControlAdvertisingForUSB];
  if (result)
  {
    if (gLogCategory_APBrowserCarSessionHelper <= 50
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _startAdvertisingCarPlayControlForUSB];
  }
  return result;
}

- (void)_startAdvertisingCarPlayControlForWiFiUUID:(id)a3
{
  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFSetApplyBlock();
}

void __73__APCarSessionRequestHandler__startAdvertisingCarPlayControlForWiFiUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v5 = *(NSObject **)(DerivedStorage + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__APCarSessionRequestHandler__startAdvertisingCarPlayControlForWiFiUUID___block_invoke_2;
  block[3] = &unk_1E688ACE8;
  void block[5] = DerivedStorage;
  block[6] = a2;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v5, block);
}

uint64_t __73__APCarSessionRequestHandler__startAdvertisingCarPlayControlForWiFiUUID___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (!*(unsigned char *)(v1 + 160) && *(unsigned char *)(v1 + 104))
  {
    uint64_t v2 = result;
    if (!*(void *)(v1 + 240) && !*(unsigned char *)(v1 + 248))
    {
      SNPrintF();
      if (gLogCategory_APBrowserCarSessionHelper <= 50
        && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v3 = os_transaction_create();
      uint64_t v4 = *(void *)(v2 + 40);
      *(void *)(v4 + 240) = v3;
      *(unsigned char *)(v4 + 248) = 1;
    }
    carPlayHelperSession_connectivityHelperCheckIfWiFiUUIDChanged();
    if (gLogCategory_APBrowserCarSessionHelper <= 50
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v5 = *(const void **)(v2 + 32);
    uint64_t v6 = *(void *)(v2 + 40);
    id v7 = *(const void **)(v6 + 136);
    *(void *)(v6 + 136) = v5;
    if (v5) {
      CFRetain(v5);
    }
    if (v7) {
      CFRelease(v7);
    }
    *(CFAbsoluteTime *)(*(void *)(v2 + 40) + 144) = CFAbsoluteTimeGetCurrent();
    return carPlayHelperSession_updateNetworkAndSessionState(*(const void **)(v2 + 48));
  }
  return result;
}

- (void)startAdvertisingCarPlayControlForWiFiUUID:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__APCarSessionRequestHandler_startAdvertisingCarPlayControlForWiFiUUID___block_invoke;
  v4[3] = &unk_1E688D108;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __72__APCarSessionRequestHandler_startAdvertisingCarPlayControlForWiFiUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startAdvertisingCarPlayControlForWiFiUUID:*(void *)(a1 + 40)];
}

- (void)checkCarPlayControlAdvertisingForWiFiUUID:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__APCarSessionRequestHandler_checkCarPlayControlAdvertisingForWiFiUUID___block_invoke;
  v4[3] = &unk_1E688D108;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __72__APCarSessionRequestHandler_checkCarPlayControlAdvertisingForWiFiUUID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) wantsCarPlayControlAdvertisingForWiFiUUID:*(void *)(a1 + 40)];
  if (result)
  {
    if (gLogCategory_APBrowserCarSessionHelper <= 50
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _startAdvertisingCarPlayControlForWiFiUUID:v4];
  }
  return result;
}

- (void)prepareForRemovingWiFiUUID:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__APCarSessionRequestHandler_prepareForRemovingWiFiUUID_completion___block_invoke;
  v6[3] = &unk_1E688D108;
  void v6[4] = a3;
  v6[5] = self;
  dispatch_sync(queue, v6);
  if (a4) {
    (*((void (**)(id, uint64_t, void))a4 + 2))(a4, 1, 0);
  }
}

uint64_t __68__APCarSessionRequestHandler_prepareForRemovingWiFiUUID_completion___block_invoke()
{
  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return CFSetApplyBlock();
}

void __68__APCarSessionRequestHandler_prepareForRemovingWiFiUUID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v5 = *(NSObject **)(DerivedStorage + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__APCarSessionRequestHandler_prepareForRemovingWiFiUUID_completion___block_invoke_3;
  block[3] = &unk_1E688ACE8;
  void block[5] = a2;
  block[6] = DerivedStorage;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v5, block);
}

uint64_t __68__APCarSessionRequestHandler_prepareForRemovingWiFiUUID_completion___block_invoke_3(uint64_t a1)
{
  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t result = FigCFEqual();
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(const void **)(v3 + 136);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(*(void *)(a1 + 48) + 136) = 0;
      uint64_t v3 = *(void *)(a1 + 48);
    }
    *(void *)(v3 + 144) = 0;
    uint64_t v5 = *(const void **)(a1 + 40);
    return carPlayHelperSession_updateNetworkAndSessionState(v5);
  }
  return result;
}

- (void)cancelRequests
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__APCarSessionRequestHandler_cancelRequests__block_invoke;
  block[3] = &unk_1E688AC98;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __44__APCarSessionRequestHandler_cancelRequests__block_invoke()
{
  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return CFSetApplyBlock();
}

void __44__APCarSessionRequestHandler_cancelRequests__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v4 = *(NSObject **)(DerivedStorage + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__APCarSessionRequestHandler_cancelRequests__block_invoke_3;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = a2;
  v5[5] = DerivedStorage;
  dispatch_sync(v4, v5);
}

uint64_t __44__APCarSessionRequestHandler_cancelRequests__block_invoke_3(uint64_t a1)
{
  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 40);
  *(void *)(v2 + 96) = 0;
  uint64_t v3 = *(const void **)(v2 + 136);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(a1 + 40) + 136) = 0;
    uint64_t v2 = *(void *)(a1 + 40);
  }
  *(void *)(v2 + 144) = 0;

  uint64_t v4 = *(void *)(a1 + 40);
  *(void *)(v4 + 168) = 0;
  uint64_t v5 = *(const void **)(v4 + 176);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(*(void *)(a1 + 40) + 176) = 0;
    uint64_t v4 = *(void *)(a1 + 40);
  }
  *(void *)(v4 + 184) = 0;
  *(_DWORD *)(v4 + 192) = 0;
  if (*(void *)(v4 + 240))
  {
    uint64_t v6 = (void *)os_transaction_copy_description();
    if (gLogCategory_APBrowserCarSessionHelper <= 50
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    free(v6);
    id v7 = *(void **)(*(void *)(a1 + 40) + 240);
    if (v7)
    {

      *(void *)(*(void *)(a1 + 40) + 240) = 0;
    }
  }
  uint64_t v8 = *(const void **)(a1 + 32);
  return carPlayHelperSession_updateNetworkAndSessionState(v8);
}

@end