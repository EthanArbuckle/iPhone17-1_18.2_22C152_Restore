@interface PaletteViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)currentSelectedDateChanged:(id)a3;
- (void)viewDidLoad;
@end

@implementation PaletteViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PaletteViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PaletteViewController" hasInstanceVariable:@"_paletteView" withType:"PaletteWeekdayHeaderView"];
  [v3 validateClass:@"PaletteWeekdayHeaderView" hasInstanceVariable:@"_weekdayLabels" withType:"NSMutableArray"];
  [v3 validateClass:@"PaletteViewController" hasInstanceVariable:@"_paletteScrollVC" withType:"PaletteScrollViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PaletteScrollViewController", @"activitySummaryProvider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ActivitySummaryCache", @"activitySummaryForCacheIndex:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ActivitySummaryCache", @"fitnessStartOfWeekOffset", "q", 0);
  [v3 validateClass:@"PaletteViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PaletteViewController", @"currentSelectedDateChanged:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v49.receiver = self;
  v49.super_class = (Class)PaletteViewControllerAccessibility;
  [(PaletteViewControllerAccessibility *)&v49 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = v3;
  v5 = [v3 view];
  v6 = [(PaletteViewControllerAccessibility *)self safeValueForKey:@"_paletteView"];
  v7 = [(PaletteViewControllerAccessibility *)self safeValueForKey:@"_paletteView"];
  v8 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 1, v7);
  [v5 setAccessibilityElements:v8];

  objc_opt_class();
  v9 = [(PaletteViewControllerAccessibility *)self safeValueForKey:@"_paletteScrollVC"];
  v10 = __UIAccessibilityCastAsClass();

  v37 = v5;
  v38 = v4;
  LOBYTE(v42) = 0;
  v36 = v6;
  v11 = [v6 safeValueForKey:@"_weekdayLabels"];
  v12 = __UIAccessibilitySafeClass();

  v39 = [v10 safeValueForKey:@"activitySummaryProvider"];
  v41 = +[NSCalendar currentCalendar];
  v40 = +[NSDate date];
  v35 = v10;
  v13 = [v10 safeValueForKey:@"_currentWeekStartDate"];
  int v14 = 0;
  for (uint64_t i = 0; i != 7; ++i)
  {
    v16 = [v13 dateByAddingTimeInterval:(double)v14];
    if ([v41 isDate:v16 inSameDayAsDate:v40])
    {
      v17 = accessibilityLocalizedString(@"today.indicator");
    }
    else
    {
      v17 = 0;
    }
    v34 = AXDateStringForFormat();
    v18 = __UIAXStringForVariables();

    v19 = objc_msgSend(v12, "objectAtIndexedSubscript:", i, v34, @"__AXStringForVariablesSentinel");
    [v19 setAccessibilityLabel:v18];

    char v48 = 0;
    objc_opt_class();
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__1;
    v46 = __Block_byref_object_dispose__1;
    id v47 = 0;
    id v20 = v39;
    id v21 = v16;
    AXPerformSafeBlock();
    id v22 = (id)v43[5];

    _Block_object_dispose(&v42, 8);
    v23 = __UIAccessibilityCastAsClass();

    if (v48) {
      abort();
    }
    [v23 _activeEnergyCompletionPercentage];
    if (v24 < 0.0) {
      goto LABEL_13;
    }
    [v23 safeDoubleForKey:@"_exerciseTimeCompletionPercentage"];
    if (v25 < 0.0) {
      goto LABEL_13;
    }
    [v23 _standHoursCompletionPercentage];
    if (v26 < 0.0
      || ([v23 _activeEnergyCompletionPercentage],
          double v28 = v27,
          [v23 safeDoubleForKey:@"_exerciseTimeCompletionPercentage"],
          double v30 = v29,
          [v23 _standHoursCompletionPercentage],
          [v23 _fitnessUIAccessibilityDescriptionForPercentages:1 exercisingPercentage:v28 standingPercentage:v30 arePercentagesCapped:v31], (v32 = objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_13:
      v32 = accessibilityLocalizedString(@"no.data");
    }
    v33 = [v12 objectAtIndexedSubscript:i];
    [v33 setAccessibilityValue:v32];

    v14 += 86400;
  }
}

uint64_t __80__PaletteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) activitySummaryForCacheIndex:CHCacheIndexForDate(*(void **)(a1 + 40))];

  return _objc_release_x1();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PaletteViewControllerAccessibility;
  [(PaletteViewControllerAccessibility *)&v3 viewDidLoad];
  [(PaletteViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)currentSelectedDateChanged:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PaletteViewControllerAccessibility;
  [(PaletteViewControllerAccessibility *)&v4 currentSelectedDateChanged:a3];
  [(PaletteViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end