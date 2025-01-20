@interface PKEnhancedMerchantCollectionViewListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
@end

@implementation PKEnhancedMerchantCollectionViewListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKEnhancedMerchantCollectionViewListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKEnhancedMerchantCollectionViewListCell", @"detailedDescriptionLabel", "@", 0);
  [v3 validateClass:@"PKEnhancedMerchantCollectionViewListCell" hasInstanceVariable:@"_listContentView" withType:"UIListContentView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKEnhancedMerchantCollectionViewListCell", @"_visibleButtons", "@", 0);
  [v3 validateClass:@"UIButton" hasInstanceVariable:@"_targetActions" withType:"NSMutableArray"];
  [v3 validateClass:@"UIControlTargetAction" hasInstanceVariable:@"_actionHandler" withType:"UIAction"];
  [v3 validateClass:@"UIAction" hasInstanceVariable:@"_handler" withType:"@?"];
}

- (id)accessibilityLabel
{
  id v3 = [(PKEnhancedMerchantCollectionViewListCellAccessibility *)self safeValueForKey:@"_listContentView"];
  v4 = UIAXStringForAllChildren();
  v7 = [(PKEnhancedMerchantCollectionViewListCellAccessibility *)self safeValueForKey:@"detailedDescriptionLabel"];
  v5 = __UIAXStringForVariables();

  return v5;
}

- (id)accessibilityCustomActions
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(PKEnhancedMerchantCollectionViewListCellAccessibility *)self safeArrayForKey:@"_visibleButtons"];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v8 _accessibilityViewIsVisible])
        {
          objc_initWeak(&location, v8);
          id v9 = objc_alloc(MEMORY[0x263F1C390]);
          v10 = [v8 accessibilityLabel];
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __83__PKEnhancedMerchantCollectionViewListCellAccessibility_accessibilityCustomActions__block_invoke;
          v13[3] = &unk_265140DF0;
          objc_copyWeak(&v14, &location);
          v11 = (void *)[v9 initWithName:v10 actionHandler:v13];
          [v3 addObject:v11];

          objc_destroyWeak(&v14);
          objc_destroyWeak(&location);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return v3;
}

BOOL __83__PKEnhancedMerchantCollectionViewListCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained safeArrayForKey:@"_targetActions"];
  uint64_t v6 = [v5 firstObject];
  v7 = [v6 safeValueForKey:@"_actionHandler"];
  v8 = __UIAccessibilityCastAsClass();

  uint64_t v9 = [v8 safeValueForKey:@"_handler"];
  v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);
  }

  return v10 != 0;
}

@end