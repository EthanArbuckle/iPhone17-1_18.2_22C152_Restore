@interface CURunLoopThread
- (BOOL)_scheduleStopThread;
- (CURunLoopThread)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (id)threadFinalizeHandler;
- (id)threadInitializeHandler;
- (void)_invalidated;
- (void)_threadMain;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)performBlock:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setThreadFinalizeHandler:(id)a3;
- (void)setThreadInitializeHandler:(id)a3;
@end

@implementation CURunLoopThread

- (void).cxx_destruct
{
  objc_storeStrong(&self->_threadFinalizeHandler, 0);
  objc_storeStrong(&self->_threadInitializeHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_startBlocks, 0);
}

- (void)setThreadFinalizeHandler:(id)a3
{
}

- (id)threadFinalizeHandler
{
  return self->_threadFinalizeHandler;
}

- (void)setThreadInitializeHandler:(id)a3
{
}

- (id)threadInitializeHandler
{
  return self->_threadInitializeHandler;
}

- (NSString)label
{
  return self->_label;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_threadMain
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  ucat = self->_ucat;
  if (ucat->var0 > 30) {
    goto LABEL_5;
  }
  if (ucat->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
      goto LABEL_5;
    }
    ucat = self->_ucat;
  }
  LogPrintF((uint64_t)ucat, (uint64_t)"-[CURunLoopThread _threadMain]", 0x1Eu, (uint64_t)"RunLoop thread starting\n", v2, v3, v4, v5, v37);
LABEL_5:
  v8 = self;
  objc_sync_enter(v8);
  v8->_runLoop = CFRunLoopGetCurrent();
  v8->_runLoopValid = 1;
  objc_sync_exit(v8);

  memset(&context, 0, sizeof(context));
  v9 = CFRunLoopSourceCreate(0, 0, &context);
  if (v9) {
    CFRunLoopAddSource(v8->_runLoop, v9, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  }
  v38 = (void *)MEMORY[0x192FAA9B0]();
  threadInitializeHandler = (void (**)(void))v8->_threadInitializeHandler;
  if (threadInitializeHandler) {
    threadInitializeHandler[2]();
  }
  v11 = v8;
  objc_sync_enter(v11);
  v12 = (void *)[(NSMutableArray *)v11->_startBlocks copy];
  [(NSMutableArray *)v11->_startBlocks removeAllObjects];
  startBlocks = v11->_startBlocks;
  v11->_startBlocks = 0;

  objc_sync_exit(v11);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x192FAA9B0]();
        (*(void (**)(uint64_t))(v18 + 16))(v18);
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v15);
  }

  dispatchQueue = v11->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CURunLoopThread__threadMain__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = v11;
  dispatch_async(dispatchQueue, block);
  CFStringRef v21 = (const __CFString *)*MEMORY[0x1E4F1D418];
  while (1)
  {
    v22 = (void *)MEMORY[0x192FAA9B0]();
    uint64_t v27 = CFRunLoopRunInMode(v21, 1.79769313e308, 0);
    if (v27 == 2) {
      break;
    }
    v28 = self->_ucat;
    if (v28->var0 > 10) {
      goto LABEL_22;
    }
    if (v28->var0 != -1) {
      goto LABEL_20;
    }
    if (_LogCategory_Initialize((uint64_t)v28, 0xAu))
    {
      v28 = self->_ucat;
LABEL_20:
      LogPrintF((uint64_t)v28, (uint64_t)"-[CURunLoopThread _threadMain]", 0xAu, (uint64_t)"Waiting for runloop to start (%d)\n", v23, v24, v25, v26, v27);
    }
LABEL_22:
    usleep(0x4E20u);
  }
  v33 = self->_ucat;
  if (v33->var0 <= 30)
  {
    if (v33->var0 != -1) {
      goto LABEL_26;
    }
    if (_LogCategory_Initialize((uint64_t)v33, 0x1Eu))
    {
      v33 = self->_ucat;
LABEL_26:
      LogPrintF((uint64_t)v33, (uint64_t)"-[CURunLoopThread _threadMain]", 0x1Eu, (uint64_t)"RunLoop thread stopping\n", v29, v30, v31, v32, v37);
    }
  }
  threadFinalizeHandler = (void (**)(void))v11->_threadFinalizeHandler;
  if (threadFinalizeHandler) {
    threadFinalizeHandler[2]();
  }
  if (v9)
  {
    CFRunLoopRemoveSource(v8->_runLoop, v9, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(v9);
  }
  v35 = v11;
  objc_sync_enter(v35);
  v8->_runLoop = 0;
  objc_sync_exit(v35);

  v36 = v11->_dispatchQueue;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __30__CURunLoopThread__threadMain__block_invoke_2;
  v39[3] = &unk_1E55BFC18;
  v39[4] = v35;
  dispatch_async(v36, v39);
}

uint64_t __30__CURunLoopThread__threadMain__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(v9 + 48);
  if (*(int *)result <= 30)
  {
    if (*(_DWORD *)result != -1)
    {
LABEL_3:
      uint64_t result = LogPrintF(result, (uint64_t)"-[CURunLoopThread _threadMain]_block_invoke", 0x1Eu, (uint64_t)"Started RunLoop thread\n", a5, a6, a7, a8, v11);
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    uint64_t result = _LogCategory_Initialize(result, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (result)
    {
      uint64_t result = *(void *)(v9 + 48);
      goto LABEL_3;
    }
  }
LABEL_5:
  if (*(unsigned char *)(v9 + 9))
  {
    return [(id)v9 _scheduleStopThread];
  }
  return result;
}

uint64_t __30__CURunLoopThread__threadMain__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CURunLoopThread _threadMain]_block_invoke_2", 0x1Eu, (uint64_t)"Stopped RunLoop thread\n", a5, a6, a7, a8, v14);
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      v10 = *(int **)(v9 + 48);
      goto LABEL_3;
    }
  }
LABEL_5:
  *(unsigned char *)(v9 + 40) = 0;
  v12 = *(void **)(a1 + 32);
  return [v12 _invalidated];
}

- (BOOL)_scheduleStopThread
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL runLoopValid = v2->_runLoopValid;
  v2->_BOOL runLoopValid = 0;
  BOOL v8 = !runLoopValid || v2->_runLoop == 0;
  BOOL v9 = !v8;
  if (!v8)
  {
    ucat = v2->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_12;
        }
        ucat = v2->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CURunLoopThread _scheduleStopThread]", 0x1Eu, (uint64_t)"Scheduling stop of RunLoop thread\n", v3, v4, v5, v6, v14);
    }
LABEL_12:
    runLoop = v2->_runLoop;
    v12 = (const void *)*MEMORY[0x1E4F1D418];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__CURunLoopThread__scheduleStopThread__block_invoke;
    block[3] = &unk_1E55BFC18;
    block[4] = v2;
    CFRunLoopPerformBlock(runLoop, v12, block);
    CFRunLoopWakeUp(v2->_runLoop);
  }
  objc_sync_exit(v2);

  return v9;
}

void __38__CURunLoopThread__scheduleStopThread__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v9 = *(void **)(a1 + 32);
  v10 = (int *)v9[6];
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CURunLoopThread _scheduleStopThread]_block_invoke", 0x1Eu, (uint64_t)"Stopping RunLoop thread\n", a5, a6, a7, a8, v13);
      BOOL v9 = *(void **)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    BOOL v9 = *(void **)(a1 + 32);
    if (v11)
    {
      v10 = (int *)v9[6];
      goto LABEL_3;
    }
  }
LABEL_5:
  obj = v9;
  objc_sync_enter(obj);
  v12 = *(__CFRunLoop **)(*(void *)(a1 + 32) + 16);
  if (v12) {
    CFRunLoopStop(v12);
  }
  objc_sync_exit(obj);
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__CURunLoopThread_performBlock___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __32__CURunLoopThread_performBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v8 = *(unsigned char **)(a1 + 32);
  if (!v8[8]) {
    FatalErrorF((uint64_t)"PerformBlock before activate", a2, a3, a4, a5, a6, a7, a8, v17);
  }
  if (v8[9]) {
    FatalErrorF((uint64_t)"PerformBlock after invalidate", a2, a3, a4, a5, a6, a7, a8, v17);
  }
  obj = v8;
  objc_sync_enter(obj);
  uint64_t v10 = *(void *)(a1 + 32);
  BOOL v11 = *(__CFRunLoop **)(v10 + 16);
  if (v11 && *(unsigned char *)(v10 + 24))
  {
    CFRunLoopPerformBlock(v11, (CFTypeRef)*MEMORY[0x1E4F1D418], *(void **)(a1 + 40));
    CFRunLoopWakeUp(*(CFRunLoopRef *)(*(void *)(a1 + 32) + 16));
  }
  else
  {
    v12 = *(void **)(v10 + 32);
    if (!v12)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void **)(v14 + 32);
      *(void *)(v14 + 32) = v13;

      v12 = *(void **)(*(void *)(a1 + 32) + 32);
    }
    uint64_t v16 = _Block_copy(*(const void **)(a1 + 40));
    [v12 addObject:v16];
  }
  objc_sync_exit(obj);
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 50)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CURunLoopThread _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v13);
        goto LABEL_6;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x32u))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }
LABEL_6:
  if (self->_threadRunning) {
    return;
  }
  id v8 = self->_ucat;
  if (v8->var0 <= 30)
  {
    if (v8->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v8, 0x1Eu)) {
        goto LABEL_11;
      }
      id v8 = self->_ucat;
    }
    LogPrintF((uint64_t)v8, (uint64_t)"-[CURunLoopThread _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v3, v4, v5, v6, v13);
  }
LABEL_11:
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    id v10 = self->_invalidationHandler;
  }
  else
  {
    id v10 = 0;
  }
  self->_invalidationHandler = 0;

  id threadInitializeHandler = self->_threadInitializeHandler;
  self->_id threadInitializeHandler = 0;

  id threadFinalizeHandler = self->_threadFinalizeHandler;
  self->_id threadFinalizeHandler = 0;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CURunLoopThread_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__CURunLoopThread_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *(void *)(result + 32);
  if (*(unsigned char *)(v9 + 9)) {
    return result;
  }
  uint64_t v10 = result;
  BOOL v11 = *(int **)(v9 + 48);
  if (*v11 <= 30)
  {
    if (*v11 != -1)
    {
LABEL_4:
      LogPrintF((uint64_t)v11, (uint64_t)"-[CURunLoopThread invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v18);
      uint64_t v9 = *(void *)(v10 + 32);
      goto LABEL_6;
    }
    BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
    uint64_t v9 = *(void *)(v10 + 32);
    if (v12)
    {
      BOOL v11 = *(int **)(v9 + 48);
      goto LABEL_4;
    }
  }
LABEL_6:
  *(unsigned char *)(v9 + 9) = 1;
  uint64_t result = [*(id *)(v10 + 32) _scheduleStopThread];
  if (result) {
    return result;
  }
  uint64_t v17 = *(void *)(v10 + 32);
  if (*(unsigned char *)(v17 + 8))
  {
    uint64_t result = *(void *)(v17 + 48);
    if (*(int *)result > 30) {
      return result;
    }
    if (*(_DWORD *)result == -1)
    {
      uint64_t result = _LogCategory_Initialize(result, 0x1Eu);
      if (!result) {
        return result;
      }
      uint64_t result = *(void *)(*(void *)(v10 + 32) + 48);
    }
    return LogPrintF(result, (uint64_t)"-[CURunLoopThread invalidate]_block_invoke", 0x1Eu, (uint64_t)"Deferring stop of RunLoop thread until it finishes starting\n", v13, v14, v15, v16, a9);
  }
  else
  {
    return [(id)v17 _invalidated];
  }
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__CURunLoopThread_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__CURunLoopThread_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_5;
      }
      uint64_t v10 = *(int **)(v9 + 48);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CURunLoopThread activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v13);
    uint64_t v9 = *(void *)(a1 + 32);
  }
LABEL_5:
  *(unsigned char *)(v9 + 8) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __27__CURunLoopThread_activate__block_invoke_2;
  v14[3] = &unk_1E55BFC18;
  v14[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4F29060] detachNewThreadWithBlock:v14];
}

void __27__CURunLoopThread_activate__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x192FAA9B0]();
  [*(id *)(a1 + 32) _threadMain];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CD678;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CURunLoopThread;
  [(CURunLoopThread *)&v4 dealloc];
}

- (CURunLoopThread)init
{
  v4.receiver = self;
  v4.super_class = (Class)CURunLoopThread;
  uint64_t v2 = [(CURunLoopThread *)&v4 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CURunLoopThread;
  }
  return v2;
}

@end