@interface CoreDAVContainerInfoSyncTaskGroup
- (Class)containerItemClass;
- (CoreDAVContainerInfoSyncProvider)delegate;
- (CoreDAVContainerInfoSyncTaskGroup)initWithContainerURL:(id)a3 previousSyncToken:(id)a4 accountInfoProvider:(id)a5 taskManager:(id)a6;
- (NSString)description;
- (id)copyContainerParserMappings;
- (void)setDelegate:(id)a3;
- (void)startTaskGroup;
- (void)task:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CoreDAVContainerInfoSyncTaskGroup

- (CoreDAVContainerInfoSyncTaskGroup)initWithContainerURL:(id)a3 previousSyncToken:(id)a4 accountInfoProvider:(id)a5 taskManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CoreDAVContainerInfoSyncTaskGroup;
  v13 = [(CoreDAVTaskGroup *)&v16 initWithAccountInfoProvider:a5 taskManager:a6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_previousSyncToken, a4);
    objc_storeStrong((id *)&v14->_containerURL, a3);
  }

  return v14;
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CoreDAVContainerInfoSyncTaskGroup;
  [(CoreDAVTaskGroup *)&v3 setDelegate:a3];
}

- (CoreDAVContainerInfoSyncProvider)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)CoreDAVContainerInfoSyncTaskGroup;
  v2 = [(CoreDAVTaskGroup *)&v4 delegate];
  return (CoreDAVContainerInfoSyncProvider *)v2;
}

- (NSString)description
{
  objc_super v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@ %p: URL %@", v5, self, self->_containerURL];

  return (NSString *)v6;
}

- (void)startTaskGroup
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(CoreDAVContainerInfoSyncTaskGroup *)self copyContainerParserMappings];
  objc_super v4 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    containerURL = self->_containerURL;
    int v11 = 138412290;
    id v12 = containerURL;
    _os_log_impl(&dword_213BFC000, v6, OS_LOG_TYPE_INFO, "Sending out a container info sync task to %@", (uint8_t *)&v11, 0xCu);
  }

  v8 = [[CoreDAVSyncReportTask alloc] initWithPropertiesToFind:v3 atURL:self->_containerURL withDepth:3 previousSyncToken:self->_previousSyncToken];
  [(NSMutableSet *)self->super._outstandingTasks addObject:v8];
  [(CoreDAVTask *)v8 setDelegate:self];
  id v9 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  [(CoreDAVTask *)v8 setAccountInfoProvider:v9];

  [(CoreDAVTask *)v8 setTimeoutInterval:self->super._timeoutInterval];
  id v10 = objc_loadWeakRetained((id *)&self->super._taskManager);
  [v10 submitQueuedCoreDAVTask:v8];
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableSet *)self->super._outstandingTasks containsObject:v6])
  {
    [(NSMutableSet *)self->super._outstandingTasks removeObject:v6];
    id v36 = v6;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v37 = v6;
    v8 = [v37 multiStatus];
    id v9 = [v8 responses];

    id obj = v9;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v49 count:16];
    v35 = v7;
    if (v10)
    {
      uint64_t v11 = v10;
      v38 = 0;
      uint64_t v12 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "firstHref", v35);
          objc_super v16 = [v15 payloadAsFullURL];

          if (v16)
          {
            v17 = [v14 successfulPropertiesToValues];
            v18 = objc_msgSend(objc_alloc(-[CoreDAVContainerInfoSyncTaskGroup containerItemClass](self, "containerItemClass")), "initWithURL:andProperties:", v16, v17);
            if ([v18 isUnauthenticated])
            {
              v19 = +[CoreDAVLogging sharedLogging];
              id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
              v21 = [v19 logHandleForAccountInfoProvider:WeakRetained];

              if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_213BFC000, v21, OS_LOG_TYPE_DEFAULT, "Not authenticated to get Collection", buf, 2u);
              }
            }
            else
            {
              v23 = [v37 notFoundHREFs];
              char v24 = [v23 containsObject:v16];

              if ((v24 & 1) == 0)
              {
                id v25 = v38;
                if (!v38) {
                  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
                }
                v38 = v25;
                [v25 addObject:v18];
              }
            }
          }
          else
          {
            v17 = +[CoreDAVLogging sharedLogging];
            id v22 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            v18 = [v17 logHandleForAccountInfoProvider:v22];

            if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v48 = v14;
              _os_log_impl(&dword_213BFC000, v18, OS_LOG_TYPE_DEFAULT, "Could not find the first HREF's URL. Response is %@", buf, 0xCu);
            }
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v11);
    }
    else
    {
      v38 = 0;
    }

    v26 = [(CoreDAVContainerInfoSyncTaskGroup *)self delegate];
    v27 = [v37 notFoundHREFs];
    v28 = [v27 allObjects];
    [v26 containerInfoSyncTask:self retrievedAddedOrModifiedContainers:v38 removedContainerURLs:v28];

    if ([v37 moreToSync])
    {
      v29 = [v37 nextSyncToken];

      v30 = +[CoreDAVLogging sharedLogging];
      id v31 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      v32 = [v30 logHandleForAccountInfoProvider:v31];

      if (v29)
      {
        if (v32 && os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213BFC000, v32, OS_LOG_TYPE_INFO, "Server told us there was more container info data to fetch, so syncing again", buf, 2u);
        }

        v33 = [v37 nextSyncToken];
        previousSyncToken = self->_previousSyncToken;
        self->_previousSyncToken = v33;
      }
      else
      {
        if (v32 && os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213BFC000, v32, OS_LOG_TYPE_DEFAULT, "Was told to sync more items, but got no new sync token.  Starting from scratch", buf, 2u);
        }

        previousSyncToken = self->_previousSyncToken;
        self->_previousSyncToken = 0;
      }

      [(CoreDAVContainerInfoSyncTaskGroup *)self startTaskGroup];
      id v7 = v35;
      id v6 = v36;
    }
    else
    {
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __61__CoreDAVContainerInfoSyncTaskGroup_task_didFinishWithError___block_invoke;
      v40[3] = &unk_2641DFCB0;
      v40[4] = self;
      id v41 = v37;
      id v7 = v35;
      id v42 = v35;
      [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:v40];

      id v6 = v36;
    }
  }
}

void __61__CoreDAVContainerInfoSyncTaskGroup_task_didFinishWithError___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) nextSyncToken];
  [v4 containerInfoSyncTask:v2 completedWithNewSyncToken:v3 error:*(void *)(a1 + 48)];
}

- (Class)containerItemClass
{
  return (Class)objc_opt_class();
}

- (id)copyContainerParserMappings
{
  return +[CoreDAVContainer copyPropertyMappingsForParser];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_previousSyncToken, 0);
}

@end