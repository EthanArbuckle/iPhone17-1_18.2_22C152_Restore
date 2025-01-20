@interface VideosUI
@end

@implementation VideosUI

uint64_t __62__VideosUI_MultiPlayerContainerViewAccessibility__axMultiView__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x245669780](@"VideosUI.MultiPlayerViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __74__VideosUI_MultiPlayerContainerViewAccessibility__axAllPlayerViewControls__block_invoke(uint64_t a1, void *a2)
{
  return [a2 safeSwiftValueForKey:@"playerViewController"];
}

uint64_t __75__VideosUI_MultiPlayerContainerViewAccessibility__axAllMultiviewContainers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"VideosUI.MultiPlayerContainerView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) mediaItemMetadataForProperty:@"TVPMediaItemMetadataCanonicalID"];

  return MEMORY[0x270F9A758]();
}

uint64_t __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 safeSwiftStringForKey:@"identifier"];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"VideosUI.StackCollectionView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"VUIStackingPosterView");
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x245669780](@"VideosUI.CardView");
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  v6 = [a2 safeValueForKey:@"textLayout"];
  v7 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "safeIntegerForKey:", @"textStyle"));

  v8 = NSNumber;
  v9 = [v5 safeValueForKey:@"textLayout"];

  v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "safeIntegerForKey:", @"textStyle"));

  uint64_t v11 = [v7 compare:v10];
  return v11;
}

uint64_t __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  char v6 = *(unsigned char *)(a1 + 40);
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setDetailsViewControllerVisible:*(unsigned char *)(a1 + 40) == 0 animated:0 completion:0];
}

uint64_t __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_copyWeak(&v6, (id *)(a1 + 40));
  AXPerformSafeBlock();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);

  return 0;
}

void __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [v2 _axAVPlayer];
  [WeakRetained removePlayerViewController:v3 animated:0 completion:0];
}

uint64_t __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_copyWeak(&v6, (id *)(a1 + 40));
  AXPerformSafeBlock();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);

  return 0;
}

void __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [v2 _axAVPlayer];
  [WeakRetained enterFullscreenWithPlayerViewController:v3 completion:0];
}

uint64_t __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_7(id *a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, a1 + 4);
  objc_copyWeak(&v6, a1 + 5);
  objc_copyWeak(&v7, a1 + 6);
  AXPerformSafeBlock();
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);

  return 0;
}

void __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_8(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v7 = [WeakRetained _axAVPlayer];

  id v3 = objc_loadWeakRetained(a1 + 5);
  [v3 removePlayerViewController:v7 animated:0 completion:0];

  id v4 = objc_loadWeakRetained(a1 + 5);
  [v4 replacePlayerViewController:v7 atIndex:0 animated:0 completion:0];

  id v5 = objc_loadWeakRetained(a1 + 5);
  id v6 = objc_loadWeakRetained(a1 + 6);
  [v5 addPlayerViewController:v6 animated:0 completion:0];
}

id __69__VideosUI_MultiPlayerContainerViewAccessibility_removeFromSuperview__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  id v4 = [v3 keyWindow];

  return v4;
}

void __69__VideosUI_MultiPlayerContainerViewAccessibility_removeFromSuperview__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_458];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__VideosUI_MultiPlayerContainerViewAccessibility_removeFromSuperview__block_invoke_4;
  v7[3] = &unk_265166028;
  id v8 = *(id *)(a1 + 40);
  char v3 = objc_msgSend(v2, "ax_containsObjectUsingBlock:", v7);
  if ([v2 count] && (v3 & 1) == 0)
  {
    UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
    id v5 = accessibilityLocalizedString(@"multiview.game.removed");
    id v6 = AXCFormattedString();
    UIAccessibilityPostNotification(v4, v6);
  }
}

uint64_t __69__VideosUI_MultiPlayerContainerViewAccessibility_removeFromSuperview__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"VideosUI.MultiPlayerContainerView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __69__VideosUI_MultiPlayerContainerViewAccessibility_removeFromSuperview__block_invoke_4(uint64_t a1, void *a2)
{
  char v3 = [a2 safeSwiftValueForKey:@"playerViewController"];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __76__VideosUI_CardViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __60__VideosUI_CardViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityShowContextMenuForElement:WeakRetained targetPointValue:0];

  return 1;
}

uint64_t __60__VideosUI_CardViewAccessibility_accessibilityCustomActions__block_invoke_2()
{
  return 1;
}

uint64_t __52__VideosUI_CardViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 safeValueForKey:@"textLayout"];
  uint64_t v7 = [v6 safeIntegerForKey:@"textStyle"];

  id v8 = [v5 safeValueForKey:@"textLayout"];

  uint64_t v9 = [v8 safeIntegerForKey:@"textStyle"];
  v10 = *(void **)(a1 + 32);

  return [v10 _axCompareStyle:v7 toStyle:v9];
}

BOOL __62__VideosUI_CardViewAccessibility_accessibilityUserInputLabels__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 safeValueForKey:@"textLayout"];
  uint64_t v3 = [v2 safeIntegerForKey:@"textStyle"];

  return (unint64_t)(v3 - 13) < 2;
}

uint64_t __62__VideosUI_CardViewAccessibility_accessibilityAttributedValue__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v4 = a2;
  MEMORY[0x245669780](@"_TVProgressView");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    *a3 = 1;
  }
  return isKindOfClass & 1;
}

uint64_t __51__VideosUI_CardViewAccessibility_accessibilityHint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __66__VideosUI_QueryDescriptionBarAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) singlePressWithGesture:0];
}

BOOL __93__VideosUI_SportsCanonicalBannerCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v3 = [WeakRetained safeSwiftValueForKey:@"newBannerAccessoryView"];
  id v4 = [v3 accessibilityElements];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __93__VideosUI_SportsCanonicalBannerCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v9[3] = &unk_265166240;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v11 = &v13;
  uint64_t v12 = v5;
  id v6 = v3;
  id v10 = v6;
  [v4 enumerateObjectsUsingBlock:v9];

  BOOL v7 = *((unsigned char *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __93__VideosUI_SportsCanonicalBannerCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    if (!*(unsigned char *)(v3 + 24))
    {
      id v4 = [*(id *)(a1 + 32) accessibilityLabel];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 != 0;

      goto LABEL_7;
    }
  }
  else
  {
    if (![v5 isAccessibilityElement]) {
      goto LABEL_7;
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v3 + 24) = 1;
LABEL_7:
}

uint64_t __82__VideosUI_EpicInlineViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"VideosUI.VerticalStackView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __82__VideosUI_EpicInlineViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"VUILabel");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __68__VideosUI_AttributionTextViewUIKitAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 accessibilityLabel];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 safeValueForKey:@"_accessibilityGetValue"];
  }
  id v6 = v5;

  return v6;
}

uint64_t __64__VideosUI_RootSideBarControllerAccessibility_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 _accessibilityViewIsVisible];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __64__VideosUI_RootSideBarControllerAccessibility_viewDidDisappear___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 accessibilityLabel];
}

uint64_t __71__VideosUI_OfferListLockupCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendActionsForControlEvents:0x2000];

  return 1;
}

uint64_t __71__VideosUI_OfferListLockupCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendActionsForControlEvents:0x2000];

  return 1;
}

uint64_t __104__VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __67__VideosUI_LockupCollectionViewCellAccessibility_specialCharacters__block_invoke()
{
  v0 = (void *)specialCharacters_specialCharacters;
  specialCharacters_specialCharacters = (uint64_t)&unk_26F833990;
}

uint64_t __82__VideosUI_LockupCollectionViewCellAccessibility__accessibilityStackingPosterView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = (void *)StackingPosterViewSwiftClass___PosterClass;
  if (!StackingPosterViewSwiftClass___PosterClass)
  {
    uint64_t v3 = (void *)MEMORY[0x245669780](@"VideosUI.StackingPosterView");
    StackingPosterViewSwiftClass___PosterClass = (uint64_t)v3;
  }
  id v4 = v3;
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v6 = (void *)StackingPosterViewObjcClass___PosterClass;
    if (!StackingPosterViewObjcClass___PosterClass)
    {
      id v6 = (void *)MEMORY[0x245669780](@"VUIStackingPosterView");
      StackingPosterViewObjcClass___PosterClass = (uint64_t)v6;
    }
    id v7 = v6;
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __75__VideosUI_LockupCollectionViewCellAccessibility__accessibilityOverlayView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = (void *)UnifiedOverlayViewClass___PosterClass;
  if (!UnifiedOverlayViewClass___PosterClass)
  {
    uint64_t v3 = (void *)MEMORY[0x245669780](@"VideosUI.UnifiedOverlayView");
    UnifiedOverlayViewClass___PosterClass = (uint64_t)v3;
  }
  id v4 = v3;
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v6 = (void *)OverlayViewClass___PosterClass;
    if (!OverlayViewClass___PosterClass)
    {
      id v6 = (void *)MEMORY[0x245669780](@"VideosUI.OverlayView");
      OverlayViewClass___PosterClass = (uint64_t)v6;
    }
    id v7 = v6;
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __70__VideosUI_MultiPlayerGrabberViewAccessibility__axMultiviewController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  MEMORY[0x245669780](@"VideosUI.MultiPlayerViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __69__VideosUI_MultiPlayerGrabberViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDetailsViewControllerVisible:*(unsigned char *)(a1 + 40) == 0 animated:0 completion:0];
}

double __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];
  double v3 = v2;

  return v3;
}

id __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  double v2 = [WeakRetained safeUIViewForKey:@"accessibilityTitleView"];
  double v3 = __UIAccessibilityCastAsClass();

  id v4 = [WeakRetained safeSwiftValueForKey:@"titleView"];
  if (!v3)
  {
    MEMORY[0x245669780](@"VUIVisualEffectLabel");
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v5 = [v4 safeUIViewForKey:@"label"];
      double v3 = __UIAccessibilityCastAsClass();
    }
    else
    {
      double v3 = 0;
    }
  }
  id v6 = [WeakRetained safeUIViewForKey:@"accessibilitySubtitleView"];
  id v7 = [v3 text];
  id v10 = [v6 accessibilityLabel];
  id v8 = __UIAXStringForVariables();

  return v8;
}

BOOL __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = [WeakRetained _accessibilityFindSubviewDescendant:&__block_literal_global_19];
  double v3 = v2;
  if (v2) {
    [v2 sendActionsForControlEvents:64];
  }

  return v3 != 0;
}

uint64_t __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"VUIButton");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained _accessibilityHasDescendantOfType:MEMORY[0x245669780](@"VUIButton")];
  uint64_t v3 = [WeakRetained accessibilityTraits];
  id v4 = (void *)MEMORY[0x263F1CEE8];
  if (!v2) {
    id v4 = (void *)MEMORY[0x263F1CF18];
  }
  uint64_t v5 = *MEMORY[0x263F1CEF8] | v3 | *v4;

  return v5;
}

void __74__VideosUI_QueryDescriptionBannerViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = [a2 accessibilityLabel];
  [v2 axSafelyAddObject:v3];
}

uint64_t __70__VideosUI_FloatingCardHostingCollectionViewCellAccessibility__axNode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"SwiftUI.AccessibilityNode");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __82__VideosUI_FloatingCardHostingCollectionViewCellAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end