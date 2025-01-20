@interface SFStartPageBackgroundImageCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SFStartPageBackgroundImageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFStartPageBackgroundImageCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFStartPageCustomizationViewController"];
  [v3 validateClass:@"SFStartPageCustomizationViewController" hasInstanceVariable:@"_backgroundImagesCollectionViewDataSource" withType:"UICollectionViewDiffableDataSource"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFStartPageBackgroundImageCell", @"showsSelectionRing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFStartPageBackgroundImageCell", @"showsCustomImageControls", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFStartPageBackgroundImageCell", @"didSelectClearButton:", "v", "@", 0);
}

- (id)accessibilityLabel
{
  v16.receiver = self;
  v16.super_class = (Class)SFStartPageBackgroundImageCellAccessibility;
  id v3 = [(SFStartPageBackgroundImageCellAccessibility *)&v16 accessibilityLabel];
  v4 = [(SFStartPageBackgroundImageCellAccessibility *)self _accessibilityIndexPath];
  v5 = [(SFStartPageBackgroundImageCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  v6 = [v5 delegate];

  if (v4)
  {
    MEMORY[0x245655C80](@"SFStartPageCustomizationViewController");
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      v7 = [v6 safeValueForKey:@"_backgroundImagesCollectionViewDataSource"];
      v8 = __UIAccessibilityCastAsClass();

      v9 = [(SFStartPageBackgroundImageCellAccessibility *)self _accessibilityIndexPath];
      v10 = [v8 itemIdentifierForIndexPath:v9];
      uint64_t v11 = [v10 accessibilityLabel];
      v12 = (void *)v11;
      if (v11) {
        v13 = (void *)v11;
      }
      else {
        v13 = v3;
      }
      id v14 = v13;

      id v3 = v14;
    }
  }

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CF00] | *MEMORY[0x263F1CEE8];
  int v3 = [(SFStartPageBackgroundImageCellAccessibility *)self safeBoolForKey:@"showsSelectionRing"];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v2 | v4;
}

- (id)accessibilityCustomActions
{
  int v3 = [MEMORY[0x263EFF980] array];
  if ([(SFStartPageBackgroundImageCellAccessibility *)self safeBoolForKey:@"showsCustomImageControls"])
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x263F1C390]);
    v5 = accessibilityMobileSafariLocalizedString(@"clear.background.image.button");
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __73__SFStartPageBackgroundImageCellAccessibility_accessibilityCustomActions__block_invoke;
    uint64_t v11 = &unk_265135E18;
    objc_copyWeak(&v12, &location);
    v6 = (void *)[v4 initWithName:v5 actionHandler:&v8];

    objc_msgSend(v3, "addObject:", v6, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v3;
}

uint64_t __73__SFStartPageBackgroundImageCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __73__SFStartPageBackgroundImageCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didSelectClearButton:0];
}

@end