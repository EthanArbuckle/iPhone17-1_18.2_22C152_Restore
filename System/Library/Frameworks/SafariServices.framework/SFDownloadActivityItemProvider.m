@interface SFDownloadActivityItemProvider
@end

@implementation SFDownloadActivityItemProvider

void __82___SFDownloadActivityItemProvider_activityViewControllerApplicationExtensionItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 312);
  v4 = a2;
  [v3 saveToFileIfNeeded];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 312) savedURLWithProperExtension];
  v4[2](v4, v5, 0);
}

@end