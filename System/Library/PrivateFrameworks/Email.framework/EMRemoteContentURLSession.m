@interface EMRemoteContentURLSession
+ (NSDictionary)genericHTTPHeaderFields;
- (EMRemoteContentURLCache)cache;
- (EMRemoteContentURLSession)initWithCache:(id)a3;
- (EMRemoteContentURLSession)initWithCache:(id)a3 sourceBundleIdentifier:(id)a4;
- (NSOperationQueue)delegateQueue;
- (NSString)sourceBundleIdentifier;
- (id)_configurationWithCache:(void *)a3 sourceBundleIdentifier:;
- (id)dataTaskWithRequest:(id)a3 isSynthetic:(BOOL)a4 allowProxying:(BOOL)a5 failOpen:(BOOL)a6 completionHandler:(id)a7;
- (id)dataTaskWithRequest:(id)a3 isSynthetic:(BOOL)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)_createURLSession;
- (void)abortTask:(id)a3;
- (void)invalidateAndCancel:(BOOL)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation EMRemoteContentURLSession

void ___ef_log_EMRemoteContentURLSession_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EMRemoteContentURLSession");
  v1 = (void *)_ef_log_EMRemoteContentURLSession_log;
  _ef_log_EMRemoteContentURLSession_log = (uint64_t)v0;
}

+ (NSDictionary)genericHTTPHeaderFields
{
  if (genericHTTPHeaderFields_onceToken != -1) {
    dispatch_once(&genericHTTPHeaderFields_onceToken, &__block_literal_global_99);
  }
  v2 = (void *)genericHTTPHeaderFields_sHeaderFields;
  return (NSDictionary *)v2;
}

void __52__EMRemoteContentURLSession_genericHTTPHeaderFields__block_invoke()
{
  os_log_t v0 = (void *)genericHTTPHeaderFields_sHeaderFields;
  genericHTTPHeaderFields_sHeaderFields = (uint64_t)&unk_1F1A62088;
}

- (EMRemoteContentURLSession)initWithCache:(id)a3 sourceBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)EMRemoteContentURLSession;
  v9 = [(EMRemoteContentURLSession *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cache, a3);
    objc_storeStrong((id *)&v10->_sourceBundleIdentifier, a4);
    id v11 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v12 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v13 = [v11 initWithObject:v12];
    activeTasks = v10->_activeTasks;
    v10->_activeTasks = (EFLocked *)v13;

    id v15 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v17 = [v15 initWithObject:v16];
    observers = v10->_observers;
    v10->_observers = (EFLocked *)v17;

    v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    delegateQueue = v10->_delegateQueue;
    v10->_delegateQueue = v19;

    [(NSOperationQueue *)v10->_delegateQueue setMaxConcurrentOperationCount:1];
    v10->_sessionLock._os_unfair_lock_opaque = 0;
    [(EMRemoteContentURLSession *)v10 _createURLSession];
  }

  return v10;
}

- (EMRemoteContentURLSession)initWithCache:(id)a3
{
  return [(EMRemoteContentURLSession *)self initWithCache:a3 sourceBundleIdentifier:0];
}

- (id)_configurationWithCache:(void *)a3 sourceBundleIdentifier:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
    a1 = v7;
    if (v5)
    {
      [v7 setRequestCachePolicy:2];
      [a1 setURLCache:v5];
    }
    objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:", v6);
    [a1 setHTTPShouldSetCookies:0];
    [a1 setHTTPCookieAcceptPolicy:1];
    [a1 setHTTPCookieStorage:0];
  }

  return a1;
}

- (id)dataTaskWithRequest:(id)a3 isSynthetic:(BOOL)a4 completionHandler:(id)a5
{
  id v5 = [(EMRemoteContentURLSession *)self dataTaskWithRequest:a3 isSynthetic:a4 allowProxying:1 failOpen:0 completionHandler:a5];
  return v5;
}

- (id)dataTaskWithRequest:(id)a3 isSynthetic:(BOOL)a4 allowProxying:(BOOL)a5 failOpen:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a7;
  os_unfair_lock_lock(&self->_sessionLock);
  id v15 = self->_session;
  os_unfair_lock_unlock(&self->_sessionLock);
  if (!v15)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:self file:@"EMRemoteContentURLSession.m" lineNumber:174 description:@"New data tasks cannot be created on EMRemoteContentURLSession after it's been invalidated."];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = [v13 mutableCopy];

    id v13 = (id)v16;
  }
  id v17 = v13;
  if (!v9
    || (objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults"),
        v18 = objc_claimAutoreleasedReturnValue(),
        char v19 = [v18 integerForKey:@"LoadRemoteContent-v2"],
        v18,
        (v19 & 4) != 0))
  {
    char v20 = 0;
  }
  else
  {
    [v17 _setKnownTracker:1];
    char v20 = 1;
    if (!v8) {
      [v17 _setPrivacyProxyFailClosed:1];
    }
  }
  [v17 _setNonAppInitiated:1];
  v21 = [(id)objc_opt_class() genericHTTPHeaderFields];
  [v17 setAllHTTPHeaderFields:v21];

  [v17 setCachePolicy:2];
  id v22 = [v17 URL];
  if (+[EMInternalPreferences preferenceEnabled:13])
  {
    v23 = [v22 absoluteString];
  }
  else
  {
    v24 = (void *)MEMORY[0x1E4F60E00];
    v25 = [v22 absoluteString];
    v23 = [v24 fullyRedactedStringForString:v25];
  }
  _ef_log_EMRemoteContentURLSession();
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = [v17 allHTTPHeaderFields];
    *(_DWORD *)buf = 134218498;
    v47 = self;
    __int16 v48 = 2114;
    v49 = v23;
    __int16 v50 = 2114;
    v51 = v27;
    _os_log_impl(&dword_1BEFDB000, v26, OS_LOG_TYPE_INFO, "[%p][Request] URL: %{public}@\nHeaders: %{public}@", buf, 0x20u);
  }
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __102__EMRemoteContentURLSession_dataTaskWithRequest_isSynthetic_allowProxying_failOpen_completionHandler___block_invoke;
  v43[3] = &__block_descriptor_34_e15___NSString_8__0l;
  char v44 = v20;
  BOOL v45 = v8;
  v28 = (void (**)(void))MEMORY[0x1C18A2160](v43);
  _ef_log_EMRemoteContentURLSession();
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = v28[2](v28);
    *(_DWORD *)buf = 134218498;
    v47 = self;
    __int16 v48 = 2112;
    v49 = v30;
    __int16 v50 = 2114;
    v51 = v23;
    _os_log_impl(&dword_1BEFDB000, v29, OS_LOG_TYPE_DEFAULT, "[%p][Proxy] %@ URL: %{public}@", buf, 0x20u);
  }
  v31 = [(NSURLSession *)v15 dataTaskWithRequest:v17];
  objc_msgSend(v31, "ec_setActivityWithDomain:type:", 21, 23);
  v32 = [[_EMRemoteContentDataTaskInfo alloc] initWithDataTask:v31 isSynthetic:v10 failOpen:v8 completion:v14];
  activeTasks = self->_activeTasks;
  uint64_t v38 = MEMORY[0x1E4F143A8];
  uint64_t v39 = 3221225472;
  v40 = __102__EMRemoteContentURLSession_dataTaskWithRequest_isSynthetic_allowProxying_failOpen_completionHandler___block_invoke_140;
  v41 = &unk_1E63E3B08;
  v34 = v32;
  v42 = v34;
  [(EFLocked *)activeTasks performWhileLocked:&v38];
  v35 = [(_EMRemoteContentDataTaskInfo *)v34 dataTask];

  return v35;
}

__CFString *__102__EMRemoteContentURLSession_dataTaskWithRequest_isSynthetic_allowProxying_failOpen_completionHandler___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 32)) {
    return @"Not proxying";
  }
  if (*(unsigned char *)(a1 + 33)) {
    return @"Proxying (fail-open)";
  }
  return @"Proxying";
}

void __102__EMRemoteContentURLSession_dataTaskWithRequest_isSynthetic_allowProxying_failOpen_completionHandler___block_invoke_140(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = [v3 dataTask];
  [v5 setObject:v3 forKeyedSubscript:v4];
}

- (void)abortTask:(id)a3
{
  id v4 = a3;
  activeTasks = self->_activeTasks;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__EMRemoteContentURLSession_abortTask___block_invoke;
  v7[3] = &unk_1E63E3B08;
  id v6 = v4;
  id v8 = v6;
  [(EFLocked *)activeTasks performWhileLocked:v7];
  [v6 cancel];
}

uint64_t __39__EMRemoteContentURLSession_abortTask___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)_createURLSession
{
  v3 = [(EMRemoteContentURLSession *)self cache];
  id v4 = [(EMRemoteContentURLSession *)self sourceBundleIdentifier];
  -[EMRemoteContentURLSession _configurationWithCache:sourceBundleIdentifier:](self, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = (void *)MEMORY[0x1E4F18DC0];
  id v6 = [(EMRemoteContentURLSession *)self delegateQueue];
  id v7 = [v5 sessionWithConfiguration:v9 delegate:self delegateQueue:v6];
  session = self->_session;
  self->_session = v7;
}

- (void)invalidateAndCancel:(BOOL)a3
{
  BOOL v3 = a3;
  p_sessionLock = &self->_sessionLock;
  os_unfair_lock_lock(&self->_sessionLock);
  id v6 = self->_session;
  os_unfair_lock_unlock(p_sessionLock);
  if (v3) {
    [(NSURLSession *)v6 invalidateAndCancel];
  }
  else {
    [(NSURLSession *)v6 finishTasksAndInvalidate];
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (NSURLSession *)a3;
  os_unfair_lock_lock(&self->_sessionLock);
  session = self->_session;

  if (session != v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"EMRemoteContentURLSession.m", 263, @"NSURLSession was invalidated, but was not our NSURLSession!" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_7:
    id v13 = self->_session;
    self->_session = 0;

    goto LABEL_8;
  }
  if (!v7) {
    goto LABEL_7;
  }
LABEL_3:
  _ef_log_EMRemoteContentURLSession();
  BOOL v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = objc_msgSend(v7, "ef_publicDescription");
    [(EMRemoteContentURLSession *)(uint64_t)self URLSession:v14 didBecomeInvalidWithError:v10];
  }

  [(EMRemoteContentURLSession *)self _createURLSession];
LABEL_8:
  os_unfair_lock_unlock(&self->_sessionLock);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  id v22 = 0;
  activeTasks = self->_activeTasks;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __64__EMRemoteContentURLSession_URLSession_dataTask_didReceiveData___block_invoke;
  id v14 = &unk_1E63E3E60;
  uint64_t v16 = &v17;
  id v10 = v7;
  id v15 = v10;
  [(EFLocked *)activeTasks performWhileLocked:&v11];
  objc_msgSend((id)v18[5], "receiveData:", v8, v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);
}

void __64__EMRemoteContentURLSession_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__12;
  v31 = __Block_byref_object_dispose__12;
  id v32 = 0;
  activeTasks = self->_activeTasks;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke;
  v24[3] = &unk_1E63E3E60;
  v26 = &v27;
  id v10 = v7;
  id v25 = v10;
  [(EFLocked *)activeTasks performWhileLocked:v24];
  if (v28[5])
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v12 = [v11 calendarIdentifier];
    char v13 = [v12 isEqualToString:*MEMORY[0x1E4F1C318]];

    id v14 = [MEMORY[0x1E4F1C9C8] date];
    id v15 = [v11 components:8760 fromDate:v14];

    uint64_t v16 = [v8 transactionMetrics];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_2;
    v18[3] = &unk_1E63E6060;
    id v22 = &v27;
    char v23 = v13;
    id v17 = v15;
    id v19 = v17;
    id v20 = v10;
    v21 = self;
    [v16 enumerateObjectsUsingBlock:v18];
  }
  _Block_object_dispose(&v27, 8);
}

void __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDidCollectMetrics:1];
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) didComplete]) {
    [v6 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

void __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_2(uint64_t a1, void *a2)
{
  v64[13] = *MEMORY[0x1E4F143B8];
  id v46 = a2;
  uint64_t v3 = [v46 _privacyStance];
  v63[0] = @"isSynthetic";
  v64[0] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isSynthetic"));
  v63[1] = @"metrics_resourceFetchType";
  char v44 = (void *)v64[0];
  v41 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v46, "resourceFetchType"));
  v64[1] = v41;
  v63[2] = @"metrics_privacyStance";
  v42 = [NSNumber numberWithUnsignedInt:v3];
  v64[2] = v42;
  v63[3] = @"metrics_isCellular";
  v40 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v46, "isCellular"));
  v64[3] = v40;
  v63[4] = @"metrics_isExpensive";
  uint64_t v39 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v46, "isExpensive"));
  v64[4] = v39;
  v63[5] = @"metrics_isConstrained";
  uint64_t v38 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v46, "isConstrained"));
  v64[5] = v38;
  v63[6] = @"metrics_countOfResponseBodyBytesAfterDecoding";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v46, "countOfResponseBodyBytesAfterDecoding"));
  v64[6] = v4;
  v63[7] = @"time_isGregorian";
  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v64[7] = v5;
  v63[8] = @"time_hour";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "hour"));
  v64[8] = v6;
  v63[9] = @"time_month";
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "month"));
  v64[9] = v7;
  v63[10] = @"time_day";
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "day"));
  v64[10] = v8;
  v63[11] = @"time_weekOfYear";
  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "weekOfYear"));
  v64[11] = v9;
  v63[12] = @"time_dayOfWeek";
  id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "weekday"));
  v64[12] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:13];

  uint64_t v51 = MEMORY[0x1E4F143A8];
  uint64_t v52 = 3221225472;
  v53 = __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_3;
  v54 = &unk_1E63E2FB0;
  v43 = v11;
  v55 = v43;
  AnalyticsSendEventLazy();
  uint64_t v12 = [*(id *)(a1 + 40) originalRequest];
  id v13 = [v12 URL];
  if (+[EMInternalPreferences preferenceEnabled:13])
  {
    BOOL v45 = [v13 absoluteString];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F60E00];
    id v15 = [v13 absoluteString];
    BOOL v45 = [v14 fullyRedactedStringForString:v15];
  }
  uint64_t v16 = _ef_log_EMRemoteContentURLSession();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v36 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218498;
    uint64_t v58 = v36;
    __int16 v59 = 2114;
    v60 = v45;
    __int16 v61 = 2114;
    v62 = v43;
    _os_log_debug_impl(&dword_1BEFDB000, v16, OS_LOG_TYPE_DEBUG, "[%p][Analytics] URL: %{public}@\n%{public}@", buf, 0x20u);
  }

  if (v3 == 1)
  {
    id v25 = [*(id *)(a1 + 40) originalRequest];
    if (![v25 _isKnownTracker])
    {
LABEL_35:

      goto LABEL_36;
    }
    char v26 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) failOpen];

    if ((v26 & 1) == 0)
    {
      id v20 = _ef_log_EMRemoteContentURLSession();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134218242;
        uint64_t v58 = v27;
        __int16 v59 = 2114;
        v60 = v45;
        _os_log_impl(&dword_1BEFDB000, v20, OS_LOG_TYPE_DEFAULT, "[%p][Proxy] Used VPN for URL: %{public}@", buf, 0x16u);
      }
      uint64_t v24 = 2;
      goto LABEL_27;
    }
  }
  else if (v3 == 3)
  {
    id v17 = [*(id *)(a1 + 40) error];
    v18 = objc_msgSend(v17, "ef_underlyingError");
    id v19 = [v18 userInfo];
    id v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F18E60]];

    v21 = (void *)nw_path_copy_parameters();
    if (v21)
    {
      id v22 = nw_parameters_copy_effective_proxy_config();
      if (v22)
      {
        if (nw_proxy_config_is_privacy_proxy())
        {

          char v23 = _ef_log_EMRemoteContentURLSession();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_2_cold_1(a1, (uint64_t)v45, v23);
          }
          uint64_t v24 = 0;
LABEL_26:

LABEL_27:
          [*(id *)(*(void *)(a1 + 48) + 24) getObject];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v25 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v29 = [v25 countByEnumeratingWithState:&v47 objects:v56 count:16];
          if (v29)
          {
            uint64_t v30 = *(void *)v48;
            do
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v48 != v30) {
                  objc_enumerationMutation(v25);
                }
                id v32 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                uint64_t v33 = *(void *)(a1 + 48);
                v34 = [v46 request];
                v35 = [v34 URL];
                [v32 remoteContentURLSession:v33 failedToProxyURL:v35 failureReason:v24];
              }
              uint64_t v29 = [v25 countByEnumeratingWithState:&v47 objects:v56 count:16];
            }
            while (v29);
          }

          goto LABEL_35;
        }
        v28 = @"effective proxy config is not privacy proxy";
      }
      else
      {
        v28 = @"no effective proxy config";
      }
    }
    else
    {
      v28 = @"no path parameters";
    }
    char v23 = _ef_log_EMRemoteContentURLSession();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      uint64_t v58 = v37;
      __int16 v59 = 2114;
      v60 = v28;
      __int16 v61 = 2114;
      v62 = v45;
      _os_log_error_impl(&dword_1BEFDB000, v23, OS_LOG_TYPE_ERROR, "[%p][Proxy] Unavailable for URL (%{public}@): %{public}@", buf, 0x20u);
    }
    uint64_t v24 = 1;
    goto LABEL_26;
  }
LABEL_36:
}

id __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__12;
  char v44 = __Block_byref_object_dispose__12;
  id v45 = 0;
  activeTasks = self->_activeTasks;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __66__EMRemoteContentURLSession_URLSession_task_didCompleteWithError___block_invoke;
  v37[3] = &unk_1E63E3E60;
  uint64_t v39 = &v40;
  id v10 = v7;
  id v38 = v10;
  [(EFLocked *)activeTasks performWhileLocked:v37];
  if (!v41[5]) {
    goto LABEL_25;
  }
  uint64_t v11 = [v10 originalRequest];
  id v12 = [v11 URL];
  if (+[EMInternalPreferences preferenceEnabled:13])
  {
    id v13 = [v12 absoluteString];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F60E00];
    id v15 = [v12 absoluteString];
    id v13 = [v14 fullyRedactedStringForString:v15];
  }
  uint64_t v16 = [v10 response];
  if (v8)
  {
    _ef_log_EMRemoteContentURLSession();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(v8, "ef_publicDescription");
      *(_DWORD *)buf = 134218498;
      long long v47 = self;
      __int16 v48 = 2114;
      long long v49 = v13;
      __int16 v50 = 2114;
      uint64_t v51 = (uint64_t)v18;
      _os_log_impl(&dword_1BEFDB000, v17, OS_LOG_TYPE_INFO, "[%p][Error] URL: %{public}@\nError: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    char v19 = objc_opt_respondsToSelector();
    id v20 = _ef_log_EMRemoteContentURLSession();
    id v17 = v20;
    if ((v19 & 1) == 0)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        long long v47 = self;
        __int16 v48 = 2114;
        long long v49 = v13;
        _os_log_impl(&dword_1BEFDB000, v17, OS_LOG_TYPE_INFO, "[%p][Response] URL: %{public}@", buf, 0x16u);
      }
      goto LABEL_15;
    }
    id v17 = v20;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = [v16 statusCode];
      id v22 = [v16 _allHTTPHeaderFieldsAsArrays];
      *(_DWORD *)buf = 134218754;
      long long v47 = self;
      __int16 v48 = 2114;
      long long v49 = v13;
      __int16 v50 = 2048;
      uint64_t v51 = v21;
      __int16 v52 = 2114;
      v53 = v22;
      _os_log_impl(&dword_1BEFDB000, v17, OS_LOG_TYPE_INFO, "[%p][Response] URL: %{public}@\nStatus Code: %ld\nHeaders: %{public}@", buf, 0x2Au);
    }
  }

LABEL_15:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v10;
    if (v8 || !v16)
    {
      char v26 = [v8 domain];
      if ([v26 isEqualToString:*MEMORY[0x1E4F289A0]])
      {
        BOOL v27 = [v8 code] == -999;

        if (v27)
        {
          v28 = [(EMRemoteContentURLSession *)self cache];
          uint64_t v29 = MEMORY[0x1E4F143A8];
          uint64_t v30 = 3221225472;
          v31 = __66__EMRemoteContentURLSession_URLSession_task_didCompleteWithError___block_invoke_208;
          id v32 = &unk_1E63E6088;
          uint64_t v33 = self;
          id v34 = v13;
          [v28 storeCancelationIfNeededForDataTask:v23 completionHandler:&v29];
        }
      }
      else
      {
      }
    }
    else
    {
      uint64_t v24 = [(EMRemoteContentURLSession *)self cache];
      id v25 = [(id)v41[5] data];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __66__EMRemoteContentURLSession_URLSession_task_didCompleteWithError___block_invoke_206;
      v35[3] = &unk_1E63E6088;
      v35[4] = self;
      id v36 = v13;
      [v24 storeResponseIfNeeded:v16 withData:v25 forDataTask:v23 completionHandler:v35];
    }
  }
  objc_msgSend((id)v41[5], "finishWithError:", v8, v29, v30, v31, v32, v33);

LABEL_25:
  _Block_object_dispose(&v40, 8);
}

void __66__EMRemoteContentURLSession_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDidComplete:1];
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) didCollectMetrics]) {
    [v6 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

void __66__EMRemoteContentURLSession_URLSession_task_didCompleteWithError___block_invoke_206(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = _ef_log_EMRemoteContentURLSession();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 134218242;
      uint64_t v7 = v4;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_INFO, "[%p][Cache] Forced caching of response for URL: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void __66__EMRemoteContentURLSession_URLSession_task_didCompleteWithError___block_invoke_208(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = _ef_log_EMRemoteContentURLSession();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 134218242;
      uint64_t v7 = v4;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_INFO, "[%p][Cache] Forced caching of cancelation for URL: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__EMRemoteContentURLSession_registerObserver___block_invoke;
  v7[3] = &unk_1E63E33A8;
  id v8 = v4;
  id v6 = v4;
  [(EFLocked *)observers performWhileLocked:v7];
}

uint64_t __46__EMRemoteContentURLSession_registerObserver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__EMRemoteContentURLSession_unregisterObserver___block_invoke;
  v7[3] = &unk_1E63E33A8;
  id v8 = v4;
  id v6 = v4;
  [(EFLocked *)observers performWhileLocked:v7];
}

uint64_t __48__EMRemoteContentURLSession_unregisterObserver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (EMRemoteContentURLCache)cache
{
  return self->_cache;
}

- (NSOperationQueue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)URLSession:(uint8_t *)buf didBecomeInvalidWithError:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "[%p][Session] Session was invalidated with error: %{public}@", buf, 0x16u);
}

void __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "[%p][Proxy] Failed for URL: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end