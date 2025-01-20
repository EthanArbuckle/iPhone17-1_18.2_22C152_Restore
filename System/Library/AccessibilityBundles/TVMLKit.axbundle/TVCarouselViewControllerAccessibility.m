@interface TVCarouselViewControllerAccessibility
@end

@implementation TVCarouselViewControllerAccessibility

id __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeUIViewForKey:@"headerView"];
  v3 = [v2 subviews];
  v4 = MEMORY[0x245666360]();

  return v4;
}

id __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 safeIntegerForKey:@"currentPage"];
  v4 = [WeakRetained safeValueForKey:@"_collectionElement"];
  v5 = [v4 safeArrayForKey:@"sections"];
  v6 = [v5 firstObject];

  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id v13 = v6;
  AXPerformSafeBlock();
  id v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  v8 = [v7 safeDictionaryForKey:@"_dataDictionary"];

  v9 = [v8 objectForKey:@"ImageAX"];

  v12 = [v3 accessibilityValue];
  v10 = __UIAXStringForVariables();

  return v10;
}

uint64_t __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_320(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) elementForItemAtIndex:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

void __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2_328(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityIncrement];
}

void __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityDecrement];
}

@end