@interface SingleShowEpisodeCellAccessibility
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

@implementation SingleShowEpisodeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.SingleShowEpisodeCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.SingleShowEpisodeCell", @"accessibilityEpisodeInfoView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.SingleShowEpisodeCell", @"accessibilityPlayControlsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeInfoView", @"accessibilityDescriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeInfoView", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.PlayControlsStackView", @"accessibilityPlayPauseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.PlayControlsStackView", @"accessibilityNewPlayPauseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.PlayControlsStackView", @"accessibilityEpisodeStateControls", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeStateControlsStackView", @"accessibilityMoreButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(SingleShowEpisodeCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityEpisodeInfoView, accessibilityPlayControlsView"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SingleShowEpisodeCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SingleShowEpisodeCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityCustomContent
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SingleShowEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityEpisodeInfoView.accessibilityDescriptionLabel"];
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
  objc_super v3 = [(SingleShowEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityPlayControlsView.accessibilityNewPlayPauseButton"];
  uint64_t v4 = [(SingleShowEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityPlayControlsView.accessibilityPlayPauseButton"];
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
  v9[2] = __56__SingleShowEpisodeCellAccessibility__axPlayPauseButton__block_invoke;
  v9[3] = &unk_2651441E8;
  objc_copyWeak(&v10, &location);
  [v7 _setAccessibilityValueBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

id __56__SingleShowEpisodeCellAccessibility__axPlayPauseButton__block_invoke(uint64_t a1)
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
  v7.super_class = (Class)SingleShowEpisodeCellAccessibility;
  uint64_t v4 = [(SingleShowEpisodeCellAccessibility *)&v7 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(SingleShowEpisodeCellAccessibility *)self _axPlayPauseButton];
  if ([v5 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v5];
  }

  return v3;
}

- (id)accessibilityCustomActions
{
  v16[1] = *MEMORY[0x263EF8340];
  v2 = [(SingleShowEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityPlayControlsView.accessibilityEpisodeStateControls.accessibilityMoreButton"];
  objc_initWeak(&location, v2);

  id v3 = objc_loadWeakRetained(&location);
  char v4 = [v3 _accessibilityViewIsVisible];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1C390]);
    v6 = accessibilityLocalizedString(@"more.button");
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __64__SingleShowEpisodeCellAccessibility_accessibilityCustomActions__block_invoke;
    v13 = &unk_265144210;
    objc_copyWeak(&v14, &location);
    objc_super v7 = (void *)[v5 initWithName:v6 actionHandler:&v10];
    v16[0] = v7;
    v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v16, 1, v10, v11, v12, v13);

    objc_destroyWeak(&v14);
  }
  else
  {
    v8 = 0;
  }
  objc_destroyWeak(&location);

  return v8;
}

uint64_t __64__SingleShowEpisodeCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityShowContextMenuForElement:WeakRetained targetPointValue:0];

  return 1;
}

- (id)automationElements
{
  v11.receiver = self;
  v11.super_class = (Class)SingleShowEpisodeCellAccessibility;
  id v3 = [(SingleShowEpisodeCellAccessibility *)&v11 automationElements];
  char v4 = (void *)[v3 mutableCopy];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  objc_super v7 = v6;

  v8 = [(SingleShowEpisodeCellAccessibility *)self _axPlayPauseButton];
  [v7 axSafelyAddObject:v8];

  v9 = [(SingleShowEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityPlayControlsView.accessibilityEpisodeStateControls.accessibilityMoreButton"];
  [v7 axSafelyAddObject:v9];

  return v7;
}

@end