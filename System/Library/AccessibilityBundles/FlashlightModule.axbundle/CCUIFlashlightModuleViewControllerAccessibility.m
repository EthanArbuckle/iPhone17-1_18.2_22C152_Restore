@interface CCUIFlashlightModuleViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityControlCenterButtonIsToggle;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CCUIFlashlightModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIFlashlightModuleViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CCUIFlashlightModuleViewController" hasInstanceVariable:@"_sliderView" withType:"CCUIBaseSliderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIFlashlightModuleViewController", @"viewDidLoad", "v", 0);
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(@"flashlight.button.label");
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return @"flashlight";
}

- (BOOL)_accessibilityControlCenterButtonIsToggle
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)CCUIFlashlightModuleViewControllerAccessibility;
  [(CCUIFlashlightModuleViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CCUIFlashlightModuleViewControllerAccessibility *)self safeUIViewForKey:@"_sliderView"];
  objc_initWeak(&location, v3);
  v4 = accessibilityLocalizedString(@"flashlight.slider.label");
  [v3 setAccessibilityLabel:v4];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __93__CCUIFlashlightModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_265121368;
  objc_copyWeak(&v6, &location);
  [v3 _setAccessibilityValueBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __93__CCUIFlashlightModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained safeUnsignedIntegerForKey:@"step"];

  id v4 = objc_loadWeakRetained(v1);
  uint64_t v5 = [v4 safeUnsignedIntegerForKey:@"numberOfSteps"];

  if (v5 != 5) {
    _AXAssert();
  }
  if ((unint64_t)(v3 - 1) > 3) {
    id v6 = @"flashlight.level.very.bright";
  }
  else {
    id v6 = off_265121388[v3 - 1];
  }
  v7 = accessibilityLocalizedString(v6);

  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIFlashlightModuleViewControllerAccessibility;
  [(CCUIFlashlightModuleViewControllerAccessibility *)&v3 viewDidLoad];
  [(CCUIFlashlightModuleViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end