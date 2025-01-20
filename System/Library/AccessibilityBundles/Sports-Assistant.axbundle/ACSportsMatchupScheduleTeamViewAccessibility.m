@interface ACSportsMatchupScheduleTeamViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ACSportsMatchupScheduleTeamViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsMatchupScheduleTeamView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ACSportsMatchupScheduleTeamView" hasInstanceVariable:@"_nameLabel" withType:"UILabel"];
  [v3 validateClass:@"ACSportsMatchupScheduleTeamView" hasInstanceVariable:@"_recordLabel" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  id v3 = [(ACSportsMatchupScheduleTeamViewAccessibility *)self safeValueForKey:@"_nameLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(ACSportsMatchupScheduleTeamViewAccessibility *)self safeValueForKey:@"_recordLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = __UIAXStringForVariables();

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end