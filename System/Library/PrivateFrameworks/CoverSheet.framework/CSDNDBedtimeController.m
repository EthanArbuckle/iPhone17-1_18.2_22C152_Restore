@interface CSDNDBedtimeController
- (BOOL)isActive;
- (BOOL)isGreetingDisabled;
- (BOOL)shouldShowGreeting;
- (CSDNDBedtimeController)init;
- (CSDNDBedtimeController)initWithStateService:(id)a3 initialObserver:(id)a4;
- (void)_cleanUpGreetingGracePeriodTimer;
- (void)_setShouldShowGreeting:(BOOL)a3;
- (void)_setShouldShowGreeting:(BOOL)a3 forceUpdateObservers:(BOOL)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)isGreetingDisabled;
- (void)removeObserver:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setShouldShowGreeting:(BOOL)a3;
- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
@end

@implementation CSDNDBedtimeController

- (CSDNDBedtimeController)initWithStateService:(id)a3 initialObserver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSDNDBedtimeController;
  v9 = [(CSDNDBedtimeController *)&v18 init];
  v10 = v9;
  if (v9)
  {
    if (v8) {
      [(CSDNDBedtimeController *)v9 addObserver:v8];
    }
    objc_storeStrong((id *)&v10->_stateService, a3);
    [(DNDStateService *)v10->_stateService addStateUpdateListener:v10 withCompletionHandler:0];
    stateService = v10->_stateService;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__CSDNDBedtimeController_initWithStateService_initialObserver___block_invoke;
    v16[3] = &unk_1E6AD9F78;
    v12 = v10;
    v17 = v12;
    [(DNDStateService *)stateService queryCurrentStateWithCompletionHandler:v16];
    id v13 = objc_alloc_init(MEMORY[0x1E4FA5570]);
    id v14 = v12[5];
    v12[5] = v13;

    [v12[5] addObserver:v12];
  }

  return v10;
}

void __63__CSDNDBedtimeController_initWithStateService_initialObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__CSDNDBedtimeController_initWithStateService_initialObserver___block_invoke_2;
  v5[3] = &unk_1E6AD88C0;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __63__CSDNDBedtimeController_initWithStateService_initialObserver___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "sb_isBedtimeModeActive");
  id v3 = *(void **)(a1 + 40);

  return [v3 setActive:v2];
}

- (CSDNDBedtimeController)init
{
  id v3 = [MEMORY[0x1E4F5F760] serviceForClientIdentifier:@"com.apple.springboard.dashboard.bedtime"];
  id v4 = [(CSDNDBedtimeController *)self initWithStateService:v3 initialObserver:0];

  return v4;
}

- (void)dealloc
{
  [(DNDStateService *)self->_stateService removeStateUpdateListener:self];
  [(CSDNDBedtimeController *)self _cleanUpGreetingGracePeriodTimer];
  v3.receiver = self;
  v3.super_class = (Class)CSDNDBedtimeController;
  [(CSDNDBedtimeController *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  if (![(NSHashTable *)observers containsObject:v4]) {
    [(NSHashTable *)self->_observers addObject:v8];
  }
}

- (void)removeObserver:(id)a3
{
}

- (void)setActive:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_active != a3)
  {
    self->_active = a3;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = self->_observers;
    uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v9 = SBLogDoNotDisturbBedtime();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = NSStringFromBOOL();
            *(_DWORD *)buf = 138412290;
            v23 = v10;
            _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "Active state changed to: %@", buf, 0xCu);
          }
          [v8 dndBedtimeControllerActiveStateDidChange:self];
        }
        uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v5);
    }

    if (self->_active)
    {
      [(CSDNDBedtimeController *)self _setShouldShowGreeting:0];
    }
    else if (self->_deactivated && ![(CSDNDBedtimeController *)self isGreetingDisabled])
    {
      [(CSDNDBedtimeController *)self _setShouldShowGreeting:1];
      objc_initWeak((id *)buf, self);
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"CSDNDBedtimeController.greetingGracePeriodTimer"];
      greetingGracePeriodTimer = self->_greetingGracePeriodTimer;
      p_greetingGracePeriodTimer = &self->_greetingGracePeriodTimer;
      *p_greetingGracePeriodTimer = (BSAbsoluteMachTimer *)v11;

      id v14 = *p_greetingGracePeriodTimer;
      id v15 = MEMORY[0x1E4F14428];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __36__CSDNDBedtimeController_setActive___block_invoke;
      v16[3] = &unk_1E6AD89D0;
      objc_copyWeak(&v17, (id *)buf);
      [(BSAbsoluteMachTimer *)v14 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v16 queue:900.0 handler:0.0];

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __36__CSDNDBedtimeController_setActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanUpGreetingGracePeriodTimer];
  [WeakRetained _setShouldShowGreeting:0];
}

- (BOOL)isGreetingDisabled
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  sleepStore = self->_sleepStore;
  id v15 = 0;
  id v4 = [(HKSPSleepStore *)sleepStore currentSleepSettingsWithError:&v15];
  id v5 = v15;
  sleepSettings = self->_sleepSettings;
  self->_sleepSettings = v4;

  id v7 = self->_sleepSettings;
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v5 == 0;
  }
  if (v8)
  {
    char v9 = [(HKSPSleepSettings *)v7 springBoardGreetingDisabled];
  }
  else
  {
    v10 = SBLogDoNotDisturbBedtime();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(CSDNDBedtimeController *)(uint64_t)v5 isGreetingDisabled];
    }

    char v9 = 1;
  }
  v12 = SBLogDoNotDisturbBedtime();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412290;
    id v17 = v13;
    _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, "Greeting is disabled: %@", buf, 0xCu);
  }
  return v9;
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CSDNDBedtimeController_sleepStore_sleepSettingsDidChange___block_invoke;
  block[3] = &unk_1E6AD87F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__CSDNDBedtimeController_sleepStore_sleepSettingsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = SBLogDoNotDisturbBedtime();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D839D000, v2, OS_LOG_TYPE_DEFAULT, "Sleep settings changed, checking if greeting should be disabled", v4, 2u);
  }

  uint64_t result = [*(id *)(a1 + 32) isGreetingDisabled];
  if (result) {
    return [*(id *)(a1 + 32) _setShouldShowGreeting:0 forceUpdateObservers:1];
  }
  return result;
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__CSDNDBedtimeController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  v7[3] = &unk_1E6AD88C0;
  id v8 = v5;
  char v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __73__CSDNDBedtimeController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = objc_msgSend(v2, "sb_isBedtimeModeActive");

  uint64_t v4 = [*(id *)(a1 + 32) reason];
  uint64_t v5 = [*(id *)(a1 + 32) reason];
  uint64_t v6 = [*(id *)(a1 + 32) source];
  if (v3)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v7 = (void **)(a1 + 40);
    *(unsigned char *)(v8 + 32) = 0;
  }
  else
  {
    uint64_t v9 = v6;
    v10 = [*(id *)(a1 + 32) previousState];
    char v11 = objc_msgSend(v10, "sb_isBedtimeModeActive");
    if (v4 == 3 || v5 == 2) {
      char v13 = v11;
    }
    else {
      char v13 = 0;
    }
    if (v9 == 1) {
      char v13 = 0;
    }
    uint64_t v14 = *(void *)(a1 + 40);
    id v7 = (void **)(a1 + 40);
    *(unsigned char *)(v14 + 32) = v13;
  }
  id v15 = *v7;

  return [v15 setActive:v3];
}

- (void)_setShouldShowGreeting:(BOOL)a3
{
}

- (void)_setShouldShowGreeting:(BOOL)a3 forceUpdateObservers:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_shouldShowGreeting == a3)
  {
    if (!a4) {
      return;
    }
  }
  else
  {
    self->_shouldShowGreeting = a3;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        char v11 = SBLogDoNotDisturbBedtime();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = NSStringFromBOOL();
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v12;
          _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "Should show greeting view state changed to: %@", buf, 0xCu);
        }
        [v10 dndBedtimeControllerShowGreetingStateDidChange:self animated:self->_greetingGracePeriodTimer == 0];
      }
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)_cleanUpGreetingGracePeriodTimer
{
  greetingGracePeriodTimer = self->_greetingGracePeriodTimer;
  if (greetingGracePeriodTimer)
  {
    [(BSAbsoluteMachTimer *)greetingGracePeriodTimer invalidate];
    uint64_t v4 = self->_greetingGracePeriodTimer;
    self->_greetingGracePeriodTimer = 0;
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)shouldShowGreeting
{
  return self->_shouldShowGreeting;
}

- (void)setShouldShowGreeting:(BOOL)a3
{
  self->_shouldShowGreeting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepSettings, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong((id *)&self->_greetingGracePeriodTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_stateService, 0);
}

- (void)isGreetingDisabled
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D839D000, a2, OS_LOG_TYPE_ERROR, "isGreetingDisabled - Failed to retrieve Sleep settings with error: %@", (uint8_t *)&v2, 0xCu);
}

@end