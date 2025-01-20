@interface MRUContinuousSliderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation MRUContinuousSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUContinuousSliderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUVolumeViewController", @"audioModuleController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUAudioModuleController", @"volumeController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUSystemVolumeController", @"outputDeviceRouteController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUSystemOutputDeviceRouteController", @"isSplitRoute", "B", 0);
  [v3 validateClass:@"MRUContinuousSliderView" isKindOfClass:@"UIView"];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"volume.slider.label");
}

- (id)accessibilityValue
{
  id v3 = [(MRUContinuousSliderViewAccessibility *)self safeUIViewForKey:@"superview"];
  v4 = [v3 _accessibilityViewController];
  v5 = [v4 safeValueForKeyPath:@"audioModuleController.volumeController"];
  v6 = [v5 safeValueForKey:@"outputDeviceRouteController"];
  if ([v6 safeBoolForKey:@"isSplitRoute"])
  {
    uint64_t v7 = accessibilityLocalizedString(@"volume.slider.value");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MRUContinuousSliderViewAccessibility;
    uint64_t v7 = [(MRUContinuousSliderViewAccessibility *)&v10 accessibilityValue];
  }
  v8 = (void *)v7;

  return v8;
}

@end