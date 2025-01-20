@interface C2NetworkingDelegateURLSession
+ (id)sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (C2NetworkingDelegate)networkingDelegate;
- (NSOperationQueue)delegateQueue;
- (NSString)sessionDescription;
- (NSURLSessionConfiguration)configuration;
- (NSURLSessionDelegate)sessionDelegate;
- (id)dataTaskWithRequest:(id)a3;
- (void)invalidateAndCancel;
- (void)setConfiguration:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setNetworkingDelegate:(id)a3;
- (void)setSessionDelegate:(id)a3;
- (void)setSessionDescription:(id)a3;
@end

@implementation C2NetworkingDelegateURLSession

+ (id)sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(C2NetworkingDelegateURLSession);
  [(C2NetworkingDelegateURLSession *)v10 setSessionDelegate:v8];

  [(C2NetworkingDelegateURLSession *)v10 setConfiguration:v9];
  [(C2NetworkingDelegateURLSession *)v10 setDelegateQueue:v7];

  return v10;
}

- (id)dataTaskWithRequest:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(C2NetworkingDelegateURLSessionDataTask);
  [(C2NetworkingDelegateURLSessionDataTask *)v5 setSession:self];
  [(C2NetworkingDelegateURLSessionDataTask *)v5 setCurrentRequest:v4];
  [(C2NetworkingDelegateURLSessionDataTask *)v5 setOriginalRequest:v4];

  return v5;
}

- (void)invalidateAndCancel
{
  v3 = [(C2NetworkingDelegateURLSession *)self delegateQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__C2NetworkingDelegateURLSession_invalidateAndCancel__block_invoke;
  v5[3] = &unk_1E6CCBF00;
  v5[4] = self;
  [v3 addOperationWithBlock:v5];

  id v4 = [(C2NetworkingDelegateURLSession *)self delegateQueue];
  [v4 waitUntilAllOperationsAreFinished];
}

void __53__C2NetworkingDelegateURLSession_invalidateAndCancel__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionDelegate];
  [v2 URLSession:*(void *)(a1 + 32) didBecomeInvalidWithError:0];
}

- (C2NetworkingDelegate)networkingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkingDelegate);
  return (C2NetworkingDelegate *)WeakRetained;
}

- (void)setNetworkingDelegate:(id)a3
{
}

- (NSString)sessionDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSessionDescription:(id)a3
{
}

- (NSOperationQueue)delegateQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSURLSessionConfiguration)configuration
{
  return (NSURLSessionConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (NSURLSessionDelegate)sessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDelegate);
  return (NSURLSessionDelegate *)WeakRetained;
}

- (void)setSessionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_sessionDescription, 0);
  objc_destroyWeak((id *)&self->_networkingDelegate);
}

@end