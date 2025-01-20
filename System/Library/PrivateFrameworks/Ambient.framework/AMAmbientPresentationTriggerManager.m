@interface AMAmbientPresentationTriggerManager
- (AMAmbientDefaults)ambientDefaults;
- (AMAmbientPresentationTriggerManager)initWithMagicMountManager:(id)a3;
- (BOOL)_analogousTriggerEvents;
- (BOOL)_ignoreBatteryChargingForPresentation;
- (BOOL)_isDeviceBatteryCharging;
- (BOOL)isPresentationDetectionEnabled;
- (CMMagicMountManager)magicMountManager;
- (CMMagicMountManager)overridenMagicMountManager;
- (CMMagicMountState)cachedMagicMountState;
- (NSHashTable)observers;
- (NSNumber)overriddenBatteryChargingState;
- (int64_t)_currentMountState;
- (int64_t)_currentPresentationState;
- (int64_t)_currentTriggerState;
- (int64_t)_effectiveMountState;
- (void)_deviceBatteryStateChanged;
- (void)_disableMagicMountDetection;
- (void)_notifyObserversUpdatedAmbientMountState:(int64_t)a3;
- (void)_notifyObserversUpdatedAmbientPresentationState:(int64_t)a3;
- (void)_notifyObserversUpdatedAmbientTriggerState:(int64_t)a3;
- (void)_setDeviceBatteryMonitoringEnabled:(BOOL)a3;
- (void)_setEffectiveMountState:(int64_t)a3;
- (void)_setupMagicMountDetectionIfNecessary;
- (void)_updateAmbientMountState;
- (void)_updateAmbientTriggerState;
- (void)_updateEffectiveMountState;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAmbientDefaults:(id)a3;
- (void)setCachedMagicMountState:(id)a3;
- (void)setMagicMountManager:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOverriddenBatteryChargingState:(id)a3;
- (void)setOverridenMagicMountManager:(id)a3;
- (void)setPresentationDetectionEnabled:(BOOL)a3;
- (void)testSetOverrideBatteryCharging:(BOOL)a3;
@end

@implementation AMAmbientPresentationTriggerManager

- (AMAmbientPresentationTriggerManager)initWithMagicMountManager:(id)a3
{
  id v5 = a3;
  v6 = [(AMAmbientPresentationTriggerManager *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_overridenMagicMountManager, a3);
  }

  return v7;
}

- (void)setPresentationDetectionEnabled:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_presentationDetectionEnabled != a3)
  {
    BOOL v3 = a3;
    id v5 = AMLogPresentation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_24782A000, v5, OS_LOG_TYPE_DEFAULT, "Ambient presentation detection enabled : %{BOOL}d", (uint8_t *)v6, 8u);
    }

    self->_presentationDetectionEnabled = v3;
    [(AMAmbientPresentationTriggerManager *)self _setDeviceBatteryMonitoringEnabled:v3];
    if (v3) {
      [(AMAmbientPresentationTriggerManager *)self _setupMagicMountDetectionIfNecessary];
    }
    else {
      [(AMAmbientPresentationTriggerManager *)self _disableMagicMountDetection];
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
  [(NSHashTable *)self->_observers removeObject:a3];
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (int64_t)_currentTriggerState
{
  if ([(AMAmbientPresentationTriggerManager *)self _effectiveMountState] == 1) {
    return [(AMAmbientPresentationTriggerManager *)self _isDeviceBatteryCharging];
  }
  else {
    return 0;
  }
}

- (int64_t)_currentMountState
{
  if (![(AMAmbientPresentationTriggerManager *)self _isDeviceBatteryCharging]) {
    return 0;
  }
  BOOL v3 = [(AMAmbientPresentationTriggerManager *)self cachedMagicMountState];
  if ([v3 isMounted])
  {

    return 3;
  }
  else
  {
    id v5 = [(AMAmbientPresentationTriggerManager *)self cachedMagicMountState];
    uint64_t v6 = [v5 mountStatus];

    if ((unint64_t)(v6 - 2) >= 3) {
      return 0;
    }
    else {
      return v6 - 1;
    }
  }
}

- (int64_t)_currentPresentationState
{
  if (![(AMAmbientPresentationTriggerManager *)self _isDeviceBatteryCharging]) {
    return 0;
  }
  BOOL v3 = [(AMAmbientPresentationTriggerManager *)self cachedMagicMountState];
  if ([v3 isMounted])
  {

    return 1;
  }
  id v5 = [(AMAmbientPresentationTriggerManager *)self cachedMagicMountState];
  uint64_t v6 = [v5 mountStatus];

  if ((unint64_t)(v6 - 2) <= 2) {
    return qword_2478322E0[v6 - 2];
  }
  else {
    return 0;
  }
}

- (void)_updateAmbientTriggerState
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int64_t v3 = [(AMAmbientPresentationTriggerManager *)self _effectiveMountState];
  BOOL v4 = [(AMAmbientPresentationTriggerManager *)self _isDeviceBatteryCharging];
  int64_t v5 = [(AMAmbientPresentationTriggerManager *)self _currentTriggerState];
  uint64_t v6 = AMLogPresentation();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = v3 == 1;
    id v8 = @"asserted";
    if (v5 != 1) {
      id v8 = @"unknown";
    }
    if (!v5) {
      id v8 = @"idle";
    }
    v9 = v8;
    v10 = [(AMAmbientPresentationTriggerManager *)self cachedMagicMountState];
    unint64_t v11 = [v10 mountStatus] - 1;
    v12 = @"unknown";
    if (v11 <= 3) {
      v12 = off_2652233C0[v11];
    }
    BOOL v13 = [(AMAmbientPresentationTriggerManager *)self _ignoreBatteryChargingForPresentation];
    int64_t v14 = [(AMAmbientPresentationTriggerManager *)self _effectiveMountState];
    v15 = @"mounted";
    if (v14 != 1) {
      v15 = @"unknown";
    }
    if (!v14) {
      v15 = @"unmounted";
    }
    v16 = v15;
    int v17 = 138544642;
    v18 = v9;
    __int16 v19 = 1024;
    BOOL v20 = v7;
    __int16 v21 = 2114;
    v22 = v12;
    __int16 v23 = 1024;
    BOOL v24 = v4;
    __int16 v25 = 1024;
    BOOL v26 = v13;
    __int16 v27 = 2114;
    v28 = v16;
    _os_log_impl(&dword_24782A000, v6, OS_LOG_TYPE_DEFAULT, "Updating ambient trigger state : %{public}@ [ isMounted : %{BOOL}d ; mountStatus : %{public}@ ; isCharging : %{BOO"
      "L}d ; ignoreCharging : %{BOOL}d ; effectiveMountState : %{public}@ ]",
      (uint8_t *)&v17,
      0x32u);
  }
  [(AMAmbientPresentationTriggerManager *)self _notifyObserversUpdatedAmbientPresentationState:[(AMAmbientPresentationTriggerManager *)self _currentPresentationState]];
  [(AMAmbientPresentationTriggerManager *)self _notifyObserversUpdatedAmbientTriggerState:v5];
}

- (void)_updateAmbientMountState
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v3 = [(AMAmbientPresentationTriggerManager *)self _isDeviceBatteryCharging];
  unint64_t v4 = [(AMAmbientPresentationTriggerManager *)self _currentMountState];
  int64_t v5 = AMLogPresentation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 > 3) {
      uint64_t v6 = @"unknown";
    }
    else {
      uint64_t v6 = off_2652233A0[v4];
    }
    BOOL v7 = [(AMAmbientPresentationTriggerManager *)self cachedMagicMountState];
    unint64_t v8 = [v7 mountStatus] - 1;
    v9 = @"unknown";
    if (v8 <= 3) {
      v9 = off_2652233C0[v8];
    }
    BOOL v10 = [(AMAmbientPresentationTriggerManager *)self _ignoreBatteryChargingForPresentation];
    int64_t v11 = [(AMAmbientPresentationTriggerManager *)self _effectiveMountState];
    v12 = @"mounted";
    if (v11 != 1) {
      v12 = @"unknown";
    }
    if (!v11) {
      v12 = @"unmounted";
    }
    BOOL v13 = v12;
    int v14 = 138544386;
    v15 = v6;
    __int16 v16 = 2114;
    int v17 = v9;
    __int16 v18 = 1024;
    BOOL v19 = v3;
    __int16 v20 = 1024;
    BOOL v21 = v10;
    __int16 v22 = 2114;
    __int16 v23 = v13;
    _os_log_impl(&dword_24782A000, v5, OS_LOG_TYPE_DEFAULT, "Updating ambient mount state : %{public}@ [ mountStatus : %{public}@ ; isCharging : %{BOOL}d ; ignoreCharging : %{"
      "BOOL}d ; effectiveMountState : %{public}@ ]",
      (uint8_t *)&v14,
      0x2Cu);
  }
  [(AMAmbientPresentationTriggerManager *)self _notifyObserversUpdatedAmbientPresentationState:[(AMAmbientPresentationTriggerManager *)self _currentPresentationState]];
  [(AMAmbientPresentationTriggerManager *)self _notifyObserversUpdatedAmbientMountState:v4];
}

- (void)_updateEffectiveMountState
{
  BOOL v3 = [(AMAmbientPresentationTriggerManager *)self cachedMagicMountState];
  uint64_t v4 = [v3 mountStatus];

  int64_t v5 = [(AMAmbientPresentationTriggerManager *)self _effectiveMountState];
  if (v5 == 1)
  {
    BOOL v6 = v4 != 1;
  }
  else
  {
    BOOL v6 = v5;
    if (!v5) {
      BOOL v6 = v4 == 4
    }
        || v4 == 3
        && [(AMAmbientPresentationTriggerManager *)self _analogousTriggerEvents];
  }
  [(AMAmbientPresentationTriggerManager *)self _setEffectiveMountState:v6];
}

- (void)_setEffectiveMountState:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int64_t v5 = AMLogPresentation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = @"unknown";
    BOOL v7 = @"mounted";
    if (a3 != 1) {
      BOOL v7 = @"unknown";
    }
    if (!a3) {
      BOOL v7 = @"unmounted";
    }
    unint64_t v8 = v7;
    v9 = [(AMAmbientPresentationTriggerManager *)self cachedMagicMountState];
    unint64_t v10 = [v9 mountStatus] - 1;
    if (v10 <= 3) {
      BOOL v6 = off_2652233C0[v10];
    }
    int v11 = 138543874;
    v12 = v8;
    __int16 v13 = 2114;
    int v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = [(AMAmbientPresentationTriggerManager *)self _analogousTriggerEvents];
    _os_log_impl(&dword_24782A000, v5, OS_LOG_TYPE_DEFAULT, "Updating ambient effective mount state : %{public}@ [ mountStatus : %{public}@ ; analogousTriggerEvents : %{BOOL}d ]",
      (uint8_t *)&v11,
      0x1Cu);
  }
  if (self->_effectiveMountState != a3)
  {
    self->_effectiveMountState = a3;
    [(AMAmbientPresentationTriggerManager *)self _updateAmbientTriggerState];
  }
}

- (void)_notifyObserversUpdatedAmbientPresentationState:(int64_t)a3
{
  int64_t v5 = [(NSHashTable *)self->_observers allObjects];
  BOOL v6 = (void *)[v5 copy];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__AMAmbientPresentationTriggerManager__notifyObserversUpdatedAmbientPresentationState___block_invoke;
  v7[3] = &unk_265223330;
  v7[4] = self;
  v7[5] = a3;
  [v6 enumerateObjectsUsingBlock:v7];
}

void __87__AMAmbientPresentationTriggerManager__notifyObserversUpdatedAmbientPresentationState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v3, "ambientPresentationManager:didUpdatePresentationState:analogousTriggerEvents:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_analogousTriggerEvents"));
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 ambientPresentationManager:*(void *)(a1 + 32) didUpdatePresentationState:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversUpdatedAmbientTriggerState:(int64_t)a3
{
  int64_t v5 = [(NSHashTable *)self->_observers allObjects];
  BOOL v6 = (void *)[v5 copy];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__AMAmbientPresentationTriggerManager__notifyObserversUpdatedAmbientTriggerState___block_invoke;
  v7[3] = &unk_265223330;
  v7[4] = self;
  v7[5] = a3;
  [v6 enumerateObjectsUsingBlock:v7];
}

void __82__AMAmbientPresentationTriggerManager__notifyObserversUpdatedAmbientTriggerState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "ambientPresentationManager:didUpdateTriggerState:analogousTriggerEvents:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_analogousTriggerEvents"));
  }
}

- (void)_notifyObserversUpdatedAmbientMountState:(int64_t)a3
{
  int64_t v5 = [(NSHashTable *)self->_observers allObjects];
  BOOL v6 = (void *)[v5 copy];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__AMAmbientPresentationTriggerManager__notifyObserversUpdatedAmbientMountState___block_invoke;
  v7[3] = &unk_265223330;
  v7[4] = self;
  v7[5] = a3;
  [v6 enumerateObjectsUsingBlock:v7];
}

void __80__AMAmbientPresentationTriggerManager__notifyObserversUpdatedAmbientMountState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 ambientPresentationManager:*(void *)(a1 + 32) didUpdateMountState:*(void *)(a1 + 40)];
  }
}

- (BOOL)_analogousTriggerEvents
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (![(AMAmbientPresentationTriggerManager *)self _currentMountState]) {
    return 0;
  }
  batteryStateChangeTimestamp = self->_batteryStateChangeTimestamp;
  if (!batteryStateChangeTimestamp || !self->_magicMountEventTimestamp) {
    return 0;
  }
  -[NSDate timeIntervalSinceDate:](batteryStateChangeTimestamp, "timeIntervalSinceDate:");
  double v5 = fabs(v4);
  BOOL v6 = v5 < 3.0;
  BOOL v7 = AMLogPresentation();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = self->_batteryStateChangeTimestamp;
    magicMountEventTimestamp = self->_magicMountEventTimestamp;
    v11[0] = 67109890;
    v11[1] = v5 < 3.0;
    __int16 v12 = 2048;
    double v13 = v5;
    __int16 v14 = 2114;
    __int16 v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = magicMountEventTimestamp;
    _os_log_impl(&dword_24782A000, v7, OS_LOG_TYPE_DEFAULT, "Ambient presentation trigger events analogous : %{BOOL}d [ timeInterval : %.2f sec ; batteryTimestamp : %{public}@"
      " ; magicMountTimestamp : %{public}@ ]",
      (uint8_t *)v11,
      0x26u);
  }

  return v6;
}

- (void)_setupMagicMountDetectionIfNecessary
{
  if (!self->_magicMountManager)
  {
    overridenMagicMountManager = self->_overridenMagicMountManager;
    if (overridenMagicMountManager) {
      double v4 = overridenMagicMountManager;
    }
    else {
      double v4 = (CMMagicMountManager *)objc_alloc_init(MEMORY[0x263F01768]);
    }
    magicMountManager = self->_magicMountManager;
    self->_magicMountManager = v4;

    [(CMMagicMountManager *)self->_magicMountManager setMagicMountConfiguration:2];
    objc_initWeak(&location, self);
    BOOL v6 = self->_magicMountManager;
    BOOL v7 = [MEMORY[0x263F08A48] mainQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __75__AMAmbientPresentationTriggerManager__setupMagicMountDetectionIfNecessary__block_invoke;
    v8[3] = &unk_265223358;
    objc_copyWeak(&v9, &location);
    [(CMMagicMountManager *)v6 startMagicMountUpdatesToQueue:v7 withHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __75__AMAmbientPresentationTriggerManager__setupMagicMountDetectionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = AMLogPresentation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v3 isMounted];
    uint64_t v6 = [v3 mountStatus];
    if ((unint64_t)(v6 - 1) > 3) {
      BOOL v7 = @"unknown";
    }
    else {
      BOOL v7 = off_2652233C0[v6 - 1];
    }
    v11[0] = 67109378;
    v11[1] = v5;
    __int16 v12 = 2114;
    double v13 = v7;
    _os_log_impl(&dword_24782A000, v4, OS_LOG_TYPE_DEFAULT, "Ambient magic mount state change detected [ isMounted : %{BOOL}d ; status : %{public}@ ]",
      (uint8_t *)v11,
      0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCachedMagicMountState:v3];
  uint64_t v9 = [MEMORY[0x263EFF910] date];
  unint64_t v10 = (void *)WeakRetained[2];
  WeakRetained[2] = v9;

  [WeakRetained _updateEffectiveMountState];
  [WeakRetained _updateAmbientMountState];
  [WeakRetained _updateAmbientTriggerState];
}

- (void)_disableMagicMountDetection
{
  magicMountManager = self->_magicMountManager;
  if (magicMountManager)
  {
    [(CMMagicMountManager *)magicMountManager stopMagicMountUpdates];
    double v4 = self->_magicMountManager;
    self->_magicMountManager = 0;

    cachedMagicMountState = self->_cachedMagicMountState;
    self->_cachedMagicMountState = 0;
  }
}

- (void)_setDeviceBatteryMonitoringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [MEMORY[0x263F08A00] defaultCenter];
  id v6 = v5;
  if (v3) {
    [v5 addObserver:self selector:sel__deviceBatteryStateChanged name:*MEMORY[0x263F1D1A8] object:0];
  }
  else {
    [v5 removeObserver:self name:*MEMORY[0x263F1D1A8] object:0];
  }
}

- (void)_deviceBatteryStateChanged
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = AMLogPresentation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = [(AMAmbientPresentationTriggerManager *)self _isDeviceBatteryCharging];
    _os_log_impl(&dword_24782A000, v3, OS_LOG_TYPE_DEFAULT, "Ambient device battery state change detected [ isDeviceBatteryCharging : %{BOOL}d ]", (uint8_t *)v6, 8u);
  }

  double v4 = [MEMORY[0x263EFF910] date];
  batteryStateChangeTimestamp = self->_batteryStateChangeTimestamp;
  self->_batteryStateChangeTimestamp = v4;

  [(AMAmbientPresentationTriggerManager *)self _updateEffectiveMountState];
  [(AMAmbientPresentationTriggerManager *)self _updateAmbientMountState];
  [(AMAmbientPresentationTriggerManager *)self _updateAmbientTriggerState];
}

- (BOOL)_isDeviceBatteryCharging
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(AMAmbientPresentationTriggerManager *)self _ignoreBatteryChargingForPresentation])
  {
    return 1;
  }
  double v4 = [(AMAmbientPresentationTriggerManager *)self overriddenBatteryChargingState];

  if (v4)
  {
    int v5 = [(AMAmbientPresentationTriggerManager *)self overriddenBatteryChargingState];
    char v3 = [v5 BOOLValue];
  }
  else
  {
    id v6 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v7 = [v6 batteryState];

    unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    char v3 = (v7 & 0xFFFFFFFFFFFFFFFELL) == 2;
    int v5 = AMLogPresentation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v8 == 2;
      _os_log_impl(&dword_24782A000, v5, OS_LOG_TYPE_DEFAULT, "Ambient determining battery charging = %{BOOL}d ", (uint8_t *)v10, 8u);
    }
  }

  return v3;
}

- (void)testSetOverrideBatteryCharging:(BOOL)a3
{
  self->_overriddenBatteryChargingState = (NSNumber *)(id)[NSNumber numberWithBool:a3];
  [(AMAmbientPresentationTriggerManager *)self _deviceBatteryStateChanged];
}

- (BOOL)_ignoreBatteryChargingForPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ambientDefaults);
  char v3 = [WeakRetained ignoreBatteryChargingForPresentation];

  return v3;
}

- (void)setAmbientDefaults:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ambientDefaults);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_ambientDefaults, v4);
    objc_initWeak(&location, self);
    id v6 = [NSString stringWithUTF8String:"ignoreBatteryChargingForPresentation"];
    v13[0] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    id v8 = MEMORY[0x263EF83A0];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    _DWORD v10[2] = __58__AMAmbientPresentationTriggerManager_setAmbientDefaults___block_invoke;
    v10[3] = &unk_265223380;
    objc_copyWeak(&v11, &location);
    id v9 = (id)[v4 observeDefaults:v7 onQueue:MEMORY[0x263EF83A0] withBlock:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __58__AMAmbientPresentationTriggerManager_setAmbientDefaults___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateEffectiveMountState];
  [WeakRetained _updateAmbientTriggerState];
}

- (int64_t)_effectiveMountState
{
  return self->_effectiveMountState;
}

- (BOOL)isPresentationDetectionEnabled
{
  return self->_presentationDetectionEnabled;
}

- (AMAmbientDefaults)ambientDefaults
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ambientDefaults);
  return (AMAmbientDefaults *)WeakRetained;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CMMagicMountManager)magicMountManager
{
  return self->_magicMountManager;
}

- (void)setMagicMountManager:(id)a3
{
}

- (CMMagicMountState)cachedMagicMountState
{
  return self->_cachedMagicMountState;
}

- (void)setCachedMagicMountState:(id)a3
{
}

- (CMMagicMountManager)overridenMagicMountManager
{
  return self->_overridenMagicMountManager;
}

- (void)setOverridenMagicMountManager:(id)a3
{
}

- (NSNumber)overriddenBatteryChargingState
{
  return self->_overriddenBatteryChargingState;
}

- (void)setOverriddenBatteryChargingState:(id)a3
{
  self->_overriddenBatteryChargingState = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridenMagicMountManager, 0);
  objc_storeStrong((id *)&self->_cachedMagicMountState, 0);
  objc_storeStrong((id *)&self->_magicMountManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_ambientDefaults);
  objc_storeStrong((id *)&self->_magicMountEventTimestamp, 0);
  objc_storeStrong((id *)&self->_batteryStateChangeTimestamp, 0);
}

@end