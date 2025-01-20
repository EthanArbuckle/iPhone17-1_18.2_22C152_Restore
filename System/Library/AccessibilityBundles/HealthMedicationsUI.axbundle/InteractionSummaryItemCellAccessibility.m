@interface InteractionSummaryItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation InteractionSummaryItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthMedicationsUI.InteractionSummaryItemCell";
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