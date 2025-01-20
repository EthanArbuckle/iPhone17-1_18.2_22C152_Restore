@interface SBDeviceApplicationSceneClassicAccessoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateRotationButton;
- (void)_updateZoomButton;
@end

@implementation SBDeviceApplicationSceneClassicAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBDeviceApplicationSceneClassicAccessoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDeviceApplicationSceneClassicAccessoryView", @"_updateZoomButton", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDeviceApplicationSceneClassicAccessoryView", @"_isZoomed", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDeviceApplicationSceneClassicAccessoryView", @"_updateRotationButton", "v", 0);
  [v3 validateClass:@"SBDeviceApplicationSceneClassicAccessoryView" hasInstanceVariable:@"_zoomButton" withType:"UIButton"];
  [v3 validateClass:@"SBDeviceApplicationSceneClassicAccessoryView" hasInstanceVariable:@"_counterClockWiseRotationButton" withType:"UIButton"];
  [v3 validateClass:@"SBDeviceApplicationSceneClassicAccessoryView" hasInstanceVariable:@"_clockWiseRotationButton" withType:"UIButton"];
  [v3 validateClass:@"SBDeviceApplicationSceneClassicAccessoryView" hasInstanceVariable:@"_buttonOrientation" withType:"NSInteger"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)SBDeviceApplicationSceneClassicAccessoryViewAccessibility;
  [(SBDeviceApplicationSceneClassicAccessoryViewAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SBDeviceApplicationSceneClassicAccessoryViewAccessibility *)self safeValueForKey:@"_zoomButton"];
  if ([(SBDeviceApplicationSceneClassicAccessoryViewAccessibility *)self safeBoolForKey:@"_isZoomed"])v4 = @"fullscreen.zoom"; {
  else
  }
    v4 = @"normal.zoom";
  v5 = accessibilityLocalizedString(v4);
  [v3 setAccessibilityLabel:v5];

  v6 = [(SBDeviceApplicationSceneClassicAccessoryViewAccessibility *)self safeValueForKey:@"_clockWiseRotationButton"];
  v7 = accessibilityLocalizedString(@"clockwise.rotation.button");
  [v6 setAccessibilityLabel:v7];

  v8 = [(SBDeviceApplicationSceneClassicAccessoryViewAccessibility *)self safeValueForKey:@"_counterClockWiseRotationButton"];
  v9 = accessibilityLocalizedString(@"counter.clockwise.rotation.button");
  [v8 setAccessibilityLabel:v9];
}

- (void)_updateRotationButton
{
  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationSceneClassicAccessoryViewAccessibility;
  [(SBDeviceApplicationSceneClassicAccessoryViewAccessibility *)&v5 _updateRotationButton];
  [(SBDeviceApplicationSceneClassicAccessoryViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  unint64_t v3 = [(SBDeviceApplicationSceneClassicAccessoryViewAccessibility *)self safeIntegerForKey:@"buttonOrientation"]- 1;
  if (v3 > 3)
  {
    v4 = &stru_26F7D3690;
  }
  else
  {
    accessibilityLocalizedString(off_265154550[v3]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ([(__CFString *)v4 length]) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v4);
  }
}

- (void)_updateZoomButton
{
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneClassicAccessoryViewAccessibility;
  [(SBDeviceApplicationSceneClassicAccessoryViewAccessibility *)&v3 _updateZoomButton];
  [(SBDeviceApplicationSceneClassicAccessoryViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end