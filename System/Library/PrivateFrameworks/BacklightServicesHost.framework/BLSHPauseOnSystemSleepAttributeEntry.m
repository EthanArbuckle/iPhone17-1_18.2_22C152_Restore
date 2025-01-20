@interface BLSHPauseOnSystemSleepAttributeEntry
+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6;
- (BLSAssertionServiceResponding)assertion;
- (BLSAttribute)attribute;
- (BLSHAssertionAttributeHandlerService)service;
- (BOOL)reactivateIfPossible;
- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5;
- (void)invalidate;
- (void)setPaused:(uint64_t)a1;
- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4;
- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4;
- (void)systemSleepMonitorSleepRequestAborted:(id)a3;
- (void)systemSleepMonitorWillWakeFromSleep:(id)a3;
@end

@implementation BLSHPauseOnSystemSleepAttributeEntry

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[BLSHPauseOnSystemSleepAttributeEntry alloc] initForAttribute:v10 fromAssertion:v9 forService:v8];

  return v11;
}

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BLSHPauseOnSystemSleepAttributeEntry;
  id v11 = [(BLSHPauseOnSystemSleepAttributeEntry *)&v19 init];
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v11->_attribute, v8);
    objc_storeWeak(p_isa + 3, v9);
    objc_storeWeak(p_isa + 4, v10);
    v13 = [v10 osInterfaceProvider];
    v14 = [v13 systemSleepMonitor];

    [v14 addObserver:p_isa];
    if (([v14 isAwakeOrAbortingSleep] & 1) == 0)
    {
      v15 = bls_assertions_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[BLSHInvalidOnSystemSleepAttributeEntry initForAttribute:fromAssertion:forService:]((uint64_t)v9, v15);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__BLSHPauseOnSystemSleepAttributeEntry_initForAttribute_fromAssertion_forService___block_invoke;
      block[3] = &unk_264532258;
      v18 = p_isa;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }

  return p_isa;
}

void __82__BLSHPauseOnSystemSleepAttributeEntry_initForAttribute_fromAssertion_forService___block_invoke(uint64_t a1)
{
}

- (void)setPaused:(uint64_t)a1
{
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(unsigned char *)(a1 + 12) || *(unsigned __int8 *)(a1 + 13) == a2)
    {
      os_unfair_lock_unlock(v4);
    }
    else
    {
      *(unsigned char *)(a1 + 13) = a2;
      os_unfair_lock_unlock(v4);
      id v6 = [(id)a1 service];
      v5 = [(id)a1 assertion];
      if (a2) {
        [v6 pauseAssertion:v5];
      }
      else {
        [v6 resumeAssertion:v5];
      }
    }
  }
}

- (BOOL)reactivateIfPossible
{
  return 0;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_invalidated = self->_lock_invalidated;
  self->_BOOL lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  if (!lock_invalidated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    v5 = [WeakRetained osInterfaceProvider];
    id v6 = [v5 systemSleepMonitor];
    [v6 removeObserver:self];
  }
}

- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4
{
  id v6 = (uint64_t (**)(id, uint64_t, void))a4;
  -[BLSHPauseOnSystemSleepAttributeEntry setPaused:]((uint64_t)self, 1);
  id v5 = (id)v6[2](v6, 1, 0);
}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  id v5 = (void (**)(void))a4;
  -[BLSHPauseOnSystemSleepAttributeEntry setPaused:]((uint64_t)self, 1);
  v5[2]();
}

- (void)systemSleepMonitorSleepRequestAborted:(id)a3
{
}

- (void)systemSleepMonitorWillWakeFromSleep:(id)a3
{
}

- (BLSAttribute)attribute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attribute);

  return (BLSAttribute *)WeakRetained;
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_assertion);

  objc_destroyWeak((id *)&self->_attribute);
}

@end