@interface UITableViewCountViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation UITableViewCountViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCountView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return [(UITableViewCountViewAccessibility *)self _accessibilityViewIsVisible] & 1;
}

@end