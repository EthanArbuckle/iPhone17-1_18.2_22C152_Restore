@interface SBFWakeAnimationSettingsInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (double)sleepColorBrightness;
@end

@implementation SBFWakeAnimationSettingsInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFWakeAnimationSettings";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)sleepColorBrightness
{
  if (_AXSInvertColorsEnabledGlobalCached())
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFWakeAnimationSettingsInvertColorsAccessibility;
    [(SBFWakeAnimationSettingsInvertColorsAccessibility *)&v6 sleepColorBrightness];
    return -v3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBFWakeAnimationSettingsInvertColorsAccessibility;
    [(SBFWakeAnimationSettingsInvertColorsAccessibility *)&v5 sleepColorBrightness];
  }
  return result;
}

@end