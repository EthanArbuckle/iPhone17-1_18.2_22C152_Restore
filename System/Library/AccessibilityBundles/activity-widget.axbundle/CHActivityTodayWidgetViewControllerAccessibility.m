@interface CHActivityTodayWidgetViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axExerciseHeaderValueView;
- (id)_axMoveHeaderValueView;
- (id)_axStandHeaderValueView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetExerciseHeaderValueView:(id)a3;
- (void)_axSetMoveHeaderValueView:(id)a3;
- (void)_axSetStandHeaderValueView:(id)a3;
- (void)_axUpdateViewAccessibilityElements;
- (void)loadView;
- (void)setDeviceLocked:(BOOL)a3;
@end

@implementation CHActivityTodayWidgetViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHActivityTodayWidgetViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axMoveHeaderValueView
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__CHActivityTodayWidgetViewControllerAccessibility___axMoveHeaderValueView);
}

- (void)_axSetMoveHeaderValueView:(id)a3
{
}

- (id)_axExerciseHeaderValueView
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__CHActivityTodayWidgetViewControllerAccessibility___axExerciseHeaderValueView);
}

- (void)_axSetExerciseHeaderValueView:(id)a3
{
}

- (id)_axStandHeaderValueView
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__CHActivityTodayWidgetViewControllerAccessibility___axStandHeaderValueView);
}

- (void)_axSetStandHeaderValueView:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHActivityTodayWidgetViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHActivityTodayWidgetViewController", @"loadView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHActivityTodayWidgetViewController", @"ringView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHActivityTodayWidgetViewController", @"moveTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHActivityTodayWidgetViewController", @"moveValueLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHActivityTodayWidgetViewController", @"exerciseTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHActivityTodayWidgetViewController", @"exerciseValueLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHActivityTodayWidgetViewController", @"standTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHActivityTodayWidgetViewController", @"standValueLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHActivityTodayWidgetViewController", @"setDeviceLocked:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHActivityTodayWidgetViewController", @"isDeviceLocked", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CHActivityTodayWidgetViewControllerAccessibility;
  [(CHActivityTodayWidgetViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CHActivityTodayWidgetViewControllerAccessibility *)self _axUpdateViewAccessibilityElements];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)CHActivityTodayWidgetViewControllerAccessibility;
  [(CHActivityTodayWidgetViewControllerAccessibility *)&v3 loadView];
  [(CHActivityTodayWidgetViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_axUpdateViewAccessibilityElements
{
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 view];

  if ([(CHActivityTodayWidgetViewControllerAccessibility *)self safeBoolForKey:@"isDeviceLocked"])
  {
    v5 = [(CHActivityTodayWidgetViewControllerAccessibility *)self safeValueForKey:@"deviceLockedLabel"];
    v6 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 1, v5);
  }
  else
  {
    v7 = [(CHActivityTodayWidgetViewControllerAccessibility *)self _axMoveHeaderValueView];

    if (!v7)
    {
      v8 = [(CHActivityTodayWidgetViewControllerAccessibility *)self safeValueForKey:@"moveTitleLabel"];
      uint64_t v9 = [(CHActivityTodayWidgetViewControllerAccessibility *)self safeValueForKey:@"moveValueLabel"];
      v10 = (void *)v9;
      if (v8 && v9)
      {
        v11 = [AXActivityWidgetHeaderValueView alloc];
        v33[0] = v8;
        v33[1] = v10;
        v12 = +[NSArray arrayWithObjects:v33 count:2];
        v13 = [(AXActivityWidgetHeaderValueView *)v11 initWithAccessibilityContainer:self representedElements:v12];

        [(AXActivityWidgetHeaderValueView *)v13 setHeaderView:v8];
        [(AXActivityWidgetHeaderValueView *)v13 setValueView:v10];
        [(CHActivityTodayWidgetViewControllerAccessibility *)self _axSetMoveHeaderValueView:v13];
      }
    }
    v14 = [(CHActivityTodayWidgetViewControllerAccessibility *)self _axExerciseHeaderValueView];

    if (!v14)
    {
      v15 = [(CHActivityTodayWidgetViewControllerAccessibility *)self safeValueForKey:@"exerciseTitleLabel"];
      uint64_t v16 = [(CHActivityTodayWidgetViewControllerAccessibility *)self safeValueForKey:@"exerciseValueLabel"];
      v17 = (void *)v16;
      if (v15 && v16)
      {
        v18 = [AXActivityWidgetHeaderValueView alloc];
        v32[0] = v15;
        v32[1] = v17;
        v19 = +[NSArray arrayWithObjects:v32 count:2];
        v20 = [(AXActivityWidgetHeaderValueView *)v18 initWithAccessibilityContainer:self representedElements:v19];

        [(AXActivityWidgetHeaderValueView *)v20 setHeaderView:v15];
        [(AXActivityWidgetHeaderValueView *)v20 setValueView:v17];
        [(CHActivityTodayWidgetViewControllerAccessibility *)self _axSetExerciseHeaderValueView:v20];
      }
    }
    v21 = [(CHActivityTodayWidgetViewControllerAccessibility *)self _axStandHeaderValueView];

    if (!v21)
    {
      v22 = [(CHActivityTodayWidgetViewControllerAccessibility *)self safeValueForKey:@"standTitleLabel"];
      uint64_t v23 = [(CHActivityTodayWidgetViewControllerAccessibility *)self safeValueForKey:@"standValueLabel"];
      v24 = (void *)v23;
      if (v22 && v23)
      {
        v25 = [AXActivityWidgetHeaderValueView alloc];
        v31[0] = v22;
        v31[1] = v24;
        v26 = +[NSArray arrayWithObjects:v31 count:2];
        v27 = [(AXActivityWidgetHeaderValueView *)v25 initWithAccessibilityContainer:self representedElements:v26];

        [(AXActivityWidgetHeaderValueView *)v27 setHeaderView:v22];
        [(AXActivityWidgetHeaderValueView *)v27 setValueView:v24];
        [(CHActivityTodayWidgetViewControllerAccessibility *)self _axSetStandHeaderValueView:v27];
      }
    }
    v5 = [(CHActivityTodayWidgetViewControllerAccessibility *)self safeValueForKey:@"ringView"];
    v28 = [(CHActivityTodayWidgetViewControllerAccessibility *)self _axMoveHeaderValueView];
    v29 = [(CHActivityTodayWidgetViewControllerAccessibility *)self _axExerciseHeaderValueView];
    v30 = [(CHActivityTodayWidgetViewControllerAccessibility *)self _axStandHeaderValueView];
    v6 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 4, v5, v28, v29, v30);
  }
  [v4 setAccessibilityElements:v6];
}

- (void)setDeviceLocked:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHActivityTodayWidgetViewControllerAccessibility;
  [(CHActivityTodayWidgetViewControllerAccessibility *)&v4 setDeviceLocked:a3];
  [(CHActivityTodayWidgetViewControllerAccessibility *)self _axUpdateViewAccessibilityElements];
}

@end