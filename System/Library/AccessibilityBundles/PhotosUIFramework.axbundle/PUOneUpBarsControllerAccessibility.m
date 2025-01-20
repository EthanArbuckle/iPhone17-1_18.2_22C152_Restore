@interface PUOneUpBarsControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axDetailsShowing;
- (BOOL)_axIsFavorite;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (id)_axAssetViewModel;
- (id)_newBarButtonItemWithIdentifier:(int64_t)a3 location:(int64_t)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axLoadAirplayButtonAccessibility:(id)a3;
- (void)_axLoadBackButtonWithNoTitleAccessibility:(id)a3;
- (void)_axLoadDeleteButtonAccessibility:(id)a3;
- (void)_axLoadDetailsButtonAccessibility:(id)a3;
- (void)_axLoadDoneButtonAccessibility:(id)a3;
- (void)_axLoadEditButtonAccessibility:(id)a3;
- (void)_axLoadFavoriteButtonAccessibility:(id)a3;
- (void)_axLoadLikeButtonAccessibility:(id)a3 identifier:(int64_t)a4;
- (void)_axLoadMuteButtonAccessibility:(id)a3;
- (void)_axLoadRewindButtonAccessibility:(id)a3;
- (void)_axLoadShareButtonAccessibility:(id)a3;
- (void)_axLoadUnmuteButtonAccessibility:(id)a3;
- (void)_handleFavoriteButton:(id)a3;
@end

@implementation PUOneUpBarsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUOneUpBarsController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUScrubberView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpBarsController", @"browsingSession", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpBarsController", @"_scrubberView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingSession", @"viewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAssetViewModel", @"isFavorite", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAssetViewModel", @"isAccessoryViewVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpBarsController", @"_newBarButtonItemWithIdentifier: location:", "@", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpBarsController", @"_activeBarButtonItemForIdentifier:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpBarsController", @"_handleFavoriteButton:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingViewModel", @"assetViewModelForAssetReference:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingViewModel", @"currentAssetReference", "@", 0);
}

- (id)_axAssetViewModel
{
  v2 = [(PUOneUpBarsControllerAccessibility *)self safeValueForKeyPath:@"browsingSession.viewModel"];
  id v3 = [v2 safeValueForKey:@"currentAssetReference"];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  id v6 = v2;
  id v7 = v3;
  AXPerformSafeBlock();
  id v4 = (id)v9[5];

  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __55__PUOneUpBarsControllerAccessibility__axAssetViewModel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) assetViewModelForAssetReference:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_axIsFavorite
{
  v2 = [(PUOneUpBarsControllerAccessibility *)self _axAssetViewModel];
  char v3 = [v2 safeBoolForKey:@"isFavorite"];

  return v3;
}

- (BOOL)_axDetailsShowing
{
  v2 = [(PUOneUpBarsControllerAccessibility *)self _axAssetViewModel];
  char v3 = [v2 safeBoolForKey:@"isAccessoryViewVisible"];

  return v3;
}

- (void)_axLoadFavoriteButtonAccessibility:(id)a3
{
  id v4 = a3;
  v5 = accessibilityPULocalizedString(@"photo.favorite");
  [v4 setAccessibilityLabel:v5];

  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __73__PUOneUpBarsControllerAccessibility__axLoadFavoriteButtonAccessibility___block_invoke;
  uint64_t v10 = &unk_2650A7D50;
  objc_copyWeak(&v11, &location);
  [v4 _setAccessibilityValueBlock:&v7];
  id v6 = accessibilityPULocalizedString(@"photo.favorite.hint");
  objc_msgSend(v4, "setAccessibilityHint:", v6, v7, v8, v9, v10);

  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | *MEMORY[0x263F21C30]];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

__CFString *__73__PUOneUpBarsControllerAccessibility__axLoadFavoriteButtonAccessibility___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _axIsFavorite]) {
    v2 = @"1";
  }
  else {
    v2 = @"0";
  }
  char v3 = v2;

  return v3;
}

- (void)_axLoadLikeButtonAccessibility:(id)a3 identifier:(int64_t)a4
{
  v5 = AXIsPhotoSharingLikeButtonKey;
  id v6 = a3;
  [v6 _accessibilitySetRetainedValue:MEMORY[0x263EFFA88] forKey:v5];
  uint64_t v7 = accessibilityPULocalizedString(@"shared.photo.like");
  [v6 setAccessibilityLabel:v7];

  uint64_t v8 = accessibilityPULocalizedString(@"shared.photo.like.hint");
  [v6 setAccessibilityHint:v8];

  if (a4 == 19) {
    v9 = @"shared.photo.like.value.like";
  }
  else {
    v9 = @"shared.photo.like.value.liked";
  }
  accessibilityPULocalizedString(v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setAccessibilityValue:v10];
}

- (void)_axLoadEditButtonAccessibility:(id)a3
{
  id v3 = a3;
  accessibilityPULocalizedString(@"photo.edit");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setAccessibilityLabel:v4];
}

- (void)_axLoadDetailsButtonAccessibility:(id)a3
{
  id v8 = a3;
  if ([(PUOneUpBarsControllerAccessibility *)self _axDetailsShowing])
  {
    uint64_t v4 = [v8 accessibilityTraits];
    uint64_t v5 = *MEMORY[0x263F1CF38] | v4;
  }
  else
  {
    uint64_t v6 = *MEMORY[0x263F1CF38];
    uint64_t v5 = [v8 accessibilityTraits] & ~v6;
  }
  [v8 setAccessibilityTraits:v5];
  [v8 setIsAccessibilityElement:1];
  uint64_t v7 = accessibilityPULocalizedString(@"photo.info");
  [v8 setAccessibilityLabel:v7];
}

- (void)_axLoadAirplayButtonAccessibility:(id)a3
{
  id v3 = a3;
  accessibilityPULocalizedString(@"photo.airplay");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setAccessibilityLabel:v4];
}

- (void)_axLoadBackButtonWithNoTitleAccessibility:(id)a3
{
  id v4 = a3;
  uint64_t v3 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F81370] | v3];
}

- (void)_axLoadDoneButtonAccessibility:(id)a3
{
  id v4 = a3;
  uint64_t v3 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F81370] | v3];
}

- (void)_axLoadShareButtonAccessibility:(id)a3
{
  id v3 = a3;
  accessibilityPULocalizedString(@"photo.share");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setAccessibilityLabel:v4];
}

- (void)_axLoadDeleteButtonAccessibility:(id)a3
{
  id v3 = a3;
  accessibilityPULocalizedString(@"photo.delete");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setAccessibilityLabel:v4];
}

- (void)_axLoadRewindButtonAccessibility:(id)a3
{
  id v3 = a3;
  accessibilityPULocalizedString(@"photo.rewind");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setAccessibilityLabel:v4];
}

- (void)_axLoadMuteButtonAccessibility:(id)a3
{
  id v3 = a3;
  accessibilityPULocalizedString(@"photo.volume.button");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setAccessibilityLabel:v4];
}

- (void)_axLoadUnmuteButtonAccessibility:(id)a3
{
  id v3 = a3;
  accessibilityPULocalizedString(@"photo.volume.muted.button");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setAccessibilityLabel:v4];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)PUOneUpBarsControllerAccessibility;
  [(PUOneUpBarsControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  AXPerformSafeBlock();
}

void __80__PUOneUpBarsControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:7];
  [*(id *)(a1 + 32) _axLoadFavoriteButtonAccessibility:v14];
  id v13 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:19];
  [*(id *)(a1 + 32) _axLoadLikeButtonAccessibility:v13 identifier:19];
  v12 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:20];
  [*(id *)(a1 + 32) _axLoadLikeButtonAccessibility:v12 identifier:20];
  id v11 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:1];
  [*(id *)(a1 + 32) _axLoadEditButtonAccessibility:v11];
  objc_super v2 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:18];
  [*(id *)(a1 + 32) _axLoadAirplayButtonAccessibility:v2];
  id v3 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:31];
  [*(id *)(a1 + 32) _axLoadBackButtonWithNoTitleAccessibility:v3];
  id v4 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:10];
  [*(id *)(a1 + 32) _axLoadDoneButtonAccessibility:v4];
  uint64_t v5 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:6];
  [*(id *)(a1 + 32) _axLoadShareButtonAccessibility:v5];
  uint64_t v6 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:3];
  [*(id *)(a1 + 32) _axLoadDeleteButtonAccessibility:v6];
  uint64_t v7 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:2];
  [*(id *)(a1 + 32) _axLoadDeleteButtonAccessibility:v7];
  id v8 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:35];
  [*(id *)(a1 + 32) _axLoadMuteButtonAccessibility:v8];
  v9 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:36];
  [*(id *)(a1 + 32) _axLoadUnmuteButtonAccessibility:v9];
  id v10 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:38];
  [*(id *)(a1 + 32) _axLoadDetailsButtonAccessibility:v10];
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v5 = [(PUOneUpBarsControllerAccessibility *)self safeValueForKey:@"__scrubberView"];
  if (!v5) {
    goto LABEL_9;
  }
  NSClassFromString(&cfstr_Puscrubberview.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  id v6 = v5;
  uint64_t v7 = v6;
  if (a3 == 1)
  {
    char v8 = [v6 _axDecrementForThreeFingerScroll];
    goto LABEL_7;
  }
  if (a3 != 2)
  {

LABEL_9:
    v11.receiver = self;
    v11.super_class = (Class)PUOneUpBarsControllerAccessibility;
    BOOL v9 = [(PUOneUpBarsControllerAccessibility *)&v11 accessibilityScroll:a3];
    goto LABEL_10;
  }
  char v8 = [v6 _axIncrementForThreeFingerScroll];
LABEL_7:
  BOOL v9 = v8;

LABEL_10:
  return v9;
}

- (id)_newBarButtonItemWithIdentifier:(int64_t)a3 location:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PUOneUpBarsControllerAccessibility;
  id v6 = [(PUOneUpBarsControllerAccessibility *)&v9 _newBarButtonItemWithIdentifier:a3 location:a4];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 8)
  {
    uint64_t v7 = [(PUOneUpBarsControllerAccessibility *)self _activeBarButtonItemForIdentifier:7];
    [(PUOneUpBarsControllerAccessibility *)self _axLoadFavoriteButtonAccessibility:v7];
  }
  else if ((unint64_t)(a3 - 19) > 1)
  {
    if (a3 <= 9)
    {
      if (a3 == 1)
      {
        [(PUOneUpBarsControllerAccessibility *)self _axLoadEditButtonAccessibility:v6];
        return v6;
      }
      if (a3 == 6)
      {
        [(PUOneUpBarsControllerAccessibility *)self _axLoadShareButtonAccessibility:v6];
        return v6;
      }
    }
    else
    {
      switch(a3)
      {
        case 10:
          [(PUOneUpBarsControllerAccessibility *)self _axLoadDoneButtonAccessibility:v6];
          return v6;
        case 18:
          [(PUOneUpBarsControllerAccessibility *)self _axLoadAirplayButtonAccessibility:v6];
          return v6;
        case 31:
          [(PUOneUpBarsControllerAccessibility *)self _axLoadBackButtonWithNoTitleAccessibility:v6];
          return v6;
      }
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      [(PUOneUpBarsControllerAccessibility *)self _axLoadDeleteButtonAccessibility:v6];
    }
    else
    {
      switch(a3)
      {
        case '&':
          [(PUOneUpBarsControllerAccessibility *)self _axLoadDetailsButtonAccessibility:v6];
          break;
        case '$':
          [(PUOneUpBarsControllerAccessibility *)self _axLoadUnmuteButtonAccessibility:v6];
          break;
        case '#':
          [(PUOneUpBarsControllerAccessibility *)self _axLoadMuteButtonAccessibility:v6];
          break;
      }
    }
  }
  else
  {
    [(PUOneUpBarsControllerAccessibility *)self _axLoadLikeButtonAccessibility:v6 identifier:a3];
  }
  return v6;
}

- (void)_handleFavoriteButton:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUOneUpBarsControllerAccessibility;
  [(PUOneUpBarsControllerAccessibility *)&v3 _handleFavoriteButton:a3];
  AXPerformSafeBlock();
}

void __60__PUOneUpBarsControllerAccessibility__handleFavoriteButton___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _activeBarButtonItemForIdentifier:7];
  [*(id *)(a1 + 32) _axLoadFavoriteButtonAccessibility:v2];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end