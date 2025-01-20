@interface SBAppSwitcherReusableSnapshotViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SBAppSwitcherReusableSnapshotViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAppSwitcherReusableSnapshotView";
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