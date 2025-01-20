@interface CycleTrackingFinishSetupDataSource
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
- (void)pregnancyModelDidUpdate:(id)a3;
- (void)shouldShowCycleTrackingEducationTileUpdatedWithDidUpdate:(BOOL)a3;
@end

@implementation CycleTrackingFinishSetupDataSource

- (void)pregnancyModelDidUpdate:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_2412D3EE8(v3);

  swift_release();
}

- (void)shouldShowCycleTrackingEducationTileUpdatedWithDidUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  swift_retain();
  sub_2412D43D8(v3);

  swift_release();
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v5 = *(id *)self->analysis;
  *(void *)self->analysis = a4;
  id v4 = a4;
}

@end