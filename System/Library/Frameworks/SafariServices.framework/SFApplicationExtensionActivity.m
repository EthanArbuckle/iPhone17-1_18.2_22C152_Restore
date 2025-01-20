@interface SFApplicationExtensionActivity
@end

@implementation SFApplicationExtensionActivity

void __65___SFApplicationExtensionActivity_activityDidFinish_items_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanup];
  id v2 = [*(id *)(a1 + 32) customCompletionHandler];
  (*((void (**)(id, void, void, void))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

@end