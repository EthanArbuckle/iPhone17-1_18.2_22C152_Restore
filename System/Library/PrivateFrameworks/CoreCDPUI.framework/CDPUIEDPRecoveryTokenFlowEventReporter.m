@interface CDPUIEDPRecoveryTokenFlowEventReporter
+ (void)sendDontHaveKeyAlertPresentedEventIncludingRPD:(BOOL)a3 context:(id)a4;
+ (void)sendIntroViewAppearedEventWithContext:(id)a3 showCancel:(BOOL)a4;
+ (void)sendIntroViewEscapeOfferSelectedEventForOffer:(id)a3 context:(id)a4;
+ (void)sendTokenEntryEscapeOfferSelectedEventForOffer:(id)a3 context:(id)a4;
+ (void)sendTokenEntryViewAppearedEventWithContext:(id)a3;
@end

@implementation CDPUIEDPRecoveryTokenFlowEventReporter

+ (void)sendIntroViewAppearedEventWithContext:(id)a3 showCancel:(BOOL)a4
{
  BOOL v4 = a4;
  v13[3] = *(id *)MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263F202A8] analyticsEventWithContext:a3 eventName:*MEMORY[0x263F345A0] category:*MEMORY[0x263F34830]];
  v6 = (id *)MEMORY[0x263F34858];
  if (!v4) {
    v6 = (id *)MEMORY[0x263F34850];
  }
  v7 = (void *)*MEMORY[0x263F34868];
  v13[0] = *v6;
  v13[1] = v7;
  v13[2] = *(id *)MEMORY[0x263F34960];
  v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = v13[0];
  v10 = [v8 arrayWithObjects:v13 count:3];
  v11 = objc_msgSend(v10, "aaf_arrayAsCommaSeperatedString");
  [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x263F345E8]];

  v12 = [MEMORY[0x263F34338] rtcAnalyticsReporter];

  [v12 sendEvent:v5];
}

+ (void)sendIntroViewEscapeOfferSelectedEventForOffer:(id)a3 context:(id)a4
{
  v5 = (void *)MEMORY[0x263F202A8];
  uint64_t v6 = *MEMORY[0x263F34598];
  uint64_t v7 = *MEMORY[0x263F34830];
  id v8 = a3;
  id v10 = [v5 analyticsEventWithContext:a4 eventName:v6 category:v7];
  [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x263F345F8]];

  id v9 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v9 sendEvent:v10];
}

+ (void)sendDontHaveKeyAlertPresentedEventIncludingRPD:(BOOL)a3 context:(id)a4
{
  BOOL v4 = a3;
  v11[1] = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263F202A8] analyticsEventWithContext:a4 eventName:*MEMORY[0x263F34578] category:*MEMORY[0x263F34830]];
  uint64_t v6 = (void *)MEMORY[0x263EFF980];
  v11[0] = *MEMORY[0x263F34968];
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v8 = [v6 arrayWithArray:v7];

  if (v4) {
    [v8 addObject:*MEMORY[0x263F34918]];
  }
  [v8 addObject:*MEMORY[0x263F34858]];
  id v9 = objc_msgSend(v8, "aaf_arrayAsCommaSeperatedString");
  [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x263F345E8]];

  id v10 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v10 sendEvent:v5];
}

+ (void)sendTokenEntryViewAppearedEventWithContext:(id)a3
{
  v8[3] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F202A8] analyticsEventWithContext:a3 eventName:*MEMORY[0x263F34588] category:*MEMORY[0x263F34830]];
  uint64_t v4 = *MEMORY[0x263F34868];
  v8[0] = *MEMORY[0x263F34850];
  v8[1] = v4;
  v8[2] = *MEMORY[0x263F34958];
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
  uint64_t v6 = objc_msgSend(v5, "aaf_arrayAsCommaSeperatedString");
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x263F345E8]];

  uint64_t v7 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v7 sendEvent:v3];
}

+ (void)sendTokenEntryEscapeOfferSelectedEventForOffer:(id)a3 context:(id)a4
{
  v5 = (void *)MEMORY[0x263F202A8];
  uint64_t v6 = *MEMORY[0x263F34580];
  uint64_t v7 = *MEMORY[0x263F34830];
  id v8 = a3;
  id v10 = [v5 analyticsEventWithContext:a4 eventName:v6 category:v7];
  [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x263F345F8]];

  id v9 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v9 sendEvent:v10];
}

@end