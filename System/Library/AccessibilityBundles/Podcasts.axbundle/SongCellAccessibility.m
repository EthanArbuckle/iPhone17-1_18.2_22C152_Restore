@interface SongCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axPerformCustomAction:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityIndexPathForCell;
- (id)_accessibilityLabelForPlaybackState:(int64_t)a3;
- (id)_privateAccessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SongCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NowPlayingUI.SongCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.SongCell", @"accessibilityTrackNumberString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.SongCell", @"accessibilityTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.SongCell", @"accessibilityArtistName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.SongCell", @"accessibilityAlbumTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.SongCell", @"accessibilityDuration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.SongCell", @"accessibilityIsExplicit", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.SongCell", @"accessibilityIsPopular", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.SongCell", @"accessibilityIsAddButtonSelected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.SongCell", @"accessibilityIsVideoTrack", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.SongCell", @"accessibilityWantsNowPlayingIndicator", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.SongCell", @"accessibilityPlaybackState", "q", 0);
  [v3 validateClass:@"UICollectionViewTableCell" hasProperty:@"tableLayout" customGetter:@"_tableLayout" customSetter:0 withType:"@"];
  [v3 validateClass:@"NowPlayingUI.CompositeCollectionViewAwareTableCell"];
  [v3 validateClass:@"NowPlayingUI.SongCell" isKindOfClass:@"NowPlayingUI.CompositeCollectionViewAwareTableCell"];
  [v3 validateClass:@"NowPlayingUI.SongCell" isKindOfClass:@"UICollectionViewTableCell"];
  [v3 validateClass:@"NowPlayingUI.CompositeCollectionViewAwareTableCell" hasProperty:@"collectionView" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(SongCellAccessibility *)self safeValueForKey:@"accessibilityTrackNumberString"];
  v4 = __UIAccessibilityCastAsClass();

  if ([(SongCellAccessibility *)self safeBoolForKey:@"accessibilityIsVideoTrack"])
  {
    v5 = accessibilityLocalizedString(@"video.artwork");
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  v6 = [(SongCellAccessibility *)self safeValueForKey:@"accessibilityTitle"];
  v7 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v8 = [(SongCellAccessibility *)self safeValueForKey:@"accessibilityArtistName"];
  v9 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v10 = [(SongCellAccessibility *)self safeValueForKey:@"accessibilityAlbumTitle"];
  v11 = __UIAccessibilityCastAsClass();

  [(SongCellAccessibility *)self safeDoubleForKey:@"accessibilityDuration"];
  if (v12 <= 0.00000011920929)
  {
    v13 = 0;
  }
  else
  {
    v13 = AXDurationStringForDuration();
  }
  if ([(SongCellAccessibility *)self safeBoolForKey:@"accessibilityIsExplicit"])
  {
    v14 = accessibilityLocalizedString(@"explicit");
  }
  else
  {
    v14 = 0;
  }
  if ([(SongCellAccessibility *)self safeBoolForKey:@"accessibilityIsPopular"])
  {
    v15 = accessibilityLocalizedString(@"popular");
  }
  else
  {
    v15 = 0;
  }
  if ([(SongCellAccessibility *)self safeBoolForKey:@"accessibilityWantsNowPlayingIndicator"])uint64_t v16 = [(SongCellAccessibility *)self safeIntegerForKey:@"accessibilityPlaybackState"]; {
  else
  }
    uint64_t v16 = 0;
  v19 = [(SongCellAccessibility *)self _accessibilityLabelForPlaybackState:v16];
  v17 = __UIAXStringForVariables();

  return v17;
}

- (id)_accessibilityLabelForPlaybackState:(int64_t)a3
{
  if (a3 == 2)
  {
    v4 = @"paused";
LABEL_5:
    v5 = accessibilityLocalizedString(v4);
    return v5;
  }
  if (a3 == 1)
  {
    v4 = @"now.playing";
    goto LABEL_5;
  }
  v5 = 0;
  return v5;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)SongCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(SongCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(SongCellAccessibility *)self safeBoolForKey:@"accessibilityIsAddButtonSelected"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

- (BOOL)_axPerformCustomAction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  int v4 = [v3 _accessibilityValueForKey:@"AXSongCellActionKey"];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  if (v5)
  {
    id v7 = v5;
    AXPerformSafeBlock();
  }
  return 1;
}

void __48__SongCellAccessibility__axPerformCustomAction___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) handler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) handler];
    (*((void (**)(id, void, void, void *))v3 + 2))(v3, *(void *)(a1 + 32), *(void *)(a1 + 40), &__block_literal_global_3);
  }
}

- (id)_accessibilityIndexPathForCell
{
  objc_opt_class();
  id v3 = [(SongCellAccessibility *)self safeValueForKey:@"collectionView"];
  int v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  uint64_t v5 = __UIAccessibilityCastAsClass();
  v6 = [v4 indexPathForCell:v5];

  return v6;
}

- (id)_privateAccessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  int v4 = [(SongCellAccessibility *)self _accessibilityIndexPathForCell];
  objc_opt_class();
  uint64_t v5 = [(SongCellAccessibility *)self safeValueForKey:@"_tableLayout"];
  v6 = __UIAccessibilityCastAsClass();

  if (v6) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = [v6 contextualActionForDeletingRowAtIndexPath:v4];
    v9 = v8;
    if (v8)
    {
      v10 = [v8 title];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        id v12 = objc_alloc(MEMORY[0x263F1C390]);
        v13 = [v9 title];
        v14 = (void *)[v12 initWithName:v13 target:self selector:sel__axPerformCustomAction_];

        [v14 _accessibilitySetRetainedValue:v9 forKey:@"AXSongCellActionKey"];
        [v3 axSafelyAddObject:v14];
      }
    }
  }

  return v3;
}

@end