@interface NRDevice(Configuration)
+ (id)activeDevice;
- (BOOL)hasHomeButton;
- (BOOL)isCellularSeries3;
- (uint64_t)isRunningInternalBuild;
- (uint64_t)isTinker;
@end

@implementation NRDevice(Configuration)

- (uint64_t)isTinker
{
  v1 = [a1 valueForProperty:*MEMORY[0x263F575B0]];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (BOOL)hasHomeButton
{
  v1 = [a1 valueForProperty:*MEMORY[0x263F575A0]];
  uint64_t v2 = [v1 integerValue];

  return v2 != 2;
}

- (uint64_t)isRunningInternalBuild
{
  if (isRunningInternalBuild_onceToken != -1) {
    dispatch_once(&isRunningInternalBuild_onceToken, &__block_literal_global_1);
  }
  return isRunningInternalBuild_isInternalBuild;
}

- (BOOL)isCellularSeries3
{
  v1 = [a1 valueForProperty:*MEMORY[0x263F57628]];
  uint64_t v2 = [v1 stringValue];

  BOOL v3 = ![v2 caseInsensitiveCompare:@"watch3,1"]
    || ![v2 caseInsensitiveCompare:@"watch3,2"];

  return v3;
}

+ (id)activeDevice
{
  v0 = [MEMORY[0x263F57730] sharedInstance];
  v1 = [MEMORY[0x263F57730] activeDeviceSelectorBlock];
  uint64_t v2 = [v0 getAllDevicesWithArchivedAltAccountDevicesMatching:v1];
  BOOL v3 = [v2 firstObject];

  return v3;
}

@end