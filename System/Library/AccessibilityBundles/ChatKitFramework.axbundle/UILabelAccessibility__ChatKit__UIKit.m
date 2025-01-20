@interface UILabelAccessibility__ChatKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsNotFirstElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation UILabelAccessibility__ChatKit__UIKit

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
  v3 = [(UILabelAccessibility__ChatKit__UIKit *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"CharacterCount"];

  if (v4)
  {
    v5 = accessibilityLocalizedString(@"character.count");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UILabelAccessibility__ChatKit__UIKit;
    v5 = [(UILabelAccessibility__ChatKit__UIKit *)&v7 accessibilityLabel];
  }

  return v5;
}

- (id)accessibilityValue
{
  v3 = [(UILabelAccessibility__ChatKit__UIKit *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"CharacterCount"];

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
  v6[1] = (UILabelAccessibility__ChatKit__UIKit *)UILabelAccessibility__ChatKit__UIKit;
  objc_super v7 = objc_msgSendSuper2((objc_super *)v6, *v5, v9);

  return v7;
}

- (BOOL)_accessibilityIsNotFirstElement
{
  v6.receiver = self;
  v6.super_class = (Class)UILabelAccessibility__ChatKit__UIKit;
  if ([(UILabelAccessibility__ChatKit__UIKit *)&v6 _accessibilityIsNotFirstElement]) {
    return 1;
  }
  int v4 = [(UILabelAccessibility__ChatKit__UIKit *)self _accessibilityFindViewAncestor:&__block_literal_global_9 startWithSelf:0];
  char v3 = [v4 _accessibilityIsNotFirstElement];

  return v3;
}

@end