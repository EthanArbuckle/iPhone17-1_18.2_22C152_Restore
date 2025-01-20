@interface WFWaitForReadingListCompletionActionOperation
- (void)addCompletionHandlerIfRunning:(id)a3;
@end

@implementation WFWaitForReadingListCompletionActionOperation

- (void)addCompletionHandlerIfRunning:(id)a3
{
  id v3 = a3;
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__WFWaitForReadingListCompletionActionOperation_addCompletionHandlerIfRunning___block_invoke;
  block[3] = &unk_264E5EE40;
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __79__WFWaitForReadingListCompletionActionOperation_addCompletionHandlerIfRunning___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end