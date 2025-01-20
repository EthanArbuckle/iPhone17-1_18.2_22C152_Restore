@interface CycleLogNavigationHandler
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
@end

@implementation CycleLogNavigationHandler

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  swift_retain();
  sub_241610F60(v6);

  swift_release();
}

@end