@interface CalDAVMergeUploadTaskGroup
- (BOOL)shouldTrySyncTokenForBulkUpload;
- (CalDAVBulkUploadTaskGroup)uploadTaskGroup;
- (CalDAVCalendar)calendar;
- (CalDAVMergeUploadTaskGroup)initWithCalendar:(id)a3 principal:(id)a4 accountInfoProvider:(id)a5 taskManager:(id)a6;
- (CalDAVPrincipal)principal;
- (id)dataContentType;
- (void)_performBulkUpload;
- (void)_performRegularUpload;
- (void)cancelTaskGroup;
- (void)dealloc;
- (void)setCalendar:(id)a3;
- (void)setPrincipal:(id)a3;
- (void)setShouldTrySyncTokenForBulkUpload:(BOOL)a3;
- (void)setUploadTaskGroup:(id)a3;
- (void)startTaskGroup;
@end

@implementation CalDAVMergeUploadTaskGroup

- (CalDAVMergeUploadTaskGroup)initWithCalendar:(id)a3 principal:(id)a4 accountInfoProvider:(id)a5 taskManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CalDAVMergeUploadTaskGroup;
  v13 = [(CoreDAVTaskGroup *)&v16 initWithAccountInfoProvider:a5 taskManager:a6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_calendar, a3);
    objc_storeStrong((id *)&v14->_principal, a4);
  }

  return v14;
}

- (void)dealloc
{
  [(CoreDAVTaskGroup *)self->_uploadTaskGroup cancelTaskGroup];
  v3.receiver = self;
  v3.super_class = (Class)CalDAVMergeUploadTaskGroup;
  [(CoreDAVTaskGroup *)&v3 dealloc];
}

- (id)dataContentType
{
  return @"text/calendar; charset=utf-8";
}

- (void)_performBulkUpload
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F34B30] sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F34C60]));
  v5 = [v3 logHandleForAccountInfoProvider:WeakRetained];

  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [(CalDAVCalendar *)self->_calendar uuidsToAddActions];
      uint64_t v8 = [v7 count];
      v9 = [(CalDAVCalendar *)self->_calendar hrefsToModDeleteActions];
      uint64_t v10 = [v9 count];
      id v11 = [(CalDAVCalendar *)self->_calendar calendarURL];
      *(_DWORD *)buf = 134218498;
      uint64_t v35 = v8;
      __int16 v36 = 2048;
      uint64_t v37 = v10;
      __int16 v38 = 2112;
      v39 = v11;
      _os_log_impl(&dword_213CEC000, v6, OS_LOG_TYPE_INFO, "Performing a bulk upload of %lu/%lu items to the server at %@", buf, 0x20u);
    }
  }

  id v12 = [(CalDAVCalendar *)self->_calendar bulkRequests];
  v29 = [v12 objectForKey:*MEMORY[0x263F34E88]];

  v13 = [v29 objectForKey:*MEMORY[0x263F34E90]];
  uint64_t v14 = [v13 integerValue];

  v15 = [v29 objectForKey:*MEMORY[0x263F34E98]];
  uint64_t v16 = [v15 integerValue];

  v17 = [(CalDAVCalendar *)self->_calendar ctag];
  if (self->_shouldTrySyncTokenForBulkUpload)
  {
    uint64_t v18 = [(CalDAVCalendar *)self->_calendar syncToken];

    v17 = (void *)v18;
  }
  v19 = [CalDAVBulkUploadTaskGroup alloc];
  v20 = [(CalDAVCalendar *)self->_calendar calendarURL];
  v21 = [(CalDAVCalendar *)self->_calendar uuidsToAddActions];
  v22 = [(CalDAVCalendar *)self->_calendar hrefsToModDeleteActions];
  principal = self->_principal;
  v24 = [(CoreDAVTaskGroup *)self taskManager];
  v25 = [(CalDAVBulkUploadTaskGroup *)v19 initWithFolderURL:v20 checkCTag:v17 uuidsToAddActions:v21 hrefsToModDeleteActions:v22 context:0 accountInfoProvider:principal taskManager:v24];
  uploadTaskGroup = self->_uploadTaskGroup;
  self->_uploadTaskGroup = v25;

  if (v14)
  {
    if (v14 >= 25) {
      uint64_t v27 = 25;
    }
    else {
      uint64_t v27 = v14;
    }
    [(CoreDAVBulkUploadTaskGroup *)self->_uploadTaskGroup setMultiPutBatchMaxNumResources:v27];
  }
  if (v16) {
    [(CoreDAVBulkUploadTaskGroup *)self->_uploadTaskGroup setMultiPutBatchMaxSize:v16];
  }
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, self->_uploadTaskGroup);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __48__CalDAVMergeUploadTaskGroup__performBulkUpload__block_invoke;
  v30[3] = &unk_2641EBF60;
  objc_copyWeak(&v31, &location);
  objc_copyWeak(&v32, (id *)buf);
  v28 = [(CalDAVMergeUploadTaskGroup *)self uploadTaskGroup];
  [v28 setCompletionBlock:v30];

  [(CoreDAVBulkUploadTaskGroup *)self->_uploadTaskGroup startTaskGroup];
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __48__CalDAVMergeUploadTaskGroup__performBulkUpload__block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained error];

  if (!v4)
  {
    id v7 = objc_loadWeakRetained(v2);
    uint64_t v8 = [v7 uuidToHREF];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __48__CalDAVMergeUploadTaskGroup__performBulkUpload__block_invoke_2;
    v45[3] = &unk_2641EC3D8;
    objc_copyWeak(&v46, (id *)(a1 + 40));
    [v8 enumerateKeysAndObjectsUsingBlock:v45];

    id v9 = objc_loadWeakRetained(v2);
    uint64_t v10 = [v9 hrefToETag];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __48__CalDAVMergeUploadTaskGroup__performBulkUpload__block_invoke_3;
    v43[3] = &unk_2641EC3D8;
    objc_copyWeak(&v44, (id *)(a1 + 40));
    [v10 enumerateKeysAndObjectsUsingBlock:v43];

    id v11 = objc_loadWeakRetained(v2);
    id v12 = [v11 nextCTag];

    if (v12)
    {
      id v13 = objc_loadWeakRetained(v2);
      uint64_t v14 = [v13 nextCTag];
      id v15 = objc_loadWeakRetained((id *)(a1 + 40));
      uint64_t v16 = [v15 calendar];
      [v16 setCtag:v14];
    }
    objc_destroyWeak(&v44);
    objc_destroyWeak(&v46);
    id v17 = objc_loadWeakRetained(v2);
    char v18 = [v17 validCTag];

    if ((v18 & 1) == 0) {
      goto LABEL_9;
    }
    v4 = 0;
LABEL_20:
    id v37 = objc_loadWeakRetained((id *)(a1 + 40));
    [v37 finishCoreDAVTaskGroupWithError:v4 delegateCallbackBlock:0];
    goto LABEL_21;
  }
  v5 = [v4 domain];
  if (([v5 isEqualToString:*MEMORY[0x263F34A98]] & 1) == 0)
  {

    goto LABEL_20;
  }
  uint64_t v6 = [v4 code];

  if (v6 != 412) {
    goto LABEL_20;
  }
LABEL_9:
  id location = (id *)(a1 + 40);
  id v19 = objc_loadWeakRetained((id *)(a1 + 40));
  if ([v19 shouldTrySyncTokenForBulkUpload])
  {
LABEL_18:

    goto LABEL_19;
  }
  id v41 = objc_loadWeakRetained(location);
  v20 = [v41 calendar];
  v21 = [v20 syncToken];
  if (![v21 length])
  {

    goto LABEL_18;
  }
  id v40 = objc_loadWeakRetained(location);
  v22 = [v40 calendar];
  v23 = [v22 syncToken];
  id v24 = objc_loadWeakRetained(location);
  v25 = [v24 calendar];
  v26 = [v25 ctag];
  char v39 = [v23 isEqualToString:v26];

  if (v39)
  {
LABEL_19:
    uint64_t v38 = [MEMORY[0x263F087E8] errorWithDomain:@"CalDAVErrorDomain" code:1 userInfo:0];

    v4 = (void *)v38;
    goto LABEL_20;
  }
  uint64_t v27 = [MEMORY[0x263F34B30] sharedLogging];
  v28 = [v27 logHandleForAccountInfoProvider:0];
  v29 = v28;
  if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    id v30 = objc_loadWeakRetained(location);
    id v31 = [v30 calendar];
    id v32 = [v31 ctag];
    id v33 = objc_loadWeakRetained(location);
    v34 = [v33 calendar];
    uint64_t v35 = [v34 syncToken];
    *(_DWORD *)buf = 138543618;
    v48 = v32;
    __int16 v49 = 2114;
    v50 = v35;
    _os_log_impl(&dword_213CEC000, v29, OS_LOG_TYPE_INFO, "Bulk upload failed with a precondition error for ctag %{public}@, but we have sync-token %{public}@ that just might work. Retrying with that value.", buf, 0x16u);
  }
  id v36 = objc_loadWeakRetained(location);
  [v36 setShouldTrySyncTokenForBulkUpload:1];

  id v37 = objc_loadWeakRetained(location);
  [v37 _performBulkUpload];
LABEL_21:
}

void __48__CalDAVMergeUploadTaskGroup__performBulkUpload__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = [WeakRetained calendar];
  [v7 setURL:v5 forResourceWithUUID:v6];
}

void __48__CalDAVMergeUploadTaskGroup__performBulkUpload__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = [WeakRetained calendar];
  [v7 setEtag:v5 forItemAtURL:v6];
}

- (void)_performRegularUpload
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v4 = [MEMORY[0x263F34B30] sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F34C60]));
  id v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

  if (v6)
  {
    id v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [(CalDAVCalendar *)self->_calendar uuidsToAddActions];
      uint64_t v9 = [v8 count];
      uint64_t v10 = [(CalDAVCalendar *)self->_calendar hrefsToModDeleteActions];
      uint64_t v11 = [v10 count];
      id v12 = [(CalDAVCalendar *)self->_calendar calendarURL];
      *(_DWORD *)buf = 134218498;
      uint64_t v35 = v9;
      __int16 v36 = 2048;
      uint64_t v37 = v11;
      __int16 v38 = 2112;
      char v39 = v12;
      _os_log_impl(&dword_213CEC000, v7, OS_LOG_TYPE_INFO, "Performing PUT uploads of %lu/%lu items to the server at %@", buf, 0x20u);
    }
  }

  id v13 = [(CalDAVCalendar *)self->_calendar uuidsToAddActions];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke;
  v31[3] = &unk_2641EC3A8;
  v31[4] = self;
  id v14 = v3;
  id v32 = v14;
  [v13 enumerateKeysAndObjectsUsingBlock:v31];

  id v15 = [(CalDAVCalendar *)self->_calendar hrefsToModDeleteActions];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke_3;
  v29[3] = &unk_2641EC3A8;
  v29[4] = self;
  id v16 = v14;
  id v30 = v16;
  [v15 enumerateKeysAndObjectsUsingBlock:v29];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    v21 = (int *)MEMORY[0x263F34C70];
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v25 + 1) + 8 * v22);
        id v24 = [(CoreDAVTaskGroup *)self taskManager];
        [v24 submitQueuedCoreDAVTask:v23];

        [*(id *)((char *)&self->super.super.isa + *v21) addObject:v23];
        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }
}

void __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 context];
  uint64_t v8 = [v7 serverID];
  uint64_t v9 = [CalDAVPutCalendarItemTask alloc];
  uint64_t v10 = [v7 dataPayload];
  uint64_t v11 = [*(id *)(a1 + 32) dataContentType];
  id v12 = [(CoreDAVPostOrPutTask *)v9 initWithDataPayload:v10 dataContentType:v11 atURL:v8 previousETag:0];

  id v13 = [*(id *)(a1 + 32) accountInfoProvider];
  [(CalDAVPutCalendarItemTask *)v12 setAccountInfoProvider:v13];

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, v12);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke_2;
  v15[3] = &unk_2641EC160;
  objc_copyWeak(&v17, &from);
  objc_copyWeak(&v18, &location);
  id v14 = v8;
  id v16 = v14;
  [(CalDAVPutCalendarItemTask *)v12 setCompletionBlock:v15];
  [*(id *)(a1 + 40) addObject:v12];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained error];

  if (!v4)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 48));
    id v6 = [v5 calendar];
    id v7 = objc_loadWeakRetained(v2);
    uint64_t v8 = [v7 nextETag];
    [v6 setEtag:v8 forItemAtURL:*(void *)(a1 + 32)];
  }
  uint64_t v9 = (id *)(a1 + 48);
  id v10 = objc_loadWeakRetained(v9);
  uint64_t v11 = [v10 outstandingTasks];
  id v12 = objc_loadWeakRetained(v2);
  [v11 removeObject:v12];

  id v13 = objc_loadWeakRetained(v9);
  id v14 = [v13 outstandingTasks];
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    id v16 = objc_loadWeakRetained(v9);
    [v16 finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:0];
  }
}

void __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  uint64_t v8 = [v6 context];
  uint64_t v9 = [CalDAVPutCalendarItemTask alloc];
  id v10 = [v8 dataPayload];
  uint64_t v11 = [*(id *)(a1 + 32) dataContentType];
  id v12 = [v8 syncKey];
  id v13 = [(CoreDAVPostOrPutTask *)v9 initWithDataPayload:v10 dataContentType:v11 atURL:v7 previousETag:v12];

  id v14 = [*(id *)(a1 + 32) accountInfoProvider];
  [(CalDAVPutCalendarItemTask *)v13 setAccountInfoProvider:v14];

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, v13);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke_4;
  v16[3] = &unk_2641EC160;
  objc_copyWeak(&v18, &from);
  objc_copyWeak(&v19, &location);
  id v15 = v7;
  id v17 = v15;
  [(CalDAVPutCalendarItemTask *)v13 setCompletionBlock:v16];
  [*(id *)(a1 + 40) addObject:v13];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke_4(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained error];

  if (!v4)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 48));
    id v6 = [v5 calendar];
    id v7 = objc_loadWeakRetained(v2);
    uint64_t v8 = [v7 nextETag];
    [v6 setEtag:v8 forItemAtURL:*(void *)(a1 + 32)];
  }
  uint64_t v9 = (id *)(a1 + 48);
  id v10 = objc_loadWeakRetained(v9);
  uint64_t v11 = [v10 outstandingTasks];
  id v12 = objc_loadWeakRetained(v2);
  [v11 removeObject:v12];

  id v13 = objc_loadWeakRetained(v9);
  id v14 = [v13 outstandingTasks];
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    id v16 = objc_loadWeakRetained(v9);
    [v16 finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:0];
  }
}

- (void)startTaskGroup
{
  id v3 = [(CalDAVCalendar *)self->_calendar uuidsToAddActions];
  if ([v3 count])
  {

LABEL_4:
    id v6 = [(CalDAVCalendar *)self->_calendar bulkRequests];
    id v10 = [v6 objectForKey:*MEMORY[0x263F34E88]];

    if (v10) {
      [(CalDAVMergeUploadTaskGroup *)self _performBulkUpload];
    }
    else {
      [(CalDAVMergeUploadTaskGroup *)self _performRegularUpload];
    }

    return;
  }
  v4 = [(CalDAVCalendar *)self->_calendar hrefsToModDeleteActions];
  uint64_t v5 = [v4 count];

  if (v5) {
    goto LABEL_4;
  }
  id v7 = [MEMORY[0x263F34B30] sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F34C60]));
  uint64_t v9 = [v7 logHandleForAccountInfoProvider:WeakRetained];

  if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CEC000, v9, OS_LOG_TYPE_INFO, "There's nothing for CalDAVMergeUploadTaskGroup to do. Exiting early", buf, 2u);
  }

  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:0];
}

- (void)cancelTaskGroup
{
  [(CoreDAVTaskGroup *)self->_uploadTaskGroup cancelTaskGroup];
  v3.receiver = self;
  v3.super_class = (Class)CalDAVMergeUploadTaskGroup;
  [(CoreDAVTaskGroup *)&v3 cancelTaskGroup];
}

- (CalDAVBulkUploadTaskGroup)uploadTaskGroup
{
  return self->_uploadTaskGroup;
}

- (void)setUploadTaskGroup:(id)a3
{
}

- (CalDAVCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (CalDAVPrincipal)principal
{
  return self->_principal;
}

- (void)setPrincipal:(id)a3
{
}

- (BOOL)shouldTrySyncTokenForBulkUpload
{
  return self->_shouldTrySyncTokenForBulkUpload;
}

- (void)setShouldTrySyncTokenForBulkUpload:(BOOL)a3
{
  self->_shouldTrySyncTokenForBulkUpload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_principal, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_uploadTaskGroup, 0);
}

@end