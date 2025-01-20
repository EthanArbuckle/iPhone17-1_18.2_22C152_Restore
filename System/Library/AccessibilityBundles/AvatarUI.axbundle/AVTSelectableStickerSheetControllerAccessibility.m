@interface AVTSelectableStickerSheetControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axGetCurrentAvatarDescription;
- (id)_axGetCurrentAvatarRecord;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupCell:(id)a3 indexPath:(id)a4;
- (void)_axSetCurrentAvatarDescription:(id)a3;
- (void)_axSetCurrentAvatarRecord:(id)a3;
@end

@implementation AVTSelectableStickerSheetControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTSelectableStickerSheetController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axGetCurrentAvatarDescription
{
}

- (void)_axSetCurrentAvatarDescription:(id)a3
{
}

- (id)_axGetCurrentAvatarRecord
{
}

- (void)_axSetCurrentAvatarRecord:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTSelectableStickerSheetController", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTSelectableStickerSheetController", @"avatarRecord", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTSelectableStickerSheetController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTSelectableStickerSheetController", @"isCameraItem:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTSelectableStickerSheetController", @"stickerItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTUIStickerItem", @"localizedName", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)AVTSelectableStickerSheetControllerAccessibility;
  [(AVTSelectableStickerSheetControllerAccessibility *)&v18 _accessibilityLoadAccessibilityInformation];
  char v17 = 0;
  objc_opt_class();
  id v3 = [(AVTSelectableStickerSheetControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = accessibilityLocalizedString(@"collection.stickers.label");
  [v4 setAccessibilityLabel:v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = objc_msgSend(v4, "visibleCells", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v12 = [v4 indexPathForCell:v11];
        [(AVTSelectableStickerSheetControllerAccessibility *)self _axMarkupCell:v11 indexPath:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v8);
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVTSelectableStickerSheetControllerAccessibility;
  id v6 = a4;
  uint64_t v7 = [(AVTSelectableStickerSheetControllerAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  -[AVTSelectableStickerSheetControllerAccessibility _axMarkupCell:indexPath:](self, "_axMarkupCell:indexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

- (void)_axMarkupCell:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(AVTSelectableStickerSheetControllerAccessibility *)self safeArrayForKey:@"stickerItems"];
  objc_super v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "item"));

  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v15[1] = (id)MEMORY[0x263EF8330];
  v15[2] = (id)3221225472;
  v15[3] = __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke;
  v15[4] = &unk_26510A308;
  v15[7] = &v16;
  v15[5] = self;
  id v10 = v9;
  v15[6] = v10;
  AXPerformSafeBlock();
  LODWORD(v9) = *((unsigned __int8 *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  if (v9)
  {
    [v6 _setAccessibilityLabelBlock:&__block_literal_global_0];
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_3;
    v13[3] = &unk_26510A2B8;
    objc_copyWeak(v15, &location);
    id v14 = v7;
    [v6 _setAccessibilityLabelBlock:v13];
    [v6 _setAccessibilityHintBlock:&__block_literal_global_311];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_5;
    v11[3] = &unk_26510A3D0;
    objc_copyWeak(&v12, &location);
    [v6 _setAccessibilityCustomContentBlock:v11];
    objc_destroyWeak(&v12);

    objc_destroyWeak(v15);
  }
  [v6 setIsAccessibilityElement:1];

  objc_destroyWeak(&location);
}

uint64_t __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCameraItem:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

id __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_2()
{
  return accessibilityLocalizedString(@"custom.pose");
}

id __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained safeArrayForKey:@"stickerItems"];
  unint64_t v4 = [v3 count];
  if (v4 <= [*(id *)(a1 + 32) item])
  {
    id v6 = 0;
  }
  else
  {
    v5 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "item"));
    id v6 = [v5 safeValueForKey:@"localizedName"];
  }
  id v7 = [WeakRetained safeValueForKey:@"avatarRecord"];
  uint64_t v8 = [WeakRetained _axGetCurrentAvatarDescription];
  objc_super v9 = [WeakRetained _axGetCurrentAvatarRecord];
  if ([v7 isEqual:v9])
  {
    id v10 = [WeakRetained _axGetCurrentAvatarDescription];

    if (v10) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v11 = [MEMORY[0x263F22288] descriptionForAvatarWithRecord:v7 includeVideoPrefix:0];

  [WeakRetained _axSetCurrentAvatarRecord:v7];
  [WeakRetained _axSetCurrentAvatarDescription:v11];
  uint64_t v8 = (void *)v11;
LABEL_9:
  id v12 = __UIAXStringForVariables();

  return v12;
}

id __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_4()
{
  return accessibilityLocalizedString(@"grayscale.pose");
}

id __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"avatarRecord"];
  if (v2)
  {
    id v3 = [MEMORY[0x263F22288] customContentForAvatarWithRecord:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

@end