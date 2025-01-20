@interface APEnforcementManager
- (BOOL)adServicesEnabled:(id)a3;
- (BOOL)loggingEnabled;
- (BOOL)shouldShowTCCWithAds;
- (id)disabledReasons;
@end

@implementation APEnforcementManager

- (id)disabledReasons
{
  return (id)[MEMORY[0x263EFF8C0] array];
}

- (BOOL)adServicesEnabled:(id)a3
{
  return 0;
}

- (BOOL)loggingEnabled
{
  return 0;
}

- (BOOL)shouldShowTCCWithAds
{
  return 0;
}

@end