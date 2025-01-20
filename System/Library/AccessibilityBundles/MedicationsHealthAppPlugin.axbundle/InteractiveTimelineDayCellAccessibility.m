@interface InteractiveTimelineDayCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation InteractiveTimelineDayCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MedicationsHealthAppPlugin.InteractiveTimelineDayCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MedicationsHealthAppPlugin.InteractiveTimelineDayCell", @"startDate", "@", 0);
  [v3 validateClass:@"MedicationsHealthAppPlugin.InteractiveTimelineDayCell" hasSwiftField:@"timelineDay" withSwiftType:"TimelineDay"];
  [v3 validateSwiftStruct:@"MedicationsHealthAppPlugin.TimelineDay" hasSwiftField:@"logIndicatorAppearance" withSwiftType:"TimelineLogIndicatorAppearance"];
}

- (id)accessibilityLabel
{
  v2 = (void *)MEMORY[0x263F08790];
  id v3 = [(InteractiveTimelineDayCellAccessibility *)self safeValueForKey:@"startDate"];
  v4 = [v2 localizedStringFromDate:v3 dateStyle:2 timeStyle:0];

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(InteractiveTimelineDayCellAccessibility *)self safeSwiftValueForKey:@"timelineDay"];
  id v3 = [v2 safeSwiftValueForKey:@"logIndicatorAppearance"];
  v4 = [v3 safeSwiftEnumCase];

  v5 = accessibilityLocalizedString(v4);

  return v5;
}

@end