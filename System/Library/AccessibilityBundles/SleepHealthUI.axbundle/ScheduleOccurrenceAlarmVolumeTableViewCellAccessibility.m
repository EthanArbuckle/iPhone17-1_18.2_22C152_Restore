@interface ScheduleOccurrenceAlarmVolumeTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation ScheduleOccurrenceAlarmVolumeTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SleepHealthUI.ScheduleOccurrenceAlarmVolumeTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)ScheduleOccurrenceAlarmVolumeTableViewCellAccessibility;
  [(ScheduleOccurrenceAlarmVolumeTableViewCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(ScheduleOccurrenceAlarmVolumeTableViewCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_0];
  v4 = accessibilityLocalizedString(@"alarm.volume");
  [v3 setAccessibilityLabel:v4];
}

uint64_t __101__ScheduleOccurrenceAlarmVolumeTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end