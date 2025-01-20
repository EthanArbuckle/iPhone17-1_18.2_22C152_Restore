@interface SecurityAnalyticsReporterRTC
+ (id)rtcAnalyticsReporter;
+ (void)sendMetricWithEvent:(id)a3 success:(BOOL)a4 error:(id)a5;
@end

@implementation SecurityAnalyticsReporterRTC

+ (void)sendMetricWithEvent:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 permittedToSendMetrics])
  {
    v9 = [v7 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__SecurityAnalyticsReporterRTC_sendMetricWithEvent_success_error___block_invoke;
    block[3] = &unk_264314AC8;
    id v11 = v7;
    BOOL v13 = a4;
    id v12 = v8;
    dispatch_sync(v9, block);
  }
}

void __66__SecurityAnalyticsReporterRTC_sendMetricWithEvent_success_error___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) getEvent];
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v4 setObject:v2 forKeyedSubscript:@"didSucceed"];

  [v4 populateUnderlyingErrorsStartingWithRootError:*(void *)(a1 + 40)];
  v3 = +[SecurityAnalyticsReporterRTC rtcAnalyticsReporter];
  [v3 sendEvent:v4];
}

+ (id)rtcAnalyticsReporter
{
  if (rtcAnalyticsReporter_onceToken != -1) {
    dispatch_once(&rtcAnalyticsReporter_onceToken, &__block_literal_global_174);
  }
  v2 = (void *)rtcAnalyticsReporter_rtcReporter;
  return v2;
}

void __52__SecurityAnalyticsReporterRTC_rtcAnalyticsReporter__block_invoke()
{
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v0 = (void *)getAAFAnalyticsTransportRTCClass_softClass;
  uint64_t v15 = getAAFAnalyticsTransportRTCClass_softClass;
  if (!getAAFAnalyticsTransportRTCClass_softClass)
  {
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __getAAFAnalyticsTransportRTCClass_block_invoke;
    v10 = &unk_2643150C8;
    id v11 = &v12;
    __getAAFAnalyticsTransportRTCClass_block_invoke((uint64_t)&v7);
    v0 = (void *)v13[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v12, 8);
  v2 = [v1 analyticsTransportRTCWithClientType:&unk_26C975FA8 clientBundleId:@"com.apple.securityd" clientName:@"com.apple.aaa.dnu"];
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v3 = (void *)getAAFAnalyticsReporterClass_softClass;
  uint64_t v15 = getAAFAnalyticsReporterClass_softClass;
  if (!getAAFAnalyticsReporterClass_softClass)
  {
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __getAAFAnalyticsReporterClass_block_invoke;
    v10 = &unk_2643150C8;
    id v11 = &v12;
    __getAAFAnalyticsReporterClass_block_invoke((uint64_t)&v7);
    v3 = (void *)v13[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v12, 8);
  uint64_t v5 = [v4 analyticsReporterWithTransport:v2];
  v6 = (void *)rtcAnalyticsReporter_rtcReporter;
  rtcAnalyticsReporter_rtcReporter = v5;
}

@end