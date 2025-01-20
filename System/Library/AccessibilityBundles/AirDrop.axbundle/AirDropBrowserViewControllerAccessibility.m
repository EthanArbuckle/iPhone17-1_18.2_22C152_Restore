@interface AirDropBrowserViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)browserDidUpdateMePeople:(id)a3 knownPeople:(id)a4 unknownPeople:(id)a5;
- (void)viewDidLoad;
@end

@implementation AirDropBrowserViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AirDropBrowserViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AirDropBrowserViewController", @"browserDidUpdateMePeople:knownPeople:unknownPeople:", "v", "@", "@", "@", 0);
  [v3 validateClass:@"AirDropBrowserViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AirDropBrowserViewController", @"airDropNoContentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AirDropNoContentView", @"actionButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)AirDropBrowserViewControllerAccessibility;
  [(AirDropBrowserViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AirDropBrowserViewControllerAccessibility *)self safeValueForKeyPath:@"airDropNoContentView.actionButton"];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __87__AirDropBrowserViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_265102FC0;
  objc_copyWeak(&v5, &location);
  [v3 _setIsAccessibilityElementBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

BOOL __87__AirDropBrowserViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKeyPath:@"airDropNoContentView.actionButton"];
  id v3 = [v2 accessibilityLabel];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AirDropBrowserViewControllerAccessibility;
  [(AirDropBrowserViewControllerAccessibility *)&v3 viewDidLoad];
  [(AirDropBrowserViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)browserDidUpdateMePeople:(id)a3 knownPeople:(id)a4 unknownPeople:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)AirDropBrowserViewControllerAccessibility;
  [(AirDropBrowserViewControllerAccessibility *)&v6 browserDidUpdateMePeople:a3 knownPeople:a4 unknownPeople:a5];
  dispatch_time_t v5 = dispatch_time(0, 500000000);
  dispatch_after(v5, MEMORY[0x263EF83A0], &__block_literal_global_0);
}

void __96__AirDropBrowserViewControllerAccessibility_browserDidUpdateMePeople_knownPeople_unknownPeople___block_invoke()
{
}

@end