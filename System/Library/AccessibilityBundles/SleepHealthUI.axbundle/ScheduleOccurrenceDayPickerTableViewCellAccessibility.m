@interface ScheduleOccurrenceDayPickerTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation ScheduleOccurrenceDayPickerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SleepHealthUI.ScheduleOccurrenceDayPickerTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.ScheduleOccurrenceDayPickerTableViewCell", @"accessibilityDayPicker", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleDayPicker", @"accessibilityPickerDays", "@", 0);
}

- (id)accessibilityElements
{
  v2 = [(ScheduleOccurrenceDayPickerTableViewCellAccessibility *)self safeValueForKey:@"accessibilityDayPicker"];
  id v3 = [v2 safeArrayForKey:@"accessibilityPickerDays"];

  return v3;
}

@end