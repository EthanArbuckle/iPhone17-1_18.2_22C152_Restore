@interface BLSHBasePlatformProvider
- (BLSHBacklightEnvironmentSessionProviding)sessionProvider;
- (BLSHBasePlatformProvider)init;
- (BLSHFlipbookSpecification)flipbookSpecification;
- (BOOL)_lock_isAlwaysOnEnabled;
- (BOOL)isAlwaysOnEnabled;
- (BOOL)isAlwaysOnSettingEnabled;
- (BOOL)isShowingBlankingWindow;
- (BOOL)suppressionSupported;
- (double)backlightDimmingDuration;
- (double)backlightFadeInDuration;
- (double)backlightFadeOutDuration;
- (float)backlightDimmedFactor;
- (id)createInactiveEnvironmentSession;
- (void)addObserver:(id)a3;
- (void)notifyObserversWithBlock:(id)a3;
- (void)platformDidDetectSignificantUserInteraction;
- (void)removeObserver:(id)a3;
- (void)serviceInitializing:(id)a3;
- (void)setAlwaysOnSettingEnabled:(BOOL)a3;
- (void)setBacklightDimmedFactor:(float)a3;
- (void)setBacklightDimmingDuration:(double)a3;
- (void)setBacklightFadeInDuration:(double)a3;
- (void)setBacklightFadeOutDuration:(double)a3;
- (void)setFlipbookSpecification:(id)a3;
- (void)setSessionProvider:(id)a3;
- (void)setSuppressionSupported:(BOOL)a3;
@end

@implementation BLSHBasePlatformProvider

- (BLSHBasePlatformProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)BLSHBasePlatformProvider;
  v2 = [(BLSHBasePlatformProvider *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    *(int64x2_t *)&v2->_lock_backlightFadeInDuration = vdupq_n_s64(0x3FB999999999999AuLL);
    v2->_lock_backlightDimmingDuration = 0.1;
    v2->_lock_backlightDimmedFactor = 0.05;
    v4 = [[BLSHFlipbookSpecification alloc] initWithSoftMemoryLimit:104857600 frameCapacity:100 framesPerSecond:30.0 minimumGapDuration:3.0 coaelscingEpsilon:0.0028 minimumPrepareInterval:90.0 maximumRenderInterval:300.0];
    lock_flipbookSpecification = v3->_lock_flipbookSpecification;
    v3->_lock_flipbookSpecification = v4;

    v3->_lock_alwaysOnSettingEnabled = 1;
    objc_storeStrong((id *)&v3->_lock_sessionProvider, v3);
    uint64_t v6 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:2];
    lock_observers = v3->_lock_observers;
    v3->_lock_observers = (NSHashTable *)v6;
  }
  return v3;
}

- (void)platformDidDetectSignificantUserInteraction
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __71__BLSHBasePlatformProvider_platformDidDetectSignificantUserInteraction__block_invoke;
  v2[3] = &unk_2645326A8;
  v2[4] = self;
  [(BLSHBasePlatformProvider *)self notifyObserversWithBlock:v2];
}

uint64_t __71__BLSHBasePlatformProvider_platformDidDetectSignificantUserInteraction__block_invoke(uint64_t a1, void *a2)
{
  return [a2 platformProviderDidDetectSignificantUserInteraction:*(void *)(a1 + 32)];
}

- (void)serviceInitializing:(id)a3
{
  v4 = (BLSHService *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_service = self->_lock_service;
  self->_lock_service = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (double)backlightFadeInDuration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lock_backlightFadeInDuration = self->_lock_backlightFadeInDuration;
  os_unfair_lock_unlock(p_lock);
  return lock_backlightFadeInDuration;
}

- (void)setBacklightFadeInDuration:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_double lock_backlightFadeInDuration = a3;

  os_unfair_lock_unlock(p_lock);
}

- (double)backlightFadeOutDuration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lock_backlightFadeOutDuration = self->_lock_backlightFadeOutDuration;
  os_unfair_lock_unlock(p_lock);
  return lock_backlightFadeOutDuration;
}

- (void)setBacklightFadeOutDuration:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_double lock_backlightFadeOutDuration = a3;

  os_unfair_lock_unlock(p_lock);
}

- (double)backlightDimmingDuration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lock_backlightDimmingDuration = self->_lock_backlightDimmingDuration;
  os_unfair_lock_unlock(p_lock);
  return lock_backlightDimmingDuration;
}

- (void)setBacklightDimmingDuration:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_double lock_backlightDimmingDuration = a3;

  os_unfair_lock_unlock(p_lock);
}

- (float)backlightDimmedFactor
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  float lock_backlightDimmedFactor = self->_lock_backlightDimmedFactor;
  os_unfair_lock_unlock(p_lock);
  return lock_backlightDimmedFactor;
}

- (void)setBacklightDimmedFactor:(float)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  float lock_backlightDimmedFactor = self->_lock_backlightDimmedFactor;
  self->_float lock_backlightDimmedFactor = a3;
  lock_service = self->_lock_service;
  os_unfair_lock_unlock(p_lock);
  if (lock_backlightDimmedFactor != a3 && lock_service != 0)
  {
    objc_super v9 = [MEMORY[0x263F29970] sharedBacklight];
    uint64_t v10 = [v9 backlightState];

    if (v10 == 3)
    {
      v11 = bls_backlight_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 134218496;
        v13 = self;
        __int16 v14 = 2048;
        double v15 = lock_backlightDimmedFactor;
        __int16 v16 = 2048;
        double v17 = a3;
        _os_log_error_impl(&dword_21FCFC000, v11, OS_LOG_TYPE_ERROR, "%p changed dimmed factor (%.2lf->%.2lf) while currently dimmed - change will not be reflected until next update", (uint8_t *)&v12, 0x20u);
      }
    }
  }
}

- (BOOL)isAlwaysOnEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(BLSHBasePlatformProvider *)v2 _lock_isAlwaysOnEnabled];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_lock_isAlwaysOnEnabled
{
  BOOL result = [(BLSHService *)self->_lock_service deviceSupportsAlwaysOn];
  if (!self->_lock_alwaysOnSettingEnabled) {
    return 0;
  }
  return result;
}

- (BOOL)isAlwaysOnSettingEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnSettingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAlwaysOnSettingEnabled:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v6 = [(BLSHService *)self->_lock_service deviceSupportsAlwaysOn];
  int lock_alwaysOnSettingEnabled = self->_lock_alwaysOnSettingEnabled;
  self->_int lock_alwaysOnSettingEnabled = v3;
  os_unfair_lock_unlock(p_lock);
  if (v6 && lock_alwaysOnSettingEnabled != v3)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__BLSHBasePlatformProvider_setAlwaysOnSettingEnabled___block_invoke;
    v9[3] = &unk_2645326D0;
    v9[4] = self;
    char v10 = v3;
    [(BLSHBasePlatformProvider *)self notifyObserversWithBlock:v9];
  }
}

uint64_t __54__BLSHBasePlatformProvider_setAlwaysOnSettingEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 platformProvider:*(void *)(a1 + 32) didChangeAlwaysOnSetting:*(unsigned __int8 *)(a1 + 40)];
}

- (BLSHFlipbookSpecification)flipbookSpecification
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_flipbookSpecification;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setFlipbookSpecification:(id)a3
{
  v5 = (BLSHFlipbookSpecification *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_service)
  {
    v7 = [NSString stringWithFormat:@"cannot mutate flipbookSpecification after service initialization : %@", self];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(BLSHBasePlatformProvider *)a2 setFlipbookSpecification:(uint64_t)v7];
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    lock_flipbookSpecification = self->_lock_flipbookSpecification;
    self->_lock_flipbookSpecification = v5;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BLSHBacklightEnvironmentSessionProviding)sessionProvider
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_sessionProvider;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSessionProvider:(id)a3
{
  v5 = (BLSHBacklightEnvironmentSessionProviding *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_service)
  {
    v7 = [NSString stringWithFormat:@"cannot mutate sessionProvider after service initialization : %@", self];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(BLSHBasePlatformProvider *)a2 setSessionProvider:(uint64_t)v7];
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    lock_sessionProvider = self->_lock_sessionProvider;
    self->_lock_sessionProvider = v5;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)isShowingBlankingWindow
{
  return 0;
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v6 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers addObject:v6];
  BOOL v5 = [(BLSHBasePlatformProvider *)self _lock_isAlwaysOnEnabled];
  os_unfair_lock_unlock(p_lock);
  [v6 platformProvider:self didChangeAlwaysOnSetting:v5];
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)createInactiveEnvironmentSession
{
  v2 = [BLSHBacklightEnvironmentPresentation alloc];
  int v3 = [(BLSHBacklightEnvironmentPresentation *)v2 initWithPresentationEntries:MEMORY[0x263EFFA68] flipbookContext:0 expirationDate:0];
  v4 = +[BLSHBacklightInactiveEnvironmentSession sessionWithPresentation:v3];

  return v4;
}

- (void)notifyObserversWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSHashTable *)self->_lock_observers allObjects];
  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)suppressionSupported
{
  return self->_suppressionSupported;
}

- (void)setSuppressionSupported:(BOOL)a3
{
  self->_suppressionSupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_flipbookSpecification, 0);
  objc_storeStrong((id *)&self->_lock_service, 0);
  objc_storeStrong((id *)&self->_lock_sessionProvider, 0);

  objc_storeStrong((id *)&self->_lock_observers, 0);
}

- (void)setFlipbookSpecification:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = @"BLSHBasePlatformProvider.m";
  __int16 v10 = 1024;
  int v11 = 175;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)setSessionProvider:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = @"BLSHBasePlatformProvider.m";
  __int16 v10 = 1024;
  int v11 = 189;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end