@interface CSBatteryFillViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation CSBatteryFillViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSBatteryFillView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return _AXSInvertColorsEnabledGlobalCached() != 0;
}

@end