@interface CycleChartsModelProvider
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
- (void)significantTimeChangeDidOccur;
@end

@implementation CycleChartsModelProvider

- (void)significantTimeChangeDidOccur
{
  swift_retain();
  sub_241246B30();

  swift_release();
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  swift_retain();
  sub_241247CCC(v6);

  swift_release();
}

@end