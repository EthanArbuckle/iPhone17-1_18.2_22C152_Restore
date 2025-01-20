@interface GEOWiFiConnectionQualityReporter
+ (void)reportWiFiConnectionQuality:(id)a3;
@end

@implementation GEOWiFiConnectionQualityReporter

+ (void)reportWiFiConnectionQuality:(id)a3
{
  id v3 = a3;
  [getGEOAPPortalClass() captureWifiProbeWithWifiConnectionQuality:v3];
}

@end