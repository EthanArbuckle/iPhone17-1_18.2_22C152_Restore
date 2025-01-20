@interface FPDSharedScheduler
+ (BOOL)disableDelayedUnregistration;
+ (OS_dispatch_queue)queue;
+ (id)schedulerWithLabel:(id)a3;
+ (void)checkIn;
+ (void)setDisableDelayedUnregistration:(BOOL)a3;
- (BOOL)canOrIsForcedToRunCheckingDeferral:(BOOL)a3 reason:(id *)a4;
- (BOOL)canRunCheckingDeferral:(BOOL)a3 reason:(id *)a4;
- (BOOL)hasRegisteredExecutors;
- (BOOL)isRegistered;
- (BOOL)isRunning;
- (BOOL)preventRunning;
- (BOOL)runIfPossible:(id)a3;
- (BOOL)shouldPause;
- (BOOL)useManualScheduling;
- (FPDSharedScheduler)initWithLabel:(id)a3 criteria:(id)a4;
- (FPDSharedScheduler)initWithLabel:(id)a3 criteriaBuilder:(id)a4;
- (FPDSharedScheduler)initWithLabel:(id)a3 options:(int64_t)a4 criteria:(id)a5;
- (FPDSharedScheduler)initWithLabel:(id)a3 options:(int64_t)a4 criteriaBuilder:(id)a5;
- (NSDate)lastDeferralDate;
- (NSDate)lastRegistrationDate;
- (NSDate)lastTriggerDate;
- (NSDate)lastUsageDate;
- (NSString)label;
- (id)description;
- (id)forceRunningWithReason:(id)a3;
- (int64_t)_contextForActivity:(id)a3;
- (int64_t)dasContext;
- (int64_t)registrationCount;
- (void)addWatcher:(id)a3;
- (void)cancelDelayedUnregistration;
- (void)checkIn;
- (void)completeActivityWithState:(int64_t)a3;
- (void)defer;
- (void)markWatcherDone:(id)a3;
- (void)notifyCanRun;
- (void)notifyIsDeferred;
- (void)registerActivity;
- (void)registerActivityIfNeeded;
- (void)removeWatcher:(id)a3;
- (void)setManualScheduling:(BOOL)a3;
- (void)setPreventRunning:(BOOL)a3;
- (void)unregisterActivityImmediately;
- (void)unregisterActivityWithDelay;
- (void)unregisterActivityWithDelayIfNeeded;
- (void)withReevaluationOfSchedulingState:(id)a3;
@end

@implementation FPDSharedScheduler

- (id)forceRunningWithReason:(id)a3
{
  id v5 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__28;
  v18 = __Block_byref_object_dispose__29;
  id v19 = 0;
  v6 = +[FPDSharedScheduler queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__FPDSharedScheduler_forceRunningWithReason___block_invoke;
  v10[3] = &unk_1E6A74910;
  v10[4] = self;
  id v11 = v5;
  v12 = &v14;
  SEL v13 = a2;
  id v7 = v5;
  dispatch_sync(v6, v10);

  v8 = (void *)MEMORY[0x1D9471EC0](v15[5]);
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __36__FPDSharedScheduler_removeWatcher___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40);
      id v5 = [*(id *)(a1 + 40) watcherLabel];
      v6 = objc_msgSend(v5, "fp_obfuscatedProviderDomainID");
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543874;
      uint64_t v9 = v4;
      __int16 v10 = 2114;
      id v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1D744C000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: watcher unregistered for %{public}@[%p]", (uint8_t *)&v8, 0x20u);
    }
  }
  [*(id *)(a1 + 32) unregisterActivityWithDelayIfNeeded];
}

- (void)unregisterActivityWithDelayIfNeeded
{
  v3 = +[FPDSharedScheduler queue];
  dispatch_assert_queue_V2(v3);

  if (self->_registered)
  {
    uint64_t v4 = [(NSMapTable *)self->_watchers keyEnumerator];
    id v5 = [v4 nextObject];

    if (!v5)
    {
      [(FPDSharedScheduler *)self unregisterActivityWithDelay];
    }
  }
}

+ (OS_dispatch_queue)queue
{
  if (queue_onceToken != -1) {
    dispatch_once(&queue_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)queue_schedulerQueue;
  return (OS_dispatch_queue *)v2;
}

void __33__FPDSharedScheduler_addWatcher___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(a1 + 40)];

  if (!v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setObject:MEMORY[0x1E4F1CC28] forKey:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) cancelDelayedUnregistration];
    [*(id *)(a1 + 32) registerActivityIfNeeded];
    v3 = *(void **)(a1 + 32);
    id v16 = 0;
    int v4 = [v3 canOrIsForcedToRunCheckingDeferral:1 reason:&v16];
    id v5 = v16;
    v6 = fp_current_or_default_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 40);
        uint64_t v9 = [*(id *)(a1 + 40) watcherLabel];
        __int16 v10 = objc_msgSend(v9, "fp_obfuscatedProviderDomainID");
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v18 = v8;
        __int16 v19 = 2114;
        v20 = v10;
        __int16 v21 = 2048;
        uint64_t v22 = v11;
        _os_log_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: new watcher registered for %{public}@[%p] and called immediately", buf, 0x20u);
      }
      [*(id *)(a1 + 40) sharedSchedulerCanRun:*(void *)(a1 + 32)];
    }
    else
    {
      if (v7)
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 40);
        uint64_t v13 = [*(id *)(a1 + 40) watcherLabel];
        uint64_t v14 = objc_msgSend(v13, "fp_obfuscatedProviderDomainID");
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        uint64_t v18 = v12;
        __int16 v19 = 2114;
        v20 = v14;
        __int16 v21 = 2048;
        uint64_t v22 = v15;
        __int16 v23 = 2114;
        id v24 = v5;
        _os_log_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: new watcher registered for %{public}@[%p] and waiting: %{public}@", buf, 0x2Au);
      }
    }
  }
}

uint64_t __36__FPDSharedScheduler_runIfPossible___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) unregisterActivityWithDelayIfNeeded];
  uint64_t result = [*(id *)(a1 + 32) canOrIsForcedToRunCheckingDeferral:1 reason:0];
  if (result)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 104);
    *(void *)(v4 + 104) = v3;

    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)canOrIsForcedToRunCheckingDeferral:(BOOL)a3 reason:(id *)a4
{
  if (-[FPDSharedScheduler canRunCheckingDeferral:reason:](self, "canRunCheckingDeferral:reason:", a3))
  {
    BOOL preventRunning = self->_preventRunning;
    if (!a4 || !self->_preventRunning) {
      return !preventRunning;
    }
    *a4 = @"prevent running";
LABEL_6:
    BOOL preventRunning = self->_preventRunning;
    return !preventRunning;
  }
  if (self->_alwaysRunnableCount >= 1) {
    goto LABEL_6;
  }
  return 0;
}

- (BOOL)canRunCheckingDeferral:(BOOL)a3 reason:(id *)a4
{
  if (self->_unregistrationTimer)
  {
    if (a4)
    {
      BOOL result = 0;
      v6 = @"unregistration timer is running";
LABEL_4:
      *a4 = v6;
      return result;
    }
  }
  else
  {
    activity = self->_activity;
    if (activity)
    {
      if (!a3 || !xpc_activity_should_defer(activity)) {
        return 1;
      }
      if (a4) {
        *a4 = @"activity should be deferred";
      }
      [(FPDSharedScheduler *)self defer];
    }
    else if (a4)
    {
      BOOL result = 0;
      v6 = @"activity is not running";
      goto LABEL_4;
    }
  }
  return 0;
}

- (void)registerActivityIfNeeded
{
  uint64_t v3 = +[FPDSharedScheduler queue];
  dispatch_assert_queue_V2(v3);

  if (!self->_registered)
  {
    uint64_t v4 = [(NSMapTable *)self->_watchers keyEnumerator];
    id v5 = [v4 nextObject];

    if (v5)
    {
      [(FPDSharedScheduler *)self registerActivity];
    }
  }
}

- (void)cancelDelayedUnregistration
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[FPDSharedScheduler queue];
  dispatch_assert_queue_V2(v3);

  if (self->_unregistrationTimer)
  {
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      label = self->_label;
      int v7 = 138543362;
      uint64_t v8 = label;
      _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: canceling delayed unregistration", (uint8_t *)&v7, 0xCu);
    }

    dispatch_activate((dispatch_object_t)self->_unregistrationTimer);
    dispatch_source_cancel((dispatch_source_t)self->_unregistrationTimer);
    unregistrationTimer = self->_unregistrationTimer;
    self->_unregistrationTimer = 0;
  }
}

- (void)removeWatcher:(id)a3
{
  id v4 = a3;
  id v5 = +[FPDSharedScheduler queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__FPDSharedScheduler_removeWatcher___block_invoke;
  v7[3] = &unk_1E6A736C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addWatcher:(id)a3
{
  id v4 = a3;
  id v5 = +[FPDSharedScheduler queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__FPDSharedScheduler_addWatcher___block_invoke;
  v7[3] = &unk_1E6A736C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (BOOL)runIfPossible:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = +[FPDSharedScheduler queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__FPDSharedScheduler_runIfPossible___block_invoke;
  block[3] = &unk_1E6A748C0;
  block[4] = self;
  id v9 = v4;
  __int16 v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)unregisterActivityWithDelay
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[FPDSharedScheduler queue];
  dispatch_assert_queue_V2(v3);

  if (+[FPDSharedScheduler disableDelayedUnregistration]|| (self->_options & 2) != 0)
  {
    [(FPDSharedScheduler *)self unregisterActivityImmediately];
  }
  else if (!self->_unregistrationTimer)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      label = self->_label;
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = label;
      _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: delaying unregistration", buf, 0xCu);
    }

    id v6 = +[FPDSharedScheduler queue];
    int v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v6);

    dispatch_time_t v8 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __49__FPDSharedScheduler_unregisterActivityWithDelay__block_invoke;
    handler[3] = &unk_1E6A73FE8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_activate(v7);
    unregistrationTimer = self->_unregistrationTimer;
    self->_unregistrationTimer = (OS_dispatch_source *)v7;
    __int16 v10 = v7;
  }
}

+ (BOOL)disableDelayedUnregistration
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  char v3 = disableDelayedUnregistrationStorage;
  objc_sync_exit(v2);

  return v3;
}

void __45__FPDSharedScheduler_forceRunningWithReason___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v4;
    __int16 v17 = 2114;
    uint64_t v18 = v3;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_INFO, "[INFO] ⏱  %{public}@: force running for %{public}@", buf, 0x16u);
  }

  id v5 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_30;
  v15[3] = &unk_1E6A73FE8;
  v15[4] = v5;
  [v5 withReevaluationOfSchedulingState:v15];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_2;
  v11[3] = &unk_1E6A748E8;
  objc_copyWeak(v14, (id *)buf);
  id v6 = *(id *)(a1 + 40);
  v14[1] = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v7;
  uint64_t v8 = MEMORY[0x1D9471EC0](v11);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  __int16 v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

- (void)withReevaluationOfSchedulingState:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  BOOL v5 = [(FPDSharedScheduler *)self canOrIsForcedToRunCheckingDeferral:0 reason:0];
  v4[2](v4);

  BOOL v6 = [(FPDSharedScheduler *)self canOrIsForcedToRunCheckingDeferral:0 reason:0];
  if (v5 || !v6)
  {
    if (v5 && !v6)
    {
      [(FPDSharedScheduler *)self notifyIsDeferred];
    }
  }
  else
  {
    [(FPDSharedScheduler *)self notifyCanRun];
  }
}

uint64_t __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_30(uint64_t result)
{
  return result;
}

- (void)notifyCanRun
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[FPDSharedScheduler queue];
  dispatch_assert_queue_V2(v3);

  [(FPDSharedScheduler *)self unregisterActivityWithDelayIfNeeded];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_watchers;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if (!-[FPDSharedScheduler canOrIsForcedToRunCheckingDeferral:reason:](self, "canOrIsForcedToRunCheckingDeferral:reason:", 1, 0, (void)v11))break; {
      __int16 v10 = [(NSMapTable *)self->_watchers objectForKey:v9];
      }
      if (([v10 BOOLValue] & 1) == 0) {
        [v9 sharedSchedulerCanRun:self];
      }

      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)registerActivity
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_manualScheduling && ![(FPDSharedScheduler *)self isRegistered] && allowedToCheckIn == 1)
  {
    uint64_t v3 = self;
    objc_sync_enter(v3);
    v3->_registered = 1;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
    lastRegistrationDate = v3->_lastRegistrationDate;
    v3->_lastRegistrationDate = (NSDate *)v4;

    objc_sync_exit(v3);
    id location = 0;
    objc_initWeak(&location, v3);
    if (v3->_wasCheckedIn)
    {
      (*((void (**)(void))v3->_criteriaBuilder + 2))();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = fp_current_or_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        label = v3->_label;
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = label;
        uint64_t v9 = "[NOTICE] ⏱  %{public}@: registering xpc_activity";
LABEL_9:
        _os_log_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      }
    }
    else
    {
      id v6 = (id)*MEMORY[0x1E4F14158];
      uint64_t v7 = fp_current_or_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = v3->_label;
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = v10;
        uint64_t v9 = "[NOTICE] ⏱  %{public}@: checking-in xpc_activity";
        goto LABEL_9;
      }
    }

    ++v3->_registrationCount;
    long long v11 = [(NSString *)v3->_label UTF8String];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__FPDSharedScheduler_registerActivity__block_invoke;
    v12[3] = &unk_1E6A736E8;
    objc_copyWeak(&v13, &location);
    xpc_activity_register(v11, v6, v12);
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
  }
}

id __53__FPDSharedScheduler_initWithLabel_options_criteria___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)isRegistered
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL registered = v2->_registered;
  objc_sync_exit(v2);

  return registered;
}

void __27__FPDSharedScheduler_queue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.fileproviderd.background-scheduler", v2);
  v1 = (void *)queue_schedulerQueue;
  queue_schedulerQueue = (uint64_t)v0;
}

+ (void)setDisableDelayedUnregistration:(BOOL)a3
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  disableDelayedUnregistrationStorage = a3;
  objc_sync_exit(obj);
}

+ (void)checkIn
{
  v2 = +[FPDSharedScheduler queue];
  dispatch_sync(v2, &__block_literal_global_3);
}

void __29__FPDSharedScheduler_checkIn__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  allowedToCheckIn = 1;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  dispatch_queue_t v0 = schedulers();
  uint64_t v1 = [v0 countByEnumeratingWithState:&v5 objects:v9 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v6;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v6 != v3) {
          objc_enumerationMutation(v0);
        }
        objc_msgSend(*(id *)(*((void *)&v5 + 1) + 8 * v4++), "checkIn", (void)v5);
      }
      while (v2 != v4);
      uint64_t v2 = [v0 countByEnumeratingWithState:&v5 objects:v9 count:16];
    }
    while (v2);
  }
}

+ (id)schedulerWithLabel:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__4;
  uint64_t v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  uint64_t v4 = +[FPDSharedScheduler queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__FPDSharedScheduler_schedulerWithLabel___block_invoke;
  v8[3] = &unk_1E6A74870;
  id v9 = v3;
  uint64_t v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __41__FPDSharedScheduler_schedulerWithLabel___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = schedulers();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(id **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7[5], "isEqualToString:", *(void *)(a1 + 32), (void)v8))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (FPDSharedScheduler)initWithLabel:(id)a3 options:(int64_t)a4 criteriaBuilder:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)FPDSharedScheduler;
  long long v11 = [(FPDSharedScheduler *)&v23 init];
  long long v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_label, a3);
    uint64_t v13 = MEMORY[0x1D9471EC0](v10);
    id criteriaBuilder = v12->_criteriaBuilder;
    v12->_id criteriaBuilder = (id)v13;

    v12->_options = a4;
    v12->_BOOL registered = 0;
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:10];
    watchers = v12->_watchers;
    v12->_watchers = (NSMapTable *)v15;

    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.fileproviderd"];
    uint64_t v18 = [NSString stringWithFormat:@"bypass.%@", v9];
    if ([v17 BOOLForKey:v18]) {
      ++v12->_alwaysRunnableCount;
    }
    uint64_t v19 = +[FPDSharedScheduler queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__FPDSharedScheduler_initWithLabel_options_criteriaBuilder___block_invoke;
    block[3] = &unk_1E6A73FE8;
    uint64_t v22 = v12;
    dispatch_sync(v19, block);
  }
  return v12;
}

uint64_t __60__FPDSharedScheduler_initWithLabel_options_criteriaBuilder___block_invoke(uint64_t a1)
{
  uint64_t v2 = schedulers();
  [v2 addObject:*(void *)(a1 + 32)];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 registerActivity];
}

- (FPDSharedScheduler)initWithLabel:(id)a3 criteriaBuilder:(id)a4
{
  return [(FPDSharedScheduler *)self initWithLabel:a3 options:0 criteriaBuilder:a4];
}

- (FPDSharedScheduler)initWithLabel:(id)a3 options:(int64_t)a4 criteria:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__FPDSharedScheduler_initWithLabel_options_criteria___block_invoke;
  v12[3] = &unk_1E6A74898;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(FPDSharedScheduler *)self initWithLabel:a3 options:a4 criteriaBuilder:v12];

  return v10;
}

- (FPDSharedScheduler)initWithLabel:(id)a3 criteria:(id)a4
{
  return [(FPDSharedScheduler *)self initWithLabel:a3 options:0 criteria:a4];
}

- (BOOL)shouldPause
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = +[FPDSharedScheduler queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__FPDSharedScheduler_shouldPause__block_invoke;
  v5[3] = &unk_1E6A74870;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __33__FPDSharedScheduler_shouldPause__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) unregisterActivityWithDelayIfNeeded];
  uint64_t result = [*(id *)(a1 + 32) canOrIsForcedToRunCheckingDeferral:1 reason:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result ^ 1;
  return result;
}

- (void)markWatcherDone:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[FPDSharedScheduler queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__FPDSharedScheduler_markWatcherDone___block_invoke;
  v7[3] = &unk_1E6A736C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__FPDSharedScheduler_markWatcherDone___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(a1 + 40)];

  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setObject:MEMORY[0x1E4F1CC38] forKey:*(void *)(a1 + 40)];
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 48) keyEnumerator];
    id v4 = [v3 allObjects];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * v9)];
        int v11 = [v10 BOOLValue];

        if (!v11) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v31 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      long long v12 = fp_current_or_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v13;
        _os_log_impl(&dword_1D744C000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: all watchers done", buf, 0xCu);
      }

      [*(id *)(a1 + 32) completeActivityWithState:5];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v14 = v5;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v21;
        uint64_t v18 = MEMORY[0x1E4F1CC28];
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v21 != v17) {
              objc_enumerationMutation(v14);
            }
            objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setObject:forKey:", v18, *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
          }
          while (v16 != v19);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
        }
        while (v16);
      }
    }
  }
}

- (void)checkIn
{
  if (allowedToCheckIn == 1 && !self->_wasCheckedIn) {
    [(FPDSharedScheduler *)self registerActivity];
  }
}

- (void)notifyIsDeferred
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[FPDSharedScheduler queue];
  dispatch_assert_queue_V2(v3);

  [(FPDSharedScheduler *)self unregisterActivityWithDelayIfNeeded];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_watchers;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v10 = -[NSMapTable objectForKey:](self->_watchers, "objectForKey:", v9, (void)v11);
        if (([v10 BOOLValue] & 1) == 0) {
          [v9 sharedSchedulerIsDeferred:self];
        }
      }
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)completeActivityWithState:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_changeHandler)
  {
    xpc_activity_remove_eligibility_changed_handler();
    self->_changeHandler = 0;
  }
  if (self->_activity)
  {
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      label = self->_label;
      if ((unint64_t)a3 > 5) {
        uint64_t v7 = "<unknown>";
      }
      else {
        uint64_t v7 = off_1E6A74980[a3];
      }
      *(_DWORD *)buf = 138543618;
      id v10 = label;
      __int16 v11 = 2082;
      long long v12 = v7;
      _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: transitioning activity to %{public}s", buf, 0x16u);
    }

    xpc_activity_set_state(self->_activity, a3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__FPDSharedScheduler_completeActivityWithState___block_invoke;
    v8[3] = &unk_1E6A73FE8;
    void v8[4] = self;
    [(FPDSharedScheduler *)self withReevaluationOfSchedulingState:v8];
  }
}

void __48__FPDSharedScheduler_completeActivityWithState___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)defer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[FPDSharedScheduler queue];
  dispatch_assert_queue_V2(v3);

  activity = self->_activity;
  if (activity && xpc_activity_get_state(activity) != 3)
  {
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      label = self->_label;
      int v10 = 138543362;
      __int16 v11 = label;
      _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: deferring xpc_activity", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v7 = self;
    objc_sync_enter(v7);
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
    lastDeferralDate = v7->_lastDeferralDate;
    v7->_lastDeferralDate = (NSDate *)v8;

    objc_sync_exit(v7);
    [(FPDSharedScheduler *)v7 completeActivityWithState:3];
  }
}

void __38__FPDSharedScheduler_registerActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (xpc_activity_get_state((xpc_activity_t)v3))
  {
    if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
    {
      if (WeakRetained)
      {
        uint64_t v5 = fp_current_or_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = WeakRetained[5];
          *(_DWORD *)buf = 138543362;
          uint64_t v19 = v6;
          _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: xpc_activity called", buf, 0xCu);
        }

        uint64_t v7 = WeakRetained;
        objc_sync_enter(v7);
        uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
        uint64_t v9 = (void *)v7[12];
        v7[12] = v8;

        objc_sync_exit(v7);
        int v10 = +[FPDSharedScheduler queue];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __38__FPDSharedScheduler_registerActivity__block_invoke_25;
        v12[3] = &unk_1E6A736C0;
        uint64_t v13 = v7;
        id v14 = v3;
        dispatch_sync(v10, v12);
      }
      else
      {
        xpc_activity_set_state((xpc_activity_t)v3, 5);
      }
    }
  }
  else if (WeakRetained)
  {
    __int16 v11 = +[FPDSharedScheduler queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__FPDSharedScheduler_registerActivity__block_invoke_2;
    block[3] = &unk_1E6A736C0;
    uint64_t v16 = WeakRetained;
    id v17 = v3;
    dispatch_sync(v11, block);
  }
}

void __38__FPDSharedScheduler_registerActivity__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 122) = 1;
  xpc_object_t v2 = xpc_activity_copy_criteria(*(xpc_activity_t *)(a1 + 40));
  id v3 = [*(id *)(*(void *)(a1 + 32) + 48) keyEnumerator];
  id v4 = [v3 nextObject];

  if (v4)
  {
    if (v2)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v5 + 24))
      {
        uint64_t v6 = (*(void (**)(void))(*(void *)(v5 + 16) + 16))();
        if (!xpc_equal(v2, v6))
        {
          id v17 = fp_current_or_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 40);
            int v19 = 138543362;
            uint64_t v20 = v18;
            _os_log_impl(&dword_1D744C000, v17, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: xpc_activity update criteria at check in", (uint8_t *)&v19, 0xCu);
          }

          xpc_activity_set_criteria(*(xpc_activity_t *)(a1 + 40), v6);
        }
      }
      else
      {
        uint64_t v6 = fp_current_or_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40);
          int v19 = 138543362;
          uint64_t v20 = v7;
          _os_log_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: xpc_activity existing at check in", (uint8_t *)&v19, 0xCu);
        }
      }
      goto LABEL_20;
    }
    uint64_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 40);
      int v19 = 138543362;
      uint64_t v20 = v14;
      _os_log_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: xpc_activity creation at check in", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v15 = *(_xpc_activity_s **)(a1 + 40);
    uint64_t v16 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
    xpc_activity_set_criteria(v15, v16);
  }
  else
  {
    uint64_t v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 40);
      int v19 = 138543362;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: xpc_activity has no executors at check in", (uint8_t *)&v19, 0xCu);
    }

    int v10 = *(void **)(a1 + 32);
    if (v2)
    {
      uint64_t v6 = (*(void (**)(void))(v10[2] + 16))();
      BOOL v11 = xpc_equal(v2, v6);
      uint64_t v12 = *(void **)(a1 + 32);
      if (v11) {
        [v12 unregisterActivityWithDelay];
      }
      else {
        [v12 unregisterActivityImmediately];
      }
LABEL_20:

      goto LABEL_21;
    }
    [v10 unregisterActivityImmediately];
  }
LABEL_21:
}

void __38__FPDSharedScheduler_registerActivity__block_invoke_25(uint64_t a1)
{
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __38__FPDSharedScheduler_registerActivity__block_invoke_2_26;
  uint64_t v13 = &unk_1E6A744C8;
  id v14 = *(id *)(a1 + 32);
  *(void *)(*(void *)(a1 + 32) + 32) = xpc_activity_add_eligibility_changed_handler();
  xpc_object_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) keyEnumerator];
  id v3 = [v2 nextObject];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__FPDSharedScheduler_registerActivity__block_invoke_4;
    v7[3] = &unk_1E6A736C0;
    id v8 = v4;
    id v9 = *(id *)(a1 + 40);
    [v8 withReevaluationOfSchedulingState:v7];
    if ([*(id *)(a1 + 32) canRunCheckingDeferral:1 reason:0]) {
      xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 4);
    }
  }
  else
  {
    [v4 unregisterActivityWithDelay];
    if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 40)))
    {
      uint64_t v5 = *(_xpc_activity_s **)(a1 + 40);
      xpc_activity_state_t v6 = 3;
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
      uint64_t v5 = *(_xpc_activity_s **)(a1 + 40);
      xpc_activity_state_t v6 = 4;
    }
    xpc_activity_set_state(v5, v6);
  }
}

void __38__FPDSharedScheduler_registerActivity__block_invoke_2_26(uint64_t a1, xpc_activity_t activity)
{
  if (xpc_activity_should_defer(activity))
  {
    id v3 = +[FPDSharedScheduler queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__FPDSharedScheduler_registerActivity__block_invoke_3;
    block[3] = &unk_1E6A73FE8;
    id v5 = *(id *)(a1 + 32);
    dispatch_async(v3, block);
  }
}

uint64_t __38__FPDSharedScheduler_registerActivity__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) defer];
}

void __38__FPDSharedScheduler_registerActivity__block_invoke_4(uint64_t a1)
{
}

- (void)unregisterActivityImmediately
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = +[FPDSharedScheduler queue];
  dispatch_assert_queue_V2(v3);

  [(FPDSharedScheduler *)self completeActivityWithState:5];
  id v4 = self;
  objc_sync_enter(v4);
  LODWORD(v3) = v4->_registered;
  objc_sync_exit(v4);

  if (v3)
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      label = v4->_label;
      int v10 = 138543362;
      uint64_t v11 = label;
      _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: unregistering xpc_activity", (uint8_t *)&v10, 0xCu);
    }

    xpc_activity_unregister([(NSString *)v4->_label UTF8String]);
    [(FPDSharedScheduler *)v4 cancelDelayedUnregistration];
    uint64_t v7 = v4;
    objc_sync_enter(v7);
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
    lastUnregistrationDate = v7->_lastUnregistrationDate;
    v7->_lastUnregistrationDate = (NSDate *)v8;

    v4->_BOOL registered = 0;
    objc_sync_exit(v7);
  }
}

uint64_t __49__FPDSharedScheduler_unregisterActivityWithDelay__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterActivityImmediately];
}

void __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_2(uint64_t a1)
{
  xpc_object_t v2 = +[FPDSharedScheduler queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_3;
  v5[3] = &unk_1E6A748E8;
  objc_copyWeak(v8, (id *)(a1 + 48));
  id v3 = *(id *)(a1 + 32);
  v8[1] = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_sync(v2, v5);

  objc_destroyWeak(v8);
}

void __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = WeakRetained[5];
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v4;
      __int16 v12 = 2114;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1D744C000, v3, OS_LOG_TYPE_INFO, "[INFO] ⏱  %{public}@: stop force running for %{public}@", buf, 0x16u);
    }

    if ((uint64_t)WeakRetained[8] <= 0)
    {
      id v6 = [NSString stringWithFormat:@"[ASSERT] ‼️ over-released forceRunning"];
      uint64_t v7 = fp_current_or_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[FPDProcessMonitor _addPIDToObserve:]((uint64_t)v6, v7);
      }

      __assert_rtn("-[FPDSharedScheduler forceRunningWithReason:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDSharedScheduler.m", 628, (const char *)[v6 UTF8String]);
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_2_35;
    v8[3] = &unk_1E6A73FE8;
    id v9 = WeakRetained;
    [v9 withReevaluationOfSchedulingState:v8];
  }
}

uint64_t __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_2_35(uint64_t result)
{
  return result;
}

- (BOOL)preventRunning
{
  return self->_preventRunning;
}

- (void)setPreventRunning:(BOOL)a3
{
  uint64_t v5 = +[FPDSharedScheduler queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__FPDSharedScheduler_setPreventRunning___block_invoke;
  v6[3] = &unk_1E6A74938;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_sync(v5, v6);
}

unsigned __int8 *__40__FPDSharedScheduler_setPreventRunning___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t result = *(unsigned __int8 **)(a1 + 32);
  if (v1 != result[120])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __40__FPDSharedScheduler_setPreventRunning___block_invoke_2;
    v3[3] = &unk_1E6A74938;
    v3[4] = result;
    char v4 = v1;
    return (unsigned __int8 *)[result withReevaluationOfSchedulingState:v3];
  }
  return result;
}

uint64_t __40__FPDSharedScheduler_setPreventRunning___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 120) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)useManualScheduling
{
  return self->_manualScheduling;
}

- (void)setManualScheduling:(BOOL)a3
{
  uint64_t v5 = +[FPDSharedScheduler queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__FPDSharedScheduler_setManualScheduling___block_invoke;
  v6[3] = &unk_1E6A74938;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_sync(v5, v6);
}

void __42__FPDSharedScheduler_setManualScheduling___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 121))
  {
    *(unsigned char *)(v2 + 121) = v1;
    int v4 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v5 = *(id **)(a1 + 32);
    if (v4)
    {
      [v5 unregisterActivityImmediately];
    }
    else
    {
      id v6 = [v5[6] keyEnumerator];
      BOOL v7 = [v6 nextObject];

      if (v7)
      {
        uint64_t v8 = *(void **)(a1 + 32);
        [v8 registerActivity];
      }
    }
  }
}

- (BOOL)hasRegisteredExecutors
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = +[FPDSharedScheduler queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__FPDSharedScheduler_hasRegisteredExecutors__block_invoke;
  v5[3] = &unk_1E6A74960;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __44__FPDSharedScheduler_hasRegisteredExecutors__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 48) keyEnumerator];
  uint64_t v2 = [v3 nextObject];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (NSString)label
{
  return self->_label;
}

- (id)description
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__4;
  uint64_t v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  id v12 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<l:%@", self->_label];
  id v3 = +[FPDSharedScheduler queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__FPDSharedScheduler_description__block_invoke;
  block[3] = &unk_1E6A74870;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(v3, block);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __33__FPDSharedScheduler_description__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 64);
  int v4 = *(unsigned __int8 *)(v2 + 120);
  if (v3 < 1)
  {
    if (v4) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:@" 🌑 "];
    }
  }
  else
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v4) {
      objc_msgSend(v5, "appendFormat:", @" 🌑 %d", v3);
    }
    else {
      objc_msgSend(v5, "appendFormat:", @" 🌕 %d", v3);
    }
  }
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6[1])
  {
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = @" ▶️ ";
  }
  else if (v6[9])
  {
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = @" ⏲️ ";
  }
  else
  {
    int v9 = [v6 isRegistered];
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v9) {
      uint64_t v8 = @" ⏳ ";
    }
    else {
      uint64_t v8 = @" 🛏 ";
    }
  }
  [v7 appendString:v8];
  id v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = v11[10];
  if (v12)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendFormat:@" registration:<from:%@ count:%d", v12, v11[16]];
    uint64_t v13 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v13 + 56))
    {
      uint64_t v14 = *(void *)(v13 + 88);
      if (v14)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendFormat:@" to:%@", v14];
        uint64_t v13 = *(void *)(a1 + 32);
      }
    }
    if (*(void *)(v13 + 72)) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:@" to:<pending>"];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:@">"];
    uint64_t v11 = *(void **)(a1 + 32);
  }
  uint64_t v15 = v11[12];
  if (v15)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendFormat:@" trigger:<from:%@", v15];
    uint64_t v16 = *(void *)(a1 + 32);
    if (!*(void *)(v16 + 8))
    {
      uint64_t v17 = *(void *)(v16 + 112);
      if (v17) {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendFormat:@" to:%@", v17];
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:@">"];
  }
  objc_sync_exit(v10);

  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void *)(v18 + 104);
  if (v19)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendFormat:@" usage:%@", v19];
    uint64_t v20 = a1;
    uint64_t v18 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v20 = a1;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = *(id *)(v18 + 48);
  uint64_t v21 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v33;
    char v23 = 1;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obj);
        }
        long long v25 = *(void **)(*(void *)(*(void *)(v20 + 40) + 8) + 40);
        long long v26 = [*(id *)(*((void *)&v32 + 1) + 8 * v24) watcherLabel];
        uint64_t v27 = objc_msgSend(v26, "fp_obfuscatedProviderDomainID");
        v28 = (void *)v27;
        if (v23) {
          v29 = @" watchers=%@";
        }
        else {
          v29 = @",%@";
        }
        objc_msgSend(v25, "appendFormat:", v29, v27);

        char v23 = 0;
        ++v24;
      }
      while (v21 != v24);
      uint64_t v21 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      char v23 = 0;
    }
    while (v21);
  }

  return [*(id *)(*(void *)(*(void *)(v20 + 40) + 8) + 40) appendString:@">"];
}

- (BOOL)isRunning
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_activity != 0;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)lastRegistrationDate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_lastRegistrationDate;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)lastTriggerDate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_lastTriggerDate;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)lastUsageDate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_lastUsageDate;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)lastDeferralDate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_lastDeferralDate;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)_contextForActivity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 schedulingPriority];
  if (v4 == *MEMORY[0x1E4F5FB00])
  {
    uint64_t v5 = 1;
  }
  else if (v4 == *MEMORY[0x1E4F5FAF0])
  {
    uint64_t v5 = 2;
  }
  else if (v4 == *MEMORY[0x1E4F5FB30])
  {
    uint64_t v5 = 4;
  }
  else if (v4 == *MEMORY[0x1E4F5FAF8])
  {
    uint64_t v5 = 8;
  }
  else if (v4 == *MEMORY[0x1E4F5FB10])
  {
    uint64_t v5 = 16;
  }
  else
  {
    uint64_t v5 = 32 * (v4 == *MEMORY[0x1E4F5FB20]);
  }
  if ([v3 delayedStart]) {
    v5 |= 0x40uLL;
  }
  if ([v3 cancelAfterDeadline]) {
    v5 |= 0x80uLL;
  }
  if ([v3 requiresNetwork]) {
    v5 |= 0x100uLL;
  }
  if ([v3 isUpload]) {
    v5 |= 0x200uLL;
  }
  if ([v3 cpuIntensive]) {
    v5 |= 0x400uLL;
  }
  if ([v3 memoryIntensive]) {
    int64_t v6 = v5 | 0x800;
  }
  else {
    int64_t v6 = v5;
  }
  int v7 = [v3 preventDeviceSleep];

  if (v7) {
    return v6 | 0x1000;
  }
  else {
    return v6;
  }
}

- (int64_t)dasContext
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F5FA50] sharedScheduler];
  [v3 runningActivities];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int v9 = [v8 name];
        int v10 = [v9 containsString:self->_label];

        if (v10)
        {
          id v5 = v8;
          int v12 = 0;
          int64_t v11 = 0x2000;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  int64_t v11 = 0;
  int v12 = 1;
LABEL_11:

  uint64_t v13 = [v3 submittedActivities];
  uint64_t v14 = v13;
  if (v12)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = v13;
    int64_t v11 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v11)
    {
      char v23 = v14;
      uint64_t v24 = v3;
      uint64_t v16 = *(void *)v26;
      while (2)
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v15);
          }
          uint64_t v18 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          uint64_t v19 = objc_msgSend(v18, "name", v23, v24, (void)v25);
          int v20 = [v19 containsString:self->_label];

          if (v20)
          {
            id v21 = v18;

            int64_t v11 = 0x4000;
            id v5 = v21;
            goto LABEL_22;
          }
        }
        int64_t v11 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_22:
      uint64_t v14 = v23;
      id v3 = v24;
    }
  }
  if (v5) {
    v11 |= [(FPDSharedScheduler *)self _contextForActivity:v5];
  }

  return v11;
}

- (int64_t)registrationCount
{
  return self->_registrationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDeferralDate, 0);
  objc_storeStrong((id *)&self->_lastUsageDate, 0);
  objc_storeStrong((id *)&self->_lastTriggerDate, 0);
  objc_storeStrong((id *)&self->_lastUnregistrationDate, 0);
  objc_storeStrong((id *)&self->_lastRegistrationDate, 0);
  objc_storeStrong((id *)&self->_unregistrationTimer, 0);
  objc_storeStrong((id *)&self->_watchers, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_criteriaBuilder, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end