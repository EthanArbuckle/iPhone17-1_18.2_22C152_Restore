@interface MFConversationViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (id)_accessibilityMailSwipeActions;
- (id)_accessibilityMessageIndexDescription;
- (id)accessibilityCustomActions;
- (void)_accessibilityPerformMailSwipeAction:(id)a3;
@end

@implementation MFConversationViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFConversationViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MFConversationViewCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFConversationViewCell", @"itemID", "@", 0);
  [v3 validateClass:@"_MFConversationViewCollectionView" isKindOfClass:@"UICollectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIContextualAction", @"executePreHandlerWithView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIContextualAction", @"executeHandlerWithView:completionHandler:", "v", "@", "@?", 0);
  [v3 validateClass:@"MFSwipableCollectionViewLayout" isKindOfClass:@"UICollectionViewFlowLayout"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFSwipableCollectionViewLayout", @"swipeController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFSwipableCollectionViewLayout", @"swipeActionController:leadingSwipeConfigurationForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFSwipableCollectionViewLayout", @"swipeActionController:trailingSwipeConfigurationForItemAtIndexPath:", "@", "@", "@", 0);
  [v3 validateClass:@"ConversationViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewController", @"collectionViewDataSource", "@", 0);
  [v3 validateClass:@"ConversationViewControllerBase" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"countOfMessages", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewDiffableDataSource", @"snapshot", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSDiffableDataSourceSnapshot", @"itemIdentifiers", "@", 0);
  [v3 validateClass:@"MFGeneratedSummaryCollectionItemID"];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(MFConversationViewCellAccessibility *)self _accessibilityMailSwipeActions];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__MFConversationViewCellAccessibility_accessibilityCustomActions__block_invoke;
  v8[3] = &unk_265133448;
  id v5 = v3;
  id v9 = v5;
  v10 = self;
  [v4 enumerateObjectsUsingBlock:v8];

  id v6 = v5;
  return v6;
}

void __65__MFConversationViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 title];
  if ([v5 length])
  {
    id v3 = *(void **)(a1 + 32);
    v4 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v5 target:*(void *)(a1 + 40) selector:sel__accessibilityPerformMailSwipeAction_];
    [v3 addObject:v4];
  }
}

- (id)_accessibilityMessageIndexDescription
{
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uicollectionvi_0.isa)];
  id v5 = [v4 safeValueForKey:@"delegate"];
  unsigned int v6 = [v5 safeIntForKey:@"countOfMessages"];
  v7 = [v5 safeValueForKeyPath:@"collectionViewDataSource.snapshot.itemIdentifiers"];
  v8 = [v7 axFilterObjectsUsingBlock:&__block_literal_global_3];
  id v9 = [(MFConversationViewCellAccessibility *)self safeValueForKey:@"itemID"];
  uint64_t v10 = [v8 indexOfObject:v9];
  if (v6 < 2)
  {
    v15 = 0;
  }
  else
  {
    uint64_t v11 = (int)v6;
    uint64_t v12 = v10 + 1;
    v13 = NSString;
    v14 = accessibilityLocalizedString(@"thread.message.container.label");
    v15 = objc_msgSend(v13, "stringWithFormat:", v14, v12, v11);
  }

  return v15;
}

BOOL __76__MFConversationViewCellAccessibility__accessibilityMessageIndexDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Mfgeneratedsum.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)_accessibilityMailSwipeActions
{
  id v3 = [(MFConversationViewCellAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  v4 = [v3 collectionViewLayout];

  NSClassFromString(&cfstr_Mfswipablecoll_0.isa);
  if (objc_opt_isKindOfClass())
  {
    id v5 = [MEMORY[0x263EFF980] array];
    unsigned int v6 = [(MFConversationViewCellAccessibility *)self _accessibilityIndexPath];
    v7 = [v4 safeValueForKey:@"swipeController"];
    uint64_t v13 = MEMORY[0x263EF8330];
    id v14 = v4;
    v15 = v7;
    v16 = v6;
    v17 = v5;
    id v8 = v5;
    id v9 = v6;
    id v10 = v7;
    AXPerformSafeBlock();
    uint64_t v11 = objc_msgSend(v8, "axFilterObjectsUsingBlock:", &__block_literal_global_362, v13, 3221225472, __69__MFConversationViewCellAccessibility__accessibilityMailSwipeActions__block_invoke, &unk_265133490);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __69__MFConversationViewCellAccessibility__accessibilityMailSwipeActions__block_invoke(uint64_t a1)
{
  char v22 = 0;
  objc_opt_class();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  AXPerformSafeBlock();
  id v2 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  id v3 = __UIAccessibilityCastAsClass();

  if (v22) {
    goto LABEL_4;
  }
  v4 = *(void **)(a1 + 56);
  id v5 = [v3 actions];
  [v4 axSafelyAddObjectsFromArray:v5];

  char v22 = 0;
  objc_opt_class();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  AXPerformSafeBlock();
  id v6 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  v7 = __UIAccessibilityCastAsClass();

  if (v22) {
LABEL_4:
  }
    abort();
  id v8 = *(void **)(a1 + 56);
  id v9 = [v7 actions];
  [v8 axSafelyAddObjectsFromArray:v9];
}

uint64_t __69__MFConversationViewCellAccessibility__accessibilityMailSwipeActions__block_invoke_359(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) swipeActionController:*(void *)(a1 + 40) trailingSwipeConfigurationForItemAtIndexPath:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

uint64_t __69__MFConversationViewCellAccessibility__accessibilityMailSwipeActions__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) swipeActionController:*(void *)(a1 + 40) leadingSwipeConfigurationForItemAtIndexPath:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

BOOL __69__MFConversationViewCellAccessibility__accessibilityMailSwipeActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 title];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_accessibilityPerformMailSwipeAction:(id)a3
{
  id v4 = a3;
  id v5 = [(MFConversationViewCellAccessibility *)self _accessibilityMailSwipeActions];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__MFConversationViewCellAccessibility__accessibilityPerformMailSwipeAction___block_invoke;
  v7[3] = &unk_265133448;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __76__MFConversationViewCellAccessibility__accessibilityPerformMailSwipeAction___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v7 = [v6 title];
  id v8 = [*(id *)(a1 + 32) name];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = v6;
    AXPerformSafeBlock();
    *a4 = 1;
  }
}

uint64_t __76__MFConversationViewCellAccessibility__accessibilityPerformMailSwipeAction___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) executePreHandlerWithView:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 executeHandlerWithView:v3 completionHandler:0];
}

@end