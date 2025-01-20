@interface CalCompatibility
+ (BOOL)isProgramSDKAtLeast:(id)a3;
+ (BOOL)simulateLegacyBehaviors;
+ (void)perform:(id)a3 whileSimulatingLegacyBehaviors:(BOOL)a4;
+ (void)performWhileSimulatingLegacyBehaviors:(id)a3;
+ (void)setSimulateLegacyBehaviors:(BOOL)a3;
@end

@implementation CalCompatibility

+ (BOOL)isProgramSDKAtLeast:(id)a3
{
  if ([a1 simulateLegacyBehaviors]) {
    return 0;
  }

  return ((uint64_t (*)(void))MEMORY[0x1F40CBEC8])(a3);
}

+ (void)performWhileSimulatingLegacyBehaviors:(id)a3
{
}

+ (void)perform:(id)a3 whileSimulatingLegacyBehaviors:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (void (**)(void))a3;
  uint64_t v6 = [a1 simulateLegacyBehaviors];
  [a1 setSimulateLegacyBehaviors:v4];
  v7[2]();
  [a1 setSimulateLegacyBehaviors:v6];
}

+ (BOOL)simulateLegacyBehaviors
{
  return _simulateLegacyBehaviors;
}

+ (void)setSimulateLegacyBehaviors:(BOOL)a3
{
  _simulateLegacyBehaviors = a3;
}

@end