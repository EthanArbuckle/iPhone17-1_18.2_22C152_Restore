@interface COIDSServerBag
- (COIDSServerBag)init;
- (COIDSServerBagDelegate)delegate;
- (IDSServerBag)idsServerBag;
- (NSNumber)isFastFoldEnabled;
- (NSNumber)isIPDiffingEnabled;
- (NSString)keySuffix;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)refreshTimer;
- (id)_onqueue_serverBagNumberValueForKey:(id)a3;
- (id)_onqueue_serverBagValueForKey:(id)a3;
- (int64_t)currentTimerDelay;
- (void)_onqueue_configureTimer;
- (void)_onqueue_timerFired;
- (void)_onqueue_updateCachedValuesWithServerValues;
- (void)_withLock:(id)a3;
- (void)configure;
- (void)setCurrentTimerDelay:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFastFoldEnabled:(id)a3;
- (void)setIpDiffing:(id)a3;
- (void)setIpDiffingEnabled:(id)a3;
@end

@implementation COIDSServerBag

- (COIDSServerBag)init
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)COIDSServerBag;
  v2 = [(COIDSServerBag *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = [MEMORY[0x263F4A0B8] sharedInstanceForBagType:0];
    objc_storeStrong((id *)&v3->_idsServerBag, v4);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("COIDSServerBag", v5);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v6;

    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v3->_dispatchQueue);
    refreshTimer = v3->_refreshTimer;
    v3->_refreshTimer = (OS_dispatch_source *)v8;

    v3->_currentTimerDelay = 30;
    if (IsAppleInternalBuild()) {
      v10 = @"-internal";
    }
    else {
      v10 = &stru_26D3D58C8;
    }
    v11 = v10;
    objc_storeStrong((id *)&v3->_keySuffix, v10);
    v12 = COCoreLogForCategory(21);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      __int16 v17 = 2048;
      uint64_t v18 = 0x403E000000000000;
      _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "Initializing using key suffix %@ with initial timer interval of %fs", buf, 0x16u);
    }
  }
  return v3;
}

- (void)configure
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__COIDSServerBag_configure__block_invoke;
  block[3] = &unk_2645CB288;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__COIDSServerBag_configure__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_configureTimer");
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_onqueue_updateCachedValuesWithServerValues");
}

- (void)_onqueue_updateCachedValuesWithServerValues
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(COIDSServerBag *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(COIDSServerBag *)self _onqueue_serverBagNumberValueForKey:@"co-fastFold-enabled"];
  v5 = [(COIDSServerBag *)self isFastFoldEnabled];
  if (v4 && ([v4 isEqual:v5] & 1) == 0)
  {
    v7 = COCoreLogForCategory(21);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218498;
      objc_super v14 = self;
      __int16 v15 = 2112;
      v16 = v5;
      __int16 v17 = 2112;
      uint64_t v18 = v4;
      _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p Updating fast fold enabled from %@ to %@", (uint8_t *)&v13, 0x20u);
    }

    [(COIDSServerBag *)self setFastFoldEnabled:v4];
    int v6 = 1;
  }
  else
  {
    int v6 = 0;
  }
  dispatch_source_t v8 = [(COIDSServerBag *)self _onqueue_serverBagNumberValueForKey:@"co-ipDiffing-enabled"];
  v9 = [(COIDSServerBag *)self isIPDiffingEnabled];
  if (v8 && ([v8 isEqual:v9] & 1) == 0)
  {
    v10 = COCoreLogForCategory(21);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218498;
      objc_super v14 = self;
      __int16 v15 = 2112;
      v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "%p Updating ip diffing enabled from %@ to %@", (uint8_t *)&v13, 0x20u);
    }

    [(COIDSServerBag *)self setIpDiffing:v8];
  }
  else if (!v6)
  {
    goto LABEL_19;
  }
  v11 = COCoreLogForCategory(21);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    objc_super v14 = self;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p Notifying delegate of server bag update", (uint8_t *)&v13, 0xCu);
  }

  v12 = [(COIDSServerBag *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v12 idsServerBagDidUpdate:self];
  }

LABEL_19:
}

- (id)_onqueue_serverBagNumberValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(COIDSServerBag *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(COIDSServerBag *)self _onqueue_serverBagValueForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)_onqueue_serverBagValueForKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(COIDSServerBag *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(COIDSServerBag *)self keySuffix];
  id v7 = (void *)[v6 length];

  if (v7)
  {
    dispatch_source_t v8 = [(COIDSServerBag *)self keySuffix];
    v9 = [v4 stringByAppendingString:v8];

    v10 = [(COIDSServerBag *)self idsServerBag];
    id v7 = [v10 objectForKey:v9];
  }
  else
  {
    v9 = 0;
  }
  v11 = COCoreLogForCategory(21);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218498;
    objc_super v14 = self;
    __int16 v15 = 2112;
    v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p serverBagValueForKey %@ returned %@", (uint8_t *)&v13, 0x20u);
  }

  return v7;
}

- (void)_onqueue_configureTimer
{
  v3 = [(COIDSServerBag *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  int64_t v4 = 1000000000 * [(COIDSServerBag *)self currentTimerDelay];
  v5 = [(COIDSServerBag *)self refreshTimer];
  dispatch_time_t v6 = dispatch_time(0, v4);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  objc_initWeak(&location, self);
  id v7 = [(COIDSServerBag *)self refreshTimer];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __41__COIDSServerBag__onqueue_configureTimer__block_invoke;
  v12 = &unk_2645CB2E0;
  objc_copyWeak(&v13, &location);
  dispatch_source_set_event_handler(v7, &v9);

  dispatch_source_t v8 = [(COIDSServerBag *)self refreshTimer];
  dispatch_activate(v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __41__COIDSServerBag__onqueue_configureTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_onqueue_timerFired");
    id WeakRetained = v2;
  }
}

- (void)_onqueue_timerFired
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(COIDSServerBag *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  int64_t v4 = COCoreLogForCategory(21);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    v11 = self;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p Server bag refresh timer fired", (uint8_t *)&v10, 0xCu);
  }

  [(COIDSServerBag *)self _onqueue_updateCachedValuesWithServerValues];
  uint64_t v5 = [(COIDSServerBag *)self currentTimerDelay];
  if (v5 >= 3600) {
    uint64_t v6 = 7200;
  }
  else {
    uint64_t v6 = 2 * v5;
  }
  [(COIDSServerBag *)self setCurrentTimerDelay:v6];
  int64_t v7 = 1000000000 * [(COIDSServerBag *)self currentTimerDelay];
  dispatch_source_t v8 = [(COIDSServerBag *)self refreshTimer];
  dispatch_time_t v9 = dispatch_time(0, v7);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  int64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)setFastFoldEnabled:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__COIDSServerBag_setFastFoldEnabled___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COIDSServerBag *)self _withLock:v6];
}

void __37__COIDSServerBag_setFastFoldEnabled___block_invoke(uint64_t a1)
{
}

- (void)setIpDiffing:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__COIDSServerBag_setIpDiffing___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COIDSServerBag *)self _withLock:v6];
}

void __31__COIDSServerBag_setIpDiffing___block_invoke(uint64_t a1)
{
}

- (NSNumber)isFastFoldEnabled
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  dispatch_source_t v8 = __Block_byref_object_copy__2;
  dispatch_time_t v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__COIDSServerBag_isFastFoldEnabled__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COIDSServerBag *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __35__COIDSServerBag_isFastFoldEnabled__block_invoke(uint64_t a1)
{
}

- (NSNumber)isIPDiffingEnabled
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  dispatch_source_t v8 = __Block_byref_object_copy__2;
  dispatch_time_t v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__COIDSServerBag_isIPDiffingEnabled__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COIDSServerBag *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __36__COIDSServerBag_isIPDiffingEnabled__block_invoke(uint64_t a1)
{
}

- (void)setIpDiffingEnabled:(id)a3
{
}

- (COIDSServerBagDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (COIDSServerBagDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSServerBag)idsServerBag
{
  return (IDSServerBag *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_source)refreshTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)currentTimerDelay
{
  return self->_currentTimerDelay;
}

- (void)setCurrentTimerDelay:(int64_t)a3
{
  self->_currentTimerDelay = a3;
}

- (NSString)keySuffix
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keySuffix, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_idsServerBag, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ipDiffingEnabled, 0);
  objc_storeStrong((id *)&self->_fastFoldEnabled, 0);
}

@end