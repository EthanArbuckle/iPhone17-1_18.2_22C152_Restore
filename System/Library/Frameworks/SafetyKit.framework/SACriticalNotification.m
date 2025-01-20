@interface SACriticalNotification
- (SACriticalNotification)initWithBundleManager:(id)a3;
- (id)_createNotification;
- (void)_createNotification;
- (void)sendNotificationWithCompletionHandler:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation SACriticalNotification

- (SACriticalNotification)initWithBundleManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SACriticalNotification;
  v6 = [(SACriticalNotification *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleManager, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.sosd.usernotification"];
    center = v7->_center;
    v7->_center = (UNUserNotificationCenter *)v8;

    [(UNUserNotificationCenter *)v7->_center setDelegate:v7];
    [(UNUserNotificationCenter *)v7->_center setWantsNotificationResponsesDelivered];
    v10 = [MEMORY[0x263F1DF28] categoryWithIdentifier:@"CRASH" actions:MEMORY[0x263EFFA68] intentIdentifiers:MEMORY[0x263EFFA68] options:0];
    v11 = v7->_center;
    v12 = [MEMORY[0x263EFFA08] setWithObject:v10];
    [(UNUserNotificationCenter *)v11 setNotificationCategories:v12];
  }
  return v7;
}

- (void)sendNotificationWithCompletionHandler:(id)a3
{
  v6 = (void (**)(id, void *))a3;
  v4 = [(SACriticalNotification *)self _createNotification];
  if (!v4)
  {
    id v5 = +[SAError errorWithCode:4];
    v6[2](v6, v5);
  }
  [(UNUserNotificationCenter *)self->_center addNotificationRequest:v4 withCompletionHandler:v6];
}

- (id)_createNotification
{
  v2 = +[SAAuthorization approvedBundleId];
  if (!v2)
  {
    id v5 = 0;
    goto LABEL_5;
  }
  v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:v2];
  if (v3)
  {
    v4 = v3;
    id v5 = [v3 objectForInfoDictionaryKey:@"CFBundleName"];

LABEL_5:
    v6 = objc_opt_new();
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_TITLE" value:&stru_26F9E5E48 table:0];
    [v6 setTitle:v8];

    v9 = NSString;
    v10 = [v7 localizedStringForKey:@"NOTIFICATION_BODY" value:&stru_26F9E5E48 table:0];
    v11 = objc_msgSend(v9, "stringWithFormat:", v10, v5);
    [v6 setBody:v11];

    v12 = [MEMORY[0x263F1DF68] defaultSound];
    [v6 setSound:v12];

    [v6 setCategoryIdentifier:@"CRASH"];
    [v6 setShouldBackgroundDefaultAction:1];
    [v6 setShouldShowSubordinateIcon:1];
    [v6 setShouldIgnoreDoNotDisturb:1];
    v13 = [MEMORY[0x263F1DF40] iconForApplicationIdentifier:v2];
    [v6 setIcon:v13];

    objc_super v14 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"SACriticalNotification" content:v6 trigger:0];

    goto LABEL_9;
  }
  id v5 = sa_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SACriticalNotification _createNotification](v5);
  }
  objc_super v14 = 0;
LABEL_9:

  return v14;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(void))a5;
  v9 = sa_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SACriticalNotification userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:](v7, v9);
  }

  v10 = [v7 actionIdentifier];
  int v11 = [v10 isEqualToString:@"com.apple.UNNotificationDefaultActionIdentifier"];

  if (v11)
  {
    v12 = sa_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_245182000, v12, OS_LOG_TYPE_DEFAULT, "Launching app in foreground because of 3P notification interaction", v13, 2u);
    }

    [(SABundleManager *)self->_bundleManager wakeApprovedAppsWithReason:2 completion:0];
  }
  v8[2](v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleManager, 0);

  objc_storeStrong((id *)&self->_center, 0);
}

- (void)_createNotification
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_245182000, log, OS_LOG_TYPE_ERROR, "Unable to get Bundle for currently authorized app: %@", (uint8_t *)&v1, 0xCu);
}

- (void)userNotificationCenter:(void *)a1 didReceiveNotificationResponse:(NSObject *)a2 withCompletionHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 actionIdentifier];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_245182000, a2, OS_LOG_TYPE_DEBUG, "Notification response: %@", (uint8_t *)&v4, 0xCu);
}

@end