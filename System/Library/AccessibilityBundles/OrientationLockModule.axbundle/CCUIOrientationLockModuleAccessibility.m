@interface CCUIOrientationLockModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
@end

@implementation CCUIOrientationLockModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIOrientationLockModule";
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
  return accessibilityLocalizedString(@"orientation.lock.label");
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return @"orientation-lock";
}

@end