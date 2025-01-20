@interface PKPaymentSetupFieldCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsPickerType;
- (BOOL)_axIsTextFieldType;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
@end

@implementation PKPaymentSetupFieldCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentSetupFieldCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaymentSetupFieldCell" isKindOfClass:@"UITableViewCell"];
  [v3 validateClass:@"PKPaymentSetupFieldCell" hasInstanceVariable:@"_paymentSetupField" withType:"PKPaymentSetupField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentSetupFieldCell", @"editableTextField", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentSetupField", @"isFieldTypeDate", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentSetupField", @"isFieldTypeText", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentSetupField", @"isFieldTypePicker", "B", 0);
}

- (BOOL)_axIsPickerType
{
  id v3 = [(PKPaymentSetupFieldCellAccessibility *)self safeValueForKey:@"_paymentSetupField"];
  if ([v3 safeBoolForKey:@"isFieldTypeDate"])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(PKPaymentSetupFieldCellAccessibility *)self safeValueForKey:@"_paymentSetupField"];
    char v4 = [v5 safeBoolForKey:@"isFieldTypePicker"];
  }
  return v4;
}

- (BOOL)_axIsTextFieldType
{
  v2 = [(PKPaymentSetupFieldCellAccessibility *)self safeValueForKey:@"_paymentSetupField"];
  char v3 = [v2 safeBoolForKey:@"isFieldTypeText"];

  return v3;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupFieldCellAccessibility;
  [(PKPaymentSetupFieldCellAccessibility *)&v9 layoutSubviews];
  objc_initWeak(&location, self);
  if ([(PKPaymentSetupFieldCellAccessibility *)self _axIsPickerType])
  {
    char v3 = [(PKPaymentSetupFieldCellAccessibility *)self safeUIViewForKey:@"editableTextField"];
    [v3 setAccessibilityElementsHidden:1];

    char v4 = [(PKPaymentSetupFieldCellAccessibility *)self safeUIViewForKey:@"editableTextField"];
    [v4 _accessibilitySetTextViewIgnoresValueChanges:1];
  }
  else if ([(PKPaymentSetupFieldCellAccessibility *)self _axIsTextFieldType])
  {
    v5 = [(PKPaymentSetupFieldCellAccessibility *)self safeUIViewForKey:@"editableTextField"];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __54__PKPaymentSetupFieldCellAccessibility_layoutSubviews__block_invoke;
    v6[3] = &unk_265140E18;
    objc_copyWeak(&v7, &location);
    [v5 _setAccessibilityLabelBlock:v6];

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

id __54__PKPaymentSetupFieldCellAccessibility_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained safeUIViewForKey:@"textLabel"];
  char v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 accessibilityLabel];

  return v5;
}

- (BOOL)isAccessibilityElement
{
  if ([(PKPaymentSetupFieldCellAccessibility *)self _axIsPickerType]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupFieldCellAccessibility;
  return [(PKPaymentSetupFieldCellAccessibility *)&v4 isAccessibilityElement];
}

- (id)accessibilityValue
{
  char v3 = [(PKPaymentSetupFieldCellAccessibility *)self safeUIViewForKey:@"editableTextField"];
  objc_super v4 = [v3 accessibilityValue];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PKPaymentSetupFieldCellAccessibility;
    id v5 = [(PKPaymentSetupFieldCellAccessibility *)&v8 accessibilityValue];
  }
  v6 = v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  if ([(PKPaymentSetupFieldCellAccessibility *)self _axIsPickerType]) {
    return *MEMORY[0x263F1CEE8];
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupFieldCellAccessibility;
  return [(PKPaymentSetupFieldCellAccessibility *)&v4 accessibilityTraits];
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(PKPaymentSetupFieldCellAccessibility *)self _axIsPickerType])
  {
    char v3 = [(PKPaymentSetupFieldCellAccessibility *)self safeUIViewForKey:@"editableTextField"];
    [v3 accessibilityActivationPoint];
    double v5 = v4;
    double v7 = v6;

    double v8 = v5;
    double v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentSetupFieldCellAccessibility;
    [(PKPaymentSetupFieldCellAccessibility *)&v10 accessibilityActivationPoint];
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)accessibilityLabel
{
  char v11 = 0;
  objc_opt_class();
  char v3 = [(PKPaymentSetupFieldCellAccessibility *)self safeUIViewForKey:@"textLabel"];
  double v4 = __UIAccessibilityCastAsClass();

  double v5 = [v4 accessibilityLabel];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentSetupFieldCellAccessibility;
    id v7 = [(PKPaymentSetupFieldCellAccessibility *)&v10 accessibilityLabel];
  }
  double v8 = v7;

  return v8;
}

@end