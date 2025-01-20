@interface CoreDAVContainerSyncTaskGroup
- (BOOL)actionsOnly;
- (BOOL)ensureUpdatedCTag;
- (BOOL)isWhitelistedError:(id)a3;
- (BOOL)shouldDownloadResource:(id)a3 localETag:(id)a4 serverETag:(id)a5;
- (BOOL)shouldFetchMoreETags;
- (BOOL)shouldFetchResourceWithEtag:(id)a3 propertiesToValues:(id)a4;
- (BOOL)useMultiGet;
- (BOOL)useSyncCollection;
- (Class)bulkChangeTaskClass;
- (CoreDAVContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 syncItemOrder:(BOOL)a7 context:(id)a8 accountInfoProvider:(id)a9 taskManager:(id)a10;
- (NSArray)localItemURLOrder;
- (NSDictionary)bulkRequests;
- (NSString)bulkChangeCheckCTag;
- (NSString)description;
- (NSString)nextCTag;
- (NSString)previousCTag;
- (NSString)previousSyncToken;
- (NSURL)addMemberURL;
- (NSURL)folderURL;
- (id)copyAdditionalResourcePropertiesToFetch;
- (id)copyGetEtagTaskWithPropertiesToFind:(id)a3;
- (id)copyGetTaskWithURL:(id)a3;
- (id)copyMultiGetTaskWithURLs:(id)a3;
- (id)copyPostTaskWithPayloadItem:(id)a3 forAction:(id)a4;
- (id)copyPutTaskWithPayloadItem:(id)a3 forAction:(id)a4;
- (id)dataContentType;
- (unint64_t)_submitTasks;
- (unint64_t)maxIndependentTasks;
- (unint64_t)maxRetryOnUnexpectedSyncTokenChange;
- (unint64_t)multiGetBatchSize;
- (unint64_t)unexpectedEmptySyncReportResponseRetryAttemptCount;
- (void)_bulkChange;
- (void)_bulkChangeTask:(id)a3 didFinishWithError:(id)a4;
- (void)_configureMultiGet:(id)a3;
- (void)_getCTag;
- (void)_getDataPayloads;
- (void)_getETags;
- (void)_getOrder;
- (void)_getTask:(id)a3 finishedWithParsedContents:(id)a4 deletedItems:(id)a5 error:(id)a6;
- (void)_postTask:(id)a3 didFinishWithError:(id)a4;
- (void)_pushActions;
- (void)_sendNextBatch;
- (void)_syncReportTask:(id)a3 didFinishWithError:(id)a4;
- (void)_tearDownAllUnsubmittedTasks;
- (void)bailWithError:(id)a3;
- (void)cancelTaskGroup;
- (void)deleteResourceURLs:(id)a3;
- (void)deleteTask:(id)a3 completedWithError:(id)a4;
- (void)getTask:(id)a3 data:(id)a4 error:(id)a5;
- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5;
- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5;
- (void)putTask:(id)a3 completedWithNewETag:(id)a4 error:(id)a5;
- (void)setActionsOnly:(BOOL)a3;
- (void)setAddMemberURL:(id)a3;
- (void)setBulkChangeCheckCTag:(id)a3;
- (void)setBulkRequests:(id)a3;
- (void)setEnsureUpdatedCTag:(BOOL)a3;
- (void)setMaxIndependentTasks:(unint64_t)a3;
- (void)setMaxRetryOnUnexpectedSyncTokenChange:(unint64_t)a3;
- (void)setMultiGetBatchSize:(unint64_t)a3;
- (void)setNextCTag:(id)a3;
- (void)setPreviousCTag:(id)a3;
- (void)setPreviousSyncToken:(id)a3;
- (void)setUnexpectedEmptySyncReportResponseRetryAttemptCount:(unint64_t)a3;
- (void)setUseMultiGet:(BOOL)a3;
- (void)setUseSyncCollection:(BOOL)a3;
- (void)startTaskGroup;
- (void)task:(id)a3 didFinishWithError:(id)a4;
- (void)taskGroupWillCancelWithError:(id)a3;
@end

@implementation CoreDAVContainerSyncTaskGroup

- (CoreDAVContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 syncItemOrder:(BOOL)a7 context:(id)a8 accountInfoProvider:(id)a9 taskManager:(id)a10
{
  id v33 = a3;
  id v35 = a4;
  id v34 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if ([(CoreDAVContainerSyncTaskGroup *)self isMemberOfClass:objc_opt_class()])
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"CoreDAVContainerSyncTaskGroup.m", 64, @"You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@", objc_opt_class() object file lineNumber description];

    v23 = 0;
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)CoreDAVContainerSyncTaskGroup;
    v24 = [(CoreDAVTaskGroup *)&v36 initWithAccountInfoProvider:v20 taskManager:v21];
    v25 = v24;
    if (v24)
    {
      v24->_phase = 2;
      [(CoreDAVTaskGroup *)v24 setContext:v19];
      objc_storeStrong((id *)&v25->_folderURL, a3);
      objc_storeStrong((id *)&v25->_previousCTag, a4);
      objc_storeStrong((id *)&v25->_previousSyncToken, a5);
      uint64_t v26 = [v18 mutableCopy];
      actions = v25->_actions;
      v25->_actions = (NSMutableArray *)v26;

      v25->_multiGetBatchSize = 50;
      v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      unsubmittedTasks = v25->_unsubmittedTasks;
      v25->_unsubmittedTasks = v28;

      v25->_syncItemOrder = a7;
      v25->_useMultiGet = 1;
      v25->_useSyncCollection = [(NSString *)v25->_previousSyncToken length] != 0;
      v25->_maxIndependentTasks = 0;
      v30 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      locationChangedURLs = v25->_locationChangedURLs;
      v25->_locationChangedURLs = v30;
    }
    self = v25;
    v23 = self;
  }

  return v23;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@ %p: Phase %d Outstanding Tasks:\n%@", v5, self, self->_phase, self->super._outstandingTasks];

  return (NSString *)v6;
}

- (id)copyGetTaskWithURL:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v8 = v11;
      _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_ERROR, "copyGetTaskWithURL: to be implemented by subclass %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }

  return 0;
}

- (id)copyMultiGetTaskWithURLs:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v8 = v11;
      _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_ERROR, "copyMultiGetTaskWithURLs: to be implemented by subclass %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }

  return 0;
}

- (id)dataContentType
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  v5 = [v3 logHandleForAccountInfoProvider:WeakRetained];

  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = (id)objc_opt_class();
      id v7 = v10;
      _os_log_impl(&dword_213BFC000, v6, OS_LOG_TYPE_ERROR, "dataContentType to be implemented by subclass %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }

  return 0;
}

- (Class)bulkChangeTaskClass
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  v5 = [v3 logHandleForAccountInfoProvider:WeakRetained];

  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = (id)objc_opt_class();
      id v7 = v10;
      _os_log_impl(&dword_213BFC000, v6, OS_LOG_TYPE_ERROR, "bulkChangeTaskClass to be implemented by subclass %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }

  return 0;
}

- (id)copyAdditionalResourcePropertiesToFetch
{
  return 0;
}

- (BOOL)shouldFetchResourceWithEtag:(id)a3 propertiesToValues:(id)a4
{
  return 1;
}

- (void)taskGroupWillCancelWithError:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  v6 = [v4 domain];
  if (([v6 isEqualToString:@"CoreDAVErrorDomain"] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v7 = [v5 code];

  if (v7 != 1)
  {
LABEL_6:
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    goto LABEL_7;
  }
LABEL_4:
  os_log_type_t v8 = OS_LOG_TYPE_INFO;
LABEL_7:
  int v9 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  uint64_t v11 = [v9 logHandleForAccountInfoProvider:WeakRetained];

  if (v11 && os_log_type_enabled(v11, v8))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_213BFC000, v11, v8, "Task group %@ will cancel with error %@", buf, 0x16u);
  }

  if (!v5)
  {
    v5 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
  }
  uint64_t v12 = self;
  v13 = [(CoreDAVTaskGroup *)v12 delegate];
  [v13 containerSyncTask:v12 completedWithNewCTag:0 newSyncToken:0 addedOrModified:0 removed:0 error:v5];
  v14.receiver = v12;
  v14.super_class = (Class)CoreDAVContainerSyncTaskGroup;
  [(CoreDAVTaskGroup *)&v14 taskGroupWillCancelWithError:v5];
}

- (void)_tearDownAllUnsubmittedTasks
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_unsubmittedTasks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "finishEarlyWithError:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_unsubmittedTasks removeAllObjects];
}

- (void)bailWithError:(id)a3
{
  id v4 = a3;
  [(CoreDAVContainerSyncTaskGroup *)self _tearDownAllUnsubmittedTasks];
  v5.receiver = self;
  v5.super_class = (Class)CoreDAVContainerSyncTaskGroup;
  [(CoreDAVTaskGroup *)&v5 bailWithError:v4];
}

- (void)cancelTaskGroup
{
  [(CoreDAVContainerSyncTaskGroup *)self _tearDownAllUnsubmittedTasks];
  v3.receiver = self;
  v3.super_class = (Class)CoreDAVContainerSyncTaskGroup;
  [(CoreDAVTaskGroup *)&v3 cancelTaskGroup];
}

- (unint64_t)_submitTasks
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (self->super._isCancelling) {
    return 0;
  }
  uint64_t v4 = 160;
  objc_super v5 = (void *)[(NSMutableArray *)self->_unsubmittedTasks copy];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
  unint64_t v7 = 0x2677FD000uLL;
  if (!v6)
  {
    unint64_t v2 = 0;
    goto LABEL_22;
  }
  uint64_t v8 = v6;
  unint64_t v2 = 0;
  uint64_t v9 = *(void *)v40;
  do
  {
    uint64_t v10 = 0;
    uint64_t v37 = v8;
    do
    {
      if (*(void *)v40 != v9) {
        objc_enumerationMutation(obj);
      }
      long long v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
      uint64_t v12 = *(int *)(v7 + 672);
      if (!*(Class *)((char *)&self->super.super.isa + v12))
      {
        [(NSMutableSet *)self->super._outstandingTasks addObject:*(void *)(*((void *)&v39 + 1) + 8 * v10)];
        [*(id *)((char *)&self->super.super.isa + v4) removeObject:v11];
        id WeakRetained = objc_loadWeakRetained((id *)&self->super._taskManager);
        [v11 submitWithTaskManager:WeakRetained];
LABEL_13:

        ++v2;
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ((Class)[(NSMutableSet *)self->super._outstandingTasks count] >= *(Class *)((char *)&self->super.super.isa
                                                                                              + v12))
          goto LABEL_22;
        [(NSMutableSet *)self->super._outstandingTasks addObject:v11];
        [*(id *)((char *)&self->super.super.isa + v4) removeObject:v11];
        id WeakRetained = objc_loadWeakRetained((id *)&self->super._taskManager);
        [WeakRetained submitIndependentCoreDAVTask:v11];
        goto LABEL_13;
      }
      uint64_t v14 = v9;
      unint64_t v15 = v2;
      uint64_t v16 = v4;
      unint64_t v17 = v7;
      id v18 = +[CoreDAVLogging sharedLogging];
      id v19 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      id v20 = [v18 logHandleForAccountInfoProvider:v19];

      if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v11;
        _os_log_impl(&dword_213BFC000, v20, OS_LOG_TYPE_ERROR, "Can't submit anything but CoreDAVTasks independently, %@", buf, 0xCu);
      }

      unint64_t v7 = v17;
      uint64_t v4 = v16;
      unint64_t v2 = v15;
      uint64_t v9 = v14;
      uint64_t v8 = v37;
LABEL_18:
      ++v10;
    }
    while (v8 != v10);
    uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
  }
  while (v8);
LABEL_22:

  uint64_t v21 = *(uint64_t *)((char *)&self->super.super.isa + *(int *)(v7 + 672));
  v22 = +[CoreDAVLogging sharedLogging];
  id v23 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  v24 = [v22 logHandleForAccountInfoProvider:v23];

  if (v21)
  {
    if (v24)
    {
      v25 = v24;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v26);
        uint64_t v28 = [(NSMutableSet *)self->super._outstandingTasks count];
        uint64_t v29 = [*(id *)((char *)&self->super.super.isa + v4) count];
        *(_DWORD *)buf = 138544386;
        v44 = v27;
        __int16 v45 = 2048;
        v46 = self;
        __int16 v47 = 2048;
        unint64_t v48 = v2;
        __int16 v49 = 2048;
        uint64_t v50 = v28;
        __int16 v51 = 2048;
        uint64_t v52 = v29;
        v30 = "<%{public}@: %p> Submitted %lu independent tasks, %lu active, %lu waiting.";
        v31 = v25;
        uint32_t v32 = 52;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else if (v24)
  {
    id v33 = v24;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      id v34 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v34);
      uint64_t v35 = [(NSMutableSet *)self->super._outstandingTasks count];
      *(_DWORD *)buf = 138544130;
      v44 = v27;
      __int16 v45 = 2048;
      v46 = self;
      __int16 v47 = 2048;
      unint64_t v48 = v2;
      __int16 v49 = 2048;
      uint64_t v50 = v35;
      v30 = "<%{public}@: %p> Submitted %lu queued tasks, %lu total tasks queued.";
      v31 = v33;
      uint32_t v32 = 42;
LABEL_29:
      _os_log_impl(&dword_213BFC000, v31, OS_LOG_TYPE_DEBUG, v30, buf, v32);
    }
LABEL_30:
  }
  return v2;
}

- (void)_getCTag
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_ensureUpdatedCTag) {
    goto LABEL_2;
  }
  if (self->_actionsOnly)
  {
    uint64_t v9 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    long long v11 = [v9 logHandleForAccountInfoProvider:WeakRetained];

    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = self;
      _os_log_impl(&dword_213BFC000, v11, OS_LOG_TYPE_DEBUG, "%@: _actionsOnly and actions are complete, so I'm outta here", buf, 0xCu);
    }

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __41__CoreDAVContainerSyncTaskGroup__getCTag__block_invoke;
    v14[3] = &unk_2641DFC10;
    v14[4] = self;
    [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:v14];
  }
  else
  {
    if (!self->_useSyncCollection)
    {
LABEL_2:
      self->_phase = 3;
      if ([(NSMutableSet *)self->super._outstandingTasks count])
      {
        uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
        [v12 handleFailureInMethod:a2, self, @"CoreDAVContainerSyncTaskGroup.m", 212, @"We shouldn't start grabbing the cTag if we have outstanding tasks: %@", self object file lineNumber description];
      }
      v13 = objc_alloc_init(CoreDAVItemParserMapping);
      [(CoreDAVItemParserMapping *)v13 setNameSpace:@"http://calendarserver.org/ns/"];
      [(CoreDAVItemParserMapping *)v13 setName:@"getctag"];
      [(CoreDAVItemParserMapping *)v13 setParseClass:objc_opt_class()];
      uint64_t v4 = objc_alloc_init(CoreDAVItemParserMapping);
      [(CoreDAVItemParserMapping *)v4 setNameSpace:@"DAV:"];
      [(CoreDAVItemParserMapping *)v4 setName:@"sync-token"];
      [(CoreDAVItemParserMapping *)v4 setParseClass:objc_opt_class()];
      objc_super v5 = [CoreDAVPropFindTask alloc];
      uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v13, v4, 0);
      unint64_t v7 = [(CoreDAVPropFindTask *)v5 initWithPropertiesToFind:v6 atURL:self->_folderURL withDepth:2];

      [(NSMutableArray *)self->_unsubmittedTasks addObject:v7];
      [(CoreDAVTask *)v7 setDelegate:self];
      id v8 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      [(CoreDAVTask *)v7 setAccountInfoProvider:v8];

      [(CoreDAVTask *)v7 setTimeoutInterval:self->super._timeoutInterval];
      [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];

      return;
    }
    [(CoreDAVContainerSyncTaskGroup *)self _getETags];
  }
}

void __41__CoreDAVContainerSyncTaskGroup__getCTag__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 containerSyncTask:*(void *)(a1 + 32) completedWithNewCTag:*(void *)(*(void *)(a1 + 32) + 104) newSyncToken:*(void *)(*(void *)(a1 + 32) + 128) addedOrModified:0 removed:0 error:0];
}

- (id)copyPutTaskWithPayloadItem:(id)a3 forAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CoreDAVPutTask alloc];
  uint64_t v9 = [v6 dataPayload];
  uint64_t v10 = [(CoreDAVContainerSyncTaskGroup *)self dataContentType];
  long long v11 = [v6 serverID];
  if ([v7 action])
  {
    uint64_t v12 = [v6 syncKey];
    v13 = [(CoreDAVPostOrPutTask *)v8 initWithDataPayload:v9 dataContentType:v10 atURL:v11 previousETag:v12];
  }
  else
  {
    v13 = [(CoreDAVPostOrPutTask *)v8 initWithDataPayload:v9 dataContentType:v10 atURL:v11 previousETag:0];
  }

  [(CoreDAVActionBackedTask *)v13 setBackingAction:v7];
  -[CoreDAVTask setIgnoresGuardianRestrictions:](v13, "setIgnoresGuardianRestrictions:", [v7 ignoresGuardianRestrictions]);

  return v13;
}

- (id)copyPostTaskWithPayloadItem:(id)a3 forAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CoreDAVContainerSyncTaskGroup *)self addMemberURL];
  if (v8) {
    [(CoreDAVContainerSyncTaskGroup *)self addMemberURL];
  }
  else {
  uint64_t v9 = [v6 serverID];
  }

  uint64_t v10 = [CoreDAVPostTask alloc];
  long long v11 = [v6 dataPayload];
  uint64_t v12 = [(CoreDAVContainerSyncTaskGroup *)self dataContentType];
  v13 = [(CoreDAVPostTask *)v10 initWithDataPayload:v11 dataContentType:v12 atURL:v9 previousETag:0];

  [(CoreDAVActionBackedTask *)v13 setBackingAction:v7];
  uint64_t v14 = [v7 ignoresGuardianRestrictions];

  [(CoreDAVTask *)v13 setIgnoresGuardianRestrictions:v14];
  return v13;
}

- (void)_pushActions
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  self->_phase = 2;
  if ([(NSMutableSet *)self->super._outstandingTasks count])
  {
    uint64_t v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"CoreDAVContainerSyncTaskGroup.m", 265, @"We shouldn't start pushing actions if we have outstanding tasks: %@", self object file lineNumber description];
  }
  uint64_t v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v4 = self->_actions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
        switch([v9 action])
        {
          case 0u:
            uint64_t v10 = [v9 context];
            long long v11 = [(CoreDAVContainerSyncTaskGroup *)self addMemberURL];

            if (!v11)
            {
              int v15 = 1;
              goto LABEL_23;
            }
            p_super = [(CoreDAVContainerSyncTaskGroup *)self copyPostTaskWithPayloadItem:v10 forAction:v9];
            [p_super setBackingAction:v9];
            if (self->_syncItemOrder)
            {
              id v13 = v9;
              -[NSObject setAbsoluteOrder:](p_super, "setAbsoluteOrder:", [v13 absoluteOrder]);
              uint64_t v14 = [v13 priorURL];

              [p_super setPriorOrderedURL:v14];
              int v15 = 1;
              goto LABEL_25;
            }
            int v15 = 1;
            goto LABEL_26;
          case 1u:
            uint64_t v10 = [v9 context];
            int v15 = 0;
LABEL_23:
            p_super = [(CoreDAVContainerSyncTaskGroup *)self copyPutTaskWithPayloadItem:v10 forAction:v9];
            [p_super setBackingAction:v9];
            if (self->_syncItemOrder)
            {
              id v23 = v9;
              -[NSObject setAbsoluteOrder:](p_super, "setAbsoluteOrder:", [v23 absoluteOrder]);
              uint64_t v14 = [v23 priorURL];

              [p_super setPriorOrderedURL:v14];
LABEL_25:
            }
LABEL_26:
            [p_super setDelegate:self];
            id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            [p_super setAccountInfoProvider:WeakRetained];

            [p_super setTimeoutInterval:self->super._timeoutInterval];
            if (v15) {
              unsubmittedTasks = v28;
            }
            else {
              unsubmittedTasks = v27;
            }
            goto LABEL_29;
          case 2u:
            uint64_t v10 = [v9 context];
            uint64_t v16 = [(CoreDAVTask *)[CoreDAVDeleteTask alloc] initWithURL:v10];
            p_super = &v16->super.super.super;
            goto LABEL_17;
          case 4u:
            uint64_t v10 = [v9 context];
            p_super = [v10 copyPropPatchTask];
            if (self->_syncItemOrder)
            {
              id v17 = v9;
              -[NSObject setAbsoluteOrder:](p_super, "setAbsoluteOrder:", [v17 absoluteOrder]);
              id v18 = [v17 priorURL];

              [p_super setPriorOrderedURL:v18];
            }
            uint64_t v16 = (CoreDAVDeleteTask *)p_super;
LABEL_17:
            [(CoreDAVActionBackedTask *)v16 setBackingAction:v9];
            [p_super setDelegate:self];
            id v19 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            [p_super setAccountInfoProvider:v19];

            [p_super setTimeoutInterval:self->super._timeoutInterval];
            unsubmittedTasks = self->_unsubmittedTasks;
LABEL_29:
            [(NSMutableArray *)unsubmittedTasks addObject:p_super];
            break;
          default:
            uint64_t v10 = +[CoreDAVLogging sharedLogging];
            id v21 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            p_super = [v10 logHandleForAccountInfoProvider:v21];

            if (p_super)
            {
              p_super = p_super;
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
              {
                int v22 = [v9 action];
                *(_DWORD *)buf = 67109120;
                int v34 = v22;
                _os_log_impl(&dword_213BFC000, p_super, OS_LOG_TYPE_DEFAULT, "Don't know how to perform action %d, skipping this action", buf, 8u);
              }
            }
            break;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v25 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
      uint64_t v6 = v25;
    }
    while (v25);
  }

  [(NSMutableArray *)self->_unsubmittedTasks addObjectsFromArray:v28];
  [(NSMutableArray *)self->_unsubmittedTasks addObjectsFromArray:v27];
  if ([(NSMutableArray *)self->_unsubmittedTasks count]) {
    [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];
  }
  else {
    [(CoreDAVContainerSyncTaskGroup *)self _getCTag];
  }
}

- (void)_sendNextBatch
{
  id v2 = self;
  uint64_t v75 = *MEMORY[0x263EF8340];
  while ([(NSMutableDictionary *)v2->_remainingUUIDsToAddActions count]
       || [(NSMutableDictionary *)self->_remainingHREFsToModDeleteActions count])
  {
    if (self->_phase == 1) {
      objc_super v3 = @"crud";
    }
    else {
      objc_super v3 = @"simple";
    }
    unint64_t v48 = [(NSDictionary *)self->_bulkRequests objectForKey:v3];
    uint64_t v4 = [v48 objectForKey:@"max-resources"];
    unint64_t v59 = [v4 unsignedIntegerValue];

    uint64_t v5 = [v48 objectForKey:@"max-size"];
    unint64_t v57 = [v5 unsignedIntegerValue];

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = self->_remainingHREFsToModDeleteActions;
    uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v69 objects:v74 count:16];
    if (v6)
    {
      unsigned int v7 = 0;
      int v8 = 0;
      uint64_t v9 = 0;
      uint64_t v55 = *(void *)v70;
      while (2)
      {
        uint64_t v10 = 0;
        int v47 = v8 + v6;
        int v49 = v8;
        int v51 = v8 + 1;
        do
        {
          if (*(void *)v70 != v55) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v69 + 1) + 8 * v10);
          uint64_t v12 = [(NSMutableDictionary *)self->_remainingHREFsToModDeleteActions objectForKey:v11];
          if ([v12 action] == 1)
          {
            id v13 = [v12 context];
            uint64_t v14 = [v13 dataPayload];
            int v15 = [v14 length];
          }
          else
          {
            int v15 = 100;
          }
          v7 += v15;
          if (v59 && v59 < (v51 + v10) || v57 && (float)v57 * 0.8 < (float)v7)
          {

            int v47 = v49 + v10 + 1;
            char v17 = 1;
            goto LABEL_26;
          }
          id v16 = v9;
          if (!v9) {
            id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          }
          uint64_t v9 = v16;
          [v16 setObject:v12 forKey:v11];

          ++v10;
        }
        while (v6 != v10);
        uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v69 objects:v74 count:16];
        char v17 = 0;
        int v8 = v47;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v17 = 0;
      unsigned int v7 = 0;
      int v47 = 0;
      uint64_t v9 = 0;
    }
LABEL_26:

    remainingHREFsToModDeleteActions = self->_remainingHREFsToModDeleteActions;
    uint64_t v19 = [v9 allKeys];
    id v20 = (void *)v19;
    if (v19) {
      uint64_t v21 = v19;
    }
    else {
      uint64_t v21 = MEMORY[0x263EFFA68];
    }
    [(NSMutableDictionary *)remainingHREFsToModDeleteActions removeObjectsForKeys:v21];

    if (v17)
    {
      int v22 = 0;
    }
    else
    {
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      uint64_t v50 = self->_remainingUUIDsToAddActions;
      uint64_t v23 = [(NSMutableDictionary *)v50 countByEnumeratingWithState:&v65 objects:v73 count:16];
      id v24 = 0;
      if (v23)
      {
        id obja = *(id *)v66;
        while (2)
        {
          uint64_t v25 = 0;
          int v56 = v47 + 1;
          uint64_t v52 = v23;
          v47 += v23;
          do
          {
            if (*(id *)v66 != obja) {
              objc_enumerationMutation(v50);
            }
            uint64_t v26 = *(void *)(*((void *)&v65 + 1) + 8 * v25);
            v27 = [(NSMutableDictionary *)self->_remainingUUIDsToAddActions objectForKey:v26];
            uint64_t v28 = [v27 context];
            long long v29 = [v28 dataPayload];
            int v30 = [v29 length];

            BOOL v31 = v59 < (v56 + v25) && v59 != 0;
            if (v31 || (v7 += v30, v57) && (float)v57 * 0.8 < (float)v7)
            {

              goto LABEL_48;
            }
            id v32 = v24;
            if (!v24) {
              id v32 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            }
            id v24 = v32;
            [v32 setObject:v27 forKey:v26];

            ++v25;
          }
          while (v52 != v25);
          uint64_t v23 = [(NSMutableDictionary *)v50 countByEnumeratingWithState:&v65 objects:v73 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
LABEL_48:

      int v22 = v24;
    }
    id v33 = v22;
    if ([v22 count])
    {
      remainingUUIDsToAddActions = self->_remainingUUIDsToAddActions;
      uint64_t v35 = [v33 allKeys];
      [(NSMutableDictionary *)remainingUUIDsToAddActions removeObjectsForKeys:v35];
    }
    uint64_t v36 = [(CoreDAVContainerSyncTaskGroup *)self bulkChangeTaskClass];
    uint64_t v37 = (void *)[[v36 alloc] initWithURL:self->_folderURL checkCTag:self->_bulkChangeCheckCTag simple:self->_phase != 1 returnChangedData:1 uuidsToAddActions:v33 hrefsToModDeleteActions:v9];
    if (!v37)
    {
      v44 = [MEMORY[0x263F08690] currentHandler];
      [v44 handleFailureInMethod:a2, self, @"CoreDAVContainerSyncTaskGroup.m", 434, @"Couldn't create task of class %@, things will go poorly", v36 object file lineNumber description];
    }
    [v37 setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    [v37 setAccountInfoProvider:WeakRetained];

    [v37 setTimeoutInterval:self->super._timeoutInterval];
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    char v64 = 0;
    long long v39 = [MEMORY[0x263EFF980] array];
    long long v40 = v9;
    if (v33)
    {
      long long v41 = [v33 allValues];
      [v39 addObjectsFromArray:v41];

      long long v40 = v9;
    }
    if (v40)
    {
      long long v42 = [v40 allValues];
      [v39 addObjectsFromArray:v42];
    }
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __47__CoreDAVContainerSyncTaskGroup__sendNextBatch__block_invoke;
    v60[3] = &unk_2641DFC38;
    v60[4] = &v61;
    [v39 enumerateObjectsUsingBlock:v60];
    [v37 setIgnoresGuardianRestrictions:*((unsigned __int8 *)v62 + 24)];
    [(NSMutableArray *)self->_unsubmittedTasks addObject:v37];
    BOOL v43 = self->_bulkChangeCheckCTag == 0;

    _Block_object_dispose(&v61, 8);
    id v2 = self;
    if (!v43) {
      goto LABEL_60;
    }
  }
  id v2 = self;
LABEL_60:
  if (v2->_bulkChangeCheckCTag && (v45 = [(NSMutableArray *)v2->_unsubmittedTasks count], id v2 = self, v45)) {
    [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];
  }
  else {
    [(CoreDAVContainerSyncTaskGroup *)v2 _pushActions];
  }
}

uint64_t __47__CoreDAVContainerSyncTaskGroup__sendNextBatch__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 ignoresGuardianRestrictions];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_bulkChange
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if ([(NSMutableSet *)self->super._outstandingTasks count])
  {
    uint64_t v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"CoreDAVContainerSyncTaskGroup.m", 475, @"We shouldn't start bulk change if we have outstanding tasks: %@", self object file lineNumber description];
  }
  if (self->_remainingUUIDsToAddActions)
  {
    v38 = [MEMORY[0x263F08690] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"CoreDAVContainerSyncTaskGroup.m", 476, @"%s _remainingUUIDsToAddActions is not nil: %@", "-[CoreDAVContainerSyncTaskGroup _bulkChange]", self object file lineNumber description];
  }
  if (self->_remainingHREFsToModDeleteActions)
  {
    long long v39 = [MEMORY[0x263F08690] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"CoreDAVContainerSyncTaskGroup.m", 477, @"%s _remainingHREFsToModDeleteActions is not nil: %@", "-[CoreDAVContainerSyncTaskGroup _bulkChange]", self object file lineNumber description];
  }
  if (self->_phase == 1) {
    uint64_t v4 = cdXMLMMeBulkCRUD;
  }
  else {
    uint64_t v4 = cdXMLMMeBulkSimple;
  }
  uint64_t v5 = [(NSDictionary *)self->_bulkRequests objectForKey:*v4];
  uint64_t v6 = (void *)[(NSMutableArray *)self->_actions copy];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        int v13 = [v12 action];
        switch(v13)
        {
          case 2:
            id v24 = [v5 objectForKey:@"delete"];
            char v25 = [v24 BOOLValue];

            if ((v25 & 1) == 0) {
              continue;
            }
            char v23 = 1;
LABEL_26:
            if (self->_phase != 1) {
              continue;
            }
            remainingHREFsToModDeleteActions = self->_remainingHREFsToModDeleteActions;
            if (!remainingHREFsToModDeleteActions)
            {
              v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
              uint64_t v28 = self->_remainingHREFsToModDeleteActions;
              self->_remainingHREFsToModDeleteActions = v27;

              remainingHREFsToModDeleteActions = self->_remainingHREFsToModDeleteActions;
            }
            long long v29 = [v12 context];
            int v30 = v29;
            if (v23)
            {
              [(NSMutableDictionary *)remainingHREFsToModDeleteActions setObject:v12 forKey:v29];
            }
            else
            {
              uint64_t v36 = [v29 serverID];
              [(NSMutableDictionary *)remainingHREFsToModDeleteActions setObject:v12 forKey:v36];
            }
LABEL_38:
            [(NSMutableArray *)self->_actions removeObject:v12];
            continue;
          case 1:
            uint64_t v21 = [v5 objectForKey:@"update"];
            int v22 = [v21 BOOLValue];

            if (!v22) {
              continue;
            }
            char v23 = 0;
            goto LABEL_26;
          case 0:
            uint64_t v14 = [v5 objectForKey:@"insert"];
            int v15 = [v14 BOOLValue];

            if (!v15) {
              continue;
            }
            remainingUUIDsToAddActions = self->_remainingUUIDsToAddActions;
            if (!remainingUUIDsToAddActions)
            {
              char v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
              id v18 = self->_remainingUUIDsToAddActions;
              self->_remainingUUIDsToAddActions = v17;

              remainingUUIDsToAddActions = self->_remainingUUIDsToAddActions;
            }
            uint64_t v19 = [v12 context];
            id v20 = [v19 syncKey];
            [(NSMutableDictionary *)remainingUUIDsToAddActions setObject:v12 forKey:v20];

            goto LABEL_38;
        }
        BOOL v31 = +[CoreDAVLogging sharedLogging];
        id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        id v33 = [v31 logHandleForAccountInfoProvider:WeakRetained];

        if (v33)
        {
          int v34 = v33;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            int v35 = [v12 action];
            *(_DWORD *)buf = 67109120;
            int v45 = v35;
            _os_log_impl(&dword_213BFC000, v34, OS_LOG_TYPE_DEFAULT, "Don't know how to perform action %d, skipping this action", buf, 8u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v9);
  }

  [(CoreDAVContainerSyncTaskGroup *)self _sendNextBatch];
}

- (id)copyGetEtagTaskWithPropertiesToFind:(id)a3
{
  if (self->_useSyncCollection) {
    uint64_t v4 = [[CoreDAVSyncReportTask alloc] initWithPropertiesToFind:a3 atURL:self->_folderURL withDepth:3 previousSyncToken:self->_previousSyncToken];
  }
  else {
    uint64_t v4 = [[CoreDAVPropFindTask alloc] initWithPropertiesToFind:a3 atURL:self->_folderURL withDepth:3];
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)_getETags
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  self->_phase = 4;
  if ([(NSMutableSet *)self->super._outstandingTasks count])
  {
    int v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CoreDAVContainerSyncTaskGroup.m", 545, @"We shouldn't start grabbing eTags if we have outstanding tasks: %@", self object file lineNumber description];
  }
  uint64_t v4 = objc_alloc_init(CoreDAVItemParserMapping);
  [(CoreDAVItemParserMapping *)v4 setNameSpace:@"DAV:"];
  [(CoreDAVItemParserMapping *)v4 setName:@"getetag"];
  [(CoreDAVItemParserMapping *)v4 setParseClass:objc_opt_class()];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v5 addObject:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(CoreDAVContainerSyncTaskGroup *)self copyAdditionalResourcePropertiesToFetch];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObject:*(void *)(*((void *)&v14 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v11 = [(CoreDAVContainerSyncTaskGroup *)self copyGetEtagTaskWithPropertiesToFind:v5];
  [(NSMutableArray *)self->_unsubmittedTasks addObject:v11];
  [v11 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  [v11 setAccountInfoProvider:WeakRetained];

  [v11 setTimeoutInterval:self->super._timeoutInterval];
  [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];
}

- (void)_getOrder
{
  self->_phase = 5;
  if ([(NSMutableSet *)self->super._outstandingTasks count])
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"CoreDAVContainerSyncTaskGroup.m", 571, @"We shouldn't start getting children order if we have outstanding tasks: %@", self object file lineNumber description];
  }
  if (self->_localItemURLOrder || !self->_syncItemOrder)
  {
    [(CoreDAVContainerSyncTaskGroup *)self _getDataPayloads];
  }
  else
  {
    id v6 = [(CoreDAVTask *)[CoreDAVGetTask alloc] initWithURL:self->_folderURL];
    [(CoreDAVTask *)v6 setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    [(CoreDAVTask *)v6 setAccountInfoProvider:WeakRetained];

    [(CoreDAVTask *)v6 setTimeoutInterval:self->super._timeoutInterval];
    [(NSMutableArray *)self->_unsubmittedTasks addObject:v6];
    [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];
  }
}

- (void)_configureMultiGet:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__CoreDAVContainerSyncTaskGroup__configureMultiGet___block_invoke;
  v6[3] = &unk_2641DFC60;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v4 setCompletionBlock:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  [v4 setAccountInfoProvider:WeakRetained];

  [v4 setTimeoutInterval:self->super._timeoutInterval];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__CoreDAVContainerSyncTaskGroup__configureMultiGet___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained error];

    if (!v4)
    {
      id v5 = [v3 missingURLs];
      if ([v5 count])
      {
        id v6 = (void *)[*(id *)(a1 + 32) copyMultiGetTaskWithURLs:v5];
        [*(id *)(a1 + 32) _configureMultiGet:v6];
        if (v6)
        {
          [*(id *)(*(void *)(a1 + 32) + 160) addObject:v6];
          id v7 = +[CoreDAVLogging sharedLogging];
          id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
          uint64_t v9 = [v7 logHandleForAccountInfoProvider:v8];

          if (v9)
          {
            uint64_t v10 = v9;
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              int v15 = 138412546;
              long long v16 = v6;
              __int16 v17 = 2048;
              uint64_t v18 = [v5 count];
              _os_log_impl(&dword_213BFC000, v10, OS_LOG_TYPE_INFO, "%@ missed %lu items - resubmitting", (uint8_t *)&v15, 0x16u);
            }
          }
        }
      }
    }
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v3 parsedContents];
    int v13 = [v3 deletedURLs];
    long long v14 = [v3 error];
    [v11 _getTask:v3 finishedWithParsedContents:v12 deletedItems:v13 error:v14];
  }
}

- (BOOL)shouldDownloadResource:(id)a3 localETag:(id)a4 serverETag:(id)a5
{
  return [a4 isEqualToString:a5] ^ 1;
}

- (void)deleteResourceURLs:(id)a3
{
  id v4 = a3;
  id v5 = [(CoreDAVTaskGroup *)self delegate];
  [v5 containerSyncTask:self retrievedAddedOrModifiedActions:0 removed:v4];
}

- (void)_getDataPayloads
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  self->_phase = 6;
  if ([(NSMutableSet *)self->super._outstandingTasks count])
  {
    uint64_t v50 = [MEMORY[0x263F08690] currentHandler];
    [v50 handleFailureInMethod:a2, self, @"CoreDAVContainerSyncTaskGroup.m", 628, @"We shouldn't start getting vCards if we have outstanding tasks: %@", self object file lineNumber description];
  }
  id v56 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v60 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v54 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  objc_super v3 = [(CoreDAVTaskGroup *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  id v5 = [(CoreDAVTaskGroup *)self delegate];
  id v6 = v5;
  if (v4)
  {
    id v7 = (void *)[v5 copyLocalETagsForURLToETagDict:self->_urlToETag inFolderWithURL:self->_folderURL];
  }
  else
  {
    id v8 = [(NSMutableDictionary *)self->_urlToETag allKeys];
    id v7 = (void *)[v6 copyLocalETagsForURLs:v8 inFolderWithURL:self->_folderURL];
  }
  if (!v7)
  {
    id v20 = v54;
    [v54 minusSet:self->_locationChangedURLs];
    goto LABEL_21;
  }
  unint64_t v59 = v7;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = self->_urlToETag;
  uint64_t v9 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v76 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v75 + 1) + 8 * i);
        int v15 = [(NSMutableDictionary *)self->_urlToETag objectForKey:v14];
        long long v16 = [v59 objectForKey:v14];
        BOOL v17 = [(CoreDAVContainerSyncTaskGroup *)self shouldDownloadResource:v14 localETag:v16 serverETag:v15];

        if (v17)
        {
          if ([v60 count] >= self->_multiGetBatchSize)
          {
            [v56 addObject:v60];
            id v19 = objc_alloc_init(MEMORY[0x263EFF9C0]);

            uint64_t v18 = v19;
          }
          else
          {
            uint64_t v18 = v60;
          }
          id v60 = v18;
          [v18 addObject:v14];
          ++v11;
        }
      }
      uint64_t v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v75 objects:v84 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  [v56 addObject:v60];
  if (!self->_useSyncCollection)
  {
    char v23 = [(CoreDAVTaskGroup *)self delegate];
    id v24 = (void *)[v23 copyAllLocalURLsInFolderWithURL:self->_folderURL];

    if (v24)
    {
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v71 objects:v83 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v72;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v72 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v71 + 1) + 8 * j);
            BOOL v31 = [(NSMutableDictionary *)self->_urlToETag objectForKey:v30];

            if (!v31) {
              [v54 addObject:v30];
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v71 objects:v83 count:16];
        }
        while (v27);
      }

      int v22 = v54;
      goto LABEL_36;
    }
    id v20 = v54;
    [v54 minusSet:self->_locationChangedURLs];
    id v7 = v59;
LABEL_21:
    uint64_t v21 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
    [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v21];

    goto LABEL_68;
  }
  int v22 = v54;
  [v54 unionSet:self->_syncReportDeletedURLs];
LABEL_36:
  [v22 minusSet:self->_locationChangedURLs];
  if ([v22 count]) {
    [(CoreDAVContainerSyncTaskGroup *)self deleteResourceURLs:v22];
  }
  if (v11)
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v32 = v56;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v65 objects:v80 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v66;
      unint64_t v36 = 0x2677FD000uLL;
      uint64_t v52 = *(void *)v66;
      id v53 = v32;
      do
      {
        id v37 = 0;
        uint64_t v55 = v34;
        do
        {
          if (*(void *)v66 != v35) {
            objc_enumerationMutation(v32);
          }
          v38 = *(void **)(*((void *)&v65 + 1) + 8 * (void)v37);
          if ([v38 count])
          {
            if (*((unsigned char *)&self->super.super.isa + *(int *)(v36 + 664)))
            {
              id v39 = [(CoreDAVContainerSyncTaskGroup *)self copyMultiGetTaskWithURLs:v38];
              [(CoreDAVContainerSyncTaskGroup *)self _configureMultiGet:v39];
              if (v39) {
                [(NSMutableArray *)self->_unsubmittedTasks addObject:v39];
              }
            }
            else
            {
              id obja = v37;
              long long v63 = 0u;
              long long v64 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              id v39 = v38;
              uint64_t v40 = [v39 countByEnumeratingWithState:&v61 objects:v79 count:16];
              if (v40)
              {
                uint64_t v41 = v40;
                uint64_t v42 = *(void *)v62;
                do
                {
                  for (uint64_t k = 0; k != v41; ++k)
                  {
                    if (*(void *)v62 != v42) {
                      objc_enumerationMutation(v39);
                    }
                    id v44 = [(CoreDAVContainerSyncTaskGroup *)self copyGetTaskWithURL:*(void *)(*((void *)&v61 + 1) + 8 * k)];
                    if (!v44)
                    {
                      v46 = [MEMORY[0x263F08690] currentHandler];
                      [v46 handleFailureInMethod:a2, self, @"CoreDAVContainerSyncTaskGroup.m", 719, @"Couldn't create getTask, things will go poorly" object file lineNumber description];
                    }
                    [v44 setDelegate:self];
                    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
                    [v44 setAccountInfoProvider:WeakRetained];

                    [v44 setTimeoutInterval:self->super._timeoutInterval];
                    [(NSMutableArray *)self->_unsubmittedTasks addObject:v44];
                  }
                  uint64_t v41 = [v39 countByEnumeratingWithState:&v61 objects:v79 count:16];
                }
                while (v41);
                uint64_t v35 = v52;
                id v32 = v53;
                uint64_t v34 = v55;
                unint64_t v36 = 0x2677FD000;
              }
              id v37 = obja;
            }
          }
          id v37 = (char *)v37 + 1;
        }
        while (v37 != (id)v34);
        uint64_t v34 = [v32 countByEnumeratingWithState:&v65 objects:v80 count:16];
      }
      while (v34);
    }

    [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];
    id v20 = v54;
  }
  else
  {
    uint64_t v47 = +[CoreDAVLogging sharedLogging];
    id v48 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    int v49 = [v47 logHandleForAccountInfoProvider:v48];

    if (v49 && os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v82 = self;
      _os_log_impl(&dword_213BFC000, v49, OS_LOG_TYPE_DEBUG, "%@: There are no server side items to grab, so I'm outta here", buf, 0xCu);
    }

    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __49__CoreDAVContainerSyncTaskGroup__getDataPayloads__block_invoke;
    v69[3] = &unk_2641DFC88;
    v69[4] = self;
    id v20 = v54;
    id v70 = v54;
    [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:v69];
  }
  id v7 = v59;
LABEL_68:
}

void __49__CoreDAVContainerSyncTaskGroup__getDataPayloads__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[14];
  if (!v4) {
    uint64_t v4 = v3[13];
  }
  uint64_t v5 = v3[17];
  if (!v5) {
    uint64_t v5 = v3[16];
  }
  id v6 = v2;
  [v2 containerSyncTask:v3 completedWithNewCTag:v4 newSyncToken:v5 addedOrModified:0 removed:*(void *)(a1 + 40) error:0];
}

- (void)startTaskGroup
{
  if ([(NSMutableArray *)self->_actions count])
  {
    objc_super v3 = [(NSDictionary *)self->_bulkRequests objectForKey:@"crud"];
    uint64_t v4 = [v3 objectForKey:@"max-resources"];

    if (v4)
    {
      self->_phase = 1;
LABEL_9:
      [(CoreDAVContainerSyncTaskGroup *)self _bulkChange];
      return;
    }
    uint64_t v5 = [(NSDictionary *)self->_bulkRequests objectForKey:@"simple"];
    id v6 = [v5 objectForKey:@"max-resources"];

    if (v6)
    {
      self->_phase = 0;
      goto LABEL_9;
    }
    [(CoreDAVContainerSyncTaskGroup *)self _pushActions];
  }
  else
  {
    [(CoreDAVContainerSyncTaskGroup *)self _getCTag];
  }
}

- (BOOL)isWhitelistedError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  int v5 = [v4 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"];

  BOOL v6 = v5 && [v3 code] >= 400 && objc_msgSend(v3, "code") < 500;
  return v6;
}

- (void)putTask:(id)a3 completedWithNewETag:(id)a4 error:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (NSMutableSet *)a4;
  uint64_t v10 = (NSMutableArray *)a5;
  if ([(NSMutableSet *)self->super._outstandingTasks containsObject:v8])
  {
    [(NSMutableSet *)self->super._outstandingTasks removeObject:v8];
    uint64_t v11 = v10;
    uint64_t v10 = v11;
    if (v11)
    {
      uint64_t v12 = [(NSMutableArray *)v11 domain];
      if ([v12 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"])
      {
        uint64_t v13 = [(NSMutableArray *)v10 code];

        if (v13 == 507)
        {
          uint64_t v14 = [(CoreDAVTaskGroup *)self delegate];
          char v15 = objc_opt_respondsToSelector();

          if (v15)
          {
            long long v16 = [(CoreDAVTaskGroup *)self delegate];
            BOOL v17 = [v16 handleInsufficientStorageForTask:v8 inFolderWithURL:self->_folderURL];

            if (v17)
            {
              uint64_t v18 = [v17 context];
              id v19 = [(CoreDAVContainerSyncTaskGroup *)self copyPutTaskWithPayloadItem:v18 forAction:v17];

              [v19 setDelegate:self];
              id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
              [v19 setAccountInfoProvider:WeakRetained];

              [v19 setTimeoutInterval:self->super._timeoutInterval];
              if (self->_syncItemOrder)
              {
                id v21 = v17;
                -[NSObject setAbsoluteOrder:](v19, "setAbsoluteOrder:", [v21 absoluteOrder]);
                int v22 = [v21 priorURL];

                [v19 setPriorOrderedURL:v22];
              }
              [(NSMutableArray *)self->_unsubmittedTasks insertObject:v19 atIndex:0];
              [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];
LABEL_14:

              goto LABEL_40;
            }
          }
        }
      }
      else
      {
      }
    }
    [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];
    if (![(NSMutableSet *)self->super._outstandingTasks count] && !self->super._isCancelling) {
      [(CoreDAVContainerSyncTaskGroup *)self _getCTag];
    }
    uint64_t v26 = [(CoreDAVTaskGroup *)self delegate];
    char v27 = objc_opt_respondsToSelector();

    uint64_t v28 = [(CoreDAVTaskGroup *)self delegate];
    long long v29 = v28;
    if (v27)
    {
      char v30 = [v28 syncPutTask:v8 completedWithNewETag:v9 parentTaskGroup:self error:v10];
    }
    else
    {
      char v31 = objc_opt_respondsToSelector();

      if ((v31 & 1) == 0) {
        goto LABEL_28;
      }
      long long v29 = [(CoreDAVTaskGroup *)self delegate];
      char v30 = [v29 syncPutTask:v8 completedWithNewETag:v9 error:v10];
    }
    char v32 = v30;

    if (v32)
    {

      uint64_t v10 = 0;
      if (![(CoreDAVContainerSyncTaskGroup *)self isWhitelistedError:0])
      {
LABEL_35:
        unint64_t v36 = [(CoreDAVTaskGroup *)self delegate];
        char v37 = objc_opt_respondsToSelector();

        if (v37)
        {
          v38 = [(CoreDAVTaskGroup *)self delegate];
          id v39 = [v8 url];
          char v40 = [v38 setLocalETag:v9 forItemWithURL:v39 inFolderWithURL:self->_folderURL];

          if ((v40 & 1) == 0)
          {
            uint64_t v41 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
            [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v41];
          }
          [(CoreDAVContainerSyncTaskGroup *)self applyAdditionalPropertiesFromPutTask:v8];
        }
        uint64_t v10 = 0;
        goto LABEL_40;
      }
LABEL_29:
      uint64_t v33 = +[CoreDAVLogging sharedLogging];
      id v34 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      uint64_t v35 = [v33 logHandleForAccountInfoProvider:v34];

      if (v35 && os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        int v42 = 138412802;
        id v43 = v8;
        __int16 v44 = 2114;
        int v45 = v9;
        __int16 v46 = 2112;
        uint64_t v47 = v10;
        _os_log_impl(&dword_213BFC000, v35, OS_LOG_TYPE_DEFAULT, "putTask:%@ completedWithNewETag:%{public}@ error:%@ Ignoring", (uint8_t *)&v42, 0x20u);
      }

      uint64_t v10 = 0;
      uint64_t v9 = 0;
      goto LABEL_40;
    }
    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
    }
LABEL_28:
    if (![(CoreDAVContainerSyncTaskGroup *)self isWhitelistedError:v10])
    {
      if (v10)
      {
        [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v10];
        goto LABEL_40;
      }
      goto LABEL_35;
    }
    goto LABEL_29;
  }
  if (([(NSMutableArray *)self->_unsubmittedTasks containsObject:v8] & 1) == 0)
  {
    BOOL v17 = +[CoreDAVLogging sharedLogging];
    id v23 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v19 = [v17 logHandleForAccountInfoProvider:v23];

    if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      int v42 = 138412802;
      id v43 = v8;
      __int16 v44 = 2112;
      int v45 = outstandingTasks;
      __int16 v46 = 2112;
      uint64_t v47 = unsubmittedTasks;
      _os_log_impl(&dword_213BFC000, v19, OS_LOG_TYPE_DEFAULT, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v42, 0x20u);
    }
    goto LABEL_14;
  }
LABEL_40:
}

- (void)_postTask:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (NSMutableSet *)a4;
  if ([(NSMutableSet *)self->super._outstandingTasks containsObject:v6])
  {
    [(NSMutableSet *)self->super._outstandingTasks removeObject:v6];
    [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];
    if (![(NSMutableSet *)self->super._outstandingTasks count] && !self->super._isCancelling) {
      [(CoreDAVContainerSyncTaskGroup *)self _getCTag];
    }
    id v8 = [(CoreDAVTaskGroup *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    uint64_t v10 = [(CoreDAVTaskGroup *)self delegate];
    uint64_t v11 = v10;
    if (v9)
    {
      int v12 = [v10 syncPostTask:v6 postedData:0 parentTaskGroup:self error:v7];

      if (v12) {
        goto LABEL_22;
      }
    }
    else
    {
      char v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0)
      {
        if ([(CoreDAVContainerSyncTaskGroup *)self isWhitelistedError:v7])
        {
          id v21 = +[CoreDAVLogging sharedLogging];
          id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          id v23 = [v21 logHandleForAccountInfoProvider:WeakRetained];

          if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            int v24 = 138412546;
            id v25 = v6;
            __int16 v26 = 2112;
            char v27 = v7;
            _os_log_impl(&dword_213BFC000, v23, OS_LOG_TYPE_ERROR, "postTask:%@ error:%@ Ignoring", (uint8_t *)&v24, 0x16u);
          }

          goto LABEL_22;
        }
        goto LABEL_24;
      }
      id v19 = [(CoreDAVTaskGroup *)self delegate];
      char v20 = [v19 syncPostTask:v6 data:0 error:v7];

      if (v20)
      {
LABEL_22:

LABEL_23:
        [(CoreDAVContainerSyncTaskGroup *)self applyAdditionalPropertiesFromPostTask:v6];
        id v7 = 0;
        goto LABEL_26;
      }
    }
    if (v7) {
      goto LABEL_25;
    }
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
LABEL_24:
    if (!v7) {
      goto LABEL_23;
    }
LABEL_25:
    [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v7];
    goto LABEL_26;
  }
  if (([(NSMutableArray *)self->_unsubmittedTasks containsObject:v6] & 1) == 0)
  {
    uint64_t v13 = +[CoreDAVLogging sharedLogging];
    id v14 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    char v15 = [v13 logHandleForAccountInfoProvider:v14];

    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      int v24 = 138412802;
      id v25 = v6;
      __int16 v26 = 2112;
      char v27 = outstandingTasks;
      __int16 v28 = 2112;
      long long v29 = unsubmittedTasks;
      _os_log_impl(&dword_213BFC000, v15, OS_LOG_TYPE_DEFAULT, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v24, 0x20u);
    }
  }
LABEL_26:
}

- (void)_syncReportTask:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableSet *)self->super._outstandingTasks containsObject:v6])
  {
    [(NSMutableSet *)self->super._outstandingTasks removeObject:v6];
    if (self->_phase == 4)
    {
      if ([v6 wasInvalidSyncToken])
      {
        [(CoreDAVContainerSyncTaskGroup *)self setPreviousSyncToken:0];
        [(CoreDAVContainerSyncTaskGroup *)self setUseSyncCollection:0];
        [(CoreDAVContainerSyncTaskGroup *)self _getCTag];
      }
      else if ([v6 hadUnexpectedChangeOfSyncTokenWithZeroResponses] {
             && (unint64_t v13 = [(CoreDAVContainerSyncTaskGroup *)self unexpectedEmptySyncReportResponseRetryAttemptCount], v13 < [(CoreDAVContainerSyncTaskGroup *)self maxRetryOnUnexpectedSyncTokenChange]))
      }
      {
        id v14 = +[CoreDAVLogging sharedLogging];
        id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        long long v16 = [v14 logHandleForAccountInfoProvider:WeakRetained];

        if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213BFC000, v16, OS_LOG_TYPE_INFO, "Retrying a sync-report after unexpectedly receiving a new sync token but no new content", buf, 2u);
        }

        BOOL v17 = [(CoreDAVTaskGroup *)self delegate];
        char v18 = objc_opt_respondsToSelector();

        if (v18)
        {
          id v19 = [(CoreDAVTaskGroup *)self delegate];
          objc_msgSend(v19, "logRetryAfterEmptyResponseContainerSyncTask:retryCount:", self, -[CoreDAVContainerSyncTaskGroup unexpectedEmptySyncReportResponseRetryAttemptCount](self, "unexpectedEmptySyncReportResponseRetryAttemptCount"));
        }
        [(CoreDAVContainerSyncTaskGroup *)self setUnexpectedEmptySyncReportResponseRetryAttemptCount:[(CoreDAVContainerSyncTaskGroup *)self unexpectedEmptySyncReportResponseRetryAttemptCount]+ 1];
        [(CoreDAVContainerSyncTaskGroup *)self _getETags];
      }
      else if (v7)
      {
        [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v7];
      }
      else
      {
        if (!self->_urlToETag)
        {
          char v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
          urlToETag = self->_urlToETag;
          self->_urlToETag = v20;
        }
        if ([v6 hadUnexpectedChangeOfSyncTokenWithZeroResponses])
        {
          int v22 = +[CoreDAVLogging sharedLogging];
          id v23 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          int v24 = [v22 logHandleForAccountInfoProvider:v23];

          if (v24)
          {
            id v25 = v24;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              __int16 v26 = [v6 nextSyncToken];
              *(_DWORD *)buf = 138543618;
              id v70 = v26;
              __int16 v71 = 2048;
              unint64_t v72 = [(CoreDAVContainerSyncTaskGroup *)self unexpectedEmptySyncReportResponseRetryAttemptCount];
              _os_log_impl(&dword_213BFC000, v25, OS_LOG_TYPE_ERROR, "Accepting a new sync token: %{public}@ despite zero responses, after retrying the original sync-report %lu additional times.", buf, 0x16u);
            }
          }

          char v27 = [(CoreDAVTaskGroup *)self delegate];
          char v28 = objc_opt_respondsToSelector();

          if (v28)
          {
            long long v29 = [(CoreDAVTaskGroup *)self delegate];
            objc_msgSend(v29, "logGaveUpAcceptedEmptyResponseContainerSyncTask:retryCount:", self, -[CoreDAVContainerSyncTaskGroup unexpectedEmptySyncReportResponseRetryAttemptCount](self, "unexpectedEmptySyncReportResponseRetryAttemptCount"));
          }
        }
        long long v62 = v6;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        uint64_t v30 = objc_msgSend(v6, "multiStatus", 0);
        char v31 = [v30 responses];

        id obj = v31;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v65 objects:v75 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v64 = *(void *)v66;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v66 != v64) {
                objc_enumerationMutation(obj);
              }
              uint64_t v35 = *(void **)(*((void *)&v65 + 1) + 8 * i);
              unint64_t v36 = [v35 successfulPropertiesToValues];
              char v37 = [v36 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"getetag"];
              v38 = [v37 payloadAsString];
              id v39 = [v35 firstHref];
              char v40 = [v39 payloadAsFullURL];

              LODWORD(v39) = [(CoreDAVContainerSyncTaskGroup *)self shouldFetchResourceWithEtag:v38 propertiesToValues:v36];
              [(CoreDAVContainerSyncTaskGroup *)self receivedPropertiesToValues:v36 forURL:v40];
              if (v39)
              {
                if (v38) {
                  BOOL v41 = v40 == 0;
                }
                else {
                  BOOL v41 = 1;
                }
                if (v41)
                {
                  int v42 = [v35 status];
                  id v43 = [v42 payloadAsString];
                  char v44 = [v43 CDVIsHTTPStatusLineWithStatusCode:404];

                  if ((v44 & 1) == 0)
                  {
                    int v45 = +[CoreDAVLogging sharedLogging];
                    id v46 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
                    uint64_t v47 = [v45 logHandleForAccountInfoProvider:v46];

                    if (v47 && os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      id v70 = v38;
                      __int16 v71 = 2112;
                      unint64_t v72 = (unint64_t)v40;
                      _os_log_impl(&dword_213BFC000, v47, OS_LOG_TYPE_DEFAULT, "Found an eTag without one or both of eTag (%{public}@) or url (%@). Dropping it on the floor", buf, 0x16u);
                    }
                  }
                }
                else
                {
                  char v48 = [v40 isEqual:self->_folderURL];
                  if ((v48 & 1) == 0) {
                    [(NSMutableDictionary *)self->_urlToETag setObject:v38 forKey:v40];
                  }
                }
              }
            }
            uint64_t v33 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
          }
          while (v33);
        }

        id v6 = v62;
        int v49 = [v62 notFoundHREFs];
        id v7 = v61;
        if ([v49 count])
        {
          syncReportDeletedURLs = self->_syncReportDeletedURLs;
          if (!syncReportDeletedURLs)
          {
            int v51 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
            uint64_t v52 = self->_syncReportDeletedURLs;
            self->_syncReportDeletedURLs = v51;

            syncReportDeletedURLs = self->_syncReportDeletedURLs;
          }
          [(NSMutableSet *)syncReportDeletedURLs unionSet:v49];
        }
        int v53 = [v62 moreToSync];
        id v54 = [v62 nextSyncToken];
        uint64_t v55 = v54;
        if (v53)
        {

          if (v55)
          {
            id v56 = [v62 nextSyncToken];
            [(CoreDAVContainerSyncTaskGroup *)self setPreviousSyncToken:v56];
          }
          else
          {
            v58 = +[CoreDAVLogging sharedLogging];
            id v59 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            id v60 = [v58 logHandleForAccountInfoProvider:v59];

            if (v60 && os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_213BFC000, v60, OS_LOG_TYPE_DEFAULT, "Was told to sync more items, but got no new sync token.  Starting from scatch", buf, 2u);
            }

            [(CoreDAVContainerSyncTaskGroup *)self setPreviousSyncToken:0];
            [(CoreDAVContainerSyncTaskGroup *)self setUseSyncCollection:0];
            [(NSMutableDictionary *)self->_urlToETag removeAllObjects];
            [(NSMutableSet *)self->_syncReportDeletedURLs removeAllObjects];
          }
          [(CoreDAVContainerSyncTaskGroup *)self _getETags];
        }
        else
        {
          nextSyncToken = self->_nextSyncToken;
          self->_nextSyncToken = (NSString *)v54;

          [(CoreDAVContainerSyncTaskGroup *)self _getOrder];
        }
      }
    }
  }
  else if (([(NSMutableArray *)self->_unsubmittedTasks containsObject:v6] & 1) == 0)
  {
    id v8 = +[CoreDAVLogging sharedLogging];
    id v9 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    uint64_t v10 = [v8 logHandleForAccountInfoProvider:v9];

    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      *(_DWORD *)buf = 138412802;
      id v70 = v6;
      __int16 v71 = 2112;
      unint64_t v72 = (unint64_t)outstandingTasks;
      __int16 v73 = 2112;
      long long v74 = unsubmittedTasks;
      _os_log_impl(&dword_213BFC000, v10, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", buf, 0x20u);
    }
  }
}

- (void)_bulkChangeTask:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableSet *)self->super._outstandingTasks containsObject:v6])
  {
    [(NSMutableSet *)self->super._outstandingTasks removeObject:v6];
    if (!self->_bulkChangeCheckCTag)
    {
      [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];
      if (![(NSMutableSet *)self->super._outstandingTasks count] && !self->super._isCancelling) {
        [(CoreDAVContainerSyncTaskGroup *)self _getCTag];
      }
    }
    id v8 = [(CoreDAVTaskGroup *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    uint64_t v10 = [(CoreDAVTaskGroup *)self delegate];
    uint64_t v11 = v10;
    if (v9)
    {
      int v12 = [v10 syncBulkChangeTask:v6 parentTaskGroup:self completedWithError:v7];

      if (v12)
      {
LABEL_8:

LABEL_26:
        if (self->_bulkChangeCheckCTag)
        {
          __int16 v26 = [v6 nextCTag];
          [(CoreDAVContainerSyncTaskGroup *)self setBulkChangeCheckCTag:v26];

          [(CoreDAVContainerSyncTaskGroup *)self _sendNextBatch];
        }
        id v7 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      char v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0)
      {
        if ([v7 code] == 412)
        {
          id v21 = [v7 domain];
          int v22 = [v21 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"];

          if (v22)
          {
            id v23 = +[CoreDAVLogging sharedLogging];
            id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            id v25 = [v23 logHandleForAccountInfoProvider:WeakRetained];

            if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              LOWORD(v27) = 0;
              _os_log_impl(&dword_213BFC000, v25, OS_LOG_TYPE_INFO, "BulkChangeTask told that our ctag was out of date.  Bailing on the group", (uint8_t *)&v27, 2u);
            }
          }
        }
        goto LABEL_24;
      }
      id v19 = [(CoreDAVTaskGroup *)self delegate];
      char v20 = [v19 syncBulkChangeTask:v6 error:v7];

      if (v20) {
        goto LABEL_8;
      }
    }
    if (v7) {
      goto LABEL_25;
    }
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
LABEL_24:
    if (!v7) {
      goto LABEL_26;
    }
LABEL_25:
    [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v7];
    goto LABEL_29;
  }
  if (([(NSMutableArray *)self->_unsubmittedTasks containsObject:v6] & 1) == 0)
  {
    unint64_t v13 = +[CoreDAVLogging sharedLogging];
    id v14 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    char v15 = [v13 logHandleForAccountInfoProvider:v14];

    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      int v27 = 138412802;
      id v28 = v6;
      __int16 v29 = 2112;
      uint64_t v30 = outstandingTasks;
      __int16 v31 = 2112;
      uint64_t v32 = unsubmittedTasks;
      _os_log_impl(&dword_213BFC000, v15, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v27, 0x20u);
    }
  }
LABEL_29:
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CoreDAVContainerSyncTaskGroup *)self _postTask:v6 didFinishWithError:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CoreDAVContainerSyncTaskGroup *)self _syncReportTask:v6 didFinishWithError:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(CoreDAVContainerSyncTaskGroup *)self _bulkChangeTask:v6 didFinishWithError:v7];
      }
      else
      {
        id v8 = +[CoreDAVLogging sharedLogging];
        id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        uint64_t v10 = [v8 logHandleForAccountInfoProvider:WeakRetained];

        if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v11 = 138412290;
          id v12 = v6;
          _os_log_impl(&dword_213BFC000, v10, OS_LOG_TYPE_ERROR, "Got a task completion invocation for a task I don't grok, %@", (uint8_t *)&v11, 0xCu);
        }
      }
    }
  }
}

- (void)deleteTask:(id)a3 completedWithError:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (NSMutableSet *)a4;
  if (![(NSMutableSet *)self->super._outstandingTasks containsObject:v6])
  {
    if (([(NSMutableArray *)self->_unsubmittedTasks containsObject:v6] & 1) == 0)
    {
      uint64_t v13 = +[CoreDAVLogging sharedLogging];
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      char v15 = [v13 logHandleForAccountInfoProvider:WeakRetained];

      if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        outstandingTasks = self->super._outstandingTasks;
        unsubmittedTasks = self->_unsubmittedTasks;
        int v23 = 138412802;
        id v24 = v6;
        __int16 v25 = 2112;
        __int16 v26 = outstandingTasks;
        __int16 v27 = 2112;
        id v28 = unsubmittedTasks;
        _os_log_impl(&dword_213BFC000, v15, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v23, 0x20u);
      }
    }
    goto LABEL_26;
  }
  [(NSMutableSet *)self->super._outstandingTasks removeObject:v6];
  [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];
  if (![(NSMutableSet *)self->super._outstandingTasks count] && !self->super._isCancelling) {
    [(CoreDAVContainerSyncTaskGroup *)self _getCTag];
  }
  id v8 = [(CoreDAVTaskGroup *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  uint64_t v10 = [(CoreDAVTaskGroup *)self delegate];
  int v11 = v10;
  if (v9)
  {
    char v12 = [v10 syncDeleteTask:v6 parentTaskGroup:self completedWithError:v7];
LABEL_14:
    char v19 = v12;

    if (v19)
    {

      id v7 = 0;
      if (![(CoreDAVContainerSyncTaskGroup *)self isWhitelistedError:0]) {
        goto LABEL_26;
      }
      goto LABEL_20;
    }
    if (!v7)
    {
      id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
    }
    goto LABEL_19;
  }
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    int v11 = [(CoreDAVTaskGroup *)self delegate];
    char v12 = [v11 syncDeleteTask:v6 error:v7];
    goto LABEL_14;
  }
LABEL_19:
  if ([(CoreDAVContainerSyncTaskGroup *)self isWhitelistedError:v7])
  {
LABEL_20:
    char v20 = +[CoreDAVLogging sharedLogging];
    id v21 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    int v22 = [v20 logHandleForAccountInfoProvider:v21];

    if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412546;
      id v24 = v6;
      __int16 v25 = 2112;
      __int16 v26 = v7;
      _os_log_impl(&dword_213BFC000, v22, OS_LOG_TYPE_DEFAULT, "deleteTask:%@ completedWithError:%@ Ignoring", (uint8_t *)&v23, 0x16u);
    }

    id v7 = 0;
    goto LABEL_26;
  }
  if (v7) {
    [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v7];
  }
LABEL_26:
}

- (BOOL)shouldFetchMoreETags
{
  return 0;
}

- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v8 = (CoreDAVContainerSyncTaskGroup *)a3;
  char v9 = (CoreDAVContainerSyncTaskGroup *)a4;
  id v10 = a5;
  if (![(NSMutableSet *)self->super._outstandingTasks containsObject:v8])
  {
    if (([(NSMutableArray *)self->_unsubmittedTasks containsObject:v8] & 1) == 0)
    {
      id v28 = self;
      id v29 = v10;
      uint64_t v30 = +[CoreDAVLogging sharedLogging];
      __int16 v31 = v28;
      id WeakRetained = objc_loadWeakRetained((id *)&v28->super._accountInfoProvider);
      uint64_t v33 = [v30 logHandleForAccountInfoProvider:WeakRetained];

      if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        outstandingTasks = v31->super._outstandingTasks;
        unsubmittedTasks = v31->_unsubmittedTasks;
        *(_DWORD *)buf = 138412802;
        v94 = v8;
        __int16 v95 = 2112;
        p_isa = (NSString *)&outstandingTasks->super.super.isa;
        __int16 v97 = 2112;
        v98 = unsubmittedTasks;
        _os_log_impl(&dword_213BFC000, v33, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", buf, 0x20u);
      }

      id v10 = v29;
    }
    goto LABEL_81;
  }
  [(NSMutableSet *)self->super._outstandingTasks removeObject:v8];
  if (v10)
  {
    int v11 = [v10 domain];
    if (([v11 isEqualToString:@"CoreDAVErrorDomain"] & 1) == 0)
    {

LABEL_28:
      [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v10];
      goto LABEL_81;
    }
    id v12 = v10;
    uint64_t v13 = [v10 code];

    BOOL v14 = v13 == 2;
    id v10 = v12;
    if (!v14) {
      goto LABEL_28;
    }
  }
  int phase = self->_phase;
  if (phase == 4)
  {
    unint64_t v36 = [(CoreDAVContainerSyncTaskGroup *)v8 multiStatus];

    if (!v36)
    {
      id v59 = v10;
      id v60 = +[CoreDAVLogging sharedLogging];
      id v61 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      long long v62 = [v60 logHandleForAccountInfoProvider:v61];

      if (v62 && os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213BFC000, v62, OS_LOG_TYPE_DEFAULT, "No responses when fetching current etags. Giving up.", buf, 2u);
      }

      long long v63 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:8 userInfo:0];
      [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v63];

      id v10 = v59;
      goto LABEL_81;
    }
    if (!self->_urlToETag)
    {
      char v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      urlToETag = self->_urlToETag;
      self->_urlToETag = v37;
    }
    uint64_t v76 = v8;
    id v77 = v10;
    if (!self->_localItemURLOrder)
    {
      id v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      localItemURLOrder = self->_localItemURLOrder;
      self->_localItemURLOrder = v39;
    }
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id obj = v9;
    uint64_t v41 = [(CoreDAVContainerSyncTaskGroup *)obj countByEnumeratingWithState:&v82 objects:v99 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v83;
      v79 = self;
      do
      {
        uint64_t v44 = 0;
        uint64_t v80 = v42;
        do
        {
          if (*(void *)v83 != v43) {
            objc_enumerationMutation(obj);
          }
          int v45 = *(void **)(*((void *)&v82 + 1) + 8 * v44);
          id v46 = [v45 firstHref];
          uint64_t v47 = [v46 payloadAsFullURL];

          if (([v47 isEqual:self->_folderURL] & 1) == 0)
          {
            char v48 = [v45 successfulPropertiesToValues];
            int v49 = [v48 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"getetag"];
            uint64_t v50 = [v49 payloadAsString];
            if (v47) {
              [(NSMutableArray *)self->_localItemURLOrder addObject:v47];
            }
            BOOL v51 = [(CoreDAVContainerSyncTaskGroup *)self shouldFetchResourceWithEtag:v50 propertiesToValues:v48];
            [(CoreDAVContainerSyncTaskGroup *)self receivedPropertiesToValues:v48 forURL:v47];
            if (v51)
            {
              if (v47 && v50)
              {
                if (([v47 isEqual:self->_folderURL] & 1) == 0) {
                  [(NSMutableDictionary *)self->_urlToETag setObject:v50 forKey:v47];
                }
              }
              else
              {
                uint64_t v52 = +[CoreDAVLogging sharedLogging];
                id v53 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
                id v54 = [v52 logHandleForAccountInfoProvider:v53];

                if (v54 && os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v94 = v50;
                  __int16 v95 = 2112;
                  p_isa = (NSString *)v47;
                  _os_log_impl(&dword_213BFC000, v54, OS_LOG_TYPE_DEFAULT, "Found an eTag without one or both of eTag (%{public}@) or url (%@). Dropping it on the floor", buf, 0x16u);
                }

                self = v79;
              }
            }

            uint64_t v42 = v80;
          }

          ++v44;
        }
        while (v42 != v44);
        uint64_t v42 = [(CoreDAVContainerSyncTaskGroup *)obj countByEnumeratingWithState:&v82 objects:v99 count:16];
      }
      while (v42);
    }

    if ([(CoreDAVContainerSyncTaskGroup *)self shouldFetchMoreETags]) {
      [(CoreDAVContainerSyncTaskGroup *)self _getETags];
    }
    else {
      [(CoreDAVContainerSyncTaskGroup *)self _getOrder];
    }
    id v8 = v76;
LABEL_66:
    id v10 = v77;
    goto LABEL_81;
  }
  if (phase != 3) {
    goto LABEL_81;
  }
  id v77 = v10;
  if (![(CoreDAVContainerSyncTaskGroup *)v9 count])
  {
    uint64_t v55 = +[CoreDAVLogging sharedLogging];
    id v56 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    unint64_t v57 = [v55 logHandleForAccountInfoProvider:v56];

    if (v57 && os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v94 = v9;
      _os_log_impl(&dword_213BFC000, v57, OS_LOG_TYPE_DEFAULT, "We need exactly one ctag per container.  We got %@", buf, 0xCu);
    }

    v58 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:8 userInfo:0];
    [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v58];

    goto LABEL_66;
  }
  long long v78 = self;
  long long v74 = v9;
  long long v75 = v8;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v16 = v9;
  uint64_t v17 = [(CoreDAVContainerSyncTaskGroup *)v16 countByEnumeratingWithState:&v89 objects:v100 count:16];
  if (!v17)
  {
    char v19 = 0;
    char v20 = 0;
    goto LABEL_68;
  }
  uint64_t v18 = v17;
  char v19 = 0;
  char v20 = 0;
  uint64_t v21 = *(void *)v90;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v90 != v21) {
        objc_enumerationMutation(v16);
      }
      int v23 = [*(id *)(*((void *)&v89 + 1) + 8 * v22) successfulPropertiesToValues];
      id v24 = v23;
      if (v20)
      {
        if (v19) {
          goto LABEL_16;
        }
      }
      else
      {
        __int16 v25 = [v23 CDVObjectForKeyWithNameSpace:@"http://calendarserver.org/ns/" andName:@"getctag"];
        char v20 = [v25 payloadAsString];

        if (v19) {
          goto LABEL_16;
        }
      }
      __int16 v26 = [v24 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"sync-token"];
      char v19 = [v26 payloadAsString];

LABEL_16:
      ++v22;
    }
    while (v18 != v22);
    uint64_t v27 = [(CoreDAVContainerSyncTaskGroup *)v16 countByEnumeratingWithState:&v89 objects:v100 count:16];
    uint64_t v18 = v27;
  }
  while (v27);
LABEL_68:

  if (v78->_actionsOnly)
  {
    uint64_t v64 = +[CoreDAVLogging sharedLogging];
    id v65 = objc_loadWeakRetained((id *)&v78->super._accountInfoProvider);
    long long v66 = [v64 logHandleForAccountInfoProvider:v65];

    id v8 = v75;
    if (v66 && os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v94 = v78;
      _os_log_impl(&dword_213BFC000, v66, OS_LOG_TYPE_DEBUG, "%@: _actionsOnly and actions are complete, so I'm outta here", buf, 0xCu);
    }

    v87[0] = MEMORY[0x263EF8330];
    v87[1] = 3221225472;
    v87[2] = __68__CoreDAVContainerSyncTaskGroup_propFindTask_parsedResponses_error___block_invoke;
    v87[3] = &unk_2641DFC88;
    v87[4] = v78;
    v88 = v20;
    [(CoreDAVTaskGroup *)v78 finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:v87];

LABEL_78:
    char v9 = v74;
LABEL_79:
    id v10 = v77;
  }
  else
  {
    id v8 = v75;
    if (v78->_useSyncCollection)
    {
      if (v20) {
        long long v67 = v20;
      }
      else {
        long long v67 = @"ServerDoesNotSupportCTags";
      }
      [(CoreDAVContainerSyncTaskGroup *)v78 setNextCTag:v67];
      [(CoreDAVContainerSyncTaskGroup *)v78 _getETags];
      goto LABEL_78;
    }
    objc_storeStrong((id *)&v78->_nextSyncToken, v19);
    char v9 = v74;
    id v10 = v77;
    if (v20)
    {
      if ([(__CFString *)v20 isEqualToString:v78->_previousCTag])
      {
        long long v68 = +[CoreDAVLogging sharedLogging];
        id v69 = objc_loadWeakRetained((id *)&v78->super._accountInfoProvider);
        id v70 = [v68 logHandleForAccountInfoProvider:v69];

        if (v70 && os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          previousCTag = v78->_previousCTag;
          *(_DWORD *)buf = 138412546;
          v94 = v78;
          __int16 v95 = 2114;
          p_isa = previousCTag;
          _os_log_impl(&dword_213BFC000, v70, OS_LOG_TYPE_INFO, "%@: Finishing container sync early, as our cTag of %{public}@ says we're up to date", buf, 0x16u);
        }

        v86[0] = MEMORY[0x263EF8330];
        v86[1] = 3221225472;
        v86[2] = __68__CoreDAVContainerSyncTaskGroup_propFindTask_parsedResponses_error___block_invoke_95;
        v86[3] = &unk_2641DFC10;
        v86[4] = v78;
        [(CoreDAVTaskGroup *)v78 finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:v86];
        goto LABEL_79;
      }
      __int16 v73 = v78;
      unint64_t v72 = v20;
    }
    else
    {
      unint64_t v72 = @"ServerDoesNotSupportCTags";
      __int16 v73 = v78;
    }
    [(CoreDAVContainerSyncTaskGroup *)v73 setNextCTag:v72];
    [(CoreDAVContainerSyncTaskGroup *)v78 _getETags];
  }

LABEL_81:
}

void __68__CoreDAVContainerSyncTaskGroup_propFindTask_parsedResponses_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  id v4 = v2;
  if (*(void *)(a1 + 40)) {
    id v3 = *(__CFString **)(a1 + 40);
  }
  else {
    id v3 = @"ServerDoesNotSupportCTags";
  }
  [v2 containerSyncTask:*(void *)(a1 + 32) completedWithNewCTag:v3 newSyncToken:*(void *)(*(void *)(a1 + 32) + 128) addedOrModified:0 removed:0 error:0];
}

void __68__CoreDAVContainerSyncTaskGroup_propFindTask_parsedResponses_error___block_invoke_95(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 containerSyncTask:*(void *)(a1 + 32) completedWithNewCTag:*(void *)(*(void *)(a1 + 32) + 104) newSyncToken:*(void *)(*(void *)(a1 + 32) + 136) addedOrModified:0 removed:0 error:0];
}

- (void)getTask:(id)a3 data:(id)a4 error:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int phase = self->_phase;
  if (phase == 6)
  {
    id v12 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v13 = [v8 appSpecificDataItemResult];
    BOOL v14 = objc_msgSend(v12, "initWithObjects:", v13, 0);

    [(CoreDAVContainerSyncTaskGroup *)self _getTask:v8 finishedWithParsedContents:v14 deletedItems:0 error:v10];
LABEL_16:

    goto LABEL_17;
  }
  if (phase != 5)
  {
    BOOL v14 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    long long v16 = [v14 logHandleForAccountInfoProvider:WeakRetained];

    if (!v16 || !os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v17 = self->_phase;
    *(_DWORD *)buf = 67109120;
    LODWORD(v42) = v17;
    uint64_t v18 = "CoreDAVGetTask finished in unexpected phase %d";
    char v19 = v16;
    uint32_t v20 = 8;
LABEL_14:
    _os_log_impl(&dword_213BFC000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
LABEL_15:

    goto LABEL_16;
  }
  if (![(NSMutableSet *)self->super._outstandingTasks containsObject:v8])
  {
    if ([(NSMutableArray *)self->_unsubmittedTasks containsObject:v8]) {
      goto LABEL_17;
    }
    BOOL v14 = +[CoreDAVLogging sharedLogging];
    id v21 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    long long v16 = [v14 logHandleForAccountInfoProvider:v21];

    if (!v16 || !os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    outstandingTasks = self->super._outstandingTasks;
    unsubmittedTasks = self->_unsubmittedTasks;
    *(_DWORD *)buf = 138412802;
    id v42 = v8;
    __int16 v43 = 2112;
    uint64_t v44 = outstandingTasks;
    __int16 v45 = 2112;
    id v46 = unsubmittedTasks;
    uint64_t v18 = "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@";
    char v19 = v16;
    uint32_t v20 = 32;
    goto LABEL_14;
  }
  [(NSMutableSet *)self->super._outstandingTasks removeObject:v8];
  if (v10)
  {
    [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v10];
  }
  else
  {
    id v36 = v8;
    if (!self->_localItemURLOrder)
    {
      id v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      localItemURLOrder = self->_localItemURLOrder;
      self->_localItemURLOrder = v24;
    }
    id v35 = v9;
    id v34 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
    __int16 v26 = [v34 componentsSeparatedByString:@","];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(id *)(*((void *)&v37 + 1) + 8 * i);
          if (([v31 hasSuffix:@"xbel"] & 1) == 0)
          {
            uint64_t v32 = [v31 CDVStringByAppendingSlashIfNeeded];

            id v31 = (id)v32;
          }
          uint64_t v33 = [(NSURL *)self->_folderURL CDVfixedURLByAppendingPathComponent:v31];
          [(NSMutableArray *)self->_localItemURLOrder addObject:v33];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v28);
    }
    [(CoreDAVContainerSyncTaskGroup *)self _getDataPayloads];

    id v9 = v35;
    id v8 = v36;
    id v10 = 0;
  }
LABEL_17:
}

- (void)_getTask:(id)a3 finishedWithParsedContents:(id)a4 deletedItems:(id)a5 error:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = (CoreDAVContainerSyncTaskGroup *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![(NSMutableSet *)self->super._outstandingTasks containsObject:v10])
  {
    if ([(NSMutableArray *)self->_unsubmittedTasks containsObject:v10]) {
      goto LABEL_12;
    }
    BOOL v14 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    long long v16 = [v14 logHandleForAccountInfoProvider:WeakRetained];

    if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      *(_DWORD *)buf = 138412802;
      __int16 v26 = v10;
      __int16 v27 = 2112;
      uint64_t v28 = outstandingTasks;
      __int16 v29 = 2112;
      uint64_t v30 = unsubmittedTasks;
      _os_log_impl(&dword_213BFC000, v16, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", buf, 0x20u);
    }

LABEL_11:
    goto LABEL_12;
  }
  [(NSMutableSet *)self->super._outstandingTasks removeObject:v10];
  if (v13)
  {
    [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v13];
    goto LABEL_12;
  }
  [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];
  if ([(NSMutableSet *)self->super._outstandingTasks count])
  {
    BOOL v14 = [(CoreDAVTaskGroup *)self delegate];
    [v14 containerSyncTask:self retrievedAddedOrModifiedActions:v11 removed:v12];
    goto LABEL_11;
  }
  char v19 = +[CoreDAVLogging sharedLogging];
  id v20 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  id v21 = [v19 logHandleForAccountInfoProvider:v20];

  if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v26 = self;
    _os_log_impl(&dword_213BFC000, v21, OS_LOG_TYPE_INFO, "CoreDAVContainerSyncTaskGroup %@ finished its get task with no more outstanding tasks", buf, 0xCu);
  }

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __88__CoreDAVContainerSyncTaskGroup__getTask_finishedWithParsedContents_deletedItems_error___block_invoke;
  v22[3] = &unk_2641DFCB0;
  v22[4] = self;
  id v23 = v11;
  id v24 = v12;
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:v22];

LABEL_12:
}

void __88__CoreDAVContainerSyncTaskGroup__getTask_finishedWithParsedContents_deletedItems_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 containerSyncTask:*(void *)(a1 + 32) completedWithNewCTag:*(void *)(*(void *)(a1 + 32) + 112) newSyncToken:*(void *)(*(void *)(a1 + 32) + 136) addedOrModified:*(void *)(a1 + 40) removed:*(void *)(a1 + 48) error:0];
}

- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(NSMutableSet *)self->super._outstandingTasks containsObject:v8]) {
    goto LABEL_15;
  }
  [(NSMutableSet *)self->super._outstandingTasks removeObject:v8];
  [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];
  if (![(NSMutableSet *)self->super._outstandingTasks count] && !self->super._isCancelling) {
    [(CoreDAVContainerSyncTaskGroup *)self _getCTag];
  }
  id v11 = [(CoreDAVTaskGroup *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(CoreDAVTaskGroup *)self delegate];
    int v14 = [v13 syncPropPatchTask:v8 parsedResponses:v9 parentTaskGroup:self completedWithError:v10];

    if (v14)
    {

      id v10 = 0;
      goto LABEL_15;
    }
    if (v10) {
      goto LABEL_11;
    }
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
  }
  if (!v10) {
    goto LABEL_15;
  }
LABEL_11:
  char v15 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  int v17 = [v15 logHandleForAccountInfoProvider:WeakRetained];

  if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v18 = 138412546;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_213BFC000, v17, OS_LOG_TYPE_ERROR, "propPatchTask: %@ error: %@", (uint8_t *)&v18, 0x16u);
  }

  [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v10];
LABEL_15:
}

- (NSURL)folderURL
{
  return self->_folderURL;
}

- (NSString)previousCTag
{
  return self->_previousCTag;
}

- (void)setPreviousCTag:(id)a3
{
}

- (NSString)previousSyncToken
{
  return self->_previousSyncToken;
}

- (void)setPreviousSyncToken:(id)a3
{
}

- (BOOL)useSyncCollection
{
  return self->_useSyncCollection;
}

- (void)setUseSyncCollection:(BOOL)a3
{
  self->_useSyncCollection = a3;
}

- (unint64_t)multiGetBatchSize
{
  return self->_multiGetBatchSize;
}

- (void)setMultiGetBatchSize:(unint64_t)a3
{
  self->_multiGetBatchSize = a3;
}

- (BOOL)useMultiGet
{
  return self->_useMultiGet;
}

- (void)setUseMultiGet:(BOOL)a3
{
  self->_useMultiGet = a3;
}

- (unint64_t)maxIndependentTasks
{
  return self->_maxIndependentTasks;
}

- (void)setMaxIndependentTasks:(unint64_t)a3
{
  self->_maxIndependentTasks = a3;
}

- (NSURL)addMemberURL
{
  return self->_addMemberURL;
}

- (void)setAddMemberURL:(id)a3
{
}

- (NSDictionary)bulkRequests
{
  return self->_bulkRequests;
}

- (void)setBulkRequests:(id)a3
{
}

- (NSString)bulkChangeCheckCTag
{
  return self->_bulkChangeCheckCTag;
}

- (void)setBulkChangeCheckCTag:(id)a3
{
}

- (BOOL)actionsOnly
{
  return self->_actionsOnly;
}

- (void)setActionsOnly:(BOOL)a3
{
  self->_actionsOnly = a3;
}

- (NSArray)localItemURLOrder
{
  return &self->_localItemURLOrder->super;
}

- (BOOL)ensureUpdatedCTag
{
  return self->_ensureUpdatedCTag;
}

- (void)setEnsureUpdatedCTag:(BOOL)a3
{
  self->_ensureUpdatedCTag = a3;
}

- (unint64_t)maxRetryOnUnexpectedSyncTokenChange
{
  return self->_maxRetryOnUnexpectedSyncTokenChange;
}

- (void)setMaxRetryOnUnexpectedSyncTokenChange:(unint64_t)a3
{
  self->_maxRetryOnUnexpectedSyncTokenChange = a3;
}

- (NSString)nextCTag
{
  return self->_nextCTag;
}

- (void)setNextCTag:(id)a3
{
}

- (unint64_t)unexpectedEmptySyncReportResponseRetryAttemptCount
{
  return self->_unexpectedEmptySyncReportResponseRetryAttemptCount;
}

- (void)setUnexpectedEmptySyncReportResponseRetryAttemptCount:(unint64_t)a3
{
  self->_unexpectedEmptySyncReportResponseRetryAttemptCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationChangedURLs, 0);
  objc_storeStrong((id *)&self->_remainingHREFsToModDeleteActions, 0);
  objc_storeStrong((id *)&self->_remainingUUIDsToAddActions, 0);
  objc_storeStrong((id *)&self->_localItemURLOrder, 0);
  objc_storeStrong((id *)&self->_urlToETag, 0);
  objc_storeStrong((id *)&self->_syncReportDeletedURLs, 0);
  objc_storeStrong((id *)&self->_bulkChangeCheckCTag, 0);
  objc_storeStrong((id *)&self->_bulkRequests, 0);
  objc_storeStrong((id *)&self->_addMemberURL, 0);
  objc_storeStrong((id *)&self->_unsubmittedTasks, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_nextSyncToken, 0);
  objc_storeStrong((id *)&self->_previousSyncToken, 0);
  objc_storeStrong((id *)&self->_nextCTag, 0);
  objc_storeStrong((id *)&self->_previousCTag, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);
}

@end