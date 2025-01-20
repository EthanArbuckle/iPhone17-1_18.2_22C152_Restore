@interface BLSHWaiterForBacklight
+ (id)waitForBacklightDisplayMode:(int64_t)a3;
+ (id)waitForBacklightDisplayModePassingTest:(id)a3;
+ (id)waitForBacklightState:(int64_t)a3;
+ (id)waitForBacklightStatePassingTest:(id)a3;
+ (id)waitForBlanked;
+ (id)waitForUnblanked;
- (BLSHWaiterForBacklight)init;
- (BOOL)isAlreadyAtDesiredState;
- (BOOL)isInvalidated;
- (void)_main_callCompletion;
- (void)_main_waitWithCompletion:(id)a3;
- (void)callCompletion;
- (void)dealloc;
- (void)invalidate;
- (void)waitWithCompletion:(id)a3;
@end

@implementation BLSHWaiterForBacklight

+ (id)waitForBacklightState:(int64_t)a3
{
  v3 = [[BLSHWaiterForBacklightState alloc] initWithBacklightState:a3];

  return v3;
}

+ (id)waitForBacklightStatePassingTest:(id)a3
{
  id v3 = a3;
  v4 = [[BLSHWaiterForBacklightState alloc] initWithPredicate:v3];

  return v4;
}

+ (id)waitForBacklightDisplayMode:(int64_t)a3
{
  id v3 = [[BLSHWaiterForBacklightDisplayMode alloc] initWithDisplayMode:a3];

  return v3;
}

+ (id)waitForBacklightDisplayModePassingTest:(id)a3
{
  id v3 = a3;
  v4 = [[BLSHWaiterForBacklightDisplayMode alloc] initWithPredicate:v3];

  return v4;
}

+ (id)waitForBlanked
{
  v2 = [[BLSHWaiterForBacklightDisplayMode alloc] initWithPredicate:&__block_literal_global_11];

  return v2;
}

BOOL __40__BLSHWaiterForBacklight_waitForBlanked__block_invoke(uint64_t a1, uint64_t a2)
{
  return IsBlankedForBLSBacklightDisplayMode(a2);
}

+ (id)waitForUnblanked
{
  v2 = [[BLSHWaiterForBacklightDisplayMode alloc] initWithPredicate:&__block_literal_global_3];

  return v2;
}

BOOL __42__BLSHWaiterForBacklight_waitForUnblanked__block_invoke(uint64_t a1, uint64_t a2)
{
  return !IsBlankedForBLSBacklightDisplayMode(a2);
}

- (BLSHWaiterForBacklight)init
{
  v3.receiver = self;
  v3.super_class = (Class)BLSHWaiterForBacklight;
  result = [(BLSHWaiterForBacklight *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"BLSHWaiterForBacklight.m";
  __int16 v16 = 1024;
  int v17 = 79;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (BOOL)isAlreadyAtDesiredState
{
  return 1;
}

- (void)waitWithCompletion:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

uint64_t __45__BLSHWaiterForBacklight_waitWithCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAlreadyAtDesiredState])
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v2();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return objc_msgSend(v4, "_main_waitWithCompletion:", v5);
  }
}

- (void)_main_waitWithCompletion:(id)a3
{
  id v4 = (void *)MEMORY[0x223C5E2B0](a3, a2);
  id completion = self->_completion;
  self->_id completion = v4;

  id v6 = +[BLSHBacklightHost sharedBacklightHost];
  [v6 addObserver:self];
}

- (void)callCompletion
{
}

uint64_t __40__BLSHWaiterForBacklight_callCompletion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_callCompletion");
}

- (void)_main_callCompletion
{
  if (![(BLSHWaiterForBacklight *)self isInvalidated])
  {
    (*((void (**)(void))self->_completion + 2))();
    [(BLSHWaiterForBacklight *)self invalidate];
    id completion = self->_completion;
    self->_id completion = 0;
  }
}

- (BOOL)isInvalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  id v4 = +[BLSHBacklightHost sharedBacklightHost];
  [v4 removeObserver:self];
}

- (void).cxx_destruct
{
}

@end