@interface ComposeButtonItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation ComposeButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ComposeButtonItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"compose.button.hint");
}

- (id)accessibilityLabel
{
  return (id)UIKitAccessibilityLocalizedString();
}

@end