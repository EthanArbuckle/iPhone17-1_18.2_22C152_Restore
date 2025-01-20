@interface CycleFactorsDataSource
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
- (void)pregnancyModelDidUpdate:(id)a3;
@end

@implementation CycleFactorsDataSource

- (void)pregnancyModelDidUpdate:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_241314FFC(v3);

  swift_release();
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  swift_retain();
  sub_24131561C(v5, v6);

  swift_release();
}

@end