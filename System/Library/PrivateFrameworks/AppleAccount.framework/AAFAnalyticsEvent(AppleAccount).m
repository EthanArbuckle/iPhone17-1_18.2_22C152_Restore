@interface AAFAnalyticsEvent(AppleAccount)
+ (id)analyticsEventWithName:()AppleAccount altDSID:flowID:;
@end

@implementation AAFAnalyticsEvent(AppleAccount)

+ (id)analyticsEventWithName:()AppleAccount altDSID:flowID:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc(MEMORY[0x1E4F46FC8]);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  v11 = (void *)getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_ptr;
  uint64_t v22 = getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_ptr;
  if (!getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_ptr)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_block_invoke;
    v18[3] = &unk_1E5A48F98;
    v18[4] = &v19;
    __getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_block_invoke((uint64_t)v18);
    v11 = (void *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v11) {
    +[AAFAnalyticsEvent(AppleAccount) analyticsEventWithName:altDSID:flowID:]();
  }
  v12 = (void *)[v10 initWithEventName:v7 eventCategory:*v11 initData:0];
  v13 = v12;
  if (v9) {
    [v12 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F47038]];
  }
  v14 = [MEMORY[0x1E4F4EF40] sharedInstance];
  v15 = [v14 authKitAccountWithAltDSID:v8];
  if ([v14 accountAccessTelemetryOptInForAccount:v15])
  {
    v16 = [v14 telemetryDeviceSessionIDForAccount:v15];
    [v13 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F47020]];
  }

  return v13;
}

+ (void)analyticsEventWithName:()AppleAccount altDSID:flowID:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSNumber *const getkCDPRTCEventCategoryAccountDataAccessRecovery(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAFAnalyticsEvent+AppleAccount.m", 17, @"%s", dlerror());

  __break(1u);
}

@end