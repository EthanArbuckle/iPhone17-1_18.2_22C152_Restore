@interface NSURLSessionTaskLocalHTTPAuthenticator
- (NSURLSessionAppleIDContext)externalAuthenticator;
- (NSURLSessionTaskLocalHTTPAuthenticator)initWithSessionAuthenticator:(id)a3 statusCodes:(id)a4;
- (void)dealloc;
- (void)getAuthenticationHeadersForTask:(id)a3 task:(id)a4 response:(id)a5 completionHandler:(id)a6;
- (void)setExternalAuthenticator:(id)a3;
@end

@implementation NSURLSessionTaskLocalHTTPAuthenticator

- (void)setExternalAuthenticator:(id)a3
{
}

- (NSURLSessionAppleIDContext)externalAuthenticator
{
  return (NSURLSessionAppleIDContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)getAuthenticationHeadersForTask:(id)a3 task:(id)a4 response:(id)a5 completionHandler:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v11 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = [a4 _loggableDescription];
    __int16 v15 = 2112;
    id v16 = a5;
    __int16 v17 = 2112;
    v18 = [(NSURLSessionTaskHTTPAuthenticator *)self statusCodes];
    _os_log_impl(&dword_184085000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ local authenticator getting headers for %@ codes %@", buf, 0x20u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke;
  v12[3] = &unk_1E5257F80;
  v12[4] = self;
  v12[5] = a4;
  v12[6] = a3;
  v12[7] = a5;
  v12[8] = a6;
  -[NSURLSession runDelegateBlock:]((uint64_t)a3, v12);
}

uint64_t __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) externalAuthenticator];
  if (objc_opt_respondsToSelector())
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v2 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 40) _loggableDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v3;
      _os_log_impl(&dword_184085000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ local authenticator will provide headers or request", buf, 0xCu);
    }
    v4 = (void *)[*(id *)(a1 + 32) externalAuthenticator];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke_29;
    uint64_t v19 = &unk_1E5257F30;
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v20 = v6;
    uint64_t v21 = v7;
    return objc_msgSend(v4, "URLSession:task:getAppleIDRequestOrHeadersForResponse:completionHandler:", v5);
  }
  else
  {
    v9 = (void *)[*(id *)(a1 + 32) externalAuthenticator];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke_30;
    __int16 v15 = &unk_1E5257F58;
    return objc_msgSend(v9, "URLSession:task:getAppleIDHeadersForResponse:completionHandler:", v10, MEMORY[0x1E4F143A8], 3221225472, __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke_30, &unk_1E5257F58, v11, *(void *)(a1 + 64));
  }
}

uint64_t __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke_29(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v8 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 32) _loggableDescription];
    int v11 = 138544131;
    uint64_t v12 = v9;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2117;
    uint64_t v16 = a4;
    __int16 v17 = 2117;
    uint64_t v18 = a3;
    _os_log_impl(&dword_184085000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ authenticator finished cont %d req %{sensitive}@ headers %{sensitive}@", (uint8_t *)&v11, 0x26u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke_30(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v6 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) _loggableDescription];
    int v9 = 138543875;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2117;
    uint64_t v14 = a3;
    _os_log_impl(&dword_184085000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ authenticator finished cont %d headers %{sensitive}@", (uint8_t *)&v9, 0x1Cu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  [(NSURLSessionTaskLocalHTTPAuthenticator *)self setExternalAuthenticator:0];
  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionTaskLocalHTTPAuthenticator;
  [(NSURLSessionTaskHTTPAuthenticator *)&v3 dealloc];
}

- (NSURLSessionTaskLocalHTTPAuthenticator)initWithSessionAuthenticator:(id)a3 statusCodes:(id)a4
{
  if (!a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "NSURLSessionAppleIDContext required.", buf, 2u);
  }
  v10.receiver = self;
  v10.super_class = (Class)NSURLSessionTaskLocalHTTPAuthenticator;
  uint64_t v7 = [(NSURLSessionTaskHTTPAuthenticator *)&v10 initWithStatusCodes:a4];
  v8 = v7;
  if (v7) {
    [(NSURLSessionTaskLocalHTTPAuthenticator *)v7 setExternalAuthenticator:a3];
  }
  return v8;
}

@end