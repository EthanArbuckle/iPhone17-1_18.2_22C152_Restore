@interface BLSHInvalidOnSystemSleepAttributeEntry
+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6;
- (BLSAssertionServiceResponding)assertion;
- (BLSAttribute)attribute;
- (BLSHAssertionAttributeHandlerService)service;
- (BOOL)reactivateIfPossible;
- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5;
- (void)cancelAssertionForSleep;
- (void)invalidate;
- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4;
- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4;
@end

@implementation BLSHInvalidOnSystemSleepAttributeEntry

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[BLSHInvalidOnSystemSleepAttributeEntry alloc] initForAttribute:v10 fromAssertion:v9 forService:v8];

  return v11;
}

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BLSHInvalidOnSystemSleepAttributeEntry;
  id v11 = [(BLSHInvalidOnSystemSleepAttributeEntry *)&v19 init];
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
      block[2] = __84__BLSHInvalidOnSystemSleepAttributeEntry_initForAttribute_fromAssertion_forService___block_invoke;
      block[3] = &unk_264532258;
      v18 = p_isa;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }

  return p_isa;
}

void __84__BLSHInvalidOnSystemSleepAttributeEntry_initForAttribute_fromAssertion_forService___block_invoke(uint64_t a1)
{
}

- (void)cancelAssertionForSleep
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    int v3 = *(unsigned __int8 *)(a1 + 12);
    os_unfair_lock_unlock(v2);
    if (!v3)
    {
      v4 = [(id)a1 service];
      v5 = [(id)a1 assertion];
      v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = *MEMORY[0x263F29920];
      uint64_t v10 = *MEMORY[0x263F08320];
      v11[0] = @"canceled due to system sleep";
      id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
      id v9 = [v6 errorWithDomain:v7 code:13 userInfo:v8];
      [v4 cancelAssertion:v5 withError:v9];

      [(id)a1 invalidate];
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
    v6 = [v5 systemSleepMonitor];
    [v6 removeObserver:self];
  }
}

- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4
{
  v6 = (uint64_t (**)(id, uint64_t, void))a4;
  -[BLSHInvalidOnSystemSleepAttributeEntry cancelAssertionForSleep]((uint64_t)self);
  id v5 = (id)v6[2](v6, 1, 0);
}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  id v5 = (void (**)(void))a4;
  -[BLSHInvalidOnSystemSleepAttributeEntry cancelAssertionForSleep]((uint64_t)self);
  v5[2]();
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

- (void)initForAttribute:(uint64_t)a1 fromAssertion:(NSObject *)a2 forService:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = NSStringFromBLSAssertingObject();
  int v5 = 134218242;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  id v8 = v4;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "%p attempted to acquire assertion when sleep is imminent, will immediately cancel assertion:%{public}@", (uint8_t *)&v5, 0x16u);
}

@end