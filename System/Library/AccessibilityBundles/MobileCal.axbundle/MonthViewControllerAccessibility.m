@interface MonthViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsCommittingTimeAdjustment;
- (id)_axTopWeekViewWithTopPoint:(CGPoint)a3;
- (id)accessibilityScrollStatusForScrollView:(id)a3;
- (id)eventGestureController:(id)a3 setUpAtPoint:(CGPoint)a4 withOccurrence:(id)a5 forceNewEvent:(BOOL)a6;
- (id)scrollView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateView;
- (void)_axSetIsCommittingTimeAdjustment:(BOOL)a3;
- (void)_updateDraggingOffsetTimesForPoint:(CGPoint)a3;
- (void)eventGestureController:(id)a3 commitToPoint:(CGPoint)a4;
- (void)viewDidLoad;
@end

@implementation MonthViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MonthViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MonthViewController" isKindOfClass:@"InfiniteScrollViewController"];
  [v3 validateClass:@"MonthViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"InfiniteScrollViewController", @"scrollView", "@", 0);
  [v3 validateProtocol:@"InfiniteScrollViewSubview" hasMethod:@"calendarDate" isInstanceMethod:1 isRequired:1];
  [v3 validateClass:@"InfiniteScrollViewController" hasInstanceVariable:@"_views" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MonthViewController", @"eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", "@", "@", "{CGPoint=dd}", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MonthViewController", @"_updateDraggingOffsetTimesForPoint:", "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MonthViewController", @"eventGestureController: commitToPoint:", "v", "@", "{CGPoint=dd}", 0);
  [v3 validateClass:@"MonthViewController" hasInstanceVariable:@"_draggedOccurrence" withType:"EKEvent"];
  [v3 validateClass:@"MonthViewController" hasInstanceVariable:@"_draggingExistingEvent" withType:"B"];
}

- (id)_axTopWeekViewWithTopPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v21 = 0;
  objc_opt_class();
  v6 = [(MonthViewControllerAccessibility *)self safeValueForKey:@"scrollView"];
  v7 = __UIAccessibilityCastAsClass();

  v8 = [(MonthViewControllerAccessibility *)self view];
  objc_msgSend(v7, "convertPoint:fromView:", v8, x, y);
  double v10 = v9;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = [(MonthViewControllerAccessibility *)self safeValueForKey:@"_views", 0];
  id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v15 frame];
        if (v10 < CGRectGetMidY(v25))
        {
          id v12 = v15;
          goto LABEL_11;
        }
      }
      id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v12;
}

- (id)accessibilityScrollStatusForScrollView:(id)a3
{
  [a3 contentInset];
  v5 = -[MonthViewControllerAccessibility _axTopWeekViewWithTopPoint:](self, "_axTopWeekViewWithTopPoint:", 0.0, v4);
  v6 = [v5 safeValueForKey:@"calendarDate"];
  v7 = [v6 date];
  v8 = AXDateStringForFormat();

  return v8;
}

- (void)_axAnnotateView
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 view];
  [v3 accessibilitySetIdentification:@"_AXMonthViewIdentifier"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MonthViewControllerAccessibility;
  [(MonthViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MonthViewControllerAccessibility *)self _axAnnotateView];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MonthViewControllerAccessibility;
  [(MonthViewControllerAccessibility *)&v3 viewDidLoad];
  [(MonthViewControllerAccessibility *)self _axAnnotateView];
}

- (id)scrollView
{
  v5.receiver = self;
  v5.super_class = (Class)MonthViewControllerAccessibility;
  v2 = [(MonthViewControllerAccessibility *)&v5 scrollView];
  [v2 setAccessibilityContainerType:4];
  objc_super v3 = accessibilityLocalizedString(@"months.container");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (id)eventGestureController:(id)a3 setUpAtPoint:(CGPoint)a4 withOccurrence:(id)a5 forceNewEvent:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MonthViewControllerAccessibility;
  uint64_t v13 = -[MonthViewControllerAccessibility eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:](&v22, sel_eventGestureController_setUpAtPoint_withOccurrence_forceNewEvent_, v11, v12, v6, x, y);
  if (UIAccessibilityIsVoiceOverRunning()
    && ([(MonthViewControllerAccessibility *)self safeBoolForKey:@"_draggingExistingEvent"] & 1) == 0)
  {
    _AXAssert();
  }
  objc_opt_class();
  v14 = [(MonthViewControllerAccessibility *)self safeValueForKey:@"_draggedOccurrence"];
  v15 = __UIAccessibilityCastAsClass();

  if (v15 && [v15 isEditable])
  {
    v16 = NSString;
    long long v17 = accessibilityLocalizedString(@"began.time.adjust");
    long long v18 = [v15 startDate];
    long long v19 = AXDateStringForFormat();
    long long v20 = objc_msgSend(v16, "stringWithFormat:", v17, v19);

    UIAccessibilitySpeak();
  }

  return v13;
}

- (BOOL)_axIsCommittingTimeAdjustment
{
  return MEMORY[0x270F0A438](self, &__LargeMonthViewControllerAccessibility___axIsCommittingTimeAdjustment);
}

- (void)_axSetIsCommittingTimeAdjustment:(BOOL)a3
{
}

- (void)_updateDraggingOffsetTimesForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v18 = 0;
  objc_opt_class();
  BOOL v6 = [(MonthViewControllerAccessibility *)self safeValueForKey:@"_draggedStartDate"];
  v7 = __UIAccessibilityCastAsClass();

  v17.receiver = self;
  v17.super_class = (Class)MonthViewControllerAccessibility;
  -[MonthViewControllerAccessibility _updateDraggingOffsetTimesForPoint:](&v17, sel__updateDraggingOffsetTimesForPoint_, x, y);
  char v18 = 0;
  objc_opt_class();
  v8 = [(MonthViewControllerAccessibility *)self safeValueForKey:@"_draggingEvent"];
  double v9 = __UIAccessibilityCastAsClass();

  if (v18) {
    goto LABEL_14;
  }
  if (v9 && [v9 isEditable])
  {
    char v18 = 0;
    objc_opt_class();
    double v10 = [(MonthViewControllerAccessibility *)self safeValueForKey:@"_draggedStartDate"];
    id v11 = __UIAccessibilityCastAsClass();

    if (!v18)
    {
      if ([(MonthViewControllerAccessibility *)self _axIsCommittingTimeAdjustment])
      {
        id v12 = NSString;
        uint64_t v13 = accessibilityLocalizedString(@"ended.time.adjust");
        v14 = [v11 date];
        v15 = AXDateStringForFormat();
        v16 = objc_msgSend(v12, "stringWithFormat:", v13, v15);
      }
      else
      {
        if ([v7 isEqual:v11])
        {
LABEL_12:

          goto LABEL_13;
        }
        uint64_t v13 = [v11 date];
        v16 = AXDateStringForFormat();
      }

      if (v16)
      {
        UIAccessibilitySpeak();
      }
      goto LABEL_12;
    }
LABEL_14:
    abort();
  }
LABEL_13:
}

- (void)eventGestureController:(id)a3 commitToPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  [(MonthViewControllerAccessibility *)self _axSetIsCommittingTimeAdjustment:1];
  v8.receiver = self;
  v8.super_class = (Class)MonthViewControllerAccessibility;
  -[MonthViewControllerAccessibility eventGestureController:commitToPoint:](&v8, sel_eventGestureController_commitToPoint_, v7, x, y);

  [(MonthViewControllerAccessibility *)self _axSetIsCommittingTimeAdjustment:0];
}

@end