@interface BLSHUserIdleProvider
- (AWAttentionAwarenessClient)attentionAwarenessClient;
- (AWAttentionAwarenessConfiguration)attentionAwarenessConfiguration;
- (BLSHUserIdleProvider)init;
- (BLSHUserIdleProvidingDelegate)delegate;
- (BOOL)shouldNotifyOfUnidle;
- (BOOL)shouldNotifyOfUnidleChanged;
- (NSMutableDictionary)attentionLostTimeoutDictionary;
- (double)idleTimeout;
- (void)_invalidate;
- (void)_pause;
- (void)_reset;
- (void)_resume;
- (void)_setIdleTimeout:(double)a3 shouldReset:(BOOL)a4;
- (void)_setShouldNotifyOfUnidle:(BOOL)a3;
- (void)invalidate;
- (void)pause;
- (void)reset;
- (void)resume;
- (void)setAttentionAwarenessClient:(id)a3;
- (void)setAttentionAwarenessConfiguration:(id)a3;
- (void)setAttentionLostTimeoutDictionary:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdleTimeout:(double)a3 shouldReset:(BOOL)a4;
- (void)setShouldNotifyOfUnidle:(BOOL)a3;
- (void)setShouldNotifyOfUnidleChanged:(BOOL)a3;
@end

@implementation BLSHUserIdleProvider

- (BLSHUserIdleProvider)init
{
  v17.receiver = self;
  v17.super_class = (Class)BLSHUserIdleProvider;
  v2 = [(BLSHUserIdleProvider *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_shouldNotifyOfUnidleChanged = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    attentionLostTimeoutDictionary = v3->_attentionLostTimeoutDictionary;
    v3->_attentionLostTimeoutDictionary = v4;

    v6 = (AWAttentionAwarenessClient *)objc_alloc_init(MEMORY[0x263F28868]);
    attentionAwarenessClient = v3->_attentionAwarenessClient;
    v3->_attentionAwarenessClient = v6;

    v8 = (AWAttentionAwarenessConfiguration *)objc_alloc_init(MEMORY[0x263F28870]);
    attentionAwarenessConfiguration = v3->_attentionAwarenessConfiguration;
    v3->_attentionAwarenessConfiguration = v8;

    [(AWAttentionAwarenessConfiguration *)v3->_attentionAwarenessConfiguration setIdentifier:@"com.apple.Carousel.BacklightServices.UserIdleProvider"];
    [(AWAttentionAwarenessConfiguration *)v3->_attentionAwarenessConfiguration setEventMask:4095];
    objc_initWeak(&location, v3);
    v10 = v3->_attentionAwarenessClient;
    uint64_t v11 = MEMORY[0x263EF83A0];
    id v12 = MEMORY[0x263EF83A0];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __28__BLSHUserIdleProvider_init__block_invoke;
    v14[3] = &unk_264534148;
    objc_copyWeak(&v15, &location);
    [(AWAttentionAwarenessClient *)v10 setEventHandlerWithQueue:v11 block:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __28__BLSHUserIdleProvider_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained delegate];
  if ([v3 eventMask])
  {
    v7 = [v3 associatedObject];
    if ([v7 isEqualToString:@"zeroTimeout"])
    {
      v8 = bls_backlight_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __28__BLSHUserIdleProvider_init__block_invoke_cold_1(v8);
      }
    }
    else if ([v7 isEqualToString:@"idleTimeout"])
    {
      v9 = bls_backlight_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_DEFAULT, "BLSHUserIdleProvider received user idle", buf, 2u);
      }

      if (objc_opt_respondsToSelector()) {
        [v5 idleProviderDidIdle:WeakRetained];
      }
    }
  }
  else if ([WeakRetained shouldNotifyOfUnidle])
  {
    v6 = bls_backlight_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_DEFAULT, "BLSHUserIdleProvider received user unidle", v10, 2u);
    }

    if (objc_opt_respondsToSelector()) {
      [v5 idleProviderDidUnidle:WeakRetained];
    }
  }
}

- (void)setIdleTimeout:(double)a3 shouldReset:(BOOL)a4
{
}

uint64_t __51__BLSHUserIdleProvider_setIdleTimeout_shouldReset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setIdleTimeout:*(unsigned __int8 *)(a1 + 48) shouldReset:*(double *)(a1 + 40)];
}

- (void)setShouldNotifyOfUnidle:(BOOL)a3
{
}

uint64_t __48__BLSHUserIdleProvider_setShouldNotifyOfUnidle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setShouldNotifyOfUnidle:*(unsigned __int8 *)(a1 + 40)];
}

- (void)resume
{
}

uint64_t __30__BLSHUserIdleProvider_resume__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resume];
}

- (void)pause
{
}

uint64_t __29__BLSHUserIdleProvider_pause__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pause];
}

- (void)reset
{
}

uint64_t __29__BLSHUserIdleProvider_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reset];
}

- (void)invalidate
{
}

uint64_t __34__BLSHUserIdleProvider_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_setIdleTimeout:(double)a3 shouldReset:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  v7 = bls_backlight_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    double idleTimeout = self->_idleTimeout;
    BOOL shouldNotifyOfUnidleChanged = self->_shouldNotifyOfUnidleChanged;
    *(_DWORD *)buf = 134218752;
    double v25 = a3;
    __int16 v26 = 2048;
    double v27 = idleTimeout;
    __int16 v28 = 1024;
    BOOL v29 = v4;
    __int16 v30 = 1024;
    BOOL v31 = shouldNotifyOfUnidleChanged;
    _os_log_debug_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_DEBUG, "BLSHUserIdleProvider _setIdleTimeout %lf currentTimeout %lf shouldReset=%{BOOL}u _shouldNotifyOfUnidleChanged=%{BOOL}u", buf, 0x22u);
  }

  if (vabdd_f64(a3, self->_idleTimeout) > 2.22044605e-16 || self->_shouldNotifyOfUnidleChanged)
  {
    v8 = bls_backlight_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v25 = a3;
      __int16 v26 = 1024;
      LODWORD(v27) = v4;
      _os_log_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_DEFAULT, "BLSHUserIdleProvider updating timeout %lf shouldReset=%{BOOL}u", buf, 0x12u);
    }

    self->_BOOL shouldNotifyOfUnidleChanged = 0;
    self->_double idleTimeout = a3;
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    attentionLostTimeoutDictionary = self->_attentionLostTimeoutDictionary;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __52__BLSHUserIdleProvider__setIdleTimeout_shouldReset___block_invoke;
    v22[3] = &unk_264534198;
    id v11 = v9;
    id v23 = v11;
    [(NSMutableDictionary *)attentionLostTimeoutDictionary enumerateKeysAndObjectsUsingBlock:v22];
    id v12 = [NSNumber numberWithDouble:a3];
    [v11 setObject:@"idleTimeout" forKey:v12];

    attentionAwarenessConfiguration = self->_attentionAwarenessConfiguration;
    v14 = (void *)[v11 copy];
    [(AWAttentionAwarenessConfiguration *)attentionAwarenessConfiguration setAttentionLostTimeoutDictionary:v14];

    attentionAwarenessClient = self->_attentionAwarenessClient;
    v16 = self->_attentionAwarenessConfiguration;
    id v21 = 0;
    [(AWAttentionAwarenessClient *)attentionAwarenessClient setConfiguration:v16 shouldReset:v4 error:&v21];
    id v17 = v21;
    if (v17)
    {
      v18 = bls_backlight_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[BLSHUserIdleProvider _setIdleTimeout:shouldReset:]();
      }
    }
  }
  else if (v4)
  {
    [(BLSHUserIdleProvider *)self _reset];
  }
}

void __52__BLSHUserIdleProvider__setIdleTimeout_shouldReset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([v5 isEqualToString:@"idleTimeout"] & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

- (void)_setShouldNotifyOfUnidle:(BOOL)a3
{
  if (self->_shouldNotifyOfUnidle != a3)
  {
    self->_BOOL shouldNotifyOfUnidleChanged = 1;
    self->_shouldNotifyOfUnidle = a3;
    attentionLostTimeoutDictionary = self->_attentionLostTimeoutDictionary;
    if (a3)
    {
      [(NSMutableDictionary *)attentionLostTimeoutDictionary setObject:@"zeroTimeout" forKey:&unk_26D191670];
    }
    else
    {
      [(NSMutableDictionary *)attentionLostTimeoutDictionary removeAllObjects];
      id v5 = self->_attentionLostTimeoutDictionary;
      id v6 = [NSNumber numberWithDouble:self->_idleTimeout];
      [(NSMutableDictionary *)v5 setObject:@"idleTimeout" forKey:v6];
    }
  }
}

- (void)_pause
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_21FCFC000, v0, v1, "error starting up attention awareness client %@", v2, v3, v4, v5, v6);
}

- (void)_resume
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_21FCFC000, v0, v1, "error resuming attention awareness client %@", v2, v3, v4, v5, v6);
}

- (void)_reset
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_21FCFC000, v0, v1, "could not reset user idle provider error=%@", v2, v3, v4, v5, v6);
}

- (void)_invalidate
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_21FCFC000, v0, v1, "error invalidating attention awareness client %@", v2, v3, v4, v5, v6);
}

- (BLSHUserIdleProvidingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BLSHUserIdleProvidingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldNotifyOfUnidle
{
  return self->_shouldNotifyOfUnidle;
}

- (double)idleTimeout
{
  return self->_idleTimeout;
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
}

- (AWAttentionAwarenessConfiguration)attentionAwarenessConfiguration
{
  return self->_attentionAwarenessConfiguration;
}

- (void)setAttentionAwarenessConfiguration:(id)a3
{
}

- (NSMutableDictionary)attentionLostTimeoutDictionary
{
  return self->_attentionLostTimeoutDictionary;
}

- (void)setAttentionLostTimeoutDictionary:(id)a3
{
}

- (BOOL)shouldNotifyOfUnidleChanged
{
  return self->_shouldNotifyOfUnidleChanged;
}

- (void)setShouldNotifyOfUnidleChanged:(BOOL)a3
{
  self->_BOOL shouldNotifyOfUnidleChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionLostTimeoutDictionary, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessConfiguration, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __28__BLSHUserIdleProvider_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21FCFC000, log, OS_LOG_TYPE_DEBUG, "ignoring zero timeout idle", v1, 2u);
}

- (void)_setIdleTimeout:shouldReset:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_21FCFC000, v0, v1, "could not update idle timeout for user idle provider error=%@", v2, v3, v4, v5, v6);
}

@end