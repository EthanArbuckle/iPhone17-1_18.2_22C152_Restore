@interface ScheduleHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation ScheduleHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthMedicationsUI.ScheduleHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end