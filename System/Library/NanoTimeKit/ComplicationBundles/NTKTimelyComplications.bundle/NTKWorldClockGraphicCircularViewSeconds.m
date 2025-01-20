@interface NTKWorldClockGraphicCircularViewSeconds
+ (id)_createHandsViewForDevice:(id)a3;
- (BOOL)useDayTimeColoring;
@end

@implementation NTKWorldClockGraphicCircularViewSeconds

+ (id)_createHandsViewForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKWorldClockRichComplicationHandsViewSeconds alloc] initForDevice:v3];

  return v4;
}

- (BOOL)useDayTimeColoring
{
  return 0;
}

@end