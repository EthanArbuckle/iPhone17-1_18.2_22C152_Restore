@interface CalDAVCalendarSyncOperation
- (BOOL)getScheduleChanges;
- (BOOL)getScheduleTags;
- (BOOL)setLocalETag:(id)a3 forItemWithURL:(id)a4 inFolderWithURL:(id)a5;
- (BOOL)setLocalScheduleTag:(id)a3 forItemWithURL:(id)a4 inFolderWithURL:(id)a5;
- (BOOL)syncDeleteTask:(id)a3 error:(id)a4;
- (BOOL)syncPutTask:(id)a3 completedWithNewETag:(id)a4 error:(id)a5;
- (CalDAVCalendarSyncOperation)initWithPrincipal:(id)a3 calendar:(id)a4 nextCtag:(id)a5 nextSyncToken:(id)a6;
- (id)_distantFutureEndDate;
- (id)copyAllLocalURLsInFolderWithURL:(id)a3;
- (id)copyLocalETagsForURLs:(id)a3 inFolderWithURL:(id)a4;
- (void)_advanceStage;
- (void)_finishWithError:(id)a3;
- (void)_performNextStage;
- (void)_processAddedOrModified:(id)a3 removed:(id)a4;
- (void)_reportJunk:(id)a3;
- (void)_splitRecurrences;
- (void)_syncCalendar;
- (void)_syncEventsForMerge;
- (void)containerSyncTask:(id)a3 completedWithNewCTag:(id)a4 newSyncToken:(id)a5 addedOrModified:(id)a6 removed:(id)a7 error:(id)a8;
- (void)containerSyncTask:(id)a3 retrievedAddedOrModifiedActions:(id)a4 removed:(id)a5;
- (void)recurrenceSplitAction:(id)a3 completedWithUpdatedETag:(id)a4 updatedScheduleTag:(id)a5 createdURL:(id)a6 createdETag:(id)a7 createdScheduleTag:(id)a8;
- (void)recurrenceSplitAction:(id)a3 failedWithError:(id)a4;
- (void)reportJunkAction:(id)a3 completedWithError:(id)a4;
- (void)setGetScheduleChanges:(BOOL)a3;
- (void)setGetScheduleTags:(BOOL)a3;
- (void)syncCalendar;
@end

@implementation CalDAVCalendarSyncOperation

- (CalDAVCalendarSyncOperation)initWithPrincipal:(id)a3 calendar:(id)a4 nextCtag:(id)a5 nextSyncToken:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CalDAVCalendarSyncOperation;
  v14 = [(CalDAVOperation *)&v17 initWithPrincipal:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_calendar, a4);
    objc_storeStrong((id *)&v15->_nextCtag, a5);
    objc_storeStrong((id *)&v15->_nextSyncToken, a6);
  }

  return v15;
}

- (void)_finishWithError:(id)a3
{
  v4 = (NSError *)a3;
  if (!v4) {
    v4 = self->_reportJunkError;
  }
  if (objc_opt_respondsToSelector()) {
    [(CalDAVCalendar *)self->_calendar syncDidFinishWithError:v4];
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__CalDAVCalendarSyncOperation__finishWithError___block_invoke;
  v6[3] = &unk_2641EBFB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v5 delegateCallbackBlock:v6];
}

void __48__CalDAVCalendarSyncOperation__finishWithError___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  v2 = [*(id *)(a1 + 32) principal];
  [v3 calendarSyncForPrincipal:v2 calendar:*(void *)(*(void *)(a1 + 32) + 136) completedWithError:*(void *)(a1 + 40)];
}

- (id)_distantFutureEndDate
{
  if (_distantFutureEndDate_onceToken != -1) {
    dispatch_once(&_distantFutureEndDate_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)_distantFutureEndDate_futureEndDate;
  return v2;
}

void __52__CalDAVCalendarSyncOperation__distantFutureEndDate__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFF8F0]);
  id v5 = (id)[v0 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v1 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  [v5 setTimeZone:v1];

  v2 = [MEMORY[0x263EFF910] distantFuture];
  uint64_t v3 = [v5 components:252 fromDate:v2];
  v4 = (void *)_distantFutureEndDate_futureEndDate;
  _distantFutureEndDate_futureEndDate = v3;
}

- (void)syncCalendar
{
  self->_currentStage = 1;
  [(CalDAVCalendarSyncOperation *)self _performNextStage];
}

- (void)_advanceStage
{
  switch(self->_currentStage)
  {
    case 0uLL:
      uint64_t v3 = [MEMORY[0x263F34B30] sharedLogging];
      id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
      id v5 = [v3 logHandleForAccountInfoProvider:WeakRetained];

      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_213CEC000, v5, OS_LOG_TYPE_ERROR, "CalendarSyncOperationStageNone is terminal.  Why are we trying to transition out of it?", v7, 2u);
      }

      goto LABEL_6;
    case 1uLL:
      unint64_t v6 = 2;
      break;
    case 2uLL:
      unint64_t v6 = 3;
      break;
    case 3uLL:
      unint64_t v6 = 4;
      break;
    default:
LABEL_6:
      unint64_t v6 = 0;
      break;
  }
  self->_currentStage = v6;
}

- (void)_performNextStage
{
  [(CalDAVCalendarSyncOperation *)self _advanceStage];
  switch(self->_currentStage)
  {
    case 1uLL:
      uint64_t v3 = [MEMORY[0x263F34B30] sharedLogging];
      id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
      id v5 = [v3 logHandleForAccountInfoProvider:WeakRetained];

      if (v5)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213CEC000, v5, OS_LOG_TYPE_ERROR, "CalendarSyncOperationStageBegin is not any stage's next stage.  How did we get here?", buf, 2u);
        }
      }

      break;
    case 2uLL:
      reportJunkError = self->_reportJunkError;
      self->_reportJunkError = 0;

      char v7 = objc_opt_respondsToSelector();
      v8 = 0;
      if (v7)
      {
        v8 = [(CalDAVCalendar *)self->_calendar reportJunkActions];
      }
      id v11 = v8;
      if ([v8 count]) {
        [(CalDAVCalendarSyncOperation *)self _reportJunk:v11];
      }
      else {
        [(CalDAVCalendarSyncOperation *)self _performNextStage];
      }

      break;
    case 3uLL:
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([(CalDAVCalendar *)self->_calendar recurrenceSplitActions],
            v9 = objc_claimAutoreleasedReturnValue(),
            uint64_t v10 = [v9 count],
            v9,
            v10))
      {
        [(CalDAVCalendarSyncOperation *)self _splitRecurrences];
      }
      else
      {
        [(CalDAVCalendarSyncOperation *)self _performNextStage];
      }
      break;
    case 4uLL:
      [(CalDAVCalendarSyncOperation *)self _syncCalendar];
      break;
    default:
      return;
  }
}

- (void)_reportJunk:(id)a3
{
  id v4 = a3;
  id v5 = [CalDAVReportJunkTaskGroup alloc];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
  id v7 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C78]));
  v8 = [(CalDAVReportJunkTaskGroup *)v5 initWithReportJunkActions:v4 accountInfoProvider:WeakRetained taskManager:v7];

  [(CoreDAVTaskGroup *)v8 setDelegate:self];
  v9 = [(CalDAVOperation *)self outstandingTaskGroups];
  [v9 addObject:v8];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __43__CalDAVCalendarSyncOperation__reportJunk___block_invoke;
  id v13 = &unk_2641EBF60;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  [(CoreDAVTaskGroup *)v8 setCompletionBlock:&v10];
  [(CalDAVReportJunkTaskGroup *)v8 startTaskGroup];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __43__CalDAVCalendarSyncOperation__reportJunk___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [v2 error];
    id v4 = (void *)WeakRetained[18];
    WeakRetained[18] = v3;

    id v5 = [WeakRetained outstandingTaskGroups];
    [v5 removeObject:v2];

    [WeakRetained _performNextStage];
  }
}

- (void)_splitRecurrences
{
  uint64_t v3 = [CalDAVRecurrenceSplitTaskGroup alloc];
  calendar = self->_calendar;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
  id v6 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C78]));
  id v7 = [(CalDAVRecurrenceSplitTaskGroup *)v3 initWithCalendar:calendar accountInfoProvider:WeakRetained taskManager:v6];

  [(CoreDAVTaskGroup *)v7 setDelegate:self];
  v8 = [(CalDAVOperation *)self outstandingTaskGroups];
  [v8 addObject:v7];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__CalDAVCalendarSyncOperation__splitRecurrences__block_invoke;
  v9[3] = &unk_2641EC160;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  v9[4] = self;
  [(CoreDAVTaskGroup *)v7 setCompletionBlock:v9];
  [(CalDAVRecurrenceSplitTaskGroup *)v7 startTaskGroup];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __48__CalDAVCalendarSyncOperation__splitRecurrences__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained outstandingTaskGroups];
    [v3 removeObject:v2];

    if (objc_opt_respondsToSelector())
    {
      id v4 = (void *)WeakRetained[17];
      id v5 = [v2 error];
      [v4 recurrenceSplitActionsCompletedWithError:v5];
    }
    id v6 = [v2 error];

    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      v8 = [v2 error];
      [v7 _finishWithError:v8];
    }
    else
    {
      [WeakRetained _performNextStage];
    }
  }
}

- (void)_syncCalendar
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v3 = 120;
  NSUInteger v4 = [(NSString *)self->_nextCtag length];
  if (v4)
  {
    nextCtag = self->_nextCtag;
    uint64_t v3 = [(CalDAVCalendar *)self->_calendar ctag];
    if ([(NSString *)nextCtag isEqualToString:v3])
    {
      int v6 = 1;
      goto LABEL_6;
    }
  }
  if (![(NSString *)self->_nextSyncToken length])
  {
    int v6 = 0;
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v7 = v4 == 0;
  nextSyncToken = self->_nextSyncToken;
  v9 = [(CalDAVCalendar *)self->_calendar syncToken];
  int v6 = [(NSString *)nextSyncToken isEqualToString:v9];

  if (!v7) {
LABEL_6:
  }

LABEL_7:
  if (([(CalDAVCalendar *)self->_calendar needsResync] & 1) != 0
    || !v6
    || ([(CalDAVCalendar *)self->_calendar syncActions],
        id v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v11))
  {
    id v12 = [(CalDAVOperation *)self principal];
    if ([v12 isEnabledForEvents]) {
      uint64_t v13 = [(CalDAVCalendar *)self->_calendar isEventContainer];
    }
    else {
      uint64_t v13 = 0;
    }
    if ([v12 isEnabledForTodos]) {
      uint64_t v14 = [(CalDAVCalendar *)self->_calendar isTaskContainer];
    }
    else {
      uint64_t v14 = 0;
    }
    if ((v13 | v14))
    {
      id v15 = [CalDAVContainerSyncTaskGroup alloc];
      calendar = self->_calendar;
      objc_super v17 = [(CoreDAVTaskGroup *)self taskManager];
      v18 = [(CalDAVContainerSyncTaskGroup *)v15 initWithCalendar:calendar accountInfoProvider:v12 taskManager:v17];

      [(CoreDAVTaskGroup *)v18 setDelegate:self];
      v19 = [(CalDAVOperation *)self outstandingTaskGroups];
      [v19 addObject:v18];

      objc_initWeak((id *)location, v18);
      objc_initWeak(&from, self);
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __44__CalDAVCalendarSyncOperation__syncCalendar__block_invoke;
      v38[3] = &unk_2641EBF60;
      objc_copyWeak(&v39, &from);
      objc_copyWeak(&v40, (id *)location);
      [(CoreDAVTaskGroup *)v18 setCompletionBlock:v38];
      [(CalDAVContainerSyncTaskGroup *)v18 setSyncEvents:v13];
      [(CalDAVContainerSyncTaskGroup *)v18 setSyncTodos:v14];
      -[CalDAVContainerSyncTaskGroup setSupportsExtendedCalendarQuery:](v18, "setSupportsExtendedCalendarQuery:", [v12 supportsExtendedCalendarQuery]);
      v20 = [v12 account];
      v21 = [v20 serverVersion];

      if ([v21 supportsTimeRangeFilter]
        && (![(CalDAVCalendar *)self->_calendar isScheduleInbox]
         || ([v21 supportsTimeRangeFilterOnInbox] & 1) == 0))
      {
        v22 = [v12 eventFilterStartDate];
        [(CalDAVContainerSyncTaskGroup *)v18 setEventFilterStartDate:v22];

        v23 = [v12 eventFilterEndDate];
        char v24 = [v21 supportsTimeRangeFilterWithoutEndDate];
        if (v23) {
          char v25 = 1;
        }
        else {
          char v25 = v24;
        }
        if ((v25 & 1) == 0)
        {
          v23 = [(CalDAVCalendarSyncOperation *)self _distantFutureEndDate];
        }
        [(CalDAVContainerSyncTaskGroup *)v18 setEventFilterEndDate:v23];
      }
      [(CoreDAVContainerSyncTaskGroup *)v18 startTaskGroup];

      objc_destroyWeak(&v40);
      objc_destroyWeak(&v39);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v26 = [MEMORY[0x263F34B30] sharedLogging];
      id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
      v28 = [v26 logHandleForAccountInfoProvider:WeakRetained];

      if (v28)
      {
        v29 = v28;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = [(CalDAVCalendar *)self->_calendar title];
          *(_DWORD *)id location = 138412290;
          *(void *)&location[4] = v30;
          _os_log_impl(&dword_213CEC000, v29, OS_LOG_TYPE_DEFAULT, "Skipping refresh of calendar \"%@\" because it isn't enabled to sync either events or todos", location, 0xCu);
        }
      }

      [(CalDAVCalendarSyncOperation *)self _finishWithError:0];
    }
  }
  else
  {
    v31 = [MEMORY[0x263F34B30] sharedLogging];
    id v32 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
    v33 = [v31 logHandleForAccountInfoProvider:v32];

    if (v33)
    {
      v34 = v33;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = [(CalDAVCalendar *)self->_calendar title];
        v36 = [(CalDAVCalendar *)self->_calendar ctag];
        v37 = [(CalDAVCalendar *)self->_calendar syncToken];
        *(_DWORD *)id location = 138412802;
        *(void *)&location[4] = v35;
        __int16 v43 = 2114;
        v44 = v36;
        __int16 v45 = 2114;
        v46 = v37;
        _os_log_impl(&dword_213CEC000, v34, OS_LOG_TYPE_INFO, "Skipping refresh of calendar \"%@\" because the ctag matches and we have no local changes (ctag: %{public}@, syncToken: %{public}@)", location, 0x20u);
      }
    }

    [(CalDAVCalendarSyncOperation *)self _finishWithError:0];
  }
}

void __44__CalDAVCalendarSyncOperation__syncCalendar__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained outstandingTaskGroups];
    [v3 removeObject:v2];

    [WeakRetained _performNextStage];
  }
}

- (void)_processAddedOrModified:(id)a3 removed:(id)a4
{
  calendar = self->_calendar;
  id v7 = a4;
  [(CalDAVCalendar *)calendar updateResourcesFromServer:a3];
  [(CalDAVCalendar *)self->_calendar deleteResourcesAtURLs:v7];
}

- (void)_syncEventsForMerge
{
  uint64_t v3 = [CalDAVMergeUploadTaskGroup alloc];
  calendar = self->_calendar;
  id v5 = [(CalDAVOperation *)self principal];
  int v6 = [(CalDAVOperation *)self principal];
  id v7 = [(CoreDAVTaskGroup *)self taskManager];
  v8 = [(CalDAVMergeUploadTaskGroup *)v3 initWithCalendar:calendar principal:v5 accountInfoProvider:v6 taskManager:v7];

  objc_initWeak(&location, v8);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__CalDAVCalendarSyncOperation__syncEventsForMerge__block_invoke;
  v10[3] = &unk_2641EC310;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  [(CoreDAVTaskGroup *)v8 setCompletionBlock:v10];
  v9 = [(CalDAVOperation *)self outstandingTaskGroups];
  [v9 addObject:v8];

  [(CalDAVMergeUploadTaskGroup *)v8 startTaskGroup];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__CalDAVCalendarSyncOperation__syncEventsForMerge__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained error];
  [v2 _finishWithError:v5];

  id v7 = [*(id *)(a1 + 32) outstandingTaskGroups];
  id v6 = objc_loadWeakRetained(v3);
  [v7 removeObject:v6];
}

- (id)copyLocalETagsForURLs:(id)a3 inFolderWithURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(CalDAVCalendar *)self->_calendar calendarURL];
  char v10 = [v8 CDVIsEqualToURL:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v14 = [(CalDAVCalendar *)self->_calendar calendarURL];
    [v13 handleFailureInMethod:a2, self, @"CalDAVCalendarSyncOperation.m", 293, @"We were asked about a folder URL that is different than the calendar we are refreshing: %@ (our calendar is at %@)", v8, v14 object file lineNumber description];
  }
  id v11 = [(CalDAVCalendar *)self->_calendar etagsForItemURLs:v7];

  return v11;
}

- (id)copyAllLocalURLsInFolderWithURL:(id)a3
{
  id v5 = a3;
  id v6 = [(CalDAVCalendar *)self->_calendar calendarURL];
  char v7 = [v5 CDVIsEqualToURL:v6];

  if ((v7 & 1) == 0)
  {
    char v10 = [MEMORY[0x263F08690] currentHandler];
    id v11 = [(CalDAVCalendar *)self->_calendar calendarURL];
    [v10 handleFailureInMethod:a2, self, @"CalDAVCalendarSyncOperation.m", 299, @"We were asked about a folder URL that is different than the calendar we are refreshing: %@ (our calendar is at %@)", v5, v11 object file lineNumber description];
  }
  id v8 = [(CalDAVCalendar *)self->_calendar allItemURLs];

  return v8;
}

- (BOOL)setLocalETag:(id)a3 forItemWithURL:(id)a4 inFolderWithURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(CalDAVCalendar *)self->_calendar calendarURL];
  char v13 = [v11 CDVIsEqualToURL:v12];

  if ((v13 & 1) == 0)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    objc_super v17 = [(CalDAVCalendar *)self->_calendar calendarURL];
    [v16 handleFailureInMethod:a2, self, @"CalDAVCalendarSyncOperation.m", 305, @"We were asked about a folder URL that is different than the calendar we are refreshing: %@ (our calendar is at %@)", v11, v17 object file lineNumber description];
  }
  char v14 = [(CalDAVCalendar *)self->_calendar setEtag:v9 forItemAtURL:v10];

  return v14;
}

- (BOOL)setLocalScheduleTag:(id)a3 forItemWithURL:(id)a4 inFolderWithURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(CalDAVCalendar *)self->_calendar calendarURL];
  char v13 = [v11 CDVIsEqualToURL:v12];

  if ((v13 & 1) == 0)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    objc_super v17 = [(CalDAVCalendar *)self->_calendar calendarURL];
    [v16 handleFailureInMethod:a2, self, @"CalDAVCalendarSyncOperation.m", 311, @"We were asked about a folder URL that is different than the calendar we are refreshing: %@ (our calendar is at %@)", v11, v17 object file lineNumber description];
  }
  char v14 = [(CalDAVCalendar *)self->_calendar setScheduleTag:v9 forItemAtURL:v10];

  return v14;
}

- (BOOL)syncPutTask:(id)a3 completedWithNewETag:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (objc_opt_respondsToSelector())
  {
    calendar = self->_calendar;
    id v10 = [v7 backingAction];
    [(CalDAVCalendar *)calendar putAction:v10 completedWithError:v8];
  }
  return v8 == 0;
}

- (BOOL)syncDeleteTask:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    calendar = self->_calendar;
    id v9 = [v6 backingAction];
    [(CalDAVCalendar *)calendar deleteAction:v9 completedWithError:v7];
  }
  return v7 == 0;
}

- (void)containerSyncTask:(id)a3 retrievedAddedOrModifiedActions:(id)a4 removed:(id)a5
{
}

- (void)containerSyncTask:(id)a3 completedWithNewCTag:(id)a4 newSyncToken:(id)a5 addedOrModified:(id)a6 removed:(id)a7 error:(id)a8
{
  SEL v33 = a2;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v34 = a3;
  v36 = (NSString *)a4;
  v37 = (NSString *)a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v35 = v14;
  [(CalDAVCalendarSyncOperation *)self _processAddedOrModified:v14 removed:v15];
  objc_super v17 = [MEMORY[0x263F34B30] sharedLogging];
  v18 = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]);
  id WeakRetained = objc_loadWeakRetained(v18);
  v20 = [v17 logHandleForAccountInfoProvider:WeakRetained];

  if (v20)
  {
    v21 = v20;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = [(CalDAVCalendar *)self->_calendar title];
      v23 = &stru_26C4CD4C0;
      if (v16) {
        char v24 = @" Error was: ";
      }
      else {
        char v24 = &stru_26C4CD4C0;
      }
      if (v16)
      {
        v23 = [v16 description];
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2112;
      id v40 = v23;
      _os_log_impl(&dword_213CEC000, v21, OS_LOG_TYPE_INFO, "Finished syncing container \"%@\".%@%@", buf, 0x20u);
      if (v16) {
    }
      }
  }

  if (v16) {
    goto LABEL_23;
  }
  nextCtag = v36;
  if (!v36) {
    nextCtag = self->_nextCtag;
  }
  -[CalDAVCalendar setCtag:](self->_calendar, "setCtag:", nextCtag, v33, v34);
  nextSyncToken = v37;
  if (!v37) {
    nextSyncToken = self->_nextSyncToken;
  }
  [(CalDAVCalendar *)self->_calendar setSyncToken:nextSyncToken];
  v27 = [(CalDAVOperation *)self principal];
  if (![v27 isMergeSync]
    || ([(CalDAVCalendar *)self->_calendar isNotification] & 1) != 0
    || ([(CalDAVCalendar *)self->_calendar isSubscribed] & 1) != 0
    || ([(CalDAVCalendar *)self->_calendar isScheduleInbox] & 1) != 0
    || [(CalDAVCalendar *)self->_calendar isScheduleOutbox])
  {

LABEL_23:
    -[CalDAVCalendarSyncOperation _finishWithError:](self, "_finishWithError:", v16, v33);
    goto LABEL_24;
  }
  char v28 = objc_opt_respondsToSelector();

  if ((v28 & 1) == 0) {
    goto LABEL_23;
  }
  v29 = [MEMORY[0x263F34B30] sharedLogging];
  id v30 = objc_loadWeakRetained(v18);
  v31 = [v29 logHandleForAccountInfoProvider:v30];

  if (v31 && os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CEC000, v31, OS_LOG_TYPE_INFO, "This is a merge sync. Collecting merge actions from calendar and beginning upload", buf, 2u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  calendar = self->_calendar;
  LOBYTE(v40) = 0;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __113__CalDAVCalendarSyncOperation_containerSyncTask_completedWithNewCTag_newSyncToken_addedOrModified_removed_error___block_invoke;
  v38[3] = &unk_2641EC338;
  void v38[4] = self;
  v38[5] = buf;
  v38[6] = v33;
  [(CalDAVCalendar *)calendar prepareMergeSyncActionsWithCompletionBlock:v38];
  _Block_object_dispose(buf, 8);
LABEL_24:
}

uint64_t __113__CalDAVCalendarSyncOperation_containerSyncTask_completedWithNewCTag_newSyncToken_addedOrModified_removed_error___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F34B30] sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F34C60]));
  NSUInteger v4 = [v2 logHandleForAccountInfoProvider:WeakRetained];

  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_213CEC000, v4, OS_LOG_TYPE_INFO, "Sync action completion block was called", v8, 2u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"CalDAVCalendarSyncOperation.m" lineNumber:365 description:@"The sync action completion block should only be called once"];

    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = 1;
  return [*(id *)(a1 + 32) _syncEventsForMerge];
}

- (void)reportJunkAction:(id)a3 completedWithError:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(CalDAVCalendar *)self->_calendar reportJunkAction:v7 completedWithError:v6];
  }
}

- (void)recurrenceSplitAction:(id)a3 completedWithUpdatedETag:(id)a4 updatedScheduleTag:(id)a5 createdURL:(id)a6 createdETag:(id)a7 createdScheduleTag:(id)a8
{
  id v19 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (objc_opt_respondsToSelector()) {
    [(CalDAVCalendar *)self->_calendar recurrenceSplitAction:v19 completedWithUpdatedETag:v14 updatedScheduleTag:v15 createdURL:v16 createdETag:v17 createdScheduleTag:v18];
  }
}

- (void)recurrenceSplitAction:(id)a3 failedWithError:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(CalDAVCalendar *)self->_calendar recurrenceSplitAction:v7 failedWithError:v6];
  }
}

- (BOOL)getScheduleTags
{
  return self->_getScheduleTags;
}

- (void)setGetScheduleTags:(BOOL)a3
{
  self->_getScheduleTags = a3;
}

- (BOOL)getScheduleChanges
{
  return self->_getScheduleChanges;
}

- (void)setGetScheduleChanges:(BOOL)a3
{
  self->_getScheduleChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportJunkError, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_nextSyncToken, 0);
  objc_storeStrong((id *)&self->_nextCtag, 0);
  objc_storeStrong((id *)&self->_savedError, 0);
}

@end