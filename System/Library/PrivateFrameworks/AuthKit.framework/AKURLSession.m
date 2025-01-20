@interface AKURLSession
+ (id)_createURLSessionUsesAppleIDContext:(BOOL)a3;
+ (id)_urlBagCache;
+ (id)sharedAnisetteFreeURLSession;
+ (id)sharedCacheEnabledAnisetteFreeSession;
+ (id)sharedCacheEnabledURLSession;
+ (id)sharedCacheReliantAnisetteFreeSession;
+ (id)sharedURLSession;
+ (id)sharedURLSessionWithDenyVirtualInterfaces;
+ (void)removeAllCachedResponses;
- (AKURLSession)init;
- (BOOL)_unsafe_retryTaskIfPossible:(id)a3;
- (BOOL)_usesAppleIDContext;
- (BOOL)isRecoverableError:(id)a3;
- (id)_URLSession;
- (id)beginAuthenticationDataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)beginDataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)defaultSessionObjectWithConfiguration:(id)a3;
- (id)sessionConfiguration;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_unsafe_completeTask:(id)a3 withError:(id)a4;
- (void)cancelDataTask:(id)a3;
- (void)init;
- (void)set_usesAppleIDContext:(BOOL)a3;
@end

@implementation AKURLSession

+ (id)_createURLSessionUsesAppleIDContext:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = objc_alloc_init(AKURLSession);
  [(AKURLSession *)v4 set_usesAppleIDContext:v3];

  return v4;
}

+ (id)sharedURLSession
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AKURLSession_sharedURLSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedURLSession_onceToken != -1) {
    dispatch_once(&sharedURLSession_onceToken, block);
  }
  v2 = (void *)sharedURLSession_sharedURLSession;

  return v2;
}

uint64_t __32__AKURLSession_sharedURLSession__block_invoke(uint64_t a1)
{
  sharedURLSession_sharedURLSession = [*(id *)(a1 + 32) _createURLSessionUsesAppleIDContext:1];

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAnisetteFreeURLSession
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AKURLSession_sharedAnisetteFreeURLSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAnisetteFreeURLSession_onceToken != -1) {
    dispatch_once(&sharedAnisetteFreeURLSession_onceToken, block);
  }
  v2 = (void *)sharedAnisetteFreeURLSession_sharedAnisetteFreeURLSession;

  return v2;
}

uint64_t __44__AKURLSession_sharedAnisetteFreeURLSession__block_invoke(uint64_t a1)
{
  sharedAnisetteFreeURLSession_sharedAnisetteFreeURLSession = [*(id *)(a1 + 32) _createURLSessionUsesAppleIDContext:0];

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedCacheEnabledURLSession
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AKURLSession_sharedCacheEnabledURLSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCacheEnabledURLSession_onceToken != -1) {
    dispatch_once(&sharedCacheEnabledURLSession_onceToken, block);
  }
  v2 = (void *)sharedCacheEnabledURLSession_session;

  return v2;
}

void __44__AKURLSession_sharedCacheEnabledURLSession__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _createURLSessionUsesAppleIDContext:1];
  BOOL v3 = (void *)sharedCacheEnabledURLSession_session;
  sharedCacheEnabledURLSession_session = v2;

  id v8 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  v4 = [*(id *)(a1 + 32) _urlBagCache];
  [v8 setURLCache:v4];

  [v8 setWaitsForConnectivity:1];
  [v8 setTimeoutIntervalForResource:60.0];
  v5 = [[AKAppleIDSession alloc] initWithIdentifier:@"AuthKitURLSession"];
  objc_msgSend(v8, "set_appleIDContext:", v5);

  uint64_t v6 = [(id)sharedCacheEnabledURLSession_session defaultSessionObjectWithConfiguration:v8];
  v7 = *(void **)(sharedCacheEnabledURLSession_session + 8);
  *(void *)(sharedCacheEnabledURLSession_session + 8) = v6;
}

+ (id)sharedURLSessionWithDenyVirtualInterfaces
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedURLSessionWithDenyVirtualInterfaces_onceToken != -1) {
    dispatch_once(&sharedURLSessionWithDenyVirtualInterfaces_onceToken, block);
  }
  uint64_t v2 = (void *)sharedURLSessionWithDenyVirtualInterfaces_session;

  return v2;
}

void __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke(uint64_t a1)
{
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke_cold_3();
  }

  uint64_t v3 = [*(id *)(a1 + 32) _createURLSessionUsesAppleIDContext:1];
  v4 = (void *)sharedURLSessionWithDenyVirtualInterfaces_session;
  sharedURLSessionWithDenyVirtualInterfaces_session = v3;

  v5 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  [v5 setWaitsForConnectivity:1];
  [v5 setTimeoutIntervalForResource:60.0];
  uint64_t v6 = [[AKAppleIDSession alloc] initWithIdentifier:@"AuthKitURLSession"];
  objc_msgSend(v5, "set_appleIDContext:", v6);

  char v7 = objc_opt_respondsToSelector();
  id v8 = _AKLogSystem();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke_cold_1();
    }

    objc_msgSend(v5, "set_allowsVirtualInterfaces:", 0);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke_cold_2();
    }
  }
  uint64_t v10 = [(id)sharedURLSessionWithDenyVirtualInterfaces_session defaultSessionObjectWithConfiguration:v5];
  v11 = *(void **)(sharedURLSessionWithDenyVirtualInterfaces_session + 8);
  *(void *)(sharedURLSessionWithDenyVirtualInterfaces_session + 8) = v10;
}

+ (id)sharedCacheEnabledAnisetteFreeSession
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AKURLSession_sharedCacheEnabledAnisetteFreeSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCacheEnabledAnisetteFreeSession_onceToken != -1) {
    dispatch_once(&sharedCacheEnabledAnisetteFreeSession_onceToken, block);
  }
  uint64_t v2 = (void *)sharedCacheEnabledAnisetteFreeSession_session;

  return v2;
}

void __53__AKURLSession_sharedCacheEnabledAnisetteFreeSession__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _createURLSessionUsesAppleIDContext:0];
  uint64_t v3 = (void *)sharedCacheEnabledAnisetteFreeSession_session;
  sharedCacheEnabledAnisetteFreeSession_session = v2;

  id v7 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  v4 = [*(id *)(a1 + 32) _urlBagCache];
  [v7 setURLCache:v4];

  [v7 setWaitsForConnectivity:1];
  [v7 setTimeoutIntervalForResource:60.0];
  uint64_t v5 = [(id)sharedCacheEnabledAnisetteFreeSession_session defaultSessionObjectWithConfiguration:v7];
  uint64_t v6 = *(void **)(sharedCacheEnabledAnisetteFreeSession_session + 8);
  *(void *)(sharedCacheEnabledAnisetteFreeSession_session + 8) = v5;
}

+ (id)sharedCacheReliantAnisetteFreeSession
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AKURLSession_sharedCacheReliantAnisetteFreeSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCacheReliantAnisetteFreeSession_onceToken != -1) {
    dispatch_once(&sharedCacheReliantAnisetteFreeSession_onceToken, block);
  }
  uint64_t v2 = (void *)sharedCacheReliantAnisetteFreeSession_session;

  return v2;
}

void __53__AKURLSession_sharedCacheReliantAnisetteFreeSession__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _createURLSessionUsesAppleIDContext:0];
  uint64_t v3 = (void *)sharedCacheReliantAnisetteFreeSession_session;
  sharedCacheReliantAnisetteFreeSession_session = v2;

  id v7 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  v4 = [*(id *)(a1 + 32) _urlBagCache];
  [v7 setURLCache:v4];

  [v7 setWaitsForConnectivity:0];
  [v7 setRequestCachePolicy:3];
  uint64_t v5 = [(id)sharedCacheReliantAnisetteFreeSession_session defaultSessionObjectWithConfiguration:v7];
  uint64_t v6 = *(void **)(sharedCacheReliantAnisetteFreeSession_session + 8);
  *(void *)(sharedCacheReliantAnisetteFreeSession_session + 8) = v5;
}

+ (id)_urlBagCache
{
  if (_urlBagCache_onceToken != -1) {
    dispatch_once(&_urlBagCache_onceToken, &__block_literal_global_5);
  }
  uint64_t v2 = (void *)_urlBagCache_cache;

  return v2;
}

void __28__AKURLSession__urlBagCache__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = +[AKDevice systemContainerCacheURL];
  v1 = _AKLogSystem();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = v0;
    _os_log_impl(&dword_193494000, v1, OS_LOG_TYPE_DEFAULT, "Initializing URL cache at URL: %@", (uint8_t *)&v4, 0xCu);
  }

  if (v0)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F18D78]) initWithMemoryCapacity:512000 diskCapacity:10000000 directoryURL:v0];
    uint64_t v3 = _urlBagCache_cache;
    _urlBagCache_cache = v2;
  }
  else
  {
    uint64_t v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __28__AKURLSession__urlBagCache__block_invoke_cold_1();
    }
  }
}

+ (void)removeAllCachedResponses
{
  id v2 = [a1 _urlBagCache];
  [v2 removeAllCachedResponses];
}

- (AKURLSession)init
{
  v10.receiver = self;
  v10.super_class = (Class)AKURLSession;
  id v2 = [(AKURLSession *)&v10 init];
  if (v2)
  {
    uint64_t v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[AKURLSession init]();
    }

    int v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tasksByIdentifier = v2->_tasksByIdentifier;
    v2->_tasksByIdentifier = v4;

    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.authkit.url", v6);
    sessionQueue = v2->_sessionQueue;
    v2->_sessionQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[AKURLSession URLSession:didBecomeInvalidWithError:]();
  }

  dispatch_queue_t v7 = [(NSMutableDictionary *)self->_tasksByIdentifier allValues];
  if ([v7 count])
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Calling all pending completions.", buf, 2u);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          -[AKURLSession _unsafe_completeTask:withError:](self, "_unsafe_completeTask:withError:", *(void *)(*((void *)&v15 + 1) + 8 * v13++), v5, (void)v15);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v11);
    }
  }
  urlSession = self->_urlSession;
  self->_urlSession = 0;
}

- (id)_URLSession
{
  urlSession = self->_urlSession;
  if (!urlSession)
  {
    int v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_193494000, v4, OS_LOG_TYPE_DEFAULT, "Creating new NSURLSession with default config...", v10, 2u);
    }

    id v5 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
    [v5 setWaitsForConnectivity:1];
    [v5 setTimeoutIntervalForResource:60.0];
    if ([(AKURLSession *)self _usesAppleIDContext])
    {
      uint64_t v6 = [[AKAppleIDSession alloc] initWithIdentifier:@"AuthKitURLSession"];
      objc_msgSend(v5, "set_appleIDContext:", v6);
    }
    dispatch_queue_t v7 = [(AKURLSession *)self defaultSessionObjectWithConfiguration:v5];
    id v8 = self->_urlSession;
    self->_urlSession = v7;

    urlSession = self->_urlSession;
  }

  return urlSession;
}

- (id)defaultSessionObjectWithConfiguration:(id)a3
{
  int v4 = (objc_class *)MEMORY[0x1E4F28F08];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setMaxConcurrentOperationCount:1];
  [v6 setUnderlyingQueue:self->_sessionQueue];
  dispatch_queue_t v7 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v5 delegate:self delegateQueue:v6];

  return v7;
}

- (id)beginDataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = objc_alloc_init(AKURLDataTask);
    sessionQueue = self->_sessionQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__AKURLSession_beginDataTaskWithRequest_completionHandler___block_invoke;
    v16[3] = &unk_1E575F420;
    id v17 = v6;
    long long v18 = self;
    uint64_t v11 = v9;
    v19 = v11;
    id v20 = v8;
    dispatch_async(sessionQueue, v16);
    uint64_t v12 = v20;
    uint64_t v13 = v11;

    v14 = v13;
  }
  else
  {
    uint64_t v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AKURLSession beginDataTaskWithRequest:completionHandler:]((uint64_t)v6, (uint64_t)v8, v13);
    }
    v14 = 0;
  }

  return v14;
}

void __59__AKURLSession_beginDataTaskWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) URL];
  uint64_t v3 = [v2 absoluteString];
  int v4 = [*(id *)(a1 + 40) _URLSession];
  id v5 = [v4 dataTaskWithRequest:*(void *)(a1 + 32)];

  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "Creating task %{public}@ for request at URL: %@", (uint8_t *)&v9, 0x16u);
  }

  [*(id *)(a1 + 48) setRequest:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) setRetryCount:0];
  [*(id *)(a1 + 48) setCompletionHandler:*(void *)(a1 + 56)];
  [*(id *)(a1 + 48) setUnderlyingTask:v5];
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "taskIdentifier"));
  [*(id *)(*(void *)(a1 + 40) + 24) setObject:*(void *)(a1 + 48) forKey:v7];
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Resuming task %{public}@ for URL %@", (uint8_t *)&v9, 0x16u);
  }

  [v5 resume];
}

- (void)cancelDataTask:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__AKURLSession_cancelDataTask___block_invoke;
  v7[3] = &unk_1E575F448;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(sessionQueue, v7);
}

void __31__AKURLSession_cancelDataTask___block_invoke(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __31__AKURLSession_cancelDataTask___block_invoke_cold_1(a1, v2);
  }

  if (([*(id *)(a1 + 32) canceledOrCompleted] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) underlyingTask];
    if ([v3 state])
    {
      if ([v3 state] == 3)
      {
        uint64_t v6 = a1 + 32;
        id v4 = *(void **)(a1 + 32);
        id v5 = *(void **)(v6 + 8);
        id v7 = [v4 lastRetryError];
        objc_msgSend(v5, "_unsafe_completeTask:withError:", v4, v7);
      }
    }
    else
    {
      [v3 cancel];
    }
  }
}

- (void)_unsafe_completeTask:(id)a3 withError:(id)a4
{
  uint64_t v6 = NSNumber;
  id v7 = a4;
  id v8 = a3;
  int v9 = [v8 underlyingTask];
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v9, "taskIdentifier"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [(NSMutableDictionary *)self->_tasksByIdentifier removeObjectForKey:v10];
  [v8 _completeWithError:v7];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    int v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "taskIdentifier"));
    id v10 = [(NSMutableDictionary *)self->_tasksByIdentifier objectForKey:v9];
    id v11 = [v10 receivedData];
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      [v10 setReceivedData:v11];
    }
    uint64_t v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[AKURLSession URLSession:dataTask:didReceiveData:]();
    }

    [v11 appendData:v8];
  }
  else
  {
    int v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKURLSession URLSession:dataTask:didReceiveData:]();
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  int v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_193494000, v9, OS_LOG_TYPE_DEFAULT, "Task %{public}@ completed! Error: %@", (uint8_t *)&v13, 0x16u);
  }

  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "taskIdentifier"));
  id v11 = [(NSMutableDictionary *)self->_tasksByIdentifier objectForKey:v10];
  if (!v8 || ![(AKURLSession *)self isRecoverableError:v8]) {
    goto LABEL_8;
  }
  uint64_t v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "Error is recoverable. Checking if retry is possible.", (uint8_t *)&v13, 2u);
  }

  [v11 setLastRetryError:v8];
  if (![(AKURLSession *)self _unsafe_retryTaskIfPossible:v11]) {
LABEL_8:
  }
    [(AKURLSession *)self _unsafe_completeTask:v11 withError:v8];
}

- (BOOL)isRecoverableError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F289A0]];

  if (v5) {
    BOOL v6 = [v3 code] == -997
  }
      || [v3 code] == -1005
      || [v3 code] == -1001
      || [v3 code] == -1009;
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_unsafe_retryTaskIfPossible:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_unsafe_retryTaskIfPossible__onceToken != -1) {
    dispatch_once(&_unsafe_retryTaskIfPossible__onceToken, &__block_literal_global_96);
  }
  int v5 = [v4 request];
  if (!v5)
  {
    id v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AKURLSession _unsafe_retryTaskIfPossible:]();
    }
    goto LABEL_14;
  }
  unint64_t v6 = [v4 retryCount];
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [NSNumber numberWithUnsignedInteger:v6];
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "This request has been retried %@ times.", buf, 0xCu);
  }
  if (v6 >= [(id)_unsafe_retryTaskIfPossible__retryIntervals count])
  {
    id v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AKURLSession _unsafe_retryTaskIfPossible:]();
    }
LABEL_14:
    BOOL v15 = 0;
    goto LABEL_15;
  }
  int v9 = [(id)_unsafe_retryTaskIfPossible__retryIntervals objectAtIndexedSubscript:v6];
  double v10 = (double)[v9 integerValue];

  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [NSNumber numberWithDouble:v10];
    *(_DWORD *)buf = 138412290;
    v24 = v12;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "Will retry in %@ second(s)...", buf, 0xCu);
  }
  dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  sessionQueue = self->_sessionQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __44__AKURLSession__unsafe_retryTaskIfPossible___block_invoke_100;
  v18[3] = &unk_1E575F470;
  v19 = v4;
  id v20 = self;
  id v21 = v5;
  unint64_t v22 = v6;
  dispatch_after(v13, sessionQueue, v18);

  BOOL v15 = 1;
  id v16 = v19;
LABEL_15:

  return v15;
}

void __44__AKURLSession__unsafe_retryTaskIfPossible___block_invoke()
{
  v0 = (void *)_unsafe_retryTaskIfPossible__retryIntervals;
  _unsafe_retryTaskIfPossible__retryIntervals = (uint64_t)&unk_1EE43EAD0;
}

void __44__AKURLSession__unsafe_retryTaskIfPossible___block_invoke_100(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) canceledOrCompleted] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) underlyingTask];
    id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "taskIdentifier"));
    [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v3];
    id v4 = [*(id *)(a1 + 40) _URLSession];
    int v5 = [v4 dataTaskWithRequest:*(void *)(a1 + 48)];

    unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "taskIdentifier"));
    [*(id *)(a1 + 32) setUnderlyingTask:v5];
    [*(id *)(*(void *)(a1 + 40) + 24) setObject:*(void *)(a1 + 32) forKey:v6];
    uint64_t v7 = *(void *)(a1 + 56) + 1;
    [*(id *)(a1 + 32) setRetryCount:v7];
    [*(id *)(a1 + 32) setReceivedData:0];
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [NSNumber numberWithUnsignedInteger:v7];
      int v10 = 138412546;
      id v11 = v9;
      __int16 v12 = 2114;
      dispatch_time_t v13 = v5;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Retry attempt #%@: resuming task %{public}@...", (uint8_t *)&v10, 0x16u);
    }
    [v5 resume];
  }
}

- (id)beginAuthenticationDataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke;
  v12[3] = &unk_1E575F498;
  id v13 = v6;
  uint64_t v14 = &v15;
  id v7 = v6;
  uint64_t v8 = [(AKURLSession *)self beginDataTaskWithRequest:a3 completionHandler:v12];
  int v9 = (void *)v16[5];
  v16[5] = v8;

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v16 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v21 = _AKLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke_cold_2();
      }

      uint64_t v22 = *(void *)(a1 + 32);
      v23 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7029);
      (*(void (**)(uint64_t, void, void, void *))(v22 + 16))(v22, 0, 0, v23);

      goto LABEL_13;
    }
    uint64_t v17 = [v16 statusCode];
    long long v18 = _AKLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v20 = [NSNumber numberWithInteger:v17];
      int v37 = 138543618;
      id v38 = v19;
      __int16 v39 = 2114;
      v40 = v20;
      _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "Task %{public}@ Request completed with HTTP status code: %{public}@", (uint8_t *)&v37, 0x16u);
    }
    if (v17 == 200)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_13:
      uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = 0;
LABEL_34:

      goto LABEL_35;
    }
    uint64_t v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAuthenticationServerError" code:v17 userInfo:0];
    v26 = _AKLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138412290;
      id v38 = v16;
      _os_log_impl(&dword_193494000, v26, OS_LOG_TYPE_DEFAULT, "Task response: %@", (uint8_t *)&v37, 0xCu);
    }

    v27 = _AKLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
      int v37 = 138412290;
      id v38 = v28;
      _os_log_impl(&dword_193494000, v27, OS_LOG_TYPE_DEFAULT, "Task data: %@", (uint8_t *)&v37, 0xCu);
    }
    if (v17 <= 408)
    {
      if (v17 != 250)
      {
        if (v17 == 401)
        {
          v29 = _AKLogSystem();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke_cold_1();
          }

          uint64_t v30 = *(void *)(a1 + 32);
          v31 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v32 = -7026;
          goto LABEL_31;
        }
LABEL_30:
        uint64_t v30 = *(void *)(a1 + 32);
        v31 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v32 = -7029;
LABEL_31:
        v34 = objc_msgSend(v31, "ak_errorWithCode:underlyingError:", v32, v25);
        (*(void (**)(uint64_t, void, void, void *))(v30 + 16))(v30, 0, 0, v34);
        goto LABEL_32;
      }
    }
    else
    {
      if (v17 == 409)
      {
        uint64_t v33 = *(void *)(a1 + 32);
        v34 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:underlyingError:", -7052, v25);
        (*(void (**)(uint64_t, void, id, void *))(v33 + 16))(v33, 0, v16, v34);
LABEL_32:

        goto LABEL_33;
      }
      if (v17 != 451 && v17 != 412) {
        goto LABEL_30;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_33:
    uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 8);
    v36 = *(void **)(v35 + 40);
    *(void *)(v35 + 40) = 0;

    goto LABEL_34;
  }
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke_cold_3();
  }

  uint64_t v11 = *(void *)(a1 + 32);
  __int16 v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v41 = *MEMORY[0x1E4F28A50];
  v42[0] = v9;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
  uint64_t v14 = [v12 errorWithDomain:@"AKAuthenticationError" code:-7029 userInfo:v13];
  (*(void (**)(uint64_t, void, void, void *))(v11 + 16))(v11, 0, 0, v14);

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(id *)(v15 + 40);
  *(void *)(v15 + 40) = 0;
LABEL_35:
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, uint64_t, void))a5;
  id v8 = [v6 protectionSpace];
  id v9 = [v8 host];
  int v10 = [v9 containsString:@"icloud.com"];

  if (v10)
  {
    uint64_t v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "Detected an iCloud URL request, will not perform IdMS cert validation.", v21, 2u);
    }

    goto LABEL_7;
  }
  __int16 v12 = [v6 protectionSpace];
  id v13 = [v12 authenticationMethod];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F18CB8]];

  if (!v14) {
    goto LABEL_7;
  }
  uint64_t v15 = [v6 protectionSpace];
  uint64_t v16 = [v15 serverTrust];
  uint64_t v17 = [v6 protectionSpace];
  long long v18 = [v17 host];
  BOOL v19 = +[AKCertificatePinning isValidCertificateTrust:v16 forHostname:v18];

  if (v19)
  {
LABEL_7:
    v7[2](v7, 1, 0);
    goto LABEL_8;
  }
  id v20 = _AKLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[AKURLSession URLSession:didReceiveChallenge:completionHandler:]();
  }

  v7[2](v7, 2, 0);
LABEL_8:
}

- (id)sessionConfiguration
{
  return [(NSURLSession *)self->_urlSession configuration];
}

- (BOOL)_usesAppleIDContext
{
  return self->__usesAppleIDContext;
}

- (void)set_usesAppleIDContext:(BOOL)a3
{
  self->__usesAppleIDContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasksByIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);

  objc_storeStrong((id *)&self->_urlSession, 0);
}

void __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "URLSessionConfig disable virtual interfaces", v1, 2u);
}

void __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "URLSessionConfig doesn't respond to _allowsVirtualInterfaces!", v2, v3, v4, v5, v6);
}

void __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "Setting URLSessionConfig for the virtual interfaces", v1, 2u);
}

void __28__AKURLSession__urlBagCache__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Failed to generate cache due to missing container path!", v2, v3, v4, v5, v6);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "AKURLSession %p is initializing...", v1, 0xCu);
}

- (void)URLSession:didBecomeInvalidWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "NSURLSession became invalid with error: %@", v2, v3, v4, v5, v6);
}

- (void)beginDataTaskWithRequest:(NSObject *)a3 completionHandler:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1996FE880](a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_193494000, a3, v5, "Asked to begin task with either nil request %@ or completion handler %@", v6);
}

void __31__AKURLSession_cancelDataTask___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) request];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_193494000, a2, v4, "Cancelling task %{public}@ for request %@", v5);
}

- (void)URLSession:dataTask:didReceiveData:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "The data parameter is nil!", v2, v3, v4, v5, v6);
}

- (void)URLSession:dataTask:didReceiveData:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "Aggregating received data for task: %{public}@", v1, 0xCu);
}

- (void)_unsafe_retryTaskIfPossible:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Cannot retry a nil request from task: %@", v2, v3, v4, v5, v6);
}

- (void)_unsafe_retryTaskIfPossible:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Retry count has been exceeded! %{public}@", v2, v3, v4, v5, v6);
}

void __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Task %{public}@ Server responded with authentication error", v2, v3, v4, v5, 2u);
}

void __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Task %{public}@ Request response not of expected class!", v2, v3, v4, v5, 2u);
}

void __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0(*MEMORY[0x1E4F143B8]);
  int v3 = 138543618;
  uint64_t v4 = v0;
  __int16 v5 = 2112;
  uint64_t v6 = v1;
  OUTLINED_FUNCTION_6_0(&dword_193494000, v2, (uint64_t)v2, "Request failed for task: %{public}@ error: %@", (uint8_t *)&v3);
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Server cert validity check failed!", v2, v3, v4, v5, v6);
}

@end