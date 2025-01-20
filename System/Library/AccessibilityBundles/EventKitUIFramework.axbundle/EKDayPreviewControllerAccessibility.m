@interface EKDayPreviewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateDayView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EKDayPreviewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKDayPreviewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKDayPreviewController" hasInstanceVariable:@"_dayView" withType:"EKDayView"];
  [v3 validateClass:@"EKDayView" hasInstanceVariable:@"_dayContent" withType:"EKDayViewContent"];
  [v3 validateClass:@"EKDayViewContent" hasInstanceVariable:@"_grid" withType:"EKDayGridView"];
}

- (void)_axAnnotateDayView
{
  objc_opt_class();
  id v3 = [(EKDayPreviewControllerAccessibility *)self safeValueForKey:@"_dayView"];
  v4 = __UIAccessibilityCastAsSafeCategory();

  objc_opt_class();
  v5 = [v4 accessibilityScrollView];
  v6 = __UIAccessibilityCastAsSafeCategory();

  [v6 setAccessibilityIsPreviewDayGridScroller:1];
  objc_opt_class();
  v7 = [v4 safeValueForKey:@"_dayContent"];
  v8 = [v7 safeValueForKey:@"_grid"];
  v9 = __UIAccessibilityCastAsSafeCategory();

  [v9 setAccessibilityIsPreviewGridView:1];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)EKDayPreviewControllerAccessibility;
  [(EKDayPreviewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(EKDayPreviewControllerAccessibility *)self _axAnnotateDayView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKDayPreviewControllerAccessibility;
  [(EKDayPreviewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(EKDayPreviewControllerAccessibility *)self _axAnnotateDayView];
}

@end