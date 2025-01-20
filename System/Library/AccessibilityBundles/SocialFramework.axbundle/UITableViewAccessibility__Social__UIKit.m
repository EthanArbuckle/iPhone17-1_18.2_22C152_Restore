@interface UITableViewAccessibility__Social__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilitySupplementaryFooterViews;
@end

@implementation UITableViewAccessibility__Social__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySupplementaryFooterViews
{
  v3 = (void *)MEMORY[0x263EFF980];
  v12.receiver = self;
  v12.super_class = (Class)UITableViewAccessibility__Social__UIKit;
  v4 = [(UITableViewAccessibility__Social__UIKit *)&v12 _accessibilitySupplementaryFooterViews];
  v5 = [v3 arrayWithArray:v4];

  v6 = [(UITableViewAccessibility__Social__UIKit *)self accessibilityIdentifier];
  int v7 = [v6 isEqualToString:@"SLFacebookLoginInfoTableView"];

  if (v7)
  {
    v8 = [(UITableViewAccessibility__Social__UIKit *)self safeValueForKey:@"subviews"];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __81__UITableViewAccessibility__Social__UIKit__accessibilitySupplementaryFooterViews__block_invoke;
    v10[3] = &unk_2650AB070;
    id v11 = v5;
    [v8 enumerateObjectsUsingBlock:v10];
  }

  return v5;
}

@end