@interface CAMCallStatusMonitor
+ (id)_processNameForPid:(id)a3;
- (BOOL)isCallActive;
- (CAMCallStatusMonitor)init;
- (CAMCallStatusMonitor)initWithInitialDisabledReasons:(id)a3;
- (NSMutableSet)_disabledReasons;
- (OS_dispatch_queue)_avscAccessQueue;
- (id)_descriptionForReasons:(id)a3;
- (id)_descriptionStringForReason:(int64_t)a3;
- (id)initDisabledForLaunch;
- (int)_processIdentifer;
- (void)_accessQueue_queryCallActiveStatusForReason:(id)a3;
- (void)_accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion:(id)a3;
- (void)_asyncQueryCallActiveStatusForReason:(id)a3;
- (void)_handleApplicationDidEnterBackground:(id)a3;
- (void)_handleApplicationWillEnterForeground:(id)a3;
- (void)_handleCallIsActiveDidChangeNotification:(id)a3;
- (void)_handleRecordingStateDidChangeNotification:(id)a3;
- (void)_handleServerConnectionDiedNotification:(id)a3;
- (void)_handleSomeClientIsActiveDidChangeNotification:(id)a3;
- (void)_registerForAVSystemControllerNotificationsAndQueryState;
- (void)_setCallActive:(BOOL)a3;
- (void)_unregisterForAVSystemControllerNotifications;
- (void)addDisabledReason:(int64_t)a3;
- (void)dealloc;
- (void)removeDisabledReason:(int64_t)a3;
- (void)setCallActive:(BOOL)a3;
@end

@implementation CAMCallStatusMonitor

- (id)initDisabledForLaunch
{
  v3 = [MEMORY[0x263EFFA08] setWithObject:&unk_26BDDE1F0];
  v4 = [(CAMCallStatusMonitor *)self initWithInitialDisabledReasons:v3];

  return v4;
}

- (CAMCallStatusMonitor)initWithInitialDisabledReasons:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CAMCallStatusMonitor;
  v5 = [(CAMCallStatusMonitor *)&v17 init];
  v6 = v5;
  if (v5)
  {
    v5->_callActive = 0;
    if (v4) {
      v7 = (NSMutableSet *)[v4 mutableCopy];
    }
    else {
      v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    }
    disabledReasons = v6->__disabledReasons;
    v6->__disabledReasons = v7;

    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.camera.avsystemcontroller-access", v9);
    avscAccessQueue = v6->__avscAccessQueue;
    v6->__avscAccessQueue = (OS_dispatch_queue *)v10;

    v12 = +[CAMPriorityNotificationCenter defaultCenter];
    [v12 addObserver:v6 selector:sel__handleApplicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];
    [v12 addObserver:v6 selector:sel__handleApplicationWillEnterForeground_ name:*MEMORY[0x263F833B8] object:0];
    if (![(NSMutableSet *)v6->__disabledReasons count])
    {
      v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "Enabling call status monitoring immediately", v16, 2u);
      }

      [(CAMCallStatusMonitor *)v6 _registerForAVSystemControllerNotificationsAndQueryState];
    }
    v14 = v6;
  }
  return v6;
}

- (BOOL)isCallActive
{
  return self->_callActive;
}

- (void)removeDisabledReason:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v5 = [(CAMCallStatusMonitor *)self _disabledReasons];
  uint64_t v6 = [v5 count];
  v7 = [NSNumber numberWithInteger:a3];
  [v5 removeObject:v7];

  uint64_t v8 = [v5 count];
  if (!v6 || v8)
  {
    if (v6 != v8)
    {
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(CAMCallStatusMonitor *)self _descriptionStringForReason:a3];
        v13 = [(CAMCallStatusMonitor *)self _descriptionForReasons:v5];
        int v14 = 138543618;
        v15 = v12;
        __int16 v16 = 2114;
        objc_super v17 = v13;
        _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Removed call status monitoring disabled reason %{public}@: %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v10 = [(CAMCallStatusMonitor *)self _descriptionStringForReason:a3];
      int v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Enabling call status monitoring after removing final disabled reason %{public}@", (uint8_t *)&v14, 0xCu);
    }
    [(CAMCallStatusMonitor *)self _registerForAVSystemControllerNotificationsAndQueryState];
  }
}

- (NSMutableSet)_disabledReasons
{
  return self->__disabledReasons;
}

- (id)_descriptionStringForReason:(int64_t)a3
{
  v3 = @"ApplicationBackgrounded";
  if (a3 != 1) {
    v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"InitialLaunch";
  }
}

- (void)_unregisterForAVSystemControllerNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F54348] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F54470] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F54418] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F54488] object:0];
}

- (OS_dispatch_queue)_avscAccessQueue
{
  return self->__avscAccessQueue;
}

- (void)_accessQueue_queryCallActiveStatusForReason:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CAMCallStatusMonitor *)self _avscAccessQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [MEMORY[0x263F544E0] sharedAVSystemController];
  v7 = [v6 attributeForKey:*MEMORY[0x263F54340]];
  uint64_t v8 = [v6 attributeForKey:*MEMORY[0x263F54410]];
  v9 = [v6 attributeForKey:*MEMORY[0x263F54370]];
  v34 = [v6 attributeForKey:*MEMORY[0x263F54310]];
  dispatch_queue_t v10 = [v34 objectForKeyedSubscript:*MEMORY[0x263F54318]];
  uint64_t v11 = [v8 count];
  if (v11)
  {
    uint64_t v12 = v11;
    v13 = objc_msgSend(NSNumber, "numberWithInt:", -[CAMCallStatusMonitor _processIdentifer](self, "_processIdentifer"));
    int v14 = [v8 containsObject:v13];

    BOOL v15 = v12 != v14;
  }
  else
  {
    BOOL v15 = 0;
  }
  v35 = v9;
  int v16 = [v9 isEqualToString:@"Ringtone"];
  int v17 = [v7 BOOLValue];
  v33 = v10;
  int v18 = [v10 BOOLValue];
  if (v16) {
    int v19 = 1;
  }
  else {
    int v19 = v17 & (v15 | v18);
  }
  v36 = self;
  if (v15)
  {
    id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
    int v21 = [(CAMCallStatusMonitor *)self _processIdentifer];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __68__CAMCallStatusMonitor__accessQueue_queryCallActiveStatusForReason___block_invoke;
    v39[3] = &unk_263FA2EF8;
    int v41 = v21;
    id v40 = v20;
    id v22 = v20;
    [v8 enumerateObjectsUsingBlock:v39];
    v23 = NSString;
    [v22 componentsJoinedByString:@", "];
    v24 = v7;
    v26 = id v25 = v4;
    v27 = [v23 stringWithFormat:@" Recording PIDs (%@)", v26];

    id v4 = v25;
    v7 = v24;
  }
  else
  {
    v27 = 0;
  }
  v28 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = @"Inactive";
    if (v19) {
      v29 = @"Active -";
    }
    v30 = @" Ringtone";
    if (!v16) {
      v30 = &stru_26BD78BA0;
    }
    *(_DWORD *)buf = 138544386;
    v43 = v29;
    v31 = @" HighPriority";
    __int16 v44 = 2114;
    v45 = v30;
    if (!v18) {
      v31 = &stru_26BD78BA0;
    }
    __int16 v46 = 2114;
    v47 = v31;
    __int16 v48 = 2114;
    if (v27) {
      v32 = v27;
    }
    else {
      v32 = &stru_26BD78BA0;
    }
    v49 = v32;
    __int16 v50 = 2114;
    id v51 = v4;
    _os_log_impl(&dword_2099F8000, v28, OS_LOG_TYPE_DEFAULT, "Call status: %{public}@%{public}@%{public}@%{public}@ (%{public}@)", buf, 0x34u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__CAMCallStatusMonitor__accessQueue_queryCallActiveStatusForReason___block_invoke_72;
  block[3] = &unk_263FA02A8;
  block[4] = v36;
  char v38 = v19;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)_setCallActive:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(CAMCallStatusMonitor *)self isCallActive] != v3)
  {
    [(CAMCallStatusMonitor *)self setCallActive:v3];
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"CAMCallStatusMonitorDidChangeCallActiveNotification" object:self];
  }
}

- (void)_handleApplicationDidEnterBackground:(id)a3
{
}

- (void)addDisabledReason:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(CAMCallStatusMonitor *)self _disabledReasons];
  uint64_t v6 = [v5 count];
  v7 = [NSNumber numberWithInteger:a3];
  [v5 addObject:v7];

  uint64_t v8 = [v5 count];
  if (v6 || !v8)
  {
    if (v6 != v8)
    {
      uint64_t v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(CAMCallStatusMonitor *)self _descriptionStringForReason:a3];
        v13 = [(CAMCallStatusMonitor *)self _descriptionForReasons:v5];
        int v14 = 138543618;
        BOOL v15 = v12;
        __int16 v16 = 2114;
        int v17 = v13;
        _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Added call status monitoring disabled reason %{public}@: %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v10 = [(CAMCallStatusMonitor *)self _descriptionStringForReason:a3];
      int v14 = 138543362;
      BOOL v15 = v10;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Disabling call status monitoring for reason %{public}@", (uint8_t *)&v14, 0xCu);
    }
    [(CAMCallStatusMonitor *)self _unregisterForAVSystemControllerNotifications];
  }
}

- (CAMCallStatusMonitor)init
{
  return [(CAMCallStatusMonitor *)self initWithInitialDisabledReasons:0];
}

- (void)dealloc
{
  BOOL v3 = +[CAMPriorityNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(CAMCallStatusMonitor *)self _unregisterForAVSystemControllerNotifications];
  v4.receiver = self;
  v4.super_class = (Class)CAMCallStatusMonitor;
  [(CAMCallStatusMonitor *)&v4 dealloc];
}

- (void)_registerForAVSystemControllerNotificationsAndQueryState
{
  [(CAMCallStatusMonitor *)self _unregisterForAVSystemControllerNotifications];
  objc_initWeak(&location, self);
  BOOL v3 = [(CAMCallStatusMonitor *)self _avscAccessQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__CAMCallStatusMonitor__registerForAVSystemControllerNotificationsAndQueryState__block_invoke;
  v4[3] = &unk_263FA0E00;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __80__CAMCallStatusMonitor__registerForAVSystemControllerNotificationsAndQueryState__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __80__CAMCallStatusMonitor__registerForAVSystemControllerNotificationsAndQueryState__block_invoke_2;
  v3[3] = &unk_263FA1D38;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "_accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion:", v3);

  objc_destroyWeak(&v4);
}

void __80__CAMCallStatusMonitor__registerForAVSystemControllerNotificationsAndQueryState__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = WeakRetained;
    if (WeakRetained)
    {
      id v5 = [WeakRetained _avscAccessQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __80__CAMCallStatusMonitor__registerForAVSystemControllerNotificationsAndQueryState__block_invoke_3;
      block[3] = &unk_263FA0E00;
      objc_copyWeak(&v7, v2);
      dispatch_async(v5, block);

      objc_destroyWeak(&v7);
    }
  }
}

void __80__CAMCallStatusMonitor__registerForAVSystemControllerNotificationsAndQueryState__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessQueue_queryCallActiveStatusForReason:", @"initial query");
}

- (void)_accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion:(id)a3
{
  v18[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CAMCallStatusMonitor *)self _avscAccessQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [MEMORY[0x263F544E0] sharedAVSystemController];
  uint64_t v7 = *MEMORY[0x263F54418];
  v18[0] = *MEMORY[0x263F54348];
  v18[1] = v7;
  v18[2] = *MEMORY[0x263F54488];
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  uint64_t v9 = *MEMORY[0x263F544A0];
  id v17 = 0;
  [v6 setAttribute:v8 forKey:v9 error:&v17];
  id v10 = v17;
  if (v10)
  {
    uint64_t v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(CAMCallStatusMonitor *)(uint64_t)v8 _accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion:v11];
    }
  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __94__CAMCallStatusMonitor__accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion___block_invoke;
  v13[3] = &unk_263FA28F8;
  objc_copyWeak(&v15, &location);
  id v14 = v4;
  id v12 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __94__CAMCallStatusMonitor__accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained _disabledReasons];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:WeakRetained selector:sel__handleRecordingStateDidChangeNotification_ name:*MEMORY[0x263F54418] object:0];
    [v4 addObserver:WeakRetained selector:sel__handleCallIsActiveDidChangeNotification_ name:*MEMORY[0x263F54348] object:0];
    [v4 addObserver:WeakRetained selector:sel__handleServerConnectionDiedNotification_ name:*MEMORY[0x263F54470] object:0];
    [v4 addObserver:WeakRetained selector:sel__handleSomeClientIsActiveDidChangeNotification_ name:*MEMORY[0x263F54488] object:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_descriptionForReasons:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x263EFF9C0] set];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __47__CAMCallStatusMonitor__descriptionForReasons___block_invoke;
    v21[3] = &unk_263FA2E88;
    id v22 = v5;
    v23 = self;
    id v6 = v5;
    [v4 enumerateObjectsUsingBlock:v21];
    uint64_t v7 = [v6 allObjects];
    uint64_t v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_16];

    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", @"(");
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __47__CAMCallStatusMonitor__descriptionForReasons___block_invoke_3;
    uint64_t v18 = &unk_263FA2ED0;
    id v10 = v9;
    id v19 = v10;
    id v20 = v8;
    id v11 = v8;
    [v11 enumerateObjectsUsingBlock:&v15];
    [v10 appendString:@""], v15, v16, v17, v18);
    id v12 = v20;
    v13 = (__CFString *)v10;
  }
  else
  {
    v13 = &stru_26BD78BA0;
  }

  return v13;
}

void __47__CAMCallStatusMonitor__descriptionForReasons___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) _descriptionStringForReason:v3];
  [v4 addObject:v5];
}

uint64_t __47__CAMCallStatusMonitor__descriptionForReasons___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __47__CAMCallStatusMonitor__descriptionForReasons___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  [*(id *)(a1 + 32) appendString:a2];
  uint64_t result = [*(id *)(a1 + 40) count];
  if (result - 1 > a3)
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 appendString:@", "];
  }
  return result;
}

void __68__CAMCallStatusMonitor__accessQueue_queryCallActiveStatusForReason___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 intValue] != *(_DWORD *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = +[CAMCallStatusMonitor _processNameForPid:v5];
    [v3 addObject:v4];
  }
}

uint64_t __68__CAMCallStatusMonitor__accessQueue_queryCallActiveStatusForReason___block_invoke_72(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCallActive:*(unsigned __int8 *)(a1 + 40)];
}

- (int)_processIdentifer
{
  if (_processIdentifer_onceToken != -1) {
    dispatch_once(&_processIdentifer_onceToken, &__block_literal_global_74);
  }
  return _processIdentifer_pid;
}

void __41__CAMCallStatusMonitor__processIdentifer__block_invoke()
{
  id v0 = [MEMORY[0x263F08AB0] processInfo];
  _processIdentifer_pid = [v0 processIdentifier];
}

+ (id)_processNameForPid:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (proc_name([v3 intValue], buffer, 0x100u)) {
    [NSString stringWithUTF8String:buffer];
  }
  else {
  id v4 = [v3 stringValue];
  }

  return v4;
}

- (void)_asyncQueryCallActiveStatusForReason:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(CAMCallStatusMonitor *)self _avscAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CAMCallStatusMonitor__asyncQueryCallActiveStatusForReason___block_invoke;
  block[3] = &unk_263FA0868;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__CAMCallStatusMonitor__asyncQueryCallActiveStatusForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_accessQueue_queryCallActiveStatusForReason:", *(void *)(a1 + 32));
}

- (void)_handleRecordingStateDidChangeNotification:(id)a3
{
}

- (void)_handleCallIsActiveDidChangeNotification:(id)a3
{
}

- (void)_handleSomeClientIsActiveDidChangeNotification:(id)a3
{
}

- (void)_handleServerConnectionDiedNotification:(id)a3
{
  id v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "AVSystemController server connection died, rebuilding AVSystemController.", v5, 2u);
  }

  [(CAMCallStatusMonitor *)self _registerForAVSystemControllerNotificationsAndQueryState];
}

- (void)_handleApplicationWillEnterForeground:(id)a3
{
}

- (void)setCallActive:(BOOL)a3
{
  self->_callActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__avscAccessQueue, 0);
  objc_storeStrong((id *)&self->__disabledReasons, 0);
}

- (void)_accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Could not subscribe to notifications: %{public}@. Error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end