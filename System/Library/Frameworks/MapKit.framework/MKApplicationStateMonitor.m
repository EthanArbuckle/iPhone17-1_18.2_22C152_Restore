@interface MKApplicationStateMonitor
+ (id)sharedInstance;
- (BOOL)_applicationStateIsForegroundForTaskState:(unsigned __int8)a3;
- (BOOL)forceRunningBoardServicesMonitoring;
- (BOOL)isActive;
- (BOOL)isInBackground;
- (MKApplicationStateMonitor)init;
- (id)_stringForTaskState:(unsigned __int8)a3;
- (void)_becomeActive;
- (void)_enterBackground;
- (void)_exitBackground;
- (void)_handleApplicationStateChangeForMonitor:(id)a3 handle:(id)a4 update:(id)a5 interestedPid:(int)a6;
- (void)_performSynchronouslyOnMainQueue:(id)a3;
- (void)_resignActive;
- (void)_setupProcessMonitorWithIdentifier:(id)a3 interestedPid:(int)a4;
- (void)dealloc;
- (void)setForceRunningBoardServicesMonitoring:(BOOL)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation MKApplicationStateMonitor

- (void)startObserving
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t observerCount = self->_observerCount;
  self->_unint64_t observerCount = observerCount + 1;
  v4 = MKGetApplicationStateMonitorLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v5 = self->_observerCount;
    *(_DWORD *)buf = 134217984;
    *(void *)v34 = v5;
    _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_DEBUG, "Observer count increased to %lu", buf, 0xCu);
  }

  if (!observerCount)
  {
    if (self->_forceRunningBoardServicesMonitoring) {
      goto LABEL_5;
    }
    if (_shouldUseUIApplicationState_once != -1) {
      dispatch_once(&_shouldUseUIApplicationState_once, &__block_literal_global_101);
    }
    if (!_shouldUseUIApplicationState_value)
    {
LABEL_5:
      uint64_t v6 = getpid();
      v7 = [MEMORY[0x1E4F963F8] identifierWithPid:v6];
      id v32 = 0;
      v8 = [MEMORY[0x1E4F963E8] handleForIdentifier:v7 error:&v32];
      id v9 = v32;
      v10 = [v8 currentState];
      uint64_t v11 = [v10 taskState];

      [(MKApplicationStateMonitor *)self _setupProcessMonitorWithIdentifier:v7 interestedPid:v6];
      v12 = MKGetApplicationStateMonitorLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = [v8 bundle];
        v14 = [v13 identifier];
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v34 = v6;
        *(_WORD *)&v34[4] = 2114;
        *(void *)&v34[6] = v14;
        _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_INFO, "Will start monitoring using RunningBoardServices (pid:%{public}d -> %{public}@)", buf, 0x12u);
      }
      BOOL v15 = [(MKApplicationStateMonitor *)self _applicationStateIsForegroundForTaskState:v11];
      self->_inBackground = !v15;
      self->_active = v15;
      v16 = [(MKApplicationStateMonitor *)self _stringForTaskState:v11];
      v17 = MKGetApplicationStateMonitorLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        if (self->_inBackground) {
          v18 = @"YES";
        }
        else {
          v18 = @"NO";
        }
        v19 = v18;
        if (self->_active) {
          v20 = @"YES";
        }
        else {
          v20 = @"NO";
        }
        v21 = v20;
        *(_DWORD *)buf = 138412802;
        *(void *)v34 = v16;
        *(_WORD *)&v34[8] = 2112;
        *(void *)&v34[10] = v19;
        __int16 v35 = 2112;
        v36 = v21;
        _os_log_impl(&dword_18BAEC000, v17, OS_LOG_TYPE_INFO, "Initial monitoring state (state:%@, inBackground:%@, active:%@)", buf, 0x20u);
      }
    }
    else
    {
      v22 = [MEMORY[0x1E4F42738] sharedApplication];
      self->_inBackground = [v22 applicationState] == 2;

      v23 = [MEMORY[0x1E4F42738] sharedApplication];
      self->_active = [v23 applicationState] == 0;

      v24 = MKGetApplicationStateMonitorLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        if (self->_inBackground) {
          v25 = @"YES";
        }
        else {
          v25 = @"NO";
        }
        v26 = v25;
        if (self->_active) {
          v27 = @"YES";
        }
        else {
          v27 = @"NO";
        }
        v28 = v27;
        *(_DWORD *)buf = 138412546;
        *(void *)v34 = v26;
        *(_WORD *)&v34[8] = 2112;
        *(void *)&v34[10] = v28;
        _os_log_impl(&dword_18BAEC000, v24, OS_LOG_TYPE_INFO, "Will start monitoring using UIApplicationState with initial state (inBackground:%@, active:%@)", buf, 0x16u);
      }
      v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v29 addObserver:self selector:sel__enterBackground name:*MEMORY[0x1E4F43660] object:0];

      v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v30 addObserver:self selector:sel__exitBackground name:*MEMORY[0x1E4F43708] object:0];

      v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v31 addObserver:self selector:sel__becomeActive name:*MEMORY[0x1E4F43648] object:0];

      v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 addObserver:self selector:sel__resignActive name:*MEMORY[0x1E4F43710] object:0];
    }
  }
}

+ (id)sharedInstance
{
  if (qword_1EB316128 != -1) {
    dispatch_once(&qword_1EB316128, &__block_literal_global_12);
  }
  v2 = (void *)_MergedGlobals_166;

  return v2;
}

void __43__MKApplicationStateMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MKApplicationStateMonitor);
  v1 = (void *)_MergedGlobals_166;
  _MergedGlobals_166 = (uint64_t)v0;
}

- (MKApplicationStateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MKApplicationStateMonitor;
  result = [(MKApplicationStateMonitor *)&v3 init];
  if (result) {
    result->_isVisible = 1;
  }
  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)_exitBackground
{
  BOOL inBackground = self->_inBackground;
  v4 = MKGetApplicationStateMonitorLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (inBackground)
  {
    if (v5)
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "Will exit background", v6, 2u);
    }

    self->_BOOL inBackground = 0;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"MKApplicationStateWillEnterForegroundNotification" object:self];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "Asked to exit background, but not currently background", buf, 2u);
  }
}

- (void)_becomeActive
{
  BOOL active = self->_active;
  v4 = MKGetApplicationStateMonitorLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (active)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "Asked to become active, but currently active", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "Will become active", v6, 2u);
    }

    self->_BOOL active = 1;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"MKApplicationStateDidBecomeActiveNotification" object:self];
  }
}

- (void)dealloc
{
  [(RBSProcessMonitor *)self->_processMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MKApplicationStateMonitor;
  [(MKApplicationStateMonitor *)&v3 dealloc];
}

- (void)setForceRunningBoardServicesMonitoring:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v5 = MKGetApplicationStateMonitorLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = @"NO";
    if (v3) {
      uint64_t v6 = @"YES";
    }
    v7 = v6;
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "setForceRunningBoardServicesMonitoring:%@", (uint8_t *)&v8, 0xCu);
  }
  self->_forceRunningBoardServicesMonitoring = v3;
}

- (BOOL)_applicationStateIsForegroundForTaskState:(unsigned __int8)a3
{
  if (a3 == 3) {
    return 0;
  }
  if (a3 == 4) {
    return self->_isVisible;
  }
  return 1;
}

- (void)_enterBackground
{
  BOOL inBackground = self->_inBackground;
  v4 = MKGetApplicationStateMonitorLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (inBackground)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "Asked to enter background, but currently background", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "Will enter background", v6, 2u);
    }

    self->_BOOL inBackground = 1;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"MKApplicationStateDidEnterBackgroundNotification" object:self];
  }
}

- (void)_resignActive
{
  BOOL active = self->_active;
  v4 = MKGetApplicationStateMonitorLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (active)
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "Will resign active", v7, 2u);
    }

    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"MKApplicationStateWillResignActiveNotification" object:self];

    self->_BOOL active = 0;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "Asked to resign active, but not currently active", buf, 2u);
    }
  }
}

- (void)_setupProcessMonitorWithIdentifier:(id)a3 interestedPid:(int)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E4F96418];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__MKApplicationStateMonitor__setupProcessMonitorWithIdentifier_interestedPid___block_invoke;
  v11[3] = &unk_1E54BE7E8;
  id v8 = v6;
  id v12 = v8;
  objc_copyWeak(&v14, &location);
  v13 = self;
  int v15 = a4;
  id v9 = [v7 monitorWithConfiguration:v11];
  processMonitor = self->_processMonitor;
  self->_processMonitor = v9;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __78__MKApplicationStateMonitor__setupProcessMonitorWithIdentifier_interestedPid___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [MEMORY[0x1E4F96448] descriptor];
  [v4 setEndowmentNamespaces:&unk_1ED97F5A8];
  BOOL v5 = [MEMORY[0x1E4F96430] predicateMatchingIdentifier:*(void *)(a1 + 32)];
  [v3 setStateDescriptor:v4];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v3 setPredicates:v6];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__MKApplicationStateMonitor__setupProcessMonitorWithIdentifier_interestedPid___block_invoke_2;
  v7[3] = &unk_1E54BE7C0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v7[4] = *(void *)(a1 + 40);
  int v9 = *(_DWORD *)(a1 + 56);
  [v3 setUpdateHandler:v7];
  objc_destroyWeak(&v8);
}

void __78__MKApplicationStateMonitor__setupProcessMonitorWithIdentifier_interestedPid___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v11 = [v9 state];
    id v12 = [v11 endowmentNamespaces];

    int v13 = [v12 containsObject:@"com.apple.frontboard.visibility"];
    id v14 = *(id *)(a1 + 32);
    objc_sync_enter(v14);
    if (WeakRetained[18] == v13)
    {
      objc_sync_exit(v14);
    }
    else
    {
      int v15 = MKGetApplicationStateMonitorLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        if (WeakRetained[18]) {
          v16 = @"YES";
        }
        else {
          v16 = @"NO";
        }
        v17 = v16;
        v18 = @"NO";
        if (v13) {
          v18 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v20 = v17;
        v22 = v17;
        __int16 v23 = 2112;
        v24 = v18;
        v19 = v24;
        _os_log_impl(&dword_18BAEC000, v15, OS_LOG_TYPE_INFO, "RunningBoardServices visibility changed from %@ to %@", buf, 0x16u);
      }
      WeakRetained[18] = v13;
      objc_sync_exit(v14);

      [WeakRetained _handleApplicationStateChangeForMonitor:v7 handle:v8 update:v9 interestedPid:*(unsigned int *)(a1 + 48)];
    }
  }
}

- (void)_handleApplicationStateChangeForMonitor:(id)a3 handle:(id)a4 update:(id)a5 interestedPid:(int)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  int v10 = [a4 pid];
  if (v10 == a6)
  {
    uint64_t v11 = [v9 state];
    uint64_t v12 = [v11 taskState];

    BOOL v13 = [(MKApplicationStateMonitor *)self isInBackground];
    BOOL v14 = !v13;
    BOOL v15 = [(MKApplicationStateMonitor *)self _applicationStateIsForegroundForTaskState:v12];
    v16 = [(MKApplicationStateMonitor *)self _stringForTaskState:v12];
    v17 = MKGetApplicationStateMonitorLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      if (v13) {
        v18 = @"NO";
      }
      else {
        v18 = @"YES";
      }
      v19 = v18;
      if (v15) {
        v20 = @"YES";
      }
      else {
        v20 = @"NO";
      }
      v21 = v20;
      *(_DWORD *)buf = 138412802;
      *(void *)v27 = v16;
      *(_WORD *)&v27[8] = 2112;
      v28 = v19;
      __int16 v29 = 2112;
      v30 = v21;
      _os_log_impl(&dword_18BAEC000, v17, OS_LOG_TYPE_INFO, "(state:%@, wasInForeground:%@, isInForeground:%@)", buf, 0x20u);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __97__MKApplicationStateMonitor__handleApplicationStateChangeForMonitor_handle_update_interestedPid___block_invoke;
    v23[3] = &unk_1E54BB9B0;
    BOOL v24 = v14;
    BOOL v25 = v15;
    v23[4] = self;
    [(MKApplicationStateMonitor *)self _performSynchronouslyOnMainQueue:v23];
  }
  else
  {
    int v22 = v10;
    v16 = MKGetApplicationStateMonitorLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v27 = v22;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = a6;
      _os_log_impl(&dword_18BAEC000, v16, OS_LOG_TYPE_DEBUG, "Received update for process we don't care about, ignoring (pid:%d, interested in %d)", buf, 0xEu);
    }
  }
}

uint64_t __97__MKApplicationStateMonitor__handleApplicationStateChangeForMonitor_handle_update_interestedPid___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 40))
  {
    if (!*(unsigned char *)(result + 41))
    {
      [*(id *)(result + 32) _resignActive];
      v2 = *(void **)(v1 + 32);
      return [v2 _enterBackground];
    }
  }
  else if (*(unsigned char *)(result + 41))
  {
    [*(id *)(result + 32) _exitBackground];
    id v3 = *(void **)(v1 + 32);
    return [v3 _becomeActive];
  }
  return result;
}

- (void)_performSynchronouslyOnMainQueue:(id)a3
{
  id v3 = (void (**)(void))a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v3[2](v3);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MKApplicationStateMonitor__performSynchronouslyOnMainQueue___block_invoke;
    block[3] = &unk_1E54B82E8;
    BOOL v5 = v3;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __62__MKApplicationStateMonitor__performSynchronouslyOnMainQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopObserving
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t observerCount = self->_observerCount;
  if (observerCount)
  {
    unint64_t v4 = observerCount - 1;
    self->_unint64_t observerCount = v4;
    if (v4)
    {
      processMonitor = MKGetApplicationStateMonitorLog();
      if (os_log_type_enabled(processMonitor, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v6 = self->_observerCount;
        int v12 = 134217984;
        unint64_t v13 = v6;
        _os_log_impl(&dword_18BAEC000, processMonitor, OS_LOG_TYPE_DEBUG, "Observer count dropped to %lu", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      if (self->_forceRunningBoardServicesMonitoring) {
        goto LABEL_6;
      }
      if (_shouldUseUIApplicationState_once != -1) {
        dispatch_once(&_shouldUseUIApplicationState_once, &__block_literal_global_101);
      }
      if (!_shouldUseUIApplicationState_value)
      {
LABEL_6:
        id v7 = MKGetApplicationStateMonitorLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_INFO, "Will stop monitoring RunningBoardServices", (uint8_t *)&v12, 2u);
        }

        [(RBSProcessMonitor *)self->_processMonitor invalidate];
        processMonitor = self->_processMonitor;
        self->_processMonitor = 0;
      }
      else
      {
        id v8 = MKGetApplicationStateMonitorLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_INFO, "Will stop monitoring UIApplicationState", (uint8_t *)&v12, 2u);
        }

        id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v9 removeObserver:self name:*MEMORY[0x1E4F43660] object:0];

        int v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v10 removeObserver:self name:*MEMORY[0x1E4F43708] object:0];

        uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v11 removeObserver:self name:*MEMORY[0x1E4F43648] object:0];

        processMonitor = [MEMORY[0x1E4F28EB8] defaultCenter];
        [processMonitor removeObserver:self name:*MEMORY[0x1E4F43710] object:0];
      }
    }
  }
}

- (id)_stringForTaskState:(unsigned __int8)a3
{
  BOOL v5 = 0;
  switch(a3)
  {
    case 0u:
      BOOL v5 = @"unknown";
      break;
    case 1u:
      BOOL v5 = @"terminated";
      break;
    case 3u:
      BOOL v5 = @"background (task suspended)";
      break;
    case 4u:
      if (self->_isVisible) {
        id v7 = @"foreground (running)";
      }
      else {
        id v7 = @"background (running)";
      }
      BOOL v5 = v7;
      goto LABEL_15;
    default:
LABEL_15:
      break;
  }
  return v5;
}

- (BOOL)isInBackground
{
  return self->_inBackground;
}

- (BOOL)forceRunningBoardServicesMonitoring
{
  return self->_forceRunningBoardServicesMonitoring;
}

- (void).cxx_destruct
{
}

@end