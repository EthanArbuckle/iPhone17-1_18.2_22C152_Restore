@interface CalDAVContainerSyncTaskGroup
- (BOOL)_shouldFetchEventsForState:(int)a3;
- (BOOL)_shouldFetchTodosForState:(int)a3;
- (BOOL)fallbackOnMultiGetError;
- (BOOL)getScheduleChanges;
- (BOOL)getScheduleTags;
- (BOOL)shouldFetchMoreETags;
- (BOOL)shouldFetchResourceWithEtag:(id)a3 propertiesToValues:(id)a4;
- (BOOL)supportsExtendedCalendarQuery;
- (BOOL)syncEvents;
- (BOOL)syncTodos;
- (CalDAVCalendar)calendar;
- (CalDAVContainerSyncTaskGroup)initWithCalendar:(id)a3 accountInfoProvider:(id)a4 taskManager:(id)a5;
- (CalDAVContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 accountInfoProvider:(id)a7 taskManager:(id)a8 appSpecificCalendarItemClass:(Class)a9;
- (CalDAVContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 getScheduleTags:(BOOL)a7 getScheduleChanges:(BOOL)a8 accountInfoProvider:(id)a9 taskManager:(id)a10 appSpecificCalendarItemClass:(Class)a11;
- (CalDAVContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 getScheduleTags:(BOOL)a6 getScheduleChanges:(BOOL)a7 accountInfoProvider:(id)a8 taskManager:(id)a9;
- (NSDateComponents)eventFilterEndDate;
- (NSDateComponents)eventFilterStartDate;
- (id)copyAdditionalResourcePropertiesToFetch;
- (id)copyGetEtagTaskWithPropertiesToFind:(id)a3;
- (id)copyGetTaskWithURL:(id)a3;
- (id)copyMultiGetTaskWithURLs:(id)a3;
- (id)copyPutTaskWithPayloadItem:(id)a3 forAction:(id)a4;
- (id)dataContentType;
- (void)applyAdditionalPropertiesFromPostTask:(id)a3;
- (void)applyAdditionalPropertiesFromPutTask:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setEventFilterEndDate:(id)a3;
- (void)setEventFilterStartDate:(id)a3;
- (void)setFallbackOnMultiGetError:(BOOL)a3;
- (void)setGetScheduleChanges:(BOOL)a3;
- (void)setGetScheduleTags:(BOOL)a3;
- (void)setSupportsExtendedCalendarQuery:(BOOL)a3;
- (void)setSyncEvents:(BOOL)a3;
- (void)setSyncTodos:(BOOL)a3;
@end

@implementation CalDAVContainerSyncTaskGroup

- (CalDAVContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 accountInfoProvider:(id)a7 taskManager:(id)a8 appSpecificCalendarItemClass:(Class)a9
{
  v12.receiver = self;
  v12.super_class = (Class)CalDAVContainerSyncTaskGroup;
  v9 = [(CoreDAVContainerSyncTaskGroup *)&v12 initWithFolderURL:a3 previousCTag:a4 previousSyncToken:a5 actions:a6 syncItemOrder:0 context:0 accountInfoProvider:a7 taskManager:a8];
  v10 = v9;
  if (v9)
  {
    [(CalDAVContainerSyncTaskGroup *)v9 setSyncEvents:1];
    [(CalDAVContainerSyncTaskGroup *)v10 setSyncTodos:1];
    *(_DWORD *)&v10->_getScheduleTags = 0;
    *(Class *)((char *)&v10->super.super.super.isa + (int)*MEMORY[0x263F34BF8]) = a9;
  }
  return v10;
}

- (CalDAVContainerSyncTaskGroup)initWithCalendar:(id)a3 accountInfoProvider:(id)a4 taskManager:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if (objc_opt_respondsToSelector()) {
    uint64_t v11 = [v8 appSpecificCalendarItemClass];
  }
  else {
    uint64_t v11 = 0;
  }
  objc_super v12 = [v8 ctag];
  v13 = [v8 syncToken];
  if ([v8 needsResync])
  {

    objc_super v12 = 0;
    v13 = 0;
  }
  v14 = [v8 calendarURL];
  v15 = [v8 syncActions];
  v16 = [(CalDAVContainerSyncTaskGroup *)self initWithFolderURL:v14 previousCTag:v12 previousSyncToken:v13 actions:v15 accountInfoProvider:v10 taskManager:v9 appSpecificCalendarItemClass:v11];

  if (v16)
  {
    [(CalDAVContainerSyncTaskGroup *)v16 setCalendar:v8];
    if ([v8 isScheduleInbox]) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = [v8 isNotification] ^ 1;
    }
    [(CalDAVContainerSyncTaskGroup *)v16 setGetScheduleTags:v17];
    -[CalDAVContainerSyncTaskGroup setGetScheduleChanges:](v16, "setGetScheduleChanges:", [v8 isScheduleInbox]);
    if ([v8 isNotification]) {
      [(CoreDAVContainerSyncTaskGroup *)v16 setUseMultiGet:0];
    }
  }

  return v16;
}

- (id)copyMultiGetTaskWithURLs:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__CalDAVContainerSyncTaskGroup_copyMultiGetTaskWithURLs___block_invoke;
  v14[3] = &unk_2641EBDC8;
  v14[4] = self;
  v5 = (void (**)(void, void))MEMORY[0x216696070](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__CalDAVContainerSyncTaskGroup_copyMultiGetTaskWithURLs___block_invoke_2;
  v12[3] = &unk_2641EBDF0;
  objc_copyWeak(&v13, &location);
  v6 = (void *)MEMORY[0x216696070](v12);
  if (*(&self->_fallbackOnMultiGetError + 4))
  {
    id v7 = objc_alloc(MEMORY[0x263F34B48]);
    id v8 = [(CoreDAVTaskGroup *)self accountInfoProvider];
    id v9 = [(CoreDAVTaskGroup *)self taskManager];
    id v10 = (void *)[v7 initWithURLs:v4 multiGetBlock:v5 getBlock:v6 accountInfoProvider:v8 taskManager:v9];
  }
  else
  {
    id v10 = ((void (**)(void, id))v5)[2](v5, v4);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v10;
}

CalDAVContainerMultiGetTask *__57__CalDAVContainerSyncTaskGroup_copyMultiGetTaskWithURLs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [CalDAVContainerMultiGetTask alloc];
  v5 = *(char **)(a1 + 32);
  uint64_t v6 = *(void *)&v5[*MEMORY[0x263F34C08]];
  uint64_t v7 = [v5 getScheduleTags];
  uint64_t v8 = [*(id *)(a1 + 32) getScheduleChanges];
  id v9 = [(CalDAVContainerMultiGetTask *)v4 initWithURLs:v3 atContainerURL:v6 getScheduleTags:v7 getScheduleChanges:v8 appSpecificCalendarItemClass:*(void *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F34BF8])];

  return v9;
}

id __57__CalDAVContainerSyncTaskGroup_copyMultiGetTaskWithURLs___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[WeakRetained copyGetTaskWithURL:v3];

  return v5;
}

- (id)copyGetTaskWithURL:(id)a3
{
  calendar = self->_calendar;
  id v4 = a3;
  int v5 = [(CalDAVCalendar *)calendar isNotification];
  uint64_t v6 = off_2641EB268;
  if (!v5) {
    uint64_t v6 = off_2641EB258;
  }
  uint64_t v7 = (void *)[objc_alloc(*v6) initWithURL:v4];

  return v7;
}

- (id)copyPutTaskWithPayloadItem:(id)a3 forAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CalDAVPutCalendarItemTask alloc];
  id v9 = [v6 dataPayload];
  id v10 = [(CalDAVContainerSyncTaskGroup *)self dataContentType];
  uint64_t v11 = [v6 serverID];
  int v12 = [v7 action];

  if (v12)
  {
    id v13 = [v6 syncKey];
    v14 = [(CoreDAVPostOrPutTask *)v8 initWithDataPayload:v9 dataContentType:v10 atURL:v11 previousETag:v13];
  }
  else
  {
    v14 = [(CoreDAVPostOrPutTask *)v8 initWithDataPayload:v9 dataContentType:v10 atURL:v11 previousETag:0];
  }

  v15 = [v6 scheduleTag];
  [(CalDAVPutCalendarItemTask *)v14 setPreviousScheduleTag:v15];

  return v14;
}

- (void)applyAdditionalPropertiesFromPutTask:(id)a3
{
  id v10 = a3;
  id v4 = [(CoreDAVTaskGroup *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [v10 responseHeaders];
    id v7 = [v6 CDVObjectForKeyCaseInsensitive:@"Schedule-Tag"];

    uint64_t v8 = [(CoreDAVTaskGroup *)self delegate];
    id v9 = [v10 url];
    [v8 setLocalScheduleTag:v7 forItemWithURL:v9 inFolderWithURL:*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C08])];
  }
}

- (void)applyAdditionalPropertiesFromPostTask:(id)a3
{
  id v10 = a3;
  id v4 = [(CoreDAVTaskGroup *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [v10 responseHeaders];
    id v7 = [v6 CDVObjectForKeyCaseInsensitive:@"Schedule-Tag"];

    uint64_t v8 = [(CoreDAVTaskGroup *)self delegate];
    id v9 = [v10 url];
    [v8 setLocalScheduleTag:v7 forItemWithURL:v9 inFolderWithURL:*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C08])];
  }
}

- (BOOL)shouldFetchMoreETags
{
  return *(_DWORD *)&self->_getScheduleTags == 3 && [(CalDAVContainerSyncTaskGroup *)self syncTodos];
}

- (BOOL)_shouldFetchEventsForState:(int)a3
{
  BOOL result = [(CalDAVContainerSyncTaskGroup *)self syncEvents];
  if ((a3 & 0xFFFFFFFE) != 2) {
    return 0;
  }
  return result;
}

- (BOOL)_shouldFetchTodosForState:(int)a3
{
  BOOL v4 = [(CalDAVContainerSyncTaskGroup *)self syncTodos];
  BOOL v6 = a3 == 2 || a3 == 4;
  return v4 && v6;
}

- (id)copyGetEtagTaskWithPropertiesToFind:(id)a3
{
  id v5 = a3;
  calendar = self->_calendar;
  if (calendar)
  {
    char v7 = [(CalDAVCalendar *)calendar isEventContainer];
    char v8 = v7 ^ [(CalDAVCalendar *)self->_calendar isTaskContainer];
    calendar = self->_calendar;
  }
  else
  {
    char v8 = 0;
  }
  char v9 = [(CalDAVCalendar *)calendar isNotification];
  id v10 = (int *)MEMORY[0x263F34C38];
  if (v9) {
    goto LABEL_8;
  }
  if ([(CalDAVCalendar *)self->_calendar isScheduleInbox])
  {
    uint64_t v11 = [(CalDAVCalendar *)self->_calendar principal];
    int v12 = [v11 account];
    id v13 = [v12 serverVersion];
    int v14 = [v13 supportsTimeRangeFilterOnInbox];

    if (!v14) {
      goto LABEL_8;
    }
  }
  if (*((unsigned char *)&self->super.super.super.isa + *v10)) {
    goto LABEL_8;
  }
  if ((v8 & 1) == 0)
  {
    BOOL v20 = [(CalDAVContainerSyncTaskGroup *)self syncEvents];
    if (v20 != [(CalDAVContainerSyncTaskGroup *)self syncTodos])
    {
LABEL_19:
      if ([(CalDAVContainerSyncTaskGroup *)self syncEvents]
        && [(CalDAVContainerSyncTaskGroup *)self syncTodos])
      {
        unsigned int v23 = *(_DWORD *)&self->_getScheduleTags;
        if (v23 == 1)
        {
          v24 = [MEMORY[0x263F34B30] sharedLogging];
          id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
          v26 = [v24 logHandleForAccountInfoProvider:WeakRetained];

          if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_213CEC000, v26, OS_LOG_TYPE_DEFAULT, "<rdar://problem/11466753> Was asked for an etag task while our state is CalDAVContainerFetchingETagPropfindAll", buf, 2u);
          }

          unsigned int v23 = *(_DWORD *)&self->_getScheduleTags;
        }
        if (v23 >= 2)
        {
          if (v23 != 3)
          {
            v31 = [MEMORY[0x263F08690] currentHandler];
            objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CalDAVContainerSyncTaskGroup.m", 188, @"Unexpected state (%d) when fetching etags", *(unsigned int *)&self->_getScheduleTags);

            goto LABEL_37;
          }
          int v27 = 4;
        }
        else if ([(CalDAVContainerSyncTaskGroup *)self supportsExtendedCalendarQuery])
        {
          int v27 = 2;
        }
        else
        {
          int v27 = 3;
        }
      }
      else
      {
        if (![(CalDAVContainerSyncTaskGroup *)self syncEvents]
          && ![(CalDAVContainerSyncTaskGroup *)self syncTodos])
        {
          v32 = [MEMORY[0x263F08690] currentHandler];
          [v32 handleFailureInMethod:a2 object:self file:@"CalDAVContainerSyncTaskGroup.m" lineNumber:192 description:@"Attempted to sync neither Todos nor Events in a CalDAV container"];
        }
        if ([(CalDAVContainerSyncTaskGroup *)self syncEvents]) {
          int v27 = 3;
        }
        else {
          int v27 = 4;
        }
      }
      *(_DWORD *)&self->_getScheduleTags = v27;
LABEL_37:
      v28 = [CalDAVCalendarQueryTask alloc];
      v18 = [(CoreDAVPropFindTask *)v28 initWithPropertiesToFind:v5 atURL:*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C08]) withDepth:3];
      [(CalDAVCalendarQueryTask *)v18 setSyncEvents:[(CalDAVContainerSyncTaskGroup *)self _shouldFetchEventsForState:*(unsigned int *)&self->_getScheduleTags]];
      [(CalDAVCalendarQueryTask *)v18 setSyncTodos:[(CalDAVContainerSyncTaskGroup *)self _shouldFetchTodosForState:*(unsigned int *)&self->_getScheduleTags]];
      v29 = [(CalDAVContainerSyncTaskGroup *)self eventFilterStartDate];
      [(CalDAVCalendarQueryTask *)v18 setEventFilterStartDate:v29];

      v30 = [(CalDAVContainerSyncTaskGroup *)self eventFilterEndDate];
      [(CalDAVCalendarQueryTask *)v18 setEventFilterEndDate:v30];

      goto LABEL_12;
    }
  }
  if ([(CalDAVContainerSyncTaskGroup *)self syncEvents])
  {
    v21 = [(CalDAVContainerSyncTaskGroup *)self eventFilterStartDate];
    if (v21)
    {

      goto LABEL_19;
    }
    v22 = [(CalDAVContainerSyncTaskGroup *)self eventFilterEndDate];

    if (v22) {
      goto LABEL_19;
    }
  }
LABEL_8:
  *(_DWORD *)&self->_getScheduleTags = 1;
  if (*((unsigned char *)&self->super.super.super.isa + *v10))
  {
    id v15 = objc_alloc(MEMORY[0x263F34BA8]);
    uint64_t v16 = [v15 initWithPropertiesToFind:v5 atURL:*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C08]) withDepth:3 previousSyncToken:*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C28])];
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x263F34B80]);
    uint64_t v16 = [v17 initWithPropertiesToFind:v5 atURL:*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C08]) withDepth:3];
  }
  v18 = (CalDAVCalendarQueryTask *)v16;
LABEL_12:

  return v18;
}

- (id)dataContentType
{
  return @"text/calendar; charset=utf-8";
}

- (BOOL)shouldFetchResourceWithEtag:(id)a3 propertiesToValues:(id)a4
{
  calendar = self->_calendar;
  id v5 = a4;
  if ([(CalDAVCalendar *)calendar isNotification])
  {
    BOOL v6 = [v5 CDVObjectForKeyWithNameSpace:*MEMORY[0x263F34DA8] andName:@"notificationtype"];

    if ([v6 isInviteNotification] & 1) != 0 || (objc_msgSend(v6, "isInviteReply")) {
      char v7 = 1;
    }
    else {
      char v7 = [v6 isResourceChanged];
    }
  }
  else
  {
    char v8 = [v5 CDVObjectForKeyWithNameSpace:*MEMORY[0x263F34E10] andName:*MEMORY[0x263F34E30]];

    BOOL v6 = [v8 payloadAsString];

    char v7 = [v6 rangeOfString:@"text/calendar"] != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)copyAdditionalResourcePropertiesToFetch
{
  id v3 = objc_opt_new();
  int v4 = [(CalDAVCalendar *)self->_calendar isNotification];
  id v5 = (uint64_t *)MEMORY[0x263F34DA8];
  if (!v4) {
    id v5 = (uint64_t *)MEMORY[0x263F34E10];
  }
  uint64_t v6 = *v5;
  char v7 = cdXMLCalendarServerNotificationType;
  if (!v4) {
    char v7 = (__CFString **)MEMORY[0x263F34E30];
  }
  [v3 CDVAddItemParserMappingWithNameSpace:v6 name:*v7 parseClass:objc_opt_class()];
  return v3;
}

- (CalDAVContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 getScheduleTags:(BOOL)a7 getScheduleChanges:(BOOL)a8 accountInfoProvider:(id)a9 taskManager:(id)a10 appSpecificCalendarItemClass:(Class)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  id v13 = [(CalDAVContainerSyncTaskGroup *)self initWithFolderURL:a3 previousCTag:a4 previousSyncToken:a5 actions:a6 accountInfoProvider:a9 taskManager:a10 appSpecificCalendarItemClass:a11];
  [(CalDAVContainerSyncTaskGroup *)v13 setGetScheduleTags:v12];
  [(CalDAVContainerSyncTaskGroup *)v13 setGetScheduleChanges:v11];
  return v13;
}

- (CalDAVContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 getScheduleTags:(BOOL)a6 getScheduleChanges:(BOOL)a7 accountInfoProvider:(id)a8 taskManager:(id)a9
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = [(CalDAVContainerSyncTaskGroup *)self initWithFolderURL:a3 previousCTag:a4 previousSyncToken:a5 actions:0 accountInfoProvider:a8 taskManager:a9 appSpecificCalendarItemClass:0];
  [(CalDAVContainerSyncTaskGroup *)v11 setGetScheduleTags:v10];
  [(CalDAVContainerSyncTaskGroup *)v11 setGetScheduleChanges:v9];
  return v11;
}

- (CalDAVCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (BOOL)getScheduleTags
{
  return self->_supportsExtendedCalendarQuery;
}

- (void)setGetScheduleTags:(BOOL)a3
{
  self->_supportsExtendedCalendarQuery = a3;
}

- (BOOL)getScheduleChanges
{
  return self->_fallbackOnMultiGetError;
}

- (void)setGetScheduleChanges:(BOOL)a3
{
  self->_fallbackOnMultiGetError = a3;
}

- (BOOL)syncEvents
{
  return *(&self->_fallbackOnMultiGetError + 1);
}

- (void)setSyncEvents:(BOOL)a3
{
  *(&self->_fallbackOnMultiGetError + 1) = a3;
}

- (BOOL)syncTodos
{
  return *(&self->_fallbackOnMultiGetError + 2);
}

- (void)setSyncTodos:(BOOL)a3
{
  *(&self->_fallbackOnMultiGetError + 2) = a3;
}

- (BOOL)supportsExtendedCalendarQuery
{
  return *(&self->_fallbackOnMultiGetError + 3);
}

- (void)setSupportsExtendedCalendarQuery:(BOOL)a3
{
  *(&self->_fallbackOnMultiGetError + 3) = a3;
}

- (BOOL)fallbackOnMultiGetError
{
  return *(&self->_fallbackOnMultiGetError + 4);
}

- (void)setFallbackOnMultiGetError:(BOOL)a3
{
  *(&self->_fallbackOnMultiGetError + 4) = a3;
}

- (NSDateComponents)eventFilterStartDate
{
  return self->_eventFilterStartDate;
}

- (void)setEventFilterStartDate:(id)a3
{
}

- (NSDateComponents)eventFilterEndDate
{
  return self->_eventFilterEndDate;
}

- (void)setEventFilterEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventFilterEndDate, 0);
  objc_storeStrong((id *)&self->_eventFilterStartDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end