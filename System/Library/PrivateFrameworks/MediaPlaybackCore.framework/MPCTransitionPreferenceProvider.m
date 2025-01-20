@interface MPCTransitionPreferenceProvider
+ (int64_t)currentTransitionPreference;
@end

@implementation MPCTransitionPreferenceProvider

+ (int64_t)currentTransitionPreference
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobileipod"];
  int64_t v3 = [v2 integerForKey:@"TransitionStyle"];

  return v3;
}

@end