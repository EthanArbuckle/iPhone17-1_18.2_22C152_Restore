@interface HKMedicalIDEditorCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HKMedicalIDEditorCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKMedicalIDEditorCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorCell", @"label", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorCell", @"formattedValue", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(HKMedicalIDEditorCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"label, formattedValue"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HKMedicalIDEditorCellAccessibility *)&v3 accessibilityTraits];
}

@end