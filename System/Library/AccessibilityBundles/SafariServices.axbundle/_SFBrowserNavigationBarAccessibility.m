@interface _SFBrowserNavigationBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityOnlyComparesByXAxis;
@end

@implementation _SFBrowserNavigationBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFBrowserNavigationBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

@end