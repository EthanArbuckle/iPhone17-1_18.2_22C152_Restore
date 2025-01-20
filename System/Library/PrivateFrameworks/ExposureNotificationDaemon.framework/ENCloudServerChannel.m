@interface ENCloudServerChannel
- (ENCloudServerChannel)init;
- (NSHTTPCookieStorage)cookieStorage;
- (NSMutableDictionary)requests;
- (NSOperationQueue)queue;
- (NSURLSession)session;
- (NSURLSession)sourceApplicationSession;
- (NSURLSessionConfiguration)sessionConfig;
- (NSURLSessionConfiguration)sourceApplicationSessionConfig;
- (OS_dispatch_queue)serialQueue;
- (void)dealloc;
- (void)enqueueRequest:(id)a3 withCompletion:(id)a4;
- (void)setCookieStorage:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequests:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionConfig:(id)a3;
- (void)setSourceApplicationSession:(id)a3;
- (void)setSourceApplicationSessionConfig:(id)a3;
@end

@implementation ENCloudServerChannel

- (ENCloudServerChannel)init
{
  v23.receiver = self;
  v23.super_class = (Class)ENCloudServerChannel;
  v2 = [(ENCloudServerChannel *)&v23 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28F10]);
    [(ENCloudServerChannel *)v2 setQueue:v3];

    v4 = [(ENCloudServerChannel *)v2 queue];
    [v4 setMaxConcurrentOperationCount:1];

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.bluetooth.serverChannel", v5);
    [(ENCloudServerChannel *)v2 setSerialQueue:v6];

    v7 = [MEMORY[0x1E4F18DC8] defaultSessionConfiguration];
    [(ENCloudServerChannel *)v2 setSessionConfig:v7];

    v8 = [(ENCloudServerChannel *)v2 sessionConfig];
    [v8 setURLCache:0];

    v9 = [(ENCloudServerChannel *)v2 sessionConfig];
    [v9 setRequestCachePolicy:1];

    v10 = [(ENCloudServerChannel *)v2 cookieStorage];
    v11 = [(ENCloudServerChannel *)v2 sessionConfig];
    [v11 setHTTPCookieStorage:v10];

    v12 = [(ENCloudServerChannel *)v2 sessionConfig];
    [v12 setWaitsForConnectivity:1];

    v13 = ENBundleIdentifierForURLSessions();
    v14 = [(ENCloudServerChannel *)v2 sessionConfig];
    objc_msgSend(v14, "set_sourceApplicationBundleIdentifier:", v13);

    v15 = (void *)MEMORY[0x1E4F18DB8];
    v16 = [(ENCloudServerChannel *)v2 sessionConfig];
    v17 = [v15 sessionWithConfiguration:v16];
    [(ENCloudServerChannel *)v2 setSession:v17];

    v18 = [(ENCloudServerChannel *)v2 serialQueue];
    v19 = [(ENCloudServerChannel *)v2 session];
    v20 = [v19 delegateQueue];
    [v20 setUnderlyingQueue:v18];

    v21 = [MEMORY[0x1E4F1CA68] dictionary];
    [(ENCloudServerChannel *)v2 setRequests:v21];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [(ENCloudServerChannel *)self requests];
  [v3 removeAllObjects];

  v4.receiver = self;
  v4.super_class = (Class)ENCloudServerChannel;
  [(ENCloudServerChannel *)&v4 dealloc];
}

- (void)enqueueRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_ENCloudServerChannel <= 30
    && (gLogCategory_ENCloudServerChannel != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  id v8 = v6;
  if (v8)
  {
    v9 = [(ENCloudServerChannel *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__ENCloudServerChannel_enqueueRequest_withCompletion___block_invoke;
    block[3] = &unk_1E69ACB40;
    block[4] = v8;
    block[5] = self;
    id v11 = v7;
    dispatch_async(v9, block);
  }
}

void __54__ENCloudServerChannel_enqueueRequest_withCompletion___block_invoke(id *a1)
{
  v2 = (void *)MEMORY[0x1E4F18D58];
  id v3 = [a1[4] url];
  objc_super v4 = [v2 requestWithURL:v3 cachePolicy:1 timeoutInterval:60.0];

  v5 = [a1[4] httpMethodString];
  [v4 setHTTPMethod:v5];

  id v6 = [a1[4] headers];
  [v4 setAllHTTPHeaderFields:v6];

  id v7 = [a1[4] body];
  if (v7) {
    [v4 setHTTPBody:v7];
  }
  id location = 0;
  objc_initWeak(&location, a1[5]);
  id v8 = [a1[5] session];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__ENCloudServerChannel_enqueueRequest_withCompletion___block_invoke_2;
  v14[3] = &unk_1E69ACB18;
  objc_copyWeak(&v17, &location);
  v14[4] = a1[4];
  id v9 = v4;
  id v15 = v9;
  id v16 = a1[6];
  v10 = [v8 dataTaskWithRequest:v9 completionHandler:v14];

  id v11 = [a1[5] requests];
  v12 = [a1[4] requestID];
  [v11 setObject:v10 forKeyedSubscript:v12];

  [v10 resume];
  if (gLogCategory_ENCloudServerChannel <= 30
    && (gLogCategory_ENCloudServerChannel != -1 || _LogCategory_Initialize()))
  {
    v13 = [a1[5] requests];
    LogPrintF_safe();
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __54__ENCloudServerChannel_enqueueRequest_withCompletion___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v33 = a2;
  id v7 = a3;
  id v34 = a4;
  v36 = a1;
  id val = objc_loadWeakRetained(a1 + 7);
  v32 = v7;
  v37 = (void *)[v7 copy];
  if (gLogCategory_ENCloudServerChannel <= 10
    && (gLogCategory_ENCloudServerChannel != -1 || _LogCategory_Initialize()))
  {
    v27 = [a1[4] url];
    LogPrintF_safe();
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  long long v45 = 0u;
  id v8 = objc_msgSend(a1[5], "allHTTPHeaderFields", v27);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v8);
        }
        if (gLogCategory_ENCloudServerChannel <= 30)
        {
          uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          if (gLogCategory_ENCloudServerChannel != -1 || _LogCategory_Initialize())
          {
            v13 = objc_msgSend(v36[5], "allHTTPHeaderFields", v28, v30);
            [v13 objectForKeyedSubscript:v12];
            v30 = uint64_t v28 = v12;
            LogPrintF_safe();
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v9);
  }

  if (gLogCategory__ENCloudServerChannel <= 30
    && (gLogCategory__ENCloudServerChannel != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = objc_msgSend(v37, "statusCode", v28, v30);
    id v15 = [v37 allHeaderFields];
    [v15 objectForKeyedSubscript:@"x-apple-request-uuid"];
    v30 = uint64_t v28 = v14;
    LogPrintF_safe();
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v16 = objc_msgSend(v37, "allHeaderFields", v28, v30);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v16);
        }
        if (gLogCategory_ENCloudServerChannel <= 30)
        {
          uint64_t v20 = *(void *)(*((void *)&v41 + 1) + 8 * j);
          if (gLogCategory_ENCloudServerChannel != -1 || _LogCategory_Initialize())
          {
            v21 = objc_msgSend(v37, "allHeaderFields", v29, v31);
            [v21 objectForKeyedSubscript:v20];
            v31 = uint64_t v29 = v20;
            LogPrintF_safe();
          }
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v17);
  }

  id location = 0;
  objc_initWeak(&location, val);
  v22 = [val serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__ENCloudServerChannel_enqueueRequest_withCompletion___block_invoke_3;
  block[3] = &unk_1E69ACAF0;
  objc_copyWeak(&v39, &location);
  block[4] = v36[4];
  dispatch_async(v22, block);

  objc_super v23 = (void (**)(id, uint64_t, void *, void *, id))v36[6];
  if (v23)
  {
    uint64_t v24 = [v37 statusCode];
    v25 = [v37 allHeaderFields];
    v26 = (void *)[v33 copy];
    v23[2](v23, v24, v25, v26, v34);
  }
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

void __54__ENCloudServerChannel_enqueueRequest_withCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained requests];
  id v3 = [*(id *)(a1 + 32) requestID];
  [v2 removeObjectForKey:v3];
}

- (NSHTTPCookieStorage)cookieStorage
{
  cookieStorage = self->_cookieStorage;
  if (!cookieStorage)
  {
    objc_super v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v5 = [v4 objectAtIndex:0];
    id v6 = [v5 stringByAppendingPathComponent:@"com.apple.bluetooth.serverChannel"];
    id v7 = [v6 stringByAppendingPathComponent:@"cookies"];

    id v8 = v7;
    uint64_t v9 = (const char *)[v8 UTF8String];
    size_t v10 = strlen(v9);
    CFURLRef v11 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF88], (const UInt8 *)v9, v10, 1u);
    uint64_t v12 = (const void *)CFHTTPCookieStorageCreateFromFile();
    CFRunLoopGetMain();
    CFHTTPCookieStorageScheduleWithRunLoop();
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F18D38]) _initWithCFHTTPCookieStorage:v12];
    [(ENCloudServerChannel *)self setCookieStorage:v13];

    if (v11) {
      CFRelease(v11);
    }
    if (v12) {
      CFRelease(v12);
    }

    cookieStorage = self->_cookieStorage;
  }

  return cookieStorage;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSURLSessionConfiguration)sessionConfig
{
  return self->_sessionConfig;
}

- (void)setSessionConfig:(id)a3
{
}

- (NSURLSession)sourceApplicationSession
{
  return self->_sourceApplicationSession;
}

- (void)setSourceApplicationSession:(id)a3
{
}

- (NSURLSessionConfiguration)sourceApplicationSessionConfig
{
  return self->_sourceApplicationSessionConfig;
}

- (void)setSourceApplicationSessionConfig:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void)setCookieStorage:(id)a3
{
}

- (NSMutableDictionary)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_cookieStorage, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sourceApplicationSessionConfig, 0);
  objc_storeStrong((id *)&self->_sourceApplicationSession, 0);
  objc_storeStrong((id *)&self->_sessionConfig, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end