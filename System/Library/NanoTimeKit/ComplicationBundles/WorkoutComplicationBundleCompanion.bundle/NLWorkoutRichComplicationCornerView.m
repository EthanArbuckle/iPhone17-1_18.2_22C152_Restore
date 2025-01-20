@interface NLWorkoutRichComplicationCornerView
- (id)noActiveWorkoutImage;
- (id)noActiveWorkoutImageName;
@end

@implementation NLWorkoutRichComplicationCornerView

- (id)noActiveWorkoutImageName
{
  return @"colorWorkout";
}

- (id)noActiveWorkoutImage
{
  return +[NLWorkoutComplicationImageProvider noWorkoutImageForComplicationFamily:8];
}

@end