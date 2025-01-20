@interface CoreDAVBulkUploadTaskGroup
- (BOOL)validCTag;
- (Class)multiPutTaskClass;
- (CoreDAVBulkUploadTaskGroup)initWithFolderURL:(id)a3 checkCTag:(id)a4 uuidsToAddActions:(id)a5 hrefsToModDeleteActions:(id)a6 context:(id)a7 accountInfoProvider:(id)a8 taskManager:(id)a9;
- (NSDictionary)hrefToETag;
- (NSDictionary)hrefToErrorItems;
- (NSDictionary)hrefToStatus;
- (NSDictionary)uuidToErrorItems;
- (NSDictionary)uuidToHREF;
- (NSDictionary)uuidToStatus;
- (NSString)description;
- (NSString)nextCTag;
- (NSURL)folderURL;
- (unint64_t)multiPutBatchMaxNumResources;
- (unint64_t)multiPutBatchMaxSize;
- (void)_sendNextBatch;
- (void)setMultiPutBatchMaxNumResources:(unint64_t)a3;
- (void)setMultiPutBatchMaxSize:(unint64_t)a3;
- (void)setNextCTag:(id)a3;
- (void)task:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CoreDAVBulkUploadTaskGroup

- (CoreDAVBulkUploadTaskGroup)initWithFolderURL:(id)a3 checkCTag:(id)a4 uuidsToAddActions:(id)a5 hrefsToModDeleteActions:(id)a6 context:(id)a7 accountInfoProvider:(id)a8 taskManager:(id)a9
{
  id v17 = a3;
  id v44 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if ([(CoreDAVBulkUploadTaskGroup *)self isMemberOfClass:objc_opt_class()])
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"CoreDAVBulkUploadTaskGroup.m", 50, @"You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@", objc_opt_class() object file lineNumber description];

    v24 = 0;
  }
  else
  {
    v45.receiver = self;
    v45.super_class = (Class)CoreDAVBulkUploadTaskGroup;
    v25 = [(CoreDAVTaskGroup *)&v45 initWithAccountInfoProvider:v21 taskManager:v22];
    v26 = v25;
    if (v25)
    {
      [(CoreDAVTaskGroup *)v25 setContext:v20];
      objc_storeStrong((id *)&v26->_folderURL, a3);
      objc_storeStrong((id *)&v26->_lastKnownCTag, a4);
      v26->_multiPutBatchMaxNumResources = 25;
      v26->_multiPutBatchMaxSize = 0;
      uint64_t v27 = [v18 mutableCopy];
      remainingUUIDsToAddActions = v26->_remainingUUIDsToAddActions;
      v26->_remainingUUIDsToAddActions = (NSMutableDictionary *)v27;

      uint64_t v29 = [v19 mutableCopy];
      remainingHREFsToModDeleteActions = v26->_remainingHREFsToModDeleteActions;
      v26->_remainingHREFsToModDeleteActions = (NSMutableDictionary *)v29;

      v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      uuidToHREF = v26->_uuidToHREF;
      v26->_uuidToHREF = v31;

      v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      hrefToETag = v26->_hrefToETag;
      v26->_hrefToETag = v33;

      v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      uuidToErrorItems = v26->_uuidToErrorItems;
      v26->_uuidToErrorItems = v35;

      v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      hrefToErrorItems = v26->_hrefToErrorItems;
      v26->_hrefToErrorItems = v37;

      v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      uuidToStatus = v26->_uuidToStatus;
      v26->_uuidToStatus = v39;

      v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      hrefToStatus = v26->_hrefToStatus;
      v26->_hrefToStatus = v41;
    }
    self = v26;
    v24 = self;
  }

  return v24;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@ %p: NumRemainingAdds %d NumRemainingModDeletes %d", v5, self, -[NSMutableDictionary count](self->_remainingUUIDsToAddActions, "count"), -[NSMutableDictionary count](self->_remainingHREFsToModDeleteActions, "count")];

  return (NSString *)v6;
}

- (Class)multiPutTaskClass
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
      _os_log_impl(&dword_213BFC000, v6, OS_LOG_TYPE_ERROR, "multiPutTaskClass to be implemented by subclass %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }

  return 0;
}

- (void)_sendNextBatch
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  if ([(NSMutableDictionary *)self->_remainingUUIDsToAddActions count]
    || [(NSMutableDictionary *)self->_remainingHREFsToModDeleteActions count])
  {
    id v46 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v53 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    obuint64_t j = [(NSMutableDictionary *)self->_remainingHREFsToModDeleteActions allKeys];
    uint64_t v3 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
    if (v3)
    {
      unsigned int v4 = 0;
      int v5 = 0;
      uint64_t v6 = *(void *)v67;
      unint64_t v7 = 0x2677FD000uLL;
      uint64_t v43 = *(void *)v67;
      while (2)
      {
        uint64_t v8 = 0;
        LODWORD(v42) = v5;
        HIDWORD(v42) = v5 + v3;
        uint64_t v49 = v3;
        int v51 = v5 + 1;
        do
        {
          if (*(void *)v67 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v66 + 1) + 8 * v8);
          id v10 = -[NSMutableDictionary objectForKey:](self->_remainingHREFsToModDeleteActions, "objectForKey:", v9, v42);
          if ([v10 action] == 1)
          {
            [v10 context];
            uint64_t v11 = v47 = v4;
            [v11 dataPayload];
            v13 = unint64_t v12 = v7;
            int v14 = [v13 length];

            unint64_t v7 = v12;
            unsigned int v4 = v47;
            uint64_t v6 = v43;
          }
          else
          {
            int v14 = 100;
          }
          v4 += v14;
          unint64_t v15 = *(unint64_t *)((char *)&self->super.super.isa + *(int *)(v7 + 1936));
          if (v15) {
            BOOL v16 = v15 >= (v51 + v8);
          }
          else {
            BOOL v16 = 1;
          }
          if (!v16
            || (unint64_t multiPutBatchMaxSize = self->_multiPutBatchMaxSize) != 0
            && (float)multiPutBatchMaxSize * 0.8 < (float)v4)
          {

            HIDWORD(v42) = v42 + v8 + 1;
            char v18 = 1;
            goto LABEL_23;
          }
          [v53 setObject:v10 forKey:v9];

          ++v8;
        }
        while (v49 != v8);
        uint64_t v3 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
        char v18 = 0;
        int v5 = HIDWORD(v42);
        if (v3) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v18 = 0;
      unsigned int v4 = 0;
      HIDWORD(v42) = 0;
    }
LABEL_23:

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v19 = [v53 allKeys];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v62 objects:v72 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v63 != v22) {
            objc_enumerationMutation(v19);
          }
          [(NSMutableDictionary *)self->_remainingHREFsToModDeleteActions removeObjectForKey:*(void *)(*((void *)&v62 + 1) + 8 * i)];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v62 objects:v72 count:16];
      }
      while (v21);
    }

    if ((v18 & 1) == 0)
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id obja = [(NSMutableDictionary *)self->_remainingUUIDsToAddActions allKeys];
      uint64_t v52 = [obja countByEnumeratingWithState:&v58 objects:v71 count:16];
      if (v52)
      {
        uint64_t v48 = *(void *)v59;
        while (2)
        {
          uint64_t v24 = 0;
          int v50 = HIDWORD(v42) + 1;
          HIDWORD(v42) += v52;
          do
          {
            unsigned int v25 = v4;
            if (*(void *)v59 != v48) {
              objc_enumerationMutation(obja);
            }
            uint64_t v26 = *(void *)(*((void *)&v58 + 1) + 8 * v24);
            uint64_t v27 = [(NSMutableDictionary *)self->_remainingUUIDsToAddActions objectForKey:v26];
            v28 = [v27 context];
            uint64_t v29 = [v28 dataPayload];
            int v30 = [v29 length];

            unint64_t multiPutBatchMaxNumResources = self->_multiPutBatchMaxNumResources;
            if (multiPutBatchMaxNumResources) {
              BOOL v32 = multiPutBatchMaxNumResources >= (v50 + v24);
            }
            else {
              BOOL v32 = 1;
            }
            if (!v32 || (unsigned int v4 = v25 + v30, (v33 = self->_multiPutBatchMaxSize) != 0) && (float)v33 * 0.8 < (float)v4)
            {

              goto LABEL_47;
            }
            [v46 setObject:v27 forKey:v26];

            ++v24;
          }
          while (v52 != v24);
          uint64_t v52 = [obja countByEnumeratingWithState:&v58 objects:v71 count:16];
          if (v52) {
            continue;
          }
          break;
        }
      }
LABEL_47:
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v34 = [v46 allKeys];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v54 objects:v70 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v55 != v37) {
            objc_enumerationMutation(v34);
          }
          [(NSMutableDictionary *)self->_remainingUUIDsToAddActions removeObjectForKey:*(void *)(*((void *)&v54 + 1) + 8 * j)];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v54 objects:v70 count:16];
      }
      while (v36);
    }

    v39 = objc_msgSend(objc_alloc(-[CoreDAVBulkUploadTaskGroup multiPutTaskClass](self, "multiPutTaskClass")), "initWithURL:checkCTag:uuidsToAddActions:hrefsToModDeleteActions:", self->_folderURL, self->_lastKnownCTag, v46, v53);
    [(NSMutableSet *)self->super._outstandingTasks addObject:v39];
    [v39 setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    [v39 setAccountInfoProvider:WeakRetained];

    [v39 setTimeoutInterval:self->super._timeoutInterval];
    id v41 = objc_loadWeakRetained((id *)&self->super._taskManager);
    [v41 submitQueuedCoreDAVTask:v39];
  }
  else
  {
    self->_validCTag = 1;
    [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:0];
  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(NSMutableSet *)self->super._outstandingTasks removeObject:v6];
  id v8 = v6;
  uint64_t v9 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  uint64_t v11 = [v9 logHandleForAccountInfoProvider:WeakRetained];

  if (v11)
  {
    unint64_t v12 = v11;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = [v8 uuidToHREF];
      int v14 = [v8 hrefToETag];
      int v39 = 138412802;
      v40 = v13;
      __int16 v41 = 2112;
      uint64_t v42 = v14;
      __int16 v43 = 2112;
      id v44 = v7;
      _os_log_impl(&dword_213BFC000, v12, OS_LOG_TYPE_INFO, "MultiPutTask finished.  uuidToHREF %@\nhrefToETAG %@\nerror %@", (uint8_t *)&v39, 0x20u);
    }
  }

  uuidToHREF = self->_uuidToHREF;
  BOOL v16 = [v8 uuidToHREF];
  [(NSMutableDictionary *)uuidToHREF addEntriesFromDictionary:v16];

  hrefToETag = self->_hrefToETag;
  char v18 = [v8 hrefToETag];
  [(NSMutableDictionary *)hrefToETag addEntriesFromDictionary:v18];

  uuidToErrorItems = self->_uuidToErrorItems;
  uint64_t v20 = [v8 uuidToErrorItems];
  [(NSMutableDictionary *)uuidToErrorItems addEntriesFromDictionary:v20];

  hrefToErrorItems = self->_hrefToErrorItems;
  uint64_t v22 = [v8 hrefToErrorItems];
  [(NSMutableDictionary *)hrefToErrorItems addEntriesFromDictionary:v22];

  uuidToStatus = self->_uuidToStatus;
  uint64_t v24 = [v8 uuidToStatus];
  [(NSMutableDictionary *)uuidToStatus addEntriesFromDictionary:v24];

  hrefToStatus = self->_hrefToStatus;
  uint64_t v26 = [v8 hrefToStatus];
  [(NSMutableDictionary *)hrefToStatus addEntriesFromDictionary:v26];

  if (v7)
  {
    if ([v7 code] == 412)
    {
      uint64_t v27 = [v7 domain];
      int v28 = [v27 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"];

      if (v28)
      {
        uint64_t v29 = +[CoreDAVLogging sharedLogging];
        id v30 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        v31 = [v29 logHandleForAccountInfoProvider:v30];

        if (v31 && os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          LOWORD(v39) = 0;
          _os_log_impl(&dword_213BFC000, v31, OS_LOG_TYPE_INFO, "MultiPutTask told that our ctag was out of date.  Bailing on the group", (uint8_t *)&v39, 2u);
        }

        self->_validCTag = 0;
      }
    }
    [(CoreDAVTaskGroup *)self bailWithError:v7];
  }
  else
  {
    BOOL v32 = [v8 nextCTag];
    uint64_t v33 = [v32 length];

    if (v33)
    {
      v34 = [v8 nextCTag];
      [(CoreDAVBulkUploadTaskGroup *)self setNextCTag:v34];

      [(CoreDAVBulkUploadTaskGroup *)self _sendNextBatch];
    }
    else
    {
      uint64_t v35 = +[CoreDAVLogging sharedLogging];
      id v36 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      uint64_t v37 = [v35 logHandleForAccountInfoProvider:v36];

      if (v37 && os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        LOWORD(v39) = 0;
        _os_log_impl(&dword_213BFC000, v37, OS_LOG_TYPE_INFO, "Got no updated ctag from the server, bailing on the group", (uint8_t *)&v39, 2u);
      }

      self->_validCTag = 0;
      v38 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:7 userInfo:0];
      [(CoreDAVTaskGroup *)self bailWithError:v38];
    }
  }
}

- (unint64_t)multiPutBatchMaxNumResources
{
  return self->_multiPutBatchMaxNumResources;
}

- (void)setMultiPutBatchMaxNumResources:(unint64_t)a3
{
  self->_unint64_t multiPutBatchMaxNumResources = a3;
}

- (unint64_t)multiPutBatchMaxSize
{
  return self->_multiPutBatchMaxSize;
}

- (void)setMultiPutBatchMaxSize:(unint64_t)a3
{
  self->_unint64_t multiPutBatchMaxSize = a3;
}

- (NSURL)folderURL
{
  return self->_folderURL;
}

- (BOOL)validCTag
{
  return self->_validCTag;
}

- (NSString)nextCTag
{
  return self->_lastKnownCTag;
}

- (void)setNextCTag:(id)a3
{
}

- (NSDictionary)uuidToHREF
{
  return &self->_uuidToHREF->super;
}

- (NSDictionary)hrefToETag
{
  return &self->_hrefToETag->super;
}

- (NSDictionary)uuidToErrorItems
{
  return &self->_uuidToErrorItems->super;
}

- (NSDictionary)hrefToErrorItems
{
  return &self->_hrefToErrorItems->super;
}

- (NSDictionary)uuidToStatus
{
  return &self->_uuidToStatus->super;
}

- (NSDictionary)hrefToStatus
{
  return &self->_hrefToStatus->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hrefToStatus, 0);
  objc_storeStrong((id *)&self->_uuidToStatus, 0);
  objc_storeStrong((id *)&self->_hrefToErrorItems, 0);
  objc_storeStrong((id *)&self->_uuidToErrorItems, 0);
  objc_storeStrong((id *)&self->_hrefToETag, 0);
  objc_storeStrong((id *)&self->_uuidToHREF, 0);
  objc_storeStrong((id *)&self->_remainingHREFsToModDeleteActions, 0);
  objc_storeStrong((id *)&self->_remainingUUIDsToAddActions, 0);
  objc_storeStrong((id *)&self->_lastKnownCTag, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);
}

@end