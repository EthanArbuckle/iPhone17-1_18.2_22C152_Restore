@interface MRUNowPlayingVolumeControlsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)volumeController;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityIncreaseVolume:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation MRUNowPlayingVolumeControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUNowPlayingVolumeControlsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MRUNowPlayingVolumeControlsView" hasInstanceVariable:@"_volumeController" withType:"MRUVolumeController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUVolumeController", @"volumeValue", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUVolumeController", @"setVolumeValue:", "v", "f", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"volume.slider.label");
}

- (id)accessibilityValue
{
  v2 = [(MRUNowPlayingVolumeControlsViewAccessibility *)self volumeController];
  [v2 safeFloatForKey:@"volumeValue"];
  id v3 = AXFormatFloatWithPercentage();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (void)_accessibilityIncreaseVolume:(BOOL)a3
{
  id v3 = [(MRUNowPlayingVolumeControlsViewAccessibility *)self volumeController];
  [v3 safeFloatForKey:@"volumeValue"];

  AXPerformSafeBlock();
}

void __77__MRUNowPlayingVolumeControlsViewAccessibility__accessibilityIncreaseVolume___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) volumeController];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 setVolumeValue:v2];
}

- (id)volumeController
{
  return (id)[(MRUNowPlayingVolumeControlsViewAccessibility *)self safeValueForKey:@"_volumeController"];
}

@end