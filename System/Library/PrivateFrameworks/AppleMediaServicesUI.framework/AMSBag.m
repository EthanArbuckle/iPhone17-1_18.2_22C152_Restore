@interface AMSBag
@end

@implementation AMSBag

void __49__AMSBag_AppleMediaServicesUI__amsui_internalBag__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x263F27D80]);
  v0 = [MEMORY[0x263F27D40] bagKeySet];
  [v2 unionBagKeySet:v0];

  v1 = [MEMORY[0x263F27ED8] bagKeySet];
  [v2 unionBagKeySet:v1];

  [MEMORY[0x263F27B40] registerBagKeySet:v2 forProfile:@"appstored" profileVersion:@"1"];
}

@end