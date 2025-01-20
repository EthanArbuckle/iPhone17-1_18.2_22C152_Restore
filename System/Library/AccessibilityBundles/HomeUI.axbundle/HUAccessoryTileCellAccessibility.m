@interface HUAccessoryTileCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityCustomActions;
@end

@implementation HUAccessoryTileCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUAccessoryTileCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUAccessoryTileCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUAccessoryTileCell", @"delegate", "@", 0);
  [v3 validateClass:@"HUAccessoryTileCell" isKindOfClass:@"HUTileCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUTileCell", @"tappableAreaForPoint:", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUTileCell", @"item", "@", 0);
  [v3 validateClass:@"HUDashboardViewController" isKindOfClass:@"UICollectionViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUDashboardViewController", @"presentationCoordinator:didRecognizeTapForItem:tappedArea:", "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUDashboardViewController", @"quickControlPresentationContextForItem:atIndexPath:point:", "@", "@", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HomeUI.TileCellContentView", @"iconView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlPresentationCoordinator", @"setPresentationContext:", "v", "@", 0);
  [v3 validateClass:@"UICollectionView"];
  [v3 validateClass:@"HUEmbeddedTriggerActionGridViewController" isKindOfClass:@"UICollectionViewController"];
  [v3 validateClass:@"HUContainedAccessoryElementsGridViewController" isKindOfClass:@"UICollectionViewController"];
}

- (CGPoint)accessibilityActivationPoint
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 contentView];
  v4 = [v3 safeValueForKey:@"iconView"];
  [v4 accessibilityActivationPoint];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (id)accessibilityCustomActions
{
  v21.receiver = self;
  v21.super_class = (Class)HUAccessoryTileCellAccessibility;
  id v3 = [(HUAccessoryTileCellAccessibility *)&v21 accessibilityCustomActions];
  v4 = (void *)[v3 mutableCopy];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  double v7 = v6;

  id location = 0;
  p_id location = &location;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  v14[1] = (id)MEMORY[0x263EF8330];
  v14[2] = (id)3221225472;
  v14[3] = __62__HUAccessoryTileCellAccessibility_accessibilityCustomActions__block_invoke;
  v14[4] = &unk_265128240;
  v14[5] = self;
  v14[6] = &location;
  AXPerformSafeBlock();
  id v8 = p_location[5];
  _Block_object_dispose(&location, 8);

  if (v8 == (id)*MEMORY[0x263F49AF0] || v8 == (id)*MEMORY[0x263F49AE8])
  {
    objc_initWeak(&location, self);
    id v9 = objc_alloc(MEMORY[0x263F1C390]);
    double v10 = accessibilityHomeUILocalizedString(@"accessory.settings");
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __62__HUAccessoryTileCellAccessibility_accessibilityCustomActions__block_invoke_2;
    v13[3] = &unk_265128290;
    objc_copyWeak(v14, &location);
    v11 = (void *)[v9 initWithName:v10 actionHandler:v13];

    [v7 addObject:v11];
    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

uint64_t __62__HUAccessoryTileCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 accessibilityActivationPoint];
  objc_msgSend(v2, "convertPoint:fromView:", 0);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(v2, "tappableAreaForPoint:");

  return MEMORY[0x270F9A758]();
}

uint64_t __62__HUAccessoryTileCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"delegate"];
  if (!v2)
  {
    id v3 = [WeakRetained accessibilityContainer];
    v4 = [v3 _accessibilityFindSubviewDescendant:&__block_literal_global_7];

    v2 = [v4 delegate];
  }
  double v5 = [WeakRetained _accessibilityIndexPath];
  id v6 = [v2 safeValueForKeyPath:@"quickControlPresentationCoordinator"];
  [WeakRetained safeValueForKey:@"item"];
  v12 = v6;
  v14 = v13 = v2;
  v15 = v5;
  id v7 = v5;
  id v8 = v14;
  id v9 = v2;
  id v10 = v6;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __62__HUAccessoryTileCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __62__HUAccessoryTileCellAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(*(id *)(a1 + 40), "quickControlPresentationContextForItem:atIndexPath:point:", *(void *)(a1 + 48), *(void *)(a1 + 56), *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [v2 setPresentationContext:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *MEMORY[0x263F49AE8];

  return [v4 presentationCoordinator:v5 didRecognizeTapForItem:v6 tappedArea:v7];
}

@end