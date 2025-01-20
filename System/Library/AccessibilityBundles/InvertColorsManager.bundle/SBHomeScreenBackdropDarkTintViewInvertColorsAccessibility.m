@interface SBHomeScreenBackdropDarkTintViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SBHomeScreenBackdropDarkTintViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHomeScreenBackdropDarkTintView";
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