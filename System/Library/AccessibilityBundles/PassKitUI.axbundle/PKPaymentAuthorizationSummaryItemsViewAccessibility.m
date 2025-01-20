@interface PKPaymentAuthorizationSummaryItemsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityPaymentSummaryItemsElements;
- (id)accessibilityElements;
- (void)_setAccessibilityPaymentSummaryItemsElements:(id)a3;
@end

@implementation PKPaymentAuthorizationSummaryItemsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentAuthorizationSummaryItemsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityPaymentSummaryItemsElements
{
}

- (void)_setAccessibilityPaymentSummaryItemsElements:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaymentAuthorizationSummaryItemsView" hasInstanceVariable:@"_titleViews" withType:"NSMutableArray"];
  [v3 validateClass:@"PKPaymentAuthorizationSummaryItemsView" hasInstanceVariable:@"_labelViews" withType:"NSMutableArray"];
  [v3 validateClass:@"PKPaymentAuthorizationSummaryItemsView" hasInstanceVariable:@"_valueViews" withType:"NSMutableArray"];
}

- (id)accessibilityElements
{
  id v3 = [(PKPaymentAuthorizationSummaryItemsViewAccessibility *)self _accessibilityPaymentSummaryItemsElements];
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = [(PKPaymentAuthorizationSummaryItemsViewAccessibility *)self safeArrayForKey:@"_titleViews"];
    v5 = [(PKPaymentAuthorizationSummaryItemsViewAccessibility *)self safeArrayForKey:@"_labelViews"];
    v6 = [(PKPaymentAuthorizationSummaryItemsViewAccessibility *)self safeArrayForKey:@"_valueViews"];
    v7 = objc_opt_new();
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __76__PKPaymentAuthorizationSummaryItemsViewAccessibility_accessibilityElements__block_invoke;
    v14 = &unk_2651410B8;
    id v8 = v4;
    id v15 = v8;
    id v9 = v6;
    id v16 = v9;
    v17 = self;
    objc_copyWeak(&v19, &location);
    id v3 = v7;
    id v18 = v3;
    [v5 enumerateObjectsUsingBlock:&v11];
    -[PKPaymentAuthorizationSummaryItemsViewAccessibility _setAccessibilityPaymentSummaryItemsElements:](self, "_setAccessibilityPaymentSummaryItemsElements:", v3, v11, v12, v13, v14);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v3;
}

void __76__PKPaymentAuthorizationSummaryItemsViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  v6 = __UIAccessibilityCastAsClass();
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    id v8 = 0;
  }
  else
  {
    objc_opt_class();
    v7 = [*(id *)(a1 + 32) axSafeObjectAtIndex:a3];
    id v8 = __UIAccessibilityCastAsClass();
  }
  v20 = v5;
  if ([*(id *)(a1 + 40) count] <= a3)
  {
    v10 = 0;
  }
  else
  {
    objc_opt_class();
    id v9 = [*(id *)(a1 + 40) axSafeObjectAtIndex:a3];
    v10 = __UIAccessibilityCastAsClass();
  }
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:*(void *)(a1 + 48)];
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v13 = __UIAccessibilityCastAsClass();

  [v13 size];
  [v6 size];
  [v10 size];
  [v13 origin];
  double v15 = v14;
  [v6 origin];
  [v11 setAccessibilityFrameInContainerSpace:v15];
  id v16 = [v8 accessibilityLabel];
  v17 = [v6 accessibilityLabel];
  id v18 = [v10 accessibilityLabel];
  id v19 = __UIAXStringForVariables();
  objc_msgSend(v11, "setAccessibilityLabel:", v19, v17, v18, @"__AXStringForVariablesSentinel");

  [*(id *)(a1 + 56) addObject:v11];
}

@end