@interface CalendarViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)calendarDataSource:(id)a3 cellForItemIn:(id)a4 date:(id)a5 dayComponent:(int64_t)a6 indexPath:(id)a7;
@end

@implementation CalendarViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MenstrualCyclesAppPlugin.CalendarViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MenstrualCyclesAppPlugin.CalendarDayCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MenstrualCyclesAppPlugin.CalendarViewController", @"calendarDataSource:cellForItemIn:date:dayComponent:indexPath:", "@", "@", "@", "q", "@", 0);
}

- (id)calendarDataSource:(id)a3 cellForItemIn:(id)a4 date:(id)a5 dayComponent:(int64_t)a6 indexPath:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CalendarViewControllerAccessibility;
  v16 = [(CalendarViewControllerAccessibility *)&v20 calendarDataSource:v12 cellForItemIn:v13 date:v14 dayComponent:a6 indexPath:v15];
  objc_opt_class();
  v17 = __UIAccessibilityCastAsClass();
  objc_opt_class();
  v18 = __UIAccessibilityCastAsSafeCategory();
  [v18 setAccessibilityDate:v17];

  return v16;
}

@end