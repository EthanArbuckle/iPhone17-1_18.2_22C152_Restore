@interface BLSHTTRWatchdog
- (BLSHTTRWatchdog)initWithOSProvider:(id)a3 configurationProvider:(id)a4 detailProvider:(id)a5;
- (BOOL)_shouldRunWatchdog;
- (BOOL)_test_enabledViaDefaults;
- (id)_test_tryAgainState;
- (void)_setupUserDefaults;
- (void)_test_forceShowTTRLater:(BOOL)a3;
- (void)_test_forceTryAgainNow;
- (void)_watchdogFired:(id)a3;
- (void)dealloc;
- (void)startWatchdog;
- (void)stopWatchdog;
@end

@implementation BLSHTTRWatchdog

- (BLSHTTRWatchdog)initWithOSProvider:(id)a3 configurationProvider:(id)a4 detailProvider:(id)a5
{
  id v9 = a3;
  v10 = (void (**)(void))a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BLSHTTRWatchdog;
  v12 = [(BLSHTTRWatchdog *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_test_forceShowTTRLater = 0;
    objc_storeStrong((id *)&v12->_osInterfaceProvider, a3);
    uint64_t v14 = MEMORY[0x223C5E2B0](v11);
    id detailProviderBlock = v13->_detailProviderBlock;
    v13->_id detailProviderBlock = (id)v14;

    uint64_t v16 = v10[2](v10);
    configuration = v13->_configuration;
    v13->_configuration = (BLSHTTRWatchdogConfiguration *)v16;

    [(BLSHTTRWatchdog *)v13 _setupUserDefaults];
  }

  return v13;
}

- (void)dealloc
{
  [(BSTimerScheduleQuerying *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  osInterfaceProvider = self->_osInterfaceProvider;
  self->_osInterfaceProvider = 0;

  id detailProviderBlock = self->_detailProviderBlock;
  self->_id detailProviderBlock = 0;

  v6.receiver = self;
  v6.super_class = (Class)BLSHTTRWatchdog;
  [(BLSHTTRWatchdog *)&v6 dealloc];
}

- (BOOL)_shouldRunWatchdog
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (has_internal_diagnostics)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
    v5 = [(BLSHTTRWatchdogConfiguration *)self->_configuration timerIdentifier];
    char v6 = [v4 BOOLForKey:v5];

    LOBYTE(has_internal_diagnostics) = v6;
  }
  return has_internal_diagnostics;
}

- (void)_watchdogFired:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = bls_diagnostics_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[BLSHTTRWatchdog _watchdogFired:]((uint64_t)self, v4);
  }

  v5 = (*((void (**)(void))self->_detailProviderBlock + 2))();
  if ([v5 showTTRAlert])
  {
    char v6 = [(BLSHTTRWatchdogConfiguration *)self->_configuration identifier];
    [v5 setIdentifier:v6];

    _BLSHShowWatchdogFailureAlert(v5, self->_test_forceShowTTRLater, 0);
  }
  else
  {
    v7 = bls_diagnostics_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = [(BLSHTTRWatchdogConfiguration *)self->_configuration identifier];
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_INFO, "TTR watchdog timer fired for %@, was asked to skip showing the alert.", (uint8_t *)&v10, 0xCu);
    }
  }
  [(BSTimerScheduleQuerying *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)startWatchdog
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(BLSHTTRWatchdog *)self _shouldRunWatchdog] && !self->_timer)
  {
    v3 = bls_diagnostics_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(BLSHTTRWatchdogConfiguration *)self->_configuration identifier];
      [(BLSHTTRWatchdogConfiguration *)self->_configuration timeout];
      *(_DWORD *)buf = 138412546;
      v17 = v4;
      __int16 v18 = 2048;
      uint64_t v19 = v5;
      _os_log_impl(&dword_21FCFC000, v3, OS_LOG_TYPE_INFO, "TTR watchdog starting timer for %@, will fire in %lf seconds.", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    osInterfaceProvider = self->_osInterfaceProvider;
    v7 = [(BLSHTTRWatchdogConfiguration *)self->_configuration timerIdentifier];
    [(BLSHTTRWatchdogConfiguration *)self->_configuration timeout];
    double v9 = v8;
    [(BLSHTTRWatchdogConfiguration *)self->_configuration leeway];
    double v11 = v10;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __32__BLSHTTRWatchdog_startWatchdog__block_invoke;
    v14[3] = &unk_264533320;
    objc_copyWeak(&v15, (id *)buf);
    uint64_t v12 = [(BLSHOSInterfaceProviding *)osInterfaceProvider scheduledTimerWithIdentifier:v7 interval:v14 leewayInterval:v9 handler:v11];
    timer = self->_timer;
    self->_timer = v12;

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

void __32__BLSHTTRWatchdog_startWatchdog__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _watchdogFired:v3];
}

- (void)stopWatchdog
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_timer)
  {
    id v3 = bls_diagnostics_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(BLSHTTRWatchdogConfiguration *)self->_configuration identifier];
      int v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_21FCFC000, v3, OS_LOG_TYPE_INFO, "TTR watchdog stopping timer for %@.", (uint8_t *)&v6, 0xCu);
    }
    [(BSTimerScheduleQuerying *)self->_timer invalidate];
    timer = self->_timer;
    self->_timer = 0;
  }
}

- (void)_setupUserDefaults
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = [*(id *)(a1 + 32) identifier];
  int v5 = [*(id *)(a1 + 32) enabledByDefault];
  int v6 = 138412546;
  v7 = v4;
  __int16 v8 = 1024;
  int v9 = v5;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "TTR watchdog timer defaults for %@ - enabled? %x", (uint8_t *)&v6, 0x12u);
}

- (void)_test_forceTryAgainNow
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend((id)__blsh_ttrwatchdog_lastFailureDetails, "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        _BLSHShowWatchdogFailureAlert(*(void **)(*((void *)&v7 + 1) + 8 * v6++), 0, 1);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_test_forceShowTTRLater:(BOOL)a3
{
  self->_test_forceShowTTRLater = a3;
}

- (BOOL)_test_enabledViaDefaults
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
  uint64_t v4 = [(BLSHTTRWatchdogConfiguration *)self->_configuration timerIdentifier];
  char v5 = [v3 BOOLForKey:v4];

  return v5;
}

- (id)_test_tryAgainState
{
  v2 = (void *)[(id)__blsh_ttrwatchdog_lastFailureDetails copy];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_detailProviderBlock, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)_watchdogFired:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  int v4 = 138412290;
  char v5 = v3;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "TTR watchdog timer fired for %@, requesting details to present alert.", (uint8_t *)&v4, 0xCu);
}

@end