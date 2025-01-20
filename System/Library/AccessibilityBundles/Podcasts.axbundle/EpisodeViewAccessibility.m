@interface EpisodeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityActivateShouldPerformPlayPause;
- (BOOL)_accessibilityPerformSummaryButton:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityLabelForPlaybackState:(BOOL)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axSummaryButton;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomContent;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (void)_axAddExtraButtonsToArray:(id)a3;
@end

@implementation EpisodeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.EpisodeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeView", @"accessibilityCaptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeView", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeView", @"accessibilitySummaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeView", @"accessibilityPlaybackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeView", @"accessibilitySummaryButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeView", @"accessibilityArtworkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeView", @"accessibilityDurationLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ArtworkView", @"accessibilityTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ArtworkContainer", @"accessibilityContextButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeView", @"accessibilityIsPlaying", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeView", @"accessibilityPerformPlayPauseAction", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(EpisodeViewAccessibility *)self safeBoolForKey:@"accessibilityIsPlaying"])
  {
    v20 = [(EpisodeViewAccessibility *)self _accessibilityLabelForPlaybackState:1];
  }
  else
  {
    v20 = 0;
  }
  v17 = [(EpisodeViewAccessibility *)self safeValueForKey:@"accessibilityArtworkView"];
  v19 = [v17 safeValueForKey:@"accessibilityTitle"];
  v16 = [(EpisodeViewAccessibility *)self safeValueForKey:@"accessibilityCaptionLabel"];
  v18 = [v16 accessibilityLabel];
  id v3 = [(EpisodeViewAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(EpisodeViewAccessibility *)self safeValueForKey:@"accessibilityDurationLabel"];
  v6 = [v5 accessibilityLabel];
  v7 = [(EpisodeViewAccessibility *)self safeValueForKey:@"accessibilityArtworkView"];
  int v8 = [v7 _accessibilityViewIsVisible];
  if (v8)
  {
    v15 = [(EpisodeViewAccessibility *)self safeValueForKey:@"accessibilityArtworkView"];
    v9 = [v15 accessibilityLabel];
  }
  else
  {
    v9 = 0;
  }
  v10 = [(EpisodeViewAccessibility *)self safeValueForKey:@"accessibilityPlaybackView"];
  v14 = [v10 accessibilityLabel];
  v11 = __UIAXStringForVariables();

  if (v8)
  {
  }
  v12 = accessibilityStripUnfavorableCharacters(v11);

  return v12;
}

- (id)accessibilityCustomContent
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(EpisodeViewAccessibility *)self safeValueForKey:@"accessibilitySummaryLabel"];
  v5 = [v4 accessibilityLabel];

  if ([v5 length])
  {
    v6 = (void *)MEMORY[0x263EFABD0];
    v7 = accessibilityLocalizedString(@"summary.title");
    int v8 = [v6 customContentWithLabel:v7 value:v5];

    [v3 addObject:v8];
  }

  return v3;
}

- (id)_accessibilityLabelForPlaybackState:(BOOL)a3
{
  if (a3) {
    id v3 = @"now.playing";
  }
  else {
    id v3 = @"paused";
  }
  v4 = accessibilityLocalizedString(v3);

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(EpisodeViewAccessibility *)self _accessibilityViewAncestorIsKindOf:MEMORY[0x24565B6C0](@"ShelfKitCollectionViews.EpisodeCollectionViewCell", a2)];

  id v3 = (unint64_t *)MEMORY[0x263F1CEE8];
  if (v2) {
    id v3 = (unint64_t *)MEMORY[0x263F1CF18];
  }
  return *v3;
}

- (BOOL)_accessibilityPerformSummaryButton:(id)a3
{
  id v3 = [(EpisodeViewAccessibility *)self _axSummaryButton];
  [v3 sendActionsForControlEvents:64];

  return 1;
}

- (id)_axSummaryButton
{
  objc_opt_class();
  id v3 = [(EpisodeViewAccessibility *)self safeValueForKey:@"accessibilitySummaryButton"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (id)accessibilityCustomActions
{
  int v3 = [(EpisodeViewAccessibility *)self safeBoolForKey:@"accessibilityIsPlaying"];
  v4 = (void *)MEMORY[0x263EFF980];
  v25.receiver = self;
  v25.super_class = (Class)EpisodeViewAccessibility;
  v5 = [(EpisodeViewAccessibility *)&v25 accessibilityCustomActions];
  v6 = [v4 arrayWithArray:v5];

  if (![(EpisodeViewAccessibility *)self _accessibilityActivateShouldPerformPlayPause])
  {
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    if (v3) {
      int v8 = @"AX_Pause";
    }
    else {
      int v8 = @"AX_Play";
    }
    v9 = accessibilityLocalizedString(v8);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __54__EpisodeViewAccessibility_accessibilityCustomActions__block_invoke;
    v24[3] = &unk_2651441C0;
    v24[4] = self;
    v10 = (void *)[v7 initWithName:v9 actionHandler:v24];

    [v6 addObject:v10];
  }
  v11 = [(EpisodeViewAccessibility *)self _axSummaryButton];
  if ([v11 _accessibilityViewIsVisible])
  {
    v12 = [v11 accessibilityLabel];
    if ([v12 length])
    {
      v13 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v12 target:self selector:sel__accessibilityPerformSummaryButton_];
      [v6 axSafelyAddObject:v13];
    }
  }
  LOBYTE(location) = 0;
  objc_opt_class();
  v14 = [(EpisodeViewAccessibility *)self safeUIViewForKey:@"accessibilityContextButton"];
  v15 = __UIAccessibilityCastAsClass();

  v16 = [v15 superview];

  if (v16)
  {
    objc_initWeak(&location, v15);
    id v17 = objc_alloc(MEMORY[0x263F1C390]);
    v18 = accessibilityLocalizedString(@"more.info");
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __54__EpisodeViewAccessibility_accessibilityCustomActions__block_invoke_3;
    v21[3] = &unk_265144210;
    objc_copyWeak(&v22, &location);
    v19 = (void *)[v17 initWithName:v18 actionHandler:v21];

    [v6 axSafelyAddObject:v19];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __54__EpisodeViewAccessibility_accessibilityCustomActions__block_invoke()
{
  return 1;
}

uint64_t __54__EpisodeViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityPerformPlayPauseAction];
}

uint64_t __54__EpisodeViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendActionsForControlEvents:64];

  return 1;
}

- (void)_axAddExtraButtonsToArray:(id)a3
{
  id v4 = a3;
  id v5 = [(EpisodeViewAccessibility *)self _axSummaryButton];
  [v4 axSafelyAddObject:v5];
}

- (id)automationElements
{
  v9.receiver = self;
  v9.super_class = (Class)EpisodeViewAccessibility;
  int v3 = [(EpisodeViewAccessibility *)&v9 automationElements];
  id v4 = (void *)[v3 mutableCopy];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  id v7 = v6;

  [(EpisodeViewAccessibility *)self _axAddExtraButtonsToArray:v7];

  return v7;
}

- (id)_accessibilitySupplementaryFooterViews
{
  int v3 = (void *)MEMORY[0x263EFF980];
  v7.receiver = self;
  v7.super_class = (Class)EpisodeViewAccessibility;
  id v4 = [(EpisodeViewAccessibility *)&v7 _accessibilitySupplementaryFooterViews];
  id v5 = [v3 arrayWithArray:v4];

  if (AXRequestingClient() == 5) {
    [(EpisodeViewAccessibility *)self _axAddExtraButtonsToArray:v5];
  }

  return v5;
}

- (BOOL)_accessibilityActivateShouldPerformPlayPause
{
  return 0;
}

@end