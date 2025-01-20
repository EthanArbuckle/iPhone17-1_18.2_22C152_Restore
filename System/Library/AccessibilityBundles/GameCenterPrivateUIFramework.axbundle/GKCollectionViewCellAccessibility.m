@interface GKCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformCustomAction:(int64_t)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityCustomActions;
@end

@implementation GKCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKCollectionViewCell", @"editActionsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKEditAction", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKEditAction", @"selector", ":", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIApplication", @"_gkSendAction: viaResponder: withObject:", "B", ":", "@", "@", 0);
}

- (id)accessibilityCustomActions
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [(GKCollectionViewCellAccessibility *)self safeValueForKey:@"editActionsView"];
  id v3 = __UIAccessibilitySafeClass();

  v4 = [v3 safeValueForKey:@"_cell"];
  char v19 = 0;
  v5 = [v4 safeValueForKey:@"editActions"];
  v6 = __UIAccessibilitySafeClass();

  v7 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "safeValueForKey:", @"name", (void)v15);
        [v7 axSafelyAddObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (BOOL)accessibilityPerformCustomAction:(int64_t)a3
{
  v4 = [(GKCollectionViewCellAccessibility *)self safeValueForKey:@"editActionsView"];
  v5 = __UIAccessibilitySafeClass();

  v6 = [v5 safeValueForKey:@"_cell"];
  LOBYTE(v15[0]) = 0;
  v7 = [v6 safeValueForKey:@"editActions"];
  id v8 = __UIAccessibilitySafeClass();

  unint64_t v9 = [v8 count];
  if (v9 > a3)
  {
    uint64_t v10 = [v8 objectAtIndex:a3];
    uint64_t v11 = __UIAccessibilitySafeClass();

    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    id v14 = v11;
    AXPerformSafeBlock();

    _Block_object_dispose(v15, 8);
    id v13 = v6;
    AXPerformSafeBlock();
  }
  return v9 > a3;
}

uint64_t __70__GKCollectionViewCellAccessibility_accessibilityPerformCustomAction___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) selector];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __70__GKCollectionViewCellAccessibility_accessibilityPerformCustomAction___block_invoke_2(void *a1)
{
  id v2 = [MEMORY[0x263F1C408] sharedApplication];
  [v2 _gkSendAction:a1[6] viaResponder:a1[4] withObject:a1[5]];
}

- (id)_accessibilitySupplementaryFooterViews
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = [(GKCollectionViewCellAccessibility *)self safeValueForKey:@"editActionsView"];
  if ([v2 _accessibilityViewIsVisible])
  {
    v5[0] = v2;
    id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

@end