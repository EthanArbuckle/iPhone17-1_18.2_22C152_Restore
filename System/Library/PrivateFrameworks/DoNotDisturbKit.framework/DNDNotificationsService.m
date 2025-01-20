@interface DNDNotificationsService
- (DNDNotificationsService)initWithClientIdentifier:(id)a3;
- (id)_modeConfigurationForIdentifier:(id)a3;
- (id)_modeForIdentifier:(id)a3;
- (void)_setModeConfiguration:(id)a3;
- (void)activitySuggestionClient:(id)a3 didSuggestSettingUpActivity:(id)a4;
- (void)activitySuggestionClient:(id)a3 didSuggestTriggersForConfiguredActivity:(id)a4;
- (void)resume;
- (void)settingsService:(id)a3 didReceiveUpdatedBehaviorSettings:(id)a4;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation DNDNotificationsService

- (DNDNotificationsService)initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DNDNotificationsService;
  v5 = [(DNDNotificationsService *)&v20 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.donotdisturb.kit.NotificationsService", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263F3A6F0] serviceForClientIdentifier:v4];
    notificationsAssertionService = v5->_notificationsAssertionService;
    v5->_notificationsAssertionService = (DNDModeAssertionService *)v9;

    uint64_t v11 = [MEMORY[0x263F3A7B0] serviceForClientIdentifier:v4];
    notificationsStateService = v5->_notificationsStateService;
    v5->_notificationsStateService = (DNDStateService *)v11;

    uint64_t v13 = [MEMORY[0x263F3A7A8] serviceForClientIdentifier:v4];
    notificationsSettingsService = v5->_notificationsSettingsService;
    v5->_notificationsSettingsService = (DNDSettingsService *)v13;

    uint64_t v15 = [MEMORY[0x263F3A728] serviceForClientIdentifier:v4];
    notificationsModeConfigurationService = v5->_notificationsModeConfigurationService;
    v5->_notificationsModeConfigurationService = (DNDModeConfigurationService *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.donotdisturb"];
    notificationsCenter = v5->_notificationsCenter;
    v5->_notificationsCenter = (UNUserNotificationCenter *)v17;

    [(UNUserNotificationCenter *)v5->_notificationsCenter setDelegate:v5];
  }

  return v5;
}

- (void)resume
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__DNDNotificationsService_resume__block_invoke;
  block[3] = &unk_2644AF2B8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __33__DNDNotificationsService_resume__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) setWantsNotificationResponsesDelivered];
  uint64_t v2 = [MEMORY[0x263F24FE0] sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  [*(id *)(*(void *)(a1 + 32) + 96) registerObserver:*(void *)(a1 + 32) sendingInitialChangeNotification:1];
  [*(id *)(*(void *)(a1 + 32) + 24) addStateUpdateListener:*(void *)(a1 + 32) withCompletionHandler:0];
  *(void *)(*(void *)(a1 + 32) + 72) = [*(id *)(*(void *)(a1 + 32) + 24) queryCurrentStateWithError:0];
  return MEMORY[0x270F9A758]();
}

- (void)activitySuggestionClient:(id)a3 didSuggestSettingUpActivity:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__DNDNotificationsService_activitySuggestionClient_didSuggestSettingUpActivity___block_invoke;
  v8[3] = &unk_2644AF300;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __80__DNDNotificationsService_activitySuggestionClient_didSuggestSettingUpActivity___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 72) isActive];
  uint64_t v3 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v28 = 138543618;
    uint64_t v29 = v4;
    __int16 v30 = 1024;
    int v31 = v2;
    _os_log_impl(&dword_21E516000, v3, OS_LOG_TYPE_DEFAULT, "Did receive setup suggestion for activity; suggestion=%{public}@, focus=%{BOOL}d",
      (uint8_t *)&v28,
      0x12u);
  }
  if ((v2 & 1) == 0 && (id v5 = *(void **)(a1 + 40)) != 0 && ([v5 location] & 2) != 0)
  {
    id v7 = MEMORY[0x223C29E50]([*(id *)(a1 + 40) activityType]);
    uint64_t v8 = [v7 integerValue];

    id v9 = DNDModeSemanticTypeToString();
    v10 = [v9 uppercaseString];

    id v11 = objc_alloc_init(MEMORY[0x263F1DEF0]);
    [v11 setCategoryIdentifier:@"suggestion.setup"];
    [v11 setInterruptionLevel:0];
    v12 = NSString;
    uint64_t v13 = [@"NOTIFICATION_SUGGESTION_SETUP_TITLE_" stringByAppendingString:v10];
    v14 = [v12 localizedUserNotificationStringForKey:v13 arguments:0];
    [v11 setTitle:v14];

    uint64_t v15 = NSString;
    v16 = [@"NOTIFICATION_SUGGESTION_SETUP_BODY_" stringByAppendingString:v10];
    uint64_t v17 = [v15 localizedUserNotificationStringForKey:v16 arguments:0];
    [v11 setBody:v17];

    [v11 setShouldSuppressDefaultAction:1];
    [v11 setShouldDisplayActionsInline:1];
    v18 = (void *)MEMORY[0x263F1DF40];
    v19 = DNDSystemImageNameForModeSemanticType();
    objc_super v20 = [v18 iconForSystemImageNamed:v19];
    [v11 setIcon:v20];

    id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v22 = [NSNumber numberWithInteger:v8];
    [v21 setObject:v22 forKey:@"semanticType"];

    v23 = [*(id *)(a1 + 40) suggestionUUID];
    objc_msgSend(v21, "bs_setSafeObject:forKey:", v23, @"suggestionUUID");

    [v11 setUserInfo:v21];
    v24 = *(void **)(*(void *)(a1 + 32) + 96);
    v25 = [*(id *)(a1 + 40) suggestionUUID];
    [v24 didShowActivitySetUpSuggestionWithSuggestionUUID:v25 location:1];

    v26 = *(void **)(*(void *)(a1 + 32) + 88);
    v27 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"setup" content:v11 trigger:0];
    [v26 addNotificationRequest:v27 withCompletionHandler:&__block_literal_global_0];
  }
  else
  {
    v6 = DNDLogNotifications;
    if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 67109120;
      LODWORD(v29) = v2;
      _os_log_impl(&dword_21E516000, v6, OS_LOG_TYPE_DEFAULT, "Did not post suggestion notifiction; focus=%{BOOL}d",
        (uint8_t *)&v28,
        8u);
    }
  }
}

void __80__DNDNotificationsService_activitySuggestionClient_didSuggestSettingUpActivity___block_invoke_377(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_21E516000, v3, OS_LOG_TYPE_DEFAULT, "Notification posted: error=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)activitySuggestionClient:(id)a3 didSuggestTriggersForConfiguredActivity:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __92__DNDNotificationsService_activitySuggestionClient_didSuggestTriggersForConfiguredActivity___block_invoke;
  v8[3] = &unk_2644AF300;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __92__DNDNotificationsService_activitySuggestionClient_didSuggestTriggersForConfiguredActivity___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 72) isActive];
  uint64_t v3 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v4;
    __int16 v37 = 1024;
    int v38 = v2;
    _os_log_impl(&dword_21E516000, v3, OS_LOG_TYPE_DEFAULT, "Did receive triggers suggestion for activity; suggestion=%{public}@, focus=%{BOOL}d",
      buf,
      0x12u);
  }
  if ((v2 & 1) == 0)
  {
    uint64_t v6 = (void **)(a1 + 40);
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      if (([v5 location] & 2) != 0)
      {
        uint64_t v8 = *(void **)(a1 + 32);
        id v9 = [*(id *)(a1 + 40) uuidString];
        v10 = [v8 _modeForIdentifier:v9];

        if (!v10)
        {
          objc_super v20 = (void *)DNDLogNotifications;
          if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_ERROR)) {
            __92__DNDNotificationsService_activitySuggestionClient_didSuggestTriggersForConfiguredActivity___block_invoke_cold_1(v6, v20);
          }
          goto LABEL_17;
        }
        uint64_t v11 = [v10 semanticType];
        v12 = DNDModeSemanticTypeToString();
        uint64_t v13 = [v12 uppercaseString];

        id v14 = objc_alloc_init(MEMORY[0x263F1DEF0]);
        [v14 setCategoryIdentifier:@"suggestion.trigger"];
        [v14 setInterruptionLevel:1];
        if (v11)
        {
          if (v11 == -1)
          {
            uint64_t v15 = NSString;
            v16 = [@"NOTIFICATION_SUGGESTION_START_TITLE_" stringByAppendingString:v13];
            uint64_t v17 = [v10 name];
            v34 = v17;
            v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
            v19 = [v15 localizedUserNotificationStringForKey:v16 arguments:v18];
            [v14 setTitle:v19];

LABEL_16:
            v22 = [*(id *)(a1 + 40) localizedTriggerSuggestionText];
            [v14 setBody:v22];

            [v14 setShouldSuppressDefaultAction:1];
            [v14 setShouldDisplayActionsInline:1];
            v23 = (void *)MEMORY[0x263F1DF40];
            v24 = [v10 symbolImageName];
            v25 = [v23 iconForSystemImageNamed:v24];
            [v14 setIcon:v25];

            uint64_t v32 = @"suggestionUUID";
            v26 = [*(id *)(a1 + 40) suggestionUUID];
            v33 = v26;
            v27 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
            [v14 setUserInfo:v27];

            int v28 = *(void **)(*(void *)(a1 + 32) + 96);
            uint64_t v29 = [*(id *)(a1 + 40) suggestionUUID];
            [v28 didShowTriggerSuggestionWithSuggestionUUID:v29 location:1];

            __int16 v30 = *(void **)(*(void *)(a1 + 32) + 88);
            int v31 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"start" content:v14 trigger:0];
            [v30 addNotificationRequest:v31 withCompletionHandler:&__block_literal_global_389];

LABEL_17:
            return;
          }
        }
        else
        {

          uint64_t v13 = @"DEFAULT";
        }
        id v21 = NSString;
        v16 = [@"NOTIFICATION_SUGGESTION_START_TITLE_" stringByAppendingString:v13];
        uint64_t v17 = [v21 localizedUserNotificationStringForKey:v16 arguments:0];
        [v14 setTitle:v17];
        goto LABEL_16;
      }
    }
  }
  id v7 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = v2;
    _os_log_impl(&dword_21E516000, v7, OS_LOG_TYPE_DEFAULT, "Did not post suggestion notifiction; focus=%{BOOL}d",
      buf,
      8u);
  }
}

void __92__DNDNotificationsService_activitySuggestionClient_didSuggestTriggersForConfiguredActivity___block_invoke_387(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_21E516000, v3, OS_LOG_TYPE_DEFAULT, "Notification posted: error=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_21E516000, v6, OS_LOG_TYPE_DEFAULT, "Did receive state update; stateUpdate=%{public}@",
      buf,
      0xCu);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__DNDNotificationsService_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  v9[3] = &unk_2644AF300;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

void __74__DNDNotificationsService_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 40) state];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;
}

- (void)settingsService:(id)a3 didReceiveUpdatedBehaviorSettings:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_21E516000, v6, OS_LOG_TYPE_DEFAULT, "Did receive updated behavior settings; settings=%{public}@",
      buf,
      0xCu);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__DNDNotificationsService_settingsService_didReceiveUpdatedBehaviorSettings___block_invoke;
  v9[3] = &unk_2644AF300;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

uint64_t __77__DNDNotificationsService_settingsService_didReceiveUpdatedBehaviorSettings___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = [*(id *)(a1 + 40) copy];
  return MEMORY[0x270F9A758]();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  id v9 = [v7 actionIdentifier];
  id v10 = [v7 notification];
  uint64_t v11 = [v10 request];
  id v12 = [v11 content];
  uint64_t v13 = [v12 categoryIdentifier];

  id v14 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v62 = v13;
    __int16 v63 = 2114;
    v64 = v9;
    _os_log_impl(&dword_21E516000, v14, OS_LOG_TYPE_DEFAULT, "Did receive notification response; categoryIdentifier = %{public}@; actionIdentifier: %{public}@",
      buf,
      0x16u);
  }
  if (![v13 isEqualToString:@"suggestion.setup"]
    || ![v9 isEqualToString:@"suggestion.setup.accept"])
  {
    if ([v13 isEqualToString:@"suggestion.setup"]
      && (([v9 isEqualToString:@"suggestion.setup.decline"] & 1) != 0
       || [v9 isEqualToString:*MEMORY[0x263F1E0D0]]))
    {
      v25 = [v7 notification];
      v26 = [v25 request];
      v27 = [v26 content];
      id v23 = [v27 userInfo];

      int v28 = [v23 objectForKey:@"suggestionUUID"];
      uint64_t v29 = DNDLogNotifications;
      if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v28;
        _os_log_impl(&dword_21E516000, v29, OS_LOG_TYPE_DEFAULT, "Decline setup suggestion; suggestionUUID=%{public}@",
          buf,
          0xCu);
      }
      __int16 v30 = dispatch_get_global_queue(25, 0);
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_392;
      v53[3] = &unk_2644AF350;
      v53[4] = self;
      v54 = v28;
      v55 = v8;
      id v22 = v28;
      dispatch_async(v30, v53);

      v24 = v54;
      goto LABEL_25;
    }
    if ([v13 isEqualToString:@"suggestion.trigger"]
      && [v9 isEqualToString:@"suggestion.trigger.accept"])
    {
      int v31 = [v7 notification];
      uint64_t v32 = [v31 request];
      v33 = [v32 content];
      id v23 = [v33 userInfo];

      v34 = [v23 objectForKey:@"suggestionUUID"];
      v35 = DNDLogNotifications;
      if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v34;
        _os_log_impl(&dword_21E516000, v35, OS_LOG_TYPE_DEFAULT, "Accept start suggestion always; suggestionUUID=%{public}@",
          buf,
          0xCu);
      }
      uint64_t v36 = dispatch_get_global_queue(25, 0);
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_393;
      v50[3] = &unk_2644AF350;
      v50[4] = self;
      v51 = v34;
      v52 = v8;
      id v22 = v34;
      dispatch_async(v36, v50);

      v24 = v51;
      goto LABEL_25;
    }
    if ([v13 isEqualToString:@"suggestion.trigger"]
      && (([v9 isEqualToString:@"suggestion.trigger.decline"] & 1) != 0
       || [v9 isEqualToString:*MEMORY[0x263F1E0D0]]))
    {
      __int16 v37 = [v7 notification];
      int v38 = [v37 request];
      uint64_t v39 = [v38 content];
      id v23 = [v39 userInfo];

      v40 = [v23 objectForKey:@"suggestionUUID"];
      v41 = DNDLogNotifications;
      if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v40;
        _os_log_impl(&dword_21E516000, v41, OS_LOG_TYPE_DEFAULT, "Decline suggestion; suggestionUUID=%{public}@",
          buf,
          0xCu);
      }
      v42 = dispatch_get_global_queue(25, 0);
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_399;
      v47[3] = &unk_2644AF350;
      v47[4] = self;
      v48 = v40;
      v49 = v8;
      id v22 = v40;
      dispatch_async(v42, v47);

      v24 = v48;
      goto LABEL_25;
    }
    if (![v9 isEqualToString:@"stop"]) {
      goto LABEL_27;
    }
    notificationsAssertionService = self->_notificationsAssertionService;
    id v46 = 0;
    int v44 = [(DNDModeAssertionService *)notificationsAssertionService invalidateAllActiveModeAssertionsWithError:&v46];
    id v23 = v46;
    v45 = DNDLogNotifications;
    if (v44)
    {
      if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E516000, v45, OS_LOG_TYPE_DEFAULT, "Invalidated all assertions", buf, 2u);
        if (!v8) {
          goto LABEL_26;
        }
        goto LABEL_35;
      }
    }
    else if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_ERROR))
    {
      -[DNDNotificationsService userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]();
      if (!v8) {
        goto LABEL_26;
      }
      goto LABEL_35;
    }
    if (!v8) {
      goto LABEL_26;
    }
LABEL_35:
    v8[2](v8);
    goto LABEL_26;
  }
  uint64_t v15 = [v7 notification];
  v16 = [v15 request];
  uint64_t v17 = [v16 content];
  v18 = [v17 userInfo];

  v19 = [v18 objectForKey:@"suggestionUUID"];
  objc_super v20 = DNDLogNotifications;
  if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v62 = v19;
    _os_log_impl(&dword_21E516000, v20, OS_LOG_TYPE_DEFAULT, "Accept setup suggestion; suggestionUUID=%{public}@",
      buf,
      0xCu);
  }
  id v21 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  block[3] = &unk_2644AF328;
  v57 = v18;
  v58 = self;
  id v59 = v19;
  v60 = v8;
  id v22 = v19;
  id v23 = v18;
  dispatch_async(v21, block);

  v24 = v57;
LABEL_25:

LABEL_26:
LABEL_27:
}

void __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"semanticType"];
  uint64_t v3 = objc_msgSend(NSURL, "dnd_setupURLWithSemanticType:", objc_msgSend(v2, "integerValue"));
  int v4 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v5 = *MEMORY[0x263F3F608];
  v14[0] = *MEMORY[0x263F3F5E8];
  v14[1] = v5;
  v15[0] = MEMORY[0x263EFFA88];
  v15[1] = MEMORY[0x263EFFA88];
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  id v11 = 0;
  int v7 = [v4 openSensitiveURL:v3 withOptions:v6 error:&v11];
  id v8 = v11;

  id v9 = DNDLogNotifications;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v3;
      _os_log_impl(&dword_21E516000, v9, OS_LOG_TYPE_DEFAULT, "Launched URL %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_ERROR))
  {
    __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_cold_1();
  }
  [*(id *)(*(void *)(a1 + 40) + 96) userDidAcceptActivitySetUpSuggestionWithSuggestionUUID:*(void *)(a1 + 48) location:1];
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

uint64_t __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_392(void *a1)
{
  [*(id *)(a1[4] + 96) userDidRejectActivitySetUpSuggestionWithSuggestionUUID:a1[5] location:1];
  uint64_t result = a1[6];
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_393(void *a1)
{
  v1 = a1;
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1[4] + 96) suggestionWithUUID:a1[5]];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  int v7 = [v6 triggers];
  id v8 = [*(id *)(v1[4] + 96) triggersToDNDModeConfigurationTriggers:v7];
  if (v8)
  {
    id v9 = (void *)v1[4];
    uint64_t v10 = [v6 uuidString];
    id v11 = [v9 _modeConfigurationForIdentifier:v10];

    if (v11)
    {
      uint64_t v29 = v7;
      id v30 = v6;
      int v31 = v1;
      id v32 = v4;
      v27 = (void *)[v11 mutableCopy];
      int v28 = v11;
      id v12 = [v11 triggers];
      v35 = (void *)[v12 mutableCopy];

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id obj = v8;
      uint64_t v36 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v36)
      {
        uint64_t v34 = *(void *)v43;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v43 != v34) {
              objc_enumerationMutation(obj);
            }
            uint64_t v37 = v13;
            uint64_t v14 = *(void *)(*((void *)&v42 + 1) + 8 * v13);
            uint64_t v15 = [MEMORY[0x263EFF980] array];
            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            id v16 = v35;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v39;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v39 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v38 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v22 = (objc_class *)objc_opt_class();
                    id v23 = NSStringFromClass(v22);
                    int v24 = [&unk_26CF785A0 containsObject:v23];

                    if (v24) {
                      [v15 addObject:v21];
                    }
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v46 count:16];
              }
              while (v18);
            }

            [v16 removeObjectsInArray:v15];
            [v16 addObject:v14];

            uint64_t v13 = v37 + 1;
          }
          while (v37 + 1 != v36);
          uint64_t v36 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v36);
      }

      v25 = (void *)[v35 copy];
      [v27 setTriggers:v25];

      v1 = v31;
      [(id)v31[4] _setModeConfiguration:v27];

      id v4 = v32;
      int v7 = v29;
      id v6 = v30;
      id v11 = v28;
    }
    [*(id *)(v1[4] + 96) userDidAcceptTriggerSuggestionWithSuggestionUUID:v1[5] acceptedTriggers:v8 location:1];
  }
  uint64_t v26 = v1[6];
  if (v26) {
    (*(void (**)(void))(v26 + 16))();
  }
}

uint64_t __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_399(void *a1)
{
  [*(id *)(a1[4] + 96) userDidRejectTriggerSuggestionWithSuggestionUUID:a1[5] location:1];
  uint64_t result = a1[6];
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)_modeForIdentifier:(id)a3
{
  id v4 = a3;
  notificationsModeConfigurationService = self->_notificationsModeConfigurationService;
  id v12 = 0;
  id v6 = [(DNDModeConfigurationService *)notificationsModeConfigurationService availableModesReturningError:&v12];
  id v7 = v12;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_ERROR)) {
      -[DNDNotificationsService _modeForIdentifier:]();
    }
    id v8 = 0;
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46__DNDNotificationsService__modeForIdentifier___block_invoke;
    v10[3] = &unk_2644AF378;
    id v11 = v4;
    id v8 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);
  }
  return v8;
}

uint64_t __46__DNDNotificationsService__modeForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [v3 UUIDString];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (id)_modeConfigurationForIdentifier:(id)a3
{
  id v4 = a3;
  notificationsModeConfigurationService = self->_notificationsModeConfigurationService;
  id v13 = 0;
  id v6 = [(DNDModeConfigurationService *)notificationsModeConfigurationService modeConfigurationsReturningError:&v13];
  id v7 = v13;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_ERROR)) {
      -[DNDNotificationsService _modeConfigurationForIdentifier:]();
    }
    id v8 = 0;
  }
  else
  {
    id v9 = [v6 allValues];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__DNDNotificationsService__modeConfigurationForIdentifier___block_invoke;
    v11[3] = &unk_2644AF3A0;
    id v12 = v4;
    id v8 = objc_msgSend(v9, "bs_firstObjectPassingTest:", v11);
  }
  return v8;
}

uint64_t __59__DNDNotificationsService__modeConfigurationForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 mode];
  id v4 = [v3 identifier];
  uint64_t v5 = [v4 UUIDString];
  uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];

  return v6;
}

- (void)_setModeConfiguration:(id)a3
{
  notificationsModeConfigurationService = self->_notificationsModeConfigurationService;
  id v5 = 0;
  [(DNDModeConfigurationService *)notificationsModeConfigurationService setModeConfiguration:a3 error:&v5];
  id v4 = v5;
  if (v4 && os_log_type_enabled((os_log_t)DNDLogNotifications, OS_LOG_TYPE_ERROR)) {
    -[DNDNotificationsService _setModeConfiguration:]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySuggestionClient, 0);
  objc_storeStrong((id *)&self->_notificationsCenter, 0);
  objc_storeStrong((id *)&self->_currentBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_transitionDate, 0);
  objc_storeStrong((id *)&self->_notificationsModeConfigurationService, 0);
  objc_storeStrong((id *)&self->_notificationsSettingsService, 0);
  objc_storeStrong((id *)&self->_notificationsStateService, 0);
  objc_storeStrong((id *)&self->_notificationsAssertionService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __92__DNDNotificationsService_activitySuggestionClient_didSuggestTriggersForConfiguredActivity___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = a2;
  id v4 = [v2 uuidString];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21E516000, v3, OS_LOG_TYPE_ERROR, "Unable to fetch find mode for suggestion; identifier=: %@",
    v5,
    0xCu);
}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E516000, v0, v1, "Unable to invalidate all assertions; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __103__DNDNotificationsService_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21E516000, v1, OS_LOG_TYPE_ERROR, "Failed to launch URL %{public}@: %{public}@", v2, 0x16u);
}

- (void)_modeForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E516000, v0, v1, "Unable to fetch available modes: %@", v2, v3, v4, v5, v6);
}

- (void)_modeConfigurationForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E516000, v0, v1, "Unable to fetch mode configurations: %@", v2, v3, v4, v5, v6);
}

- (void)_setModeConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E516000, v0, v1, "Unable to set mode configuration: %@", v2, v3, v4, v5, v6);
}

@end