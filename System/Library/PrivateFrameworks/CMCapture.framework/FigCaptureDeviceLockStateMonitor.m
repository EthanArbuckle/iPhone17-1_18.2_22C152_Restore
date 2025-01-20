@interface FigCaptureDeviceLockStateMonitor
+ (id)sharedDeviceLockStateMonitor;
+ (void)initialize;
- (BOOL)deviceIsLocked;
- (FigCaptureDeviceLockStateMonitor)init;
- (uint64_t)_stopMonitoringDeviceLockState;
- (void)_startMonitoringDeviceLockState;
- (void)_updateDeviceLockState;
- (void)_updateObserversWithDeviceIsLockedState:(uint64_t)a1;
- (void)addDeviceLockStateObserver:(id)a3;
- (void)dealloc;
- (void)removeDeviceLockStateObserver:(id)a3;
@end

@implementation FigCaptureDeviceLockStateMonitor

uint64_t __50__FigCaptureDeviceLockStateMonitor_deviceIsLocked__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40);
  return result;
}

- (BOOL)deviceIsLocked
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (!_FigIsNotCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  monitorQueue = self->_monitorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__FigCaptureDeviceLockStateMonitor_deviceIsLocked__block_invoke;
  block[3] = &unk_1E5C246B8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(monitorQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (id)sharedDeviceLockStateMonitor
{
  if (sharedDeviceLockStateMonitor_sDeviceLockStateMonitorOnceToken != -1) {
    dispatch_once(&sharedDeviceLockStateMonitor_sDeviceLockStateMonitorOnceToken, &__block_literal_global_54);
  }
  return (id)sharedDeviceLockStateMonitor_sDeviceLockStateMonitor;
}

+ (void)initialize
{
}

- (FigCaptureDeviceLockStateMonitor)init
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureDeviceLockStateMonitor;
  v2 = [(FigCaptureDeviceLockStateMonitor *)&v6 init];
  if (v2)
  {
    v2->_monitorQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v2->_deviceLockStateObservers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = @"ExtendedDeviceLockState";
    v8[0] = MEMORY[0x1E4F1CC38];
    v2->_mobileKeyBagOptions = (NSDictionary *)(id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    monitorQueue = v2->_monitorQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__FigCaptureDeviceLockStateMonitor_init__block_invoke;
    v5[3] = &unk_1E5C24430;
    v5[4] = v2;
    dispatch_async(monitorQueue, v5);
  }
  return v2;
}

void __40__FigCaptureDeviceLockStateMonitor_init__block_invoke(uint64_t a1)
{
}

- (void)_startMonitoringDeviceLockState
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    if (!*(_DWORD *)(a1 + 24))
    {
      v2 = *(NSObject **)(a1 + 8);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __67__FigCaptureDeviceLockStateMonitor__startMonitoringDeviceLockState__block_invoke;
      handler[3] = &unk_1E5C25910;
      handler[4] = a1;
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)(a1 + 24), v2, handler);
      -[FigCaptureDeviceLockStateMonitor _updateDeviceLockState](a1);
    }
  }
}

- (void)dealloc
{
  monitorQueue = self->_monitorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__FigCaptureDeviceLockStateMonitor_dealloc__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(monitorQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureDeviceLockStateMonitor;
  [(FigCaptureDeviceLockStateMonitor *)&v4 dealloc];
}

uint64_t __43__FigCaptureDeviceLockStateMonitor_dealloc__block_invoke(uint64_t a1)
{
  return -[FigCaptureDeviceLockStateMonitor _stopMonitoringDeviceLockState](*(void *)(a1 + 32));
}

- (uint64_t)_stopMonitoringDeviceLockState
{
  if (result)
  {
    uint64_t v1 = result;
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    result = *(unsigned int *)(v1 + 24);
    if (result)
    {
      result = notify_cancel(result);
      *(_DWORD *)(v1 + 24) = 0;
    }
  }
  return result;
}

FigCaptureDeviceLockStateMonitor *__64__FigCaptureDeviceLockStateMonitor_sharedDeviceLockStateMonitor__block_invoke()
{
  result = objc_alloc_init(FigCaptureDeviceLockStateMonitor);
  sharedDeviceLockStateMonitor_sDeviceLockStateMonitor = (uint64_t)result;
  return result;
}

- (void)addDeviceLockStateObserver:(id)a3
{
  monitorQueue = self->_monitorQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__FigCaptureDeviceLockStateMonitor_addDeviceLockStateObserver___block_invoke;
  v4[3] = &unk_1E5C24458;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(monitorQueue, v4);
}

uint64_t __63__FigCaptureDeviceLockStateMonitor_addDeviceLockStateObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 40);
  return objc_msgSend(v2, "deviceLockStateMonitor:didUpdateDeviceLockState:");
}

- (void)removeDeviceLockStateObserver:(id)a3
{
  monitorQueue = self->_monitorQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__FigCaptureDeviceLockStateMonitor_removeDeviceLockStateObserver___block_invoke;
  v4[3] = &unk_1E5C24458;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(monitorQueue, v4);
}

uint64_t __66__FigCaptureDeviceLockStateMonitor_removeDeviceLockStateObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

void __67__FigCaptureDeviceLockStateMonitor__startMonitoringDeviceLockState__block_invoke(uint64_t a1)
{
}

- (void)_updateDeviceLockState
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    unsigned int v2 = MKBGetDeviceLockState();
    uint64_t v3 = (v2 < 7) & (0x46u >> v2);
    if (*(unsigned __int8 *)(a1 + 40) != v3)
    {
      *(unsigned char *)(a1 + 40) = (v2 < 7) & (0x46u >> v2);
      -[FigCaptureDeviceLockStateMonitor _updateObserversWithDeviceIsLockedState:](a1, v3);
    }
  }
}

- (void)_updateObserversWithDeviceIsLockedState:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v11 = v2;
      LODWORD(v10) = 0;
      FigDebugAssert3();
    }
    v5 = objc_msgSend(*(id *)(a1 + 16), "copy", v10, v11);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v9++) deviceLockStateMonitor:a1 didUpdateDeviceLockState:a2];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

@end