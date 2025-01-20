@interface EKCalendarItemCalendarEditItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
@end

@implementation EKCalendarItemCalendarEditItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKCalendarItemCalendarEditItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EKCalendarItemCalendarEditItemAccessibility;
  v3 = [(EKCalendarItemCalendarEditItemAccessibility *)&v8 cellForSubitemAtIndex:a3];
  v4 = [v3 detailTextLabel];
  v5 = [v4 text];
  v6 = [v3 detailTextLabel];
  [v6 setAccessibilityLabel:v5];

  return v3;
}

@end