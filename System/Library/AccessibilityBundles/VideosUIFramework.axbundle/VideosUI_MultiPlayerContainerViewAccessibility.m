@interface VideosUI_MultiPlayerContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)_axAVPlayer;
- (id)_axAllMultiviewContainers;
- (id)_axAllPlayerViewControls;
- (id)_axMultiView;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)removeFromSuperview;
@end

@implementation VideosUI_MultiPlayerContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.MultiPlayerContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.MultiPlayerContainerView" hasSwiftField:@"volumeIndicator" withSwiftType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.MultiPlayerContainerView", @"accessibilityNotifySnapshotRemoval", "v", 0);
  [v3 validateClass:@"VideosUI.MultiPlayerViewController"];
  [v3 validateClass:@"VideosUI.MultiPlayerContainerView" hasSwiftField:@"playerViewController" withSwiftType:"AVPlayerViewController"];
  [v3 validateClass:@"VideosUI.MultiPlayerViewController" hasSwiftField:@"playerView" withSwiftType:"MultiPlayerView"];
  [v3 validateClass:@"VideosUI.MultiPlayerView" hasSwiftField:@"containerViews" withSwiftType:"Array<MultiPlayerContainerView>"];
  [v3 validateClass:@"VideosUI.MultiPlayerViewController" hasSwiftField:@"isDetailsViewControllerVisible" withSwiftType:"Bool"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.MultiPlayerViewController", @"setDetailsViewControllerVisible:animated:completion:", "v", "B", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.MultiPlayerViewController", @"addPlayerViewController:animated:completion:", "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.MultiPlayerViewController", @"removePlayerViewController:animated:completion:", "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.MultiPlayerViewController", @"enterFullscreenWithPlayerViewController:completion:", "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.MultiPlayerViewController", @"replacePlayerViewController:atIndex:animated:completion:", "v", "@", "q", "B", "@?", 0);
  [v3 validateClass:@"VUIPlaybackManager"];
  [v3 validateClass:@"VideosUI.CardView"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"VUIPlaybackManager", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIPlaybackManager", @"_multiviewInfoForPlayerViewController:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIMultiviewPlaybackInfo", @"player", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVPPlaylist", @"currentMediaItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.CardView", @"accessibilityLabelViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUITextLayout", @"textStyle", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUILabel", @"textLayout", "@", 0);
}

- (id)_axMultiView
{
  objc_opt_class();
  id v3 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global startWithSelf:0];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (id)_axAVPlayer
{
  return (id)[(VideosUI_MultiPlayerContainerViewAccessibility *)self safeSwiftValueForKey:@"playerViewController"];
}

- (id)_axAllPlayerViewControls
{
  v2 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self _axMultiView];
  id v3 = [v2 _accessibilityViewController];

  v4 = [v3 safeSwiftValueForKey:@"playerView"];
  v5 = [v4 safeSwiftArrayForKey:@"containerViews"];
  v6 = objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_363);

  return v6;
}

- (id)_axAllMultiviewContainers
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 superview];

  v4 = [v3 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_366];

  return v4;
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  id v3 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self safeSwiftValueForKey:@"editView"];
  v4 = __UIAccessibilityCastAsClass();

  int v5 = [v4 _accessibilityViewIsVisible] ^ 1;
  return v5;
}

- (id)accessibilityValue
{
  id v3 = [MEMORY[0x263F089D8] string];
  objc_opt_class();
  v4 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self safeSwiftValueForKey:@"volumeIndicator"];
  int v5 = __UIAccessibilityCastAsClass();

  if (!v5)
  {
    int v5 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self _accessibilityDescendantOfType:objc_opt_class()];
  }
  if (([v5 isHidden] & 1) == 0)
  {
    [v5 alpha];
    if (v6 > 0.0)
    {
      v11 = accessibilityLocalizedString(@"sports.audio.current");
      v13 = @"__AXStringForVariablesSentinel";
      uint64_t v7 = __AXStringForVariables();

      id v3 = (void *)v7;
    }
  }
  v8 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self _axAllMultiviewContainers];
  if (![v8 indexOfObject:self])
  {
    v12 = accessibilityLocalizedString(@"multiview.status.prominent");
    uint64_t v9 = __AXStringForVariables();

    id v3 = (void *)v9;
  }

  return v3;
}

- (id)accessibilityLabel
{
  id v3 = objc_msgSend((id)MEMORY[0x245669780](@"VUIPlaybackManager", a2), "safeValueForKey:", @"sharedInstance");
  v4 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self _axAVPlayer];
  int v5 = [v3 _multiviewInfoForPlayerViewController:v4];

  double v6 = [v5 safeValueForKeyPath:@"player.currentMediaItem"];
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy_;
  v53 = __Block_byref_object_dispose_;
  id v54 = 0;
  v46[5] = MEMORY[0x263EF8330];
  v46[6] = 3221225472;
  v46[7] = __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke;
  v46[8] = &unk_265165E88;
  v48 = &v49;
  id v47 = v6;
  AXPerformSafeBlock();
  id v41 = v47;
  v42 = v5;
  id v7 = (id)v50[5];

  _Block_object_dispose(&v49, 8);
  uint64_t v8 = MEMORY[0x245669780](@"VideosUI.MultiViewPlayerHUDTemplateController");
  LOBYTE(v49) = 0;
  objc_opt_class();
  uint64_t v9 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self _axMultiView];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_2;
  v46[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v46[4] = v8;
  v10 = [v9 _accessibilityFindSubviewDescendant:v46];
  v11 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v49) {
    goto LABEL_16;
  }
  v12 = [v11 _accessibilityViewController];

  v13 = [v12 safeSwiftValueForKey:@"templateViewModel"];
  v14 = [v13 safeSwiftArrayForKey:@"children"];
  v15 = [v14 firstObject];

  v16 = [v15 safeSwiftArrayForKey:@"groups"];
  v17 = [v16 firstObject];

  v18 = [v17 safeSwiftArrayForKey:@"items"];
  if (![v18 count])
  {
    v29 = v7;
    v45.receiver = self;
    v45.super_class = (Class)VideosUI_MultiPlayerContainerViewAccessibility;
    v33 = [(VideosUI_MultiPlayerContainerViewAccessibility *)&v45 accessibilityLabel];
    goto LABEL_13;
  }
  v38 = v15;
  v39 = v13;
  v40 = v3;
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_3;
  v43[3] = &unk_265165ED0;
  id v44 = v7;
  v37 = objc_msgSend(v18, "ax_firstObjectUsingBlock:", v43);
  uint64_t v19 = objc_msgSend(v18, "indexOfObject:");
  uint64_t v20 = [MEMORY[0x263F088C8] indexPathForItem:v19 inSection:0];
  v21 = [v12 view];
  uint64_t v22 = [v21 _accessibilityFindSubviewDescendant:&__block_literal_global_410];

  LOBYTE(v49) = 0;
  objc_opt_class();
  v36 = (void *)v22;
  v23 = __UIAccessibilityCastAsClass();
  if ((_BYTE)v49) {
LABEL_16:
  }
    abort();
  v24 = v23;
  v35 = (void *)v20;
  v25 = [v23 cellForItemAtIndexPath:v20];
  v26 = [v25 _accessibilityFindSubviewDescendant:&__block_literal_global_416];
  v27 = [v26 safeArrayForKey:@"accessibilityLabelViews"];
  v28 = (void *)[v27 mutableCopy];

  if (![v28 count])
  {
LABEL_10:
    v29 = v7;
    v31 = [v26 accessibilityLabel];
    if (!v31) {
      goto LABEL_7;
    }
LABEL_11:
    id v32 = v31;
    v31 = v32;
    goto LABEL_12;
  }
  v29 = v7;
  [v28 sortUsingComparator:&__block_literal_global_422];
  v30 = [v28 firstObject];
  v31 = [v30 accessibilityLabel];

  if (![v31 length])
  {

    id v7 = v29;
    goto LABEL_10;
  }
  if (v31) {
    goto LABEL_11;
  }
LABEL_7:
  accessibilityLocalizedString(@"multiview.game.unknown");
  id v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v33 = v32;

  v13 = v39;
  id v3 = v40;
  v15 = v38;
LABEL_13:

  return v33;
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  v47.receiver = self;
  v47.super_class = (Class)VideosUI_MultiPlayerContainerViewAccessibility;
  v4 = [(VideosUI_MultiPlayerContainerViewAccessibility *)&v47 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  int v5 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self _axMultiView];
  double v6 = [v5 _accessibilityViewController];

  MEMORY[0x245669780](@"VideosUI.MultiPlayerViewController");
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    int v7 = [v6 safeSwiftBoolForKey:@"isDetailsViewControllerVisible"];
    id v8 = objc_alloc(MEMORY[0x263F1C390]);
    if (v7) {
      uint64_t v9 = @"multiview.addMoreGames.grabber.hide";
    }
    else {
      uint64_t v9 = @"multiview.addMoreGames.grabber.show";
    }
    v10 = accessibilityLocalizedString(v9);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke;
    v42[3] = &unk_265165F40;
    objc_copyWeak(&v43, &from);
    char v44 = v7;
    v11 = (void *)[v8 initWithName:v10 actionHandler:v42];

    [v3 axSafelyAddObject:v11];
    v12 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self _axAVPlayer];

    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x263F1C390]);
      v14 = accessibilityLocalizedString(@"multiview.removePlayer");
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_3;
      v39[3] = &unk_265165F90;
      objc_copyWeak(&v40, &from);
      objc_copyWeak(&v41, &location);
      uint64_t v15 = [v13 initWithName:v14 actionHandler:v39];

      [v3 axSafelyAddObject:v15];
      v30 = (void *)v15;
      id v16 = objc_alloc(MEMORY[0x263F1C390]);
      v17 = accessibilityLocalizedString(@"multiview.enterFullscreen");
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_5;
      v36[3] = &unk_265165F90;
      objc_copyWeak(&v37, &from);
      objc_copyWeak(&v38, &location);
      v18 = (void *)[v16 initWithName:v17 actionHandler:v36];

      [v3 axSafelyAddObject:v18];
      uint64_t v19 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self _axAllPlayerViewControls];
      uint64_t v20 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self _axAVPlayer];
      uint64_t v21 = [v19 indexOfObject:v20];

      if ([v19 count])
      {
        LOBYTE(v35) = 0;
        objc_opt_class();
        uint64_t v22 = [v19 objectAtIndexedSubscript:0];
        v23 = __UIAccessibilityCastAsClass();

        inited = objc_initWeak(&v35, v23);
        BOOL v25 = 0;
        if (v21)
        {
          if (v21 != 0x7FFFFFFFFFFFFFFFLL)
          {
            inited = [v23 view];
            BOOL v25 = inited != 0;
          }
          if (v21 != 0x7FFFFFFFFFFFFFFFLL) {
        }
          }
        if (v25)
        {
          id v29 = objc_alloc(MEMORY[0x263F1C390]);
          v26 = accessibilityLocalizedString(@"multiview.move.prominent");
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_7;
          v31[3] = &unk_265165FE0;
          objc_copyWeak(&v32, &location);
          objc_copyWeak(&v33, &from);
          objc_copyWeak(&v34, &v35);
          v27 = (void *)[v29 initWithName:v26 actionHandler:v31];

          [v3 axSafelyAddObject:v27];
          objc_destroyWeak(&v34);
          objc_destroyWeak(&v33);
          objc_destroyWeak(&v32);
        }
        objc_destroyWeak(&v35);
      }
      objc_destroyWeak(&v38);
      objc_destroyWeak(&v37);

      objc_destroyWeak(&v41);
      objc_destroyWeak(&v40);
    }

    objc_destroyWeak(&v43);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription
{
  return 1;
}

- (_NSRange)accessibilityRowRange
{
  v8.receiver = self;
  v8.super_class = (Class)VideosUI_MultiPlayerContainerViewAccessibility;
  [(VideosUI_MultiPlayerContainerViewAccessibility *)&v8 accessibilityRowRange];
  id v3 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self _axAllMultiviewContainers];
  uint64_t v4 = [v3 count];
  uint64_t v5 = [v3 indexOfObject:self];

  NSUInteger v6 = v5;
  NSUInteger v7 = v4;
  result.length = v7;
  result.id location = v6;
  return result;
}

- (void)removeFromSuperview
{
  id v3 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self accessibilityLabel];
  uint64_t v4 = [(VideosUI_MultiPlayerContainerViewAccessibility *)self _axAVPlayer];
  uint64_t v5 = [MEMORY[0x263F1C408] sharedApplication];
  NSUInteger v6 = [v5 connectedScenes];
  NSUInteger v7 = [v6 allObjects];
  objc_super v8 = objc_msgSend(v7, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_453);
  uint64_t v9 = [v8 lastObject];

  v16.receiver = self;
  v16.super_class = (Class)VideosUI_MultiPlayerContainerViewAccessibility;
  [(VideosUI_MultiPlayerContainerViewAccessibility *)&v16 removeFromSuperview];
  id v13 = v9;
  v14 = v4;
  uint64_t v15 = v3;
  id v10 = v3;
  id v11 = v4;
  id v12 = v9;
  AXPerformBlockOnMainThreadAfterDelay();
}

@end