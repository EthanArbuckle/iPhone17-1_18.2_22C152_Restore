@interface VocalsAttenuationSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation VocalsAttenuationSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicVocalsAttenuationSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MusicVocalsAttenuationSlider" isKindOfClass:@"MusicCoreUI.VerticalToggleSlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.VerticalToggleSlider", @"accessibilityToggleIsOn", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicVocalsAttenuationSlider", @"accessibilitySliderCurrentPercentageValue", "f", 0);
}

- (id)accessibilityValue
{
  char v3 = [(VocalsAttenuationSliderAccessibility *)self safeBoolForKey:@"accessibilityToggleIsOn"];
  [(VocalsAttenuationSliderAccessibility *)self safeFloatForKey:@"accessibilitySliderCurrentPercentageValue"];
  if (v3) {
    AXFormatFloatWithPercentage();
  }
  else {
  v4 = accessibilityMusicLocalizedString(@"vertical.toggle.slider.off");
  }

  return v4;
}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(@"vocal.volume.toggle");
}

@end