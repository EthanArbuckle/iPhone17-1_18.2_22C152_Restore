@interface LockScreenPosterCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityViewIsModal;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axCollectionView;
- (id)_axHeaderLabel;
- (id)_axWallpaperWidgetsNames;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation LockScreenPosterCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.LockScreenPosterCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PosterBoard.LockScreenPosterCollectionViewCell" isKindOfClass:@"PosterCollectionViewCell"];
  [v3 validateClass:@"PosterBoard.LockScreenPosterCollectionViewCell" isKindOfClass:@"PosterPairCollectionViewCell"];
  [v3 validateClass:@"PosterBoard.PosterSectionHeaderView"];
  [v3 validateClass:@"PosterBoard.PosterSectionHeaderView" hasSwiftField:@"title" withSwiftType:"Optional<String>"];
  [v3 validateClass:@"UIWindow" hasInstanceVariable:@"_delegateViewController" withType:"UIViewController"];
  [v3 validateClass:@"UICollectionViewController" hasProperty:@"collectionView" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PosterBoard.PosterRackCollectionViewController", @"posterSectionRemovalView:didRequestRemovalOfPosterWithID:", "v", "@", "@", 0);
  [v3 validateClass:@"PosterBoard.PosterPairCollectionViewCell" hasSwiftFieldOfAnyClass:@"posterPair"];
  [v3 validateClass:@"PosterBoard.PosterPair" hasSwiftField:@"id" withSwiftType:"String"];
  [v3 validateClass:@"PosterBoard.LockScreenPosterCollectionViewCell" hasSwiftFieldOfAnyClass:@"focusButton"];
  [v3 validateClass:@"CHSWidgetDescriptor" hasProperty:@"displayName" withType:"@"];
  [v3 validateClass:@"PosterBoard.LockScreenPosterCollectionViewCell" hasSwiftFieldOfAnyClass:@"prominentController"];
  [v3 validateClass:@"PosterBoard.LockScreenPosterCollectionViewCell" hasSwiftFieldOfAnyClass:@"widgetSidebarProminentController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSProminentDisplayViewController", @"subtitleComplicationViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRInlineComplicationSnapshotViewController", @"complicationDescriptor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSProminentDisplayViewController", @"complicationContainerViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSProminentDisplayViewController", @"complicationSidebarViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRWidgetGridViewController", @"model", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRWidgetGridModel", @"complicationDescriptors", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRComplicationDescriptor", @"widgetDescriptor", "@", 0);
  [v3 validateClass:@"PosterBoard.PosterSectionRemovalView"];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  uint64_t v4 = AXLayoutMode(v3);

  if (v4 == 3) {
    accessibilityLocalizedString(@"lock.screen.poster.cell.customize.label");
  }
  else {
  v5 = [(LockScreenPosterCollectionViewCellAccessibility *)self _axHeaderLabel];
  }

  return v5;
}

- (id)accessibilityHint
{
  char v8 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  uint64_t v4 = AXLayoutMode(v3);

  if (v4 == 3)
  {
    v7.receiver = self;
    v7.super_class = (Class)LockScreenPosterCollectionViewCellAccessibility;
    v5 = [(LockScreenPosterCollectionViewCellAccessibility *)&v7 accessibilityHint];
  }
  else
  {
    v5 = accessibilityLocalizedString(@"lock.screen.poster.collection.view.cell.hint");
  }

  return v5;
}

- (BOOL)isAccessibilityElement
{
  char v7 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  uint64_t v4 = AXLayoutMode(v3);

  if (v4 == 3) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)LockScreenPosterCollectionViewCellAccessibility;
  return [(LockScreenPosterCollectionViewCellAccessibility *)&v6 isAccessibilityElement];
}

- (BOOL)accessibilityViewIsModal
{
  return ![(LockScreenPosterCollectionViewCellAccessibility *)self isAccessibilityElement];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(LockScreenPosterCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"focusButton"];
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)LockScreenPosterCollectionViewCellAccessibility;
    uint64_t v5 = [(LockScreenPosterCollectionViewCellAccessibility *)&v8 _accessibilitySupplementaryFooterViews];
  }
  objc_super v6 = (void *)v5;

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)LockScreenPosterCollectionViewCellAccessibility;
  [(LockScreenPosterCollectionViewCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  uint64_t v3 = [(LockScreenPosterCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"focusButton"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  [v4 accessibilitySetIdentification:@"poster.switcher.focus.button"];
}

- (id)accessibilityCustomActions
{
  objc_opt_class();
  uint64_t v3 = __UIAccessibilityCastAsClass();
  uint64_t v4 = AXCollectionViewController(v3);

  objc_super v5 = [(LockScreenPosterCollectionViewCellAccessibility *)self _axCollectionView];
  LOBYTE(location) = 0;
  objc_opt_class();
  objc_super v6 = __UIAccessibilityCastAsClass();
  if (AXLayoutMode(v6) == 3)
  {
    v25.receiver = self;
    v25.super_class = (Class)LockScreenPosterCollectionViewCellAccessibility;
    [(LockScreenPosterCollectionViewCellAccessibility *)&v25 accessibilityCustomActions];
  }
  else
  {
    if (AXLockScreenPostersCount(v5) >= 2 && AXLayoutMode(v6) == 1)
    {
      if (AXDeviceIsPad())
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __77__LockScreenPosterCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
        v22[3] = &unk_265145570;
        id v23 = v6;
        char v7 = [v5 _accessibilityFindSubviewDescendant:v22];
      }
      else
      {
        char v7 = 0;
      }
      objc_initWeak(&location, self);
      id v10 = objc_alloc(MEMORY[0x263F823A0]);
      v11 = accessibilityLocalizedString(@"lock.screen.poster.cell.delete.label");
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __77__LockScreenPosterCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2;
      v17 = &unk_2651455C0;
      id v18 = v4;
      id v12 = v7;
      id v19 = v12;
      objc_copyWeak(&v20, &location);
      v13 = (void *)[v10 initWithName:v11 actionHandler:&v14];

      objc_super v8 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v13, v14, v15, v16, v17);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);

      goto LABEL_9;
    }
    v24.receiver = self;
    v24.super_class = (Class)LockScreenPosterCollectionViewCellAccessibility;
    [(LockScreenPosterCollectionViewCellAccessibility *)&v24 accessibilityCustomActions];
  objc_super v8 = };
LABEL_9:

  return v8;
}

BOOL __77__LockScreenPosterCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  MEMORY[0x24565BD30](@"PosterBoard.PosterSectionRemovalView");
  BOOL v7 = 0;
  if (objc_opt_isKindOfClass())
  {
    [v3 frame];
    double v5 = v4;
    [*(id *)(a1 + 32) frame];
    if (v5 == v6) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

uint64_t __77__LockScreenPosterCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1[4];
  id v6 = a1[5];
  objc_copyWeak(&v7, a1 + 6);
  AXPerformSafeBlock();
  objc_destroyWeak(&v7);

  return 1;
}

void __77__LockScreenPosterCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained safeSwiftValueForKey:@"posterPair"];
  double v4 = [v3 safeSwiftStringForKey:@"id"];
  [v1 posterSectionRemovalView:v2 didRequestRemovalOfPosterWithID:v4];
}

- (id)_axHeaderLabel
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(LockScreenPosterCollectionViewCellAccessibility *)self _axCollectionView];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v4 = [v3 _accessibilitySubviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        MEMORY[0x24565BD30](@"PosterBoard.PosterSectionHeaderView");
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([v9 isHidden] & 1) == 0)
        {
          [v9 accessibilityFrame];
          double v11 = v10;
          [(LockScreenPosterCollectionViewCellAccessibility *)self accessibilityFrame];
          double v13 = v12 + -1.0;
          double v14 = v12 + 1.0;
          if (v13 <= v11 && v11 <= v14)
          {
            v16 = accessibilityLocalizedString(@"lock.screen.wallpaper.label");
            id v19 = [v9 safeSwiftStringForKey:@"title"];
            v17 = AXCFormattedString();

            goto LABEL_16;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
  v17 = 0;
LABEL_16:

  return v17;
}

- (id)accessibilityValue
{
  objc_opt_class();
  id v3 = [(LockScreenPosterCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"focusButton"];
  double v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 accessibilityValue];
  if (v5)
  {
    uint64_t v6 = [v4 accessibilityLabel];
    v9 = [(LockScreenPosterCollectionViewCellAccessibility *)self _axWallpaperWidgetsNames];
    uint64_t v7 = __AXStringForVariables();
  }
  else
  {
    uint64_t v7 = [(LockScreenPosterCollectionViewCellAccessibility *)self _axWallpaperWidgetsNames];
  }

  return v7;
}

- (id)_axWallpaperWidgetsNames
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = [(LockScreenPosterCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"prominentController"];
  double v4 = [(LockScreenPosterCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"widgetSidebarProminentController"];
  uint64_t v5 = [v3 safeValueForKeyPath:@"subtitleComplicationViewController.complicationDescriptor.widgetDescriptor"];
  v34 = v3;
  uint64_t v6 = [v3 safeValueForKeyPath:@"complicationContainerViewController.model"];
  uint64_t v7 = [v6 safeArrayForKey:@"complicationDescriptors"];
  objc_super v8 = (void *)[v7 mutableCopy];

  v33 = v4;
  v9 = [v4 safeValueForKeyPath:@"complicationSidebarViewController.model"];
  uint64_t v10 = [v9 safeArrayForKey:@"complicationDescriptors"];

  v31 = (void *)v10;
  [v8 axSafelyAddObjectsFromArray:v10];
  double v11 = [MEMORY[0x263EFF980] array];
  double v12 = [MEMORY[0x263EFF9A0] dictionary];
  if (v5)
  {
    double v13 = AXTopWidgetAndAppName(v5);
    [v11 axSafelyAddObject:v13];
  }
  v32 = v5;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v39 + 1) + 8 * i) safeValueForKey:@"widgetDescriptor"];
        AXMapAppNameToWidgets(v19, v12);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v16);
  }
  v30 = v14;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v20 = [v12 allKeys];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = [v12 objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * j)];
        v26 = AXFormatAndListWithElements();
        v27 = __UIAXStringForVariables();
        objc_msgSend(v11, "axSafelyAddObject:", v27, v26, @"__AXStringForVariablesSentinel");
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v22);
  }

  v28 = AXFormatAndListWithElements();

  return v28;
}

- (id)_axCollectionView
{
  objc_opt_class();
  objc_opt_class();
  uint64_t v2 = __UIAccessibilityCastAsClass();
  id v3 = AXCollectionViewController(v2);
  double v4 = [v3 safeValueForKey:@"collectionView"];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  return v5;
}

@end