@interface CDPAnalyticsReporterRTC
+ (id)rtcAnalyticsReporter;
@end

@implementation CDPAnalyticsReporterRTC

+ (id)rtcAnalyticsReporter
{
  if (rtcAnalyticsReporter_onceToken != -1) {
    dispatch_once(&rtcAnalyticsReporter_onceToken, &__block_literal_global_2);
  }
  v2 = [MEMORY[0x263F202C8] analyticsTransportRTCWithClientType:0x26C984838 clientBundleId:rtcAnalyticsReporter_mainBundleIdentifier clientName:@"com.apple.aaa.dnu"];
  v3 = [MEMORY[0x263F202B0] analyticsReporterWithTransport:v2];

  return v3;
}

void __47__CDPAnalyticsReporterRTC_rtcAnalyticsReporter__block_invoke()
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v0 = [v2 bundleIdentifier];
  v1 = (void *)rtcAnalyticsReporter_mainBundleIdentifier;
  rtcAnalyticsReporter_mainBundleIdentifier = v0;
}

@end