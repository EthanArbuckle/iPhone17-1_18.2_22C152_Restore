@interface AIDAAnalyticsReporterRTC
+ (id)sharedTelemetryReporter;
@end

@implementation AIDAAnalyticsReporterRTC

+ (id)sharedTelemetryReporter
{
  if (sharedTelemetryReporter_onceToken != -1) {
    dispatch_once(&sharedTelemetryReporter_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedTelemetryReporter_rtcReporter;
  return v2;
}

void __51__AIDAAnalyticsReporterRTC_sharedTelemetryReporter__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v0 bundleIdentifier];

  v1 = [MEMORY[0x1E4F46FE0] analyticsTransportRTCWithClientType:&unk_1F388F3E8 clientBundleId:v4 clientName:@"com.apple.aaa.dnu"];
  uint64_t v2 = [MEMORY[0x1E4F46FD0] analyticsReporterWithTransport:v1];
  v3 = (void *)sharedTelemetryReporter_rtcReporter;
  sharedTelemetryReporter_rtcReporter = v2;
}

@end