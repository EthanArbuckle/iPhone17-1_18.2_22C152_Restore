@interface CoreDAVValidatePrincipalsTaskGroup
- (BOOL)didReceiveAuthenticationError;
- (CoreDAVValidatePrincipalsTaskGroup)initWithAccountInfoProvider:(id)a3 urls:(id)a4 taskManager:(id)a5;
- (NSMutableSet)principalURLs;
- (NSMutableSet)urlsToExamine;
- (NSSet)resultPrincipalURLs;
- (NSURL)urlBeingExamined;
- (void)_fetchNextURL;
- (void)_finishWithError:(id)a3;
- (void)cancelTaskGroup;
- (void)setPrincipalURLs:(id)a3;
- (void)setUrlBeingExamined:(id)a3;
- (void)setUrlsToExamine:(id)a3;
- (void)task:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CoreDAVValidatePrincipalsTaskGroup

- (CoreDAVValidatePrincipalsTaskGroup)initWithAccountInfoProvider:(id)a3 urls:(id)a4 taskManager:(id)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CoreDAVValidatePrincipalsTaskGroup;
  v9 = [(CoreDAVTaskGroup *)&v15 initWithAccountInfoProvider:a3 taskManager:a5];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithSet:v8];
    urlsToExamine = v9->_urlsToExamine;
    v9->_urlsToExamine = (NSMutableSet *)v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    principalURLs = v9->_principalURLs;
    v9->_principalURLs = v12;
  }
  return v9;
}

- (NSSet)resultPrincipalURLs
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(CoreDAVValidatePrincipalsTaskGroup *)self principalURLs];
  v4 = [v2 setWithSet:v3];

  return (NSSet *)v4;
}

- (void)_finishWithError:(id)a3
{
}

- (void)_fetchNextURL
{
  v3 = [(CoreDAVValidatePrincipalsTaskGroup *)self urlsToExamine];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v16 = [[CoreDAVItemParserMapping alloc] initWithNameSpace:@"DAV:" name:@"principal-URL" parseClass:objc_opt_class()];
    v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:");
    v6 = [(CoreDAVValidatePrincipalsTaskGroup *)self urlsToExamine];
    v7 = [v6 anyObject];
    [(CoreDAVValidatePrincipalsTaskGroup *)self setUrlBeingExamined:v7];

    id v8 = [(CoreDAVValidatePrincipalsTaskGroup *)self urlBeingExamined];

    if (v8)
    {
      v9 = [(CoreDAVValidatePrincipalsTaskGroup *)self urlsToExamine];
      uint64_t v10 = [(CoreDAVValidatePrincipalsTaskGroup *)self urlBeingExamined];
      [v9 removeObject:v10];
    }
    v11 = [CoreDAVPropFindTask alloc];
    v12 = [(CoreDAVValidatePrincipalsTaskGroup *)self urlBeingExamined];
    v13 = [(CoreDAVPropFindTask *)v11 initWithPropertiesToFind:v5 atURL:v12 withDepth:2];

    v14 = [(CoreDAVTaskGroup *)self accountInfoProvider];
    [(CoreDAVTask *)v13 setAccountInfoProvider:v14];

    [(CoreDAVTask *)v13 setDelegate:self];
    objc_super v15 = [(CoreDAVTaskGroup *)self taskManager];
    [v15 submitQueuedCoreDAVTask:v13];

    [(NSMutableSet *)self->super._outstandingTasks addObject:v13];
  }
  else
  {
    [(CoreDAVValidatePrincipalsTaskGroup *)self _finishWithError:0];
  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(NSMutableSet *)self->super._outstandingTasks removeObject:v6];
  if (v7)
  {
    id v8 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    uint64_t v10 = [v8 logHandleForAccountInfoProvider:WeakRetained];

    if (v10)
    {
      v11 = v10;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(CoreDAVValidatePrincipalsTaskGroup *)self urlBeingExamined];
        int v21 = 138412546;
        v22 = v12;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_impl(&dword_213BFC000, v11, OS_LOG_TYPE_DEFAULT, "Error accessing: %@, error: %@", (uint8_t *)&v21, 0x16u);
      }
    }

    if ([v7 code] == 401) {
      self->_authError = 1;
    }
  }
  else
  {
    v13 = [v6 successfulValueForNameSpace:@"DAV:" elementName:@"principal-URL"];
    v14 = [v13 href];
    objc_super v15 = [v14 payloadAsFullURL];

    if (v15)
    {
      v16 = [(CoreDAVValidatePrincipalsTaskGroup *)self principalURLs];
      [v16 addObject:v15];
    }
    else
    {
      v16 = +[CoreDAVLogging sharedLogging];
      id v17 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      v18 = [v16 logHandleForAccountInfoProvider:v17];

      if (v18)
      {
        v19 = v18;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [(CoreDAVValidatePrincipalsTaskGroup *)self urlBeingExamined];
          int v21 = 138412290;
          v22 = v20;
          _os_log_impl(&dword_213BFC000, v19, OS_LOG_TYPE_DEFAULT, "Failed to find a principal-URL for: %@", (uint8_t *)&v21, 0xCu);
        }
      }
    }
  }
  [(CoreDAVValidatePrincipalsTaskGroup *)self _fetchNextURL];
}

- (void)cancelTaskGroup
{
  [(CoreDAVValidatePrincipalsTaskGroup *)self setUrlsToExamine:0];
  v3.receiver = self;
  v3.super_class = (Class)CoreDAVValidatePrincipalsTaskGroup;
  [(CoreDAVTaskGroup *)&v3 cancelTaskGroup];
}

- (NSMutableSet)urlsToExamine
{
  return self->_urlsToExamine;
}

- (void)setUrlsToExamine:(id)a3
{
}

- (NSMutableSet)principalURLs
{
  return self->_principalURLs;
}

- (void)setPrincipalURLs:(id)a3
{
}

- (NSURL)urlBeingExamined
{
  return self->_urlBeingExamined;
}

- (void)setUrlBeingExamined:(id)a3
{
}

- (BOOL)didReceiveAuthenticationError
{
  return self->_authError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBeingExamined, 0);
  objc_storeStrong((id *)&self->_principalURLs, 0);
  objc_storeStrong((id *)&self->_urlsToExamine, 0);
}

@end