@interface CoreDAVContainerInfoTaskGroup
- (CoreDAVContainerInfoTaskGroup)initWithAccountInfoProvider:(id)a3 containerURLs:(id)a4 taskManager:(id)a5;
- (NSSet)containerURLs;
- (NSString)description;
- (id)_copyContainerParserMappings;
- (id)_copyContainerWithURL:(id)a3 andProperties:(id)a4;
- (int)containerInfoDepth;
- (void)_getContainerHomeSet;
- (void)_getContainerTopLevelInfo;
- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5;
- (void)setContainerInfoDepth:(int)a3;
- (void)startTaskGroup;
- (void)taskGroupWillCancelWithError:(id)a3;
@end

@implementation CoreDAVContainerInfoTaskGroup

- (CoreDAVContainerInfoTaskGroup)initWithAccountInfoProvider:(id)a3 containerURLs:(id)a4 taskManager:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CoreDAVContainerInfoTaskGroup;
  v9 = [(CoreDAVTaskGroup *)&v13 initWithAccountInfoProvider:a3 taskManager:a5];
  if (v9)
  {
    uint64_t v10 = [v8 mutableCopy];
    containerURLs = v9->_containerURLs;
    v9->_containerURLs = (NSMutableSet *)v10;

    [(CoreDAVContainerInfoTaskGroup *)v9 setContainerInfoDepth:3];
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@ %p: Phase %d URLs %@", v5, self, self->_phase, self->_containerURLs];

  return (NSString *)v6;
}

- (void)startTaskGroup
{
  containerURLs = self->_containerURLs;
  if (containerURLs && [(NSMutableSet *)containerURLs count])
  {
    [(CoreDAVContainerInfoTaskGroup *)self _getContainerTopLevelInfo];
  }
  else
  {
    [(CoreDAVContainerInfoTaskGroup *)self _getContainerHomeSet];
  }
}

- (void)taskGroupWillCancelWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
  }
  v5 = self;
  v6 = [(CoreDAVTaskGroup *)v5 delegate];
  [v6 containerInfoTask:v5 completedWithContainers:0 error:v4];
  v7.receiver = v5;
  v7.super_class = (Class)CoreDAVContainerInfoTaskGroup;
  [(CoreDAVTaskGroup *)&v7 taskGroupWillCancelWithError:v4];
}

- (void)_getContainerHomeSet
{
  self->_phase = 0;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v9 CDVAddItemParserMappingWithNameSpace:self->_appSpecificHomeSetPropNameSpace name:self->_appSpecificHomeSetPropName parseClass:objc_opt_class()];
  v3 = [CoreDAVPropFindTask alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  v5 = [WeakRetained principalURL];
  v6 = [(CoreDAVPropFindTask *)v3 initWithPropertiesToFind:v9 atURL:v5 withDepth:2];

  [(NSMutableSet *)self->super._outstandingTasks addObject:v6];
  [(CoreDAVTask *)v6 setDelegate:self];
  id v7 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  [(CoreDAVTask *)v6 setAccountInfoProvider:v7];

  [(CoreDAVTask *)v6 setTimeoutInterval:self->super._timeoutInterval];
  id v8 = objc_loadWeakRetained((id *)&self->super._taskManager);
  [v8 submitQueuedCoreDAVTask:v6];
}

- (void)_getContainerTopLevelInfo
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  self->_phase = 1;
  id v3 = [(CoreDAVContainerInfoTaskGroup *)self _copyContainerParserMappings];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  obj = self->_containerURLs;
  uint64_t v4 = [(NSMutableSet *)obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = [[CoreDAVPropFindTask alloc] initWithPropertiesToFind:v3 atURL:*(void *)(*((void *)&v12 + 1) + 8 * v7) withDepth:[(CoreDAVContainerInfoTaskGroup *)self containerInfoDepthForURL:*(void *)(*((void *)&v12 + 1) + 8 * v7)]];
        [(NSMutableSet *)self->super._outstandingTasks addObject:v8];
        [(CoreDAVTask *)v8 setDelegate:self];
        id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        [(CoreDAVTask *)v8 setAccountInfoProvider:WeakRetained];

        [(CoreDAVTask *)v8 setTimeoutInterval:self->super._timeoutInterval];
        id v10 = objc_loadWeakRetained((id *)&self->super._taskManager);
        [v10 submitQueuedCoreDAVTask:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(NSMutableSet *)self->super._outstandingTasks containsObject:v8]) {
    goto LABEL_82;
  }
  [(NSMutableSet *)self->super._outstandingTasks removeObject:v8];
  if (v10)
  {
    [(CoreDAVTaskGroup *)self bailWithError:v10];
    goto LABEL_82;
  }
  int phase = self->_phase;
  if (phase == 1)
  {
    id v84 = v8;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v58 = v9;
    uint64_t v59 = [v58 countByEnumeratingWithState:&v92 objects:v104 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      id v78 = v9;
      char v88 = 0;
      uint64_t v61 = *(void *)v93;
      do
      {
        uint64_t v62 = 0;
        uint64_t v90 = v60;
        do
        {
          if (*(void *)v93 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = *(void **)(*((void *)&v92 + 1) + 8 * v62);
          v64 = [v63 firstHref];
          v65 = [v64 payloadAsFullURL];

          if (v65)
          {
            v66 = [v63 successfulPropertiesToValues];
            v67 = [(CoreDAVContainerInfoTaskGroup *)self _copyContainerWithURL:v65 andProperties:v66];
            if ([v67 isUnauthenticated])
            {
              uint64_t v68 = v61;
              id v69 = v58;
              v70 = +[CoreDAVLogging sharedLogging];
              id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
              v72 = [v70 logHandleForAccountInfoProvider:WeakRetained];

              if (v72 && os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_213BFC000, v72, OS_LOG_TYPE_DEFAULT, "Not authenticated to get Collection", buf, 2u);
              }

              id v58 = v69;
              uint64_t v61 = v68;
              uint64_t v60 = v90;
            }
            else
            {
              containers = self->_containers;
              if (!containers)
              {
                v75 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
                v76 = self->_containers;
                self->_containers = v75;

                containers = self->_containers;
              }
              [(NSMutableSet *)containers addObject:v67];
              char v88 = 1;
            }
          }
          else
          {
            v66 = +[CoreDAVLogging sharedLogging];
            id v73 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            v67 = [v66 logHandleForAccountInfoProvider:v73];

            if (v67 && os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v107 = v63;
              _os_log_impl(&dword_213BFC000, v67, OS_LOG_TYPE_DEFAULT, "Could not find the first HREF's URL. Response is %@", buf, 0xCu);
            }
          }

          ++v62;
        }
        while (v60 != v62);
        uint64_t v60 = [v58 countByEnumeratingWithState:&v92 objects:v104 count:16];
      }
      while (v60);

      id v9 = v78;
      if (v88)
      {
        id v8 = v84;
        id v10 = 0;
        if (![(NSMutableSet *)self->super._outstandingTasks count])
        {
          v91[0] = MEMORY[0x263EF8330];
          v91[1] = 3221225472;
          v91[2] = __68__CoreDAVContainerInfoTaskGroup_propFindTask_parsedResponses_error___block_invoke;
          v91[3] = &unk_2641DFC10;
          v91[4] = self;
          [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:v91];
        }
        goto LABEL_82;
      }
    }
    else
    {
    }
    [(CoreDAVTaskGroup *)self bailWithError:0];
    id v8 = v84;
    goto LABEL_81;
  }
  id v10 = 0;
  if (phase) {
    goto LABEL_82;
  }
  long long v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  containerURLs = self->_containerURLs;
  self->_containerURLs = v12;

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v100 objects:v110 count:16];
  if (!v15)
  {

    goto LABEL_78;
  }
  uint64_t v16 = v15;
  id v77 = v9;
  v83 = v8;
  char v82 = 0;
  uint64_t v89 = *(void *)v101;
  id v85 = v14;
  do
  {
    uint64_t v17 = 0;
    uint64_t v86 = v16;
    do
    {
      if (*(void *)v101 != v89) {
        objc_enumerationMutation(v14);
      }
      v18 = [*(id *)(*((void *)&v100 + 1) + 8 * v17) successfulPropertiesToValues];
      v19 = [v18 CDVObjectForKeyWithNameSpace:self->_appSpecificHomeSetPropNameSpace andName:self->_appSpecificHomeSetPropName];
      v20 = v19;
      if (!v19)
      {
        v22 = +[CoreDAVLogging sharedLogging];
        id v28 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        v24 = [v22 logHandleForAccountInfoProvider:v28];

        if (v24 && os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v107 = v18;
          v25 = v24;
          v26 = "Got malformed xml from server. Found Values are %@";
          uint32_t v27 = 12;
LABEL_19:
          _os_log_impl(&dword_213BFC000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
        }
LABEL_20:

        goto LABEL_51;
      }
      v21 = [v19 unauthenticated];

      if (v21)
      {
        v22 = +[CoreDAVLogging sharedLogging];
        id v23 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        v24 = [v22 logHandleForAccountInfoProvider:v23];

        if (v24 && os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v25 = v24;
          v26 = "Not authenticated to get Container set";
          uint32_t v27 = 2;
          goto LABEL_19;
        }
        goto LABEL_20;
      }
      v29 = [v20 hrefs];
      uint64_t v30 = [v29 count];

      if (!v30)
      {
        v39 = +[CoreDAVLogging sharedLogging];
        id v40 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        v35 = [v39 logHandleForAccountInfoProvider:v40];

        if (v35 && os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v107 = v20;
          _os_log_impl(&dword_213BFC000, v35, OS_LOG_TYPE_DEFAULT, "Got malformed xml from server. Container set %@", buf, 0xCu);
        }
        goto LABEL_42;
      }
      v31 = [v20 hrefs];
      v32 = [v31 anyObject];
      v33 = [v32 payloadAsFullURL];

      v34 = [v83 url];
      v35 = [v34 CDVServerURL];

      v87 = v33;
      v36 = [v33 CDVServerURL];
      if (([v35 isEqual:v36] & 1) == 0)
      {
        v37 = [v36 scheme];
        v38 = [v35 scheme];
        if ([v37 isEqualToString:v38])
        {

LABEL_29:
          v42 = [v36 host];
          v43 = [v35 host];
          char v44 = [v42 isEqualToString:v43];

          if (v44) {
            goto LABEL_41;
          }
          v45 = +[CoreDAVLogging sharedLogging];
          id v46 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          v47 = [v45 logHandleForAccountInfoProvider:v46];

          if (v47)
          {
            v48 = v47;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              v81 = [v35 host];
              v79 = [v36 host];
              *(_DWORD *)buf = 138412546;
              v107 = v81;
              __int16 v108 = 2112;
              v109 = v79;
              _os_log_impl(&dword_213BFC000, v48, OS_LOG_TYPE_DEFAULT, "HomeSet is in another castle.  Was %@, is now %@", buf, 0x16u);
            }
          }

          v49 = [v83 accountInfoProvider];
          char v50 = objc_opt_respondsToSelector();

          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          v51 = [v83 accountInfoProvider];
          [v51 noteHomeSetOnDifferentHost:v36];
        }
        else
        {
          v41 = [v36 scheme];
          int v80 = [v41 isEqualToString:@"https"];

          if (v80) {
            goto LABEL_29;
          }
          v51 = +[CoreDAVLogging sharedLogging];
          id v52 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          v53 = [v51 logHandleForAccountInfoProvider:v52];

          if (v53 && os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v107 = v36;
            _os_log_impl(&dword_213BFC000, v53, OS_LOG_TYPE_DEFAULT, "Ignoring host change to: %@ because it sends it to an insecure URL.", buf, 0xCu);
          }
        }
      }
LABEL_41:

      v39 = v87;
LABEL_42:

      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      v22 = [v20 hrefsAsFullURLs];
      uint64_t v54 = [v22 countByEnumeratingWithState:&v96 objects:v105 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v97;
        do
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v97 != v56) {
              objc_enumerationMutation(v22);
            }
            [(NSMutableSet *)self->_containerURLs addObject:*(void *)(*((void *)&v96 + 1) + 8 * i)];
          }
          uint64_t v55 = [v22 countByEnumeratingWithState:&v96 objects:v105 count:16];
        }
        while (v55);
        char v82 = 1;
      }
      id v14 = v85;
      uint64_t v16 = v86;
LABEL_51:

      ++v17;
    }
    while (v17 != v16);
    uint64_t v16 = [v14 countByEnumeratingWithState:&v100 objects:v110 count:16];
  }
  while (v16);

  id v8 = v83;
  id v9 = v77;
  if (v82)
  {
    [(CoreDAVContainerInfoTaskGroup *)self _getContainerTopLevelInfo];
    goto LABEL_81;
  }
LABEL_78:
  [(CoreDAVTaskGroup *)self bailWithError:0];
LABEL_81:
  id v10 = 0;
LABEL_82:
}

void __68__CoreDAVContainerInfoTaskGroup_propFindTask_parsedResponses_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 containerInfoTask:*(void *)(a1 + 32) completedWithContainers:*(void *)(*(void *)(a1 + 32) + 104) error:0];
}

- (id)_copyContainerWithURL:(id)a3 andProperties:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[CoreDAVContainer alloc] initWithURL:v6 andProperties:v5];

  return v7;
}

- (id)_copyContainerParserMappings
{
  return +[CoreDAVContainer copyPropertyMappingsForParser];
}

- (int)containerInfoDepth
{
  return self->_containerInfoDepth;
}

- (void)setContainerInfoDepth:(int)a3
{
  self->_containerInfoDepth = a3;
}

- (NSSet)containerURLs
{
  return &self->_containerURLs->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSpecificHomeSetPropName, 0);
  objc_storeStrong((id *)&self->_appSpecificHomeSetPropNameSpace, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_containerURLs, 0);
}

@end