@interface SFRequestDesktopSiteQuirksManager
@end

@implementation SFRequestDesktopSiteQuirksManager

void __51___SFRequestDesktopSiteQuirksManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedManager_sharedQuirksManager;
  sharedManager_sharedQuirksManager = v0;
}

uint64_t __42___SFRequestDesktopSiteQuirksManager_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) data];
}

void __77___SFRequestDesktopSiteQuirksManager_quirksValueForDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [a2 requestDesktopSiteSettingForDomain:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __77___SFRequestDesktopSiteQuirksManager_getAllQuirkValuesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 allRequestDesktopSiteQuirks];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

@end