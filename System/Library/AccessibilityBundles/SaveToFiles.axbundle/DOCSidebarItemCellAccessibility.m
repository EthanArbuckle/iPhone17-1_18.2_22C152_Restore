@interface DOCSidebarItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityRoleDescription;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation DOCSidebarItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SaveToFiles.DOCSidebarItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewListCellAccessibility", @"_accessibilityTrailingViews", "@", 0);
  [v3 validateClass:@"SaveToFiles.DOCEjectButton"];
  [v3 validateClass:@"SaveToFiles.DOCEjectButton" isKindOfClass:@"UIButton"];
  [v3 validateClass:@"SaveToFiles.DOCSidebarItemCell" isKindOfClass:@"UICollectionViewListCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCSidebarItemCell", @"accessibilityShowFolder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCSidebarItemCell", @"accessibilityTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCSidebarItemCell", @"accessibilityIsEjectable", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SaveToFiles.DOCSidebarItemCell", @"accessibilityTitleTextField", "@", 0);
}

- (id)_accessibilityRoleDescription
{
  if ([(DOCSidebarItemCellAccessibility *)self safeBoolForKey:@"accessibilityShowFolder"])
  {
    v2 = accessibilityUIKitLocalizedString();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  v15.receiver = self;
  v15.super_class = (Class)DOCSidebarItemCellAccessibility;
  v4 = [(DOCSidebarItemCellAccessibility *)&v15 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  if ([(DOCSidebarItemCellAccessibility *)self safeBoolForKey:@"accessibilityIsEjectable"])
  {
    objc_initWeak(&location, self);
    id v5 = objc_alloc(MEMORY[0x263F1C390]);
    v6 = accessibilityLocalizedString(@"eject");
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __61__DOCSidebarItemCellAccessibility_accessibilityCustomActions__block_invoke;
    v12 = &unk_26514B5F8;
    objc_copyWeak(&v13, &location);
    v7 = (void *)[v5 initWithName:v6 actionHandler:&v9];
    objc_msgSend(v3, "addObject:", v7, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v3;
}

uint64_t __61__DOCSidebarItemCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained safeArrayForKey:@"_accessibilityTrailingViews"];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        NSClassFromString(&cfstr_SavetofilesDoc_5.isa);
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          uint64_t v10 = __UIAccessibilityCastAsClass();
          v11 = v10;
          if (v10)
          {
            [v10 sendActionsForControlEvents:64];

            uint64_t v12 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_12:

  return v12;
}

- (id)accessibilityValue
{
  v9.receiver = self;
  v9.super_class = (Class)DOCSidebarItemCellAccessibility;
  v2 = [(DOCSidebarItemCellAccessibility *)&v9 accessibilityValue];
  if (v2)
  {
    id v3 = [MEMORY[0x263F08B08] localizedScannerWithString:v2];
    int v8 = 0;
    [v3 scanInt:&v8];
    if (v8 >= 1)
    {
      v4 = NSString;
      id v5 = accessibilityLocalizedString(@"badge.unread.count");
      uint64_t v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v8);

      v2 = (void *)v6;
    }
  }

  return v2;
}

- (id)accessibilityLabel
{
  if ([(DOCSidebarItemCellAccessibility *)self safeBoolForKey:@"accessibilityIsEjectable"])
  {
    id v3 = accessibilityLocalizedString(@"ejectable");
  }
  else
  {
    id v3 = 0;
  }
  v4 = [(DOCSidebarItemCellAccessibility *)self safeStringForKey:@"accessibilityTitle"];
  uint64_t v7 = [(DOCSidebarItemCellAccessibility *)self safeStringForKey:@"accessibilitySubtitle"];
  id v5 = __UIAXStringForVariables();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  uint64_t v3 = *MEMORY[0x263F1CEE8];
  int v4 = [v2 isSelected];

  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v5.receiver = self;
  v5.super_class = (Class)DOCSidebarItemCellAccessibility;
  v2 = [(DOCSidebarItemCellAccessibility *)&v5 _accessibilitySupplementaryFooterViews];
  uint64_t v3 = (void *)[v2 mutableCopy];

  objc_msgSend(v3, "ax_removeObjectsFromArrayUsingBlock:", &__block_literal_global_0);

  return v3;
}

uint64_t __73__DOCSidebarItemCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_SavetofilesDoc_5.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end