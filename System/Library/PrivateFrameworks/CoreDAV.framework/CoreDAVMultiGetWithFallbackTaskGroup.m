@interface CoreDAVMultiGetWithFallbackTaskGroup
- (BOOL)shouldIgnoreResponseErrors;
- (CoreDAVMultiGetWithFallbackTaskGroup)initWithURLs:(id)a3 multiGetBlock:(id)a4 getBlock:(id)a5 accountInfoProvider:(id)a6 taskManager:(id)a7;
- (NSError)error;
- (NSSet)deletedURLs;
- (NSSet)missingURLs;
- (NSSet)parsedContents;
- (void)_configureAndSubmitTask:(id)a3;
- (void)_fetchOneItem;
- (void)_switchToSingleGetMode;
- (void)setShouldIgnoreResponseErrors:(BOOL)a3;
- (void)startTaskGroup;
@end

@implementation CoreDAVMultiGetWithFallbackTaskGroup

- (CoreDAVMultiGetWithFallbackTaskGroup)initWithURLs:(id)a3 multiGetBlock:(id)a4 getBlock:(id)a5 accountInfoProvider:(id)a6 taskManager:(id)a7
{
  id v12 = a3;
  v13 = (void (**)(id, id))a4;
  id v14 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CoreDAVMultiGetWithFallbackTaskGroup;
  v15 = [(CoreDAVTaskGroup *)&v23 initWithAccountInfoProvider:a6 taskManager:a7];
  if (v15)
  {
    uint64_t v16 = v13[2](v13, v12);
    multiGetTask = v15->_multiGetTask;
    v15->_multiGetTask = (CoreDAVContainerMultiGetTask *)v16;

    uint64_t v18 = [v12 mutableCopy];
    urls = v15->_urls;
    v15->_urls = (NSMutableSet *)v18;

    uint64_t v20 = [v14 copy];
    id getBlock = v15->_getBlock;
    v15->_id getBlock = (id)v20;

    v15->_usingMultiGet = 1;
  }

  return v15;
}

- (void)_configureAndSubmitTask:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v4 setAccountInfoProvider:v5];

  [(CoreDAVTaskGroup *)self timeoutInterval];
  objc_msgSend(v4, "setTimeoutInterval:");
  [(NSMutableSet *)self->super._outstandingTasks addObject:v4];
  id v6 = [(CoreDAVTaskGroup *)self taskManager];
  [v4 submitWithTaskManager:v6];
}

- (void)_switchToSingleGetMode
{
  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  parsedContents = self->_parsedContents;
  self->_parsedContents = v3;

  self->_usingMultiGet = 0;
}

- (void)_fetchOneItem
{
  v3 = [(NSMutableSet *)self->_urls anyObject];
  if (v3)
  {
    [(NSMutableSet *)self->_urls removeObject:v3];
    id v4 = (*((void (**)(void))self->_getBlock + 2))();
    objc_initWeak(&location, v4);
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    v7 = __53__CoreDAVMultiGetWithFallbackTaskGroup__fetchOneItem__block_invoke;
    v8 = &unk_2641DFD00;
    objc_copyWeak(&v11, &location);
    v9 = self;
    id v10 = v3;
    [v4 setCompletionBlock:&v5];
    -[CoreDAVMultiGetWithFallbackTaskGroup _configureAndSubmitTask:](self, "_configureAndSubmitTask:", v4, v5, v6, v7, v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v4 = [(CoreDAVMultiGetWithFallbackTaskGroup *)self error];
    [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v4 delegateCallbackBlock:0];
  }
}

void __53__CoreDAVMultiGetWithFallbackTaskGroup__fetchOneItem__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) removeObject:WeakRetained];
    v3 = [WeakRetained error];
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 domain];
      if ([v5 isEqualToString:@"CoreDAVErrorDomain"])
      {
        uint64_t v6 = [v4 code];

        if (v6 == 1) {
          goto LABEL_17;
        }
      }
      else
      {
      }
      v9 = +[CoreDAVLogging sharedLogging];
      id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      id v11 = [v9 logHandleForAccountInfoProvider:v10];

      if (v11)
      {
        id v12 = v11;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *(void *)(a1 + 40);
          id v14 = [WeakRetained error];
          int v16 = 138412546;
          uint64_t v17 = v13;
          __int16 v18 = 2112;
          v19 = v14;
          _os_log_impl(&dword_213BFC000, v12, OS_LOG_TYPE_DEFAULT, "CoreDAVMultiGetWithFallbackTaskGroup: encountered error in single-item fetch at %@, error: %@", (uint8_t *)&v16, 0x16u);
        }
      }

      v8 = *(unsigned char **)(a1 + 32);
      if (!v8[88])
      {
        v15 = [WeakRetained error];
        [v8 finishCoreDAVTaskGroupWithError:v15 delegateCallbackBlock:0];

        goto LABEL_17;
      }
    }
    else
    {
      v7 = [WeakRetained appSpecificDataItemResult];
      if (v7) {
        [*(id *)(*(void *)(a1 + 32) + 120) addObject:v7];
      }

      v8 = *(unsigned char **)(a1 + 32);
    }
    [v8 _fetchOneItem];
LABEL_17:
  }
}

- (void)startTaskGroup
{
  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_multiGetTask);
  multiGetTask = self->_multiGetTask;
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __54__CoreDAVMultiGetWithFallbackTaskGroup_startTaskGroup__block_invoke;
  v7 = &unk_2641E0B28;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  [(CoreDAVTask *)multiGetTask setCompletionBlock:&v4];
  -[CoreDAVMultiGetWithFallbackTaskGroup _configureAndSubmitTask:](self, "_configureAndSubmitTask:", self->_multiGetTask, v4, v5, v6, v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __54__CoreDAVMultiGetWithFallbackTaskGroup_startTaskGroup__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2 && WeakRetained)
  {
    [WeakRetained[4] removeObject:v2];
    v3 = [v2 error];
    if (!v3
      || ([WeakRetained error], uint64_t v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
    {
      uint64_t v5 = [WeakRetained error];
      [WeakRetained finishCoreDAVTaskGroupWithError:v5 delegateCallbackBlock:0];

LABEL_6:
      goto LABEL_7;
    }
    uint64_t v6 = [v3 domain];
    if ([v6 isEqualToString:@"CoreDAVErrorDomain"])
    {
      uint64_t v7 = [v3 code];

      if (v7 == 1) {
        goto LABEL_6;
      }
    }
    else
    {
    }
    [WeakRetained _switchToSingleGetMode];
    [WeakRetained _fetchOneItem];
    goto LABEL_6;
  }
LABEL_7:
}

- (NSError)error
{
  id v2 = [(CoreDAVTask *)self->_multiGetTask error];
  v3 = [v2 domain];
  int v4 = [v3 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"];

  if (v4 && [v2 code] >= 500 && objc_msgSend(v2, "code") <= 599) {
    id v5 = v2;
  }
  else {
    id v5 = 0;
  }

  return (NSError *)v5;
}

- (NSSet)missingURLs
{
  v3 = [(CoreDAVMultiGetWithFallbackTaskGroup *)self error];

  if (v3)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = [(CoreDAVContainerMultiGetTask *)self->_multiGetTask missingURLs];
  }
  return (NSSet *)v4;
}

- (NSSet)deletedURLs
{
  v3 = [(CoreDAVMultiGetWithFallbackTaskGroup *)self error];

  if (v3)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = [(CoreDAVContainerMultiGetTask *)self->_multiGetTask deletedURLs];
  }
  return (NSSet *)v4;
}

- (NSSet)parsedContents
{
  if (self->_usingMultiGet)
  {
    id v2 = [(CoreDAVContainerMultiGetTask *)self->_multiGetTask parsedContents];
  }
  else
  {
    id v2 = self->_parsedContents;
  }
  return (NSSet *)v2;
}

- (BOOL)shouldIgnoreResponseErrors
{
  return self->_shouldIgnoreResponseErrors;
}

- (void)setShouldIgnoreResponseErrors:(BOOL)a3
{
  self->_shouldIgnoreResponseErrors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedContents, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong(&self->_getBlock, 0);
  objc_storeStrong((id *)&self->_multiGetTask, 0);
}

@end