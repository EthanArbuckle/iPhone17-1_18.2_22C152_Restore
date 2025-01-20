@interface HLPURLSessionManager
+ (id)defaultManager;
- (BOOL)coalesceRequests;
- (BOOL)respondsToDidReceiveChallenge;
- (BOOL)respondsToRequestCompleted;
- (BOOL)respondsToRequestResumed;
- (HLPURLSessionCustomAuthHandling)authenticationHandler;
- (HLPURLSessionDelegate)defaultSessionDelegate;
- (HLPURLSessionManager)init;
- (HLPURLSessionManagerDelegate)delegate;
- (NSMutableDictionary)coalesceTaskURLMap;
- (NSMutableDictionary)uncoalesceTaskMap;
- (NSURLSession)URLSession;
- (PPCRedirect)urlRedirector;
- (id)_mappedURLRequest:(id)a3;
- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 completionHandler:(id)a5;
- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 networkDelegate:(id)a5;
- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 networkDelegate:(id)a5 completionHandler:(id)a6;
- (id)sessionTaskForTask:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)cancelSessionItem:(id)a3;
- (void)dealloc;
- (void)removeTaskFromMap:(id)a3;
- (void)resumeSessionItem:(id)a3;
- (void)sessionTask:(id)a3 didCompleteWithError:(id)a4;
- (void)setAuthenticationHandler:(id)a3;
- (void)setCoalesceRequests:(BOOL)a3;
- (void)setCoalesceTaskURLMap:(id)a3;
- (void)setDefaultSessionDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRespondsToDidReceiveChallenge:(BOOL)a3;
- (void)setRespondsToRequestCompleted:(BOOL)a3;
- (void)setRespondsToRequestResumed:(BOOL)a3;
- (void)setURLSession:(id)a3;
- (void)setUncoalesceTaskMap:(id)a3;
- (void)setUrlRedirector:(id)a3;
@end

@implementation HLPURLSessionManager

+ (id)defaultManager
{
  if (defaultManager_predicate_0 != -1) {
    dispatch_once(&defaultManager_predicate_0, &__block_literal_global_14);
  }
  v2 = (void *)defaultManager_gURLSessionManager;
  return v2;
}

uint64_t __38__HLPURLSessionManager_defaultManager__block_invoke()
{
  defaultManager_gURLSessionManager = objc_alloc_init(HLPURLSessionManager);
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  [(NSURLSession *)self->_URLSession invalidateAndCancel];
  sessionTaskQueue = self->_sessionTaskQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__HLPURLSessionManager_dealloc__block_invoke;
  block[3] = &unk_264578B58;
  block[4] = self;
  dispatch_sync(sessionTaskQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)HLPURLSessionManager;
  [(HLPURLSessionManager *)&v4 dealloc];
}

void __31__HLPURLSessionManager_dealloc__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) coalesceTaskURLMap];
  [v1 removeAllObjects];
}

- (HLPURLSessionManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)HLPURLSessionManager;
  v2 = [(HLPURLSessionManager *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.IPURLSessionSerialQueue", 0);
    sessionTaskQueue = v2->_sessionTaskQueue;
    v2->_sessionTaskQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_sessionTaskQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__HLPURLSessionManager_init__block_invoke;
    block[3] = &unk_264578B58;
    v8 = v2;
    dispatch_sync(v5, block);
  }
  return v2;
}

void __28__HLPURLSessionManager_init__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFFA78];
  dispatch_queue_t v3 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  [*(id *)(a1 + 32) setCoalesceTaskURLMap:v3];

  objc_super v4 = (void *)[v2 mutableCopy];
  [*(id *)(a1 + 32) setUncoalesceTaskMap:v4];

  if (+[HLPCommonDefines isInternalBuild]
    && PingPongClientLibraryCore_1())
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2050000000;
    v5 = (void *)getPPCRedirectClass_softClass_0;
    uint64_t v12 = getPPCRedirectClass_softClass_0;
    if (!getPPCRedirectClass_softClass_0)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __getPPCRedirectClass_block_invoke_0;
      v8[3] = &unk_264578BE0;
      v8[4] = &v9;
      __getPPCRedirectClass_block_invoke_0((uint64_t)v8);
      v5 = (void *)v10[3];
    }
    v6 = v5;
    _Block_object_dispose(&v9, 8);
    id v7 = objc_alloc_init(v6);
    [*(id *)(a1 + 32) setUrlRedirector:v7];
  }
}

- (NSURLSession)URLSession
{
  URLSession = self->_URLSession;
  if (!URLSession)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      id v7 = [v6 URLSessionManagerSessionConfiguration:self];
    }
    else
    {
      v8 = [MEMORY[0x263F086E0] mainBundle];
      v6 = [v8 bundleIdentifier];

      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08B98]) initWithMemoryCapacity:5242880 diskCapacity:26214400 diskPath:v6];
      [MEMORY[0x263F08B98] setSharedURLCache:v9];
      id v7 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
      [v7 setURLCache:v9];
    }
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      id v13 = [v12 URLSessionManagerSessionOperationQueue:self];
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x263F08A48]);
      [v13 setMaxConcurrentOperationCount:4];
    }
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      self->_coalesceRequests = [v16 URLSessionManagerShouldCoalesceRequest:self];
    }
    sessionTaskQueue = self->_sessionTaskQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__HLPURLSessionManager_URLSession__block_invoke;
    block[3] = &unk_264578AE8;
    void block[4] = self;
    id v22 = v7;
    id v23 = v13;
    id v18 = v13;
    id v19 = v7;
    dispatch_sync(sessionTaskQueue, block);

    URLSession = self->_URLSession;
  }
  return URLSession;
}

void __34__HLPURLSessionManager_URLSession__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08BF8] sessionWithConfiguration:*(void *)(a1 + 40) delegate:*(void *)(a1 + 32) delegateQueue:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setURLSession:v2];
}

- (id)_mappedURLRequest:(id)a3
{
  id v4 = a3;
  char v5 = [(HLPURLSessionManager *)self urlRedirector];

  if (!v5) {
    goto LABEL_5;
  }
  v6 = [v4 URL];
  id v7 = [(HLPURLSessionManager *)self urlRedirector];
  v8 = [v7 mappedURL:v6];

  if (!v8 || ([v8 isEqual:v6] & 1) != 0)
  {

LABEL_5:
    id v9 = v4;
    goto LABEL_6;
  }
  id v9 = (id)[v4 mutableCopy];
  [v9 setURL:v8];
  char v11 = (void *)MEMORY[0x263EFF9A0];
  id v12 = [(HLPURLSessionManager *)self authenticationHandler];
  id v13 = [v12 customHeaderFields];
  id v14 = [v11 dictionaryWithDictionary:v13];

  if ([v14 count])
  {
    char v15 = [v9 allHTTPHeaderFields];
    [v14 addEntriesFromDictionary:v15];

    [v9 setAllHTTPHeaderFields:v14];
  }

LABEL_6:
  return v9;
}

- (void)setDefaultSessionDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSessionDelegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_defaultSessionDelegate, obj);
    uint64_t v6 = (uint64_t)+[HLPURLSessionTask delegateRespondsWithDelegate:obj];
    *(_DWORD *)&self->_defaultSessionDelegateResponds.willCacheResponse = v6;
    *(_WORD *)&self->_defaultSessionDelegateResponds.didCompleteWithError = WORD2(v6);
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_respondsToRequestResumed = objc_opt_respondsToSelector() & 1;

    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_respondsToRequestCompleted = objc_opt_respondsToSelector() & 1;

    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_respondsToDidReceiveChallenge = objc_opt_respondsToSelector() & 1;
  }
}

- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 networkDelegate:(id)a5
{
  return [(HLPURLSessionManager *)self newURLSessionItemWithRequest:a3 identifier:a4 networkDelegate:a5 completionHandler:0];
}

- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 completionHandler:(id)a5
{
  return [(HLPURLSessionManager *)self newURLSessionItemWithRequest:a3 identifier:a4 networkDelegate:0 completionHandler:a5];
}

- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 networkDelegate:(id)a5 completionHandler:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v29 = a6;
  id v13 = [(HLPURLSessionManager *)self _mappedURLRequest:v10];
  id v14 = [v13 URL];
  char v15 = v14;
  if (v14 && (v11 || ([v14 lastPathComponent], (id v11 = (id)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__4;
    v43 = __Block_byref_object_dispose__4;
    id v44 = 0;
    if (v12) {
      goto LABEL_5;
    }
    if (!self->_coalesceRequests) {
      goto LABEL_5;
    }
    sessionTaskQueue = self->_sessionTaskQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __98__HLPURLSessionManager_newURLSessionItemWithRequest_identifier_networkDelegate_completionHandler___block_invoke;
    block[3] = &unk_264579770;
    v38 = &v39;
    void block[4] = self;
    id v37 = v15;
    dispatch_sync(sessionTaskQueue, block);

    if (!v40[5])
    {
LABEL_5:
      id v16 = HLPLogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v10;
        _os_log_impl(&dword_220BD8000, v16, OS_LOG_TYPE_DEFAULT, "Fetching: %@", buf, 0xCu);
      }

      v17 = [(HLPURLSessionManager *)self URLSession];
      id v18 = [v17 dataTaskWithRequest:v13];

      id v19 = [[HLPURLSessionTask alloc] initWithSessionTask:v18 identifier:v11];
      v20 = (void *)v40[5];
      v40[5] = (uint64_t)v19;

      id WeakRetained = v12;
      if (!v12) {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSessionDelegate);
      }
      [(id)v40[5] setNetworkDelegate:WeakRetained];
      if (v12)
      {
        unint64_t v22 = (unint64_t)+[HLPURLSessionTask delegateRespondsWithDelegate:v12];
      }
      else
      {

        unint64_t v22 = *(unsigned int *)&self->_defaultSessionDelegateResponds.willCacheResponse | ((unint64_t)*(unsigned __int16 *)&self->_defaultSessionDelegateResponds.didCompleteWithError << 32);
      }
      [(id)v40[5] setDelegateResponds:v22 & 0xFFFFFFFFFFFFLL];
      v25 = self->_sessionTaskQueue;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __98__HLPURLSessionManager_newURLSessionItemWithRequest_identifier_networkDelegate_completionHandler___block_invoke_24;
      v30[3] = &unk_264579798;
      id v31 = v12;
      v32 = self;
      id v34 = v18;
      v35 = &v39;
      id v33 = v15;
      id v26 = v18;
      dispatch_sync(v25, v30);
    }
    v27 = [HLPURLSessionItem alloc];
    id v23 = [(HLPURLSessionItem *)v27 initWithSessionTask:v40[5] completionHandler:v29];
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

void __98__HLPURLSessionManager_newURLSessionItemWithRequest_identifier_networkDelegate_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) coalesceTaskURLMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isCancelled])
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

void __98__HLPURLSessionManager_newURLSessionItemWithRequest_identifier_networkDelegate_completionHandler___block_invoke_24(uint64_t a1)
{
  if (*(void *)(a1 + 32) || ![*(id *)(a1 + 40) coalesceRequests])
  {
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v3 = [*(id *)(a1 + 40) uncoalesceTaskMap];
    uint64_t v4 = *(void *)(a1 + 56);
  }
  else
  {
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v3 = [*(id *)(a1 + 40) coalesceTaskURLMap];
    uint64_t v4 = *(void *)(a1 + 48);
  }
  id v5 = v3;
  [v3 setObject:v2 forKeyedSubscript:v4];
}

- (void)resumeSessionItem:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    if (self->_respondsToRequestResumed)
    {
      uint64_t v5 = MEMORY[0x263EF8330];
      uint64_t v6 = 3221225472;
      id v7 = __42__HLPURLSessionManager_resumeSessionItem___block_invoke;
      v8 = &unk_264578F50;
      id v9 = self;
      id v10 = v4;
      dispatch_async(MEMORY[0x263EF83A0], &v5);
    }
    objc_msgSend(v4, "resume", v5, v6, v7, v8, v9);
  }
}

void __42__HLPURLSessionManager_resumeSessionItem___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) sessionTask];
  [v4 URLSessionManagerRequestResumed:v2 sessionTask:v3];
}

- (void)cancelSessionItem:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 cancel];
    uint64_t v5 = [v4 sessionTask];

    if (v5 && [v5 isCancelled])
    {
      uint64_t v6 = [v5 task];
      [(HLPURLSessionManager *)self removeTaskFromMap:v6];

      if (self->_respondsToRequestCompleted)
      {
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __42__HLPURLSessionManager_cancelSessionItem___block_invoke;
        v7[3] = &unk_264578F50;
        v7[4] = self;
        id v8 = v5;
        dispatch_async(MEMORY[0x263EF83A0], v7);
      }
    }
  }
}

void __42__HLPURLSessionManager_cancelSessionItem___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 URLSessionManagerRequestCompleted:*(void *)(a1 + 32) sessionTask:*(void *)(a1 + 40)];
}

- (void)sessionTask:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__HLPURLSessionManager_sessionTask_didCompleteWithError___block_invoke;
    block[3] = &unk_264578AE8;
    id v8 = v6;
    id v11 = v8;
    id v12 = v7;
    id v13 = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    id v9 = [v8 task];
    [(HLPURLSessionManager *)self removeTaskFromMap:v9];
  }
}

void __57__HLPURLSessionManager_sessionTask_didCompleteWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didCompleteWithError:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) respondsToRequestCompleted])
  {
    id v2 = [*(id *)(a1 + 48) delegate];
    [v2 URLSessionManagerRequestCompleted:*(void *)(a1 + 48) sessionTask:*(void *)(a1 + 32)];
  }
}

- (void)removeTaskFromMap:(id)a3
{
  id v4 = a3;
  sessionTaskQueue = self->_sessionTaskQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HLPURLSessionManager_removeTaskFromMap___block_invoke;
  v7[3] = &unk_264578F50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionTaskQueue, v7);
}

void __42__HLPURLSessionManager_removeTaskFromMap___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) coalesceRequests];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v6 = [v3 coalesceTaskURLMap];
    id v4 = [*(id *)(a1 + 40) originalRequest];
    uint64_t v5 = [v4 URL];
    [v6 removeObjectForKey:v5];
  }
  else
  {
    id v6 = [v3 uncoalesceTaskMap];
    [v6 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (id)sessionTaskForTask:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  sessionTaskQueue = self->_sessionTaskQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HLPURLSessionManager_sessionTaskForTask___block_invoke;
  block[3] = &unk_2645797C0;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(sessionTaskQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__HLPURLSessionManager_sessionTaskForTask___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) coalesceRequests])
  {
    int v2 = [*(id *)(a1 + 40) originalRequest];
    id v9 = [v2 URL];

    uint64_t v3 = [*(id *)(a1 + 32) coalesceTaskURLMap];
    uint64_t v4 = [v3 objectForKeyedSubscript:v9];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) uncoalesceTaskMap];
    uint64_t v7 = [v9 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v3 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(HLPURLSessionManager *)self sessionTaskForTask:v9];
  id v13 = v12;
  if (v12)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
    v27[3] = &unk_264579810;
    id v14 = v12;
    id v28 = v14;
    id v15 = v10;
    id v29 = v15;
    v30 = self;
    id v16 = v11;
    id v31 = v16;
    id v17 = (void (**)(void))MEMORY[0x223C70610](v27);
    id v18 = [(HLPURLSessionManager *)self authenticationHandler];
    if ([(id)objc_opt_class() canAuthenticateWithURLResponse:v15])
    {
      uint64_t v19 = [v14 retryCount];

      if (!v19)
      {
        objc_msgSend(v14, "setRetryCount:", objc_msgSend(v14, "retryCount") + 1);
        v20 = [(HLPURLSessionManager *)self authenticationHandler];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3;
        v21[3] = &unk_264579860;
        v25 = v17;
        id v22 = v9;
        id v26 = v16;
        id v23 = self;
        id v24 = v14;
        [v20 authenticateWithCompletion:v21];

LABEL_8:
        goto LABEL_9;
      }
    }
    else
    {
    }
    v17[2](v17);
    goto LABEL_8;
  }
  (*((void (**)(id, void))v11 + 2))(v11, 0);
LABEL_9:
}

void __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) delegateResponds] & 0x1000000) != 0)
  {
    uint64_t v4 = [*(id *)(a1 + 32) networkDelegate];
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
    v7[3] = &unk_2645797E8;
    v7[4] = *(void *)(a1 + 48);
    id v8 = v5;
    id v9 = *(id *)(a1 + 56);
    [v4 sessionTask:v8 didReceiveResponse:v6 completionHandler:v7];
  }
  else
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*(id *)(a1 + 32) setDataTaskData:v2];

    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

uint64_t __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    [*(id *)(a1 + 32) sessionTask:*(void *)(a1 + 40) didCompleteWithError:0];
  }
  else if (a2 == 1)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*(id *)(a1 + 40) setDataTaskData:v4];
  }
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v5();
}

void __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7 = a4;
  if (a5)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else if ([*(id *)(a1 + 32) state] != 3)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [*(id *)(a1 + 32) cancel];
    id v8 = [*(id *)(a1 + 32) originalRequest];
    id v9 = (void *)[v8 mutableCopy];

    [v9 setAllHTTPHeaderFields:v7];
    id v10 = [*(id *)(a1 + 40) URLSession];
    id v11 = [v10 dataTaskWithRequest:v9];

    [*(id *)(a1 + 48) setTask:v11];
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(NSObject **)(v12 + 16);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4;
    id v18 = &unk_264579838;
    uint64_t v19 = v12;
    id v20 = *(id *)(a1 + 32);
    id v21 = v11;
    id v22 = *(id *)(a1 + 48);
    id v14 = v11;
    dispatch_sync(v13, &v15);
    objc_msgSend(v14, "resume", v15, v16, v17, v18, v19);
  }
}

void __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) uncoalesceTaskMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = [*(id *)(a1 + 32) uncoalesceTaskMap];
    [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 48)];

    id v6 = [*(id *)(a1 + 32) uncoalesceTaskMap];
    [v6 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v10 = a5;
  id v7 = [(HLPURLSessionManager *)self sessionTaskForTask:a4];
  id v8 = [v7 dataTaskData];
  id v9 = v8;
  if (v8) {
    [v8 appendData:v10];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HLPURLSessionManager *)self sessionTaskForTask:v7];
  [v9 setTask:v8];
  [v9 setDataTaskData:0];
  sessionTaskQueue = self->_sessionTaskQueue;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __66__HLPURLSessionManager_URLSession_dataTask_didBecomeDownloadTask___block_invoke;
  id v17 = &unk_264579838;
  id v18 = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v8;
  dispatch_sync(sessionTaskQueue, &v14);
  objc_msgSend(v13, "resume", v14, v15, v16, v17, v18);
}

void __66__HLPURLSessionManager_URLSession_dataTask_didBecomeDownloadTask___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) coalesceRequests] & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = [*(id *)(a1 + 32) uncoalesceTaskMap];
    [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

    id v4 = [*(id *)(a1 + 32) uncoalesceTaskMap];
    [v4 removeObjectForKey:*(void *)(a1 + 56)];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  id v12 = a5;
  id v9 = (void (**)(id, id))a6;
  id v10 = [(HLPURLSessionManager *)self sessionTaskForTask:a4];
  if ([v10 delegateResponds])
  {
    id v11 = [v10 networkDelegate];
    [v11 sessionTask:v10 willCacheResponse:v12 completionHandler:v9];
  }
  else
  {
    v9[2](v9, v12);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v15 = a5;
  id v11 = a6;
  id v12 = (void (**)(id, id))a7;
  id v13 = [(HLPURLSessionManager *)self sessionTaskForTask:a4];
  if (([v13 delegateResponds] & 0x100) != 0)
  {
    uint64_t v14 = [v13 networkDelegate];
    [v14 sessionTask:v13 willPerformHTTPRedirection:v15 newRequest:v11 completionHandler:v12];
  }
  else
  {
    v12[2](v12, v11);
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  if (a7 >= 1 || a6 <= 0) {
    int64_t v8 = a7;
  }
  else {
    int64_t v8 = a6;
  }
  if (v8 != -1)
  {
    id v9 = [(HLPURLSessionManager *)self sessionTaskForTask:a4];
    [v9 setDownloadTaskTotalBytes:v8];
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v13 = a5;
  id v7 = [(HLPURLSessionManager *)self sessionTaskForTask:a4];
  uint64_t v8 = [v7 downloadTaskTotalBytes];
  if (v13 && v8)
  {
    if (([v7 delegateResponds] & 0x10000) != 0)
    {
      id v12 = [v7 networkDelegate];
      [v12 sessionTask:v7 didFinishDownloadingToURL:v13];
    }
    else
    {
      id v9 = (void *)MEMORY[0x263EFF8F8];
      id v10 = [v13 path];
      id v11 = [v9 dataWithContentsOfFile:v10];
      [v7 setFormattedData:v11];
    }
  }
  else
  {
    [v7 setDownloadTaskTotalBytes:0];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  uint64_t v8 = [(HLPURLSessionManager *)self sessionTaskForTask:v16];
  id v9 = [v16 response];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = [v16 response];
    [v8 setResponse:v11];
    id v12 = [v11 allHeaderFields];
    id v13 = [v12 objectForKeyedSubscript:@"Last-Modified"];
    [v8 setLastModified:v13];
  }
  if (([v8 delegateResponds] & 0x100000000) != 0)
  {
    uint64_t v14 = [v8 networkDelegate];
    [v14 sessionTask:v8 didCompleteWithError:v7];
  }
  if (v8)
  {
    if (v7)
    {
      [(HLPURLSessionManager *)self sessionTask:v8 didCompleteWithError:v7];
    }
    else
    {
      id v15 = [v8 dataError];
      [(HLPURLSessionManager *)self sessionTask:v8 didCompleteWithError:v15];
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v15 = a5;
  id v9 = (void (**)(id, uint64_t, void))a6;
  id v10 = [(HLPURLSessionManager *)self sessionTaskForTask:a4];
  if (([v10 delegateResponds] & 0x10000000000) != 0
    && ([v15 protectionSpace],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v11 host],
        id v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 hasSuffix:@".apple.com"],
        v12,
        v11,
        v13))
  {
    uint64_t v14 = [v10 networkDelegate];
    [v14 sessionTask:v10 didReceiveChallenge:v15 completionHandler:v9];
  }
  else
  {
    v9[2](v9, 3, 0);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t, void))a5;
  if (self->_respondsToDidReceiveChallenge
    && ([v8 protectionSpace],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 host],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 hasSuffix:@".apple.com"],
        v11,
        v10,
        v12))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained URLSessionManagerDidReceiveChallenge:v8 completionHandler:v9];
  }
  else
  {
    v9[2](v9, 3, 0);
  }
}

- (HLPURLSessionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HLPURLSessionManagerDelegate *)WeakRetained;
}

- (HLPURLSessionDelegate)defaultSessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSessionDelegate);
  return (HLPURLSessionDelegate *)WeakRetained;
}

- (HLPURLSessionCustomAuthHandling)authenticationHandler
{
  return self->_authenticationHandler;
}

- (void)setAuthenticationHandler:(id)a3
{
}

- (BOOL)respondsToRequestResumed
{
  return self->_respondsToRequestResumed;
}

- (void)setRespondsToRequestResumed:(BOOL)a3
{
  self->_respondsToRequestResumed = a3;
}

- (BOOL)respondsToRequestCompleted
{
  return self->_respondsToRequestCompleted;
}

- (void)setRespondsToRequestCompleted:(BOOL)a3
{
  self->_respondsToRequestCompleted = a3;
}

- (BOOL)respondsToDidReceiveChallenge
{
  return self->_respondsToDidReceiveChallenge;
}

- (void)setRespondsToDidReceiveChallenge:(BOOL)a3
{
  self->_respondsToDidReceiveChallenge = a3;
}

- (BOOL)coalesceRequests
{
  return self->_coalesceRequests;
}

- (void)setCoalesceRequests:(BOOL)a3
{
  self->_coalesceRequests = a3;
}

- (NSMutableDictionary)coalesceTaskURLMap
{
  return self->_coalesceTaskURLMap;
}

- (void)setCoalesceTaskURLMap:(id)a3
{
}

- (NSMutableDictionary)uncoalesceTaskMap
{
  return self->_uncoalesceTaskMap;
}

- (void)setUncoalesceTaskMap:(id)a3
{
}

- (void)setURLSession:(id)a3
{
}

- (PPCRedirect)urlRedirector
{
  return self->_urlRedirector;
}

- (void)setUrlRedirector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRedirector, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_uncoalesceTaskMap, 0);
  objc_storeStrong((id *)&self->_coalesceTaskURLMap, 0);
  objc_storeStrong((id *)&self->_authenticationHandler, 0);
  objc_destroyWeak((id *)&self->_defaultSessionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionTaskQueue, 0);
}

@end