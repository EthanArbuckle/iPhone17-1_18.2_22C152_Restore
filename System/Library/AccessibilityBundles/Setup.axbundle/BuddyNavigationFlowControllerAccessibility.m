@interface BuddyNavigationFlowControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityIdentifier;
- (id)wifiController;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkMainNavBar;
- (void)_presentViewControllerForBuddyController:(id)a3 animated:(BOOL)a4 willPresentViewController:(id)a5 completion:(id)a6;
@end

@implementation BuddyNavigationFlowControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddyNavigationFlowController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SetupController", @"navigationFlowController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyNavigationFlowController", @"buddyControllers", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyNavigationFlowController", @"wifiController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyNavigationFlowController", @"navigator", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyNavigationFlowController", @"_presentViewControllerForBuddyController:animated:willPresentViewController:completion:", "v", "@", "B", "@?", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyNavigationFlowNavigator", @"navigationController", "@", 0);
}

- (id)accessibilityIdentifier
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  LOBYTE(v10) = 0;
  objc_opt_class();
  id v3 = [(BuddyNavigationFlowControllerAccessibility *)self safeValueForKey:@"buddyControllers"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 lastObject];

  v6 = AXLogUIA();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v5 accessibilityIdentifier];
    int v10 = 138412546;
    v11 = v5;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_2424F4000, v6, OS_LOG_TYPE_INFO, "NavBar: Buddy: identifier %@ %@", (uint8_t *)&v10, 0x16u);
  }
  v8 = [v5 accessibilityIdentifier];

  return v8;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)BuddyNavigationFlowControllerAccessibility;
  [(BuddyNavigationFlowControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(BuddyNavigationFlowControllerAccessibility *)self _accessibilityMarkMainNavBar];
}

- (void)_presentViewControllerForBuddyController:(id)a3 animated:(BOOL)a4 willPresentViewController:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __133__BuddyNavigationFlowControllerAccessibility__presentViewControllerForBuddyController_animated_willPresentViewController_completion___block_invoke;
  v13[3] = &unk_26514E3F8;
  v13[4] = self;
  id v14 = v10;
  v12.receiver = self;
  v12.super_class = (Class)BuddyNavigationFlowControllerAccessibility;
  id v11 = v10;
  [(BuddyNavigationFlowControllerAccessibility *)&v12 _presentViewControllerForBuddyController:a3 animated:v7 willPresentViewController:a5 completion:v13];
}

void __133__BuddyNavigationFlowControllerAccessibility__presentViewControllerForBuddyController_animated_willPresentViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = AXLogUIA();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_2424F4000, v4, OS_LOG_TYPE_INFO, "NavBar: Buddy: present view controller %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) _accessibilityMarkMainNavBar];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)_accessibilityMarkMainNavBar
{
  objc_opt_class();
  id v3 = [(BuddyNavigationFlowControllerAccessibility *)self safeValueForKeyPath:@"navigator.navigationController"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 navigationBar];
  [v5 accessibilitySetIdentification:@"AXSetupMainNavBar"];
}

- (id)wifiController
{
  v5.receiver = self;
  v5.super_class = (Class)BuddyNavigationFlowControllerAccessibility;
  v2 = [(BuddyNavigationFlowControllerAccessibility *)&v5 wifiController];
  id v3 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PreferenceBundles/AirPortSettings.bundle"];
  [v3 load];
  [MEMORY[0x263F811C8] loadAccessibilityBundleForBundle:v3 didLoadCallback:0 force:1 loadAllAccessibilityInfo:0];

  return v2;
}

@end