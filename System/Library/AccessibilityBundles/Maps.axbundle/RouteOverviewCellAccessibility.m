@interface RouteOverviewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_axAdvisoryViews;
- (id)_axTextForElement;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)artworkList;
- (id)automationElements;
- (id)tertiaryLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateLabels;
- (void)accessibilityElementDidBecomeFocused;
@end

@implementation RouteOverviewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RouteOverviewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_primaryLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RouteOverviewCell", @"detailsButton", "@", 0);
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_secondaryLabel" withType:"MapsThemeMultiPartLabel"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_routeDescriptionLabel" withType:"MapsThemeMultiPartLabel"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_tertiaryLabel" withType:"UILabel"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_elevationGraphView" withType:"DirectionsElevationGraphView"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_advisoriesView" withType:"RouteAdvisoriesView"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_goButton" withType:"MapsProgressButton"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_bookButton" withType:"BackgroundColorButton"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_stepsButton" withType:"UIButton"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_artworkList" withType:"TransitArtworkListView"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_detailsButton" withType:"UIButton"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_tertiaryLabelVisible" withType:"B"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_routeDescritptionLabelVisible" withType:"B"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_artworkListVisible" withType:"B"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_elevationGraphViewVisible" withType:"B"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_advisoriesViewVisible" withType:"B"];
  [v3 validateClass:@"RouteOverviewCell" hasInstanceVariable:@"_detailsButtonVisible" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RouteOverviewCell", @"artworkList", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RouteOverviewCell", @"tertiaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TransitArtworkListView", @"artworkData", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RouteOverviewCell", @"detailsButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RouteAdvisoryView", @"advisoryDetailPressed", "v", 0);
  [v3 validateProtocol:@"RouteOverviewCellDelegate" hasOptionalInstanceMethod:@"didTapDetailsButtonForRouteOverviewCell:"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  id v3 = objc_opt_new();
  v4 = [(RouteOverviewCellAccessibility *)self safeUIViewForKey:@"_goButton"];
  [v3 axSafelyAddObject:v4];
  if ([(RouteOverviewCellAccessibility *)self safeBoolForKey:@"_detailsButtonVisible"])
  {
    v5 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"detailsButton"];
    [v3 axSafelyAddObject:v5];
  }

  return v3;
}

- (id)accessibilityHint
{
  return AXMapsLocString(@"ROUTE_LIST_HINT");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)accessibilityActivate
{
  v2 = [(RouteOverviewCellAccessibility *)self valueForKey:@"delegate"];
  char v3 = objc_opt_respondsToSelector();
  if (v3)
  {
    id v5 = v2;
    AXPerformSafeBlock();
  }
  return v3 & 1;
}

uint64_t __55__RouteOverviewCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didTapDetailsButtonForRouteOverviewCell:*(void *)(a1 + 40)];
}

- (id)accessibilityCustomActions
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v22 = [MEMORY[0x263EFF980] array];
  char v3 = [(RouteOverviewCellAccessibility *)self _axAdvisoryViews];
  v20 = v3;
  v4 = v3;
  if (v3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v9 = [v8 safeValueForKey:@"actionHandler"];
          BOOL v10 = v9 == 0;

          if (!v10)
          {
            LOBYTE(location) = 0;
            objc_opt_class();
            v11 = [v8 safeValueForKey:@"_advisoryLabel"];
            v12 = __UIAccessibilityCastAsClass();

            if ((_BYTE)location) {
              abort();
            }
            v13 = NSString;
            v14 = AXMapsLocString(@"ROUTE_ADVISORY_BUTTON_DETAILS");
            v15 = [v12 text];
            v16 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v15);

            objc_initWeak(&location, v8);
            id v17 = objc_alloc(MEMORY[0x263F1C390]);
            v23[0] = MEMORY[0x263EF8330];
            v23[1] = 3221225472;
            v23[2] = __60__RouteOverviewCellAccessibility_accessibilityCustomActions__block_invoke;
            v23[3] = &unk_26512D700;
            objc_copyWeak(&v24, &location);
            v18 = (void *)[v17 initWithName:v16 actionHandler:v23];
            [v22 addObject:v18];

            objc_destroyWeak(&v24);
            objc_destroyWeak(&location);
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v5);
    }

    v4 = v20;
  }

  return v22;
}

uint64_t __60__RouteOverviewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __60__RouteOverviewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained advisoryDetailPressed];
}

- (void)accessibilityElementDidBecomeFocused
{
  v2 = [(RouteOverviewCellAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_8 startWithSelf:0];
  objc_opt_class();
  v4 = __UIAccessibilityCastAsSafeCategory();
  id v3 = v4;
  AXPerformSafeBlock();
}

uint64_t __70__RouteOverviewCellAccessibility_accessibilityElementDidBecomeFocused__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245653010](@"UIDropShadowView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__RouteOverviewCellAccessibility_accessibilityElementDidBecomeFocused__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axExpandCard];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)RouteOverviewCellAccessibility;
  [(RouteOverviewCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(RouteOverviewCellAccessibility *)self _axAnnotateLabels];
}

- (id)_axTextForElement
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  objc_super v3 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_primaryLabel"];
  v4 = [v3 accessibilityLabel];
  id v5 = AXMapsStringReplacingMiddleDots();
  uint64_t v6 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_secondaryLabel"];
  v7 = [v6 accessibilityLabel];
  v30 = AXMapsStringReplacingMiddleDots();
  v8 = __AXStringForVariables();

  if ([(RouteOverviewCellAccessibility *)self safeBoolForKey:@"_tertiaryLabelVisible", v30, @"__AXStringForVariablesSentinel"])
  {
    v9 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_tertiaryLabel"];
    BOOL v10 = [v9 accessibilityLabel];
    uint64_t v31 = AXMapsStringReplacingMiddleDots();
    v35 = @"__AXStringForVariablesSentinel";
    uint64_t v11 = __AXStringForVariables();

    v8 = (void *)v11;
  }
  if ([(RouteOverviewCellAccessibility *)self safeBoolForKey:@"_routeDescritptionLabelVisible", v31, v35])
  {
    v12 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_routeDescriptionLabel"];
    v13 = [v12 accessibilityLabel];
    v32 = AXMapsStringReplacingMiddleDots();
    v36 = @"__AXStringForVariablesSentinel";
    uint64_t v14 = __AXStringForVariables();

    v8 = (void *)v14;
  }
  if ([(RouteOverviewCellAccessibility *)self safeBoolForKey:@"_artworkListVisible", v32, v36])
  {
    char v61 = 0;
    objc_opt_class();
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__2;
    v59 = __Block_byref_object_dispose__2;
    id v60 = 0;
    uint64_t v49 = MEMORY[0x263EF8330];
    uint64_t v50 = 3221225472;
    v51 = __51__RouteOverviewCellAccessibility__axTextForElement__block_invoke;
    v52 = &unk_26512D868;
    v53 = self;
    v54 = &v55;
    AXPerformSafeBlock();
    id v15 = (id)v56[5];
    _Block_object_dispose(&v55, 8);

    v16 = __UIAccessibilityCastAsClass();

    if (v61) {
      abort();
    }
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__2;
    v59 = __Block_byref_object_dispose__2;
    id v60 = 0;
    uint64_t v43 = MEMORY[0x263EF8330];
    uint64_t v44 = 3221225472;
    v45 = __51__RouteOverviewCellAccessibility__axTextForElement__block_invoke_2;
    v46 = &unk_26512D868;
    v48 = &v55;
    id v47 = v16;
    AXPerformSafeBlock();
    id v17 = (id)v56[5];

    _Block_object_dispose(&v55, 8);
    id v33 = v17;
    v37 = @"__AXStringForVariablesSentinel";
    uint64_t v18 = __AXStringForVariables();

    v8 = (void *)v18;
  }
  v19 = [(RouteOverviewCellAccessibility *)self _axAdvisoryViews];
  v38 = v19;
  v20 = v19;
  if (v19)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = v19;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v62 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v40;
      do
      {
        uint64_t v24 = 0;
        v25 = v8;
        do
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v21);
          }
          long long v26 = *(void **)(*((void *)&v39 + 1) + 8 * v24);
          LOBYTE(v55) = 0;
          objc_opt_class();
          long long v27 = [v26 safeValueForKey:@"_advisoryLabel"];
          long long v28 = __UIAccessibilityCastAsClass();

          if ((_BYTE)v55) {
            abort();
          }
          v34 = [v28 text];
          v8 = __AXStringForVariables();

          ++v24;
          v25 = v8;
        }
        while (v22 != v24);
        uint64_t v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v62, 16, v34, @"__AXStringForVariablesSentinel");
      }
      while (v22);
    }

    v20 = v38;
  }

  return v8;
}

void __51__RouteOverviewCellAccessibility__axTextForElement__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"_artworkList"];
  uint64_t v2 = [v5 artworkData];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __51__RouteOverviewCellAccessibility__axTextForElement__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x263F41750] _accessibilityTransitArtworkTextForDataList:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

- (void)_axAnnotateLabels
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_primaryLabel"];
  id v5 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_secondaryLabel"];
  uint64_t v6 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_tertiaryLabel"];
  v7 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_artworkList"];
  v8 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 4, v4, v5, v6, v7);

  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setAccessibilityElementsHidden:1];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)_axAdvisoryViews
{
  v11[1] = *MEMORY[0x263EF8340];
  if ([(RouteOverviewCellAccessibility *)self safeBoolForKey:@"_advisoriesViewVisible"]&& ([(RouteOverviewCellAccessibility *)self safeValueForKey:@"_advisoriesView"], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    objc_opt_class();
    id v5 = [v4 safeValueForKey:@"advisoryStackView"];
    uint64_t v6 = __UIAccessibilityCastAsClass();

    v7 = [v6 arrangedSubviews];
    if ([v7 count])
    {
      uint64_t v8 = [v6 arrangedSubviews];
    }
    else
    {
      v11[0] = v4;
      uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    }
    uint64_t v9 = (void *)v8;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)tertiaryLabel
{
  v5.receiver = self;
  v5.super_class = (Class)RouteOverviewCellAccessibility;
  uint64_t v3 = [(RouteOverviewCellAccessibility *)&v5 tertiaryLabel];
  [(RouteOverviewCellAccessibility *)self _axAnnotateLabels];

  return v3;
}

- (id)artworkList
{
  v5.receiver = self;
  v5.super_class = (Class)RouteOverviewCellAccessibility;
  uint64_t v3 = [(RouteOverviewCellAccessibility *)&v5 artworkList];
  [(RouteOverviewCellAccessibility *)self _axAnnotateLabels];

  return v3;
}

- (id)automationElements
{
  uint64_t v3 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_primaryLabel"];
  [v3 setAccessibilityIdentifier:@"PrimaryLabel"];

  v4 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_secondaryLabel"];
  [v4 setAccessibilityIdentifier:@"SecondaryLabel"];

  if ([(RouteOverviewCellAccessibility *)self safeBoolForKey:@"_tertiaryLabelVisible"])
  {
    objc_super v5 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_tertiaryLabel"];
    [v5 setAccessibilityIdentifier:@"TertiaryLabel"];
  }
  if ([(RouteOverviewCellAccessibility *)self safeBoolForKey:@"_artworkListVisible"])
  {
    uint64_t v6 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_artworkList"];
    [v6 setAccessibilityIdentifier:@"ArtworkList"];
  }
  if ([(RouteOverviewCellAccessibility *)self safeBoolForKey:@"_elevationGraphViewVisible"])
  {
    v7 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_elevationGraphView"];
    [v7 setAccessibilityIdentifier:@"ElevationGraph"];
  }
  if ([(RouteOverviewCellAccessibility *)self safeBoolForKey:@"_advisoriesViewVisible"])
  {
    uint64_t v8 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_advisoriesView"];
    [v8 setAccessibilityIdentifier:@"AdvisoriesView"];
  }
  if ([(RouteOverviewCellAccessibility *)self safeIntegerForKey:@"_buttonVisibility"] == 1)
  {
    uint64_t v9 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_goButton"];
    [v9 setAccessibilityIdentifier:@"GoButton"];
  }
  if ([(RouteOverviewCellAccessibility *)self safeIntegerForKey:@"_buttonVisibility"] == 2)
  {
    uint64_t v10 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_bookButton"];
    [v10 setAccessibilityIdentifier:@"BookButton"];
  }
  if ([(RouteOverviewCellAccessibility *)self safeIntegerForKey:@"_buttonVisibility"] == 3)
  {
    uint64_t v11 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_stepsButton"];
    [v11 setAccessibilityIdentifier:@"StepsButton"];
  }
  if ([(RouteOverviewCellAccessibility *)self safeBoolForKey:@"_detailsButtonVisible"])
  {
    uint64_t v12 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_detailsButton"];
    [v12 setAccessibilityIdentifier:@"DetailsButton"];
  }
  v25 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v24 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_primaryLabel"];
  long long v13 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_secondaryLabel"];
  long long v14 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_tertiaryLabel"];
  long long v15 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_artworkList"];
  long long v16 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_detailsButton"];
  id v17 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_elevationGraphView"];
  uint64_t v18 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_advisoriesView"];
  v19 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_goButton"];
  v20 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_bookButton"];
  id v21 = [(RouteOverviewCellAccessibility *)self safeValueForKey:@"_stepsButton"];
  uint64_t v22 = objc_msgSend(v25, "axArrayByIgnoringNilElementsWithCount:", 10, v24, v13, v14, v15, v16, v17, v18, v19, v20, v21);

  return v22;
}

@end