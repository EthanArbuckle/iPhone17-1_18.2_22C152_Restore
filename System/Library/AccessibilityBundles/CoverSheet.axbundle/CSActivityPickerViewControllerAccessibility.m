@interface CSActivityPickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CSActivityPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSActivityPickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSActivityPickerViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSActivityPickerViewController", @"dismiss", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)CSActivityPickerViewControllerAccessibility;
  [(CSActivityPickerViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(CSActivityPickerViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __89__CSActivityPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_26511B6F8;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityPerformEscapeBlock:v4];
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

uint64_t __89__CSActivityPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v2);
  return 1;
}

void __89__CSActivityPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismiss];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CSActivityPickerViewControllerAccessibility;
  [(CSActivityPickerViewControllerAccessibility *)&v3 viewDidLoad];
  [(CSActivityPickerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end