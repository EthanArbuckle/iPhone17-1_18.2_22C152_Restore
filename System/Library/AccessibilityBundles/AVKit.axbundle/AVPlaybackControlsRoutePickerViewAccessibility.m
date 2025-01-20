@interface AVPlaybackControlsRoutePickerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)customButton;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AVPlaybackControlsRoutePickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVPlaybackControlsRoutePickerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsRoutePickerView", @"customButton", "@", 0);
  [v3 validateClass:@"AVPlaybackControlsRoutePickerView" hasInstanceVariable:@"_customButton" withType:"AVButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)AVPlaybackControlsRoutePickerViewAccessibility;
  [(AVPlaybackControlsRoutePickerViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = accessibilityLocalizedString(@"airplay.button");
  v4 = [(AVPlaybackControlsRoutePickerViewAccessibility *)self safeUIViewForKey:@"_customButton"];
  [v4 setAccessibilityLabel:v3];
}

- (id)customButton
{
  v5.receiver = self;
  v5.super_class = (Class)AVPlaybackControlsRoutePickerViewAccessibility;
  id v3 = [(AVPlaybackControlsRoutePickerViewAccessibility *)&v5 customButton];
  [(AVPlaybackControlsRoutePickerViewAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end