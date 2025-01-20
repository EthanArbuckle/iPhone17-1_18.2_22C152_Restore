@interface UILabelAccessibility__Music__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation UILabelAccessibility__Music__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(UILabelAccessibility__Music__UIKit *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"AXUIButtonLabelEmptyLabel"];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UILabelAccessibility__Music__UIKit;
  return [(UILabelAccessibility__Music__UIKit *)&v6 isAccessibilityElement];
}

@end