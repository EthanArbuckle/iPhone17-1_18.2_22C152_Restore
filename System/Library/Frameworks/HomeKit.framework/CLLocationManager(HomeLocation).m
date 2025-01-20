@interface CLLocationManager(HomeLocation)
+ (BOOL)hm_isLocationAllowedForAuthorizationStatus:()HomeLocation;
+ (uint64_t)hm_hmdLocationAuthorizationFromCLAuthorizationStatus:()HomeLocation;
+ (unint64_t)hm_hmdRegionStateFromCLRegionState:()HomeLocation;
@end

@implementation CLLocationManager(HomeLocation)

+ (unint64_t)hm_hmdRegionStateFromCLRegionState:()HomeLocation
{
  if (a3 >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (uint64_t)hm_hmdLocationAuthorizationFromCLAuthorizationStatus:()HomeLocation
{
  if (objc_msgSend(MEMORY[0x1E4F1E600], "hm_isLocationAllowedForAuthorizationStatus:")) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (BOOL)hm_isLocationAllowedForAuthorizationStatus:()HomeLocation
{
  return (a3 - 3) < 2;
}

@end