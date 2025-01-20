@interface ACHTemplateSourceScheduler
- (ACHAchievementStoring)achievementStore;
- (ACHAwardsClient)client;
- (ACHDatabaseAssertionClient)assertionClient;
- (ACHTemplateSourceScheduler)initWithClient:(id)a3 assertionClient:(id)a4 templateStore:(id)a5 achievementStore:(id)a6;
- (ACHTemplateSourceScheduler)initWithProfile:(id)a3 templateStore:(id)a4 achievementStore:(id)a5;
- (ACHTemplateStore)templateStore;
- (BOOL)_isProtectedDataAvailable;
- (BOOL)_queue_client_runTemplateSources:(id)a3 requiringRunnableForDate:(BOOL)a4 error:(id *)a5;
- (BOOL)_queue_daemon_runTemplateSources:(id)a3 requiringRunnableForDate:(BOOL)a4 error:(id *)a5;
- (BOOL)_queue_runTemplateSources:(id)a3 requiringRunnableForDate:(BOOL)a4 error:(id *)a5;
- (BOOL)_runSynchronouslyWithError:(id *)a3;
- (BOOL)achievementStoreDidFinishInitialFetch;
- (BOOL)initialRunComplete;
- (BOOL)shouldScheduleAfterInitialFetch;
- (HDProfile)profile;
- (NSCalendar)gregorianCalendar;
- (NSDate)currentDateOverride;
- (NSDictionary)lastRunDateByTemplateSourceIdentifier;
- (NSMutableSet)templateSources;
- (OS_dispatch_queue)serialQueue;
- (id)_currentDate;
- (id)_runnableSourcesInSources:(id)a3 forDate:(id)a4 calendar:(id)a5;
- (int)protectedDataToken;
- (unint64_t)_sourceCount;
- (void)_listenForSignificantTimeChanges;
- (void)_runAllTemplateSources;
- (void)_startUp;
- (void)achievementStoreDidFinishInitialFetch:(id)a3;
- (void)daemonReady:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)deregisterTemplateSource:(id)a3;
- (void)registerTemplateSource:(id)a3;
- (void)runImmediatelyForTemplateSource:(id)a3;
- (void)setAchievementStore:(id)a3;
- (void)setAchievementStoreDidFinishInitialFetch:(BOOL)a3;
- (void)setAssertionClient:(id)a3;
- (void)setClient:(id)a3;
- (void)setCurrentDateOverride:(id)a3;
- (void)setGregorianCalendar:(id)a3;
- (void)setInitialRunComplete:(BOOL)a3;
- (void)setLastRunDateByTemplateSourceIdentifier:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProtectedDataToken:(int)a3;
- (void)setSerialQueue:(id)a3;
- (void)setShouldScheduleAfterInitialFetch:(BOOL)a3;
- (void)setTemplateSources:(id)a3;
- (void)setTemplateStore:(id)a3;
@end

@implementation ACHTemplateSourceScheduler

- (ACHTemplateSourceScheduler)initWithClient:(id)a3 assertionClient:(id)a4 templateStore:(id)a5 achievementStore:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)ACHTemplateSourceScheduler;
  v15 = [(ACHTemplateSourceScheduler *)&v33 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_client, a3);
    objc_storeStrong((id *)&v16->_assertionClient, a4);
    objc_storeStrong((id *)&v16->_templateStore, a5);
    objc_storeStrong((id *)&v16->_achievementStore, a6);
    [(ACHAchievementStoring *)v16->_achievementStore addObserver:v16];
    uint64_t v17 = HKCreateSerialDispatchQueue();
    serialQueue = v16->_serialQueue;
    v16->_serialQueue = (OS_dispatch_queue *)v17;

    v16->_initialRunComplete = 0;
    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    templateSources = v16->_templateSources;
    v16->_templateSources = v19;

    lastRunDateByTemplateSourceIdentifier = v16->_lastRunDateByTemplateSourceIdentifier;
    v16->_lastRunDateByTemplateSourceIdentifier = (NSDictionary *)MEMORY[0x263EFFA78];

    uint64_t v22 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    gregorianCalendar = v16->_gregorianCalendar;
    v16->_gregorianCalendar = (NSCalendar *)v22;

    objc_initWeak(&location, v16);
    v24 = (const char *)[(id)*MEMORY[0x263F235A8] UTF8String];
    v25 = v16->_serialQueue;
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __92__ACHTemplateSourceScheduler_initWithClient_assertionClient_templateStore_achievementStore___block_invoke;
    v30 = &unk_264515D40;
    objc_copyWeak(&v31, &location);
    notify_register_dispatch(v24, &v16->_protectedDataToken, v25, &v27);
    [(ACHTemplateSourceScheduler *)v16 _startUp];
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __92__ACHTemplateSourceScheduler_initWithClient_assertionClient_templateStore_achievementStore___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained client];
  int v4 = [v3 isProtectedDataAvailable];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    [v5 _runAllTemplateSources];
  }
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_protectedDataToken)) {
    notify_cancel(self->_protectedDataToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)ACHTemplateSourceScheduler;
  [(ACHTemplateSourceScheduler *)&v3 dealloc];
}

- (ACHTemplateSourceScheduler)initWithProfile:(id)a3 templateStore:(id)a4 achievementStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ACHTemplateSourceScheduler;
  id v11 = [(ACHTemplateSourceScheduler *)&v23 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_templateStore, a4);
    objc_storeStrong((id *)&v12->_achievementStore, a5);
    [(ACHAchievementStoring *)v12->_achievementStore addObserver:v12];
    uint64_t v13 = HKCreateSerialDispatchQueue();
    serialQueue = v12->_serialQueue;
    v12->_serialQueue = (OS_dispatch_queue *)v13;

    v12->_initialRunComplete = 0;
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    templateSources = v12->_templateSources;
    v12->_templateSources = v15;

    lastRunDateByTemplateSourceIdentifier = v12->_lastRunDateByTemplateSourceIdentifier;
    v12->_lastRunDateByTemplateSourceIdentifier = (NSDictionary *)MEMORY[0x263EFFA78];

    uint64_t v18 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    gregorianCalendar = v12->_gregorianCalendar;
    v12->_gregorianCalendar = (NSCalendar *)v18;

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    v21 = [WeakRetained daemon];
    [v21 registerForDaemonReady:v12];
  }
  return v12;
}

- (void)registerTemplateSource:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHTemplateSourceScheduler *)self serialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__ACHTemplateSourceScheduler_registerTemplateSource___block_invoke;
  v7[3] = &unk_264515DE0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__ACHTemplateSourceScheduler_registerTemplateSource___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  int v3 = [*(id *)(a1 + 32) conformsToProtocol:&unk_26D121F18];
  id v4 = ACHLogDefault();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*v2 identifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v6;
      _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Template Source scheduler adding template source with identifier %{public}@", buf, 0xCu);
    }
    v7 = [*(id *)(a1 + 40) templateSources];
    [v7 addObject:*(void *)(a1 + 32)];

    int v8 = [*(id *)(a1 + 40) initialRunComplete];
    id v5 = ACHLogDefault();
    BOOL v9 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v9)
      {
        id v10 = [*v2 identifier];
        *(_DWORD *)buf = 138543362;
        uint64_t v18 = v10;
        _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Template Source scheduler running new template source with identifier %{public}@", buf, 0xCu);
      }
      id v11 = *(void **)(a1 + 40);
      id v12 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 32)];
      id v16 = 0;
      objc_msgSend(v11, "_queue_runTemplateSources:requiringRunnableForDate:error:", v12, 1, &v16);
      id v5 = v16;

      if (v5)
      {
        uint64_t v13 = ACHLogTemplates();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [*v2 identifier];
          *(_DWORD *)buf = 138412546;
          uint64_t v18 = v14;
          __int16 v19 = 2112;
          v20 = v5;
          _os_log_impl(&dword_21F5DA000, v13, OS_LOG_TYPE_DEFAULT, "Unable to run template source with identifier: %@; %@",
            buf,
            0x16u);
        }
      }
    }
    else if (v9)
    {
      v15 = [*v2 identifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v15;
      _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Template Source scheduler not running new template source with identifier %{public}@ because initial run is not complete", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __53__ACHTemplateSourceScheduler_registerTemplateSource___block_invoke_cold_1();
  }
}

- (void)deregisterTemplateSource:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHTemplateSourceScheduler *)self serialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__ACHTemplateSourceScheduler_deregisterTemplateSource___block_invoke;
  v7[3] = &unk_264515DE0;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__ACHTemplateSourceScheduler_deregisterTemplateSource___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  int v3 = [*(id *)(a1 + 32) conformsToProtocol:&unk_26D121F18];
  id v4 = [v2[1] templateSources];
  int v5 = [v4 containsObject:*v2];

  if (v3) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (v3)
    {
      if (v5) {
        return;
      }
      v7 = ACHLogDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __55__ACHTemplateSourceScheduler_deregisterTemplateSource___block_invoke_cold_1();
      }
    }
    else
    {
      v7 = ACHLogDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __55__ACHTemplateSourceScheduler_deregisterTemplateSource___block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v8 = ACHLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*v2 identifier];
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Template Source scheduler removing template source with identifier %{public}@", (uint8_t *)&v11, 0xCu);
    }
    v7 = [*(id *)(a1 + 40) templateSources];
    [v7 removeObject:*(void *)(a1 + 32)];
  }
}

- (void)runImmediatelyForTemplateSource:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = ACHLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [v4 identifier];
    *(_DWORD *)buf = 138543362;
    id v12 = v6;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Template Source scheduler immediate run requested for source: %{public}@", buf, 0xCu);
  }
  v7 = [(ACHTemplateSourceScheduler *)self serialQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__ACHTemplateSourceScheduler_runImmediatelyForTemplateSource___block_invoke;
  v9[3] = &unk_264515DE0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __62__ACHTemplateSourceScheduler_runImmediatelyForTemplateSource___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) templateSources];
  char v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    if ([*(id *)(a1 + 32) initialRunComplete])
    {
      id v4 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
      int v5 = *(void **)(a1 + 32);
      id v9 = 0;
      objc_msgSend(v5, "_queue_runTemplateSources:requiringRunnableForDate:error:", v4, 0, &v9);
      id v6 = v9;
      if (v6)
      {
        v7 = ACHLogTemplates();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [*(id *)(a1 + 40) identifier];
          *(_DWORD *)buf = 138412546;
          int v11 = v8;
          __int16 v12 = 2112;
          id v13 = v6;
          _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Unable to run template source with identifier %@; %@",
            buf,
            0x16u);
        }
      }
    }
    else
    {
      id v4 = ACHLogDefault();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F5DA000, v4, OS_LOG_TYPE_DEFAULT, "Template Source scheduler not honoring request, initial run hasn't completed", buf, 2u);
      }
    }
  }
  else
  {
    id v4 = ACHLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__ACHTemplateSourceScheduler_runImmediatelyForTemplateSource___block_invoke_cold_1();
    }
  }
}

- (void)daemonReady:(id)a3
{
  id v4 = [(ACHTemplateSourceScheduler *)self profile];
  int v5 = [v4 database];
  [v5 addProtectedDataObserver:self];

  [(ACHTemplateSourceScheduler *)self _startUp];
}

- (BOOL)_isProtectedDataAvailable
{
  char v3 = [(ACHTemplateSourceScheduler *)self client];

  if (v3)
  {
    id v4 = [(ACHTemplateSourceScheduler *)self client];
    LOBYTE(v5) = [v4 isProtectedDataAvailable];
  }
  else
  {
    id v4 = [(ACHTemplateSourceScheduler *)self profile];
    id v6 = [v4 database];
    uint64_t v5 = [v6 isProtectedDataAvailable];
  }
  return v5;
}

- (void)_startUp
{
  if ([(ACHTemplateSourceScheduler *)self _isProtectedDataAvailable]
    && [(ACHTemplateSourceScheduler *)self achievementStoreDidFinishInitialFetch])
  {
    [(ACHTemplateSourceScheduler *)self _runAllTemplateSources];
  }
  else if (![(ACHTemplateSourceScheduler *)self achievementStoreDidFinishInitialFetch])
  {
    [(ACHTemplateSourceScheduler *)self setShouldScheduleAfterInitialFetch:1];
  }
  [(ACHTemplateSourceScheduler *)self _listenForSignificantTimeChanges];
}

- (void)_listenForSignificantTimeChanges
{
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__ACHTemplateSourceScheduler__listenForSignificantTimeChanges__block_invoke;
  v18[3] = &unk_264515D68;
  objc_copyWeak(&v19, &location);
  char v3 = (void *)MEMORY[0x223C507A0](v18);
  id v4 = (const char *)[@"SignificantTimeChangeNotification" UTF8String];
  p_significantTimeChangeToken = &self->_significantTimeChangeToken;
  id v6 = MEMORY[0x263EF83A0];
  id v7 = MEMORY[0x263EF83A0];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __62__ACHTemplateSourceScheduler__listenForSignificantTimeChanges__block_invoke_367;
  handler[3] = &unk_2645187B8;
  id v8 = v3;
  id v17 = v8;
  notify_register_dispatch(v4, p_significantTimeChangeToken, v6, handler);

  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  id v10 = [MEMORY[0x263F08A48] mainQueue];
  uint64_t v11 = *MEMORY[0x263EFF3C8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__ACHTemplateSourceScheduler__listenForSignificantTimeChanges__block_invoke_2;
  v14[3] = &unk_2645187E0;
  id v12 = v8;
  id v15 = v12;
  id v13 = (id)[v9 addObserverForName:v11 object:0 queue:v10 usingBlock:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __62__ACHTemplateSourceScheduler__listenForSignificantTimeChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    int v3 = [WeakRetained _isProtectedDataAvailable];
    id v4 = ACHLogTemplates();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F5DA000, v4, OS_LOG_TYPE_DEFAULT, "Significant time change: Running template sources", buf, 2u);
      }

      [v2 _runAllTemplateSources];
    }
    else
    {
      if (v5)
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_21F5DA000, v4, OS_LOG_TYPE_DEFAULT, "Significant time change: Will run template sources next time protected data is available", v6, 2u);
      }
    }
  }
}

uint64_t __62__ACHTemplateSourceScheduler__listenForSignificantTimeChanges__block_invoke_367(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__ACHTemplateSourceScheduler__listenForSignificantTimeChanges__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4
    && [(ACHTemplateSourceScheduler *)self achievementStoreDidFinishInitialFetch])
  {
    [(ACHTemplateSourceScheduler *)self _runAllTemplateSources];
  }
}

- (id)_runnableSourcesInSources:(id)a3 forDate:(id)a4 calendar:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__ACHTemplateSourceScheduler__runnableSourcesInSources_forDate_calendar___block_invoke;
  v14[3] = &unk_264518808;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = objc_msgSend(a3, "hk_filter:", v14);

  return v12;
}

uint64_t __73__ACHTemplateSourceScheduler__runnableSourcesInSources_forDate_calendar___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) lastRunDateByTemplateSourceIdentifier];
  BOOL v5 = [v3 identifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  uint64_t v7 = [v3 runCadence];
  if (v7 == 2)
  {
    if (!v6 || ([*(id *)(a1 + 40) isDate:*(void *)(a1 + 48) inSameDayAsDate:v6] & 1) == 0) {
      goto LABEL_8;
    }
  }
  else if (v7 == 1 && !v6)
  {
LABEL_8:
    uint64_t v8 = [v3 sourceShouldRunForDate:*(void *)(a1 + 48)];
    goto LABEL_9;
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (void)_runAllTemplateSources
{
  id v3 = [(ACHTemplateSourceScheduler *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__ACHTemplateSourceScheduler__runAllTemplateSources__block_invoke;
  block[3] = &unk_264515DB8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __52__ACHTemplateSourceScheduler__runAllTemplateSources__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 templateSources];
  id v7 = 0;
  int v4 = objc_msgSend(v2, "_queue_runTemplateSources:requiringRunnableForDate:error:", v3, 1, &v7);
  id v5 = v7;

  if (v4) {
    [*(id *)(a1 + 32) setInitialRunComplete:1];
  }
  if (v5)
  {
    id v6 = ACHLogTemplates();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "Error running template sources: %@", buf, 0xCu);
    }
  }
}

- (BOOL)_queue_runTemplateSources:(id)a3 requiringRunnableForDate:(BOOL)a4 error:(id *)a5
{
  id v6 = [(ACHTemplateSourceScheduler *)self client];

  id v7 = [(ACHTemplateSourceScheduler *)self templateSources];
  if (v6) {
    BOOL v8 = [(ACHTemplateSourceScheduler *)self _queue_client_runTemplateSources:v7 requiringRunnableForDate:1 error:0];
  }
  else {
    BOOL v8 = [(ACHTemplateSourceScheduler *)self _queue_daemon_runTemplateSources:v7 requiringRunnableForDate:1 error:0];
  }
  BOOL v9 = v8;

  return v9;
}

- (BOOL)_queue_client_runTemplateSources:(id)a3 requiringRunnableForDate:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v58 = self;
  BOOL v8 = [(ACHTemplateSourceScheduler *)self serialQueue];
  dispatch_assert_queue_V2(v8);

  BOOL v9 = ACHLogAwardEngine();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "[#mc] _queue_runTemplateSources", buf, 2u);
  }

  id v10 = objc_alloc(MEMORY[0x263EFFA40]);
  v57 = (void *)[v10 initWithSuiteName:*MEMORY[0x263F23588]];
  int v11 = [v57 BOOLForKey:*MEMORY[0x263F23458]];
  int v12 = [v57 BOOLForKey:*MEMORY[0x263F23450]];
  v61 = [(ACHTemplateSourceScheduler *)v58 _currentDate];
  id v13 = v7;
  v56 = v13;
  if (((!v5 | v11 | v12) & 1) == 0)
  {
    uint64_t v14 = [(ACHTemplateSourceScheduler *)v58 gregorianCalendar];
    uint64_t v15 = [(ACHTemplateSourceScheduler *)v58 _runnableSourcesInSources:v56 forDate:v61 calendar:v14];

    id v13 = (id)v15;
  }
  v55 = v13;
  if ([v13 count])
  {
    id v16 = [(ACHTemplateSourceScheduler *)v58 assertionClient];
    id v96 = 0;
    v54 = [v16 acquireDatabaseAssertionWithIdentifier:@"ACHTemplateSourceScheduler" duration:&v96 error:20.0];
    id v52 = v96;

    v94[0] = 0;
    v94[1] = v94;
    v94[2] = 0x2810000000;
    v94[3] = &unk_21F67425F;
    int v95 = 0;
    *(void *)buf = 0;
    v89 = buf;
    uint64_t v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__33;
    v92 = __Block_byref_object_dispose__33;
    id v93 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x3032000000;
    v85 = __Block_byref_object_copy__33;
    v86 = __Block_byref_object_dispose__33;
    id v87 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__33;
    v80 = __Block_byref_object_dispose__33;
    id v81 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v17 = ACHLogDefault();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v102 = 138412290;
      v103 = v55;
      _os_log_impl(&dword_21F5DA000, v17, OS_LOG_TYPE_DEFAULT, "Running template sourcing for these sources: %@", v102, 0xCu);
    }

    group = dispatch_group_create();
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = v55;
    uint64_t v18 = [obj countByEnumeratingWithState:&v72 objects:v101 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v73;
      v20 = (void *)MEMORY[0x263EFFA78];
      do
      {
        uint64_t v21 = 0;
        uint64_t v22 = v20;
        do
        {
          if (*(void *)v73 != v19) {
            objc_enumerationMutation(obj);
          }
          objc_super v23 = *(void **)(*((void *)&v72 + 1) + 8 * v21);
          v66[0] = MEMORY[0x263EF8330];
          v66[1] = 3221225472;
          v66[2] = __94__ACHTemplateSourceScheduler__queue_client_runTemplateSources_requiringRunnableForDate_error___block_invoke;
          v66[3] = &unk_264518830;
          v68 = v94;
          v66[4] = v23;
          v69 = buf;
          v70 = &v76;
          v71 = &v82;
          v24 = group;
          v67 = v24;
          v25 = (void *)MEMORY[0x223C507A0](v66);
          dispatch_group_enter(v24);
          [v23 templatesForDate:v61 completion:v25];
          v26 = [v23 identifier];
          v99 = v26;
          v100 = v61;
          uint64_t v27 = [NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
          v20 = objc_msgSend(v22, "hk_dictionaryByAddingEntriesFromDictionary:", v27);

          ++v21;
          uint64_t v22 = v20;
        }
        while (v18 != v21);
        uint64_t v18 = [obj countByEnumeratingWithState:&v72 objects:v101 count:16];
      }
      while (v18);
    }
    else
    {
      v20 = (void *)MEMORY[0x263EFFA78];
    }

    dispatch_time_t v29 = dispatch_time(0, 30000000000);
    if (dispatch_group_wait(group, v29))
    {
      v30 = ACHLogTemplates();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[ACHTemplateSourceScheduler _queue_client_runTemplateSources:requiringRunnableForDate:error:]();
      }

      id v31 = (void *)MEMORY[0x263F087E8];
      uint64_t v97 = *MEMORY[0x263F08320];
      v98 = @"Waited for dispatch group and reached timeout. Source scheduling appears to have failed.";
      v32 = [NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
      objc_super v33 = [v31 errorWithDomain:@"com.apple.ActivityAchievements" code:-1 userInfo:v32];

      id v34 = v33;
      id v35 = v34;
      if (v34)
      {
        if (a5) {
          *a5 = v34;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v39 = [(ACHTemplateSourceScheduler *)v58 assertionClient];
      id v65 = v52;
      [v39 invalidateAssertionWithToken:v54 error:&v65];
      id v37 = v65;

      BOOL v28 = 0;
      goto LABEL_41;
    }
    v36 = [(ACHTemplateSourceScheduler *)v58 assertionClient];
    id v64 = v52;
    [v36 invalidateAssertionWithToken:v54 error:&v64];
    id v37 = v64;

    if ([*((id *)v89 + 5) count])
    {
      id v38 = [*((id *)v89 + 5) firstObject];
      id v39 = v38;
      if (v38)
      {
        if (a5)
        {
          id v40 = v38;
LABEL_33:
          BOOL v28 = 0;
          *a5 = v40;
LABEL_40:
          id v35 = v39;
LABEL_41:

          _Block_object_dispose(&v76, 8);
          _Block_object_dispose(&v82, 8);

          _Block_object_dispose(buf, 8);
          _Block_object_dispose(v94, 8);

          goto LABEL_42;
        }
        _HKLogDroppedError();
      }
    }
    else
    {
      v41 = [(ACHTemplateSourceScheduler *)v58 templateStore];
      uint64_t v42 = v77[5];
      id v63 = 0;
      [v41 removeTemplates:v42 error:&v63];
      id v35 = v63;

      if (!v35)
      {
        v44 = [(ACHTemplateSourceScheduler *)v58 templateStore];
        uint64_t v45 = v83[5];
        id v62 = 0;
        [v44 addTemplates:v45 databaseContext:0 error:&v62];
        id v39 = v62;

        BOOL v28 = v39 == 0;
        if (v39)
        {
          v46 = v39;
          v47 = v46;
          if (a5) {
            *a5 = v46;
          }
          else {
            _HKLogDroppedError();
          }
        }
        else
        {
          v49 = [(ACHTemplateSourceScheduler *)v58 lastRunDateByTemplateSourceIdentifier];
          v50 = objc_msgSend(v49, "hk_dictionaryByAddingEntriesFromDictionary:", v20);
          [(ACHTemplateSourceScheduler *)v58 setLastRunDateByTemplateSourceIdentifier:v50];

          v47 = ACHLogTemplates();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v51 = [(ACHTemplateSourceScheduler *)v58 lastRunDateByTemplateSourceIdentifier];
            *(_DWORD *)v102 = 138543362;
            v103 = v51;
            _os_log_impl(&dword_21F5DA000, v47, OS_LOG_TYPE_DEFAULT, "Updated last run dates for template sources to: %{public}@", v102, 0xCu);
          }
        }

        goto LABEL_41;
      }
      id v43 = v35;
      id v39 = v43;
      if (a5)
      {
        id v40 = v43;
        goto LABEL_33;
      }
      _HKLogDroppedError();
    }
    BOOL v28 = 0;
    goto LABEL_40;
  }
  BOOL v28 = 1;
LABEL_42:

  return v28;
}

void __94__ACHTemplateSourceScheduler__queue_client_runTemplateSources_requiringRunnableForDate_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock_with_options();
  if (v9) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v9];
  }
  uint64_t v42 = v9;
  if (v8)
  {
    id v43 = v7;
    id v10 = ACHLogTemplates();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138543618;
      v61 = v11;
      __int16 v62 = 2048;
      uint64_t v63 = [v8 count];
      _os_log_impl(&dword_21F5DA000, v10, OS_LOG_TYPE_DEFAULT, "Source %{public}@ returned %lu templates, removing from template store:", buf, 0x16u);
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v54 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          uint64_t v18 = ACHLogTemplates();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = [v17 uniqueName];
            *(_DWORD *)buf = 134218242;
            v61 = v17;
            __int16 v62 = 2114;
            uint64_t v63 = (uint64_t)v19;
            _os_log_impl(&dword_21F5DA000, v18, OS_LOG_TYPE_DEFAULT, "%p: %{public}@", buf, 0x16u);
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v14);
    }

    v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v21 = [v12 allObjects];
    [v20 addObjectsFromArray:v21];

    id v7 = v43;
  }
  v44 = v8;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v22 = v7;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v50 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        BOOL v28 = [*(id *)(a1 + 32) identifier];
        [v27 setSourceName:v28];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v24);
  }

  dispatch_time_t v29 = ACHLogTemplates();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = [*(id *)(a1 + 32) identifier];
    uint64_t v31 = [v22 count];
    *(_DWORD *)buf = 138543618;
    v61 = v30;
    __int16 v62 = 2048;
    uint64_t v63 = v31;
    _os_log_impl(&dword_21F5DA000, v29, OS_LOG_TYPE_DEFAULT, "Source %{public}@ returned %lu templates, writing to template store:", buf, 0x16u);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v32 = v22;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(v32);
        }
        id v37 = *(void **)(*((void *)&v45 + 1) + 8 * k);
        id v38 = ACHLogTemplates();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          id v39 = [v37 uniqueName];
          *(_DWORD *)buf = 134218242;
          v61 = v37;
          __int16 v62 = 2114;
          uint64_t v63 = (uint64_t)v39;
          _os_log_impl(&dword_21F5DA000, v38, OS_LOG_TYPE_DEFAULT, "%p: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v34);
  }

  id v40 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  v41 = [v32 allObjects];
  [v40 addObjectsFromArray:v41];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)_queue_daemon_runTemplateSources:(id)a3 requiringRunnableForDate:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  v93[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v60 = self;
  id v8 = [(ACHTemplateSourceScheduler *)self serialQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = ACHLogAwardEngine();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "[#mc] _queue_runTemplateSources", buf, 2u);
  }

  id v10 = objc_alloc(MEMORY[0x263EFFA40]);
  v57 = (void *)[v10 initWithSuiteName:*MEMORY[0x263F23588]];
  int v11 = [v57 BOOLForKey:*MEMORY[0x263F23458]];
  int v12 = [v57 BOOLForKey:*MEMORY[0x263F23450]];
  v61 = [(ACHTemplateSourceScheduler *)v60 _currentDate];
  *(void *)buf = 0;
  long long v75 = buf;
  uint64_t v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__33;
  uint64_t v78 = __Block_byref_object_dispose__33;
  id v79 = objc_alloc_init(MEMORY[0x263EFF980]);
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__33;
  v72[4] = __Block_byref_object_dispose__33;
  id v73 = 0;
  id v13 = v7;
  long long v56 = v13;
  if (((!v5 | v11 | v12) & 1) == 0)
  {
    uint64_t v14 = [(ACHTemplateSourceScheduler *)v60 gregorianCalendar];
    uint64_t v15 = [(ACHTemplateSourceScheduler *)v60 _runnableSourcesInSources:v56 forDate:v61 calendar:v14];

    id v13 = (id)v15;
  }
  long long v55 = v13;
  if (![v13 count])
  {
    v30 = 0;
    goto LABEL_41;
  }
  id v16 = [(ACHTemplateSourceScheduler *)v60 profile];
  id v17 = [v16 database];
  id v71 = 0;
  long long v54 = +[ACHDatabaseAssertion assertionWithDatabase:v17 identifier:@"ACHTemplateSourceSchedulerDatabaseAssertion" timeout:&v71 error:20.0];
  id v52 = v71;

  if (v54)
  {
    uint64_t v18 = ACHLogAwardEngine();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[ACHTemplateSourceScheduler _queue_daemon_runTemplateSources:requiringRunnableForDate:error:]();
    }

    goto LABEL_10;
  }
  uint64_t v31 = ACHLogAwardEngine();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v87) = 138543362;
    *(void *)((char *)&v87 + 4) = v52;
    _os_log_impl(&dword_21F5DA000, v31, OS_LOG_TYPE_DEFAULT, "Failed to get accessibility assertion with error %{public}@; deferring template source scheduling",
      (uint8_t *)&v87,
      0xCu);
  }

  if (!a5)
  {
LABEL_10:
    *(void *)&long long v87 = 0;
    *((void *)&v87 + 1) = &v87;
    uint64_t v88 = 0x3032000000;
    v89 = __Block_byref_object_copy__33;
    uint64_t v90 = __Block_byref_object_dispose__33;
    ACHDatabaseContextWithAccessibilityAssertion(v54);
    id v91 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = ACHLogDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v85 = 138412290;
      v86 = v55;
      _os_log_impl(&dword_21F5DA000, v19, OS_LOG_TYPE_DEFAULT, "Running template sourcing for these sources: %@", v85, 0xCu);
    }

    group = dispatch_group_create();
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = v55;
    uint64_t v20 = [obj countByEnumeratingWithState:&v67 objects:v84 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v68;
      id v22 = (void *)MEMORY[0x263EFFA78];
      do
      {
        uint64_t v23 = 0;
        uint64_t v24 = v22;
        do
        {
          if (*(void *)v68 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void **)(*((void *)&v67 + 1) + 8 * v23);
          v62[0] = MEMORY[0x263EF8330];
          v62[1] = 3221225472;
          v62[2] = __94__ACHTemplateSourceScheduler__queue_daemon_runTemplateSources_requiringRunnableForDate_error___block_invoke;
          v62[3] = &unk_264518858;
          v62[4] = v25;
          v62[5] = v60;
          uint64_t v64 = buf;
          id v65 = v72;
          v66 = &v87;
          v26 = group;
          uint64_t v63 = v26;
          uint64_t v27 = (void *)MEMORY[0x223C507A0](v62);
          dispatch_group_enter(v26);
          if (objc_opt_respondsToSelector()) {
            [v25 templatesForDate:v61 databaseContext:*(void *)(*((void *)&v87 + 1) + 40) completion:v27];
          }
          else {
            [v25 templatesForDate:v61 completion:v27];
          }
          BOOL v28 = [v25 identifier];
          uint64_t v82 = v28;
          v83 = v61;
          dispatch_time_t v29 = [NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          id v22 = objc_msgSend(v24, "hk_dictionaryByAddingEntriesFromDictionary:", v29);

          ++v23;
          uint64_t v24 = v22;
        }
        while (v20 != v23);
        uint64_t v20 = [obj countByEnumeratingWithState:&v67 objects:v84 count:16];
      }
      while (v20);
    }
    else
    {
      id v22 = (void *)MEMORY[0x263EFFA78];
    }

    dispatch_time_t v39 = dispatch_time(0, 30000000000);
    if (dispatch_group_wait(group, v39))
    {
      id v40 = ACHLogTemplates();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[ACHTemplateSourceScheduler _queue_client_runTemplateSources:requiringRunnableForDate:error:]();
      }

      v41 = (void *)MEMORY[0x263F087E8];
      uint64_t v80 = *MEMORY[0x263F08320];
      id v81 = @"Waited for dispatch group and reached timeout. Source scheduling appears to have failed.";
      uint64_t v42 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
      v30 = [v41 errorWithDomain:@"com.apple.ActivityAchievements" code:-1 userInfo:v42];

      [*((id *)v75 + 5) addObject:v30];
    }
    else
    {
      v30 = 0;
    }
    [v54 invalidate];

    id v43 = *(void **)(*((void *)&v87 + 1) + 40);
    *(void *)(*((void *)&v87 + 1) + 40) = 0;

    v44 = [(ACHTemplateSourceScheduler *)v60 lastRunDateByTemplateSourceIdentifier];
    long long v45 = objc_msgSend(v44, "hk_dictionaryByAddingEntriesFromDictionary:", v22);
    [(ACHTemplateSourceScheduler *)v60 setLastRunDateByTemplateSourceIdentifier:v45];

    long long v46 = ACHLogTemplates();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      long long v47 = [(ACHTemplateSourceScheduler *)v60 lastRunDateByTemplateSourceIdentifier];
      *(_DWORD *)v85 = 138543362;
      v86 = v47;
      _os_log_impl(&dword_21F5DA000, v46, OS_LOG_TYPE_DEFAULT, "Updated last run dates for template sources to: %{public}@", v85, 0xCu);
    }
    uint64_t v48 = [*((id *)v75 + 5) count];
    uint64_t v49 = v48;
    if (a5 && v48)
    {
      *a5 = [*((id *)v75 + 5) firstObject];
    }

    _Block_object_dispose(&v87, 8);
    if (v49) {
      goto LABEL_40;
    }
LABEL_41:
    BOOL v50 = 1;
    goto LABEL_42;
  }
  id v32 = NSString;
  uint64_t v33 = [v52 localizedDescription];
  uint64_t v34 = [v32 stringWithFormat:@"Failed to get accessibility assertion with error %@ deferring template source scheduling", v33];

  uint64_t v35 = (void *)MEMORY[0x263F087E8];
  uint64_t v92 = *MEMORY[0x263F08320];
  v93[0] = v34;
  v36 = [NSDictionary dictionaryWithObjects:v93 forKeys:&v92 count:1];
  id v37 = [v35 errorWithDomain:@"com.apple.ActivityAchievements" code:-1 userInfo:v36];

  id v38 = v37;
  *a5 = v38;

  v30 = 0;
LABEL_40:
  BOOL v50 = 0;
LABEL_42:

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(buf, 8);

  return v50;
}

void __94__ACHTemplateSourceScheduler__queue_daemon_runTemplateSources_requiringRunnableForDate_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v9];
  }
  BOOL v50 = v9;
  long long v51 = v8;
  uint64_t v52 = a1;
  if (v8)
  {
    id v49 = v7;
    id v10 = ACHLogTemplates();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138543618;
      id v71 = v11;
      __int16 v72 = 2048;
      uint64_t v73 = [v8 count];
      _os_log_impl(&dword_21F5DA000, v10, OS_LOG_TYPE_DEFAULT, "Source %{public}@ returned %lu templates, removing from template store:", buf, 0x16u);
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v64 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          uint64_t v18 = ACHLogTemplates();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = [v17 uniqueName];
            *(_DWORD *)buf = 134218242;
            id v71 = v17;
            __int16 v72 = 2114;
            uint64_t v73 = (uint64_t)v19;
            _os_log_impl(&dword_21F5DA000, v18, OS_LOG_TYPE_DEFAULT, "%p: %{public}@", buf, 0x16u);
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v63 objects:v69 count:16];
      }
      while (v14);
    }

    uint64_t v20 = [*(id *)(a1 + 40) templateStore];
    uint64_t v21 = [v12 allObjects];
    uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v22 + 40);
    [v20 removeTemplates:v21 error:&obj];
    objc_storeStrong((id *)(v22 + 40), obj);

    id v7 = v49;
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v23 = ACHLogTemplates();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __94__ACHTemplateSourceScheduler__queue_daemon_runTemplateSources_requiringRunnableForDate_error___block_invoke_cold_2();
      }

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = 0;
    }
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v26 = v7;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v59 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void **)(*((void *)&v58 + 1) + 8 * j);
        id v32 = objc_msgSend(*(id *)(a1 + 32), "identifier", v49, v50);
        [v31 setSourceName:v32];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v28);
  }

  uint64_t v33 = ACHLogTemplates();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = [*(id *)(a1 + 32) identifier];
    uint64_t v35 = [v26 count];
    *(_DWORD *)buf = 138543618;
    id v71 = v34;
    __int16 v72 = 2048;
    uint64_t v73 = v35;
    _os_log_impl(&dword_21F5DA000, v33, OS_LOG_TYPE_DEFAULT, "Source %{public}@ returned %lu templates, writing to template store:", buf, 0x16u);
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v36 = v26;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v55;
    do
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(void *)v55 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = *(void **)(*((void *)&v54 + 1) + 8 * k);
        uint64_t v42 = ACHLogTemplates();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          id v43 = [v41 uniqueName];
          *(_DWORD *)buf = 134218242;
          id v71 = v41;
          __int16 v72 = 2114;
          uint64_t v73 = (uint64_t)v43;
          _os_log_impl(&dword_21F5DA000, v42, OS_LOG_TYPE_DEFAULT, "%p: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v38);
  }

  v44 = [*(id *)(v52 + 40) templateStore];
  long long v45 = [v36 allObjects];
  uint64_t v46 = *(void *)(*(void *)(*(void *)(v52 + 72) + 8) + 40);
  uint64_t v47 = *(void *)(*(void *)(v52 + 64) + 8);
  id v53 = *(id *)(v47 + 40);
  [v44 addTemplates:v45 databaseContext:v46 error:&v53];
  objc_storeStrong((id *)(v47 + 40), v53);

  if (*(void *)(*(void *)(*(void *)(v52 + 64) + 8) + 40))
  {
    uint64_t v48 = ACHLogTemplates();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      __94__ACHTemplateSourceScheduler__queue_daemon_runTemplateSources_requiringRunnableForDate_error___block_invoke_cold_1();
    }

    [*(id *)(*(void *)(*(void *)(v52 + 56) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(v52 + 64) + 8) + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(v52 + 48));
}

- (void)achievementStoreDidFinishInitialFetch:(id)a3
{
  [(ACHTemplateSourceScheduler *)self setAchievementStoreDidFinishInitialFetch:1];
  if ([(ACHTemplateSourceScheduler *)self shouldScheduleAfterInitialFetch]
    && [(ACHTemplateSourceScheduler *)self _isProtectedDataAvailable])
  {
    [(ACHTemplateSourceScheduler *)self _runAllTemplateSources];
  }
}

- (unint64_t)_sourceCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(ACHTemplateSourceScheduler *)self serialQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__ACHTemplateSourceScheduler__sourceCount__block_invoke;
  v6[3] = &unk_264516580;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __42__ACHTemplateSourceScheduler__sourceCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) templateSources];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (id)_currentDate
{
  id v2 = [(ACHTemplateSourceScheduler *)self currentDateOverride];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF910] date];
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)_runSynchronouslyWithError:(id *)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__33;
  uint64_t v13 = __Block_byref_object_dispose__33;
  id v14 = 0;
  BOOL v5 = [(ACHTemplateSourceScheduler *)self serialQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__ACHTemplateSourceScheduler__runSynchronouslyWithError___block_invoke;
  v8[3] = &unk_264516620;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  if (a3) {
    *a3 = (id) v10[5];
  }
  BOOL v6 = v10[5] == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __57__ACHTemplateSourceScheduler__runSynchronouslyWithError___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 templateSources];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_queue_runTemplateSources:requiringRunnableForDate:error:", v3, 1, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
}

- (ACHAwardsClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (ACHDatabaseAssertionClient)assertionClient
{
  return self->_assertionClient;
}

- (void)setAssertionClient:(id)a3
{
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (ACHTemplateStore)templateStore
{
  return self->_templateStore;
}

- (void)setTemplateStore:(id)a3
{
}

- (ACHAchievementStoring)achievementStore
{
  return self->_achievementStore;
}

- (void)setAchievementStore:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (BOOL)initialRunComplete
{
  return self->_initialRunComplete;
}

- (void)setInitialRunComplete:(BOOL)a3
{
  self->_initialRunComplete = a3;
}

- (NSMutableSet)templateSources
{
  return self->_templateSources;
}

- (void)setTemplateSources:(id)a3
{
}

- (NSDictionary)lastRunDateByTemplateSourceIdentifier
{
  return self->_lastRunDateByTemplateSourceIdentifier;
}

- (void)setLastRunDateByTemplateSourceIdentifier:(id)a3
{
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void)setGregorianCalendar:(id)a3
{
}

- (BOOL)achievementStoreDidFinishInitialFetch
{
  return self->_achievementStoreDidFinishInitialFetch;
}

- (void)setAchievementStoreDidFinishInitialFetch:(BOOL)a3
{
  self->_achievementStoreDidFinishInitialFetch = a3;
}

- (BOOL)shouldScheduleAfterInitialFetch
{
  return self->_shouldScheduleAfterInitialFetch;
}

- (void)setShouldScheduleAfterInitialFetch:(BOOL)a3
{
  self->_shouldScheduleAfterInitialFetch = a3;
}

- (int)protectedDataToken
{
  return self->_protectedDataToken;
}

- (void)setProtectedDataToken:(int)a3
{
  self->_protectedDataToken = a3;
}

- (NSDate)currentDateOverride
{
  return self->_currentDateOverride;
}

- (void)setCurrentDateOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_lastRunDateByTemplateSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_templateSources, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_achievementStore, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_assertionClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

void __53__ACHTemplateSourceScheduler_registerTemplateSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Template Source scheduler not adding template source %{public}@ because it does not conform to template source protocol", v2, v3, v4, v5, v6);
}

void __55__ACHTemplateSourceScheduler_deregisterTemplateSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Template Source scheduler not removing template source %{public}@ because it was not previously registered", v2, v3, v4, v5, v6);
}

void __55__ACHTemplateSourceScheduler_deregisterTemplateSource___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Template Source scheduler not removing template source %{public}@ because it does not conform to template source protocol", v2, v3, v4, v5, v6);
}

void __62__ACHTemplateSourceScheduler_runImmediatelyForTemplateSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_6(&dword_21F5DA000, v0, v1, "Template Source scheduler couldn't find a matching registered source, not running", v2, v3, v4, v5, v6);
}

- (void)_queue_client_runTemplateSources:requiringRunnableForDate:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_6(&dword_21F5DA000, v0, v1, "Waited for dispatch group and reached timeout. Source scheduling appears to have failed.", v2, v3, v4, v5, v6);
}

- (void)_queue_daemon_runTemplateSources:requiringRunnableForDate:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_21F5DA000, v0, OS_LOG_TYPE_DEBUG, "Template source scheduler acquired assertion. Excellent.", v1, 2u);
}

void __94__ACHTemplateSourceScheduler__queue_daemon_runTemplateSources_requiringRunnableForDate_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error storing templates: %@", v2, v3, v4, v5, v6);
}

void __94__ACHTemplateSourceScheduler__queue_daemon_runTemplateSources_requiringRunnableForDate_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error removing templates: %@", v2, v3, v4, v5, v6);
}

@end