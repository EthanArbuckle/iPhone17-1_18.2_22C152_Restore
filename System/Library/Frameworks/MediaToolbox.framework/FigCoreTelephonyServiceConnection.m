@interface FigCoreTelephonyServiceConnection
+ (id)sharedInstance;
- (FigCoreTelephonyServiceConnection)init;
- (OpaqueFigCoreTelephonyStatus)currentStatus;
- (int)registerListener:(void *)a3 callback:(void *)a4 queue:(id)a5;
- (void)_handleCTNotification:(__CFString *)a3 notificationInfo:(__CFDictionary *)a4;
- (void)_setupConnection;
- (void)_teardownConnection;
- (void)dealloc;
- (void)deregisterListener:(void *)a3;
- (void)processDataStatusBasic:(id)a3;
@end

@implementation FigCoreTelephonyServiceConnection

- (OpaqueFigCoreTelephonyStatus)currentStatus
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2810000000;
  v9 = &unk_194A3FED6;
  char v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__FigCoreTelephonyServiceConnection_currentStatus__block_invoke;
  block[3] = &unk_1E5795698;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(queue, block);
  v3.hasHighSpeedHighPower = *((unsigned char *)v7 + 32);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__FigCoreTelephonyServiceConnection_currentStatus__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 32) = *(unsigned char *)(*(void *)(result + 32) + 48);
  return result;
}

- (int)registerListener:(void *)a3 callback:(void *)a4 queue:(id)a5
{
  if (a3)
  {
    v9 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A004016944D70uLL);
    if (v9)
    {
      uint64_t v10 = FigCFWeakReferenceHolderCreateWithReferencedObject();
      v9[2] = v10;
      if (v10)
      {
        v9[1] = a3;
        v9[3] = a4;
        dispatch_retain((dispatch_object_t)a5);
        v9[4] = a5;
        queue = self->_queue;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __69__FigCoreTelephonyServiceConnection_registerListener_callback_queue___block_invoke;
        v14[3] = &unk_1E57956E8;
        v14[4] = self;
        v14[5] = v9;
        dispatch_async(queue, v14);
        return 0;
      }
    }
  }
  else
  {
    v9 = 0;
  }
  int v12 = FigSignalErrorAt();
  if (v12) {
    FigCoreTelephonyMonitorCallbackEntryFree(v9);
  }
  return v12;
}

uint64_t __69__FigCoreTelephonyServiceConnection_registerListener_callback_queue___block_invoke(uint64_t a1)
{
  **(void **)(a1 + 40) = 0;
  **(void **)(*(void *)(a1 + 32) + 64) = *(void *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 64) = *(void *)(a1 + 40);
  v2 = *(dispatch_source_t **)(a1 + 32);
  if (v2[2])
  {
    dispatch_source_cancel(v2[2]);
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
    v2 = *(dispatch_source_t **)(a1 + 32);
  }

  return [(dispatch_source_t *)v2 _setupConnection];
}

- (void)deregisterListener:(void *)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__FigCoreTelephonyServiceConnection_deregisterListener___block_invoke;
  v4[3] = &unk_1E57956E8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __56__FigCoreTelephonyServiceConnection_deregisterListener___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  OpaqueFigCoreTelephonyStatus v3 = *(void **)(v2 + 56);
  if (!v3)
  {
LABEL_13:
    *(void *)(*(void *)(a1 + 32) + 16) = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v2 + 8));
    v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    dispatch_time_t v10 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = *(NSObject **)(v11 + 16);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __56__FigCoreTelephonyServiceConnection_deregisterListener___block_invoke_2;
    handler[3] = &unk_1E5794738;
    handler[4] = v11;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
    return;
  }
  do
  {
    v4 = (void *)*v3;
    if (v3[1] != *(void *)(a1 + 40)) {
      goto LABEL_11;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 56);
    if (v6 != v3)
    {
      do
      {
        v7 = v6;
        uint64_t v6 = (void *)*v6;
      }
      while (v6 != v3);
      void *v7 = v4;
      if (v4) {
        goto LABEL_10;
      }
      uint64_t v8 = *(void *)(a1 + 32);
      goto LABEL_9;
    }
    *(void *)(v5 + 56) = v4;
    if (!v4)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      v7 = (void *)(v8 + 56);
LABEL_9:
      *(void *)(v8 + 64) = v7;
    }
LABEL_10:
    FigCoreTelephonyMonitorCallbackEntryFree(v3);
LABEL_11:
    OpaqueFigCoreTelephonyStatus v3 = v4;
  }
  while (v4);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 56)) {
    goto LABEL_13;
  }
}

void __56__FigCoreTelephonyServiceConnection_deregisterListener___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[7])
  {
    [v2 _teardownConnection];
    uint64_t v2 = *(void **)(a1 + 32);
  }
  OpaqueFigCoreTelephonyStatus v3 = v2[2];
  if (v3)
  {
    dispatch_release(v3);
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
  }
}

- (void)_handleCTNotification:(__CFString *)a3 notificationInfo:(__CFDictionary *)a4
{
  uint64_t v6 = (const void *)getkCTConnectionInvalidatedNotification[0]();
  if (CFEqual(a3, v6))
  {
    [(FigCoreTelephonyServiceConnection *)self _teardownConnection];
    for (i = self->_callbackEntries.stqh_first; i; i = *(FigCoreTelephonyMonitorCallbackEntry **)i)
      FigCoreTelephonyMonitorCallbackEntryDoCallback((uint64_t)i, self->_currentStatus.hasHighSpeedHighPower);
    dispatch_time_t v8 = dispatch_time(0, 10000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__FigCoreTelephonyServiceConnection__handleCTNotification_notificationInfo___block_invoke;
    block[3] = &unk_1E5794738;
    block[4] = self;
    dispatch_after(v8, queue, block);
  }
}

uint64_t __76__FigCoreTelephonyServiceConnection__handleCTNotification_notificationInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupConnection];
}

- (void)_setupConnection
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke;
  block[3] = &unk_1E5794738;
  block[4] = self;
  dispatch_async(queue, block);
}

void __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 56) && !*(void *)(v1 + 24))
  {
    OpaqueFigCoreTelephonyStatus v3 = (void *)MEMORY[0x199711A30]();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 72);
    uint64_t v6 = *(void *)(v4 + 8);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke_2;
    v13[3] = &unk_1E57A85F0;
    v13[4] = v4;
    *(void *)(*(void *)(a1 + 32) + 24) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLink_CTServerConnectionCreateOnTargetQueue[0])(v5, @"com.apple.coremedia", v6, (uint64_t)v13);
    v7 = *(void **)(a1 + 32);
    if (!v7[3]
      || (*(void *)(*(void *)(a1 + 32) + 32) = [objc_alloc((Class)getCoreTelephonyClientClass[0]()) initWithQueue:*(void *)(*(void *)(a1 + 32) + 8)], objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:"), uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 24), v9 = getkCTConnectionInvalidatedNotification[0](), v10 = ((uint64_t (*)(uint64_t, uint64_t))softLink_CTServerConnectionRegisterForNotification[0])(v8, v9), v7 = *(void **)(a1 + 32), HIDWORD(v10)))
    {
      [v7 _teardownConnection];
    }
    else
    {
      uint64_t v11 = (void *)v7[4];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke_3;
      v12[3] = &unk_1E57A8618;
      v12[4] = v7;
      [v11 getDataStatusBasic:0 completion:v12];
    }
  }
}

void __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)MEMORY[0x199711A30]();
  [*(id *)(a1 + 32) _handleCTNotification:a2 notificationInfo:a3];
}

void __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  OpaqueFigCoreTelephonyStatus v3 = *(NSObject **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke_4;
  v4[3] = &unk_1E57955D0;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

uint64_t __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) processDataStatusBasic:*(void *)(a1 + 40)];
}

- (void)_teardownConnection
{
  OpaqueFigCoreTelephonyStatus v3 = (void *)MEMORY[0x199711A30](self, a2);
  ctClient = self->_ctClient;
  if (ctClient)
  {
    [(CoreTelephonyClient *)ctClient setDelegate:0];

    self->_ctClient = 0;
  }
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
  {
    ((void (*)(uint64_t))softLink_CTServerConnectionUnregisterForAllNotifications[0])((uint64_t)ctServerConnection);
    CFRelease(self->_ctServerConnection);
    self->_ctServerConnection = 0;
  }

  self->_ctDataStatus = 0;
  self->_currentStatus.hasHighSpeedHighPower = 0;
}

+ (id)sharedInstance
{
  if (sharedInstance_sFigCoreTelephonyServiceConnectionOnceToken != -1) {
    dispatch_once(&sharedInstance_sFigCoreTelephonyServiceConnectionOnceToken, &__block_literal_global_119);
  }
  return (id)sharedInstance_sFigCoreTelephonyServiceConnection;
}

FigCoreTelephonyServiceConnection *__51__FigCoreTelephonyServiceConnection_sharedInstance__block_invoke()
{
  result = objc_alloc_init(FigCoreTelephonyServiceConnection);
  sharedInstance_sFigCoreTelephonyServiceConnection = (uint64_t)result;
  return result;
}

- (void)processDataStatusBasic:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__FigCoreTelephonyServiceConnection_processDataStatusBasic___block_invoke;
  v4[3] = &unk_1E57955D0;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(queue, v4);
}

void __60__FigCoreTelephonyServiceConnection_processDataStatusBasic___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x199711A30]();
  int v3 = [*(id *)(a1 + 32) newRadioCoverage];
  int v4 = [*(id *)(*(void *)(a1 + 40) + 40) newRadioCoverage];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v3 != v4)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    if (v6) {
      LOBYTE(v6) = [v6 newRadioCoverage];
    }
    *(unsigned char *)(v5 + 48) = (_BYTE)v6;
    uint64_t v5 = *(void *)(a1 + 40);
    v7 = *(void **)(v5 + 56);
    if (v7)
    {
      do
      {
        FigCoreTelephonyMonitorCallbackEntryDoCallback((uint64_t)v7, *(unsigned char *)(*(void *)(a1 + 40) + 48));
        v7 = (void *)*v7;
      }
      while (v7);
      uint64_t v5 = *(void *)(a1 + 40);
    }
  }

  *(void *)(*(void *)(a1 + 40) + 40) = *(id *)(a1 + 32);
}

- (FigCoreTelephonyServiceConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)FigCoreTelephonyServiceConnection;
  uint64_t v2 = [(FigCoreTelephonyServiceConnection *)&v6 init];
  int v3 = v2;
  if (v2)
  {
    v2->_allocator = (__CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v4 = FigDispatchQueueCreateWithPriority();
    v3->_queue = (OS_dispatch_queue *)v4;
    if (v4)
    {
      v3->_callbackEntries.stqh_first = 0;
      v3->_callbackEntries.stqh_last = &v3->_callbackEntries.stqh_first;
      v3->_currentStatus.hasHighSpeedHighPower = 0;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  doomTimer = self->_doomTimer;
  if (doomTimer)
  {
    dispatch_source_cancel(doomTimer);
    dispatch_release((dispatch_object_t)self->_doomTimer);
    self->_doomTimer = 0;
  }
  p_callbackEntries = &self->_callbackEntries;
  stqh_first = self->_callbackEntries.stqh_first;
  if (!stqh_first) {
    goto LABEL_14;
  }
  while (1)
  {
    v7 = *(FigCoreTelephonyMonitorCallbackEntry **)stqh_first;
    uint64_t v8 = p_callbackEntries->stqh_first;
    if (p_callbackEntries->stqh_first == stqh_first) {
      break;
    }
    do
    {
      uint64_t v9 = (FigCoreTelephonyMonitorListHead *)v8;
      uint64_t v8 = *(FigCoreTelephonyMonitorCallbackEntry **)v8;
    }
    while (v8 != stqh_first);
    v9->stqh_first = v7;
    if (!v7) {
      goto LABEL_13;
    }
LABEL_11:
    FigCoreTelephonyMonitorCallbackEntryFree(stqh_first);
    stqh_first = v7;
  }
  p_callbackEntries->stqh_first = v7;
  if (v7) {
    goto LABEL_11;
  }
  uint64_t v9 = &self->_callbackEntries;
LABEL_13:
  self->_callbackEntries.stqh_last = &v9->stqh_first;
  FigCoreTelephonyMonitorCallbackEntryFree(stqh_first);
LABEL_14:
  v10.receiver = self;
  v10.super_class = (Class)FigCoreTelephonyServiceConnection;
  [(FigCoreTelephonyServiceConnection *)&v10 dealloc];
}

@end