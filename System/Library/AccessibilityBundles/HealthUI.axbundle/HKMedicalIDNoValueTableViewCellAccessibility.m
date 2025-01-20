@interface HKMedicalIDNoValueTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HKMedicalIDNoValueTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKMedicalIDNoValueTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return (id)[(HKMedicalIDNoValueTableViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"addValueLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDNoValueTableViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HKMedicalIDNoValueTableViewCellAccessibility *)&v3 accessibilityTraits];
}

@end