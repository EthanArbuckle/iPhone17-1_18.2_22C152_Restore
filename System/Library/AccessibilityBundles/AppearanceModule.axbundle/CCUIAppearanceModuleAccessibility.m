@interface CCUIAppearanceModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityControlCenterButtonLabel;
@end

@implementation CCUIAppearanceModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIAppearanceModule";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(@"appearance.button.label");
}

@end