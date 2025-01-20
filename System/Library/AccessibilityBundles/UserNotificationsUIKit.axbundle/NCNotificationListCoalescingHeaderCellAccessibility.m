@interface NCNotificationListCoalescingHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOnlyComparesByXAxis;
@end

@implementation NCNotificationListCoalescingHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationListCoalescingHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

@end