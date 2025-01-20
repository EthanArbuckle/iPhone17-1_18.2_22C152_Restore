@interface VideosUI_LockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (id)specialCharacters;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityOverlayView;
- (id)_accessibilityStackingPosterView;
- (id)_accessibilityTextBadge:(id)a3;
- (id)_axAttributedLabelFromComponentsOfStackingPosterView:(id)a3 overlayView:(id)a4;
- (id)_axLabelFromComponentsOfStackingPosterView:(id)a3 overlayView:(id)a4;
- (id)accessibilityAttributedLabel;
- (id)accessibilityHint;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation VideosUI_LockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.LockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIStackingPosterView"];
  [v3 validateClass:@"VUIStackingPosterView" hasProperty:@"mainImageComponent" withType:"@"];
  [v3 validateClass:@"VUIStackingPosterView" hasProperty:@"components" withType:"@"];
  [v3 validateClass:@"VideosUI.LockupCollectionViewCell" hasSwiftField:@"stackingPosterView" withSwiftType:"VUIStackingPosterView"];
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasSwiftField:@"selectionView" withSwiftType:"Optional<VUIImageView>"];
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasSwiftField:@"isLockupSelected" withSwiftType:"Bool"];
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasSwiftField:@"scorecardView" withSwiftType:"Optional<_UIHostingView<ScoreboardImageWrapper>>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIBaseCollectionViewCell", @"vuiCollectionViewCellInteractor", "@", 0);
  [v3 validateClass:@"VideosUI.MultiViewPlayerHUDTemplateController"];
  [v3 validateClass:@"VideosUI.MultiPlayerViewController"];
  [v3 validateClass:@"VideosUI.PageSwipeUpView"];
}

+ (id)specialCharacters
{
  if (specialCharacters_onceToken != -1) {
    dispatch_once(&specialCharacters_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)specialCharacters_specialCharacters;

  return v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v9.receiver = self;
  v9.super_class = (Class)VideosUI_LockupCollectionViewCellAccessibility;
  unint64_t v3 = [(VideosUI_LockupCollectionViewCellAccessibility *)&v9 accessibilityTraits];
  v4 = [(VideosUI_LockupCollectionViewCellAccessibility *)self _accessibilityOverlayView];
  v5 = [v4 safeSwiftValueForKey:@"selectionView"];
  if (((v5 != 0) & [v4 safeSwiftBoolForKey:@"isLockupSelected"]) != 0) {
    uint64_t v6 = *MEMORY[0x263F1CF38];
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v6 | v3;

  return v7;
}

- (id)accessibilityAttributedLabel
{
  unint64_t v3 = [(VideosUI_LockupCollectionViewCellAccessibility *)self _accessibilityStackingPosterView];
  v4 = [(VideosUI_LockupCollectionViewCellAccessibility *)self _accessibilityOverlayView];
  v5 = [(VideosUI_LockupCollectionViewCellAccessibility *)self _axAttributedLabelFromComponentsOfStackingPosterView:v3 overlayView:v4];

  if (![v5 length])
  {
    v8.receiver = self;
    v8.super_class = (Class)VideosUI_LockupCollectionViewCellAccessibility;
    uint64_t v6 = [(VideosUI_LockupCollectionViewCellAccessibility *)&v8 accessibilityAttributedLabel];

    v5 = (void *)v6;
  }

  return v5;
}

- (id)accessibilityValue
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(VideosUI_LockupCollectionViewCellAccessibility *)self _accessibilityOverlayView];
  v4 = [(VideosUI_LockupCollectionViewCellAccessibility *)self _accessibilityStackingPosterView];
  v5 = [(VideosUI_LockupCollectionViewCellAccessibility *)self _axLabelFromComponentsOfStackingPosterView:v4 overlayView:v3];

  uint64_t v6 = [MEMORY[0x263EFF9B0] orderedSet];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unint64_t v7 = [(id)objc_opt_class() specialCharacters];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if ([v5 containsString:v12])
        {
          v13 = [(id)objc_opt_class() specialCharacters];
          v14 = [v13 objectForKey:v12];

          v15 = accessibilityLocalizedString(v14);
          [v6 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  v16 = [v3 accessibilityValue];
  if ([v16 length])
  {
    char v24 = 0;
    objc_opt_class();
    v17 = [(VideosUI_LockupCollectionViewCellAccessibility *)self safeValueForKey:@"vuiCollectionViewCellInteractor"];
    v18 = __UIAccessibilityCastAsClass();

    MEMORY[0x245669780](@"VideosUI.MultiViewPlayerHUDTemplateController");
    if (objc_opt_isKindOfClass())
    {
      v19 = accessibilityLocalizedString(@"multiview.selected.cell");
      [v6 addObject:v19];
    }
    else
    {
      [v6 addObject:v16];
    }
  }
  if ([v6 count])
  {
    v20 = [v6 array];
    v21 = [v20 componentsJoinedByString:@", "];
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)VideosUI_LockupCollectionViewCellAccessibility;
    v21 = [(VideosUI_LockupCollectionViewCellAccessibility *)&v23 accessibilityValue];
  }

  return v21;
}

- (id)accessibilityHint
{
  v4.receiver = self;
  v4.super_class = (Class)VideosUI_LockupCollectionViewCellAccessibility;
  v2 = [(VideosUI_LockupCollectionViewCellAccessibility *)&v4 accessibilityHint];

  return v2;
}

- (id)_accessibilityStackingPosterView
{
  v2 = [(VideosUI_LockupCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"stackingPosterView"];
  unint64_t v3 = AXLogAppAccessibility();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2426F3000, v3, OS_LOG_TYPE_DEFAULT, "stackingPosterView was found! It seems like AX accessnotes are working", buf, 2u);
    }

    id v5 = v2;
  }
  else
  {
    if (v4)
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_2426F3000, v3, OS_LOG_TYPE_DEFAULT, "stackingPosterView was nil. It seems like AX accessnotes are not working", v8, 2u);
    }

    objc_opt_class();
    uint64_t v6 = __UIAccessibilityCastAsClass();
    id v5 = [v6 _accessibilityFindSubviewDescendant:&__block_literal_global_341];
  }

  return v5;
}

- (id)_accessibilityOverlayView
{
  v2 = [(VideosUI_LockupCollectionViewCellAccessibility *)self _accessibilityStackingPosterView];
  unint64_t v3 = [v2 safeValueForKey:@"_mainImageComponent"];

  BOOL v4 = [v3 _accessibilityFindSubviewDescendant:&__block_literal_global_346];

  return v4;
}

- (id)_accessibilityTextBadge:(id)a3
{
  id v4 = a3;
  id v5 = [v4 safeUIViewForKey:@"accessibilityTextBadge"];
  if (!v5)
  {
    id v5 = [v4 safeSwiftValueForKey:@"textBadge"];
    if (!v5)
    {
      id v5 = [(VideosUI_LockupCollectionViewCellAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x245669780](@"VUITextBadgeView")];
    }
  }

  return v5;
}

- (id)_axLabelFromComponentsOfStackingPosterView:(id)a3 overlayView:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [MEMORY[0x263EFF9B0] orderedSet];
  uint64_t v8 = [v5 safeValueForKey:@"animatedLabel"];
  uint64_t v9 = [v8 accessibilityLabel];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 length]) {
    [v7 addObject:v9];
  }
  uint64_t v10 = [v5 safeValueForKey:@"mainImageComponent"];
  v11 = [v10 accessibilityLabel];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 length]) {
    [v7 addObject:v11];
  }
  [v5 safeArrayForKey:@"components"];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        v17 = v11;
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        v11 = [*(id *)(*((void *)&v43 + 1) + 8 * i) accessibilityLabel];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 length]) {
          [v7 addObject:v11];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v14);
  }

  v18 = [v6 safeValueForKey:@"accessibilityTitleLabel"];
  v19 = [v18 accessibilityLabel];

  if ([v19 length]) {
    [v7 addObject:v19];
  }
  v20 = [v6 safeValueForKey:@"accessibilitySubtitleLabel"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v20 length]) {
    [v7 addObject:v20];
  }
  v21 = [v6 safeUIViewForKey:@"accessibilityAppImageView"];
  v22 = [v21 accessibilityLabel];

  if ([v22 length]) {
    [v7 addObject:v22];
  }
  objc_super v23 = [v6 safeUIViewForKey:@"accessibilityLogoImageView"];
  char v24 = [v23 accessibilityLabel];

  if ([v24 length]) {
    [v7 addObject:v24];
  }
  long long v25 = [v6 safeValueForKey:@"accessibilityProgressView"];
  [v25 safeCGFloatForKey:@"accessibilityProgress"];
  double v27 = v26;

  if (v27 <= 0.01)
  {
    v31 = 0;
  }
  else
  {
    long long v28 = NSString;
    uint64_t v29 = accessibilityLocalizedString(@"content.percentage.complete");
    uint64_t v30 = AXFormatFloatWithPercentage();
    v31 = objc_msgSend(v28, "stringWithFormat:", v29, v30);

    char v24 = (void *)v29;
  }

  if ([v31 length]) {
    [v7 addObject:v31];
  }
  v32 = [v6 safeUIViewForKey:@"accessibilityBadgeView"];
  v33 = [v32 accessibilityLabel];

  if ([v33 length]) {
    [v7 addObject:v33];
  }
  v34 = [(VideosUI_LockupCollectionViewCellAccessibility *)self _accessibilityTextBadge:v6];
  v35 = [v34 accessibilityLabel];

  if ([v35 length]) {
    [v7 addObject:v35];
  }
  objc_opt_class();
  v36 = [v6 safeSwiftValueForKey:@"scorecardView"];
  v37 = __UIAccessibilityCastAsClass();

  v38 = [v37 accessibilityLabel];

  if ([v38 length]) {
    [v7 addObject:v38];
  }
  v39 = [v7 array];
  v40 = [v39 componentsJoinedByString:@", "];

  return v40;
}

- (id)_axAttributedLabelFromComponentsOfStackingPosterView:(id)a3 overlayView:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  unint64_t v7 = [(VideosUI_LockupCollectionViewCellAccessibility *)self _axLabelFromComponentsOfStackingPosterView:a3 overlayView:v6];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = objc_msgSend((id)objc_opt_class(), "specialCharacters", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v7;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v7 = [v13 stringByReplacingOccurrencesOfString:*(void *)(*((void *)&v22 + 1) + 8 * v12) withString:&stru_26F829E60];

        ++v12;
        uint64_t v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v10);
  }

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v7];
  uint64_t v15 = [v6 safeUIViewForKey:@"accessibilityLogoImageView"];
  v16 = [v15 accessibilityLabel];

  if (v16)
  {
    uint64_t v17 = [v7 rangeOfString:v16];
    uint64_t v19 = v18;
    uint64_t v26 = *MEMORY[0x263F1CEA0];
    uint64_t v27 = MEMORY[0x263EFFA88];
    v20 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    objc_msgSend(v14, "addAttributes:range:", v20, v17, v19);
  }

  return v14;
}

@end