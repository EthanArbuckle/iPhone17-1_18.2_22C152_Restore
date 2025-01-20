@interface DeviceInformationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)subviewsForStackViewElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axLoadLabelAccessibility;
- (void)infoLabelTapped;
@end

@implementation DeviceInformationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Diagnostics.DeviceInformationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Diagnostics.DeviceInformationView" hasInstanceVariable:@"deviceIdentifierLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Diagnostics.DeviceInformationView", @"marketingNameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Diagnostics.DeviceInformationView", @"descriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Diagnostics.DeviceInformationView", @"addButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Diagnostics.DeviceInformationView", @"ellipsisButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Diagnostics.DeviceInformationView", @"activityIndicator", "@", 0);
  [v3 validateClass:@"Diagnostics.DeviceInformationView" hasInstanceVariable:@"infoLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Diagnostics.DeviceInformationView", @"infoLabelType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Diagnostics.DeviceInformationView", @"infoLabelTapped", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)DeviceInformationViewAccessibility;
  [(DeviceInformationViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(DeviceInformationViewAccessibility *)self safeValueForKey:@"addButton"];
  v4 = accessibilityLocalizedString(@"add");
  [v3 setAccessibilityLabel:v4];

  v5 = [(DeviceInformationViewAccessibility *)self safeValueForKey:@"ellipsisButton"];
  v6 = accessibilityLocalizedString(@"more");
  [v5 setAccessibilityLabel:v6];

  v7 = [(DeviceInformationViewAccessibility *)self safeValueForKey:@"activityIndicator"];
  v8 = accessibilityLocalizedString(@"loading");
  [v7 setAccessibilityLabel:v8];

  AXPerformBlockAsynchronouslyOnMainThread();
}

void __80__DeviceInformationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"deviceIdentifierLabel"];
  id v3 = __UIAccessibilityCastAsClass();

  v4 = accessibilityLocalizedString(@"device_identifier");
  v5 = [v3 text];
  v6 = __UIAXStringForVariables();
  objc_msgSend(v3, "setAccessibilityLabel:", v6, v5, @"__AXStringForVariablesSentinel");

  [*(id *)(a1 + 32) _axLoadLabelAccessibility];
}

- (id)subviewsForStackViewElement
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(DeviceInformationViewAccessibility *)self safeValueForKey:@"deviceIdentifierLabel"];
  v5 = [(DeviceInformationViewAccessibility *)self safeValueForKey:@"marketingNameLabel"];
  v6 = [(DeviceInformationViewAccessibility *)self safeValueForKey:@"descriptionLabel"];
  v7 = [(DeviceInformationViewAccessibility *)self safeValueForKey:@"infoLabel"];
  v8 = [(DeviceInformationViewAccessibility *)self safeValueForKey:@"addButton"];
  objc_super v9 = [(DeviceInformationViewAccessibility *)self safeValueForKey:@"ellipsisButton"];
  v10 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 6, v4, v5, v6, v7, v8, v9);

  return v10;
}

- (void)_axLoadLabelAccessibility
{
  objc_opt_class();
  id v3 = [(DeviceInformationViewAccessibility *)self safeValueForKey:@"infoLabel"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [(DeviceInformationViewAccessibility *)self safeIntegerForKey:@"infoLabelType"];
  if (v5 == 1)
  {
    v6 = accessibilityLocalizedString(@"imei");
    v7 = [v4 text];
    v11 = v7;
    v8 = __UIAXStringForVariables();
    objc_super v9 = @"show_serial_number";
    goto LABEL_5;
  }
  if (!v5)
  {
    v6 = accessibilityLocalizedString(@"serial_number");
    v7 = [v4 text];
    v11 = v7;
    v8 = __UIAXStringForVariables();
    objc_super v9 = @"show_imei";
LABEL_5:
    objc_msgSend(v4, "setAccessibilityLabel:", v8, v11, @"__AXStringForVariablesSentinel");

    v10 = accessibilityLocalizedString(v9);
    [v4 setAccessibilityHint:v10];
  }
}

- (void)infoLabelTapped
{
  v3.receiver = self;
  v3.super_class = (Class)DeviceInformationViewAccessibility;
  [(DeviceInformationViewAccessibility *)&v3 infoLabelTapped];
  [(DeviceInformationViewAccessibility *)self _axLoadLabelAccessibility];
}

@end