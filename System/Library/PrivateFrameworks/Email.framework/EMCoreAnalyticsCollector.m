@interface EMCoreAnalyticsCollector
+ (id)log;
- (BOOL)registered;
- (EFLocked)periodicDataProviders;
- (EFScheduler)oneTimeScheduler;
- (EFScheduler)registrationScheduler;
- (EMCoreAnalyticsCollector)init;
- (id)registerForLogEventsWithPeriodicDataProvider:(id)a3;
- (void)_logPeriodicEvents;
- (void)_registerXPCActivity;
- (void)logOneTimeEvent:(id)a3;
- (void)setRegistered:(BOOL)a3;
@end

@implementation EMCoreAnalyticsCollector

uint64_t __44__EMCoreAnalyticsCollector_logOneTimeEvent___block_invoke_28(uint64_t a1)
{
  return [*(id *)(a1 + 32) data];
}

- (EMCoreAnalyticsCollector)init
{
  v12.receiver = self;
  v12.super_class = (Class)EMCoreAnalyticsCollector;
  v2 = [(EMCoreAnalyticsCollector *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = [v3 initWithObject:v4];
    periodicDataProviders = v2->_periodicDataProviders;
    v2->_periodicDataProviders = (EFLocked *)v5;

    uint64_t v7 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EMCoreAnalyticsCollector.oneTimeScheduler"];
    oneTimeScheduler = v2->_oneTimeScheduler;
    v2->_oneTimeScheduler = (EFScheduler *)v7;

    uint64_t v9 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EMCoreAnalyticsCollector.registrationScheduler"];
    registrationScheduler = v2->_registrationScheduler;
    v2->_registrationScheduler = (EFScheduler *)v9;
  }
  return v2;
}

- (void)logOneTimeEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EMCoreAnalyticsCollector *)self oneTimeScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__EMCoreAnalyticsCollector_logOneTimeEvent___block_invoke;
  v7[3] = &unk_1E63E26B0;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (EFScheduler)oneTimeScheduler
{
  return self->_oneTimeScheduler;
}

void __44__EMCoreAnalyticsCollector_logOneTimeEvent___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = +[EMCoreAnalyticsCollector log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) name];
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1BEFDB000, v2, OS_LOG_TYPE_INFO, "Logging one time event for provider %{public}@", buf, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) name];
  id v5 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__EMCoreAnalyticsCollector_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_9 != -1) {
    dispatch_once(&log_onceToken_9, block);
  }
  v2 = (void *)log_log_9;
  return v2;
}

void __31__EMCoreAnalyticsCollector_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_9;
  log_log_9 = (uint64_t)v1;
}

- (id)registerForLogEventsWithPeriodicDataProvider:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v4);
  id v5 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke;
  v16[3] = &unk_1E63E2F60;
  objc_copyWeak(&v17, &from);
  objc_copyWeak(&v18, &location);
  [v5 addCancelationBlock:v16];
  id v6 = [(EMCoreAnalyticsCollector *)self periodicDataProviders];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke_3;
  v12[3] = &unk_1E63E2F88;
  id v7 = v4;
  id v13 = v7;
  v14 = self;
  v15 = &v20;
  [v6 performWhileLocked:v12];

  if (*((unsigned char *)v21 + 24))
  {
    uint64_t v8 = [(EMCoreAnalyticsCollector *)self registrationScheduler];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke_4;
    v11[3] = &unk_1E63E26B0;
    v11[4] = self;
    id v9 = (id)[v8 afterDelay:v11 performBlock:5.0];
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  _Block_object_dispose(&v20, 8);
  objc_destroyWeak(&location);

  return v5;
}

void __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained periodicDataProviders];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke_2;
    v5[3] = &unk_1E63E2F38;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    [v4 performWhileLocked:v5];

    objc_destroyWeak(&v6);
  }
}

void __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "removeObject:");
}

uint64_t __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke_3(void *a1, void *a2)
{
  uint64_t result = [a2 addObject:a1[4]];
  uint64_t v4 = a1[5];
  if (!*(unsigned char *)(v4 + 8))
  {
    *(unsigned char *)(v4 + 8) = 1;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

uint64_t __73__EMCoreAnalyticsCollector_registerForLogEventsWithPeriodicDataProvider___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerXPCActivity];
}

- (void)_registerXPCActivity
{
  if (_registerXPCActivity_onceToken != -1) {
    dispatch_once(&_registerXPCActivity_onceToken, &__block_literal_global_7);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_3;
  v6[3] = &unk_1E63E2FF8;
  v6[4] = self;
  id v3 = (void *)MEMORY[0x1C18A2160](v6);
  uint64_t v4 = +[EMCoreAnalyticsCollector log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_INFO, "Registering Core Analytics Periodic Activity", v5, 2u);
  }

  ef_xpc_activity_register();
}

void __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1BEFDB000, "Mail CoreAnalytics Periodic Collector Activity", MEMORY[0x1E4F144F8], OS_ACTIVITY_FLAG_DEFAULT);
  os_log_t v1 = (void *)_registerXPCActivity_periodicCoreAnalayticsCollectorActivity;
  _registerXPCActivity_periodicCoreAnalayticsCollectorActivity = (uint64_t)v0;
}

void __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F14228]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14310], 1);
}

void __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _registerXPCActivity_periodicCoreAnalayticsCollectorActivity;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_4;
  v6[3] = &unk_1E63E2760;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  os_activity_apply(v4, v6);
}

void __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_4(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _logPeriodicEvents];
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    v2 = +[EMCoreAnalyticsCollector log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 40));
      __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_4_cold_1(v4, state, v2);
    }
  }
}

- (void)_logPeriodicEvents
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  v2 = [(EMCoreAnalyticsCollector *)self periodicDataProviders];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__EMCoreAnalyticsCollector__logPeriodicEvents__block_invoke;
  v16[3] = &unk_1E63E3020;
  void v16[4] = &v17;
  [v2 performWhileLocked:v16];

  id v3 = +[EMCoreAnalyticsCollector log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(id)v18[5] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v25 = v4;
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "Logging periodic events for providers: %ld", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)v18[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) coreAnalyticsPeriodicEvent];
        v10 = [v9 name];
        id v11 = v9;
        AnalyticsSendEventLazy();
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v23 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v17, 8);
}

void __46__EMCoreAnalyticsCollector__logPeriodicEvents__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __46__EMCoreAnalyticsCollector__logPeriodicEvents__block_invoke_33(uint64_t a1)
{
  return [*(id *)(a1 + 32) data];
}

- (EFLocked)periodicDataProviders
{
  return self->_periodicDataProviders;
}

- (EFScheduler)registrationScheduler
{
  return self->_registrationScheduler;
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationScheduler, 0);
  objc_storeStrong((id *)&self->_oneTimeScheduler, 0);
  objc_storeStrong((id *)&self->_periodicDataProviders, 0);
}

void __48__EMCoreAnalyticsCollector__registerXPCActivity__block_invoke_4_cold_1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 5;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Failed to transition from state %ld to state %d.", buf, 0x12u);
}

@end