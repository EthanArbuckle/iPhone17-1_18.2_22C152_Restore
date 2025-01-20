@interface BCLogger
+ (void)logEventWithName:(id)a3 businessURI:(id)a4 callToActionText:(id)a5 bizItemReturnedAfterAction:(BOOL)a6 latency:(int64_t)a7;
+ (void)logEventWithName:(id)a3 version:(int64_t)a4 authDomain:(id)a5 status:(id)a6;
- (void)mt_log_icloud_messages_apps_businessframework:(id)a3 version:(int64_t)a4;
@end

@implementation BCLogger

- (void)mt_log_icloud_messages_apps_businessframework:(id)a3 version:(int64_t)a4
{
  id v5 = a3;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __66__BCLogger_mt_log_icloud_messages_apps_businessframework_version___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v6[0] = @"messageType";
  v6[1] = @"payloadVersion";
  v7[0] = v2;
  v3 = [NSNumber numberWithInteger:v1];
  v7[1] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (void)logEventWithName:(id)a3 businessURI:(id)a4 callToActionText:(id)a5 bizItemReturnedAfterAction:(BOOL)a6 latency:(int64_t)a7
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 length] && objc_msgSend(v10, "length"))
  {
    id v12 = v10;
    id v13 = v11;
    AnalyticsSendEventLazy();
  }
}

id __93__BCLogger_logEventWithName_businessURI_callToActionText_bizItemReturnedAfterAction_latency___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"bizIdCallToAction";
  uint64_t v2 = [NSString stringWithFormat:@"%@ - %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  v8[0] = v2;
  v7[1] = @"chatSuggestLatencyInMiliSeconds";
  v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v8[1] = v3;
  v7[2] = @"bizItemReturnedAfterAction";
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v8[2] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

+ (void)logEventWithName:(id)a3 version:(int64_t)a4 authDomain:(id)a5 status:(id)a6
{
  id v7 = a5;
  id v10 = a6;
  id v8 = v7;
  id v9 = v10;
  AnalyticsSendEventLazy();
}

id __55__BCLogger_logEventWithName_version_authDomain_status___block_invoke(void *a1)
{
  void v7[3] = *MEMORY[0x263EF8340];
  v7[0] = a1[4];
  v6[0] = @"authStatus";
  v6[1] = @"payloadVersion";
  uint64_t v2 = [NSNumber numberWithInteger:a1[6]];
  void v6[2] = @"authProvider";
  uint64_t v3 = a1[5];
  v7[1] = v2;
  v7[2] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

@end