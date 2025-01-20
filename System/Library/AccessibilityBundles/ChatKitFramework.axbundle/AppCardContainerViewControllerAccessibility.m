@interface AppCardContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation AppCardContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ChatKit.AppCardContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ChatKit.AppCardContainerViewController", @"viewDidLayoutSubviews", "v", 0);
  [v3 validateClass:@"ChatKit.AppCardContainerViewController" hasSwiftField:@"remoteViewController" withSwiftType:"UIViewController & CKBrowserViewControllerProtocol"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"view", "@", 0);
  [v3 validateClass:@"_UIRemoteView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UISheetPresentationController", @"_currentPresentedViewFrame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UISheetPresentationController", @"selectedDetentIdentifier", "@", 0);
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)AppCardContainerViewControllerAccessibility;
  [(AppCardContainerViewControllerAccessibility *)&v15 viewDidLayoutSubviews];
  id v3 = [(AppCardContainerViewControllerAccessibility *)self safeSwiftValueForKey:@"remoteViewController"];
  v4 = [v3 safeValueForKey:@"view"];
  v5 = [v4 _accessibilityFindSubviewDescendant:&__block_literal_global_0];
  [v5 _accessibilitySetUsesScrollParentForOrdering:0];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__AppCardContainerViewControllerAccessibility_viewDidLayoutSubviews__block_invoke_2;
  v12[3] = &unk_265112E80;
  objc_copyWeak(&v13, &location);
  [v5 _setAccessibilityFrameForSortingBlock:v12];
  char v11 = 0;
  objc_opt_class();
  v6 = [v5 accessibilityElements];
  v7 = [v6 firstObject];
  v8 = __UIAccessibilityCastAsClass();

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__AppCardContainerViewControllerAccessibility_viewDidLayoutSubviews__block_invoke_3;
  v9[3] = &unk_265112E38;
  objc_copyWeak(&v10, &location);
  [v8 _setAccessibilityRemoteElementShouldHitTestHostProcessBlock:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

uint64_t __68__AppCardContainerViewControllerAccessibility_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Uiremoteview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

double __68__AppCardContainerViewControllerAccessibility_viewDidLayoutSubviews__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained safeValueForKey:@"sheetPresentationController"];
  [v2 safeCGRectForKey:@"_currentPresentedViewFrame"];
  double v4 = v3;

  return v4;
}

uint64_t __68__AppCardContainerViewControllerAccessibility_viewDidLayoutSubviews__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained safeValueForKey:@"sheetPresentationController"];
  double v3 = [v2 safeStringForKey:@"selectedDetentIdentifier"];

  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x263F1D5D8]] ^ 1;
  return v4;
}

@end