@interface EMMessageRepositoryMailboxPredictionObserver
@end

@implementation EMMessageRepositoryMailboxPredictionObserver

uint64_t __90___EMMessageRepositoryMailboxPredictionObserver__performWithRemoteConnection_forRecovery___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addCancelable:a2];
}

@end