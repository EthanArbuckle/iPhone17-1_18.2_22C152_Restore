@interface EMMessageRepositoryMessageQueryHelperObserver
@end

@implementation EMMessageRepositoryMessageQueryHelperObserver

void __79___EMMessageRepositoryMessageQueryHelperObserver_queryHelperDidFindAllMessages__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained resultsObserver];
    v3 = [v4 observationIdentifier];
    [v2 observerDidFinishInitialLoad:v3];

    id WeakRetained = v4;
  }
}

@end