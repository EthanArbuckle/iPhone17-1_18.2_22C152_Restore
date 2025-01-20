@interface UIContextMenuCellContentViewAccessibility__Home__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation UIContextMenuCellContentViewAccessibility__Home__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"_UIContextMenuCellContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v11.receiver = self;
  v11.super_class = (Class)UIContextMenuCellContentViewAccessibility__Home__UIKit;
  v3 = [(UIContextMenuCellContentViewAccessibility__Home__UIKit *)&v11 accessibilityLabel];
  objc_opt_class();
  v4 = [(UIContextMenuCellContentViewAccessibility__Home__UIKit *)self safeValueForKey:@"iconImageView"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 image];
  v7 = [v6 accessibilityIdentifier];

  if ([v7 isEqualToString:@"gear.badge"])
  {
    v10 = accessibilityLocalizedString(@"open.home.invitations");
    uint64_t v8 = __UIAXStringForVariables();

    v3 = (void *)v8;
  }

  return v3;
}

@end