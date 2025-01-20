@interface __NSCFBackgroundAVAggregateAssetDownloadTaskNoChildTask
- (BOOL)isKindOfClass:(Class)a3;
- (id)currentRequest;
- (id)originalRequest;
- (id)response;
- (void)_onqueue_didFinishDownloadforMediaSelectionPropertyList:(id)a3;
- (void)_onqueue_didLoadTimeRange:(id)a3 totalTimeRangesLoaded:(id)a4 timeRangeExpectedToLoad:(id)a5 forMediaSelectionPropertyList:(id)a6;
- (void)_onqueue_willDownloadToURL:(id)a3;
@end

@implementation __NSCFBackgroundAVAggregateAssetDownloadTaskNoChildTask

- (void)_onqueue_didFinishDownloadforMediaSelectionPropertyList:(id)a3
{
  if ([(NSURLSessionTask *)self session] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    gotLoadHelper_x8__OBJC_CLASS___AVMediaSelection(v5);
    id v7 = (id)objc_msgSend(objc_alloc(*(Class *)(v6 + 1328)), "initWithAsset:propertyList:", -[__NSCFBackgroundAVAssetDownloadTask URLAsset](self, "URLAsset"), a3);
    v8 = [(NSURLSessionTask *)self session];
    -[NSURLSession delegate_AVAggregateAssetDownloadTask:didCompleteForMediaSelection:]((uint64_t)v8, (uint64_t)self, (uint64_t)v7);
  }
}

- (void)_onqueue_willDownloadToURL:(id)a3
{
  if ([(__NSCFBackgroundAVAssetDownloadTask *)self URLAsset])
  {
    double Helper_x8__OBJC_CLASS___AVAssetDownloadSession = gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadSession(v5);
    objc_msgSend(*(id *)(v7 + 840), "registerDownloadLocation:forURLAsset:", a3, -[__NSCFBackgroundAVAssetDownloadTask URLAsset](self, "URLAsset", Helper_x8__OBJC_CLASS___AVAssetDownloadSession));
  }
  if ([(NSURLSessionTask *)self session] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = [(NSURLSessionTask *)self session];
    -[NSURLSession delegate_AVAggregateAssetDownloadTask:willDownloadToURL:]((uint64_t)v8, (uint64_t)self, (uint64_t)a3);
  }
}

- (void)_onqueue_didLoadTimeRange:(id)a3 totalTimeRangesLoaded:(id)a4 timeRangeExpectedToLoad:(id)a5 forMediaSelectionPropertyList:(id)a6
{
  if ([(NSURLSessionTask *)self session] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (a6)
    {
      gotLoadHelper_x8__OBJC_CLASS___AVMediaSelection(v11);
      a6 = (id)objc_msgSend(objc_alloc(*(Class *)(v12 + 1328)), "initWithAsset:propertyList:", -[__NSCFBackgroundAVAssetDownloadTask URLAsset](self, "URLAsset"), a6);
    }
    v13 = [(NSURLSessionTask *)self session];
    if (a3)
    {
      [a3 CMTimeRangeValue];
      if (a5)
      {
LABEL_7:
        [a5 CMTimeRangeValue];
LABEL_10:
        -[NSURLSession delegate_AVAggregateAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelection:]((uint64_t)v13, (uint64_t)self, v15, (uint64_t)a4, v14, (uint64_t)a6);
        return;
      }
    }
    else
    {
      memset(v15, 0, sizeof(v15));
      if (a5) {
        goto LABEL_7;
      }
    }
    memset(v14, 0, sizeof(v14));
    goto LABEL_10;
  }
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
  v6.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTaskNoChildTask;
  if (-[__NSCFBackgroundAVAssetDownloadTask isKindOfClass:](&v6, sel_isKindOfClass_)) {
    return 1;
  }
  gotLoadHelper_x8__OBJC_CLASS___AVAggregateAssetDownloadTask(v4);
  return [(objc_class *)a3 isEqual:objc_opt_class()];
}

@end