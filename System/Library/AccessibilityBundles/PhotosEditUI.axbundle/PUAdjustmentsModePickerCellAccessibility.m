@interface PUAdjustmentsModePickerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateButton;
@end

@implementation PUAdjustmentsModePickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUAdjustmentsModePickerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUAdjustmentsModePickerCell" hasInstanceVariable:@"_accessoryButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentsModePickerCell", @"localizedModeName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentsModePickerCell", @"_updateButton", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)PUAdjustmentsModePickerCellAccessibility;
  [(PUAdjustmentsModePickerCellAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(PUAdjustmentsModePickerCellAccessibility *)self safeValueForKey:@"_accessoryButton"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [(PUAdjustmentsModePickerCellAccessibility *)self safeStringForKey:@"localizedModeName"];
  [v4 setAccessibilityValue:v5];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PUAdjustmentsModePickerCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PUAdjustmentsModePickerCellAccessibility *)&v3 accessibilityTraits];
}

- (void)_updateButton
{
  v3.receiver = self;
  v3.super_class = (Class)PUAdjustmentsModePickerCellAccessibility;
  [(PUAdjustmentsModePickerCellAccessibility *)&v3 _updateButton];
  [(PUAdjustmentsModePickerCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end