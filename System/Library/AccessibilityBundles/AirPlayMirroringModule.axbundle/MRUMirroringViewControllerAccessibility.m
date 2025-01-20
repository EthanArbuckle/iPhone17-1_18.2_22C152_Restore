@interface MRUMirroringViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityControlCenterElementToFocusAfterClose;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation MRUMirroringViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUMirroringViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUMirroringViewController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"MRUMirroringViewController" isKindOfClass:@"CCUIMenuModuleViewController"];
  [v3 validateClass:@"CCUIMenuModuleViewController" isKindOfClass:@"CCUIButtonModuleViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIButtonModuleViewController", @"isExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIButtonModuleViewController", @"buttonView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)MRUMirroringViewControllerAccessibility;
  [(MRUMirroringViewControllerAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MRUMirroringViewControllerAccessibility *)self safeValueForKey:@"buttonView"];
  [v3 setIsAccessibilityElement:1];
  objc_initWeak(&location, self);
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  v6 = __85__MRUMirroringViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7 = &unk_2651032B0;
  objc_copyWeak(&v8, &location);
  [v3 _setAccessibilityTraitsBlock:&v4];
  objc_msgSend(v3, "setAccessibilityRespondsToUserInteraction:", 1, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __85__MRUMirroringViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained safeBoolForKey:@"isExpanded"];

  uint64_t v3 = MEMORY[0x263F1CEF8];
  if (!v2) {
    uint64_t v3 = MEMORY[0x263F1CEE8];
  }
  return *(void *)v3;
}

- (id)_accessibilityControlCenterElementToFocusAfterClose
{
  return (id)[(MRUMirroringViewControllerAccessibility *)self safeValueForKey:@"buttonView"];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MRUMirroringViewControllerAccessibility;
  [(MRUMirroringViewControllerAccessibility *)&v3 viewDidLoad];
  [(MRUMirroringViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end