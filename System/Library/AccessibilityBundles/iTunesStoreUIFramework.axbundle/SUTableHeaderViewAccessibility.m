@interface SUTableHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SUTableHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUTableHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(SUTableHeaderViewAccessibility *)self safeValueForKey:@"title"];
  v4 = [(SUTableHeaderViewAccessibility *)self safeValueForKey:@"subtitle"];
  v5 = [MEMORY[0x263F089D8] string];
  if ([v3 length]) {
    [v5 appendFormat:@"%@, ", v3];
  }
  if ([v4 length]) {
    [v5 appendFormat:@"%@, ", v4];
  }

  return v5;
}

@end