@interface APHTTPSession
- (APHTTPSession)init;
- (APHTTPSession)initWithSessionConfiguration:(id)a3;
- (BOOL)sendFakeResponseForRequest:(id)a3;
- (NSString)name;
- (NSURLSession)session;
- (id)GET:(id)a3 headers:(id)a4 withCompletionHandler:(id)a5;
- (id)HEAD:(id)a3 headers:(id)a4 withCompletionHandler:(id)a5;
- (id)POST:(id)a3 headers:(id)a4 body:(id)a5 withCompletionHandler:(id)a6;
- (id)sendRequest:(id)a3;
- (void)cancelTaskWithCompletionHandler:(id)a3;
- (void)invalidateSessionAndCancelTasks:(BOOL)a3;
- (void)setSession:(id)a3;
@end

@implementation APHTTPSession

- (APHTTPSession)init
{
  return 0;
}

- (APHTTPSession)initWithSessionConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APHTTPSession;
  v5 = [(APHTTPSession *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 _sourceApplicationBundleIdentifier];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v4];
    session = v5->_session;
    v5->_session = (NSURLSession *)v8;
  }
  return v5;
}

- (void)cancelTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(APHTTPSession *)self session];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D70C15A4;
  v7[3] = &unk_1E6A6B480;
  id v8 = v4;
  id v6 = v4;
  [v5 getTasksWithCompletionHandler:v7];
}

- (void)invalidateSessionAndCancelTasks:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(APHTTPSession *)self session];
  id v5 = v4;
  if (v3) {
    [v4 invalidateAndCancel];
  }
  else {
    [v4 finishTasksAndInvalidate];
  }
}

- (id)sendRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28E88];
  id v6 = [v4 URL];
  v7 = [v5 requestWithURL:v6];

  unint64_t v8 = [v4 HTTPMethod];
  if (v8 > 2)
  {
    v20 = 0;
  }
  else
  {
    [v7 setHTTPMethod:off_1E6A6B4F0[v8]];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v9 = [v4 allHTTPHeaderFields];
    v10 = [v9 keyEnumerator];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v16 = [v4 allHTTPHeaderFields];
          v17 = [v16 objectForKeyedSubscript:v15];
          [v7 addValue:v17 forHTTPHeaderField:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v12);
    }

    v18 = [v4 HTTPBody];
    [v7 setHTTPBody:v18];

    if (+[APSystemInternal isAppleInternalInstall]
      && [(APHTTPSession *)self sendFakeResponseForRequest:v4])
    {
      v19 = APLogForCategory(0x1FuLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v7;
        _os_log_impl(&dword_1D70B2000, v19, OS_LOG_TYPE_INFO, "APHTTPRequest will not be sent (error code will be returned): %{public}@", buf, 0xCu);
      }
      v20 = 0;
    }
    else
    {
      v21 = APLogForCategory(0x1FuLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v7;
        _os_log_impl(&dword_1D70B2000, v21, OS_LOG_TYPE_INFO, "APHTTPRequest is about to be sent: %{public}@", buf, 0xCu);
      }

      v22 = [v4 completionHandler];
      v23 = [(APHTTPSession *)self session];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = sub_1D70C1AA8;
      v25[3] = &unk_1E6A6B4A8;
      id v26 = v22;
      v19 = v22;
      v20 = [v23 dataTaskWithRequest:v7 completionHandler:v25];

      [v20 resume];
    }
  }
  return v20;
}

- (id)GET:(id)a3 headers:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[APHTTPRequest alloc] initWithURL:v10 HTTPMethod:0 HTTPHeaders:v9 HTTPBody:0 serviceName:0 completionHandler:v8];

  uint64_t v12 = [(APHTTPSession *)self sendRequest:v11];

  return v12;
}

- (id)POST:(id)a3 headers:(id)a4 body:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[APHTTPRequest alloc] initWithURL:v13 HTTPMethod:2 HTTPHeaders:v12 HTTPBody:v11 serviceName:0 completionHandler:v10];

  uint64_t v15 = [(APHTTPSession *)self sendRequest:v14];

  return v15;
}

- (id)HEAD:(id)a3 headers:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[APHTTPRequest alloc] initWithURL:v10 HTTPMethod:1 HTTPHeaders:v9 HTTPBody:0 serviceName:0 completionHandler:v8];

  id v12 = [(APHTTPSession *)self sendRequest:v11];

  return v12;
}

- (BOOL)sendFakeResponseForRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 allHTTPHeaderFields];
  id v5 = [v4 objectForKey:@"debug-http-status"];

  id v6 = [v3 allHTTPHeaderFields];
  v7 = [v6 objectForKey:@"debug-communication-code"];

  if ([v5 length] || objc_msgSend(v7, "length"))
  {
    id v8 = dispatch_queue_create("com.apple.ap.fake-response", 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D70C1EF0;
    block[3] = &unk_1E6A6B4D0;
    id v12 = v5;
    id v13 = v3;
    id v14 = v7;
    dispatch_async(v8, block);

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end