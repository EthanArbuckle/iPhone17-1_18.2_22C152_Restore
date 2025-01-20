@interface UISearchDisplayControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)searchResultsTableView;
- (void)_setTableViewVisible:(BOOL)a3 inView:(id)a4;
- (void)setActive:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation UISearchDisplayControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISearchDisplayController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UITableView";
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_setAccessibilitySearchTableViewHidden", v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_setTableViewVisible:(BOOL)a3 inView:(id)a4
{
  v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v8 = (id)[(UISearchDisplayControllerAccessibility *)v14 safeValueForKey:@"_dimmingView"];
  id v10 = _containerForDimmingView(v8);

  v9.receiver = v14;
  v9.super_class = (Class)UISearchDisplayControllerAccessibility;
  [(UISearchDisplayControllerAccessibility *)&v9 _setTableViewVisible:v12 inView:location];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v12) {
      id v4 = (id)[location safeValueForKey:@"_setAccessibilitySearchTableViewVisible"];
    }
    else {
      id v6 = (id)[location safeValueForKey:@"_setAccessibilitySearchTableViewHidden"];
    }
    id v5 = (id)[location safeValueForKey:@"_setAccessibilitySearchControllerDimmingViewHidden"];
  }
  id v7 = (id)[(UISearchDisplayControllerAccessibility *)v14 safeValueForKey:@"_dimmingView"];
  _toggleDimmingView(v7, v10);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
}

- (id)searchResultsTableView
{
  v5[2] = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UISearchDisplayControllerAccessibility;
  v5[0] = [(UISearchDisplayControllerAccessibility *)&v4 searchResultsTableView];
  [v5[0] accessibilitySetIdentification:@"SearchResultsTableView"];
  id v3 = v5[0];
  objc_storeStrong(v5, 0);

  return v3;
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  BOOL v11 = a4;
  id v4 = (id)-[UISearchDisplayControllerAccessibility safeValueForKey:](self, "safeValueForKey:");
  id v10 = _containerForDimmingView(v4);

  v9.receiver = v14;
  v9.super_class = (Class)UISearchDisplayControllerAccessibility;
  [(UISearchDisplayControllerAccessibility *)&v9 setActive:v12 animated:v11];
  id v5 = (id)[(UISearchDisplayControllerAccessibility *)v14 safeValueForKey:@"_dimmingView"];
  [v5 accessibilitySetIdentification:@"UISearchControlDimmingView"];

  id v7 = (id)[(UISearchDisplayControllerAccessibility *)v14 safeValueForKey:@"_dimmingView"];
  id v6 = accessibilityLocalizedString(@"double.tap.dismiss");
  objc_msgSend(v7, "setAccessibilityLabel:");

  id v8 = (id)[(UISearchDisplayControllerAccessibility *)v14 safeValueForKey:@"_dimmingView"];
  _toggleDimmingView(v8, v10);

  objc_storeStrong(&v10, 0);
}

@end