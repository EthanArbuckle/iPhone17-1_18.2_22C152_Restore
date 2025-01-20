@interface HKWorkout(HKUIAdditions)
+ (id)hkui_localizedWorkoutStringForValue:()HKUIAdditions;
- (id)hkui_localizedActivityTypeName;
@end

@implementation HKWorkout(HKUIAdditions)

- (id)hkui_localizedActivityTypeName
{
  [a1 workoutActivityType];
  return HKUILocalizedWorkoutTypeName();
}

+ (id)hkui_localizedWorkoutStringForValue:()HKUIAdditions
{
  v3 = NSString;
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = [v4 bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"WORKOUT_NUMBERED_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v8 = [v5 integerValue];

  v9 = objc_msgSend(v3, "stringWithFormat:", v7, v8);

  return v9;
}

@end