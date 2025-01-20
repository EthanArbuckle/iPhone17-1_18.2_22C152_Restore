@interface SUTableCellContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (id)accessibilityValue;
- (id)description;
- (unint64_t)accessibilityTraits;
@end

@implementation SUTableCellContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUTableCellContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(SUTableCellContentViewAccessibility *)self safeValueForKey:@"_configuration"];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (id)accessibilityHint
{
  v2 = [(SUTableCellContentViewAccessibility *)self safeValueForKey:@"_configuration"];
  unint64_t v3 = [v2 accessibilityHint];

  return v3;
}

- (id)accessibilityLabel
{
  v2 = [(SUTableCellContentViewAccessibility *)self safeValueForKey:@"_configuration"];
  unint64_t v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(SUTableCellContentViewAccessibility *)self safeValueForKey:@"_configuration"];
  unint64_t v3 = [v2 accessibilityValue];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = [(SUTableCellContentViewAccessibility *)self safeValueForKey:@"_configuration"];
  v5 = [v3 stringWithFormat:@"<SUTableCellContentView %p> : %@", self, v4];

  return v5;
}

- (id)accessibilityLanguage
{
  return (id)[(id)*MEMORY[0x263F1D020] safeValueForKey:@"_accessibilityContentLanguage"];
}

@end