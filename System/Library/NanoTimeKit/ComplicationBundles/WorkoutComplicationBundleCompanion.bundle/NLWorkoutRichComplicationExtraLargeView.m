@interface NLWorkoutRichComplicationExtraLargeView
- (id)noActiveWorkoutImage;
- (id)noActiveWorkoutImageName;
@end

@implementation NLWorkoutRichComplicationExtraLargeView

- (id)noActiveWorkoutImageName
{
  return @"graphicXLWorkout";
}

- (id)noActiveWorkoutImage
{
  return +[NLWorkoutComplicationImageProvider noWorkoutImageForComplicationFamily:12];
}

@end