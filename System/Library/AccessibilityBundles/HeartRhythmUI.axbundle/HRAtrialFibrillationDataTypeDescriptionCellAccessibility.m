@interface HRAtrialFibrillationDataTypeDescriptionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setupDescriptionTextView;
@end

@implementation HRAtrialFibrillationDataTypeDescriptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HRAtrialFibrillationDataTypeDescriptionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HRAtrialFibrillationDataTypeDescriptionCell" hasInstanceVariable:@"_descriptionTextView" withType:"UITextView"];
  [v3 validateClass:@"HRAtrialFibrillationDataTypeDescriptionCell" hasInstanceVariable:@"_settingsDescriptionTextView" withType:"UITextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HRAtrialFibrillationDataTypeDescriptionCell", @"_setupDescriptionTextView", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HRAtrialFibrillationDataTypeDescriptionCellAccessibility;
  [(HRAtrialFibrillationDataTypeDescriptionCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HRAtrialFibrillationDataTypeDescriptionCellAccessibility *)self safeValueForKey:@"_descriptionTextView"];
  [v3 _accessibilitySetTextViewShouldBreakUpParagraphs:1];

  v4 = [(HRAtrialFibrillationDataTypeDescriptionCellAccessibility *)self safeValueForKey:@"_settingsDescriptionTextView"];
  [v4 _accessibilitySetTextViewShouldBreakUpParagraphs:1];
}

- (void)_setupDescriptionTextView
{
  v3.receiver = self;
  v3.super_class = (Class)HRAtrialFibrillationDataTypeDescriptionCellAccessibility;
  [(HRAtrialFibrillationDataTypeDescriptionCellAccessibility *)&v3 _setupDescriptionTextView];
  [(HRAtrialFibrillationDataTypeDescriptionCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end