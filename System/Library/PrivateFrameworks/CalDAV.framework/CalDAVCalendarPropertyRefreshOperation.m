@interface CalDAVCalendarPropertyRefreshOperation
- (BOOL)_handleMkCalTaskGroupError:(id)a3 forCalendar:(id)a4;
- (BOOL)_handleUpdateForCalendar:(id)a3;
- (BOOL)forceClearCalendarHomeSyncToken;
- (BOOL)useCalendarHomeSyncReport;
- (CalDAVCalendarPropertyRefreshOperation)initWithPrincipal:(id)a3;
- (NSString)calendarHomeSyncToken;
- (OS_dispatch_group)outstandingTasksGroup;
- (id)_generateTimeZoneString:(id)a3;
- (id)_getDefaultMkCalendarForPrincipalTaskGroup:(id)a3 isEventCalendar:(BOOL)a4;
- (id)_getIsAffectingAvailabilityCoreDAVItem:(id)a3;
- (id)_getMkcalendarTaskGroupForCalendar:(id)a3;
- (id)_getSetIsAffectingAvailabilityTask:(BOOL)a3 forCalendar:(id)a4 atURL:(id)a5;
- (id)_getSetPropertiesTaskWithItemsToSet:(id)a3 itemsToRemove:(id)a4 atURL:(id)a5;
- (id)_getSetPropertyStringTask:(id)a3 forName:(id)a4 andNamespace:(id)a5 forCalendar:(id)a6 atURL:(id)a7;
- (id)_getSetPropertyStringTask:(id)a3 forName:(id)a4 andNamespace:(id)a5 forCalendar:(id)a6 atURL:(id)a7 ignoreErrors:(BOOL)a8;
- (id)_getSetPropertyTaskWithCoreDAVItem:(id)a3 forCalendar:(id)a4 atURL:(id)a5;
- (id)_getSetPropertyTaskWithCoreDAVItem:(id)a3 forCalendar:(id)a4 atURL:(id)a5 ignoreErrors:(BOOL)a6;
- (int)_sharingStatusForContainer:(id)a3;
- (void)_continueHandleContainerInfoTask:(id)a3 completedWithContainers:(id)a4 error:(id)a5;
- (void)_finishRefresh;
- (void)_getDefaultCalendarsTasksIfNeededForPrincipal:(id)a3;
- (void)_handleCalendarPublish;
- (void)_initializePrincipalCalendarCache;
- (void)_prepareCalendarsBeforeRefresh;
- (void)_reallyRefreshCalendarProperties;
- (void)_retryMkCalForCalendar:(id)a3;
- (void)_sendAddsForCalendars;
- (void)_sendDeletesForCalendars;
- (void)_sendShareActionTasks;
- (void)_updateDefaultSchedulingCalendarIfNeededForInboxCalendar:(id)a3 withContainer:(id)a4;
- (void)containerInfoSyncTask:(id)a3 completedWithNewSyncToken:(id)a4 error:(id)a5;
- (void)containerInfoSyncTask:(id)a3 retrievedAddedOrModifiedContainers:(id)a4 removedContainerURLs:(id)a5;
- (void)containerInfoTask:(id)a3 completedWithContainers:(id)a4 error:(id)a5;
- (void)refreshCalendarProperties;
- (void)setCalendarHomeSyncToken:(id)a3;
- (void)setForceClearCalendarHomeSyncToken:(BOOL)a3;
- (void)setOutstandingTasksGroup:(id)a3;
- (void)setUseCalendarHomeSyncReport:(BOOL)a3;
@end

@implementation CalDAVCalendarPropertyRefreshOperation

- (CalDAVCalendarPropertyRefreshOperation)initWithPrincipal:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CalDAVCalendarPropertyRefreshOperation;
  v3 = [(CalDAVOperation *)&v9 initWithPrincipal:a3];
  if (v3)
  {
    dispatch_group_t v4 = dispatch_group_create();
    outstandingTasksGroup = v3->_outstandingTasksGroup;
    v3->_outstandingTasksGroup = (OS_dispatch_group *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    updatedCalendars = v3->_updatedCalendars;
    v3->_updatedCalendars = v6;
  }
  return v3;
}

- (void)_finishRefresh
{
  dispatch_group_t v4 = [(CalDAVOperation *)self principal];
  if (![v4 isMergeSync] || !self->_didMakeCalendars || self->_isSecondRefresh)
  {

LABEL_5:
    if (self->_didFinish)
    {
      v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"CalDAVCalendarPropertyRefreshOperation.m" lineNumber:81 description:@"We shouldn't have finished more than once!"];
    }
    self->_didFinish = 1;
    v5 = self->_calendarHomeSyncToken;
    if (self->_forceClearCalendarHomeSyncToken)
    {

      v5 = 0;
    }
    savedError = self->_savedError;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__CalDAVCalendarPropertyRefreshOperation__finishRefresh__block_invoke;
    v14[3] = &unk_2641EBFB0;
    v14[4] = self;
    v15 = v5;
    v7 = v5;
    [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:savedError delegateCallbackBlock:v14];
    ctags = self->_ctags;
    self->_ctags = 0;

    syncTokens = self->_syncTokens;
    self->_syncTokens = 0;

    v10 = self->_savedError;
    self->_savedError = 0;

    calendarHomeSyncToken = self->_calendarHomeSyncToken;
    self->_calendarHomeSyncToken = 0;

    return;
  }
  v12 = self->_savedError;

  if (v12) {
    goto LABEL_5;
  }
  self->_isSecondRefresh = 1;
  [(CalDAVCalendarPropertyRefreshOperation *)self refreshCalendarProperties];
}

void __56__CalDAVCalendarPropertyRefreshOperation__finishRefresh__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  v2 = [*(id *)(a1 + 32) principal];
  [v3 calendarRefreshForPrincipal:v2 completedWithNewCTags:*(void *)(*(void *)(a1 + 32) + 120) newSyncTokens:*(void *)(*(void *)(a1 + 32) + 128) calendarHomeSyncToken:*(void *)(a1 + 40) updatedCalendars:*(void *)(*(void *)(a1 + 32) + 152) error:*(void *)(*(void *)(a1 + 32) + 112)];
}

- (void)_reallyRefreshCalendarProperties
{
  id v3 = [MEMORY[0x263F34B30] sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
  v5 = [v3 logHandleForAccountInfoProvider:WeakRetained];

  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_213CEC000, v5, OS_LOG_TYPE_INFO, "Refreshing calendar properties", (uint8_t *)buf, 2u);
  }

  v6 = (void *)MEMORY[0x263EFFA08];
  v7 = [(CalDAVOperation *)self principal];
  v8 = [v7 calendarHomeURL];
  objc_super v9 = [v6 setWithObject:v8];

  v10 = [(CalDAVOperation *)self principal];
  v11 = [v10 calendarHomeSyncToken];

  if (![(CalDAVCalendarPropertyRefreshOperation *)self useCalendarHomeSyncReport]
    || ![v11 length])
  {
    goto LABEL_10;
  }
  v12 = [(CalDAVOperation *)self principal];
  if ([v12 isMergeSync]) {
    goto LABEL_9;
  }
  v13 = [(CalDAVOperation *)self principal];
  v14 = [v13 modifiedCalendars];
  if ([v14 count])
  {

LABEL_9:
    goto LABEL_10;
  }
  BOOL forceClearCalendarHomeSyncToken = self->_forceClearCalendarHomeSyncToken;

  if (!forceClearCalendarHomeSyncToken)
  {
    v25 = [CalDAVCalendarInfoSyncTaskGroup alloc];
    v26 = [(CalDAVOperation *)self principal];
    v27 = [v26 calendarHomeURL];
    v28 = [(CalDAVOperation *)self principal];
    v29 = [(CoreDAVTaskGroup *)self taskManager];
    v18 = [(CoreDAVContainerInfoSyncTaskGroup *)v25 initWithContainerURL:v27 previousSyncToken:v11 accountInfoProvider:v28 taskManager:v29];

    v30 = [(CalDAVOperation *)self principal];
    v31 = [v30 account];
    v32 = [v31 serverVersion];
    -[CalDAVCalendarInfoSyncTaskGroup setFetchSharees:](v18, "setFetchSharees:", [v32 supportsSharing]);

    [(CoreDAVContainerInfoSyncTaskGroup *)v18 setDelegate:self];
    [(CalDAVCalendarPropertyRefreshOperation *)self _initializePrincipalCalendarCache];
    goto LABEL_11;
  }
LABEL_10:
  v15 = [CalDAVCalendarInfoTaskGroup alloc];
  v16 = [(CalDAVOperation *)self principal];
  v17 = [(CoreDAVTaskGroup *)self taskManager];
  v18 = [(CalDAVCalendarInfoTaskGroup *)v15 initWithAccountInfoProvider:v16 containerURLs:v9 taskManager:v17];

  v19 = [(CalDAVOperation *)self principal];
  v20 = [v19 account];
  v21 = [v20 serverVersion];
  -[CalDAVCalendarInfoSyncTaskGroup setFetchSharees:](v18, "setFetchSharees:", [v21 supportsSharing]);

  [(CoreDAVContainerInfoSyncTaskGroup *)v18 setDelegate:self];
LABEL_11:
  v22 = [(CalDAVCalendarPropertyRefreshOperation *)self outstandingTasksGroup];
  dispatch_group_enter(v22);

  v23 = [(CalDAVOperation *)self outstandingTaskGroups];
  [v23 addObject:v18];

  objc_initWeak(buf, self);
  objc_initWeak(&location, v18);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __74__CalDAVCalendarPropertyRefreshOperation__reallyRefreshCalendarProperties__block_invoke;
  v33[3] = &unk_2641EBF60;
  objc_copyWeak(&v34, buf);
  objc_copyWeak(&v35, &location);
  [(CoreDAVTaskGroup *)v18 setCompletionBlock:v33];
  [(CoreDAVContainerInfoSyncTaskGroup *)v18 startTaskGroup];
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
  objc_destroyWeak(buf);
}

void __74__CalDAVCalendarPropertyRefreshOperation__reallyRefreshCalendarProperties__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained outstandingTaskGroups];
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v2 removeObject:v3];

  dispatch_group_t v4 = [WeakRetained outstandingTasksGroup];

  if (v4)
  {
    v5 = [WeakRetained outstandingTasksGroup];
    dispatch_group_leave(v5);
  }
}

- (void)_sendDeletesForCalendars
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = &off_213D28000;
  if (!self->_isSecondRefresh)
  {
    v17 = a2;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    dispatch_group_t v4 = [(CalDAVOperation *)self principal];
    id obj = [v4 deletedCalendarURLs];

    uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v5)
    {
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v8 = [MEMORY[0x263F34B30] sharedLogging];
          id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
          v10 = [v8 logHandleForAccountInfoProvider:WeakRetained];

          if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v7;
            _os_log_impl(&dword_213CEC000, v10, OS_LOG_TYPE_INFO, "Sending delete for calendar at %@", buf, 0xCu);
          }

          v11 = (void *)[objc_alloc(MEMORY[0x263F34AC0]) initWithURL:v7];
          v12 = [(CoreDAVTaskGroup *)self accountInfoProvider];
          [v11 setAccountInfoProvider:v12];

          v13 = [(CalDAVCalendarPropertyRefreshOperation *)self outstandingTasksGroup];
          dispatch_group_enter(v13);

          objc_initWeak((id *)buf, self);
          objc_initWeak(&location, v11);
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __66__CalDAVCalendarPropertyRefreshOperation__sendDeletesForCalendars__block_invoke;
          v21[3] = &unk_2641EBF60;
          objc_copyWeak(&v22, (id *)buf);
          objc_copyWeak(&v23, &location);
          [v11 setCompletionBlock:v21];
          v14 = [(CoreDAVTaskGroup *)self outstandingTasks];
          [v14 addObject:v11];

          v15 = [(CoreDAVTaskGroup *)self taskManager];
          [v15 submitQueuedCoreDAVTask:v11];

          objc_destroyWeak(&v23);
          objc_destroyWeak(&v22);
          objc_destroyWeak(&location);
          objc_destroyWeak((id *)buf);
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v5);
    }

    a2 = v17;
    id v3 = &off_213D28000;
  }
  outstandingTasksGroup = self->_outstandingTasksGroup;
  block[0] = MEMORY[0x263EF8330];
  block[1] = *((void *)v3 + 498);
  block[2] = __66__CalDAVCalendarPropertyRefreshOperation__sendDeletesForCalendars__block_invoke_2;
  block[3] = &unk_2641EC0C0;
  block[4] = self;
  block[5] = a2;
  dispatch_group_notify(outstandingTasksGroup, MEMORY[0x263EF83A0], block);
}

void __66__CalDAVCalendarPropertyRefreshOperation__sendDeletesForCalendars__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id *)(a1 + 40);
  id v3 = objc_loadWeakRetained(v2);
  dispatch_group_t v4 = [v3 error];

  if (v4) {
    [WeakRetained setForceClearCalendarHomeSyncToken:1];
  }
  uint64_t v5 = [WeakRetained outstandingTasks];
  id v6 = objc_loadWeakRetained(v2);
  [v5 removeObject:v6];

  uint64_t v7 = [WeakRetained outstandingTasksGroup];

  if (v7)
  {
    v8 = [WeakRetained outstandingTasksGroup];
    dispatch_group_leave(v8);
  }
}

void *__66__CalDAVCalendarPropertyRefreshOperation__sendDeletesForCalendars__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) outstandingTasks];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"CalDAVCalendarPropertyRefreshOperation.m" lineNumber:160 description:@"All tasks should be complete when the outstanding task group is clear"];
  }
  dispatch_group_t v4 = [*(id *)(a1 + 32) outstandingTaskGroups];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    objc_super v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"CalDAVCalendarPropertyRefreshOperation.m" lineNumber:161 description:@"All task groups should be complete when the outstanding task group is clear"];
  }
  result = *(void **)(a1 + 32);
  if (!*((unsigned char *)result + (int)*MEMORY[0x263F34C68]))
  {
    [result _sendShareActionTasks];
    uint64_t v7 = *(void **)(a1 + 32);
    return (void *)[v7 _reallyRefreshCalendarProperties];
  }
  return result;
}

- (void)_sendAddsForCalendars
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (!self->_isSecondRefresh)
  {
    dispatch_group_t v4 = [(CalDAVOperation *)self principal];
    char v5 = [v4 isMergeSync];

    if ((v5 & 1) == 0)
    {
      id v22 = a2;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v6 = [(CalDAVOperation *)self principal];
      uint64_t v7 = [v6 addedCalendars];

      id obj = v7;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v26;
        v11 = (int *)MEMORY[0x263F34C60];
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v26 != v10) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v14 = [MEMORY[0x263F34B30] sharedLogging];
            id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + *v11));
            v16 = [v14 logHandleForAccountInfoProvider:WeakRetained];

            if (v16)
            {
              v17 = v16;
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                v18 = [v13 calendarURL];
                *(_DWORD *)buf = 138412290;
                uint64_t v30 = v18;
                _os_log_impl(&dword_213CEC000, v17, OS_LOG_TYPE_INFO, "Sending add for calendar at %@", buf, 0xCu);
              }
            }

            uint64_t v19 = [(CalDAVCalendarPropertyRefreshOperation *)self _getMkcalendarTaskGroupForCalendar:v13];
            v20 = [(CalDAVOperation *)self outstandingTaskGroups];
            [v20 addObject:v19];

            [v19 startTaskGroup];
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
        }
        while (v9);
      }

      a2 = v22;
    }
  }
  outstandingTasksGroup = self->_outstandingTasksGroup;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__CalDAVCalendarPropertyRefreshOperation__sendAddsForCalendars__block_invoke;
  block[3] = &unk_2641EC0C0;
  block[4] = self;
  block[5] = a2;
  dispatch_group_notify(outstandingTasksGroup, MEMORY[0x263EF83A0], block);
}

void __63__CalDAVCalendarPropertyRefreshOperation__sendAddsForCalendars__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) outstandingTasks];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"CalDAVCalendarPropertyRefreshOperation.m" lineNumber:182 description:@"All tasks should be complete when the outstanding task group is clear"];
  }
  dispatch_group_t v4 = [*(id *)(a1 + 32) outstandingTaskGroups];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"CalDAVCalendarPropertyRefreshOperation.m" lineNumber:183 description:@"All task groups should be complete when the outstanding task group is clear"];
  }
  id v6 = *(void **)(a1 + 32);
  if (!*((unsigned char *)v6 + (int)*MEMORY[0x263F34C68]))
  {
    id v9 = [v6 delegate];
    if (objc_opt_respondsToSelector()) {
      [v9 calendarRefreshWillSendCalendarDeletes:*(void *)(a1 + 32)];
    }
    else {
      [*(id *)(a1 + 32) _sendDeletesForCalendars];
    }
  }
}

- (void)_handleCalendarPublish
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v3 = [(CalDAVOperation *)self principal];
  id obj = [v3 calendars];

  uint64_t v4 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v4)
  {
    uint64_t v30 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([v6 needsPublishUpdate])
        {
          uint64_t v7 = [v6 calendarURL];
          BOOL v8 = v7 == 0;

          id v9 = [MEMORY[0x263F34B30] sharedLogging];
          id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
          v11 = [(CalDAVModifyCalendarSharingLevelTaskGroup *)v9 logHandleForAccountInfoProvider:WeakRetained];

          if (v8)
          {
            if (v11)
            {
              v24 = v11;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                long long v25 = [v6 title];
                long long v26 = [v6 guid];
                *(_DWORD *)buf = 138412546;
                v41 = v25;
                __int16 v42 = 2114;
                v43 = v26;
                _os_log_impl(&dword_213CEC000, v24, OS_LOG_TYPE_DEFAULT, "Calendar \"%@\" (%{public}@) doesn't have a URL, so we're not going to try to publish it", buf, 0x16u);
              }
            }
          }
          else
          {
            if (v11)
            {
              v12 = v11;
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                v13 = [v6 title];
                v14 = [v6 guid];
                int v15 = [v6 isPublished];
                *(_DWORD *)buf = 138412802;
                v16 = @"un";
                if (v15) {
                  v16 = &stru_26C4CD4C0;
                }
                v41 = v13;
                __int16 v42 = 2114;
                v43 = v14;
                __int16 v44 = 2114;
                v45 = v16;
                _os_log_impl(&dword_213CEC000, v12, OS_LOG_TYPE_INFO, "Calendar \"%@\" (%{public}@) needs to be updated to be %{public}@published", buf, 0x20u);
              }
            }

            v17 = [CalDAVModifyCalendarSharingLevelTaskGroup alloc];
            int v18 = [v6 isPublished];
            uint64_t v19 = [v6 calendarURL];
            v20 = [(CoreDAVTaskGroup *)self accountInfoProvider];
            v21 = [(CoreDAVTaskGroup *)self taskManager];
            id v9 = [(CalDAVModifyCalendarSharingLevelTaskGroup *)v17 initWithSharingAction:v18 ^ 1u atCalendarURL:v19 accountInfoProvider:v20 taskManager:v21];

            objc_initWeak((id *)buf, self);
            objc_initWeak(&location, v9);
            id v22 = [(CalDAVCalendarPropertyRefreshOperation *)self outstandingTasksGroup];
            dispatch_group_enter(v22);

            v32[0] = MEMORY[0x263EF8330];
            v32[1] = 3221225472;
            v32[2] = __64__CalDAVCalendarPropertyRefreshOperation__handleCalendarPublish__block_invoke;
            v32[3] = &unk_2641EC0E8;
            objc_copyWeak(&v33, (id *)buf);
            v32[4] = self;
            v32[5] = v6;
            objc_copyWeak(&v34, &location);
            [(CoreDAVTaskGroup *)v9 setCompletionBlock:v32];
            id v23 = [(CalDAVOperation *)self outstandingTaskGroups];
            [v23 addObject:v9];

            [(CalDAVModifyCalendarSharingLevelTaskGroup *)v9 startTaskGroup];
            objc_destroyWeak(&v34);
            objc_destroyWeak(&v33);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)buf);
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v4);
  }

  outstandingTasksGroup = self->_outstandingTasksGroup;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CalDAVCalendarPropertyRefreshOperation__handleCalendarPublish__block_invoke_32;
  block[3] = &unk_2641EC0C0;
  block[4] = self;
  block[5] = a2;
  dispatch_group_notify(outstandingTasksGroup, MEMORY[0x263EF83A0], block);
}

void __64__CalDAVCalendarPropertyRefreshOperation__handleCalendarPublish__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [MEMORY[0x263F34B30] sharedLogging];
  uint64_t v4 = (int)*MEMORY[0x263F34C60];
  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + v4));
  id v6 = [v3 logHandleForAccountInfoProvider:v5];

  if (v6)
  {
    uint64_t v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = [*(id *)(a1 + 40) title];
      id v9 = [*(id *)(a1 + 40) guid];
      int v10 = [*(id *)(a1 + 40) isPublished];
      v11 = @"un";
      if (v10) {
        v11 = &stru_26C4CD4C0;
      }
      v21 = v11;
      id v12 = objc_loadWeakRetained((id *)(a1 + 56));
      v13 = [v12 error];
      *(_DWORD *)buf = 138413058;
      id v23 = v8;
      __int16 v24 = 2114;
      long long v25 = v9;
      __int16 v26 = 2114;
      long long v27 = v21;
      __int16 v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_213CEC000, v7, OS_LOG_TYPE_INFO, "Calendar \"%@\" (%{public}@) was %{public}@published with error: %@", buf, 0x2Au);
    }
  }

  v14 = [WeakRetained outstandingTaskGroups];
  id v15 = objc_loadWeakRetained((id *)(a1 + 56));
  [v14 removeObject:v15];

  v16 = [MEMORY[0x263F34B30] sharedLogging];
  id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + v4));
  int v18 = [v16 logHandleForAccountInfoProvider:v17];

  if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CEC000, v18, OS_LOG_TYPE_INFO, "Done updating publishing level on all calendars.", buf, 2u);
  }

  uint64_t v19 = [WeakRetained outstandingTasksGroup];

  if (v19)
  {
    v20 = [WeakRetained outstandingTasksGroup];
    dispatch_group_leave(v20);
  }
}

void *__64__CalDAVCalendarPropertyRefreshOperation__handleCalendarPublish__block_invoke_32(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) outstandingTasks];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"CalDAVCalendarPropertyRefreshOperation.m" lineNumber:228 description:@"All tasks should be complete when the outstanding task group is clear"];
  }
  uint64_t v4 = [*(id *)(a1 + 32) outstandingTaskGroups];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    BOOL v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"CalDAVCalendarPropertyRefreshOperation.m" lineNumber:229 description:@"All task groups should be complete when the outstanding task group is clear"];
  }
  result = *(void **)(a1 + 32);
  if (!*((unsigned char *)result + (int)*MEMORY[0x263F34C68]))
  {
    return (void *)[result _sendAddsForCalendars];
  }
  return result;
}

- (void)_prepareCalendarsBeforeRefresh
{
  uint64_t v4 = [MEMORY[0x263F34B30] sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
  id v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CEC000, v6, OS_LOG_TYPE_INFO, "Preparing our calendars before we refresh them from the server", buf, 2u);
  }

  uint64_t v7 = [(CalDAVOperation *)self principal];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    *(void *)buf = 0;
    id v12 = buf;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v9 = [(CalDAVOperation *)self principal];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __72__CalDAVCalendarPropertyRefreshOperation__prepareCalendarsBeforeRefresh__block_invoke;
    v10[3] = &unk_2641EC110;
    v10[5] = buf;
    v10[6] = a2;
    v10[4] = self;
    [v9 prepareCalendarsForSyncWithCompletionBlock:v10];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    [(CalDAVCalendarPropertyRefreshOperation *)self _handleCalendarPublish];
  }
}

uint64_t __72__CalDAVCalendarPropertyRefreshOperation__prepareCalendarsBeforeRefresh__block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[5] + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a1[6] object:a1[4] file:@"CalDAVCalendarPropertyRefreshOperation.m" lineNumber:240 description:@"prepareCalendarsForSyncWithCompletionBlock should only get called back once"];

    uint64_t v2 = *(void *)(a1[5] + 8);
  }
  *(unsigned char *)(v2 + 24) = 1;
  uint64_t v3 = (void *)a1[4];
  return [v3 _handleCalendarPublish];
}

- (void)_sendShareActionTasks
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v2 = [(CalDAVOperation *)self principal];
  id obj = [v2 calendars];

  uint64_t v47 = [obj countByEnumeratingWithState:&v63 objects:v80 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v64 != v46) {
          objc_enumerationMutation(obj);
        }
        v50 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if (([v50 isEventContainer] & 1) != 0 || objc_msgSend(v50, "isTaskContainer"))
        {
          uint64_t v3 = [v50 shareeActions];
          BOOL v4 = [v3 count] == 0;

          if (!v4)
          {
            id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
            id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            uint64_t v7 = [v50 shareeActions];
            char v8 = 0;
            uint64_t v9 = [v7 countByEnumeratingWithState:&v59 objects:v79 count:16];
            if (v9)
            {
              uint64_t v10 = *(void *)v60;
              do
              {
                uint64_t v11 = 0;
                do
                {
                  if (*(void *)v60 != v10) {
                    objc_enumerationMutation(v7);
                  }
                  id v12 = *(void **)(*((void *)&v59 + 1) + 8 * v11);
                  if ([v12 action] == 1 || !objc_msgSend(v12, "action"))
                  {
                    id v17 = [v12 context];
                    [v5 addObject:v17];
                  }
                  else
                  {
                    if ([v12 action] != 2) {
                      goto LABEL_22;
                    }
                    uint64_t v13 = [v12 context];
                    objc_opt_class();
                    char isKindOfClass = objc_opt_isKindOfClass();

                    id v15 = [v12 context];
                    v16 = v15;
                    if (isKindOfClass)
                    {
                      id v17 = [v15 objectForKeyedSubscript:@"CalDAVRemoveShareeItemKey"];

                      if (v17)
                      {
                        [v6 addObject:v17];
                        uint64_t v18 = [v12 context];
                        uint64_t v19 = [(id)v18 objectForKeyedSubscript:@"CalDAVRemoveShareeMuteKey"];

                        LOBYTE(v18) = [v19 BOOLValue];
                        v8 |= v18;
                      }
                    }
                    else
                    {
                      [v6 addObject:v15];
                      id v17 = v16;
                    }
                  }

LABEL_22:
                  ++v11;
                }
                while (v9 != v11);
                uint64_t v20 = [v7 countByEnumeratingWithState:&v59 objects:v79 count:16];
                uint64_t v9 = v20;
              }
              while (v20);
            }

            v21 = [v50 sharees];
            if ([v21 count]) {
              uint64_t v22 = 2;
            }
            else {
              uint64_t v22 = 3;
            }

            id v23 = [MEMORY[0x263F34B30] sharedLogging];
            id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
            long long v25 = [v23 logHandleForAccountInfoProvider:WeakRetained];

            if (v25)
            {
              __int16 v26 = v25;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                long long v27 = [v50 title];
                __int16 v28 = [v50 guid];
                v29 = [v50 calendarURL];
                *(_DWORD *)buf = 138413570;
                v68 = v27;
                __int16 v69 = 2114;
                v70 = v28;
                __int16 v71 = 2112;
                v72 = v29;
                __int16 v73 = 1024;
                int v74 = v22;
                __int16 v75 = 2112;
                id v76 = v5;
                __int16 v77 = 2112;
                id v78 = v6;
                _os_log_impl(&dword_213CEC000, v26, OS_LOG_TYPE_INFO, "Sending sharee modifications to the server for the calendar \"%@\" (%{public}@) at %@. Sharing action is %d. \n\tAdds/mods: %@\n\tDeletes: %@", buf, 0x3Au);
              }
            }

            uint64_t v30 = [CalDAVModifyCalendarSharingLevelTaskGroup alloc];
            v31 = [v50 calendarURL];
            uint64_t v32 = [(CoreDAVTaskGroup *)self accountInfoProvider];
            id v33 = [(CoreDAVTaskGroup *)self taskManager];
            id v34 = [(CalDAVModifyCalendarSharingLevelTaskGroup *)v30 initWithSharingAction:v22 atCalendarURL:v31 accountInfoProvider:v32 taskManager:v33];

            objc_initWeak((id *)buf, self);
            objc_initWeak(&location, v34);
            id v35 = [(CalDAVCalendarPropertyRefreshOperation *)self outstandingTasksGroup];
            dispatch_group_enter(v35);

            v55[0] = MEMORY[0x263EF8330];
            v55[1] = 3221225472;
            v55[2] = __63__CalDAVCalendarPropertyRefreshOperation__sendShareActionTasks__block_invoke;
            v55[3] = &unk_2641EC0E8;
            objc_copyWeak(&v56, (id *)buf);
            v55[4] = self;
            v55[5] = v50;
            objc_copyWeak(&v57, &location);
            [(CoreDAVTaskGroup *)v34 setCompletionBlock:v55];
            long long v36 = [(CalDAVOperation *)self outstandingTaskGroups];
            [v36 addObject:v34];

            [(CalDAVModifyCalendarSharingLevelTaskGroup *)v34 startTaskGroup];
            long long v37 = [CalDAVModifySharedCalendarShareeListTaskGroup alloc];
            long long v38 = [v50 title];
            long long v39 = [v50 calendarURL];
            v40 = [(CoreDAVTaskGroup *)self accountInfoProvider];
            v41 = [(CoreDAVTaskGroup *)self taskManager];
            __int16 v42 = [(CalDAVModifySharedCalendarShareeListTaskGroup *)v37 initWithShareesToSet:v5 shareesToRemove:v6 muteNotifications:v8 & 1 summary:v38 atCalendarURL:v39 accountInfoProvider:v40 taskManager:v41];

            objc_initWeak(&from, v42);
            v43 = [(CalDAVCalendarPropertyRefreshOperation *)self outstandingTasksGroup];
            dispatch_group_enter(v43);

            v51[0] = MEMORY[0x263EF8330];
            v51[1] = 3221225472;
            v51[2] = __63__CalDAVCalendarPropertyRefreshOperation__sendShareActionTasks__block_invoke_41;
            v51[3] = &unk_2641EC0E8;
            objc_copyWeak(&v52, (id *)buf);
            v51[4] = self;
            v51[5] = v50;
            objc_copyWeak(&v53, &from);
            [(CoreDAVTaskGroup *)v42 setCompletionBlock:v51];
            __int16 v44 = [(CalDAVOperation *)self outstandingTaskGroups];
            [v44 addObject:v42];

            [(CalDAVModifySharedCalendarShareeListTaskGroup *)v42 startTaskGroup];
            objc_destroyWeak(&v53);
            objc_destroyWeak(&v52);
            objc_destroyWeak(&from);

            objc_destroyWeak(&v57);
            objc_destroyWeak(&v56);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)buf);
          }
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v63 objects:v80 count:16];
    }
    while (v47);
  }
}

void __63__CalDAVCalendarPropertyRefreshOperation__sendShareActionTasks__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [MEMORY[0x263F34B30] sharedLogging];
  uint64_t v4 = (int)*MEMORY[0x263F34C60];
  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + v4));
  id v6 = [v3 logHandleForAccountInfoProvider:v5];

  if (v6)
  {
    uint64_t v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      char v8 = [*(id *)(a1 + 40) title];
      id v9 = objc_loadWeakRetained((id *)(a1 + 56));
      uint64_t v10 = [v9 error];
      int v18 = 138412546;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_213CEC000, v7, OS_LOG_TYPE_INFO, "Finished updating sharing level on \"%@\". Error was %@", (uint8_t *)&v18, 0x16u);
    }
  }

  uint64_t v11 = [WeakRetained outstandingTaskGroups];
  id v12 = objc_loadWeakRetained((id *)(a1 + 56));
  [v11 removeObject:v12];

  uint64_t v13 = [MEMORY[0x263F34B30] sharedLogging];
  id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + v4));
  id v15 = [v13 logHandleForAccountInfoProvider:v14];

  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_213CEC000, v15, OS_LOG_TYPE_INFO, "Done updating sharing level on all calendars.", (uint8_t *)&v18, 2u);
  }

  v16 = [WeakRetained outstandingTasksGroup];

  if (v16)
  {
    id v17 = [WeakRetained outstandingTasksGroup];
    dispatch_group_leave(v17);
  }
}

void __63__CalDAVCalendarPropertyRefreshOperation__sendShareActionTasks__block_invoke_41(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [MEMORY[0x263F34B30] sharedLogging];
  uint64_t v4 = (int)*MEMORY[0x263F34C60];
  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + v4));
  id v6 = [v3 logHandleForAccountInfoProvider:v5];

  if (v6)
  {
    uint64_t v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      char v8 = [*(id *)(a1 + 40) title];
      id v9 = [*(id *)(a1 + 40) guid];
      id v10 = objc_loadWeakRetained((id *)(a1 + 56));
      uint64_t v11 = [v10 error];
      int v19 = 138412802;
      __int16 v20 = v8;
      __int16 v21 = 2114;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      __int16 v24 = v11;
      _os_log_impl(&dword_213CEC000, v7, OS_LOG_TYPE_INFO, "Finished updating sharees on the Calendar \"%@\" (%{public}@). Error was %@", (uint8_t *)&v19, 0x20u);
    }
  }

  id v12 = [WeakRetained outstandingTaskGroups];
  id v13 = objc_loadWeakRetained((id *)(a1 + 56));
  [v12 removeObject:v13];

  [*(id *)(a1 + 40) clearShareeActions];
  id v14 = [MEMORY[0x263F34B30] sharedLogging];
  id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + v4));
  v16 = [v14 logHandleForAccountInfoProvider:v15];

  if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_213CEC000, v16, OS_LOG_TYPE_INFO, "Done updating sharees on all calendars. Refreshing calendar properties", (uint8_t *)&v19, 2u);
  }

  id v17 = [WeakRetained outstandingTasksGroup];

  if (v17)
  {
    int v18 = [WeakRetained outstandingTasksGroup];
    dispatch_group_leave(v18);
  }
}

- (void)refreshCalendarProperties
{
  uint64_t v4 = [(CalDAVOperation *)self principal];
  id v5 = [v4 calendarHomeURL];

  if (v5)
  {
    outstandingTasksGroup = self->_outstandingTasksGroup;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __67__CalDAVCalendarPropertyRefreshOperation_refreshCalendarProperties__block_invoke_2;
    v9[3] = &unk_2641EC0C0;
    v9[4] = self;
    v9[5] = a2;
    dispatch_group_notify(outstandingTasksGroup, MEMORY[0x263EF83A0], v9);
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F34A48] code:2 userInfo:0];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __67__CalDAVCalendarPropertyRefreshOperation_refreshCalendarProperties__block_invoke;
    v10[3] = &unk_2641EBFB0;
    v10[4] = self;
    id v11 = v7;
    id v8 = v7;
    [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v8 delegateCallbackBlock:v10];
  }
}

void __67__CalDAVCalendarPropertyRefreshOperation_refreshCalendarProperties__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = [*(id *)(a1 + 32) principal];
  [v3 calendarRefreshForPrincipal:v2 completedWithNewCTags:0 newSyncTokens:0 calendarHomeSyncToken:0 updatedCalendars:0 error:*(void *)(a1 + 40)];
}

void *__67__CalDAVCalendarPropertyRefreshOperation_refreshCalendarProperties__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) outstandingTasks];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"CalDAVCalendarPropertyRefreshOperation.m" lineNumber:333 description:@"All tasks should be complete when the outstanding task group is clear"];
  }
  uint64_t v4 = [*(id *)(a1 + 32) outstandingTaskGroups];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"CalDAVCalendarPropertyRefreshOperation.m" lineNumber:334 description:@"All task groups should be complete when the outstanding task group is clear"];
  }
  result = *(void **)(a1 + 32);
  if (!*((unsigned char *)result + (int)*MEMORY[0x263F34C68]))
  {
    return (void *)[result _prepareCalendarsBeforeRefresh];
  }
  return result;
}

- (int)_sharingStatusForContainer:(id)a3
{
  id v3 = a3;
  if (([v3 isSharedOwner] & 1) != 0
    || ([v3 publishURL], uint64_t v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    int v5 = 1;
  }
  else if ([v3 isShared])
  {
    int v5 = 2;
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)_getSetPropertyStringTask:(id)a3 forName:(id)a4 andNamespace:(id)a5 forCalendar:(id)a6 atURL:(id)a7
{
  return [(CalDAVCalendarPropertyRefreshOperation *)self _getSetPropertyStringTask:a3 forName:a4 andNamespace:a5 forCalendar:a6 atURL:a7 ignoreErrors:0];
}

- (id)_getSetPropertyStringTask:(id)a3 forName:(id)a4 andNamespace:(id)a5 forCalendar:(id)a6 atURL:(id)a7 ignoreErrors:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = (objc_class *)MEMORY[0x263F34AF8];
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  __int16 v20 = (void *)[[v14 alloc] initWithNameSpace:v17 andName:v18];

  [v20 setPayloadAsString:v19];
  __int16 v21 = [(CalDAVCalendarPropertyRefreshOperation *)self _getSetPropertyTaskWithCoreDAVItem:v20 forCalendar:v16 atURL:v15 ignoreErrors:v8];

  return v21;
}

- (id)_getIsAffectingAvailabilityCoreDAVItem:(id)a3
{
  id v4 = a3;
  int v5 = [(CalDAVOperation *)self principal];
  id v6 = [v5 account];
  uint64_t v7 = [v6 serverVersion];
  int v8 = [v7 supportsAutoSchedule];

  id v9 = objc_alloc(MEMORY[0x263F34AF8]);
  uint64_t v10 = *MEMORY[0x263F34CD8];
  if (v8)
  {
    id v11 = (void *)[v9 initWithNameSpace:*MEMORY[0x263F34CD8] andName:*MEMORY[0x263F34F10]];
    id v12 = objc_alloc(MEMORY[0x263F34AF8]);
    int v13 = [v4 isAffectingAvailability];

    id v14 = (__CFString **)MEMORY[0x263F34ED0];
    if (!v13) {
      id v14 = (__CFString **)MEMORY[0x263F34F58];
    }
    id v15 = *v14;
    id v16 = v12;
    uint64_t v17 = v10;
  }
  else
  {
    id v11 = (void *)[v9 initWithNameSpace:*MEMORY[0x263F34CD8] andName:*MEMORY[0x263F34D00]];
    id v18 = objc_alloc(MEMORY[0x263F34AF8]);
    int v19 = [v4 isAffectingAvailability];

    if (v19) {
      id v15 = @"YES";
    }
    else {
      id v15 = @"NO";
    }
    id v16 = v18;
    uint64_t v17 = 0;
  }
  __int16 v20 = (void *)[v16 initWithNameSpace:v17 andName:v15];
  __int16 v21 = [v11 extraChildItems];
  [v21 addObject:v20];

  return v11;
}

- (id)_getSetIsAffectingAvailabilityTask:(BOOL)a3 forCalendar:(id)a4 atURL:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CalDAVCalendarPropertyRefreshOperation *)self _getIsAffectingAvailabilityCoreDAVItem:v8];
  uint64_t v10 = [(CalDAVCalendarPropertyRefreshOperation *)self _getSetPropertyTaskWithCoreDAVItem:v9 forCalendar:v8 atURL:v7];

  return v10;
}

- (id)_getSetPropertyTaskWithCoreDAVItem:(id)a3 forCalendar:(id)a4 atURL:(id)a5
{
  return [(CalDAVCalendarPropertyRefreshOperation *)self _getSetPropertyTaskWithCoreDAVItem:a3 forCalendar:a4 atURL:a5 ignoreErrors:0];
}

- (id)_getSetPropertyTaskWithCoreDAVItem:(id)a3 forCalendar:(id)a4 atURL:(id)a5 ignoreErrors:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc(MEMORY[0x263F34B88]);
  id v14 = [MEMORY[0x263EFFA08] setWithObject:v10];
  id v15 = (void *)[v13 initWithPropertiesToSet:v14 andRemove:0 atURL:v12];

  id v16 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v15 setAccountInfoProvider:v16];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v15);
  uint64_t v17 = [(CalDAVCalendarPropertyRefreshOperation *)self outstandingTasksGroup];
  dispatch_group_enter(v17);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __108__CalDAVCalendarPropertyRefreshOperation__getSetPropertyTaskWithCoreDAVItem_forCalendar_atURL_ignoreErrors___block_invoke;
  v21[3] = &unk_2641EC138;
  objc_copyWeak(&v24, &location);
  objc_copyWeak(&v25, &from);
  BOOL v26 = a6;
  void v21[4] = self;
  id v18 = v10;
  id v22 = v18;
  id v19 = v11;
  id v23 = v19;
  [v15 setCompletionBlock:v21];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v15;
}

void __108__CalDAVCalendarPropertyRefreshOperation__getSetPropertyTaskWithCoreDAVItem_forCalendar_atURL_ignoreErrors___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = (id *)(a1 + 64);
  id v4 = objc_loadWeakRetained((id *)(a1 + 64));
  int v5 = [v4 error];

  if (v5)
  {
    int v6 = *(unsigned __int8 *)(a1 + 72);
    id v7 = [MEMORY[0x263F34B30] sharedLogging];
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F34C60]));
    id v9 = [v7 logHandleForAccountInfoProvider:v8];

    if (v6)
    {
      if (v9)
      {
        id v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v11 = [*(id *)(a1 + 40) nameSpace];
          id v12 = [*(id *)(a1 + 40) name];
          id v13 = [v4 error];
          int v26 = 138543874;
          long long v27 = v11;
          __int16 v28 = 2114;
          v29 = v12;
          __int16 v30 = 2112;
          v31 = v13;
          _os_log_impl(&dword_213CEC000, v10, OS_LOG_TYPE_ERROR, "Got error (that we are ignoring) when attempting to set property %{public}@::%{public}@ on server: %@", (uint8_t *)&v26, 0x20u);
        }
      }
    }
    else
    {
      if (v9)
      {
        id v14 = v9;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v15 = [*(id *)(a1 + 40) nameSpace];
          id v16 = [*(id *)(a1 + 40) name];
          uint64_t v17 = [v4 error];
          int v26 = 138543874;
          long long v27 = v15;
          __int16 v28 = 2114;
          v29 = v16;
          __int16 v30 = 2112;
          v31 = v17;
          _os_log_impl(&dword_213CEC000, v14, OS_LOG_TYPE_ERROR, "Got error when attempting to set property %{public}@::%{public}@ on server: %@", (uint8_t *)&v26, 0x20u);
        }
      }

      [WeakRetained setForceClearCalendarHomeSyncToken:1];
    }
  }
  if (!*(unsigned char *)(a1 + 72) || ([v4 error], (id v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v19 = [WeakRetained delegate];
    char v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0) {
      goto LABEL_18;
    }
    id v18 = [WeakRetained delegate];
    __int16 v21 = [v4 error];
    [v18 calendarRefreshPropPatchFinishedWithError:v21 forCalendar:*(void *)(a1 + 48)];
  }
LABEL_18:
  id v22 = [*(id *)(a1 + 32) outstandingTasks];
  id v23 = objc_loadWeakRetained(v3);
  [v22 removeObject:v23];

  id v24 = [WeakRetained outstandingTasksGroup];

  if (v24)
  {
    id v25 = [WeakRetained outstandingTasksGroup];
    dispatch_group_leave(v25);
  }
}

- (id)_getSetPropertiesTaskWithItemsToSet:(id)a3 itemsToRemove:(id)a4 atURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)[objc_alloc(MEMORY[0x263F34B88]) initWithPropertiesToSet:v8 andRemove:v9 atURL:v10];
  id v12 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v11 setAccountInfoProvider:v12];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v11);
  id v13 = [(CalDAVCalendarPropertyRefreshOperation *)self outstandingTasksGroup];
  dispatch_group_enter(v13);

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __98__CalDAVCalendarPropertyRefreshOperation__getSetPropertiesTaskWithItemsToSet_itemsToRemove_atURL___block_invoke;
  v15[3] = &unk_2641EC160;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  v15[4] = self;
  [v11 setCompletionBlock:v15];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v11;
}

void __98__CalDAVCalendarPropertyRefreshOperation__getSetPropertiesTaskWithItemsToSet_itemsToRemove_atURL___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  uint64_t v2 = a1 + 6;
  id v3 = objc_loadWeakRetained(a1 + 6);
  id v4 = [v3 error];

  if (v4) {
    [WeakRetained setForceClearCalendarHomeSyncToken:1];
  }
  int v5 = [a1[4] outstandingTasks];
  id v6 = objc_loadWeakRetained(v2);
  [v5 removeObject:v6];

  id v7 = [WeakRetained outstandingTasksGroup];

  if (v7)
  {
    id v8 = [WeakRetained outstandingTasksGroup];
    dispatch_group_leave(v8);
  }
}

- (id)_generateTimeZoneString:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  int v5 = [v3 currentCalendar];
  id v6 = [MEMORY[0x263EFF910] date];
  id v7 = [v5 components:28 fromDate:v6];

  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263F886D8]), "initWithYear:month:day:", objc_msgSend(v7, "year") - 1, objc_msgSend(v7, "month"), objc_msgSend(v7, "day"));
  id v9 = (void *)[objc_alloc(MEMORY[0x263F88710]) initWithSystemTimeZone:v4 fromDate:v8 options:2];

  id v10 = objc_alloc_init(MEMORY[0x263F886B0]);
  id v11 = [MEMORY[0x263EFF980] arrayWithObject:v9];
  [v10 setComponents:v11];

  id v12 = (void *)[objc_alloc(MEMORY[0x263F886E8]) initWithCalendar:v10];
  id v13 = [v12 ICSStringWithOptions:0];

  return v13;
}

- (id)_getMkcalendarTaskGroupForCalendar:(id)a3
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_didMakeCalendars = 1;
  int v5 = [v4 calendarURL];

  if (!v5)
  {
    id v6 = [(CalDAVOperation *)self principal];
    id v7 = [v6 calendarHomeURL];
    id v8 = [v4 guid];
    id v9 = [v8 appendSlashIfNeeded];
    id v10 = [v7 URLByAppendingPathComponent:v9];
    [v4 setCalendarURL:v10];
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v12 = objc_alloc(MEMORY[0x263F34AF8]);
  uint64_t v13 = *MEMORY[0x263F34E10];
  v93 = (void *)[v12 initWithNameSpace:*MEMORY[0x263F34E10] andName:*MEMORY[0x263F34E18]];
  id v14 = [v4 title];
  [v93 setPayloadAsString:v14];

  [v11 addObject:v93];
  id v15 = objc_alloc(MEMORY[0x263F34AF8]);
  uint64_t v16 = *MEMORY[0x263F34F68];
  v92 = (void *)[v15 initWithNameSpace:*MEMORY[0x263F34F68] andName:*MEMORY[0x263F34D08]];
  id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v4, "order"));
  [v92 setPayloadAsString:v17];

  [v11 addObject:v92];
  id v18 = [v4 color];

  if (!v18)
  {
    v94 = 0;
    goto LABEL_7;
  }
  v94 = objc_alloc_init(CalDAVCalendarColorItem);
  id v19 = [v4 color];
  [(CalDAVCalendarColorItem *)v94 setColorString:v19];

  char v20 = [v4 symbolicColorName];

  if (!v20)
  {
LABEL_7:
    __int16 v21 = 0;
    goto LABEL_8;
  }
  __int16 v21 = objc_alloc_init(CalDAVCalendarColorItem);
  id v22 = [v4 color];
  [(CalDAVCalendarColorItem *)v21 setColorString:v22];

  id v23 = [v4 symbolicColorName];
  [(CalDAVCalendarColorItem *)v21 setSymbolicColorName:v23];

LABEL_8:
  if ([v4 isSubscribed]
    && [v4 conformsToProtocol:&unk_26C4F21B0])
  {
    id v24 = v4;
    id v25 = objc_alloc(MEMORY[0x263F34AF8]);
    int v26 = (void *)[v25 initWithNameSpace:v13 andName:*MEMORY[0x263F34EF8]];
    id v27 = objc_alloc(MEMORY[0x263F34AF8]);
    v87 = (void *)[v27 initWithNameSpace:v13 andName:*MEMORY[0x263F34DF0]];
    id v28 = objc_alloc(MEMORY[0x263F34AF8]);
    uint64_t v88 = *MEMORY[0x263F34DA8];
    v86 = objc_msgSend(v28, "initWithNameSpace:andName:");
    v29 = [v26 extraChildItems];
    [v29 addObject:v87];

    __int16 v30 = [v26 extraChildItems];
    [v30 addObject:v86];

    [v11 addObject:v26];
    id v31 = objc_alloc(MEMORY[0x263F34AF8]);
    v90 = (void *)[v31 initWithNameSpace:v88 andName:*MEMORY[0x263F34D78]];
    id v32 = objc_alloc(MEMORY[0x263F34AF8]);
    v91 = (void *)[v32 initWithNameSpace:v13 andName:*MEMORY[0x263F34E50]];
    id v33 = [v24 subscriptionURL];
    v85 = [v33 absoluteString];

    [v91 setPayloadAsString:v85];
    id v34 = [v90 extraChildItems];
    [v34 addObject:v91];

    [v11 addObject:v90];
    id v35 = objc_alloc(MEMORY[0x263F34AF8]);
    v89 = (void *)[v35 initWithNameSpace:v16 andName:*MEMORY[0x263F34EF0]];
    [v24 refreshInterval];
    double v37 = v36;
    [v24 refreshInterval];
    uint64_t v39 = (uint64_t)v38;
    if ((uint64_t)v38 < 0)
    {
      v40 = [MEMORY[0x263F34B30] sharedLogging];
      id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
      __int16 v42 = [v40 logHandleForAccountInfoProvider:WeakRetained];

      if (v42 && os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v102 = v24;
        __int16 v103 = 2048;
        unint64_t v104 = (unint64_t)v37;
        _os_log_impl(&dword_213CEC000, v42, OS_LOG_TYPE_ERROR, "The refresh interval specified for the [%@] calendar, which is about to be created, is too large.  It is currently: [%lu].  It will be set to 0.", buf, 0x16u);
      }

      uint64_t v39 = 0;
    }
    v43 = (void *)[objc_alloc(MEMORY[0x263F886F0]) initWithWeeks:0 days:0 hours:0 minutes:0 seconds:v39];
    v84 = [v43 ICSStringWithOptions:0];
    [v89 setPayloadAsString:v84];
    [v11 addObject:v89];
    if ([v24 hasAlarmFilter])
    {
      id v44 = objc_alloc(MEMORY[0x263F34AF8]);
      v45 = (void *)[v44 initWithNameSpace:v88 andName:*MEMORY[0x263F34D80]];
      [v11 addObject:v45];
    }
    if ([v24 hasAttachmentFilter])
    {
      id v46 = objc_alloc(MEMORY[0x263F34AF8]);
      uint64_t v47 = (void *)[v46 initWithNameSpace:v88 andName:*MEMORY[0x263F34D88]];
      [v11 addObject:v47];
    }
    if ([v24 hasTaskFilter])
    {
      id v48 = objc_alloc(MEMORY[0x263F34AF8]);
      v49 = (void *)[v48 initWithNameSpace:v88 andName:*MEMORY[0x263F34D90]];
      [v11 addObject:v49];
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v24 autoprovisioned])
    {
      v50 = (void *)[objc_alloc(MEMORY[0x263F34AF8]) initWithNameSpace:v16 andName:@"autoprovisioned"];
      [v11 addObject:v50];
    }
    if (objc_opt_respondsToSelector())
    {
      v51 = [v24 languageCode];
      BOOL v52 = v51 == 0;

      if (!v52)
      {
        id v53 = (void *)[objc_alloc(MEMORY[0x263F34AF8]) initWithNameSpace:v16 andName:@"language-code"];
        v54 = [v24 languageCode];
        [v53 setPayloadAsString:v54];

        [v11 addObject:v53];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      v55 = [v24 locationCode];
      BOOL v56 = v55 == 0;

      if (!v56)
      {
        id v57 = (void *)[objc_alloc(MEMORY[0x263F34AF8]) initWithNameSpace:v16 andName:@"location-code"];
        v58 = [v24 locationCode];
        [v57 setPayloadAsString:v58];

        [v11 addObject:v57];
      }
    }

    goto LABEL_40;
  }
  if ([v4 isSubscribed])
  {
    long long v59 = [MEMORY[0x263F34B30] sharedLogging];
    id v60 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
    long long v61 = [v59 logHandleForAccountInfoProvider:v60];

    if (v61 && os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v102 = v4;
      _os_log_impl(&dword_213CEC000, v61, OS_LOG_TYPE_ERROR, "We have a calendar (%@) that claims to be a subscribed calendar, but doesn't implement CalDAVSubscribedCalendar.", buf, 0xCu);
    }
  }
  long long v62 = [v4 notes];
  BOOL v63 = [v62 length] == 0;

  long long v64 = (void *)MEMORY[0x263F34CD8];
  if (!v63)
  {
    id v65 = objc_alloc(MEMORY[0x263F34AF8]);
    long long v66 = (void *)[v65 initWithNameSpace:*v64 andName:*MEMORY[0x263F34CF8]];
    v67 = [v4 notes];
    [v66 setPayloadAsString:v67];

    [v11 addObject:v66];
  }
  uint64_t v68 = [(CalDAVCalendarPropertyRefreshOperation *)self _getIsAffectingAvailabilityCoreDAVItem:v4];
  [v11 addObject:v68];

  __int16 v69 = [v4 timeZone];
  LOBYTE(v68) = v69 == 0;

  if ((v68 & 1) == 0)
  {
    v70 = [v4 timeZone];
    id v24 = [(CalDAVCalendarPropertyRefreshOperation *)self _generateTimeZoneString:v70];

    id v71 = objc_alloc(MEMORY[0x263F34AF8]);
    int v26 = (void *)[v71 initWithNameSpace:*v64 andName:*MEMORY[0x263F34DB0]];
    [v26 setPayloadAsString:v24];
    [v11 addObject:v26];
LABEL_40:
  }
  id v72 = v11;
  __int16 v73 = v72;
  if (v21)
  {
    int v74 = [v72 setByAddingObject:v21];

    if (v94)
    {
      __int16 v75 = objc_msgSend(v73, "setByAddingObject:");
      goto LABEL_48;
    }
    goto LABEL_46;
  }
  if (v94)
  {
    int v74 = objc_msgSend(v72, "setByAddingObject:");

LABEL_46:
    __int16 v75 = 0;
    goto LABEL_48;
  }
  __int16 v75 = 0;
  int v74 = v72;
LABEL_48:
  id v76 = [CalDAVMkcalendarWithFallbackTaskGroup alloc];
  __int16 v77 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  id v78 = [(CoreDAVTaskGroup *)self taskManager];
  v79 = [v4 calendarURL];
  v80 = [(CalDAVMkcalendarWithFallbackTaskGroup *)v76 initWithAccountInfoProvider:v77 taskManager:v78 primaryPropertiesToSet:v74 fallbackPropertiesToSet:v75 atURL:v79];

  -[CalDAVMkcalendarWithFallbackTaskGroup setShouldSupportVEVENT:](v80, "setShouldSupportVEVENT:", [v4 isEventContainer]);
  -[CalDAVMkcalendarWithFallbackTaskGroup setShouldSupportVTODO:](v80, "setShouldSupportVTODO:", [v4 isTaskContainer]);
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v80);
  uint64_t v81 = [(CalDAVCalendarPropertyRefreshOperation *)self outstandingTasksGroup];
  dispatch_group_enter(v81);

  v95[0] = MEMORY[0x263EF8330];
  v95[1] = 3221225472;
  v95[2] = __77__CalDAVCalendarPropertyRefreshOperation__getMkcalendarTaskGroupForCalendar___block_invoke;
  v95[3] = &unk_2641EC188;
  objc_copyWeak(&v98, (id *)buf);
  objc_copyWeak(&v99, &location);
  id v82 = v4;
  id v96 = v82;
  v97 = self;
  [(CoreDAVTaskGroup *)v80 setCompletionBlock:v95];

  objc_destroyWeak(&v99);
  objc_destroyWeak(&v98);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v80;
}

void __77__CalDAVCalendarPropertyRefreshOperation__getMkcalendarTaskGroupForCalendar___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [v2 error];

  if (v3)
  {
    if ([WeakRetained _handleMkCalTaskGroupError:v2 forCalendar:*(void *)(a1 + 32)]) {
      [WeakRetained _retryMkCalForCalendar:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v4 = [WeakRetained delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [WeakRetained delegate];
      id v7 = [*(id *)(a1 + 40) principal];
      [v6 calendarRefreshMkCalendarSucceededForPrincipal:v7 calendar:*(void *)(a1 + 32)];
    }
  }
  id v8 = [WeakRetained outstandingTaskGroups];
  [v8 removeObject:v2];

  id v9 = [WeakRetained outstandingTasksGroup];

  if (v9)
  {
    id v10 = [WeakRetained outstandingTasksGroup];
    dispatch_group_leave(v10);
  }
}

- (BOOL)_handleMkCalTaskGroupError:(id)a3 forCalendar:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 error];
  id v9 = [MEMORY[0x263F34B30] sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
  id v11 = [v9 logHandleForAccountInfoProvider:WeakRetained];

  if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_213CEC000, v11, OS_LOG_TYPE_ERROR, "Encountered an error while creating a calendar. error = %@; failing calendar = %@; failing task group = %@",
      (uint8_t *)&v16,
      0x20u);
  }

  id v12 = [(CoreDAVTaskGroup *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = [(CalDAVOperation *)self principal];
    char v14 = [v12 calendarRefreshShouldRetryMkCalendarForPrincipal:v13 calendar:v7 error:v8];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (void)_retryMkCalForCalendar:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [MEMORY[0x263F34B30] sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
  id v7 = [v5 logHandleForAccountInfoProvider:WeakRetained];

  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_213CEC000, v7, OS_LOG_TYPE_DEFAULT, "Retrying mkcalendar for calendar %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = [(CalDAVCalendarPropertyRefreshOperation *)self _getMkcalendarTaskGroupForCalendar:v4];
  id v9 = [(CalDAVOperation *)self outstandingTaskGroups];
  [v9 addObject:v8];

  [v8 startTaskGroup];
}

- (void)_initializePrincipalCalendarCache
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = [(CalDAVOperation *)self principal];
  id v4 = [v3 calendars];

  char v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  pathToLocalCalendar = self->_pathToLocalCalendar;
  self->_pathToLocalCalendar = v5;

  id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  localCalendarsWithNoPath = self->_localCalendarsWithNoPath;
  self->_localCalendarsWithNoPath = v7;

  self->_int nextCalendarOrder = -1;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        int nextCalendarOrder = self->_nextCalendarOrder;
        int v15 = [v13 order];
        if (nextCalendarOrder <= v15) {
          int v16 = v15;
        }
        else {
          int v16 = nextCalendarOrder;
        }
        self->_int nextCalendarOrder = v16;
        id v17 = [v13 calendarURL];

        if (v17)
        {
          __int16 v18 = self->_pathToLocalCalendar;
          id v19 = [v13 calendarURL];
          __int16 v20 = [v19 absoluteString];
          id v21 = [v20 appendSlashIfNeeded];
          [(NSMutableDictionary *)v18 setObject:v13 forKey:v21];
        }
        else
        {
          [(NSMutableSet *)self->_localCalendarsWithNoPath addObject:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  ++self->_nextCalendarOrder;
  uint64_t v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  ctags = self->_ctags;
  self->_ctags = v22;

  id v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  syncTokens = self->_syncTokens;
  self->_syncTokens = v24;
}

- (BOOL)_handleUpdateForCalendar:(id)a3
{
  uint64_t v335 = *MEMORY[0x263EF8340];
  id v4 = a3;
  val = self;
  v314 = [(CalDAVOperation *)self principal];
  if (([v4 isScheduleInbox] & 1) != 0
    || ([v4 isScheduleOutbox] & 1) != 0
    || ([v4 isNotification] & 1) != 0
    || ([v4 isSubscribed] & 1) != 0
    || [v4 isPollContainer])
  {
    char v5 = [(CoreDAVTaskGroup *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(CoreDAVTaskGroup *)val delegate];
      [v7 calendarRefreshFoundUpdatedSpecialContainer:v4];
    }
    [v4 isCalendar];
  }
  else if (([v4 isCalendar] & 1) == 0)
  {
    v312 = [MEMORY[0x263F34B30] sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
    long long v29 = [v312 logHandleForAccountInfoProvider:WeakRetained];

    if (v29)
    {
      long long v29 = v29;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v80 = [v4 url];
        *(_DWORD *)buf = 138412290;
        uint64_t v331 = (uint64_t)v80;
        _os_log_impl(&dword_213CEC000, v29, OS_LOG_TYPE_DEBUG, "Skipping special non-calendar container at %@", buf, 0xCu);
      }
    }
    goto LABEL_127;
  }
  id v8 = [v4 ctag];

  if (v8)
  {
    ctags = val->_ctags;
    uint64_t v10 = [v4 ctag];
    uint64_t v11 = [v4 url];
    uint64_t v12 = [v11 absoluteString];
    uint64_t v13 = [v12 appendSlashIfNeeded];
    [(NSMutableDictionary *)ctags setObject:v10 forKey:v13];
  }
  char v14 = [v4 syncToken];

  if (v14)
  {
    syncTokens = val->_syncTokens;
    int v16 = [v4 syncToken];
    id v17 = [v4 url];
    __int16 v18 = [v17 absoluteString];
    id v19 = [v18 appendSlashIfNeeded];
    [(NSMutableDictionary *)syncTokens setObject:v16 forKey:v19];
  }
  v312 = [v4 privileges];
  if (v312)
  {
    unsigned int v20 = [v4 hasWriteContentPrivileges];
    unsigned int v21 = [v4 hasWritePropertiesPrivileges];
  }
  else
  {
    unsigned int v20 = [v314 isWritable];
    unsigned int v21 = [v314 isWritable];
  }
  unsigned int v22 = v21;
  if (([v4 isScheduleInbox] & 1) != 0
    || ([v4 isScheduleOutbox] & 1) != 0
    || ([v4 isNotification] & 1) != 0
    || (unsigned int v311 = v22, [v4 isPollContainer]))
  {
    unsigned int v311 = 0;
  }
  if ([v4 isEventContainer]) {
    int v23 = [v4 isTaskContainer] ^ 1;
  }
  else {
    int v23 = 0;
  }
  if ([v4 isEventContainer])
  {
    int v24 = 0;
    if (!v23) {
      goto LABEL_29;
    }
  }
  else
  {
    int v24 = [v4 isTaskContainer];
    if (!v23) {
      goto LABEL_29;
    }
  }
  if (([v314 isEnabledForEvents] & 1) == 0)
  {
    long long v61 = [MEMORY[0x263F34B30] sharedLogging];
    id v62 = objc_loadWeakRetained((id *)((char *)&val->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
    BOOL v63 = [v61 logHandleForAccountInfoProvider:v62];

    if (v63)
    {
      long long v64 = v63;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        id v65 = [v4 url];
        *(_DWORD *)buf = 138412290;
        uint64_t v331 = (uint64_t)v65;
        _os_log_impl(&dword_213CEC000, v64, OS_LOG_TYPE_DEBUG, "Skipping event-only container at %@", buf, 0xCu);
      }
    }

    long long v66 = [(CoreDAVTaskGroup *)val delegate];
    char v67 = objc_opt_respondsToSelector();

    if ((v67 & 1) == 0) {
      goto LABEL_121;
    }
    goto LABEL_77;
  }
LABEL_29:
  if (v24 && ([v314 isEnabledForTodos] & 1) == 0)
  {
    uint64_t v68 = [MEMORY[0x263F34B30] sharedLogging];
    id v69 = objc_loadWeakRetained((id *)((char *)&val->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
    v70 = [v68 logHandleForAccountInfoProvider:v69];

    if (v70)
    {
      id v71 = v70;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        id v72 = [v4 url];
        *(_DWORD *)buf = 138412290;
        uint64_t v331 = (uint64_t)v72;
        _os_log_impl(&dword_213CEC000, v71, OS_LOG_TYPE_DEBUG, "Skipping todo-only container at %@", buf, 0xCu);
      }
    }

    __int16 v73 = [(CoreDAVTaskGroup *)val delegate];
    char v74 = objc_opt_respondsToSelector();

    if ((v74 & 1) == 0) {
      goto LABEL_121;
    }
LABEL_77:
    long long v29 = [(CoreDAVTaskGroup *)val delegate];
    [v29 calendarRefreshFoundUpdatedContainerWithIgnoredEntityType:v4];
LABEL_127:
    BOOL v104 = 0;
    goto LABEL_325;
  }
  if ([v4 isJournalContainer]
    && ([v4 isEventContainer] & 1) == 0
    && ([v4 isTaskContainer] & 1) == 0)
  {
    long long v29 = [MEMORY[0x263F34B30] sharedLogging];
    id v75 = objc_loadWeakRetained((id *)((char *)&val->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
    id v76 = [v29 logHandleForAccountInfoProvider:v75];

    if (v76)
    {
      __int16 v77 = v76;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      {
        id v78 = [v4 url];
        *(_DWORD *)buf = 138412290;
        uint64_t v331 = (uint64_t)v78;
        _os_log_impl(&dword_213CEC000, v77, OS_LOG_TYPE_DEBUG, "Skipping over VJOURNAL-only container at %@", buf, 0xCu);
      }
    }

    goto LABEL_127;
  }
  unsigned int v309 = v22;
  unsigned int v310 = v20;
  pathToLocalCalendar = val->_pathToLocalCalendar;
  int v26 = [v4 url];
  long long v27 = [v26 absoluteString];
  long long v28 = [v27 appendSlashIfNeeded];
  long long v29 = [(NSMutableDictionary *)pathToLocalCalendar objectForKey:v28];

  if (v29) {
    goto LABEL_115;
  }
  if (![v314 isMergeSync]) {
    goto LABEL_70;
  }
  long long v30 = [MEMORY[0x263F34B30] sharedLogging];
  id location = (id *)((char *)&val->super.super.super.isa + (int)*MEMORY[0x263F34C60]);
  id v31 = objc_loadWeakRetained(location);
  uint64_t v32 = [v30 logHandleForAccountInfoProvider:v31];

  if (v32)
  {
    id v33 = v32;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      id v34 = [v4 containerTitle];
      *(_DWORD *)buf = 138412290;
      uint64_t v331 = (uint64_t)v34;
      _os_log_impl(&dword_213CEC000, v33, OS_LOG_TYPE_INFO, "This is a merge sync, so we'll try to identity match this calendar: %@", buf, 0xCu);
    }
  }

  long long v328 = 0u;
  long long v329 = 0u;
  long long v327 = 0u;
  long long v326 = 0u;
  id v35 = val->_localCalendarsWithNoPath;
  uint64_t v36 = [(NSMutableSet *)v35 countByEnumeratingWithState:&v326 objects:v334 count:16];
  if (!v36)
  {
LABEL_64:

    goto LABEL_65;
  }
  uint64_t v37 = *(void *)v327;
  uint64_t v313 = 138412546;
LABEL_42:
  uint64_t v38 = 0;
  while (1)
  {
    if (*(void *)v327 != v37) {
      objc_enumerationMutation(v35);
    }
    uint64_t v39 = *(void **)(*((void *)&v326 + 1) + 8 * v38);
    v40 = [v4 containerTitle];
    if (![v40 length]) {
      goto LABEL_61;
    }
    v41 = [v4 containerTitle];
    __int16 v42 = [v39 title];
    BOOL v43 = [v41 caseInsensitiveCompare:v42] == 0;

    if (v43) {
      break;
    }
LABEL_62:
    if (v36 == ++v38)
    {
      uint64_t v36 = [(NSMutableSet *)v35 countByEnumeratingWithState:&v326 objects:v334 count:16];
      if (v36) {
        goto LABEL_42;
      }
      goto LABEL_64;
    }
  }
  int v44 = [v39 isEventContainer];
  if (v44 != [v4 isEventContainer] && !objc_msgSend(v4, "isEventContainer")
    || (int v45 = [v39 isTaskContainer], v45 != objc_msgSend(v4, "isTaskContainer"))
    && ![v4 isTaskContainer]
    || (int v46 = [v39 isScheduleInbox], v46 != objc_msgSend(v4, "isScheduleInbox"))
    || (int v47 = [v39 isNotification], v47 != objc_msgSend(v4, "isNotification"))
    || (int v48 = [v39 isSubscribed], v48 != objc_msgSend(v4, "isSubscribed"))
    || ([v4 isScheduleOutbox] & 1) != 0
    || ([v4 isSubscribed] & 1) != 0)
  {
    v40 = [MEMORY[0x263F34B30] sharedLogging];
    id v49 = objc_loadWeakRetained(location);
    v50 = [v40 logHandleForAccountInfoProvider:v49];

    if (v50)
    {
      v51 = v50;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        BOOL v52 = [v39 title];
        id v53 = [v4 containerTitle];
        *(_DWORD *)buf = 138412546;
        uint64_t v331 = (uint64_t)v52;
        __int16 v332 = 2112;
        v333 = v53;
        _os_log_impl(&dword_213CEC000, v51, OS_LOG_TYPE_INFO, "Found a calendar that matches based on title, but it doesn't support the same types. %@/%@", buf, 0x16u);
      }
    }

LABEL_61:
    goto LABEL_62;
  }
  uint64_t v81 = [MEMORY[0x263F34B30] sharedLogging];
  id v82 = objc_loadWeakRetained(location);
  v83 = [v81 logHandleForAccountInfoProvider:v82];

  if (v83)
  {
    v84 = v83;
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      v85 = [v39 title];
      v86 = [v4 containerTitle];
      *(_DWORD *)buf = 138412546;
      uint64_t v331 = (uint64_t)v85;
      __int16 v332 = 2112;
      v333 = v86;
      _os_log_impl(&dword_213CEC000, v84, OS_LOG_TYPE_INFO, "Merged local calendar %@ with remote calendar %@", buf, 0x16u);
    }
  }

  long long v29 = v39;
  -[NSObject setIsEventContainer:](v29, "setIsEventContainer:", [v4 isEventContainer]);
  -[NSObject setIsTaskContainer:](v29, "setIsTaskContainer:", [v4 isTaskContainer]);
  v87 = [v4 url];
  [v29 setCalendarURL:v87];

  if (v29)
  {
    [(NSMutableSet *)val->_localCalendarsWithNoPath removeObject:v29];
    uint64_t v88 = [MEMORY[0x263F34B30] sharedLogging];
    id v89 = objc_loadWeakRetained(location);
    v90 = [v88 logHandleForAccountInfoProvider:v89];

    if (v90)
    {
      v91 = v90;
      if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
      {
        v92 = [v4 url];
        localCalendarsWithNoPath = val->_localCalendarsWithNoPath;
        *(_DWORD *)buf = 138412546;
        uint64_t v331 = (uint64_t)v92;
        __int16 v332 = 2112;
        v333 = localCalendarsWithNoPath;
        _os_log_impl(&dword_213CEC000, v91, OS_LOG_TYPE_INFO, "Merged container at %@. The following calendars haven't matched yet: %@", buf, 0x16u);
      }
    }

    goto LABEL_115;
  }
LABEL_65:
  v54 = [MEMORY[0x263F34B30] sharedLogging];
  id v55 = objc_loadWeakRetained(location);
  BOOL v56 = [v54 logHandleForAccountInfoProvider:v55];

  if (v56)
  {
    id v57 = v56;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      v58 = [v4 url];
      long long v59 = val->_localCalendarsWithNoPath;
      *(_DWORD *)buf = 138412546;
      uint64_t v331 = (uint64_t)v58;
      __int16 v332 = 2112;
      v333 = v59;
      _os_log_impl(&dword_213CEC000, v57, OS_LOG_TYPE_INFO, "Didn't merge the container at %@. The following calendars haven't matched yet: %@", buf, 0x16u);
    }
  }

LABEL_70:
  if ([v4 isSubscribed])
  {
    uint64_t v60 = 4;
  }
  else if ([v4 isScheduleInbox])
  {
    uint64_t v60 = 1;
  }
  else if ([v4 isScheduleOutbox])
  {
    uint64_t v60 = 2;
  }
  else if ([v4 isNotification])
  {
    uint64_t v60 = 3;
  }
  else if ([v4 isPollContainer])
  {
    uint64_t v60 = 5;
  }
  else
  {
    uint64_t v60 = 0;
  }
  v94 = [v4 url];
  long long v29 = [v314 calendarOfType:v60 atURL:v94 withOptions:0];

  if (!v29)
  {
LABEL_121:
    BOOL v104 = 0;
    goto LABEL_326;
  }
  CFUUIDRef v95 = CFUUIDCreate(0);
  id v96 = (__CFString *)CFUUIDCreateString(0, v95);
  [v29 setGuid:v96];

  CFRelease(v95);
  v97 = [v4 url];
  [v29 setCalendarURL:v97];

  -[NSObject setIsEnabled:](v29, "setIsEnabled:", [v314 isEnabled]);
  -[NSObject setIsEditable:](v29, "setIsEditable:", v310 & ~[v4 isSubscribed]);
  [v29 setIsRenameable:v309];
  -[NSObject setIsEventContainer:](v29, "setIsEventContainer:", [v4 isEventContainer]);
  -[NSObject setIsTaskContainer:](v29, "setIsTaskContainer:", [v4 isTaskContainer]);
  -[NSObject setIsSubscribed:](v29, "setIsSubscribed:", [v4 isSubscribed]);
  -[NSObject setIsScheduleInbox:](v29, "setIsScheduleInbox:", [v4 isScheduleInbox]);
  -[NSObject setIsScheduleOutbox:](v29, "setIsScheduleOutbox:", [v4 isScheduleOutbox]);
  -[NSObject setIsPoll:](v29, "setIsPoll:", [v4 isPollContainer]);
  -[NSObject setIsNotification:](v29, "setIsNotification:", [v4 isNotification]);
  id v98 = [v4 publishURL];
  [v29 setPublishURL:v98];

  id v99 = [v4 prePublishURL];
  [v29 setPrePublishURL:v99];

  [v29 setSharingStatus:[(CalDAVCalendarPropertyRefreshOperation *)val _sharingStatusForContainer:v4]];
LABEL_115:
  v100 = [(CoreDAVTaskGroup *)val delegate];
  char v101 = objc_opt_respondsToSelector();

  if (v101)
  {
    id v102 = [(CoreDAVTaskGroup *)val delegate];
    [v102 calendarRefreshWillRefreshCalendar:v29];
  }
  if (![v4 isSubscribed]) {
    goto LABEL_185;
  }
  if (([v29 conformsToProtocol:&unk_26C4F21B0] & 1) == 0)
  {
    uint64_t v105 = [MEMORY[0x263F34B30] sharedLogging];
    id v106 = objc_loadWeakRetained((id *)((char *)&val->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
    v107 = [v105 logHandleForAccountInfoProvider:v106];

    if (v107)
    {
      v108 = v107;
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      {
        uint64_t v109 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v331 = v109;
        _os_log_impl(&dword_213CEC000, v108, OS_LOG_TYPE_ERROR, "Expected a subscribed calendar, but this doesn't look like one: %{public}@", buf, 0xCu);
      }
    }
    [v29 setIsSubscribed:1];
    goto LABEL_127;
  }
  if (v311) {
    int v103 = [v29 wasModifiedLocally];
  }
  else {
    int v103 = 0;
  }
  id v110 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v111 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v112 = v29;
  v113 = [v112 subscriptionURL];
  if (!v113) {
    goto LABEL_132;
  }
  v114 = [v112 subscriptionURL];
  v115 = [v4 source];
  int v116 = [v114 isEqual:v115];

  if ((v103 & ~v116) != 0)
  {
    id v117 = objc_alloc(MEMORY[0x263F34AF8]);
    v118 = (void *)[v117 initWithNameSpace:*MEMORY[0x263F34DA8] andName:*MEMORY[0x263F34D78]];
    id v119 = objc_alloc(MEMORY[0x263F34AF8]);
    v120 = (void *)[v119 initWithNameSpace:*MEMORY[0x263F34E10] andName:*MEMORY[0x263F34E50]];
    v121 = [v112 subscriptionURL];
    v122 = [v121 absoluteString];

    [v120 setPayloadAsString:v122];
    v123 = [v118 extraChildItems];
    [v123 addObject:v120];

    [v110 addObject:v118];
  }
  else
  {
LABEL_132:
    v118 = [v4 source];
    [v112 setSubscriptionURL:v118];
  }

  int v124 = [v112 hasAlarmFilter];
  if (((v124 ^ [v4 subscribedStripAlarms]) & v103) == 1)
  {
    id v125 = objc_alloc(MEMORY[0x263F34AF8]);
    v126 = (void *)[v125 initWithNameSpace:*MEMORY[0x263F34DA8] andName:*MEMORY[0x263F34D80]];
    if ([v112 hasAlarmFilter]) {
      v127 = v110;
    }
    else {
      v127 = v111;
    }
    [v127 addObject:v126];
  }
  else
  {
    -[NSObject setHasAlarmFilter:](v112, "setHasAlarmFilter:", [v4 subscribedStripAlarms]);
  }
  int v128 = [v112 hasAttachmentFilter];
  if (((v128 ^ [v4 subscribedStripAttachments]) & v103) == 1)
  {
    id v129 = objc_alloc(MEMORY[0x263F34AF8]);
    v130 = (void *)[v129 initWithNameSpace:*MEMORY[0x263F34DA8] andName:*MEMORY[0x263F34D88]];
    if ([v112 hasAttachmentFilter]) {
      v131 = v110;
    }
    else {
      v131 = v111;
    }
    [v131 addObject:v130];
  }
  else
  {
    -[NSObject setHasAttachmentFilter:](v112, "setHasAttachmentFilter:", [v4 subscribedStripAttachments]);
  }
  int v132 = [v112 hasTaskFilter];
  if (((v132 ^ [v4 subscribedStripTodos]) & v103) == 1)
  {
    id v133 = objc_alloc(MEMORY[0x263F34AF8]);
    v134 = (void *)[v133 initWithNameSpace:*MEMORY[0x263F34DA8] andName:*MEMORY[0x263F34D90]];
    if ([v112 hasTaskFilter]) {
      v135 = v110;
    }
    else {
      v135 = v111;
    }
    [v135 addObject:v134];
    v136 = [v112 subscriptionURL];
    v137 = [v136 absoluteString];
    [v134 setPayloadAsString:v137];
  }
  else
  {
    -[NSObject setHasTaskFilter:](v112, "setHasTaskFilter:", [v4 subscribedStripTodos]);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (int v138 = [v112 autoprovisioned],
        ((v138 ^ [v4 autoprovisioned]) & v103) == 1))
  {
    id v139 = objc_alloc(MEMORY[0x263F34AF8]);
    v140 = (void *)[v139 initWithNameSpace:*MEMORY[0x263F34F68] andName:@"autoprovisioned"];
    if ([v112 autoprovisioned]) {
      v141 = v110;
    }
    else {
      v141 = v111;
    }
    [v141 addObject:v140];
    v142 = [v112 subscriptionURL];
    v143 = [v142 absoluteString];
    [v140 setPayloadAsString:v143];
  }
  else if (objc_opt_respondsToSelector())
  {
    -[NSObject setAutoprovisioned:](v112, "setAutoprovisioned:", [v4 autoprovisioned]);
  }
  if (objc_opt_respondsToSelector())
  {
    v144 = [v112 locationCode];
    if (v144)
    {
      v145 = [v112 locationCode];
      v146 = [v4 locationCode];
      int v147 = [v145 isEqualToString:v146];

      if ((v103 & ~v147) != 0)
      {
        id v148 = objc_alloc(MEMORY[0x263F34AF8]);
        v149 = (void *)[v148 initWithNameSpace:*MEMORY[0x263F34F68] andName:@"location-code"];
        v150 = [v112 locationCode];
        [v149 setPayloadAsString:v150];

        [v110 addObject:v149];
        goto LABEL_165;
      }
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v149 = [v4 locationCode];
    [v112 setLocationCode:v149];
LABEL_165:
  }
  if (objc_opt_respondsToSelector())
  {
    v151 = [v112 languageCode];
    if (v151)
    {
      v152 = [v112 languageCode];
      v153 = [v4 languageCode];
      int v154 = [v152 isEqualToString:v153];

      if ((v103 & ~v154) != 0)
      {
        id v155 = objc_alloc(MEMORY[0x263F34AF8]);
        v156 = (void *)[v155 initWithNameSpace:*MEMORY[0x263F34F68] andName:@"language-code"];
        v157 = [v112 languageCode];
        [v156 setPayloadAsString:v157];

        [v110 addObject:v156];
        goto LABEL_172;
      }
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v156 = [v4 languageCode];
    [v112 setLanguageCode:v156];
LABEL_172:
  }
  v158 = [v4 subscribedRefreshRate];
  BOOL v159 = v158 == 0;

  if (v159)
  {
    if (!v103) {
      goto LABEL_181;
    }
LABEL_180:
    id v165 = objc_alloc(MEMORY[0x263F34AF8]);
    v166 = (void *)[v165 initWithNameSpace:*MEMORY[0x263F34F68] andName:*MEMORY[0x263F34EF0]];
    id v167 = objc_alloc(MEMORY[0x263F886F0]);
    [v112 refreshInterval];
    v169 = (void *)[v167 initWithWeeks:0 days:0 hours:0 minutes:0 seconds:(uint64_t)v168];
    v170 = [v169 ICSStringWithOptions:0];
    [v166 setPayloadAsString:v170];
    [v110 addObject:v166];

    goto LABEL_181;
  }
  v160 = [v4 subscribedRefreshRate];
  [v160 timeInterval];
  double v162 = v161;

  [v112 refreshInterval];
  if (v163 == v162) {
    char v164 = 0;
  }
  else {
    char v164 = v103;
  }
  if (v164) {
    goto LABEL_180;
  }
  [v112 setRefreshInterval:v162];
LABEL_181:
  if ([v110 count] || objc_msgSend(v111, "count"))
  {
    v171 = [v4 url];
    v172 = [(CalDAVCalendarPropertyRefreshOperation *)val _getSetPropertiesTaskWithItemsToSet:v110 itemsToRemove:v111 atURL:v171];

    v173 = [(CoreDAVTaskGroup *)val outstandingTasks];
    [v173 addObject:v172];

    v174 = [(CoreDAVTaskGroup *)val taskManager];
    [v174 submitQueuedCoreDAVTask:v172];
  }
LABEL_185:
  int v175 = [v4 isScheduleTransparent];
  uint64_t v176 = [v29 isAffectingAvailability];
  if (v175 == v176)
  {
    int v177 = [v29 wasModifiedLocally];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (v311 & v177 & [v29 needsIsAffectingAvailabilityUpdate]) == 1)
    {
      v178 = [v4 url];
      v179 = [(CalDAVCalendarPropertyRefreshOperation *)val _getSetIsAffectingAvailabilityTask:v176 forCalendar:v29 atURL:v178];

      v180 = [(CoreDAVTaskGroup *)val outstandingTasks];
      [v180 addObject:v179];

      v181 = [(CoreDAVTaskGroup *)val taskManager];
      [v181 submitQueuedCoreDAVTask:v179];
    }
    else
    {
      [v29 setIsAffectingAvailability:v175 ^ 1u];
    }
  }
  int v182 = [v29 isManagedByServer];
  if (v182 != [v4 isCalendar]) {
    -[NSObject setIsManagedByServer:](v29, "setIsManagedByServer:", [v4 isCalendar]);
  }
  v183 = [v4 pushKey];
  v184 = [v29 pushKey];
  if (v183 == v184)
  {

LABEL_196:
  }
  else
  {
    v185 = [v4 pushKey];
    v186 = [v29 pushKey];
    char v187 = [v185 isEqualToString:v186];

    if ((v187 & 1) == 0)
    {
      v183 = [v4 pushKey];
      [v29 setPushKey:v183];
      goto LABEL_196;
    }
  }
  int v188 = [v4 isEventContainer];
  if (v188 != [v29 isEventContainer]) {
    -[NSObject setIsEventContainer:](v29, "setIsEventContainer:", [v4 isEventContainer]);
  }
  int v189 = [v4 isTaskContainer];
  if (v189 != [v29 isTaskContainer]) {
    -[NSObject setIsTaskContainer:](v29, "setIsTaskContainer:", [v4 isTaskContainer]);
  }
  if (v310 != -[NSObject isEditable](v29, "isEditable") && ([v4 isSubscribed] & 1) == 0) {
    [v29 setIsEditable:v310];
  }
  if (v309 != [v29 isRenameable]) {
    -[NSObject setIsRenameable:](v29, "setIsRenameable:");
  }
  v190 = [v29 bulkRequests];
  v191 = [v4 bulkRequests];
  if (v190 == v191)
  {

LABEL_210:
  }
  else
  {
    v192 = [v29 bulkRequests];
    v193 = [v4 bulkRequests];
    char v194 = [v192 isEqualToDictionary:v193];

    if ((v194 & 1) == 0)
    {
      v190 = [v4 bulkRequests];
      [v29 setBulkRequests:v190];
      goto LABEL_210;
    }
  }
  v195 = [v4 containerTitle];
  if (![v195 length])
  {

    goto LABEL_216;
  }
  v191 = [v4 containerTitle];
  v196 = [v29 title];
  if (v191 == v196)
  {

LABEL_230:
    goto LABEL_231;
  }
  v197 = [v4 containerTitle];
  v198 = [v29 title];
  char v199 = [v197 isEqualToString:v198];

  if ((v199 & 1) == 0)
  {
LABEL_216:
    char v200 = [v29 wasModifiedLocally];
    if ((v200 & 1) == 0)
    {
      v191 = [v4 containerTitle];
      if ([v191 length])
      {

LABEL_229:
        v195 = [v4 containerTitle];
        [v29 setTitle:v195];
        goto LABEL_230;
      }
    }
    if (v311 && ([v4 isCalendar] & 1) == 0)
    {
      unsigned int v201 = [v4 isSubscribed];
      if (v200)
      {
LABEL_222:
        if (!v201) {
          goto LABEL_229;
        }
LABEL_223:
        v202 = [v29 title];

        if (!v202)
        {
          v203 = [v4 url];
          v204 = [v203 lastPathComponent];
          v205 = [v204 stringByURLUnquoting];
          [v29 setTitle:v205];
        }
        BOOL v206 = v202 == 0;
        v207 = [v29 title];
        v208 = [v4 url];
        v195 = [(CalDAVCalendarPropertyRefreshOperation *)val _getSetPropertyStringTask:v207 forName:*MEMORY[0x263F34E18] andNamespace:*MEMORY[0x263F34E10] forCalendar:v29 atURL:v208 ignoreErrors:v206];

        v209 = [(CoreDAVTaskGroup *)val outstandingTasks];
        [v209 addObject:v195];

        v210 = [(CoreDAVTaskGroup *)val taskManager];
        [v210 submitQueuedCoreDAVTask:v195];

        goto LABEL_230;
      }
    }
    else
    {
      unsigned int v201 = v311;
      if (v200) {
        goto LABEL_222;
      }
    }

    if ((v201 & 1) == 0) {
      goto LABEL_229;
    }
    goto LABEL_223;
  }
LABEL_231:
  v211 = [v4 calendarDescription];
  uint64_t v212 = [v211 length];
  if (v212)
  {
    int v213 = 0;
    goto LABEL_233;
  }
  id location = [v29 notes];
  if (location)
  {
    uint64_t v313 = [v29 notes];
    if ([(id)v313 length])
    {

      goto LABEL_245;
    }
    int v213 = 1;
  }
  else
  {
    id location = 0;
    int v213 = 0;
  }
LABEL_233:
  v214 = [v4 calendarDescription];
  v215 = [v29 notes];
  if (v214 == v215)
  {
    int v219 = 0;
  }
  else
  {
    v216 = [v4 calendarDescription];
    v217 = [v29 notes];
    int v218 = [v216 isEqualToString:v217];

    int v219 = v218 ^ 1;
  }

  if (v213)
  {

    if (!v212) {
      goto LABEL_241;
    }
LABEL_244:

    if (v219) {
      goto LABEL_245;
    }
  }
  else
  {
    if (v212) {
      goto LABEL_244;
    }
LABEL_241:

    if (v219)
    {
LABEL_245:
      if (([v29 wasModifiedLocally] & v311) == 1)
      {
        v220 = [v29 notes];
        v221 = [v4 url];
        v222 = [(CalDAVCalendarPropertyRefreshOperation *)val _getSetPropertyStringTask:v220 forName:*MEMORY[0x263F34CF8] andNamespace:*MEMORY[0x263F34CD8] forCalendar:v29 atURL:v221];

        v223 = [(CoreDAVTaskGroup *)val outstandingTasks];
        [v223 addObject:v222];

        v224 = [(CoreDAVTaskGroup *)val taskManager];
        [v224 submitQueuedCoreDAVTask:v222];
      }
      else
      {
        v222 = [v4 calendarDescription];
        [v29 setNotes:v222];
      }
    }
  }
  v225 = (void *)MEMORY[0x263F886B8];
  v226 = [v29 color];
  v227 = [v4 calendarColor];
  v228 = [v29 symbolicColorName];
  v229 = [v4 symbolicColorName];
  unsigned int v230 = [v225 colorDetailsAreEffectivelyDifferentFirstColor:v226 secondColor:v227 firstSymbolicName:v228 secondSymbolicName:v229];

  v231 = [v4 calendarColor];
  if ([v231 length]) {
    uint64_t v232 = v230;
  }
  else {
    uint64_t v232 = 1;
  }

  if (!v232) {
    goto LABEL_265;
  }
  char v233 = [v29 wasModifiedLocally];
  if ((v233 & 1) == 0)
  {
    uint64_t v232 = [v4 calendarColor];
    if ([(id)v232 length]) {
      goto LABEL_262;
    }
  }
  v234 = [v29 color];
  v235 = v234;
  if (v234) {
    unsigned int v236 = v311;
  }
  else {
    unsigned int v236 = 0;
  }
  if (v236 != 1)
  {

    if (v233) {
      goto LABEL_263;
    }
LABEL_262:

    goto LABEL_263;
  }
  if ([v4 isCalendar]) {
    int v237 = 1;
  }
  else {
    int v237 = [v4 isSubscribed];
  }

  if ((v233 & 1) == 0)
  {

    if (v237) {
      goto LABEL_333;
    }
    goto LABEL_263;
  }
  if (!v237)
  {
LABEL_263:
    v238 = [v4 calendarColor];
    [v29 setColor:v238];

    v239 = [v4 symbolicColorName];
    [v29 setSymbolicColorName:v239];
    goto LABEL_264;
  }
LABEL_333:
  v294 = [v29 color];

  if (v294)
  {
    v295 = objc_alloc_init(CalDAVCalendarColorItem);
    v296 = [v29 color];
    [(CalDAVCalendarColorItem *)v295 setColorString:v296];

    v239 = [MEMORY[0x263EFFA08] setWithObject:v295];
    v297 = [v29 symbolicColorName];

    if (v297)
    {
      v298 = [v29 symbolicColorName];
      [(CalDAVCalendarColorItem *)v295 setSymbolicColorName:v298];

      v299 = objc_alloc_init(CalDAVCalendarColorItem);
      v300 = [v29 color];
      [(CalDAVCalendarColorItem *)v299 setColorString:v300];

      v301 = [MEMORY[0x263EFFA08] setWithObject:v299];
    }
    else
    {
      v301 = 0;
    }
  }
  else
  {
    v239 = 0;
    v301 = 0;
  }
  v302 = [CalDAVPropPatchWithFallbackTaskGroup alloc];
  v303 = [(CoreDAVTaskGroup *)val accountInfoProvider];
  v304 = [(CoreDAVTaskGroup *)val taskManager];
  v305 = [v4 url];
  v306 = [(CalDAVPropPatchWithFallbackTaskGroup *)v302 initWithAccountInfoProvider:v303 taskManager:v304 primaryPropertiesToSet:v239 fallbackPropertiesToSet:v301 atURL:v305];

  objc_initWeak((id *)buf, val);
  objc_initWeak(&from, v306);
  v307 = [(CalDAVCalendarPropertyRefreshOperation *)val outstandingTasksGroup];
  dispatch_group_enter(v307);

  v321[0] = MEMORY[0x263EF8330];
  v321[1] = 3221225472;
  v321[2] = __67__CalDAVCalendarPropertyRefreshOperation__handleUpdateForCalendar___block_invoke;
  v321[3] = &unk_2641EC160;
  objc_copyWeak(&v323, (id *)buf);
  objc_copyWeak(&v324, &from);
  v322 = v29;
  [(CoreDAVTaskGroup *)v306 setCompletionBlock:v321];
  v308 = [(CalDAVOperation *)val outstandingTaskGroups];
  [v308 addObject:v306];

  [(CalDAVPropPatchWithFallbackTaskGroup *)v306 startTaskGroup];
  objc_destroyWeak(&v324);
  objc_destroyWeak(&v323);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)buf);

LABEL_264:
LABEL_265:
  v240 = [v4 calendarOrder];
  if (v240)
  {
    v241 = [v4 calendarOrder];
    int v242 = [v241 intValue];
  }
  else
  {
    int v242 = -1;
  }

  if (v242 != [v29 order])
  {
    if ([v29 wasModifiedLocally])
    {
      if (!v311) {
        goto LABEL_287;
      }
LABEL_276:
      if (([v29 order] & 0x80000000) != 0
        || ![v29 order]
        && ([v4 calendarOrder],
            v244 = objc_claimAutoreleasedReturnValue(),
            BOOL v245 = v244 == 0,
            v244,
            v245))
      {
        ++val->_nextCalendarOrder;
        -[NSObject setOrder:](v29, "setOrder:");
      }
      v246 = [v4 calendarOrder];

      if (!v246)
      {
        v247 = [MEMORY[0x263F34B30] sharedLogging];
        id v248 = objc_loadWeakRetained((id *)((char *)&val->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
        v249 = [v247 logHandleForAccountInfoProvider:v248];

        if (v249)
        {
          v250 = v249;
          if (os_log_type_enabled(v250, OS_LOG_TYPE_ERROR))
          {
            v251 = [v29 title];
            int v252 = [v29 order];
            *(_DWORD *)buf = 138412546;
            uint64_t v331 = (uint64_t)v251;
            __int16 v332 = 1024;
            LODWORD(v333) = v252;
            _os_log_impl(&dword_213CEC000, v250, OS_LOG_TYPE_ERROR, "Calendar \"%@\" did not have a calendar-order set so we will try to set it to %d", buf, 0x12u);
          }
        }
      }
      BOOL v253 = v246 == 0;
      v254 = objc_msgSend(NSString, "stringWithFormat:", @"%u", -[NSObject order](v29, "order"));
      v255 = [v4 url];
      v256 = [(CalDAVCalendarPropertyRefreshOperation *)val _getSetPropertyStringTask:v254 forName:*MEMORY[0x263F34D08] andNamespace:*MEMORY[0x263F34F68] forCalendar:v29 atURL:v255 ignoreErrors:v253];

      v257 = [(CoreDAVTaskGroup *)val outstandingTasks];
      [v257 addObject:v256];

      v258 = [(CoreDAVTaskGroup *)val taskManager];
      [v258 submitQueuedCoreDAVTask:v256];

LABEL_289:
    }
    else
    {
      v243 = [v4 calendarOrder];
      if (v243)
      {

        goto LABEL_287;
      }
      if (v311) {
        goto LABEL_276;
      }
LABEL_287:
      if (([v29 isScheduleInbox] & 1) == 0)
      {
        v254 = [v4 calendarOrder];
        -[NSObject setOrder:](v29, "setOrder:", [v254 intValue]);
        goto LABEL_289;
      }
    }
  }
  [v29 setSharingStatus:[(CalDAVCalendarPropertyRefreshOperation *)val _sharingStatusForContainer:v4]];
  v259 = [v4 sharees];
  [v29 setSharees:v259];

  v260 = [v4 publishURL];
  v261 = [v29 publishURL];
  if (v260 == v261)
  {

LABEL_294:
  }
  else
  {
    v262 = [v4 publishURL];
    v263 = [v29 publishURL];
    char v264 = [v262 absoluteURLisEqual:v263];

    if ((v264 & 1) == 0)
    {
      v260 = [v4 publishURL];
      [v29 setPublishURL:v260];
      goto LABEL_294;
    }
  }
  v265 = [v4 publishURL];
  [v29 setIsPublished:v265 != 0];

  v266 = [v4 prePublishURL];
  [v29 setPrePublishURL:v266];

  int v267 = [v314 isMergeSync];
  v268 = [v4 owner];
  v269 = [v29 owner];
  if (v268 == v269)
  {
    int v272 = 0;
  }
  else
  {
    v270 = [v4 owner];
    v271 = [v29 owner];
    if ([v270 absoluteURLisEqual:v271])
    {
      int v272 = 0;
    }
    else
    {
      v273 = [v4 owner];
      int v274 = [v29 hasCalendarUserAddressEquivalentToURL:v273];

      int v272 = v274 ^ 1;
    }
  }
  if ((v272 | v267) == 1)
  {
    v275 = [v4 owner];
    if (v275)
    {
      v276 = [v4 owner];
      v277 = [v314 principalURL];
      if (v276 == v277)
      {

LABEL_307:
      }
      else
      {
        v278 = [v4 owner];
        v279 = [v314 principalURL];
        char v280 = [v278 absoluteURLisEqual:v279];

        if ((v280 & 1) == 0)
        {
          v281 = [CalDAVGetPrincipalEmailDetailsTaskGroup alloc];
          v282 = [(CoreDAVTaskGroup *)val accountInfoProvider];
          v283 = [v4 owner];
          v284 = [(CoreDAVTaskGroup *)val taskManager];
          v275 = [(CalDAVGetPrincipalEmailDetailsTaskGroup *)v281 initWithAccountInfoProvider:v282 principalURL:v283 taskManager:v284];

          [(CoreDAVTaskGroup *)v275 setDelegate:val];
          objc_initWeak((id *)buf, val);
          objc_initWeak(&from, v275);
          v285 = [(CalDAVCalendarPropertyRefreshOperation *)val outstandingTasksGroup];
          dispatch_group_enter(v285);

          v317[0] = MEMORY[0x263EF8330];
          v317[1] = 3221225472;
          v317[2] = __67__CalDAVCalendarPropertyRefreshOperation__handleUpdateForCalendar___block_invoke_375;
          v317[3] = &unk_2641EC160;
          objc_copyWeak(&v319, (id *)buf);
          objc_copyWeak(&v320, &from);
          v318 = v29;
          [(CoreDAVTaskGroup *)v275 setCompletionBlock:v317];
          v286 = [(CalDAVOperation *)val outstandingTaskGroups];
          [v286 addObject:v275];

          [(CalDAVGetPrincipalEmailDetailsTaskGroup *)v275 startTaskGroup];
          objc_destroyWeak(&v320);
          objc_destroyWeak(&v319);
          objc_destroyWeak(&from);
          objc_destroyWeak((id *)buf);
          goto LABEL_307;
        }
      }
    }
  }
  int v287 = [v4 canBePublished];
  if (v287 != [v29 canBePublished]) {
    -[NSObject setCanBePublished:](v29, "setCanBePublished:", [v4 canBePublished]);
  }
  int v288 = [v4 canBeShared];
  if (v288 != [v29 canBeShared]) {
    -[NSObject setCanBeShared:](v29, "setCanBeShared:", [v4 canBeShared]);
  }
  int v289 = [v4 isFamilyCalendar];
  if (v289 != [v29 isFamilyCalendar]) {
    -[NSObject setIsFamilyCalendar:](v29, "setIsFamilyCalendar:", [v4 isFamilyCalendar]);
  }
  int v290 = [v4 isMarkedUndeletable];
  if (v290 != [v29 isMarkedUndeletable]) {
    -[NSObject setIsMarkedUndeletable:](v29, "setIsMarkedUndeletable:", [v4 isMarkedUndeletable]);
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v291 = [v4 maxAttendees];
    if (v291 != [v29 maxAttendees]) {
      -[NSObject setMaxAttendees:](v29, "setMaxAttendees:", [v4 maxAttendees]);
    }
  }
  int v292 = [v4 isMarkedImmutableSharees];
  if (v292 != [v29 isMarkedImmutableSharees]) {
    -[NSObject setIsMarkedImmutableSharees:](v29, "setIsMarkedImmutableSharees:", [v4 isMarkedImmutableSharees]);
  }
  if ([v29 isScheduleInbox]) {
    [(CalDAVCalendarPropertyRefreshOperation *)val _updateDefaultSchedulingCalendarIfNeededForInboxCalendar:v29 withContainer:v4];
  }
  [(NSMutableSet *)val->_updatedCalendars addObject:v29];
  BOOL v104 = 1;
LABEL_325:

LABEL_326:
  return v104;
}

void __67__CalDAVCalendarPropertyRefreshOperation__handleUpdateForCalendar___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (id *)(a1 + 48);
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [v3 error];

  if (v4) {
    [WeakRetained setForceClearCalendarHomeSyncToken:1];
  }
  char v5 = [WeakRetained delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [WeakRetained delegate];
    id v8 = [v3 error];
    [v7 calendarRefreshPropPatchFinishedWithError:v8 forCalendar:*(void *)(a1 + 32)];
  }
  uint64_t v9 = [WeakRetained outstandingTaskGroups];
  id v10 = objc_loadWeakRetained(v2);
  [v9 removeObject:v10];

  uint64_t v11 = [WeakRetained outstandingTasksGroup];

  if (v11)
  {
    uint64_t v12 = [WeakRetained outstandingTasksGroup];
    dispatch_group_leave(v12);
  }
}

void __67__CalDAVCalendarPropertyRefreshOperation__handleUpdateForCalendar___block_invoke_375(id *a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained(a1 + 5);
  if (!WeakRetained) {
    goto LABEL_13;
  }
  id v3 = objc_loadWeakRetained(a1 + 6);
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 error];

    if (v5)
    {
      char v6 = [MEMORY[0x263F34B30] sharedLogging];
      id v7 = objc_loadWeakRetained((id *)&WeakRetained[*MEMORY[0x263F34C60]]);
      id v8 = [v6 logHandleForAccountInfoProvider:v7];

      if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned int v22 = 0;
        _os_log_impl(&dword_213CEC000, v8, OS_LOG_TYPE_INFO, "principalEmailDetailsTask encountered an error; not saving details to calendar",
          v22,
          2u);
      }

      goto LABEL_9;
    }
  }
  id v9 = objc_loadWeakRetained(a1 + 6);
  id v10 = [v9 displayName];
  [a1[4] setOwnerDisplayName:v10];

  id v11 = objc_loadWeakRetained(a1 + 6);
  uint64_t v12 = [v11 principalResult];
  uint64_t v13 = [v12 preferredAddresses];
  [a1[4] setPreferredCalendarUserAddresses:v13];

  id v14 = objc_loadWeakRetained(a1 + 6);
  int v15 = [v14 principalResult];
  int v16 = [v15 preferredAddresses];
  id v17 = +[CalDAVCalendarUserAddress preferredAddress:v16];

  __int16 v18 = [NSURL URLWithString:v17];
  [a1[4] setOwner:v18];

  if (v4)
  {
LABEL_9:
    id v19 = [WeakRetained outstandingTaskGroups];
    [v19 removeObject:v4];
  }
  unsigned int v20 = [WeakRetained outstandingTasksGroup];

  if (v20)
  {
    unsigned int v21 = [WeakRetained outstandingTasksGroup];
    dispatch_group_leave(v21);
  }
LABEL_13:
}

- (void)_updateDefaultSchedulingCalendarIfNeededForInboxCalendar:(id)a3 withContainer:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = objc_msgSend(v6, "principal", 0);
  id v9 = [v8 calendars];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (([v14 isScheduleInbox] & 1) == 0
          && ([v14 isScheduleOutbox] & 1) == 0
          && ([v14 isNotification] & 1) == 0
          && ([v14 isSubscribed] & 1) == 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && [v14 becameDefaultSchedulingCalendar])
        {
          int v15 = [v14 calendarURL];
          int v16 = [v15 relativePath];
          id v17 = [v16 CDVStringByAppendingSlashIfNeeded];

          if (v15)
          {
            id v18 = objc_alloc(MEMORY[0x263F34AF8]);
            id v19 = (void *)[v18 initWithNameSpace:*MEMORY[0x263F34CD8] andName:*MEMORY[0x263F34F18]];
            id v20 = objc_alloc(MEMORY[0x263F34AF8]);
            unsigned int v21 = (void *)[v20 initWithNameSpace:*MEMORY[0x263F34E10] andName:*MEMORY[0x263F34E50]];
            [v21 setPayloadAsString:v17];
            unsigned int v22 = [v19 extraChildItems];
            [v22 addObject:v21];

            int v23 = [v7 url];
            int v24 = [(CalDAVCalendarPropertyRefreshOperation *)self _getSetPropertyTaskWithCoreDAVItem:v19 forCalendar:v6 atURL:v23];

            id v25 = [(CoreDAVTaskGroup *)self outstandingTasks];
            [v25 addObject:v24];

            int v26 = [(CoreDAVTaskGroup *)self taskManager];
            [v26 submitQueuedCoreDAVTask:v24];

            long long v27 = [v6 principal];
            [v27 setDefaultCalendarURL:v15];
          }
          goto LABEL_18;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

- (void)_continueHandleContainerInfoTask:(id)a3 completedWithContainers:(id)a4 error:(id)a5
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CalDAVOperation *)self principal];
  [(CalDAVCalendarPropertyRefreshOperation *)self _initializePrincipalCalendarCache];
  uint64_t v10 = [MEMORY[0x263F34B30] sharedLogging];
  id location = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]);
  id WeakRetained = objc_loadWeakRetained(location);
  uint64_t v12 = [v10 logHandleForAccountInfoProvider:WeakRetained];

  if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    pathToLocalCalendar = self->_pathToLocalCalendar;
    localCalendarsWithNoPath = self->_localCalendarsWithNoPath;
    *(_DWORD *)buf = 138412546;
    uint64_t v100 = (uint64_t)pathToLocalCalendar;
    __int16 v101 = 2112;
    id v102 = localCalendarsWithNoPath;
    _os_log_impl(&dword_213CEC000, v12, OS_LOG_TYPE_INFO, "Syncing calendar collections. Local calendars are: %@. Local calendars with no paths are: %@", buf, 0x16u);
  }

  uint64_t v15 = [v9 inboxURL];
  int v16 = 0;
  if ([v9 isWritable])
  {
    if (v15)
    {
      int v16 = [v7 containerForURL:v15];
      id v17 = [v16 scheduleDefaultCalendarURL];

      if (v17)
      {
        id v18 = [v16 scheduleDefaultCalendarURL];
        [v9 setDefaultCalendarURL:v18];
      }
    }
  }
  id v75 = v16;
  id v76 = (void *)v15;
  [v9 outboxURL];
  char v74 = v77 = v7;
  __int16 v73 = objc_msgSend(v7, "containerForURL:");
  id v78 = v9;
  objc_msgSend(v9, "setSupportsFreebusy:", objc_msgSend(v73, "supportsFreebusy"));
  id v19 = [MEMORY[0x263EFF9C0] set];
  id v20 = [(CalDAVOperation *)self principal];
  unsigned int v21 = [v20 deletedCalendarURLs];
  [v19 unionSet:v21];

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v22 = v8;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v91 objects:v98 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v92;
    do
    {
      int v26 = v22;
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v92 != v25) {
          objc_enumerationMutation(v26);
        }
        long long v28 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        long long v29 = [v28 url];
        long long v30 = [v29 absoluteString];
        char v31 = [v19 containsObject:v30];

        if ((v31 & 1) == 0)
        {
          uint64_t v32 = [v28 url];
          uint64_t v33 = [v32 absoluteString];
          [v19 addObject:v33];

          if ([(CalDAVCalendarPropertyRefreshOperation *)self _handleUpdateForCalendar:v28])
          {
            id v34 = self->_pathToLocalCalendar;
            id v35 = [v28 url];
            uint64_t v36 = [v35 absoluteString];
            uint64_t v37 = [v36 appendSlashIfNeeded];
            [(NSMutableDictionary *)v34 removeObjectForKey:v37];
          }
        }
      }
      id v22 = v26;
      uint64_t v24 = [v26 countByEnumeratingWithState:&v91 objects:v98 count:16];
    }
    while (v24);
  }

  uint64_t v38 = v78;
  if (!self->_isSecondRefresh)
  {
    if ([(NSMutableSet *)self->_localCalendarsWithNoPath count])
    {
      uint64_t v39 = [MEMORY[0x263F34B30] sharedLogging];
      id v40 = objc_loadWeakRetained(location);
      v41 = [v39 logHandleForAccountInfoProvider:v40];

      if (v41)
      {
        __int16 v42 = v41;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          uint64_t v43 = [(NSMutableSet *)self->_localCalendarsWithNoPath count];
          int v44 = self->_localCalendarsWithNoPath;
          *(_DWORD *)buf = 134218242;
          uint64_t v100 = v43;
          __int16 v101 = 2112;
          id v102 = v44;
          _os_log_impl(&dword_213CEC000, v42, OS_LOG_TYPE_INFO, "Found %lu calendars with no paths. Sending these calendars to the server: %@", buf, 0x16u);
        }
      }
    }
    id v71 = v22;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    int v45 = self->_localCalendarsWithNoPath;
    uint64_t v46 = [(NSMutableSet *)v45 countByEnumeratingWithState:&v87 objects:v97 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v88 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v87 + 1) + 8 * j);
          if ((objc_msgSend(v50, "order", v71) & 0x80000000) != 0)
          {
            ++self->_nextCalendarOrder;
            objc_msgSend(v50, "setOrder:");
          }
          v51 = [(CalDAVCalendarPropertyRefreshOperation *)self _getMkcalendarTaskGroupForCalendar:v50];
          BOOL v52 = [(CalDAVOperation *)self outstandingTaskGroups];
          [v52 addObject:v51];

          [v51 startTaskGroup];
        }
        uint64_t v47 = [(NSMutableSet *)v45 countByEnumeratingWithState:&v87 objects:v97 count:16];
      }
      while (v47);
    }

    uint64_t v38 = v78;
    int v53 = [v78 isMergeSync];
    v54 = [MEMORY[0x263F34B30] sharedLogging];
    id v55 = objc_loadWeakRetained(location);
    BOOL v56 = [v54 logHandleForAccountInfoProvider:v55];

    if (v53)
    {
      if (v56 && os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        id v57 = self->_pathToLocalCalendar;
        *(_DWORD *)buf = 138412290;
        uint64_t v100 = (uint64_t)v57;
        _os_log_impl(&dword_213CEC000, v56, OS_LOG_TYPE_INFO, "Since this is a merge sync, we're going to upload all the calendars that didn't exist on the server: %@", buf, 0xCu);
      }

      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      v58 = [(NSMutableDictionary *)self->_pathToLocalCalendar allValues];
      uint64_t v59 = [v58 countByEnumeratingWithState:&v83 objects:v96 count:16];
      id v22 = v71;
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v84;
        do
        {
          for (uint64_t k = 0; k != v60; ++k)
          {
            if (*(void *)v84 != v61) {
              objc_enumerationMutation(v58);
            }
            BOOL v63 = *(void **)(*((void *)&v83 + 1) + 8 * k);
            if ((objc_msgSend(v63, "order", v71) & 0x80000000) != 0)
            {
              ++self->_nextCalendarOrder;
              objc_msgSend(v63, "setOrder:");
            }
            long long v64 = [(CalDAVCalendarPropertyRefreshOperation *)self _getMkcalendarTaskGroupForCalendar:v63];
            id v65 = [(CalDAVOperation *)self outstandingTaskGroups];
            [v65 addObject:v64];

            [v64 startTaskGroup];
          }
          uint64_t v60 = [v58 countByEnumeratingWithState:&v83 objects:v96 count:16];
        }
        while (v60);
        uint64_t v38 = v78;
      }
    }
    else
    {
      if (v56 && os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        long long v66 = self->_pathToLocalCalendar;
        *(_DWORD *)buf = 138412290;
        uint64_t v100 = (uint64_t)v66;
        _os_log_impl(&dword_213CEC000, v56, OS_LOG_TYPE_INFO, "Deleting calendars that no longer appear on the server: %@", buf, 0xCu);
      }

      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      v58 = [(NSMutableDictionary *)self->_pathToLocalCalendar allValues];
      uint64_t v67 = [v58 countByEnumeratingWithState:&v79 objects:v95 count:16];
      id v22 = v71;
      if (v67)
      {
        uint64_t v68 = v67;
        uint64_t v69 = *(void *)v80;
        do
        {
          for (uint64_t m = 0; m != v68; ++m)
          {
            if (*(void *)v80 != v69) {
              objc_enumerationMutation(v58);
            }
            objc_msgSend(v78, "removeCalendar:", *(void *)(*((void *)&v79 + 1) + 8 * m), v71);
          }
          uint64_t v68 = [v58 countByEnumeratingWithState:&v79 objects:v95 count:16];
        }
        while (v68);
      }
    }

    [(CalDAVCalendarPropertyRefreshOperation *)self _getDefaultCalendarsTasksIfNeededForPrincipal:v38];
  }
}

- (id)_getDefaultMkCalendarForPrincipalTaskGroup:(id)a3 isEventCalendar:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  CFUUIDRef v7 = CFUUIDCreate(0);
  id v8 = (__CFString *)CFUUIDCreateString(0, v7);
  id v9 = [v6 calendarHomeURL];
  uint64_t v10 = [(__CFString *)v8 appendSlashIfNeeded];
  uint64_t v11 = [v9 URLByAppendingPathComponent:v10];

  uint64_t v12 = [v6 calendarOfType:0 atURL:v11 withOptions:0];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 setGuid:v8];
    if (v4)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v14 = [v6 defaultEventCalendarTitle];
LABEL_13:
        id v20 = (void *)v14;
        [v13 setTitle:v14];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [v6 defaultTodoCalendarTitle];
      goto LABEL_13;
    }
    [v13 setCalendarURL:v11];
    objc_msgSend(v13, "setIsEnabled:", objc_msgSend(v6, "isEnabled"));
    [v13 setIsEventContainer:v4];
    [v13 setIsTaskContainer:v4 ^ 1];
    ++self->_nextCalendarOrder;
    objc_msgSend(v13, "setOrder:");
    id v19 = [(CalDAVCalendarPropertyRefreshOperation *)self _getMkcalendarTaskGroupForCalendar:v13];
    goto LABEL_15;
  }
  uint64_t v15 = [MEMORY[0x263F34B30] sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
  id v17 = [v15 logHandleForAccountInfoProvider:WeakRetained];

  if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = @"todo";
    if (v4) {
      id v18 = @"event";
    }
    int v22 = 138412290;
    uint64_t v23 = v18;
    _os_log_impl(&dword_213CEC000, v17, OS_LOG_TYPE_DEFAULT, "Couldn't create a default %@ calendar", (uint8_t *)&v22, 0xCu);
  }

  id v19 = 0;
LABEL_15:
  CFRelease(v7);

  return v19;
}

- (void)_getDefaultCalendarsTasksIfNeededForPrincipal:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  char v5 = [v4 calendars];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __88__CalDAVCalendarPropertyRefreshOperation__getDefaultCalendarsTasksIfNeededForPrincipal___block_invoke;
  v17[3] = &unk_2641EC1B0;
  v17[4] = &v22;
  v17[5] = &v18;
  [v5 enumerateObjectsUsingBlock:v17];

  if ([v4 isEnabledForEvents] && !*((unsigned char *)v23 + 24))
  {
    id v6 = [MEMORY[0x263F34B30] sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
    id v8 = [v6 logHandleForAccountInfoProvider:WeakRetained];

    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v16 = 0;
      _os_log_impl(&dword_213CEC000, v8, OS_LOG_TYPE_DEFAULT, "This account is enabled for events, but has no event calendar. We're going to create a default one", v16, 2u);
    }

    id v9 = [(CalDAVCalendarPropertyRefreshOperation *)self _getDefaultMkCalendarForPrincipalTaskGroup:v4 isEventCalendar:1];
    uint64_t v10 = [(CalDAVOperation *)self outstandingTaskGroups];
    [v10 addObject:v9];

    [v9 startTaskGroup];
  }
  if ([v4 isEnabledForTodos] && !*((unsigned char *)v19 + 24))
  {
    uint64_t v11 = [MEMORY[0x263F34B30] sharedLogging];
    id v12 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
    uint64_t v13 = [v11 logHandleForAccountInfoProvider:v12];

    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v16 = 0;
      _os_log_impl(&dword_213CEC000, v13, OS_LOG_TYPE_DEFAULT, "This account is enabled for tasks, but has no task calendar. We're going to create a default one", v16, 2u);
    }

    uint64_t v14 = [(CalDAVCalendarPropertyRefreshOperation *)self _getDefaultMkCalendarForPrincipalTaskGroup:v4 isEventCalendar:0];
    uint64_t v15 = [(CalDAVOperation *)self outstandingTaskGroups];
    [v15 addObject:v14];

    [v14 startTaskGroup];
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

uint64_t __88__CalDAVCalendarPropertyRefreshOperation__getDefaultCalendarsTasksIfNeededForPrincipal___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  if (([v7 isSubscribed] & 1) == 0
    && ([v7 isScheduleInbox] & 1) == 0
    && ([v7 isScheduleOutbox] & 1) == 0
    && ([v7 isNotification] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= [v7 isEventContainer];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v7 isTaskContainer];
    char v5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (v5) {
      char v5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
    }
    *a3 = v5;
  }
  return MEMORY[0x270F9A758]();
}

- (void)containerInfoTask:(id)a3 completedWithContainers:(id)a4 error:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  uint64_t v13 = [(CalDAVOperation *)self principal];
  uint64_t v14 = v13;
  if (v11)
  {
    objc_storeStrong((id *)&self->_savedError, a5);
    uint64_t v15 = [MEMORY[0x263F34B30] sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
    id v17 = [v15 logHandleForAccountInfoProvider:WeakRetained];

    if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v11;
      _os_log_impl(&dword_213CEC000, v17, OS_LOG_TYPE_ERROR, "Encountered an error while getting calendar info: %@", buf, 0xCu);
    }
  }
  else
  {
    if (self->_isSecondRefresh)
    {
      [(CalDAVCalendarPropertyRefreshOperation *)self _continueHandleContainerInfoTask:v12 completedWithContainers:v10 error:0];
      goto LABEL_9;
    }
    id v19 = [v13 calendarHomeURL];
    uint64_t v15 = [v12 containerForURL:v19];

    if (v15)
    {
      uint64_t v20 = [v15 pushTransports];
      [v14 setPushTransports:v20];

      char v21 = [v15 pushKey];
      [v14 setCalendarHomePushKey:v21];

      uint64_t v22 = NSNumber;
      uint64_t v23 = [v15 quotaAvailable];
      uint64_t v24 = objc_msgSend(v22, "numberWithInteger:", (int)objc_msgSend(v23, "intValue"));
      [v14 setQuotaFreeBytes:v24];

      char v25 = [v15 privileges];
      if ([v25 count]) {
        uint64_t v26 = [v15 hasBindPrivileges];
      }
      else {
        uint64_t v26 = 1;
      }
      [v14 setCanCreateCalendars:v26];

      char v31 = [v15 syncToken];
      [(CalDAVCalendarPropertyRefreshOperation *)self setCalendarHomeSyncToken:v31];

      long long v27 = [v15 supportedCalendarComponentSets];
      [v14 setSupportedCalendarComponentSets:v27];
    }
    else
    {
      long long v27 = [MEMORY[0x263F34B30] sharedLogging];
      id v28 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
      long long v29 = [v27 logHandleForAccountInfoProvider:v28];

      if (v29)
      {
        long long v30 = v29;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = [v14 calendarHomeURL];
          *(_DWORD *)buf = 138412290;
          id v35 = v32;
          _os_log_impl(&dword_213CEC000, v30, OS_LOG_TYPE_DEFAULT, "Didn't find a home container for the principal at %@", buf, 0xCu);
        }
      }
    }
    [(CalDAVCalendarPropertyRefreshOperation *)self _continueHandleContainerInfoTask:v12 completedWithContainers:v10 error:0];
  }

LABEL_9:
  outstandingTasksGroup = self->_outstandingTasksGroup;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__CalDAVCalendarPropertyRefreshOperation_containerInfoTask_completedWithContainers_error___block_invoke;
  block[3] = &unk_2641EC0C0;
  block[4] = self;
  block[5] = a2;
  dispatch_group_notify(outstandingTasksGroup, MEMORY[0x263EF83A0], block);
}

void *__90__CalDAVCalendarPropertyRefreshOperation_containerInfoTask_completedWithContainers_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) outstandingTasks];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"CalDAVCalendarPropertyRefreshOperation.m" lineNumber:1399 description:@"All tasks should be complete when the outstanding task group is clear"];
  }
  id v4 = [*(id *)(a1 + 32) outstandingTaskGroups];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"CalDAVCalendarPropertyRefreshOperation.m" lineNumber:1400 description:@"All task groups should be complete when the outstanding task group is clear"];
  }
  result = *(void **)(a1 + 32);
  if (!*((unsigned char *)result + (int)*MEMORY[0x263F34C68]))
  {
    return (void *)[result _finishRefresh];
  }
  return result;
}

- (void)containerInfoSyncTask:(id)a3 retrievedAddedOrModifiedContainers:(id)a4 removedContainerURLs:(id)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v42 = a5;
  id v8 = [(CalDAVOperation *)self principal];
  id v9 = [v8 calendarHomeURL];
  id v10 = [v9 absoluteString];
  uint64_t v11 = [v10 appendSlashIfNeeded];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v7;
  int v44 = (void *)v11;
  uint64_t v46 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v46)
  {
    uint64_t v12 = *(void *)v52;
    uint64_t v43 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v15 = [v14 url];
        int v16 = [v15 absoluteString];
        id v17 = [v16 appendSlashIfNeeded];

        if ([v17 isEqualToString:v11])
        {
          uint64_t v18 = [MEMORY[0x263F34B30] sharedLogging];
          id v19 = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]);
          id WeakRetained = objc_loadWeakRetained(v19);
          char v21 = [v18 logHandleForAccountInfoProvider:WeakRetained];

          if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v17;
            _os_log_impl(&dword_213CEC000, v21, OS_LOG_TYPE_INFO, "Modified Calendar Found in Report Is 'Calendar Home Collection' : %@", buf, 0xCu);
          }

          uint64_t v22 = [v14 pushTransports];

          if (v22)
          {
            uint64_t v23 = [MEMORY[0x263F34B30] sharedLogging];
            id v24 = objc_loadWeakRetained(v19);
            char v25 = [v23 logHandleForAccountInfoProvider:v24];

            if (v25)
            {
              uint64_t v26 = v25;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                long long v27 = [(CalDAVOperation *)self principal];
                id v28 = [v27 pushTransports];
                long long v29 = [v14 pushTransports];
                *(_DWORD *)buf = 138412546;
                id v57 = v28;
                __int16 v58 = 2112;
                uint64_t v59 = v29;
                _os_log_impl(&dword_213CEC000, v26, OS_LOG_TYPE_INFO, "Updating Push-transports for 'Calendar Home Collection' From {\n%@\n} To: {\n%@\n}", buf, 0x16u);
              }
            }

            long long v30 = [v14 pushTransports];
            char v31 = [(CalDAVOperation *)self principal];
            [v31 setPushTransports:v30];

            uint64_t v12 = v43;
            uint64_t v11 = (uint64_t)v44;
          }
        }
        [(CalDAVCalendarPropertyRefreshOperation *)self _handleUpdateForCalendar:v14];
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v46);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v32 = v42;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v48 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v47 + 1) + 8 * j);
        uint64_t v38 = [(CoreDAVTaskGroup *)self delegate];
        char v39 = objc_opt_respondsToSelector();

        if (v39)
        {
          id v40 = [(CoreDAVTaskGroup *)self delegate];
          [v40 calendarRefreshFoundDeletedContainerURL:v37];
        }
        v41 = [(CalDAVOperation *)self principal];
        [v41 removecalendarWithURL:v37];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v34);
  }
}

- (void)containerInfoSyncTask:(id)a3 completedWithNewSyncToken:(id)a4 error:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10 || ![v9 length])
  {
    uint64_t v11 = [MEMORY[0x263F34B30] sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
    uint64_t v13 = [v11 logHandleForAccountInfoProvider:WeakRetained];

    if (v13)
    {
      uint64_t v14 = v13;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [(CalDAVOperation *)self principal];
        int v16 = [v15 calendarHomeURL];
        *(_DWORD *)buf = 138412802;
        id v24 = v16;
        __int16 v25 = 2112;
        id v26 = v9;
        __int16 v27 = 2112;
        id v28 = v10;
        _os_log_impl(&dword_213CEC000, v14, OS_LOG_TYPE_DEFAULT, "Sync report against %@ failed with error %@ or no sync token %@. Retrying sync with a PROPFIND", buf, 0x20u);
      }
    }

    id v17 = [(CalDAVOperation *)self principal];
    [v17 setCalendarHomeSyncToken:0];

    outstandingTasksGroup = self->_outstandingTasksGroup;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __96__CalDAVCalendarPropertyRefreshOperation_containerInfoSyncTask_completedWithNewSyncToken_error___block_invoke_395;
    v21[3] = &unk_2641EBF88;
    void v21[4] = self;
    id v19 = MEMORY[0x263EF83A0];
    uint64_t v20 = v21;
  }
  else
  {
    [(CalDAVCalendarPropertyRefreshOperation *)self setCalendarHomeSyncToken:v9];
    outstandingTasksGroup = self->_outstandingTasksGroup;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__CalDAVCalendarPropertyRefreshOperation_containerInfoSyncTask_completedWithNewSyncToken_error___block_invoke;
    block[3] = &unk_2641EBF88;
    block[4] = self;
    id v19 = MEMORY[0x263EF83A0];
    uint64_t v20 = block;
  }
  dispatch_group_notify(outstandingTasksGroup, v19, v20);
}

void *__96__CalDAVCalendarPropertyRefreshOperation_containerInfoSyncTask_completedWithNewSyncToken_error___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!*((unsigned char *)result + (int)*MEMORY[0x263F34C68])) {
    return (void *)[result _finishRefresh];
  }
  return result;
}

void *__96__CalDAVCalendarPropertyRefreshOperation_containerInfoSyncTask_completedWithNewSyncToken_error___block_invoke_395(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!*((unsigned char *)result + (int)*MEMORY[0x263F34C68])) {
    return (void *)[result _reallyRefreshCalendarProperties];
  }
  return result;
}

- (BOOL)useCalendarHomeSyncReport
{
  return self->_useCalendarHomeSyncReport;
}

- (void)setUseCalendarHomeSyncReport:(BOOL)a3
{
  self->_useCalendarHomeSyncReport = a3;
}

- (NSString)calendarHomeSyncToken
{
  return self->_calendarHomeSyncToken;
}

- (void)setCalendarHomeSyncToken:(id)a3
{
}

- (OS_dispatch_group)outstandingTasksGroup
{
  return self->_outstandingTasksGroup;
}

- (void)setOutstandingTasksGroup:(id)a3
{
}

- (BOOL)forceClearCalendarHomeSyncToken
{
  return self->_forceClearCalendarHomeSyncToken;
}

- (void)setForceClearCalendarHomeSyncToken:(BOOL)a3
{
  self->_BOOL forceClearCalendarHomeSyncToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingTasksGroup, 0);
  objc_storeStrong((id *)&self->_calendarHomeSyncToken, 0);
  objc_storeStrong((id *)&self->_updatedCalendars, 0);
  objc_storeStrong((id *)&self->_localCalendarsWithNoPath, 0);
  objc_storeStrong((id *)&self->_pathToLocalCalendar, 0);
  objc_storeStrong((id *)&self->_syncTokens, 0);
  objc_storeStrong((id *)&self->_ctags, 0);
  objc_storeStrong((id *)&self->_savedError, 0);
}

@end