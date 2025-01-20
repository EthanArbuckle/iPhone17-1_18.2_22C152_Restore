@interface AudioTraitButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityLabelHelper;
- (unint64_t)accessibilityTraits;
@end

@implementation AudioTraitButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.AudioTraitButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateSwiftEnum:@"MusicApplication.AudioTrait"];
  [v3 validateClass:@"MusicNowPlayingControlsViewController" hasSwiftField:@"playingItemAudioTrait" withSwiftType:"Optional<AudioTrait>"];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(AudioTraitButtonAccessibility *)self _accessibilityLabelHelper];
  id v3 = v2;
  if (v2) {
    BOOL v4 = [v2 length] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  int v2 = [(AudioTraitButtonAccessibility *)self isUserInteractionEnabled];
  id v3 = (unint64_t *)MEMORY[0x263F1CEE8];
  if (!v2) {
    id v3 = (unint64_t *)MEMORY[0x263F1CF18];
  }
  return *v3;
}

- (id)_accessibilityLabelHelper
{
  v11.receiver = self;
  v11.super_class = (Class)AudioTraitButtonAccessibility;
  id v3 = [(AudioTraitButtonAccessibility *)&v11 accessibilityLabel];
  if (![v3 length])
  {
    BOOL v4 = [(AudioTraitButtonAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_0 startWithSelf:0];
    v5 = [v4 _accessibilityViewController];
    v6 = [v5 safeSwiftValueForKey:@"playingItemAudioTrait"];
    v7 = [v6 safeSwiftEnumCase];
    if ([v7 isEqualToString:@"dolbyAtmos"])
    {
      v8 = @"dolby.atmos";
    }
    else if ([v7 isEqualToString:@"dolbyAudio"])
    {
      v8 = @"dolby.audio";
    }
    else if ([v7 isEqualToString:@"highResolutionLossless"])
    {
      v8 = @"high.resolution.lossless";
    }
    else
    {
      v8 = @"lossless";
      if (([v7 isEqualToString:@"lossless"] & 1) == 0)
      {
        if (![v7 isEqualToString:@"appleDigitalMaster"])
        {
LABEL_12:

          goto LABEL_13;
        }
        v8 = @"apple.digital.master";
      }
    }
    uint64_t v9 = accessibilityOasisMusicLocalizedString(v8);

    id v3 = (void *)v9;
    goto LABEL_12;
  }
LABEL_13:

  return v3;
}

uint64_t __58__AudioTraitButtonAccessibility__accessibilityLabelHelper__block_invoke(uint64_t a1, void *a2)
{
  int v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456584B0](@"MusicNowPlayingControlsViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end