@interface ASWebsiteNameFetchOperation
@end

@implementation ASWebsiteNameFetchOperation

uint64_t __37___ASWebsiteNameFetchOperation_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _run];
}

uint64_t __36___ASWebsiteNameFetchOperation__run__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  v6 = __36___ASWebsiteNameFetchOperation__run__block_invoke_2;
  v7 = &unk_264395388;
  uint64_t v8 = v1;
  return objc_msgSend(v2, "fetchOperation:finishedWithResult:completion:");
}

void __36___ASWebsiteNameFetchOperation__run__block_invoke_2(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) _finish];
  objc_sync_exit(obj);
}

@end