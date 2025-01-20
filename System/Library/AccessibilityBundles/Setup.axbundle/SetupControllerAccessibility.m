@interface SetupControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityIdentifier;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkMainNavBar;
- (void)_createNavigationController;
- (void)_showModalWiFiSettings;
@end

@implementation SetupControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SetupController";
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
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SetupController", @"_createNavigationController", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SetupController", @"navigationController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SetupController", @"_showModalWiFiSettings", "v", 0);
}

- (id)accessibilityIdentifier
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  LOBYTE(v11) = 0;
  objc_opt_class();
  id v3 = [(SetupControllerAccessibility *)self safeValueForKey:@"navigationFlowController"];
  v4 = [v3 safeValueForKey:@"buddyControllers"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 lastObject];

  v7 = AXLogUIA();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [v6 accessibilityIdentifier];
    int v11 = 138412546;
    v12 = v6;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_2424F4000, v7, OS_LOG_TYPE_INFO, "NavBar: Buddy: identifier %@ %@", (uint8_t *)&v11, 0x16u);
  }
  v9 = [v6 accessibilityIdentifier];

  return v9;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)SetupControllerAccessibility;
  [(SetupControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityMarkMainNavBar
{
  objc_opt_class();
  id v3 = [(SetupControllerAccessibility *)self safeValueForKey:@"navigationController"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 navigationBar];
  [v5 accessibilitySetIdentification:@"AXSetupMainNavBar"];
}

- (void)_createNavigationController
{
  v3.receiver = self;
  v3.super_class = (Class)SetupControllerAccessibility;
  [(SetupControllerAccessibility *)&v3 _createNavigationController];
  [(SetupControllerAccessibility *)self _accessibilityMarkMainNavBar];
}

- (void)_showModalWiFiSettings
{
  v8.receiver = self;
  v8.super_class = (Class)SetupControllerAccessibility;
  [(SetupControllerAccessibility *)&v8 _showModalWiFiSettings];
  objc_opt_class();
  objc_super v3 = [(SetupControllerAccessibility *)self safeValueForKey:@"navigationController"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 visibleViewController];
  __UIAccessibilitySafeClass();

  v6 = [v5 navigationController];
  v7 = [v6 navigationBar];
  [v7 accessibilitySetIdentification:@"AXSetupMainNavBar"];
}

@end