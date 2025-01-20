@interface WorkoutsListContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isDateInLastWeek:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)configureWithCurrentWorkout;
@end

@implementation WorkoutsListContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.WorkoutsListContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.WorkoutsListContentView", @"configureWithCurrentWorkout", "v", 0);
  [v3 validateClass:@"FitnessApp.WorkoutsListContentView" hasSwiftField:@"workout" withSwiftType:"Optional<HKWorkout>"];
  [v3 validateClass:@"FitnessApp.WorkoutsListContentView" hasSwiftField:@"dateLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"FitnessApp.WorkoutsListContentView" hasSwiftFieldOfAnyClass:@"workoutCellImageLabelView"];
  [v3 validateClass:@"FitnessApp.WorkoutsListContentView" hasSwiftField:@"achievementCount" withSwiftType:"Int"];
  [v3 validateClass:@"FitnessApp.WorkoutCellImageLabelView" hasSwiftField:@"workoutIconView" withSwiftType:"UIImageView"];
  [v3 validateClass:@"FitnessApp.WorkoutCellImageLabelView" hasSwiftField:@"workoutImageView" withSwiftType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKSource", @"_isAppleWatch", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v20.receiver = self;
  v20.super_class = (Class)WorkoutsListContentViewAccessibility;
  [(WorkoutsListContentViewAccessibility *)&v20 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(WorkoutsListContentViewAccessibility *)self safeSwiftValueForKey:@"workout"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 sourceRevision];
  v6 = [v5 source];
  unsigned __int8 v7 = [v6 safeBoolForKey:@"_isAppleWatch"];

  v8 = [v4 sourceRevision];
  v9 = [v8 source];
  v10 = [v9 name];

  v11 = [(WorkoutsListContentViewAccessibility *)self safeSwiftValueForKey:@"workoutCellImageLabelView"];
  if ([v10 length] && (v7 & 1) == 0)
  {
    objc_opt_class();
    v12 = [v11 safeSwiftValueForKey:@"workoutIconView"];
    v13 = __UIAccessibilityCastAsClass();

    [v13 setAccessibilityLabel:v10];
    [v13 setIsAccessibilityElement:1];
  }
  if ([(WorkoutsListContentViewAccessibility *)self safeSwiftIntForKey:@"achievementCount"])
  {
    objc_opt_class();
    v14 = [v11 safeSwiftValueForKey:@"workoutImageView"];
    v15 = __UIAccessibilityCastAsClass();

    v16 = accessibilityLocalizedString(@"award.earned");
    [v15 setAccessibilityLabel:v16];

    [v15 setIsAccessibilityElement:1];
  }
  v17 = [v4 startDate];
  if (v17 && ![(WorkoutsListContentViewAccessibility *)self _isDateInLastWeek:v17])
  {
    v18 = [(WorkoutsListContentViewAccessibility *)self safeSwiftValueForKey:@"dateLabel"];
    v19 = AXDateStringForFormat();
    [v18 setAccessibilityLabel:v19];
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)_UIAXStringForAllChildren(self, a2);
}

- (void)configureWithCurrentWorkout
{
  v3.receiver = self;
  v3.super_class = (Class)WorkoutsListContentViewAccessibility;
  [(WorkoutsListContentViewAccessibility *)&v3 configureWithCurrentWorkout];
  [(WorkoutsListContentViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (BOOL)_isDateInLastWeek:(id)a3
{
  id v3 = a3;
  v4 = +[NSCalendar currentCalendar];
  v5 = +[NSDate date];
  v6 = [v4 dateByAddingUnit:16 value:-6 toDate:v5 options:0];

  unsigned __int8 v7 = +[NSCalendar currentCalendar];
  v8 = [v7 startOfDayForDate:v6];

  id v9 = [v3 laterDate:v8];

  return v9 == v3;
}

@end