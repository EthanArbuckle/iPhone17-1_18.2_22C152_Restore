@interface SearchViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateSubviews;
- (void)dealloc;
- (void)setCurrentDataSource:(id)a3;
- (void)viewDidLoad;
@end

@implementation SearchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SearchViewController" hasInstanceVariable:@"_contentTableView" withType:"UITableView"];
  [v3 validateClass:@"SearchViewController" hasInstanceVariable:@"_collectionView" withType:"UICollectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchViewController", @"setCurrentDataSource:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchViewController", @"showDropDown:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchViewController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"SearchViewController" hasInstanceVariable:@"_userProfileButton" withType:"UIButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SearchViewControllerAccessibility;
  [(SearchViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SearchViewControllerAccessibility *)self safeUIViewForKey:@"_userProfileButton"];
  v4 = AXMapsLocString(@"PROFILE");
  [v3 setAccessibilityLabel:v4];
}

- (void)_axAnnotateSubviews
{
  id v6 = [(SearchViewControllerAccessibility *)self safeValueForKey:@"_contentTableView"];
  id v3 = AXMapsLocString(@"table.search.label");
  [v6 setAccessibilityLabel:v3];

  v4 = [(SearchViewControllerAccessibility *)self safeUIViewForKey:@"_collectionView"];
  objc_super v5 = AXMapsLocString(@"collection.search.label");
  [v4 setAccessibilityLabel:v5];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SearchViewControllerAccessibility;
  [(SearchViewControllerAccessibility *)&v3 viewDidLoad];
  [(SearchViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"AXCollapseMapsChromeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SearchViewControllerAccessibility;
  [(SearchViewControllerAccessibility *)&v4 dealloc];
}

- (void)setCurrentDataSource:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SearchViewControllerAccessibility;
  [(SearchViewControllerAccessibility *)&v4 setCurrentDataSource:a3];
  [(SearchViewControllerAccessibility *)self _axAnnotateSubviews];
}

@end