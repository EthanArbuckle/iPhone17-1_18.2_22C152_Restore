@interface NSURLSessionTaskBackgroundHTTPAuthenticator
- (NSURLSessionTaskBackgroundHTTPAuthenticator)initWithStatusCodes:(id)a3;
- (void)dealloc;
- (void)getAuthenticationHeadersForTask:(id)a3 task:(id)a4 response:(id)a5 completionHandler:(id)a6;
@end

@implementation NSURLSessionTaskBackgroundHTTPAuthenticator

- (void)getAuthenticationHeadersForTask:(id)a3 task:(id)a4 response:(id)a5 completionHandler:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v10 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v16 = [a4 _loggableDescription];
    __int16 v17 = 2112;
    id v18 = a5;
    __int16 v19 = 2112;
    v20 = [(NSURLSessionTaskHTTPAuthenticator *)self statusCodes];
    _os_log_impl(&dword_184085000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ background authenticator getting headers for %@ codes %@", buf, 0x20u);
  }
  if ([(NSURLSessionTaskHTTPAuthenticator *)self statusCodes])
  {
    if (a4)
    {
      uint64_t v11 = *((void *)a4 + 88);
      if (!v11) {
        uint64_t v11 = *((void *)a4 + 87);
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __111__NSURLSessionTaskBackgroundHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke;
    v14[3] = &unk_1E5257F30;
    v14[4] = a4;
    v14[5] = a6;
    -[__NSCFURLSessionDelegateWrapper task:_getAuthHeadersForResponse:completionHandler:](v11, a4, a5, v14);
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v12 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [a4 _loggableDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_184085000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ background authenticator does not have status codes, skipping callback", buf, 0xCu);
    }
    (*((void (**)(id, uint64_t, void, void))a6 + 2))(a6, 1, 0, 0);
  }
}

uint64_t __111__NSURLSessionTaskBackgroundHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
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

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NSURLSessionTaskBackgroundHTTPAuthenticator;
  [(NSURLSessionTaskHTTPAuthenticator *)&v2 dealloc];
}

- (NSURLSessionTaskBackgroundHTTPAuthenticator)initWithStatusCodes:(id)a3
{
  if (!a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "HTTPStatusCodes required.", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)NSURLSessionTaskBackgroundHTTPAuthenticator;
  return [(NSURLSessionTaskHTTPAuthenticator *)&v6 initWithStatusCodes:a3];
}

@end