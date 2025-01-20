@interface WDMedicalRecordCategorySectionHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation WDMedicalRecordCategorySectionHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WDMedicalRecordCategorySectionHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)WDMedicalRecordCategorySectionHeaderCellAccessibility;
  return *MEMORY[0x263F1CEF8] | [(WDMedicalRecordCategorySectionHeaderCellAccessibility *)&v3 accessibilityTraits];
}

@end