@interface CPSMetrics
+ (void)_sendEvent:(id)a3 withPayloadBuilder:(id)a4;
+ (void)sendAppSignInSessionActivatedEvent:(id)a3;
+ (void)sendAppSignInSessionCompletedEvent:(id)a3;
+ (void)sendLearnMorePressedEvent;
+ (void)sendProviderDeviceUsageEvent:(id)a3;
+ (void)sendStorePurchaseSessionCompletedEvent:(id)a3;
+ (void)sendSystemSessionCompletedEvent:(id)a3;
@end

@implementation CPSMetrics

+ (void)sendAppSignInSessionActivatedEvent:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__CPSMetrics_sendAppSignInSessionActivatedEvent___block_invoke;
  v3[3] = &__block_descriptor_33_e26___NSMutableDictionary_8__0l;
  char v4 = (char)a3;
  [a1 _sendEvent:@"com.apple.appletv.comp-auth.app-sign-in.activated" withPayloadBuilder:v3];
}

id __49__CPSMetrics_sendAppSignInSessionActivatedEvent___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = [NSNumber numberWithBool:*(unsigned char *)(a1 + 32) & 1];
  [v2 setObject:v3 forKeyedSubscript:@"reqAppleID"];

  char v4 = [NSNumber numberWithBool:(*(unsigned __int8 *)(a1 + 32) >> 1) & 1];
  [v2 setObject:v4 forKeyedSubscript:@"reqPassword"];

  v5 = [NSNumber numberWithBool:(*(unsigned __int8 *)(a1 + 32) >> 2) & 1];
  [v2 setObject:v5 forKeyedSubscript:@"custOther"];

  v6 = [NSNumber numberWithBool:(*(unsigned __int8 *)(a1 + 32) >> 3) & 1];
  [v2 setObject:v6 forKeyedSubscript:@"custRestorePurchase"];

  v7 = [NSNumber numberWithBool:(*(unsigned __int8 *)(a1 + 32) >> 4) & 1];
  [v2 setObject:v7 forKeyedSubscript:@"custVideoSubscriber"];

  v8 = [NSNumber numberWithBool:(*(unsigned __int8 *)(a1 + 32) >> 5) & 1];
  [v2 setObject:v8 forKeyedSubscript:@"trusAssocDomains"];

  return v2;
}

+ (void)sendAppSignInSessionCompletedEvent:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__CPSMetrics_sendAppSignInSessionCompletedEvent___block_invoke;
  v3[3] = &__block_descriptor_40_e26___NSMutableDictionary_8__0l;
  void v3[4] = a3.var0;
  [a1 _sendEvent:@"com.apple.appletv.comp-auth.app-sign-in.completed" withPayloadBuilder:v3];
}

id __49__CPSMetrics_sendAppSignInSessionCompletedEvent___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = v2;
  unint64_t v4 = *(void *)(a1 + 32) - 1;
  if (v4 > 0xB) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (uint64_t)*(&off_26528A338 + v4);
  }
  [v2 setObject:v5 forKeyedSubscript:@"result"];
  return v3;
}

+ (void)sendLearnMorePressedEvent
{
}

+ (void)sendProviderDeviceUsageEvent:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3254779904;
  v5[2] = __43__CPSMetrics_sendProviderDeviceUsageEvent___block_invoke;
  v5[3] = &__block_descriptor_48_e8_32n11_8_8_s0_t8w8_e19___NSDictionary_8__0l;
  $71100933E073B1738DE2D0F5F21910C1 v6 = a3;
  id v4 = a3.var0;
  [a1 _sendEvent:@"com.apple.appletv.comp-auth.provider-device-usage" withPayloadBuilder:v5];
}

id __43__CPSMetrics_sendProviderDeviceUsageEvent___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  int v3 = GestaltProductTypeStringToDeviceClass();
  if (v3 == 1)
  {
    id v4 = @"phone";
  }
  else
  {
    if (v3 != 3) {
      goto LABEL_6;
    }
    id v4 = @"pad";
  }
  [v2 setObject:v4 forKeyedSubscript:@"deviceClass"];
LABEL_6:
  uint64_t v5 = [NSNumber numberWithBool:(*(void *)(a1 + 40) >> 19) & 1];
  [v2 setObject:v5 forKeyedSubscript:@"flagsOwner"];

  $71100933E073B1738DE2D0F5F21910C1 v6 = [NSNumber numberWithBool:(*(void *)(a1 + 40) >> 13) & 1];
  [v2 setObject:v6 forKeyedSubscript:@"flagsHome"];

  v7 = [NSNumber numberWithBool:(*(void *)(a1 + 40) >> 14) & 1];
  [v2 setObject:v7 forKeyedSubscript:@"flagsFamily"];

  v8 = [NSNumber numberWithBool:(*(void *)(a1 + 40) >> 15) & 1];
  [v2 setObject:v8 forKeyedSubscript:@"flagsPaired"];

  return v2;
}

+ (void)sendStorePurchaseSessionCompletedEvent:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__CPSMetrics_sendStorePurchaseSessionCompletedEvent___block_invoke;
  v3[3] = &__block_descriptor_40_e26___NSMutableDictionary_8__0l;
  void v3[4] = a3.var0;
  [a1 _sendEvent:@"com.apple.appletv.comp-auth.store-purchase.completed" withPayloadBuilder:v3];
}

id __53__CPSMetrics_sendStorePurchaseSessionCompletedEvent___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  int v3 = v2;
  unint64_t v4 = *(void *)(a1 + 32) - 1;
  if (v4 > 0xB) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (uint64_t)*(&off_26528A338 + v4);
  }
  [v2 setObject:v5 forKeyedSubscript:@"result"];
  return v3;
}

+ (void)sendSystemSessionCompletedEvent:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__CPSMetrics_sendSystemSessionCompletedEvent___block_invoke;
  v3[3] = &__block_descriptor_48_e26___NSMutableDictionary_8__0l;
  $0AC6E346AE4835514AAA8AC86D8F4844 v4 = a3;
  [a1 _sendEvent:@"com.apple.appletv.comp-auth.system-auth.completed" withPayloadBuilder:v3];
}

id __46__CPSMetrics_sendSystemSessionCompletedEvent___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v3 = *(void *)(a1 + 32) - 1;
  if (v3 >= 4)
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 v4 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", *(void *)(a1 + 32));
  }
  else
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 v4 = *(&off_26528A318 + v3);
  }
  [v2 setObject:v4 forKeyedSubscript:@"service"];

  unint64_t v5 = *(void *)(a1 + 40) - 1;
  if (v5 > 0xB) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = (uint64_t)*(&off_26528A338 + v5);
  }
  [v2 setObject:v6 forKeyedSubscript:@"result"];
  return v2;
}

+ (void)_sendEvent:(id)a3 withPayloadBuilder:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (MetricsLog_token != -1) {
    dispatch_once(&MetricsLog_token, &__block_literal_global_2);
  }
  v7 = MetricsLog_log;
  if (os_log_type_enabled((os_log_t)MetricsLog_log, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_24A684000, v7, OS_LOG_TYPE_DEFAULT, "Send event: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  if (v6) {
    AnalyticsSendEventLazy();
  }
  else {
    AnalyticsSendEvent();
  }
}

@end