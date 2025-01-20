@interface UISearchControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_searchBarSearchButtonClicked:(id)a3;
- (void)_updateVisibilityOfSearchResultsForSearchBar:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation UISearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISearchController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = @"UISearchController";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v7 = "@";
  [location[0] validateClass:@"UISearchController" hasInstanceMethod:@"searchBar" withFullSignature:0];
  v3 = @"UISearchBar";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"searchTextField", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UISearchTextField", @"tokens", v7, 0);
  v4 = "B";
  [location[0] validateClass:v5 hasInstanceMethod:@"showsSearchResultsController" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_showResultsForEmptySearch", v4, 0);
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_searchBarSearchButtonClicked:", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_updateVisibilityOfSearchResultsForSearchBar:", v6, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"_contentOrObservableScrollViewForEdge:", v7, "Q", 0);
  objc_storeStrong(v9, v8);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v17 = self;
  SEL v16 = a2;
  v15.receiver = self;
  v15.super_class = (Class)UISearchControllerAccessibility;
  [(UISearchControllerAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
  id v14 = (id)[(UISearchControllerAccessibility *)v17 safeValueForKey:@"_resultsControllerViewContainer"];
  objc_initWeak(&location, v17);
  id v5 = v14;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  v10 = __77__UISearchControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v11 = &unk_2650ADF60;
  objc_copyWeak(&v12, &location);
  [v5 _setIsAccessibilityElementBlock:&v7];
  id v4 = v14;
  id v3 = accessibilityLocalizedString(@"double.tap.dismiss");
  objc_msgSend(v4, "setAccessibilityLabel:");

  [v14 accessibilitySetIdentification:@"AXUISearchControllerDimmingView"];
  id v6 = (id)[(UISearchControllerAccessibility *)v17 _contentOrObservableScrollViewForEdge:1];
  id v2 = accessibilityLocalizedString(@"search.results");
  objc_msgSend(v6, "setAccessibilityLabel:");

  objc_storeStrong(&v6, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  objc_storeStrong(&v14, 0);
}

BOOL __77__UISearchControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  v21[2] = a1;
  v21[1] = a1;
  v21[0] = objc_loadWeakRetained(a1 + 4);
  id v7 = (id)[v21[0] searchBar];
  id location = (id)[v7 searchTextField];

  id v8 = (id)[location text];
  char v18 = 0;
  char v16 = 0;
  char v14 = 0;
  char v12 = 0;
  char v10 = 0;
  char v9 = 0;
  if (![v8 length])
  {
    id v19 = (id)[location safeArrayForKey:@"tokens"];
    char v18 = 1;
    char v9 = 0;
    if (![v19 count])
    {
      char v9 = 0;
      if (([v21[0] safeBoolForKey:@"_showResultsForEmptySearch"] & 1) == 0)
      {
        id v17 = (id)[v21[0] searchResultsController];
        char v16 = 1;
        id v15 = (id)[v17 view];
        char v14 = 1;
        LOBYTE(v5) = 0;
        if (v15)
        {
          id v13 = (id)[v21[0] searchResultsController];
          char v12 = 1;
          id v11 = (id)[v13 view];
          char v10 = 1;
          int v5 = [v11 isHidden] ^ 1;
        }
        char v9 = v5;
      }
    }
  }
  if (v10) {

  }
  if (v12) {
  if (v14)
  }

  if (v16) {
  if (v18)
  }

  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  char v3 = [WeakRetained safeBoolForKey:@"showsSearchResultsController"];

  BOOL v4 = 0;
  if (v9) {
    BOOL v4 = !(v3 & 1);
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v21, 0);
  return v4;
}

- (void)_updateVisibilityOfSearchResultsForSearchBar:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UISearchControllerAccessibility;
  [(UISearchControllerAccessibility *)&v3 _updateVisibilityOfSearchResultsForSearchBar:location[0]];
  [(UISearchControllerAccessibility *)v5 _accessibilityLoadAccessibilityInformation];
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  BOOL v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISearchControllerAccessibility;
  [(UISearchControllerAccessibility *)&v2 viewDidLoad];
  [(UISearchControllerAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
}

- (void)setActive:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UISearchControllerAccessibility;
  [(UISearchControllerAccessibility *)&v3 setActive:a3];
  [(UISearchControllerAccessibility *)v6 _accessibilityLoadAccessibilityInformation];
}

- (void)_searchBarSearchButtonClicked:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UISearchControllerAccessibility;
  [(UISearchControllerAccessibility *)&v3 _searchBarSearchButtonClicked:location[0]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  objc_storeStrong(location, 0);
}

@end