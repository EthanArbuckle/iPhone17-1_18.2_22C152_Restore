@interface CNPropertySimpleEditingCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)valueView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateValueWithPropertyItem:(id)a3;
@end

@implementation CNPropertySimpleEditingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPropertySimpleEditingCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNPropertySimpleEditingCell" hasInstanceVariable:@"_textField" withType:"UITextField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertySimpleEditingCell", @"valueView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertySimpleCell", @"labelView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertySimpleEditingCell", @"updateValueWithPropertyItem:", "v", "@", 0);
  [v3 validateClass:@"CNPropertySimpleEditingCell" isKindOfClass:@"CNPropertyEditingCell"];
}

- (id)valueView
{
  v5.receiver = self;
  v5.super_class = (Class)CNPropertySimpleEditingCellAccessibility;
  id v3 = [(CNPropertySimpleEditingCellAccessibility *)&v5 valueView];
  [(CNPropertySimpleEditingCellAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)updateValueWithPropertyItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNPropertySimpleEditingCellAccessibility;
  [(CNPropertySimpleEditingCellAccessibility *)&v4 updateValueWithPropertyItem:a3];
  [(CNPropertySimpleEditingCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)CNPropertySimpleEditingCellAccessibility;
  [(CNPropertySimpleEditingCellAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CNPropertySimpleEditingCellAccessibility *)self safeValueForKey:@"_textField"];
  objc_super v4 = [(CNPropertySimpleEditingCellAccessibility *)self safeValueForKey:@"labelView"];
  objc_super v5 = [v4 accessibilityLabel];
  [v3 setAccessibilityIdentifier:v5];
}

@end