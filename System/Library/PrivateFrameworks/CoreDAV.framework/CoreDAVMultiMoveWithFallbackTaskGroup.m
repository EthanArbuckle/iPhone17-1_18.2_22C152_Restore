@interface CoreDAVMultiMoveWithFallbackTaskGroup
- (BOOL)useFallback;
- (CoreDAVMultiMoveWithFallbackTaskGroup)initWithSourceURLs:(id)a3 destinationURL:(id)a4 overwrite:(BOOL)a5 useFallback:(BOOL)a6 sourceEntityDataPayloads:(id)a7 sourceEntityDataContentTypes:(id)a8 sourceEntityETags:(id)a9 accountInfoProvider:(id)a10 taskManager:(id)a11;
- (NSDictionary)sourceEntityDataContentTypes;
- (NSDictionary)sourceEntityDataPayloads;
- (NSDictionary)sourceEntityETags;
- (NSMutableArray)outstandingSourceURLsToMove;
- (NSMutableDictionary)destinationEntityETags;
- (NSMutableSet)destinationURLs;
- (NSSet)sourceURLs;
- (NSURL)destinationURL;
- (id)_eTagFromTaskResponseHeaders:(id)a3;
- (id)description;
- (id)filenameFromURL:(id)a3;
- (id)fullDestinationURLFromSourceURL:(id)a3;
- (int)overwrite;
- (void)_completedMoveTask:(id)a3 sourceURL:(id)a4;
- (void)_completedPutTask:(id)a3 sourceURL:(id)a4;
- (void)_setTagsForDestinationEntityAtURL:(id)a3 fromTaskResponseHeaders:(id)a4 completionBlock:(id)a5;
- (void)processOutstandingTasks;
- (void)setOutstandingSourceURLsToMove:(id)a3;
- (void)startTaskGroup;
@end

@implementation CoreDAVMultiMoveWithFallbackTaskGroup

- (CoreDAVMultiMoveWithFallbackTaskGroup)initWithSourceURLs:(id)a3 destinationURL:(id)a4 overwrite:(BOOL)a5 useFallback:(BOOL)a6 sourceEntityDataPayloads:(id)a7 sourceEntityDataContentTypes:(id)a8 sourceEntityETags:(id)a9 accountInfoProvider:(id)a10 taskManager:(id)a11
{
  BOOL v63 = a6;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id obj = a7;
  id v18 = a7;
  id v62 = a8;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v68.receiver = self;
  v68.super_class = (Class)CoreDAVMultiMoveWithFallbackTaskGroup;
  v23 = [(CoreDAVTaskGroup *)&v68 initWithAccountInfoProvider:v21 taskManager:v22];
  if (!v23) {
    goto LABEL_19;
  }
  if (!v16 || ![v16 count])
  {
    v49 = (void *)MEMORY[0x263EFF940];
    uint64_t v50 = *MEMORY[0x263EFF4A0];
    v51 = @"Non-nil and non-empty sourceURLs set required.";
    goto LABEL_25;
  }
  id v54 = a3;
  id v55 = a4;
  id v56 = v22;
  id v57 = v21;
  id v58 = v20;
  id v59 = v19;
  id v60 = v18;
  if (!v17
    || ([v17 CDVRawPath],
        v24 = objc_claimAutoreleasedReturnValue(),
        uint64_t v25 = [v24 length],
        v24,
        !v25))
  {
    v49 = (void *)MEMORY[0x263EFF940];
    uint64_t v50 = *MEMORY[0x263EFF4A0];
    v51 = @"Non-nil and non-zero length destinationURL required.";
LABEL_25:
    id v52 = [v49 exceptionWithName:v50 reason:v51 userInfo:0];
    objc_exception_throw(v52);
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v26 = v16;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v65 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        v32 = [v31 CDVRawPath];
        uint64_t v33 = [v32 length];

        if (!v33)
        {
          v43 = (void *)MEMORY[0x263EFF940];
          uint64_t v44 = *MEMORY[0x263EFF4A0];
          v45 = NSString;
          v46 = @"Non-zero length sourceURL required.";
          goto LABEL_22;
        }
        v34 = [v31 URLByDeletingLastPathComponent];
        int v35 = [v34 isEqual:v17];

        if (v35)
        {
          v43 = (void *)MEMORY[0x263EFF940];
          uint64_t v44 = *MEMORY[0x263EFF4A0];
          v45 = NSString;
          v53 = v31;
          v46 = @"The value for sourceURL and the value for destinationURL must not be the same. A sourceURL is already present in destination path: %@";
          goto LABEL_22;
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v64 objects:v69 count:16];
    }
    while (v28);
  }

  id v19 = v59;
  id v18 = v60;
  if (v63 && (!v60 || !v59))
  {
    v43 = (void *)MEMORY[0x263EFF940];
    uint64_t v44 = *MEMORY[0x263EFF4A0];
    v45 = NSString;
    v46 = @"Asked to create a taskgroup with fallback, but some required data for PUT is missing.";
LABEL_22:
    v47 = objc_msgSend(v45, "stringWithFormat:", v46, v53, v54, v55);
    id v48 = [v43 exceptionWithName:v44 reason:v47 userInfo:0];

    objc_exception_throw(v48);
  }
  v23->_useFallback = v63;
  objc_storeStrong((id *)&v23->_sourceEntityDataPayloads, obj);
  objc_storeStrong((id *)&v23->_sourceEntityDataContentTypes, v62);
  objc_storeStrong((id *)&v23->_sourceEntityETags, a9);
  objc_storeStrong((id *)&v23->_sourceURLs, v54);
  objc_storeStrong((id *)&v23->_destinationURL, v55);
  uint64_t v36 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", -[NSSet count](v23->_sourceURLs, "count"));
  destinationURLs = v23->_destinationURLs;
  v23->_destinationURLs = (NSMutableSet *)v36;

  v38 = (void *)MEMORY[0x263EFF9A0];
  v39 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)v23 sourceURLs];
  uint64_t v40 = objc_msgSend(v38, "dictionaryWithCapacity:", objc_msgSend(v39, "count"));
  destinationEntityETags = v23->_destinationEntityETags;
  v23->_destinationEntityETags = (NSMutableDictionary *)v40;

  id v21 = v57;
  id v20 = v58;
  id v22 = v56;
LABEL_19:

  return v23;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"CoreDAVMultiMoveWithFallbackTaskGroup:"];
  [v3 appendFormat:@"\n\tSource urls: %@", self->_sourceURLs];
  [v3 appendFormat:@"\n\tDestination url: %@", self->_destinationURL];
  objc_msgSend(v3, "appendFormat:", @"\n\tOverwrite: %i", self->_overwrite);
  return v3;
}

- (id)fullDestinationURLFromSourceURL:(id)a3
{
  v4 = NSURL;
  v5 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self filenameFromURL:a3];
  v6 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self destinationURL];
  v7 = [v4 URLWithString:v5 relativeToURL:v6];

  return v7;
}

- (id)filenameFromURL:(id)a3
{
  return (id)[a3 lastPathComponent];
}

- (void)startTaskGroup
{
  v3 = (void *)MEMORY[0x263EFF980];
  v4 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self sourceURLs];
  v5 = [v4 allObjects];
  v6 = [v3 arrayWithArray:v5];
  outstandingSourceURLsToMove = self->_outstandingSourceURLsToMove;
  self->_outstandingSourceURLsToMove = v6;

  [(CoreDAVMultiMoveWithFallbackTaskGroup *)self processOutstandingTasks];
}

- (void)processOutstandingTasks
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  outstandingSourceURLsToMove = self->_outstandingSourceURLsToMove;
  if (outstandingSourceURLsToMove && [(NSMutableArray *)outstandingSourceURLsToMove count])
  {
    v4 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self outstandingSourceURLsToMove];
    v5 = [v4 lastObject];

    v6 = [CoreDAVMoveTask alloc];
    v7 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self fullDestinationURLFromSourceURL:v5];
    v8 = [(CoreDAVCopyOrMoveTask *)v6 initWithSourceURL:v5 destinationURL:v7 andOverwrite:[(CoreDAVMultiMoveWithFallbackTaskGroup *)self overwrite]];

    v9 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self sourceEntityETags];
    v10 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self filenameFromURL:v5];
    v11 = [v9 objectForKey:v10];
    [(CoreDAVMoveTask *)v8 setPreviousETag:v11];

    v12 = [(CoreDAVTaskGroup *)self accountInfoProvider];
    [(CoreDAVTask *)v8 setAccountInfoProvider:v12];

    [(CoreDAVTask *)v8 setTimeoutInterval:self->super._timeoutInterval];
    objc_initWeak(&location, v8);
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    id v20 = __64__CoreDAVMultiMoveWithFallbackTaskGroup_processOutstandingTasks__block_invoke;
    id v21 = &unk_2641DFD00;
    objc_copyWeak(&v24, &location);
    id v22 = self;
    id v13 = v5;
    id v23 = v13;
    [(CoreDAVTask *)v8 setCompletionBlock:&v18];
    v14 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v16 = [v14 logHandleForAccountInfoProvider:WeakRetained];

    if (v16)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v8;
        _os_log_impl(&dword_213BFC000, v16, OS_LOG_TYPE_INFO, "[multi-move] ~  Multi-move task group starting:\n%@", buf, 0xCu);
      }
    }

    [(NSMutableSet *)self->super._outstandingTasks addObject:v8];
    id v17 = [(CoreDAVTaskGroup *)self taskManager];
    [v17 submitQueuedCoreDAVTask:v8];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:0];
  }
}

uint64_t __64__CoreDAVMultiMoveWithFallbackTaskGroup_processOutstandingTasks__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [*(id *)(*(void *)(a1 + 32) + 32) removeObject:WeakRetained];
    v4 = [*(id *)(a1 + 32) outstandingSourceURLsToMove];
    [v4 removeObject:*(void *)(a1 + 40)];

    id WeakRetained = (id)[*(id *)(a1 + 32) _completedMoveTask:v6 sourceURL:*(void *)(a1 + 40)];
    id v3 = v6;
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

- (void)_setTagsForDestinationEntityAtURL:(id)a3 fromTaskResponseHeaders:(id)a4 completionBlock:(id)a5
{
  v8 = (void (**)(void))a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self destinationEntityETags];
  v12 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self _eTagFromTaskResponseHeaders:v9];

  id v13 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self filenameFromURL:v10];

  [v11 setObject:v12 forKey:v13];
  v14 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  id v16 = [v14 logHandleForAccountInfoProvider:WeakRetained];

  if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v17 = 0;
    _os_log_impl(&dword_213BFC000, v16, OS_LOG_TYPE_INFO, "[multi-move] ~ Finished setting tags for moved CalDAV entity", v17, 2u);
  }

  if (v8) {
    v8[2](v8);
  }
}

- (id)_eTagFromTaskResponseHeaders:(id)a3
{
  return (id)[a3 CDVObjectForKeyCaseInsensitive:@"ETag"];
}

- (void)_completedMoveTask:(id)a3 sourceURL:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  id v10 = [v8 logHandleForAccountInfoProvider:WeakRetained];

  if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v52 = v7;
    _os_log_impl(&dword_213BFC000, v10, OS_LOG_TYPE_DEBUG, "[multi-move] ~ Completion block for %@", buf, 0xCu);
  }

  v11 = [v6 error];
  v12 = v11;
  if (v11)
  {
    id v13 = [v11 domain];
    if ([v13 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"]) {
      uint64_t v14 = [v12 code];
    }
    else {
      uint64_t v14 = 0;
    }

    if (self->_useFallback && ((unint64_t)(v14 - 403) < 3 || v14 == 501))
    {
      id v21 = +[CoreDAVLogging sharedLogging];
      id v22 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      id v23 = [v21 logHandleForAccountInfoProvider:v22];

      if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v7;
        _os_log_impl(&dword_213BFC000, v23, OS_LOG_TYPE_INFO, "[multi-move] ~  Move of %@ failed, trying a PUT as fallback", buf, 0xCu);
      }

      id v24 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self sourceEntityDataPayloads];
      uint64_t v25 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self filenameFromURL:v7];
      uint64_t v44 = [v24 objectForKey:v25];

      id v26 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self sourceEntityDataContentTypes];
      uint64_t v27 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self filenameFromURL:v7];
      v43 = [v26 objectForKey:v27];

      uint64_t v28 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self fullDestinationURLFromSourceURL:v7];
      uint64_t v29 = (void *)v28;
      if (v44 && v43 && v28)
      {
        v30 = [CoreDAVPutTask alloc];
        v31 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self sourceEntityETags];
        v32 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self filenameFromURL:v7];
        uint64_t v33 = [v31 objectForKey:v32];
        v34 = [(CoreDAVPostOrPutTask *)v30 initWithDataPayload:v44 dataContentType:v43 atURL:v29 previousETag:v33];

        id v35 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        [(CoreDAVTask *)v34 setAccountInfoProvider:v35];

        objc_initWeak((id *)buf, v34);
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __70__CoreDAVMultiMoveWithFallbackTaskGroup__completedMoveTask_sourceURL___block_invoke;
        v48[3] = &unk_2641DFD00;
        objc_copyWeak(&v50, (id *)buf);
        v48[4] = self;
        id v49 = v7;
        [(CoreDAVTask *)v34 setCompletionBlock:v48];
        [(NSMutableSet *)self->super._outstandingTasks addObject:v34];
        uint64_t v36 = [(CoreDAVTaskGroup *)self taskManager];
        [v36 submitQueuedCoreDAVTask:v34];

        objc_destroyWeak(&v50);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        uint64_t v40 = +[CoreDAVLogging sharedLogging];
        id v41 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        v42 = [v40 logHandleForAccountInfoProvider:v41];

        if (v42 && os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v52 = v7;
          _os_log_impl(&dword_213BFC000, v42, OS_LOG_TYPE_DEFAULT, "[multi-move] ~ PUT failed for %@. Missing local data.", buf, 0xCu);
        }

        [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v12 delegateCallbackBlock:0];
      }
    }
    else
    {
      v37 = +[CoreDAVLogging sharedLogging];
      id v38 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      v39 = [v37 logHandleForAccountInfoProvider:v38];

      if (v39 && os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v7;
        _os_log_impl(&dword_213BFC000, v39, OS_LOG_TYPE_DEFAULT, "[multi-move] ~  Move failed for %@", buf, 0xCu);
      }

      [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v12 delegateCallbackBlock:0];
    }
  }
  else
  {
    v15 = +[CoreDAVLogging sharedLogging];
    id v16 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v17 = [v15 logHandleForAccountInfoProvider:v16];

    if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v7;
      _os_log_impl(&dword_213BFC000, v17, OS_LOG_TYPE_INFO, "[multi-move] ~  Move succeded for %@", buf, 0xCu);
    }

    uint64_t v18 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self fullDestinationURLFromSourceURL:v7];
    objc_initWeak((id *)buf, self);
    uint64_t v19 = [v6 responseHeaders];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __70__CoreDAVMultiMoveWithFallbackTaskGroup__completedMoveTask_sourceURL___block_invoke_35;
    v45[3] = &unk_2641DFC60;
    objc_copyWeak(&v47, (id *)buf);
    id v20 = v18;
    id v46 = v20;
    [(CoreDAVMultiMoveWithFallbackTaskGroup *)self _setTagsForDestinationEntityAtURL:v20 fromTaskResponseHeaders:v19 completionBlock:v45];

    objc_destroyWeak(&v47);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __70__CoreDAVMultiMoveWithFallbackTaskGroup__completedMoveTask_sourceURL___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [*(id *)(*(void *)(a1 + 32) + 32) removeObject:WeakRetained];
    id WeakRetained = (id)[*(id *)(a1 + 32) _completedPutTask:v5 sourceURL:*(void *)(a1 + 40)];
    id v3 = v5;
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

void __70__CoreDAVMultiMoveWithFallbackTaskGroup__completedMoveTask_sourceURL___block_invoke_35(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained destinationURLs];
    [v3 addObject:*(void *)(a1 + 32)];

    [v4 processOutstandingTasks];
    id WeakRetained = v4;
  }
}

- (void)_completedPutTask:(id)a3 sourceURL:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 error];
  id v9 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  v11 = [v9 logHandleForAccountInfoProvider:WeakRetained];

  if (v8)
  {
    if (v11)
    {
      v12 = v11;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [v6 url];
        *(_DWORD *)buf = 138412290;
        v30 = v13;
        _os_log_impl(&dword_213BFC000, v12, OS_LOG_TYPE_INFO, "[multi-move] ~  Move-fallback PUT to %@ failed", buf, 0xCu);
      }
    }

    [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v8 delegateCallbackBlock:0];
  }
  else
  {
    if (v11)
    {
      uint64_t v14 = v11;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = [v6 url];
        *(_DWORD *)buf = 138412290;
        v30 = v15;
        _os_log_impl(&dword_213BFC000, v14, OS_LOG_TYPE_INFO, "[multi-move] ~  Move-fallback PUT succeded at %@", buf, 0xCu);
      }
    }

    id v16 = +[CoreDAVLogging sharedLogging];
    id v17 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    uint64_t v18 = [v16 logHandleForAccountInfoProvider:v17];

    if (v18)
    {
      uint64_t v19 = v18;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = [v6 responseHeaders];
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        _os_log_impl(&dword_213BFC000, v19, OS_LOG_TYPE_INFO, "[multi-move] ~  Move-fallback PUT Responses are: %@", buf, 0xCu);
      }
    }

    id v21 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self fullDestinationURLFromSourceURL:v7];
    objc_initWeak((id *)buf, self);
    id v22 = [v6 responseHeaders];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __69__CoreDAVMultiMoveWithFallbackTaskGroup__completedPutTask_sourceURL___block_invoke;
    v24[3] = &unk_2641DFCD8;
    objc_copyWeak(&v28, (id *)buf);
    id v23 = v21;
    id v25 = v23;
    id v26 = v6;
    id v27 = v7;
    [(CoreDAVMultiMoveWithFallbackTaskGroup *)self _setTagsForDestinationEntityAtURL:v23 fromTaskResponseHeaders:v22 completionBlock:v24];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
}

void __69__CoreDAVMultiMoveWithFallbackTaskGroup__completedPutTask_sourceURL___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained destinationURLs];
    [v4 addObject:*(void *)(a1 + 32)];

    id v5 = +[CoreDAVLogging sharedLogging];
    id v6 = objc_loadWeakRetained(v3 + 2);
    id v7 = [v5 logHandleForAccountInfoProvider:v6];

    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [*(id *)(a1 + 40) url];
        *(_DWORD *)buf = 138412290;
        id v21 = v9;
        _os_log_impl(&dword_213BFC000, v8, OS_LOG_TYPE_INFO, "[multi-move] ~  Going to do a DELETE of the sourceURL now (put to %@)", buf, 0xCu);
      }
    }

    id v10 = [(CoreDAVTask *)[CoreDAVDeleteTask alloc] initWithURL:*(void *)(a1 + 48)];
    id v11 = objc_loadWeakRetained(v3 + 2);
    [(CoreDAVTask *)v10 setAccountInfoProvider:v11];

    objc_initWeak((id *)buf, v10);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    id v16 = __69__CoreDAVMultiMoveWithFallbackTaskGroup__completedPutTask_sourceURL___block_invoke_37;
    id v17 = &unk_2641DFC60;
    objc_copyWeak(&v19, (id *)buf);
    v12 = v3;
    uint64_t v18 = v12;
    [(CoreDAVTask *)v10 setCompletionBlock:&v14];
    objc_msgSend(v12[4], "addObject:", v10, v14, v15, v16, v17);
    id v13 = [v12 taskManager];
    [v13 submitQueuedCoreDAVTask:v10];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

void __69__CoreDAVMultiMoveWithFallbackTaskGroup__completedPutTask_sourceURL___block_invoke_37(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = +[CoreDAVLogging sharedLogging];
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    id v5 = [v3 logHandleForAccountInfoProvider:v4];

    if (v5)
    {
      id v6 = v5;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [WeakRetained error];
        int v11 = 138412290;
        v12 = v7;
        _os_log_impl(&dword_213BFC000, v6, OS_LOG_TYPE_INFO, "[multi-move] ~  Move-fallback DELETE completed with error: %@", (uint8_t *)&v11, 0xCu);
      }
    }

    [*(id *)(*(void *)(a1 + 32) + 32) removeObject:WeakRetained];
    v8 = [WeakRetained error];

    id v9 = *(void **)(a1 + 32);
    if (v8)
    {
      id v10 = [WeakRetained error];
      [v9 finishCoreDAVTaskGroupWithError:v10 delegateCallbackBlock:0];
    }
    else
    {
      [v9 processOutstandingTasks];
    }
  }
}

- (NSSet)sourceURLs
{
  return self->_sourceURLs;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (int)overwrite
{
  return self->_overwrite;
}

- (BOOL)useFallback
{
  return self->_useFallback;
}

- (NSDictionary)sourceEntityDataPayloads
{
  return self->_sourceEntityDataPayloads;
}

- (NSDictionary)sourceEntityDataContentTypes
{
  return self->_sourceEntityDataContentTypes;
}

- (NSDictionary)sourceEntityETags
{
  return self->_sourceEntityETags;
}

- (NSMutableDictionary)destinationEntityETags
{
  return self->_destinationEntityETags;
}

- (NSMutableSet)destinationURLs
{
  return self->_destinationURLs;
}

- (NSMutableArray)outstandingSourceURLsToMove
{
  return self->_outstandingSourceURLsToMove;
}

- (void)setOutstandingSourceURLsToMove:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingSourceURLsToMove, 0);
  objc_storeStrong((id *)&self->_destinationEntityETags, 0);
  objc_storeStrong((id *)&self->_destinationURLs, 0);
  objc_storeStrong((id *)&self->_sourceEntityETags, 0);
  objc_storeStrong((id *)&self->_sourceEntityDataContentTypes, 0);
  objc_storeStrong((id *)&self->_sourceEntityDataPayloads, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_sourceURLs, 0);
}

@end