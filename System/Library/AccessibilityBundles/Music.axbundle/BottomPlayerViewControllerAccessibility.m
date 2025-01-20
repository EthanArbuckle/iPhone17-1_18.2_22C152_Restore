@interface BottomPlayerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)accessibilityUpdateMetadata;
- (void)setArtworkView:(id)a3;
- (void)viewDidLoad;
@end

@implementation BottomPlayerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Music.BottomPlayerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.BottomPlayerViewController", @"nowPlayingItemStackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.BottomPlayerViewController", @"nowPlayingItemRouteLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.BottomPlayerViewController", @"nowPlayingItemTitleLabel", "@", 0);
  [v3 validateClass:@"Music.BottomPlayerViewController" hasSwiftField:@"nowPlayingItemLargeTextTitleLabel" withSwiftType:"Optional<UILabel>"];
  [v3 validateClass:@"Music.BottomPlayerViewController" hasSwiftField:@"nowPlayingItemLargeTextMarqueeView" withSwiftType:"Optional<MPUMarqueeView>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.BottomPlayerViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.BottomPlayerViewController", @"skipButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.BottomPlayerViewController", @"reverseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.BottomPlayerViewController", @"playPauseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.BottomPlayerViewController", @"artworkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.BottomPlayerViewController", @"accessibilityUpdateMetadata", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.BottomPlayerViewController", @"accessibilityNowPlayingResponse", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponse", @"tracklist", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponse", @"state", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseTracklist", @"playingItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.BottomPlayerViewController", @"setArtworkView:", "v", "@", 0);
  [v3 validateClass:@"Music.NowPlayingShuffleButton"];
  [v3 validateClass:@"Music.NowPlayingRepeatButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_opt_class();
  id v3 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"nowPlayingItemStackView"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"nowPlayingItemRouteLabel"];
  v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v7 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"nowPlayingItemTitleLabel"];
  v8 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v9 = [(BottomPlayerViewControllerAccessibility *)self safeSwiftValueForKey:@"nowPlayingItemLargeTextTitleLabel"];
  v10 = __UIAccessibilityCastAsClass();

  char v74 = 0;
  objc_opt_class();
  v11 = [(BottomPlayerViewControllerAccessibility *)self safeSwiftValueForKey:@"nowPlayingItemLargeTextMarqueeView"];
  v12 = __UIAccessibilityCastAsClass();

  objc_msgSend(v12, "setIsAccessibilityElement:", objc_msgSend(v12, "isHidden") ^ 1);
  v13 = [v10 accessibilityLabel];
  v14 = __UIAXStringForVariables();
  objc_msgSend(v12, "setAccessibilityLabel:", v14, @"__AXStringForVariablesSentinel");

  [v12 setAccessibilityIdentifier:@"MiniPlayerNowPlayingSongTitleMarquee"];
  objc_msgSend(v4, "setIsAccessibilityElement:", objc_msgSend(v8, "isHidden") ^ 1);
  if ([v6 _accessibilityViewIsVisible])
  {
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v71[3] = &unk_26513BEA8;
    v15 = &v72;
    id v72 = v6;
    id v73 = v8;
    [v4 _setAccessibilityLabelBlock:v71];
  }
  else
  {
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v69[3] = &unk_26513BC20;
    v15 = &v70;
    id v70 = v8;
    [v4 _setAccessibilityLabelBlock:v69];
  }

  v16 = [v8 text];
  v53 = v8;
  if (v16)
  {
    BOOL v17 = 1;
  }
  else
  {
    v18 = [v10 text];
    BOOL v17 = v18 != 0;
  }
  v52 = v10;
  v54 = v6;

  v19 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"artworkView"];
  v20 = v19;
  if (v17) {
    v21 = @"MiniPlayerArtworkVisible";
  }
  else {
    v21 = @"MiniPlayerArtworkNotVisible";
  }
  [v19 setAccessibilityIdentifier:v21];
  uint64_t v22 = *MEMORY[0x263F1CEE8];
  [v20 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v51 = v4;
  [v4 setAccessibilityIdentifier:@"MiniPlayerNowPlayingSongTitleBar"];
  if (([v12 isHidden] & 1) == 0)
  {
    [v20 frame];
    double v24 = v23;
    [v12 frame];
    objc_msgSend(v12, "_accessibilitySetFrameExpansion:", 0.0, (v25 - v24) * -0.5);
  }
  v50 = v20;
  v26 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"accessibilityNowPlayingResponse"];
  char v74 = 0;
  objc_opt_class();
  v27 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"reverseButton"];
  v28 = __UIAccessibilityCastAsClass();

  if (v74) {
    goto LABEL_24;
  }
  objc_msgSend(v28, "setIsAccessibilityElement:", objc_msgSend(v28, "isHidden") ^ 1);
  if ([MEMORY[0x263F8C6D0] accessibilityIsSeekEnabledInDirection:2 forResponse:v26]) {
    [MEMORY[0x263F8C6D0] accessibilitySeekButtonStringInDirection:2 response:v26];
  }
  else {
  v49 = accessibilityMusicLocalizedString(@"button.prev.text");
  }
  [v28 setAccessibilityLabel:v49];
  [v28 setAccessibilityIdentifier:@"MiniPlayerPreviousTrack"];
  [v28 setAccessibilityTraits:v22];
  v29 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"playPauseButton"];
  [v29 setIsAccessibilityElement:v17];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v67[3] = &unk_26513BC20;
  id v30 = v26;
  id v68 = v30;
  [v29 _setAccessibilityLabelBlock:v67];
  [v29 setAccessibilityIdentifier:@"MiniPlayerPlayPauseButton"];
  v31 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"skipButton"];
  [v31 setIsAccessibilityElement:v17];
  if ([MEMORY[0x263F8C6D0] accessibilityIsSeekEnabledInDirection:1 forResponse:v30]) {
    [MEMORY[0x263F8C6D0] accessibilitySeekButtonStringInDirection:1 response:v30];
  }
  else {
  v32 = accessibilityMusicLocalizedString(@"button.next.text");
  }
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v65[3] = &unk_26513BC20;
  id v33 = v32;
  id v66 = v33;
  [v31 _setAccessibilityLabelBlock:v65];
  [v31 setAccessibilityIdentifier:@"MiniPlayerNextTrack"];
  [v31 setAccessibilityTraits:v22];
  char v74 = 0;
  objc_opt_class();
  v34 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"view"];
  v35 = __UIAccessibilityCastAsClass();

  if (v74) {
LABEL_24:
  }
    abort();
  v48 = v33;
  if (v17)
  {
    [v35 setAccessibilityContainerType:4];
    v36 = accessibilityMusicLocalizedString(@"titlesView.hint");
    [v35 setAccessibilityHint:v36];

    [v35 setAccessibilityIdentifier:@"MiniPlayerButton"];
  }
  else
  {
    [v35 setAccessibilityContainerType:0];
  }
  v37 = accessibilityMusicLocalizedString(@"mini.player");
  [v35 setAccessibilityLabel:v37];

  [v35 setAccessibilityIdentifier:@"MiniPlayer"];
  [v35 _accessibilitySetShouldHitTestFallBackToNearestChild:1];
  v38 = [v35 _accessibilityFindSubviewDescendant:&__block_literal_global_7];
  [v38 setAccessibilityIdentifier:@"MiniPlayerShuffle"];
  v39 = [v35 _accessibilityFindSubviewDescendant:&__block_literal_global_392];
  [v39 setAccessibilityIdentifier:@"MiniPlayerRepeat"];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v56[3] = &unk_26513BED0;
  id v57 = v50;
  id v58 = v51;
  id v59 = v12;
  id v60 = v38;
  id v61 = v28;
  id v62 = v29;
  id v63 = v31;
  id v64 = v39;
  id v40 = v39;
  id v41 = v31;
  id v47 = v29;
  id v42 = v28;
  id v43 = v38;
  id v44 = v12;
  id v45 = v51;
  id v46 = v50;
  [v35 _setAccessibilityElementsBlock:v56];
  v55.receiver = self;
  v55.super_class = (Class)BottomPlayerViewControllerAccessibility;
  [(BottomPlayerViewControllerAccessibility *)&v55 _accessibilityLoadAccessibilityInformation];
}

id __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accessibilityLabel];
  v5 = [*(id *)(a1 + 40) accessibilityLabel];
  id v3 = __UIAXStringForVariables();

  return v3;
}

id __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) accessibilityLabel];
  v2 = __UIAXStringForVariables();

  return v2;
}

uint64_t __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  return [MEMORY[0x263F8C6D0] accessibilityPlayPauseStopButtonString:*(void *)(a1 + 32)];
}

id __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245658030](@"Music.NowPlayingShuffleButton");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245658030](@"Music.NowPlayingRepeatButton");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(void *a1)
{
  return objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 8, a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11]);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BottomPlayerViewControllerAccessibility;
  [(BottomPlayerViewControllerAccessibility *)&v3 viewDidLoad];
  [(BottomPlayerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)accessibilityUpdateMetadata
{
  v3.receiver = self;
  v3.super_class = (Class)BottomPlayerViewControllerAccessibility;
  [(BottomPlayerViewControllerAccessibility *)&v3 accessibilityUpdateMetadata];
  [(BottomPlayerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setArtworkView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(BottomPlayerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  }
  else
  {
    char v8 = 0;
    objc_opt_class();
    v5 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"view"];
    v6 = __UIAccessibilityCastAsClass();

    [v6 setAccessibilityElements:MEMORY[0x263EFFA68]];
  }
  v7.receiver = self;
  v7.super_class = (Class)BottomPlayerViewControllerAccessibility;
  [(BottomPlayerViewControllerAccessibility *)&v7 setArtworkView:v4];
}

@end