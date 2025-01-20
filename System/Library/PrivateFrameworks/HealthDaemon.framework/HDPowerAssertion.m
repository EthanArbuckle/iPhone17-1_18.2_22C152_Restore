@interface HDPowerAssertion
+ (HDPowerAssertion)powerAssertionWithIdentifier:(id)a3 timeout:(double)a4 timeoutHandler:(id)a5;
- (BOOL)invalidated;
- (HDPowerAssertion)init;
- (NSString)identifier;
- (double)timeout;
- (void)dealloc;
- (void)invalidate;
@end

@implementation HDPowerAssertion

+ (HDPowerAssertion)powerAssertionWithIdentifier:(id)a3 timeout:(double)a4 timeoutHandler:(id)a5
{
  v33[1] = *(id *)MEMORY[0x1E4F143B8];
  v9 = (__CFString *)a3;
  id v10 = a5;
  if (a4 <= 0.0)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"HDPowerAssertion.m", 44, @"Invalid parameter not satisfying: %@", @"timeout > 0.0" object file lineNumber description];
  }
  IOPMAssertionID AssertionID = 0;
  IOReturn v11 = IOPMAssertionCreateWithDescription(@"NoIdleSleepAssertion", v9, 0, 0, 0, a4 + 60.0, @"TimeoutActionTurnOff", &AssertionID);
  if (v11)
  {
    IOReturn v12 = v11;
    _HKInitializeLogging();
    v13 = HKLogInfrastructure();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)handler = 138412546;
      *(void *)&handler[4] = v9;
      *(_WORD *)&handler[12] = 1024;
      *(_DWORD *)&handler[14] = v12;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "Failed to create power assertion \"%@\": %d", handler, 0x12u);
    }

    id v14 = 0;
  }
  else
  {
    id v14 = objc_alloc((Class)a1);
    v15 = v9;
    id v16 = v10;
    if (v14)
    {
      *(void *)handler = v14;
      *(void *)&handler[8] = HDPowerAssertion;
      id v14 = objc_msgSendSuper2((objc_super *)handler, sel_init);
      if (v14)
      {
        uint64_t v17 = [(__CFString *)v15 copy];
        v18 = (void *)*((void *)v14 + 5);
        *((void *)v14 + 5) = v17;

        *((double *)v14 + 6) = a4;
        uint64_t v19 = [v16 copy];
        v20 = (void *)*((void *)v14 + 3);
        *((void *)v14 + 3) = v19;
      }
    }

    *((_DWORD *)v14 + 2) = AssertionID;
    v21 = dispatch_get_global_queue(21, 0);
    dispatch_source_t v22 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v21);
    v23 = (void *)*((void *)v14 + 2);
    *((void *)v14 + 2) = v22;

    v24 = *((void *)v14 + 2);
    dispatch_time_t v25 = dispatch_time(0, (unint64_t)(*((double *)v14 + 6) * 1000000000.0));
    dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_initWeak(&location, v14);
    v26 = *((void *)v14 + 2);
    *(void *)handler = MEMORY[0x1E4F143A8];
    *(void *)&handler[8] = 3221225472;
    *(void *)&handler[16] = __34__HDPowerAssertion__scheduleTimer__block_invoke;
    v32 = &unk_1E62F6BD0;
    objc_copyWeak(v33, &location);
    dispatch_source_set_event_handler(v26, handler);
    dispatch_resume(*((dispatch_object_t *)v14 + 2));
    objc_destroyWeak(v33);
    objc_destroyWeak(&location);
  }

  return (HDPowerAssertion *)v14;
}

- (HDPowerAssertion)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v3 & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"HDPowerAssertion.m", 97, @"Invalid parameter not satisfying: %@", @"invalidated" object file lineNumber description];
  }
  v6.receiver = self;
  v6.super_class = (Class)HDPowerAssertion;
  [(HDPowerAssertion *)&v6 dealloc];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)invalidated
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (void)invalidate
{
  char v2 = 0;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_invalidated, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      v5 = self->_timer;
      self->_timer = 0;
    }
    id timeoutHandler = self->_timeoutHandler;
    self->_id timeoutHandler = 0;

    IOReturn v7 = IOPMAssertionRelease(self->_assertionID);
    if (v7)
    {
      IOReturn v8 = v7;
      _HKInitializeLogging();
      v9 = HKLogInfrastructure();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        identifier = self->_identifier;
        int v11 = 138412546;
        IOReturn v12 = identifier;
        __int16 v13 = 1024;
        IOReturn v14 = v8;
        _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "Failed to release power assertion \"%@\": %d", (uint8_t *)&v11, 0x12u);
      }
    }
  }
}

void __34__HDPowerAssertion__scheduleTimer__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v2 = (void *)MEMORY[0x1C187C0E0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained[3];
    if (v5)
    {
      (*(void (**)(void))(v5 + 16))();
    }
    else
    {
      _HKInitializeLogging();
      objc_super v6 = HKLogInfrastructure();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        uint64_t v7 = v4[5];
        uint64_t v8 = v4[6];
        int v9 = 138412546;
        uint64_t v10 = v7;
        __int16 v11 = 2048;
        uint64_t v12 = v8;
        _os_log_fault_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_FAULT, "Power assertion \"%@\" timed out after %f seconds", (uint8_t *)&v9, 0x16u);
      }
    }
    [v4 invalidate];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end