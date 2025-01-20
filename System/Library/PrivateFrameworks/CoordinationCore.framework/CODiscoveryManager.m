@interface CODiscoveryManager
+ (id)managerWithDiscoveryDelay:(double)a3 delegate:(id)a4;
- (BOOL)addDiscoveryRecord:(id)a3;
- (BOOL)isTimerEnabled;
- (CODiscoveryManagerDelegate)delegate;
- (NSDictionary)envelopes;
- (OS_dispatch_source)timer;
- (double)discoveryDelay;
- (id)_initWithDiscoveryDelay:(double)a3 delegate:(id)a4;
- (id)_triggerDiscovery_unsafe;
- (unint64_t)count;
- (void)_configureTimer;
- (void)_disableTimer_unsafe;
- (void)_enableTimer_unsafe;
- (void)_invokeDelegate:(id)a3;
- (void)_timerFired;
- (void)_withLock:(id)a3;
- (void)clearRecords;
- (void)dealloc;
- (void)setEnvelopes:(id)a3;
- (void)setTimerEnabled:(BOOL)a3;
@end

@implementation CODiscoveryManager

- (id)_initWithDiscoveryDelay:(double)a3 delegate:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CODiscoveryManager;
  v7 = [(CODiscoveryManager *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    v7->_discoveryDelay = fabs(a3);
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = (NSDictionary *)objc_alloc_init(NSDictionary);
    envelopes = v8->_envelopes;
    v8->_envelopes = v9;

    dispatch_source_t v11 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, 0);
    timer = v8->_timer;
    v8->_timer = (OS_dispatch_source *)v11;

    [(CODiscoveryManager *)v8 _configureTimer];
  }

  return v8;
}

+ (id)managerWithDiscoveryDelay:(double)a3 delegate:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) _initWithDiscoveryDelay:v6 delegate:a3];

  return v7;
}

- (void)dealloc
{
  v3 = [(CODiscoveryManager *)self timer];
  dispatch_source_cancel(v3);

  [(CODiscoveryManager *)self setTimerEnabled:0];
  v4.receiver = self;
  v4.super_class = (Class)CODiscoveryManager;
  [(CODiscoveryManager *)&v4 dealloc];
}

- (unint64_t)count
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__CODiscoveryManager_count__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(CODiscoveryManager *)self _withLock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __27__CODiscoveryManager_count__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) envelopes];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (BOOL)addDiscoveryRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 IDSIdentifier];
  id v6 = +[CODiscoveryEnvelope envelopeWithRecord:v4];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__CODiscoveryManager_addDiscoveryRecord___block_invoke;
  v11[3] = &unk_2645CB388;
  id v7 = v4;
  id v12 = v7;
  v13 = self;
  id v8 = v5;
  id v14 = v8;
  id v9 = v6;
  id v15 = v9;
  v16 = &v17;
  [(CODiscoveryManager *)self _withLock:v11];
  LOBYTE(self) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

void __41__CODiscoveryManager_addDiscoveryRecord___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) envelopes];
  id v4 = [v3 objectForKey:*(void *)(a1 + 48)];
  uint64_t v5 = [v4 record];
  LOBYTE(v2) = [v2 isEqual:v5];

  if ((v2 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 40) envelopes];
    id v8 = (id)[v6 mutableCopy];

    [v8 setObject:*(void *)(a1 + 56) forKey:*(void *)(a1 + 48)];
    id v7 = [NSDictionary dictionaryWithDictionary:v8];
    [*(id *)(a1 + 40) setEnvelopes:v7];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_enableTimer_unsafe");
  }
}

- (void)clearRecords
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __34__CODiscoveryManager_clearRecords__block_invoke;
  v2[3] = &unk_2645CB288;
  v2[4] = self;
  [(CODiscoveryManager *)self _withLock:v2];
}

uint64_t __34__CODiscoveryManager_clearRecords__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_alloc_init(NSDictionary);
  [v2 setEnvelopes:v3];

  id v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_disableTimer_unsafe");
}

- (void)_timerFired
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__3;
  id v8 = __Block_byref_object_dispose__3;
  id v9 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__CODiscoveryManager__timerFired__block_invoke;
  v3[3] = &unk_2645CB120;
  v3[4] = self;
  v3[5] = &v4;
  [(CODiscoveryManager *)self _withLock:v3];
  if ([(id)v5[5] count]) {
    [(CODiscoveryManager *)self _invokeDelegate:v5[5]];
  }
  _Block_object_dispose(&v4, 8);
}

void __33__CODiscoveryManager__timerFired__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isTimerEnabled])
  {
    [*(id *)(a1 + 32) setTimerEnabled:0];
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_triggerDiscovery_unsafe");
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = [*(id *)(a1 + 32) envelopes];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "_enableTimer_unsafe");
    }
  }
}

- (id)_triggerDiscovery_unsafe
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_lock);
  [(CODiscoveryManager *)self discoveryDelay];
  double v4 = v3;
  __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [(CODiscoveryManager *)self envelopes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = v5 - (unint64_t)(v4 * 1000000000.0);
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v14 = [(CODiscoveryManager *)self envelopes];
        id v15 = [v14 objectForKey:v13];

        if ([v15 received] <= v10)
        {
          v16 = [v15 record];
          [v19 addObject:v16];
        }
        else
        {
          [v6 setObject:v15 forKey:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  uint64_t v17 = [NSDictionary dictionaryWithDictionary:v6];
  [(CODiscoveryManager *)self setEnvelopes:v17];

  return v19;
}

- (void)_configureTimer
{
  double v3 = [(CODiscoveryManager *)self timer];
  dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  [(CODiscoveryManager *)self setTimerEnabled:0];
  objc_initWeak(&location, self);
  double v4 = [(CODiscoveryManager *)self timer];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __37__CODiscoveryManager__configureTimer__block_invoke;
  uint64_t v9 = &unk_2645CB2E0;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v4, &v6);

  __uint64_t v5 = [(CODiscoveryManager *)self timer];
  dispatch_activate(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __37__CODiscoveryManager__configureTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _timerFired];
    id WeakRetained = v2;
  }
}

- (void)_enableTimer_unsafe
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (![(CODiscoveryManager *)self isTimerEnabled])
  {
    [(CODiscoveryManager *)self setTimerEnabled:1];
    [(CODiscoveryManager *)self discoveryDelay];
    int64_t v4 = (uint64_t)(v3 * 1000000000.0);
    source = [(CODiscoveryManager *)self timer];
    dispatch_time_t v5 = dispatch_time(0, v4);
    dispatch_source_set_timer(source, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
}

- (void)_disableTimer_unsafe
{
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(CODiscoveryManager *)self isTimerEnabled])
  {
    [(CODiscoveryManager *)self setTimerEnabled:0];
    double v3 = [(CODiscoveryManager *)self timer];
    dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
}

- (void)_invokeDelegate:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained discoveryManager:self didDiscoverRecords:v5];
  }
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  int64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (CODiscoveryManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CODiscoveryManagerDelegate *)WeakRetained;
}

- (double)discoveryDelay
{
  return self->_discoveryDelay;
}

- (NSDictionary)envelopes
{
  return self->_envelopes;
}

- (void)setEnvelopes:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (BOOL)isTimerEnabled
{
  return self->_timerEnabled;
}

- (void)setTimerEnabled:(BOOL)a3
{
  self->_timerEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_envelopes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end