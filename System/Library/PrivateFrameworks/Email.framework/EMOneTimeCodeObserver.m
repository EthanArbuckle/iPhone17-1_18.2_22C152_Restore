@interface EMOneTimeCodeObserver
@end

@implementation EMOneTimeCodeObserver

void __67___EMOneTimeCodeObserver__performWithRemoteConnection_forRecovery___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[2] addCancelable:v5];
  }
}

@end