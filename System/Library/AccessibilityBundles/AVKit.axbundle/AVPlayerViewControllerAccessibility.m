@interface AVPlayerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axObservePIPStateNotifications;
- (void)_axPIPStop:(id)a3;
- (void)_axSetupVideoLayerView;
- (void)_togglePictureInPicture;
- (void)dealloc;
@end

@implementation AVPlayerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVPlayerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerViewController", @"loadView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPictureInPictureController", @"isPictureInPictureActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerViewController", @"_togglePictureInPicture", "v", 0);
  [v3 validateClass:@"AVPlayerViewController" hasInstanceVariable:@"_playerLayerView" withType:"__AVPlayerLayerView"];
}

- (void)_axObservePIPStateNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__axPIPStop_ name:AXPIPStoppedNotification object:0];
}

- (void)_axPIPStop:(id)a3
{
  id v3 = [(AVPlayerViewControllerAccessibility *)self safeValueForKey:@"_playerLayerView"];
  [v3 setIsAccessibilityElement:1];
}

- (void)_axSetupVideoLayerView
{
  id v4 = [(AVPlayerViewControllerAccessibility *)self safeValueForKey:@"_playerLayerView"];
  id v3 = [(AVPlayerViewControllerAccessibility *)self safeValueForKey:@"_pictureInPictureController"];
  objc_msgSend(v4, "setIsAccessibilityElement:", objc_msgSend(v3, "safeBoolForKey:", @"isPictureInPictureActive") ^ 1);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)AVPlayerViewControllerAccessibility;
  [(AVPlayerViewControllerAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  [(AVPlayerViewControllerAccessibility *)self _axSetupVideoLayerView];
  [(AVPlayerViewControllerAccessibility *)self _axObservePIPStateNotifications];
  id v3 = [(AVPlayerViewControllerAccessibility *)self safeValueForKey:@"_pictureInPictureController"];
  [v3 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  id v4 = __UIAccessibilitySafeClass();
  v5 = [v4 contentOverlayView];
  objc_initWeak(&location, v5);

  id v6 = objc_loadWeakRetained(&location);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__AVPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_265101A40;
  objc_copyWeak(&v8, &location);
  [v6 _setAccessibilityElementsHiddenBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

BOOL __81__AVPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  if (!_AXSAutomationEnabled()) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained subviews];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:AXPIPStoppedNotification];

  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewControllerAccessibility;
  [(AVPlayerViewControllerAccessibility *)&v4 dealloc];
}

- (void)_togglePictureInPicture
{
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerViewControllerAccessibility;
  [(AVPlayerViewControllerAccessibility *)&v5 _togglePictureInPicture];
  id v3 = [(AVPlayerViewControllerAccessibility *)self safeValueForKey:@"_playerLayerView"];
  objc_super v4 = [(AVPlayerViewControllerAccessibility *)self safeValueForKey:@"_pictureInPictureController"];
  objc_msgSend(v3, "setIsAccessibilityElement:", objc_msgSend(v4, "safeBoolForKey:", @"isPictureInPictureActive"));
}

@end