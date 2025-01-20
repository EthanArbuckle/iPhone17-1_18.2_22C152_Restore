@interface BNBannerHostMonitorSessionSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation BNBannerHostMonitorSessionSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.bannerkit.banner-host-monitor-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F623F8] utility];
}

+ (BSServiceInterface)interface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__BNBannerHostMonitorSessionSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_1 != -1) {
    dispatch_once(&interface_onceToken_1, block);
  }
  v2 = (void *)interface___interface_1;
  return (BSServiceInterface *)v2;
}

void __52__BNBannerHostMonitorSessionSpecification_interface__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F623D0];
  v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [v1 interfaceWithIdentifier:v2];

  v4 = (void *)interface___interface_1;
  interface___interface_1 = v3;
}

@end