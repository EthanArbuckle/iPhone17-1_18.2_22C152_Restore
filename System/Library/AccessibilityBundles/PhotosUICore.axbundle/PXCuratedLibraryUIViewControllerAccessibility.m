@interface PXCuratedLibraryUIViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)ax_pxg_scrollView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation PXCuratedLibraryUIViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXCuratedLibraryUIViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryUIViewController", @"gridView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGView", @"scrollViewController", "@", 0);
  [v3 validateClass:@"PXUIScrollViewController"];
  [v3 validateClass:@"PXUIScrollViewController" hasInstanceVariable:@"_scrollView" withType:"_PXUIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryUIViewController", @"viewDidLoad", "v", 0);
}

- (id)ax_pxg_scrollView
{
  v2 = [(PXCuratedLibraryUIViewControllerAccessibility *)self safeValueForKey:@"gridView"];
  id v3 = [v2 safeValueForKey:@"scrollViewController"];

  MEMORY[0x2455E3C60](@"PXUIScrollViewController");
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 safeValueForKey:@"_scrollView"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibraryUIViewControllerAccessibility;
  [(PXCuratedLibraryUIViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PXCuratedLibraryUIViewControllerAccessibility *)self ax_pxg_scrollView];
  v4 = v3;
  if (v3) {
    [v3 accessibilitySetIdentification:@"AXCuratedLibraryScrollView"];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryUIViewControllerAccessibility;
  [(PXCuratedLibraryUIViewControllerAccessibility *)&v3 viewDidLoad];
  [(PXCuratedLibraryUIViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end