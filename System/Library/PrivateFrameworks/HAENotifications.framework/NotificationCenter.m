@interface NotificationCenter
+ (BOOL)_healthAppHidden;
- (NotificationCenter)init;
- (void)handleNotificationAction:(id)a3;
- (void)sendNotificationWithExposureLevel:(double)a3 duration:(double)a4 eventType:(unsigned int)a5 volumeLoweringAction:(unsigned int)a6;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation NotificationCenter

- (NotificationCenter)init
{
  v6.receiver = self;
  v6.super_class = (Class)NotificationCenter;
  v2 = [(NotificationCenter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.coreaudio.adam.hae"];
    userNotificationCenter = v2->_userNotificationCenter;
    v2->_userNotificationCenter = (UNUserNotificationCenter *)v3;

    [(UNUserNotificationCenter *)v2->_userNotificationCenter setDelegate:v2];
    [(UNUserNotificationCenter *)v2->_userNotificationCenter setWantsNotificationResponsesDelivered];
    v2->_hasHaptics = MGGetBoolAnswer();
  }
  return v2;
}

- (void)sendNotificationWithExposureLevel:(double)a3 duration:(double)a4 eventType:(unsigned int)a5 volumeLoweringAction:(unsigned int)a6
{
  if (a5 == 2003133803)
  {
    v8 = HAENLocalizationUtilityGetBundle();
    v12 = [v8 localizedStringForKey:@"MessageShortlookWeekly" value:&stru_26D14F6C0 table:0];
    body = self->_body;
    self->_body = v12;
    v11 = @"hae.weekly.ios";
    goto LABEL_5;
  }
  if (a5 == 1818850917)
  {
    v8 = HAENLocalizationUtilityGetBundle();
    v9 = [v8 localizedStringForKey:@"MessageShortlookLoud" value:&stru_26D14F6C0 table:0];
    body = self->_body;
    self->_body = v9;
    v11 = @"hae.loud.ios";
LABEL_5:

    BOOL v13 = +[NotificationCenter _healthAppHidden];
    v14 = (void *)MEMORY[0x263F1DF10];
    v15 = HAENLocalizationUtilityGetBundle();
    v16 = [v15 localizedStringForKey:@"ButtonLearnMoreInHealth" value:&stru_26D14F6C0 table:0];
    v17 = [v14 actionWithIdentifier:@"HAEActionLearnMoreInHealth" title:v16 options:1];

    id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
    v19 = v18;
    if (v13)
    {
      v20 = HAENotificationsLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_21FABA000, v20, OS_LOG_TYPE_DEFAULT, "Health app is hidden...", v39, 2u);
      }
    }
    else
    {
      [v18 addObject:v17];
    }
    v21 = HAENLocalizationUtilityGetBundle();
    v22 = [v21 localizedStringForKey:@"NotificationTitleIOS" value:&stru_26D14F6C0 table:0];
    title = self->_title;
    self->_title = v22;

    if (a6 != 1986817143)
    {
      v24 = HAENLocalizationUtilityGetBundle();
      v25 = [v24 localizedStringForKey:@"NotificationTitleRecommendation" value:&stru_26D14F6C0 table:0];
      v26 = self->_title;
      self->_title = v25;

      v27 = HAENLocalizationUtilityGetBundle();
      v28 = [v27 localizedStringForKey:@"MessageRecommendation" value:&stru_26D14F6C0 table:0];
      v29 = self->_body;
      self->_body = v28;
    }
    v30 = [MEMORY[0x263F1DF28] categoryWithIdentifier:v11 actions:v19 intentIdentifiers:MEMORY[0x263EFFA68] options:0];
    userNotificationCenter = self->_userNotificationCenter;
    v32 = [MEMORY[0x263EFFA08] setWithObject:v30];
    [(UNUserNotificationCenter *)userNotificationCenter setNotificationCategories:v32];

    id v33 = objc_alloc_init(MEMORY[0x263F1DEF0]);
    [v33 setTitle:self->_title];
    [v33 setSubtitle:self->_subtitle];
    [v33 setBody:self->_body];
    v34 = [MEMORY[0x263F1DF00] soundWithAlertType:16];
    [v34 setAlertTopic:*MEMORY[0x263F7FD68]];
    [v34 setToneIdentifier:*MEMORY[0x263F7FD70]];
    [v33 setSound:v34];
    [v33 setCategoryIdentifier:v11];
    [v33 setThreadIdentifier:@"com.apple.coreaudio.hae.notification"];
    [v33 setShouldBackgroundDefaultAction:1];
    v35 = (void *)MEMORY[0x263F1DF48];
    v36 = [MEMORY[0x263F08C38] UUID];
    v37 = [v36 UUIDString];
    v38 = [v35 requestWithIdentifier:v37 content:v33 trigger:0 destinations:15];

    [(UNUserNotificationCenter *)self->_userNotificationCenter addNotificationRequest:v38 withCompletionHandler:&__block_literal_global_2];
    goto LABEL_15;
  }
  v17 = HAENotificationsLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[NotificationCenter sendNotificationWithExposureLevel:duration:eventType:volumeLoweringAction:](v17);
  }
LABEL_15:
}

void __96__NotificationCenter_sendNotificationWithExposureLevel_duration_eventType_volumeLoweringAction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = HAENotificationsLog();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __96__NotificationCenter_sendNotificationWithExposureLevel_duration_eventType_volumeLoweringAction___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21FABA000, v4, OS_LOG_TYPE_DEFAULT, "HAE live exposure notification sent", v5, 2u);
  }
}

- (void)handleNotificationAction:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (__CFString *)a3;
  uint64_t v4 = *MEMORY[0x263F3F5E8];
  v19[0] = *MEMORY[0x263F3F608];
  v19[1] = v4;
  v20[0] = MEMORY[0x263EFFA88];
  v20[1] = MEMORY[0x263EFFA88];
  v5 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  if ([(__CFString *)v3 isEqualToString:*MEMORY[0x263F1E0C8]])
  {
    objc_super v6 = HAENotificationsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v3;
      _os_log_impl(&dword_21FABA000, v6, OS_LOG_TYPE_DEFAULT, "HAE Notification Action: %@", buf, 0xCu);
    }

    v7 = [MEMORY[0x263F01880] defaultWorkspace];
    v8 = [NSURL URLWithString:@"prefs:root=Sounds&path=HEADPHONE_LEVEL_LIMIT_SETTING"];
    id v16 = 0;
    [v7 openSensitiveURL:v8 withOptions:v5 error:&v16];
    v9 = v16;

    if (v9)
    {
      v10 = HAENotificationsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[NotificationCenter handleNotificationAction:]();
      }
LABEL_13:
    }
  }
  else
  {
    int v11 = [(__CFString *)v3 isEqualToString:@"HAEActionLearnMoreInHealth"];
    v9 = HAENotificationsLog();
    BOOL v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        id v18 = @"HAEActionLearnMoreInHealth";
        _os_log_impl(&dword_21FABA000, v9, OS_LOG_TYPE_DEFAULT, "HAE Notification Action: %@", buf, 0xCu);
      }

      BOOL v13 = [MEMORY[0x263F01880] defaultWorkspace];
      v14 = [NSURL URLWithString:@"x-apple-Health://HearingAppPlugin.healthplugin/SafeHeadphoneListening"];
      id v15 = 0;
      [v13 openSensitiveURL:v14 withOptions:v5 error:&v15];
      v9 = v15;

      if (v9)
      {
        v10 = HAENotificationsLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[NotificationCenter handleNotificationAction:]();
        }
        goto LABEL_13;
      }
    }
    else if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v3;
      _os_log_impl(&dword_21FABA000, v9, OS_LOG_TYPE_DEFAULT, "Unknown HAE Notification Action: %@", buf, 0xCu);
    }
  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(void))a5;
  v9 = [v7 notification];
  v10 = [v9 request];
  int v11 = [v10 content];
  BOOL v12 = [v11 categoryIdentifier];

  if ([v12 hasPrefix:@"hae."])
  {
    BOOL v13 = [v7 actionIdentifier];
    [(NotificationCenter *)self handleNotificationAction:v13];

    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v14 = HAENotificationsLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[NotificationCenter userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]();
  }

  if (v8) {
LABEL_7:
  }
    v8[2](v8);
LABEL_8:
}

+ (BOOL)_healthAppHidden
{
  id v2 = [MEMORY[0x263F0A978] sharedBehavior];
  int v3 = [v2 isAppleWatch];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F53C50] sharedConnection];
    v5 = [v4 restrictedAppBundleIDs];
    uint64_t v6 = *MEMORY[0x263F0AD00];
    char v7 = [v5 containsObject:*MEMORY[0x263F0AD00]];
    v8 = [v4 parentalControlsBlacklistedAppBundleIDs];
    char v9 = [v8 containsObject:v6];
    if ([v4 effectiveBoolValueForSetting:*MEMORY[0x263F538F8]] == 2) {
      char v10 = 1;
    }
    else {
      char v10 = v7;
    }
    char v11 = v10 | v9;
  }
  else
  {
    BOOL v12 = [MEMORY[0x263F01868] applicationProxyForIdentifier:*MEMORY[0x263F0AD00] placeholder:0];
    uint64_t v4 = v12;
    if (!v12)
    {
      char v11 = 0;
      goto LABEL_10;
    }
    v5 = [v12 appState];
    char v11 = [v5 isRestricted];
  }

LABEL_10:
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

- (void)sendNotificationWithExposureLevel:(os_log_t)log duration:eventType:volumeLoweringAction:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FABA000, log, OS_LOG_TYPE_ERROR, "Unknown event type", v1, 2u);
}

void __96__NotificationCenter_sendNotificationWithExposureLevel_duration_eventType_volumeLoweringAction___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FABA000, v0, v1, "HAE live exposure notification error: %@", v2, v3, v4, v5, v6);
}

- (void)handleNotificationAction:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FABA000, v0, v1, "Failed to open settings because %@", v2, v3, v4, v5, v6);
}

- (void)handleNotificationAction:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FABA000, v0, v1, "Failed to open health app because %@", v2, v3, v4, v5, v6);
}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FABA000, v0, v1, "Unknown HAE Notification Category Identifier: %@", v2, v3, v4, v5, v6);
}

@end