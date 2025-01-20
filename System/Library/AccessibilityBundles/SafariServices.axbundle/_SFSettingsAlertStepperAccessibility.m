@interface _SFSettingsAlertStepperAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)initUsingResetButton:(BOOL)a3;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation _SFSettingsAlertStepperAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFSettingsAlertStepper";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFSettingsAlertStepper", @"_incrementTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFSettingsAlertStepper", @"_decrementTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFSettingsAlertStepper", @"_resetTapped:", "v", "@", 0);
  [v3 validateClass:@"_SFSettingsAlertStepper" hasInstanceVariable:@"_resetButton" withType:"_SFSettingsAlertButton"];
  [v3 validateClass:@"_SFSettingsAlertButton" hasInstanceVariable:@"_text" withType:"NSString"];
}

- (BOOL)isAccessibilityElement
{
  return AXRequestingClient() == 3 || AXRequestingClient() == 4;
}

- (id)initUsingResetButton:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SFSettingsAlertStepperAccessibility;
  id v3 = [(_SFSettingsAlertStepperAccessibility *)&v5 initUsingResetButton:a3];
  [v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)_SFSettingsAlertStepperAccessibility;
  [(_SFSettingsAlertStepperAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  id v3 = accessibilitySafariServicesLocalizedString(@"increment");
  v4 = [(_SFSettingsAlertStepperAccessibility *)self safeUIViewForKey:@"_incrementButton"];
  [v4 setAccessibilityLabel:v3];

  objc_super v5 = accessibilitySafariServicesLocalizedString(@"decrement");
  v6 = [(_SFSettingsAlertStepperAccessibility *)self safeUIViewForKey:@"_decrementButton"];
  [v6 setAccessibilityLabel:v5];

  v7 = [(_SFSettingsAlertStepperAccessibility *)self safeUIViewForKey:@"_resetButton"];
  v8 = accessibilitySafariServicesLocalizedString(@"reset");
  [v7 setAccessibilityLabel:v8];

  objc_initWeak(&location, v7);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82___SFSettingsAlertStepperAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &unk_26514ABC8;
  objc_copyWeak(&v10, &location);
  [v7 _setAccessibilityValueBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (unint64_t)accessibilityTraits
{
  v2 = [(_SFSettingsAlertStepperAccessibility *)self accessibilityIdentifier];
  int v3 = [v2 isEqualToString:@"PlaybackStateAndPosition"];

  v4 = (unint64_t *)MEMORY[0x263F1CF18];
  if (!v3) {
    v4 = (unint64_t *)MEMORY[0x263F1CED8];
  }
  return *v4;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (id)accessibilityLabel
{
  return accessibilitySafariServicesLocalizedString(@"text.size");
}

- (id)accessibilityValue
{
  v8.receiver = self;
  v8.super_class = (Class)_SFSettingsAlertStepperAccessibility;
  int v3 = [(_SFSettingsAlertStepperAccessibility *)&v8 accessibilityValue];

  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)_SFSettingsAlertStepperAccessibility;
    v4 = [(_SFSettingsAlertStepperAccessibility *)&v7 accessibilityValue];
  }
  else
  {
    objc_super v5 = [(_SFSettingsAlertStepperAccessibility *)self safeValueForKey:@"_resetButton"];
    v4 = [v5 safeStringForKey:@"_text"];
  }

  return v4;
}

@end