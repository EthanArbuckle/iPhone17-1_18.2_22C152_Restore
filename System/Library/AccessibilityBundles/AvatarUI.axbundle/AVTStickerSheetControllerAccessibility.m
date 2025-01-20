@interface AVTStickerSheetControllerAccessibility
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

@implementation AVTStickerSheetControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTStickerSheetController";
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
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTStickerSheetController", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTStickerSheetController", @"avatarRecord", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTStickerSheetController", @"model", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTStickerSheetController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTStickerSheetModel", @"stickerItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTUIStickerItem", @"localizedName", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)AVTStickerSheetControllerAccessibility;
  [(AVTStickerSheetControllerAccessibility *)&v18 _accessibilityLoadAccessibilityInformation];
  char v17 = 0;
  objc_opt_class();
  id v3 = [(AVTStickerSheetControllerAccessibility *)self safeValueForKey:@"collectionView"];
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
        [(AVTStickerSheetControllerAccessibility *)self _axMarkupCell:v11 indexPath:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v8);
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVTStickerSheetControllerAccessibility;
  id v6 = a4;
  uint64_t v7 = [(AVTStickerSheetControllerAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  -[AVTStickerSheetControllerAccessibility _axMarkupCell:indexPath:](self, "_axMarkupCell:indexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

- (void)_axMarkupCell:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__AVTStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke;
  v14[3] = &unk_26510A2B8;
  objc_copyWeak(&v16, &location);
  id v8 = v7;
  id v15 = v8;
  [v6 _setAccessibilityLabelBlock:v14];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __66__AVTStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_2;
  v12 = &unk_26510A3D0;
  objc_copyWeak(&v13, &location);
  [v6 _setAccessibilityCustomContentBlock:&v9];
  objc_msgSend(v6, "setIsAccessibilityElement:", 1, v9, v10, v11, v12);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

id __66__AVTStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [v2 safeValueForKey:@"model"];
  v4 = [v3 safeArrayForKey:@"stickerItems"];

  unint64_t v5 = [v4 count];
  if (v5 <= [*(id *)(a1 + 32) item])
  {
    id v7 = 0;
  }
  else
  {
    id v6 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "item"));
    id v7 = [v6 safeValueForKey:@"localizedName"];
  }
  id v8 = [v2 safeValueForKey:@"avatarRecord"];
  uint64_t v9 = [v2 _axGetCurrentAvatarDescription];
  uint64_t v10 = [v2 _axGetCurrentAvatarRecord];
  if ([v8 isEqual:v10])
  {
    uint64_t v11 = [v2 _axGetCurrentAvatarDescription];

    if (v11) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v12 = [MEMORY[0x263F22288] descriptionForAvatarWithRecord:v8 includeVideoPrefix:0];

  [v2 _axSetCurrentAvatarRecord:v8];
  [v2 _axSetCurrentAvatarDescription:v12];
  uint64_t v9 = (void *)v12;
LABEL_9:
  id v13 = __UIAXStringForVariables();

  return v13;
}

id __66__AVTStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained safeValueForKey:@"avatarRecord"];
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