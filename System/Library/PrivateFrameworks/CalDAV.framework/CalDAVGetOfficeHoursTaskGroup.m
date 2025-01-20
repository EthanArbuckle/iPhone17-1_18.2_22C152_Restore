@interface CalDAVGetOfficeHoursTaskGroup
- (CalDAVGetOfficeHoursTaskGroup)initWithAccountInfoProvider:(id)a3 inboxURL:(id)a4 taskManager:(id)a5;
- (CoreDAVPropFindTask)fetchTask;
- (ICSDocument)calendarAvailability;
- (NSURL)inboxURL;
- (void)_finishWithError:(id)a3;
- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5;
- (void)setCalendarAvailability:(id)a3;
- (void)setFetchTask:(id)a3;
- (void)setInboxURL:(id)a3;
- (void)startTaskGroup;
@end

@implementation CalDAVGetOfficeHoursTaskGroup

- (CalDAVGetOfficeHoursTaskGroup)initWithAccountInfoProvider:(id)a3 inboxURL:(id)a4 taskManager:(id)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CalDAVGetOfficeHoursTaskGroup;
  v9 = [(CoreDAVTaskGroup *)&v12 initWithAccountInfoProvider:a3 taskManager:a5];
  v10 = v9;
  if (v9)
  {
    [(CalDAVGetOfficeHoursTaskGroup *)v9 setInboxURL:v8];
    [(CalDAVGetOfficeHoursTaskGroup *)v10 setCalendarAvailability:0];
    [(CalDAVGetOfficeHoursTaskGroup *)v10 setFetchTask:0];
  }

  return v10;
}

- (void)startTaskGroup
{
  id v3 = objc_alloc(MEMORY[0x263F34B00]);
  id v15 = (id)[v3 initWithNameSpace:*MEMORY[0x263F34DA8] name:@"calendar-availability" parseClass:objc_opt_class()];
  v4 = [MEMORY[0x263EFFA08] setWithObject:v15];
  id v5 = objc_alloc(MEMORY[0x263F34B80]);
  v6 = [(CalDAVGetOfficeHoursTaskGroup *)self inboxURL];
  v7 = (void *)[v5 initWithPropertiesToFind:v4 atURL:v6 withDepth:2];

  [(CalDAVGetOfficeHoursTaskGroup *)self setFetchTask:v7];
  id v8 = [(CoreDAVTaskGroup *)self outstandingTasks];
  v9 = [(CalDAVGetOfficeHoursTaskGroup *)self fetchTask];
  [v8 addObject:v9];

  v10 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  v11 = [(CalDAVGetOfficeHoursTaskGroup *)self fetchTask];
  [v11 setAccountInfoProvider:v10];

  objc_super v12 = [(CalDAVGetOfficeHoursTaskGroup *)self fetchTask];
  [v12 setDelegate:self];

  v13 = [(CoreDAVTaskGroup *)self taskManager];
  v14 = [(CalDAVGetOfficeHoursTaskGroup *)self fetchTask];
  [v13 submitQueuedCoreDAVTask:v14];
}

- (void)_finishWithError:(id)a3
{
}

- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v6 = a5;
  v7 = [(CoreDAVTaskGroup *)self outstandingTasks];
  id v8 = [(CalDAVGetOfficeHoursTaskGroup *)self fetchTask];
  [v7 removeObject:v8];

  if (!v6)
  {
    v9 = [(CalDAVGetOfficeHoursTaskGroup *)self fetchTask];
    v10 = [v9 successfulValueForNameSpace:*MEMORY[0x263F34DA8] elementName:@"calendar-availability"];

    if (v10)
    {
      v11 = [v10 payload];
      if (v11)
      {
        id v13 = 0;
        objc_super v12 = (void *)[objc_alloc(MEMORY[0x263F886E8]) initWithData:v11 options:0 error:&v13];
        id v6 = v13;
        [(CalDAVGetOfficeHoursTaskGroup *)self setCalendarAvailability:v12];
      }
      else
      {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  [(CalDAVGetOfficeHoursTaskGroup *)self _finishWithError:v6];
}

- (ICSDocument)calendarAvailability
{
  return self->_calendarAvailability;
}

- (void)setCalendarAvailability:(id)a3
{
}

- (NSURL)inboxURL
{
  return self->_inboxURL;
}

- (void)setInboxURL:(id)a3
{
}

- (CoreDAVPropFindTask)fetchTask
{
  return self->_fetchTask;
}

- (void)setFetchTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchTask, 0);
  objc_storeStrong((id *)&self->_inboxURL, 0);
  objc_storeStrong((id *)&self->_calendarAvailability, 0);
}

@end