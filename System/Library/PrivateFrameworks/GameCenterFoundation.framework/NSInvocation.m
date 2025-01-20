@interface NSInvocation
@end

@implementation NSInvocation

void __55__NSInvocation_GKProxyHelpers___gkClearCopiedArguments__block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = 0;
  [*(id *)(a1 + 32) getArgument:&v5 atIndex:a2];
  uint64_t v4 = 0;
  [*(id *)(a1 + 32) setArgument:&v4 atIndex:a2];
}

void __59__NSInvocation_GKProxyHelpers___gkCallbackWithError_queue___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C876C5D0]();
  [*(id *)(a1 + 32) _gkInvokeOnce];
}

@end