@interface CALNUNDefaultUserNotificationCenter
- (BOOL)addNotificationRequest:(id)a3 error:(id *)a4;
- (BOOL)replaceContentForRequestWithIdentifier:(id)a3 replacementContent:(id)a4 error:(id *)a5;
- (CALNUNDefaultUserNotificationCenter)initWithBundleIdentifier:(id)a3;
- (UNUserNotificationCenter)userNotificationCenter;
- (UNUserNotificationCenterDelegate)delegate;
- (id)deliveredNotifications;
- (id)notificationCategories;
- (id)notificationSettings;
- (id)notificationSettingsForTopics;
- (void)removeAllDeliveredNotifications;
- (void)removeAllPendingNotificationRequests;
- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationCategories:(id)a3;
- (void)setWantsNotificationResponsesDelivered;
@end

@implementation CALNUNDefaultUserNotificationCenter

- (CALNUNDefaultUserNotificationCenter)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNUNDefaultUserNotificationCenter;
  v5 = [(CALNUNDefaultUserNotificationCenter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:v4];
    userNotificationCenter = v5->_userNotificationCenter;
    v5->_userNotificationCenter = (UNUserNotificationCenter *)v6;
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNUNDefaultUserNotificationCenter *)self userNotificationCenter];
  [v5 setDelegate:v4];
}

- (UNUserNotificationCenterDelegate)delegate
{
  v2 = [(CALNUNDefaultUserNotificationCenter *)self userNotificationCenter];
  v3 = [v2 delegate];

  return (UNUserNotificationCenterDelegate *)v3;
}

- (void)setNotificationCategories:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNUNDefaultUserNotificationCenter *)self userNotificationCenter];
  [v5 setNotificationCategories:v4];
}

- (id)notificationCategories
{
  v2 = [(CALNUNDefaultUserNotificationCenter *)self userNotificationCenter];
  v3 = [v2 notificationCategories];

  return v3;
}

- (BOOL)addNotificationRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(CALNUNDefaultUserNotificationCenter *)self userNotificationCenter];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__CALNUNDefaultUserNotificationCenter_addNotificationRequest_error___block_invoke;
  v9[3] = &unk_2645C0D70;
  id v10 = v5;
  id v7 = v5;
  [v6 addNotificationRequest:v7 withCompletionHandler:v9];

  return 1;
}

void __68__CALNUNDefaultUserNotificationCenter_addNotificationRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__CALNUNDefaultUserNotificationCenter_addNotificationRequest_error___block_invoke_cold_1((uint64_t)v3, a1, v4);
    }
  }
}

- (BOOL)replaceContentForRequestWithIdentifier:(id)a3 replacementContent:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [(CALNUNDefaultUserNotificationCenter *)self userNotificationCenter];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __103__CALNUNDefaultUserNotificationCenter_replaceContentForRequestWithIdentifier_replacementContent_error___block_invoke;
  v12[3] = &unk_2645C0D70;
  id v13 = v7;
  id v10 = v7;
  [v9 replaceContentForRequestWithIdentifier:v10 replacementContent:v8 completionHandler:v12];

  return 1;
}

void __103__CALNUNDefaultUserNotificationCenter_replaceContentForRequestWithIdentifier_replacementContent_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __103__CALNUNDefaultUserNotificationCenter_replaceContentForRequestWithIdentifier_replacementContent_error___block_invoke_cold_1((uint64_t)v3, a1, v4);
    }
  }
}

- (id)deliveredNotifications
{
  v2 = [(CALNUNDefaultUserNotificationCenter *)self userNotificationCenter];
  id v3 = [v2 deliveredNotifications];

  return v3;
}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNUNDefaultUserNotificationCenter *)self userNotificationCenter];
  [v5 removeDeliveredNotificationsWithIdentifiers:v4];
}

- (void)removeAllDeliveredNotifications
{
  id v2 = [(CALNUNDefaultUserNotificationCenter *)self userNotificationCenter];
  [v2 removeAllDeliveredNotifications];
}

- (void)removeAllPendingNotificationRequests
{
  id v2 = [(CALNUNDefaultUserNotificationCenter *)self userNotificationCenter];
  [v2 removeAllPendingNotificationRequests];
}

- (void)setWantsNotificationResponsesDelivered
{
  id v2 = [(CALNUNDefaultUserNotificationCenter *)self userNotificationCenter];
  [v2 setWantsNotificationResponsesDelivered];
}

- (id)notificationSettings
{
  id v2 = [(CALNUNDefaultUserNotificationCenter *)self userNotificationCenter];
  id v3 = [v2 notificationSettings];

  return v3;
}

- (id)notificationSettingsForTopics
{
  id v2 = [(CALNUNDefaultUserNotificationCenter *)self userNotificationCenter];
  id v3 = [v2 notificationSettingsForTopics];

  return v3;
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void).cxx_destruct
{
}

void __68__CALNUNDefaultUserNotificationCenter_addNotificationRequest_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [*(id *)(a2 + 32) identifier];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  objc_super v9 = v5;
  _os_log_error_impl(&dword_2216BB000, a3, OS_LOG_TYPE_ERROR, "Error adding notification request, error = %@, request identifier = %{public}@", (uint8_t *)&v6, 0x16u);
}

void __103__CALNUNDefaultUserNotificationCenter_replaceContentForRequestWithIdentifier_replacementContent_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Error replacing content for notification request, error = %@, identifier = %{public}@", (uint8_t *)&v4, 0x16u);
}

@end