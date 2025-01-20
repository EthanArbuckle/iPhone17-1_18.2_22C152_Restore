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
  return @"NowPlayingUI.NowPlayingContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVPlayerViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerViewController", @"isReadyForDisplay", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(NowPlayingContentViewAccessibility *)self accessibilityIdentifier];
  char v3 = [v2 isEqualToString:@"MiniPlayerArtworkNotVisible"];

  return v3 ^ 1;
}

- (BOOL)_axIsVideo
{
  v2 = [(NowPlayingContentViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_2];
  char v3 = [v2 _accessibilityViewController];

  LOBYTE(v2) = [v3 safeBoolForKey:@"isReadyForDisplay"];
  return (char)v2;
}

uint64_t __48__NowPlayingContentViewAccessibility__axIsVideo__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x24565B6C0](@"AVPlayerViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  if ([(NowPlayingContentViewAccessibility *)self _axIsVideo]) {
    v2 = @"video.artwork";
  }
  else {
    v2 = @"album.artwork";
  }
  char v3 = accessibilityLocalizedString(v2);

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