@interface HUQuickControlElasticSliderInteractionCoordinatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (HUQuickControlElasticSliderInteractionCoordinatorAccessibility)initWithControlView:(id)a3 delegate:(id)a4;
@end

@implementation HUQuickControlElasticSliderInteractionCoordinatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlElasticSliderInteractionCoordinator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (HUQuickControlElasticSliderInteractionCoordinatorAccessibility)initWithControlView:(id)a3 delegate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlElasticSliderInteractionCoordinatorAccessibility;
  id v5 = a3;
  v6 = [(HUQuickControlElasticSliderInteractionCoordinatorAccessibility *)&v8 initWithControlView:v5 delegate:a4];
  objc_msgSend(v5, "_accessibilitySetAssignedValue:forKey:", v6, AXControlUpdateDelegateKey, v8.receiver, v8.super_class);

  return v6;
}

@end