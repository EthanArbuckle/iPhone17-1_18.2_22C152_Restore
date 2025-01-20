@interface CalDAVGetGrantedDelegatesTaskGroup
- (BOOL)fetchPrincipalDetails;
- (CalDAVGetGrantedDelegatesTaskGroup)initWithAccountInfoProvider:(id)a3 principalURL:(id)a4 taskManager:(id)a5;
- (id)_urlAppendingSegmentWithAllowWrite:(BOOL)a3;
- (int)state;
- (void)_expandPropertiesWithAllowWrite:(BOOL)a3;
- (void)_fetchOnlyHrefs;
- (void)_finishWithError:(id)a3 state:(int)a4;
- (void)_getChildProperties;
- (void)setFetchPrincipalDetails:(BOOL)a3;
- (void)setState:(int)a3;
- (void)startTaskGroup;
- (void)task:(id)a3 didFinishWithError:(id)a4;
- (void)taskGroup:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CalDAVGetGrantedDelegatesTaskGroup

- (CalDAVGetGrantedDelegatesTaskGroup)initWithAccountInfoProvider:(id)a3 principalURL:(id)a4 taskManager:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CalDAVGetGrantedDelegatesTaskGroup;
  v5 = [(CalDAVGetDelegatesBaseTaskGroup *)&v8 initWithAccountInfoProvider:a3 principalURL:a4 taskManager:a5];
  v6 = v5;
  if (v5)
  {
    [(CalDAVGetGrantedDelegatesTaskGroup *)v5 setState:0];
    [(CalDAVGetGrantedDelegatesTaskGroup *)v6 setFetchPrincipalDetails:1];
  }
  return v6;
}

- (void)_finishWithError:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(CalDAVGetGrantedDelegatesTaskGroup *)self setState:v4];
  if (v4 == 9)
  {
    v7 = [MEMORY[0x263F34B30] sharedLogging];
    objc_super v8 = [v7 logHandleForAccountInfoProvider:0];
    v9 = v8;
    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_213CEC000, v9, OS_LOG_TYPE_ERROR, "Finishing %{public}@ early because state machine reached an unexpected state.", (uint8_t *)&v12, 0xCu);
    }
  }
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v6 delegateCallbackBlock:0];
}

- (void)_fetchOnlyHrefs
{
  [(CalDAVGetGrantedDelegatesTaskGroup *)self setState:3];
  id v3 = objc_alloc(MEMORY[0x263F34B00]);
  id v11 = (id)[v3 initWithNameSpace:*MEMORY[0x263F34E10] name:*MEMORY[0x263F34E40] parseClass:objc_opt_class()];
  id v4 = objc_alloc(MEMORY[0x263F34B80]);
  v5 = [MEMORY[0x263EFFA08] setWithObject:v11];
  id v6 = [(CalDAVGetDelegatesBaseTaskGroup *)self principalURL];
  v7 = (void *)[v4 initWithPropertiesToFind:v5 atURL:v6 withDepth:3];

  objc_super v8 = [(CoreDAVTaskGroup *)self outstandingTasks];
  [v8 addObject:v7];

  v9 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v7 setAccountInfoProvider:v9];

  [v7 setDelegate:self];
  v10 = [(CoreDAVTaskGroup *)self taskManager];
  [v10 submitQueuedCoreDAVTask:v7];
}

- (id)_urlAppendingSegmentWithAllowWrite:(BOOL)a3
{
  id v4 = cdWriteProxyChildSegment;
  if (!a3) {
    id v4 = cdReadProxyChildSegment;
  }
  v5 = *v4;
  id v6 = [(CalDAVGetDelegatesBaseTaskGroup *)self principalURL];
  v7 = [v6 CDVfixedURLByAppendingPathComponent:v5];

  return v7;
}

- (void)_expandPropertiesWithAllowWrite:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  [(CalDAVGetGrantedDelegatesTaskGroup *)self setState:v5];
  id v12 = [(CalDAVGetGrantedDelegatesTaskGroup *)self _urlAppendingSegmentWithAllowWrite:v3];
  id v6 = [(CalDAVGetDelegatesBaseTaskGroup *)self _mappingsForPrincipalDetails];
  id v7 = objc_alloc(MEMORY[0x263F34AD8]);
  objc_super v8 = (void *)[v7 initWithPropertiesToFind:v6 atURL:v12 expandedName:*MEMORY[0x263F34E40] expandedNameSpace:*MEMORY[0x263F34E10]];
  v9 = [(CoreDAVTaskGroup *)self outstandingTasks];
  [v9 addObject:v8];

  v10 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v8 setAccountInfoProvider:v10];

  [v8 setDelegate:self];
  id v11 = [(CoreDAVTaskGroup *)self taskManager];
  [v11 submitQueuedCoreDAVTask:v8];
}

- (void)_getChildProperties
{
  BOOL v3 = [(CalDAVGetDelegatesBaseTaskGroup *)self readPrincipalURLs];
  id v7 = [(CalDAVGetDelegatesBaseTaskGroup *)self _popFromArray:v3];

  if (v7)
  {
    id v4 = self;
    uint64_t v5 = 4;
LABEL_5:
    [(CalDAVGetGrantedDelegatesTaskGroup *)v4 setState:v5];
    [(CalDAVGetDelegatesBaseTaskGroup *)self _getPrincipalDetailsForURL:v7];

    return;
  }
  id v6 = [(CalDAVGetDelegatesBaseTaskGroup *)self writePrincipalURLs];
  id v7 = [(CalDAVGetDelegatesBaseTaskGroup *)self _popFromArray:v6];

  if (v7)
  {
    id v4 = self;
    uint64_t v5 = 5;
    goto LABEL_5;
  }
  [(CalDAVGetGrantedDelegatesTaskGroup *)self _finishWithError:0 state:10];
}

- (void)startTaskGroup
{
  if ([(CalDAVGetGrantedDelegatesTaskGroup *)self fetchPrincipalDetails]
    && [(CalDAVGetDelegatesBaseTaskGroup *)self serverSupportsExpandPropertyReport])
  {
    [(CalDAVGetGrantedDelegatesTaskGroup *)self setState:1];
    [(CalDAVGetGrantedDelegatesTaskGroup *)self _expandPropertiesWithAllowWrite:1];
  }
  else
  {
    [(CalDAVGetGrantedDelegatesTaskGroup *)self _fetchOnlyHrefs];
  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CalDAVGetGrantedDelegatesTaskGroup *)self state];
  if (v8 == 1 || [(CalDAVGetGrantedDelegatesTaskGroup *)self state] == 2)
  {
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v6 getTotalFailureError];
      if (!v9)
      {
        id v9 = [v6 successfulValueForNameSpace:*MEMORY[0x263F34E10] elementName:*MEMORY[0x263F34E40]];
        [(CalDAVGetDelegatesBaseTaskGroup *)self _processDetailsFromMultiStatus:v9 allowWrite:v8 == 1];
        v10 = self;
        if (v8 == 1)
        {
          [(CalDAVGetGrantedDelegatesTaskGroup *)self setState:2];
          [(CalDAVGetGrantedDelegatesTaskGroup *)self _expandPropertiesWithAllowWrite:0];
          goto LABEL_8;
        }
        id v11 = 0;
        uint64_t v12 = 10;
LABEL_7:
        [(CalDAVGetGrantedDelegatesTaskGroup *)v10 _finishWithError:v11 state:v12];
LABEL_8:

        goto LABEL_14;
      }
    }
    v10 = self;
    id v11 = v9;
    uint64_t v12 = 6;
    goto LABEL_7;
  }
  if ([(CalDAVGetGrantedDelegatesTaskGroup *)self state] != 3)
  {
    v13 = self;
    id v14 = v7;
    uint64_t v15 = 9;
    goto LABEL_13;
  }
  if (v7)
  {
    v13 = self;
    id v14 = v7;
    uint64_t v15 = 7;
LABEL_13:
    [(CalDAVGetGrantedDelegatesTaskGroup *)v13 _finishWithError:v14 state:v15];
    goto LABEL_14;
  }
  id v39 = v6;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v17 = [v6 multiStatus];
  v18 = [v17 responses];

  id obj = v18;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v54;
    uint64_t v41 = *MEMORY[0x263F34E10];
    uint64_t v40 = *MEMORY[0x263F34E40];
    uint64_t v42 = *(void *)v54;
    do
    {
      uint64_t v22 = 0;
      uint64_t v43 = v20;
      do
      {
        if (*(void *)v54 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v53 + 1) + 8 * v22);
        if (([v23 hasPropertyError] & 1) == 0)
        {
          v24 = [v23 firstHref];
          v25 = [v24 payloadAsFullURL];
          v26 = [v25 CDVRawPath];

          int v27 = [v26 hasSuffix:@"calendar-proxy-read/"];
          if ((v27 & 1) != 0 || [v26 hasSuffix:@"calendar-proxy-write/"])
          {
            v28 = [v23 successfulPropertiesToValues];
            v29 = [v28 CDVObjectForKeyWithNameSpace:v41 andName:v40];
            v47 = v26;
            uint64_t v48 = v22;
            v46 = v28;
            if (v27)
            {
              v30 = [(CalDAVGetDelegatesBaseTaskGroup *)self readPrincipalURLs];
              [(CalDAVGetDelegatesBaseTaskGroup *)self readDetails];
            }
            else
            {
              v30 = [(CalDAVGetDelegatesBaseTaskGroup *)self writePrincipalURLs];
              [(CalDAVGetDelegatesBaseTaskGroup *)self writeDetails];
            v31 = };
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            v45 = v29;
            v32 = [v29 hrefs];
            uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v57 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v50;
              do
              {
                for (uint64_t i = 0; i != v34; ++i)
                {
                  if (*(void *)v50 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  v37 = [*(id *)(*((void *)&v49 + 1) + 8 * i) payloadAsFullURL];
                  if ([(CalDAVGetGrantedDelegatesTaskGroup *)self fetchPrincipalDetails])
                  {
                    [v30 addObject:v37];
                  }
                  else
                  {
                    v38 = objc_alloc_init(CalDAVPrincipalEmailDetailsResult);
                    [(CalDAVPrincipalEmailDetailsResult *)v38 setPrincipalURL:v37];
                    [v31 addObject:v38];
                  }
                }
                uint64_t v34 = [v32 countByEnumeratingWithState:&v49 objects:v57 count:16];
              }
              while (v34);
            }

            uint64_t v21 = v42;
            uint64_t v20 = v43;
            v26 = v47;
            uint64_t v22 = v48;
          }
        }
        ++v22;
      }
      while (v22 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v20);
  }

  [(CalDAVGetGrantedDelegatesTaskGroup *)self _getChildProperties];
  id v7 = 0;
  id v6 = v39;
LABEL_14:
  v16 = [(CoreDAVTaskGroup *)self outstandingTasks];
  [v16 removeObject:v6];
}

- (void)taskGroup:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CalDAVGetGrantedDelegatesTaskGroup *)self state];
  if (v8 == 5 || [(CalDAVGetGrantedDelegatesTaskGroup *)self state] == 4)
  {
    id v9 = v6;
    v10 = v9;
    if (v7)
    {
      id v11 = [MEMORY[0x263F34B30] sharedLogging];
      uint64_t v12 = [v11 logHandleForAccountInfoProvider:0];
      v13 = v12;
      if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 138412290;
        id v16 = v7;
        _os_log_impl(&dword_213CEC000, v13, OS_LOG_TYPE_DEBUG, "Ignoring error fetching delegate details, error: [%@]", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      id v14 = [v9 principalResult];

      if (!v14)
      {
LABEL_14:
        [(CalDAVGetGrantedDelegatesTaskGroup *)self _getChildProperties];

        goto LABEL_15;
      }
      if (v8 == 5) {
        [(CalDAVGetDelegatesBaseTaskGroup *)self writeDetails];
      }
      else {
      id v11 = [(CalDAVGetDelegatesBaseTaskGroup *)self readDetails];
      }
      v13 = [v10 principalResult];
      [v11 addObject:v13];
    }

    goto LABEL_14;
  }
  [(CalDAVGetGrantedDelegatesTaskGroup *)self _finishWithError:v7 state:9];
LABEL_15:
}

- (BOOL)fetchPrincipalDetails
{
  return self->_fetchPrincipalDetails;
}

- (void)setFetchPrincipalDetails:(BOOL)a3
{
  self->_fetchPrincipalDetails = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

@end