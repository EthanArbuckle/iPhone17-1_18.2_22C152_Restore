@interface WFLocalNotificationAccessResource
+ (BOOL)isSystemResource;
+ (void)requestLocalNotificationsAuthorizationWithCompletionHandler:(id)a3;
- (id)icon;
- (id)name;
- (unint64_t)status;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation WFLocalNotificationAccessResource

+ (void)requestLocalNotificationsAuthorizationWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F1DFB0] workflowNotificationCenter];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __97__WFLocalNotificationAccessResource_requestLocalNotificationsAuthorizationWithCompletionHandler___block_invoke;
  v6[3] = &unk_264E59738;
  id v7 = v3;
  id v5 = v3;
  [v4 requestAuthorizationWithOptions:6 completionHandler:v6];
}

uint64_t __97__WFLocalNotificationAccessResource_requestLocalNotificationsAuthorizationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (BOOL)isSystemResource
{
  return 1;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = objc_opt_class();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __86__WFLocalNotificationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v8[3] = &unk_264E5CD58;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 requestLocalNotificationsAuthorizationWithCompletionHandler:v8];
}

void __86__WFLocalNotificationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __86__WFLocalNotificationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
  v8[3] = &unk_264E587D8;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __86__WFLocalNotificationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshAvailabilityWithNotification];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (unint64_t)status
{
  return 4;
}

- (id)icon
{
  return (id)[MEMORY[0x263F85308] workflowKitImageNamed:@"Notification"];
}

- (id)name
{
  return WFLocalizedString(@"Notifications");
}

@end