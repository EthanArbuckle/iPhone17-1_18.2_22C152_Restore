@interface WFHealthKitResource
+ (BOOL)isSingleton;
+ (BOOL)mustBeAvailableForDisplay;
- (void)refreshAvailability;
@end

@implementation WFHealthKitResource

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

+ (BOOL)isSingleton
{
  return 1;
}

- (void)refreshAvailability
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F0A410] isHealthDataAvailable];
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = *MEMORY[0x263F87400];
    v10[0] = *MEMORY[0x263F08338];
    v7 = WFLocalizedString(@"This device does not have the Health app.");
    v11[0] = v7;
    v10[1] = *MEMORY[0x263F87408];
    v8 = WFLocalizedString(@"This shortcut requires the Health app, which this device does not have.");
    v11[1] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    v4 = [v5 errorWithDomain:v6 code:0 userInfo:v9];
  }
  [(WFResource *)self updateAvailability:v3 withError:v4];
}

@end