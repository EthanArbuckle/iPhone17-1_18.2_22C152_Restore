@interface GEONetworkSelectionHarvestReporter
+ (void)reportCellConnectionQualityHarvestRecord:(id)a3;
@end

@implementation GEONetworkSelectionHarvestReporter

+ (void)reportCellConnectionQualityHarvestRecord:(id)a3
{
  id v3 = a3;
  id GEOAPPortalClass = getGEOAPPortalClass();
  id v5 = [v3 data];

  [GEOAPPortalClass captureNetSelectionHarvestWithHarvestData:v5];
}

@end