@interface SFOpenURLOperationDelegate
@end

@implementation SFOpenURLOperationDelegate

void __53___SFOpenURLOperationDelegate__didFinishWithSuccess___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

@end