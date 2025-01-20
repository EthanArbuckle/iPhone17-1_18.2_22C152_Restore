@interface HUCalendarScrubberViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_axLoadAccessibilityInformationForCalendarCell:(id)a3 atIndexPath:(id)a4;
@end

@implementation HUCalendarScrubberViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUCalendarScrubberViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUCalendarScrubberViewController" isKindOfClass:@"UICollectionViewController"];
  [v3 validateClass:@"HUCalendarScrubberViewController" hasInstanceVariable:@"_dataSource" withType:"HUCalendarScrubberDataSource"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCalendarScrubberDataSource", @"dateAtIndexPath:", "@", 0);
}

- (void)_axLoadAccessibilityInformationForCalendarCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setIsAccessibilityElement:1];
  id location = 0;
  p_id location = &location;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v16[1] = (id)MEMORY[0x263EF8330];
  v16[2] = (id)3221225472;
  v16[3] = __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke;
  v16[4] = &unk_265128060;
  v16[7] = &location;
  v16[5] = self;
  id v8 = v7;
  v16[6] = v8;
  AXPerformSafeBlock();
  id v9 = p_location[5];

  _Block_object_dispose(&location, 8);
  v10 = AXDateStringForFormat();
  [v6 setAccessibilityLabel:v10];

  objc_initWeak(&location, v6);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke_2;
  v15[3] = &unk_265128088;
  objc_copyWeak(v16, &location);
  [v6 _setAccessibilityTraitsBlock:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke_3;
  v13[3] = &unk_265128018;
  objc_copyWeak(&v14, &location);
  [v6 _setAccessibilityValueBlock:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke_4;
  v11[3] = &unk_265128018;
  objc_copyWeak(&v12, &location);
  [v6 _setAccessibilityHintBlock:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"_dataSource"];
  uint64_t v2 = [v5 dateAtIndexPath:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263F1CEE8];
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = [WeakRetained isSelected];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F1CF38];
    return *v5 | v1;
  }
  id v6 = objc_loadWeakRetained(v2);
  char v7 = [v6 isUserInteractionEnabled];

  if ((v7 & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x263F1CF20];
    return *v5 | v1;
  }
  return v1;
}

id __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isUserInteractionEnabled])
  {
    uint64_t v2 = accessibilityHomeUILocalizedString(@"camera.calendar.cell.clips.available");
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id __108__HUCalendarScrubberViewControllerAccessibility__axLoadAccessibilityInformationForCalendarCell_atIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isUserInteractionEnabled])
  {
    uint64_t v2 = accessibilityHomeUILocalizedString(@"camera.calendar.cell.hint");
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
  v9.super_class = (Class)HUCalendarScrubberViewControllerAccessibility;
  id v6 = a4;
  char v7 = [(HUCalendarScrubberViewControllerAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  -[HUCalendarScrubberViewControllerAccessibility _axLoadAccessibilityInformationForCalendarCell:atIndexPath:](self, "_axLoadAccessibilityInformationForCalendarCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

@end