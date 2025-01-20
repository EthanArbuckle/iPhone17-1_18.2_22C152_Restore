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
  return @"MusicApplication.BottomPlayerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.BottomPlayerViewController", @"nowPlayingItemStackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.BottomPlayerViewController", @"nowPlayingItemRouteLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.BottomPlayerViewController", @"nowPlayingItemTitleLabel", "@", 0);
  [v3 validateClass:@"MusicApplication.BottomPlayerViewController" hasSwiftField:@"nowPlayingItemLargeTextTitleLabel" withSwiftType:"Optional<UILabel>"];
  [v3 validateClass:@"MusicApplication.BottomPlayerViewController" hasSwiftField:@"nowPlayingItemLargeTextMarqueeView" withSwiftType:"Optional<MPUMarqueeView>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.BottomPlayerViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.BottomPlayerViewController", @"skipButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.BottomPlayerViewController", @"reverseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.BottomPlayerViewController", @"playPauseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.BottomPlayerViewController", @"artworkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.BottomPlayerViewController", @"accessibilityUpdateMetadata", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.BottomPlayerViewController", @"accessibilityNowPlayingResponse", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.BottomPlayerViewController", @"sharedListeningParticipantsLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponse", @"tracklist", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponse", @"state", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseTracklist", @"playingItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.BottomPlayerViewController", @"setArtworkView:", "v", "@", 0);
  [v3 validateClass:@"MusicApplication.NowPlayingShuffleButton"];
  [v3 validateClass:@"MusicApplication.NowPlayingRepeatButton"];
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

  objc_opt_class();
  v11 = [(BottomPlayerViewControllerAccessibility *)self safeSwiftValueForKey:@"nowPlayingItemLargeTextMarqueeView"];
  v12 = __UIAccessibilityCastAsClass();

  char v78 = 0;
  objc_opt_class();
  v13 = [(BottomPlayerViewControllerAccessibility *)self safeSwiftValueForKey:@"sharedListeningParticipantsLabel"];
  v14 = __UIAccessibilityCastAsClass();

  objc_msgSend(v12, "setIsAccessibilityElement:", objc_msgSend(v12, "isHidden") ^ 1);
  v15 = [v10 accessibilityLabel];
  v16 = __UIAXStringForVariables();
  objc_msgSend(v12, "setAccessibilityLabel:", v16, @"__AXStringForVariablesSentinel");

  [v12 setAccessibilityIdentifier:@"MiniPlayerNowPlayingSongTitleMarquee"];
  objc_msgSend(v4, "setIsAccessibilityElement:", objc_msgSend(v8, "isHidden") ^ 1);
  if ([v6 _accessibilityViewIsVisible])
  {
    v74[0] = MEMORY[0x263EF8330];
    v74[1] = 3221225472;
    v74[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v74[3] = &unk_26513CDA0;
    v17 = &v75;
    id v75 = v14;
    id v76 = v6;
    id v77 = v8;
    [v4 _setAccessibilityLabelBlock:v74];
  }
  else
  {
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v72[3] = &unk_26513CDC8;
    v17 = &v73;
    id v73 = v8;
    [v4 _setAccessibilityLabelBlock:v72];
  }

  v18 = [v8 text];
  v55 = v10;
  if (v18)
  {
    BOOL v19 = 1;
  }
  else
  {
    v20 = [v10 text];
    BOOL v19 = v20 != 0;
  }
  v54 = v14;
  v56 = v8;
  v57 = v6;

  v21 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"artworkView"];
  v22 = v21;
  if (v19) {
    v23 = @"MiniPlayerArtworkVisible";
  }
  else {
    v23 = @"MiniPlayerArtworkNotVisible";
  }
  [v21 setAccessibilityIdentifier:v23];
  uint64_t v24 = *MEMORY[0x263F1CEE8];
  [v22 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  [v4 setAccessibilityIdentifier:@"MiniPlayerNowPlayingSongTitleBar"];
  if (([v12 isHidden] & 1) == 0)
  {
    [v22 frame];
    double v26 = v25;
    [v12 frame];
    objc_msgSend(v12, "_accessibilitySetFrameExpansion:", 0.0, (v27 - v26) * -0.5);
  }
  v53 = v22;
  v28 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"accessibilityNowPlayingResponse"];
  char v78 = 0;
  objc_opt_class();
  v29 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"reverseButton"];
  v30 = __UIAccessibilityCastAsClass();

  if (v78) {
    goto LABEL_24;
  }
  objc_msgSend(v30, "setIsAccessibilityElement:", objc_msgSend(v30, "isHidden") ^ 1);
  if ([MEMORY[0x263F8C6D0] accessibilityIsSeekEnabledInDirection:2 forResponse:v28]) {
    [MEMORY[0x263F8C6D0] accessibilitySeekButtonStringInDirection:2 response:v28];
  }
  else {
  v52 = accessibilityMusicLocalizedString(@"button.prev.text");
  }
  [v30 setAccessibilityLabel:v52];
  [v30 setAccessibilityIdentifier:@"MiniPlayerPreviousTrack"];
  [v30 setAccessibilityTraits:v24];
  v31 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"playPauseButton"];
  [v31 setIsAccessibilityElement:v19];
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v70[3] = &unk_26513CDC8;
  id v32 = v28;
  id v71 = v32;
  [v31 _setAccessibilityLabelBlock:v70];
  [v31 setAccessibilityIdentifier:@"MiniPlayerPlayPauseButton"];
  v33 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"skipButton"];
  [v33 setIsAccessibilityElement:v19];
  v51 = v32;
  if ([MEMORY[0x263F8C6D0] accessibilityIsSeekEnabledInDirection:1 forResponse:v32]) {
    [MEMORY[0x263F8C6D0] accessibilitySeekButtonStringInDirection:1 response:v32];
  }
  else {
  v34 = accessibilityMusicLocalizedString(@"button.next.text");
  }
  v35 = v4;
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v68[3] = &unk_26513CDC8;
  id v50 = v34;
  id v69 = v50;
  [v33 _setAccessibilityLabelBlock:v68];
  [v33 setAccessibilityIdentifier:@"MiniPlayerNextTrack"];
  [v33 setAccessibilityTraits:v24];
  char v78 = 0;
  objc_opt_class();
  v36 = [(BottomPlayerViewControllerAccessibility *)self safeValueForKey:@"view"];
  v37 = __UIAccessibilityCastAsClass();

  if (v78) {
LABEL_24:
  }
    abort();
  if (v19)
  {
    [v37 setAccessibilityContainerType:4];
    v38 = accessibilityMusicLocalizedString(@"titlesView.hint");
    [v37 setAccessibilityHint:v38];

    [v37 setAccessibilityIdentifier:@"MiniPlayerButton"];
  }
  else
  {
    [v37 setAccessibilityContainerType:0];
  }
  v39 = accessibilityMusicLocalizedString(@"mini.player");
  [v37 setAccessibilityLabel:v39];

  [v37 setAccessibilityIdentifier:@"MiniPlayer"];
  [v37 _accessibilitySetShouldHitTestFallBackToNearestChild:1];
  v40 = [v37 _accessibilityFindSubviewDescendant:&__block_literal_global_8];
  [v40 setAccessibilityIdentifier:@"MiniPlayerShuffle"];
  v41 = [v37 _accessibilityFindSubviewDescendant:&__block_literal_global_395];
  [v41 setAccessibilityIdentifier:@"MiniPlayerRepeat"];
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v59[3] = &unk_26513CDF0;
  id v60 = v53;
  id v61 = v35;
  id v62 = v12;
  id v63 = v40;
  id v64 = v30;
  id v65 = v31;
  id v66 = v33;
  id v67 = v41;
  id v42 = v41;
  id v43 = v33;
  id v49 = v31;
  id v44 = v30;
  id v45 = v40;
  id v46 = v12;
  id v47 = v35;
  id v48 = v53;
  [v37 _setAccessibilityElementsBlock:v59];
  v58.receiver = self;
  v58.super_class = (Class)BottomPlayerViewControllerAccessibility;
  [(BottomPlayerViewControllerAccessibility *)&v58 _accessibilityLoadAccessibilityInformation];
}

id __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  v2 = [a1[4] accessibilityLabel];
  id v3 = [a1[5] accessibilityLabel];
  v6 = [a1[6] accessibilityLabel];
  v4 = __UIAXStringForVariables();

  return v4;
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
  MEMORY[0x2456584B0](@"MusicApplication.NowPlayingShuffleButton");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456584B0](@"MusicApplication.NowPlayingRepeatButton");
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