@interface GEOAttributionMigrationTask
@end

@implementation GEOAttributionMigrationTask

uint64_t __73___GEOAttributionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startWithCompletionHandler:*(void *)(a1 + 48) callbackQueue:*(void *)(a1 + 40)];
}

GEODataRequest *__74___GEOAttributionMigrationTask__startWithCompletionHandler_callbackQueue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[GEORequestCounter sharedCounter];
  v4 = +[GEOApplicationAuditToken currentProcessAuditToken];
  v5 = [v3 requestCounterTicketForType:4 auditToken:v4 traits:0];

  v6 = [[GEODataRequest alloc] initWithKind:4 URL:v2 auditToken:0 timeoutInterval:0 additionalHTTPHeaders:0 bodyData:0 userAgent:0.0 entityTag:0 cachedData:0 requestCounterTicket:v5 multipathServiceType:0 multipathAlternatePort:0 throttleToken:0 options:0];

  return v6;
}

id __74___GEOAttributionMigrationTask__startWithCompletionHandler_callbackQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[GEODataURLSession sharedDataURLSession];
  LODWORD(v5) = 1.0;
  v6 = [v4 downloadTaskWithRequest:v3 priority:*(void *)(a1 + 32) delegate:*(void *)(*(void *)(a1 + 32) + 80) delegateQueue:v5];

  return v6;
}

void __49___GEOAttributionMigrationTask__finishWithError___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "totalUnitCount"));
  id v2 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = 0;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "totalUnitCount"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v9++) cancel];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  v10 = (void *)MEMORY[0x18C120660](*(void *)(*(void *)(a1 + 32) + 120));
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 120);
  *(void *)(v11 + 120) = 0;

  v13 = *(NSObject **)(*(void *)(a1 + 32) + 112);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __49___GEOAttributionMigrationTask__finishWithError___block_invoke_2;
  v19 = &unk_1E53D7C50;
  id v21 = v10;
  id v20 = *(id *)(a1 + 40);
  id v14 = v10;
  dispatch_async(v13, &v16);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_removeRunningTask:", *(void *)(a1 + 32), v16, v17, v18, v19);
}

uint64_t __49___GEOAttributionMigrationTask__finishWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __38___GEOAttributionMigrationTask_cancel__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2];
  [v1 _finishWithError:v2];
}

@end