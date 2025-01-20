@interface SleepScheduleDayPickerDayAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SleepScheduleDayPickerDayAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SleepHealthUI.SleepScheduleDayPickerDay";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(SleepScheduleDayPickerDayAccessibility *)self safeStringForKey:@"accessibilityWeekday"];
}

@end