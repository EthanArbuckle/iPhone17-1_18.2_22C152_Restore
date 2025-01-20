@interface VideosUI_CardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axDownloadButtonPressed:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityAttributedValue;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)automationElements;
- (int64_t)_axCompareStyle:(int64_t)a3 toStyle:(int64_t)a4;
- (unint64_t)_accessibilityDownloadState;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation VideosUI_CardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.CardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TVProgressView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.CardView", @"accessibilityLabelViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.CardView", @"accessibilityImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.CardView", @"accessibilityAppImageView", "@", 0);
  [v3 validateClass:@"VideosUI.CardView" hasProperty:@"accessibilityOverlayView" withType:"@"];
  [v3 validateClass:@"VUIBadgeViewWrapper" hasProperty:@"badgeElement" withType:"@"];
  [v3 validateClass:@"IKImageElement" hasProperty:@"url" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUITextLayout", @"textStyle", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUILabel", @"textLayout", "@", 0);
  [v3 validateClass:@"VUIPlaybackManager"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"VUIPlaybackManager", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIPlaybackManager", @"multiviewPlayerCount", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIPlaybackManager", @"maxMultiviewPlayerCount", "q", 0);
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasSwiftField:@"isLockupSelected" withSwiftType:"Bool"];
  [v3 validateClass:@"VUIDownloadButton"];
  [v3 validateClass:@"VideosUI.ContextMenuButton"];
  [v3 validateClass:@"VideosUI.CardCollectionViewCell"];
  [v3 validateClass:@"VideosUI.CardView" hasProperty:@"accessibilityButton" withType:"@"];
  [v3 validateClass:@"VUIDownloadButton" hasProperty:@"viewModel" withType:"@"];
  [v3 validateClass:@"VUIDownloadButtonViewModel" hasProperty:@"downloadState" withType:"Q"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)VideosUI_CardViewAccessibility;
  [(VideosUI_CardViewAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  id v3 = [(VideosUI_CardViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_2];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    uint64_t v7 = *MEMORY[0x263F1CF18];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setAccessibilityTraits:v7];
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)automationElements
{
  v8.receiver = self;
  v8.super_class = (Class)VideosUI_CardViewAccessibility;
  id v3 = [(VideosUI_CardViewAccessibility *)&v8 automationElements];
  uint64_t v4 = [v3 mutableCopy];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];

    if (!v5)
    {
      uint64_t v5 = [MEMORY[0x263EFF980] array];
    }
  }
  uint64_t v6 = [(VideosUI_CardViewAccessibility *)self safeValueForKey:@"accessibilityButton"];
  [v5 axSafelyAddObject:v6];

  return v5;
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(VideosUI_CardViewAccessibility *)self safeValueForKey:@"accessibilityButton"];
  MEMORY[0x245669780](@"VUIDownloadButton");
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(VideosUI_CardViewAccessibility *)self _accessibilityDownloadState];
    if (v5 > 4) {
      uint64_t v6 = @"download.button.stop.action";
    }
    else {
      uint64_t v6 = off_2651661A8[v5];
    }
    uint64_t v7 = accessibilityLocalizedString(v6);
    objc_super v8 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v7 target:self selector:sel__axDownloadButtonPressed_];
    [v3 axSafelyAddObject:v8];
  }
  MEMORY[0x245669780](@"VideosUI.ContextMenuButton");
  if (objc_opt_isKindOfClass())
  {
    long long v9 = accessibilityLocalizedString(@"tv.button.contextmenu");
    objc_initWeak(&location, v4);
    id v10 = objc_alloc(MEMORY[0x263F1C390]);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __60__VideosUI_CardViewAccessibility_accessibilityCustomActions__block_invoke;
    v28[3] = &unk_2651660B8;
    objc_copyWeak(&v29, &location);
    long long v11 = (void *)[v10 initWithName:v9 actionHandler:v28];
    [v3 axSafelyAddObject:v11];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  long long v12 = [(VideosUI_CardViewAccessibility *)self safeArrayForKey:@"accessibilityLabelViews"];
  objc_super v13 = [v12 lastObject];

  v14 = accessibilityLocalizedString(@"tv.details");
  uint64_t v15 = [(VideosUI_CardViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245669780](@"VideosUI.CardCollectionViewCell")];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [v13 accessibilityLabel];
    int v18 = [v17 isEqual:v14];

    if (v18)
    {
      v27.receiver = self;
      v27.super_class = (Class)VideosUI_CardViewAccessibility;
      [(VideosUI_CardViewAccessibility *)&v27 accessibilityActivationPoint];
      double v20 = v19;
      double v22 = v21;
      [(VideosUI_CardViewAccessibility *)self accessibilityFrame];
      double v24 = v22 + (v22 - v23) * 0.5;
      v25 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v14 actionHandler:&__block_literal_global_387];
      objc_msgSend(v25, "setActivationPoint:", v20, v24);
      [v3 axSafelyAddObject:v25];
    }
  }

  return v3;
}

- (BOOL)_axDownloadButtonPressed:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  unint64_t v5 = [(VideosUI_CardViewAccessibility *)self safeValueForKey:@"accessibilityButton"];
  uint64_t v6 = __UIAccessibilityCastAsClass();

  [v6 sendActionsForControlEvents:64];
  return 1;
}

- (unint64_t)_accessibilityDownloadState
{
  v2 = [(VideosUI_CardViewAccessibility *)self safeValueForKey:@"accessibilityButton"];
  id v3 = [v2 safeValueForKey:@"viewModel"];
  unint64_t v4 = [v3 safeIntegerForKey:@"downloadState"];

  return v4;
}

- (int64_t)_axCompareStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  if ((unint64_t)a3 > 0x12 || ((1 << a3) & 0x401C0) == 0) {
    goto LABEL_38;
  }
  int64_t result = 1;
  if ((unint64_t)a4 > 0x12 || ((1 << a4) & 0x401C0) == 0) {
    return result;
  }
  if (((1 << a3) & 0x401C0) == 0)
  {
LABEL_38:
    if ((unint64_t)a4 <= 0x12 && ((1 << a4) & 0x401C0) != 0) {
      return -1;
    }
    if ((unint64_t)a3 <= 5)
    {
      if ((unint64_t)a4 >= 6) {
        return 1;
      }
      goto LABEL_15;
    }
    if ((unint64_t)a4 < 6) {
      return -1;
    }
  }
  unint64_t v5 = a4 - 9;
  if ((unint64_t)(a3 - 9) <= 2)
  {
    if (v5 >= 3) {
      return 1;
    }
    goto LABEL_15;
  }
  if (v5 < 3) {
    return -1;
  }
LABEL_15:
  if (a3 == 20 || a3 == 14)
  {
    if (a4 != 14 && a4 != 20) {
      return -1;
    }
  }
  else
  {
    int64_t result = 1;
    if (a4 == 14 || a4 == 20) {
      return result;
    }
  }
  if (a3 != 19 && a3 != 13) {
    return a4 == 19 || a4 == 13;
  }
  uint64_t v7 = a4 != 19 && a4 != 13;
  return v7 << 63 >> 63;
}

- (id)accessibilityLabel
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = [(VideosUI_CardViewAccessibility *)self safeArrayForKey:@"accessibilityLabelViews"];
  unint64_t v4 = (void *)[v3 mutableCopy];

  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __52__VideosUI_CardViewAccessibility_accessibilityLabel__block_invoke;
  v51[3] = &unk_265166148;
  v51[4] = self;
  [v4 sortUsingComparator:v51];
  char v50 = 0;
  objc_opt_class();
  unint64_t v5 = [(VideosUI_CardViewAccessibility *)self safeValueForKey:@"accessibilityOverlayView"];
  uint64_t v6 = __UIAccessibilityCastAsClass();

  v39 = (void *)v6;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    long long v9 = 0;
    uint64_t v10 = *(void *)v47;
    do
    {
      uint64_t v11 = 0;
      long long v12 = v9;
      do
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(obj);
        }
        char v50 = 0;
        objc_opt_class();
        objc_super v13 = __UIAccessibilityCastAsClass();
        if (v50) {
          abort();
        }
        v14 = v13;
        v35 = [v13 accessibilityLabel];
        long long v9 = __UIAXStringForVariables();

        ++v11;
        long long v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16, v35, @"__AXStringForVariablesSentinel");
    }
    while (v8);
  }
  else
  {
    long long v9 = 0;
  }

  if ([v9 length])
  {
    uint64_t v15 = v39;
  }
  else
  {
    v16 = [(VideosUI_CardViewAccessibility *)self safeValueForKey:@"accessibilityImageView"];
    v17 = [(VideosUI_CardViewAccessibility *)self safeValueForKey:@"accessibilityAppImageView"];
    int v18 = [v16 accessibilityLabel];
    double v19 = [v17 accessibilityLabel];
    uint64_t v15 = v39;
    double v20 = [v39 safeValueForKey:@"titleLabel"];
    v37 = [v20 accessibilityLabel];
    v38 = @"__AXStringForVariablesSentinel";
    v34 = v18;
    v36 = v19;
    uint64_t v21 = __UIAXStringForVariables();

    long long v9 = (void *)v21;
  }
  MEMORY[0x245669780](@"VideosUI.UnifiedOverlayView");
  if (objc_opt_isKindOfClass())
  {
    v34 = [v15 accessibilityLabel];
    v36 = @"__AXStringForVariablesSentinel";
    uint64_t v22 = __UIAXStringForVariables();

    long long v9 = (void *)v22;
  }
  if (objc_opt_respondsToSelector())
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v40 = [v15 safeArrayForKey:@"badgeViewWrappers"];
    uint64_t v23 = [v40 countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v43 != v25) {
            objc_enumerationMutation(v40);
          }
          objc_super v27 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          v28 = objc_msgSend(MEMORY[0x263F22248], "sharedInstance", v34, v36, v37, v38);
          id v29 = [v27 safeValueForKeyPath:@"badgeElement.url"];
          v30 = [v28 accessibilityIdentifierForResourceURL:v29];

          if (([v30 isEqualToString:@"Badge-Play"] & 1) == 0)
          {
            v34 = v30;
            v36 = @"__AXStringForVariablesSentinel";
            uint64_t v31 = __UIAXStringForVariables();

            long long v9 = (void *)v31;
          }
        }
        uint64_t v24 = [v40 countByEnumeratingWithState:&v42 objects:v52 count:16];
      }
      while (v24);
    }

    uint64_t v15 = v39;
  }
  id v32 = v9;

  return v32;
}

- (id)accessibilityUserInputLabels
{
  id v3 = (void *)MEMORY[0x263EFF9C0];
  v10.receiver = self;
  v10.super_class = (Class)VideosUI_CardViewAccessibility;
  unint64_t v4 = [(VideosUI_CardViewAccessibility *)&v10 accessibilityUserInputLabels];
  unint64_t v5 = [v3 setWithArray:v4];

  uint64_t v6 = [(VideosUI_CardViewAccessibility *)self safeArrayForKey:@"accessibilityLabelViews"];
  uint64_t v7 = objc_msgSend(v6, "ax_filteredArrayUsingBlock:", &__block_literal_global_412);
  [v5 axSafelyAddObjectsFromArray:v7];

  uint64_t v8 = [v5 allObjects];

  return v8;
}

- (id)accessibilityAttributedValue
{
  v30[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089B8]);
  unint64_t v4 = [(VideosUI_CardViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_418];
  unint64_t v5 = [v4 firstObject];

  uint64_t v6 = [v5 accessibilityLabel];
  uint64_t v25 = [v5 accessibilityValue];
  uint64_t v7 = __UIAXStringForVariables();

  if (objc_msgSend(v7, "length", v25, @"__AXStringForVariablesSentinel")) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = &stru_26F829E60;
  }
  long long v9 = [(VideosUI_CardViewAccessibility *)self safeValueForKey:@"accessibilityButton"];
  MEMORY[0x245669780](@"VUIDownloadButton");
  if (objc_opt_isKindOfClass())
  {
    objc_super v10 = [v9 accessibilityLabel];
    objc_super v27 = [v9 accessibilityValue];
    uint64_t v11 = __UIAXStringForVariables();

    if (objc_msgSend(v11, "length", v27, @"__AXStringForVariablesSentinel"))
    {
      v26 = v11;
      v28 = @"__AXStringForVariablesSentinel";
      uint64_t v12 = __UIAXStringForVariables();

      uint64_t v8 = (__CFString *)v12;
    }
  }
  objc_super v13 = [(VideosUI_CardViewAccessibility *)self safeValueForKey:@"accessibilityOverlayView", v26, v28];
  v14 = [v13 safeValueForKey:@"textLabel"];
  uint64_t v15 = [v14 accessibilityLabel];

  if ([v15 length])
  {
    id v16 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v29 = *MEMORY[0x263F21730];
    v30[0] = MEMORY[0x263EFFA88];
    v17 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    int v18 = (void *)[v16 initWithString:v15 attributes:v17];

    double v19 = accessibilityLocalizedString(@"playback.time.remaining");
    double v20 = __UIAXStringForVariables();

    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263F089B8]), "initWithString:", v20, v8, @"__AXStringForVariablesSentinel");
    uint64_t v22 = [v20 rangeOfString:@"%@"];
    objc_msgSend(v21, "replaceCharactersInRange:withAttributedString:", v22, v23, v18);
    [v3 appendAttributedString:v21];
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v9.receiver = self;
  v9.super_class = (Class)VideosUI_CardViewAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(VideosUI_CardViewAccessibility *)&v9 accessibilityTraits];
  unint64_t v4 = [(VideosUI_CardViewAccessibility *)self safeValueForKey:@"accessibilityOverlayView"];
  int v5 = [v4 safeSwiftBoolForKey:@"isLockupSelected"];
  uint64_t v6 = *MEMORY[0x263F1CF38];
  if (!v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v3 | v6;

  return v7;
}

- (id)accessibilityHint
{
  uint64_t v3 = MEMORY[0x245669780](@"VideosUI.MultiViewPlayerHUDTemplateController", a2);
  char v13 = 0;
  objc_opt_class();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__VideosUI_CardViewAccessibility_accessibilityHint__block_invoke;
  v12[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v12[4] = v3;
  unint64_t v4 = [(VideosUI_CardViewAccessibility *)self _accessibilityFindViewAncestor:v12 startWithSelf:0];
  int v5 = __UIAccessibilityCastAsClass();

  if (v13) {
    abort();
  }
  uint64_t v6 = [v5 _accessibilityViewController];

  if (!v6) {
    goto LABEL_5;
  }
  unint64_t v7 = [(id)MEMORY[0x245669780](@"VUIPlaybackManager") safeValueForKey:@"sharedInstance"];
  uint64_t v8 = [v7 safeIntegerForKey:@"multiviewPlayerCount"];
  if (v8 < [v7 safeIntegerForKey:@"maxMultiviewPlayerCount"])
  {

LABEL_5:
    v11.receiver = self;
    v11.super_class = (Class)VideosUI_CardViewAccessibility;
    objc_super v9 = [(VideosUI_CardViewAccessibility *)&v11 accessibilityHint];
    goto LABEL_7;
  }
  objc_super v9 = accessibilityLocalizedString(@"multiview.hint.max.cells.reached");

LABEL_7:

  return v9;
}

@end