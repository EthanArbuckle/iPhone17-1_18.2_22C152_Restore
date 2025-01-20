@interface _TVCarouselViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation _TVCarouselViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVCarouselViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TVCarouselViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPageControl", @"currentPage", "q", 0);
  [v3 validateClass:@"_TVCarouselViewController" hasInstanceVariable:@"_carouselView" withType:"_TVCarouselView"];
  [v3 validateClass:@"_TVCarouselViewController" hasInstanceVariable:@"_collectionElement" withType:"IKCollectionElement"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVCarouselView", @"pageControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVCarouselView", @"headerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IKCollectionElement", @"sections", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IKDataSourceElement", @"elementForItemAtIndex:", "@", "q", 0);
  [v3 validateClass:@"IKViewElement" hasInstanceVariable:@"_dataDictionary" withType:"NSDictionary"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v17.receiver = self;
  v17.super_class = (Class)_TVCarouselViewControllerAccessibility;
  [(_TVCarouselViewControllerAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  id v3 = [(_TVCarouselViewControllerAccessibility *)self safeUIViewForKey:@"_carouselView"];
  v4 = [v3 safeValueForKey:@"pageControl"];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CED8] | *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CF68]];
  objc_initWeak(&location, self);
  objc_initWeak(&v15, v4);
  objc_initWeak(&from, v3);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v12[3] = &unk_26515DAB8;
  objc_copyWeak(&v13, &from);
  [v3 _setAccessibilityLabelBlock:v12];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v9[3] = &unk_26515DB08;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &v15);
  [v3 _setAccessibilityValueBlock:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2_328;
  v7[3] = &unk_26515DB30;
  objc_copyWeak(&v8, &v15);
  [v3 _setAccessibilityIncrementBlock:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v5[3] = &unk_26515DB30;
  objc_copyWeak(&v6, &v15);
  [v3 _setAccessibilityDecrementBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)_TVCarouselViewControllerAccessibility;
  [(_TVCarouselViewControllerAccessibility *)&v3 viewDidLoad];
  [(_TVCarouselViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end