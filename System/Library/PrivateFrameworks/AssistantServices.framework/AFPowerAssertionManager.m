@interface AFPowerAssertionManager
- (AFPowerAssertionManager)initWithIdentifier:(id)a3;
- (void)_createPowerAssertion;
- (void)_releasePowerAssertion;
- (void)_reportLeakedPowerAssertion;
- (void)_watchdogTimedOut;
- (void)assertionCoordinator:(id)a3 didActivateAssertion:(id)a4 isFirstAssertion:(BOOL)a5;
- (void)assertionCoordinator:(id)a3 didDeactivateAssertion:(id)a4 isLastAssertion:(BOOL)a5;
- (void)dealloc;
- (void)releaseAllPowerAssertions;
- (void)releasePowerAssertionWithName:(id)a3;
- (void)takePowerAssertionWithName:(id)a3;
@end

@implementation AFPowerAssertionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_assertionsByName, 0);
  objc_storeStrong((id *)&self->_assertionCoordinator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)_reportLeakedPowerAssertion
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    identifier = self->_identifier;
    int v8 = 136315650;
    v9 = "-[AFPowerAssertionManager _reportLeakedPowerAssertion]";
    __int16 v10 = 2048;
    v11 = self;
    __int16 v12 = 2112;
    v13 = identifier;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %p (%@)", (uint8_t *)&v8, 0x20u);
  }
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    v4 = [AFSettingsConnection alloc];
    v5 = +[AFInstanceContext defaultContext];
    v6 = [(AFSettingsConnection *)v4 initWithInstanceContext:v5];

    [(AFSettingsConnection *)v6 triggerABCForType:@"power" subType:@"leaked_assertion" context:0 completionHandler:&__block_literal_global_4461];
  }
}

void __54__AFPowerAssertionManager__reportLeakedPowerAssertion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      v5 = "-[AFPowerAssertionManager _reportLeakedPowerAssertion]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Unable to trigger ABC due to error %@.", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)_watchdogTimedOut
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    identifier = self->_identifier;
    int v8 = 136315906;
    v9 = "-[AFPowerAssertionManager _watchdogTimedOut]";
    __int16 v10 = 2048;
    v11 = self;
    __int16 v12 = 2112;
    v13 = identifier;
    __int16 v14 = 2048;
    uint64_t v15 = 0x4066800000000000;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %p (%@) Watchdog timed out after %f seconds.", (uint8_t *)&v8, 0x2Au);
  }
  unsigned int powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      id v7 = self->_identifier;
      int v8 = 136315906;
      v9 = "-[AFPowerAssertionManager _watchdogTimedOut]";
      __int16 v10 = 2048;
      v11 = self;
      __int16 v12 = 2112;
      v13 = v7;
      __int16 v14 = 1024;
      LODWORD(v15) = powerAssertion;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s %p (%@) Leaked power assertion ID %u.", (uint8_t *)&v8, 0x26u);
    }
    [(AFPowerAssertionManager *)self _reportLeakedPowerAssertion];
  }
}

- (void)_releasePowerAssertion
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    int v10 = 136315650;
    v11 = "-[AFPowerAssertionManager _releasePowerAssertion]";
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = identifier;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", (uint8_t *)&v10, 0x20u);
  }
  IOPMAssertionID powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    __int16 v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      id v7 = self->_identifier;
      int v10 = 136315906;
      v11 = "-[AFPowerAssertionManager _releasePowerAssertion]";
      __int16 v12 = 2048;
      v13 = self;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 1024;
      IOPMAssertionID v17 = powerAssertion;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %p (%@) Released power assertion ID %u.", (uint8_t *)&v10, 0x26u);
      IOPMAssertionID powerAssertion = self->_powerAssertion;
    }
    IOPMAssertionRelease(powerAssertion);
    self->_IOPMAssertionID powerAssertion = 0;
  }
  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    [(AFWatchdogTimer *)watchdogTimer cancel];
    v9 = self->_watchdogTimer;
    self->_watchdogTimer = 0;
  }
}

- (void)_createPowerAssertion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    v22 = "-[AFPowerAssertionManager _createPowerAssertion]";
    __int16 v23 = 2048;
    v24 = self;
    __int16 v25 = 2112;
    v26 = identifier;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
  }
  if (!self->_powerAssertion)
  {
    IOPMAssertionID AssertionID = 0;
    if (IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, (CFStringRef)self->_identifier, &AssertionID))
    {
      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        __int16 v6 = self->_identifier;
        *(_DWORD *)buf = 136315650;
        v22 = "-[AFPowerAssertionManager _createPowerAssertion]";
        __int16 v23 = 2048;
        v24 = self;
        __int16 v25 = 2112;
        v26 = v6;
        _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s %p (%@) Failed to create power assertion.", buf, 0x20u);
      }
    }
    else
    {
      IOPMAssertionID v7 = AssertionID;
      self->_IOPMAssertionID powerAssertion = AssertionID;
      int v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v9 = self->_identifier;
        *(_DWORD *)buf = 136315906;
        v22 = "-[AFPowerAssertionManager _createPowerAssertion]";
        __int16 v23 = 2048;
        v24 = self;
        __int16 v25 = 2112;
        v26 = v9;
        __int16 v27 = 1024;
        IOPMAssertionID v28 = v7;
        _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p (%@) Created power assertion with ID %u.", buf, 0x26u);
      }
    }
  }
  if (!self->_watchdogTimer)
  {
    objc_initWeak((id *)buf, self);
    int v10 = [AFWatchdogTimer alloc];
    queue = self->_queue;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    IOPMAssertionID v17 = __48__AFPowerAssertionManager__createPowerAssertion__block_invoke;
    uint64_t v18 = &unk_1E592B978;
    objc_copyWeak(&v19, (id *)buf);
    uint64_t v12 = [(AFWatchdogTimer *)v10 initWithTimeoutInterval:queue onQueue:&v15 timeoutHandler:180.0];
    watchdogTimer = self->_watchdogTimer;
    p_watchdogTimer = (id *)&self->_watchdogTimer;
    id *p_watchdogTimer = (id)v12;

    objc_msgSend(*p_watchdogTimer, "start", v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

void __48__AFPowerAssertionManager__createPowerAssertion__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _watchdogTimedOut];
}

- (void)assertionCoordinator:(id)a3 didDeactivateAssertion:(id)a4 isLastAssertion:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v8 = (AFAssertionCoordinator *)a3;
  v9 = (AFAssertionCoordinator *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  assertionCoordinator = self->_assertionCoordinator;
  v11 = AFSiriLogContextConnection;
  if (assertionCoordinator == v8)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      identifier = self->_identifier;
      int v14 = 136316162;
      uint64_t v15 = "-[AFPowerAssertionManager assertionCoordinator:didDeactivateAssertion:isLastAssertion:]";
      __int16 v16 = 2048;
      IOPMAssertionID v17 = self;
      __int16 v18 = 2112;
      id v19 = identifier;
      __int16 v20 = 2112;
      v21 = v9;
      __int16 v22 = 1024;
      LODWORD(v23) = v5;
      _os_log_debug_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@, isLastAssertion = %d", (uint8_t *)&v14, 0x30u);
      if (!v5) {
        goto LABEL_7;
      }
    }
    else if (!v5)
    {
      goto LABEL_7;
    }
    [(AFPowerAssertionManager *)self _releasePowerAssertion];
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = self->_identifier;
    int v14 = 136316162;
    uint64_t v15 = "-[AFPowerAssertionManager assertionCoordinator:didDeactivateAssertion:isLastAssertion:]";
    __int16 v16 = 2048;
    IOPMAssertionID v17 = self;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 2112;
    v21 = assertionCoordinator;
    __int16 v22 = 2112;
    __int16 v23 = v8;
    _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s %p (%@) Expected assertion coordinator is %@, actual assertion coordinator is %@.", (uint8_t *)&v14, 0x34u);
  }
LABEL_7:
}

- (void)assertionCoordinator:(id)a3 didActivateAssertion:(id)a4 isFirstAssertion:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v8 = (AFAssertionCoordinator *)a3;
  v9 = (AFAssertionCoordinator *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  assertionCoordinator = self->_assertionCoordinator;
  v11 = AFSiriLogContextConnection;
  if (assertionCoordinator == v8)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      identifier = self->_identifier;
      int v14 = 136316162;
      uint64_t v15 = "-[AFPowerAssertionManager assertionCoordinator:didActivateAssertion:isFirstAssertion:]";
      __int16 v16 = 2048;
      IOPMAssertionID v17 = self;
      __int16 v18 = 2112;
      id v19 = identifier;
      __int16 v20 = 2112;
      v21 = v9;
      __int16 v22 = 1024;
      LODWORD(v23) = v5;
      _os_log_debug_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@, isFirstAssertion = %d", (uint8_t *)&v14, 0x30u);
      if (!v5) {
        goto LABEL_7;
      }
    }
    else if (!v5)
    {
      goto LABEL_7;
    }
    [(AFPowerAssertionManager *)self _createPowerAssertion];
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = self->_identifier;
    int v14 = 136316162;
    uint64_t v15 = "-[AFPowerAssertionManager assertionCoordinator:didActivateAssertion:isFirstAssertion:]";
    __int16 v16 = 2048;
    IOPMAssertionID v17 = self;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 2112;
    v21 = assertionCoordinator;
    __int16 v22 = 2112;
    __int16 v23 = v8;
    _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s %p (%@) Expected assertion coordinator is %@, actual assertion coordinator is %@.", (uint8_t *)&v14, 0x34u);
  }
LABEL_7:
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    IOPMAssertionID v7 = "-[AFPowerAssertionManager dealloc]";
    __int16 v8 = 2048;
    v9 = self;
    __int16 v10 = 2112;
    v11 = identifier;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
  }
  [(AFPowerAssertionManager *)self _releasePowerAssertion];
  v5.receiver = self;
  v5.super_class = (Class)AFPowerAssertionManager;
  [(AFPowerAssertionManager *)&v5 dealloc];
}

- (void)releaseAllPowerAssertions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    __int16 v8 = "-[AFPowerAssertionManager releaseAllPowerAssertions]";
    __int16 v9 = 2048;
    __int16 v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = identifier;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AFPowerAssertionManager_releaseAllPowerAssertions__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__AFPowerAssertionManager_releaseAllPowerAssertions__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__AFPowerAssertionManager_releaseAllPowerAssertions__block_invoke_2;
  v7[3] = &unk_1E5925610;
  v7[4] = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v4 = *(void *)(a1 + 32);
  objc_super v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  return [*(id *)(a1 + 32) _releasePowerAssertion];
}

void __52__AFPowerAssertionManager_releaseAllPowerAssertions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  IOPMAssertionID v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v8 + 8);
    int v10 = 136316162;
    __int16 v11 = "-[AFPowerAssertionManager releaseAllPowerAssertions]_block_invoke_2";
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s %p (%@), name = %@, assertion = %@", (uint8_t *)&v10, 0x34u);
  }
  [v6 relinquishWithContext:0 options:0];
}

- (void)releasePowerAssertionWithName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (__CFString *)a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315906;
    __int16 v14 = "-[AFPowerAssertionManager releasePowerAssertionWithName:]";
    __int16 v15 = 2048;
    __int16 v16 = self;
    __int16 v17 = 2112;
    __int16 v18 = identifier;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p (%@) name = %@", buf, 0x2Au);
  }
  IOPMAssertionID v7 = @"default";
  if (v4) {
    IOPMAssertionID v7 = v4;
  }
  uint64_t v8 = v7;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__AFPowerAssertionManager_releasePowerAssertionWithName___block_invoke;
  v11[3] = &unk_1E592C710;
  v11[4] = self;
  __int16 v12 = v8;
  int v10 = v8;
  dispatch_async(queue, v11);
}

void __57__AFPowerAssertionManager_releasePowerAssertionWithName___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v6 + 8);
      int v8 = 136315906;
      uint64_t v9 = "-[AFPowerAssertionManager releasePowerAssertionWithName:]_block_invoke";
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      __int16 v15 = v2;
      _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@", (uint8_t *)&v8, 0x2Au);
    }
    [v2 relinquishWithContext:0 options:0];
    [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
    if (![*(id *)(*(void *)(a1 + 32) + 40) count])
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = 0;
    }
  }
}

- (void)takePowerAssertionWithName:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (__CFString *)a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315906;
    __int16 v22 = "-[AFPowerAssertionManager takePowerAssertionWithName:]";
    __int16 v23 = 2048;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    v26 = identifier;
    __int16 v27 = 2112;
    IOPMAssertionID v28 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p (%@) name = %@", buf, 0x2Au);
  }
  uint64_t v7 = @"default";
  if (v4) {
    uint64_t v7 = v4;
  }
  int v8 = v7;
  assertionCoordinator = self->_assertionCoordinator;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__AFPowerAssertionManager_takePowerAssertionWithName___block_invoke;
  v19[3] = &unk_1E59255E8;
  __int16 v10 = v8;
  uint64_t v20 = v10;
  id v11 = +[AFAssertionContext newWithBuilder:v19];
  __int16 v12 = [(AFAssertionCoordinator *)assertionCoordinator acquireRelinquishableAssertionWithContext:v11 relinquishmentHandler:0];

  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__AFPowerAssertionManager_takePowerAssertionWithName___block_invoke_2;
  v16[3] = &unk_1E592C338;
  v16[4] = self;
  id v17 = v12;
  __int16 v18 = v10;
  __int16 v14 = v10;
  id v15 = v12;
  dispatch_async(queue, v16);
}

void __54__AFPowerAssertionManager_takePowerAssertionWithName___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = @"effectiveName";
  v7[0] = v2;
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a2;
  id v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v4 setUserInfo:v5];
}

uint64_t __54__AFPowerAssertionManager_takePowerAssertionWithName___block_invoke_2(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = *(void *)(v8 + 8);
    int v11 = 136315906;
    __int16 v12 = "-[AFPowerAssertionManager takePowerAssertionWithName:]_block_invoke_2";
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@", (uint8_t *)&v11, 0x2Au);
  }
  v3 = *(void **)(a1[4] + 40);
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    v3 = *(void **)(a1[4] + 40);
  }
  return [v3 setObject:a1[5] forKey:a1[6]];
}

- (AFPowerAssertionManager)initWithIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AFPowerAssertionManager;
  uint64_t v5 = [(AFPowerAssertionManager *)&v18 init];
  if (v5)
  {
    if ([v4 length])
    {
      uint64_t v6 = [v4 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v6;
    }
    else
    {
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)@"com.apple.assistant.power-assertion-manager";
    }

    uint64_t v8 = (const char *)[@"com.apple.assistant.power-assertion-manager" UTF8String];
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v11 = dispatch_queue_create(v8, v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    __int16 v13 = [[AFAssertionCoordinator alloc] initWithIdentifier:@"com.apple.assistant.power-assertion-manager" queue:v5->_queue delegate:v5];
    assertionCoordinator = v5->_assertionCoordinator;
    v5->_assertionCoordinator = v13;

    v5->_IOPMAssertionID powerAssertion = 0;
    __int16 v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v5->_identifier;
      *(_DWORD *)buf = 136315650;
      uint64_t v20 = "-[AFPowerAssertionManager initWithIdentifier:]";
      __int16 v21 = 2048;
      __int16 v22 = v5;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
    }
  }

  return v5;
}

@end