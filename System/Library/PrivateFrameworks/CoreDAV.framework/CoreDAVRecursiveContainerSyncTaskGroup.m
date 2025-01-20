@interface CoreDAVRecursiveContainerSyncTaskGroup
- (BOOL)isWhitelistedError:(id)a3;
- (BOOL)preflightCTag;
- (BOOL)shouldSyncChildWithResourceType:(id)a3;
- (CoreDAVRecursiveContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousPTag:(id)a5 previousSyncToken:(id)a6 actions:(id)a7 syncItemOrder:(BOOL)a8 context:(id)a9 accountInfoProvider:(id)a10 taskManager:(id)a11;
- (NSDictionary)folderURLToChildrenURLOrder;
- (NSString)description;
- (NSString)nextCTag;
- (NSString)previousCTag;
- (NSString)previousSyncToken;
- (NSURL)folderURL;
- (id)_copyContainerParserMappings;
- (id)copyFolderMultiGetTaskWithURLs:(id)a3;
- (id)copyMultiGetTaskWithURLs:(id)a3;
- (id)dataContentType;
- (unint64_t)_submitTasks;
- (unint64_t)multiGetBatchSize;
- (void)_folderModTask:(id)a3 parsedPropStats:(id)a4 error:(id)a5;
- (void)_foundChildrenOrder:(id)a3 inFolderWithURL:(id)a4;
- (void)_getDataPayloads;
- (void)_getItemTags;
- (void)_getTask:(id)a3 finishedWithParsedContents:(id)a4 deletedItems:(id)a5 error:(id)a6;
- (void)_getTopFolderTags;
- (void)_postTask:(id)a3 didFinishWithError:(id)a4;
- (void)_pushActions;
- (void)_syncReportTask:(id)a3 didFinishWithError:(id)a4;
- (void)_taskGroupSuccessfullyFinishedWithContents:(id)a3;
- (void)_tearDownAllUnsubmittedTasks;
- (void)bailWithError:(id)a3;
- (void)cancelTaskGroup;
- (void)deleteTask:(id)a3 completedWithError:(id)a4;
- (void)moveTask:(id)a3 parsedResponses:(id)a4 error:(id)a5;
- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5;
- (void)putTask:(id)a3 completedWithNewETag:(id)a4 error:(id)a5;
- (void)setMultiGetBatchSize:(unint64_t)a3;
- (void)setNextCTag:(id)a3;
- (void)setPreflightCTag:(BOOL)a3;
- (void)setPreviousSyncToken:(id)a3;
- (void)startTaskGroup;
- (void)task:(id)a3 didFinishWithError:(id)a4;
- (void)taskGroupWillCancelWithError:(id)a3;
@end

@implementation CoreDAVRecursiveContainerSyncTaskGroup

- (CoreDAVRecursiveContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousPTag:(id)a5 previousSyncToken:(id)a6 actions:(id)a7 syncItemOrder:(BOOL)a8 context:(id)a9 accountInfoProvider:(id)a10 taskManager:(id)a11
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  if ([(CoreDAVRecursiveContainerSyncTaskGroup *)self isMemberOfClass:objc_opt_class()])
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"CoreDAVRecursiveContainerSyncTaskGroup.m", 65, @"You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@", objc_opt_class() object file lineNumber description];
  }
  v33.receiver = self;
  v33.super_class = (Class)CoreDAVRecursiveContainerSyncTaskGroup;
  v21 = [(CoreDAVTaskGroup *)&v33 initWithAccountInfoProvider:v19 taskManager:v20];
  v22 = v21;
  if (v21)
  {
    [(CoreDAVTaskGroup *)v21 setContext:v18];
    objc_storeStrong((id *)&v22->_folderURL, a3);
    objc_storeStrong((id *)&v22->_previousCTag, a4);
    objc_storeStrong((id *)&v22->_previousPTag, a5);
    objc_storeStrong((id *)&v22->_previousSyncToken, a6);
    objc_storeStrong((id *)&v22->_actions, a7);
    v22->_multiGetBatchSize = 50;
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    unsubmittedTasks = v22->_unsubmittedTasks;
    v22->_unsubmittedTasks = v23;

    v22->_syncItemOrder = a8;
  }

  return v22;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@ %p: Phase %d Outstanding Tasks:\n%@", v5, self, self->_phase, self->super._outstandingTasks];

  return (NSString *)v6;
}

- (void)taskGroupWillCancelWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
  }
  v5 = [(CoreDAVTaskGroup *)self delegate];
  [v5 recursiveContainerSyncTask:self completedFullSyncWithNewCTag:0 newPTag:0 newSyncToken:0 error:v4];

  v6.receiver = self;
  v6.super_class = (Class)CoreDAVRecursiveContainerSyncTaskGroup;
  [(CoreDAVTaskGroup *)&v6 taskGroupWillCancelWithError:v4];
}

- (void)_tearDownAllUnsubmittedTasks
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_unsubmittedTasks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "finishCoreDAVTaskWithError:", v3, (void)v10);
        [v9 setDelegate:0];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_unsubmittedTasks removeAllObjects];
}

- (void)_foundChildrenOrder:(id)a3 inFolderWithURL:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  folderURLToChildrenURLOrder = self->_folderURLToChildrenURLOrder;
  if (!folderURLToChildrenURLOrder)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v10 = self->_folderURLToChildrenURLOrder;
    self->_folderURLToChildrenURLOrder = v9;

    folderURLToChildrenURLOrder = self->_folderURLToChildrenURLOrder;
  }
  long long v11 = [(NSMutableDictionary *)folderURLToChildrenURLOrder objectForKey:v7];

  if (v11)
  {
    long long v12 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    v14 = [v12 logHandleForAccountInfoProvider:WeakRetained];

    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = self->_folderURLToChildrenURLOrder;
      int v16 = 138412802;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_213BFC000, v14, OS_LOG_TYPE_INFO, "Got children order %@ for folder with url %@, but I already knew about that (I had %@)", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_folderURLToChildrenURLOrder setObject:v6 forKey:v7];
  }
}

- (void)bailWithError:(id)a3
{
  id v4 = a3;
  [(CoreDAVRecursiveContainerSyncTaskGroup *)self _tearDownAllUnsubmittedTasks];
  v5.receiver = self;
  v5.super_class = (Class)CoreDAVRecursiveContainerSyncTaskGroup;
  [(CoreDAVTaskGroup *)&v5 bailWithError:v4];
}

- (void)cancelTaskGroup
{
  [(CoreDAVRecursiveContainerSyncTaskGroup *)self _tearDownAllUnsubmittedTasks];
  v3.receiver = self;
  v3.super_class = (Class)CoreDAVRecursiveContainerSyncTaskGroup;
  [(CoreDAVTaskGroup *)&v3 cancelTaskGroup];
}

- (unint64_t)_submitTasks
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (self->super._isCancelling) {
    return 0;
  }
  id v4 = (void *)[(NSMutableArray *)self->_unsubmittedTasks copy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v2 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      unint64_t v20 = v2;
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        [(NSMutableSet *)self->super._outstandingTasks addObject:v10];
        [(NSMutableArray *)self->_unsubmittedTasks removeObject:v10];
        id WeakRetained = objc_loadWeakRetained((id *)&self->super._taskManager);
        [WeakRetained submitQueuedCoreDAVTask:v10];
      }
      unint64_t v2 = v20 + v7;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v2 = 0;
  }

  long long v12 = +[CoreDAVLogging sharedLogging];
  id v13 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  v14 = [v12 logHandleForAccountInfoProvider:v13];

  if (v14)
  {
    uint64_t v15 = v14;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      uint64_t v18 = [(NSMutableSet *)self->super._outstandingTasks count];
      *(_DWORD *)buf = 138544130;
      v26 = v17;
      __int16 v27 = 2048;
      v28 = self;
      __int16 v29 = 2048;
      unint64_t v30 = v2;
      __int16 v31 = 2048;
      uint64_t v32 = v18;
      _os_log_impl(&dword_213BFC000, v15, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> Submitted %lu queued tasks, %lu total tasks queued.", buf, 0x2Au);
    }
  }

  return v2;
}

- (void)_taskGroupSuccessfullyFinishedWithContents:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  uint64_t v7 = [v5 logHandleForAccountInfoProvider:WeakRetained];

  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = self;
    _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_INFO, "Task group %@ finished", buf, 0xCu);
  }

  uint64_t v8 = [(CoreDAVTaskGroup *)self delegate];
  v9 = v8;
  nextCTag = self->_nextCTag;
  if (!nextCTag) {
    nextCTag = self->_previousCTag;
  }
  nextPTag = self->_nextPTag;
  if (!nextPTag) {
    nextPTag = self->_previousPTag;
  }
  [v8 recursiveContainerSyncTask:self completedSyncOfFolderWithURL:self->_folderURL newCTag:nextCTag newPTag:nextPTag addedOrModified:v4 removed:0 error:0];

  long long v12 = [(CoreDAVTaskGroup *)self delegate];
  id v13 = v12;
  previousCTag = self->_nextCTag;
  if (!previousCTag) {
    previousCTag = self->_previousCTag;
  }
  previousPTag = self->_nextPTag;
  if (!previousPTag) {
    previousPTag = self->_previousPTag;
  }
  nextSyncToken = self->_nextSyncToken;
  if (!nextSyncToken) {
    nextSyncToken = self->_previousSyncToken;
  }
  [v12 recursiveContainerSyncTask:self completedFullSyncWithNewCTag:previousCTag newPTag:previousPTag newSyncToken:nextSyncToken error:0];
}

- (void)_pushActions
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  self->_phase = 0;
  if ([(NSMutableSet *)self->super._outstandingTasks count])
  {
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"CoreDAVRecursiveContainerSyncTaskGroup.m", 170, @"We shouldn't start pushing actions if we have outstanding tasks: %@", self object file lineNumber description];
  }
  id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obj = self->_actions;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v43;
    uint64_t v39 = *(void *)v43;
    v37 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v40 = v6;
      do
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v42 + 1) + 8 * v8);
        switch([v9 action])
        {
          case 0u:
          case 1u:
            uint64_t v10 = [v9 context];
            long long v11 = [v10 dataPayload];
            long long v12 = [CoreDAVPutTask alloc];
            id v13 = [(CoreDAVRecursiveContainerSyncTaskGroup *)self dataContentType];
            v14 = [v10 serverID];
            uint64_t v15 = [v10 syncKey];
            int v16 = [(CoreDAVPostOrPutTask *)v12 initWithDataPayload:v11 dataContentType:v13 atURL:v14 previousETag:v15];

            [(CoreDAVActionBackedTask *)v16 setBackingAction:v9];
            if (self->_syncItemOrder)
            {
              id v17 = v9;
              -[CoreDAVPostOrPutTask setAbsoluteOrder:](v16, "setAbsoluteOrder:", [v17 absoluteOrder]);
              uint64_t v18 = [v17 priorURL];

              [(CoreDAVPostOrPutTask *)v16 setPriorOrderedURL:v18];
            }
            [(CoreDAVTask *)v16 setDelegate:self];
            id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            [(CoreDAVTask *)v16 setAccountInfoProvider:WeakRetained];

            [(CoreDAVTask *)v16 setTimeoutInterval:self->super._timeoutInterval];
            id v4 = v37;
            [v37 addObject:v16];

            uint64_t v7 = v39;
            uint64_t v6 = v40;
            break;
          case 2u:
          case 5u:
            uint64_t v10 = [v9 context];
            long long v11 = [(CoreDAVTask *)[CoreDAVDeleteTask alloc] initWithURL:v10];
            [(CoreDAVActionBackedTask *)v11 setBackingAction:v9];
            [(CoreDAVTask *)v11 setDelegate:self];
            id v20 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            [(CoreDAVTask *)v11 setAccountInfoProvider:v20];

            [(CoreDAVTask *)v11 setTimeoutInterval:self->super._timeoutInterval];
            long long v21 = v38;
            goto LABEL_22;
          case 3u:
            uint64_t v10 = [v9 context];
            long long v11 = (CoreDAVDeleteTask *)[v10 copyMkcolTask];
            if (self->_syncItemOrder)
            {
              id v24 = v9;
              -[CoreDAVDeleteTask setAbsoluteOrder:](v11, "setAbsoluteOrder:", [v24 absoluteOrder]);
              v25 = [v24 priorURL];

              uint64_t v6 = v40;
              [(CoreDAVDeleteTask *)v11 setPriorOrderedURL:v25];
            }
            goto LABEL_21;
          case 4u:
            uint64_t v10 = [v9 context];
            long long v11 = (CoreDAVDeleteTask *)[v10 copyPropPatchTask];
            if (self->_syncItemOrder)
            {
              id v26 = v9;
              -[CoreDAVDeleteTask setAbsoluteOrder:](v11, "setAbsoluteOrder:", [v26 absoluteOrder]);
              __int16 v27 = [v26 priorURL];

              [(CoreDAVDeleteTask *)v11 setPriorOrderedURL:v27];
              uint64_t v6 = v40;
            }
LABEL_21:
            [(CoreDAVActionBackedTask *)v11 setBackingAction:v9];
            [(CoreDAVTask *)v11 setDelegate:self];
            id v28 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            [(CoreDAVTask *)v11 setAccountInfoProvider:v28];

            [(CoreDAVTask *)v11 setTimeoutInterval:self->super._timeoutInterval];
            long long v21 = v4;
LABEL_22:
            [v21 addObject:v11];
            break;
          case 6u:
            uint64_t v10 = [v9 context];
            __int16 v29 = [CoreDAVMoveTask alloc];
            unint64_t v30 = [v10 sourceURL];
            __int16 v31 = [v10 destinationURL];
            long long v11 = [(CoreDAVCopyOrMoveTask *)v29 initWithSourceURL:v30 destinationURL:v31 andOverwrite:1];

            if (self->_syncItemOrder)
            {
              uint64_t v32 = [v9 priorURL];
              [(CoreDAVDeleteTask *)v11 setPriorOrderedURL:v32];
            }
            [(CoreDAVTask *)v11 setDelegate:self];
            id v33 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            [(CoreDAVTask *)v11 setAccountInfoProvider:v33];

            [(CoreDAVTask *)v11 setTimeoutInterval:self->super._timeoutInterval];
            [v36 addObject:v11];
            uint64_t v7 = v39;
            break;
          default:
            uint64_t v10 = +[CoreDAVLogging sharedLogging];
            id v22 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            long long v11 = [v10 logHandleForAccountInfoProvider:v22];

            if (v11)
            {
              long long v11 = v11;
              if (os_log_type_enabled(&v11->super.super.super, OS_LOG_TYPE_ERROR))
              {
                int v23 = [v9 action];
                *(_DWORD *)buf = 67109120;
                int v47 = v23;
                _os_log_impl(&dword_213BFC000, &v11->super.super.super, OS_LOG_TYPE_ERROR, "Don't know how to perform action %d, skipping this action", buf, 8u);
              }
            }
            break;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v34 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      uint64_t v6 = v34;
    }
    while (v34);
  }

  [v4 sortUsingComparator:&__block_literal_global_6];
  [(NSMutableArray *)self->_unsubmittedTasks addObjectsFromArray:v38];
  [(NSMutableArray *)self->_unsubmittedTasks addObjectsFromArray:v4];
  [(NSMutableArray *)self->_unsubmittedTasks addObjectsFromArray:v36];
  [(CoreDAVRecursiveContainerSyncTaskGroup *)self _submitTasks];
}

uint64_t __54__CoreDAVRecursiveContainerSyncTaskGroup__pushActions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 url];
  uint64_t v7 = [v5 url];
  uint64_t v8 = [v6 pathComponents];
  unint64_t v9 = [v8 count];

  uint64_t v10 = [v7 pathComponents];
  unint64_t v11 = [v10 count];

  if (v9 >= v11)
  {
    if (v9 > v11)
    {
      uint64_t v12 = 1;
    }
    else
    {
      int v13 = [v4 absoluteOrder];
      int v14 = [v5 absoluteOrder];
      if (v13 < v14) {
        uint64_t v12 = -1;
      }
      else {
        uint64_t v12 = v13 > v14;
      }
    }
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

- (void)_getTopFolderTags
{
  if (self->_preflightCTag)
  {
    self->_phase = 1;
    if ([(NSMutableSet *)self->super._outstandingTasks count])
    {
      uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"CoreDAVRecursiveContainerSyncTaskGroup.m", 321, @"We shouldn't start grabbing the folder attributes if we have outstanding tasks: %@", self object file lineNumber description];
    }
    id v7 = [(CoreDAVRecursiveContainerSyncTaskGroup *)self _copyContainerParserMappings];
    id v4 = [[CoreDAVPropFindTask alloc] initWithPropertiesToFind:v7 atURL:self->_folderURL withDepth:2];
    [(CoreDAVTask *)v4 setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    [(CoreDAVTask *)v4 setAccountInfoProvider:WeakRetained];

    [(CoreDAVTask *)v4 setTimeoutInterval:self->super._timeoutInterval];
    [(NSMutableArray *)self->_unsubmittedTasks addObject:v4];
    [(CoreDAVRecursiveContainerSyncTaskGroup *)self _submitTasks];
  }
  else
  {
    [(CoreDAVRecursiveContainerSyncTaskGroup *)self _getItemTags];
  }
}

- (void)_getItemTags
{
  self->_phase = 2;
  if ([(NSMutableSet *)self->super._outstandingTasks count])
  {
    unint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"CoreDAVRecursiveContainerSyncTaskGroup.m", 341, @"We shouldn't start grabbing eTags if we have outstanding tasks: %@", self object file lineNumber description];
  }
  uint64_t v10 = objc_alloc_init(CoreDAVItemParserMapping);
  [(CoreDAVItemParserMapping *)v10 setNameSpace:@"DAV:"];
  [(CoreDAVItemParserMapping *)v10 setName:@"getetag"];
  [(CoreDAVItemParserMapping *)v10 setParseClass:objc_opt_class()];
  id v4 = objc_alloc_init(CoreDAVItemParserMapping);
  [(CoreDAVItemParserMapping *)v4 setNameSpace:@"urn:mobileme:davservices"];
  [(CoreDAVItemParserMapping *)v4 setName:@"propertytag"];
  [(CoreDAVItemParserMapping *)v4 setParseClass:objc_opt_class()];
  id v5 = objc_alloc_init(CoreDAVItemParserMapping);
  [(CoreDAVItemParserMapping *)v5 setNameSpace:@"DAV:"];
  [(CoreDAVItemParserMapping *)v5 setName:@"resourcetype"];
  [(CoreDAVItemParserMapping *)v5 setParseClass:objc_opt_class()];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v6 addObject:v10];
  [v6 addObject:v5];
  [v6 addObject:v4];
  id v7 = [[CoreDAVSyncReportTask alloc] initWithPropertiesToFind:v6 atURL:self->_folderURL withDepth:1 previousSyncToken:self->_previousSyncToken];
  [(NSMutableArray *)self->_unsubmittedTasks addObject:v7];
  [(CoreDAVTask *)v7 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  [(CoreDAVTask *)v7 setAccountInfoProvider:WeakRetained];

  [(CoreDAVTask *)v7 setTimeoutInterval:self->super._timeoutInterval];
  [(CoreDAVRecursiveContainerSyncTaskGroup *)self _submitTasks];
}

- (void)_getDataPayloads
{
  uint64_t v149 = *MEMORY[0x263EF8340];
  self->_phase = 3;
  if ([(NSMutableSet *)self->super._outstandingTasks count])
  {
    v84 = [MEMORY[0x263F08690] currentHandler];
    [v84 handleFailureInMethod:a2, self, @"CoreDAVRecursiveContainerSyncTaskGroup.m", 375, @"We shouldn't start getting vCards if we have outstanding tasks: %@", self object file lineNumber description];
  }
  id v89 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  unint64_t v5 = 0x263EFF000uLL;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v102 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v8 = [(CoreDAVTaskGroup *)self delegate];
  unint64_t v9 = [(NSMutableDictionary *)self->_leafURLToETag allKeys];
  uint64_t v10 = [v8 copyLocalETagsForURLs:v9];

  v99 = (void *)v10;
  if (v10)
  {
    SEL v85 = a2;
    v90 = v6;
    if ([(NSMutableArray *)self->_childCollectionURL count])
    {
      id v86 = v4;
      id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v131 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      obuint64_t j = self->_childCollectionURL;
      uint64_t v100 = [(NSMutableArray *)obj countByEnumeratingWithState:&v131 objects:v148 count:16];
      if (v100)
      {
        uint64_t v95 = *(void *)v132;
        do
        {
          for (uint64_t i = 0; i != v100; ++i)
          {
            if (*(void *)v132 != v95) {
              objc_enumerationMutation(obj);
            }
            int v13 = *(void **)(*((void *)&v131 + 1) + 8 * i);
            int v14 = (void *)MEMORY[0x216693F10]();
            id v15 = [v13 pathComponents];
            unint64_t v16 = [v15 count];
            while (1)
            {

              if ([v11 count] > v16) {
                break;
              }
              id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
              [v11 addObject:v15];
            }
            id v17 = [v11 objectAtIndex:v16];
            [v17 addObject:v13];
          }
          uint64_t v100 = [(NSMutableArray *)obj countByEnumeratingWithState:&v131 objects:v148 count:16];
        }
        while (v100);
      }

      uint64_t v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      childCollectionURL = self->_childCollectionURL;
      self->_childCollectionURL = v18;

      long long v129 = 0u;
      long long v130 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      id v20 = v11;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v127 objects:v147 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v128;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v128 != v23) {
              objc_enumerationMutation(v20);
            }
            [(NSMutableArray *)self->_childCollectionURL addObjectsFromArray:*(void *)(*((void *)&v127 + 1) + 8 * j)];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v127 objects:v147 count:16];
        }
        while (v22);
      }
      v96 = v20;

      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      v25 = self->_childCollectionURL;
      uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v123 objects:v146 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v101 = 0;
        uint64_t v28 = *(void *)v124;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v124 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v123 + 1) + 8 * k);
            if ([v102 count] >= self->_multiGetBatchSize)
            {
              [v90 addObject:v102];
              id v32 = objc_alloc_init(MEMORY[0x263EFF9C0]);

              __int16 v31 = v32;
            }
            else
            {
              __int16 v31 = v102;
            }
            id v102 = v31;
            [v31 addObject:v30];
            unint64_t v5 = 0x263EFF000;
          }
          v101 += v27;
          uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v123 objects:v146 count:16];
        }
        while (v27);
      }
      else
      {
        uint64_t v101 = 0;
      }

      id v4 = v86;
      id v6 = v90;
    }
    else
    {
      uint64_t v101 = 0;
    }
    [v6 addObject:v102];
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id obja = [(NSMutableDictionary *)self->_leafURLToETag allKeys];
    uint64_t v34 = [obja countByEnumeratingWithState:&v119 objects:v145 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v97 = *(void *)v120;
      do
      {
        for (uint64_t m = 0; m != v35; ++m)
        {
          v37 = v4;
          if (*(void *)v120 != v97) {
            objc_enumerationMutation(obja);
          }
          uint64_t v38 = *(void *)(*((void *)&v119 + 1) + 8 * m);
          uint64_t v39 = [(NSMutableDictionary *)self->_leafURLToETag objectForKey:v38];
          uint64_t v40 = [v99 objectForKey:v38];
          char v41 = [v40 isEqualToString:v39];

          if (v41)
          {
            id v4 = v37;
            unint64_t v5 = 0x263EFF000;
          }
          else
          {
            id v4 = v37;
            if ([v37 count] >= self->_multiGetBatchSize)
            {
              [v89 addObject:v37];
              id v42 = objc_alloc_init(MEMORY[0x263EFF9C0]);

              id v4 = v42;
            }
            unint64_t v5 = 0x263EFF000uLL;
            [v4 addObject:v38];
            ++v101;
          }
        }
        uint64_t v35 = [obja countByEnumeratingWithState:&v119 objects:v145 count:16];
      }
      while (v35);
    }

    id v87 = v4;
    [v89 addObject:v4];
    [v7 unionSet:self->_syncReportDeletedURLs];
    long long v43 = [(CoreDAVRecursiveContainerSyncTaskGroup *)self previousSyncToken];

    if (!v43)
    {
      id v44 = objc_alloc_init(*(Class *)(v5 + 2432));
      [v44 addObject:self->_folderURL];
      [v44 addObjectsFromArray:self->_childCollectionURL];
      long long v45 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:self->_childCollectionURL];
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v88 = v44;
      id objb = (id)[v88 countByEnumeratingWithState:&v115 objects:v144 count:16];
      if (objb)
      {
        uint64_t v91 = *(void *)v116;
        do
        {
          uint64_t v46 = 0;
          do
          {
            if (*(void *)v116 != v91) {
              objc_enumerationMutation(v88);
            }
            uint64_t v98 = v46;
            uint64_t v47 = *(void *)(*((void *)&v115 + 1) + 8 * v46);
            v48 = [(CoreDAVTaskGroup *)self delegate];
            uint64_t v49 = (void *)[v48 copyAllLocalURLsInFolderWithURL:v47];

            long long v113 = 0u;
            long long v114 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            id v50 = v49;
            uint64_t v51 = [v50 countByEnumeratingWithState:&v111 objects:v143 count:16];
            if (v51)
            {
              uint64_t v52 = v51;
              uint64_t v53 = *(void *)v112;
              do
              {
                for (uint64_t n = 0; n != v52; ++n)
                {
                  if (*(void *)v112 != v53) {
                    objc_enumerationMutation(v50);
                  }
                  uint64_t v55 = *(void *)(*((void *)&v111 + 1) + 8 * n);
                  if (([v45 containsObject:v55] & 1) == 0)
                  {
                    v56 = [(NSMutableDictionary *)self->_leafURLToETag objectForKey:v55];

                    if (!v56) {
                      [v7 addObject:v55];
                    }
                  }
                }
                uint64_t v52 = [v50 countByEnumeratingWithState:&v111 objects:v143 count:16];
              }
              while (v52);
            }

            uint64_t v46 = v98 + 1;
          }
          while ((id)(v98 + 1) != objb);
          id objb = (id)[v88 countByEnumeratingWithState:&v115 objects:v144 count:16];
        }
        while (objb);
      }
    }
    id v6 = v90;
    if ([v7 count])
    {
      v57 = +[CoreDAVLogging sharedLogging];
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      v59 = [v57 logHandleForAccountInfoProvider:WeakRetained];

      if (v59 && os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        leafURLToETag = self->_leafURLToETag;
        v61 = self->_childCollectionURL;
        *(_DWORD *)buf = 138412802;
        v138 = leafURLToETag;
        __int16 v139 = 2112;
        v140 = v61;
        __int16 v141 = 2112;
        id v142 = v7;
        _os_log_impl(&dword_213BFC000, v59, OS_LOG_TYPE_INFO, "_leafURLToETag is %@, _childCollectionURL is %@, and the db said it has these extras %@", buf, 0x20u);
      }

      v62 = [(CoreDAVTaskGroup *)self delegate];
      [v62 recursiveContainerSyncTask:self retrievedAddedOrModifiedActions:0 removed:v7];
    }
    if (v101)
    {
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      id v63 = v90;
      uint64_t v64 = [v63 countByEnumeratingWithState:&v107 objects:v136 count:16];
      if (v64)
      {
        uint64_t v65 = v64;
        uint64_t v66 = *(void *)v108;
        do
        {
          for (iuint64_t i = 0; ii != v65; ++ii)
          {
            if (*(void *)v108 != v66) {
              objc_enumerationMutation(v63);
            }
            v68 = *(void **)(*((void *)&v107 + 1) + 8 * ii);
            if ([v68 count])
            {
              id v69 = [(CoreDAVRecursiveContainerSyncTaskGroup *)self copyFolderMultiGetTaskWithURLs:v68];
              if (!v69)
              {
                v71 = [MEMORY[0x263F08690] currentHandler];
                [v71 handleFailureInMethod:v85, self, @"CoreDAVRecursiveContainerSyncTaskGroup.m", 494, @"Couldn't create folderMultiGetTask, things will go poorly" object file lineNumber description];
              }
              [v69 setDelegate:self];
              id v70 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
              [v69 setAccountInfoProvider:v70];

              [v69 setTimeoutInterval:self->super._timeoutInterval];
              [(NSMutableArray *)self->_unsubmittedTasks addObject:v69];
            }
          }
          uint64_t v65 = [v63 countByEnumeratingWithState:&v107 objects:v136 count:16];
        }
        while (v65);
      }

      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id v72 = v89;
      uint64_t v73 = [v72 countByEnumeratingWithState:&v103 objects:v135 count:16];
      if (v73)
      {
        uint64_t v74 = v73;
        uint64_t v75 = *(void *)v104;
        do
        {
          for (juint64_t j = 0; jj != v74; ++jj)
          {
            if (*(void *)v104 != v75) {
              objc_enumerationMutation(v72);
            }
            v77 = *(void **)(*((void *)&v103 + 1) + 8 * jj);
            if ([v77 count])
            {
              id v78 = [(CoreDAVRecursiveContainerSyncTaskGroup *)self copyMultiGetTaskWithURLs:v77];
              if (!v78)
              {
                v80 = [MEMORY[0x263F08690] currentHandler];
                [v80 handleFailureInMethod:v85, self, @"CoreDAVRecursiveContainerSyncTaskGroup.m", 504, @"Couldn't create multiGetTask, things will go poorly" object file lineNumber description];
              }
              [v78 setDelegate:self];
              id v79 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
              [v78 setAccountInfoProvider:v79];

              [v78 setTimeoutInterval:self->super._timeoutInterval];
              [(NSMutableArray *)self->_unsubmittedTasks addObject:v78];
            }
          }
          uint64_t v74 = [v72 countByEnumeratingWithState:&v103 objects:v135 count:16];
        }
        while (v74);
      }

      [(CoreDAVRecursiveContainerSyncTaskGroup *)self _submitTasks];
      id v4 = v87;
      id v6 = v90;
    }
    else
    {
      v81 = +[CoreDAVLogging sharedLogging];
      id v82 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      v83 = [v81 logHandleForAccountInfoProvider:v82];

      if (v83 && os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213BFC000, v83, OS_LOG_TYPE_DEBUG, "There are no server side items to grab, so I'm outta here", buf, 2u);
      }

      [(CoreDAVRecursiveContainerSyncTaskGroup *)self _taskGroupSuccessfullyFinishedWithContents:0];
      id v4 = v87;
    }
  }
  else
  {
    id v33 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
    [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v33];
  }
}

- (void)startTaskGroup
{
  if ([(NSArray *)self->_actions count])
  {
    [(CoreDAVRecursiveContainerSyncTaskGroup *)self _pushActions];
  }
  else
  {
    [(CoreDAVRecursiveContainerSyncTaskGroup *)self _getTopFolderTags];
  }
}

- (BOOL)isWhitelistedError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"];

  BOOL v6 = v5 && [v3 code] >= 400 && objc_msgSend(v3, "code") < 500;
  return v6;
}

- (void)putTask:(id)a3 completedWithNewETag:(id)a4 error:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unint64_t v9 = (NSMutableSet *)a4;
  uint64_t v10 = (NSMutableArray *)a5;
  if (![(NSMutableSet *)self->super._outstandingTasks containsObject:v8])
  {
    if ([(NSMutableArray *)self->_unsubmittedTasks containsObject:v8]) {
      goto LABEL_31;
    }
    id v11 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    int v13 = [(NSMutableArray *)v11 logHandleForAccountInfoProvider:WeakRetained];

    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      int v31 = 138412802;
      id v32 = v8;
      __int16 v33 = 2112;
      uint64_t v34 = outstandingTasks;
      __int16 v35 = 2112;
      id v36 = unsubmittedTasks;
      _os_log_impl(&dword_213BFC000, v13, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v31, 0x20u);
    }

LABEL_30:
    goto LABEL_31;
  }
  [(NSMutableSet *)self->super._outstandingTasks removeObject:v8];
  if (!self->_phase)
  {
    id v11 = v10;
    if ([(CoreDAVRecursiveContainerSyncTaskGroup *)self isWhitelistedError:v11])
    {
      unint64_t v16 = +[CoreDAVLogging sharedLogging];
      id v17 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      uint64_t v18 = [v16 logHandleForAccountInfoProvider:v17];

      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 138412802;
        id v32 = v8;
        __int16 v33 = 2114;
        uint64_t v34 = v9;
        __int16 v35 = 2112;
        id v36 = v11;
        _os_log_impl(&dword_213BFC000, v18, OS_LOG_TYPE_DEFAULT, "putTask:%@ completedWithNewETag:%{public}@ error:%@ Ignoring", (uint8_t *)&v31, 0x20u);
      }

      uint64_t v10 = 0;
      unint64_t v9 = 0;
      if (!v11) {
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v10 = v11;
      if (!v11) {
        goto LABEL_23;
      }
    }
    if (!v10)
    {
      id v24 = [(CoreDAVTaskGroup *)self delegate];
      v25 = [v8 url];
      uint64_t v26 = [v8 requestDataPayload];
      [v24 notePutToURL:v25 withDataPayload:v26 finishedWithIgnoredError:v11];

      goto LABEL_25;
    }
LABEL_23:
    if (v10)
    {
      [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v10];
LABEL_27:
      if (!self->super._isCancelling)
      {
        [(CoreDAVRecursiveContainerSyncTaskGroup *)self _submitTasks];
        if (![(NSMutableSet *)self->super._outstandingTasks count]) {
          [(CoreDAVRecursiveContainerSyncTaskGroup *)self _getTopFolderTags];
        }
      }
      goto LABEL_30;
    }
LABEL_25:
    uint64_t v27 = [(CoreDAVTaskGroup *)self delegate];
    uint64_t v28 = [v8 url];
    char v29 = [v27 setLocalETag:v9 forItemWithURL:v28];

    if ((v29 & 1) == 0)
    {
      uint64_t v30 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
      [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v30];
    }
    goto LABEL_27;
  }
  if (v10)
  {
    [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v10];
  }
  else
  {
    uint64_t v19 = +[CoreDAVLogging sharedLogging];
    id v20 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    uint64_t v21 = [v19 logHandleForAccountInfoProvider:v20];

    if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int phase = self->_phase;
      int v31 = 67109120;
      LODWORD(v32) = phase;
      _os_log_impl(&dword_213BFC000, v21, OS_LOG_TYPE_ERROR, "Got a successful put task response, but I'm in phase %d.  What gives?", (uint8_t *)&v31, 8u);
    }

    uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
    [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v23];

    uint64_t v10 = 0;
  }
LABEL_31:
}

- (void)_postTask:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (NSMutableSet *)a4;
  if ([(NSMutableSet *)self->super._outstandingTasks containsObject:v6])
  {
    [(NSMutableSet *)self->super._outstandingTasks removeObject:v6];
    if (self->_phase)
    {
      if (!v7)
      {
        id v8 = +[CoreDAVLogging sharedLogging];
        id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        uint64_t v10 = [v8 logHandleForAccountInfoProvider:WeakRetained];

        if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int phase = self->_phase;
          int v21 = 67109120;
          LODWORD(v22) = phase;
          _os_log_impl(&dword_213BFC000, v10, OS_LOG_TYPE_ERROR, "Got a successful put task response, but I'm in phase %d.  What gives?", (uint8_t *)&v21, 8u);
        }

        uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
        [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v12];

LABEL_22:
        id v7 = 0;
        goto LABEL_23;
      }
      goto LABEL_19;
    }
    if ([(CoreDAVRecursiveContainerSyncTaskGroup *)self isWhitelistedError:v7])
    {
      uint64_t v18 = +[CoreDAVLogging sharedLogging];
      id v19 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      id v20 = [v18 logHandleForAccountInfoProvider:v19];

      if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412546;
        id v22 = v6;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_impl(&dword_213BFC000, v20, OS_LOG_TYPE_DEFAULT, "postTask:%@ error:%@ Ignoring", (uint8_t *)&v21, 0x16u);
      }
    }
    else if (v7)
    {
LABEL_19:
      [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v7];
      goto LABEL_23;
    }
    [(CoreDAVRecursiveContainerSyncTaskGroup *)self _submitTasks];
    if (![(NSMutableSet *)self->super._outstandingTasks count]) {
      [(CoreDAVRecursiveContainerSyncTaskGroup *)self _getTopFolderTags];
    }
    goto LABEL_22;
  }
  if (([(NSMutableArray *)self->_unsubmittedTasks containsObject:v6] & 1) == 0)
  {
    int v13 = +[CoreDAVLogging sharedLogging];
    id v14 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v15 = [v13 logHandleForAccountInfoProvider:v14];

    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      int v21 = 138412802;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = outstandingTasks;
      __int16 v25 = 2112;
      uint64_t v26 = unsubmittedTasks;
      _os_log_impl(&dword_213BFC000, v15, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v21, 0x20u);
    }
  }
LABEL_23:
}

- (void)_folderModTask:(id)a3 parsedPropStats:(id)a4 error:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (NSMutableSet *)a5;
  if ([(NSMutableSet *)self->super._outstandingTasks containsObject:v7])
  {
    [(NSMutableSet *)self->super._outstandingTasks removeObject:v7];
    if (self->_phase)
    {
      if (v8)
      {
LABEL_4:
        [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v8];
        goto LABEL_42;
      }
      __int16 v23 = +[CoreDAVLogging sharedLogging];
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      __int16 v25 = [v23 logHandleForAccountInfoProvider:WeakRetained];

      if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int phase = self->_phase;
        int v38 = 67109120;
        LODWORD(v39) = phase;
        _os_log_impl(&dword_213BFC000, v25, OS_LOG_TYPE_ERROR, "Got a successful put task response, but I'm in phase %d.  What gives?", (uint8_t *)&v38, 8u);
      }

      uint64_t v27 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
      [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v27];

LABEL_41:
      id v8 = 0;
      goto LABEL_42;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [(NSMutableSet *)v8 domain];
      if ([v14 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"])
      {
        uint64_t v15 = [(NSMutableSet *)v8 code];

        if (v15 == 404)
        {
          unint64_t v16 = +[CoreDAVLogging sharedLogging];
          p_accountInfoProvider = &self->super._accountInfoProvider;
          id v18 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          id v19 = [v16 logHandleForAccountInfoProvider:v18];

          if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            int v38 = 138412290;
            id v39 = v7;
            _os_log_impl(&dword_213BFC000, v19, OS_LOG_TYPE_INFO, "Got a 404 on a proppatch, replaying as mkcol.  Proppatch task was %@", (uint8_t *)&v38, 0xCu);
          }

          id v20 = [v7 backingAction];
          int v21 = [v20 context];
          uint64_t v22 = [v21 copyMkcolTask];
LABEL_29:
          __int16 v33 = v22;
          if (self->_syncItemOrder)
          {
            id v34 = v20;
            -[NSObject setAbsoluteOrder:](v33, "setAbsoluteOrder:", [v34 absoluteOrder]);
            __int16 v35 = [v34 priorURL];

            [v33 setPriorOrderedURL:v35];
          }
          [v33 setBackingAction:v20];
          [v33 setDelegate:self];
          id v36 = objc_loadWeakRetained((id *)p_accountInfoProvider);
          [v33 setAccountInfoProvider:v36];

          [v33 setTimeoutInterval:self->super._timeoutInterval];
          [(NSMutableArray *)self->_unsubmittedTasks addObject:v33];

          goto LABEL_38;
        }
      }
      else
      {
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v28 = [(NSMutableSet *)v8 domain];
      if ([v28 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"])
      {
        uint64_t v29 = [(NSMutableSet *)v8 code];

        if (v29 == 405)
        {
          uint64_t v30 = +[CoreDAVLogging sharedLogging];
          p_accountInfoProvider = &self->super._accountInfoProvider;
          id v31 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          id v32 = [v30 logHandleForAccountInfoProvider:v31];

          if (v32 && os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            int v38 = 138412290;
            id v39 = v7;
            _os_log_impl(&dword_213BFC000, v32, OS_LOG_TYPE_INFO, "Got a 405 on a mkcol, replaying as proppatch.  Mkcol task was %@", (uint8_t *)&v38, 0xCu);
          }

          id v20 = [v7 backingAction];
          int v21 = [v20 context];
          uint64_t v22 = [v21 copyPropPatchTask];
          goto LABEL_29;
        }
      }
      else
      {
      }
    }
    if (![(CoreDAVRecursiveContainerSyncTaskGroup *)self isWhitelistedError:v8])
    {
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
    int v21 = +[CoreDAVLogging sharedLogging];
    id v37 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    __int16 v33 = [v21 logHandleForAccountInfoProvider:v37];

    if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412546;
      id v39 = v7;
      __int16 v40 = 2112;
      char v41 = v8;
      _os_log_impl(&dword_213BFC000, v33, OS_LOG_TYPE_DEFAULT, "folderModTask:%@ error:%@ Ignoring", (uint8_t *)&v38, 0x16u);
    }
    id v20 = v8;
LABEL_38:

LABEL_39:
    [(CoreDAVRecursiveContainerSyncTaskGroup *)self _submitTasks];
    if (![(NSMutableSet *)self->super._outstandingTasks count]) {
      [(CoreDAVRecursiveContainerSyncTaskGroup *)self _getTopFolderTags];
    }
    goto LABEL_41;
  }
  if (([(NSMutableArray *)self->_unsubmittedTasks containsObject:v7] & 1) == 0)
  {
    unint64_t v9 = +[CoreDAVLogging sharedLogging];
    id v10 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v11 = [v9 logHandleForAccountInfoProvider:v10];

    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      int v38 = 138412802;
      id v39 = v7;
      __int16 v40 = 2112;
      char v41 = outstandingTasks;
      __int16 v42 = 2112;
      long long v43 = unsubmittedTasks;
      _os_log_impl(&dword_213BFC000, v11, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v38, 0x20u);
    }
  }
LABEL_42:
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CoreDAVRecursiveContainerSyncTaskGroup *)self _postTask:v6 didFinishWithError:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CoreDAVRecursiveContainerSyncTaskGroup *)self _syncReportTask:v6 didFinishWithError:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v6 parsedContents];
        unint64_t v9 = [v6 deletedURLs];
        [(CoreDAVRecursiveContainerSyncTaskGroup *)self _getTask:v6 finishedWithParsedContents:v8 deletedItems:v9 error:v7];
      }
      else
      {
        id v8 = +[CoreDAVLogging sharedLogging];
        id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        id v11 = [v8 logHandleForAccountInfoProvider:WeakRetained];

        if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v12 = 138412290;
          id v13 = v6;
          _os_log_impl(&dword_213BFC000, v11, OS_LOG_TYPE_ERROR, "Got a task completion invocation for a task I don't grok, %@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
}

- (void)moveTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if ([(NSMutableSet *)self->super._outstandingTasks containsObject:v7]) {
    [(NSMutableSet *)self->super._outstandingTasks removeObject:v7];
  }
  id v9 = v8;
  id v10 = v9;
  if ([(CoreDAVRecursiveContainerSyncTaskGroup *)self isWhitelistedError:v9])
  {
    id v11 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v13 = [v11 logHandleForAccountInfoProvider:WeakRetained];

    if (v13)
    {
      uint64_t v14 = v13;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = [v9 domain];
        uint64_t v16 = [v9 code];
        id v17 = [v7 url];
        [v17 lastPathComponent];
        id v18 = v56 = v7;
        *(_DWORD *)buf = 138412802;
        id v59 = v15;
        __int16 v60 = 2048;
        uint64_t v61 = v16;
        __int16 v62 = 2112;
        id v63 = v18;
        _os_log_impl(&dword_213BFC000, v14, OS_LOG_TYPE_ERROR, "Received a Whitelisted Error [Domain:%@ Code:%ld] For Move task %@ completion. Not a Fatal Error", buf, 0x20u);

        id v7 = v56;
      }
    }
    id v10 = 0;
  }
  if (v9 && !v10)
  {
    id v19 = +[CoreDAVLogging sharedLogging];
    id v20 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    int v21 = [v19 logHandleForAccountInfoProvider:v20];

    if (v21)
    {
      uint64_t v22 = v21;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        __int16 v23 = [v7 url];
        id v24 = [v23 lastPathComponent];
        *(_DWORD *)buf = 138412546;
        id v59 = v9;
        __int16 v60 = 2112;
        uint64_t v61 = (uint64_t)v24;
        _os_log_impl(&dword_213BFC000, v22, OS_LOG_TYPE_INFO, "Received a Whitelisted Error [%@] For Move task %@ completion .Calling delegate method with original error", buf, 0x16u);
      }
    }

    __int16 v25 = [(CoreDAVTaskGroup *)self delegate];
    char v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) == 0) {
      goto LABEL_31;
    }
    uint64_t v27 = [(CoreDAVTaskGroup *)self delegate];
    uint64_t v28 = [v7 url];
    uint64_t v29 = [v7 destinationURL];
    uint64_t v30 = v27;
    id v31 = v28;
    id v32 = v29;
    id v33 = v9;
LABEL_17:
    [v30 moveTaskFromURL:v31 toURL:v32 finishedWithIgnoredError:v33];

LABEL_31:
    if (![(NSMutableSet *)self->super._outstandingTasks count])
    {
      id v50 = +[CoreDAVLogging sharedLogging];
      id v51 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      uint64_t v52 = [v50 logHandleForAccountInfoProvider:v51];

      if (v52)
      {
        uint64_t v53 = v52;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          v54 = [v7 url];
          uint64_t v55 = [v54 lastPathComponent];
          *(_DWORD *)buf = 138412290;
          id v59 = v55;
          _os_log_impl(&dword_213BFC000, v53, OS_LOG_TYPE_INFO, "Move Task For ServerID %@", buf, 0xCu);
        }
      }

      [(CoreDAVRecursiveContainerSyncTaskGroup *)self _getTopFolderTags];
    }
    goto LABEL_37;
  }
  if (!v10)
  {
    if (v9) {
      goto LABEL_31;
    }
    __int16 v42 = +[CoreDAVLogging sharedLogging];
    id v43 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    uint64_t v44 = [v42 logHandleForAccountInfoProvider:v43];

    if (v44)
    {
      long long v45 = v44;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        uint64_t v46 = [v7 url];
        uint64_t v47 = [v46 lastPathComponent];
        *(_DWORD *)buf = 138412290;
        id v59 = v47;
        _os_log_impl(&dword_213BFC000, v45, OS_LOG_TYPE_INFO, "Move Task For ServerID %@", buf, 0xCu);
      }
    }

    v48 = [(CoreDAVTaskGroup *)self delegate];
    char v49 = objc_opt_respondsToSelector();

    if ((v49 & 1) == 0) {
      goto LABEL_31;
    }
    uint64_t v27 = [(CoreDAVTaskGroup *)self delegate];
    uint64_t v28 = [v7 url];
    uint64_t v29 = [v7 destinationURL];
    uint64_t v30 = v27;
    id v31 = v28;
    id v32 = v29;
    id v33 = 0;
    goto LABEL_17;
  }
  id v34 = +[CoreDAVLogging sharedLogging];
  id v35 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  id v36 = [v34 logHandleForAccountInfoProvider:v35];

  if (v36)
  {
    id v37 = v36;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      int v38 = [v9 domain];
      uint64_t v39 = [v9 code];
      [v7 url];
      __int16 v40 = v57 = v7;
      char v41 = [v40 lastPathComponent];
      *(_DWORD *)buf = 138412802;
      id v59 = v38;
      __int16 v60 = 2048;
      uint64_t v61 = v39;
      __int16 v62 = 2112;
      id v63 = v41;
      _os_log_impl(&dword_213BFC000, v37, OS_LOG_TYPE_ERROR, "Received a Fatal Error [Domain:%@ Code:%ld] For Move task %@ completion. Bailing task-group with FatalError", buf, 0x20u);

      id v7 = v57;
    }
  }
  [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v10];
LABEL_37:
}

- (void)deleteTask:(id)a3 completedWithError:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (NSMutableSet *)a4;
  if ([(NSMutableSet *)self->super._outstandingTasks containsObject:v6])
  {
    [(NSMutableSet *)self->super._outstandingTasks removeObject:v6];
    if ([(CoreDAVRecursiveContainerSyncTaskGroup *)self isWhitelistedError:v7])
    {
      id v8 = +[CoreDAVLogging sharedLogging];
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      id v10 = [v8 logHandleForAccountInfoProvider:WeakRetained];

      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412546;
        id v22 = v6;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_impl(&dword_213BFC000, v10, OS_LOG_TYPE_DEFAULT, "deleteTask:%@ completedWithError:%@ Ignoring", (uint8_t *)&v21, 0x16u);
      }
    }
    else if (v7)
    {
      [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v7];
      goto LABEL_22;
    }
    if (self->_phase)
    {
      uint64_t v16 = +[CoreDAVLogging sharedLogging];
      id v17 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      id v18 = [v16 logHandleForAccountInfoProvider:v17];

      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int phase = self->_phase;
        int v21 = 67109120;
        LODWORD(v22) = phase;
        _os_log_impl(&dword_213BFC000, v18, OS_LOG_TYPE_ERROR, "Got a successful delete task response, but I'm in phase %d.  What gives?", (uint8_t *)&v21, 8u);
      }

      id v20 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
      [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v20];
    }
    else
    {
      [(CoreDAVRecursiveContainerSyncTaskGroup *)self _submitTasks];
      if (![(NSMutableSet *)self->super._outstandingTasks count]) {
        [(CoreDAVRecursiveContainerSyncTaskGroup *)self _getTopFolderTags];
      }
    }
    id v7 = 0;
  }
  else if (([(NSMutableArray *)self->_unsubmittedTasks containsObject:v6] & 1) == 0)
  {
    id v11 = +[CoreDAVLogging sharedLogging];
    id v12 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v13 = [v11 logHandleForAccountInfoProvider:v12];

    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      int v21 = 138412802;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = outstandingTasks;
      __int16 v25 = 2112;
      char v26 = unsubmittedTasks;
      _os_log_impl(&dword_213BFC000, v13, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v21, 0x20u);
    }
  }
LABEL_22:
}

- (void)_syncReportTask:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v55 = self;
  if ([(NSMutableSet *)self->super._outstandingTasks containsObject:v6])
  {
    [(NSMutableSet *)self->super._outstandingTasks removeObject:v6];
    if (self->_phase == 2)
    {
      if ([v6 wasInvalidSyncToken])
      {
        [(CoreDAVRecursiveContainerSyncTaskGroup *)self setPreviousSyncToken:0];
        [(CoreDAVRecursiveContainerSyncTaskGroup *)self _getTopFolderTags];
      }
      else if (v7)
      {
        [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v7];
      }
      else
      {
        if (!self->_leafURLToETag)
        {
          id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
          leafURLToETag = self->_leafURLToETag;
          self->_leafURLToETag = v13;
        }
        if (!self->_childCollectionURL)
        {
          uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
          childCollectionURL = self->_childCollectionURL;
          self->_childCollectionURL = v15;
        }
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        v54 = v6;
        id v17 = objc_msgSend(v6, "multiStatus", v7);
        id v18 = [v17 responses];

        obuint64_t j = v18;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v59 objects:v69 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v60;
          id v22 = @"DAV:";
          uint64_t v56 = *(void *)v60;
          do
          {
            uint64_t v23 = 0;
            uint64_t v57 = v20;
            do
            {
              if (*(void *)v60 != v21) {
                objc_enumerationMutation(obj);
              }
              id v24 = *(void **)(*((void *)&v59 + 1) + 8 * v23);
              __int16 v25 = [v24 firstHref];
              char v26 = [v25 payloadAsFullURL];

              uint64_t v27 = [v24 successfulPropertiesToValues];
              uint64_t v28 = [v27 CDVObjectForKeyWithNameSpace:v22 andName:@"resourcetype"];
              uint64_t v29 = [v28 collection];

              if (v29)
              {
                if ([(CoreDAVRecursiveContainerSyncTaskGroup *)self shouldSyncChildWithResourceType:v28])
                {
                  [(NSMutableArray *)self->_childCollectionURL addObject:v26];
                }
              }
              else
              {
                uint64_t v30 = v22;
                id v31 = [v27 CDVObjectForKeyWithNameSpace:v22 andName:@"getetag"];
                id v32 = [v31 payloadAsString];
                if (v32) {
                  BOOL v33 = v26 == 0;
                }
                else {
                  BOOL v33 = 1;
                }
                if (v33)
                {
                  id v34 = [v24 status];
                  id v35 = [v34 payloadAsString];
                  char v36 = [v35 CDVIsHTTPStatusLineWithStatusCode:404];

                  self = v55;
                  if ((v36 & 1) == 0)
                  {
                    id v37 = +[CoreDAVLogging sharedLogging];
                    id WeakRetained = objc_loadWeakRetained((id *)&v55->super._accountInfoProvider);
                    uint64_t v39 = [v37 logHandleForAccountInfoProvider:WeakRetained];

                    if (v39 && os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      id v64 = v32;
                      __int16 v65 = 2112;
                      uint64_t v66 = v26;
                      _os_log_impl(&dword_213BFC000, v39, OS_LOG_TYPE_DEFAULT, "Found an eTag without one or both of eTag (%{public}@) or url (%@). Dropping it on the floor", buf, 0x16u);
                    }

                    self = v55;
                  }
                }
                else
                {
                  [(NSMutableDictionary *)self->_leafURLToETag setObject:v32 forKey:v26];
                }

                id v22 = v30;
                uint64_t v21 = v56;
                uint64_t v20 = v57;
              }

              ++v23;
            }
            while (v20 != v23);
            uint64_t v20 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
          }
          while (v20);
        }

        id v6 = v54;
        __int16 v40 = [v54 notFoundHREFs];
        id v7 = v53;
        if ([v40 count])
        {
          syncReportDeletedURLs = self->_syncReportDeletedURLs;
          if (!syncReportDeletedURLs)
          {
            __int16 v42 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
            id v43 = self->_syncReportDeletedURLs;
            self->_syncReportDeletedURLs = v42;

            syncReportDeletedURLs = self->_syncReportDeletedURLs;
          }
          [(NSMutableSet *)syncReportDeletedURLs unionSet:v40];
        }
        int v44 = [v54 moreToSync];
        long long v45 = [v54 nextSyncToken];
        uint64_t v46 = v45;
        if (v44)
        {

          if (v46)
          {
            uint64_t v47 = [v54 nextSyncToken];
            [(CoreDAVRecursiveContainerSyncTaskGroup *)self setPreviousSyncToken:v47];

            v48 = self;
          }
          else
          {
            id v50 = +[CoreDAVLogging sharedLogging];
            id v51 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            uint64_t v52 = [v50 logHandleForAccountInfoProvider:v51];

            if (v52 && os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_213BFC000, v52, OS_LOG_TYPE_DEFAULT, "Was told to sync more items, but got no new sync token.  Starting from scatch", buf, 2u);
            }

            [(CoreDAVRecursiveContainerSyncTaskGroup *)v55 setPreviousSyncToken:0];
            [(NSMutableDictionary *)v55->_leafURLToETag removeAllObjects];
            [(NSMutableArray *)v55->_childCollectionURL removeAllObjects];
            [(NSMutableSet *)v55->_syncReportDeletedURLs removeAllObjects];
            v48 = v55;
          }
          [(CoreDAVRecursiveContainerSyncTaskGroup *)v48 _getItemTags];
        }
        else
        {
          nextSyncTokeuint64_t n = self->_nextSyncToken;
          self->_nextSyncTokeuint64_t n = (NSString *)v45;

          [(CoreDAVRecursiveContainerSyncTaskGroup *)self _getDataPayloads];
        }
      }
    }
  }
  else if (([(NSMutableArray *)self->_unsubmittedTasks containsObject:v6] & 1) == 0)
  {
    id v8 = +[CoreDAVLogging sharedLogging];
    id v9 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v10 = [v8 logHandleForAccountInfoProvider:v9];

    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = v55->super._outstandingTasks;
      unsubmittedTasks = v55->_unsubmittedTasks;
      *(_DWORD *)buf = 138412802;
      id v64 = v6;
      __int16 v65 = 2112;
      uint64_t v66 = outstandingTasks;
      __int16 v67 = 2112;
      v68 = unsubmittedTasks;
      _os_log_impl(&dword_213BFC000, v10, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", buf, 0x20u);
    }
  }
}

- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(NSMutableSet *)self->super._outstandingTasks containsObject:v8])
  {
    if ([(NSMutableArray *)self->_unsubmittedTasks containsObject:v8]) {
      goto LABEL_39;
    }
    uint64_t v27 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    uint64_t v29 = [v27 logHandleForAccountInfoProvider:WeakRetained];

    if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      *(_DWORD *)buf = 138412802;
      id v52 = v8;
      __int16 v53 = 2112;
      v54 = outstandingTasks;
      __int16 v55 = 2112;
      uint64_t v56 = unsubmittedTasks;
      _os_log_impl(&dword_213BFC000, v29, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", buf, 0x20u);
    }

LABEL_38:
    goto LABEL_39;
  }
  [(NSMutableSet *)self->super._outstandingTasks removeObject:v8];
  if (v10)
  {
    id v11 = [v10 domain];
    if ([v11 isEqualToString:@"CoreDAVErrorDomain"])
    {
      uint64_t v12 = [v10 code];

      if (v12 == 2) {
        goto LABEL_5;
      }
    }
    else
    {
    }
    [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v10];
    goto LABEL_39;
  }
LABEL_5:
  if (self->_phase != 1)
  {
    id v32 = +[CoreDAVLogging sharedLogging];
    id v33 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v34 = [v32 logHandleForAccountInfoProvider:v33];

    if (v34 && os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      int phase = self->_phase;
      *(_DWORD *)buf = 67109120;
      LODWORD(v52) = phase;
      _os_log_impl(&dword_213BFC000, v34, OS_LOG_TYPE_ERROR, "Got a propfind response in unexpected state %d", buf, 8u);
    }

    char v36 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = 6;
    goto LABEL_37;
  }
  if (![v9 count])
  {
    int v38 = +[CoreDAVLogging sharedLogging];
    id v39 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    __int16 v40 = [v38 logHandleForAccountInfoProvider:v39];

    if (v40 && os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v9;
      _os_log_impl(&dword_213BFC000, v40, OS_LOG_TYPE_DEFAULT, "We need exactly one ctag per container.  We got %@", buf, 0xCu);
    }

    char v36 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = 8;
LABEL_37:
    uint64_t v27 = [v36 errorWithDomain:@"CoreDAVErrorDomain" code:v37 userInfo:0];
    [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v27];
    goto LABEL_38;
  }
  id v44 = v10;
  id v45 = v9;
  id v46 = v8;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    id v17 = 0;
    id v18 = 0;
    uint64_t v19 = *(void *)v48;
    while (1)
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(v13);
        }
        uint64_t v21 = [*(id *)(*((void *)&v47 + 1) + 8 * v20) successfulPropertiesToValues];
        id v22 = v21;
        if (v18)
        {
          if (!v16) {
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v23 = [v21 CDVObjectForKeyWithNameSpace:@"http://calendarserver.org/ns/" andName:@"getctag"];
          id v18 = [v23 payloadAsString];

          if (!v16)
          {
LABEL_18:
            id v24 = [v22 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"sync-token"];
            uint64_t v16 = [v24 payloadAsString];

            if (v17) {
              goto LABEL_15;
            }
            goto LABEL_19;
          }
        }
        if (v17) {
          goto LABEL_15;
        }
LABEL_19:
        __int16 v25 = [v22 CDVObjectForKeyWithNameSpace:@"http://me.com/_namespace/" andName:@"propertytag"];
        id v17 = [v25 payloadAsString];

LABEL_15:
        ++v20;
      }
      while (v15 != v20);
      uint64_t v26 = [v13 countByEnumeratingWithState:&v47 objects:v57 count:16];
      uint64_t v15 = v26;
      if (!v26) {
        goto LABEL_41;
      }
    }
  }
  uint64_t v16 = 0;
  id v17 = 0;
  id v18 = 0;
LABEL_41:

  objc_storeStrong((id *)&self->_nextSyncToken, v16);
  if (v18) {
    char v41 = v18;
  }
  else {
    char v41 = @"ServerDoesNotSupportCTags";
  }
  [(CoreDAVRecursiveContainerSyncTaskGroup *)self setNextCTag:v41];
  if (v17) {
    __int16 v42 = v17;
  }
  else {
    __int16 v42 = @"ServerDoesNotSupportPTags";
  }
  id v10 = v44;
  nextPTag = self->_nextPTag;
  self->_nextPTag = &v42->isa;

  [(CoreDAVRecursiveContainerSyncTaskGroup *)self _getItemTags];
  id v9 = v45;
  id v8 = v46;
LABEL_39:
}

- (void)_getTask:(id)a3 finishedWithParsedContents:(id)a4 deletedItems:(id)a5 error:(id)a6
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(NSMutableSet *)self->super._outstandingTasks containsObject:v10])
  {
    [(NSMutableSet *)self->super._outstandingTasks removeObject:v10];
    if (v12)
    {
      [(CoreDAVRecursiveContainerSyncTaskGroup *)self bailWithError:v12];
      goto LABEL_46;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();
    char v20 = v19;
    if (isKindOfClass & 1) != 0 || (v19)
    {
      id v34 = [v10 missingURLs];
      if ([v34 count])
      {
        id v49 = v10;
        if (isKindOfClass) {
          id v35 = [(CoreDAVRecursiveContainerSyncTaskGroup *)self copyFolderMultiGetTaskWithURLs:v34];
        }
        else {
          id v35 = [(CoreDAVRecursiveContainerSyncTaskGroup *)self copyMultiGetTaskWithURLs:v34];
        }
        char v36 = v35;
        id v47 = v11;
        if (!v35)
        {
          id v44 = [MEMORY[0x263F08690] currentHandler];
          [v44 handleFailureInMethod:a2, self, @"CoreDAVRecursiveContainerSyncTaskGroup.m", 970, @"Couldn't create multiget task, things will go poorly" object file lineNumber description];
        }
        uint64_t v37 = +[CoreDAVLogging sharedLogging];
        p_accountInfoProvider = &self->super._accountInfoProvider;
        id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        __int16 v40 = [v37 logHandleForAccountInfoProvider:WeakRetained];

        if (v40)
        {
          char v41 = v40;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v55 = v36;
            __int16 v56 = 2048;
            uint64_t v57 = [v34 count];
            _os_log_impl(&dword_213BFC000, v41, OS_LOG_TYPE_INFO, "%@ missed %lu items - resubmitting", buf, 0x16u);
          }

          p_accountInfoProvider = &self->super._accountInfoProvider;
        }

        [v36 setDelegate:self];
        id v42 = objc_loadWeakRetained((id *)p_accountInfoProvider);
        [v36 setAccountInfoProvider:v42];

        [v36 setTimeoutInterval:self->super._timeoutInterval];
        [(NSMutableArray *)self->_unsubmittedTasks addObject:v36];

        id v11 = v47;
        id v10 = v49;
      }

      id v12 = 0;
      if (isKindOfClass) {
        goto LABEL_12;
      }
    }
    else if (isKindOfClass)
    {
LABEL_12:
      id v46 = v11;
      id v48 = v10;
      uint64_t v21 = objc_msgSend(v11, "allObjects", v12);
      id v22 = (void *)[v21 mutableCopy];

      [v22 sortUsingComparator:&__block_literal_global_65];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v50 objects:v60 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v51 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            if ([v28 isUnauthenticated])
            {
              uint64_t v29 = +[CoreDAVLogging sharedLogging];
              id v30 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
              id v31 = [v29 logHandleForAccountInfoProvider:v30];

              if (v31 && os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v55 = v28;
                _os_log_impl(&dword_213BFC000, v31, OS_LOG_TYPE_DEFAULT, "Not authenticated to get Folder Info for item %@", buf, 0xCu);
              }
            }
            else
            {
              uint64_t v29 = [(CoreDAVTaskGroup *)self delegate];
              [v29 recursiveContainerSyncTask:self receivedAddedOrModifiedFolder:v28];
            }

            if (objc_opt_respondsToSelector())
            {
              id v32 = [v28 childrenOrder];
              id v33 = [v28 serverID];
              [(CoreDAVRecursiveContainerSyncTaskGroup *)self _foundChildrenOrder:v32 inFolderWithURL:v33];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v50 objects:v60 count:16];
        }
        while (v25);
      }

      [(CoreDAVRecursiveContainerSyncTaskGroup *)self _submitTasks];
      if (![(NSMutableSet *)self->super._outstandingTasks count]) {
        [(CoreDAVRecursiveContainerSyncTaskGroup *)self _taskGroupSuccessfullyFinishedWithContents:0];
      }

      id v11 = v46;
      id v10 = v48;
      id v12 = v45;
      goto LABEL_46;
    }
    if (v20)
    {
      [(CoreDAVRecursiveContainerSyncTaskGroup *)self _submitTasks];
      if ([(NSMutableSet *)self->super._outstandingTasks count])
      {
        id v43 = [(CoreDAVTaskGroup *)self delegate];
        [v43 recursiveContainerSyncTask:self retrievedAddedOrModifiedActions:v11 removed:0];
      }
      else
      {
        [(CoreDAVRecursiveContainerSyncTaskGroup *)self _taskGroupSuccessfullyFinishedWithContents:v11];
      }
    }
  }
  else if (([(NSMutableArray *)self->_unsubmittedTasks containsObject:v10] & 1) == 0)
  {
    id v13 = +[CoreDAVLogging sharedLogging];
    id v14 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    uint64_t v15 = [v13 logHandleForAccountInfoProvider:v14];

    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      *(_DWORD *)buf = 138412802;
      id v55 = v10;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)outstandingTasks;
      __int16 v58 = 2112;
      long long v59 = unsubmittedTasks;
      _os_log_impl(&dword_213BFC000, v15, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", buf, 0x20u);
    }
  }
LABEL_46:
}

uint64_t __97__CoreDAVRecursiveContainerSyncTaskGroup__getTask_finishedWithParsedContents_deletedItems_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 url];
  id v6 = [v5 pathComponents];
  unint64_t v7 = [v6 count];

  id v8 = [v4 url];

  id v9 = [v8 pathComponents];
  unint64_t v10 = [v9 count];

  if (v7 < v10) {
    return -1;
  }
  else {
    return v7 > v10;
  }
}

- (id)_copyContainerParserMappings
{
  return (id)[(objc_class *)self->_appSpecificContainerItemClass copyPropertyMappingsForParser];
}

- (id)copyMultiGetTaskWithURLs:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  id v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

  if (v6)
  {
    unint64_t v7 = v6;
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

- (id)copyFolderMultiGetTaskWithURLs:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  id v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

  if (v6)
  {
    unint64_t v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v8 = v11;
      _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_ERROR, "copyFolderMultiGetTaskWithURLs: to be implemented by subclass %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }

  return 0;
}

- (id)dataContentType
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  int v5 = [v3 logHandleForAccountInfoProvider:WeakRetained];

  if (v5)
  {
    id v6 = v5;
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

- (BOOL)shouldSyncChildWithResourceType:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  id v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

  if (v6)
  {
    id v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v8 = v11;
      _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_ERROR, "shouldSyncChildWithResourceType: to be implemented by subclass %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }

  return 0;
}

- (unint64_t)multiGetBatchSize
{
  return self->_multiGetBatchSize;
}

- (void)setMultiGetBatchSize:(unint64_t)a3
{
  self->_multiGetBatchSize = a3;
}

- (NSURL)folderURL
{
  return self->_folderURL;
}

- (NSString)previousCTag
{
  return self->_previousCTag;
}

- (BOOL)preflightCTag
{
  return self->_preflightCTag;
}

- (void)setPreflightCTag:(BOOL)a3
{
  self->_preflightCTag = a3;
}

- (NSString)previousSyncToken
{
  return self->_previousSyncToken;
}

- (void)setPreviousSyncToken:(id)a3
{
}

- (NSDictionary)folderURLToChildrenURLOrder
{
  return &self->_folderURLToChildrenURLOrder->super;
}

- (NSString)nextCTag
{
  return self->_nextCTag;
}

- (void)setNextCTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderURLToChildrenURLOrder, 0);
  objc_storeStrong((id *)&self->_childCollectionURL, 0);
  objc_storeStrong((id *)&self->_leafURLToETag, 0);
  objc_storeStrong((id *)&self->_syncReportDeletedURLs, 0);
  objc_storeStrong((id *)&self->_addMemberURL, 0);
  objc_storeStrong((id *)&self->_unsubmittedTasks, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_nextPTag, 0);
  objc_storeStrong((id *)&self->_previousPTag, 0);
  objc_storeStrong((id *)&self->_nextSyncToken, 0);
  objc_storeStrong((id *)&self->_previousSyncToken, 0);
  objc_storeStrong((id *)&self->_nextCTag, 0);
  objc_storeStrong((id *)&self->_previousCTag, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);
}

@end