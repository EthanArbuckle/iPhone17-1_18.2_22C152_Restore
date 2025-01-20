@interface _FEFocusUpdateThrottle
- (_FEFocusUpdateThrottle)initWithUpdateHandler:(id)a3;
- (void)_performScheduledUpdate;
- (void)didCreateProgrammaticFocusUpdateContext:(id)a3;
- (void)reset;
- (void)scheduleProgrammaticFocusUpdate;
- (void)teardown;
@end

@implementation _FEFocusUpdateThrottle

- (_FEFocusUpdateThrottle)initWithUpdateHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_FEFocusUpdateThrottle.m", 38, @"Invalid parameter not satisfying: %@", @"updateHandler" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)_FEFocusUpdateThrottle;
  v6 = [(_FEFocusUpdateThrottle *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_currentTimeout = 0.0166666667;
    uint64_t v8 = MEMORY[0x25335DA10](v5);
    id updateHandler = v7->_updateHandler;
    v7->_id updateHandler = (id)v8;
  }
  return v7;
}

- (void)teardown
{
  p_updateTimer = &self->_updateTimer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateTimer);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_updateTimer);
    [v5 invalidate];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34___FEFocusUpdateThrottle_teardown__block_invoke;
    block[3] = &unk_265328488;
    block[4] = self;
    if (UIKitCoreLibraryCore_2())
    {
      if (qword_269A11C70 != -1) {
        dispatch_once(&qword_269A11C70, &__block_literal_global_3);
      }
      [(id)_MergedGlobals_6 _performBlockAfterCATransactionCommits:block];
    }
    else
    {
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

- (void)scheduleProgrammaticFocusUpdate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!self->_updateIsScheduled)
  {
    self->_updateIsScheduled = 1;
    double lastUpdate = self->_lastUpdate;
    double currentTimeout = self->_currentTimeout;
    double Current = CFAbsoluteTimeGetCurrent();
    if (self->_nilUpdateCount && (double v6 = lastUpdate + currentTimeout - Current, v6 >= 0.0166666667))
    {
      v7 = logger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v13 = v6;
        _os_log_debug_impl(&dword_24F3F0000, v7, OS_LOG_TYPE_DEBUG, "Delaying focus update for %.2g seconds due to too many failed focus updates.", buf, 0xCu);
      }

      uint64_t v8 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__performScheduledUpdate selector:0 userInfo:0 repeats:v6];
      p_updateTimer = &self->_updateTimer;
      objc_storeWeak((id *)p_updateTimer, v8);

      id WeakRetained = objc_loadWeakRetained((id *)p_updateTimer);
      [WeakRetained setTolerance:0.0166666667];
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57___FEFocusUpdateThrottle_scheduleProgrammaticFocusUpdate__block_invoke;
      block[3] = &unk_265328488;
      block[4] = self;
      if (UIKitCoreLibraryCore_2())
      {
        if (qword_269A11C70 != -1) {
          dispatch_once(&qword_269A11C70, &__block_literal_global_3);
        }
        [(id)_MergedGlobals_6 _performBlockAfterCATransactionCommits:block];
      }
      else
      {
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
}

- (void)didCreateProgrammaticFocusUpdateContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_double lastUpdate = CFAbsoluteTimeGetCurrent();
  id v5 = [v4 nextFocusedItem];

  if (v5)
  {
    self->_unint64_t nilUpdateCount = 0;
    self->_double currentTimeout = 0.0166666667;
  }
  else
  {
    ++self->_nilUpdateCount;
    double currentTimeout = self->_currentTimeout;
    if (currentTimeout < 1.0)
    {
      self->_double currentTimeout = fmin(currentTimeout * 1.3, 1.0);
      v7 = logger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        double v8 = self->_currentTimeout;
        unint64_t nilUpdateCount = self->_nilUpdateCount;
        int v10 = 134218240;
        double v11 = v8;
        __int16 v12 = 2048;
        unint64_t v13 = nilUpdateCount;
        _os_log_debug_impl(&dword_24F3F0000, v7, OS_LOG_TYPE_DEBUG, "Encountered a programmatic focus update to a nil environment. Increasing cooldown period for programmatic focus updates to %.2g due to %lu failed focus updates.", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (void)_performScheduledUpdate
{
  if (self->_updateIsScheduled)
  {
    self->_updateIsScheduled = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_updateTimer);
    [WeakRetained invalidate];

    id v4 = (void (*)(void))*((void *)self->_updateHandler + 2);
    v4();
  }
}

- (void)reset
{
  self->_unint64_t nilUpdateCount = 0;
  self->_double currentTimeout = 0.0166666667;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31___FEFocusUpdateThrottle_reset__block_invoke;
  block[3] = &unk_265328488;
  block[4] = self;
  if (UIKitCoreLibraryCore_2())
  {
    if (qword_269A11C70 != -1) {
      dispatch_once(&qword_269A11C70, &__block_literal_global_3);
    }
    [(id)_MergedGlobals_6 _performBlockAfterCATransactionCommits:block];
  }
  else
  {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_destroyWeak((id *)&self->_updateTimer);
}

@end