@interface __NSCFBackgroundAVAggregateAssetDownloadTask
- (AVURLAsset)URLAsset;
- (BOOL)_isAVAssetTask;
- (BOOL)isKindOfClass:(Class)a3;
- (__NSCFBackgroundAVAggregateAssetDownloadTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5;
- (id)cookiesForCurrentRequest;
- (id)currentRequest;
- (id)originalRequest;
- (id)response;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6;
- (void)_onqueue_cancel;
- (void)_onqueue_resume;
- (void)_onqueue_suspend;
- (void)dealloc;
- (void)setURLAsset:(id)a3;
@end

@implementation __NSCFBackgroundAVAggregateAssetDownloadTask

- (void)setURLAsset:(id)a3
{
}

- (AVURLAsset)URLAsset
{
  return (AVURLAsset *)objc_getProperty(self, a2, 792, 1);
}

- (id)cookiesForCurrentRequest
{
  return 0;
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7
{
  v12 = [(NSURLSessionTask *)self session];
  if (v12) {
    v12 = (NSURLSession *)v12->_workQueue;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v13 = *(_OWORD *)&a5->var0.var3;
  long long v18 = *(_OWORD *)&a5->var0.var0;
  long long v19 = v13;
  long long v14 = *(_OWORD *)&a5->var1.var1;
  long long v15 = *(_OWORD *)&a7->var1.var1;
  long long v16 = *(_OWORD *)&a7->var0.var0;
  long long v22 = *(_OWORD *)&a7->var0.var3;
  long long v23 = v15;
  block[2] = __140____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_assetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke;
  block[3] = &unk_1E5254FB0;
  block[4] = self;
  block[5] = a4;
  block[6] = a6;
  long long v20 = v14;
  long long v21 = v16;
  dispatch_async(&v12->super, block);
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadToURL:(id)a5
{
  v8 = [(NSURLSessionTask *)self session];
  if (v8) {
    v8 = (NSURLSession *)v8->_workQueue;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_assetDownloadTask_willDownloadToURL___block_invoke;
  block[3] = &unk_1E52582F0;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(&v8->super, block);
}

- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6
{
  v10 = [(NSURLSessionTask *)self session];
  if (v10) {
    v10 = (NSURLSession *)v10->_workQueue;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_task_willBeginDelayedRequest_completionHandler___block_invoke;
  v11[3] = &unk_1E52571D8;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a5;
  v11[7] = a6;
  dispatch_async(&v10->super, v11);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  v8 = [(NSURLSessionTask *)self session];
  if (v8) {
    v8 = (NSURLSession *)v8->_workQueue;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_task_didCompleteWithError___block_invoke;
  block[3] = &unk_1E52582F0;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(&v8->super, block);
}

- (void)_onqueue_cancel
{
  v2 = self;
  if (self) {
    self = (__NSCFBackgroundAVAggregateAssetDownloadTask *)self->_childAssetDownloadSession;
  }
  [(__NSCFBackgroundAVAggregateAssetDownloadTask *)self invalidateAndCancel];
  v3.receiver = v2;
  v3.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
  [(__NSCFBackgroundSessionTask *)&v3 _onqueue_cancel];
}

- (void)_onqueue_suspend
{
  v2 = self;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
  [(__NSCFBackgroundSessionTask *)&v12 _onqueue_suspend];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  if (v2) {
    v2 = (__NSCFBackgroundAVAggregateAssetDownloadTask *)v2->_childAssetDownloadTasks;
  }
  uint64_t v3 = [(__NSCFBackgroundAVAggregateAssetDownloadTask *)v2 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (!objc_msgSend(v7, "state", (void)v8)) {
          [v7 suspend];
        }
      }
      uint64_t v4 = [(__NSCFBackgroundAVAggregateAssetDownloadTask *)v2 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_onqueue_resume
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
  [(__NSCFBackgroundSessionTask *)&v13 _onqueue_resume];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  if (self) {
    childAssetDownloadTasks = self->_childAssetDownloadTasks;
  }
  else {
    childAssetDownloadTasks = 0;
  }
  uint64_t v4 = [(NSArray *)childAssetDownloadTasks countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(childAssetDownloadTasks);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "state", (void)v9) == 1)
        {
          objc_msgSend(v8, "setEarliestBeginDate:", -[NSURLSessionTask earliestBeginDate](self, "earliestBeginDate"));
          [v8 resume];
        }
      }
      uint64_t v5 = [(NSArray *)childAssetDownloadTasks countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (BOOL)_isAVAssetTask
{
  return 1;
}

- (id)response
{
}

- (id)currentRequest
{
}

- (id)originalRequest
{
}

- (BOOL)isKindOfClass:(Class)a3
{
  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
  if (-[__NSCFBackgroundAVAggregateAssetDownloadTask isKindOfClass:](&v6, sel_isKindOfClass_)) {
    return 1;
  }
  gotLoadHelper_x8__OBJC_CLASS___AVAggregateAssetDownloadTask(v4);
  return [(objc_class *)a3 isEqual:objc_opt_class()];
}

- (void)dealloc
{
  objc_setProperty_atomic_copy(self, v3, 0, 816);
  objc_setProperty_atomic_copy(self, v4, 0, 824);
  [(__NSCFBackgroundAVAggregateAssetDownloadTask *)self setURLAsset:0];
  objc_setProperty_atomic_copy(self, v5, 0, 832);
  objc_setProperty_atomic(self, v6, 0, 808);
  v7.receiver = self;
  v7.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
  [(__NSCFBackgroundSessionTask *)&v7 dealloc];
}

- (__NSCFBackgroundAVAggregateAssetDownloadTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
  SEL v6 = [(__NSCFBackgroundSessionTask *)&v15 initWithTaskInfo:a3 taskGroup:a4 ident:a5];
  if (v6)
  {
    if ([a3 initializedWithAVAsset])
    {
      v6->_AVAssetDownloadToken = [a3 AVAssetDownloadToken];
      objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "AVAssetDownloadToken"));
      double Helper_x8__OBJC_CLASS___AVURLAsset = gotLoadHelper_x8__OBJC_CLASS___AVURLAsset(v7);
      long long v10 = *(void **)(v9 + 1744);
      long long v16 = @"AVURLAssetDownloadTokenKey";
      v17[0] = v11;
      -[__NSCFBackgroundAVAggregateAssetDownloadTask setURLAsset:](v6, "setURLAsset:", objc_msgSend(v10, "URLAssetWithURL:options:", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1, Helper_x8__OBJC_CLASS___AVURLAsset)));
      v6->_childAssetDownloadTasksSessionIdentifier = (NSString *)(id)[a3 avAssetDownloadChildDownloadSessionIdentifier];
      if (v6->_childAssetDownloadTasksSessionIdentifier)
      {
        isa = [(NSURLSessionTask *)v6 session];
        if (isa) {
          isa = isa[15].isa;
        }
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __81____NSCFBackgroundAVAggregateAssetDownloadTask_initWithTaskInfo_taskGroup_ident___block_invoke;
        v14[3] = &unk_1E5258228;
        v14[4] = v6;
        dispatch_async(isa, v14);
      }
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

@end