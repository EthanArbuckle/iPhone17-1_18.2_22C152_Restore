@interface UIButtonAccessibility__Social__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation UIButtonAccessibility__Social__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(UIButtonAccessibility__Social__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AccountSelector"];

  if (v4)
  {
    v5 = accessibilityLocalizedString(@"account.selector.label");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIButtonAccessibility__Social__UIKit;
    v5 = [(UIButtonAccessibility__Social__UIKit *)&v7 accessibilityLabel];
  }

  return v5;
}

- (id)accessibilityHint
{
  v3 = [(UIButtonAccessibility__Social__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AccountSelector"];

  if (v4)
  {
    v5 = accessibilityLocalizedString(@"account.selector.hint");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIButtonAccessibility__Social__UIKit;
    v5 = [(UIButtonAccessibility__Social__UIKit *)&v7 accessibilityHint];
  }

  return v5;
}

- (id)accessibilityValue
{
  v3 = [(UIButtonAccessibility__Social__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AccountSelector"];

  if (v4)
  {
    v10 = self;
    v5 = &selRef_accessibilityLabel;
    v6 = &v10;
  }
  else
  {
    v9 = self;
    v5 = &selRef_accessibilityValue;
    v6 = &v9;
  }
  v6[1] = (UIButtonAccessibility__Social__UIKit *)UIButtonAccessibility__Social__UIKit;
  objc_super v7 = objc_msgSendSuper2((objc_super *)v6, *v5, v9);

  return v7;
}

@end