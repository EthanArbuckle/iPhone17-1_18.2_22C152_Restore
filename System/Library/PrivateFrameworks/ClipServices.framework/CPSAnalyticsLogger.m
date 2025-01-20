@interface CPSAnalyticsLogger
+ (id)sharedLogger;
- (CPSAnalyticsLogger)initWithQueue:(id)a3;
- (void)_sendEventLazyWithName:(id)a3 clipBundleIdentifier:(id)a4 payload:(id)a5;
- (void)didAgeOutClip:(id)a3;
- (void)didCancelInterstitialForClip:(id)a3 withEvent:(int64_t)a4 didShowCardInline:(BOOL)a5;
- (void)didDiscoverClip:(id)a3 event:(id)a4 alreadyInstalled:(BOOL)a5;
- (void)didManuallyDeleteClip:(id)a3 withEvent:(int64_t)a4;
- (void)didPresentInvocationCardForClip:(id)a3 adamID:(id)a4 sourceBundleIdentifier:(id)a5 referrerBundleIdentifier:(id)a6 event:(id)a7 url:(id)a8 didShowCardInline:(BOOL)a9;
- (void)didUpgradeToFullAppFromClip:(id)a3;
- (void)didUseClip:(id)a3 atLatitude:(double)a4 longitude:(double)a5;
- (void)recordClientClipRequestWithBundleID:(id)a3 launchReason:(id)a4;
- (void)recordClientMetadataRequestWithBundleID:(id)a3 launchReason:(id)a4;
- (void)recordDidActivateCardWithBundleID:(id)a3 launchReason:(id)a4 deviceLocked:(BOOL)a5 didShowCardInline:(BOOL)a6 isOutOfBoxURL:(BOOL)a7;
- (void)recordDidInstallWithBundleID:(id)a3 succeeded:(BOOL)a4;
- (void)recordDidOpenAppClipWithBundleID:(id)a3 launchReason:(id)a4 didShowCard:(BOOL)a5 didOpenFullApp:(BOOL)a6 didInstallAppClip:(BOOL)a7 isOutOfBoxURL:(BOOL)a8;
- (void)recordDidShowErrorWithBundleID:(id)a3 place:(id)a4 errorCode:(int64_t)a5;
- (void)recordDidShowLocationConsentWithBundleID:(id)a3 response:(unint64_t)a4;
- (void)recordDidTapAppStoreBannerWithBundleID:(id)a3;
- (void)recordDidTapOpenButtonInCardWithBundleID:(id)a3 metadata:(id)a4 launchReason:(id)a5 launchOptions:(id)a6 didShowCardInline:(BOOL)a7;
- (void)recordReportProblemStepCompletedWithBundleID:(id)a3 problemLabel:(id)a4 event:(int64_t)a5;
@end

@implementation CPSAnalyticsLogger

+ (id)sharedLogger
{
  if (sharedLogger_once != -1) {
    dispatch_once(&sharedLogger_once, &__block_literal_global_17);
  }
  v2 = (void *)sharedLogger_shared;

  return v2;
}

void __34__CPSAnalyticsLogger_sharedLogger__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.ClipServices.Analytics", v0);

  v1 = [[CPSAnalyticsLogger alloc] initWithQueue:v3];
  v2 = (void *)sharedLogger_shared;
  sharedLogger_shared = (uint64_t)v1;
}

- (CPSAnalyticsLogger)initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSAnalyticsLogger;
  v6 = [(CPSAnalyticsLogger *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_analyticsSynchronizationQueue, a3);
    v8 = v7;
  }

  return v7;
}

- (void)didDiscoverClip:(id)a3 event:(id)a4 alreadyInstalled:(BOOL)a5
{
  BOOL v5 = a5;
  v15[2] = *MEMORY[0x263EF8340];
  if (a4) {
    v8 = (__CFString *)a4;
  }
  else {
    v8 = &stru_26C629F40;
  }
  v14[0] = @"launchReason";
  v14[1] = @"alreadyInstalled";
  v15[0] = v8;
  v9 = NSNumber;
  id v10 = a4;
  id v11 = a3;
  v12 = [v9 numberWithBool:v5];
  v15[1] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  [(CPSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.ClipServices.DidDiscoverClip" clipBundleIdentifier:v11 payload:v13];
}

- (void)didPresentInvocationCardForClip:(id)a3 adamID:(id)a4 sourceBundleIdentifier:(id)a5 referrerBundleIdentifier:(id)a6 event:(id)a7 url:(id)a8 didShowCardInline:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  BOOL v21 = +[CPSUtilities deviceIsLocked];
  v22 = objc_msgSend(v20, "cps_fallbackBundleIdentifier");
  [(CPSAnalyticsLogger *)self recordDidActivateCardWithBundleID:v15 launchReason:v19 deviceLocked:v21 didShowCardInline:a9 isOutOfBoxURL:v22 != 0];

  if ([v15 length]
    && [v16 intValue]
    && [v19 length]
    && ([v20 absoluteString],
        v23 = objc_claimAutoreleasedReturnValue(),
        uint64_t v24 = [v23 length],
        v23,
        v24))
  {
    analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __137__CPSAnalyticsLogger_didPresentInvocationCardForClip_adamID_sourceBundleIdentifier_referrerBundleIdentifier_event_url_didShowCardInline___block_invoke;
    v27[3] = &unk_26424FC20;
    id v28 = v15;
    id v29 = v16;
    id v30 = v18;
    id v31 = v17;
    id v32 = v19;
    id v33 = v20;
    dispatch_async(analyticsSynchronizationQueue, v27);
  }
  else
  {
    v26 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[CPSAnalyticsLogger didPresentInvocationCardForClip:adamID:sourceBundleIdentifier:referrerBundleIdentifier:event:url:didShowCardInline:](v26);
    }
  }
}

void __137__CPSAnalyticsLogger_didPresentInvocationCardForClip_adamID_sourceBundleIdentifier_referrerBundleIdentifier_event_url_didShowCardInline___block_invoke(uint64_t a1)
{
  id v7 = (id)[objc_alloc(MEMORY[0x263F25410]) initWithClipBundleID:*(void *)(a1 + 32)];
  [v7 setItemID:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  if (!v2) {
    uint64_t v2 = *(void *)(a1 + 56);
  }
  [v7 setReferralSourceBundleID:v2];
  dispatch_queue_t v3 = (__CFString *)*(id *)(a1 + 64);
  if (([*(id *)(a1 + 64) isEqualToString:@"Safari"] & 1) != 0
    || [*(id *)(a1 + 64) isEqualToString:@"InApp"])
  {
    v4 = CPSSessionLaunchReasonAnalyticsAppReferral;
    if (!*(void *)(a1 + 48)) {
      v4 = CPSSessionLaunchReasonAnalyticsWebReferral;
    }
    BOOL v5 = *v4;

    dispatch_queue_t v3 = v5;
  }
  [v7 setReferrerType:v3];
  [v7 setSourceURL:*(void *)(a1 + 72)];
  id v6 = objc_alloc_init(MEMORY[0x263F25418]);
  [v6 sendClipCardMetricsEvent:v7 completionHandler:&__block_literal_global_67];
}

void __137__CPSAnalyticsLogger_didPresentInvocationCardForClip_adamID_sourceBundleIdentifier_referrerBundleIdentifier_event_url_didShowCardInline___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    BOOL v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __137__CPSAnalyticsLogger_didPresentInvocationCardForClip_adamID_sourceBundleIdentifier_referrerBundleIdentifier_event_url_didShowCardInline___block_invoke_2_cold_1(v5, v4);
    }
  }
}

- (void)recordDidInstallWithBundleID:(id)a3 succeeded:(BOOL)a4
{
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__CPSAnalyticsLogger_recordDidInstallWithBundleID_succeeded___block_invoke;
  v5[3] = &unk_26424FC48;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(analyticsSynchronizationQueue, v5);
}

void __61__CPSAnalyticsLogger_recordDidInstallWithBundleID_succeeded___block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  dispatch_queue_t v3 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_72];
  [v2 setPredicate:v3];

  id v4 = [v2 allObjects];
  uint64_t v5 = [v4 count];

  BOOL v6 = *(void **)(a1 + 32);
  v10[0] = @"success";
  id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v10[1] = @"totalClips";
  v11[0] = v7;
  v8 = [NSNumber numberWithUnsignedInteger:v5];
  v11[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v6 _sendEventLazyWithName:@"com.apple.ClipServices.DidInstallClip" clipBundleIdentifier:0 payload:v9];
}

BOOL __61__CPSAnalyticsLogger_recordDidInstallWithBundleID_succeeded___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 appClipMetadata];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)didUseClip:(id)a3 atLatitude:(double)a4 longitude:(double)a5
{
  void v14[2] = *MEMORY[0x263EF8340];
  v13[0] = @"latitude";
  v8 = NSNumber;
  id v9 = a3;
  id v10 = [v8 numberWithDouble:a4];
  v13[1] = @"longitude";
  v14[0] = v10;
  id v11 = [NSNumber numberWithDouble:a5];
  v14[1] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  [(CPSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.ClipServices.DidUseClipAtLocation" clipBundleIdentifier:v9 payload:v12];
}

- (void)didUpgradeToFullAppFromClip:(id)a3
{
}

- (void)didAgeOutClip:(id)a3
{
}

- (void)didManuallyDeleteClip:(id)a3 withEvent:(int64_t)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = @"delete specific clip";
  if (a4 != 1) {
    uint64_t v5 = @"unspecified";
  }
  if (a4 == 2) {
    uint64_t v5 = @"clear all clips";
  }
  id v9 = @"event";
  v10[0] = v5;
  BOOL v6 = NSDictionary;
  id v7 = v5;
  v8 = [v6 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  [(CPSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.ClipServices.DidManuallyDeleteClip" clipBundleIdentifier:0 payload:v8];
}

- (void)didCancelInterstitialForClip:(id)a3 withEvent:(int64_t)a4 didShowCardInline:(BOOL)a5
{
  BOOL v5 = a5;
  void v13[2] = *MEMORY[0x263EF8340];
  v12[0] = @"event";
  if ((unint64_t)(a4 - 1) > 2) {
    id v7 = @"unspecified";
  }
  else {
    id v7 = off_26424FC90[a4 - 1];
  }
  v13[0] = v7;
  v12[1] = @"didShowCardInline";
  v8 = NSNumber;
  id v9 = a3;
  id v10 = [v8 numberWithBool:v5];
  v13[1] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [(CPSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.ClipServices.DidCancelInterstitial" clipBundleIdentifier:v9 payload:v11];
}

- (void)recordClientClipRequestWithBundleID:(id)a3 launchReason:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v10 = @"launchReason";
  v11[0] = a4;
  BOOL v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [(CPSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.ClipServices.ClientDidRequestClip" clipBundleIdentifier:v8 payload:v9];
}

- (void)recordClientMetadataRequestWithBundleID:(id)a3 launchReason:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v10 = @"launchReason";
  v11[0] = a4;
  BOOL v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [(CPSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.ClipServices.ClientDidRequestMetadata" clipBundleIdentifier:v8 payload:v9];
}

- (void)recordDidActivateCardWithBundleID:(id)a3 launchReason:(id)a4 deviceLocked:(BOOL)a5 didShowCardInline:(BOOL)a6 isOutOfBoxURL:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  v20[4] = *MEMORY[0x263EF8340];
  v20[0] = a4;
  v19[0] = @"launchReason";
  v19[1] = @"deviceLocked";
  v12 = NSNumber;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v12 numberWithBool:v9];
  v20[1] = v15;
  v19[2] = @"didShowCardInline";
  id v16 = [NSNumber numberWithBool:v8];
  v20[2] = v16;
  v19[3] = @"isOutOfBoxURL";
  id v17 = [NSNumber numberWithBool:v7];
  v20[3] = v17;
  id v18 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

  [(CPSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.ClipServices.DidActivateCard" clipBundleIdentifier:v14 payload:v18];
}

- (void)recordDidTapOpenButtonInCardWithBundleID:(id)a3 metadata:(id)a4 launchReason:(id)a5 launchOptions:(id)a6 didShowCardInline:(BOOL)a7
{
  BOOL v7 = a7;
  v25[4] = *MEMORY[0x263EF8340];
  id v11 = a6;
  v25[0] = a5;
  v24[0] = @"launchReason";
  v24[1] = @"locationConfirmation";
  id v22 = a5;
  id v12 = a4;
  id v13 = a3;
  int v14 = [v12 clipRequestsLocationConfirmationPermission];
  if (v14)
  {
    id v15 = [v11 locationConfirmationGranted];
  }
  else
  {
    id v15 = 0;
  }
  id v16 = stringForUserDecision(v15);
  v25[1] = v16;
  v24[2] = @"ephemeralNotification";
  int v17 = [v12 clipRequestsNotificationPermission];

  if (v17)
  {
    id v18 = [v11 userNotificationGranted];
  }
  else
  {
    id v18 = 0;
  }
  id v19 = stringForUserDecision(v18);
  v25[2] = v19;
  v24[3] = @"didShowCardInline";
  id v20 = [NSNumber numberWithBool:v7];
  v25[3] = v20;
  BOOL v21 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];

  [(CPSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.ClipServices.DidTapOpenButtonInCard" clipBundleIdentifier:v13 payload:v21];
  if (v17) {

  }
  if (v14) {
}
  }

- (void)recordDidShowErrorWithBundleID:(id)a3 place:(id)a4 errorCode:(int64_t)a5
{
  void v14[2] = *MEMORY[0x263EF8340];
  v13[0] = @"place";
  v13[1] = @"errorCode";
  v14[0] = a4;
  BOOL v8 = NSNumber;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 numberWithInteger:a5];
  v14[1] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  [(CPSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.ClipServices.DidShowError" clipBundleIdentifier:v10 payload:v12];
}

- (void)recordDidTapAppStoreBannerWithBundleID:(id)a3
{
}

- (void)recordDidShowLocationConsentWithBundleID:(id)a3 response:(unint64_t)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v9 = @"locationConfirmationResponse";
  if (a4 - 1 > 2) {
    BOOL v5 = @"unknown";
  }
  else {
    BOOL v5 = off_26424FCA8[a4 - 1];
  }
  v10[0] = v5;
  BOOL v6 = NSDictionary;
  id v7 = a3;
  BOOL v8 = [v6 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(CPSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.ClipServices.DidShowLocationConsent" clipBundleIdentifier:v7 payload:v8];
}

- (void)recordDidOpenAppClipWithBundleID:(id)a3 launchReason:(id)a4 didShowCard:(BOOL)a5 didOpenFullApp:(BOOL)a6 didInstallAppClip:(BOOL)a7 isOutOfBoxURL:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  v24[5] = *MEMORY[0x263EF8340];
  int v14 = @"Other";
  if (a4) {
    int v14 = (__CFString *)a4;
  }
  v24[0] = v14;
  v23[0] = @"launchReason";
  v23[1] = @"showedCard";
  id v15 = NSNumber;
  id v16 = a4;
  id v17 = a3;
  id v18 = [v15 numberWithBool:v11];
  v24[1] = v18;
  v23[2] = @"openedFullApp";
  id v19 = [NSNumber numberWithBool:v10];
  v24[2] = v19;
  v23[3] = @"installedAppClip";
  id v20 = [NSNumber numberWithBool:v9];
  v24[3] = v20;
  v23[4] = @"isOutOfBoxURL";
  BOOL v21 = [NSNumber numberWithBool:v8];
  void v24[4] = v21;
  id v22 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:5];

  [(CPSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.ClipServices.DidOpenAppClip" clipBundleIdentifier:v17 payload:v22];
}

- (void)recordReportProblemStepCompletedWithBundleID:(id)a3 problemLabel:(id)a4 event:(int64_t)a5
{
  void v14[2] = *MEMORY[0x263EF8340];
  if (a4) {
    id v7 = (__CFString *)a4;
  }
  else {
    id v7 = @"null";
  }
  v13[0] = @"problemLabel";
  v13[1] = @"event";
  v14[0] = v7;
  if ((unint64_t)a5 > 5) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = off_26424FCC0[a5];
  }
  v14[1] = v8;
  BOOL v9 = NSDictionary;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 dictionaryWithObjects:v14 forKeys:v13 count:2];

  [(CPSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.ClipServices.ReportProblemStepCompleted" clipBundleIdentifier:v11 payload:v12];
}

- (void)_sendEventLazyWithName:(id)a3 clipBundleIdentifier:(id)a4 payload:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__CPSAnalyticsLogger__sendEventLazyWithName_clipBundleIdentifier_payload___block_invoke;
  block[3] = &unk_26424EA90;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(analyticsSynchronizationQueue, block);
}

void __74__CPSAnalyticsLogger__sendEventLazyWithName_clipBundleIdentifier_payload___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  AnalyticsSendEventLazy();
}

id __74__CPSAnalyticsLogger__sendEventLazyWithName_clipBundleIdentifier_payload___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = @"null";
  if (*(void *)(a1 + 32)) {
    id v2 = *(__CFString **)(a1 + 32);
  }
  BOOL v6 = @"clipBundleIdentifier";
  v7[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = (void *)[v3 mutableCopy];

  if ([*(id *)(a1 + 40) count]) {
    [v4 addEntriesFromDictionary:*(void *)(a1 + 40)];
  }

  return v4;
}

- (void).cxx_destruct
{
}

- (void)didPresentInvocationCardForClip:(os_log_t)log adamID:sourceBundleIdentifier:referrerBundleIdentifier:event:url:didShowCardInline:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21559C000, log, OS_LOG_TYPE_ERROR, "Unable to log app clip card metrics due to invalid parameters", v1, 2u);
}

void __137__CPSAnalyticsLogger_didPresentInvocationCardForClip_adamID_sourceBundleIdentifier_referrerBundleIdentifier_event_url_didShowCardInline___block_invoke_2_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "cps_privacyPreservingDescription");
  int v5 = 138543362;
  BOOL v6 = v4;
  _os_log_error_impl(&dword_21559C000, v3, OS_LOG_TYPE_ERROR, "Unable to send app clip card metrics due to error %{public}@", (uint8_t *)&v5, 0xCu);
}

@end