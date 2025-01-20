@interface AIASSession
- (AIASSession)init;
- (BOOL)invalidated;
- (NSMutableDictionary)taskMap;
- (NSURLSession)URLSession;
- (id)getRequest:(id)a3;
- (id)requestWithURL:(id)a3 data:(__CFDictionary *)a4 clientInfo:(id)a5 proxiedClientInfo:(id)a6 companionClientInfo:(id)a7 appleITeamId:(id)a8 appleIClientId:(id)a9 additionalHeaders:(id)a10;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)invalidateAndCancel;
- (void)setInvalidated:(BOOL)a3;
- (void)setTaskMap:(id)a3;
- (void)setURLSession:(id)a3;
@end

@implementation AIASSession

- (AIASSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)AIASSession;
  v2 = [(AIASSession *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(AIASSession *)v2 setTaskMap:v3];

    [(AIASSession *)v2 setInvalidated:0];
  }
  return v2;
}

- (id)getRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  v6 = [(AIASSession *)v5 taskMap];
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "taskIdentifier"));
  v8 = [v6 objectForKeyedSubscript:v7];

  objc_sync_exit(v5);
  return v8;
}

- (id)requestWithURL:(id)a3 data:(__CFDictionary *)a4 clientInfo:(id)a5 proxiedClientInfo:(id)a6 companionClientInfo:(id)a7 appleITeamId:(id)a8 appleIClientId:(id)a9 additionalHeaders:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v23 = [AIASRequest alloc];
  v40 = v17;
  id v24 = v17;
  v25 = v18;
  v26 = v19;
  v27 = [(AIASRequest *)v23 initWithURL:v16 data:a4 clientInfo:v24 proxiedClientInfo:v25 companionClientInfo:v19 appleITeamId:v20 appleIClientId:v21 additionalHeaders:v22];
  if (v27)
  {
    id v39 = v16;
    v28 = [(AIASSession *)self URLSession];
    [(AIASRequest *)v27 setSession:v28];

    v29 = [(AIASSession *)self URLSession];
    v30 = [(AIASRequest *)v27 URLRequest];
    v31 = [v29 dataTaskWithRequest:v30];
    [(AIASRequest *)v27 setTask:v31];

    v32 = self;
    objc_sync_enter(v32);
    v33 = [(AIASSession *)v32 taskMap];
    v34 = NSNumber;
    v35 = [(AIASRequest *)v27 task];
    v36 = objc_msgSend(v34, "numberWithUnsignedInteger:", objc_msgSend(v35, "taskIdentifier"));
    [v33 setObject:v27 forKeyedSubscript:v36];

    objc_sync_exit(v32);
    v37 = v27;
    id v16 = v39;
  }

  return v27;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v9 = a5;
  v10 = (void (**)(id, uint64_t, void))a6;
  v11 = [(AIASSession *)self getRequest:a4];
  if (!v11) {
    goto LABEL_33;
  }
  v12 = [v9 protectionSpace];
  v13 = [v12 authenticationMethod];
  int v14 = [v13 isEqualToString:*MEMORY[0x263EFC5A0]];

  if (!v14)
  {
    v10[2](v10, 1, 0);
    goto LABEL_34;
  }
  v15 = [v9 protectionSpace];
  id v16 = (__SecTrust *)[v15 serverTrust];

  id v17 = _AIDASOSLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136446210;
    v31 = "-[AIASSession URLSession:task:didReceiveChallenge:completionHandler:]";
    _os_log_impl(&dword_210AA1000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: checking pinning", (uint8_t *)&v30, 0xCu);
  }

  id v18 = [v9 protectionSpace];
  id v19 = [v18 host];
  int v30 = 0;
  AppleGSService = (const void *)SecPolicyCreateAppleGSService();
  if (AppleGSService)
  {
    id v21 = AppleGSService;
    if (SecTrustSetPolicies(v16, AppleGSService) || MEMORY[0x216679830](v16, &v30))
    {
      CFRelease(v21);
    }
    else
    {
      int v22 = v30;
      CFRelease(v21);
      if (v22 == 1 || v22 == 4)
      {

        goto LABEL_11;
      }
    }
  }
  if (!allowSkipSettingOnInternalHardware(@"AppleIDAuthSupportNoPinning", 0)) {
    goto LABEL_28;
  }
  SecPolicyRef SSL = SecPolicyCreateSSL(1u, v19);
  if (!SSL) {
    goto LABEL_28;
  }
  SecPolicyRef v28 = SSL;
  if (SecTrustSetPolicies(v16, SSL) || MEMORY[0x216679830](v16, &v30))
  {
    CFRelease(v28);
LABEL_28:

    goto LABEL_29;
  }
  int v29 = v30;
  CFRelease(v28);

  if (v29 != 1 && v29 != 4)
  {
LABEL_29:
    v25 = _AIDASOSLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136446210;
      v31 = "-[AIASSession URLSession:task:didReceiveChallenge:completionHandler:]";
      v26 = "%{public}s: pinning failed";
      goto LABEL_31;
    }
LABEL_32:

LABEL_33:
    v10[2](v10, 2, 0);
    goto LABEL_34;
  }
LABEL_11:
  if ([v11 context]
    && (checkChannelBindings(v16, (CFDictionaryRef *)[v11 context]) & 1) == 0)
  {
    v25 = _AIDASOSLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136446210;
      v31 = "-[AIASSession URLSession:task:didReceiveChallenge:completionHandler:]";
      v26 = "%{public}s: channel bindings failed";
LABEL_31:
      _os_log_impl(&dword_210AA1000, v25, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v30, 0xCu);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  v23 = _AIDASOSLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136446210;
    v31 = "-[AIASSession URLSession:task:didReceiveChallenge:completionHandler:]";
    _os_log_impl(&dword_210AA1000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s: use credentials", (uint8_t *)&v30, 0xCu);
  }

  id v24 = [MEMORY[0x263EFC610] credentialForTrust:v16];
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v24);

LABEL_34:
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a5;
  v8 = [(AIASSession *)self getRequest:a4];
  if (v8)
  {
    id v9 = _AIDASOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446722;
      v12 = "-[AIASSession URLSession:dataTask:didReceiveData:]";
      __int16 v13 = 2112;
      int v14 = v8;
      __int16 v15 = 2048;
      uint64_t v16 = [v7 length];
      _os_log_impl(&dword_210AA1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: %@ got more data: %lu bytes", (uint8_t *)&v11, 0x20u);
    }

    v10 = [v8 data];
    [v10 appendData:v7];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(AIASSession *)self getRequest:v9];
  if (v11)
  {
    v12 = [v9 description];
    [v11 setNetworkTaskDescription:v12];

    __int16 v13 = _AIDASOSLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v11 networkTaskDescription];
      int v21 = 136446978;
      int v22 = "-[AIASSession URLSession:task:didCompleteWithError:]";
      __int16 v23 = 2112;
      id v24 = v11;
      __int16 v25 = 2112;
      v26 = v14;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl(&dword_210AA1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: %@: %@", (uint8_t *)&v21, 0x2Au);
    }
    id v15 = [v11 session];
    BOOL v16 = v15 == v8;

    if (v16)
    {
      if (v10) {
        [v11 setError:v10];
      }
      else {
        [v11 setSuccess:1];
      }
      id v18 = [v11 sema];
      dispatch_semaphore_signal(v18);

      uint64_t v17 = self;
      objc_sync_enter(v17);
      id v19 = [(AIASSession *)v17 taskMap];
      id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "taskIdentifier"));
      [v19 removeObjectForKey:v20];

      objc_sync_exit(v17);
    }
    else
    {
      _AIDASOSLog();
      uint64_t v17 = (AIASSession *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136446210;
        int v22 = "-[AIASSession URLSession:task:didCompleteWithError:]";
        _os_log_impl(&dword_210AA1000, &v17->super, OS_LOG_TYPE_DEFAULT, "%{public}s: got reply after we abandoned the request", (uint8_t *)&v21, 0xCu);
      }
    }
  }
}

- (void)invalidateAndCancel
{
  obj = self;
  objc_sync_enter(obj);
  if (![(AIASSession *)obj invalidated])
  {
    v2 = [(AIASSession *)obj URLSession];
    [v2 invalidateAndCancel];

    [(AIASSession *)obj setInvalidated:1];
  }
  objc_sync_exit(obj);
}

- (NSMutableDictionary)taskMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTaskMap:(id)a3
{
}

- (NSURLSession)URLSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setURLSession:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_taskMap, 0);
}

@end