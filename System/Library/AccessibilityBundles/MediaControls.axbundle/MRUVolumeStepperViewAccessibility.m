@interface MRUVolumeStepperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MRUVolumeStepperViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MRUVolumeStepperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUVolumeStepperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUVolumeStepperView", @"decreaseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUVolumeStepperView", @"increaseButton", "@", 0);
}

- (MRUVolumeStepperViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRUVolumeStepperViewAccessibility;
  id v3 = -[MRUVolumeStepperViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MRUVolumeStepperViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)MRUVolumeStepperViewAccessibility;
  [(MRUVolumeStepperViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = accessibilityLocalizedString(@"decrease.volume.stepper.label");
  v4 = [(MRUVolumeStepperViewAccessibility *)self safeUIViewForKey:@"decreaseButton"];
  [v4 setAccessibilityLabel:v3];

  objc_super v5 = accessibilityLocalizedString(@"increase.volume.stepper.label");
  v6 = [(MRUVolumeStepperViewAccessibility *)self safeUIViewForKey:@"increaseButton"];
  [v6 setAccessibilityLabel:v5];
}

@end