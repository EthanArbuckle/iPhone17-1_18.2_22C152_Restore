@interface CHWorkoutDetailPaceTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5;
@end

@implementation CHWorkoutDetailPaceTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHWorkoutDetailPaceTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHWorkoutDetailPaceTableViewCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"CHWorkoutDetailPaceTableViewCell" hasInstanceVariable:@"_valueLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHWorkoutDetailPaceTableViewCell", @"configureWithWorkout:workoutActivity:dataCalculator:", "v", "@", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)CHWorkoutDetailPaceTableViewCellAccessibility;
  [(CHWorkoutDetailPaceTableViewCellAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CHWorkoutDetailPaceTableViewCellAccessibility *)self safeUIViewForKey:@"_valueLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(CHWorkoutDetailPaceTableViewCellAccessibility *)self safeValueForKey:@"_titleLabel"];
  v6 = accessibilityAttributedStringForPaceContainingString(v4);
  v7 = [v5 accessibilityLabel];
  [(CHWorkoutDetailPaceTableViewCellAccessibility *)self setAccessibilityLabel:v7];

  [(CHWorkoutDetailPaceTableViewCellAccessibility *)self setAccessibilityValue:v6];
}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CHWorkoutDetailPaceTableViewCellAccessibility;
  id v8 = a3;
  [(CHWorkoutDetailPaceTableViewCellAccessibility *)&v10 configureWithWorkout:v8 workoutActivity:a4 dataCalculator:a5];
  v9 = (char *)objc_msgSend(v8, "workoutActivityType", v10.receiver, v10.super_class);

  if (v9 != (unsigned char *)&dword_C + 1) {
    [(CHWorkoutDetailPaceTableViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
  }
}

@end