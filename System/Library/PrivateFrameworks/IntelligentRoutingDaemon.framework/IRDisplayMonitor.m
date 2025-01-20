@interface IRDisplayMonitor
- (BOOL)displayLocked;
- (BOOL)displayOn;
- (BOOL)isContinuityDisplay;
- (FBSDisplayLayoutMonitor)continuityDisplayMonitor;
- (FBSDisplayLayoutMonitor)defaultMainDisplayMonitor;
- (IRDisplayMonitor)init;
- (NSDate)appInFocusTimestamp;
- (NSHashTable)observers;
- (NSString)appInFocus;
- (id)getAppInFocusWithTimestamp;
- (os_unfair_lock_s)lock;
- (void)_didUpdateContinuityDisplay:(id)a3;
- (void)_didUpdateMainDisplayLayout:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setAppInFocus:(id)a3;
- (void)setAppInFocusTimestamp:(id)a3;
- (void)setContinuityDisplayMonitor:(id)a3;
- (void)setDefaultMainDisplayMonitor:(id)a3;
- (void)setDisplayLocked:(BOOL)a3;
- (void)setDisplayOn:(BOOL)a3;
- (void)setIsContinuityDisplay:(BOOL)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setObservers:(id)a3;
@end

@implementation IRDisplayMonitor

- (void)_didUpdateMainDisplayLayout:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(IRDisplayMonitor *)self appInFocus];
  v6 = [v4 elements];
  v7 = [v6 firstWhere:&__block_literal_global_15];
  v8 = [v7 bundleIdentifier];
  [(IRDisplayMonitor *)self setAppInFocus:v8];

  LODWORD(v6) = [(IRDisplayMonitor *)self displayOn];
  -[IRDisplayMonitor setDisplayOn:](self, "setDisplayOn:", [v4 displayBacklightLevel] > 0);
  if (v6 != [(IRDisplayMonitor *)self displayOn])
  {
    v9 = (id)*MEMORY[0x263F50090];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [(IRDisplayMonitor *)self displayOn];
      v11 = @"off";
      if (v10) {
        v11 = @"on";
      }
      *(_DWORD *)buf = 138412290;
      v48 = v11;
      _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_DEFAULT, "#display-monitor, Display: %@", buf, 0xCu);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v12 = [(IRDisplayMonitor *)self observers];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v42 != v14) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "monitor:didUpdateDisplayOn:", self, -[IRDisplayMonitor displayOn](self, "displayOn"));
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v13);
    }
  }
  BOOL v16 = [(IRDisplayMonitor *)self displayLocked];
  v17 = [v4 elements];
  v18 = [v17 firstWhere:&__block_literal_global_13];
  [(IRDisplayMonitor *)self setDisplayLocked:v18 != 0];

  if (v16 == [(IRDisplayMonitor *)self displayLocked])
  {
    uint64_t v22 = 0;
  }
  else
  {
    v19 = (id)*MEMORY[0x263F50090];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = [(IRDisplayMonitor *)self displayLocked];
      v21 = @"unlocked";
      if (v20) {
        v21 = @"locked";
      }
      *(_DWORD *)buf = 138412290;
      v48 = v21;
      _os_log_impl(&dword_25418E000, v19, OS_LOG_TYPE_DEFAULT, "#display-monitor, Display: %@", buf, 0xCu);
    }

    uint64_t v22 = [(IRDisplayMonitor *)self displayLocked] ^ 1;
  }
  v23 = +[IRPreferences shared];
  v24 = [v23 bannersFromScreenUnlockToAppInFocusEnable];
  if ([v24 BOOLValue])
  {
    BOOL v25 = [(IRDisplayMonitor *)self displayLocked];

    if (v25) {
      [(IRDisplayMonitor *)self setAppInFocus:0];
    }
  }
  else
  {
  }
  v26 = [(IRDisplayMonitor *)self appInFocus];
  char v27 = [v5 isEqual:v26];

  if ((v27 & 1) == 0)
  {
    v28 = [(IRDisplayMonitor *)self appInFocus];

    if (v28)
    {
      v29 = [v4 timestamp];
      if (v29) {
        [v4 timestamp];
      }
      else {
      v30 = [MEMORY[0x263EFF910] date];
      }
      [(IRDisplayMonitor *)self setAppInFocusTimestamp:v30];
    }
    else
    {
      [(IRDisplayMonitor *)self setAppInFocusTimestamp:0];
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v31 = [(IRDisplayMonitor *)self observers];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v38 != v33) {
            objc_enumerationMutation(v31);
          }
          v35 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          v36 = [(IRDisplayMonitor *)self appInFocus];
          [v35 monitor:self didUpdateAppInFocus:v36 isScreenUnlockEvent:v22];
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v32);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)appInFocus
{
  return self->_appInFocus;
}

- (BOOL)displayLocked
{
  return self->_displayLocked;
}

- (BOOL)displayOn
{
  return self->_displayOn;
}

uint64_t __48__IRDisplayMonitor__didUpdateMainDisplayLayout___block_invoke_11(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqual:*MEMORY[0x263F3F560]];

  return v3;
}

uint64_t __48__IRDisplayMonitor__didUpdateMainDisplayLayout___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 bundleIdentifier];
  if (v3 && [v2 layoutRole] == 1) {
    uint64_t v4 = [v2 isUIApplicationElement];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)setDisplayOn:(BOOL)a3
{
  self->_displayOn = a3;
}

- (void)setDisplayLocked:(BOOL)a3
{
  self->_displayLocked = a3;
}

- (void)setAppInFocus:(id)a3
{
}

- (void)setAppInFocusTimestamp:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSDate)appInFocusTimestamp
{
  return self->_appInFocusTimestamp;
}

void __24__IRDisplayMonitor_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _didUpdateMainDisplayLayout:v4];
}

- (IRDisplayMonitor)init
{
  v20.receiver = self;
  v20.super_class = (Class)IRDisplayMonitor;
  id v2 = [(IRDisplayMonitor *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(IRDisplayMonitor *)v2 setObservers:v3];

    [(IRDisplayMonitor *)v2 setLock:0];
    objc_initWeak(&location, v2);
    id v4 = (void *)MEMORY[0x263F3F728];
    v5 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __24__IRDisplayMonitor_init__block_invoke;
    v17[3] = &unk_2653A0658;
    objc_copyWeak(&v18, &location);
    [v5 setTransitionHandler:v17];
    objc_destroyWeak(&v18);
    v6 = [v4 monitorWithConfiguration:v5];
    [(IRDisplayMonitor *)v2 setDefaultMainDisplayMonitor:v6];

    v7 = [(IRDisplayMonitor *)v2 defaultMainDisplayMonitor];
    v8 = [v7 currentLayout];
    [(IRDisplayMonitor *)v2 _didUpdateMainDisplayLayout:v8];

    v9 = (void *)MEMORY[0x263F3F728];
    BOOL v10 = [MEMORY[0x263F3F738] configurationForContinuityDisplay];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __24__IRDisplayMonitor_init__block_invoke_2;
    v15[3] = &unk_2653A0658;
    objc_copyWeak(&v16, &location);
    [v10 setTransitionHandler:v15];
    objc_destroyWeak(&v16);
    v11 = [v9 monitorWithConfiguration:v10];
    [(IRDisplayMonitor *)v2 setContinuityDisplayMonitor:v11];

    v12 = [(IRDisplayMonitor *)v2 continuityDisplayMonitor];
    uint64_t v13 = [v12 currentLayout];
    [(IRDisplayMonitor *)v2 _didUpdateContinuityDisplay:v13];

    objc_destroyWeak(&location);
  }
  return v2;
}

void __24__IRDisplayMonitor_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _didUpdateContinuityDisplay:v4];
}

- (void)dealloc
{
  uint64_t v3 = [(IRDisplayMonitor *)self defaultMainDisplayMonitor];
  [v3 invalidate];

  id v4 = [(IRDisplayMonitor *)self continuityDisplayMonitor];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)IRDisplayMonitor;
  [(IRDisplayMonitor *)&v5 dealloc];
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v5 = [(IRDisplayMonitor *)self observers];
  char v6 = [v5 containsObject:v8];

  if ((v6 & 1) == 0)
  {
    v7 = [(IRDisplayMonitor *)self observers];
    [v7 addObject:v8];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v5 = [(IRDisplayMonitor *)self observers];
  char v6 = [v5 containsObject:v8];

  if (v6)
  {
    v7 = [(IRDisplayMonitor *)self observers];
    [v7 removeObject:v8];
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)getAppInFocusWithTimestamp
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(IRDisplayMonitor *)self appInFocus];

  if (v4)
  {
    objc_super v5 = [(IRDisplayMonitor *)self appInFocus];
    char v6 = [(IRDisplayMonitor *)self appInFocusTimestamp];
    v7 = +[IRPair pairWithFirst:v5 second:v6];
  }
  else
  {
    v7 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)_didUpdateContinuityDisplay:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL v5 = [(IRDisplayMonitor *)self isContinuityDisplay];
  char v6 = [v4 displayConfiguration];
  v7 = [v6 identity];
  [(IRDisplayMonitor *)self setIsContinuityDisplay:v7 != 0];

  if (v5 != [(IRDisplayMonitor *)self isContinuityDisplay])
  {
    id v8 = (id)*MEMORY[0x263F50090];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(IRDisplayMonitor *)self isContinuityDisplay];
      BOOL v10 = @"off";
      if (v9) {
        BOOL v10 = @"on";
      }
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_DEFAULT, "#display-monitor, Continuity Display: %@", buf, 0xCu);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v11 = [(IRDisplayMonitor *)self observers];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "monitor:didUpdateIsContinuityDisplay:", self, -[IRDisplayMonitor isContinuityDisplay](self, "isContinuityDisplay"));
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isContinuityDisplay
{
  return self->_isContinuityDisplay;
}

- (void)setIsContinuityDisplay:(BOOL)a3
{
  self->_isContinuityDisplay = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void)setObservers:(id)a3
{
}

- (FBSDisplayLayoutMonitor)defaultMainDisplayMonitor
{
  return self->_defaultMainDisplayMonitor;
}

- (void)setDefaultMainDisplayMonitor:(id)a3
{
}

- (FBSDisplayLayoutMonitor)continuityDisplayMonitor
{
  return self->_continuityDisplayMonitor;
}

- (void)setContinuityDisplayMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInFocusTimestamp, 0);
  objc_storeStrong((id *)&self->_appInFocus, 0);
  objc_storeStrong((id *)&self->_continuityDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_defaultMainDisplayMonitor, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end