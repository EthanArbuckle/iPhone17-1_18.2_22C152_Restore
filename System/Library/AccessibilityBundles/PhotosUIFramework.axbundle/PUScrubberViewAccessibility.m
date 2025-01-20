@interface PUScrubberViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axDecrementForThreeFingerScroll;
- (BOOL)_axIncrementForThreeFingerScroll;
- (BOOL)_axIsVideoPlayerActivated;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)_axShowingType;
- (id)_axTileControllerForAsset:(id)a3;
- (id)_axVideoPlaybackValue;
- (id)_axVideoPlayer;
- (id)_axVideoSession;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axCloseVideoPlaybackAction;
- (void)_axScrollToAssetReference:(id)a3 inViewModel:(id)a4 forThreeFingerScroll:(BOOL)a5;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation PUScrubberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUScrubberView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUFilmstripTileViewController" isKindOfClass:@"PUImageTileViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUScrubberView", @"_tilingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUScrubberView", @"browsingSession", "@", 0);
  [v3 validateClass:@"PUScrubberView" hasInstanceVariable:@"_transitionLayoutIdentifier" withType:"NSString"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUScrubberView", @"_endScrubbing", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUScrubberView", @"_updateScrollPositionAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUViewModel", @"performChanges:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAssetViewModel", @"videoPlayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingViewModel", @"setCurrentAssetReference:transitionProgress:transitionDriverIdentifier:animated:", "v", "@", "d", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingViewModel", @"assetViewModelForAssetReference:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingViewModel", @"currentAssetReference", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingViewModel", @"assetsDataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingViewModel", @"leadingAssetReference", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingViewModel", @"trailingAssetReference", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTilingView", @"enumerateAllTileControllersUsingBlock:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTilingView", @"layout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTilingView", @"presentedTileControllerWithIndexPath: kind: dataSourceIdentifier:", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUScrubberTilingLayout", @"slitAspectRatio", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTileLayoutInfo", @"tileKind", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTileLayoutInfo", @"dataSourceIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTileLayoutInfo", @"indexPath", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAssetReference", @"asset", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAssetReference", @"indexPath", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingVideoPlayer", @"videoSession", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXVideoSession", @"currentTime", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXVideoSession", @"videoDuration", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingVideoPlayer", @"isActivated", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUImageTileViewController", @"asset", "@", 0);
  [v3 validateProtocol:@"PUDisplayAsset" hasRequiredInstanceMethod:@"mediaSubtypes"];
  [v3 validateClass:@"PUScrubberView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(PUScrubberViewAccessibility *)self _axIsVideoPlayerActivated])
  {
    id v3 = [(PUScrubberViewAccessibility *)self _axVideoPlayer];
    uint64_t v4 = [v3 safeIntegerForKey:@"desiredPlayState"];

    v5 = @"scrubber.playing";
    if (v4 == 2) {
      v5 = @"scrubber.paused";
    }
    v6 = v5;
    v7 = accessibilityPULocalizedString(@"video.playbackcontrol.label");
    v8 = accessibilityPULocalizedString(v6);

    uint64_t v9 = __UIAXStringForVariables();
  }
  else
  {
    v7 = [(PUScrubberViewAccessibility *)self _axShowingType];
    v10 = NSString;
    v8 = accessibilityPULocalizedString(@"photo.scrubber.label.format");
    uint64_t v9 = objc_msgSend(v10, "stringWithFormat:", v8, v7);
  }
  v11 = (void *)v9;

  return v11;
}

- (id)accessibilityHint
{
  if ([(PUScrubberViewAccessibility *)self _axIsVideoPlayerActivated])
  {
    id v3 = @"video.playbackcontrol.hint.expanded";
LABEL_5:
    v6 = accessibilityPULocalizedString(v3);
    goto LABEL_7;
  }
  uint64_t v4 = [(PUScrubberViewAccessibility *)self _accessibilityValueForKey:@"AXIsVideoOnlyScrubber"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v3 = @"video.playbackcontrol.hint.collapsed";
    goto LABEL_5;
  }
  v8.receiver = self;
  v8.super_class = (Class)PUScrubberViewAccessibility;
  v6 = [(PUScrubberViewAccessibility *)&v8 accessibilityHint];
LABEL_7:

  return v6;
}

- (id)accessibilityValue
{
  if ([(PUScrubberViewAccessibility *)self _axIsVideoPlayerActivated])
  {
    id v3 = [(PUScrubberViewAccessibility *)self _axVideoPlaybackValue];
  }
  else
  {
    uint64_t v4 = [(PUScrubberViewAccessibility *)self _axShowingType];
    int v5 = [(PUScrubberViewAccessibility *)self safeValueForKey:@"browsingSession"];
    id v3 = AXScrollStatusForBrowsingSession(v5, v4);
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)PUScrubberViewAccessibility;
  id v3 = [(PUScrubberViewAccessibility *)&v6 accessibilityTraits];
  if (![(PUScrubberViewAccessibility *)self _axIsVideoPlayerActivated])
  {
    v5.receiver = self;
    v5.super_class = (Class)PUScrubberViewAccessibility;
    return *MEMORY[0x263F1CED8] | [(PUScrubberViewAccessibility *)&v5 accessibilityTraits];
  }
  return (unint64_t)v3;
}

- (id)accessibilityCustomActions
{
  v8[1] = *MEMORY[0x263EF8340];
  if ([(PUScrubberViewAccessibility *)self _axIsVideoPlayerActivated])
  {
    id v3 = objc_alloc(MEMORY[0x263F1C390]);
    uint64_t v4 = accessibilityPULocalizedString(@"video.playbackcontrol.closeAction.name");
    objc_super v5 = (void *)[v3 initWithName:v4 target:self selector:sel__axCloseVideoPlaybackAction];

    v8[0] = v5;
    objc_super v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (void)accessibilityIncrement
{
  id v3 = [(PUScrubberViewAccessibility *)self safeValueForKey:@"browsingSession"];
  id v5 = [v3 safeValueForKey:@"viewModel"];

  uint64_t v4 = [v5 safeValueForKey:@"trailingAssetReference"];
  [(PUScrubberViewAccessibility *)self _axScrollToAssetReference:v4 inViewModel:v5 forThreeFingerScroll:0];
}

- (void)accessibilityDecrement
{
  id v3 = [(PUScrubberViewAccessibility *)self safeValueForKey:@"browsingSession"];
  id v5 = [v3 safeValueForKey:@"viewModel"];

  uint64_t v4 = [v5 safeValueForKey:@"leadingAssetReference"];
  [(PUScrubberViewAccessibility *)self _axScrollToAssetReference:v4 inViewModel:v5 forThreeFingerScroll:0];
}

- (BOOL)_axIncrementForThreeFingerScroll
{
  id v3 = [(PUScrubberViewAccessibility *)self safeValueForKey:@"browsingSession"];
  uint64_t v4 = [v3 safeValueForKey:@"viewModel"];

  id v5 = [v4 safeValueForKey:@"trailingAssetReference"];
  if (v5) {
    [(PUScrubberViewAccessibility *)self _axScrollToAssetReference:v5 inViewModel:v4 forThreeFingerScroll:1];
  }

  return v5 != 0;
}

- (BOOL)_axDecrementForThreeFingerScroll
{
  id v3 = [(PUScrubberViewAccessibility *)self safeValueForKey:@"browsingSession"];
  uint64_t v4 = [v3 safeValueForKey:@"viewModel"];

  id v5 = [v4 safeValueForKey:@"leadingAssetReference"];
  if (v5) {
    [(PUScrubberViewAccessibility *)self _axScrollToAssetReference:v5 inViewModel:v4 forThreeFingerScroll:1];
  }

  return v5 != 0;
}

- (void)_axCloseVideoPlaybackAction
{
  id v3 = [(PUScrubberViewAccessibility *)self safeValueForKey:@"browsingSession"];
  uint64_t v4 = [v3 safeValueForKey:@"viewModel"];

  id v5 = [v4 safeValueForKey:@"leadingAssetReference"];
  if (v5
    || ([v4 safeValueForKey:@"trailingAssetReference"],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__PUScrubberViewAccessibility__axCloseVideoPlaybackAction__block_invoke;
    v13[3] = &unk_2650A8130;
    id v6 = v4;
    id v14 = v6;
    v15 = self;
    v7 = (void (**)(void, void))MEMORY[0x2455E4760](v13);
    objc_super v8 = [v6 safeValueForKey:@"_currentAssetReference"];
    ((void (**)(void, void *))v7)[2](v7, v5);
    v11 = v8;
    v12 = v7;
    id v9 = v8;
    v10 = v7;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __58__PUScrubberViewAccessibility__axCloseVideoPlaybackAction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  AXPerformSafeBlock();
}

void __58__PUScrubberViewAccessibility__axCloseVideoPlaybackAction__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__PUScrubberViewAccessibility__axCloseVideoPlaybackAction__block_invoke_3;
  v5[3] = &unk_2650A8108;
  id v6 = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  [v6 performChanges:v5];
}

void __58__PUScrubberViewAccessibility__axCloseVideoPlaybackAction__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) safeValueForKey:@"_scrubbingIdentifier"];
  [v1 setCurrentAssetReference:v2 transitionProgress:v3 transitionDriverIdentifier:1 animated:0.0];
}

uint64_t __58__PUScrubberViewAccessibility__axCloseVideoPlaybackAction__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_axScrollToAssetReference:(id)a3 inViewModel:(id)a4 forThreeFingerScroll:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    id v17 = v9;
    id v18 = v8;
    AXPerformSafeBlock();
    v11 = [v18 safeValueForKey:@"asset"];
    v12 = [(PUScrubberViewAccessibility *)self accessibilityValue];
    v13 = [v11 accessibilityLabel];
    v16 = [v11 accessibilityValue];
    id v14 = __UIAXStringForVariables();

    v15 = (UIAccessibilityNotifications *)MEMORY[0x263F1CE30];
    if (!v5) {
      v15 = (UIAccessibilityNotifications *)MEMORY[0x263F1CE18];
    }
    UIAccessibilityPostNotification(*v15, v14);
  }
}

void __90__PUScrubberViewAccessibility__axScrollToAssetReference_inViewModel_forThreeFingerScroll___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __90__PUScrubberViewAccessibility__axScrollToAssetReference_inViewModel_forThreeFingerScroll___block_invoke_2;
  v5[3] = &unk_2650A8108;
  id v6 = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  [v6 performChanges:v5];
}

void __90__PUScrubberViewAccessibility__axScrollToAssetReference_inViewModel_forThreeFingerScroll___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) safeValueForKey:@"_scrubbingIdentifier"];
  [v1 setCurrentAssetReference:v2 transitionProgress:v3 transitionDriverIdentifier:1 animated:0.0];
}

- (id)_axVideoPlaybackValue
{
  [(PUScrubberViewAccessibility *)self _axVideoSession];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3810000000;
  v24 = &unk_2402616BD;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();

  _Block_object_dispose(&v21, 8);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3810000000;
  v24 = &unk_2402616BD;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v19 = MEMORY[0x263EF8330];
  id v2 = v20;
  AXPerformSafeBlock();

  _Block_object_dispose(&v21, 8);
  id v3 = UIAXTimeStringForDuration();
  uint64_t v4 = UIAXTimeStringForDuration();
  BOOL v5 = NSString;
  id v6 = accessibilityPULocalizedString(@"video.playbackcontrol.value.format");
  id v7 = objc_msgSend(v5, "stringWithFormat:", v6, v3, v4, v19, 3221225472, __52__PUScrubberViewAccessibility__axVideoPlaybackValue__block_invoke_2, &unk_2650A7CE8);

  uint64_t v8 = [v7 rangeOfString:v3];
  uint64_t v10 = v9;
  uint64_t v11 = [v7 rangeOfString:v4 options:4];
  if (v10) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    v16 = 0;
  }
  else
  {
    uint64_t v14 = v11;
    uint64_t v15 = v12;
    v16 = [MEMORY[0x263F21660] axAttributedStringWithString:v7];
    uint64_t v17 = MEMORY[0x263EFFA88];
    objc_msgSend(v16, "setAttribute:forKey:withRange:", MEMORY[0x263EFFA88], *MEMORY[0x263F21740], v8, v10);
    objc_msgSend(v16, "setAttribute:forKey:withRange:", v17, *MEMORY[0x263F21740], v14, v15);
  }

  return v16;
}

double __52__PUScrubberViewAccessibility__axVideoPlaybackValue__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) currentTime];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(void *)(v2 + 48) = v5;
  return result;
}

double __52__PUScrubberViewAccessibility__axVideoPlaybackValue__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) videoDuration];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(void *)(v2 + 48) = v5;
  return result;
}

- (id)_axTileControllerForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 safeValueForKey:@"indexPath"];
  id v6 = [v4 safeValueForKey:@"dataSourceIdentifier"];

  id v7 = [(PUScrubberViewAccessibility *)self safeValueForKey:@"_tilingView"];
  uint64_t v8 = [v7 presentedTileControllerWithIndexPath:v5 kind:@"PUTileKindItemContent" dataSourceIdentifier:v6];

  return v8;
}

- (id)_axShowingType
{
  id v3 = [(PUScrubberViewAccessibility *)self _accessibilityValueForKey:@"AXIsVideoOnlyScrubber"];
  if (!v3)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 1;
    id v4 = [(PUScrubberViewAccessibility *)self safeValueForKey:@"_tilingView"];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __45__PUScrubberViewAccessibility__axShowingType__block_invoke;
    v8[3] = &unk_2650A8180;
    v8[4] = &v9;
    [v4 enumerateAllTileControllersUsingBlock:v8];

    id v3 = [NSNumber numberWithBool:*((unsigned __int8 *)v10 + 24)];
    [(PUScrubberViewAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"AXIsVideoOnlyScrubber"];
    _Block_object_dispose(&v9, 8);
  }
  if ([v3 BOOLValue]) {
    uint64_t v5 = @"photo.scrubber.video";
  }
  else {
    uint64_t v5 = @"photo.scrubber.photo";
  }
  id v6 = accessibilityPULocalizedString(v5);

  return v6;
}

void __45__PUScrubberViewAccessibility__axShowingType__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  NSClassFromString(&cfstr_Pufilmstriptil.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v6 safeValueForKey:@"asset"];
    if ([v5 conformsToProtocol:&unk_26F449C68]
      && ([v5 safeUnsignedIntegerForKey:@"mediaSubtypes"] & 8) != 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      *a3 = 1;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (id)_axVideoPlayer
{
  uint64_t v2 = [(PUScrubberViewAccessibility *)self safeValueForKey:@"browsingSession"];
  id v3 = [v2 safeValueForKey:@"viewModel"];

  id v4 = [v3 safeValueForKey:@"currentAssetReference"];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  char v12 = __Block_byref_object_copy__6;
  BOOL v13 = __Block_byref_object_dispose__6;
  id v14 = 0;
  id v7 = v3;
  id v8 = v4;
  AXPerformSafeBlock();
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v5;
}

void __45__PUScrubberViewAccessibility__axVideoPlayer__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) assetViewModelForAssetReference:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 safeValueForKey:@"videoPlayer"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_axVideoSession
{
  uint64_t v2 = [(PUScrubberViewAccessibility *)self _axVideoPlayer];
  uint64_t v3 = [v2 safeValueForKey:@"videoSession"];

  return v3;
}

- (BOOL)_axIsVideoPlayerActivated
{
  uint64_t v2 = [(PUScrubberViewAccessibility *)self _axVideoPlayer];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 safeBoolForKey:@"isActivated"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)canBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)PUScrubberViewAccessibility;
  unsigned __int8 v3 = [(PUScrubberViewAccessibility *)&v5 canBecomeFocused];
  return [(PUScrubberViewAccessibility *)self _accessibilityIsFKARunningForFocusItem] | v3;
}

@end