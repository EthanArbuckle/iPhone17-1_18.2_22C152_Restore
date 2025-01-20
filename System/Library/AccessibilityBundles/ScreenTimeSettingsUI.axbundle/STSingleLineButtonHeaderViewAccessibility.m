@interface STSingleLineButtonHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation STSingleLineButtonHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STSingleLineButtonHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STSingleLineButtonHeaderView" isKindOfClass:@"STSingleLineHeaderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STSingleLineHeaderView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STSingleLineButtonHeaderView", @"button", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  id v3 = [(STSingleLineButtonHeaderViewAccessibility *)self safeValueForKey:@"titleLabel"];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v4];
  v5 = (void *)MEMORY[0x263EFF8C0];
  v6 = [(STSingleLineButtonHeaderViewAccessibility *)self safeValueForKey:@"button"];
  v7 = objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 2, v3, v6);

  return v7;
}

@end