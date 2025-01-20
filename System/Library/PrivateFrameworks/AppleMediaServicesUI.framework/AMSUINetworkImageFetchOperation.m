@interface AMSUINetworkImageFetchOperation
+ (id)keyPathsForValuesAffectingIsExecuting;
+ (id)keyPathsForValuesAffectingIsFinished;
- (AMSUINetworkImageFetchOperation)initWithURL:(id)a3 URLSession:(id)a4;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (NSURL)url;
- (NSURLSession)URLSession;
- (NSURLSessionTask)sessionTask;
- (float)_sessionTaskPriorityForQueuePriority:(int64_t)a3;
- (id)_eagerlyDecompressImage:(id)a3;
- (void)_didCompleteTaskWithData:(id)a3 error:(id)a4;
- (void)cancel;
- (void)setQueuePriority:(int64_t)a3;
- (void)setSessionTask:(id)a3;
- (void)setURLSession:(id)a3;
- (void)setUrl:(id)a3;
- (void)start;
@end

@implementation AMSUINetworkImageFetchOperation

- (AMSUINetworkImageFetchOperation)initWithURL:(id)a3 URLSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSUINetworkImageFetchOperation;
  v9 = [(AMSUINetworkImageFetchOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_URLSession, a4);
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"isCancelled", 0);
}

- (BOOL)isExecuting
{
  if ([(AMSUINetworkImageFetchOperation *)self isCancelled]) {
    return 0;
  }
  v4 = [(AMSUINetworkImageFetchOperation *)self sessionTask];
  BOOL v3 = [v4 state] == 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"isCancelled", @"isExecuting", 0);
}

- (BOOL)isFinished
{
  if ([(AMSUINetworkImageFetchOperation *)self isCancelled]) {
    return 1;
  }
  v4 = [(AMSUINetworkImageFetchOperation *)self sessionTask];
  BOOL v3 = [v4 state] == 3;

  return v3;
}

- (void)setQueuePriority:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AMSUINetworkImageFetchOperation;
  -[AMSUIAssetFetchOperation setQueuePriority:](&v10, sel_setQueuePriority_);
  v5 = [(AMSUINetworkImageFetchOperation *)self sessionTask];

  if (v5)
  {
    [(AMSUINetworkImageFetchOperation *)self _sessionTaskPriorityForQueuePriority:a3];
    int v7 = v6;
    id v8 = [(AMSUINetworkImageFetchOperation *)self sessionTask];
    LODWORD(v9) = v7;
    [v8 setPriority:v9];
  }
}

- (void)start
{
  BOOL v3 = (void *)MEMORY[0x263F08BD8];
  v4 = [(AMSUINetworkImageFetchOperation *)self url];
  v5 = [v3 requestWithURL:v4];

  objc_initWeak(&location, self);
  int v6 = [(AMSUINetworkImageFetchOperation *)self URLSession];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __40__AMSUINetworkImageFetchOperation_start__block_invoke;
  v19 = &unk_2643E4070;
  objc_copyWeak(&v20, &location);
  int v7 = [v6 dataTaskWithRequest:v5 completionHandler:&v16];
  -[AMSUINetworkImageFetchOperation setSessionTask:](self, "setSessionTask:", v7, v16, v17, v18, v19);

  [(AMSUINetworkImageFetchOperation *)self _sessionTaskPriorityForQueuePriority:[(AMSUINetworkImageFetchOperation *)self queuePriority]];
  int v9 = v8;
  objc_super v10 = [(AMSUINetworkImageFetchOperation *)self sessionTask];
  LODWORD(v11) = v9;
  [v10 setPriority:v11];

  objc_super v12 = [(AMSUINetworkImageFetchOperation *)self sessionTask];
  uint64_t v13 = [v12 state];

  int v14 = [(AMSUINetworkImageFetchOperation *)self isCancelled] ^ 1;
  if (v13 != 2) {
    int v14 = 1;
  }
  if (v14 == 1 && v13 == 1)
  {
    [(AMSUINetworkImageFetchOperation *)self willChangeValueForKey:@"isExecuting"];
    v15 = [(AMSUINetworkImageFetchOperation *)self sessionTask];
    [v15 resume];

    [(AMSUINetworkImageFetchOperation *)self didChangeValueForKey:@"isExecuting"];
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __40__AMSUINetworkImageFetchOperation_start__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _didCompleteTaskWithData:v7 error:v6];
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUINetworkImageFetchOperation;
  [(AMSUIAssetFetchOperation *)&v4 cancel];
  BOOL v3 = [(AMSUINetworkImageFetchOperation *)self sessionTask];
  [v3 cancel];
}

- (float)_sessionTaskPriorityForQueuePriority:(int64_t)a3
{
  *((void *)&v4 + 1) = a3;
  *(void *)&long long v4 = a3 + 8;
  unint64_t v3 = v4 >> 2;
  float result = 1.0;
  if (v3 <= 4) {
    return flt_21C2CE2B0[v3];
  }
  return result;
}

- (void)_didCompleteTaskWithData:(id)a3 error:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (([(AMSUINetworkImageFetchOperation *)self isCancelled] & 1) == 0)
  {
    [(AMSUINetworkImageFetchOperation *)self willChangeValueForKey:@"isExecuting"];
    [(AMSUINetworkImageFetchOperation *)self didChangeValueForKey:@"isExecuting"];
    if (v13)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x263F827E8], "imageWithData:");
      if (v7)
      {
        int v8 = (void *)v7;
        int v9 = [(AMSUINetworkImageFetchOperation *)self _eagerlyDecompressImage:v7];

        if (v9)
        {
          objc_super v10 = self;
          double v11 = v9;
          objc_super v12 = 0;
LABEL_9:
          [(AMSUIAssetFetchOperation *)v10 _finishWithImage:v11 error:v12];

          goto LABEL_10;
        }
      }
    }
    else if (v6)
    {
      [(AMSUIAssetFetchOperation *)self _finishWithImage:0 error:v6];
      goto LABEL_10;
    }
    int v9 = AMSError();
    objc_super v10 = self;
    double v11 = 0;
    objc_super v12 = v9;
    goto LABEL_9;
  }
LABEL_10:
}

- (id)_eagerlyDecompressImage:(id)a3
{
  id v3 = a3;
  [v3 size];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  [v3 scale];
  CGFloat v9 = v8;
  v13.width = v5;
  v13.height = v7;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v9);
  objc_msgSend(v3, "drawAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  objc_super v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v10;
}

- (NSURLSessionTask)sessionTask
{
  return self->_sessionTask;
}

- (void)setSessionTask:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSURLSession)URLSession
{
  return self->_URLSession;
}

- (void)setURLSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sessionTask, 0);
}

@end