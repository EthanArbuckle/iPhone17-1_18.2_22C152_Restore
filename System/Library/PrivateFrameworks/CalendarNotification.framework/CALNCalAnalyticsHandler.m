@interface CALNCalAnalyticsHandler
+ (CALNCalAnalyticsHandler)sharedInstance;
- (void)recordNotificationResponse:(id)a3;
- (void)recordPostedNotification:(id)a3;
@end

@implementation CALNCalAnalyticsHandler

+ (CALNCalAnalyticsHandler)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__CALNCalAnalyticsHandler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_handler;
  return (CALNCalAnalyticsHandler *)v2;
}

uint64_t __41__CALNCalAnalyticsHandler_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_handler = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (void)recordPostedNotification:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"notificationType";
  v3 = [a3 sourceIdentifier];
  v6[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  CalAnalyticsSendEvent();
}

- (void)recordNotificationResponse:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"notificationType";
  id v3 = a3;
  v4 = [v3 notificationRecord];
  v5 = [v4 sourceIdentifier];
  v8[1] = @"actionIdentifier";
  v9[0] = v5;
  v6 = [v3 actionIdentifier];

  v9[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  CalAnalyticsSendEvent();
}

@end