@interface CHWorkoutFormattingManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)formattedDurationForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
@end

@implementation CHWorkoutFormattingManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHWorkoutFormattingManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)formattedDurationForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CHWorkoutFormattingManagerAccessibility;
  id v11 = [(CHWorkoutFormattingManagerAccessibility *)&v22 formattedDurationForWorkout:v8 workoutActivity:v9 context:v10];
  char v21 = 0;
  objc_opt_class();
  v20.receiver = self;
  v20.super_class = (Class)CHWorkoutFormattingManagerAccessibility;
  v12 = [(CHWorkoutFormattingManagerAccessibility *)&v20 formattedDurationForWorkout:v8 workoutActivity:v9 context:v10];
  v13 = __UIAccessibilityCastAsClass();

  if (v21) {
    abort();
  }
  v14 = [v13 string];
  id v15 = [v14 length];

  if (v15)
  {
    id v16 = objc_alloc((Class)AXAttributedString);
    v17 = [v13 string];
    id v18 = [v16 initWithString:v17];

    [v18 setAttribute:&__kCFBooleanTrue forKey:UIAccessibilityTokenDurationTimeHHMMSS];
    [v13 setAccessibilityLabel:v18];
  }

  return v13;
}

@end