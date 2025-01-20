@interface CCUICarModeModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
@end

@implementation CCUICarModeModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUICarModeModule";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(@"car.mode.label");
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return @"car-mode";
}

@end