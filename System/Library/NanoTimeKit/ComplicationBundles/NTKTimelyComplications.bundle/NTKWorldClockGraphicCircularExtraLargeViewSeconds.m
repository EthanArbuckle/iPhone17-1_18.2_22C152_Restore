@interface NTKWorldClockGraphicCircularExtraLargeViewSeconds
+ (id)_createHandsViewForDevice:(id)a3;
- (BOOL)useDayTimeColoring;
@end

@implementation NTKWorldClockGraphicCircularExtraLargeViewSeconds

+ (id)_createHandsViewForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKWorldClockRichComplicationHandsExtraLargeViewSeconds alloc] initForDevice:v3];

  return v4;
}

- (BOOL)useDayTimeColoring
{
  return 0;
}

@end