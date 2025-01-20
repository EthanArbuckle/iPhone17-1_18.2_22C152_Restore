@interface AVTransportControlsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (AVTransportControlsViewAccessibility)initWithFrame:(CGRect)a3 styleSheet:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AVTransportControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTransportControlsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTransportControlsView", @"elapsedTimeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTransportControlsView", @"timeRemainingLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTransportControlsView", @"scrubber", "@", 0);
  [v3 validateClass:@"AVTransportControlsView" hasInstanceVariable:@"_standardPlayPauseButton" withType:"AVButton"];
  [v3 validateClass:@"AVTransportControlsView" hasInstanceVariable:@"_skipBackButton" withType:"AVButton"];
  [v3 validateClass:@"AVTransportControlsView" hasInstanceVariable:@"_skipForwardButton" withType:"AVButton"];
  [v3 validateClass:@"AVTransportControlsView" hasInstanceVariable:@"_startRightwardContentTransitionButton" withType:"AVButton"];
  [v3 validateClass:@"AVTransportControlsView" hasInstanceVariable:@"_startLeftwardContentTransitionButton" withType:"AVButton"];
  [v3 validateClass:@"AVLabel" isKindOfClass:@"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTransportControlsView", @"initWithFrame:styleSheet:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
}

- (AVTransportControlsViewAccessibility)initWithFrame:(CGRect)a3 styleSheet:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AVTransportControlsViewAccessibility;
  v4 = -[AVTransportControlsViewAccessibility initWithFrame:styleSheet:](&v6, sel_initWithFrame_styleSheet_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AVTransportControlsViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v39.receiver = self;
  v39.super_class = (Class)AVTransportControlsViewAccessibility;
  [(AVTransportControlsViewAccessibility *)&v39 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AVTransportControlsViewAccessibility *)self safeUIViewForKey:@"elapsedTimeLabel"];
  objc_initWeak(&location, v3);

  id v4 = objc_loadWeakRetained(&location);
  v5 = accessibilityLocalizedString(@"elapsed.label");
  [v4 setAccessibilityLabel:v5];

  uint64_t v6 = *MEMORY[0x263F1CF68] | *MEMORY[0x263F1CF48];
  id v7 = objc_loadWeakRetained(&location);
  [v7 setAccessibilityTraits:v6];

  id v8 = objc_loadWeakRetained(&location);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __82__AVTransportControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v36[3] = &unk_265101948;
  objc_copyWeak(&v37, &location);
  [v8 _setAccessibilityValueBlock:v36];

  v9 = [(AVTransportControlsViewAccessibility *)self safeUIViewForKey:@"timeRemainingLabel"];
  objc_initWeak(&from, v9);

  id v10 = objc_loadWeakRetained(&from);
  [v10 setAccessibilityTraits:v6];

  id v11 = objc_loadWeakRetained(&from);
  v12 = accessibilityLocalizedString(@"remaining.label");
  [v11 setAccessibilityLabel:v12];

  id v13 = objc_loadWeakRetained(&from);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __82__AVTransportControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v33[3] = &unk_265101948;
  objc_copyWeak(&v34, &from);
  [v13 _setAccessibilityValueBlock:v33];

  v14 = [(AVTransportControlsViewAccessibility *)self safeValueForKey:@"scrubber"];
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  v30 = __82__AVTransportControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v31 = &unk_265101948;
  objc_copyWeak(&v32, &location);
  [v14 _setAccessibilityValueBlock:&v28];

  v15 = [(AVTransportControlsViewAccessibility *)self safeValueForKey:@"_standardPlayPauseButton"];
  [v15 accessibilitySetIdentification:@"axPlayPauseButton"];

  v16 = [(AVTransportControlsViewAccessibility *)self safeValueForKey:@"_skipBackButton"];
  v17 = NSString;
  v18 = accessibilityLocalizedString(@"media.skip.backwards");
  v19 = objc_msgSend(v17, "localizedStringWithFormat:", v18, 0x402E000000000000, v28, v29, v30, v31);
  [v16 setAccessibilityLabel:v19];

  v20 = [(AVTransportControlsViewAccessibility *)self safeValueForKey:@"_skipForwardButton"];
  v21 = NSString;
  v22 = accessibilityLocalizedString(@"media.skip.forward");
  v23 = objc_msgSend(v21, "localizedStringWithFormat:", v22, 0x402E000000000000);
  [v20 setAccessibilityLabel:v23];

  v24 = accessibilityLocalizedString(@"next.track");
  v25 = [(AVTransportControlsViewAccessibility *)self safeUIViewForKey:@"_startRightwardContentTransitionButton"];
  [v25 setAccessibilityLabel:v24];

  v26 = accessibilityLocalizedString(@"previous.track");
  v27 = [(AVTransportControlsViewAccessibility *)self safeUIViewForKey:@"_startLeftwardContentTransitionButton"];
  [v27 setAccessibilityLabel:v26];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

id __82__AVTransportControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeStringForKey:@"text"];

  return v2;
}

id __82__AVTransportControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeStringForKey:@"text"];

  return v2;
}

id __82__AVTransportControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeStringForKey:@"text"];

  return v2;
}

@end