@interface VolumeSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityIncreaseVolume:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation VolumeSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.VolumeSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.VolumeSlider", @"accessibilityUpdateWithVolume:", "v", "f", 0);
  [v3 validateClass:@"MusicApplication.VolumeSlider" hasSwiftField:@"volumeController" withSwiftType:"MPVolumeController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPVolumeController", @"volumeValue", "f", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(@"volume.level.label");
}

- (id)accessibilityValue
{
  v2 = [(VolumeSliderAccessibility *)self safeSwiftValueForKey:@"volumeController"];
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
  id v3 = [(VolumeSliderAccessibility *)self safeSwiftValueForKey:@"volumeController"];
  [v3 safeFloatForKey:@"volumeValue"];
  AXPerformSafeBlock();
}

uint64_t __58__VolumeSliderAccessibility__accessibilityIncreaseVolume___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(a1 + 32) accessibilityUpdateWithVolume:a2];
}

- (BOOL)canBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)VolumeSliderAccessibility;
  unsigned __int8 v3 = [(VolumeSliderAccessibility *)&v5 canBecomeFocused];
  return [(VolumeSliderAccessibility *)self _accessibilityIsFKARunningForFocusItem] | v3;
}

@end