@interface EDClientResumer
+ (id)log;
+ (id)signpostLog;
- (EDClientResumer)initWithClientBundleIdentifier:(id)a3 hookRegistry:(id)a4 clientState:(id)a5;
- (unint64_t)signpostID;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)dealloc;
- (void)invalidate;
- (void)resumeForUpdates;
@end

@implementation EDClientResumer

- (EDClientResumer)initWithClientBundleIdentifier:(id)a3 hookRegistry:(id)a4 clientState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)EDClientResumer;
  v11 = [(EDClientResumer *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    bundleID = v11->_bundleID;
    v11->_bundleID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_clientState, a5);
    objc_storeStrong((id *)&v11->_hookRegistry, a4);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.maild.EDClientResumer", v14);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [MEMORY[0x1E4F60F28] dispatchQueueSchedulerWithQueue:v11->_queue];
    scheduler = v11->_scheduler;
    v11->_scheduler = (EFScheduler *)v17;

    EFRegisterContentProtectionObserver();
    [(EDPersistenceHookRegistry *)v11->_hookRegistry registerProtectedDataReconciliationHookResponder:v11];
  }

  return v11;
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__EDClientResumer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_21 != -1) {
    dispatch_once(&log_onceToken_21, block);
  }
  v2 = (void *)log_log_21;

  return v2;
}

void __22__EDClientResumer_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_21;
  log_log_21 = (uint64_t)v1;
}

+ (id)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__EDClientResumer_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken != -1) {
    dispatch_once(&signpostLog_onceToken, block);
  }
  v2 = (void *)signpostLog_log;

  return v2;
}

void __30__EDClientResumer_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)dealloc
{
  EFUnregisterContentProtectionObserver();
  v3.receiver = self;
  v3.super_class = (Class)EDClientResumer;
  [(EDClientResumer *)&v3 dealloc];
}

- (void)resumeForUpdates
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (([(EDClientStateReporting *)self->_clientState isForeground] & 1) != 0
    || [(EDClientStateReporting *)self->_clientState isRunningTests])
  {
    objc_super v3 = +[EDClientResumer log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      bundleID = self->_bundleID;
      *(_DWORD *)buf = 138543362;
      v18 = bundleID;
      v5 = "resumeForUpdates - Not Resuming client because device is either in foreground already or running PPT tests: %{public}@";
LABEL_5:
      _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
    }
  }
  else
  {
    char v6 = EFProtectedDataAvailable();
    objc_super v3 = +[EDClientResumer log];
    BOOL v7 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if ((v6 & 1) == 0)
    {
      if (!v7) {
        goto LABEL_12;
      }
      v13 = self->_bundleID;
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      v5 = "resumeForUpdates - Not Resuming client because device is locked: %{public}@";
      goto LABEL_5;
    }
    if (v7)
    {
      id v8 = self->_bundleID;
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "resumeForUpdates - Resuming client: %{public}@", buf, 0xCu);
    }

    id v9 = (void *)MEMORY[0x1E4F629C8];
    uint64_t v15 = *MEMORY[0x1E4F625F8];
    uint64_t v16 = MEMORY[0x1E4F1CC38];
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    objc_super v3 = [v9 optionsWithDictionary:v10];

    v11 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
    uint64_t v12 = self->_bundleID;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __35__EDClientResumer_resumeForUpdates__block_invoke;
    v14[3] = &unk_1E6C00928;
    v14[4] = self;
    [v11 openApplication:v12 withOptions:v3 completion:v14];
  }
LABEL_12:
}

void __35__EDClientResumer_resumeForUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    BOOL v7 = +[EDClientResumer log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Resumed process:%@", buf, 0xCu);
    }

    id v8 = *(void **)(*(void *)(a1 + 32) + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __35__EDClientResumer_resumeForUpdates__block_invoke_11;
    v13[3] = &unk_1E6BFFAF0;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    v14 = v9;
    uint64_t v15 = v10;
    [v8 performBlock:v13];
    v11 = v14;
  }
  else
  {
    v11 = +[EDClientResumer log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(v6, "ef_publicDescription");
      __35__EDClientResumer_resumeForUpdates__block_invoke_cold_1(v12, buf, v11);
    }
  }
}

void __35__EDClientResumer_resumeForUpdates__block_invoke_11(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4E280]), "initWithPID:flags:reason:name:", objc_msgSend(*(id *)(a1 + 32), "pid"), 35, 4, @"ClientResumeAssertion");
  objc_super v3 = +[EDClientResumer signpostLog];
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  if ([v2 acquire])
  {
    id v5 = +[EDClientResumer log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = @"ClientResumeAssertion";
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Acquired BKSProcessAssertion: %{public}@", buf, 0xCu);
    }

    id v6 = +[EDClientResumer signpostLog];
    BOOL v7 = v6;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      id v8 = *(__CFString **)(*(void *)(a1 + 40) + 8);
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v8;
      _os_signpost_emit_with_name_impl(&dword_1DB39C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v4, "BKSProcessAssertion", "Start BKSProcessAssertion for %{public}@", buf, 0xCu);
    }

    id v9 = *(void **)(*(void *)(a1 + 40) + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __35__EDClientResumer_resumeForUpdates__block_invoke_13;
    v13[3] = &unk_1E6C00900;
    id v10 = v2;
    uint64_t v11 = *(void *)(a1 + 40);
    id v14 = v10;
    uint64_t v15 = v11;
    os_signpost_id_t v16 = v4;
    id v12 = (id)[v9 afterDelay:v13 performBlock:5.0];
    [*(id *)(*(void *)(a1 + 40) + 16) invalidate];
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), v2);
  }
}

void __35__EDClientResumer_resumeForUpdates__block_invoke_13(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 40);
  objc_super v3 = *(void **)(v2 + 16);
  if (v3 == *(void **)(a1 + 32))
  {
    *(void *)(v2 + 16) = 0;
  }
  os_signpost_id_t v4 = +[EDClientResumer log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = @"ClientResumeAssertion";
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated BKSProcessAssertion: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = +[EDClientResumer signpostLog];
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    id v8 = *(__CFString **)(*(void *)(a1 + 40) + 8);
    int v9 = 138543362;
    id v10 = v8;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v6, OS_SIGNPOST_INTERVAL_END, v7, "BKSProcessAssertion", "End BKSProcessAssertion for %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[EDClientResumer log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    bundleID = self->_bundleID;
    int v5 = 138543362;
    id v6 = bundleID;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating EDobserverResumer:%{public}@", (uint8_t *)&v5, 0xCu);
  }

  EFUnregisterContentProtectionObserver();
  [(EDPersistenceHookRegistry *)self->_hookRegistry unregisterHookResponder:self];
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) <= 1 && self->_assertion != 0)
  {
    id v6 = +[EDClientResumer log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      int v9 = @"ClientResumeAssertion";
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Releasing BKSProcessAssertion as device is locking/locked: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    [(BKSProcessAssertion *)self->_assertion invalidate];
    assertion = self->_assertion;
    self->_assertion = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_assertion, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

void __35__EDClientResumer_resumeForUpdates__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Resumed process failed with error %{public}@", buf, 0xCu);
}

@end