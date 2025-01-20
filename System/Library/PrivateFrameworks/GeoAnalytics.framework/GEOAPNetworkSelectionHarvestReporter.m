@interface GEOAPNetworkSelectionHarvestReporter
+ (void)reportCellConnectionQualityHarvestRecord:(id)a3;
+ (void)reportNetworkSelectionHarvestData:(id)a3;
@end

@implementation GEOAPNetworkSelectionHarvestReporter

+ (void)reportNetworkSelectionHarvestData:(id)a3
{
}

+ (void)reportCellConnectionQualityHarvestRecord:(id)a3
{
  id v3 = [a3 data];
  +[GEOAPPortal captureNetSelectionHarvestWithHarvestData:v3];
}

@end