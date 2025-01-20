@interface SBStatusBarLegibilityGradientViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SBStatusBarLegibilityGradientViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBStatusBarLegibilityGradientView";
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