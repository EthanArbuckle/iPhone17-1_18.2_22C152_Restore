@interface CCUIMuteModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
@end

@implementation CCUIMuteModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIMuteModule";
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
  return accessibilityLocalizedString(@"mute.label");
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return @"mute";
}

@end