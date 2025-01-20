@interface SFSettingsAlertStepperAccessibility
@end

@implementation SFSettingsAlertStepperAccessibility

id __82___SFSettingsAlertStepperAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeStringForKey:@"_text"];

  return v2;
}

uint64_t __62___SFSettingsAlertStepperAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _incrementTapped:0];
}

uint64_t __62___SFSettingsAlertStepperAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementTapped:0];
}

@end