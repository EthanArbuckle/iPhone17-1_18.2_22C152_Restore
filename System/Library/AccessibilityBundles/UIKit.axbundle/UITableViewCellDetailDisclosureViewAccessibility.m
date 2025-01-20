@interface UITableViewCellDetailDisclosureViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentification;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UITableViewCellDetailDisclosureViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCellDetailDisclosureView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)[(UITableViewCellDetailDisclosureViewAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  id v5 = (id)[v6[0] safeValueForKey:@"_accessibilityTextElementText"];
  id v3 = accessibilityLocalizedString(@"more.info.button");
  id v4 = (id)__UIAXStringForVariables();

  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);

  return v4;
}

- (id)accessibilityIdentification
{
  return @"UITableCellViewDisclosure";
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellDetailDisclosureViewAccessibility;
  return [(UITableViewCellDetailDisclosureViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CEE8];
}

@end