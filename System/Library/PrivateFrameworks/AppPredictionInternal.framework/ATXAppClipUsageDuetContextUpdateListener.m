@interface ATXAppClipUsageDuetContextUpdateListener
- (id)appClipUsageHandler;
- (void)startListeningWithCallback:(id)a3 clientId:(id)a4;
- (void)startListeningWithClientId:(id)a3;
@end

@implementation ATXAppClipUsageDuetContextUpdateListener

- (void)startListeningWithCallback:(id)a3 clientId:(id)a4
{
  id v8 = a4;
  v6 = _Block_copy(a3);
  id appClipUsageHandler = self->_appClipUsageHandler;
  self->_id appClipUsageHandler = v6;

  [(ATXAppClipUsageDuetContextUpdateListener *)self startListeningWithClientId:v8];
}

- (void)startListeningWithClientId:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F5B6A8] userContext];
  objc_initWeak(&location, self);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __71__ATXAppClipUsageDuetContextUpdateListener_startListeningWithClientId___block_invoke;
  v15 = &unk_1E68AFBE0;
  objc_copyWeak(&v16, &location);
  v6 = _Block_copy(&v12);
  v7 = objc_msgSend(@"com.apple.duetexpertd.ATXAppClipUsageDuetContextUpdateListener", "stringByAppendingString:", v4, v12, v13, v14, v15);
  id v8 = (void *)MEMORY[0x1E4F5B6E8];
  v9 = [MEMORY[0x1E4F5B6B8] keyPathForAppClipLaunch];
  v10 = [v8 predicateForChangeAtKeyPath:v9];

  [v10 setEvaluateOnEveryKeyPathUpdate:1];
  v11 = [MEMORY[0x1E4F5B6C8] localWakingRegistrationWithIdentifier:v7 contextualPredicate:v10 clientIdentifier:@"com.apple.duetexpertd.app-prediction" callback:v6];
  [v5 registerCallback:v11];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __71__ATXAppClipUsageDuetContextUpdateListener_startListeningWithClientId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5B700]];
    v7 = [[ATXAppClipUsageDuetEvent alloc] initWithContextValue:v6];
    if (v7)
    {
      uint64_t v8 = [WeakRetained appClipUsageHandler];
      (*(void (**)(uint64_t, ATXAppClipUsageDuetEvent *))(v8 + 16))(v8, v7);
    }
    else
    {
      uint64_t v8 = __atxlog_handle_hero();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
        __71__ATXAppClipUsageDuetContextUpdateListener_startListeningWithClientId___block_invoke_cold_1((os_log_t)v8);
      }
    }
  }
}

- (id)appClipUsageHandler
{
  return self->_appClipUsageHandler;
}

- (void).cxx_destruct
{
}

void __71__ATXAppClipUsageDuetContextUpdateListener_startListeningWithClientId___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Not updating for malformed duet event", v1, 2u);
}

@end