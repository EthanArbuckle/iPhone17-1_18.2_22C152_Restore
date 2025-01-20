@interface HUCCCompactModuleContentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
@end

@implementation HUCCCompactModuleContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUCCCompactModuleContentViewController";
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
  return accessibilityLocalizedString(@"compact.home.module");
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return @"compact-home";
}

@end