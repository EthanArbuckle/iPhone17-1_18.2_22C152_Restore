@interface MultiShowEpisodeCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axPlayPauseButton;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomContent;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation MultiShowEpisodeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.MultiShowEpisodeCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.MultiShowEpisodeCell", @"accessibilityEpisodeInfoView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.MultiShowEpisodeCell", @"accessibilityPlayControlsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeInfoView", @"accessibilityDescriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeInfoView", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.PlayControlsStackView", @"accessibilityPlayPauseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.PlayControlsStackView", @"accessibilityNewPlayPauseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.PlayControlsStackView", @"accessibilityEpisodeStateControls", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeStateControlsStackView", @"accessibilityMoreButton", "@", 0);
  [v3 validateClass:@"ShelfKitCollectionViews.CachingArtworkView"];
  [v3 validateClass:@"ShelfKitCollectionViews.CachingArtworkView" isKindOfClass:@"ArtworkView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ArtworkView", @"accessibilityTitle", "@", 0);
  [v3 validateClass:@"ShelfKitCollectionViews.MultiShowEpisodeCell" hasSwiftField:@"internalArtworkView" withSwiftType:"Optional<CachingArtworkView>"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MultiShowEpisodeCellAccessibility *)self safeSwiftValueForKey:@"internalArtworkView"];
  v4 = [v3 safeValueForKey:@"accessibilityTitle"];
  v8 = [(MultiShowEpisodeCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityEpisodeInfoView, accessibilityPlayControlsView"];
  v5 = __UIAXStringForVariables();
  v6 = accessibilityStripUnfavorableCharacters(v5);

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MultiShowEpisodeCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(MultiShowEpisodeCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityCustomContent
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = [(MultiShowEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityEpisodeInfoView.accessibilityDescriptionLabel"];
  v5 = [v4 accessibilityLabel];

  if ([v5 length])
  {
    v6 = (void *)MEMORY[0x263EFABD0];
    v7 = accessibilityLocalizedString(@"summary.title");
    v8 = [v6 customContentWithLabel:v7 value:v5];

    [v3 axSafelyAddObject:v8];
  }

  return v3;
}

- (id)_axPlayPauseButton
{
  objc_super v3 = [(MultiShowEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityPlayControlsView.accessibilityNewPlayPauseButton"];
  uint64_t v4 = [(MultiShowEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityPlayControlsView.accessibilityPlayPauseButton"];
  v5 = (void *)v4;
  if (v3) {
    v6 = v3;
  }
  else {
    v6 = (void *)v4;
  }
  id v7 = v6;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__MultiShowEpisodeCellAccessibility__axPlayPauseButton__block_invoke;
  v9[3] = &unk_2651441E8;
  objc_copyWeak(&v10, &location);
  [v7 _setAccessibilityValueBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

id __55__MultiShowEpisodeCellAccessibility__axPlayPauseButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKeyPath:@"accessibilityEpisodeInfoView.accessibilityTitleLabel"];
  objc_super v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v7.receiver = self;
  v7.super_class = (Class)MultiShowEpisodeCellAccessibility;
  uint64_t v4 = [(MultiShowEpisodeCellAccessibility *)&v7 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(MultiShowEpisodeCellAccessibility *)self _axPlayPauseButton];
  if ([v5 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v5];
  }

  return v3;
}

- (id)accessibilityCustomActions
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [(MultiShowEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityPlayControlsView.accessibilityEpisodeStateControls.accessibilityMoreButton"];
  objc_initWeak(&location, v4);

  id v5 = objc_loadWeakRetained(&location);
  char v6 = [v5 _accessibilityViewIsVisible];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    v8 = accessibilityLocalizedString(@"more.button");
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __63__MultiShowEpisodeCellAccessibility_accessibilityCustomActions__block_invoke;
    v21[3] = &unk_265144210;
    objc_copyWeak(&v22, &location);
    v9 = (void *)[v7 initWithName:v8 actionHandler:v21];
    [v3 axSafelyAddObject:v9];

    objc_destroyWeak(&v22);
    objc_initWeak(&from, self);
    id v10 = objc_alloc(MEMORY[0x263F1C390]);
    v11 = accessibilityLocalizedString(@"show.context.menu");
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __63__MultiShowEpisodeCellAccessibility_accessibilityCustomActions__block_invoke_2;
    v18 = &unk_265144210;
    objc_copyWeak(&v19, &from);
    v12 = (void *)[v10 initWithName:v11 actionHandler:&v15];

    objc_msgSend(v3, "axSafelyAddObject:", v12, v15, v16, v17, v18);
    id v13 = v3;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&from);
  }
  else
  {
    id v13 = 0;
  }
  objc_destroyWeak(&location);

  return v13;
}

uint64_t __63__MultiShowEpisodeCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityShowContextMenuForElement:WeakRetained targetPointValue:0];

  return 1;
}

uint64_t __63__MultiShowEpisodeCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityShowContextMenuForElement:WeakRetained targetPointValue:0];

  return 1;
}

- (id)automationElements
{
  v11.receiver = self;
  v11.super_class = (Class)MultiShowEpisodeCellAccessibility;
  id v3 = [(MultiShowEpisodeCellAccessibility *)&v11 automationElements];
  uint64_t v4 = (void *)[v3 mutableCopy];
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

  v8 = [(MultiShowEpisodeCellAccessibility *)self _axPlayPauseButton];
  [v7 axSafelyAddObject:v8];

  v9 = [(MultiShowEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityPlayControlsView.accessibilityEpisodeStateControls.accessibilityMoreButton"];
  [v7 axSafelyAddObject:v9];

  return v7;
}

@end