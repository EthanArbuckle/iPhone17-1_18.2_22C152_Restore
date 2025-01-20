@interface NowPlayingContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsVideo;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation NowPlayingContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.NowPlayingContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.NowPlayingContentView", @"accessibilityPlayerVideoLayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerLayer", @"isReadyForDisplay", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(NowPlayingContentViewAccessibility *)self accessibilityIdentifier];
  char v3 = [v2 isEqualToString:@"MiniPlayerArtworkNotVisible"];

  return v3 ^ 1;
}

- (BOOL)_axIsVideo
{
  v2 = [(NowPlayingContentViewAccessibility *)self safeValueForKey:@"accessibilityPlayerVideoLayer"];
  char v3 = [v2 safeBoolForKey:@"isReadyForDisplay"];

  return v3;
}

- (id)accessibilityLabel
{
  if ([(NowPlayingContentViewAccessibility *)self _axIsVideo]) {
    v2 = @"video.artwork";
  }
  else {
    v2 = @"album.artwork";
  }
  char v3 = accessibilityMusicLocalizedString(v2);

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)NowPlayingContentViewAccessibility;
  unint64_t v3 = [(NowPlayingContentViewAccessibility *)&v7 accessibilityTraits];
  BOOL v4 = [(NowPlayingContentViewAccessibility *)self _axIsVideo];
  uint64_t v5 = *MEMORY[0x263F1CF00];
  if (v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

@end