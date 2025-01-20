@interface AAAnalyticsRTCReporter
+ (id)reporter;
@end

@implementation AAAnalyticsRTCReporter

+ (id)reporter
{
  if (reporter_onceToken != -1) {
    dispatch_once(&reporter_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)reporter_rtcReporter;

  return v2;
}

void __34__AAAnalyticsRTCReporter_reporter__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];

  v2 = (void *)MEMORY[0x1E4F46FE0];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v3 = (id *)getkCDPRTCClientTypeSymbolLoc_ptr;
  uint64_t v14 = getkCDPRTCClientTypeSymbolLoc_ptr;
  if (!getkCDPRTCClientTypeSymbolLoc_ptr)
  {
    v4 = (void *)CoreCDPLibrary();
    v12[3] = (uint64_t)dlsym(v4, "kCDPRTCClientType");
    getkCDPRTCClientTypeSymbolLoc_ptr = v12[3];
    v3 = (id *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v3) {
    __34__AAAnalyticsRTCReporter_reporter__block_invoke_cold_1();
  }
  id v5 = *v3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v6 = (void *)getkCDPRTCClientNameDNUSymbolLoc_ptr;
  uint64_t v14 = getkCDPRTCClientNameDNUSymbolLoc_ptr;
  if (!getkCDPRTCClientNameDNUSymbolLoc_ptr)
  {
    v7 = (void *)CoreCDPLibrary();
    v12[3] = (uint64_t)dlsym(v7, "kCDPRTCClientNameDNU");
    getkCDPRTCClientNameDNUSymbolLoc_ptr = v12[3];
    v6 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v6) {
    __34__AAAnalyticsRTCReporter_reporter__block_invoke_cold_2();
  }
  v8 = [v2 analyticsTransportRTCWithClientType:v5 clientBundleId:v1 clientName:*v6];

  uint64_t v9 = [MEMORY[0x1E4F46FD0] analyticsReporterWithTransport:v8];
  v10 = (void *)reporter_rtcReporter;
  reporter_rtcReporter = v9;
}

void __34__AAAnalyticsRTCReporter_reporter__block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSNumber *const getkCDPRTCClientType(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAAnalyticsRTCReporter.m", 15, @"%s", dlerror());

  __break(1u);
}

void __34__AAAnalyticsRTCReporter_reporter__block_invoke_cold_2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *const getkCDPRTCClientNameDNU(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAAnalyticsRTCReporter.m", 16, @"%s", dlerror());

  __break(1u);
}

@end