@interface UITableViewCellAccessibility__UIKit__HomeUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)hu_configureCheckmarkForImageView:(id)a3 checked:(BOOL)a4;
@end

@implementation UITableViewCellAccessibility__UIKit__HomeUI

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)hu_configureCheckmarkForImageView:(id)a3 checked:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCellAccessibility__UIKit__HomeUI;
  id v5 = a3;
  [(UITableViewCellAccessibility__UIKit__HomeUI *)&v6 hu_configureCheckmarkForImageView:v5 checked:v4];
  objc_msgSend(v5, "setAccessibilityElementsHidden:", v4 ^ 1, v6.receiver, v6.super_class);
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)UITableViewCellAccessibility__UIKit__HomeUI;
  unint64_t v3 = [(UITableViewCellAccessibility__UIKit__HomeUI *)&v7 accessibilityTraits];
  if ((*MEMORY[0x263F1CF38] & ~v3) == 0
    && [(UITableViewCellAccessibility__UIKit__HomeUI *)self accessoryType] == 3)
  {
    BOOL v4 = [(UITableViewCellAccessibility__UIKit__HomeUI *)self accessoryView];
    int v5 = [v4 accessibilityElementsHidden];

    if (v5) {
      return _AXTraitsRemoveTrait();
    }
  }
  return v3;
}

@end