@interface SBFluidSwitcherItemContainerHeaderViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SBFluidSwitcherItemContainerHeaderViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFluidSwitcherItemContainerHeaderView";
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