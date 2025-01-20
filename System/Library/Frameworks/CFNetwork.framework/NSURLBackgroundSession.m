@interface NSURLBackgroundSession
@end

@implementation NSURLBackgroundSession

uint64_t __41____NSURLBackgroundSession_cleanupConfig__block_invoke(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([a2 HTTPAdditionalHeaders])
  {
    v4 = objc_msgSend((id)objc_msgSend(a2, "HTTPAdditionalHeaders"), "mutableCopy");
    v5 = v4;
    if (!a1[6]) {
      [v4 setObject:a1[4] forKeyedSubscript:0x1EC0A2B28];
    }
    if (!a1[7]) {
      [v5 setObject:a1[5] forKeyedSubscript:0x1EC0A1E40];
    }
    id v6 = v5;
    return [a2 setHTTPAdditionalHeaders:v6];
  }
  else
  {
    v8[0] = 0x1EC0A2B28;
    v8[1] = 0x1EC0A1E40;
    long long v9 = *((_OWORD *)a1 + 2);
    return objc_msgSend(a2, "setHTTPAdditionalHeaders:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v9, v8, 2));
  }
}

void __50____NSURLBackgroundSession_recreateExistingTasks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = [a2 unsignedIntegerValue];
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "identifier"))))
  {
    id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "identifier")));
    objc_msgSend(v6, "setCountOfBytesReceived:", objc_msgSend(a3, "countOfBytesReceived"));
    objc_msgSend(v6, "setCountOfBytesExpectedToReceive:", objc_msgSend(a3, "countOfBytesExpectedToReceive"));
    objc_msgSend(v6, "setCountOfBytesSent:", objc_msgSend(a3, "countOfBytesSent"));
    objc_msgSend(v6, "setCountOfBytesExpectedToSend:", objc_msgSend(a3, "countOfBytesExpectedToSend"));
    if ([a3 taskKind] != 3 && objc_msgSend(a3, "taskKind") != 5)
    {
      objc_msgSend(v6, "setResponse:", objc_msgSend(a3, "response"));
      uint64_t v7 = [a3 currentRequest];
      [v6 updateCurrentRequest:v7];
    }
    return;
  }
  if ([a3 taskKind])
  {
    if ([a3 taskKind] == 1)
    {
      v8 = off_1E5250E88;
    }
    else if ([a3 taskKind] == 2)
    {
      v8 = off_1E5250E78;
    }
    else if ([a3 taskKind] == 3)
    {
      v8 = off_1E5250E70;
    }
    else if ([a3 taskKind] == 5)
    {
      v8 = off_1E5250E68;
    }
    else
    {
      if ([a3 taskKind] != 4)
      {
        long long v9 = 0;
        goto LABEL_20;
      }
      v8 = off_1E5250E60;
    }
  }
  else
  {
    v8 = off_1E5250E80;
  }
  long long v9 = objc_msgSend(objc_alloc(*v8), "initWithTaskInfo:taskGroup:ident:", a3, objc_msgSend(*(id *)(a1 + 32), "defaultTaskGroup"), v5);
LABEL_20:
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "taskIdentifier"));
  if (v9) {
    [*(id *)(*(void *)(a1 + 32) + 184) setObject:v9 forKeyedSubscript:v10];
  }

  uint64_t v11 = *(void *)(a1 + 32);
  unint64_t v12 = *(void *)(v11 + 160);
  if (v5 >= v12) {
    unint64_t v12 = v5 + 1;
  }
  *(void *)(v11 + 160) = v12;
}

uint64_t __52____NSURLBackgroundSession_backgroundTaskDidResume___block_invoke(uint64_t a1)
{
  v1 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));

  return [v1 setState:0];
}

void __87____NSURLBackgroundSession_backgroundTask_didCompleteWithError_taskMetrics_info_reply___block_invoke(uint64_t a1)
{
  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 72));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    v4 = *(void **)(v3 + 112);
  }
  else {
    v4 = 0;
  }
  if ([v4 _allowsRetryForBackgroundDataTasks]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t v5 = (void *)[*(id *)(a1 + 40) domain],
        [v5 isEqualToString:*MEMORY[0x1E4F289A0]])
    && [*(id *)(a1 + 40) code] == -997)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 72);
    -[__NSURLBackgroundSession _onqueue_retryDataTaskWithIdentifier:](v6, v7);
  }
  else
  {
    objc_msgSend(v2, "set_metrics:", *(void *)(a1 + 48));
    long long v9 = *(void **)(a1 + 48);
    if (v9) {
      id Property = objc_getProperty(v9, v8, 96, 1);
    }
    else {
      id Property = 0;
    }
    objc_msgSend(v2, "set_backgroundTransactionMetrics:", Property);
    unint64_t v12 = *(void **)(a1 + 48);
    if (v12) {
      id v13 = objc_getProperty(v12, v11, 96, 1);
    }
    else {
      id v13 = 0;
    }
    [v2 _logUnlistedTracker:v13];
    objc_msgSend(v2, "set_trailers:", objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", @"trailers"));
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      -[__NSURLBackgroundSession setCookiesFromResponse:forCurrentRequest:partitionIdentifier:](*(void *)(a1 + 32), (void *)[v2 response], objc_msgSend(v2, "currentRequest"), objc_msgSend(v2, "_storagePartitionIdentifier"));
    }
    [v2 _finishProgressReporting];
    if (*(void *)(a1 + 48))
    {
      if (v2)
      {
        uint64_t v14 = (uint64_t)v2[88];
        if (!v14) {
          uint64_t v14 = (uint64_t)v2[87];
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      v15 = -[NSURLSessionTaskMetrics initWithMetrics:]((id *)[NSURLSessionTaskMetrics alloc], *(void **)(a1 + 48));
      -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:](v14, v2, v15, &__block_literal_global_233);
    }
    objc_msgSend(v2, "_onqueue_didFinishWithError:", *(void *)(a1 + 40));
    v16 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v16();
  }
}

uint64_t __47____NSURLBackgroundSession_cameIntoForeground___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 112);
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  unint64_t v5 = CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        uint64_t v7 = *(void *)(v7 + 128);
      }
      *(_DWORD *)uint64_t v11 = 138543362;
      *(void *)&v11[4] = v7;
      v8 = "ProxySession <%{public}@> client transitioning to foreground";
LABEL_14:
      _os_log_impl(&dword_184085000, v5, OS_LOG_TYPE_DEFAULT, v8, v11, 0xCu);
    }
  }
  else if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    *(_DWORD *)uint64_t v11 = 138543362;
    *(void *)&v11[4] = v9;
    v8 = "BackgroundSession <%{public}@> client transitioning to foreground";
    goto LABEL_14;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 281) = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 176), "remoteObjectProxy", *(_OWORD *)v11), "boost");
  return -[__NSURLBackgroundSession ensureRemoteSession](*(void *)(a1 + 32));
}

void __68____NSURLBackgroundSession_performBlockOnQueueAndRethrowExceptions___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 168);
  if (v3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68____NSURLBackgroundSession_performBlockOnQueueAndRethrowExceptions___block_invoke_2;
    v14[3] = &unk_1E5254040;
    v14[4] = &v15;
    objc_msgSend((id)objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v14), "pingForXPCObjectValidityWithReply:", &__block_literal_global_5165);
    uint64_t v2 = *(void *)(a1 + 32);
    if (*((unsigned char *)v16 + 24))
    {
      [*(id *)(v2 + 176) invalidate];

      *(void *)(*(void *)(a1 + 32) + 176) = 0;
      *(void *)(*(void *)(a1 + 32) + 168) = 0;
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  if (*(unsigned char *)(v2 + 280) || *((unsigned char *)v16 + 24))
  {
    if ([*(id *)(v2 + 112) _isProxySession])
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      int v4 = CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        uint64_t v6 = *(void *)(v5 + 128);
      }
      else {
        uint64_t v6 = 0;
      }
      if (*(unsigned char *)(v5 + 280)) {
        int v7 = 89;
      }
      else {
        int v7 = 78;
      }
      if (*((unsigned char *)v16 + 24)) {
        int v8 = 89;
      }
      else {
        int v8 = 78;
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v6;
      __int16 v21 = 1024;
      int v22 = v7;
      __int16 v23 = 1024;
      int v24 = v8;
      uint64_t v9 = "ProxySession <%{public}@> attempting to reconnect to background transfer daemon prior to NSURLSessionTask cre"
           "ation, reconnect=%c, invalid=%c";
    }
    else
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      int v4 = CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        uint64_t v11 = *(void *)(v10 + 128);
      }
      else {
        uint64_t v11 = 0;
      }
      if (*(unsigned char *)(v10 + 280)) {
        int v12 = 89;
      }
      else {
        int v12 = 78;
      }
      if (*((unsigned char *)v16 + 24)) {
        int v13 = 89;
      }
      else {
        int v13 = 78;
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v11;
      __int16 v21 = 1024;
      int v22 = v12;
      __int16 v23 = 1024;
      int v24 = v13;
      uint64_t v9 = "BackgroundSession <%{public}@> attempting to reconnect to background transfer daemon prior to NSURLSessionTas"
           "k creation, reconnect=%c, invalid=%c";
    }
    _os_log_impl(&dword_184085000, v4, OS_LOG_TYPE_DEFAULT, v9, buf, 0x18u);
LABEL_32:
    -[__NSURLBackgroundSession setupXPCConnection](*(void *)(a1 + 32));
    -[__NSURLBackgroundSession setupBackgroundSession](*(void *)(a1 + 32));
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_object_dispose(&v15, 8);
}

__NSCFBackgroundDataTask *__54____NSURLBackgroundSession__dataTaskWithTaskForClass___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3)
  {
LABEL_27:
    result = 0;
    goto LABEL_28;
  }
  int v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id Property = objc_getProperty(*(id *)(a1 + 40), a2, 16, 1);
    id v7 = objc_getProperty(v4, v6, 48, 1);
  }
  else
  {
    id Property = 0;
    id v7 = 0;
  }
  -[__NSURLBackgroundSession validateSerializabilityForRequest:completion:]((uint64_t)Property, (uint64_t)v7);
  if ([Property _isSafeRequestForBackgroundDownload])
  {
    if (!Property)
    {
      if (dyld_program_sdk_at_least()) {
        __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(&cfstr_CannotCreateTa.isa);
      }
      goto LABEL_27;
    }
    if (*(unsigned char *)(v3 + 265))
    {
      int v8 = [*(id *)(v3 + 112) _isProxySession];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      uint64_t v9 = CFNLog::logger;
      BOOL v10 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v8)
      {
        if (!v10) {
          goto LABEL_26;
        }
        uint64_t v11 = *(void *)(v3 + 128);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v11;
        int v12 = "ProxySession <%{public}@> attempted to create a NSURLSessionDataTask in a session that has been invalidated";
      }
      else
      {
        if (!v10) {
          goto LABEL_26;
        }
        uint64_t v44 = *(void *)(v3 + 128);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v44;
        int v12 = "BackgroundSession <%{public}@> attempted to create a NSURLSessionDataTask in a session that has been invalidated";
      }
      _os_log_error_impl(&dword_184085000, v9, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
LABEL_26:
      uint64_t v25 = (NSString *)dyld_program_sdk_at_least();
      if (v25) {
        __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v25);
      }
      goto LABEL_27;
    }
    if (*(void *)(v3 + 272))
    {
      int v24 = (objc_class *)objc_opt_class();
      result = (__NSCFBackgroundDataTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]((void *)v3, v24, *(void **)(v3 + 272));
      goto LABEL_28;
    }
    v26 = [__NSCFBackgroundDataTask alloc];
    uint64_t v27 = *(void *)(v3 + 160);
    *(void *)(v3 + 160) = v27 + 1;
    v29 = -[__NSCFBackgroundDataTask initWithOriginalRequest:ident:taskGroup:](v26, "initWithOriginalRequest:ident:taskGroup:", Property, v27, [(id)v3 defaultTaskGroup]);
    if (v4 && objc_getProperty(v4, v28, 24, 1)) {
      [(NSURLSessionTask *)v29 set_uniqueIdentifier:objc_getProperty(v4, v30, 24, 1)];
    }
    [(NSURLSessionTask *)v29 updateCurrentRequest:Property];
    v31 = *(void **)(v3 + 168);
    if (v31)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __62____NSURLBackgroundSession__onqueue_dataTaskWithTaskForClass___block_invoke;
      v48 = &unk_1E5254090;
      uint64_t v49 = v3;
      v50 = v29;
      id v51 = Property;
      v32 = (void *)[v31 synchronousRemoteObjectProxyWithErrorHandler:buf];
      uint64_t v33 = [(NSURLSessionTask *)v29 taskIdentifier];
      uint64_t v34 = [(NSURLSessionTask *)v29 _uniqueIdentifier];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __62____NSURLBackgroundSession__onqueue_dataTaskWithTaskForClass___block_invoke_118;
      v46[3] = &unk_1E52540B8;
      v46[4] = v29;
      v46[5] = v3;
      v46[6] = Property;
      [v32 dataTaskWithRequest:Property originalRequest:Property identifier:v33 uniqueIdentifier:v34 reply:v46];
      if (!v29)
      {
LABEL_46:
        result = v29;
        goto LABEL_28;
      }
LABEL_43:
      objc_msgSend(*(id *)(v3 + 184), "setObject:forKeyedSubscript:", v29, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](v29, "taskIdentifier")));
      uint64_t internalDelegateWrapper = (uint64_t)v29->super.super._internalDelegateWrapper;
      if (!internalDelegateWrapper) {
        uint64_t internalDelegateWrapper = (uint64_t)v29->super.super._publicDelegateWrapper;
      }
      -[__NSCFURLSessionDelegateWrapper didCreateTask:](internalDelegateWrapper, v29);
      goto LABEL_46;
    }
    int v35 = [*(id *)(v3 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v36 = CFNLog::logger;
    BOOL v37 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        uint64_t v38 = *(void *)(v3 + 128);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v38;
        v39 = "ProxySession <%{public}@> failed to create a background NSURLSessionDataTask, as remote session is unavailable";
LABEL_50:
        _os_log_error_impl(&dword_184085000, v36, OS_LOG_TYPE_ERROR, v39, buf, 0xCu);
      }
    }
    else if (v37)
    {
      uint64_t v45 = *(void *)(v3 + 128);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v45;
      v39 = "BackgroundSession <%{public}@> failed to create a background NSURLSessionDataTask, as remote session is unavailable";
      goto LABEL_50;
    }
    uint64_t v40 = [Property URL];
    v41 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, v40);
    if (!v29) {
      goto LABEL_46;
    }
    objc_setProperty_atomic(v29, v42, v41, 776);
    goto LABEL_43;
  }
  int v13 = [*(id *)(v3 + 112) _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v14 = CFNLog::logger;
  BOOL v15 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      uint64_t v16 = *(void *)(v3 + 128);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = objc_msgSend((id)objc_msgSend(Property, "URL"), "scheme");
      uint64_t v17 = "ProxySession <%{public}@> Invalid URL scheme for background tasks: %@. Valid schemes are http or https";
LABEL_19:
      _os_log_impl(&dword_184085000, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);
    }
  }
  else if (v15)
  {
    uint64_t v18 = *(void *)(v3 + 128);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = objc_msgSend((id)objc_msgSend(Property, "URL"), "scheme");
    uint64_t v17 = "BackgroundSession <%{public}@> Invalid URL scheme for background tasks: %@. Valid schemes are http or https";
    goto LABEL_19;
  }
  v19 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v20 = [Property URL];
  __int16 v21 = objc_msgSend(v19, "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1002, v20);
  int v22 = (objc_class *)objc_opt_class();
  result = (__NSCFBackgroundDataTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]((void *)v3, v22, v21);
LABEL_28:
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

uint64_t __56____NSURLBackgroundSession__uploadTaskWithTaskForClass___block_invoke(uint64_t result, const char *a2)
{
  uint64_t v2 = result;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(__NSCFBackgroundUploadTask **)(result + 32);
  if (v3)
  {
    int v4 = *(__NSCFResumableUploadState **)(result + 40);
    if (v4)
    {
      id Property = objc_getProperty(*(id *)(result + 40), a2, 16, 1);
      id v7 = (NSURL *)objc_getProperty(v4, v6, 32, 1);
      id v9 = objc_getProperty(v4, v8, 40, 1);
      id v11 = objc_getProperty(v4, v10, 48, 1);
    }
    else
    {
      id v9 = 0;
      id Property = 0;
      id v7 = 0;
      id v11 = 0;
    }
    if (![Property HTTPBody] && !objc_msgSend(Property, "HTTPBodyStream")) {
      goto LABEL_17;
    }
    if (__CFNIsRunningInXcode::envCheckOnce != -1) {
      dispatch_once(&__CFNIsRunningInXcode::envCheckOnce, &__block_literal_global_43);
    }
    if (__CFNIsRunningInXcode::runningInXcode == 1)
    {
      if (__CFNRuntimeIssuesLogHandle::onceToken != -1) {
        dispatch_once(&__CFNRuntimeIssuesLogHandle::onceToken, &__block_literal_global_6_5515);
      }
      int v13 = __CFNRuntimeIssuesLogHandle::logger;
      if (os_log_type_enabled((os_log_t)__CFNRuntimeIssuesLogHandle::logger, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
      }
    }
    if ([Property HTTPBody]
      && (unint64_t)objc_msgSend((id)objc_msgSend(Property, "HTTPBody"), "length") > 0x4000)
    {
      id v14 = (id)[Property mutableCopy];
      [v14 setHTTPBody:0];
      if (v7)
      {
        char v15 = 0;
      }
      else
      {
        uint64_t v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "temporaryDirectory");
        id v7 = (NSURL *)objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), 0);
        objc_msgSend((id)objc_msgSend(Property, "HTTPBody"), "writeToURL:atomically:", v7, 0);
        char v15 = 1;
      }
      id Property = v14;
    }
    else
    {
LABEL_17:
      char v15 = 0;
    }
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v99 = __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke;
    v100 = &unk_1E5258080;
    char v102 = v15;
    v101 = v7;
    if (v4)
    {
      id v17 = objc_getProperty(v4, v12, 64, 1);
      if (v17)
      {
        uint64_t v18 = +[__NSCFResumableUploadState rusWithResumeData:]((uint64_t)__NSCFResumableUploadState, v17);
        int v4 = v18;
        if (!v18)
        {
          if ([*(id *)&v3->super.super.super._allowsConstrainedOverride _isProxySession])
          {
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
            }
            __int16 v23 = CFNLog::logger;
            if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR)) {
              goto LABEL_59;
            }
            uint64_t v24 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v24;
            uint64_t v25 = "ProxySession <%{public}@> Cannot create upload task with corrupt resume data";
          }
          else
          {
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
            }
            __int16 v23 = CFNLog::logger;
            if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR)) {
              goto LABEL_59;
            }
            uint64_t v62 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v62;
            uint64_t v25 = "BackgroundSession <%{public}@> Cannot create upload task with corrupt resume data";
          }
          _os_log_error_impl(&dword_184085000, v23, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&buf, 0xCu);
LABEL_59:
          uint64_t v3 = 0;
          goto LABEL_60;
        }
        id Property = objc_getProperty(v18, v19, 32, 1);
        int bodyType = v4->_bodyType;
        if (bodyType)
        {
          if (bodyType == 1) {
            id v7 = [(__NSCFResumableUploadState *)v4 uploadFile];
          }
        }
        else
        {
          id v9 = objc_getProperty(v4, v20, 40, 1);
        }
        char v22 = 0;
LABEL_35:
        -[__NSURLBackgroundSession validateSerializabilityForRequest:completion:]((uint64_t)Property, (uint64_t)v11);
        if (v7)
        {
          if ([(NSURL *)v7 isFileURL])
          {
            if ([(NSURL *)v7 _isSafeFileForBackgroundUploadForMe]) {
              goto LABEL_38;
            }
            v86 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v87 = [NSString stringWithFormat:@"Cannot read file at %@", v7];
          }
          else
          {
            v86 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v87 = [NSString stringWithFormat:@"%@ is not a valid file:// url", v7];
          }
          v88 = (void *)[v86 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v87 userInfo:0];
          goto LABEL_164;
        }
LABEL_38:
        char v26 = v22 ^ 1;
        if (Property) {
          char v26 = 1;
        }
        if ((v26 & 1) == 0)
        {
          if (dyld_program_sdk_at_least()) {
            __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(&cfstr_CannotCreateUp.isa);
          }
          goto LABEL_59;
        }
        if (BYTE1(v3->super.super.super._resumableUploadState))
        {
          if ([*(id *)&v3->super.super.super._allowsConstrainedOverride _isProxySession])
          {
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
            }
            uint64_t v27 = CFNLog::logger;
            if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR)) {
              goto LABEL_54;
            }
            uint64_t v28 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v28;
            v29 = "ProxySession <%{public}@> attempted to create a NSURLSessionUploadTask in a session that has been invalidated";
          }
          else
          {
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
            }
            uint64_t v27 = CFNLog::logger;
            if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR)) {
              goto LABEL_54;
            }
            uint64_t v61 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v61;
            v29 = "BackgroundSession <%{public}@> attempted to create a NSURLSessionUploadTask in a session that has been invalidated";
          }
          _os_log_error_impl(&dword_184085000, v27, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&buf, 0xCu);
LABEL_54:
          v31 = (NSString *)dyld_program_sdk_at_least();
          if (v31) {
            __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v31);
          }
          goto LABEL_59;
        }
        if (*(void *)&v3->super.super.super._startTime)
        {
          v30 = (objc_class *)objc_opt_class();
          uint64_t v3 = (__NSCFBackgroundUploadTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:](v3, v30, *(void **)&v3->super.super.super._startTime);
LABEL_60:
          result = v99((uint64_t)v98);
          goto LABEL_61;
        }
        if (v7 || !v9)
        {
          v32 = [__NSCFBackgroundUploadTask alloc];
          uint64_t originalRequest = (uint64_t)v3->super.super.super._originalRequest;
          v3->super.super.super._uint64_t originalRequest = (NSURLRequest *)(originalRequest + 1);
          uint64_t v34 = [(__NSCFBackgroundDataTask *)v32 initWithOriginalRequest:Property ident:originalRequest taskGroup:[(__NSCFBackgroundUploadTask *)v3 defaultTaskGroup]];
          v36 = v34;
          if (v34) {
            objc_setProperty_atomic_copy(v34, v35, v7, 848);
          }
          [(NSURLSessionTask *)v36 updateCurrentRequest:Property];
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v115 = 0x3812000000;
          v116 = __Block_byref_object_copy__131;
          uint64_t v118 = 0;
          v119 = 0;
          v117 = __Block_byref_object_dispose__132;
          uint32_t multiuser_mode = 0;
          if (!host_check_multiuser_mode(0, &multiuser_mode) && multiuser_mode)
          {
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
            uint64_t v38 = *(const void **)(*((void *)&buf + 1) + 48);
            *(void *)(*((void *)&buf + 1) + 48) = Mutable;
            if (v38) {
              CFRelease(v38);
            }
            uint64_t v39 = objc_msgSend((id)objc_msgSend(Property, "URL"), "host");
            uint64_t v40 = objc_msgSend((id)objc_msgSend(Property, "URL"), "scheme");
            if (v39)
            {
              v41 = v40;
              if (v40)
              {
                int v90 = [v40 isEqualToString:@"http"];
                int v42 = [v41 isEqualToString:@"https"];
                char v43 = v42;
                if ((v90 | v42) == 1)
                {
                  uint64_t v44 = [+[NSURLCredentialStorage sharedCredentialStorage] allCredentials];
                  if (v44)
                  {
                    v94[0] = MEMORY[0x1E4F143A8];
                    v94[1] = 3221225472;
                    v94[2] = __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_140;
                    v94[3] = &unk_1E52540F0;
                    char v95 = v43;
                    char v96 = v90;
                    v94[4] = v39;
                    v94[5] = &buf;
                    [(NSDictionary *)v44 enumerateKeysAndObjectsUsingBlock:v94];
                  }
                }
              }
            }
          }
          currentRequest = v3->super.super.super._currentRequest;
          if (currentRequest)
          {
            *(void *)&long long v108 = MEMORY[0x1E4F143A8];
            *((void *)&v108 + 1) = 3221225472;
            v109 = __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_2;
            v110 = &unk_1E5254090;
            v111 = v3;
            v112 = v36;
            id v113 = Property;
            v91 = (void *)[(NSURLRequest *)currentRequest synchronousRemoteObjectProxyWithErrorHandler:&v108];
            if (!v7)
            {
              uint64_t v89 = 0;
LABEL_139:
              CFDictionaryRef v72 = *(const __CFDictionary **)(*((void *)&buf + 1) + 48);
              if (v72 && CFDictionaryGetCount(v72) >= 1) {
                uint64_t v73 = *(void *)(*((void *)&buf + 1) + 48);
              }
              else {
                uint64_t v73 = 0;
              }
              if (v22)
              {
                uint64_t v74 = [(NSURLSessionTask *)v36 taskIdentifier];
                uint64_t v75 = [(NSURLSessionTask *)v36 _uniqueIdentifier];
                *(void *)v103 = MEMORY[0x1E4F143A8];
                *(void *)&v103[8] = 3221225472;
                *(void *)&v103[16] = __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_2_146;
                v104 = (NSURL *)&unk_1E52540B8;
                v105 = v36;
                v106 = v3;
                id v107 = Property;
                [v91 uploadTaskWithRequest:Property originalRequest:Property fromFile:v7 sandboxExtensionData:v89 identifier:v74 uniqueIdentifier:v75 potentialCredentials:v73 reply:v103];
              }
              else
              {
                uint64_t v76 = [(NSURLSessionTask *)v36 taskIdentifier];
                uint64_t v77 = [(NSURLSessionTask *)v36 _uniqueIdentifier];
                *(void *)v103 = MEMORY[0x1E4F143A8];
                *(void *)&v103[8] = 3221225472;
                *(void *)&v103[16] = __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_145;
                v104 = (NSURL *)&unk_1E52540B8;
                v105 = v36;
                v106 = v3;
                id v107 = Property;
                [v91 uploadTaskWithResumableUploadState:v4 request:Property originalRequest:Property fromFile:v7 sandboxExtensionData:v89 identifier:v76 uniqueIdentifier:v77 potentialCredentials:v73 reply:v103];
              }

              if (v36)
              {
LABEL_147:
                objc_msgSend((id)v3->super.super.super._countOfBytesClientExpectsToSend, "setObject:forKeyedSubscript:", v36, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](v36, "taskIdentifier")));
                uint64_t internalDelegateWrapper = (uint64_t)v36->super.super.super._internalDelegateWrapper;
                if (!internalDelegateWrapper) {
                  uint64_t internalDelegateWrapper = (uint64_t)v36->super.super.super._publicDelegateWrapper;
                }
                goto LABEL_150;
              }
              goto LABEL_149;
            }
            [(NSURL *)v7 fileSystemRepresentation];
            v46 = (const char *)sandbox_extension_issue_file();
            if ([*(id *)&v3->super.super.super._allowsConstrainedOverride _isProxySession])
            {
              if (CFNLog::onceToken != -1) {
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
              }
              v47 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v48 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
                *(_DWORD *)v103 = 138544130;
                *(void *)&v103[4] = v48;
                *(_WORD *)&v103[12] = 2114;
                *(void *)&v103[14] = v36;
                *(_WORD *)&v103[22] = 2112;
                v104 = v7;
                LOWORD(v105) = 1024;
                *(_DWORD *)((char *)&v105 + 2) = v46 != 0;
                uint64_t v49 = "ProxySession <%{public}@> %{public}@ issued sandbox extension for file %@, succeeded = %{BOOL}d";
LABEL_92:
                _os_log_impl(&dword_184085000, v47, OS_LOG_TYPE_DEFAULT, v49, v103, 0x26u);
              }
            }
            else
            {
              if (CFNLog::onceToken != -1) {
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
              }
              v47 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v53 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
                *(_DWORD *)v103 = 138544130;
                *(void *)&v103[4] = v53;
                *(_WORD *)&v103[12] = 2114;
                *(void *)&v103[14] = v36;
                *(_WORD *)&v103[22] = 2112;
                v104 = v7;
                LOWORD(v105) = 1024;
                *(_DWORD *)((char *)&v105 + 2) = v46 != 0;
                uint64_t v49 = "BackgroundSession <%{public}@> %{public}@ issued sandbox extension for file %@, succeeded = %{BOOL}d";
                goto LABEL_92;
              }
            }
            if (v46)
            {
              uint64_t v89 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v46 length:strlen(v46) + 1];
              goto LABEL_113;
            }
            if ([*(id *)&v3->super.super.super._allowsConstrainedOverride _isProxySession])
            {
              if (CFNLog::onceToken != -1) {
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
              }
              v57 = CFNLog::logger;
              if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR)) {
                goto LABEL_112;
              }
              uint64_t v58 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
              int v59 = *__error();
              *(_DWORD *)v103 = 138543874;
              *(void *)&v103[4] = v58;
              *(_WORD *)&v103[12] = 2112;
              *(void *)&v103[14] = v7;
              *(_WORD *)&v103[22] = 1024;
              LODWORD(v104) = v59;
              v60 = "ProxySession <%{public}@> Failed to issue sandbox extension for file %@, errno = %{errno}d";
            }
            else
            {
              if (CFNLog::onceToken != -1) {
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
              }
              v57 = CFNLog::logger;
              if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR)) {
                goto LABEL_112;
              }
              uint64_t v82 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
              int v83 = *__error();
              *(_DWORD *)v103 = 138543874;
              *(void *)&v103[4] = v82;
              *(_WORD *)&v103[12] = 2112;
              *(void *)&v103[14] = v7;
              *(_WORD *)&v103[22] = 1024;
              LODWORD(v104) = v83;
              v60 = "BackgroundSession <%{public}@> Failed to issue sandbox extension for file %@, errno = %{errno}d";
            }
            _os_log_error_impl(&dword_184085000, v57, OS_LOG_TYPE_ERROR, v60, v103, 0x1Cu);
LABEL_112:
            uint64_t v89 = 0;
LABEL_113:
            uint64_t v92 = 0;
            uint64_t v93 = 0;
            if ([(NSURL *)v7 getResourceValue:&v93 forKey:*MEMORY[0x1E4F1C590] error:&v92])
            {
              if (v93 == *MEMORY[0x1E4F1C570] || v93 == *MEMORY[0x1E4F1C578])
              {
                if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
                  dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
                }
                v63 = __CFNAPIMisuseFaultLogHandle::logger;
                if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)v103 = 138412546;
                  *(void *)&v103[4] = v7;
                  *(_WORD *)&v103[12] = 2112;
                  *(void *)&v103[14] = v93;
                  _os_log_fault_impl(&dword_184085000, v63, OS_LOG_TYPE_FAULT, "API MISUSE: Background upload from a file %@ with %@ is not supported. Please reduce the file protection class.", v103, 0x16u);
                }
              }
              goto LABEL_128;
            }
            if ([*(id *)&v3->super.super.super._allowsConstrainedOverride _isProxySession])
            {
              if (CFNLog::onceToken != -1) {
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
              }
              v64 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v65 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
                *(_DWORD *)v103 = 138543618;
                *(void *)&v103[4] = v65;
                *(_WORD *)&v103[12] = 2112;
                *(void *)&v103[14] = v92;
                v66 = "ProxySession <%{public}@> Failed to check file protection class %@";
LABEL_155:
                _os_log_debug_impl(&dword_184085000, v64, OS_LOG_TYPE_DEBUG, v66, v103, 0x16u);
              }
            }
            else
            {
              if (CFNLog::onceToken != -1) {
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
              }
              v64 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v81 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
                *(_DWORD *)v103 = 138543618;
                *(void *)&v103[4] = v81;
                *(_WORD *)&v103[12] = 2112;
                *(void *)&v103[14] = v92;
                v66 = "BackgroundSession <%{public}@> Failed to check file protection class %@";
                goto LABEL_155;
              }
            }
LABEL_128:
            uint64_t v67 = open([(NSURL *)v7 fileSystemRepresentation], 0);
            if (v67 != -1)
            {
              id v7 = (NSURL *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v67 closeOnDealloc:1];
              goto LABEL_139;
            }
            if ([*(id *)&v3->super.super.super._allowsConstrainedOverride _isProxySession])
            {
              if (CFNLog::onceToken != -1) {
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
              }
              v68 = CFNLog::logger;
              if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR)) {
                goto LABEL_138;
              }
              uint64_t v69 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
              int v70 = *__error();
              *(_DWORD *)v103 = 138543618;
              *(void *)&v103[4] = v69;
              *(_WORD *)&v103[12] = 1024;
              *(_DWORD *)&v103[14] = v70;
              v71 = "ProxySession <%{public}@> Failed to open file to upload %{errno}d";
            }
            else
            {
              if (CFNLog::onceToken != -1) {
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
              }
              v68 = CFNLog::logger;
              if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR)) {
                goto LABEL_138;
              }
              uint64_t v84 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
              int v85 = *__error();
              *(_DWORD *)v103 = 138543618;
              *(void *)&v103[4] = v84;
              *(_WORD *)&v103[12] = 1024;
              *(_DWORD *)&v103[14] = v85;
              v71 = "BackgroundSession <%{public}@> Failed to open file to upload %{errno}d";
            }
            _os_log_error_impl(&dword_184085000, v68, OS_LOG_TYPE_ERROR, v71, v103, 0x12u);
LABEL_138:
            id v7 = 0;
            goto LABEL_139;
          }
          if ([*(id *)&v3->super.super.super._allowsConstrainedOverride _isProxySession])
          {
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
            }
            v50 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              uint64_t v51 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
              LODWORD(v108) = 138543362;
              *(void *)((char *)&v108 + 4) = v51;
              uint64_t v52 = "ProxySession <%{public}@> failed to create a background NSURLSessionUploadTask, as remote session is unavailable";
LABEL_153:
              _os_log_error_impl(&dword_184085000, v50, OS_LOG_TYPE_ERROR, v52, (uint8_t *)&v108, 0xCu);
            }
          }
          else
          {
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
            }
            v50 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              uint64_t v80 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
              LODWORD(v108) = 138543362;
              *(void *)((char *)&v108 + 4) = v80;
              uint64_t v52 = "BackgroundSession <%{public}@> failed to create a background NSURLSessionUploadTask, as remote sessi"
                    "on is unavailable";
              goto LABEL_153;
            }
          }
          uint64_t v54 = [Property URL];
          v55 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, v54);
          if (v36)
          {
            objc_setProperty_atomic(v36, v56, v55, 776);
            goto LABEL_147;
          }
LABEL_149:
          uint64_t internalDelegateWrapper = 0;
LABEL_150:
          -[__NSCFURLSessionDelegateWrapper didCreateTask:](internalDelegateWrapper, v36);
          uint64_t v3 = v36;
          _Block_object_dispose(&buf, 8);
          v79 = v119;
          v119 = 0;
          if (v79) {
            CFRelease(v79);
          }
          goto LABEL_60;
        }
        v88 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Upload tasks from NSData are not supported in background sessions." userInfo:0];
LABEL_164:
        objc_exception_throw(v88);
      }
      int v4 = 0;
    }
    char v22 = 1;
    goto LABEL_35;
  }
LABEL_61:
  *(void *)(*(void *)(*(void *)(v2 + 48) + 8) + 40) = v3;
  return result;
}

uint64_t __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v3 = *(void *)(v1 + 32);
    return [v2 removeItemAtURL:v3 error:0];
  }
  return result;
}

uint64_t __49____NSURLBackgroundSession_failDisconnectedTasks__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 192);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    uint64_t v6 = *MEMORY[0x1E4F289A0];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        SEL v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        id v9 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), [v8 unsignedIntegerValue]);
        uint64_t v10 = *(void *)(a1 + 32);
        if (v10) {
          id v11 = *(void **)(v10 + 112);
        }
        else {
          id v11 = 0;
        }
        if ([v11 _allowsRetryForBackgroundDataTasks]
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          -[__NSURLBackgroundSession _onqueue_retryDataTaskWithIdentifier:](*(void *)(a1 + 32), [v8 unsignedIntegerValue]);
        }
        else
        {
          uint64_t v12 = *(void *)(a1 + 32);
          if ([v9 _isAVAssetTask]) {
            uint64_t v13 = 0;
          }
          else {
            uint64_t v13 = objc_msgSend((id)objc_msgSend(v9, "currentRequest"), "URL");
          }
          if (v12) {
            uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", v6, -997, v13);
          }
          else {
            uint64_t v14 = 0;
          }
          objc_msgSend(v9, "_onqueue_didFinishWithError:", v14);
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v15 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v4 = v15;
    }
    while (v15);
  }
  return [*(id *)(*(void *)(a1 + 32) + 192) removeAllObjects];
}

void __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_57(uint64_t a1, void *a2, void *a3, char a4)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    id v9 = *(void **)(v8 + 112);
  }
  else {
    id v9 = 0;
  }
  int v10 = [v9 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  p_vtable = AVAssetDownloadURLSession.vtable;
  uint64_t v12 = CFNLog::logger;
  BOOL v13 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (!v13) {
      goto LABEL_15;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14)
    {
      uint64_t v15 = *(void *)(v14 + 128);
      uint64_t v16 = *(void **)(v14 + 112);
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
    }
    *(_DWORD *)long long buf = 138543874;
    uint64_t v65 = v15;
    __int16 v66 = 2112;
    uint64_t v67 = v14;
    __int16 v68 = 2112;
    uint64_t v69 = [v16 identifier];
    long long v17 = "ProxySession <%{public}@> background session setup reply received: session %@ with identifier %@";
  }
  else
  {
    if (!v13) {
      goto LABEL_15;
    }
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18)
    {
      uint64_t v19 = *(void *)(v18 + 128);
      long long v20 = *(void **)(v18 + 112);
    }
    else
    {
      uint64_t v19 = 0;
      long long v20 = 0;
    }
    *(_DWORD *)long long buf = 138543874;
    uint64_t v65 = v19;
    __int16 v66 = 2112;
    uint64_t v67 = v18;
    __int16 v68 = 2112;
    uint64_t v69 = [v20 identifier];
    long long v17 = "BackgroundSession <%{public}@> background session setup reply received: session %@ with identifier %@";
  }
  _os_log_impl(&dword_184085000, v12, OS_LOG_TYPE_DEFAULT, v17, buf, 0x20u);
LABEL_15:
  if (!a2)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"kNSURLSessionThrowImmediateAVExceptionKey"), "BOOLValue"))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      return;
    }
    if ([a3 objectForKey:@"kNSURLSessionImmediateInvalidationErrorKey"])
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = (id)[a3 objectForKey:@"kNSURLSessionImmediateInvalidationErrorKey"];
      return;
    }
    uint64_t v45 = *(void *)(a1 + 32);
    if (v45) {
      v46 = *(void **)(v45 + 112);
    }
    else {
      v46 = 0;
    }
    int v47 = [v46 _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v48 = CFNLog::logger;
    BOOL v49 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v47)
    {
      if (!v49) {
        return;
      }
      uint64_t v50 = *(void *)(a1 + 32);
      if (v50)
      {
        uint64_t v51 = *(void *)(v50 + 128);
        uint64_t v52 = *(void **)(v50 + 112);
      }
      else
      {
        uint64_t v51 = 0;
        uint64_t v52 = 0;
      }
      uint64_t v53 = [v52 identifier];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v65 = v51;
      __int16 v66 = 2112;
      uint64_t v67 = v50;
      __int16 v68 = 2112;
      uint64_t v69 = v53;
      uint64_t v54 = "ProxySession <%{public}@> Failed to setup background NSURLSession for session %@ with identifier %@";
    }
    else
    {
      if (!v49) {
        return;
      }
      uint64_t v55 = *(void *)(a1 + 32);
      if (v55)
      {
        uint64_t v56 = *(void *)(v55 + 128);
        v57 = *(void **)(v55 + 112);
      }
      else
      {
        uint64_t v56 = 0;
        v57 = 0;
      }
      uint64_t v58 = [v57 identifier];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v65 = v56;
      __int16 v66 = 2112;
      uint64_t v67 = v55;
      __int16 v68 = 2112;
      uint64_t v69 = v58;
      uint64_t v54 = "BackgroundSession <%{public}@> Failed to setup background NSURLSession for session %@ with identifier %@";
    }
    _os_log_error_impl(&dword_184085000, v48, OS_LOG_TYPE_ERROR, v54, buf, 0x20u);
    return;
  }
  *(void *)(*(void *)(a1 + 32) + 168) = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 264) = a4;
  if (a3)
  {
    uint64_t v21 = [a3 objectForKeyedSubscript:@"NDBackgroundSessionManagerKeySessionUUID"];
    if (v21)
    {
      __int16 v23 = (void *)v21;
      uint64_t v24 = *(void **)(a1 + 32);
      if (v24) {
        objc_setProperty_nonatomic_copy(v24, v22, v23, 128);
      }
    }
    uint64_t v25 = [a3 objectForKeyedSubscript:@"NDBackgroundSessionManagerRestoredStateKeyTLSSessionCachePrefix"];
    if (v25) {
      objc_msgSend(*(id *)(a1 + 32), "set_tlsSessionCachePrefix:", v25);
    }
    char v26 = (void *)[a3 objectForKeyedSubscript:@"NDBackgroundSessionManagerRestoredStateKeyTasks"];
    uint64_t v27 = *(void *)(a1 + 32);
    if (v27)
    {
      uint64_t v28 = v26;
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __50____NSURLBackgroundSession_recreateExistingTasks___block_invoke;
      v63[3] = &unk_1E5254018;
      v63[4] = v27;
      [v26 enumerateKeysAndObjectsUsingBlock:v63];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v29 = *(void **)(v27 + 184);
      uint64_t v30 = [v29 countByEnumeratingWithState:&v59 objects:buf count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v60 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v59 + 1) + 8 * i);
            if (![v28 objectForKey:v34]) {
              [*(id *)(v27 + 192) addObject:v34];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v59 objects:buf count:16];
        }
        while (v31);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    p_vtable = (void **)(AVAssetDownloadURLSession + 24);
  }
  else
  {
    uint64_t v35 = [*(id *)(*(void *)(a1 + 32) + 184) count];
    v36 = *(id **)(a1 + 32);
    if (v35) {
      objc_msgSend(v36[24], "addObjectsFromArray:", objc_msgSend(v36[23], "allKeys"));
    }
    else {
      objc_msgSend(v36[21], "setTLSSessionCachePrefix:", objc_msgSend(v36, "_tlsSessionCachePrefix"));
    }
  }
  uint64_t v37 = *(void *)(a1 + 32);
  if (v37) {
    uint64_t v38 = *(void **)(v37 + 112);
  }
  else {
    uint64_t v38 = 0;
  }
  int v39 = [v38 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v40 = p_vtable[304];
  BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
  if (v39)
  {
    if (!v41) {
      return;
    }
    uint64_t v42 = *(void *)(a1 + 32);
    if (v42) {
      uint64_t v42 = *(void *)(v42 + 128);
    }
    *(_DWORD *)long long buf = 138543362;
    uint64_t v65 = v42;
    char v43 = "ProxySession <%{public}@> background session setup complete";
  }
  else
  {
    if (!v41) {
      return;
    }
    uint64_t v44 = *(void *)(a1 + 32);
    if (v44) {
      uint64_t v44 = *(void *)(v44 + 128);
    }
    *(_DWORD *)long long buf = 138543362;
    uint64_t v65 = v44;
    char v43 = "BackgroundSession <%{public}@> background session setup complete";
  }
  _os_log_impl(&dword_184085000, v40, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);
}

void __67____NSURLBackgroundSession__onqueue_getTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
}

void __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_2_146(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 48) URL];
    if (v3)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, v4);
      if (!v2) {
        return;
      }
    }
    else
    {
      uint64_t v6 = 0;
      if (!v2) {
        return;
      }
    }
    objc_setProperty_atomic(v2, v5, v6, 776);
  }
}

void __62____NSURLBackgroundSession__onqueue_dataTaskWithTaskForClass___block_invoke_118(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 48) URL];
    if (v3)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, v4);
      if (!v2) {
        return;
      }
    }
    else
    {
      uint64_t v6 = 0;
      if (!v2) {
        return;
      }
    }
    objc_setProperty_atomic(v2, v5, v6, 776);
  }
}

void __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_76(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 112);
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v5 = CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v7 = *(void *)(v7 + 128);
    }
    LODWORD(v12) = 138543362;
    *(void *)((char *)&v12 + 4) = v7;
    uint64_t v8 = "ProxySession <%{public}@> Reconnection to existing session and state complete";
  }
  else
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    LODWORD(v12) = 138543362;
    *(void *)((char *)&v12 + 4) = v9;
    uint64_t v8 = "BackgroundSession <%{public}@> Reconnection to existing session and state complete";
  }
  _os_log_impl(&dword_184085000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0xCu);
LABEL_15:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    id v11 = *(NSObject **)(v10 + 120);
    *(void *)&long long v12 = MEMORY[0x1E4F143A8];
    *((void *)&v12 + 1) = 3221225472;
    BOOL v13 = __49____NSURLBackgroundSession_failDisconnectedTasks__block_invoke;
    uint64_t v14 = &unk_1E5258228;
    uint64_t v15 = v10;
    dispatch_async(v11, &v12);
  }
}

void __60____NSURLBackgroundSession__onqueue_downloadTaskForRequest___block_invoke_165(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 48) URL];
    if (v3)
    {
      BOOL v6 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, v4);
      if (!v2) {
        return;
      }
    }
    else
    {
      BOOL v6 = 0;
      if (!v2) {
        return;
      }
    }
    objc_setProperty_atomic(v2, v5, v6, 776);
  }
}

void __58____NSURLBackgroundSession__downloadTaskWithTaskForClass___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3)
  {
LABEL_6:
    p_isa = 0;
    goto LABEL_9;
  }
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t Property = (uint64_t)objc_getProperty(*(id *)(a1 + 40), a2, 16, 1);
    uint64_t v7 = (NSData *)objc_getProperty(v4, v6, 64, 1);
    id v9 = objc_getProperty(v4, v8, 72, 1);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t Property = 0;
    id v9 = 0;
  }
  -[__NSURLBackgroundSession validateSerializabilityForRequest:completion:](Property, (uint64_t)v9);
  if (!(Property | (unint64_t)v7))
  {
    if (dyld_program_sdk_at_least()) {
      __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(&cfstr_CannotCreateDo.isa);
    }
    goto LABEL_6;
  }
  if (*(void *)(v3 + 272))
  {
    id v11 = (objc_class *)objc_opt_class();
    p_isa = -[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]((void *)v3, v11, *(void **)(v3 + 272));
    goto LABEL_9;
  }
  if (*(unsigned char *)(v3 + 265))
  {
    int v12 = [*(id *)(v3 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    BOOL v13 = CFNLog::logger;
    BOOL v14 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (!v14) {
        goto LABEL_30;
      }
      uint64_t v15 = *(void *)(v3 + 128);
      *(_DWORD *)__str = 138543362;
      *(void *)&__str[4] = v15;
      uint64_t v16 = "ProxySession <%{public}@> attempted to create a NSURLSessionDownloadTask in a session that has been invalidated";
    }
    else
    {
      if (!v14) {
        goto LABEL_30;
      }
      uint64_t v82 = *(void *)(v3 + 128);
      *(_DWORD *)__str = 138543362;
      *(void *)&__str[4] = v82;
      uint64_t v16 = "BackgroundSession <%{public}@> attempted to create a NSURLSessionDownloadTask in a session that has been invalidated";
    }
    _os_log_error_impl(&dword_184085000, v13, OS_LOG_TYPE_ERROR, v16, __str, 0xCu);
LABEL_30:
    int v39 = (NSString *)dyld_program_sdk_at_least();
    if (v39) {
      __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v39);
    }
    goto LABEL_6;
  }
  if (v7)
  {
    BOOL v17 = [(NSData *)v7 _isSafeResumeDataForBackgroundDownload];
    id v18 = copyDecodedResumeData(v7);
    if (objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", @"NSURLSessionResumeInfoVersion"), "intValue") == 1)
    {
      uint64_t v19 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:0];
      long long v20 = (void *)[v19 objectForKeyedSubscript:@"NSURLSessionResumeInfoLocalPath"];
      id v21 = (id)[v19 mutableCopy];
      [v21 setObject:&unk_1ECFD1AA0 forKeyedSubscript:@"NSURLSessionResumeInfoVersion"];
      objc_msgSend(v21, "setObject:forKeyedSubscript:", objc_msgSend(v20, "lastPathComponent"), @"NSURLSessionResumeInfoTempFileName");
      uint64_t v7 = (NSData *)[MEMORY[0x1E4F28F98] dataWithPropertyList:v21 format:200 options:0 error:0];
    }
    if (![*(id *)(v3 + 112) _directoryForDownloadedFiles])
    {
      uint64_t v22 = -[__NSURLBackgroundSession backgroundDownloadsDirectory](v3);
      if (v22)
      {
        __int16 v23 = v22;
        uint64_t v24 = NSTemporaryDirectory();
        -[__NSURLBackgroundSession moveFileForResumeData:fromDirectory:toDirectory:](v3, v7, v24, (void *)[v23 path]);
      }
    }

    id v25 = copyDecodedResumeData(v7);
    uint64_t v26 = [v25 objectForKey:@"NSURLSessionResumeCurrentRequest"];
    id v27 = (id)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v26 error:0];
    [v27 setDecodingFailurePolicy:0];
    if (resumeDataClasses(void)::onceToken != -1) {
      dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_446);
    }
    uint64_t v28 = (void *)[v27 decodeObjectOfClasses:resumeDataClasses(void)::resumeDataClasses forKey:@"NSKeyedArchiveRootObjectKey"];
    [v27 finishDecoding];
    uint64_t v29 = [v25 objectForKey:@"NSURLSessionResumeOriginalRequest"];
    id v30 = (id)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v29 error:0];
    [v30 setDecodingFailurePolicy:0];
    if (resumeDataClasses(void)::onceToken != -1) {
      dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_446);
    }
    uint64_t v31 = [v30 decodeObjectOfClasses:resumeDataClasses(void)::resumeDataClasses forKey:@"NSKeyedArchiveRootObjectKey"];
    [v30 finishDecoding];

    if (v17)
    {
      uint64_t v32 = [__NSCFBackgroundDownloadTask alloc];
      uint64_t v33 = *(void *)(v3 + 160);
      *(void *)(v3 + 160) = v33 + 1;
      uint64_t v34 = -[__NSCFBackgroundSessionTask initWithOriginalRequest:ident:taskGroup:](v32, "initWithOriginalRequest:ident:taskGroup:", v28, v33, [(id)v3 defaultTaskGroup]);
      [(NSURLSessionTask *)v34 setOriginalRequest:v31];
      uint64_t v35 = *(void **)(v3 + 168);
      if (v35)
      {
        *(void *)__str = MEMORY[0x1E4F143A8];
        *(void *)&__str[8] = 3221225472;
        *(void *)&__str[16] = __63____NSURLBackgroundSession__onqueue_downloadTaskForResumeData___block_invoke;
        v99 = &unk_1E5254090;
        v100 = (__NSCFBackgroundDownloadTask *)v3;
        v101 = v34;
        uint64_t v102 = (uint64_t)v28;
        v36 = (void *)[v35 synchronousRemoteObjectProxyWithErrorHandler:__str];
        uint64_t v37 = [(NSURLSessionTask *)v34 taskIdentifier];
        uint64_t v38 = [(NSURLSessionTask *)v34 _uniqueIdentifier];
        uint64_t v89 = MEMORY[0x1E4F143A8];
        uint64_t v90 = 3221225472;
        v91 = __63____NSURLBackgroundSession__onqueue_downloadTaskForResumeData___block_invoke_160;
        uint64_t v92 = &unk_1E52540B8;
        uint64_t v93 = v34;
        v94 = (__NSCFBackgroundDownloadTask *)v3;
        uint64_t v95 = (uint64_t)v28;
        [v36 downloadTaskWithResumeData:v7 identifier:v37 uniqueIdentifier:v38 reply:&v89];
LABEL_74:
        long long v61 = v34;
        goto LABEL_81;
      }
      int v62 = [*(id *)(v3 + 112) _isProxySession];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v63 = CFNLog::logger;
      BOOL v64 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v62)
      {
        if (!v64) {
          goto LABEL_72;
        }
        uint64_t v65 = *(void *)(v3 + 128);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v97 = v65;
        __int16 v66 = "ProxySession <%{public}@> failed to create a background NSURLSessionDownloadTask, as remote session is unavailable";
      }
      else
      {
        if (!v64) {
          goto LABEL_72;
        }
        uint64_t v87 = *(void *)(v3 + 128);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v97 = v87;
        __int16 v66 = "BackgroundSession <%{public}@> failed to create a background NSURLSessionDownloadTask, as remote session is unavailable";
      }
      _os_log_error_impl(&dword_184085000, v63, OS_LOG_TYPE_ERROR, v66, buf, 0xCu);
LABEL_72:
      uint64_t v79 = [v28 URL];
      uint64_t v80 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, v79);
      if (v34) {
        objc_setProperty_atomic(v34, v81, v80, 776);
      }
      goto LABEL_74;
    }
    int v48 = [*(id *)(v3 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    BOOL v49 = CFNLog::logger;
    BOOL v50 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v48)
    {
      if (v50)
      {
        uint64_t v51 = *(void *)(v3 + 128);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v97 = v51;
        uint64_t v52 = "ProxySession <%{public}@> Invalid resume data for background download. Background downloads must use http "
              "or https and must download to an accessible file.";
LABEL_53:
        _os_log_impl(&dword_184085000, v49, OS_LOG_TYPE_DEFAULT, v52, buf, 0xCu);
      }
    }
    else if (v50)
    {
      uint64_t v58 = *(void *)(v3 + 128);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v97 = v58;
      uint64_t v52 = "BackgroundSession <%{public}@> Invalid resume data for background download. Background downloads must use ht"
            "tp or https and must download to an accessible file.";
      goto LABEL_53;
    }
    long long v59 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-3003 userInfo:0];
    long long v60 = (objc_class *)objc_opt_class();
    long long v61 = (__NSCFBackgroundDownloadTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]((void *)v3, v60, v59);
    goto LABEL_81;
  }
  if (([(id)Property _isSafeRequestForBackgroundDownload] & 1) == 0)
  {
    int v53 = [*(id *)(v3 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v54 = CFNLog::logger;
    BOOL v55 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v53)
    {
      if (v55)
      {
        uint64_t v56 = *(void *)(v3 + 128);
        *(_DWORD *)__str = 138543618;
        *(void *)&__str[4] = v56;
        *(_WORD *)&__str[12] = 2112;
        *(void *)&__str[14] = objc_msgSend((id)objc_msgSend((id)Property, "URL"), "scheme");
        v57 = "ProxySession <%{public}@> Invalid URL scheme for background downloads: %@. Valid schemes are http or https";
LABEL_62:
        _os_log_impl(&dword_184085000, v54, OS_LOG_TYPE_DEFAULT, v57, __str, 0x16u);
      }
    }
    else if (v55)
    {
      uint64_t v67 = *(void *)(v3 + 128);
      *(_DWORD *)__str = 138543618;
      *(void *)&__str[4] = v67;
      *(_WORD *)&__str[12] = 2112;
      *(void *)&__str[14] = objc_msgSend((id)objc_msgSend((id)Property, "URL"), "scheme");
      v57 = "BackgroundSession <%{public}@> Invalid URL scheme for background downloads: %@. Valid schemes are http or https";
      goto LABEL_62;
    }
    __int16 v68 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v69 = [(id)Property URL];
    uint64_t v70 = objc_msgSend(v68, "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1002, v69);
    v71 = (objc_class *)objc_opt_class();
    long long v61 = (__NSCFBackgroundDownloadTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]((void *)v3, v71, v70);
    goto LABEL_81;
  }
  uint64_t v40 = [__NSCFBackgroundDownloadTask alloc];
  uint64_t v41 = *(void *)(v3 + 160);
  *(void *)(v3 + 160) = v41 + 1;
  uint64_t v42 = -[__NSCFBackgroundSessionTask initWithOriginalRequest:ident:taskGroup:](v40, "initWithOriginalRequest:ident:taskGroup:", Property, v41, [(id)v3 defaultTaskGroup]);
  [(NSURLSessionTask *)v42 updateCurrentRequest:Property];
  char v43 = *(void **)(v3 + 168);
  if (!v43)
  {
    int v74 = [*(id *)(v3 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v75 = CFNLog::logger;
    BOOL v76 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v74)
    {
      if (!v76) {
        goto LABEL_78;
      }
      uint64_t v77 = *(void *)(v3 + 128);
      *(_DWORD *)__str = 138543362;
      *(void *)&__str[4] = v77;
      v78 = "ProxySession <%{public}@> failed to create a background NSURLSessionDownloadTask, as remote session is unavailable";
    }
    else
    {
      if (!v76) {
        goto LABEL_78;
      }
      uint64_t v88 = *(void *)(v3 + 128);
      *(_DWORD *)__str = 138543362;
      *(void *)&__str[4] = v88;
      v78 = "BackgroundSession <%{public}@> failed to create a background NSURLSessionDownloadTask, as remote session is unavailable";
    }
    _os_log_error_impl(&dword_184085000, v75, OS_LOG_TYPE_ERROR, v78, __str, 0xCu);
LABEL_78:
    uint64_t v83 = [(id)Property URL];
    uint64_t v84 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, v83);
    if (v42) {
      objc_setProperty_atomic(v42, v85, v84, 776);
    }
    goto LABEL_80;
  }
  uint64_t v89 = MEMORY[0x1E4F143A8];
  uint64_t v90 = 3221225472;
  v91 = __60____NSURLBackgroundSession__onqueue_downloadTaskForRequest___block_invoke;
  uint64_t v92 = &unk_1E5254090;
  uint64_t v93 = (__NSCFBackgroundDownloadTask *)v3;
  v94 = v42;
  uint64_t v95 = Property;
  uint64_t v44 = (void *)[v43 synchronousRemoteObjectProxyWithErrorHandler:&v89];
  if (!*(unsigned char *)(v3 + 264)) {
    goto LABEL_64;
  }
  if (__CFNProcessIsMobileAssetDaemon::onceToken != -1) {
    dispatch_once(&__CFNProcessIsMobileAssetDaemon::onceToken, &__block_literal_global_25_5555);
  }
  if ((!__CFNProcessIsMobileAssetDaemon::result || geteuid())
    && (uint64_t v45 = -[__NSURLBackgroundSession backgroundDownloadsDirectory](v3)) != 0)
  {
    snprintf(__str, 0x400uLL, "%s", (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v45, "path"), "stringByAppendingPathComponent:", @"CFNetworkDownload_XXXXXX.tmp"), "UTF8String"));
    int v46 = mkstemps(__str, 4);
    close(v46);
    id v47 = (id)[[NSString alloc] initWithUTF8String:__str];
  }
  else
  {
LABEL_64:
    id v47 = 0;
  }
  uint64_t v72 = [(NSURLSessionTask *)v42 taskIdentifier];
  uint64_t v73 = [(NSURLSessionTask *)v42 _uniqueIdentifier];
  *(void *)__str = MEMORY[0x1E4F143A8];
  *(void *)&__str[8] = 3221225472;
  *(void *)&__str[16] = __60____NSURLBackgroundSession__onqueue_downloadTaskForRequest___block_invoke_165;
  v99 = &unk_1E52540B8;
  v100 = v42;
  v101 = (__NSCFBackgroundDownloadTask *)v3;
  uint64_t v102 = Property;
  [v44 downloadTaskWithRequest:Property originalRequest:Property downloadFilePath:v47 identifier:v72 uniqueIdentifier:v73 reply:__str];
LABEL_80:
  long long v61 = v42;
LABEL_81:
  p_isa = &v61->super.super.super.isa;
  if (v61)
  {
    objc_msgSend(*(id *)(v3 + 184), "setObject:forKeyedSubscript:", v61, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](v61, "taskIdentifier")));
    uint64_t v86 = p_isa[88];
    if (!v86) {
      uint64_t v86 = p_isa[87];
    }
    -[__NSCFURLSessionDelegateWrapper didCreateTask:](v86, p_isa);
  }
LABEL_9:
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = p_isa;
}

void __58____NSURLBackgroundSession__onqueue_completeInvalidation___block_invoke(uint64_t a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    *(unsigned char *)(v3 + 265) = 1;
    uint64_t v4 = *(void *)(a1 + 32);
    -[NSURLSession finalizeDelegateWithError:](v4);
  }
  else
  {
    if (v3) {
      uint64_t v5 = *(void **)(v3 + 112);
    }
    else {
      uint64_t v5 = 0;
    }
    int v6 = [v5 _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v7 = CFNLog::logger;
    BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v8) {
        return;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9) {
        uint64_t v10 = *(void *)(v9 + 128);
      }
      else {
        uint64_t v10 = 0;
      }
      int v14 = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      id v11 = "ProxySession <%{public}@> Already invalidating %@";
    }
    else
    {
      if (!v8) {
        return;
      }
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        uint64_t v13 = *(void *)(v12 + 128);
      }
      else {
        uint64_t v13 = 0;
      }
      int v14 = 138543618;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      id v11 = "BackgroundSession <%{public}@> Already invalidating %@";
    }
    _os_log_impl(&dword_184085000, v7, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0x16u);
  }
}

void __51____NSURLBackgroundSession_sendInvalidationRequest__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(NSObject **)(v1 + 120);
  }
  else {
    uint64_t v2 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51____NSURLBackgroundSession_sendInvalidationRequest__block_invoke_2;
  block[3] = &unk_1E5258228;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __61____NSURLBackgroundSession__onqueue_invokeInvalidateCallback__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 284);
  if (v3)
  {
    notify_cancel(v3);
    *(_DWORD *)(*(void *)(a1 + 32) + 284) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  *(void *)(*(void *)(a1 + 32) + 168) = 0;
  [*(id *)(*(void *)(a1 + 32) + 176) invalidate];

  *(void *)(*(void *)(a1 + 32) + 176) = 0;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v4 = *(const void **)(a1 + 40);

  _Block_release(v4);
}

void __51____NSURLBackgroundSession_sendInvalidationRequest__block_invoke_2(uint64_t a1)
{
}

void __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v7 = CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9) {
        uint64_t v9 = *(void *)(v9 + 128);
      }
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = a2;
      uint64_t v10 = "ProxySession <%{public}@> an error occurred on the xpc connection to setup the background session: %@";
LABEL_15:
      _os_log_error_impl(&dword_184085000, v7, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x16u);
    }
  }
  else if (v8)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      uint64_t v11 = *(void *)(v11 + 128);
    }
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    uint64_t v15 = a2;
    uint64_t v10 = "BackgroundSession <%{public}@> an error occurred on the xpc connection to setup the background session: %@";
    goto LABEL_15;
  }
}

void __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_75(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v7 = CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9) {
        uint64_t v9 = *(void *)(v9 + 128);
      }
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = a2;
      uint64_t v10 = "ProxySession <%{public}@> An error occurred on the xpc connection requesting pending callbacks for the backg"
            "round session: %@";
LABEL_15:
      _os_log_error_impl(&dword_184085000, v7, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x16u);
    }
  }
  else if (v8)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      uint64_t v11 = *(void *)(v11 + 128);
    }
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    uint64_t v15 = a2;
    uint64_t v10 = "BackgroundSession <%{public}@> An error occurred on the xpc connection requesting pending callbacks for the ba"
          "ckground session: %@";
    goto LABEL_15;
  }
}

void __65____NSURLBackgroundSession__onqueue_retryDataTaskWithIdentifier___block_invoke(uint64_t a1, char a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 112);
    }
    else {
      uint64_t v4 = 0;
    }
    int v5 = [v4 _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    int v6 = CFNLog::logger;
    BOOL v7 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        if (v8) {
          uint64_t v8 = *(void *)(v8 + 128);
        }
        uint64_t v9 = *(void *)(a1 + 40);
        int v13 = 138543618;
        uint64_t v14 = v8;
        __int16 v15 = 2048;
        uint64_t v16 = v9;
        uint64_t v10 = "ProxySession <%{public}@> failed to retry background data task with identifier %lu";
LABEL_16:
        _os_log_error_impl(&dword_184085000, v6, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, 0x16u);
      }
    }
    else if (v7)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11) {
        uint64_t v11 = *(void *)(v11 + 128);
      }
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2048;
      uint64_t v16 = v12;
      uint64_t v10 = "BackgroundSession <%{public}@> failed to retry background data task with identifier %lu";
      goto LABEL_16;
    }
  }
}

void __46____NSURLBackgroundSession_setupXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(NSObject **)(v1 + 120);
  }
  else {
    uint64_t v2 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_2;
  block[3] = &unk_1E5258228;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_2_23(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 112);
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  int v5 = CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      return;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v7 = *(void *)(v7 + 128);
    }
    int v10 = 138543362;
    uint64_t v11 = v7;
    uint64_t v8 = "ProxySession <%{public}@> connection to background transfer daemon invalidated";
  }
  else
  {
    if (!v6) {
      return;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    int v10 = 138543362;
    uint64_t v11 = v9;
    uint64_t v8 = "BackgroundSession <%{public}@> connection to background transfer daemon invalidated";
  }
  _os_log_impl(&dword_184085000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
}

void __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 112);
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  int v5 = CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v7 = *(void *)(v7 + 128);
    }
    *(_DWORD *)long long buf = 138543362;
    uint64_t v20 = v7;
    uint64_t v8 = "ProxySession <%{public}@> connection to background transfer daemon interrupted";
  }
  else
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    *(_DWORD *)long long buf = 138543362;
    uint64_t v20 = v9;
    uint64_t v8 = "BackgroundSession <%{public}@> connection to background transfer daemon interrupted";
  }
  _os_log_impl(&dword_184085000, v5, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
LABEL_15:
  [*(id *)(*(void *)(a1 + 32) + 176) invalidate];

  *(void *)(*(void *)(a1 + 32) + 176) = 0;
  *(void *)(*(void *)(a1 + 32) + 168) = 0;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    uint64_t v11 = *(void **)(v10 + 112);
  }
  else {
    uint64_t v11 = 0;
  }
  int v12 = [v11 _isProxySession];
  uint64_t v13 = *(void *)(a1 + 32);
  if (v12)
  {
    -[__NSURLBackgroundSession setupXPCConnection](v13);
    -[__NSURLBackgroundSession setupBackgroundSession](*(void *)(a1 + 32));
    uint64_t v14 = *(void *)(a1 + 32);
    if (*(void *)(v14 + 216)) {
      -[__NSURLBackgroundSession sendInvalidationRequest](v14);
    }
  }
  else
  {
    *(unsigned char *)(v13 + 280) = 1;
    uint64_t v15 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v15 + 281))
    {
      *(unsigned char *)(v15 + 281) = 0;
      uint64_t v16 = *(void *)(a1 + 32);
      if (v16) {
        uint64_t v17 = *(NSObject **)(v16 + 120);
      }
      else {
        uint64_t v17 = 0;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_21;
      block[3] = &unk_1E5258228;
      block[4] = v16;
      dispatch_async(v17, block);
    }
  }
}

uint64_t __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_21(uint64_t a1)
{
  return -[__NSURLBackgroundSession ensureRemoteSession](*(void *)(a1 + 32));
}

void __68____NSURLBackgroundSession_backgroundSessionDidFinishAppWake_reply___block_invoke(uint64_t *a1)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (![(id)a1[4] appWakeUUID]
    || !objc_msgSend((id)a1[5], "isEqualToString:", objc_msgSend((id)a1[4], "appWakeUUID")))
  {
    uint64_t v14 = a1[4];
    if (v14) {
      uint64_t v15 = *(void **)(v14 + 112);
    }
    else {
      uint64_t v15 = 0;
    }
    int v16 = [v15 _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v17 = CFNLog::logger;
    BOOL v18 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (v18)
      {
        uint64_t v19 = (void *)a1[4];
        if (v19) {
          uint64_t v20 = v19[16];
        }
        else {
          uint64_t v20 = 0;
        }
        uint64_t v21 = [v19 appWakeUUID];
        uint64_t v22 = a1[4];
        uint64_t v23 = a1[5];
        if (v22) {
          uint64_t v24 = *(void **)(v22 + 112);
        }
        else {
          uint64_t v24 = 0;
        }
        *(_DWORD *)long long buf = 138544386;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        __int16 v73 = 2112;
        uint64_t v74 = v23;
        __int16 v75 = 2112;
        uint64_t v76 = v22;
        __int16 v77 = 2112;
        uint64_t v78 = [v24 identifier];
        id v25 = "ProxySession <%{public}@> appWakeUUID %@ does not match uuid %@ for session %@ with identifier %@";
LABEL_70:
        _os_log_debug_impl(&dword_184085000, v17, OS_LOG_TYPE_DEBUG, v25, buf, 0x34u);
      }
    }
    else if (v18)
    {
      long long v61 = (void *)a1[4];
      if (v61) {
        uint64_t v62 = v61[16];
      }
      else {
        uint64_t v62 = 0;
      }
      uint64_t v63 = [v61 appWakeUUID];
      uint64_t v64 = a1[4];
      uint64_t v65 = a1[5];
      if (v64) {
        __int16 v66 = *(void **)(v64 + 112);
      }
      else {
        __int16 v66 = 0;
      }
      *(_DWORD *)long long buf = 138544386;
      *(void *)&uint8_t buf[4] = v62;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v63;
      __int16 v73 = 2112;
      uint64_t v74 = v65;
      __int16 v75 = 2112;
      uint64_t v76 = v64;
      __int16 v77 = 2112;
      uint64_t v78 = [v66 identifier];
      id v25 = "BackgroundSession <%{public}@> appWakeUUID %@ does not match uuid %@ for session %@ with identifier %@";
      goto LABEL_70;
    }
    (*(void (**)(void))(a1[6] + 16))();
    return;
  }
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  __int16 v68 = __68____NSURLBackgroundSession_backgroundSessionDidFinishAppWake_reply___block_invoke_2;
  uint64_t v69 = &unk_1E5254400;
  long long v70 = *((_OWORD *)a1 + 2);
  uint64_t v71 = a1[6];
  uint64_t v2 = [*(id *)(v70 + 200) count];
  uint64_t v3 = a1[4];
  if (v3) {
    int v4 = *(void **)(v3 + 112);
  }
  else {
    int v4 = 0;
  }
  int v5 = [v4 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  BOOL v6 = CFNLog::logger;
  BOOL v7 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (v5)
    {
      if (v7)
      {
        uint64_t v26 = a1[4];
        if (v26)
        {
          uint64_t v27 = *(void *)(v26 + 128);
          uint64_t v28 = *(void **)(v26 + 112);
        }
        else
        {
          uint64_t v27 = 0;
          uint64_t v28 = 0;
        }
        uint64_t v29 = a1[5];
        *(_DWORD *)long long buf = 138544130;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v29;
        __int16 v73 = 2112;
        uint64_t v74 = v26;
        __int16 v75 = 2112;
        uint64_t v76 = [v28 identifier];
        id v30 = "ProxySession <%{public}@> no outstanding tasks getting auth headers, finishing wake up for uuid %@ for ses"
              "sion %@ with identifier %@";
LABEL_63:
        _os_log_impl(&dword_184085000, v6, OS_LOG_TYPE_DEFAULT, v30, buf, 0x2Au);
      }
    }
    else if (v7)
    {
      uint64_t v57 = a1[4];
      if (v57)
      {
        uint64_t v58 = *(void *)(v57 + 128);
        long long v59 = *(void **)(v57 + 112);
      }
      else
      {
        uint64_t v58 = 0;
        long long v59 = 0;
      }
      uint64_t v60 = a1[5];
      *(_DWORD *)long long buf = 138544130;
      *(void *)&uint8_t buf[4] = v58;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v60;
      __int16 v73 = 2112;
      uint64_t v74 = v57;
      __int16 v75 = 2112;
      uint64_t v76 = [v59 identifier];
      id v30 = "BackgroundSession <%{public}@> no outstanding tasks getting auth headers, finishing wake up for uuid %@ for "
            "session %@ with identifier %@";
      goto LABEL_63;
    }
    v68(v67, 1);
    return;
  }
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = a1[4];
      if (v8)
      {
        uint64_t v9 = *(void *)(v8 + 128);
        uint64_t v10 = *(void **)(v8 + 112);
      }
      else
      {
        uint64_t v9 = 0;
        uint64_t v10 = 0;
      }
      uint64_t v11 = [v10 identifier];
      uint64_t v12 = *(void *)(a1[4] + 200);
      *(_DWORD *)long long buf = 138544130;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      __int16 v73 = 2112;
      uint64_t v74 = v11;
      __int16 v75 = 2112;
      uint64_t v76 = v12;
      uint64_t v13 = "ProxySession <%{public}@> Have outstanding tasks getting auth headers for session %@ with identifier %@ outs"
            "tanding auth tasks %@";
LABEL_36:
      _os_log_impl(&dword_184085000, v6, OS_LOG_TYPE_DEFAULT, v13, buf, 0x2Au);
    }
  }
  else if (v7)
  {
    uint64_t v31 = a1[4];
    if (v31)
    {
      uint64_t v32 = *(void *)(v31 + 128);
      uint64_t v33 = *(void **)(v31 + 112);
    }
    else
    {
      uint64_t v32 = 0;
      uint64_t v33 = 0;
    }
    uint64_t v34 = [v33 identifier];
    uint64_t v35 = *(void *)(a1[4] + 200);
    *(_DWORD *)long long buf = 138544130;
    *(void *)&uint8_t buf[4] = v32;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v31;
    __int16 v73 = 2112;
    uint64_t v74 = v34;
    __int16 v75 = 2112;
    uint64_t v76 = v35;
    uint64_t v13 = "BackgroundSession <%{public}@> Have outstanding tasks getting auth headers for session %@ with identifier %@ o"
          "utstanding auth tasks %@";
    goto LABEL_36;
  }
  uint64_t v36 = a1[4];
  uint64_t v37 = *(void *)(v36 + 224);
  if (!v37
    || ((v39 = *(void *)(v37 + 8), uint64_t v38 = *(void *)(v37 + 16), v41 = v38 == 0, v40 = v38 & 1 | v39, !v41)
      ? (BOOL v41 = v40 == 0)
      : (BOOL v41 = 1),
        v41 ? (char v42 = 0) : (char v42 = 1),
        (uint64_t (*)())v39 == BlockHolderVar<BOOL>::invoke_reseted && (v42 & 1) == 0))
  {
    int v43 = [*(id *)(v36 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v44 = CFNLog::logger;
    BOOL v45 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v43)
    {
      if (!v45) {
        goto LABEL_58;
      }
      uint64_t v46 = a1[4];
      if (v46)
      {
        uint64_t v47 = *(void *)(v46 + 128);
        int v48 = *(void **)(v46 + 112);
      }
      else
      {
        uint64_t v47 = 0;
        int v48 = 0;
      }
      uint64_t v49 = a1[5];
      uint64_t v50 = [v48 identifier];
      *(_DWORD *)long long buf = 138544130;
      *(void *)&uint8_t buf[4] = v47;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v49;
      __int16 v73 = 2112;
      uint64_t v74 = v46;
      __int16 v75 = 2112;
      uint64_t v76 = v50;
      uint64_t v51 = "ProxySession <%{public}@> Storing work to do when ready to wake app for uuid %@ for session %@ with identifier %@";
    }
    else
    {
      if (!v45) {
        goto LABEL_58;
      }
      uint64_t v52 = a1[4];
      if (v52)
      {
        uint64_t v53 = *(void *)(v52 + 128);
        uint64_t v54 = *(void **)(v52 + 112);
      }
      else
      {
        uint64_t v53 = 0;
        uint64_t v54 = 0;
      }
      uint64_t v55 = a1[5];
      uint64_t v56 = [v54 identifier];
      *(_DWORD *)long long buf = 138544130;
      *(void *)&uint8_t buf[4] = v53;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v55;
      __int16 v73 = 2112;
      uint64_t v74 = v52;
      __int16 v75 = 2112;
      uint64_t v76 = v56;
      uint64_t v51 = "BackgroundSession <%{public}@> Storing work to do when ready to wake app for uuid %@ for session %@ with identifier %@";
    }
    _os_log_impl(&dword_184085000, v44, OS_LOG_TYPE_DEFAULT, v51, buf, 0x2Au);
LABEL_58:
    SmartBlockWithArgs<BOOL>::SmartBlockWithArgs();
  }
}

uint64_t __68____NSURLBackgroundSession_backgroundSessionDidFinishAppWake_reply___block_invoke_2(void *a1, int a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[4];
  if (v4) {
    int v5 = *(void **)(v4 + 112);
  }
  else {
    int v5 = 0;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  BOOL v7 = CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v9 = a1[4];
    if (v9)
    {
      uint64_t v10 = *(void *)(v9 + 128);
      uint64_t v11 = *(void **)(v9 + 112);
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
    uint64_t v12 = a1[5];
    *(_DWORD *)unint64_t v39 = 138544386;
    *(void *)&v39[4] = v10;
    *(_WORD *)&v39[12] = 2112;
    *(void *)&v39[14] = v12;
    *(_WORD *)&v39[22] = 2112;
    uint64_t v40 = v9;
    *(_WORD *)BOOL v41 = 2112;
    *(void *)&v41[2] = [v11 identifier];
    *(_WORD *)&v41[10] = 1024;
    *(_DWORD *)&v41[12] = a2;
    uint64_t v13 = "ProxySession <%{public}@> Ready to wake app for uuid %@ for session %@ with identifier %@ invoked=%d";
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v14 = a1[4];
    if (v14)
    {
      uint64_t v15 = *(void *)(v14 + 128);
      int v16 = *(void **)(v14 + 112);
    }
    else
    {
      uint64_t v15 = 0;
      int v16 = 0;
    }
    uint64_t v17 = a1[5];
    *(_DWORD *)unint64_t v39 = 138544386;
    *(void *)&v39[4] = v15;
    *(_WORD *)&v39[12] = 2112;
    *(void *)&v39[14] = v17;
    *(_WORD *)&v39[22] = 2112;
    uint64_t v40 = v14;
    *(_WORD *)BOOL v41 = 2112;
    *(void *)&v41[2] = [v16 identifier];
    *(_WORD *)&v41[10] = 1024;
    *(_DWORD *)&v41[12] = a2;
    uint64_t v13 = "BackgroundSession <%{public}@> Ready to wake app for uuid %@ for session %@ with identifier %@ invoked=%d";
  }
  _os_log_impl(&dword_184085000, v7, OS_LOG_TYPE_DEFAULT, v13, v39, 0x30u);
LABEL_15:
  BOOL v18 = (void *)a1[4];
  if (!a2)
  {
    if (v18) {
      BOOL v18 = (void *)v18[14];
    }
    int v22 = objc_msgSend(v18, "_isProxySession", *(_OWORD *)v39, *(void *)&v39[16], v40, *(_OWORD *)v41);
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v23 = CFNLog::logger;
    BOOL v24 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (!v24) {
        return (*(uint64_t (**)(void))(a1[6] + 16))();
      }
      uint64_t v25 = a1[4];
      if (v25)
      {
        uint64_t v26 = *(void *)(v25 + 128);
        uint64_t v27 = *(void **)(v25 + 112);
      }
      else
      {
        uint64_t v26 = 0;
        uint64_t v27 = 0;
      }
      uint64_t v28 = a1[5];
      uint64_t v29 = [v27 identifier];
      uint64_t v30 = *(void *)(a1[4] + 200);
      *(_DWORD *)unint64_t v39 = 138544386;
      *(void *)&v39[4] = v26;
      *(_WORD *)&v39[12] = 2112;
      *(void *)&v39[14] = v28;
      *(_WORD *)&v39[22] = 2112;
      uint64_t v40 = v25;
      *(_WORD *)BOOL v41 = 2112;
      *(void *)&v41[2] = v29;
      *(_WORD *)&v41[10] = 2112;
      *(void *)&v41[12] = v30;
      uint64_t v31 = "ProxySession <%{public}@> backgroundSessionDidFinishAppWake block not invoked for UUID %@ for session %@ wit"
            "h identifier %@ outstanding auth tasks %@";
    }
    else
    {
      if (!v24) {
        return (*(uint64_t (**)(void))(a1[6] + 16))();
      }
      uint64_t v33 = a1[4];
      if (v33)
      {
        uint64_t v34 = *(void *)(v33 + 128);
        uint64_t v35 = *(void **)(v33 + 112);
      }
      else
      {
        uint64_t v34 = 0;
        uint64_t v35 = 0;
      }
      uint64_t v36 = a1[5];
      uint64_t v37 = [v35 identifier];
      uint64_t v38 = *(void *)(a1[4] + 200);
      *(_DWORD *)unint64_t v39 = 138544386;
      *(void *)&v39[4] = v34;
      *(_WORD *)&v39[12] = 2112;
      *(void *)&v39[14] = v36;
      *(_WORD *)&v39[22] = 2112;
      uint64_t v40 = v33;
      *(_WORD *)BOOL v41 = 2112;
      *(void *)&v41[2] = v37;
      *(_WORD *)&v41[10] = 2112;
      *(void *)&v41[12] = v38;
      uint64_t v31 = "BackgroundSession <%{public}@> backgroundSessionDidFinishAppWake block not invoked for UUID %@ for session %"
            "@ with identifier %@ outstanding auth tasks %@";
    }
    _os_log_error_impl(&dword_184085000, v23, OS_LOG_TYPE_ERROR, v31, v39, 0x34u);
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  [v18 setAppWakeUUID:0];
  uint64_t v20 = a1[4];
  if (v20) {
    uint64_t v21 = *(void *)(v20 + 72);
  }
  else {
    uint64_t v21 = 0;
  }
  [(__NSCFURLSessionDelegateWrapper *)v21 didFinishEventsForBackgroundURLSession];
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __67____NSURLBackgroundSession_backgroundSessionDidStartAppWake_reply___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) appWakeUUID])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2) {
      uint64_t v3 = *(void **)(v2 + 112);
    }
    else {
      uint64_t v3 = 0;
    }
    int v4 = [v3 _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    int v5 = CFNLog::logger;
    BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v6)
      {
        uint64_t v10 = *(void **)(a1 + 32);
        if (v10) {
          uint64_t v11 = v10[16];
        }
        else {
          uint64_t v11 = 0;
        }
        uint64_t v12 = *(void *)(a1 + 40);
        int v18 = 138543874;
        uint64_t v19 = v11;
        __int16 v20 = 2112;
        uint64_t v21 = v12;
        __int16 v22 = 2112;
        uint64_t v23 = [v10 appWakeUUID];
        uint64_t v13 = "ProxySession <%{public}@> backgroundSessionDidStartAppWake: called with ID: %@, when we already had an app"
              " wake with ID: %@";
LABEL_17:
        _os_log_debug_impl(&dword_184085000, v5, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v18, 0x20u);
      }
    }
    else if (v6)
    {
      uint64_t v15 = *(void **)(a1 + 32);
      if (v15) {
        uint64_t v16 = v15[16];
      }
      else {
        uint64_t v16 = 0;
      }
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = 138543874;
      uint64_t v19 = v16;
      __int16 v20 = 2112;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      uint64_t v23 = [v15 appWakeUUID];
      uint64_t v13 = "BackgroundSession <%{public}@> backgroundSessionDidStartAppWake: called with ID: %@, when we already had an "
            "app wake with ID: %@";
      goto LABEL_17;
    }
  }
  else
  {
    [*(id *)(a1 + 32) setAppWakeUUID:*(void *)(a1 + 40)];
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7, v8, v9);
}

uint64_t __105____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didFinishDownloadForMediaSelectionPropertyList___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 40);

  return objc_msgSend(v2, "_onqueue_didFinishDownloadforMediaSelectionPropertyList:", v3);
}

uint64_t __85____NSURLBackgroundSession_backgroundAVAssetDownloadTask_willDownloadVariants_reply___block_invoke(uint64_t a1)
{
  objc_msgSend(-[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56)), "_onqueue_willDownloadVariants:", *(void *)(a1 + 40));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t __76____NSURLBackgroundSession_backgroundAVAssetDownloadTask_willDownloadToURL___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 40);

  return objc_msgSend(v2, "_onqueue_willDownloadToURL:", v3);
}

uint64_t __100____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didResolveMediaSelectionProperyList_reply___block_invoke(uint64_t a1)
{
  objc_msgSend(-[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56)), "_onqueue_didResolveMediaSelectionPropertyList:", *(void *)(a1 + 40));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t __151____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 72));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);

  return objc_msgSend(v2, "_onqueue_didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:", v3, v4, v5, v6);
}

void __82____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didReceiveDownloadToken___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  [v2 setAVAssetDownloadToken:*(void *)(a1 + 48)];
  if (*(void *)(a1 + 32))
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = *(void *)(a1 + 32);
      if (v3)
      {
        uint64_t v4 = *(void *)(a1 + 48);
        uint64_t v5 = *(NSObject **)(v3 + 88);
        uint64_t v6 = *(void *)(v3 + 96);
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __69__NSURLSession_delegate_AVAssetDownloadTask_didReceiveDownloadToken___block_invoke;
        v7[3] = &unk_1E52568F8;
        v7[4] = v6;
        v7[5] = v3;
        v7[6] = v2;
        v7[7] = v4;
        if (v5) {
          dispatch_async(v5, v7);
        }
        else {
          [*(id *)(v3 + 80) addOperationWithBlock:v7];
        }
      }
    }
  }
}

uint64_t __119____NSURLBackgroundSession_backgroundAVAssetDownloadTaskDidUpdateProgress_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);

  return objc_msgSend(v2, "_onqueue_didReceiveProgressUpdateWithTotalBytesWritten:totalBytesExpectedToWrite:", v3, v4);
}

void __88____NSURLBackgroundSession_backgroundDownloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    [v2 setCountOfBytesReceived:v4];
    [v3 setCountOfBytesExpectedToReceive:v5];
    uint64_t v6 = (uint64_t)v3[88];
    if (!v6) {
      uint64_t v6 = (uint64_t)v3[87];
    }
    -[__NSCFURLSessionDelegateWrapper downloadTask:didResumeAtOffset:expectedTotalBytes:](v6, v3, v4, v5);
  }
}

void __108____NSURLBackgroundSession_backgroundDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    [v2 setCountOfBytesReceived:v5];
    [v3 setCountOfBytesExpectedToReceive:v6];
    uint64_t v7 = (uint64_t)v3[88];
    if (!v7) {
      uint64_t v7 = (uint64_t)v3[87];
    }
    -[__NSCFURLSessionDelegateWrapper downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:completionHandler:](v7, v3, v4, v5, v6, &__block_literal_global_8053);
  }
}

uint64_t __92____NSURLBackgroundSession_backgroundDownloadTask_didFinishDownloadingToURL_response_reply___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 64));
  [v2 setResponse:*(void *)(a1 + 40)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v2)
    {
      uint64_t v3 = *(void **)(a1 + 48);
      uint64_t v4 = (uint64_t)v2[88];
      if (!v4) {
        uint64_t v4 = (uint64_t)v2[87];
      }
      *(void *)uint64_t v24 = MEMORY[0x1E4F143A8];
      *(void *)&v24[8] = 3221225472;
      *(void *)&v24[16] = __67____NSCFBackgroundDownloadTask__onqueue_didFinishDownloadingToURL___block_invoke;
      *(void *)&long long v25 = &unk_1E5257FB0;
      *((void *)&v25 + 1) = v2;
      uint64_t v26 = v3;
      -[__NSCFURLSessionDelegateWrapper downloadTask:didFinishDownloadingToURL:completionHandler:](v4, v2, v3, v24);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v2, "_onqueue_didFinishDownloadingToURL:", *(void *)(a1 + 48));
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[__NSCFBackgroundDataTask _onqueue_didReceiveData:withCompletion:](v2, objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfFile:", objc_msgSend(*(id *)(a1 + 48), "path")), &__block_literal_global_239);
        if (unlink((const char *)[*(id *)(a1 + 48) fileSystemRepresentation]))
        {
          uint64_t v5 = *(void *)(a1 + 32);
          if (v5) {
            uint64_t v6 = *(void **)(v5 + 112);
          }
          else {
            uint64_t v6 = 0;
          }
          int v7 = [v6 _isProxySession];
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
          }
          uint64_t v8 = CFNLog::logger;
          BOOL v9 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
          if (v7)
          {
            if (!v9) {
              return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
            }
            uint64_t v10 = *(void *)(a1 + 32);
            if (v10) {
              uint64_t v11 = *(void *)(v10 + 128);
            }
            else {
              uint64_t v11 = 0;
            }
            uint64_t v12 = [*(id *)(a1 + 48) fileSystemRepresentation];
            int v13 = *__error();
            uint64_t v14 = __error();
            uint64_t v15 = strerror(*v14);
            *(_DWORD *)uint64_t v24 = 138544130;
            *(void *)&v24[4] = v11;
            *(_WORD *)&v24[12] = 2080;
            *(void *)&v24[14] = v12;
            *(_WORD *)&v24[22] = 1024;
            LODWORD(v25) = v13;
            WORD2(v25) = 2080;
            *(void *)((char *)&v25 + 6) = v15;
            uint64_t v16 = "ProxySession <%{public}@> FAILED to UNLINK download file: %s, errno:%d, desc: %s";
          }
          else
          {
            if (!v9) {
              return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
            }
            uint64_t v18 = *(void *)(a1 + 32);
            if (v18) {
              uint64_t v19 = *(void *)(v18 + 128);
            }
            else {
              uint64_t v19 = 0;
            }
            uint64_t v20 = [*(id *)(a1 + 48) fileSystemRepresentation];
            int v21 = *__error();
            __int16 v22 = __error();
            uint64_t v23 = strerror(*v22);
            *(_DWORD *)uint64_t v24 = 138544130;
            *(void *)&v24[4] = v19;
            *(_WORD *)&v24[12] = 2080;
            *(void *)&v24[14] = v20;
            *(_WORD *)&v24[22] = 1024;
            LODWORD(v25) = v21;
            WORD2(v25) = 2080;
            *(void *)((char *)&v25 + 6) = v23;
            uint64_t v16 = "BackgroundSession <%{public}@> FAILED to UNLINK download file: %s, errno:%d, desc: %s";
          }
          _os_log_error_impl(&dword_184085000, v8, OS_LOG_TYPE_ERROR, v16, v24, 0x26u);
        }
      }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __85____NSURLBackgroundSession_willRetryBackgroundDataTask_withError_transactionMetrics___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  objc_msgSend(v2, "set_backgroundTransactionMetrics:", *(void *)(a1 + 40));
  [v2 _logUnlistedTracker:*(void *)(a1 + 40)];
  if (v2)
  {
    -[__NSCFBackgroundDataTask _onqueue_finishStream:]((uint64_t)v2, 1u);
    uint64_t v3 = (uint64_t)v2[88];
    if (!v3) {
      uint64_t v3 = (uint64_t)v2[87];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void **)(a1 + 48);

  -[__NSCFURLSessionDelegateWrapper _willRetryBackgroundDataTask:withError:](v3, v2, v4);
}

void __68____NSURLBackgroundSession_backgroundDataTaskDidBecomeDownloadTask___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v3 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v4 = [(__NSCFBackgroundSessionTask *)[__NSCFBackgroundDownloadTask alloc] initWithBackgroundTask:v3];
  [*(id *)(*(void *)(a1 + 32) + 184) setObject:v4 forKeyedSubscript:v2];
  if (v3)
  {
    uint64_t v5 = (uint64_t)v3[88];
    if (!v5) {
      uint64_t v5 = (uint64_t)v3[87];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  -[__NSCFURLSessionDelegateWrapper dataTask:didBecomeDownloadTask:completionHandler:](v5, v3, v4, &__block_literal_global_237);
}

uint64_t __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 200) addObject:v3];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  int v7 = CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9)
      {
        uint64_t v10 = *(void *)(v9 + 128);
        uint64_t v11 = *(void **)(v9 + 112);
      }
      else
      {
        uint64_t v10 = 0;
        uint64_t v11 = 0;
      }
      uint64_t v12 = [v11 identifier];
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 200);
      *(_DWORD *)long long buf = 138544386;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      long long v25 = v2;
      __int16 v26 = 2112;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      uint64_t v29 = v12;
      __int16 v30 = 2112;
      uint64_t v31 = v13;
      uint64_t v14 = "ProxySession <%{public}@> %{public}@ getting auth headers for session %@ with identifier %@ outstanding auth tasks %@";
LABEL_14:
      _os_log_impl(&dword_184085000, v7, OS_LOG_TYPE_DEFAULT, v14, buf, 0x34u);
    }
  }
  else if (v8)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15)
    {
      uint64_t v16 = *(void *)(v15 + 128);
      uint64_t v17 = *(void **)(v15 + 112);
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
    }
    uint64_t v18 = [v17 identifier];
    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 200);
    *(_DWORD *)long long buf = 138544386;
    uint64_t v23 = v16;
    __int16 v24 = 2114;
    long long v25 = v2;
    __int16 v26 = 2112;
    uint64_t v27 = v15;
    __int16 v28 = 2112;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    uint64_t v31 = v19;
    uint64_t v14 = "BackgroundSession <%{public}@> %{public}@ getting auth headers for session %@ with identifier %@ outstanding auth tasks %@";
    goto LABEL_14;
  }
  uint64_t v20 = (void *)[v2 authenticator];
  return objc_msgSend(v20, "getAuthenticationHeadersForTask:task:response:completionHandler:", MEMORY[0x1E4F143A8], 3221225472, __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke_234, &unk_1E52543B0, *(void *)(a1 + 32), v2, v3, *(void *)(a1 + 48));
}

void __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke_234(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  isa = *(NSObject **)(a1 + 32);
  if (isa) {
    isa = isa[15].isa;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  block[2] = __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke_2;
  block[3] = &unk_1E5254388;
  char v11 = a2;
  uint64_t v8 = a3;
  uint64_t v9 = a4;
  long long v10 = v5;
  dispatch_async(isa, block);
}

void __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 112);
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  long long v5 = CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      uint64_t v10 = *(void *)(v9 + 128);
      char v11 = *(void **)(v9 + 112);
    }
    else
    {
      uint64_t v10 = 0;
      char v11 = 0;
    }
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)long long v59 = 138544130;
    *(void *)&v59[4] = v10;
    *(_WORD *)&v59[12] = 2114;
    *(void *)&v59[14] = v12;
    *(_WORD *)&v59[22] = 2112;
    uint64_t v60 = v9;
    LOWORD(v61) = 2112;
    *(void *)((char *)&v61 + 2) = [v11 identifier];
    uint64_t v13 = "ProxySession <%{public}@> %{public}@ finished getting auth headers for session %@ with identifier %@";
  }
  else
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14)
    {
      uint64_t v15 = *(void *)(v14 + 128);
      uint64_t v16 = *(void **)(v14 + 112);
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
    }
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)long long v59 = 138544130;
    *(void *)&v59[4] = v15;
    *(_WORD *)&v59[12] = 2114;
    *(void *)&v59[14] = v17;
    *(_WORD *)&v59[22] = 2112;
    uint64_t v60 = v14;
    LOWORD(v61) = 2112;
    *(void *)((char *)&v61 + 2) = [v16 identifier];
    uint64_t v13 = "BackgroundSession <%{public}@> %{public}@ finished getting auth headers for session %@ with identifier %@";
  }
  _os_log_impl(&dword_184085000, v5, OS_LOG_TYPE_DEFAULT, v13, v59, 0x2Au);
LABEL_15:
  (*(void (**)(void, void, void, void, uint64_t, uint64_t))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), *(unsigned __int8 *)(a1 + 80), *(void *)(a1 + 48), *(void *)(a1 + 56), v7, v8);
  [*(id *)(*(void *)(a1 + 32) + 200) removeObject:*(void *)(a1 + 64)];
  uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 200) count];
  uint64_t v19 = *(void *)(a1 + 32);
  if (!v18)
  {
    uint64_t v30 = *(void *)(v19 + 224);
    if (!v30) {
      return;
    }
    unint64_t v32 = *(void *)(v30 + 8);
    uint64_t v31 = *(void *)(v30 + 16);
    BOOL v34 = v31 == 0;
    unint64_t v33 = v31 & 1 | v32;
    BOOL v34 = v34 || v33 == 0;
    BOOL v35 = !v34;
    if ((uint64_t (*)())v32 == BlockHolderVar<BOOL>::invoke_reseted && !v35) {
      return;
    }
    int v37 = [*(id *)(v19 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v38 = CFNLog::logger;
    BOOL v39 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v37)
    {
      if (!v39) {
        goto LABEL_54;
      }
      uint64_t v40 = *(void *)(a1 + 32);
      if (v40)
      {
        uint64_t v41 = *(void *)(v40 + 128);
        uint64_t v42 = *(void **)(v40 + 112);
      }
      else
      {
        uint64_t v41 = 0;
        uint64_t v42 = 0;
      }
      uint64_t v43 = objc_msgSend(v42, "identifier", *(void *)v59, *(_OWORD *)&v59[8], v60, v61);
      *(_DWORD *)long long v59 = 138543874;
      *(void *)&v59[4] = v41;
      *(_WORD *)&v59[12] = 2112;
      *(void *)&v59[14] = v40;
      *(_WORD *)&v59[22] = 2112;
      uint64_t v60 = v43;
      uint64_t v44 = "ProxySession <%{public}@> All tasks completed getting auth headers, sending did finish app wake for session "
            "%@ with identifier %@";
    }
    else
    {
      if (!v39) {
        goto LABEL_54;
      }
      uint64_t v50 = *(void *)(a1 + 32);
      if (v50)
      {
        uint64_t v51 = *(void *)(v50 + 128);
        uint64_t v52 = *(void **)(v50 + 112);
      }
      else
      {
        uint64_t v51 = 0;
        uint64_t v52 = 0;
      }
      uint64_t v53 = objc_msgSend(v52, "identifier", *(void *)v59, *(_OWORD *)&v59[8], v60, v61);
      *(_DWORD *)long long v59 = 138543874;
      *(void *)&v59[4] = v51;
      *(_WORD *)&v59[12] = 2112;
      *(void *)&v59[14] = v50;
      *(_WORD *)&v59[22] = 2112;
      uint64_t v60 = v53;
      uint64_t v44 = "BackgroundSession <%{public}@> All tasks completed getting auth headers, sending did finish app wake for ses"
            "sion %@ with identifier %@";
    }
    _os_log_impl(&dword_184085000, v38, OS_LOG_TYPE_DEFAULT, v44, v59, 0x20u);
LABEL_54:
    uint64_t v54 = *(void *)(*(void *)(a1 + 32) + 224);
    if (v54)
    {
      uint64_t v55 = *(void (**)(void *, uint64_t))(v54 + 8);
      uint64_t v56 = *(void *)(v54 + 16);
      uint64_t v57 = (void *)(v54 + (v56 >> 1));
      if (v56) {
        uint64_t v55 = *(void (**)(void *, uint64_t))(*v57 + v55);
      }
      v55(v57, 1);
      uint64_t v58 = *(void *)(*(void *)(a1 + 32) + 224);
      if (v58)
      {
        *(void *)(v58 + 8) = BlockHolderVar<BOOL>::invoke_reseted;
        *(void *)(v58 + 16) = 0;
      }
    }
    return;
  }
  if (v19) {
    uint64_t v20 = *(void **)(v19 + 112);
  }
  else {
    uint64_t v20 = 0;
  }
  int v21 = objc_msgSend(v20, "_isProxySession", *(_OWORD *)v59, *(void *)&v59[16], v60, v61);
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  __int16 v22 = CFNLog::logger;
  BOOL v23 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (!v23) {
      return;
    }
    uint64_t v24 = *(void *)(a1 + 32);
    if (v24)
    {
      uint64_t v25 = *(void *)(v24 + 128);
      __int16 v26 = *(void **)(v24 + 112);
    }
    else
    {
      uint64_t v25 = 0;
      __int16 v26 = 0;
    }
    uint64_t v27 = [v26 identifier];
    uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 200);
    *(_DWORD *)long long v59 = 138544130;
    *(void *)&v59[4] = v25;
    *(_WORD *)&v59[12] = 2112;
    *(void *)&v59[14] = v24;
    *(_WORD *)&v59[22] = 2112;
    uint64_t v60 = v27;
    LOWORD(v61) = 2112;
    *(void *)((char *)&v61 + 2) = v28;
    uint64_t v29 = "ProxySession <%{public}@> Have outstanding tasks getting auth headers for session %@ with identifier %@ outsta"
          "nding auth tasks %@";
  }
  else
  {
    if (!v23) {
      return;
    }
    uint64_t v45 = *(void *)(a1 + 32);
    if (v45)
    {
      uint64_t v46 = *(void *)(v45 + 128);
      uint64_t v47 = *(void **)(v45 + 112);
    }
    else
    {
      uint64_t v46 = 0;
      uint64_t v47 = 0;
    }
    uint64_t v48 = [v47 identifier];
    uint64_t v49 = *(void *)(*(void *)(a1 + 32) + 200);
    *(_DWORD *)long long v59 = 138544130;
    *(void *)&v59[4] = v46;
    *(_WORD *)&v59[12] = 2112;
    *(void *)&v59[14] = v45;
    *(_WORD *)&v59[22] = 2112;
    uint64_t v60 = v48;
    LOWORD(v61) = 2112;
    *(void *)((char *)&v61 + 2) = v49;
    uint64_t v29 = "BackgroundSession <%{public}@> Have outstanding tasks getting auth headers for session %@ with identifier %@ o"
          "utstanding auth tasks %@";
  }
  _os_log_impl(&dword_184085000, v22, OS_LOG_TYPE_DEFAULT, v29, v59, 0x2Au);
}

void __72____NSURLBackgroundSession_backgroundDataTask_didReceiveData_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  uint64_t v3 = *(void **)(a1 + 40);
  int v4 = *(void **)(a1 + 48);

  -[__NSCFBackgroundDataTask _onqueue_didReceiveData:withCompletion:](v2, v3, v4);
}

void __71____NSURLBackgroundSession_backgroundTask_needNewBodyStream_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 48));
  if (v2)
  {
    char v3 = *(unsigned char *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 40);
    -[__NSCFBackgroundDataTask _onqueue_needNewBodyStream:withCompletion:](v2, v3, v4);
  }
  else
  {
    long long v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

void __99____NSURLBackgroundSession_backgroundTask_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  if (v2)
  {
    char v3 = v2;
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    [v2 setCountOfBytesSent:v5];
    [v3 setCountOfBytesExpectedToSend:v6];
    uint64_t v7 = (uint64_t)v3[88];
    if (!v7) {
      uint64_t v7 = (uint64_t)v3[87];
    }
    -[__NSCFURLSessionDelegateWrapper task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:](v7, v3, v4, v5, v6);
  }
}

void __87____NSURLBackgroundSession_backgroundTask_didReceiveResponse_transactionMetrics_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 64));
  if (v2)
  {
    char v3 = v2;
    objc_msgSend(v2, "set_backgroundTransactionMetrics:", *(void *)(a1 + 40));
    [v3 _logUnlistedTracker:*(void *)(a1 + 40)];
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(void **)(a1 + 56);
    objc_msgSend(v3, "_onqueue_didReceiveResponse:", v4);
    uint64_t v6 = (uint64_t)v3[88];
    if (!v6) {
      uint64_t v6 = (uint64_t)v3[87];
    }
    -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveResponse:completionHandler:](v6, v3, v4, v5);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = (void *)[v3 response];
    uint64_t v9 = (void *)[v3 currentRequest];
    uint64_t v10 = [v3 _storagePartitionIdentifier];
    -[__NSURLBackgroundSession setCookiesFromResponse:forCurrentRequest:partitionIdentifier:](v7, v8, v9, v10);
  }
  else
  {
    char v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v11();
  }
}

uint64_t __81____NSURLBackgroundSession_backgroundTask_didReceiveResponse_transactionMetrics___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  objc_msgSend(v2, "set_backgroundTransactionMetrics:", *(void *)(a1 + 40));
  [v2 _logUnlistedTracker:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);

  return objc_msgSend(v2, "_onqueue_didReceiveResponse:", v3);
}

uint64_t __75____NSURLBackgroundSession_backgroundTask_didReceiveInformationalResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 40);

  return objc_msgSend(v2, "_onqueue_didReceiveInformationalResponse:", v3);
}

void __73____NSURLBackgroundSession_backgroundTask_hasConnectionWaitingWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 48));
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = (uint64_t)v2[88];
    if (!v5) {
      uint64_t v5 = (uint64_t)v3[87];
    }
    -[__NSCFURLSessionDelegateWrapper task:_isWaitingForConnectionWithError:](v5, v3, v4);
  }
}

void __74____NSURLBackgroundSession_backgroundTask_hasConnectionWaitingWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);

  -[__NSCFBackgroundSessionTask _onqueue_connectionWaitingWithReason:](v2, v3);
}

void __63____NSURLBackgroundSession_backgroundTaskHasConnectionWaiting___block_invoke(uint64_t a1)
{
  uint64_t v1 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));

  -[__NSCFBackgroundSessionTask _onqueue_connectionWaitingWithReason:](v1, 0);
}

uint64_t __90____NSURLBackgroundSession_backgroundTask__willSendRequestForEstablishedConnection_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  if (v2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __90____NSURLBackgroundSession_backgroundTask__willSendRequestForEstablishedConnection_reply___block_invoke_2;
    v7[3] = &unk_1E5254310;
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    v7[4] = v2;
    v7[5] = v4;
    return objc_msgSend(v2, "_onqueue_willSendRequestForEstablishedConnection:withCompletion:", v3, v7);
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v6();
  }
}

uint64_t __90____NSURLBackgroundSession_backgroundTask__willSendRequestForEstablishedConnection_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) updateCurrentRequest:a2];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __91____NSURLBackgroundSession_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 64));
  -[__NSURLBackgroundSession setCookiesFromResponse:forCurrentRequest:partitionIdentifier:](*(void *)(a1 + 32), *(void **)(a1 + 40), (void *)[v2 currentRequest], objc_msgSend(v2, "_storagePartitionIdentifier"));
  if (objc_msgSend((id)objc_msgSend(v2, "originalRequest"), "valueForHTTPHeaderField:", 0x1EC0A2188)
    || ![*(id *)(a1 + 48) valueForHTTPHeaderField:0x1EC0A2188])
  {
    id v3 = *(id *)(a1 + 48);
  }
  else
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 48) mutableCopy];
    [v4 setValue:0 forHTTPHeaderField:0x1EC0A2188];
    id v3 = v4;
  }
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  char v11 = __91____NSURLBackgroundSession_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply___block_invoke_2;
  uint64_t v12 = &unk_1E52542E8;
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v13 = v2;
  uint64_t v14 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 112);
  }
  else {
    uint64_t v7 = 0;
  }
  if (objc_msgSend(v7, "_overridesBackgroundSessionAutoRedirect", v9, v10))
  {
    if (v2)
    {
      uint64_t v8 = (uint64_t)v2[88];
      if (!v8) {
        uint64_t v8 = (uint64_t)v2[87];
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    -[__NSCFURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:](v8, v2, *(void **)(a1 + 40), v3, &v9);
  }
  else
  {
    v11((uint64_t)&v9, (uint64_t)v3);
  }
}

uint64_t __91____NSURLBackgroundSession_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "updateCurrentRequest:", objc_msgSend(*(id *)(a1 + 32), "requestWithCookiesApplied:", a2));
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __73____NSURLBackgroundSession_backgroundTask_willBeginDelayedRequest_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = (uint64_t)v2[88];
    if (!v4) {
      uint64_t v4 = (uint64_t)v3[87];
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __73____NSURLBackgroundSession_backgroundTask_willBeginDelayedRequest_reply___block_invoke_2;
    v8[3] = &unk_1E5254F88;
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v8[4] = v3;
    v8[5] = v6;
    -[__NSCFURLSessionDelegateWrapper task:willBeginDelayedRequest:completionHandler:](v4, v3, v5, v8);
  }
  else
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

uint64_t __73____NSURLBackgroundSession_backgroundTask_willBeginDelayedRequest_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 1 && a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateCurrentRequest:", objc_msgSend(*(id *)(a1 + 32), "requestWithCookiesApplied:"));
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }

  return v4();
}

void __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(NSURLAuthenticationChallenge **)(a1 + 40);
    uint64_t v5 = [(NSURLAuthenticationChallenge *)v4 protectionSpace];
    if ([(NSString *)[(NSURLProtectionSpace *)v5 authenticationMethod] isEqualToString:@"NSURLAuthenticationMethodServerTrust"])
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 32);
      if (v14) {
        uint64_t v15 = *(void **)(v14 + 112);
      }
      else {
        uint64_t v15 = 0;
      }
      uint64_t v6 = objc_msgSend((id)objc_msgSend(v15, "URLCredentialStorage"), "defaultCredentialForProtectionSpace:", v5);
      if (![*(id *)(a1 + 40) proposedCredential] && v6 && objc_msgSend(v6, "hasPassword")) {
        uint64_t v4 = -[NSURLAuthenticationChallenge initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:]([NSURLAuthenticationChallenge alloc], "initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:", v5, v6, [*(id *)(a1 + 40) previousFailureCount], objc_msgSend(*(id *)(a1 + 40), "failureResponse"), objc_msgSend(*(id *)(a1 + 40), "error"), objc_msgSend(*(id *)(a1 + 40), "sender"));
      }
    }
    [v3 currentRequest];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke_2;
    v16[3] = &unk_1E52542C0;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    v16[4] = v4;
    v16[5] = v7;
    v16[6] = v6;
    v16[7] = v3;
    v16[8] = v8;
    if (!isSessionChallenge(v4)) {
      goto LABEL_11;
    }
    uint64_t v10 = (uint64_t)v3[88];
    if (!v10) {
      uint64_t v10 = (uint64_t)v3[87];
    }
    if ([(__NSCFURLSessionDelegateWrapper *)v10 sessionDidReceiveChallenge])
    {
      uint64_t v11 = (uint64_t)v3[88];
      if (!v11) {
        uint64_t v11 = (uint64_t)v3[87];
      }
      -[__NSCFURLSessionDelegateWrapper didReceiveChallenge:completionHandler:](v11, v4, v16);
    }
    else
    {
LABEL_11:
      uint64_t v12 = (uint64_t)v3[88];
      if (!v12) {
        uint64_t v12 = (uint64_t)v3[87];
      }
      -[__NSCFURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:](v12, v3, v4, v16);
    }
  }
  else
  {
    uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v13();
  }
}

void __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 == 1)
  {
    if (*(void *)(a1 + 32) == *(void *)(a1 + 40))
    {
      uint64_t v5 = 1;
    }
    else
    {
      uint64_t v5 = 0;
      a3 = *(void **)(a1 + 48);
    }
  }
  else
  {
    uint64_t v5 = a2;
  }
  if ([a3 hasPassword]) {
    [a3 password];
  }
  uint64_t v6 = (void *)[a3 identity];
  if (v6)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F3B450]) initWithIdentity:v6];
    objc_initWeak(&location, *(id *)(a1 + 56));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke_3;
    v7[3] = &unk_1E5254298;
    v7[4] = v6;
    objc_copyWeak(&v8, &location);
    [v6 setClientDisconnectionHandler:v7];
    [*(id *)(a1 + 56) addSecKeyProxy:v6];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  (*(void (**)(void, uint64_t, void *, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v5, a3, [v6 endpoint]);
}

uint64_t __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) invalidate];
    [*(id *)(v2 + 32) setClientDisconnectionHandler:0];
    id Weak = objc_loadWeak((id *)(v2 + 40));
    uint64_t v4 = *(void *)(v2 + 32);
    return [Weak removeSecKeyProxy:v4];
  }
  return result;
}

uint64_t __53____NSURLBackgroundSession_backgroundTaskDidSuspend___block_invoke(uint64_t a1)
{
  uint64_t v1 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));

  return [v1 setState:1];
}

uint64_t __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E52541D8;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = a2;
  return [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  global_queue = dispatch_get_global_queue(0, 0);
  id v3 = *(void **)(a1 + 32);

  dispatch_async(global_queue, v3);
}

void __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  global_queue = dispatch_get_global_queue(0, 0);
  id v3 = *(void **)(a1 + 32);

  dispatch_async(global_queue, v3);
}

uint64_t __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) removeCredential:a3 forProtectionSpace:*(void *)(a1 + 40)];
}

void *__120____NSURLBackgroundSession_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke(void *a1, double a2)
{
  uint64_t v4 = a1;
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1[4];
  if (v5)
  {
    uint64_t v6 = &v135;
    if (*(unsigned char *)(v5 + 265))
    {
      int v7 = [*(id *)(v5 + 112) _isProxySession];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      id v8 = CFNLog::logger;
      BOOL v9 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v7)
      {
        if (!v9) {
          goto LABEL_15;
        }
        uint64_t v10 = *(void **)(v5 + 128);
        LODWORD(v135.receiver) = 138543362;
        *(id *)((char *)&v135.receiver + 4) = v10;
        uint64_t v11 = "ProxySession <%{public}@> attempted to create an AVAggregateAssetDownloadTask in a session that has been invalidated";
      }
      else
      {
        if (!v9) {
          goto LABEL_15;
        }
        __int16 v73 = *(void **)(v5 + 128);
        LODWORD(v135.receiver) = 138543362;
        *(id *)((char *)&v135.receiver + 4) = v73;
        uint64_t v11 = "BackgroundSession <%{public}@> attempted to create an AVAggregateAssetDownloadTask in a session that has been invalidated";
      }
      _os_log_error_impl(&dword_184085000, v8, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v135, 0xCu);
LABEL_15:
      unint64_t v33 = (NSString *)dyld_program_sdk_at_least();
      if (v33) {
        __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v33);
      }
      goto LABEL_16;
    }
    uint64_t v12 = (void *)a1[5];
    id newValue = (id)a1[6];
    uint64_t v13 = (void *)a1[7];
    id v118 = (id)a1[8];
    v121 = (void *)a1[9];
    int v14 = -[__NSURLBackgroundSession doesAVAssetDownloadSessionSupportMultipleDownloads](a2);
    uint64_t v15 = (void *)0x1E8F7D000;
    uint64_t v16 = *(void *)(v5 + 272);
    if (v14)
    {
      uint64_t v17 = [__NSCFBackgroundAVAggregateAssetDownloadTaskNoChildTask alloc];
      uint64_t v18 = [(id)v5 defaultTaskGroup];
      uint64_t v19 = *(void *)(v5 + 160);
      *(void *)(v5 + 160) = v19 + 1;
      if (!v17)
      {
        uint64_t v2 = 0;
        if (v16) {
          goto LABEL_111;
        }
LABEL_11:
        uint64_t v21 = [v12 downloadToken];
        if (*(void *)(v5 + 168))
        {
          uint64_t v22 = v21;
          BOOL v23 = v13;
          uint64_t v24 = -[__NSURLBackgroundSession serializableAVAssetDownloadTaskOptionsFromOptions:mediaSelections:downloadConfiguration:](v121, newValue, 0);
          uint64_t v25 = *(void **)(v5 + 168);
          v135.id receiver = (id)MEMORY[0x1E4F143A8];
          v135.super_class = (Class)3221225472;
          v136 = __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke;
          v137 = &unk_1E5254188;
          uint64_t v138 = v5;
          v139 = v2;
          __int16 v26 = (void *)[v25 synchronousRemoteObjectProxyWithErrorHandler:&v135];
          uint64_t v27 = [v121 objectForKeyedSubscript:@"AVAssetDownloadTaskDestinationURLKey"];
          v129.id receiver = 0;
          uint64_t v28 = [v12 propertyListForNSURLSessionAssetReturningError:&v129];
          uint64_t v29 = v2;
          if (v28)
          {
            uint64_t v30 = v28;
            uint64_t v31 = [v29 taskIdentifier];
            uint64_t v32 = [v29 _uniqueIdentifier];
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            *(void *)&long long v141 = __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_215;
            *((void *)&v141 + 1) = &unk_1E52541B0;
            *(void *)&long long v142 = v29;
            *((void *)&v142 + 1) = v5;
            LOBYTE(v111) = 0;
            [v26 avAssetDownloadTaskWithDownloadToken:v22 URL:0 destinationURL:v27 temporaryDestinationURL:0 assetTitle:v23 assetArtworkData:v118 options:v24 assetOptions:v30 identifier:v31 uniqueIdentifier:v32 taskKind:5 enableSPIDelegateCallbacks:v111 reply:&buf];
            uint64_t v2 = v29;
            goto LABEL_109;
          }
          int v74 = [*(id *)(v5 + 112) _isProxySession];
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
          }
          __int16 v75 = CFNLog::logger;
          BOOL v76 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
          if (v74)
          {
            if (v76)
            {
              uint64_t v78 = *(void *)(v5 + 128);
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v78;
              uint64_t v79 = "ProxySession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as the URLAsse"
                    "t PropertyList could not be serialized.";
              goto LABEL_72;
            }
          }
          else if (v76)
          {
            uint64_t v85 = *(void *)(v5 + 128);
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v85;
            uint64_t v79 = "BackgroundSession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as the URLA"
                  "sset PropertyList could not be serialized.";
LABEL_72:
            _os_log_error_impl(&dword_184085000, v75, OS_LOG_TYPE_ERROR, v79, (uint8_t *)&buf, 0xCu);
            if (!v2) {
              goto LABEL_109;
            }
            goto LABEL_68;
          }
          if (!v2) {
            goto LABEL_109;
          }
LABEL_68:
          id receiver = v129.receiver;
LABEL_108:
          objc_setProperty_atomic(v2, v77, receiver, 776);
          goto LABEL_109;
        }
        int v51 = [*(id *)(v5 + 112) _isProxySession];
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        uint64_t v52 = CFNLog::logger;
        BOOL v53 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
        if (v51)
        {
          if (v53)
          {
            uint64_t v54 = *(void **)(v5 + 128);
            LODWORD(v135.receiver) = 138543362;
            *(id *)((char *)&v135.receiver + 4) = v54;
            uint64_t v55 = "ProxySession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as remote sessio"
                  "n is unavailable";
LABEL_70:
            _os_log_error_impl(&dword_184085000, v52, OS_LOG_TYPE_ERROR, v55, (uint8_t *)&v135, 0xCu);
          }
        }
        else if (v53)
        {
          uint64_t v84 = *(void **)(v5 + 128);
          LODWORD(v135.receiver) = 138543362;
          *(id *)((char *)&v135.receiver + 4) = v84;
          uint64_t v55 = "BackgroundSession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as remote ses"
                "sion is unavailable";
          goto LABEL_70;
        }
        uint64_t v80 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v81 = *MEMORY[0x1E4F289A0];
        uint64_t v82 = 0;
        goto LABEL_103;
      }
      v135.id receiver = v17;
      v135.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTaskNoChildTask;
      uint64_t v2 = objc_msgSendSuper2(&v135, sel_initWithTaskGroup_URLAsset_URL_destinationURL_temporaryDestinationURL_assetTitle_assetArtworkData_ident_enableSPIDelegateCallbacks_, v18, v12, 0, 0, 0, v13, v118, v19, 0);
      if (!v16) {
        goto LABEL_11;
      }
LABEL_55:
      if (v2) {
        objc_setProperty_atomic(v2, v20, *(id *)(v5 + 272), 776);
      }
      goto LABEL_111;
    }
    uint64_t v115 = *(void *)(v5 + 272);
    BOOL v35 = [__NSCFBackgroundAVAggregateAssetDownloadTask alloc];
    uint64_t v36 = [(id)v5 defaultTaskGroup];
    uint64_t v38 = *(void *)(v5 + 160);
    *(void *)(v5 + 160) = v38 + 1;
    if (v35)
    {
      BOOL v39 = (void *)v36;
      gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadSession(v37);
      if (!objc_opt_class())
      {
        _os_crash();
        __break(1u);
        goto LABEL_119;
      }
      v129.id receiver = v35;
      v129.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
      uint64_t v40 = objc_msgSendSuper2(&v129, sel_initWithOriginalRequest_ident_taskGroup_, 0, v38, v39);
      uint64_t v2 = v40;
      if (v40)
      {
        uint64_t v120 = v12;
        [v40 setURLAsset:v12];
        objc_setProperty_atomic(v2, v41, newValue, 808);
        objc_setProperty_atomic_copy(v2, v42, v13, 816);
        objc_setProperty_atomic_copy(v2, v43, v118, 824);
        v2[105] = [[NSString alloc] initWithFormat:@"%@.%lu.childAssetDownloadTasks", objc_msgSend((id)objc_msgSend(v2, "_effectiveConfiguration"), "identifier"), v38];
        uint64_t v44 = (void *)[v39 _groupConfiguration];
        uint64_t v45 = v2[105];
        self;
        uint64_t v46 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:v45];
        -[NSURLSessionConfiguration set_sourceApplicationBundleIdentifier:](v46, "set_sourceApplicationBundleIdentifier:", [v44 _sourceApplicationBundleIdentifier]);
        -[NSURLSessionConfiguration set_sourceApplicationSecondaryIdentifier:](v46, "set_sourceApplicationSecondaryIdentifier:", [v44 _sourceApplicationSecondaryIdentifier]);
        -[NSURLSessionConfiguration set_sourceApplicationAuditTokenData:](v46, "set_sourceApplicationAuditTokenData:", [v44 _sourceApplicationAuditTokenData]);
        -[NSURLSessionConfiguration setTLSMaximumSupportedProtocol:](v46, "setTLSMaximumSupportedProtocol:", [v44 TLSMaximumSupportedProtocol]);
        -[NSURLSessionConfiguration setTLSMinimumSupportedProtocol:](v46, "setTLSMinimumSupportedProtocol:", [v44 TLSMinimumSupportedProtocol]);
        [v44 timeoutIntervalForRequest];
        [(NSURLSessionConfiguration *)v46 setTimeoutIntervalForRequest:"setTimeoutIntervalForRequest:"];
        [v44 timeoutIntervalForResource];
        [(NSURLSessionConfiguration *)v46 setTimeoutIntervalForResource:"setTimeoutIntervalForResource:"];
        -[NSURLSessionConfiguration setConnectionProxyDictionary:](v46, "setConnectionProxyDictionary:", [v44 connectionProxyDictionary]);
        -[NSURLSessionConfiguration setHTTPAdditionalHeaders:](v46, "setHTTPAdditionalHeaders:", [v44 HTTPAdditionalHeaders]);
        -[NSURLSessionConfiguration setHTTPMaximumConnectionsPerHost:](v46, "setHTTPMaximumConnectionsPerHost:", [v44 HTTPMaximumConnectionsPerHost]);
        -[NSURLSessionConfiguration setHTTPCookieStorage:](v46, "setHTTPCookieStorage:", [v44 HTTPCookieStorage]);
        -[NSURLSessionConfiguration setURLCache:](v46, "setURLCache:", [v44 URLCache]);
        -[NSURLSessionConfiguration setURLCredentialStorage:](v46, "setURLCredentialStorage:", [v44 URLCredentialStorage]);
        -[NSURLSessionConfiguration setNetworkServiceType:](v46, "setNetworkServiceType:", [v44 networkServiceType]);
        -[NSURLSessionConfiguration setAllowsCellularAccess:](v46, "setAllowsCellularAccess:", [v44 allowsCellularAccess]);
        -[NSURLSessionConfiguration set_TCPAdaptiveReadTimeout:](v46, "set_TCPAdaptiveReadTimeout:", [v44 _TCPAdaptiveReadTimeout]);
        -[NSURLSessionConfiguration set_TCPAdaptiveWriteTimeout:](v46, "set_TCPAdaptiveWriteTimeout:", [v44 _TCPAdaptiveWriteTimeout]);
        -[NSURLSessionConfiguration setDiscretionary:](v46, "setDiscretionary:", [v44 isDiscretionary]);
        uint64_t v47 = +[AVAssetDownloadURLSession sessionWithConfiguration:v46 assetDownloadDelegate:v2 delegateQueue:0];
        uint64_t v48 = v121;
        uint64_t v49 = (void *)[v121 objectForKey:@"AVAssetDownloadTaskMediaSelectionPrefersMultichannelKey"];
        uint64_t v113 = v5;
        v114 = v4;
        int v112 = objc_msgSend((id)objc_msgSend(v121, "objectForKey:", @"AVAssetDownloadTaskMediaSelectionPrefersMultichannelForMostPreferredLanguageOnlyKey"), "BOOLValue");
        if (v112)
        {
          int v50 = 0;
        }
        else if (v49)
        {
          int v50 = [v49 BOOLValue];
        }
        else
        {
          int v50 = 1;
        }
        v117 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long buf = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        uint64_t v56 = [newValue countByEnumeratingWithState:&buf objects:&v135 count:16];
        id v57 = v118;
        if (v56)
        {
          uint64_t v58 = v56;
          uint64_t v59 = *(void *)v141;
          do
          {
            for (uint64_t i = 0; i != v58; ++i)
            {
              long long v61 = v13;
              if (*(void *)v141 != v59) {
                objc_enumerationMutation(newValue);
              }
              uint64_t v62 = *(void *)(*((void *)&buf + 1) + 8 * i);
              if (v48) {
                id v63 = (id)[v48 mutableCopy];
              }
              else {
                id v63 = (id)[MEMORY[0x1E4F1CA60] dictionary];
              }
              uint64_t v64 = v63;
              [v63 setObject:v62 forKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionKey"];
              [v64 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"AVAssetDownloadSessionMediaSelectionPrefersMultichannelKey"];
              objc_msgSend(v64, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "taskIdentifier")), @"AVAggregateAssetDownloadTaskIdentifierKey");
              uint64_t v13 = v61;
              uint64_t v65 = v61;
              id v57 = v118;
              uint64_t v66 = [(AVAssetDownloadURLSession *)v47 assetDownloadTaskWithURLAsset:v120 assetTitle:v65 assetArtworkData:v118 options:v64];
              if (v66) {
                [v117 addObject:v66];
              }
              if (v50)
              {
                id v67 = v121
                    ? (id)[v64 mutableCopy]
                    : (id)[MEMORY[0x1E4F1CA60] dictionary];
                id v68 = v67;
                [v67 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"AVAssetDownloadSessionMediaSelectionPrefersMultichannelKey"];
                uint64_t v69 = [(AVAssetDownloadURLSession *)v47 assetDownloadTaskWithURLAsset:v120 assetTitle:v13 assetArtworkData:v118 options:v68];
                if (v69) {
                  [v117 addObject:v69];
                }
              }
              uint64_t v48 = v121;
            }
            uint64_t v58 = [newValue countByEnumeratingWithState:&buf objects:&v135 count:16];
          }
          while (v58);
        }
        uint64_t v4 = v114;
        if (v112)
        {
          id v70 = v48
              ? (id)[v48 mutableCopy]
              : (id)[MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v71 = v70;
          [v70 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"AVAssetDownloadSessionMediaSelectionPrefersMultichannelKey"];
          objc_msgSend(v71, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "taskIdentifier")), @"AVAggregateAssetDownloadTaskIdentifierKey");
          uint64_t v72 = [(AVAssetDownloadURLSession *)v47 assetDownloadTaskWithURLAsset:v120 assetTitle:v13 assetArtworkData:v57 options:v71];
          if (v72) {
            [v117 addObject:v72];
          }
        }
        v2[107] = [v117 copy];
        v2[106] = v47;
        uint64_t v5 = v113;
        uint64_t v12 = v120;
        if (v115) {
          goto LABEL_55;
        }
        goto LABEL_79;
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
    if (v115) {
      goto LABEL_55;
    }
LABEL_79:
    uint64_t v15 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long buf = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    uint64_t v86 = [newValue countByEnumeratingWithState:&buf objects:&v135 count:16];
    if (v86)
    {
      uint64_t v87 = v86;
      uint64_t v88 = *(void *)v141;
      do
      {
        for (uint64_t j = 0; j != v87; ++j)
        {
          if (*(void *)v141 != v88) {
            objc_enumerationMutation(newValue);
          }
          objc_msgSend(v15, "addObject:", objc_msgSend(*(id *)(*((void *)&buf + 1) + 8 * j), "propertyList"));
        }
        uint64_t v87 = [newValue countByEnumeratingWithState:&buf objects:&v135 count:16];
      }
      while (v87);
    }
    uint64_t v90 = v12;
    BOOL v39 = (void *)[v12 URL];
    v91 = *(void **)(v5 + 168);
    if (v91)
    {
      v129.id receiver = (id)MEMORY[0x1E4F143A8];
      uint64_t v3 = 3221225472;
      v129.super_class = (Class)3221225472;
      v130 = __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_216;
      v131 = &unk_1E5254090;
      uint64_t v132 = v5;
      v133 = v2;
      v134 = v39;
      BOOL v35 = (__NSCFBackgroundAVAggregateAssetDownloadTask *)[v91 synchronousRemoteObjectProxyWithErrorHandler:&v129];
      uint64_t v92 = -[__NSURLBackgroundSession serializableAVAssetDownloadTaskOptionsFromOptions:mediaSelections:downloadConfiguration:](v121, newValue, 0);
      id v122 = 0;
      uint64_t v93 = [v90 propertyListForNSURLSessionAssetReturningError:&v122];
      if (v93)
      {
        uint64_t v6 = (objc_super *)v93;
        v121 = v13;
        uint64_t v38 = [v90 downloadToken];
        v119 = v92;
        if (v2)
        {
          uint64_t v94 = v2[105];
LABEL_90:
          uint64_t v95 = [v2 taskIdentifier];
          uint64_t v96 = [v2 _uniqueIdentifier];
          *(void *)&long long v123 = MEMORY[0x1E4F143A8];
          *((void *)&v123 + 1) = v3;
          v124 = __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_217;
          v125 = &unk_1E52540B8;
          v126 = v2;
          uint64_t v127 = v5;
          v128 = v39;
          [(__NSCFBackgroundAVAggregateAssetDownloadTask *)v35 avAggregateAssetDownloadTaskWithDownloadToken:v38 serializedMediaSelections:v15 assetTitle:v121 assetArtworkData:v118 options:v119 assetOptions:v6 childDownloadSessionIdentifier:v94 identifier:v95 uniqueIdentifier:v96 reply:&v123];
          goto LABEL_109;
        }
LABEL_119:
        uint64_t v94 = 0;
        goto LABEL_90;
      }
      int v102 = [*(id *)(v5 + 112) _isProxySession];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      uint64_t v103 = CFNLog::logger;
      BOOL v104 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v102)
      {
        if (v104)
        {
          uint64_t v105 = *(void *)(v5 + 128);
          LODWORD(v123) = 138543362;
          *(void *)((char *)&v123 + 4) = v105;
          v106 = "ProxySession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as the URLAsset P"
                 "ropertyList could not be serialized.";
          goto LABEL_116;
        }
      }
      else if (v104)
      {
        uint64_t v110 = *(void *)(v5 + 128);
        LODWORD(v123) = 138543362;
        *(void *)((char *)&v123 + 4) = v110;
        v106 = "BackgroundSession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as the URLAsse"
               "t PropertyList could not be serialized.";
LABEL_116:
        _os_log_error_impl(&dword_184085000, v103, OS_LOG_TYPE_ERROR, v106, (uint8_t *)&v123, 0xCu);
        if (!v2)
        {
LABEL_109:
          if (v2) {
            goto LABEL_110;
          }
          goto LABEL_111;
        }
        goto LABEL_107;
      }
      if (!v2) {
        goto LABEL_109;
      }
LABEL_107:
      id receiver = v122;
      goto LABEL_108;
    }
    int v97 = [*(id *)(v5 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v98 = CFNLog::logger;
    BOOL v99 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v97)
    {
      if (v99)
      {
        v100 = *(void **)(v5 + 128);
        LODWORD(v129.receiver) = 138543362;
        *(id *)((char *)&v129.receiver + 4) = v100;
        v101 = "ProxySession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as remote session is unavailable";
LABEL_114:
        _os_log_error_impl(&dword_184085000, v98, OS_LOG_TYPE_ERROR, v101, (uint8_t *)&v129, 0xCu);
      }
    }
    else if (v99)
    {
      v109 = *(void **)(v5 + 128);
      LODWORD(v129.receiver) = 138543362;
      *(id *)((char *)&v129.receiver + 4) = v109;
      v101 = "BackgroundSession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as remote sessio"
             "n is unavailable";
      goto LABEL_114;
    }
    uint64_t v80 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v81 = *MEMORY[0x1E4F289A0];
    uint64_t v82 = v39;
LABEL_103:
    id v107 = objc_msgSend(v80, "_web_errorWithDomain:code:URL:", v81, -1, v82);
    if (v2)
    {
      objc_setProperty_atomic(v2, v108, v107, 776);
LABEL_110:
      objc_msgSend(*(id *)(v5 + 184), "setObject:forKeyedSubscript:", v2, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "taskIdentifier")));
    }
LABEL_111:
    result = v2;
    goto LABEL_112;
  }
LABEL_16:
  result = 0;
LABEL_112:
  *(void *)(*(void *)(v4[10] + 8) + 40) = result;
  return result;
}

uint64_t __68____NSURLBackgroundSession_performBlockOnQueueAndRethrowExceptions___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  int v7 = CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      uint64_t v10 = *(void *)(v10 + 128);
    }
    int v14 = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = a2;
    uint64_t v11 = "ProxySession <%{public}@> error requesting an AVAggregateAssetDownloadTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      uint64_t v13 = *(void *)(v13 + 128);
    }
    int v14 = 138543618;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    uint64_t v17 = a2;
    uint64_t v11 = "BackgroundSession <%{public}@> error requesting an AVAggregateAssetDownloadTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_184085000, v7, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v14, 0x16u);
LABEL_11:
  uint64_t v12 = *(void **)(a1 + 40);
  if (v12) {
    objc_setProperty_atomic(v12, v9, *(id *)(*(void *)(a1 + 32) + 272), 776);
  }
}

void __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_215(uint64_t a1, const char *a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3) {
      objc_setProperty_atomic(v3, a2, *(id *)(*(void *)(a1 + 40) + 272), 776);
    }
  }
}

void __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_216(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[4];
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  int v7 = CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v10 = a1[4];
    if (v10) {
      uint64_t v10 = *(void *)(v10 + 128);
    }
    int v15 = 138543618;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = a2;
    uint64_t v11 = "ProxySession <%{public}@> error requesting an AVAggregateAssetDownloadTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v14 = a1[4];
    if (v14) {
      uint64_t v14 = *(void *)(v14 + 128);
    }
    int v15 = 138543618;
    uint64_t v16 = v14;
    __int16 v17 = 2112;
    uint64_t v18 = a2;
    uint64_t v11 = "BackgroundSession <%{public}@> error requesting an AVAggregateAssetDownloadTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_184085000, v7, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0x16u);
LABEL_11:
  uint64_t v12 = (void *)a1[5];
  if (a1[4])
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, a1[6]);
    if (!v12) {
      return;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if (!v12) {
      return;
    }
  }
  objc_setProperty_atomic(v12, v9, v13, 776);
}

void __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_217(void *a1, const char *a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = (void *)a1[4];
    if (a1[5])
    {
      uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, a1[6]);
      if (!v2) {
        return;
      }
    }
    else
    {
      uint64_t v3 = 0;
      if (!v2) {
        return;
      }
    }
    objc_setProperty_atomic(v2, a2, v3, 776);
  }
}

uint64_t __116____NSURLBackgroundSession_serializableAVAssetDownloadTaskOptionsFromOptions_mediaSelections_downloadConfiguration___block_invoke()
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadConfiguration(v0),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v1 = 0;
  }
  else
  {
    objc_opt_class();
    char v1 = objc_opt_isKindOfClass() ^ 1;
  }
  return v1 & 1;
}

id *__117____NSURLBackgroundSession_AVAssetDownloadTaskForURLAsset_assetTitle_assetArtworkData_options_downloadConfiguration___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [*(id *)(a1 + 32) _destinationURL];
  }
  else {
    uint64_t v2 = 0;
  }
  result = -[__NSURLBackgroundSession _onqueue_AVAssetDownloadTaskForURLAsset:URL:destinationURL:assetTitle:assetArtworkData:options:downloadConfiguration:enableSPIDelegateCallbacks:](*(id **)(a1 + 40), *(void **)(a1 + 48), 0, v2, *(void *)(a1 + 56), *(void *)(a1 + 64), *(void **)(a1 + 72), *(void *)(a1 + 32), 0);
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = result;
  return result;
}

void __172____NSURLBackgroundSession__onqueue_AVAssetDownloadTaskForURLAsset_URL_destinationURL_assetTitle_assetArtworkData_options_downloadConfiguration_enableSPIDelegateCallbacks___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[4];
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  int v7 = CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v10 = a1[4];
    if (v10) {
      uint64_t v10 = *(void *)(v10 + 128);
    }
    int v15 = 138543618;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = a2;
    uint64_t v11 = "ProxySession <%{public}@> error requesting an AVAssetDownloadTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v14 = a1[4];
    if (v14) {
      uint64_t v14 = *(void *)(v14 + 128);
    }
    int v15 = 138543618;
    uint64_t v16 = v14;
    __int16 v17 = 2112;
    uint64_t v18 = a2;
    uint64_t v11 = "BackgroundSession <%{public}@> error requesting an AVAssetDownloadTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_184085000, v7, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0x16u);
LABEL_11:
  uint64_t v12 = (void *)a1[5];
  if (a1[4])
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, a1[6]);
    if (!v12) {
      return;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if (!v12) {
      return;
    }
  }
  objc_setProperty_atomic(v12, v9, v13, 776);
}

void __172____NSURLBackgroundSession__onqueue_AVAssetDownloadTaskForURLAsset_URL_destinationURL_assetTitle_assetArtworkData_options_downloadConfiguration_enableSPIDelegateCallbacks___block_invoke_214(void *a1, const char *a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = (void *)a1[4];
    if (a1[5])
    {
      uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, a1[6]);
      if (!v2) {
        return;
      }
    }
    else
    {
      uint64_t v3 = 0;
      if (!v2) {
        return;
      }
    }
    objc_setProperty_atomic(v2, a2, v3, 776);
  }
}

id *__82____NSURLBackgroundSession_AVAssetDownloadTaskForURLAsset_destinationURL_options___block_invoke(uint64_t a1)
{
  result = -[__NSURLBackgroundSession _onqueue_AVAssetDownloadTaskForURLAsset:URL:destinationURL:assetTitle:assetArtworkData:options:downloadConfiguration:enableSPIDelegateCallbacks:](*(id **)(a1 + 32), *(void **)(a1 + 40), 0, *(void *)(a1 + 48), 0, 0, *(void **)(a1 + 56), 0, 0);
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
  return result;
}

id *__78____NSURLBackgroundSession__AVAssetDownloadTaskForURL_destinationURL_options___block_invoke(uint64_t a1)
{
  result = -[__NSURLBackgroundSession _onqueue_AVAssetDownloadTaskForURLAsset:URL:destinationURL:assetTitle:assetArtworkData:options:downloadConfiguration:enableSPIDelegateCallbacks:](*(id **)(a1 + 32), 0, *(void *)(a1 + 40), *(void *)(a1 + 48), 0, 0, *(void **)(a1 + 56), 0, 1);
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
  return result;
}

void __60____NSURLBackgroundSession__onqueue_downloadTaskForRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  int v7 = CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    *(_DWORD *)__int16 v17 = 138543618;
    *(void *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    uint64_t v10 = "ProxySession <%{public}@> error requesting a NSURLSessionDownloadTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      uint64_t v16 = *(void *)(v16 + 128);
    }
    *(_DWORD *)__int16 v17 = 138543618;
    *(void *)&v17[4] = v16;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    uint64_t v10 = "BackgroundSession <%{public}@> error requesting a NSURLSessionDownloadTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_184085000, v7, OS_LOG_TYPE_ERROR, v10, v17, 0x16u);
LABEL_11:
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 48), "URL", *(_OWORD *)v17, *(void *)&v17[16], v18);
  if (v12)
  {
    int v15 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, v13);
    if (!v11) {
      return;
    }
  }
  else
  {
    int v15 = 0;
    if (!v11) {
      return;
    }
  }
  objc_setProperty_atomic(v11, v14, v15, 776);
}

void __63____NSURLBackgroundSession__onqueue_downloadTaskForResumeData___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  int v7 = CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    *(_DWORD *)__int16 v17 = 138543618;
    *(void *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    uint64_t v10 = "ProxySession <%{public}@> error requesting a NSURLSessionDownloadTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      uint64_t v16 = *(void *)(v16 + 128);
    }
    *(_DWORD *)__int16 v17 = 138543618;
    *(void *)&v17[4] = v16;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    uint64_t v10 = "BackgroundSession <%{public}@> error requesting a NSURLSessionDownloadTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_184085000, v7, OS_LOG_TYPE_ERROR, v10, v17, 0x16u);
LABEL_11:
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 48), "URL", *(_OWORD *)v17, *(void *)&v17[16], v18);
  if (v12)
  {
    int v15 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, v13);
    if (!v11) {
      return;
    }
  }
  else
  {
    int v15 = 0;
    if (!v11) {
      return;
    }
  }
  objc_setProperty_atomic(v11, v14, v15, 776);
}

void __63____NSURLBackgroundSession__onqueue_downloadTaskForResumeData___block_invoke_160(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 48) URL];
    if (v3)
    {
      int v6 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, v4);
      if (!v2) {
        return;
      }
    }
    else
    {
      int v6 = 0;
      if (!v2) {
        return;
      }
    }
    objc_setProperty_atomic(v2, v5, v6, 776);
  }
}

void __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_140(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)[a2 protocol];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(a2, "host"))) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5
    && (*(unsigned char *)(a1 + 48) && ([v4 isEqualToString:@"https"] & 1) != 0
     || *(unsigned char *)(a1 + 49) && [v4 isEqualToString:@"http"]))
  {
    int v6 = [+[NSURLCredentialStorage sharedCredentialStorage] defaultCredentialForProtectionSpace:a2];
    if (v6)
    {
      int v7 = v6;
      BOOL v8 = *(__CFDictionary **)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
      CFDictionarySetValue(v8, a2, v7);
    }
  }
}

void __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    BOOL v5 = *(void **)(v4 + 112);
  }
  else {
    BOOL v5 = 0;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  int v7 = CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    *(_DWORD *)__int16 v17 = 138543618;
    *(void *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    uint64_t v10 = "ProxySession <%{public}@> error requesting a NSURLSessionUploadTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      uint64_t v16 = *(void *)(v16 + 128);
    }
    *(_DWORD *)__int16 v17 = 138543618;
    *(void *)&v17[4] = v16;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    uint64_t v10 = "BackgroundSession <%{public}@> error requesting a NSURLSessionUploadTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_184085000, v7, OS_LOG_TYPE_ERROR, v10, v17, 0x16u);
LABEL_11:
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 48), "URL", *(_OWORD *)v17, *(void *)&v17[16], v18);
  if (v12)
  {
    int v15 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, v13);
    if (!v11) {
      return;
    }
  }
  else
  {
    int v15 = 0;
    if (!v11) {
      return;
    }
  }
  objc_setProperty_atomic(v11, v14, v15, 776);
}

void __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_145(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 48) URL];
    if (v3)
    {
      int v6 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, v4);
      if (!v2) {
        return;
      }
    }
    else
    {
      int v6 = 0;
      if (!v2) {
        return;
      }
    }
    objc_setProperty_atomic(v2, v5, v6, 776);
  }
}

void __62____NSURLBackgroundSession__onqueue_dataTaskWithTaskForClass___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    BOOL v5 = *(void **)(v4 + 112);
  }
  else {
    BOOL v5 = 0;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  int v7 = CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    *(_DWORD *)__int16 v17 = 138543618;
    *(void *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    uint64_t v10 = "ProxySession <%{public}@> error requesting a NSURLSessionDataTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      uint64_t v16 = *(void *)(v16 + 128);
    }
    *(_DWORD *)__int16 v17 = 138543618;
    *(void *)&v17[4] = v16;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    uint64_t v10 = "BackgroundSession <%{public}@> error requesting a NSURLSessionDataTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_184085000, v7, OS_LOG_TYPE_ERROR, v10, v17, 0x16u);
LABEL_11:
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 48), "URL", *(_OWORD *)v17, *(void *)&v17[16], v18);
  if (v12)
  {
    int v15 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, v13);
    if (!v11) {
      return;
    }
  }
  else
  {
    int v15 = 0;
    if (!v11) {
      return;
    }
  }
  objc_setProperty_atomic(v11, v14, v15, 776);
}

uint64_t __59____NSURLBackgroundSession__useTLSSessionCacheFromSession___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)-[__NSURLBackgroundSession ensureRemoteSession](*(void *)(a1 + 32));
  uint64_t v3 = [*(id *)(a1 + 32) _tlsSessionCachePrefix];

  return [v2 setTLSSessionCachePrefix:v3];
}

uint64_t __63____NSURLBackgroundSession_appWasLaunchedForBackgroundSession___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 112);
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  BOOL v5 = CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        uint64_t v7 = *(void *)(v7 + 128);
      }
      int v11 = 138543362;
      uint64_t v12 = v7;
      BOOL v8 = "ProxySession <%{public}@> client was launched for background session";
LABEL_14:
      _os_log_impl(&dword_184085000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    int v11 = 138543362;
    uint64_t v12 = v9;
    BOOL v8 = "BackgroundSession <%{public}@> client was launched for background session";
    goto LABEL_14;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 281) = 1;
  return -[__NSURLBackgroundSession ensureRemoteSession](*(void *)(a1 + 32));
}

uint64_t __45____NSURLBackgroundSession_wentToBackground___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 112);
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  BOOL v5 = CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        uint64_t v7 = *(void *)(v7 + 128);
      }
      int v11 = 138543362;
      uint64_t v12 = v7;
      BOOL v8 = "ProxySession <%{public}@> client transitioning to background";
LABEL_14:
      _os_log_impl(&dword_184085000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    int v11 = 138543362;
    uint64_t v12 = v9;
    BOOL v8 = "BackgroundSession <%{public}@> client transitioning to background";
    goto LABEL_14;
  }
  -[__NSURLBackgroundSession ensureRemoteSession](*(void *)(a1 + 32));
  return objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 176), "remoteObjectProxy"), "dropBoost");
}

void __95____NSURLBackgroundSession_initWithConfiguration_delegate_delegateQueue_delegateDispatchQueue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 168))
  {
    if (*(_DWORD *)(v2 + 284))
    {
      -[__NSURLBackgroundSession setupXPCConnection](v2);
      -[__NSURLBackgroundSession setupBackgroundSession](*(void *)(a1 + 32));
      uint64_t v3 = *(void *)(a1 + 32);
      if (*(void *)(v3 + 216))
      {
        -[__NSURLBackgroundSession sendInvalidationRequest](v3);
      }
    }
  }
}

@end