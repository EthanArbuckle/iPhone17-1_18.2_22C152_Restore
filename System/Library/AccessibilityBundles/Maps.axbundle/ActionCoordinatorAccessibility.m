@interface ActionCoordinatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)presentRoutePlanningViewType:(int64_t)a3;
@end

@implementation ActionCoordinatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ActionCoordinator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)presentRoutePlanningViewType:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ActionCoordinatorAccessibility;
  [(ActionCoordinatorAccessibility *)&v3 presentRoutePlanningViewType:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end