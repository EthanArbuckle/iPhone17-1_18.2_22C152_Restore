@interface CalDAVSetOfficeHoursTaskGroup
- (CalDAVSetOfficeHoursTaskGroup)initWithAccountInfoProvider:(id)a3 inboxURL:(id)a4 calendarAvailability:(id)a5 taskManager:(id)a6;
- (ICSDocument)calendarAvailability;
- (NSURL)inboxURL;
- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5;
- (void)setCalendarAvailability:(id)a3;
- (void)setInboxURL:(id)a3;
- (void)startTaskGroup;
@end

@implementation CalDAVSetOfficeHoursTaskGroup

- (CalDAVSetOfficeHoursTaskGroup)initWithAccountInfoProvider:(id)a3 inboxURL:(id)a4 calendarAvailability:(id)a5 taskManager:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CalDAVSetOfficeHoursTaskGroup;
  v12 = [(CoreDAVTaskGroup *)&v15 initWithAccountInfoProvider:a3 taskManager:a6];
  v13 = v12;
  if (v12)
  {
    [(CalDAVSetOfficeHoursTaskGroup *)v12 setInboxURL:v10];
    [(CalDAVSetOfficeHoursTaskGroup *)v13 setCalendarAvailability:v11];
  }

  return v13;
}

- (void)startTaskGroup
{
  v3 = [(CalDAVSetOfficeHoursTaskGroup *)self calendarAvailability];
  v4 = [v3 ICSStringWithOptions:0];
  id v14 = [v4 dataUsingEncoding:4];

  id v5 = objc_alloc(MEMORY[0x263F34AF8]);
  v6 = (void *)[v5 initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"calendar-availability"];
  [v6 setPayload:v14];
  id v7 = objc_alloc(MEMORY[0x263F34B88]);
  v8 = [MEMORY[0x263EFFA08] setWithObject:v6];
  v9 = [(CalDAVSetOfficeHoursTaskGroup *)self inboxURL];
  id v10 = (void *)[v7 initWithPropertiesToSet:v8 andRemove:0 atURL:v9];

  id v11 = [(CoreDAVTaskGroup *)self outstandingTasks];
  [v11 addObject:v10];

  v12 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v10 setAccountInfoProvider:v12];

  [v10 setDelegate:self];
  v13 = [(CoreDAVTaskGroup *)self taskManager];
  [v13 submitQueuedCoreDAVTask:v10];
}

- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v9 = a5;
  id v7 = a3;
  v8 = [(CoreDAVTaskGroup *)self outstandingTasks];
  [v8 removeObject:v7];

  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v9 delegateCallbackBlock:0];
}

- (NSURL)inboxURL
{
  return self->_inboxURL;
}

- (void)setInboxURL:(id)a3
{
}

- (ICSDocument)calendarAvailability
{
  return self->_calendarAvailability;
}

- (void)setCalendarAvailability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarAvailability, 0);
  objc_storeStrong((id *)&self->_inboxURL, 0);
}

@end