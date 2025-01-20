@interface QLThumbnailRequestOperation
+ (id)operationWithThumbnailRequest:(id)a3;
- (BOOL)_finishIfNeeded;
- (BOOL)isAsynchronous;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)wantsBaseline;
- (NSError)thumbnailRequestInvalidError;
- (OS_dispatch_queue)serialResponseQueue;
- (QLThumbnailGenerationRequest)request;
- (QLThumbnailRepresentation)mostRepresentativeThumbnail;
- (QLThumbnailRequestOperation)initWithFPItem:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 iconMode:(BOOL)a7;
- (QLThumbnailRequestOperation)initWithFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5;
- (QLThumbnailRequestOperation)initWithFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6;
- (QLThumbnailRequestOperation)initWithThumbnailRequest:(id)a3;
- (double)minimumDimension;
- (id)requestCompletionBlock;
- (id)requestUpdateBlock;
- (id)sharedSerialResponseQueue;
- (id)thumbnailRequestGenerationWillStartBlock;
- (int64_t)generationBehavior;
- (unint64_t)badgeType;
- (unint64_t)requestedTypes;
- (void)__finishWithError:(id)a3;
- (void)_finish;
- (void)_finishIfRequestIsInvalid;
- (void)_finishWithError:(id)a3;
- (void)cancel;
- (void)main;
- (void)setBadgeType:(unint64_t)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setGenerationBehavior:(int64_t)a3;
- (void)setMinimumDimension:(double)a3;
- (void)setMostRepresentativeThumbnail:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestCompletionBlock:(id)a3;
- (void)setRequestUpdateBlock:(id)a3;
- (void)setRequestedTypes:(unint64_t)a3;
- (void)setSerialResponseQueue:(id)a3;
- (void)setThumbnailRequestGenerationWillStartBlock:(id)a3;
- (void)setThumbnailRequestInvalidError:(id)a3;
- (void)setWantsBaseline:(BOOL)a3;
- (void)start;
@end

@implementation QLThumbnailRequestOperation

- (QLThumbnailRequestOperation)initWithFPItem:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 iconMode:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  v14 = -[QLTUbiquitousFileThumbnailRequest initWithFPItem:size:minimumDimension:scale:iconMode:]([QLTUbiquitousFileThumbnailRequest alloc], "initWithFPItem:size:minimumDimension:scale:iconMode:", v13, v7, width, height, a5, a6);

  v15 = [(QLThumbnailRequestOperation *)self initWithThumbnailRequest:v14];
  return v15;
}

- (QLThumbnailRequestOperation)initWithFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  return -[QLThumbnailRequestOperation initWithFileAtURL:size:scale:iconMode:](self, "initWithFileAtURL:size:scale:iconMode:", a3, 0, a4.width, a4.height, a5);
}

- (QLThumbnailRequestOperation)initWithFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v18 = 0;
  v12 = -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:]([QLTFileThumbnailRequest alloc], "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:", v11, v6, &v18, width, height, 0.0, a5);

  id v13 = v18;
  id v14 = v18;
  v15 = [(QLThumbnailRequestOperation *)self initWithThumbnailRequest:v12];
  v16 = v15;
  if (v15) {
    objc_storeStrong((id *)&v15->_thumbnailRequestInvalidError, v13);
  }

  return v16;
}

- (QLThumbnailRequestOperation)initWithThumbnailRequest:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)QLThumbnailRequestOperation;
  v5 = [(QLThumbnailRequestOperation *)&v12 init];
  if (v5)
  {
    [v4 setRequestedTypes:-1];
    uint64_t v6 = +[QLThumbnailGenerationRequest requestWithThumbnailRequest:v4];
    request = v5->_request;
    v5->_request = (QLThumbnailGenerationRequest *)v6;

    v8 = [(QLThumbnailRequestOperation *)v5 sharedSerialResponseQueue];
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.quicklook.thumbnailRequestOperation", 0, v8);
    serialResponseQueue = v5->_serialResponseQueue;
    v5->_serialResponseQueue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

- (id)sharedSerialResponseQueue
{
  if (sharedSerialResponseQueue_onceToken != -1) {
    dispatch_once(&sharedSerialResponseQueue_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedSerialResponseQueue__sharedSerialResponseQueue;

  return v2;
}

uint64_t __56__QLThumbnailRequestOperation_sharedSerialResponseQueue__block_invoke()
{
  sharedSerialResponseQueue__sharedSerialResponseQueue = (uint64_t)dispatch_queue_create("com.apple.quicklook.thumbnailRequestOperation.sharedResponseQueue", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)operationWithThumbnailRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithThumbnailRequest:v4];

  return v5;
}

- (void)setMinimumDimension:(double)a3
{
}

- (double)minimumDimension
{
  [(QLThumbnailGenerationRequest *)self->_request minimumDimension];
  return result;
}

- (void)setRequestedTypes:(unint64_t)a3
{
}

- (unint64_t)requestedTypes
{
  return [(QLThumbnailGenerationRequest *)self->_request representationTypes];
}

- (void)setWantsBaseline:(BOOL)a3
{
}

- (BOOL)wantsBaseline
{
  return [(QLThumbnailGenerationRequest *)self->_request wantsBaseline];
}

- (void)setGenerationBehavior:(int64_t)a3
{
}

- (int64_t)generationBehavior
{
  return [(QLThumbnailGenerationRequest *)self->_request generationBehavior];
}

- (unint64_t)badgeType
{
  return [(QLThumbnailGenerationRequest *)self->_request badgeType];
}

- (void)setBadgeType:(unint64_t)a3
{
}

- (void)setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    [(QLThumbnailRequestOperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = a3;
    [(QLThumbnailRequestOperation *)self didChangeValueForKey:@"isFinished"];
  }
}

- (void)setExecuting:(BOOL)a3
{
  if (self->_executing != a3)
  {
    [(QLThumbnailRequestOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = a3;
    [(QLThumbnailRequestOperation *)self didChangeValueForKey:@"isExecuting"];
  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)start
{
  v2 = self;
  objc_sync_enter(v2);
  [(QLThumbnailRequestOperation *)v2 setExecuting:1];
  objc_sync_exit(v2);

  [(QLThumbnailRequestOperation *)v2 main];
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  v4.receiver = v2;
  v4.super_class = (Class)QLThumbnailRequestOperation;
  [(QLThumbnailRequestOperation *)&v4 cancel];
  v3 = +[QLThumbnailGenerator sharedGenerator];
  [v3 cancelRequest:v2->_request];

  objc_sync_exit(v2);
}

- (void)_finish
{
}

- (void)_finishWithError:(id)a3
{
  id v5 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  [(QLThumbnailRequestOperation *)v4 __finishWithError:v5];
  objc_sync_exit(v4);
}

- (void)__finishWithError:(id)a3
{
  id v4 = a3;
  if (![(QLThumbnailRequestOperation *)self isFinished])
  {
    [(QLThumbnailRequestOperation *)self setExecuting:0];
    [(QLThumbnailRequestOperation *)self setFinished:1];
    serialResponseQueue = self->_serialResponseQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__QLThumbnailRequestOperation___finishWithError___block_invoke;
    v6[3] = &unk_1E6009870;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(serialResponseQueue, v6);
  }
}

void __49__QLThumbnailRequestOperation___finishWithError___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) requestCompletionBlock];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);

    if (v3)
    {
      id v4 = qltLogHandles[0];
      if (!qltLogHandles[0])
      {
        QLTInitLogging();
        id v4 = qltLogHandles[0];
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v5 = *(void **)(a1 + 32);
        uint64_t v6 = v4;
        id v7 = [v5 request];
        uint64_t v8 = *(void *)(a1 + 40);
        int v10 = 138412546;
        id v11 = v7;
        __int16 v12 = 2112;
        uint64_t v13 = v8;
        _os_log_impl(&dword_1B281E000, v6, OS_LOG_TYPE_INFO, "Calling requestCompletionBlock for %@ with error: %@", (uint8_t *)&v10, 0x16u);
      }
      dispatch_queue_t v9 = [*(id *)(a1 + 32) requestCompletionBlock];
      v9[2](v9, 0, *(void *)(a1 + 40));

      [*(id *)(a1 + 32) setRequestUpdateBlock:0];
      [*(id *)(a1 + 32) setRequestCompletionBlock:0];
    }
  }
}

- (void)_finishIfRequestIsInvalid
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_request) {
    [(QLThumbnailRequestOperation *)obj __finishWithError:obj->_thumbnailRequestInvalidError];
  }
  objc_sync_exit(obj);
}

- (BOOL)_finishIfNeeded
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(QLThumbnailRequestOperation *)v2 isCancelled]
    && [(QLThumbnailRequestOperation *)v2 isExecuting])
  {
    uint64_t v3 = +[QLThumbnailGenerator errorWithCode:5 request:v2->_request additionalUserInfo:0];
    [(QLThumbnailRequestOperation *)v2 __finishWithError:v3];
  }
  else if (!v2->_request && [(QLThumbnailRequestOperation *)v2 isExecuting])
  {
    [(QLThumbnailRequestOperation *)v2 __finishWithError:v2->_thumbnailRequestInvalidError];
  }
  objc_sync_exit(v2);

  return [(QLThumbnailRequestOperation *)v2 isFinished];
}

- (void)main
{
  if (![(QLThumbnailRequestOperation *)self _finishIfNeeded])
  {
    objc_initWeak(&location, self);
    uint64_t v3 = +[QLThumbnailGenerator sharedGenerator];
    request = self->_request;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __35__QLThumbnailRequestOperation_main__block_invoke;
    v9[3] = &unk_1E6009898;
    objc_copyWeak(&v10, &location);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__QLThumbnailRequestOperation_main__block_invoke_2;
    v7[3] = &unk_1E60098C0;
    objc_copyWeak(&v8, &location);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __35__QLThumbnailRequestOperation_main__block_invoke_3;
    v5[3] = &unk_1E60098E8;
    objc_copyWeak(&v6, &location);
    [v3 generateThumbnailForRequest:request updateHandler:v9 statusHandler:v7 completionHandler:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __35__QLThumbnailRequestOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a2;
  id v6 = a4;
  if (v12)
  {
    id v7 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v7);
    dispatch_queue_t v9 = [WeakRetained requestUpdateBlock];

    if (v9)
    {
      id v10 = objc_loadWeakRetained(v7);
      id v11 = [v10 requestUpdateBlock];
      ((void (**)(void, id))v11)[2](v11, v12);
    }
  }
}

void __35__QLThumbnailRequestOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    v2 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = [WeakRetained thumbnailRequestGenerationWillStartBlock];

    if (v4)
    {
      id v9 = objc_loadWeakRetained(v2);
      id v5 = [v9 thumbnailRequestGenerationWillStartBlock];
      id v6 = objc_loadWeakRetained(v2);
      id v7 = [v6 request];
      id v8 = [v7 contentTypeUTI];
      ((void (**)(void, void *))v5)[2](v5, v8);
    }
  }
}

void __35__QLThumbnailRequestOperation_main__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v6);
  id v8 = [WeakRetained requestCompletionBlock];

  if (v8)
  {
    id v9 = objc_loadWeakRetained(v6);
    id v10 = [v9 requestCompletionBlock];
    ((void (**)(void, id, id))v10)[2](v10, v12, v5);
  }
  id v11 = objc_loadWeakRetained(v6);
  [v11 _finish];
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (id)requestUpdateBlock
{
  return self->_requestUpdateBlock;
}

- (void)setRequestUpdateBlock:(id)a3
{
}

- (id)requestCompletionBlock
{
  return self->_requestCompletionBlock;
}

- (void)setRequestCompletionBlock:(id)a3
{
}

- (OS_dispatch_queue)serialResponseQueue
{
  return self->_serialResponseQueue;
}

- (void)setSerialResponseQueue:(id)a3
{
}

- (QLThumbnailGenerationRequest)request
{
  return (QLThumbnailGenerationRequest *)objc_getProperty(self, a2, 288, 1);
}

- (void)setRequest:(id)a3
{
}

- (id)thumbnailRequestGenerationWillStartBlock
{
  return self->_thumbnailRequestGenerationWillStartBlock;
}

- (void)setThumbnailRequestGenerationWillStartBlock:(id)a3
{
}

- (QLThumbnailRepresentation)mostRepresentativeThumbnail
{
  return self->_mostRepresentativeThumbnail;
}

- (void)setMostRepresentativeThumbnail:(id)a3
{
}

- (NSError)thumbnailRequestInvalidError
{
  return self->_thumbnailRequestInvalidError;
}

- (void)setThumbnailRequestInvalidError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailRequestInvalidError, 0);
  objc_storeStrong((id *)&self->_mostRepresentativeThumbnail, 0);
  objc_storeStrong(&self->_thumbnailRequestGenerationWillStartBlock, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_serialResponseQueue, 0);
  objc_storeStrong(&self->_requestCompletionBlock, 0);
  objc_storeStrong(&self->_requestUpdateBlock, 0);

  objc_storeStrong((id *)&self->_beginDate, 0);
}

@end