@interface HBXFitnessManager
+ (id)divingFitnessNonGradientTextColor;
+ (id)fitnessIconFor:(id)a3;
+ (id)fitnessNonGradientTextColor;
@end

@implementation HBXFitnessManager

+ (id)fitnessIconFor:(id)a3
{
  v3 = [MEMORY[0x263F3F188] activityTypeWithWorkout:a3];
  v4 = FIUIStaticWorkoutIconImage();
  v5 = [v4 imageWithRenderingMode:2];

  return v5;
}

+ (id)fitnessNonGradientTextColor
{
  v2 = [MEMORY[0x263F23950] keyColors];
  v3 = [v2 nonGradientTextColor];

  return v3;
}

+ (id)divingFitnessNonGradientTextColor
{
  v2 = [MEMORY[0x263F23950] diveColors];
  v3 = [v2 nonGradientTextColor];

  return v3;
}

@end