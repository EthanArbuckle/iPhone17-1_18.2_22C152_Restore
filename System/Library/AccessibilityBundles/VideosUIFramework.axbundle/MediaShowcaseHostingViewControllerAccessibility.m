@interface MediaShowcaseHostingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation MediaShowcaseHostingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.MediaShowcaseHostingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.MediaShowcasingTemplateController" hasSwiftField:@"titleView" withSwiftType:"Optional<UIView>"];
  [v3 validateClass:@"VideosUI.MediaShowcaseHostingViewController" hasSwiftField:@"paginatedMediaController" withSwiftType:"PaginatedMediaController"];
  [v3 validateClass:@"VideosUI.MediaShowcaseHostingViewController" hasSwiftField:@"toolBar" withSwiftType:"MediaShowcasingToolbar"];
  [v3 validateClass:@"VideosUI.PaginatedMediaController" hasSwiftField:@"pageControl" withSwiftType:"UIPageControl"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)MediaShowcaseHostingViewControllerAccessibility;
  [(MediaShowcaseHostingViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  char v7 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 view];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __93__MediaShowcaseHostingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_265166388;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityElementsBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __93__MediaShowcaseHostingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [v2 parentViewController];
  v5 = [v4 safeSwiftValueForKey:@"titleView"];
  [v3 axSafelyAddObject:v5];

  id v6 = [v2 view];
  char v7 = [v6 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_18];

  [v3 axSafelyAddObjectsFromArray:v7];
  v8 = [v2 view];
  objc_super v9 = [v8 _accessibilityFindSubviewDescendant:&__block_literal_global_302];

  [v3 axSafelyAddObject:v9];
  v10 = [v2 view];
  v11 = [v10 _accessibilityFindSubviewDescendant:&__block_literal_global_307];

  [v3 axSafelyAddObject:v11];

  return v3;
}

uint64_t __93__MediaShowcaseHostingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"VUIButton");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __93__MediaShowcaseHostingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  BOOL v2 = [v1 rangeOfString:@"PaginatedMediaMetadataContainerView"] != 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

uint64_t __93__MediaShowcaseHostingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MediaShowcaseHostingViewControllerAccessibility;
  [(MediaShowcaseHostingViewControllerAccessibility *)&v3 viewDidLoad];
  [(MediaShowcaseHostingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end