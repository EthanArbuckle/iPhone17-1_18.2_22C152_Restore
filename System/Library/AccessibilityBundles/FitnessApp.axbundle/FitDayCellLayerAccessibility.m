@interface FitDayCellLayerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)activityCellImageWithDiameter:(double)a3 thickness:(double)a4 calories:(double)a5 briskMinutes:(double)a6 hourlyBreak:(double)a7 fadeInnerRings:(BOOL)a8 fadeAll:(BOOL)a9;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation FitDayCellLayerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitDayCellLayer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitDayCellLayer", @"date", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitDayCellLayer", @"isToday", "B", 0);
  [v3 validateClass:@"MonthWeekView"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"FitDayCellLayer", @"activityCellImageWithDiameter: thickness: calories: briskMinutes: hourlyBreak: fadeInnerRings: fadeAll:", "@", "d", "d", "d", "d", "d", "B", "B", 0);
}

+ (id)activityCellImageWithDiameter:(double)a3 thickness:(double)a4 calories:(double)a5 briskMinutes:(double)a6 hourlyBreak:(double)a7 fadeInnerRings:(BOOL)a8 fadeAll:(BOOL)a9
{
  BOOL v9 = a9;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___FitDayCellLayerAccessibility;
  v10 = objc_msgSendSuper2(&v13, "activityCellImageWithDiameter:thickness:calories:briskMinutes:hourlyBreak:fadeInnerRings:fadeAll:", a8, a3, a4, a5, a6, a7);
  if (v9)
  {
    v11 = accessibilityLocalizedString(@"no.data");
    [v10 setAccessibilityLabel:v11];
  }

  return v10;
}

- (id)accessibilityLabel
{
  if ([(FitDayCellLayerAccessibility *)self safeBoolForKey:@"isToday"])
  {
    id v3 = accessibilityLocalizedString(@"today");
  }
  else
  {
    id v3 = 0;
  }
  v4 = [(FitDayCellLayerAccessibility *)self safeValueForKey:@"date"];
  v5 = __UIAccessibilitySafeClass();

  v6 = [(FitDayCellLayerAccessibility *)self accessibilityContainer];
  AXSafeClassFromString();
  objc_opt_isKindOfClass();

  BOOL v9 = AXDateStringForFormat();
  v7 = __UIAXStringForVariables();

  return v7;
}

- (id)accessibilityValue
{
  v2 = [(FitDayCellLayerAccessibility *)self safeValueForKey:@"ringLayer"];
  id v3 = __UIAccessibilitySafeClass();

  v4 = [v3 contents];
  v5 = [v4 accessibilityLabel];

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end