@interface AAURLSession
+ (AAURLSession)sharedPinningOnlySession;
+ (AAURLSession)sharedPinningSession;
+ (AAURLSession)sharedSession;
+ (AAURLSession)sharedSessionWithNoUrlCache;
+ (AAURLSession)sharedSigningSession;
- (AAURLSession)init;
- (NSURLSession)urlSession;
- (id)_enqueueRequest:(id)a3 completion:(id)a4;
- (id)_initRequiringSigning:(BOOL)a3;
- (id)_initRequiringSigning:(BOOL)a3 requiresPinning:(BOOL)a4;
- (id)_initRequiringSigning:(BOOL)a3 requiresPinning:(BOOL)a4 requiresUrlCache:(BOOL)a5;
- (id)bodyTaskWithRequest:(id)a3 completion:(id)a4;
- (id)bodyTaskWithURL:(id)a3 completion:(id)a4;
- (id)dataTaskWithRequest:(id)a3 completion:(id)a4;
- (id)dataTaskWithURL:(id)a3 completion:(id)a4;
- (id)initForProxiedDevice:(id)a3;
- (id)initForProxiedDevice:(id)a3 anisetteDataProvider:(id)a4;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_sessionQueue_dequeueTask:(id)a3 withResponse:(id)a4 error:(id)a5;
- (void)_sessionQueue_enqueueTask:(id)a3 completion:(id)a4;
- (void)_sessionQueue_updateTask:(id)a3 withData:(id)a4;
- (void)resetSessionCache;
@end

@implementation AAURLSession

+ (AAURLSession)sharedSessionWithNoUrlCache
{
  if (sharedSessionWithNoUrlCache_onceToken != -1) {
    dispatch_once(&sharedSessionWithNoUrlCache_onceToken, &__block_literal_global_137);
  }
  v2 = (void *)sharedSessionWithNoUrlCache_sharedSession;

  return (AAURLSession *)v2;
}

uint64_t __43__AAURLSession_sharedSessionWithNoUrlCache__block_invoke()
{
  sharedSessionWithNoUrlCache_sharedSession = [[AAURLSession alloc] _initRequiringSigning:0 requiresPinning:0 requiresUrlCache:0];

  return MEMORY[0x1F41817F8]();
}

- (id)_initRequiringSigning:(BOOL)a3 requiresPinning:(BOOL)a4 requiresUrlCache:(BOOL)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (_AAURLSessionRegisterProtocol_onceToken != -1) {
    dispatch_once(&_AAURLSessionRegisterProtocol_onceToken, &__block_literal_global_248);
  }
  v24.receiver = self;
  v24.super_class = (Class)AAURLSession;
  v9 = [(AAURLSession *)&v24 init];
  v10 = v9;
  if (v9)
  {
    v9->_BOOL requiresSigning = a3;
    v9->_requiresICSSPinning = a4;
    v9->_requiresUrlCache = a5;
    v11 = [[_AAURLSessionDelegate alloc] initWithDelegate:v9];
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.AppleAccount.SessionQ", v12);
    sessionQueue = v10->_sessionQueue;
    v10->_sessionQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = _AAURLSessionCreateSession(v11, v10->_sessionQueue, v10->_requiresSigning, v10->_requiresUrlCache);
    session = v10->_session;
    v10->_session = (NSURLSession *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingSessionOperations = v10->_pendingSessionOperations;
    v10->_pendingSessionOperations = v17;

    v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = @"YES";
      BOOL requiresSigning = v10->_requiresSigning;
      if (v10->_requiresUrlCache) {
        v22 = @"YES";
      }
      else {
        v22 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      if (!requiresSigning) {
        v20 = @"NO";
      }
      v26 = v22;
      __int16 v27 = 2112;
      v28 = v20;
      __int16 v29 = 2112;
      v30 = v20;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "AAURLSession initiated with _requiresUrlCache: %@, _requiresSigning: %@, _requiresICSSPinning: %@", buf, 0x20u);
    }
  }
  return v10;
}

+ (AAURLSession)sharedSession
{
  if (sharedSession_onceToken != -1) {
    dispatch_once(&sharedSession_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)sharedSession_sharedSession;

  return (AAURLSession *)v2;
}

- (NSURLSession)urlSession
{
  return self->_session;
}

uint64_t __29__AAURLSession_sharedSession__block_invoke()
{
  sharedSession_sharedSession = [[AAURLSession alloc] _initRequiringSigning:0];

  return MEMORY[0x1F41817F8]();
}

+ (AAURLSession)sharedSigningSession
{
  if (sharedSigningSession_onceToken != -1) {
    dispatch_once(&sharedSigningSession_onceToken, &__block_literal_global_131);
  }
  v2 = (void *)sharedSigningSession_sharedSession;

  return (AAURLSession *)v2;
}

uint64_t __36__AAURLSession_sharedSigningSession__block_invoke()
{
  sharedSigningSession_sharedSession = [[AAURLSession alloc] _initRequiringSigning:1];

  return MEMORY[0x1F41817F8]();
}

+ (AAURLSession)sharedPinningSession
{
  if (sharedPinningSession_onceToken != -1) {
    dispatch_once(&sharedPinningSession_onceToken, &__block_literal_global_133);
  }
  v2 = (void *)sharedPinningSession_sharedSession;

  return (AAURLSession *)v2;
}

uint64_t __36__AAURLSession_sharedPinningSession__block_invoke()
{
  sharedPinningSession_sharedSession = [[AAURLSession alloc] _initRequiringSigning:1 requiresPinning:1];

  return MEMORY[0x1F41817F8]();
}

+ (AAURLSession)sharedPinningOnlySession
{
  if (sharedPinningOnlySession_onceToken != -1) {
    dispatch_once(&sharedPinningOnlySession_onceToken, &__block_literal_global_135);
  }
  v2 = (void *)sharedPinningOnlySession_sharedSession;

  return (AAURLSession *)v2;
}

uint64_t __40__AAURLSession_sharedPinningOnlySession__block_invoke()
{
  sharedPinningOnlySession_sharedSession = [[AAURLSession alloc] _initRequiringSigning:0 requiresPinning:1];

  return MEMORY[0x1F41817F8]();
}

- (AAURLSession)init
{
  return (AAURLSession *)[(AAURLSession *)self _initRequiringSigning:0];
}

- (id)_initRequiringSigning:(BOOL)a3
{
  return [(AAURLSession *)self _initRequiringSigning:a3 requiresPinning:0];
}

- (id)_initRequiringSigning:(BOOL)a3 requiresPinning:(BOOL)a4
{
  return [(AAURLSession *)self _initRequiringSigning:a3 requiresPinning:a4 requiresUrlCache:1];
}

- (id)initForProxiedDevice:(id)a3
{
  return [(AAURLSession *)self initForProxiedDevice:a3 anisetteDataProvider:0];
}

- (id)initForProxiedDevice:(id)a3 anisetteDataProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_AAURLSessionRegisterProtocol_onceToken != -1) {
    dispatch_once(&_AAURLSessionRegisterProtocol_onceToken, &__block_literal_global_248);
  }
  v22.receiver = self;
  v22.super_class = (Class)AAURLSession;
  v8 = [(AAURLSession *)&v22 init];
  v9 = v8;
  if (v8)
  {
    v8->_BOOL requiresSigning = 0;
    v10 = [[_AAURLSessionDelegate alloc] initWithDelegate:v8];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.AppleAccount.SessionQ", v11);
    sessionQueue = v9->_sessionQueue;
    v9->_sessionQueue = (OS_dispatch_queue *)v12;

    v14 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
    [v14 setWaitsForConnectivity:1];
    [v14 setTimeoutIntervalForResource:60.0];
    id v15 = objc_alloc_init(MEMORY[0x1E4F4EF78]);
    [v15 setPairedDevice:v6];
    [v15 setAnisetteDataProvider:v7];
    objc_msgSend(v14, "set_appleIDContext:", v15);
    v16 = objc_msgSend(MEMORY[0x1E4F28F08], "aa_operationQueueWithUnderlyingQueue:", v9->_sessionQueue);
    uint64_t v17 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v14 delegate:v10 delegateQueue:v16];
    session = v9->_session;
    v9->_session = (NSURLSession *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingSessionOperations = v9->_pendingSessionOperations;
    v9->_pendingSessionOperations = v19;
  }
  return v9;
}

- (void)resetSessionCache
{
  v3 = _AAURLSessionSharedCache(self->_requiresUrlCache);
  [v3 removeAllCachedResponses];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  session = self->_session;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__AAURLSession_resetSessionCache__block_invoke;
  v7[3] = &unk_1E5A48358;
  dispatch_semaphore_t v8 = v4;
  id v6 = v4;
  [(NSURLSession *)session resetWithCompletionHandler:v7];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __33__AAURLSession_resetSessionCache__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)dataTaskWithURL:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"AAURLSession.m", 290, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"AAURLSession.m", 291, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AAURLSession dataTaskWithURL:completion:]();
  }

  v11 = [MEMORY[0x1E4F18DA8] requestWithURL:v7];
  dispatch_queue_t v12 = [(AAURLSession *)self dataTaskWithRequest:v11 completion:v9];

  return v12;
}

- (id)dataTaskWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_queue_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"AAURLSession.m", 301, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  dispatch_queue_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"AAURLSession.m", 302, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  v10 = [(AAURLSession *)self _enqueueRequest:v7 completion:v9];

  return v10;
}

- (id)bodyTaskWithURL:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_queue_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"AAURLSession.m", 308, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"AAURLSession.m", 309, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  v10 = [MEMORY[0x1E4F18DA8] requestWithURL:v7];
  v11 = [(AAURLSession *)self bodyTaskWithRequest:v10 completion:v9];

  return v11;
}

- (id)bodyTaskWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_queue_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"AAURLSession.m", 317, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"AAURLSession.m", 318, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__AAURLSession_bodyTaskWithRequest_completion___block_invoke;
  v15[3] = &unk_1E5A48948;
  id v16 = v9;
  id v10 = v9;
  v11 = [(AAURLSession *)self dataTaskWithRequest:v7 completion:v15];

  return v11;
}

void __47__AAURLSession_bodyTaskWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    objc_opt_class();
    id v9 = v7;
    if (objc_opt_isKindOfClass())
    {
      id v10 = (void *)MEMORY[0x1E4F47000];
      v11 = [v9 MIMEType];
      dispatch_queue_t v12 = [v10 dictionaryFromObject:v17 ofType:v11];

      if ((unint64_t)([v9 statusCode] - 200) > 0x63)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        uint64_t v15 = *(void *)(a1 + 32);
        if (isKindOfClass) {
          objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithServerResponse:", v12);
        }
        else {
        id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:underlyingError:", -4402, v8);
        }
        (*(void (**)(uint64_t, void, id, void *))(v15 + 16))(v15, 0, v9, v16);
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
    else
    {

      uint64_t v13 = *(void *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:underlyingError:", -4402, v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, void, id))(v13 + 16))(v13, 0, 0, v9);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_enqueueRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"AAURLSession.m", 349, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"AAURLSession.m", 350, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = [(NSURLSession *)self->_session dataTaskWithRequest:v7];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AAURLSession__enqueueRequest_completion___block_invoke;
  block[3] = &unk_1E5A484C0;
  block[4] = self;
  id v12 = v10;
  id v20 = v12;
  v21 = v9;
  id v13 = v9;
  dispatch_async(sessionQueue, block);
  v14 = v21;
  id v15 = v12;

  return v15;
}

uint64_t __43__AAURLSession__enqueueRequest_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionQueue_enqueueTask:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_sessionQueue_enqueueTask:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"AAURLSession.m", 379, @"Invalid parameter not satisfying: %@", @"task" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"AAURLSession.m", 380, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  id v10 = +[_AAURLSessionOperation operationWithCompletion:v9];
  [(NSMutableDictionary *)self->_pendingSessionOperations setObject:v10 forKeyedSubscript:v7];

  v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AAURLSession _sessionQueue_enqueueTask:completion:]();
  }
}

- (void)_sessionQueue_updateTask:(id)a3 withData:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"AAURLSession.m", 389, @"Invalid parameter not satisfying: %@", @"task" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"AAURLSession.m", 390, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

LABEL_3:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  id v8 = [(NSMutableDictionary *)self->_pendingSessionOperations objectForKeyedSubscript:v11];
  [v8 appendData:v7];
}

- (void)_sessionQueue_dequeueTask:(id)a3 withResponse:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"AAURLSession.m", 398, @"Invalid parameter not satisfying: %@", @"task" object file lineNumber description];
  }
  id v12 = v10;
  id v13 = v11;
  if ((v12 == 0) != (v13 != 0))
  {
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid exclusivity not satisfying: response ^ error" userInfo:0];
    objc_exception_throw(v19);
  }
  v14 = v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  id v15 = [(NSMutableDictionary *)self->_pendingSessionOperations aaf_removeObjectForKey:v9];
  if (!v15)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"AAURLSession.m", 405, @"Failed to find handler for task: %@", v9 object file lineNumber description];
  }
  id v16 = _AALogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[AAURLSession _sessionQueue_dequeueTask:withResponse:error:]();
  }

  [v15 invokeCompletionWithResponse:v12 error:v14];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v14 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v14)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"AAURLSession.m", 415, @"Invalid parameter not satisfying: %@", @"task" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  id v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"AAURLSession.m", 414, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];

  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_9:
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"AAURLSession.m", 416, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

LABEL_4:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  [(AAURLSession *)self _sessionQueue_updateTask:v9 withData:v10];
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v13 = (NSURLSession *)a3;
  id v7 = a4;
  if (!v13)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"AAURLSession.m", 426, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  if (self->_session != v13)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"AAURLSession.m", 430, @"Received invalidation for unexpected session (%@)!", v13 object file lineNumber description];
  }
  [(NSMutableDictionary *)self->_pendingSessionOperations enumerateKeysAndObjectsUsingBlock:&__block_literal_global_196];
  id v8 = [[_AAURLSessionDelegate alloc] initWithDelegate:self];
  _AAURLSessionCreateSession(v8, self->_sessionQueue, self->_requiresSigning, self->_requiresUrlCache);
  id v9 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v9;
}

uint64_t __53__AAURLSession_URLSession_didBecomeInvalidWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v10 = (void (**)(id, uint64_t, void))a5;
  if (self->_requiresICSSPinning)
  {
    id v7 = a4;
    id v8 = objc_opt_new();
    uint64_t v9 = [v8 validateCertificateTrustWithChallenge:v7 type:2];
  }
  else
  {
    uint64_t v9 = 1;
  }
  v10[2](v10, v9, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v20 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v20)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"AAURLSession.m", 457, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_14:
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"AAURLSession.m", 458, @"Invalid parameter not satisfying: %@", @"task" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_14;
  }
LABEL_3:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  uint64_t v11 = [v9 response];
  id v12 = (void *)v11;
  if (v10 || !v11)
  {
    [(AAURLSession *)self _sessionQueue_dequeueTask:v9 withResponse:0 error:v10];
  }
  else
  {
    objc_opt_class();
    id v13 = v12;
    if (objc_opt_isKindOfClass())
    {
      id v14 = self;
      id v15 = v9;
      id v16 = v13;
      id v17 = 0;
    }
    else
    {

      objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:underlyingError:", -4402, 0);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      id v14 = self;
      id v15 = v9;
      id v16 = 0;
      id v17 = v13;
    }
    [(AAURLSession *)v14 _sessionQueue_dequeueTask:v15 withResponse:v16 error:v17];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSessionOperations, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (void)dataTaskWithURL:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "Creating data task with URL: %@", v2, v3, v4, v5, v6);
}

- (void)_sessionQueue_enqueueTask:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "Enqueued dataTask %{public}@", v2, v3, v4, v5, v6);
}

- (void)_sessionQueue_dequeueTask:withResponse:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "Dequeued dataTask %{public}@", v2, v3, v4, v5, v6);
}

@end