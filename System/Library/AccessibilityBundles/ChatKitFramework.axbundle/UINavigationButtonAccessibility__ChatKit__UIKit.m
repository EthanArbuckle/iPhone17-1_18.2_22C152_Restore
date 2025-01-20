@interface UINavigationButtonAccessibility__ChatKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation UINavigationButtonAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UINavigationButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(UINavigationButtonAccessibility__ChatKit__UIKit *)self accessibilityIdentification];
  if ([v3 isEqualToString:@"composeButton"])
  {
    uint64_t v4 = accessibilityLocalizedString(@"compose.button.text");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationButtonAccessibility__ChatKit__UIKit;
    uint64_t v4 = [(UINavigationButtonAccessibility__ChatKit__UIKit *)&v7 accessibilityLabel];
  }
  v5 = (void *)v4;

  return v5;
}

@end