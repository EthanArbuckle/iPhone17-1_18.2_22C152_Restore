@interface ScheduleOccurrenceComponentsEditTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation ScheduleOccurrenceComponentsEditTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SleepHealthUI.ScheduleOccurrenceComponentsEditTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.ScheduleOccurrenceComponentsEditTableViewCell", @"accessibilityComponentsEditView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsEditView", @"accessibilityComponentsHeader", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsEditView", @"accessibilityClock", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClock", @"accessibilityBedtimeHand", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClock", @"accessibilityWakeUpHand", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsEditView", @"accessibilityTimeInBedLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsEditView", @"accessibilityClockCaption", "@", 0);
}

- (id)accessibilityElements
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(ScheduleOccurrenceComponentsEditTableViewCellAccessibility *)self safeValueForKey:@"accessibilityComponentsEditView"];
  v5 = [v4 safeValueForKey:@"accessibilityClock"];
  v6 = [v4 safeValueForKey:@"accessibilityComponentsHeader"];
  [v3 axSafelyAddObject:v6];

  v7 = [v5 safeValueForKey:@"accessibilityBedtimeHand"];
  [v3 axSafelyAddObject:v7];

  v8 = [v5 safeValueForKey:@"accessibilityWakeUpHand"];
  [v3 axSafelyAddObject:v8];

  v9 = [v4 safeValueForKey:@"accessibilityTimeInBedLabel"];
  [v3 axSafelyAddObject:v9];

  v10 = [v4 safeValueForKey:@"accessibilityClockCaption"];
  [v3 axSafelyAddObject:v10];

  return v3;
}

@end