@interface HDContentProtectionManager
+ (BOOL)isProtectedDataAvailableWithState:(int64_t)a3;
- (BOOL)deviceUnlockedSinceBoot;
- (BOOL)isInSession;
- (BOOL)isProtectedDataAvailable;
- (BOOL)shouldIgnoreUnlockedState;
- (HDContentProtectionManager)init;
- (HDContentProtectionManager)initWithNotifications:(BOOL)a3 initialState:(int64_t)a4 unlockedSinceBoot:(BOOL)a5;
- (id)diagnosticDescription;
- (int64_t)observedState;
- (uint64_t)_keyBagLockState;
- (void)_observationQueue_adjustContentProtectionStateWithBlock:(uint64_t)a1;
- (void)_updateMKBState;
- (void)addContentProtectionObserver:(id)a3 withQueue:(id)a4;
- (void)addSynchronousContentProtectionObserver:(id)a3;
- (void)dealloc;
- (void)recheckContentProtectionState;
- (void)removeContentProtectionObserver:(id)a3;
- (void)setContentProtectionState:(int64_t)a3;
- (void)setInSession:(BOOL)a3;
- (void)setShouldIgnoreUnlockedState:(BOOL)a3;
@end

@implementation HDContentProtectionManager

- (BOOL)deviceUnlockedSinceBoot
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_unlockedSinceBoot);
  return v2 & 1;
}

+ (BOOL)isProtectedDataAvailableWithState:(int64_t)a3
{
  return a3 == 4 || a3 == 1;
}

- (BOOL)isProtectedDataAvailable
{
  v3 = objc_opt_class();
  int64_t v4 = [(HDContentProtectionManager *)self observedState];

  return [v3 isProtectedDataAvailableWithState:v4];
}

- (int64_t)observedState
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldIgnoreUnlockedState);
  if (v2) {
    return 2;
  }
  return (int)atomic_load((unsigned int *)&self->_contentProtectionState);
}

- (HDContentProtectionManager)init
{
  return [(HDContentProtectionManager *)self initWithNotifications:1 initialState:0 unlockedSinceBoot:0];
}

- (HDContentProtectionManager)initWithNotifications:(BOOL)a3 initialState:(int64_t)a4 unlockedSinceBoot:(BOOL)a5
{
  BOOL v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HDContentProtectionManager;
  v9 = [(HDContentProtectionManager *)&v26 init];
  if (v9)
  {
    uint64_t v10 = HKCreateSerialDispatchQueue();
    observationQueue = v9->_observationQueue;
    v9->_observationQueue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc(MEMORY[0x263F0A5A8]);
    v13 = HKLogInfrastructure();
    uint64_t v14 = [v12 initWithName:@"content-protection-observers" loggingCategory:v13];
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v14;

    id v16 = objc_alloc(MEMORY[0x263F0A800]);
    v17 = HKLogInfrastructure();
    uint64_t v18 = [v16 initWithName:@"content-protection-observers" loggingCategory:v17];
    synchronousObservers = v9->_synchronousObservers;
    v9->_synchronousObservers = (HKSynchronousObserverSet *)v18;

    if (v7)
    {
      v20 = v9->_observationQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke;
      block[3] = &unk_2643D4500;
      v25 = v9;
      dispatch_sync(v20, block);
    }
    else
    {
      if (!a4)
      {
        v23 = [MEMORY[0x263F08690] currentHandler];
        [v23 handleFailureInMethod:a2, v9, @"HDContentProtectionManager.m", 130, @"Invalid parameter not satisfying: %@", @"initialState != HDContentProtectionStateInvalid" object file lineNumber description];
      }
      atomic_store(a4, (unsigned int *)&v9->_contentProtectionState);
      atomic_store(a5, (unsigned __int8 *)&v9->_unlockedSinceBoot);
    }
    v21 = +[HDDiagnosticManager sharedDiagnosticManager];
    [v21 addObject:v9];
  }
  return v9;
}

void __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke(uint64_t a1)
{
  if (MKBDeviceFormattedForContentProtection())
  {
    unsigned __int8 v2 = (const char *)*MEMORY[0x263F55A78];
    v3 = *(int **)(a1 + 32);
    int64_t v4 = v3 + 4;
    v5 = *((void *)v3 + 3);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_2;
    handler[3] = &unk_2643D4528;
    v9 = v3;
    notify_register_dispatch(v2, v4, v5, handler);
    *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 56) = CFAbsoluteTimeGetCurrent();
  }
  atomic_store(-[HDContentProtectionManager _keyBagLockState](*(void *)(a1 + 32)), (unsigned int *)(*(void *)(a1 + 32) + 8));
  atomic_store(MKBDeviceUnlockedSinceBoot() != 0, (unsigned __int8 *)(*(void *)(a1 + 32) + 13));
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 14));
  id v7 = *(id *)(a1 + 32);
  *(void *)(*(void *)(a1 + 32) + 48) = AKSEventsRegister();
  if (!*(void *)(*(void *)(a1 + 32) + 48))
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x263F098E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
      __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_cold_1(v6);
    }
  }
}

void __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_2(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 64) = CFAbsoluteTimeGetCurrent();
  unsigned __int8 v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_3;
  v3[3] = &unk_2643D4500;
  id v4 = v2;
  -[HDContentProtectionManager _observationQueue_adjustContentProtectionStateWithBlock:]((uint64_t)v4, v3);
}

uint64_t __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned __int8 v2 = (unsigned int *)(v1 + 8);
  uint64_t result = -[HDContentProtectionManager _keyBagLockState](v1);
  atomic_store(result, v2);
  return result;
}

- (uint64_t)_keyBagLockState
{
  if (result)
  {
    unsigned int v1 = MKBGetDeviceLockState();
    uint64_t result = 0;
    if (v1 <= 6) {
      return qword_21BFF4490[v1];
    }
  }
  return result;
}

- (void)_observationQueue_adjustContentProtectionStateWithBlock:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = a2;
  if (a1)
  {
    unint64_t v4 = [(id)a1 observedState];
    v3[2](v3);
    uint64_t v5 = [(id)a1 observedState];
    unint64_t v6 = v5;
    id v7 = (os_log_t *)MEMORY[0x263F098E8];
    if ((v5 == 4 || v5 == 1) && (atomic_exchange((atomic_uchar *volatile)(a1 + 13), 1u) & 1) == 0)
    {
      _HKInitializeLogging();
      v8 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21BFB4000, v8, OS_LOG_TYPE_DEFAULT, "First unlock", buf, 2u);
      }
    }
    _HKInitializeLogging();
    os_log_t v9 = *v7;
    BOOL v10 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT);
    if (v6 == v4)
    {
      if (v10)
      {
        v11 = @"invalid";
        switch(v4)
        {
          case 0uLL:
            break;
          case 1uLL:
            v11 = @"unlocked";
            break;
          case 2uLL:
            v11 = @"locked";
            break;
          case 3uLL:
            v11 = @"locking";
            break;
          case 4uLL:
            v11 = @"disabled";
            break;
          default:
            v11 = @"unknown";
            break;
        }
        *(_DWORD *)buf = 138543618;
        v21 = v11;
        __int16 v22 = 2114;
        v23 = v11;
        v17 = v9;
        _os_log_impl(&dword_21BFB4000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring no-op keybag transition (%{public}@ -> %{public}@)", buf, 0x16u);
      }
    }
    else
    {
      if (v10)
      {
        if (v4 > 4) {
          id v12 = @"unknown";
        }
        else {
          id v12 = off_2643D4608[v4];
        }
        if (v6 > 4) {
          v13 = @"unknown";
        }
        else {
          v13 = off_2643D4608[v6];
        }
        *(_DWORD *)buf = 138543618;
        v21 = v12;
        __int16 v22 = 2114;
        v23 = v13;
        uint64_t v14 = v9;
        _os_log_impl(&dword_21BFB4000, v14, OS_LOG_TYPE_DEFAULT, "Key bag transitioning from %{public}@ to %{public}@", buf, 0x16u);
      }
      v15 = *(void **)(a1 + 40);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __86__HDContentProtectionManager__observationQueue_adjustContentProtectionStateWithBlock___block_invoke;
      v19[3] = &__block_descriptor_48_e39_v16__0___HDContentProtectionObserver__8l;
      v19[4] = v6;
      v19[5] = v4;
      [v15 notifyObservers:v19];
      id v16 = *(void **)(a1 + 32);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __86__HDContentProtectionManager__observationQueue_adjustContentProtectionStateWithBlock___block_invoke_2;
      v18[3] = &__block_descriptor_48_e39_v16__0___HDContentProtectionObserver__8l;
      v18[4] = v6;
      v18[5] = v4;
      [v16 notifyObservers:v18];
    }
  }
}

uint64_t __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_4(uint64_t result, int a2, CFDictionaryRef theDict)
{
  if (a2 == 1)
  {
    value[3] = v3;
    value[4] = v4;
    uint64_t v5 = result;
    value[0] = 0;
    uint64_t result = CFDictionaryGetValueIfPresent(theDict, (const void *)*MEMORY[0x263F27710], (const void **)value);
    if (result)
    {
      CFTypeID v6 = CFGetTypeID(value[0]);
      uint64_t result = CFBooleanGetTypeID();
      if (v6 == result)
      {
        uint64_t result = CFBooleanGetValue((CFBooleanRef)value[0]);
        atomic_exchange((atomic_uchar *volatile)(*(void *)(v5 + 32) + 14), result != 0);
      }
    }
  }
  return result;
}

- (void)dealloc
{
  v3 = +[HDDiagnosticManager sharedDiagnosticManager];
  [v3 removeObject:self];

  notify_cancel(self->_notifyToken);
  AKSEventsUnregister();
  v4.receiver = self;
  v4.super_class = (Class)HDContentProtectionManager;
  [(HDContentProtectionManager *)&v4 dealloc];
}

- (void)addContentProtectionObserver:(id)a3 withQueue:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (OS_dispatch_queue *)a4;
  os_log_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"HDContentProtectionManager.m" lineNumber:152 description:@"Observer cannot be nil"];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v12 = [MEMORY[0x263F08690] currentHandler];
  [v12 handleFailureInMethod:a2 object:self file:@"HDContentProtectionManager.m" lineNumber:153 description:@"Queue cannot be NULL"];

LABEL_3:
  if (self->_observationQueue == v9)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"HDContentProtectionManager.m" lineNumber:154 description:@"Queue cannot be the same as _observationQueue"];
  }
  _HKInitializeLogging();
  BOOL v10 = *MEMORY[0x263F098E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v7;
    _os_log_impl(&dword_21BFB4000, v10, OS_LOG_TYPE_DEFAULT, "Added content protection observer %{public}@", (uint8_t *)&v14, 0xCu);
  }
  [(HKObserverSet *)self->_observers registerObserver:v7 queue:v9];
}

- (void)addSynchronousContentProtectionObserver:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"HDContentProtectionManager.m" lineNumber:161 description:@"Observer cannot be nil"];
  }
  _HKInitializeLogging();
  CFTypeID v6 = *MEMORY[0x263F098E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_21BFB4000, v6, OS_LOG_TYPE_DEFAULT, "Added synchronous content protection observer %{public}@", (uint8_t *)&v8, 0xCu);
  }
  [(HKSynchronousObserverSet *)self->_synchronousObservers registerObserver:v5];
}

- (void)removeContentProtectionObserver:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    CFTypeID v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"HDContentProtectionManager.m" lineNumber:168 description:@"Observer cannot be nil"];

    id v5 = 0;
  }
  [(HKObserverSet *)self->_observers unregisterObserver:v5];
  [(HKSynchronousObserverSet *)self->_synchronousObservers unregisterObserver:v7];
}

- (BOOL)isInSession
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isSession);
  return v2 & 1;
}

- (BOOL)shouldIgnoreUnlockedState
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldIgnoreUnlockedState);
  return v2 & 1;
}

- (void)_updateMKBState
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_21BFB4000, log, OS_LOG_TYPE_ERROR, "Actual content protection state '%d' does not match cached content protection state '%d' (found via recheck)", (uint8_t *)v3, 0xEu);
}

- (void)recheckContentProtectionState
{
  observationQueue = self->_observationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HDContentProtectionManager_recheckContentProtectionState__block_invoke;
  block[3] = &unk_2643D4500;
  void block[4] = self;
  dispatch_async(observationQueue, block);
}

void __59__HDContentProtectionManager_recheckContentProtectionState__block_invoke(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v3 = *(void *)(a1 + 32);
  if (Current - *(double *)(v3 + 72) >= 5.0)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __59__HDContentProtectionManager_recheckContentProtectionState__block_invoke_2;
    v4[3] = &unk_2643D4500;
    v4[4] = v3;
    -[HDContentProtectionManager _observationQueue_adjustContentProtectionStateWithBlock:](v3, v4);
    *(double *)(*(void *)(a1 + 32) + 72) = Current;
  }
}

void __59__HDContentProtectionManager_recheckContentProtectionState__block_invoke_2(uint64_t a1)
{
}

- (void)setContentProtectionState:(int64_t)a3
{
  observationQueue = self->_observationQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__HDContentProtectionManager_setContentProtectionState___block_invoke;
  v4[3] = &unk_2643D4578;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(observationQueue, v4);
}

void __56__HDContentProtectionManager_setContentProtectionState___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __56__HDContentProtectionManager_setContentProtectionState___block_invoke_2;
  v2[3] = &unk_2643D4578;
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = v1;
  -[HDContentProtectionManager _observationQueue_adjustContentProtectionStateWithBlock:](v3, v2);
}

uint64_t __56__HDContentProtectionManager_setContentProtectionState___block_invoke_2(uint64_t result)
{
  return result;
}

- (void)setInSession:(BOOL)a3
{
  observationQueue = self->_observationQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__HDContentProtectionManager_setInSession___block_invoke;
  v4[3] = &unk_2643D45A0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(observationQueue, v4);
}

void __43__HDContentProtectionManager_setInSession___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __43__HDContentProtectionManager_setInSession___block_invoke_2;
  v2[3] = &unk_2643D45A0;
  void v2[4] = v1;
  char v3 = *(unsigned char *)(a1 + 40);
  -[HDContentProtectionManager _observationQueue_adjustContentProtectionStateWithBlock:](v1, v2);
}

uint64_t __43__HDContentProtectionManager_setInSession___block_invoke_2(uint64_t result)
{
  return result;
}

- (void)setShouldIgnoreUnlockedState:(BOOL)a3
{
  observationQueue = self->_observationQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__HDContentProtectionManager_setShouldIgnoreUnlockedState___block_invoke;
  v4[3] = &unk_2643D45A0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(observationQueue, v4);
}

void __59__HDContentProtectionManager_setShouldIgnoreUnlockedState___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59__HDContentProtectionManager_setShouldIgnoreUnlockedState___block_invoke_2;
  v2[3] = &unk_2643D45A0;
  void v2[4] = v1;
  char v3 = *(unsigned char *)(a1 + 40);
  -[HDContentProtectionManager _observationQueue_adjustContentProtectionStateWithBlock:](v1, v2);
}

uint64_t __59__HDContentProtectionManager_setShouldIgnoreUnlockedState___block_invoke_2(uint64_t result)
{
  return result;
}

- (id)diagnosticDescription
{
  char v3 = [MEMORY[0x263F089D8] string];
  observationQueue = self->_observationQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__HDContentProtectionManager_diagnosticDescription__block_invoke;
  v8[3] = &unk_2643D45C8;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = self;
  dispatch_sync(observationQueue, v8);
  id v6 = v5;

  return v6;
}

void __51__HDContentProtectionManager_diagnosticDescription__block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  unsigned __int8 v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) observedState];
  if (v3 > 4) {
    uint64_t v4 = @"unknown";
  }
  else {
    uint64_t v4 = off_2643D4608[v3];
  }
  [v2 appendFormat:@"Recorded state: %@\n", v4];
  [*(id *)(a1 + 32) appendFormat:@"System state: %@\n", off_2643D4608[-[HDContentProtectionManager _keyBagLockState](*(void *)(a1 + 40))]];
  id v5 = *(void **)(a1 + 32);
  int v6 = [*(id *)(a1 + 40) deviceUnlockedSinceBoot];
  id v7 = "NO";
  if (v6) {
    id v7 = "YES";
  }
  objc_msgSend(v5, "appendFormat:", @"Unlocked since boot: %s\n", v7);
  if ([*(id *)(a1 + 40) shouldIgnoreUnlockedState]) {
    [*(id *)(a1 + 32) appendString:@"IGNORING UNLOCKED STATE\n"];
  }
  if (*(double *)(*(void *)(a1 + 40) + 64) == 0.0)
  {
    id v9 = HDDiagnosticStringFromDate(0);
  }
  else
  {
    int v8 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:");
    id v9 = HDDiagnosticStringFromDate(v8);
  }
  if (*(double *)(*(void *)(a1 + 40) + 56) == 0.0)
  {
    v11 = HDDiagnosticStringFromDate(0);
  }
  else
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:");
    v11 = HDDiagnosticStringFromDate(v10);
  }
  [*(id *)(a1 + 32) appendFormat:@"Last lock_status notification: %@ (began observing %@)", v9, v11];
  if ([*(id *)(*(void *)(a1 + 40) + 40) count])
  {
    [*(id *)(a1 + 32) appendFormat:@"\nObservers:"];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = [*(id *)(*(void *)(a1 + 40) + 40) allObservers];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v18 = *(void **)(a1 + 32);
          v19 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v19);
          [v18 appendFormat:@"\n\t<%@:%p>", v20, v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v14);
    }
  }
  if ([*(id *)(*(void *)(a1 + 40) + 32) count])
  {
    [*(id *)(a1 + 32) appendFormat:@"\nObservers:"];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v21 = [*(id *)(*(void *)(a1 + 40) + 32) allObservers];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          v27 = *(void **)(a1 + 32);
          v28 = (objc_class *)objc_opt_class();
          v29 = NSStringFromClass(v28);
          [v27 appendFormat:@"\n\t<%@:%p>", v29, v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v23);
    }
  }
}

uint64_t __86__HDContentProtectionManager__observationQueue_adjustContentProtectionStateWithBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentProtectionStateChanged:*(void *)(a1 + 32) previousState:*(void *)(a1 + 40)];
}

uint64_t __86__HDContentProtectionManager__observationQueue_adjustContentProtectionStateWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 contentProtectionStateChanged:*(void *)(a1 + 32) previousState:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronousObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_observationQueue, 0);
}

void __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_cold_1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 138478083;
  unsigned __int8 v2 = @"AKSEvents";
  __int16 v3 = 2113;
  uint64_t v4 = @"kAKSInfoOnenessUnlocked";
  _os_log_error_impl(&dword_21BFB4000, log, OS_LOG_TYPE_ERROR, "Unable to register for %{private}@ %{private}@", (uint8_t *)&v1, 0x16u);
}

@end