@interface MRUIBacklight
+ (BOOL)shouldUseTimelinesForTraitCollection:(id)a3;
+ (double)defaultAnimationDuration;
@end

@implementation MRUIBacklight

+ (BOOL)shouldUseTimelinesForTraitCollection:(id)a3
{
  return [a3 mr_shouldDim];
}

+ (double)defaultAnimationDuration
{
  +[_UIBacklightEnvironment _defaultAnimationDuration];
  return result;
}

@end