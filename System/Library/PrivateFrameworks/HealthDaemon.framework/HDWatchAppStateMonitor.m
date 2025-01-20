@interface HDWatchAppStateMonitor
+ (void)launchWorkoutAppIfNeededWithFitnessMachineSessionUUID:(id)a3;
- (BOOL)appIsActive;
- (HDWatchAppStateMonitor)initWithBundleIdentifier:(id)a3;
- (HDWatchAppStateMonitor)initWithFirstPartyWorkoutApp;
- (HDWatchAppStateMonitorDelegate)delegate;
- (void)dealloc;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation HDWatchAppStateMonitor

- (HDWatchAppStateMonitor)initWithBundleIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDWatchAppStateMonitor;
  v6 = [(HDWatchAppStateMonitor *)&v11 init];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F62940] sharedMonitorForDisplayType:0];
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    [v7 addObserver:v6];
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      bundleIdentifier = v6->_bundleIdentifier;
      *(_DWORD *)buf = 138543618;
      v13 = v6;
      __int16 v14 = 2114;
      v15 = bundleIdentifier;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding layout observer for %{public}@", buf, 0x16u);
    }
  }
  return v6;
}

- (HDWatchAppStateMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDWatchAppStateMonitorDelegate *)WeakRetained;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138543618;
    v8 = self;
    __int16 v9 = 2114;
    v10 = bundleIdentifier;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing layout observer for %{public}@", buf, 0x16u);
  }
  id v5 = [MEMORY[0x1E4F62940] sharedMonitorForDisplayType:0];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)HDWatchAppStateMonitor;
  [(HDWatchAppStateMonitor *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)appIsActive
{
  return self->_appIsActive;
}

- (HDWatchAppStateMonitor)initWithFirstPartyWorkoutApp
{
  return [(HDWatchAppStateMonitor *)self initWithBundleIdentifier:@"com.apple.SessionTrackerApp"];
}

+ (void)launchWorkoutAppIfNeededWithFitnessMachineSessionUUID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v10 = objc_alloc_init(v3);
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  objc_super v6 = NSString;
  v7 = [v4 UUIDString];

  v8 = [v6 stringWithFormat:@"%@://%@/%@", @"SessionTrackerApp", @"startFitnessMachineSession", v7];
  __int16 v9 = [v5 URLWithString:v8];
  [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F62678]];

  objc_msgSend(MEMORY[0x1E4F629E0], "hd_openApplication:optionsDictionary:completion:", @"com.apple.SessionTrackerApp", v10, &__block_literal_global_121);
}

void __80__HDWatchAppStateMonitor_launchWorkoutAppIfNeededWithFitnessMachineSessionUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  id v5 = *MEMORY[0x1E4F29FB8];
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "Attempt to open workouts failed with error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v6) = 0;
    _os_log_debug_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEBUG, "Workouts successfully opened", (uint8_t *)&v6, 2u);
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 elements];
  if ([v7 count] == 1)
  {
    uint64_t v8 = [v6 elements];
    __int16 v9 = [v8 firstObject];
    id v10 = [v9 bundleIdentifier];
    int v11 = [v10 isEqualToString:self->_bundleIdentifier];
  }
  else
  {
    int v11 = 0;
  }

  uint64_t v12 = [v6 displayBacklightLevel];
  _HKInitializeLogging();
  v13 = (os_log_t *)MEMORY[0x1E4F29FB8];
  __int16 v14 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    uint64_t v16 = v14;
    v17 = HKStringFromBool();
    v18 = HKStringFromBool();
    int v24 = 138544130;
    v25 = self;
    __int16 v26 = 2114;
    v27 = bundleIdentifier;
    __int16 v28 = 2114;
    v29 = v17;
    __int16 v30 = 2114;
    v31 = v18;
    _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_INFO, "%{public}@: didUpdateDisplayLayout for %{public}@, running: %{public}@, screenOn: %{public}@", (uint8_t *)&v24, 0x2Au);

    if ((v11 & 1) == 0) {
      goto LABEL_6;
    }
  }
  else if (!v11)
  {
LABEL_6:
    if ([(HDWatchAppStateMonitor *)self appIsActive])
    {
      _HKInitializeLogging();
      v19 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
      {
        v20 = self->_bundleIdentifier;
        int v24 = 138543618;
        v25 = self;
        __int16 v26 = 2114;
        v27 = v20;
        _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Detected app (%{public}@) deactivated", (uint8_t *)&v24, 0x16u);
      }
      self->_appIsActive = 0;
      v21 = [(HDWatchAppStateMonitor *)self delegate];
      [v21 monitorDidDetectAppDeactivate:self];
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (v12 >= 1)
  {
    if (!self->_appIsActive)
    {
      _HKInitializeLogging();
      v22 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->_bundleIdentifier;
        int v24 = 138543618;
        v25 = self;
        __int16 v26 = 2114;
        v27 = v23;
        _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Detected app (%{public}@) onscreen", (uint8_t *)&v24, 0x16u);
      }
      self->_appIsActive = 1;
    }
    v21 = [(HDWatchAppStateMonitor *)self delegate];
    [v21 monitorDidDetectAppActivate:self];
    goto LABEL_17;
  }
LABEL_18:
}

@end