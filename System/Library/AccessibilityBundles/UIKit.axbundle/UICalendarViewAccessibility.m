@interface UICalendarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (id)_accessibilityFuzzyHitTestElements;
- (id)_configuedCellForCollectionView:(id)a3 indexPath:(id)a4 day:(id)a5;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityUpdateVisibleMonth;
- (void)_axMarkupSubviews;
- (void)_setVisibleMonth:(id)a3 animated:(BOOL)a4 updateDataSource:(BOOL)a5 updateCollectionView:(BOOL)a6 notifyDelegate:(BOOL)a7;
- (void)_setupViewHierarchy;
@end

@implementation UICalendarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICalendarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  id v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UICalendarView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v3 = "v";
  [location[0] validateClass:@"UICalendarView" hasInstanceMethod:@"_setupViewHierarchy" withFullSignature:0];
  [location[0] validateClass:v4 hasInstanceVariable:@"_dataModel" withType:"_UICalendarDataModel"];
  v6 = "@";
  [location[0] validateClass:@"_UICalendarDataModel" hasInstanceMethod:@"visibleMonth" withFullSignature:0];
  v8 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_setVisibleMonth:animated:updateDataSource:updateCollectionView:notifyDelegate:", v3, v6, "B", "B", "B", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_configuedCellForCollectionView: indexPath: day:", v6, v6, v6, 0);
  v7 = @"_UIDatePickerCalendarDay";
  v5 = @"_UIDatePickerCalendarDateComponent";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"date", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"components", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"month", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"isToday", v8, 0);
  objc_storeStrong(v10, v9);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UICalendarViewAccessibility;
  [(UICalendarViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  -[UICalendarViewAccessibility _axMarkupSubviews](v4);
  [(UICalendarViewAccessibility *)v4 _accessibilityUpdateVisibleMonth];
}

- (void)_axMarkupSubviews
{
  id v9 = a1;
  if (a1)
  {
    char v7 = 0;
    objc_opt_class();
    id v1 = (id)[v9 safeValueForKey:@"_collectionView"];
    id v6 = (id)__UIAccessibilityCastAsClass();

    id v5 = v6;
    objc_storeStrong(&v6, 0);
    id v8 = v5;
    char v4 = 0;
    objc_opt_class();
    id v3 = (id)__UIAccessibilityCastAsSafeCategory();
    id v2 = v3;
    objc_storeStrong(&v3, 0);
    -[UICollectionViewAccessibility _axSetShouldIgnorePromiseRegions:]((uint64_t)v2);

    [v8 setAccessibilityShouldBypassCollectionViewAccessibility:1];
    objc_storeStrong(&v8, 0);
  }
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityFuzzyHitTestElements
{
  return (id)-[UICalendarViewAccessibility _accessibleSubviews:](self, "_accessibleSubviews:", 1, a2, self);
}

- (void)_setupViewHierarchy
{
  char v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UICalendarViewAccessibility;
  [(UICalendarViewAccessibility *)&v2 _setupViewHierarchy];
  -[UICalendarViewAccessibility _axMarkupSubviews](v4);
}

- (id)_configuedCellForCollectionView:(id)a3 indexPath:(id)a4 day:(id)a5
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = 0;
  objc_storeStrong(&v28, a4);
  id v27 = 0;
  objc_storeStrong(&v27, a5);
  v25.receiver = v30;
  v25.super_class = (Class)UICalendarViewAccessibility;
  id v26 = [(UICalendarViewAccessibility *)&v25 _configuedCellForCollectionView:location[0] indexPath:v28 day:v27];
  id v9 = v26;
  uint64_t v19 = MEMORY[0x263EF8330];
  int v20 = -1073741824;
  int v21 = 0;
  v22 = __77__UICalendarViewAccessibility__configuedCellForCollectionView_indexPath_day___block_invoke;
  v23 = &unk_2650AE4B8;
  id v24 = v27;
  [v9 _setAccessibilityLabelBlock:&v19];
  objc_initWeak(&v18, v30);
  id v10 = v26;
  uint64_t v11 = MEMORY[0x263EF8330];
  int v12 = -1073741824;
  int v13 = 0;
  v14 = __77__UICalendarViewAccessibility__configuedCellForCollectionView_indexPath_day___block_invoke_2;
  v15 = &unk_2650AE4E0;
  objc_copyWeak(&v17, &v18);
  id v16 = v27;
  [v10 _setIsAccessibilityElementBlock:&v11];
  id v6 = v26;
  objc_storeStrong(&v16, 0);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v18);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);

  return v6;
}

id __77__UICalendarViewAccessibility__configuedCellForCollectionView_indexPath_day___block_invoke(id *a1)
{
  v16[2] = a1;
  v16[1] = a1;
  char v15 = 0;
  objc_opt_class();
  id v10 = (id)[a1[4] safeValueForKey:@"components"];
  id v14 = (id)__UIAccessibilityCastAsClass();

  id v13 = v14;
  objc_storeStrong(&v14, 0);
  v16[0] = v13;
  id v6 = (id)[v13 calendar];
  id v12 = (id)[v6 dateFromComponents:v16[0]];

  id v8 = (id)[v16[0] calendar];
  id v7 = (id)[v8 timeZone];
  id v11 = (id)AXDateStringForFormatWithTimeZone();

  if ([a1[4] safeBoolForKey:@"isToday"])
  {
    id v5 = accessibilityLocalizedString(@"calendar.today");
    id v1 = (id)__UIAXStringForVariables();
    id v2 = v11;
    id v11 = v1;
  }
  id v4 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v16, 0);

  return v4;
}

uint64_t __77__UICalendarViewAccessibility__configuedCellForCollectionView_indexPath_day___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = (id)[WeakRetained safeValueForKeyPath:@"_dataModel.visibleMonth"];
  id v3 = (id)[*(id *)(a1 + 32) safeValueForKey:@"month"];
  char v6 = objc_msgSend(v4, "isEqual:");

  return v6 & 1;
}

- (void)_setVisibleMonth:(id)a3 animated:(BOOL)a4 updateDataSource:(BOOL)a5 updateCollectionView:(BOOL)a6 notifyDelegate:(BOOL)a7
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v15 = a4;
  BOOL v14 = a5;
  BOOL v13 = a6;
  BOOL v12 = a7;
  v11.receiver = v17;
  v11.super_class = (Class)UICalendarViewAccessibility;
  [(UICalendarViewAccessibility *)&v11 _setVisibleMonth:location[0] animated:a4 updateDataSource:a5 updateCollectionView:a6 notifyDelegate:a7];
  [(UICalendarViewAccessibility *)v17 _accessibilityUpdateVisibleMonth];
  objc_storeStrong(location, 0);
}

- (void)_accessibilityUpdateVisibleMonth
{
  id v8 = self;
  v7[1] = (id)a2;
  char v6 = 0;
  objc_opt_class();
  id v2 = (id)[(UICalendarViewAccessibility *)v8 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  id v5 = (id)__UIAccessibilityCastAsSafeCategory();

  id v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = v4;
  id v3 = 0;
  if (v4) {
    [v7[0] _accessibilityClearChildren];
  }
  if (!v7[0] || UIAccessibilityIsSwitchControlRunning()) {
    objc_storeStrong(&v3, (id)*MEMORY[0x263F21A78]);
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v3);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v7, 0);
}

@end