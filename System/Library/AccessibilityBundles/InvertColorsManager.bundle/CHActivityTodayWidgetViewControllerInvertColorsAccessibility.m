@interface CHActivityTodayWidgetViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation CHActivityTodayWidgetViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHActivityTodayWidgetViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(CHActivityTodayWidgetViewControllerInvertColorsAccessibility *)self safeValueForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CHActivityTodayWidgetViewControllerInvertColorsAccessibility;
  [(CHActivityTodayWidgetViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(CHActivityTodayWidgetViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end