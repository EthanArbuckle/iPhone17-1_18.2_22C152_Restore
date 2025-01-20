@interface BLSHAssertionAttributeTimer
+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6;
- (BLSAssertionServiceResponding)assertion;
- (BLSDurationAttribute)attribute;
- (BLSHAssertionAttributeHandlerService)service;
- (BOOL)reactivateIfPossible;
- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5;
- (void)_with_lock_cancel;
- (void)cancel;
- (void)dealloc;
- (void)invalidate;
- (void)startTimer;
@end

@implementation BLSHAssertionAttributeTimer

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isMemberOfClass:objc_opt_class()])
  {
    v11 = off_264531DA0;
LABEL_7:
    v12 = (void *)[objc_alloc(*v11) initForAttribute:v8 fromAssertion:v9 forService:v10];
    -[BLSHAssertionAttributeTimer startTimer]((uint64_t)v12);
    goto LABEL_8;
  }
  if ([v8 isMemberOfClass:objc_opt_class()])
  {
    v11 = off_264531E98;
    goto LABEL_7;
  }
  if ([v8 isMemberOfClass:objc_opt_class()])
  {
    v11 = off_264531E80;
    goto LABEL_7;
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"invalid class (not BLSDurationAttribute subclass) of attribute:%@", v8 format];
  v12 = 0;
LABEL_8:

  return v12;
}

- (void)startTimer
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained duration];
    if (v3 > 0.0)
    {
      double v4 = v3;
      objc_initWeak(&location, (id)a1);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      id v5 = objc_loadWeakRetained((id *)(a1 + 40));
      v6 = [v5 osInterfaceProvider];
      v7 = [WeakRetained description];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __41__BLSHAssertionAttributeTimer_startTimer__block_invoke;
      v10[3] = &unk_264533320;
      objc_copyWeak(&v11, &location);
      uint64_t v8 = [v6 scheduledTimerWithIdentifier:v7 interval:v10 leewayInterval:v4 handler:v4 * 0.1];
      id v9 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v8;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BLSHAssertionAttributeTimer;
  id v11 = [(BLSHAssertionAttributeTimer *)&v14 init];
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v11->_attribute, v8);
    objc_storeWeak(p_isa + 4, v9);
    objc_storeWeak(p_isa + 5, v10);
  }

  return p_isa;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"BLSHDurationAttributeHandler.m";
  __int16 v16 = 1024;
  int v17 = 102;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (BOOL)reactivateIfPossible
{
  return 0;
}

void __41__BLSHAssertionAttributeTimer_startTimer__block_invoke(uint64_t a1, void *a2)
{
  [a2 invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained timerFired];
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHAssertionAttributeTimer _with_lock_cancel]((uint64_t)self);

  os_unfair_lock_unlock(p_lock);
}

- (void)_with_lock_cancel
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    [*(id *)(a1 + 16) invalidate];
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  -[BLSHAssertionAttributeTimer _with_lock_cancel]((uint64_t)self);

  os_unfair_lock_unlock(p_lock);
}

- (BLSAssertionServiceResponding)assertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assertion);

  return (BLSAssertionServiceResponding *)WeakRetained;
}

- (BLSHAssertionAttributeHandlerService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (BLSHAssertionAttributeHandlerService *)WeakRetained;
}

- (BLSDurationAttribute)attribute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attribute);

  return (BLSDurationAttribute *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attribute);
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_assertion);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end