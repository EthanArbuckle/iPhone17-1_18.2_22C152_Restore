@interface HandleEvent
@end

@implementation HandleEvent

void ___HandleEvent_f_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 httpClient:*(void *)(a1 + 32) didReceiveEvent:*(void *)(a1 + 40)];
}

@end