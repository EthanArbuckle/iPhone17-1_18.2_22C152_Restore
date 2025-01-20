@interface WBSAppLink
@end

@implementation WBSAppLink

void __95__WBSAppLink_SafariServicesExtras___sf_decideOpenStrategyAndCallCompletionHandlerOnMainThread___block_invoke(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __95__WBSAppLink_SafariServicesExtras___sf_decideOpenStrategyAndCallCompletionHandlerOnMainThread___block_invoke_2;
  v2[3] = &unk_1E5C77838;
  v2[4] = *(void *)(a1 + 32);
  v2[5] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __95__WBSAppLink_SafariServicesExtras___sf_decideOpenStrategyAndCallCompletionHandlerOnMainThread___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

@end