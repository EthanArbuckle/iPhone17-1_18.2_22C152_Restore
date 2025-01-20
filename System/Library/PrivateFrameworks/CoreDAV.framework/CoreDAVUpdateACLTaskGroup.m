@interface CoreDAVUpdateACLTaskGroup
- (CoreDAVPropFindTask)fetchTask;
- (CoreDAVUpdateACLTaskGroup)initWithAccountInfoProvider:(id)a3 aceItems:(id)a4 url:(id)a5 taskManager:(id)a6;
- (NSSet)aceItems;
- (NSURL)url;
- (int)state;
- (void)_finishWithError:(id)a3 state:(int)a4;
- (void)_startGetACL;
- (void)_startSetACLWithAccessControlEntities:(id)a3;
- (void)setAceItems:(id)a3;
- (void)setFetchTask:(id)a3;
- (void)setState:(int)a3;
- (void)setUrl:(id)a3;
- (void)task:(id)a3 didFinishWithError:(id)a4;
- (void)taskGroupWillCancelWithError:(id)a3;
@end

@implementation CoreDAVUpdateACLTaskGroup

- (CoreDAVUpdateACLTaskGroup)initWithAccountInfoProvider:(id)a3 aceItems:(id)a4 url:(id)a5 taskManager:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CoreDAVUpdateACLTaskGroup;
  v13 = [(CoreDAVTaskGroup *)&v16 initWithAccountInfoProvider:a3 taskManager:a6];
  v14 = v13;
  if (v13)
  {
    v13->_state = 0;
    objc_storeStrong((id *)&v13->_aceItems, a4);
    objc_storeStrong((id *)&v14->_url, a5);
  }

  return v14;
}

- (void)_startGetACL
{
  v14 = [[CoreDAVItemParserMapping alloc] initWithNameSpace:@"DAV:" name:@"acl" parseClass:objc_opt_class()];
  v3 = [MEMORY[0x263EFFA08] setWithObject:v14];
  v4 = [CoreDAVPropFindTask alloc];
  v5 = [(CoreDAVUpdateACLTaskGroup *)self url];
  v6 = [(CoreDAVPropFindTask *)v4 initWithPropertiesToFind:v3 atURL:v5 withDepth:2];

  [(CoreDAVUpdateACLTaskGroup *)self setFetchTask:v6];
  outstandingTasks = self->super._outstandingTasks;
  v8 = [(CoreDAVUpdateACLTaskGroup *)self fetchTask];
  [(NSMutableSet *)outstandingTasks addObject:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  v10 = [(CoreDAVUpdateACLTaskGroup *)self fetchTask];
  [v10 setAccountInfoProvider:WeakRetained];

  id v11 = [(CoreDAVUpdateACLTaskGroup *)self fetchTask];
  [v11 setDelegate:self];

  id v12 = objc_loadWeakRetained((id *)&self->super._taskManager);
  v13 = [(CoreDAVUpdateACLTaskGroup *)self fetchTask];
  [v12 submitQueuedCoreDAVTask:v13];

  [(CoreDAVUpdateACLTaskGroup *)self setState:1];
}

- (void)_startSetACLWithAccessControlEntities:(id)a3
{
  id v4 = a3;
  v5 = [CoreDAVACLTask alloc];
  v6 = [(CoreDAVUpdateACLTaskGroup *)self url];
  v9 = [(CoreDAVACLTask *)v5 initWithAccessControlEntities:v4 atURL:v6];

  [(NSMutableSet *)self->super._outstandingTasks addObject:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  [(CoreDAVTask *)v9 setAccountInfoProvider:WeakRetained];

  [(CoreDAVTask *)v9 setDelegate:self];
  id v8 = objc_loadWeakRetained((id *)&self->super._taskManager);
  [v8 submitQueuedCoreDAVTask:v9];

  [(CoreDAVUpdateACLTaskGroup *)self setState:2];
}

- (void)_finishWithError:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [(CoreDAVUpdateACLTaskGroup *)self setState:v4];
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v6 delegateCallbackBlock:0];
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CoreDAVUpdateACLTaskGroup *)self state];
  if (v8 == 2)
  {
    [(NSMutableSet *)self->super._outstandingTasks removeObject:v6];
    if (v7) {
      uint64_t v13 = 6;
    }
    else {
      uint64_t v13 = 4;
    }
    id v11 = self;
    id v12 = v7;
    goto LABEL_9;
  }
  if (v8 == 1)
  {
    outstandingTasks = self->super._outstandingTasks;
    v10 = [(CoreDAVUpdateACLTaskGroup *)self fetchTask];
    [(NSMutableSet *)outstandingTasks removeObject:v10];

    if (v7)
    {
      id v11 = self;
      id v12 = v7;
      uint64_t v13 = 5;
LABEL_9:
      [(CoreDAVUpdateACLTaskGroup *)v11 _finishWithError:v12 state:v13];
      goto LABEL_10;
    }
    v14 = [(CoreDAVUpdateACLTaskGroup *)self fetchTask];
    v15 = [v14 successfulValueForNameSpace:@"DAV:" elementName:@"acl"];

    if (v15)
    {
      objc_super v16 = [(CoreDAVUpdateACLTaskGroup *)self aceItems];
      v17 = [v15 notGrantedSubsetOfACEs:v16];

      if ([v17 count])
      {
        v18 = (void *)MEMORY[0x263EFF980];
        v19 = [v17 allObjects];
        v20 = [v18 arrayWithArray:v19];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        v21 = objc_msgSend(v15, "liveACEs", 0);
        uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v27 != v24) {
                objc_enumerationMutation(v21);
              }
              [v20 addObject:*(void *)(*((void *)&v26 + 1) + 8 * i)];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v23);
        }

        [(CoreDAVUpdateACLTaskGroup *)self _startSetACLWithAccessControlEntities:v20];
      }
      else
      {
        [(CoreDAVUpdateACLTaskGroup *)self _finishWithError:0 state:3];
      }
    }
    else
    {
      [(CoreDAVUpdateACLTaskGroup *)self _finishWithError:0 state:5];
    }
  }
LABEL_10:
}

- (void)taskGroupWillCancelWithError:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSSet)aceItems
{
  return self->_aceItems;
}

- (void)setAceItems:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
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
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_aceItems, 0);
}

@end