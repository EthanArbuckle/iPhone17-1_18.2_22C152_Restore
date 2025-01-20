@interface CALNUNUserNotificationCenter
+ (id)_statsPayloadKeyForSettingName:(id)a3 topicIdentifier:(id)a4;
+ (void)_addSettingName:(id)a3 value:(id)a4 toStatsPayload:(id)a5 forTopicIdentifier:(id)a6;
- (BOOL)addNotificationRequest:(id)a3 error:(id *)a4;
- (BOOL)isActive;
- (BOOL)replaceNotificationRequest:(id)a3 error:(id *)a4;
- (CALNNotificationStorage)storage;
- (CALNUNNotificationContentMapper)notificationContentMapper;
- (CALNUNNotificationMapper)notificationMapper;
- (CALNUNNotificationRequestMapper)notificationRequestMapper;
- (CALNUNNotificationResponseMapper)notificationResponseMapper;
- (CALNUNUserNotificationCenter)initWithBundleIdentifier:(id)a3 userNotificationCenterFactory:(id)a4 storage:(id)a5 notificationIconCache:(id)a6;
- (CALNUNUserNotificationCenterProtocol)userNotificationCenter;
- (CALNUserNotificationCenterDelegate)delegate;
- (id)_updatedRecord:(id)a3;
- (id)deliveredNotifications;
- (id)notificationCategories;
- (void)activate;
- (void)collectSettingsStats:(id)a3;
- (void)deactivate;
- (void)removeAllDeliveredNotifications;
- (void)removeAllPendingNotificationRequests;
- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationCategories:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CALNUNUserNotificationCenter

- (CALNUNUserNotificationCenter)initWithBundleIdentifier:(id)a3 userNotificationCenterFactory:(id)a4 storage:(id)a5 notificationIconCache:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CALNUNUserNotificationCenter;
  v14 = [(CALNUNUserNotificationCenter *)&v28 init];
  if (v14)
  {
    v15 = [v11 userNotificationCenterWithBundleIdentifier:v10];
    [v15 setDelegate:v14];
    userNotificationCenter = v14->_userNotificationCenter;
    v14->_userNotificationCenter = (CALNUNUserNotificationCenterProtocol *)v15;
    id v17 = v15;

    objc_storeStrong((id *)&v14->_storage, a5);
    v18 = [[CALNUNNotificationIconMapper alloc] initWithNotificationIconCache:v13];
    v19 = [[CALNUNNotificationContentMapper alloc] initWithNotificationIconMapper:v18];
    notificationContentMapper = v14->_notificationContentMapper;
    v14->_notificationContentMapper = v19;

    v21 = [[CALNUNNotificationRequestMapper alloc] initWithNotificationContentMapper:v14->_notificationContentMapper notificationIconMapper:v18];
    notificationRequestMapper = v14->_notificationRequestMapper;
    v14->_notificationRequestMapper = v21;

    v23 = [[CALNUNNotificationMapper alloc] initWithNotificationRequestMapper:v14->_notificationRequestMapper];
    notificationMapper = v14->_notificationMapper;
    v14->_notificationMapper = v23;

    v25 = [[CALNUNNotificationResponseMapper alloc] initWithNotificationMapper:v14->_notificationMapper];
    notificationResponseMapper = v14->_notificationResponseMapper;
    v14->_notificationResponseMapper = v25;
  }
  return v14;
}

- (void)activate
{
  v3 = [(CALNUNUserNotificationCenter *)self userNotificationCenter];
  [v3 setWantsNotificationResponsesDelivered];

  [(CALNUNUserNotificationCenter *)self setActive:1];
}

- (void)deactivate
{
}

- (BOOL)addNotificationRequest:(id)a3 error:(id *)a4
{
  v31[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(CALNUNUserNotificationCenter *)self isActive])
  {
    v7 = +[CALNNotificationMapper notificationRecordFromNotificationRequest:v6];
    if (v7)
    {
      v8 = [(CALNUNUserNotificationCenter *)self storage];
      [v8 addNotificationRecord:v7];

      v9 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [v7 sourceIdentifier];
        id v11 = [v7 sourceClientIdentifier];
        int v24 = 138543874;
        v25 = v10;
        __int16 v26 = 2114;
        id v27 = v11;
        __int16 v28 = 2112;
        v29 = v7;
        _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_INFO, "Added notification record to storage. Notification record source identifier = %{public}@, source client identifier = %{public}@, record = %@", (uint8_t *)&v24, 0x20u);
      }
    }
    else
    {
      v9 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CALNUNUserNotificationCenter addNotificationRequest:error:]();
      }
    }

    id v17 = [(CALNUNUserNotificationCenter *)self notificationRequestMapper];
    id v15 = [v17 unNotificationRequestFromCALNNotificationRequest:v6];

    v18 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v15 identifier];
      int v24 = 138543618;
      v25 = v19;
      __int16 v26 = 2112;
      id v27 = v15;
      _os_log_impl(&dword_2216BB000, v18, OS_LOG_TYPE_DEFAULT, "Adding unNotificationRequest with identifier = %{public}@, request = %@", (uint8_t *)&v24, 0x16u);
    }
    v20 = [(CALNUNUserNotificationCenter *)self userNotificationCenter];
    int v16 = [v20 addNotificationRequest:v15 error:a4];

    if (v16)
    {
      v21 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v15 identifier];
        int v24 = 138543362;
        v25 = v22;
        _os_log_impl(&dword_2216BB000, v21, OS_LOG_TYPE_DEFAULT, "Added unNotificationRequest with identifier = %{public}@", (uint8_t *)&v24, 0xCu);
      }
    }
  }
  else
  {
    id v12 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CALNUNUserNotificationCenter addNotificationRequest:error:]();
    }

    uint64_t v13 = *MEMORY[0x263F08338];
    v30[0] = *MEMORY[0x263F08320];
    v30[1] = v13;
    v31[0] = @"Could not add notification request.";
    v31[1] = @"User notification center is inactive.";
    v30[2] = *MEMORY[0x263F08348];
    v31[2] = @"Activate the user notification center before adding a notification request.";
    v7 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
    v14 = [MEMORY[0x263F087E8] errorWithDomain:@"CALNUNUserNotificationCenterErrorDomain" code:0 userInfo:v7];
    id v15 = v14;
    if (a4)
    {
      id v15 = v14;
      LOBYTE(v16) = 0;
      *a4 = v15;
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (id)deliveredNotifications
{
  v3 = [(CALNUNUserNotificationCenter *)self userNotificationCenter];
  v4 = [v3 deliveredNotifications];

  v5 = [(CALNUNUserNotificationCenter *)self notificationMapper];
  id v6 = [v5 calnNotificationsFromUNNotifications:v4];

  return v6;
}

- (id)notificationCategories
{
  v2 = [(CALNUNUserNotificationCenter *)self userNotificationCenter];
  v3 = [v2 notificationCategories];

  v4 = +[CALNUNNotificationCategoryMapper calnNotificationCategoriesFromUNNotificationCategories:v3];

  return v4;
}

- (void)removeAllDeliveredNotifications
{
  v3 = [(CALNUNUserNotificationCenter *)self storage];
  [v3 removeNotificationRecordsPassingTest:&__block_literal_global_5];

  id v4 = [(CALNUNUserNotificationCenter *)self userNotificationCenter];
  [v4 removeAllDeliveredNotifications];
}

uint64_t __63__CALNUNUserNotificationCenter_removeAllDeliveredNotifications__block_invoke()
{
  return 1;
}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(CALNUNUserNotificationCenter *)self storage];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__CALNUNUserNotificationCenter_removeDeliveredNotificationsWithIdentifiers___block_invoke;
  v8[3] = &unk_2645C0F08;
  id v9 = v4;
  id v6 = v4;
  [v5 removeNotificationRecordsPassingTest:v8];

  v7 = [(CALNUNUserNotificationCenter *)self userNotificationCenter];
  [v7 removeDeliveredNotificationsWithIdentifiers:v6];
}

uint64_t __76__CALNUNUserNotificationCenter_removeDeliveredNotificationsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [CALNNotificationIdentifier alloc];
  v5 = [v3 sourceIdentifier];
  id v6 = [v3 sourceClientIdentifier];

  v7 = [(CALNNotificationIdentifier *)v4 initWithSourceIdentifier:v5 sourceClientIdentifier:v6];
  if (v7)
  {
    v8 = [(CALNNotificationIdentifier *)v7 stringRepresentation];
    uint64_t v9 = [*(id *)(a1 + 32) containsObject:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)removeAllPendingNotificationRequests
{
  id v2 = [(CALNUNUserNotificationCenter *)self userNotificationCenter];
  [v2 removeAllPendingNotificationRequests];
}

- (BOOL)replaceNotificationRequest:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = +[CALNNotificationMapper notificationRecordFromNotificationRequest:v6];
  if (v7)
  {
    v8 = [(CALNUNUserNotificationCenter *)self _updatedRecord:v7];
    uint64_t v9 = [(CALNUNUserNotificationCenter *)self storage];
    [v9 addNotificationRecord:v8];

    id v10 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v8 sourceIdentifier];
      id v12 = [v8 sourceClientIdentifier];
      int v22 = 138543874;
      v23 = v11;
      __int16 v24 = 2114;
      v25 = v12;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_INFO, "Added updated notification record to storage. Notification record source identifier = %{public}@, source client identifier = %{public}@, record = %@", (uint8_t *)&v22, 0x20u);
    }
  }
  else
  {
    v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CALNUNUserNotificationCenter replaceNotificationRequest:error:](v6, v8);
    }
  }

  uint64_t v13 = [(CALNUNUserNotificationCenter *)self notificationContentMapper];
  v14 = [v6 content];
  id v15 = [v13 unNotificationContentFromCALNNotificationContent:v14];

  int v16 = [(CALNUNUserNotificationCenter *)self userNotificationCenter];
  id v17 = [v6 identifier];
  int v18 = [v16 replaceContentForRequestWithIdentifier:v17 replacementContent:v15 error:a4];

  if (v18)
  {
    v19 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [v6 identifier];
      int v22 = 138543618;
      v23 = v20;
      __int16 v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_2216BB000, v19, OS_LOG_TYPE_DEFAULT, "Replaced request with identifier = %{public}@, unNotificationContent = %@", (uint8_t *)&v22, 0x16u);
    }
  }

  return v18;
}

- (void)setNotificationCategories:(id)a3
{
  id v5 = +[CALNUNNotificationCategoryMapper unNotificationCategoriesFromCALNNotificationCategories:a3];
  id v4 = [(CALNUNUserNotificationCenter *)self userNotificationCenter];
  [v4 setNotificationCategories:v5];
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = (void (**)(id, void))a5;
  uint64_t v9 = [(CALNUNUserNotificationCenter *)self delegate];
  id v10 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v7 request];
    id v12 = [v11 identifier];
    *(_DWORD *)buf = 138543618;
    int v22 = v12;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Will present notification with identifier = %{public}@, notification = %@", buf, 0x16u);
  }
  if (!v9)
  {
    uint64_t v13 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CALNUNUserNotificationCenter userNotificationCenter:willPresentNotification:withCompletionHandler:]();
    }

    v8[2](v8, 0);
  }
  v14 = [(CALNUNUserNotificationCenter *)self notificationMapper];
  id v15 = [v14 calnNotificationFromUNNotification:v7];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __101__CALNUNUserNotificationCenter_userNotificationCenter_willPresentNotification_withCompletionHandler___block_invoke;
  v18[3] = &unk_2645C0F30;
  id v19 = v15;
  id v20 = v8;
  int v16 = v8;
  id v17 = v15;
  [v9 userNotificationCenter:self willPresentNotification:v17 withCompletionHandler:v18];
}

uint64_t __101__CALNUNUserNotificationCenter_userNotificationCenter_willPresentNotification_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v3 = +[CALNUNNotificationPresentationOptionsMapper unNotificationPresentationOptionsFromCALNNotificationPresentationOptions:a2];
  id v4 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [NSNumber numberWithUnsignedInteger:v3];
    id v6 = [*(id *)(a1 + 32) request];
    id v7 = [v6 identifier];
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Invoking callback with options = %{public}@, notification identifier = %{public}@", (uint8_t *)&v9, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = (void (**)(void))a5;
  int v9 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 notification];
    __int16 v11 = [v10 request];
    id v12 = [v11 identifier];
    int v17 = 138543618;
    int v18 = v12;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Did receive notification response. identifier = %{public}@, response = %@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v13 = [(CALNUNUserNotificationCenter *)self delegate];
  if (!v13)
  {
    v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CALNUNUserNotificationCenter userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]();
    }

    v8[2](v8);
  }
  id v15 = [(CALNUNUserNotificationCenter *)self notificationResponseMapper];
  int v16 = [v15 calnNotificationResponseFromUNNotificationResponse:v7];

  [v13 userNotificationCenter:self didReceiveNotificationResponse:v16 withCompletionHandler:v8];
}

- (id)_updatedRecord:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 content];
  id v5 = [v4 date];

  id v6 = [v3 date];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    if (v5)
    {
      id v8 = v6;
      if (([v5 isEqualToDate:v6] & 1) == 0)
      {
        id v8 = v5;
      }
    }
  }
  else
  {
    if (v5)
    {
      id v9 = v5;
    }
    else
    {
      id v9 = [MEMORY[0x263EFF910] date];
    }
    id v8 = v9;
  }
  id v10 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(CALNUNUserNotificationCenter *)v3 _updatedRecord:v10];
  }

  __int16 v11 = (void *)[v3 mutableCopy];
  [v11 setDate:v8];
  id v12 = (void *)[v11 copy];
  uint64_t v13 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v3 sourceIdentifier];
    id v15 = [v3 sourceClientIdentifier];
    int v16 = [v12 date];
    int v18 = 138544130;
    __int16 v19 = v14;
    __int16 v20 = 2114;
    uint64_t v21 = v15;
    __int16 v22 = 2114;
    __int16 v23 = v16;
    __int16 v24 = 2112;
    uint64_t v25 = v12;
    _os_log_impl(&dword_2216BB000, v13, OS_LOG_TYPE_DEFAULT, "Updated record. Source identifier = %{public}@, source client identifier = %{public}@, date = %{public}@, record = %@", (uint8_t *)&v18, 0x2Au);
  }
  return v12;
}

- (void)collectSettingsStats:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNUNUserNotificationCenter *)self userNotificationCenter];
  id v6 = [v5 notificationSettings];

  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "authorizationStatus"));
  [v4 setObject:v7 forKeyedSubscript:@"CalendarNotificationsAuthorization"];

  id v8 = [(CALNUNUserNotificationCenter *)self userNotificationCenter];
  id v9 = [v8 notificationSettingsForTopics];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__CALNUNUserNotificationCenter_collectSettingsStats___block_invoke;
  v11[3] = &unk_2645C0F58;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];
}

void __53__CALNUNUserNotificationCenter_collectSettingsStats___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_opt_class();
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "authorizationStatus"));
  [v7 _addSettingName:@"authorizationStatus" value:v8 toStatsPayload:*(void *)(a1 + 40) forTopicIdentifier:v6];

  id v9 = objc_opt_class();
  id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "soundSetting"));
  [v9 _addSettingName:@"soundSetting" value:v10 toStatsPayload:*(void *)(a1 + 40) forTopicIdentifier:v6];

  __int16 v11 = objc_opt_class();
  id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "badgeSetting"));
  [v11 _addSettingName:@"badgeSetting" value:v12 toStatsPayload:*(void *)(a1 + 40) forTopicIdentifier:v6];

  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "alertSetting"));
  [v13 _addSettingName:@"alertSetting" value:v14 toStatsPayload:*(void *)(a1 + 40) forTopicIdentifier:v6];

  id v15 = objc_opt_class();
  int v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "notificationCenterSetting"));
  [v15 _addSettingName:@"notificationCenterSetting" value:v16 toStatsPayload:*(void *)(a1 + 40) forTopicIdentifier:v6];

  int v17 = objc_opt_class();
  int v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "lockScreenSetting"));
  [v17 _addSettingName:@"lockScreenSetting" value:v18 toStatsPayload:*(void *)(a1 + 40) forTopicIdentifier:v6];

  __int16 v19 = objc_opt_class();
  __int16 v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "carPlaySetting"));
  [v19 _addSettingName:@"carPlaySetting" value:v20 toStatsPayload:*(void *)(a1 + 40) forTopicIdentifier:v6];

  uint64_t v21 = objc_opt_class();
  __int16 v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "alertStyle"));
  [v21 _addSettingName:@"alertStyle" value:v22 toStatsPayload:*(void *)(a1 + 40) forTopicIdentifier:v6];

  __int16 v23 = objc_opt_class();
  __int16 v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "showPreviewsSetting"));
  [v23 _addSettingName:@"showPreviewsSetting" value:v24 toStatsPayload:*(void *)(a1 + 40) forTopicIdentifier:v6];

  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "timeSensitiveSetting"));
  [v25 _addSettingName:@"timeSensitiveSetting" value:v26 toStatsPayload:*(void *)(a1 + 40) forTopicIdentifier:v6];

  id v27 = objc_opt_class();
  uint64_t v28 = NSNumber;
  uint64_t v29 = [v5 scheduledDeliverySetting];

  id v30 = [v28 numberWithInteger:v29];
  [v27 _addSettingName:@"scheduledDeliverySetting" value:v30 toStatsPayload:*(void *)(a1 + 40) forTopicIdentifier:v6];
}

+ (void)_addSettingName:(id)a3 value:(id)a4 toStatsPayload:(id)a5 forTopicIdentifier:(id)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = [a1 _statsPayloadKeyForSettingName:a3 topicIdentifier:a6];
  [v10 setObject:v11 forKeyedSubscript:v12];
}

+ (id)_statsPayloadKeyForSettingName:(id)a3 topicIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ([v5 hasPrefix:@"com.apple.mobilecal.bulletin-subsection."])
  {
    uint64_t v7 = [v5 substringFromIndex:objc_msgSend(@"com.apple.mobilecal.bulletin-subsection.", "length")];

    id v5 = (id)v7;
  }
  id v8 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_"];
  id v9 = [v8 invertedSet];

  id v10 = [v5 stringByReplacingCharactersInSet:v9 withString:@"_"];

  id v11 = [NSString stringWithFormat:@"notifications_%@_%@", v10, v6];

  return v11;
}

- (CALNUserNotificationCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CALNUserNotificationCenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CALNUNUserNotificationCenterProtocol)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (CALNNotificationStorage)storage
{
  return self->_storage;
}

- (CALNUNNotificationMapper)notificationMapper
{
  return self->_notificationMapper;
}

- (CALNUNNotificationRequestMapper)notificationRequestMapper
{
  return self->_notificationRequestMapper;
}

- (CALNUNNotificationContentMapper)notificationContentMapper
{
  return self->_notificationContentMapper;
}

- (CALNUNNotificationResponseMapper)notificationResponseMapper
{
  return self->_notificationResponseMapper;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationResponseMapper, 0);
  objc_storeStrong((id *)&self->_notificationContentMapper, 0);
  objc_storeStrong((id *)&self->_notificationRequestMapper, 0);
  objc_storeStrong((id *)&self->_notificationMapper, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)addNotificationRequest:error:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  v1 = [v0 identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_2216BB000, v2, v3, "Could not add notification record to storage since notification record is nil. Notification request identifier = %{public}@, request = %@", v4, v5, v6, v7, v8);
}

- (void)addNotificationRequest:error:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  v1 = [v0 identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_2216BB000, v2, v3, "Cannot add request to inactive user notification center. Request identifier = %{public}@, request = %@", v4, v5, v6, v7, v8);
}

- (void)replaceNotificationRequest:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Could not add updated notification record to storage since notification record is nil. Notification request identifier = %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)userNotificationCenter:willPresentNotification:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:0];
  uint64_t v3 = [v1 request];
  int v4 = [v3 identifier];
  int v5 = 138543874;
  uint64_t v6 = v2;
  __int16 v7 = 2114;
  uint8_t v8 = v4;
  __int16 v9 = 2112;
  id v10 = v1;
  _os_log_error_impl(&dword_2216BB000, v0, OS_LOG_TYPE_ERROR, "Delegate is unexpectedly nil. Invoking callback with options = %{public}@, notification identifier = %{public}@, notification = %@", (uint8_t *)&v5, 0x20u);
}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  v1 = [v0 notification];
  uint64_t v2 = [v1 request];
  uint64_t v3 = [v2 identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_2216BB000, v4, v5, "Delegate is unexpectedly nil. notification response identifier = %{public}@, response = %@", v6, v7, v8, v9, v10);
}

- (void)_updatedRecord:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 sourceIdentifier];
  uint64_t v7 = [a1 sourceClientIdentifier];
  int v8 = 138544130;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a2;
  __int16 v14 = 2112;
  id v15 = a1;
  _os_log_debug_impl(&dword_2216BB000, a3, OS_LOG_TYPE_DEBUG, "Updating record with date. Record source identifier = %{public}@, source client identifier = %{public}@, date = %{public}@, record = %@", (uint8_t *)&v8, 0x2Au);
}

@end