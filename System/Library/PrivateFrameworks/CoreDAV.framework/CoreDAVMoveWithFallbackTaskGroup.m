@interface CoreDAVMoveWithFallbackTaskGroup
- (BOOL)useFallback;
- (CoreDAVMoveWithFallbackTaskGroup)initWithSourceURL:(id)a3 destinationURL:(id)a4 AccountInfoProvider:(id)a5 taskManager:(id)a6;
- (NSData)dataPayload;
- (NSDictionary)responseHeaders;
- (NSString)dataContentType;
- (NSString)nextETag;
- (NSString)previousETag;
- (NSURL)destinationURL;
- (NSURL)sourceURL;
- (id)description;
- (int)overwrite;
- (void)_completedMoveTask:(id)a3;
- (void)_completedPutTask:(id)a3;
- (void)setDataContentType:(id)a3;
- (void)setDataPayload:(id)a3;
- (void)setOverwrite:(int)a3;
- (void)setPreviousETag:(id)a3;
- (void)setUseFallback:(BOOL)a3;
- (void)startTaskGroup;
@end

@implementation CoreDAVMoveWithFallbackTaskGroup

- (CoreDAVMoveWithFallbackTaskGroup)initWithSourceURL:(id)a3 destinationURL:(id)a4 AccountInfoProvider:(id)a5 taskManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CoreDAVMoveWithFallbackTaskGroup;
  v15 = [(CoreDAVTaskGroup *)&v25 initWithAccountInfoProvider:v13 taskManager:v14];
  if (v15)
  {
    if (v11
      && ([v11 CDVRawPath],
          v16 = objc_claimAutoreleasedReturnValue(),
          uint64_t v17 = [v16 length],
          v16,
          v17))
    {
      if (v12
        && ([v12 CDVRawPath],
            v18 = objc_claimAutoreleasedReturnValue(),
            uint64_t v19 = [v18 length],
            v18,
            v19))
      {
        if (![v11 isEqual:v12])
        {
          objc_storeStrong((id *)&v15->_sourceURL, a3);
          objc_storeStrong((id *)&v15->_destinationURL, a4);
          goto LABEL_8;
        }
        v21 = (void *)MEMORY[0x263EFF940];
        uint64_t v22 = *MEMORY[0x263EFF4A0];
        v23 = @"The value for sourceURL and the value for destinationURL must not be the same.";
      }
      else
      {
        v21 = (void *)MEMORY[0x263EFF940];
        uint64_t v22 = *MEMORY[0x263EFF4A0];
        v23 = @"Non-nil and non-zero length destinationURL required.";
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x263EFF940];
      uint64_t v22 = *MEMORY[0x263EFF4A0];
      v23 = @"Non-nil and non-zero length sourceURL required.";
    }
    id v24 = [v21 exceptionWithName:v22 reason:v23 userInfo:0];
    objc_exception_throw(v24);
  }
LABEL_8:

  return v15;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"CoreDAVMoveWithFallbackTaskGroup:"];
  [v3 appendFormat:@"\n\tSource url: %@", self->_sourceURL];
  [v3 appendFormat:@"\n\tDestination url: %@", self->_destinationURL];
  [v3 appendFormat:@"\n\tPrevious Etag: %@", self->_previousETag];
  objc_msgSend(v3, "appendFormat:", @"\n\tOverwrite: %i", self->_overwrite);
  objc_msgSend(v3, "appendFormat:", @"\n\tUseFallback: %i", self->_useFallback);
  return v3;
}

- (void)startTaskGroup
{
  v3 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  v5 = [v3 logHandleForAccountInfoProvider:WeakRetained];

  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_213BFC000, v5, OS_LOG_TYPE_INFO, "[move] Move task group starting with move", (uint8_t *)buf, 2u);
  }

  v6 = [CoreDAVMoveTask alloc];
  v7 = [(CoreDAVMoveWithFallbackTaskGroup *)self sourceURL];
  v8 = [(CoreDAVMoveWithFallbackTaskGroup *)self destinationURL];
  v9 = [(CoreDAVCopyOrMoveTask *)v6 initWithSourceURL:v7 destinationURL:v8 andOverwrite:[(CoreDAVMoveWithFallbackTaskGroup *)self overwrite]];

  [(CoreDAVMoveTask *)v9 setPreviousETag:self->_previousETag];
  v10 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [(CoreDAVTask *)v9 setAccountInfoProvider:v10];

  [(CoreDAVTask *)v9 setTimeoutInterval:self->super._timeoutInterval];
  objc_initWeak(buf, v9);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __50__CoreDAVMoveWithFallbackTaskGroup_startTaskGroup__block_invoke;
  v15 = &unk_2641DFC60;
  objc_copyWeak(&v17, buf);
  v16 = self;
  [(CoreDAVTask *)v9 setCompletionBlock:&v12];
  -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v9, v12, v13, v14, v15);
  id v11 = [(CoreDAVTaskGroup *)self taskManager];
  [v11 submitQueuedCoreDAVTask:v9];

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);
}

uint64_t __50__CoreDAVMoveWithFallbackTaskGroup_startTaskGroup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [*(id *)(*(void *)(a1 + 32) + 32) removeObject:WeakRetained];
    id WeakRetained = (id)[*(id *)(a1 + 32) _completedMoveTask:v5];
    id v3 = v5;
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

- (void)_completedMoveTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 error];
  v6 = v5;
  if (!v5)
  {
    v9 = [v4 responseHeaders];
    responseHeaders = self->_responseHeaders;
    self->_responseHeaders = v9;

    [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:0];
    id v11 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    uint64_t v13 = [(CoreDAVPutTask *)v11 logHandleForAccountInfoProvider:WeakRetained];

    if (!v13 || !os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    LOWORD(buf[0]) = 0;
    id v14 = "[move] Move succeded";
    goto LABEL_18;
  }
  v7 = [v5 domain];
  if ([v7 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"]) {
    uint64_t v8 = [v6 code];
  }
  else {
    uint64_t v8 = 0;
  }

  if (!self->_useFallback || (unint64_t)(v8 - 403) >= 3 && v8 != 501)
  {
    [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v6 delegateCallbackBlock:0];
    id v11 = +[CoreDAVLogging sharedLogging];
    id v20 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    uint64_t v13 = [(CoreDAVPutTask *)v11 logHandleForAccountInfoProvider:v20];

    if (!v13 || !os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    LOWORD(buf[0]) = 0;
    id v14 = "[move] Move failed";
LABEL_18:
    _os_log_impl(&dword_213BFC000, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)buf, 2u);
LABEL_19:

    goto LABEL_20;
  }
  v15 = +[CoreDAVLogging sharedLogging];
  id v16 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  id v17 = [v15 logHandleForAccountInfoProvider:v16];

  if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_213BFC000, v17, OS_LOG_TYPE_INFO, "[move] Move failed, trying a PUT", (uint8_t *)buf, 2u);
  }

  id v11 = [(CoreDAVPostOrPutTask *)[CoreDAVPutTask alloc] initWithDataPayload:self->_dataPayload dataContentType:self->_dataContentType atURL:self->_destinationURL previousETag:0];
  id v18 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  [(CoreDAVTask *)v11 setAccountInfoProvider:v18];

  objc_initWeak(buf, v11);
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __55__CoreDAVMoveWithFallbackTaskGroup__completedMoveTask___block_invoke;
  id v24 = &unk_2641DFC60;
  objc_copyWeak(&v26, buf);
  objc_super v25 = self;
  [(CoreDAVTask *)v11 setCompletionBlock:&v21];
  -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v11, v21, v22, v23, v24);
  uint64_t v19 = [(CoreDAVTaskGroup *)self taskManager];
  [v19 submitQueuedCoreDAVTask:v11];

  objc_destroyWeak(&v26);
  objc_destroyWeak(buf);
LABEL_20:
}

uint64_t __55__CoreDAVMoveWithFallbackTaskGroup__completedMoveTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [*(id *)(*(void *)(a1 + 32) + 32) removeObject:WeakRetained];
    id WeakRetained = (id)[*(id *)(a1 + 32) _completedPutTask:v5];
    id v3 = v5;
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

- (void)_completedPutTask:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 error];
  v6 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  uint64_t v8 = [v6 logHandleForAccountInfoProvider:WeakRetained];

  if (v5)
  {
    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213BFC000, v8, OS_LOG_TYPE_INFO, "[move] Move PUT failed", buf, 2u);
    }

    [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v5 delegateCallbackBlock:0];
  }
  else
  {
    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213BFC000, v8, OS_LOG_TYPE_INFO, "[move] PUT succeded, doing a DELETE now", buf, 2u);
    }

    v9 = +[CoreDAVLogging sharedLogging];
    id v10 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v11 = [v9 logHandleForAccountInfoProvider:v10];

    if (v11)
    {
      uint64_t v12 = v11;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [v4 responseHeaders];
        *(_DWORD *)buf = 138412290;
        id v26 = v13;
        _os_log_impl(&dword_213BFC000, v12, OS_LOG_TYPE_INFO, "[move] PUT Responses are: %@", buf, 0xCu);
      }
    }

    id v14 = [v4 nextETag];
    nextETag = self->_nextETag;
    self->_nextETag = v14;

    id v16 = [(CoreDAVTask *)[CoreDAVDeleteTask alloc] initWithURL:self->_sourceURL];
    id v17 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    [(CoreDAVTask *)v16 setAccountInfoProvider:v17];

    objc_initWeak((id *)buf, v16);
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __54__CoreDAVMoveWithFallbackTaskGroup__completedPutTask___block_invoke;
    uint64_t v22 = &unk_2641DFC60;
    objc_copyWeak(&v24, (id *)buf);
    v23 = self;
    [(CoreDAVTask *)v16 setCompletionBlock:&v19];
    -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v16, v19, v20, v21, v22);
    id v18 = [(CoreDAVTaskGroup *)self taskManager];
    [v18 submitQueuedCoreDAVTask:v16];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
}

void __54__CoreDAVMoveWithFallbackTaskGroup__completedPutTask___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = +[CoreDAVLogging sharedLogging];
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    id v5 = [v3 logHandleForAccountInfoProvider:v4];

    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = [WeakRetained error];
        int v10 = 138412290;
        id v11 = v7;
        _os_log_impl(&dword_213BFC000, v6, OS_LOG_TYPE_INFO, "[move] DELETE completed with error: %@", (uint8_t *)&v10, 0xCu);
      }
    }

    [*(id *)(*(void *)(a1 + 32) + 32) removeObject:WeakRetained];
    uint64_t v8 = *(void **)(a1 + 32);
    v9 = [WeakRetained error];
    [v8 finishCoreDAVTaskGroupWithError:v9 delegateCallbackBlock:0];
  }
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (int)overwrite
{
  return self->_overwrite;
}

- (void)setOverwrite:(int)a3
{
  self->_overwrite = a3;
}

- (BOOL)useFallback
{
  return self->_useFallback;
}

- (void)setUseFallback:(BOOL)a3
{
  self->_useFallback = a3;
}

- (NSString)previousETag
{
  return self->_previousETag;
}

- (void)setPreviousETag:(id)a3
{
}

- (NSData)dataPayload
{
  return self->_dataPayload;
}

- (void)setDataPayload:(id)a3
{
}

- (NSString)dataContentType
{
  return self->_dataContentType;
}

- (void)setDataContentType:(id)a3
{
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (NSString)nextETag
{
  return self->_nextETag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextETag, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_dataContentType, 0);
  objc_storeStrong((id *)&self->_dataPayload, 0);
  objc_storeStrong((id *)&self->_previousETag, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

@end