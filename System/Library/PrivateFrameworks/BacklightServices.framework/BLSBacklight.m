@interface BLSBacklight
+ (id)defaultBacklightProxy;
+ (id)sharedBacklight;
+ (void)setDefaultBacklightProxy:(id)a3;
- (BLSBacklight)init;
- (BOOL)deviceSupportsAlwaysOn;
- (BOOL)isAlwaysOnEnabled;
- (BOOL)isTransitioning;
- (id)performChangeRequest:(id)a3;
- (int64_t)backlightState;
- (int64_t)flipbookState;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation BLSBacklight

- (BOOL)isAlwaysOnEnabled
{
  return [(BLSBacklightProxy *)self->_backlightProxy isAlwaysOnEnabled];
}

+ (id)sharedBacklight
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__BLSBacklight_sharedBacklight__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBacklight_onceToken != -1) {
    dispatch_once(&sharedBacklight_onceToken, block);
  }
  v2 = (void *)sharedBacklight___sharedBacklight;

  return v2;
}

uint64_t __31__BLSBacklight_sharedBacklight__block_invoke(uint64_t a1)
{
  sharedBacklight___sharedBacklight = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (BLSBacklight)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLSBacklight;
  v2 = [(BLSBacklight *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[BLSBacklight defaultBacklightProxy]();
    backlightProxy = v2->_backlightProxy;
    v2->_backlightProxy = (BLSBacklightProxy *)v3;
  }
  return v2;
}

+ (id)defaultBacklightProxy
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_0);
  id v0 = (id)_defaultBacklightProxy;
  if (!v0)
  {
    BOOL v1 = +[BLSRuntime isHostProcess];
    v2 = off_1E6106D50;
    if (!v1) {
      v2 = off_1E6106DB8;
    }
    id v3 = objc_alloc_init(*v2);
    v4 = (void *)_defaultBacklightProxy;
    _defaultBacklightProxy = (uint64_t)v3;

    id v0 = v3;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_0);

  return v0;
}

- (int64_t)backlightState
{
  return [(BLSBacklightProxy *)self->_backlightProxy backlightState];
}

- (int64_t)flipbookState
{
  return [(BLSBacklightProxy *)self->_backlightProxy flipbookState];
}

- (BOOL)isTransitioning
{
  return [(BLSBacklightProxy *)self->_backlightProxy isTransitioning];
}

- (BOOL)deviceSupportsAlwaysOn
{
  return [(BLSBacklightProxy *)self->_backlightProxy deviceSupportsAlwaysOn];
}

- (id)performChangeRequest:(id)a3
{
  return (id)[(BLSBacklightProxy *)self->_backlightProxy performChangeRequest:a3];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

+ (void)setDefaultBacklightProxy:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_0);
  id v5 = (id)_defaultBacklightProxy;
  if (!v5)
  {
    objc_super v6 = bls_backlight_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[BLSBacklight setDefaultBacklightProxy:](v6);
    }
    goto LABEL_10;
  }
  if (!v4)
  {
    objc_super v6 = bls_backlight_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B55DE000, v6, OS_LOG_TYPE_DEFAULT, "BLSBacklightProxy defaultBacklightProxy reset - should only occur during unit testing", buf, 2u);
    }
LABEL_10:

    objc_storeStrong((id *)&_defaultBacklightProxy, a3);
    os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_0);
    goto LABEL_11;
  }
  objc_storeStrong((id *)&_defaultBacklightProxy, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_0);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"attempting to replace backlightProxy:%@ which does not respond to replaceWithBacklightProxy:", v5 format];
  }
  [v5 replaceWithBacklightProxy:v4];
LABEL_11:
}

- (void).cxx_destruct
{
}

+ (void)setDefaultBacklightProxy:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)BOOL v1 = 0;
  _os_log_debug_impl(&dword_1B55DE000, log, OS_LOG_TYPE_DEBUG, "BLSBacklightProxy setDefaultBacklightProxy replacing nil - no backlight instances created prior to server bringup - yay", v1, 2u);
}

@end