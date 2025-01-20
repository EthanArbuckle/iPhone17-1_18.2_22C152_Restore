@interface _UIDocumentLaunchViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UIDocumentLaunchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIDocumentLaunchViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = @"_UIDocumentLaunchViewController";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v4 = @"UISheetPresentationController";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"_UIDocumentUnavailableBrowserPresentationController");
  v3 = @"UIPresentationController";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"UISheetPresentationController");
  v5 = "@";
  [location[0] validateClass:@"UIPresentationController" hasInstanceMethod:@"containerView" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"selectedDetentIdentifier", v5, 0);
  [location[0] validateClass:@"_UIRemoteView"];
  [location[0] validateClass:v6 hasInstanceVariable:@"_pageContainerView" withType:"_UITouchPassthroughView"];
  objc_storeStrong(v8, v7);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v22 = self;
  SEL v21 = a2;
  v20.receiver = self;
  v20.super_class = (Class)_UIDocumentLaunchViewControllerAccessibility;
  [(_UIDocumentLaunchViewControllerAccessibility *)&v20 _accessibilityLoadAccessibilityInformation];
  id v19 = (id)[(_UIDocumentLaunchViewControllerAccessibility *)v22 safeValueForKey:@"_pageContainerView"];
  [v19 _accessibilitySetSortPriority:1000];
  id v4 = (id)[(_UIDocumentLaunchViewControllerAccessibility *)v22 safeValueForKey:@"_browserPresentationController"];
  id v3 = (id)[v4 safeUIViewForKey:@"containerView"];
  id v18 = (id)[v3 _accessibilityFindSubviewDescendant:&__block_literal_global_0];

  char v16 = 0;
  objc_opt_class();
  id v6 = (id)[v18 accessibilityElements];
  id v5 = (id)[v6 firstObject];
  id v15 = (id)__UIAccessibilityCastAsClass();

  id v14 = v15;
  objc_storeStrong(&v15, 0);
  id v17 = v14;
  objc_initWeak(&v13, v22);
  id v2 = v17;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  v10 = __90___UIDocumentLaunchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v11 = &unk_2650ADF60;
  objc_copyWeak(&v12, &v13);
  [v2 _setAccessibilityRemoteElementShouldHitTestHostProcessBlock:&v7];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v13);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
}

@end