@interface CalDAVMkcalendarWithFallbackTaskGroup
- (BOOL)shouldSupportVEVENT;
- (BOOL)shouldSupportVTODO;
- (CalDAVMkcalendarWithFallbackTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 primaryPropertiesToSet:(id)a5 fallbackPropertiesToSet:(id)a6 atURL:(id)a7;
- (NSDictionary)headersToOverride;
- (NSDictionary)responseHeaders;
- (NSSet)fallbackElements;
- (void)_mkcalendarAfterFailureCount:(unint64_t)a3;
- (void)setFallbackElements:(id)a3;
- (void)setHeadersToOverride:(id)a3;
- (void)setResponseHeaders:(id)a3;
- (void)setShouldSupportVEVENT:(BOOL)a3;
- (void)setShouldSupportVTODO:(BOOL)a3;
- (void)startTaskGroup;
@end

@implementation CalDAVMkcalendarWithFallbackTaskGroup

- (CalDAVMkcalendarWithFallbackTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 primaryPropertiesToSet:(id)a5 fallbackPropertiesToSet:(id)a6 atURL:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CalDAVMkcalendarWithFallbackTaskGroup;
  v16 = [(CoreDAVTaskGroup *)&v19 initWithAccountInfoProvider:a3 taskManager:a4];
  v17 = v16;
  if (v16)
  {
    v16->_shouldSupportVEVENT = 1;
    v16->_shouldSupportVTODO = 0;
    objc_storeStrong((id *)&v16->_primaryElements, a5);
    objc_storeStrong((id *)&v17->_fallbackElements, a6);
    objc_storeStrong((id *)&v17->_url, a7);
  }

  return v17;
}

- (void)_mkcalendarAfterFailureCount:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a3) {
    v5 = &OBJC_IVAR___CalDAVMkcalendarWithFallbackTaskGroup__fallbackElements;
  }
  else {
    v5 = &OBJC_IVAR___CalDAVMkcalendarWithFallbackTaskGroup__primaryElements;
  }
  id v16 = *(id *)((char *)&self->super.super.isa + *v5);
  v6 = [[CalDAVMkcalendarTask alloc] initWithPropertiesToSet:v16 atURL:self->_url];
  v7 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [(CalDAVMkcalendarTask *)v6 setAccountInfoProvider:v7];

  [(CalDAVMkcalendarTask *)v6 setSupportForEvents:self->_shouldSupportVEVENT tasks:self->_shouldSupportVTODO];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v8 = [(CalDAVMkcalendarWithFallbackTaskGroup *)self headersToOverride];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [(CalDAVMkcalendarWithFallbackTaskGroup *)self headersToOverride];
        id v14 = [v13 valueForKey:v12];
        [(CalDAVMkcalendarTask *)v6 overrideRequestHeader:v12 withValue:v14];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __70__CalDAVMkcalendarWithFallbackTaskGroup__mkcalendarAfterFailureCount___block_invoke;
  v17[3] = &unk_2641EBA00;
  objc_copyWeak(&v18, &from);
  v19[1] = (id)a3;
  objc_copyWeak(v19, &location);
  [(CalDAVMkcalendarTask *)v6 setCompletionBlock:v17];
  id v15 = [(CoreDAVTaskGroup *)self taskManager];
  [v15 submitQueuedCoreDAVTask:v6];

  objc_destroyWeak(v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __70__CalDAVMkcalendarWithFallbackTaskGroup__mkcalendarAfterFailureCount___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained error];
  v5 = v4;
  if (!v4 || *(void *)(a1 + 48))
  {

LABEL_4:
    id v6 = objc_loadWeakRetained(v2);
    v7 = [v6 responseHeaders];
    v8 = (id *)(a1 + 40);
    id v9 = objc_loadWeakRetained(v8);
    [v9 setResponseHeaders:v7];

    id v15 = objc_loadWeakRetained(v8);
    id v10 = objc_loadWeakRetained(v2);
    v11 = [v10 error];
    [v15 finishCoreDAVTaskGroupWithError:v11 delegateCallbackBlock:0];

    goto LABEL_5;
  }
  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = [v12 fallbackElements];
  uint64_t v14 = [v13 count];

  if (!v14) {
    goto LABEL_4;
  }
  id v15 = objc_loadWeakRetained((id *)(a1 + 40));
  [v15 _mkcalendarAfterFailureCount:*(void *)(a1 + 48) + 1];
LABEL_5:
}

- (void)startTaskGroup
{
}

- (BOOL)shouldSupportVEVENT
{
  return self->_shouldSupportVEVENT;
}

- (void)setShouldSupportVEVENT:(BOOL)a3
{
  self->_shouldSupportVEVENT = a3;
}

- (BOOL)shouldSupportVTODO
{
  return self->_shouldSupportVTODO;
}

- (void)setShouldSupportVTODO:(BOOL)a3
{
  self->_shouldSupportVTODO = a3;
}

- (NSDictionary)headersToOverride
{
  return self->_headersToOverride;
}

- (void)setHeadersToOverride:(id)a3
{
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
}

- (NSSet)fallbackElements
{
  return self->_fallbackElements;
}

- (void)setFallbackElements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackElements, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_headersToOverride, 0);
  objc_storeStrong((id *)&self->_primaryElements, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end