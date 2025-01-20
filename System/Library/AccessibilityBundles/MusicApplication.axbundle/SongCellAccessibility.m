@interface SongCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isSongDownloaded;
- (BOOL)isAccessibilityElement;
- (id)_axPlaybackStateLabel;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SongCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.SongCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SongCell", @"accessibilityTrackNumberString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SongCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SongCell", @"artistName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SongCell", @"albumTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SongCell", @"duration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SongCell", @"accessibilityIsExplicit", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SongCell", @"isPopular", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SongCell", @"isDisabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SongCell", @"accessibilityIsVideoTrack", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.HorizontalLockupCollectionViewCell", @"wantsNowPlayingIndicator", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.HorizontalLockupCollectionViewCell", @"accessibilityLibraryStatusControl", "@", 0);
  [v3 validateClass:@"MusicApplication.SongCell" isKindOfClass:@"MusicApplication.HorizontalLockupCollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.HorizontalLockupCollectionViewCell", @"accessibilityMediaPickerAddButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
  [v3 validateSwiftEnum:@"MusicApplication.PlaybackIndicator[class].View"];
  [v3 validateSwiftEnum:@"MusicApplication.PlaybackIndicator[class].View" hasCase:@"liveWaveform" withSwiftType:"WaveformPlayIndicator"];
  [v3 validateSwiftEnum:@"MusicCoreUI.WaveformPlayIndicator[class].Mode"];
  [v3 validateClass:@"MusicCoreUI.WaveformPlayIndicator" hasSwiftField:@"mode" withSwiftType:"Mode"];
  [v3 validateClass:@"MusicApplication.HorizontalLockupCollectionViewCell" hasSwiftField:@"playbackIndicatorView" withSwiftType:"Optional<View>"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(SongCellAccessibility *)self safeValueForKey:@"accessibilityTrackNumberString"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  if ([(SongCellAccessibility *)self safeBoolForKey:@"accessibilityIsVideoTrack"])
  {
    v24 = accessibilityMusicLocalizedString(@"video.artwork");
  }
  else
  {
    v24 = 0;
  }
  objc_opt_class();
  v5 = [(SongCellAccessibility *)self safeValueForKey:@"title"];
  uint64_t v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v7 = [(SongCellAccessibility *)self safeValueForKey:@"artistName"];
  uint64_t v8 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v9 = [(SongCellAccessibility *)self safeValueForKey:@"albumTitle"];
  uint64_t v10 = __UIAccessibilityCastAsClass();

  v11 = (void *)v8;
  [(SongCellAccessibility *)self safeDoubleForKey:@"duration"];
  v12 = (void *)v6;
  if (v13 <= 0.00000011920929)
  {
    v14 = 0;
  }
  else
  {
    v14 = AXDurationStringForDuration();
  }
  v15 = (void *)v4;
  if ([(SongCellAccessibility *)self safeBoolForKey:@"accessibilityIsExplicit"])
  {
    v16 = accessibilityMusicLocalizedString(@"explicit");
  }
  else
  {
    v16 = 0;
  }
  if ([(SongCellAccessibility *)self safeBoolForKey:@"isPopular"])
  {
    v22 = accessibilityMusicLocalizedString(@"popular");
  }
  else
  {
    v22 = 0;
  }
  if ([(SongCellAccessibility *)self safeBoolForKey:@"isDisabled"])
  {
    v17 = accessibilityMusicLocalizedString(@"unavailable");
  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)v10;
  if ([(SongCellAccessibility *)self _isSongDownloaded])
  {
    v19 = accessibilityMusicLocalizedString(@"downloaded");
  }
  else
  {
    v19 = 0;
  }
  v21 = [(SongCellAccessibility *)self _axPlaybackStateLabel];
  __UIAXStringForVariables();
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)accessibilityUserInputLabels
{
  v2 = [(SongCellAccessibility *)self safeValueForKey:@"title"];
  id v3 = MEMORY[0x2456584E0]();

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(SongCellAccessibility *)self safeValueForKey:@"accessibilityLibraryStatusControl"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v10.receiver = self;
  v10.super_class = (Class)SongCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(SongCellAccessibility *)&v10 accessibilityTraits];
  uint64_t v4 = [(SongCellAccessibility *)self safeValueForKey:@"accessibilityMediaPickerAddButton"];
  int v5 = [v4 safeBoolForKey:@"selected"];

  uint64_t v6 = *MEMORY[0x263F1CF38];
  if (!v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v3 | v6;
  uint64_t v8 = [(SongCellAccessibility *)self safeUIViewForKey:@"accessibilityLibraryStatusControl"];
  if ([v8 _accessibilityViewIsVisible]) {
    v7 |= [v8 accessibilityTraits];
  }

  return v7;
}

- (BOOL)_isSongDownloaded
{
  v2 = [(SongCellAccessibility *)self _accessibilityFindDescendant:&__block_literal_global_12];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __42__SongCellAccessibility__isSongDownloaded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456584B0](@"MusicCoreUI.SymbolButton");
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    BOOL v3 = [v2 safeValueForKey:@"accessibilityImageView"];
    uint64_t v4 = __UIAccessibilityCastAsClass();

    int v5 = [v4 image];
    uint64_t v6 = [v5 imageAsset];
    unint64_t v7 = [v6 safeStringForKey:@"assetName"];

    uint64_t v8 = [v7 isEqualToString:@"arrow.down.circle.fill"];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_axPlaybackStateLabel
{
  id v2 = [(SongCellAccessibility *)self safeSwiftValueForKey:@"playbackIndicatorView"];
  BOOL v3 = [v2 safeSwiftEnumAssociatedObject];
  uint64_t v4 = [v3 safeSwiftValueForKey:@"mode"];
  int v5 = [v4 safeSwiftEnumCase];
  uint64_t v6 = @"paused";
  if ([v5 isEqualToString:@"paused"]) {
    goto LABEL_5;
  }
  if (([v5 isEqualToString:@"playing"] & 1) != 0
    || ([v5 isEqualToString:@"simulated"] & 1) != 0)
  {
    uint64_t v6 = @"now.playing";
LABEL_5:
    unint64_t v7 = accessibilityMusicLocalizedString(v6);
    goto LABEL_6;
  }
  uint64_t v6 = @"buffering";
  if ([v5 isEqualToString:@"buffering"]) {
    goto LABEL_5;
  }
  unint64_t v7 = 0;
LABEL_6:

  return v7;
}

@end