@interface CATArbitratorWaitToken
@end

@implementation CATArbitratorWaitToken

void __33___CATArbitratorWaitToken_resume__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) performCompletionBlock];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __49___CATArbitratorWaitToken_performCompletionBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  v6 = [v7 resourceProxy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];

  [v7 invalidate];
}

@end