@interface FAPushNotificationHandler
+ (id)sharedHandler;
- (void)didReceivePushNotificationWithPayload:(id)a3;
@end

@implementation FAPushNotificationHandler

+ (id)sharedHandler
{
  if (sharedHandler_onceToken != -1) {
    dispatch_once(&sharedHandler_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedHandler_handler;
  return v2;
}

uint64_t __42__FAPushNotificationHandler_sharedHandler__block_invoke()
{
  sharedHandler_handler = objc_alloc_init(FAPushNotificationHandler);
  return MEMORY[0x1F41817F8]();
}

- (void)didReceivePushNotificationWithPayload:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "FAPushNotificationHandler: Received payload %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = [[FAHandleFamilyEventPushNotificationRequest alloc] initWithPayload:v3];
  [(FAHandleFamilyEventPushNotificationRequest *)v5 startRequestWithCompletionHandler:&__block_literal_global_20];
}

void __67__FAPushNotificationHandler_didReceivePushNotificationWithPayload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1D252C000, v3, OS_LOG_TYPE_DEFAULT, "FAPushNotificationHandler: Error handling push notification - %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

@end