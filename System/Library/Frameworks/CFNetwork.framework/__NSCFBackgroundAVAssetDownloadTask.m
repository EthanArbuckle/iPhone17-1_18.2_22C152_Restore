@interface __NSCFBackgroundAVAssetDownloadTask
- (AVURLAsset)URLAsset;
- (BOOL)_isAVAssetTask;
- (BOOL)isKindOfClass:(Class)a3;
- (NSArray)loadedTimeRanges;
- (NSDictionary)options;
- (NSURL)URL;
- (NSURL)destinationURL;
- (__NSCFBackgroundAVAssetDownloadTask)initWithTaskGroup:(id)a3 URLAsset:(id)a4 URL:(id)a5 destinationURL:(id)a6 temporaryDestinationURL:(id)a7 assetTitle:(id)a8 assetArtworkData:(id)a9 ident:(unint64_t)a10 enableSPIDelegateCallbacks:(BOOL)a11;
- (__NSCFBackgroundAVAssetDownloadTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5;
- (id)cookiesForCurrentRequest;
- (id)currentRequest;
- (id)originalRequest;
- (id)progress;
- (id)response;
- (unint64_t)AVAssetDownloadToken;
- (void)_finishProgressReporting;
- (void)_onqueue_didFinishDownloadingToURL:(id)a3;
- (void)_onqueue_didFinishWithError:(id)a3;
- (void)_onqueue_didLoadTimeRange:(id)a3 totalTimeRangesLoaded:(id)a4 timeRangeExpectedToLoad:(id)a5 forMediaSelectionPropertyList:(id)a6;
- (void)_onqueue_didReceiveProgressUpdateWithTotalBytesWritten:(int64_t)a3 totalBytesExpectedToWrite:(int64_t)a4;
- (void)_onqueue_didResolveMediaSelectionPropertyList:(id)a3;
- (void)_onqueue_willDownloadToURL:(id)a3;
- (void)_onqueue_willDownloadVariants:(id)a3;
- (void)dealloc;
- (void)setAVAssetDownloadToken:(unint64_t)a3;
- (void)setDestinationURL:(id)a3;
- (void)setLoadedTimeRanges:(id)a3;
- (void)setOptions:(id)a3;
- (void)setURL:(id)a3;
- (void)setURLAsset:(id)a3;
@end

@implementation __NSCFBackgroundAVAssetDownloadTask

- (void)setLoadedTimeRanges:(id)a3
{
}

- (NSArray)loadedTimeRanges
{
  return (NSArray *)objc_getProperty(self, a2, 848, 1);
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 840, 1);
}

- (void)setURLAsset:(id)a3
{
}

- (AVURLAsset)URLAsset
{
  return (AVURLAsset *)objc_getProperty(self, a2, 832, 1);
}

- (void)setDestinationURL:(id)a3
{
}

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 824, 1);
}

- (void)setURL:(id)a3
{
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 816, 1);
}

- (void)setAVAssetDownloadToken:(unint64_t)a3
{
  self->_AVAssetDownloadToken = a3;
}

- (unint64_t)AVAssetDownloadToken
{
  return self->_AVAssetDownloadToken;
}

- (id)cookiesForCurrentRequest
{
  return 0;
}

- (void)_finishProgressReporting
{
  if (!self->_didCleanupProgress)
  {
    self->_didCleanupProgress = 1;
    p_progressLock = &self->_progressLock;
    os_unfair_lock_lock(&self->_progressLock);
    if (![(NSURLSessionTask *)self error] && ![(NSProgress *)self->_progress isFinished]) {
      [(NSProgress *)self->_progress setCompletedUnitCount:[(NSProgress *)self->_progress totalUnitCount]];
    }
    [(NSProgress *)self->_progress setCancellationHandler:0];
    [(NSProgress *)self->_progress setPausingHandler:0];
    [(NSProgress *)self->_progress setResumingHandler:0];
    os_unfair_lock_unlock(p_progressLock);
  }
}

- (id)progress
{
  p_progressLock = &self->_progressLock;
  os_unfair_lock_lock(&self->_progressLock);
  if (!self->_progress)
  {
    if ([(NSURLSessionTask *)self countOfBytesExpectedToReceive] < 1) {
      int64_t v4 = -1;
    }
    else {
      int64_t v4 = [(NSURLSessionTask *)self countOfBytesExpectedToReceive];
    }
    self->_progress = (NSProgress *)(id)[MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v4];
    if ([(NSURLSessionTask *)self countOfBytesReceived] >= 1) {
      [(NSProgress *)self->_progress setCompletedUnitCount:[(NSURLSessionTask *)self countOfBytesReceived]];
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47____NSCFBackgroundAVAssetDownloadTask_progress__block_invoke;
    v8[3] = &unk_1E5258228;
    v8[4] = self;
    [(NSProgress *)self->_progress setCancellationHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47____NSCFBackgroundAVAssetDownloadTask_progress__block_invoke_2;
    v7[3] = &unk_1E5258228;
    v7[4] = self;
    [(NSProgress *)self->_progress setPausingHandler:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47____NSCFBackgroundAVAssetDownloadTask_progress__block_invoke_3;
    v6[3] = &unk_1E5258228;
    v6[4] = self;
    [(NSProgress *)self->_progress setResumingHandler:v6];
  }
  os_unfair_lock_unlock(p_progressLock);
  return self->_progress;
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
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v3 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412546;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    v8 = self;
    _os_log_debug_impl(&dword_184085000, v3, OS_LOG_TYPE_DEBUG, "%@<%p> simulating currentRequest property", (uint8_t *)&v5, 0x16u);
  }
  return +[NSURLRequest requestWithURL:self->_URL];
}

- (id)originalRequest
{
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)__NSCFBackgroundAVAssetDownloadTask;
  if (-[__NSCFBackgroundAVAssetDownloadTask isKindOfClass:](&v5, sel_isKindOfClass_)
    || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

- (void)_onqueue_willDownloadVariants:(id)a3
{
  if ([(NSURLSessionTask *)self session])
  {
    if (objc_opt_respondsToSelector())
    {
      objc_super v5 = [(NSURLSessionTask *)self session];
      if (v5)
      {
        delegate_ivar = v5->_delegate_ivar;
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __66__NSURLSession_delegate_AVAssetDownloadTask_willDownloadVariants___block_invoke;
        v7[3] = &unk_1E5256948;
        v7[4] = delegate_ivar;
        void v7[5] = v5;
        v7[6] = self;
        v7[7] = a3;
        if (v5->_delegateDispatchQueue) {
          dispatch_async((dispatch_queue_t)v5->_delegateDispatchQueue, v7);
        }
        else {
          [(NSOperationQueue *)v5->_delegateQueue_ivar addOperationWithBlock:v7];
        }
      }
    }
  }
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_super v5 = (void *)[a3 domain];
    if (![v5 isEqualToString:*MEMORY[0x1E4F289A0]]) {
      goto LABEL_20;
    }
    uint64_t v6 = [a3 code];
    if (!self || v6 != -999) {
      goto LABEL_20;
    }
  }
  else if (!self)
  {
    goto LABEL_20;
  }
  if (objc_getProperty(self, a2, 856, 1))
  {
    __int16 v7 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    if (objc_msgSend(v7, "fileExistsAtPath:", objc_msgSend(objc_getProperty(self, v8, 856, 1), "path")))
    {
      uint64_t v20 = 0;
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", -[NSURL path](-[__NSCFBackgroundAVAssetDownloadTask destinationURL](self, "destinationURL"), "path"))&& (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", -[__NSCFBackgroundAVAssetDownloadTask destinationURL](self, "destinationURL"), &v20) & 1) == 0)
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        uint64_t v9 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = v20;
          v18 = [(__NSCFBackgroundAVAssetDownloadTask *)self destinationURL];
          *(_DWORD *)buf = 138412546;
          uint64_t v22 = v17;
          __int16 v23 = 2112;
          v24 = v18;
          _os_log_error_impl(&dword_184085000, v9, OS_LOG_TYPE_ERROR, "Background download error %@ removing item at %@", buf, 0x16u);
        }
      }
      v10 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      if ((objc_msgSend(v10, "linkItemAtURL:toURL:error:", objc_getProperty(self, v11, 856, 1), -[__NSCFBackgroundAVAssetDownloadTask destinationURL](self, "destinationURL"), &v20) & 1) == 0)
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v12 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = v20;
          Property = (NSURL *)objc_getProperty(self, v13, 856, 1);
          v16 = [(__NSCFBackgroundAVAssetDownloadTask *)self destinationURL];
          *(_DWORD *)buf = 138412802;
          uint64_t v22 = v14;
          __int16 v23 = 2112;
          v24 = Property;
          __int16 v25 = 2112;
          v26 = v16;
          _os_log_error_impl(&dword_184085000, v12, OS_LOG_TYPE_ERROR, "Background download error %@ linking item at %@ to %@", buf, 0x20u);
        }
      }
    }
  }
LABEL_20:
  v19.receiver = self;
  v19.super_class = (Class)__NSCFBackgroundAVAssetDownloadTask;
  [(__NSCFBackgroundSessionTask *)&v19 _onqueue_didFinishWithError:a3];
}

- (void)_onqueue_willDownloadToURL:(id)a3
{
  if ([(__NSCFBackgroundAVAssetDownloadTask *)self URLAsset])
  {
    double Helper_x8__OBJC_CLASS___AVAssetDownloadSession = gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadSession(v5);
    objc_msgSend(*(id *)(v7 + 840), "registerDownloadLocation:forURLAsset:", a3, -[__NSCFBackgroundAVAssetDownloadTask URLAsset](self, "URLAsset", Helper_x8__OBJC_CLASS___AVAssetDownloadSession));
  }
  if ([(NSURLSessionTask *)self session])
  {
    if (objc_opt_respondsToSelector())
    {
      SEL v8 = [(NSURLSessionTask *)self session];
      if (v8)
      {
        delegate_ivar = v8->_delegate_ivar;
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __63__NSURLSession_delegate_AVAssetDownloadTask_willDownloadToURL___block_invoke;
        v10[3] = &unk_1E5256948;
        v10[4] = delegate_ivar;
        v10[5] = v8;
        v10[6] = self;
        v10[7] = a3;
        if (v8->_delegateDispatchQueue) {
          dispatch_async((dispatch_queue_t)v8->_delegateDispatchQueue, v10);
        }
        else {
          [(NSOperationQueue *)v8->_delegateQueue_ivar addOperationWithBlock:v10];
        }
      }
    }
  }
}

- (void)_onqueue_didFinishDownloadingToURL:(id)a3
{
  if ([(NSURLSessionTask *)self session])
  {
    if (objc_opt_respondsToSelector())
    {
      double v5 = [(NSURLSessionTask *)self session];
      if (v5)
      {
        delegate_ivar = v5->_delegate_ivar;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __89__NSURLSession_delegate_AVAssetDownloadTask_didFinishDownloadingToURL_completionHandler___block_invoke;
        block[3] = &unk_1E5257F80;
        block[4] = delegate_ivar;
        block[5] = v5;
        block[6] = self;
        block[7] = a3;
        block[8] = &__block_literal_global_219;
        if (v5->_delegateDispatchQueue) {
          dispatch_async((dispatch_queue_t)v5->_delegateDispatchQueue, block);
        }
        else {
          [(NSOperationQueue *)v5->_delegateQueue_ivar addOperationWithBlock:block];
        }
      }
    }
  }
}

- (void)_onqueue_didResolveMediaSelectionPropertyList:(id)a3
{
  gotLoadHelper_x8__OBJC_CLASS___AVMediaSelection(v3);
  id v7 = (id)objc_msgSend(objc_alloc(*(Class *)(v6 + 1328)), "initWithAsset:propertyList:", -[__NSCFBackgroundAVAssetDownloadTask URLAsset](self, "URLAsset"), a3);
  if (self) {
    objc_setProperty_atomic_copy(self, v8, v7, 880);
  }
  if ([(NSURLSessionTask *)self session] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v9 = [(NSURLSessionTask *)self session];
    SEL v11 = v9;
    if (self)
    {
      id Property = objc_getProperty(self, v10, 880, 1);
      uint64_t v9 = v11;
      v13 = self;
    }
    else
    {
      v13 = 0;
      id Property = 0;
    }
    -[NSURLSession delegate_AVAssetDownloadTask:didResolveMediaSelection:]((uint64_t)v9, (uint64_t)v13, (uint64_t)Property);
  }
}

- (void)_onqueue_didLoadTimeRange:(id)a3 totalTimeRangesLoaded:(id)a4 timeRangeExpectedToLoad:(id)a5 forMediaSelectionPropertyList:(id)a6
{
  [(__NSCFBackgroundAVAssetDownloadTask *)self setLoadedTimeRanges:a4];
  if ([(NSURLSessionTask *)self session] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = [(NSURLSessionTask *)self session];
    if (a3)
    {
      [a3 CMTimeRangeValue];
      if (a5) {
        goto LABEL_5;
      }
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v16 = 0u;
      if (a5)
      {
LABEL_5:
        [a5 CMTimeRangeValue];
        if (!v10) {
          return;
        }
        goto LABEL_9;
      }
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    if (!v10) {
      return;
    }
LABEL_9:
    delegate_ivar = v10->_delegate_ivar;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__NSURLSession_delegate_AVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke;
    block[3] = &unk_1E5256920;
    block[4] = delegate_ivar;
    block[5] = v10;
    long long v20 = v16;
    long long v21 = v17;
    block[6] = self;
    block[7] = a4;
    long long v22 = v18;
    long long v23 = v13;
    long long v24 = v14;
    long long v25 = v15;
    delegateDispatchQueue = v10->_delegateDispatchQueue;
    if (delegateDispatchQueue) {
      dispatch_async(delegateDispatchQueue, block);
    }
    else {
      [(NSOperationQueue *)v10->_delegateQueue_ivar addOperationWithBlock:block];
    }
  }
}

- (void)_onqueue_didReceiveProgressUpdateWithTotalBytesWritten:(int64_t)a3 totalBytesExpectedToWrite:(int64_t)a4
{
  if ([(NSURLSessionTask *)self countOfBytesReceived] != a3
    || [(NSURLSessionTask *)self countOfBytesExpectedToReceive] != a4)
  {
    if (self)
    {
      if (self->_enableSPIDelegateCallbacks)
      {
        if ([(NSURLSessionTask *)self session])
        {
          if (objc_opt_respondsToSelector())
          {
            id v7 = [(NSURLSessionTask *)self session];
            int64_t v8 = [(NSURLSessionTask *)self countOfBytesReceived];
            if (v7)
            {
              int64_t v9 = a3 - v8;
              delegateDispatchQueue = v7->_delegateDispatchQueue;
              delegate_ivar = v7->_delegate_ivar;
              uint64_t v12 = MEMORY[0x1E4F143A8];
              uint64_t v13 = 3221225472;
              long long v14 = __102__NSURLSession_delegate_AVAssetDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
              long long v15 = &unk_1E52568D0;
              long long v16 = delegate_ivar;
              long long v17 = v7;
              long long v18 = self;
              int64_t v19 = v9;
              int64_t v20 = a3;
              int64_t v21 = a4;
              if (delegateDispatchQueue) {
                dispatch_async(delegateDispatchQueue, &v12);
              }
              else {
                [(NSOperationQueue *)v7->_delegateQueue_ivar addOperationWithBlock:&v12];
              }
            }
          }
        }
      }
    }
    -[NSURLSessionTask setCountOfBytesReceived:](self, "setCountOfBytesReceived:", a3, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
    [(NSURLSessionTask *)self setCountOfBytesExpectedToReceive:a4];
    os_unfair_lock_lock(&self->_progressLock);
    [(NSProgress *)self->_progress setTotalUnitCount:a4];
    [(NSProgress *)self->_progress setCompletedUnitCount:a3];
    os_unfair_lock_unlock(&self->_progressLock);
  }
}

- (void)dealloc
{
  [(__NSCFBackgroundAVAssetDownloadTask *)self setURL:0];
  [(__NSCFBackgroundAVAssetDownloadTask *)self setDestinationURL:0];
  if (self)
  {
    objc_setProperty_atomic_copy(self, v3, 0, 856);
    [(__NSCFBackgroundAVAssetDownloadTask *)self setLoadedTimeRanges:0];
    objc_setProperty_atomic_copy(self, v4, 0, 880);
    [(__NSCFBackgroundAVAssetDownloadTask *)self setURLAsset:0];
    objc_setProperty_atomic_copy(self, v5, 0, 872);
    objc_setProperty_atomic_copy(self, v6, 0, 864);
  }
  else
  {
    [0 setLoadedTimeRanges:0];
    [0 setURLAsset:0];
  }
  [(__NSCFBackgroundAVAssetDownloadTask *)self setOptions:0];

  v7.receiver = self;
  v7.super_class = (Class)__NSCFBackgroundAVAssetDownloadTask;
  [(__NSCFBackgroundSessionTask *)&v7 dealloc];
}

- (__NSCFBackgroundAVAssetDownloadTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)__NSCFBackgroundAVAssetDownloadTask;
  SEL v6 = [(__NSCFBackgroundSessionTask *)&v19 initWithTaskInfo:a3 taskGroup:a4 ident:a5];
  if (v6)
  {
    -[__NSCFBackgroundAVAssetDownloadTask setURL:](v6, "setURL:", [a3 URL]);
    -[__NSCFBackgroundAVAssetDownloadTask setDestinationURL:](v6, "setDestinationURL:", [a3 destinationURL]);
    -[__NSCFBackgroundAVAssetDownloadTask setAVAssetDownloadToken:](v6, "setAVAssetDownloadToken:", [a3 AVAssetDownloadToken]);
    if ([a3 initializedWithAVAsset])
    {
      objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "AVAssetDownloadToken"));
      double Helper_x8__OBJC_CLASS___AVURLAsset = gotLoadHelper_x8__OBJC_CLASS___AVURLAsset(v7);
      v10 = *(void **)(v9 + 1744);
      int64_t v20 = @"AVURLAssetDownloadTokenKey";
      v21[0] = v11;
      -[__NSCFBackgroundAVAssetDownloadTask setURLAsset:](v6, "setURLAsset:", objc_msgSend(v10, "URLAssetWithURL:options:", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1, Helper_x8__OBJC_CLASS___AVURLAsset)));
      if ([a3 resolvedMediaSelectionPlist])
      {
        gotLoadHelper_x8__OBJC_CLASS___AVMediaSelection(v12);
        id v14 = (id)objc_msgSend(objc_alloc(*(Class *)(v13 + 1328)), "initWithAsset:propertyList:", -[__NSCFBackgroundAVAssetDownloadTask URLAsset](v6, "URLAsset"), objc_msgSend(a3, "resolvedMediaSelectionPlist"));
        objc_setProperty_atomic_copy(v6, v15, v14, 880);
      }
    }
    long long v16 = (void *)[a3 temporaryDestinationURL];
    objc_setProperty_atomic_copy(v6, v17, v16, 856);
    v6->_enableSPIDelegateCallbacks = [a3 enableSPIDelegateCallbacks];
    v6->_progressLock._os_unfair_lock_opaque = 0;
  }
  return v6;
}

- (__NSCFBackgroundAVAssetDownloadTask)initWithTaskGroup:(id)a3 URLAsset:(id)a4 URL:(id)a5 destinationURL:(id)a6 temporaryDestinationURL:(id)a7 assetTitle:(id)a8 assetArtworkData:(id)a9 ident:(unint64_t)a10 enableSPIDelegateCallbacks:(BOOL)a11
{
  gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadSession(v11);
  if (objc_opt_class())
  {
    v25.receiver = self;
    v25.super_class = (Class)__NSCFBackgroundAVAssetDownloadTask;
    objc_super v19 = [(__NSCFBackgroundSessionTask *)&v25 initWithOriginalRequest:0 ident:a10 taskGroup:a3];
    int64_t v20 = v19;
    if (v19)
    {
      [(__NSCFBackgroundAVAssetDownloadTask *)v19 setURL:a5];
      [(__NSCFBackgroundAVAssetDownloadTask *)v20 setURLAsset:a4];
      [(__NSCFBackgroundAVAssetDownloadTask *)v20 setDestinationURL:a6];
      objc_setProperty_atomic_copy(v20, v21, a7, 856);
      objc_setProperty_atomic_copy(v20, v22, a8, 864);
      objc_setProperty_atomic_copy(v20, v23, a9, 872);
      v20->_enableSPIDelegateCallbacks = a11;
      v20->_progressLock._os_unfair_lock_opaque = 0;
    }
    return v20;
  }
  else
  {
    result = (__NSCFBackgroundAVAssetDownloadTask *)_os_crash();
    __break(1u);
  }
  return result;
}

@end