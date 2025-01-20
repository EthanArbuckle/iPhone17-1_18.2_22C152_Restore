@interface AMSEngagement
+ (NSNotificationCenter)notificationCenter;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (OS_dispatch_queue)_engagementQueue;
+ (OS_dispatch_queue)_notifyQueue;
+ (double)_enqueueTimeout;
+ (id)_connection;
+ (id)createBagForSubProfile;
+ (void)_recordLoggingEventWithBag:(id)a3 enqueueData:(id)a4 eventType:(id)a5 userInfo:(id)a6 destinations:(id)a7 error:(id)a8;
- (AMSBagProtocol)bag;
- (AMSEngagement)init;
- (AMSEngagement)initWithBag:(id)a3;
- (AMSEngagementConnection)connection;
- (AMSEngagementMessageCache)cacheInfo;
- (NSMapTable)observerInfo;
- (NSMutableSet)runningPromises;
- (id)_createCombinedLogKey;
- (id)_enqueue:(id)a3;
- (id)_enqueueWithContext:(id)a3;
- (id)_parseActions:(id)a3;
- (id)contentInfoForApp:(id)a3 cacheKey:(id)a4 version:(id)a5;
- (id)enqueueData:(id)a3;
- (id)enqueueEvent:(id)a3;
- (id)enqueueMessageEvent:(id)a3;
- (id)fetchMetricsIdentifiers;
- (id)manualSyncMetricsIdentifiers;
- (id)sync;
- (id)syncDestinations:(id)a3;
- (id)syncMetricsIdentifiers;
- (id)syncWithRequest:(id)a3;
- (id)treatmentStoreService;
- (void)_connectionErrorNotification;
- (void)_failAllRunningPromisesWithError:(id)a3;
- (void)_handleServiceResponse:(id)a3;
- (void)_manageRunningPromise:(id)a3;
- (void)_observeNotifications;
- (void)_pushEventReceived:(id)a3;
- (void)_removeRunningPromise:(id)a3;
- (void)_scheduleSyncIfNeeded:(id)a3;
- (void)addCachePolicy:(int64_t)a3 forPlacements:(id)a4 serviceType:(id)a5;
- (void)addObserver:(id)a3 placement:(id)a4 serviceType:(id)a5;
- (void)addObserver:(id)a3 placement:(id)a4 serviceType:(id)a5 queue:(id)a6;
- (void)addObserver:(id)a3 placements:(id)a4 serviceType:(id)a5;
- (void)addObserver:(id)a3 placements:(id)a4 serviceType:(id)a5 queue:(id)a6;
- (void)dealloc;
- (void)handleDialogResult:(id)a3;
- (void)handlePushEvent:(id)a3;
- (void)removeObserver:(id)a3 placement:(id)a4 serviceType:(id)a5;
- (void)setBag:(id)a3;
- (void)setConnection:(id)a3;
- (void)setObserverInfo:(id)a3;
- (void)setRunningPromises:(id)a3;
@end

@implementation AMSEngagement

uint64_t __26__AMSEngagement__enqueue___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = [a2 identifier];
  uint64_t v5 = [v3 destination:v4 allowsEvent:*(void *)(a1 + 40)];

  return v5;
}

void __39__AMSEngagement__manageRunningPromise___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeRunningPromise:v2];
}

- (void)_removeRunningPromise:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() _engagementQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__AMSEngagement__removeRunningPromise___block_invoke;
  v10[3] = &unk_1E559F1E0;
  v10[4] = self;
  id v11 = v4;
  v6 = v10;
  id v7 = v4;
  v8 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E559EAE0;
  id v13 = v8;
  id v14 = v6;
  id v9 = v8;
  dispatch_async(v5, block);
}

- (id)treatmentStoreService
{
  if (+[AMSDevice deviceIsAudioAccessory])
  {
    v3 = AMSError(12, @"Unavailable", @"The treatment store is unavailable on this device.", 0);
    id v4 = +[AMSPromise promiseWithError:v3];
  }
  else
  {
    uint64_t v5 = [[AMSMutablePromise alloc] initWithTimeout:5.0];
    [(AMSEngagement *)self _manageRunningPromise:v5];
    v6 = [(id)objc_opt_class() _engagementQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __38__AMSEngagement_treatmentStoreService__block_invoke;
    v13[3] = &unk_1E559F1E0;
    v13[4] = self;
    id v7 = v5;
    id v14 = v7;
    v8 = v13;
    id v9 = AMSLogKey();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_2;
    block[3] = &unk_1E559EAE0;
    id v16 = v9;
    id v17 = v8;
    id v10 = v9;
    dispatch_async(v6, block);

    id v11 = v14;
    id v4 = v7;
  }
  return v4;
}

- (void)_manageRunningPromise:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() _engagementQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__AMSEngagement__manageRunningPromise___block_invoke;
  v10[3] = &unk_1E559F1E0;
  v10[4] = self;
  id v11 = v4;
  v6 = v10;
  id v7 = v4;
  v8 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E559EAE0;
  id v13 = v8;
  id v14 = v6;
  id v9 = v8;
  dispatch_async(v5, block);
}

+ (OS_dispatch_queue)_engagementQueue
{
  if (qword_1EB38D830 != -1) {
    dispatch_once(&qword_1EB38D830, &__block_literal_global_161);
  }
  id v2 = (void *)qword_1EB38D838;
  return (OS_dispatch_queue *)v2;
}

void __39__AMSEngagement__manageRunningPromise___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 40);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __39__AMSEngagement__manageRunningPromise___block_invoke_2;
  id v7 = &unk_1E55A2400;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  [v2 addFinishBlock:&v4];
  v3 = objc_msgSend(*(id *)(a1 + 32), "runningPromises", v4, v5, v6, v7);
  [v3 addObject:*(void *)(a1 + 40)];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __39__AMSEngagement__removeRunningPromise___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) runningPromises];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) runningPromises];
    [v4 removeObject:*(void *)(a1 + 40)];
  }
}

- (NSMutableSet)runningPromises
{
  return self->_runningPromises;
}

void __37__AMSEngagement__enqueueWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  id v9 = AMSSetLogKey(*(void **)(a1 + 40));
  if (v6)
  {
    id v10 = +[AMSLogConfig sharedEngagementConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      id v14 = [*(id *)(a1 + 48) start];
      [v14 timeIntervalSinceNow];
      double v16 = v15;

      *(_DWORD *)v60 = 138544130;
      double v17 = -v16;
      if (v16 >= 0.0) {
        double v17 = v16;
      }
      *(void *)&v60[4] = v12;
      __int16 v61 = 2114;
      v62 = v13;
      __int16 v63 = 2048;
      double v64 = v17;
      __int16 v65 = 2114;
      v66 = v6;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Enqueue finished with error (%.3f) %{public}@", v60, 0x2Au);
    }
    v18 = +[AMSLogConfig sharedEngagementConfig];
    v19 = v18;
    if (!v18)
    {
      v19 = +[AMSLogConfig sharedConfig];
    }
    v20 = objc_msgSend(v19, "OSLogObject", *(void *)v60);
    BOOL v21 = os_signpost_enabled(v20);

    if (!v18) {
    if (v21)
    }
    {
      v22 = +[AMSLogConfig sharedEngagementConfig];
      v23 = v22;
      if (v22)
      {
        v24 = [v22 OSLogObject];
      }
      else
      {
        v44 = +[AMSLogConfig sharedConfig];
        v24 = [v44 OSLogObject];
      }
      uint64_t v45 = [*(id *)(a1 + 48) signpostID];
      if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v46 = v45;
        if (os_signpost_enabled(v24))
        {
          *(_DWORD *)v60 = 138543362;
          *(void *)&v60[4] = v6;
          _os_signpost_emit_with_name_impl(&dword_18D554000, v24, OS_SIGNPOST_EVENT, v46, "Engagement", "Enqueue finished with error %{public}@", v60, 0xCu);
        }
      }

      v47 = +[AMSLogConfig sharedEngagementConfig];
      v48 = v47;
      if (v47)
      {
        v49 = [v47 OSLogObject];
      }
      else
      {
        v50 = +[AMSLogConfig sharedConfig];
        v49 = [v50 OSLogObject];
      }
      uint64_t v51 = [*(id *)(a1 + 48) signpostID];
      if ((unint64_t)(v51 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v52 = v51;
        if (os_signpost_enabled(v49))
        {
          *(_WORD *)v60 = 0;
          _os_signpost_emit_with_name_impl(&dword_18D554000, v49, OS_SIGNPOST_INTERVAL_END, v52, "Engagement", "Error occured", v60, 2u);
        }
      }
    }
    uint64_t v53 = [(__CFString *)v6 userInfo];
    uint64_t v54 = *(void *)(*(void *)(a1 + 72) + 8);
    v55 = *(void **)(v54 + 40);
    *(void *)(v54 + 40) = v53;

    [*(id *)(a1 + 56) finishWithError:v6];
  }
  else
  {
    v25 = *(void **)(a1 + 32);
    v26 = [v5 actions];
    v27 = [v25 _parseActions:v26];

    [v5 setActions:v27];
    v28 = +[AMSLogConfig sharedEngagementConfig];
    if (!v28)
    {
      v28 = +[AMSLogConfig sharedConfig];
    }
    v29 = [v28 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = objc_opt_class();
      v31 = AMSLogKey();
      v32 = [*(id *)(a1 + 48) start];
      [v32 timeIntervalSinceNow];
      double v34 = v33;

      if (v34 < 0.0) {
        double v34 = -v34;
      }
      v35 = [v5 request];
      if (v35) {
        v36 = @"true";
      }
      else {
        v36 = @"false";
      }
      *(_DWORD *)v60 = 138544386;
      *(void *)&v60[4] = v30;
      __int16 v61 = 2114;
      v62 = v31;
      __int16 v63 = 2048;
      double v64 = v34;
      __int16 v65 = 2114;
      v66 = v36;
      __int16 v67 = 2048;
      uint64_t v68 = [v27 count];
      _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueue finished (%.3f) request: %{public}@, actions: %ld", v60, 0x34u);
    }
    v37 = +[AMSLogConfig sharedEngagementConfig];
    v38 = v37;
    if (!v37)
    {
      v38 = +[AMSLogConfig sharedConfig];
    }
    v39 = [v38 OSLogObject];
    BOOL v40 = os_signpost_enabled(v39);

    if (!v37) {
    if (v40)
    }
    {
      v41 = +[AMSLogConfig sharedEngagementConfig];
      v42 = v41;
      if (v41)
      {
        v43 = [v41 OSLogObject];
      }
      else
      {
        v56 = +[AMSLogConfig sharedConfig];
        v43 = [v56 OSLogObject];
      }
      uint64_t v57 = [*(id *)(a1 + 48) signpostID];
      if ((unint64_t)(v57 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v58 = v57;
        if (os_signpost_enabled(v43))
        {
          uint64_t v59 = [v27 count];
          *(_DWORD *)v60 = 134217984;
          *(void *)&v60[4] = v59;
          _os_signpost_emit_with_name_impl(&dword_18D554000, v43, OS_SIGNPOST_INTERVAL_END, v58, "Engagement", "Finished (actions: %ld)", v60, 0xCu);
        }
      }
    }
    [*(id *)(a1 + 56) finishWithResult:v5];
  }
}

- (id)_enqueueWithContext:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 signpostID])
  {
    id v5 = +[AMSLogConfig sharedEngagementConfig];
    v6 = v5;
    if (!v5)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    BOOL v8 = os_signpost_enabled(v7);

    if (!v5) {
    if (v8)
    }
    {
      id v9 = +[AMSLogConfig sharedEngagementConfig];
      id v10 = v9;
      if (!v9)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      id v11 = [v10 OSLogObject];
      objc_msgSend(v4, "setSignpostID:", os_signpost_id_make_with_pointer(v11, self));

      if (!v9) {
      uint64_t v12 = +[AMSLogConfig sharedEngagementConfig];
      }
      id v13 = v12;
      if (v12)
      {
        id v14 = [v12 OSLogObject];
      }
      else
      {
        double v15 = +[AMSLogConfig sharedConfig];
        id v14 = [v15 OSLogObject];
      }
      uint64_t v16 = [v4 signpostID];
      if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v17 = v16;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18D554000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Engagement", "Enqueuing request", buf, 2u);
        }
      }
    }
  }
  v18 = [v4 request];
  v19 = [v18 events];
  v20 = [v19 firstObject];

  if (v20)
  {
    BOOL v21 = [v20 objectForKeyedSubscript:@"eventType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }

    v25 = &stru_1EDCA7308;
    if (v22) {
      v25 = v22;
    }
    v26 = v25;

    v27 = +[AMSLogConfig sharedEngagementConfig];
    v28 = v27;
    if (!v27)
    {
      v28 = +[AMSLogConfig sharedConfig];
    }
    v29 = [v28 OSLogObject];
    BOOL v30 = os_signpost_enabled(v29);

    if (!v27) {
    if (v30)
    }
    {
      v31 = +[AMSLogConfig sharedEngagementConfig];
      v32 = v31;
      if (v31)
      {
        double v33 = [v31 OSLogObject];
      }
      else
      {
        double v34 = +[AMSLogConfig sharedConfig];
        double v33 = [v34 OSLogObject];
      }
      os_signpost_id_t v35 = [v4 signpostID];
      if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        v36 = [v4 request];
        v37 = [v36 destinations];
        v38 = [v37 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v38;
        _os_signpost_emit_with_name_impl(&dword_18D554000, v33, OS_SIGNPOST_EVENT, v35, "Engagement", "Enqueueing event for type: %{public}@, dest: [%{public}@]", buf, 0x16u);
      }
    }
    v39 = [v4 request];
    BOOL v40 = [v39 logKey];

    +[AMSEngagement _enqueueTimeout];
    v42 = [[AMSMutablePromise alloc] initWithTimeout:v41];
    [(AMSEngagement *)self _manageRunningPromise:v42];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    double v64 = __Block_byref_object_copy__27;
    __int16 v65 = __Block_byref_object_dispose__27;
    id v66 = [(AMSEngagement *)self connection];
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x3032000000;
    v61[3] = __Block_byref_object_copy__27;
    v61[4] = __Block_byref_object_dispose__27;
    id v62 = 0;
    v43 = *(void **)(*(void *)&buf[8] + 40);
    v44 = [v4 request];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __37__AMSEngagement__enqueueWithContext___block_invoke;
    v55[3] = &unk_1E55A22F8;
    v55[4] = self;
    uint64_t v59 = buf;
    id v45 = v40;
    id v56 = v45;
    id v46 = v4;
    id v57 = v46;
    v60 = v61;
    v47 = v42;
    os_signpost_id_t v58 = v47;
    [v43 enqueueWithRequest:v44 completion:v55];

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __37__AMSEngagement__enqueueWithContext___block_invoke_69;
    v50[3] = &unk_1E55A2320;
    v50[4] = self;
    id v51 = v20;
    v23 = v26;
    os_signpost_id_t v52 = v23;
    uint64_t v54 = v61;
    id v53 = v46;
    [(AMSPromise *)v47 addErrorBlock:v50];
    v48 = v53;
    v24 = v47;

    _Block_object_dispose(v61, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    AMSError(2, @"No events to enqueue", &stru_1EDCA7308, 0);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v24 = +[AMSPromise promiseWithError:v23];
  }

  return v24;
}

void __29__AMSEngagement_enqueueData___block_invoke(uint64_t a1)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v2 = AMSSetLogKey(0);
  int v3 = [MEMORY[0x1E4F1C9C8] now];
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"eventType"];
  objc_opt_class();
  id v5 = 0;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }

  v6 = &stru_1EDCA7308;
  if (v5) {
    v6 = v5;
  }
  v85 = v6;

  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"nativeHandling"];
  char v8 = [v7 BOOLValue];

  id v9 = +[AMSLogConfig sharedEngagementConfig];
  id v10 = v9;
  if (!v9)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  BOOL v12 = os_signpost_enabled(v11);

  if (!v9) {
  if (v12)
  }
  {
    id v13 = +[AMSLogConfig sharedEngagementConfig];
    id v14 = v13;
    if (!v13)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    double v15 = [v14 OSLogObject];
    os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, *(const void **)(a1 + 40));

    if (!v13) {
    os_signpost_id_t v17 = +[AMSLogConfig sharedEngagementConfig];
    }
    v18 = v17;
    if (v17)
    {
      v19 = [v17 OSLogObject];
    }
    else
    {
      v20 = +[AMSLogConfig sharedConfig];
      v19 = [v20 OSLogObject];
    }
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18D554000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Engagement", "Enqueuing data", buf, 2u);
    }
  }
  else
  {
    os_signpost_id_t v16 = 0;
  }
  if (_os_feature_enabled_impl())
  {
    BOOL v21 = 0;
  }
  else
  {
    BOOL v21 = +[AMSEngagementClientData loadFromDisk];
    [*(id *)(a1 + 40) _scheduleSyncIfNeeded:v21];
  }
  v22 = [v21 destinationsForEvent:*(void *)(a1 + 32)];
  if ((v8 & 1) != 0 || (_os_feature_enabled_impl() & 1) != 0 || [v22 count])
  {
    if (_os_feature_enabled_impl())
    {
      v23 = +[AMSEngagementCache sharedInstance];
      v24 = [v23 cachedResponseForEvent:*(void *)(a1 + 32)];

      if (v24)
      {
LABEL_30:
        v83 = v21;
        v25 = v22;
        v26 = +[AMSLogConfig sharedEngagementConfig];
        if (!v26)
        {
          v26 = +[AMSLogConfig sharedConfig];
        }
        v27 = v3;
        v28 = [v26 OSLogObject];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = objc_opt_class();
          BOOL v30 = AMSLogKey();
          [v27 timeIntervalSinceNow];
          *(_DWORD *)buf = 138544130;
          if (v31 < 0.0) {
            double v31 = -v31;
          }
          *(void *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2048;
          double v90 = v31;
          *(_WORD *)v91 = 2114;
          *(void *)&v91[2] = v85;
          _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Returned cached response (%.3f), type: %{public}@", buf, 0x2Au);
        }
        v32 = objc_alloc_init(AMSEngagementEnqueueResult);
        [(AMSEngagementEnqueueResult *)v32 setData:v24];
        [*(id *)(a1 + 48) finishWithResult:v32];
        double v33 = +[AMSLogConfig sharedEngagementConfig];
        double v34 = v33;
        if (!v33)
        {
          double v34 = +[AMSLogConfig sharedConfig];
        }
        os_signpost_id_t v35 = [v34 OSLogObject];
        BOOL v36 = os_signpost_enabled(v35);

        if (!v33) {
        if (!v36)
        }
        {
          int v3 = v27;
          v22 = v25;
          BOOL v21 = v83;
LABEL_64:

          goto LABEL_65;
        }
        v37 = +[AMSLogConfig sharedEngagementConfig];
        v38 = v37;
        if (v37)
        {
          v39 = [v37 OSLogObject];
        }
        else
        {
          uint64_t v54 = +[AMSLogConfig sharedConfig];
          v39 = [v54 OSLogObject];
        }
        os_signpost_id_t spid = v16;
        unint64_t v55 = v16 - 1;
        if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18D554000, v39, OS_SIGNPOST_EVENT, spid, "Engagement", "Returning cached response", buf, 2u);
        }

        id v56 = +[AMSLogConfig sharedEngagementConfig];
        id v57 = v56;
        int v3 = v27;
        if (v56)
        {
          v48 = [v56 OSLogObject];
        }
        else
        {
          os_signpost_id_t v58 = +[AMSLogConfig sharedConfig];
          v48 = [v58 OSLogObject];
        }
        v22 = v25;

        BOOL v21 = v83;
        if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&v48->super))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18D554000, &v48->super, OS_SIGNPOST_INTERVAL_END, spid, "Engagement", "Finished", buf, 2u);
        }
LABEL_63:

        goto LABEL_64;
      }
    }
    else
    {
      v24 = [v21 cachedResponseDataForEvent:*(void *)(a1 + 32)];
      if (v24) {
        goto LABEL_30;
      }
    }
    if (*(void *)(a1 + 56))
    {
      v32 = [NSString stringWithFormat:@"(prev: %@)", *(void *)(a1 + 56)];
    }
    else
    {
      v32 = (AMSEngagementEnqueueResult *)&stru_1EDCA7308;
    }
    v84 = v3;
    BOOL v40 = +[AMSLogConfig sharedEngagementConfig];
    if (!v40)
    {
      BOOL v40 = +[AMSLogConfig sharedConfig];
    }
    double v41 = [v40 OSLogObject];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = objc_opt_class();
      v43 = AMSLogKey();
      [v22 componentsJoinedByString:@","];
      os_signpost_id_t spida = (os_signpost_id_t)v24;
      v44 = v21;
      id v45 = v22;
      v47 = os_signpost_id_t v46 = v16;
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v43;
      *(_WORD *)&buf[22] = 2114;
      double v90 = *(double *)&v85;
      *(_WORD *)v91 = 2114;
      *(void *)&v91[2] = v47;
      *(_WORD *)&v91[10] = 2114;
      *(void *)&v91[12] = v32;
      _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing event for type: %{public}@, dest: [%{public}@] %{public}@", buf, 0x34u);

      os_signpost_id_t v16 = v46;
      v22 = v45;
      BOOL v21 = v44;
      v24 = (void *)spida;
    }
    v48 = objc_alloc_init(AMSEngagementEnqueueRequest);
    v49 = +[AMSProcessInfo currentProcess];
    [(AMSEngagementEnqueueRequest *)v48 setClientInfo:v49];

    uint64_t v88 = *(void *)(a1 + 32);
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
    [(AMSEngagementEnqueueRequest *)v48 setEvents:v50];

    id v51 = AMSLogKey();
    [(AMSEngagementEnqueueRequest *)v48 setLogKey:v51];

    +[AMSEngagement _enqueueTimeout];
    [(AMSEngagementEnqueueRequest *)v48 setTimeout:"setTimeout:"];
    [(AMSEngagementEnqueueRequest *)v48 setDestinations:v22];
    os_signpost_id_t v52 = objc_alloc_init(AMSEngagementEnqueueContext);
    int v3 = v84;
    [(AMSEngagementEnqueueContext *)v52 setStart:v84];
    [(AMSEngagementEnqueueContext *)v52 setSignpostID:v16];
    [(AMSEngagementEnqueueContext *)v52 setRequest:v48];
    id v53 = [*(id *)(a1 + 40) _enqueueWithContext:v52];
    [*(id *)(a1 + 48) finishWithPromise:v53];

    goto LABEL_63;
  }
  uint64_t v59 = +[AMSLogConfig sharedEngagementConfig];
  if (!v59)
  {
    uint64_t v59 = +[AMSLogConfig sharedConfig];
  }
  v60 = [v59 OSLogObject];
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v61 = objc_opt_class();
    AMSLogKey();
    __int16 v63 = v62 = v3;
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v61;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v63;
    _os_log_impl(&dword_18D554000, v60, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Not Native Handling and No destinations for event", buf, 0x16u);

    int v3 = v62;
  }

  double v64 = *(void **)(*(void *)(a1 + 40) + 8);
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __29__AMSEngagement_enqueueData___block_invoke_45;
  v86[3] = &unk_1E559EA90;
  id v87 = *(id *)(a1 + 48);
  __int16 v65 = v86;
  id v66 = v64;
  uint64_t v67 = AMSLogKey();
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
  double v90 = COERCE_DOUBLE(&unk_1E559EAE0);
  *(void *)v91 = v67;
  *(void *)&v91[8] = v65;
  id v68 = v67;
  dispatch_async(v66, buf);

  uint64_t v69 = +[AMSLogConfig sharedEngagementConfig];
  v70 = v69;
  if (!v69)
  {
    v70 = +[AMSLogConfig sharedConfig];
  }
  v71 = [v70 OSLogObject];
  BOOL v72 = os_signpost_enabled(v71);

  if (!v69) {
  if (v72)
  }
  {
    v73 = +[AMSLogConfig sharedEngagementConfig];
    v74 = v73;
    if (v73)
    {
      v75 = [v73 OSLogObject];
    }
    else
    {
      v76 = +[AMSLogConfig sharedConfig];
      v75 = [v76 OSLogObject];
    }
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18D554000, v75, OS_SIGNPOST_EVENT, v16, "Engagement", "No destinations for event", buf, 2u);
    }

    v77 = +[AMSLogConfig sharedEngagementConfig];
    v78 = v77;
    if (v77)
    {
      v79 = [v77 OSLogObject];
    }
    else
    {
      v80 = +[AMSLogConfig sharedConfig];
      v79 = [v80 OSLogObject];
    }
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18D554000, v79, OS_SIGNPOST_INTERVAL_END, v16, "Engagement", "Finished", buf, 2u);
    }
  }
  v24 = v87;
LABEL_65:
}

- (void)_scheduleSyncIfNeeded:(id)a3
{
  id v4 = [a3 lastSyncedBuild];
  id v5 = +[AMSDevice buildVersion];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = +[AMSEngagement _engagementQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__AMSEngagement__scheduleSyncIfNeeded___block_invoke;
    v11[3] = &unk_1E559EA90;
    v11[4] = self;
    char v8 = v11;
    id v9 = AMSLogKey();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_2;
    block[3] = &unk_1E559EAE0;
    id v13 = v9;
    id v14 = v8;
    id v10 = v9;
    dispatch_async(v7, block);
  }
}

+ (double)_enqueueTimeout
{
  BOOL v2 = +[AMSDefaults engagementExtendTimeouts];
  double result = 600.0;
  if (!v2) {
    return 6.0;
  }
  return result;
}

void __38__AMSEngagement_treatmentStoreService__block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__27;
  id v11 = __Block_byref_object_dispose__27;
  id v12 = [*(id *)(a1 + 32) connection];
  BOOL v2 = (void *)v8[5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__AMSEngagement_treatmentStoreService__block_invoke_2;
  v4[3] = &unk_1E55A23D8;
  int v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  char v6 = &v7;
  id v5 = v3;
  [v2 treatmentStoreServiceWithReply:v4];

  _Block_object_dispose(&v7, 8);
}

- (AMSEngagementConnection)connection
{
  return self->_connection;
}

- (id)_parseActions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;

          if (v11) {
            objc_msgSend(v4, "addObject:", v11, (void)v13);
          }
        }
        else
        {

          id v11 = 0;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)syncMetricsIdentifiers
{
  id v3 = AMSLogKey();
  id v4 = objc_alloc_init(AMSMutableBinaryPromise);
  id v5 = [(id)objc_opt_class() _engagementQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__AMSEngagement_syncMetricsIdentifiers__block_invoke;
  v14[3] = &unk_1E55A22D0;
  v14[4] = self;
  id v15 = v3;
  uint64_t v6 = v4;
  long long v16 = v6;
  uint64_t v7 = v14;
  id v8 = v3;
  uint64_t v9 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E559EAE0;
  id v18 = v9;
  id v19 = v7;
  id v10 = v9;
  dispatch_async(v5, block);

  id v11 = v16;
  id v12 = v6;

  return v12;
}

void __28__AMSEngagement__connection__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void __26__AMSEngagement__enqueue___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) events];
  id v3 = [v2 firstObject];

  if (!v3)
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = AMSError(2, @"No events to enqueue", &stru_1EDCA7308, 0);
    uint64_t v6 = +[AMSPromise promiseWithError:v5];
    [v4 finishWithPromise:v6];
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 32) destinations];
    id v8 = +[AMSEngagementClientData loadFromDisk];
    uint64_t v9 = [*(id *)(a1 + 32) destinations];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    BOOL v21 = __26__AMSEngagement__enqueue___block_invoke_2;
    v22 = &unk_1E55A22A8;
    id v10 = v8;
    id v23 = v10;
    id v24 = v3;
    id v11 = objc_msgSend(v9, "ams_filterUsingTest:", &v19);

    if (objc_msgSend(v11, "count", v19, v20, v21, v22))
    {
      [*(id *)(a1 + 32) setDestinations:v11];
    }
    else
    {
      id v12 = *(void **)(a1 + 40);
      long long v13 = AMSError(2, @"No events to enqueue", &stru_1EDCA7308, 0);
      long long v14 = +[AMSPromise promiseWithError:v13];
      [v12 finishWithPromise:v14];
    }
  }
  id v15 = objc_alloc_init(AMSEngagementEnqueueContext);
  long long v16 = [MEMORY[0x1E4F1C9C8] now];
  [(AMSEngagementEnqueueContext *)v15 setStart:v16];

  [(AMSEngagementEnqueueContext *)v15 setRequest:*(void *)(a1 + 32)];
  os_signpost_id_t v17 = *(void **)(a1 + 40);
  id v18 = [*(id *)(a1 + 48) _enqueueWithContext:v15];
  [v17 finishWithPromise:v18];
}

- (id)enqueueData:(id)a3
{
  id v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = @"Invalid Engagement Data";
    uint64_t v6 = 2;
    goto LABEL_6;
  }
  if (+[AMSEphemeralDefaults suppressEngagement])
  {
    id v5 = @"Suppress Engagement";
    uint64_t v6 = 11;
LABEL_6:
    uint64_t v7 = AMSError(v6, v5, &stru_1EDCA7308, 0);
    id v8 = +[AMSPromise promiseWithError:v7];

    goto LABEL_7;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v4 copyItems:1];

  id v11 = objc_alloc_init(AMSMutablePromise);
  id v12 = AMSLogKey();
  long long v13 = [(id)objc_opt_class() _engagementQueue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __29__AMSEngagement_enqueueData___block_invoke;
  v20[3] = &unk_1E55A2280;
  id v4 = v10;
  id v21 = v4;
  v22 = self;
  long long v14 = v11;
  id v23 = v14;
  id v24 = v12;
  id v15 = v20;
  id v16 = v12;
  os_signpost_id_t v17 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E559EAE0;
  id v26 = v17;
  id v27 = v15;
  id v18 = v17;
  dispatch_async(v13, block);

  uint64_t v19 = v24;
  id v8 = v14;

LABEL_7:
  return v8;
}

void __38__AMSEngagement_treatmentStoreService__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  if (v10)
  {
    [*(id *)(a1 + 40) finishWithResult:v10];
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    if (v5)
    {
      [v8 finishWithError:v5];
    }
    else
    {
      uint64_t v9 = AMSError(12, @"Engagement Failure", @"Treatment store service is unavailable", 0);
      [v8 finishWithError:v9];
    }
  }
}

void __29__AMSEngagement_enqueueData___block_invoke_45(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  BOOL v2 = objc_alloc_init(AMSEngagementEnqueueResult);
  [v1 finishWithResult:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheInfo, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_runningPromises, 0);
  objc_storeStrong((id *)&self->_observerInfo, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

void __28__AMSEngagement__connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained(&_connection_connection);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v5)
  {
    uint64_t v6 = [AMSEngagementConnection alloc];
    uint64_t v7 = [*(id *)(a1 + 48) notificationCenter];
    uint64_t v8 = [(AMSEngagementConnection *)v6 initWithNotificationCenter:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setErrorHandler:&__block_literal_global_153_0];
    objc_storeWeak(&_connection_connection, *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__27;
  v18[4] = __Block_byref_object_dispose__27;
  id v19 = v5;
  id v11 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __28__AMSEngagement__connection__block_invoke_3;
  v17[3] = &unk_1E559EC70;
  v17[4] = v18;
  id v12 = v17;
  long long v13 = v11;
  long long v14 = AMSLogKey();
  dispatch_time_t v15 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke_0;
  block[3] = &unk_1E559EAE0;
  id v21 = v14;
  id v22 = v12;
  id v16 = v14;
  dispatch_after(v15, v13, block);

  _Block_object_dispose(v18, 8);
}

- (void)dealloc
{
  uint64_t v3 = +[AMSEngagement notificationCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AMSEngagement;
  [(AMSEngagement *)&v4 dealloc];
}

- (AMSEngagement)initWithBag:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSEngagement;
  uint64_t v6 = [(AMSEngagement *)&v20 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    uint64_t v8 = +[AMSEngagement _connection];
    connection = v7->_connection;
    v7->_connection = (AMSEngagementConnection *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    observerInfo = v7->_observerInfo;
    v7->_observerInfo = (NSMapTable *)v10;

    id v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    runningPromises = v7->_runningPromises;
    v7->_runningPromises = v12;

    long long v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.AMSEngagement.callbackQueue", v14);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v15;

    os_signpost_id_t v17 = objc_alloc_init(AMSEngagementMessageCache);
    cacheInfo = v7->_cacheInfo;
    v7->_cacheInfo = v17;

    [(AMSEngagement *)v7 _observeNotifications];
  }

  return v7;
}

- (void)_observeNotifications
{
  uint64_t v3 = +[AMSEngagement notificationCenter];
  [v3 addObserver:self selector:sel__pushEventReceived_ name:0x1EDCB2AC8 object:0];

  id v4 = +[AMSEngagement notificationCenter];
  [v4 addObserver:self selector:sel__connectionErrorNotification name:0x1EDCB2A88 object:0];
}

+ (NSNotificationCenter)notificationCenter
{
  if (_MergedGlobals_101 != -1) {
    dispatch_once(&_MergedGlobals_101, &__block_literal_global_45);
  }
  BOOL v2 = (void *)qword_1EB38D828;
  return (NSNotificationCenter *)v2;
}

+ (id)_connection
{
  uint64_t v3 = [a1 _engagementQueue];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__27;
  id v19 = __Block_byref_object_dispose__27;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __28__AMSEngagement__connection__block_invoke;
  v11[3] = &unk_1E55A2470;
  long long v13 = &v15;
  id v14 = a1;
  id v4 = v3;
  id v12 = v4;
  id v5 = v11;
  uint64_t v6 = v4;
  uint64_t v7 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke;
  block[3] = &unk_1E559EAE0;
  id v22 = v7;
  id v23 = v5;
  id v8 = v7;
  dispatch_sync(v6, block);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (AMSEngagement)init
{
  return [(AMSEngagement *)self initWithBag:0];
}

void __58__AMSEngagement_addObserver_placements_serviceType_queue___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [*(id *)(a1 + 32) connection];
  [v2 beginObservingMessages];

  uint64_t v3 = [*(id *)(a1 + 32) observerInfo];
  id v4 = [v3 objectForKey:*(void *)(a1 + 40)];

  if (v4)
  {
    [(AMSEngagementObserverInfo *)v4 setDispatchQueue:*(void *)(a1 + 48)];
  }
  else
  {
    id v4 = [[AMSEngagementObserverInfo alloc] initWithQueue:*(void *)(a1 + 48)];
    id v5 = +[AMSLogConfig sharedEngagementConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = AMSLogKey();
      uint64_t v9 = *(void *)(a1 + 40);
      int v22 = 138543874;
      uint64_t v23 = v7;
      __int16 v24 = 2114;
      v25 = v8;
      __int16 v26 = 2114;
      uint64_t v27 = v9;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding %{public}@ as an observer", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v10 = [*(id *)(a1 + 32) observerInfo];
    [v10 setObject:v4 forKey:*(void *)(a1 + 40)];
  }
  if (*(void *)(a1 + 56)) {
    -[AMSEngagementObserverInfo addPlacements:](v4, "addPlacements:");
  }
  id v11 = *(id *)(a1 + 64);
  if (!*(void *)(a1 + 64))
  {
    id v12 = +[AMSLogConfig sharedEngagementConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    long long v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = AMSLogKey();
      int v22 = 138543618;
      uint64_t v23 = v14;
      __int16 v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Warning: nil serviceType passed, falling back to bundle ID last component", (uint8_t *)&v22, 0x16u);
    }
    id v16 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v17 = +[AMSProcessInfo currentProcess];
    id v18 = [v17 bundleIdentifier];
    id v19 = [v16 URLWithString:v18];

    id v20 = [v19 pathExtension];
    uint64_t v21 = [v20 lowercaseString];

    id v11 = (id)v21;
  }
  if ([v11 length]) {
    [(AMSEngagementObserverInfo *)v4 addServiceType:v11];
  }
}

- (NSMapTable)observerInfo
{
  return self->_observerInfo;
}

- (id)enqueueMessageEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSMutablePromise);
  uint64_t v6 = [(AMSEngagement *)self enqueueEvent:v4];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__AMSEngagement_Messaging__enqueueMessageEvent___block_invoke;
  v14[3] = &unk_1E55A2208;
  v14[4] = self;
  uint64_t v7 = v5;
  uint64_t v15 = v7;
  [v6 addSuccessBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__AMSEngagement_Messaging__enqueueMessageEvent___block_invoke_3;
  v12[3] = &unk_1E559F028;
  id v8 = v7;
  long long v13 = v8;
  [v6 addErrorBlock:v12];
  uint64_t v9 = v13;
  uint64_t v10 = v8;

  return v10;
}

- (id)enqueueEvent:(id)a3
{
  id v4 = [a3 engagementData];
  id v5 = [(AMSEngagement *)self enqueueData:v4];

  return v5;
}

- (void)addObserver:(id)a3 placement:(id)a4 serviceType:(id)a5
{
  if (a4)
  {
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    id v9 = a5;
    id v10 = a3;
    id v11 = [v8 setWithObject:a4];
    -[AMSEngagement addObserver:placements:serviceType:](self, "addObserver:placements:serviceType:", v10);
  }
  else
  {
    id v10 = a5;
    id v11 = a3;
    -[AMSEngagement addObserver:placements:serviceType:](self, "addObserver:placements:serviceType:");
  }
}

- (void)addObserver:(id)a3 placement:(id)a4 serviceType:(id)a5 queue:(id)a6
{
  if (a4)
  {
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    id v11 = a6;
    id v12 = a5;
    id v13 = a3;
    id v14 = [v10 setWithObject:a4];
    -[AMSEngagement addObserver:placements:serviceType:queue:](self, "addObserver:placements:serviceType:queue:", v13);
  }
  else
  {
    id v12 = a6;
    id v13 = a5;
    id v14 = a3;
    -[AMSEngagement addObserver:placements:serviceType:queue:](self, "addObserver:placements:serviceType:queue:");
  }
}

- (void)addObserver:(id)a3 placements:(id)a4 serviceType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() _notifyQueue];
  [(AMSEngagement *)self addObserver:v10 placements:v9 serviceType:v8 queue:v11];
}

- (void)addObserver:(id)a3 placements:(id)a4 serviceType:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(id)objc_opt_class() _engagementQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__AMSEngagement_addObserver_placements_serviceType_queue___block_invoke;
  v22[3] = &unk_1E55A2258;
  v22[4] = self;
  id v23 = v10;
  id v24 = v13;
  id v25 = v11;
  id v26 = v12;
  uint64_t v15 = v22;
  id v16 = v12;
  id v17 = v11;
  id v18 = v13;
  id v19 = v10;
  id v20 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke;
  block[3] = &unk_1E559EAE0;
  id v28 = v20;
  id v29 = v15;
  id v21 = v20;
  dispatch_sync(v14, block);
}

+ (OS_dispatch_queue)_notifyQueue
{
  if (qword_1EB38D840 != -1) {
    dispatch_once(&qword_1EB38D840, &__block_literal_global_164);
  }
  BOOL v2 = (void *)qword_1EB38D848;
  return (OS_dispatch_queue *)v2;
}

- (id)_enqueue:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSMutablePromise);
  uint64_t v6 = [(id)objc_opt_class() _engagementQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __26__AMSEngagement__enqueue___block_invoke;
  v14[3] = &unk_1E55A22D0;
  id v15 = v4;
  uint64_t v7 = v5;
  id v16 = v7;
  id v17 = self;
  id v8 = v14;
  id v9 = v4;
  id v10 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E559EAE0;
  id v19 = v10;
  id v20 = v8;
  id v11 = v10;
  dispatch_async(v6, block);

  id v12 = v7;
  return v12;
}

uint64_t __35__AMSEngagement_notificationCenter__block_invoke()
{
  qword_1EB38D828 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28EB8]);
  return MEMORY[0x1F41817F8]();
}

void __33__AMSEngagement__engagementQueue__block_invoke()
{
  BOOL v2 = dispatch_get_global_queue(0, 0);
  dispatch_queue_t v0 = dispatch_queue_create_with_target_V2("com.apple.AMSEngagement.engagementQueue", 0, v2);
  uint64_t v1 = (void *)qword_1EB38D838;
  qword_1EB38D838 = (uint64_t)v0;
}

void __48__AMSEngagement_Messaging__enqueueMessageEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [[AMSEngagementMessageEventResponse alloc] initWithEnqueueResult:v3];

  id v5 = [*(id *)(a1 + 32) cacheInfo];
  uint64_t v6 = [v5 filterWithMessage:v4];

  if ([v6 count])
  {
    uint64_t v7 = +[AMSLogConfig sharedEngagementConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      int v12 = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v10;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Blocked message identifiers: %{public}@", (uint8_t *)&v12, 0x20u);
    }
    id v11 = [*(id *)(a1 + 32) connection];
    [v11 notifyBlockedMessages:v6];
  }
  [*(id *)(a1 + 40) finishWithResult:v4];
}

- (AMSEngagementMessageCache)cacheInfo
{
  return self->_cacheInfo;
}

void __29__AMSEngagement__notifyQueue__block_invoke()
{
  BOOL v2 = dispatch_get_global_queue(0, 0);
  dispatch_queue_t v0 = dispatch_queue_create_with_target_V2("com.apple.AMSEngagement.notify", 0, v2);
  uint64_t v1 = (void *)qword_1EB38D848;
  qword_1EB38D848 = (uint64_t)v0;
}

uint64_t __39__AMSEngagement_syncMetricsIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = AMSSetLogKey(0);
  id v3 = +[AMSLogConfig sharedEngagementConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    uint64_t v7 = *(void *)(a1 + 40);
    int v10 = 138543874;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting metrics identifier sync. %{public}@", (uint8_t *)&v10, 0x20u);
  }
  id v8 = [*(id *)(a1 + 32) connection];
  [v8 syncMetricsIdentifiers];

  return [*(id *)(a1 + 48) finishWithSuccess];
}

uint64_t __48__AMSEngagement_Messaging__enqueueMessageEvent___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (void)handleDialogResult:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 originalRequest];
  uint64_t v5 = [v3 selectedActionIdentifier];

  uint64_t v6 = [v4 locateActionWithIdentifier:v5];

  uint64_t v7 = [v6 metricsEvent];

  if (v7)
  {
    id v8 = +[AMSMetrics internalInstanceUsingBag:0];
    uint64_t v9 = [v6 metricsEvent];
    v11[0] = v9;
    int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v8 enqueueEvents:v10];
  }
}

- (id)contentInfoForApp:(id)a3 cacheKey:(id)a4 version:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [[AMSMutablePromise alloc] initWithTimeout:5.0];
  [(AMSEngagement *)self _manageRunningPromise:v11];
  __int16 v12 = [(id)objc_opt_class() _engagementQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __52__AMSEngagement_contentInfoForApp_cacheKey_version___block_invoke;
  v23[3] = &unk_1E55A2258;
  v23[4] = self;
  id v24 = v8;
  id v25 = v9;
  id v26 = v10;
  uint64_t v13 = v11;
  uint64_t v27 = v13;
  __int16 v14 = v23;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  uint64_t v18 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E559EAE0;
  id v29 = v18;
  id v30 = v14;
  id v19 = v18;
  dispatch_async(v12, block);

  id v20 = v27;
  id v21 = v13;

  return v21;
}

void __52__AMSEngagement_contentInfoForApp_cacheKey_version___block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy__27;
  uint64_t v13 = __Block_byref_object_dispose__27;
  id v14 = [*(id *)(a1 + 32) connection];
  id v2 = (void *)v10[5];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__AMSEngagement_contentInfoForApp_cacheKey_version___block_invoke_13;
  v6[3] = &unk_1E55A2230;
  v6[4] = *(void *)(a1 + 32);
  id v8 = &v9;
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 contentInfoForApp:v3 cacheKey:v4 version:v5 reply:v6];

  _Block_object_dispose(&v9, 8);
}

void __52__AMSEngagement_contentInfoForApp_cacheKey_version___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  if (v10)
  {
    [*(id *)(a1 + 40) finishWithResult:v10];
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    if (v5)
    {
      [v8 finishWithError:v5];
    }
    else
    {
      uint64_t v9 = AMSError(12, @"Engagement Failure", @"Failed to get content info", 0);
      [v8 finishWithError:v9];
    }
  }
}

void __37__AMSEngagement__enqueueWithContext___block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v11 = [*(id *)(a1 + 32) bag];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v9 = [v7 request];
  id v10 = [v9 destinations];
  [v4 _recordLoggingEventWithBag:v11 enqueueData:v5 eventType:v6 userInfo:v8 destinations:v10 error:v3];
}

+ (void)_recordLoggingEventWithBag:(id)a3 enqueueData:(id)a4 eventType:(id)a5 userInfo:(id)a6 destinations:(id)a7 error:(id)a8
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = objc_msgSend(v17, "ams_filterUsingTest:", &__block_literal_global_72);

  if (v19)
  {
    os_signpost_id_t v46 = v15;
    if (!v13)
    {
      id v13 = +[AMSEngagement createBagForSubProfile];
    }
    id v44 = v18;
    id v20 = [[AMSMetricsLoggingEvent alloc] initWithSubsystem:@"Engagement" category:@"enqueue" error:v18];
    id v21 = [v14 objectForKeyedSubscript:@"placements"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v22 = v21;
    }
    else {
      id v22 = 0;
    }

    id v23 = objc_msgSend(v22, "ams_objectAtIndex:", 0);

    v43 = v23;
    id v24 = [v23 objectForKeyedSubscript:@"placement"];
    objc_opt_class();
    id v47 = 0;
    if (objc_opt_isKindOfClass()) {
      id v47 = v24;
    }

    id v25 = [v16 objectForKeyedSubscript:@"destination"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v25;
    }
    else {
      id v26 = 0;
    }
    id v45 = v16;

    if ([v26 length])
    {
      uint64_t v27 = [[AMSEngagementDestination alloc] initWithIdentifier:v26];
      v53[0] = v27;
      id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
    }
    else
    {
      id v28 = v17;
    }
    id v29 = (void *)MEMORY[0x1E4F1CAD0];
    id v30 = objc_msgSend(v28, "ams_mapWithTransform:", &__block_literal_global_90);
    double v31 = [v29 setWithArray:v30];

    v32 = +[AMSDefaults jsVersionMap];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_3;
    v51[3] = &unk_1E55A2388;
    id v33 = v31;
    id v52 = v33;
    double v34 = objc_msgSend(v32, "ams_filterUsingTest:", v51);

    os_signpost_id_t v35 = [v45 objectForKeyedSubscript:@"breadcrumbs"];
    [(AMSMetricsLoggingEvent *)v20 setBreadcrumbs:v35];

    [(AMSMetricsLoggingEvent *)v20 setEventDestinations:v28];
    if ([v46 length]) {
      BOOL v36 = v46;
    }
    else {
      BOOL v36 = 0;
    }
    [(AMSMetricsLoggingEvent *)v20 setEngagementEventType:v36];
    [(AMSMetricsLoggingEvent *)v20 setEventPlacement:v47];
    v37 = [v14 objectForKeyedSubscript:@"serviceType"];
    objc_opt_class();
    id v38 = 0;
    if (objc_opt_isKindOfClass()) {
      id v38 = v37;
    }

    [(AMSMetricsLoggingEvent *)v20 setEventServiceType:v38];
    [(AMSMetricsLoggingEvent *)v20 setJsVersions:v34];
    v39 = [v14 objectForKeyedSubscript:@"requestUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v40 = v39;
    }
    else {
      id v40 = 0;
    }

    [(AMSMetricsLoggingEvent *)v20 setUrl:v40];
    double v41 = +[AMSMetricsLoggingEvent shouldSampleErrorsWithBag:v13];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_4;
    v48[3] = &unk_1E559F1E0;
    id v13 = v13;
    id v49 = v13;
    v50 = v20;
    uint64_t v42 = v20;
    [v41 addSuccessBlock:v48];

    id v16 = v45;
    id v15 = v46;
    id v18 = v44;
  }
}

uint64_t __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 allowsResponse];
}

uint64_t __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

void __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_4(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_5;
  v3[3] = &unk_1E559F1E0;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_5(uint64_t a1)
{
  id v2 = +[AMSMetrics internalInstanceUsingBag:*(void *)(a1 + 32)];
  [v2 enqueueEvent:*(void *)(a1 + 40)];
}

- (id)sync
{
  return [(AMSEngagement *)self syncDestinations:0];
}

- (id)syncDestinations:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSEngagementSyncRequest);
  if ([v4 count]) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  [(AMSEngagementSyncRequest *)v5 setApps:v6];

  [(AMSEngagementSyncRequest *)v5 setTimeout:300.0];
  id v7 = AMSLogKey();
  [(AMSEngagementSyncRequest *)v5 setLogKey:v7];

  uint64_t v8 = [(AMSEngagement *)self syncWithRequest:v5];

  return v8;
}

- (id)syncWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[AMSMutablePromise alloc] initWithTimeout:300.0];
  [(AMSEngagement *)self _manageRunningPromise:v5];
  id v6 = AMSLogKey();
  id v7 = [(id)objc_opt_class() _engagementQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __33__AMSEngagement_syncWithRequest___block_invoke;
  v16[3] = &unk_1E55A2280;
  id v17 = v6;
  id v18 = self;
  id v19 = v4;
  id v20 = v5;
  uint64_t v8 = v16;
  uint64_t v9 = v5;
  id v10 = v4;
  id v11 = v6;
  __int16 v12 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E559EAE0;
  id v22 = v12;
  id v23 = v8;
  id v13 = v12;
  dispatch_async(v7, block);

  id v14 = [(AMSPromise *)v9 binaryPromiseAdapter];

  return v14;
}

void __33__AMSEngagement_syncWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = AMSSetLogKey(0);
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  if (*(void *)(a1 + 32))
  {
    id v4 = [NSString stringWithFormat:@"(prev: %@)", *(void *)(a1 + 32)];
  }
  else
  {
    id v4 = &stru_1EDCA7308;
  }
  id v5 = +[AMSLogConfig sharedEngagementConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    double v31 = (uint64_t (*)(uint64_t, uint64_t))v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting sync. %{public}@", buf, 0x20u);
  }
  uint64_t v9 = +[AMSLogConfig sharedEngagementConfig];
  id v10 = v9;
  if (!v9)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  BOOL v12 = os_signpost_enabled(v11);

  if (!v9) {
  if (v12)
  }
  {
    id v13 = +[AMSLogConfig sharedEngagementConfig];
    id v14 = v13;
    if (!v13)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, *(const void **)(a1 + 40));

    if (!v13) {
    id v17 = +[AMSLogConfig sharedEngagementConfig];
    }
    id v18 = v17;
    if (v17)
    {
      id v19 = [v17 OSLogObject];
    }
    else
    {
      id v20 = +[AMSLogConfig sharedConfig];
      id v19 = [v20 OSLogObject];
    }
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18D554000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Engagement", "Starting sync", buf, 2u);
    }
  }
  else
  {
    os_signpost_id_t v16 = 0;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  double v31 = __Block_byref_object_copy__27;
  v32 = __Block_byref_object_dispose__27;
  id v33 = [*(id *)(a1 + 40) connection];
  id v21 = *(void **)(*(void *)&buf[8] + 40);
  id v22 = *(void **)(a1 + 48);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __33__AMSEngagement_syncWithRequest___block_invoke_104;
  v24[3] = &unk_1E55A23B0;
  v24[4] = *(void *)(a1 + 40);
  id v28 = buf;
  id v25 = v22;
  id v23 = v3;
  id v26 = v23;
  os_signpost_id_t v29 = v16;
  id v27 = *(id *)(a1 + 56);
  [v21 syncWithRequest:v25 completion:v24];

  _Block_object_dispose(buf, 8);
}

void __33__AMSEngagement_syncWithRequest___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  uint64_t v9 = [*(id *)(a1 + 40) logKey];
  id v10 = AMSSetLogKey(v9);

  if (v6)
  {
    id v11 = +[AMSLogConfig sharedEngagementConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    BOOL v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      id v14 = AMSLogKey();
      [*(id *)(a1 + 48) timeIntervalSinceNow];
      *(_DWORD *)id v47 = 138544130;
      if (v15 < 0.0) {
        double v15 = -v15;
      }
      *(void *)&v47[4] = v13;
      __int16 v48 = 2114;
      id v49 = v14;
      __int16 v50 = 2048;
      double v51 = v15;
      __int16 v52 = 2114;
      id v53 = v6;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Sync finished with error (%.3f) %{public}@", v47, 0x2Au);
    }
    os_signpost_id_t v16 = +[AMSLogConfig sharedEngagementConfig];
    id v17 = v16;
    if (!v16)
    {
      id v17 = +[AMSLogConfig sharedConfig];
    }
    id v18 = objc_msgSend(v17, "OSLogObject", *(void *)v47);
    BOOL v19 = os_signpost_enabled(v18);

    if (!v16) {
    if (v19)
    }
    {
      id v20 = +[AMSLogConfig sharedEngagementConfig];
      id v21 = v20;
      if (v20)
      {
        id v22 = [v20 OSLogObject];
      }
      else
      {
        id v38 = +[AMSLogConfig sharedConfig];
        id v22 = [v38 OSLogObject];
      }
      os_signpost_id_t v39 = *(void *)(a1 + 72);
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_DWORD *)id v47 = 138543362;
        *(void *)&v47[4] = v6;
        _os_signpost_emit_with_name_impl(&dword_18D554000, v22, OS_SIGNPOST_EVENT, v39, "Engagement", "Sync finished with error %{public}@", v47, 0xCu);
      }

      id v40 = +[AMSLogConfig sharedEngagementConfig];
      double v41 = v40;
      if (v40)
      {
        uint64_t v42 = [v40 OSLogObject];
      }
      else
      {
        v43 = +[AMSLogConfig sharedConfig];
        uint64_t v42 = [v43 OSLogObject];
      }
      os_signpost_id_t v44 = *(void *)(a1 + 72);
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)id v47 = 0;
        _os_signpost_emit_with_name_impl(&dword_18D554000, v42, OS_SIGNPOST_INTERVAL_END, v44, "Engagement", "Error occured", v47, 2u);
      }
    }
    [*(id *)(a1 + 56) finishWithError:v6];
  }
  else
  {
    id v23 = *(void **)(a1 + 32);
    id v24 = [v5 actions];
    id v25 = (id)[v23 _parseActions:v24];

    id v26 = +[AMSLogConfig sharedEngagementConfig];
    if (!v26)
    {
      id v26 = +[AMSLogConfig sharedConfig];
    }
    id v27 = [v26 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = objc_opt_class();
      os_signpost_id_t v29 = AMSLogKey();
      [*(id *)(a1 + 48) timeIntervalSinceNow];
      *(_DWORD *)id v47 = 138543874;
      if (v30 < 0.0) {
        double v30 = -v30;
      }
      *(void *)&v47[4] = v28;
      __int16 v48 = 2114;
      id v49 = v29;
      __int16 v50 = 2048;
      double v51 = v30;
      _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sync finished (%.3f)", v47, 0x20u);
    }
    double v31 = +[AMSLogConfig sharedEngagementConfig];
    v32 = v31;
    if (!v31)
    {
      v32 = +[AMSLogConfig sharedConfig];
    }
    id v33 = objc_msgSend(v32, "OSLogObject", *(void *)v47);
    BOOL v34 = os_signpost_enabled(v33);

    if (!v31) {
    if (v34)
    }
    {
      os_signpost_id_t v35 = +[AMSLogConfig sharedEngagementConfig];
      BOOL v36 = v35;
      if (v35)
      {
        v37 = [v35 OSLogObject];
      }
      else
      {
        id v45 = +[AMSLogConfig sharedConfig];
        v37 = [v45 OSLogObject];
      }
      os_signpost_id_t v46 = *(void *)(a1 + 72);
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)id v47 = 0;
        _os_signpost_emit_with_name_impl(&dword_18D554000, v37, OS_SIGNPOST_INTERVAL_END, v46, "Engagement", "Finished", v47, 2u);
      }
    }
    [*(id *)(a1 + 56) finishWithResult:MEMORY[0x1E4F1CC38]];
  }
}

- (id)fetchMetricsIdentifiers
{
  id v3 = AMSLogKey();
  id v4 = objc_alloc_init(AMSMutableBinaryPromise);
  id v5 = [(id)objc_opt_class() _engagementQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__AMSEngagement_fetchMetricsIdentifiers__block_invoke;
  v14[3] = &unk_1E55A22D0;
  void v14[4] = self;
  id v15 = v3;
  id v6 = v4;
  os_signpost_id_t v16 = v6;
  uint64_t v7 = v14;
  id v8 = v3;
  uint64_t v9 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E559EAE0;
  id v18 = v9;
  id v19 = v7;
  id v10 = v9;
  dispatch_async(v5, block);

  id v11 = v16;
  BOOL v12 = v6;

  return v12;
}

uint64_t __40__AMSEngagement_fetchMetricsIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = AMSSetLogKey(0);
  id v3 = +[AMSLogConfig sharedEngagementConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    uint64_t v7 = *(void *)(a1 + 40);
    int v10 = 138543874;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting metrics identifier fetch. %{public}@", (uint8_t *)&v10, 0x20u);
  }
  id v8 = [*(id *)(a1 + 32) connection];
  [v8 fetchMetricsIdentifiers];

  return [*(id *)(a1 + 48) finishWithSuccess];
}

- (id)manualSyncMetricsIdentifiers
{
  id v3 = objc_alloc_init(AMSMutableBinaryPromise);
  if (os_variant_has_internal_content())
  {
    id v4 = AMSLogKey();
    uint64_t v5 = [(id)objc_opt_class() _engagementQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __45__AMSEngagement_manualSyncMetricsIdentifiers__block_invoke;
    v11[3] = &unk_1E55A22D0;
    void v11[4] = self;
    id v12 = v4;
    uint64_t v13 = v3;
    id v6 = v11;
    id v7 = v4;
    id v8 = AMSLogKey();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_2;
    block[3] = &unk_1E559EAE0;
    id v15 = v8;
    id v16 = v6;
    id v9 = v8;
    dispatch_async(v5, block);
  }
  else
  {
    [(AMSMutableBinaryPromise *)v3 finishWithSuccess];
  }
  return v3;
}

uint64_t __45__AMSEngagement_manualSyncMetricsIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = AMSSetLogKey(0);
  id v3 = +[AMSLogConfig sharedEngagementConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    uint64_t v7 = *(void *)(a1 + 40);
    int v10 = 138543874;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting metrics identifier manual sync. %{public}@", (uint8_t *)&v10, 0x20u);
  }
  id v8 = [*(id *)(a1 + 32) connection];
  [v8 manualSyncMetricsIdentifiers];

  return [*(id *)(a1 + 48) finishWithSuccess];
}

- (id)_createCombinedLogKey
{
  id v2 = AMSGenerateLogCorrelationKey();
  id v3 = AMSLogKey();
  if (v3)
  {
    uint64_t v4 = [NSString stringWithFormat:@"%@:%@", v3, v2];

    id v2 = (void *)v4;
  }

  return v2;
}

- (void)removeObserver:(id)a3 placement:(id)a4 serviceType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(id)objc_opt_class() _engagementQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__AMSEngagement_removeObserver_placement_serviceType___block_invoke;
  v18[3] = &unk_1E55A2280;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  __int16 v12 = v18;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  uint64_t v16 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke;
  block[3] = &unk_1E559EAE0;
  id v23 = v16;
  id v24 = v12;
  id v17 = v16;
  dispatch_sync(v11, block);
}

void __54__AMSEngagement_removeObserver_placement_serviceType___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) observerInfo];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) observerInfo];
    uint64_t v5 = [v4 objectForKey:*(void *)(a1 + 40)];

    if (!v5) {
      goto LABEL_21;
    }
    if (*(void *)(a1 + 48)) {
      objc_msgSend(v5, "removePlacement:");
    }
    if (*(void *)(a1 + 56)) {
      objc_msgSend(v5, "removeServiceType:");
    }
    id v6 = [v5 placements];
    if ([v6 count])
    {
      if (!*(void *)(a1 + 48))
      {
        uint64_t v7 = *(void *)(a1 + 56);

        if (!v7) {
          goto LABEL_15;
        }
LABEL_21:

        return;
      }
    }
    else
    {
      id v8 = [v5 serviceTypes];
      if (![v8 count])
      {

LABEL_15:
        id v9 = +[AMSLogConfig sharedEngagementConfig];
        if (!v9)
        {
          id v9 = +[AMSLogConfig sharedConfig];
        }
        id v10 = [v9 OSLogObject];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = objc_opt_class();
          __int16 v12 = AMSLogKey();
          uint64_t v13 = *(void *)(a1 + 40);
          int v15 = 138543874;
          uint64_t v16 = v11;
          __int16 v17 = 2114;
          id v18 = v12;
          __int16 v19 = 2114;
          uint64_t v20 = v13;
          _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing %{public}@ as an observer", (uint8_t *)&v15, 0x20u);
        }
        id v6 = [*(id *)(a1 + 32) observerInfo];
        [v6 removeObjectForKey:*(void *)(a1 + 40)];
        goto LABEL_20;
      }
      if (!*(void *)(a1 + 48))
      {
        uint64_t v14 = *(void *)(a1 + 56);

        if (v14) {
          goto LABEL_21;
        }
        goto LABEL_15;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
}

- (void)addCachePolicy:(int64_t)a3 forPlacements:(id)a4 serviceType:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * v13);
        int v15 = [(AMSEngagement *)self cacheInfo];
        [v15 addWithCachePolicy:a3 placement:v14 serviceType:v9];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)_failAllRunningPromisesWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() _engagementQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__AMSEngagement__failAllRunningPromisesWithError___block_invoke;
  v10[3] = &unk_1E559F1E0;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  id v7 = v4;
  id v8 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E559EAE0;
  id v13 = v8;
  id v14 = v6;
  id v9 = v8;
  dispatch_async(v5, block);
}

void __50__AMSEngagement__failAllRunningPromisesWithError___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = +[AMSLogConfig sharedEngagementConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = [*(id *)(a1 + 32) runningPromises];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v5 count];
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Failing %ld connections", buf, 0x16u);
  }
  id v6 = [*(id *)(a1 + 32) runningPromises];
  id v7 = (void *)[v6 copy];

  id v8 = *(void **)(*(void *)(a1 + 32) + 8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__AMSEngagement__failAllRunningPromisesWithError___block_invoke_128;
  v14[3] = &unk_1E559F1E0;
  id v15 = v7;
  id v16 = *(id *)(a1 + 40);
  id v9 = v14;
  uint64_t v10 = v8;
  id v11 = v7;
  uint64_t v12 = AMSLogKey();
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
  long long v18 = &unk_1E559EAE0;
  id v19 = v12;
  id v20 = v9;
  id v13 = v12;
  dispatch_async(v10, buf);
}

void __50__AMSEngagement__failAllRunningPromisesWithError___block_invoke_128(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "finishWithError:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_pushEventReceived:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  uint64_t v6 = +[AMSLogConfig sharedEngagementConfig];
  long long v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      long long v7 = +[AMSLogConfig sharedConfig];
    }
    long long v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = objc_opt_class();
      long long v10 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Received push event", buf, 0x16u);
    }
    id v11 = [(id)objc_opt_class() _engagementQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __36__AMSEngagement__pushEventReceived___block_invoke;
    v18[3] = &unk_1E559F1E0;
    v18[4] = self;
    id v19 = v5;
    uint64_t v12 = v18;
    id v13 = AMSLogKey();
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
    uint64_t v21 = &unk_1E559EAE0;
    id v22 = v13;
    id v23 = v12;
    id v14 = v13;
    dispatch_async(v11, buf);
  }
  else
  {
    if (!v6)
    {
      long long v7 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v7 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      long long v17 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Rejecting received push event with no object", buf, 0x16u);
    }
  }
}

uint64_t __36__AMSEngagement__pushEventReceived___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handlePushEvent:*(void *)(a1 + 40)];
}

- (void)handlePushEvent:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _engagementQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 actions];
  uint64_t v7 = [v6 count];

  long long v8 = off_1E559C000;
  uint64_t v9 = +[AMSLogConfig sharedEngagementConfig];
  long long v10 = (void *)v9;
  if (v7)
  {
    if (!v9)
    {
      long long v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      id v14 = [v4 actions];
      *(_DWORD *)buf = 138543874;
      uint64_t v41 = v12;
      long long v8 = off_1E559C000;
      __int16 v42 = 2114;
      v43 = v13;
      __int16 v44 = 2048;
      uint64_t v45 = [v14 count];
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Processing %lu push event", buf, 0x20u);
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v10 = [v4 actions];
    uint64_t v15 = [v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v33 = v4;
      uint64_t v17 = *(void *)v36;
      unint64_t v18 = 0x1E559B000uLL;
      do
      {
        uint64_t v19 = 0;
        uint64_t v34 = v16;
        do
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v10);
          }
          id v20 = (void *)[objc_alloc(*(Class *)(v18 + 3880)) initWithJSObject:*(void *)(*((void *)&v35 + 1) + 8 * v19)];
          if (v20)
          {
            [(AMSEngagement *)self _handleServiceResponse:v20];
          }
          else
          {
            uint64_t v21 = [(__objc2_class *)v8[17] sharedEngagementConfig];
            if (!v21)
            {
              uint64_t v21 = [(__objc2_class *)v8[17] sharedConfig];
            }
            id v22 = [v21 OSLogObject];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              unint64_t v23 = v18;
              uint64_t v24 = v17;
              id v25 = self;
              id v26 = v10;
              uint64_t v27 = objc_opt_class();
              uint64_t v28 = AMSLogKey();
              *(_DWORD *)buf = 138543618;
              uint64_t v41 = v27;
              long long v10 = v26;
              self = v25;
              uint64_t v17 = v24;
              unint64_t v18 = v23;
              uint64_t v16 = v34;
              __int16 v42 = 2114;
              v43 = v28;
              _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to get service response from push event action", buf, 0x16u);

              long long v8 = off_1E559C000;
            }
          }
          ++v19;
        }
        while (v16 != v19);
        uint64_t v16 = [v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v16);
      id v4 = v33;
    }
  }
  else
  {
    if (!v9)
    {
      long long v10 = +[AMSLogConfig sharedConfig];
    }
    os_signpost_id_t v29 = [v10 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = objc_opt_class();
      AMSLogKey();
      v32 = id v31 = v4;
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v30;
      __int16 v42 = 2114;
      v43 = v32;
      _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Push event contains no actions to push", buf, 0x16u);

      id v4 = v31;
    }
  }
}

- (void)_handleServiceResponse:(id)a3
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v89 = self;
  id v5 = [(id)objc_opt_class() _engagementQueue];
  dispatch_assert_queue_V2(v5);

  id v87 = [v4 serviceType];
  uint64_t v6 = +[AMSLogConfig sharedEngagementConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  id v85 = v4;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    id v4 = v85;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Sending service response to observers", buf, 0x16u);
  }
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v10 = [(AMSEngagement *)self observerInfo];
  id v11 = [v10 keyEnumerator];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v108 objects:v117 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v109;
    uint64_t v78 = *(void *)v109;
    v79 = v11;
    do
    {
      uint64_t v15 = 0;
      uint64_t v80 = v13;
      do
      {
        if (*(void *)v109 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v108 + 1) + 8 * v15);
        uint64_t v17 = [(AMSEngagement *)v89 observerInfo];
        uint64_t v84 = v16;
        unint64_t v18 = [v17 objectForKey:v16];

        uint64_t v19 = [v18 placements];
        if (v19)
        {
          BOOL v20 = 0;
        }
        else
        {
          uint64_t v21 = [v18 serviceTypes];
          BOOL v20 = v21 == 0;
        }
        v83 = v18;
        id v22 = [v18 serviceTypes];
        int v23 = [v22 containsObject:v87];

        if (v20 || v23)
        {
          uint64_t v24 = [v4 engagementRequest];
          if (v24)
          {
            id v25 = (void *)v24;
            char v26 = objc_opt_respondsToSelector();

            if (v26)
            {
              uint64_t v27 = [v83 dispatchQueue];
              v106[0] = MEMORY[0x1E4F143A8];
              v106[1] = 3221225472;
              v106[2] = __40__AMSEngagement__handleServiceResponse___block_invoke;
              v106[3] = &unk_1E55A22D0;
              v106[4] = v89;
              v106[5] = v84;
              id v107 = v4;
              uint64_t v28 = v106;
              os_signpost_id_t v29 = AMSLogKey();
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
              unint64_t v114 = (unint64_t)&unk_1E559EAE0;
              *(void *)v115 = v29;
              *(void *)&v115[8] = v28;
              id v30 = v29;
              dispatch_async(v27, buf);
            }
          }
          uint64_t v31 = [v4 fullScreenMessageRequest];
          if (v31)
          {
            v32 = (void *)v31;
            char v33 = objc_opt_respondsToSelector();

            if (v33)
            {
              uint64_t v34 = [v83 dispatchQueue];
              v104[0] = MEMORY[0x1E4F143A8];
              v104[1] = 3221225472;
              v104[2] = __40__AMSEngagement__handleServiceResponse___block_invoke_2;
              v104[3] = &unk_1E55A22D0;
              v104[4] = v89;
              v104[5] = v84;
              id v105 = v4;
              long long v35 = v104;
              long long v36 = AMSLogKey();
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
              unint64_t v114 = (unint64_t)&unk_1E559EAE0;
              *(void *)v115 = v36;
              *(void *)&v115[8] = v35;
              id v37 = v36;
              dispatch_async(v34, buf);
            }
          }
          long long v38 = [v4 placements];

          if (v38)
          {
            os_signpost_id_t v39 = [v83 placements];
            uint64_t v40 = [v39 count];

            if (v40)
            {
              uint64_t v41 = [v83 placements];
              [v41 objectEnumerator];
            }
            else
            {
              uint64_t v41 = [v4 placements];
              [v41 keyEnumerator];
            __int16 v42 = };

            if (v42)
            {
              v81 = v42;
              uint64_t v82 = v15;
              long long v102 = 0u;
              long long v103 = 0u;
              long long v100 = 0u;
              long long v101 = 0u;
              id obj = v42;
              uint64_t v43 = [obj countByEnumeratingWithState:&v100 objects:v116 count:16];
              if (v43)
              {
                uint64_t v44 = v43;
                uint64_t v88 = *(void *)v101;
                do
                {
                  for (uint64_t i = 0; i != v44; ++i)
                  {
                    if (*(void *)v101 != v88) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v46 = *(void *)(*((void *)&v100 + 1) + 8 * i);
                    id v47 = [v4 placements];
                    __int16 v48 = [v47 objectForKeyedSubscript:v46];

                    if (v48)
                    {
                      if ([v48 presentationAction] == 1)
                      {
                        id v49 = [v48 makeDialogRequest];
                      }
                      else
                      {
                        id v49 = 0;
                      }
                      __int16 v50 = [(AMSEngagement *)v89 cacheInfo];
                      double v51 = [v4 serviceType];
                      unsigned int v52 = [v50 isBlockedWithMessageRequest:v48 placement:v46 serviceType:v51];

                      id v53 = +[AMSLogConfig sharedEngagementConfig];
                      if (!v53)
                      {
                        id v53 = +[AMSLogConfig sharedConfig];
                      }
                      uint64_t v54 = [v53 OSLogObject];
                      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                      {
                        uint64_t v55 = objc_opt_class();
                        id v56 = AMSLogKey();
                        *(_DWORD *)buf = 138544386;
                        *(void *)&uint8_t buf[4] = v55;
                        id v4 = v85;
                        *(_WORD *)&buf[12] = 2114;
                        *(void *)&buf[14] = v56;
                        *(_WORD *)&buf[22] = 2048;
                        unint64_t v114 = v52;
                        *(_WORD *)v115 = 2114;
                        *(void *)&v115[2] = v46;
                        *(_WORD *)&v115[10] = 2114;
                        *(void *)&v115[12] = v87;
                        _os_log_impl(&dword_18D554000, v54, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Cache Lookup %ld for placement %{public}@ serviceType %{public}@", buf, 0x34u);
                      }
                      if (v52)
                      {
                        id v57 = [v48 messageIdentifier];

                        if (v57)
                        {
                          os_signpost_id_t v58 = +[AMSLogConfig sharedEngagementConfig];
                          if (!v58)
                          {
                            os_signpost_id_t v58 = +[AMSLogConfig sharedConfig];
                          }
                          uint64_t v59 = [v58 OSLogObject];
                          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                          {
                            uint64_t v60 = objc_opt_class();
                            uint64_t v61 = AMSLogKey();
                            id v62 = [v48 messageIdentifier];
                            *(_DWORD *)buf = 138544386;
                            *(void *)&uint8_t buf[4] = v60;
                            *(_WORD *)&buf[12] = 2114;
                            *(void *)&buf[14] = v61;
                            *(_WORD *)&buf[22] = 2114;
                            unint64_t v114 = (unint64_t)v62;
                            *(_WORD *)v115 = 2114;
                            *(void *)&v115[2] = v46;
                            *(_WORD *)&v115[10] = 2114;
                            *(void *)&v115[12] = v87;
                            _os_log_impl(&dword_18D554000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Notifying message blocked with identifier %{public}@ for placement %{public}@ serviceType %{public}@", buf, 0x34u);
                          }
                          __int16 v63 = [(AMSEngagement *)v89 connection];
                          double v64 = [v48 messageIdentifier];
                          v112 = v64;
                          __int16 v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
                          [v63 notifyBlockedMessages:v65];

                          id v4 = v85;
                        }
                      }
                      else
                      {
                        id v66 = [v48 engagementRequest];
                        if (v66)
                        {
                        }
                        else if (objc_opt_respondsToSelector())
                        {
                          uint64_t v67 = [v83 dispatchQueue];
                          v95[0] = MEMORY[0x1E4F143A8];
                          v95[1] = 3221225472;
                          v95[2] = __40__AMSEngagement__handleServiceResponse___block_invoke_144;
                          v95[3] = &unk_1E55A2448;
                          v95[4] = v89;
                          v95[5] = v46;
                          id v96 = v87;
                          uint64_t v97 = v84;
                          id v98 = v49;
                          id v99 = v4;
                          id v68 = v95;
                          uint64_t v69 = AMSLogKey();
                          *(void *)buf = MEMORY[0x1E4F143A8];
                          *(void *)&buf[8] = 3221225472;
                          *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
                          unint64_t v114 = (unint64_t)&unk_1E559EAE0;
                          *(void *)v115 = v69;
                          *(void *)&v115[8] = v68;
                          id v70 = v69;
                          dispatch_async(v67, buf);
                        }
                        uint64_t v71 = [v48 engagementRequest];
                        if (v71)
                        {
                          BOOL v72 = (void *)v71;
                          char v73 = objc_opt_respondsToSelector();

                          if (v73)
                          {
                            v74 = [v83 dispatchQueue];
                            v90[0] = MEMORY[0x1E4F143A8];
                            v90[1] = 3221225472;
                            v90[2] = __40__AMSEngagement__handleServiceResponse___block_invoke_147;
                            v90[3] = &unk_1E55A2448;
                            v90[4] = v89;
                            v90[5] = v46;
                            id v91 = v87;
                            uint64_t v92 = v84;
                            id v93 = v48;
                            id v94 = v4;
                            v75 = v90;
                            v76 = AMSLogKey();
                            *(void *)buf = MEMORY[0x1E4F143A8];
                            *(void *)&buf[8] = 3221225472;
                            *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
                            unint64_t v114 = (unint64_t)&unk_1E559EAE0;
                            *(void *)v115 = v76;
                            *(void *)&v115[8] = v75;
                            id v77 = v76;
                            dispatch_async(v74, buf);
                          }
                        }
                      }
                    }
                  }
                  uint64_t v44 = [obj countByEnumeratingWithState:&v100 objects:v116 count:16];
                }
                while (v44);
              }

              id v11 = v79;
              uint64_t v13 = v80;
              uint64_t v14 = v78;
              __int16 v42 = v81;
              uint64_t v15 = v82;
            }
          }
        }

        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v108 objects:v117 count:16];
    }
    while (v13);
  }
}

void __40__AMSEngagement__handleServiceResponse___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = +[AMSLogConfig sharedEngagementConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = AMSLogKey();
    int v9 = 138543618;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Pushing engagement request", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 48) engagementRequest];
  [v6 engagement:v7 handleEngagementRequest:v8 completion:&__block_literal_global_137_0];
}

void __40__AMSEngagement__handleServiceResponse___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = +[AMSLogConfig sharedEngagementConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    uint64_t v14 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Pushing full screen message request", buf, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 48) fullScreenMessageRequest];
  int v9 = [v8 makeDialogRequest];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__AMSEngagement__handleServiceResponse___block_invoke_140;
  v10[3] = &unk_1E559F140;
  v10[4] = *(void *)(a1 + 32);
  [v6 engagement:v7 handleDialogRequest:v9 completion:v10];
}

uint64_t __40__AMSEngagement__handleServiceResponse___block_invoke_140(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleDialogResult:a2];
}

void __40__AMSEngagement__handleServiceResponse___block_invoke_144(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = +[AMSLogConfig sharedEngagementConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = AMSLogKey();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v13 = 138544130;
    uint64_t v14 = v4;
    __int16 v15 = 2114;
    uint64_t v16 = v5;
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    __int16 v19 = 2114;
    uint64_t v20 = v7;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Pushing dialog request for placement %{public}@ serviceType %{public}@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v8 = *(void **)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = [*(id *)(a1 + 72) serviceType];
  [v8 engagement:v10 didUpdateRequest:v9 placement:v11 serviceType:v12];
}

void __40__AMSEngagement__handleServiceResponse___block_invoke_147(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = +[AMSLogConfig sharedEngagementConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = AMSLogKey();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v13 = 138544130;
    uint64_t v14 = v4;
    __int16 v15 = 2114;
    uint64_t v16 = v5;
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    __int16 v19 = 2114;
    uint64_t v20 = v7;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Pushing engagement request for placement %{public}@ serviceType %{public}@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 56);
  uint64_t v10 = [*(id *)(a1 + 64) engagementRequest];
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = [*(id *)(a1 + 72) serviceType];
  [v9 engagement:v8 didUpdateEngagementRequest:v10 placement:v11 serviceType:v12 completion:&__block_literal_global_150_0];
}

void __28__AMSEngagement__connection__block_invoke_2()
{
  id v0 = +[AMSEngagement notificationCenter];
  [v0 postNotificationName:0x1EDCB2A88 object:0];
}

- (void)_connectionErrorNotification
{
  AMSError(12, @"Engagement Connection Failed", @"The connection encountered an error", 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(AMSEngagement *)self _failAllRunningPromisesWithError:v3];
}

id *__39__AMSEngagement__scheduleSyncIfNeeded___block_invoke(id *result)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((__hasAttemptedInitialSync & 1) == 0)
  {
    uint64_t v1 = result;
    __hasAttemptedInitialSync = 1;
    id v2 = +[AMSLogConfig sharedEngagementConfig];
    if (!v2)
    {
      id v2 = +[AMSLogConfig sharedConfig];
    }
    id v3 = [v2 OSLogObject];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = objc_opt_class();
      id v5 = AMSLogKey();
      int v6 = 138543618;
      uint64_t v7 = v4;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Scheduling initial sync", (uint8_t *)&v6, 0x16u);
    }
    return (id *)(id)[v1[4] sync];
  }
  return result;
}

+ (NSString)bagSubProfile
{
  if (qword_1EB38D850 != -1) {
    dispatch_once(&qword_1EB38D850, &__block_literal_global_167);
  }
  id v2 = (void *)qword_1EB38D858;
  return (NSString *)v2;
}

void __30__AMSEngagement_bagSubProfile__block_invoke()
{
  id v0 = (void *)qword_1EB38D858;
  qword_1EB38D858 = @"AMSCore";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D860 != -1) {
    dispatch_once(&qword_1EB38D860, &__block_literal_global_172);
  }
  id v2 = (void *)qword_1EB38D868;
  return (NSString *)v2;
}

void __37__AMSEngagement_bagSubProfileVersion__block_invoke()
{
  id v0 = (void *)qword_1EB38D868;
  qword_1EB38D868 = @"1";
}

+ (id)createBagForSubProfile
{
  id v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  uint64_t v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (void)setObserverInfo:(id)a3
{
}

- (void)setRunningPromises:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

@end