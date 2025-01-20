@interface HistoricalAnalysisDataSource
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
@end

@implementation HistoricalAnalysisDataSource

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  swift_retain();
  sub_2414DBD3C((uint64_t)v5, v6);

  swift_release();
}

@end