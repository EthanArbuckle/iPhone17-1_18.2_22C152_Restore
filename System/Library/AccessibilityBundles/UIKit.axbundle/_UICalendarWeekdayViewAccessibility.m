@interface _UICalendarWeekdayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
@end

@implementation _UICalendarWeekdayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UICalendarWeekdayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)accessibilityElementsHidden
{
  return AXDoesRequestingClientDeserveAutomation() == 0;
}

@end