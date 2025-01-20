@interface AnalyticCollectionDisabled
@end

@implementation AnalyticCollectionDisabled

id GeoAnalyticsConfig_AnalyticCollectionDisabled_Metadata_block_invoke()
{
  v0 = NSNumber;
  v1 = [MEMORY[0x263F41B90] sharedPlatform];
  v2 = objc_msgSend(v0, "numberWithBool:", objc_msgSend(v1, "isMacSetupUser"));

  return v2;
}

@end