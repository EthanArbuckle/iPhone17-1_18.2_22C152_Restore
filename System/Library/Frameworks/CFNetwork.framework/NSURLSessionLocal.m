@interface NSURLSessionLocal
@end

@implementation NSURLSessionLocal

void __43____NSURLSessionLocal_removeUnresumedTask___block_invoke(uint64_t a1)
{
}

void __49____NSURLSessionLocal_task_terminatedConnection___block_invoke(uint64_t a1)
{
}

uint64_t __40____NSURLSessionLocal_taskForClassInfo___block_invoke_117(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_disavow");
}

uint64_t __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_158(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_disavow");
}

void __40____NSURLSessionLocal_taskForClassInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least()) {
    a5 = (void *)+[NSURLSession _errorFromError:forTask:]((uint64_t)NSURLSession, a5, a2);
  }
  if (a5)
  {
    os_log_type_t v8 = 16 * ([a5 code] != -999);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      v10 = *(void **)(v9 + 112);
    }
    else {
      v10 = 0;
    }
    int v11 = [v10 _loggingPrivacyLevel];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v12 = CFNLog::logger;
    BOOL v13 = os_log_type_enabled((os_log_t)CFNLog::logger, v8);
    if (v11 > 2)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543875;
        uint64_t v22 = [a2 _loggableDescription];
        __int16 v23 = 2048;
        uint64_t v24 = [a5 code];
        __int16 v25 = 2117;
        v26 = a5;
        v14 = "%{public}@ finished with error [%ld] %{sensitive}@";
        goto LABEL_17;
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = [a2 _loggableDescription];
      __int16 v23 = 2048;
      uint64_t v24 = [a5 code];
      __int16 v25 = 2112;
      v26 = a5;
      v14 = "%{public}@ finished with error [%ld] %@";
LABEL_17:
      v16 = v12;
      os_log_type_t v17 = v8;
      uint32_t v18 = 32;
      goto LABEL_18;
    }
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v15 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = [a2 _loggableDescription];
      v14 = "%{public}@ finished successfully";
      v16 = v15;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      uint32_t v18 = 12;
LABEL_18:
      _os_log_impl(&dword_184085000, v16, v17, v14, buf, v18);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 40));
  v19 = [a2 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40____NSURLSessionLocal_taskForClassInfo___block_invoke_117;
  block[3] = &unk_1E5258228;
  block[4] = a2;
  dispatch_async(v19, block);
}

void __66____NSURLSessionLocal__onqueue_configureAndCreateConnection_task___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 176) addObject:*(void *)(a1 + 40)];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 400));
  [*(id *)(*(void *)(a1 + 32) + 184) removeObject:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 400));
  if ([*(id *)(a1 + 40) state] <= 1)
  {
    id v2 = objc_alloc(*(Class *)(a1 + 48));
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = v3 ? *(void *)(v3 + 120) : 0;
    uint64_t v5 = [v2 initWithTask:*(void *)(a1 + 40) delegate:*(void *)(a1 + 40) delegateQueue:v4];
    if (v5)
    {
      id v6 = (id)v5;
      -[__NSCFLocalSessionTask setConnection:](*(void **)(a1 + 40), v5);
    }
  }
}

void __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least()) {
    a5 = (void *)+[NSURLSession _errorFromError:forTask:]((uint64_t)NSURLSession, a5, a2);
  }
  if (a5)
  {
    os_log_type_t v8 = 16 * ([a5 code] != -999);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      v10 = *(void **)(v9 + 112);
    }
    else {
      v10 = 0;
    }
    int v11 = [v10 _loggingPrivacyLevel];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v12 = CFNLog::logger;
    BOOL v13 = os_log_type_enabled((os_log_t)CFNLog::logger, v8);
    if (v11 > 2)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543875;
        uint64_t v19 = [a2 _loggableDescription];
        __int16 v20 = 2048;
        uint64_t v21 = [a5 code];
        __int16 v22 = 2117;
        __int16 v23 = a5;
        v14 = "%{public}@ finished with error [%ld] %{sensitive}@";
        goto LABEL_18;
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = [a2 _loggableDescription];
      __int16 v20 = 2048;
      uint64_t v21 = [a5 code];
      __int16 v22 = 2112;
      __int16 v23 = a5;
      v14 = "%{public}@ finished with error [%ld] %@";
LABEL_18:
      _os_log_impl(&dword_184085000, v12, v8, v14, buf, 0x20u);
    }
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v15 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = [a2 _loggableDescription];
      _os_log_impl(&dword_184085000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ finished successfully", buf, 0xCu);
    }
    +[__NSURLSessionStatistics reportMetricsToSymptoms:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 40));
  v16 = [a2 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_158;
  block[3] = &unk_1E5258228;
  block[4] = a2;
  dispatch_async(v16, block);
}

uint64_t __66____NSURLSessionLocal__getCookieHeadersForTask_completionHandler___block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  if (nw_settings_get_signposts_enabled())
  {
    if (a2) {
      CFDictionaryGetCount(a2);
    }
    kdebug_trace();
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void __40____NSURLSessionLocal_taskForClassInfo___block_invoke_3(void *a1, void *a2, int a3)
{
  if (a3)
  {
    uint64_t v5 = objc_msgSend(a2, "_onqueue_strippedMutableRequest");
    id v6 = v5;
    if (a1[4] && ![v5 valueForHTTPHeaderField:0x1EC0A2150]) {
      [v6 setValue:0x1EC0A4B50 forHTTPHeaderField:0x1EC0A2150];
    }
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[6];
    CFArrayRef v9 = (const __CFArray *)a1[7];
    -[__NSURLSessionLocal _onqueue_connectUploadTask:strippedRequest:bodyStream:bodyParts:](v7, a2, v6, v8, v9);
  }
}

void __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  if (a3) {
    -[__NSURLSessionLocal _onqueue_canonicalizeTaskAndCreateConnection:](*(void *)(a1 + 32), a2);
  }
}

void __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_3(void *a1, void *a2, int a3)
{
  if (a3)
  {
    uint64_t v5 = objc_msgSend(a2, "_onqueue_strippedMutableRequest");
    id v6 = v5;
    if (a1[4] && ![v5 valueForHTTPHeaderField:0x1EC0A2150]) {
      [v6 setValue:0x1EC0A4B50 forHTTPHeaderField:0x1EC0A2150];
    }
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[6];
    CFArrayRef v9 = (const __CFArray *)a1[7];
    -[__NSURLSessionLocal _onqueue_connectUploadTask:strippedRequest:bodyStream:bodyParts:](v7, a2, v6, v8, v9);
  }
}

void __56____NSURLSessionLocal__onqueue_invokeInvalidateCallback__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(const void **)(a1 + 32);

  _Block_release(v2);
}

void __53____NSURLSessionLocal__onqueue_completeInvalidation___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    -[NSURLSession finalizeDelegateWithError:](v2);
  }
  else
  {
    NSLog(&cfstr_AlreadyHadSome.isa, v2);
  }
}

uint64_t __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_149(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_disavow");
}

void __62____NSURLSessionLocal__onqueue_getTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
}

void __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least()) {
    a5 = (void *)+[NSURLSession _errorFromError:forTask:]((uint64_t)NSURLSession, a5, a2);
  }
  if (a5)
  {
    os_log_type_t v8 = 16 * ([a5 code] != -999);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      v10 = *(void **)(v9 + 112);
    }
    else {
      v10 = 0;
    }
    int v11 = [v10 _loggingPrivacyLevel];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v12 = CFNLog::logger;
    BOOL v13 = os_log_type_enabled((os_log_t)CFNLog::logger, v8);
    if (v11 > 2)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543875;
        uint64_t v22 = [a2 _loggableDescription];
        __int16 v23 = 2048;
        uint64_t v24 = [a5 code];
        __int16 v25 = 2117;
        v26 = a5;
        v14 = "%{public}@ finished with error [%ld] %{sensitive}@";
        goto LABEL_17;
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = [a2 _loggableDescription];
      __int16 v23 = 2048;
      uint64_t v24 = [a5 code];
      __int16 v25 = 2112;
      v26 = a5;
      v14 = "%{public}@ finished with error [%ld] %@";
LABEL_17:
      v16 = v12;
      os_log_type_t v17 = v8;
      uint32_t v18 = 32;
      goto LABEL_18;
    }
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v15 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = [a2 _loggableDescription];
      v14 = "%{public}@ finished successfully";
      v16 = v15;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      uint32_t v18 = 12;
LABEL_18:
      _os_log_impl(&dword_184085000, v16, v17, v14, buf, v18);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 40));
  uint64_t v19 = [a2 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_149;
  block[3] = &unk_1E5258228;
  block[4] = a2;
  dispatch_async(v19, block);
}

uint64_t __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(**(void **)(a1 + 40) + 48);

  return v2();
}

uint64_t __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(**(void **)(a1 + 40) + 48);

  return v2();
}

uint64_t __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_3(uint64_t a1, uint64_t a2)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_4;
  v6[3] = &unk_1E5258228;
  v6[4] = *(void *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t, void *))(*(void *)a2 + 48))(a2, v4, v6);
}

uint64_t __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_4(uint64_t a1)
{
}

id __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_3(uint64_t a1, const char *a2)
{
  id result = *(id *)(a1 + 32);
  if (result)
  {
    id result = objc_getProperty(result, a2, 808, 1);
    if (result)
    {
      uint64_t v4 = *(void **)(a1 + 32);
      return (id)objc_msgSend(v4, "_onqueue_completeInitialization");
    }
  }
  return result;
}

uint64_t __68____NSURLSessionLocal__onqueue_canonicalizeTaskAndCreateConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return -[__NSURLSessionLocal _onqueue_configureAndCreateConnection:task:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40));
  }
  else {
    return objc_msgSend(*(id *)(a1 + 40), "_onqueue_cancel");
  }
}

uint64_t __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

id __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_4(uint64_t a1, const char *a2)
{
  id result = *(id *)(a1 + 32);
  if (result)
  {
    id result = objc_getProperty(result, a2, 808, 1);
    if (result)
    {
      uint64_t v4 = *(void **)(a1 + 32);
      return (id)objc_msgSend(v4, "_onqueue_completeInitialization");
    }
  }
  return result;
}

uint64_t __87____NSURLSessionLocal__onqueue_connectUploadTask_strippedRequest_bodyStream_bodyParts___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return -[__NSURLSessionLocal _onqueue_connectUploadTask:strippedRequest:bodyStream:bodyParts:](*(void *)(a1 + 40), *(void *)(a1 + 32), *(void *)(a1 + 48), a2, 0);
  }
  else {
    return [*(id *)(a1 + 32) cancel];
  }
}

uint64_t __40____NSURLSessionLocal_taskForClassInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

id __40____NSURLSessionLocal_taskForClassInfo___block_invoke_4(uint64_t a1, const char *a2)
{
  id result = *(id *)(a1 + 32);
  if (result)
  {
    id result = objc_getProperty(result, a2, 808, 1);
    if (result)
    {
      uint64_t v4 = *(void **)(a1 + 32);
      return (id)objc_msgSend(v4, "_onqueue_completeInitialization");
    }
  }
  return result;
}

void __48____NSURLSessionLocal_removeConnectionlessTask___block_invoke(uint64_t a1)
{
}

@end