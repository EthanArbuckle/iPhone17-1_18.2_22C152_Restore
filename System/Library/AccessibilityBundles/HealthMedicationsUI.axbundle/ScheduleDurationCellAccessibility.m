@interface ScheduleDurationCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation ScheduleDurationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthMedicationsUI.ScheduleDurationCell";
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