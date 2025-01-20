@interface NLWorkoutRichComplicationCircularView
- (id)noActiveWorkoutImage;
- (id)noActiveWorkoutImageName;
@end

@implementation NLWorkoutRichComplicationCircularView

- (id)noActiveWorkoutImageName
{
  return @"victoryWorkout";
}

- (id)noActiveWorkoutImage
{
  return +[NLWorkoutComplicationImageProvider noWorkoutImageForComplicationFamily:10];
}

@end