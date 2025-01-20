@interface PUOneUpViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axApplyCustomActionsToTileControllers;
- (void)_axExecuteBlockOnTileViewControllers:(id)a3;
- (void)_axShowAccessory;
- (void)_setAccessoryVisible:(BOOL)a3;
- (void)_updateBarsControllerIfNeeded;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUOneUpViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUOneUpViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUImageTileViewController"];
  [v3 validateClass:@"PUOneUpBarsController"];
  [v3 validateClass:@"PUOneUpViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"_tilingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUImageTileViewController", @"_imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"ppt_barsController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"_barsController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"actionsController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpDefaultActionsController", @"togglePlayback", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"_needsUpdateBarsController", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"_accessoryVisibilityInteractionController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"_options", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAssetViewModel", @"contentOffset", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"_isAccessoryVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"viewDidAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"viewModel:didChange:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"_updateBarsControllerIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"_setAccessoryVisible:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"_accessoryContentKindForCurrentAsset", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAccessoryVisibilityInteractionController", @"_currentAssetViewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAssetViewModel", @"asset", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PUOneUpViewControllerAccessibility;
  [(PUOneUpViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  [(PUOneUpViewControllerAccessibility *)self _axApplyCustomActionsToTileControllers];
  id v3 = [(PUOneUpViewControllerAccessibility *)self safeValueForKey:@"_barsController"];
  NSClassFromString(&cfstr_Puoneupbarscon_0.isa);
  if (objc_opt_isKindOfClass()) {
    [v3 _accessibilityLoadAccessibilityInformation];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUOneUpViewControllerAccessibility;
  [(PUOneUpViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(PUOneUpViewControllerAccessibility *)self _axApplyCustomActionsToTileControllers];
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PUOneUpViewControllerAccessibility;
  [(PUOneUpViewControllerAccessibility *)&v5 viewModel:a3 didChange:a4];
  [(PUOneUpViewControllerAccessibility *)self _axApplyCustomActionsToTileControllers];
}

- (void)_updateBarsControllerIfNeeded
{
  int v3 = [(PUOneUpViewControllerAccessibility *)self safeBoolForKey:@"_needsUpdateBarsController"];
  v4.receiver = self;
  v4.super_class = (Class)PUOneUpViewControllerAccessibility;
  [(PUOneUpViewControllerAccessibility *)&v4 _updateBarsControllerIfNeeded];
  if (v3) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (void)_setAccessoryVisible:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUOneUpViewControllerAccessibility;
  -[PUOneUpViewControllerAccessibility _setAccessoryVisible:](&v7, sel__setAccessoryVisible_);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__PUOneUpViewControllerAccessibility__setAccessoryVisible___block_invoke;
  v5[3] = &__block_descriptor_33_e62_v16__0__PUTileController_AXFullScreenTileControllerDelegate__8l;
  BOOL v6 = a3;
  [(PUOneUpViewControllerAccessibility *)self _axExecuteBlockOnTileViewControllers:v5];
}

void __59__PUOneUpViewControllerAccessibility__setAccessoryVisible___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 _axMainImageView];
  if (v3)
  {
    id v4 = v3;
    [v3 setIsAccessibilityElement:*(unsigned char *)(a1 + 32) == 0];
    int v3 = v4;
  }
}

- (void)_axShowAccessory
{
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  int v5 = [(PUOneUpViewControllerAccessibility *)self safeBoolForKey:@"_isAccessoryVisible"];
  if (a3 != 4 || (v5 & 1) != 0)
  {
    if (a3 == 3) {
      int v7 = v5;
    }
    else {
      int v7 = 0;
    }
    if (v7 == 1)
    {
      v8 = [(PUOneUpViewControllerAccessibility *)self safeValueForKey:@"_accessoryVisibilityInteractionController"];
      v9 = [v8 safeValueForKey:@"_currentAssetViewModel"];
      [v9 safeCGPointForKey:@"contentOffset"];
      BOOL v6 = v10 <= 0.0;
      if (v10 <= 0.0) {
        [(PUOneUpViewControllerAccessibility *)self _setAccessoryVisible:0];
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    BOOL v6 = 1;
    [(PUOneUpViewControllerAccessibility *)self _setAccessoryVisible:1];
  }
  return v6;
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

uint64_t __64__PUOneUpViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) safeBoolForKey:@"_isAccessoryVisible"];
  int v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 _setAccessoryVisible:0];
  }
  else
  {
    return [v3 dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)accessibilityPerformMagicTap
{
  return 1;
}

void __66__PUOneUpViewControllerAccessibility_accessibilityPerformMagicTap__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"actionsController"];
  id v1 = (id)[v2 safeValueForKey:@"togglePlayback"];
}

- (void)_axApplyCustomActionsToTileControllers
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __76__PUOneUpViewControllerAccessibility__axApplyCustomActionsToTileControllers__block_invoke;
  v2[3] = &unk_2650A7FB0;
  v2[4] = self;
  [(PUOneUpViewControllerAccessibility *)self _axExecuteBlockOnTileViewControllers:v2];
}

void __76__PUOneUpViewControllerAccessibility__axApplyCustomActionsToTileControllers__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (([*(id *)(a1 + 32) safeUnsignedIntegerForKey:@"_options"] & 0x40) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) safeIntegerForKey:@"_accessoryContentKindForCurrentAsset"];
    if (v3 == 2)
    {
      id v4 = objc_alloc(MEMORY[0x263F1C390]);
      int v5 = @"accessory.comments.show";
    }
    else
    {
      if (v3 != 1) {
        goto LABEL_8;
      }
      id v4 = objc_alloc(MEMORY[0x263F1C390]);
      int v5 = @"accessory.details.show";
    }
    BOOL v6 = accessibilityPULocalizedString(v5);
    int v7 = (void *)[v4 initWithName:v6 target:*(void *)(a1 + 32) selector:sel__axShowAccessory];

    if (v7)
    {
      [v8 _axApplyCustomAction:v7];
    }
  }
LABEL_8:
}

- (void)_axExecuteBlockOnTileViewControllers:(id)a3
{
  id v4 = a3;
  char v10 = 0;
  objc_opt_class();
  int v5 = [(PUOneUpViewControllerAccessibility *)self safeValueForKey:@"_tilingView"];
  BOOL v6 = __UIAccessibilityCastAsClass();

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__PUOneUpViewControllerAccessibility__axExecuteBlockOnTileViewControllers___block_invoke;
  v8[3] = &unk_2650A7FD8;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateAllTileControllersUsingBlock:v8];
}

void __75__PUOneUpViewControllerAccessibility__axExecuteBlockOnTileViewControllers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = __UIAccessibilityCastAsSafeCategory();
  if ([v4 _axConformsToFullScreenTileControllerDelegate]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end