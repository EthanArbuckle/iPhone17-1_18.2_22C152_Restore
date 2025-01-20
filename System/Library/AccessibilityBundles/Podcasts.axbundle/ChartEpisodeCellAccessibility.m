@interface ChartEpisodeCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)automationElements;
@end

@implementation ChartEpisodeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.ChartEpisodeCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ChartEpisodeCell", @"accessibilityMoreButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ChartEpisodeCell", @"accessibilityInternalArtworkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ChartEpisodeCell", @"accessibilityOrdinalLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.DynamicContextMenuButton", @"accessibilityButton", "@", 0);
  [v3 validateClass:@"ShelfKitCollectionViews.ChartEpisodeCell" hasSwiftField:@"episodeInfoView" withSwiftType:"Optional<EpisodeInfoView>"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(ChartEpisodeCellAccessibility *)self safeValueForKey:@"accessibilityOrdinalLabel"];
  v5 = [(ChartEpisodeCellAccessibility *)self safeSwiftValueForKey:@"episodeInfoView"];
  [v3 axSafelyAddObject:v4];
  [v3 axSafelyAddObject:v5];
  v6 = MEMORY[0x24565B6E0](v3);

  return v6;
}

- (id)accessibilityCustomActions
{
  v16[1] = *MEMORY[0x263EF8340];
  v2 = [(ChartEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityMoreButton.accessibilityButton"];
  objc_initWeak(&location, v2);

  id v3 = objc_loadWeakRetained(&location);
  char v4 = [v3 _accessibilityViewIsVisible];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1C390]);
    v6 = accessibilityLocalizedString(@"more.button");
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __59__ChartEpisodeCellAccessibility_accessibilityCustomActions__block_invoke;
    v13 = &unk_265144210;
    objc_copyWeak(&v14, &location);
    v7 = (void *)[v5 initWithName:v6 actionHandler:&v10];
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

uint64_t __59__ChartEpisodeCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityShowContextMenuForElement:WeakRetained targetPointValue:0];

  return 1;
}

- (id)automationElements
{
  v12.receiver = self;
  v12.super_class = (Class)ChartEpisodeCellAccessibility;
  id v3 = [(ChartEpisodeCellAccessibility *)&v12 automationElements];
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
  v7 = v6;

  v8 = [(ChartEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityMoreButton.accessibilityButton"];
  [v7 axSafelyAddObject:v8];

  v9 = [(ChartEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityInternalArtworkView"];
  [v7 axSafelyAddObject:v9];

  uint64_t v10 = [(ChartEpisodeCellAccessibility *)self safeValueForKeyPath:@"accessibilityOrdinalLabel"];
  [v7 axSafelyAddObject:v10];

  return v7;
}

@end