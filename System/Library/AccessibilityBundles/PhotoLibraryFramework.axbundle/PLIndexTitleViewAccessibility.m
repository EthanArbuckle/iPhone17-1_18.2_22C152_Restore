@interface PLIndexTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PLIndexTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLIndexTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(PLIndexTitleViewAccessibility *)self safeValueForKey:@"_title"];
  v4 = [(PLIndexTitleViewAccessibility *)self safeValueForKey:@"_dateString"];
  v5 = [MEMORY[0x263F089D8] string];
  if ([v3 length]) {
    [v5 appendFormat:@"%@, ", v3];
  }
  if ([v4 length]) {
    [v5 appendFormat:@"%@", v4];
  }

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end