@interface COBallotBrowser
- (BOOL)isTimerEnabled;
- (COBallotBrowser)initWithDiscoveryDelay:(double)a3;
- (COBrowserObserverSet)observerSet;
- (CORapportBrowser)rapportBrowser;
- (CORapportTransport)sourceTransport;
- (NSDictionary)envelopes;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)timer;
- (double)discoveryDelay;
- (id)addObserverUsingBlock:(id)a3;
- (id)registeredObservers;
- (unint64_t)count;
- (void)_addToQueuedRecords:(id)a3;
- (void)_configureTimer;
- (void)_disableTimer_unsafe;
- (void)_enableTimer_unsafe;
- (void)_informObserversOfDiscoveredRecord:(id)a3;
- (void)_timerFired;
- (void)_withLock:(id)a3;
- (void)clearRecords;
- (void)dealloc;
- (void)discoveryUsingBallot:(id)a3;
- (void)discoveryUsingOnDemandNodeCreationRequest:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setEnvelopes:(id)a3;
- (void)setRapportBrowser:(id)a3;
- (void)setSourceTransport:(id)a3;
- (void)setTimerEnabled:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)stop;
@end

@implementation COBallotBrowser

- (COBallotBrowser)initWithDiscoveryDelay:(double)a3
{
  v18.receiver = self;
  v18.super_class = (Class)COBallotBrowser;
  v4 = [(COBallotBrowser *)&v18 init];
  v5 = v4;
  if (v4)
  {
    v4->_discoveryDelay = fabs(a3);
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, 0);
    timer = v5->_timer;
    v5->_timer = (OS_dispatch_source *)v6;

    v8 = objc_alloc_init(COBrowserObserverSet);
    observerSet = v5->_observerSet;
    v5->_observerSet = v8;

    uint64_t v10 = [NSDictionary dictionary];
    envelopes = v5->_envelopes;
    v5->_envelopes = (NSDictionary *)v10;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coordination.ballotbrowser.%p", v5);
    id v12 = objc_claimAutoreleasedReturnValue();
    v13 = (const char *)[v12 UTF8String];
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v15;

    [(COBallotBrowser *)v5 _configureTimer];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(COBallotBrowser *)self timer];
  dispatch_source_cancel(v3);

  [(COBallotBrowser *)self setTimerEnabled:0];
  v4.receiver = self;
  v4.super_class = (Class)COBallotBrowser;
  [(COBallotBrowser *)&v4 dealloc];
}

- (void)clearRecords
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __31__COBallotBrowser_clearRecords__block_invoke;
  v2[3] = &unk_2645CB288;
  v2[4] = self;
  [(COBallotBrowser *)self _withLock:v2];
}

uint64_t __31__COBallotBrowser_clearRecords__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p clearing discovery records", (uint8_t *)&v7, 0xCu);
  }

  objc_super v4 = *(void **)(a1 + 32);
  id v5 = objc_alloc_init(NSDictionary);
  [v4 setEnvelopes:v5];

  return objc_msgSend(*(id *)(a1 + 32), "_disableTimer_unsafe");
}

- (id)addObserverUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [[COBrowserObserver alloc] initWithBlock:v4];

  dispatch_source_t v6 = [(COBallotBrowser *)self observerSet];
  [v6 addObserver:v5];

  return v5;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(COBallotBrowser *)self observerSet];
  [v5 removeObserver:v4];
}

- (id)registeredObservers
{
  v2 = [(COBallotBrowser *)self observerSet];
  uint64_t v3 = [v2 observers];

  return v3;
}

- (CORapportTransport)sourceTransport
{
  uint64_t v5 = 0;
  dispatch_source_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__8;
  uint64_t v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__COBallotBrowser_sourceTransport__block_invoke;
  v4[3] = &unk_2645CB120;
  v4[4] = self;
  v4[5] = &v5;
  [(COBallotBrowser *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CORapportTransport *)v2;
}

uint64_t __34__COBallotBrowser_sourceTransport__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));

  if (!WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 sourceTransport];
      objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), v5);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  return MEMORY[0x270F9A758]();
}

- (void)startWithCompletionHandler:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p Ballot browser started", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4, 0);
}

- (void)stop
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __23__COBallotBrowser_stop__block_invoke;
  v2[3] = &unk_2645CB288;
  v2[4] = self;
  [(COBallotBrowser *)self _withLock:v2];
}

uint64_t __23__COBallotBrowser_stop__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_alloc_init(NSDictionary);
  [v2 setEnvelopes:v3];

  id v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_disableTimer_unsafe");
}

- (void)discoveryUsingBallot:(id)a3
{
  id v4 = [a3 discovery];
  uint64_t v5 = [(COBallotBrowser *)self sourceTransport];
  if (v5)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__COBallotBrowser_discoveryUsingBallot___block_invoke;
    v7[3] = &unk_2645CAEF8;
    uint64_t v8 = v4;
    id v9 = v5;
    id v10 = self;
    [(COBallotBrowser *)self _withLock:v7];

    int v6 = v8;
  }
  else
  {
    int v6 = COCoreLogForCategory(14);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[COBallotBrowser discoveryUsingBallot:]((uint64_t)self, v6);
    }
  }
}

void __40__COBallotBrowser_discoveryUsingBallot___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        [v7 setSourceTransport:*(void *)(a1 + 40)];
        [*(id *)(a1 + 48) _addToQueuedRecords:v7];
        objc_msgSend(*(id *)(a1 + 48), "_enableTimer_unsafe");

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)discoveryUsingOnDemandNodeCreationRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(COBallotBrowser *)self sourceTransport];
  if (v5)
  {
    uint64_t v6 = [v4 request];
    if ([v6 conformsToProtocol:&unk_26D3F7A00]) {
      uint64_t v7 = [v6 listeningPort];
    }
    else {
      uint64_t v7 = 0;
    }
    long long v8 = [v6 _sendingConstituent];
    long long v9 = [v6 rapportOptions];
    long long v10 = [v9 objectForKey:*MEMORY[0x263F62C80]];
    long long v11 = [v9 objectForKey:*MEMORY[0x263F62C88]];
    id v12 = [v9 objectForKey:*MEMORY[0x263F62C50]];
    if (v8 && [v10 length] && objc_msgSend(v11, "length") && objc_msgSend(v12, "length"))
    {
      uint64_t v13 = +[CODiscoveryRecord discoveryRecordWithConstituent:v8 rapportIdentifier:v10 IDSIdentifier:v11 peerAddress:v12 port:v7];
      [v13 setSourceTransport:v5];
      [v13 setUnhandledRequest:v4];
      log = COCoreLogForCategory(14);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v19 = self;
        __int16 v20 = 2112;
        v21 = v13;
        _os_log_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEFAULT, "%p created discovery record %@ using election request", buf, 0x16u);
      }

      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __61__COBallotBrowser_discoveryUsingOnDemandNodeCreationRequest___block_invoke;
      v16[3] = &unk_2645CAE80;
      v16[4] = self;
      id v17 = v13;
      id v14 = v13;
      [(COBallotBrowser *)self _withLock:v16];
    }
  }
  else
  {
    uint64_t v6 = COCoreLogForCategory(14);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[COBallotBrowser discoveryUsingOnDemandNodeCreationRequest:]((uint64_t)self, v6);
    }
  }
}

uint64_t __61__COBallotBrowser_discoveryUsingOnDemandNodeCreationRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _informObserversOfDiscoveredRecord:*(void *)(a1 + 40)];
}

- (void)_configureTimer
{
  uint64_t v3 = [(COBallotBrowser *)self timer];
  dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  [(COBallotBrowser *)self setTimerEnabled:0];
  objc_initWeak(&location, self);
  id v4 = [(COBallotBrowser *)self timer];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  long long v8 = __34__COBallotBrowser__configureTimer__block_invoke;
  long long v9 = &unk_2645CB2E0;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v4, &v6);

  uint64_t v5 = [(COBallotBrowser *)self timer];
  dispatch_activate(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __34__COBallotBrowser__configureTimer__block_invoke(uint64_t a1)
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
  uint64_t v13 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_lock);
  if (![(COBallotBrowser *)self isTimerEnabled])
  {
    [(COBallotBrowser *)self setTimerEnabled:1];
    uint64_t v3 = COCoreLogForCategory(14);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double discoveryDelay = self->_discoveryDelay;
      int v9 = 134218240;
      id v10 = self;
      __int16 v11 = 2048;
      double v12 = discoveryDelay;
      _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%p enabling timer with discovery delay %f", (uint8_t *)&v9, 0x16u);
    }

    [(COBallotBrowser *)self discoveryDelay];
    int64_t v6 = (uint64_t)(v5 * 1000000000.0);
    uint64_t v7 = [(COBallotBrowser *)self timer];
    dispatch_time_t v8 = dispatch_time(0, v6);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
}

- (void)_disableTimer_unsafe
{
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(COBallotBrowser *)self isTimerEnabled])
  {
    [(COBallotBrowser *)self setTimerEnabled:0];
    uint64_t v3 = [(COBallotBrowser *)self timer];
    dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
}

- (void)_timerFired
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __30__COBallotBrowser__timerFired__block_invoke;
  v2[3] = &unk_2645CB288;
  v2[4] = self;
  [(COBallotBrowser *)self _withLock:v2];
}

void __30__COBallotBrowser__timerFired__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) isTimerEnabled])
  {
    [*v1 setTimerEnabled:0];
    id v2 = COCoreLogForCategory(14);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __30__COBallotBrowser__timerFired__block_invoke_cold_1(v1, v2);
    }

    [*v1 discoveryDelay];
    double v4 = v3;
    __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = objc_msgSend(*v1, "envelopes", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = v5 - (unint64_t)(v4 * 1000000000.0);
      uint64_t v11 = *(void *)v22;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
          id v14 = [*v1 envelopes];
          dispatch_queue_t v15 = [v14 objectForKey:v13];

          if ([v15 received] <= v10)
          {
            id v16 = *v1;
            id v17 = [v15 record];
            [v16 _informObserversOfDiscoveredRecord:v17];
          }
          else
          {
            [v6 setObject:v15 forKey:v13];
          }

          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    objc_super v18 = [NSDictionary dictionaryWithDictionary:v6];
    [*v1 setEnvelopes:v18];
    v19 = [*v1 envelopes];
    uint64_t v20 = [v19 count];

    if (v20) {
      objc_msgSend(*v1, "_enableTimer_unsafe");
    }
  }
}

- (void)_addToQueuedRecords:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  __uint64_t v5 = +[CODiscoveryEnvelope envelopeWithRecord:v4];
  id v6 = [v4 IDSIdentifier];
  uint64_t v7 = [(COBallotBrowser *)self envelopes];
  uint64_t v8 = [v7 objectForKey:v6];

  uint64_t v9 = [(COBallotBrowser *)self envelopes];
  unint64_t v10 = (void *)[v9 mutableCopy];

  if (!v8)
  {
LABEL_7:
    [v10 setObject:v5 forKey:v6];
    [(COBallotBrowser *)self setEnvelopes:v10];
    goto LABEL_8;
  }
  uint64_t v11 = [v8 record];
  uint64_t v12 = [v11 constituent];

  uint64_t v13 = [v4 constituent];
  if (([v12 isEqual:v13] & 1) == 0)
  {
    id v14 = COCoreLogForCategory(14);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      [(COBallotBrowser *)(uint64_t)self _addToQueuedRecords:v14];
    }

    [v10 removeObjectForKey:v6];
    goto LABEL_7;
  }

LABEL_8:
}

- (void)_informObserversOfDiscoveredRecord:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  __uint64_t v5 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v27 = self;
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p Ballot Browser informing observers about record %@", buf, 0x16u);
  }

  id v6 = [(COBallotBrowser *)self rapportBrowser];
  uint64_t v7 = [v6 companionLinkClientFactory];

  uint64_t v8 = [(COBallotBrowser *)self rapportBrowser];
  uint64_t v9 = [v8 sourceTransport];

  unint64_t v10 = [v4 companionLinkDevice];
  uint64_t v11 = [v4 IDSIdentifier];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __54__COBallotBrowser__informObserversOfDiscoveredRecord___block_invoke;
  v21[3] = &unk_2645CBAB8;
  id v22 = v7;
  id v23 = v10;
  id v24 = v11;
  id v25 = v9;
  id v12 = v9;
  id v13 = v11;
  id v14 = v10;
  id v15 = v7;
  [v4 setCompanionLinkProvider:v21];
  id v16 = [(COBallotBrowser *)self observerSet];
  id v17 = [v16 observers];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __54__COBallotBrowser__informObserversOfDiscoveredRecord___block_invoke_2;
  v19[3] = &unk_2645CBAE0;
  id v20 = v4;
  id v18 = v4;
  [v17 enumerateObjectsUsingBlock:v19];
}

id __54__COBallotBrowser__informObserversOfDiscoveredRecord___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) companionLinkClientForDevice:*(void *)(a1 + 40) withIDSIdentifier:*(void *)(a1 + 48)];
  double v3 = [*(id *)(a1 + 56) client];
  id v4 = [v3 dispatchQueue];
  [v2 setDispatchQueue:v4];

  return v2;
}

void __54__COBallotBrowser__informObserversOfDiscoveredRecord___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = [a2 block];
  v3[2](v3, 1, *(void *)(a1 + 32));
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (COBrowserObserverSet)observerSet
{
  return self->_observerSet;
}

- (double)discoveryDelay
{
  return self->_discoveryDelay;
}

- (unint64_t)count
{
  return self->_count;
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

- (NSDictionary)envelopes
{
  return self->_envelopes;
}

- (void)setEnvelopes:(id)a3
{
}

- (void)setSourceTransport:(id)a3
{
}

- (CORapportBrowser)rapportBrowser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rapportBrowser);
  return (CORapportBrowser *)WeakRetained;
}

- (void)setRapportBrowser:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_rapportBrowser);
  objc_destroyWeak((id *)&self->_sourceTransport);
  objc_storeStrong((id *)&self->_envelopes, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_observerSet, 0);
}

- (void)discoveryUsingBallot:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2217C1000, a2, OS_LOG_TYPE_ERROR, "%p no source transport. Ignoring discovery using ballot", (uint8_t *)&v2, 0xCu);
}

- (void)discoveryUsingOnDemandNodeCreationRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2217C1000, a2, OS_LOG_TYPE_ERROR, "%p no source transport. Ignoring discovery using election request", (uint8_t *)&v2, 0xCu);
}

void __30__COBallotBrowser__timerFired__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = *a1;
  uint64_t v4 = [*a1 envelopes];
  int v5 = 134218240;
  id v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = [v4 count];
  _os_log_debug_impl(&dword_2217C1000, a2, OS_LOG_TYPE_DEBUG, "%p timer fired. Envelope count = %lu", (uint8_t *)&v5, 0x16u);
}

- (void)_addToQueuedRecords:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEBUG, "%p updating discovery record to queue %@", (uint8_t *)&v3, 0x16u);
}

@end