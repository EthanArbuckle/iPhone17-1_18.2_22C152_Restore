@interface DNDUIControlCenterModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityControlCenterButtonIsToggle;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
@end

@implementation DNDUIControlCenterModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DNDUIControlCenterModule";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(@"do.not.disturb.label");
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return @"do-not-disturb";
}

- (BOOL)_accessibilityControlCenterButtonIsToggle
{
  return 1;
}

@end