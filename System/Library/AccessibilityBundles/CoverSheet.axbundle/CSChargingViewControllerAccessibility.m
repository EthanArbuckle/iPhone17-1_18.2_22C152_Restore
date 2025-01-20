@interface CSChargingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CSChargingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSChargingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_CSSingleBatteryChargingView"];
  [v3 validateClass:@"SBUILegibilityLabel"];
  [v3 validateClass:@"CSChargingViewController" hasInstanceVariable:@"_chargingView" withType:"CSBatteryChargingView"];
  [v3 validateClass:@"_CSSingleBatteryChargingView" hasInstanceVariable:@"_chargePercentLabel" withType:"SBUILegibilityLabel"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSChargingViewControllerAccessibility;
  [(CSChargingViewControllerAccessibility *)&v6 viewDidAppear:a3];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v4 = [(CSChargingViewControllerAccessibility *)self safeValueForKey:@"_chargingView"];
    NSClassFromString(&cfstr_Csbatterycharg_2.isa);
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 accessibilityLabel];
      UIAccessibilitySpeakAndDoNotBeInterrupted();
    }
  }
}

@end