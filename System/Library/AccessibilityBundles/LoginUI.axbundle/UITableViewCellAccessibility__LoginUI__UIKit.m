@interface UITableViewCellAccessibility__LoginUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIgnoreInternalLabels;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didMoveToWindow;
@end

@implementation UITableViewCellAccessibility__LoginUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)didMoveToWindow
{
  v3 = [(UITableViewCellAccessibility__LoginUI__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AXLUITableViewCellTextFieldOnlyTag"];

  if (v4) {
    [(UITableViewCellAccessibility__LoginUI__UIKit *)self _accessibilityLoadAccessibilityInformation];
  }
  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellAccessibility__LoginUI__UIKit;
  [(UITableViewCellAccessibility__LoginUI__UIKit *)&v5 didMoveToWindow];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)UITableViewCellAccessibility__LoginUI__UIKit;
  [(UITableViewCellAccessibility__LoginUI__UIKit *)&v9 _accessibilityLoadAccessibilityInformation];
  v3 = [(UITableViewCellAccessibility__LoginUI__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AXLUITableViewCellTextFieldOnlyTag"];

  if (v4)
  {
    objc_opt_class();
    objc_super v5 = __UIAccessibilityCastAsClass();
    v6 = [v5 textLabel];
    v7 = [v6 accessibilityLabel];
    v8 = [v5 editableTextField];
    [v8 setAccessibilityLabel:v7];
  }
}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  v3 = [(UITableViewCellAccessibility__LoginUI__UIKit *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"AXLUITableViewCellTextFieldOnlyTag"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCellAccessibility__LoginUI__UIKit;
  return [(UITableViewCellAccessibility__LoginUI__UIKit *)&v6 _accessibilityIgnoreInternalLabels];
}

@end