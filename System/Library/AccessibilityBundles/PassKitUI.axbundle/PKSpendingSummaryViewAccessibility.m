@interface PKSpendingSummaryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation PKSpendingSummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKSpendingSummaryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKSpendingSummaryView" hasInstanceVariable:@"_chartView" withType:"PKSpendingSummaryChartView"];
  [v3 validateClass:@"PKSpendingSummaryView" hasInstanceVariable:@"_arrowImageView" withType:"UIImageView"];
  [v3 validateClass:@"PKSpendingSummaryView" hasInstanceVariable:@"_spendingLabel" withType:"UILabel"];
  [v3 validateClass:@"PKSpendingSummaryView" hasInstanceVariable:@"_totalAmount" withType:"UILabel"];
  [v3 validateClass:@"PKSpendingSummaryView" hasInstanceVariable:@"_upArrow" withType:"UIImage"];
}

- (id)accessibilityElements
{
  id v3 = [(PKSpendingSummaryViewAccessibility *)self _accessibilityValueForKey:@"axElement"];
  if (!v3)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    [(PKSpendingSummaryViewAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"axElement"];
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__PKSpendingSummaryViewAccessibility_accessibilityElements__block_invoke;
    v10[3] = &unk_265141240;
    v10[4] = self;
    objc_copyWeak(&v11, &location);
    [v3 _setAccessibilityLabelBlock:v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__PKSpendingSummaryViewAccessibility_accessibilityElements__block_invoke_2;
    v8[3] = &unk_265141188;
    objc_copyWeak(&v9, &location);
    [v3 _setAccessibilityFrameBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  v4 = (void *)MEMORY[0x263EFF8C0];
  v5 = [(PKSpendingSummaryViewAccessibility *)self safeUIViewForKey:@"_chartView"];
  v6 = objc_msgSend(v4, "axArrayByIgnoringNilElementsWithCount:", 2, v3, v5);

  return v6;
}

id __59__PKSpendingSummaryViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) safeUIViewForKey:@"_upOrDownImage"];
  int v3 = [v2 _accessibilityViewIsVisible];

  if (v3)
  {
    objc_opt_class();
    v4 = [*(id *)(a1 + 32) safeUIViewForKey:@"_arrowImageView"];
    v5 = __UIAccessibilityCastAsClass();

    v6 = [v5 image];
    [*(id *)(a1 + 32) valueForKey:@"_upArrow"];
  }
  v7 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = [WeakRetained safeUIViewForKey:@"_spendingLabel"];
  v10 = [v9 accessibilityLabel];
  id v11 = objc_loadWeakRetained(v7);
  v12 = [v11 safeUIViewForKey:@"_totalAmount"];
  v15 = [v12 accessibilityLabel];
  v13 = __UIAXStringForVariables();

  return v13;
}

double __59__PKSpendingSummaryViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained safeUIViewForKey:@"_spendingLabel"];
  [v3 accessibilityFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  id v12 = objc_loadWeakRetained(v1);
  v13 = [v12 safeUIViewForKey:@"_totalAmount"];
  [v13 accessibilityFrame];
  v21.origin.x = v14;
  v21.origin.y = v15;
  v21.size.width = v16;
  v21.size.height = v17;
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  *(void *)&double v18 = (unint64_t)CGRectUnion(v20, v21);

  return v18;
}

@end