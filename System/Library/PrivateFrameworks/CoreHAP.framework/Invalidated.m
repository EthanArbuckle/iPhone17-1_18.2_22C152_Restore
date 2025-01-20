@interface Invalidated
@end

@implementation Invalidated

void ___Invalidated_f_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 httpClientDidCloseConnectionDueToServer:*(void *)(a1 + 32)];
}

@end