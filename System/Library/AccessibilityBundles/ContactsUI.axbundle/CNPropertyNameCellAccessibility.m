@interface CNPropertyNameCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateTextFieldAccessibilityLabel;
- (void)setCardGroupItem:(id)a3;
- (void)textFieldChanged:(id)a3;
@end

@implementation CNPropertyNameCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPropertyNameCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNPropertyNameCell" isKindOfClass:@"CNContactCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactCell", @"cardGroupItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertyGroupItem", @"displayLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertyNameCell", @"textField", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertyNameCell", @"setCardGroupItem:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertyNameCell", @"textFieldChanged:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CNPropertyNameCellAccessibility;
  [(CNPropertyNameCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CNPropertyNameCellAccessibility *)self _updateTextFieldAccessibilityLabel];
}

- (void)_updateTextFieldAccessibilityLabel
{
  objc_super v3 = [(CNPropertyNameCellAccessibility *)self safeValueForKey:@"textField"];
  v4 = [v3 accessibilityValue];

  v5 = [(CNPropertyNameCellAccessibility *)self safeValueForKey:@"cardGroupItem"];
  v6 = __UIAccessibilitySafeClass();

  v7 = [v6 safeValueForKey:@"displayLabel"];
  uint64_t v8 = [v4 length];
  v9 = [(CNPropertyNameCellAccessibility *)self safeValueForKey:@"textField"];
  v10 = v9;
  if (v8) {
    v11 = v7;
  }
  else {
    v11 = 0;
  }
  [v9 setAccessibilityLabel:v11];

  v12 = [(CNPropertyNameCellAccessibility *)self safeValueForKey:@"textField"];
  [v12 setAccessibilityIdentifier:v7];
}

- (void)setCardGroupItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNPropertyNameCellAccessibility;
  [(CNPropertyNameCellAccessibility *)&v4 setCardGroupItem:a3];
  [(CNPropertyNameCellAccessibility *)self _updateTextFieldAccessibilityLabel];
}

- (void)textFieldChanged:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNPropertyNameCellAccessibility;
  [(CNPropertyNameCellAccessibility *)&v4 textFieldChanged:a3];
  [(CNPropertyNameCellAccessibility *)self _updateTextFieldAccessibilityLabel];
}

@end