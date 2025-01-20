@interface CalDAVRetrieveSharedCalendarShareesTaskGroup
- (CalDAVRetrieveSharedCalendarShareesTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4;
- (CalDAVRetrieveSharedCalendarShareesTaskGroup)initWithCalendarURL:(id)a3 accountInfoProvider:(id)a4 taskManager:(id)a5;
- (NSSet)sharees;
- (NSURL)url;
- (void)setSharees:(id)a3;
- (void)setUrl:(id)a3;
- (void)startTaskGroup;
- (void)task:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CalDAVRetrieveSharedCalendarShareesTaskGroup

- (CalDAVRetrieveSharedCalendarShareesTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Initializing this class instance with an inherited initializer not allowed." userInfo:0];
  objc_exception_throw(v7);
}

- (CalDAVRetrieveSharedCalendarShareesTaskGroup)initWithCalendarURL:(id)a3 accountInfoProvider:(id)a4 taskManager:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CalDAVRetrieveSharedCalendarShareesTaskGroup;
  v9 = [(CoreDAVTaskGroup *)&v12 initWithAccountInfoProvider:a4 taskManager:a5];
  v10 = v9;
  if (v9)
  {
    [(CalDAVRetrieveSharedCalendarShareesTaskGroup *)v9 setUrl:v8];
    [(CalDAVRetrieveSharedCalendarShareesTaskGroup *)v10 setSharees:0];
  }

  return v10;
}

- (void)startTaskGroup
{
  id v3 = objc_alloc(MEMORY[0x263F34B00]);
  id v10 = (id)[v3 initWithNameSpace:*MEMORY[0x263F34DA8] name:@"invite" parseClass:objc_opt_class()];
  id v4 = objc_alloc(MEMORY[0x263F34B80]);
  id v5 = [MEMORY[0x263EFFA08] setWithObject:v10];
  id v6 = [(CalDAVRetrieveSharedCalendarShareesTaskGroup *)self url];
  id v7 = (void *)[v4 initWithPropertiesToFind:v5 atURL:v6 withDepth:2];

  id v8 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v7 setAccountInfoProvider:v8];

  [v7 setDelegate:self];
  v9 = [(CoreDAVTaskGroup *)self taskManager];
  [v9 submitQueuedCoreDAVTask:v7];
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a4;
  id v9 = v6;
  if (!v6)
  {
    id v7 = [a3 successfulValueForNameSpace:*MEMORY[0x263F34DA8] elementName:@"invite"];
    id v8 = [v7 users];
    [(CalDAVRetrieveSharedCalendarShareesTaskGroup *)self setSharees:v8];

    id v6 = 0;
  }
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v6 delegateCallbackBlock:0];
}

- (NSSet)sharees
{
  return self->_sharees;
}

- (void)setSharees:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sharees, 0);
}

@end