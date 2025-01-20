@interface VCMediaNegotiationBlobV2BandwidthSettings(Utils)
- (BOOL)isEqual:()Utils;
- (void)bandwidthConfigurations;
@end

@implementation VCMediaNegotiationBlobV2BandwidthSettings(Utils)

- (BOOL)isEqual:()Utils
{
  if (!a3) {
    return 0;
  }
  int v5 = [a3 cap2G];
  if (v5 != [(VCMediaNegotiationBlobV2BandwidthSettings *)self cap2G]) {
    return 0;
  }
  int v6 = [a3 cap3G];
  if (v6 != [(VCMediaNegotiationBlobV2BandwidthSettings *)self cap3G]) {
    return 0;
  }
  int v7 = [a3 capLTE];
  if (v7 != [(VCMediaNegotiationBlobV2BandwidthSettings *)self capLTE]) {
    return 0;
  }
  int v8 = [a3 cap5G];
  if (v8 != [(VCMediaNegotiationBlobV2BandwidthSettings *)self cap5G]) {
    return 0;
  }
  int v9 = [a3 capWifi];
  return v9 == [(VCMediaNegotiationBlobV2BandwidthSettings *)self capWifi];
}

- (void)initWithBandwidthConfigurations:()Utils .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Nil bandwidth configurations!", v2, v3, v4, v5, v6);
}

- (void)initWithBandwidthConfigurations:()Utils .cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Nil filtered bandwidth configurations!", v2, v3, v4, v5, v6);
}

- (void)initWithBandwidthConfigurations:()Utils .cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize bandwidth configurations", v2, v3, v4, v5, v6);
}

- (void)bandwidthConfigurations
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the bandwidth configuration for Wifi", v2, v3, v4, v5, v6);
}

@end