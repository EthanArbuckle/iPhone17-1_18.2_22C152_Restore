@interface CalDAVRecurrenceSplitTaskGroup
- (CalDAVRecurrenceSplitTaskGroup)initWithCalendar:(id)a3 accountInfoProvider:(id)a4 taskManager:(id)a5;
- (void)startTaskGroup;
@end

@implementation CalDAVRecurrenceSplitTaskGroup

- (CalDAVRecurrenceSplitTaskGroup)initWithCalendar:(id)a3 accountInfoProvider:(id)a4 taskManager:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CalDAVRecurrenceSplitTaskGroup;
  v9 = [(CoreDAVTaskGroup *)&v15 initWithAccountInfoProvider:a4 taskManager:a5];
  if (v9)
  {
    uint64_t v10 = [v8 calendarURL];
    folderURL = v9->_folderURL;
    v9->_folderURL = (NSURL *)v10;

    if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = [v8 recurrenceSplitActions];
      actions = v9->_actions;
      v9->_actions = (NSArray *)v12;
    }
  }

  return v9;
}

- (void)startTaskGroup
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  group = dispatch_group_create();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__0;
  v33[4] = __Block_byref_object_dispose__0;
  id v34 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = self->_actions;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v3)
  {
    uint64_t v16 = *(void *)v30;
    do
    {
      uint64_t v18 = v3;
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v6 = [CalDAVPostCalendarItemRecurrenceSplitTask alloc];
        v7 = [v5 resourceURL];
        id v8 = [v5 recurrenceDate];
        v9 = -[CalDAVPostCalendarItemRecurrenceSplitTask initWithResourceURL:recurrenceDate:floating:allday:](v6, "initWithResourceURL:recurrenceDate:floating:allday:", v7, v8, [v5 isFloating], objc_msgSend(v5, "isAllDay"));

        uint64_t v10 = [v5 uidForCreatedSeries];
        [(CalDAVPostCalendarItemRecurrenceSplitTask *)v9 setUidForCreatedSeries:v10];

        id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F34C60]));
        [(CalDAVPostCalendarItemRecurrenceSplitTask *)v9 setAccountInfoProvider:WeakRetained];

        objc_initWeak(&location, self);
        objc_initWeak(&from, v9);
        objc_initWeak(&v26, v5);
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __48__CalDAVRecurrenceSplitTaskGroup_startTaskGroup__block_invoke;
        v20[3] = &unk_2641EBFF8;
        objc_copyWeak(&v23, &location);
        objc_copyWeak(&v24, &from);
        objc_copyWeak(&v25, &v26);
        v22 = v33;
        v20[4] = self;
        uint64_t v12 = group;
        v21 = v12;
        [(CalDAVPostCalendarItemRecurrenceSplitTask *)v9 setCompletionBlock:v20];
        v13 = [(CoreDAVTaskGroup *)self outstandingTasks];
        [v13 addObject:v9];

        dispatch_group_enter(v12);
        v14 = [(CoreDAVTaskGroup *)self taskManager];
        [v14 submitQueuedCoreDAVTask:v9];

        objc_destroyWeak(&v25);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&v23);
        objc_destroyWeak(&v26);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v3);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CalDAVRecurrenceSplitTaskGroup_startTaskGroup__block_invoke_2;
  block[3] = &unk_2641EBF10;
  block[4] = self;
  block[5] = v33;
  dispatch_group_notify(group, MEMORY[0x263EF83A0], block);
  _Block_object_dispose(v33, 8);
}

void __48__CalDAVRecurrenceSplitTaskGroup_startTaskGroup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v4 = [WeakRetained outstandingTasks];
    [v4 removeObject:v2];
  }
  v5 = [v2 error];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void *)(v6 + 40);
  v7 = (id *)(v6 + 40);
  if (!v8) {
    objc_storeStrong(v7, v5);
  }
  v9 = [*(id *)(a1 + 32) delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [*(id *)(a1 + 32) delegate];
    [v11 recurrenceSplitAction:v3 failedWithError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  else
  {
LABEL_8:
    uint64_t v12 = [*(id *)(a1 + 32) delegate];
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      goto LABEL_11;
    }
    v11 = [*(id *)(a1 + 32) delegate];
    v14 = [v2 updatedETag];
    objc_super v15 = [v2 updatedScheduleTag];
    uint64_t v16 = [v2 createdURL];
    v17 = [v2 createdETag];
    uint64_t v18 = [v2 createdScheduleTag];
    [v11 recurrenceSplitAction:v3 completedWithUpdatedETag:v14 updatedScheduleTag:v15 createdURL:v16 createdETag:v17 createdScheduleTag:v18];
  }
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __48__CalDAVRecurrenceSplitTaskGroup_startTaskGroup__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishCoreDAVTaskGroupWithError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) delegateCallbackBlock:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);
}

@end