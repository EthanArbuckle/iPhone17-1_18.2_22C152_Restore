@interface MRUVolumeViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateEnvironmentSliderValueAnimated:(BOOL)a3;
- (void)updatePrimarySliderVolumeValueAnimated:(BOOL)a3;
@end

@implementation MRUVolumeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUVolumeViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MRUVolumeView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUVolumeViewController", @"updatePrimarySliderVolumeValueAnimated:", "v", "B", 0);
  [v3 validateClass:@"MRUVolumeViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUVolumeView", @"primarySlider", "@", 0);
  [v3 validateClass:@"MRUContinuousSliderView" isKindOfClass:@"CCUIContinuousSliderView"];
  [v3 validateClass:@"CCUIContinuousSliderView" isKindOfClass:@"CCUIBaseSliderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIBaseSliderView", @"value", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUVolumeView", @"environmentSlider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUVolumeViewController", @"updateEnvironmentSliderValueAnimated:", "v", "B", 0);
}

- (void)updatePrimarySliderVolumeValueAnimated:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MRUVolumeViewControllerAccessibility;
  [(MRUVolumeViewControllerAccessibility *)&v7 updatePrimarySliderVolumeValueAnimated:a3];
  v4 = [(MRUVolumeViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  v5 = [v4 safeUIViewForKey:@"primarySlider"];

  if (objc_opt_respondsToSelector())
  {
    [v5 safeFloatForKey:@"value"];
    [v5 _axSetVolumeValue:v6];
  }
}

- (void)updateEnvironmentSliderValueAnimated:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MRUVolumeViewControllerAccessibility;
  [(MRUVolumeViewControllerAccessibility *)&v7 updateEnvironmentSliderValueAnimated:a3];
  v4 = [(MRUVolumeViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  v5 = [v4 safeUIViewForKey:@"environmentSlider"];

  if (objc_opt_respondsToSelector())
  {
    [v5 safeFloatForKey:@"value"];
    [v5 _axSetVolumeValue:v6];
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)MRUVolumeViewControllerAccessibility;
  [(MRUVolumeViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MRUVolumeViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  v4 = [v3 safeUIViewForKey:@"environmentSlider"];

  v5 = accessibilityYodelLocalizedString(@"amplification.ax.label");
  [v4 setAccessibilityLabel:v5];
}

@end