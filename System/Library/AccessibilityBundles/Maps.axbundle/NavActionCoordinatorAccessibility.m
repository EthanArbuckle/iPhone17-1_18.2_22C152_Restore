@interface NavActionCoordinatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)sender:(id)a3 switchToNavigationCameraMode:(unint64_t)a4;
@end

@implementation NavActionCoordinatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavActionCoordinator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)sender:(id)a3 switchToNavigationCameraMode:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NavActionCoordinatorAccessibility;
  [(NavActionCoordinatorAccessibility *)&v4 sender:a3 switchToNavigationCameraMode:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end