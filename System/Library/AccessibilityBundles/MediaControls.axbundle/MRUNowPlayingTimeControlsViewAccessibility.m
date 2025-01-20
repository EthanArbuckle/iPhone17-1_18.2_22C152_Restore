@interface MRUNowPlayingTimeControlsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsTrackInfoEmpty;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityAdjustElapsedTime:(BOOL)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation MRUNowPlayingTimeControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUNowPlayingTimeControlsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingTimeControlsView", @"slider", "@", 0);
  [v3 validateClass:@"MRUSlider" isKindOfClass:@"UISlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingTimeControlsView", @"liveLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingTimeControlsView", @"accessibilityTotalDuration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingTimeControlsView", @"accessibilityElapsedDuration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingTimeControlsView", @"timeControls", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUTimeControls", @"isEnabled", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return ![(MRUNowPlayingTimeControlsViewAccessibility *)self _accessibilityIsTrackInfoEmpty];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"track.position.label");
}

- (id)accessibilityValue
{
  id v3 = [(MRUNowPlayingTimeControlsViewAccessibility *)self safeUIViewForKey:@"liveLabel"];
  if ([v3 isHidden])
  {
    [(MRUNowPlayingTimeControlsViewAccessibility *)self safeDoubleForKey:@"accessibilityTotalDuration"];
    v4 = AXDurationStringForDuration();
    [(MRUNowPlayingTimeControlsViewAccessibility *)self safeDoubleForKey:@"accessibilityElapsedDuration"];
    v5 = AXDurationStringForDuration();
    v6 = NSString;
    v7 = accessibilityLocalizedString(@"track.position.value");
    v8 = objc_msgSend(v6, "stringWithFormat:", v7, v5, v4);
  }
  else
  {
    v8 = [v3 accessibilityLabel];
  }

  return v8;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (void)_accessibilityAdjustElapsedTime:(BOOL)a3
{
  v4 = [(MRUNowPlayingTimeControlsViewAccessibility *)self safeValueForKey:@"timeControls"];
  [(MRUNowPlayingTimeControlsViewAccessibility *)self safeDoubleForKey:@"accessibilityElapsedDuration"];
  [(MRUNowPlayingTimeControlsViewAccessibility *)self safeDoubleForKey:@"accessibilityTotalDuration"];
  id v5 = v4;
  AXPerformSafeBlock();
}

uint64_t __78__MRUNowPlayingTimeControlsViewAccessibility__accessibilityAdjustElapsedTime___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setElapsedTime:*(double *)(a1 + 40)];
}

- (id)accessibilityIdentifier
{
  return @"TrackPosition";
}

- (BOOL)_accessibilityIsTrackInfoEmpty
{
  v2 = [(MRUNowPlayingTimeControlsViewAccessibility *)self safeValueForKey:@"timeControls"];
  char v3 = [v2 safeBoolForKey:@"isEnabled"] ^ 1;

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  char v3 = [(MRUNowPlayingTimeControlsViewAccessibility *)self safeValueForKey:@"slider"];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __88__MRUNowPlayingTimeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_265130558;
  objc_copyWeak(&v6, &location);
  [v3 setAccessibilityAttributedValueBlock:v5];
  v4.receiver = self;
  v4.super_class = (Class)MRUNowPlayingTimeControlsViewAccessibility;
  [(MRUNowPlayingTimeControlsViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __88__MRUNowPlayingTimeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained valueForKey:@"slider"];
  [v2 safeCGFloatForKey:@"value"];

  id v3 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v4 = AXDurationStringForDuration();
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_26F6FC380;
  }
  v7 = (void *)[v3 initWithString:v6];

  return v7;
}

@end