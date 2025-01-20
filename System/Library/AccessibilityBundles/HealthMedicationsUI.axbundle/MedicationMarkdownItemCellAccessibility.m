@interface MedicationMarkdownItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation MedicationMarkdownItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthMedicationsUI.MedicationMarkdownItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end