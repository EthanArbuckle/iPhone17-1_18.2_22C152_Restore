@interface TVRMContentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityControlCenterButtonLabel;
@end

@implementation TVRMContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRMContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(@"apple.tv.remote.button.label");
}

@end