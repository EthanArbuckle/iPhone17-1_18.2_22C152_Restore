@interface LACUNManager
- (LACUNManager)initWithBundleIdentifier:(id)a3;
- (LACUNManager)initWithBundleIdentifier:(id)a3 categories:(id)a4;
- (LACUNManagerDelegate)delegate;
- (id)_makeNotificationRequestWithConfiguration:(id)a3;
- (void)cancelAllNotificationsWithCompletion:(id)a3;
- (void)cancelNotificationsWithIdentifiers:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5;
- (void)postNotification:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation LACUNManager

- (LACUNManager)initWithBundleIdentifier:(id)a3
{
  return [(LACUNManager *)self initWithBundleIdentifier:a3 categories:MEMORY[0x263EFFA68]];
}

- (LACUNManager)initWithBundleIdentifier:(id)a3 categories:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)LACUNManager;
  v8 = [(LACUNManager *)&v17 init];
  if (v8)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __52__LACUNManager_initWithBundleIdentifier_categories___block_invoke;
    v13[3] = &unk_2653B5D70;
    id v14 = v6;
    v9 = v8;
    v15 = v9;
    id v16 = v7;
    uint64_t v10 = __52__LACUNManager_initWithBundleIdentifier_categories___block_invoke((uint64_t)v13);
    notificationCenter = v9->_notificationCenter;
    v9->_notificationCenter = (UNUserNotificationCenter *)v10;
  }
  return v8;
}

id __52__LACUNManager_initWithBundleIdentifier_categories___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (getUNMutableNotificationContentClass()
    && getUNNotificationActionClass()
    && getUNNotificationCategoryClass()
    && getUNNotificationIconClass()
    && getUNNotificationRequestClass()
    && getUNTimeIntervalNotificationTriggerClass()
    && getUNUserNotificationCenterClass())
  {
    v2 = (void *)[objc_alloc((Class)getUNUserNotificationCenterClass()) initWithBundleIdentifier:*(void *)(a1 + 32)];
    [v2 setDelegate:*(void *)(a1 + 40)];
    v26 = v2;
    [v2 setWantsNotificationResponsesDelivered];
    v3 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v30)
    {
      uint64_t v28 = *(void *)v38;
      v29 = v3;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v38 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = v4;
          v5 = *(void **)(*((void *)&v37 + 1) + 8 * v4);
          id v6 = objc_opt_new();
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          v31 = v5;
          id v7 = [v5 actions];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v34 != v10) {
                  objc_enumerationMutation(v7);
                }
                v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                if ([v12 isTitleLocalized])
                {
                  v13 = [v12 title];
                }
                else
                {
                  id v14 = NSString;
                  v15 = [v12 title];
                  v13 = [v14 localizedUserNotificationStringForKey:v15 arguments:0];
                }
                if ([v12 isDestructive]) {
                  uint64_t v16 = 2;
                }
                else {
                  uint64_t v16 = 0;
                }
                id UNNotificationActionClass = getUNNotificationActionClass();
                v18 = [v12 identifier];
                v19 = [UNNotificationActionClass actionWithIdentifier:v18 title:v13 options:v16];

                [v6 addObject:v19];
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v9);
          }

          if ([v31 hiddenPreviewShowsTitle]) {
            uint64_t v20 = 4;
          }
          else {
            uint64_t v20 = 0;
          }
          id UNNotificationCategoryClass = getUNNotificationCategoryClass();
          v22 = [v31 identifier];
          v23 = [UNNotificationCategoryClass categoryWithIdentifier:v22 actions:v6 intentIdentifiers:MEMORY[0x263EFFA68] options:v20];

          v3 = v29;
          [v29 addObject:v23];

          uint64_t v4 = v32 + 1;
        }
        while (v32 + 1 != v30);
        uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v30);
    }

    v24 = v26;
    if ([v3 count]) {
      [v26 setNotificationCategories:v3];
    }
  }
  else
  {
    v24 = 0;
  }
  return v24;
}

- (void)postNotification:(id)a3 completion:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void))v7;
  if (self->_notificationCenter)
  {
    uint64_t v9 = [v6 identifier];

    if (v9)
    {
      notificationCenter = self->_notificationCenter;
      v11 = [v6 identifier];
      v21[0] = v11;
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
      [(UNUserNotificationCenter *)notificationCenter removePendingNotificationRequestsWithIdentifiers:v12];
    }
    v13 = [(LACUNManager *)self _makeNotificationRequestWithConfiguration:v6];
    [(UNUserNotificationCenter *)self->_notificationCenter addNotificationRequest:v13 withCompletionHandler:v8];
    id v14 = LACLogNotifications();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v13 content];
      uint64_t v16 = [v13 identifier];
      int v17 = 138412546;
      v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      _os_log_impl(&dword_254F14000, v14, OS_LOG_TYPE_DEFAULT, "Posted notification with content: (%@) identifier: %@)", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_9;
  }
  if (v7)
  {
    v13 = +[LACError errorWithCode:-1020 debugDescription:@"UNUserNotificationCenter instance is nil"];
    ((void (**)(void, void *))v8)[2](v8, v13);
LABEL_9:
  }
}

- (void)cancelNotificationsWithIdentifiers:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void (**)(void, void))v9;
  if (self->_notificationCenter)
  {
    v11 = LACLogNotifications();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_254F14000, v11, OS_LOG_TYPE_DEFAULT, "Cancelling notifications with identifiers: (%@)", (uint8_t *)&v13, 0xCu);
    }

    [(UNUserNotificationCenter *)self->_notificationCenter removePendingNotificationRequestsWithIdentifiers:v8];
    if (!a4) {
      [(UNUserNotificationCenter *)self->_notificationCenter removeDeliveredNotificationsWithIdentifiers:v8];
    }
    if (v10) {
      v10[2](v10, 0);
    }
  }
  else if (v9)
  {
    v12 = +[LACError errorWithCode:-1020 debugDescription:@"UNUserNotificationCenter instance is nil"];
    ((void (**)(void, void *))v10)[2](v10, v12);
  }
}

- (void)cancelAllNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  if (self->_notificationCenter)
  {
    id v6 = LACLogNotifications();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling all notifications", v8, 2u);
    }

    [(UNUserNotificationCenter *)self->_notificationCenter removeAllDeliveredNotifications];
    [(UNUserNotificationCenter *)self->_notificationCenter removeAllPendingNotificationRequests];
    if (v5) {
      v5[2](v5, 0);
    }
  }
  else if (v4)
  {
    id v7 = +[LACError errorWithCode:-1020 debugDescription:@"UNUserNotificationCenter instance is nil"];
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
}

- (id)_makeNotificationRequestWithConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)getUNMutableNotificationContentClass());
  [v3 withdrawInterval];
  if (v5 > 20.0)
  {
    id v6 = [MEMORY[0x263EFF910] now];
    [v3 withdrawInterval];
    id v7 = objc_msgSend(v6, "dateByAddingTimeInterval:");

    [v4 setExpirationDate:v7];
  }
  id v8 = [v3 systemIconName];

  if (v8)
  {
    id UNNotificationIconClass = getUNNotificationIconClass();
    uint64_t v10 = [v3 systemIconName];
    v11 = [UNNotificationIconClass iconForSystemImageNamed:v10];
    [v4 setIcon:v11];
  }
  if ([v3 isTitleLocalized])
  {
    v12 = [v3 title];
    [v4 setTitle:v12];
  }
  else
  {
    int v13 = NSString;
    v12 = [v3 title];
    id v14 = [v13 localizedUserNotificationStringForKey:v12 arguments:0];
    [v4 setTitle:v14];
  }
  if ([v3 isBodyLocalized])
  {
    uint64_t v15 = [v3 body];
    [v4 setBody:v15];
  }
  else
  {
    uint64_t v16 = NSString;
    uint64_t v15 = [v3 body];
    int v17 = [v16 localizedUserNotificationStringForKey:v15 arguments:0];
    [v4 setBody:v17];
  }
  if ([v3 isTimeSensitive])
  {
    [v4 setInterruptionLevel:2];
    [v4 setShouldIgnoreDoNotDisturb:1];
  }
  v18 = [v3 defaultActionURL];

  if (v18)
  {
    [v4 setHasDefaultAction:1];
    __int16 v19 = [v3 defaultActionURL];
    [v4 setDefaultActionURL:v19];

    [v4 setShouldBackgroundDefaultAction:1];
  }
  else
  {
    [v4 setShouldSuppressDefaultAction:1];
  }
  if ([v3 shouldDisplayActionsInline]) {
    [v4 setShouldDisplayActionsInline:1];
  }
  uint64_t v20 = [v3 categoryIdentifier];

  if (v20)
  {
    v21 = [v3 categoryIdentifier];
    [v4 setCategoryIdentifier:v21];
  }
  [v3 triggerInterval];
  if (v22 <= 0.0)
  {
    v24 = 0;
  }
  else
  {
    id UNTimeIntervalNotificationTriggerClass = getUNTimeIntervalNotificationTriggerClass();
    [v3 triggerInterval];
    v24 = objc_msgSend(UNTimeIntervalNotificationTriggerClass, "triggerWithTimeInterval:repeats:", 0);
  }
  id UNNotificationRequestClass = getUNNotificationRequestClass();
  v26 = [v3 identifier];
  v27 = [UNNotificationRequestClass requestWithIdentifier:v26 content:v4 trigger:v24];

  return v27;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  id v9 = [v7 notification];
  uint64_t v10 = [v9 request];
  v11 = [v10 identifier];

  v12 = [v7 notification];
  int v13 = [v12 request];
  id v14 = [v13 content];
  uint64_t v15 = [v14 categoryIdentifier];

  uint64_t v16 = [v7 actionIdentifier];
  int v17 = LACLogNotifications();
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_16;
  }
  v34[0] = @"identifier";
  uint64_t v18 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v18 = [MEMORY[0x263EFF9D0] null];
  }
  uint64_t v30 = (void *)v18;
  v35[0] = v18;
  v34[1] = @"category";
  uint64_t v19 = (uint64_t)v15;
  if (!v15)
  {
    uint64_t v19 = [MEMORY[0x263EFF9D0] null];
  }
  uint64_t v32 = self;
  v29 = (void *)v19;
  v35[1] = v19;
  v34[2] = @"action";
  uint64_t v20 = (uint64_t)v16;
  if (!v16)
  {
    uint64_t v20 = [MEMORY[0x263EFF9D0] null];
  }
  long long v33 = v8;
  v35[2] = v20;
  v34[3] = @"url";
  v31 = objc_msgSend(v7, "notification", v20);
  v21 = [v31 request];
  double v22 = [v21 content];
  v23 = [v22 defaultActionURL];
  v24 = v23;
  if (!v23)
  {
    v24 = [MEMORY[0x263EFF9D0] null];
  }
  v35[3] = v24;
  v25 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
  *(_DWORD *)buf = 138543362;
  long long v37 = v25;
  _os_log_impl(&dword_254F14000, v17, OS_LOG_TYPE_DEFAULT, "Did receive response for notification %{public}@", buf, 0xCu);

  if (!v23) {
  id v8 = v33;
  }
  if (!v16) {

  }
  self = v32;
  if (v15)
  {
    if (v11) {
      goto LABEL_16;
    }
  }
  else
  {

    if (v11) {
      goto LABEL_16;
    }
  }

LABEL_16:
  v26 = [(LACUNManager *)self delegate];

  if (v26)
  {
    v27 = [(LACUNManager *)self delegate];
    [v27 notificationManager:self didRespondToNotification:v11 fromCategory:v15 withAction:v16 completionHandler:v8];
  }
  else
  {
    v8[2](v8);
  }
}

- (LACUNManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (LACUNManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end