@interface MiroEditorClipCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
@end

@implementation MiroEditorClipCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MiroEditorClipCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MiroEditorFlowLayout"];
  [v3 validateClass:@"MiroEditorClipCollectionViewController" isKindOfClass:@"UICollectionViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroEditorFlowLayout", @"snappedIndexPath", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroEditorClipCollectionViewController", @"snapToIndexPath: animated:", "v", "@", "B", 0);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  char v27 = 0;
  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  v6 = [v5 collectionView];

  v7 = [v6 collectionViewLayout];
  MEMORY[0x2455E2920](@"MiroEditorFlowLayout");
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v8 = [v6 numberOfItemsInSection:0];
  char v27 = 0;
  objc_opt_class();
  v9 = [v7 safeValueForKey:@"snappedIndexPath"];
  v10 = __UIAccessibilityCastAsClass();

  if (a3 == 2)
  {
    if ([v10 row] < v8 - 1)
    {
      v14 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v10, "row") + 1, 0);
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      v22 = __75__MiroEditorClipCollectionViewControllerAccessibility_accessibilityScroll___block_invoke_2;
      v23 = &unk_2650A36B0;
      v12 = (id *)v25;
      v24 = self;
      v25[0] = v14;
      id v13 = v14;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (a3 != 1 || [v10 row] < 1)
  {
LABEL_9:

LABEL_10:
    v19.receiver = self;
    v19.super_class = (Class)MiroEditorClipCollectionViewControllerAccessibility;
    BOOL v17 = [(MiroEditorClipCollectionViewControllerAccessibility *)&v19 accessibilityScroll:a3];
    goto LABEL_11;
  }
  v11 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v10, "row") - 1, 0);
  v25[1] = MEMORY[0x263EF8330];
  v25[2] = 3221225472;
  v25[3] = __75__MiroEditorClipCollectionViewControllerAccessibility_accessibilityScroll___block_invoke;
  v25[4] = &unk_2650A36B0;
  v12 = &v26;
  v25[5] = self;
  v26 = v11;
  id v13 = v11;
LABEL_8:
  AXPerformSafeBlock();
  UIAccessibilityNotifications v15 = *MEMORY[0x263F1CE18];
  v16 = [v6 cellForItemAtIndexPath:v13];
  UIAccessibilityPostNotification(v15, v16);

  BOOL v17 = 1;
LABEL_11:

  return v17;
}

uint64_t __75__MiroEditorClipCollectionViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapToIndexPath:*(void *)(a1 + 40) animated:1];
}

uint64_t __75__MiroEditorClipCollectionViewControllerAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapToIndexPath:*(void *)(a1 + 40) animated:1];
}

@end