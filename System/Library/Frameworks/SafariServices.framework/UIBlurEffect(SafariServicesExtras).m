@interface UIBlurEffect(SafariServicesExtras)
+ (uint64_t)_sf_defaultPopoverBackgroundEffect;
+ (uint64_t)_sf_defaultStartPageBackgroundEffect;
@end

@implementation UIBlurEffect(SafariServicesExtras)

+ (uint64_t)_sf_defaultPopoverBackgroundEffect
{
  return [MEMORY[0x1E4FB14C8] effectWithStyle:8];
}

+ (uint64_t)_sf_defaultStartPageBackgroundEffect
{
  return [MEMORY[0x1E4FB14C8] effectWithStyle:7];
}

@end