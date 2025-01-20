@interface CalDAVGetDelegatesBaseTaskGroup
- (BOOL)serverSupportsExpandPropertyReport;
- (CalDAVGetDelegatesBaseTaskGroup)initWithAccountInfoProvider:(id)a3 principalURL:(id)a4 taskManager:(id)a5;
- (CalDAVGetPrincipalEmailDetailsTaskGroup)getPrincipalEmailDetailsTaskGroup;
- (NSMutableArray)readPrincipalURLs;
- (NSMutableArray)writePrincipalURLs;
- (NSMutableSet)readDetails;
- (NSMutableSet)writeDetails;
- (NSSet)readOnlyPrincipalDetails;
- (NSSet)readWritePrincipalDetails;
- (NSURL)principalURL;
- (id)_mappingsForPrincipalDetails;
- (id)_popFromArray:(id)a3;
- (void)_getPrincipalDetailsForURL:(id)a3;
- (void)_processDetailsFromMultiStatus:(id)a3 allowWrite:(BOOL)a4;
- (void)bailWithError:(id)a3;
- (void)setGetPrincipalEmailDetailsTaskGroup:(id)a3;
- (void)setPrincipalURL:(id)a3;
- (void)setReadDetails:(id)a3;
- (void)setReadPrincipalURLs:(id)a3;
- (void)setServerSupportsExpandPropertyReport:(BOOL)a3;
- (void)setWriteDetails:(id)a3;
- (void)setWritePrincipalURLs:(id)a3;
- (void)task:(id)a3 didFinishWithError:(id)a4;
- (void)taskGroup:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CalDAVGetDelegatesBaseTaskGroup

- (CalDAVGetDelegatesBaseTaskGroup)initWithAccountInfoProvider:(id)a3 principalURL:(id)a4 taskManager:(id)a5
{
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CalDAVGetDelegatesBaseTaskGroup;
  v9 = [(CoreDAVTaskGroup *)&v16 initWithAccountInfoProvider:a3 taskManager:a5];
  v10 = v9;
  if (v9)
  {
    [(CalDAVGetDelegatesBaseTaskGroup *)v9 setPrincipalURL:v8];
    v11 = [MEMORY[0x263EFF9C0] set];
    [(CalDAVGetDelegatesBaseTaskGroup *)v10 setReadDetails:v11];

    v12 = [MEMORY[0x263EFF9C0] set];
    [(CalDAVGetDelegatesBaseTaskGroup *)v10 setWriteDetails:v12];

    v13 = [MEMORY[0x263EFF980] array];
    [(CalDAVGetDelegatesBaseTaskGroup *)v10 setReadPrincipalURLs:v13];

    v14 = [MEMORY[0x263EFF980] array];
    [(CalDAVGetDelegatesBaseTaskGroup *)v10 setWritePrincipalURLs:v14];
  }
  return v10;
}

- (id)_mappingsForPrincipalDetails
{
  v2 = [MEMORY[0x263EFF9C0] set];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__CalDAVGetDelegatesBaseTaskGroup__mappingsForPrincipalDetails__block_invoke;
  v10[3] = &unk_2641EC298;
  id v3 = v2;
  id v11 = v3;
  v4 = (void (**)(void, void, void))MEMORY[0x216696070](v10);
  uint64_t v5 = objc_opt_class();
  v4[2](v4, 3, v5);
  uint64_t v6 = objc_opt_class();
  v4[2](v4, 6, v6);
  uint64_t v7 = objc_opt_class();
  v4[2](v4, 4, v7);
  id v8 = v3;

  return v8;
}

void __63__CalDAVGetDelegatesBaseTaskGroup__mappingsForPrincipalDetails__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v8 = +[CalDAVPrincipalSearchSupport namespaceForWellKnownType:a2];
  uint64_t v6 = +[CalDAVPrincipalSearchSupport nameForWellKnownType:a2];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F34B00]) initWithNameSpace:v8 name:v6 parseClass:a3];
  [*(id *)(a1 + 32) addObject:v7];
}

- (void)_processDetailsFromMultiStatus:(id)a3 allowWrite:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4) {
    [(CalDAVGetDelegatesBaseTaskGroup *)self writeDetails];
  }
  else {
  uint64_t v7 = [(CalDAVGetDelegatesBaseTaskGroup *)self readDetails];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = objc_msgSend(v6, "responses", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      v14 = v11;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        id v11 = +[CalDAVPrincipalEmailDetailsResult resultFromResponseItem:*(void *)(*((void *)&v17 + 1) + 8 * v13)];

        v15 = [v11 addresses];
        uint64_t v16 = [v15 count];

        if (v16) {
          [v7 addObject:v11];
        }
        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)_getPrincipalDetailsForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CalDAVGetPrincipalEmailDetailsTaskGroup alloc];
  id v6 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  uint64_t v7 = [(CoreDAVTaskGroup *)self taskManager];
  id v8 = [(CalDAVGetPrincipalEmailDetailsTaskGroup *)v5 initWithAccountInfoProvider:v6 principalURL:v4 taskManager:v7];

  [(CalDAVGetDelegatesBaseTaskGroup *)self setGetPrincipalEmailDetailsTaskGroup:v8];
  uint64_t v9 = [(CalDAVGetDelegatesBaseTaskGroup *)self getPrincipalEmailDetailsTaskGroup];
  [v9 setDelegate:self];

  id v10 = [(CalDAVGetDelegatesBaseTaskGroup *)self getPrincipalEmailDetailsTaskGroup];
  [v10 startTaskGroup];
}

- (id)_popFromArray:(id)a3
{
  id v3 = a3;
  id v4 = [v3 lastObject];
  [v3 removeLastObject];

  return v4;
}

- (void)bailWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CalDAVGetDelegatesBaseTaskGroup *)self getPrincipalEmailDetailsTaskGroup];

  if (v5)
  {
    id v6 = [(CalDAVGetDelegatesBaseTaskGroup *)self getPrincipalEmailDetailsTaskGroup];
    [v6 bailWithError:v4];

    [(CalDAVGetDelegatesBaseTaskGroup *)self setGetPrincipalEmailDetailsTaskGroup:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)CalDAVGetDelegatesBaseTaskGroup;
  [(CoreDAVTaskGroup *)&v7 bailWithError:v4];
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"CalDAVGetDelegatesBaseTaskGroup.m" lineNumber:113 description:@"Must implement task:didFinishWithError: in subclass"];
}

- (void)taskGroup:(id)a3 didFinishWithError:(id)a4
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"CalDAVGetDelegatesBaseTaskGroup.m" lineNumber:117 description:@"Must implement taskGroup:didFinishWithError: in subclass"];
}

- (NSSet)readOnlyPrincipalDetails
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(CalDAVGetDelegatesBaseTaskGroup *)self readDetails];
  id v4 = [v2 setWithSet:v3];

  return (NSSet *)v4;
}

- (NSSet)readWritePrincipalDetails
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(CalDAVGetDelegatesBaseTaskGroup *)self writeDetails];
  id v4 = [v2 setWithSet:v3];

  return (NSSet *)v4;
}

- (BOOL)serverSupportsExpandPropertyReport
{
  return self->_serverSupportsExpandPropertyReport;
}

- (void)setServerSupportsExpandPropertyReport:(BOOL)a3
{
  self->_serverSupportsExpandPropertyReport = a3;
}

- (CalDAVGetPrincipalEmailDetailsTaskGroup)getPrincipalEmailDetailsTaskGroup
{
  return self->_getPrincipalEmailDetailsTaskGroup;
}

- (void)setGetPrincipalEmailDetailsTaskGroup:(id)a3
{
}

- (NSURL)principalURL
{
  return self->_principalURL;
}

- (void)setPrincipalURL:(id)a3
{
}

- (NSMutableArray)readPrincipalURLs
{
  return self->_readPrincipalURLs;
}

- (void)setReadPrincipalURLs:(id)a3
{
}

- (NSMutableArray)writePrincipalURLs
{
  return self->_writePrincipalURLs;
}

- (void)setWritePrincipalURLs:(id)a3
{
}

- (NSMutableSet)writeDetails
{
  return self->_writeDetails;
}

- (void)setWriteDetails:(id)a3
{
}

- (NSMutableSet)readDetails
{
  return self->_readDetails;
}

- (void)setReadDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readDetails, 0);
  objc_storeStrong((id *)&self->_writeDetails, 0);
  objc_storeStrong((id *)&self->_writePrincipalURLs, 0);
  objc_storeStrong((id *)&self->_readPrincipalURLs, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
  objc_storeStrong((id *)&self->_getPrincipalEmailDetailsTaskGroup, 0);
}

@end