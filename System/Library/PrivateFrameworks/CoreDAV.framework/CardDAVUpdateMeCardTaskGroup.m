@interface CardDAVUpdateMeCardTaskGroup
- (CardDAVUpdateMeCardTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 homeURL:(id)a5 cardURL:(id)a6;
- (NSString)description;
- (NSURL)cardURL;
- (NSURL)homeURL;
- (id)_newPropPatchTask;
- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5;
- (void)startTaskGroup;
@end

@implementation CardDAVUpdateMeCardTaskGroup

- (CardDAVUpdateMeCardTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 homeURL:(id)a5 cardURL:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CardDAVUpdateMeCardTaskGroup;
  v13 = [(CoreDAVTaskGroup *)&v16 initWithAccountInfoProvider:a3 taskManager:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_homeURL, a5);
    objc_storeStrong((id *)&v14->_cardURL, a6);
  }

  return v14;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@ %p: %@", v5, self, self->_cardURL];

  return (NSString *)v6;
}

- (id)_newPropPatchTask
{
  v3 = [[CoreDAVHrefItem alloc] initWithURL:self->_cardURL];
  [(CoreDAVHrefItem *)v3 setWriteStyle:2];
  v4 = [[CoreDAVItemWithHrefChildItem alloc] initWithNameSpace:@"http://calendarserver.org/ns/" andName:@"me-card"];
  [(CoreDAVItemWithHrefChildItem *)v4 setHref:v3];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", v4, 0);
  v6 = [[CoreDAVPropPatchTask alloc] initWithPropertiesToSet:v5 andRemove:0 atURL:self->_homeURL];

  return v6;
}

- (void)startTaskGroup
{
  id v5 = [(CardDAVUpdateMeCardTaskGroup *)self _newPropPatchTask];
  [v5 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  [v5 setAccountInfoProvider:WeakRetained];

  [v5 setTimeoutInterval:self->super._timeoutInterval];
  [(NSMutableSet *)self->super._outstandingTasks addObject:v5];
  id v4 = objc_loadWeakRetained((id *)&self->super._taskManager);
  [v4 submitQueuedCoreDAVTask:v5];
}

- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v7 = a5;
  if ([(NSMutableSet *)self->super._outstandingTasks containsObject:v8])
  {
    [(NSMutableSet *)self->super._outstandingTasks removeObject:v8];
    if (v7) {
      [(CoreDAVTaskGroup *)self bailWithError:v7];
    }
    else {
      [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:0];
    }
  }
}

- (NSURL)cardURL
{
  return self->_cardURL;
}

- (NSURL)homeURL
{
  return self->_homeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardURL, 0);
  objc_storeStrong((id *)&self->_homeURL, 0);
}

@end