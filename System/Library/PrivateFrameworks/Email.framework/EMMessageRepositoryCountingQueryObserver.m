@interface EMMessageRepositoryCountingQueryObserver
@end

@implementation EMMessageRepositoryCountingQueryObserver

uint64_t __91___EMMessageRepositoryCountingQueryObserver__performQueryWithRemoteConnection_forRecovery___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addCancelable:a2];
}

@end