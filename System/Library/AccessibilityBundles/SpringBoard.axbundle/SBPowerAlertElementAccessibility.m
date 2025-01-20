@interface SBPowerAlertElementAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (double)preferredAlertingDuration:(double)a3;
@end

@implementation SBPowerAlertElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBPowerAlertElement";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBPowerAlertElement"];
  [v3 validateProtocol:@"SBSystemApertureContextProviding" hasOptionalInstanceMethod:@"preferredAlertingDuration:"];
  [v3 validateClass:@"SBPowerAlertElement" conformsToProtocol:@"SBSystemApertureContextProviding"];
}

- (double)preferredAlertingDuration:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBPowerAlertElementAccessibility;
  [(SBPowerAlertElementAccessibility *)&v7 preferredAlertingDuration:a3];
  double v4 = v3;
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  double result = 15.0;
  if (!IsVoiceOverRunning || v4 >= 15.0) {
    return v4;
  }
  return result;
}

@end