@interface CalDAVGetPrincipalEmailDetailsTaskGroup
- (CalDAVGetPrincipalEmailDetailsTaskGroup)initWithAccountInfoProvider:(id)a3 principalURL:(id)a4 taskManager:(id)a5;
- (CalDAVPrincipalEmailDetailsResult)principalResult;
- (NSSet)addresses;
- (NSString)displayName;
- (NSURL)principalURL;
- (void)_finishWithError:(id)a3;
- (void)_processPropFind:(id)a3;
- (void)setPrincipalResult:(id)a3;
- (void)setPrincipalURL:(id)a3;
- (void)startTaskGroup;
- (void)task:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CalDAVGetPrincipalEmailDetailsTaskGroup

- (CalDAVGetPrincipalEmailDetailsTaskGroup)initWithAccountInfoProvider:(id)a3 principalURL:(id)a4 taskManager:(id)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CalDAVGetPrincipalEmailDetailsTaskGroup;
  v9 = [(CoreDAVTaskGroup *)&v12 initWithAccountInfoProvider:a3 taskManager:a5];
  v10 = v9;
  if (v9) {
    [(CalDAVGetPrincipalEmailDetailsTaskGroup *)v9 setPrincipalURL:v8];
  }

  return v10;
}

- (void)startTaskGroup
{
  v3 = [MEMORY[0x263EFF9C0] set];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__CalDAVGetPrincipalEmailDetailsTaskGroup_startTaskGroup__block_invoke;
  v15[3] = &unk_2641EC298;
  id v16 = v3;
  id v4 = v3;
  v5 = (void (**)(void, void, void))MEMORY[0x216696070](v15);
  uint64_t v6 = objc_opt_class();
  v5[2](v5, 3, v6);
  uint64_t v7 = objc_opt_class();
  v5[2](v5, 6, v7);
  uint64_t v8 = objc_opt_class();
  v5[2](v5, 4, v8);
  id v9 = objc_alloc(MEMORY[0x263F34B80]);
  v10 = [(CalDAVGetPrincipalEmailDetailsTaskGroup *)self principalURL];
  v11 = (void *)[v9 initWithPropertiesToFind:v4 atURL:v10 withDepth:2];

  objc_super v12 = [(CoreDAVTaskGroup *)self outstandingTasks];
  [v12 addObject:v11];

  v13 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v11 setAccountInfoProvider:v13];

  [v11 setDelegate:self];
  v14 = [(CoreDAVTaskGroup *)self taskManager];
  [v14 submitQueuedCoreDAVTask:v11];
}

void __57__CalDAVGetPrincipalEmailDetailsTaskGroup_startTaskGroup__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v8 = +[CalDAVPrincipalSearchSupport namespaceForWellKnownType:a2];
  uint64_t v6 = +[CalDAVPrincipalSearchSupport nameForWellKnownType:a2];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F34B00]) initWithNameSpace:v8 name:v6 parseClass:a3];
  [*(id *)(a1 + 32) addObject:v7];
}

- (void)_finishWithError:(id)a3
{
}

- (void)_processPropFind:(id)a3
{
  id v4 = [a3 multiStatus];
  v5 = [v4 responses];
  id v7 = [v5 anyObject];

  uint64_t v6 = +[CalDAVPrincipalEmailDetailsResult resultFromResponseItem:v7];
  [(CalDAVGetPrincipalEmailDetailsTaskGroup *)self setPrincipalResult:v6];
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v10 getTotalFailureError];
    if (!v8) {
      [(CalDAVGetPrincipalEmailDetailsTaskGroup *)self _processPropFind:v10];
    }
  }
  [(CalDAVGetPrincipalEmailDetailsTaskGroup *)self _finishWithError:v8];
  id v9 = [(CoreDAVTaskGroup *)self outstandingTasks];
  [v9 removeObject:v10];
}

- (NSSet)addresses
{
  v2 = [(CalDAVGetPrincipalEmailDetailsTaskGroup *)self principalResult];
  v3 = [v2 addresses];

  return (NSSet *)v3;
}

- (NSString)displayName
{
  v2 = [(CalDAVGetPrincipalEmailDetailsTaskGroup *)self principalResult];
  v3 = [v2 displayName];

  return (NSString *)v3;
}

- (NSURL)principalURL
{
  return self->_principalURL;
}

- (void)setPrincipalURL:(id)a3
{
}

- (CalDAVPrincipalEmailDetailsResult)principalResult
{
  return self->_principalResult;
}

- (void)setPrincipalResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_principalResult, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
}

@end