@interface CalendarMonthNameViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CalendarMonthNameViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CalendarMonthNameView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(CalendarMonthNameViewAccessibility *)self safeValueForKey:@"name"];
}

@end