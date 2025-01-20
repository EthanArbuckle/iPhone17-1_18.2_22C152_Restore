@interface AVTSimpleAvatarPickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupCellWithAXInfo:(id)a3 indexPath:(id)a4;
- (void)loadView;
@end

@implementation AVTSimpleAvatarPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTSimpleAvatarPicker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTSimpleAvatarPicker", @"dataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarPickerDataSource", @"itemAtIndex:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarPickerDataSource", @"isItemAtIndexAddItem:", "B", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarListRecordItem", @"avatar", "@", 0);
  [v3 validateProtocol:@"AVTAvatarRecord" hasRequiredInstanceMethod:@"isEditable"];
  [v3 validateProtocol:@"AVTAvatarRecord" hasRequiredInstanceMethod:@"identifier"];
  [v3 validateProtocol:@"AVTAvatarListItem" hasRequiredInstanceMethod:@"downcastWithRecordHandler:viewHandler:"];
  [v3 validateClass:@"AVTSimpleAvatarPicker" hasProperty:@"collectionView" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTSimpleAvatarPicker", @"loadView", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)AVTSimpleAvatarPickerAccessibility;
  [(AVTSimpleAvatarPickerAccessibility *)&v18 _accessibilityLoadAccessibilityInformation];
  char v17 = 0;
  objc_opt_class();
  id v3 = [(AVTSimpleAvatarPickerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(v4, "visibleCells", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = [v10 _accessibilityIndexPath];
        [(AVTSimpleAvatarPickerAccessibility *)self _axMarkupCellWithAXInfo:v10 indexPath:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  v12 = accessibilityLocalizedString(@"collection.avatars.label");
  [v4 setAccessibilityLabel:v12];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)AVTSimpleAvatarPickerAccessibility;
  [(AVTSimpleAvatarPickerAccessibility *)&v3 loadView];
  [(AVTSimpleAvatarPickerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_axMarkupCellWithAXInfo:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setIsAccessibilityElement:1];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  [(AVTSimpleAvatarPickerAccessibility *)self safeValueForKey:@"dataSource"];
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v7;
  AXPerformSafeBlock();
  LODWORD(v7) = *((unsigned __int8 *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  if (v7)
  {
    v10 = accessibilityLocalizedString(@"starfish.add");
    [v6 setAccessibilityLabel:v10];
  }
  else
  {
    id v11 = v8;
    id v12 = v9;
    id v13 = v6;
    AXPerformSafeBlock();

    v10 = v11;
  }
}

uint64_t __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isItemAtIndexAddItem:", objc_msgSend(*(id *)(a1 + 40), "item"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_2(id *a1)
{
  v2 = objc_msgSend(a1[4], "itemAtIndex:", objc_msgSend(a1[5], "item"));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_3;
  v3[3] = &unk_26510A380;
  id v4 = a1[6];
  [v2 downcastWithRecordHandler:v3 viewHandler:0];
}

void __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_3(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_4;
  v14[3] = &unk_26510A330;
  id v5 = v3;
  id v15 = v5;
  [v4 _setAccessibilityLabelBlock:v14];
  id v6 = [v5 safeValueForKey:@"avatar"];
  int v7 = [v6 safeBoolForKey:@"isEditable"];

  if (v7)
  {
    id v8 = accessibilityLocalizedString(@"starfish.avatar");
    v16[0] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [*(id *)(a1 + 32) setAccessibilityUserInputLabels:v9];
  }
  v10 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_5;
  v12[3] = &unk_26510A358;
  id v13 = v5;
  id v11 = v5;
  [v10 _setAccessibilityCustomContentBlock:v12];
}

id __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_4(uint64_t a1)
{
  if (!CachedAvatarLabels)
  {
    uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
    id v3 = (void *)CachedAvatarLabels;
    CachedAvatarLabels = v2;
  }
  id v4 = [*(id *)(a1 + 32) safeValueForKey:@"avatar"];
  id v5 = [v4 safeValueForKey:@"identifier"];
  id v6 = [(id)CachedAvatarLabels objectForKey:v5];
  int v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = (void *)CachedAvatarLabels;
    v10 = [MEMORY[0x263F22288] descriptionForAvatarWithRecord:v4 includeVideoPrefix:0];
    [v9 setObject:v10 forKey:v5];

    id v8 = [(id)CachedAvatarLabels objectForKey:*(void *)(a1 + 32)];
  }
  id v11 = v8;

  return v11;
}

id __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_5(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) safeValueForKey:@"avatarRecord"];
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x263F22288] customContentForAvatarWithRecord:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVTSimpleAvatarPickerAccessibility;
  id v6 = a4;
  int v7 = [(AVTSimpleAvatarPickerAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  -[AVTSimpleAvatarPickerAccessibility _axMarkupCellWithAXInfo:indexPath:](self, "_axMarkupCellWithAXInfo:indexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

@end