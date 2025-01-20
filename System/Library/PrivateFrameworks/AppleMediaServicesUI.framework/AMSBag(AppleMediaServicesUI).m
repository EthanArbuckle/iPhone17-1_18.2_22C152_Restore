@interface AMSBag(AppleMediaServicesUI)
+ (uint64_t)amsui_internalBag;
@end

@implementation AMSBag(AppleMediaServicesUI)

+ (uint64_t)amsui_internalBag
{
  if (amsui_internalBag_onceToken != -1) {
    dispatch_once(&amsui_internalBag_onceToken, &__block_literal_global);
  }
  v0 = (void *)MEMORY[0x263F27B28];
  return [v0 bagForProfile:@"appstored" profileVersion:@"1"];
}

@end