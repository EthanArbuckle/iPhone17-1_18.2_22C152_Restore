@interface PaletteWeekdayHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (PaletteWeekdayHeaderViewAccessibility)initWithNavigationPalette:(id)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation PaletteWeekdayHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PaletteWeekdayHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PaletteWeekdayHeaderView" hasInstanceVariable:@"_weekdayLabels" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PaletteWeekdayHeaderView", @"layoutSubviews", "v", 0);
}

- (PaletteWeekdayHeaderViewAccessibility)initWithNavigationPalette:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PaletteWeekdayHeaderViewAccessibility;
  id v3 = [(PaletteWeekdayHeaderViewAccessibility *)&v5 initWithNavigationPalette:a3];
  [(PaletteWeekdayHeaderViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PaletteWeekdayHeaderViewAccessibility;
  [(PaletteWeekdayHeaderViewAccessibility *)&v3 layoutSubviews];
  [(PaletteWeekdayHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  if (_accessibilityLoadAccessibilityInformation_onceToken != -1) {
    dispatch_once(&_accessibilityLoadAccessibilityInformation_onceToken, &__block_literal_global_2);
  }
  objc_super v3 = [(id)_accessibilityLoadAccessibilityInformation_DateFormatter standaloneWeekdaySymbols];
  v4 = [(PaletteWeekdayHeaderViewAccessibility *)self accessibilityElements];
  char v14 = 0;
  objc_opt_class();
  objc_super v5 = __UIAccessibilityCastAsClass();
  [v5 bounds];
  v10[1] = 3221225472;
  v10[0] = _NSConcreteStackBlock;
  v10[2] = __83__PaletteWeekdayHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v10[3] = &unk_18720;
  v10[4] = self;
  id v11 = v3;
  double v12 = v6 / 7.0;
  uint64_t v13 = v7;
  id v8 = v3;
  [v4 enumerateObjectsUsingBlock:v10];
  v9.receiver = self;
  v9.super_class = (Class)PaletteWeekdayHeaderViewAccessibility;
  [(PaletteWeekdayHeaderViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
}

void __83__PaletteWeekdayHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id a1)
{
  _accessibilityLoadAccessibilityInformation_DateFormatter = (uint64_t)objc_alloc_init((Class)NSDateFormatter);

  _objc_release_x1();
}

void __83__PaletteWeekdayHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  [v5 setAccessibilityContainer:*(void *)(a1 + 32)];
  if ((unint64_t)[*(id *)(a1 + 40) count] > a3)
  {
    [v5 setIsAccessibilityElement:1];
    LOBYTE(location) = 0;
    objc_opt_class();
    double v6 = __UIAccessibilityCastAsClass();
    objc_initWeak(&location, v6);
    if (v6 && *(double *)(a1 + 48) > 0.0 && *(double *)(a1 + 56) > 0.0)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = __83__PaletteWeekdayHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
      v7[3] = &unk_186F8;
      objc_copyWeak(&v8, &location);
      long long v9 = *(_OWORD *)(a1 + 48);
      [v5 _setAccessibilityFrameBlock:v7];
      objc_destroyWeak(&v8);
    }
    objc_destroyWeak(&location);
  }
}

double __83__PaletteWeekdayHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained bounds];
  double v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;

  CGFloat v10 = v5 - v9;
  CGFloat v11 = *(double *)(a1 + 40);
  CGFloat v12 = *(double *)(a1 + 48);
  uint64_t v13 = (UIView *)objc_loadWeakRetained(v2);
  v16.origin.x = v10;
  v16.origin.y = v7;
  v16.size.width = v11;
  v16.size.height = v12;
  *(void *)&double v14 = (unint64_t)UIAccessibilityConvertFrameToScreenCoordinates(v16, v13);

  return v14;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double x = a3.x;
  [(PaletteWeekdayHeaderViewAccessibility *)self bounds];
  unint64_t v7 = vcvtmd_u64_f64(x / (v6 / 7.0));
  double v8 = [(PaletteWeekdayHeaderViewAccessibility *)self accessibilityElements];
  if ((unint64_t)[v8 count] <= v7)
  {
    double v9 = 0;
  }
  else
  {
    double v9 = [v8 objectAtIndexedSubscript:v7];
  }

  return v9;
}

- (id)accessibilityElements
{
  v2 = [(PaletteWeekdayHeaderViewAccessibility *)self safeValueForKey:@"_weekdayLabels"];
  objc_super v3 = __UIAccessibilitySafeClass();

  return v3;
}

@end