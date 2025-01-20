@interface CycleStatisticsDataSource
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
@end

@implementation CycleStatisticsDataSource

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  v6 = *(void **)&self->analysis[7];
  *(void *)&self->analysis[7] = a4;
  id v7 = a4;
  id v8 = a3;
  swift_retain();

  if (self->sectionStyle[0]) {
    sub_241618C64(v7);
  }
  else {
    sub_2416187BC(v7);
  }

  swift_release();
}

@end