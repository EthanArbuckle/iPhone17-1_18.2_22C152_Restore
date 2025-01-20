@interface AVOutputDevice(HomeKit)
+ (BOOL)shouldRestrictConnectionWithUserPrivilege:()HomeKit;
@end

@implementation AVOutputDevice(HomeKit)

+ (BOOL)shouldRestrictConnectionWithUserPrivilege:()HomeKit
{
  return (unint64_t)(a3 - 1) < 2;
}

@end