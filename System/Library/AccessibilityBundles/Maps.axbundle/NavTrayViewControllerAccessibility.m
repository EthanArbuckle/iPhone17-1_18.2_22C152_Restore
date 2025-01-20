@interface NavTrayViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityUpdateETADisclosure;
- (void)_updateShareETADisclosure;
- (void)pressedHeaderView;
@end

@implementation NavTrayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavTrayViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavTrayViewController", @"_updateShareETADisclosure", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavTrayViewController", @"pressedHeaderView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavTrayViewController", @"shareETADisclosureButton", "@", 0);
  [v3 validateClass:@"NavTrayViewController" hasInstanceVariable:@"_displayingInitialBanner" withType:"BOOL"];
  [v3 validateClass:@"NavTrayViewController" hasInstanceVariable:@"_receivingContacts" withType:"NSArray"];
  [v3 validateClass:@"NavTrayViewController" isKindOfClass:@"ContaineeViewController"];
  [v3 validateClass:@"ContaineeViewController" conformsToProtocol:@"ContaineePresentationProtocol"];
  [v3 validateProtocol:@"ContaineePresentationProtocol" hasMethod:@"cardPresentationController" isInstanceMethod:1 isRequired:1];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CardPresentationController", @"containeeLayout", "Q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)NavTrayViewControllerAccessibility;
  [(NavTrayViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(NavTrayViewControllerAccessibility *)self _accessibilityUpdateETADisclosure];
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [(NavTrayViewControllerAccessibility *)self safeValueForKey:@"cardPresentationController"];
  uint64_t v3 = [v2 safeUnsignedIntegerForKey:@"containeeLayout"];
  if (v3 == 2) {
    AXPerformSafeBlock();
  }

  return v3 == 2;
}

uint64_t __64__NavTrayViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pressedHeaderView];
}

- (void)pressedHeaderView
{
  v2.receiver = self;
  v2.super_class = (Class)NavTrayViewControllerAccessibility;
  [(NavTrayViewControllerAccessibility *)&v2 pressedHeaderView];
  UIAccessibilityPostNotification(*MEMORY[0x263F811F0], 0);
}

- (void)_updateShareETADisclosure
{
  v3.receiver = self;
  v3.super_class = (Class)NavTrayViewControllerAccessibility;
  [(NavTrayViewControllerAccessibility *)&v3 _updateShareETADisclosure];
  [(NavTrayViewControllerAccessibility *)self _accessibilityUpdateETADisclosure];
}

- (void)_accessibilityUpdateETADisclosure
{
  if ([(NavTrayViewControllerAccessibility *)self safeBoolForKey:@"_displayingInitialBanner"])
  {
    BOOL v3 = 1;
  }
  else
  {
    v4 = [(NavTrayViewControllerAccessibility *)self safeArrayForKey:@"_receivingContacts"];
    BOOL v3 = [v4 count] != 0;
  }
  id v5 = [(NavTrayViewControllerAccessibility *)self safeUIViewForKey:@"shareETADisclosureButton"];
  [v5 setIsAccessibilityElement:v3];
}

@end