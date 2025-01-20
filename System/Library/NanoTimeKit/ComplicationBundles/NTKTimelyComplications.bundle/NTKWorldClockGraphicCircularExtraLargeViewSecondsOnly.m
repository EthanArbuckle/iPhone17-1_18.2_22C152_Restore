@interface NTKWorldClockGraphicCircularExtraLargeViewSecondsOnly
+ (id)_createHandsViewForDevice:(id)a3;
+ (id)eastLabelNumber;
+ (id)northLabelNumber;
+ (id)southLabelNumber;
+ (id)westLabelNumber;
- (BOOL)useDayTimeColoring;
@end

@implementation NTKWorldClockGraphicCircularExtraLargeViewSecondsOnly

+ (id)_createHandsViewForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKWorldClockRichComplicationHandsExtraLargeViewSecondsOnly alloc] initForDevice:v3];

  return v4;
}

+ (id)northLabelNumber
{
  return &off_10B08;
}

+ (id)eastLabelNumber
{
  return &off_10B20;
}

+ (id)southLabelNumber
{
  return &off_10B38;
}

+ (id)westLabelNumber
{
  return &off_10B50;
}

- (BOOL)useDayTimeColoring
{
  return 0;
}

@end