@interface CalDAVReportJunkTaskGroup
- (CalDAVReportJunkTaskGroup)initWithReportJunkActions:(id)a3 accountInfoProvider:(id)a4 taskManager:(id)a5;
- (void)startTaskGroup;
@end

@implementation CalDAVReportJunkTaskGroup

- (CalDAVReportJunkTaskGroup)initWithReportJunkActions:(id)a3 accountInfoProvider:(id)a4 taskManager:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CalDAVReportJunkTaskGroup;
  v10 = [(CoreDAVTaskGroup *)&v13 initWithAccountInfoProvider:a4 taskManager:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_reportJunkActions, a3);
  }

  return v11;
}

- (void)startTaskGroup
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  group = dispatch_group_create();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  v28[4] = __Block_byref_object_dispose_;
  id v29 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_reportJunkActions;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v25;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v25 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v24 + 1) + 8 * v5);
        v7 = [CalDAVPostAuditFailureTask alloc];
        v8 = [v6 resourceURL];
        id v9 = [(CalDAVPostAuditFailureTask *)v7 initWithResourceURL:v8 reason:0];

        v10 = [(CoreDAVTaskGroup *)self accountInfoProvider];
        [(CalDAVPostAuditFailureTask *)v9 setAccountInfoProvider:v10];

        objc_initWeak(&location, self);
        objc_initWeak(&from, v9);
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __43__CalDAVReportJunkTaskGroup_startTaskGroup__block_invoke;
        v17[3] = &unk_2641EBEE8;
        objc_copyWeak(&v20, &location);
        objc_copyWeak(&v21, &from);
        v19 = v28;
        v17[4] = v6;
        v11 = group;
        v18 = v11;
        [(CalDAVPostAuditFailureTask *)v9 setCompletionBlock:v17];
        v12 = [(CoreDAVTaskGroup *)self outstandingTasks];
        [v12 addObject:v9];

        dispatch_group_enter(v11);
        objc_super v13 = [(CoreDAVTaskGroup *)self taskManager];
        [v13 submitQueuedCoreDAVTask:v9];

        objc_destroyWeak(&v21);
        objc_destroyWeak(&v20);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v3);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__CalDAVReportJunkTaskGroup_startTaskGroup__block_invoke_2;
  block[3] = &unk_2641EBF10;
  block[4] = self;
  block[5] = v28;
  dispatch_group_notify(group, MEMORY[0x263EF83A0], block);
  _Block_object_dispose(v28, 8);
}

void __43__CalDAVReportJunkTaskGroup_startTaskGroup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained outstandingTasks];
    [v3 removeObject:v2];
  }
  uint64_t v4 = [v2 error];
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
  }
  uint64_t v5 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 reportJunkAction:*(void *)(a1 + 32) completedWithError:v4];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __43__CalDAVReportJunkTaskGroup_startTaskGroup__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishCoreDAVTaskGroupWithError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) delegateCallbackBlock:0];
}

- (void).cxx_destruct
{
}

@end