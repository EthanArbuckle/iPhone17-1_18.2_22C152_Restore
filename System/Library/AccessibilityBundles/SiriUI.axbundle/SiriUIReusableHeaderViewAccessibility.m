@interface SiriUIReusableHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SiriUIReusableHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUIReusableHeaderView";
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
  return (id)[(SiriUIReusableHeaderViewAccessibility *)self safeValueForKey:@"titleText"];
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEF8];
  v3 = [(SiriUIReusableHeaderViewAccessibility *)self safeValueForKey:@"snippetViewController"];
  v4 = [v3 safeValueForKey:@"headerPunchOut"];

  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v2;
}

@end