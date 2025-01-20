@interface HUDashboardNavigationTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation HUDashboardNavigationTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUDashboardNavigationTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end