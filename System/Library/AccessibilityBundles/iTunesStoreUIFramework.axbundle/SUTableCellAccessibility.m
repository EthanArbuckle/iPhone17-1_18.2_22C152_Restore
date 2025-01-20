@interface SUTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
- (id)accessibilityLanguage;
- (id)accessibilityTableViewCellText;
- (id)accessibilityValue;
- (id)description;
- (unint64_t)accessibilityTraits;
@end

@implementation SUTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityTableViewCellText
{
  v2 = [(SUTableCellAccessibility *)self safeValueForKey:@"_configurationView"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityHint
{
  v2 = [(SUTableCellAccessibility *)self safeValueForKey:@"_configurationView"];
  v3 = [v2 accessibilityHint];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(SUTableCellAccessibility *)self safeValueForKey:@"_configurationView"];
  v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v11.receiver = self;
  v11.super_class = (Class)SUTableCellAccessibility;
  unint64_t v3 = [(SUTableCellAccessibility *)&v11 accessibilityTraits];
  v4 = [(SUTableCellAccessibility *)self safeValueForKey:@"_configurationView"];
  uint64_t v5 = [v4 accessibilityTraits];

  if (v5 == *MEMORY[0x263F1CF18]) {
    unint64_t v6 = *MEMORY[0x263F1CF18];
  }
  else {
    unint64_t v6 = v5 | v3;
  }
  v7 = [(SUTableCellAccessibility *)self safeValueForKey:@"showHighlight"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = *MEMORY[0x263F1CF38];
  if (!v8) {
    uint64_t v9 = 0;
  }
  return v9 | v6;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(SUTableCellAccessibility *)self safeValueForKey:@"_configurationView"];
  unint64_t v6 = [(SUTableCellAccessibility *)self accessibilityTableViewCellText];
  v7 = [v3 stringWithFormat:@"<%@ %p> : %@ -- :%@:", v4, self, v5, v6];

  return v7;
}

- (id)accessibilityLanguage
{
  return (id)[(id)*MEMORY[0x263F1D020] _accessibilityContentLanguage];
}

@end