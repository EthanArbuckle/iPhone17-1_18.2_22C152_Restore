@interface CalDAVAccountPropertyRefreshOperation
- (BOOL)fetchPrincipalSearchProperties;
- (BOOL)shouldKeepDefaultAlarmError:(id)a3;
- (BOOL)shouldRefreshDefaultAlarms;
- (CalDAVAccountPropertyRefreshOperation)initWithPrincipal:(id)a3;
- (id)_copyHomePropertiesPropFindElements;
- (id)propPatchForProperty:(id)a3 value:(id)a4;
- (void)_finishCalDAVAccountPropertyRefreshOperationWithError:(id)a3;
- (void)_reallyRefreshProperties;
- (void)_refreshDefaultAlarms;
- (void)getAccountPropertiesTask:(id)a3 completedWithError:(id)a4;
- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5;
- (void)refreshProperties;
- (void)sendLocallyChangedPropertiesIfNeeded;
- (void)setFetchPrincipalSearchProperties:(BOOL)a3;
@end

@implementation CalDAVAccountPropertyRefreshOperation

- (CalDAVAccountPropertyRefreshOperation)initWithPrincipal:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CalDAVAccountPropertyRefreshOperation;
  v3 = [(CalDAVOperation *)&v7 initWithPrincipal:a3];
  if (v3)
  {
    dispatch_group_t v4 = dispatch_group_create();
    defaultAlarmGroup = v3->_defaultAlarmGroup;
    v3->_defaultAlarmGroup = (OS_dispatch_group *)v4;
  }
  return v3;
}

- (id)propPatchForProperty:(id)a3 value:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F34AF8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  v9 = (void *)[v8 initWithNameSpace:*MEMORY[0x263F34CD8] andName:v7];

  [v9 setPayloadAsString:v6];
  [v9 setUseCDATA:1];
  return v9;
}

- (void)sendLocallyChangedPropertiesIfNeeded
{
  v3 = objc_opt_new();
  dispatch_group_t v4 = [(CalDAVOperation *)self principal];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_7;
  }
  v5 = [(CalDAVOperation *)self principal];
  if (([v5 needsDefaultTimedAlarmUpdate] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v6 = [(CalDAVOperation *)self principal];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(CalDAVOperation *)self principal];
    v9 = [(id)v8 defaultTimedAlarms];
    v10 = [(CalDAVAccountPropertyRefreshOperation *)self propPatchForProperty:@"default-alarm-vevent-datetime" value:v9];
    [v3 addObject:v10];

    v11 = [(CalDAVOperation *)self principal];
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if (v8)
    {
      dispatch_group_t v4 = [(CalDAVOperation *)self principal];
      [v4 setNeedsDefaultTimedAlarmUpdate:0];
LABEL_7:
    }
  }
  v12 = [(CalDAVOperation *)self principal];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_14:

    goto LABEL_15;
  }
  v13 = [(CalDAVOperation *)self principal];
  if (([v13 needsDefaultAllDayAlarmUpdate] & 1) == 0)
  {

    goto LABEL_14;
  }
  v14 = [(CalDAVOperation *)self principal];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    uint64_t v16 = [(CalDAVOperation *)self principal];
    v17 = [(id)v16 defaultAllDayAlarms];
    v18 = [(CalDAVAccountPropertyRefreshOperation *)self propPatchForProperty:@"default-alarm-vevent-date" value:v17];
    [v3 addObject:v18];

    v19 = [(CalDAVOperation *)self principal];
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if (v16)
    {
      v12 = [(CalDAVOperation *)self principal];
      [v12 setNeedsDefaultAllDayAlarmUpdate:0];
      goto LABEL_14;
    }
  }
LABEL_15:
  if ([v3 count])
  {
    id v20 = objc_alloc(MEMORY[0x263F34B88]);
    v21 = [(CalDAVOperation *)self principal];
    v22 = [v21 calendarHomeURL];
    v23 = (void *)[v20 initWithPropertiesToSet:v3 andRemove:0 atURL:v22];

    v24 = [(CoreDAVTaskGroup *)self accountInfoProvider];
    [v23 setAccountInfoProvider:v24];

    objc_initWeak(&location, self);
    objc_initWeak(&from, v23);
    dispatch_group_enter((dispatch_group_t)self->_defaultAlarmGroup);
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __77__CalDAVAccountPropertyRefreshOperation_sendLocallyChangedPropertiesIfNeeded__block_invoke;
    v30 = &unk_2641EBF60;
    objc_copyWeak(&v31, &location);
    objc_copyWeak(&v32, &from);
    [v23 setCompletionBlock:&v27];
    v25 = [(CoreDAVTaskGroup *)self outstandingTasks];
    [v25 addObject:v23];

    v26 = [(CoreDAVTaskGroup *)self taskManager];
    [v26 submitQueuedCoreDAVTask:v23];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __77__CalDAVAccountPropertyRefreshOperation_sendLocallyChangedPropertiesIfNeeded__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2)
  {
    v3 = [WeakRetained outstandingTasks];
    [v3 removeObject:v2];
  }
  dispatch_group_t v4 = WeakRetained[14];
  if (v4) {
    dispatch_group_leave(v4);
  }
}

- (void)refreshProperties
{
  [(CalDAVAccountPropertyRefreshOperation *)self sendLocallyChangedPropertiesIfNeeded];
  defaultAlarmGroup = self->_defaultAlarmGroup;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CalDAVAccountPropertyRefreshOperation_refreshProperties__block_invoke;
  block[3] = &unk_2641EBF88;
  block[4] = self;
  dispatch_group_notify(defaultAlarmGroup, MEMORY[0x263EF83A0], block);
}

void *__58__CalDAVAccountPropertyRefreshOperation_refreshProperties__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!*((unsigned char *)result + (int)*MEMORY[0x263F34C68])) {
    return (void *)[result _reallyRefreshProperties];
  }
  return result;
}

- (void)_reallyRefreshProperties
{
  v3 = [CalDAVGetAccountPropertiesTaskGroup alloc];
  dispatch_group_t v4 = [(CalDAVOperation *)self principal];
  v5 = [(CoreDAVTaskGroup *)self taskManager];
  v10 = [(CoreDAVGetAccountPropertiesTaskGroup *)v3 initWithAccountInfoProvider:v4 taskManager:v5];

  [(CoreDAVTaskGroup *)v10 setDelegate:self];
  id v6 = [(CalDAVOperation *)self principal];
  LODWORD(v4) = [v6 isDelegate];

  if (v4)
  {
    char v7 = [(CalDAVOperation *)self principal];
    uint64_t v8 = [v7 principalURL];
    [(CalDAVGetAccountPropertiesTaskGroup *)v10 setDelegatePrincipalURL:v8];
  }
  [(CoreDAVGetAccountPropertiesTaskGroup *)v10 setFetchPrincipalSearchProperties:[(CalDAVAccountPropertyRefreshOperation *)self fetchPrincipalSearchProperties]];
  v9 = [(CalDAVOperation *)self outstandingTaskGroups];
  [v9 addObject:v10];

  [(CalDAVGetAccountPropertiesTaskGroup *)v10 startTaskGroup];
}

- (void)getAccountPropertiesTask:(id)a3 completedWithError:(id)a4
{
  id v36 = a3;
  id v6 = a4;
  char v7 = [(CalDAVOperation *)self outstandingTaskGroups];
  [v7 removeObject:v36];

  uint64_t v8 = [(CalDAVOperation *)self principal];
  v9 = v8;
  if (v6)
  {
    [(CalDAVAccountPropertyRefreshOperation *)self _finishCalDAVAccountPropertyRefreshOperationWithError:v6];
  }
  else
  {
    v10 = [v8 account];
    v11 = [v36 collections];
    v12 = [v11 anyObject];
    [v10 setCollectionSetURL:v12];

    v13 = [v36 serverVersion];
    [v10 setServerVersion:v13];

    v14 = [v36 principalSearchProperties];
    char v15 = +[CalDAVPrincipalSearchPropertySet searchSetWithProperties:v14];
    [v10 setSearchPropertySet:v15];

    uint64_t v16 = NSURL;
    v17 = [v36 calendarHomes];
    v18 = [v17 anyObject];
    v19 = [v18 absoluteString];
    id v20 = [v19 appendSlashIfNeeded];
    v21 = [v16 URLWithString:v20];
    [v9 setCalendarHomeURL:v21];

    v22 = [v36 inboxURL];
    [v9 setInboxURL:v22];

    v23 = [v36 outboxURL];
    [v9 setOutboxURL:v23];

    v24 = [v36 dropboxURL];
    [v9 setDropBoxURL:v24];

    v25 = [v36 notificationURL];
    [v9 setNotificationCollectionURL:v25];

    v26 = [v36 displayName];
    [v9 setFullName:v26];

    objc_msgSend(v9, "setSupportsCalendarUserSearch:", objc_msgSend(v36, "supportsCalendarUserSearch"));
    if ([v36 isExpandPropertyReportSupported])
    {
      uint64_t v27 = [v36 serverVersion];
      objc_msgSend(v9, "setIsExpandPropertyReportSupported:", objc_msgSend(v27, "expandPropertyReportIsUnreliable") ^ 1);
    }
    else
    {
      [v9 setIsExpandPropertyReportSupported:0];
    }
    uint64_t v28 = [v36 preferredUserAddresses];
    [v9 setPreferredCalendarUserAddresses:v28];

    v29 = NSURL;
    v30 = [v36 principalURL];
    uint64_t v31 = [v30 absoluteString];
    id v32 = [(id)v31 appendSlashIfNeeded];
    v33 = [v29 URLWithString:v32];

    v34 = [v9 principalURL];
    LOBYTE(v31) = [v34 isEqual:v33];

    if ((v31 & 1) == 0)
    {
      v35 = [v10 password];
      [v9 setPrincipalURL:v33];
      [v10 setPassword:v35];
    }
    if ([(CalDAVAccountPropertyRefreshOperation *)self shouldRefreshDefaultAlarms]) {
      [(CalDAVAccountPropertyRefreshOperation *)self _refreshDefaultAlarms];
    }
    else {
      [(CalDAVAccountPropertyRefreshOperation *)self _finishCalDAVAccountPropertyRefreshOperationWithError:0];
    }
  }
}

- (BOOL)shouldRefreshDefaultAlarms
{
  id v2 = [(CalDAVOperation *)self principal];
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    v3 = [v2 account];
    dispatch_group_t v4 = [v3 serverVersion];

    char v5 = [v4 supportsDefaultAlarms];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_refreshDefaultAlarms
{
  v3 = [(CalDAVOperation *)self principal];
  dispatch_group_t v4 = [v3 calendarHomeURL];
  if (v4)
  {
    id v5 = [(CalDAVAccountPropertyRefreshOperation *)self _copyHomePropertiesPropFindElements];
    id v6 = (void *)[objc_alloc(MEMORY[0x263F34B80]) initWithPropertiesToFind:v5 atURL:v4 withDepth:2];
    [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C70]) addObject:v6];
    [v6 setDelegate:self];
    [v6 setAccountInfoProvider:v3];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C78]));
    [WeakRetained submitQueuedCoreDAVTask:v6];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F34B30] sharedLogging];
    v9 = [v8 logHandleForAccountInfoProvider:0];
    v10 = v9;
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_213CEC000, v10, OS_LOG_TYPE_ERROR, "Skipping default alarm refresh because there is no home URL", v11, 2u);
    }

    [(CalDAVAccountPropertyRefreshOperation *)self _finishCalDAVAccountPropertyRefreshOperationWithError:0];
  }
}

- (id)_copyHomePropertiesPropFindElements
{
  id v2 = objc_opt_new();
  uint64_t v3 = *MEMORY[0x263F34CD8];
  [v2 CDVAddItemParserMappingWithNameSpace:*MEMORY[0x263F34CD8] name:@"default-alarm-vevent-datetime" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v3 name:@"default-alarm-vevent-date" parseClass:objc_opt_class()];
  return v2;
}

- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CalDAVOperation *)self principal];
  v12 = (void *)v11;
  if (!v10)
  {
    uint64_t v28 = (void *)v11;
    v29 = self;
    id v30 = v8;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v9;
    uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v10 = 0;
      uint64_t v32 = *(void *)v35;
      v33 = 0;
      uint64_t v18 = *MEMORY[0x263F34CD8];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(obj);
          }
          id v20 = [*(id *)(*((void *)&v34 + 1) + 8 * i) successfulPropertiesToValues];
          v21 = [v20 CDVObjectForKeyWithNameSpace:v18 andName:@"default-alarm-vevent-datetime"];
          v22 = v21;
          if (v21)
          {
            uint64_t v23 = [v21 payloadAsString];

            id v10 = (id)v23;
          }
          v24 = [v20 CDVObjectForKeyWithNameSpace:v18 andName:@"default-alarm-vevent-date"];
          v25 = v24;
          if (v24)
          {
            [v24 payloadAsString];
            uint64_t v27 = v26 = v10;

            v33 = (void *)v27;
            id v10 = v26;
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v17);
    }
    else
    {
      v33 = 0;
      id v10 = 0;
    }

    v12 = v28;
    if (objc_opt_respondsToSelector()) {
      [v28 setDefaultTimedAlarms:v10];
    }
    id v8 = v30;
    self = v29;
    v13 = v33;
    if (objc_opt_respondsToSelector()) {
      [v28 setDefaultAllDayAlarms:v33];
    }
    goto LABEL_24;
  }
  if (![(CalDAVAccountPropertyRefreshOperation *)self shouldKeepDefaultAlarmError:v10])
  {
    v13 = [MEMORY[0x263F34B30] sharedLogging];
    v14 = [v13 logHandleForAccountInfoProvider:0];
    char v15 = v14;
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v10;
      _os_log_impl(&dword_213CEC000, v15, OS_LOG_TYPE_ERROR, "Fetching default alarms failed. Ignoring and moving on. The error was %@", buf, 0xCu);
    }

LABEL_24:
    id v10 = 0;
  }
  [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C70]) removeObject:v8];
  [(CalDAVAccountPropertyRefreshOperation *)self _finishCalDAVAccountPropertyRefreshOperationWithError:v10];
}

- (BOOL)shouldKeepDefaultAlarmError:(id)a3
{
  uint64_t v3 = [a3 domain];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F08570]];

  return v4;
}

- (void)_finishCalDAVAccountPropertyRefreshOperationWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __95__CalDAVAccountPropertyRefreshOperation__finishCalDAVAccountPropertyRefreshOperationWithError___block_invoke;
  v6[3] = &unk_2641EBFB0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v5 delegateCallbackBlock:v6];
}

void __95__CalDAVAccountPropertyRefreshOperation__finishCalDAVAccountPropertyRefreshOperationWithError___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  id v2 = [*(id *)(a1 + 32) principal];
  [v3 propertyRefreshForPrincipal:v2 completedWithError:*(void *)(a1 + 40)];
}

- (BOOL)fetchPrincipalSearchProperties
{
  return self->_fetchPrincipalSearchProperties;
}

- (void)setFetchPrincipalSearchProperties:(BOOL)a3
{
  self->_fetchPrincipalSearchProperties = a3;
}

- (void).cxx_destruct
{
}

@end