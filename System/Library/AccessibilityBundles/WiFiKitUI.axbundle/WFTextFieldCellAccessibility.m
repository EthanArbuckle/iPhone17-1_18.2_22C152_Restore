@interface WFTextFieldCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)awakeFromNib;
@end

@implementation WFTextFieldCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFTextFieldCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFTextFieldCell", @"label", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFTextFieldCell", @"textField", "@", 0);
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)WFTextFieldCellAccessibility;
  [(WFTextFieldCellAccessibility *)&v3 awakeFromNib];
  [(WFTextFieldCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)WFTextFieldCellAccessibility;
  [(WFTextFieldCellAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(WFTextFieldCellAccessibility *)self safeValueForKey:@"label"];
  [v3 setIsAccessibilityElement:0];

  objc_initWeak(&location, self);
  v4 = [(WFTextFieldCellAccessibility *)self safeValueForKey:@"textField"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__WFTextFieldCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_265168DC8;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityLabelBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __74__WFTextFieldCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained label];
  objc_super v3 = [v2 accessibilityLabel];

  return v3;
}

@end