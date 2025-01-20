@interface MapsThemeTableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (UIEdgeInsets)_accessibilityVisibleContentInset;
- (id)_axSearchResultsViewController;
@end

@implementation MapsThemeTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MapsThemeTableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CardView"];
  [v3 validateClass:@"SearchViewController"];
}

- (id)_axSearchResultsViewController
{
  v2 = [(MapsThemeTableViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245653010](@"CardView", a2)];
  id v3 = [v2 _accessibilityViewController];

  MEMORY[0x245653010](@"SearchViewController");
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  v16.receiver = self;
  v16.super_class = (Class)MapsThemeTableViewAccessibility;
  [(MapsThemeTableViewAccessibility *)&v16 _accessibilityVisibleContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MapsThemeTableViewAccessibility *)self _axSearchResultsViewController];

  double v12 = 0.0;
  if (!v11) {
    double v12 = v4;
  }
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

@end