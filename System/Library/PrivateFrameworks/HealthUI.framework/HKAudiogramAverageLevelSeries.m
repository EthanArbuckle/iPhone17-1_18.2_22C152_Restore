@interface HKAudiogramAverageLevelSeries
+ (id)audiogramAverageLevelSeriesWithColor:(id)a3;
- (BOOL)supportsMultiTouchSelection;
- (HKAudiogramAverageLevelSeries)init;
@end

@implementation HKAudiogramAverageLevelSeries

- (HKAudiogramAverageLevelSeries)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(HKLineSeries *)&v3 init];
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

+ (id)audiogramAverageLevelSeriesWithColor:(id)a3
{
  id v3 = a3;
  id v4 = _s8HealthUI27AudiogramAverageLevelSeriesC04makecdeF012primaryColorACSo7UIColorC_tFZ_0(v3);

  return v4;
}

@end