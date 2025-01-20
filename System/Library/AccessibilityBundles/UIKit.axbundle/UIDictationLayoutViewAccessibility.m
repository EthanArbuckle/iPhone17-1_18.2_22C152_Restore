@interface UIDictationLayoutViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (UIDictationLayoutViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation UIDictationLayoutViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDictationLayoutView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UIDictationLayoutView" hasInstanceVariable:@"_keyboardButton" withType:"UIButton"];
  [location[0] validateClass:@"UIDictationLayoutView" hasInstanceVariable:@"_waveTapEndpointButtonView" withType:"UIView"];
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UIDictationView" hasInstanceVariable:@"_endpointButtonLandscape" withType:"UIButton"];
  objc_storeStrong(location, 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v26 = self;
  SEL v25 = a2;
  v24.receiver = self;
  v24.super_class = (Class)UIDictationLayoutViewAccessibility;
  [(UIDictationLayoutViewAccessibility *)&v24 _accessibilityLoadAccessibilityInformation];
  id v18 = (id)[(UIDictationLayoutViewAccessibility *)v26 safeValueForKey:@"_globeButton"];
  id v17 = accessibilityLocalizedString(@"dictate.globe.button");
  objc_msgSend(v18, "setAccessibilityLabel:");

  id v20 = (id)[(UIDictationLayoutViewAccessibility *)v26 safeValueForKey:@"_keyboardButton"];
  id v19 = accessibilityLocalizedString(@"dictate.keyboard.button");
  objc_msgSend(v20, "setAccessibilityLabel:");

  if (AXDeviceIsPhone())
  {
    id v23 = (id)[(UIDictationLayoutViewAccessibility *)v26 safeValueForKey:@"_endpointButton"];
    id v22 = (id)[(UIDictationLayoutViewAccessibility *)v26 safeValueForKey:@"_endpointButtonLandscape"];
    [v23 setIsAccessibilityElement:1];
    [v23 setAccessibilityRespondsToUserInteraction:1];
    v10 = (void *)MEMORY[0x263F1CF08];
    v11 = (void *)MEMORY[0x263F813E8];
    v12 = (void *)MEMORY[0x263F1CEE8];
    [v23 setAccessibilityTraits:*MEMORY[0x263F1CF08] | *MEMORY[0x263F813E8] | *MEMORY[0x263F1CEE8]];
    id v6 = v23;
    id v7 = accessibilityLocalizedString(@"done.button");
    objc_msgSend(v6, "setAccessibilityLabel:");

    id v8 = v23;
    id v9 = accessibilityLocalizedString(@"end.quietly.hint");
    objc_msgSend(v8, "setAccessibilityHint:");

    [v22 setIsAccessibilityElement:1];
    [v22 setAccessibilityRespondsToUserInteraction:1];
    [v22 setAccessibilityTraits:*v10 | *v11 | *v12];
    id v13 = v22;
    id v14 = accessibilityLocalizedString(@"done.button");
    objc_msgSend(v13, "setAccessibilityLabel:");

    id v15 = v22;
    id v16 = accessibilityLocalizedString(@"end.quietly.hint");
    objc_msgSend(v15, "setAccessibilityHint:");

    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  id v21 = (id)[(UIDictationLayoutViewAccessibility *)v26 safeValueForKey:@"_waveTapEndpointButtonView"];
  [v21 setIsAccessibilityElement:1];
  [v21 setAccessibilityRespondsToUserInteraction:0];
  id v2 = v21;
  id v3 = accessibilityLocalizedString(@"dictation.key");
  objc_msgSend(v2, "setAccessibilityLabel:");

  id v4 = v21;
  id v5 = accessibilityLocalizedString(@"dictation.key.hint");
  objc_msgSend(v4, "setAccessibilityHint:");

  objc_storeStrong(&v21, 0);
}

- (UIDictationLayoutViewAccessibility)initWithFrame:(CGRect)a3
{
  CGRect v8 = a3;
  v6[1] = (id)a2;
  id v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)UIDictationLayoutViewAccessibility;
  id v7 = -[UIDictationLayoutViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6[0] = v7;
  [v6[0] _accessibilityLoadAccessibilityInformation];
  id v4 = (UIDictationLayoutViewAccessibility *)v6[0];
  objc_storeStrong(v6, 0);
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

@end