@interface MediaControlsRelativeVolumeStepperAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MediaControlsRelativeVolumeStepperAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsRelativeVolumeStepper";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsRelativeVolumeStepper", @"increaseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsRelativeVolumeStepper", @"decreaseButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)MediaControlsRelativeVolumeStepperAccessibility;
  [(MediaControlsRelativeVolumeStepperAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MediaControlsRelativeVolumeStepperAccessibility *)self safeValueForKey:@"increaseButton"];
  v4 = accessibilityLocalizedString(@"increase.volume.stepper.label");
  [v3 setAccessibilityLabel:v4];

  v5 = [(MediaControlsRelativeVolumeStepperAccessibility *)self safeValueForKey:@"decreaseButton"];
  v6 = accessibilityLocalizedString(@"decrease.volume.stepper.label");
  [v5 setAccessibilityLabel:v6];
}

@end