@interface CalDAVGetDelegatesTaskGroup
- (CalDAVGetDelegatesTaskGroup)initWithAccountInfoProvider:(id)a3 principalURL:(id)a4 taskManager:(id)a5;
- (NSMutableArray)nestedGroupPrincipalURLs;
- (int)state;
- (void)_expandProperties;
- (void)_finishWithError:(id)a3 state:(int)a4;
- (void)_getChildProperties;
- (void)_getGroupMembershipForURL:(id)a3 state:(int)a4;
- (void)setNestedGroupPrincipalURLs:(id)a3;
- (void)setState:(int)a3;
- (void)startTaskGroup;
- (void)task:(id)a3 didFinishWithError:(id)a4;
- (void)taskGroup:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CalDAVGetDelegatesTaskGroup

- (CalDAVGetDelegatesTaskGroup)initWithAccountInfoProvider:(id)a3 principalURL:(id)a4 taskManager:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CalDAVGetDelegatesTaskGroup;
  v5 = [(CalDAVGetDelegatesBaseTaskGroup *)&v9 initWithAccountInfoProvider:a3 principalURL:a4 taskManager:a5];
  v6 = v5;
  if (v5)
  {
    [(CalDAVGetDelegatesTaskGroup *)v5 setState:0];
    v7 = [MEMORY[0x263EFF980] array];
    [(CalDAVGetDelegatesTaskGroup *)v6 setNestedGroupPrincipalURLs:v7];
  }
  return v6;
}

- (void)_finishWithError:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(CalDAVGetDelegatesTaskGroup *)self setState:v4];
  if (v4 == 10)
  {
    v7 = [MEMORY[0x263F34B30] sharedLogging];
    v8 = [v7 logHandleForAccountInfoProvider:0];
    objc_super v9 = v8;
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

- (void)_expandProperties
{
  [(CalDAVGetDelegatesTaskGroup *)self setState:1];
  id v10 = [(CalDAVGetDelegatesBaseTaskGroup *)self _mappingsForPrincipalDetails];
  id v3 = objc_alloc(MEMORY[0x263F34AD8]);
  uint64_t v4 = [(CalDAVGetDelegatesBaseTaskGroup *)self principalURL];
  uint64_t v5 = *MEMORY[0x263F34DA8];
  id v6 = (void *)[v3 initWithPropertiesToFind:v10 atURL:v4 expandedName:@"calendar-proxy-read-for" expandedNameSpace:*MEMORY[0x263F34DA8]];

  [v6 addPropertyToExpandWithPropertiesToFind:v10 expandedName:@"calendar-proxy-write-for" expandedNameSpace:v5];
  v7 = [(CoreDAVTaskGroup *)self outstandingTasks];
  [v7 addObject:v6];

  v8 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v6 setAccountInfoProvider:v8];

  [v6 setDelegate:self];
  objc_super v9 = [(CoreDAVTaskGroup *)self taskManager];
  [v9 submitQueuedCoreDAVTask:v6];
}

- (void)_getGroupMembershipForURL:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [(CalDAVGetDelegatesTaskGroup *)self setState:v4];
  id v7 = objc_alloc(MEMORY[0x263F34B00]);
  id v14 = (id)[v7 initWithNameSpace:*MEMORY[0x263F34E10] name:*MEMORY[0x263F34E48] parseClass:objc_opt_class()];
  id v8 = objc_alloc(MEMORY[0x263F34B80]);
  objc_super v9 = [MEMORY[0x263EFFA08] setWithObject:v14];
  id v10 = (void *)[v8 initWithPropertiesToFind:v9 atURL:v6 withDepth:2];

  v11 = [(CoreDAVTaskGroup *)self outstandingTasks];
  [v11 addObject:v10];

  int v12 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v10 setAccountInfoProvider:v12];

  [v10 setDelegate:self];
  v13 = [(CoreDAVTaskGroup *)self taskManager];
  [v13 submitQueuedCoreDAVTask:v10];
}

- (void)_getChildProperties
{
  id v3 = [(CalDAVGetDelegatesTaskGroup *)self nestedGroupPrincipalURLs];
  id v8 = [(CalDAVGetDelegatesBaseTaskGroup *)self _popFromArray:v3];

  if (v8)
  {
    [(CalDAVGetDelegatesTaskGroup *)self _getGroupMembershipForURL:v8 state:3];
LABEL_8:

    return;
  }
  uint64_t v4 = [(CalDAVGetDelegatesBaseTaskGroup *)self readPrincipalURLs];
  id v8 = [(CalDAVGetDelegatesBaseTaskGroup *)self _popFromArray:v4];

  if (v8)
  {
    uint64_t v5 = self;
    uint64_t v6 = 4;
LABEL_7:
    [(CalDAVGetDelegatesTaskGroup *)v5 setState:v6];
    [(CalDAVGetDelegatesBaseTaskGroup *)self _getPrincipalDetailsForURL:v8];
    goto LABEL_8;
  }
  id v7 = [(CalDAVGetDelegatesBaseTaskGroup *)self writePrincipalURLs];
  id v8 = [(CalDAVGetDelegatesBaseTaskGroup *)self _popFromArray:v7];

  if (v8)
  {
    uint64_t v5 = self;
    uint64_t v6 = 5;
    goto LABEL_7;
  }
  [(CalDAVGetDelegatesTaskGroup *)self _finishWithError:0 state:11];
}

- (void)startTaskGroup
{
  if ([(CalDAVGetDelegatesBaseTaskGroup *)self serverSupportsExpandPropertyReport])
  {
    [(CalDAVGetDelegatesTaskGroup *)self _expandProperties];
  }
  else
  {
    id v3 = [(CalDAVGetDelegatesBaseTaskGroup *)self principalURL];
    [(CalDAVGetDelegatesTaskGroup *)self _getGroupMembershipForURL:v3 state:2];
  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_super v9 = v8;
  if (v7)
  {
    id v10 = v7;
  }
  else
  {
    id v10 = [v8 getTotalFailureError];
  }
  v11 = v10;
  if ([(CalDAVGetDelegatesTaskGroup *)self state] != 1)
  {
    if ([(CalDAVGetDelegatesTaskGroup *)self state] == 2)
    {
      if (v11)
      {
        int v12 = self;
        v13 = v11;
        uint64_t v14 = 7;
        goto LABEL_18;
      }
      id v47 = v7;
      v46 = v9;
      [v9 successfulValueForNameSpace:*MEMORY[0x263F34E10] elementName:*MEMORY[0x263F34E48]];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v45 = long long v57 = 0u;
      v22 = [v45 hrefs];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v54 objects:v61 count:16];
      if (!v23) {
        goto LABEL_37;
      }
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v55;
LABEL_22:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v54 + 1) + 8 * v26);
        v28 = [v27 payloadAsFullURL];
        v29 = v28;
        if (!v28)
        {
          v30 = [MEMORY[0x263F34B30] sharedLogging];
          v32 = [v30 logHandleForAccountInfoProvider:0];
          v33 = v32;
          if (v32 && os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v27;
            _os_log_impl(&dword_213CEC000, v33, OS_LOG_TYPE_ERROR, "Got a nil URL for delegate group membership with href = %@", buf, 0xCu);
          }
          goto LABEL_35;
        }
        v30 = [v28 CDVRawPath];
        if ([v30 hasSuffix:@"calendar-proxy-read/"])
        {
          uint64_t v31 = [(CalDAVGetDelegatesBaseTaskGroup *)self readPrincipalURLs];
        }
        else
        {
          if (![v30 hasSuffix:@"calendar-proxy-write/"])
          {
            v33 = [(CalDAVGetDelegatesTaskGroup *)self nestedGroupPrincipalURLs];
            [v33 addObject:v29];
            goto LABEL_35;
          }
          uint64_t v31 = [(CalDAVGetDelegatesBaseTaskGroup *)self writePrincipalURLs];
        }
        v33 = v31;
        v34 = [v29 CDVURLByDeletingLastPathComponent];
        [v33 addObject:v34];

LABEL_35:
        if (v24 == ++v26)
        {
          uint64_t v24 = [v22 countByEnumeratingWithState:&v54 objects:v61 count:16];
          if (!v24)
          {
LABEL_37:

            [(CalDAVGetDelegatesTaskGroup *)self _getChildProperties];
            v35 = v45;
            goto LABEL_51;
          }
          goto LABEL_22;
        }
      }
    }
    if ([(CalDAVGetDelegatesTaskGroup *)self state] != 3)
    {
      int v12 = self;
      v13 = v11;
      uint64_t v14 = 10;
      goto LABEL_18;
    }
    if (v11)
    {
      v15 = [MEMORY[0x263F34B30] sharedLogging];
      v16 = [v15 logHandleForAccountInfoProvider:0];
      v17 = v16;
      if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v11;
        _os_log_impl(&dword_213CEC000, v17, OS_LOG_TYPE_DEBUG, "Ignoring error fetching nested group, error: [%@]", buf, 0xCu);
      }

      [(CalDAVGetDelegatesTaskGroup *)self _getChildProperties];
      goto LABEL_19;
    }
    id v47 = v7;
    v46 = v9;
    [v9 successfulValueForNameSpace:*MEMORY[0x263F34E10] elementName:*MEMORY[0x263F34E48]];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v48 = long long v53 = 0u;
    id obj = [v48 hrefs];
    uint64_t v36 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (!v36)
    {
LABEL_50:

      [(CalDAVGetDelegatesTaskGroup *)self _getChildProperties];
      v35 = v48;
LABEL_51:

      objc_super v9 = v46;
      id v7 = v47;
      v11 = 0;
      goto LABEL_19;
    }
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v51;
LABEL_40:
    uint64_t v39 = 0;
    while (1)
    {
      if (*(void *)v51 != v38) {
        objc_enumerationMutation(obj);
      }
      v40 = [*(id *)(*((void *)&v50 + 1) + 8 * v39) payloadAsFullURL];
      v41 = [v40 CDVRawPath];
      if ([v41 hasSuffix:@"calendar-proxy-read/"]) {
        break;
      }
      if ([v41 hasSuffix:@"calendar-proxy-write/"])
      {
        uint64_t v42 = [(CalDAVGetDelegatesBaseTaskGroup *)self writePrincipalURLs];
        goto LABEL_47;
      }
LABEL_48:

      if (v37 == ++v39)
      {
        uint64_t v37 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (!v37) {
          goto LABEL_50;
        }
        goto LABEL_40;
      }
    }
    uint64_t v42 = [(CalDAVGetDelegatesBaseTaskGroup *)self readPrincipalURLs];
LABEL_47:
    v43 = (void *)v42;
    v44 = [v40 CDVURLByDeletingLastPathComponent];
    [v43 addObject:v44];

    goto LABEL_48;
  }
  if (v11)
  {
    int v12 = self;
    v13 = v11;
    uint64_t v14 = 6;
LABEL_18:
    [(CalDAVGetDelegatesTaskGroup *)v12 _finishWithError:v13 state:v14];
    goto LABEL_19;
  }
  uint64_t v18 = *MEMORY[0x263F34DA8];
  v19 = [v9 successfulValueForNameSpace:*MEMORY[0x263F34DA8] elementName:@"calendar-proxy-write-for"];
  [(CalDAVGetDelegatesBaseTaskGroup *)self _processDetailsFromMultiStatus:v19 allowWrite:1];
  v20 = [v9 successfulValueForNameSpace:v18 elementName:@"calendar-proxy-read-for"];

  [(CalDAVGetDelegatesBaseTaskGroup *)self _processDetailsFromMultiStatus:v20 allowWrite:0];
  [(CalDAVGetDelegatesTaskGroup *)self _finishWithError:0 state:11];

LABEL_19:
  v21 = [(CoreDAVTaskGroup *)self outstandingTasks];
  [v21 removeObject:v9];
}

- (void)taskGroup:(id)a3 didFinishWithError:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  int v7 = [(CalDAVGetDelegatesTaskGroup *)self state];
  if (!v6 && ((int v8 = v7, [(CalDAVGetDelegatesTaskGroup *)self state] == 4) || v8 == 5))
  {
    id v9 = v13;
    id v10 = [v9 principalResult];

    if (v10)
    {
      if (v8 == 5) {
        [(CalDAVGetDelegatesBaseTaskGroup *)self writeDetails];
      }
      else {
      v11 = [(CalDAVGetDelegatesBaseTaskGroup *)self readDetails];
      }
      int v12 = [v9 principalResult];
      [v11 addObject:v12];
    }
    [(CalDAVGetDelegatesTaskGroup *)self _getChildProperties];
  }
  else
  {
    [(CalDAVGetDelegatesTaskGroup *)self _finishWithError:v6 state:10];
  }
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSMutableArray)nestedGroupPrincipalURLs
{
  return self->_nestedGroupPrincipalURLs;
}

- (void)setNestedGroupPrincipalURLs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end