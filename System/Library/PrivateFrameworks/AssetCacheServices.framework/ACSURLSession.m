@interface ACSURLSession
+ (ACSURLSession)sessionWithConfiguration:(id)a3 canUseCachingServer:(BOOL)a4 locateOptions:(id)a5 delegate:(id)a6 delegateQueue:(id)a7;
+ (ACSURLSession)sharedSession;
+ (id)sessionWithConfiguration:(id)a3 canUseCachingServer:(BOOL)a4 locateOptions:(id)a5;
- (ACSURLSession)initWithConfiguration:(id)a3 canUseCachingServer:(BOOL)a4 locateOptions:(id)a5 delegate:(id)a6 delegateQueue:(id)a7;
- (ACSURLSessionDelegate)_clientDelegate;
- (BOOL)_resumeData:(id)a3 toNSURLResumeData:(id *)a4 originalRequest:(id *)a5 currentRequest:(id *)a6 error:(id *)a7;
- (BOOL)canUseCachingServer;
- (NSDictionary)_locateOptions;
- (NSDictionary)locateOptions;
- (NSMutableDictionary)_tasks;
- (NSOperationQueue)_clientDelegateOpQueue;
- (NSString)description;
- (NSString)sessionDescription;
- (NSURLSession)_nsurlSession;
- (NSURLSessionConfiguration)configuration;
- (OS_dispatch_queue)_queue;
- (OS_os_log)_logHandle;
- (id)_downloadTaskWithResumeData:(id)a3 completionHandler:(id)a4;
- (id)_errorWithResumeDataFromError:(id)a3 originalRequest:(id)a4 currentRequest:(id)a5;
- (id)_keyForNSURLTask:(id)a3;
- (id)_linkedLocationWithLocation:(id)a3;
- (id)_onqueue_taskForNSURLTask:(id)a3;
- (id)_onqueue_uniqueTasks;
- (id)_resumeDataWithNSURLResumeData:(id)a3 originalRequest:(id)a4 currentRequest:(id)a5 error:(id *)a6;
- (id)dataTaskWithRequest:(id)a3;
- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)dataTaskWithURL:(id)a3;
- (id)dataTaskWithURL:(id)a3 completionHandler:(id)a4;
- (id)downloadTaskWithRequest:(id)a3;
- (id)downloadTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)downloadTaskWithResumeData:(id)a3;
- (id)downloadTaskWithURL:(id)a3;
- (id)downloadTaskWithURL:(id)a3 completionHandler:(id)a4;
- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4;
- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4 completionHandler:(id)a5;
- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4;
- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4 completionHandler:(id)a5;
- (id)uploadTaskWithStreamedRequest:(id)a3;
- (int)_phase;
- (void)URLSession:(id)a3 betterRouteDiscoveredForStreamTask:(id)a4;
- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeStreamTask:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 readClosedForStreamTask:(id)a4;
- (void)URLSession:(id)a3 streamTask:(id)a4 didBecomeInputStream:(id)a5 outputStream:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4;
- (void)URLSession:(id)a3 writeClosedForStreamTask:(id)a4;
- (void)_addTask:(id)a3;
- (void)_cancelDownloadTask:(id)a3 byProducingResumeData:(id)a4;
- (void)_cancelTask:(id)a3;
- (void)_copyAttributesFromNSURLTask:(id)a3 toNSURLTask:(id)a4;
- (void)_dataTask:(id)a3 completedWithData:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)_downloadTask:(id)a3 completedWithLocation:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)_locateCachingServerForURL:(id)a3 isUpload:(BOOL)a4 completionHandler:(id)a5;
- (void)_onqueue_addTask:(id)a3 forNSURLTask:(id)a4;
- (void)_onqueue_removeTaskForNSURLTask:(id)a3;
- (void)_onqueue_resumeTask:(id)a3;
- (void)_onqueue_task:(id)a3 willUseCachingServer:(BOOL)a4 newRequest:(id)a5 completionHandler:(id)a6;
- (void)_removeTask:(id)a3;
- (void)_resumeTask:(id)a3;
- (void)_suspendTask:(id)a3;
- (void)dealloc;
- (void)finishTasksAndInvalidate;
- (void)flushWithCompletionHandler:(id)a3;
- (void)getAllTasksWithCompletionHandler:(id)a3;
- (void)getTasksWithCompletionHandler:(id)a3;
- (void)invalidateAndCancel;
- (void)resetWithCompletionHandler:(id)a3;
- (void)setCanUseCachingServer:(BOOL)a3;
- (void)setSessionDescription:(id)a3;
- (void)set_clientDelegate:(id)a3;
- (void)set_clientDelegateOpQueue:(id)a3;
- (void)set_locateOptions:(id)a3;
- (void)set_logHandle:(id)a3;
- (void)set_nsurlSession:(id)a3;
- (void)set_phase:(int)a3;
- (void)set_queue:(id)a3;
- (void)set_tasks:(id)a3;
@end

@implementation ACSURLSession

+ (ACSURLSession)sharedSession
{
  if (sharedSession_once != -1) {
    dispatch_once(&sharedSession_once, &__block_literal_global);
  }
  v2 = (void *)sharedSession_sharedSession;

  return (ACSURLSession *)v2;
}

uint64_t __30__ACSURLSession_sharedSession__block_invoke()
{
  v0 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
  uint64_t v1 = +[ACSURLSession sessionWithConfiguration:v0 canUseCachingServer:1 locateOptions:0];
  v2 = (void *)sharedSession_sharedSession;
  sharedSession_sharedSession = v1;

  v3 = (void *)sharedSession_sharedSession;

  return objc_msgSend(v3, "set_phase:", 3);
}

+ (id)sessionWithConfiguration:(id)a3 canUseCachingServer:(BOOL)a4 locateOptions:(id)a5
{
  return +[ACSURLSession sessionWithConfiguration:a3 canUseCachingServer:a4 locateOptions:a5 delegate:0 delegateQueue:0];
}

+ (ACSURLSession)sessionWithConfiguration:(id)a3 canUseCachingServer:(BOOL)a4 locateOptions:(id)a5 delegate:(id)a6 delegateQueue:(id)a7
{
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v15 = [[ACSURLSession alloc] initWithConfiguration:v14 canUseCachingServer:v9 locateOptions:v13 delegate:v12 delegateQueue:v11];

  return v15;
}

- (NSURLSessionConfiguration)configuration
{
  v2 = [(ACSURLSession *)self _nsurlSession];
  v3 = [v2 configuration];

  return (NSURLSessionConfiguration *)v3;
}

- (NSDictionary)locateOptions
{
  v2 = [(ACSURLSession *)self _locateOptions];
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (NSString)sessionDescription
{
  v2 = [(ACSURLSession *)self _nsurlSession];
  v3 = [v2 sessionDescription];

  return (NSString *)v3;
}

- (void)setSessionDescription:(id)a3
{
  id v4 = a3;
  id v5 = [(ACSURLSession *)self _nsurlSession];
  [v5 setSessionDescription:v4];
}

- (void)finishTasksAndInvalidate
{
  v3 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ACSURLSession_finishTasksAndInvalidate__block_invoke;
  block[3] = &unk_1E6CC36A0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __41__ACSURLSession_finishTasksAndInvalidate__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canUseCachingServer]
    && ([*(id *)(a1 + 32) _phase]
     || ([*(id *)(a1 + 32) _tasks],
         v2 = objc_claimAutoreleasedReturnValue(),
         uint64_t v3 = [v2 count],
         v2,
         v3)))
  {
    uint64_t result = [*(id *)(a1 + 32) _phase];
    if (result) {
      return result;
    }
    uint64_t v6 = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) _nsurlSession];
    [v5 finishTasksAndInvalidate];

    uint64_t v6 = 2;
  }
  v7 = *(void **)(a1 + 32);

  return objc_msgSend(v7, "set_phase:", v6);
}

- (void)invalidateAndCancel
{
  uint64_t v3 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ACSURLSession_invalidateAndCancel__block_invoke;
  block[3] = &unk_1E6CC36A0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __36__ACSURLSession_invalidateAndCancel__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) canUseCachingServer]
    && ([*(id *)(a1 + 32) _phase]
     || ([*(id *)(a1 + 32) _tasks],
         v2 = objc_claimAutoreleasedReturnValue(),
         uint64_t v3 = [v2 count],
         v2,
         v3)))
  {
    if (![*(id *)(a1 + 32) _phase]
      || (uint64_t result = [*(id *)(a1 + 32) _phase], result == 1))
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_uniqueTasks", 0);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) cancel];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }

      v10 = [*(id *)(a1 + 32) _nsurlSession];
      [v10 invalidateAndCancel];

      return objc_msgSend(*(id *)(a1 + 32), "set_phase:", 2);
    }
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) _nsurlSession];
    [v11 invalidateAndCancel];

    id v12 = *(void **)(a1 + 32);
    return objc_msgSend(v12, "set_phase:", 2);
  }
  return result;
}

- (void)resetWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ACSURLSession *)self _queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ACSURLSession_resetWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6CC36C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__ACSURLSession_resetWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _nsurlSession];
  [v2 resetWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)flushWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ACSURLSession *)self _queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ACSURLSession_flushWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6CC36C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__ACSURLSession_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _nsurlSession];
  [v2 flushWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)getTasksWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ACSURLSession *)self _queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ACSURLSession_getTasksWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6CC36C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__ACSURLSession_getTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = a1;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_uniqueTasks");
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v12 = v4;
        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v12 = v3;
          }
          else {
            id v12 = v2;
          }
        }
        [v12 addObject:v10];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  long long v13 = [*(id *)(v18 + 32) _clientDelegateOpQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __47__ACSURLSession_getTasksWithCompletionHandler___block_invoke_2;
  v19[3] = &unk_1E6CC36F0;
  id v14 = *(id *)(v18 + 40);
  id v20 = v2;
  id v21 = v3;
  id v22 = v4;
  id v23 = v14;
  id v15 = v4;
  id v16 = v3;
  id v17 = v2;
  [v13 addOperationWithBlock:v19];
}

uint64_t __47__ACSURLSession_getTasksWithCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)getAllTasksWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ACSURLSession *)self _queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ACSURLSession_getAllTasksWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6CC36C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__ACSURLSession_getAllTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_uniqueTasks");
  uint64_t v3 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__ACSURLSession_getAllTasksWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E6CC3718;
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  [v3 addOperationWithBlock:v6];
}

uint64_t __50__ACSURLSession_getAllTasksWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)dataTaskWithRequest:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__ACSURLSession_dataTaskWithRequest___block_invoke;
  v8[3] = &unk_1E6CC3740;
  v8[4] = self;
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E01B57E0](v8);
  id v6 = [[ACSURLSessionDataTask alloc] initWithNSURLDataTaskCreator:v5 initialRequest:v4 forSession:self];

  [(ACSURLSession *)self _addTask:v6];

  return v6;
}

id __37__ACSURLSession_dataTaskWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _nsurlSession];
  id v5 = [v4 dataTaskWithRequest:v3];

  return v5;
}

- (id)dataTaskWithURL:(id)a3
{
  id v4 = [MEMORY[0x1E4F290D0] requestWithURL:a3];
  id v5 = [(ACSURLSession *)self dataTaskWithRequest:v4];

  return v5;
}

- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4
{
  id v6 = a4;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __48__ACSURLSession_uploadTaskWithRequest_fromFile___block_invoke;
  id v16 = &unk_1E6CC3768;
  id v17 = self;
  id v18 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1E01B57E0](&v13);
  uint64_t v10 = [ACSURLSessionUploadTask alloc];
  id v11 = -[ACSURLSessionUploadTask initWithNSURLUploadTaskCreator:initialRequest:forSession:](v10, "initWithNSURLUploadTaskCreator:initialRequest:forSession:", v9, v8, self, v13, v14, v15, v16, v17);

  [(ACSURLSession *)self _addTask:v11];

  return v11;
}

id __48__ACSURLSession_uploadTaskWithRequest_fromFile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _nsurlSession];
  id v6 = [v5 uploadTaskWithRequest:v4 fromFile:*(void *)(a1 + 40)];

  return v6;
}

- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4
{
  id v6 = a4;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __48__ACSURLSession_uploadTaskWithRequest_fromData___block_invoke;
  id v16 = &unk_1E6CC3768;
  id v17 = self;
  id v18 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1E01B57E0](&v13);
  uint64_t v10 = [ACSURLSessionUploadTask alloc];
  id v11 = -[ACSURLSessionUploadTask initWithNSURLUploadTaskCreator:initialRequest:forSession:](v10, "initWithNSURLUploadTaskCreator:initialRequest:forSession:", v9, v8, self, v13, v14, v15, v16, v17);

  [(ACSURLSession *)self _addTask:v11];

  return v11;
}

id __48__ACSURLSession_uploadTaskWithRequest_fromData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _nsurlSession];
  id v6 = [v5 uploadTaskWithRequest:v4 fromData:*(void *)(a1 + 40)];

  return v6;
}

- (id)uploadTaskWithStreamedRequest:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__ACSURLSession_uploadTaskWithStreamedRequest___block_invoke;
  v8[3] = &unk_1E6CC3790;
  v8[4] = self;
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E01B57E0](v8);
  id v6 = [[ACSURLSessionUploadTask alloc] initWithNSURLUploadTaskCreator:v5 initialRequest:v4 forSession:self];

  [(ACSURLSession *)self _addTask:v6];

  return v6;
}

id __47__ACSURLSession_uploadTaskWithStreamedRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _nsurlSession];
  id v5 = [v4 uploadTaskWithStreamedRequest:v3];

  return v5;
}

- (id)downloadTaskWithRequest:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__ACSURLSession_downloadTaskWithRequest___block_invoke;
  v8[3] = &unk_1E6CC37B8;
  v8[4] = self;
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E01B57E0](v8);
  id v6 = [[ACSURLSessionDownloadTask alloc] initWithNSURLDownloadTaskCreator:v5 initialRequest:v4 forSession:self];

  [(ACSURLSession *)self _addTask:v6];

  return v6;
}

id __41__ACSURLSession_downloadTaskWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _nsurlSession];
  id v5 = [v4 downloadTaskWithRequest:v3];

  return v5;
}

- (id)downloadTaskWithURL:(id)a3
{
  id v4 = [MEMORY[0x1E4F290D0] requestWithURL:a3];
  id v5 = [(ACSURLSession *)self downloadTaskWithRequest:v4];

  return v5;
}

- (id)downloadTaskWithResumeData:(id)a3
{
  return [(ACSURLSession *)self _downloadTaskWithResumeData:a3 completionHandler:0];
}

- (ACSURLSession)initWithConfiguration:(id)a3 canUseCachingServer:(BOOL)a4 locateOptions:(id)a5 delegate:(id)a6 delegateQueue:(id)a7
{
  BOOL v10 = a4;
  v38[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  CFDictionaryRef v13 = (const __CFDictionary *)a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [v12 identifier];

  if (v16)
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3C8];
    v37 = @"session";
    v38[0] = self;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    v32 = @"ACSURLSession does not support background sessions";
    goto LABEL_13;
  }
  if (v15 && [v15 maxConcurrentOperationCount] != 1)
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3C8];
    v35 = @"session";
    v36 = self;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v32 = @"Cannot create an ACSURLSession with a concurrent delegate queue; set its maxConcurrentOperationCount to 1 or use the main queue";
LABEL_13:
    id v33 = [v29 exceptionWithName:v30 reason:v32 userInfo:v31];

    objc_exception_throw(v33);
  }
  if (v10) {
    ACSLocateCachingServer((const void *)[MEMORY[0x1E4F1CB10] URLWithString:@"http://www.apple.com/"], v13, 0, 0, 30.0);
  }
  v34.receiver = self;
  v34.super_class = (Class)ACSURLSession;
  id v17 = [(ACSURLSession *)&v34 init];
  id v18 = v17;
  if (v17)
  {
    [(ACSURLSession *)v17 setCanUseCachingServer:v10];
    os_log_t v19 = os_log_create("com.apple.AssetCacheServices", "URLSession");
    [(ACSURLSession *)v18 set_logHandle:v19];

    id v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("ACSURLSession queue", v20);
    [(ACSURLSession *)v18 set_queue:v21];

    id v22 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v12 delegate:v18 delegateQueue:v15];
    [(ACSURLSession *)v18 set_nsurlSession:v22];

    id v23 = (void *)[(__CFDictionary *)v13 copy];
    [(ACSURLSession *)v18 set_locateOptions:v23];

    [(ACSURLSession *)v18 set_clientDelegate:v14];
    long long v24 = [(ACSURLSession *)v18 _nsurlSession];
    long long v25 = [v24 delegateQueue];
    [(ACSURLSession *)v18 set_clientDelegateOpQueue:v25];

    long long v26 = [MEMORY[0x1E4F1CA60] dictionary];
    [(ACSURLSession *)v18 set_tasks:v26];
  }
  long long v27 = [(ACSURLSession *)v18 _logHandle];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    -[ACSURLSession initWithConfiguration:canUseCachingServer:locateOptions:delegate:delegateQueue:]();
  }

  return v18;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DD432000, v0, v1, "dealloc session %@", v2, v3, v4, v5, v6);
}

- (NSString)description
{
  uint64_t v3 = [(ACSURLSession *)self _tasks];
  objc_sync_enter(v3);
  uint64_t v4 = [(ACSURLSession *)self _tasks];
  uint64_t v5 = [v4 allValues];

  objc_sync_exit(v3);
  uint64_t v6 = [(ACSURLSession *)self _phase];
  if (v6 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown phase %d", v6);
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = off_1E6CC3E78[(int)v6];
  }
  id v8 = (void *)MEMORY[0x1E4F28E78];
  v18.receiver = self;
  v18.super_class = (Class)ACSURLSession;
  uint64_t v9 = [(ACSURLSession *)&v18 description];
  BOOL v10 = [(ACSURLSession *)self canUseCachingServer];
  id v11 = [(ACSURLSession *)self _nsurlSession];
  id v12 = [(ACSURLSession *)self _clientDelegate];
  CFDictionaryRef v13 = objc_msgSend(v8, "stringWithFormat:", @"%@ { canUseCachingServer: %d, phase: %@, session: %@, delegate: %p, tasks: ("), v9, v10, v7, v11, v12;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __28__ACSURLSession_description__block_invoke;
  v16[3] = &unk_1E6CC37E0;
  id v14 = v13;
  id v17 = v14;
  [v5 enumerateObjectsUsingBlock:v16];
  [v14 appendString:@" }"]);

  return (NSString *)v14;
}

void __28__ACSURLSession_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%p", v5);
}

- (id)_keyForNSURLTask:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [v4 taskIdentifier];

  id v8 = [v3 stringWithFormat:@"%@ %lu", v6, v7];

  return v8;
}

- (void)_addTask:(id)a3
{
  id v4 = a3;
  id v5 = [(ACSURLSession *)self _queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__ACSURLSession__addTask___block_invoke;
  v7[3] = &unk_1E6CC3808;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __26__ACSURLSession__addTask___block_invoke(uint64_t a1)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _phase] == 1
    || [*(id *)(a1 + 32) _phase] == 2)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    v12[0] = @"session";
    v12[1] = @"task";
    uint64_t v8 = *(void *)(a1 + 40);
    v13[0] = *(void *)(a1 + 32);
    v13[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    id v10 = [v6 exceptionWithName:v7 reason:@"Cannot create a task in an ACSURLSession that has been invalidated" userInfo:v9];

    objc_exception_throw(v10);
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [v3 _nsurlTaskToOrigin];
  objc_msgSend(v2, "_onqueue_addTask:forNSURLTask:", v3, v4);

  uint64_t v5 = [*(id *)(a1 + 40) _nsurlTaskToCachingServer];
  if (v5) {
    objc_msgSend(*(id *)(a1 + 32), "_onqueue_addTask:forNSURLTask:", *(void *)(a1 + 40), v5);
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_onqueue_addTask:(id)a3 forNSURLTask:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(ACSURLSession *)self _queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(ACSURLSession *)self _keyForNSURLTask:v8];
  id v11 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v8 descriptionWithAddress];
    *(_DWORD *)buf = 138412802;
    id v23 = v7;
    __int16 v24 = 2112;
    long long v25 = v17;
    __int16 v26 = 2112;
    long long v27 = self;
    _os_log_debug_impl(&dword_1DD432000, v11, OS_LOG_TYPE_DEBUG, "add task %@ for nsurlTask %@ self=%@", buf, 0x20u);
  }
  id v12 = [(ACSURLSession *)self _tasks];
  objc_sync_enter(v12);
  CFDictionaryRef v13 = [(ACSURLSession *)self _tasks];
  id v14 = [v13 objectForKeyedSubscript:v10];
  BOOL v15 = v14 == 0;

  if (!v15)
  {
    objc_super v18 = [MEMORY[0x1E4F28B00] currentHandler];
    os_log_t v19 = [(ACSURLSession *)self _tasks];
    id v20 = [v19 objectForKeyedSubscript:v10];
    dispatch_queue_t v21 = [v8 descriptionWithAddress];
    [v18 handleFailureInMethod:a2, self, @"ACSURLSession.m", 364, @"ACSURLSession %@ clobbering ACSURLSessionTask %@ with %@ for NSURLSessionTask %@", self, v20, v7, v21 object file lineNumber description];
  }
  id v16 = [(ACSURLSession *)self _tasks];
  [v16 setObject:v7 forKeyedSubscript:v10];

  objc_sync_exit(v12);
}

- (void)_removeTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACSURLSession *)self _queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__ACSURLSession__removeTask___block_invoke;
  v7[3] = &unk_1E6CC3808;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __29__ACSURLSession__removeTask___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlTaskToOrigin];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) _nsurlTaskToOrigin];
    objc_msgSend(v3, "_onqueue_removeTaskForNSURLTask:", v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "set_nsurlTaskToOrigin:", 0);
  id v8 = [*(id *)(a1 + 32) _nsurlTaskToCachingServer];
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "_onqueue_removeTaskForNSURLTask:", v8);
    objc_msgSend(*(id *)(a1 + 32), "set_nsurlTaskToCachingServer:", 0);
  }
  if ([*(id *)(a1 + 40) _phase] == 1)
  {
    uint64_t v5 = [*(id *)(a1 + 40) _tasks];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      id v7 = [*(id *)(a1 + 40) _nsurlSession];
      [v7 finishTasksAndInvalidate];

      objc_msgSend(*(id *)(a1 + 40), "set_phase:", 2);
    }
  }
}

- (void)_onqueue_removeTaskForNSURLTask:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ACSURLSession *)self _queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(ACSURLSession *)self _keyForNSURLTask:v4];
  id v7 = [(ACSURLSession *)self _tasks];
  objc_sync_enter(v7);
  id v8 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [(ACSURLSession *)self _tasks];
    BOOL v15 = [v14 objectForKeyedSubscript:v6];
    id v16 = [v4 descriptionWithAddress];
    int v17 = 138413058;
    objc_super v18 = v15;
    __int16 v19 = 2112;
    id v20 = v16;
    __int16 v21 = 2112;
    id v22 = self;
    __int16 v23 = 2112;
    __int16 v24 = v6;
    _os_log_debug_impl(&dword_1DD432000, v8, OS_LOG_TYPE_DEBUG, "remove task %@ for nsurlTask %@ self=%@ key=%@", (uint8_t *)&v17, 0x2Au);
  }
  uint64_t v9 = [(ACSURLSession *)self _tasks];
  id v10 = [v9 objectForKeyedSubscript:v6];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    id v12 = [(ACSURLSession *)self _logHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFDictionaryRef v13 = [v4 descriptionWithAddress];
      int v17 = 138412802;
      objc_super v18 = self;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_impl(&dword_1DD432000, v12, OS_LOG_TYPE_DEFAULT, "ACSURLSession %@ missing ACSURLSessionTask for NSURLSessionTask %@; this is normal if the task was canceled. task %@",
        (uint8_t *)&v17,
        0x20u);
    }
  }
  else
  {
    id v12 = [(ACSURLSession *)self _tasks];
    [v12 removeObjectForKey:v6];
  }

  objc_sync_exit(v7);
}

- (id)_onqueue_taskForNSURLTask:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(ACSURLSession *)self _queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(ACSURLSession *)self _keyForNSURLTask:v5];
  id v8 = [(ACSURLSession *)self _tasks];
  objc_sync_enter(v8);
  uint64_t v9 = [(ACSURLSession *)self _tasks];
  id v10 = [v9 objectForKeyedSubscript:v7];

  objc_sync_exit(v8);
  if (v10)
  {
    id v11 = [v10 _nsurlTaskToOrigin];
    uint64_t v12 = [v10 _nsurlTaskToCachingServer];
    CFDictionaryRef v13 = (void *)v12;
    if (v11 != v5 && (id)v12 != v5)
    {
      int v17 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v18 = [v11 descriptionWithAddress];
      __int16 v19 = [v13 descriptionWithAddress];
      [v17 handleFailureInMethod:a2, self, @"ACSURLSession.m", 429, @"ACSURLSession %@ task %@ != expected %@ or %@", self, v5, v18, v19 object file lineNumber description];
    }
    id v14 = v10;
  }
  else
  {
    BOOL v15 = [(ACSURLSession *)self _logHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v21 = self;
      __int16 v22 = 2112;
      __int16 v23 = v7;
      _os_log_impl(&dword_1DD432000, v15, OS_LOG_TYPE_DEFAULT, "ACSURLSession %@ missing ACSURLSessionTask for NSURLSessionTask %@; this is normal if the task was canceled",
        buf,
        0x16u);
    }
  }

  return v10;
}

- (id)_onqueue_uniqueTasks
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ACSURLSession *)self _queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ACSURLSession *)self _tasks];
  objc_sync_enter(v4);
  id v5 = [(ACSURLSession *)self _tasks];
  uint64_t v6 = [v5 allValues];

  objc_sync_exit(v4);
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v13, (void)v15) & 1) == 0)
        {
          [v7 addObject:v13];
          [v8 addObject:v13];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)_locateCachingServerForURL:(id)a3 isUpload:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  id v10 = a3;
  if (![(ACSURLSession *)self canUseCachingServer])
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v19 = NSStringFromSelector(a2);
    [v18 handleFailureInMethod:a2, self, @"ACSURLSession.m", 457, @"ACSURLSession %@ invalid use of %@", self, v19 object file lineNumber description];
  }
  uint64_t v11 = [(ACSURLSession *)self _locateOptions];
  uint64_t v12 = v11;
  if (v5)
  {
    uint64_t v13 = [v11 mutableCopy];

    uint64_t v12 = (void *)v13;
    if (!v13)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v14 = [v12 objectForKeyedSubscript:@"capabilities"];
    long long v15 = (void *)[v14 mutableCopy];

    if (!v15)
    {
      long long v15 = [MEMORY[0x1E4F1CA60] dictionary];
      [v12 setObject:v15 forKeyedSubscript:@"capabilities"];
    }
    [v15 setObject:*MEMORY[0x1E4F1CFD0] forKeyedSubscript:@"import"];
  }
  long long v16 = [(ACSURLSession *)self _queue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__ACSURLSession__locateCachingServerForURL_isUpload_completionHandler___block_invoke;
  v20[3] = &unk_1E6CC3830;
  id v21 = v9;
  id v17 = v9;
  ACSLocateCachingServer(v10, (const __CFDictionary *)v12, v16, (uint64_t)v20, 30.0);
}

uint64_t __71__ACSURLSession__locateCachingServerForURL_isUpload_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_onqueue_task:(id)a3 willUseCachingServer:(BOOL)a4 newRequest:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(ACSURLSession *)self _queue];
  dispatch_assert_queue_V2(v13);

  id v14 = [(ACSURLSession *)self _clientDelegate];
  long long v15 = [(ACSURLSession *)self _clientDelegateOpQueue];
  if (objc_opt_respondsToSelector())
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__ACSURLSession__onqueue_task_willUseCachingServer_newRequest_completionHandler___block_invoke;
    v16[3] = &unk_1E6CC3880;
    id v17 = v14;
    long long v18 = self;
    id v19 = v10;
    BOOL v22 = a4;
    id v20 = v11;
    id v21 = v12;
    [v15 addOperationWithBlock:v16];
  }
  else
  {
    (*((void (**)(id, id))v12 + 2))(v12, v11);
  }
}

void __81__ACSURLSession__onqueue_task_willUseCachingServer_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__ACSURLSession__onqueue_task_willUseCachingServer_newRequest_completionHandler___block_invoke_2;
  v6[3] = &unk_1E6CC3858;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 64);
  [v1 URLSession:v2 task:v4 willUseCachingServer:v3 newRequest:v5 completionHandler:v6];
}

void __81__ACSURLSession__onqueue_task_willUseCachingServer_newRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__ACSURLSession__onqueue_task_willUseCachingServer_newRequest_completionHandler___block_invoke_3;
  v7[3] = &unk_1E6CC3718;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __81__ACSURLSession__onqueue_task_willUseCachingServer_newRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_cancelTask:(id)a3
{
  id v4 = a3;
  if ([(ACSURLSession *)self canUseCachingServer])
  {
    id v5 = [(ACSURLSession *)self _logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ACSURLSession _cancelTask:]();
    }

    id v6 = [(ACSURLSession *)self _queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __29__ACSURLSession__cancelTask___block_invoke;
    v8[3] = &unk_1E6CC3808;
    id v9 = v4;
    id v10 = self;
    dispatch_async(v6, v8);
  }
  else
  {
    id v7 = [v4 _nsurlTaskToOrigin];
    [v7 cancel];
  }
}

void __29__ACSURLSession__cancelTask___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) _internalState] == 2)
  {
    id v3 = [*(id *)(a1 + 40) _logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __29__ACSURLSession__cancelTask___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  else
  {
    id v11 = [*v2 _nsurlTaskToCachingServer];
    if (v11 && [*v2 _tryCachingServer])
    {
      objc_msgSend(*v2, "set_failBackToOrigin:", 0);
      [v11 cancel];
    }
    else
    {
      id v10 = [*v2 _nsurlTaskToOrigin];
      [v10 cancel];
    }
  }
}

- (void)_cancelDownloadTask:(id)a3 byProducingResumeData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__ACSURLSession__cancelDownloadTask_byProducingResumeData___block_invoke;
  v24[3] = &unk_1E6CC38A8;
  v24[4] = self;
  id v9 = v7;
  id v25 = v9;
  id v10 = v8;
  id v26 = v10;
  id v11 = (void *)MEMORY[0x1E01B57E0](v24);
  if ([(ACSURLSession *)self canUseCachingServer])
  {
    id v12 = [(ACSURLSession *)self _logHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ACSURLSession _cancelDownloadTask:byProducingResumeData:]();
    }

    if ([v9 _internalState] == 2)
    {
      uint64_t v13 = [(ACSURLSession *)self _logHandle];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[ACSURLSession _cancelDownloadTask:byProducingResumeData:]();
      }

      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
    id v14 = [(ACSURLSession *)self _queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__ACSURLSession__cancelDownloadTask_byProducingResumeData___block_invoke_122;
    block[3] = &unk_1E6CC38D0;
    SEL v23 = a2;
    id v19 = v9;
    id v20 = self;
    id v21 = v11;
    id v22 = v10;
    dispatch_async(v14, block);

    long long v15 = v19;
  }
  else
  {
    long long v15 = [v9 _nsurlTaskToOrigin];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
      id v17 = [v15 descriptionWithAddress];
      [v16 handleFailureInMethod:a2, self, @"ACSURLSession.m", 540, @"ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@", self, v9, v17, @"NSURLSessionDownloadTask" object file lineNumber description];
    }
    [v15 cancelByProducingResumeData:v11];
  }
}

void __59__ACSURLSession__cancelDownloadTask_byProducingResumeData___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) originalRequest];
    uint64_t v6 = [*(id *)(a1 + 40) currentRequest];
    id v12 = 0;
    id v7 = [v4 _resumeDataWithNSURLResumeData:v3 originalRequest:v5 currentRequest:v6 error:&v12];
    id v8 = v12;

    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = @"Invalid resume data from NSURL";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v8 = [v9 errorWithDomain:@"_kACSURLSessionErrorDomain" code:1 userInfo:v10];
  }
  id v11 = [*(id *)(a1 + 32) _logHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    __59__ACSURLSession__cancelDownloadTask_byProducingResumeData___block_invoke_cold_1();
  }

  id v7 = 0;
LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __59__ACSURLSession__cancelDownloadTask_byProducingResumeData___block_invoke_122(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlTaskToCachingServer];
  if (v2 && [*(id *)(a1 + 32) _tryCachingServer])
  {
    objc_msgSend(*(id *)(a1 + 32), "set_failBackToOrigin:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v10 = *(void *)(a1 + 64);
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v13 = [v2 descriptionWithAddress];
      [v9 handleFailureInMethod:v10, v11, @"ACSURLSession.m", 557, @"ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@", v11, v12, v13, @"NSURLSessionDownloadTask" object file lineNumber description];
    }
    [v2 cancelByProducingResumeData:*(void *)(a1 + 48)];
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) _nsurlTaskToOrigin];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 cancelByProducingResumeData:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 40) _logHandle];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        id v8 = [v3 descriptionWithAddress];
        *(_DWORD *)buf = 138413058;
        uint64_t v15 = v6;
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        __int16 v18 = 2112;
        id v19 = v8;
        __int16 v20 = 2112;
        id v21 = @"NSURLSessionDownloadTask";
        _os_log_fault_impl(&dword_1DD432000, v4, OS_LOG_TYPE_FAULT, "ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@", buf, 0x2Au);
      }
      uint64_t v5 = [*(id *)(a1 + 40) _logHandle];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD432000, v5, OS_LOG_TYPE_DEFAULT, "ACSURLSessionDownloadTask _cancelDownloadTask:byProducingResumeData: completing with nil", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

- (id)_downloadTaskWithResumeData:(id)a3 completionHandler:(id)a4
{
  v54[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (id *)a3;
  id v7 = a4;
  id v51 = 0;
  id v52 = 0;
  id v49 = 0;
  id v50 = 0;
  id v33 = v6;
  BOOL v8 = [(ACSURLSession *)self _resumeData:v6 toNSURLResumeData:&v52 originalRequest:&v51 currentRequest:&v50 error:&v49];
  id v9 = v52;
  id v35 = v51;
  id v10 = v50;
  id v34 = v49;
  if (!v8)
  {
    id v26 = (void *)MEMORY[0x1E4F1CA00];
    v53[0] = @"session";
    v53[1] = @"error";
    v54[0] = self;
    v54[1] = v34;
    long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
    id v28 = [v26 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid resume data" userInfo:v27];

    objc_exception_throw(v28);
  }
  uint64_t v11 = [v10 URL];
  uint64_t v12 = [v11 query];

  if ([v12 hasPrefix:@"source="]) {
    int v13 = 1;
  }
  else {
    int v13 = [v12 containsString:@"&source="];
  }
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  id v48 = 0;
  if (v7)
  {
    id v14 = v36;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke_2;
    v36[3] = &unk_1E6CC3970;
    v39[1] = &v43;
    v36[4] = self;
    uint64_t v30 = (id *)v39;
    v39[0] = v7;
    v31 = &v37;
    id v37 = v10;
    uint64_t v6 = (id *)&v38;
  }
  else
  {
    id v14 = v40;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke;
    v40[3] = &unk_1E6CC38F8;
    uint64_t v29 = (id *)v41;
    v41[0] = v10;
    v41[1] = self;
    v32 = (id *)&v42;
  }
  id v15 = v9;
  v14[6] = v15;
  __int16 v16 = (void *)MEMORY[0x1E01B57E0](v14);
  if (v13)
  {
    uint64_t v17 = [[ACSURLSessionDownloadTask alloc] initWithNSURLDownloadTaskCreator:v16 initialRequest:v35 forSession:self];
    __int16 v18 = (void *)v44[5];
    v44[5] = (uint64_t)v17;

    id v19 = [(id)v44[5] _nsurlTaskForRequest:v10];
    objc_msgSend((id)v44[5], "set_nsurlTaskToCachingServer:", v19);
    __int16 v20 = [(id)v44[5] _nsurlTaskToOrigin];
    id v21 = [(id)v44[5] _nsurlTaskToCachingServer];
    [(ACSURLSession *)self _copyAttributesFromNSURLTask:v20 toNSURLTask:v21];
  }
  else
  {
    uint64_t v22 = [[ACSURLSessionDownloadTask alloc] initWithNSURLDownloadTaskCreator:v16 initialRequest:v10 forSession:self];
    SEL v23 = (void *)v44[5];
    v44[5] = (uint64_t)v22;

    objc_msgSend((id)v44[5], "set_resumedOriginalRequest:", v35);
    objc_msgSend((id)v44[5], "set_tryCachingServer:", 0);
  }
  objc_msgSend((id)v44[5], "set_suspended:", 1);
  [(ACSURLSession *)self _addTask:v44[5]];
  id v24 = (id)v44[5];

  if (v7)
  {
  }
  else
  {
  }
  _Block_object_dispose(&v43, 8);

  return v24;
}

id __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) _nsurlSession];
  uint64_t v6 = v5;
  if (v4 == v3) {
    [v5 downloadTaskWithResumeData:*(void *)(a1 + 48)];
  }
  else {
  id v7 = [v5 downloadTaskWithRequest:v3];
  }

  return v7;
}

id __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke_3;
  v12[3] = &unk_1E6CC3948;
  v12[4] = *(void *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v11;
  long long v13 = v11;
  uint64_t v5 = (void *)MEMORY[0x1E01B57E0](v12);
  id v6 = *(id *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) _nsurlSession];
  BOOL v8 = v7;
  if (v6 == v3) {
    [v7 downloadTaskWithResumeData:*(void *)(a1 + 48) completionHandler:v5];
  }
  else {
  id v9 = [v7 downloadTaskWithRequest:v3 completionHandler:v5];
  }

  return v9;
}

void __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke_4;
    v12[3] = &unk_1E6CC3920;
    id v9 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v13 = v10;
    uint64_t v14 = v11;
    [v9 _downloadTask:v4 completedWithLocation:a2 response:a3 error:a4 completionHandler:v12];
  }
}

uint64_t __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "set_nsurlTaskCreator:", 0);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return objc_msgSend(v4, "set_internalState:", 2);
}

- (void)_suspendTask:(id)a3
{
  id v4 = a3;
  if ([(ACSURLSession *)self canUseCachingServer])
  {
    uint64_t v5 = [(ACSURLSession *)self _logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ACSURLSession _suspendTask:]();
    }

    id v6 = [(ACSURLSession *)self _queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__ACSURLSession__suspendTask___block_invoke;
    v8[3] = &unk_1E6CC3808;
    id v9 = v4;
    id v10 = self;
    dispatch_async(v6, v8);
  }
  else
  {
    id v7 = [v4 _nsurlTaskToOrigin];
    [v7 suspend];
  }
}

void __30__ACSURLSession__suspendTask___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) _internalState] == 2)
  {
    id v3 = [*(id *)(a1 + 40) _logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __30__ACSURLSession__suspendTask___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  else
  {
    id v11 = [*v2 _nsurlTaskToCachingServer];
    if (v11 && [*v2 _tryCachingServer])
    {
      [v11 suspend];
    }
    else
    {
      id v10 = [*v2 _nsurlTaskToOrigin];
      [v10 suspend];
    }
    objc_msgSend(*v2, "set_suspended:", 1);
  }
}

- (void)_resumeTask:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ACSURLSession *)self canUseCachingServer];
  uint64_t v6 = [(ACSURLSession *)self _logHandle];
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ACSURLSession _resumeTask:]();
    }

    if ([v4 _internalState] != 2)
    {
      uint64_t v12 = [(ACSURLSession *)self _queue];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __29__ACSURLSession__resumeTask___block_invoke;
      void v13[3] = &unk_1E6CC3808;
      v13[4] = self;
      id v14 = v4;
      dispatch_async(v12, v13);

      goto LABEL_12;
    }
    uint64_t v8 = [(ACSURLSession *)self _logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ACSURLSession _resumeTask:]();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v4 originalRequest];
      id v10 = [v9 URL];
      id v11 = [v10 absoluteString];
      *(_DWORD *)buf = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      __int16 v18 = v11;
      _os_log_impl(&dword_1DD432000, v7, OS_LOG_TYPE_DEFAULT, "ACSURLSessionTask %@ for %@ can not use caching server", buf, 0x16u);
    }
    uint64_t v8 = [v4 _nsurlTaskToOrigin];
    [v8 resume];
  }

LABEL_12:
}

uint64_t __29__ACSURLSession__resumeTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_resumeTask:", *(void *)(a1 + 40));
}

- (void)_onqueue_resumeTask:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ACSURLSession *)self _queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 originalRequest];
  uint64_t v7 = [v6 URL];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __37__ACSURLSession__onqueue_resumeTask___block_invoke;
  v19[3] = &unk_1E6CC39C0;
  void v19[4] = self;
  id v8 = v4;
  id v20 = v8;
  id v9 = v6;
  id v21 = v9;
  id v10 = (void (**)(void))MEMORY[0x1E01B57E0](v19);
  if ([v8 _suspended])
  {
    objc_msgSend(v8, "set_suspended:", 0);
    objc_msgSend(v8, "set_internalState:", 1);
    id v11 = [v8 _nsurlTaskToCachingServer];
    if (v11 && [v8 _tryCachingServer])
    {
      [v11 resume];
    }
    else
    {
      id v13 = [v8 _nsurlTaskToOrigin];
      [v13 resume];
    }
  }
  else if (v7 && ([v8 _tryCachingServer] & 1) != 0)
  {
    uint64_t v12 = [v8 _isUpload];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __37__ACSURLSession__onqueue_resumeTask___block_invoke_3;
    v14[3] = &unk_1E6CC39E8;
    id v15 = v9;
    id v16 = self;
    id v17 = v8;
    __int16 v18 = v10;
    [(ACSURLSession *)self _locateCachingServerForURL:v7 isUpload:v12 completionHandler:v14];
  }
  else
  {
    v10[2](v10);
  }
}

void __37__ACSURLSession__onqueue_resumeTask___block_invoke(void *a1)
{
  id v3 = (void *)a1[4];
  uint64_t v2 = (void *)a1[5];
  uint64_t v4 = a1[6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ACSURLSession__onqueue_resumeTask___block_invoke_2;
  v5[3] = &unk_1E6CC3998;
  v5[4] = v3;
  id v6 = v2;
  id v7 = (id)a1[6];
  objc_msgSend(v3, "_onqueue_task:willUseCachingServer:newRequest:completionHandler:", v6, 0, v4, v5);
}

void __37__ACSURLSession__onqueue_resumeTask___block_invoke_2(id *a1, void *a2)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v3 = [a1[4] _queue];
  dispatch_assert_queue_V2(v3);

  if (v10 && [a1[4] _phase] != 2)
  {
    if (a1[6] != v10)
    {
      BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C3C8];
      v11[0] = @"session";
      v11[1] = @"request";
      id v7 = a1[5];
      v12[0] = a1[4];
      v12[1] = v10;
      v11[2] = @"task";
      void v12[2] = v7;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
      id v9 = [v5 exceptionWithName:v6 reason:@"Cannot modify request when not using caching server" userInfo:v8];

      objc_exception_throw(v9);
    }
    uint64_t v4 = [a1[5] _nsurlTaskToOrigin];
    [v4 resume];
  }
  else
  {
    [a1[5] cancel];
  }
}

void __37__ACSURLSession__onqueue_resumeTask___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)[*(id *)(a1 + 32) mutableCopy];
    [v7 setURL:v5];
    [v7 setAllowsCellularAccess:0];
    id v8 = [v6 objectForKeyedSubscript:@"connectTimeout"];
    id v9 = v8;
    if (v8)
    {
      [v8 doubleValue];
      if (v10 < 30.0) {
        [v7 _setRequiresShortConnectionTimeout:1];
      }
    }
    uint64_t v12 = *(void **)(a1 + 40);
    id v11 = *(void **)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__ACSURLSession__onqueue_resumeTask___block_invoke_4;
    void v13[3] = &unk_1E6CC3998;
    v13[4] = v12;
    id v14 = v11;
    id v15 = *(id *)(a1 + 32);
    objc_msgSend(v12, "_onqueue_task:willUseCachingServer:newRequest:completionHandler:", v14, 1, v7, v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "set_tryCachingServer:", 0);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __37__ACSURLSession__onqueue_resumeTask___block_invoke_4(id *a1, void *a2)
{
  id v10 = a2;
  id v3 = [a1[4] _queue];
  dispatch_assert_queue_V2(v3);

  if (v10 && [a1[4] _phase] != 2)
  {
    id v4 = a1[5];
    if (a1[6] == v10)
    {
      objc_msgSend(v4, "set_tryCachingServer:", 0);
      id v9 = [a1[5] _nsurlTaskToOrigin];
      [v9 resume];
    }
    else
    {
      id v5 = [v4 _nsurlTaskForRequest:v10];
      objc_msgSend(a1[5], "set_nsurlTaskToCachingServer:", v5);
      id v6 = a1[4];
      id v7 = [a1[5] _nsurlTaskToOrigin];
      id v8 = [a1[5] _nsurlTaskToCachingServer];
      [v6 _copyAttributesFromNSURLTask:v7 toNSURLTask:v8];

      objc_msgSend(a1[4], "_onqueue_addTask:forNSURLTask:", a1[5], v5);
      [v5 resume];
    }
  }
  else
  {
    [a1[5] cancel];
  }
}

- (void)_dataTask:(id)a3 completedWithData:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    id v32 = v12;
    __int16 v33 = 2048;
    uint64_t v34 = [v13 length];
    __int16 v35 = 2112;
    id v36 = v14;
    __int16 v37 = 2112;
    id v38 = v15;
    __int16 v39 = 2112;
    v40 = self;
    _os_log_debug_impl(&dword_1DD432000, v17, OS_LOG_TYPE_DEBUG, "_dataTask:%@ completedWithData:[%ld bytes] response:%@ error:%@ self=%@", buf, 0x34u);
  }

  __int16 v18 = [(ACSURLSession *)self _queue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __78__ACSURLSession__dataTask_completedWithData_response_error_completionHandler___block_invoke;
  v24[3] = &unk_1E6CC3A38;
  id v25 = v12;
  id v26 = v15;
  id v27 = v14;
  id v28 = self;
  id v29 = v13;
  id v30 = v16;
  id v19 = v13;
  id v20 = v16;
  id v21 = v14;
  id v22 = v15;
  id v23 = v12;
  dispatch_async(v18, v24);
}

void __78__ACSURLSession__dataTask_completedWithData_response_error_completionHandler___block_invoke(uint64_t a1)
{
  *(void *)&v35[13] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlTaskToCachingServer];
  if (!v2 || ![*(id *)(a1 + 32) _tryCachingServer])
  {
    char v10 = 0;
LABEL_28:
    id v15 = *(void **)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = [*(id *)(a1 + 32) originalRequest];
    __int16 v18 = [*(id *)(a1 + 32) currentRequest];
    id v19 = [v15 _errorWithResumeDataFromError:v16 originalRequest:v17 currentRequest:v18];

    id v20 = [*(id *)(a1 + 56) _clientDelegateOpQueue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __78__ACSURLSession__dataTask_completedWithData_response_error_completionHandler___block_invoke_144;
    v23[3] = &unk_1E6CC3A10;
    id v29 = *(id *)(a1 + 72);
    id v24 = *(id *)(a1 + 64);
    id v25 = *(id *)(a1 + 48);
    id v26 = v19;
    char v30 = v10;
    id v21 = *(id *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 56);
    id v27 = v21;
    uint64_t v28 = v22;
    id v4 = v19;
    [v20 addOperationWithBlock:v23];

    goto LABEL_29;
  }
  if (![*(id *)(a1 + 32) _failBackToOrigin])
  {
LABEL_27:
    char v10 = 1;
    goto LABEL_28;
  }
  id v3 = [v2 currentRequest];
  id v4 = [v3 URL];

  if (*(void *)(a1 + 40)) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [*(id *)(a1 + 48) statusCode] < 400)
  {
    CFTypeRef cf = 0;
    if (!ACSUpdateCachingServerHealth((const __CFURL *)v4, 0, 1, (CFErrorRef *)&cf))
    {
      id v13 = [*(id *)(a1 + 56) _logHandle];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v4 absoluteString];
        *(_DWORD *)buf = 138412802;
        uint64_t v33 = (uint64_t)v14;
        __int16 v34 = 1024;
        *(_DWORD *)__int16 v35 = 1;
        v35[2] = 2112;
        *(void *)&v35[3] = cf;
        _os_log_impl(&dword_1DD432000, v13, OS_LOG_TYPE_DEFAULT, "ACSUpdateCachingServerHealth(%@, %d) failed: %@", buf, 0x1Cu);
      }
    }
    if (cf) {
      CFRelease(cf);
    }

    goto LABEL_27;
  }
  if (!*(void *)(a1 + 40))
  {
    id v5 = [*(id *)(a1 + 56) _logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [*(id *)(a1 + 48) statusCode];
      id v12 = [v4 absoluteString];
      *(_DWORD *)buf = 134218242;
      uint64_t v33 = v11;
      __int16 v34 = 2112;
      *(void *)__int16 v35 = v12;
      _os_log_impl(&dword_1DD432000, v5, OS_LOG_TYPE_DEFAULT, "HTTP response %ld from %@, failing back to original", buf, 0x16u);
    }
    goto LABEL_7;
  }
LABEL_5:
  id v5 = [*(id *)(a1 + 56) _logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [v4 absoluteString];
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = v6;
    __int16 v34 = 2112;
    *(void *)__int16 v35 = v7;
    _os_log_impl(&dword_1DD432000, v5, OS_LOG_TYPE_DEFAULT, "Error %@ from %@, failing back to original", buf, 0x16u);
  }
LABEL_7:

  CFTypeRef cf = 0;
  if (!ACSUpdateCachingServerHealth((const __CFURL *)v4, 0, 0, (CFErrorRef *)&cf))
  {
    id v8 = [*(id *)(a1 + 56) _logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v4 absoluteString];
      *(_DWORD *)buf = 138412802;
      uint64_t v33 = (uint64_t)v9;
      __int16 v34 = 1024;
      *(_DWORD *)__int16 v35 = 0;
      v35[2] = 2112;
      *(void *)&v35[3] = cf;
      _os_log_impl(&dword_1DD432000, v8, OS_LOG_TYPE_DEFAULT, "ACSUpdateCachingServerHealth(%@, %d) failed: %@", buf, 0x1Cu);
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  objc_msgSend(*(id *)(a1 + 32), "set_nsurlTaskToCachingServer:", 0);
  objc_msgSend(*(id *)(a1 + 56), "_onqueue_removeTaskForNSURLTask:", v2);
  objc_msgSend(*(id *)(a1 + 32), "set_tryCachingServer:", 0);
  objc_msgSend(*(id *)(a1 + 56), "_onqueue_resumeTask:", *(void *)(a1 + 32));
LABEL_29:
}

uint64_t __78__ACSURLSession__dataTask_completedWithData_response_error_completionHandler___block_invoke_144(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v2 = [*(id *)(a1 + 56) _nsurlTaskToOrigin];
    [v2 cancel];
  }
  uint64_t v4 = *(void *)(a1 + 56);
  id v3 = *(void **)(a1 + 64);

  return [v3 _removeTask:v4];
}

- (void)_downloadTask:(id)a3 completedWithLocation:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    id v48 = v12;
    __int16 v49 = 2112;
    uint64_t v50 = (uint64_t)v13;
    __int16 v51 = 2112;
    id v52 = v14;
    __int16 v53 = 2112;
    id v54 = v15;
    __int16 v55 = 2112;
    v56 = self;
    _os_log_debug_impl(&dword_1DD432000, v17, OS_LOG_TYPE_DEBUG, "_downloadTask:%@ completedWithLocation:%@ response:%@ error:%@ self=%@", buf, 0x34u);
  }

  if (v13)
  {
    uint64_t v18 = [(ACSURLSession *)self _linkedLocationWithLocation:v13];
    if (!v18)
    {
      id v32 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v33 = *MEMORY[0x1E4F1C3A8];
      v45[0] = @"session";
      v45[1] = @"downloadTask";
      v46[0] = self;
      v46[1] = v12;
      v45[2] = @"location";
      v46[2] = v13;
      __int16 v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
      id v35 = [v32 exceptionWithName:v33 reason:@"ACSURLSession needs a non-reference file URL to a file" userInfo:v34];

      objc_exception_throw(v35);
    }
    id v19 = (void *)v18;
    id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v44 = 0;
    char v21 = [v20 linkItemAtURL:v13 toURL:v19 error:&v44];
    id v22 = v44;

    if ((v21 & 1) == 0)
    {
      id v23 = [(ACSURLSession *)self _logHandle];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v36 = [v13 path];
        uint64_t v30 = [v19 path];
        *(_DWORD *)buf = 138412802;
        id v48 = v36;
        __int16 v49 = 2112;
        uint64_t v50 = v30;
        v31 = (void *)v30;
        __int16 v51 = 2112;
        id v52 = v22;
        _os_log_error_impl(&dword_1DD432000, v23, OS_LOG_TYPE_ERROR, "ACSURLSession can not link %@ to %@: %@", buf, 0x20u);
      }
      if (!v15) {
        id v15 = v22;
      }
    }
  }
  else
  {
    id v19 = 0;
  }
  id v24 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__ACSURLSession__downloadTask_completedWithLocation_response_error_completionHandler___block_invoke;
  block[3] = &unk_1E6CC3A38;
  id v38 = v12;
  id v39 = v15;
  id v40 = v14;
  uint64_t v41 = self;
  id v42 = v19;
  id v43 = v16;
  id v25 = v19;
  id v26 = v16;
  id v27 = v14;
  id v28 = v15;
  id v29 = v12;
  dispatch_async(v24, block);
}

void __86__ACSURLSession__downloadTask_completedWithLocation_response_error_completionHandler___block_invoke(uint64_t a1)
{
  *(void *)&v36[13] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlTaskToCachingServer];
  if (!v2 || ![*(id *)(a1 + 32) _tryCachingServer])
  {
    char v11 = 0;
LABEL_29:
    id v16 = *(void **)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = [*(id *)(a1 + 32) originalRequest];
    id v19 = [*(id *)(a1 + 32) currentRequest];
    id v20 = [v16 _errorWithResumeDataFromError:v17 originalRequest:v18 currentRequest:v19];

    char v21 = [*(id *)(a1 + 56) _clientDelegateOpQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __86__ACSURLSession__downloadTask_completedWithLocation_response_error_completionHandler___block_invoke_155;
    v24[3] = &unk_1E6CC3A10;
    id v30 = *(id *)(a1 + 72);
    id v25 = *(id *)(a1 + 64);
    id v26 = *(id *)(a1 + 48);
    id v27 = v20;
    char v31 = v11;
    id v22 = *(id *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 56);
    id v28 = v22;
    uint64_t v29 = v23;
    id v10 = v20;
    [v21 addOperationWithBlock:v24];

    goto LABEL_30;
  }
  if (![*(id *)(a1 + 32) _failBackToOrigin])
  {
LABEL_28:
    char v11 = 1;
    goto LABEL_29;
  }
  id v3 = [v2 currentRequest];
  uint64_t v4 = [v3 URL];

  if (*(void *)(a1 + 40)) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [*(id *)(a1 + 48) statusCode] < 400)
  {
    CFTypeRef cf = 0;
    if (!ACSUpdateCachingServerHealth((const __CFURL *)v4, 0, 1, (CFErrorRef *)&cf))
    {
      id v14 = [*(id *)(a1 + 56) _logHandle];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v4 absoluteString];
        *(_DWORD *)buf = 138412802;
        uint64_t v34 = (uint64_t)v15;
        __int16 v35 = 1024;
        *(_DWORD *)id v36 = 1;
        v36[2] = 2112;
        *(void *)&v36[3] = cf;
        _os_log_impl(&dword_1DD432000, v14, OS_LOG_TYPE_DEFAULT, "ACSUpdateCachingServerHealth(%@, %d) failed: %@", buf, 0x1Cu);
      }
    }
    if (cf) {
      CFRelease(cf);
    }

    goto LABEL_28;
  }
  if (*(void *)(a1 + 40))
  {
LABEL_5:
    id v5 = [*(id *)(a1 + 56) _logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = [v4 absoluteString];
      *(_DWORD *)buf = 138412546;
      uint64_t v34 = v6;
      __int16 v35 = 2112;
      *(void *)id v36 = v7;
      _os_log_impl(&dword_1DD432000, v5, OS_LOG_TYPE_DEFAULT, "Error %@ from %@, failing back to original", buf, 0x16u);
    }
    goto LABEL_7;
  }
  id v5 = [*(id *)(a1 + 56) _logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [*(id *)(a1 + 48) statusCode];
    id v13 = [v4 absoluteString];
    *(_DWORD *)buf = 134218242;
    uint64_t v34 = v12;
    __int16 v35 = 2112;
    *(void *)id v36 = v13;
    _os_log_impl(&dword_1DD432000, v5, OS_LOG_TYPE_DEFAULT, "HTTP response %ld from %@, failing back to original", buf, 0x16u);
  }
LABEL_7:

  CFTypeRef cf = 0;
  if (!ACSUpdateCachingServerHealth((const __CFURL *)v4, 0, 0, (CFErrorRef *)&cf))
  {
    id v8 = [*(id *)(a1 + 56) _logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v4 absoluteString];
      *(_DWORD *)buf = 138412802;
      uint64_t v34 = (uint64_t)v9;
      __int16 v35 = 1024;
      *(_DWORD *)id v36 = 0;
      v36[2] = 2112;
      *(void *)&v36[3] = cf;
      _os_log_impl(&dword_1DD432000, v8, OS_LOG_TYPE_DEFAULT, "ACSUpdateCachingServerHealth(%@, %d) failed: %@", buf, 0x1Cu);
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  objc_msgSend(*(id *)(a1 + 32), "set_nsurlTaskToCachingServer:", 0);
  objc_msgSend(*(id *)(a1 + 56), "_onqueue_removeTaskForNSURLTask:", v2);
  objc_msgSend(*(id *)(a1 + 32), "set_tryCachingServer:", 0);
  objc_msgSend(*(id *)(a1 + 56), "_onqueue_resumeTask:", *(void *)(a1 + 32));

  if (*(void *)(a1 + 64))
  {
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v10 removeItemAtURL:*(void *)(a1 + 64) error:0];
LABEL_30:
  }
}

uint64_t __86__ACSURLSession__downloadTask_completedWithLocation_response_error_completionHandler___block_invoke_155(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];
  }
  if (*(unsigned char *)(a1 + 80))
  {
    id v3 = [*(id *)(a1 + 56) _nsurlTaskToOrigin];
    [v3 cancel];
  }
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v4 = *(void **)(a1 + 64);

  return [v4 _removeTask:v5];
}

- (id)_resumeDataWithNSURLResumeData:(id)a3 originalRequest:(id)a4 currentRequest:(id)a5 error:(id *)a6
{
  id v10 = a3;
  char v11 = (void *)MEMORY[0x1E4F1CA60];
  id v12 = a5;
  id v13 = a4;
  id v14 = [v11 dictionary];
  [v14 setObject:&unk_1F38A3FE8 forKeyedSubscript:@"_kACSURLSessionResumeDataVersionKey"];
  if (v10) {
    [v14 setObject:v10 forKeyedSubscript:@"_kACSURLSessionResumeDataNSURLResumeDataKey"];
  }
  id v15 = [(ACSURLSession *)self _locateOptions];

  if (v15)
  {
    id v16 = [(ACSURLSession *)self _locateOptions];
    [v14 setObject:v16 forKeyedSubscript:@"_kACSURLSessionResumeDataLocateOptionsKey"];
  }
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  uint64_t v18 = *MEMORY[0x1E4F284E8];
  [v17 encodeObject:v13 forKey:*MEMORY[0x1E4F284E8]];

  id v19 = [v17 encodedData];
  [v14 setObject:v19 forKeyedSubscript:@"_kACSURLSessionResumeDataOriginalRequestKey"];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v20 encodeObject:v12 forKey:v18];

  char v21 = [v20 encodedData];
  [v14 setObject:v21 forKeyedSubscript:@"_kACSURLSessionResumeDataCurrentRequestKey"];
  id v22 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v14 format:100 options:0 error:a6];

  return v22;
}

- (BOOL)_resumeData:(id)a3 toNSURLResumeData:(id *)a4 originalRequest:(id *)a5 currentRequest:(id *)a6 error:(id *)a7
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (!v12)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v64 = *MEMORY[0x1E4F28568];
    v65[0] = @"Invalid resume data";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:&v64 count:1];
    id v14 = [v18 errorWithDomain:@"_kACSURLSessionErrorDomain" code:1 userInfo:v13];
    goto LABEL_11;
  }
  id v59 = 0;
  id v13 = [MEMORY[0x1E4F28F98] propertyListWithData:v12 options:1 format:0 error:&v59];
  id v14 = v59;
  if (!v13)
  {
LABEL_11:
    id v19 = 0;
    id v20 = 0;
    char v21 = 0;
    goto LABEL_32;
  }
  uint64_t v50 = a7;
  id v15 = [v13 objectForKeyedSubscript:@"_kACSURLSessionResumeDataVersionKey"];
  uint64_t v16 = [v13 objectForKeyedSubscript:@"_kACSURLSessionResumeDataNSURLResumeDataKey"];
  v56 = [v13 objectForKeyedSubscript:@"_kACSURLSessionResumeDataLocateOptionsKey"];
  __int16 v55 = [v13 objectForKeyedSubscript:@"_kACSURLSessionResumeDataOriginalRequestKey"];
  id v54 = [v13 objectForKeyedSubscript:@"_kACSURLSessionResumeDataCurrentRequestKey"];
  __int16 v51 = v13;
  id v52 = (void *)v16;
  if (v15 && ([v15 isEqual:&unk_1F38A3FE8] & 1) != 0)
  {
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_29;
      }
    }
    uint64_t v17 = [(ACSURLSession *)self _locateOptions];
    if (v56)
    {
      if (![v56 isEqual:v17]) {
        goto LABEL_28;
      }
    }
    else if (v17)
    {
      goto LABEL_28;
    }
    if (v55)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v54)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (v56) {

        }
        if ((isKindOfClass & 1) == 0) {
          goto LABEL_29;
        }
        id v48 = v15;
        if (_resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classesOnce != -1) {
          dispatch_once(&_resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classesOnce, &__block_literal_global_167);
        }
        id v58 = 0;
        uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v55 error:&v58];
        id v34 = v58;
        uint64_t v35 = *MEMORY[0x1E4F284E8];
        id v36 = [v33 decodeObjectOfClasses:_resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classes forKey:*MEMORY[0x1E4F284E8]];
        v47 = v33;
        [v33 finishDecoding];
        __int16 v53 = v36;
        if (v36
          && ([v36 URL], __int16 v37 = objc_claimAutoreleasedReturnValue(), v37, v37))
        {
          id v57 = v34;
          id v38 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v54 error:&v57];
          id v49 = v57;

          id v19 = [v38 decodeObjectOfClasses:_resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classes forKey:v35];
          v46 = v38;
          [v38 finishDecoding];
          if (v19)
          {
            id v39 = [v19 URL];

            if (v39)
            {
              a7 = v50;
LABEL_53:
              uint64_t v31 = (uint64_t)v14;

              id v14 = v47;
              id v15 = v48;
              id v25 = v49;
              goto LABEL_31;
            }
          }
          uint64_t v45 = [MEMORY[0x1E4F1CA60] dictionary];
          [v45 setObject:@"Invalid resume data" forKeyedSubscript:*MEMORY[0x1E4F28568]];
          [v45 setObject:v13 forKeyedSubscript:@"resumeDict"];
          a7 = v50;
          if (v49) {
            [v45 setObject:v49 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
          }
          [v45 setObject:v53 forKeyedSubscript:@"originalRequest"];
          if (v19) {
            [v45 setObject:v19 forKeyedSubscript:@"currentRequest"];
          }
          uint64_t v44 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_kACSURLSessionErrorDomain" code:5 userInfo:v45];

          id v14 = v45;
        }
        else
        {
          id v43 = [MEMORY[0x1E4F1CA60] dictionary];
          [v43 setObject:@"Invalid resume data" forKeyedSubscript:*MEMORY[0x1E4F28568]];
          [v43 setObject:v13 forKeyedSubscript:@"resumeDict"];
          if (v34) {
            [v43 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
          }
          a7 = v50;
          if (v36) {
            [v43 setObject:v36 forKeyedSubscript:@"originalRequest"];
          }
          v46 = v43;
          uint64_t v44 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_kACSURLSessionErrorDomain" code:4 userInfo:v43];
          id v19 = 0;
          id v49 = v34;
        }

        id v14 = (id)v44;
        goto LABEL_53;
      }
      if (!v56)
      {
LABEL_29:
        id v40 = (void *)MEMORY[0x1E4F28C58];
        v60[0] = *MEMORY[0x1E4F28568];
        v60[1] = @"resumeDict";
        v61[0] = @"Invalid resume data";
        v61[1] = v13;
        id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
        uint64_t v31 = [v40 errorWithDomain:@"_kACSURLSessionErrorDomain" code:3 userInfo:v25];
        id v19 = 0;
        __int16 v53 = 0;
        goto LABEL_30;
      }
    }
LABEL_28:

    goto LABEL_29;
  }
  id v22 = (void *)MEMORY[0x1E4F28C58];
  v62[0] = *MEMORY[0x1E4F28568];
  uint64_t v23 = [NSString stringWithFormat:@"unknown resume data version %@", v15];
  id v24 = v13;
  id v25 = (void *)v23;
  v62[1] = @"resumeDict";
  v63[0] = v23;
  v63[1] = v24;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
  id v26 = v12;
  id v27 = a4;
  id v28 = a6;
  v30 = uint64_t v29 = a5;
  uint64_t v31 = [v22 errorWithDomain:@"_kACSURLSessionErrorDomain" code:2 userInfo:v30];

  id v19 = 0;
  __int16 v53 = 0;
  id v14 = (id)v30;
  a5 = v29;
  a6 = v28;
  a4 = v27;
  id v12 = v26;
LABEL_30:
  a7 = v50;
LABEL_31:

  id v14 = (id)v31;
  char v21 = v52;
  id v20 = v53;
  id v13 = v51;
LABEL_32:

  if (v14)
  {
    uint64_t v41 = v14;
    a6 = a7;
    if (a7) {
LABEL_34:
    }
      *a6 = v41;
  }
  else
  {
    if (a4) {
      *a4 = v21;
    }
    if (a5) {
      *a5 = v20;
    }
    uint64_t v41 = v19;
    if (a6) {
      goto LABEL_34;
    }
  }

  return v14 == 0;
}

void __84__ACSURLSession__resumeData_toNSURLResumeData_originalRequest_currentRequest_error___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  id v9 = (void *)_resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classes;
  _resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classes = v8;

  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v10 = (void *)getSZExtractorClass_softClass;
  uint64_t v17 = getSZExtractorClass_softClass;
  if (!getSZExtractorClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getSZExtractorClass_block_invoke;
    void v13[3] = &unk_1E6CC3E20;
    v13[4] = &v14;
    __getSZExtractorClass_block_invoke((uint64_t)v13);
    id v10 = (void *)v15[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v14, 8);
  id v12 = [v11 knownSZExtractorImplementations];
  if (v12) {
    [(id)_resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classes unionSet:v12];
  }
}

- (id)_errorWithResumeDataFromError:(id)a3 originalRequest:(id)a4 currentRequest:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = [v8 userInfo];
    id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F289F8]];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v21 = 0;
      id v13 = [(ACSURLSession *)self _resumeDataWithNSURLResumeData:v12 originalRequest:v9 currentRequest:v10 error:&v21];
      id v14 = v21;
      if (v13)
      {
        id v15 = (void *)[v11 mutableCopy];
        [v15 setObject:v13 forKeyedSubscript:@"NSURLSessionDownloadTaskResumeData"];
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = [v8 domain];
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, objc_msgSend(v8, "code"), v15);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v19 = [(ACSURLSession *)self _logHandle];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v14;
          _os_log_impl(&dword_1DD432000, v19, OS_LOG_TYPE_DEFAULT, "ACSURLSession failed to convert resume data: %@", buf, 0xCu);
        }

        id v18 = v8;
      }
    }
    else
    {
      id v18 = v8;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)_linkedLocationWithLocation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 path];
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [v5 rangeOfString:@"/" options:4];
  uint64_t v8 = v7;
  if (![v3 isFileURL])
  {
LABEL_6:
    id v9 = 0;
    goto LABEL_7;
  }
  id v9 = 0;
  if (([v3 isFileReferenceURL] & 1) == 0 && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6 + v8 < (unint64_t)[v5 length])
    {
      [v5 insertString:@"ACS~" atIndex:v6 + v8];
      id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (void)_copyAttributesFromNSURLTask:(id)a3 toNSURLTask:(id)a4
{
  id v9 = a4;
  id v5 = a3;
  objc_msgSend(v9, "setCountOfBytesClientExpectsToSend:", objc_msgSend(v5, "countOfBytesClientExpectsToSend"));
  objc_msgSend(v9, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(v5, "countOfBytesClientExpectsToReceive"));
  [v5 priority];
  int v7 = v6;

  LODWORD(v8) = v7;
  [v9 setPriority:v8];
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = self;
    _os_log_debug_impl(&dword_1DD432000, v9, OS_LOG_TYPE_DEBUG, "URLSession:%@ didBecomeInvalidWithError:%@ self=%@", buf, 0x20u);
  }

  id v10 = [(ACSURLSession *)self _queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__ACSURLSession_URLSession_didBecomeInvalidWithError___block_invoke;
  void v13[3] = &unk_1E6CC3A60;
  id v14 = v7;
  id v15 = self;
  id v16 = v8;
  SEL v17 = a2;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, v13);
}

void __54__ACSURLSession_URLSession_didBecomeInvalidWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _nsurlSession];

  if (v2 != v3)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 32);
    id v11 = *(void **)(a1 + 40);
    id v13 = [v11 _nsurlSession];
    [v9 handleFailureInMethod:v10, v11, @"ACSURLSession.m", 1062, @"ACSURLSession %@ session %@ != expected %@", v11, v12, v13 object file lineNumber description];
  }
  uint64_t v4 = [*(id *)(a1 + 40) _clientDelegate];
  id v5 = [*(id *)(a1 + 40) _clientDelegateOpQueue];
  if (objc_opt_respondsToSelector())
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __54__ACSURLSession_URLSession_didBecomeInvalidWithError___block_invoke_2;
    v14[3] = &unk_1E6CC39C0;
    id v6 = v4;
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    id v15 = v6;
    uint64_t v16 = v7;
    id v17 = v8;
    [v5 addOperationWithBlock:v14];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "set_clientDelegate:", 0);
    objc_msgSend(*(id *)(a1 + 40), "set_clientDelegateOpQueue:", 0);
    objc_msgSend(*(id *)(a1 + 40), "set_nsurlSession:", 0);
  }
}

void __54__ACSURLSession_URLSession_didBecomeInvalidWithError___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) didBecomeInvalidWithError:*(void *)(a1 + 48)];
  uint64_t v2 = [*(id *)(a1 + 40) _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__ACSURLSession_URLSession_didBecomeInvalidWithError___block_invoke_3;
  block[3] = &unk_1E6CC36A0;
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __54__ACSURLSession_URLSession_didBecomeInvalidWithError___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_clientDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "set_clientDelegateOpQueue:", 0);
  uint64_t v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "set_nsurlSession:", 0);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = self;
    _os_log_debug_impl(&dword_1DD432000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ didReceiveChallenge:%@ self=%@", buf, 0x20u);
  }

  id v13 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke;
  block[3] = &unk_1E6CC3B00;
  void block[4] = self;
  id v18 = v9;
  id v20 = v11;
  SEL v21 = a2;
  id v19 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v11;
  dispatch_async(v13, block);
}

void __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = *(void *)(a1 + 64);
      id v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = [v13 _nsurlSession];
      [v11 handleFailureInMethod:v12, v13, @"ACSURLSession.m", 1094, @"ACSURLSession %@ session %@ != expected %@", v13, v14, v15 object file lineNumber description];
    }
    id v5 = [*(id *)(a1 + 32) _clientDelegate];
    id v6 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
    if (objc_opt_respondsToSelector())
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke_2;
      v18[3] = &unk_1E6CC3AB0;
      uint64_t v7 = (id *)v19;
      id v8 = v5;
      uint64_t v9 = *(void *)(a1 + 32);
      v19[0] = v8;
      v19[1] = v9;
      id v20 = *(id *)(a1 + 48);
      id v21 = *(id *)(a1 + 56);
      [v6 addOperationWithBlock:v18];
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke_4;
      v16[3] = &unk_1E6CC3AD8;
      uint64_t v7 = &v17;
      id v17 = *(id *)(a1 + 56);
      [v6 addOperationWithBlock:v16];
    }
  }
  else
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v10();
  }
}

void __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke_3;
  v4[3] = &unk_1E6CC3A88;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 URLSession:v2 didReceiveChallenge:v3 completionHandler:v4];
}

uint64_t __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v15 = *MEMORY[0x1E4F1C3A8];
  v18[0] = @"session";
  v18[1] = @"nsurlTask";
  v19[0] = self;
  v19[1] = v11;
  v18[2] = @"request";
  void v19[2] = v12;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  id v17 = [v14 exceptionWithName:v15 reason:@"ACSURLSession does not support background sessions" userInfo:v16];

  objc_exception_throw(v17);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [v8 descriptionWithAddress];
    *(_DWORD *)buf = 138412802;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v13;
    __int16 v22 = 2112;
    id v23 = self;
    _os_log_debug_impl(&dword_1DD432000, v9, OS_LOG_TYPE_DEBUG, "URLSession:%@ taskIsWaitingForConnectivity:%@ self=%@", buf, 0x20u);
  }
  id v10 = [(ACSURLSession *)self _queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __57__ACSURLSession_URLSession_taskIsWaitingForConnectivity___block_invoke;
  v14[3] = &unk_1E6CC3A60;
  void v14[4] = self;
  id v15 = v7;
  id v16 = v8;
  SEL v17 = a2;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, v14);
}

void __57__ACSURLSession_URLSession_taskIsWaitingForConnectivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = [v14 _nsurlSession];
      [v12 handleFailureInMethod:v13, v14, @"ACSURLSession.m", 1136, @"ACSURLSession %@ session %@ != expected %@", v14, v15, v16 object file lineNumber description];
    }
    id v5 = [*(id *)(a1 + 32) _clientDelegate];
    id v6 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
      if (v7)
      {
        id v8 = (void *)v7;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __57__ACSURLSession_URLSession_taskIsWaitingForConnectivity___block_invoke_2;
        v17[3] = &unk_1E6CC39C0;
        id v9 = v5;
        uint64_t v10 = *(void *)(a1 + 32);
        id v18 = v9;
        uint64_t v19 = v10;
        id v20 = v8;
        id v11 = v8;
        [v6 addOperationWithBlock:v17];
      }
    }
  }
}

uint64_t __57__ACSURLSession_URLSession_taskIsWaitingForConnectivity___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) taskIsWaitingForConnectivity:*(void *)(a1 + 48)];
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    id v25 = [v14 descriptionWithAddress];
    *(_DWORD *)buf = 138413314;
    id v34 = v13;
    __int16 v35 = 2112;
    id v36 = v25;
    __int16 v37 = 2112;
    id v38 = v15;
    __int16 v39 = 2112;
    id v40 = v16;
    __int16 v41 = 2112;
    id v42 = self;
    _os_log_debug_impl(&dword_1DD432000, v18, OS_LOG_TYPE_DEBUG, "URLSession:%@ task:%@ willPerformHTTPRedirection:%@ newRequest:%@ self=%@", buf, 0x34u);
  }
  uint64_t v19 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  block[3] = &unk_1E6CC3B50;
  void block[4] = self;
  id v27 = v13;
  id v31 = v17;
  SEL v32 = a2;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v17;
  dispatch_async(v19, block);
}

void __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = *(void *)(a1 + 80);
      id v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = [v14 _nsurlSession];
      [v12 handleFailureInMethod:v13, v14, @"ACSURLSession.m", 1166, @"ACSURLSession %@ session %@ != expected %@", v14, v15, v16 object file lineNumber description];
    }
    id v5 = [*(id *)(a1 + 32) _clientDelegate];
    id v6 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
      if (v7)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3;
        v20[3] = &unk_1E6CC3B28;
        id v8 = (id *)v21;
        id v9 = v5;
        uint64_t v10 = *(void *)(a1 + 32);
        v21[0] = v9;
        v21[1] = v10;
        id v22 = v7;
        id v23 = *(id *)(a1 + 56);
        id v24 = *(id *)(a1 + 64);
        id v25 = *(id *)(a1 + 72);
        [v6 addOperationWithBlock:v20];
      }
      else
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
        v26[3] = &unk_1E6CC3AD8;
        id v8 = &v27;
        id v27 = *(id *)(a1 + 72);
        [v6 addOperationWithBlock:v26];
      }
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_4;
      v17[3] = &unk_1E6CC3718;
      id v19 = *(id *)(a1 + 72);
      id v18 = *(id *)(a1 + 64);
      [v6 addOperationWithBlock:v17];

      uint64_t v7 = v19;
    }
  }
  else
  {
    id v11 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v11();
  }
}

uint64_t __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) willPerformHTTPRedirection:*(void *)(a1 + 56) newRequest:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
}

uint64_t __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v21 = [v12 descriptionWithAddress];
    *(_DWORD *)buf = 138413058;
    id v29 = v11;
    __int16 v30 = 2112;
    id v31 = v21;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2112;
    __int16 v35 = self;
    _os_log_debug_impl(&dword_1DD432000, v15, OS_LOG_TYPE_DEBUG, "URLSession:%@ task:%@ didReceiveChallenge:%@ self=%@", buf, 0x2Au);
  }
  id v16 = [(ACSURLSession *)self _queue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke;
  v22[3] = &unk_1E6CC3BC8;
  v22[4] = self;
  id v23 = v11;
  id v26 = v14;
  SEL v27 = a2;
  id v24 = v12;
  id v25 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v14;
  dispatch_async(v16, v22);
}

void __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = *(void *)(a1 + 72);
      id v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = [v14 _nsurlSession];
      [v12 handleFailureInMethod:v13, v14, @"ACSURLSession.m", 1205, @"ACSURLSession %@ session %@ != expected %@", v14, v15, v16 object file lineNumber description];
    }
    id v5 = [*(id *)(a1 + 32) _clientDelegate];
    id v6 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
      if (v7)
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        void v19[2] = __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_3;
        v19[3] = &unk_1E6CC3BA0;
        id v8 = (id *)v20;
        id v9 = v5;
        uint64_t v10 = *(void *)(a1 + 32);
        v20[0] = v9;
        v20[1] = v10;
        id v21 = v7;
        id v22 = *(id *)(a1 + 56);
        id v23 = *(id *)(a1 + 64);
        [v6 addOperationWithBlock:v19];
      }
      else
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_2;
        v24[3] = &unk_1E6CC3AD8;
        id v8 = &v25;
        id v25 = *(id *)(a1 + 64);
        [v6 addOperationWithBlock:v24];
      }
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_5;
      v17[3] = &unk_1E6CC3AD8;
      id v18 = *(id *)(a1 + 64);
      [v6 addOperationWithBlock:v17];
      uint64_t v7 = v18;
    }
  }
  else
  {
    id v11 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v11();
  }
}

uint64_t __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_4;
  v6[3] = &unk_1E6CC3B78;
  id v7 = v4;
  id v8 = *(id *)(a1 + 64);
  [v2 URLSession:v3 task:v7 didReceiveChallenge:v5 completionHandler:v6];
}

void __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 2) {
    objc_msgSend(*(id *)(a1 + 32), "set_failBackToOrigin:", 0);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v10 descriptionWithAddress];
    *(_DWORD *)buf = 138412802;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v17;
    __int16 v27 = 2112;
    id v28 = self;
    _os_log_debug_impl(&dword_1DD432000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ task:%@ needNewBodyStream self=%@", buf, 0x20u);
  }
  uint64_t v13 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke;
  block[3] = &unk_1E6CC3B00;
  void block[4] = self;
  id v19 = v9;
  id v21 = v11;
  SEL v22 = a2;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v11;
  dispatch_async(v13, block);
}

void __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v14 = *(void *)(a1 + 64);
      id v15 = *(void **)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      id v17 = [v15 _nsurlSession];
      [v13 handleFailureInMethod:v14, v15, @"ACSURLSession.m", 1245, @"ACSURLSession %@ session %@ != expected %@", v15, v16, v17 object file lineNumber description];
    }
    id v5 = [*(id *)(a1 + 32) _clientDelegate];
    id v6 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
    id v7 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
    if (v7)
    {
      if (objc_opt_respondsToSelector())
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        void v21[2] = __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_3;
        v21[3] = &unk_1E6CC3AB0;
        id v8 = (id *)v22;
        id v9 = v5;
        uint64_t v10 = *(void *)(a1 + 32);
        v22[0] = v9;
        v22[1] = v10;
        id v23 = v7;
        id v24 = *(id *)(a1 + 56);
        [v6 addOperationWithBlock:v21];

        id v11 = v23;
      }
      else
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_5;
        void v18[3] = &unk_1E6CC36C8;
        id v8 = &v19;
        id v19 = v7;
        id v20 = *(id *)(a1 + 56);
        [v6 addOperationWithBlock:v18];
        id v11 = v20;
      }
    }
    else
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_2;
      v25[3] = &unk_1E6CC3AD8;
      id v8 = &v26;
      id v26 = *(id *)(a1 + 56);
      [v6 addOperationWithBlock:v25];
    }
  }
  else
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v12();
  }
}

uint64_t __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_4;
  v5[3] = &unk_1E6CC3BF0;
  id v6 = v4;
  id v7 = *(id *)(a1 + 56);
  [v2 URLSession:v3 task:v6 needNewBodyStream:v5];
}

void __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    objc_msgSend(*(id *)(a1 + 32), "set_failBackToOrigin:", 0);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_failBackToOrigin:", 0);
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v19 = [v14 descriptionWithAddress];
    *(_DWORD *)buf = 138413570;
    id v28 = v13;
    __int16 v29 = 2112;
    __int16 v30 = v19;
    __int16 v31 = 2048;
    int64_t v32 = a5;
    __int16 v33 = 2048;
    int64_t v34 = a6;
    __int16 v35 = 2048;
    int64_t v36 = a7;
    __int16 v37 = 2112;
    id v38 = self;
    _os_log_debug_impl(&dword_1DD432000, v15, OS_LOG_TYPE_DEBUG, "URLSession:%@ task:%@ didSendBodyData:%lld totalBytesSent:%lld totalBytesExpectedToSend:%lld self=%@", buf, 0x3Eu);
  }
  uint64_t v16 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__ACSURLSession_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke;
  block[3] = &unk_1E6CC3C40;
  void block[4] = self;
  id v21 = v13;
  id v22 = v14;
  SEL v23 = a2;
  int64_t v24 = a5;
  int64_t v25 = a6;
  int64_t v26 = a7;
  id v17 = v14;
  id v18 = v13;
  dispatch_async(v16, block);
}

void __89__ACSURLSession_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = *(void *)(a1 + 56);
      id v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = [v14 _nsurlSession];
      [v12 handleFailureInMethod:v13, v14, @"ACSURLSession.m", 1285, @"ACSURLSession %@ session %@ != expected %@", v14, v15, v16 object file lineNumber description];
    }
    id v5 = [*(id *)(a1 + 32) _clientDelegate];
    id v6 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
      if (v7)
      {
        id v8 = (void *)v7;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __89__ACSURLSession_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke_2;
        v17[3] = &unk_1E6CC3C18;
        id v9 = v5;
        uint64_t v10 = *(void *)(a1 + 32);
        id v18 = v9;
        uint64_t v19 = v10;
        id v20 = v8;
        long long v21 = *(_OWORD *)(a1 + 64);
        uint64_t v22 = *(void *)(a1 + 80);
        id v11 = v8;
        [v6 addOperationWithBlock:v17];
      }
    }
  }
}

uint64_t __89__ACSURLSession_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didSendBodyData:*(void *)(a1 + 56) totalBytesSent:*(void *)(a1 + 64) totalBytesExpectedToSend:*(void *)(a1 + 72)];
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v10 descriptionWithAddress];
    *(_DWORD *)buf = 138413058;
    id v24 = v9;
    __int16 v25 = 2112;
    int64_t v26 = v17;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    __int16 v30 = self;
    _os_log_debug_impl(&dword_1DD432000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ task:%@ didFinishCollectingMetrics:%@ self=%@", buf, 0x2Au);
  }
  uint64_t v13 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ACSURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke;
  block[3] = &unk_1E6CC3C90;
  void block[4] = self;
  id v19 = v9;
  id v21 = v11;
  SEL v22 = a2;
  id v20 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(v13, block);
}

void __60__ACSURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = *(void *)(a1 + 64);
      id v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = [v14 _nsurlSession];
      [v12 handleFailureInMethod:v13, v14, @"ACSURLSession.m", 1309, @"ACSURLSession %@ session %@ != expected %@", v14, v15, v16 object file lineNumber description];
    }
    id v5 = [*(id *)(a1 + 32) _clientDelegate];
    id v6 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
      if (v7)
      {
        id v8 = (void *)v7;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __60__ACSURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_2;
        v17[3] = &unk_1E6CC3C68;
        id v9 = v5;
        uint64_t v10 = *(void *)(a1 + 32);
        id v18 = v9;
        uint64_t v19 = v10;
        id v20 = v8;
        id v21 = *(id *)(a1 + 56);
        id v11 = v8;
        [v6 addOperationWithBlock:v17];
      }
    }
  }
}

uint64_t __60__ACSURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didFinishCollectingMetrics:*(void *)(a1 + 56)];
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v10 descriptionWithAddress];
    *(_DWORD *)buf = 138413058;
    id v24 = v9;
    __int16 v25 = 2112;
    int64_t v26 = v17;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    __int16 v30 = self;
    _os_log_debug_impl(&dword_1DD432000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ task:%@ didCompleteWithError:%@ self=%@", buf, 0x2Au);
  }
  uint64_t v13 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__ACSURLSession_URLSession_task_didCompleteWithError___block_invoke;
  block[3] = &unk_1E6CC3C90;
  void block[4] = self;
  id v19 = v9;
  id v21 = v11;
  SEL v22 = a2;
  id v20 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(v13, block);
}

void __54__ACSURLSession_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  *(void *)((char *)&v52[2] + 2) = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      int64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v37 = *(void *)(a1 + 64);
      id v38 = *(void **)(a1 + 32);
      uint64_t v39 = *(void *)(a1 + 40);
      id v40 = [v38 _nsurlSession];
      [v36 handleFailureInMethod:v37, v38, @"ACSURLSession.m", 1334, @"ACSURLSession %@ session %@ != expected %@", v38, v39, v40 object file lineNumber description];
    }
    id v5 = [*(id *)(a1 + 48) response];
    id v6 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
    uint64_t v7 = v6;
    if (!v6) {
      goto LABEL_30;
    }
    id v8 = [v6 _nsurlTaskToCachingServer];
    if (*(void **)(a1 + 48) == v8 && [v7 _tryCachingServer])
    {
      if ([v7 _failBackToOrigin])
      {
        id v9 = [v8 currentRequest];
        id v10 = [v9 URL];

        uint64_t v11 = *(void *)(a1 + 56);
        if (v11 || !v5) {
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 statusCode] >= 400)
        {
          uint64_t v11 = *(void *)(a1 + 56);
LABEL_13:
          id v12 = [*(id *)(a1 + 32) _logHandle];
          BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
          if (v11)
          {
            if (v13)
            {
              uint64_t v14 = *(void *)(a1 + 56);
              id v15 = [v10 absoluteString];
              *(_DWORD *)buf = 138412546;
              uint64_t v50 = v14;
              __int16 v51 = 2112;
              v52[0] = v15;
              _os_log_impl(&dword_1DD432000, v12, OS_LOG_TYPE_DEFAULT, "Error %@ from %@, failing back to original", buf, 0x16u);
            }
          }
          else if (v13)
          {
            uint64_t v32 = [v5 statusCode];
            __int16 v33 = [v10 absoluteString];
            *(_DWORD *)buf = 134218242;
            uint64_t v50 = v32;
            __int16 v51 = 2112;
            v52[0] = v33;
            _os_log_impl(&dword_1DD432000, v12, OS_LOG_TYPE_DEFAULT, "HTTP response %ld from %@, failing back to original", buf, 0x16u);
          }
          CFTypeRef cf = 0;
          if (!ACSUpdateCachingServerHealth((const __CFURL *)v10, 0, 0, (CFErrorRef *)&cf))
          {
            int64_t v34 = [*(id *)(a1 + 32) _logHandle];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v35 = [v10 absoluteString];
              *(_DWORD *)buf = 138412802;
              uint64_t v50 = (uint64_t)v35;
              __int16 v51 = 1024;
              LODWORD(v52[0]) = 0;
              WORD2(v52[0]) = 2112;
              *(void *)((char *)v52 + 6) = cf;
              _os_log_impl(&dword_1DD432000, v34, OS_LOG_TYPE_DEFAULT, "ACSUpdateCachingServerHealth(%@, %d) failed: %@", buf, 0x1Cu);
            }
          }
          if (cf) {
            CFRelease(cf);
          }
          objc_msgSend(v7, "set_nsurlTaskToCachingServer:", 0);
          objc_msgSend(*(id *)(a1 + 32), "_onqueue_removeTaskForNSURLTask:", v8);
          objc_msgSend(v7, "set_tryCachingServer:", 0);
          objc_msgSend(*(id *)(a1 + 32), "_onqueue_resumeTask:", v7);
LABEL_29:

LABEL_30:
          return;
        }
        CFTypeRef cf = 0;
        if (!ACSUpdateCachingServerHealth((const __CFURL *)v10, 0, 1, (CFErrorRef *)&cf))
        {
          __int16 v30 = [*(id *)(a1 + 32) _logHandle];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v31 = [v10 absoluteString];
            *(_DWORD *)buf = 138412802;
            uint64_t v50 = (uint64_t)v31;
            __int16 v51 = 1024;
            LODWORD(v52[0]) = 1;
            WORD2(v52[0]) = 2112;
            *(void *)((char *)v52 + 6) = cf;
            _os_log_impl(&dword_1DD432000, v30, OS_LOG_TYPE_DEFAULT, "ACSUpdateCachingServerHealth(%@, %d) failed: %@", buf, 0x1Cu);
          }
        }
        if (cf) {
          CFRelease(cf);
        }
      }
      int v16 = 1;
    }
    else
    {
      int v16 = 0;
    }
    id v10 = *(id *)(a1 + 56);
    if (!v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v7;
        id v10 = [v17 _deferredLinkError];

        if (v10)
        {
          id v10 = [v17 _deferredLinkError];
          objc_msgSend(v17, "set_deferredLinkError:", 0);
        }
      }
      else
      {
        id v10 = 0;
      }
    }
    id v18 = [*(id *)(a1 + 32) _clientDelegate];
    id v19 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
    if (objc_opt_respondsToSelector())
    {
      id v20 = *(void **)(a1 + 32);
      [v7 originalRequest];
      char v41 = v16;
      id v21 = v5;
      v23 = SEL v22 = v8;
      id v24 = [v7 currentRequest];
      __int16 v25 = [v20 _errorWithResumeDataFromError:v10 originalRequest:v23 currentRequest:v24];

      id v8 = v22;
      id v5 = v21;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __54__ACSURLSession_URLSession_task_didCompleteWithError___block_invoke_210;
      v42[3] = &unk_1E6CC3CB8;
      id v26 = v18;
      uint64_t v27 = *(void *)(a1 + 32);
      id v43 = v26;
      uint64_t v44 = v27;
      id v45 = v7;
      id v46 = v25;
      char v47 = v41;
      id v28 = v25;
      [v19 addOperationWithBlock:v42];
    }
    else
    {
      if (v16)
      {
        __int16 v29 = [v7 _nsurlTaskToOrigin];
        [v29 cancel];
      }
      [*(id *)(a1 + 32) _removeTask:v7];
    }

    goto LABEL_29;
  }
}

uint64_t __54__ACSURLSession_URLSession_task_didCompleteWithError___block_invoke_210(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didCompleteWithError:*(void *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = [*(id *)(a1 + 48) _nsurlTaskToOrigin];
    [v2 cancel];
  }
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _removeTask:v4];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    __int16 v33 = 2112;
    int64_t v34 = self;
    _os_log_debug_impl(&dword_1DD432000, v15, OS_LOG_TYPE_DEBUG, "URLSession:%@ dataTask:%@ didReceiveResponse:%@ self=%@", buf, 0x2Au);
  }

  int v16 = [(ACSURLSession *)self _queue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v21[3] = &unk_1E6CC3BC8;
  void v21[4] = self;
  id v22 = v11;
  id v25 = v14;
  SEL v26 = a2;
  id v23 = v12;
  id v24 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v14;
  dispatch_async(v16, v21);
}

void __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v20 = *(void *)(a1 + 72);
      id v21 = *(void **)(a1 + 32);
      uint64_t v22 = *(void *)(a1 + 40);
      id v23 = [v21 _nsurlSession];
      [v19 handleFailureInMethod:v20, v21, @"ACSURLSession.m", 1422, @"ACSURLSession %@ session %@ != expected %@", v21, v22, v23 object file lineNumber description];
    }
    id v5 = [*(id *)(a1 + 32) _clientDelegate];
    id v6 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
    if (!v7)
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
      v37[3] = &unk_1E6CC3AD8;
      id v38 = *(id *)(a1 + 64);
      [v6 addOperationWithBlock:v37];
      id v8 = v38;
LABEL_25:

      return;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v24 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v25 = *(void *)(a1 + 72);
      uint64_t v26 = *(void *)(a1 + 32);
      uint64_t v27 = [*(id *)(a1 + 48) descriptionWithAddress];
      [v24 handleFailureInMethod:v25, v26, @"ACSURLSession.m", 1435, @"ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@", v26, v7, v27, @"ACSURLSessionDataTask" object file lineNumber description];
    }
    id v8 = v7;
    id v9 = [v8 _nsurlTaskToCachingServer];
    if (*(void **)(a1 + 48) == v9
      && [v8 _tryCachingServer]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [*(id *)(a1 + 56) statusCode] >= 400)
    {
      if ([v8 _failBackToOrigin])
      {
        id v10 = [*(id *)(a1 + 32) _logHandle];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [*(id *)(a1 + 56) statusCode];
          id v12 = [*(id *)(a1 + 56) URL];
          id v13 = [v12 absoluteString];
          *(_DWORD *)buf = 134218242;
          uint64_t v40 = v11;
          __int16 v41 = 2112;
          id v42 = v13;
          _os_log_impl(&dword_1DD432000, v10, OS_LOG_TYPE_DEFAULT, "HTTP response %ld from %@, canceling to fail back to original", buf, 0x16u);
        }
      }
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_214;
      v35[3] = &unk_1E6CC3AD8;
      id v14 = &v36;
      id v36 = *(id *)(a1 + 64);
      id v15 = v35;
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_217;
        v30[3] = &unk_1E6CC3BA0;
        id v14 = (id *)v31;
        id v17 = v5;
        uint64_t v18 = *(void *)(a1 + 32);
        v31[0] = v17;
        v31[1] = v18;
        id v32 = v8;
        id v33 = *(id *)(a1 + 56);
        id v34 = *(id *)(a1 + 64);
        [v6 addOperationWithBlock:v30];

LABEL_24:
        goto LABEL_25;
      }
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4;
      v28[3] = &unk_1E6CC3AD8;
      id v14 = &v29;
      id v29 = *(id *)(a1 + 64);
      id v15 = v28;
    }
    [v6 addOperationWithBlock:v15];
    goto LABEL_24;
  }
  int v16 = *(void (**)(void))(*(void *)(a1 + 64) + 16);

  v16();
}

uint64_t __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_217(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3;
  v6[3] = &unk_1E6CC3CE0;
  void v6[4] = v3;
  id v7 = v4;
  id v8 = *(id *)(a1 + 64);
  [v2 URLSession:v3 dataTask:v7 didReceiveResponse:v5 completionHandler:v6];
}

uint64_t __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (a2 == 3)
    {
      uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v4 = *MEMORY[0x1E4F1C3A8];
      v10[0] = @"session";
      v10[1] = @"task";
      uint64_t v5 = *(void *)(a1 + 40);
      v11[0] = *(void *)(a1 + 32);
      v11[1] = v5;
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
      id v7 = [v3 exceptionWithName:v4 reason:@"ACSURLSession does not support stream tasks" userInfo:v6];

      objc_exception_throw(v7);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "set_failBackToOrigin:", 0);
  }
  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v8();
}

uint64_t __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2112;
    id v29 = self;
    _os_log_debug_impl(&dword_1DD432000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ dataTask:%@ didBecomeDownloadTask:%@ self=%@", buf, 0x2Au);
  }

  id v13 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ACSURLSession_URLSession_dataTask_didBecomeDownloadTask___block_invoke;
  block[3] = &unk_1E6CC3C90;
  void block[4] = self;
  id v18 = v9;
  id v20 = v11;
  SEL v21 = a2;
  id v19 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(v13, block);
}

void __59__ACSURLSession_URLSession_dataTask_didBecomeDownloadTask___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      id v29 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v30 = *(void *)(a1 + 64);
      __int16 v31 = *(void **)(a1 + 32);
      uint64_t v32 = *(void *)(a1 + 40);
      id v33 = [v31 _nsurlSession];
      [v29 handleFailureInMethod:v30, v31, @"ACSURLSession.m", 1483, @"ACSURLSession %@ session %@ != expected %@", v31, v32, v33 object file lineNumber description];
    }
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v34 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v35 = *(void *)(a1 + 64);
        uint64_t v36 = *(void *)(a1 + 32);
        uint64_t v37 = [*(id *)(a1 + 48) descriptionWithAddress];
        [v34 handleFailureInMethod:v35, v36, @"ACSURLSession.m", 1490, @"ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@", v36, v5, v37, @"ACSURLSessionDataTask" object file lineNumber description];
      }
      id v6 = v5;
      id v7 = [*(id *)(a1 + 56) currentRequest];
      if ([v6 _tryCachingServer])
      {
        id v8 = [v6 originalRequest];
      }
      else
      {
        id v8 = v7;
      }
      id v9 = v8;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __59__ACSURLSession_URLSession_dataTask_didBecomeDownloadTask___block_invoke_2;
      v47[3] = &unk_1E6CC38F8;
      id v10 = v7;
      id v48 = v10;
      id v11 = *(id *)(a1 + 56);
      uint64_t v12 = *(void *)(a1 + 32);
      id v49 = v11;
      uint64_t v50 = v12;
      uint64_t v39 = (void *)MEMORY[0x1E01B57E0](v47);
      uint64_t v40 = v9;
      id v13 = [[ACSURLSessionDownloadTask alloc] initWithNSURLDownloadTaskCreator:v39 initialRequest:v9 forSession:*(void *)(a1 + 32)];
      id v14 = *(void **)(a1 + 32);
      id v15 = [(ACSURLSessionTask *)v13 _nsurlTaskToOrigin];
      objc_msgSend(v14, "_onqueue_addTask:forNSURLTask:", v13, v15);

      id v16 = *(void **)(a1 + 48);
      id v17 = [v6 _nsurlTaskToCachingServer];

      if (v16 == v17)
      {
        id v38 = [(ACSURLSessionTask *)v13 _nsurlTaskForRequest:v10];
        [(ACSURLSessionTask *)v13 set_nsurlTaskToCachingServer:v38];
        id v18 = *(void **)(a1 + 32);
        id v19 = [(ACSURLSessionTask *)v13 _nsurlTaskToOrigin];
        [(ACSURLSessionTask *)v13 _nsurlTaskToCachingServer];
        id v20 = v6;
        SEL v21 = v5;
        v23 = id v22 = v10;
        [v18 _copyAttributesFromNSURLTask:v19 toNSURLTask:v23];

        id v10 = v22;
        uint64_t v5 = v21;
        id v6 = v20;

        -[ACSURLSessionTask set_suspended:](v13, "set_suspended:", [v20 _suspended]);
        objc_msgSend(*(id *)(a1 + 32), "_onqueue_addTask:forNSURLTask:", v13, v38);
      }
      else
      {
        [(ACSURLSessionTask *)v13 set_tryCachingServer:0];
      }
      __int16 v24 = [*(id *)(a1 + 32) _clientDelegate];
      id v25 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
      if (objc_opt_respondsToSelector())
      {
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        void v41[2] = __59__ACSURLSession_URLSession_dataTask_didBecomeDownloadTask___block_invoke_3;
        v41[3] = &unk_1E6CC3CB8;
        id v26 = v24;
        uint64_t v27 = *(void *)(a1 + 32);
        id v42 = v26;
        uint64_t v43 = v27;
        id v44 = v6;
        id v45 = v13;
        BOOL v46 = v16 == v17;
        [v25 addOperationWithBlock:v41];
      }
      else
      {
        if (v16 == v17)
        {
          __int16 v28 = [v6 _nsurlTaskToOrigin];
          [v28 cancel];
        }
        [*(id *)(a1 + 32) _removeTask:v6];
      }
    }
  }
}

id __59__ACSURLSession_URLSession_dataTask_didBecomeDownloadTask___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2)
  {
    id v5 = *(id *)(a1 + 40);
  }
  else
  {
    uint64_t v2 = *(void **)(a1 + 48);
    id v3 = a2;
    uint64_t v4 = [v2 _nsurlSession];
    id v5 = [v4 downloadTaskWithRequest:v3];
  }

  return v5;
}

uint64_t __59__ACSURLSession_URLSession_dataTask_didBecomeDownloadTask___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) dataTask:*(void *)(a1 + 48) didBecomeDownloadTask:*(void *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = [*(id *)(a1 + 48) _nsurlTaskToOrigin];
    [v2 cancel];
  }
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _removeTask:v4];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeStreamTask:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ACSURLSession_URLSession_dataTask_didBecomeStreamTask___block_invoke;
  block[3] = &unk_1E6CC3C90;
  void block[4] = self;
  id v17 = v9;
  id v19 = v11;
  SEL v20 = a2;
  id v18 = v10;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, block);
}

void __57__ACSURLSession_URLSession_dataTask_didBecomeStreamTask___block_invoke(uint64_t a1)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = *(void *)(a1 + 64);
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = [v8 _nsurlSession];
      [v6 handleFailureInMethod:v7, v8, @"ACSURLSession.m", 1543, @"ACSURLSession %@ session %@ != expected %@", v8, v9, v10 object file lineNumber description];
    }
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
    if (v5)
    {
      id v11 = (void *)v5;
      objc_opt_class();
      uint64_t v12 = v11;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        __int16 v24 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v25 = *(void *)(a1 + 64);
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v27 = [*(id *)(a1 + 48) descriptionWithAddress];
        [v24 handleFailureInMethod:v25, v26, @"ACSURLSession.m", 1549, @"ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@", v26, v12, v27, @"ACSURLSessionDataTask" object file lineNumber description];
      }
      id v13 = v12;
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_removeTaskForNSURLTask:", *(void *)(a1 + 48));
      id v14 = *(void **)(a1 + 48);
      id v15 = [v13 _nsurlTaskToCachingServer];

      if (v14 == v15)
      {
        id v16 = *(void **)(a1 + 32);
        id v17 = [v13 _nsurlTaskToOrigin];
        objc_msgSend(v16, "_onqueue_removeTaskForNSURLTask:", v17);
      }
      id v18 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v19 = *MEMORY[0x1E4F1C3A8];
      uint64_t v20 = *(void *)(a1 + 32);
      v28[0] = @"session";
      v28[1] = @"nsurlTask";
      uint64_t v21 = *(void *)(a1 + 56);
      v29[0] = v20;
      v29[1] = v21;
      id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      id v23 = [v18 exceptionWithName:v19 reason:@"ACSURLSession does not support stream tasks" userInfo:v22];

      objc_exception_throw(v23);
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2048;
    uint64_t v27 = [v11 length];
    __int16 v28 = 2112;
    id v29 = self;
    _os_log_debug_impl(&dword_1DD432000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ dataTask:%@ didReceiveData:[%ld bytes] self=%@", buf, 0x2Au);
  }

  id v13 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ACSURLSession_URLSession_dataTask_didReceiveData___block_invoke;
  block[3] = &unk_1E6CC3C90;
  void block[4] = self;
  id v18 = v9;
  id v20 = v11;
  SEL v21 = a2;
  id v19 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(v13, block);
}

void __52__ACSURLSession_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = *(void *)(a1 + 64);
      id v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = [v14 _nsurlSession];
      [v12 handleFailureInMethod:v13, v14, @"ACSURLSession.m", 1571, @"ACSURLSession %@ session %@ != expected %@", v14, v15, v16 object file lineNumber description];
    }
    uint64_t v5 = [*(id *)(a1 + 32) _clientDelegate];
    id v6 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
      if (v7)
      {
        id v8 = (void *)v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v17 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v18 = *(void *)(a1 + 64);
          uint64_t v19 = *(void *)(a1 + 32);
          id v20 = [*(id *)(a1 + 48) descriptionWithAddress];
          [v17 handleFailureInMethod:v18, v19, @"ACSURLSession.m", 1580, @"ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@", v19, v8, v20, @"ACSURLSessionDataTask" object file lineNumber description];
        }
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        void v21[2] = __52__ACSURLSession_URLSession_dataTask_didReceiveData___block_invoke_2;
        v21[3] = &unk_1E6CC3C68;
        id v9 = v5;
        uint64_t v10 = *(void *)(a1 + 32);
        id v22 = v9;
        uint64_t v23 = v10;
        id v24 = v8;
        id v25 = *(id *)(a1 + 56);
        id v11 = v8;
        [v6 addOperationWithBlock:v21];
      }
    }
  }
}

uint64_t __52__ACSURLSession_URLSession_dataTask_didReceiveData___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) dataTask:*(void *)(a1 + 48) didReceiveData:*(void *)(a1 + 56)];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    __int16 v33 = 2112;
    id v34 = self;
    _os_log_debug_impl(&dword_1DD432000, v15, OS_LOG_TYPE_DEBUG, "URLSession:%@ dataTask:%@ willCacheResponse:%@ self=%@", buf, 0x2Au);
  }

  id v16 = [(ACSURLSession *)self _queue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke;
  v21[3] = &unk_1E6CC3BC8;
  void v21[4] = self;
  id v22 = v11;
  id v25 = v14;
  SEL v26 = a2;
  id v23 = v12;
  id v24 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v14;
  dispatch_async(v16, v21);
}

void __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v14 = *(void *)(a1 + 72);
      uint64_t v15 = *(void **)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      id v17 = [v15 _nsurlSession];
      [v13 handleFailureInMethod:v14, v15, @"ACSURLSession.m", 1602, @"ACSURLSession %@ session %@ != expected %@", v15, v16, v17 object file lineNumber description];
    }
    uint64_t v5 = [*(id *)(a1 + 32) _clientDelegate];
    id v6 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v18 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v19 = *(void *)(a1 + 72);
          uint64_t v20 = *(void *)(a1 + 32);
          SEL v21 = [*(id *)(a1 + 48) descriptionWithAddress];
          [v18 handleFailureInMethod:v19, v20, @"ACSURLSession.m", 1615, @"ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@", v20, v7, v21, @"ACSURLSessionDataTask" object file lineNumber description];
        }
        id v8 = v7;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke_3;
        v25[3] = &unk_1E6CC3BA0;
        id v9 = (id *)v26;
        id v10 = v5;
        uint64_t v11 = *(void *)(a1 + 32);
        v26[0] = v10;
        v26[1] = v11;
        id v27 = v8;
        id v28 = *(id *)(a1 + 56);
        id v29 = *(id *)(a1 + 64);
        [v6 addOperationWithBlock:v25];
      }
      else
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke_2;
        v30[3] = &unk_1E6CC3AD8;
        id v9 = &v31;
        id v31 = *(id *)(a1 + 64);
        [v6 addOperationWithBlock:v30];
      }
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      void v22[2] = __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke_4;
      v22[3] = &unk_1E6CC3718;
      id v24 = *(id *)(a1 + 64);
      id v23 = *(id *)(a1 + 56);
      [v6 addOperationWithBlock:v22];

      uint64_t v7 = v24;
    }
  }
  else
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v12();
  }
}

uint64_t __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) dataTask:*(void *)(a1 + 48) willCacheResponse:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

uint64_t __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v24 = [v10 response];
    *(_DWORD *)buf = 138413314;
    id v42 = v9;
    __int16 v43 = 2112;
    uint64_t v44 = (uint64_t)v10;
    __int16 v45 = 2112;
    id v46 = v11;
    __int16 v47 = 2112;
    id v48 = v24;
    __int16 v49 = 2112;
    uint64_t v50 = self;
    _os_log_debug_impl(&dword_1DD432000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ downloadTask:%@ didFinishDownloadingToURL:%@ response=%@ self=%@", buf, 0x34u);
  }
  uint64_t v13 = [(ACSURLSession *)self _linkedLocationWithLocation:v11];
  if (!v13)
  {
    id v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3A8];
    v39[0] = @"session";
    v39[1] = @"nsurlTask";
    v40[0] = self;
    v40[1] = v10;
    void v39[2] = @"location";
    v40[2] = v11;
    id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
    id v31 = [v28 exceptionWithName:v29 reason:@"ACSURLSession needs a non-reference file URL to a file" userInfo:v30];

    objc_exception_throw(v31);
  }
  uint64_t v14 = (void *)v13;
  uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v38 = 0;
  char v16 = [v15 linkItemAtURL:v11 toURL:v14 error:&v38];
  id v17 = v38;

  if ((v16 & 1) == 0)
  {
    id v18 = [(ACSURLSession *)self _logHandle];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v25 = [v11 path];
      uint64_t v26 = [v14 path];
      *(_DWORD *)buf = 138412802;
      id v42 = v25;
      __int16 v43 = 2112;
      uint64_t v44 = v26;
      id v27 = (void *)v26;
      __int16 v45 = 2112;
      id v46 = v17;
      _os_log_error_impl(&dword_1DD432000, v18, OS_LOG_TYPE_ERROR, "ACSURLSession can not link %@ to %@: %@", buf, 0x20u);
    }
  }
  uint64_t v19 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__ACSURLSession_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
  block[3] = &unk_1E6CC3D08;
  void block[4] = self;
  id v33 = v14;
  id v34 = v9;
  id v35 = v10;
  id v36 = v17;
  SEL v37 = a2;
  id v20 = v17;
  id v21 = v10;
  id v22 = v9;
  id v23 = v14;
  dispatch_async(v19, block);
}

void __67__ACSURLSession_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    id v3 = *(void **)(a1 + 48);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v18 = *(void *)(a1 + 72);
      uint64_t v19 = *(void **)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 48);
      id v21 = [v19 _nsurlSession];
      [v17 handleFailureInMethod:v18, v19, @"ACSURLSession.m", 1655, @"ACSURLSession %@ session %@ != expected %@", v19, v20, v21 object file lineNumber description];
    }
    uint64_t v5 = [*(id *)(a1 + 56) response];
    id v6 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 56));
    if (!v6)
    {
      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v7 removeItemAtURL:*(void *)(a1 + 40) error:0];
LABEL_25:

      return;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v22 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v23 = *(void *)(a1 + 72);
      uint64_t v24 = *(void *)(a1 + 32);
      id v25 = [*(id *)(a1 + 56) descriptionWithAddress];
      [v22 handleFailureInMethod:v23, v24, @"ACSURLSession.m", 1664, @"ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@", v24, v6, v25, @"ACSURLSessionDownloadTask" object file lineNumber description];
    }
    id v7 = v6;
    id v8 = [v7 _nsurlTaskToCachingServer];
    if (*(void **)(a1 + 56) == v8
      && [v7 _tryCachingServer]
      && [v7 _failBackToOrigin]
      && (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v5 statusCode] >= 400))
    {
      id v9 = [*(id *)(a1 + 32) _logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v5 statusCode];
        id v11 = [v5 URL];
        id v12 = [v11 absoluteString];
        *(_DWORD *)buf = 134218242;
        uint64_t v33 = v10;
        __int16 v34 = 2112;
        id v35 = v12;
        _os_log_impl(&dword_1DD432000, v9, OS_LOG_TYPE_DEFAULT, "HTTP response %ld from %@, ignoring to fail back to original", buf, 0x16u);
      }
      uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v13 removeItemAtURL:*(void *)(a1 + 40) error:0];
    }
    else
    {
      if (*(void *)(a1 + 64))
      {
        objc_msgSend(v7, "set_deferredLinkError:");
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v14 = [*(id *)(a1 + 32) _clientDelegate];
      uint64_t v13 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __67__ACSURLSession_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke_231;
      v27[3] = &unk_1E6CC3C68;
      uint64_t v15 = *(void *)(a1 + 32);
      id v28 = v14;
      uint64_t v29 = v15;
      id v30 = v7;
      id v31 = *(id *)(a1 + 40);
      id v16 = v14;
      [v13 addOperationWithBlock:v27];
    }
    goto LABEL_24;
  }
  id v26 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v26 removeItemAtURL:*(void *)(a1 + 40) error:0];
}

void __67__ACSURLSession_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke_231(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) downloadTask:*(void *)(a1 + 48) didFinishDownloadingToURL:*(void *)(a1 + 56)];
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 removeItemAtURL:*(void *)(a1 + 56) error:0];
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413570;
    id v27 = v13;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2048;
    int64_t v31 = a5;
    __int16 v32 = 2048;
    int64_t v33 = a6;
    __int16 v34 = 2048;
    int64_t v35 = a7;
    __int16 v36 = 2112;
    SEL v37 = self;
    _os_log_debug_impl(&dword_1DD432000, v15, OS_LOG_TYPE_DEBUG, "URLSession:%@ downloadTask:%@ didWriteData:%lld totalBytesWritten:%lld totalBytesExpectedToWrite:%lld self=%@", buf, 0x3Eu);
  }

  id v16 = [(ACSURLSession *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__ACSURLSession_URLSession_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
  block[3] = &unk_1E6CC3C40;
  void block[4] = self;
  id v20 = v13;
  id v21 = v14;
  SEL v22 = a2;
  int64_t v23 = a5;
  int64_t v24 = a6;
  int64_t v25 = a7;
  id v17 = v14;
  id v18 = v13;
  dispatch_async(v16, block);
}

void __98__ACSURLSession_URLSession_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = *(void *)(a1 + 56);
      id v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = [v14 _nsurlSession];
      [v12 handleFailureInMethod:v13, v14, @"ACSURLSession.m", 1702, @"ACSURLSession %@ session %@ != expected %@", v14, v15, v16 object file lineNumber description];
    }
    uint64_t v5 = [*(id *)(a1 + 32) _clientDelegate];
    id v6 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
      if (v7)
      {
        id v8 = (void *)v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v17 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = *(void *)(a1 + 56);
          id v20 = [*(id *)(a1 + 48) descriptionWithAddress];
          [v17 handleFailureInMethod:v19, v18, @"ACSURLSession.m", 1711, @"ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@", v18, v8, v20, @"ACSURLSessionDownloadTask" object file lineNumber description];
        }
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        void v21[2] = __98__ACSURLSession_URLSession_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke_2;
        v21[3] = &unk_1E6CC3C18;
        id v9 = v5;
        uint64_t v10 = *(void *)(a1 + 32);
        id v22 = v9;
        uint64_t v23 = v10;
        id v24 = v8;
        long long v25 = *(_OWORD *)(a1 + 64);
        uint64_t v26 = *(void *)(a1 + 80);
        id v11 = v8;
        [v6 addOperationWithBlock:v21];
      }
    }
  }
}

uint64_t __98__ACSURLSession_URLSession_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) downloadTask:*(void *)(a1 + 48) didWriteData:*(void *)(a1 + 56) totalBytesWritten:*(void *)(a1 + 64) totalBytesExpectedToWrite:*(void *)(a1 + 72)];
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [(ACSURLSession *)self _logHandle];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2048;
    int64_t v28 = a5;
    __int16 v29 = 2048;
    int64_t v30 = a6;
    __int16 v31 = 2112;
    __int16 v32 = self;
    _os_log_debug_impl(&dword_1DD432000, v13, OS_LOG_TYPE_DEBUG, "URLSession:%@ downloadTask:%@ didResumeAtOffset:%lld expectedTotalBytes:%lld self=%@", buf, 0x34u);
  }

  id v14 = [(ACSURLSession *)self _queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__ACSURLSession_URLSession_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke;
  v17[3] = &unk_1E6CC3C18;
  void v17[4] = self;
  id v18 = v11;
  id v19 = v12;
  SEL v20 = a2;
  int64_t v21 = a5;
  int64_t v22 = a6;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(v14, v17);
}

void __78__ACSURLSession_URLSession_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _nsurlSession];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) _nsurlSession];

    if (v3 != v4)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = *(void *)(a1 + 56);
      id v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = [v14 _nsurlSession];
      [v12 handleFailureInMethod:v13, v14, @"ACSURLSession.m", 1730, @"ACSURLSession %@ session %@ != expected %@", v14, v15, v16 object file lineNumber description];
    }
    uint64_t v5 = [*(id *)(a1 + 32) _clientDelegate];
    id v6 = [*(id *)(a1 + 32) _clientDelegateOpQueue];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(void *)(a1 + 48));
      if (v7)
      {
        id v8 = (void *)v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v17 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = *(void *)(a1 + 56);
          SEL v20 = [*(id *)(a1 + 48) descriptionWithAddress];
          [v17 handleFailureInMethod:v19, v18, @"ACSURLSession.m", 1739, @"ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@", v18, v8, v20, @"ACSURLSessionDownloadTask" object file lineNumber description];
        }
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        void v21[2] = __78__ACSURLSession_URLSession_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke_2;
        v21[3] = &unk_1E6CC3D30;
        id v9 = v5;
        uint64_t v10 = *(void *)(a1 + 32);
        id v22 = v9;
        uint64_t v23 = v10;
        id v24 = v8;
        long long v25 = *(_OWORD *)(a1 + 64);
        id v11 = v8;
        [v6 addOperationWithBlock:v21];
      }
    }
  }
}

uint64_t __78__ACSURLSession_URLSession_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) downloadTask:*(void *)(a1 + 48) didResumeAtOffset:*(void *)(a1 + 56) expectedTotalBytes:*(void *)(a1 + 64)];
}

- (void)URLSession:(id)a3 readClosedForStreamTask:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3A8];
  v12[0] = @"session";
  v12[1] = @"nsurlTask";
  v13[0] = self;
  v13[1] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v11 = [v8 exceptionWithName:v9 reason:@"ACSURLSession does not support stream tasks" userInfo:v10];

  objc_exception_throw(v11);
}

- (void)URLSession:(id)a3 writeClosedForStreamTask:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3A8];
  v12[0] = @"session";
  v12[1] = @"nsurlTask";
  v13[0] = self;
  v13[1] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v11 = [v8 exceptionWithName:v9 reason:@"ACSURLSession does not support stream tasks" userInfo:v10];

  objc_exception_throw(v11);
}

- (void)URLSession:(id)a3 betterRouteDiscoveredForStreamTask:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3A8];
  v12[0] = @"session";
  v12[1] = @"nsurlTask";
  v13[0] = self;
  v13[1] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v11 = [v8 exceptionWithName:v9 reason:@"ACSURLSession does not support stream tasks" userInfo:v10];

  objc_exception_throw(v11);
}

- (void)URLSession:(id)a3 streamTask:(id)a4 didBecomeInputStream:(id)a5 outputStream:(id)a6
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v15 = *MEMORY[0x1E4F1C3A8];
  v18[0] = @"session";
  v18[1] = @"nsurlTask";
  v19[0] = self;
  v19[1] = v11;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  id v17 = [v14 exceptionWithName:v15 reason:@"ACSURLSession does not support stream tasks" userInfo:v16];

  objc_exception_throw(v17);
}

- (BOOL)canUseCachingServer
{
  return self->_canUseCachingServer;
}

- (void)setCanUseCachingServer:(BOOL)a3
{
  self->_canUseCachingServer = a3;
}

- (OS_os_log)_logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_logHandle:(id)a3
{
}

- (OS_dispatch_queue)_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_queue:(id)a3
{
}

- (NSURLSession)_nsurlSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 32, 1);
}

- (void)set_nsurlSession:(id)a3
{
}

- (NSDictionary)_locateOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_locateOptions:(id)a3
{
}

- (ACSURLSessionDelegate)_clientDelegate
{
  return (ACSURLSessionDelegate *)objc_getProperty(self, a2, 48, 1);
}

- (void)set_clientDelegate:(id)a3
{
}

- (NSOperationQueue)_clientDelegateOpQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 56, 1);
}

- (void)set_clientDelegateOpQueue:(id)a3
{
}

- (NSMutableDictionary)_tasks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)set_tasks:(id)a3
{
}

- (int)_phase
{
  return self->__phase;
}

- (void)set_phase:(int)a3
{
  self->__phase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tasks, 0);
  objc_storeStrong((id *)&self->__clientDelegateOpQueue, 0);
  objc_storeStrong((id *)&self->__clientDelegate, 0);
  objc_storeStrong((id *)&self->__locateOptions, 0);
  objc_storeStrong((id *)&self->__nsurlSession, 0);
  objc_storeStrong((id *)&self->__queue, 0);

  objc_storeStrong((id *)&self->__logHandle, 0);
}

- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  uint64_t v19 = 0;
  SEL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  if (v8)
  {
    id v10 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke_2;
    v16[3] = &unk_1E6CC3DA8;
    void v16[4] = self;
    v17[1] = &v19;
    uint64_t v4 = (id *)v17;
    v17[0] = v8;
  }
  else
  {
    id v10 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke;
    void v18[3] = &unk_1E6CC3740;
    void v18[4] = self;
  }
  id v11 = (void *)MEMORY[0x1E01B57E0](v10);
  id v12 = [[ACSURLSessionDataTask alloc] initWithNSURLDataTaskCreator:v11 initialRequest:v7 forSession:self];
  id v13 = (void *)v20[5];
  v20[5] = (uint64_t)v12;

  [(ACSURLSession *)self _addTask:v20[5]];
  id v14 = (id)v20[5];

  if (v9) {
  _Block_object_dispose(&v19, 8);
  }

  return v14;
}

id __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 _nsurlSession];
  uint64_t v5 = [v4 dataTaskWithRequest:v3];

  return v5;
}

id __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _nsurlSession];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke_3;
  v10[3] = &unk_1E6CC3D80;
  v10[4] = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v9;
  long long v11 = v9;
  id v7 = [v5 dataTaskWithRequest:v4 completionHandler:v10];

  return v7;
}

void __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke_4;
    v12[3] = &unk_1E6CC3D58;
    long long v9 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v13 = v10;
    uint64_t v14 = v11;
    [v9 _dataTask:v4 completedWithData:a2 response:a3 error:a4 completionHandler:v12];
  }
}

uint64_t __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "set_nsurlTaskCreator:", 0);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return objc_msgSend(v4, "set_internalState:", 2);
}

- (id)dataTaskWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F290D0];
  id v7 = a4;
  id v8 = [v6 requestWithURL:a3];
  long long v9 = [(ACSURLSession *)self dataTaskWithRequest:v8 completionHandler:v7];

  return v9;
}

- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  int64_t v28 = __Block_byref_object_copy_;
  __int16 v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  if (v10)
  {
    uint64_t v11 = v20;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke_2;
    v20[3] = &unk_1E6CC3DD0;
    void v20[4] = self;
    id v12 = &v21;
    id v21 = v9;
    v22[1] = &v25;
    id v13 = (id *)v22;
    uint64_t v14 = v10;
  }
  else
  {
    uint64_t v11 = v23;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke;
    v23[3] = &unk_1E6CC3768;
    void v23[4] = self;
    id v13 = (id *)&v24;
    uint64_t v14 = v9;
    id v12 = (id *)&v24;
  }
  *id v13 = v14;
  uint64_t v15 = (void *)MEMORY[0x1E01B57E0](v11);
  id v16 = [[ACSURLSessionUploadTask alloc] initWithNSURLUploadTaskCreator:v15 initialRequest:v8 forSession:self];
  id v17 = (void *)v26[5];
  v26[5] = (uint64_t)v16;

  [(ACSURLSession *)self _addTask:v26[5]];
  id v18 = (id)v26[5];

  if (v10) {
  _Block_object_dispose(&v25, 8);
  }

  return v18;
}

id __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _nsurlSession];
  id v6 = [v5 uploadTaskWithRequest:v4 fromFile:*(void *)(a1 + 40)];

  return v6;
}

id __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _nsurlSession];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke_3;
  void v11[3] = &unk_1E6CC3D80;
  uint64_t v6 = *(void *)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v10;
  long long v12 = v10;
  id v8 = [v5 uploadTaskWithRequest:v4 fromFile:v6 completionHandler:v11];

  return v8;
}

void __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke_4;
    v12[3] = &unk_1E6CC3D58;
    id v9 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v13 = v10;
    uint64_t v14 = v11;
    [v9 _dataTask:v4 completedWithData:a2 response:a3 error:a4 completionHandler:v12];
  }
}

uint64_t __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "set_nsurlTaskCreator:", 0);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return objc_msgSend(v4, "set_internalState:", 2);
}

- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  int64_t v28 = __Block_byref_object_copy_;
  __int16 v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  if (v10)
  {
    uint64_t v11 = v20;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke_2;
    v20[3] = &unk_1E6CC3DD0;
    void v20[4] = self;
    long long v12 = &v21;
    id v21 = v9;
    v22[1] = &v25;
    id v13 = (id *)v22;
    uint64_t v14 = v10;
  }
  else
  {
    uint64_t v11 = v23;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke;
    v23[3] = &unk_1E6CC3768;
    void v23[4] = self;
    id v13 = (id *)&v24;
    uint64_t v14 = v9;
    long long v12 = (id *)&v24;
  }
  *id v13 = v14;
  uint64_t v15 = (void *)MEMORY[0x1E01B57E0](v11);
  id v16 = [[ACSURLSessionUploadTask alloc] initWithNSURLUploadTaskCreator:v15 initialRequest:v8 forSession:self];
  id v17 = (void *)v26[5];
  v26[5] = (uint64_t)v16;

  [(ACSURLSession *)self _addTask:v26[5]];
  id v18 = (id)v26[5];

  if (v10) {
  _Block_object_dispose(&v25, 8);
  }

  return v18;
}

id __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _nsurlSession];
  uint64_t v6 = [v5 uploadTaskWithRequest:v4 fromData:*(void *)(a1 + 40)];

  return v6;
}

id __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _nsurlSession];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke_3;
  void v11[3] = &unk_1E6CC3D80;
  uint64_t v6 = *(void *)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v10;
  long long v12 = v10;
  id v8 = [v5 uploadTaskWithRequest:v4 fromData:v6 completionHandler:v11];

  return v8;
}

void __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke_4;
    v12[3] = &unk_1E6CC3D58;
    id v9 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v13 = v10;
    uint64_t v14 = v11;
    [v9 _dataTask:v4 completedWithData:a2 response:a3 error:a4 completionHandler:v12];
  }
}

uint64_t __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "set_nsurlTaskCreator:", 0);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return objc_msgSend(v4, "set_internalState:", 2);
}

- (id)downloadTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  uint64_t v19 = 0;
  SEL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  if (v8)
  {
    id v10 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke_2;
    v16[3] = &unk_1E6CC3DF8;
    void v16[4] = self;
    v17[1] = &v19;
    uint64_t v4 = (id *)v17;
    v17[0] = v8;
  }
  else
  {
    id v10 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke;
    void v18[3] = &unk_1E6CC37B8;
    void v18[4] = self;
  }
  uint64_t v11 = (void *)MEMORY[0x1E01B57E0](v10);
  long long v12 = [[ACSURLSessionDownloadTask alloc] initWithNSURLDownloadTaskCreator:v11 initialRequest:v7 forSession:self];
  id v13 = (void *)v20[5];
  void v20[5] = (uint64_t)v12;

  [(ACSURLSession *)self _addTask:v20[5]];
  id v14 = (id)v20[5];

  if (v9) {
  _Block_object_dispose(&v19, 8);
  }

  return v14;
}

id __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 _nsurlSession];
  uint64_t v5 = [v4 downloadTaskWithRequest:v3];

  return v5;
}

id __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _nsurlSession];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke_3;
  v10[3] = &unk_1E6CC3948;
  v10[4] = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v9;
  long long v11 = v9;
  id v7 = [v5 downloadTaskWithRequest:v4 completionHandler:v10];

  return v7;
}

void __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke_4;
    v12[3] = &unk_1E6CC3920;
    long long v9 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v13 = v10;
    uint64_t v14 = v11;
    [v9 _downloadTask:v4 completedWithLocation:a2 response:a3 error:a4 completionHandler:v12];
  }
}

uint64_t __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "set_nsurlTaskCreator:", 0);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return objc_msgSend(v4, "set_internalState:", 2);
}

- (id)downloadTaskWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F290D0];
  id v7 = a4;
  id v8 = [v6 requestWithURL:a3];
  long long v9 = [(ACSURLSession *)self downloadTaskWithRequest:v8 completionHandler:v7];

  return v9;
}

- (void)initWithConfiguration:canUseCachingServer:locateOptions:delegate:delegateQueue:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DD432000, v0, v1, "new session %@", v2, v3, v4, v5, v6);
}

- (void)_cancelTask:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD432000, v0, v1, "_cancelTask:%@ self=%@");
}

void __29__ACSURLSession__cancelTask___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_cancelDownloadTask:byProducingResumeData:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DD432000, v0, v1, "_cancelDownloadTask:%@ task already completed", v2, v3, v4, v5, v6);
}

- (void)_cancelDownloadTask:byProducingResumeData:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD432000, v0, v1, "_cancelDownloadTask:%@ self=%@");
}

void __59__ACSURLSession__cancelDownloadTask_byProducingResumeData___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1DD432000, v0, OS_LOG_TYPE_FAULT, "ACSURLSession failed to convert resume data: %{public}@", v1, 0xCu);
}

- (void)_suspendTask:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD432000, v0, v1, "_suspendTask:%@ self=%@");
}

void __30__ACSURLSession__suspendTask___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_resumeTask:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DD432000, v0, v1, "_resumeTask:%@ task is aleady completed", v2, v3, v4, v5, v6);
}

- (void)_resumeTask:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD432000, v0, v1, "_resumeTask:%@ self=%@");
}

@end