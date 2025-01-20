@interface STSingleLineHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation STSingleLineHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STSingleLineHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(STSingleLineHeaderViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)STSingleLineHeaderViewAccessibility;
  return *MEMORY[0x263F1CEF8] | [(STSingleLineHeaderViewAccessibility *)&v3 accessibilityTraits];
}

@end