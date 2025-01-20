@interface UILabelAccessibility__PassKitUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation UILabelAccessibility__PassKitUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(UILabelAccessibility__PassKitUI__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AXPKAmountToFillLabel"];

  if (v4)
  {
    v5 = accessibilityLocalizedString(@"pass.amount");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UILabelAccessibility__PassKitUI__UIKit;
    v5 = [(UILabelAccessibility__PassKitUI__UIKit *)&v7 accessibilityLabel];
  }

  return v5;
}

- (id)accessibilityValue
{
  v3 = [(UILabelAccessibility__PassKitUI__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AXPKAmountToFillLabel"];

  if (v4
    && ([(UILabelAccessibility__PassKitUI__UIKit *)self _accessibilityValueForKey:@"AXPKAmountLabelCurrencySymbol"], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    objc_super v7 = NSString;
    v8 = self;
    v9 = [(UILabelAccessibility__PassKitUI__UIKit *)v8 text];
    v10 = [v7 stringWithFormat:@"%@%@", v6, v9];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UILabelAccessibility__PassKitUI__UIKit;
    v10 = [(UILabelAccessibility__PassKitUI__UIKit *)&v12 accessibilityValue];
  }

  return v10;
}

@end