@interface PMWControlCenterModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityControlCenterButtonLabel;
@end

@implementation PMWControlCenterModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PMWControlCenterModule";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(@"ping.my.watch.button.label");
}

@end