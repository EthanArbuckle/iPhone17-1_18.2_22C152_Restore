@interface HLPURLSessionTask
+ (HLPURLSessionDelegateResponds)delegateRespondsWithDelegate:(id)a3;
- (BOOL)isCacheData;
- (BOOL)isCancelled;
- (HLPURLSessionDelegate)networkDelegate;
- (HLPURLSessionDelegateResponds)delegateResponds;
- (HLPURLSessionTask)initWithSessionTask:(id)a3 identifier:(id)a4;
- (NSError)dataError;
- (NSHTTPURLResponse)response;
- (NSHashTable)sessionTaskDelegates;
- (NSMutableData)dataTaskData;
- (NSString)identifier;
- (NSString)lastModified;
- (NSURL)URL;
- (NSURLSessionTask)task;
- (float)priority;
- (id)formattedData;
- (int64_t)dataType;
- (unint64_t)downloadTaskTotalBytes;
- (unint64_t)retryCount;
- (void)cancel;
- (void)dealloc;
- (void)didCompleteWithError:(id)a3;
- (void)registerDelegate:(id)a3;
- (void)resume;
- (void)setCancelled:(BOOL)a3;
- (void)setDataError:(id)a3;
- (void)setDataTaskData:(id)a3;
- (void)setDataType:(int64_t)a3;
- (void)setDelegateResponds:(HLPURLSessionDelegateResponds)a3;
- (void)setDownloadTaskTotalBytes:(unint64_t)a3;
- (void)setFormattedData:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsCacheData:(BOOL)a3;
- (void)setLastModified:(id)a3;
- (void)setNetworkDelegate:(id)a3;
- (void)setPriority:(float)a3;
- (void)setResponse:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setSessionTaskDelegates:(id)a3;
- (void)setTask:(id)a3;
- (void)unregisterDelegate:(id)a3;
@end

@implementation HLPURLSessionTask

- (void)dealloc
{
  [(HLPURLSessionTask *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)HLPURLSessionTask;
  [(HLPURLSessionTask *)&v3 dealloc];
}

- (HLPURLSessionTask)initWithSessionTask:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HLPURLSessionTask;
  v9 = [(HLPURLSessionTask *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a4);
    objc_storeStrong((id *)&v10->_task, a3);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.tipsd.urlsessionQueue", 0);
    sessionTaskDelegateQueue = v10->_sessionTaskDelegateQueue;
    v10->_sessionTaskDelegateQueue = (OS_dispatch_queue *)v11;

    v13 = v10->_sessionTaskDelegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__HLPURLSessionTask_initWithSessionTask_identifier___block_invoke;
    block[3] = &unk_264578B58;
    v16 = v10;
    dispatch_sync(v13, block);
  }
  return v10;
}

void __52__HLPURLSessionTask_initWithSessionTask_identifier___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
  [*(id *)(a1 + 32) setSessionTaskDelegates:v2];
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (identifier)
  {
    objc_super v3 = identifier;
  }
  else
  {
    v4 = [(HLPURLSessionTask *)self URL];
    objc_super v3 = [v4 lastPathComponent];
  }
  return v3;
}

- (NSURL)URL
{
  id v2 = [(NSURLSessionTask *)self->_task originalRequest];
  objc_super v3 = [v2 URL];

  return (NSURL *)v3;
}

- (float)priority
{
  [(NSURLSessionTask *)self->_task priority];
  return result;
}

- (void)setPriority:(float)a3
{
  [(NSURLSessionTask *)self->_task priority];
  if (*(float *)&v5 != a3)
  {
    task = self->_task;
    *(float *)&double v5 = a3;
    [(NSURLSessionTask *)task setPriority:v5];
  }
}

+ (HLPURLSessionDelegateResponds)delegateRespondsWithDelegate:(id)a3
{
  id v3 = a3;
  char v4 = objc_opt_respondsToSelector();
  char v5 = objc_opt_respondsToSelector();
  char v6 = objc_opt_respondsToSelector();
  char v7 = objc_opt_respondsToSelector();
  char v8 = objc_opt_respondsToSelector();
  char v9 = objc_opt_respondsToSelector();

  uint64_t v10 = 0x10000000000;
  if ((v4 & 1) == 0) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = 0x100000000;
  if ((v9 & 1) == 0) {
    uint64_t v11 = 0;
  }
  uint64_t v12 = 0x1000000;
  if ((v5 & 1) == 0) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = 0x10000;
  if ((v8 & 1) == 0) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = 256;
  if ((v7 & 1) == 0) {
    uint64_t v14 = 0;
  }
  return (HLPURLSessionDelegateResponds)((v12 | v10) & 0xFFFFFFFFFFFFFFFELL | v6 & 1 | v14 | v13 | v11);
}

- (void)didCompleteWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)[(NSHashTable *)self->_sessionTaskDelegates copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v10++) URLSessionSessionTask:self didCompleteWithError:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HLPURLSessionTask_didCompleteWithError___block_invoke;
  block[3] = &unk_264578B58;
  void block[4] = self;
  dispatch_sync(sessionTaskDelegateQueue, block);
}

void __42__HLPURLSessionTask_didCompleteWithError___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sessionTaskDelegates];
  [v1 removeAllObjects];
}

- (void)registerDelegate:(id)a3
{
  id v4 = a3;
  if (v4 && ![(NSHashTable *)self->_sessionTaskDelegates containsObject:v4])
  {
    sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__HLPURLSessionTask_registerDelegate___block_invoke;
    v6[3] = &unk_264578F50;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(sessionTaskDelegateQueue, v6);
  }
}

void __38__HLPURLSessionTask_registerDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionTaskDelegates];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)unregisterDelegate:(id)a3
{
  id v4 = a3;
  sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __40__HLPURLSessionTask_unregisterDelegate___block_invoke;
  uint64_t v10 = &unk_264578F50;
  uint64_t v11 = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(sessionTaskDelegateQueue, &v7);
  if (![(NSHashTable *)self->_sessionTaskDelegates count]) {
    [(HLPURLSessionTask *)self cancel];
  }
}

void __40__HLPURLSessionTask_unregisterDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionTaskDelegates];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)resume
{
}

- (void)cancel
{
  [(NSURLSessionTask *)self->_task cancel];
  sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__HLPURLSessionTask_cancel__block_invoke;
  block[3] = &unk_264578B58;
  void block[4] = self;
  dispatch_sync(sessionTaskDelegateQueue, block);
  self->_cancelled = 1;
}

void __27__HLPURLSessionTask_cancel__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sessionTaskDelegates];
  [v1 removeAllObjects];
}

- (HLPURLSessionDelegate)networkDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkDelegate);
  return (HLPURLSessionDelegate *)WeakRetained;
}

- (void)setNetworkDelegate:(id)a3
{
}

- (HLPURLSessionDelegateResponds)delegateResponds
{
  return (HLPURLSessionDelegateResponds)(*(unsigned int *)&self->_delegateResponds.willCacheResponse | ((unint64_t)*(unsigned __int16 *)&self->_delegateResponds.didCompleteWithError << 32));
}

- (void)setDelegateResponds:(HLPURLSessionDelegateResponds)a3
{
  self->_delegateResponds = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isCacheData
{
  return self->_isCacheData;
}

- (void)setIsCacheData:(BOOL)a3
{
  self->_isCacheData = a3;
}

- (unint64_t)downloadTaskTotalBytes
{
  return self->_downloadTaskTotalBytes;
}

- (void)setDownloadTaskTotalBytes:(unint64_t)a3
{
  self->_downloadTaskTotalBytes = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int64_t)a3
{
  self->_dataType = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (id)formattedData
{
  return self->_formattedData;
}

- (void)setFormattedData:(id)a3
{
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSString)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
}

- (NSMutableData)dataTaskData
{
  return self->_dataTaskData;
}

- (void)setDataTaskData:(id)a3
{
}

- (NSError)dataError
{
  return self->_dataError;
}

- (void)setDataError:(id)a3
{
}

- (NSHashTable)sessionTaskDelegates
{
  return self->_sessionTaskDelegates;
}

- (void)setSessionTaskDelegates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionTaskDelegates, 0);
  objc_storeStrong((id *)&self->_dataError, 0);
  objc_storeStrong((id *)&self->_dataTaskData, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong(&self->_formattedData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_networkDelegate);
  objc_storeStrong((id *)&self->_sessionTaskDelegateQueue, 0);
}

@end