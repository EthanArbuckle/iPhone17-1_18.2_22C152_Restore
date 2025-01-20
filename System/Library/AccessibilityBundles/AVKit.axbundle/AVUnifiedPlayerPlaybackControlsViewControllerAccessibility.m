@interface AVUnifiedPlayerPlaybackControlsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AVUnifiedPlayerPlaybackControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVUnifiedPlayerPlaybackControlsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingPlaybackControlsViewController", @"_playbackMetadataViewController", "@", 0);
  [v3 validateClass:@"AVUnifiedPlayerPlaybackMetadataViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingPlaybackControlsViewController", @"overlayViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVxOverlayViewController", @"collectionViewController", "@", 0);
  [v3 validateClass:@"AVxCollectionViewController" isKindOfClass:@"UICollectionViewController"];
  [v3 validateClass:@"AVNowPlayingPlaybackControlsViewController" hasInstanceVariable:@"_transportBar" withType:"UIView<AVTransportControlsProviding>"];
  [v3 validateClass:@"AVNowPlayingPlaybackControlsViewController" hasInstanceVariable:@"_infoPanelViewController" withType:"AVInfoPanelViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVInfoMenuController", @"collectionView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)AVUnifiedPlayerPlaybackControlsViewControllerAccessibility;
  [(AVUnifiedPlayerPlaybackControlsViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(AVUnifiedPlayerPlaybackControlsViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __104__AVUnifiedPlayerPlaybackControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_265101A18;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityElementsBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __104__AVUnifiedPlayerPlaybackControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [MEMORY[0x263EFF980] array];
  id v3 = [WeakRetained safeValueForKeyPath:@"_playbackMetadataViewController.view"];
  v4 = [v3 safeArrayForKey:@"subviews"];
  [v2 axSafelyAddObjectsFromArray:v4];

  id v5 = [WeakRetained safeValueForKeyPath:@"_overlayViewController.collectionViewController.collectionView"];
  [v2 axSafelyAddObject:v5];

  v6 = [WeakRetained safeValueForKey:@"_transportBar"];
  [v2 axSafelyAddObject:v6];

  objc_super v7 = [WeakRetained safeValueForKeyPath:@"_infoPanelViewController._tabBarController.collectionView"];
  [v2 axSafelyAddObject:v7];

  return v2;
}

@end