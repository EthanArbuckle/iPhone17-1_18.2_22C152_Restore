@interface HandleDidReceiveMessage
@end

@implementation HandleDidReceiveMessage

void ___HandleDidReceiveMessage_f_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) debugDelegate];
  [v2 httpClient:*(void *)(a1 + 32) didReceiveHTTPMessageWithHeaders:*(void *)(a1 + 40) body:*(void *)(a1 + 48)];
}

@end