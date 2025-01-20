@interface SFAppInfoOverlayPreferenceManager
@end

@implementation SFAppInfoOverlayPreferenceManager

uint64_t __93___SFAppInfoOverlayPreferenceManager_getAppInfoOverlayPreferenceForDomain_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 integerValue];
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

@end